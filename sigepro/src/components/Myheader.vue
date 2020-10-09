<template>
    <div class="header">
        <div class="header_img">
            <img src="../assets/images/header/head.jpg">
        </div>
        <div class="header_nav">
                    <div class="nav_content">
            <div class="nav_left">
                <ul>
                    <li><a href="#">海鸥商城</a></li>
                    <li><a href="#">海鸥官网</a></li>
                    <li><a href="#">微信商城</a></li>
                    <li><a href="#">售后维修</a></li>
                    <li><a href="#">咨询热线: 400-667-0088</a></li>
            </ul>
            </div>
            <div class="nav_right">
                <ul>
                    <li><a href="#">访问手机版</a></li>
                    <li>
                        <ul>
                            <li><router-link to="/login">登录</router-link></li>
                            <li><router-link to="/register">注册</router-link></li>
                        </ul>
                    </li>
                    <li class="cart"><a href="#">购物车(0)</a></li>
                </ul>
            </div>
        </div>
        </div>

    </div>
</template>

<style scoped>
    .header_nav{background-color: #333;}
    .nav_content:after{
        content: '';
        display: block;
        clear: both;
    }
    .nav_content{width: 70%;margin: 0 auto;}
    .nav_content ul{height: 40px;margin: 0;}
    .nav_content .nav_left{float: left;}
    .nav_content .nav_right{float: right;}
    .nav_content li{float: left;line-height: 40px;margin-left: 20px;}
    .nav_content li:first-child{margin-left: 0;}
    .nav_content li a{font-size: 12px;color: rgba(255,255,255,0.7);text-decoration: none;}
    .nav_content li a:hover{color: #fff;}
    .nav_content .nav_right .cart{padding: 0 30px;background-color: #424242;}
</style>

