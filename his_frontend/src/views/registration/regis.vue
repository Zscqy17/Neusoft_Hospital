<template>
    <div>
      <el-row style="margin-bottom: 10px;">
        <el-col :span="4">

        </el-col>
      </el-row>
<!--      将表单和数据对象绑定-->
        <el-form   ref="form" :model="form" :rules="formRules"  label-width="100px" >

            <el-row>
                    <el-col :span="7">
                        <el-form-item label="病历号">
                            <el-autocomplete   popper-class="my-autocomplete" placeholder="输入病历号查找" v-model="form.medicalNum" :fetch-suggestions="querySearch"
                            @select="getPatientMsg" :disabled="canEdit">
                                <i  class="el-icon-edit el-input__icon"
                                    slot="suffix">
                                </i>
                                <template slot-scope="{ item }">
                                    <div class="name">{{ item.inde }}</div>
                                </template>
                            </el-autocomplete>
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="挂号ID">
                            <el-input
                                placeholder="待显示"
                                v-model="form.registNum"
                                :disabled="true">
                            </el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item  label="发票号">
                            <el-input
                                placeholder="待显示"
                                v-model="form.invoiceNum"
                                :disabled="true">
                                </el-input>
                        </el-form-item>
                    </el-col>
            </el-row>
            <el-row>

                    <el-col :span="7">
                        <el-form-item label="姓名" prop="name">
                            <el-input v-model="form.name" placeholder="请输入内容" style="width:130px;"></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="性别" prop="gender" >
<!--                          <el-radio v-model="radio" label="1" border><i class="el-icon-male"></i>男</el-radio>-->
<!--                          <el-radio v-model="radio" label="2" border><i class="el-icon-female"></i>女</el-radio>-->

                            <el-radio-group v-model="form.gender">
                              <i class="el-icon-male"></i>
                              <i class="el-icon-female"></i>
                                <el-radio v-for="item in baseData.gender" v-bind:key="item.inde" :label="item.inde" border>{{item.label}}</el-radio>
                            </el-radio-group>
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="年龄" prop="age">
                                <el-input v-model="form.age" placeholder="请输入内容">
                                </el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="4" v-show=false>
                        <el-form-item style="">
                            <el-select v-model="form.ageType" placeholder="岁">
                                <el-option v-for="item in baseData.ageType" v-bind:key="item.label" :label="item.label" :value="item.label"></el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>

            </el-row>
            <el-row>

                    <el-col :span="7">
                        <el-form-item label="出生日期" prop="birthday">
                            <el-date-picker
                                v-model="form.birthday"
                                type="date"
                                value-format="yyyy-MM-dd"
                                placeholder="选择日期" @change="getage">
                            </el-date-picker>
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="身份证号" prop="idNumber">
                            <el-input
                            type="text"
                            placeholder="请输入内容"
                            v-model="form.idNumber"
                            maxlength="18"
                            show-word-limit
                            >
                            </el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="家庭住址" prop="address">
                            <el-input type="text" v-model="form.address"></el-input>
                        </el-form-item>
                    </el-col>
            </el-row>
            <el-row>

                    <el-col :span="7">
                        <el-form-item label="结算类别" prop="settlementType">
                            <el-select v-model="form.settlementType" placeholder="请选择结算类别">
                                <el-option v-for="item in baseData.settlementType" v-bind:key="item.label" :label="item.label" :value="item.label"></el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="看诊日期" prop="date1">
                            <el-date-picker
                                v-model="form.date1"
                                type="date"
                                value-format="yyyy-MM-dd"
                                placeholder="选择日期">
                            </el-date-picker>
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="午别" prop="apm">
                            <el-select v-model="form.apm" placeholder="请选择午别">
                                <el-option v-for="item in baseData.apm" v-bind:key="item.label" :label="item.label" :value="item.label"></el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>

            </el-row>
            <el-row>

                    <el-col :span="7">
                        <el-form-item label="号别" prop="regType">
                            <el-select v-model="form.regType" placeholder="请选择挂号级别" @change="getDocList">
                                <el-option v-for="item in baseData.regType" v-bind:key="item.inde" :label="item.label" :value="item.inde"></el-option>
                            </el-select>

