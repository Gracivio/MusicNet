<template>
    <div class="table">
        <div class="container">
            <div class="handle-box">
                <el-input v-model="select_word" size="mini" placeholder="请输入您想要查询的歌曲名称" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="centerDialogVisible = true" style="background-color: #b8c0b0" class="add-singer-btn">添加歌曲</el-button>
                <el-button type="primary" size="mini" @click="delAll" style="background-color: #b8c0b0" class="delete-singer-btn">批量删除</el-button>
            </div>
        </div>
        <el-table size="mini" ref="multipleTable" border style="width:100%" height="650px" :data="data" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="40"></el-table-column>
            <el-table-column label="歌曲图片" width="150px" height="350px" align="center">
                <template slot-scope="scope">
                    <div class="song-img">
                        <img :src="getUrl(scope.row.pic)" style="width:100%"/>
                    </div>
                    <div class="play" @click="setSongUrl(scope.row.url,scope.row.name)">
                        <div v-if="toggle == scope.row.name">
                            <svg class="icon">
                                <use xlink:href="#icon-zanting"></use>
                            </svg>
                        </div>
                        <div v-if="toggle != scope.row.name">
                            <svg class="icon">
                                <use xlink:href="#icon-bofanganniu"></use>
                            </svg>
                        </div>
                    </div>
                </template>
            </el-table-column>
            <el-table-column prop="name" label="歌手-歌名" width="120" align="center"></el-table-column>
            <el-table-column prop="introduction" label="专辑" width="150" align="center"></el-table-column>
            <el-table-column label="歌词" align="center">
                <template slot-scope="scope">
                    <ul class="lyric-list" style="height:120px;overflow-y:scroll;width: 100%;">
                        <li v-for="(item,index) in parseLyric(scope.row.lyric)" :key="index">
                            {{item}}
                        </li>
                    </ul>
                </template>
            </el-table-column>
            <el-table-column label="操作" width="150" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" type="danger" @click="handleDelete(scope.row.id)">删除</el-button> 
                </template>
            </el-table-column>
        </el-table>
        <div class="pagination">
            <el-pagination
                background
                layout = "total,prev,pager,next"
                :current-page="currentPage"
                :page-size="pageSize"
                :total="tableData.length"
                @current-change="handleCurrentChange"
                >
            </el-pagination>
        </div>

        <el-dialog title="添加歌曲" :visible.sync="centerDialogVisible" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="80px" action="" id="tf">
                <el-form-item prop="singerName" label="歌手名称" size="mini">
                    <el-input v-model="registerForm.singerName" placeholder="歌手名称"></el-input>
                </el-form-item> 
                <el-form-item prop="singerName" label="歌曲名称" size="mini">
                    <el-input v-model="registerForm.songName" placeholder="歌曲名称"></el-input>
                </el-form-item>  
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="getSongId">确定</el-button>                
            </span>
        </el-dialog>

        <el-dialog title="删除歌曲" :visible.sync="deleteVisible" width="300px" center>
            <div align="center">删除不可恢复，是否确定删除？</div>
            <span slot="footer">
                <el-button size="mini" @click="deleteVisible = false">取消</el-button>
                <el-button size="mini" @click="deleteRow">确定</el-button>                
            </span>
        </el-dialog>
    </div>
</template>

<script>
import { mixin } from '../mixins/index';
import {mapGetters} from 'vuex';
import '@/assets/js/iconfont.js';
import {listSongDetail,songOfSongId,songOfSongName,listSongAdd,delListSong} from '../api/index';

