<template>
    <div class="index">
        <my-header></my-header>
        <div class="index_nav">
            <div style="display:flex">
                <div class="nav_logo">
                    <img src="../assets/images/index/logo.png">
                </div>
                <div class="nav_li">
                    <ul>
                        <li><router-link to="/index">首页</router-link></li>
                        <li><router-link to="/listall/表">全部商品</router-link></li>
                        <li><router-link to="">品牌介绍</router-link></li>
                        <li><router-link to="">客户服务</router-link></li>
                        <li><router-link to="">购物车</router-link></li>
                        <li><router-link to="">行业报告</router-link></li>
                    </ul>
                </div>
            </div>
            <div class="nav_search">
                <input type="search" class="input_cont" v-model="inputval">
                <input type="submit" class="seach_img" @click="search">
            </div>
        </div>
        <rotation></rotation>
        <my-footer></my-footer>
    </div>
</template>

<script>
export default {
    data(){
        return {
            inputval:''
        }
    },
    methods:{
        search(){
            this.$router.push(`/listall/${this.inputval}`)
        }
    }
}
</script>

<style scoped>
    .index_nav{width: 70%;margin: 20px auto 10px;display: flex;justify-content: space-between;}
    .index_nav .nav_logo{margin: 0 40px;}
    .nav_li ul{height: 65px;}
    .nav_li li{float: left;line-height: 65px;margin-left: 20px;}
    .nav_li li a{text-decoration: none;color: #333;}
    .nav_li li a:hover{color: #ff6700;}
    .index_nav .nav_search .input_cont{
        width: 223px;height: 48px;
        padding: 0 10px;
        border: 1px solid #e0e0e0;
        font-size: 14px;
        line-height: 48px;}
    .index_nav .nav_search .seach_img{
        width: 52px;height: 50px;
        padding: 0 10px;
        border: 1px solid #e0e0e0;line-height: 24px;}
</style>