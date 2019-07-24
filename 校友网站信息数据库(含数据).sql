/*
 Navicat Premium Data Transfer

 Source Server         : mysql8
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3307
 Source Schema         : 校友网站信息数据库

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 11/07/2019 18:23:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 个人捐赠
-- ----------------------------
DROP TABLE IF EXISTS `个人捐赠`;
CREATE TABLE `个人捐赠`  (
  `捐赠物` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `捐赠日期` date NOT NULL,
  `捐赠校友学号` int(10) NOT NULL,
  PRIMARY KEY (`捐赠物`, `捐赠日期`, `捐赠校友学号`) USING BTREE,
  INDEX `捐赠人`(`捐赠校友学号`) USING BTREE,
  CONSTRAINT `捐赠人` FOREIGN KEY (`捐赠校友学号`) REFERENCES `校友` (`学号`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `记录` FOREIGN KEY (`捐赠物`, `捐赠日期`) REFERENCES `捐赠记录` (`捐赠物`, `捐赠日期`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 个人捐赠
-- ----------------------------
INSERT INTO `个人捐赠` VALUES ('实验仪器3台', '2019-07-06', 1211314);
INSERT INTO `个人捐赠` VALUES (' 台式机5台', '2019-07-08', 1304567);
INSERT INTO `个人捐赠` VALUES ('书籍500本', '2019-07-09', 1312589);
INSERT INTO `个人捐赠` VALUES ('实验仪器5台', '2019-07-10', 1316789);

-- ----------------------------
-- Table structure for 会长
-- ----------------------------
DROP TABLE IF EXISTS `会长`;
CREATE TABLE `会长`  (
  `姓名` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `地址` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `联系方式` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`姓名`, `地址`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 会长
-- ----------------------------
INSERT INTO `会长` VALUES ('张成', '四川', '162985897@qq.com');
INSERT INTO `会长` VALUES ('李一', '山东', '168266556@qq.com');
INSERT INTO `会长` VALUES ('李蕊', '上海', '136889926@qq.com');
INSERT INTO `会长` VALUES ('董欣', '重庆', '258963258@qq.com');
INSERT INTO `会长` VALUES ('赵进', '青海', '271839292@qq.com');
INSERT INTO `会长` VALUES ('颜梦', '湖南', '123456789@qq.com');

-- ----------------------------
-- Table structure for 学生
-- ----------------------------
DROP TABLE IF EXISTS `学生`;
CREATE TABLE `学生`  (
  `学号` int(10) NOT NULL,
  `密码` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `姓名` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `院系` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `入读年份` int(4) NULL DEFAULT NULL,
  `邮箱` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`学号`) USING BTREE,
  INDEX `密码`(`密码`, `姓名`, `院系`, `入读年份`, `邮箱`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 学生
-- ----------------------------
INSERT INTO `学生` VALUES (1304567, '123456', '孙艺', '哲学', 2013, '7023054@qq.com');
INSERT INTO `学生` VALUES (1324567, '123456', '张可', ' 数学 ', 2013, '1124465@qq.com');
INSERT INTO `学生` VALUES (1810000, '123456', '张航', '计算机', 2018, '1234567@qq.com');
INSERT INTO `学生` VALUES (1320768, '123456', '李一', '金融', 2013, '1561564@qq.com');
INSERT INTO `学生` VALUES (1211314, '123456', '李晓', '金融', 2012, '2345678@qq.com');
INSERT INTO `学生` VALUES (1825678, '123456', '李青', '政治', 2018, '5481465@qq.com');
INSERT INTO `学生` VALUES (1316789, '123456', '王晓', '化学', 2013, '3456789@qq.com');
INSERT INTO `学生` VALUES (1832545, '123456', '萧炎', '材料', 2018, '2340451@qq.com');
INSERT INTO `学生` VALUES (1312589, '123456', '赵信', '数学', 2013, '1568756@qq.com');

-- ----------------------------
-- Table structure for 捐赠新闻
-- ----------------------------
DROP TABLE IF EXISTS `捐赠新闻`;
CREATE TABLE `捐赠新闻`  (
  `新闻标题` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `新闻日期` date NOT NULL,
  `捐赠物` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `捐赠日期` date NOT NULL,
  PRIMARY KEY (`捐赠物`, `新闻标题`, `捐赠日期`, `新闻日期`) USING BTREE,
  INDEX `捐赠`(`捐赠物`, `捐赠日期`) USING BTREE,
  INDEX `新闻`(`新闻标题`, `新闻日期`) USING BTREE,
  CONSTRAINT `捐赠` FOREIGN KEY (`捐赠物`, `捐赠日期`) REFERENCES `捐赠记录` (`捐赠物`, `捐赠日期`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `新闻` FOREIGN KEY (`新闻标题`, `新闻日期`) REFERENCES `新闻` (`标题`, `时间`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 捐赠新闻
-- ----------------------------
INSERT INTO `捐赠新闻` VALUES ('校友捐赠', '2019-07-08', ' 台式机5台', '2019-07-08');
INSERT INTO `捐赠新闻` VALUES ('四川校友会捐赠仪式', '2019-07-01', '书籍1000本', '2019-07-01');
INSERT INTO `捐赠新闻` VALUES ('青海校友会捐赠仪式', '2019-07-03', '书籍1000本', '2019-07-03');
INSERT INTO `捐赠新闻` VALUES ('校友捐赠', '2019-07-09', '书籍500本', '2019-07-09');
INSERT INTO `捐赠新闻` VALUES ('校友捐赠', '2019-07-06', '实验仪器3台', '2019-07-06');
INSERT INTO `捐赠新闻` VALUES ('校友捐赠', '2019-07-10', '实验仪器5台', '2019-07-10');

-- ----------------------------
-- Table structure for 捐赠记录
-- ----------------------------
DROP TABLE IF EXISTS `捐赠记录`;
CREATE TABLE `捐赠记录`  (
  `捐赠物` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `捐赠日期` date NOT NULL,
  PRIMARY KEY (`捐赠物`, `捐赠日期`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 捐赠记录
-- ----------------------------
INSERT INTO `捐赠记录` VALUES (' 台式机5台', '2019-07-08');
INSERT INTO `捐赠记录` VALUES ('书籍1000本', '2019-07-01');
INSERT INTO `捐赠记录` VALUES ('书籍1000本', '2019-07-03');
INSERT INTO `捐赠记录` VALUES ('书籍500本', '2019-07-09');
INSERT INTO `捐赠记录` VALUES ('实验仪器3台', '2019-07-06');
INSERT INTO `捐赠记录` VALUES ('实验仪器5台', '2019-07-10');

-- ----------------------------
-- Table structure for 新闻
-- ----------------------------
DROP TABLE IF EXISTS `新闻`;
CREATE TABLE `新闻`  (
  `标题` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `时间` date NOT NULL,
  `内容` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `发布校会名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `发布校会地区` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`标题`, `时间`) USING BTREE,
  INDEX `标题`(`标题`) USING BTREE,
  INDEX `发布`(`发布校会名称`, `发布校会地区`) USING BTREE,
  CONSTRAINT `发布` FOREIGN KEY (`发布校会名称`, `发布校会地区`) REFERENCES `校友会` (`名称`, `地区`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 新闻
-- ----------------------------
INSERT INTO `新闻` VALUES ('上海校友采访', '2019-07-02', '采访杰出校友张可', '上海校友会', '上海');
INSERT INTO `新闻` VALUES ('四川校友会捐赠仪式', '2019-07-01', '四川校友会捐赠书籍1000本', '四川校友会', '四川');
INSERT INTO `新闻` VALUES ('山东校友采访', '2019-07-05', '采访杰出校友王晓', '山东校友会', '山东');
INSERT INTO `新闻` VALUES ('校友捐赠', '2019-07-06', '校友李晓捐赠实验仪器3台', '重庆校友会', '重庆');
INSERT INTO `新闻` VALUES ('校友捐赠', '2019-07-08', '校友孙艺捐赠台式机5台', '青海校友会', '青海');
INSERT INTO `新闻` VALUES ('校友捐赠', '2019-07-09', '校友赵信捐赠书籍500本', '湖南校友会', '湖南');
INSERT INTO `新闻` VALUES ('校友捐赠', '2019-07-10', '校友王晓捐赠实验仪器5台', '山东校友会', '山东');
INSERT INTO `新闻` VALUES ('百年校庆倒计时100天', '2019-07-11', '为迎接百年校庆做好准备', '山东校友会', '山东');
INSERT INTO `新闻` VALUES ('重庆校友采访', '2019-07-11', '采访杰出校友李晓', '重庆校友会', '重庆');
INSERT INTO `新闻` VALUES ('青海校友会捐赠仪式', '2019-07-03', '青海校友会捐赠书籍1000本', '青海校友会', '青海');

-- ----------------------------
-- Table structure for 校会捐赠
-- ----------------------------
DROP TABLE IF EXISTS `校会捐赠`;
CREATE TABLE `校会捐赠`  (
  `捐赠物` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `捐赠日期` date NOT NULL,
  `捐赠校会名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `捐赠校会地区` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`捐赠物`, `捐赠日期`, `捐赠校会名称`, `捐赠校会地区`) USING BTREE,
  INDEX `捐赠校会信息`(`捐赠校会名称`, `捐赠校会地区`) USING BTREE,
  CONSTRAINT `捐赠校会信息` FOREIGN KEY (`捐赠校会名称`, `捐赠校会地区`) REFERENCES `校友会` (`名称`, `地区`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `捐赠记录` FOREIGN KEY (`捐赠物`, `捐赠日期`) REFERENCES `捐赠记录` (`捐赠物`, `捐赠日期`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 校会捐赠
-- ----------------------------
INSERT INTO `校会捐赠` VALUES ('书籍1000本', '2019-07-01', '四川校友会', '四川');
INSERT INTO `校会捐赠` VALUES ('书籍1000本', '2019-07-03', '青海校友会', '青海');

-- ----------------------------
-- Table structure for 校友
-- ----------------------------
DROP TABLE IF EXISTS `校友`;
CREATE TABLE `校友`  (
  `学号` int(10) NOT NULL,
  `密码` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `姓名` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `院系` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `入读年份` int(4) NULL DEFAULT NULL,
  `邮箱` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `电话` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `地址` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `工作单位` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `所属校友会名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `所属校友会地区` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`学号`) USING BTREE,
  INDEX `子类属性`(`密码`, `姓名`, `院系`, `入读年份`, `邮箱`) USING BTREE,
  INDEX `属于`(`所属校友会名称`, `所属校友会地区`) USING BTREE,
  CONSTRAINT `子类` FOREIGN KEY (`学号`) REFERENCES `学生` (`学号`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `子类属性` FOREIGN KEY (`密码`, `姓名`, `院系`, `入读年份`, `邮箱`) REFERENCES `学生` (`密码`, `姓名`, `院系`, `入读年份`, `邮箱`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `属于` FOREIGN KEY (`所属校友会名称`, `所属校友会地区`) REFERENCES `校友会` (`名称`, `地区`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 校友
-- ----------------------------
INSERT INTO `校友` VALUES (1211314, '123456', '李晓', '金融', 2012, '2345678@qq.com', '15111110110', '重庆', '重庆', '重庆校友会', '重庆');
INSERT INTO `校友` VALUES (1304567, '123456', '孙艺', '哲学', 2013, '7023054@qq.com', '15000000000', '青海', '青海', '青海校友会', '青海');
INSERT INTO `校友` VALUES (1312589, '123456', '赵信', '数学', 2013, '1568756@qq.com', '17802010134', '湖南', '湖南', '湖南校友会', '湖南');
INSERT INTO `校友` VALUES (1316789, '123456', '王晓', '化学', 2013, '3456789@qq.com', '13566898978', '山东', '山东', '山东校友会', '山东');
INSERT INTO `校友` VALUES (1320768, '123456', '李一', '金融', 2013, '1561564@qq.com', '15205848894', '四川', '四川', '四川校友会', '四川');
INSERT INTO `校友` VALUES (1324567, '123456', '张可', ' 数学 ', 2013, '1124465@qq.com', '12336445654', '上海', '上海', '上海校友会', '上海');

-- ----------------------------
-- Table structure for 校友会
-- ----------------------------
DROP TABLE IF EXISTS `校友会`;
CREATE TABLE `校友会`  (
  `名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `地区` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `校友会联系方式` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `人数` int(10) NOT NULL DEFAULT 0,
  `会长姓名` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `会长地址` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`名称`, `地区`) USING BTREE,
  UNIQUE INDEX `会长姓名`(`会长姓名`, `会长地址`) USING BTREE,
  CONSTRAINT `管理` FOREIGN KEY (`会长姓名`, `会长地址`) REFERENCES `会长` (`姓名`, `地址`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 校友会
-- ----------------------------
INSERT INTO `校友会` VALUES ('上海校友会', '上海', 'maxin5863@163.com', 100, '李蕊', '上海');
INSERT INTO `校友会` VALUES ('四川校友会', '四川', '13608197190', 100, '张成', '四川');
INSERT INTO `校友会` VALUES ('山东校友会', '山东', '301804987', 136, '李一', '山东');
INSERT INTO `校友会` VALUES ('湖南校友会', '湖南', '1055725111@qq.com', 201, '颜梦', '湖南');
INSERT INTO `校友会` VALUES ('重庆校友会', '重庆', '90050566', 151, '董欣', '重庆');
INSERT INTO `校友会` VALUES ('青海校友会', '青海', 'zhaoyong99@sina.com', 202, '赵进', '青海');

-- ----------------------------
-- Table structure for 采访
-- ----------------------------
DROP TABLE IF EXISTS `采访`;
CREATE TABLE `采访`  (
  `标题` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `时间` date NOT NULL,
  `采访单位` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `采访记者` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`标题`, `时间`) USING BTREE,
  CONSTRAINT `新闻子类` FOREIGN KEY (`标题`, `时间`) REFERENCES `新闻` (`标题`, `时间`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 采访
-- ----------------------------
INSERT INTO `采访` VALUES ('上海校友采访', '2019-07-02', '校组织部', '知一');
INSERT INTO `采访` VALUES ('山东校友采访', '2019-07-05', '校组织部', '知一');
INSERT INTO `采访` VALUES ('重庆校友采访', '2019-07-11', '校组织部', '知一');

-- ----------------------------
-- Table structure for 采访记录
-- ----------------------------
DROP TABLE IF EXISTS `采访记录`;
CREATE TABLE `采访记录`  (
  `被采访校友学号` int(10) NOT NULL,
  `采访文章标题` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `采访日期` date NOT NULL,
  PRIMARY KEY (`被采访校友学号`, `采访文章标题`, `采访日期`) USING BTREE,
  INDEX `采访记录`(`采访文章标题`, `采访日期`) USING BTREE,
  CONSTRAINT `被采访` FOREIGN KEY (`被采访校友学号`) REFERENCES `校友` (`学号`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `采访记录` FOREIGN KEY (`采访文章标题`, `采访日期`) REFERENCES `采访` (`标题`, `时间`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 采访记录
-- ----------------------------
INSERT INTO `采访记录` VALUES (1324567, '上海校友采访', '2019-07-02');
INSERT INTO `采访记录` VALUES (1316789, '山东校友采访', '2019-07-05');
INSERT INTO `采访记录` VALUES (1211314, '重庆校友采访', '2019-07-11');

SET FOREIGN_KEY_CHECKS = 1;
