/*
Navicat MySQL Data Transfer

Source Server         : spring_boot
Source Server Version : 50717
Source Host           : 192.168.129.133:3306
Source Database       : express_user

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-11-29 13:03:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for courier_leave_log
-- ----------------------------
DROP TABLE IF EXISTS `courier_leave_log`;
CREATE TABLE `courier_leave_log` (
  `courier_id` varchar(128) NOT NULL,
  `leave_status` tinyint(2) NOT NULL COMMENT '1 - 请假中 0 - 已经回到岗位',
  `leave_resaon` varchar(128) NOT NULL COMMENT '请假原因',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `courier_id` (`courier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of courier_leave_log
-- ----------------------------
INSERT INTO `courier_leave_log` VALUES ('63454354', '0', '拉肚子', '2019-11-21 19:04:39', '2019-11-17 07:12:34');
INSERT INTO `courier_leave_log` VALUES ('63454354', '0', '牙痛', '2019-11-21 20:18:14', '2019-11-17 07:48:11');
INSERT INTO `courier_leave_log` VALUES ('63454354', '0', 'dawdawdaw', '2019-11-21 20:53:00', '2019-11-17 08:24:10');
INSERT INTO `courier_leave_log` VALUES ('63454354', '0', '拉肚子', '2019-11-22 16:42:15', '2019-11-17 15:22:30');
INSERT INTO `courier_leave_log` VALUES ('63454354', '0', '拉肚子', '2019-11-22 20:23:21', '2019-11-17 19:25:44');
INSERT INTO `courier_leave_log` VALUES ('63454354', '0', '拉肚子', '2019-11-22 20:36:20', '2019-11-17 19:36:06');
INSERT INTO `courier_leave_log` VALUES ('63454354', '0', '拉肚子', '2019-11-22 20:36:42', '2019-11-17 19:36:30');
INSERT INTO `courier_leave_log` VALUES ('63454354', '0', '拉屎', '2019-11-24 16:02:54', '2019-11-18 06:20:47');
INSERT INTO `courier_leave_log` VALUES ('63454354', '0', '拉肚子', '2019-11-24 16:28:41', '2019-11-18 06:44:59');
INSERT INTO `courier_leave_log` VALUES ('23542345', '0', '拉肚子', '2019-11-24 19:38:06', '2019-11-18 07:02:56');

-- ----------------------------
-- Table structure for courier_sign_count
-- ----------------------------
DROP TABLE IF EXISTS `courier_sign_count`;
CREATE TABLE `courier_sign_count` (
  `id` varchar(128) NOT NULL,
  `courier_id` varchar(128) NOT NULL COMMENT '配送员id',
  `sign_count` int(11) NOT NULL COMMENT '连续签到天数',
  `sign_count_type` tinyint(4) NOT NULL COMMENT '0 - 断签记录 1 - 正在连签',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `update_date` (`courier_id`,`update_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of courier_sign_count
-- ----------------------------
INSERT INTO `courier_sign_count` VALUES ('1198518276225765378', '63454354', '2', '0', '2019-11-24 16:26:39', '2019-11-26 15:09:54');
INSERT INTO `courier_sign_count` VALUES ('1198566372465025026', '23542345', '1', '1', '2019-11-24 19:37:46', '2019-11-24 19:37:46');
INSERT INTO `courier_sign_count` VALUES ('1199223739502301186', '63454354', '2', '1', '2019-11-26 15:09:54', '2019-11-27 23:04:32');

-- ----------------------------
-- Table structure for courier_sign_data
-- ----------------------------
DROP TABLE IF EXISTS `courier_sign_data`;
CREATE TABLE `courier_sign_data` (
  `id` varchar(255) NOT NULL COMMENT '主键id',
  `courier_id` varchar(128) NOT NULL COMMENT '配送员id',
  `sign_date` datetime NOT NULL COMMENT '签到日期',
  `sign_data_type` tinyint(4) NOT NULL COMMENT '0-日常 1-加班',
  PRIMARY KEY (`id`),
  KEY `courier_id` (`courier_id`,`sign_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of courier_sign_data
-- ----------------------------
INSERT INTO `courier_sign_data` VALUES ('1198518276255125505', '63454354', '2019-11-24 16:26:39', '0');
INSERT INTO `courier_sign_data` VALUES ('1198566372490190849', '23542345', '2019-11-24 19:37:46', '0');
INSERT INTO `courier_sign_data` VALUES ('1198566394363486210', '23542345', '2019-11-24 19:37:51', '1');
INSERT INTO `courier_sign_data` VALUES ('1199223739540049922', '63454354', '2019-11-26 15:09:54', '0');
INSERT INTO `courier_sign_data` VALUES ('1199705573856227329', '63454354', '2019-11-27 23:04:32', '0');
INSERT INTO `courier_sign_data` VALUES ('1199705586971815938', '63454354', '2019-11-27 23:04:36', '1');

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_approvals
-- ----------------------------
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE `oauth_approvals` (
  `userId` varchar(256) DEFAULT NULL,
  `clientId` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModifiedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_approvals
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(48) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL COMMENT '支持的授权类型',
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL COMMENT 'token有效时间（秒）',
  `refresh_token_validity` int(11) DEFAULT NULL COMMENT '刷新令牌有效时间（秒）',
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('app', null, 'app', 'app', 'password,refresh_token', null, null, null, null, null, null);
INSERT INTO `oauth_client_details` VALUES ('ExpressApp', null, '$2a$10$dg0SXeh5Ok6f2LkHOJ03regG9RhTUxZt/Q8BY4kNIEe3Px.RTjwb6', 'app', 'authorization_code,password,refresh_token,client_credentials', null, null, '43000', '43000', null, null);

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oauth_client_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
  `code` varchar(256) DEFAULT NULL,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oauth_code
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oauth_refresh_token
-- ----------------------------

-- ----------------------------
-- Table structure for sys_roles_level
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_level`;
CREATE TABLE `sys_roles_level` (
  `role_id` int(11) NOT NULL,
  `role_desc` varchar(32) NOT NULL COMMENT '角色（会员）中文描述',
  `role_name` varchar(32) NOT NULL COMMENT '角色（会员）英文名',
  `discount` decimal(10,2) NOT NULL COMMENT '折扣',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `discount` (`discount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_roles_level
-- ----------------------------
INSERT INTO `sys_roles_level` VALUES ('1', '系统管理员', 'ROLE_ADMIN', '1.00', '2019-11-12 20:18:25', '2019-11-12 20:18:27');
INSERT INTO `sys_roles_level` VALUES ('2', '配送员', 'ROLE_COURIER', '1.00', '2019-11-12 20:17:27', '2019-11-12 20:17:30');
INSERT INTO `sys_roles_level` VALUES ('3', '普通用户', 'ROLE_USER', '1.00', '2019-11-12 20:14:43', '2019-11-12 20:14:45');
INSERT INTO `sys_roles_level` VALUES ('4', 'vip邮客', 'ROLE_VIP_USER', '0.90', '2019-11-12 20:16:25', '2019-11-12 20:16:28');
INSERT INTO `sys_roles_level` VALUES ('5', '集团邮客', 'ROLE_SVIP_USER', '0.80', '2019-11-12 20:17:01', '2019-11-12 20:17:04');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(128) NOT NULL COMMENT '用户ID',
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(128) NOT NULL DEFAULT '' COMMENT '密码',
  `face_token` varchar(255) NOT NULL DEFAULT '' COMMENT '人脸唯一标识',
  `sex` int(1) NOT NULL COMMENT '性别',
  `real_name` varchar(64) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `id_card` varchar(64) NOT NULL DEFAULT '' COMMENT '身份证号',
  `student_id_card` varchar(64) NOT NULL DEFAULT '' COMMENT '学生证号',
  `role_id` int(11) NOT NULL COMMENT '权限id',
  `tel` varchar(64) NOT NULL DEFAULT '' COMMENT '手机号',
  `school_id` varchar(255) NOT NULL DEFAULT '' COMMENT '所属学校',
  `third_login_type` int(11) NOT NULL DEFAULT '0' COMMENT '三方登陆类型（0：未绑定三方登陆）',
  `third_login_id` varchar(128) NOT NULL DEFAULT '' COMMENT '三方登陆ID',
  `has_enable` int(1) DEFAULT '1' COMMENT '是否启用（0：禁用；1：启用）',
  `lock_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tel` (`tel`) USING BTREE COMMENT '手机号码唯一',
  KEY `idx_id_card` (`id_card`) USING BTREE COMMENT '身份证号码',
  KEY `uk_username` (`username`) USING BTREE COMMENT '用户名唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'user1', '$2a$10$lqib8LGGEziYYaJMmnQ4XubOugCjECjtLHb4yJLgZ.0wDwSjh09Yi', '', '0', 'efw', '440102198001021231', '123', '3', '17623014429', '2032', '0', '', '1', '0001-01-01 00:00:00', '2019-04-17 23:10:21', '2019-11-19 06:29:57');
INSERT INTO `sys_user` VALUES ('123', 'vip', '$2a$10$DIy4gVkWJIAdXaBXD6zRz.CSD4deAXVYIf3FJa3sEfzWR/IU78ok2', '', '1', '张三', '440102198001021232', '1740128357', '4', '15521245234', '3237', '0', '', '1', '0001-01-01 00:00:00', '2019-10-19 11:27:26', '2019-11-19 06:36:04');
INSERT INTO `sys_user` VALUES ('12312523', 'courier2', '$2a$10$DIy4gVkWJIAdXaBXD6zRz.CSD4deAXVYIf3FJa3sEfzWR/IU78ok2', '', '1', '张三', '440102198001021233', '11', '2', '15521245564', '3237', '0', 'a', '1', '0001-01-01 00:00:00', '2019-04-22 01:10:24', '2019-11-19 06:30:06');
INSERT INTO `sys_user` VALUES ('1234', 'admin', '$2a$10$DIy4gVkWJIAdXaBXD6zRz.CSD4deAXVYIf3FJa3sEfzWR/IU78ok2', '', '1', 'wes', '440102198001021234', '1740128359', '1', '12312312312', '3237', '0', '', '1', '0001-01-01 00:00:00', '2019-10-19 11:27:26', '2019-11-19 06:30:06');
INSERT INTO `sys_user` VALUES ('12345', 'svip', '$2a$10$DIy4gVkWJIAdXaBXD6zRz.CSD4deAXVYIf3FJa3sEfzWR/IU78ok2', '', '1', '小明', '440102198001021235', '1740128359', '5', '12312312313', '3237', '0', '', '1', '0001-01-01 00:00:00', '2019-10-19 11:27:26', '2019-11-19 06:30:07');
INSERT INTO `sys_user` VALUES ('23542345', 'courier3', '$2a$10$DIy4gVkWJIAdXaBXD6zRz.CSD4deAXVYIf3FJa3sEfzWR/IU78ok2', '', '1', '王五', '440102198001021236', '11', '2', '15521245566', '3237', '0', 'a', '1', '0001-01-01 00:00:00', '2019-04-22 01:10:24', '2019-11-19 06:30:08');
INSERT INTO `sys_user` VALUES ('270658f71ac110ec6cce0e08b1039b4d', 'chenwenjie', '$2a$10$DIy4gVkWJIAdXaBXD6zRz.CSD4deAXVYIf3FJa3sEfzWR/IU78ok2', '4c96fff933a1996d7453e262e0e56f3d', '1', '陈文杰', '440102198001021237', '1740128356', '3', '15920323196', '3237', '0', '', '1', '0001-01-01 00:00:00', '2019-10-19 11:27:26', '2019-11-19 06:30:09');
INSERT INTO `sys_user` VALUES ('4139cb9237a7852e694f3569b9030b2c', 'admin1', '$2a$10$lqib8LGGEziYYaJMmnQ4XubOugCjECjtLHb4yJLgZ.0wDwSjh09Yi', '', '1', '拉布拉多', '440102198001021238', '777777777', '1', '15521245562', '1367', '0', '', '1', '0001-01-01 00:00:00', '2019-05-03 02:03:48', '2019-11-19 06:30:09');
INSERT INTO `sys_user` VALUES ('57546432', 'courier4', '$2a$10$DIy4gVkWJIAdXaBXD6zRz.CSD4deAXVYIf3FJa3sEfzWR/IU78ok2', '', '1', '六', '440102198001021239', '11', '2', '15521245567', '3237', '0', 'a', '1', '0001-01-01 00:00:00', '2019-04-22 01:10:24', '2019-11-19 06:30:10');
INSERT INTO `sys_user` VALUES ('63454354', 'courier1', '$2a$10$DIy4gVkWJIAdXaBXD6zRz.CSD4deAXVYIf3FJa3sEfzWR/IU78ok2', '', '1', '小二', '440102198001021210', '11', '2', '15521245565', '3237', '0', 'a', '1', '0001-01-01 00:00:00', '2019-04-22 01:10:24', '2019-11-19 06:30:10');
INSERT INTO `sys_user` VALUES ('77d014e9455b27c0696eb9f969f87912', 'user2', '$2a$10$lqib8LGGEziYYaJMmnQ4XubOugCjECjtLHb4yJLgZ.0wDwSjh09Yi', '', '1', '李四', '440102198001021211', '2222', '3', '15521245563', '1382', '0', '', '1', '0001-01-01 00:00:00', '2019-05-03 02:03:48', '2019-11-19 06:30:11');
INSERT INTO `sys_user` VALUES ('AWAWD', 'courier5', '$2a$10$DIy4gVkWJIAdXaBXD6zRz.CSD4deAXVYIf3FJa3sEfzWR/IU78ok2', '', '1', '阿瑟', '440102198001021239', '11', '2', '15521242637', '1367', '0', 'a', '1', '0001-01-01 00:00:00', '2019-04-22 01:10:24', '2019-11-19 06:47:11');

-- ----------------------------
-- Table structure for user_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `user_evaluate`;
CREATE TABLE `user_evaluate` (
  `user_id` varchar(128) NOT NULL COMMENT '用户ID',
  `score` decimal(6,3) DEFAULT '10.000' COMMENT '用户评分',
  `count` int(11) DEFAULT NULL COMMENT '评分基数',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户评分表';

-- ----------------------------
-- Records of user_evaluate
-- ----------------------------
INSERT INTO `user_evaluate` VALUES ('1', '10.000', '0', '2019-11-18 19:23:49');
INSERT INTO `user_evaluate` VALUES ('123', '10.000', '0', '2019-10-30 15:11:53');
INSERT INTO `user_evaluate` VALUES ('12312523', '7.000', '1', '2019-11-29 12:58:57');
INSERT INTO `user_evaluate` VALUES ('1234', '10.000', '0', '2019-10-30 15:11:53');
INSERT INTO `user_evaluate` VALUES ('12345', '10.000', '0', '2019-10-30 15:11:53');
INSERT INTO `user_evaluate` VALUES ('23542345', '10.000', '0', '2019-11-18 14:23:12');
INSERT INTO `user_evaluate` VALUES ('270658f71ac110ec6cce0e08b1039b4d', '15.500', '3', '2019-11-18 20:09:27');
INSERT INTO `user_evaluate` VALUES ('31772375647aaae1a28b3d785cdb99e2', '10.000', '0', '2019-10-30 14:05:30');
INSERT INTO `user_evaluate` VALUES ('3247dc8a88fc9404f6a21c16ec250dcf', '10.000', '0', '2019-10-30 14:05:30');
INSERT INTO `user_evaluate` VALUES ('57546432', '10.000', '0', '2019-11-18 14:23:36');
INSERT INTO `user_evaluate` VALUES ('6150146f23bfa506b300f4f2c635dcba', '10.000', '0', '2019-05-04 11:30:01');
INSERT INTO `user_evaluate` VALUES ('63454354', '25.000', '3', '2019-11-18 20:02:12');
INSERT INTO `user_evaluate` VALUES ('6e87fd4d208aa60e57c4cee5404b8f6b', '10.000', '0', '2019-10-30 14:05:30');
INSERT INTO `user_evaluate` VALUES ('77d014e9455b27c0696eb9f969f87912', '10.000', '0', '2019-05-04 11:30:01');
INSERT INTO `user_evaluate` VALUES ('92602c3ce0b33707d84d1165ac698db2', '10.000', '0', '2019-05-04 11:30:01');
INSERT INTO `user_evaluate` VALUES ('f10960e7392847a2c691ad066e2a87c4', '10.000', '0', '2019-11-18 15:43:47');

-- ----------------------------
-- Table structure for user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE `user_feedback` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '用户ID',
  `type` int(1) NOT NULL COMMENT '反馈类型',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `content` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '反馈内容',
  `status` int(1) DEFAULT NULL COMMENT '反馈状态',
  `handler` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '处理人',
  `result` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '处理结果',
  `create_date` datetime NOT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户反馈表';

-- ----------------------------
-- Records of user_feedback
-- ----------------------------
INSERT INTO `user_feedback` VALUES ('155611418011422', '1', '1', null, '11', '2', 'f10960e7392847a2c691ad066e2a87c4', '此订单由我处理', '2019-04-24 21:56:20', '2019-05-01 17:08:16');
INSERT INTO `user_feedback` VALUES ('155670102077627', '1', '2', null, 'where is my feedback?', '3', 'f10960e7392847a2c691ad066e2a87c4', '感谢反馈', '2019-05-01 16:57:01', '2019-05-01 17:08:59');
INSERT INTO `user_feedback` VALUES ('155670188687452', 'f10960e7392847a2c691ad066e2a87c4', '3', null, '测试反馈', '1', null, '', '2019-05-01 17:11:27', null);
INSERT INTO `user_feedback` VALUES ('155670261245195', 'f10960e7392847a2c691ad066e2a87c4', '3', null, '123', '1', null, '', '2019-05-01 17:23:32', null);
INSERT INTO `user_feedback` VALUES ('157241544975566', '270658f71ac110ec6cce0e08b1039b4d', '1', '1120376407025811458', 'sadasdadsasdasd', '3', '4139cb9237a7852e694f3569b9030b2c', '处理完毕', '2019-10-30 14:04:10', '2019-10-30 14:05:23');
