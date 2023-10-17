<template>
    <div class="table">
        <div class="container">
            <div class="handle-box">
                <el-input v-model="select_word" size="mini" placeholder="筛选相关用户" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="centerDialogVisible = true" style="background-color: #b8c0b0" class="add-singer-btn">添加用户</el-button>
                <el-button type="primary" size="mini" @click="delAll" style="background-color: #b8c0b0" class="delete-singer-btn">批量删除</el-button>
            </div>
        </div>
        <el-table size="mini" border style="width:100%" height="650px" :data="data" @selection-change="handleSelectionChange">
            <el-table-column label="多选框" type="selection" width="60px"></el-table-column>
            <el-table-column label="用户头像" width="150px" height="300px" align="center">
                <template slot-scope="scope">
                    <div class="singer-img">
                        <img :src="getUrl(scope.row.avator)" style="width:100%">
                    </div>
                    <el-upload :action="uploadUrl(scope.row.id)" :on-success="handelAvatorSuccess" :before-upload="beforeAvatorUpload">
                        <el-button size="mini">更新</el-button>
                    </el-upload>
                </template>
            </el-table-column>
            <el-table-column prop="username" label="昵称" width="120" align="center" class="singerName"></el-table-column> 
            <el-table-column label="性别" width="120" align="center">
                <template slot-scope="scope">
                    {{ changeSex(scope.row.sex) }}
                </template>
            </el-table-column>
            <el-table-column prop="phoneNum" label="手机号码" width="110" align="center" class="singerName"></el-table-column>
            <el-table-column prop="email" label="电子邮箱" width="180" align="center" class="singerName"></el-table-column>
            <el-table-column label="生日" width="120" align="center">
                <template slot-scope="scope">
                    {{ scope.row.birthday | formatDate }}
                </template>
            </el-table-column>
            <el-table-column prop="name" label="签名"  align="center">
                <template slot-scope="scope">
                    <p class="intro-content">
                        {{ scope.row.introduction }}
                    </p>
                </template>
            </el-table-column>
            <el-table-column prop="location" label="地区" width="120" align="center" class="singerName"></el-table-column>
            <el-table-column label="操作" width="150" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" @click="handleEdit(scope.row)">编辑</el-button>
                    <el-button size="mini" type="danger" @click="handleDelete(scope.row.id)">删除</el-button> 
                </template>
            </el-table-column>
        </el-table>
        <div class="pageNav">
            <el-pagination 
                background
                Layout="total,prev,pager,next"
                :current-page="currentPage"
                :page-size="pageSize"
                :total="tableData.length"
                @current-change="handleCurrentChange"
                >
            </el-pagination>
        </div>
        <el-dialog title="添加用户" :visible.sync="centerDialogVisible" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="80px" :rules="rules">
                <el-form-item prop="username" label="用户名" size="mini">
                    <el-input v-model="registerForm.username" placeholder="用户名"></el-input>
                </el-form-item>
                <el-form-item prop="password" label="密码" size="mini">
                    <el-input type="password" v-model="registerForm.password" placeholder="密码"></el-input>
                </el-form-item>
                <el-form-item label="性别" size="mini">
                    <input type="radio" name="sex" value="0" v-model="registerForm.sex">&nbsp;女&nbsp;&nbsp;
                    <input type="radio" name="sex" value="1" v-model="registerForm.sex">&nbsp;男
                </el-form-item>
                <el-form-item prop="phoneNum" label="手机号" size="mini">
                    <el-input v-model="registerForm.phoneNum" placeholder="手机号"></el-input>
                </el-form-item>
                <el-form-item prop="email" label="电子邮箱" size="mini">
                    <el-input v-model="registerForm.email" placeholder="电子邮箱"></el-input>
                </el-form-item>
                <el-form-item prop="birthday" label="生日" size="mini">
                    <el-date-picker type="date" placeholder="选择日期" v-model="registerForm.birthday" style="width:100%"></el-date-picker>
                </el-form-item>
                <el-form-item prop="introduction" label="签名" size="mini">
                    <el-input v-model="registerForm.introduction" placeholder="签名"></el-input>
                </el-form-item>      
                <el-form-item prop="location" label="地区" size="mini">
                    <el-input v-model="registerForm.location" placeholder="地区"></el-input>
                </el-form-item>          
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="addConsumer">确定</el-button>                
            </span>
        </el-dialog>

        <el-dialog title="修改用户" :visible.sync="editVisible" width="400px" center>
            <el-form :model="form" ref="form" label-width="80px" :rules="rules">
                <el-form-item prop="username" label="用户名" size="mini">
                    <el-input v-model="form.username" placeholder="用户名"></el-input>
                </el-form-item>
                <el-form-item prop="password" label="密码" size="mini">
                    <el-input type="password" v-model="form.password" placeholder="密码"></el-input>
                </el-form-item>
                <el-form-item label="性别" size="mini">
                    <input type="radio" name="sex" value="0" v-model="form.sex">&nbsp;女&nbsp;&nbsp;
                    <input type="radio" name="sex" value="1" v-model="form.sex">&nbsp;男
                </el-form-item>
                <el-form-item prop="phoneNum" label="手机号" size="mini">
                    <el-input v-model="form.phoneNum" placeholder="手机号"></el-input>
                </el-form-item>
                <el-form-item prop="email" label="电子邮箱" size="mini">
                    <el-input v-model="form.email" placeholder="电子邮箱"></el-input>
                </el-form-item>
                <el-form-item prop="birthday" label="生日" size="mini">
                    <el-date-picker type="date" placeholder="选择日期" v-model="form.birthday" style="width:100%"></el-date-picker>
                </el-form-item>
                <el-form-item prop="introduction" label="签名" size="mini">
                    <el-input v-model="form.introduction" placeholder="签名"></el-input>
                </el-form-item>      
                <el-form-item prop="location" label="地区" size="mini">
                    <el-input v-model="form.location" placeholder="地区"></el-input>
                </el-form-item> 
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="editVisible = false">取消</el-button>
                <el-button size="mini" @click="editSave">确定</el-button>                
            </span>
        </el-dialog>

        <el-dialog title="删除用户" :visible.sync="deleteVisible" width="300px" center>
            <div align="center">删除不可恢复，是否确定删除？</div>
            <span slot="footer">
                <el-button size="mini" @click="deleteVisible = false">取消</el-button>
                <el-button size="mini" @click="deleteRow">确定</el-button>                
            </span>
        </el-dialog>
    </div>
