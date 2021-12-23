
<!--                   model为表单的数据对象-->
<template>
  <div class="login-container" >
    <el-main class="fulbg">
          <el-form ref="loginForm"
                   class="login-form"
                  :model="loginForm"
                  :rules="loginRules"
                   autocomplete="on" label-position="left">
            <div class="title-container">
              <h1>东软</h1>
              <h1>门诊处</h1>
            </div>
            <el-form-item prop="username">

                      <el-input
                        prefix-icon="el-icon-user"
                        ref="username"
                        v-model="loginForm.username"
                        placeholder="请输入用户名"
                        name="username"
                        type="text"
                        tabindex="1"
                        autocomplete="on"
                        show-word-limit=true
                      />
              </el-form-item>
            <el-tooltip v-model="capsTooltip" effect="dark" content="Caps lock is On" placement="right" manual>

                <el-form-item prop="password">

                        <el-input
                          prefix-icon="el-icon-lock"
                          :key="pwdType"
                          ref="password"
                          v-model="loginForm.password"
                          :type="pwdType"
                          placeholder="请输入密码"
                          name="password"
                          tabindex="2"
                          autocomplete="on"
                          @keyup.native="checkCapslock"
                          @blur="capsTooltip = false"
                          @keyup.enter.native="handlerlogin"
                        >
                          <i
                            class="el-icon-view el-input__icon"
                            slot="suffix"
                            @click="showPwd">
                          </i>
                        </el-input>


                </el-form-item>
              </el-tooltip>
            <el-row>
              <el-col :span="12">
                <el-form-item>
                  <el-select  v-model="loginForm.type" placeholder="请选择用户类别">
                    <el-option
                      v-for="item in items"
                      :key="item.id"
                      :label="item.type"
                      :value="item.id">
                    </el-option>
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item>
                  <el-button type="primary" :loading="loading" @click.native.prevent="handlerlogin" icon="el-icon-s-promotion">登录</el-button>

                </el-form-item>
              </el-col>
            </el-row>
            <div style="position:relative">
              <div class="tips">
                <span>测试用例</span>
              </div>
              <div class="tips">
                <span>医生用户名 : doctor</span>
                <span>医生密码 : 123456</span>
              </div>
              <div class="tips">
                <span style="margin-right:18px;">挂号员用户名 : operator</span>
                <span>挂号员密码 : 123456</span>
              </div>
            </div>


          </el-form>
    </el-main>


  </div>
</template>

<script>

    export default {
        name: "login",
      //设置初始化的数据
      data(){
          return{
            loginForm:{
              username:'',
              password:'',
              type:''
            },
            loginRules:{
              username:[{required:true,message:'请输入用户名',trigger:'blur'}],
              password:[{required:true,message:'请输入密码',trigger:'blur'}]
            },
            //初始化按钮的loading旋转是关闭的
            loading:false,
            pwdType:'password',
            items:[
              // {type:'管理员',id:1},
              {type:'挂号收费员',id:2},
              {type:'医生',id:3}
            ],
            capsTooltip: false
          }
      },
      methods:{
        //  对密码是否显示进行切换
        showPwd() {
          if (this.pwdType === 'password') {
            this.pwdType = ''
          } else {
            this.pwdType = 'password'
          }
          this.$nextTick(() => {
            this.$refs.password.focus()
          })
        },
        checkCapslock({ shiftKey, key } = {}) {
          if (key && key.length === 1) {
            if (shiftKey && (key >= 'a' && key <= 'z') || !shiftKey && (key >= 'A' && key <= 'Z')) {
              this.capsTooltip = true
            } else {
              this.capsTooltip = false
            }
          }
          if (key === 'CapsLock' && this.capsTooltip === true) {
            this.capsTooltip = false
          }
        },
        //选项框绑定的数据对象loginForm的属性type值为空时，未选择用户类型，需要选择。
        handlerlogin(){
          if(this.loginForm.type==""){
            this.$message.error("请选择用户类型");
            return;
          }
          this.$refs.loginForm.validate(valid=>{
            if(valid){
              //表单数据验证成功
              this.loading=true;
              //调用'Login'的action，用于对state状态变量的改变
              this.$store.dispatch('Login',this.loginForm).then(()=>{
                this.loading=false;
                this.$router.push({path:'/admin/regis'})
              }).catch(error=>{
                this.loading = false
              })
            }else {
              console.log('参数验证不合法！');
              return false
            }
          })
        }
      }
    }
