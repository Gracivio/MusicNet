<template>
  <div class="player" style="overflow: hidden;">
      <canvas ref="visualizerCanvas" class="visualizer"></canvas>
      <div class="avator" :style="{ backgroundImage: 'url(' + pic + ')' }"></div>
      
      <div class="lyric">
          <h1 class="lyric-title"></h1>
          <canvas ref="starsCanvas" class="stars"></canvas>
          <ul class="has-lyric" v-if="lyr.length" key="index" ref="lyricContainer" :style="`top: ${lyrTop}px`">
          <li v-for="(item,index) in lyr" v-bind:key="index" class="lyric-line" :class="{ 'active-lyric': index === activeLyricIndex }">
              <div class="lyric-line-content">{{item[1]}}</div>
          </li>
      </ul>
      </div>
      <div class="danmu-container">
        <div v-for="(danmu, index) in danmus" :key="index" class="danmu" :style="{ animationDelay: index * 0.002 + 's' }">
          {{ danmu }}
        </div>
      </div>
      <img src="../assets/img/comment_icon.png" class="comment" @click="showSongComment">
  </div>
</template>



<script>
import { computed } from 'vue';
import { mapGetters } from 'vuex';
import { mixin } from '../mixins';
import {getComment} from '../api/index'

class Star {
  constructor(x, y, radius, color) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.color = color;
    this.velocity = {
      x: (Math.random() - 0.5) * 0.2,
      y: 0.01
    };
  }

  update() {
    this.x += this.velocity.x;
    this.y += this.velocity.y;
  }

  draw(context) {
    context.beginPath();
    context.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
    context.fillStyle = this.color;
    context.fill();
    context.closePath();
  }
}

