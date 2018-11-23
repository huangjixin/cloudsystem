/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : cloudsystem

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-11-22 20:23:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for art_article
-- ----------------------------
DROP TABLE IF EXISTS `art_article`;
CREATE TABLE `art_article` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '0' COMMENT '0未借出，1已经借出，2废弃',
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
  `ALLOW_RENEW` int(11) DEFAULT '1' COMMENT '0不能续借，1可以续借',
  `RENEW_TIMES` int(11) DEFAULT '1' COMMENT '允许续借次数，默认1次',
  `ICON_LOCATION` varchar(512) DEFAULT NULL COMMENT '缩略图物理路径',
  `ALLOW_SEND_MESSAGES` int(11) DEFAULT '1' COMMENT '是否允许发送短信进行逾期告警，0否，1是，默认1',
  `BORROW_QUANTUM` int(11) DEFAULT '24' COMMENT '借用时间段，按照小时为单位，默认24小时',
  `GIVE_BACK_TIME` int(11) DEFAULT NULL COMMENT '续借时间段，默认24小时，小时为单位',
  `PRE_ALARM_QUANTUM` int(11) DEFAULT '2' COMMENT '提前告警时长，小时为单位，默认2小时',
  `ICON_URL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_ART_ARTICLE_TO_ART_CATEGORY_idx` (`ICON_URL`),
  CONSTRAINT `FK_ART_ARTICLE_TO_ART_CATEGORY` FOREIGN KEY (`ICON_URL`) REFERENCES `cms_category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='物品';

-- ----------------------------
-- Records of art_article
-- ----------------------------

-- ----------------------------
-- Table structure for art_article_sku
-- ----------------------------
DROP TABLE IF EXISTS `art_article_sku`;
CREATE TABLE `art_article_sku` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(512) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '0' COMMENT '0库存，1为使用，2为归还待确认，3为驳回，4为废弃待确认，5为废弃；默认为0库存状态，使用人归还以后状态变更为2归还待确认，管理员审核改为0库存重新可以借用，如果审核不通过可以驳回状态改为3；使用人把东西用废，申请报废，状态改为4废弃待确认，管理员同意则将物品状态改为5废弃。所有物品只有库存状态可以借用。\n',
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
  `ARTICLE_ID` varchar(32) DEFAULT NULL,
  `QR_CODE` varchar(512) DEFAULT NULL,
  `QR_CODE_LOCATION` varchar(512) DEFAULT NULL,
  `QR_CODE_URL` varchar(512) DEFAULT NULL COMMENT '二维码URL地址',
  `PRICE` double DEFAULT NULL COMMENT '价格',
  `MEMBER_ID` varchar(32) DEFAULT NULL COMMENT '会员ID',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_ART_ARTICLE_SKU_TO_ART_ARTICLE_idx` (`ARTICLE_ID`),
  KEY `FK_ART_ARTICLE_SKU_TO_MEM_MEMBER_idx` (`MEMBER_ID`),
  CONSTRAINT `FK_ART_ARTICLE_SKU_TO_ART_ARTICLE` FOREIGN KEY (`ARTICLE_ID`) REFERENCES `art_article` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ART_ARTICLE_SKU_TO_MEM_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='物品sku';

-- ----------------------------
-- Records of art_article_sku
-- ----------------------------

