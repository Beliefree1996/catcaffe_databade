/*
 Navicat Premium Data Transfer

 Source Server         : localhost_ChenXin
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : cat

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 07/06/2020 23:44:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cat
-- ----------------------------
DROP TABLE IF EXISTS `cat`;
CREATE TABLE `cat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `attendance` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `employeeID` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cat-employee` (`employeeID`),
  CONSTRAINT `cat-employee` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cat
-- ----------------------------
BEGIN;
INSERT INTO `cat` VALUES (1, 'Tom', 2, 'male', 800, 'yes', 2);
INSERT INTO `cat` VALUES (2, 'Susan', 3, 'female', 650, 'no', 3);
INSERT INTO `cat` VALUES (3, 'Marry', 4, 'male', 500, 'yes', 4);
INSERT INTO `cat` VALUES (5, 'bonbon', 1, 'female', 500, 'yes', 3);
COMMIT;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `technical_title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `month_salary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `home_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userId` int DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `employee-user` (`userId`),
  CONSTRAINT `employee-user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------
BEGIN;
INSERT INTO `employee` VALUES (1, 'Mike', 22, 'male', 'manager', '18000', 'Shanghai', 3);
INSERT INTO `employee` VALUES (2, 'Tom', 23, 'male', 'staff', '5000', 'Suzhou', 3);
INSERT INTO `employee` VALUES (3, 'Helen', 24, 'female', 'staff', '8000', 'ChongQing', 1);
INSERT INTO `employee` VALUES (4, 'SanZhang', 39, 'male', 'staff', '9000', 'Beijing', 2);
INSERT INTO `employee` VALUES (5, 'Jerry', 22, 'female', 'staff', '6800', 'HangZhou', 3);
COMMIT;

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeId` int DEFAULT '1',
  `userId` int DEFAULT '1',
  `content` text,
  PRIMARY KEY (`id`),
  KEY `evaluation-employee` (`employeeId`),
  KEY `evaluation-user` (`userId`),
  CONSTRAINT `evaluation-employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`id`),
  CONSTRAINT `evaluation-user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
BEGIN;
INSERT INTO `evaluation` VALUES (1, 1, 3, 'Work hard, ambitious, and very responsible');
INSERT INTO `evaluation` VALUES (2, 1, 1, 'Passionate work, very meticulous, is an excellent employee');
INSERT INTO `evaluation` VALUES (3, 1, 1, 'Ability to commute on time and complete your get off work in time');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sale` int DEFAULT NULL COMMENT '销售额',
  `cost` int NOT NULL COMMENT '成本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (2, 'Cappuccino', 30, 13);
INSERT INTO `product` VALUES (5, 'Latte', 28, 12);
INSERT INTO `product` VALUES (6, 'Milk tea', 20, 9);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'boss', '123');
INSERT INTO `user` VALUES (2, 'bonbon', '123');
INSERT INTO `user` VALUES (3, 'root', '123456');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
