<template>
    <div class="swiper" style="background-color: #c9dabf;">
        <el-carousel :interval="10000" type="card" height="300px" style="border-radius: 20px;">
            <el-carousel-item v-for="(item,index) in swiperList" :key="index" style="border-radius: 20px;">
                <img :src="item.picImg" />
            </el-carousel-item>
        </el-carousel>
    </div>
</template>

<script>
import {swiperList} from "../assets/data/swiper";
export default {
    name: "swiper",
    data() {
        return {
            swiperList: []
        }
    },
    created () {
        this.swiperList = swiperList;
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/swiper.scss';
</style>