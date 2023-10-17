<template>
  <div class="login-wrap">
    <img src="../assets/img/logo.png" alt="logo">
    <div class="ms-title">Gricivio Music后台管理员登录</div>
    <div class="ms-login">
      <el-form :model="ruleForm" :rules="rules" ref="releForm">
        <el-form-item prop="username">
          <el-input v-model="ruleForm.username" placeholder="用户名"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input type="password" v-model="ruleForm.password" placeholder="密码"></el-input>
        </el-form-item>
        <div class="login-btn">
          <el-button type="primary" @click="submitForm">登录</el-button>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
import {getLoginStatus} from "../api/index";
import {mixin} from "../mixins/index";
export default{
  mixins:[mixin],
  data:function(){
    return{
      ruleForm:{
      },
      rules:{
        username:[
          {required:true,message:"请输入用户名！",trigger:"blur"}
        ],
        password:[
          {required:true,message:"请输入密码！",trigger:"blur"}
        ],
      }
    };
  },
  methods:{
    submitForm(){
      let params = new URLSearchParams();
      params.append("name",this.ruleForm.username);
      params.append("password",this.ruleForm.password);
      getLoginStatus(params).then((res) => {
        if(res.code==1){
          localStorage.setItem('userName',this.ruleForm.username);
          this.notify("登录成功","success");
          this.$router.push("/Info")
        }
        else{this.notify("登录失败","error");}
    });
    }
  }
}
</script>

<style scoped>
.login-wrap{
  position: relative;
  background: url("../assets/img/background.png");
  background-attachment: fixed;
  background-position: center;
  background-size: cover;
  width: 100%;
  height: 100%;
}
.ms-title{
  position: absolute;
  top: 45%;
  width: 100%;
  margin-top:-230px;
  text-align: center;
  font-size: 30px;
  font-weight: 600;
  color: #fff;
}
.ms-login{
  position: absolute;
  left: 50%;
  top: 50%;
  width:450px;
  height:230px;
  margin-left: -270px;
  margin-top: -150px;
  padding: 40px;
  border-radius: 10px; 
  background: #fff;
}
.login-btn{
  text-align: center;
  
}
.login-btn button{
  width: 200px;
  height: 42px;
  text-align: center;
  margin-top: 20px;
  background-color: #D2B48C;
  color: #fff;
  font-size: 25px;
}
</style>