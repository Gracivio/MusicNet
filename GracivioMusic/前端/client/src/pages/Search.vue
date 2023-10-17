<template>
    <div class="search">
        <nav class="searchList-nav" ref="change">
            <span :class="{isActive: toggle=='Songs'}" @click="handleChangeView('Songs')">歌曲</span>
            <span :class="{isActive: toggle=='SongLists'}" @click="handleChangeView('SongLists')">歌单</span>
        </nav>
        <component :is="currentView"></component>
    </div>
</template>
<script>
import searchSongs from '../components/search/SearchSongs.vue'
import searchSongLists from '../components/search/SearchSongLists.vue'
import {getSong} from '../api/index.js'
export default {
   name: 'search',
   components: {
       searchSongs,
       searchSongLists
   },
   data(){
       return {
           toggle: 'Songs',
           currentView: '',
       }
   },
   created() {
       // 读取localStorage中的值，如果有保存的值则设置为当前界面
       setTimeout(() => {this.$store.commit('setIsPlay', false);}, 50);
       const savedView = localStorage.getItem('currentView');
       if (savedView) {
           this.currentView = savedView;
           this.toggle = savedView.replace('search', '');
           
       } else {
           // 如果没有保存的值，则默认显示歌曲界面
           this.currentView = 'searchSongs';
           this.toggle = 'Songs';
       }
   },
   mounted(){
       setTimeout(() => {this.$store.commit('setIsPlay', false);}, 50);
   },
   methods:{
       // 切换组件
       handleChangeView(component){
           this.currentView = 'search'+component;
           this.toggle = component;
           // 保存切换的界面到localStorage中
           localStorage.setItem('currentView', this.currentView);
           console.log('toggle:', this.toggle);
       },
       

   } 
}
</script>
<style lang="scss" scoped>
@import '../assets/css/search.scss';
</style>