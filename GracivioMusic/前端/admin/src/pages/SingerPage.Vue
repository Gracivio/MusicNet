<template>
    <div class="table">
        <div class="container">
            <div class="handle-box">
                <el-input v-model="select_word" size="mini" placeholder="请输入您想要查询的歌手名称" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="centerDialogVisible = true" style="background-color: #b8c0b0" class="add-singer-btn">添加歌手</el-button>
                <el-button type="primary" size="mini" @click="delAll" style="background-color: #b8c0b0" class="delete-singer-btn">批量删除</el-button>
            </div>
        </div>
        <el-table size="mini" border style="width:100%" height="650px" :data="data" @selection-change="handleSelectionChange">
            <el-table-column label="多选框" type="selection" width="60px"></el-table-column>
            <el-table-column label="歌手图片" width="150px" height="300px" align="center">
                <template slot-scope="scope">
                    <div class="singer-img">
                        <img :src="getUrl(scope.row.pic)" style="width:100%">
                    </div>
                    <el-upload :action="uploadUrl(scope.row.id)" :on-success="handelAvatorSuccess" :before-upload="beforeAvatorUpload">
                        <el-button size="mini">更新</el-button>
                    </el-upload>
                </template>
            </el-table-column>
            <el-table-column prop="name" label="歌手名称" width="120" align="center" class="singerName"></el-table-column> 
            <el-table-column label="性别" width="120" align="center">
                <template slot-scope="scope">
                    {{ changeSex(scope.row.sex) }}
                </template>
            </el-table-column>
            <el-table-column prop="birthday" label="出生日期" width="120" align="center">
                <template slot-scope="scope">
                    {{ scope.row.birthday | formatDate }}
                </template>
            </el-table-column>
            <el-table-column prop="introduction" label="简介" class="intro">
                <template slot-scope="scope">
                    <p class="intro-content">
                        {{ scope.row.introduction }}
                    </p>
                </template>
            </el-table-column>
            <el-table-column label="歌曲管理" width="110" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" @click="songEdit(scope.row.id,scope.row.name)">歌曲管理</el-button>
                </template>
            </el-table-column>
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
        <el-dialog title="添加歌手" :visible.sync="centerDialogVisible" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="80px">
                <el-form-item prop="name" label="歌手名" size="mini">
                    <el-input v-model="registerForm.name" placeholder="歌手名"></el-input>
                </el-form-item>
                <el-form-item label="性别" size="mini">
                    <el-radio-group v-model="registerForm.sex">
                        <el-radio :label="0">女</el-radio>
                        <el-radio :label="1">男</el-radio>
                        <el-radio :label="2">组合</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item prop="birthday" label="生日" size="mini">
                    <el-date-picker type="date" placeholder="选择日期" v-model="registerForm.birthday" style="width: 100%;"></el-date-picker>
                </el-form-item>
                <el-form-item prop="location" label="地区" size="mini">
                    <el-input v-model="registerForm.location" placeholder="地区"></el-input>
                </el-form-item>
                <el-form-item prop="introduction" label="简介" size="mini">
                    <el-input v-model="registerForm.introduction" placeholder="简介" type="textarea"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="addSinger">确定</el-button>
            </span>
        </el-dialog>

        <el-dialog title="编辑歌手" :visible.sync="editVisible" width="400px" center>
            <el-form :model="editForm" ref="editForm" label-width="80px">
                <el-form-item prop="name" label="歌手名" size="mini">
                    <el-input v-model="editForm.name" placeholder="歌手名"></el-input>
                </el-form-item>
                <el-form-item label="性别" size="mini">
                    <el-radio-group v-model="editForm.sex">
                        <el-radio :label="0">女</el-radio>
                        <el-radio :label="1">男</el-radio>
                        <el-radio :label="2">组合</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item  label="生日" size="mini">
                    <el-date-picker type="date" placeholder="选择日期" v-model="editForm.birthday" style="width: 100%;"></el-date-picker>
                </el-form-item>
                <el-form-item prop="location" label="地区" size="mini">
                    <el-input v-model="editForm.location" placeholder="地区"></el-input>
                </el-form-item>
                <el-form-item prop="introduction" label="简介" size="mini">
                    <el-input v-model="editForm.introduction" placeholder="简介" type="textarea"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="editVisible = false">取消</el-button>
                <el-button size="mini" @click="editSave">确定</el-button>
            </span>
        </el-dialog>

        <el-dialog title="删除歌手" :visible.sync="deleteVisible" width="300px" center>
            <el-form :model="editForm" ref="editForm" label-width="80px">
            <div align="center">删除后不可恢复！是否确定删除？</div>
        </el-form>
            <span slot="footer">
                <el-button size="mini" @click="editVisible = false">取消</el-button>
                <el-button size="mini" @click="deleteRow">确定</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script>
