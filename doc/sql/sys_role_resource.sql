/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : campus_imaotai

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 19/02/2024 14:21:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource`  (
  `resource_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源编码',
  `role_id` bigint NOT NULL COMMENT '角色id',
  PRIMARY KEY (`role_id`, `resource_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('campus-imaotai.I_log.list', 1685558345957654529);
INSERT INTO `sys_role_resource` VALUES ('campus-imaotai.I_user.add', 1685558345957654529);
INSERT INTO `sys_role_resource` VALUES ('campus-imaotai.I_user.edit', 1685558345957654529);
INSERT INTO `sys_role_resource` VALUES ('campus-imaotai.I_user.get_info', 1685558345957654529);
INSERT INTO `sys_role_resource` VALUES ('campus-imaotai.I_user.list', 1685558345957654529);
INSERT INTO `sys_role_resource` VALUES ('campus-imaotai.I_user.login', 1685558345957654529);
INSERT INTO `sys_role_resource` VALUES ('campus-imaotai.I_user.remove', 1685558345957654529);
INSERT INTO `sys_role_resource` VALUES ('campus-imaotai.I_user.reservation', 1685558345957654529);
INSERT INTO `sys_role_resource` VALUES ('campus-imaotai.I_user.send_code', 1685558345957654529);
INSERT INTO `sys_role_resource` VALUES ('campus-imaotai.I_user.travel_reward', 1685558345957654529);

SET FOREIGN_KEY_CHECKS = 1;
