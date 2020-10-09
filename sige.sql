/*
Navicat MariaDB Data Transfer

Source Server         : Lee
Source Server Version : 100119
Source Host           : localhost:3306
Source Database       : sige

Target Server Type    : MariaDB
Target Server Version : 100119
File Encoding         : 65001

Date: 2020-10-09 12:51:56
*/

SET FOREIGN_KEY_CHECKS=0;
SET NAMES UTF8;
DROP DATABASE IF EXISTS sige;
CREATE DATABASE sige CHARSET=UTF8;
USE sige;
-- ----------------------------
-- Table structure for sige_category
-- ----------------------------
DROP TABLE IF EXISTS `sige_category`;
CREATE TABLE `sige_category` (
  `cid` smallint(5) NOT NULL AUTO_INCREMENT COMMENT '类型ID,主键且自增',
  `category_name` varchar(30) NOT NULL COMMENT '类型名称,唯一',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sige_category
-- ----------------------------
INSERT INTO `sige_category` VALUES ('1', '基础系列');
INSERT INTO `sige_category` VALUES ('2', '多功能系列');
INSERT INTO `sige_category` VALUES ('3', '陀飞轮系列');
INSERT INTO `sige_category` VALUES ('4', '女士/情侣系列');
INSERT INTO `sige_category` VALUES ('5', '设计师系列');
INSERT INTO `sige_category` VALUES ('6', '码表系列');
INSERT INTO `sige_category` VALUES ('7', '纤薄系列');
INSERT INTO `sige_category` VALUES ('8', '典藏系列');
INSERT INTO `sige_category` VALUES ('9', '纪念系列');
INSERT INTO `sige_category` VALUES ('10', '腕表配件');
INSERT INTO `sige_category` VALUES ('11', '增值回购');
INSERT INTO `sige_category` VALUES ('12', '投票');

-- ----------------------------
-- Table structure for sige_pro
-- ----------------------------
DROP TABLE IF EXISTS `sige_pro`;
CREATE TABLE `sige_pro` (
  `pid` int(10) NOT NULL AUTO_INCREMENT COMMENT '默认递增',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `image` varchar(70) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `old_price` decimal(10,2) NOT NULL,
  `new_price` decimal(10,2) NOT NULL,
  `detail_id` int(10) NOT NULL,
  `content` varchar(50) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `category_name` varchar(10) NOT NULL,
  `count` int(10) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sige_pro
-- ----------------------------
INSERT INTO `sige_pro` VALUES ('1', '【赠针扣牛皮表带】海鸥基础自动机械男表816.362', '/pro/5ac1c8078f4b5.jpg', '1', '2080.00', '1664.00', '1', '已设置最大优惠，无需领劵', '白色', '基础系列', '20');
INSERT INTO `sige_pro` VALUES ('2', '海鸥基础自动机械男表819.368', '/pro/58d734c0136eb.jpg', '1', '2080.00', '1750.00', '2', '已设置最大优惠，无需领劵', '白色', '基础系列', '18');
INSERT INTO `sige_pro` VALUES ('3', '海鸥海洋之星200M夜光潜水表816.523', '/pro/5bbb03f2693cb.jpg', '1', '2980.00', '1599.00', '3', '已设置最大优惠，无需领劵', '蓝色', '基础系列', '50');
INSERT INTO `sige_pro` VALUES ('4', '海洋之星进阶版陶瓷圈潜水表416.27.1200', '/pro/5bbb01eb3e3a8.jpg', '1', '9800.00', '2188.00', '4', '已设置最大优惠，无需领劵', '黑色', '基础系列', '25');
INSERT INTO `sige_pro` VALUES ('5', '海鸥基础系列自动机械男表D519.405', '/pro/58ddbe571075a.jpg', '1', '2800.00', '999.00', '5', '已设置最大优惠，无需领劵 ', '白色', '基础系列', '30');
INSERT INTO `sige_pro` VALUES ('6', '海鸥多功能自动机械男表819.317', '/pro/5954ba9d85140.jpg', '2', '3400.00', '899.00', '6', '已设置最大优惠，无需领劵 ', '白色', '多功能系列', '50');
INSERT INTO `sige_pro` VALUES ('7', '海鸥多功能自动机械男表819.316', '/pro/58ddad2f9c8c5.jpg', '2', '3400.00', '899.00', '7', '已设置最大优惠，无需领劵 ', '白色', '多功能系列', '49');
INSERT INTO `sige_pro` VALUES ('8', '海鸥飞轮传奇多功能自动机械男表M162S', '/pro/58eddd77216fb.jpg', '2', '3400.00', '799.00', '8', '已设置最大优惠，无需领劵 ', '白色', '多功能系列', '4');
INSERT INTO `sige_pro` VALUES ('9', '海鸥多功能间金自动机械男表217.427', '/pro/587ecd574563f.png', '2', '2880.00', '1870.00', '9', '已设置最大优惠，无需领劵 ', '黑色', '多功能系列', '19');
INSERT INTO `sige_pro` VALUES ('10', '海鸥多功能系列自动机械飞轮男表M171S', '/pro/58dc93f99a290.jpg', '2', '3400.00', '2749.00', '10', '已设置最大优惠，无需领劵 ', '白色', '多功能系列', '6');
INSERT INTO `sige_pro` VALUES ('11', '海鸥镶钻鳄鱼皮陀飞轮男表748.11.7039V', '/pro/5ef1ad7641e46.jpg', '3', '88000.00', '88000.00', '11', '', '白色', '陀飞轮系列', '0');
INSERT INTO `sige_pro` VALUES ('12', '海鸥18K金超薄长动力陀飞轮男表218.12.8802G', '/pro/5bd1686aa1453.jpg', '3', '98000.00', '26900.00', '12', '18K金表圈，厚度仅0.9cm', '黑色', '陀飞轮系列', '0');
INSERT INTO `sige_pro` VALUES ('13', '海鸥星耀九州足金陀飞轮腕表118.85.7038V', '/pro/5e001b5f347ae.jpg', '3', '139800.00', '39800.00', '13', '', '白色', '陀飞轮系列', '1');
INSERT INTO `sige_pro` VALUES ('14', '海鸥多功能手动陀飞轮男表D818.924', '/pro/58ed8c35207cf.jpg', '3', '42800.00', '42800.00', '14', '陀飞系列专享优惠，请联系客服400-667-0088', '白色', '陀飞轮系列', '1');
INSERT INTO `sige_pro` VALUES ('15', '海鸥花丝手动陀飞轮女表713.58.8100L', '/pro/59bf31aeb26c1.jpg', '3', '39800.00', '19800.00', '15', '不只是美 更是时间的内涵', '红色', '陀飞轮系列', '2');
INSERT INTO `sige_pro` VALUES ('16', '(赠专属礼包)海鸥 x 国际米兰 限量特别纪念款陀飞轮手表819.92.7110', '/pro/5c6cfaf5d70a1.jpg', '3', '16800.00', '16800.00', '16', '赠送国际米兰陀飞轮专属礼包', '专属色', '陀飞轮系列', '20');
INSERT INTO `sige_pro` VALUES ('17', '海鸥18K金多功能手动陀飞轮男表218.11.5051G', '/pro/5bed289faa5e7.jpg', '3', '68000.00', '23800.00', '17', '18K金表圈多功能陀飞轮', '白色', '陀飞轮系列', '9');
INSERT INTO `sige_pro` VALUES ('18', '南开大学建校100周年纪念款石英女表E1919L', '/pro/5d71df50dea3d.jpg', '4', '349.00', '294.00', '18', '南开大学建校100周年纪念款石英女表E1919L', '白色', '女士/情侣系列', '0');

-- ----------------------------
-- Table structure for sige_user
-- ----------------------------
DROP TABLE IF EXISTS `sige_user`;
CREATE TABLE `sige_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sige_user
-- ----------------------------
INSERT INTO `sige_user` VALUES ('1', '1067346925@qq.com', '18683696736', 'justdoit.573');
INSERT INTO `sige_user` VALUES ('2', '972476221@qq.com', '15483446821', null);
INSERT INTO `sige_user` VALUES ('3', '1067346925@qq.com', '15184416187', 'qwertyuiop');