</template>

<script>
import {getAllConsumer,setConsumer,updateConsumer,delConsumer} from '../api/index';
import { mixin } from '../mixins/index';
export default{
    mixins:[mixin],
    data(){
        return{
            centerDialogVisible: false,
            editVisible: false,
            deleteVisible: false,
            registerForm:{      //添加框
                username: '',
                password: '',
                sex: '',
                phoneNum: '',
                email: '',
                birthday: '',
                introduction: '',
                location: ''
            },
            form:{      //编辑框
                id: '',
                username: '',
                password: '',
                sex: '',
                phoneNum: '',
                email: '',
                birthday: '',
                introduction: '',
                location: ''
            },
            tableData: [],
            tempData: [],
            select_word: '',
            pageSize: 4,
            currentPage: 1,
            id_choose: 0,
            multipleSelection: [],
            rules: {
                username: [
                    {required: true,message: '请输入用户名',trigger: 'blur'}
                ],
                password: [
                    {required: true,message: '请输入密码',trigger: 'blur'}
                ],
                phoneNum: [
                    {required: true,message: '请输入手机号',trigger: 'blur'}
                ],
                email: [
                    {required: true,message: '请输入电子邮箱',trigger: 'blur'},
                    {type: 'email',message:'请输入正确的电子邮箱地址',trigger:['blur','change']}
                ],
                introduction: [
                    {required: true,message: '请输入签名',trigger: 'blur'}
                ],
                location: [
                    {required: true,message: '请输入地区',trigger: 'blur'}
                ]                
            }
        }
    },
    computed:{
        data(){
            //计算当前搜索结果表里的数据
            return this.tableData.slice((this.currentPage-1)*this.pageSize,this.currentPage*this.pageSize)
        }
    },
    watch:{
        select_word: function(){
            if(this.select_word == ''){
                this.tableData = this.tempData;
            }else{
                this.tableData = [];
                for(let item of this.tempData){
                    if(item.name.includes(this.select_word)){
                        this.tableData.push(item);
                    }
                }
            }
        }
    },
    created(){
        this.getData();
    },
    filters: {
        formatDate(value) {
            const date = new Date(value);
            return date.toLocaleDateString();
        }
    },
    methods:{
        getData(){
            this.tempData = [];
            this.tableData = [];
            getAllConsumer().then(res => {
                this.tableData = res;
                this.tempData = res;
                this.currentPage = 1;
            })
        },
        addConsumer(){
            this.$refs['registerForm'].validate(valid =>{
                if(valid){
                    let d = new Date(this.registerForm.birthday);
                    let datetime = d.getFullYear()+'-'+(d.getMonth()+1)+'-'+d.getDate();
                    let params = new URLSearchParams();
                    params.append('username',this.registerForm.username);
                    params.append('password',this.registerForm.password);
                    params.append('sex',this.registerForm.sex);
                    params.append('phoneNum',this.registerForm.phoneNum);            
                    params.append('email',this.registerForm.email);
                    params.append('birthday',datetime);
                    params.append('introduction',this.registerForm.introduction);
                    params.append('location',this.registerForm.location);
                    params.append('avator','/img/SingerPic/xzq.png');
                    setConsumer(params)
                    .then(res => {
                        if(res.code == 1){
                            this.getData();
                            this.notify("添加成功","success");
                        }else{
                            this.notify("添加失败","error");
                        }
                    })
                    .catch(err => {
                        console.log(err);
                    });
                    this.centerDialogVisible = false;
                }
            })
            
        },
        uploadUrl(id){
            return `${this.$store.state.HOST}/client/updatePic?id=${id}`
        },
        handleCurrentChange(val){
            this.currentPage = val;
        },
        handleEdit(row){
            this.editVisible = true;
            this.form = {
                id: row.id,
                username: row.username,
                password: row.password,
                sex: row.sex,
                phoneNum: row.phoneNum,
                email: row.email,
                birthday: row.birthday,
                introduction: row.introduction,
                location: row.location
            }
        },
        editSave(){
            this.$refs['form'].validate(valid =>{
                if(valid){
                    let d = new Date(this.form.birthday);
                    let datetime = d.getFullYear()+'-'+(d.getMonth()+1)+'-'+d.getDate();
                    let params = new URLSearchParams();
                    params.append('id',this.form.id);
                    params.append('username',this.form.username);
                    params.append('password',this.form.password);
                    params.append('sex',this.form.sex);
                    params.append('phoneNum',this.form.phoneNum);
                    params.append('email',this.form.email);
                    params.append('birthday',datetime);
                    params.append('introduction',this.form.introduction);
                    params.append('location',this.form.location);

                    updateConsumer(params)
                    .then(res => {
                        if(res.code == 1){
                            this.getData();
                            this.notify("修改成功","success");
                        }else{
                            this.notify("修改失败","error");
                        }
                    })
                    .catch(err => {
                        console.log(err);
                    });
                    this.editVisible = false;
                }
            })
        },
        deleteRow(){
            delConsumer(this.id_choose).then((res) => {
                if(res){this.getData();this.notify("删除成功","succss");}
                else{this.notify("删除失败","error");}
            })
            .catch((err) => {
                console.log(err);
            });
            this.deleteVisible=false;
        },
        //转向该用户的收藏列表
        getCollect(id){
            this.$router.push({path: '/collect',query:{id}})
        }
    }
}
</script>

<style scoped>
.handle-box{
    margin-bottom: 20px;
    display: flex;
    align-items: center;
}
.singer-img{
    width: 120px;
    height: 105px;
    border-radius: 10px;
    margin-bottom: 5px;
    overflow: hidden;
}

.add-singer-btn {
    font-size: 16px;
    display: inline-block;
    margin-left: 30px;
}

.delete-singer-btn{
    font-size: 16px;
    display: inline-block;
    margin-left: 30px
}

.container{
    background-color: #c8e6c9;
}
.singerName{
    font-size: 25px;
}

.intro {
  overflow: hidden;
}

.intro-content {
  height: 100px;
  overflow: scroll;
  text-align: center;
  display: flex;
  align-items: center;
  justify-content: center;
}

.intro-content::-webkit-scrollbar{
    width:0
}

.handle-input{
    width: 230px;
    height: 40px;
    font-size: 15px;
    display: block;
    margin-top: 15px;
}

.pageNav{
    display: flex;
    justify-content: center;
}
</style>