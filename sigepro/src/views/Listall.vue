<template>
    <div class="listall">
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
                <input type="submit" class="seach_img" @click="search" @click.native="flushCom">
            </div>
        </div>
        <div class="detail_navbar">
            <div class="navbar_content">
                <router-link to="/index">首页</router-link>>
                所有商品
            </div>
        </div>
        <div class="category_list">
            <div class="list_box">
                <div class="fenlei"><span>分类：</span></div>
                <div class="list">
                    <ul>
                        <li><router-link to="#">全部</router-link></li>
                        <li v-for="(category,i) of categories" :key="i"><router-link :to="`/listcid/${category.cid}`">{{category.category_name}}</router-link></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="list_main">
            <div class="list_content">
                <div class="list_order">
                    <span><router-link to="#">综合排序</router-link></span>
                    <span><router-link to="#">销量</router-link></span>
                    <span><router-link to="#">价格</router-link></span>
                    <span><router-link to="#">最新</router-link></span>
                </div>
                <div class="list_desc" >
                    <div class="list_div" v-for="(list,i) of lists" :key="i">
                        <div class="pro_item" style="text-align:center">
                            <div class="pro_image"><router-link :to="`/detail/${list.detail_id}`"><img :src="list.image" width="200px"></router-link></div>
                            <p class="desc"></p>
                            <h2><router-link :to="`/detail/${list.detail_id}`">{{list.title}}</router-link></h2>
                            <p class="desc"></p>
                            <p class="price" style="text-decoration: line-through;">指导价：{{list.old_price}}元</p>
                            <p class="price">{{list.new_price}}元</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <my-footer></my-footer>
    </div>
</template>

<script>
export default {
    props:["value"],
    data(){
        return {
            inputval:'',
            categories:[],
            lists:[],
        }
    },
    methods:{
        search(){
            this.$router.push(`/listall/${this.inputval}`)
        },
        flushCom(){
            this.$router.go(0);
        }
    },
    watch:{
        $route(to,from){
            this.$router.go(0);
        }
    },
    mounted(){
        this.axios.get('/category').then(res=>{
            let data = res.data.results;
            this.categories = data;
        }),
        this.axios.get('/listall',{params:{value:this.value}}).then(res=>{
            let data = res.data.results;
            data.forEach(item=>{
                item.image = require('../../../server/public' + item.image);
                this.lists.push(item);
                this.cname = item.category_name;
            })
        })
    }
}
</script>

<style scoped>
    .list_main .list_content{width: 70%;margin: 30px auto;}
    .list_main .list_content .list_desc{display: flex;flex-wrap:wrap;}
    .list_main .list_content .list_desc .list_div{flex: 0 0 25%;padding: 0 10px 10px 0;box-sizing: border-box;}
    .list_desc .list_div .pro_item{padding: 40px 0;transition: box-shadow .5s linear;background-color: #fff;}
    .list_main{background-color: rgb(247, 241, 241);padding-top:15px}
    .list_desc .list_div .pro_item:hover{box-shadow: 3px 3px 10px  rgb(179, 177, 177);}
    .list_desc .list_div .desc{height: 40px;}
    .list_desc .list_div .price{margin: 0 0 5px;color: #c6151d;font-size: 14px;}
    .list_desc .list_div h2 a{color: #757575;font-size: 14px;font-weight: 400;}
    .list_desc .list_div h2{height: 18px;overflow: hidden;}
    .list_content .list_order{margin: 30px 0;}
    .list_content span a{font-size: 14px;color: #424242;transition: color .2s;padding-right:50px;}
    .list_content span a:hover{color: #ff6700;}
    a{text-decoration: none;}
    .category_list{padding: 20px 0;}
    .list_box{width: 70%;margin: 0 auto;position: relative;}
    .list_box .fenlei{position: absolute;top: 11px;left: 0;color:#b0b0b0;font-size: 14px;}
    .list_box .list::after{content:"";display: block;clear: both;}
    .list_box .list{padding-left:60px;}
    .list_box .list li{float: left;padding: 14px 10px;width: 140px;}
    .list_box .list li a{color: #424242;font-size: 14px;}
    .list_box .list li a:hover{color: #ff6700;}
    .detail_navbar{background: #f5f5f5;}
    .navbar_content{width: 70%;margin: 0 auto;padding: 14px 0;color: #616161;font-size: 14px;}
    .navbar_content a{color: #616161;padding-right:10px;}
    .navbar_content a:hover{color: #333;}

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