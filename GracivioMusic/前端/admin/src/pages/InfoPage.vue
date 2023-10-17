<template>
    <div>
      <el-row :gutter="20" class="mgb21">
        <el-col :span="6">
          <el-card class="dashboard-card">
            <div class="grid-content">
              <div class="grid-cont-center">
                <div class="grid-num">{{ consumerCount }}</div>
                <div class="grid-label">用户总数</div>
              </div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card class="dashboard-card">
            <div class="grid-content">
              <div class="grid-cont-center">
                <div class="grid-num">{{ songCount }}</div>
                <div class="grid-label">歌曲总数</div>
              </div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card class="dashboard-card">
            <div class="grid-content">
              <div class="grid-cont-center">
                <div class="grid-num">{{ singerCount }}</div>
                <div class="grid-label">歌手数量</div>
              </div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card class="dashboard-card">
            <div class="grid-content">
              <div class="grid-cont-center">
                <div class="grid-num">{{ songListCount }}</div>
                <div class="grid-label">歌单数量</div>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mgb20">
        <el-col :span="12">
          <h3 class="mgb20">歌曲类型分布</h3>
          <div class="chart-container">
            <ve-pie :data="songStyle" :theme="options"></ve-pie>
          </div>
        </el-col>
        <el-col :span="12">
          <h3 class="mgb20">歌手地区分布</h3>
          <div class="chart-container">
            <ve-histogram :data="country" :theme="options"></ve-histogram>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mgb20">
        <el-col :span="12">
          <h3 class="mgb20">用户性别比例</h3>
          <div class="chart-container">
            <ve-pie :data="consumerSex" :theme="options"></ve-pie>
          </div>
     </el-col>
        <el-col :span="12">
          <h3 class="mgb20">用户地区分布</h3>
          <div class="chart-container">
            <ve-histogram :data="province" :theme="options"></ve-histogram>
          </div>
        </el-col>
      </el-row>
    </div>
  </template>

<el-col :span="12">
    <h3 class="mgb20">用户性别比例</h3>
    <div class="chart-container">
      <ve-pie :data="consumerSex" :theme="options"></ve-pie>
    </div>
</el-col>

<el-col :span="12">
    <h3 class="mgb20">用户地区分布</h3>
    <div class="chart-container">
      <ve-histogram :data="province" :theme="options"></ve-histogram>
    </div>
  </el-col>