<!--                          /////////////////////////////-->

<!--                          <el-select v-model="value" placeholder="请选择挂号级别">-->
<!--                            <el-option-->
<!--                              v-for="item in options"-->
<!--                              :key="item.value"-->
<!--                              :label="item.label"-->
<!--                              :value="item.value">-->
<!--                            </el-option>-->
<!--                          </el-select>-->
<!--                          ////////////////////////////////////-->
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="科室" prop="depName">
                            <el-select  filterable v-model="form.depName" placeholder="请选择科室" @change="getDocList">
                                <el-option v-for="item in baseData.depMsg" v-bind:key="item.label" :label="item.label" :value="item.inde"></el-option>
                            </el-select>

                          <!--                          ////////////////////////////////////-->
<!--                          <el-select v-model="value1" placeholder="请选择科室名称">-->
<!--                            <el-option-->
<!--                              v-for="item in options1"-->
<!--                              :key="item.value1"-->
<!--                              :label="item.label"-->
<!--                              :value="item.value1">-->
<!--                            </el-option>-->
<!--                          </el-select>-->

                          <!--                          ////////////////////////////////////-->


                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="医生" prop="docName">
                            <el-select v-model="form.docName" placeholder="请选择医生姓名" @change="getLeft">
                                <el-option v-for="item in baseData.docList" v-bind:key="item.inde" :label="item.label" :value="item.inde"></el-option>
                            </el-select>

                          <!--                          ////////////////////////////////////-->
<!--                          <el-select v-model="value2" placeholder="请选择医生姓名">-->
<!--                            <el-option-->
<!--                              v-for="item in options2"-->
<!--                              :key="item.value2"-->
<!--                              :label="item.label"-->
<!--                              :value="item.value2">-->
<!--                            </el-option>-->
<!--                          </el-select>-->
                          <!--                          ////////////////////////////////////-->

                        </el-form-item>
                    </el-col>

            </el-row>
            <el-row>

                    <el-col :span="7">
                        <el-form-item label="初始号额">
                            <el-input
                                placeholder="待显示"
                                v-model="form.initNum"
                                :disabled="true">
                                </el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="已用号额">
                            <el-input
                                placeholder="待显示"
                                v-model="form.left"
                                :disabled="true">
                                </el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="病历本" prop="medicalRecord">
                            <el-switch
                                v-model="form.medicalRecord"
                                active-color="#71eba6"
                                @change="plusfee"
                                inactive-color="#D5D5D5">
                            </el-switch>
                        </el-form-item>
                    </el-col>

            </el-row>
            <el-row>

                    <el-col :span="7">
                        <el-form-item label="应收金额" prop="fee">
                            <el-input
                                placeholder="待显示"
                                v-model="form.fee"
                                :disabled="true">
                            </el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="收费方式" prop="chargeType">

                            <el-select  filterable v-model="form.chargeType" placeholder="选择收费方式">
                                <el-option v-for="item in baseData.chargeType" v-bind:key="item.label" :label="item.label" :value="item.inde"></el-option>
                            </el-select>

                          <!--                          ////////////////////////////////////-->
<!--                          <el-select v-model="value3" placeholder="选择收费方式">-->
<!--                            <el-option-->
<!--                              v-for="item in options3"-->
<!--                              :key="item.value3"-->
<!--                              :label="item.label"-->
<!--                              :value="item.value3">-->
<!--                            </el-option>-->
<!--                          </el-select>-->
                          <!--                          ////////////////////////////////////-->
                        </el-form-item>
                    </el-col>


            </el-row>
          <el-row :gutter="10">
            <el-col :span="7">
              <div style="color: #ffffff;">-</div>
            </el-col>
            <el-col :span="3">
              <el-form-item size="large">
                <el-button type="primary" @click.native.prevent="onSubmit">挂号</el-button>
              </el-form-item>

            </el-col>
            <el-col :span="3">
              <el-form-item size="large">
                <el-button  type="danger" v-on:click="clearmsg">清空</el-button>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>

    </div>
