// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'

// 引入分辨率自适应
//main.js中
import './utils/flexible'

//element-ui的全部组件
import ElementUI from 'element-ui'
//element-ui的css
import 'element-ui/lib/theme-chalk/index.css'
import locale from 'element-ui/lib/locale/lang/zh-CN'
import App from './App'
import router from './router'

import store from './store'
Vue.use(ElementUI,{locale})
Vue.config.productionTip = false
import '@/permission'


/* eslint-disable no-new */
//完成element-ui的引入
new Vue({
  el: '#app',
  router,
  //以 store 选项的方式“注入”该 store 的机制()
  //每一个 Vuex 应用的核心就是 store（仓库）。
  // “store”基本上就是一个容器，它包含着你的应用中大部分的状态 (state)。
  store,
  components: { App },
  template: '<App/>'
})