<script>
import {getAllConsumer,allSong,listSongDetail,getAllSinger,getAllSongList} from '../api/index';
export default {
    data(){
        return {
            consumerCount: 0,       //用户总数
            songCount: 0,           //歌曲总数
            singerCount: 0,         //歌手数量
            songListCount: 0,        //歌单数量
            consumer: [],            //所有用户
            musicListDetail: 0,
            listId: 0,
            consumerSex:{           //按性别分类的用户数
                columns: ['性别','总数'],
                rows: [
                    {'性别': '男','总数': 0},
                    {'性别': '女','总数': 0}
                ]
            },
            options: {
                color: ['#adcdb6','#c4ceb3','#e6e1c4','#ecebd6','#c98e61','#94c5c9','#d0e4bd']
            },
            
            options1: {
                color: ['yellow']
            },
            songStyle:{           //按歌单风格分类
                columns: ['风格','总数'],
                rows: [
                    {'风格': '华语','总数': 0},
                    {'风格': '粤语','总数': 0},
                    {'风格': '欧美','总数': 0},
                    {'风格': '日韩','总数': 0},
                    {'风格': 'BGM','总数': 0},
                    {'风格': '轻音乐','总数': 0},
                    {'风格': '乐器','总数': 0}
                ]
            },
            singerSex:{           //按性别分类的歌手数
                columns: ['性别','总数'],
                rows: [                    
                    {'性别': '女','总数': 0},
                    {'性别': '男','总数': 0},
                    {'性别': '组合','总数': 0},
                ]
            },
            country:{
                columns: ['国籍','总数'],
                rows: [
                    {'国籍': '中国','总数': 0},
                    {'国籍': '韩国','总数': 0},
                    {'国籍': '日本','总数': 0},
                    {'国籍': '美国','总数': 0},
                    {'国籍': '新加坡','总数': 0},
                    {'国籍': '意大利','总数': 0},
                    {'国籍': '马来西亚','总数': 0},
                    {'国籍': '西班牙','总数': 0}                    
                ]
            },
            province:{
                columns: ['省份','总数'],
                rows: [
                    {'省份': '重庆','总数': 0},
                    {'省份': '北京','总数': 0},
                    {'省份': '上海','总数': 0},
                    {'省份': '广州','总数': 0},
                    {'省份': '浙江','总数': 0},
                    {'省份': '江苏','总数': 0},
                    {'省份': '安徽','总数': 0},
                    {'省份': '河南','总数': 0}                    
                ]
            }
        }
    },
    created() {

    },
    mounted() {
        this.getConsumer();
        this.getSong();
        this.getSinger();
        this.getSongList();
        this.getLocation();
    },
    methods: {
        getConsumer() {                     //用户总数
            getAllConsumer().then(res => {
                this.consumer = res;
                this.consumerCount = res.length;
                this.consumerSex.rows[0]['总数'] = this.setSex(1,this.consumer);
                this.consumerSex.rows[1]['总数'] = this.setSex(0,this.consumer);
                for(let items of res){
                    this.getLocation(items.location)
                }
            })
        },  
        setSex(sex,val) {              //根据性别获取用户数
            let count = 0;
            for(let item of val){
                if(sex == item.sex){
                    count++;
                }
            }
            return count;
        },
        getSong() {                      //歌曲总数
            allSong().then(res => {
                this.songCount = res.length;
            })
        },
        getSinger() {                      //歌手数量
            getAllSinger().then(res => {
                this.singerCount = res.length;
                this.singerSex.rows[0]['总数'] = this.setSex(0,res);
                this.singerSex.rows[1]['总数'] = this.setSex(1,res);
                this.singerSex.rows[2]['总数'] = this.setSex(2,res);
                for(let item of res){
                    this.getByCountry(item.location);
                }
            })
        },

        getSongList() {                    //歌单数量
            getAllSongList().then(res => {
                this.songListCount = res.length;
                for(let item of res){
                    this.getByStyle(item.id,item.style);
                }
            })
        },  
        getByStyle(id,style) {              //根据歌单风格获取数量
            for(let item of this.songStyle.rows){
                if(style.includes(item['风格'])){
                    listSongDetail(id).then(res =>{
                        item['总数'] = item['总数'] + res.length;
                    })
                }
            }
        },
        getByCountry(location) {              //根据国籍获取数量
            for(let item of this.country.rows){
                if(location.includes(item['国籍'])){
                    item['总数']++;
                }
            }
        },
        getLocation(location) {              //根据国籍获取数量
            for(let item of this.province.rows){
                if(location.includes(item['省份'])){
                    item['总数']++;
                }
            }
        },
    }
}

</script>

<style scoped>
.grid-content {
    display: flex;
    align-items: center;
    height: 40px;
    border-radius: 10px;
    background-color: #c4ceb3;
    color: #ecebd6;
    
}

.grid-cont-center {
    flex: 1;
    text-align: center;
    font-size: 14px;
    color: darkgray;
    border-radius: 10px;
    background-color: #c4ceb3;
    color: #ecebd6;
    
}

.grid-num {
    font-size: 30px;
    font-weight: bold;
    border-radius: 10px;
    background-color: #c4ceb3;
    color: #ecebd6;
}

.dashboard-card{
    background-color: #c4ceb3;
}

.el-card {
  border-radius: 10px; /* 修改边框弧度 */
  background-color: #c4ceb3; /* 修改底色 */
}

.el-row {
  border-radius: 10px; /* 修改边框弧度 */
  background-color: #f5f5f5; /* 修改底色 */
}

.mgb20{
    margin-top: 30px;
    border-radius: 30px;
    background-color: #f5f5f5;
    color: #a56f75;
}

.mgb21{
    margin-top: 10px;
    border-radius: 30px;
}

</style>