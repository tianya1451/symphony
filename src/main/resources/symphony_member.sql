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

 Date: 31/01/2019 16:48:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for symphony_member
-- ----------------------------
DROP TABLE IF EXISTS `symphony_member`;
CREATE TABLE `symphony_member`  (
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色id',
  `active_time` datetime(0) DEFAULT NULL COMMENT '激活时间',
  `valid_time` datetime(0) DEFAULT NULL COMMENT '截止时间',
  `insert_time` datetime(0) DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