export default{
  mixins: [mixin],
  name:'lyric',
  data(){
      return{
          lyr: [],
          pic: '',
          audio: null,
          audioContext: null,
          analyser: null,
          bufferLength: 0,
          dataArray: null,
          canvas: null,
          canvasContext: null,
          animationFrameId: null,
          activeLyricIndex: -1,
          danmus: [], // 弹幕数据
          registerForm:{
            comment: ''
          },
          shouldAnimate: true, // 标志位，用于判断是否应该继续执行动画帧的回调函数
          animationFrameId: null, // 动画帧请求的ID
          lyrTop: 0
      }
  },
  computed:{
      ...mapGetters([
          'curTime',
          'id',
          'lyric',
          'listIndex',
          'listOfSongs',
          'picUrl',
          'url',
          'showComment',
          'loginIn'
      ]),
  },
  created(){
    const storedLyric = localStorage.getItem('lyric');
    if (storedLyric) {
       this.lyr = JSON.parse(storedLyric);
       this.$store.commit('setLyric',this.lyr)
     } else {
       this.lyr = this.parseLyric(this.listOfSongs[this.listIndex].lyric);
     }
      this.pic = this.picUrl;
      this.music = this.url;
  },
  beforeDestroy() {
    cancelAnimationFrame(this.animationFrameId);
  },
  mounted() {
    this.setupAudio();
    this.setupVisualizer();
    this.animateVisualizer();
    this.setupStars();
    this.animateStars();
   /* for (let i = 0; i < 10; i++) {
       setTimeout(() => {
        this.danmus.push("请发一条弹幕来表达你的看法吧！");
     }, i * 11000); 
   }*/
    getComment(this.id)
      .then(res => {
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
  watch:{
      id: function(){
          cancelAnimationFrame(this.animationFrameId);
          this.lyr = this.parseLyric(this.listOfSongs[this.listIndex].lyric);
          this.pic = this.listOfSongs[this.listIndex].picUrl;
          this.setupStars();
          this.animateStars();
          this.danmus = [];
      },
      lyric: function() {
          this.lyr = this.parseLyric(this.listOfSongs[this.listIndex].lyric);
      },
      picUrl: function(){
        this.pic = this.picUrl;
      },
      url: function(){
        this.music = this.url;
      },
      curTime: function(){
          if(this.lyr.length>0){
              for(let i=0;i<this.lyr.length;i++){
                  if(this.curTime>=this.lyr[i][0]){
                      this.activeLyricIndex = i;
                      const activeLyricElement = this.$refs.lyricContainer.children[i];
                      //activeLyricElement.scrollIntoView({ behavior: 'smooth' });
                      for(let j=0;j<this.lyr.length;j++){
                          document.querySelectorAll('.has-lyric li')[j].style.color = '#fff';
                          document.querySelectorAll('.has-lyric li')[j].style.fontSize = '15px';
                      }
                      if(i>=0){
                          document.querySelectorAll('.has-lyric li')[i].style.color = '#c4ceb3';
                          document.querySelectorAll('.has-lyric li')[i].style.fontSize = '30px';
                          this.lyrTop = -40*i + 320;
                      }
                  }
              }
          }
      }
  },
  methods: {
    setupAudio() {
        this.audio = new Audio();
        this.audio.src = this.music;
        this.audio.crossOrigin = 'anonymous';


        this.audioContext = new (window.AudioContext || window.webkitAudioContext)();
        const source = this.audioContext.createMediaElementSource(this.audio);

        this.scriptProcessor = this.audioContext.createScriptProcessor(2048, 1, 1);
        this.analyser = this.audioContext.createAnalyser();
        this.analyser.fftSize = 256;
        this.bufferLength = this.analyser.frequencyBinCount;
        this.dataArray = new Uint8Array(this.bufferLength);

        source.connect(this.analyser);
        this.analyser.connect(this.scriptProcessor);
        this.scriptProcessor.connect(this.audioContext.destination);

        this.scriptProcessor.onaudioprocess = () => {
          this.analyser.getByteFrequencyData(this.dataArray);
          // 在这里使用dataArray进行频谱展示或其他处理
        };

        this.audio.play();
    },
    setupVisualizer() {
      this.canvas = this.$refs.visualizerCanvas;
      this.canvasContext = this.canvas.getContext('2d');
    },
    animateVisualizer() {
      this.animationFrameId = requestAnimationFrame(this.animateVisualizer);
      this.analyser.getByteFrequencyData(this.dataArray);
      this.canvasContext.clearRect(0, 0, this.canvas.width, this.canvas.height);
      this.canvasContext.clearRect(0, 0, this.canvas.width, this.canvas.height);

      const barWidth = (this.canvas.width / this.bufferLength) * 0.5;
      let barHeight;
      let x = 0;

      for (let i = 0; i < this.bufferLength; i++) {
        barHeight = this.dataArray[i] / 0.8;

        this.canvasContext.fillStyle = `#c4ceb3`;
        this.canvasContext.fillRect(x, this.canvas.height - barHeight / 2, barWidth, barHeight*0.5);

        x += barWidth + 2;
      }
    },

    setupStars() {
      const canvas2 = this.$refs.starsCanvas;
      const context = canvas2.getContext('2d');
      const width = window.innerWidth;
      const height = window.innerHeight;
      canvas2.width = width;
      canvas2.height = height;

      this.stars = [];
      for (let i = 0; i < 100; i++) {
        const x = Math.random() * width;
        const y = Math.random() * height;
        const radius = Math.random() * 3;
        const color = '#ecebd6';
        this.stars.push(new Star(x, y, radius, color));
      }
    },
    animateStars() {
      this.animationFrameId = requestAnimationFrame(this.animateStars);
      const canvas2 = this.$refs.starsCanvas;
      const context = canvas2.getContext('2d');
      context.clearRect(0, 0, canvas2.width, canvas2.height);

      for (let i = 0; i < this.stars.length; i++) {
        const star = this.stars[i];
        star.update();
        star.draw(context);
      }
    },
    showList(){
            if(this.flag == 0){
                this.$store.commit('setShowAside',true);
                this.flag = 1;
            }
            else{
                this.$store.commit('setShowAside',false);
                this.flag = 0;
            }
        },
    showSongComment(){
        if(this.loginIn){
          this.$store.commit('setShowComment',true);
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

  },
}
</script>

<style scoped>
.player{
  margin: auto;
  width: 90%;
  height:100%;
  padding: 20px;
  margin-left: 2.5%;
  margin-top: 15px;
  background-color: #848c74;
  border-radius: 12px;
  display: flex;
  padding: 0 20px 50px 20px;
  background-size: auto;
  overflow: hidden;

  .stars {
  position: fixed;
  top: 0;
  width: 100%;
  height: 100%;
  color: #ecebd6;
  left: 0;
  z-index: 0;
}

  .visualizer {
  width: 500px;
  height: 100px;
  position: absolute;
  left: 0px;
  margin-left: 225px;
  margin-top: -30px;
  transform: translateX(-10%);
  bottom: 170px;
  border-radius: 10px;
  background-color: rgba(255, 255, 255, 0.1);
  
}
  .visualizer.bar{
    background-color: #c4ceb3;
    color: #c4ceb3;
    margin-right: 5px;
    transition: height 0.3s ease-in-out;
  }
  .avator{
      background-color: #fff;
      width: 400px;
      height: 400px;
      margin-left: 160px;
      margin-top: 170px;
      border-radius: 20px;
      background-size: cover; /* 设置背景图片自适应容器大小 */
      background-repeat: no-repeat; /* 禁止背景图片重复 */
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* 添加阴影效果 */
  }



.lyric {
  margin: auto;
  margin-top: 90px;
  width: 700px !important;
  height: 700px !important;
  margin-left: 180px;
  background-color: rgba(255, 255, 255, 0.1);
  color:white;
  height: 680px;
  overflow: hidden !important;
  border-radius: 12px;
  padding: 0 20px 50px 10px;
  font-family: "楷体", "KaiTi", serif;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;

  .active-lyric {
  color: #c4ceb3;
  font-size: 30px;
  text-align: center;
}

.lyric-title {
  text-align: center;
  height: 60px;
  line-height: 60px;
  border-bottom: none
}

.has-lyric {
  font-size: 18px;
  padding: 30px 0;
  width: 100% !important;
  min-height: 170px;
  text-align: center;
  display: flex;
  position: absolute;
  line-height: 40px;
  flex-direction: column;
  overflow: hidden;
  margin-bottom: 30px;
  li {
    width: 100%;
    height: 40px;
    line-height: 40px;
    margin-bottom: 30px;
    padding: 10px;
  }
  

  .lyric-line{
      text-align: center;
      margin-bottom: 30px;
      padding: 0px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
  }

  .active-lyric {
  color: #c4ceb3;
  font-size: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}

  .lyric-line-content {
      line-height: 1.5;
  }
}

.no-lyric {
  margin: 200px 0;
  width: 100%;
  text-align: center;

  span {
    font-size: 18px;
    text-align: center;
  }
}
}

.lyric-fade-enter,
.lyric-fade-leave-to {
transform: translateX(30px);
opacity: 0;
}

.lyric-fade-enter-active,
.lyric-fade-leave-active {
transition: all 0.3s ease;
}
}

.danmu-container{
  position: fixed;
  z-index: 9999;
  height: 680px;
  margin-right: 100px;
  width: 160%;
  margin-left: -100px;
  border-radius: 20px;
  background-color:rgba(255, 255, 255, 0);
  margin-top: 130px;
  overflow: hidden;
  color: #fff;
}
.danmu {
  display: flex;
  justify-content: center;
  align-items: center;
  height:40px;
  width: 250px;
  border-radius: 15px;
  font-size: 16px;
  color: white;
  background-color: rgba(255, 255, 255, 0.1);
  animation: danmuScroll 8s linear forwards;
}

@keyframes danmuScroll {
  0% {
    transform: translateX(200%); /* 弹幕起始位置在容器的右侧 */
  }
  100% {
    transform: translateX(-160%); /* 弹幕结束位置在容器的左侧 */
  }
}

.comment{
  margin-top: 600px;
  margin-left: 15px;
  height: 100px;
  width: 100px;
  background-size: cover;
  left: 0;
  position: absolute;
  cursor: pointer;
  z-index: 9999;
}


</style>