import {mixin} from "../mixins/index";
import {setSinger,getAllSinger,update,deleteSinger,handleSelectionChange,delAll} from '../api/index';
export default{
    mixins:[mixin],
    data(){
        return{
            centerDialogVisible: false,
            editVisible: false,
            deleteVisible: false,
            registerForm:{
                name:'',
                sex:'',
                birthday:'',
                location:'',
                introduction:''
            },
            editForm:{
                id:'',
                name:'',
                sex:'',
                birthday:'',
                location:'',
                introduction:''
            },
            tableData: [],
            tempData: [],
            select_word: '',
            pageSize: 4,
            currentPage: 1,
            id_choose: 0,
            multipleSelection: []
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
            getAllSinger().then(res => {
                this.tableData = res;
                this.tempData = res;
                this.currentPage = 1;
            })
        },
        addSinger(){
            let d = this.registerForm.birthday;
            let datetime = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
            let params = new URLSearchParams();
            params.append('username',this.registerForm.name);
            params.append('sex',this.registerForm.sex);
            params.append('pic','/img/SingerPic/xzq.png');
            params.append('birthday',datetime);
            params.append('location',this.registerForm.location);
            params.append('introduction',this.registerForm.introduction);
            
            setSinger(params).then((res) => {
                if(res.code==1){this.getData();this.notify("添加成功","succss");}
                else{this.notify("添加失败","error");}
            })
            .catch((err) => {
                console.log(err);
            });
            this.centerDialogVisible=false;
        },
        uploadUrl(id){
            return `${this.$store.state.HOST}/singer/updatePic?id=${id}`
        },
        handleCurrentChange(val){
            this.currentPage = val;
        },
        handleEdit(row){
            this.editVisible=true;
            this.editForm={
                id: row.id,
                name: row.name,
                sex: row.sex,
                birthday: row.birthday,
                location: row.location,
                introduction: row.introduction
            }
        },
        editSave(){
            let d = new Date(this.editForm.birthday);
            let datetime = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
            let params = new URLSearchParams();
            params.append('id',this.editForm.id);
            params.append('username',this.editForm.name);
            params.append('sex',this.editForm.sex);
            params.append('birthday',datetime);
            params.append('location',this.editForm.location);
            params.append('introduction',this.editForm.introduction);
            
            update(params).then((res) => {
                if(res.code==1){this.getData();this.notify("修改成功","succss");}
                else{this.notify("修改失败","error");}
            })
            .catch((err) => {
                console.log(err);
            });
            this.editVisible=false;
        },
        deleteRow(){
            deleteSinger(this.id_choose).then((res) => {
                if(res){this.getData();this.notify("删除成功","succss");}
                else{this.notify("删除失败","error");}
            })
            .catch((err) => {
                console.log(err);
            });
            this.deleteVisible=false;
        },
        //转向歌曲管理页面
        songEdit(id,name){
            this.$router.push({path:`/Song`,query:{id,name}});
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