</template>
<script>
import {getdoclist,getrequiremsg,getpatientmsg,getleft,regis} from '@/api/registration'
export default {
    name:"regis",
    data(){
        return{


            radio: '1',
          options: [{
            value: '选项1',
            label: '普通号'
          }, {
            value: '选项2',
            label: '专家号'
          }, {
            value: '选项3',
            label: '主任号'
          }],
          value: '',

          options1: [{
            value1: '选项1',
            label: '心血管内科'
          }, {
            value1: '选项2',
            label: '皮肤科'
          }, {
            value1: '选项3',
            label: '外科'
          }],
          value1: '',

          options2: [{
            value2: '选项1',
            label: '雷神山医生'
          }, {
            value2: '选项2',
            label: '火神山医生'
          }, {
            value2: '选项3',
            label: '钟南山医生'
          }],
          value2: '',

          options3: [{
            value3: '选项1',
            label: '现金'
          }, {
            value3: '选项2',
            label: '信用卡'
          }, {
            value3: '选项3',
            label: '微信支付'
          }],
          value3: '',

            canEdit:false,
            form:{
                gender:"",
                regType:"",
                depName:"",
                docName:"",
                medicalNum:'',
                name:"",
                ageType:"岁",
                age:"",
                birthday:"",
                idNumber:"",
                address:"",
                settlementType:"",
                date1:"",
                apm:"",
                initNum:"",
                left:"",
                medicalRecord:false,
                fee:"",
                chargeType:"",
                registNum:"",
                invoiceNum:"",
                registor:""
            },
            //表单的校验规则
            formRules:{
                gender:[{required:true,message:'该内容不能为空',trigger:'blur'}],
                regType:[{required:true,message:'该内容不能为空',trigger:'blur'}],
                name:[{required:true,message:'该内容不能为空',trigger:'blur'}],
                depName:[{required:true,message:'该内容不能为空',trigger:'blur'}],
                docName:[{required:true,message:'该内容不能为空',trigger:'blur'}],
                age:[{required:true,message:'该内容不能为空',trigger:'blur'}],
                birthday:[{required:true,message:'该内容不能为空',trigger:'blur'}],
                idNumber:[{required:true,message:'该内容不能为空',trigger:'blur'}],
                address:[{required:true,message:'该内容不能为空',trigger:'blur'}],
                settlementType:[{required:true,message:'该内容不能为空',trigger:'blur'}],
                date1:[{required:true,message:'该内容不能为空',trigger:'blur'}],
                apm:[{required:true,message:'该内容不能为空',trigger:'blur'}],
                chargeType:[{required:true,message:'该内容不能为空',trigger:'blur'}]
            },
            baseData:{
            "gender": [],
            "regType": [],
            "depMsg": [],
            "docList": [],
            "medicalNum":[],
            "ageType":[
              {"label":"岁"},
              {"label":"月"}
            ],
            "settlementType":[
              {"label":"自费"},
              {"label":"医保"},
              {"label":"新农合"},
              {"label":"公费"}
            ],
            "apm":[
              {"label":"上午"},
              {"label":"下午"}
            ]
          }
        }
    },

      // "regType":
      // [{"inde": 1,
      //   "fee": 50,
      //   "label": "专家号",
      //   "limi": 20}]

    methods:{
      plusfee(val){
        if(val){
          this.form.fee+=1
        }else{
          this.form.fee-=1
        }
      },
        onSubmit(){
          if(this.form.idNumber.length<18){
            this.$message.error("身份证号长度应为18位")
            return;
          }
          if( new Date(this.form.birthday)>new Date()){
            this.$message.error("出生日期不能超前,请重选出生日期")
            return;
          }
          if(new Date(this.form.date1)>new Date()){
            this.$message.error("看诊日期不能超前，请重选看诊日期")
            return;
          }

            //获取医生ID
            this.form.registor = this.$store.state.user.id;
            this.$refs.form.validate(validate=>{
                if(validate){
                    //form表单请求后端网址
                    regis(this.form).then(response=>{
                            //获取后端传来的数据
                            var data = response.data;
                            //更新挂号ID
                            this.form.registNum =data.registNum;
                            //更新病历号
                            this.form.medicalNum = data.medicalNum.toString();
                            //更新发票号
                            this.form.invoiceNum = data.invoiceNum;
                            //用于提示的模态框
                            this.$alert(this.form.name+'\n挂号ID为：'+data.registNum+'\n发票号为：'+data.invoiceNum+'\n病历号: '+data.medicalNum,
                            '挂号成功',{
                            confirmButtonText: '确定',
                            callback: action => {
                                this.$message({
                                type: 'success',
                                message: `确认成功`
                                });
                            }
                            });
                    }).catch(error=>{
                        alert(error.message)
                    })
                }
            })
        },
        getLeft(){
            getleft(this.form.docName).then(response=>{
                this.form.left = response.data;
            }).catch(error=>{
                alert(error.message)
            })
        },
        getDocList(){
            if(this.form.depName==""||this.form.regType==""){
                return
            }
            if(this.form.regType!==""){
                var a= this.baseData.regType
                .filter((te)=>{return te.inde===this.form.regType;})[0];
                this.form.initNum  = a.limi;
                this.form.fee = a.fee;
            }
            getdoclist(this.form.depName,this.form.regType).then(response=>{
                var data = response.data;
                this.baseData.docList = data;
            }).catch(error=>{
                alert(error.message);
            })
        },
        getPatientMsg(item){
            this.form.medicalNum = item.inde;
            getpatientmsg(item.inde).then(response=>{
                var data = response.data;
                this.form.name = data.name;
                this.form.gender = data.gender;
                this.form.birthday = data.birthday;
                this.form.idNumber = data.idNumber;
                this.form.address = data.address;
                this.getage();
            }).catch(error=>{
                alert(error.message)
            })
        },
        querySearch(queryString,cb){
        var medicalNums = this.baseData.medicalNum;
        var results = queryString? medicalNums.filter(
          (str)=>{
            return (str.inde.toString().indexOf(queryString))===0;
          }
        ):medicalNums;
        //调用callback返回建议列表数据
        results.forEach(e=>{
          e.inde = e.inde.toString()
        })
        cb(results);
      },
        clearmsg(){
            for(var key in this.form){
                this.form[key]='';
            }
            this.form["medicalRecord"]=false;
            this.form["ageType"]="岁";
        },
        getage() {
                var birthdays = new Date(this.form.birthday.replace(/-/g, "/"));
                var d = new Date();
                var age =
                    d.getFullYear() -
                    birthdays.getFullYear() -
                    (d.getMonth() < birthdays.getMonth() ||
                    (d.getMonth() == birthdays.getMonth() &&
                    d.getDate() < birthdays.getDate())
                    ? 1
                    : 0);
                this.form.age= age;
            }
    },
    mounted(){
        getrequiremsg().then(response=>{
            var data = response.data;
            this.baseData.gender = data.gender;
            this.baseData.regType = data.regType;
            this.baseData.depMsg = data.depMsg;
            this.baseData.medicalNum=data.medicalNum;
            this.baseData.chargeType=data.chargeType;
        })

    }
}
</script>
<style >
  .el-form-item {
    font-size: 50px;
  }
</style>
