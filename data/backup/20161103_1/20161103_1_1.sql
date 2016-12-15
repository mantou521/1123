-- ThinkCMF SQL Dump Program
-- 
-- DATE : 2016-11-03 10:57:16
-- Vol : 1
DROP TABLE IF EXISTS `cmf_ad`;
CREATE TABLE `cmf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/admingoods/edit_post','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/admingoods/edit','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/admingoods/add_post','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/admingoods/add','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/admingoods/index','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpage/add_post','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpage/add','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpage/edit_post','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpage/edit','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpage/delete','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpage/listorders','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpage/index','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/content/default','admin_url');
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('1','Admin','admin_url','admin/content/default','','内容管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('2','Api','admin_url','api/guestbookadmin/index','','所有留言','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('3','Api','admin_url','api/guestbookadmin/delete','','删除网站留言','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('4','Comment','admin_url','comment/commentadmin/index','','评论管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('5','Comment','admin_url','comment/commentadmin/delete','','删除评论','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('6','Comment','admin_url','comment/commentadmin/check','','评论审核','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('7','Portal','admin_url','portal/adminpost/index','','内容管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('8','Portal','admin_url','portal/adminpost/listorders','','文章排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('9','Portal','admin_url','portal/adminpost/top','','文章置顶','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('10','Portal','admin_url','portal/adminpost/recommend','','文章推荐','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('11','Portal','admin_url','portal/adminpost/move','','批量移动','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('12','Portal','admin_url','portal/adminpost/check','','文章审核','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('13','Portal','admin_url','portal/adminpost/delete','','删除文章','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('14','Portal','admin_url','portal/adminpost/edit','','编辑文章','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('15','Portal','admin_url','portal/adminpost/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('16','Portal','admin_url','portal/adminpost/add','','添加文章','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('17','Portal','admin_url','portal/adminpost/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('18','Portal','admin_url','portal/adminterm/index','','分类管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('19','Portal','admin_url','portal/adminterm/listorders','','文章分类排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('20','Portal','admin_url','portal/adminterm/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('21','Portal','admin_url','portal/adminterm/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('22','Portal','admin_url','portal/adminterm/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('23','Portal','admin_url','portal/adminterm/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('24','Portal','admin_url','portal/adminterm/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('25','Portal','admin_url','portal/adminpage/index','','页面管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('26','Portal','admin_url','portal/adminpage/listorders','','页面排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('27','Portal','admin_url','portal/adminpage/delete','','删除页面','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('28','Portal','admin_url','portal/adminpage/edit','','编辑页面','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('29','Portal','admin_url','portal/adminpage/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('30','Portal','admin_url','portal/adminpage/add','','添加页面','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('31','Portal','admin_url','portal/adminpage/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('32','Admin','admin_url','admin/recycle/default','','回收站','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('33','Portal','admin_url','portal/adminpost/recyclebin','','文章回收','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('34','Portal','admin_url','portal/adminpost/restore','','文章还原','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('35','Portal','admin_url','portal/adminpost/clean','','彻底删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('36','Portal','admin_url','portal/adminpage/recyclebin','','页面回收','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('37','Portal','admin_url','portal/adminpage/clean','','彻底删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('38','Portal','admin_url','portal/adminpage/restore','','页面还原','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('39','Admin','admin_url','admin/extension/default','','扩展工具','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('40','Admin','admin_url','admin/backup/default','','备份管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('41','Admin','admin_url','admin/backup/restore','','数据还原','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('42','Admin','admin_url','admin/backup/index','','数据备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('43','Admin','admin_url','admin/backup/index_post','','提交数据备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('44','Admin','admin_url','admin/backup/download','','下载备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('45','Admin','admin_url','admin/backup/del_backup','','删除备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('46','Admin','admin_url','admin/backup/import','','数据备份导入','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('47','Admin','admin_url','admin/plugin/index','','插件管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('48','Admin','admin_url','admin/plugin/toggle','','插件启用切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('49','Admin','admin_url','admin/plugin/setting','','插件设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('50','Admin','admin_url','admin/plugin/setting_post','','插件设置提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('51','Admin','admin_url','admin/plugin/install','','插件安装','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('52','Admin','admin_url','admin/plugin/uninstall','','插件卸载','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('53','Admin','admin_url','admin/slide/default','','幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('54','Admin','admin_url','admin/slide/index','','幻灯片管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('55','Admin','admin_url','admin/slide/listorders','','幻灯片排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('56','Admin','admin_url','admin/slide/toggle','','幻灯片显示切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('57','Admin','admin_url','admin/slide/delete','','删除幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('58','Admin','admin_url','admin/slide/edit','','编辑幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('59','Admin','admin_url','admin/slide/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('60','Admin','admin_url','admin/slide/add','','添加幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('61','Admin','admin_url','admin/slide/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('62','Admin','admin_url','admin/slidecat/index','','幻灯片分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('63','Admin','admin_url','admin/slidecat/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('64','Admin','admin_url','admin/slidecat/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('65','Admin','admin_url','admin/slidecat/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('66','Admin','admin_url','admin/slidecat/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('67','Admin','admin_url','admin/slidecat/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('68','Admin','admin_url','admin/ad/index','','网站广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('69','Admin','admin_url','admin/ad/toggle','','广告显示切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('70','Admin','admin_url','admin/ad/delete','','删除广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('71','Admin','admin_url','admin/ad/edit','','编辑广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('72','Admin','admin_url','admin/ad/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('73','Admin','admin_url','admin/ad/add','','添加广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('74','Admin','admin_url','admin/ad/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('75','Admin','admin_url','admin/link/index','','友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('76','Admin','admin_url','admin/link/listorders','','友情链接排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('77','Admin','admin_url','admin/link/toggle','','友链显示切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('78','Admin','admin_url','admin/link/delete','','删除友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('79','Admin','admin_url','admin/link/edit','','编辑友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('80','Admin','admin_url','admin/link/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('81','Admin','admin_url','admin/link/add','','添加友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('82','Admin','admin_url','admin/link/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('83','Api','admin_url','api/oauthadmin/setting','','第三方登陆','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('84','Api','admin_url','api/oauthadmin/setting_post','','提交设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('85','Admin','admin_url','admin/menu/default','','菜单管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('86','Admin','admin_url','admin/navcat/default1','','前台菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('87','Admin','admin_url','admin/nav/index','','菜单管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('88','Admin','admin_url','admin/nav/listorders','','前台导航排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('89','Admin','admin_url','admin/nav/delete','','删除菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('90','Admin','admin_url','admin/nav/edit','','编辑菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('91','Admin','admin_url','admin/nav/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('92','Admin','admin_url','admin/nav/add','','添加菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('93','Admin','admin_url','admin/nav/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('94','Admin','admin_url','admin/navcat/index','','菜单分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('95','Admin','admin_url','admin/navcat/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('96','Admin','admin_url','admin/navcat/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('97','Admin','admin_url','admin/navcat/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('98','Admin','admin_url','admin/navcat/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('99','Admin','admin_url','admin/navcat/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('100','Admin','admin_url','admin/menu/index','','后台菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('101','Admin','admin_url','admin/menu/add','','添加菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('102','Admin','admin_url','admin/menu/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('103','Admin','admin_url','admin/menu/listorders','','后台菜单排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('104','Admin','admin_url','admin/menu/export_menu','','菜单备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('105','Admin','admin_url','admin/menu/edit','','编辑菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('106','Admin','admin_url','admin/menu/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('107','Admin','admin_url','admin/menu/delete','','删除菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('108','Admin','admin_url','admin/menu/lists','','所有菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('109','Admin','admin_url','admin/setting/default','','设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('110','Admin','admin_url','admin/setting/userdefault','','个人信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('111','Admin','admin_url','admin/user/userinfo','','修改信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('112','Admin','admin_url','admin/user/userinfo_post','','修改信息提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('113','Admin','admin_url','admin/setting/password','','修改密码','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('114','Admin','admin_url','admin/setting/password_post','','提交修改','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('115','Admin','admin_url','admin/setting/site','','网站信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('116','Admin','admin_url','admin/setting/site_post','','提交修改','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('117','Admin','admin_url','admin/route/index','','路由列表','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('118','Admin','admin_url','admin/route/add','','路由添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('119','Admin','admin_url','admin/route/add_post','','路由添加提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('120','Admin','admin_url','admin/route/edit','','路由编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('121','Admin','admin_url','admin/route/edit_post','','路由编辑提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('122','Admin','admin_url','admin/route/delete','','路由删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('123','Admin','admin_url','admin/route/ban','','路由禁止','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('124','Admin','admin_url','admin/route/open','','路由启用','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('125','Admin','admin_url','admin/route/listorders','','路由排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('126','Admin','admin_url','admin/mailer/default','','邮箱配置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('127','Admin','admin_url','admin/mailer/index','','SMTP配置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('128','Admin','admin_url','admin/mailer/index_post','','提交配置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('129','Admin','admin_url','admin/mailer/active','','邮件模板','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('130','Admin','admin_url','admin/mailer/active_post','','提交模板','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('131','Admin','admin_url','admin/setting/clearcache','','清除缓存','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('132','User','admin_url','user/indexadmin/default','','用户管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('133','User','admin_url','user/indexadmin/default1','','用户组','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('134','User','admin_url','user/indexadmin/index','','本站用户','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('135','User','admin_url','user/indexadmin/ban','','拉黑会员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('136','User','admin_url','user/indexadmin/cancelban','','启用会员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('137','User','admin_url','user/oauthadmin/index','','第三方用户','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('138','User','admin_url','user/oauthadmin/delete','','第三方用户解绑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('139','User','admin_url','user/indexadmin/default3','','管理组','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('140','Admin','admin_url','admin/rbac/index','','角色管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('141','Admin','admin_url','admin/rbac/member','','成员管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('142','Admin','admin_url','admin/rbac/authorize','','权限设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('143','Admin','admin_url','admin/rbac/authorize_post','','提交设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('144','Admin','admin_url','admin/rbac/roleedit','','编辑角色','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('145','Admin','admin_url','admin/rbac/roleedit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('146','Admin','admin_url','admin/rbac/roledelete','','删除角色','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('147','Admin','admin_url','admin/rbac/roleadd','','添加角色','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('148','Admin','admin_url','admin/rbac/roleadd_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('149','Admin','admin_url','admin/user/index','','管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('150','Admin','admin_url','admin/user/delete','','删除管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('151','Admin','admin_url','admin/user/edit','','管理员编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('152','Admin','admin_url','admin/user/edit_post','','编辑提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('153','Admin','admin_url','admin/user/add','','管理员添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('154','Admin','admin_url','admin/user/add_post','','添加提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('155','Admin','admin_url','admin/plugin/update','','插件更新','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('156','Admin','admin_url','admin/storage/index','','文件存储','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('157','Admin','admin_url','admin/storage/setting_post','','文件存储设置提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('158','Admin','admin_url','admin/slide/ban','','禁用幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('159','Admin','admin_url','admin/slide/cancelban','','启用幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('160','Admin','admin_url','admin/user/ban','','禁用管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('161','Admin','admin_url','admin/user/cancelban','','启用管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('162','Portal','admin_url','portal/admingoods/index','','商品管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('163','Portal','admin_url','portal/admingoods/add','','商品添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('164','Portal','admin_url','portal/admingoods/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('165','Portal','admin_url','portal/admingoods/edit','','商品编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('166','Portal','admin_url','portal/admingoods/edit_post','','提交商品编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('167','Portal','admin_url','portal/admingoods/listorders','','','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('168','Portal','admin_url','portal/admingoods/delete','','','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('169','Portal','admin_url','portal/admingoods/check','','','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('170','Portal','admin_url','portal/admingoods/top','','','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('171','Portal','admin_url','portal/admingoods/recommend','','','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('172','Portal','admin_url','portal/admingoods/move','','','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('173','Portal','admin_url','portal/admingoods/recyclebin','','','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('174','Portal','admin_url','portal/admingoods/clean','','','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('175','Portal','admin_url','portal/admingoods/restore','','','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('176','Admin','admin_url','admin/index/joinus','','加入我们','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('177','Portal','admin_url','portal/adminpost/fileuoload','','文件下载','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('178','Portal','admin_url','portal/adminpost/fileupload','','文件下载','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('179','Portal','admin_url','portal/adminfile/index','','文件下载','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('180','额','admin_url','额/顶顶顶/顶顶顶顶顶顶','','礼仪','1','');
DROP TABLE IF EXISTS `cmf_comments`;
CREATE TABLE `cmf_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_common_action_log`;
CREATE TABLE `cmf_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_goods`;
CREATE TABLE `cmf_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(150) NOT NULL COMMENT 'seo keywords',
  `goods_price` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `goods_content` longtext COMMENT 'post内容',
  `goods_name` text COMMENT 'post标题',
  `goods_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  `smeta` text,
  `type` varchar(255) DEFAULT NULL,
  `listorder` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_date` (`post_date`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_goods ( `id`, `goods_id`, `goods_price`, `post_date`, `goods_content`, `goods_name`, `goods_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `istop`, `recommended`, `smeta`, `type`, `listorder` ) VALUES  ('23','','','2000-01-01 00:00:00','<p>水水水水<br/></p>','北欧风格布帘&罗马帘','素雅不失温馨  简约又不乏舒适   会呼吸的家是最美妙的地方','1','1','2000-01-01 00:00:00','','0','0','0','0','{\"thumb\":\"20160919\\/57e00a9796c13.png\"}',',20,44,45,27,48,','4');
INSERT INTO cmf_goods ( `id`, `goods_id`, `goods_price`, `post_date`, `goods_content`, `goods_name`, `goods_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `istop`, `recommended`, `smeta`, `type`, `listorder` ) VALUES  ('25','','','2000-01-01 00:00:00','<p>素雅不失温馨 简约又不乏舒适 会呼吸的家是最美妙的地方</p>','柔纱帘','1','1','1','2000-01-01 00:00:00','','0','','0','0','{\"thumb\":\"20160927\\/57ea0cdb759fc.jpg\"}',',20,22,24,26,48,','2');
INSERT INTO cmf_goods ( `id`, `goods_id`, `goods_price`, `post_date`, `goods_content`, `goods_name`, `goods_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `istop`, `recommended`, `smeta`, `type`, `listorder` ) VALUES  ('26','','','2000-01-01 00:00:00','<p>素雅不失温馨 简约又不乏舒适 会呼吸的家是最美妙的地方</p>','蜂巢帘','1','1','1','2000-01-01 00:00:00','','0','','0','0','{\"thumb\":\"20160926\\/57e8e188aa587.png\"}','','3');
INSERT INTO cmf_goods ( `id`, `goods_id`, `goods_price`, `post_date`, `goods_content`, `goods_name`, `goods_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `istop`, `recommended`, `smeta`, `type`, `listorder` ) VALUES  ('27','','','2000-01-01 00:00:00','<p>素雅不失温馨 简约又不乏舒适 会呼吸的家是最美妙的地方</p>','百叶帘','1','1','1','2000-01-01 00:00:00','','0','','0','0','{\"thumb\":\"20160926\\/57e8ec89745ff.jpg\"}','','7');
INSERT INTO cmf_goods ( `id`, `goods_id`, `goods_price`, `post_date`, `goods_content`, `goods_name`, `goods_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `istop`, `recommended`, `smeta`, `type`, `listorder` ) VALUES  ('28','','','2000-01-01 00:00:00','<p>素雅不失温馨 简约又不乏舒适 会呼吸的家是最美妙的地方</p>','斑马帘','1','1','1','2000-01-01 00:00:00','','0','','0','0','{\"thumb\":\"20160926\\/57e8e9c9a15ae.png\"}','','2');
INSERT INTO cmf_goods ( `id`, `goods_id`, `goods_price`, `post_date`, `goods_content`, `goods_name`, `goods_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `istop`, `recommended`, `smeta`, `type`, `listorder` ) VALUES  ('29','','','2000-01-01 00:00:00','<p>1<br/></p>','test',' 1','1','1','2000-01-01 00:00:00','','0','','0','0','{\"thumb\":\"\"}',',38,43,45,46,26,27,49,','');
INSERT INTO cmf_goods ( `id`, `goods_id`, `goods_price`, `post_date`, `goods_content`, `goods_name`, `goods_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `istop`, `recommended`, `smeta`, `type`, `listorder` ) VALUES  ('30','','','2000-01-01 00:00:00','','tes',' ','1','1','2000-01-01 00:00:00','','0','','0','0','{\"thumb\":\"\"}',',39,43,44,27,48,','');
DROP TABLE IF EXISTS `cmf_guestbook`;
CREATE TABLE `cmf_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_hx`;
CREATE TABLE `cmf_hx` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_joinus`;
CREATE TABLE `cmf_joinus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('1','1阿道夫','11111111111','3@123','爱对方水电费');
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('3','123213','13111111111','123213@qq.com','我想要这么');
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('4','123213','13111111111','123213@qq.com','我想要这么');
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('14','王小三','18310208162','2881429349@qq.com','备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试');
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('7','周卫国','18310208126','2881429349@qq.com','备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容');
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('8','周卫国','18310208126','2881429349@qq.com','备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容');
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('9','周卫国','18310208126','2881429349@qq.com','备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容');
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('10','周卫国','18310208126','2881429349@qq.com','备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容');
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('11','王小二','18310208162','2881429349@qq.com','备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容');
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('12','王小二','18310208162','2881429349@qq.com','备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容备注测试内容');
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('15','王小三','18310208162','2881429349@qq.com','备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试备注内容测试');
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('16','123123','123','123213@qq.com','sadfdsaf');
INSERT INTO cmf_joinus ( `id`, `name`, `tel`, `email`, `content` ) VALUES  ('17','文件下载','13111111111','123213@qq.com','sdf');
DROP TABLE IF EXISTS `cmf_links`;
CREATE TABLE `cmf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_menu`;
CREATE TABLE `cmf_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('1','0','Admin','Content','default','','0','1','内容管理','th','','30');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('2','1','Api','Guestbookadmin','index','','1','1','所有留言','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('3','2','Api','Guestbookadmin','delete','','1','0','删除网站留言','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('4','1','Comment','Commentadmin','index','','1','1','评论管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('5','4','Comment','Commentadmin','delete','','1','0','删除评论','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('6','4','Comment','Commentadmin','check','','1','0','评论审核','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('7','1','Portal','AdminPost','index','','1','1','内容管理','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('8','7','Portal','AdminPost','listorders','','1','0','文章排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('9','7','Portal','AdminPost','top','','1','0','文章置顶','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('10','7','Portal','AdminPost','recommend','','1','0','文章推荐','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('11','7','Portal','AdminPost','move','','1','0','批量移动','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('12','7','Portal','AdminPost','check','','1','0','文章审核','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('13','7','Portal','AdminPost','delete','','1','0','删除文章','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('14','7','Portal','AdminPost','edit','','1','0','编辑文章','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('15','14','Portal','AdminPost','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('16','7','Portal','AdminPost','add','','1','0','添加文章','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('17','16','Portal','AdminPost','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('18','1','Portal','AdminTerm','index','','0','1','分类管理','','','2');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('19','18','Portal','AdminTerm','listorders','','1','0','文章分类排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('20','18','Portal','AdminTerm','delete','','1','0','删除分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('21','18','Portal','AdminTerm','edit','','1','0','编辑分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('22','21','Portal','AdminTerm','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('23','18','Portal','AdminTerm','add','','1','0','添加分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('24','23','Portal','AdminTerm','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('25','1','Portal','AdminPage','index','','1','1','页面管理','','','3');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('26','25','Portal','AdminPage','listorders','','1','0','页面排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('27','25','Portal','AdminPage','delete','','1','0','删除页面','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('28','25','Portal','AdminPage','edit','','1','0','编辑页面','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('29','28','Portal','AdminPage','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('30','25','Portal','AdminPage','add','','1','0','添加页面','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('31','30','Portal','AdminPage','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('32','1','Admin','Recycle','default','','1','1','回收站','','','4');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('33','32','Portal','AdminPost','recyclebin','','1','1','文章回收','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('34','33','Portal','AdminPost','restore','','1','0','文章还原','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('35','33','Portal','AdminPost','clean','','1','0','彻底删除','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('36','32','Portal','AdminPage','recyclebin','','1','1','页面回收','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('37','36','Portal','AdminPage','clean','','1','0','彻底删除','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('38','36','Portal','AdminPage','restore','','1','0','页面还原','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('39','0','Admin','Extension','default','','0','1','扩展工具','cloud','','40');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('40','0','Admin','Backup','default','','0','1','备份管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('41','40','Admin','Backup','restore','','1','1','数据还原','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('42','40','Admin','Backup','index','','1','1','数据备份','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('43','42','Admin','Backup','index_post','','1','0','提交数据备份','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('44','40','Admin','Backup','download','','1','0','下载备份','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('45','40','Admin','Backup','del_backup','','1','0','删除备份','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('46','40','Admin','Backup','import','','1','0','数据备份导入','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('47','39','Admin','Plugin','index','','1','1','插件管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('48','47','Admin','Plugin','toggle','','1','0','插件启用切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('49','47','Admin','Plugin','setting','','1','0','插件设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('50','49','Admin','Plugin','setting_post','','1','0','插件设置提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('51','47','Admin','Plugin','install','','1','0','插件安装','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('52','47','Admin','Plugin','uninstall','','1','0','插件卸载','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('53','39','Admin','Slide','default','','1','1','幻灯片','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('54','53','Admin','Slide','index','','1','1','幻灯片管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('55','54','Admin','Slide','listorders','','1','0','幻灯片排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('56','54','Admin','Slide','toggle','','1','0','幻灯片显示切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('57','54','Admin','Slide','delete','','1','0','删除幻灯片','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('58','54','Admin','Slide','edit','','1','0','编辑幻灯片','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('59','58','Admin','Slide','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('60','54','Admin','Slide','add','','1','0','添加幻灯片','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('61','60','Admin','Slide','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('62','53','Admin','Slidecat','index','','1','1','幻灯片分类','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('63','62','Admin','Slidecat','delete','','1','0','删除分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('64','62','Admin','Slidecat','edit','','1','0','编辑分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('65','64','Admin','Slidecat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('66','62','Admin','Slidecat','add','','1','0','添加分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('67','66','Admin','Slidecat','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('68','39','Admin','Ad','index','','1','1','网站广告','','','2');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('69','68','Admin','Ad','toggle','','1','0','广告显示切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('70','68','Admin','Ad','delete','','1','0','删除广告','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('71','68','Admin','Ad','edit','','1','0','编辑广告','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('72','71','Admin','Ad','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('73','68','Admin','Ad','add','','1','0','添加广告','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('74','73','Admin','Ad','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('75','39','Admin','Link','index','','0','1','友情链接','','','3');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('76','75','Admin','Link','listorders','','1','0','友情链接排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('77','75','Admin','Link','toggle','','1','0','友链显示切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('78','75','Admin','Link','delete','','1','0','删除友情链接','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('79','75','Admin','Link','edit','','1','0','编辑友情链接','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('80','79','Admin','Link','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('81','75','Admin','Link','add','','1','0','添加友情链接','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('82','81','Admin','Link','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('83','39','Api','Oauthadmin','setting','','1','1','第三方登陆','leaf','','4');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('84','83','Api','Oauthadmin','setting_post','','1','0','提交设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('85','0','Admin','Menu','default','','1','1','菜单管理','list','','20');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('86','85','Admin','Navcat','default1','','1','1','前台菜单','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('87','86','Admin','Nav','index','','1','1','菜单管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('88','87','Admin','Nav','listorders','','1','0','前台导航排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('89','87','Admin','Nav','delete','','1','0','删除菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('90','87','Admin','Nav','edit','','1','0','编辑菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('91','90','Admin','Nav','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('92','87','Admin','Nav','add','','1','0','添加菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('93','92','Admin','Nav','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('94','86','Admin','Navcat','index','','1','1','菜单分类','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('95','94','Admin','Navcat','delete','','1','0','删除分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('96','94','Admin','Navcat','edit','','1','0','编辑分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('97','96','Admin','Navcat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('98','94','Admin','Navcat','add','','1','0','添加分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('99','98','Admin','Navcat','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('100','85','Admin','Menu','index','','1','1','后台菜单','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('101','100','Admin','Menu','add','','1','0','添加菜单','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('102','101','Admin','Menu','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('103','100','Admin','Menu','listorders','','1','0','后台菜单排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('104','100','Admin','Menu','export_menu','','1','0','菜单备份','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('105','100','Admin','Menu','edit','','1','0','编辑菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('106','105','Admin','Menu','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('107','100','Admin','Menu','delete','','1','0','删除菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('108','100','Admin','Menu','lists','','1','0','所有菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('109','0','Admin','Setting','default','','0','1','设置','cogs','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('110','109','Admin','Setting','userdefault','','0','1','个人信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('111','110','Admin','User','userinfo','','1','1','修改信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('112','111','Admin','User','userinfo_post','','1','0','修改信息提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('113','110','Admin','Setting','password','','1','1','修改密码','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('114','113','Admin','Setting','password_post','','1','0','提交修改','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('115','109','Admin','Setting','site','','1','1','网站信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('116','115','Admin','Setting','site_post','','1','0','提交修改','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('117','115','Admin','Route','index','','1','0','路由列表','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('118','115','Admin','Route','add','','1','0','路由添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('119','118','Admin','Route','add_post','','1','0','路由添加提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('120','115','Admin','Route','edit','','1','0','路由编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('121','120','Admin','Route','edit_post','','1','0','路由编辑提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('122','115','Admin','Route','delete','','1','0','路由删除','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('123','115','Admin','Route','ban','','1','0','路由禁止','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('124','115','Admin','Route','open','','1','0','路由启用','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('125','115','Admin','Route','listorders','','1','0','路由排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('126','109','Admin','Mailer','default','','1','1','邮箱配置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('127','126','Admin','Mailer','index','','1','1','SMTP配置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('128','127','Admin','Mailer','index_post','','1','0','提交配置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('129','126','Admin','Mailer','active','','1','1','邮件模板','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('130','129','Admin','Mailer','active_post','','1','0','提交模板','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('131','109','Admin','Setting','clearcache','','1','1','清除缓存','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('132','0','User','Indexadmin','default','','1','1','用户管理','group','','10');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('133','132','User','Indexadmin','default1','','1','1','用户组','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('134','133','User','Indexadmin','index','','1','1','本站用户','leaf','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('135','134','User','Indexadmin','ban','','1','0','拉黑会员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('136','134','User','Indexadmin','cancelban','','1','0','启用会员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('137','133','User','Oauthadmin','index','','1','1','第三方用户','leaf','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('138','137','User','Oauthadmin','delete','','1','0','第三方用户解绑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('139','132','User','Indexadmin','default3','','1','1','管理组','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('140','139','Admin','Rbac','index','','1','1','角色管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('141','140','Admin','Rbac','member','','1','0','成员管理','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('142','140','Admin','Rbac','authorize','','1','0','权限设置','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('143','142','Admin','Rbac','authorize_post','','1','0','提交设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('144','140','Admin','Rbac','roleedit','','1','0','编辑角色','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('145','144','Admin','Rbac','roleedit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('146','140','Admin','Rbac','roledelete','','1','1','删除角色','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('147','140','Admin','Rbac','roleadd','','1','1','添加角色','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('148','147','Admin','Rbac','roleadd_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('149','139','Admin','User','index','','1','1','管理员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('150','149','Admin','User','delete','','1','0','删除管理员','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('151','149','Admin','User','edit','','1','0','管理员编辑','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('152','151','Admin','User','edit_post','','1','0','编辑提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('153','149','Admin','User','add','','1','0','管理员添加','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('154','153','Admin','User','add_post','','1','0','添加提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('155','47','Admin','Plugin','update','','1','0','插件更新','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('156','39','Admin','Storage','index','','1','1','文件存储','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('157','156','Admin','Storage','setting_post','','1','0','文件存储设置提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('158','54','Admin','Slide','ban','','1','0','禁用幻灯片','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('159','54','Admin','Slide','cancelban','','1','0','启用幻灯片','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('160','149','Admin','User','ban','','1','0','禁用管理员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('161','149','Admin','User','cancelban','','1','0','启用管理员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('162','1','Portal','AdminGoods','index','','1','1','商品管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('163','162','Portal','AdminGoods','add','','1','0','商品添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('164','163','Portal','AdminGoods','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('165','162','Portal','AdminGoods','edit','','1','0','商品编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('166','165','Portal','AdminGoods','edit_post','','1','0','提交商品编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('168','0','Admin','Index','joinus','','1','1','加入我们','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('169','0','Portal','AdminGoods','listorders','','1','0','未知','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('170','0','Portal','AdminGoods','delete','','1','0','未知','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('171','0','Portal','AdminGoods','check','','1','0','未知','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('172','0','Portal','AdminGoods','top','','1','0','未知','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('173','0','Portal','AdminGoods','recommend','','1','0','未知','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('174','0','Portal','AdminGoods','move','','1','0','未知','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('175','0','Portal','AdminGoods','recyclebin','','1','0','未知','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('176','0','Portal','AdminGoods','clean','','1','0','未知','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('177','0','Portal','AdminGoods','restore','','1','0','未知','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('178','0','Portal','AdminPost','fileupload','','1','0','未知','','','0');
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('1','1','0','产品方案','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}','','1','0','0-1');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('2','1','0','智+','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"6\";}}','','1','0','0-2');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('3','1','0','专属定制','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}','','1','0','0-3');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('5','1','3','个人专属定制','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"7\";}}','','1','0','0-3-5');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('4','1','0','商城','_blank','http://www.baidu.com','','1','0','0-4');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('6','1','3','企业专属定制','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"8\";}}','','1','0','0-3-6');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('7','2','0','订单安安','','home','','1','0','0-7');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('8','2','0','服务支持','','home','','1','0','0-8');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('12','2','7','购买指南','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}','','1','0','0-7-12');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('10','2','0','资料中心','','home','','1','0','0-10');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('11','2','0','关于公司1','','home','','1','0','0-11');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('13','2','7','支付方式','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"22\";}}','','1','0','0-7-13');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('15','2','11','公司简介','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"19\";}}','','1','0','0-11-15');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('16','2','11','加入我们','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"20\";}}','','1','0','0-11-16');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('17','2','11','联系我们','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"21\";}}','','1','0','0-11-17');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('18','2','10','文件下载','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"24\";}}','','1','0','0-10-18');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('22','2','8','售后服务','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"45\";}}','','1','0','0-8-22');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('19','2','10','安装指导','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"42\";}}','','1','0','0-10-19');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('20','2','10','技术文档','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"43\";}}','','1','0','0-10-20');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('21','2','7','物流说明','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"41\";}}','','1','0','0-7-21');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('23','2','8','维修服务','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"46\";}}','','1','0','0-8-23');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('24','2','8','安装服务','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"47\";}}','','1','0','0-8-24');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('25','2','19','遮光窗帘系列','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"49\";}}','','1','0','0-10-19-25');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('26','2','19','手动卷帘系列','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"50\";}}','','1','0','0-10-19-26');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('27','2','19','百叶窗帘系列','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"51\";}}','','1','0','0-10-19-27');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('28','2','24','安装服务1','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"52\";}}','','1','0','0-8-24-28');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('29','2','24','安装服务2','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"53\";}}','','1','0','0-8-24-29');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('30','1','4','天猫旗舰店','_blank','http://www.baidu.com','','1','0','0-4-30');
DROP TABLE IF EXISTS `cmf_nav_cat`;
CREATE TABLE `cmf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('1','主导航','1','主导航d');
INSERT INTO cmf_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('2','页尾导航','1','');
DROP TABLE IF EXISTS `cmf_oauth_user`;
CREATE TABLE `cmf_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_options`;
CREATE TABLE `cmf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('1','member_email_active','{\"title\":\"\",\"template\":\"\"}','1');
INSERT INTO cmf_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('2','site_options','{\"site_name\":\"\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_host\":\"http:\\/\\/localhost\\/\",\"site_admin_url_password\":\"\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\",\"site_admin_email\":\"123@qq.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"\",\"site_seo_keywords\":\"\",\"site_seo_description\":\"\",\"urlmode\":\"0\",\"html_suffix\":\"\",\"comment_time_interval\":60}','1');
INSERT INTO cmf_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('3','cmf_settings','{\"banned_usernames\":\"\"}','1');
DROP TABLE IF EXISTS `cmf_plugins`;
CREATE TABLE `cmf_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_posts`;
CREATE TABLE `cmf_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  `word` text,
  `type` int(10) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('1','1','ceshi','','2016-09-14 17:26:04','<h1 class=\"ue_t\" label=\"Title center\" name=\"tc\" style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;\"><span style=\"color:#c0504d;\">[键入文档标题]</span></h1><p><br/></p>封面以及其他文档构建基块。 您创建的图片、图表或关系图也将与当前的文档外观协调一致。<p><br/></p><br/><p class=\"ue_t\"><br/></p><p><br/></p>','测试','123','1','1','2016-09-14 17:21:38','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','1','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('3','1','首页/ 订单服务 /购买指南','','2016-09-16 12:22:22','<p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','购买指南','adf','1','1','2016-09-16 12:21:57','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('2','1','','','2016-09-16 12:02:53','<p>阿萨德飞洒地方<br/></p>','他','水电费','1','1','2016-09-16 12:02:21','','0','2','','0','{\"template\":\"contact\",\"thumb\":\"\"}','0','0','0','0','','1','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('4','1','首页/ 支付方式/支付方式一','','2016-09-17 13:12:14','<p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">倍
思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同
探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p><p><br/></p>','支付方式一','123','1','1','2016-09-17 13:11:26','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','adsfdsaf1231232','1','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('5','1',' ','','2016-09-18 10:18:16','','产品方案',' ','1','1','2016-09-18 10:17:45','','0','2','','0','{\"template\":\"product\",\"thumb\":\"\"}','0','0','0','0','','1','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('6','1','  ','','2016-09-18 10:31:33','<p>&nbsp;1<br/></p>','智+',' ','1','1','2016-09-18 10:30:59','','0','2','','0','{\"template\":\"zhinengjia\",\"thumb\":\"\"}','0','0','0','0','','1','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('7','1','1','','2016-09-18 11:08:51','<p>1<br/></p>','私人订制','1','1','1','2016-09-18 11:08:29','','0','2','','0','{\"template\":\"in_per_dz\",\"thumb\":\"\"}','0','0','0','0','','1','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('8','1','1','','2016-09-18 11:09:10','<p>1<br/></p>','企业订制','1','1','1','2016-09-18 11:08:54','','0','2','','0','{\"template\":\"in_com_dz\",\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('9','1','','','2016-09-18 13:47:16','','首页banner',' ','1','1','2016-09-18 13:45:01','','0','0','','0','{\"thumb\":\"\",\"photo\":[{\"url\":\"20160924\\/57e620a023e32.jpg\",\"alt\":\"\\u672a\\u6807\\u9898-1\"}]}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('10','1','http://www.baidu.com/','','2016-09-18 16:27:19','<p>素雅不失温馨，简约又不失舒适。会呼吸的家最奇妙的地方</p>','四小图1','极光','1','1','2016-09-18 16:20:13','','0','0','','0','{\"thumb\":\"20160918\\/57de62181b3c9.jpg\",\"photo\":[{\"url\":\"20160918\\/57de4fdb855ac.png\",\"alt\":\"main_text\"}]}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('11','1','www.baidu.com','','2016-09-18 16:44:11','<p>素雅不失温馨，简约又不失舒适。会呼吸的家最奇妙的地方</p>','四小图2','极光','1','1','2016-09-18 16:43:26','','0','0','','0','{\"thumb\":\"20160921\\/57e20ebfcd4d1.jpg\",\"photo\":[{\"url\":\"20160918\\/57de541a03478.png\",\"alt\":\"main_text\"}]}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('12','1','','','2016-09-18 16:46:10','<p>素雅不失温馨，简约又不失舒适。会呼吸的家最奇妙的地方</p>','四小图3','极光','1','1','2016-09-18 16:45:25','','0','0','','0','{\"thumb\":\"20160918\\/57de61da28d3e.jpg\",\"photo\":[{\"url\":\"20160918\\/57de544640a1c.png\",\"alt\":\"main_text\"}]}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('13','1','www.baidu.com','','2016-09-18 16:46:43','<p>素雅不失温馨，简约又不失舒适。会呼吸的家最奇妙的地方</p>','四小图4','极光','1','1','2016-09-18 16:46:12','','0','0','','0','{\"thumb\":\"20160921\\/57e20f0fb35b3.jpg\",\"photo\":[{\"url\":\"20160918\\/57de547144f2e.png\",\"alt\":\"main_text\"}]}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('14','1','','','2016-09-19 10:23:02','<p>&nbsp; 1<br/></p>','产品方案banner',' ','1','1','2016-09-19 10:21:14','','0','0','','0','{\"thumb\":\"\",\"photo\":[{\"url\":\"20160919\\/57df4be89a459.png\",\"alt\":\"product_banner1\"}]}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('15','1','','','2016-09-19 10:24:35','<p>1<br/></p>','产品方案轮播','1','1','1','2016-09-19 10:23:06','','0','0','','0','{\"thumb\":\"\",\"photo\":[{\"url\":\"20160919\\/57df4c4da0e79.jpg\",\"alt\":\"cpfa1\"},{\"url\":\"20160919\\/57df4c53c624d.png\",\"alt\":\"cpfa2\"},{\"url\":\"20160919\\/57df4c5ab4204.png\",\"alt\":\"cpfa3\"},{\"url\":\"20160926\\/57e8f733a8744.jpg\",\"alt\":\"\\u672a\\u6807\\u9898-2\"},{\"url\":\"20160926\\/57e8f73e9f2b5.jpg\",\"alt\":\"\\u672a\\u6807\\u9898-1\"}]}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('16','1','','','2016-09-19 11:19:25','<p>
    <img src=\"http://982847940.p130580.sqnet.cn/data/upload/ueditor/20160927/57e9c6bce46f1.jpg\" style=\"\" title=\"未标题-2.jpg\"/>
</p>
<p>
    <img src=\"http://982847940.p130580.sqnet.cn/data/upload/ueditor/20160927/57e9c6be45b55.png\" style=\"\" title=\"20160912101801715.png\"/>
</p>
<p>
    <img src=\"http://982847940.p130580.sqnet.cn/data/upload/ueditor/20160927/57e9c6d97b2e0.jpg\" style=\"\" title=\"未标题-3.jpg\"/>
</p>
<p>
    <img src=\"http://982847940.p130580.sqnet.cn/data/upload/ueditor/20160927/57e9c6d98e826.jpg\" style=\"\" title=\"未标题-4.jpg\"/>
</p>
<p>
    <img src=\"http://982847940.p130580.sqnet.cn/data/upload/ueditor/20160927/57e9c703bb84c.jpg\" style=\"\" title=\"未标题-5.jpg\"/>
</p>
<p>
    <img src=\"http://982847940.p130580.sqnet.cn/data/upload/ueditor/20160927/57e9c703ce6c6.jpg\" style=\"\" title=\"未标题-6.jpg\"/>
</p>
<p>
    <img src=\"http://982847940.p130580.sqnet.cn/data/upload/ueditor/20160927/57e9c703de8f5.jpg\" style=\"\" title=\"未标题-7.jpg\"/>
</p>
','智+','1','1','1','2016-09-19 11:13:14','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('17','1',' ','','2016-09-19 11:40:03','<img src=\"http://localhost/bstthinkcmfx/public/images/per_dz1.png\" alt=\"\"/>
<img src=\"http://localhost/bstthinkcmfx/public/images/per_dz2.png\" alt=\"\"/>
<img src=\"http://localhost/bstthinkcmfx/public/images/per_dz3.png\" alt=\"\"/>
<img src=\"http://localhost/bstthinkcmfx/public/images/per_dz4.png\" alt=\"\"/>
<img src=\"http://localhost/bstthinkcmfx/public/images/per_dz5.png\" alt=\"\"/>
<img src=\"http://localhost/bstthinkcmfx/public/images/per_dz6.png\" alt=\"\"/>
','个人订制','1','1','1','2016-09-19 11:37:30','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('18','1','','','2016-09-19 11:42:46','<p><img src=\"http://localhost/bstthinkcmfx/public/images/com_dz1.png\" alt=\"\"/><img src=\"http://localhost/bstthinkcmfx/public/images/com_dz2.png\" alt=\"\"/><img src=\"http://localhost/bstthinkcmfx/public/images/com_dz3.png\" alt=\"\"/><img src=\"http://localhost/bstthinkcmfx/public/images/com_dz4.png\" alt=\"\"/><img src=\"http://localhost/bstthinkcmfx/public/images/com_dz5.png\" alt=\"\"/><img src=\"http://localhost/bstthinkcmfx/public/images/com_dz6.png\" alt=\"\"/></p>','企业订制','dddddddddddddd100','1','1','2016-09-19 11:41:11','','0','0','','0','{\"thumb\":\"\"}','1','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('19','1',' 首页 / 关于公司 / 公司简介','','2016-09-20 13:55:40','<img style=\"display:block;\" src=\"http://982847940.p130580.sqnet.cn/data/upload/ueditor/20160924/57e633164ab94.jpg\" title=\"未标题-2.jpg\" alt=\"未标题-2.jpg\"/>
<p>
    倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。
</p>
<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">
    倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。
</p>
<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">
    多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。
</p>
<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">
    倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。
</p>
<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">
    未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。
</p>
<p>
    <br/>
</p>','公司简介','1','1','1','2016-09-20 13:55:11','','0','2','','0','{\"template\":\"f_comp_jianjie\",\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('20','1',' 首页 / 关于公司 / 加入我们 ','','2016-09-20 14:20:59','<h3 style=\"padding: 0px; margin: 0px 0px 0px 0px; color: rgb(67, 67, 67); font-size: 20px; font-weight: normal; font-family: 微软雅黑; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">安装工人</h3><p><br/></p><p class=\"joinUs_right_con_p1\" style=\"padding: 0px; margin: 0px; font-weight: bold; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">工作描述</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">1) 认真及时完成上级交代的各项目方案设计，并对项目开发过程中对公司产品实地设计方案提供修改意见、成本控制及施工中的可行性协调；</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">2) 管理收集分析产品相关资料，编制分管各项目设计计划任务书（或指导书等）中产品设计与施工中的相关信息和要求；</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">3) 对公司产品设计中的关键节点进行控制，及时指导研究解决设计中的重点、难点和疑点。</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">4) 负责公司项目资料的建立与管理；</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">5) 及时完成领导交代的其他临时性任务。</p><p class=\"joinUs_right_con_p1\" style=\"padding: 0px; margin: 0px; font-weight: bold; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">职位要求</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">1) 建筑、施工、等相关大专以上学历。</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">2) 1年以上相关设计经验、能看懂各种建筑图纸、有建筑设计、施工、照明相关行业经验者优先。</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">3) 熟练使用常用专业软件及办公软件和设备，如autocad 、天正、3DMAX CAD 等软件。</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">4) 自律性强，有强烈的集体认同感；有良好的职业道德，擅于沟通，良好的团队合作意识。</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">5) 年龄不限，性别不限。</p><p class=\"joinUs_right_con_p1\" style=\"padding: 0px; margin: 0px; font-weight: bold; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">应聘方式</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">可将以“姓名+应聘岗位”命名的简历发送至</p><p><br/></p>','加入我们','1','1','1','2016-09-20 14:20:08','','0','2','','0','{\"template\":\"f_comp_joinus\",\"thumb\":\"20161025\\/580ed27cc0162.jpg\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('21','1',' 首页 / 关于公司 / 联系我们 ','','2016-09-20 14:22:00','<img src=\"http://982847940.p130580.sqnet.cn/data/upload/ueditor/20160924/57e6388376296.jpg\" title=\"未标题-2.jpg\" alt=\"未标题-2.jpg\"/>
<p>
    联系电话：010-0010204 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 公司邮箱：bst@163.com
</p>
<p>
    人力资源：010-0010206&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司地址：北京市东城区王府井大街
</p>
<p>
    传 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;真：010-0010204 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;邮 &nbsp; &nbsp;&nbsp;&nbsp;编：037009
</p>
<p>
    <br/>
</p>','联系我们','1','1','1','2016-09-20 14:21:08','','0','2','','0','{\"template\":\"f_comp_jianjie\",\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('22','1','首页/ 订单服务/支付方式','','2016-09-21 11:27:49','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','支付方式','11','1','1','2016-09-21 11:26:42','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('23','1','首页 / 资料中心/ 文件下载','','2016-09-22 09:18:13','<p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost/bstThinkCMFX/public/js/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost/bstThinkCMFX/data/upload/ueditor/20160922/57e3312b34824.docx\" title=\"test.docx\">test.docx</a></p><p><br/></p><p><br/></p>','北京窗帘布保养洗涤窍门分享文档下载','1','1','1','2016-09-22 09:12:55','','0','0','','0','{\"thumb\":\"\"}','2','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('24','5','文件 下载','','2016-09-22 10:11:29','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">1</p><p><br/></p>','文件下载','1','1','1','2016-09-22 10:11:10','','0','2','','0','{\"template\":\"foot_download\",\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('26','5','1','1','2016-09-22 11:08:53','<p>1<br/></p>','1','1','1','1','2016-09-22 11:06:35','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('27','5','1','1','2016-09-22 11:10:52','<p>1<br/></p>','123','1','1','1','2016-09-22 11:10:20','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('28','5','1','1','2016-09-22 11:14:38','<p>1<br/></p>','123','1','1','1','2016-09-22 11:13:54','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('29','1','1','1','2016-09-22 12:00:34','<p>1<br/></p>','1','1','1','1','2016-09-22 12:00:18','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('30','1','1','1','2016-09-22 12:02:07','<p>1<br/></p>','12321','1','1','1','2016-09-22 12:01:54','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('31','1','','1','2016-09-22 12:45:59','<p>1<br/></p>','123aaa','1','1','1','2016-09-22 12:45:42','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('32','1','123','12','2016-09-22 12:47:08','<p>1<br/></p>','12312','12','1','1','2016-09-22 12:46:54','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('33','1','1','1','2016-09-22 13:33:15','<p>1<br/></p>','123','1','1','1','2016-09-22 13:32:46','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('34','1','a','a','2016-09-22 13:34:27','<p>a<br/></p>','123aaaaa','a','1','1','2016-09-22 13:34:14','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('35','1','123','1','2016-09-22 13:36:30','<p>1<br/></p>','1232aaag1','1','1','1','2016-09-22 13:34:48','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('36','1','1','1','2016-09-22 13:37:21','<p>1<br/></p>','fdfsdfgsd1','1','1','1','2016-09-22 13:36:49','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('37','1','123','1','2016-09-22 14:05:43','<p>adsf<br/></p>','1231','1','1','1','2016-09-22 13:41:48','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('38','1','1','','2016-09-22 14:08:31','','123','1','1','1','2016-09-22 14:07:38','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('39','1','窗帘安装 方法','','2016-09-22 14:12:22','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','常见窗帘安装方法','1','1','1','2016-09-22 14:12:05','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','./word/57e376464399b.docx','0','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('40','1','首页物流说明','','2016-09-24 18:00:22','','物流说明','倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。
倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。
多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。
倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。
未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。','0','1','2016-09-24 17:59:15','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('41','1','首页/订单服务/物流说明','','2016-09-24 18:02:18','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','物流说明','','1','1','2016-09-24 18:00:50','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('42','1','首页/资料中心/安装指导','','2016-09-26 13:32:43','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','安装指导','','1','1','2016-09-26 13:31:06','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('43','1','首页/资料中心/技术文档','','2016-09-26 13:35:15','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','技术文档','','1','1','2016-09-26 13:32:44','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('44','1','1','1','2016-09-26 13:50:39','<p>1<br/></p>','xiazia','1','1','1','2016-09-26 13:50:05','','0','','','0','{\"thumb\":\"\"}','0','0','0','0','./word/57e8b72fa7a14.docx','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('45','1','首页/服务支持/售后服务','','2016-09-26 14:04:26','<img style=\"display:block;\" src=\"http://982847940.p130580.sqnet.cn/data/upload/ueditor/20160926/57e8bb7ca1b7c.jpg\" title=\"未标题-3.jpg\" alt=\"未标题-3.jpg\"/>
<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">
    倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。
</p>
<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">
    倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。
</p>
<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">
    多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。
</p>
<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">
    倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。
</p>
<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">
    未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。
</p>
<p>
    <br/>
</p>','售后服务','','1','1','2016-09-26 14:01:21','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('46','1','首页/服务支持/维修服务','','2016-09-26 14:05:46','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','维修服务','','1','1','2016-09-26 14:04:28','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('47','1','首页/服务支持/安装服务','','2016-09-26 14:07:16','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','安装服务','','1','1','2016-09-26 14:05:49','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('49','1','遮光窗帘','','2016-09-26 15:58:31','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','遮光窗帘系列','1','1','1','2016-09-26 15:57:22','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('48','1','文件下载','','2016-09-26 15:49:59','<p>1</p>','常见窗帘安装方法','1','1','1','2016-09-26 15:47:40','','0','','','0','{\"thumb\":\"\"}','0','0','0','0','./word/57e8d327484fc.docx','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('50','1','卷帘','','2016-09-26 16:01:44','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','手动卷帘系列','','1','1','2016-09-26 16:01:05','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('51','1','首页/资料中心/安装指导/百叶窗帘系列','','2016-09-26 16:03:37','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','百叶窗帘系列','1','1','1','2016-09-26 16:02:33','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('52','1','首页/服务支持/安装服务/安装服务1','','2016-09-26 18:00:00','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','安装服务1','1','1','1','2016-09-26 17:57:42','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('53','1','首页/服务支持/安装服务/安装服务2','','2016-09-26 18:01:26','<p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin-top: 32px; margin-bottom: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','安装服务2','','1','1','2016-09-26 18:00:05','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','','');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('54','1','1','','2016-11-01 11:00:06','','一图','123','1','1','2016-11-01 10:58:54','','0','','','0','{\"thumb\":\"20161101\\/5818099d53bc3.jpg\"}','0','0','0','0','','','http://www.baidu.com');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type`, `thumb` ) VALUES  ('55','1','','','2016-11-01 11:40:40','','1','1','1','1','2016-11-01 11:40:07','','0','','','0','{\"thumb\":\"20161101\\/58180eb2482c1.png\"}','0','0','0','0','','','http://www.baidu.com');
DROP TABLE IF EXISTS `cmf_posts_file`;
CREATE TABLE `cmf_posts_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  `word` text,
  `type` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('1','1','ceshi','','2016-09-14 17:26:04','<h1 class=\"ue_t\" label=\"Title center\" name=\"tc\" style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;\"><span style=\"color:#c0504d;\">[键入文档标题]</span></h1><p><br/></p>封面以及其他文档构建基块。 您创建的图片、图表或关系图也将与当前的文档外观协调一致。<p><br/></p><br/><p class=\"ue_t\"><br/></p><p><br/></p>','测试','123','0','1','2016-09-14 17:21:38','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('3','1','首页/ 服务支持 /售后服务','','2016-09-16 12:22:22','<p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">倍思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p>','购买指南','adf','1','1','2016-09-16 12:21:57','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('2','1','','','2016-09-16 12:02:53','<p>阿萨德飞洒地方<br/></p>','他','水电费','0','1','2016-09-16 12:02:21','','0','2','','0','{\"template\":\"contact\",\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('4','1','首页/ 支付方式/支付方式一','','2016-09-17 13:12:14','<p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">倍思汀成立于2005年，是全球领先的智能系统解决方案集成商。公司通过为企业及终端用户提供创新技术和产品解决方案，让更多用户享受智能带来的创新与便捷。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">倍思汀拥有最完整的商业智能化、全宅智能和娱乐影音系统融合解决方案，通过全系列的有线、无线、业务、终端产品和专业智能服务，灵活满足不同企业和终端用户的差异化需求及快速创新的追求。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">多年来，倍思汀坚持以持续技术创新和优质服务为客户不断创造价值。公司于2014年通过ISO9001管理体系认证，于2015年通过国家级高新技术企业认定。公司凭借不断增强的创新能力，突出的灵活定制能力、完善的服务体系赢得各界客户的信任与合作。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">倍
思汀将人才视为公司最核心的资产，与北京城市学院等高校建立了产学研基地，为公司定向培养人才，将智能创新方向的设计及项目管理作为辅修课程，与学校共同
探索教学制度改革，搭建实践育人平台，突出培养学生的实践能力与专业素质，为联电国际公司逐步发展壮大源源不断的提供动力。</p><p style=\"padding: 0px 35px; margin: 32px 0px 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 25px; font-family: 微软雅黑; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">未来，倍思汀将继续致力于全球智能产业的发展，应对日新月异的挑战。</p><p><br/></p><p><br/></p>','支付方式一','123','1','1','2016-09-17 13:11:26','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('5','1',' ','','2016-09-18 10:18:16','','产品方案',' ','1','1','2016-09-18 10:17:45','','0','2','','0','{\"template\":\"product\",\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('6','1','  ','','2016-09-18 10:31:33','<p>&nbsp;1<br/></p>','智+',' ','1','1','2016-09-18 10:30:59','','0','2','','0','{\"template\":\"zhinengjia\",\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('7','1','1','','2016-09-18 11:08:51','<p>1<br/></p>','私人订制','1','1','1','2016-09-18 11:08:29','','0','2','','0','{\"template\":\"in_per_dz\",\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('8','1','1','','2016-09-18 11:09:10','<p>1<br/></p>','企业订制','1','1','1','2016-09-18 11:08:54','','0','2','','0','{\"template\":\"in_com_dz\",\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('9','1','','','2016-09-18 13:47:16','','首页banner',' ','1','1','2016-09-18 13:45:01','','0','0','','0','{\"thumb\":\"\",\"photo\":[{\"url\":\"20160918\\/57de3baf9b0b1.png\",\"alt\":\"banner2\"},{\"url\":\"20160918\\/57de2a8c309a5.png\",\"alt\":\"com_dz3\"}]}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('10','1',' ','','2016-09-18 16:27:19','<p>素雅不失温馨，简约又不失舒适。会呼吸的家最奇妙的地方</p>','四小图1','极光','1','1','2016-09-18 16:20:13','','0','0','','0','{\"thumb\":\"20160918\\/57de62181b3c9.jpg\",\"photo\":[{\"url\":\"20160918\\/57de4fdb855ac.png\",\"alt\":\"main_text\"}]}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('11','1','','','2016-09-18 16:44:11','<p>素雅不失温馨，简约又不失舒适。会呼吸的家最奇妙的地方</p>','四小图2','极光','1','1','2016-09-18 16:43:26','','0','0','','0','{\"thumb\":\"20160921\\/57e20ebfcd4d1.jpg\",\"photo\":[{\"url\":\"20160918\\/57de541a03478.png\",\"alt\":\"main_text\"}]}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('12','1','','','2016-09-18 16:46:10','<p>素雅不失温馨，简约又不失舒适。会呼吸的家最奇妙的地方</p>','四小图3','极光','1','1','2016-09-18 16:45:25','','0','0','','0','{\"thumb\":\"20160918\\/57de61da28d3e.jpg\",\"photo\":[{\"url\":\"20160918\\/57de544640a1c.png\",\"alt\":\"main_text\"}]}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('13','1','','','2016-09-18 16:46:43','<p>素雅不失温馨，简约又不失舒适。会呼吸的家最奇妙的地方</p>','四小图4','极光','1','1','2016-09-18 16:46:12','','0','0','','0','{\"thumb\":\"20160921\\/57e20f0fb35b3.jpg\",\"photo\":[{\"url\":\"20160918\\/57de547144f2e.png\",\"alt\":\"main_text\"}]}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('14','1','','','2016-09-19 10:23:02','<p>&nbsp; 1<br/></p>','产品方案banner',' ','1','1','2016-09-19 10:21:14','','0','0','','0','{\"thumb\":\"\",\"photo\":[{\"url\":\"20160919\\/57df4be89a459.png\",\"alt\":\"product_banner1\"},{\"url\":\"20160919\\/57df4bf58e9f8.png\",\"alt\":\"product_banner1\"},{\"url\":\"20160919\\/57df4bfd8532e.png\",\"alt\":\"product_banner1\"}]}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('15','1','','','2016-09-19 10:24:35','<p>1<br/></p>','产品方案轮播','1','1','1','2016-09-19 10:23:06','','0','0','','0','{\"thumb\":\"\",\"photo\":[{\"url\":\"20160919\\/57df4c4da0e79.jpg\",\"alt\":\"cpfa1\"},{\"url\":\"20160919\\/57df4c53c624d.png\",\"alt\":\"cpfa2\"},{\"url\":\"20160919\\/57df4c5ab4204.png\",\"alt\":\"cpfa3\"}]}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('16','1','','','2016-09-19 11:19:25','<p><img src=\"http://localhost/bstThinkCMFX/data/upload/ueditor/20160919/57df589fdbe60.png\" style=\"\" title=\"znj1.png\"/><img src=\"http://localhost/bstThinkCMFX/data/upload/ueditor/20160919/57df589ff0e8e.png\" style=\"\" title=\"znj2.png\"/></p>','智+','1','1','1','2016-09-19 11:13:14','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('17','1',' ','','2016-09-19 11:40:03','<img src=\"http://localhost/bstthinkcmfx/public/images/per_dz1.png\" alt=\"\"/>
<img src=\"http://localhost/bstthinkcmfx/public/images/per_dz2.png\" alt=\"\"/>
<img src=\"http://localhost/bstthinkcmfx/public/images/per_dz3.png\" alt=\"\"/>
<img src=\"http://localhost/bstthinkcmfx/public/images/per_dz4.png\" alt=\"\"/>
<img src=\"http://localhost/bstthinkcmfx/public/images/per_dz5.png\" alt=\"\"/>
<img src=\"http://localhost/bstthinkcmfx/public/images/per_dz6.png\" alt=\"\"/>
','个人订制','1','1','1','2016-09-19 11:37:30','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('18','1','','','2016-09-19 11:42:46','<p><img src=\"http://localhost/bstthinkcmfx/public/images/com_dz1.png\" alt=\"\"/><img src=\"http://localhost/bstthinkcmfx/public/images/com_dz2.png\" alt=\"\"/><img src=\"http://localhost/bstthinkcmfx/public/images/com_dz3.png\" alt=\"\"/><img src=\"http://localhost/bstthinkcmfx/public/images/com_dz4.png\" alt=\"\"/><img src=\"http://localhost/bstthinkcmfx/public/images/com_dz5.png\" alt=\"\"/><img src=\"http://localhost/bstthinkcmfx/public/images/com_dz6.png\" alt=\"\"/></p>','企业订制','dddddddddddddd100','1','1','2016-09-19 11:41:11','','0','0','','0','{\"thumb\":\"\"}','1','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('19','1','1','','2016-09-20 13:55:40','<p>1<br/></p>','公司简介','1','1','1','2016-09-20 13:55:11','','0','2','','0','{\"template\":\"f_comp_jianjie\",\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('20','1',' 首页 / 关于公司 / 加入我们 ','','2016-09-20 14:20:59','<h3 style=\"padding: 0px; margin: 0px 0px 0px 25px; color: rgb(67, 67, 67); font-size: 20px; font-weight: normal; font-family: 微软雅黑; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">安装工人</h3><p><br/></p><p class=\"joinUs_right_con_p1\" style=\"padding: 0px; margin: 0px; font-weight: bold; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">工作描述</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">1) 认真及时完成上级交代的各项目方案设计，并对项目开发过程中对公司产品实地设计方案提供修改意见、成本控制及施工中的可行性协调；</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">2) 管理收集分析产品相关资料，编制分管各项目设计计划任务书（或指导书等）中产品设计与施工中的相关信息和要求；</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">3) 对公司产品设计中的关键节点进行控制，及时指导研究解决设计中的重点、难点和疑点。</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">4) 负责公司项目资料的建立与管理；</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">5) 及时完成领导交代的其他临时性任务。</p><p class=\"joinUs_right_con_p1\" style=\"padding: 0px; margin: 0px; font-weight: bold; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">职位要求</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">1) 建筑、施工、等相关大专以上学历。</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">2) 1年以上相关设计经验、能看懂各种建筑图纸、有建筑设计、施工、照明相关行业经验者优先。</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">3) 熟练使用常用专业软件及办公软件和设备，如autocad 、天正、3DMAX CAD 等软件。</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">4) 自律性强，有强烈的集体认同感；有良好的职业道德，擅于沟通，良好的团队合作意识。</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">5) 年龄不限，性别不限。</p><p class=\"joinUs_right_con_p1\" style=\"padding: 0px; margin: 0px; font-weight: bold; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">应聘方式</p><p style=\"padding: 0px; margin: 0px; color: rgb(83, 83, 83); font-size: 14px; line-height: 32px;\">可将以“姓名+应聘岗位”命名的简历发送至</p><p><br/></p>','加入我们','1','1','1','2016-09-20 14:20:08','','0','2','','0','{\"template\":\"f_comp_joinus\",\"thumb\":\"20160920\\/57e0d9a2427c2.png\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('21','1',' 首页 / 关于公司 / 联系我们 ','','2016-09-20 14:22:00','<p>1<br/></p>','联系我们','1','1','1','2016-09-20 14:21:08','','0','2','','0','{\"template\":\"f_comp_jianjie\",\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('22','1','首页/ 服务支持 /支付方式','','2016-09-21 11:27:49','<p>新风格风格</p>','支付方式','11','0','1','2016-09-21 11:26:42','','0','2','','0','{\"template\":\"test\",\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('23','1','首页 / 资料中心/ 文件下载','','2016-09-22 09:18:13','<p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost/bstThinkCMFX/public/js/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost/bstThinkCMFX/data/upload/ueditor/20160922/57e3312b34824.docx\" title=\"test.docx\">test.docx</a></p><p><br/></p><p><br/></p>','北京窗帘布保养洗涤窍门分享文档下载','1','1','1','2016-09-22 09:12:55','','0','0','','0','{\"thumb\":\"\"}','2','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('24','5','','','2016-09-22 10:11:29','<p>1<br/></p>','文件下载','1','1','1','2016-09-22 10:11:10','','0','2','','0','{\"template\":\"foot_download\",\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('25','5','1','1','2016-09-22 11:02:27','<p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost/bstThinkCMFX/public/js/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost/bstThinkCMFX/data/upload/ueditor/20160922/57e349c08cddf.docx\" title=\"test.docx\">test.docx</a></p><p><br/></p>','1','1','1','1','2016-09-22 11:02:02','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('26','5','1','1','2016-09-22 11:08:53','<p>1<br/></p>','1','1','1','1','2016-09-22 11:06:35','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('27','5','1','1','2016-09-22 11:10:52','<p>1<br/></p>','123','1','1','1','2016-09-22 11:10:20','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0');
INSERT INTO cmf_posts_file ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `word`, `type` ) VALUES  ('28','5','1','1','2016-09-22 11:14:38','<p>1<br/></p>','123','1','1','1','2016-09-22 11:13:54','','0','0','','0','{\"thumb\":\"\"}','0','0','0','0','','0');
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('1','超级管理员','0','1','拥有网站最高管理员权限！','1329633709','1329633709','0');
INSERT INTO cmf_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('3','客服d','0','1','123d','1474508026','1474599054','0');
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_role_user ( `role_id`, `user_id` ) VALUES  ('3','5');
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_slide_cat`;
CREATE TABLE `cmf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_term_relationships`;
CREATE TABLE `cmf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('1','9','6','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('2','10','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('3','11','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('4','12','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('5','13','7','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('6','14','9','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('7','15','10','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('8','16','11','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('9','17','13','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('10','18','14','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('12','23','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('28','44','30','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('14','26','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('15','27','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('16','28','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('17','29','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('18','30','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('19','31','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('20','32','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('21','33','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('22','34','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('23','35','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('24','36','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('25','37','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('26','38','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('27','39','30','0','0');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('29','48','30','0','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('30','54','6','1','1');
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('31','55','9','1','1');
DROP TABLE IF EXISTS `cmf_terms`;
CREATE TABLE `cmf_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('10','第二轮播','','picture','','8','0','0-8-10','','','','list','article','2','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('9','banner图','','picture','','8','0','0-8-9','','','','list','article','1','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('8','产品方案','','article','','0','0','0-8','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('5','首页','','picture','','0','0','0-5','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('7','四个小图','','picture','','5','0','0-5-7','','','','list','article','2','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('6','首页banner','','picture','','5','0','0-5-6','','','','list','article','1','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('11','智+','','article','','0','0','0-11','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('12','专属订制','','article','','0','0','0-12','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('13','个人订制','','article','','12','0','0-12-13','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('14','企业订制','','article','','12','0','0-12-14','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('15','商品分类','','article','','0','0','0-15','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('16','产品套系','','article','cptx','15','0','0-15-16','','','','list','article','2','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('17','风格类型','','article','fglx','15','0','0-15-17','','','','list','article','1','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('18','适用房间','','article','syfj','15','0','0-15-18','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('19','分类筛选','','article','flsx','15','0','0-15-19','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('20','意境','','article','cptx','16','0','0-15-16-20','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('21','古风','','article','','16','0','0-15-16-21','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('22','现代简约','','article','','17','0','0-15-17-22','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('23','乡村','','article','','17','0','0-15-17-23','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('24','客厅','','article','','18','0','0-15-18-24','','','','list','article','2','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('25','卧室','','article','','18','0','0-15-18-25','','','','list','article','1','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('26','开合帘','','article','khl','19','0','0-15-19-26','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('27','卷帘','','article','','19','0','0-15-19-27','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('30','文件下载','','article','','29','0','0-29-30','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('29','资料中心','','article','','0','0','0-29','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('39','66号公路','','article','','16','0','0-15-16-39','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('38','旖旎时光','','article','','16','0','0-15-16-38','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('34','服务支持','','article','','0','0','0-34','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('35','售后服务','','article','','34','0','0-34-35','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('36','维修服务','','article','','34','0','0-34-36','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('37','安装服务','','article','','34','0','0-34-37','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('40','洛丽塔','','article','','16','0','0-15-16-40','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('41','佩斯利','','article','','16','0','0-15-16-41','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('42','赫本','','article','','16','0','0-15-16-42','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('43','卡通','','article','','17','0','0-15-17-43','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('44','美式','','article','','17','0','0-15-17-44','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('45','书房','','article','','18','0','0-15-18-45','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('46','卫生间','','article','','18','0','0-15-18-46','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('47','适用窗型','','article','sycx','15','0','0-15-47','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('48','半高窗','','article','','47','0','0-15-47-48','','','','list','article','0','1','');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `type` ) VALUES  ('49','落地窗','','article','','47','0','0-15-47-49','','','','list','article','0','1','');
DROP TABLE IF EXISTS `cmf_user_favorites`;
CREATE TABLE `cmf_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_users`;
CREATE TABLE `cmf_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('1','admin','###22757f0074f9faf8ba8eca9da5306ff9','admin','1312@qq.com','','','0','0000-00-00','','0.0.0.0','2016-11-03 09:58:41','2016-09-01 02:57:48','','1','0','1','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('2','admin','123','admin','1312@qq.com','','','0','0000-00-00','','124.202.207.110','2016-09-21 13:45:29','2016-09-01 02:57:48','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('3','18615502008','558157','','','','','0','0000-00-00','','0.0.0.0','2016-09-21 15:50:38','2000-01-01 00:00:00','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('5','123','###1cd2ca2153af20c65df9cbdfd0765374','','111@qq.com','','','0','0000-00-00','','0.0.0.0','2016-10-18 11:48:42','2016-09-22 09:35:29','','1','0','1','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('4','18911701922','505203','','','','','0','0000-00-00','','124.202.207.110','2016-09-26 16:53:41','2000-01-01 00:00:00','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('6','15201360916','613437','','','','','0','0000-00-00','','','2000-01-01 00:00:00','2000-01-01 00:00:00','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('7','17710402816','289782','','','','','0','0000-00-00','','','2000-01-01 00:00:00','2000-01-01 00:00:00','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('8','18801314046','193247','','','','','0','0000-00-00','','','2000-01-01 00:00:00','2000-01-01 00:00:00','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('10','18310208162','918713','','','','','0','','','','2000-01-01 00:00:00','2000-01-01 00:00:00','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('11','13656667003','891146','','','','','0','','','','2000-01-01 00:00:00','2000-01-01 00:00:00','','1','0','2','0','');
DROP TABLE IF EXISTS `sp_ad`;
CREATE TABLE `sp_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL,
  `ad_content` text,
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_asset`;
CREATE TABLE `sp_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filepath` varchar(200) NOT NULL,
  `uploadtime` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `meta` text,
  `suffix` varchar(50) DEFAULT NULL,
  `download_times` int(6) NOT NULL,
  PRIMARY KEY (`aid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_auth_access`;
CREATE TABLE `sp_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_auth_rule`;
CREATE TABLE `sp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('1','Admin','admin_url','admin/content/default','','内容管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('2','Api','admin_url','api/guestbookadmin/index','','所有留言','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('3','Api','admin_url','api/guestbookadmin/delete','','删除网站留言','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('4','Comment','admin_url','comment/commentadmin/index','','评论管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('5','Comment','admin_url','comment/commentadmin/delete','','删除评论','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('6','Comment','admin_url','comment/commentadmin/check','','评论审核','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('7','Portal','admin_url','portal/adminpost/index','','文章管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('8','Portal','admin_url','portal/adminpost/listorders','','文章排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('9','Portal','admin_url','portal/adminpost/top','','文章置顶','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('10','Portal','admin_url','portal/adminpost/recommend','','文章推荐','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('11','Portal','admin_url','portal/adminpost/move','','批量移动','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('12','Portal','admin_url','portal/adminpost/check','','文章审核','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('13','Portal','admin_url','portal/adminpost/delete','','删除文章','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('14','Portal','admin_url','portal/adminpost/edit','','编辑文章','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('15','Portal','admin_url','portal/adminpost/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('16','Portal','admin_url','portal/adminpost/add','','添加文章','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('17','Portal','admin_url','portal/adminpost/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('18','Portal','admin_url','portal/adminterm/index','','分类管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('19','Portal','admin_url','portal/adminterm/listorders','','文章分类排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('20','Portal','admin_url','portal/adminterm/delete','','删除分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('21','Portal','admin_url','portal/adminterm/edit','','编辑分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('22','Portal','admin_url','portal/adminterm/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('23','Portal','admin_url','portal/adminterm/add','','添加分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('24','Portal','admin_url','portal/adminterm/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('25','Portal','admin_url','portal/adminpage/index','','页面管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('26','Portal','admin_url','portal/adminpage/listorders','','页面排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('27','Portal','admin_url','portal/adminpage/delete','','删除页面','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('28','Portal','admin_url','portal/adminpage/edit','','编辑页面','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('29','Portal','admin_url','portal/adminpage/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('30','Portal','admin_url','portal/adminpage/add','','添加页面','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('31','Portal','admin_url','portal/adminpage/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('32','Admin','admin_url','admin/recycle/default','','回收站','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('33','Portal','admin_url','portal/adminpost/recyclebin','','文章回收','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('34','Portal','admin_url','portal/adminpost/restore','','文章还原','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('35','Portal','admin_url','portal/adminpost/clean','','彻底删除','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('36','Portal','admin_url','portal/adminpage/recyclebin','','页面回收','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('37','Portal','admin_url','portal/adminpage/clean','','彻底删除','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('38','Portal','admin_url','portal/adminpage/restore','','页面还原','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('39','Admin','admin_url','admin/extension/default','','扩展工具','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('40','Admin','admin_url','admin/backup/default','','备份管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('41','Admin','admin_url','admin/backup/restore','','数据还原','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('42','Admin','admin_url','admin/backup/index','','数据备份','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('43','Admin','admin_url','admin/backup/index_post','','提交数据备份','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('44','Admin','admin_url','admin/backup/download','','下载备份','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('45','Admin','admin_url','admin/backup/del_backup','','删除备份','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('46','Admin','admin_url','admin/backup/import','','数据备份导入','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('47','Admin','admin_url','admin/plugin/index','','插件管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('48','Admin','admin_url','admin/plugin/toggle','','插件启用切换','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('49','Admin','admin_url','admin/plugin/setting','','插件设置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('50','Admin','admin_url','admin/plugin/setting_post','','插件设置提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('51','Admin','admin_url','admin/plugin/install','','插件安装','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('52','Admin','admin_url','admin/plugin/uninstall','','插件卸载','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('53','Admin','admin_url','admin/slide/default','','幻灯片','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('54','Admin','admin_url','admin/slide/index','','幻灯片管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('55','Admin','admin_url','admin/slide/listorders','','幻灯片排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('56','Admin','admin_url','admin/slide/toggle','','幻灯片显示切换','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('57','Admin','admin_url','admin/slide/delete','','删除幻灯片','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('58','Admin','admin_url','admin/slide/edit','','编辑幻灯片','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('59','Admin','admin_url','admin/slide/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('60','Admin','admin_url','admin/slide/add','','添加幻灯片','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('61','Admin','admin_url','admin/slide/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('62','Admin','admin_url','admin/slidecat/index','','幻灯片分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('63','Admin','admin_url','admin/slidecat/delete','','删除分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('64','Admin','admin_url','admin/slidecat/edit','','编辑分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('65','Admin','admin_url','admin/slidecat/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('66','Admin','admin_url','admin/slidecat/add','','添加分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('67','Admin','admin_url','admin/slidecat/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('68','Admin','admin_url','admin/ad/index','','网站广告','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('69','Admin','admin_url','admin/ad/toggle','','广告显示切换','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('70','Admin','admin_url','admin/ad/delete','','删除广告','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('71','Admin','admin_url','admin/ad/edit','','编辑广告','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('72','Admin','admin_url','admin/ad/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('73','Admin','admin_url','admin/ad/add','','添加广告','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('74','Admin','admin_url','admin/ad/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('75','Admin','admin_url','admin/link/index','','友情链接','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('76','Admin','admin_url','admin/link/listorders','','友情链接排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('77','Admin','admin_url','admin/link/toggle','','友链显示切换','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('78','Admin','admin_url','admin/link/delete','','删除友情链接','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('79','Admin','admin_url','admin/link/edit','','编辑友情链接','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('80','Admin','admin_url','admin/link/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('81','Admin','admin_url','admin/link/add','','添加友情链接','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('82','Admin','admin_url','admin/link/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('83','Api','admin_url','api/oauthadmin/setting','','第三方登陆','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('84','Api','admin_url','api/oauthadmin/setting_post','','提交设置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('85','Admin','admin_url','admin/menu/default','','菜单管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('86','Admin','admin_url','admin/navcat/default1','','前台菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('87','Admin','admin_url','admin/nav/index','','菜单管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('88','Admin','admin_url','admin/nav/listorders','','前台导航排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('89','Admin','admin_url','admin/nav/delete','','删除菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('90','Admin','admin_url','admin/nav/edit','','编辑菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('91','Admin','admin_url','admin/nav/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('92','Admin','admin_url','admin/nav/add','','添加菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('93','Admin','admin_url','admin/nav/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('94','Admin','admin_url','admin/navcat/index','','菜单分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('95','Admin','admin_url','admin/navcat/delete','','删除分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('96','Admin','admin_url','admin/navcat/edit','','编辑分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('97','Admin','admin_url','admin/navcat/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('98','Admin','admin_url','admin/navcat/add','','添加分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('99','Admin','admin_url','admin/navcat/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('100','Admin','admin_url','admin/menu/index','','后台菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('101','Admin','admin_url','admin/menu/add','','添加菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('102','Admin','admin_url','admin/menu/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('103','Admin','admin_url','admin/menu/listorders','','后台菜单排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('104','Admin','admin_url','admin/menu/export_menu','','菜单备份','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('105','Admin','admin_url','admin/menu/edit','','编辑菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('106','Admin','admin_url','admin/menu/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('107','Admin','admin_url','admin/menu/delete','','删除菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('108','Admin','admin_url','admin/menu/lists','','所有菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('109','Admin','admin_url','admin/setting/default','','设置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('110','Admin','admin_url','admin/setting/userdefault','','个人信息','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('111','Admin','admin_url','admin/user/userinfo','','修改信息','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('112','Admin','admin_url','admin/user/userinfo_post','','修改信息提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('113','Admin','admin_url','admin/setting/password','','修改密码','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('114','Admin','admin_url','admin/setting/password_post','','提交修改','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('115','Admin','admin_url','admin/setting/site','','网站信息','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('116','Admin','admin_url','admin/setting/site_post','','提交修改','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('117','Admin','admin_url','admin/route/index','','路由列表','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('118','Admin','admin_url','admin/route/add','','路由添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('119','Admin','admin_url','admin/route/add_post','','路由添加提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('120','Admin','admin_url','admin/route/edit','','路由编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('121','Admin','admin_url','admin/route/edit_post','','路由编辑提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('122','Admin','admin_url','admin/route/delete','','路由删除','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('123','Admin','admin_url','admin/route/ban','','路由禁止','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('124','Admin','admin_url','admin/route/open','','路由启用','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('125','Admin','admin_url','admin/route/listorders','','路由排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('126','Admin','admin_url','admin/mailer/default','','邮箱配置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('127','Admin','admin_url','admin/mailer/index','','SMTP配置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('128','Admin','admin_url','admin/mailer/index_post','','提交配置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('129','Admin','admin_url','admin/mailer/active','','邮件模板','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('130','Admin','admin_url','admin/mailer/active_post','','提交模板','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('131','Admin','admin_url','admin/setting/clearcache','','清除缓存','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('132','User','admin_url','user/indexadmin/default','','用户管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('133','User','admin_url','user/indexadmin/default1','','用户组','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('134','User','admin_url','user/indexadmin/index','','本站用户','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('135','User','admin_url','user/indexadmin/ban','','拉黑会员','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('136','User','admin_url','user/indexadmin/cancelban','','启用会员','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('137','User','admin_url','user/oauthadmin/index','','第三方用户','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('138','User','admin_url','user/oauthadmin/delete','','第三方用户解绑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('139','User','admin_url','user/indexadmin/default3','','管理组','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('140','Admin','admin_url','admin/rbac/index','','角色管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('141','Admin','admin_url','admin/rbac/member','','成员管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('142','Admin','admin_url','admin/rbac/authorize','','权限设置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('143','Admin','admin_url','admin/rbac/authorize_post','','提交设置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('144','Admin','admin_url','admin/rbac/roleedit','','编辑角色','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('145','Admin','admin_url','admin/rbac/roleedit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('146','Admin','admin_url','admin/rbac/roledelete','','删除角色','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('147','Admin','admin_url','admin/rbac/roleadd','','添加角色','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('148','Admin','admin_url','admin/rbac/roleadd_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('149','Admin','admin_url','admin/user/index','','管理员','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('150','Admin','admin_url','admin/user/delete','','删除管理员','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('151','Admin','admin_url','admin/user/edit','','管理员编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('152','Admin','admin_url','admin/user/edit_post','','编辑提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('153','Admin','admin_url','admin/user/add','','管理员添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('154','Admin','admin_url','admin/user/add_post','','添加提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('155','Admin','admin_url','admin/plugin/update','','插件更新','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('156','Admin','admin_url','admin/storage/index','','文件存储','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('157','Admin','admin_url','admin/storage/setting_post','','文件存储设置提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('158','Admin','admin_url','admin/slide/ban','','禁用幻灯片','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('159','Admin','admin_url','admin/slide/cancelban','','启用幻灯片','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('160','Admin','admin_url','admin/user/ban','','禁用管理员','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('161','Admin','admin_url','admin/user/cancelban','','启用管理员','1','');
DROP TABLE IF EXISTS `sp_comments`;
CREATE TABLE `sp_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_common_action_log`;
CREATE TABLE `sp_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_guestbook`;
CREATE TABLE `sp_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL,
  `status` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_links`;
CREATE TABLE `sp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT '',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_links ( `link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_status`, `link_rating`, `link_rel`, `listorder` ) VALUES  ('1','http://www.thinkcmf.com','ThinkCMF','','_blank','','1','0','','0');
DROP TABLE IF EXISTS `sp_menu`;
CREATE TABLE `sp_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('1','0','Admin','Content','default','','0','1','内容管理','th','','30');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('2','1','Api','Guestbookadmin','index','','1','1','所有留言','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('3','2','Api','Guestbookadmin','delete','','1','0','删除网站留言','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('4','1','Comment','Commentadmin','index','','1','1','评论管理','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('5','4','Comment','Commentadmin','delete','','1','0','删除评论','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('6','4','Comment','Commentadmin','check','','1','0','评论审核','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('7','1','Portal','AdminPost','index','','1','1','文章管理','','','1');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('8','7','Portal','AdminPost','listorders','','1','0','文章排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('9','7','Portal','AdminPost','top','','1','0','文章置顶','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('10','7','Portal','AdminPost','recommend','','1','0','文章推荐','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('11','7','Portal','AdminPost','move','','1','0','批量移动','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('12','7','Portal','AdminPost','check','','1','0','文章审核','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('13','7','Portal','AdminPost','delete','','1','0','删除文章','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('14','7','Portal','AdminPost','edit','','1','0','编辑文章','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('15','14','Portal','AdminPost','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('16','7','Portal','AdminPost','add','','1','0','添加文章','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('17','16','Portal','AdminPost','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('18','1','Portal','AdminTerm','index','','0','1','分类管理','','','2');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('19','18','Portal','AdminTerm','listorders','','1','0','文章分类排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('20','18','Portal','AdminTerm','delete','','1','0','删除分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('21','18','Portal','AdminTerm','edit','','1','0','编辑分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('22','21','Portal','AdminTerm','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('23','18','Portal','AdminTerm','add','','1','0','添加分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('24','23','Portal','AdminTerm','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('25','1','Portal','AdminPage','index','','1','1','页面管理','','','3');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('26','25','Portal','AdminPage','listorders','','1','0','页面排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('27','25','Portal','AdminPage','delete','','1','0','删除页面','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('28','25','Portal','AdminPage','edit','','1','0','编辑页面','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('29','28','Portal','AdminPage','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('30','25','Portal','AdminPage','add','','1','0','添加页面','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('31','30','Portal','AdminPage','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('32','1','Admin','Recycle','default','','1','1','回收站','','','4');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('33','32','Portal','AdminPost','recyclebin','','1','1','文章回收','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('34','33','Portal','AdminPost','restore','','1','0','文章还原','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('35','33','Portal','AdminPost','clean','','1','0','彻底删除','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('36','32','Portal','AdminPage','recyclebin','','1','1','页面回收','','','1');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('37','36','Portal','AdminPage','clean','','1','0','彻底删除','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('38','36','Portal','AdminPage','restore','','1','0','页面还原','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('39','0','Admin','Extension','default','','0','1','扩展工具','cloud','','40');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('40','39','Admin','Backup','default','','1','1','备份管理','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('41','40','Admin','Backup','restore','','1','1','数据还原','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('42','40','Admin','Backup','index','','1','1','数据备份','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('43','42','Admin','Backup','index_post','','1','0','提交数据备份','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('44','40','Admin','Backup','download','','1','0','下载备份','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('45','40','Admin','Backup','del_backup','','1','0','删除备份','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('46','40','Admin','Backup','import','','1','0','数据备份导入','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('47','39','Admin','Plugin','index','','1','1','插件管理','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('48','47','Admin','Plugin','toggle','','1','0','插件启用切换','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('49','47','Admin','Plugin','setting','','1','0','插件设置','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('50','49','Admin','Plugin','setting_post','','1','0','插件设置提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('51','47','Admin','Plugin','install','','1','0','插件安装','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('52','47','Admin','Plugin','uninstall','','1','0','插件卸载','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('53','39','Admin','Slide','default','','1','1','幻灯片','','','1');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('54','53','Admin','Slide','index','','1','1','幻灯片管理','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('55','54','Admin','Slide','listorders','','1','0','幻灯片排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('56','54','Admin','Slide','toggle','','1','0','幻灯片显示切换','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('57','54','Admin','Slide','delete','','1','0','删除幻灯片','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('58','54','Admin','Slide','edit','','1','0','编辑幻灯片','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('59','58','Admin','Slide','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('60','54','Admin','Slide','add','','1','0','添加幻灯片','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('61','60','Admin','Slide','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('62','53','Admin','Slidecat','index','','1','1','幻灯片分类','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('63','62','Admin','Slidecat','delete','','1','0','删除分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('64','62','Admin','Slidecat','edit','','1','0','编辑分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('65','64','Admin','Slidecat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('66','62','Admin','Slidecat','add','','1','0','添加分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('67','66','Admin','Slidecat','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('68','39','Admin','Ad','index','','1','1','网站广告','','','2');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('69','68','Admin','Ad','toggle','','1','0','广告显示切换','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('70','68','Admin','Ad','delete','','1','0','删除广告','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('71','68','Admin','Ad','edit','','1','0','编辑广告','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('72','71','Admin','Ad','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('73','68','Admin','Ad','add','','1','0','添加广告','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('74','73','Admin','Ad','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('75','39','Admin','Link','index','','0','1','友情链接','','','3');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('76','75','Admin','Link','listorders','','1','0','友情链接排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('77','75','Admin','Link','toggle','','1','0','友链显示切换','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('78','75','Admin','Link','delete','','1','0','删除友情链接','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('79','75','Admin','Link','edit','','1','0','编辑友情链接','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('80','79','Admin','Link','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('81','75','Admin','Link','add','','1','0','添加友情链接','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('82','81','Admin','Link','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('83','39','Api','Oauthadmin','setting','','1','1','第三方登陆','leaf','','4');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('84','83','Api','Oauthadmin','setting_post','','1','0','提交设置','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('85','0','Admin','Menu','default','','1','1','菜单管理','list','','20');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('86','85','Admin','Navcat','default1','','1','1','前台菜单','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('87','86','Admin','Nav','index','','1','1','菜单管理','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('88','87','Admin','Nav','listorders','','1','0','前台导航排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('89','87','Admin','Nav','delete','','1','0','删除菜单','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('90','87','Admin','Nav','edit','','1','0','编辑菜单','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('91','90','Admin','Nav','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('92','87','Admin','Nav','add','','1','0','添加菜单','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('93','92','Admin','Nav','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('94','86','Admin','Navcat','index','','1','1','菜单分类','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('95','94','Admin','Navcat','delete','','1','0','删除分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('96','94','Admin','Navcat','edit','','1','0','编辑分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('97','96','Admin','Navcat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('98','94','Admin','Navcat','add','','1','0','添加分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('99','98','Admin','Navcat','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('100','85','Admin','Menu','index','','1','1','后台菜单','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('101','100','Admin','Menu','add','','1','0','添加菜单','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('102','101','Admin','Menu','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('103','100','Admin','Menu','listorders','','1','0','后台菜单排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('104','100','Admin','Menu','export_menu','','1','0','菜单备份','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('105','100','Admin','Menu','edit','','1','0','编辑菜单','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('106','105','Admin','Menu','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('107','100','Admin','Menu','delete','','1','0','删除菜单','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('108','100','Admin','Menu','lists','','1','0','所有菜单','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('109','0','Admin','Setting','default','','0','1','设置','cogs','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('110','109','Admin','Setting','userdefault','','0','1','个人信息','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('111','110','Admin','User','userinfo','','1','1','修改信息','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('112','111','Admin','User','userinfo_post','','1','0','修改信息提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('113','110','Admin','Setting','password','','1','1','修改密码','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('114','113','Admin','Setting','password_post','','1','0','提交修改','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('115','109','Admin','Setting','site','','1','1','网站信息','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('116','115','Admin','Setting','site_post','','1','0','提交修改','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('117','115','Admin','Route','index','','1','0','路由列表','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('118','115','Admin','Route','add','','1','0','路由添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('119','118','Admin','Route','add_post','','1','0','路由添加提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('120','115','Admin','Route','edit','','1','0','路由编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('121','120','Admin','Route','edit_post','','1','0','路由编辑提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('122','115','Admin','Route','delete','','1','0','路由删除','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('123','115','Admin','Route','ban','','1','0','路由禁止','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('124','115','Admin','Route','open','','1','0','路由启用','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('125','115','Admin','Route','listorders','','1','0','路由排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('126','109','Admin','Mailer','default','','1','1','邮箱配置','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('127','126','Admin','Mailer','index','','1','1','SMTP配置','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('128','127','Admin','Mailer','index_post','','1','0','提交配置','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('129','126','Admin','Mailer','active','','1','1','邮件模板','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('130','129','Admin','Mailer','active_post','','1','0','提交模板','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('131','109','Admin','Setting','clearcache','','1','1','清除缓存','','','1');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('132','0','User','Indexadmin','default','','1','1','用户管理','group','','10');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('133','132','User','Indexadmin','default1','','1','1','用户组','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('134','133','User','Indexadmin','index','','1','1','本站用户','leaf','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('135','134','User','Indexadmin','ban','','1','0','拉黑会员','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('136','134','User','Indexadmin','cancelban','','1','0','启用会员','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('137','133','User','Oauthadmin','index','','1','1','第三方用户','leaf','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('138','137','User','Oauthadmin','delete','','1','0','第三方用户解绑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('139','132','User','Indexadmin','default3','','1','1','管理组','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('140','139','Admin','Rbac','index','','1','1','角色管理','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('141','140','Admin','Rbac','member','','1','0','成员管理','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('142','140','Admin','Rbac','authorize','','1','0','权限设置','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('143','142','Admin','Rbac','authorize_post','','1','0','提交设置','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('144','140','Admin','Rbac','roleedit','','1','0','编辑角色','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('145','144','Admin','Rbac','roleedit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('146','140','Admin','Rbac','roledelete','','1','1','删除角色','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('147','140','Admin','Rbac','roleadd','','1','1','添加角色','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('148','147','Admin','Rbac','roleadd_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('149','139','Admin','User','index','','1','1','管理员','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('150','149','Admin','User','delete','','1','0','删除管理员','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('151','149','Admin','User','edit','','1','0','管理员编辑','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('152','151','Admin','User','edit_post','','1','0','编辑提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('153','149','Admin','User','add','','1','0','管理员添加','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('154','153','Admin','User','add_post','','1','0','添加提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('155','47','Admin','Plugin','update','','1','0','插件更新','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('156','39','Admin','Storage','index','','1','1','文件存储','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('157','156','Admin','Storage','setting_post','','1','0','文件存储设置提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('158','54','Admin','Slide','ban','','1','0','禁用幻灯片','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('159','54','Admin','Slide','cancelban','','1','0','启用幻灯片','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('160','149','Admin','User','ban','','1','0','禁用管理员','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('161','149','Admin','User','cancelban','','1','0','启用管理员','','','0');
DROP TABLE IF EXISTS `sp_nav`;
CREATE TABLE `sp_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `parentid` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `target` varchar(50) DEFAULT NULL,
  `href` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `listorder` int(6) DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('1','1','0','首页','','home','','1','0','0-1');
INSERT INTO sp_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('2','1','0','列表演示','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}','','1','0','0-2');
INSERT INTO sp_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('3','1','0','瀑布流','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}','','1','0','0-3');
DROP TABLE IF EXISTS `sp_nav_cat`;
CREATE TABLE `sp_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `remark` text,
  PRIMARY KEY (`navcid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('1','主导航','1','主导航');
DROP TABLE IF EXISTS `sp_oauth_user`;
CREATE TABLE `sp_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(60) NOT NULL,
  `expires_date` int(12) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_options`;
CREATE TABLE `sp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('1','member_email_active','{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}','1');
INSERT INTO sp_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('2','site_options','            {
            		\"site_name\":\"ThinkCMF内容管理框架\",
            		\"site_host\":\"http://127.0.0.1/Think/\",
            		\"site_root\":\"\",
            		\"site_icp\":\"\",
            		\"site_admin_email\":\"519893064@qq.com\",
            		\"site_tongji\":\"\",
            		\"site_copyright\":\"\",
            		\"site_seo_title\":\"ThinkCMF内容管理框架\",
            		\"site_seo_keywords\":\"\",
            		\"site_seo_description\":\"ThinkCMF是简约风网络科技发布的一款用于快速开发的内容管理框架\"
        }','1');
DROP TABLE IF EXISTS `sp_plugins`;
CREATE TABLE `sp_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_posts`;
CREATE TABLE `sp_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_role`;
CREATE TABLE `sp_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('1','超级管理员','0','1','拥有网站最高管理员权限！','1329633709','1329633709','0');
DROP TABLE IF EXISTS `sp_role_user`;
CREATE TABLE `sp_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_route`;
CREATE TABLE `sp_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_slide`;
CREATE TABLE `sp_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` bigint(20) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_pic` varchar(255) DEFAULT NULL,
  `slide_url` varchar(255) DEFAULT NULL,
  `slide_des` varchar(255) DEFAULT NULL,
  `slide_content` text,
  `slide_status` int(2) NOT NULL DEFAULT '1',
  `listorder` int(10) DEFAULT '0',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_slide_cat`;
CREATE TABLE `sp_slide_cat` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_idname` varchar(255) NOT NULL,
  `cat_remark` text,
  `cat_status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_term_relationships`;
CREATE TABLE `sp_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_terms`;
CREATE TABLE `sp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('1','列表演示','','article','','0','0','0-1','','','','list','article','0','1');
INSERT INTO sp_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('2','瀑布流','','article','','0','0','0-2','','','','list_masonry','article','0','1');
DROP TABLE IF EXISTS `sp_user_favorites`;
CREATE TABLE `sp_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_users`;
CREATE TABLE `sp_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type` ) VALUES  ('1','admin','c535018ee94621232f297a57a5a743894a0e4a801fc389af','admin','519893064@qq.com','','','0','0000-00-00','','127.0.0.1','2016-01-27 12:01:32','2016-01-27 12:00:26','','1','0','1');
