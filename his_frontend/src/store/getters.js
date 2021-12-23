//如果有多个组件需要用到此属性，我们要么复制这个函数，
// 或者抽取到一个共享函数然后在多处导入它——无论哪种方式都不是很理想。
//
// Vuex 允许我们在 store 中定义“getter”（可以认为是 store 的计算属性）。
// 就像计算属性一样，getter 的返回值会根据它的依赖被缓存起来，且只有当它的依赖值发生了改变才会被重新计算。
//
// Getter 接受 state 作为其第一个参数：
// 根据getters可以获取到全局变量user的token，msg和type
const getters = {
  token:state=>state.user.token,
  msg:state=>state.user.msg,
  type:state=>state.user.type
};
export default getters
