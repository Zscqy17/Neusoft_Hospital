<!-- views/index.vue : 登录后的主页面-->

<template>
    <div>
        <el-container style="height: 762px;" class="fulbg1">
          <transition name="el-zoom-in-center" style="" >
            <div :style="hei">
              <div style="width:250px; height: 50px; padding-top: 10px; color: rgb(0, 0, 0)" class = "menu" v-show="!doc"  ><div>{{usertype}}</div><div>请点击选择功能</div></div>
              <el-aside v-show="!doc"  class = "menu" style="opacity:0.6;" >
                <el-menu style="margin-top:0px;" default-active="1" :collapse="show" :router=true class = "menu">

                  <el-menu-item style="font-size: x-large"  v-show="med" v-for="(item,i) in navList" :key="i" :index="item.url" :class="$route.path==item.url?'is-active':''">
                    <i :class="item.icon"></i>
                      {{item.name}}
                  </el-menu-item>
                  <el-submenu index='2' v-show="doc" >
                    <template slot="title">
                      <i class="el-icon-chat-dot-round"></i>
                      <span>医生看诊</span>
                    </template>
                    <el-menu-item v-for="(item,i) in docList" :key="i" :index="item.url">
                      {{item.name}}
                    </el-menu-item>
                  </el-submenu>
                  <el-menu-item  style="font-size: x-large"  :index="dispenseUrl" v-show="med" :class="$route.path=='/admin/medicine'?'is-active':''">
                    <i class="el-icon-s-check"></i>
                      发药
                  </el-menu-item>
                </el-menu>

              </el-aside>
              <img src="../assets/bg5.png" style="margin-top: 0"/>
            </div>
          </transition>

          <el-container>
<!--            上方的标题栏-->
            <el-header style="text-align: right; font-size: 35px ;background-color: #5182c3; height: 50px;box-shadow: 0 4px 8px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0,0, .12)" >
              <el-row style="margin-top: 0px;" >
                <el-col :span="2">
                    <div  @click="show = !show" class="grid-content" style="margin-top:3px; text-align:left;">
                      <div class="el-icon-sunny" style="color:orange;text-align:left"></div>
                    </div>
                </el-col>

                <el-col :span="6" >
                  <div  style="color: rgb(254, 247, 240); font-size:15px; text-align:left; margin-top: 14px;">您好~</div>
                </el-col>

                <el-col :span="8" >
                  <div  style="color: rgb(254, 247, 240); font-size:30px; text-align:center; margin-top: 6px; box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04)">东软门诊处</div>
                </el-col>
                <el-col :span="8" >
                  <div  class="grid-content" style="text-align:right; position: relative;">

                    <el-dropdown>
                      <span>
                          <el-avatar  icon="el-icon-user" style="background-color: rgb(184, 203, 243);margin-top: 10px">
                          </el-avatar>
                      </span>

                          <el-dropdown-menu slot="dropdown">
                            <el-dropdown-item>
                              <div v-on:click="logout">退出</div>
                            </el-dropdown-item>
                          </el-dropdown-menu>
                    </el-dropdown>
                  </div>
                </el-col>
              </el-row>

            </el-header>
            <el-main class="fulbg" >
              <transition name="el-zoom-in-bottom">
                <router-view/>
              </transition>
            </el-main>
          </el-container>
        </el-container>
    </div>
</template>

<script>
import {Message} from 'element-ui'
import {removeToken} from '@/utils/auth'
export default {
    name: "main",
    data(){
      return{
        usertype:"",
        name:"",
        show:false,
        reg:false,
        doc:false,
        med:false,
        hei:{
          height:"100px"
        },
        navList:[
          {url:'/admin/regis',name:"挂号",icon:"el-icon-position"},
          {url:'/admin/withdraw_regis',name:"退号",icon:"el-icon-refresh-right"},
          {url:'/admin/pay',name:"收费",icon:"el-icon-s-finance"},
          // {url:'/admin/refund',name:"退费",icon:"el-icon-document-delete"}
        ],
        dispenseUrl:'/admin/medicine',
        docList:[
          {url:'/admin/diagnose',name:"看诊"},
          {url:'/admin/prescription',name:'开药'}
        ]
      }
    },
    created(){
      this.name = localStorage.getItem("type");
      console.log(this.name);
    },
    methods:{
      logout(){
        this.$store.dispatch('LogOut').then(()=>{
            this.$router.push({path:'/'});
          }).catch((error)=>{
              console.log("退出登录失败")
        })
      }
    },
    mounted:function(){
        this.usertype = this.$store.getters.type
        this.reg=(this.usertype=='挂号收费员')
        this.doc=(this.usertype=='医生')
        if(this.usertype=='医生'){
          this.$router.push({path:'/admin/diagnose'})
          this.hei="100px"
        }else{
          this.hei=""
        }
        this.med=(this.usertype=='挂号收费员')
    }
}
</script>

<style scoped>

  el-aside{
    width:250px;
  }
.menu{
  background-color: #bcd2f7;
}
  .el-row {
    margin-top: 10px;
  }
  .el-col {
    border-radius: 4px;
  }

  .grid-content {
    border-radius: 4px;

  }
  .fulbg{
    border-left:0px; padding: 5px 40px 0px 80px;
  background: url(../assets/bg3.png) no-repeat;
    background-size: 100%;


}


.fulbg1{

  background: url(../assets/bg2.png) no-repeat;
  background-size: 100%;
}



</style>
