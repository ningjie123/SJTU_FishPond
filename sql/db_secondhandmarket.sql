/*
Navicat MySQL Data Transfer

Source Server         : jqxxxx
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_secondhandmarket

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-01-11 10:29:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL COMMENT '账号',
  `phone` bigint(25) NOT NULL,
  `password` varchar(25) NOT NULL COMMENT '密码',
  `userRole` varchar(25) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'superman', '10086', '123456', '超级管理员');

-- ----------------------------
-- Table structure for `catelog`
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '分类名',
  `number` int(11) DEFAULT '0' COMMENT '该分类下的商品数量',
  `status` tinyint(10) DEFAULT '0' COMMENT '分类状态，0正常，1暂用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catelog
-- ----------------------------
INSERT INTO `catelog` VALUES ('1', '闲置数码', '16', '1');
INSERT INTO `catelog` VALUES ('2', '校园代步', '6', '1');
INSERT INTO `catelog` VALUES ('3', '电器日用', '9', '1');
INSERT INTO `catelog` VALUES ('4', '图书教材', '10', '1');
INSERT INTO `catelog` VALUES ('5', '美妆衣物', '13', '1');
INSERT INTO `catelog` VALUES ('6', '休闲娱乐', '9', '1');
INSERT INTO `catelog` VALUES ('7', '票务转让', '7', '1');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品，外键',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `create_at` varchar(250) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for `focus`
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '外键 商品id',
  `user_id` int(11) DEFAULT NULL COMMENT '外键 用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES ('39', '118', '29');
INSERT INTO `focus` VALUES ('40', '122', '31');
INSERT INTO `focus` VALUES ('41', '121', '32');
INSERT INTO `focus` VALUES ('42', '128', '32');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `catelog_id` int(11) DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户外键',
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `price` float(11,2) DEFAULT NULL COMMENT '出售价格',
  `real_price` float(11,2) DEFAULT NULL COMMENT '真实价格',
  `start_time` varchar(25) DEFAULT NULL COMMENT '发布时间',
  `polish_time` varchar(30) DEFAULT NULL COMMENT '擦亮时间，按该时间进行查询，精确到时分秒',
  `end_time` varchar(25) DEFAULT NULL COMMENT '下架时间',
  `describle` text COMMENT '详细信息',
  `status` int(11) DEFAULT '1' COMMENT '状态 上架1 下架0',
  PRIMARY KEY (`id`),
  KEY `catelog_id` (`catelog_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('118', '4', '28', '数据库原理教材', '128.00', '28.00', '2021-01-10', '2021-01-10', '2021-01-20', '学就完事', '1');
INSERT INTO `goods` VALUES ('119', '4', '28', '数据库系统概论教材', '100.00', '23.00', '2021-01-10', '2021-01-10', '2021-01-20', '数据库，教你从入门到放弃！', '0');
INSERT INTO `goods` VALUES ('120', '6', '28', '痛苦面具', '10.00', '10.00', '2021-01-10', '2021-01-10', '2021-01-20', '给生活加点痛', '0');
INSERT INTO `goods` VALUES ('121', '6', '29', '电吉他', '2000.00', '3000.00', '2021-01-10', '2021-01-10', '2021-01-20', '拥有它下次livehouse一定迷倒台下一片', '1');
INSERT INTO `goods` VALUES ('122', '1', '29', '佳能EOS 5D MARK4', '15000.00', '20000.00', '2021-01-10', '2021-01-10', '2021-01-20', '用它来记录下小帅哥们的盛世美颜吧！', '1');
INSERT INTO `goods` VALUES ('123', '5', '30', '娇兰金钻粉底液30ml', '650.00', '750.00', '2021-01-10', '2021-01-10', '2021-01-20', '买来色号不合适，几乎没用过，转手了', '1');
INSERT INTO `goods` VALUES ('124', '7', '30', '出一张败犬1.15的票', '70.00', '70.00', '2021-01-10', '2021-01-10', '2021-01-20', '有点事去不了了，鼓手很帅的不去看看吗！', '1');
INSERT INTO `goods` VALUES ('125', '3', '30', '吹风机', '100.00', '150.00', '2021-01-10', '2021-01-10', '2021-01-20', '悄悄地别被宿管阿姨发现噢', '1');
INSERT INTO `goods` VALUES ('126', '2', '30', '自行车', '150.00', '300.00', '2021-01-10', '2021-01-10', '2021-01-20', '有小电驴了不需要啦', '1');
INSERT INTO `goods` VALUES ('127', '1', '31', 'ipad air 3', '3000.00', null, '2021-01-10', '2021-01-10', '2021-01-20', '毕业了不用了', '1');
INSERT INTO `goods` VALUES ('128', '5', '31', '夏之光同款粉丝毛线帽', '300.00', '500.00', '2021-01-10', '2021-01-10', '2021-01-20', '戴上它你也能在北京最大的驾校和北电小女友演偶像剧并拥有两个机位的恋爱直拍', '1');
INSERT INTO `goods` VALUES ('129', '2', '32', '代步平衡车', '500.00', null, '2021-01-10', '2021-01-10', '2021-01-20', '很好用', '1');
INSERT INTO `goods` VALUES ('130', '1', '32', '胶片机', '5000.00', '6000.00', '2021-01-10', '2021-01-10', '2021-01-20', '记录生活吧', '1');
INSERT INTO `goods` VALUES ('131', '6', '32', '廖俊涛专辑 咬掉半口的苹果', '100.00', '80.00', '2021-01-10', '2021-01-10', '2021-01-20', '廖甜真的好有才华', '1');
INSERT INTO `goods` VALUES ('132', '6', '33', '玩具熊', '100.00', '200.00', '2021-01-10', '2021-01-10', '2021-01-20', '小美女的最爱', '1');
INSERT INTO `goods` VALUES ('133', '7', '33', '转一张这周末夜猫俱乐部的票', '60.00', '80.00', '2021-01-10', '2021-01-10', '2021-01-20', '畅饮票噢', '1');
INSERT INTO `goods` VALUES ('134', '5', '33', '羊羔毛外套', '300.00', '400.00', '2021-01-10', '2021-01-10', '2021-01-20', '九成新', '1');
INSERT INTO `goods` VALUES ('135', '1', '34', '拍立得', '400.00', '500.00', '2021-01-10', '2021-01-10', '2021-01-20', '效果不错，只用过几次', '1');
INSERT INTO `goods` VALUES ('136', '3', '34', '水杯', '30.00', '30.00', '2021-01-10', '2021-01-10', '2021-01-20', '全新没用过', '1');

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `goods_id` int(11) NOT NULL COMMENT '商品外键',
  `img_url` text NOT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('118', '118', 'e0624505-58ae-41d8-b76b-56c6f89a374c.jpg');
INSERT INTO `image` VALUES ('119', '119', '6ed7c2d2-527d-41df-ad85-406f03e239c9.jpg');
INSERT INTO `image` VALUES ('120', '120', '986734f9-dd37-4fc7-a31b-e4a4287342af.jpg');
INSERT INTO `image` VALUES ('121', '121', 'a78d1aa6-3c2b-43b6-ac3d-1ba58a090889.jpg');
INSERT INTO `image` VALUES ('122', '122', 'f3418e81-1d72-4c77-912e-2aaec9ca6bdf.jpg');
INSERT INTO `image` VALUES ('123', '123', '58abeede-98c5-477a-8f6a-c9e4cc730d84.jpg');
INSERT INTO `image` VALUES ('124', '124', 'e8b2c407-328e-4f9d-9fab-7334fc02b870.jpg');
INSERT INTO `image` VALUES ('125', '125', '69958c5c-2f39-457e-81c3-3fed6ee749ca.jpg');
INSERT INTO `image` VALUES ('126', '126', '3072dbd4-baed-4e8d-a5ea-943dc94ac6d6.jpg');
INSERT INTO `image` VALUES ('127', '127', '8a14b41d-5bd0-4c78-8961-827e527c07ab.jpg');
INSERT INTO `image` VALUES ('128', '128', 'ea988ed2-d9af-427b-9ea7-2515c40a0225.jpg');
INSERT INTO `image` VALUES ('129', '129', 'fca9a0cc-a4c7-49ab-ba3c-ab5e7c76a490.jpg');
INSERT INTO `image` VALUES ('130', '130', 'a7fdd086-1ca6-432d-8305-3025955b2b17.jpg');
INSERT INTO `image` VALUES ('131', '131', '5d23a520-66b7-4358-9a70-692cbc37e811.jpg');
INSERT INTO `image` VALUES ('132', '132', 'ec527e29-c511-433b-b9c9-d98a628c3010.jpg');
INSERT INTO `image` VALUES ('133', '133', 'd1ae65a7-1c0a-4a8c-8872-c98f07f2ddaa.jpg');
INSERT INTO `image` VALUES ('134', '134', '1ab9e3fe-ea2d-4f51-b8e9-36816e75fbc5.jpg');
INSERT INTO `image` VALUES ('135', '135', '01833991-9825-4197-8ab8-483efcb4e014.jpg');
INSERT INTO `image` VALUES ('136', '136', '2b1be52e-bc6c-49f4-87c0-12f0efed2085.jpg');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统信息主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `context` text COMMENT '信息内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '推送信息时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，0未读，1已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('18', '29', '收一张1.14康姆士成都巡演的票，可高价。', '2021-01-10 19:02:38', '0');
INSERT INTO `notice` VALUES ('19', '30', '楼上+1，顺便求一张1.23回春丹成都巡演的票', '2021-01-10 19:05:09', '0');
INSERT INTO `notice` VALUES ('20', '32', '收购一个扫地机器人', '2021-01-10 19:31:02', '0');
INSERT INTO `notice` VALUES ('21', '32', '收mandarin主场chace的签名照，我有个朋友很喜欢他，想送她当生日礼物。', '2021-01-10 19:32:36', '0');
INSERT INTO `notice` VALUES ('22', '33', '收一个二手dv，低价的来', '2021-01-10 19:54:52', '0');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `order_num` bigint(25) DEFAULT NULL COMMENT '订单编号',
  `order_price` float(11,0) DEFAULT NULL COMMENT '订单价格',
  `order_state` int(11) DEFAULT '1' COMMENT '订单状态 1待发货 2待收货 3已完成',
  `order_information` varchar(50) DEFAULT NULL,
  `order_date` varchar(50) DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('11', '31', '119', '63111664', '100', '1', '', '2021-01-10 08:03:21');
INSERT INTO `orders` VALUES ('12', '29', '120', '29484013', '10', '2', '', '2021-01-10 08:34:24');

-- ----------------------------
-- Table structure for `purse`
-- ----------------------------
DROP TABLE IF EXISTS `purse`;
CREATE TABLE `purse` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钱包id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `balance` float(11,0) unsigned zerofill DEFAULT '00000000000' COMMENT '总钱数',
  `recharge` float(11,0) DEFAULT NULL COMMENT '充值钱数',
  `withdrawals` float(11,0) DEFAULT NULL COMMENT '提现钱数',
  `state` int(11) DEFAULT NULL COMMENT '状态 0未审核   已审核（1不通过 2通过）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purse
-- ----------------------------
INSERT INTO `purse` VALUES ('23', '28', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('24', '29', '00000000090', null, null, '2');
INSERT INTO `purse` VALUES ('25', '30', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('26', '31', '00000000100', null, null, '2');
INSERT INTO `purse` VALUES ('27', '32', '00000000300', null, null, '2');
INSERT INTO `purse` VALUES ('28', '33', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('29', '34', '00000000000', null, null, null);

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `atuser_id` int(11) DEFAULT NULL,
  `commet_id` int(11) DEFAULT NULL COMMENT '评论，外键',
  `content` text COMMENT '回复内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录使用的手机号',
  `username` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `QQ` varchar(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '即时通讯',
  `create_at` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建时间',
  `goods_num` int(11) DEFAULT '0' COMMENT '发布过的物品数量',
  `power` int(10) unsigned zerofill DEFAULT '0000000100' COMMENT '信用分，普通用户默认为100',
  `last_login` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近一次登陆时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '账号是否冻结，默认0未冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('28', '13748880908', '吴老师好帅啊', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-01-10 18:00', '3', '0000000100', null, '1');
INSERT INTO `user` VALUES ('29', '13426670985', '数据库原理能及格吗', 'E10ADC3949BA59ABBE56E057F20F883E', '10293837454', '2021-01-10 18:01', '2', '0000000100', null, '1');
INSERT INTO `user` VALUES ('30', '13264736253', '救救孩子吧', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-01-10 18:01', '4', '0000000100', null, '1');
INSERT INTO `user` VALUES ('31', '15362784038', 'helloworld', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-01-10 18:02', '2', '0000000100', null, '1');
INSERT INTO `user` VALUES ('32', '13888888888', '廖俊涛追啊', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-01-10 18:03', '3', '0000000100', null, '1');
INSERT INTO `user` VALUES ('33', '13785940303', 'Allformoney', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-01-10 18:03', '3', '0000000100', null, '1');
INSERT INTO `user` VALUES ('34', '15647384955', 'heyman', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-01-10 18:04', '2', '0000000100', null, '1');
