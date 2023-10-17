<template>
    <transition name="slide-fade">
        <div class="the-comment" v-if="showListComment">
            <h2 class="title">发布评论</h2>
            <el-form :model="registerForm" ref="registerForm" label-width="80px">
                <el-form-item prop="introduction" size="mini" class="danmu">
                    <el-input v-model="registerForm.introduction" placeholder="发一条弹幕来表达你的心情吧" type="textarea" :rows="4" style="font-size: 16px;"></el-input>
                </el-form-item>
            </el-form>
            <div class="btn">
                <div style="border-radius: 10px;" @click="release">发布</div>
                <div style="border-radius: 10px;" @click="cancel">取消</div>
            </div>
        </div>
    </transition>
</template>
<script>
import {mapGetters} from 'vuex';
import {addListComment} from '../api/index'
export default {
    name: 'the-list-comment',
    computed: {
        ...mapGetters([
            'showListComment',         //是否显示播放中的歌曲列表
            'listOfSongs',       //当前歌曲列表
            'listId' ,               //播放中的音乐id
            'isSent'
        ])
    },
    data(){
        return{
            registerForm:{
                introduction:''
            },
        }
    },
    methods:{
        cancel(){
            this.$store.commit('setShowListComment',false);
        },
        release(){
            let params = new URLSearchParams();
            params.append('songListId',this.listId);
            params.append('comment',this.registerForm.introduction);
            addListComment(params);
            this.$store.commit('setIsSent',true);
            window.location.reload();
            this.$store.commit('setShowListComment',false);
        }
    }
}
</script>
<style  lang="scss" scoped>
@import '../assets/css/the-comment.scss';
</style>
