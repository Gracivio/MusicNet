<template>
    <transition name="slide-fade">
        <div class="the-comment" v-if="showComment">
            <h2 class="title">发布弹幕</h2>
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
import {addComment} from '../api/index'
export default {
    name: 'the-comment',
    computed: {
        ...mapGetters([
            'showComment',         //是否显示播放中的歌曲列表
            'listOfSongs',       //当前歌曲列表
            'id'                //播放中的音乐id
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
            this.$store.commit('setShowComment',false);
        },
        release(){
            let params = new URLSearchParams();
            params.append('songId',this.id);
            params.append('comment',this.registerForm.introduction);
            addComment(params);
            this.$store.commit('setShowComment',false);
        }
    }
}
</script>
<style  lang="scss" scoped>
@import '../assets/css/the-comment.scss';
</style>