</script>

<style lang="scss" scoped >
  $bg:#2d3a4b;
  $dark_gray:#889aa4;
  $light_gray:#eee;
.font{
  font-family:Arial, Helvetica, sans-serif;
  font-size:45px;
  color: #c80be6;
  line-height:35px;
  text-transform:uppercase
}

  h1 {
    position: relative;
    margin-bottom: 20px;
    font-family: 'Audiowide';
    text-align: center;
    color: #ffffff;
    font-size: 4em;
    font-weight: normal;
    -webkit-transition: all 1.5s ease;
    transition: all 1.5s ease;

    -webkit-animation: Glow 1.5s ease infinite alternate;
    animation: Glow 1.5s ease infinite alternate;

  }


  @-webkit-keyframes Glow {
    from {
      text-shadow: 0 0 7px #fff,
      0 0 10px #fff,
      0 0 20px #fff,
      0 0 30px #0ea5fd,
      0 0 40px #0ea5fd,
      0 0 50px #0ea5fd,
      0 0 60px #0ea5fd,
      0 0 80px #0ea5fd;
    }
    to {
      text-shadow: 0 0 3px #fff,
      0 0 7px #fff,
      0 0 10px #fff,
      0 0 15px #0ea5fd,
      0 0 30px #0ea5fd,
      0 0 35px #0ea5fd,
      0 0 40px #0ea5fd,
      0 0 50px #0ea5fd;
    }
  }

  @keyframes Glow {
    from {
      text-shadow: 0 0 7px #fff,
      0 0 10px #fff,
      0 0 20px #fff,
      0 0 30px #0ea5fd,
      0 0 40px #0ea5fd,
      0 0 50px #0ea5fd,
      0 0 60px #0ea5fd,
      0 0 80px #0ea5fd;
    }
    to {
      text-shadow: 0 0 3px #fff,
      0 0 7px #fff,
      0 0 10px #fff,
      0 0 15px #0ea5fd,
      0 0 30px #0ea5fd,
      0 0 35px #0ea5fd,
      0 0 40px #0ea5fd,
      0 0 50px #0ea5fd;
    }
  }


  .fulbg{
    position: relative;
  margin:0;
  height: 900px;
    width: 100%;
  background: url(../../assets/bg1.png) no-repeat;
  background-size: 100%;
  background-attachment: fixed;
}

.login-from-layout{
  width:470px;
  height: 400px;
  position: relative;
  margin: 140px auto;
  border-top: 10px solid rgb(15, 245, 46);
  border-left:0px;
  border-right: 0px;
  border-bottom: 0px;
}

.login-container {
  min-height: 100%;
  width: 100%;
  background-color: $bg;
  overflow: hidden;

.login-form {
  position: absolute;
  width: 400px;
  max-width: 100%;
  padding: 50px 0;
  margin: 0 30px 0px 1000px;
  border-right: 20px;
}

.tips {
  font-size: 14px;
  color: #fff;
  margin-bottom: 10px;

span {
&:first-of-type {
   margin-right: 16px;
 }
}
}



.title-container {
  position: relative;
  /*width: 500px;*/
  margin: 100px auto 0;
  font-weight: lighter;
}

.show-pwd {
  position: absolute;
  right: 10px;
  top: 7px;
  font-size: 16px;
  color: $dark_gray;
  cursor: pointer;
  user-select: none;
}

.thirdparty-button {
  position: absolute;
  right: 0;
  bottom: 6px;
}

@media only screen and (max-width: 470px) {
  .thirdparty-button {
    display: none;
  }
}
}
</style>
