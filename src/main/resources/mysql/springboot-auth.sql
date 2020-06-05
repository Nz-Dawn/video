/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : springboot-auth

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2019-11-20 22:07:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_branch`
-- ----------------------------
DROP TABLE IF EXISTS `t_branch`;
CREATE TABLE `t_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父级部门',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `info` text CHARACTER SET utf8 COLLATE utf8_bin,
  `morder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE,
  KEY `uname` (`uname`) USING BTREE,
  KEY `tel` (`tel`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门';

-- ----------------------------
-- Records of t_branch
-- ----------------------------
INSERT INTO `t_branch` VALUES ('1', '0', '王者世界', '狄仁杰', '13300000000', 0x3133333030303030303030, '0');
INSERT INTO `t_branch` VALUES ('2', '1', '斥候部门', '', '', '', '1');
INSERT INTO `t_branch` VALUES ('4', '1', 'UI设计组', '', '', '', '1');

-- ----------------------------
-- Table structure for `t_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '登录明',
  `tname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18784 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='操作日志表';

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('18783', 'kadmin', '初始管理员', 0xE4BB8E495023303A303A303A303A303A303A303A3123E799BBE5BD95E7B3BBE7BB9F, '1574241839');
INSERT INTO `t_log` VALUES ('18782', 'kadmin', '初始管理员', 0xE98080E587BAE799BBE5BD95, '1574241837');
INSERT INTO `t_log` VALUES ('18781', 'kadmin', '初始管理员', 0x6B61646D696EE4BFAEE694B9E794A8E688B7E4BFA1E681AF, '1574241828');
INSERT INTO `t_log` VALUES ('18780', 'kadmin', '初始管理员', 0xE4BB8E495023303A303A303A303A303A303A303A3123E799BBE5BD95E7B3BBE7BB9F, '1574241816');
INSERT INTO `t_log` VALUES ('18779', 'kadmin', '初始管理员', 0xE4BB8E495023303A303A303A303A303A303A303A3123E799BBE5BD95E7B3BBE7BB9F, '1574239802');
INSERT INTO `t_log` VALUES ('18778', 'kadmin', '初始管理员', 0xE98080E587BAE799BBE5BD95, '1574239394');
INSERT INTO `t_log` VALUES ('18777', 'kadmin', '初始管理员', 0xE4BB8E495023303A303A303A303A303A303A303A3123E799BBE5BD95E7B3BBE7BB9F, '1574239301');
INSERT INTO `t_log` VALUES ('18776', 'kadmin', '初始管理员', 0xE98080E587BAE799BBE5BD95, '1574238396');
INSERT INTO `t_log` VALUES ('18775', 'kadmin', '初始管理员', 0xE4BB8E495023303A303A303A303A303A303A303A3123E799BBE5BD95E7B3BBE7BB9F, '1574238302');
INSERT INTO `t_log` VALUES ('18774', 'kadmin', '初始管理员', 0xE98080E587BAE799BBE5BD95, '1574237837');
INSERT INTO `t_log` VALUES ('18773', 'kadmin', '初始管理员', 0xE4BB8E495023303A303A303A303A303A303A303A3123E799BBE5BD95E7B3BBE7BB9F, '1574237835');
INSERT INTO `t_log` VALUES ('18770', 'kadmin', '初始管理员', 0xE98080E587BAE799BBE5BD95, '1574237758');
INSERT INTO `t_log` VALUES ('18771', 'kadmin', '初始管理员', 0xE4BB8E495023303A303A303A303A303A303A303A3123E799BBE5BD95E7B3BBE7BB9F, '1574237776');
INSERT INTO `t_log` VALUES ('18772', 'kadmin', '初始管理员', 0xE98080E587BAE799BBE5BD95, '1574237784');
INSERT INTO `t_log` VALUES ('18767', 'kadmin', '初始管理员', 0xE4BB8E495023303A303A303A303A303A303A303A3123E799BBE5BD95E7B3BBE7BB9F, '1574237368');
INSERT INTO `t_log` VALUES ('18768', 'kadmin', '初始管理员', 0xE98080E587BAE799BBE5BD95, '1574237646');
INSERT INTO `t_log` VALUES ('18769', 'kadmin', '初始管理员', 0xE4BB8E495023303A303A303A303A303A303A303A3123E799BBE5BD95E7B3BBE7BB9F, '1574237752');
INSERT INTO `t_log` VALUES ('18765', 'kadmin', '初始管理员', 0xE98080E587BAE799BBE5BD95, '1574232599');
INSERT INTO `t_log` VALUES ('18766', 'kadmin', '初始管理员', 0xE4BB8E495023303A303A303A303A303A303A303A3123E799BBE5BD95E7B3BBE7BB9F, '1574234789');

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `role` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `info` text CHARACTER SET utf8 COLLATE utf8_bin,
  `morder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统菜单';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('3', '0', '系统设置', '', 'expense/goIndex.do', 'set', '', null, '10');
