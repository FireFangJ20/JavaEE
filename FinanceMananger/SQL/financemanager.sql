/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50644
Source Host           : localhost:3306
Source Database       : financemanager

Target Server Type    : MYSQL
Target Server Version : 50644
File Encoding         : 65001

Date: 2020-05-24 16:51:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin_login`
-- ----------------------------
DROP TABLE IF EXISTS `admin_login`;
CREATE TABLE `admin_login` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `aname` varchar(20) DEFAULT NULL,
  `apwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=10016 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_login
-- ----------------------------
INSERT INTO `admin_login` VALUES ('1', 'root', 'root');
INSERT INTO `admin_login` VALUES ('10001', 'root2', '');
INSERT INTO `admin_login` VALUES ('10002', 'root3', 'root3');
INSERT INTO `admin_login` VALUES ('10003', 'root3', 'root03');
INSERT INTO `admin_login` VALUES ('10004', 'root4', 'root4');
INSERT INTO `admin_login` VALUES ('10006', '人事部主管', 'hrmanager.pwd');
INSERT INTO `admin_login` VALUES ('10007', 'rrrrrrrrrrrrrrrrrrrr', 'rrrrrrrrrrrrrrrrrrrr');
INSERT INTO `admin_login` VALUES ('10008', '恶魔天使 ', '    ');
INSERT INTO `admin_login` VALUES ('10009', '魔鬼团队董事长.斯卡娅', '无');
INSERT INTO `admin_login` VALUES ('10010', '克里纳', 'kelina');
INSERT INTO `admin_login` VALUES ('10011', '麦特德葛.无锡菲斯.卡尔', '你猜');
INSERT INTO `admin_login` VALUES ('10012', '恶魔天使', '你的密码');
INSERT INTO `admin_login` VALUES ('10013', 'world    map', 'worid  map');
INSERT INTO `admin_login` VALUES ('10014', '你的用户名', '你的密码');
INSERT INTO `admin_login` VALUES ('10015', '小李', '小李');

