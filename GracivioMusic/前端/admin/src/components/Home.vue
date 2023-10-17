<template>
    <div>
        <Header></Header>
        <Menu></Menu>
        <div class="content-box">
            <router-view></router-view>
        </div>
    </div>
</template>
<script>
import Header from "./Header"
import Menu from "./Menu"
export default{
    components:{
        Header,
        Menu
    }
}
</script>