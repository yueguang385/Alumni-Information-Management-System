/*
MySQL Backup
Database: 校友信息管理系统
Backup Time: 2019-07-16 17:11:24
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `校友信息管理系统`.`个人捐赠`;
DROP TABLE IF EXISTS `校友信息管理系统`.`会长`;
DROP TABLE IF EXISTS `校友信息管理系统`.`学生`;
DROP TABLE IF EXISTS `校友信息管理系统`.`捐赠新闻`;
DROP TABLE IF EXISTS `校友信息管理系统`.`捐赠记录`;
DROP TABLE IF EXISTS `校友信息管理系统`.`新闻`;
DROP TABLE IF EXISTS `校友信息管理系统`.`校会捐赠`;
DROP TABLE IF EXISTS `校友信息管理系统`.`校友`;
DROP TABLE IF EXISTS `校友信息管理系统`.`校友会`;
DROP TABLE IF EXISTS `校友信息管理系统`.`管理员`;
DROP TABLE IF EXISTS `校友信息管理系统`.`采访`;
DROP TABLE IF EXISTS `校友信息管理系统`.`采访记录`;
CREATE TABLE `个人捐赠` (
  `捐赠记录id` int(20) NOT NULL,
  `捐赠校友学号` int(10) NOT NULL,
  PRIMARY KEY (`捐赠记录id`,`捐赠校友学号`) USING BTREE,
  KEY `捐赠人` (`捐赠校友学号`) USING BTREE,
  CONSTRAINT `个人捐赠记录id` FOREIGN KEY (`捐赠记录id`) REFERENCES `捐赠记录` (`捐赠记录id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `捐赠人` FOREIGN KEY (`捐赠校友学号`) REFERENCES `校友` (`学号`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `会长` (
  `姓名` varchar(255) NOT NULL,
  `地址` varchar(255) NOT NULL,
  `联系方式` varchar(255) DEFAULT NULL,
  `登录账户` varchar(255) DEFAULT NULL,
  `登录密码` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`姓名`,`地址`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `学生` (
  `学号` int(10) NOT NULL,
  `密码` varchar(255) DEFAULT NULL,
  `姓名` varchar(255) DEFAULT NULL,
  `院系` varchar(255) DEFAULT NULL,
  `入读年份` int(4) DEFAULT NULL,
  `邮箱` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`学号`) USING BTREE,
  KEY `密码` (`密码`,`姓名`,`院系`,`入读年份`,`邮箱`) USING BTREE,
  KEY `学号` (`学号`,`密码`,`姓名`,`院系`,`入读年份`,`邮箱`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `捐赠新闻` (
  `新闻捐赠id` int(20) NOT NULL,
  `新闻标题` varchar(255) NOT NULL,
  `新闻日期` date NOT NULL,
  PRIMARY KEY (`新闻捐赠id`,`新闻标题`,`新闻日期`) USING BTREE,
  KEY `捐赠` (`新闻捐赠id`) USING BTREE,
  KEY `新闻` (`新闻标题`,`新闻日期`) USING BTREE,
  CONSTRAINT `新闻` FOREIGN KEY (`新闻标题`, `新闻日期`) REFERENCES `新闻` (`标题`, `时间`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `新闻捐赠id记录` FOREIGN KEY (`新闻捐赠id`) REFERENCES `捐赠记录` (`捐赠记录id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `捐赠记录` (
  `捐赠记录id` int(20) NOT NULL AUTO_INCREMENT,
  `捐赠物` varchar(255) DEFAULT NULL,
  `捐赠日期` date DEFAULT NULL,
  PRIMARY KEY (`捐赠记录id`) USING BTREE,
  KEY `捐赠物` (`捐赠物`,`捐赠日期`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `新闻` (
  `标题` varchar(255) NOT NULL,
  `时间` date NOT NULL,
  `内容` longtext DEFAULT NULL,
  `发布校会名称` varchar(255) DEFAULT NULL,
  `发布校会地区` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`标题`,`时间`) USING BTREE,
  KEY `标题` (`标题`) USING BTREE,
  KEY `发布` (`发布校会名称`,`发布校会地区`) USING BTREE,
  CONSTRAINT `发布` FOREIGN KEY (`发布校会名称`, `发布校会地区`) REFERENCES `校友会` (`名称`, `地区`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `校会捐赠` (
  `捐赠记录id` int(20) NOT NULL,
  `捐赠校会名称` varchar(255) NOT NULL,
  `捐赠校会地区` varchar(255) NOT NULL,
  PRIMARY KEY (`捐赠记录id`,`捐赠校会名称`,`捐赠校会地区`) USING BTREE,
  KEY `捐赠校会信息` (`捐赠校会名称`,`捐赠校会地区`) USING BTREE,
  CONSTRAINT `捐赠校会信息` FOREIGN KEY (`捐赠校会名称`, `捐赠校会地区`) REFERENCES `校友会` (`名称`, `地区`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `校会捐赠记录id` FOREIGN KEY (`捐赠记录id`) REFERENCES `捐赠记录` (`捐赠记录id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `校友` (
  `学号` int(10) NOT NULL,
  `密码` varchar(255) DEFAULT NULL,
  `姓名` varchar(255) DEFAULT NULL,
  `院系` varchar(255) DEFAULT NULL,
  `入读年份` int(4) DEFAULT NULL,
  `性别` varchar(4) DEFAULT NULL,
  `邮箱` varchar(255) DEFAULT NULL,
  `电话` varchar(255) DEFAULT NULL,
  `地址` varchar(255) DEFAULT NULL,
  `工作单位` varchar(255) DEFAULT NULL,
  `所属校友会名称` varchar(255) DEFAULT NULL,
  `所属校友会地区` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`学号`) USING BTREE,
  KEY `子类属性` (`密码`,`姓名`,`院系`,`入读年份`,`邮箱`) USING BTREE,
  KEY `属于` (`所属校友会名称`,`所属校友会地区`) USING BTREE,
  KEY `子类` (`学号`,`密码`,`姓名`,`院系`,`入读年份`,`邮箱`),
  CONSTRAINT `子类` FOREIGN KEY (`学号`, `密码`, `姓名`, `院系`, `入读年份`, `邮箱`) REFERENCES `学生` (`学号`, `密码`, `姓名`, `院系`, `入读年份`, `邮箱`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `属于` FOREIGN KEY (`所属校友会名称`, `所属校友会地区`) REFERENCES `校友会` (`名称`, `地区`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `校友会` (
  `名称` varchar(255) NOT NULL,
  `地区` varchar(255) NOT NULL,
  `校友会联系方式` varchar(255) DEFAULT NULL,
  `人数` int(10) NOT NULL DEFAULT 0,
  `会长姓名` varchar(255) DEFAULT NULL,
  `会长地址` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`名称`,`地区`) USING BTREE,
  UNIQUE KEY `会长姓名` (`会长姓名`,`会长地址`) USING BTREE,
  CONSTRAINT `管理` FOREIGN KEY (`会长姓名`, `会长地址`) REFERENCES `会长` (`姓名`, `地址`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `管理员` (
  `账户` varchar(255) NOT NULL,
  `密码` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`账户`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `采访` (
  `标题` varchar(255) NOT NULL,
  `时间` date NOT NULL,
  `采访单位` varchar(255) DEFAULT NULL,
  `采访记者` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`标题`,`时间`) USING BTREE,
  CONSTRAINT `新闻子类` FOREIGN KEY (`标题`, `时间`) REFERENCES `新闻` (`标题`, `时间`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `采访记录` (
  `被采访校友学号` int(10) NOT NULL,
  `采访文章标题` varchar(255) NOT NULL,
  `采访日期` date NOT NULL,
  PRIMARY KEY (`被采访校友学号`,`采访文章标题`,`采访日期`) USING BTREE,
  KEY `采访记录` (`采访文章标题`,`采访日期`) USING BTREE,
  CONSTRAINT `被采访` FOREIGN KEY (`被采访校友学号`) REFERENCES `校友` (`学号`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `采访记录` FOREIGN KEY (`采访文章标题`, `采访日期`) REFERENCES `采访` (`标题`, `时间`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
BEGIN;
LOCK TABLES `校友信息管理系统`.`个人捐赠` WRITE;
DELETE FROM `校友信息管理系统`.`个人捐赠`;
INSERT INTO `校友信息管理系统`.`个人捐赠` (`捐赠记录id`,`捐赠校友学号`) VALUES (1, 1211314),(2, 1304567),(3, 1312589),(4, 1316789);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `校友信息管理系统`.`会长` WRITE;
DELETE FROM `校友信息管理系统`.`会长`;
INSERT INTO `校友信息管理系统`.`会长` (`姓名`,`地址`,`联系方式`,`登录账户`,`登录密码`) VALUES ('习敏', '陕西', '12355876643', 'xm', '992384oop'),('伊利亚', '新疆', '4129955', 'yly', '4925'),('何梁', 'London', '98752192', 'hl', 'hleng'),('何洁', '澳门', '17628346283', 'hj2', '34198fv'),('何进', '宁夏', '2589418', 'hj', '772164'),('刘峰', '湖北', '19238475532', 'lf', '887'),('刘芳', '云南省昆明市', '13645908728', 'lf', 'lfbs'),('刘芳菲', '贵州', '183475623421', 'lff', '1488gu'),('华熙', '山西省阳泉市', '14562773980', 'hx', 'iuye'),('周胜龙', '西藏', '9434813', 'zsl', '41328ieqr'),('张成', '四川', '162985897@qq.com', 'zc', 'zcsc'),('张明明', '广州市番禺区', '16887548976', 'zmm', 'adkd'),('易文', '黑龙江', '129384123', 'yw', '773'),('朱一萌', '福建', '19384775623', 'zym', '1985af'),('李一', '山东', '168266556@qq.com', 'ly', 'lysd'),('李亮', '辽宁', '4887141', 'll2', '450'),('李伟', '吉林', '91847723', 'lw', '8429'),('李明磊', '北京市东城区', '17820097642', 'lml', 'helloworld'),('李皓', '广西', '13847523455', 'lh', 'qofj998'),('李芳', '河北', '1419831', 'lf', 'jca'),('李莉', '香港', '6574284', 'llhk', '148341j'),('李蕊', '上海', '136889926@qq.com', 'lr', 'lrsh'),('李雷', 'WashingtonD.C', '2008-4443976', 'll', 'llamr'),('杨丽', '江西', '17654326543', 'yl', 'qoi998'),('杨树', 'Osaka', '84223412', 'ys', 'ysjp'),('林子文', '台湾', '18413456734', 'lzw', '13248'),('林立', '天津', '4358922', 'll3', '89324'),('王一', '安徽', '18734456785', 'wy', '0ijij'),('王坤', '海南', '1847532384', 'wk', 'fau'),('王晨', '内蒙古', '8989884', 'wc', '7742'),('王霖', '江苏', '8771341', 'wl', '8491uuo'),('王鹏', '浙江', '18674529386', 'wp', '1490i'),('董欣', '重庆', '258963258@qq.com', 'dx', 'dxcq'),('贺礼', '河南', '13488576520', 'hl', 'iauf996'),('赵凯亮', 'Sydney', '99401231', 'zkl', 'ipot'),('赵进', '青海', '271839292@qq.com', 'zj', 'zjqh'),('颜梦', '湖南', '123456789@qq.com', 'ym', 'ymhn'),('魏琳', '甘肃', '1414541', 'wl', '81249');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `校友信息管理系统`.`学生` WRITE;
DELETE FROM `校友信息管理系统`.`学生`;
INSERT INTO `校友信息管理系统`.`学生` (`学号`,`密码`,`姓名`,`院系`,`入读年份`,`邮箱`) VALUES (1710877, '123456', '何卓然', '计算机', 2017, '1837413452@qq.com'),(1056442, '123456', '刘亮', '物理', 2010, 'jjfu88@163.com'),(1267382, '123456', '刘航', '光电', 2012, '8897612@126.com'),(1304567, '123456', '孙艺', '哲学', 2013, '7023054@qq.com'),(1324567, '123456', '张可', '数学', 2013, '1124465@qq.com'),(1810000, '123456', '张航', '计算机', 2018, '1234567@qq.com'),(1320768, '123456', '李一', '金融', 2013, '1561564@qq.com'),(1276542, '123456', '李峰', '法学', 2012, '824751@163.com'),(1211314, '123456', '李晓', '金融', 2012, '2345678@qq.com'),(1826774, '123456', '李玲', '数学', 2018, 'csdf998@163.com'),(1825678, '123456', '李青', '政治', 2018, '5481465@qq.com'),(1176842, '123456', '杨明明', '法学', 2011, '8724365@126.com'),(1024733, '123456', '林琨', '数学', 2010, '88237198@'),(1316789, '123456', '王晓', '化学', 2013, '3456789@qq.com'),(1274283, '123456', '王芳芳', '政治', 2012, '42uiqf@163.com'),(1832545, '123456', '萧炎', '材料', 2018, '2340451@qq.com'),(1312589, '123456', '赵信', '数学', 2013, '1568756@qq.com');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `校友信息管理系统`.`捐赠新闻` WRITE;
DELETE FROM `校友信息管理系统`.`捐赠新闻`;
INSERT INTO `校友信息管理系统`.`捐赠新闻` (`新闻捐赠id`,`新闻标题`,`新闻日期`) VALUES (1, '校友捐赠', '2019-07-06'),(2, '校友捐赠', '2019-07-08'),(3, '校友捐赠', '2019-07-09'),(4, '校友捐赠', '2019-07-10'),(5, '四川校友会捐赠仪式', '2019-07-01'),(6, '青海校友会捐赠仪式', '2019-07-03');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `校友信息管理系统`.`捐赠记录` WRITE;
DELETE FROM `校友信息管理系统`.`捐赠记录`;
INSERT INTO `校友信息管理系统`.`捐赠记录` (`捐赠记录id`,`捐赠物`,`捐赠日期`) VALUES (1, ' 台式机5台', '2019-07-08'),(2, '书籍1000本', '2019-07-01'),(3, '书籍1000本', '2019-07-03'),(4, '书籍500本', '2019-07-09'),(5, '实验仪器3台', '2019-07-06'),(6, '实验仪器5台', '2019-07-10');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `校友信息管理系统`.`新闻` WRITE;
DELETE FROM `校友信息管理系统`.`新闻`;
INSERT INTO `校友信息管理系统`.`新闻` (`标题`,`时间`,`内容`,`发布校会名称`,`发布校会地区`) VALUES ('上海校友采访', '2019-07-02', '采访杰出校友张可', '上海校友会', '上海'),('四川校友会捐赠仪式', '2019-07-01', '四川校友会捐赠书籍1000本', '四川校友会', '四川'),('山东校友采访', '2019-07-05', '采访杰出校友王晓', '山东校友会', '山东'),('校友捐赠', '2019-07-06', '校友李晓捐赠实验仪器3台', '重庆校友会', '重庆'),('校友捐赠', '2019-07-08', '校友孙艺捐赠台式机5台', '青海校友会', '青海'),('校友捐赠', '2019-07-09', '校友赵信捐赠书籍500本', '湖南校友会', '湖南'),('校友捐赠', '2019-07-10', '校友王晓捐赠实验仪器5台', '山东校友会', '山东'),('百年校庆倒计时100天', '2019-07-11', '为迎接百年校庆做好准备', '山东校友会', '山东'),('重庆校友采访', '2019-07-11', '采访杰出校友李晓', '重庆校友会', '重庆'),('青海校友会捐赠仪式', '2019-07-03', '青海校友会捐赠书籍1000本', '青海校友会', '青海');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `校友信息管理系统`.`校会捐赠` WRITE;
DELETE FROM `校友信息管理系统`.`校会捐赠`;
INSERT INTO `校友信息管理系统`.`校会捐赠` (`捐赠记录id`,`捐赠校会名称`,`捐赠校会地区`) VALUES (5, '四川校友会', '四川'),(6, '青海校友会', '青海');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `校友信息管理系统`.`校友` WRITE;
DELETE FROM `校友信息管理系统`.`校友`;
INSERT INTO `校友信息管理系统`.`校友` (`学号`,`密码`,`姓名`,`院系`,`入读年份`,`性别`,`邮箱`,`电话`,`地址`,`工作单位`,`所属校友会名称`,`所属校友会地区`) VALUES (1024733, '123456', '林琨', '数学', 2010, '男', '88237198@', '16548344302', '美国', '美国', '美国校友会', '美国'),(1056442, '123456', '刘亮', '物理', 2010, '男', 'jjfu88@163.com', '13478799065', '上海', '上海', '上海校友会', '上海'),(1176842, '123456', '杨明明', '法学', 2011, '男', '8724365@126.com', '18766509823', '广州', '广州', '广东校友会', '广东'),(1211314, '123456', '李晓', '金融', 2012, '男', '2345678@qq.com', '15111110110', '重庆', '重庆', '重庆校友会', '重庆'),(1267382, '123456', '刘航', '光电', 2012, '男', '8897612@126.com', '1423345876', '重庆', '重庆', '重庆校友会', '重庆'),(1274283, '123456', '王芳芳', '政治', 2012, '女', '42uiqf@163.com', '18746623046', '上海', '上海', '上海校友会', '上海'),(1276542, '123456', '李峰', '法学', 2012, '男', '824751@163.com', '15648527365', '北京', '北京', '北京校友会', '北京'),(1304567, '123456', '孙艺', '哲学', 2013, '女', '7023054@qq.com', '15000000000', '青海', '青海', '青海校友会', '青海'),(1312589, '123456', '赵信', '数学', 2013, '男', '1568756@qq.com', '17802010134', '湖南', '湖南', '湖南校友会', '湖南'),(1316789, '123456', '王晓', '化学', 2013, '女', '3456789@qq.com', '13566898978', '山东', '山东', '山东校友会', '山东'),(1320768, '123456', '李一', '金融', 2013, '男', '1561564@qq.com', '15205848894', '四川', '四川', '四川校友会', '四川'),(1324567, '123456', '张可', '数学', 2013, '女', '1124465@qq.com', '12336445654', '上海', '上海', '上海校友会', '上海');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `校友信息管理系统`.`校友会` WRITE;
DELETE FROM `校友信息管理系统`.`校友会`;
INSERT INTO `校友信息管理系统`.`校友会` (`名称`,`地区`,`校友会联系方式`,`人数`,`会长姓名`,`会长地址`) VALUES ('上海校友会', '上海', 'nkshxyh@163.com', 1680, '李蕊', '上海'),('云南校友会', '云南', 'nkynxyh@qq.com', 185, '刘芳', '云南省昆明市'),('内蒙古校友会', '内蒙古', 'nknmgxyh@qq.com', 165, '王晨', '内蒙古'),('北京校友会', '北京', 'nkbjxyh@128.com', 1537, '李明磊', '北京市东城区'),('台湾校友会', '台湾', 'nktwxyh@qq.com', 65, '林子文', '台湾'),('吉林校友会', '吉林', 'nkjlxyh@126.com', 186, '李伟', '吉林'),('四川校友会', '四川', 'nkscxyh@qq.com', 586, '张成', '四川'),('天津校友会', '天津', 'nktjxyh@163.com', 1062, '林立', '天津'),('宁夏校友会', '宁夏', 'nknxxyh@128.com', 175, '何进', '宁夏'),('安徽校友会', '安徽', 'nkahxyh@qq.com', 308, '王一', '安徽'),('山东校友会', '山东', 'nksdxyh@163.com', 578, '李一', '山东'),('山西校友会', '山西', 'nksxxyh@128.com', 237, '华熙', '山西省阳泉市'),('广东校友会', '广东', 'nkgdxyh@qq.com', 986, '张明明', '广州市番禺区'),('广西校友会', '广西', 'nksdxyh@qq.com', 378, '李皓', '广西'),('新疆校友会', '新疆', 'nkxjxyh@163.com', 285, '伊利亚', '新疆'),('日本校友会', '日本', 'nkrbxyh@yahoo.com', 14, '杨树', 'Osaka'),('江苏校友会', '江苏', 'nkjsxyh@126.com', 508, '王霖', '江苏'),('江西校友会', '江西', 'nkjxxyh@128.com', 208, '杨丽', '江西'),('河北校友会', '河北', 'nkhbxyh@128.com', 549, '李芳', '河北'),('河南校友会', '河南', 'nkhenanxyh@qq.com', 206, '贺礼', '河南'),('浙江校友会', '浙江', 'nkzjxyh@163.com', 487, '王鹏', '浙江'),('海南校友会', '海南', 'nkhainannxyh@128.com', 183, '王坤', '海南'),('湖北校友会', '湖北', 'nkhbxyh@qq.com', 203, '刘峰', '湖北'),('湖南校友会', '湖南', 'nkhnxyh@qq.com', 291, '颜梦', '湖南'),('澳大利亚校友会', '澳大利亚', 'nkadlyxyh@yahoo.com', 26, '赵凯亮', 'Sydney'),('澳门校友会', '澳门', 'nkamxyh@qq.com', 75, '何洁', '澳门'),('甘肃校友会', '甘肃', 'nkgsxyh@163.com', 135, '魏琳', '甘肃'),('福建校友会', '福建', 'nkfjxyh@163.com', 276, '朱一萌', '福建'),('美国校友会', '美国', 'nkmgxyh@yahoo.com', 126, '李雷', 'WashingtonD.C'),('英国校友会', '英国', 'nkygxyh@yahoo.com', 56, '何梁', 'London'),('西藏校友会', '西藏', 'nkxzxyh@128.com', 154, '周胜龙', '西藏'),('贵州校友会', '贵州', 'nkgzxyh@163.com', 218, '刘芳菲', '贵州'),('辽宁校友会', '辽宁', 'nklnxyh@163.com', 172, '李亮', '辽宁'),('重庆校友会', '重庆', 'nkcqxyh@163.com', 507, '董欣', '重庆'),('陕西校友会', '陕西', 'nksxxyh@126.com', 183, '习敏', '陕西'),('青海校友会', '青海', 'zhaoyong99@sina.com', 128, '赵进', '青海'),('香港校友会', '香港', 'nkxgxyh@qq.com', 96, '李莉', '香港'),('黑龙江校友会', '黑龙江', 'nkhljxyh@qq.com', 159, '易文', '黑龙江');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `校友信息管理系统`.`管理员` WRITE;
DELETE FROM `校友信息管理系统`.`管理员`;
INSERT INTO `校友信息管理系统`.`管理员` (`账户`,`密码`) VALUES ('qm', 'root'),('wzh', 'root'),('wzh2', 'root'),('zt', 'root'),('zzx', 'root');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `校友信息管理系统`.`采访` WRITE;
DELETE FROM `校友信息管理系统`.`采访`;
INSERT INTO `校友信息管理系统`.`采访` (`标题`,`时间`,`采访单位`,`采访记者`) VALUES ('上海校友采访', '2019-07-02', '校组织部', '知一'),('山东校友采访', '2019-07-05', '校组织部', '知一'),('重庆校友采访', '2019-07-11', '校组织部', '知一');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `校友信息管理系统`.`采访记录` WRITE;
DELETE FROM `校友信息管理系统`.`采访记录`;
INSERT INTO `校友信息管理系统`.`采访记录` (`被采访校友学号`,`采访文章标题`,`采访日期`) VALUES (1211314, '重庆校友采访', '2019-07-11'),(1316789, '山东校友采访', '2019-07-05'),(1324567, '上海校友采访', '2019-07-02');
UNLOCK TABLES;
COMMIT;
