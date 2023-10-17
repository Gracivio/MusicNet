<template>
    <div class="header">
        <div class="collapse-btn">
            <img src="../assets/img/logo(2).png" alt="logo">
        </div>
        <div class="flag">Gracivio music后台管理系统</div>
        <div class="avator">
            <img src="../assets/img/user.jpg">
        </div>
        <el-dropdown class="userInf" trigger="click" @command="handleCommand">
        <span class="el-dropdown-link">
            {{ userName }}
            <span>
                <i class="el-icon-caret=bottom"></i>
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item command="logout">退出登录</el-dropdown-item>
                </el-dropdown-menu>
            </span>
        </span>
        </el-dropdown>
    </div>
</template>

<script>
import { computed } from 'vue';
import bus from '../assets/js/bus'
export default{
    data(){
        return{
            
        }
    },
    computed:{
            userName(){
                return localStorage.getItem('userName');
            }
        },
    methods:{
        handleCommand(command){
            if(command == "logout"){
                localStorage.removeItem('userName')
                this.$router.push("/");
            }
        }
    }
}
</script>

<style scoped>
.header{
    position: relative;
    background-color: #848c74;
    box-sizing: border-box;
    width:100%;
    height:100px;
    font-size: 22px;
    color: #fff;
    display: flex; /* 使用 flex 布局 */
    align-items: center; /* 在垂直方向上居中 */
}
.collapse-btn{
    float: left;
    padding: 10px;
    margin-top: 18px;
    top: 40%;
    cursor: pointer;
    line-height: 70px;
    background-image: url('../assets/img/swift.png');
}  

.header.flag{
    position: relative;
    float: left;
    line-height: 100px;
}

.avator{
    margin-left: auto;
    padding: 30px;
    margin-right: 0;
}
.avator img{
    display: block;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    float: right;
}

.userInf{
    font-size: 16px;
    display: inline-block;
    margin-left: 0;
    padding-right: 30px;
}

.el-dropdown-link{
    color: #fff;
    cursor: pointer;
    font-size: 22px;
}
</style>