/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : sunhotel

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-03 17:11:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `checkout`
-- ----------------------------
DROP TABLE IF EXISTS `checkout`;
CREATE TABLE `checkout` (
  `pk` decimal(20,0) NOT NULL COMMENT '主键',
  `chk_no` varchar(50) NOT NULL COMMENT '结算单号',
  `in_no` varchar(50) NOT NULL COMMENT '入住单号',
  `days` int(11) NOT NULL COMMENT '入住天数',
  `money` double NOT NULL COMMENT '总金额',
  `chk_time` varchar(50) NOT NULL COMMENT '结算时间',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `delmark` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `other1` varchar(50) DEFAULT NULL,
  `other2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkout
-- ----------------------------
INSERT INTO `checkout` VALUES ('1522741251000', 'YD201804030001', 'RZ201804030048', '1', '780', '2018-4-3 15:40:51', '没有', '0', null, null);
INSERT INTO `checkout` VALUES ('1522744421000', 'YD201804030001', 'RZ201804030052', '1', '100', '2018-4-3 16:33:41', '电风扇', '0', null, null);

-- ----------------------------
-- Table structure for `checkout_temp`
-- ----------------------------
DROP TABLE IF EXISTS `checkout_temp`;
CREATE TABLE `checkout_temp` (
  `pk` decimal(18,0) DEFAULT NULL,
  `r_type_id` varchar(50) DEFAULT NULL,
  `r_no` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `dis_price` double DEFAULT NULL,
  `account` double DEFAULT NULL,
  `money` double DEFAULT NULL,
  `in_time` varchar(50) DEFAULT NULL,
  KEY `IX_checkout_temp` (`r_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkout_temp
-- ----------------------------
INSERT INTO `checkout_temp` VALUES ('1522744039000', 'LX0001', 'BD1001', '100', '10', '100', '1', '100', '2018-4-3 16:27:19');

-- ----------------------------
-- Table structure for `customertype`
-- ----------------------------
DROP TABLE IF EXISTS `customertype`;
CREATE TABLE `customertype` (
  `pk` decimal(20,0) NOT NULL,
  `id` varchar(50) NOT NULL,
  `c_type` varchar(50) NOT NULL,
  `dis_attr` varchar(50) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '10',
  `price` double NOT NULL,
  `dis_price` double NOT NULL DEFAULT '0',
  `remark` varchar(50) DEFAULT NULL,
  `delmark` int(11) NOT NULL DEFAULT '0',
  `other1` varchar(50) DEFAULT NULL,
  `other2` varchar(50) DEFAULT NULL,
  KEY `IX_customertype` (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customertype
-- ----------------------------
INSERT INTO `customertype` VALUES ('0', 'sunhotel', 'sunhotel', 'sunhotel', '0', '0', '0', 'sunhotel', '1', null, null);
INSERT INTO `customertype` VALUES ('0', 'sunhotel', 'sunhotel', 'sunhotel', '0', '0', '0', 'sunhotel', '1', null, null);
INSERT INTO `customertype` VALUES ('1145855882143', 'SYSMARK', '普通宾客', 'LX0001', '10', '100', '100', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145855882143', 'SYSMARK', '普通宾客', 'LX0002', '10', '160', '160', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145855882143', 'SYSMARK', '普通宾客', '购物折扣', '10', '0', '0', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145855882143', 'SYSMARK', '普通宾客', 'LX0003', '10', '150', '150', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145855882143', 'SYSMARK', '普通宾客', 'LX0004', '10', '260', '260', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145855882143', 'SYSMARK', '普通宾客', 'LX0005', '10', '780', '780', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145855882143', 'SYSMARK', '普通宾客', 'LX0006', '10', '880', '880', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856076440', 'KH0001', '团体组织', 'LX0001', '10', '100', '80', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856076440', 'KH0001', '团体组织', 'LX0002', '8', '160', '128', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856076440', 'KH0001', '团体组织', '购物折扣', '8', '0', '0', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856076440', 'KH0001', '团体组织', 'LX0003', '8', '150', '120', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856076440', 'KH0001', '团体组织', 'LX0004', '8', '260', '208', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856076440', 'KH0001', '团体组织', 'LX0005', '8', '780', '624', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856076440', 'KH0001', '团体组织', 'LX0006', '8', '880', '704', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856101457', 'KH0002', '内部人事', 'LX0001', '8', '100', '80', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856101457', 'KH0002', '内部人事', 'LX0002', '8', '160', '48', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856101457', 'KH0002', '内部人事', '购物折扣', '3', '0', '0', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856101457', 'KH0002', '内部人事', 'LX0003', '8', '150', '120', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856101457', 'KH0002', '内部人事', 'LX0004', '3', '260', '78', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856101457', 'KH0002', '内部人事', 'LX0005', '3', '780', '234', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856101457', 'KH0002', '内部人事', 'LX0006', '3', '880', '264', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856120110', 'KH0003', '协议单位', 'LX0001', '6', '100', '60', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856120110', 'KH0003', '协议单位', 'LX0002', '9', '160', '96', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856120110', 'KH0003', '协议单位', '购物折扣', '6', '0', '0', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856120110', 'KH0003', '协议单位', 'LX0003', '6', '150', '90', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856120110', 'KH0003', '协议单位', 'LX0004', '6', '260', '156', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856120110', 'KH0003', '协议单位', 'LX0005', '6', '780', '468', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856120110', 'KH0003', '协议单位', 'LX0006', '6', '880', '528', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1522734516000', 'KH004', '网络会员', 'LX0001', '9', '100', '90', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1522734516000', 'KH004', '网络会员', 'LX0002', '9', '160', '144', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1522734516000', 'KH004', '网络会员', 'LX0003', '9', '150', '135', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1522734516000', 'KH004', '网络会员', 'LX0004', '9', '260', '234', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1522734516000', 'KH004', '网络会员', 'LX0005', '9', '780', '702', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1522734516000', 'KH004', '网络会员', 'LX0006', '9', '880', '792', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1522734516000', 'KH004', '网络会员', '购物折扣', '9', '0', '0', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1522734957000', '9999', '一般客户', 'LX0001', '10', '100', '100', null, '1', null, null);
INSERT INTO `customertype` VALUES ('1522734957000', '9999', '一般客户', 'LX0002', '10', '160', '160', null, '1', null, null);
INSERT INTO `customertype` VALUES ('1522734957000', '9999', '一般客户', 'LX0003', '10', '150', '150', null, '1', null, null);
INSERT INTO `customertype` VALUES ('1522734957000', '9999', '一般客户', 'LX0004', '10', '260', '260', null, '1', null, null);
INSERT INTO `customertype` VALUES ('1522734957000', '9999', '一般客户', 'LX0005', '10', '780', '780', null, '1', null, null);
INSERT INTO `customertype` VALUES ('1522734957000', '9999', '一般客户', 'LX0006', '10', '880', '880', null, '1', null, null);
INSERT INTO `customertype` VALUES ('1522734957000', '9999', '一般客户', '购物折扣', '10', '0', '0', null, '1', null, null);
INSERT INTO `customertype` VALUES ('1145855882143', 'SYSMARK', '普通宾客', 'LX0007', '10', '128', '128', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856076440', 'KH0001', '团体组织', 'LX0007', '10', '128', '128', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856101457', 'KH0002', '内部人事', 'LX0007', '10', '128', '128', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1145856120110', 'KH0003', '协议单位', 'LX0007', '10', '128', '128', null, '0', null, null);
INSERT INTO `customertype` VALUES ('1522734516000', 'KH004', '网络会员', 'LX0007', '10', '128', '128', null, '0', null, null);

-- ----------------------------
-- Table structure for `dtproperties`
-- ----------------------------
DROP TABLE IF EXISTS `dtproperties`;
CREATE TABLE `dtproperties` (
  `id` int(11) NOT NULL,
  `objectid` int(11) DEFAULT NULL,
  `property` varchar(64) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `uvalue` varchar(255) DEFAULT NULL,
  `lvalue` longblob,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`,`property`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dtproperties
-- ----------------------------

-- ----------------------------
-- Table structure for `engage`
-- ----------------------------
DROP TABLE IF EXISTS `engage`;
CREATE TABLE `engage` (
  `pk` decimal(20,0) NOT NULL COMMENT '主键',
  `c_name` varchar(50) NOT NULL COMMENT '客户名称',
  `c_jp` varchar(50) DEFAULT NULL COMMENT '客户名称简拼',
  `c_tel` varchar(50) NOT NULL COMMENT '客户电话',
  `r_type_id` varchar(50) NOT NULL COMMENT '房间类型编号',
  `r_no` varchar(50) NOT NULL COMMENT '房间号',
  `pa_time` varchar(50) NOT NULL COMMENT '预抵时间',
  `keep_time` varchar(50) NOT NULL COMMENT '保留时间',
  `eng_time` varchar(50) NOT NULL COMMENT '预定时间',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `engagemark` int(11) NOT NULL DEFAULT '2' COMMENT '预定状态标志',
  `cluemark` int(11) NOT NULL DEFAULT '0' COMMENT '提醒标志',
  `delmark` int(11) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `other1` varchar(50) DEFAULT NULL,
  `other2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of engage
-- ----------------------------
INSERT INTO `engage` VALUES ('1522737703000', 'sdfsa', null, '12312312', 'LX0006', 'ZT8001', '2018-03-02', '2018-03-03', '2018-4-3 14:56:53', 'uhk第三方', '0', '1', '1', null, null);
INSERT INTO `engage` VALUES ('1522738013000', '777', null, '1252525', 'LX0001', 'BD1001', '2018-03-05', '2018-03-06', '2018-4-3 14:46:53', '', '0', '0', '1', null, null);
INSERT INTO `engage` VALUES ('1522738705000', '张君雅', null, '13665652656', 'LX0005', 'SW6001', '2018-04-03', '2018-04-04', '2018-4-3 14:58:52', '刘芳', '1', '1', '0', null, null);
INSERT INTO `engage` VALUES ('1522738775000', '李自成', null, '13202525236', 'LX0006', 'ZT8001', '2018-05-09', '2018-05-11', '2018-4-3 14:59:35', '请留着房间，谢谢！', '1', '1', '0', null, null);
INSERT INTO `engage` VALUES ('1522743139000', '薛仁贵', null, '13615856952', 'LX0003', 'HD3001', '2018-04-03', '2018-04-04', '2018-4-3 16:21:57', 'hjhjhj', '1', '1', '0', null, null);
INSERT INTO `engage` VALUES ('1522743220000', '阿三', null, '13333333333', 'LX0004', 'HS5001', '2018-04-05', '2018-04-06', '2018-4-3 16:13:40', '安倍晋三', '1', '1', '0', null, null);
INSERT INTO `engage` VALUES ('1522743256000', '莫老仙', null, '16848585856', 'LX0005', 'SW6001', '2018-04-06', '2018-04-07', '2018-4-3 16:14:16', '我是莫老仙', '2', '0', '0', null, null);
INSERT INTO `engage` VALUES ('1522744016000', '张三', null, '15622552365', 'LX0001', 'BD1001', '2018-04-06', '2018-04-07', '2018-4-3 16:26:56', '去去去', '1', '0', '0', null, null);

-- ----------------------------
-- Table structure for `engage1`
-- ----------------------------
DROP TABLE IF EXISTS `engage1`;
CREATE TABLE `engage1` (
  `pk` decimal(20,0) DEFAULT NULL,
  `c_name` varchar(50) DEFAULT NULL,
  `c_jp` varchar(50) DEFAULT NULL,
  `c_tel` varchar(50) DEFAULT NULL,
  `r_type_id` varchar(50) DEFAULT NULL,
  `r_no` varchar(50) DEFAULT NULL,
  `pa_time` varchar(50) DEFAULT NULL,
  `keep_time` varchar(50) DEFAULT NULL,
  `eng_time` varchar(50) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `engagemark` int(11) DEFAULT NULL,
  `cluemark` int(11) DEFAULT '0',
  `delmark` int(11) DEFAULT '0',
  `other1` varchar(50) DEFAULT NULL,
  `other2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of engage1
-- ----------------------------
INSERT INTO `engage1` VALUES ('1522744016000', '张三', null, '15622552365', 'LX0001', 'BD1001', '2018-04-06', '2018-04-07', '2018-4-3 16:26:56', '去去去', null, '0', '0', null, null);

-- ----------------------------
-- Table structure for `expense_temp`
-- ----------------------------
DROP TABLE IF EXISTS `expense_temp`;
CREATE TABLE `expense_temp` (
  `pk` varchar(50) DEFAULT NULL,
  `in_no` varchar(50) DEFAULT NULL,
  `r_no` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `c_name` varchar(50) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `in_time` varchar(50) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `delmark` varchar(50) DEFAULT NULL,
  `other1` varchar(50) DEFAULT NULL,
  `other2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expense_temp
-- ----------------------------
INSERT INTO `expense_temp` VALUES ('', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `expense_temp` VALUES ('', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `expense_temp` VALUES ('', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `expense_temp` VALUES ('', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `expense_temp` VALUES ('', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `livein`
-- ----------------------------
DROP TABLE IF EXISTS `livein`;
CREATE TABLE `livein` (
  `pk` decimal(20,0) NOT NULL COMMENT '主键',
  `in_no` varchar(50) NOT NULL COMMENT '入住单号',
  `r_no` varchar(50) NOT NULL COMMENT '房间号',
  `r_type_id` varchar(50) NOT NULL COMMENT '房间类型编号',
  `main_room` varchar(50) NOT NULL COMMENT '主房间号',
  `main_pk` decimal(20,0) NOT NULL COMMENT '主房间PK',
  `c_type_id` varchar(50) NOT NULL COMMENT '客户类型编号',
  `c_name` varchar(50) NOT NULL COMMENT '客户名称',
  `c_jp` varchar(50) DEFAULT NULL COMMENT '客户名称简拼',
  `sex` varchar(50) NOT NULL COMMENT '性别',
  `zj_type` varchar(50) NOT NULL COMMENT '证件类型',
  `zj_no` varchar(50) NOT NULL COMMENT '证件编号',
  `address` text NOT NULL COMMENT '地址信息',
  `renshu` int(11) NOT NULL DEFAULT '1' COMMENT '人数',
  `in_time` varchar(50) NOT NULL COMMENT '入住时间',
  `account` double NOT NULL DEFAULT '0' COMMENT '消费数量',
  `days` int(11) NOT NULL COMMENT '预住天数',
  `foregift` double NOT NULL COMMENT '押金',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `m_id` varchar(50) DEFAULT NULL COMMENT '会员编号',
  `chk_no` varchar(50) DEFAULT NULL COMMENT '结算单号',
  `chk_time` varchar(50) DEFAULT NULL COMMENT '结算时间',
  `userid` varchar(50) DEFAULT NULL,
  `statemark` varchar(50) DEFAULT NULL COMMENT '状态标志',
  `cluemark` int(11) NOT NULL DEFAULT '0' COMMENT '提醒标志',
  `delmark` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `other1` varchar(50) DEFAULT NULL,
  `other2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of livein
-- ----------------------------
INSERT INTO `livein` VALUES ('1522739495000', 'RZ201804030048', 'SW6001', 'LX0005', 'SW6001', '1522739495000', 'SYSMARK', '张君雅', null, '男', '身份证', '62010252255202', '上海市浦东新区世纪大道10001号', '1', '2018-4-3 15:11:35', '0', '1', '1000', '没有', null, null, null, 'admin', '已结算', '0', '0', null, null);
INSERT INTO `livein` VALUES ('1522742560000', 'RZ201804030049', 'ZT8001', 'LX0006', 'ZT8001', '1522742560000', 'SYSMARK', '李自成', null, '女', '身份证', '62018588528', '北京市长安街101号', '1', '2018-4-3 16:02:40', '0', '1', '2000', '官员', null, null, null, 'admin', '正在消费', '1', '0', null, null);
INSERT INTO `livein` VALUES ('1522742917000', 'RZ201804030050', 'TJ0001', 'LX0007', 'TJ0001', '1522742917000', 'SYSMARK', '李四', null, '男', '身份证', '62810252565', '河南省驻马店市100号', '1', '2018-4-3 16:08:37', '0', '1', '200', '河南人', null, null, null, 'admin', '正在消费', '0', '0', null, null);
INSERT INTO `livein` VALUES ('1522743779000', 'RZ201804030051', 'HD3001', 'LX0003', 'HD3001', '1522743779000', 'SYSMARK', '薛仁贵', null, '男', '身份证', '310252016520252', '河南洛阳三门峡', '1', '2018-4-3 16:22:59', '0', '1', '500', '很牛逼的人', null, null, null, 'admin', '正在消费', '0', '0', null, null);
INSERT INTO `livein` VALUES ('1522744039000', 'RZ201804030052', 'BD1001', 'LX0001', 'BD1001', '1522744039000', 'SYSMARK', '张三', null, '男', '身份证', '625125528525', '阿斯顿撒撒旦撒打算 ', '1', '2018-4-3 16:27:19', '0', '1', '200', '撒大声的啊', null, null, null, 'admin', '已结算', '0', '0', null, null);
INSERT INTO `livein` VALUES ('1522744192000', 'RZ201804030053', 'HS5001', 'LX0004', 'HS5001', '1522744192000', 'SYSMARK', '阿三', null, '男', '身份证', '454525251513', '日本东京', '1', '2018-4-3 16:29:52', '0', '1', '500', '大声的撒旦撒旦', null, null, null, 'admin', '正在消费', '1', '0', null, null);
INSERT INTO `livein` VALUES ('1522744514000', 'RZ201804030054', 'BD1002', 'LX0001', 'BD1002', '1522744514000', 'SYSMARK', '北京研究院', null, '男', '身份证', '6200012545154525', '上海市世纪大道', '4', '2018-4-3 16:35:14', '0', '3', '8000', '没有', null, null, null, 'admin', null, '1', '0', null, null);
INSERT INTO `livein` VALUES ('1522744514001', 'RZ201804030054', 'BD1003', 'LX0001', 'BD1002', '1522744514000', 'SYSMARK', '北京研究院', null, '男', '身份证', '6200012545154525', '上海市世纪大道', '4', '2018-4-3 16:35:14', '0', '3', '8000', '没有', null, null, null, 'admin', null, '1', '0', null, null);
INSERT INTO `livein` VALUES ('1522744514002', 'RZ201804030054', 'BD1004', 'LX0001', 'BD1002', '1522744514000', 'SYSMARK', '北京研究院', null, '男', '身份证', '6200012545154525', '上海市世纪大道', '4', '2018-4-3 16:35:14', '0', '3', '8000', '没有', null, null, null, 'admin', null, '1', '0', null, null);
INSERT INTO `livein` VALUES ('1522744514003', 'RZ201804030054', 'BD1006', 'LX0001', 'BD1002', '1522744514000', 'SYSMARK', '北京研究院', null, '男', '身份证', '6200012545154525', '上海市世纪大道', '4', '2018-4-3 16:35:14', '0', '3', '8000', '没有', null, null, null, 'admin', null, '1', '0', null, null);

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `pk` decimal(20,0) NOT NULL COMMENT '主键',
  `m_id` varchar(50) NOT NULL COMMENT '会员编号',
  `m_name` varchar(50) NOT NULL COMMENT '会员姓名',
  `sex` varchar(50) NOT NULL COMMENT '性别',
  `zj_no` varchar(50) NOT NULL COMMENT '证件编号',
  `m_tel` varchar(50) NOT NULL COMMENT '联系电话',
  `address` varchar(50) NOT NULL COMMENT '详细地址',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `delmark` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `other1` varchar(50) DEFAULT NULL,
  `other2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1522736802000', 'M0001', '张军', '男', '632555652554527', '13565214524', '上海浦东新区', null, '0', null, null);
INSERT INTO `member` VALUES ('1522736898000', 'M0002', '张三', '男', '320102199820202215', '13918621526', '福建泉州', null, '0', null, null);
INSERT INTO `member` VALUES ('1522736924000', '0101', '1', '男', '1', '1', '1', null, '1', null, null);

-- ----------------------------
-- Table structure for `pwd`
-- ----------------------------
DROP TABLE IF EXISTS `pwd`;
CREATE TABLE `pwd` (
  `pk` decimal(20,0) NOT NULL COMMENT '主键',
  `userid` varchar(50) NOT NULL COMMENT '用户登录ID',
  `pwd` varchar(50) NOT NULL COMMENT '登录密码',
  `puis` varchar(50) NOT NULL COMMENT '用户权限',
  `delmark` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `other1` varchar(50) DEFAULT NULL COMMENT '保留1',
  `other2` varchar(50) DEFAULT NULL COMMENT '保留2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pwd
-- ----------------------------
INSERT INTO `pwd` VALUES ('234567', 'admin', '123456', '管理员', '0', null, null);
INSERT INTO `pwd` VALUES ('1146336534967', 'gujun', '123456', '管理员', '0', null, null);
INSERT INTO `pwd` VALUES ('1146336592763', 'feexc', '123456', '普通操作员', '0', null, null);
INSERT INTO `pwd` VALUES ('11', '44', '1', '22', '1', null, null);
INSERT INTO `pwd` VALUES ('1522730590000', '测试', '11', '普通操作员', '0', null, null);

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `pk` decimal(18,0) NOT NULL COMMENT '主键',
  `time` datetime NOT NULL COMMENT '操作时间',
  `operator` varchar(50) NOT NULL COMMENT '操作员',
  `brief` varchar(50) NOT NULL COMMENT '内容摘要',
  `content` varchar(200) NOT NULL COMMENT '内容',
  `delmark` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `other1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('1146335886700', '2006-04-30 02:38:06', 'admin', '操作员登录', 'admin 在 2006-4-30 2:38:06 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1146335950967', '2006-04-30 02:39:10', 'admin', '房间信息操作', 'admin 在 2006-4-30 2:39:10 执行了 [ 标准单人间 ] 的批量添加--起始房号 [ BD1001 ] 房间数量：16', '0', null);
INSERT INTO `record` VALUES ('1146335973467', '2006-04-30 02:39:33', 'admin', '房间信息操作', 'admin 在 2006-4-30 2:39:33 执行了 [ 标准单人间 ] 的批量添加--起始房号 [ BS2001 ] 房间数量：18', '0', null);
INSERT INTO `record` VALUES ('1146335990653', '2006-04-30 02:39:50', 'admin', '操作员登录', 'admin 在 2006-4-30 2:39:50 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1146336141840', '2006-04-30 02:42:21', 'gujun', '操作员登录', 'gujun 在 2006-4-30 2:42:21 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1146336179420', '2006-04-30 02:42:59', 'gujun', '操作员登录', 'gujun 在 2006-4-30 2:42:59 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1146336211077', '2006-04-30 02:43:31', 'gujun', '操作员登录', 'gujun 在 2006-4-30 2:43:31 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1146336228250', '2006-04-30 02:43:48', 'admin', '操作员登录', 'admin 在 2006-4-30 2:43:48 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1146336233043', '2006-04-30 02:43:53', 'admin', '操作员登录', 'admin 在 2006-4-30 2:43:53 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1146336271483', '2006-04-30 02:44:31', 'admin', '操作员登录', 'admin 在 2006-4-30 2:44:31 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1146336360717', '2006-04-30 02:46:00', 'gujunn', '操作员登录', 'gujunn 在 2006-4-30 2:46:00 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1146336417890', '2006-04-30 02:46:57', 'admin', '操作员登录', 'admin 在 2006-4-30 2:46:57 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1146336437250', '2006-04-30 02:47:17', 'admin', '操作员登录', 'admin 在 2006-4-30 2:47:17 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1146336480780', '2006-04-30 02:48:00', 'admin', '操作员登录', 'admin 在 2006-4-30 2:48:00 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1146336535077', '2006-04-30 02:48:55', 'admin', '操作员设置', 'admin 在 2006-4-30 2:48:55 添加了新的操作员信息-- [ admin ]', '0', null);
INSERT INTO `record` VALUES ('1146336592797', '2006-04-30 02:49:52', 'admin', '操作员设置', 'admin 在 2006-4-30 2:49:52 添加了新的操作员信息-- [ admin ]', '0', null);
INSERT INTO `record` VALUES ('1146336620857', '2006-04-30 02:50:20', 'admin', '房间信息操作', 'admin 在 2006-4-30 2:50:20 执行了 [ 标准单人间 ] 的批量添加--起始房号 [ BD1001 ] 房间数量：16', '0', null);
INSERT INTO `record` VALUES ('1146336638920', '2006-04-30 02:50:38', 'admin', '房间信息操作', 'admin 在 2006-4-30 2:50:38 执行了 [ 标准双人间 ] 的批量添加--起始房号 [ BS2001 ] 房间数量：18', '0', null);
INSERT INTO `record` VALUES ('1146336669187', '2006-04-30 02:51:09', 'admin', '房间信息操作', 'admin 在 2006-4-30 2:51:09 执行了 [ 豪华单人间 ] 的批量添加--起始房号 [ HD3001 ] 房间数量：12', '0', null);
INSERT INTO `record` VALUES ('1146336693997', '2006-04-30 02:51:34', 'admin', '房间信息操作', 'admin 在 2006-4-30 2:51:34 执行了 [ 豪华双人间 ] 的批量添加--起始房号 [ HS5001 ] 房间数量：15', '0', null);
INSERT INTO `record` VALUES ('1146336726687', '2006-04-30 02:52:06', 'admin', '房间信息操作', 'admin 在 2006-4-30 2:52:06 执行了 [ 商务套房 ] 的批量添加--起始房号 [ SW6001 ] 房间数量：18', '0', null);
INSERT INTO `record` VALUES ('1146336756467', '2006-04-30 02:52:36', 'admin', '房间信息操作', 'admin 在 2006-4-30 2:52:36 执行了 [ 总统套房 ] 的批量添加--起始房号 [ ZT8001 ] 房间数量：12', '0', null);
INSERT INTO `record` VALUES ('1146336786797', '2006-04-30 02:53:06', 'admin', '操作员登录', 'admin 在 2006-4-30 2:53:06 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1160578110920', '2006-10-11 22:48:30', 'gujun', '操作员登录', 'gujun 在 2006-10-11 22:48:30 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1160578179153', '2006-10-11 22:49:39', 'admin', '操作员登录', 'admin 在 2006-10-11 22:49:39 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1160578223123', '2006-10-11 22:50:23', 'admin', '操作员登录', 'admin 在 2006-10-11 22:50:23 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1162642228357', '2006-11-04 20:10:28', 'gujun', '操作员登录', 'gujun 在 2006-11-4 20:10:28 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1162828841000', '2006-11-07 00:00:41', 'gujun', '操作员登录', 'gujun 在 2006-11-7 0:00:41 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1163256163513', '2006-11-11 22:42:43', 'admin', '操作员登录', 'admin 在 2006-11-11 22:42:43 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1163256271623', '2006-11-11 22:44:31', 'admin', '操作员登录', 'admin 在 2006-11-11 22:44:31 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1163768523357', '2006-11-17 21:02:03', 'gujun', '操作员登录', 'gujun 在 2006-11-17 21:02:03 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1163772151890', '2006-11-17 22:02:31', 'gujun', '操作员登录', 'gujun 在 2006-11-17 22:02:31 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1165475403500', '2006-12-07 15:10:03', 'gujun', '操作员登录', 'gujun 在 2006-12-7 15:10:03 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1522730195000', '2018-04-03 12:36:34', 'admin', '操作员登录', 'admin 在 2018-4-3 12:36:34 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522730429000', '2018-04-03 12:40:29', 'admin', '操作员设置', 'admin 在 2018-4-3 12:40:29 删除了操作员 [ admin ] 的设置', '0', null);
INSERT INTO `record` VALUES ('1522730457000', '2018-04-03 12:40:57', 'admin', '操作员设置', 'admin 在 2018-4-3 12:40:57 修改了操作员 [ admin ] 的设置', '0', null);
INSERT INTO `record` VALUES ('1522730490000', '2018-04-03 12:41:30', 'admin', '操作员设置', 'admin 在 2018-4-3 12:41:30 删除了操作员 [ 44 ] 的设置', '0', null);
INSERT INTO `record` VALUES ('1522730541000', '2018-04-03 12:42:21', 'admin', '操作员设置', 'admin 在 2018-4-3 12:42:21 添加了新的操作员信息-- [ admin ]', '0', null);
INSERT INTO `record` VALUES ('1522730590000', '2018-04-03 12:43:10', 'admin', '操作员设置', 'admin 在 2018-4-3 12:43:10 添加了新的操作员信息-- [ admin ]', '0', null);
INSERT INTO `record` VALUES ('1522730609000', '2018-04-03 12:43:29', 'admin', '操作员设置', 'admin 在 2018-4-3 12:43:29 修改了操作员 [ 测试 ] 的设置', '0', null);
INSERT INTO `record` VALUES ('1522731031000', '2018-04-03 12:50:31', 'admin', '计费设置', 'admin 在 2018-4-3 12:50:31 修改了系统的计费设置', '0', null);
INSERT INTO `record` VALUES ('1522731749000', '2018-04-03 13:02:29', 'admin', '操作员登录', 'admin 在 2018-4-3 13:02:29 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522733184000', '2018-04-03 13:26:24', 'admin', '操作员登录', 'admin 在 2018-4-3 13:26:24 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1522733630000', '2018-04-03 13:33:50', 'admin', '操作员登录', 'admin 在 2018-4-3 13:33:50 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522734009000', '2018-04-03 13:40:09', 'admin', '操作员登录', 'admin 在 2018-4-3 13:40:09 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522734166000', '2018-04-03 13:42:46', 'admin', '操作员登录', 'admin 在 2018-4-3 13:42:46 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522734489000', '2018-04-03 13:48:09', 'admin', '操作员登录', 'admin 在 2018-4-3 13:48:09 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522734516000', '2018-04-03 13:48:36', 'admin', '客户信息操作', 'admin 在 2018-4-3 13:48:36 添加了新的客户类型-- [ 网络会员 ]', '0', null);
INSERT INTO `record` VALUES ('1522734957000', '2018-04-03 13:55:57', 'admin', '客户信息操作', 'admin 在 2018-4-3 13:55:57 添加了新的客户类型-- [ 989 ]', '0', null);
INSERT INTO `record` VALUES ('1522734974000', '2018-04-03 13:56:14', 'admin', '客户信息操作', 'admin 在 2018-4-3 13:56:14 修改了客户类型-- [ 一般客户 ]', '0', null);
INSERT INTO `record` VALUES ('1522734977000', '2018-04-03 13:56:17', 'admin', '客户信息操作', 'admin 在 2018-4-3 13:56:17 执行了删除客户类型的操作--删除数量：1', '0', null);
INSERT INTO `record` VALUES ('1522735384000', '2018-04-03 14:03:04', 'admin', '操作员登录', 'admin 在 2018-4-3 14:03:04 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522735647000', '2018-04-03 14:07:27', 'admin', '操作员登录', 'admin 在 2018-4-3 14:07:27 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522735688000', '2018-04-03 14:08:08', 'admin', '房间类型操作', 'admin 在 2018-4-3 14:08:08 添加了新的房间类型-- [ 特价单人房 ]', '0', null);
INSERT INTO `record` VALUES ('1522735722000', '2018-04-03 14:08:42', 'admin', '房间类型操作', 'admin 在 2018-4-3 14:08:42 修改了房间类型设置-- [ 特价单人房 ]', '0', null);
INSERT INTO `record` VALUES ('1522735915000', '2018-04-03 14:11:55', 'admin', '操作员登录', 'admin 在 2018-4-3 14:11:55 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522736018000', '2018-04-03 14:13:38', 'admin', '操作员登录', 'admin 在 2018-4-3 14:13:38 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522736037000', '2018-04-03 14:13:57', 'admin', '房间信息操作', 'admin 在 2018-4-3 14:13:57 添加了新的标准单人间-- 房间号：[ TJ0001 ]', '0', null);
INSERT INTO `record` VALUES ('1522736048000', '2018-04-03 14:14:08', 'admin', '房间信息操作', 'admin 在 2018-4-3 14:14:08 执行了删除房间信息的操作--删除数量：1', '0', null);
INSERT INTO `record` VALUES ('1522736069000', '2018-04-03 14:14:29', 'admin', '房间信息操作', 'admin 在 2018-4-3 14:14:29 添加了新的特价单人房-- 房间号：[ TJ0001 ]', '0', null);
INSERT INTO `record` VALUES ('1522736123000', '2018-04-03 14:15:23', 'admin', '房间信息操作', 'admin 在 2018-4-3 14:15:23 执行了 [ 特价单人房 ] 的批量添加--起始房号 [ TJ1000 ] 房间数量：10', '0', null);
INSERT INTO `record` VALUES ('1522736212000', '2018-04-03 14:16:52', 'admin', '房间信息操作', 'admin 在 2018-4-3 14:16:52 修改了房间信息设置-- [ TJ1009 ]', '0', null);
INSERT INTO `record` VALUES ('1522736233000', '2018-04-03 14:17:13', 'admin', '房间信息操作', 'admin 在 2018-4-3 14:17:13 修改了房间信息设置-- [ TJ1009 ]', '0', null);
INSERT INTO `record` VALUES ('1522736320000', '2018-04-03 14:18:40', 'admin', '操作员登录', 'admin 在 2018-4-3 14:18:40 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522736356000', '2018-04-03 14:19:16', 'admin', '操作员登录', 'admin 在 2018-4-3 14:19:16 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522736625000', '2018-04-03 14:23:45', 'admin', '操作员登录', 'admin 在 2018-4-3 14:23:45 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522736773000', '2018-04-03 14:26:13', 'admin', '操作员登录', 'admin 在 2018-4-3 14:26:13 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522737256000', '2018-04-03 14:34:16', 'admin', '操作员登录', 'admin 在 2018-4-3 14:34:16 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522737567000', '2018-04-03 14:39:27', 'admin', '操作员登录', 'admin 在 2018-4-3 14:39:27 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522737673000', '2018-04-03 14:41:13', 'admin', '操作员登录', 'admin 在 2018-4-3 14:41:13 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522737892000', '2018-04-03 14:44:52', 'admin', '操作员登录', 'admin 在 2018-4-3 14:44:52 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522738094000', '2018-04-03 14:48:14', 'admin', '操作员登录', 'admin 在 2018-4-3 14:48:14 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522738581000', '2018-04-03 14:56:21', 'admin', '操作员登录', 'admin 在 2018-4-3 14:56:21 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522739076000', '2018-04-03 15:04:36', 'admin', '操作员登录', 'admin 在 2018-4-3 15:04:36 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522739287000', '2018-04-03 15:08:07', 'admin', '操作员登录', 'admin 在 2018-4-3 15:08:07 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522739390000', '2018-04-03 15:09:50', 'admin', '操作员登录', 'admin 在 2018-4-3 15:09:50 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522739465000', '2018-04-03 15:11:05', 'admin', '操作员登录', 'admin 在 2018-4-3 15:11:05 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522740938000', '2018-04-03 15:35:38', 'admin', '操作员登录', 'admin 在 2018-4-3 15:35:38 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1522740994000', '2018-04-03 15:36:34', 'admin', '操作员登录', 'admin 在 2018-4-3 15:36:34 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522741222000', '2018-04-03 15:40:22', 'admin', '操作员登录', 'admin 在 2018-4-3 15:40:22 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522742509000', '2018-04-03 16:01:49', 'admin', '操作员登录', 'admin 在 2018-4-3 16:01:49 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522743642000', '2018-04-03 16:20:42', 'admin', '操作员登录', 'admin 在 2018-4-3 16:20:42 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1522743654000', '2018-04-03 16:20:54', 'admin', '操作员登录', 'admin 在 2018-4-3 16:20:54 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522744128000', '2018-04-03 16:28:48', 'admin', '操作员登录', 'admin 在 2018-4-3 16:28:48 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522744812000', '2018-04-03 16:40:12', 'admin', '操作员登录', 'admin 在 2018-4-3 16:40:12 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1522744839000', '2018-04-03 16:40:39', '测试', '操作员登录', '测试 在 2018-4-3 16:40:39 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522744869000', '2018-04-03 16:41:09', '测试', '操作员登录', '测试 在 2018-4-3 16:41:09 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1522745542000', '2018-04-03 16:52:22', 'admin', '操作员登录', 'admin 在 2018-4-3 16:52:22 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522745565000', '2018-04-03 16:52:45', 'admin', '操作员登录', 'admin 在 2018-4-3 16:52:45 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1522745668000', '2018-04-03 16:54:28', 'admin', '操作员登录', 'admin 在 2018-4-3 16:54:28 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522745694000', '2018-04-03 16:54:54', 'admin', '操作员登录', 'admin 在 2018-4-3 16:54:54 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1522745887000', '2018-04-03 16:58:07', 'admin', '操作员登录', 'admin 在 2018-4-3 16:58:07 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522745913000', '2018-04-03 16:58:33', 'admin', '操作员登录', 'admin 在 2018-4-3 16:58:33 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1522746092000', '2018-04-03 17:01:32', 'admin', '操作员登录', 'admin 在 2018-4-3 17:01:32 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522746169000', '2018-04-03 17:02:49', 'admin', '操作员登录', 'admin 在 2018-4-3 17:02:49 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522746245000', '2018-04-03 17:04:05', 'admin', '操作员登录', 'admin 在 2018-4-3 17:04:05 退出本系统', '0', null);
INSERT INTO `record` VALUES ('1522746480000', '2018-04-03 17:08:00', 'admin', '操作员登录', 'admin 在 2018-4-3 17:08:00 登录本系统', '0', null);
INSERT INTO `record` VALUES ('1522746540000', '2018-04-03 17:09:00', 'admin', '操作员登录', 'admin 在 2018-4-3 17:09:00 退出本系统', '0', null);

-- ----------------------------
-- Table structure for `roominfo`
-- ----------------------------
DROP TABLE IF EXISTS `roominfo`;
CREATE TABLE `roominfo` (
  `pk` decimal(20,0) NOT NULL COMMENT '主键',
  `id` varchar(50) NOT NULL COMMENT '房间号',
  `r_type_id` varchar(50) NOT NULL COMMENT '房间类型编号',
  `state` varchar(50) NOT NULL COMMENT '房间状态',
  `location` varchar(50) NOT NULL COMMENT '所处位置',
  `r_tel` varchar(50) NOT NULL COMMENT '房间电话',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `statetime` int(11) NOT NULL DEFAULT '0' COMMENT '状态计时',
  `indimark` int(11) NOT NULL DEFAULT '0' COMMENT '开单标记',
  `delmark` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `other1` varchar(50) DEFAULT NULL,
  `other2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk`),
  KEY `IX_roominfo` (`state`),
  KEY `IX_roominfo_1` (`statetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roominfo
-- ----------------------------
INSERT INTO `roominfo` VALUES ('0', 'sunhotel', 'sunhotel', '可供', 'sunhotel', 'sunhotel', 'sunhotel', '0', '0', '1', null, null);
INSERT INTO `roominfo` VALUES ('1146336620700', 'BD1001', 'LX0001', '脏房', '一楼', '1001', null, '7', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620701', 'BD1002', 'LX0001', '占用', '一楼', '1002', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620702', 'BD1003', 'LX0001', '占用', '一楼', '1003', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620703', 'BD1004', 'LX0001', '占用', '一楼', '1004', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620704', 'BD1005', 'LX0001', '可供', '一楼', '1005', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620705', 'BD1006', 'LX0001', '占用', '一楼', '1006', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620706', 'BD1007', 'LX0001', '可供', '一楼', '1007', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620707', 'BD1008', 'LX0001', '可供', '一楼', '1008', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620708', 'BD1009', 'LX0001', '可供', '一楼', '1009', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620709', 'BD1010', 'LX0001', '可供', '一楼', '1010', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620710', 'BD1011', 'LX0001', '可供', '一楼', '1011', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620711', 'BD1012', 'LX0001', '可供', '一楼', '1012', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620712', 'BD1013', 'LX0001', '可供', '一楼', '1013', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620713', 'BD1014', 'LX0001', '可供', '一楼', '1014', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620714', 'BD1015', 'LX0001', '停用', '一楼', '1015', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336620715', 'BD1016', 'LX0001', '停用', '一楼', '1016', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638763', 'BS2001', 'LX0002', '可供', '二楼', '2001', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638764', 'BS2002', 'LX0002', '可供', '二楼', '2002', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638765', 'BS2003', 'LX0002', '可供', '二楼', '2003', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638766', 'BS2004', 'LX0002', '可供', '二楼', '2004', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638767', 'BS2005', 'LX0002', '可供', '二楼', '2005', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638768', 'BS2006', 'LX0002', '可供', '二楼', '2006', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638769', 'BS2007', 'LX0002', '可供', '二楼', '2007', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638770', 'BS2008', 'LX0002', '可供', '二楼', '2008', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638771', 'BS2009', 'LX0002', '可供', '二楼', '2009', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638772', 'BS2010', 'LX0002', '可供', '二楼', '2010', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638773', 'BS2011', 'LX0002', '可供', '二楼', '2011', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638774', 'BS2012', 'LX0002', '可供', '二楼', '2012', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638775', 'BS2013', 'LX0002', '停用', '二楼', '2013', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638776', 'BS2014', 'LX0002', '可供', '二楼', '2014', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638777', 'BS2015', 'LX0002', '停用', '二楼', '2015', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638778', 'BS2016', 'LX0002', '可供', '二楼', '2016', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638779', 'BS2017', 'LX0002', '可供', '二楼', '2017', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336638780', 'BS2018', 'LX0002', '可供', '二楼', '2018', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336669060', 'HD3001', 'LX0003', '占用', '三楼', '3001', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336669061', 'HD3002', 'LX0003', '可供', '三楼', '3002', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336669062', 'HD3003', 'LX0003', '可供', '三楼', '3003', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336669063', 'HD3004', 'LX0003', '可供', '三楼', '3004', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336669064', 'HD3005', 'LX0003', '可供', '三楼', '3005', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336669065', 'HD3006', 'LX0003', '停用', '三楼', '3006', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336669066', 'HD3007', 'LX0003', '可供', '三楼', '3007', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336669067', 'HD3008', 'LX0003', '可供', '三楼', '3008', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336669068', 'HD3009', 'LX0003', '可供', '三楼', '3009', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336669069', 'HD3010', 'LX0003', '可供', '三楼', '3010', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336669070', 'HD3011', 'LX0003', '停用', '三楼', '3011', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336669071', 'HD3012', 'LX0003', '可供', '三楼', '3012', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693827', 'HS5001', 'LX0004', '占用', '五楼', '5001', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693828', 'HS5002', 'LX0004', '可供', '五楼', '5002', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693829', 'HS5003', 'LX0004', '可供', '五楼', '5003', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693830', 'HS5004', 'LX0004', '可供', '五楼', '5004', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693831', 'HS5005', 'LX0004', '可供', '五楼', '5005', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693832', 'HS5006', 'LX0004', '可供', '五楼', '5006', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693833', 'HS5007', 'LX0004', '可供', '五楼', '5007', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693834', 'HS5008', 'LX0004', '可供', '五楼', '5008', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693835', 'HS5009', 'LX0004', '可供', '五楼', '5009', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693836', 'HS5010', 'LX0004', '可供', '五楼', '5010', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693837', 'HS5011', 'LX0004', '可供', '五楼', '5011', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693838', 'HS5012', 'LX0004', '可供', '五楼', '5012', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693839', 'HS5013', 'LX0004', '可供', '五楼', '5013', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693840', 'HS5014', 'LX0004', '停用', '五楼', '5014', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336693841', 'HS5015', 'LX0004', '可供', '五楼', '5015', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726497', 'SW6001', 'LX0005', '预订', '六楼', '6001', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726498', 'SW6002', 'LX0005', '可供', '六楼', '6002', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726499', 'SW6003', 'LX0005', '可供', '六楼', '6003', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726500', 'SW6004', 'LX0005', '可供', '六楼', '6004', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726501', 'SW6005', 'LX0005', '可供', '六楼', '6005', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726502', 'SW6006', 'LX0005', '可供', '六楼', '6006', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726503', 'SW6007', 'LX0005', '可供', '六楼', '6007', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726504', 'SW6008', 'LX0005', '可供', '六楼', '6008', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726505', 'SW6009', 'LX0005', '可供', '六楼', '6009', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726506', 'SW6010', 'LX0005', '可供', '六楼', '6010', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726507', 'SW6011', 'LX0005', '可供', '六楼', '6011', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726508', 'SW6012', 'LX0005', '可供', '六楼', '6012', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726509', 'SW6013', 'LX0005', '可供', '六楼', '6013', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726510', 'SW6014', 'LX0005', '可供', '六楼', '6014', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726511', 'SW6015', 'LX0005', '可供', '六楼', '6015', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726512', 'SW6016', 'LX0005', '停用', '六楼', '6016', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726513', 'SW6017', 'LX0005', '停用', '六楼', '6017', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336726514', 'SW6018', 'LX0005', '可供', '六楼', '6018', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336756340', 'ZT8001', 'LX0006', '占用', '八楼', '8001', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336756341', 'ZT8002', 'LX0006', '可供', '八楼', '8002', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336756342', 'ZT8003', 'LX0006', '可供', '八楼', '8003', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336756343', 'ZT8004', 'LX0006', '可供', '八楼', '8004', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336756344', 'ZT8005', 'LX0006', '可供', '八楼', '8005', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336756345', 'ZT8006', 'LX0006', '可供', '八楼', '8006', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336756346', 'ZT8007', 'LX0006', '可供', '八楼', '8007', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336756347', 'ZT8008', 'LX0006', '可供', '八楼', '8008', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336756348', 'ZT8009', 'LX0006', '停用', '八楼', '8009', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336756349', 'ZT8010', 'LX0006', '停用', '八楼', '8010', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336756350', 'ZT8011', 'LX0006', '可供', '八楼', '8011', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1146336756351', 'ZT8012', 'LX0006', '可供', '八楼', '8012', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1522736037000', 'TJ0001', 'LX0001', '可供', '一楼', '1101', null, '0', '0', '1', null, null);
INSERT INTO `roominfo` VALUES ('1522736069000', 'TJ0001', 'LX0007', '占用', '一楼', '1101', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1522736123000', 'TJ1000', 'LX0007', '可供', '二楼', '1000', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1522736123001', 'TJ1001', 'LX0007', '可供', '二楼', '1001', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1522736123002', 'TJ1002', 'LX0007', '可供', '二楼', '1002', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1522736123003', 'TJ1003', 'LX0007', '可供', '二楼', '1003', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1522736123004', 'TJ1004', 'LX0007', '可供', '二楼', '1004', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1522736123005', 'TJ1005', 'LX0007', '可供', '二楼', '1005', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1522736123006', 'TJ1006', 'LX0007', '可供', '二楼', '1006', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1522736123007', 'TJ1007', 'LX0007', '可供', '二楼', '1007', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1522736123008', 'TJ1008', 'LX0007', '可供', '二楼', '1008', null, '0', '0', '0', null, null);
INSERT INTO `roominfo` VALUES ('1522736123009', 'TJ1009', 'LX0007', '可供', '二楼', '1019', null, '0', '0', '0', null, null);

-- ----------------------------
-- Table structure for `roomnum`
-- ----------------------------
DROP TABLE IF EXISTS `roomnum`;
CREATE TABLE `roomnum` (
  `roomid` varchar(50) NOT NULL COMMENT '房间编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomnum
-- ----------------------------
INSERT INTO `roomnum` VALUES ('HS5001');

-- ----------------------------
-- Table structure for `roomnums`
-- ----------------------------
DROP TABLE IF EXISTS `roomnums`;
CREATE TABLE `roomnums` (
  `rr_type` varchar(50) DEFAULT NULL,
  `roomid` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  KEY `IX_roomnums` (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomnums
-- ----------------------------

-- ----------------------------
-- Table structure for `roomtype`
-- ----------------------------
DROP TABLE IF EXISTS `roomtype`;
CREATE TABLE `roomtype` (
  `pk` decimal(20,0) NOT NULL COMMENT '主键',
  `id` varchar(50) NOT NULL COMMENT '房间类型编号',
  `r_type` varchar(50) NOT NULL COMMENT '房间类型',
  `bed` varchar(50) NOT NULL COMMENT '床位数',
  `price` double NOT NULL COMMENT '单价',
  `foregift` double NOT NULL COMMENT '押金',
  `cl_room` varchar(50) NOT NULL COMMENT '是否钟点房',
  `cl_price` double NOT NULL COMMENT '钟点房价格',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `sysmark` int(11) NOT NULL DEFAULT '0',
  `delmark` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `other1` varchar(50) DEFAULT NULL,
  `other2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomtype
-- ----------------------------
INSERT INTO `roomtype` VALUES ('1145855029280', 'LX0001', '标准单人间', '1', '100', '500', 'Y', '20', null, '1', '0', null, null);
INSERT INTO `roomtype` VALUES ('1145855058873', 'LX0002', '标准双人间', '2', '160', '500', 'Y', '50', null, '1', '0', null, null);
INSERT INTO `roomtype` VALUES ('1145856188500', 'LX0003', '豪华单人间', '1', '150', '500', 'Y', '50', null, '0', '0', null, null);
INSERT INTO `roomtype` VALUES ('1145856218563', 'LX0004', '豪华双人间', '2', '260', '500', 'Y', '100', null, '0', '0', null, null);
INSERT INTO `roomtype` VALUES ('1145856258393', 'LX0005', '商务套房', '1', '780', '1000', 'N', '0', null, '0', '0', null, null);
INSERT INTO `roomtype` VALUES ('1145856293673', 'LX0006', '总统套房', '2', '880', '1000', 'N', '0', null, '0', '0', null, null);
INSERT INTO `roomtype` VALUES ('1522735688000', 'LX0007', '特价单人房', '1', '128', '200', 'Y', '30', null, '0', '0', null, null);

-- ----------------------------
-- Table structure for `sysdiagrams`
-- ----------------------------
DROP TABLE IF EXISTS `sysdiagrams`;
CREATE TABLE `sysdiagrams` (
  `name` varchar(0) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `diagram_id` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysdiagrams
-- ----------------------------
DROP TRIGGER IF EXISTS `set_dis_price`;
DELIMITER ;;
CREATE TRIGGER `set_dis_price` BEFORE INSERT ON `customertype` FOR EACH ROW set NEW.dis_price = NEW.price*NEW.discount/10
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_dis_price`;
DELIMITER ;;
CREATE TRIGGER `update_dis_price` BEFORE UPDATE ON `customertype` FOR EACH ROW set NEW.dis_price = NEW.price*NEW.discount/10
;;
DELIMITER ;
