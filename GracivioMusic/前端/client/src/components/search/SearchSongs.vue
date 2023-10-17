<template>
    <div class="search-songs">
       <album-content :songList="listOfSongs"></album-content>
    </div>
</template>
<script>
import {mapGetters} from "vuex";
import {mixin} from "../../mixins";
import AlbumContent from "../AlbumContent";

export default {
    mixins: [mixin],
    name: 'search-songs',
    components:{
        AlbumContent
    },
    computed:{
        ...mapGetters([
            'listOfSongs',
            'isPlay'
        ])
    },
    watch: {
        // 监听搜索关键字的变化
        keywords: {
            handler(keywords) {
                this.getSong();
            },
            immediate: true, // 立即触发一次
        }
    },
    mounted() {
        this.getSong();
    }
}
</script>

<style lang="scss" scoped>
@import '../../assets/css/search-songs.scss';
</style>