import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login'
import Register from '../views/Register'
import Index from '../views/Index'
// import Detail from '../views/Detail'//不要用import过早引入需要懒加载的页面,并且路由字典也需要改变

Vue.use(VueRouter)

const routes = [
  {
    path:'/listall/:value',
    component:() => import(/*webpackChunkName:"detail"*/'../views/Listall'),
    props:true
  },
  {
    path:'/listcid/:cid',
    component:() => import(/*webpackChunkName:"detail"*/'../views/Listcid'),
    props:true
  },
  {
    path:'/detail/:did',
    //临时调用detail页面 
    component:() => import(/*webpackChunkName:"detail"*/'../views/Detail'),
    props:true
  },
  {
    path:'/index',
    component:Index
  },
  {
    path:'/register',
    component:Register
  },
  {
    path:'/login',
    component:Login
  }
]

const router = new VueRouter({
  routes,
  mode:'history'  // history 模式
})

export default router
