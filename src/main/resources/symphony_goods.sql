/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云120.79.242.37
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : 120.79.242.37:3306
 Source Schema         : b3log_symphony

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : 65001

 Date: 31/01/2019 16:48:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for symphony_goods
-- ----------------------------
DROP TABLE IF EXISTS `symphony_goods`;
CREATE TABLE `symphony_goods`  (
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `price` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '价格',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `duration` int(20) DEFAULT NULL COMMENT '时长/天',
  `insert_time` datetime(0) DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
