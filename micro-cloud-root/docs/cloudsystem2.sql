/*
Navicat MySQL Data Transfer

Source Server         : 123.207.77.109（Mysql）
Source Server Version : 50723
Source Host           : 123.207.77.109:3307
Source Database       : cloudsystem2

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-01-30 17:08:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mem_dept
-- ----------------------------
DROP TABLE IF EXISTS `mem_dept`;
CREATE TABLE `mem_dept` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_MEM_DEPT_TO_MEM_DEPT_idx` (`PARENT_ID`),
  CONSTRAINT `FK_MEM_DEPT_TO_MEM_DEPT` FOREIGN KEY (`PARENT_ID`) REFERENCES `mem_dept` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mem_dept
-- ----------------------------
INSERT INTO `mem_dept` VALUES ('1', '国务院', 'Guowuyuan', null, null, '0', '1', '1', null, null, '2019-01-30 03:02:32', '2019-01-30 03:52:41', null, null, null);
INSERT INTO `mem_dept` VALUES ('2', '农业部', 'Nongyebu', null, null, '0', '1', '2', null, null, '2019-01-30 03:03:07', '2019-01-30 03:52:43', null, null, '1');
INSERT INTO `mem_dept` VALUES ('3', '国防部', 'Guofangbu', null, null, '0', '1', '3', null, null, '2019-01-30 03:05:15', '2019-01-30 03:52:45', null, null, '1');
INSERT INTO `mem_dept` VALUES ('4', '民政部', 'Minzhengbu', null, null, '0', '1', '4', null, null, '2019-01-30 03:09:06', '2019-01-30 03:52:49', null, null, '1');
INSERT INTO `mem_dept` VALUES ('5', '民政部', 'Minzhengbu', null, null, '0', '1', '10', null, null, '2019-01-30 03:14:30', null, null, null, null);
INSERT INTO `mem_dept` VALUES ('6', '民政部', 'Minzhengbu', null, null, '0', '1', '21', null, null, '2019-01-30 03:22:48', null, null, null, null);
INSERT INTO `mem_dept` VALUES ('7', '民政部', 'Minzhenbu', null, null, '0', '1', '22', null, null, '2019-01-30 03:23:01', null, null, null, null);

-- ----------------------------
-- Table structure for mem_member
-- ----------------------------
DROP TABLE IF EXISTS `mem_member`;
CREATE TABLE `mem_member` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL COMMENT '描述',
  `LOGIN_NAME` varchar(32) DEFAULT NULL COMMENT '登录账号',
  `MOBILE` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `PASSWORD` varchar(32) DEFAULT NULL COMMENT '密码',
  `SEX` int(11) DEFAULT '1' COMMENT '1表示男，0表示女',
  `WECHAT` varchar(32) DEFAULT NULL COMMENT '微信号码',
  `IF_BIND_WECHAT` int(11) DEFAULT '1' COMMENT '是否绑定微信号,0为否，1为是',
  `OPEN_ID` varchar(64) DEFAULT NULL,
  `UNION_ID` varchar(64) DEFAULT NULL,
  `EMAIL` varchar(64) DEFAULT NULL,
  `BIRTHDAY` timestamp NULL DEFAULT NULL COMMENT '出生日期',
  `ID_CARD_NUM` varchar(45) DEFAULT NULL COMMENT '身份证',
  PRIMARY KEY (`ID`),
  KEY `sort_index` (`SORT_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of mem_member
-- ----------------------------
INSERT INTO `mem_member` VALUES ('1', '李克强', null, null, null, '0', '1', '1', null, null, '2019-01-30 03:36:57', null, null, null, 'likeqiang', null, null, '1', null, '1', null, null, null, null, null);
INSERT INTO `mem_member` VALUES ('2', '	韩正', null, null, null, '0', '1', '2', null, null, '2019-01-30 03:37:21', null, null, null, null, null, null, '1', null, '1', null, null, null, null, null);
INSERT INTO `mem_member` VALUES ('3', '孙春兰', null, null, null, '0', '1', '3', null, null, '2019-01-30 03:37:37', null, null, null, null, null, null, '0', null, '1', null, null, null, null, null);
INSERT INTO `mem_member` VALUES ('4', '胡春华', null, null, null, '0', '1', '4', null, null, '2019-01-30 03:37:51', null, null, null, null, null, null, '1', null, '1', null, null, null, null, null);
INSERT INTO `mem_member` VALUES ('5', '刘鹤', null, null, null, '0', '1', '5', null, null, '2019-01-30 03:38:02', null, null, null, null, null, null, '1', null, '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for mem_member_position
-- ----------------------------
DROP TABLE IF EXISTS `mem_member_position`;
CREATE TABLE `mem_member_position` (
  `ID` varchar(32) NOT NULL,
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `MEMBER_ID` varchar(32) DEFAULT NULL,
  `POSITION_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_MEM_MEMBER_POSITION_MEM_POSITIOON_idx` (`POSITION_ID`),
  KEY `FK_MEM_MEMBER_POSITION_TO_MEM_MEMBER_idx` (`MEMBER_ID`),
  CONSTRAINT `FK_MEM_MEMBER_POSITION_MEM_POSITIOON` FOREIGN KEY (`POSITION_ID`) REFERENCES `mem_position` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MEM_MEMBER_POSITION_TO_MEM_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户岗位中间表';

-- ----------------------------
-- Records of mem_member_position
-- ----------------------------
INSERT INTO `mem_member_position` VALUES ('1', '1', null, null, '2019-01-30 03:38:13', null, null, '1', '1');
INSERT INTO `mem_member_position` VALUES ('2', '2', null, null, '2019-01-30 03:38:40', null, null, '2', '2');
INSERT INTO `mem_member_position` VALUES ('3', '3', null, null, '2019-01-30 03:39:06', null, null, '3', '2');
INSERT INTO `mem_member_position` VALUES ('4', '4', null, null, '2019-01-30 03:39:13', null, null, '4', '2');
INSERT INTO `mem_member_position` VALUES ('5', '5', null, null, '2019-01-30 03:39:27', null, null, '5', '2');

-- ----------------------------
-- Table structure for mem_position
-- ----------------------------
DROP TABLE IF EXISTS `mem_position`;
CREATE TABLE `mem_position` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `DEPT_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_MEM_POSITION_TO_MEM_DEPT_idx` (`DEPT_ID`),
  CONSTRAINT `FK_MEM_POSITION_TO_MEM_DEPT` FOREIGN KEY (`DEPT_ID`) REFERENCES `mem_dept` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='职位';

-- ----------------------------
-- Records of mem_position
-- ----------------------------
INSERT INTO `mem_position` VALUES ('1', '总理', null, null, null, '0', '1', '1', null, null, '2019-01-30 03:35:49', null, null, null, '1');
INSERT INTO `mem_position` VALUES ('2', '副总理', null, null, null, '0', '1', '2', null, null, '2019-01-30 03:36:07', null, null, null, '1');
INSERT INTO `mem_position` VALUES ('3', '国务委员', null, null, null, '0', '1', '3', null, null, '2019-01-30 03:36:26', '2019-01-30 03:36:41', null, null, '1');
INSERT INTO `mem_position` VALUES ('4', '秘书长', null, null, null, '0', '1', '4', null, null, '2019-01-30 03:36:38', '2019-01-30 03:36:42', null, null, '1');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LOGIN_TIMES` int(11) DEFAULT NULL COMMENT '登录次数',
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_SYS_LOGIN_LOG_TO_SYS_USER_idx` (`USER_ID`),
  CONSTRAINT `FK_SYS_LOGIN_LOG_TO_SYS_USER` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录日志';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1' COMMENT '是否为可用状态',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `URL` varchar(120) DEFAULT NULL COMMENT '菜单地址',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_SYS_MENU_TO_SYS_MENU_idx` (`PARENT_ID`),
  CONSTRAINT `FK_SYS_MENU_TO_SYS_MENU` FOREIGN KEY (`PARENT_ID`) REFERENCES `sys_menu` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理1', null, null, null, '0', '1', '1', null, null, '2019-01-30 06:29:09', '2019-01-30 07:40:06', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('2', '用户管理', null, null, null, '0', '1', '2', null, null, '2019-01-30 06:29:25', null, null, null, '1', null);
INSERT INTO `sys_menu` VALUES ('3', '角色管理', null, null, null, '0', '1', '3', null, null, '2019-01-30 06:29:38', null, null, null, '1', null);
INSERT INTO `sys_menu` VALUES ('4', '菜单管理', null, null, null, '0', '1', '4', null, null, '2019-01-30 06:29:54', null, null, null, '1', null);

-- ----------------------------
-- Table structure for sys_operlog
-- ----------------------------
DROP TABLE IF EXISTS `sys_operlog`;
CREATE TABLE `sys_operlog` (
  `ID` varchar(32) NOT NULL,
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `PARAMETERS` varchar(512) DEFAULT NULL COMMENT '参数',
  `METHOD` varchar(45) DEFAULT NULL COMMENT '方法名',
  `OPERATOR` varchar(45) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统操作日志';

-- ----------------------------
-- Records of sys_operlog
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `URL` varchar(120) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_SYS_RESOURCES_TO_SYS_RESOURCES_idx` (`PARENT_ID`),
  CONSTRAINT `FK_SYS_RESOURCES_TO_SYS_RESOURCES` FOREIGN KEY (`PARENT_ID`) REFERENCES `sys_resources` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES ('1', '系统管理1', null, null, null, '0', '1', '22', null, null, '2019-01-30 06:54:17', '2019-01-30 07:53:15', null, null, null, null);
INSERT INTO `sys_resources` VALUES ('2', '用户管理', null, null, null, '0', '1', '23', null, null, '2019-01-30 06:54:17', null, null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('4', '菜单管理', null, null, null, '0', '1', '25', null, null, '2019-01-30 06:54:17', null, null, null, null, '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '经理', 'manager', null, null, '0', '1', '1', null, null, '2019-01-30 06:53:28', null, null, null);
INSERT INTO `sys_role` VALUES ('2', '普通员工', 'employee', null, null, '0', '1', '2', null, null, '2019-01-30 06:53:46', null, null, null);

-- ----------------------------
-- Table structure for sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources` (
  `ID` varchar(32) NOT NULL,
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ROLE_ID` varchar(32) DEFAULT NULL,
  `RESOURCES_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `sort_index` (`SORT_NUM`),
  KEY `FK_sys_role_resources_TO_SYS_ROLE_idx` (`ROLE_ID`),
  KEY `FK_sys_role_resources_TO_SYS_RESOURCES_idx` (`RESOURCES_ID`),
  CONSTRAINT `FK_sys_role_resources_TO_SYS_RESOURCES` FOREIGN KEY (`RESOURCES_ID`) REFERENCES `sys_resources` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sys_role_resources_TO_SYS_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色与资源中间表';

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
INSERT INTO `sys_role_resources` VALUES ('1', '1', null, null, '2019-01-30 07:06:31', null, '1', '1');
INSERT INTO `sys_role_resources` VALUES ('2', '2', null, null, '2019-01-30 07:06:40', null, '1', '2');
INSERT INTO `sys_role_resources` VALUES ('4', '4', null, null, '2019-01-30 07:06:55', null, '1', '4');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `LOGIN_NAME` varchar(45) DEFAULT NULL COMMENT '登录名',
  `MOBILE` varchar(15) DEFAULT NULL COMMENT '移动电话',
  `PASSWORD` varchar(120) DEFAULT NULL COMMENT '密码',
  `EMAIL` varchar(45) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '黄继新', 'huangjixin', null, null, '0', '1', '1', null, null, '2019-01-30 06:52:59', null, null, null, 'huangjixin', '13926205227', null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `ID` varchar(32) NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `ROLE_ID` varchar(32) DEFAULT NULL,
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_SYS_USER_ROLE_TO_SYS_USER_idx` (`USER_ID`),
  KEY `FK_SYS_USER_ROLE_TO_SYS_ROLE_idx` (`ROLE_ID`),
  CONSTRAINT `FK_SYS_USER_ROLE_TO_SYS_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SYS_USER_ROLE_TO_SYS_USER` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Function structure for getMemDeptChildren
-- ----------------------------
DROP FUNCTION IF EXISTS `getMemDeptChildren`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMemDeptChildren`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(1000);

  DECLARE sTempChd VARCHAR(1000);

  SET sTemp = '$';

  SET sTempChd =cast(rootId as CHAR);

  WHILE sTempChd is not null DO

    SET sTemp = concat(sTemp,',',sTempChd);

SELECT 
    GROUP_CONCAT(id)
INTO sTempChd FROM
    mem_dept
WHERE
    FIND_IN_SET(parent_id, sTempChd) > 0; 
 
  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getMemDeptParentList
-- ----------------------------
DROP FUNCTION IF EXISTS `getMemDeptParentList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMemDeptParentList`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(1000);

  DECLARE sTempChd VARCHAR(1000);

  SET sTemp = '$';

  SET sTempChd =cast(rootId as CHAR);

  WHILE sTempChd is not null DO

    SET sTemp = concat(sTemp,',',sTempChd);

    SELECT group_concat(parent_id) INTO sTempChd FROM mem_dept where FIND_IN_SET(id,sTempChd)>0;

  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getSysResourcesChildren
-- ----------------------------
DROP FUNCTION IF EXISTS `getSysResourcesChildren`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getSysResourcesChildren`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(1000);

  DECLARE sTempChd VARCHAR(1000);

  SET sTemp = '$';

  SET sTempChd =cast(rootId as CHAR);

  WHILE sTempChd is not null DO

    SET sTemp = concat(sTemp,',',sTempChd);

SELECT 
    GROUP_CONCAT(id)
INTO sTempChd FROM
    sys_resources
WHERE
    FIND_IN_SET(parent_id, sTempChd) > 0; 
 
  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getSysResourcesParentList
-- ----------------------------
DROP FUNCTION IF EXISTS `getSysResourcesParentList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getSysResourcesParentList`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(1000);

  DECLARE sTempChd VARCHAR(1000);

  SET sTemp = '$';

  SET sTempChd =cast(rootId as CHAR);

  WHILE sTempChd is not null DO

    SET sTemp = concat(sTemp,',',sTempChd);

    SELECT group_concat(parent_id) INTO sTempChd FROM sys_resources where FIND_IN_SET(id,sTempChd)>0;

  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;
