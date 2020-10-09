<template>
    <div class="register">
        <div class="main_container">
            <div class="main_box">
                <div class="logo_area">
                    <img src="../assets/images/register/logo.png" alt="">
                </div>
                <div class="title-item">
                    <h4 class="title_big30">注册海鸥帐号</h4>如果您拥有海鸥账号，则可在此
                    <router-link to="/login"><span style="color:red;">登录</span> </router-link>         
                </div> 
                <div class="regbox">
                    <div class="inputbg">
                        <label class="labelbox">
                            <input type="text" v-model="email" placeholder="请输入邮箱" @blur="checkEmail">
                        </label>
                    </div>
                    <div :class="email_class">
                        <span>{{email_class.msg}}</span>
                    </div>
                    <div class="inputbg">
                        <label class="labelbox">
                            <input type="tel" maxlength="11" v-model="phone" placeholder="请输入手机号码" @blur="checkPhone">
                        </label>
                    </div>
                    <div :class="phone_class" >
                        <span>{{phone_class.msg}}</span>
                    </div>
                    <div class="inputbg">
                        <label class="labelbox">
                            <input type="password" maxlength="16" v-model="password" placeholder="请输入密码" @blur="checkPassword">
                        </label>
                    </div>
                    <div :class="password_class" >
                        <span>{{password_class.msg}}</span>
                    </div>
                    <div class="inputbg">
                        <label class="labelbox">
                            <input type="password" maxlength="16" v-model="conpassword" placeholder="请再次输入密码" @blur="checkConpassword">
                        </label>
                    </div>
                    <div :class="conpassword_class">
                        <span>{{conpassword_class.msg}}</span>
                    </div>
                    <div class="inputbg inputcode">
                        <label class="labelbox">
                            <input class="code" type="text" id="verify" maxlength="4" autocomplete="off" placeholder="图片验证码">
                        </label>
                        <img alt="图片验证码" title="看不清换一张" id="verify_img" src="/index/verify.html" width="125" height="42" style="margin-bottom: -17px;cursor:pointer">
                    </div>
                    <div class="err_tip_ver" style="display:none">
                        <div class="dis_box"><em class="icon_error"></em><span id="ver_error"></span></div>
                    </div>
                    <div class="reg_bt">
                        <button @click="regist">立即注册</button>
                    </div>
                </div>
            </div>
        </div> 
    </div>
</template>

<script>
    export default{
        data(){
            return {
                email:'',
                phone:'',
                password:'',
                conpassword:'',
                email_class:{
                    error:false,
                    msg:''
                },
                phone_class:{
                    error:false,
                    msg:''
                },
                password_class:{
                    error:false,
                    msg:''
                },
                conpassword_class:{
                    error:false,
                    msg:''
                },
            }
        },
        methods:{
            //验证邮箱
            checkEmail(){
                if(this.email !== ''){
                    let reg  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                    if (reg.test(this.email)){
                        return true;
                    }else{
                        this.email_class = {
                            error:true,
                            msg:'您的电子邮件格式不正确'
                        }
                        return false;
                    }
                }
            },
            //验证手机
            checkPhone(){
                if(this.phone !== ''){
                    let reg = /^1[3,5,8,7]\d{9}$/;
                    if (reg.test(this.phone)){
                        return true;
                    }else{
                        this.phone_class = {
                            error:true,
                            msg:'您的手机格式不正确'
                        }
                        return false;
                    } 
                }
            },
            //验证密码
            checkPassword(){
                if(this.password !== ''){
                    let reg = /^[0-9a-zA-Z\w]{8,20}$/;
                    if (reg.test(this.password)){
                        return true;
                    }else{
                        this.password_class = {
                            error:true,
                            msg:'您的密码不正确'
                        }
                        return false;
                    }
                }
            }, 
            //验证确认密码
            checkConpassword(){
                if(this.checkPassword !== ''){
                    if (this.conpassword === this.password){
                        return true;
                    }else{
                        this.conpassword_class = {
                            error:true,
                            msg:'两次密码不一致'
                        }
                        return false;
                    } 
                }
            },
            //注册功能
            regist(){
                if(this.checkEmail() && this.checkPhone() && this.checkPassword() && this.checkConpassword()){
                    let params = this.qs.stringify({"email":this.email,"phone":this.phone,"password":this.password});
                    console.log(params);
                    this.axios.post('/regist',
                        params,{headers:{'Content-Type':'application/x-www-form-urlencoded'}}).then(res=>{
                            if(res.data.code == 1){
                                this.$router.push('/index')
                                return this.message.success('注册成功');
                            }else{
                                return this.message.error('注册失败：邮箱或手机号已注册')
                            }
                    })
                }
            }
        }
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxxxx
</script>

<style scoped>
    .error{
        color: #ff6700;
        font-size: 12px;
    }
    .register{background-color: rgba(14, 12, 12, 0.075);color: #666;height: 1000px;border: 1px solid rgba(14, 12, 12, 0.075);}
    .register a{text-decoration: none;}
    .register .main_container{
        background-color: rgb(255, 255, 255);
        padding-top: 50px;
        padding-bottom: 50px;
        width: 50%;
        box-sizing: border-box;
        margin: 100px auto;}
    .register .logo_area{margin:20px auto 30px;width: 115px;}
    .register .main_box{margin: 0 auto;width: 50%;}
    .register .title-item{text-align: center;font-size: 12px;}
    .register .title_big30{font-size: 30px;font-weight: normal;margin-bottom: 10px;color: #000;}
    .register .regbox{padding: 30px 0;line-height: 20px;margin: 0 auto;width: 70%;}
    .regbox .inputbg{padding-bottom: 15px;line-height: 20px;width: 100%;}
    .regbox .labelbox input{padding: 10px 0 10px 10px;width: 100%;height: 20px;display: inline-block;outline: none;font-size: 12px;border: 1px solid rgb(216, 211, 211);}
    .regbox .inputcode input{width: 60%;}
    .regbox .reg_bt button{width: 100%;padding: 10px 0 10px 0;font-size: 14px;color: #fff;background-color: #ff6700;outline: none;border: none;}
</style>