<template>
<footer v-show="showFooter">
    <div class="the-footer">
        <p>关于 | 帮助 |条款 |反馈</p>
        <p>Copyright ©2023</p>
    </div>
</footer>
</template>
<script>
import { computed } from 'vue';

export default {
    name: 'the-footer',
    computed: {
    showFooter() {
        return this.$route.path !==  '/player';
    },
  }
}
</script>
<style lang="scss" scoped>
@import '../assets/css/the-footer.scss';
</style>