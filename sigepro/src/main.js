import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import qs from 'qs'
import Myheader from './components/Myheader'
import Myfooter from './components/Myfooter'
import Rotation from './components/Rotation'
import {Message} from 'element-ui'

axios.defaults.baseURL = 'http://127.0.0.1:3000';
Vue.component('myHeader',Myheader)
Vue.component('myFooter',Myfooter)
Vue.component('rotation',Rotation)
Vue.prototype.axios = axios;
Vue.prototype.qs = qs;
Vue.prototype.message = Message;

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
