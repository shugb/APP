/*
 Navicat Premium Data Transfer

 Source Server         : server
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 123.207.25.93:3306
 Source Schema         : app

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 29/08/2019 19:43:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` int(11) NOT NULL,
  `device` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `regist_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `today_step` int(11) NULL DEFAULT NULL,
  `week_step` int(11) NULL DEFAULT NULL,
  `month_step` int(11) NULL DEFAULT NULL,
  `season_step` int(11) NULL DEFAULT NULL,
  `total_step` bigint(11) NULL DEFAULT NULL,
  `icon_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `bg_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1006 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1000, 16124332, 'xwl', 0, 'Mi10', '2019-06-20 10:53:09', '', 106, 10204, 10304, 10404, 11111, '', 'mybg');
INSERT INTO `account` VALUES (1001, 1101, '裏', 1, 'ipone5', '2019-06-11 10:54:42', NULL, 2821, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `account` VALUES (1002, 1102, '王', 0, 'ipone6', '2019-06-19 10:55:11', NULL, 500, 1200, 1500, NULL, NULL, NULL, NULL);
INSERT INTO `account` VALUES (1003, 1103, '钟', 1, 'ipone7', '2019-06-19 10:55:43', NULL, 1000, 1100, 1200, NULL, NULL, NULL, NULL);
INSERT INTO `account` VALUES (1004, 1105, '刘总', 1, NULL, '2019-06-20 14:26:22', 'liuzong@qq.com', 2000, NULL, NULL, NULL, 2000, NULL, NULL);
INSERT INTO `account` VALUES (1005, 16122222, '老gai', 0, NULL, '2019-06-21 23:49:31', NULL, 1500, NULL, NULL, NULL, 1500, NULL, NULL);

-- ----------------------------
-- Table structure for administer
-- ----------------------------
DROP TABLE IF EXISTS `administer`;
CREATE TABLE `administer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pswd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administer
-- ----------------------------
INSERT INTO `administer` VALUES (1, '16124332', '0', '131@163.com');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `admin_id` int(11) NULL DEFAULT NULL,
  `release_time` datetime(0) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `src_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `administer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (2, '人民日报连续刊文:不做昏官懒官庸官贪官', 1, '2019-06-20 19:09:04', '无线电波指挥千军万马，靠的是解放军将士政治坚定、纪律严明、一切行动听指挥。从战争时期“革命的政治工作是革命军队的生命线”，到和平年代“到什么时候都得讲政治”，旗帜鲜明讲政治是我们党作为马克思主义政党的特质。习近平总书记多次强调，党的政治建设是党的根本性建设。对党员干部而言，始终做到政治过硬，更是第一位的要求。\r\n\r\n党的十八大以来，在全面从严治党实践中，党的政治建设摆上突出位置，取得明显成效。但也要看到，党内一些不讲政治、忽视和淡化政治的问题还不同程度存在。在中央和国家机关党的建设工作会议上，习近平总书记入木三分地给昏官、懒官、庸官、贪官四类人画像，把“不做政治麻木、办事糊涂的昏官”列在第一位，具有极强的现实针对性。', NULL);
INSERT INTO `article` VALUES (3, '8月起实施新规：中央单位出差人员用餐费用自行解决', 1, '2019-06-19 19:09:39', '通知指出，中央单位出差人员出差期间按规定领取伙食补助费。除确因工作需要由接待单位按规定安排的一次工作餐外，用餐费用自行解决。出差人员需接待单位协助安排用餐的，应当提前告知控制标准，并向伙食提供方交纳伙食费。出差人员出差期间按规定领取市内交通费。接待单位协助提供交通工具并有收费标准的，出差人员按标准交纳，最高不超过日市内交通费标准；没有收费标准的，每人每半天按照日市内交通费标准的百分之50%交纳。', NULL);
INSERT INTO `article` VALUES (4, '日本京都纵火案已致33人死亡', 1, '2019-06-22 20:29:29', '有当地媒体统计，这是日本近19年来死亡人数最多的纵火案。京都府警方稍早前通报说，18日上午10时30分左右，一名41岁的男子进入京都一家动漫工作室，“泼洒了汽油状的液体”并纵火。火灾发生时，约有70名工作人员在这栋三层建筑物里工作。火灾引发爆炸，建筑物二层和三层的玻璃全部被震碎。火灾于15时左右被扑灭。肇事男子目前已被当地警方控制，面部和胸部被烧伤，已被送往京都市一家医院。京都府警方正在对纵火杀人案进行调查。他既不是这家动漫工作室员工，也不是工作室前雇员。\r\n\r\n　　当地警方说，火灾现场发现了锤子、刀具和便携式汽油桶，这些物品均有可能是纵火男子带来的。另有消息称，当天上午有人携汽油桶到火灾现场附近的加油站购买汽油，目前警方正在做进一步调查。', NULL);
INSERT INTO `article` VALUES (6, '马上开学', 1, '2019-08-28 00:00:00', ' 开学在即，你是否已经被各种繁琐的事项忙晕了头？大包大揽并不能帮你成为一名优秀的家长，培养孩子的组织和管理能力对孩子的未来颇为重要。只要用对方法，稍加鼓励，孩子们就能把自己的学习和生活安排好。从学龄前儿童到青春期少年，看看教育专业人士给出的建议。', '');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `mark_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE,
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES (1, 1, 3, NULL);
INSERT INTO `favorite` VALUES (3, 2, 4, '2019-06-22 20:50:52');
INSERT INTO `favorite` VALUES (4, 2, 4, '2019-07-22 11:31:40');
INSERT INTO `favorite` VALUES (5, 2, 4, '2019-07-22 12:46:46');

-- ----------------------------
-- Table structure for inquiry
-- ----------------------------
DROP TABLE IF EXISTS `inquiry`;
CREATE TABLE `inquiry`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `release_time` datetime(0) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `inquiry_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inquiry
-- ----------------------------
INSERT INTO `inquiry` VALUES (1, 1, '2019-06-21 22:43:00', '测试询问1');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_id` int(11) NULL DEFAULT NULL,
  `receive_id` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `send_time` datetime(0) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, 1001, 1, '上海大学', '2019-07-22 00:00:00', 0);
INSERT INTO `message` VALUES (3, 1001, 1, '问题测试', '2019-07-22 00:00:00', 0);
INSERT INTO `message` VALUES (5, 1002, 1, '吞吞吐吐', '2019-07-23 00:00:00', 0);
INSERT INTO `message` VALUES (6, 1001, 1, 'ekjjsn', '2019-07-23 00:00:00', 0);
INSERT INTO `message` VALUES (7, 1001, 1, 'wie', '2019-07-23 00:00:00', 0);
INSERT INTO `message` VALUES (8, 1001, 1, '低调低调吃', '2019-07-25 00:00:00', 0);
INSERT INTO `message` VALUES (9, 1001, 1, 'ehsbns', '2019-07-27 00:00:00', 0);

-- ----------------------------
-- Table structure for my_prize
-- ----------------------------
DROP TABLE IF EXISTS `my_prize`;
CREATE TABLE `my_prize`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `get_time` datetime(0) NULL DEFAULT NULL,
  `prize_id` int(11) NULL DEFAULT NULL,
  `redeemed` bit(1) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_prize
-- ----------------------------
INSERT INTO `my_prize` VALUES (19, '2019-07-23 12:00:00', 4, NULL, 1001);
INSERT INTO `my_prize` VALUES (20, '2019-07-25 13:13:46', 5, NULL, 1001);
INSERT INTO `my_prize` VALUES (21, '2019-08-28 10:59:35', 4, NULL, 1003);
INSERT INTO `my_prize` VALUES (22, '2019-08-28 14:33:45', 17, NULL, 1001);

-- ----------------------------
-- Table structure for my_ticket
-- ----------------------------
DROP TABLE IF EXISTS `my_ticket`;
CREATE TABLE `my_ticket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `get_time` datetime(0) NULL DEFAULT NULL,
  `ticket_id` int(11) NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_ticket
-- ----------------------------
INSERT INTO `my_ticket` VALUES (1, '2019-07-23 16:10:23', 2, 1001);

-- ----------------------------
-- Table structure for prize
-- ----------------------------
DROP TABLE IF EXISTS `prize`;
CREATE TABLE `prize`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NULL DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `step_need` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `src_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `cnt` int(11) NULL DEFAULT NULL,
  `release_time` date NULL DEFAULT NULL,
  `remain` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  CONSTRAINT `prize_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `administer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prize
-- ----------------------------
INSERT INTO `prize` VALUES (3, 1, 'iponeX', 1000, '所示的 iPhone XR 64GB 机型和 iPhone XS 64GB 机型价格是使用 iPhone 7 Plus 32GB 机型进行折抵换购的价格。上述所示机型的分期付款金额是在使用 iPhone 7 Plus 32GB 机型进行折抵后，再以招商银行、中国工商银行或花呗 24 期免息分期付款方式估算得出的整数金额 (未显示小数点以后的金额)，实际支付金额以银行或花呗账单为准。', NULL, 50, '2019-07-16', 5);
INSERT INTO `prize` VALUES (4, 1, '荣耀', 50, '荣耀,为年轻人做手机.追求极致科技的荣耀家族成员包括荣耀20系列、荣耀V20、荣耀Magic系列、荣耀8X系列、荣耀Note10、荣耀Play、荣耀9i、荣耀10、荣耀畅玩7A、荣耀畅玩7C等', NULL, 50, '2019-07-09', 16);
INSERT INTO `prize` VALUES (5, 1, '小米8', 50, ' 小米8 屏幕指纹版产品站中图片所示的屏幕指纹动画效果，在初期销售批次手机中尚未搭载，\r\n后续会通过 OTA 支持，更新进度最终以MIUI官网公布、MIUI稳定版功能更新为准。', NULL, 30, '2019-07-02', 28);
INSERT INTO `prize` VALUES (17, 1, 'randn', 3, '1223', '', 3, '2019-08-28', 2);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `release_time` datetime(0) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `iquiry_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inquiry_id`(`inquiry_id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`inquiry_id`) REFERENCES `inquiry` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `administer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (1, 1, 1, '2019-06-21 22:44:06', '测试回复1', NULL);

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NULL DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cnt` int(11) NOT NULL,
  `remain` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `release_time` datetime(0) NULL DEFAULT NULL,
  `deadline` datetime(0) NULL DEFAULT NULL,
  `icon_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `vedio_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `video_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `administer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES (2, 1, '2019张杰【未·LIVE】全球巡回演唱会 重庆站', 20, 12, '现场打造四个全新！\r\n\r\n舞美全新升级。在2018年的舞美基础上，2019张杰【未·LIVE】通过对动效升级的方式，打造最新的视听体系，调动你所有的感官，给你震撼身心的现场舞美声效体验。\r\n\r\n互动全新迭代。如果说2018的未·LIVE巡演是极致的视听享受，那么2019张杰【未·LIVE】将成为更具互动性的音乐狂欢，更加强调对音乐、对梦想的热爱；对生活、对爱情的分享。\r\n\r\n歌单升级焕新。相较2018年，2019张杰【未·LIVE】的歌单做了较大调整，在保留了经典段落的基础上，新增了众多亮点曲目，将给大家带来全新的LIVE体验。', '2019-06-21 15:24:44', '2019-06-04 15:24:48', NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (3, 1, '王力宏“龙的传人2060”世界巡演杭州大莲花专场', 5, 2, '钱塘江畔，2022年杭州亚运会主场馆正静静矗立。8月10日，\"大莲花\"即将绚烂绽放迎来盛大首秀。杭州人民的老朋友王力宏即将带着自己的独有风格，举办杭州奥体博览中心主体育场落成后首场演唱会。\r\n\r\n在万众期待下，王力宏终于带着他的\"龙的传人2060\"世界巡回演唱会重新回到杭州，来到了杭州人民翘首以盼的\"大莲花\"。 作为2022年杭州亚运会开幕式闭幕式的主场馆，杭州奥体博览中心主体育场形似莲花，造型动感飘逸，由28片大花瓣和27片小花瓣组成。整体造型取意于杭州丝绸纹理与纺织体系，建筑体态源于钱塘江水的动态，拥有简洁的花瓣单元，犹如一朵美丽的莲花绽放于钱塘江畔，吸引所有人的目光。', '2019-06-22 21:10:04', '2019-06-30 21:10:07', NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (10, 1, '上海大学鸽王', 0, 0, '测试票', '2019-08-28 20:50:02', '2019-08-28 20:50:04', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
