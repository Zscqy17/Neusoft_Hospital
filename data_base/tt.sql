/*看诊状态
1：待诊
2：已诊
3：已退号
4：诊毕

处方状态
0：暂存
1：已开立
2：已付款
3：已取药
4：待退款
5：已退款
6：已作废*/




create schema tt;
use tt;


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `const_cata`
-- ----------------------------
DROP TABLE IF EXISTS `const_cata`;
CREATE TABLE `const_cata` (
  `﻿const_cata_id` int(11) NOT NULL,
  `const_cata_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `const_cata_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`﻿const_cata_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of const_cata
-- ----------------------------
INSERT INTO `const_cata` VALUES ('1', 'DeptCategory', '科室分类', '1');
INSERT INTO `const_cata` VALUES ('5', 'FeeType', '收费方式', '1');
INSERT INTO `const_cata` VALUES ('7', 'Gender', '性别类型', '1');
INSERT INTO `const_cata` VALUES ('8', 'DocTitle', '医生职称', '1');
INSERT INTO `const_cata` VALUES ('10', 'Drugs_Type', '药品类型', '1');
INSERT INTO `const_cata` VALUES ('11', 'Drugs_Dosage', '药品剂型', '1');

-- ----------------------------
-- Table structure for `const_item`
-- ----------------------------
DROP TABLE IF EXISTS `const_item`;
CREATE TABLE `const_item` (
  `const_id` int(11) NOT NULL,
  `const_cata_id` int(11) NOT NULL,
  `const_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `const_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`const_id`) USING BTREE,
  UNIQUE KEY `﻿const_id_UNIQUE` (`const_id`) USING BTREE,
  UNIQUE KEY `const_name_UNIQUE` (`const_name`) USING BTREE,
  KEY `const_cata_id_tt` (`const_cata_id`) USING BTREE,
  CONSTRAINT `const_cata_id_tt` FOREIGN KEY (`const_cata_id`) REFERENCES `const_cata` (`﻿const_cata_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of const_item
-- ----------------------------
INSERT INTO `const_item` VALUES ('11', '1', 'NK', '内科', '1');
INSERT INTO `const_item` VALUES ('12', '1', 'WK', '外科', '1');
INSERT INTO `const_item` VALUES ('14', '1', 'EK', '儿科', '1');
INSERT INTO `const_item` VALUES ('15', '1', 'CRBK', '传染病科', '1');
INSERT INTO `const_item` VALUES ('16', '1', 'FCK', '妇产科', '1');
INSERT INTO `const_item` VALUES ('17', '1', 'NK', '男科', '1');
INSERT INTO `const_item` VALUES ('18', '1', 'JSXLK', '精神心理科', '1');
INSERT INTO `const_item` VALUES ('19', '1', 'PFXBK', '皮肤性病科', '1');
INSERT INTO `const_item` VALUES ('20', '1', 'ZYK', '中医科', '1');
INSERT INTO `const_item` VALUES ('21', '1', 'ZLK', '肿瘤科', '1');
INSERT INTO `const_item` VALUES ('22', '1', 'GK', '骨科', '1');
INSERT INTO `const_item` VALUES ('23', '1', 'WGK', '五官科', '1');
INSERT INTO `const_item` VALUES ('24', '1', 'KFYXK', '康复医学科', '1');
INSERT INTO `const_item` VALUES ('25', '1', 'MZYXK', '麻醉医学科', '1');
INSERT INTO `const_item` VALUES ('26', '1', 'YYK', '营养科', '1');
INSERT INTO `const_item` VALUES ('27', '1', 'YJK', '医技科', '1');
INSERT INTO `const_item` VALUES ('28', '1', 'YXYXX', '医学影像学', '1');
INSERT INTO `const_item` VALUES ('29', '1', 'QTKS', '其他科室', '1');
INSERT INTO `const_item` VALUES ('51', '5', 'XJ', '现金', '1');
INSERT INTO `const_item` VALUES ('52', '5', 'YBK', '医保卡', '1');
INSERT INTO `const_item` VALUES ('53', '5', 'YHK', '银行卡', '1');
INSERT INTO `const_item` VALUES ('54', '5', 'XYK', '信用卡', '1');
INSERT INTO `const_item` VALUES ('55', '5', 'WX', '微信', '1');
INSERT INTO `const_item` VALUES ('56', '5', 'ZFB', '支付宝', '1');
INSERT INTO `const_item` VALUES ('57', '5', 'YSF', '云闪付', '1');
INSERT INTO `const_item` VALUES ('58', '5', 'QT', '其它', '1');
INSERT INTO `const_item` VALUES ('71', '7', 'NAN', '男', '1');
INSERT INTO `const_item` VALUES ('72', '7', 'NV', '女', '1');
INSERT INTO `const_item` VALUES ('81', '8', 'ZRYS', '主任医师', '1');
INSERT INTO `const_item` VALUES ('82', '8', 'FZRYS', '副主任医师', '1');
INSERT INTO `const_item` VALUES ('83', '8', 'ZZYS', '主治医师', '1');
INSERT INTO `const_item` VALUES ('84', '8', 'ZYYS', '住院医师', '1');
INSERT INTO `const_item` VALUES ('101', '10', 'XY', '西药', '1');
INSERT INTO `const_item` VALUES ('102', '10', 'ZCY', '中成药', '1');
INSERT INTO `const_item` VALUES ('103', '10', 'ZCY', '中草药', '1');
INSERT INTO `const_item` VALUES ('110', '11', 'ZJ', '针剂', '1');
INSERT INTO `const_item` VALUES ('111', '11', 'PJ', '片剂', '1');
INSERT INTO `const_item` VALUES ('112', '11', 'ZYYP', '中药饮片', '1');
INSERT INTO `const_item` VALUES ('113', '11', 'SJ', '散剂', '1');
INSERT INTO `const_item` VALUES ('114', '11', 'JN', '胶囊', '1');
INSERT INTO `const_item` VALUES ('115', '11', 'KLJ', '颗粒剂', '1');
INSERT INTO `const_item` VALUES ('116', '11', 'FJ', '粉剂', '1');
INSERT INTO `const_item` VALUES ('117', '11', 'BMP', '簿膜片', '1');
INSERT INTO `const_item` VALUES ('118', '11', 'RJ', '乳剂', '1');
INSERT INTO `const_item` VALUES ('119', '11', 'YJ', '液剂', '1');
INSERT INTO `const_item` VALUES ('120', '11', 'NJ', '凝胶', '1');
INSERT INTO `const_item` VALUES ('121', '11', 'RGJ', '软膏剂', '1');
INSERT INTO `const_item` VALUES ('122', '11', 'QWJ', '气雾剂', '1');
INSERT INTO `const_item` VALUES ('123', '11', 'FSP', '分散片', '1');
INSERT INTO `const_item` VALUES ('124', '11', 'YPQX', '药品器械', '1');
INSERT INTO `const_item` VALUES ('125', '11', 'SJ', '栓剂', '1');
INSERT INTO `const_item` VALUES ('126', '11', 'NFSJ', '内服水剂', '1');
INSERT INTO `const_item` VALUES ('127', '11', 'PJ', '喷剂', '1');
INSERT INTO `const_item` VALUES ('128', '11', 'JJ', '胶剂', '1');
INSERT INTO `const_item` VALUES ('129', '11', 'TJ', '酊剂', '1');
INSERT INTO `const_item` VALUES ('130', '11', 'DJ', '滴剂', '1');
INSERT INTO `const_item` VALUES ('131', '11', 'HSP', '缓释片', '1');
INSERT INTO `const_item` VALUES ('132', '11', 'YGZJ', '眼膏制剂', '1');
INSERT INTO `const_item` VALUES ('133', '11', 'CRP', '肠溶片', '1');
INSERT INTO `const_item` VALUES ('134', '11', 'SJ', '霜剂', '1');
INSERT INTO `const_item` VALUES ('135', '11', 'DEJ', '滴耳剂', '1');
INSERT INTO `const_item` VALUES ('136', '11', 'HXJ', '混悬剂', '1');
INSERT INTO `const_item` VALUES ('137', '11', 'HSJN', '缓释胶囊', '1');
INSERT INTO `const_item` VALUES ('138', '11', 'NJJN', '凝胶胶囊', '1');
INSERT INTO `const_item` VALUES ('139', '11', 'CJ', '擦剂', '1');
INSERT INTO `const_item` VALUES ('140', '11', 'HP', '含片', '1');
INSERT INTO `const_item` VALUES ('141', '11', 'GHJ', '干混剂', '1');
INSERT INTO `const_item` VALUES ('142', '11', 'XJ', '洗剂', '1');
INSERT INTO `const_item` VALUES ('143', '11', 'BPJ', '鼻喷剂', '1');
INSERT INTO `const_item` VALUES ('144', '11', 'MJ', '膜剂', '1');
INSERT INTO `const_item` VALUES ('145', '11', 'TG', '贴膏', '1');
INSERT INTO `const_item` VALUES ('146', '11', 'TJ', '贴剂', '1');
INSERT INTO `const_item` VALUES ('147', '11', 'HJ', '合剂', '1');
INSERT INTO `const_item` VALUES ('148', '11', 'SJ', '湿巾', '1');
INSERT INTO `const_item` VALUES ('149', '11', 'KPJ', '口喷剂', '1');
INSERT INTO `const_item` VALUES ('150', '11', 'DSY', '大输液', '1');
INSERT INTO `const_item` VALUES ('151', '11', 'YPCL', '药品材料', '1');
INSERT INTO `const_item` VALUES ('152', '11', 'KSP', '控释片', '1');
INSERT INTO `const_item` VALUES ('153', '11', 'DBJ', '滴鼻剂', '1');
INSERT INTO `const_item` VALUES ('154', '11', 'DW', '滴丸', '1');
INSERT INTO `const_item` VALUES ('155', '11', 'GTJJ', '干糖浆剂', '1');
INSERT INTO `const_item` VALUES ('156', '11', 'WHXRJ', '雾化吸入剂', '1');
INSERT INTO `const_item` VALUES ('157', '11', 'YLY', '原料药', '1');
INSERT INTO `const_item` VALUES ('158', '11', 'TJJ', '糖浆剂', '1');
INSERT INTO `const_item` VALUES ('159', '11', 'RJN', '软胶囊', '1');
INSERT INTO `const_item` VALUES ('160', '11', 'DYJ', '滴眼剂', '1');
INSERT INTO `const_item` VALUES ('161', '11', 'DGFZ', '冻干粉针', '1');
INSERT INTO `const_item` VALUES ('162', '11', 'CJ', '冲剂', '1');
INSERT INTO `const_item` VALUES ('163', '11', 'WJ', '丸剂', '1');
INSERT INTO `const_item` VALUES ('164', '11', 'KFYL', '口服液类', '1');

-- ----------------------------
-- Table structure for `cost_detail`
-- ----------------------------
DROP TABLE IF EXISTS `cost_detail`;
CREATE TABLE `cost_detail` (
  `cost_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_type` int(11) NOT NULL,
  `pro_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_fee` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `start_time` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_person_id` int(11) NOT NULL,
  `charg_time` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `charg_person_id` int(11) NOT NULL,
  `charg_type` int(11) NOT NULL,
  PRIMARY KEY (`cost_detail_id`) USING BTREE,
  UNIQUE KEY `cost_detail_id_UNIQUE` (`cost_detail_id`) USING BTREE,
  KEY `reg_id_fk_idx` (`reg_id`) USING BTREE,
  KEY `charg_person_id_idx` (`charg_person_id`) USING BTREE,
  KEY `charg_type_idx` (`charg_type`) USING BTREE,
  CONSTRAINT `charg_type` FOREIGN KEY (`charg_type`) REFERENCES `const_item` (`const_id`),
  CONSTRAINT `charging_person_id` FOREIGN KEY (`charg_person_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `reg_id_fk` FOREIGN KEY (`reg_id`) REFERENCES `regist_msg` (`regist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cost_detail
-- ----------------------------
INSERT INTO `cost_detail` VALUES ('255', '62', '1', '1', '洗胃', '40', '1', '22', '2020-03-19 11:38:23', '2', '2020-07-11 11:38:23', '9', '51');
INSERT INTO `cost_detail` VALUES ('256', '63', '2', '1', '胃苏颗粒', '1.73', '1', '22', '2020-03-20 11:38:23', '2', '2020-07-11 11:39:40', '9', '51');
INSERT INTO `cost_detail` VALUES ('257', '64', '3', '1', '感冒', '40', '1', '22', '2020-03-21 11:38:23', '2', '2020-07-11 11:39:40', '9', '51');
INSERT INTO `cost_detail` VALUES ('258', '65', '4', '2', '山药颗粒', '6.79', '10', '22', '2020-03-22 11:38:23', '2', '2020-07-11 11:40:19', '9', '51');
INSERT INTO `cost_detail` VALUES ('259', '66', '5', '1', '灌肠', '10', '-1', '22', '2020-03-23 11:38:23', '2', '2020-07-11 11:40:19', '9', '51');
INSERT INTO `cost_detail` VALUES ('260', '67', '6', '1', '山药颗粒', '6.79', '-6', '22', '2020-03-24 11:38:23', '2', '2020-07-11 11:41:37', '9', '51');
INSERT INTO `cost_detail` VALUES ('261', '68', '7', '1', '灌肠', '10', '-6', '22', '2020-03-25 11:38:23', '2', '2020-07-11 11:42:42', '9', '51');
INSERT INTO `cost_detail` VALUES ('262', '69', '8', '1', '挂号费', '8', '-1', '1', '2020-03-26 11:38:23', '2', '2020-07-11 13:25:23', '9', '51');
INSERT INTO `cost_detail` VALUES ('263', '70', '9', '2', '蜂蜡', '3.47', '-2', '22', '2020-03-27 11:38:23', '2', '2020-07-11 13:33:54', '9', '51');
INSERT INTO `cost_detail` VALUES ('264', '71', '10', '1', '甲紫溶液', '41', '-3', '22', '2020-03-28 11:38:23', '2', '2020-07-11 13:33:54', '9', '51');
INSERT INTO `cost_detail` VALUES ('265', '72', '11', '2', '蜂蜡', '3.47', '-7', '22', '2020-03-29 11:38:23', '2', '2020-07-11 13:38:56', '9', '51');
INSERT INTO `cost_detail` VALUES ('266', '73', '12', '1', '甲紫溶液', '41', '-5', '22', '2020-03-30 11:38:23', '2', '2020-07-11 13:38:56', '9', '51');
INSERT INTO `cost_detail` VALUES ('267', '74', '13', '1', '红芪冲剂', '30.79', '3', '22', '2020-03-31 11:38:23', '2', '2020-07-11 13:39:37', '9', '51');
INSERT INTO `cost_detail` VALUES ('268', '75', '14', '1', '脑室碘水造影', '60', '1', '22', '2020-07-11 11:38:23', '2', '2020-07-11 13:39:37', '9', '51');
INSERT INTO `cost_detail` VALUES ('269', '76', '15', '1', '气脑造影', '80', '1', '22', '2020-07-12 11:38:23', '2', '2020-07-11 13:39:37', '9', '51');
INSERT INTO `cost_detail` VALUES ('270', '77', '16', '1', '食管钡餐透视', '15', '1', '22', '2020-07-13 11:38:23', '2', '2020-07-11 13:39:37', '9', '51');
INSERT INTO `cost_detail` VALUES ('271', '78', '17', '1', '脑室碘水造影', '60', '1', '22', '2020-07-14 11:38:23', '2', '2020-07-11 13:39:57', '9', '51');
INSERT INTO `cost_detail` VALUES ('272', '79', '18', '1', '气脑造影', '80', '1', '22', '2020-07-15 11:38:23', '2', '2020-07-11 13:39:57', '9', '51');
INSERT INTO `cost_detail` VALUES ('273', '80', '19', '1', '食管钡餐透视', '15', '1', '22', '2020-07-16 11:38:23', '2', '2020-07-11 13:39:57', '9', '51');
INSERT INTO `cost_detail` VALUES ('274', '146', '20', '2', '鱼腥草颗粒', '15', '1', '1', '2020-07-17 11:38:23', '2', '2020-06-25 11:44:13', '9', '51');
INSERT INTO `cost_detail` VALUES ('275', '147', '21', '2', '鱼腥草颗粒', '15', '1', '1', '2020-07-18 11:38:23', '2', '2020-06-25 11:44:13', '9', '51');
INSERT INTO `cost_detail` VALUES ('276', '148', '22', '2', '鱼腥草颗粒', '15', '1', '1', '2020-07-19 11:38:23', '2', '2020-06-25 11:45:33', '9', '51');
INSERT INTO `cost_detail` VALUES ('277', '149', '23', '2', '鱼腥草颗粒', '15', '1', '1', '2020-04-10 11:38:23', '2', '2020-06-25 11:45:33', '9', '51');
INSERT INTO `cost_detail` VALUES ('278', '150', '24', '2', '鱼腥草颗粒', '15', '1', '1', '2020-04-11 11:38:23', '2', '2020-06-25 11:52:32', '9', '51');
INSERT INTO `cost_detail` VALUES ('279', '151', '25', '2', '营养液', '6', '2', '1', '2020-04-12 11:38:23', '2', '2020-06-25 11:52:32', '9', '51');
INSERT INTO `cost_detail` VALUES ('281', '62', '26', '1', 'B超', '6', '2', '1', '2020-06-25 11:55:24', '2', '2020-06-25 11:55:24', '9', '51');
INSERT INTO `cost_detail` VALUES ('282', '63', '27', '1', '头部检查', '15', '1', '1', '2020-06-25 12:01:39', '2', '2020-06-25 12:01:39', '9', '51');
INSERT INTO `cost_detail` VALUES ('283', '64', '28', '1', '碘水消毒', '6', '2', '1', '2020-06-25 12:01:39', '2', '2020-06-25 12:01:39', '9', '51');
INSERT INTO `cost_detail` VALUES ('284', '65', '29', '1', '鱼腥草颗粒', '15', '1', '1', '2020-06-25 12:02:17', '2', '2020-06-25 12:02:17', '9', '51');
INSERT INTO `cost_detail` VALUES ('285', '66', '30', '1', '0.9%氯化钠注射液(塑瓶)', '6', '2', '1', '2020-06-25 12:02:17', '2', '2020-06-25 12:02:17', '9', '51');
INSERT INTO `cost_detail` VALUES ('286', '67', '31', '2', '板蓝根', '15', '1', '1', '2020-06-25 12:03:04', '2', '2020-06-25 12:03:04', '9', '51');
INSERT INTO `cost_detail` VALUES ('287', '68', '32', '2', '艾塞那肽注射液(百泌达)', '6', '2', '1', '2020-06-25 12:03:04', '2', '2020-06-25 12:03:04', '9', '51');
INSERT INTO `cost_detail` VALUES ('288', '69', '33', '2', '艾塞那肽注射液(百泌达)', '15', '1', '1', '2020-06-25 12:03:34', '2', '2020-06-25 12:03:34', '9', '51');
INSERT INTO `cost_detail` VALUES ('289', '70', '34', '2', '丹参颗粒', '6', '2', '1', '2020-06-25 12:03:34', '2', '2020-06-25 12:03:34', '9', '51');
INSERT INTO `cost_detail` VALUES ('290', '71', '35', '2', '亮菌甲素注射液', '15', '1', '1', '2020-06-25 12:04:44', '2', '2020-06-25 12:04:44', '9', '51');
INSERT INTO `cost_detail` VALUES ('291', '72', '36', '2', '瞿麦', '6', '2', '1', '2020-06-25 12:04:44', '2', '2020-06-25 12:04:44', '9', '51');
INSERT INTO `cost_detail` VALUES ('292', '73', '37', '2', '肠内营养粉剂(安素)', '15', '1', '1', '2020-06-25 12:05:30', '2', '2020-06-25 12:05:30', '9', '51');
INSERT INTO `cost_detail` VALUES ('293', '74', '38', '2', '桉叶油', '6', '2', '1', '2020-06-25 12:05:30', '2', '2020-06-25 12:05:30', '9', '51');
INSERT INTO `cost_detail` VALUES ('294', '75', '39', '2', '肉苁蓉', '15', '1', '1', '2020-06-25 14:21:33', '2', '2020-06-25 14:21:33', '9', '51');
INSERT INTO `cost_detail` VALUES ('295', '76', '40', '1', '食管钡餐透视', '16', '2', '1', '2020-06-25 14:21:33', '2', '2020-06-25 14:21:33', '9', '51');
INSERT INTO `cost_detail` VALUES ('296', '77', '41', '1', '脑室碘水造影', '17', '1', '1', '2020-06-25 14:28:50', '2', '2020-06-25 14:28:50', '9', '51');
INSERT INTO `cost_detail` VALUES ('297', '78', '42', '1', '气脑造影', '18', '2', '1', '2020-06-25 14:28:50', '2', '2020-06-25 14:28:50', '9', '51');
INSERT INTO `cost_detail` VALUES ('298', '79', '43', '1', '食管钡餐透视', '19', '1', '1', '2020-06-25 14:29:06', '2', '2020-06-25 14:29:06', '9', '51');
INSERT INTO `cost_detail` VALUES ('299', '80', '44', '1', '0.9%氯化钠注射液(塑瓶)', '20', '2', '1', '2020-06-25 14:29:06', '2', '2020-06-25 14:29:06', '9', '51');
INSERT INTO `cost_detail` VALUES ('300', '153', '85', '2', 'sjdkf', '47.19', '3', '1', '2020-07-14 14:01:34', '1', '2020-07-14 19:42:59', '10', '56');
INSERT INTO `cost_detail` VALUES ('301', '153', '85', '2', 'sjdkf', '47.19', '3', '1', '2020-07-14 14:01:34', '1', '2020-07-14 19:47:49', '10', '56');
INSERT INTO `cost_detail` VALUES ('302', '157', '92', '2', '普通1', '15.73', '3', '1', '2020-07-16 13:50:01', '1', '2020-07-16 16:39:36', '10', '56');
INSERT INTO `cost_detail` VALUES ('303', '157', '92', '2', '普通1', '7.01', '2', '1', '2020-07-16 13:50:01', '1', '2020-07-16 16:39:36', '10', '56');
INSERT INTO `cost_detail` VALUES ('304', '157', '92', '2', '普通1', '25.16', '1', '1', '2020-07-16 13:50:01', '1', '2020-07-16 16:39:36', '10', '56');
INSERT INTO `cost_detail` VALUES ('305', '157', '92', '2', '普通1', '-15.73', '3', '1', '2020-07-16 13:50:01', '1', '2020-07-16 16:47:34', '10', '56');
INSERT INTO `cost_detail` VALUES ('306', '157', '92', '2', '普通1', '-7.01', '2', '1', '2020-07-16 13:50:01', '1', '2020-07-16 16:47:34', '10', '56');
INSERT INTO `cost_detail` VALUES ('307', '157', '92', '2', '普通1', '-25.16', '1', '1', '2020-07-16 13:50:01', '1', '2020-07-16 16:47:34', '10', '56');
INSERT INTO `cost_detail` VALUES ('308', '157', '92', '2', '普通1', '-25.16', '1', '1', '2020-07-16 13:50:01', '1', '2020-07-16 16:47:34', '10', '56');
INSERT INTO `cost_detail` VALUES ('309', '160', '93', '2', '胆结石处方', '15.73', '3', '1', '2020-07-17 17:53:36', '1', '2020-07-17 18:07:32', '10', '56');
INSERT INTO `cost_detail` VALUES ('310', '160', '93', '2', '胆结石处方', '7.01', '3', '1', '2020-07-17 17:53:36', '1', '2020-07-17 18:07:32', '10', '56');
INSERT INTO `cost_detail` VALUES ('311', '160', '93', '2', '胆结石处方', '25.16', '3', '1', '2020-07-17 17:53:36', '1', '2020-07-17 18:07:32', '10', '56');
INSERT INTO `cost_detail` VALUES ('312', '160', '93', '2', '胆结石处方', '-15.73', '3', '1', '2020-07-17 17:53:36', '1', '2020-07-17 18:12:29', '10', '56');
INSERT INTO `cost_detail` VALUES ('313', '160', '93', '2', '胆结石处方', '-7.01', '3', '1', '2020-07-17 17:53:36', '1', '2020-07-17 18:12:29', '10', '56');
INSERT INTO `cost_detail` VALUES ('314', '160', '93', '2', '胆结石处方', '-25.16', '3', '1', '2020-07-17 17:53:36', '1', '2020-07-17 18:12:29', '10', '56');
INSERT INTO `cost_detail` VALUES ('315', '160', '93', '2', '胆结石处方', '-25.16', '3', '1', '2020-07-17 17:53:36', '1', '2020-07-17 18:12:29', '10', '56');
INSERT INTO `cost_detail` VALUES ('316', '153', '85', '1', '注射用甲氨喋呤', '15.73', '3', '1', '2020-07-14 14:01:34', '1', '2020-08-04 18:42:09', '10', '51');
INSERT INTO `cost_detail` VALUES ('317', '153', '85', '1', '注射用甲氨喋呤', '15.73', '3', '1', '2020-07-14 14:01:34', '1', '2020-08-04 18:46:34', '10', '51');
INSERT INTO `cost_detail` VALUES ('318', '153', '84', '1', '注射用甲氨喋呤', '15.73', '3', '1', '2020-07-14 14:01:09', '1', '2020-08-04 18:48:42', '10', '51');
INSERT INTO `cost_detail` VALUES ('319', '157', '92', '1', '氟康唑氯化钠注射液(大扶康)', '7.01', '2', '1', '2020-07-16 13:50:01', '1', '2020-08-22 13:21:54', '10', '51');
INSERT INTO `cost_detail` VALUES ('320', '157', '90', '1', '注射用甲氨喋呤', '15.73', '3', '1', '2020-07-16 11:43:31', '1', '2020-08-22 13:21:54', '10', '51');
INSERT INTO `cost_detail` VALUES ('321', '157', '92', '1', '50%葡萄糖注射液(塑瓶)', '25.16', '1', '1', '2020-07-16 13:50:01', '1', '2020-08-22 13:21:54', '10', '51');
INSERT INTO `cost_detail` VALUES ('322', '157', '92', '1', '注射用甲氨喋呤', '15.73', '3', '1', '2020-07-16 13:50:01', '1', '2020-08-22 13:21:54', '10', '51');
INSERT INTO `cost_detail` VALUES ('323', '171', '103', '1', '注射用头孢他啶(复达欣)', '8.05', '1', '1', '2020-08-25 22:06:30', '9', '2020-08-25 22:08:39', '10', '52');
INSERT INTO `cost_detail` VALUES ('324', '171', '103', '1', '复方氨基酸(绿支安)18AA注射液', '49.18', '1', '1', '2020-08-25 22:06:30', '9', '2020-08-25 22:08:39', '10', '52');
INSERT INTO `cost_detail` VALUES ('325', '171', '104', '1', '卡巴胆碱注射液（卡米可林）', '5.23', '1', '1', '2020-08-25 22:11:22', '9', '2020-08-25 22:18:05', '10', '51');
INSERT INTO `cost_detail` VALUES ('331', '173', '108', '1', '复方氨基酸(绿支安)18AA注射液', '49.18', '1', '1', '2020-09-20 21:17:37', '3', '2020-09-20 21:18:33', '10', '51');
INSERT INTO `cost_detail` VALUES ('332', '173', '108', '1', '泽泻颗粒', '0.09', '1', '1', '2020-09-20 21:17:37', '3', '2020-09-20 21:18:33', '10', '51');
INSERT INTO `cost_detail` VALUES ('333', '173', '109', '1', '泽泻颗粒', '0.09', '1', '1', '2020-09-20 21:17:37', '3', '2020-09-20 21:18:33', '10', '51');

-- ----------------------------
-- Table structure for `daily_settle`
-- ----------------------------
DROP TABLE IF EXISTS `daily_settle`;
CREATE TABLE `daily_settle` (
  `﻿daily_settle_id` int(11) NOT NULL,
  `settle_person_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`﻿daily_settle_id`) USING BTREE,
  UNIQUE KEY `﻿daily_settle_id_UNIQUE` (`﻿daily_settle_id`) USING BTREE,
  UNIQUE KEY `end_time_UNIQUE` (`end_time`) USING BTREE,
  UNIQUE KEY `start_time_UNIQUE` (`start_time`) USING BTREE,
  KEY `settle_person_id_idx` (`settle_person_id`) USING BTREE,
  CONSTRAINT `settle_person_id` FOREIGN KEY (`settle_person_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of daily_settle
-- ----------------------------

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `depart_id` int(11) NOT NULL,
  `depart_code` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depart_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depart_cata` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`depart_id`) USING BTREE,
  UNIQUE KEY `﻿depart_id_UNIQUE` (`depart_id`) USING BTREE,
  UNIQUE KEY `depart_name_UNIQUE` (`depart_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'XXGNK', '心血管内科', '11', '1');
INSERT INTO `department` VALUES ('2', 'SJNK', '神经内科', '11', '1');
INSERT INTO `department` VALUES ('3', 'PTNK', '普通内科', '11', '1');
INSERT INTO `department` VALUES ('4', 'XHNK', '消化内科', '11', '1');
INSERT INTO `department` VALUES ('5', 'HXNK', '呼吸内科', '11', '1');
INSERT INTO `department` VALUES ('6', 'NFMK', '内分泌科', '11', '1');
INSERT INTO `department` VALUES ('7', 'SBNK', '肾病内科', '11', '1');
INSERT INTO `department` VALUES ('8', 'XYNK', '血液内科', '11', '1');
INSERT INTO `department` VALUES ('9', 'GRNK', '感染内科', '11', '1');
INSERT INTO `department` VALUES ('10', 'LNBNK', '老年病内科', '11', '1');
INSERT INTO `department` VALUES ('11', 'FSMYNK', '风湿免疫内科', '11', '1');
INSERT INTO `department` VALUES ('12', 'TXK', '透析科', '11', '1');
INSERT INTO `department` VALUES ('13', 'BTFYK', '变态反应科', '11', '1');
INSERT INTO `department` VALUES ('14', 'PTWK', '普通外科', '12', '1');
INSERT INTO `department` VALUES ('15', 'MNWK', '泌尿外科', '12', '1');
INSERT INTO `department` VALUES ('16', 'SJWK', '神经外科', '12', '1');
INSERT INTO `department` VALUES ('17', 'XWK', '胸外科', '12', '1');
INSERT INTO `department` VALUES ('18', 'ZXWK', '整形外科', '12', '1');
INSERT INTO `department` VALUES ('19', 'GCWK', '肛肠外科', '12', '1');
INSERT INTO `department` VALUES ('20', 'GDWK', '肝胆外科', '12', '1');
INSERT INTO `department` VALUES ('21', 'RXWK', '乳腺外科', '12', '1');
INSERT INTO `department` VALUES ('22', 'XXGWK', '心血管外科', '12', '1');
INSERT INTO `department` VALUES ('23', 'XZWK', '心脏外科', '12', '1');
INSERT INTO `department` VALUES ('24', 'QGYZ', '器官移植', '12', '1');
INSERT INTO `department` VALUES ('25', 'WCWK', '微创外科', '12', '1');
INSERT INTO `department` VALUES ('26', 'GNSJWK', '功能神经外科', '12', '1');
INSERT INTO `department` VALUES ('27', 'XTWK', '腺体外科', '12', '1');
INSERT INTO `department` VALUES ('28', 'EKZH', '儿科综合', '14', '1');
INSERT INTO `department` VALUES ('29', 'XEWK', '小儿外科', '14', '1');
INSERT INTO `department` VALUES ('30', 'ETBJK', '儿童保健科', '14', '1');
INSERT INTO `department` VALUES ('31', 'XSEK', '新生儿科', '14', '1');
INSERT INTO `department` VALUES ('32', 'XEGK', '小儿骨科', '14', '1');
INSERT INTO `department` VALUES ('33', 'XESJNK', '小儿神经内科', '14', '1');
INSERT INTO `department` VALUES ('34', 'XEHXK', '小儿呼吸科', '14', '1');
INSERT INTO `department` VALUES ('35', 'XEXYK', '小儿血液科', '14', '1');
INSERT INTO `department` VALUES ('36', 'XEEBHK', '小儿耳鼻喉科', '14', '1');
INSERT INTO `department` VALUES ('37', 'XEXNK', '小儿心内科', '14', '1');
INSERT INTO `department` VALUES ('38', 'XEKFK', '小儿康复科', '14', '1');
INSERT INTO `department` VALUES ('39', 'XEJSK', '小儿精神科', '14', '1');
INSERT INTO `department` VALUES ('40', 'XESNK', '小儿肾内科', '14', '1');
INSERT INTO `department` VALUES ('41', 'XEXHK', '小儿消化科', '14', '1');
INSERT INTO `department` VALUES ('42', 'XEPFK', '小儿皮肤科', '14', '1');
INSERT INTO `department` VALUES ('43', 'XEJZK', '小儿急诊科', '14', '1');
INSERT INTO `department` VALUES ('44', 'XENFMK', '小儿内分泌科', '14', '1');
INSERT INTO `department` VALUES ('45', 'XEMNWK', '小儿泌尿外科', '14', '1');
INSERT INTO `department` VALUES ('46', 'XEGRK', '小儿感染科', '14', '1');
INSERT INTO `department` VALUES ('47', 'XEXWK01', '小儿心外科', '14', '1');
INSERT INTO `department` VALUES ('48', 'XEXWK02', '小儿胸外科', '14', '1');
INSERT INTO `department` VALUES ('49', 'XESJWK', '小儿神经外科', '14', '1');
INSERT INTO `department` VALUES ('50', 'XEZXK', '小儿整形科', '14', '1');
INSERT INTO `department` VALUES ('51', 'XEFSMYK', '小儿风湿免疫科', '14', '1');
INSERT INTO `department` VALUES ('52', 'XEFK', '小儿妇科', '14', '1');
INSERT INTO `department` VALUES ('53', 'CRK', '传染科', '15', '1');
INSERT INTO `department` VALUES ('54', 'GBK', '肝病科', '15', '1');
INSERT INTO `department` VALUES ('55', 'AZBK', '艾滋病科', '15', '1');
INSERT INTO `department` VALUES ('56', 'CRWZS', '传染危重室', '15', '1');
INSERT INTO `department` VALUES ('57', 'FCKZH', '妇产科综合', '16', '1');
INSERT INTO `department` VALUES ('58', 'FK', '妇科', '16', '1');
INSERT INTO `department` VALUES ('59', 'CK', '产科', '16', '1');
INSERT INTO `department` VALUES ('60', 'JHSYK', '计划生育科', '16', '1');
INSERT INTO `department` VALUES ('61', 'FKNFM', '妇科内分泌', '16', '1');
INSERT INTO `department` VALUES ('62', 'YCZYK', '遗传咨询科', '16', '1');
INSERT INTO `department` VALUES ('63', 'CQJCK', '产前检查科', '16', '1');
INSERT INTO `department` VALUES ('64', 'FMNK', '妇泌尿科', '16', '1');
INSERT INTO `department` VALUES ('65', 'QLX', '前列腺', '17', '1');
INSERT INTO `department` VALUES ('66', 'XGNZA', '性功能障碍', '17', '1');
INSERT INTO `department` VALUES ('67', 'SZQGR', '生殖器感染', '17', '1');
INSERT INTO `department` VALUES ('68', 'NXBY', '男性不育', '17', '1');
INSERT INTO `department` VALUES ('69', 'SZZX', '生殖整形', '17', '1');
INSERT INTO `department` VALUES ('70', 'JSK', '精神科', '18', '1');
INSERT INTO `department` VALUES ('71', 'SFJDK', '司法鉴定科', '18', '1');
INSERT INTO `department` VALUES ('72', 'YWYLK', '药物依赖科', '18', '1');
INSERT INTO `department` VALUES ('73', 'ZYJSK', '中医精神科', '18', '1');
INSERT INTO `department` VALUES ('74', 'SXZAK', '双相障碍科', '18', '1');
INSERT INTO `department` VALUES ('75', 'PFK', '皮肤科', '19', '1');
INSERT INTO `department` VALUES ('76', 'XBK', '性病科', '19', '1');
INSERT INTO `department` VALUES ('77', 'ZYZHK', '中医综合科', '20', '1');
INSERT INTO `department` VALUES ('78', 'ZJK', '针灸科', '20', '1');
INSERT INTO `department` VALUES ('79', 'ZYGK', '中医骨科', '20', '1');
INSERT INTO `department` VALUES ('80', 'ZYFCK', '中医妇产科', '20', '1');
INSERT INTO `department` VALUES ('81', 'ZYWK', '中医外科', '20', '1');
INSERT INTO `department` VALUES ('82', 'ZYEK', '中医儿科', '20', '1');
INSERT INTO `department` VALUES ('83', 'ZYGCK', '中医肛肠科', '20', '1');
INSERT INTO `department` VALUES ('84', 'ZYPFK', '中医皮肤科', '20', '1');
INSERT INTO `department` VALUES ('85', 'ZYWGK', '中医五官科', '20', '1');
INSERT INTO `department` VALUES ('86', 'ZYAMK', '中医按摩科', '20', '1');
INSERT INTO `department` VALUES ('87', 'ZYXHK', '中医消化科', '20', '1');
INSERT INTO `department` VALUES ('88', 'ZYZLK', '中医肿瘤科', '20', '1');
INSERT INTO `department` VALUES ('89', 'ZYXNK', '中医心内科', '20', '1');
INSERT INTO `department` VALUES ('90', 'ZYSJNK', '中医神经内科', '20', '1');
INSERT INTO `department` VALUES ('91', 'ZYSBNK', '中医肾病内科', '20', '1');
INSERT INTO `department` VALUES ('92', 'ZYNFM', '中医内分泌', '20', '1');
INSERT INTO `department` VALUES ('93', 'ZYHXK', '中医呼吸科', '20', '1');
INSERT INTO `department` VALUES ('94', 'ZYGBK', '中医肝病科', '20', '1');
INSERT INTO `department` VALUES ('95', 'ZYNK', '中医男科', '20', '1');
INSERT INTO `department` VALUES ('96', 'ZYFSMYNK', '中医风湿免疫内科', '20', '1');
INSERT INTO `department` VALUES ('97', 'ZYXYK', '中医血液科', '20', '1');
INSERT INTO `department` VALUES ('98', 'ZYRXWK', '中医乳腺外科', '20', '1');
INSERT INTO `department` VALUES ('99', 'ZYLNBK', '中医老年病科', '20', '1');
INSERT INTO `department` VALUES ('100', 'ZLZHK', '肿瘤综合科', '21', '1');
INSERT INTO `department` VALUES ('101', 'ZLNK', '肿瘤内科', '21', '1');
INSERT INTO `department` VALUES ('102', 'FLK', '放疗科', '21', '1');
INSERT INTO `department` VALUES ('103', 'ZLWK', '肿瘤外科', '21', '1');
INSERT INTO `department` VALUES ('104', 'ZLFK', '肿瘤妇科', '21', '1');
INSERT INTO `department` VALUES ('105', 'GZLK', '骨肿瘤科', '21', '1');
INSERT INTO `department` VALUES ('106', 'ZLKFK', '肿瘤康复科', '21', '1');
INSERT INTO `department` VALUES ('107', 'GWK', '骨外科', '22', '1');
INSERT INTO `department` VALUES ('108', 'SWK', '手外科', '22', '1');
INSERT INTO `department` VALUES ('109', 'CSGK', '创伤骨科', '22', '1');
INSERT INTO `department` VALUES ('110', 'JZWK', '脊柱外科', '22', '1');
INSERT INTO `department` VALUES ('111', 'GGJK', '骨关节科', '22', '1');
INSERT INTO `department` VALUES ('112', 'GZSSK', '骨质疏松科', '22', '1');
INSERT INTO `department` VALUES ('113', 'JXGK', '矫形骨科', '22', '1');
INSERT INTO `department` VALUES ('114', 'EBYHTJK', '耳鼻咽喉头颈科', '23', '1');
INSERT INTO `department` VALUES ('115', 'KQK', '口腔科', '23', '1');
INSERT INTO `department` VALUES ('116', 'YK', '眼科', '23', '1');
INSERT INTO `department` VALUES ('117', 'KFK', '康复科', '24', '1');
INSERT INTO `department` VALUES ('118', 'LLK', '理疗科', '24', '1');
INSERT INTO `department` VALUES ('119', 'MZK', '麻醉科', '25', '1');
INSERT INTO `department` VALUES ('120', 'TTK', '疼痛科', '25', '1');
INSERT INTO `department` VALUES ('121', 'YYK', '营养科', '26', '1');
INSERT INTO `department` VALUES ('122', 'GYYK', '高压氧科', '27', '1');
INSERT INTO `department` VALUES ('123', 'GNJCK', '功能检查科', '27', '1');
INSERT INTO `department` VALUES ('124', 'BLK', '病理科', '27', '1');
INSERT INTO `department` VALUES ('125', 'JYK', '检验科', '27', '1');
INSERT INTO `department` VALUES ('126', 'SYZX', '实验中心', '27', '1');
INSERT INTO `department` VALUES ('127', 'XDTK', '心电图科', '27', '1');
INSERT INTO `department` VALUES ('128', 'FSK', '放射科', '28', '1');
INSERT INTO `department` VALUES ('129', 'CSZDK', '超声诊断科', '28', '1');
INSERT INTO `department` VALUES ('130', 'YXYXK', '医学影像科', '28', '1');
INSERT INTO `department` VALUES ('131', 'HYK', '核医学科', '28', '1');
INSERT INTO `department` VALUES ('132', 'YJK', '药剂科', '29', '1');
INSERT INTO `department` VALUES ('133', 'HLK', '护理科', '29', '1');
INSERT INTO `department` VALUES ('134', 'TJK', '体检科', '29', '1');
INSERT INTO `department` VALUES ('135', 'JZK', '急诊科', '29', '1');
INSERT INTO `department` VALUES ('136', 'GGWSYYFK', '公共卫生与预防科', '29', '1');
INSERT INTO `department` VALUES ('137', 'SBK', '设备科', '29', '1');
INSERT INTO `department` VALUES ('138', 'CWK', '财务科', '29', '1');

-- ----------------------------
-- Table structure for `diagnose`
-- ----------------------------
DROP TABLE IF EXISTS `diagnose`;
CREATE TABLE `diagnose` (
  `diagnose_id` int(11) NOT NULL AUTO_INCREMENT,
  `medical_record_id` int(11) NOT NULL,
  `regist_id` int(11) NOT NULL,
  `illness_id` int(11) NOT NULL,
  `diagnose_type` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `diagnose_time` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `final_diagnose` int(11) NOT NULL,
  PRIMARY KEY (`diagnose_id`) USING BTREE,
  UNIQUE KEY `﻿diagnose_id_UNIQUE` (`diagnose_id`) USING BTREE,
  KEY `regist_id_fk_idx` (`regist_id`) USING BTREE,
  KEY `illness_id_fk_idx` (`illness_id`) USING BTREE,
  CONSTRAINT `illness_id_fk` FOREIGN KEY (`illness_id`) REFERENCES `illness` (`﻿illness_id`),
  CONSTRAINT `regist_id_fk` FOREIGN KEY (`regist_id`) REFERENCES `regist_msg` (`regist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of diagnose
-- ----------------------------
INSERT INTO `diagnose` VALUES ('4', '600600', '60', '30', '1', '2020-06-11 00:00:00', '1');
INSERT INTO `diagnose` VALUES ('6', '600601', '61', '31', '1', '2020-06-11 00:00:00', '1');
INSERT INTO `diagnose` VALUES ('10', '600602', '62', '32', '1', '2020-03-19 00:00:00', '1');
INSERT INTO `diagnose` VALUES ('12', '600603', '63', '33', '1', '2020-03-20 15:21:00', '2');
INSERT INTO `diagnose` VALUES ('13', '600604', '64', '34', '2', '2020-03-25 16:51:00', '2');
INSERT INTO `diagnose` VALUES ('14', '600605', '65', '35', '1', '2020-03-26 09:28:00', '2');
INSERT INTO `diagnose` VALUES ('16', '600606', '66', '36', '1', '2020-03-28 00:00:00', '2');
INSERT INTO `diagnose` VALUES ('17', '600600', '68', '37', '1', '2020-03-28 13:45:00', '2');
INSERT INTO `diagnose` VALUES ('18', '600600', '69', '38', '1', '2020-03-28 13:45:00', '2');
INSERT INTO `diagnose` VALUES ('19', '600656', '157', '1', '1', '2020-07-16 16:25:27', '0');
INSERT INTO `diagnose` VALUES ('20', '600659', '160', '1', '1', '2020-07-17 17:45:22', '0');
INSERT INTO `diagnose` VALUES ('21', '600655', '156', '90', '1', '2020-07-17 17:45:22', '1');
INSERT INTO `diagnose` VALUES ('22', '600655', '156', '71', '1', '2020-07-17 17:45:22', '1');
INSERT INTO `diagnose` VALUES ('23', '600654', '155', '32', '1', '2020-08-03 20:52:42', '1');
INSERT INTO `diagnose` VALUES ('24', '600653', '152', '32', '1', '2020-08-03 20:58:50', '1');

-- ----------------------------
-- Table structure for `drug`
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug` (
  `drug_id` int(11) NOT NULL,
  `drug_code` bigint(20) NOT NULL,
  `drug_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `durg_std` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `manufacture` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `drug_from` int(11) NOT NULL,
  `drug_type` int(11) NOT NULL,
  `fee` double NOT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_change` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`drug_id`) USING BTREE,
  UNIQUE KEY `﻿drug_id_UNIQUE` (`drug_id`) USING BTREE,
  KEY `drug_form_idx` (`drug_from`) USING BTREE,
  KEY `drug_type_idx` (`drug_type`) USING BTREE,
  CONSTRAINT `drug_form` FOREIGN KEY (`drug_from`) REFERENCES `const_item` (`const_id`),
  CONSTRAINT `drug_type` FOREIGN KEY (`drug_type`) REFERENCES `const_item` (`const_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of drug
-- ----------------------------
INSERT INTO `drug` VALUES ('1', '86979474000208', '注射用甲氨喋呤', '1g×1支', '支', '江苏恒瑞医药股份有限公司', '110', '101', '15.73', 'ZSYJAZZ', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('2', '86979474000209', '氟康唑氯化钠注射液(大扶康)', '200mg×100ml/瓶', '瓶', '辉瑞制药有限公司', '110', '101', '7.01', 'FKZLHNZSY(DFK)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('3', '86979474000208', '50%葡萄糖注射液(塑瓶)', '10:20ml×1支', '支', '中国大冢制药有限公司', '110', '101', '25.16', 'PTTZSY(SP)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('4', '86979474000209', '盐酸特比萘芬泡腾片（丁克）', '50mg×7片/盒', '盒', '齐鲁制药有限公司', '111', '101', '40.62', 'YSTBZFYDPTP（DK）', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('5', '86979474000208', '红芪冲剂', '10g/袋', '袋', '南京药业股份有限公司药材分公司', '112', '103', '30.79', 'HZ', '2020-03-01 00:00:00', '2020-03-28 16:07:32', '1');
INSERT INTO `drug` VALUES ('6', '86979474000208', '盐酸氨酮戊酸散（外用）', '118mg×1瓶', '瓶', '上海复旦张江生物医药股份有限公司', '113', '101', '19.51', 'YSATWSS（WY）', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('7', '86979474000209', '盐酸美金刚片(易贝申)', '10mg×28片/盒', '盒', '丹麦灵北药厂', '111', '101', '22.05', 'YSMJGP(YBS)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('8', '86979474000208', '磷酸奥司他韦胶囊(达菲)', '75mg×10粒/盒', '盒', '上海罗氏制药有限公司S', '114', '101', '60.96', 'LSASTWJN(DF)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('9', '86979474000209', '泽泻颗粒', '1g/10g/袋', '袋', '江阴天江药业有限公司', '115', '102', '0.09', 'ZXKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('10', '86979474000208', '山药颗粒', '0.5g/10g/袋', '袋', '', '115', '102', '6.79', 'SYKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('11', '86979474000208', '熟大黄颗粒', '1g/6g/袋', '袋', '江阴天江药业有限公司', '115', '102', '23.51', 'SDHKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('12', '86979474000209', '黄连颗粒', '0.5g/3g袋', '袋', '江阴天江药业有限公司', '115', '102', '1.07', 'HLKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('13', '86979474000208', '黄芩颗粒(酒)', '2g/10g/袋', '袋', '江阴天江药业有限公司', '115', '102', '81.74', 'HZKL(J)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('14', '86979474000209', '炒白芍颗粒', '1g/10g/袋', '袋', '江阴天江药业有限公司', '115', '102', '31.86', 'CBSKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('15', '86979474000208', '炒白术颗粒', '3g/10g/袋', '袋', '', '115', '102', '41.5', 'CBSKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('16', '86979474000208', '白芷颗粒', '1g/6g/袋', '袋', '江阴天江药业有限公司', '115', '102', '67.72', 'BZKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('17', '86979474000209', '薤白颗粒', '2.5g/10g袋', '袋', '江阴天江药业有限公司', '115', '102', '17.95', 'ZBKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('18', '86979474000208', '川芎颗粒', '2g/6g/袋', '袋', '', '115', '102', '0.7', 'CZKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('19', '86979474000209', '维生素K1注射液', '1ml:10mg×10支/盒', '盒', '芜湖康奇制药', '110', '101', '10.39', 'WSSK1ZSY', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('20', '86979474000208', '利培酮片（维思通）', '1mg×20片/盒', '盒', '西安杨森制药有限公司', '111', '101', '5.52', 'LPTP（WST）', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('21', '86979474000208', '0.9%氯化钠注射液(塑瓶)', '2.25g:250ml×1瓶', '瓶', '中国大冢制药有限公司', '110', '101', '14.34', '0.9%LHNZSY(SP)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('22', '86979474000209', '0.9%氯化钠注射液（百特）', '500ml×1袋', '瓶', '上海百特医疗用品有限公司', '110', '101', '46.91', '0.9%LHNZSY（BT）', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('23', '86979474000208', '0.9%氯化钠注射液(塑瓶)', '0.9g:100ml×1瓶', '瓶', '中国大冢制药有限公司', '110', '101', '6.34', '0.9%LHNZSY(SP)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('24', '86979474000209', '10%葡萄糖注射液(塑瓶)', '50g:500ml×1瓶', '瓶', '中国大冢制药有限公司', '110', '101', '5.04', '10%PTTZSY(SP)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('25', '86979474000208', '10%葡萄糖注射液(塑瓶)', '25g:250ml×1瓶', '袋', '中国大冢制药有限公司', '110', '101', '16.02', '10%PTTZSY(SP)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('26', '86979474000208', '5%葡萄糖注射液(塑瓶)', '25g:500ml×1瓶', '瓶', '中国大冢制药有限公司', '110', '101', '47.78', '5%PTTZSY(SP)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('27', '86979474000209', '5%葡萄糖注射液(塑瓶)', '12.5g:250ml×1瓶', '瓶', '中国大冢制药有限公司', '110', '101', '45.62', '5%PTTZSY(SP)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('28', '86979474000208', '5%葡萄糖注射液(塑瓶)', '5g:100ml×1瓶', '瓶', '中国大冢制药有限公司', '110', '101', '17.53', '5%PTTZSY(SP)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('29', '86979474000209', '胃苏颗粒', '5g*9袋/盒', '盒', '扬子江药业集团有限公司', '115', '102', '1.73', 'WSKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('30', '86979474000208', '复方甘露醇注射液(伸宁)', '250ml×1袋', '袋', '南京正大天晴制药有限公司', '110', '101', '15.56', 'FFGLCZSY(SN)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('31', '86979474000208', '艾塞那肽注射液(百泌达)', '5ug:1.2ml×1支', '支', '礼来（美国）公司S', '110', '101', '23.71', 'ASNZZSY(BMD)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('32', '86979474000209', '艾塞那肽注射液(百泌达)', '10ug:2.4ml×1支', '支', '礼来（美国）公司', '110', '101', '91.92', 'ASNZZSY(BMD)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('33', '86979474000208', '丹参颗粒', '2g/10g/袋', '袋', '江阴天江药业有限公司', '115', '102', '11.61', 'DCKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('34', '86979474000209', '亮菌甲素注射液', '10ml:5mg×1支', '支', '云南大理药业股份有限公司', '110', '101', '62.41', 'LJJSZSY', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('35', '86979474000208', '瞿麦', '1000mg/g', '克', '江苏', '112', '103', '43.84', 'ZM', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('36', '86979474000208', '肠内营养粉剂(安素)', '1000mg/g', '克', '雅培荷兰', '116', '101', '3.12', 'CNYYFJ(AS)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('37', '86979474000209', '桉叶油', '1000g/瓶', '瓶', '吉水同仁', '157', '101', '3.4', 'ZYY', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('38', '86979474000208', '肉苁蓉', '1000mg/g', '克', '内蒙', '112', '103', '51.82', 'RZR', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('39', '86979474000209', '番木鳖酊', '1000mg/g', '克', '', '157', '101', '16.84', 'FMBJ', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('40', '86979474000208', '枸橼酸芬太尼注射液', '0.1mg×1支', '支', '湖北宜昌人福药业', '110', '101', '19.42', 'ZZSFTNZSY', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('41', '86979474000208', '枸橼酸芬太尼注射液', '0.5mg×1支', '支', '宜昌人福药业有限责任公司', '110', '101', '2.66', 'ZZSFTNZSY', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('42', '86979474000209', '酚红(AR)', '25g×1瓶', '瓶', '江西济民可信药业有限公司', '157', '101', '13.43', 'FH(AR)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('43', '86979474000208', '酚红IND', '25g×1瓶', '瓶', '', '157', '101', '4.07', 'FHIND', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('44', '86979474000209', '酚酞', '25g×1瓶', '瓶', '', '157', '101', '10.42', 'FT', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('45', '86979474000208', '蜂蜡', '500g×1瓶', '瓶', '华申康复', '157', '101', '3.47', 'FL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('46', '86979474000208', '呋喃西林', '25g×1袋', '袋', '', '157', '101', '37.75', 'ZZXL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('47', '86979474000209', '氯雷他定糖浆(开瑞坦)', '60ml：60mg×1瓶', '瓶', '上海先灵葆雅制药有限公司', '158', '101', '72.62', 'LLTDTJ(KRT)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('48', '86979474000208', '丙泊酚注射液(得普利麻)', '50ml：0.5g×1瓶', '瓶', '阿斯利康制药有限公司', '110', '101', '2.23', 'BBFZSY(DPLM)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('49', '86979474000209', 'BG维生素E软胶囊', '0.1g×30粒/盒', '盒', '浙江医药新昌制药厂', '159', '101', '11.03', 'BGWSSERJN', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('50', '86979474000208', '贝前列素钠片', '20ug×10片/盒', '盒', '北京泰德制药股份有限公司', '111', '101', '30.09', 'BQLSNP', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('51', '86979474000208', '盐酸伊立替康注射液(开普拓）', '5ml:100mg×1瓶', '瓶', '辉瑞制药', '110', '101', '7.42', 'YSYLTKZSY(KPT）', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('52', '86979474000209', '磺胺(AR)', '100g×1瓶', '瓶', '', '157', '101', '1.72', 'HA(AR)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('53', '86979474000208', '白附子', '1000mg/g', '克', '', '112', '103', '31.83', 'BFZ', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('54', '86979474000209', '白癫风胶囊', '1000mg/g', '克', '天津宏仁堂药业有限公司', '114', '101', '3.41', 'BZFJN', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('55', '86979474000208', '奋乃静片', '2mg×100片/瓶', '瓶', '上海朝晖药业有限公司', '111', '101', '0.54', 'FNJP', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('56', '86979474000208', '注射用头孢他啶(复达欣)', '1g×1支', '支', '葛兰素史克制药(苏州)有限公司', '110', '101', '8.05', 'ZSYTZTZ(FDX)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('57', '86979474000209', '复方氨基酸(绿支安)18AA注射液', '10.3%200ml×1瓶', '瓶', '广州绿十字制药有限公司', '110', '101', '49.18', 'FFAJS(LZA)18AAZSY', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('58', '86979474000208', '吡诺克辛滴眼液(卡林-U)', '5ml×1支', '支', '日本参天制药株式会社', '160', '101', '51.24', 'ZNKXDYY(KL-U)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('59', '86979474000209', '卡巴胆碱注射液（卡米可林）', '0.1mg×1支', '支', '山东正大福瑞达制药有限公司', '160', '101', '5.23', 'KBDJZSY（KMKL）', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('60', '86979474000208', '重组人粒细胞(特尔立)巨噬细胞集落冻干粉针', '150ug×1瓶', '瓶', '夏门特宝生物工程股份有限公司', '161', '101', '32.97', 'ZZRLXB(TEL)JSXBJLDGFZ', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('61', '86979474000208', '哌拉西林他唑巴坦钠(特治星)', '4.5g×1支', '支', '惠氏制药有限公司', '110', '101', '50.5', 'ZLXLTZBTN(TZX)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('62', '86979474000209', '地黄颗粒', '3g/10g/袋', '袋', '江阴天江药业有限公司', '115', '102', '5.48', 'DHKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('63', '86979474000208', '当归颗粒', '4g/10g/袋', '袋', '江阴天江药业有限公司', '115', '102', '68.19', 'DGKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('64', '86979474000209', '维生素B1注射液', '2ml:100mg×10支/盒', '盒', '杭州民生药业有限公司', '110', '101', '12.7', 'WSSB1ZSY', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('65', '86979474000208', '芒硝颗粒', '10g/4g/袋', '袋', '江阴天江药业有限公司', '115', '102', '13', 'MXKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('66', '86979474000208', '生大黄颗粒', '1g:3g/袋', '袋', '江阴天江药业有限公司', '115', '102', '30.87', 'SDHKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('67', '86979474000209', '虎杖颗粒', '1g/15g/袋', '袋', '江阴天江药业有限公司', '115', '102', '23.76', 'HZKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('68', '86979474000208', '鱼腥草颗粒', '1g/15g/袋', '袋', '江阴天江药业有限公司', '115', '102', '14.89', 'YXCKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('69', '86979474000209', '苦参颗粒', '1g/10g/袋', '袋', '江阴天江药业有限公司', '115', '102', '1.39', 'KCKL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('70', '86979474000208', '硫酸镁注射液', '10ml:2.5g×5支/盒', '盒', '杭州民生药业有限公司', '110', '101', '42.29', 'LSMZSY', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('71', '86979474000208', '胡黄连', '1000mg/g', '克', '进口', '112', '103', '37.2', 'HHL', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('72', '86979474000209', '虎杖', '1000mg/g', '克', '江苏', '112', '103', '16.01', 'HZ', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('73', '86979474000208', '聚桂醇注射液', '10ml:100mg×1支/盒', '盒', '陕西天宇制药有限公司S', '110', '101', '12.87', 'JGCZSY', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('74', '86979474000209', '康肤冲剂(I)', '20g×10袋/盒', '盒', '南京市中西医结合医院', '162', '102', '33.74', 'KFCJ(I)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('75', '86979474000208', '注射用头孢哌酮舒巴坦(舒普深)', '1.5g×1瓶', '瓶', '辉瑞制药有限公司（大连）', '110', '101', '2.07', 'ZSYTZZTSBT(SPS)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('76', '86979474000208', '清热通淋片', '0.39g*48片/盒', '盒', '江西杏林白马药业有限公司', '111', '101', '19.18', 'QRTLP', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('77', '86979474000209', '康莱特注射液', '10g×100ml/瓶', '瓶', '浙江康莱特药业有限公司', '110', '101', '11.36', 'KLTZSY', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('78', '86979474000208', '山茨菇', '1000mg/g', '克', ' 贵州', '112', '103', '70.02', 'SCG', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('79', '86979474000209', '马来酸桂哌齐特注射液(克林澳)', '80mg×1支', '支', '北京四环制药有限公司', '110', '101', '67.66', 'MLSGZQTZSY(KLA)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('80', '86979474000208', '氯化镁', '500g×1瓶', '瓶', '北京', '157', '101', '6.25', 'LHM', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('81', '86979474000208', '呋塞米注射液(速尿)', '2ml:20mg×10支/盒', '盒', '上海禾丰制药有限公司', '110', '101', '5.63', 'ZSMZSY(SN)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('82', '86979474000209', '注射用奈达铂（奥先达）', '10mg×1支', '支', '江苏奥赛康药业股份有限公司', '110', '101', '9.04', 'ZSYNDB（AXD）', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('83', '86979474000208', '注射用夫西地酸钠', '0.125g×1支', '支', 'G成都天台山制药有限公司', '110', '101', '44.97', 'ZSYFXDSN', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('84', '86979474000209', '阳起石', '1000mg/g', '克', '', '112', '103', '25.38', 'YQS', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('85', '86979474000208', '铜绿假单胞菌注射液', '1ml×1支', '支', '北京万特尔生物制药有限公司', '110', '101', '37.76', 'TLJDBJZSY', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('86', '86979474000208', '盐酸氟西汀胶囊(百忧解)', '20mg×7粒/盒', '盒', '礼来苏州制药有限公司', '111', '101', '15.61', 'YSFXTJN(BYJ)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('87', '86979474000209', '10%氯化钠注射液', '10ml:1g×5支/盒', '盒', '湖北天圣康迪制药有限公司', '110', '101', '4.5', '10%LHNZSY', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('88', '86979474000208', '注射用替考拉宁(他格适)', '200mg×1瓶', '瓶', '赛诺菲(北京)制药有限公司', '110', '101', '14.21', 'ZSYTKLN(TGS)', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('89', '86979474000209', '石决明', '1000mg/g', '克', ' 进口', '112', '103', '10.74', 'SJM', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('90', '86979474000208', '石榴皮', '1000mg/g', '克', '', '112', '103', '9.49', 'SLP', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('91', '86979474000208', '熟地', '1000mg/g', '克', '江苏', '112', '103', '55.1', 'SD', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('92', '86979474000209', '水牛角片', '1000mg/g', '克', '江苏', '112', '103', '5.68', 'SNJP', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('93', '86979474000208', '水蜈蚣', '1000mg/g', '克', '', '112', '103', '2.2', 'SZZ', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('94', '86979474000209', '水蛭', '1000mg/g', '克', '江苏', '112', '103', '71.56', 'SZ', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('95', '86979474000208', '苏梗', '1000mg/g', '克', '江苏', '112', '103', '17.14', 'SG', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('96', '86979474000208', '苏木', '1000mg/g', '克', '', '112', '103', '34.06', 'SM', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('97', '86979474000209', '太子参', '1000mg/g', '克', ' 江苏', '112', '103', '28.5', 'TZC', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('98', '86979474000208', '檀香', '1000mg/g', '克', '20101116', '112', '103', '1.48', 'TX', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('99', '86979474000209', '桃仁', '1000mg/g', '克', '陕西', '112', '103', '41.29', 'TR', '2020-03-01 00:00:00', '', '1');
INSERT INTO `drug` VALUES ('100', '86979474000208', '天冬', '1000mg/g', '克', '湖北', '112', '103', '38.04', 'TD', '2020-03-01 00:00:00', '', '1');

-- ----------------------------
-- Table structure for `examine`
-- ----------------------------
DROP TABLE IF EXISTS `examine`;
CREATE TABLE `examine` (
  `﻿examine_id` int(11) NOT NULL,
  `regist_id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `doc_id` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`﻿examine_id`) USING BTREE,
  UNIQUE KEY `﻿examine_UNIQUE` (`﻿examine_id`) USING BTREE,
  KEY `regist_id_idx` (`regist_id`) USING BTREE,
  CONSTRAINT `regist_id` FOREIGN KEY (`regist_id`) REFERENCES `regist_msg` (`regist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of examine
-- ----------------------------
INSERT INTO `examine` VALUES ('1', '60', '腹痛', '2020-03-25 08:39:40', '1', '1', '1');
INSERT INTO `examine` VALUES ('6', '61', '中毒', '2020-03-25 14:24:23', '1', '6', '1');
INSERT INTO `examine` VALUES ('7', '62', '中毒', '2020-03-25 14:24:23', '1', '6', '1');
INSERT INTO `examine` VALUES ('12', '63', '模板：肩周炎', '2020-03-25 16:51:38', '1', '6', '1');
INSERT INTO `examine` VALUES ('24', '64', '模板：骨外伤', '2020-03-26 09:02:05', '1', '1', '1');
INSERT INTO `examine` VALUES ('25', '65', '模板：骨外伤', '2020-03-26 09:02:05', '1', '1', '1');
INSERT INTO `examine` VALUES ('30', '66', '模板：小儿感冒', '2020-03-26 09:43:02', '1', '0', '1');
INSERT INTO `examine` VALUES ('31', '67', '模板：腱鞘炎', '2020-03-26 09:43:44', '1', '1', '1');
INSERT INTO `examine` VALUES ('32', '68', '模板：腱鞘炎', '2020-03-26 09:43:44', '1', '1', '1');
INSERT INTO `examine` VALUES ('33', '69', '模板：小儿感冒', '2020-03-26 09:55:12', '1', '1', '1');
INSERT INTO `examine` VALUES ('34', '70', '模板：小儿感冒', '2020-03-26 09:55:12', '1', '1', '1');
INSERT INTO `examine` VALUES ('37', '71', '模板：骨外伤', '2020-03-28 10:59:30', '1', '3', '1');
INSERT INTO `examine` VALUES ('38', '72', '模板：骨外伤', '2020-03-28 10:59:30', '1', '3', '1');
INSERT INTO `examine` VALUES ('39', '73', '模板：骨外伤', '2020-03-28 13:47:54', '1', '6', '1');
INSERT INTO `examine` VALUES ('40', '74', '模板：骨外伤', '2020-03-28 13:48:02', '1', '6', '1');
INSERT INTO `examine` VALUES ('41', '75', '模板：骨外伤', '2020-03-28 15:26:19', '1', '6', '1');
INSERT INTO `examine` VALUES ('42', '76', '模板：骨外伤', '2020-03-28 15:26:29', '1', '6', '1');
INSERT INTO `examine` VALUES ('43', '77', '模板：骨外伤', '2020-03-28 15:26:39', '1', '6', '1');
INSERT INTO `examine` VALUES ('44', '78', '模板：骨外伤', '2020-03-29 09:26:36', '1', '2', '1');
INSERT INTO `examine` VALUES ('45', '79', '模板：骨外伤', '2020-03-29 09:26:42', '1', '2', '1');
INSERT INTO `examine` VALUES ('46', '80', '模板：骨外伤', '2020-03-29 09:26:51', '1', '2', '1');
INSERT INTO `examine` VALUES ('47', '146', '模板：腱鞘炎', '2020-03-29 13:05:35', '1', '1', '1');
INSERT INTO `examine` VALUES ('48', '147', '模板：腱鞘炎', '2020-03-29 13:05:35', '1', '1', '1');
INSERT INTO `examine` VALUES ('49', '148', '模板：小儿感冒', '2020-03-29 14:47:28', '1', '3', '1');
INSERT INTO `examine` VALUES ('50', '149', '模板：小儿感冒', '2020-03-29 14:47:28', '1', '3', '1');
INSERT INTO `examine` VALUES ('51', '150', '模板：小儿感冒', '2020-03-29 15:20:02', '1', '2', '1');
INSERT INTO `examine` VALUES ('52', '151', '模板：小儿感冒', '2020-03-29 15:20:03', '1', '2', '1');

-- ----------------------------
-- Table structure for `examine_detail`
-- ----------------------------
DROP TABLE IF EXISTS `examine_detail`;
CREATE TABLE `examine_detail` (
  `﻿examine_detail_id` int(11) NOT NULL,
  `examine_id` int(11) NOT NULL,
  `location` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `urgent` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `check_person_id` int(11) NOT NULL,
  `result_person_id` int(11) NOT NULL,
  `check_time` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `check_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result_time` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`﻿examine_detail_id`) USING BTREE,
  UNIQUE KEY `﻿examine_detail_id_UNIQUE` (`﻿examine_detail_id`) USING BTREE,
  KEY `examine_id_idx` (`examine_id`) USING BTREE,
  CONSTRAINT `examine_id` FOREIGN KEY (`examine_id`) REFERENCES `examine` (`﻿examine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of examine_detail
-- ----------------------------
INSERT INTO `examine_detail` VALUES ('1', '1', '头部', '1', '1', '5', '4', '2020/3/12', '无大碍', '2020/3/13');
INSERT INTO `examine_detail` VALUES ('2', '6', '头部', '1', '1', '5', '4', '2020/3/13', '无大碍', '2020/3/14');
INSERT INTO `examine_detail` VALUES ('3', '7', '头部', '1', '1', '5', '4', '2020/3/14', '无大碍', '2020/3/15');
INSERT INTO `examine_detail` VALUES ('4', '12', '头部', '1', '1', '5', '4', '2020/3/15', '无大碍', '2020/3/16');
INSERT INTO `examine_detail` VALUES ('5', '24', '肩部', '1', '1', '5', '4', '2020/3/16', '无大碍', '2020/3/17');
INSERT INTO `examine_detail` VALUES ('6', '25', '肩部', '1', '1', '5', '4', '2020/3/17', '无大碍', '2020/3/18');
INSERT INTO `examine_detail` VALUES ('7', '30', '肩部', '1', '1', '5', '4', '2020/3/18', '无大碍', '2020/3/19');
INSERT INTO `examine_detail` VALUES ('8', '31', '肩部', '1', '1', '5', '4', '2020/3/19', '无大碍', '2020/3/20');
INSERT INTO `examine_detail` VALUES ('9', '32', '肩部', '1', '1', '5', '4', '2020/3/20', '无大碍', '2020/3/21');
INSERT INTO `examine_detail` VALUES ('10', '33', '肩部', '0', '1', '5', '4', '2020/3/21', '无大碍', '2020/3/22');
INSERT INTO `examine_detail` VALUES ('11', '34', '胸部', '0', '1', '5', '4', '2020/3/22', '无大碍', '2020/3/23');
INSERT INTO `examine_detail` VALUES ('12', '37', '胸部', '0', '1', '5', '4', '2020/3/23', '无大碍', '2020/3/24');
INSERT INTO `examine_detail` VALUES ('13', '38', '胸部', '0', '1', '5', '4', '2020/3/24', '无大碍', '2020/3/25');
INSERT INTO `examine_detail` VALUES ('14', '39', '胸部', '0', '1', '5', '4', '2020/3/25', '无大碍', '2020/3/26');
INSERT INTO `examine_detail` VALUES ('15', '40', '胸部', '0', '1', '5', '4', '2020/3/26', '无大碍', '2020/3/27');
INSERT INTO `examine_detail` VALUES ('16', '41', '胸部', '0', '1', '5', '4', '2020/3/27', '无大碍', '2020/3/28');
INSERT INTO `examine_detail` VALUES ('17', '42', '胸部', '0', '1', '5', '4', '2020/3/28', '无大碍', '2020/3/29');
INSERT INTO `examine_detail` VALUES ('18', '43', '胸部', '0', '1', '5', '4', '2020/3/29', '无大碍', '2020/3/30');
INSERT INTO `examine_detail` VALUES ('19', '44', '腹部', '0', '1', '5', '4', '2020/3/30', '无大碍', '2020/3/31');
INSERT INTO `examine_detail` VALUES ('20', '45', '腹部', '0', '1', '5', '4', '2020/3/31', '无大碍', '2020/4/1');
INSERT INTO `examine_detail` VALUES ('21', '46', '腹部', '0', '1', '5', '4', '2020/4/1', '无大碍', '2020/4/2');
INSERT INTO `examine_detail` VALUES ('22', '47', '腹部', '0', '1', '5', '4', '2020/4/2', '无大碍', '2020/4/3');
INSERT INTO `examine_detail` VALUES ('23', '48', '腹部', '0', '1', '5', '4', '2020/4/3', '无大碍', '2020/4/4');
INSERT INTO `examine_detail` VALUES ('24', '49', '腹部', '0', '1', '5', '4', '2020/4/4', '无大碍', '2020/4/5');
INSERT INTO `examine_detail` VALUES ('25', '50', '腹部', '0', '1', '5', '4', '2020/4/5', '无大碍', '2020/4/6');
INSERT INTO `examine_detail` VALUES ('26', '51', '腹部', '0', '1', '5', '4', '2020/4/6', '无大碍', '2020/4/7');
INSERT INTO `examine_detail` VALUES ('27', '52', '腿部', '0', '1', '5', '4', '2020/4/7', '无大碍', '2020/4/8');

-- ----------------------------
-- Table structure for `illness`
-- ----------------------------
DROP TABLE IF EXISTS `illness`;
CREATE TABLE `illness` (
  `﻿illness_id` int(11) NOT NULL,
  `illness_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `illness_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `internation_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `illness_cata_id` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`﻿illness_id`) USING BTREE,
  UNIQUE KEY `﻿illness_id_UNIQUE` (`﻿illness_id`) USING BTREE,
  UNIQUE KEY `illness_name_UNIQUE` (`illness_name`) USING BTREE,
  KEY `illness_cata_id_idx` (`illness_cata_id`) USING BTREE,
  CONSTRAINT `illness_cata_id_fk` FOREIGN KEY (`illness_cata_id`) REFERENCES `illness_cata` (`﻿illness_cata_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of illness
-- ----------------------------
INSERT INTO `illness` VALUES ('1', 'GDXHL', '古典型霍乱', 'A00.051', '140', '1');
INSERT INTO `illness` VALUES ('2', 'ZXDXHL', '中型[典型]霍乱', 'A00.052', '140', '1');
INSERT INTO `illness` VALUES ('3', 'ZXBFXHGXHL', '重型[暴发型或干性]霍乱', 'A00.053', '140', '1');
INSERT INTO `illness` VALUES ('4', 'QXFDXHL', '轻型[非典型]霍乱', 'A00.151', '140', '1');
INSERT INTO `illness` VALUES ('5', 'AETHL', '埃尔托霍乱', 'A00.152', '140', '1');
INSERT INTO `illness` VALUES ('6', 'AETXCY', '埃尔托小肠炎', 'A00.153', '33', '1');
INSERT INTO `illness` VALUES ('7', 'HL', '霍乱 NOS', 'A00.901', '140', '1');
INSERT INTO `illness` VALUES ('8', 'SH', '伤寒', 'A01.001', '306', '1');
INSERT INTO `illness` VALUES ('9', 'SHGJXBXZ', '伤寒杆菌性败血症', 'A01.002', '306', '1');
INSERT INTO `illness` VALUES ('10', 'SHXNMY', '伤寒性脑膜炎', 'A01.003+', '232', '1');
INSERT INTO `illness` VALUES ('11', 'SHFY', '伤寒肺炎', 'A01.051+', '81', '1');
INSERT INTO `illness` VALUES ('12', 'SHFMY', '伤寒腹膜炎', 'A01.052', '306', '1');
INSERT INTO `illness` VALUES ('13', 'ABTSBSH', '埃贝特Eberth`s氏病(伤寒)', 'A01.053', '306', '1');
INSERT INTO `illness` VALUES ('14', 'CCXXSH', '肠出血性伤寒', 'A01.054', '306', '1');
INSERT INTO `illness` VALUES ('15', 'SHXCCK', '伤寒性肠穿孔', 'A01.055', '306', '1');
INSERT INTO `illness` VALUES ('16', 'CSH', '肠伤寒', 'A01.056', '306', '1');
INSERT INTO `illness` VALUES ('17', 'SHYXCY', '伤寒样小肠炎', 'A01.057', '33', '1');
INSERT INTO `illness` VALUES ('18', 'JXFSH', '甲型副伤寒', 'A01.101', '306', '1');
INSERT INTO `illness` VALUES ('19', 'YXFSH', '乙型副伤寒', 'A01.201', '306', '1');
INSERT INTO `illness` VALUES ('20', 'BXFSH', '丙型副伤寒', 'A01.301', '306', '1');
INSERT INTO `illness` VALUES ('21', 'FSH', '副伤寒', 'A01.401', '306', '1');
INSERT INTO `illness` VALUES ('22', 'QSMSJCY', 'Ｂ群沙门氏菌肠炎', 'A02.001', '33', '1');
INSERT INTO `illness` VALUES ('23', 'QSMSJCY', 'Ｃ群沙门氏菌肠炎', 'A02.002', '33', '1');
INSERT INTO `illness` VALUES ('24', 'AGLSMSJCY', '阿哥拉沙门氏菌肠炎', 'A02.003', '33', '1');
INSERT INTO `illness` VALUES ('25', 'SMSJXCY', '沙门氏菌性肠炎', 'A02.004', '33', '1');
INSERT INTO `illness` VALUES ('26', 'SMSJLDXQXCY', '沙门氏菌伦敦血清型肠炎', 'A02.005', '33', '1');
INSERT INTO `illness` VALUES ('27', 'SMSJWCY', '沙门氏菌胃肠炎', 'A02.006', '33', '1');
INSERT INTO `illness` VALUES ('28', 'SSHSMSJXCY', '鼠伤寒沙门氏菌性肠炎', 'A02.007', '33', '1');
INSERT INTO `illness` VALUES ('29', 'YESMSJCY', '婴儿沙门氏菌肠炎', 'A02.008', '33', '1');
INSERT INTO `illness` VALUES ('30', 'SMSJCDGR', '沙门氏菌肠道感染', 'A02.051', '31', '1');
INSERT INTO `illness` VALUES ('31', 'SMSJYLSNXCY', '沙门氏菌(亚利桑那)小肠炎', 'A02.052', '33', '1');
INSERT INTO `illness` VALUES ('32', 'SMSJBXZ', '沙门氏菌败血症', 'A02.101', '9', '1');
INSERT INTO `illness` VALUES ('33', 'SMSJSSHBYBXZ', '沙门氏菌鼠伤寒伴有败血症', 'A02.102', '306', '1');
INSERT INTO `illness` VALUES ('34', 'SMSJXFY', '沙门氏菌性肺炎', 'A02.201+', '81', '1');
INSERT INTO `illness` VALUES ('35', 'SMSJXGJY', '沙门氏菌性关节炎', 'A02.202+', '123', '1');
INSERT INTO `illness` VALUES ('36', 'SMSJXNMY', '沙门氏菌性脑膜炎', 'A02.203+', '232', '1');
INSERT INTO `illness` VALUES ('37', 'SMSJXGSY', '沙门氏菌性骨髓炎', 'A02.251+', '114', '1');
INSERT INTO `illness` VALUES ('38', 'SMSJXSXGJZB', '沙门氏菌性肾小管-间质病', 'A02.252+', '161', '1');
INSERT INTO `illness` VALUES ('39', 'QTTZDSMSJGR', '其他特指的沙门氏菌感染', 'A02.851', '95', '1');
INSERT INTO `illness` VALUES ('40', 'SMSJGR', '沙门氏菌感染 NOS', 'A02.901', '95', '1');
INSERT INTO `illness` VALUES ('41', 'SSHSMSJGR', '鼠伤寒沙门氏菌感染', 'A02.902', '306', '1');
INSERT INTO `illness` VALUES ('42', 'SMSJSSWZD', '沙门氏菌属食物中毒', 'A02.903', '324', '1');
INSERT INTO `illness` VALUES ('43', 'SMSZHJLJ', '什密氏志贺菌痢疾', 'A03.001', '200', '1');
INSERT INTO `illness` VALUES ('44', 'ZHKLZLJYQZHJB', '志贺-克鲁泽痢疾[A亚群志贺菌病]', 'A03.051', '200', '1');
INSERT INTO `illness` VALUES ('45', 'SMCSDCLJ', '施米茨(－施蒂策)痢疾', 'A03.052', '200', '1');
INSERT INTO `illness` VALUES ('46', 'FSZHJLJ', '弗氏志贺菌痢疾', 'A03.101', '200', '1');
INSERT INTO `illness` VALUES ('47', 'XSLSXJXLJ', '希斯－罗素细菌性痢疾', 'A03.151', '380', '1');
INSERT INTO `illness` VALUES ('48', 'BSZHJLJ', '鲍氏志贺菌痢疾', 'A03.201', '200', '1');
INSERT INTO `illness` VALUES ('49', 'BYDXJXLJ', '波伊德细菌性痢疾', 'A03.251', '380', '1');
INSERT INTO `illness` VALUES ('50', 'SNSZHJLJ', '宋内氏志贺菌痢疾', 'A03.301', '200', '1');
INSERT INTO `illness` VALUES ('51', 'BDXZHJLJ', '不定型志贺菌痢疾', 'A03.801', '200', '1');
INSERT INTO `illness` VALUES ('52', 'JLHHGR', '菌痢混合感染', 'A03.802', '95', '1');
INSERT INTO `illness` VALUES ('53', 'QTZHJLJ', '其他志贺菌痢疾', 'A03.851', '200', '1');
INSERT INTO `illness` VALUES ('54', 'XJXLJ', '细菌性痢疾 NOS', 'A03.901', '380', '1');
INSERT INTO `illness` VALUES ('55', 'MXXJXLJJXFZ', '慢性细菌性痢疾急性发作', 'A03.902', '380', '1');
INSERT INTO `illness` VALUES ('56', 'MXQYXXJXLJ', '慢性迁延型细菌性痢疾', 'A03.903', '380', '1');
INSERT INTO `illness` VALUES ('57', 'MXYFXJL', '慢性隐伏型菌痢', 'A03.904', '278', '1');
INSERT INTO `illness` VALUES ('58', 'ZDXBFXLJ', '中毒性[暴发型]痢疾', 'A03.905', '200', '1');
INSERT INTO `illness` VALUES ('59', 'XJXJCY', '细菌性结肠炎', 'A03.951', '33', '1');
INSERT INTO `illness` VALUES ('60', 'XJXGJYLJ', '细菌性关节炎痢疾', 'A03.952+', '123', '1');
INSERT INTO `illness` VALUES ('61', 'XSECBYXDCAXSJCY', '新生儿肠病原性大肠埃希氏菌肠炎', 'A04.001', '33', '1');
INSERT INTO `illness` VALUES ('62', 'CBYXDCAXSJCY', '肠病原性大肠埃希氏菌肠炎', 'A04.002', '33', '1');
INSERT INTO `illness` VALUES ('63', 'CDYBXDCAXSJGR', '肠道原病性大肠埃希氏菌感染', 'A04.051', '31', '1');
INSERT INTO `illness` VALUES ('64', 'CDXDCAXSJCY', '肠毒性大肠埃希氏菌肠炎', 'A04.101', '33', '1');
INSERT INTO `illness` VALUES ('65', 'XSECDXDCAXSJCY', '新生儿肠毒性大肠埃希氏菌肠炎', 'A04.102', '33', '1');
INSERT INTO `illness` VALUES ('66', 'CDXDCAXSJGR', '肠毒性大肠埃希氏菌感染', 'A04.151', '95', '1');
INSERT INTO `illness` VALUES ('67', 'QXXDCAXSJCY', '侵袭性大肠埃希氏菌肠炎', 'A04.201', '33', '1');
INSERT INTO `illness` VALUES ('68', 'XSEQXXDCGJCY', '新生儿侵袭性大肠杆菌肠炎', 'A04.202', '33', '1');
INSERT INTO `illness` VALUES ('69', 'CXXDCAXSJCY', '出血性大肠埃希氏菌肠炎', 'A04.301', '33', '1');
INSERT INTO `illness` VALUES ('70', 'XSECXXDCGJCY', '新生儿出血性大肠杆菌肠炎', 'A04.302', '33', '1');
INSERT INTO `illness` VALUES ('71', 'DCAXSGJXCDGR', '大肠埃希氏杆菌性肠道感染', 'A04.401', '31', '1');
INSERT INTO `illness` VALUES ('72', 'XSEDCGJCY', '新生儿大肠杆菌肠炎', 'A04.402', '33', '1');
INSERT INTO `illness` VALUES ('73', 'XSENFXDCGJCY', '新生儿粘附性大肠杆菌肠炎', 'A04.403', '33', '1');
INSERT INTO `illness` VALUES ('74', 'NFXDCGJCY', '粘附性大肠杆菌肠炎', 'A04.404', '33', '1');
INSERT INTO `illness` VALUES ('75', 'WQGJCY', '弯曲杆菌肠炎', 'A04.501', '33', '1');
INSERT INTO `illness` VALUES ('76', 'YESSJCYBXB', '耶尔森氏菌肠炎[冰箱病]', 'A04.601', '33', '1');
INSERT INTO `illness` VALUES ('77', 'NBSZYBGJCY', '难辨梭状芽胞杆菌肠炎', 'A04.701', '33', '1');
INSERT INTO `illness` VALUES ('78', 'NBSZYBGJXXCJCY', '难辨梭状芽胞杆菌性小肠结肠炎', 'A04.751', '33', '1');
INSERT INTO `illness` VALUES ('79', 'BLDBJCY', '吡邻单胞菌肠炎', 'A04.801', '33', '1');
INSERT INTO `illness` VALUES ('80', 'BXGJXCY', '变形杆菌性肠炎', 'A04.802', '33', '1');
INSERT INTO `illness` VALUES ('81', 'CQGJCY', '产气杆菌肠炎', 'A04.803', '33', '1');
INSERT INTO `illness` VALUES ('82', 'CDYYJGR', '肠道厌氧菌感染', 'A04.804', '31', '1');
INSERT INTO `illness` VALUES ('83', 'FHL', '副霍乱', 'A04.805', '140', '1');
INSERT INTO `illness` VALUES ('84', 'FRXGJCY', '副溶血孤菌肠炎', 'A04.806', '33', '1');
INSERT INTO `illness` VALUES ('85', 'JHSPTQJXCY', '金黄色葡萄球菌性肠炎', 'A04.807', '33', '1');
INSERT INTO `illness` VALUES ('86', 'LNGJXCY', '绿脓杆菌性肠炎', 'A04.808', '33', '1');
INSERT INTO `illness` VALUES ('87', 'NBYBGJCY', '难辨芽胞杆菌肠炎', 'A04.809', '33', '1');
INSERT INTO `illness` VALUES ('88', 'SSQDBJCY', '嗜水气单胞菌肠炎', 'A04.810', '33', '1');
INSERT INTO `illness` VALUES ('89', 'CQJMSZYBGJCQJMGJCY', '产气荚膜梭状芽胞杆菌(产气荚膜杆菌)肠炎', 'A04.851', '33', '1');
INSERT INTO `illness` VALUES ('90', 'CDGR', '肠道感染', 'A04.901', '31', '1');
INSERT INTO `illness` VALUES ('91', 'XJXCY', '细菌性肠炎 NOS', 'A04.902', '33', '1');
INSERT INTO `illness` VALUES ('92', 'GRXFX', '感染性腹泻', 'A04.903', '95', '1');
INSERT INTO `illness` VALUES ('93', 'PTQJXSWZD', '葡萄球菌性食物中毒', 'A05.001', '324', '1');
INSERT INTO `illness` VALUES ('94', 'RDZD', '肉毒中毒', 'A05.101', '471', '1');
INSERT INTO `illness` VALUES ('95', 'RDSZYBGJXSWZD', '肉毒梭状芽胞杆菌性食物中毒', 'A05.151', '324', '1');
INSERT INTO `illness` VALUES ('96', 'CXXHSXCY', '出血性坏死性肠炎', 'A05.201', '33', '1');
INSERT INTO `illness` VALUES ('97', 'JXHSXCY', '急性坏死性肠炎', 'A05.202', '33', '1');
INSERT INTO `illness` VALUES ('98', 'JXCXXHSXCY', '急性出血性坏死性肠炎', 'A05.203', '33', '1');
INSERT INTO `illness` VALUES ('99', 'HSXCY', '坏死性肠炎', 'A05.251', '33', '1');
INSERT INTO `illness` VALUES ('100', 'CQJMSZYBGJWEXSZYBGJX', '产气夹膜梭状芽胞杆菌[韦尔希梭状芽胞杆菌]性食物中毒', 'A05.252', '324', '1');
INSERT INTO `illness` VALUES ('101', 'ZFB', '猪腹病', 'A05.253', '264', '1');
INSERT INTO `illness` VALUES ('102', 'FRXHJXSWZD', '副溶血弧菌性食物中毒', 'A05.301', '324', '1');
INSERT INTO `illness` VALUES ('103', 'LYYBGJXSWZD', '蜡样芽胞杆菌性食物中毒', 'A05.451', '324', '1');
INSERT INTO `illness` VALUES ('104', 'DCGJXSWZD', '大肠杆菌性食物中毒', 'A05.851', '324', '1');
INSERT INTO `illness` VALUES ('105', 'SYGJXSWZD', '嗜盐杆菌性食物中毒', 'A05.852', '324', '1');
INSERT INTO `illness` VALUES ('106', 'XJXSWZD', '细菌性食物中毒', 'A05.901', '324', '1');
INSERT INTO `illness` VALUES ('107', 'SWZD', '食物中毒 NOS', 'A05.951', '324', '1');
INSERT INTO `illness` VALUES ('108', 'WCXSWZD', '胃肠型食物中毒', 'A05.952', '324', '1');
INSERT INTO `illness` VALUES ('109', 'XCLCSWZD', '香肠(腊肠)食物中毒', 'A05.953', '324', '1');
INSERT INTO `illness` VALUES ('110', 'AMBXCY', '阿米巴性肠炎', 'A06.001', '33', '1');
INSERT INTO `illness` VALUES ('111', 'AMBXJCY', '阿米巴性结肠炎', 'A06.002', '33', '1');

-- ----------------------------
-- Table structure for `illness_cata`
-- ----------------------------
DROP TABLE IF EXISTS `illness_cata`;
CREATE TABLE `illness_cata` (
  `﻿illness_cata_id` int(11) NOT NULL AUTO_INCREMENT,
  `illness_cata_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `illness_cata_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`﻿illness_cata_id`) USING BTREE,
  UNIQUE KEY `﻿illness_cata_id_UNIQUE` (`﻿illness_cata_id`) USING BTREE,
  UNIQUE KEY `illness_cata_name_UNIQUE` (`illness_cata_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of illness_cata
-- ----------------------------
INSERT INTO `illness_cata` VALUES ('9', '', '败血症', '9', '1');
INSERT INTO `illness_cata` VALUES ('31', '', '肠道疾病', '31', '1');
INSERT INTO `illness_cata` VALUES ('33', '', '肠炎', '33', '1');
INSERT INTO `illness_cata` VALUES ('81', '', '肺炎', '81', '1');
INSERT INTO `illness_cata` VALUES ('95', '', '感染', '95', '1');
INSERT INTO `illness_cata` VALUES ('114', '', '骨髓炎', '114', '1');
INSERT INTO `illness_cata` VALUES ('123', '', '关节疾病', '123', '1');
INSERT INTO `illness_cata` VALUES ('140', '', '霍乱', '140', '1');
INSERT INTO `illness_cata` VALUES ('161', '', '间质病', '161', '1');
INSERT INTO `illness_cata` VALUES ('200', '', '痢疾', '200', '1');
INSERT INTO `illness_cata` VALUES ('232', '', '脑膜炎', '232', '1');
INSERT INTO `illness_cata` VALUES ('264', '', '其它腹部疾病', '264', '1');
INSERT INTO `illness_cata` VALUES ('278', '', '其它暂时无法归类的', '278', '1');
INSERT INTO `illness_cata` VALUES ('306', '', '伤寒', '306', '1');
INSERT INTO `illness_cata` VALUES ('324', '', '食物中毒', '324', '1');
INSERT INTO `illness_cata` VALUES ('380', '', '细菌性疾病', '380', '1');
INSERT INTO `illness_cata` VALUES ('471', '', '中毒', '471', '1');

-- ----------------------------
-- Table structure for `invoice`
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `invoice_ID` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_num` int(11) NOT NULL,
  `invoice_fee` double NOT NULL,
  `invoice_valid` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `person_id` int(11) NOT NULL,
  `regist_id` int(11) NOT NULL,
  `charge_type` int(11) NOT NULL,
  `rush_red_invoice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `invoice_state` int(11) NOT NULL,
  PRIMARY KEY (`invoice_ID`) USING BTREE,
  UNIQUE KEY `﻿invoice_ID_UNIQUE` (`invoice_ID`) USING BTREE,
  UNIQUE KEY `invoice_num_UNIQUE` (`invoice_num`) USING BTREE,
  KEY `person_id_fk_idx` (`person_id`) USING BTREE,
  KEY `regist_id_idx` (`regist_id`) USING BTREE,
  KEY `charge_type_idx` (`charge_type`) USING BTREE,
  CONSTRAINT `charge_type_pk` FOREIGN KEY (`charge_type`) REFERENCES `const_item` (`const_id`),
  CONSTRAINT `person_id_pk` FOREIGN KEY (`person_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES ('132', '800802', '48.65', '1', '2020-07-11 11:26:23', '9', '61', '51', '', '0');
INSERT INTO `invoice` VALUES ('133', '800803', '-8.65', '1', '2020-07-11 11:27:48', '9', '62', '51', '', '0');
INSERT INTO `invoice` VALUES ('134', '800804', '48.65', '1', '2020-07-11 11:38:23', '9', '63', '51', '', '0');
INSERT INTO `invoice` VALUES ('135', '800805', '-48.65', '1', '2020-07-11 11:39:40', '9', '64', '51', '', '0');
INSERT INTO `invoice` VALUES ('136', '800806', '77.9', '1', '2020-07-11 11:40:19', '9', '65', '51', '', '0');
INSERT INTO `invoice` VALUES ('137', '800807', '-67.9', '1', '2020-07-11 11:41:37', '9', '66', '51', '', '0');
INSERT INTO `invoice` VALUES ('138', '800808', '-10', '1', '2020-07-11 11:42:42', '9', '67', '51', '', '0');
INSERT INTO `invoice` VALUES ('139', '800809', '8', '1', '2020-07-11 13:25:23', '9', '68', '51', '', '0');
INSERT INTO `invoice` VALUES ('142', '800810', '129.94', '1', '2020-07-11 13:33:54', '9', '69', '51', '', '0');
INSERT INTO `invoice` VALUES ('143', '800811', '-129.94', '2', '2020-07-11 13:38:56', '9', '70', '51', '', '0');
INSERT INTO `invoice` VALUES ('144', '800812', '247.37', '1', '2020-07-11 13:39:37', '9', '71', '52', '', '0');
INSERT INTO `invoice` VALUES ('145', '800813', '-155', '1', '2020-07-11 13:39:57', '9', '72', '51', '', '0');
INSERT INTO `invoice` VALUES ('146', '800814', '89', '1', '2020-06-25 11:44:13', '9', '73', '51', '', '0');
INSERT INTO `invoice` VALUES ('147', '800815', '90', '1', '2020-06-25 11:45:33', '9', '74', '51', '', '0');
INSERT INTO `invoice` VALUES ('148', '800816', '91', '1', '2020-06-25 11:52:32', '9', '75', '51', '', '0');
INSERT INTO `invoice` VALUES ('149', '800817', '92', '1', '2020-06-25 11:55:24', '9', '76', '51', '', '0');
INSERT INTO `invoice` VALUES ('150', '800818', '93', '1', '2020-06-25 12:01:39', '9', '77', '51', '', '0');
INSERT INTO `invoice` VALUES ('151', '800819', '94', '1', '2020-06-25 12:02:17', '9', '78', '51', '', '0');
INSERT INTO `invoice` VALUES ('152', '800820', '95', '1', '2020-06-25 12:03:04', '9', '79', '51', '', '0');
INSERT INTO `invoice` VALUES ('153', '800821', '96', '1', '2020-06-25 12:03:34', '9', '80', '51', '', '0');
INSERT INTO `invoice` VALUES ('154', '800822', '97', '1', '2020-06-25 12:04:44', '9', '146', '51', '', '0');
INSERT INTO `invoice` VALUES ('155', '800823', '27', '1', '2020-06-25 12:05:30', '9', '147', '51', '', '0');
INSERT INTO `invoice` VALUES ('156', '800824', '27', '1', '2020-06-25 14:21:33', '9', '148', '51', '', '0');
INSERT INTO `invoice` VALUES ('157', '800825', '0', '2', '2020-06-25 14:22:52', '9', '149', '51', '', '0');
INSERT INTO `invoice` VALUES ('158', '800826', '0', '1', '2020-06-25 14:25:11', '9', '150', '51', '', '0');
INSERT INTO `invoice` VALUES ('159', '800827', '-27', '1', '2020-06-25 14:28:50', '9', '151', '51', '', '0');
INSERT INTO `invoice` VALUES ('160', '800828', '47.19', '1', '2020-07-14 19:42:59', '10', '153', '51', '', '0');
INSERT INTO `invoice` VALUES ('161', '800829', '47.19', '1', '2020-07-14 19:47:49', '10', '153', '51', '', '0');
INSERT INTO `invoice` VALUES ('162', '800830', '86.36999999999999', '1', '2020-07-16 16:39:36', '10', '157', '51', '', '0');
INSERT INTO `invoice` VALUES ('163', '800831', '-86.36999999999999', '1', '2020-07-16 16:47:34', '10', '157', '51', '162', '0');
INSERT INTO `invoice` VALUES ('164', '800832', '143.7', '1', '2020-07-17 18:07:32', '10', '160', '51', '', '0');
INSERT INTO `invoice` VALUES ('166', '10000', '0', '1', '2020-08-04 15:25:08', '1', '154', '52', '', '0');
INSERT INTO `invoice` VALUES ('168', '123456', '133.56', '1', '2020-08-22 13:21:54', '10', '600656', '51', '', '0');
INSERT INTO `invoice` VALUES ('169', '11111', '57.230000000000004', '1', '2020-08-25 22:08:39', '10', '600665', '52', '', '0');
INSERT INTO `invoice` VALUES ('173', '112233', '49.36000000000001', '1', '2020-09-20 21:18:33', '10', '600665', '51', '', '0');

-- ----------------------------
-- Table structure for `medical_record_homepage`
-- ----------------------------
DROP TABLE IF EXISTS `medical_record_homepage`;
CREATE TABLE `medical_record_homepage` (
  `medical_record_id` int(11) NOT NULL,
  `regist_id` int(11) NOT NULL AUTO_INCREMENT,
  `chief_complaint` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `hist_of_pres_ill` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `treat_of_pres_ill` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `past_hist` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `allergic_hist` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `phys_examination` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `exam_suggestion` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `attention` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `check_result` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `diagnose_result` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `process_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `medical_record_status` int(11) NOT NULL,
  PRIMARY KEY (`regist_id`,`medical_record_id`) USING BTREE,
  CONSTRAINT `regist_id_fk_11` FOREIGN KEY (`regist_id`) REFERENCES `regist_msg` (`regist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of medical_record_homepage
-- ----------------------------
INSERT INTO `medical_record_homepage` VALUES ('600600', '60', '半月前受凉后开始咳嗽，呈阵发性，无畏冷发热，无咯血及胸痛，伴有少量的白色黏稠痰。曾服止咳糖浆等3天，效果不好。', '阵发性咳嗽半月', '曾服止咳糖浆等3天，效果不好', '既往有10年余慢性咳嗽史，曾诊断为“慢性支气管炎”，不吸烟。否认肺结核病史。', '无', 'BP 128/80mmHg,无呼吸困难，唇不发绀，双肺有散在干性啰音，未闻及湿啰性啰音，心率90次/min，律齐，无杂音，腹平软无压痛，肝脾未触及，双下肢无浮肿。', '血常规，胸片', '无', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600601', '61', '转移性右下腹痛伴恶心、呕吐8小时。', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约200毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', '该患以转移性右下腹痛伴恶心、呕吐8小时于2008年06月11日入院。', '无结核及肝炎病史，无糖尿病及心脏病、高血压病史，无药物过敏史及手术史。', '无', '无', '血常规', '无', '', '', '', '1');
INSERT INTO `medical_record_homepage` VALUES ('600602', '62', '间断性右上腹疼痛2年。', '该患缘于2年前无明显诱因开始出现右上腹部隐痛，伴右胸背部放散痛，无肩部放散痛，腹痛呈间断性发作，曾予以抗感染治疗（具体药名及剂量不详）后腹痛可缓解。', '于2010年1月14日在四平市爱龄齐医院行超声检查提示：胆囊多发结石，但未经治疗，今为进一步治疗来我院，门诊以胆囊结石收入院。病程中无寒战、高热，无反酸、嗳气，无恶心、呕吐，无呕血、黑便，无黄染。患病以来，睡眠不良，食欲欠佳，大小便正常。', '无结核及肝炎病史，无糖尿病及心脏病、高血压病史，无药物过敏史及手术史。', '无', '无', '腹部彩超（2008-06-11）', '低脂饮食', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600603', '63', '右下腹痛伴恶心。', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约200毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', '该患以转移性右下腹痛伴恶心、呕吐8小时于2008年06月11日入院。', '无结核及肝炎病史，无糖尿病及心脏病、高血压病史，无药物过敏史及手术史。', '无', '无', '血常规', '无', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600604', '64', '难受', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约201毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', '333', '444', '555', '666', '777', '888', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600605', '65', '某某', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约202毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', '33', '44', '55', '66', 'ww', 'gggg', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600606', '66', '某某某某某', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约203毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', '************', '************', '************', '***************', '***', '***', '', '', '', '3');
INSERT INTO `medical_record_homepage` VALUES ('600607', '67', '某某某某某', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约204毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', 'q', 'q', 'q', 'q', 'q', 'q', '', '', '', '3');
INSERT INTO `medical_record_homepage` VALUES ('600600', '68', '某某某某某', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约205毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', '3', '3', '3', '3', '3', '3', '', '', '', '3');
INSERT INTO `medical_record_homepage` VALUES ('600600', '69', '某某某某某', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约206毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '', '', '', '3');
INSERT INTO `medical_record_homepage` VALUES ('600610', '70', '某某某某某', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约207毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', '', '', '', '', '', '', '', '', '', '3');
INSERT INTO `medical_record_homepage` VALUES ('600611', '71', '某某某某某', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约208毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', '', '', '', '', '', '', '', '', '', '3');
INSERT INTO `medical_record_homepage` VALUES ('600612', '72', '某某某某某', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约209毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', '', '', '', '', '', '', '', '', '', '3');
INSERT INTO `medical_record_homepage` VALUES ('600613', '73', '某某某某某', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约210毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', '', '', '', '', '', '', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600614', '74', '某某某某某', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约211毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', '', '', '', '', '', '', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600615', '75', '某某某某某', '该患于8小时前无诱因出现腹部疼痛，初表现为上腹部隐痛，4小时后疼痛逐渐加重并转移至右下腹固定，无腰背部及会阴部放散痛，呈阵发性发作，伴有恶心、呕吐数次，呕吐物为胃内容物，量共约212毫升，未经任何诊治，今因腹痛不缓解前来我院就诊，门诊以“腹痛待查”收入院。病程中患者无咳嗽、咳痰，无心悸、气短，无呼吸困难，无腹胀、腹泻，无尿频、尿急、尿痛及血尿，患病以来，睡眠不良，食欲欠佳，大小便正常。', '吃了头孢', '发烧', '无', '体温偏高', '', '', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600653', '152', '1', '1', '11', '1', '1', '1', '1', '1', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600654', '154', null, null, null, null, null, null, null, null, null, '并无大碍', null, '3');
INSERT INTO `medical_record_homepage` VALUES ('600654', '155', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600655', '156', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600656', '157', '2周前超声检查发现胆囊结石', '胃部疼痛过了两周未缓解', '输液两天', '有不良饮食情况', '无过敏史', '无', '彩超', '注意饮食', '无', '初步诊断，胆结石', '无', '3');
INSERT INTO `medical_record_homepage` VALUES ('600657', '158', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600658', '159', '', '', '', '', '', '', '', '', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600659', '160', '2周前超声检查发现胆囊结石', '胃部疼痛过了两周未缓解', '输液两天', '有不良饮食情况', '无过敏史', '无', '彩超', '注意饮食', '无', '初步诊断，胆结石', '无', '3');
INSERT INTO `medical_record_homepage` VALUES ('600662', '163', '无', '无', '无', '无', '无', '无', '无', '无', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600663', '167', '无', '无', '无', '无', '无', '无', '无', '无', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600664', '172', '曾雨阳', '曾雨阳', '曾雨阳', '曾雨阳', '曾雨阳', '曾雨阳', '曾雨阳', '曾雨阳', '', '', '', '2');
INSERT INTO `medical_record_homepage` VALUES ('600665', '173', '某某某', '无', '无', '无', '无', '无', '无', '无', '', '', '', '2');

-- ----------------------------
-- Table structure for `medical_template`
-- ----------------------------
DROP TABLE IF EXISTS `medical_template`;
CREATE TABLE `medical_template` (
  `﻿medical_template_id` int(11) NOT NULL,
  `medical_template_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `doc_id` int(11) NOT NULL,
  `create_time` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scope` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`﻿medical_template_id`) USING BTREE,
  UNIQUE KEY `﻿medical_template_id_UNIQUE` (`﻿medical_template_id`) USING BTREE,
  KEY `doc_id_fk_idx` (`doc_id`) USING BTREE,
  CONSTRAINT `medical_template_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of medical_template
-- ----------------------------
INSERT INTO `medical_template` VALUES ('1', '小儿感冒', '1', '2020-03-22 16:46:37', '1', '1', '1');
INSERT INTO `medical_template` VALUES ('2', '腱鞘炎', '1', '2020-03-22 16:47:58', '1', '1', '1');
INSERT INTO `medical_template` VALUES ('3', '肩周炎', '1', '2020-03-22 16:48:37', '1', '1', '1');
INSERT INTO `medical_template` VALUES ('4', '骨外伤', '1', '2020-03-22 17:09:05', '3', '1', '1');

-- ----------------------------
-- Table structure for `medical_template_detail`
-- ----------------------------
DROP TABLE IF EXISTS `medical_template_detail`;
CREATE TABLE `medical_template_detail` (
  `﻿medical_temp_detail_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `part` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`﻿medical_temp_detail_id`) USING BTREE,
  UNIQUE KEY `﻿medical_temp_detail_id_UNIQUE` (`﻿medical_temp_detail_id`) USING BTREE,
  KEY `template_id_idx` (`template_id`) USING BTREE,
  CONSTRAINT `template_id_fk` FOREIGN KEY (`template_id`) REFERENCES `medical_template` (`﻿medical_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of medical_template_detail
-- ----------------------------
INSERT INTO `medical_template_detail` VALUES ('1', '2', '全身', '1');
INSERT INTO `medical_template_detail` VALUES ('2', '2', '全身', '1');
INSERT INTO `medical_template_detail` VALUES ('3', '4', '全身', '1');
INSERT INTO `medical_template_detail` VALUES ('4', '4', '胃部', '1');
INSERT INTO `medical_template_detail` VALUES ('5', '1', '胃部', '1');
INSERT INTO `medical_template_detail` VALUES ('6', '1', '胃部', '1');
INSERT INTO `medical_template_detail` VALUES ('7', '3', '胃部', '1');
INSERT INTO `medical_template_detail` VALUES ('8', '3', '胃部', '1');

-- ----------------------------
-- Table structure for `no_drug`
-- ----------------------------
DROP TABLE IF EXISTS `no_drug`;
CREATE TABLE `no_drug` (
  `﻿no_drug_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_code` int(11) NOT NULL,
  `p_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `specification` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit_price` double NOT NULL,
  `price_type_id` int(11) NOT NULL,
  `execute_dep_id` int(11) NOT NULL,
  `code_to_rem` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` date NOT NULL,
  `last_change` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`﻿no_drug_id`) USING BTREE,
  KEY `no_drug_ibfk_1` (`execute_dep_id`) USING BTREE,
  CONSTRAINT `no_drug_ibfk_1` FOREIGN KEY (`execute_dep_id`) REFERENCES `department` (`depart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of no_drug
-- ----------------------------
INSERT INTO `no_drug` VALUES ('1', '120200001', '大抢救', '日', '200', '16', '133', 'DQJ', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('2', '120200002', '中抢救', '日', '150', '16', '133', 'ZQJ', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('3', '120200003', '小抢救', '日', '80', '16', '133', 'XQJ', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('4', '120300001', '中心吸氧', '小时', '2.5', '16', '122', 'ZXXY', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('5', '120300002', '低流量吸氧', '小时', '2', '16', '122', 'DLLXY', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('6', '120300003', '高频吸氧', '小时', '4', '16', '122', 'GPXY', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('7', '120500001', '大清创缝合', '次', '120', '16', '133', 'DQCFH', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('8', '120500002', '中清创缝合', '次', '80', '16', '133', 'ZQCFH', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('9', '120500003', '小清创缝合', '次', '40', '16', '133', 'XQCFH', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('10', '121000001', '洗胃', '次', '40', '16', '133', 'XW', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('11', '120800002', '肠内高营养治疗', '日', '5', '16', '133', 'CNGYYZL', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('12', '121500001', '灌肠', '次', '10', '16', '133', 'GC', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('13', '240100003', '计算机治疗计划系统(TPS)', '疗程', '180', '7', '128', 'JSJZLJHXT', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('14', '240100004', '特定计算机治疗计划系统', '疗程', '500', '7', '128', 'TDJSJZLJHXT', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('18', '240100004', '逆向调强TPS及优化治疗计划系统', '疗程', '500', '7', '128', 'NXTQTPSJYHZLJHXT', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('19', '240100005', '放射治疗的适时监控', '次', '50', '7', '128', 'FSZLDSSJK', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('20', '210101001', '普通透视', '每个部位', '5', '7', '128', 'PTTS', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('25', '210101002', '食管钡餐透视', '次', '15', '7', '128', 'SGBCTS', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('26', '210101003', '床旁透视与术中透视', '半小时', '40', '7', '128', 'CPTSYSZTS', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('27', '210101004', 'C型臂术中透视', '半小时', '150', '7', '128', 'CXBSZTS', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('28', '210103001', '气脑造影', '次', '80', '7', '128', 'QNZY', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('29', '210103003', '脑室碘水造影', '次', '60', '7', '128', 'NSDSZY', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('30', '210103004', 'X清肌酸激酶－MB同工酶活性测定（干化X法）', '次', '60', '3', '125', 'XQJSJM－MBTGMHXCD（GHXF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('31', '210103005', 'X清肌酸激酶－MB同工酶活性测定（金标法）', '次', '60', '3', '125', 'XQJSJM－MBTGMHXCD（JBF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('32', '210103006', '尿α1微量球蛋白测定（化X发光法）', '单侧', '50', '3', '125', 'Nα1WLQDBCD（HXFGF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('33', '210103007', 'β2微球蛋白测定（各种免疫X方法）', '单侧', '50', '3', '125', 'β2WQDBCD（GZMYXFF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('34', '210103008', 'X清β2微球蛋白测定（化X发光法）', '单侧', '40', '3', '125', 'XQβ2WQDBCD（HXFGF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('35', '210103009', '尿β2微球蛋白测定（化X发光法）', '单侧', '80', '3', '125', 'Nβ2WQDBCD（HXFGF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('36', '210103010', '尿蛋白电泳分析（凝胶法）', '单侧', '70', '3', '125', 'NDBDYFX（NJF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('37', '210103011', 'X清抗谷氨酸脱J酶抗体测定（各种免疫X方法）', '单侧', '50', '3', '125', 'XQKGASTJMKTCD（GZMYXFF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('38', '210103012', '胃泌素测定（各种免疫X方法）', '次', '50', '3', '125', 'WMSCD（GZMYXFF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('39', '210103013', 'X浆凝X酶原时间测定(PT)(仪器法)', '次', '50', '3', '125', 'XJNXMYSJCD(PT)(YQF)', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('40', '210103014', 'X清肌酸激酶－MB同工酶活性测定（速率法）', '次', '60', '3', '125', 'XQJSJM－MBTGMHXCD（SLF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('41', '210103015', '醛固酮测定（化X发光法、荧光免疫法）', '次', '50', '3', '125', 'QGTCD（HXFGF、YGMYF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('42', '210103016', '尿儿茶酚胺测定（色谱法）', '次', '80', '3', '125', 'NECFACD（SPF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('43', '210103017', '尿香草苦杏仁酸(VMA)测定（色谱法）', '次', '60', '3', '125', 'NXCKXRS(VMA)CD（SPF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('44', '210103018', 'X浆肾素活性测定', '次', '80', '3', '125', 'XJSSHXCD', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('45', '210103019', 'X管紧张素Ⅱ测定', '次', '100', '3', '125', 'XGJZSⅡCD', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('46', '210103020', '促红细胞生成素测定', '次', '50', '3', '125', 'CHXBSCSCD', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('47', '210103021', '睾酮测定（化X发光法、荧光免疫法）', '次', '80', '3', '125', 'ZTCD（HXFGF、YGMYF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('48', '210103022', '葡萄糖测定（干化X法）(X清)', '次', '300', '3', '125', 'PTTCD（GHXF）(XQ)', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('49', '210103023', '糖化X红蛋白测定（色谱法）', '次', '80', '3', '125', 'THXHDBCD（SPF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('50', '210103024', 'X浆乳酸测定', '次', '80', '3', '125', 'XJRSCD', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('51', '210103025', '尿N-X-β-D-氨基葡萄糖苷酶测定', '次', '70', '3', '125', 'NN-X-β-D-AJPTTZMCD', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('52', '210103026', '尿β-D-半乳糖苷酶测定', '次', '50', '3', '125', 'Nβ-D-BRTZMCD', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('53', '210103027', '唐氏综合症筛查', '单侧', '70', '3', '125', 'TSZHZSC', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('54', '210103028', '雌三醇测定（化X发光法、荧光免疫法）', '次', '50', '3', '125', 'CSCCD（HXFGF、YGMYF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('55', '210103029', '雌二醇测定（化X发光法、荧光免疫法）', '次', '50', '3', '125', 'CECCD（HXFGF、YGMYF）', '2020-03-01', '', '1');
INSERT INTO `no_drug` VALUES ('56', '210103030', '孕酮测定（化X发光法、荧光免疫法）', '单侧', '50', '3', '125', 'YTCD（HXFGF、YGMYF）', '2020-03-01', '', '1');

-- ----------------------------
-- Table structure for `prescription`
-- ----------------------------
DROP TABLE IF EXISTS `prescription`;
CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL,
  `medical_record_id` int(11) NOT NULL,
  `regist_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `medical_record_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL COMMENT '1-已开立 2-已作废 3-已缴费 4-已退费',
  PRIMARY KEY (`prescription_id`) USING BTREE,
  UNIQUE KEY `﻿prescription_id_UNIQUE` (`prescription_id`) USING BTREE,
  KEY `regist_id_fk_1_idx` (`regist_id`) USING BTREE,
  CONSTRAINT `regist_id_fk_1` FOREIGN KEY (`regist_id`) REFERENCES `regist_msg` (`regist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of prescription
-- ----------------------------
INSERT INTO `prescription` VALUES ('1', '600600', '60', '2', '小儿感冒', '2020-03-17 17:19:19', '2');
INSERT INTO `prescription` VALUES ('2', '600601', '61', '5', '肠炎', '2020-03-17 17:59:19', '2');
INSERT INTO `prescription` VALUES ('38', '600602', '62', '1', '模板：念珠菌性皮炎', '2020-03-28 10:27:28', '1');
INSERT INTO `prescription` VALUES ('39', '600603', '63', '1', '新增处方1', '2020-03-28 10:38:57', '1');
INSERT INTO `prescription` VALUES ('40', '600604', '64', '1', '新增处方1', '2020-03-28 11:00:14', '2');
INSERT INTO `prescription` VALUES ('41', '600605', '65', '1', '新增处方1', '2020-03-28 13:46:47', '2');
INSERT INTO `prescription` VALUES ('46', '600606', '66', '1', 'www', '2020-03-28 15:27:01', '2');
INSERT INTO `prescription` VALUES ('47', '600607', '67', '1', '模板：病毒性胃肠炎', '2020-03-28 15:28:12', '2');
INSERT INTO `prescription` VALUES ('48', '600600', '68', '1', 's1', '2020-03-29 09:27:12', '2');
INSERT INTO `prescription` VALUES ('51', '600600', '69', '1', '模板：病毒性胃肠炎', '2020-03-29 14:47:46', '3');
INSERT INTO `prescription` VALUES ('52', '600610', '70', '1', '模板：念珠菌性皮炎', '2020-03-29 14:47:52', '3');
INSERT INTO `prescription` VALUES ('53', '600611', '71', '1', '模板：病毒性胃肠炎', '2020-03-29 15:20:15', '2');
INSERT INTO `prescription` VALUES ('54', '600612', '72', '1', '模板：季节性常发哮喘', '2020-03-29 15:20:22', '2');
INSERT INTO `prescription` VALUES ('55', '600613', '73', '1', '模板：季节性常发哮喘', '2020-03-29 15:42:04', '1');
INSERT INTO `prescription` VALUES ('56', '600614', '74', '1', 'a1', '2020-07-11 13:27:53', '2');
INSERT INTO `prescription` VALUES ('57', '600615', '75', '1', '模板：支气管哮喘', '2020-07-11 13:47:39', '1');
INSERT INTO `prescription` VALUES ('58', '600617', '76', '2', '感冒', '2020-06-25 00:46:50', '1');
INSERT INTO `prescription` VALUES ('59', '600618', '77', '2', '感冒', '2020-06-25 08:12:23', '1');
INSERT INTO `prescription` VALUES ('60', '600619', '78', '2', '感冒', '2020-06-25 08:14:36', '1');
INSERT INTO `prescription` VALUES ('61', '600620', '79', '2', '感冒', '2020-06-25 08:15:08', '1');
INSERT INTO `prescription` VALUES ('62', '600621', '80', '2', '感冒', '2020-06-25 08:16:03', '1');
INSERT INTO `prescription` VALUES ('63', '600647', '146', '2', '感冒', '2020-06-25 08:16:50', '1');
INSERT INTO `prescription` VALUES ('64', '600648', '147', '2', '感冒', '2020-06-25 08:18:10', '1');
INSERT INTO `prescription` VALUES ('65', '600649', '148', '2', '感冒', '2020-06-25 08:18:36', '1');
INSERT INTO `prescription` VALUES ('66', '600650', '149', '2', '感冒', '2020-06-25 08:19:38', '1');
INSERT INTO `prescription` VALUES ('67', '600651', '150', '2', '感冒', '2020-06-25 08:20:22', '1');
INSERT INTO `prescription` VALUES ('68', '600652', '151', '2', '感冒', '2020-06-25 08:21:14', '1');
INSERT INTO `prescription` VALUES ('69', '600654', '154', '2', '某某某', '13:19:40', '1');
INSERT INTO `prescription` VALUES ('70', '600654', '154', '2', '有一个', '13:30:21', '1');
INSERT INTO `prescription` VALUES ('71', '600654', '153', '1', '某某某', '2020-07-14 13:38:33', '1');
INSERT INTO `prescription` VALUES ('72', '600654', '153', '1', '发烧', '2020-07-14 13:40:01', '1');
INSERT INTO `prescription` VALUES ('73', '600654', '153', '1', '发烧', '2020-07-14 13:41:23', '1');
INSERT INTO `prescription` VALUES ('74', '600654', '153', '1', '发烧', '2020-07-14 13:42:05', '1');
INSERT INTO `prescription` VALUES ('75', '600654', '153', '1', '发烧', '2020-07-14 13:44:06', '1');
INSERT INTO `prescription` VALUES ('76', '600654', '153', '1', '发烧', '2020-07-14 13:45:16', '1');
INSERT INTO `prescription` VALUES ('77', '600654', '153', '1', '发烧', '2020-07-14 13:46:07', '1');
INSERT INTO `prescription` VALUES ('78', '600654', '153', '1', '发烧', '2020-07-14 13:48:17', '1');
INSERT INTO `prescription` VALUES ('79', '600654', '153', '1', '发烧', '2020-07-14 13:49:04', '1');
INSERT INTO `prescription` VALUES ('80', '600654', '153', '1', '发烧', '2020-07-14 13:54:25', '1');
INSERT INTO `prescription` VALUES ('81', '600654', '153', '1', '发烧', '2020-07-14 13:56:50', '1');
INSERT INTO `prescription` VALUES ('82', '600654', '153', '1', '发烧', '2020-07-14 13:58:40', '1');
INSERT INTO `prescription` VALUES ('83', '600654', '153', '1', '发烧', '2020-07-14 13:59:54', '1');
INSERT INTO `prescription` VALUES ('84', '600654', '153', '1', '发烧', '2020-07-14 14:01:09', '1');
INSERT INTO `prescription` VALUES ('85', '600654', '153', '1', '发烧', '2020-07-14 14:01:34', '1');
INSERT INTO `prescription` VALUES ('88', '600656', '157', '1', '普通1', '2020-07-16 11:28:59', '1');
INSERT INTO `prescription` VALUES ('89', '600656', '157', '1', '普通22', '2020-07-16 11:41:32', '1');
INSERT INTO `prescription` VALUES ('90', '600656', '157', '1', '普通22', '2020-07-16 11:43:31', '1');
INSERT INTO `prescription` VALUES ('91', '600656', '157', '1', '普通1', '2020-07-16 13:00:29', '1');
INSERT INTO `prescription` VALUES ('92', '600656', '157', '1', '普通1', '2020-07-16 13:50:01', '1');
INSERT INTO `prescription` VALUES ('93', '600659', '160', '1', '胆结石处方', '2020-07-17 17:53:36', '1');
INSERT INTO `prescription` VALUES ('98', '600657', '158', '1', '感冒', '2020-08-02 20:30:49', '1');
INSERT INTO `prescription` VALUES ('99', '600657', '158', '1', '感冒', '2020-08-03 15:00:36', '1');
INSERT INTO `prescription` VALUES ('100', '600659', '160', '1', '模板:念珠菌性皮炎', '2020-08-04 10:16:38', '1');
INSERT INTO `prescription` VALUES ('101', '600650', '149', '1', '模板:念珠菌性皮炎', '2020-08-15 11:39:27', '1');
INSERT INTO `prescription` VALUES ('107', '600656', '157', '1', '治脑壳疼', '2020-08-22 11:30:57', '1');
INSERT INTO `prescription` VALUES ('108', '600665', '173', '3', '模板:念珠菌性皮炎', '2020-09-20 21:17:37', '1');
INSERT INTO `prescription` VALUES ('109', '600665', '173', '3', '处方1', '2020-09-20 21:17:37', '1');

-- ----------------------------
-- Table structure for `prescription_detail`
-- ----------------------------
DROP TABLE IF EXISTS `prescription_detail`;
CREATE TABLE `prescription_detail` (
  `prescription_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `prescription_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `usage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `use_level` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `freq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 表示未缴费 2 表示已缴费 3 表示以退费',
  PRIMARY KEY (`prescription_detail_id`) USING BTREE,
  UNIQUE KEY `﻿prescription_detail_id_UNIQUE` (`prescription_detail_id`) USING BTREE,
  KEY `prescription_id_idx` (`prescription_id`) USING BTREE,
  CONSTRAINT `prescription_id` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`prescription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of prescription_detail
-- ----------------------------
INSERT INTO `prescription_detail` VALUES ('1', '1', '1', '口服', '30g', '一日二次', '10', '1');
INSERT INTO `prescription_detail` VALUES ('2', '2', '2', '口服', '5g', '一日二次', '5', '1');
INSERT INTO `prescription_detail` VALUES ('3', '38', '3', '1', '1', '1', '1', '1');
INSERT INTO `prescription_detail` VALUES ('4', '39', '4', '1', '1', '1', '1', '1');
INSERT INTO `prescription_detail` VALUES ('5', '40', '5', '', '', '', '1', '1');
INSERT INTO `prescription_detail` VALUES ('6', '41', '6', '静脉注射', '100ml', '一日一次', '1', '1');
INSERT INTO `prescription_detail` VALUES ('7', '46', '7', '静脉注射', '200ml', '一日一次', '1', '1');
INSERT INTO `prescription_detail` VALUES ('8', '47', '8', '1', '1', '1', '1', '1');
INSERT INTO `prescription_detail` VALUES ('9', '48', '9', '1', '1', '1', '1', '1');
INSERT INTO `prescription_detail` VALUES ('10', '51', '10', '', '', '', '1', '1');
INSERT INTO `prescription_detail` VALUES ('11', '52', '11', '口服', '1g', '一日三次', '1', '1');
INSERT INTO `prescription_detail` VALUES ('12', '53', '12', '口服', '2g', '一日三次', '1', '1');
INSERT INTO `prescription_detail` VALUES ('13', '54', '13', '口服', '适量', '多次', '1', '1');
INSERT INTO `prescription_detail` VALUES ('14', '55', '14', '口服', '1g', '一日三次', '1', '1');
INSERT INTO `prescription_detail` VALUES ('15', '56', '15', '口服', '2g', '一日三次', '1', '1');
INSERT INTO `prescription_detail` VALUES ('16', '57', '16', '口服', '适量', '多次', '1', '1');
INSERT INTO `prescription_detail` VALUES ('17', '58', '17', 'q', 'q', 'q', '3', '1');
INSERT INTO `prescription_detail` VALUES ('18', '59', '18', 'w', 'w', 'w', '2', '1');
INSERT INTO `prescription_detail` VALUES ('19', '60', '19', 'e', 'e', 'e', '3', '1');
INSERT INTO `prescription_detail` VALUES ('20', '61', '20', '11', '11', '11', '1', '1');
INSERT INTO `prescription_detail` VALUES ('21', '62', '21', '22', '22', '22', '1', '1');
INSERT INTO `prescription_detail` VALUES ('22', '63', '22', '', '', '', '68', '1');
INSERT INTO `prescription_detail` VALUES ('23', '64', '23', '', '', '', '23', '1');
INSERT INTO `prescription_detail` VALUES ('24', '65', '24', '', '', '', '68', '1');
INSERT INTO `prescription_detail` VALUES ('25', '66', '25', '', '', '', '23', '1');
INSERT INTO `prescription_detail` VALUES ('26', '67', '26', '', '', '', '68', '1');
INSERT INTO `prescription_detail` VALUES ('27', '68', '27', '', '', '', '23', '1');
INSERT INTO `prescription_detail` VALUES ('28', '84', '1', '\"口服\"', '\"20g\"', '\"一天三次\"', '3', '2');
INSERT INTO `prescription_detail` VALUES ('29', '85', '1', '\"口服\"', '\"20g\"', '\"一天三次\"', '3', '2');
INSERT INTO `prescription_detail` VALUES ('30', '90', '1', '\"口服\"', '\"20g\"', '\"一天三次\"', '3', '4');
INSERT INTO `prescription_detail` VALUES ('31', '92', '1', '\"口服\"', '\"10g\"', '\"一天三次\"', '3', '4');
INSERT INTO `prescription_detail` VALUES ('32', '92', '2', '\"冲剂\"', '\"2ml\"', '\"一天两次\"', '2', '4');
INSERT INTO `prescription_detail` VALUES ('33', '92', '3', '\"口服\"', '\"2g\"', '\"一天四次\"', '1', '4');
INSERT INTO `prescription_detail` VALUES ('34', '93', '1', '\"口服\"', '\"10g\"', '\"一天三次\"', '3', '1');
INSERT INTO `prescription_detail` VALUES ('35', '93', '2', '\"口服\"', '\"10g\"', '\"一天三次\"', '3', '1');
INSERT INTO `prescription_detail` VALUES ('36', '93', '3', '\"冲剂\"', '\"10g\"', '\"一天三次\"', '3', '1');
INSERT INTO `prescription_detail` VALUES ('37', '93', '3', '口服', '20g', '一天三次', '2', '1');
INSERT INTO `prescription_detail` VALUES ('38', '98', '9', '口服', '20g', '一天三次', '7', '1');
INSERT INTO `prescription_detail` VALUES ('39', '98', '11', '外敷', '10g', '一天两次', '10', '1');
INSERT INTO `prescription_detail` VALUES ('40', '99', '69', '口服', '2勺', '一日二次', '4', '1');
INSERT INTO `prescription_detail` VALUES ('41', '99', '68', '口服', '10g', '一日三次', '2', '1');
INSERT INTO `prescription_detail` VALUES ('42', '100', '56', '静脉注射', '100ml', '一日一次', '3', '1');
INSERT INTO `prescription_detail` VALUES ('43', '100', '57', '静脉注射', '200ml', '一日一次', '1', '1');
INSERT INTO `prescription_detail` VALUES ('44', '101', '56', '静脉注射', '100ml', '一日一次', '1', '1');
INSERT INTO `prescription_detail` VALUES ('45', '101', '57', '静脉注射', '200ml', '一日一次', '1', '1');
INSERT INTO `prescription_detail` VALUES ('59', '108', '57', '静脉注射', '200ml', '一日一次', '1', '4');
INSERT INTO `prescription_detail` VALUES ('60', '108', '9', '', '', '', '1', '4');
INSERT INTO `prescription_detail` VALUES ('61', '109', '9', '', '', '', '1', '4');

-- ----------------------------
-- Table structure for `prescription_template`
-- ----------------------------
DROP TABLE IF EXISTS `prescription_template`;
CREATE TABLE `prescription_template` (
  `﻿presrciption_template_id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `doc_id` int(11) NOT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scope` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`﻿presrciption_template_id`) USING BTREE,
  UNIQUE KEY `﻿presrciption_template_id_UNIQUE` (`﻿presrciption_template_id`) USING BTREE,
  UNIQUE KEY `create_time_UNIQUE` (`create_time`,`doc_id`) USING BTREE,
  KEY `doc_id_fk_1` (`doc_id`) USING BTREE,
  CONSTRAINT `doc_id_fk_1` FOREIGN KEY (`doc_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of prescription_template
-- ----------------------------
INSERT INTO `prescription_template` VALUES ('2', '念珠菌性皮炎', '1', '2020-03-21 13:25:45', '科室', '1');
INSERT INTO `prescription_template` VALUES ('3', '急性黄疸性丁型肝炎', '1', '2020-03-21 13:25:59', '全院', '1');
INSERT INTO `prescription_template` VALUES ('4', '病毒性胃肠炎', '1', '2020-03-21 13:26:25', '个人', '1');
INSERT INTO `prescription_template` VALUES ('5', '流行性腮腺炎 NOS', '1', '2020-03-21 13:26:33', '科室', '1');
INSERT INTO `prescription_template` VALUES ('7', '春季常发性感冒', '1', '2020-03-22 16:34:08', '个人', '1');
INSERT INTO `prescription_template` VALUES ('8', '季节性常发哮喘', '1', '2020-03-29 14:50:13', '全院', '1');
INSERT INTO `prescription_template` VALUES ('9', '支气管哮喘', '1', '2020-07-11 13:43:44', '全院', '1');

-- ----------------------------
-- Table structure for `prescription_template_detail`
-- ----------------------------
DROP TABLE IF EXISTS `prescription_template_detail`;
CREATE TABLE `prescription_template_detail` (
  `﻿prescription_template_detail_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `usage` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `use_level` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `freq` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`﻿prescription_template_detail_id`) USING BTREE,
  UNIQUE KEY `﻿prescription_template_detail_id_UNIQUE` (`﻿prescription_template_detail_id`) USING BTREE,
  UNIQUE KEY `drug_id_UNIQUE` (`drug_id`,`prescription_id`) USING BTREE,
  KEY `temp_id_fk` (`prescription_id`) USING BTREE,
  CONSTRAINT `temp_id_fk` FOREIGN KEY (`prescription_id`) REFERENCES `prescription_template` (`﻿presrciption_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of prescription_template_detail
-- ----------------------------
INSERT INTO `prescription_template_detail` VALUES ('2', '2', '56', '静脉注射', '100ml', '一日一次', '1');
INSERT INTO `prescription_template_detail` VALUES ('3', '2', '57', '静脉注射', '200ml', '一日一次', '1');
INSERT INTO `prescription_template_detail` VALUES ('4', '5', '58', '', '', '', '1');
INSERT INTO `prescription_template_detail` VALUES ('6', '3', '59', '11', '11', '11', '1');
INSERT INTO `prescription_template_detail` VALUES ('7', '3', '60', '22', '22', '22', '1');
INSERT INTO `prescription_template_detail` VALUES ('8', '7', '61', '1', '1', '1', '1');
INSERT INTO `prescription_template_detail` VALUES ('9', '4', '62', '1', '1', '1', '1');
INSERT INTO `prescription_template_detail` VALUES ('10', '4', '63', '1', '1', '1', '1');
INSERT INTO `prescription_template_detail` VALUES ('11', '4', '64', '', '', '', '1');
INSERT INTO `prescription_template_detail` VALUES ('12', '8', '65', '口服', '1g', '一日三次', '1');
INSERT INTO `prescription_template_detail` VALUES ('13', '8', '66', '口服', '2g', '一日三次', '1');
INSERT INTO `prescription_template_detail` VALUES ('14', '8', '67', '口服', '适量', '多次', '1');
INSERT INTO `prescription_template_detail` VALUES ('15', '9', '68', '11', '11', '11', '1');
INSERT INTO `prescription_template_detail` VALUES ('18', '9', '69', '22', '22', '22', '1');

-- ----------------------------
-- Table structure for `regist_lev`
-- ----------------------------
DROP TABLE IF EXISTS `regist_lev`;
CREATE TABLE `regist_lev` (
  `reg_level` int(11) NOT NULL,
  `reg_code` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reg_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order` int(11) NOT NULL,
  `reg_fee` int(11) NOT NULL,
  `reg_limit` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`reg_level`) USING BTREE,
  UNIQUE KEY `﻿reg_level_UNIQUE` (`reg_level`) USING BTREE,
  UNIQUE KEY `order_UNIQUE` (`order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of regist_lev
-- ----------------------------
INSERT INTO `regist_lev` VALUES ('1', 'zjh', '专家号', '1', '50', '20', '1');
INSERT INTO `regist_lev` VALUES ('2', 'pth', '普通号', '2', '8', '30', '1');

-- ----------------------------
-- Table structure for `regist_msg`
-- ----------------------------
DROP TABLE IF EXISTS `regist_msg`;
CREATE TABLE `regist_msg` (
  `regist_id` int(11) NOT NULL,
  `medical_record_no` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `id_number` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `age` int(11) NOT NULL,
  `age_type` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `apm` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dep_no` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `reg_type` int(11) NOT NULL,
  `settlement_cata` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `medical_records` int(11) NOT NULL,
  `registrar` int(11) NOT NULL,
  `diagnose_state` int(11) NOT NULL,
  PRIMARY KEY (`regist_id`) USING BTREE,
  UNIQUE KEY `﻿regist_id_UNIQUE` (`regist_id`) USING BTREE,
  KEY `doc_id_fk_idx` (`doc_id`) USING BTREE,
  CONSTRAINT `doc_id_fk` FOREIGN KEY (`doc_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of regist_msg
-- ----------------------------
INSERT INTO `regist_msg` VALUES ('60', '600600', '张伟', '71', '110101199003073335', '2000-02-02', '18', '岁', '北京', '2020-03-18 00:00:00', '上午', '1', '3', '2', '自费', '1', '301', '2');
INSERT INTO `regist_msg` VALUES ('61', '600601', '赵建东', '71', '110101199003073634', '2000-02-03', '17', '岁', '雄安', '2020-03-19 00:00:00', '下午', '2', '3', '1', '自费', '1', '301', '4');
INSERT INTO `regist_msg` VALUES ('62', '600602', '王健林', '71', '110101199003075496', '2000-02-04', '11', '岁', '某尔滨', '2020-03-18 00:00:00', '上午', '2', '3', '2', '自费', '0', '301', '4');
INSERT INTO `regist_msg` VALUES ('69', '600600', '张伟', '71', '110101199003073335', '2000-02-02', '18', '岁', '北京', '2020-03-28 00:00:00', '上午', '1', '3', '1', '自费', '0', '301', '4');
INSERT INTO `regist_msg` VALUES ('70', '600610', '王安石', '71', '210102199208050938', '2000-02-12', '11', '岁', '香港', '2020-03-28 00:00:00', '下午', '1', '3', '1', '自费', '1', '9', '1');
INSERT INTO `regist_msg` VALUES ('71', '600611', '李煜', '71', '210102199208051834', '2000-02-13', '33', '岁', '杭州', '2020-03-28 00:00:00', '下午', '1', '3', '1', '自费', '1', '10', '4');
INSERT INTO `regist_msg` VALUES ('72', '600612', '孟浩然', '71', '210102199208058972', '2000-02-14', '23', '岁', '南京', '2020-03-26 00:00:00', '上午', '1', '3', '1', '自费', '1', '9', '1');
INSERT INTO `regist_msg` VALUES ('73', '600613', '王勃', '71', '210102199208055392', '2000-02-15', '22', '岁', '武汉', '2020-03-29 00:00:00', '上午', '1', '3', '1', '自费', '0', '9', '4');
INSERT INTO `regist_msg` VALUES ('74', '600614', '范仲淹', '71', '210102199208056053', '2000-02-16', '22', '岁', '成都', '2020-03-29 00:00:00', '上午', '1', '3', '1', '自费', '0', '9', '2');
INSERT INTO `regist_msg` VALUES ('75', '600615', '陶渊明', '71', '210102199208059377', '2000-02-17', '33', '岁', '深圳', '2020-03-29 00:00:00', '上午', '1', '3', '1', '自费', '0', '9', '2');
INSERT INTO `regist_msg` VALUES ('76', '600617', '苏洵', '71', '210102199208059916', '2000-02-18', '8', '岁', '重庆', '2020-07-11 00:00:00', '下午', '1', '3', '1', '自费', '1', '9', '4');
INSERT INTO `regist_msg` VALUES ('77', '600618', '苏辙', '71', '210102199208058999', '2000-02-19', '22', '岁', '厦门', '2020-07-11 00:00:00', '下午', '1', '3', '2', '自费', '0', '9', '2');
INSERT INTO `regist_msg` VALUES ('80', '600621', '苏轼', '71', '21010219920805025X', '2000-02-20', '19', '岁', '沈阳', '2020-06-24 00:00:00', '下午', '1', '3', '2', '自费', '0', '9', '4');
INSERT INTO `regist_msg` VALUES ('146', '600647', '罗隐', '71', '440304199210189222', '2000-03-20', '20', '岁', '深圳', '2020-07-02 00:00:00', '下午', '1', '3', '1', '自费', '1', '9', '1');
INSERT INTO `regist_msg` VALUES ('147', '600648', '杨万里', '71', '440304199210186267', '2000-03-21', '21', '岁', '深圳', '2020-07-03 00:00:00', '下午', '1', '3', '1', '自费', '1', '9', '1');
INSERT INTO `regist_msg` VALUES ('155', '600654', '张三', '71', '130730200010213419', '2000-10-21', '21', '岁', '张家口', '2020-07-15 14:50:18', '下午', '1', '3', '1', '自费', '0', '10', '2');
INSERT INTO `regist_msg` VALUES ('156', '600655', '王杰', '71', '1001258796486933', '2001-10-21', '20', '岁', '沈阳', '2020-07-15 14:53:20', '下午', '1', '3', '1', '自费', '0', '10', '4');
INSERT INTO `regist_msg` VALUES ('159', '600658', '王五', '71', '17845962365996889', '2000-10-21', '21', '岁', '张家口市', '2020-07-17 17:30:32', '上午', '1', '3', '1', '自费', '0', '10', '4');
INSERT INTO `regist_msg` VALUES ('160', '600659', '赵五', '71', '178459623659965559', '2000-10-21', '21', '岁', '张家口市', '2020-07-17 17:36:33', '上午', '1', '3', '1', '自费', '0', '10', '2');
INSERT INTO `regist_msg` VALUES ('161', '600660', '张伟', '71', '110101199003073335', '2000-02-02', '21', '岁', '北京', '2020-07-28 08:00:00', '上午', '85', '3', '1', '自费', '0', '10', '1');
INSERT INTO `regist_msg` VALUES ('162', '600661', '赵建东', '71', '110101199003073634', '2000-02-03', '21', '岁', '雄安', '2020-07-14 08:00:00', '下午', '1', '3', '1', '自费', '0', '10', '4');
INSERT INTO `regist_msg` VALUES ('163', '600662', '张伟', '71', '110101199003073335', '2000-02-02', '21', '岁', '北京', '2020-07-07 08:00:00', '上午', '1', '3', '1', '自费', '1', '10', '2');
INSERT INTO `regist_msg` VALUES ('165', '600600', '张伟', '71', '110101199003073335', '2000-02-02', '21', '岁', '北京', '2020-07-31 08:00:00', '上午', '1', '3', '1', '自费', '1', '10', '4');
INSERT INTO `regist_msg` VALUES ('166', '600600', '张伟', '71', '110101199003073335', '2000-02-02', '21', '岁', '北京', '2020-07-31 08:00:00', '上午', '1', '3', '1', '自费', '1', '10', '1');
INSERT INTO `regist_msg` VALUES ('167', '600663', '李玉欢', '71', '155826399896895745', '2000-02-03', '21', '岁', '南京', '2020-07-07 08:00:00', '上午', '1', '3', '1', '自费', '1', '10', '4');
INSERT INTO `regist_msg` VALUES ('168', '600664', '老番茄', '72', '210102199901160000', '1999-01-16', '20', '岁', '沈阳', '2020-08-22 08:00:00', '下午', '1', '3', '1', '自费', '1', '10', '2');
INSERT INTO `regist_msg` VALUES ('169', '600664', '老番茄', '72', '210102199901160000', '1999-01-16', '20', '岁', '辽宁', '2020-08-25 08:00:00', '下午', '1', '3', '2', '医保', '0', '10', '3');
INSERT INTO `regist_msg` VALUES ('170', '600664', '老番茄', '72', '210102199901160000', '1999-01-16', '20', '岁', '中国', '2020-08-25 08:00:00', '上午', '1', '3', '2', '公费', '0', '10', '1');
INSERT INTO `regist_msg` VALUES ('171', '600664', '老番茄', '72', '210102199901160000', '1999-01-16', '20', '岁', '地球', '2020-08-25 08:00:00', '上午', '1', '3', '1', '自费', '0', '10', '4');
INSERT INTO `regist_msg` VALUES ('172', '600664', '老番茄', '72', '210102199901160000', '1999-01-16', '20', '岁', '沈阳', '2020-09-20 08:00:00', '上午', '1', '3', '2', '自费', '1', '10', '1');

INSERT INTO `regist_msg` VALUES ('173', '600665', '花少北', '71', '210102200101160000', '2001-01-16', '20', '岁', '辽宁', '2020-08-25 08:00:00', '下午', '1', '9', '2', '医保', '0', '10', '3');

-- ----------------------------
-- Table structure for `schdule`
-- ----------------------------
DROP TABLE IF EXISTS `schdule`;
CREATE TABLE `schdule` (
  `﻿schdule_id` int(11) NOT NULL,
  `schdule_time` date NOT NULL,
  `dep_no` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `apm` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `schdule_rule_id` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`﻿schdule_id`,`tag`) USING BTREE,
  UNIQUE KEY `﻿schdule_id_UNIQUE` (`﻿schdule_id`) USING BTREE,
  KEY `doc_id_idx` (`doc_id`) USING BTREE,
  KEY `schdule_rule_id_idx` (`schdule_rule_id`) USING BTREE,
  CONSTRAINT `schdule_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `schdule_ibfk_2` FOREIGN KEY (`schdule_rule_id`) REFERENCES `schdule_rule` (`﻿rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schdule
-- ----------------------------
INSERT INTO `schdule` VALUES ('54', '2020-07-11', '1', '1', '上午', '1', '1');
INSERT INTO `schdule` VALUES ('55', '2020-07-12', '1', '2', '上午', '3', '1');
INSERT INTO `schdule` VALUES ('57', '2020-07-11', '1', '2', '下午', '3', '1');
INSERT INTO `schdule` VALUES ('58', '2020-07-11', '1', '3', '下午', '6', '1');
INSERT INTO `schdule` VALUES ('59', '2020-07-12', '1', '2', '上午', '3', '1');
INSERT INTO `schdule` VALUES ('60', '2020-07-12', '1', '3', '上午', '6', '1');
INSERT INTO `schdule` VALUES ('61', '2020-07-12', '1', '2', '下午', '3', '1');
INSERT INTO `schdule` VALUES ('62', '2020-07-12', '1', '3', '下午', '6', '1');
INSERT INTO `schdule` VALUES ('63', '2020-07-13', '1', '2', '上午', '3', '1');
INSERT INTO `schdule` VALUES ('64', '2020-07-11', '1', '1', '下午', '1', '1');
INSERT INTO `schdule` VALUES ('65', '2020-07-13', '1', '3', '上午', '6', '1');
INSERT INTO `schdule` VALUES ('66', '2020-07-13', '1', '2', '下午', '3', '1');
INSERT INTO `schdule` VALUES ('67', '2020-07-12', '1', '1', '上午', '1', '1');
INSERT INTO `schdule` VALUES ('68', '2020-07-13', '1', '3', '下午', '6', '1');
INSERT INTO `schdule` VALUES ('69', '2020-07-12', '1', '1', '下午', '1', '1');
INSERT INTO `schdule` VALUES ('70', '2020-07-14', '1', '3', '上午', '6', '1');
INSERT INTO `schdule` VALUES ('71', '2020-07-13', '1', '1', '上午', '1', '1');
INSERT INTO `schdule` VALUES ('72', '2020-07-14', '1', '3', '下午', '6', '1');
INSERT INTO `schdule` VALUES ('73', '2020-07-13', '1', '1', '下午', '1', '1');
INSERT INTO `schdule` VALUES ('74', '2020-07-15', '1', '3', '上午', '6', '1');
INSERT INTO `schdule` VALUES ('75', '2020-07-14', '1', '1', '上午', '1', '1');
INSERT INTO `schdule` VALUES ('76', '2020-07-14', '1', '1', '下午', '1', '1');
INSERT INTO `schdule` VALUES ('77', '2020-07-15', '1', '1', '上午', '1', '1');

-- ----------------------------
-- Table structure for `schdule_rule`
-- ----------------------------
DROP TABLE IF EXISTS `schdule_rule`;
CREATE TABLE `schdule_rule` (
  `﻿rule_id` int(11) NOT NULL,
  `rule_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dep_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `week` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`﻿rule_id`) USING BTREE,
  UNIQUE KEY `﻿rule_id_UNIQUE` (`﻿rule_id`) USING BTREE,
  KEY `doc_id_idx` (`doc_id`) USING BTREE,
  CONSTRAINT `doc_id` FOREIGN KEY (`doc_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schdule_rule
-- ----------------------------
INSERT INTO `schdule_rule` VALUES ('1', '周一到周五', '1', '1', '11111111100000', '1');
INSERT INTO `schdule_rule` VALUES ('2', '周一到周五', '2', '6', '11111111110000', '1');
INSERT INTO `schdule_rule` VALUES ('3', '周一到周五', '1', '2', '11111100000000', '1');
INSERT INTO `schdule_rule` VALUES ('4', '周一到周五', '2', '5', '11111111100000', '1');
INSERT INTO `schdule_rule` VALUES ('5', '周一到周五', '2', '4', '11111100000000', '1');
INSERT INTO `schdule_rule` VALUES ('6', '周一到周五', '1', '3', '11111111100000', '1');
INSERT INTO `schdule_rule` VALUES ('7', '周日值班', '2', '6', '00000000001100', '1');
INSERT INTO `schdule_rule` VALUES ('8', '周日值班', '2', '5', '00000000000011', '1');
INSERT INTO `schdule_rule` VALUES ('9', '周四周五', '2', '6', '00000011110000', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rel_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_type` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `scheduling` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dep_no` int(11) NOT NULL,
  `reg_lev` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `﻿user_id_UNIQUE` (`user_id`) USING BTREE,
  UNIQUE KEY `user_name_UNIQUE` (`user_name`) USING BTREE,
  KEY `title_id_fk_idx` (`title_id`) USING BTREE,
  KEY `reg_lev_fk` (`reg_lev`) USING BTREE,
  KEY `dep_no_fk_idx` (`dep_no`) USING BTREE,
  CONSTRAINT `dep_no_fk` FOREIGN KEY (`dep_no`) REFERENCES `department` (`depart_id`),
  CONSTRAINT `reg_lev_fk` FOREIGN KEY (`reg_lev`) REFERENCES `regist_lev` (`reg_level`),
  CONSTRAINT `title_id_fk` FOREIGN KEY (`title_id`) REFERENCES `const_item` (`const_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'bianque', 'bianque123', '扁鹊', '3', '81', '是', '1', '1', '1');
INSERT INTO `user` VALUES ('2', 'fwb', 'fwb123', '张仲景', '3', '82', '是', '1', '2', '1');
INSERT INTO `user` VALUES ('3', 'doctor', '123456', '钟南山', '3', '83', '是', '1', '2', '1');
INSERT INTO `user` VALUES ('4', 'huatuo', 'huatuo123', '华佗', '3', '81', '是', '2', '1', '1');
INSERT INTO `user` VALUES ('5', 'xll', 'xll123', '葛洪', '3', '83', '是', '2', '2', '1');
INSERT INTO `user` VALUES ('6', 'adq', 'adq123', '孙思邈', '3', '83', '是', '2', '2', '1');
INSERT INTO `user` VALUES ('8', 'dd', 'iop888', '钱乙', '1', '84', '否', '9', '2', '1');
INSERT INTO `user` VALUES ('9', 'root', 'root', '李时珍', '3', '81', '否', '1', '1', '1');
INSERT INTO `user` VALUES ('10', 'operator', '123456', '挂号收费员', '2', '81', '否', '1', '1', '1');
INSERT INTO `user` VALUES ('11', 'admin', 'admin123', '医院管理员', '1', '81', '否', '1', '1', '1');
INSERT INTO `user` VALUES ('12', 'operation', 'operation123', '操作员', '2', '81', '否', '1', '1', '1');
INSERT INTO `user` VALUES ('13', '123', '123', '汪禹霖', '3', '81', '是', '1', '1', '1');
INSERT INTO `user` VALUES ('14', '234', '123', '曾医生', '3', '81', '是', '85', '2', '1');
INSERT INTO `user` VALUES ('15', '345', '123', '孙振', '3', '81', '是', '85', '2', '1');
INSERT INTO `user` VALUES ('16', '456', '123', '雷神山医生', '3', '81', '是', '85', '1', '1');
INSERT INTO `user` VALUES ('17', '567', '123', '火神山医生', '3', '81', '是', '85', '1', '1');