export default {
    mixins: [mixin],
    data(){
        return{
            centerDialogVisible: false, //添加弹窗是否显示
            deleteVisible: false,          //删除弹窗是否显示
            registerForm:{      //添加框
                singerName: '',     //歌手名字
                songName: ''        //歌曲名字
            },
            tableData: [],
            tempData: [],
            select_word: '',
            pageSize: 4,    //分页每页大小
            currentPage: 1,  //当前页
            id_choose: -1,          //当前选择项
            multipleSelection: [],   //哪些项已经打勾
            toggle: false ,          //播放器的图标状态
            songListId: ''          //歌单id
        }
    },
    computed:{
        ...mapGetters([
            'isPlay'
        ]),
        //计算当前搜索结果表里的数据
        data(){
            return this.tableData.slice((this.currentPage - 1) * this.pageSize,this.currentPage * this.pageSize)
        }
    },
    watch:{
        //搜索框里面的内容发生变化的时候，搜索结果table列表的内容跟着它的内容发生变化
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
        this.songListId = this.$route.query.id;
        this.getData();
    },
    destroyed() {
        this.$store.commit('setIsPlay',false);
    },
    methods:{
        //获取当前页
        handleCurrentChange(val){
            this.currentPage = val;
        },
        //查询所有歌手
        getData(){
            this.tempData = [];
            this.tableData = [];
            listSongDetail(this.songListId).then(res => {
                for(let item of res){
                    this.getSong(item.song_id);
                }
            })
        },
        //添加歌手
        addSong(songId){
            let _this = this;
            let params = new URLSearchParams();
            params.append('songId',songId);
            params.append('songListId',this.songListId);

            listSongAdd(params)
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
            _this.centerDialogVisible = false;
        },
        //弹出编辑页面
        handleEdit(row){
            this.editVisible = true;
            this.form = {
                id: row.id,
                name: row.name,
                introduction: row.introduction,
                lyric: row.lyric
            }
        },
        //更新图片
        uploadUrl(id){
            return `${this.$store.state.HOST}/song/updateSongPic?id=${id}`
        },
        deleteRow(){
            delListSong(this.id_choose,this.songListId)
            .then(res => {
                if(res){
                    this.getData();
                    this.notify("删除成功","success");
                }else{
                    this.notify("删除失败","error");
                }
            })
            .catch(err => {
                console.log(err);
            });
            this.deleteVisible = false;
        },
        //解析歌词
        parseLyric(text) {
            let lines = text.split("。");
            let result = lines.join("。\n");
            return result;
        },
        //上传歌曲之前的校验
        beforeSongUpload(file){
            var testMsg = file.name.substring(file.name.lastIndexOf('.') + 1);
            if(testMsg!='mp3'){
                this.$message({
                    message: '上传文件只能是mp3格式',
                    type: 'error'
                });
                return false;
            }
            return true;
        },
        //上传歌曲成功之后要做的工作
        handleSongSuccess(res){
            let _this = this;
            if(res.code == 1){
                _this.getData();
                _this.$notify({
                    title: '上传成功',
                    type: 'success'
                });
            }else{
                _this.$notify({
                    title: '上传失败',
                    type: 'error'
                });
            }
        },
        //更新歌曲url
        uploadSongUrl(id){
            return `${this.$store.state.HOST}/song/updateSongUrl?id=${id}`
        },
        //切换播放歌曲
        setSongUrl(url,name) {
            this.$store.commit('setUrl',this.$store.state.HOST + url);
            if(this.toggle === name){
                this.toggle = null;
                this.$store.commit('setIsPlay',false);
            }else{
                this.toggle = name;
                this.$store.commit('setIsPlay',true);
            }
        },
        //根据歌曲id查询歌曲对象，放到tempData和tableData里面
        getSong(id){
            songOfSongId(id)
            .then(res => {
                this.tempData.push(res);
                this.tableData.push(res);
                this.currentPage = 1;
            })
            .catch(err => {
                console.log(err);
            });
        },
        //添加歌曲前的准备，获取到歌曲id        
        getSongId(){
            let _this = this;
            var songOfName = _this.registerForm.singerName+"-"+_this.registerForm.songName;
            songOfSongName(songOfName).then(
                res => {
                    _this.addSong(res[0].id)
                }
            )
        },
    }   
}
</script>

<style scoped>
.handle-box{
    margin-bottom: 20px;
    display: flex;
    align-items: center;

}
.song-img{
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
.songName{
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

.set-lyric{
    overflow: hidden;
}

.container2 {
    display: flex;
    justify-content: center;
    align-items: center;
}

.play {
        position: absolute;
        z-index: 100;
        width: 50px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        top: 108px;
        left: 47px;
    }

.icon {
    width: 19px;
    height: 19px;
    color: #848c74;
    fill: currentColor;
    overflow: hidden;
}

.lyric-list li {
    word-break: break-all;
}
</style>