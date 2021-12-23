import Vue from 'vue'
import Vuex from 'vuex'
import user from './modules/user'
import getters from './getters'
Vue.use(Vuex);

//在不同路由中使用同一个会改变的参数，全局参数store
//这里我们的全局变量是user，函数是getters,用于获取全局变量的属性token,msg,type
//这里相应的actions，mutation都写在user.js中
const store = new Vuex.Store({
  modules:{
    user
  },
  getters
});

export default store
