<template>
    <div class="song-list-album">
        <div class="album-slide">
            <div class="album-img">
                <img :src="attachImageUrl(tempList.pic)">
                <div class="danmu-container">
                   <div v-for="(danmu, index) in danmus" :key="index" class="danmu" :style="{ animationDelay: index * 0.002 + 's' }">
                       {{ danmu }}
                   </div>
                </div>
            </div>
            <div class="album-info">
                <span>
                    {{tempList.introduction}}
                </span>
                <img :src="require('@/assets/img/comment_icon.png')" class="comment-icon" @click="showSongComment"> 
            </div>
        </div>
        <div class="album-content">
            <div class="songs-body">
                <album-content :songList="listOfSongs">
                    <template slot="title" style="color: #afb79c;">{{tempList.title}}</template>
                </album-content>
            </div>
        </div>     
    </div>
</template>
<script>
import {mixin} from '../mixins';
import {mapGetters} from 'vuex';
import {listSongDetail,songOfSongId,getListComment} from '../api/index';
import AlbumContent from "../components/AlbumContent";
export default {
    name: 'song-list-album',
    mixins: [mixin],
    components:{
        AlbumContent,
    },
    data(){
        return {
            songLists: [],      //当前页面需要展示的歌曲列表
            songListId: '',    //前面传来的歌单id
            danmus: [], // 弹幕数据
            index: 0,
            isRunning: false
        }
    },
    computed:{
        ...mapGetters([
            'listOfSongs',      //当前播放列表
            'tempList',         //当前歌单对象
            'loginIn',          //用户是否已登录
            'userId',           //当前登录用户id
            'listId',
            'isSent'
        ])
    },
    created(){
        const tempListStorage = localStorage.getItem('tempList');
        if (tempListStorage) {
            this.$store.commit('setTempList', JSON.parse(tempListStorage));
           // this.tempList = tempListStorage;
        }
        this.songListId = this.$route.params.id;
        this.$store.commit('setListId',this.songListId);
        this.getSongId();
    },
    mounted(){
        if(Object.keys(this.tempList).length != 0){
            localStorage.setItem('tempList', JSON.stringify(this.tempList));
        }
        getListComment(this.songListId)
           .then(res => {
            console.log(res)
               if(res.length == 0){
                this.danmus.push("发一条弹幕来表达你的心情吧！")
               }
               res.forEach((item, index) => {
                  setTimeout(() => {
                     this.danmus.push(item.comment);
                  }, index * 8000);
               });
           })
           .catch(error => {
                console.error(error);
           });
    },
    methods:{
        //获取当前歌单的歌曲列表
        getSongId(){
            listSongDetail(this.songListId)
                .then(res => {
                    for(let item of res){
                        this.getSongList(item.song_id);
                    }
                    this.$store.commit('setListOfSongs',this.songLists);
                })
                .catch(err =>{
                    console.log(err)
                })
        },
        //根据歌曲id获取歌曲信息
        getSongList(id){
            songOfSongId(id)
                .then(res => {
                    this.songLists.push(res);
                    //localStorage.setItem('lyric', JSON.stringify(res.lyric));
                })
                .catch(err =>{
                    console.log(err)
                })
        },
        showSongComment(){
            if(this.loginIn){
              this.$store.commit('setShowListComment',true);
            }
            else{
              this.notify('请先登录','warning');
            }
        },
        notify(title,type) {
            this.$notify({
                title: title,
                type: type
            })
        },
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/song-list-album.scss';
</style>
