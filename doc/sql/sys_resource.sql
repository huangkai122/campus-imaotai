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

 Date: 19/02/2024 14:36:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `resource_id` bigint NOT NULL COMMENT '资源id',
  `app_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用编码',
  `resource_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源编码',
  `resource_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类名称',
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名称',
  `modular_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源模块名称，一般为控制器名称',
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源url',
  `http_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'http请求方法',
  `resource_biz_type` tinyint NULL DEFAULT 1 COMMENT '资源的业务类型：1-业务类，2-系统类',
  `required_permission_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否需要鉴权：Y-是，N-否',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`resource_id`) USING BTREE,
  INDEX `RESOURCE_CODE_URL`(`resource_code`, `url`) USING BTREE COMMENT '资源code和url的联合索引'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '需要认证的接口资源controller' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES (1759409653786652674, 'campus-imaotai', 'campus-imaotai.sys_config.refresh_cache', '参数配置管理-刷新缓存', 'SysConfigController', 'refreshCache', '参数配置管理', '/system/config/refreshCache', 'delete', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653799235586, 'campus-imaotai', 'campus-imaotai.sys_dict_data.dict_type', '字典数据管理-根据字典类型查询字典数据信息', 'SysDictDataController', 'dictType', '字典数据管理', '/system/dict/data/type/{dictType}', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653799235587, 'campus-imaotai', 'campus-imaotai.sys_role.cancel_auth_user', 'cancelAuthUser', 'SysRoleController', 'cancelAuthUser', '角色管理', '/system/role/authUser/cancel', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653799235588, 'campus-imaotai', 'campus-imaotai.sys_role.cancel_auth_user_all', 'cancelAuthUserAll', 'SysRoleController', 'cancelAuthUserAll', '角色管理', '/system/role/authUser/cancelAll', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653799235589, 'campus-imaotai', 'campus-imaotai.sys_menu.get_info', '菜单管理-查询', 'SysMenuController', 'getInfo', '菜单管理', '/system/menu/{menuId}', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653807624193, 'campus-imaotai', 'campus-imaotai.I_item.list', '查询I茅台预约商品列列表', 'IItemController', 'list', 'I茅台预约商品列Controller', '/imt/item/list', 'get', 1, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653807624194, 'campus-imaotai', 'campus-imaotai.sys_config.get_config_key', 'getConfigKey', 'SysConfigController', 'getConfigKey', '参数配置管理', '/system/config/configKey/{configKey:.+}', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653811818497, 'campus-imaotai', 'campus-imaotai.sys_user.reset_pwd', 'resetPwd', 'SysUserController', 'resetPwd', '用户管理', '/system/user/resetPwd', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653811818498, 'campus-imaotai', 'campus-imaotai.sys_logininfor.remove', '登录日志-删除', 'SysLogininforController', 'remove', '登录日志管理', '/monitor/logininfor/{infoIds}', 'delete', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653811818499, 'campus-imaotai', 'campus-imaotai.sys_profile.update_pwd', '个人信息管理-重置密码', 'SysProfileController', 'updatePwd', '个人信息管理', '/system/user/profile/updatePwd', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653811818500, 'campus-imaotai', 'campus-imaotai.sys_user.change_status', 'changeStatus', 'SysUserController', 'changeStatus', '用户管理', '/system/user/changeStatus', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653811818501, 'campus-imaotai', 'campus-imaotai.sys_profile.update_profile', '个人信息管理-修改', 'SysProfileController', 'updateProfile', '个人信息管理', '/system/user/profile', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653820207105, 'campus-imaotai', 'campus-imaotai.sys_profile.avatar', '个人信息管理-头像上次', 'SysProfileController', 'avatar', '个人信息管理', '/system/user/profile/avatar', 'post', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653820207106, 'campus-imaotai', 'campus-imaotai.sys_menu.tree_select', '菜单管理-获取菜单下拉树列表', 'SysMenuController', 'treeSelect', '菜单管理', '/system/menu/treeselect', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653820207107, 'campus-imaotai', 'campus-imaotai.sys_role.add', 'add', 'SysRoleController', 'add', '角色管理', '/system/role', 'post', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653820207108, 'campus-imaotai', 'campus-imaotai.I_log.list', '操作日志-分页', 'ILogController', 'list', 'I茅台日志Controller', '/imt/log/list', 'get', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653820207109, 'campus-imaotai', 'campus-imaotai.sys_user.page', 'page', 'SysUserController', 'page', '用户管理', '/system/user/list', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653820207110, 'campus-imaotai', 'campus-imaotai.sys_dict_type.list', '字典类型管理-分页', 'SysDictTypeController', 'list', '字典类型管理', '/system/dict/type/list', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653820207111, 'campus-imaotai', 'campus-imaotai.sys_operlog.clean', '操作日志-清空', 'SysOperlogController', 'clean', '操作日志管理', '/monitor/operlog/clean', 'delete', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653820207112, 'campus-imaotai', 'campus-imaotai.sys_user.auth_role', 'authRole', 'SysUserController', 'authRole', '用户管理', '/system/user/authRole/{userId}', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653828595713, 'campus-imaotai', 'campus-imaotai.I_log.clean', '操作日志-清空', 'ILogController', 'clean', 'I茅台日志Controller', '/imt/log/clean', 'delete', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653828595714, 'campus-imaotai', 'campus-imaotai.sys_dict_type.remove', '字典类型管理-删除', 'SysDictTypeController', 'remove', '字典类型管理', '/system/dict/type/{dictIds}', 'delete', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653828595715, 'campus-imaotai', 'campus-imaotai.sys_api_resource.edit_role_resource', '修改对应角色api资源', 'SysApiResourceController', 'editRoleResource', '资源管理', '/system/resource/roleApi', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653828595716, 'campus-imaotai', 'campus-imaotai.sys_api_resource.role_menu_tree_select', '资源管理-加载对应角色资源列表树', 'SysApiResourceController', 'roleMenuTreeSelect', '资源管理', '/system/resource/roleApiTreeselect/{roleId}', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653828595717, 'campus-imaotai', 'campus-imaotai.sys_role.get_info', 'getInfo', 'SysRoleController', 'getInfo', '角色管理', '/system/role/{roleId}', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653832790017, 'campus-imaotai', 'campus-imaotai.I_user.reservation', '预约', 'IUserController', 'reservation', 'I茅台用户Controller', '/imt/user/reservation', 'get', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653832790018, 'campus-imaotai', 'campus-imaotai.I_log.remove', '操作日志-删除', 'ILogController', 'remove', 'I茅台日志Controller', '/imt/log/{operIds}', 'delete', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653832790019, 'campus-imaotai', 'campus-imaotai.sys_logininfor.list', '登录日志-分类列表', 'SysLogininforController', 'list', '登录日志管理', '/monitor/logininfor/list', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653832790020, 'campus-imaotai', 'campus-imaotai.I_user.send_code', '发送验证码', 'IUserController', 'sendCode', 'I茅台用户Controller', '/imt/user/sendCode', 'get', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653832790021, 'campus-imaotai', 'campus-imaotai.I_user.list', '查询I茅台用户列表', 'IUserController', 'list', 'I茅台用户Controller', '/imt/user/list', 'get', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653836984322, 'campus-imaotai', 'campus-imaotai.sys_menu.edit', '菜单管理-修改', 'SysMenuController', 'edit', '菜单管理', '/system/menu', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653836984323, 'campus-imaotai', 'campus-imaotai.sys_dict_data.remove', '字典数据管理-删除', 'SysDictDataController', 'remove', '字典数据管理', '/system/dict/data/{dictCodes}', 'delete', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653836984324, 'campus-imaotai', 'campus-imaotai.sys_menu.add', '菜单管理-新增', 'SysMenuController', 'add', '菜单管理', '/system/menu', 'post', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653836984325, 'campus-imaotai', 'campus-imaotai.sys_role.allocated_list', 'allocatedList', 'SysRoleController', 'allocatedList', '角色管理', '/system/role/authUser/allocatedList', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653836984326, 'campus-imaotai', 'campus-imaotai.sys_role.list', 'list', 'SysRoleController', 'list', '角色管理', '/system/role/list', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653836984327, 'campus-imaotai', 'campus-imaotai.I_user.edit', '修改I茅台用户', 'IUserController', 'edit', 'I茅台用户Controller', '/imt/user', 'put', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653836984328, 'campus-imaotai', 'campus-imaotai.sys_menu.remove', '菜单管理-删除', 'SysMenuController', 'remove', '菜单管理', '/system/menu/{menuId}', 'delete', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653836984329, 'campus-imaotai', 'campus-imaotai.I_user.travel_reward', '旅行', 'IUserController', 'travelReward', 'I茅台用户Controller', '/imt/user/travelReward', 'get', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653836984330, 'campus-imaotai', 'campus-imaotai.sys_user.get_info', 'getInfo', 'SysUserController', 'getInfo', '用户管理', '/system/user/{userId}', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653836984331, 'campus-imaotai', 'campus-imaotai.sys_dict_type.optionselect', '字典类型管理-获取字典选择框列表', 'SysDictTypeController', 'optionselect', '字典类型管理', '/system/dict/type/optionselect', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653845372929, 'campus-imaotai', 'campus-imaotai.I_user.remove', '删除I茅台用户', 'IUserController', 'remove', 'I茅台用户Controller', '/imt/user/{mobiles}', 'delete', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653845372930, 'campus-imaotai', 'campus-imaotai.sys_user.add', 'add', 'SysUserController', 'add', '用户管理', '/system/user', 'post', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653845372931, 'campus-imaotai', 'campus-imaotai.I_user.add', '新增I茅台用户', 'IUserController', 'add', 'I茅台用户Controller', '/imt/user', 'post', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653845372932, 'campus-imaotai', 'campus-imaotai.sys_config.remove', '参数配置管理-删除', 'SysConfigController', 'remove', '参数配置管理', '/system/config/{configIds}', 'delete', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653849567233, 'campus-imaotai', 'campus-imaotai.sys_role.unallocated_list', 'unallocatedList', 'SysRoleController', 'unallocatedList', '角色管理', '/system/role/authUser/unallocatedList', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653849567234, 'campus-imaotai', 'campus-imaotai.I_user.login', '登录', 'IUserController', 'login', 'I茅台用户Controller', '/imt/user/login', 'get', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653849567235, 'campus-imaotai', 'campus-imaotai.sys_dict_type.add', '字典类型管理-新增', 'SysDictTypeController', 'add', '字典类型管理', '/system/dict/type', 'post', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653849567236, 'test', 'test.test.test3', '测试3的接口', 'TestController', 'test3', '测试', '/test/3', 'get', 1, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653849567237, 'test', 'test.test.test2', '测试2的接口', 'TestController', 'test2', '测试', '/test/2', 'get', 1, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653853761538, 'campus-imaotai', 'campus-imaotai.sys_dict_data.add', '字典数据管理-新增', 'SysDictDataController', 'add', '字典数据管理', '/system/dict/data', 'post', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653853761539, 'campus-imaotai', 'campus-imaotai.sys_role.select_auth_user_all', 'selectAuthUserAll', 'SysRoleController', 'selectAuthUserAll', '角色管理', '/system/role/authUser/selectAll', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653853761540, 'campus-imaotai', 'campus-imaotai.sys_dict_data.get_info', '字典数据管理-查询', 'SysDictDataController', 'getInfo', '字典数据管理', '/system/dict/data/{dictCode}', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653853761541, 'campus-imaotai', 'campus-imaotai.sys_login.get_info', '获取用户信息', 'SysLoginController', 'getInfo', '登录路由', '/getInfo', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653853761542, 'campus-imaotai', 'campus-imaotai.sys_menu.list', '菜单管理-分页', 'SysMenuController', 'list', '菜单管理', '/system/menu/list', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653853761543, 'campus-imaotai', 'campus-imaotai.I_user.get_info', '获取I茅台用户详细信息', 'IUserController', 'getInfo', 'I茅台用户Controller', '/imt/user/{mobile}', 'get', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653853761544, 'campus-imaotai', 'campus-imaotai.I_shop.list', 'list', 'IShopController', 'list', 'i茅台商品Controller', '/imt/shop/list', 'get', 1, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653853761545, 'campus-imaotai', 'campus-imaotai.I_item.refresh_item', '刷新i茅台预约商品列表', 'IItemController', 'refreshItem', 'I茅台预约商品列Controller', '/imt/item/refresh', 'get', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653853761546, 'campus-imaotai', 'campus-imaotai.sys_role.edit', 'edit', 'SysRoleController', 'edit', '角色管理', '/system/role', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653853761547, 'campus-imaotai', 'campus-imaotai.sys_user.update', 'update', 'SysUserController', 'update', '用户管理', '/system/user', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653862150145, 'campus-imaotai', 'campus-imaotai.sys_profile.profile', '个人信息管理-查询', 'SysProfileController', 'profile', '个人信息管理', '/system/user/profile', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653862150146, 'campus-imaotai', 'campus-imaotai.sys_role.change_status', 'changeStatus', 'SysRoleController', 'changeStatus', '角色管理', '/system/role/changeStatus', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653862150147, 'campus-imaotai', 'campus-imaotai.sys_config.edit', '参数配置管理-修改', 'SysConfigController', 'edit', '参数配置管理', '/system/config', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653862150148, 'campus-imaotai', 'campus-imaotai.I_shop.refresh_shop', '刷新i茅台商品列表', 'IShopController', 'refreshShop', 'i茅台商品Controller', '/imt/shop/refresh', 'get', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653862150149, 'campus-imaotai', 'campus-imaotai.sys_dict_type.get_info', '字典类型管理-查询', 'SysDictTypeController', 'getInfo', '字典类型管理', '/system/dict/type/{dictId}', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653866344450, 'campus-imaotai', 'campus-imaotai.sys_logininfor.unlock', '登录日志-解锁', 'SysLogininforController', 'unlock', '登录日志管理', '/monitor/logininfor/unlock/{userName}', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653866344451, 'campus-imaotai', 'campus-imaotai.sys_role.remove', 'remove', 'SysRoleController', 'remove', '角色管理', '/system/role/{roleIds}', 'delete', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653866344452, 'campus-imaotai', 'campus-imaotai.sys_login.login', '登录方法', 'SysLoginController', 'login', '登录路由', '/login', 'post', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653866344453, 'test', 'test.test.test1', '测试1的接口', 'TestController', 'test1', '测试', '/test/1', 'get', 1, 'Y', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653866344454, 'campus-imaotai', 'campus-imaotai.sys_config.page', '参数配置管理-分页', 'SysConfigController', 'page', '参数配置管理', '/system/config/page', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653866344455, 'campus-imaotai', 'campus-imaotai.sys_dict_type.edit', '字典类型管理-修改', 'SysDictTypeController', 'edit', '字典类型管理', '/system/dict/type', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653866344456, 'campus-imaotai', 'campus-imaotai.sys_dict_data.page', '字典数据管理-分页', 'SysDictDataController', 'page', '字典数据管理', '/system/dict/data/list', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653866344457, 'campus-imaotai', 'campus-imaotai.sys_dict_data.edit', '字典数据管理-修改', 'SysDictDataController', 'edit', '字典数据管理', '/system/dict/data', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653866344458, 'campus-imaotai', 'campus-imaotai.sys_logininfor.clean', '登录日志-清空', 'SysLogininforController', 'clean', '登录日志管理', '/monitor/logininfor/clean', 'delete', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653866344459, 'campus-imaotai', 'campus-imaotai.sys_dict_type.refresh_cache', '字典类型管理-刷新', 'SysDictTypeController', 'refreshCache', '字典类型管理', '/system/dict/type/refreshCache', 'delete', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653866344460, 'campus-imaotai', 'campus-imaotai.sys_operlog.list', '操作日志-分页', 'SysOperlogController', 'list', '操作日志管理', '/monitor/operlog/list', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653874733058, 'campus-imaotai', 'campus-imaotai.sys_menu.role_menu_treeselect', '菜单管理-加载对应角色菜单列表树', 'SysMenuController', 'roleMenuTreeselect', '菜单管理', '/system/menu/roleMenuTreeselect/{roleId}', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653874733059, 'campus-imaotai', 'campus-imaotai.sys_config.add', '参数配置管理-新增', 'SysConfigController', 'add', '参数配置管理', '/system/config', 'post', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653874733060, 'campus-imaotai', 'campus-imaotai.sys_user.remove', 'remove', 'SysUserController', 'remove', '用户管理', '/system/user/{userIds}', 'delete', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653874733061, 'campus-imaotai', 'campus-imaotai.sys_config.get_info', '参数配置管理-查询id信息', 'SysConfigController', 'getInfo', '参数配置管理', '/system/config/{id}', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653874733062, 'campus-imaotai', 'campus-imaotai.sys_login.get_routers', '获取路由信息', 'SysLoginController', 'getRouters', '登录路由', '/getRouters', 'get', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653878927361, 'campus-imaotai', 'campus-imaotai.sys_operlog.remove', '操作日志-删除', 'SysOperlogController', 'remove', '操作日志管理', '/monitor/operlog/{operIds}', 'delete', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');
INSERT INTO `sys_resource` VALUES (1759409653878927362, 'campus-imaotai', 'campus-imaotai.sys_user.insert_auth_role', 'insertAuthRole', 'SysUserController', 'insertAuthRole', '用户管理', '/system/user/authRole', 'put', 2, 'N', b'0', NULL, '2024-02-19 10:48:44', NULL, '2024-02-19 02:48:44');

SET FOREIGN_KEY_CHECKS = 1;
