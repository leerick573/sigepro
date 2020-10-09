<template>
    <div class="rotation">
        <div class="left_nav">
            <ul>
                <li class="category-item" v-for="(category,i) of categories" :key="i">
                    <router-link :to="`/listcid/${category.cid}`">{{category.category_name}}<i class="iconfont">></i></router-link>
                </li>
                
            </ul>
        </div>
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="../assets/images/rotation/rot1.jpg" height="460px" width="100%"></div>
                <div class="swiper-slide"><img src="../assets/images/rotation/rot2.jpg" height="460px" width="100%"></div>
            </div>
            <!-- 如果需要分页器 -->
            <div class="swiper-pagination"></div>
            <!-- 如果需要导航按钮 -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
        <div class="sub_row">
            <div class="sub_row_nav">
                <div class="row_nav_list"><router-link to="#">品牌故事></router-link></div>
                <div class="row_nav_list"><router-link to="#">海鸥故事></router-link></div>
                <div class="row_nav_list"><router-link to="#">企业采购></router-link></div>
                <div class="row_nav_list"><router-link to="#">客户服务></router-link></div>
            </div>
            <div class="sub_row_list">
                <ul>
                    <li><router-link to="/detail/16"><img src="../assets/images/rotation/sub_row_list1.jpg" alt=""></router-link></li>
                    <li><router-link to="/detail/17"><img src="../assets/images/rotation/sub_row_list2.jpg" alt=""></router-link></li>
                    <li><router-link to="/detail/18"><img src="../assets/images/rotation/sub_row_list3.jpg" alt=""></router-link></li>
                </ul>
            </div>
        </div>
    </div>
</template>
<script>
import'../../public/js/swiper-3.4.2.min.js'
export default {
  data () {
    return {
      categories:[]
    }
  },
  mounted(){
    var mySwiper = new Swiper ('.swiper-container', {
    loop: true,
    // 如果需要分页器
    pagination: '.swiper-pagination',
    // 如果需要前进后退按钮
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
  });
  this.axios.get('/category').then(res=>{
      let data = res.data.results;
      this.categories = data;
  })        
  }
}
</script>

<style scoped>
@import'../../public/style/swiper-3.4.2.min.css';
    a{text-decoration: none;}
    .rotation {position: relative;width: 70%;margin: 0 auto;}
    .rotation .left_nav{
        width: 234px;height: 460px;
        position: absolute;
        top: 0;left: 0;
        z-index: 10;
        background-color: #000;
        background-color: rgba(0,0,0,0.6);
    }
    .rotation .left_nav a{color: #fff;}
    .swiper-container {
        height: 460px;
        margin: 20px auto;
        position: relative;
    }
    .swiper-container .swiper-button-next{position: absolute;right: 10px;top: 50%;}
    .swiper-container .swiper-button-next{translate:0 -50% ;}
    .swiper-button-prev{margin-left: 234px;}
    .left_nav .category-item {height: 38px;line-height: 38px;}
    .left_nav .category-item a{font-size: 14px;color: #fff;padding-left:30px;width: 200px;display: inline-block;}
    .left_nav .category-item .iconfont{float: right;}
    .left_nav .category-item:hover {background-color: #ff6700;}
    .sub_row{height: 170px;display:flex;justify-content: space-between;}
    .sub_row_nav{flex:0 0 20%;display:flex;flex-wrap:wrap;}
    .sub_row_list{flex:0 0 80%;}
    .sub_row_nav .row_nav_list{
        width: 116px;height: 85px;
        background-color: #665e57;
        text-align: center;line-height: 85px;
        border-right: 1px solid #fff;border-bottom: 1px solid #fff;}
    .sub_row_nav .row_nav_list a{color: rgba(255,255,255,0.7);font-size: 12px;}
    .sub_row_nav .row_nav_list a:hover{color: #fff;}
    .sub_row_list li{float: left;width: 33.33%;text-align: right;}
    .sub_row_list ul::after{content:"";display: block;clear: both;}
    .sub_row_list ul{overflow: hidden;}
</style>