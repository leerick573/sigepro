<template>
    <div class="login">
        <div class="headerwrap">
            <div class="header">
                    <router-link to="/">
                        <img src="../assets/images/login/logo.png">
                    </router-link>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="login_box">
                    <h3>
                        会员登录&nbsp;&nbsp;|&nbsp;&nbsp;<span>扫描登录</span>
                    </h3>
                    <div>
                        <input type="text" v-model="name" placeholder="邮箱">
                    </div>
                    <div>
                        <input type="password" v-model="password" placeholder="密码">
                    </div>
                    <div class="a_rigth">
                        <router-link to="/">？忘记密码</router-link>
                    </div>
                        <button @click="login">登录</button>
                    <div class="a_rigth">
                        <router-link to="/register">还没帐号？马上注册吧！</router-link>
                    </div>
                </div>
                <div class="login_img">
                    <img src="../assets/images/login/picture.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
    *{margin: 0;padding: 0;}
    a{text-decoration-color: #666;font-size: 10px;color: #666;}
    .headerwrap{background-color: rgb(248,249,250);padding: 30px 0;}
    .main{background: -webkit-gradient(linear, 0% 0%, 0% 100%,from(#fefefe), to(#dbdbdb));
    background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#fefefe), to(#dbdbdb));
    background: -webkit-linear-gradient(top, #fefefe, #dbdbdb);
    padding: 60px 150px;}
    .header,.content{width: 80%;margin: 0 auto;display: flex;}
    .login_box h3{font-size: 18px;margin-bottom: 35px;color: #898989;font-weight: normal;}
    .login_box input{
        width: 356px;
        height: 46px;
        line-height: 46px;
        background: #d0d0d0;
        margin: 0 0 40px 0;
        color: #898989;
        padding-left: 15px;
        font-size: 12px;
        border-radius: 5px;
        border: 1px solid #cfcfcf;
        border-top: 1px solid #696969;
        outline: none;
    }
    .login_box .a_rigth a{
        float: left;
        margin: 5px 55px 0 0;
        text-decoration: underline;
        color: #898989;
        width: 373px;
        text-align: right;
        cursor: pointer;
    }
    .login_box button{
        background: url(../assets/images/login/bt.png) no-repeat;
        width: 373px;
        height: 47px;
        display: block;
        color: #fff;
        cursor: pointer;
        text-align: center;
        border: none;
        font-size: 18px;
        font-weight: 600;
        margin: 30px 0 20px 0;
        outline: none;
    }
</style>

<script>
import Cookie from 'js-cookie'
export default {
    data(){
        return {
            name:'1067346925@qq.com',
            password:'justdoit.573'
        }
    },
    methods:{
        login(){
            var _this = this
            this.axios.get('/login',{params:{"name":this.name,"password":this.password}}).then(res=>{
                if(res.data.code === 1){
                    this.$router.push('/index')
                    return this.message.success('登录成功')
                }else{
                    return this.message.error('登录失败：用户名或密码错误')
                }
            })
        }
    }
}
</script>