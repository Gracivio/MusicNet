<template>
    <div class="menuBar">
        <el-menu
            class="menuBar-el-menu"
            :default-active="onRoutes"
            :collapse="collapse"
            background-color = "#9abda9"
            text-color = "#ffffff"
            active-text-color="#d0e4bd"
            router
        >
            <template v-for="item in items">
                <template>
                    <el-menu-item :index="item.index" :key="item.index">
                        <i :class="item.icon"></i>
                        {{ item.title }}
                    </el-menu-item>
                </template>
            </template>
        </el-menu>
    </div>
</template>

<script>
import InfoPage from '../pages/InfoPage.vue';
import bus from '../assets/js/bus'
export default{
    data(){
        return{
            collapse:false,
            items:[
                {
                    icon:'el-icon-document',
                    index:'Info',
                    title:'系统首页'
                },
                {
                    icon:'el-icon-document',
                    index:'User',
                    title:'用户管理'
                },
                {
                    icon:'el-icon-document',
                    index:'Singer',
                    title:'歌手管理'
                },
                {
                    icon:'el-icon-document',
                    index:'SongList',
                    title:'歌单管理'
                },
            ]
        }
    },
    computed:{
        onRoutes(){
            return this.$route.path.replace('/','')
        }
    },
    created(){
        bus.$on('collapse',msg => {
            this.collapse = msg
        })
    }
}
</script>

<style scoped>
.menuBar{
    display: block;
    position: absolute;
    left: 0;
    top: 100px;
    bottom: 0px;
    background-color: #9abda9;
    overflow-y: scroll;
    font-size: 18px;
}

.menuBar-el-menu:not(.el-menu--collapse){
    width: 150px;
}

.menuBar::-webkit-scrollbar{
    width:0
}

.menuBar >ul{
    height: 100%;
}
</style>