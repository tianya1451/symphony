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

 Date: 31/01/2019 16:48:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for symphony_code
-- ----------------------------
DROP TABLE IF EXISTS `symphony_code`;
CREATE TABLE `symphony_code`  (
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `member_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '会员记录id',
  `goods_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品id',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单id',
  `third_order_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第三方订单id',
  `third_pay_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第三方支付id',
  `goods_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `goods_price` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品价格',
  `actual_price` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '实际付款价格',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '兑换码',
  `insert_time` datetime(0) DEFAULT NULL COMMENT '生成时间',
  `pay_time` datetime(0) DEFAULT NULL COMMENT '付款时间',
  `valid_time` datetime(0) DEFAULT NULL COMMENT '有效时间',
  `used_time` datetime(0) DEFAULT NULL COMMENT '使用时间',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态：0待使用，1已使用，2冻结',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
