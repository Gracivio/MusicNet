<template>
    <div class="table">
        <div class="container">
            <div class="handle-box">
                <el-input v-model="select_word" size="mini" placeholder="筛选歌单关键字" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="centerDialogVisible = true" style="background-color: #b8c0b0" class="add-SongList-btn">添加歌单</el-button>
                <el-button type="primary" size="mini" @click="delAll" style="background-color: #b8c0b0" class="delete-SongList-btn">批量删除</el-button>
            </div>
        </div>
        <el-table size="mini" border style="width:100%" height="660px" :data="data" @selection-change="handleSelectionChange">
            <el-table-column label="多选框" type="selection" width="60px"></el-table-column>
            <el-table-column label="歌单图片" width="150px" height="240px" align="center">
                <template slot-scope="scope">
                    <div class="SongList-img">
                        <img :src="getUrl(scope.row.pic)" style="width:100%">
                    </div>
                    <el-upload :action="uploadUrl(scope.row.id)" :on-success="handelAvatorSuccess" :before-upload="beforeAvatorUpload">
                        <el-button size="mini">更新</el-button>
                    </el-upload>
                </template>
            </el-table-column>
            <el-table-column prop="title" label="标题" width="120" align="center" class="SongListName"></el-table-column> 
            <el-table-column prop="style" label="类型" width="120" align="center" class="SongListName"></el-table-column>
            <el-table-column prop="introduction" label="简介" class="intro">
                <template slot-scope="scope">
                    <p class="intro-content">
                        {{ scope.row.introduction }}
                    </p>
                </template>
            </el-table-column>
            <el-table-column label="歌曲管理" width="110" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" @click="songEdit(scope.row.id)">歌曲管理</el-button>
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
        <el-dialog title="添加歌单" :visible.sync="centerDialogVisible" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="80px">
                <el-form-item prop="title" label="标题" size="mini">
                    <el-input v-model="registerForm.title" placeholder="歌单名"></el-input>
                </el-form-item>
                <el-form-item prop="style" label="类型" size="mini">
                    <el-input v-model="registerForm.style" placeholder="类型"></el-input>
                </el-form-item>
                <el-form-item prop="introduction" label="简介" size="mini">
                    <el-input v-model="registerForm.introduction" placeholder="简介" type="textarea"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="addSongList">确定</el-button>
            </span>
        </el-dialog>

        <el-dialog title="编辑歌单" :visible.sync="editVisible" width="400px" center>
            <el-form :model="editForm" ref="editForm" label-width="80px">
                <el-form-item prop="title" label="标题" size="mini">
                    <el-input v-model="editForm.title" placeholder="标题"></el-input>
                </el-form-item>
                <el-form-item prop="style" label="风格" size="mini">
                    <el-input v-model="editForm.style" placeholder="风格"></el-input>
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

        <el-dialog title="删除歌单" :visible.sync="deleteVisible" width="300px" center>
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
import {getAllSongList,setSongList,updateSongList,deleteSongList} from '../api/index';
export default{
    mixins:[mixin],
    data(){
        return{
            centerDialogVisible: false,
            editVisible: false,
            deleteVisible: false,
            registerForm:{
                title: '',
                introduction: '',
                style: ''
            },
            editForm:{
                id: '',
                title: '',
                introduction: '',
                style: ''
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
            getAllSongList().then(res => {
                this.tableData = res;
                this.tempData = res;
                this.currentPage = 1;
            })
        },
        addSongList(){
            let params = new URLSearchParams();
            params.append('title',this.registerForm.title);
            params.append('pic','/img/SingerPic/xzq.png');
            params.append('introduction',this.registerForm.introduction);
            params.append('style',this.registerForm.style);
            
            setSongList(params).then((res) => {
                if(res.code==1){this.getData();this.notify("添加成功","succss");}
                else{this.notify("添加失败","error");}
            })
            .catch((err) => {
                console.log(err);
            });
            this.centerDialogVisible=false;
        },
        uploadUrl(id){
            return `${this.$store.state.HOST}/SongList/updatePic?id=${id}`
        },
        handleCurrentChange(val){
            this.currentPage = val;
        },
        handleEdit(row){
            this.editVisible=true;
            this.editForm={
                id: row.id,
                title: row.title,
                introduction: row.introduction,
                style: row.style
            }
        },
        editSave(){
            let params = new URLSearchParams();
            params.append('id',this.editForm.id);
            params.append('title',this.editForm.title);
            params.append('introduction',this.editForm.introduction);
            params.append('style',this.editForm.style);
            
            updateSongList(params).then((res) => {
                if(res.code==1){this.getData();this.notify("修改成功","succss");}
                else{this.notify("修改失败","error");}
            })
            .catch((err) => {
                console.log(err);
            });
            this.editVisible=false;
        },
        deleteRow(){
            deleteSongList(this.id_choose).then((res) => {
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
            this.$router.push({path:`/ListSong`,query:{id}});
        },
        //转向该歌单的评论列表
        getComment(id){
            this.$router.push({path: '/comment',query:{id}})
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
.SongList-img{
    width: 120px;
    height: 105px;
    border-radius: 10px;
    margin-bottom: 5px;
    overflow: hidden;
}

.add-SongList-btn {
    font-size: 16px;
    display: inline-block;
    margin-left: 30px;
}

.delete-SongList-btn{
    font-size: 16px;
    display: inline-block;
    margin-left: 30px
}

.container{
    background-color: #c8e6c9;
}
.SongListName{
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