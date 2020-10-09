<template>
    <div class="detail">
        <my-header></my-header>
        <div class="detail_nav">
            <div style="display:flex">
                <div class="nav_logo">
                    <img src="../assets/images/detail/logo.png">
                </div>
            </div>
            <div class="nav_search">
                <input type="search" class="input_cont" v-model="inputval">
                <input type="submit" class="seach_img" @click="search">
            </div>
        </div>
        <div class="detail_navbar">
            <div class="navbar_content">
                <router-link to="/index">首页</router-link>>
                <router-link :to="`/listcid/${data.category_id}`">{{data.category_name}}</router-link>>
                <span>{{data.title}}</span>
            </div>
        </div>
        <div class="detail_content">
            <div class="detail_img small_box"><img :src="image" width="75%"></div>
            <div class="detail_desc">
                <div class="big_box"></div>
                <div class="desc_title">
                    <p>{{data.title}}</p>
                    <div class="detail_cont">{{data.content}}</div>    
                    <div><span>【温馨提示】海鸥手表背面贴有二维码，扫码后可以查验真伪、参加积分抽奖、获得免费延保一年</span></div>
                </div>
                <div class="desc_price">
                    <p style="text-decoration: line-through;">价格: ¥{{data.old_price}}元</p>
                    <p>优惠价：<span style="color:#c50000;">¥</span><span style="font-size:26px;color:#c50000;">{{data.new_price}}元</span></p>
                    <p style="margin-top:10px;font-family:Microsoft YaHei;color:#df3033;">无需领券，已为您设置最大折扣，直接购买即可</p>
                </div>
                <div class="desc_type">
                    <p>运费<span>免运费</span></p>
                    <p>颜色<button style="padding:10px;margin-left:30px">{{data.type}}</button></p>
                    <p>数量：
                        <button class="math" @click="minus">-</button>
                        <span class="count">{{count}}</span>
                        <button class="math" @click="add">+</button>
                    </p>
                    <p>库存：{{data.count}}</p>
                </div>
                <div class="pay_cart">
                    <button>立即购买</button>
                    <button>加入购物车</button>
                </div>
                <span style="font-size: 14px;color: #df3033;">关注微信公众号：海鸥表官方商城，手机购买更方便</span>
            </div>
        </div>
        <my-footer></my-footer>
    </div>
</template>

<script>
export default {
    props:["did"],
    data(){
        return {
            inputval:'',
            data:{},
            image:'',
            count:'1'
        }
    },
    methods:{
        search(){
            this.$router.push(`/listall/${this.inputval}`)
        },
        minus(){
            if(this.count > 1){
                this.count--;
            }
        },
        add(){
            this.count++;
        }
    },
    mounted(){
        this.axios.get('/detail',{params:{did:this.did}}).then(res=>{
            let data = res.data.results;
            this.data = data[0];
            this.image = require('../../../server/public' + data[0].image);
        })
    }
}
</script>

<style scoped>
		.small_box{
			cursor: move;
		}



    a{text-decoration: none;}
    .detail_nav{width: 70%;margin: 20px auto 10px;display: flex;justify-content: space-between;}
    .detail_nav .nav_logo{margin: 0 40px;}
    .detail_nav .nav_search .input_cont{
        width: 223px;height: 48px;
        padding: 0 10px;
        border: 1px solid #e0e0e0;
        font-size: 14px;
        line-height: 48px;}
    .detail_nav .nav_search .seach_img{
        width: 52px;height: 50px;
        padding: 0 10px;
        border: 1px solid #e0e0e0;line-height: 24px;}
    .detail_navbar{background: #f5f5f5;}
    .navbar_content{width: 70%;margin: 0 auto;padding: 14px 0;color: #616161;font-size: 14px;}
    .navbar_content a{color: #616161;padding-right:10px;}
    .navbar_content a:hover{color: #333;}
    .detail_content{width: 70%;margin: 50px auto;display: flex;}
    .detail_img{width: 40%;text-align: center;padding-top:50px;}
    .detail_desc{width: 50%;margin-left: 30px;}
    .desc_title{margin: 10px 0;}
    .desc_title p{font-size: 20px;color: #666666;margin-bottom: 15px;} 
    .desc_title .detail_cont{font-size: 12px;color: #666;margin: 20px 0;}
    .desc_title div span{font-size: 12px;color: #df3033;} 
    .desc_price{width: 500px;background: #F5F5F5;padding: 15px;}
    .desc_price p{font-size: 12px;padding: 8px 0;color: #808080;}
    .desc_type p{margin-top: 20px;font-size: 12px;}
    .desc_type span:first-child{margin-left:5px;padding:2px;color:#FFFFFF;background: #EBB658;}
    .desc_type .count{padding: 2px 18px;border: 1px solid #333;margin: 0 4px;border-radius: 4px;}
    .desc_type .math{border: none;}
    .pay_cart{margin: 20px 0;}
    .pay_cart button{margin-right: 20px;padding: 12px 60px;font-size: 14px;font-weight: 600;}
    .pay_cart button:first-child{color: #ce4444;background: #FFF0F5;border: 1px solid #ce4444;}
    .pay_cart button:last-child{color: #fff;background: #a92121;border: 0;}
    
</style>