-- ----------------------------
-- Table structure for art_article_sku_attament
-- ----------------------------
DROP TABLE IF EXISTS `art_article_sku_attament`;
CREATE TABLE `art_article_sku_attament` (
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
  `URL` varchar(512) DEFAULT NULL,
  `LOCATION` varchar(512) DEFAULT NULL,
  `ARTICLE_SKU_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_ART_ARTICLE_SKU_ATTAMENT_TO_ART_ARTICLE_SKU_idx` (`ARTICLE_SKU_ID`),
  CONSTRAINT `FK_ART_ARTICLE_SKU_ATTAMENT_TO_ART_ARTICLE_SKU` FOREIGN KEY (`ARTICLE_SKU_ID`) REFERENCES `art_article_sku` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='物品SKU图片';

-- ----------------------------
-- Records of art_article_sku_attament
-- ----------------------------

-- ----------------------------
-- Table structure for art_article_sku_reject_log
-- ----------------------------
DROP TABLE IF EXISTS `art_article_sku_reject_log`;
CREATE TABLE `art_article_sku_reject_log` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(96) DEFAULT NULL,
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
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `ART_SKU_ID` varchar(32) DEFAULT NULL,
  `MEMBER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_ART_ARTICLE_SKU_REJECT_LOG_ART_ARTICLE_SKU_idx` (`ART_SKU_ID`),
  KEY `FK_ART_ARTICLE_SKU_REJECT_LOG_TO_MEM_MEMBER_idx` (`MEMBER_ID`),
  CONSTRAINT `FK_ART_ARTICLE_SKU_REJECT_LOG_TO_ART_ARTICLE_SKU` FOREIGN KEY (`ART_SKU_ID`) REFERENCES `art_article_sku` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ART_ARTICLE_SKU_REJECT_LOG_TO_MEM_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='物品SKU驳回日志';

-- ----------------------------
-- Records of art_article_sku_reject_log
-- ----------------------------

-- ----------------------------
-- Table structure for art_category
-- ----------------------------
DROP TABLE IF EXISTS `art_category`;
CREATE TABLE `art_category` (
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
  `LEVEL` int(11) DEFAULT '0' COMMENT '层级',
  `IS_LEAF` tinyint(4) DEFAULT '1' COMMENT '是否为叶子',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_ART_CATEGORY_TO_ART_CATEGORY_idx` (`PARENT_ID`),
  CONSTRAINT `FK_ART_CATEGORY_TO_ART_CATEGORY` FOREIGN KEY (`PARENT_ID`) REFERENCES `art_category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='物品种类';

-- ----------------------------
-- Records of art_category
-- ----------------------------

-- ----------------------------
-- Table structure for art_damage
-- ----------------------------
DROP TABLE IF EXISTS `art_damage`;
CREATE TABLE `art_damage` (
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
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `ARTICLE_SKU_ID` varchar(32) DEFAULT NULL,
  `MEMBER_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ART_DAMAGE_TO_ART_DAMAGE_SKU_idx` (`ARTICLE_SKU_ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_ART_DAMAGE_TO_MEM_MEMBER_idx` (`MEMBER_ID`),
  CONSTRAINT `FK_ART_DAMAGE_TO_ART_DAMAGE_SKU` FOREIGN KEY (`ARTICLE_SKU_ID`) REFERENCES `art_article_sku` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ART_DAMAGE_TO_MEM_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='物品损坏信息描述';

-- ----------------------------
-- Records of art_damage
-- ----------------------------

-- ----------------------------
-- Table structure for art_damage_attament
-- ----------------------------
DROP TABLE IF EXISTS `art_damage_attament`;
CREATE TABLE `art_damage_attament` (
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
  `URL` varchar(512) DEFAULT NULL,
  `LOCATION` varchar(512) DEFAULT NULL,
  `DAMAGE_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_ART_DAMAGE_ATTAMENT_TO_ART_DAMAGE_idx` (`DAMAGE_ID`),
  CONSTRAINT `FK_ART_DAMAGE_ATTAMENT_TO_ART_DAMAGE` FOREIGN KEY (`DAMAGE_ID`) REFERENCES `art_damage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='损坏物品附件保存';

-- ----------------------------
-- Records of art_damage_attament
-- ----------------------------

-- ----------------------------
-- Table structure for cms_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `cms_advertisement`;
CREATE TABLE `cms_advertisement` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT '0' COMMENT '0表示轮播图，1表示列表',
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `LINK_URL` varchar(512) DEFAULT NULL COMMENT '链接',
  `CATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '频道ID，如果为"index"则为首页',
  `LOCATION` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='广告';

-- ----------------------------
-- Records of cms_advertisement
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `TITLE` varchar(45) DEFAULT NULL COMMENT '文章标题',
  `CONTENT` varchar(12000) DEFAULT NULL COMMENT '文章内容',
  `CATEGORY_ID` varchar(32) DEFAULT NULL COMMENT '分类ID ',
  PRIMARY KEY (`ID`),
  KEY `FK_CMS_ARTICLE_TO_CMS_CATEGORY_idx` (`CATEGORY_ID`),
  CONSTRAINT `FK_CMS_ARTICLE_TO_CMS_CATEGORY` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `cms_category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='文章';

-- ----------------------------
-- Records of cms_article
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article_info
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_info`;
CREATE TABLE `cms_article_info` (
  `ID` varchar(32) NOT NULL,
  `READ_NUM` int(11) DEFAULT NULL COMMENT '阅读数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='文章其他信息';

-- ----------------------------
-- Records of cms_article_info
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article_like
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_like`;
CREATE TABLE `cms_article_like` (
  `ID` varchar(32) NOT NULL,
  `ARTICLE_ID` varchar(32) DEFAULT NULL COMMENT '文章ID',
  `MEMEMBER_ID` varchar(32) DEFAULT NULL COMMENT '会员ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='文章点赞';

-- ----------------------------
-- Records of cms_article_like
-- ----------------------------

-- ----------------------------
-- Table structure for cms_attament
-- ----------------------------
DROP TABLE IF EXISTS `cms_attament`;
CREATE TABLE `cms_attament` (
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
  `URL` varchar(512) DEFAULT NULL,
  `LOCATION` varchar(512) DEFAULT NULL,
  `ARTICLE_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_CMS_ATTAMENT_TO_CMS_ARTICLE_idx` (`ARTICLE_ID`),
  CONSTRAINT `FK_CMS_ATTAMENT_TO_CMS_ARTICLE` FOREIGN KEY (`ARTICLE_ID`) REFERENCES `cms_article` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cms文章附件';

-- ----------------------------
-- Records of cms_attament
-- ----------------------------

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '文章分类ID',
  `DESCRIPTION` varchar(512) DEFAULT NULL COMMENT '描述',
  `LEVEL` int(11) DEFAULT '0' COMMENT '层级',
  `IS_LEAF` tinyint(4) DEFAULT '1' COMMENT '是否为叶子',
  PRIMARY KEY (`ID`),
  KEY `FK_CMS_CATEGORY_TO_CMS_CATEGORY_idx` (`PARENT_ID`),
  CONSTRAINT `FK_CMS_CATEGORY_TO_CMS_CATEGORY` FOREIGN KEY (`PARENT_ID`) REFERENCES `cms_category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='文章分类';

-- ----------------------------
-- Records of cms_category
-- ----------------------------

-- ----------------------------
-- Table structure for gue_category
-- ----------------------------
DROP TABLE IF EXISTS `gue_category`;
CREATE TABLE `gue_category` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gue_category
-- ----------------------------

-- ----------------------------
-- Table structure for gue_member_option
-- ----------------------------
DROP TABLE IF EXISTS `gue_member_option`;
CREATE TABLE `gue_member_option` (
  `ID` varchar(32) NOT NULL,
  `STATUS` int(11) DEFAULT '0' COMMENT '0没有揭晓答案，1为已经揭晓答案',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `OPTION_ID` varchar(32) DEFAULT NULL,
  `QUESTION_ID` varchar(32) DEFAULT NULL,
  `MEMBER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_GUE_MEMBER_OPTION_TO_MEMBER_idx` (`MEMBER_ID`),
  KEY `FK_GUE_MEMBER_OPTION_TO_OPTION_idx` (`OPTION_ID`),
  KEY `FK_GUE_MEMBER_OPTION_TO_QUESTION_idx` (`QUESTION_ID`),
  CONSTRAINT `FK_GUE_MEMBER_OPTION_TO_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_GUE_MEMBER_OPTION_TO_OPTION` FOREIGN KEY (`OPTION_ID`) REFERENCES `gue_option` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_GUE_MEMBER_OPTION_TO_QUESTION` FOREIGN KEY (`QUESTION_ID`) REFERENCES `gue_question` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员选项中间表';

-- ----------------------------
-- Records of gue_member_option
-- ----------------------------

-- ----------------------------
-- Table structure for gue_option
-- ----------------------------
DROP TABLE IF EXISTS `gue_option`;
CREATE TABLE `gue_option` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `BET_RATE` double DEFAULT '1' COMMENT '赔率，默认1',
  `STATUS` int(11) DEFAULT '0',
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
  `QUESTION_ID` varchar(32) DEFAULT NULL,
  `IS_RIGHT` tinyint(4) DEFAULT '0' COMMENT '是否为正确答案0为否，1为是，默认为0',
  PRIMARY KEY (`ID`),
  KEY `FK_GUE_OPTION_TO_GUE_QUESTION_idx` (`QUESTION_ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  CONSTRAINT `FK_GUE_OPTION_TO_GUE_QUESTION` FOREIGN KEY (`QUESTION_ID`) REFERENCES `gue_question` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gue_option
-- ----------------------------

-- ----------------------------
-- Table structure for gue_question
-- ----------------------------
DROP TABLE IF EXISTS `gue_question`;
CREATE TABLE `gue_question` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL COMMENT '0没有校验过，1为校验过',
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
  `CATEGORY_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_GUE_QUESTION_TO_GUE_CATEGORY_idx` (`CATEGORY_ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  CONSTRAINT `FK_GUE_QUESTION_TO_GUE_CATEGORY` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `gue_category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gue_question
-- ----------------------------

-- ----------------------------
-- Table structure for mem_account
-- ----------------------------
DROP TABLE IF EXISTS `mem_account`;
CREATE TABLE `mem_account` (
  `ID` varchar(32) NOT NULL COMMENT '该ID必须与会员的ID一致，当会员新增的时候，也默认创建一个或者根据会员ID去查询不到的时候，创建一个默认账户',
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `BALANCE` double DEFAULT NULL COMMENT '当前余额',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员账户表';

-- ----------------------------
-- Records of mem_account
-- ----------------------------

-- ----------------------------
-- Table structure for mem_account_log
-- ----------------------------
DROP TABLE IF EXISTS `mem_account_log`;
CREATE TABLE `mem_account_log` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL COMMENT '0为支出，1为收入',
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `BALANCE` double DEFAULT NULL COMMENT '当前余额',
  `LAST_CHANGE_BALANCE` double DEFAULT NULL,
  `MEMBER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_MEM_ACCOUNT_LOG_TO_MEMBER_idx` (`MEMBER_ID`),
  CONSTRAINT `FK_MEM_ACCOUNT_LOG_TO_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员流水表';

-- ----------------------------
-- Records of mem_account_log
-- ----------------------------

-- ----------------------------
-- Table structure for mem_address
-- ----------------------------
DROP TABLE IF EXISTS `mem_address`;
CREATE TABLE `mem_address` (
  `ID` varchar(32) NOT NULL,
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `IS_DEFAULT` tinyint(4) DEFAULT '0' COMMENT '是否为默认地址',
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  `MEMBER_ID` varchar(32) DEFAULT NULL COMMENT '会员ID',
  `PROVINCE` varchar(45) DEFAULT NULL COMMENT '省',
  `CITY` varchar(45) DEFAULT NULL COMMENT '市',
  `AREA` varchar(45) DEFAULT NULL COMMENT '区',
  `STREET` varchar(120) DEFAULT NULL COMMENT '街道',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_MEM_ADDRESS_TO_MEMBER_idx` (`MEMBER_ID`),
  CONSTRAINT `FK_MEM_ADDRESS_TO_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员地址';

-- ----------------------------
-- Records of mem_address
-- ----------------------------

-- ----------------------------
-- Table structure for mem_attament
-- ----------------------------
DROP TABLE IF EXISTS `mem_attament`;
CREATE TABLE `mem_attament` (
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
  `MEMBER_ID` varchar(32) DEFAULT NULL COMMENT '会员ID',
  `URL` varchar(512) DEFAULT NULL,
  `LOCATION` varchar(512) DEFAULT NULL,
  `JOB_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_MEM_ATTAMENT_TO_MEM_MEMBER_idx` (`MEMBER_ID`),
  KEY `FK_MEM_ATTAMENT_TO_MEM_JOB_idx` (`JOB_ID`),
  CONSTRAINT `FK_MEM_ATTAMENT_TO_MEM_JOB` FOREIGN KEY (`JOB_ID`) REFERENCES `mem_job` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MEM_ATTAMENT_TO_MEM_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='作业附件';

-- ----------------------------
-- Records of mem_attament
-- ----------------------------

-- ----------------------------
-- Table structure for mem_check
-- ----------------------------
DROP TABLE IF EXISTS `mem_check`;
CREATE TABLE `mem_check` (
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
  `MEMBER_ID` varchar(32) DEFAULT NULL,
  `CHECK_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `FK_MEM_CHECK_TO_MEM_MEMBER_idx` (`MEMBER_ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  CONSTRAINT `FK_MEM_CHECK_TO_MEM_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='会员签到';

-- ----------------------------
-- Records of mem_check
-- ----------------------------
INSERT INTO `mem_check` VALUES ('1', '1', null, null, null, '0', '1', '1', null, null, '2018-11-21 11:24:06', null, null, '2018-11-21 11:24:06');

-- ----------------------------
-- Table structure for mem_check_config
-- ----------------------------
DROP TABLE IF EXISTS `mem_check_config`;
CREATE TABLE `mem_check_config` (
  `ID` varchar(32) NOT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `RATE` int(11) DEFAULT '1440' COMMENT '签到频率，按照分钟配置,默认1440，一天一次',
  `CHECK_NUM` int(11) DEFAULT '1' COMMENT '每天签到次数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='用户签到设置表';

-- ----------------------------
-- Records of mem_check_config
-- ----------------------------

-- ----------------------------
-- Table structure for mem_coupon
-- ----------------------------
DROP TABLE IF EXISTS `mem_coupon`;
CREATE TABLE `mem_coupon` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '1' COMMENT '开启:1-启用;0-关闭',
  `TYPE` int(11) DEFAULT '0' COMMENT '优惠券类型:0-满减券;1-代金券;2-折扣券',
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL COMMENT '活动备注',
  `RECEIVE_CONDITIONS` int(11) DEFAULT '1' COMMENT '0-所有人可领;1-会员可领',
  `EFFITIVE_TIME` timestamp NULL DEFAULT NULL COMMENT '生效时间',
  `EXPIRE_TIME` timestamp NULL DEFAULT NULL COMMENT '到期时间',
  `DISCOUNT` int(11) DEFAULT NULL COMMENT '优惠折扣(类型为折扣券时填写)',
  `REDUCE_PRICE` double DEFAULT NULL COMMENT '优惠劵金额(类型为满减券、代金券时填写)',
  `RECEIVE_TIMES` int(11) DEFAULT '1' COMMENT '领取次数，默认 为1',
  `EFFITIVE_WAY` int(11) DEFAULT '1' COMMENT '生效方式0:领取后生效;1:固定日期;',
  `SHOP_ID` varchar(32) DEFAULT NULL COMMENT '商铺ID',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='优惠券';

-- ----------------------------
-- Records of mem_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for mem_coupon_member
-- ----------------------------
DROP TABLE IF EXISTS `mem_coupon_member`;
CREATE TABLE `mem_coupon_member` (
  `ID` varchar(32) NOT NULL,
  `STATUS` int(11) DEFAULT '0' COMMENT '0为已经领取未使用，1已经使用',
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1' COMMENT '0为失效，1为有效',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `MEMBER_ID` varchar(32) DEFAULT NULL,
  `COUPON_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MEM_COUPON_MEMBER_TO_MEMBER_idx` (`MEMBER_ID`),
  KEY `FK_MEM_COUPON_MEMBER_TO_COUPON_ID_idx` (`COUPON_ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  CONSTRAINT `FK_MEM_COUPON_MEMBER_TO_COUPON_ID` FOREIGN KEY (`COUPON_ID`) REFERENCES `mem_coupon` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MEM_COUPON_MEMBER_TO_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='优惠券会员中间表';

-- ----------------------------
-- Records of mem_coupon_member
-- ----------------------------

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
  `LEVEL` int(11) DEFAULT '0' COMMENT '层级',
  `IS_LEAF` tinyint(4) DEFAULT '1' COMMENT '是否为叶子',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_MEM_DEPT_TO_MEM_DEPT_idx` (`PARENT_ID`),
  CONSTRAINT `FK_MEM_DEPT_TO_MEM_DEPT` FOREIGN KEY (`PARENT_ID`) REFERENCES `mem_dept` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mem_dept
-- ----------------------------

-- ----------------------------
-- Table structure for mem_exception_job
-- ----------------------------
DROP TABLE IF EXISTS `mem_exception_job`;
CREATE TABLE `mem_exception_job` (
  `ID` varchar(32) NOT NULL,
  `JOB_ID` varchar(32) DEFAULT NULL,
  `MEMBER_ID` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1为有效，表示问题仍然存在；0表示问题已经得到解决',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MEM_EXCEPTION_JOB_TO_MEM_JOB_idx` (`JOB_ID`),
  KEY `FK_MEM_EXCEPTION_JOB_TO_MEM_MEMBER_idx` (`MEMBER_ID`),
  CONSTRAINT `FK_MEM_EXCEPTION_JOB_TO_MEM_JOB` FOREIGN KEY (`JOB_ID`) REFERENCES `mem_job` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MEM_EXCEPTION_JOB_TO_MEM_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='标注为有问题的作业';

-- ----------------------------
-- Records of mem_exception_job
-- ----------------------------

-- ----------------------------
-- Table structure for mem_flow
-- ----------------------------
DROP TABLE IF EXISTS `mem_flow`;
CREATE TABLE `mem_flow` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL COMMENT '0为支出，1为收入  ',
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `AMOUNT` double DEFAULT NULL COMMENT '金额',
  `MEMBER_ID` varchar(32) DEFAULT NULL,
  `PAY_WAY` int(11) DEFAULT '1' COMMENT '支付方式:1-微信;2-钱包;3-支付宝; 4-银联;',
  `FLOW_NUM` varchar(64) DEFAULT NULL COMMENT '流水号',
  `FLOW_DESCRIPTION` varchar(45) DEFAULT NULL COMMENT '流水号说明',
  `FLOW_TYPE` int(11) DEFAULT NULL COMMENT '1为订单；2为平台充值；3为平台兑换；4积分兑换；5提现；想到再定义',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_MEM_FLOW_TO_MEMBER_idx` (`MEMBER_ID`),
  CONSTRAINT `FK_MEM_FLOW_TO_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员流水记录';

-- ----------------------------
-- Records of mem_flow
-- ----------------------------

-- ----------------------------
-- Table structure for mem_goods_member
-- ----------------------------
DROP TABLE IF EXISTS `mem_goods_member`;
CREATE TABLE `mem_goods_member` (
  `ID` varchar(32) NOT NULL,
  `MEMBER_ID` varchar(32) DEFAULT NULL,
  `GOODS_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MEM_GOODS_MEMBER_TO_MEMBER_idx` (`MEMBER_ID`),
  KEY `FK_MEM_GOODS_MEMBER_TO_GOODS_idx` (`GOODS_ID`),
  CONSTRAINT `FK_MEM_GOODS_MEMBER_TO_GOODS` FOREIGN KEY (`GOODS_ID`) REFERENCES `pro_goods` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MEM_GOODS_MEMBER_TO_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员收藏商品记录';

-- ----------------------------
-- Records of mem_goods_member
-- ----------------------------

-- ----------------------------
-- Table structure for mem_job
-- ----------------------------
DROP TABLE IF EXISTS `mem_job`;
CREATE TABLE `mem_job` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '1' COMMENT '状态：1马上生效，0为草稿',
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
  `MEMBER_ID` varchar(32) DEFAULT NULL COMMENT '会员ID',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_MEM_JOB_TO_MEM_MEMBER_idx` (`MEMBER_ID`),
  CONSTRAINT `FK_MEM_JOB_TO_MEM_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='用户作业';

-- ----------------------------
-- Records of mem_job
-- ----------------------------

-- ----------------------------
-- Table structure for mem_job_record
-- ----------------------------
DROP TABLE IF EXISTS `mem_job_record`;
CREATE TABLE `mem_job_record` (
  `ID` varchar(32) NOT NULL COMMENT '与作业步骤一致的ID',
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DESCRIPTION` varchar(512) DEFAULT 'ON UPDATE CURRENT_TIMESTAMP',
  `URL` varchar(512) DEFAULT NULL COMMENT '作业连接',
  `LOCATION` varchar(45) DEFAULT NULL COMMENT '物理地址',
  `JOB_ID` varchar(32) DEFAULT NULL COMMENT '作业ID',
  PRIMARY KEY (`ID`),
  KEY `FK_MEM_JOB_RECORD_TO_MEM_JOB_idx` (`JOB_ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  CONSTRAINT `FK_MEM_JOB_RECORD_TO_MEM_JOB` FOREIGN KEY (`JOB_ID`) REFERENCES `mem_job` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='作业步骤录像';

-- ----------------------------
-- Records of mem_job_record
-- ----------------------------

-- ----------------------------
-- Table structure for mem_job_step
-- ----------------------------
DROP TABLE IF EXISTS `mem_job_step`;
CREATE TABLE `mem_job_step` (
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
  `JOB_ID` varchar(32) DEFAULT NULL COMMENT '作业ID',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_MEM_JOB_STEP_TO_MEM_JOB_idx` (`JOB_ID`),
  CONSTRAINT `FK_MEM_JOB_STEP_TO_MEM_JOB` FOREIGN KEY (`JOB_ID`) REFERENCES `mem_job` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='作业步骤';

-- ----------------------------
-- Records of mem_job_step
-- ----------------------------

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
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL COMMENT '描述',
  `LOGIN_NAME` varchar(32) DEFAULT NULL COMMENT '登录账号',
  `MOBILE` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `PASSWORD` varchar(32) DEFAULT NULL COMMENT '密码',
  `SEX` int(11) DEFAULT NULL COMMENT '1表示男，0表示女',
  `WECHAT` varchar(32) DEFAULT NULL COMMENT '微信号码',
  `IF_BIND_WECHAT` varchar(32) DEFAULT NULL COMMENT '是否绑定微信号',
  `OPEN_ID` varchar(64) DEFAULT NULL,
  `UNION_ID` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员';

-- ----------------------------
-- Records of mem_member
-- ----------------------------

-- ----------------------------
-- Table structure for mem_member_article
-- ----------------------------
DROP TABLE IF EXISTS `mem_member_article`;
CREATE TABLE `mem_member_article` (
  `ID` varchar(32) NOT NULL,
  `MEMBER_ID` varchar(32) DEFAULT NULL COMMENT '会员ID',
  `ARTICLE_ID` varchar(32) DEFAULT NULL COMMENT '文章ID',
  PRIMARY KEY (`ID`),
  KEY `FK_MEMBER_ARTICLE_TO_MEMBER_idx` (`MEMBER_ID`),
  KEY `FK_MEMBER_ARTICLE_TO_ARTICLE_idx` (`ARTICLE_ID`),
  CONSTRAINT `FK_MEMBER_ARTICLE_TO_ARTICLE` FOREIGN KEY (`ARTICLE_ID`) REFERENCES `cms_article` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MEMBER_ARTICLE_TO_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员文章中间表';

-- ----------------------------
-- Records of mem_member_article
-- ----------------------------

-- ----------------------------
-- Table structure for mem_member_role
-- ----------------------------
DROP TABLE IF EXISTS `mem_member_role`;
CREATE TABLE `mem_member_role` (
  `ID` varchar(32) NOT NULL,
  `MEMBER_ID` varchar(32) DEFAULT NULL COMMENT '会员ID',
  `ROLE_ID` varchar(32) DEFAULT NULL COMMENT '会员用户的角色ID',
  PRIMARY KEY (`ID`),
  KEY `FK_MEM_MEMBER_ROLE_TO_MEM_MEMBER_idx` (`MEMBER_ID`),
  KEY `FK_MEM_MEMBER_ROLE_TO_MEM_ROLE_idx` (`ROLE_ID`),
  CONSTRAINT `FK_MEM_MEMBER_ROLE_TO_MEM_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MEM_MEMBER_ROLE_TO_MEM_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `mem_role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员与会员角色的中间表';

-- ----------------------------
-- Records of mem_member_role
-- ----------------------------

-- ----------------------------
-- Table structure for mem_point
-- ----------------------------
DROP TABLE IF EXISTS `mem_point`;
CREATE TABLE `mem_point` (
  `ID` varchar(32) NOT NULL COMMENT '此ID与会员的ID一致',
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `BALANCE` int(11) DEFAULT NULL COMMENT '积分情况',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员积分';

-- ----------------------------
-- Records of mem_point
-- ----------------------------

-- ----------------------------
-- Table structure for mem_point_log
-- ----------------------------
DROP TABLE IF EXISTS `mem_point_log`;
CREATE TABLE `mem_point_log` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT '0' COMMENT '0支出，1收入，默认支出',
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `BALANCE` double DEFAULT NULL COMMENT '当前余额',
  `LAST_CHANGE_BALANCE` double DEFAULT NULL COMMENT '上次变动余额',
  `MEMBER_ID` varchar(32) DEFAULT NULL COMMENT '会员ID',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_MEM_POINT_LOG_TO_MEMBER_idx` (`MEMBER_ID`),
  CONSTRAINT `FK_MEM_POINT_LOG_TO_MEMBER` FOREIGN KEY (`MEMBER_ID`) REFERENCES `mem_member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='积分兑换流水表';

-- ----------------------------
-- Records of mem_point_log
-- ----------------------------

-- ----------------------------
-- Table structure for mem_role
-- ----------------------------
DROP TABLE IF EXISTS `mem_role`;
CREATE TABLE `mem_role` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增序号',
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `DEPT_ID` varchar(32) DEFAULT NULL COMMENT '会员用户的部门ID，表明角色是属于哪个部门',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员角色';

-- ----------------------------
-- Records of mem_role
-- ----------------------------

-- ----------------------------
-- Table structure for pro_attament
-- ----------------------------
DROP TABLE IF EXISTS `pro_attament`;
CREATE TABLE `pro_attament` (
  `ID` varchar(32) NOT NULL,
  `TYPE` int(11) DEFAULT NULL COMMENT '0为商品轮播图，1为商品SKU描述图，2商品描述图',
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LOCATION` varchar(512) DEFAULT NULL,
  `URL` varchar(512) DEFAULT NULL,
  `GOODS_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_PRO_ATTAMENT_TO_PRO_GOODS_idx` (`GOODS_ID`),
  CONSTRAINT `FK_PRO_ATTAMENT_TO_PRO_GOODS` FOREIGN KEY (`GOODS_ID`) REFERENCES `pro_goods` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='商品附件';

-- ----------------------------
-- Records of pro_attament
-- ----------------------------

-- ----------------------------
-- Table structure for pro_category
-- ----------------------------
DROP TABLE IF EXISTS `pro_category`;
CREATE TABLE `pro_category` (
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
  `LEVEL` int(11) DEFAULT '0' COMMENT '层级',
  `IS_LEAF` tinyint(4) DEFAULT '1' COMMENT '是否为叶子',
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父类ID',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_PRO_CATEGORY_TO_PRO_CATEGORY_idx` (`PARENT_ID`),
  CONSTRAINT `FK_PRO_CATEGORY_TO_PRO_CATEGORY` FOREIGN KEY (`PARENT_ID`) REFERENCES `pro_category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='商品分类';

-- ----------------------------
-- Records of pro_category
-- ----------------------------

-- ----------------------------
-- Table structure for pro_goods
-- ----------------------------
DROP TABLE IF EXISTS `pro_goods`;
CREATE TABLE `pro_goods` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '0' COMMENT '状态:0-正常;1-已删除;2-下架;3-申请上架;4-拒绝;5-上架',
  `TYPE` int(11) DEFAULT '0' COMMENT '允许购买用户:0-全部用户;1-VIP用户',
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `IS_NEW` tinyint(4) DEFAULT '1' COMMENT '新品:0-否;1-是',
  `IS_HOT` tinyint(4) DEFAULT '0' COMMENT '热门:0-否;1-是',
  `IS_RECOMMEND` tinyint(4) DEFAULT '0' COMMENT '热门:0-否;1-是',
  `APPLY_UP_TIME` timestamp NULL DEFAULT NULL COMMENT '申请上架时间',
  `DOWN_TIME` timestamp NULL DEFAULT NULL COMMENT '下架时间',
  `UP_TIME` timestamp NULL DEFAULT NULL COMMENT '上架时间',
  `IS_RECOMMOND_TO_INDEX` tinyint(4) DEFAULT '0' COMMENT '是否推荐到首页，0否，1是',
  `DOWN_REASON` varchar(45) DEFAULT NULL COMMENT '下架理由',
  `REJECT_REASON` varchar(45) DEFAULT NULL COMMENT '管理员拒绝上架理由',
  `CATEGORY_ID` varchar(32) DEFAULT NULL,
  `TITLE` varchar(45) DEFAULT NULL COMMENT '标题',
  `SHOP_ID` varchar(32) DEFAULT NULL COMMENT '商铺ID',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_PRO_GOODS_TO_PRO_CATEGORY_idx` (`CATEGORY_ID`),
  KEY `FK_PRO_GOODS_TO_PRO_SHOP_idx` (`SHOP_ID`),
  CONSTRAINT `FK_PRO_GOODS_TO_PRO_CATEGORY` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `pro_category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRO_GOODS_TO_PRO_SHOP` FOREIGN KEY (`SHOP_ID`) REFERENCES `pro_shop` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='商品';

-- ----------------------------
-- Records of pro_goods
-- ----------------------------

-- ----------------------------
-- Table structure for pro_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `pro_goods_info`;
CREATE TABLE `pro_goods_info` (
  `ID` varchar(32) NOT NULL,
  `SALE_COUNT` int(11) DEFAULT NULL COMMENT '销售量',
  `VISIT_COUNT` int(11) DEFAULT NULL COMMENT '浏览次数',
  `COLLECT_COUNT` int(11) DEFAULT NULL COMMENT '收藏次数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='商品拓展信息，ID与商品ID一致';

-- ----------------------------
-- Records of pro_goods_info
-- ----------------------------

-- ----------------------------
-- Table structure for pro_goods_property
-- ----------------------------
DROP TABLE IF EXISTS `pro_goods_property`;
CREATE TABLE `pro_goods_property` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `VALUE` varchar(32) DEFAULT NULL,
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `GOODS_ID` varchar(32) DEFAULT NULL,
  `PROPERTY_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PRO_GOODS_PROPERTY_TO_PRO_PROPERTY_idx` (`PROPERTY_ID`),
  KEY `FK_PRO_GOODS_PROPERTY_TO_PRO_GOODS_idx` (`GOODS_ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  CONSTRAINT `FK_PRO_GOODS_PROPERTY_TO_PRO_GOODS` FOREIGN KEY (`GOODS_ID`) REFERENCES `pro_goods` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRO_GOODS_PROPERTY_TO_PRO_PROPERTY` FOREIGN KEY (`PROPERTY_ID`) REFERENCES `pro_property` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='商品属性值中间表';

-- ----------------------------
-- Records of pro_goods_property
-- ----------------------------

-- ----------------------------
-- Table structure for pro_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `pro_goods_sku`;
CREATE TABLE `pro_goods_sku` (
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
  `SELL_PRICE` double DEFAULT NULL COMMENT '销售价',
  `MARKET_PRICE` double DEFAULT NULL COMMENT '市场价',
  `STORAGE_COUNT` int(11) DEFAULT NULL,
  `LINE_PRICE` double DEFAULT NULL COMMENT '划线价',
  `GOODS_ID` varchar(32) DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_PRO_GOODS_SKU_TO_PRO_GOODS_idx` (`GOODS_ID`),
  CONSTRAINT `FK_PRO_GOODS_SKU_TO_PRO_GOODS` FOREIGN KEY (`GOODS_ID`) REFERENCES `pro_goods` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='商品SKU';

-- ----------------------------
-- Records of pro_goods_sku
-- ----------------------------

-- ----------------------------
-- Table structure for pro_order
-- ----------------------------
DROP TABLE IF EXISTS `pro_order`;
CREATE TABLE `pro_order` (
  `ID` varchar(32) NOT NULL COMMENT '订单表ID',
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '1' COMMENT '订单状态:1-待付款;2-待发货;3-备货中;4-已发货;5-待评价;6-已评价;7-已取消;',
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
  `PARENT_ID` varchar(45) DEFAULT NULL,
  `SHOP_ID` varchar(32) DEFAULT NULL,
  `COUPON_ID` varchar(32) DEFAULT NULL COMMENT '优惠券ID',
  `COUPON_PRICE` double DEFAULT NULL COMMENT '优惠券抵扣金额',
  `TOTAL_PRICE` double DEFAULT NULL COMMENT '商品总金额',
  `PAY_PRICE` double DEFAULT NULL COMMENT '支付总金额',
  `ORDER_NUM` varchar(64) DEFAULT NULL COMMENT '订单号',
  `PAYMENT_NUM` varchar(128) DEFAULT NULL COMMENT '第三方支付单号',
  `DELIVERY_WAY` int(11) DEFAULT NULL COMMENT '配送方式:0-商家自配;1-快递物流',
  `PAY_TIME` timestamp NULL DEFAULT NULL COMMENT '支付完成时间',
  `PAY_WAY` int(11) DEFAULT NULL COMMENT '支付方式:1-微信;2-钱包;3-支付宝; 4-银联;',
  `SEND_TIME` timestamp NULL DEFAULT NULL,
  `RECEIVE_TYPE` int(11) DEFAULT '1' COMMENT '确认收货类型:1-用户确认收货;2-系统确认收货',
  `RECEIVE_TIME` timestamp NULL DEFAULT NULL COMMENT '用户确认收货时间',
  `SHOULD_CONFIRM_TIME` timestamp NULL DEFAULT NULL COMMENT '用户应该确认收货时间，过期系统自动收货',
  `FULL_ADDR` varchar(120) DEFAULT NULL COMMENT '完整地址',
  `USERNAME` varchar(45) DEFAULT NULL COMMENT '用户名',
  `MOBILE` varchar(45) DEFAULT NULL COMMENT '电话',
  `DELIVERY_PRICE` double DEFAULT NULL COMMENT '邮费',
  `EXPR_CODE` varchar(45) DEFAULT NULL COMMENT '物流公司缩写',
  `EXPR_NAME` varchar(45) DEFAULT NULL COMMENT '物流公司',
  `EXPR_NUM` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `EXPR_STATUS` varchar(45) DEFAULT NULL COMMENT '物流状态:0-未发货;1-已发货;2-已收货',
  `REFUND_STATUS` int(11) DEFAULT NULL COMMENT '退款状态:0-正常(未退款);1-退款中;2-退款成功;3-退款失败;4-退款拒绝',
  `EXPRIED_TIME` timestamp NULL DEFAULT NULL COMMENT '过期时间',
  `REFUND_TIME` timestamp NULL DEFAULT NULL COMMENT '最新一次提交退款的时间',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `SHOP_INDEX` (`SHOP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单模块表';

-- ----------------------------
-- Records of pro_order
-- ----------------------------

-- ----------------------------
-- Table structure for pro_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `pro_order_refund`;
CREATE TABLE `pro_order_refund` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL COMMENT '退款类型:1-全额退款;2-部分退款',
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL COMMENT '退款图片',
  `DESCRIPTION` varchar(512) DEFAULT NULL COMMENT '用户退款说明',
  `CONTACT_PHONE` varchar(45) DEFAULT NULL COMMENT '退款人联系电话',
  `USERNAME` varchar(45) DEFAULT NULL COMMENT '名字',
  `ORDER_ID` varchar(32) DEFAULT NULL COMMENT '订单ID',
  `REFUND_NUM` varchar(64) DEFAULT NULL COMMENT '退款单号',
  `REFUND_STATUS` int(11) DEFAULT NULL COMMENT '退款状态:1-退款中;2-退款成功;3-退款失败;4-退款拒绝',
  `AMOUNT` double DEFAULT NULL COMMENT '退款金额',
  `REFUSE_REASON` varchar(256) DEFAULT NULL COMMENT '拒绝理由',
  `DIPOSE_TIME` timestamp NULL DEFAULT NULL COMMENT '处理时间',
  `REASON` int(11) DEFAULT NULL COMMENT '退款原由:1-坏果/烂果;2-质量有问题;3-所收货物与描述不符;4-发错货.5其它',
  `MEMBER_ID` varchar(32) DEFAULT NULL,
  `SHOP_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单退款';

-- ----------------------------
-- Records of pro_order_refund
-- ----------------------------

-- ----------------------------
-- Table structure for pro_property
-- ----------------------------
DROP TABLE IF EXISTS `pro_property`;
CREATE TABLE `pro_property` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='商品属性';

-- ----------------------------
-- Records of pro_property
-- ----------------------------

-- ----------------------------
-- Table structure for pro_shop
-- ----------------------------
DROP TABLE IF EXISTS `pro_shop`;
CREATE TABLE `pro_shop` (
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
  `LOCATION` varchar(512) DEFAULT NULL COMMENT '物理地址',
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `USER_INDEX` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='商铺';

-- ----------------------------
-- Records of pro_shop
-- ----------------------------

-- ----------------------------
-- Table structure for system_attament
-- ----------------------------
DROP TABLE IF EXISTS `system_attament`;
CREATE TABLE `system_attament` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1',
  `SORT_NUM` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL,
  `PATH` varchar(512) DEFAULT NULL COMMENT '物理路径',
  `URL` varchar(512) DEFAULT NULL COMMENT 'web路径',
  `USER_ID` varchar(32) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='系统附件表';

-- ----------------------------
-- Records of system_attament
-- ----------------------------

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept` (
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
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父类ID',
  `LEVEL` int(11) DEFAULT '0' COMMENT '层级',
  `IS_LEAF` tinyint(4) DEFAULT '1' COMMENT '是否为叶子',
  PRIMARY KEY (`ID`),
  KEY `FK_SYSTEM_DEPT_TO_SYSTEM_DEPT_idx` (`PARENT_ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  CONSTRAINT `FK_SYSTEM_DEPT_TO_SYSTEM_DEPT` FOREIGN KEY (`PARENT_ID`) REFERENCES `system_dept` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='组织';

-- ----------------------------
-- Records of system_dept
-- ----------------------------

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `OPE_METHOD` varchar(45) DEFAULT NULL COMMENT '操作方法',
  `CONTENT` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='管理员系统操作日志';

-- ----------------------------
-- Records of system_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_resource
-- ----------------------------
DROP TABLE IF EXISTS `system_resource`;
CREATE TABLE `system_resource` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0' COMMENT '0表示不锁定，1表示锁定',
  `IS_VALID` int(11) DEFAULT '1' COMMENT '0表示删除，1表示可用',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父类ID',
  `ICON` varchar(512) DEFAULT NULL COMMENT '缩略图',
  `LEVEL` int(11) DEFAULT '0' COMMENT '层级',
  `IS_LEAF` tinyint(4) DEFAULT '1' COMMENT '是否为叶子',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`),
  KEY `FK_TB_RESOURCE_PARENT_ID_TO_TB_RESOURCE_idx` (`PARENT_ID`),
  CONSTRAINT `FK_SYSTEM_RESOURCE_TO_SYSTEM_RESOURCE` FOREIGN KEY (`PARENT_ID`) REFERENCES `system_resource` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='系统资源';

-- ----------------------------
-- Records of system_resource
-- ----------------------------

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0' COMMENT '0表示不锁定，1表示锁定',
  `IS_VALID` int(11) DEFAULT '1' COMMENT '0表示删除，1表示可用',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ICON` varchar(512) DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`ID`),
  KEY `sort_index` (`SORT_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='角色';

-- ----------------------------
-- Records of system_role
-- ----------------------------

-- ----------------------------
-- Table structure for system_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `system_role_resource`;
CREATE TABLE `system_role_resource` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT NULL,
  `IS_VALID` int(11) DEFAULT '1' COMMENT '0表示删除，1表示可用',
  `SORT_NUM` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `ROLE_ID` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `RESOURCE_ID` varchar(32) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID`),
  KEY `FK_TB_ROLE_RESOURCE_RESOURCE_ID_TO_TB_RESOURCE_idx` (`RESOURCE_ID`),
  KEY `FK_TB_ROLE_RESOURCE_ROLE_ID_TO_TB_ROLE_idx` (`ROLE_ID`),
  CONSTRAINT `FK_TB_ROLE_RESOURCE_RESOURCE_ID_TO_TB_RESOURCE` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `system_resource` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TB_ROLE_RESOURCE_ROLE_ID_TO_TB_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `system_role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='角色资源中间表';

-- ----------------------------
-- Records of system_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `ID` varchar(32) NOT NULL COMMENT '系统ID标识符',
  `NAME` varchar(32) DEFAULT NULL COMMENT '姓名',
  `CODE` varchar(32) DEFAULT NULL COMMENT '代码',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '状态，待定',
  `TYPE` int(11) DEFAULT NULL COMMENT '类型',
  `IS_LOCKED` int(11) DEFAULT '0' COMMENT '是否被锁定，0不是，1是，默认不锁定',
  `IS_VALID` int(11) DEFAULT '1' COMMENT '是否删除，1是，0否',
  `SORT_NUM` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号自增',
  `CREATE_BY` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATE_BY` varchar(32) DEFAULT NULL COMMENT '编辑人',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '编辑时间',
  `LOGIN_NAME` varchar(32) DEFAULT NULL COMMENT '登录名',
  `PASSWORD` varchar(64) DEFAULT NULL COMMENT '密码',
  `EMAIL` varchar(45) DEFAULT NULL COMMENT '邮箱',
  `ICON` varchar(512) DEFAULT NULL COMMENT '缩略图',
  `MOBILE` varchar(45) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`ID`),
  KEY `SORT_INDEX` (`SORT_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='系统用户';

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1', 'admin', null, null, null, '0', '1', '1', null, null, '2018-11-19 11:08:50', null, 'admin', '$2a$10$z94ioqXJvEcacuOxVJ2kG.RfcPczjuRgoYanQigPtGJ4kkr/Vl54W', null, null, '13926205227');

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `IS_LOCKED` int(11) DEFAULT '0',
  `IS_VALID` int(11) DEFAULT '1' COMMENT '0表示删除，1表示可用',
  `SORT_NUM` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `ROLE_ID` varchar(32) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID`),
  KEY `FK_USER_ID_TO_TB_USER_idx` (`USER_ID`),
  KEY `FK_ROLE_ID_TO_TB_ROLE_idx` (`ROLE_ID`),
  CONSTRAINT `FK_TB_USER_ROLE_ROLE_ID_TO_TB_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `system_role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TB_USER_ROLE_USER_ID_TO_TB_USER` FOREIGN KEY (`USER_ID`) REFERENCES `system_user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='用户角色中间表';

-- ----------------------------
-- Records of system_user_role
-- ----------------------------

-- ----------------------------
-- Function structure for getArtCategoryChildren
-- ----------------------------
DROP FUNCTION IF EXISTS `getArtCategoryChildren`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getArtCategoryChildren`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET latin1
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
    Art_Category
WHERE
    FIND_IN_SET(parent_id, sTempChd) > 0; 
 
  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getArtCategoryParentList
-- ----------------------------
DROP FUNCTION IF EXISTS `getArtCategoryParentList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getArtCategoryParentList`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET latin1
BEGIN
DECLARE sTemp VARCHAR(1000);

  DECLARE sTempChd VARCHAR(1000);

  SET sTemp = '$';

  SET sTempChd =cast(rootId as CHAR);

  WHILE sTempChd is not null DO

    SET sTemp = concat(sTemp,',',sTempChd);

    SELECT group_concat(parent_id) INTO sTempChd FROM Art_Category where FIND_IN_SET(id,sTempChd)>0;

  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getCmsCategoryChildren
-- ----------------------------
DROP FUNCTION IF EXISTS `getCmsCategoryChildren`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getCmsCategoryChildren`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET latin1
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
    Cms_Category
WHERE
    FIND_IN_SET(parent_id, sTempChd) > 0; 
 
  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getCmsCategoryParentList
-- ----------------------------
DROP FUNCTION IF EXISTS `getCmsCategoryParentList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getCmsCategoryParentList`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET latin1
BEGIN
DECLARE sTemp VARCHAR(1000);

  DECLARE sTempChd VARCHAR(1000);

  SET sTemp = '$';

  SET sTempChd =cast(rootId as CHAR);

  WHILE sTempChd is not null DO

    SET sTemp = concat(sTemp,',',sTempChd);

    SELECT group_concat(parent_id) INTO sTempChd FROM Cms_Category where FIND_IN_SET(id,sTempChd)>0;

  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getDeptChildren
-- ----------------------------
DROP FUNCTION IF EXISTS `getDeptChildren`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getDeptChildren`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET latin1
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
    system_dept
WHERE
    FIND_IN_SET(parent_id, sTempChd) > 0; 
 
  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getDeptParentList
-- ----------------------------
DROP FUNCTION IF EXISTS `getDeptParentList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getDeptParentList`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET latin1
BEGIN
DECLARE sTemp VARCHAR(1000);

  DECLARE sTempChd VARCHAR(1000);

  SET sTemp = '$';

  SET sTempChd =cast(rootId as CHAR);

  WHILE sTempChd is not null DO

    SET sTemp = concat(sTemp,',',sTempChd);

    SELECT group_concat(parent_id) INTO sTempChd FROM system_dept where FIND_IN_SET(id,sTempChd)>0;

  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getMemDeptChildren
-- ----------------------------
DROP FUNCTION IF EXISTS `getMemDeptChildren`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMemDeptChildren`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET latin1
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
    Mem_Dept
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
CREATE DEFINER=`root`@`localhost` FUNCTION `getMemDeptParentList`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET latin1
BEGIN
DECLARE sTemp VARCHAR(1000);

  DECLARE sTempChd VARCHAR(1000);

  SET sTemp = '$';

  SET sTempChd =cast(rootId as CHAR);

  WHILE sTempChd is not null DO

    SET sTemp = concat(sTemp,',',sTempChd);

    SELECT group_concat(parent_id) INTO sTempChd FROM Mem_Dept where FIND_IN_SET(id,sTempChd)>0;

  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getProCategoryChildren
-- ----------------------------
DROP FUNCTION IF EXISTS `getProCategoryChildren`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getProCategoryChildren`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET latin1
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
    pro_category
WHERE
    FIND_IN_SET(parent_id, sTempChd) > 0; 
 
  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getProCategoryParentList
-- ----------------------------
DROP FUNCTION IF EXISTS `getProCategoryParentList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getProCategoryParentList`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET latin1
BEGIN
DECLARE sTemp VARCHAR(1000);

  DECLARE sTempChd VARCHAR(1000);

  SET sTemp = '$';

  SET sTempChd =cast(rootId as CHAR);

  WHILE sTempChd is not null DO

    SET sTemp = concat(sTemp,',',sTempChd);

    SELECT group_concat(parent_id) INTO sTempChd FROM Pro_Category where FIND_IN_SET(id,sTempChd)>0;

  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getResourceChildren
-- ----------------------------
DROP FUNCTION IF EXISTS `getResourceChildren`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getResourceChildren`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET latin1
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
    system_resource
WHERE
    FIND_IN_SET(parent_id, sTempChd) > 0; 
 
  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getResourceParentList
-- ----------------------------
DROP FUNCTION IF EXISTS `getResourceParentList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getResourceParentList`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET latin1
BEGIN
DECLARE sTemp VARCHAR(1000);

  DECLARE sTempChd VARCHAR(1000);

  SET sTemp = '$';

  SET sTempChd =cast(rootId as CHAR);

  WHILE sTempChd is not null DO

    SET sTemp = concat(sTemp,',',sTempChd);

    SELECT group_concat(parent_id) INTO sTempChd FROM system_resource where FIND_IN_SET(id,sTempChd)>0;

  END WHILE;

  RETURN sTemp;
END
;;
DELIMITER ;
