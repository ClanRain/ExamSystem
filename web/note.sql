/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : db

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2021-06-10 13:34:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `author` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `article` text COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('1', 'Math', 'cj', 0x6861707079);
INSERT INTO `note` VALUES ('2', 'English', 'cj', 0x6C6F7665);
INSERT INTO `note` VALUES ('4', 'Chinese', 'aa', 0x7377696D);
INSERT INTO `note` VALUES ('5', 'Science', 'cj', 0x68617465);
INSERT INTO `note` VALUES ('6', 'Janpense', 'cj', 0x74656163686572);
INSERT INTO `note` VALUES ('7', 'Society', 'cj', 0x6272656164);
