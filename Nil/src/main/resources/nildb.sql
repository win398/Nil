/*
 Navicat Premium Data Transfer

 Source Server         : server
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : localhost:3306
 Source Schema         : nildb

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 23/03/2023 11:07:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for contact_group
-- ----------------------------
DROP TABLE IF EXISTS `contact_group`;
CREATE TABLE `contact_group`  (
  `groupId` int(0) NOT NULL AUTO_INCREMENT COMMENT '分组编号',
  `groupName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分组名',
  `uid` int(0) NOT NULL COMMENT '用户编号',
  `groupIndex` int(0) NULL DEFAULT NULL COMMENT '分组下标',
  PRIMARY KEY (`groupId`) USING BTREE,
  INDEX `FK_group_uid`(`uid`) USING BTREE,
  INDEX `groupId`(`groupId`) USING BTREE,
  CONSTRAINT `FK_group_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact_group
-- ----------------------------
INSERT INTO `contact_group` VALUES (1, '我的好友', 1, 1);
INSERT INTO `contact_group` VALUES (2, '我的好友', 5, 1);
INSERT INTO `contact_group` VALUES (3, '我的好友', 6, 1);
INSERT INTO `contact_group` VALUES (4, '我的好友', 7, 1);
INSERT INTO `contact_group` VALUES (5, '特别关心', 1, 0);
INSERT INTO `contact_group` VALUES (6, '特别关心', 5, 0);
INSERT INTO `contact_group` VALUES (7, '特别关心', 6, 0);
INSERT INTO `contact_group` VALUES (8, '特别关心', 7, 0);
INSERT INTO `contact_group` VALUES (10, '特别关心', 11, 0);
INSERT INTO `contact_group` VALUES (11, '我的好友', 11, 1);
INSERT INTO `contact_group` VALUES (12, '特别关心', 12, 0);
INSERT INTO `contact_group` VALUES (13, '我的好友', 12, 1);
INSERT INTO `contact_group` VALUES (14, '特别关心', 13, 0);
INSERT INTO `contact_group` VALUES (15, '我的好友', 13, 1);
INSERT INTO `contact_group` VALUES (16, '特别关心', 14, 0);
INSERT INTO `contact_group` VALUES (17, '我的好友', 14, 1);
INSERT INTO `contact_group` VALUES (18, '特别关心', 15, 0);
INSERT INTO `contact_group` VALUES (19, '我的好友', 15, 1);
INSERT INTO `contact_group` VALUES (20, '特别关心', 16, 0);
INSERT INTO `contact_group` VALUES (21, '我的好友', 16, 1);
INSERT INTO `contact_group` VALUES (22, '特别关心', 17, 0);
INSERT INTO `contact_group` VALUES (23, '我的好友', 17, 1);
INSERT INTO `contact_group` VALUES (24, '特别关心', 18, 0);
INSERT INTO `contact_group` VALUES (25, '我的好友', 18, 1);
INSERT INTO `contact_group` VALUES (26, '特别关心', 19, 0);
INSERT INTO `contact_group` VALUES (27, '我的好友', 19, 1);
INSERT INTO `contact_group` VALUES (28, '特别关心', 20, 0);
INSERT INTO `contact_group` VALUES (29, '我的好友', 20, 1);
INSERT INTO `contact_group` VALUES (30, '特别关心', 21, 0);
INSERT INTO `contact_group` VALUES (31, '我的好友', 21, 1);
INSERT INTO `contact_group` VALUES (32, '特别关心', 22, 0);
INSERT INTO `contact_group` VALUES (33, '我的好友', 22, 1);
INSERT INTO `contact_group` VALUES (34, '特别关心', 23, 0);
INSERT INTO `contact_group` VALUES (35, '我的好友', 23, 1);
INSERT INTO `contact_group` VALUES (36, '特别关心', 24, 0);
INSERT INTO `contact_group` VALUES (37, '我的好友', 24, 1);
INSERT INTO `contact_group` VALUES (38, '特别关心', 25, 0);
INSERT INTO `contact_group` VALUES (39, '我的好友', 25, 1);
INSERT INTO `contact_group` VALUES (40, '特别关心', 27, 0);
INSERT INTO `contact_group` VALUES (41, '我的好友', 27, 1);
INSERT INTO `contact_group` VALUES (42, '特别关心', 28, 0);
INSERT INTO `contact_group` VALUES (43, '我的好友', 28, 1);
INSERT INTO `contact_group` VALUES (44, '特别关心', 29, 0);
INSERT INTO `contact_group` VALUES (45, '我的好友', 29, 1);
INSERT INTO `contact_group` VALUES (46, '特别关心', 31, 0);
INSERT INTO `contact_group` VALUES (47, '我的好友', 31, 1);
INSERT INTO `contact_group` VALUES (48, '特别关心', 32, 0);
INSERT INTO `contact_group` VALUES (49, '我的好友', 32, 1);
INSERT INTO `contact_group` VALUES (50, '特别关心', 33, 0);
INSERT INTO `contact_group` VALUES (51, '我的好友', 33, 1);
INSERT INTO `contact_group` VALUES (52, '特别关心', 34, 0);
INSERT INTO `contact_group` VALUES (53, '我的好友', 34, 1);
INSERT INTO `contact_group` VALUES (54, '特别关心', 35, 0);
INSERT INTO `contact_group` VALUES (55, '我的好友', 35, 1);
INSERT INTO `contact_group` VALUES (56, '特别关心', 36, 0);
INSERT INTO `contact_group` VALUES (57, '我的好友', 36, 1);
INSERT INTO `contact_group` VALUES (58, '特别关心', 37, 0);
INSERT INTO `contact_group` VALUES (59, '我的好友', 37, 1);

-- ----------------------------
-- Table structure for converse
-- ----------------------------
DROP TABLE IF EXISTS `converse`;
CREATE TABLE `converse`  (
  `msgId` int(0) NOT NULL AUTO_INCREMENT COMMENT '消息编号',
  `sendAccount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送方账号',
  `receiveAccount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接收方账号',
  `sendTime` datetime(0) NOT NULL COMMENT '发送时间',
  `msgContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '消息内容',
  `msgState` int(0) NOT NULL COMMENT '1为已发送  2为未发送',
  PRIMARY KEY (`msgId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 376 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of converse
-- ----------------------------
INSERT INTO `converse` VALUES (1, '1824591386', '61896362', '2022-05-29 11:25:04', '你好', 1);
INSERT INTO `converse` VALUES (2, '1824591386', '61896362', '2022-05-29 11:28:20', '在吗', 1);
INSERT INTO `converse` VALUES (11, '61896362', '1824591386', '2022-05-29 12:06:29', '再试一次', 1);
INSERT INTO `converse` VALUES (12, '61896362', '1824591386', '2022-05-29 12:07:14', '最后一次', 1);
INSERT INTO `converse` VALUES (13, '61896362', '1824591386', '2022-05-29 12:11:44', '来咯', 1);
INSERT INTO `converse` VALUES (14, '61896362', '1824591386', '2022-05-29 12:19:22', '我真厉害', 1);
INSERT INTO `converse` VALUES (15, '1824591386', '61896362', '2022-05-29 12:19:30', '那必须的', 1);
INSERT INTO `converse` VALUES (16, '61896362', '1824591386', '2022-05-29 12:19:36', '哈哈哈哈', 1);
INSERT INTO `converse` VALUES (17, '1824591386', '61896362', '2022-05-29 12:19:52', 'good', 1);
INSERT INTO `converse` VALUES (18, '61896362', '1824591386', '2022-05-29 12:20:00', '我滴任务完成辣', 1);
INSERT INTO `converse` VALUES (19, '61896362', '1824591386', '2022-07-21 21:36:27', '111', 1);
INSERT INTO `converse` VALUES (20, '61896362', '1824591386', '2022-07-21 21:38:43', '1111', 1);
INSERT INTO `converse` VALUES (21, '61896362', '1824591386', '2022-07-21 21:40:41', '1111', 1);
INSERT INTO `converse` VALUES (22, '61896362', '1824591386', '2022-07-22 09:46:58', '哈哈', 1);
INSERT INTO `converse` VALUES (23, '1824591386', '61896362', '2022-07-22 09:57:17', 'baga', 1);
INSERT INTO `converse` VALUES (24, '61896362', '1824591386', '2022-07-22 10:09:37', '111', 1);
INSERT INTO `converse` VALUES (25, '61896362', '1824591386', '2022-07-22 10:15:03', '123', 1);
INSERT INTO `converse` VALUES (26, '61896362', '1824591386', '2022-07-22 10:15:20', '12312', 1);
INSERT INTO `converse` VALUES (27, '61896362', '1824591386', '2022-07-22 10:20:23', '121', 1);
INSERT INTO `converse` VALUES (28, '61896362', '1824591386', '2022-07-22 10:21:03', '12321', 1);
INSERT INTO `converse` VALUES (29, '61896362', '1824591386', '2022-07-22 10:21:05', '12312', 1);
INSERT INTO `converse` VALUES (30, '61896362', '1824591386', '2022-07-22 10:21:06', 'sdasdas', 1);
INSERT INTO `converse` VALUES (31, '61896362', '1824591386', '2022-07-22 10:21:07', 'dasdas', 1);
INSERT INTO `converse` VALUES (32, '61896362', '1824591386', '2022-07-22 10:21:11', 'asdada', 1);
INSERT INTO `converse` VALUES (33, '61896362', '1824591386', '2022-07-22 10:21:13', 'fsdf1', 1);
INSERT INTO `converse` VALUES (34, '61896362', '1824591386', '2022-07-22 10:21:17', 'bagea', 1);
INSERT INTO `converse` VALUES (35, '61896362', '1824591386', '2022-07-22 10:21:25', 'ddsfs', 1);
INSERT INTO `converse` VALUES (36, '61896362', '1824591386', '2022-07-22 10:25:53', '111', 1);
INSERT INTO `converse` VALUES (37, '61896362', '1824591386', '2022-07-22 10:25:58', '111', 1);
INSERT INTO `converse` VALUES (38, '61896362', '1824591386', '2022-07-22 10:30:58', '111', 1);
INSERT INTO `converse` VALUES (39, '61896362', '1824591386', '2022-07-22 10:31:01', '111', 1);
INSERT INTO `converse` VALUES (40, '61896362', '1824591386', '2022-07-22 10:37:55', '111', 1);
INSERT INTO `converse` VALUES (41, '61896362', '1824591386', '2022-07-22 10:37:58', '11', 1);
INSERT INTO `converse` VALUES (42, '61896362', '1824591386', '2022-07-22 10:38:49', '111', 1);
INSERT INTO `converse` VALUES (43, '61896362', '1824591386', '2022-07-22 10:38:59', '111', 1);
INSERT INTO `converse` VALUES (44, '61896362', '1824591386', '2022-07-22 10:39:04', '111', 1);
INSERT INTO `converse` VALUES (45, '61896362', '1824591386', '2022-07-22 10:40:14', '1sdsdf', 1);
INSERT INTO `converse` VALUES (46, '61896362', '1824591386', '2022-07-22 10:40:18', 'sdfsdf', 1);
INSERT INTO `converse` VALUES (47, '61896362', '1824591386', '2022-07-22 10:40:22', 's2423', 1);
INSERT INTO `converse` VALUES (48, '61896362', '1824591386', '2022-07-22 10:40:25', 'sdfsdf', 1);
INSERT INTO `converse` VALUES (49, '61896362', '1824591386', '2022-07-22 10:40:28', '1111', 1);
INSERT INTO `converse` VALUES (50, '61896362', '1824591386', '2022-07-22 10:40:31', 'sdfsdf', 1);
INSERT INTO `converse` VALUES (51, '1824591386', '61896362', '2022-07-22 10:42:30', '哈哈哈', 1);
INSERT INTO `converse` VALUES (52, '61896362', '1824591386', '2022-07-22 11:52:05', '123', 1);
INSERT INTO `converse` VALUES (53, '61896362', '1824591386', '2022-07-22 11:52:12', 'ok', 1);
INSERT INTO `converse` VALUES (54, '1824591386', '1824591386', '2022-07-22 11:56:20', '哈哈', 1);
INSERT INTO `converse` VALUES (55, '1824591386', '1824591386', '2022-07-22 11:58:33', '还可以', 1);
INSERT INTO `converse` VALUES (56, '1824591386', '61896362', '2022-07-22 11:59:13', '。。。', 1);
INSERT INTO `converse` VALUES (57, '1824591386', '61896362', '2022-07-22 11:59:18', '。。。', 1);
INSERT INTO `converse` VALUES (58, '1824591386', '61896362', '2022-07-22 11:59:21', '哦哦', 1);
INSERT INTO `converse` VALUES (59, '61896362', '1824591386', '2022-07-22 12:00:13', 'buco', 1);
INSERT INTO `converse` VALUES (60, '61896362', '1824591386', '2022-07-22 12:00:19', '可以了', 1);
INSERT INTO `converse` VALUES (61, '1824591386', '61896362', '2022-07-22 12:00:23', '哈哈哈', 1);
INSERT INTO `converse` VALUES (62, '61896362', '1824591386', '2022-07-22 12:06:28', 'emo', 1);
INSERT INTO `converse` VALUES (63, '1824591386', '61896362', '2022-07-22 12:06:49', '可以噢', 1);
INSERT INTO `converse` VALUES (64, '1824591386', '61896362', '2022-07-22 12:18:38', '😁😁', 1);
INSERT INTO `converse` VALUES (65, '61896362', '1824591386', '2022-07-24 16:12:27', '在', 1);
INSERT INTO `converse` VALUES (66, '1824591386', '61896362', '2022-07-24 16:27:18', '在', 1);
INSERT INTO `converse` VALUES (67, '1824591386', '61896362', '2022-07-24 16:27:46', '？？', 1);
INSERT INTO `converse` VALUES (68, '1824591386', '61896362', '2022-07-24 16:33:44', '。。。', 1);
INSERT INTO `converse` VALUES (69, '1824591386', '61896362', '2022-07-24 16:35:16', '。。。', 1);
INSERT INTO `converse` VALUES (70, '1824591386', '61896362', '2022-07-24 16:36:38', '。。。', 1);
INSERT INTO `converse` VALUES (71, '1824591386', '61896362', '2022-07-24 16:42:00', '，，，', 1);
INSERT INTO `converse` VALUES (72, '1824591386', '61896362', '2022-07-24 16:44:50', '。。。。', 1);
INSERT INTO `converse` VALUES (73, '1824591386', '61896362', '2022-07-24 16:46:22', '。。。。', 1);
INSERT INTO `converse` VALUES (74, '1824591386', '61896362', '2022-07-24 16:46:29', '。', 1);
INSERT INTO `converse` VALUES (75, '1824591386', '61896362', '2022-07-24 16:48:38', '给我行', 1);
INSERT INTO `converse` VALUES (76, '1824591386', '61896362', '2022-07-24 16:56:58', '。。', 1);
INSERT INTO `converse` VALUES (77, '1824591386', '61896362', '2022-07-24 17:23:23', '来啊', 1);
INSERT INTO `converse` VALUES (78, '1824591386', '61896362', '2022-07-24 17:25:02', '？？？', 1);
INSERT INTO `converse` VALUES (79, '1824591386', '61896362', '2022-07-24 17:30:05', '去你的', 1);
INSERT INTO `converse` VALUES (80, '1824591386', '61896362', '2022-07-24 17:33:14', '为什么不行', 1);
INSERT INTO `converse` VALUES (81, '1824591386', '61896362', '2022-07-24 17:34:20', '靠', 1);
INSERT INTO `converse` VALUES (82, '1824591386', '61896362', '2022-07-24 17:35:02', '可以哦', 1);
INSERT INTO `converse` VALUES (83, '1824591386', '61896362', '2022-07-24 17:35:31', '哭了', 1);
INSERT INTO `converse` VALUES (84, '1824591386', '61896362', '2022-07-24 17:39:03', '你们', 1);
INSERT INTO `converse` VALUES (85, '1824591386', '61896362', '2022-07-24 17:40:35', '？？？', 1);
INSERT INTO `converse` VALUES (86, '1824591386', '61896362', '2022-07-24 17:43:42', '。。。', 1);
INSERT INTO `converse` VALUES (87, '1824591386', '61896362', '2022-07-24 17:44:29', '没问题', 1);
INSERT INTO `converse` VALUES (88, '1824591386', '61896362', '2022-07-24 17:45:19', '哈哈哈', 1);
INSERT INTO `converse` VALUES (89, '1824591386', '61896362', '2022-07-24 17:47:01', '八嘎', 1);
INSERT INTO `converse` VALUES (90, '1824591386', '61896362', '2022-07-24 17:49:38', '这次必须行', 1);
INSERT INTO `converse` VALUES (91, '1824591386', '61896362', '2022-07-24 17:54:22', '八嘎', 1);
INSERT INTO `converse` VALUES (92, '1824591386', '61896362', '2022-07-24 17:54:29', '可以的', 1);
INSERT INTO `converse` VALUES (93, '1824591386', '61896362', '2022-07-24 17:56:40', '。。。', 1);
INSERT INTO `converse` VALUES (94, '1824591386', '61896362', '2022-07-24 18:00:05', '。。。', 1);
INSERT INTO `converse` VALUES (95, '1824591386', '61896362', '2022-07-24 18:04:02', '哈哈哈', 1);
INSERT INTO `converse` VALUES (96, '1824591386', '61896362', '2022-07-24 18:04:15', '哈哈', 1);
INSERT INTO `converse` VALUES (97, '1824591386', '61896362', '2022-07-24 18:04:20', '号', 1);
INSERT INTO `converse` VALUES (98, '61896362', '1824591386', '2022-07-25 09:15:46', '....', 1);
INSERT INTO `converse` VALUES (99, '61896362', '1824591386', '2022-07-25 09:19:55', '1111', 1);
INSERT INTO `converse` VALUES (100, '61896362', '1824591386', '2022-07-25 09:22:07', '1111', 1);
INSERT INTO `converse` VALUES (101, '1824591386', '61896362', '2022-07-25 09:24:31', '八嘎', 1);
INSERT INTO `converse` VALUES (102, '61896362', '1824591386', '2022-07-25 09:24:37', '????', 1);
INSERT INTO `converse` VALUES (103, '1824591386', '61896362', '2022-07-25 09:28:18', '真的服', 1);
INSERT INTO `converse` VALUES (104, '61896362', '1824591386', '2022-07-25 09:28:30', '??', 1);
INSERT INTO `converse` VALUES (105, '61896362', '1824591386', '2022-07-25 09:30:16', '1111', 1);
INSERT INTO `converse` VALUES (106, '1824591386', '61896362', '2022-07-25 09:30:22', '哈哈', 1);
INSERT INTO `converse` VALUES (107, '1824591386', '61896362', '2022-07-25 11:04:54', '？？？', 1);
INSERT INTO `converse` VALUES (108, '1824591386', '61896362', '2022-07-25 11:06:31', '。。。敏敏姐，虹膜后红魔馆红魔锁屏密您你明明虹膜破公交', 1);
INSERT INTO `converse` VALUES (109, '61896362', '1824591386', '2022-07-25 12:08:59', '可恶', 1);
INSERT INTO `converse` VALUES (110, '1824591386', '61896362', '2022-07-25 12:09:14', '？？？', 1);
INSERT INTO `converse` VALUES (111, '1824591386', '61896362', '2022-07-25 12:09:22', '@@@。', 1);
INSERT INTO `converse` VALUES (112, '1824591386', '61896362', '2022-07-26 19:18:12', '？？？', 1);
INSERT INTO `converse` VALUES (113, '1824591386', '61896362', '2022-07-26 19:23:33', '八嘎', 1);
INSERT INTO `converse` VALUES (114, '1824591386', '61896362', '2022-07-26 19:24:45', '还可以哦', 1);
INSERT INTO `converse` VALUES (115, '1824591386', '61896362', '2022-07-26 19:24:48', '哈哈', 1);
INSERT INTO `converse` VALUES (116, '1824591386', '61896362', '2022-07-26 19:24:54', '终于可以了', 1);
INSERT INTO `converse` VALUES (117, '1824591386', '61896362', '2022-07-26 19:24:58', '你妈的', 1);
INSERT INTO `converse` VALUES (118, '1824591386', '61896362', '2022-07-26 19:50:37', '？？？', 1);
INSERT INTO `converse` VALUES (119, '1824591386', '61896362', '2022-07-26 20:03:11', '哈哈', 1);
INSERT INTO `converse` VALUES (120, '1824591386', '61896362', '2022-08-05 16:12:58', 'giao', 1);
INSERT INTO `converse` VALUES (121, '1824591386', '18740324', '2022-08-05 17:14:11', '八嘎', 1);
INSERT INTO `converse` VALUES (122, '1824591386', '34055170', '2022-08-08 12:15:05', '八嘎雅鹿', 1);
INSERT INTO `converse` VALUES (123, '1824591386', '34055170', '2022-08-08 13:58:51', '还可以的', 1);
INSERT INTO `converse` VALUES (124, '1824591386', '34055170', '2022-08-08 14:03:08', '？？？', 1);
INSERT INTO `converse` VALUES (125, '1824591386', '34055170', '2022-08-08 14:04:25', '八嘎雅鹿', 1);
INSERT INTO `converse` VALUES (126, '34055170', '1824591386', '2022-08-08 14:04:57', '.....', 1);
INSERT INTO `converse` VALUES (127, '1824591386', '71158', '2022-08-09 19:35:05', '在吗', 1);
INSERT INTO `converse` VALUES (128, '1824591386', '71158', '2022-08-09 19:35:09', 'giao', 1);
INSERT INTO `converse` VALUES (129, '1824591386', '71158', '2022-08-09 19:35:16', '无话', 1);
INSERT INTO `converse` VALUES (130, '1824591386', '71158', '2022-08-09 19:36:13', '嘿嘿', 1);
INSERT INTO `converse` VALUES (131, '1824591386', '71158', '2022-08-09 19:42:24', '可以吗？', 1);
INSERT INTO `converse` VALUES (132, '1824591386', '71158', '2022-08-09 19:43:01', '可以吗', 1);
INSERT INTO `converse` VALUES (133, '21810015', '1824591386', '2022-08-13 14:17:18', 'hai', 1);
INSERT INTO `converse` VALUES (134, '21810015', '1824591386', '2022-08-13 14:38:26', 'haihaihai', 1);
INSERT INTO `converse` VALUES (135, '21810015', '1824591386', '2022-08-13 14:43:43', 'hehehe', 1);
INSERT INTO `converse` VALUES (136, '21810015', '1824591386', '2022-08-13 14:44:34', '......', 1);
INSERT INTO `converse` VALUES (137, '21810015', '1824591386', '2022-08-13 14:53:41', '.......', 1);
INSERT INTO `converse` VALUES (138, '21810015', '1824591386', '2022-08-13 14:56:30', 'keyile', 1);
INSERT INTO `converse` VALUES (139, '1824591386', '21810015', '2022-08-13 14:57:32', '哇很烦', 1);
INSERT INTO `converse` VALUES (140, '1824591386', '21810015', '2022-08-13 14:58:25', '？', 1);
INSERT INTO `converse` VALUES (141, '1824591386', '21810015', '2022-08-13 15:01:02', '糊弄我', 1);
INSERT INTO `converse` VALUES (142, '1824591386', '21810015', '2022-08-13 15:04:08', '可以的', 1);
INSERT INTO `converse` VALUES (143, '1824591386', '21810015', '2022-08-13 15:04:50', '我就知道', 1);
INSERT INTO `converse` VALUES (144, '1824591386', '21810015', '2022-08-13 15:06:45', '请全部带走', 1);
INSERT INTO `converse` VALUES (145, '1824591386', '21810015', '2022-08-13 15:09:48', '我愿用一生等待', 1);
INSERT INTO `converse` VALUES (146, '1824591386', '21810015', '2022-08-13 15:16:33', '。。。。', 1);
INSERT INTO `converse` VALUES (147, '1824591386', '21810015', '2022-08-13 16:01:11', '。。。', 1);
INSERT INTO `converse` VALUES (148, '1824591386', '21810015', '2022-08-13 16:02:03', '。。。。', 1);
INSERT INTO `converse` VALUES (149, '1824591386', '21810015', '2022-08-13 16:19:45', '？', 1);
INSERT INTO `converse` VALUES (150, '1824591386', '21810015', '2022-08-13 16:31:56', '回话', 1);
INSERT INTO `converse` VALUES (151, '1824591386', '21810015', '2022-08-13 16:34:44', '？？？', 1);
INSERT INTO `converse` VALUES (152, '1824591386', '21810015', '2022-08-13 16:35:09', '靠', 1);
INSERT INTO `converse` VALUES (153, '1824591386', '21810015', '2022-08-13 16:46:12', '测试', 1);
INSERT INTO `converse` VALUES (154, '1824591386', '21810015', '2022-08-13 16:52:37', '可以吗', 1);
INSERT INTO `converse` VALUES (155, '1824591386', '21810015', '2022-08-13 16:59:03', '。。。。', 1);
INSERT INTO `converse` VALUES (156, '1824591386', '21810015', '2022-08-13 17:15:39', '如何', 1);
INSERT INTO `converse` VALUES (157, '1824591386', '21810015', '2022-08-13 17:43:04', '八嘎', 2);
INSERT INTO `converse` VALUES (158, '1824591386', '18740324', '2022-08-13 17:43:12', '八嘎', 1);
INSERT INTO `converse` VALUES (159, '1824591386', '18740324', '2022-08-13 17:48:04', '骑着单车的我俩', 1);
INSERT INTO `converse` VALUES (160, '1824591386', '18740324', '2022-08-13 17:52:25', '好耶', 1);
INSERT INTO `converse` VALUES (161, '1824591386', '18740324', '2022-08-13 17:52:47', '@@@', 1);
INSERT INTO `converse` VALUES (162, '140143', '61896362', '2022-08-14 09:37:28', '可以吗', 1);
INSERT INTO `converse` VALUES (163, '61896362', '140143', '2022-08-14 09:37:52', 'keyi', 1);
INSERT INTO `converse` VALUES (164, '140143', '61896362', '2022-08-14 09:42:02', '好吧', 1);
INSERT INTO `converse` VALUES (165, '140143', '221078660', '2022-08-14 09:43:54', '可以不', 1);
INSERT INTO `converse` VALUES (166, '140143', '221078660', '2022-08-14 09:44:42', '。。。。', 1);
INSERT INTO `converse` VALUES (167, '140143', '221078660', '2022-08-14 09:45:36', '。。，', 1);
INSERT INTO `converse` VALUES (168, '140143', '221078660', '2022-08-14 09:50:44', '来啊', 1);
INSERT INTO `converse` VALUES (169, '140143', '221078660', '2022-08-14 09:52:33', '可以不', 1);
INSERT INTO `converse` VALUES (170, '140143', '988074153', '2022-08-14 09:55:09', '你好', 1);
INSERT INTO `converse` VALUES (171, '140143', '988074153', '2022-08-14 10:02:25', '。。。。', 1);
INSERT INTO `converse` VALUES (172, '140143', '50605', '2022-08-14 10:04:06', '@。。。', 1);
INSERT INTO `converse` VALUES (173, '140143', '50605', '2022-08-14 10:26:01', '还可以的', 1);
INSERT INTO `converse` VALUES (174, '140143', '50605', '2022-08-14 10:26:20', '哈哈哈', 1);
INSERT INTO `converse` VALUES (175, '140143', '50605', '2022-08-14 10:29:19', '。。。。', 1);
INSERT INTO `converse` VALUES (176, '140143', '50605', '2022-08-14 10:29:31', '还可以的', 1);
INSERT INTO `converse` VALUES (177, '140143', '50605', '2022-08-14 10:30:20', '可以不', 1);
INSERT INTO `converse` VALUES (178, '140143', '50605', '2022-08-14 10:30:31', '？？', 1);
INSERT INTO `converse` VALUES (179, '140143', '50605', '2022-08-14 10:30:36', '。。，，', 1);
INSERT INTO `converse` VALUES (180, '140143', '50605', '2022-08-14 10:30:58', '？？？', 1);
INSERT INTO `converse` VALUES (181, '140143', '50605', '2022-08-14 10:31:02', '。。。', 1);
INSERT INTO `converse` VALUES (182, '140143', '50605', '2022-08-14 10:31:08', '啊', 1);
INSERT INTO `converse` VALUES (183, '140143', '50605', '2022-08-14 10:32:19', '炒', 1);
INSERT INTO `converse` VALUES (184, '140143', '50605', '2022-08-14 10:32:22', '，。，', 1);
INSERT INTO `converse` VALUES (185, '140143', '50605', '2022-08-14 10:32:25', '？？？', 1);
INSERT INTO `converse` VALUES (186, '140143', '50605', '2022-08-14 10:32:43', '。。。。', 1);
INSERT INTO `converse` VALUES (187, '140143', '50605', '2022-08-14 10:33:31', '为什么不行', 1);
INSERT INTO `converse` VALUES (188, '140143', '50605', '2022-08-14 10:33:35', '可以吧', 1);
INSERT INTO `converse` VALUES (189, '140143', '50605', '2022-08-14 10:33:45', '？？？？', 1);
INSERT INTO `converse` VALUES (190, '140143', '50605', '2022-08-14 10:36:02', '不对吗', 1);
INSERT INTO `converse` VALUES (191, '140143', '50605', '2022-08-14 10:36:08', '很对啊', 1);
INSERT INTO `converse` VALUES (192, '140143', '50605', '2022-08-14 10:36:31', '点', 1);
INSERT INTO `converse` VALUES (193, '140143', '50605', '2022-08-14 10:37:09', '粑粑', 1);
INSERT INTO `converse` VALUES (194, '140143', '50605', '2022-08-14 10:37:13', '。。。。', 1);
INSERT INTO `converse` VALUES (195, '140143', '50605', '2022-08-14 10:37:17', '还可以的', 1);
INSERT INTO `converse` VALUES (196, '140143', '50605', '2022-08-14 10:43:00', 'bug王', 1);
INSERT INTO `converse` VALUES (197, '140143', '50605', '2022-08-14 10:43:51', '。。。。', 1);
INSERT INTO `converse` VALUES (198, '140143', '50605', '2022-08-14 10:44:02', '还可以的', 1);
INSERT INTO `converse` VALUES (199, '140143', '50605', '2022-08-14 10:56:15', '。。。', 1);
INSERT INTO `converse` VALUES (200, '140143', '446336', '2022-08-14 10:57:45', '八嘎', 1);
INSERT INTO `converse` VALUES (201, '140143', '446336', '2022-08-14 11:02:23', '为什哦哦啊', 1);
INSERT INTO `converse` VALUES (202, '140143', '446336', '2022-08-14 11:02:33', '？？？？', 1);
INSERT INTO `converse` VALUES (203, '140143', '446336', '2022-08-14 11:03:07', '炒', 1);
INSERT INTO `converse` VALUES (204, '140143', '446336', '2022-08-14 11:03:11', '。。。。', 1);
INSERT INTO `converse` VALUES (205, '140143', '446336', '2022-08-14 11:03:28', '这样的吗', 1);
INSERT INTO `converse` VALUES (206, '140143', '446336', '2022-08-14 11:03:38', '啊哈哈', 1);
INSERT INTO `converse` VALUES (207, '140143', '446336', '2022-08-14 11:03:41', '。。。', 1);
INSERT INTO `converse` VALUES (208, '140143', '446336', '2022-08-14 11:05:24', '如果这样', 1);
INSERT INTO `converse` VALUES (209, '140143', '446336', '2022-08-14 11:05:33', '的话', 1);
INSERT INTO `converse` VALUES (210, '140143', '446336', '2022-08-14 11:05:37', '。。。', 1);
INSERT INTO `converse` VALUES (211, '140143', '446336', '2022-08-14 11:05:42', '。。', 1);
INSERT INTO `converse` VALUES (212, '140143', '446336', '2022-08-14 11:11:51', '我也', 1);
INSERT INTO `converse` VALUES (213, '140143', '446336', '2022-08-14 11:11:53', '黑白', 1);
INSERT INTO `converse` VALUES (214, '140143', '446336', '2022-08-14 11:11:56', '哈哈哈哈', 1);
INSERT INTO `converse` VALUES (215, '140143', '446336', '2022-08-14 11:12:02', '但是', 1);
INSERT INTO `converse` VALUES (216, '140143', '446336', '2022-08-14 11:12:06', '这能的话', 1);
INSERT INTO `converse` VALUES (217, '140143', '446336', '2022-08-14 11:12:14', '咋办', 1);
INSERT INTO `converse` VALUES (218, '140143', '446336', '2022-08-14 11:12:19', '。。。', 1);
INSERT INTO `converse` VALUES (219, '140143', '446336', '2022-08-14 11:12:44', '可以的', 1);
INSERT INTO `converse` VALUES (220, '140143', '446336', '2022-08-14 11:12:55', '啊啊啊哎', 1);
INSERT INTO `converse` VALUES (221, '140143', '446336', '2022-08-14 11:12:59', '哎呦', 1);
INSERT INTO `converse` VALUES (222, '140143', '446336', '2022-08-14 11:13:06', '又可以了', 1);
INSERT INTO `converse` VALUES (223, '140143', '446336', '2022-08-14 11:13:11', '。。。。', 1);
INSERT INTO `converse` VALUES (224, '140143', '446336', '2022-08-14 11:13:41', '啊啊啊', 1);
INSERT INTO `converse` VALUES (225, '140143', '446336', '2022-08-14 11:15:53', '啊哈哈', 1);
INSERT INTO `converse` VALUES (226, '140143', '446336', '2022-08-14 11:17:41', '无语了', 1);
INSERT INTO `converse` VALUES (227, '140143', '446336', '2022-08-14 11:23:07', '炒', 1);
INSERT INTO `converse` VALUES (228, '140143', '446336', '2022-08-14 11:23:11', '。。。', 1);
INSERT INTO `converse` VALUES (229, '140143', '446336', '2022-08-14 11:23:29', '现在呢', 1);
INSERT INTO `converse` VALUES (230, '140143', '446336', '2022-08-14 11:24:30', '可以吗', 1);
INSERT INTO `converse` VALUES (231, '140143', '446336', '2022-08-14 11:24:35', '。。。', 1);
INSERT INTO `converse` VALUES (232, '140143', '446336', '2022-08-14 11:24:47', '炒', 1);
INSERT INTO `converse` VALUES (233, '140143', '446336', '2022-08-14 11:25:13', '。。。。', 1);
INSERT INTO `converse` VALUES (234, '140143', '446336', '2022-08-14 11:25:18', '。。。', 1);
INSERT INTO `converse` VALUES (235, '140143', '446336', '2022-08-14 11:27:42', '提示', 1);
INSERT INTO `converse` VALUES (236, '140143', '446336', '2022-08-14 11:27:47', '可以吗', 1);
INSERT INTO `converse` VALUES (237, '140143', '446336', '2022-08-14 11:30:53', '。。。。', 1);
INSERT INTO `converse` VALUES (238, '140143', '446336', '2022-08-14 11:30:58', '可以', 1);
INSERT INTO `converse` VALUES (239, '140143', '446336', '2022-08-14 11:31:53', '？？？', 1);
INSERT INTO `converse` VALUES (240, '140143', '446336', '2022-08-14 11:31:58', '这样的吗', 1);
INSERT INTO `converse` VALUES (241, '140143', '446336', '2022-08-14 11:32:01', '。。。', 1);
INSERT INTO `converse` VALUES (242, '140143', '446336', '2022-08-14 11:32:08', '如果', 1);
INSERT INTO `converse` VALUES (243, '140143', '446336', '2022-08-14 11:32:30', '。。', 1);
INSERT INTO `converse` VALUES (244, '140143', '446336', '2022-08-14 11:32:35', '@。', 1);
INSERT INTO `converse` VALUES (245, '140143', '446336', '2022-08-14 11:34:56', '好吧', 1);
INSERT INTO `converse` VALUES (246, '140143', '446336', '2022-08-14 11:35:04', '可以的', 1);
INSERT INTO `converse` VALUES (247, '446336', '140143', '2022-08-14 19:42:12', 'haha', 1);
INSERT INTO `converse` VALUES (248, '140143', '446336', '2022-08-14 19:42:20', '哦豁', 1);
INSERT INTO `converse` VALUES (249, '446336', '140143', '2022-08-14 19:42:30', '....', 1);
INSERT INTO `converse` VALUES (250, '140143', '446336', '2022-08-14 19:42:39', '。。。。', 1);
INSERT INTO `converse` VALUES (251, '140143', '446336', '2022-08-14 19:42:43', '。。。', 1);
INSERT INTO `converse` VALUES (252, '140143', '446336', '2022-08-14 19:42:47', '，，，', 1);
INSERT INTO `converse` VALUES (253, '140143', '446336', '2022-08-14 19:48:08', '炒', 1);
INSERT INTO `converse` VALUES (254, '140143', '446336', '2022-08-14 19:48:25', '。。。。', 1);
INSERT INTO `converse` VALUES (255, '140143', '446336', '2022-08-14 19:48:38', '可以', 1);
INSERT INTO `converse` VALUES (256, '140143', '446336', '2022-08-14 19:56:29', '哦豁', 1);
INSERT INTO `converse` VALUES (257, '140143', '446336', '2022-08-14 20:02:13', '。。。', 1);
INSERT INTO `converse` VALUES (258, '140143', '446336', '2022-08-14 20:02:16', '，，，', 1);
INSERT INTO `converse` VALUES (259, '140143', '1824591386', '2022-08-14 20:05:28', '来来来', 1);
INSERT INTO `converse` VALUES (260, '140143', '1824591386', '2022-08-14 20:05:31', '。。。', 1);
INSERT INTO `converse` VALUES (261, '140143', '1824591386', '2022-08-14 20:06:40', '可以的', 1);
INSERT INTO `converse` VALUES (262, '140143', '1824591386', '2022-08-14 20:06:50', '啊？', 1);
INSERT INTO `converse` VALUES (263, '140143', '1824591386', '2022-08-14 20:06:55', '。。。', 1);
INSERT INTO `converse` VALUES (264, '140143', '1824591386', '2022-08-14 20:06:59', '哦豁', 1);
INSERT INTO `converse` VALUES (265, '14508339', '1824591386', '2022-08-14 21:11:51', '来咯', 1);
INSERT INTO `converse` VALUES (266, '14508339', '1824591386', '2022-08-14 21:18:19', '？？', 1);
INSERT INTO `converse` VALUES (267, '14508339', '1824591386', '2022-08-14 21:18:59', '哈哈', 1);
INSERT INTO `converse` VALUES (268, '14508339', '1824591386', '2022-08-14 21:20:30', 'ddd', 1);
INSERT INTO `converse` VALUES (269, '14508339', '1824591386', '2022-08-14 21:20:59', 'aaaa', 1);
INSERT INTO `converse` VALUES (270, '14508339', '1824591386', '2022-08-14 21:29:12', '...', 1);
INSERT INTO `converse` VALUES (271, '14508339', '1824591386', '2022-08-14 21:29:43', '这样的吗', 1);
INSERT INTO `converse` VALUES (272, '1824591386', '14508339', '2022-08-15 10:28:07', '没错', 1);
INSERT INTO `converse` VALUES (273, '1824591386', '14508339', '2022-08-15 10:28:17', '哈哈', 1);
INSERT INTO `converse` VALUES (274, '14508339', '1824591386', '2022-08-15 10:28:23', '11', 1);
INSERT INTO `converse` VALUES (275, '14508339', '1824591386', '2022-08-15 10:28:55', '2222', 1);
INSERT INTO `converse` VALUES (276, '14508339', '1824591386', '2022-08-15 10:34:13', '111', 1);
INSERT INTO `converse` VALUES (277, '14508339', '1824591386', '2022-08-15 10:35:05', '???', 1);
INSERT INTO `converse` VALUES (278, '14508339', '1824591386', '2022-08-15 10:35:45', '???', 1);
INSERT INTO `converse` VALUES (279, '1824591386', '14508339', '2022-08-15 10:36:17', '@@。。', 1);
INSERT INTO `converse` VALUES (280, '1824591386', '14508339', '2022-08-15 10:36:25', '。。。', 1);
INSERT INTO `converse` VALUES (281, '14508339', '1824591386', '2022-08-15 10:42:44', '111', 1);
INSERT INTO `converse` VALUES (282, '14508339', '1824591386', '2022-08-15 11:02:07', '111', 1);
INSERT INTO `converse` VALUES (283, '14508339', '1824591386', '2022-08-15 11:10:23', 'ok', 1);
INSERT INTO `converse` VALUES (284, '14508339', '1824591386', '2022-08-15 11:10:32', '111', 1);
INSERT INTO `converse` VALUES (285, '14508339', '1824591386', '2022-08-15 11:18:37', '111', 1);
INSERT INTO `converse` VALUES (286, '14508339', '1824591386', '2022-08-15 11:19:14', '11', 1);
INSERT INTO `converse` VALUES (287, '14508339', '1824591386', '2022-08-15 11:20:38', '1', 1);
INSERT INTO `converse` VALUES (288, '14508339', '1824591386', '2022-08-15 11:25:12', '111', 1);
INSERT INTO `converse` VALUES (289, '14508339', '1824591386', '2022-08-15 11:25:36', '111', 1);
INSERT INTO `converse` VALUES (290, '14508339', '1824591386', '2022-08-15 11:25:38', 'qqqq', 1);
INSERT INTO `converse` VALUES (291, '14508339', '1824591386', '2022-08-15 11:28:06', '111', 1);
INSERT INTO `converse` VALUES (292, '14508339', '1824591386', '2022-08-15 11:32:59', '11111', 1);
INSERT INTO `converse` VALUES (293, '14508339', '1824591386', '2022-08-15 11:37:26', '111', 1);
INSERT INTO `converse` VALUES (294, '14508339', '1824591386', '2022-08-15 11:37:34', 'qqqq', 1);
INSERT INTO `converse` VALUES (295, '14508339', '1824591386', '2022-08-15 11:37:54', '111', 1);
INSERT INTO `converse` VALUES (296, '14508339', '1824591386', '2022-08-15 11:38:00', 'dfsfs', 1);
INSERT INTO `converse` VALUES (297, '14508339', '1824591386', '2022-08-15 11:38:29', '111', 1);
INSERT INTO `converse` VALUES (298, '14508339', '1824591386', '2022-08-15 11:39:05', '111', 1);
INSERT INTO `converse` VALUES (299, '14508339', '1824591386', '2022-08-15 13:45:54', '111', 1);
INSERT INTO `converse` VALUES (300, '1824591386', '14508339', '2022-08-15 13:48:57', '，。，', 1);
INSERT INTO `converse` VALUES (301, '1824591386', '14508339', '2022-08-15 13:49:14', '？？？？', 1);
INSERT INTO `converse` VALUES (302, '1824591386', '14508339', '2022-08-15 13:49:38', '八嘎', 1);
INSERT INTO `converse` VALUES (303, '1824591386', '14508339', '2022-08-15 13:50:27', '。。。', 1);
INSERT INTO `converse` VALUES (304, '1824591386', '14508339', '2022-08-15 13:50:58', '，，，', 1);
INSERT INTO `converse` VALUES (305, '14508339', '1824591386', '2022-08-15 13:51:23', '1111', 1);
INSERT INTO `converse` VALUES (306, '14508339', '1824591386', '2022-08-15 13:59:11', '111', 1);
INSERT INTO `converse` VALUES (307, '1824591386', '14508339', '2022-08-15 13:59:37', '。。。，', 1);
INSERT INTO `converse` VALUES (308, '1824591386', '14508339', '2022-08-15 13:59:41', '。，，', 1);
INSERT INTO `converse` VALUES (309, '1824591386', '14508339', '2022-08-15 14:00:06', '。，，，', 1);
INSERT INTO `converse` VALUES (310, '14508339', '1824591386', '2022-08-15 14:02:14', 'hj', 1);
INSERT INTO `converse` VALUES (311, '1824591386', '14508339', '2022-08-15 14:02:27', '。。。', 1);
INSERT INTO `converse` VALUES (312, '14508339', '1824591386', '2022-08-15 14:07:30', '1111', 1);
INSERT INTO `converse` VALUES (313, '14508339', '1824591386', '2022-08-15 14:07:40', '?', 1);
INSERT INTO `converse` VALUES (314, '14508339', '1824591386', '2022-08-15 14:09:04', '1111', 1);
INSERT INTO `converse` VALUES (315, '14508339', '1824591386', '2022-08-15 14:10:20', '1', 1);
INSERT INTO `converse` VALUES (316, '14508339', '1824591386', '2022-08-15 14:10:24', '1111', 1);
INSERT INTO `converse` VALUES (317, '1824591386', '14508339', '2022-08-15 14:10:36', '，，，', 1);
INSERT INTO `converse` VALUES (318, '14508339', '1824591386', '2022-08-15 14:15:39', '111', 1);
INSERT INTO `converse` VALUES (319, '14508339', '1824591386', '2022-08-15 14:19:18', '11111', 1);
INSERT INTO `converse` VALUES (320, '14508339', '1824591386', '2022-08-15 14:19:24', 'sss', 1);
INSERT INTO `converse` VALUES (321, '14508339', '1824591386', '2022-08-15 14:20:09', '1111', 1);
INSERT INTO `converse` VALUES (322, '14508339', '1824591386', '2022-08-15 14:22:33', '111', 1);
INSERT INTO `converse` VALUES (323, '14508339', '1824591386', '2022-08-15 14:24:36', '111', 1);
INSERT INTO `converse` VALUES (324, '14508339', '1824591386', '2022-08-15 14:28:33', '1111', 1);
INSERT INTO `converse` VALUES (325, '14508339', '1824591386', '2022-08-15 14:30:57', '1a', 1);
INSERT INTO `converse` VALUES (326, '14508339', '1824591386', '2022-08-15 14:31:36', 'sdfs', 1);
INSERT INTO `converse` VALUES (327, '14508339', '1824591386', '2022-08-15 14:33:21', 's', 1);
INSERT INTO `converse` VALUES (328, '14508339', '1824591386', '2022-08-15 14:33:49', '1111', 1);
INSERT INTO `converse` VALUES (329, '14508339', '1824591386', '2022-08-15 14:34:50', 'ssss', 1);
INSERT INTO `converse` VALUES (330, '14508339', '1824591386', '2022-08-15 14:36:03', '222', 1);
INSERT INTO `converse` VALUES (331, '14508339', '1824591386', '2022-08-15 14:45:46', '111', 1);
INSERT INTO `converse` VALUES (332, '14508339', '1824591386', '2022-08-15 14:48:34', '1', 1);
INSERT INTO `converse` VALUES (333, '14508339', '1824591386', '2022-08-15 14:48:41', 'ok', 1);
INSERT INTO `converse` VALUES (334, '14508339', '1824591386', '2022-08-15 14:48:45', 'dsdfsdf', 1);
INSERT INTO `converse` VALUES (335, '14508339', '1824591386', '2022-08-15 14:49:20', 'sdfsdf', 1);
INSERT INTO `converse` VALUES (336, '14508339', '1824591386', '2022-08-15 14:49:22', '111', 1);
INSERT INTO `converse` VALUES (337, '14508339', '1824591386', '2022-08-15 14:49:25', 'ssss', 1);
INSERT INTO `converse` VALUES (338, '14508339', '1824591386', '2022-08-15 14:49:37', 'ddd', 1);
INSERT INTO `converse` VALUES (339, '14508339', '1824591386', '2022-08-15 14:55:13', '1111', 1);
INSERT INTO `converse` VALUES (340, '14508339', '1824591386', '2022-08-15 14:55:20', 'sssss', 1);
INSERT INTO `converse` VALUES (341, '1824591386', '14508339', '2022-08-15 14:56:56', '。。。', 1);
INSERT INTO `converse` VALUES (342, '1824591386', '14508339', '2022-08-15 14:57:07', '@@@', 1);
INSERT INTO `converse` VALUES (343, '1824591386', '14508339', '2022-08-18 14:05:32', '答应我', 1);
INSERT INTO `converse` VALUES (344, '1824591386', '14508339', '2022-08-18 14:05:41', '好吗', 1);
INSERT INTO `converse` VALUES (345, '14508339', '1824591386', '2022-08-18 14:05:51', 'ok', 1);
INSERT INTO `converse` VALUES (346, '14508339', '1824591386', '2022-08-18 14:06:18', '??', 1);
INSERT INTO `converse` VALUES (347, '14508339', '1824591386', '2022-08-18 14:06:32', 'wo', 1);
INSERT INTO `converse` VALUES (348, '1824591386', '14508339', '2022-08-18 14:06:46', '去你的', 1);
INSERT INTO `converse` VALUES (349, '14508339', '1824591386', '2022-08-18 14:07:04', '......', 1);
INSERT INTO `converse` VALUES (350, '14508339', '1824591386', '2022-08-18 14:08:14', '这', 1);
INSERT INTO `converse` VALUES (351, '14508339', '1824591386', '2022-08-18 14:08:30', '1111', 1);
INSERT INTO `converse` VALUES (352, '14508339', '1824591386', '2022-08-18 14:09:25', '这么说', 1);
INSERT INTO `converse` VALUES (353, '14508339', '1824591386', '2022-08-18 14:09:36', '可以', 1);
INSERT INTO `converse` VALUES (354, '14508339', '1824591386', '2022-08-18 14:25:23', '1111', 1);
INSERT INTO `converse` VALUES (355, '14508339', '1824591386', '2022-08-18 14:25:34', '哦炯炯扥三', 1);
INSERT INTO `converse` VALUES (356, '1824591386', '14508339', '2022-08-18 14:25:42', '@。。。', 1);
INSERT INTO `converse` VALUES (357, '1824591386', '14508339', '2022-08-18 14:25:50', '给你弄', 1);
INSERT INTO `converse` VALUES (358, '1824591386', '14508339', '2022-08-18 14:26:51', '可以', 1);
INSERT INTO `converse` VALUES (359, '1824591386', '14508339', '2022-08-18 14:26:55', '给你', 1);
INSERT INTO `converse` VALUES (360, '14508339', '1824591386', '2022-08-18 14:27:04', '。。。。', 1);
INSERT INTO `converse` VALUES (361, '1824591386', '14508339', '2022-08-18 14:27:40', '再开始', 1);
INSERT INTO `converse` VALUES (362, '14508339', '1824591386', '2022-08-18 14:27:47', '111', 1);
INSERT INTO `converse` VALUES (363, '14508339', '1824591386', '2022-08-18 14:27:51', '11114456', 1);
INSERT INTO `converse` VALUES (364, '14508339', '1824591386', '2022-08-18 14:34:33', '1111', 1);
INSERT INTO `converse` VALUES (365, '14508339', '1824591386', '2022-08-18 14:37:03', '1112', 1);
INSERT INTO `converse` VALUES (366, '14508339', '1824591386', '2022-08-18 14:38:00', '测试', 1);
INSERT INTO `converse` VALUES (367, '1824591386', '5542184521', '2022-08-19 19:54:32', '晚上好', 1);
INSERT INTO `converse` VALUES (368, '1824591386', '5542184521', '2022-08-19 19:55:31', '嗨害嗨，来咯', 1);
INSERT INTO `converse` VALUES (369, '1824591386', '5542184521', '2022-08-19 19:56:58', '乌拉', 1);
INSERT INTO `converse` VALUES (370, '1824591386', '5542184521', '2022-08-19 19:58:04', '呜呜呜', 1);
INSERT INTO `converse` VALUES (371, '5542184521', '1824591386', '2022-08-19 20:00:06', '哈哈哈', 1);
INSERT INTO `converse` VALUES (372, '1824591386', '662346', '2022-08-27 17:57:17', 'hh', 1);
INSERT INTO `converse` VALUES (373, '1824591386', '662346', '2022-08-27 17:57:35', '2222', 1);
INSERT INTO `converse` VALUES (374, '662346', '1824591386', '2022-08-27 17:57:46', '，，，', 1);
INSERT INTO `converse` VALUES (375, '662346', '1824591386', '2022-08-27 17:57:53', '好吧', 1);

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend`  (
  `friendId` int(0) NOT NULL AUTO_INCREMENT COMMENT '好友编号',
  `userId` int(0) NOT NULL COMMENT '用户编号',
  `contactId` int(0) NOT NULL COMMENT '联系人编号',
  `contactGroupId` int(0) NOT NULL COMMENT '联系人分组编号',
  `createdTime` datetime(0) NOT NULL COMMENT '添加好友时间',
  `isFavor` tinyint(1) UNSIGNED ZEROFILL NOT NULL COMMENT '是否特别关心',
  `nameMem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`friendId`) USING BTREE,
  INDEX `FK_FRIEND_CONTACT_ID`(`contactId`) USING BTREE,
  INDEX `FK_FRIEND_CONTACT_GROUP_ID`(`contactGroupId`) USING BTREE,
  INDEX `FK_FRIEND_USER_ID`(`userId`) USING BTREE,
  CONSTRAINT `FK_FRIEND_CONTACT_GROUP_ID` FOREIGN KEY (`contactGroupId`) REFERENCES `contact_group` (`groupId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_FRIEND_CONTACT_ID` FOREIGN KEY (`contactId`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_FRIEND_USER_ID` FOREIGN KEY (`userId`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES (1, 11, 1, 11, '2022-07-18 17:30:07', 0, '');
INSERT INTO `friend` VALUES (2, 1, 11, 2, '2022-07-18 17:30:07', 0, NULL);
INSERT INTO `friend` VALUES (3, 12, 1, 12, '2022-07-19 19:56:33', 0, '');
INSERT INTO `friend` VALUES (4, 1, 12, 2, '2022-07-19 19:56:33', 0, NULL);
INSERT INTO `friend` VALUES (5, 13, 1, 14, '2022-07-20 14:39:34', 0, '');
INSERT INTO `friend` VALUES (6, 1, 13, 2, '2022-07-20 14:39:34', 0, NULL);
INSERT INTO `friend` VALUES (7, 1, 5, 1, '2022-07-22 09:08:50', 0, '');
INSERT INTO `friend` VALUES (8, 5, 1, 2, '2022-07-22 09:08:50', 0, NULL);
INSERT INTO `friend` VALUES (11, 5, 12, 2, '2022-07-24 14:26:04', 0, '');
INSERT INTO `friend` VALUES (12, 12, 5, 2, '2022-07-24 14:26:04', 0, NULL);
INSERT INTO `friend` VALUES (15, 6, 1, 3, '2022-08-05 16:37:33', 0, '');
INSERT INTO `friend` VALUES (16, 1, 6, 2, '2022-08-05 16:37:33', 0, NULL);
INSERT INTO `friend` VALUES (17, 14, 1, 17, '2022-08-05 17:09:02', 0, '');
INSERT INTO `friend` VALUES (18, 1, 14, 2, '2022-08-05 17:09:02', 0, NULL);
INSERT INTO `friend` VALUES (19, 15, 1, 19, '2022-08-05 21:00:56', 0, '');
INSERT INTO `friend` VALUES (20, 1, 15, 2, '2022-08-05 21:00:56', 0, NULL);
INSERT INTO `friend` VALUES (21, 16, 1, 21, '2022-08-07 20:49:28', 0, '');
INSERT INTO `friend` VALUES (22, 1, 16, 2, '2022-08-07 20:49:28', 0, NULL);
INSERT INTO `friend` VALUES (23, 17, 1, 23, '2022-08-07 20:56:46', 0, '');
INSERT INTO `friend` VALUES (24, 1, 17, 2, '2022-08-07 20:56:46', 0, NULL);
INSERT INTO `friend` VALUES (25, 18, 1, 25, '2022-08-07 21:16:39', 0, '');
INSERT INTO `friend` VALUES (26, 1, 18, 1, '2022-08-07 21:16:39', 0, 'xiyangyang');
INSERT INTO `friend` VALUES (27, 19, 1, 27, '2022-08-07 21:26:43', 0, '');
INSERT INTO `friend` VALUES (28, 1, 19, 1, '2022-08-07 21:26:43', 0, '');
INSERT INTO `friend` VALUES (29, 23, 1, 35, '2022-08-09 19:34:55', 0, '');
INSERT INTO `friend` VALUES (30, 1, 23, 1, '2022-08-09 19:34:55', 0, '');
INSERT INTO `friend` VALUES (31, 24, 1, 37, '2022-08-10 10:50:04', 0, '');
INSERT INTO `friend` VALUES (32, 1, 24, 1, '2022-08-10 10:50:04', 0, '');
INSERT INTO `friend` VALUES (33, 27, 1, 41, '2022-08-13 13:59:28', 0, '');
INSERT INTO `friend` VALUES (34, 1, 27, 1, '2022-08-13 13:59:28', 0, '');
INSERT INTO `friend` VALUES (35, 28, 1, 43, '2022-08-13 14:16:18', 0, '');
INSERT INTO `friend` VALUES (36, 1, 28, 1, '2022-08-13 14:16:18', 0, '');
INSERT INTO `friend` VALUES (37, 7, 5, 4, '2022-08-14 09:37:17', 0, '');
INSERT INTO `friend` VALUES (38, 5, 7, 2, '2022-08-14 09:37:17', 0, '');
INSERT INTO `friend` VALUES (39, 11, 7, 11, '2022-08-14 09:43:02', 0, '');
INSERT INTO `friend` VALUES (40, 7, 11, 4, '2022-08-14 09:43:02', 0, '');
INSERT INTO `friend` VALUES (41, 12, 7, 13, '2022-08-14 09:54:53', 0, '');
INSERT INTO `friend` VALUES (42, 7, 12, 4, '2022-08-14 09:54:53', 0, '');
INSERT INTO `friend` VALUES (43, 13, 7, 15, '2022-08-14 10:03:54', 0, '');
INSERT INTO `friend` VALUES (44, 7, 13, 4, '2022-08-14 10:03:54', 0, '');
INSERT INTO `friend` VALUES (45, 16, 7, 21, '2022-08-14 10:57:30', 0, '');
INSERT INTO `friend` VALUES (46, 7, 16, 4, '2022-08-14 10:57:30', 0, '');
INSERT INTO `friend` VALUES (47, 7, 1, 4, '2022-08-14 20:05:04', 0, '');
INSERT INTO `friend` VALUES (48, 1, 7, 1, '2022-08-14 20:05:04', 0, '');
INSERT INTO `friend` VALUES (49, 29, 1, 45, '2022-08-19 19:08:12', 0, '');
INSERT INTO `friend` VALUES (50, 1, 29, 2, '2022-08-19 19:08:12', 0, NULL);
INSERT INTO `friend` VALUES (51, 35, 1, 55, '2022-08-27 17:57:05', 0, '');
INSERT INTO `friend` VALUES (52, 1, 35, 1, '2022-08-27 17:57:05', 0, '');
INSERT INTO `friend` VALUES (53, 35, 37, 55, '2022-08-28 20:33:24', 0, '');
INSERT INTO `friend` VALUES (54, 37, 35, 2, '2022-08-28 20:33:24', 0, NULL);

-- ----------------------------
-- Table structure for friend_verification
-- ----------------------------
DROP TABLE IF EXISTS `friend_verification`;
CREATE TABLE `friend_verification`  (
  `verificationId` int(0) NOT NULL AUTO_INCREMENT COMMENT '验证信息编号',
  `fromUid` int(0) NOT NULL COMMENT '发送用户编号',
  `toUid` int(0) NOT NULL COMMENT '接受用户编号',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '验证消息',
  `sendTime` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `verify_state` int(0) NULL DEFAULT NULL COMMENT '状态 1未验证 2已读 3通过 4拒绝',
  `groupIndex` int(0) NOT NULL COMMENT '分组下标',
  `nameMem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`verificationId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of friend_verification
-- ----------------------------
INSERT INTO `friend_verification` VALUES (5, 11, 1, '我是lizi111', '2022-07-18 17:30:02', 3, 1, '');
INSERT INTO `friend_verification` VALUES (6, 12, 1, '我是hahage', '2022-07-19 19:51:01', 3, 1, '');
INSERT INTO `friend_verification` VALUES (7, 13, 1, '我是wuyage', '2022-07-19 19:59:20', 3, 1, '');
INSERT INTO `friend_verification` VALUES (8, 13, 1, '我是wuyage', '2022-07-20 14:39:24', 3, 1, '');
INSERT INTO `friend_verification` VALUES (9, 1, 5, '我是李子', '2022-07-22 09:08:48', 3, 1, '');
INSERT INTO `friend_verification` VALUES (11, 5, 12, '我是test', '2022-07-24 14:25:57', 3, 1, '');
INSERT INTO `friend_verification` VALUES (12, 5, 13, '我是test', '2022-08-05 11:22:03', 2, 1, '');
INSERT INTO `friend_verification` VALUES (13, 5, 13, '我是test', '2022-08-05 11:35:03', 2, 1, '');
INSERT INTO `friend_verification` VALUES (33, 6, 1, '我是test1', '2022-08-05 16:11:57', 3, 1, '');
INSERT INTO `friend_verification` VALUES (34, 6, 1, '我是test1', '2022-08-05 16:37:28', 3, 1, '');
INSERT INTO `friend_verification` VALUES (35, 14, 1, '我是沃尔沃车主', '2022-08-05 17:08:58', 3, 1, '');
INSERT INTO `friend_verification` VALUES (36, 15, 1, '我是迪卡侬', '2022-08-05 21:00:53', 3, 1, '');
INSERT INTO `friend_verification` VALUES (37, 16, 1, '我是wang', '2022-08-07 20:49:24', 3, 1, '');
INSERT INTO `friend_verification` VALUES (38, 17, 1, '我是yezi', '2022-08-07 20:56:32', 3, 1, '');
INSERT INTO `friend_verification` VALUES (39, 18, 1, '我是喜羊羊', '2022-08-07 21:16:27', 3, 1, '');
INSERT INTO `friend_verification` VALUES (40, 19, 1, '我是美羊羊', '2022-08-07 21:26:26', 3, 1, '');
INSERT INTO `friend_verification` VALUES (41, 20, 1, '我是梦', '2022-08-08 16:44:46', 2, 1, '');
INSERT INTO `friend_verification` VALUES (42, 21, 1, '我是小w', '2022-08-08 17:05:59', 2, 1, '');
INSERT INTO `friend_verification` VALUES (43, 22, 1, '我是一梦两三年', '2022-08-08 17:09:22', 2, 1, '');
INSERT INTO `friend_verification` VALUES (44, 23, 1, '我是damie', '2022-08-08 21:27:53', 3, 1, '');
INSERT INTO `friend_verification` VALUES (45, 23, 1, '我是damie', '2022-08-09 19:05:41', 3, 1, '');
INSERT INTO `friend_verification` VALUES (46, 23, 1, '我是damie', '2022-08-09 19:09:37', 3, 1, '');
INSERT INTO `friend_verification` VALUES (47, 23, 1, '我是damie', '2022-08-09 19:11:51', 3, 1, '');
INSERT INTO `friend_verification` VALUES (48, 23, 1, '我是damie', '2022-08-09 19:12:07', 3, 1, '');
INSERT INTO `friend_verification` VALUES (49, 24, 1, '我是谁都没有错', '2022-08-10 10:49:43', 3, 1, '');
INSERT INTO `friend_verification` VALUES (50, 24, 5, '我是谁都没有错', '2022-08-10 10:54:00', 2, 1, '');
INSERT INTO `friend_verification` VALUES (51, 27, 1, '我是233', '2022-08-13 13:49:06', 3, 1, '');
INSERT INTO `friend_verification` VALUES (52, 27, 1, '我是233', '2022-08-13 13:58:03', 3, 1, '');
INSERT INTO `friend_verification` VALUES (53, 27, 1, '我是233', '2022-08-13 13:59:21', 3, 1, '');
INSERT INTO `friend_verification` VALUES (54, 28, 1, '我是Mary', '2022-08-13 14:16:14', 3, 1, '');
INSERT INTO `friend_verification` VALUES (55, 7, 5, '我是wxw', '2022-08-14 09:37:01', 3, 1, '');
INSERT INTO `friend_verification` VALUES (56, 11, 7, '我是lizi111', '2022-08-14 09:42:58', 3, 1, '');
INSERT INTO `friend_verification` VALUES (57, 12, 7, '我是hahage', '2022-08-14 09:54:48', 3, 1, '');
INSERT INTO `friend_verification` VALUES (58, 13, 7, '我是wuyage', '2022-08-14 10:03:40', 3, 1, '');
INSERT INTO `friend_verification` VALUES (59, 16, 7, '我是wang', '2022-08-14 10:57:25', 3, 1, '');
INSERT INTO `friend_verification` VALUES (60, 7, 1, '我是wxw', '2022-08-14 20:05:00', 3, 1, '');
INSERT INTO `friend_verification` VALUES (61, 29, 1, '我是燕子你不要走', '2022-08-19 19:01:48', 3, 1, '');
INSERT INTO `friend_verification` VALUES (62, 35, 1, '我是熊二', '2022-08-27 17:56:59', 3, 1, '');
INSERT INTO `friend_verification` VALUES (63, 35, 37, '我是熊二', '2022-08-28 20:32:52', 3, 1, '');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `logId` int(0) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `logTime` datetime(0) NOT NULL COMMENT '日志产生时间',
  `logContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '日志内容',
  `uid` int(0) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`logId`) USING BTREE,
  INDEX `FK_log_uid`(`uid`) USING BTREE,
  CONSTRAINT `FK_log_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (94, '2022-08-24 14:39:07', '用户admin登录，账号：admin', 30);
INSERT INTO `log` VALUES (95, '2022-08-24 15:54:07', '用户admin登录，账号：admin', 30);
INSERT INTO `log` VALUES (96, '2022-08-24 15:54:21', '用户admin登录，账号：admin', 30);
INSERT INTO `log` VALUES (97, '2022-08-24 16:00:41', '用户admin登录，账号：admin', 30);
INSERT INTO `log` VALUES (98, '2022-08-24 16:01:52', '用户admin登录，账号：admin', 30);
INSERT INTO `log` VALUES (99, '2022-08-24 19:50:52', '用户admin登录，账号：admin', 30);
INSERT INTO `log` VALUES (100, '2022-08-24 19:54:53', '用户admin登录，账号：admin', 30);
INSERT INTO `log` VALUES (101, '2022-08-25 08:18:19', '用户admin登录，账号：admin', 30);
INSERT INTO `log` VALUES (102, '2022-08-26 14:08:27', '用户admin登录，账号：admin', 30);
INSERT INTO `log` VALUES (103, '2022-08-26 14:15:15', '用户admin登录，账号：admin', 30);
INSERT INTO `log` VALUES (104, '2022-08-26 20:08:10', '用户与你共晚霞登录，账号：8505980', 31);
INSERT INTO `log` VALUES (105, '2022-08-27 09:21:09', '用户admin登录，账号：admin', 30);
INSERT INTO `log` VALUES (106, '2022-08-27 10:16:56', '用户大哈登录，账号：79461007', 32);
INSERT INTO `log` VALUES (107, '2022-08-27 10:38:20', '用户二哈登录，账号：175112299', 33);
INSERT INTO `log` VALUES (108, '2022-08-27 17:42:46', '用户熊大登录，账号：7611590783', 34);
INSERT INTO `log` VALUES (109, '2022-08-27 17:47:07', '用户李子登录，账号：1824591386', 1);
INSERT INTO `log` VALUES (110, '2022-08-27 17:47:22', '用户李子登录，账号：1824591386', 1);
INSERT INTO `log` VALUES (111, '2022-08-27 17:47:36', '用户李子登录，账号：1824591386', 1);
INSERT INTO `log` VALUES (112, '2022-08-27 17:48:20', '用户李子登录，账号：1824591386', 1);
INSERT INTO `log` VALUES (113, '2022-08-27 17:48:25', '用户李子登录，账号：1824591386', 1);
INSERT INTO `log` VALUES (114, '2022-08-27 17:48:28', '用户李子登录，账号：1824591386', 1);
INSERT INTO `log` VALUES (115, '2022-08-27 17:48:31', '用户李子登录，账号：1824591386', 1);
INSERT INTO `log` VALUES (116, '2022-08-27 17:48:34', '用户李子登录，账号：1824591386', 1);
INSERT INTO `log` VALUES (117, '2022-08-27 17:48:37', '用户李子登录，账号：1824591386', 1);
INSERT INTO `log` VALUES (118, '2022-08-27 17:56:48', '用户熊二登录，账号：662346', 35);
INSERT INTO `log` VALUES (119, '2022-08-27 19:57:31', '用户gogo登录，账号：37919014', 36);
INSERT INTO `log` VALUES (120, '2022-08-28 09:53:07', '用户香香登录，账号：454349454', 37);

-- ----------------------------
-- Table structure for social_update
-- ----------------------------
DROP TABLE IF EXISTS `social_update`;
CREATE TABLE `social_update`  (
  `sid` int(0) NOT NULL AUTO_INCREMENT COMMENT '动态编号',
  `contentText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文字内容',
  `uid` int(0) NOT NULL COMMENT '用户编号',
  `sendTime` datetime(0) NOT NULL COMMENT '发表时间',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `FK_social_uid`(`uid`) USING BTREE,
  CONSTRAINT `FK_social_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of social_update
-- ----------------------------
INSERT INTO `social_update` VALUES (1, '1111', 18, '2022-08-16 21:07:18');
INSERT INTO `social_update` VALUES (2, '111112312', 18, '2022-08-16 21:07:49');
INSERT INTO `social_update` VALUES (6, '测试', 18, '2022-08-17 09:26:41');
INSERT INTO `social_update` VALUES (7, '', 18, '2022-08-17 09:32:04');
INSERT INTO `social_update` VALUES (8, '23232232', 18, '2022-08-17 09:32:12');
INSERT INTO `social_update` VALUES (10, '跨越时空的对话', 1, '2022-08-17 15:31:55');
INSERT INTO `social_update` VALUES (11, '测试一下', 1, '2022-08-17 19:50:38');
INSERT INTO `social_update` VALUES (12, '哈哈哈', 1, '2022-08-17 19:51:01');
INSERT INTO `social_update` VALUES (13, '谁能与我相忘', 1, '2022-08-17 19:51:25');
INSERT INTO `social_update` VALUES (14, '好吧', 1, '2022-08-17 19:51:37');
INSERT INTO `social_update` VALUES (15, '也许吧', 1, '2022-08-17 19:51:59');
INSERT INTO `social_update` VALUES (16, '都可以的', 1, '2022-08-17 19:52:19');
INSERT INTO `social_update` VALUES (17, '如果还能再来一次', 1, '2022-08-17 19:52:41');
INSERT INTO `social_update` VALUES (18, '真真切切心心念念', 29, '2022-08-19 20:15:55');

-- ----------------------------
-- Table structure for update_comment
-- ----------------------------
DROP TABLE IF EXISTS `update_comment`;
CREATE TABLE `update_comment`  (
  `commentId` int(0) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `contentText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `sid` int(0) NOT NULL COMMENT '动态编号',
  `uid` int(0) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`commentId`) USING BTREE,
  INDEX `FK_comment_sid`(`sid`) USING BTREE,
  INDEX `FK_comment_uid`(`uid`) USING BTREE,
  CONSTRAINT `FK_comment_sid` FOREIGN KEY (`sid`) REFERENCES `social_update` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_comment_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of update_comment
-- ----------------------------
INSERT INTO `update_comment` VALUES (2, '1111', 10, 18);
INSERT INTO `update_comment` VALUES (3, '111', 10, 18);
INSERT INTO `update_comment` VALUES (4, '111', 10, 18);
INSERT INTO `update_comment` VALUES (5, '可以', 10, 18);
INSERT INTO `update_comment` VALUES (6, '可以', 10, 18);
INSERT INTO `update_comment` VALUES (7, '好吧', 10, 18);
INSERT INTO `update_comment` VALUES (8, '大家一起加油', 17, 29);
INSERT INTO `update_comment` VALUES (9, 'emo了', 18, 29);
INSERT INTO `update_comment` VALUES (10, '加油噢', 18, 1);

-- ----------------------------
-- Table structure for update_pic
-- ----------------------------
DROP TABLE IF EXISTS `update_pic`;
CREATE TABLE `update_pic`  (
  `picId` int(0) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `picName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片名',
  `sid` int(0) NOT NULL COMMENT '动态编号',
  PRIMARY KEY (`picId`) USING BTREE,
  INDEX `FK_update_pic_sid`(`sid`) USING BTREE,
  CONSTRAINT `FK_update_pic_sid` FOREIGN KEY (`sid`) REFERENCES `social_update` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of update_pic
-- ----------------------------
INSERT INTO `update_pic` VALUES (1, '3301a2c7d720487f942f93b26c186b57.jpg', 6);
INSERT INTO `update_pic` VALUES (2, '9b45696485bf4e889a14d4def4c713c5.jpg', 6);
INSERT INTO `update_pic` VALUES (3, 'e96c5373f8724fbc8e831e9ac55add16.jpg', 7);
INSERT INTO `update_pic` VALUES (4, 'f9c103a76810468ab428a9c339c1326d.jpg', 7);
INSERT INTO `update_pic` VALUES (5, 'a2104bfb5d98428fbda18e595f693b19.jpg', 7);
INSERT INTO `update_pic` VALUES (7, '75aeb15511394516a71ae726e5486a53.jpg', 10);
INSERT INTO `update_pic` VALUES (8, '40c71c7305be4a838317d44f60f3a9c4.jpg', 11);
INSERT INTO `update_pic` VALUES (9, '2fbeef9039ec4a0b9be6cae87c868c0e.jpg', 12);
INSERT INTO `update_pic` VALUES (10, '30f70b697d2444aba49b7cf8c276b050.jpg', 13);
INSERT INTO `update_pic` VALUES (11, 'b22b1565accd4b18ba4bff6e07fb933d.jpg', 14);
INSERT INTO `update_pic` VALUES (12, '59af867e5f094dfa8e15d3f8200d4e31.jpg', 15);
INSERT INTO `update_pic` VALUES (13, '3d07117d7e0c41319c564bb8b466eed0.jpg', 16);
INSERT INTO `update_pic` VALUES (14, '58d8c0f444014b1a8d96cb4c18be90f9.jpg', 16);
INSERT INTO `update_pic` VALUES (15, '078f01f708b846029b70b7f85b689393.jpg', 17);
INSERT INTO `update_pic` VALUES (16, '4f2cba0b990c4a17b679abc6c8178f20.jpg', 18);
INSERT INTO `update_pic` VALUES (17, '850490d00dc04275925b281429a362d4.jpg', 18);
INSERT INTO `update_pic` VALUES (18, '8675705a80c946b7b9205d524590249c.jpg', 18);
INSERT INTO `update_pic` VALUES (19, 'fb112cace3024a68831ca1bd552ba993.jpg', 18);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `userNum` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `registerTime` datetime(0) NOT NULL COMMENT '注册时间',
  `header` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `phoneNum` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `type` int(0) NOT NULL COMMENT '1普通用户 2管理员 0封禁',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '李子', '1824591386', 'lizi123456', '2022-05-12 16:08:20', '1.jpg', '15802739770', 0);
INSERT INTO `user` VALUES (5, 'test', '61896362', 'test123456', '2022-05-22 18:27:19', 'a75901c50a4c4c778f98c0d643d11e0d.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (6, 'test1', '32824', '1234561test', '2022-05-25 13:21:38', 'default.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (7, 'wxw', '140143', 'wxw123456', '2022-05-26 18:09:58', '116529e431bf4ad4a8b0142ab13dceec.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (11, 'lizi111', '221078660', 'lizi123456', '2022-07-13 14:34:38', '4783a9b05f8845ae9039731d60625b60.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (12, 'hahage', '988074153', 'hh123456', '2022-07-19 19:50:46', 'cda79264b35544d1b7b59e19211767ff.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (13, 'wuyage', '50605', 'wy123456', '2022-07-19 19:59:05', '547d255388f24a0daf51d8d9d9eeca32.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (14, '沃尔沃车主', '18740324', 'w12345678', '2022-08-05 17:08:48', 'fde5e89f97654624af07760a48b1cec6.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (15, '迪卡侬', '6294729', 'dk123456', '2022-08-05 20:44:29', 'default.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (16, 'wang', '446336', 'wa123456', '2022-08-07 20:49:14', '0e812d527e1a480ca5d6ea4e52ae42d1.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (17, 'yezi', '5992251', 'yezi1234', '2022-08-07 20:56:24', 'default.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (18, '喜羊羊', '14508339', 'xyy123456', '2022-08-07 21:16:15', '12d8669ae2954475b2de3d220f7fb50d.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (19, '美羊羊', '34055170', 'myy112233', '2022-08-07 21:26:16', 'default.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (20, '梦', '3590611613', 'meng123456', '2022-08-08 16:44:32', 'default.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (21, '小w', '9708079583', 'ww123456', '2022-08-08 17:05:45', 'default.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (22, '一梦两三年', '347328113', 'llm123456', '2022-08-08 17:07:47', 'default.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (23, 'damie', '71158', 'dm123456', '2022-08-08 21:27:40', 'default.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (24, '哈哈', '4011651579', 'myc123456', '2022-08-10 10:49:31', 'default.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (25, 'zs', '599015', 'zs123456', '2022-08-12 09:36:26', 'default.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (26, 'hehehe', '47810', 'hh123456', '2022-08-12 09:44:50', 'default.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (27, '233', '658036119', 'll123456', '2022-08-12 10:28:20', 'fa6dbe3ca8f74786a7bc3ccabd413a43.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (28, 'Mary', '21810015', 'mary123456', '2022-08-13 14:14:04', 'e463046d3e2e411985f9036f003c5ec9.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (29, '燕子你不要走', '5542184521', 'yz123456', '2022-08-19 17:19:55', '0af823cc7c9f4364b8d0686b8223e841.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (30, 'admin', 'admin', '123456', '2022-08-24 09:30:45', '1.jpg', '15802739770', 2);
INSERT INTO `user` VALUES (31, '与你共晚霞', '8505980', 'wx123456', '2022-08-26 20:08:08', 'default.jpg', '15802739770', 1);
INSERT INTO `user` VALUES (32, '大哈', '79461007', 'dh123456', '2022-08-27 10:16:52', 'ca5f47933ead426aaeedc591e30b38dd.jpg', '1457546461', 1);
INSERT INTO `user` VALUES (33, '二哈', '175112299', 'eh123456', '2022-08-27 10:38:18', '6fcf2744b2234226ac66d457ffb855de.jpg', '4413131445', 1);
INSERT INTO `user` VALUES (34, '熊大', '7611590783', 'xd123456', '2022-08-27 17:42:44', 'default.jpg', '4561646464', 1);
INSERT INTO `user` VALUES (35, '熊二', '662346', 'xe123456', '2022-08-27 17:56:44', 'default.jpg', '45766645546', 1);
INSERT INTO `user` VALUES (36, 'gogo', '37919014', 'go123456', '2022-08-27 19:57:29', 'default.jpg', '15446455345', 1);
INSERT INTO `user` VALUES (37, '香香', '454349454', 'xx123456', '2022-08-28 09:53:03', 'default.jpg', '15802739770', 1);

-- ----------------------------
-- Table structure for user_header
-- ----------------------------
DROP TABLE IF EXISTS `user_header`;
CREATE TABLE `user_header`  (
  `headerId` int(0) NOT NULL AUTO_INCREMENT COMMENT '头像编号',
  `picName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片名',
  `uid` int(0) NOT NULL COMMENT '用户编号',
  `setTime` datetime(0) NULL DEFAULT NULL COMMENT '设置时间',
  PRIMARY KEY (`headerId`) USING BTREE,
  UNIQUE INDEX `INDEX_PIC_NAME`(`picName`) USING BTREE,
  INDEX `FK_HEADER_UID`(`uid`) USING BTREE,
  CONSTRAINT `FK_HEADER_UID` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_header
-- ----------------------------
INSERT INTO `user_header` VALUES (1, 'fa6dbe3ca8f74786a7bc3ccabd413a43.jpg', 27, '2022-08-13 10:14:47');
INSERT INTO `user_header` VALUES (2, 'e692db6f1df943e7b74944e8d45cf4ee.jpg', 27, '2022-08-12 21:14:29');
INSERT INTO `user_header` VALUES (3, '280bb9ab9278488b8510f367aad53ca1.jpg', 27, '2022-08-12 21:49:31');
INSERT INTO `user_header` VALUES (5, 'dd3b7b4d675440038e9cdcd1fcaf0de9.jpg', 27, '2022-08-12 22:21:54');
INSERT INTO `user_header` VALUES (6, 'e463046d3e2e411985f9036f003c5ec9.jpg', 28, '2022-08-13 14:14:15');
INSERT INTO `user_header` VALUES (7, 'fde5e89f97654624af07760a48b1cec6.jpg', 14, '2022-08-13 17:22:36');
INSERT INTO `user_header` VALUES (8, 'a75901c50a4c4c778f98c0d643d11e0d.jpg', 5, '2022-08-14 09:35:40');
INSERT INTO `user_header` VALUES (9, '116529e431bf4ad4a8b0142ab13dceec.jpg', 7, '2022-08-14 09:36:43');
INSERT INTO `user_header` VALUES (10, '4783a9b05f8845ae9039731d60625b60.jpg', 11, '2022-08-14 09:43:26');
INSERT INTO `user_header` VALUES (11, 'cda79264b35544d1b7b59e19211767ff.jpg', 12, '2022-08-14 09:54:15');
INSERT INTO `user_header` VALUES (12, '547d255388f24a0daf51d8d9d9eeca32.jpg', 13, '2022-08-14 10:03:29');
INSERT INTO `user_header` VALUES (13, '0e812d527e1a480ca5d6ea4e52ae42d1.jpg', 16, '2022-08-14 10:57:06');
INSERT INTO `user_header` VALUES (14, '7974250ee7064dc5818fbd5d8f215212.jpg', 18, '2022-08-14 21:11:23');
INSERT INTO `user_header` VALUES (15, '1e97883a54ae4525b2f4ab788cc59fe7.jpg', 18, '2022-08-15 20:14:18');
INSERT INTO `user_header` VALUES (16, '87a63aec52fe45a8a7dfb227a5d59459.jpg', 18, '2022-08-15 20:16:38');
INSERT INTO `user_header` VALUES (17, '12d8669ae2954475b2de3d220f7fb50d.jpg', 18, '2022-08-15 20:27:05');
INSERT INTO `user_header` VALUES (18, '6a724db089f540c2814a808d7fa62126.jpg', 29, '2022-08-19 17:48:00');
INSERT INTO `user_header` VALUES (19, '620a4b4b3a4e467b8ee891e6f83c12c1.jpg', 29, '2022-08-19 17:48:07');
INSERT INTO `user_header` VALUES (20, '0af823cc7c9f4364b8d0686b8223e841.jpg', 29, '2022-08-19 17:48:13');
INSERT INTO `user_header` VALUES (21, '7131051880e044debbe79394e2438219.jpg', 32, '2022-08-27 10:19:11');
INSERT INTO `user_header` VALUES (22, 'ca5f47933ead426aaeedc591e30b38dd.jpg', 32, '2022-08-27 10:28:22');
INSERT INTO `user_header` VALUES (23, '407353324900480091771915be9f8371.jpg', 32, '2022-08-27 10:28:06');
INSERT INTO `user_header` VALUES (24, '96825b9c7c1a47c79fce80d7ee305292.jpg', 33, '2022-08-27 10:38:32');
INSERT INTO `user_header` VALUES (25, '6fcf2744b2234226ac66d457ffb855de.jpg', 33, '2022-08-27 10:43:13');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `infoId` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户信息编号',
  `sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birth` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `province` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '签名',
  `uid` int(0) NOT NULL COMMENT '用户编号',
  `bgImg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主页背景',
  `bgUpdates` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`infoId`) USING BTREE,
  INDEX `FK_user_info_uid`(`uid`) USING BTREE,
  CONSTRAINT `FK_user_info_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '男', '2021-04-01 00:00:00', '湖北省', '武汉市', '。。。。。', 1, '09711e06155b403c94609eaf34a25e40.jpg', NULL);
INSERT INTO `user_info` VALUES (2, '', '2022-08-11 00:00:00', '', '', '路漫漫其修远兮，吾将上下而求索', 24, NULL, NULL);
INSERT INTO `user_info` VALUES (3, '', NULL, '', '', 'zs', 25, NULL, NULL);
INSERT INTO `user_info` VALUES (4, '男', NULL, '', '', '23334', 26, NULL, NULL);
INSERT INTO `user_info` VALUES (5, '男', '2022-01-10 00:00:00', '山西省', '太原市', '何以解忧', 27, NULL, NULL);
INSERT INTO `user_info` VALUES (6, NULL, NULL, NULL, NULL, '好耶', 7, NULL, NULL);
INSERT INTO `user_info` VALUES (7, '男', '2001-12-04 00:00:00', '湖北省', '武汉市', '燕子你不要走啊！！！！！！', 29, 'db4db179396e44d392c93ae0c372693e.jpg', NULL);

SET FOREIGN_KEY_CHECKS = 1;
