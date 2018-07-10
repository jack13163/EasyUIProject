/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50710
 Source Host           : localhost:3306
 Source Schema         : web

 Target Server Type    : MySQL
 Target Server Version : 50710
 File Encoding         : 65001

 Date: 10/07/2018 13:00:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 10001
-- ----------------------------
DROP TABLE IF EXISTS `10001`;
CREATE TABLE `10001`  (
  `ID` int(100) NOT NULL,
  `测试日期` date NOT NULL,
  `测试时间` time(0) NULL DEFAULT NULL,
  `备注` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `温度` double NULL DEFAULT 0,
  `湿度` double NULL DEFAULT 0,
  PRIMARY KEY (`ID`, `测试日期`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (to_days(`测试日期`))
PARTITIONS 12
(PARTITION `P0` VALUES LESS THAN (737425) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P1` VALUES LESS THAN (737606) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P2` VALUES LESS THAN (737790) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P3` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P4` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P5` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P6` VALUES LESS THAN (738521) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P7` VALUES LESS THAN (738702) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P8` VALUES LESS THAN (738886) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P9` VALUES LESS THAN (739433) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P10` VALUES LESS THAN (739617) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P11` VALUES LESS THAN (739798) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of 10001
-- ----------------------------
INSERT INTO `10001` VALUES (1, '2018-07-04', '19:31:32', NULL, 1, 15);
INSERT INTO `10001` VALUES (2, '2018-07-04', '19:31:47', NULL, 6, 10);
INSERT INTO `10001` VALUES (3, '2018-07-04', '19:32:05', NULL, 5, 13);
INSERT INTO `10001` VALUES (4, '2018-07-04', '19:32:19', NULL, 15, 14);
INSERT INTO `10001` VALUES (5, '2018-07-04', '19:32:32', NULL, 16, 12);
INSERT INTO `10001` VALUES (6, '2018-07-04', '19:32:44', NULL, 18, 11);
INSERT INTO `10001` VALUES (7, '2018-07-04', '19:32:56', NULL, 20, 9);
INSERT INTO `10001` VALUES (8, '2018-07-04', '19:33:09', NULL, 22, 12);
INSERT INTO `10001` VALUES (9, '2018-07-04', '19:33:21', NULL, 15, 13);

-- ----------------------------
-- Table structure for 10002
-- ----------------------------
DROP TABLE IF EXISTS `10002`;
CREATE TABLE `10002`  (
  `ID` int(100) NOT NULL,
  `测试日期` date NOT NULL,
  `测试时间` time(0) NULL DEFAULT NULL,
  `备注` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `温度` double NULL DEFAULT 0,
  PRIMARY KEY (`ID`, `测试日期`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (to_days(`测试日期`))
PARTITIONS 12
(PARTITION `P0` VALUES LESS THAN (737425) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P1` VALUES LESS THAN (737606) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P2` VALUES LESS THAN (737790) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P3` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P4` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P5` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P6` VALUES LESS THAN (738521) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P7` VALUES LESS THAN (738702) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P8` VALUES LESS THAN (738886) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P9` VALUES LESS THAN (739433) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P10` VALUES LESS THAN (739617) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P11` VALUES LESS THAN (739798) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of 10002
-- ----------------------------
INSERT INTO `10002` VALUES (1, '2018-07-03', '20:48:15', NULL, 13);
INSERT INTO `10002` VALUES (2, '2018-07-04', '20:48:54', NULL, 14);
INSERT INTO `10002` VALUES (3, '2018-07-05', '20:49:11', NULL, 20);
INSERT INTO `10002` VALUES (4, '2018-07-05', '20:49:33', NULL, 21);
INSERT INTO `10002` VALUES (5, '2018-07-05', '20:49:47', NULL, 25);
INSERT INTO `10002` VALUES (6, '2018-07-05', '20:50:03', NULL, 18);
INSERT INTO `10002` VALUES (7, '2018-07-06', '20:50:24', NULL, 19);
INSERT INTO `10002` VALUES (8, '2018-07-05', '20:50:46', NULL, 20);

-- ----------------------------
-- Table structure for 10003
-- ----------------------------
DROP TABLE IF EXISTS `10003`;
CREATE TABLE `10003`  (
  `ID` int(100) NOT NULL,
  `测试日期` date NOT NULL,
  `测试时间` time(0) NULL DEFAULT NULL,
  `备注` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `温度` double NULL DEFAULT 0,
  PRIMARY KEY (`ID`, `测试日期`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (to_days(`测试日期`))
PARTITIONS 12
(PARTITION `P0` VALUES LESS THAN (737425) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P1` VALUES LESS THAN (737606) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P2` VALUES LESS THAN (737790) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P3` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P4` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P5` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P6` VALUES LESS THAN (738521) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P7` VALUES LESS THAN (738702) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P8` VALUES LESS THAN (738886) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P9` VALUES LESS THAN (739433) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P10` VALUES LESS THAN (739617) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P11` VALUES LESS THAN (739798) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of 10003
-- ----------------------------
INSERT INTO `10003` VALUES (1, '2018-07-01', '20:51:09', NULL, 20);
INSERT INTO `10003` VALUES (2, '2018-07-01', '20:51:26', NULL, 25);
INSERT INTO `10003` VALUES (3, '2018-07-02', '20:51:43', NULL, 38);
INSERT INTO `10003` VALUES (4, '2018-07-03', '20:51:59', NULL, 30);
INSERT INTO `10003` VALUES (5, '2018-07-03', '20:52:14', NULL, 29);
INSERT INTO `10003` VALUES (6, '2018-07-04', '20:52:28', NULL, 39);
INSERT INTO `10003` VALUES (7, '2018-07-04', '20:52:42', NULL, 40);
INSERT INTO `10003` VALUES (8, '2018-07-05', '20:52:57', NULL, 62);

-- ----------------------------
-- Table structure for 10004
-- ----------------------------
DROP TABLE IF EXISTS `10004`;
CREATE TABLE `10004`  (
  `ID` int(100) NOT NULL,
  `测试日期` date NOT NULL,
  `测试时间` time(0) NULL DEFAULT NULL,
  `备注` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `温度` double NULL DEFAULT 0,
  `湿度` double NULL DEFAULT 0,
  PRIMARY KEY (`ID`, `测试日期`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (to_days(`测试日期`))
PARTITIONS 12
(PARTITION `P0` VALUES LESS THAN (737425) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P1` VALUES LESS THAN (737606) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P2` VALUES LESS THAN (737790) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P3` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P4` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P5` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P6` VALUES LESS THAN (738521) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P7` VALUES LESS THAN (738702) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P8` VALUES LESS THAN (738886) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P9` VALUES LESS THAN (739433) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P10` VALUES LESS THAN (739617) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P11` VALUES LESS THAN (739798) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of 10004
-- ----------------------------
INSERT INTO `10004` VALUES (1, '2018-07-01', '20:53:21', NULL, 15, 13.7);
INSERT INTO `10004` VALUES (2, '2018-07-01', '20:53:45', NULL, 23, 16.8);
INSERT INTO `10004` VALUES (3, '2018-07-02', '20:54:03', NULL, 28, 12.8);
INSERT INTO `10004` VALUES (4, '2018-07-02', '20:54:32', NULL, 32, 10.9);
INSERT INTO `10004` VALUES (5, '2018-07-02', '20:54:53', NULL, 28, 13.5);
INSERT INTO `10004` VALUES (6, '2018-07-03', '20:55:11', NULL, 25, 16.4);
INSERT INTO `10004` VALUES (7, '2018-07-04', '20:55:29', NULL, 26, 18.6);

-- ----------------------------
-- Table structure for 10005
-- ----------------------------
DROP TABLE IF EXISTS `10005`;
CREATE TABLE `10005`  (
  `ID` int(100) NOT NULL,
  `测试日期` date NOT NULL,
  `测试时间` time(0) NULL DEFAULT NULL,
  `备注` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `温度` double NULL DEFAULT 0,
  PRIMARY KEY (`ID`, `测试日期`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (to_days(`测试日期`))
PARTITIONS 12
(PARTITION `P0` VALUES LESS THAN (737425) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P1` VALUES LESS THAN (737606) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P2` VALUES LESS THAN (737790) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P3` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P4` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P5` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P6` VALUES LESS THAN (738521) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P7` VALUES LESS THAN (738702) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P8` VALUES LESS THAN (738886) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P9` VALUES LESS THAN (739433) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P10` VALUES LESS THAN (739617) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P11` VALUES LESS THAN (739798) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of 10005
-- ----------------------------
INSERT INTO `10005` VALUES (1, '2018-07-01', '20:55:52', NULL, 15);
INSERT INTO `10005` VALUES (2, '2018-07-01', '20:56:17', NULL, 13);
INSERT INTO `10005` VALUES (3, '2018-07-02', '20:56:30', NULL, 13);
INSERT INTO `10005` VALUES (4, '2018-07-02', '20:56:46', NULL, 18);
INSERT INTO `10005` VALUES (5, '2018-07-03', '20:57:01', NULL, 23);
INSERT INTO `10005` VALUES (6, '2018-07-03', '20:57:13', NULL, 25);
INSERT INTO `10005` VALUES (7, '2018-07-04', '20:57:26', NULL, 19);
INSERT INTO `10005` VALUES (8, '2018-07-04', '20:57:39', NULL, 23);
INSERT INTO `10005` VALUES (9, '2018-07-05', '20:57:51', NULL, 36);
INSERT INTO `10005` VALUES (10, '2018-07-05', '20:58:03', NULL, 38);

-- ----------------------------
-- Table structure for 10006
-- ----------------------------
DROP TABLE IF EXISTS `10006`;
CREATE TABLE `10006`  (
  `ID` int(100) NOT NULL,
  `测试日期` date NOT NULL,
  `测试时间` time(0) NULL DEFAULT NULL,
  `备注` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `温度` double NULL DEFAULT 0,
  PRIMARY KEY (`ID`, `测试日期`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (to_days(`测试日期`))
PARTITIONS 12
(PARTITION `P0` VALUES LESS THAN (737425) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P1` VALUES LESS THAN (737606) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P2` VALUES LESS THAN (737790) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P3` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P4` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P5` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P6` VALUES LESS THAN (738521) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P7` VALUES LESS THAN (738702) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P8` VALUES LESS THAN (738886) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P9` VALUES LESS THAN (739433) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P10` VALUES LESS THAN (739617) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P11` VALUES LESS THAN (739798) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of 10006
-- ----------------------------
INSERT INTO `10006` VALUES (1, '2018-07-01', '20:58:29', NULL, 49);
INSERT INTO `10006` VALUES (2, '2018-07-01', '20:58:44', NULL, 52);
INSERT INTO `10006` VALUES (3, '2018-07-02', '20:59:01', NULL, 38);
INSERT INTO `10006` VALUES (4, '2018-07-02', '20:59:17', NULL, 43);
INSERT INTO `10006` VALUES (5, '2018-07-03', '20:59:33', NULL, 49);
INSERT INTO `10006` VALUES (6, '2018-07-03', '20:59:45', NULL, 57);
INSERT INTO `10006` VALUES (7, '2018-07-04', '21:00:00', NULL, 63);
INSERT INTO `10006` VALUES (8, '2018-07-04', '21:00:18', NULL, 46);
INSERT INTO `10006` VALUES (9, '2018-07-05', '21:00:31', NULL, 72);
INSERT INTO `10006` VALUES (10, '2018-07-05', '21:00:44', NULL, 83);

-- ----------------------------
-- Table structure for 10007
-- ----------------------------
DROP TABLE IF EXISTS `10007`;
CREATE TABLE `10007`  (
  `ID` int(100) NOT NULL,
  `测试日期` date NOT NULL,
  `测试时间` time(0) NULL DEFAULT NULL,
  `备注` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `温度` double NULL DEFAULT 0,
  PRIMARY KEY (`ID`, `测试日期`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (to_days(`测试日期`))
PARTITIONS 12
(PARTITION `P0` VALUES LESS THAN (737425) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P1` VALUES LESS THAN (737606) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P2` VALUES LESS THAN (737790) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P3` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P4` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P5` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P6` VALUES LESS THAN (738521) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P7` VALUES LESS THAN (738702) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P8` VALUES LESS THAN (738886) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P9` VALUES LESS THAN (739433) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P10` VALUES LESS THAN (739617) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P11` VALUES LESS THAN (739798) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of 10007
-- ----------------------------
INSERT INTO `10007` VALUES (1, '2018-07-01', '21:01:02', NULL, 16);
INSERT INTO `10007` VALUES (2, '2018-07-01', '21:01:14', NULL, 13);
INSERT INTO `10007` VALUES (3, '2018-07-02', '21:01:25', NULL, 19);
INSERT INTO `10007` VALUES (4, '2018-07-02', '21:01:39', NULL, 23);
INSERT INTO `10007` VALUES (5, '2018-07-03', '21:01:51', NULL, 53);
INSERT INTO `10007` VALUES (6, '2018-07-03', '21:02:08', NULL, 48);
INSERT INTO `10007` VALUES (7, '2018-07-03', '21:02:19', NULL, 63);
INSERT INTO `10007` VALUES (8, '2018-07-04', '21:02:35', NULL, 46);
INSERT INTO `10007` VALUES (9, '2018-07-04', '21:02:47', NULL, 56);
INSERT INTO `10007` VALUES (10, '2018-07-05', '21:02:58', NULL, 28);
INSERT INTO `10007` VALUES (11, '2018-07-05', '21:03:13', NULL, 39);

-- ----------------------------
-- Table structure for 10008
-- ----------------------------
DROP TABLE IF EXISTS `10008`;
CREATE TABLE `10008`  (
  `ID` int(100) NOT NULL,
  `测试日期` date NOT NULL,
  `测试时间` time(0) NULL DEFAULT NULL,
  `备注` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `温度` double NULL DEFAULT 0,
  PRIMARY KEY (`ID`, `测试日期`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (to_days(`测试日期`))
PARTITIONS 12
(PARTITION `P0` VALUES LESS THAN (737425) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P1` VALUES LESS THAN (737606) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P2` VALUES LESS THAN (737790) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P3` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P4` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P5` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P6` VALUES LESS THAN (738521) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P7` VALUES LESS THAN (738702) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P8` VALUES LESS THAN (738886) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P9` VALUES LESS THAN (739433) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P10` VALUES LESS THAN (739617) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P11` VALUES LESS THAN (739798) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of 10008
-- ----------------------------
INSERT INTO `10008` VALUES (1, '2018-07-01', '21:03:30', NULL, 36);
INSERT INTO `10008` VALUES (2, '2018-07-02', '21:03:42', NULL, 39);
INSERT INTO `10008` VALUES (3, '2018-07-03', '21:03:52', NULL, 45);
INSERT INTO `10008` VALUES (4, '2018-07-04', '21:04:05', NULL, 38);
INSERT INTO `10008` VALUES (5, '2018-07-05', '21:04:20', NULL, 42);

-- ----------------------------
-- Table structure for 10009
-- ----------------------------
DROP TABLE IF EXISTS `10009`;
CREATE TABLE `10009`  (
  `ID` int(100) NOT NULL,
  `测试日期` date NOT NULL,
  `测试时间` time(0) NULL DEFAULT NULL,
  `备注` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `温度` double NULL DEFAULT 0,
  PRIMARY KEY (`ID`, `测试日期`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (to_days(`测试日期`))
PARTITIONS 12
(PARTITION `P0` VALUES LESS THAN (737425) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P1` VALUES LESS THAN (737606) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P2` VALUES LESS THAN (737790) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P3` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P4` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P5` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P6` VALUES LESS THAN (738521) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P7` VALUES LESS THAN (738702) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P8` VALUES LESS THAN (738886) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P9` VALUES LESS THAN (739433) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P10` VALUES LESS THAN (739617) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `P11` VALUES LESS THAN (739798) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of 10009
-- ----------------------------
INSERT INTO `10009` VALUES (1, '2018-07-01', '21:04:35', NULL, 13);
INSERT INTO `10009` VALUES (2, '2018-07-02', '21:04:46', NULL, 35);
INSERT INTO `10009` VALUES (3, '2018-07-03', '21:05:00', NULL, 28);
INSERT INTO `10009` VALUES (4, '2018-07-04', '21:05:13', NULL, 39);
INSERT INTO `10009` VALUES (5, '2018-07-05', '21:05:25', NULL, 46);

-- ----------------------------
-- Table structure for 咨询专家表
-- ----------------------------
DROP TABLE IF EXISTS `咨询专家表`;
CREATE TABLE `咨询专家表`  (
  `咨询编号` int(255) NOT NULL AUTO_INCREMENT,
  `专家名` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `机组编号` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `状态` int(255) NULL DEFAULT 0,
  `提交时间` datetime(6) NULL DEFAULT NULL,
  `完成时间` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`咨询编号`) USING BTREE,
  INDEX `咨询专家表_ibfk_1`(`专家名`) USING BTREE,
  INDEX `aaa`(`机组编号`) USING BTREE,
  CONSTRAINT `aaa` FOREIGN KEY (`机组编号`) REFERENCES `机组表` (`机组编号`) ON DELETE NO ACTION ON UPDATE RESTRICT,
  CONSTRAINT `咨询专家表_ibfk_1` FOREIGN KEY (`专家名`) REFERENCES `用户表` (`用户名`) ON DELETE NO ACTION ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 咨询专家表
-- ----------------------------
INSERT INTO `咨询专家表` VALUES (21, 'lisi', '10001', 0, '2018-07-10 12:58:53.000000', NULL);
INSERT INTO `咨询专家表` VALUES (22, 'lisi', '10002', 0, '2018-07-10 12:59:06.000000', NULL);
INSERT INTO `咨询专家表` VALUES (23, 'lisi', '10005', 0, '2018-07-10 12:59:10.000000', NULL);
INSERT INTO `咨询专家表` VALUES (24, 'lisi', '10008', 0, '2018-07-10 12:59:14.000000', NULL);
INSERT INTO `咨询专家表` VALUES (25, 'lisi', '10007', 0, '2018-07-10 12:59:31.000000', NULL);

-- ----------------------------
-- Table structure for 工厂表
-- ----------------------------
DROP TABLE IF EXISTS `工厂表`;
CREATE TABLE `工厂表`  (
  `工厂名称` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `工厂地址` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `工厂邮编` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `工厂介绍` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `工厂电话` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `工厂电子邮箱` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `集团名称` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `工厂经纬度` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`工厂名称`) USING BTREE,
  INDEX `集团分工厂`(`集团名称`) USING BTREE,
  INDEX `工厂名称`(`工厂名称`, `集团名称`) USING BTREE,
  INDEX `集团名称`(`集团名称`, `工厂名称`) USING BTREE,
  CONSTRAINT `集团分工厂` FOREIGN KEY (`集团名称`) REFERENCES `集团表` (`集团名称`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 工厂表
-- ----------------------------
INSERT INTO `工厂表` VALUES ('工厂A1', '湖北武汉', '434023', '', '11546467482', '11546467482@163.com', '集团A', '112,255');
INSERT INTO `工厂表` VALUES ('工厂A2', '湖北荆州', '', '', '15163354899', '15163354899@qq.com', '集团A', '');
INSERT INTO `工厂表` VALUES ('工厂A3', '湖北荆州', '', '', '45435153153', '45435153153@163.com', '集团A', '');
INSERT INTO `工厂表` VALUES ('工厂B1', '湖北荆州', '', '', '14985456464', '14985456464@163.com', '集团B', '');

-- ----------------------------
-- Table structure for 文档库
-- ----------------------------
DROP TABLE IF EXISTS `文档库`;
CREATE TABLE `文档库`  (
  `文档编号` int(11) NOT NULL AUTO_INCREMENT,
  `机组编号` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `文档名` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `上传时间` datetime(0) NULL DEFAULT NULL,
  `备注` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `类型` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`文档编号`) USING BTREE,
  INDEX `机组编号`(`机组编号`) USING BTREE,
  CONSTRAINT `文档库_ibfk_1` FOREIGN KEY (`机组编号`) REFERENCES `机组表` (`机组编号`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 机组表
-- ----------------------------
DROP TABLE IF EXISTS `机组表`;
CREATE TABLE `机组表`  (
  `机组编号` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `机组名称` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `机组描述` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `集团名称` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `工厂名称` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `负责人` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `机组经纬度` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `状态` int(255) NULL DEFAULT 1,
  PRIMARY KEY (`机组编号`) USING BTREE,
  INDEX `机组所属`(`负责人`) USING BTREE,
  INDEX `a`(`工厂名称`) USING BTREE,
  INDEX `集团名称`(`集团名称`, `工厂名称`, `负责人`) USING BTREE,
  CONSTRAINT `3` FOREIGN KEY (`集团名称`, `工厂名称`) REFERENCES `工厂表` (`集团名称`, `工厂名称`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `机组表_ibfk_1` FOREIGN KEY (`负责人`) REFERENCES `用户表` (`用户名`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 机组表
-- ----------------------------
INSERT INTO `机组表` VALUES ('10001', '机组A10001', '', '集团A', '工厂A1', 'ls', '', 2);
INSERT INTO `机组表` VALUES ('10002', '机组A10002', '', '集团A', '工厂A1', 'jack', '', 1);
INSERT INTO `机组表` VALUES ('10003', '机组A10003', '', '集团A', '工厂A1', 'jack', '', 2);
INSERT INTO `机组表` VALUES ('10004', '机组B10001', '', '集团B', '工厂B1', 'admin', '', 1);
INSERT INTO `机组表` VALUES ('10005', '机组A10004', '', '集团A', '工厂A2', 'jgx', '', 3);
INSERT INTO `机组表` VALUES ('10006', '机组B10001', '', '集团B', '工厂B1', 'ls', '', 1);
INSERT INTO `机组表` VALUES ('10007', '机组B10002', '', '集团B', '工厂B1', 'jgx', '', 1);
INSERT INTO `机组表` VALUES ('10008', '机组A10005', '', '集团A', '工厂A3', 'zl', '', 1);
INSERT INTO `机组表` VALUES ('10009', '机组B10003', '', '集团B', '工厂B1', 'caocao', '', 1);

-- ----------------------------
-- Table structure for 测点表
-- ----------------------------
DROP TABLE IF EXISTS `测点表`;
CREATE TABLE `测点表`  (
  `测点编号` int(10) NOT NULL AUTO_INCREMENT,
  `机组编号` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `测点名称` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `测点描述` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`测点编号`) USING BTREE,
  INDEX `机组编号`(`机组编号`) USING BTREE,
  CONSTRAINT `测点表_ibfk_1` FOREIGN KEY (`机组编号`) REFERENCES `机组表` (`机组编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 测点表
-- ----------------------------
INSERT INTO `测点表` VALUES (1, '10001', '温度', '');
INSERT INTO `测点表` VALUES (2, '10001', '湿度', '');
INSERT INTO `测点表` VALUES (3, '10002', '温度', '');
INSERT INTO `测点表` VALUES (4, '10003', '温度', '');
INSERT INTO `测点表` VALUES (5, '10004', '温度', '');
INSERT INTO `测点表` VALUES (6, '10005', '温度', '');
INSERT INTO `测点表` VALUES (7, '10006', '温度', '');
INSERT INTO `测点表` VALUES (8, '10007', '温度', '');
INSERT INTO `测点表` VALUES (9, '10008', '温度', '');
INSERT INTO `测点表` VALUES (10, '10009', '温度', '');
INSERT INTO `测点表` VALUES (11, '10004', '湿度', '');

-- ----------------------------
-- Table structure for 用户表
-- ----------------------------
DROP TABLE IF EXISTS `用户表`;
CREATE TABLE `用户表`  (
  `用户编号` int(11) NOT NULL AUTO_INCREMENT,
  `用户名` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `密码` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `电子邮箱` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `电话号码` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `工厂名称` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `集团名称` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `角色名称` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `备注` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`用户编号`) USING BTREE,
  INDEX `用户单位`(`工厂名称`, `集团名称`) USING BTREE,
  INDEX `用户角色`(`角色名称`) USING BTREE,
  INDEX `用户名`(`用户名`) USING BTREE,
  INDEX `用户名_2`(`用户名`, `工厂名称`, `集团名称`) USING BTREE,
  INDEX `用户名_3`(`用户名`, `工厂名称`) USING BTREE,
  INDEX `工厂名称`(`工厂名称`, `用户名`, `集团名称`) USING BTREE,
  INDEX `工厂名称_2`(`工厂名称`, `用户名`) USING BTREE,
  INDEX `工厂名称_3`(`工厂名称`) USING BTREE,
  INDEX `集团名称`(`集团名称`) USING BTREE,
  INDEX `集团名称_2`(`集团名称`, `工厂名称`, `用户名`) USING BTREE,
  CONSTRAINT `用户角色` FOREIGN KEY (`角色名称`) REFERENCES `角色表` (`角色名称`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10011 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 用户表
-- ----------------------------
INSERT INTO `用户表` VALUES (10001, 'admin', '123', '18163132129@163.com', '18163132129', '', '', '管理员', '');
INSERT INTO `用户表` VALUES (10002, 'jack', '123', '18163132129@163.com', '18163132129', '', '集团A', '集团负责人', '');
INSERT INTO `用户表` VALUES (10003, 'jgx', '123', '18133443313@163.com', '18133443313', '工厂A2', '集团A', '工厂负责人', '');
INSERT INTO `用户表` VALUES (10004, 'lisi', '123', '11815446686@163.com', '11815446686', '', '', '专家', '');
INSERT INTO `用户表` VALUES (10005, 'ls', '123', '18163132129@163.com', '18163132129', '工厂A1', '集团A', '专家', '');
INSERT INTO `用户表` VALUES (10006, 'zl', '123', '18163132129@163.com', '18163132129', '工厂A1', '集团A', '机组人员', '');
INSERT INTO `用户表` VALUES (10007, 'caocao', '123', '18163132129@163.com', '18163132129', '工厂B1', '集团B', '机组人员', '');
INSERT INTO `用户表` VALUES (10008, 'zhaoliu', '123', '18163132129@163.com', '18163132129', '', '集团B', '集团负责人', '');
INSERT INTO `用户表` VALUES (10009, 'wangwu', '123', '18163132129@163.com', '18163132129', '工厂A3', '集团A', '工厂负责人', '');
INSERT INTO `用户表` VALUES (10010, 'zhangsan', '123', '18163132129@163.com', '18163132129', '工厂B1', '集团B', '工厂负责人', '');

-- ----------------------------
-- Table structure for 菜单表
-- ----------------------------
DROP TABLE IF EXISTS `菜单表`;
CREATE TABLE `菜单表`  (
  `菜单号` int(10) NOT NULL AUTO_INCREMENT,
  `菜单名称` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `父菜单号` int(11) NULL DEFAULT NULL,
  `菜单序号` int(11) NULL DEFAULT NULL,
  `菜单描述` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `URL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `菜单图标` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `菜单等级` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`菜单号`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 菜单表
-- ----------------------------
INSERT INTO `菜单表` VALUES (1, '用户管理', NULL, NULL, NULL, '/User/Show.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (2, '集团管理', NULL, NULL, NULL, '/JT/Show.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (3, '工厂管理', NULL, NULL, NULL, '/GC/Show.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (4, '机组管理', NULL, NULL, NULL, '/JZ/Show.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (5, '测点管理', NULL, NULL, NULL, '/CD/Show.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (6, '文档管理', NULL, NULL, NULL, '/File/Show.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (7, '机组A10002', NULL, NULL, NULL, '/JZ/Index.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (8, '工厂A1', NULL, NULL, NULL, '/GC/Index.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (9, '集团A', NULL, NULL, NULL, '/JT/Index.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (10, '工厂A2', NULL, NULL, '', '/GC/Index.html', '', NULL);
INSERT INTO `菜单表` VALUES (17, '机组A10003', NULL, NULL, NULL, '/JZ/Index.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (18, '工厂A3', NULL, NULL, NULL, '/GC/Index.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (19, '集团B', NULL, NULL, NULL, '/JT/Index.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (20, '工厂B1', NULL, NULL, NULL, '/GC/Index.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (21, '机组B10001', NULL, NULL, NULL, '/JZ/Index.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (22, '机组A10004', NULL, NULL, NULL, '/JZ/Index.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (23, '机组A10001', NULL, NULL, NULL, '/JZ/Index.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (24, '咨询管理', NULL, NULL, NULL, '/ZX/Show.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (26, '机组B10002', NULL, NULL, NULL, '/JZ/Index.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (27, '机组A10005', NULL, NULL, NULL, '/JZ/Index.html', NULL, NULL);
INSERT INTO `菜单表` VALUES (28, '机组B10003', NULL, NULL, NULL, '/JZ/Index.html', NULL, NULL);

-- ----------------------------
-- Table structure for 角色表
-- ----------------------------
DROP TABLE IF EXISTS `角色表`;
CREATE TABLE `角色表`  (
  `角色名称` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `角色描述` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`角色名称`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 角色表
-- ----------------------------
INSERT INTO `角色表` VALUES ('专家', NULL);
INSERT INTO `角色表` VALUES ('工厂负责人', NULL);
INSERT INTO `角色表` VALUES ('机组人员', NULL);
INSERT INTO `角色表` VALUES ('管理员', NULL);
INSERT INTO `角色表` VALUES ('集团负责人', NULL);

-- ----------------------------
-- Table structure for 集团表
-- ----------------------------
DROP TABLE IF EXISTS `集团表`;
CREATE TABLE `集团表`  (
  `集团名称` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `集团地址` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `集团邮编` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `集团介绍` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `集团电话` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `集团电子邮箱` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `集团经纬度` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`集团名称`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 集团表
-- ----------------------------
INSERT INTO `集团表` VALUES ('集团A', '湖北荆州', '434023', '', '18163132466', '18163132466@163.com', '11,144');
INSERT INTO `集团表` VALUES ('集团B', '湖北武汉', '', '', '18163135869', '18163135869@163.com', '');

-- ----------------------------
-- View structure for menue
-- ----------------------------
DROP VIEW IF EXISTS `menue`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `menue` AS select `集团表`.`集团名称` AS `集团名称`,`工厂表`.`工厂名称` AS `工厂名称`,`用户表`.`用户名` AS `用户名`,`机组表`.`机组名称` AS `机组名称` from (((`集团表` left join `工厂表` on((`工厂表`.`集团名称` = `集团表`.`集团名称`))) left join `用户表` on(((`用户表`.`工厂名称` = `工厂表`.`工厂名称`) and (`用户表`.`集团名称` = `工厂表`.`集团名称`)))) left join `机组表` on(((`机组表`.`集团名称` = `用户表`.`集团名称`) and (`机组表`.`工厂名称` = `用户表`.`工厂名称`) and (`机组表`.`负责人` = `用户表`.`用户名`)))) order by `集团表`.`集团名称`,`工厂表`.`工厂名称`,`用户表`.`用户名`,`机组表`.`机组名称`;

-- ----------------------------
-- View structure for 工作机组数
-- ----------------------------
DROP VIEW IF EXISTS `工作机组数`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `工作机组数` AS select `机组表`.`集团名称` AS `集团名称`,`机组表`.`工厂名称` AS `工厂名称`,count(`机组表`.`机组名称`) AS `工作机组数` from `机组表` where (`机组表`.`状态` <> 0) group by `机组表`.`工厂名称`;

-- ----------------------------
-- View structure for 总机组数
-- ----------------------------
DROP VIEW IF EXISTS `总机组数`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `总机组数` AS select `机组表`.`集团名称` AS `集团名称`,`机组表`.`工厂名称` AS `工厂名称`,count(`机组表`.`机组名称`) AS `总机组数` from `机组表` group by `机组表`.`工厂名称`;

-- ----------------------------
-- View structure for 报警故障机组数
-- ----------------------------
DROP VIEW IF EXISTS `报警故障机组数`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `报警故障机组数` AS select `机组表`.`集团名称` AS `集团名称`,`机组表`.`工厂名称` AS `工厂名称`,count(`机组表`.`机组名称`) AS `报警故障机组数` from `机组表` where ((`机组表`.`状态` = 2) or (`机组表`.`状态` = 3)) group by `机组表`.`工厂名称`;

-- ----------------------------
-- View structure for 机组状态一览表
-- ----------------------------
DROP VIEW IF EXISTS `机组状态一览表`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `机组状态一览表` AS select `总机组数`.`集团名称` AS `集团名称`,`总机组数`.`工厂名称` AS `工厂名称`,`总机组数`.`总机组数` AS `总机组数`,coalesce(`工作机组数`.`工作机组数`,0) AS `工作机组数`,coalesce(`报警故障机组数`.`报警故障机组数`,0) AS `报警故障机组数`,(`总机组数`.`总机组数` - coalesce(`工作机组数`.`工作机组数`,0)) AS `停机数` from ((`总机组数` left join `工作机组数` on((`总机组数`.`工厂名称` = `工作机组数`.`工厂名称`))) left join `报警故障机组数` on((`总机组数`.`工厂名称` = `报警故障机组数`.`工厂名称`)));

-- ----------------------------
-- Triggers structure for table 工厂表
-- ----------------------------
DROP TRIGGER IF EXISTS `t1`;
delimiter ;;
CREATE TRIGGER `t1` AFTER INSERT ON `工厂表` FOR EACH ROW BEGIN
INSERT INTO `web`.`菜单表`(`菜单名称`, `URL`) VALUES (NEW.`工厂名称`, '/GC/Index.html');
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table 工厂表
-- ----------------------------
DROP TRIGGER IF EXISTS `t4`;
delimiter ;;
CREATE TRIGGER `t4` AFTER UPDATE ON `工厂表` FOR EACH ROW BEGIN
DECLARE menuid int default 0;
SELECT `菜单号` into @menuid FROM `web`.`菜单表` WHERE `菜单名称` = OLD.`工厂名称`;
UPDATE `web`.`菜单表` SET `菜单名称` = NEW.`工厂名称` WHERE `菜单号` = @menuid;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table 工厂表
-- ----------------------------
DROP TRIGGER IF EXISTS `t7`;
delimiter ;;
CREATE TRIGGER `t7` AFTER DELETE ON `工厂表` FOR EACH ROW BEGIN
DELETE FROM `web`.`菜单表` WHERE `菜单名称` = OLD.`工厂名称`;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table 机组表
-- ----------------------------
DROP TRIGGER IF EXISTS `t3`;
delimiter ;;
CREATE TRIGGER `t3` AFTER INSERT ON `机组表` FOR EACH ROW BEGIN
INSERT INTO `web`.`菜单表`(`菜单名称`, `URL`) VALUES (NEW.`机组名称`, '/JZ/Index.html');
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table 机组表
-- ----------------------------
DROP TRIGGER IF EXISTS `t6`;
delimiter ;;
CREATE TRIGGER `t6` AFTER UPDATE ON `机组表` FOR EACH ROW BEGIN
DECLARE menuid int default 0;
SELECT `菜单号` into @menuid FROM `web`.`菜单表` WHERE `菜单名称` = OLD.`机组名称`;
UPDATE `web`.`菜单表` SET `菜单名称` = NEW.`机组名称` WHERE `菜单号` = @menuid;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table 机组表
-- ----------------------------
DROP TRIGGER IF EXISTS `t9`;
delimiter ;;
CREATE TRIGGER `t9` AFTER DELETE ON `机组表` FOR EACH ROW BEGIN
DELETE FROM `web`.`菜单表` WHERE `菜单名称` = OLD.`机组名称`;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table 集团表
-- ----------------------------
DROP TRIGGER IF EXISTS `t2`;
delimiter ;;
CREATE TRIGGER `t2` AFTER INSERT ON `集团表` FOR EACH ROW BEGIN
INSERT INTO `web`.`菜单表`(`菜单名称`, `URL`) VALUES (NEW.`集团名称`, '/JT/Index.html');
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table 集团表
-- ----------------------------
DROP TRIGGER IF EXISTS `t5`;
delimiter ;;
CREATE TRIGGER `t5` AFTER UPDATE ON `集团表` FOR EACH ROW BEGIN
DECLARE menuid int default 0;
SELECT `菜单号` into @menuid FROM `web`.`菜单表` WHERE `菜单名称` = OLD.`集团名称`;
UPDATE `web`.`菜单表` SET `菜单名称` = NEW.`集团名称` WHERE `菜单号` = @menuid;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table 集团表
-- ----------------------------
DROP TRIGGER IF EXISTS `t8`;
delimiter ;;
CREATE TRIGGER `t8` AFTER DELETE ON `集团表` FOR EACH ROW BEGIN
DELETE FROM `web`.`菜单表` WHERE `菜单名称` = OLD.`集团名称`;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
