// @是webpack设置的路径别名，代表什么路径，
// 要看webpack的build文件夹下webpack.base.conf.js里面对于@是如何配置
// 我配置为‘src’
import request from '@/utils/request'
//关于登录的
export function login(type,username,password){
  return request({
    url:'/admin/login',
    method:'post',
    data:{
      username,
      password,
      type
    }
  })
}

export function getInfo(username){
  return request({
    url:'/admin/getInfo?username='+username,
    method:'get'
  })
}

export function logout(){
  return request({
    url:'/admin/logout',
    method:'get'
  })
}