-- ----------------------------
-- Table structure for `guest`
-- ----------------------------
DROP TABLE IF EXISTS `guest`;
CREATE TABLE `guest` (
  `gid` int(10) NOT NULL AUTO_INCREMENT,
  `gname` varchar(20) NOT NULL,
  `gaddress` varchar(30) DEFAULT NULL COMMENT '客户的住址',
  `gphone` varchar(20) DEFAULT NULL COMMENT '客户的联系方式',
  `gdate` varchar(50) DEFAULT NULL COMMENT '客户添加日期',
  `operator` int(20) DEFAULT NULL COMMENT '操作者（是谁添加的）',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guest
-- ----------------------------
INSERT INTO `guest` VALUES ('1', 'soso百科', 'A市关明区狮驼街330号', '123@soso', '2020.3.4', '0');
INSERT INTO `guest` VALUES ('2', '小智汽车', 'A市光明区临江路330号', 'xiaozhi@qq.com', '2020-02-18 14:10:06', '0');
INSERT INTO `guest` VALUES ('3', '小智汽车', 'A市光明区临江路330号', 'xiaozhi@qq.com', '2020-02-18 14:10:16', '0');
INSERT INTO `guest` VALUES ('4', '蔚莱科技', 'B市嘿哈区暗星路01号', '0103325886', '2020-02-18 14:13:54', '0');
INSERT INTO `guest` VALUES ('5', 'windowMap', 'B市嘻哈区星云路01号', 'window.cn', '2020-02-18 14:25:11', '1');
INSERT INTO `guest` VALUES ('6', '智载旅游', 'C市M区', '130255698', '2020-02-18 14:30:57', '10005');
INSERT INTO `guest` VALUES ('7', '阿蔡', '乐可其街46号，居住死神之家', '1234567890', '2020-02-18 15:21:07', '10008');
INSERT INTO `guest` VALUES ('8', '魔鬼团队前台负责人.胡素文', '长白山葛优出版社集团48号办公室', 'xiaozhi@qq.com', '2020-02-18 15:31:32', '10009');
INSERT INTO `guest` VALUES ('9', 'A市市政', 'A市中心区市政厅办公室', 'Agov.cn', '2020-02-19 12:31:25', '1');
INSERT INTO `guest` VALUES ('10', 'A市市政便民服务部', 'A市中心区市政厅办公室', 'Agov.cn/renmin.html', '2020-05-22 12:48:34', '1');
INSERT INTO `guest` VALUES ('11', '测试客户1', 'localhost', '127.0.0.1', '2020-03-01 10:25:30', '1');
INSERT INTO `guest` VALUES ('12', '可可果 果果可', '什么街￥ 纳库鲁', '215648151541', '2020-03-13 17:29:22', '10009');
INSERT INTO `guest` VALUES ('13', ' 纳库鲁', '具体变化比较火爆收人', '215648151541', '2020-03-14 12:26:31', '10012');
INSERT INTO `guest` VALUES ('14', '吴铭世高级文具', 'M市城宫门中心小学旁', 'www.wumingwenju.cn', '2020-05-22 12:51:42', '1');
INSERT INTO `guest` VALUES ('15', '胡同街中心小学', 'M市胡同街中心小学', 'hutongschool@163.com', '2020-05-22 20:40:52', '1');
INSERT INTO `guest` VALUES ('16', 'guest', 'loalhost', 'localhost', '2020-03-19 09:08:19', '1');
INSERT INTO `guest` VALUES ('17', 'guest2', 'guest', '15055613320', '2020-03-19 09:44:20', '1');
INSERT INTO `guest` VALUES ('21', '国宏地图测绘公司', 'A市夕阳区琼山路1866号', 'guohong.inc', '2020-05-22 20:11:11', '1');
INSERT INTO `guest` VALUES ('22', '宣信图纸', 'S市朝阳大道888号', 'xuanxin@126.com', '2020-05-22 10:33:07', '1');

-- ----------------------------
-- Table structure for `staff_login`
-- ----------------------------
DROP TABLE IF EXISTS `staff_login`;
CREATE TABLE `staff_login` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  `spwd` varchar(20) NOT NULL DEFAULT '0123',
  `salary` int(20) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1046 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff_login
-- ----------------------------
INSERT INTO `staff_login` VALUES ('1001', 'Lisa', '2580', '6000', '人事部');
INSERT INTO `staff_login` VALUES ('1002', 'Tom', 'Tom', '8000', '外联部');
INSERT INTO `staff_login` VALUES ('1003', 'jack', '111', '12000', '人事部');
INSERT INTO `staff_login` VALUES ('1004', '晓明', '0123', '10000', '宣传部');
INSERT INTO `staff_login` VALUES ('1008', 'alida', '01234', '12200', '高级助理');
INSERT INTO `staff_login` VALUES ('1009', '小红', '123456', '15000', '秘书部');
INSERT INTO `staff_login` VALUES ('1010', 'bob', 'bob', '5500', '保卫处');
INSERT INTO `staff_login` VALUES ('1019', 'timton', 'timton', '1200', '销售部');
INSERT INTO `staff_login` VALUES ('1032', 'tony', 'tony', '9000', '技术部');
INSERT INTO `staff_login` VALUES ('1044', '阿里', 'ali', '5000', '待定');
INSERT INTO `staff_login` VALUES ('1045', '123', '123', '12000', '技术部');

-- ----------------------------
-- Table structure for `work`
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '报表编号',
  `editor` varchar(20) NOT NULL COMMENT '添加这个报表的员工ID',
  `date` varchar(15) NOT NULL COMMENT '添加日期',
  `sellname` varchar(15) DEFAULT NULL COMMENT '销售的商品名',
  `sellprice` int(15) DEFAULT NULL COMMENT '销售的商品价格',
  `buyname` varchar(15) DEFAULT NULL COMMENT '采购的商品名',
  `buyprice` int(15) DEFAULT NULL COMMENT '采购的商品价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2020013 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES ('2020001', 'lisa', '2020-03-27', '地图册', '2000', '打印机', '1000');
INSERT INTO `work` VALUES ('2020002', 'lisa', '2020-03-27', '地图册', '2000', '打印机', '1000');
INSERT INTO `work` VALUES ('2020003', 'lisa', '2020-04-11', '', '0', '公文包', '2000');
INSERT INTO `work` VALUES ('2020004', 'lisa', '2020-04-11', '定位设备', '10000', '', '0');
INSERT INTO `work` VALUES ('2020005', 'lisa', '2020-04-11', '15周年大礼包', '50000', '办公桌20张', '2000');
INSERT INTO `work` VALUES ('2020006', 'lisa', '2020-04-12', '镀金地图册20本', '20000', '', '0');
INSERT INTO `work` VALUES ('2020007', 'lisa', '2020-04-12', '关键技术元件', '50000', '电子发票机', '1000');
INSERT INTO `work` VALUES ('2020008', 'lisa', '2020-04-12', '车载数据信息处理器（兼容版）', '30000', '无', '0');
INSERT INTO `work` VALUES ('2020009', '小红', '2020-04-16', '无', '0', '办公钢笔100支', '200');
INSERT INTO `work` VALUES ('2020010', 'Tom', '2020-04-16', 'USB接口', '3000', '无', '0');
INSERT INTO `work` VALUES ('2020011', 'tom', '2020-04-16', '无', '0', '员工SIM卡20张', '2000');
INSERT INTO `work` VALUES ('2020012', 'lisa', '2020-05-23', '无', '0', '地图', '100');