INSERT INTO `t_menu` VALUES ('5', '3', '部门管理', 'BRANCH', 'branch/goIndex', '', '新建:zxAdd,修改:zxEdit,删除:zxDel', null, '3');
INSERT INTO `t_menu` VALUES ('6', '3', '用户管理', 'USER', 'user/goIndex', '', '新建:zxAdd,编辑:zxEdit,删除:zxDel', null, '1');
INSERT INTO `t_menu` VALUES ('7', '3', '角色管理', 'ROLE', 'role/goIndex', '', '新建:zxAdd,修改:zxEdit,权限设定:zxRole,删除:zxDel', null, '6');
INSERT INTO `t_menu` VALUES ('8', '3', '菜单管理', 'MENU', 'menu/goIndex', '', '新建:zxAdd,修改:zxEdit,删除:zxDel', null, '5');
INSERT INTO `t_menu` VALUES ('19', '3', '日志管理', 'LOG', 'user/goLogIndex', '', '查看:zxShow,删除:zxDel', null, '8');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '2',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `menu_control` text CHARACTER SET utf8 COLLATE utf8_bin,
  `oper_control` text CHARACTER SET utf8 COLLATE utf8_bin,
  `morder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户角色';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '1', '超级管理员', 0x332C362C352C382C372C3139, 0x555345527A784164642C555345527A78456469742C555345527A7844656C2C555345527A784578702C4252414E43487A784164642C4252414E43487A78456469742C4252414E43487A7844656C2C4252414E43487A78496D702C4D454E557A784164642C4D454E557A78456469742C4D454E557A7844656C2C524F4C457A784164642C524F4C457A78456469742C524F4C457A78526F6C652C524F4C457A7844656C2C4C4F477A7853686F772C4C4F477A7844656C, '0');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '类型，1系统保留，2用户自建',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态：0离职，1实习，2在职',
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `face` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `branch_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `ding_uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `order_by` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `uname` (`uname`) USING BTREE,
  KEY `tname` (`tname`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', '1', '2', 'kadmin', '初始管理员', '/fileData/userImage/20191120172346548.png', '21232f297a57a5a743894a0e4a801fc3', '1', '1', null, '0');
INSERT INTO `t_user` VALUES ('48', '2', '2', 'zhaoyun', '赵云', '', '21232f297a57a5a743894a0e4a801fc3', '1', '1', null, '1');
INSERT INTO `t_user` VALUES ('49', '2', '2', 'lvxiaobu', '吕布', '', '21232f297a57a5a743894a0e4a801fc3', '1', '1', null, '1');

-- ----------------------------
-- Table structure for `t_user_rel`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_rel`;
CREATE TABLE `t_user_rel` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `u_id` int(10) DEFAULT NULL COMMENT '管理人ID',
  `t_id` int(10) DEFAULT NULL COMMENT '被管理人Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户管理权限';

-- ----------------------------
-- Records of t_user_rel
-- ----------------------------
INSERT INTO `t_user_rel` VALUES ('125', '2', '48');
INSERT INTO `t_user_rel` VALUES ('126', '2', '49');
