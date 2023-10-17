<template>
  <div id="app">
    <the-header />
    <router-view class="music-content"/>
    <song-audio/>
    <the-aside/>
    <the-comment style="z-index: 9999;"/>
    <the-list-comment></the-list-comment>
    <play-bar/>
    <scroll-top/> 
    <the-footer />  
  </div>
</template>

<script>
import TheHeader from './components/TheHeader';
import ScrollTop from './components/ScrollTop';
import TheFooter from './components/TheFooter';
import SongAudio from './components/SongAudio';
import TheAside from './components/TheAside';
import TheComment from './components/TheComment.vue'
import TheListComment from './components/TheListComment.vue';
import PlayBar from './components/PlayBar';
export default {
  name: 'App',
  components: {
    TheHeader,
    ScrollTop,
    TheFooter,
    SongAudio,
    TheAside,
    TheComment,
    TheListComment,
    PlayBar
  },
}
</script>

<style  lang="scss" scoped>
@import './assets/css/app.scss';
</style>
