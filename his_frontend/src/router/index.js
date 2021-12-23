import Vue from 'vue'
import Router from 'vue-router'
//路由，用于跳转界面

Vue.use(Router)
export default new Router({
  mode:'history',
  routes: [
    {
      path: '/',
      component: () => import('@/views/login/login'),
      hidden: true
    },
    {path:'/404',component:()=>import("@/views/404")},
    {
      path: '/admin',
      // redirect:'/admin/regis',
      name: 'admin',
      meta:{requireAuth:true},
      component: () => import('@/views/index'),
      // component: Layout,
      children:[
        {
          path:'regis',
          name:'regis',
          meta:{requireAuth:true},
          component:()=>import('@/views/registration/regis')
        },
        {
          path:'withdraw_regis',
          name:'withdraw_regis',
          meta:{requireAuth:true},
          component:()=>import('@/views/registration/withdraw_regis')
        },
        {
          path:'pay',
          name:'pay',
          meta:{requireAuth:true},
          component:()=>import('@/views/registration/pay')
        },
        {
          path:'refund',
          name:'refund',
          meta:{requireAuth:true},
          component:()=>import('@/views/registration/refund')
        },
        {
          path:'diagnose',
          name:'diagnose',
          meta:{requireAuth:true},
          component:()=>import('@/views/doctor/diagnose')
        },
        {
          path:'medicine',
          name:'medicine',
          meta:{requireAuth:true},
          component:()=>import('@/views/medicine/medicine')
        }
      ]
    },
    {path:'*',redirect:'/404',hidden:true}
  ]
})

