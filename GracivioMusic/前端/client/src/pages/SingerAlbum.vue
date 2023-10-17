<template>
    <div class="singer-album">
        <div class="album-slide">
            <div class="singer-img">
                <img :src="attachImageUrl(singer.pic)">
            </div>
        </div>
        <div class="album-content">
            <div class="intro">
                <h2 style="color: aliceblue;">{{singer.name}}</h2>
                <span>{{singer.introduction}}</span>
            </div>
            <div class="content">
                <album-content :songList="listOfSongs">
                    <template slot="title">歌单</template>
                </album-content>
            </div>
        </div>
    </div>
</template>
<script>
import {mixin} from '../mixins';
import {mapGetters} from 'vuex';
import {songOfSingerId} from '../api/index';
import AlbumContent from "../components/AlbumContent";
export default {
    name: 'singer-album',
    mixins: [mixin],
    components:{
        AlbumContent
    },
    mounted(){
        if(Object.keys(this.singer).length != 0){
            localStorage.setItem('singer', JSON.stringify(this.singer));
        }
    },
    data(){
        return {
            singerId: '',       //前面传来的歌手id
            singer: {},         //当前歌手信息
        }
    },
    computed:{
        ...mapGetters([
            'listOfSongs',      //当前播放列表
            'tempList',         //当前歌手对象
            'loginIn',          //用户是否已登录
            'userId',           //当前登录用户id
        ])
    },
    created(){
        const singerStorage = localStorage.getItem('singer');
        if (singerStorage) {
            this.$store.commit('setTempList', JSON.parse(singerStorage));
            this.singer = singerStorage;
           // this.tempList = tempListStorage;
        }
        this.singerId = this.$route.params.id;
        this.singer = this.tempList;
        this.getSongOfSingerId();
    },
    methods:{
        //根据歌手id查询歌曲
        getSongOfSingerId(){
            songOfSingerId(this.singerId)
                .then(res => {
                    this.$store.commit('setListOfSongs',res);
                })
                .catch(err =>{
                    console.log(err)
                })
        },
        //获取性别
        attachSex(value){
            if(value==0){
                return '女'
            }else if(value==1){
                return '男'
            }
            return ''
        }
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/singer-album.scss';
</style>
