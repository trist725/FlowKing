/*
MySQL Data Transfer
Source Host: localhost
Source Database: jeecms_2012_sp1
Target Host: localhost
Target Database: jeecms_2012_sp1
Date: 2013/8/9 17:55:24
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for areas
-- ----------------------------
CREATE TABLE `areas` (
  `taskid` int(11) NOT NULL COMMENT '任务号',
  `areas` varchar(5000) default NULL COMMENT '选择的所有地区（用；隔开）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for batch_fixed
-- ----------------------------
CREATE TABLE `batch_fixed` (
  `taskid` int(11) NOT NULL default '0' COMMENT '任务号',
  `ipDay` int(11) default NULL COMMENT '日ip量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for batch_plan
-- ----------------------------
CREATE TABLE `batch_plan` (
  `p_id` int(11) NOT NULL COMMENT '序号',
  `taskid` int(11) default NULL COMMENT '任务号',
  `startTime` varchar(50) default NULL COMMENT '开始时间',
  `endTime` varchar(50) default NULL COMMENT '结束时间',
  `days` int(11) default NULL COMMENT '天数',
  `ips` int(10) unsigned zerofill default NULL COMMENT '计划IP量',
  `p_state` varchar(10) default NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clicktarget_custom
-- ----------------------------
CREATE TABLE `clicktarget_custom` (
  `c_id` int(11) NOT NULL COMMENT '序号',
  `taskid` int(11) default NULL COMMENT '任务号',
  `c_type` varchar(50) default NULL COMMENT '点击类型',
  `c_content` varchar(1000) default NULL COMMENT '点击内容',
  `c_percent` varchar(50) default NULL COMMENT '百分比'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clicktarget_customfully
-- ----------------------------
CREATE TABLE `clicktarget_customfully` (
  `cf_id` int(11) NOT NULL COMMENT '序号',
  `taskid` int(11) default NULL COMMENT '任务号',
  `params` varchar(50) default NULL COMMENT '访问参数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for firstpage
-- ----------------------------
CREATE TABLE `firstpage` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(2000) default NULL,
  `content` varchar(5000) default NULL,
  `orders` int(11) default NULL,
  `imgs` varchar(2000) default NULL,
  `types` varchar(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for flow_task
-- ----------------------------
CREATE TABLE `flow_task` (
  `taskid` int(11) NOT NULL auto_increment COMMENT '任务标识（自动增长',
  `tasktype` varchar(1) default NULL COMMENT '1刷流量，2刷人气，3刷广告，4刷Alexa，5刷QQ空间',
  `userid` int(11) default NULL COMMENT '  对应用户注册表中u_user',
  `priceTotal` varchar(100) default NULL COMMENT '总费用（1.00点/天或1.00点）',
  `webname` varchar(100) default NULL COMMENT '网站名称',
  `websize` varchar(1000) default NULL COMMENT '网站地址URL',
  `ipSet` varchar(1) default NULL COMMENT ' 预设流量（1.固定模式 2.\r\n计划模式）',
  `ipPrice` varchar(100) default NULL COMMENT ' Ip流量费（1.00点/天或1.00点）',
  `ipPvRadio` int(11) default NULL COMMENT 'IP / PV比例，1表示1:1, 2表示1:2\r\n依此类推',
  `pvStay` varchar(1) default NULL COMMENT 'PV停留时间，10-15秒为1，20-30秒为2，依此类推',
  `pvPrice` varchar(100) default NULL COMMENT 'Pv附加费（1.00点/天或1.00点）',
  `source` varchar(1) default NULL COMMENT '来源网址(1.停用来源2，随机来源3，自定义 4.批量来源)',
  `clickTarget` varchar(1) default NULL COMMENT '点击网址（1.停用点击2，随机点击 3.自定义点击 4.自定义路径）',
  `UAset` varchar(1) default NULL COMMENT 'UA设置（1.自动随机2.批量UA）',
  `forbids` varchar(1) default NULL COMMENT '点击白名单(1.启用 2，关闭)',
  `areas` varchar(1) default NULL COMMENT '来源地区（1.不限地区 2大中华地区 3.中国大陆 4.自定义地区）',
  `timeControl` varchar(100) default NULL COMMENT '流量时间控制',
  `land` varchar(1) default NULL COMMENT '多网址访问（1.关闭多网址着陆2\r\n2.自动多网址3.自定义4.批量多网址）',
  `note` varchar(5000) default NULL,
  `last` int(11) default NULL COMMENT '昨日流量',
  `now` int(11) default NULL COMMENT '今日流量',
  `times` varchar(50) default NULL COMMENT '有效期',
  `state` varchar(1) default NULL COMMENT '状态（1.优化中2停止中3暂停中4.定时中）',
  PRIMARY KEY  (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for forbids
-- ----------------------------
CREATE TABLE `forbids` (
  `b_id` int(11) NOT NULL COMMENT '序号',
  `taskid` int(11) default NULL COMMENT '任务号',
  `b_content` varchar(1000) default NULL COMMENT '白名单内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jc_acquisition
-- ----------------------------
CREATE TABLE `jc_acquisition` (
  `acquisition_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `acq_name` varchar(50) NOT NULL COMMENT '采集名称',
  `start_time` datetime default NULL COMMENT '开始时间',
  `end_time` datetime default NULL COMMENT '停止时间',
  `status` int(11) NOT NULL default '0' COMMENT '当前状态(0:静止;1:采集;2:暂停)',
  `curr_num` int(11) NOT NULL default '0' COMMENT '当前号码',
  `curr_item` int(11) NOT NULL default '0' COMMENT '当前条数',
  `total_item` int(11) NOT NULL default '0' COMMENT '每页总条数',
  `pause_time` int(11) NOT NULL default '0' COMMENT '暂停时间(毫秒)',
  `page_encoding` varchar(20) NOT NULL default 'GBK' COMMENT '页面编码',
  `plan_list` longtext COMMENT '采集列表',
  `dynamic_addr` varchar(255) default NULL COMMENT '动态地址',
  `dynamic_start` int(11) default NULL COMMENT '页码开始',
  `dynamic_end` int(11) default NULL COMMENT '页码结束',
  `linkset_start` varchar(255) default NULL COMMENT '内容链接区开始',
  `linkset_end` varchar(255) default NULL COMMENT '内容链接区结束',
  `link_start` varchar(255) default NULL COMMENT '内容链接开始',
  `link_end` varchar(255) default NULL COMMENT '内容链接结束',
  `title_start` varchar(255) default NULL COMMENT '标题开始',
  `title_end` varchar(255) default NULL COMMENT '标题结束',
  `keywords_start` varchar(255) default NULL COMMENT '关键字开始',
  `keywords_end` varchar(255) default NULL COMMENT '关键字结束',
  `description_start` varchar(255) default NULL COMMENT '描述开始',
  `description_end` varchar(255) default NULL COMMENT '描述结束',
  `content_start` varchar(255) default NULL COMMENT '内容开始',
  `content_end` varchar(255) default NULL COMMENT '内容结束',
  `pagination_start` varchar(255) default NULL COMMENT '内容分页开始',
  `pagination_end` varchar(255) default NULL COMMENT '内容分页结束',
  `queue` int(11) NOT NULL default '0' COMMENT '队列',
  `repeat_check_type` varchar(20) NOT NULL default 'NONE' COMMENT '重复类型',
  PRIMARY KEY  (`acquisition_id`),
  KEY `fk_jc_acquisition_channel` (`channel_id`),
  KEY `fk_jc_acquisition_contenttype` (`type_id`),
  KEY `fk_jc_acquisition_site` (`site_id`),
  KEY `fk_jc_acquisition_user` (`user_id`),
  CONSTRAINT `fk_jc_acquisition_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_acquisition_contenttype` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_acquisition_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_acquisition_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS采集表';

-- ----------------------------
-- Table structure for jc_acquisition_history
-- ----------------------------
CREATE TABLE `jc_acquisition_history` (
  `history_id` int(11) NOT NULL auto_increment,
  `channel_url` varchar(255) NOT NULL default '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL default '' COMMENT '内容地址',
  `title` varchar(255) default NULL COMMENT '标题',
  `description` varchar(20) NOT NULL default '' COMMENT '描述',
  `acquisition_id` int(11) default NULL COMMENT '采集源',
  `content_id` int(11) default NULL COMMENT '内容',
  PRIMARY KEY  (`history_id`),
  KEY `fk_acquisition_history_acquisition` (`acquisition_id`),
  CONSTRAINT `fk_jc_history_acquisition` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集历史记录表';

-- ----------------------------
-- Table structure for jc_acquisition_temp
-- ----------------------------
CREATE TABLE `jc_acquisition_temp` (
  `temp_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) default NULL,
  `channel_url` varchar(255) NOT NULL default '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL default '' COMMENT '内容地址',
  `title` varchar(255) default NULL COMMENT '标题',
  `percent` int(3) NOT NULL default '0' COMMENT '百分比',
  `description` varchar(20) NOT NULL default '' COMMENT '描述',
  `seq` int(3) NOT NULL default '0' COMMENT '顺序',
  PRIMARY KEY  (`temp_id`),
  KEY `fk_jc_temp_site` (`site_id`),
  CONSTRAINT `fk_jc_temp_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集进度临时表';

-- ----------------------------
-- Table structure for jc_advertising
-- ----------------------------
CREATE TABLE `jc_advertising` (
  `advertising_id` int(11) NOT NULL auto_increment,
  `adspace_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '广告名称',
  `category` varchar(50) NOT NULL COMMENT '广告类型',
  `ad_code` longtext COMMENT '广告代码',
  `ad_weight` int(11) NOT NULL default '1' COMMENT '广告权重',
  `display_count` bigint(20) NOT NULL default '0' COMMENT '展现次数',
  `click_count` bigint(20) NOT NULL default '0' COMMENT '点击次数',
  `start_time` date default NULL COMMENT '开始时间',
  `end_time` date default NULL COMMENT '结束时间',
  `is_enabled` char(1) NOT NULL default '1' COMMENT '是否启用',
  PRIMARY KEY  (`advertising_id`),
  KEY `fk_jc_advertising_site` (`site_id`),
  KEY `fk_jc_space_advertising` (`adspace_id`),
  CONSTRAINT `fk_jc_advertising_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_space_advertising` FOREIGN KEY (`adspace_id`) REFERENCES `jc_advertising_space` (`adspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS广告表';

-- ----------------------------
-- Table structure for jc_advertising_attr
-- ----------------------------
CREATE TABLE `jc_advertising_attr` (
  `advertising_id` int(11) NOT NULL,
  `attr_name` varchar(50) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) default NULL COMMENT '值',
  KEY `fk_jc_params_advertising` (`advertising_id`),
  CONSTRAINT `fk_jc_params_advertising` FOREIGN KEY (`advertising_id`) REFERENCES `jc_advertising` (`advertising_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS广告属性表';

-- ----------------------------
-- Table structure for jc_advertising_space
-- ----------------------------
CREATE TABLE `jc_advertising_space` (
  `adspace_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(255) default NULL COMMENT '描述',
  `is_enabled` char(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY  (`adspace_id`),
  KEY `fk_jc_adspace_site` (`site_id`),
  CONSTRAINT `fk_jc_adspace_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS广告版位表';

-- ----------------------------
-- Table structure for jc_channel
-- ----------------------------
CREATE TABLE `jc_channel` (
  `channel_id` int(11) NOT NULL auto_increment,
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `parent_id` int(11) default NULL COMMENT '父栏目ID',
  `channel_path` varchar(30) default NULL COMMENT '访问路径',
  `lft` int(11) NOT NULL default '1' COMMENT '树左边',
  `rgt` int(11) NOT NULL default '2' COMMENT '树右边',
  `priority` int(11) NOT NULL default '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL default '1' COMMENT '是否有内容',
  `is_display` tinyint(1) NOT NULL default '1' COMMENT '是否显示',
  PRIMARY KEY  (`channel_id`),
  KEY `fk_jc_channel_model` (`model_id`),
  KEY `fk_jc_channel_parent` (`parent_id`),
  KEY `fk_jc_channel_site` (`site_id`),
  CONSTRAINT `fk_jc_channel_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
  CONSTRAINT `fk_jc_channel_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_channel_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='CMS栏目表';

-- ----------------------------
-- Table structure for jc_channel_attr
-- ----------------------------
CREATE TABLE `jc_channel_attr` (
  `channel_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) default NULL COMMENT '值',
  KEY `fk_jc_attr_channel` (`channel_id`),
  CONSTRAINT `fk_jc_attr_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目扩展属性表';

-- ----------------------------
-- Table structure for jc_channel_department
-- ----------------------------
CREATE TABLE `jc_channel_department` (
  `channel_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY  (`channel_id`,`department_id`),
  KEY `fk_jc_channel_department` (`department_id`),
  CONSTRAINT `fk_jc_channel_department` FOREIGN KEY (`department_id`) REFERENCES `jc_department` (`depart_id`),
  CONSTRAINT `fk_jc_department_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目部门关联表';

-- ----------------------------
-- Table structure for jc_channel_ext
-- ----------------------------
CREATE TABLE `jc_channel_ext` (
  `channel_id` int(11) NOT NULL,
  `channel_name` varchar(100) NOT NULL COMMENT '名称',
  `final_step` tinyint(4) default '2' COMMENT '终审级别',
  `after_check` tinyint(4) default NULL COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_static_channel` char(1) NOT NULL default '0' COMMENT '是否栏目静态化',
  `is_static_content` char(1) NOT NULL default '0' COMMENT '是否内容静态化',
  `is_access_by_dir` char(1) NOT NULL default '1' COMMENT '是否使用目录访问',
  `is_list_child` char(1) NOT NULL default '0' COMMENT '是否使用子栏目列表',
  `page_size` int(11) NOT NULL default '20' COMMENT '每页多少条记录',
  `channel_rule` varchar(150) default NULL COMMENT '栏目页生成规则',
  `content_rule` varchar(150) default NULL COMMENT '内容页生成规则',
  `link` varchar(255) default NULL COMMENT '外部链接',
  `tpl_channel` varchar(100) default NULL COMMENT '栏目页模板',
  `tpl_content` varchar(100) default NULL COMMENT '内容页模板',
  `title_img` varchar(100) default NULL COMMENT '缩略图',
  `content_img` varchar(100) default NULL COMMENT '内容图',
  `has_title_img` tinyint(1) NOT NULL default '0' COMMENT '内容是否有缩略图',
  `has_content_img` tinyint(1) NOT NULL default '0' COMMENT '内容是否有内容图',
  `title_img_width` int(11) NOT NULL default '139' COMMENT '内容标题图宽度',
  `title_img_height` int(11) NOT NULL default '139' COMMENT '内容标题图高度',
  `content_img_width` int(11) NOT NULL default '310' COMMENT '内容内容图宽度',
  `content_img_height` int(11) NOT NULL default '310' COMMENT '内容内容图高度',
  `comment_control` int(11) NOT NULL default '0' COMMENT '评论(0:匿名;1:会员;2:关闭)',
  `allow_updown` tinyint(1) NOT NULL default '1' COMMENT '顶踩(true:开放;false:关闭)',
  `is_blank` tinyint(1) NOT NULL default '1' COMMENT '是否新窗口打开',
  `title` varchar(255) default NULL COMMENT 'TITLE',
  `keywords` varchar(255) default NULL COMMENT 'KEYWORDS',
  `description` varchar(255) default NULL COMMENT 'DESCRIPTION',
  PRIMARY KEY  (`channel_id`),
  CONSTRAINT `fk_jc_ext_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目内容表';

-- ----------------------------
-- Table structure for jc_channel_txt
-- ----------------------------
CREATE TABLE `jc_channel_txt` (
  `channel_id` int(11) NOT NULL,
  `txt` longtext COMMENT '栏目内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY  (`channel_id`),
  CONSTRAINT `fk_jc_txt_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目文本表';

-- ----------------------------
-- Table structure for jc_channel_user
-- ----------------------------
CREATE TABLE `jc_channel_user` (
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`channel_id`,`user_id`),
  KEY `fk_jc_channel_user` (`user_id`),
  CONSTRAINT `fk_jc_channel_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目用户关联表';

-- ----------------------------
-- Table structure for jc_chnl_group_contri
-- ----------------------------
CREATE TABLE `jc_chnl_group_contri` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_c` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_c` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目投稿会员组关联表';

-- ----------------------------
-- Table structure for jc_chnl_group_view
-- ----------------------------
CREATE TABLE `jc_chnl_group_view` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_v` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_v` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目浏览会员组关联表';

-- ----------------------------
-- Table structure for jc_comment
-- ----------------------------
CREATE TABLE `jc_comment` (
  `comment_id` int(11) NOT NULL auto_increment,
  `comment_user_id` int(11) default NULL COMMENT '评论用户ID',
  `reply_user_id` int(11) default NULL COMMENT '回复用户ID',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `reply_time` datetime default NULL COMMENT '回复时间',
  `ups` smallint(6) NOT NULL default '0' COMMENT '支持数',
  `downs` smallint(6) NOT NULL default '0' COMMENT '反对数',
  `is_recommend` tinyint(1) NOT NULL default '0' COMMENT '是否推荐',
  `is_checked` tinyint(1) NOT NULL default '0' COMMENT '是否审核',
  PRIMARY KEY  (`comment_id`),
  KEY `fk_jc_comment_content` (`content_id`),
  KEY `fk_jc_comment_reply` (`reply_user_id`),
  KEY `fk_jc_comment_site` (`site_id`),
  KEY `fk_jc_comment_user` (`comment_user_id`),
  CONSTRAINT `fk_jc_comment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_comment_reply` FOREIGN KEY (`reply_user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_comment_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_comment_user` FOREIGN KEY (`comment_user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论表';

-- ----------------------------
-- Table structure for jc_comment_ext
-- ----------------------------
CREATE TABLE `jc_comment_ext` (
  `comment_id` int(11) NOT NULL,
  `ip` varchar(50) default NULL COMMENT 'IP地址',
  `text` longtext COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  KEY `fk_jc_ext_comment` (`comment_id`),
  CONSTRAINT `fk_jc_ext_comment` FOREIGN KEY (`comment_id`) REFERENCES `jc_comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论扩展表';

-- ----------------------------
-- Table structure for jc_config
-- ----------------------------
CREATE TABLE `jc_config` (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) default '/JeeCms' COMMENT '部署路径',
  `servlet_point` varchar(20) default NULL COMMENT 'Servlet挂载点',
  `port` int(11) default NULL COMMENT '端口',
  `db_file_uri` varchar(50) NOT NULL default '/dbfile.svl?n=' COMMENT '数据库附件访问地址',
  `is_upload_to_db` tinyint(1) NOT NULL default '0' COMMENT '上传附件至数据库',
  `def_img` varchar(255) NOT NULL default '/JeeCms/r/cms/www/default/no_picture.gif' COMMENT '图片不存在时默认图片',
  `login_url` varchar(255) NOT NULL default '/login.jspx' COMMENT '登录地址',
  `process_url` varchar(255) default NULL COMMENT '登录后处理地址',
  `mark_on` tinyint(1) NOT NULL default '1' COMMENT '开启图片水印',
  `mark_width` int(11) NOT NULL default '120' COMMENT '图片最小宽度',
  `mark_height` int(11) NOT NULL default '120' COMMENT '图片最小高度',
  `mark_image` varchar(100) default '/r/cms/www/watermark.png' COMMENT '图片水印',
  `mark_content` varchar(100) NOT NULL default 'www.jeecms.com' COMMENT '文字水印内容',
  `mark_size` int(11) NOT NULL default '20' COMMENT '文字水印大小',
  `mark_color` varchar(10) NOT NULL default '#FF0000' COMMENT '文字水印颜色',
  `mark_alpha` int(11) NOT NULL default '50' COMMENT '水印透明度（0-100）',
  `mark_position` int(11) NOT NULL default '1' COMMENT '水印位置(0-5)',
  `mark_offset_x` int(11) NOT NULL default '0' COMMENT 'x坐标偏移量',
  `mark_offset_y` int(11) NOT NULL default '0' COMMENT 'y坐标偏移量',
  `count_clear_time` date NOT NULL COMMENT '计数器清除时间',
  `count_copy_time` datetime NOT NULL COMMENT '计数器拷贝时间',
  `download_code` varchar(32) NOT NULL default 'jeecms' COMMENT '下载防盗链md5混淆码',
  `download_time` int(11) NOT NULL default '12' COMMENT '下载有效时间（小时）',
  `email_host` varchar(50) default NULL COMMENT '邮件发送服务器',
  `email_encoding` varchar(20) default NULL COMMENT '邮件发送编码',
  `email_username` varchar(100) default NULL COMMENT '邮箱用户名',
  `email_password` varchar(100) default NULL COMMENT '邮箱密码',
  `email_personal` varchar(100) default NULL COMMENT '邮箱发件人',
  `email_validate` tinyint(1) default '0' COMMENT '开启邮箱验证',
  PRIMARY KEY  (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置表';

-- ----------------------------
-- Table structure for jc_config_attr
-- ----------------------------
CREATE TABLE `jc_config_attr` (
  `config_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) default NULL COMMENT '值',
  KEY `fk_jc_attr_config` (`config_id`),
  CONSTRAINT `fk_jc_attr_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置属性表';

-- ----------------------------
-- Table structure for jc_content
-- ----------------------------
CREATE TABLE `jc_content` (
  `content_id` int(11) NOT NULL auto_increment,
  `channel_id` int(11) NOT NULL COMMENT '栏目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type_id` int(11) NOT NULL COMMENT '属性ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `sort_date` datetime NOT NULL COMMENT '排序日期',
  `top_level` tinyint(4) NOT NULL default '0' COMMENT '固顶级别',
  `has_title_img` tinyint(1) NOT NULL default '0' COMMENT '是否有标题图',
  `is_recommend` tinyint(1) NOT NULL default '0' COMMENT '是否推荐',
  `status` tinyint(4) NOT NULL default '2' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站)',
  `views_day` int(11) NOT NULL default '0' COMMENT '日访问数',
  `comments_day` smallint(6) NOT NULL default '0' COMMENT '日评论数',
  `downloads_day` smallint(6) NOT NULL default '0' COMMENT '日下载数',
  `ups_day` smallint(6) NOT NULL default '0' COMMENT '日顶数',
  PRIMARY KEY  (`content_id`),
  KEY `fk_jc_content_site` (`site_id`),
  KEY `fk_jc_content_type` (`type_id`),
  KEY `fk_jc_content_user` (`user_id`),
  KEY `fk_jc_contentchannel` (`channel_id`),
  CONSTRAINT `fk_jc_contentchannel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_content_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_content_type` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_content_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=487 DEFAULT CHARSET=utf8 COMMENT='CMS内容表';

-- ----------------------------
-- Table structure for jc_content_attachment
-- ----------------------------
CREATE TABLE `jc_content_attachment` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `attachment_path` varchar(255) NOT NULL COMMENT '附件路径',
  `attachment_name` varchar(100) NOT NULL COMMENT '附件名称',
  `filename` varchar(100) default NULL COMMENT '文件名',
  `download_count` int(11) NOT NULL default '0' COMMENT '下载次数',
  KEY `fk_jc_attachment_content` (`content_id`),
  CONSTRAINT `fk_jc_attachment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容附件表';

-- ----------------------------
-- Table structure for jc_content_attr
-- ----------------------------
CREATE TABLE `jc_content_attr` (
  `content_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) default NULL COMMENT '值',
  KEY `fk_jc_attr_content` (`content_id`),
  CONSTRAINT `fk_jc_attr_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展属性表';

-- ----------------------------
-- Table structure for jc_content_channel
-- ----------------------------
CREATE TABLE `jc_content_channel` (
  `channel_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY  (`channel_id`,`content_id`),
  KEY `fk_jc_channel_content` (`content_id`),
  CONSTRAINT `fk_jc_channel_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容栏目关联表';

-- ----------------------------
-- Table structure for jc_content_check
-- ----------------------------
CREATE TABLE `jc_content_check` (
  `content_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL default '0' COMMENT '审核步数',
  `check_opinion` varchar(255) default NULL COMMENT '审核意见',
  `is_rejected` tinyint(1) NOT NULL default '0' COMMENT '是否退回',
  `reviewer` int(11) default NULL COMMENT '终审者',
  `check_date` datetime default NULL COMMENT '终审时间',
  PRIMARY KEY  (`content_id`),
  KEY `fk_jc_content_check_user` (`reviewer`),
  CONSTRAINT `fk_jc_check_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_check_user` FOREIGN KEY (`reviewer`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容审核信息表';

-- ----------------------------
-- Table structure for jc_content_count
-- ----------------------------
CREATE TABLE `jc_content_count` (
  `content_id` int(11) NOT NULL,
  `views` int(11) NOT NULL default '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL default '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL default '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL default '0' COMMENT '日访问数',
  `comments` int(11) NOT NULL default '0' COMMENT '总评论数',
  `comments_month` int(11) NOT NULL default '0' COMMENT '月评论数',
  `comments_week` smallint(6) NOT NULL default '0' COMMENT '周评论数',
  `comments_day` smallint(6) NOT NULL default '0' COMMENT '日评论数',
  `downloads` int(11) NOT NULL default '0' COMMENT '总下载数',
  `downloads_month` int(11) NOT NULL default '0' COMMENT '月下载数',
  `downloads_week` smallint(6) NOT NULL default '0' COMMENT '周下载数',
  `downloads_day` smallint(6) NOT NULL default '0' COMMENT '日下载数',
  `ups` int(11) NOT NULL default '0' COMMENT '总顶数',
  `ups_month` int(11) NOT NULL default '0' COMMENT '月顶数',
  `ups_week` smallint(6) NOT NULL default '0' COMMENT '周顶数',
  `ups_day` smallint(6) NOT NULL default '0' COMMENT '日顶数',
  `downs` int(11) NOT NULL default '0' COMMENT '总踩数',
  PRIMARY KEY  (`content_id`),
  CONSTRAINT `fk_jc_count_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容计数表';

-- ----------------------------
-- Table structure for jc_content_ext
-- ----------------------------
CREATE TABLE `jc_content_ext` (
  `content_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL COMMENT '标题',
  `short_title` varchar(150) default NULL COMMENT '简短标题',
  `author` varchar(100) default NULL COMMENT '作者',
  `origin` varchar(100) default NULL COMMENT '来源',
  `origin_url` varchar(255) default NULL COMMENT '来源链接',
  `description` varchar(255) default NULL COMMENT '描述',
  `release_date` datetime NOT NULL COMMENT '发布日期',
  `media_path` varchar(255) default NULL COMMENT '媒体路径',
  `media_type` varchar(20) default NULL COMMENT '媒体类型',
  `title_color` varchar(10) default NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) NOT NULL default '0' COMMENT '是否加粗',
  `title_img` varchar(100) default NULL COMMENT '标题图片',
  `content_img` varchar(100) default NULL COMMENT '内容图片',
  `type_img` varchar(100) default NULL COMMENT '类型图片',
  `link` varchar(255) default NULL COMMENT '外部链接',
  `tpl_content` varchar(100) default NULL COMMENT '指定模板',
  `need_regenerate` tinyint(1) NOT NULL default '1' COMMENT '需要重新生成静态页',
  PRIMARY KEY  (`content_id`),
  CONSTRAINT `fk_jc_ext_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展表';

-- ----------------------------
-- Table structure for jc_content_group_view
-- ----------------------------
CREATE TABLE `jc_content_group_view` (
  `content_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`content_id`,`group_id`),
  KEY `fk_jc_content_group_v` (`group_id`),
  CONSTRAINT `fk_jc_content_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_content_v` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容浏览会员组关联表';

-- ----------------------------
-- Table structure for jc_content_picture
-- ----------------------------
CREATE TABLE `jc_content_picture` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `img_path` varchar(100) NOT NULL COMMENT '图片地址',
  `description` varchar(255) default NULL COMMENT '描述',
  PRIMARY KEY  (`content_id`,`priority`),
  CONSTRAINT `fk_jc_picture_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容图片表';

-- ----------------------------
-- Table structure for jc_content_share_check
-- ----------------------------
CREATE TABLE `jc_content_share_check` (
  `share_check_id` int(11) NOT NULL auto_increment,
  `content_id` int(11) NOT NULL COMMENT '共享内容',
  `channel_id` int(11) NOT NULL COMMENT '共享栏目',
  `check_status` tinyint(4) NOT NULL default '0' COMMENT '审核状态 0待审核 1审核通过 2推送',
  `check_opinion` varchar(255) default NULL COMMENT '审核意见',
  `share_valid` tinyint(1) NOT NULL default '0' COMMENT '共享有效性',
  PRIMARY KEY  (`share_check_id`),
  KEY `fk_channel_jc_content_share` (`channel_id`),
  KEY `fk_check_jc_content_share` (`content_id`),
  CONSTRAINT `fk_channel_jc_content_share` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_check_jc_content_share` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS共享内容审核信息表';

-- ----------------------------
-- Table structure for jc_content_tag
-- ----------------------------
CREATE TABLE `jc_content_tag` (
  `tag_id` int(11) NOT NULL auto_increment,
  `tag_name` varchar(50) NOT NULL COMMENT 'tag名称',
  `ref_counter` int(11) NOT NULL default '1' COMMENT '被引用的次数',
  PRIMARY KEY  (`tag_id`),
  UNIQUE KEY `ak_tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='CMS内容TAG表';

-- ----------------------------
-- Table structure for jc_content_topic
-- ----------------------------
CREATE TABLE `jc_content_topic` (
  `content_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY  (`content_id`,`topic_id`),
  KEY `fk_jc_content_topic` (`topic_id`),
  CONSTRAINT `fk_jc_content_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`),
  CONSTRAINT `fk_jc_topic_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS专题内容关联表';

-- ----------------------------
-- Table structure for jc_content_txt
-- ----------------------------
CREATE TABLE `jc_content_txt` (
  `content_id` int(11) NOT NULL,
  `txt` longtext COMMENT '文章内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY  (`content_id`),
  CONSTRAINT `fk_jc_txt_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容文本表';

-- ----------------------------
-- Table structure for jc_content_type
-- ----------------------------
CREATE TABLE `jc_content_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL COMMENT '名称',
  `img_width` int(11) default NULL COMMENT '图片宽',
  `img_height` int(11) default NULL COMMENT '图片高',
  `has_image` tinyint(1) NOT NULL default '0' COMMENT '是否有图片',
  `is_disabled` tinyint(1) NOT NULL default '0' COMMENT '是否禁用',
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容类型表';

-- ----------------------------
-- Table structure for jc_contenttag
-- ----------------------------
CREATE TABLE `jc_contenttag` (
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  KEY `fk_jc_content_tag` (`tag_id`),
  KEY `fk_jc_tag_content` (`content_id`),
  CONSTRAINT `fk_jc_content_tag` FOREIGN KEY (`tag_id`) REFERENCES `jc_content_tag` (`tag_id`),
  CONSTRAINT `fk_jc_tag_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容标签关联表';

-- ----------------------------
-- Table structure for jc_department
-- ----------------------------
CREATE TABLE `jc_department` (
  `depart_id` int(11) NOT NULL auto_increment,
  `depart_name` varchar(255) NOT NULL default '' COMMENT '部门名称',
  `site_id` int(11) NOT NULL COMMENT '站点',
  `priority` int(11) NOT NULL default '1' COMMENT '排序',
  `weights` int(11) NOT NULL default '1' COMMENT '权重(值越大，级别越高)',
  PRIMARY KEY  (`depart_id`),
  KEY `fk_jc_department_site` (`site_id`),
  CONSTRAINT `fk_jc_department_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门';

-- ----------------------------
-- Table structure for jc_file
-- ----------------------------
CREATE TABLE `jc_file` (
  `file_path` varchar(255) NOT NULL default '' COMMENT '文件路径',
  `file_name` varchar(255) default '' COMMENT '文件名字',
  `file_isvalid` tinyint(1) NOT NULL default '0' COMMENT '是否有效',
  `content_id` int(11) default NULL COMMENT '内容id',
  PRIMARY KEY  (`file_path`),
  KEY `fk_jc_file_content` (`content_id`),
  CONSTRAINT `fk_jc_file_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jc_friendlink
-- ----------------------------
CREATE TABLE `jc_friendlink` (
  `friendlink_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_id` int(11) NOT NULL,
  `site_name` varchar(150) NOT NULL COMMENT '网站名称',
  `domain` varchar(255) NOT NULL COMMENT '网站地址',
  `logo` varchar(150) default NULL COMMENT '图标',
  `email` varchar(100) default NULL COMMENT '站长邮箱',
  `description` varchar(255) default NULL COMMENT '描述',
  `views` int(11) NOT NULL default '0' COMMENT '点击次数',
  `is_enabled` char(1) NOT NULL default '1' COMMENT '是否显示',
  `priority` int(11) NOT NULL default '10' COMMENT '排列顺序',
  PRIMARY KEY  (`friendlink_id`),
  KEY `fk_jc_ctg_friendlink` (`friendlinkctg_id`),
  KEY `fk_jc_friendlink_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_friendlink` FOREIGN KEY (`friendlinkctg_id`) REFERENCES `jc_friendlink_ctg` (`friendlinkctg_id`),
  CONSTRAINT `fk_jc_friendlink_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接';

-- ----------------------------
-- Table structure for jc_friendlink_ctg
-- ----------------------------
CREATE TABLE `jc_friendlink_ctg` (
  `friendlinkctg_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_name` varchar(50) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL default '10' COMMENT '排列顺序',
  PRIMARY KEY  (`friendlinkctg_id`),
  KEY `fk_jc_friendlinkctg_site` (`site_id`),
  CONSTRAINT `fk_jc_friendlinkctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接类别';

-- ----------------------------
-- Table structure for jc_group
-- ----------------------------
CREATE TABLE `jc_group` (
  `group_id` int(11) NOT NULL auto_increment,
  `group_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL default '10' COMMENT '排列顺序',
  `need_captcha` tinyint(1) NOT NULL default '1' COMMENT '是否需要验证码',
  `need_check` tinyint(1) NOT NULL default '1' COMMENT '是否需要审核',
  `allow_per_day` int(11) NOT NULL default '4096' COMMENT '每日允许上传KB',
  `allow_max_file` int(11) NOT NULL default '1024' COMMENT '每个文件最大KB',
  `allow_suffix` varchar(255) default 'jpg,jpeg,gif,png,bmp' COMMENT '允许上传的后缀',
  `is_reg_def` tinyint(1) NOT NULL default '0' COMMENT '是否默认会员组',
  PRIMARY KEY  (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS会员组表';

-- ----------------------------
-- Table structure for jc_guestbook
-- ----------------------------
CREATE TABLE `jc_guestbook` (
  `guestbook_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `guestbookctg_id` int(11) NOT NULL,
  `member_id` int(11) default NULL COMMENT '留言会员',
  `admin_id` int(11) default NULL COMMENT '回复管理员',
  `ip` varchar(50) NOT NULL COMMENT '留言IP',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `replay_time` datetime default NULL COMMENT '回复时间',
  `is_checked` tinyint(1) NOT NULL default '0' COMMENT '是否审核',
  `is_recommend` tinyint(1) NOT NULL default '0' COMMENT '是否推荐',
  PRIMARY KEY  (`guestbook_id`),
  KEY `fk_jc_ctg_guestbook` (`guestbookctg_id`),
  KEY `fk_jc_guestbook_admin` (`admin_id`),
  KEY `fk_jc_guestbook_member` (`member_id`),
  KEY `fk_jc_guestbook_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_guestbook` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`),
  CONSTRAINT `fk_jc_guestbook_admin` FOREIGN KEY (`admin_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_member` FOREIGN KEY (`member_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='CMS留言';

-- ----------------------------
-- Table structure for jc_guestbook_ctg
-- ----------------------------
CREATE TABLE `jc_guestbook_ctg` (
  `guestbookctg_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `ctg_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL default '10' COMMENT '排列顺序',
  `description` varchar(255) default NULL COMMENT '描述',
  PRIMARY KEY  (`guestbookctg_id`),
  KEY `fk_jc_guestbookctg_site` (`site_id`),
  CONSTRAINT `fk_jc_guestbookctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS留言类别';

-- ----------------------------
-- Table structure for jc_guestbook_ctg_department
-- ----------------------------
CREATE TABLE `jc_guestbook_ctg_department` (
  `guestbookctg_id` int(11) NOT NULL,
  `depart_id` int(11) NOT NULL,
  PRIMARY KEY  (`guestbookctg_id`,`depart_id`),
  KEY `fk_jc_channel_department` (`depart_id`),
  CONSTRAINT `fk_jc_department_guestbook_ctg` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`),
  CONSTRAINT `fk_jc_guestbook_ctg_department` FOREIGN KEY (`depart_id`) REFERENCES `jc_department` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS留言类别部门关联表';

-- ----------------------------
-- Table structure for jc_guestbook_ext
-- ----------------------------
CREATE TABLE `jc_guestbook_ext` (
  `guestbook_id` int(11) NOT NULL,
  `title` varchar(255) default NULL COMMENT '留言标题',
  `content` longtext COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  `email` varchar(100) default NULL COMMENT '电子邮件',
  `phone` varchar(100) default NULL COMMENT '电话',
  `qq` varchar(50) default NULL COMMENT 'QQ',
  KEY `fk_jc_ext_guestbook` (`guestbook_id`),
  CONSTRAINT `fk_jc_ext_guestbook` FOREIGN KEY (`guestbook_id`) REFERENCES `jc_guestbook` (`guestbook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS留言内容';

-- ----------------------------
-- Table structure for jc_keyword
-- ----------------------------
CREATE TABLE `jc_keyword` (
  `keyword_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) default NULL COMMENT '站点ID',
  `keyword_name` varchar(100) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `is_disabled` tinyint(1) NOT NULL default '0' COMMENT '是否禁用',
  PRIMARY KEY  (`keyword_id`),
  KEY `fk_jc_keyword_site` (`site_id`),
  CONSTRAINT `fk_jc_keyword_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS内容关键词表';

-- ----------------------------
-- Table structure for jc_log
-- ----------------------------
CREATE TABLE `jc_log` (
  `log_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `site_id` int(11) default NULL,
  `category` int(11) NOT NULL COMMENT '日志类型',
  `log_time` datetime NOT NULL COMMENT '日志时间',
  `ip` varchar(50) default NULL COMMENT 'IP地址',
  `url` varchar(255) default NULL COMMENT 'URL地址',
  `title` varchar(255) default NULL COMMENT '日志标题',
  `content` varchar(255) default NULL COMMENT '日志内容',
  PRIMARY KEY  (`log_id`),
  KEY `fk_jc_log_site` (`site_id`),
  KEY `fk_jc_log_user` (`user_id`),
  CONSTRAINT `fk_jc_log_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_log_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2003 DEFAULT CHARSET=utf8 COMMENT='CMS日志表';

-- ----------------------------
-- Table structure for jc_message
-- ----------------------------
CREATE TABLE `jc_message` (
  `msg_id` int(11) NOT NULL auto_increment COMMENT '消息id',
  `msg_title` varchar(255) NOT NULL default '' COMMENT '标题',
  `msg_content` longtext COMMENT '站内信息内容',
  `send_time` timestamp NULL default NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL default '1' COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL default '0' COMMENT '接收人',
  `site_id` int(11) NOT NULL default '1' COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL default '0' COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL default '1' COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  PRIMARY KEY  (`msg_id`),
  KEY `fk_jc_message_user_send` (`msg_send_user`),
  KEY `fk_jc_message_user_receiver` (`msg_receiver_user`),
  KEY `fk_jc_message_site` (`site_id`),
  CONSTRAINT `fk_jc_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='站内信';

-- ----------------------------
-- Table structure for jc_model
-- ----------------------------
CREATE TABLE `jc_model` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL COMMENT '名称',
  `model_path` varchar(100) NOT NULL COMMENT '路径',
  `tpl_channel_prefix` varchar(20) default NULL COMMENT '栏目模板前缀',
  `tpl_content_prefix` varchar(20) default NULL COMMENT '内容模板前缀',
  `title_img_width` int(11) NOT NULL default '139' COMMENT '栏目标题图宽度',
  `title_img_height` int(11) NOT NULL default '139' COMMENT '栏目标题图高度',
  `content_img_width` int(11) NOT NULL default '310' COMMENT '栏目内容图宽度',
  `content_img_height` int(11) NOT NULL default '310' COMMENT '栏目内容图高度',
  `priority` int(11) NOT NULL default '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL default '1' COMMENT '是否有内容',
  `is_disabled` tinyint(1) NOT NULL default '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL default '0' COMMENT '是否默认模型',
  PRIMARY KEY  (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS模型表';

-- ----------------------------
-- Table structure for jc_model_item
-- ----------------------------
CREATE TABLE `jc_model_item` (
  `modelitem_id` int(11) NOT NULL auto_increment,
  `model_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `item_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL default '70' COMMENT '排列顺序',
  `def_value` varchar(255) default NULL COMMENT '默认值',
  `opt_value` varchar(255) default NULL COMMENT '可选项',
  `text_size` varchar(20) default NULL COMMENT '长度',
  `area_rows` varchar(3) default NULL COMMENT '文本行数',
  `area_cols` varchar(3) default NULL COMMENT '文本列数',
  `help` varchar(255) default NULL COMMENT '帮助信息',
  `help_position` varchar(1) default NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL default '1' COMMENT '数据类型',
  `is_single` tinyint(1) NOT NULL default '1' COMMENT '是否独占一行',
  `is_channel` tinyint(1) NOT NULL default '1' COMMENT '是否栏目模型项',
  `is_custom` tinyint(1) NOT NULL default '1' COMMENT '是否自定义',
  `is_display` tinyint(1) NOT NULL default '1' COMMENT '是否显示',
  PRIMARY KEY  (`modelitem_id`),
  KEY `fk_jc_item_model` (`model_id`),
  CONSTRAINT `fk_jc_item_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 COMMENT='CMS模型项表';

-- ----------------------------
-- Table structure for jc_receiver_message
-- ----------------------------
CREATE TABLE `jc_receiver_message` (
  `msg_re_id` int(11) NOT NULL auto_increment COMMENT '消息id',
  `msg_title` varchar(255) NOT NULL default '' COMMENT '标题',
  `msg_content` longtext COMMENT '站内信息内容',
  `send_time` timestamp NULL default NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL default '1' COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL default '0' COMMENT '接收人',
  `site_id` int(11) NOT NULL default '1' COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL default '0' COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL default '1' COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  `msg_id` int(11) default NULL COMMENT '发信的信件id',
  PRIMARY KEY  (`msg_re_id`),
  KEY `jc_receiver_message_user_send` (`msg_send_user`),
  KEY `jc_receiver_message_user_receiver` (`msg_receiver_user`),
  KEY `jc_receiver_message_site` (`site_id`),
  KEY `jc_receiver_message_message` (`msg_re_id`),
  KEY `fk_jc_receiver_message_message` (`msg_id`),
  CONSTRAINT `fk_jc_receiver_message_message` FOREIGN KEY (`msg_id`) REFERENCES `jc_message` (`msg_id`),
  CONSTRAINT `fk_jc_receiver_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_receiver_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_receiver_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='站内信收信表';

-- ----------------------------
-- Table structure for jc_role
-- ----------------------------
CREATE TABLE `jc_role` (
  `role_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) default NULL,
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `priority` int(11) NOT NULL default '10' COMMENT '排列顺序',
  `is_super` char(1) NOT NULL default '0' COMMENT '拥有所有权限',
  PRIMARY KEY  (`role_id`),
  KEY `fk_jc_role_site` (`site_id`),
  CONSTRAINT `fk_jc_role_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS角色表';

-- ----------------------------
-- Table structure for jc_role_permission
-- ----------------------------
CREATE TABLE `jc_role_permission` (
  `role_id` int(11) NOT NULL,
  `uri` varchar(100) NOT NULL,
  KEY `fk_jc_permission_role` (`role_id`),
  CONSTRAINT `fk_jc_permission_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS角色授权表';

-- ----------------------------
-- Table structure for jc_sensitivity
-- ----------------------------
CREATE TABLE `jc_sensitivity` (
  `sensitivity_id` int(11) NOT NULL auto_increment,
  `search` varchar(255) NOT NULL COMMENT '敏感词',
  `replacement` varchar(255) NOT NULL COMMENT '替换词',
  PRIMARY KEY  (`sensitivity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS敏感词表';

-- ----------------------------
-- Table structure for jc_site
-- ----------------------------
CREATE TABLE `jc_site` (
  `site_id` int(11) NOT NULL auto_increment,
  `config_id` int(11) NOT NULL COMMENT '配置ID',
  `ftp_upload_id` int(11) default NULL COMMENT '上传ftp',
  `domain` varchar(50) NOT NULL COMMENT '域名',
  `site_path` varchar(20) NOT NULL COMMENT '路径',
  `site_name` varchar(100) NOT NULL COMMENT '网站名称',
  `short_name` varchar(100) NOT NULL COMMENT '简短名称',
  `protocol` varchar(20) NOT NULL default 'http://' COMMENT '协议',
  `dynamic_suffix` varchar(10) NOT NULL default '.jhtml' COMMENT '动态页后缀',
  `static_suffix` varchar(10) NOT NULL default '.html' COMMENT '静态页后缀',
  `static_dir` varchar(50) default NULL COMMENT '静态页存放目录',
  `is_index_to_root` char(1) NOT NULL default '0' COMMENT '是否使用将首页放在根目录下',
  `is_static_index` char(1) NOT NULL default '0' COMMENT '是否静态化首页',
  `locale_admin` varchar(10) NOT NULL default 'zh_CN' COMMENT '后台本地化',
  `locale_front` varchar(10) NOT NULL default 'zh_CN' COMMENT '前台本地化',
  `tpl_solution` varchar(50) NOT NULL default 'default' COMMENT '模板方案',
  `final_step` tinyint(4) NOT NULL default '2' COMMENT '终审级别',
  `after_check` tinyint(4) NOT NULL default '2' COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_relative_path` char(1) NOT NULL default '1' COMMENT '是否使用相对路径',
  `is_recycle_on` char(1) NOT NULL default '1' COMMENT '是否开启回收站',
  `domain_alias` varchar(255) default NULL COMMENT '域名别名',
  `domain_redirect` varchar(255) default NULL COMMENT '域名重定向',
  `is_master` tinyint(1) default '0' COMMENT '是否主站',
  PRIMARY KEY  (`site_id`),
  UNIQUE KEY `ak_domain` (`domain`),
  KEY `fk_jc_site_config` (`config_id`),
  KEY `fk_jc_site_upload_ftp` (`ftp_upload_id`),
  CONSTRAINT `fk_jc_site_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`),
  CONSTRAINT `fk_jc_site_upload_ftp` FOREIGN KEY (`ftp_upload_id`) REFERENCES `jo_ftp` (`ftp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS站点表';

-- ----------------------------
-- Table structure for jc_site_attr
-- ----------------------------
CREATE TABLE `jc_site_attr` (
  `site_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) default NULL COMMENT '值',
  KEY `fk_jc_attr_site` (`site_id`),
  CONSTRAINT `fk_jc_attr_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点属性表';

-- ----------------------------
-- Table structure for jc_site_cfg
-- ----------------------------
CREATE TABLE `jc_site_cfg` (
  `site_id` int(11) NOT NULL,
  `cfg_name` varchar(30) NOT NULL COMMENT '名称',
  `cfg_value` varchar(255) default NULL COMMENT '值',
  KEY `fk_jc_cfg_site` (`site_id`),
  CONSTRAINT `fk_jc_cfg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点配置表';

-- ----------------------------
-- Table structure for jc_site_flow
-- ----------------------------
CREATE TABLE `jc_site_flow` (
  `flow_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) default NULL,
  `access_ip` varchar(50) NOT NULL default '127.0.0.1' COMMENT '访问者ip',
  `access_date` varchar(50) default NULL COMMENT '访问日期',
  `access_time` datetime default NULL COMMENT '访问时间',
  `access_page` varchar(255) NOT NULL default '' COMMENT '访问页面',
  `referer_website` varchar(255) default NULL COMMENT '来访网站',
  `referer_page` varchar(255) default NULL COMMENT '来访页面',
  `referer_keyword` varchar(255) default NULL COMMENT '来访关键字',
  `area` varchar(50) default NULL COMMENT '地区',
  `session_id` varchar(50) NOT NULL default '' COMMENT 'cookie信息',
  PRIMARY KEY  (`flow_id`),
  KEY `fk_jc_flow_site` (`site_id`),
  CONSTRAINT `fk_jc_flow_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='站点流量统计表';

-- ----------------------------
-- Table structure for jc_site_model
-- ----------------------------
CREATE TABLE `jc_site_model` (
  `model_id` int(11) NOT NULL auto_increment,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `model_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL default '10' COMMENT '排列顺序',
  `upload_path` varchar(100) default NULL COMMENT '上传路径',
  `text_size` varchar(20) default NULL COMMENT '长度',
  `area_rows` varchar(3) default NULL COMMENT '文本行数',
  `area_cols` varchar(3) default NULL COMMENT '文本列数',
  `help` varchar(255) default NULL COMMENT '帮助信息',
  `help_position` varchar(1) default NULL COMMENT '帮助位置',
  `data_type` int(11) default '1' COMMENT '0:编辑器;1:文本框;2:文本区;3:图片;4:附件',
  `is_single` tinyint(1) default '1' COMMENT '是否独占一行',
  PRIMARY KEY  (`model_id`),
  UNIQUE KEY `ak_field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点信息模型表';

-- ----------------------------
-- Table structure for jc_site_txt
-- ----------------------------
CREATE TABLE `jc_site_txt` (
  `site_id` int(11) NOT NULL,
  `txt_name` varchar(30) NOT NULL COMMENT '名称',
  `txt_value` longtext COMMENT '值',
  KEY `fk_jc_txt_site` (`site_id`),
  CONSTRAINT `fk_jc_txt_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点文本表';

-- ----------------------------
-- Table structure for jc_topic
-- ----------------------------
CREATE TABLE `jc_topic` (
  `topic_id` int(11) NOT NULL auto_increment,
  `channel_id` int(11) default NULL,
  `topic_name` varchar(150) NOT NULL COMMENT '名称',
  `short_name` varchar(150) default NULL COMMENT '简称',
  `keywords` varchar(255) default NULL COMMENT '关键字',
  `description` varchar(255) default NULL COMMENT '描述',
  `title_img` varchar(100) default NULL COMMENT '标题图',
  `content_img` varchar(100) default NULL COMMENT '内容图',
  `tpl_content` varchar(100) default NULL COMMENT '专题模板',
  `priority` int(11) NOT NULL default '10' COMMENT '排列顺序',
  `is_recommend` tinyint(1) NOT NULL default '0' COMMENT '是否推??',
  PRIMARY KEY  (`topic_id`),
  KEY `fk_jc_topic_channel` (`channel_id`),
  CONSTRAINT `fk_jc_topic_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS专题表';

-- ----------------------------
-- Table structure for jc_user
-- ----------------------------
CREATE TABLE `jc_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) default NULL COMMENT '邮箱',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL default '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL default '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL default '0' COMMENT '登录次数',
  `rank` int(11) NOT NULL default '0' COMMENT '管理员级别',
  `upload_total` bigint(20) NOT NULL default '0' COMMENT '上传总大小',
  `upload_size` int(11) NOT NULL default '0' COMMENT '上传大小',
  `upload_date` date default NULL COMMENT '上传日期',
  `is_admin` tinyint(1) NOT NULL default '0' COMMENT '是否管理员',
  `is_viewonly_admin` tinyint(1) NOT NULL default '0' COMMENT '是否只读管理员',
  `is_self_admin` tinyint(1) NOT NULL default '0' COMMENT '是否只管理自己的数据',
  `is_disabled` tinyint(1) NOT NULL default '0' COMMENT '是否禁用',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `ak_username` (`username`),
  KEY `fk_jc_user_group` (`group_id`),
  CONSTRAINT `fk_jc_user_group` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户表';

-- ----------------------------
-- Table structure for jc_user_collection
-- ----------------------------
CREATE TABLE `jc_user_collection` (
  `user_id` int(11) NOT NULL default '0' COMMENT '用户id',
  `content_id` int(11) NOT NULL default '0' COMMENT '内容id',
  PRIMARY KEY  (`user_id`,`content_id`),
  KEY `fk_jc_user_collection_con` (`content_id`),
  CONSTRAINT `fk_jc_user_collection_con` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_user_collection_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏关联表';

-- ----------------------------
-- Table structure for jc_user_department
-- ----------------------------
CREATE TABLE `jc_user_department` (
  `department_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`department_id`,`user_id`),
  KEY `fk_jc_department_user` (`user_id`),
  CONSTRAINT `fk_jc_department_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_department` FOREIGN KEY (`department_id`) REFERENCES `jc_department` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户部门关联表';

-- ----------------------------
-- Table structure for jc_user_ext
-- ----------------------------
CREATE TABLE `jc_user_ext` (
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) default NULL COMMENT '真实姓名',
  `gender` tinyint(1) default NULL COMMENT '性别',
  `birthday` datetime default NULL COMMENT '出生日期',
  `intro` varchar(255) default NULL COMMENT '个人介绍',
  `comefrom` varchar(150) default NULL COMMENT '来自',
  `qq` varchar(100) default NULL COMMENT 'QQ',
  `msn` varchar(100) default NULL COMMENT 'MSN',
  `phone` varchar(50) default NULL COMMENT '电话',
  `mobile` varchar(50) default NULL COMMENT '手机',
  `user_img` varchar(255) default NULL COMMENT '用户头像',
  `user_signature` varchar(255) default NULL COMMENT '用户个性签名',
  PRIMARY KEY  (`user_id`),
  CONSTRAINT `fk_jc_ext_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户扩展信息表';

-- ----------------------------
-- Table structure for jc_user_role
-- ----------------------------
CREATE TABLE `jc_user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`role_id`,`user_id`),
  KEY `fk_jc_role_user` (`user_id`),
  CONSTRAINT `fk_jc_role_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户角色关联表';

-- ----------------------------
-- Table structure for jc_user_site
-- ----------------------------
CREATE TABLE `jc_user_site` (
  `usersite_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL default '1' COMMENT '审核级别',
  `is_all_channel` tinyint(1) NOT NULL default '1' COMMENT '是否拥有所有栏目的权限',
  PRIMARY KEY  (`usersite_id`),
  KEY `fk_jc_site_user` (`user_id`),
  KEY `fk_jc_user_site` (`site_id`),
  CONSTRAINT `fk_jc_site_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS管理员站点表';

-- ----------------------------
-- Table structure for jc_vote_item
-- ----------------------------
CREATE TABLE `jc_vote_item` (
  `voteitem_id` int(11) NOT NULL auto_increment,
  `votetopic_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `vote_count` int(11) NOT NULL default '0' COMMENT '投票数量',
  `priority` int(11) NOT NULL default '10' COMMENT '排列顺序',
  PRIMARY KEY  (`voteitem_id`),
  KEY `fk_jc_vote_item_topic` (`votetopic_id`),
  CONSTRAINT `fk_jc_vote_item_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='CMS投票项';

-- ----------------------------
-- Table structure for jc_vote_record
-- ----------------------------
CREATE TABLE `jc_vote_record` (
  `voterecored_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `votetopic_id` int(11) NOT NULL,
  `vote_time` datetime NOT NULL COMMENT '投票时间',
  `vote_ip` varchar(50) NOT NULL COMMENT '投票IP',
  `vote_cookie` varchar(32) NOT NULL COMMENT '投票COOKIE',
  PRIMARY KEY  (`voterecored_id`),
  KEY `fk_jc_vote_record_topic` (`votetopic_id`),
  KEY `fk_jc_voterecord_user` (`user_id`),
  CONSTRAINT `fk_jc_voterecord_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_vote_record_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS投票记录';

-- ----------------------------
-- Table structure for jc_vote_topic
-- ----------------------------
CREATE TABLE `jc_vote_topic` (
  `votetopic_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `description` varchar(255) default NULL COMMENT '描述',
  `start_time` datetime default NULL COMMENT '开始时间',
  `end_time` datetime default NULL COMMENT '结束时间',
  `repeate_hour` int(11) default NULL COMMENT '重复投票限制时间，单位小时，为空不允许重复投票',
  `total_count` int(11) NOT NULL default '0' COMMENT '总投票数',
  `multi_select` int(11) NOT NULL default '1' COMMENT '最多可以选择几项',
  `is_restrict_member` tinyint(1) NOT NULL default '0' COMMENT '是否限制会员',
  `is_restrict_ip` tinyint(1) NOT NULL default '0' COMMENT '是否限制IP',
  `is_restrict_cookie` tinyint(1) NOT NULL default '0' COMMENT '是否限制COOKIE',
  `is_disabled` tinyint(1) NOT NULL default '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL default '0' COMMENT '是否默认主题',
  PRIMARY KEY  (`votetopic_id`),
  KEY `fk_jc_votetopic_site` (`site_id`),
  CONSTRAINT `fk_jc_votetopic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS投票主题';

-- ----------------------------
-- Table structure for jo_authentication
-- ----------------------------
CREATE TABLE `jo_authentication` (
  `authentication_id` char(32) NOT NULL COMMENT '认证ID',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) default NULL COMMENT '邮箱',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `login_ip` varchar(50) NOT NULL COMMENT '登录ip',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY  (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='认证信息表';

-- ----------------------------
-- Table structure for jo_config
-- ----------------------------
CREATE TABLE `jo_config` (
  `cfg_key` varchar(50) NOT NULL COMMENT '配置KEY',
  `cfg_value` varchar(255) default NULL COMMENT '配置VALUE',
  PRIMARY KEY  (`cfg_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Table structure for jo_ftp
-- ----------------------------
CREATE TABLE `jo_ftp` (
  `ftp_id` int(11) NOT NULL auto_increment,
  `ftp_name` varchar(100) NOT NULL COMMENT '名称',
  `ip` varchar(50) NOT NULL COMMENT 'IP',
  `port` int(11) NOT NULL default '21' COMMENT '端口号',
  `username` varchar(100) default NULL COMMENT '登录名',
  `password` varchar(100) default NULL COMMENT '登陆密码',
  `encoding` varchar(20) NOT NULL default 'UTF-8' COMMENT '编码',
  `timeout` int(11) default NULL COMMENT '超时时间',
  `ftp_path` varchar(255) default NULL COMMENT '路径',
  `url` varchar(255) NOT NULL COMMENT '访问URL',
  PRIMARY KEY  (`ftp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FTP表';

-- ----------------------------
-- Table structure for jo_template
-- ----------------------------
CREATE TABLE `jo_template` (
  `tpl_name` varchar(150) NOT NULL COMMENT '模板名称',
  `tpl_source` longtext COMMENT '模板内容',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `is_directory` tinyint(1) NOT NULL default '0' COMMENT '是否目录',
  PRIMARY KEY  (`tpl_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Table structure for jo_upload
-- ----------------------------
CREATE TABLE `jo_upload` (
  `filename` varchar(150) NOT NULL COMMENT '文件名',
  `length` int(11) NOT NULL COMMENT '文件大小(字节)',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `content` longblob NOT NULL COMMENT '内容',
  PRIMARY KEY  (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传附件表';

-- ----------------------------
-- Table structure for jo_user
-- ----------------------------
CREATE TABLE `jo_user` (
  `user_id` int(11) NOT NULL auto_increment COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) default NULL COMMENT '电子邮箱',
  `password` char(32) NOT NULL COMMENT '密码',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL default '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL default '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL default '0' COMMENT '登录次数',
  `reset_key` char(32) default NULL COMMENT '重置密码KEY',
  `reset_pwd` varchar(10) default NULL COMMENT '重置密码VALUE',
  `error_time` datetime default NULL COMMENT '登录错误时间',
  `error_count` int(11) NOT NULL default '0' COMMENT '登录错误次数',
  `error_ip` varchar(50) default NULL COMMENT '登录错误IP',
  `activation` tinyint(1) NOT NULL default '1' COMMENT '激活状态',
  `activation_code` char(32) default NULL COMMENT '激活码',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `ak_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for laiweb
-- ----------------------------
CREATE TABLE `laiweb` (
  `l_id` int(11) NOT NULL auto_increment,
  `taskid` int(11) default NULL,
  `websize` varchar(1000) default NULL,
  `t_percent` varchar(10) default NULL,
  PRIMARY KEY  (`l_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for land_batch
-- ----------------------------
CREATE TABLE `land_batch` (
  `taskid` int(11) NOT NULL COMMENT '任务号',
  `plset` varchar(1000) default NULL COMMENT '批量网址（以逗号隔开）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for land_custom
-- ----------------------------
CREATE TABLE `land_custom` (
  `d_id` int(11) NOT NULL COMMENT '序号',
  `taskid` int(11) default NULL COMMENT '任务号',
  `d_type` varchar(50) default NULL COMMENT '访问类型',
  `enterPage` varchar(1000) default NULL COMMENT '进入页面',
  `d_percent` varchar(10) default NULL COMMENT '百分比'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for liuliang
-- ----------------------------
CREATE TABLE `liuliang` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(2000) default NULL,
  `dates` varchar(20) default NULL,
  `coming` varchar(2000) default NULL,
  `content` varchar(5000) default NULL,
  `istop` varchar(1) default NULL,
  `orders` int(11) default NULL,
  `types` varchar(1) default NULL,
  `imgs` varchar(2000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for liutask
-- ----------------------------
CREATE TABLE `liutask` (
  `t_id` int(11) NOT NULL auto_increment,
  `userid` int(11) default NULL,
  `webname` varchar(1000) default NULL,
  `websize` varchar(1000) default NULL,
  `websizestate` varchar(1000) default NULL,
  `ipliu` int(11) default NULL,
  `ipbipv` int(11) default NULL,
  `pvtime` varchar(1000) default NULL,
  `liucoming` varchar(1000) default NULL,
  `comingweb` varchar(1000) default NULL,
  `tiaoweb` varchar(1000) default NULL,
  `tiaobai` varchar(1000) default NULL,
  `other` varchar(5000) default NULL,
  `nowliu` int(11) default NULL,
  `youstate` varchar(1) default NULL,
  `timelimit` varchar(100) default NULL,
  PRIMARY KEY  (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for slider
-- ----------------------------
CREATE TABLE `slider` (
  `taskid` int(11) default NULL,
  `time_0` int(11) default NULL,
  `time_1` int(11) default NULL,
  `time_2` int(11) default NULL,
  `time_3` int(11) default NULL,
  `time_4` int(11) default NULL,
  `time_5` int(11) default NULL,
  `time_6` int(11) default NULL,
  `time_7` int(11) default NULL,
  `time_8` int(11) default NULL,
  `time_9` int(11) default NULL,
  `time_10` int(11) default NULL,
  `time_11` int(11) default NULL,
  `time_12` int(11) default NULL,
  `time_13` int(11) default NULL,
  `time_14` int(11) default NULL,
  `time_15` int(11) default NULL,
  `time_16` int(11) default NULL,
  `time_17` int(11) default NULL,
  `time_18` int(11) default NULL,
  `time_19` int(11) default NULL,
  `time_20` int(11) default NULL,
  `time_21` int(11) default NULL,
  `time_22` int(11) default NULL,
  `time_23` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for source_batch
-- ----------------------------
CREATE TABLE `source_batch` (
  `taskid` int(11) NOT NULL COMMENT '任务号',
  `plset` varchar(1000) default NULL COMMENT '批量网址（以逗号隔开）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for source_custom
-- ----------------------------
CREATE TABLE `source_custom` (
  `l_id` int(11) NOT NULL COMMENT '序号',
  `taskid` int(11) default NULL COMMENT '任务号',
  `l_type` varchar(50) default NULL COMMENT '来源类型',
  `l_content` varchar(1000) default NULL COMMENT '来源内容',
  `l_percent` varchar(10) default NULL COMMENT '百分比'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tiaoweb
-- ----------------------------
CREATE TABLE `tiaoweb` (
  `ti_id` int(11) NOT NULL auto_increment,
  `taskid` int(11) default NULL,
  `websize` varchar(1000) default NULL,
  `t_percent` varchar(10) default NULL,
  PRIMARY KEY  (`ti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tiaowebbai
-- ----------------------------
CREATE TABLE `tiaowebbai` (
  `b_id` int(11) NOT NULL auto_increment,
  `taskid` int(11) default NULL,
  `websize` varchar(1000) default NULL,
  PRIMARY KEY  (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
CREATE TABLE `u_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) default NULL,
  `password` varchar(50) default NULL,
  `accountBal` float default NULL,
  `vipPoints` int(11) default NULL,
  `vipLevel` int(11) default NULL,
  `mail` varchar(30) default NULL,
  `phone` int(11) default NULL,
  `qq` int(11) default NULL,
  `msn` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ua_batch
-- ----------------------------
CREATE TABLE `ua_batch` (
  `taskid` int(11) NOT NULL COMMENT '任务号',
  `plset` varchar(1000) default NULL COMMENT '批量网址（以逗号隔开）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ua_custom
-- ----------------------------
CREATE TABLE `ua_custom` (
  `u_id` int(11) NOT NULL COMMENT '序号',
  `taskid` int(11) default NULL COMMENT '任务号',
  `ua` varchar(1000) default NULL COMMENT 'UA标识',
  `u_percent` varchar(10) default NULL COMMENT '百分比'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for weblog
-- ----------------------------
CREATE TABLE `weblog` (
  `w_id` int(11) NOT NULL auto_increment,
  `taskid` int(11) default NULL,
  `websize` varchar(1000) default NULL,
  `w_percent` varchar(10) default NULL,
  `xuhao` int(11) default NULL,
  PRIMARY KEY  (`w_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `areas` VALUES ('2', '上海,江苏,浙江,安徽,江西,广东,福建,广西,海南,北京,天津,河北,山东,河南,山西,内蒙古,湖北,湖南,四川,重庆,贵州,云南,西藏,辽宁,吉林,黑龙江,陕西,甘肃,宁夏,青海,新疆,台湾,香港,澳门,国外');
INSERT INTO `areas` VALUES ('3', '上海,江苏,浙江,安徽,江西,广东,福建,广西,海南,北京,天津,河北,山东,河南,山西,内蒙古,湖北,湖南,四川,重庆,贵州,云南,西藏,辽宁,吉林,黑龙江,陕西,甘肃,宁夏,青海,新疆,台湾,香港,澳门,国外');
INSERT INTO `areas` VALUES ('5', '上海,江苏,浙江,安徽,江西,广东,福建,广西,海南,北京,天津,河北,山东,河南,山西,内蒙古,湖北,湖南,四川,重庆,贵州,云南,西藏,辽宁,吉林,黑龙江,陕西,甘肃,宁夏,青海,新疆,台湾,香港,澳门,国外');
INSERT INTO `areas` VALUES ('6', '上海,江苏,浙江,安徽,江西,广东,福建,广西,海南,北京,天津,河北,山东,河南,山西,内蒙古,湖北,湖南,四川,重庆,贵州,云南,西藏,辽宁,吉林,黑龙江,陕西,甘肃,宁夏,青海,新疆,台湾,香港,澳门,国外');
INSERT INTO `areas` VALUES ('7', '上海,江苏,浙江,安徽,江西,广东,福建,广西,海南,北京,天津,河北,山东,河南,山西,内蒙古,湖北,湖南,四川,重庆,贵州,云南,西藏,辽宁,吉林,黑龙江,陕西,甘肃,宁夏,青海,新疆,台湾,香港,澳门,国外');
INSERT INTO `areas` VALUES ('8', '上海,江苏,浙江,安徽,江西,广东,福建,广西,海南,北京,天津,河北,山东,河南,山西,内蒙古,湖北,湖南,四川,重庆,贵州,云南,西藏,辽宁,吉林,黑龙江,陕西,甘肃,宁夏,青海,新疆,台湾,香港,澳门,国外');
INSERT INTO `areas` VALUES ('9', '上海,江苏,浙江,安徽,江西,广东,福建,广西,海南,北京,天津,河北,山东,河南,山西,内蒙古,湖北,湖南,四川,重庆,贵州,云南,西藏,辽宁,吉林,黑龙江,陕西,甘肃,宁夏,青海,新疆,台湾,香港,澳门,国外');
INSERT INTO `batch_fixed` VALUES ('2', '5000');
INSERT INTO `batch_fixed` VALUES ('3', '5000');
INSERT INTO `batch_fixed` VALUES ('5', '5000');
INSERT INTO `batch_fixed` VALUES ('6', '5000');
INSERT INTO `batch_fixed` VALUES ('7', '5000');
INSERT INTO `batch_fixed` VALUES ('8', '3000');
INSERT INTO `batch_fixed` VALUES ('9', '3000');
INSERT INTO `batch_plan` VALUES ('1', '10', '2013年07月22日', '2013年07月22日', '1', '0000003000', '计划中');
INSERT INTO `batch_plan` VALUES ('2', '10', '2013年07月23日', '2013年07月23日', '1', '0000003000', '计划中');
INSERT INTO `batch_plan` VALUES ('1', '41', '2013年07月25日', '2013年07月25日', '1', '0000003000', '计划中');
INSERT INTO `batch_plan` VALUES ('2', '41', '2013年07月26日', '2013年07月26日', '1', '0000003000', '计划中');
INSERT INTO `firstpage` VALUES ('2', '爱在哈佛', '冻死了房间卡机大富科技啊sdk附加阿克苏sdf', '1', '', '3');
INSERT INTO `firstpage` VALUES ('3', '爱在哈佛', '冻死了房间卡', '1', '', '3');
INSERT INTO `firstpage` VALUES ('4', '电脑', '一种用于高速计算的电子计算机器，可以进行数值计算，又可以进行逻辑计算，还具有存储记忆功能', '1', '', '0');
INSERT INTO `firstpage` VALUES ('5', '面带笑容', '冻死了房间卡机大', '1', '', '3');
INSERT INTO `firstpage` VALUES ('6', 'sdf', 'asdfsdfwwww', '0', '', '3');
INSERT INTO `firstpage` VALUES ('7', '222222222', '<P>22222222222</P>', '0', '', '3');
INSERT INTO `firstpage` VALUES ('8', '333333333', '333333332222222', '0', '', '3');
INSERT INTO `firstpage` VALUES ('9', 'ssssssssss', 'sssssssssssmmmmmmmmmm', '0', '', '3');
INSERT INTO `firstpage` VALUES ('10', 'wwwwwwwww', 'wwwww', '0', '', '3');
INSERT INTO `firstpage` VALUES ('11', 'eeeeee', 'eeeeeeeeee', '0', '', '3');
INSERT INTO `firstpage` VALUES ('12', 'ssss', 'ssssssssssss', '0', '', '3');
INSERT INTO `firstpage` VALUES ('13', 'wwwwwwwwwwwwww', 'wwwwwww', '0', '', '3');
INSERT INTO `firstpage` VALUES ('14', 'wwwwwwwwwwwwwww', 'wwwwwwwwwwwwwwwwwwwww', '0', '', '3');
INSERT INTO `firstpage` VALUES ('16', 'ssskkkkkkkkkk', 'sssssssssss', '0', '', '3');
INSERT INTO `firstpage` VALUES ('46', '应用1', '撒旦法师的法师打发撒旦法师打发斯蒂芬', '1', '', '2');
INSERT INTO `firstpage` VALUES ('47', '应用2', '角度看老骥伏枥肯定是积分卡两地分居高考', '2', '', '2');
INSERT INTO `firstpage` VALUES ('48', '应用3', '阿迪所发生的发斯蒂芬', '3', '', '2');
INSERT INTO `firstpage` VALUES ('49', '应用4', '阿斯顿法师打', '4', '', '2');
INSERT INTO `firstpage` VALUES ('50', '特点1', '阿斯顿发大水法师打发封神', '1', '', '1');
INSERT INTO `firstpage` VALUES ('51', '特点2', '阿地方撒撒旦法师的', '2', '', '1');
INSERT INTO `firstpage` VALUES ('52', '特点3', '爱的发的发生的发生', '3', '', '1');
INSERT INTO `firstpage` VALUES ('53', '特点4', '阿迪法师打法师打', '4', '', '1');
INSERT INTO `flow_task` VALUES ('2', '1', '5', '5.00点/天', '百度', 'www.baidu.com', '1', '5.00点/天', '-3', '0', '无', '1', '2', '1', '2', '1', null, '1', '百度', null, null, '2013-07-22', '1');
INSERT INTO `flow_task` VALUES ('3', '1', '5', '5.00点/天', '百度', 'www.baidu.com', '1', '5.00点/天', '-3', '0', '无', '1', '2', '1', '2', '1', null, '1', '百度', null, null, '2013-07-22', '2');
INSERT INTO `flow_task` VALUES ('5', '1', '1', '5.00点/天', '百度', 'www.baidu.com', '1', '5.00点/天', '3', '0', '无', '1', '2', '1', '2', '1', null, '1', '百度', null, null, '2013-07-22', '2');
INSERT INTO `flow_task` VALUES ('6', '1', '1', 'false点/天', '白读', 'www.baidu.com', '1', '5.00点/天', '3', '0', '无', '1', '2', '1', '2', '1', null, '1', 'sadfasdfa', null, null, '2013-07-22', '2');
INSERT INTO `flow_task` VALUES ('7', '1', '1', 'false点/天', '白读', 'www.baidu.com', '1', '5.00点/天', '3', '0', '无', '1', '2', '1', '2', '1', null, '1', 'sadfasdfa', null, null, '2013-07-22', '2');
INSERT INTO `flow_task` VALUES ('8', '1', '5', '3.00点/天', '测试', 'www.test.com', '1', '3.00点/天', '3', '0', '无', '1', '2', '1', '2', '1', null, '1', '水电费', null, null, '2013-07-22', '2');
INSERT INTO `flow_task` VALUES ('9', '1', '5', '3.00点/天', '测试', 'www.test.com', '1', '3.00点/天', '3', '0', '无', '1', '2', '1', '2', '1', null, '1', '水电费', null, null, '2013-07-22', '2');
INSERT INTO `jc_advertising` VALUES ('1', '1', '1', 'banner', 'image', null, '1', '127', '0', null, null, '1');
INSERT INTO `jc_advertising` VALUES ('2', '2', '1', '通栏广告1', 'image', null, '1', '123', '2', null, null, '1');
INSERT INTO `jc_advertising` VALUES ('3', '3', '1', '视频广告上', 'image', null, '1', '0', '0', null, null, '1');
INSERT INTO `jc_advertising` VALUES ('4', '4', '1', '视频广告下', 'image', null, '1', '0', '0', null, null, '1');
INSERT INTO `jc_advertising` VALUES ('5', '5', '1', '留言板本周热点广告', 'image', null, '1', '0', '0', null, null, '1');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES ('2', 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES ('2', 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES ('2', 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES ('2', 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES ('2', 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES ('2', 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES ('3', 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES ('3', 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES ('3', 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES ('3', 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES ('3', 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES ('4', 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES ('4', 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES ('4', 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES ('4', 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES ('4', 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES ('5', 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES ('5', 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES ('5', 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES ('5', 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES ('5', 'image_width', '215');
INSERT INTO `jc_advertising_space` VALUES ('1', '1', '页头banner', '全站页头banner', '1');
INSERT INTO `jc_advertising_space` VALUES ('2', '1', '通栏广告', '页面中间通栏广告', '1');
INSERT INTO `jc_advertising_space` VALUES ('3', '1', '视频广告上', '', '1');
INSERT INTO `jc_advertising_space` VALUES ('4', '1', '视频广告下', '', '1');
INSERT INTO `jc_advertising_space` VALUES ('5', '1', '留言板本周热点广告', '', '1');
INSERT INTO `jc_channel` VALUES ('59', '8', '1', null, 'shouye', '1', '18', '7', '1', '1');
INSERT INTO `jc_channel` VALUES ('61', '8', '1', '59', 'intro', '2', '3', '2', '1', '1');
INSERT INTO `jc_channel` VALUES ('78', '9', '1', null, 'other', '19', '30', '10', '1', '1');
INSERT INTO `jc_channel` VALUES ('80', '9', '1', '78', 'Flow', '20', '21', '2', '1', '1');
INSERT INTO `jc_channel` VALUES ('81', '9', '1', '78', 'Optimize', '22', '23', '3', '1', '1');
INSERT INTO `jc_channel` VALUES ('85', '9', '1', '78', 'Help', '24', '25', '6', '1', '1');
INSERT INTO `jc_channel` VALUES ('86', '8', '1', '59', 'tedian', '4', '5', '10', '1', '1');
INSERT INTO `jc_channel` VALUES ('87', '8', '1', '59', 'learn', '6', '7', '3', '1', '1');
INSERT INTO `jc_channel` VALUES ('89', '9', '1', '78', 'Question', '26', '27', '10', '1', '1');
INSERT INTO `jc_channel` VALUES ('90', '9', '1', '78', 'Ads', '28', '29', '10', '1', '1');
INSERT INTO `jc_channel` VALUES ('91', '8', '1', '59', 'register', '8', '9', '10', '1', '1');
INSERT INTO `jc_channel` VALUES ('92', '8', '1', '59', 'findpassword', '10', '11', '10', '1', '1');
INSERT INTO `jc_channel` VALUES ('93', '10', '1', '59', 'tu', '12', '13', '10', '1', '1');
INSERT INTO `jc_channel` VALUES ('94', '8', '1', '59', 'setpassword', '14', '15', '10', '1', '1');
INSERT INTO `jc_channel` VALUES ('95', '8', '1', '59', 'contact', '16', '17', '10', '1', '1');
INSERT INTO `jc_channel_ext` VALUES ('59', '首页管理', null, null, '1', '1', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('61', '产品介绍', null, null, '0', '1', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('78', '其他页管理', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('80', '免费提升流量', null, null, '1', '1', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('81', '网站流量优化', null, null, '1', '1', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html', '/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html', null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '经验分享', null, null);
INSERT INTO `jc_channel_ext` VALUES ('85', '使用帮助', null, null, '1', '1', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('86', '特点', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('87', '知识文库', null, null, '1', '1', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('89', '常见问题', null, null, '1', '1', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('90', '最新公告', null, null, '1', '1', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_最新公告.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('91', '会员注册', null, null, '1', '1', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_会员注册.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('92', '找回密码(发送邮箱验证码)', null, null, '1', '0', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码1.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('93', '首页切换的图片', null, null, '0', '0', '1', '0', '20', null, null, null, null, null, null, '/liuliang/u/cms/www/201307/31105528v15k.png', '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('94', '找回密码（设置密码）', null, null, '1', '1', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码2.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_channel_ext` VALUES ('95', '联系方式', null, null, '1', '1', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null);
INSERT INTO `jc_chnl_group_contri` VALUES ('59', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('61', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('78', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('80', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('81', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('85', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('86', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('87', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('89', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('90', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('91', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('92', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('94', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('95', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('59', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('61', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('78', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('80', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('81', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('85', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('86', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('87', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('89', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('90', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('91', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('92', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('94', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('95', '2');
INSERT INTO `jc_config` VALUES ('1', '/liuliang', null, '8080', '/dbfile.svl?n=', '0', '/r/cms/www/no_picture.gif', '/login.jspx', null, '1', '120', '120', '/r/cms/www/watermark.png', 'www.jeecms.com', '20', '#FF0000', '50', '1', '0', '0', '2012-12-31', '2012-12-31 10:34:28', 'jeecms', '12', null, null, null, null, null, '0');
INSERT INTO `jc_config_attr` VALUES ('1', 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES ('1', 'username_reserved', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES ('1', 'version', 'jeecms-3.1.1-final');
INSERT INTO `jc_content` VALUES ('343', '61', '1', '2', '1', '2012-12-27 17:28:33', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('344', '61', '1', '2', '1', '2012-12-27 17:29:24', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('345', '61', '1', '2', '1', '2012-12-27 17:30:00', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('346', '61', '1', '2', '1', '2012-12-27 17:30:37', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('423', '81', '1', '1', '1', '2013-01-04 15:29:29', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('424', '81', '1', '1', '1', '2013-01-04 15:31:05', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('425', '81', '1', '1', '1', '2013-01-04 15:31:48', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('435', '80', '1', '1', '1', '2013-01-11 09:11:33', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('438', '61', '1', '2', '1', '2013-06-26 18:59:14', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('445', '86', '1', '2', '1', '2013-06-27 12:05:44', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('446', '86', '1', '2', '1', '2013-06-27 12:06:36', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('447', '86', '1', '2', '1', '2013-06-27 12:07:15', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('448', '86', '1', '2', '1', '2013-06-27 12:07:52', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('449', '87', '1', '1', '1', '2013-07-03 15:14:20', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('458', '90', '1', '1', '1', '2013-07-30 14:28:25', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('459', '90', '1', '1', '1', '2013-07-30 14:28:30', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('460', '90', '1', '1', '1', '2013-07-30 14:28:35', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('461', '90', '1', '1', '1', '2013-07-30 14:28:40', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('462', '90', '1', '1', '1', '2013-07-30 14:28:49', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('463', '90', '1', '1', '1', '2013-07-30 14:28:54', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('464', '90', '1', '1', '1', '2013-07-30 14:29:04', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('465', '89', '1', '1', '1', '2013-07-30 14:29:24', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('466', '89', '1', '1', '1', '2013-07-30 14:29:28', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('467', '89', '1', '1', '1', '2013-07-30 14:29:32', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('468', '89', '1', '1', '1', '2013-07-30 14:29:36', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('469', '89', '1', '1', '1', '2013-07-30 14:29:40', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('470', '89', '1', '1', '1', '2013-07-30 14:29:44', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('471', '89', '1', '1', '1', '2013-07-30 14:29:55', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('472', '85', '1', '1', '1', '2013-07-30 14:30:09', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('473', '85', '1', '1', '1', '2013-07-30 14:30:14', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('474', '85', '1', '1', '1', '2013-07-30 14:30:18', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('475', '85', '1', '1', '1', '2013-07-30 14:30:23', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('476', '85', '1', '1', '1', '2013-07-30 14:30:27', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('477', '85', '1', '1', '1', '2013-07-30 14:30:31', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('478', '85', '1', '1', '1', '2013-07-30 14:30:35', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('479', '61', '1', '2', '1', '2013-07-30 14:34:30', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('480', '81', '1', '1', '1', '2013-07-31 10:19:14', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('481', '81', '1', '1', '1', '2013-07-31 10:23:38', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('482', '93', '1', '2', '1', '2013-07-31 11:04:13', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('483', '93', '1', '2', '1', '2013-07-31 11:05:08', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('484', '95', '1', '1', '1', '2013-08-07 15:19:14', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('485', '95', '1', '1', '1', '2013-08-07 15:19:45', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('486', '95', '1', '1', '1', '2013-08-07 15:21:04', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `jc_content_channel` VALUES ('61', '343');
INSERT INTO `jc_content_channel` VALUES ('61', '344');
INSERT INTO `jc_content_channel` VALUES ('61', '345');
INSERT INTO `jc_content_channel` VALUES ('61', '346');
INSERT INTO `jc_content_channel` VALUES ('81', '423');
INSERT INTO `jc_content_channel` VALUES ('81', '424');
INSERT INTO `jc_content_channel` VALUES ('81', '425');
INSERT INTO `jc_content_channel` VALUES ('80', '435');
INSERT INTO `jc_content_channel` VALUES ('61', '438');
INSERT INTO `jc_content_channel` VALUES ('86', '445');
INSERT INTO `jc_content_channel` VALUES ('86', '446');
INSERT INTO `jc_content_channel` VALUES ('86', '447');
INSERT INTO `jc_content_channel` VALUES ('86', '448');
INSERT INTO `jc_content_channel` VALUES ('87', '449');
INSERT INTO `jc_content_channel` VALUES ('90', '458');
INSERT INTO `jc_content_channel` VALUES ('90', '459');
INSERT INTO `jc_content_channel` VALUES ('90', '460');
INSERT INTO `jc_content_channel` VALUES ('90', '461');
INSERT INTO `jc_content_channel` VALUES ('90', '462');
INSERT INTO `jc_content_channel` VALUES ('90', '463');
INSERT INTO `jc_content_channel` VALUES ('90', '464');
INSERT INTO `jc_content_channel` VALUES ('89', '465');
INSERT INTO `jc_content_channel` VALUES ('89', '466');
INSERT INTO `jc_content_channel` VALUES ('89', '467');
INSERT INTO `jc_content_channel` VALUES ('89', '468');
INSERT INTO `jc_content_channel` VALUES ('89', '469');
INSERT INTO `jc_content_channel` VALUES ('89', '470');
INSERT INTO `jc_content_channel` VALUES ('89', '471');
INSERT INTO `jc_content_channel` VALUES ('85', '472');
INSERT INTO `jc_content_channel` VALUES ('85', '473');
INSERT INTO `jc_content_channel` VALUES ('85', '474');
INSERT INTO `jc_content_channel` VALUES ('85', '475');
INSERT INTO `jc_content_channel` VALUES ('85', '476');
INSERT INTO `jc_content_channel` VALUES ('85', '477');
INSERT INTO `jc_content_channel` VALUES ('85', '478');
INSERT INTO `jc_content_channel` VALUES ('61', '479');
INSERT INTO `jc_content_channel` VALUES ('81', '480');
INSERT INTO `jc_content_channel` VALUES ('81', '481');
INSERT INTO `jc_content_channel` VALUES ('93', '482');
INSERT INTO `jc_content_channel` VALUES ('93', '483');
INSERT INTO `jc_content_channel` VALUES ('95', '484');
INSERT INTO `jc_content_channel` VALUES ('95', '485');
INSERT INTO `jc_content_channel` VALUES ('95', '486');
INSERT INTO `jc_content_check` VALUES ('343', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('344', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('345', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('346', '2', null, '0', '1', '2012-12-27 17:31:31');
INSERT INTO `jc_content_check` VALUES ('423', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('424', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('425', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('435', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('438', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('445', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('446', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('447', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('448', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('449', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('458', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('459', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('460', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('461', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('462', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('463', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('464', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('465', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('466', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('467', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('468', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('469', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('470', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('471', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('472', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('473', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('474', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('475', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('476', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('477', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('478', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('479', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('480', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('481', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('482', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('483', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('484', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('485', '2', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('486', '2', null, '0', null, null);
INSERT INTO `jc_content_count` VALUES ('343', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('344', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('345', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('346', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('423', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('424', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('425', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('435', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('438', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('445', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('446', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('447', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('448', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('449', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('458', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('459', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('460', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('461', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('462', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('463', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('464', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('465', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('466', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('467', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('468', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('469', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('470', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('471', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('472', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('473', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('474', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('475', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('476', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('477', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('478', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('479', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('480', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('481', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('482', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('483', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('484', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('485', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('486', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_ext` VALUES ('343', '更多神秘功能？', null, null, null, null, null, '2012-12-27 17:28:27', null, null, null, '0', null, null, '/liuliang/u/cms/www/201307/301436513wl1.png', null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('344', '平台控制精准', null, null, null, null, null, '2012-12-27 17:29:24', null, null, null, '0', null, null, '/liuliang/u/cms/www/201307/30143714ungx.png', null, '/WEB-INF/t/cms/www/liuroot/content/首页管理index.html', '1');
INSERT INTO `jc_content_ext` VALUES ('345', '绿色安全', null, null, null, null, null, '2012-12-27 17:30:00', null, null, null, '0', null, null, '/liuliang/u/cms/www/201307/3014372597fj.png', null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('346', '真实有效', null, null, null, null, null, '2012-12-27 17:30:37', null, null, null, '0', null, null, '/liuliang/u/cms/www/201307/30143740sqgb.png', null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('423', '网站刷流量不可放弃内容建设 ', null, null, 'www.163.com', null, '流量', '2013-06-27 17:52:51', null, null, null, '0', null, null, null, null, '/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html', '0');
INSERT INTO `jc_content_ext` VALUES ('424', '新站刷流量', null, null, 'www.baidu.com', null, '流量', '2013-06-27 17:52:44', null, null, null, '0', null, null, null, null, '/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html', '0');
INSERT INTO `jc_content_ext` VALUES ('425', '24小时不间断自动刷流量的神器', null, null, 'www.youku.com', null, '斯蒂芬', '2013-06-27 17:32:31', null, null, null, '0', null, null, null, null, '/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html', '0');
INSERT INTO `jc_content_ext` VALUES ('435', '加链接 送流量！', null, null, null, null, null, '2013-01-11 09:11:33', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('438', '免费提升流量', null, null, null, null, null, '2013-06-26 18:59:14', null, null, null, '0', null, null, '/liuliang/u/cms/www/201307/30143750qune.png', null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('445', '专业', null, null, null, null, null, '2013-06-27 12:05:44', null, null, null, '0', null, null, '/liuliang/u/cms/www/201307/301427372zt5.png', null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('446', '安全', null, null, null, null, null, '2013-06-27 12:06:36', null, null, null, '0', null, null, '/liuliang/u/cms/www/201307/30142659xo0m.png', null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('447', '简单', null, null, null, null, null, '2013-06-27 12:07:15', null, null, null, '0', null, null, '/liuliang/u/cms/www/201307/30142637gwjf.png', null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('448', '成长', null, null, null, null, null, '2013-06-27 12:07:52', null, null, null, '0', null, null, '/liuliang/u/cms/www/201307/301425489wqf.png', null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('449', '浅析Alexa的搜索分析功能', null, null, null, null, null, '2013-07-03 15:14:20', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('458', '修复了在某些情况下不提示升级的bug', null, null, null, null, null, '2013-07-30 14:28:25', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('459', '屏蔽了网页里存在影响到电脑的JS代码', null, null, null, null, null, '2013-07-30 14:28:30', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('460', '优化了流量模式的执行效率', null, null, null, null, null, '2013-07-30 14:28:35', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('461', '修改了某些运行环境下可能出现崩溃', null, null, null, null, null, '2013-07-30 14:28:40', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('462', '增强网址过滤功能，优化执行效率', null, null, null, null, null, '2013-07-30 14:28:49', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('463', '优化软件对系统资源的占用', null, null, null, null, null, '2013-07-30 14:28:54', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('464', '加强对病毒木马的拦截处理', null, null, null, null, null, '2013-07-30 14:29:04', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('465', '流量宝可以刷多少流量？', null, null, null, null, null, '2013-07-30 14:29:24', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('466', '为什么360会报毒？', null, null, null, null, null, '2013-07-30 14:29:28', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('467', '添加多个任务流量会成倍增加吗？', null, null, null, null, null, '2013-07-30 14:29:32', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('468', '流量王的工作原理是什么？', null, null, null, null, null, '2013-07-30 14:29:36', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('469', '流量王的流量是真实IP吗？', null, null, null, null, null, '2013-07-30 14:29:40', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('470', '为什么流量王开了很久还没流量？', null, null, null, null, null, '2013-07-30 14:29:44', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('471', '怎么刷QQ空间人气？', null, null, null, null, null, '2013-07-30 14:29:55', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('472', '流量宝隐藏挂机介绍', null, null, null, null, null, '2013-07-30 14:30:09', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('473', '添加广告优化任务教程', null, null, null, null, null, '2013-07-30 14:30:14', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('474', '流量王会员服务使用方法', null, null, null, null, null, '2013-07-30 14:30:18', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('475', '流量王比其他刷流量软件具有哪些优点？', null, null, null, null, null, '2013-07-30 14:30:23', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('476', '流量王可否刷投票', null, null, null, null, null, '2013-07-30 14:30:27', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('477', '流量王会员系统新增UA设置功能', null, null, null, null, null, '2013-07-30 14:30:31', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('478', '流量王新增对JavaScript链接的点击功能', null, null, null, null, null, '2013-07-30 14:30:35', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('479', '添加多任务执行', null, null, null, null, null, '2013-07-30 14:34:30', null, null, null, '0', null, null, '/liuliang/u/cms/www/201307/30143817a6zh.png', null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('480', '可不可以同时刷同一个网址很多次', null, null, null, null, null, '2013-07-31 10:19:14', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('481', '刷流量最重要的事 ', null, null, null, null, null, '2013-07-31 10:23:38', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('482', '挂机版', null, null, null, null, null, '2013-07-31 11:04:13', null, null, null, '0', null, null, '/liuliang/u/cms/www/201307/31110349enc6.jpg', 'http://www.google.cn', null, '1');
INSERT INTO `jc_content_ext` VALUES ('483', '刷流量版', null, null, null, null, null, '2013-07-31 11:05:08', null, null, null, '0', null, null, '/liuliang/u/cms/www/201307/31110443ppb2.jpg', 'http://www.baidu.com', null, '1');
INSERT INTO `jc_content_ext` VALUES ('484', '电话', null, null, null, null, null, '2013-08-07 15:19:14', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('485', 'QQ', null, null, null, null, null, '2013-08-07 15:19:45', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_ext` VALUES ('486', '地址', null, null, null, null, null, '2013-08-07 15:21:04', null, null, null, '0', null, null, null, null, null, '1');
INSERT INTO `jc_content_tag` VALUES ('1', '2011', '1');
INSERT INTO `jc_content_tag` VALUES ('2', '中国', '1');
INSERT INTO `jc_content_tag` VALUES ('9', '机构', '0');
INSERT INTO `jc_content_tag` VALUES ('16', '基金', '0');
INSERT INTO `jc_content_tag` VALUES ('52', '调控', '0');
INSERT INTO `jc_content_txt` VALUES ('343', '运行软件，输入你需要优化的网址，点开始优化即可。软件支持XP，Vista，Win7操作系统。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('344', '可24小时精准控制流量，可定义流量来路，支持地址跳转，并可定义目标地址。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('345', '基于沙盒技术，可靠安全。智能分析网址，避免分享网站中的不正常代码对用户造成干扰', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('346', '产生的流量全是真实有效的', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('423', '流量宝目前刷流量的功能越来越健全，所刷的流量不但本身真实外，还可设置许多诸如流量的来源、跳转、流量地区、分布、停留时间、甚至UA等各项参数。但在刷流量的同时，站长们也不可偏废网站内容建设。毕竟，网站的内容才是吸引用户的根本，而网站刷流量只可起到辅助增加人气，提高部分排名等功能。如果光刷流量而放弃了内容建设，那就本末倒置了。若网站堆积的只是一些垃圾内容，又或从不更新，那网站即使有再高流量，那对用户来', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('424', '几乎所有的新站都希望能快速获得流量，但许多新站长对于网站刷流量目的与作用又存在不少误解。作为新站长，往往最担心的是刷流量会遭到惩罚，尤其是遭到搜索引擎的惩罚。其实这是站长们不了解搜索引擎的工作原理，把搜索引擎神话了。搜索引擎的&ldquo;爬虫&rdquo;其实只对网站内容进行跟踪，对网站的流量是无法知晓的。所以这个担心是多余的，新站完全可以放心刷流量，刷多少流量都行，只要网站能承受的住就行。许多新站长还认为通过刷流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('425', '流量王作为一款专业的刷网站流量工具，可实现24小时不间断自动刷流量，大大简化了为获得持续流量而付出大量时间的操作，并且流量宝由于采用的是P2P原理，所刷的网站流量真实有效，通过流量统计系统可以实时查看到。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('435', '<DIV \r\nclass=\"text pl30\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现在只需在您的网站首页（<FONT \r\ncolor=red>要求百度权重≥2 或者 谷歌PR≥2</FONT>）上添加流量宝（<A \r\nhref=\"${base}/\">${base}/</A>）的链接（<FONT \r\ncolor=red>全站链优先考虑</FONT>），并且链接文字为：<A title=流量宝-快速提高网站流量和Alexa排名 \r\nhref=\"${base}/\" \r\ntarget=_blank>刷流量软件</A>。流量宝将会为您的网站提供免费流量服务，即使您不开启流量宝软件，您的网站依旧能够获得大量真实IP来源的网页流量！ \r\n</DIV>\r\n<DIV class=s-black-title>活动规则</DIV>\r\n<DIV class=\"text pl30\">\r\n<UL class=num-list>\r\n  <LI>请在您的网站首页（<FONT color=red>要求百度权重≥2 或者 谷歌PR≥2</FONT>）添加流量宝网站（<A \r\n  href=\"${base}\">${base}</A>）的链接（<FONT \r\n  color=red>全站链优先考虑</FONT>），并且链接文字为：<A title=流量宝-快速提高网站流量和Alexa排名 \r\n  href=\"${base}\" target=_blank>刷流量软件</A>。 <BR>您可直接复制以下代码： \r\n  <BR><FONT color=blue>&lt;a href=\"${base}\" \r\n  title=\"流量宝-免费刷流量软件\" target=\"_blank\"&gt;刷流量软件&lt;/a&gt;</FONT></LI>\r\n  <LI>百度权重，谷歌PR查询地址：<A href=\"http://seo.chinaz.com/\" rel=nofollow \r\n  target=_blank>http://seo.chinaz.com/</A></LI>\r\n  <LI>将您添加好链接的网址提交给在线客服。</LI>\r\n  <LI>我们收到网址经过核对后将给您开通免费流量服务，您的网站每日晚上22点至次日上午10点将获得流量宝网站送出的<STRONG>免费流量</STRONG>服务，（晚上可以安心的关机睡觉了哦！）。</LI></UL></DIV>\r\n\r\n', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('438', '一款绿色软件，无需注册、安装。只需下载到桌面上直接运行，并且永久免费。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('445', '以先进的编程思想指导，专业人员共同开发，团队运作', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('446', '采用firefox核心，无毒无插件。软件架构先进。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('447', '简单是淘流量软件开发的首要目标', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('448', '800000用户积累，口碑相传。每天都在进步', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('449', '前一段时间，Alexa英文站和中文站（部分）在其页面上发布了新的搜索分析功能。如何利用这些功能来提高网站的流量或者监测关键词的竞争情况呢？首先，请您访问您最喜欢的网站的Alexa网站信息页面(比如说henan100.com）。然后点击\"SearchAnalytics\"标签，这是Alexa关于一个网站的搜索分析的核心模块，我们按部分依次介绍。搜索流量(SearchTraffic)这部分是您网站流量中来自搜索引擎搜索的百分比，这部分流量包括谷歌，必应，雅虎，百度，搜狗，搜搜，有道等搜索引擎。值得提出的是，这部分流量是来自搜索引擎中搜索部分的流量，而不是全部来自搜索引擎域名的流量。尤其是谷歌，它会带来许多非搜索的流量，比如说谷歌新闻，谷歌邮件等等。您可以利用这个工具查询您的网站的百分比，并比较您的网站与您的竞争者的的情况，来查看您是网站是否更容易在搜索引擎上发现。 ', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('458', '几乎所有的新站都希望能快速获得流量，但许多新站长对于网站刷流量目的与作用又存在不少误解。作为新站长，往往最担心的是刷流量会遭到惩罚，尤其是遭到搜索引擎的惩罚。其实这是站长们不了解搜索引擎的工作原理，把搜索引擎神话了。搜索引擎的“爬虫”其实只对网站内容进行跟踪，对网站的流量是无法知晓的。所以这个担心是多余的，新站完全可以放心刷流量，刷多少流量都行，只要网站能承受的住就行。许多新站长还认为通过刷流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('459', '几乎所有的新站都希望能快速获得流量，但许多新站长对于网站刷流量目的与作用又存在不少误解。作为新站长，往往最担心的是刷流量会遭到惩罚，尤其是遭到搜索引擎的惩罚。其实这是站长们不了解搜索引擎的工作原理，把搜索引擎神话了。搜索引擎的“爬虫”其实只对网站内容进行跟踪，对网站的流量是无法知晓的。所以这个担心是多余的，新站完全可以放心刷流量，刷多少流量都行，只要网站能承受的住就行。许多新站长还认为通过刷流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('460', '几乎所有的新站都希望能快速获得流量，但许多新站长对于网站刷流量目的与作用又存在不少误解。作为新站长，往往最担心的是刷流量会遭到惩罚，尤其是遭到搜索引擎的惩罚。其实这是站长们不了解搜索引擎的工作原理，把搜索引擎神话了。搜索引擎的“爬虫”其实只对网站内容进行跟踪，对网站的流量是无法知晓的。所以这个担心是多余的，新站完全可以放心刷流量，刷多少流量都行，只要网站能承受的住就行。许多新站长还认为通过刷流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('461', '流量王是一款基于P2P原理的网站刷流量软件，用户使用流量宝时奉献一份流量才会获得更多流量。 目前在一台电脑上，是不能够同时开多个流量宝软件的。即使是同一个IP地址下的不同电脑，开了多个流量宝软件，加起 来也只能获得一份流量，因为在此情况下用户只奉献了一份IP流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('462', '几乎所有的新站都希望能快速获得流量，但许多新站长对于网站刷流量目的与作用又存在不少误解。作为新站长，往往最担心的是刷流量会遭到惩罚，尤其是遭到搜索引擎的惩罚。其实这是站长们不了解搜索引擎的工作原理，把搜索引擎神话了。搜索引擎的“爬虫”其实只对网站内容进行跟踪，对网站的流量是无法知晓的。所以这个担心是多余的，新站完全可以放心刷流量，刷多少流量都行，只要网站能承受的住就行。许多新站长还认为通过刷流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('463', '几乎所有的新站都希望能快速获得流量，但许多新站长对于网站刷流量目的与作用又存在不少误解。作为新站长，往往最担心的是刷流量会遭到惩罚，尤其是遭到搜索引擎的惩罚。其实这是站长们不了解搜索引擎的工作原理，把搜索引擎神话了。搜索引擎的“爬虫”其实只对网站内容进行跟踪，对网站的流量是无法知晓的。所以这个担心是多余的，新站完全可以放心刷流量，刷多少流量都行，只要网站能承受的住就行。许多新站长还认为通过刷流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('464', '几乎所有的新站都希望能快速获得流量，但许多新站长对于网站刷流量目的与作用又存在不少误解。作为新站长，往往最担心的是刷流量会遭到惩罚，尤其是遭到搜索引擎的惩罚。其实这是站长们不了解搜索引擎的工作原理，把搜索引擎神话了。搜索引擎的“爬虫”其实只对网站内容进行跟踪，对网站的流量是无法知晓的。所以这个担心是多余的，新站完全可以放心刷流量，刷多少流量都行，只要网站能承受的住就行。许多新站长还认为通过刷流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('467', '几乎所有的新站都希望能快速获得流量，但许多新站长对于网站刷流量目的与作用又存在不少误解。作为新站长，往往最担心的是刷流量会遭到惩罚，尤其是遭到搜索引擎的惩罚。其实这是站长们不了解搜索引擎的工作原理，把搜索引擎神话了。搜索引擎的“爬虫”其实只对网站内容进行跟踪，对网站的流量是无法知晓的。所以这个担心是多余的，新站完全可以放心刷流量，刷多少流量都行，只要网站能承受的住就行。许多新站长还认为通过刷流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('468', '几乎所有的新站都希望能快速获得流量，但许多新站长对于网站刷流量目的与作用又存在不少误解。作为新站长，往往最担心的是刷流量会遭到惩罚，尤其是遭到搜索引擎的惩罚。其实这是站长们不了解搜索引擎的工作原理，把搜索引擎神话了。搜索引擎的“爬虫”其实只对网站内容进行跟踪，对网站的流量是无法知晓的。所以这个担心是多余的，新站完全可以放心刷流量，刷多少流量都行，只要网站能承受的住就行。许多新站长还认为通过刷流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('469', '几乎所有的新站都希望能快速获得流量，但许多新站长对于网站刷流量目的与作用又存在不少误解。作为新站长，往往最担心的是刷流量会遭到惩罚，尤其是遭到搜索引擎的惩罚。其实这是站长们不了解搜索引擎的工作原理，把搜索引擎神话了。搜索引擎的“爬虫”其实只对网站内容进行跟踪，对网站的流量是无法知晓的。所以这个担心是多余的，新站完全可以放心刷流量，刷多少流量都行，只要网站能承受的住就行。许多新站长还认为通过刷流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('470', '几乎所有的新站都希望能快速获得流量，但许多新站长对于网站刷流量目的与作用又存在不少误解。作为新站长，往往最担心的是刷流量会遭到惩罚，尤其是遭到搜索引擎的惩罚。其实这是站长们不了解搜索引擎的工作原理，把搜索引擎神话了。搜索引擎的“爬虫”其实只对网站内容进行跟踪，对网站的流量是无法知晓的。所以这个担心是多余的，新站完全可以放心刷流量，刷多少流量都行，只要网站能承受的住就行。许多新站长还认为通过刷流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('471', '几乎所有的新站都希望能快速获得流量，但许多新站长对于网站刷流量目的与作用又存在不少误解。作为新站长，往往最担心的是刷流量会遭到惩罚，尤其是遭到搜索引擎的惩罚。其实这是站长们不了解搜索引擎的工作原理，把搜索引擎神话了。搜索引擎的“爬虫”其实只对网站内容进行跟踪，对网站的流量是无法知晓的。所以这个担心是多余的，新站完全可以放心刷流量，刷多少流量都行，只要网站能承受的住就行。许多新站长还认为通过刷流量。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('472', '想必暑期有不少朋友在家呆着建网站，刷流量。对于新手们来说，刷流量有几件最重要的事值得提醒下。1.不用等到网站建完了再刷流量。其实只要有了域名，就可以刷流量了，边刷流量边建站，这样等网站建设好后，能看到已经有一段时间的持续流量了，这样的效果更好。2.网站建设与内容更新是网站的根本，保证了这些，才能发挥刷流量的最大作用，不论你是想多带点人气，还是想多赚点生活费。3.做任何事都需要持续坚持，刷流量也是。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('473', '想必暑期有不少朋友在家呆着建网站，刷流量。对于新手们来说，刷流量有几件最重要的事值得提醒下。1.不用等到网站建完了再刷流量。其实只要有了域名，就可以刷流量了，边刷流量边建站，这样等网站建设好后，能看到已经有一段时间的持续流量了，这样的效果更好。2.网站建设与内容更新是网站的根本，保证了这些，才能发挥刷流量的最大作用，不论你是想多带点人气，还是想多赚点生活费。3.做任何事都需要持续坚持，刷流量也是。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('474', '想必暑期有不少朋友在家呆着建网站，刷流量。对于新手们来说，刷流量有几件最重要的事值得提醒下。1.不用等到网站建完了再刷流量。其实只要有了域名，就可以刷流量了，边刷流量边建站，这样等网站建设好后，能看到已经有一段时间的持续流量了，这样的效果更好。2.网站建设与内容更新是网站的根本，保证了这些，才能发挥刷流量的最大作用，不论你是想多带点人气，还是想多赚点生活费。3.做任何事都需要持续坚持，刷流量也是。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('475', '想必暑期有不少朋友在家呆着建网站，刷流量。对于新手们来说，刷流量有几件最重要的事值得提醒下。1.不用等到网站建完了再刷流量。其实只要有了域名，就可以刷流量了，边刷流量边建站，这样等网站建设好后，能看到已经有一段时间的持续流量了，这样的效果更好。2.网站建设与内容更新是网站的根本，保证了这些，才能发挥刷流量的最大作用，不论你是想多带点人气，还是想多赚点生活费。3.做任何事都需要持续坚持，刷流量也是。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('476', '想必暑期有不少朋友在家呆着建网站，刷流量。对于新手们来说，刷流量有几件最重要的事值得提醒下。1.不用等到网站建完了再刷流量。其实只要有了域名，就可以刷流量了，边刷流量边建站，这样等网站建设好后，能看到已经有一段时间的持续流量了，这样的效果更好。2.网站建设与内容更新是网站的根本，保证了这些，才能发挥刷流量的最大作用，不论你是想多带点人气，还是想多赚点生活费。3.做任何事都需要持续坚持，刷流量也是。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('477', '想必暑期有不少朋友在家呆着建网站，刷流量。对于新手们来说，刷流量有几件最重要的事值得提醒下。1.不用等到网站建完了再刷流量。其实只要有了域名，就可以刷流量了，边刷流量边建站，这样等网站建设好后，能看到已经有一段时间的持续流量了，这样的效果更好。2.网站建设与内容更新是网站的根本，保证了这些，才能发挥刷流量的最大作用，不论你是想多带点人气，还是想多赚点生活费。3.做任何事都需要持续坚持，刷流量也是。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('478', '想必暑期有不少朋友在家呆着建网站，刷流量。对于新手们来说，刷流量有几件最重要的事值得提醒下。1.不用等到网站建完了再刷流量。其实只要有了域名，就可以刷流量了，边刷流量边建站，这样等网站建设好后，能看到已经有一段时间的持续流量了，这样的效果更好。2.网站建设与内容更新是网站的根本，保证了这些，才能发挥刷流量的最大作用，不论你是想多带点人气，还是想多赚点生活费。3.做任何事都需要持续坚持，刷流量也是。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('479', '能够添加很多任务，一起异步执行，不影响效率', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('480', '暑期到了，学生朋友们有大把的闲暇时间，其中有不少想自己建个网站刷些流量的，流量宝绝对是刷流量的最好选择。首先流量宝是一款绿色的安全软件，在刷流量的时候通过沙盒隔离技术，让用户刷流量绝对安全放心。其次流量宝所刷的流量都是真实流量，可以用流量统计系统进行实时流量统计。流量宝由于采用的是P2P的刷流量原理，所以刷的流量不但真实，而且IP数量多地域分布广，更加符合真实情况。再次，流量宝功能强大。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('481', '想必暑期有不少朋友在家呆着建网站，刷流量。对于新手们来说，刷流量有几件最重要的事值得提醒下。1.不用等到网站建完了再刷流量。其实只要有了域名，就可以刷流量了，边刷流量边建站，这样等网站建设好后，能看到已经有一段时间的持续流量了，这样的效果更好。2.网站建设与内容更新是网站的根本，保证了这些，才能发挥刷流量的最大作用，不论你是想多带点人气，还是想多赚点生活费。3.做任何事都需要持续坚持，刷流量也是。', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('484', '87349823', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('485', '821611867', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('486', '厦门市思明区厦禾路884号禹州国际B栋3806', null, null, null);
INSERT INTO `jc_content_type` VALUES ('1', '普通', '100', '100', '0', '0');
INSERT INTO `jc_content_type` VALUES ('2', '图文', '143', '98', '1', '0');
INSERT INTO `jc_content_type` VALUES ('3', '焦点', '280', '200', '1', '0');
INSERT INTO `jc_content_type` VALUES ('4', '头条', '0', '0', '0', '0');
INSERT INTO `jc_content_type` VALUES ('5', '主页图片', '1000', '325', '1', '0');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/31105947eskx.png', 'png-0001.png', '0', null);
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/31105958u16n.png', 'png-0002.png', '0', null);
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/31110033qgr3.jpg', '示例图片_01.jpg', '0', '346');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/311140274df0.jpg', '示例图片_02.jpg', '0', '345');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/31114050k4gd.jpg', '示例图片_03.jpg', '0', '344');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/311141052bg9.jpg', '/liuliang/u/cms/www/201212/311141052bg9.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/31114115mysa.jpg', '示例图片_04.jpg', '0', '343');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/31143551sb0n.jpg', '示例图片_01.jpg', '0', '346');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/31143709jcgt.jpg', '示例图片_02.jpg', '0', '345');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/311437381czu.jpg', '示例图片_03.jpg', '0', '344');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/31143815x5al.jpg', '示例图片_04.jpg', '0', '343');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/3114423663vn.jpg', '示例图片_01.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/31145336kd9j.jpg', '示例图片_01.jpg', '0', '346');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/31150859y2gm.png', 'png-0002.png', '0', '346');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/3115093031vq.png', 'png-0047.png', '0', '345');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/31151005tmec.png', 'png-0004.png', '0', '344');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201212/31151051cwdp.png', 'png-0846.png', '0', '343');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201301/04090039y17l.png', 'png-0004.png', '0', '346');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201301/04093422na7k.png', 'png-0001.png', '0', '343');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201301/04093433bo6q.png', 'png-0002.png', '0', '344');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201301/040934441esf.png', 'png-0003.png', '0', '345');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201301/04093455q6kd.png', 'png-0004.png', '0', '346');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201301/05084705m20p.png', 'png-0001.png', '0', '343');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201301/05084719ulkw.png', 'png-0002.png', '0', '344');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201301/05084731s95x.png', 'png-0003.png', '0', '345');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201301/05084747ozxd.png', 'png-0004.png', '0', '346');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201307/301425489wqf.png', 'fanzz.png', '1', '448');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201307/30142637gwjf.png', 'jdjj.png', '1', '447');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201307/30142659xo0m.png', 'ddp.png', '1', '446');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201307/301427372zt5.png', 'beiff.png', '1', '445');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201307/301436513wl1.png', 'tubiao1.png', '1', '343');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201307/30143714ungx.png', 'tubiao2.png', '1', '344');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201307/3014372597fj.png', 'tubiao3.png', '1', '345');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201307/30143740sqgb.png', 'tubiao4.png', '1', '346');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201307/30143750qune.png', 'tubiao5.png', '1', '438');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201307/30143817a6zh.png', 'tubiao7.png', '1', '479');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201307/31110349enc6.jpg', 'img01.jpg', '1', '482');
INSERT INTO `jc_file` VALUES ('/liuliang/u/cms/www/201307/31110443ppb2.jpg', 'img02.jpg', '1', '483');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/171410455sqq.jpg', '', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17141056zbjl.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17141320s4xy.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17141341je98.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/171415447op5.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17141604lrhh.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17144805im1p.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17145028j3bj.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/171545290lr9.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17161125k5kt.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/171611397af9.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/171612286b6w.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17161242nbqp.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/171612535rhr.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17161324z8jn.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17165616uvy4.', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17165616uvy4.swf', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17171653nfp8.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/171717039zq7.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17171709jdjw.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/17171716ivqv.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/18155751wi1k.gif', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190837201odl.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19090143y6m0.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19090536qbxp.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19090946s78x.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190922058498.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19092939oy7r.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093226mevs.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093508z0je.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093530anjq.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093534pbhx.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093538klmo.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093544rdou.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190935502lvi.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093742dmvl.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190938494dpy.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093849begu.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093854n45u.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093857hrzl.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093900wjkf.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093911o5g2.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19093953zqpx.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19094122mc5z.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19094240v28v.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19094329a5xa.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19094332tbdx.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190943347cma.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19094339inmu.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190943477255.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19094508jfde.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190945185h1l.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190946273j5i.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19094631wo80.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190947003jp4.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190947311x4l.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19094831t9hq.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/1909485814nz.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190949019o6w.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19094903k37i.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19094907y45o.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190949132edb.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19094951qk1a.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190949521eei.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095026h3ca.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095103kcpr.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190952289wxr.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095231lcq8.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095231picz.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095234gz2e.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095237hsr4.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095244lvkp.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190953537bvn.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095401xwwr.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190954435nww.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095533hv75.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095559cx9e.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190956509gt3.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190956531lp5.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/190956567pd6.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095659npus.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095711di9x.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095752235i.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095824t0mi.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095858mdri.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19095940zkzo.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19100045xs61.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19100130dqrl.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191002428q2p.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19100427q41v.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19100730yqkm.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19100732rbr3.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19100735jhtm.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19100738xu07.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19100819q0nh.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19101104l8gx.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19101107fyhz.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19101110t0zj.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191011141hrz.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19101159t0ld.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19101258cu07.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19101300vgo6.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191013028ees.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19101306te5g.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19101310nlax.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19101405vhee.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191016542zol.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191016566066.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/1910170103if.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19101705pqim.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19101815my5b.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191018173g5w.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19101820duyo.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/1910182468l0.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191019506xu1.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19102057h28j.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/1910215201yl.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19102230f277.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19102233g7ot.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191022359mqb.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191022388uvv.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19102314gfph.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191026320f2y.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19102634814r.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19102637g8wu.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191026405ljl.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/1910271036lr.gif', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19102719hx2v.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/1910294695ky.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19102949nry1.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191029525wi9.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191029566nps.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19103035b3ll.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19103318bgac.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191033227v2n.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19103325i7eh.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19103329ra1y.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19103403xlfg.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191035531l49.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19103555yzl9.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19103559ef8r.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19103603lu7z.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191036587tik.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191047224mmx.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19110822fin2.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19111015xsud.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191116447msi.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19111647quq9.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191116504sdn.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19111654zbf8.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19111756gll3.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19111932a9xv.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19111935140r.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19111938y8xu.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19111941j2ox.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112136dax2.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112139m5p5.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112142aniu.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191121451voq.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112223q81f.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191124260dyw.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112428i5di.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112431i6yl.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191124347he2.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112511nfma.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112623820c.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112627baql.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112630rnkd.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112633k9hl.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/1911263840lw.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112700bypf.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191127127do2.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19112925s625.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113108a4tf.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113111l3z3.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113114xqvt.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113119mokz.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113155zjrt.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191133047hli.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113306vsom.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/1911330905lu.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191133124ekg.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113349wi0o.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113455w6da.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113458qtv5.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113500lodt.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113504ak3b.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113545y1n3.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/1911384005xa.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113842vbep.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191138453a05.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19113849s58m.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191139257lag.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19114043tp85.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19114055fyqx.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191140578xaj.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19114100zis1.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19114104hajf.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191141333snd.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19114201tdir.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191143031z9j.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19114305b0sj.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19114309f164.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19114312te0u.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19114320y7x2.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19114342fmb2.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19115459jnds.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19115513v9k3.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19115528h893.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19115540rghk.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191201449moh.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19120206ddre.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191203538tdp.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19131809acqm.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19131949r2ge.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19132320u46d.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191342393mlg.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19134448qvza.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19134542a8qu.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19134858biqw.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191351590e53.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19135339f6l6.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19135345g1s7.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19135642zjak.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19135645ge7r.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19135821ij0m.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19135949d13f.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19140010z9z1.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19140340fri2.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19140601kgid.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19140803w9fg.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191408344rwj.gif', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191408471iyj.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19141012lh2q.gif', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19141042cfu8.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19141139noa7.png', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19141200ip5c.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19141255yrfb.gif', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19141318apz1.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19141401rp2d.gif', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191415078pzs.gif', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19141700opui.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19141756u9sa.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191418286eoi.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19142041eu8x.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19142201umby.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19142206y73m.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19142430589t.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19142451945q.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191425405rka.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/1914272808rj.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19142818yvty.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19142840ycm6.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19143017qxs3.zip', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19151533k5ey.jpg', '', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19154302hxkg.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19154430myw1.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191545434coc.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19154549gc3w.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19154650hare.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19155032l0ql.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19155034wvyj.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19155038k2do.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191550415nco.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191553100g34.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19155314sxs8.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/19155317zg9k.jpg', '', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201112/191553207vdb.jpg', '', '1', null);
INSERT INTO `jc_friendlink` VALUES ('1', '1', '1', 'JEECMS官网', 'http://www.jeecms.com', null, 'jeecms@163.com', 'JEECMS是JavaEE版网站管理系统（Java Enterprise Edition Content Manage System）的简称。Java凭借其强大、稳定、安全、高效等多方面的优势，一直是企业级应用的首选。', '3', '1', '1');
INSERT INTO `jc_friendlink` VALUES ('2', '1', '1', 'JEEBBS论坛', 'http://bbs.jeecms.com', null, 'jeecms@163.com', 'JEEBBS论坛', '2', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('3', '1', '2', '京东商城', 'http://www.360buy.com/', '/u/cms/www/201112/1910271036lr.gif', '', '', '1', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('4', '1', '2', '当当网', 'http://www.dangdang.com/', '/u/cms/www/201112/191408344rwj.gif', '', '', '0', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('5', '1', '2', '亚马逊', 'http://www.amazon.cn/', '/u/cms/www/201112/19141012lh2q.gif', '', '', '0', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('6', '1', '2', 'ihush', 'http://www.ihush.com/', '/u/cms/www/201112/19141255yrfb.gif', '', '', '0', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('7', '1', '2', '名品打折', 'http://temai.dazhe.cn', '/u/cms/www/201112/19141401rp2d.gif', '', '', '0', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('8', '1', '2', '优品', 'http://temai.dazhe.cn', '/u/cms/www/201112/191415078pzs.gif', '', '', '1', '1', '10');
INSERT INTO `jc_friendlink_ctg` VALUES ('1', '1', '文字链接', '1');
INSERT INTO `jc_friendlink_ctg` VALUES ('2', '1', '品牌专区（图片链接）', '2');
INSERT INTO `jc_group` VALUES ('1', '普通会员', '10', '1', '1', '4096', '1024', 'jpg,jpeg,gif,png,bmp', '1');
INSERT INTO `jc_group` VALUES ('2', '高级组', '10', '1', '1', '0', '0', '', '0');
INSERT INTO `jc_guestbook` VALUES ('1', '1', '1', '1', null, '127.0.0.1', '2011-01-04 10:08:18', null, '1', '1');
INSERT INTO `jc_guestbook` VALUES ('2', '1', '1', '1', null, '192.168.0.1', '2011-01-04 14:45:45', null, '1', '1');
INSERT INTO `jc_guestbook` VALUES ('3', '1', '1', '1', null, '192.168.0.1', '2011-01-04 14:46:24', null, '1', '1');
INSERT INTO `jc_guestbook` VALUES ('4', '1', '1', '1', null, '192.168.0.1', '2011-01-04 14:52:41', null, '1', '1');
INSERT INTO `jc_guestbook` VALUES ('5', '1', '1', '1', null, '192.168.0.200', '2011-12-18 16:10:10', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('6', '1', '1', '1', null, '192.168.0.200', '2011-12-18 16:10:52', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('7', '1', '1', '1', null, '192.168.0.1', '2011-12-19 12:06:28', null, '1', '1');
INSERT INTO `jc_guestbook_ctg` VALUES ('1', '1', '普通', '1', '普通留言');
INSERT INTO `jc_guestbook_ext` VALUES ('1', '湖南未来一周仍维持低温雨雪天气', '湖南未来一周仍维持低温雨雪天气', null, null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('2', '范冰冰退出娱乐圈', '范冰冰退出娱乐圈', null, null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('3', 'JEECMS v3.0.2正式版发布', '终于发布了', null, null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('4', '多重压力将影响整体衣柜发展', '据悉，2010年下半年以来，衣柜企业整体销售形势不容乐观。不少企业下滑幅度高达60%，在一些主流卖场里，即使排名前十名的企业也未必能盈利。在这种情况下，企业纷纷打出了涨价牌，实属无奈之举。', '1111111111', null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('5', '1111111111111111111111111111111', '11111111111111111111111111111111111111111111111111111111111111111111111', null, null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('6', '11111111111111111111', '1111111111111111111111111111111', null, null, '1111111111', null);
INSERT INTO `jc_guestbook_ext` VALUES ('7', '足球宝贝徐冬冬', '足球宝贝徐冬冬海边写真 湿身展无限魅力足球宝贝徐冬冬海边写真 湿身展无限魅', null, '11@102.com', '1222331155', null);
INSERT INTO `jc_keyword` VALUES ('1', null, '内容管理系统', '<a href=\"http://www.jeecms.com/\" target=\"_blank\">内容管理系统</a>', '0');
INSERT INTO `jc_log` VALUES ('1', '1', null, '1', '2012-12-27 16:24:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('2', '1', '1', '3', '2012-12-27 16:25:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', null);
INSERT INTO `jc_log` VALUES ('3', '1', null, '1', '2012-12-27 17:04:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('4', '1', '1', '3', '2012-12-27 17:05:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_save.do', '增加模型', 'id=8;name=首页管理');
INSERT INTO `jc_log` VALUES ('5', '1', '1', '3', '2012-12-27 17:06:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_update.do', '修改模型', 'id=8;name=首页管理');
INSERT INTO `jc_log` VALUES ('6', '1', '1', '3', '2012-12-27 17:06:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_update.do', '修改模型', 'id=8;name=首页管理');
INSERT INTO `jc_log` VALUES ('7', '1', '1', '3', '2012-12-27 17:16:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=59;title=null');
INSERT INTO `jc_log` VALUES ('8', '1', '1', '3', '2012-12-27 17:16:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=59;name=首页管理');
INSERT INTO `jc_log` VALUES ('9', '1', '1', '3', '2012-12-27 17:17:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=60;title=null');
INSERT INTO `jc_log` VALUES ('10', '1', '1', '3', '2012-12-27 17:18:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=61;title=null');
INSERT INTO `jc_log` VALUES ('11', '1', '1', '3', '2012-12-27 17:19:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=62;title=null');
INSERT INTO `jc_log` VALUES ('12', '1', '1', '3', '2012-12-27 17:20:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=341;title=阿斯顿发');
INSERT INTO `jc_log` VALUES ('13', '1', '1', '3', '2012-12-27 17:26:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=342;title=斯蒂芬');
INSERT INTO `jc_log` VALUES ('14', '1', '1', '3', '2012-12-27 17:28:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=343;title=特点1');
INSERT INTO `jc_log` VALUES ('15', '1', '1', '3', '2012-12-27 17:29:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=344;title=特点2');
INSERT INTO `jc_log` VALUES ('16', '1', '1', '3', '2012-12-27 17:30:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=345;title=特点3');
INSERT INTO `jc_log` VALUES ('17', '1', '1', '3', '2012-12-27 17:30:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=346;title=特点4');
INSERT INTO `jc_log` VALUES ('18', '1', null, '1', '2012-12-28 08:41:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('19', '1', '1', '3', '2012-12-28 09:29:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=liuroot');
INSERT INTO `jc_log` VALUES ('20', '1', '1', '3', '2012-12-28 09:29:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot.html');
INSERT INTO `jc_log` VALUES ('21', '1', '1', '3', '2012-12-28 10:59:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=61;name=特点');
INSERT INTO `jc_log` VALUES ('22', '1', '1', '3', '2012-12-28 11:00:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=61;name=特点');
INSERT INTO `jc_log` VALUES ('23', '1', '1', '3', '2012-12-28 11:18:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页管理index.html');
INSERT INTO `jc_log` VALUES ('24', '1', '1', '3', '2012-12-28 11:26:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页管理index.html');
INSERT INTO `jc_log` VALUES ('25', '1', '1', '3', '2012-12-28 11:29:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页管理index.html');
INSERT INTO `jc_log` VALUES ('26', '1', '1', '3', '2012-12-28 11:30:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页管理index.html');
INSERT INTO `jc_log` VALUES ('27', '1', '1', '3', '2012-12-28 11:38:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页管理index.html');
INSERT INTO `jc_log` VALUES ('28', '1', '1', '3', '2012-12-28 11:39:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页管理index.html');
INSERT INTO `jc_log` VALUES ('29', '1', '1', '3', '2012-12-28 11:40:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页管理index.html');
INSERT INTO `jc_log` VALUES ('30', '1', '1', '3', '2012-12-28 11:46:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页管理index.html');
INSERT INTO `jc_log` VALUES ('31', '1', '1', '3', '2012-12-28 11:47:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=特点2');
INSERT INTO `jc_log` VALUES ('32', '1', '1', '3', '2012-12-28 11:58:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页管理index.html');
INSERT INTO `jc_log` VALUES ('33', '1', '1', '3', '2012-12-28 13:18:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('34', '1', '1', '3', '2012-12-28 13:35:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('35', '1', '1', '3', '2012-12-28 13:36:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_delete_single.do', '删除资源', 'filename=/r/cms/www/red/js/liujs');
INSERT INTO `jc_log` VALUES ('36', '1', '1', '3', '2012-12-28 13:37:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_delete_single.do', '删除资源', 'filename=/r/cms/www/red/img/liuimg');
INSERT INTO `jc_log` VALUES ('37', '1', '1', '3', '2012-12-28 13:37:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_delete_single.do', '删除资源', 'filename=/r/cms/www/red/css/liucss');
INSERT INTO `jc_log` VALUES ('38', '1', '1', '3', '2012-12-28 13:47:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('39', '1', '1', '3', '2012-12-28 13:50:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('40', '1', '1', '3', '2012-12-28 13:50:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('41', '1', '1', '3', '2012-12-28 14:39:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('42', '1', '1', '3', '2012-12-28 14:40:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('43', '1', '1', '3', '2012-12-28 15:12:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_save.do', '增加模型', 'id=9;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('44', '1', '1', '3', '2012-12-28 15:13:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_update.do', '修改模型', 'id=9;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('45', '1', '1', '3', '2012-12-28 15:29:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('46', '1', '1', '3', '2012-12-28 15:30:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=347;title=应用1');
INSERT INTO `jc_log` VALUES ('47', '1', '1', '3', '2012-12-28 15:30:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=348;title=应用2');
INSERT INTO `jc_log` VALUES ('48', '1', '1', '3', '2012-12-28 15:31:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=349;title=应用3');
INSERT INTO `jc_log` VALUES ('49', '1', '1', '3', '2012-12-28 15:32:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=350;title=应用4');
INSERT INTO `jc_log` VALUES ('50', '1', '1', '3', '2012-12-28 15:33:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('51', '1', '1', '3', '2012-12-28 15:37:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('52', '1', '1', '3', '2012-12-28 15:40:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=350;title=应用4');
INSERT INTO `jc_log` VALUES ('53', '1', '1', '3', '2012-12-28 15:40:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=347;title=应用1');
INSERT INTO `jc_log` VALUES ('54', '1', '1', '3', '2012-12-28 15:40:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=348;title=应用2');
INSERT INTO `jc_log` VALUES ('55', '1', '1', '3', '2012-12-28 15:40:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=349;title=应用3');
INSERT INTO `jc_log` VALUES ('56', '1', '1', '3', '2012-12-28 15:40:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=350;title=应用4');
INSERT INTO `jc_log` VALUES ('57', '1', '1', '3', '2012-12-28 15:43:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('58', '1', '1', '3', '2012-12-28 15:46:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('59', '1', '1', '3', '2012-12-28 15:50:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('60', '1', '1', '3', '2012-12-28 15:56:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('61', '1', '1', '3', '2012-12-28 16:01:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('62', '1', '1', '3', '2012-12-28 16:04:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页1.html');
INSERT INTO `jc_log` VALUES ('63', '1', '1', '3', '2012-12-28 16:07:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('64', '1', '1', '3', '2012-12-28 16:08:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=63;title=null');
INSERT INTO `jc_log` VALUES ('65', '1', '1', '3', '2012-12-28 16:11:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=63;name=流量宝介绍');
INSERT INTO `jc_log` VALUES ('66', '1', '1', '3', '2012-12-28 16:15:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('67', '1', '1', '3', '2012-12-28 16:25:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=64;title=计算机介绍');
INSERT INTO `jc_log` VALUES ('68', '1', '1', '3', '2012-12-28 16:27:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=65;title=null');
INSERT INTO `jc_log` VALUES ('69', '1', '1', '3', '2012-12-28 16:27:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=66;title=null');
INSERT INTO `jc_log` VALUES ('70', '1', '1', '3', '2012-12-28 16:28:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=67;title=null');
INSERT INTO `jc_log` VALUES ('71', '1', '1', '3', '2012-12-28 16:34:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('72', '1', '1', '3', '2012-12-28 16:38:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('73', '1', '1', '3', '2012-12-28 16:43:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('74', '1', '1', '3', '2012-12-28 16:47:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=351;title=2012-12-28 16:00发布的日志');
INSERT INTO `jc_log` VALUES ('75', '1', '1', '3', '2012-12-28 16:51:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=68;title=null');
INSERT INTO `jc_log` VALUES ('76', '1', '1', '3', '2012-12-28 16:53:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=69;title=null');
INSERT INTO `jc_log` VALUES ('77', '1', '1', '3', '2012-12-28 16:53:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=70;title=null');
INSERT INTO `jc_log` VALUES ('78', '1', '1', '3', '2012-12-28 16:56:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=352;title=克里斯蒂计费速度');
INSERT INTO `jc_log` VALUES ('79', '1', '1', '3', '2012-12-28 16:56:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=353;title=成v型出租车v字成v字下次');
INSERT INTO `jc_log` VALUES ('80', '1', '1', '3', '2012-12-28 16:56:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=354;title=法国和法国和地方官');
INSERT INTO `jc_log` VALUES ('81', '1', '1', '3', '2012-12-28 16:57:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=355;title=阿斯顿发的速度阿斯顿发爱上');
INSERT INTO `jc_log` VALUES ('82', '1', '1', '3', '2012-12-28 16:57:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=356;title=二十多分四大法师打');
INSERT INTO `jc_log` VALUES ('83', '1', '1', '3', '2012-12-28 16:57:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=357;title=巨款i和交换机开关和法国和');
INSERT INTO `jc_log` VALUES ('84', '1', '1', '3', '2012-12-28 16:58:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=358;title=阿斯顿发是否的撒的');
INSERT INTO `jc_log` VALUES ('85', '1', '1', '3', '2012-12-28 16:58:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=359;title=阿斯顿发大水的撒速度速度阿斯顿发敖德萨');
INSERT INTO `jc_log` VALUES ('86', '1', '1', '3', '2012-12-28 16:58:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=360;title=儿玩儿去玩儿去玩儿青蛙');
INSERT INTO `jc_log` VALUES ('87', '1', '1', '3', '2012-12-28 16:58:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=361;title=阿斯顿法师打法师打');
INSERT INTO `jc_log` VALUES ('88', '1', '1', '3', '2012-12-28 17:14:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('89', '1', '1', '3', '2012-12-28 17:17:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('90', '1', '1', '3', '2012-12-28 17:23:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('91', '1', '1', '3', '2012-12-28 17:25:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('92', '1', '1', '3', '2012-12-28 17:27:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('93', '1', '1', '3', '2012-12-28 17:31:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('94', '1', '1', '3', '2012-12-28 17:36:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('95', '1', '1', '3', '2012-12-28 17:38:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('96', '1', '1', '3', '2012-12-28 17:40:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('97', '1', '1', '3', '2012-12-28 17:45:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('98', '1', '1', '3', '2012-12-28 17:48:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('99', '1', '1', '3', '2012-12-28 17:50:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('100', '1', '1', '3', '2012-12-28 17:51:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('101', '1', '1', '3', '2012-12-28 17:52:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('102', '1', '1', '3', '2012-12-28 17:52:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('103', '1', '1', '3', '2012-12-28 17:53:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('104', '1', '1', '3', '2012-12-28 17:56:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('105', '1', '1', '3', '2012-12-28 17:58:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('106', '1', null, '1', '2012-12-29 08:34:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('107', '1', '1', '3', '2012-12-29 08:36:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=71;title=null');
INSERT INTO `jc_log` VALUES ('108', '1', '1', '3', '2012-12-29 08:43:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=68;title=null');
INSERT INTO `jc_log` VALUES ('109', '1', '1', '3', '2012-12-29 08:43:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=69;title=null');
INSERT INTO `jc_log` VALUES ('110', '1', '1', '3', '2012-12-29 08:47:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete_single.do', '删除资源', 'filename=/u/cms/www/201112');
INSERT INTO `jc_log` VALUES ('111', '1', '1', '3', '2012-12-29 08:47:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=70;title=null');
INSERT INTO `jc_log` VALUES ('112', '1', '1', '3', '2012-12-29 08:47:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=71;title=null');
INSERT INTO `jc_log` VALUES ('113', '1', '1', '3', '2012-12-29 08:49:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=65;name=日志');
INSERT INTO `jc_log` VALUES ('114', '1', '1', '3', '2012-12-29 08:49:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=65;name=日志');
INSERT INTO `jc_log` VALUES ('115', '1', '1', '3', '2012-12-29 09:00:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=65;title=null');
INSERT INTO `jc_log` VALUES ('116', '1', '1', '3', '2012-12-29 09:01:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=72;title=null');
INSERT INTO `jc_log` VALUES ('117', '1', '1', '3', '2012-12-29 09:02:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=73;title=null');
INSERT INTO `jc_log` VALUES ('118', '1', '1', '3', '2012-12-29 09:02:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=74;title=null');
INSERT INTO `jc_log` VALUES ('119', '1', '1', '3', '2012-12-29 09:03:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=75;title=null');
INSERT INTO `jc_log` VALUES ('120', '1', '1', '3', '2012-12-29 09:04:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=362;title=阿斯顿发斯蒂芬');
INSERT INTO `jc_log` VALUES ('121', '1', '1', '3', '2012-12-29 09:04:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=363;title=阿斯顿法师打发多法师打');
INSERT INTO `jc_log` VALUES ('122', '1', '1', '3', '2012-12-29 09:04:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=364;title=阿斯顿发烧打发斯蒂芬');
INSERT INTO `jc_log` VALUES ('123', '1', '1', '3', '2012-12-29 09:05:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=365;title=在v刹v字形成v字下次');
INSERT INTO `jc_log` VALUES ('124', '1', '1', '3', '2012-12-29 09:05:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=366;title=规范和法国和地方搞活动');
INSERT INTO `jc_log` VALUES ('125', '1', '1', '3', '2012-12-29 09:05:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=367;title=分大概多少分公司地方官斯蒂芬');
INSERT INTO `jc_log` VALUES ('126', '1', '1', '3', '2012-12-29 09:05:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=368;title=大范甘迪发概多少发鬼地方');
INSERT INTO `jc_log` VALUES ('127', '1', '1', '3', '2012-12-29 09:05:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=369;title=打算发斯蒂芬反复反复反复反复');
INSERT INTO `jc_log` VALUES ('128', '1', '1', '3', '2012-12-29 09:05:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=370;title=天天要投入与体育同一');
INSERT INTO `jc_log` VALUES ('129', '1', '1', '3', '2012-12-29 09:06:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=371;title=弄明白密码不那么股份的华国锋蝴蝶飞过');
INSERT INTO `jc_log` VALUES ('130', '1', '1', '3', '2012-12-29 09:06:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=372;title=打发斯蒂芬该死的分公司');
INSERT INTO `jc_log` VALUES ('131', '1', '1', '3', '2012-12-29 09:09:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('132', '1', '1', '3', '2012-12-29 09:09:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('133', '1', '1', '3', '2012-12-29 09:13:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('134', '1', '1', '3', '2012-12-29 09:16:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('135', '1', '1', '3', '2012-12-29 09:16:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('136', '1', '1', '3', '2012-12-29 09:23:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('137', '1', '1', '3', '2012-12-29 09:26:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('138', '1', '1', '3', '2012-12-29 09:26:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('139', '1', '1', '3', '2012-12-29 09:26:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('140', '1', '1', '3', '2012-12-29 09:27:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('141', '1', '1', '3', '2012-12-29 09:27:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('142', '1', '1', '3', '2012-12-29 09:28:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('143', '1', '1', '3', '2012-12-29 09:28:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('144', '1', '1', '3', '2012-12-29 09:33:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('145', '1', '1', '3', '2012-12-29 09:34:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('146', '1', '1', '3', '2012-12-29 09:36:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('147', '1', '1', '3', '2012-12-29 09:38:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('148', '1', '1', '3', '2012-12-29 09:42:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('149', '1', '1', '3', '2012-12-29 09:50:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=content_page');
INSERT INTO `jc_log` VALUES ('150', '1', '1', '3', '2012-12-29 09:52:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('151', '1', '1', '3', '2012-12-29 09:53:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('152', '1', '1', '3', '2012-12-29 09:53:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('153', '1', '1', '3', '2012-12-29 09:55:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('154', '1', '1', '3', '2012-12-29 09:55:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('155', '1', '1', '3', '2012-12-29 09:59:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('156', '1', '1', '3', '2012-12-29 10:00:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('157', '1', '1', '3', '2012-12-29 10:01:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('158', '1', '1', '3', '2012-12-29 10:02:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('159', '1', '1', '3', '2012-12-29 10:03:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('160', '1', '1', '3', '2012-12-29 10:03:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('161', '1', '1', '3', '2012-12-29 10:03:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('162', '1', '1', '3', '2012-12-29 10:06:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('163', '1', '1', '3', '2012-12-29 10:06:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('164', '1', '1', '3', '2012-12-29 10:12:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('165', '1', '1', '3', '2012-12-29 10:25:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=373;title=是多发点地方噶多师傅给');
INSERT INTO `jc_log` VALUES ('166', '1', '1', '3', '2012-12-29 10:25:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=374;title=热体魄俄日突破味儿');
INSERT INTO `jc_log` VALUES ('167', '1', '1', '3', '2012-12-29 10:25:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=375;title=多舒服过iosu盾佛国i水淀粉勾i速度 ');
INSERT INTO `jc_log` VALUES ('168', '1', '1', '3', '2012-12-29 10:26:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=376;title=地方撒旦法斯蒂芬阿斯顿发撒旦');
INSERT INTO `jc_log` VALUES ('169', '1', '1', '3', '2012-12-29 10:26:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=377;title=的萨芬地方撒旦法斯蒂芬集合');
INSERT INTO `jc_log` VALUES ('170', '1', '1', '3', '2012-12-29 10:27:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=378;title=啊阿斯顿法师打法师打的定身法的事发地');
INSERT INTO `jc_log` VALUES ('171', '1', '1', '3', '2012-12-29 10:27:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=379;title=啊的司法斯蒂芬定身法定身法阿斯顿');
INSERT INTO `jc_log` VALUES ('172', '1', '1', '3', '2012-12-29 10:27:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=380;title=阿斯顿发烧发大声地阿斯顿');
INSERT INTO `jc_log` VALUES ('173', '1', '1', '3', '2012-12-29 10:27:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=381;title=啊的司法斯蒂芬阿斯顿发阿斯顿发斯蒂芬');
INSERT INTO `jc_log` VALUES ('174', '1', '1', '3', '2012-12-29 10:27:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=382;title=阿斯顿法师打发阿克苏地方化快捷');
INSERT INTO `jc_log` VALUES ('175', '1', '1', '3', '2012-12-29 10:28:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=383;title=阿斯顿发打发奥斯卡打飞机');
INSERT INTO `jc_log` VALUES ('176', '1', '1', '3', '2012-12-29 10:28:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=384;title=奥斯卡地方卢卡斯江东父老');
INSERT INTO `jc_log` VALUES ('177', '1', '1', '3', '2012-12-29 10:28:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=385;title=定身法空间按首付款地激发了');
INSERT INTO `jc_log` VALUES ('178', '1', '1', '3', '2012-12-29 10:28:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=386;title=萨克地方化快捷定身法奥斯卡的房间卡');
INSERT INTO `jc_log` VALUES ('179', '1', '1', '3', '2012-12-29 10:28:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=387;title=大姐夫拉客的房间里奥东科积分卡拉多少');
INSERT INTO `jc_log` VALUES ('180', '1', '1', '3', '2012-12-29 10:28:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=388;title=阿克苏地方进口量将奥迪副科级啦');
INSERT INTO `jc_log` VALUES ('181', '1', '1', '3', '2012-12-29 10:29:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=389;title=科技大两地分居快递费进口量');
INSERT INTO `jc_log` VALUES ('182', '1', '1', '3', '2012-12-29 10:29:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=390;title=大师傅可骄傲的思考放假的数据付款了');
INSERT INTO `jc_log` VALUES ('183', '1', '1', '3', '2012-12-29 10:29:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=391;title=阿斯顿复活节阿斯顿发卡金士顿');
INSERT INTO `jc_log` VALUES ('184', '1', '1', '3', '2012-12-29 10:29:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=392;title=阿迪是肌肤立刻将按时付款奥斯卡的及付款了');
INSERT INTO `jc_log` VALUES ('185', '1', '1', '3', '2012-12-29 10:33:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('186', '1', '1', '3', '2012-12-29 10:33:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('187', '1', '1', '3', '2012-12-29 10:34:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('188', '1', '1', '3', '2012-12-29 10:34:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('189', '1', '1', '3', '2012-12-29 10:35:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('190', '1', '1', '3', '2012-12-29 10:37:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('191', '1', '1', '3', '2012-12-29 10:38:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('192', '1', '1', '3', '2012-12-29 10:48:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=393;title=应用5');
INSERT INTO `jc_log` VALUES ('193', '1', '1', '3', '2012-12-29 10:48:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=394;title=应用6');
INSERT INTO `jc_log` VALUES ('194', '1', '1', '3', '2012-12-29 10:48:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('195', '1', '1', '3', '2012-12-29 10:49:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=394;title=应用6');
INSERT INTO `jc_log` VALUES ('196', '1', '1', '3', '2012-12-29 10:49:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=393;title=应用5');
INSERT INTO `jc_log` VALUES ('197', '1', '1', '3', '2012-12-29 10:53:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页管理index.html');
INSERT INTO `jc_log` VALUES ('198', '1', '1', '3', '2012-12-29 10:53:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页1.html');
INSERT INTO `jc_log` VALUES ('199', '1', '1', '3', '2012-12-29 11:08:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=77;title=null');
INSERT INTO `jc_log` VALUES ('200', '1', '1', '3', '2012-12-29 11:09:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=77;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('201', '1', '1', '3', '2012-12-29 11:11:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=10;name=关于我们');
INSERT INTO `jc_log` VALUES ('202', '1', '1', '3', '2012-12-29 11:31:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=77;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('203', '1', '1', '3', '2012-12-29 11:40:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=77;title=null');
INSERT INTO `jc_log` VALUES ('204', '1', '1', '3', '2012-12-29 11:40:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_delete.do', '删除模型', 'id=9;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('205', '1', '1', '3', '2012-12-29 11:41:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_save.do', '增加模型', 'id=9;name=其他页管理');
INSERT INTO `jc_log` VALUES ('206', '1', '1', '3', '2012-12-29 11:41:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_update.do', '修改模型', 'id=9;name=其他页管理');
INSERT INTO `jc_log` VALUES ('207', '1', '1', '3', '2012-12-29 11:42:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=78;title=null');
INSERT INTO `jc_log` VALUES ('208', '1', '1', '3', '2012-12-29 11:43:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=79;title=null');
INSERT INTO `jc_log` VALUES ('209', '1', '1', '3', '2012-12-29 11:44:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=80;title=null');
INSERT INTO `jc_log` VALUES ('210', '1', '1', '3', '2012-12-29 11:44:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=81;title=null');
INSERT INTO `jc_log` VALUES ('211', '1', '1', '3', '2012-12-29 11:45:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=82;title=null');
INSERT INTO `jc_log` VALUES ('212', '1', '1', '3', '2012-12-29 11:45:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=83;title=null');
INSERT INTO `jc_log` VALUES ('213', '1', '1', '3', '2012-12-29 11:46:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=84;title=null');
INSERT INTO `jc_log` VALUES ('214', '1', '1', '3', '2012-12-29 11:46:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=85;title=null');
INSERT INTO `jc_log` VALUES ('215', '1', '1', '3', '2012-12-29 11:57:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('216', '1', '1', '3', '2012-12-29 11:58:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('217', '1', '1', '3', '2012-12-29 11:59:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('218', '1', '1', '3', '2012-12-29 11:59:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('219', '1', '1', '3', '2012-12-29 12:00:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('220', '1', '1', '3', '2012-12-29 12:00:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('221', '1', '1', '3', '2012-12-29 12:00:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('222', '1', '1', '3', '2012-12-29 12:00:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('223', '1', '1', '3', '2012-12-29 12:28:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=79;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('224', '1', '1', '3', '2012-12-29 12:36:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=下载栏目');
INSERT INTO `jc_log` VALUES ('225', '1', '1', '3', '2012-12-29 12:44:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=页头顶栏');
INSERT INTO `jc_log` VALUES ('226', '1', '1', '3', '2012-12-29 12:45:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/下载栏目.html');
INSERT INTO `jc_log` VALUES ('227', '1', '1', '3', '2012-12-29 12:46:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/页头顶栏.html');
INSERT INTO `jc_log` VALUES ('228', '1', '1', '3', '2012-12-29 12:51:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/下载栏目.html');
INSERT INTO `jc_log` VALUES ('229', '1', '1', '3', '2012-12-29 12:51:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/下载栏目_二级.html');
INSERT INTO `jc_log` VALUES ('230', '1', '1', '3', '2012-12-29 12:52:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/header_register.html');
INSERT INTO `jc_log` VALUES ('231', '1', '1', '3', '2012-12-29 12:52:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/投票栏.html');
INSERT INTO `jc_log` VALUES ('232', '1', '1', '3', '2012-12-29 12:52:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/页头导航栏.html');
INSERT INTO `jc_log` VALUES ('233', '1', '1', '3', '2012-12-29 12:52:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/页头搜索栏.html');
INSERT INTO `jc_log` VALUES ('234', '1', '1', '3', '2012-12-29 12:52:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/页头顶栏.html');
INSERT INTO `jc_log` VALUES ('235', '1', '1', '3', '2012-12-29 12:52:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/页脚信息栏.html');
INSERT INTO `jc_log` VALUES ('236', '1', '1', '3', '2012-12-29 12:52:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/页脚友情链接栏.html');
INSERT INTO `jc_log` VALUES ('237', '1', null, '1', '2012-12-29 13:15:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('238', '1', '1', '3', '2012-12-29 14:04:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=79;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('239', '1', '1', '3', '2012-12-29 14:06:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=79;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('240', '1', '1', '3', '2012-12-29 14:09:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=下载栏目');
INSERT INTO `jc_log` VALUES ('241', '1', '1', '3', '2012-12-29 14:18:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/下载栏目.html');
INSERT INTO `jc_log` VALUES ('242', '1', '1', '3', '2012-12-29 14:19:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('243', '1', '1', '3', '2012-12-29 14:21:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('244', '1', '1', '3', '2012-12-29 14:35:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_save.do', '增加模型', 'id=10;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('245', '1', '1', '3', '2012-12-29 14:36:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=86;title=null');
INSERT INTO `jc_log` VALUES ('246', '1', '1', '3', '2012-12-29 14:37:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=流量软件下载');
INSERT INTO `jc_log` VALUES ('247', '1', '1', '3', '2012-12-29 14:38:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/流量软件下载.html');
INSERT INTO `jc_log` VALUES ('248', '1', '1', '3', '2012-12-29 14:39:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('249', '1', '1', '3', '2012-12-29 14:43:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('250', '1', '1', '3', '2012-12-29 15:01:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('251', '1', '1', '3', '2012-12-29 15:02:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('252', '1', '1', '3', '2012-12-29 15:02:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('253', '1', '1', '3', '2012-12-29 15:02:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('254', '1', '1', '3', '2012-12-29 15:02:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('255', '1', '1', '3', '2012-12-29 15:04:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=85;title=null');
INSERT INTO `jc_log` VALUES ('256', '1', '1', '3', '2012-12-29 15:05:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=87;title=null');
INSERT INTO `jc_log` VALUES ('257', '1', '1', '3', '2012-12-29 15:05:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=88;title=null');
INSERT INTO `jc_log` VALUES ('258', '1', '1', '3', '2012-12-29 15:19:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=79;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('259', '1', '1', '3', '2012-12-29 15:24:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('260', '1', '1', '3', '2012-12-29 15:24:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('261', '1', '1', '3', '2012-12-29 15:25:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('262', '1', '1', '3', '2012-12-29 15:25:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('263', '1', '1', '3', '2012-12-29 15:26:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('264', '1', '1', '3', '2012-12-29 15:28:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('265', '1', '1', '3', '2012-12-29 15:30:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('266', '1', '1', '3', '2012-12-29 15:31:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('267', '1', '1', '3', '2012-12-29 15:31:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('268', '1', '1', '3', '2012-12-29 15:38:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('269', '1', '1', '3', '2012-12-29 15:39:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=86;title=null');
INSERT INTO `jc_log` VALUES ('270', '1', '1', '3', '2012-12-29 15:49:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('271', '1', '1', '3', '2012-12-29 15:50:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('272', '1', '1', '3', '2012-12-29 15:50:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('273', '1', '1', '3', '2012-12-29 15:58:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=80;name=免费提升流量');
INSERT INTO `jc_log` VALUES ('274', '1', '1', '3', '2012-12-29 16:00:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('275', '1', '1', '3', '2012-12-29 16:00:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('276', '1', '1', '3', '2012-12-29 16:00:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('277', '1', '1', '3', '2012-12-29 16:02:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('278', '1', '1', '3', '2012-12-29 16:02:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('279', '1', '1', '3', '2012-12-29 16:13:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('280', '1', '1', '3', '2012-12-29 16:14:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('281', '1', '1', '3', '2012-12-29 16:14:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('282', '1', '1', '3', '2012-12-29 16:15:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('283', '1', '1', '3', '2012-12-29 16:15:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('284', '1', '1', '3', '2012-12-29 16:15:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('285', '1', '1', '3', '2012-12-29 16:18:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('286', '1', '1', '3', '2012-12-29 16:19:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('287', '1', '1', '3', '2012-12-29 16:25:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('288', '1', '1', '3', '2012-12-29 16:25:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('289', '1', '1', '3', '2012-12-29 16:39:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('290', '1', '1', '3', '2012-12-29 16:40:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('291', '1', '1', '3', '2012-12-29 16:43:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('292', '1', '1', '3', '2012-12-29 16:43:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('293', '1', '1', '3', '2012-12-29 16:43:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('294', '1', '1', '3', '2012-12-29 16:45:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('295', '1', '1', '3', '2012-12-29 16:45:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('296', '1', '1', '3', '2012-12-29 16:45:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('297', '1', '1', '3', '2012-12-29 16:46:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('298', '1', '1', '3', '2012-12-29 16:46:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('299', '1', '1', '3', '2012-12-29 16:47:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('300', '1', '1', '3', '2012-12-29 16:48:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('301', '1', '1', '3', '2012-12-29 16:50:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('302', '1', '1', '3', '2012-12-29 16:52:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('303', '1', '1', '3', '2012-12-29 16:53:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('304', '1', '1', '3', '2012-12-29 16:53:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('305', '1', '1', '3', '2012-12-29 16:54:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('306', '1', '1', '3', '2012-12-29 16:55:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('307', '1', '1', '3', '2012-12-29 16:56:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('308', '1', '1', '3', '2012-12-29 16:58:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('309', '1', '1', '3', '2012-12-29 16:58:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('310', '1', '1', '3', '2012-12-29 17:00:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('311', '1', '1', '3', '2012-12-29 17:04:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('312', '1', '1', '3', '2012-12-29 17:04:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('313', '1', '1', '3', '2012-12-29 17:06:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('314', '1', '1', '3', '2012-12-29 17:07:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('315', '1', '1', '3', '2012-12-29 17:07:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('316', '1', '1', '3', '2012-12-29 17:36:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=395;title=的康师傅加多少疯狂拉升的发卡');
INSERT INTO `jc_log` VALUES ('317', '1', '1', '3', '2012-12-29 17:41:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=396;title=口袋里附近奥蒂斯计费');
INSERT INTO `jc_log` VALUES ('318', '1', '1', '3', '2012-12-29 17:43:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=397;title=按时发货跨世纪的付款了');
INSERT INTO `jc_log` VALUES ('319', '1', '1', '3', '2012-12-29 17:47:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('320', '1', '1', '3', '2012-12-29 17:48:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('321', '1', '1', '3', '2012-12-29 17:49:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('322', '1', '1', '3', '2012-12-29 17:51:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('323', '1', '1', '3', '2012-12-29 17:52:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('324', '1', '1', '3', '2012-12-29 17:55:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('325', '1', '1', '3', '2012-12-29 17:55:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('326', '1', '1', '3', '2012-12-29 17:55:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('327', '1', '1', '3', '2012-12-29 17:56:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('328', '1', '1', '3', '2012-12-29 17:58:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('329', '1', '1', '3', '2012-12-29 17:58:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('330', '1', '1', '3', '2012-12-29 17:59:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('331', '1', '1', '3', '2012-12-29 17:59:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('332', '1', '1', '3', '2012-12-29 18:01:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=397;title=按时发货跨世纪的付款了');
INSERT INTO `jc_log` VALUES ('333', '1', '1', '3', '2012-12-29 18:02:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=396;title=口袋里附近奥蒂斯计费');
INSERT INTO `jc_log` VALUES ('334', '1', '1', '3', '2012-12-29 18:02:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=395;title=的康师傅加多少疯狂拉升的发卡');
INSERT INTO `jc_log` VALUES ('335', '1', '1', '3', '2012-12-29 18:03:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('336', '1', '1', '3', '2012-12-29 18:04:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('337', '1', '1', '3', '2012-12-29 18:05:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('338', '1', '1', '3', '2012-12-29 18:05:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('339', '1', '1', '3', '2012-12-29 18:05:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=81;name=网站流量优化');
INSERT INTO `jc_log` VALUES ('340', '1', '1', '3', '2012-12-29 18:06:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=81;name=网站流量优化');
INSERT INTO `jc_log` VALUES ('341', '1', null, '1', '2012-12-31 08:35:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('342', '1', '1', '3', '2012-12-31 08:41:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('343', '1', '1', '3', '2012-12-31 08:41:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('344', '1', '1', '3', '2012-12-31 08:46:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('345', '1', '1', '3', '2012-12-31 08:47:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('346', '1', '1', '3', '2012-12-31 08:49:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_Alexa排名优化');
INSERT INTO `jc_log` VALUES ('347', '1', '1', '3', '2012-12-31 08:50:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_QQ空间刷人气');
INSERT INTO `jc_log` VALUES ('348', '1', '1', '3', '2012-12-31 08:50:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_使用帮助');
INSERT INTO `jc_log` VALUES ('349', '1', '1', '3', '2012-12-31 08:50:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_常见问题');
INSERT INTO `jc_log` VALUES ('350', '1', '1', '3', '2012-12-31 08:51:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_会员中心');
INSERT INTO `jc_log` VALUES ('351', '1', '1', '3', '2012-12-31 09:00:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('352', '1', '1', '3', '2012-12-31 09:00:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('353', '1', '1', '3', '2012-12-31 09:01:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=83;name=QQ空间刷人气');
INSERT INTO `jc_log` VALUES ('354', '1', '1', '3', '2012-12-31 09:01:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=82;name=Alexa排名优化');
INSERT INTO `jc_log` VALUES ('355', '1', '1', '3', '2012-12-31 09:01:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=83;name=QQ空间刷人气');
INSERT INTO `jc_log` VALUES ('356', '1', '1', '3', '2012-12-31 09:02:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=84;name=使用帮助');
INSERT INTO `jc_log` VALUES ('357', '1', '1', '3', '2012-12-31 09:02:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=87;name=常见问题');
INSERT INTO `jc_log` VALUES ('358', '1', '1', '3', '2012-12-31 09:03:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=88;name=会员中心');
INSERT INTO `jc_log` VALUES ('359', '1', '1', '3', '2012-12-31 09:04:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=87;title=null');
INSERT INTO `jc_log` VALUES ('360', '1', '1', '3', '2012-12-31 09:04:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=89;title=null');
INSERT INTO `jc_log` VALUES ('361', '1', '1', '3', '2012-12-31 09:06:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('362', '1', '1', '3', '2012-12-31 09:06:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('363', '1', '1', '3', '2012-12-31 09:07:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('364', '1', '1', '3', '2012-12-31 09:12:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('365', '1', '1', '3', '2012-12-31 09:13:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('366', '1', '1', '3', '2012-12-31 09:13:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('367', '1', '1', '3', '2012-12-31 09:15:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=82;name=Alexa排名优化');
INSERT INTO `jc_log` VALUES ('368', '1', '1', '3', '2012-12-31 09:17:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=398;title=啊发撒地方地方阿斯顿');
INSERT INTO `jc_log` VALUES ('369', '1', '1', '3', '2012-12-31 09:17:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=399;title=是多福多寿地方时');
INSERT INTO `jc_log` VALUES ('370', '1', '1', '3', '2012-12-31 09:18:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=400;title=阿打发斯蒂芬');
INSERT INTO `jc_log` VALUES ('371', '1', '1', '3', '2012-12-31 09:19:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=88;name=常见问题');
INSERT INTO `jc_log` VALUES ('372', '1', '1', '3', '2012-12-31 09:20:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=89;name=会员中心');
INSERT INTO `jc_log` VALUES ('373', '1', '1', '3', '2012-12-31 09:25:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('374', '1', '1', '3', '2012-12-31 09:26:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('375', '1', '1', '3', '2012-12-31 09:29:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('376', '1', '1', '3', '2012-12-31 09:30:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('377', '1', '1', '3', '2012-12-31 09:33:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/流量软件栏目.html');
INSERT INTO `jc_log` VALUES ('378', '1', '1', '3', '2012-12-31 09:40:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('379', '1', '1', '3', '2012-12-31 09:40:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('380', '1', '1', '3', '2012-12-31 09:44:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('381', '1', '1', '3', '2012-12-31 09:45:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('382', '1', '1', '3', '2012-12-31 10:03:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('383', '1', '1', '3', '2012-12-31 10:05:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('384', '1', '1', '3', '2012-12-31 10:08:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('385', '1', '1', '3', '2012-12-31 10:21:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=合作伙伴');
INSERT INTO `jc_log` VALUES ('386', '1', '1', '3', '2012-12-31 10:21:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=友情链接');
INSERT INTO `jc_log` VALUES ('387', '1', '1', '3', '2012-12-31 10:25:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/合作伙伴.html');
INSERT INTO `jc_log` VALUES ('388', '1', '1', '3', '2012-12-31 10:25:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/友情链接.html');
INSERT INTO `jc_log` VALUES ('389', '1', '1', '3', '2012-12-31 10:26:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/合作伙伴.html');
INSERT INTO `jc_log` VALUES ('390', '1', '1', '3', '2012-12-31 10:26:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/合作伙伴.html');
INSERT INTO `jc_log` VALUES ('391', '1', '1', '3', '2012-12-31 10:28:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('392', '1', '1', '3', '2012-12-31 10:29:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('393', '1', '1', '3', '2012-12-31 10:29:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('394', '1', '1', '3', '2012-12-31 10:30:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('395', '1', '1', '3', '2012-12-31 10:56:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('396', '1', '1', '3', '2012-12-31 10:57:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('397', '1', '1', '3', '2012-12-31 10:57:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('398', '1', '1', '3', '2012-12-31 10:57:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('399', '1', '1', '3', '2012-12-31 10:57:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('400', '1', '1', '3', '2012-12-31 10:57:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('401', '1', '1', '3', '2012-12-31 10:57:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('402', '1', '1', '3', '2012-12-31 11:04:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=特点4');
INSERT INTO `jc_log` VALUES ('403', '1', '1', '3', '2012-12-31 11:09:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=79;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('404', '1', '1', '3', '2012-12-31 11:25:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('405', '1', '1', '3', '2012-12-31 11:25:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('406', '1', '1', '3', '2012-12-31 11:25:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('407', '1', '1', '3', '2012-12-31 11:25:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('408', '1', '1', '3', '2012-12-31 11:26:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('409', '1', '1', '3', '2012-12-31 11:27:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('410', '1', '1', '3', '2012-12-31 11:27:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('411', '1', '1', '3', '2012-12-31 11:28:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=79;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('412', '1', '1', '3', '2012-12-31 11:30:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('413', '1', '1', '3', '2012-12-31 11:30:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('414', '1', '1', '3', '2012-12-31 11:30:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('415', '1', '1', '3', '2012-12-31 11:30:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('416', '1', '1', '3', '2012-12-31 11:30:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('417', '1', '1', '3', '2012-12-31 11:31:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('418', '1', '1', '3', '2012-12-31 11:32:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('419', '1', '1', '3', '2012-12-31 11:32:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('420', '1', '1', '3', '2012-12-31 11:33:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('421', '1', '1', '3', '2012-12-31 11:33:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('422', '1', '1', '3', '2012-12-31 11:33:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('423', '1', '1', '3', '2012-12-31 11:33:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('424', '1', '1', '3', '2012-12-31 11:36:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('425', '1', '1', '3', '2012-12-31 11:37:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('426', '1', '1', '3', '2012-12-31 11:37:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('427', '1', '1', '3', '2012-12-31 11:38:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('428', '1', '1', '3', '2012-12-31 11:40:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=特点3');
INSERT INTO `jc_log` VALUES ('429', '1', '1', '3', '2012-12-31 11:40:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=特点2');
INSERT INTO `jc_log` VALUES ('430', '1', '1', '3', '2012-12-31 11:41:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=特点1');
INSERT INTO `jc_log` VALUES ('431', '1', '1', '3', '2012-12-31 11:54:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('432', '1', '1', '3', '2012-12-31 11:55:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('433', '1', '1', '3', '2012-12-31 12:00:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('434', '1', '1', '3', '2012-12-31 14:17:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_delete.do', '删除模型', 'id=10;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('435', '1', '1', '3', '2012-12-31 14:32:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=61;name=特点');
INSERT INTO `jc_log` VALUES ('436', '1', '1', '3', '2012-12-31 14:34:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=61;name=特点');
INSERT INTO `jc_log` VALUES ('437', '1', '1', '3', '2012-12-31 14:35:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=61;name=特点');
INSERT INTO `jc_log` VALUES ('438', '1', '1', '3', '2012-12-31 14:36:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=特点4');
INSERT INTO `jc_log` VALUES ('439', '1', '1', '3', '2012-12-31 14:37:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=特点3');
INSERT INTO `jc_log` VALUES ('440', '1', '1', '3', '2012-12-31 14:37:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=特点2');
INSERT INTO `jc_log` VALUES ('441', '1', '1', '3', '2012-12-31 14:38:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=特点1');
INSERT INTO `jc_log` VALUES ('442', '1', '1', '3', '2012-12-31 14:40:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('443', '1', '1', '3', '2012-12-31 14:44:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('444', '1', '1', '3', '2012-12-31 14:46:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('445', '1', '1', '3', '2012-12-31 14:46:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('446', '1', '1', '3', '2012-12-31 14:51:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('447', '1', '1', '3', '2012-12-31 14:53:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=特点4');
INSERT INTO `jc_log` VALUES ('448', '1', '1', '3', '2012-12-31 15:09:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=特点4');
INSERT INTO `jc_log` VALUES ('449', '1', '1', '3', '2012-12-31 15:09:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=特点3');
INSERT INTO `jc_log` VALUES ('450', '1', '1', '3', '2012-12-31 15:10:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=特点2');
INSERT INTO `jc_log` VALUES ('451', '1', '1', '3', '2012-12-31 15:10:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=特点1');
INSERT INTO `jc_log` VALUES ('452', '1', '1', '3', '2012-12-31 15:17:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('453', '1', '1', '3', '2012-12-31 15:30:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('454', '1', '1', '3', '2012-12-31 15:31:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('455', '1', '1', '3', '2012-12-31 15:44:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=401;title=首页的图片');
INSERT INTO `jc_log` VALUES ('456', '1', '1', '3', '2012-12-31 16:01:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('457', '1', '1', '3', '2012-12-31 16:01:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('458', '1', '1', '3', '2012-12-31 16:01:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('459', '1', '1', '3', '2012-12-31 16:02:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('460', '1', '1', '3', '2012-12-31 16:02:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('461', '1', '1', '3', '2012-12-31 16:02:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('462', '1', '1', '3', '2012-12-31 16:03:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('463', '1', '1', '3', '2012-12-31 16:03:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('464', '1', '1', '3', '2012-12-31 16:09:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=401;title=首页的图片');
INSERT INTO `jc_log` VALUES ('465', '1', '1', '3', '2012-12-31 16:09:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('466', '1', '1', '3', '2012-12-31 16:10:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=401;title=首页的图片');
INSERT INTO `jc_log` VALUES ('467', '1', '1', '3', '2012-12-31 16:13:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('468', '1', '1', '3', '2012-12-31 16:14:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/type/o_save.do', '增加内容类型', 'id=5;name=主页图片');
INSERT INTO `jc_log` VALUES ('469', '1', '1', '3', '2012-12-31 16:15:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/type/o_update.do', '修改内容类型', 'id=5;name=主页图片');
INSERT INTO `jc_log` VALUES ('470', '1', '1', '3', '2012-12-31 16:16:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/type/o_update.do', '修改内容类型', 'id=5;name=主页图片');
INSERT INTO `jc_log` VALUES ('471', '1', '1', '3', '2012-12-31 16:17:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=401;title=首页的图片1');
INSERT INTO `jc_log` VALUES ('472', '1', '1', '3', '2012-12-31 16:18:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=402;title=首页图片2');
INSERT INTO `jc_log` VALUES ('473', '1', '1', '3', '2012-12-31 16:19:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=403;title=首页图片3');
INSERT INTO `jc_log` VALUES ('474', '1', '1', '3', '2012-12-31 16:20:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('475', '1', '1', '3', '2012-12-31 16:20:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('476', '1', '1', '3', '2012-12-31 16:21:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('477', '1', '1', '3', '2012-12-31 16:22:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('478', '1', '1', '3', '2012-12-31 16:22:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('479', '1', '1', '3', '2012-12-31 16:25:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('480', '1', '1', '3', '2012-12-31 16:25:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('481', '1', '1', '3', '2012-12-31 16:26:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('482', '1', '1', '3', '2012-12-31 16:28:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('483', '1', '1', '3', '2012-12-31 16:36:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('484', '1', '1', '3', '2012-12-31 16:37:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('485', '1', '1', '3', '2012-12-31 16:37:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('486', '1', '1', '3', '2012-12-31 16:56:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页内容');
INSERT INTO `jc_log` VALUES ('487', '1', '1', '3', '2012-12-31 16:57:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容.html');
INSERT INTO `jc_log` VALUES ('488', '1', '1', '3', '2012-12-31 16:58:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容.html');
INSERT INTO `jc_log` VALUES ('489', '1', '1', '3', '2012-12-31 17:08:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容.html');
INSERT INTO `jc_log` VALUES ('490', '1', '1', '3', '2012-12-31 17:09:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页内容_Alexa排名优化');
INSERT INTO `jc_log` VALUES ('491', '1', '1', '3', '2012-12-31 17:09:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页内容_2');
INSERT INTO `jc_log` VALUES ('492', '1', '1', '3', '2012-12-31 17:09:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页内容_3');
INSERT INTO `jc_log` VALUES ('493', '1', '1', '3', '2012-12-31 17:13:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('494', '1', '1', '3', '2012-12-31 17:14:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('495', '1', '1', '3', '2012-12-31 17:14:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('496', '1', '1', '3', '2012-12-31 17:15:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('497', '1', '1', '3', '2012-12-31 17:16:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('498', '1', '1', '3', '2012-12-31 17:16:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('499', '1', '1', '3', '2012-12-31 17:17:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('500', '1', '1', '3', '2012-12-31 17:17:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('501', '1', '1', '3', '2012-12-31 17:20:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('502', '1', '1', '3', '2012-12-31 17:20:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('503', '1', '1', '3', '2012-12-31 17:21:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('504', '1', '1', '3', '2012-12-31 17:23:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('505', '1', '1', '3', '2012-12-31 17:24:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=undefined');
INSERT INTO `jc_log` VALUES ('506', '1', '1', '3', '2012-12-31 17:24:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=undefined');
INSERT INTO `jc_log` VALUES ('507', '1', '1', '3', '2012-12-31 17:24:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('508', '1', '1', '3', '2012-12-31 17:24:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/合作伙伴.html��作伙伴.html');
INSERT INTO `jc_log` VALUES ('509', '1', '1', '3', '2012-12-31 17:25:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('510', '1', '1', '3', '2012-12-31 17:25:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('511', '1', '1', '3', '2012-12-31 17:25:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('512', '1', '1', '3', '2012-12-31 17:25:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('513', '1', '1', '3', '2012-12-31 17:25:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('514', '1', '1', '3', '2012-12-31 17:25:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('515', '1', '1', '3', '2012-12-31 17:27:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=81;name=网站流量优化');
INSERT INTO `jc_log` VALUES ('516', '1', '1', '3', '2012-12-31 17:27:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=82;name=Alexa排名优化');
INSERT INTO `jc_log` VALUES ('517', '1', '1', '3', '2012-12-31 17:27:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=83;name=QQ空间刷人气');
INSERT INTO `jc_log` VALUES ('518', '1', '1', '3', '2012-12-31 17:30:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('519', '1', '1', '3', '2012-12-31 17:30:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('520', '1', '1', '3', '2012-12-31 17:30:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('521', '1', '1', '3', '2012-12-31 17:35:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=399;title=是多福多寿地方时');
INSERT INTO `jc_log` VALUES ('522', '1', '1', '3', '2012-12-31 17:36:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=400;title=阿打发斯蒂芬');
INSERT INTO `jc_log` VALUES ('523', '1', '1', '3', '2012-12-31 17:38:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/合作伙伴.html��作伙伴.html');
INSERT INTO `jc_log` VALUES ('524', '1', null, '1', '2013-01-04 08:31:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('525', '1', '1', '3', '2013-01-04 08:48:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('526', '1', '1', '3', '2013-01-04 08:50:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('527', '1', '1', '3', '2013-01-04 08:53:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=特点4');
INSERT INTO `jc_log` VALUES ('528', '1', '1', '3', '2013-01-04 08:53:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=特点3');
INSERT INTO `jc_log` VALUES ('529', '1', '1', '3', '2013-01-04 08:53:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=特点2');
INSERT INTO `jc_log` VALUES ('530', '1', '1', '3', '2013-01-04 08:53:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=特点1');
INSERT INTO `jc_log` VALUES ('531', '1', '1', '3', '2013-01-04 08:54:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('532', '1', '1', '3', '2013-01-04 08:57:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('533', '1', '1', '3', '2013-01-04 08:57:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('534', '1', '1', '3', '2013-01-04 09:00:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=特点1');
INSERT INTO `jc_log` VALUES ('535', '1', '1', '3', '2013-01-04 09:00:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=特点2');
INSERT INTO `jc_log` VALUES ('536', '1', '1', '3', '2013-01-04 09:00:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=特点3');
INSERT INTO `jc_log` VALUES ('537', '1', '1', '3', '2013-01-04 09:00:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=特点4');
INSERT INTO `jc_log` VALUES ('538', '1', '1', '3', '2013-01-04 09:01:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('539', '1', '1', '3', '2013-01-04 09:01:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('540', '1', '1', '3', '2013-01-04 09:03:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('541', '1', '1', '3', '2013-01-04 09:08:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('542', '1', '1', '3', '2013-01-04 09:08:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('543', '1', '1', '3', '2013-01-04 09:10:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('544', '1', '1', '3', '2013-01-04 09:10:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('545', '1', '1', '3', '2013-01-04 09:10:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('546', '1', '1', '3', '2013-01-04 09:11:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('547', '1', '1', '3', '2013-01-04 09:11:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('548', '1', '1', '3', '2013-01-04 09:12:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=401;title=首页的图片1');
INSERT INTO `jc_log` VALUES ('549', '1', '1', '3', '2013-01-04 09:13:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=402;title=首页图片2');
INSERT INTO `jc_log` VALUES ('550', '1', '1', '3', '2013-01-04 09:13:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=403;title=首页图片3');
INSERT INTO `jc_log` VALUES ('551', '1', '1', '3', '2013-01-04 09:14:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('552', '1', '1', '3', '2013-01-04 09:18:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=页脚友情链接栏');
INSERT INTO `jc_log` VALUES ('553', '1', '1', '3', '2013-01-04 09:19:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=页脚合作伙伴');
INSERT INTO `jc_log` VALUES ('554', '1', '1', '3', '2013-01-04 09:20:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('555', '1', '1', '3', '2013-01-04 09:24:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('556', '1', '1', '3', '2013-01-04 09:24:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('557', '1', '1', '3', '2013-01-04 09:32:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('558', '1', '1', '3', '2013-01-04 09:32:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=401;title=首页的图片1');
INSERT INTO `jc_log` VALUES ('559', '1', '1', '3', '2013-01-04 09:33:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=402;title=首页图片2');
INSERT INTO `jc_log` VALUES ('560', '1', '1', '3', '2013-01-04 09:33:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=403;title=首页图片3');
INSERT INTO `jc_log` VALUES ('561', '1', '1', '3', '2013-01-04 09:34:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=特点1');
INSERT INTO `jc_log` VALUES ('562', '1', '1', '3', '2013-01-04 09:34:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=特点2');
INSERT INTO `jc_log` VALUES ('563', '1', '1', '3', '2013-01-04 09:34:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=特点3');
INSERT INTO `jc_log` VALUES ('564', '1', '1', '3', '2013-01-04 09:35:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=特点4');
INSERT INTO `jc_log` VALUES ('565', '1', '1', '3', '2013-01-04 09:36:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=页脚友情链接栏');
INSERT INTO `jc_log` VALUES ('566', '1', '1', '3', '2013-01-04 09:36:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('567', '1', '1', '3', '2013-01-04 09:36:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/页脚友情链接栏.html');
INSERT INTO `jc_log` VALUES ('568', '1', '1', '3', '2013-01-04 09:38:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('569', '1', '1', '3', '2013-01-04 09:39:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=页脚合作伙伴');
INSERT INTO `jc_log` VALUES ('570', '1', '1', '3', '2013-01-04 09:40:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('571', '1', '1', '3', '2013-01-04 09:43:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('572', '1', '1', '3', '2013-01-04 09:48:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/流量软件栏目.html');
INSERT INTO `jc_log` VALUES ('573', '1', '1', '3', '2013-01-04 09:49:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_其他软件下载');
INSERT INTO `jc_log` VALUES ('574', '1', '1', '3', '2013-01-04 09:52:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_QQ空间');
INSERT INTO `jc_log` VALUES ('575', '1', '1', '3', '2013-01-04 09:52:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_使用帮助');
INSERT INTO `jc_log` VALUES ('576', '1', '1', '3', '2013-01-04 09:53:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_会员中心');
INSERT INTO `jc_log` VALUES ('577', '1', '1', '3', '2013-01-04 09:54:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_常见问题');
INSERT INTO `jc_log` VALUES ('578', '1', '1', '3', '2013-01-04 09:55:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('579', '1', '1', '3', '2013-01-04 09:56:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('580', '1', '1', '3', '2013-01-04 09:56:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('581', '1', '1', '3', '2013-01-04 09:58:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('582', '1', '1', '3', '2013-01-04 09:58:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间.html');
INSERT INTO `jc_log` VALUES ('583', '1', '1', '3', '2013-01-04 09:59:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('584', '1', '1', '3', '2013-01-04 09:59:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('585', '1', '1', '3', '2013-01-04 10:00:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('586', '1', '1', '3', '2013-01-04 10:00:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间.html');
INSERT INTO `jc_log` VALUES ('587', '1', '1', '3', '2013-01-04 10:02:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('588', '1', '1', '3', '2013-01-04 10:02:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('589', '1', '1', '3', '2013-01-04 10:03:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('590', '1', '1', '3', '2013-01-04 10:03:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('591', '1', '1', '3', '2013-01-04 10:03:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('592', '1', '1', '3', '2013-01-04 10:04:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('593', '1', '1', '3', '2013-01-04 10:04:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('594', '1', '1', '3', '2013-01-04 10:05:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('595', '1', '1', '3', '2013-01-04 10:06:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('596', '1', '1', '3', '2013-01-04 10:06:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('597', '1', '1', '3', '2013-01-04 10:07:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('598', '1', '1', '3', '2013-01-04 10:07:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('599', '1', '1', '3', '2013-01-04 10:07:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('600', '1', '1', '3', '2013-01-04 10:08:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间.html');
INSERT INTO `jc_log` VALUES ('601', '1', '1', '3', '2013-01-04 10:08:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间.html');
INSERT INTO `jc_log` VALUES ('602', '1', '1', '3', '2013-01-04 10:08:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间.html');
INSERT INTO `jc_log` VALUES ('603', '1', '1', '3', '2013-01-04 10:14:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('604', '1', '1', '3', '2013-01-04 10:14:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('605', '1', '1', '3', '2013-01-04 10:14:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('606', '1', '1', '3', '2013-01-04 10:16:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('607', '1', '1', '3', '2013-01-04 10:16:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('608', '1', '1', '3', '2013-01-04 10:23:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('609', '1', '1', '3', '2013-01-04 10:24:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('610', '1', '1', '3', '2013-01-04 10:24:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('611', '1', '1', '3', '2013-01-04 10:25:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('612', '1', '1', '3', '2013-01-04 10:25:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('613', '1', '1', '3', '2013-01-04 10:28:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('614', '1', '1', '3', '2013-01-04 10:29:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('615', '1', '1', '3', '2013-01-04 10:29:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('616', '1', '1', '3', '2013-01-04 10:30:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('617', '1', '1', '3', '2013-01-04 10:30:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('618', '1', '1', '3', '2013-01-04 10:31:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('619', '1', '1', '3', '2013-01-04 10:33:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('620', '1', '1', '3', '2013-01-04 10:34:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('621', '1', '1', '3', '2013-01-04 10:34:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('622', '1', '1', '3', '2013-01-04 10:36:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('623', '1', '1', '3', '2013-01-04 10:36:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('624', '1', '1', '3', '2013-01-04 10:38:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('625', '1', '1', '3', '2013-01-04 10:40:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('626', '1', '1', '3', '2013-01-04 10:41:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('627', '1', '1', '3', '2013-01-04 10:42:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('628', '1', '1', '3', '2013-01-04 10:43:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('629', '1', '1', '3', '2013-01-04 10:51:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('630', '1', '1', '3', '2013-01-04 10:52:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('631', '1', '1', '3', '2013-01-04 10:54:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('632', '1', '1', '3', '2013-01-04 10:54:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('633', '1', '1', '3', '2013-01-04 10:54:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('634', '1', '1', '3', '2013-01-04 10:55:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('635', '1', '1', '3', '2013-01-04 10:55:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('636', '1', '1', '3', '2013-01-04 10:56:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('637', '1', '1', '3', '2013-01-04 11:01:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('638', '1', '1', '3', '2013-01-04 11:01:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('639', '1', '1', '3', '2013-01-04 11:02:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('640', '1', '1', '3', '2013-01-04 11:03:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('641', '1', '1', '3', '2013-01-04 11:03:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('642', '1', '1', '3', '2013-01-04 11:04:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('643', '1', '1', '3', '2013-01-04 11:04:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('644', '1', '1', '3', '2013-01-04 11:05:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('645', '1', '1', '3', '2013-01-04 11:06:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('646', '1', '1', '3', '2013-01-04 11:06:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('647', '1', '1', '3', '2013-01-04 11:06:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('648', '1', '1', '3', '2013-01-04 11:07:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('649', '1', '1', '3', '2013-01-04 11:07:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('650', '1', '1', '3', '2013-01-04 11:07:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('651', '1', '1', '3', '2013-01-04 11:08:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('652', '1', '1', '3', '2013-01-04 11:26:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('653', '1', '1', '3', '2013-01-04 11:33:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('654', '1', '1', '3', '2013-01-04 11:34:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_update.do', '修改模型', 'id=8;name=首页管理');
INSERT INTO `jc_log` VALUES ('655', '1', '1', '3', '2013-01-04 11:36:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=首页内容管理_日志');
INSERT INTO `jc_log` VALUES ('656', '1', '1', '3', '2013-01-04 11:39:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=首页内容管理_日志');
INSERT INTO `jc_log` VALUES ('657', '1', '1', '3', '2013-01-04 11:40:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=首页内容管理');
INSERT INTO `jc_log` VALUES ('658', '1', '1', '3', '2013-01-04 11:41:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页内容管理_日志.html');
INSERT INTO `jc_log` VALUES ('659', '1', '1', '3', '2013-01-04 11:44:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('660', '1', '1', '3', '2013-01-04 11:44:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('661', '1', '1', '3', '2013-01-04 11:49:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('662', '1', '1', '3', '2013-01-04 11:57:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=72;name=日志');
INSERT INTO `jc_log` VALUES ('663', '1', null, '1', '2013-01-04 12:01:40', '192.168.0.103', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('664', '1', '1', '3', '2013-01-04 14:08:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=首页内容管理_日志');
INSERT INTO `jc_log` VALUES ('665', '1', '1', '3', '2013-01-04 14:08:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页内容管理_日志.html');
INSERT INTO `jc_log` VALUES ('666', '1', '1', '3', '2013-01-04 14:11:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=72;name=日志');
INSERT INTO `jc_log` VALUES ('667', '1', '1', '3', '2013-01-04 14:13:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=72;name=日志');
INSERT INTO `jc_log` VALUES ('668', '1', '1', '3', '2013-01-04 14:14:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_日志.html');
INSERT INTO `jc_log` VALUES ('669', '1', '1', '3', '2013-01-04 14:25:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=404;title=是打发斯蒂芬十多个法师');
INSERT INTO `jc_log` VALUES ('670', '1', '1', '3', '2013-01-04 14:26:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=405;title=为二二五二气味儿而且为轻微额外武器二');
INSERT INTO `jc_log` VALUES ('671', '1', '1', '3', '2013-01-04 14:26:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=406;title=阿斯顿法师打法师打的萨芬阿斯顿');
INSERT INTO `jc_log` VALUES ('672', '1', '1', '3', '2013-01-04 14:26:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=407;title=阿斯顿发斯蒂芬斯蒂芬撒地方撒旦爱上');
INSERT INTO `jc_log` VALUES ('673', '1', '1', '3', '2013-01-04 14:26:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=408;title=阿斯顿发阿斯顿阿斯顿发艾丝凡');
INSERT INTO `jc_log` VALUES ('674', '1', '1', '3', '2013-01-04 14:27:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=409;title=诶锐欧无二多思考几分爱的色放');
INSERT INTO `jc_log` VALUES ('675', '1', '1', '3', '2013-01-04 14:27:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=410;title=艾丝凡多少九分裤的设计费里卡多使肌肤速度快附');
INSERT INTO `jc_log` VALUES ('676', '1', '1', '3', '2013-01-04 14:27:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=411;title=阿斯顿飞基拉肯德基斯蒂芬金拉克');
INSERT INTO `jc_log` VALUES ('677', '1', '1', '3', '2013-01-04 14:28:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=412;title=多思考几分卡机斯蒂芬阿迪肌肤立刻');
INSERT INTO `jc_log` VALUES ('678', '1', '1', '3', '2013-01-04 14:28:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=413;title=程序地激发了跨世纪的发掘的');
INSERT INTO `jc_log` VALUES ('679', '1', '1', '3', '2013-01-04 14:29:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=414;title=啊的司法斯蒂芬的萨芬斯蒂芬');
INSERT INTO `jc_log` VALUES ('680', '1', '1', '3', '2013-01-04 14:29:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=415;title=科技大厦开房间爱卡独守空房即可垃圾');
INSERT INTO `jc_log` VALUES ('681', '1', '1', '3', '2013-01-04 14:30:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=416;title=士大夫和撒旦咖啡机的设计费');
INSERT INTO `jc_log` VALUES ('682', '1', '1', '3', '2013-01-04 14:30:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=417;title=阿迪附近拉看电视剧的设计费离开');
INSERT INTO `jc_log` VALUES ('683', '1', '1', '3', '2013-01-04 14:30:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=418;title=u恶意如但是否可骄傲斯柯达速度快附近阿里');
INSERT INTO `jc_log` VALUES ('684', '1', '1', '3', '2013-01-04 14:31:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=419;title=那肯定是非进口量京东方离开');
INSERT INTO `jc_log` VALUES ('685', '1', '1', '3', '2013-01-04 14:32:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=420;title=速度快发货快撒旦教奥斯卡的积分卡拉斯的');
INSERT INTO `jc_log` VALUES ('686', '1', '1', '3', '2013-01-04 14:32:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=421;title=打飞机哈斯肯德基速度快房间卡仕达');
INSERT INTO `jc_log` VALUES ('687', '1', '1', '3', '2013-01-04 14:32:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=422;title=下次考虑精神可嘉地方会计师发动机根据');
INSERT INTO `jc_log` VALUES ('688', '1', '1', '3', '2013-01-04 14:36:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('689', '1', '1', '3', '2013-01-04 14:37:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('690', '1', '1', '3', '2013-01-04 14:38:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('691', '1', '1', '3', '2013-01-04 14:39:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('692', '1', '1', '3', '2013-01-04 14:40:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('693', '1', '1', '3', '2013-01-04 14:46:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=67;title=null');
INSERT INTO `jc_log` VALUES ('694', '1', '1', '3', '2013-01-04 14:46:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=66;title=null');
INSERT INTO `jc_log` VALUES ('695', '1', '1', '3', '2013-01-04 14:46:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=88;name=常见问题');
INSERT INTO `jc_log` VALUES ('696', '1', '1', '3', '2013-01-04 14:46:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=89;name=会员中心');
INSERT INTO `jc_log` VALUES ('697', '1', '1', '3', '2013-01-04 14:49:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('698', '1', '1', '3', '2013-01-04 14:50:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=81;name=网站流量优化');
INSERT INTO `jc_log` VALUES ('699', '1', '1', '3', '2013-01-04 14:53:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('700', '1', '1', '3', '2013-01-04 14:53:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('701', '1', '1', '3', '2013-01-04 14:56:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('702', '1', '1', '3', '2013-01-04 15:01:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页内容管理_日志.html');
INSERT INTO `jc_log` VALUES ('703', '1', '1', '3', '2013-01-04 15:01:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/首页内容管理_问题.html');
INSERT INTO `jc_log` VALUES ('704', '1', '1', '3', '2013-01-04 15:02:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页内容_Alexa排名优化');
INSERT INTO `jc_log` VALUES ('705', '1', '1', '3', '2013-01-04 15:02:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页内容_QQ空间刷人气');
INSERT INTO `jc_log` VALUES ('706', '1', '1', '3', '2013-01-04 15:03:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页内容_网站流量优化');
INSERT INTO `jc_log` VALUES ('707', '1', '1', '3', '2013-01-04 15:03:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('708', '1', '1', '3', '2013-01-04 15:04:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('709', '1', '1', '3', '2013-01-04 15:04:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('710', '1', '1', '3', '2013-01-04 15:05:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('711', '1', '1', '3', '2013-01-04 15:05:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('712', '1', '1', '3', '2013-01-04 15:05:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('713', '1', '1', '3', '2013-01-04 15:06:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('714', '1', '1', '3', '2013-01-04 15:07:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=81;name=网站流量优化');
INSERT INTO `jc_log` VALUES ('715', '1', '1', '3', '2013-01-04 15:07:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=83;name=QQ空间刷人气');
INSERT INTO `jc_log` VALUES ('716', '1', '1', '3', '2013-01-04 15:07:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=82;name=Alexa排名优化');
INSERT INTO `jc_log` VALUES ('717', '1', '1', '3', '2013-01-04 15:11:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=81;name=网站流量优化');
INSERT INTO `jc_log` VALUES ('718', '1', '1', '3', '2013-01-04 15:18:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('719', '1', '1', '3', '2013-01-04 15:18:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('720', '1', '1', '3', '2013-01-04 15:19:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('721', '1', '1', '3', '2013-01-04 15:19:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('722', '1', '1', '3', '2013-01-04 15:29:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=423;title=斯蒂芬金克里斯');
INSERT INTO `jc_log` VALUES ('723', '1', '1', '3', '2013-01-04 15:31:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=424;title=的撒副科级多少了放假斯蒂芬金阿斯顿发');
INSERT INTO `jc_log` VALUES ('724', '1', '1', '3', '2013-01-04 15:31:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=425;title=少打飞机阿迪神经分裂卡仕达思考副经理');
INSERT INTO `jc_log` VALUES ('725', '1', '1', '3', '2013-01-04 15:33:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=426;title=控件的返回阿斯蒂芬金');
INSERT INTO `jc_log` VALUES ('726', '1', '1', '3', '2013-01-04 15:33:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=427;title=绿卡时间段付款了斯蒂芬金拉丝');
INSERT INTO `jc_log` VALUES ('727', '1', '1', '3', '2013-01-04 15:34:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=428;title=少打飞机肯定是四度空间卡仕达');
INSERT INTO `jc_log` VALUES ('728', '1', '1', '3', '2013-01-04 15:35:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=429;title=里斯蒂芬金拉克圣诞节阿迪司法局拉动是的撒放假');
INSERT INTO `jc_log` VALUES ('729', '1', '1', '3', '2013-01-04 15:41:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=430;title=撒旦法师的');
INSERT INTO `jc_log` VALUES ('730', '1', '1', '3', '2013-01-04 15:42:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=431;title=撒旦法师的定身法阿斯顿斯蒂芬');
INSERT INTO `jc_log` VALUES ('731', '1', '1', '3', '2013-01-04 15:43:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=432;title=的金发晶阿斯顿计费');
INSERT INTO `jc_log` VALUES ('732', '1', '1', '3', '2013-01-04 15:44:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=433;title=的是法师打定身法');
INSERT INTO `jc_log` VALUES ('733', '1', '1', '3', '2013-01-04 15:44:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=434;title=富家大室四度空间弗兰克速度快放假');
INSERT INTO `jc_log` VALUES ('734', '1', '1', '3', '2013-01-04 15:49:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=61;name=特点');
INSERT INTO `jc_log` VALUES ('735', '1', '1', '3', '2013-01-04 16:26:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete_single.do', '删除资源', 'filename=/u/cms/www/201301');
INSERT INTO `jc_log` VALUES ('736', '1', '1', '3', '2013-01-04 16:34:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', null);
INSERT INTO `jc_log` VALUES ('737', '1', '1', '3', '2013-01-04 16:41:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=42;title=null');
INSERT INTO `jc_log` VALUES ('738', '1', '1', '3', '2013-01-04 16:41:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=46;title=null');
INSERT INTO `jc_log` VALUES ('739', '1', '1', '3', '2013-01-04 16:41:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=47;title=null');
INSERT INTO `jc_log` VALUES ('740', '1', '1', '3', '2013-01-04 16:41:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=48;title=null');
INSERT INTO `jc_log` VALUES ('741', '1', '1', '3', '2013-01-04 16:41:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=10;title=关于我们');
INSERT INTO `jc_log` VALUES ('742', '1', '1', '3', '2013-01-04 16:42:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/topic/o_delete.do', '删除专题', 'id=3;name=低碳经济');
INSERT INTO `jc_log` VALUES ('743', '1', '1', '3', '2013-01-04 16:42:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/topic/o_delete.do', '删除专题', 'id=2;name=上海世博会专题');
INSERT INTO `jc_log` VALUES ('744', '1', '1', '3', '2013-01-04 16:42:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/topic/o_delete.do', '删除专题', 'id=1;name=2010年南非世界杯');
INSERT INTO `jc_log` VALUES ('745', '1', '1', '3', '2013-01-04 16:43:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=1;title=新闻资讯');
INSERT INTO `jc_log` VALUES ('746', '1', '1', '3', '2013-01-04 16:51:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=38;title=网络游戏');
INSERT INTO `jc_log` VALUES ('747', '1', '1', '3', '2013-01-04 16:51:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=39;title=媒体工具');
INSERT INTO `jc_log` VALUES ('748', '1', '1', '3', '2013-01-04 16:51:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=57;title=null');
INSERT INTO `jc_log` VALUES ('749', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=23;name=null');
INSERT INTO `jc_log` VALUES ('750', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=22;name=null');
INSERT INTO `jc_log` VALUES ('751', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=21;name=null');
INSERT INTO `jc_log` VALUES ('752', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=20;name=null');
INSERT INTO `jc_log` VALUES ('753', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=19;name=null');
INSERT INTO `jc_log` VALUES ('754', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=18;name=null');
INSERT INTO `jc_log` VALUES ('755', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=17;name=null');
INSERT INTO `jc_log` VALUES ('756', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=16;name=null');
INSERT INTO `jc_log` VALUES ('757', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=15;name=null');
INSERT INTO `jc_log` VALUES ('758', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=14;name=null');
INSERT INTO `jc_log` VALUES ('759', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=13;name=null');
INSERT INTO `jc_log` VALUES ('760', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=12;name=null');
INSERT INTO `jc_log` VALUES ('761', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=11;name=null');
INSERT INTO `jc_log` VALUES ('762', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=10;name=null');
INSERT INTO `jc_log` VALUES ('763', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=9;name=null');
INSERT INTO `jc_log` VALUES ('764', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=8;name=null');
INSERT INTO `jc_log` VALUES ('765', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=7;name=null');
INSERT INTO `jc_log` VALUES ('766', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=6;name=null');
INSERT INTO `jc_log` VALUES ('767', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=5;name=null');
INSERT INTO `jc_log` VALUES ('768', '1', '1', '3', '2013-01-04 16:52:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=4;name=null');
INSERT INTO `jc_log` VALUES ('769', '1', '1', '3', '2013-01-04 16:52:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=3;name=null');
INSERT INTO `jc_log` VALUES ('770', '1', '1', '3', '2013-01-04 16:52:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=2;name=null');
INSERT INTO `jc_log` VALUES ('771', '1', '1', '3', '2013-01-04 16:52:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=1;name=null');
INSERT INTO `jc_log` VALUES ('772', '1', '1', '3', '2013-01-04 16:53:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=35;name=null');
INSERT INTO `jc_log` VALUES ('773', '1', '1', '3', '2013-01-04 16:53:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=34;name=null');
INSERT INTO `jc_log` VALUES ('774', '1', '1', '3', '2013-01-04 16:53:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=33;name=null');
INSERT INTO `jc_log` VALUES ('775', '1', '1', '3', '2013-01-04 16:53:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=32;name=null');
INSERT INTO `jc_log` VALUES ('776', '1', '1', '3', '2013-01-04 16:53:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=31;name=null');
INSERT INTO `jc_log` VALUES ('777', '1', '1', '3', '2013-01-04 16:53:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=30;name=null');
INSERT INTO `jc_log` VALUES ('778', '1', '1', '3', '2013-01-04 16:53:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=29;name=null');
INSERT INTO `jc_log` VALUES ('779', '1', '1', '3', '2013-01-04 16:53:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=28;name=null');
INSERT INTO `jc_log` VALUES ('780', '1', '1', '3', '2013-01-04 16:53:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=27;name=null');
INSERT INTO `jc_log` VALUES ('781', '1', '1', '3', '2013-01-04 16:53:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=26;name=null');
INSERT INTO `jc_log` VALUES ('782', '1', '1', '3', '2013-01-04 16:53:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=25;name=null');
INSERT INTO `jc_log` VALUES ('783', '1', '1', '3', '2013-01-04 16:53:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete_history.do', '删除采集历史', 'id=24;name=null');
INSERT INTO `jc_log` VALUES ('784', '1', '1', '3', '2013-01-04 16:53:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/acquisition/o_delete.do', '删除采集', 'id=1;name=新浪国内新闻');
INSERT INTO `jc_log` VALUES ('785', '1', '1', '3', '2013-01-04 16:53:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=9;title=下载中心');
INSERT INTO `jc_log` VALUES ('786', '1', '1', '3', '2013-01-04 16:59:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/role/o_save.do', '增加角色', 'id=2;name=普通');
INSERT INTO `jc_log` VALUES ('787', '1', '1', '3', '2013-01-04 16:59:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/role/o_update.do', '修改角色', 'id=2;name=普通');
INSERT INTO `jc_log` VALUES ('788', '1', '1', '3', '2013-01-04 17:03:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/admin_global/o_save.do', '增加用户', 'id=7;username=tanjie');
INSERT INTO `jc_log` VALUES ('789', '1', '1', '3', '2013-01-04 17:05:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=400;title=阿打发斯蒂芬');
INSERT INTO `jc_log` VALUES ('790', '7', null, '1', '2013-01-04 17:13:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('791', '1', null, '1', '2013-01-04 17:15:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('792', '1', null, '1', '2013-01-04 17:49:35', '127.0.0.1', '/liuliang1/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('794', '1', null, '1', '2013-01-05 08:42:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('795', '1', '1', '3', '2013-01-05 08:47:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=特点1');
INSERT INTO `jc_log` VALUES ('796', '1', '1', '3', '2013-01-05 08:47:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=特点2');
INSERT INTO `jc_log` VALUES ('797', '1', '1', '3', '2013-01-05 08:47:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=特点3');
INSERT INTO `jc_log` VALUES ('798', '1', '1', '3', '2013-01-05 08:48:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=特点4');
INSERT INTO `jc_log` VALUES ('799', '1', '1', '3', '2013-01-05 08:49:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=401;title=首页的图片1');
INSERT INTO `jc_log` VALUES ('800', '1', '1', '3', '2013-01-05 08:50:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=402;title=首页图片2');
INSERT INTO `jc_log` VALUES ('801', '1', '1', '3', '2013-01-05 08:50:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=403;title=首页图片3');
INSERT INTO `jc_log` VALUES ('802', '1', null, '1', '2013-01-05 09:30:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('803', '1', null, '1', '2013-01-05 09:51:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('804', '1', null, '1', '2013-01-05 09:54:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('806', '1', null, '1', '2013-01-05 10:06:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('807', '1', null, '1', '2013-01-05 10:21:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('809', '1', null, '1', '2013-01-05 10:39:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('811', '1', null, '1', '2013-01-05 10:42:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('814', '1', null, '1', '2013-01-05 10:50:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('815', '1', null, '1', '2013-01-05 10:55:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('817', '1', null, '1', '2013-01-05 10:57:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('818', '1', null, '1', '2013-01-05 14:18:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('819', '1', '1', '3', '2013-01-05 15:06:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('820', '1', '1', '3', '2013-01-05 15:07:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('821', '1', '1', '3', '2013-01-05 15:13:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('822', '1', '1', '3', '2013-01-05 15:15:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('823', '1', '1', '3', '2013-01-05 15:19:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('824', '1', '1', '3', '2013-01-05 15:43:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('825', '1', '1', '3', '2013-01-05 15:44:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('826', '1', '1', '3', '2013-01-05 15:46:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('827', '1', '1', '3', '2013-01-05 15:49:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('828', '1', '1', '3', '2013-01-05 15:50:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('829', '1', '1', '3', '2013-01-05 15:51:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('830', '1', '1', '3', '2013-01-05 15:51:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('831', '1', '1', '3', '2013-01-05 15:53:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('832', '1', '1', '3', '2013-01-05 15:55:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('833', '1', '1', '3', '2013-01-05 15:57:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('834', '1', '1', '3', '2013-01-05 15:58:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('835', '1', '1', '3', '2013-01-05 15:58:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('836', '1', '1', '3', '2013-01-05 16:00:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('837', '1', '1', '3', '2013-01-05 16:01:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('838', '1', '1', '3', '2013-01-05 16:01:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('839', '1', '1', '3', '2013-01-05 16:06:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('840', '1', '1', '3', '2013-01-05 16:07:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('841', '1', '1', '3', '2013-01-05 16:10:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('842', '1', '1', '3', '2013-01-05 16:14:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('843', '1', '1', '3', '2013-01-05 16:14:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('844', '1', '1', '3', '2013-01-05 16:38:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('845', '1', '1', '3', '2013-01-05 16:40:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('848', '1', null, '1', '2013-01-09 16:57:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('849', '1', null, '1', '2013-01-09 17:47:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('850', '1', null, '1', '2013-01-10 17:58:39', '192.168.0.103', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('851', '1', null, '1', '2013-01-10 17:58:45', '192.168.0.104', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('852', '1', null, '1', '2013-01-11 09:00:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('853', '1', '1', '3', '2013-01-11 09:11:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=435;title=加链接 送流量！');
INSERT INTO `jc_log` VALUES ('854', '1', '1', '3', '2013-01-11 09:12:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=80;name=免费提升流量');
INSERT INTO `jc_log` VALUES ('855', '1', '1', '3', '2013-01-11 09:15:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('856', '1', '1', '3', '2013-01-11 09:15:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('857', '1', '1', '3', '2013-01-11 09:18:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('858', '1', '1', '3', '2013-01-11 09:19:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=435;title=加链接 送流量！');
INSERT INTO `jc_log` VALUES ('859', '1', '1', '3', '2013-01-11 09:21:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('860', '1', '1', '3', '2013-01-11 09:21:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('861', '1', '1', '3', '2013-01-11 09:23:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('862', '1', '1', '3', '2013-01-11 09:23:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('863', '1', '1', '3', '2013-01-11 09:24:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('864', '1', '1', '3', '2013-01-11 15:59:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('865', '1', '1', '3', '2013-01-11 16:01:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('866', '1', '1', '3', '2013-01-11 16:03:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('867', '1', '1', '3', '2013-01-11 16:05:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('868', '1', '1', '3', '2013-01-11 16:12:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('869', '1', '1', '3', '2013-01-11 16:23:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('870', '1', '1', '3', '2013-01-11 16:26:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('871', '1', '1', '3', '2013-01-11 16:29:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('872', '1', '1', '3', '2013-01-11 16:30:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('873', '1', '1', '3', '2013-01-11 16:32:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('874', '1', '1', '3', '2013-01-11 16:40:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('875', '1', '1', '3', '2013-01-11 16:47:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('876', '1', '1', '3', '2013-01-11 16:50:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('877', '1', '1', '3', '2013-01-11 16:55:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('878', '1', '1', '3', '2013-01-11 16:56:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('879', '1', '1', '3', '2013-01-11 16:58:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('880', '1', '1', '3', '2013-01-11 16:58:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('881', '1', '1', '3', '2013-01-11 17:03:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('882', '1', null, '1', '2013-01-12 10:11:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('883', '1', '1', '3', '2013-01-12 10:50:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_会员中心');
INSERT INTO `jc_log` VALUES ('884', '1', '1', '3', '2013-01-12 10:56:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('885', '1', '1', '3', '2013-01-12 11:00:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('886', '1', '1', '3', '2013-01-12 11:03:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('887', '1', '1', '3', '2013-01-12 11:05:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('888', '1', '1', '3', '2013-01-12 11:05:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('889', '1', '1', '3', '2013-01-12 11:25:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('890', '1', '1', '3', '2013-01-12 11:28:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('891', '1', '1', '3', '2013-01-12 11:29:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('892', '1', '1', '3', '2013-01-12 12:01:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('893', '1', '1', '3', '2013-01-12 12:40:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('894', '1', '1', '3', '2013-01-12 12:51:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('895', '1', '1', '3', '2013-01-12 12:55:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('896', '1', '1', '3', '2013-01-12 13:00:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('897', '1', '1', '3', '2013-01-12 13:03:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('898', '1', null, '1', '2013-01-15 09:31:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('899', '1', null, '1', '2013-01-18 08:36:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('900', '1', '1', '3', '2013-01-18 08:38:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=首页');
INSERT INTO `jc_log` VALUES ('901', '1', '1', '3', '2013-01-18 08:39:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('902', '1', '1', '3', '2013-01-18 08:39:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心1.html');
INSERT INTO `jc_log` VALUES ('903', '1', '1', '3', '2013-01-18 08:55:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('904', '1', '1', '3', '2013-01-18 08:59:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('905', '1', '1', '3', '2013-01-18 09:00:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('906', '1', '1', '3', '2013-01-18 09:00:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('907', '1', '1', '3', '2013-01-18 09:01:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('908', '1', '1', '3', '2013-01-18 09:08:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/a.html');
INSERT INTO `jc_log` VALUES ('909', '1', '1', '3', '2013-01-18 09:16:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('910', '1', '1', '3', '2013-01-18 09:22:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('911', '1', '1', '3', '2013-01-18 09:23:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('912', '1', '1', '3', '2013-01-18 09:36:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=首页栏目管理_图片');
INSERT INTO `jc_log` VALUES ('913', '1', '1', '3', '2013-01-18 09:37:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('914', '1', '1', '3', '2013-01-18 09:38:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('915', '1', '1', '3', '2013-01-18 09:39:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=403;title=首页图片3');
INSERT INTO `jc_log` VALUES ('916', '1', '1', '3', '2013-01-18 09:39:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=401;title=首页的图片1');
INSERT INTO `jc_log` VALUES ('917', '1', '1', '3', '2013-01-18 09:40:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=402;title=首页图片2');
INSERT INTO `jc_log` VALUES ('918', '1', '1', '3', '2013-01-18 09:40:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=403;title=首页图片3');
INSERT INTO `jc_log` VALUES ('919', '1', '1', '3', '2013-01-18 09:41:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=436;title=首页图片4');
INSERT INTO `jc_log` VALUES ('920', '1', '1', '3', '2013-01-18 09:45:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('921', '1', '1', '3', '2013-01-18 09:52:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('922', '1', '1', '3', '2013-01-18 09:54:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('923', '1', '1', '3', '2013-01-18 09:55:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('924', '1', '1', '3', '2013-01-18 10:00:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('925', '1', '1', '3', '2013-01-18 10:01:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('926', '1', '1', '3', '2013-01-18 10:02:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('927', '1', '1', '3', '2013-01-18 10:02:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('928', '1', '1', '3', '2013-01-18 10:03:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('929', '1', '1', '3', '2013-01-18 10:33:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('930', '1', '1', '3', '2013-01-18 10:34:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('931', '1', '1', '3', '2013-01-18 11:03:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('932', '1', '1', '3', '2013-01-18 11:04:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('933', '1', '1', '3', '2013-01-18 12:42:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/a.html');
INSERT INTO `jc_log` VALUES ('934', '1', '1', '3', '2013-01-18 14:05:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('935', '1', null, '1', '2013-01-18 14:48:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('936', '1', '1', '3', '2013-01-18 14:49:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/app.css');
INSERT INTO `jc_log` VALUES ('937', '1', '1', '3', '2013-01-18 14:50:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/app.css');
INSERT INTO `jc_log` VALUES ('938', '1', '1', '3', '2013-01-18 14:50:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/app.css');
INSERT INTO `jc_log` VALUES ('939', '1', '1', '3', '2013-01-18 14:56:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('940', '1', '1', '3', '2013-01-18 14:57:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('941', '1', '1', '3', '2013-01-18 15:01:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('942', '1', '1', '3', '2013-01-18 15:03:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('943', '1', '1', '3', '2013-01-18 15:04:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('944', '1', '1', '3', '2013-01-18 15:05:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('945', '1', '1', '3', '2013-01-18 15:06:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('946', '1', '1', '3', '2013-01-18 15:07:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('947', '1', '1', '3', '2013-01-18 15:14:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('948', '1', '1', '3', '2013-01-18 15:20:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('949', '1', '1', '3', '2013-01-18 15:20:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('950', '1', '1', '3', '2013-01-18 15:20:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('951', '1', '1', '3', '2013-01-18 15:21:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('952', '1', '1', '3', '2013-01-18 15:22:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('953', '1', '1', '3', '2013-01-18 15:26:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('954', '1', '1', '3', '2013-01-18 15:27:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('955', '1', '1', '3', '2013-01-18 15:30:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('956', '1', '1', '3', '2013-01-18 15:41:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页1.html');
INSERT INTO `jc_log` VALUES ('957', '1', '1', '3', '2013-01-18 15:42:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('958', '1', '1', '3', '2013-01-18 16:29:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('959', '1', '1', '3', '2013-01-18 16:31:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('960', '1', '1', '3', '2013-01-18 16:32:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('961', '1', '1', '3', '2013-01-18 16:33:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('962', '1', '1', '3', '2013-01-18 16:34:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('963', '1', '1', '3', '2013-01-18 16:56:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('964', '1', '1', '3', '2013-01-18 17:01:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('965', '1', '1', '3', '2013-01-18 17:02:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('966', '1', '1', '3', '2013-01-18 17:03:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('967', '1', '1', '3', '2013-01-18 17:04:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('968', '1', '1', '3', '2013-01-18 17:04:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('969', '1', '1', '3', '2013-01-18 17:05:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('970', '1', '1', '3', '2013-01-18 17:05:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('971', '1', '1', '3', '2013-01-18 17:07:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('972', '1', '1', '3', '2013-01-18 17:07:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('973', '1', '1', '3', '2013-01-18 17:09:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('974', '1', '1', '3', '2013-01-18 17:12:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('975', '1', '1', '3', '2013-01-18 17:15:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('976', '1', '1', '3', '2013-01-18 17:16:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('977', '1', '1', '3', '2013-01-18 17:23:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('978', '1', '1', '3', '2013-01-18 17:24:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('979', '1', '1', '3', '2013-01-18 17:27:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('980', '1', '1', '3', '2013-01-18 17:28:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('981', '1', null, '1', '2013-02-18 16:02:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('982', '1', null, '1', '2013-05-21 09:34:33', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('983', null, null, '2', '2013-05-21 09:34:44', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录失败', 'username=admin;password=admin');
INSERT INTO `jc_log` VALUES ('984', '1', null, '1', '2013-05-21 09:34:52', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('985', '1', null, '1', '2013-05-21 09:35:20', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('986', '1', null, '1', '2013-05-21 09:39:54', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('987', '1', null, '1', '2013-05-21 10:34:13', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('988', '1', null, '1', '2013-05-21 10:38:10', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('989', '1', null, '1', '2013-05-21 10:58:18', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('990', '1', null, '1', '2013-05-21 10:58:39', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('991', '1', null, '1', '2013-05-21 11:10:49', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('992', null, null, '2', '2013-05-21 13:00:15', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录失败', 'username=jetan;password=password');
INSERT INTO `jc_log` VALUES ('993', '1', null, '1', '2013-05-21 13:00:26', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('994', null, null, '2', '2013-05-21 13:02:28', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录失败', 'username=admin;password=admin');
INSERT INTO `jc_log` VALUES ('995', '1', null, '1', '2013-05-21 14:21:24', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('996', '1', null, '1', '2013-06-07 15:13:25', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('997', '1', '1', '3', '2013-06-07 15:37:26', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('998', '1', '1', '3', '2013-06-07 15:39:27', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('999', '1', '1', '3', '2013-06-07 15:43:20', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1000', '1', '1', '3', '2013-06-07 15:43:33', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1001', '1', '1', '3', '2013-06-07 15:49:52', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/message/v_send.do', '发送站内信', 'id=1;title=儿童');
INSERT INTO `jc_log` VALUES ('1002', '1', '1', '3', '2013-06-07 15:49:52', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/message/v_send.do', '发送站内信', 'id=2;title=儿童');
INSERT INTO `jc_log` VALUES ('1003', '1', '1', '3', '2013-06-07 15:55:13', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/member/o_update.do', '更新会员', 'id=5;username=test');
INSERT INTO `jc_log` VALUES ('1004', '1', '1', '3', '2013-06-07 15:55:41', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/role/o_update.do', '修改角色', 'id=2;name=普通');
INSERT INTO `jc_log` VALUES ('1005', '5', null, '1', '2013-06-07 15:55:57', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1006', '5', null, '1', '2013-06-07 15:56:09', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1007', '1', null, '1', '2013-06-07 15:56:20', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1008', '1', '1', '3', '2013-06-07 15:57:11', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/role/o_update.do', '修改角色', 'id=2;name=普通');
INSERT INTO `jc_log` VALUES ('1009', '1', '1', '3', '2013-06-07 15:59:38', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=6;username=sdfas');
INSERT INTO `jc_log` VALUES ('1010', '1', '1', '3', '2013-06-07 16:00:34', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/admin_local/o_update.do', '修改用户', 'id=7;username=tanjie');
INSERT INTO `jc_log` VALUES ('1011', '7', null, '1', '2013-06-07 16:00:54', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1012', '7', '1', '3', '2013-06-07 16:01:51', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/role/o_update.do', '修改角色', 'id=2;name=普通');
INSERT INTO `jc_log` VALUES ('1013', '7', null, '1', '2013-06-07 16:02:00', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1014', '1', null, '1', '2013-06-07 16:02:29', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1015', '1', null, '1', '2013-06-19 14:43:15', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1016', '1', '1', '3', '2013-06-19 15:06:13', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/file/o_delete_single.do', '删除资源', 'filename=/u/cms/www/201301');
INSERT INTO `jc_log` VALUES ('1017', null, null, '2', '2013-06-19 16:12:08', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录失败', 'username=admin;password=passqord');
INSERT INTO `jc_log` VALUES ('1018', '1', null, '1', '2013-06-19 16:12:25', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1019', '1', null, '1', '2013-06-20 14:29:59', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1020', '1', '1', '3', '2013-06-20 14:37:50', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1021', '1', '1', '3', '2013-06-20 14:45:13', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1022', '1', '1', '3', '2013-06-20 14:48:03', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1023', '1', '1', '3', '2013-06-20 14:48:41', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1024', '1', '1', '3', '2013-06-20 14:50:46', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1025', '1', '1', '3', '2013-06-20 14:54:01', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1026', '1', '1', '3', '2013-06-20 14:54:06', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1027', '1', '1', '3', '2013-06-20 14:56:19', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1028', '1', '1', '3', '2013-06-20 14:56:22', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1029', '1', '1', '3', '2013-06-20 14:58:40', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1030', '1', '1', '3', '2013-06-20 15:00:16', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1031', '1', '1', '3', '2013-06-20 15:02:57', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1032', '1', '1', '3', '2013-06-20 15:05:32', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1033', '1', '1', '3', '2013-06-20 15:06:54', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1034', '1', '1', '3', '2013-06-20 15:10:06', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1035', '1', '1', '3', '2013-06-20 15:13:58', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1036', '1', '1', '3', '2013-06-20 15:15:58', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1037', '1', '1', '3', '2013-06-20 16:03:42', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1038', '1', '1', '3', '2013-06-20 16:07:33', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1039', '1', '1', '3', '2013-06-20 16:14:34', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1040', '1', '1', '3', '2013-06-20 16:22:49', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1041', '1', '1', '3', '2013-06-20 16:24:36', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1042', '1', '1', '3', '2013-06-20 16:26:00', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1043', '1', '1', '3', '2013-06-20 16:31:09', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1044', '1', '1', '3', '2013-06-20 16:32:47', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1045', '1', '1', '3', '2013-06-20 16:34:02', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1046', '1', '1', '3', '2013-06-20 16:36:40', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1047', '1', '1', '3', '2013-06-20 16:39:09', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1048', '1', '1', '3', '2013-06-20 16:49:04', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1049', '1', '1', '3', '2013-06-20 16:52:36', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1050', '1', '1', '3', '2013-06-20 16:59:20', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1051', '1', '1', '3', '2013-06-20 17:00:50', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1052', '1', '1', '3', '2013-06-20 17:06:26', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1053', '1', '1', '3', '2013-06-20 17:08:10', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1054', '1', '1', '3', '2013-06-20 17:14:45', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1055', '1', '1', '3', '2013-06-20 17:15:55', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1056', '1', '1', '3', '2013-06-20 17:16:25', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1057', '1', '1', '3', '2013-06-20 17:17:33', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1058', '1', '1', '3', '2013-06-20 17:21:40', '0:0:0:0:0:0:0:1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1059', '1', null, '1', '2013-06-26 11:35:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1060', '1', null, '1', '2013-06-26 14:08:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1061', '1', '1', '3', '2013-06-26 14:34:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=89;title=null');
INSERT INTO `jc_log` VALUES ('1062', '1', '1', '3', '2013-06-26 15:42:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1063', '1', '1', '3', '2013-06-26 15:57:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete_single.do', '删除资源', 'filename=/u/cms/www/201301');
INSERT INTO `jc_log` VALUES ('1064', '1', '1', '3', '2013-06-26 15:57:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=88;title=null');
INSERT INTO `jc_log` VALUES ('1065', '1', '1', '3', '2013-06-26 16:05:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=84;name=联系我们');
INSERT INTO `jc_log` VALUES ('1066', '1', '1', '3', '2013-06-26 16:10:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=79;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('1067', '1', '1', '3', '2013-06-26 16:10:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=80;name=免费提升流量');
INSERT INTO `jc_log` VALUES ('1068', '1', '1', '3', '2013-06-26 16:10:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=80;name=免费提升流量');
INSERT INTO `jc_log` VALUES ('1069', '1', '1', '3', '2013-06-26 16:13:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=80;name=免费提升流量');
INSERT INTO `jc_log` VALUES ('1070', '1', '1', '3', '2013-06-26 16:13:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=81;name=网站流量优化');
INSERT INTO `jc_log` VALUES ('1071', '1', '1', '3', '2013-06-26 16:13:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=82;name=Alexa排名优化');
INSERT INTO `jc_log` VALUES ('1072', '1', '1', '3', '2013-06-26 16:13:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=83;name=QQ空间刷人气');
INSERT INTO `jc_log` VALUES ('1073', '1', '1', '3', '2013-06-26 16:13:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=84;name=联系我们');
INSERT INTO `jc_log` VALUES ('1074', '1', '1', '3', '2013-06-26 16:16:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=79;name=流量软件下载');
INSERT INTO `jc_log` VALUES ('1075', '1', '1', '3', '2013-06-26 16:17:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=80;name=免费提升流量');
INSERT INTO `jc_log` VALUES ('1076', '1', '1', '3', '2013-06-26 16:18:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=81;name=网站流量优化');
INSERT INTO `jc_log` VALUES ('1077', '1', '1', '3', '2013-06-26 16:18:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=82;name=Alexa排名优化');
INSERT INTO `jc_log` VALUES ('1078', '1', '1', '3', '2013-06-26 16:18:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=83;name=QQ空间刷人气');
INSERT INTO `jc_log` VALUES ('1079', '1', '1', '3', '2013-06-26 16:27:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1080', '1', '1', '3', '2013-06-26 16:27:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1081', '1', '1', '3', '2013-06-26 16:27:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1082', '1', '1', '3', '2013-06-26 16:28:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1083', '1', '1', '3', '2013-06-26 16:29:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1084', '1', '1', '3', '2013-06-26 16:30:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1085', '1', '1', '3', '2013-06-26 16:31:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1086', '1', '1', '3', '2013-06-26 16:33:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1087', '1', '1', '3', '2013-06-26 16:34:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1088', '1', '1', '3', '2013-06-26 16:35:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1089', '1', '1', '3', '2013-06-26 16:37:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1090', '1', '1', '3', '2013-06-26 16:38:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=437;title=涉及到克里夫 ');
INSERT INTO `jc_log` VALUES ('1091', '1', '1', '3', '2013-06-26 16:44:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=79;title=null');
INSERT INTO `jc_log` VALUES ('1092', '1', '1', '3', '2013-06-26 16:48:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=85;title=null');
INSERT INTO `jc_log` VALUES ('1093', '1', '1', '3', '2013-06-26 16:48:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=85;name=帮助中心');
INSERT INTO `jc_log` VALUES ('1094', '1', '1', '3', '2013-06-26 16:48:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=84;name=联系我们');
INSERT INTO `jc_log` VALUES ('1095', '1', '1', '3', '2013-06-26 16:53:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_日志.html');
INSERT INTO `jc_log` VALUES ('1096', '1', '1', '3', '2013-06-26 16:53:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_图片.html');
INSERT INTO `jc_log` VALUES ('1097', '1', '1', '3', '2013-06-26 17:01:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_流量软件下载.html');
INSERT INTO `jc_log` VALUES ('1098', '1', '1', '3', '2013-06-26 17:08:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1099', '1', '1', '3', '2013-06-26 17:10:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1100', '1', '1', '3', '2013-06-26 17:13:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1101', '1', '1', '3', '2013-06-26 17:17:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1102', '1', '1', '3', '2013-06-26 17:18:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1103', '1', '1', '3', '2013-06-26 17:27:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1104', '1', '1', '3', '2013-06-26 17:30:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/liqu.css');
INSERT INTO `jc_log` VALUES ('1105', '1', '1', '3', '2013-06-26 17:30:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/liqu.css');
INSERT INTO `jc_log` VALUES ('1106', '1', '1', '3', '2013-06-26 17:32:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1107', '1', '1', '3', '2013-06-26 17:34:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1108', '1', '1', '3', '2013-06-26 17:34:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1109', '1', '1', '3', '2013-06-26 17:35:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1110', '1', '1', '3', '2013-06-26 17:35:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1111', '1', '1', '3', '2013-06-26 17:35:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1112', '1', '1', '3', '2013-06-26 17:35:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1113', '1', '1', '3', '2013-06-26 17:37:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1114', '1', '1', '3', '2013-06-26 17:37:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1115', '1', '1', '3', '2013-06-26 17:38:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1116', '1', '1', '3', '2013-06-26 17:42:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1117', '1', '1', '3', '2013-06-26 18:00:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1118', '1', '1', '3', '2013-06-26 18:00:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1119', '1', '1', '3', '2013-06-26 18:00:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1120', '1', '1', '3', '2013-06-26 18:00:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1121', '1', '1', '3', '2013-06-26 18:04:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1122', '1', '1', '3', '2013-06-26 18:05:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1123', '1', '1', '3', '2013-06-26 18:28:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_delete_single.do', '删除资源', 'filename=/r/cms/www/liured/js/jquery.js');
INSERT INTO `jc_log` VALUES ('1124', '1', '1', '3', '2013-06-26 18:39:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/liqu.css');
INSERT INTO `jc_log` VALUES ('1125', '1', '1', '3', '2013-06-26 18:39:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/liqu.css');
INSERT INTO `jc_log` VALUES ('1126', '1', '1', '3', '2013-06-26 18:42:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/liqu.css');
INSERT INTO `jc_log` VALUES ('1127', '1', '1', '3', '2013-06-26 18:42:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/liqu.css');
INSERT INTO `jc_log` VALUES ('1128', '1', '1', '3', '2013-06-26 18:44:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/liqu.css');
INSERT INTO `jc_log` VALUES ('1129', '1', '1', '3', '2013-06-26 18:45:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=84;name=联系我们');
INSERT INTO `jc_log` VALUES ('1130', '1', '1', '3', '2013-06-26 18:45:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=85;name=帮助中心');
INSERT INTO `jc_log` VALUES ('1131', '1', '1', '3', '2013-06-26 18:52:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=专业');
INSERT INTO `jc_log` VALUES ('1132', '1', '1', '3', '2013-06-26 18:54:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=61;name=产品介绍');
INSERT INTO `jc_log` VALUES ('1133', '1', '1', '3', '2013-06-26 18:55:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=站长统计');
INSERT INTO `jc_log` VALUES ('1134', '1', '1', '3', '2013-06-26 18:56:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=全景统计');
INSERT INTO `jc_log` VALUES ('1135', '1', '1', '3', '2013-06-26 18:57:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=移动统计');
INSERT INTO `jc_log` VALUES ('1136', '1', '1', '3', '2013-06-26 18:58:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=移动推荐');
INSERT INTO `jc_log` VALUES ('1137', '1', '1', '3', '2013-06-26 18:59:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=438;title=广告管家');
INSERT INTO `jc_log` VALUES ('1138', '1', '1', '3', '2013-06-26 18:59:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=广告管家');
INSERT INTO `jc_log` VALUES ('1139', '1', null, '1', '2013-06-27 08:42:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1140', '1', '1', '3', '2013-06-27 08:56:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=首页');
INSERT INTO `jc_log` VALUES ('1141', '1', '1', '3', '2013-06-27 09:02:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=广告管家');
INSERT INTO `jc_log` VALUES ('1142', '1', '1', '3', '2013-06-27 09:06:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1143', '1', '1', '3', '2013-06-27 09:28:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1144', '1', '1', '3', '2013-06-27 09:30:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=站长统计');
INSERT INTO `jc_log` VALUES ('1145', '1', '1', '3', '2013-06-27 09:30:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=全景统计');
INSERT INTO `jc_log` VALUES ('1146', '1', '1', '3', '2013-06-27 09:30:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=移动统计');
INSERT INTO `jc_log` VALUES ('1147', '1', '1', '3', '2013-06-27 09:31:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=广告管家');
INSERT INTO `jc_log` VALUES ('1148', '1', '1', '3', '2013-06-27 09:31:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=移动推荐');
INSERT INTO `jc_log` VALUES ('1149', '1', '1', '3', '2013-06-27 09:33:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=云推荐');
INSERT INTO `jc_log` VALUES ('1150', '1', '1', '3', '2013-06-27 09:35:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1151', '1', '1', '3', '2013-06-27 09:37:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1152', '1', '1', '3', '2013-06-27 09:38:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1153', '1', '1', '3', '2013-06-27 09:44:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1154', '1', '1', '3', '2013-06-27 09:49:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/home.css');
INSERT INTO `jc_log` VALUES ('1155', '1', '1', '3', '2013-06-27 09:50:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1156', '1', '1', '3', '2013-06-27 09:53:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/home.css');
INSERT INTO `jc_log` VALUES ('1157', '1', '1', '3', '2013-06-27 09:54:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1158', '1', '1', '3', '2013-06-27 09:55:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1159', '1', null, '1', '2013-06-27 10:01:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1160', '1', '1', '3', '2013-06-27 10:03:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/home.css');
INSERT INTO `jc_log` VALUES ('1161', '1', '1', '3', '2013-06-27 10:04:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1162', '1', '1', '3', '2013-06-27 10:06:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=广告管家');
INSERT INTO `jc_log` VALUES ('1163', '1', '1', '3', '2013-06-27 10:18:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1164', '1', '1', '3', '2013-06-27 10:19:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1165', '1', '1', '3', '2013-06-27 10:19:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=广告管家');
INSERT INTO `jc_log` VALUES ('1166', '1', '1', '3', '2013-06-27 10:19:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=云推荐');
INSERT INTO `jc_log` VALUES ('1167', '1', '1', '3', '2013-06-27 10:19:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=移动统计');
INSERT INTO `jc_log` VALUES ('1168', '1', '1', '3', '2013-06-27 10:20:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=全景统计');
INSERT INTO `jc_log` VALUES ('1169', '1', '1', '3', '2013-06-27 10:20:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=站长统计');
INSERT INTO `jc_log` VALUES ('1170', '1', '1', '3', '2013-06-27 10:26:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=62;name=最新动态');
INSERT INTO `jc_log` VALUES ('1171', '1', '1', '3', '2013-06-27 10:29:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=347;title=CNZZ全景统计新装亮相：');
INSERT INTO `jc_log` VALUES ('1172', '1', '1', '3', '2013-06-27 10:29:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=348;title=轻松获得一站式服务，直达登录CNZZ全线产品。');
INSERT INTO `jc_log` VALUES ('1173', '1', '1', '3', '2013-06-27 10:30:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=349;title=CNZZ\"云推荐\"助您提升网站流量');
INSERT INTO `jc_log` VALUES ('1174', '1', '1', '3', '2013-06-27 10:30:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=350;title=应用4');
INSERT INTO `jc_log` VALUES ('1175', '1', '1', '3', '2013-06-27 10:31:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=350;title=CNZZ\"站长统计\"新增热点图功能');
INSERT INTO `jc_log` VALUES ('1176', '1', '1', '3', '2013-06-27 10:33:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1177', '1', '1', '3', '2013-06-27 10:34:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1178', '1', '1', '3', '2013-06-27 10:35:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1179', '1', '1', '3', '2013-06-27 11:21:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页1.html');
INSERT INTO `jc_log` VALUES ('1180', '1', '1', '3', '2013-06-27 11:23:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1181', '1', '1', '3', '2013-06-27 11:24:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1182', '1', '1', '3', '2013-06-27 11:24:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1183', '1', '1', '3', '2013-06-27 11:30:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1184', '1', '1', '3', '2013-06-27 11:31:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1185', '1', '1', '3', '2013-06-27 11:32:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1186', '1', '1', '3', '2013-06-27 11:32:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1187', '1', '1', '3', '2013-06-27 11:33:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1188', '1', '1', '3', '2013-06-27 11:33:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1189', '1', '1', '3', '2013-06-27 11:33:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1190', '1', '1', '3', '2013-06-27 11:34:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=394;title=应用6');
INSERT INTO `jc_log` VALUES ('1191', '1', '1', '3', '2013-06-27 11:35:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=393;title=应用5');
INSERT INTO `jc_log` VALUES ('1192', '1', '1', '3', '2013-06-27 11:35:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=350;title=CNZZ\"站长统计\"新增热点图功能');
INSERT INTO `jc_log` VALUES ('1193', '1', '1', '3', '2013-06-27 11:35:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=349;title=CNZZ\"云推荐\"助您提升网站流量');
INSERT INTO `jc_log` VALUES ('1194', '1', '1', '3', '2013-06-27 11:35:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=349;title=CNZZ\"云推荐\"助您提升网站流量');
INSERT INTO `jc_log` VALUES ('1195', '1', '1', '3', '2013-06-27 11:35:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=348;title=轻松获得一站式服务，直达登录CNZZ全线产品。');
INSERT INTO `jc_log` VALUES ('1196', '1', '1', '3', '2013-06-27 11:35:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=347;title=CNZZ全景统计新装亮相：');
INSERT INTO `jc_log` VALUES ('1197', '1', '1', '3', '2013-06-27 11:40:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1198', '1', '1', '3', '2013-06-27 11:40:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1199', '1', '1', '3', '2013-06-27 11:42:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=347;title=CNZZ全景统计新装亮相：');
INSERT INTO `jc_log` VALUES ('1200', '1', '1', '3', '2013-06-27 11:44:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=63;name=常见问题');
INSERT INTO `jc_log` VALUES ('1201', '1', '1', '3', '2013-06-27 11:45:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=64;name=使用帮助');
INSERT INTO `jc_log` VALUES ('1202', '1', '1', '3', '2013-06-27 11:46:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1203', '1', '1', '3', '2013-06-27 11:46:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1204', '1', '1', '3', '2013-06-27 11:46:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1205', '1', '1', '3', '2013-06-27 11:50:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=439;title=火车票抢票软件争议背后是浏览器市场竞争格局');
INSERT INTO `jc_log` VALUES ('1206', '1', '1', '3', '2013-06-27 11:51:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=440;title=在线零售在元旦一周流量有所下滑');
INSERT INTO `jc_log` VALUES ('1207', '1', '1', '3', '2013-06-27 11:51:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=441;title=2012年搜狗\"我最喜爱的网站\"评选将开始');
INSERT INTO `jc_log` VALUES ('1208', '1', '1', '3', '2013-06-27 11:52:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=442;title=最长国庆期间，电商陷入低潮');
INSERT INTO `jc_log` VALUES ('1209', '1', '1', '3', '2013-06-27 11:52:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=443;title=iPhone5正式发布，赞赏与批评声共存');
INSERT INTO `jc_log` VALUES ('1210', '1', '1', '3', '2013-06-27 11:53:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=444;title=2012年第2季度国内操作系统分析报告');
INSERT INTO `jc_log` VALUES ('1211', '1', '1', '3', '2013-06-27 11:59:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1212', '1', '1', '3', '2013-06-27 12:00:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1213', '1', '1', '3', '2013-06-27 12:02:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1214', '1', '1', '3', '2013-06-27 12:03:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=86;title=null');
INSERT INTO `jc_log` VALUES ('1215', '1', '1', '3', '2013-06-27 12:05:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=445;title=专业');
INSERT INTO `jc_log` VALUES ('1216', '1', '1', '3', '2013-06-27 12:06:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=446;title=安全');
INSERT INTO `jc_log` VALUES ('1217', '1', '1', '3', '2013-06-27 12:07:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=447;title=简单');
INSERT INTO `jc_log` VALUES ('1218', '1', '1', '3', '2013-06-27 12:07:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=448;title=成长');
INSERT INTO `jc_log` VALUES ('1219', '1', '1', '3', '2013-06-27 12:10:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1220', '1', '1', '3', '2013-06-27 14:39:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=448;title=成长');
INSERT INTO `jc_log` VALUES ('1221', '1', '1', '3', '2013-06-27 14:40:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=447;title=简单');
INSERT INTO `jc_log` VALUES ('1222', '1', '1', '3', '2013-06-27 14:40:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=446;title=安全');
INSERT INTO `jc_log` VALUES ('1223', '1', '1', '3', '2013-06-27 14:40:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=445;title=专业');
INSERT INTO `jc_log` VALUES ('1224', '1', '1', '3', '2013-06-27 14:40:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1225', '1', '1', '3', '2013-06-27 14:43:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1226', '1', '1', '3', '2013-06-27 14:53:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1227', '1', '1', '3', '2013-06-27 14:56:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=445;title=专业');
INSERT INTO `jc_log` VALUES ('1228', '1', '1', '3', '2013-06-27 14:57:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=446;title=安全');
INSERT INTO `jc_log` VALUES ('1229', '1', '1', '3', '2013-06-27 14:57:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=447;title=简单');
INSERT INTO `jc_log` VALUES ('1230', '1', '1', '3', '2013-06-27 14:57:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=447;title=简单');
INSERT INTO `jc_log` VALUES ('1231', '1', '1', '3', '2013-06-27 14:57:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=448;title=成长');
INSERT INTO `jc_log` VALUES ('1232', '1', '1', '3', '2013-06-27 15:05:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1233', '1', '1', '3', '2013-06-27 15:12:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1234', '1', '1', '3', '2013-06-27 15:16:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1235', '1', '1', '3', '2013-06-27 15:17:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1236', '1', '1', '3', '2013-06-27 15:47:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1237', '1', '1', '3', '2013-06-27 15:51:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1238', '1', '1', '3', '2013-06-27 15:53:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1239', '1', '1', '3', '2013-06-27 15:55:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1240', '1', '1', '3', '2013-06-27 15:57:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1241', '1', '1', '3', '2013-06-27 15:59:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1242', '1', '1', '3', '2013-06-27 15:59:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1243', '1', '1', '3', '2013-06-27 16:02:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1244', '1', '1', '3', '2013-06-27 16:03:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1245', '1', '1', '3', '2013-06-27 16:07:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1246', '1', '1', '3', '2013-06-27 16:09:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=战略合作伙伴');
INSERT INTO `jc_log` VALUES ('1247', '1', '1', '3', '2013-06-27 16:12:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1248', '1', '1', '3', '2013-06-27 16:12:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/战略合作伙伴.html');
INSERT INTO `jc_log` VALUES ('1249', '1', '1', '3', '2013-06-27 16:13:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1250', '1', '1', '3', '2013-06-27 16:14:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1251', '1', '1', '3', '2013-06-27 16:17:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=页脚链接');
INSERT INTO `jc_log` VALUES ('1252', '1', '1', '3', '2013-06-27 16:17:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1253', '1', '1', '3', '2013-06-27 16:18:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/include/页脚链接.html');
INSERT INTO `jc_log` VALUES ('1254', '1', '1', '3', '2013-06-27 16:18:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1255', '1', '1', '3', '2013-06-27 16:20:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1256', '1', '1', '3', '2013-06-27 16:22:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1257', '1', '1', '3', '2013-06-27 17:10:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页内容_Alexa排名优化');
INSERT INTO `jc_log` VALUES ('1258', '1', '1', '3', '2013-06-27 17:11:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1259', '1', '1', '3', '2013-06-27 17:12:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1260', '1', '1', '3', '2013-06-27 17:12:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1261', '1', '1', '3', '2013-06-27 17:13:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=82;name=Alexa排名优化');
INSERT INTO `jc_log` VALUES ('1262', '1', '1', '3', '2013-06-27 17:21:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=434;title=富家大室四度空间弗兰克速度快放假');
INSERT INTO `jc_log` VALUES ('1263', '1', '1', '3', '2013-06-27 17:21:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=433;title=的是法师打定身法');
INSERT INTO `jc_log` VALUES ('1264', '1', null, '1', '2013-06-27 17:28:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1265', '1', '1', '3', '2013-06-27 17:32:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=425;title=少打飞机阿迪神经分裂卡仕达思考副经理');
INSERT INTO `jc_log` VALUES ('1266', '1', '1', '3', '2013-06-27 17:32:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=434;title=富家大室四度空间弗兰克速度快放假');
INSERT INTO `jc_log` VALUES ('1267', '1', '1', '3', '2013-06-27 17:33:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=432;title=的金发晶阿斯顿计费');
INSERT INTO `jc_log` VALUES ('1268', '1', '1', '3', '2013-06-27 17:33:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=427;title=绿卡时间段付款了斯蒂芬金拉丝');
INSERT INTO `jc_log` VALUES ('1269', '1', '1', '3', '2013-06-27 17:33:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=426;title=控件的返回阿斯蒂芬金');
INSERT INTO `jc_log` VALUES ('1270', '1', '1', '3', '2013-06-27 17:40:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1271', '1', '1', '3', '2013-06-27 17:40:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=434;title=富家大室四度空间弗兰克速度快放假');
INSERT INTO `jc_log` VALUES ('1272', '1', '1', '3', '2013-06-27 17:40:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=433;title=的是法师打定身法');
INSERT INTO `jc_log` VALUES ('1273', '1', '1', '3', '2013-06-27 17:43:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1274', '1', '1', '3', '2013-06-27 17:45:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=433;title=的是法师打定身法');
INSERT INTO `jc_log` VALUES ('1275', '1', '1', '3', '2013-06-27 17:50:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1276', '1', '1', '3', '2013-06-27 17:50:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1277', '1', '1', '3', '2013-06-27 17:50:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1278', '1', '1', '3', '2013-06-27 17:51:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1279', '1', '1', '3', '2013-06-27 17:52:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=429;title=里斯蒂芬金拉克圣诞节阿迪司法局拉动是的撒放假');
INSERT INTO `jc_log` VALUES ('1280', '1', '1', '3', '2013-06-27 17:52:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=428;title=少打飞机肯定是四度空间卡仕达');
INSERT INTO `jc_log` VALUES ('1281', '1', '1', '3', '2013-06-27 17:52:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=425;title=少打飞机阿迪神经分裂卡仕达思考副经理');
INSERT INTO `jc_log` VALUES ('1282', '1', '1', '3', '2013-06-27 17:52:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=424;title=的撒副科级多少了放假斯蒂芬金阿斯顿发');
INSERT INTO `jc_log` VALUES ('1283', '1', '1', '3', '2013-06-27 17:52:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=423;title=斯蒂芬金克里斯');
INSERT INTO `jc_log` VALUES ('1284', '1', '1', '3', '2013-06-27 17:58:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目');
INSERT INTO `jc_log` VALUES ('1285', '1', '1', '3', '2013-06-27 17:59:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=首页栏目管理');
INSERT INTO `jc_log` VALUES ('1286', '1', '1', '3', '2013-06-27 18:00:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('1287', '1', '1', '3', '2013-06-27 18:01:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=61;name=产品介绍');
INSERT INTO `jc_log` VALUES ('1288', '1', '1', '3', '2013-06-27 18:02:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=425;title=少打飞机阿迪神经分裂卡仕达思考副经理');
INSERT INTO `jc_log` VALUES ('1289', '1', '1', '3', '2013-06-27 18:03:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=424;title=的撒副科级多少了放假斯蒂芬金阿斯顿发');
INSERT INTO `jc_log` VALUES ('1290', '1', '1', '3', '2013-06-27 18:03:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=423;title=斯蒂芬金克里斯');
INSERT INTO `jc_log` VALUES ('1291', '1', null, '1', '2013-06-28 09:18:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1292', '1', '1', '3', '2013-06-28 09:20:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=85;name=帮助中心');
INSERT INTO `jc_log` VALUES ('1293', '1', '1', '3', '2013-06-28 09:21:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=85;name=帮助中心');
INSERT INTO `jc_log` VALUES ('1294', '1', null, '1', '2013-06-28 09:57:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1295', '1', '1', '3', '2013-06-28 09:58:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=85;name=帮助中心');
INSERT INTO `jc_log` VALUES ('1296', '1', '1', '3', '2013-06-28 10:01:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', null);
INSERT INTO `jc_log` VALUES ('1297', '1', '1', '3', '2013-06-28 10:01:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', null);
INSERT INTO `jc_log` VALUES ('1298', '1', '1', '3', '2013-06-28 10:12:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=80;name=免费提升流量');
INSERT INTO `jc_log` VALUES ('1299', '1', '1', '3', '2013-06-28 10:12:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=81;name=网站流量优化');
INSERT INTO `jc_log` VALUES ('1300', '1', '1', '3', '2013-06-28 10:12:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=82;name=Alexa排名优化');
INSERT INTO `jc_log` VALUES ('1301', '1', '1', '3', '2013-06-28 10:12:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=81;name=网站流量优化');
INSERT INTO `jc_log` VALUES ('1302', '1', '1', '3', '2013-06-28 10:12:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=80;name=免费提升流量');
INSERT INTO `jc_log` VALUES ('1303', '1', '1', '3', '2013-06-28 10:14:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', null);
INSERT INTO `jc_log` VALUES ('1304', '1', '1', '3', '2013-06-28 10:24:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', null);
INSERT INTO `jc_log` VALUES ('1305', '1', '1', '3', '2013-06-28 10:28:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', null);
INSERT INTO `jc_log` VALUES ('1306', '1', null, '1', '2013-06-28 15:27:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1307', '1', '1', '3', '2013-06-28 15:39:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1308', '1', '1', '3', '2013-06-28 16:06:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/theme.css');
INSERT INTO `jc_log` VALUES ('1309', '1', '1', '3', '2013-06-28 16:26:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/theme.css');
INSERT INTO `jc_log` VALUES ('1310', '1', '1', '3', '2013-06-28 16:26:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/theme.css');
INSERT INTO `jc_log` VALUES ('1311', '1', '1', '3', '2013-06-28 16:26:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/theme.css');
INSERT INTO `jc_log` VALUES ('1312', '1', '1', '3', '2013-06-28 16:31:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/theme.css');
INSERT INTO `jc_log` VALUES ('1313', '1', '1', '3', '2013-06-28 16:32:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/theme.css');
INSERT INTO `jc_log` VALUES ('1314', '1', '1', '3', '2013-06-28 16:36:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/theme.css');
INSERT INTO `jc_log` VALUES ('1315', '1', '1', '3', '2013-06-28 16:37:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/theme.css');
INSERT INTO `jc_log` VALUES ('1316', '1', '1', '3', '2013-06-28 16:38:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/theme.css');
INSERT INTO `jc_log` VALUES ('1317', '1', '1', '3', '2013-06-28 16:43:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1318', '1', '1', '3', '2013-06-28 16:43:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1319', '1', '1', '3', '2013-06-28 16:44:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1320', '1', '1', '3', '2013-06-28 16:44:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1321', '1', '1', '3', '2013-06-28 16:48:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1322', '1', '1', '3', '2013-06-28 16:51:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1323', '1', '1', '3', '2013-06-28 16:51:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1324', '1', '1', '3', '2013-06-28 16:52:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1325', '1', '1', '3', '2013-06-28 16:53:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1326', '1', '1', '3', '2013-06-28 16:53:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1327', '1', '1', '3', '2013-06-28 16:53:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1328', '1', '1', '3', '2013-06-28 16:54:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1329', '1', '1', '3', '2013-06-28 16:54:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1330', '1', '1', '3', '2013-06-28 16:54:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1331', '1', '1', '3', '2013-06-28 16:55:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1332', '1', '1', '3', '2013-06-28 16:59:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1333', '1', '1', '3', '2013-06-28 16:59:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_使用帮助');
INSERT INTO `jc_log` VALUES ('1334', '1', '1', '3', '2013-06-28 17:00:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_关于我们');
INSERT INTO `jc_log` VALUES ('1335', '1', '1', '3', '2013-06-28 17:17:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1336', '1', '1', '3', '2013-06-28 17:17:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_关于我们.html');
INSERT INTO `jc_log` VALUES ('1337', '1', '1', '3', '2013-06-28 17:18:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1338', '1', '1', '3', '2013-06-28 17:18:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_关于我们.html');
INSERT INTO `jc_log` VALUES ('1339', '1', '1', '3', '2013-06-28 17:19:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1340', '1', '1', '3', '2013-06-28 17:20:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_关于我们.html');
INSERT INTO `jc_log` VALUES ('1341', '1', '1', '3', '2013-06-28 17:20:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1342', '1', '1', '3', '2013-06-28 17:21:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_关于我们.html');
INSERT INTO `jc_log` VALUES ('1343', '1', '1', '3', '2013-06-28 17:21:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_关于我们.html');
INSERT INTO `jc_log` VALUES ('1344', '1', '1', '3', '2013-06-28 17:21:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1345', '1', '1', '3', '2013-06-28 17:22:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=85;name=帮助中心');
INSERT INTO `jc_log` VALUES ('1346', '1', '1', '3', '2013-06-28 17:22:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=84;name=联系我们');
INSERT INTO `jc_log` VALUES ('1347', '1', '1', '3', '2013-06-28 17:24:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=85;name=帮助中心');
INSERT INTO `jc_log` VALUES ('1348', '1', '1', '3', '2013-06-28 17:24:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=84;name=联系我们');
INSERT INTO `jc_log` VALUES ('1349', '1', null, '1', '2013-06-28 17:49:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1350', '1', '1', '3', '2013-06-28 17:49:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化1.html');
INSERT INTO `jc_log` VALUES ('1351', '1', '1', '3', '2013-06-28 17:53:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_关于我们.html');
INSERT INTO `jc_log` VALUES ('1352', '1', '1', '3', '2013-06-28 17:53:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1353', '1', '1', '3', '2013-06-28 17:56:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1354', '1', '1', '3', '2013-06-28 17:56:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_关于我们.html');
INSERT INTO `jc_log` VALUES ('1355', '1', '1', '3', '2013-06-28 17:59:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1356', '1', '1', '3', '2013-06-28 18:01:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1357', '1', '1', '3', '2013-06-28 18:01:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1358', '1', '1', '3', '2013-06-28 18:02:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1359', '1', null, '1', '2013-06-29 08:31:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1360', '1', null, '1', '2013-06-29 08:38:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1361', '1', null, '1', '2013-06-29 09:17:30', '192.168.0.105', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1362', '1', null, '1', '2013-06-29 09:46:41', '192.168.0.105', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1363', '1', null, '1', '2013-06-29 09:47:13', '192.168.0.105', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1364', '1', '1', '3', '2013-06-29 09:58:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=441;title=怎么刷QQ空间人气？');
INSERT INTO `jc_log` VALUES ('1365', '1', '1', '3', '2013-06-29 09:58:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=441;title=怎么刷QQ空间人气？');
INSERT INTO `jc_log` VALUES ('1366', '1', '1', '3', '2013-06-29 09:58:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=440;title=淘流量的工作原理是什么？');
INSERT INTO `jc_log` VALUES ('1367', '1', '1', '3', '2013-06-29 09:59:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=439;title=淘流量可以刷多少流量');
INSERT INTO `jc_log` VALUES ('1368', '1', '1', '3', '2013-06-29 09:59:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=439;title=淘流量可以刷多少流量？');
INSERT INTO `jc_log` VALUES ('1369', '1', '1', '3', '2013-06-29 10:08:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=72;title=null');
INSERT INTO `jc_log` VALUES ('1370', '1', '1', '3', '2013-06-29 10:20:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=444;title=淘流量刷多久流量才有效果');
INSERT INTO `jc_log` VALUES ('1371', '1', '1', '3', '2013-06-29 10:20:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=443;title=为什么有时候用淘流量刷的流量会较少？');
INSERT INTO `jc_log` VALUES ('1372', '1', '1', '3', '2013-06-29 10:21:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=442;title=淘流量很占资源吗');
INSERT INTO `jc_log` VALUES ('1373', '1', '1', '3', '2013-06-29 10:21:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=442;title=淘流量很占资源吗？');
INSERT INTO `jc_log` VALUES ('1374', '1', '1', '3', '2013-06-29 10:21:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=444;title=淘流量刷多久流量才有效果？');
INSERT INTO `jc_log` VALUES ('1375', '1', '1', '3', '2013-06-29 10:22:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=447;title=简单');
INSERT INTO `jc_log` VALUES ('1376', '1', '1', '3', '2013-06-29 10:26:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=61;name=产品应用');
INSERT INTO `jc_log` VALUES ('1377', '1', '1', '3', '2013-06-29 10:37:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=公司网站无访问流量，人气不好，实力遭怀疑');
INSERT INTO `jc_log` VALUES ('1378', '1', '1', '3', '2013-06-29 10:38:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=网店没人气，客户不信任，不愿意下单');
INSERT INTO `jc_log` VALUES ('1379', '1', '1', '3', '2013-06-29 10:38:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=网站Alexa排名低，投资商不满意 ');
INSERT INTO `jc_log` VALUES ('1380', '1', '1', '3', '2013-06-29 10:39:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=网站流量低，拉不到广告赞助商，没有收入');
INSERT INTO `jc_log` VALUES ('1381', '1', '1', '3', '2013-06-29 10:39:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=更多神秘功能？');
INSERT INTO `jc_log` VALUES ('1382', '1', '1', '3', '2013-06-29 10:41:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=网店没人气，客户不信任，不愿意下单');
INSERT INTO `jc_log` VALUES ('1383', '1', '1', '3', '2013-06-29 10:42:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=网站Alexa排名低，投资商不满意 ');
INSERT INTO `jc_log` VALUES ('1384', '1', '1', '3', '2013-06-29 10:45:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1385', '1', '1', '3', '2013-06-29 10:49:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=347;title=提高了网页点击坐标的准确度');
INSERT INTO `jc_log` VALUES ('1386', '1', '1', '3', '2013-06-29 10:50:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=348;title=优化了自动清除缓存文件的效率');
INSERT INTO `jc_log` VALUES ('1387', '1', '1', '3', '2013-06-29 10:50:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=349;title=增加了独立的刷QQ空间人气功能，效率高速度快');
INSERT INTO `jc_log` VALUES ('1388', '1', '1', '3', '2013-06-29 10:50:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=350;title=修正了在某些情况下，搜索引擎列表无法显示的问题');
INSERT INTO `jc_log` VALUES ('1389', '1', '1', '3', '2013-06-29 10:53:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=347;title=新增对JavaScript链接的点击功能');
INSERT INTO `jc_log` VALUES ('1390', '1', '1', '3', '2013-06-29 10:54:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=347;title=新增对JavaScript链接的点击功能');
INSERT INTO `jc_log` VALUES ('1391', '1', '1', '3', '2013-06-29 10:56:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=公司网站无访问流量，人气不好，实力遭怀疑');
INSERT INTO `jc_log` VALUES ('1392', '1', '1', '3', '2013-06-29 10:56:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=网店没人气，客户不信任，不愿意下单');
INSERT INTO `jc_log` VALUES ('1393', '1', '1', '3', '2013-06-29 10:57:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=网站流量低，拉不到广告赞助商，没有收入');
INSERT INTO `jc_log` VALUES ('1394', '1', '1', '3', '2013-06-29 10:59:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1395', '1', '1', '3', '2013-06-29 11:29:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=公司网站无访问流量，人气不好，实力遭怀疑');
INSERT INTO `jc_log` VALUES ('1396', '1', '1', '3', '2013-06-29 11:29:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=网店没人气，客户不信任，不愿意下单');
INSERT INTO `jc_log` VALUES ('1397', '1', '1', '3', '2013-06-29 11:29:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=网站Alexa排名低，投资商不满意 ');
INSERT INTO `jc_log` VALUES ('1398', '1', '1', '3', '2013-06-29 11:29:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=网站流量低，拉不到广告赞助商，没有收入');
INSERT INTO `jc_log` VALUES ('1399', '1', '1', '3', '2013-06-29 11:30:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=更多神秘功能？');
INSERT INTO `jc_log` VALUES ('1400', '1', '1', '3', '2013-06-29 11:31:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=公司网站无访问流量，人气不好，实力遭怀疑');
INSERT INTO `jc_log` VALUES ('1401', '1', '1', '3', '2013-06-29 11:31:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=网店没人气，客户不信任，不愿意下单');
INSERT INTO `jc_log` VALUES ('1402', '1', '1', '3', '2013-06-29 11:31:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=网站Alexa排名低，投资商不满意 ');
INSERT INTO `jc_log` VALUES ('1403', '1', '1', '3', '2013-06-29 11:31:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=网站流量低，拉不到广告赞助商，没有收入');
INSERT INTO `jc_log` VALUES ('1404', '1', '1', '3', '2013-06-29 11:31:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=更多神秘功能？');
INSERT INTO `jc_log` VALUES ('1405', '1', '1', '3', '2013-06-29 11:42:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=347;title=新增对JavaScript链接的点击功能');
INSERT INTO `jc_log` VALUES ('1406', '1', '1', '3', '2013-06-29 11:59:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=401;title=首页的图片1');
INSERT INTO `jc_log` VALUES ('1407', '1', '1', '3', '2013-06-29 12:00:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=403;title=首页图片3');
INSERT INTO `jc_log` VALUES ('1408', '1', '1', '3', '2013-06-29 12:00:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=402;title=首页图片2');
INSERT INTO `jc_log` VALUES ('1409', '1', '1', '3', '2013-06-29 12:02:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=436;title=首页图片4');
INSERT INTO `jc_log` VALUES ('1410', '1', '1', '3', '2013-06-29 12:02:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=403;title=首页图片3');
INSERT INTO `jc_log` VALUES ('1411', '1', '1', '3', '2013-06-29 12:02:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=402;title=首页图片2');
INSERT INTO `jc_log` VALUES ('1412', '1', '1', '3', '2013-06-29 12:02:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=401;title=首页的图片1');
INSERT INTO `jc_log` VALUES ('1413', '1', '1', '3', '2013-06-29 12:03:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=436;title=首页图片4');
INSERT INTO `jc_log` VALUES ('1414', '1', '1', '3', '2013-06-29 12:03:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=403;title=首页图片3');
INSERT INTO `jc_log` VALUES ('1415', '1', '1', '3', '2013-06-29 12:03:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=402;title=首页图片2');
INSERT INTO `jc_log` VALUES ('1416', '1', '1', '3', '2013-06-29 12:03:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=401;title=首页的图片1');
INSERT INTO `jc_log` VALUES ('1417', '1', '1', '3', '2013-06-29 12:03:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=402;title=首页图片2');
INSERT INTO `jc_log` VALUES ('1418', '1', '1', '3', '2013-06-29 12:03:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=403;title=首页图片3');
INSERT INTO `jc_log` VALUES ('1419', '1', '1', '3', '2013-06-29 12:03:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=436;title=首页图片4');
INSERT INTO `jc_log` VALUES ('1420', '1', null, '1', '2013-06-29 14:47:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1421', '1', '1', '3', '2013-06-29 15:08:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1422', '1', '1', '3', '2013-06-29 15:10:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1423', '1', '1', '3', '2013-06-29 15:26:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1424', '1', '1', '3', '2013-06-29 15:26:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1425', '1', '1', '3', '2013-06-29 15:27:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1426', '1', '1', '3', '2013-06-29 15:33:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1427', '1', '1', '3', '2013-06-29 15:33:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1428', '1', '1', '3', '2013-06-29 15:34:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_关于我们.html');
INSERT INTO `jc_log` VALUES ('1429', '1', '1', '3', '2013-06-29 15:34:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1430', '1', '1', '3', '2013-06-29 15:34:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1431', '1', '1', '3', '2013-06-29 15:34:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1432', '1', '1', '3', '2013-06-29 15:36:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1433', '1', '1', '3', '2013-06-29 15:36:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1434', '1', '1', '3', '2013-06-29 15:36:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1435', '1', '1', '3', '2013-06-29 15:40:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1436', '1', '1', '3', '2013-06-29 15:41:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/content/其他页内容_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1437', '1', '1', '3', '2013-06-29 16:24:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=公司网站无访问流量，人气不好，实力遭怀疑');
INSERT INTO `jc_log` VALUES ('1438', '1', '1', '3', '2013-06-29 16:24:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=网店没人气，客户不信任，不愿意下单');
INSERT INTO `jc_log` VALUES ('1439', '1', '1', '3', '2013-06-29 16:24:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=网站Alexa排名低，投资商不满意 ');
INSERT INTO `jc_log` VALUES ('1440', '1', '1', '3', '2013-06-29 16:25:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=网站流量低，拉不到广告赞助商，没有收入');
INSERT INTO `jc_log` VALUES ('1441', '1', '1', '3', '2013-06-29 16:25:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=更多神秘功能？');
INSERT INTO `jc_log` VALUES ('1442', '1', '1', '3', '2013-06-29 16:33:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1443', '1', '1', '3', '2013-06-29 16:34:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1444', '1', '1', '3', '2013-06-29 16:52:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1445', '1', null, '1', '2013-06-29 17:13:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1446', '1', '1', '3', '2013-06-29 17:15:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1447', '1', '1', '3', '2013-06-29 17:15:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1448', '1', '1', '3', '2013-06-29 17:18:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1449', '1', '1', '3', '2013-06-29 17:21:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1450', '1', '1', '3', '2013-06-29 17:21:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1451', '1', '1', '3', '2013-06-29 17:23:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1452', '1', '1', '3', '2013-06-29 17:25:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1453', '1', '1', '3', '2013-06-29 17:27:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1454', '1', '1', '3', '2013-06-29 17:27:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1455', '1', '1', '3', '2013-06-29 17:29:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1456', '1', '1', '3', '2013-06-29 17:29:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1457', '1', '1', '3', '2013-06-29 17:30:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1458', '1', '1', '3', '2013-06-29 17:36:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1459', '1', '1', '3', '2013-06-29 17:37:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1460', '1', '1', '3', '2013-06-29 17:37:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1461', '1', '1', '3', '2013-06-29 17:39:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1462', '1', '1', '3', '2013-06-29 17:39:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1463', '1', '1', '3', '2013-06-29 17:40:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1464', '1', '1', '3', '2013-06-29 18:00:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1465', '1', null, '1', '2013-07-01 08:39:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1466', '1', '1', '3', '2013-07-01 08:47:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1467', '1', '1', '3', '2013-07-01 08:48:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1468', '1', '1', '3', '2013-07-01 08:48:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1469', '1', '1', '3', '2013-07-01 08:48:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1470', '1', '1', '3', '2013-07-01 08:51:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(改1).html');
INSERT INTO `jc_log` VALUES ('1471', '1', '1', '3', '2013-07-01 08:51:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(改1).html');
INSERT INTO `jc_log` VALUES ('1472', '1', '1', '3', '2013-07-01 08:51:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(改1).html');
INSERT INTO `jc_log` VALUES ('1473', '1', '1', '3', '2013-07-01 08:51:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1474', '1', '1', '3', '2013-07-01 08:53:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1475', '1', '1', '3', '2013-07-01 08:54:12', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1476', '1', '1', '3', '2013-07-01 09:03:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1477', '1', '1', '3', '2013-07-01 09:04:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1478', '1', '1', '3', '2013-07-01 09:05:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1479', '1', '1', '3', '2013-07-01 09:05:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1480', '1', '1', '3', '2013-07-01 09:09:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1481', '1', '1', '3', '2013-07-01 09:12:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1482', '1', '1', '3', '2013-07-01 09:13:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1483', '1', '1', '3', '2013-07-01 09:13:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1484', '1', '1', '3', '2013-07-01 09:16:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1485', '1', '1', '3', '2013-07-01 09:17:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1486', '1', null, '1', '2013-07-01 09:21:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1487', '1', '1', '3', '2013-07-01 09:21:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1488', '1', '1', '3', '2013-07-01 09:24:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1489', '1', '1', '3', '2013-07-01 09:25:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1490', '1', '1', '3', '2013-07-01 09:27:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1491', '1', '1', '3', '2013-07-01 09:28:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1492', '1', '1', '3', '2013-07-01 09:31:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1493', '1', '1', '3', '2013-07-01 09:31:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1494', '1', '1', '3', '2013-07-01 09:35:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1495', '1', '1', '3', '2013-07-01 09:40:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1496', '1', '1', '3', '2013-07-01 09:41:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1497', '1', '1', '3', '2013-07-01 09:41:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1498', '1', '1', '3', '2013-07-01 09:41:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1499', '1', '1', '3', '2013-07-01 09:42:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1500', '1', '1', '3', '2013-07-01 09:43:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1501', '1', '1', '3', '2013-07-01 09:44:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1502', '1', '1', '3', '2013-07-01 09:45:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1503', '1', '1', '3', '2013-07-01 09:45:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1504', '1', '1', '3', '2013-07-01 09:47:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1505', '1', '1', '3', '2013-07-01 09:47:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1506', '1', '1', '3', '2013-07-01 09:53:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1507', '1', '1', '3', '2013-07-01 09:54:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1508', '1', '1', '3', '2013-07-01 09:55:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1509', '1', '1', '3', '2013-07-01 09:55:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1510', '1', '1', '3', '2013-07-01 09:58:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1511', '1', '1', '3', '2013-07-01 09:59:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1512', '1', '1', '3', '2013-07-01 10:18:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1513', '1', '1', '3', '2013-07-01 10:18:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1514', '1', '1', '3', '2013-07-01 10:19:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1515', '1', '1', '3', '2013-07-01 10:19:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1516', '1', '1', '3', '2013-07-01 10:20:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1517', '1', '1', '3', '2013-07-01 10:21:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1518', '1', '1', '3', '2013-07-01 10:21:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1519', '1', '1', '3', '2013-07-01 10:22:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1520', '1', '1', '3', '2013-07-01 10:22:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1521', '1', '1', '3', '2013-07-01 10:23:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1522', '1', '1', '3', '2013-07-01 10:23:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1523', '1', '1', '3', '2013-07-01 10:25:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1524', '1', '1', '3', '2013-07-01 10:31:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1525', '1', '1', '3', '2013-07-01 11:08:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1526', '1', '1', '3', '2013-07-01 11:09:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1527', '1', '1', '3', '2013-07-01 11:10:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1528', '1', '1', '3', '2013-07-01 11:12:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1529', '1', '1', '3', '2013-07-01 11:13:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1530', '1', '1', '3', '2013-07-01 11:15:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1531', '1', '1', '3', '2013-07-01 11:17:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1532', '1', '1', '3', '2013-07-01 11:23:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1533', '1', '1', '3', '2013-07-01 11:25:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1534', '1', '1', '3', '2013-07-01 11:27:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1535', '1', '1', '3', '2013-07-01 11:27:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1536', '1', '1', '3', '2013-07-01 11:28:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1537', '1', null, '1', '2013-07-01 14:05:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1538', '1', '1', '3', '2013-07-01 14:32:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1539', '1', '1', '3', '2013-07-01 14:33:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1540', '1', '1', '3', '2013-07-01 14:34:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1541', '1', '1', '3', '2013-07-01 14:34:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1542', '1', '1', '3', '2013-07-01 14:36:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1543', '1', '1', '3', '2013-07-01 14:36:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1544', '1', '1', '3', '2013-07-01 14:49:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1545', '1', '1', '3', '2013-07-01 14:49:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1546', '1', '1', '3', '2013-07-01 14:54:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1547', '1', '1', '3', '2013-07-01 14:54:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1548', '1', '1', '3', '2013-07-01 15:02:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1549', '1', '1', '3', '2013-07-01 15:03:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1550', '1', '1', '3', '2013-07-01 15:03:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1551', '1', '1', '3', '2013-07-01 15:04:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1552', '1', '1', '3', '2013-07-01 15:04:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1553', '1', '1', '3', '2013-07-01 15:09:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1554', '1', '1', '3', '2013-07-01 15:10:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1555', '1', '1', '3', '2013-07-01 15:10:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1556', '1', '1', '3', '2013-07-01 15:17:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1557', '1', null, '1', '2013-07-02 16:36:56', '192.168.0.107', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1558', '1', null, '1', '2013-07-03 10:44:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1559', '1', '1', '3', '2013-07-03 10:46:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/2709295902jh.png');
INSERT INTO `jc_log` VALUES ('1560', '1', '1', '3', '2013-07-03 10:46:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/27093029my1h.png');
INSERT INTO `jc_log` VALUES ('1561', '1', '1', '3', '2013-07-03 10:46:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/270930445437.png');
INSERT INTO `jc_log` VALUES ('1562', '1', '1', '3', '2013-07-03 10:46:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/2709310363gt.png');
INSERT INTO `jc_log` VALUES ('1563', '1', '1', '3', '2013-07-03 10:46:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/270931502ama.png');
INSERT INTO `jc_log` VALUES ('1564', '1', '1', '3', '2013-07-03 10:46:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/2709331824vu.png');
INSERT INTO `jc_log` VALUES ('1565', '1', '1', '3', '2013-07-03 10:46:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/27114209aalu.gif');
INSERT INTO `jc_log` VALUES ('1566', '1', '1', '3', '2013-07-03 11:34:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(改1).html');
INSERT INTO `jc_log` VALUES ('1567', '1', '1', '3', '2013-07-03 11:34:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(改1).html');
INSERT INTO `jc_log` VALUES ('1568', '1', '1', '3', '2013-07-03 11:35:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1569', '1', '1', '3', '2013-07-03 11:37:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1570', '1', '1', '3', '2013-07-03 11:38:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/home.css');
INSERT INTO `jc_log` VALUES ('1571', '1', null, '1', '2013-07-03 14:36:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1572', '1', '1', '3', '2013-07-03 14:48:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/home.css');
INSERT INTO `jc_log` VALUES ('1573', '1', '1', '3', '2013-07-03 14:52:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1574', '1', '1', '3', '2013-07-03 14:55:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1575', '1', '1', '3', '2013-07-03 14:55:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1576', '1', '1', '3', '2013-07-03 15:00:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=87;title=null');
INSERT INTO `jc_log` VALUES ('1577', '1', '1', '3', '2013-07-03 15:12:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=88;title=null');
INSERT INTO `jc_log` VALUES ('1578', '1', '1', '3', '2013-07-03 15:14:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=449;title=浅析Alexa的搜索分析功能');
INSERT INTO `jc_log` VALUES ('1579', '1', '1', '3', '2013-07-03 15:15:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=450;title=火爆的人气与有限的流量');
INSERT INTO `jc_log` VALUES ('1580', '1', '1', '3', '2013-07-03 15:16:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=451;title=网站刷流量不可放弃内容建设');
INSERT INTO `jc_log` VALUES ('1581', '1', '1', '3', '2013-07-03 15:16:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=452;title=各大门户网站的流量情况');
INSERT INTO `jc_log` VALUES ('1582', '1', '1', '3', '2013-07-03 15:17:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=453;title=网站刷流量与移动手机刷流量的区别');
INSERT INTO `jc_log` VALUES ('1583', '1', '1', '3', '2013-07-03 15:17:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=454;title=网店宝贝如何选择关键词进行刷流量');
INSERT INTO `jc_log` VALUES ('1584', '1', '1', '3', '2013-07-03 15:20:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=455;title=提高了网页点击坐标的准确度');
INSERT INTO `jc_log` VALUES ('1585', '1', '1', '3', '2013-07-03 15:21:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=456;title=使用淘流量安全吗？');
INSERT INTO `jc_log` VALUES ('1586', '1', '1', '3', '2013-07-03 15:22:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=457;title=为什么360会报毒？');
INSERT INTO `jc_log` VALUES ('1587', '1', '1', '3', '2013-07-03 15:53:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1588', '1', '1', '3', '2013-07-03 15:53:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1589', '1', '1', '3', '2013-07-03 15:53:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1590', '1', '1', '3', '2013-07-03 15:54:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1591', '1', '1', '3', '2013-07-03 15:54:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1592', '1', '1', '3', '2013-07-03 15:55:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1593', '1', '1', '3', '2013-07-03 15:55:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1594', '1', '1', '3', '2013-07-03 15:56:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1595', '1', '1', '3', '2013-07-03 15:58:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1596', '1', '1', '3', '2013-07-03 15:58:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1597', '1', '1', '3', '2013-07-03 15:59:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1598', '1', '1', '3', '2013-07-03 16:00:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1599', '1', '1', '3', '2013-07-03 16:01:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1600', '1', '1', '3', '2013-07-03 16:01:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(新).html');
INSERT INTO `jc_log` VALUES ('1601', '1', '1', '3', '2013-07-03 16:05:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1602', '1', '1', '3', '2013-07-03 16:34:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1603', '1', '1', '3', '2013-07-03 16:42:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1604', '1', null, '1', '2013-07-18 15:49:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1605', '1', '1', '3', '2013-07-18 15:50:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1606', '1', '1', '3', '2013-07-18 15:50:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1607', '1', '1', '3', '2013-07-18 15:53:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1608', '1', '1', '3', '2013-07-18 15:55:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1609', '1', '1', '3', '2013-07-18 15:58:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1610', '1', '1', '3', '2013-07-18 15:58:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1611', '1', null, '1', '2013-07-30 09:47:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1612', '1', '1', '3', '2013-07-30 09:48:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=85;name=使用帮助');
INSERT INTO `jc_log` VALUES ('1613', '1', '1', '3', '2013-07-30 09:49:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=84;title=null');
INSERT INTO `jc_log` VALUES ('1614', '1', '1', '3', '2013-07-30 10:07:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/27145642u1h4.gif');
INSERT INTO `jc_log` VALUES ('1615', '1', '1', '3', '2013-07-30 10:07:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/271457007epq.gif');
INSERT INTO `jc_log` VALUES ('1616', '1', '1', '3', '2013-07-30 10:07:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/271457271w75.gif');
INSERT INTO `jc_log` VALUES ('1617', '1', '1', '3', '2013-07-30 10:07:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/271457402qpp.gif');
INSERT INTO `jc_log` VALUES ('1618', '1', '1', '3', '2013-07-30 10:07:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/291129154y3i.png');
INSERT INTO `jc_log` VALUES ('1619', '1', '1', '3', '2013-07-30 10:07:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/29112932r8e1.png');
INSERT INTO `jc_log` VALUES ('1620', '1', '1', '3', '2013-07-30 10:07:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/2911294291mt.png');
INSERT INTO `jc_log` VALUES ('1621', '1', '1', '3', '2013-07-30 10:07:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/29112951h38x.png');
INSERT INTO `jc_log` VALUES ('1622', '1', '1', '3', '2013-07-30 10:07:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/29113025ikic.png');
INSERT INTO `jc_log` VALUES ('1623', '1', '1', '3', '2013-07-30 10:07:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306/29114210flqd.png');
INSERT INTO `jc_log` VALUES ('1624', '1', '1', '3', '2013-07-30 10:07:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201306');
INSERT INTO `jc_log` VALUES ('1625', '1', '1', '3', '2013-07-30 10:15:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=82;title=null');
INSERT INTO `jc_log` VALUES ('1626', '1', '1', '3', '2013-07-30 10:16:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=83;title=null');
INSERT INTO `jc_log` VALUES ('1627', '1', '1', '3', '2013-07-30 10:17:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=89;title=null');
INSERT INTO `jc_log` VALUES ('1628', '1', '1', '3', '2013-07-30 10:17:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=89;name=常见问题');
INSERT INTO `jc_log` VALUES ('1629', '1', '1', '3', '2013-07-30 10:18:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=90;title=null');
INSERT INTO `jc_log` VALUES ('1630', '1', '1', '3', '2013-07-30 10:18:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=64;name=使用帮助');
INSERT INTO `jc_log` VALUES ('1631', '1', '1', '3', '2013-07-30 10:21:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=88;title=null');
INSERT INTO `jc_log` VALUES ('1632', '1', '1', '3', '2013-07-30 10:22:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=350;title=修正了在某些情况下，搜索引擎列表无法显示的问题');
INSERT INTO `jc_log` VALUES ('1633', '1', '1', '3', '2013-07-30 10:22:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=349;title=增加了独立的刷QQ空间人气功能，效率高速度快');
INSERT INTO `jc_log` VALUES ('1634', '1', '1', '3', '2013-07-30 10:23:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=348;title=优化了自动清除缓存文件的效率');
INSERT INTO `jc_log` VALUES ('1635', '1', '1', '3', '2013-07-30 10:23:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=347;title=新增对JavaScript链接的点击功能');
INSERT INTO `jc_log` VALUES ('1636', '1', '1', '3', '2013-07-30 10:23:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=62;title=null');
INSERT INTO `jc_log` VALUES ('1637', '1', '1', '3', '2013-07-30 10:24:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=63;title=电脑');
INSERT INTO `jc_log` VALUES ('1638', '1', '1', '3', '2013-07-30 10:25:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=64;title=计算机介绍');
INSERT INTO `jc_log` VALUES ('1639', '1', '1', '3', '2013-07-30 10:26:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('1640', '1', '1', '3', '2013-07-30 10:27:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=61;name=产品介绍');
INSERT INTO `jc_log` VALUES ('1641', '1', '1', '3', '2013-07-30 10:27:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=61;name=产品介绍');
INSERT INTO `jc_log` VALUES ('1642', '1', '1', '3', '2013-07-30 10:27:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=87;name=功能介绍');
INSERT INTO `jc_log` VALUES ('1643', '1', '1', '3', '2013-07-30 10:28:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=87;name=知识文库');
INSERT INTO `jc_log` VALUES ('1644', '1', '1', '3', '2013-07-30 10:37:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=60;name=首页图片');
INSERT INTO `jc_log` VALUES ('1645', '1', '1', '3', '2013-07-30 10:41:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=免费提升流量');
INSERT INTO `jc_log` VALUES ('1646', '1', '1', '3', '2013-07-30 11:03:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页(旧).html');
INSERT INTO `jc_log` VALUES ('1647', '1', '1', '3', '2013-07-30 11:03:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页1.html');
INSERT INTO `jc_log` VALUES ('1648', '1', '1', '3', '2013-07-30 11:42:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1649', '1', '1', '3', '2013-07-30 11:44:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1650', '1', '1', '3', '2013-07-30 11:46:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_delete_single.do', '删除资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1651', '1', '1', '3', '2013-07-30 11:46:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_delete_single.do', '删除资源', 'filename=/r/cms/www/liured/css/lanrenzhijia.css');
INSERT INTO `jc_log` VALUES ('1652', '1', '1', '3', '2013-07-30 11:55:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1653', '1', '1', '3', '2013-07-30 11:55:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1654', '1', '1', '3', '2013-07-30 11:59:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1655', '1', null, '1', '2013-07-30 14:20:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1656', '1', '1', '3', '2013-07-30 14:25:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=448;title=成长');
INSERT INTO `jc_log` VALUES ('1657', '1', '1', '3', '2013-07-30 14:26:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=447;title=简单');
INSERT INTO `jc_log` VALUES ('1658', '1', '1', '3', '2013-07-30 14:27:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=446;title=安全');
INSERT INTO `jc_log` VALUES ('1659', '1', '1', '3', '2013-07-30 14:27:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=445;title=专业');
INSERT INTO `jc_log` VALUES ('1660', '1', '1', '3', '2013-07-30 14:28:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=458;title=会计方法估计哦加入激光焊接寄gh');
INSERT INTO `jc_log` VALUES ('1661', '1', '1', '3', '2013-07-30 14:28:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=459;title=会计方法估计哦加入激光焊接寄gh');
INSERT INTO `jc_log` VALUES ('1662', '1', '1', '3', '2013-07-30 14:28:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=460;title=会计方法估计哦加入激光焊接寄gh');
INSERT INTO `jc_log` VALUES ('1663', '1', '1', '3', '2013-07-30 14:28:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=461;title=会计方法估计哦加入激光焊接寄gh');
INSERT INTO `jc_log` VALUES ('1664', '1', '1', '3', '2013-07-30 14:28:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=462;title=会计方法估计哦加入激光焊接寄gh');
INSERT INTO `jc_log` VALUES ('1665', '1', '1', '3', '2013-07-30 14:28:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=463;title=会计方法估计哦加入激光焊接寄gh');
INSERT INTO `jc_log` VALUES ('1666', '1', '1', '3', '2013-07-30 14:29:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=464;title=会计方法估计哦加入激光焊接寄gh');
INSERT INTO `jc_log` VALUES ('1667', '1', '1', '3', '2013-07-30 14:29:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=465;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1668', '1', '1', '3', '2013-07-30 14:29:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=466;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1669', '1', '1', '3', '2013-07-30 14:29:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=467;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1670', '1', '1', '3', '2013-07-30 14:29:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=468;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1671', '1', '1', '3', '2013-07-30 14:29:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=469;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1672', '1', '1', '3', '2013-07-30 14:29:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=470;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1673', '1', '1', '3', '2013-07-30 14:29:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=471;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1674', '1', '1', '3', '2013-07-30 14:30:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=472;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1675', '1', '1', '3', '2013-07-30 14:30:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=473;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1676', '1', '1', '3', '2013-07-30 14:30:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=474;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1677', '1', '1', '3', '2013-07-30 14:30:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=475;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1678', '1', '1', '3', '2013-07-30 14:30:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=476;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1679', '1', '1', '3', '2013-07-30 14:30:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=477;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1680', '1', '1', '3', '2013-07-30 14:30:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=478;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1681', '1', '1', '3', '2013-07-30 14:32:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1682', '1', '1', '3', '2013-07-30 14:34:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=479;title=添加多任务执行');
INSERT INTO `jc_log` VALUES ('1683', '1', '1', '3', '2013-07-30 14:35:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=真实有效');
INSERT INTO `jc_log` VALUES ('1684', '1', '1', '3', '2013-07-30 14:35:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=绿色安全');
INSERT INTO `jc_log` VALUES ('1685', '1', '1', '3', '2013-07-30 14:35:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=平台控制精准');
INSERT INTO `jc_log` VALUES ('1686', '1', '1', '3', '2013-07-30 14:36:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=更多神秘功能？');
INSERT INTO `jc_log` VALUES ('1687', '1', '1', '3', '2013-07-30 14:37:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=平台控制精准');
INSERT INTO `jc_log` VALUES ('1688', '1', '1', '3', '2013-07-30 14:37:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=绿色安全');
INSERT INTO `jc_log` VALUES ('1689', '1', '1', '3', '2013-07-30 14:37:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=真实有效');
INSERT INTO `jc_log` VALUES ('1690', '1', '1', '3', '2013-07-30 14:37:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=免费提升流量');
INSERT INTO `jc_log` VALUES ('1691', '1', '1', '3', '2013-07-30 14:38:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=479;title=添加多任务执行');
INSERT INTO `jc_log` VALUES ('1692', '1', '1', '3', '2013-07-30 14:38:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=479;title=添加多任务执行');
INSERT INTO `jc_log` VALUES ('1693', '1', '1', '3', '2013-07-30 14:40:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=479;title=添加多任务执行');
INSERT INTO `jc_log` VALUES ('1694', '1', '1', '3', '2013-07-30 15:05:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=448;title=成长');
INSERT INTO `jc_log` VALUES ('1695', '1', '1', '3', '2013-07-30 15:05:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=447;title=简单');
INSERT INTO `jc_log` VALUES ('1696', '1', '1', '3', '2013-07-30 15:05:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=446;title=安全');
INSERT INTO `jc_log` VALUES ('1697', '1', '1', '3', '2013-07-30 15:05:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=445;title=专业');
INSERT INTO `jc_log` VALUES ('1698', '1', '1', '3', '2013-07-30 15:08:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1699', '1', '1', '3', '2013-07-30 15:11:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1700', '1', '1', '3', '2013-07-30 15:56:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1701', '1', '1', '3', '2013-07-30 16:00:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1702', '1', '1', '3', '2013-07-30 16:00:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1703', '1', '1', '3', '2013-07-30 16:17:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1704', '1', '1', '3', '2013-07-30 16:17:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1705', '1', '1', '3', '2013-07-30 16:17:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1706', '1', '1', '3', '2013-07-30 16:18:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1707', '1', '1', '3', '2013-07-30 16:18:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1708', '1', '1', '3', '2013-07-30 16:20:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1709', '1', '1', '3', '2013-07-30 16:26:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_delete_single.do', '删除资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1710', '1', '1', '3', '2013-07-30 16:27:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_delete_single.do', '删除资源', 'filename=/r/cms/www/liured/css/lanrenzhijia.css');
INSERT INTO `jc_log` VALUES ('1711', '1', '1', '3', '2013-07-30 16:27:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_delete_single.do', '删除资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1712', '1', '1', '3', '2013-07-30 16:32:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1713', '1', '1', '3', '2013-07-30 16:32:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1714', '1', '1', '3', '2013-07-30 16:32:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1715', '1', '1', '3', '2013-07-30 16:32:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1716', '1', '1', '3', '2013-07-30 16:32:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1717', '1', '1', '3', '2013-07-30 16:34:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1718', '1', '1', '3', '2013-07-30 16:34:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1719', '1', '1', '3', '2013-07-30 16:35:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1720', '1', '1', '3', '2013-07-30 16:36:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1721', '1', '1', '3', '2013-07-30 16:38:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/alone');
INSERT INTO `jc_log` VALUES ('1722', '1', '1', '3', '2013-07-30 16:44:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=会员注册');
INSERT INTO `jc_log` VALUES ('1723', '1', '1', '3', '2013-07-30 16:44:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=修改密码');
INSERT INTO `jc_log` VALUES ('1724', '1', '1', '3', '2013-07-30 16:46:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/member/修改密码.html');
INSERT INTO `jc_log` VALUES ('1725', '1', '1', '3', '2013-07-30 16:48:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/member/会员注册.html');
INSERT INTO `jc_log` VALUES ('1726', '1', '1', '3', '2013-07-30 16:49:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/member/找回密码.html');
INSERT INTO `jc_log` VALUES ('1727', '1', '1', '3', '2013-07-30 16:49:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/member/找回密码.html');
INSERT INTO `jc_log` VALUES ('1728', '1', '1', '3', '2013-07-30 16:49:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/member/会员注册.html');
INSERT INTO `jc_log` VALUES ('1729', '1', '1', '3', '2013-07-30 16:49:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/member/会员注册.html');
INSERT INTO `jc_log` VALUES ('1730', '1', '1', '3', '2013-07-30 16:50:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/member/会员注册.html');
INSERT INTO `jc_log` VALUES ('1731', '1', '1', '3', '2013-07-30 16:50:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/member/找回密码.html');
INSERT INTO `jc_log` VALUES ('1732', '1', '1', '3', '2013-07-30 16:53:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=91;title=null');
INSERT INTO `jc_log` VALUES ('1733', '1', '1', '3', '2013-07-30 16:53:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=92;title=null');
INSERT INTO `jc_log` VALUES ('1734', '1', '1', '3', '2013-07-30 16:54:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=91;name=会员注册');
INSERT INTO `jc_log` VALUES ('1735', '1', '1', '3', '2013-07-30 16:55:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=首页栏目管理_会员注册');
INSERT INTO `jc_log` VALUES ('1736', '1', '1', '3', '2013-07-30 16:56:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_会员注册.html');
INSERT INTO `jc_log` VALUES ('1737', '1', '1', '3', '2013-07-30 16:56:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码.html');
INSERT INTO `jc_log` VALUES ('1738', '1', '1', '3', '2013-07-30 16:56:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/member');
INSERT INTO `jc_log` VALUES ('1739', '1', '1', '3', '2013-07-30 16:57:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=91;name=会员注册');
INSERT INTO `jc_log` VALUES ('1740', '1', '1', '3', '2013-07-30 16:57:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=92;name=找回密码');
INSERT INTO `jc_log` VALUES ('1741', '1', '1', '3', '2013-07-30 16:57:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=92;name=找回密码');
INSERT INTO `jc_log` VALUES ('1742', '1', '1', '3', '2013-07-30 16:57:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=91;name=会员注册');
INSERT INTO `jc_log` VALUES ('1743', '1', '1', '3', '2013-07-30 16:58:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=92;name=找回密码');
INSERT INTO `jc_log` VALUES ('1744', '1', '1', '3', '2013-07-30 16:59:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1745', '1', '1', '3', '2013-07-30 17:00:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1746', '1', '1', '3', '2013-07-30 17:00:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1747', '1', '1', '3', '2013-07-30 17:03:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1748', '1', '1', '3', '2013-07-30 17:04:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_会员注册.html');
INSERT INTO `jc_log` VALUES ('1749', '1', '1', '3', '2013-07-30 17:09:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码.html');
INSERT INTO `jc_log` VALUES ('1750', '1', '1', '3', '2013-07-30 17:09:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码.html');
INSERT INTO `jc_log` VALUES ('1751', '1', '1', '3', '2013-07-30 17:12:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码.html');
INSERT INTO `jc_log` VALUES ('1752', '1', '1', '3', '2013-07-30 17:14:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码.html');
INSERT INTO `jc_log` VALUES ('1753', '1', '1', '3', '2013-07-30 17:19:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1754', '1', '1', '3', '2013-07-30 17:19:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1755', '1', '1', '3', '2013-07-30 17:20:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1756', '1', '1', '3', '2013-07-30 17:20:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1757', '1', '1', '3', '2013-07-30 17:24:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1758', '1', '1', '3', '2013-07-30 17:25:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1759', '1', '1', '3', '2013-07-30 17:42:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码.html');
INSERT INTO `jc_log` VALUES ('1760', '1', '1', '3', '2013-07-30 17:59:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1761', '1', '1', '3', '2013-07-30 18:00:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1762', '1', '1', '3', '2013-07-30 18:02:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1763', '1', '1', '3', '2013-07-30 18:07:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=其他页栏目_免费提升流量');
INSERT INTO `jc_log` VALUES ('1764', '1', '1', '3', '2013-07-30 18:10:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1765', '1', '1', '3', '2013-07-30 18:13:03', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1766', '1', '1', '3', '2013-07-30 18:14:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1767', '1', '1', '3', '2013-07-30 18:18:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1768', '1', '1', '3', '2013-07-30 18:18:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1769', '1', '1', '3', '2013-07-30 18:19:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1770', '1', '1', '3', '2013-07-30 18:19:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1771', '1', '1', '3', '2013-07-30 18:21:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1772', '1', '1', '3', '2013-07-30 18:21:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1773', '1', '1', '3', '2013-07-30 18:21:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1774', '1', null, '1', '2013-07-31 09:38:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1775', '1', '1', '3', '2013-07-31 09:42:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=89;name=常见问题');
INSERT INTO `jc_log` VALUES ('1776', '1', '1', '3', '2013-07-31 10:03:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=81;name=网站流量优化');
INSERT INTO `jc_log` VALUES ('1777', '1', '1', '3', '2013-07-31 10:04:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1778', '1', '1', '3', '2013-07-31 10:04:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1779', '1', '1', '3', '2013-07-31 10:06:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1780', '1', '1', '3', '2013-07-31 10:10:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1781', '1', '1', '3', '2013-07-31 10:14:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=425;title=少打飞机阿迪神经分裂卡仕达思考副经理');
INSERT INTO `jc_log` VALUES ('1782', '1', '1', '3', '2013-07-31 10:14:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=424;title=的撒副科级多少了放假斯蒂芬金阿斯顿发');
INSERT INTO `jc_log` VALUES ('1783', '1', '1', '3', '2013-07-31 10:14:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=423;title=斯蒂芬金克里斯');
INSERT INTO `jc_log` VALUES ('1784', '1', '1', '3', '2013-07-31 10:17:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=425;title=少打飞机阿迪神经分裂卡仕达思考副经理');
INSERT INTO `jc_log` VALUES ('1785', '1', '1', '3', '2013-07-31 10:17:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=424;title=的撒副科级多少了放假斯蒂芬金阿斯顿发');
INSERT INTO `jc_log` VALUES ('1786', '1', '1', '3', '2013-07-31 10:17:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=423;title=斯蒂芬金克里斯');
INSERT INTO `jc_log` VALUES ('1787', '1', '1', '3', '2013-07-31 10:18:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=423;title=斯蒂芬金克里斯');
INSERT INTO `jc_log` VALUES ('1788', '1', '1', '3', '2013-07-31 10:19:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=480;title=可不可以同时刷同一个网址很多次');
INSERT INTO `jc_log` VALUES ('1789', '1', '1', '3', '2013-07-31 10:21:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1790', '1', '1', '3', '2013-07-31 10:23:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=481;title=就开始连接方式飞是否是快递费刻录机撒款到即发啊地方');
INSERT INTO `jc_log` VALUES ('1791', '1', '1', '3', '2013-07-31 10:26:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=478;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1792', '1', '1', '3', '2013-07-31 10:26:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=477;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1793', '1', '1', '3', '2013-07-31 10:26:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=476;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1794', '1', '1', '3', '2013-07-31 10:27:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=475;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1795', '1', '1', '3', '2013-07-31 10:27:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=474;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1796', '1', '1', '3', '2013-07-31 10:27:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=471;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1797', '1', '1', '3', '2013-07-31 10:27:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=470;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1798', '1', '1', '3', '2013-07-31 10:27:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=469;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1799', '1', '1', '3', '2013-07-31 10:27:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=468;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1800', '1', '1', '3', '2013-07-31 10:27:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=467;title=为什么尽快发您后天后天然后就');
INSERT INTO `jc_log` VALUES ('1801', '1', '1', '3', '2013-07-31 10:27:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=464;title=会计方法估计哦加入激光焊接寄gh');
INSERT INTO `jc_log` VALUES ('1802', '1', '1', '3', '2013-07-31 10:27:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=463;title=会计方法估计哦加入激光焊接寄gh');
INSERT INTO `jc_log` VALUES ('1803', '1', '1', '3', '2013-07-31 10:28:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=462;title=会计方法估计哦加入激光焊接寄gh');
INSERT INTO `jc_log` VALUES ('1804', '1', '1', '3', '2013-07-31 10:28:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=461;title=会计方法估计哦加入激光焊接寄gh');
INSERT INTO `jc_log` VALUES ('1805', '1', '1', '3', '2013-07-31 10:28:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=460;title=会计方法估计哦加入激光焊接寄gh');
INSERT INTO `jc_log` VALUES ('1806', '1', '1', '3', '2013-07-31 10:31:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1807', '1', '1', '3', '2013-07-31 10:31:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1808', '1', '1', '3', '2013-07-31 10:32:01', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1809', '1', '1', '3', '2013-07-31 10:32:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('1810', '1', '1', '3', '2013-07-31 10:33:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_最新公告.html');
INSERT INTO `jc_log` VALUES ('1811', '1', '1', '3', '2013-07-31 10:34:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=85;name=使用帮助');
INSERT INTO `jc_log` VALUES ('1812', '1', '1', '3', '2013-07-31 10:34:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=90;name=最新公告');
INSERT INTO `jc_log` VALUES ('1813', '1', '1', '3', '2013-07-31 10:35:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1814', '1', '1', '3', '2013-07-31 10:35:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('1815', '1', '1', '3', '2013-07-31 10:35:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_最新公告.html');
INSERT INTO `jc_log` VALUES ('1816', '1', '1', '3', '2013-07-31 10:35:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_最新公告.html');
INSERT INTO `jc_log` VALUES ('1817', '1', '1', '3', '2013-07-31 10:37:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1818', '1', '1', '3', '2013-07-31 10:38:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('1819', '1', '1', '3', '2013-07-31 10:38:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_最新公告.html');
INSERT INTO `jc_log` VALUES ('1820', '1', '1', '3', '2013-07-31 10:39:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目.html');
INSERT INTO `jc_log` VALUES ('1821', '1', '1', '3', '2013-07-31 10:39:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_Alexa排名优化.html');
INSERT INTO `jc_log` VALUES ('1822', '1', '1', '3', '2013-07-31 10:39:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_QQ空间刷人气.html');
INSERT INTO `jc_log` VALUES ('1823', '1', '1', '3', '2013-07-31 10:39:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_会员中心.html');
INSERT INTO `jc_log` VALUES ('1824', '1', '1', '3', '2013-07-31 10:41:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1825', '1', '1', '3', '2013-07-31 10:41:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('1826', '1', '1', '3', '2013-07-31 10:42:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_最新公告.html');
INSERT INTO `jc_log` VALUES ('1827', '1', '1', '3', '2013-07-31 10:42:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_最新公告.html');
INSERT INTO `jc_log` VALUES ('1828', '1', '1', '3', '2013-07-31 10:42:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1829', '1', '1', '3', '2013-07-31 10:43:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1830', '1', '1', '3', '2013-07-31 10:43:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1831', '1', '1', '3', '2013-07-31 10:45:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/topic/o_save.do', '增加专题', 'id=1;name=图片');
INSERT INTO `jc_log` VALUES ('1832', '1', '1', '3', '2013-07-31 10:45:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/topic/o_update.do', '修改专题', 'id=1;name=图片');
INSERT INTO `jc_log` VALUES ('1833', '1', '1', '3', '2013-07-31 10:48:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_save.do', '增加模型', 'id=10;name=首页切换图片');
INSERT INTO `jc_log` VALUES ('1834', '1', '1', '3', '2013-07-31 10:48:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/model/o_update.do', '修改模型', 'id=10;name=首页切换图片');
INSERT INTO `jc_log` VALUES ('1835', '1', '1', '3', '2013-07-31 10:51:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=60;title=null');
INSERT INTO `jc_log` VALUES ('1836', '1', '1', '3', '2013-07-31 10:52:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=93;title=null');
INSERT INTO `jc_log` VALUES ('1837', '1', '1', '3', '2013-07-31 10:54:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=93;name=首页切换的图片');
INSERT INTO `jc_log` VALUES ('1838', '1', '1', '3', '2013-07-31 10:55:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=93;name=首页切换的图片');
INSERT INTO `jc_log` VALUES ('1839', '1', '1', '3', '2013-07-31 10:58:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete_single.do', '删除资源', 'filename=/u/cms/www/201307/311054229ln7.jpg');
INSERT INTO `jc_log` VALUES ('1840', '1', '1', '3', '2013-07-31 10:58:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/file/o_delete_single.do', '删除资源', 'filename=/u/cms/www/201307/31105528v15k.png');
INSERT INTO `jc_log` VALUES ('1841', '1', '1', '3', '2013-07-31 11:04:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=482;title=挂机版');
INSERT INTO `jc_log` VALUES ('1842', '1', '1', '3', '2013-07-31 11:05:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=483;title=刷流量版');
INSERT INTO `jc_log` VALUES ('1843', '1', '1', '3', '2013-07-31 11:08:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1844', '1', '1', '3', '2013-07-31 11:09:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1845', '1', '1', '3', '2013-07-31 11:12:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1846', '1', '1', '3', '2013-07-31 11:12:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1847', '1', '1', '3', '2013-07-31 11:14:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1848', '1', '1', '3', '2013-07-31 11:14:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1849', '1', '1', '3', '2013-07-31 11:14:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1850', '1', '1', '3', '2013-07-31 11:15:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1851', '1', '1', '3', '2013-07-31 11:16:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1852', '1', '1', '3', '2013-07-31 11:21:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=483;title=刷流量版');
INSERT INTO `jc_log` VALUES ('1853', '1', '1', '3', '2013-07-31 11:22:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=482;title=挂机版');
INSERT INTO `jc_log` VALUES ('1854', '1', '1', '3', '2013-07-31 11:22:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1855', '1', '1', '3', '2013-07-31 11:22:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1856', '1', '1', '3', '2013-07-31 11:24:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1857', '1', '1', '3', '2013-07-31 11:26:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1858', '1', '1', '3', '2013-07-31 11:26:43', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1859', '1', '1', '3', '2013-07-31 11:27:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1860', '1', '1', '3', '2013-07-31 11:27:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1861', '1', '1', '3', '2013-07-31 11:28:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1862', '1', '1', '3', '2013-07-31 11:28:21', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('1863', '1', '1', '3', '2013-07-31 11:28:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_最新公告.html');
INSERT INTO `jc_log` VALUES ('1864', '1', '1', '3', '2013-07-31 11:28:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1865', '1', '1', '3', '2013-07-31 11:30:07', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1866', '1', '1', '3', '2013-07-31 11:30:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1867', '1', '1', '3', '2013-07-31 11:30:30', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('1868', '1', '1', '3', '2013-07-31 11:30:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_最新公告.html');
INSERT INTO `jc_log` VALUES ('1869', '1', '1', '3', '2013-07-31 11:30:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1870', '1', '1', '3', '2013-07-31 11:32:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1871', '1', '1', '3', '2013-07-31 11:32:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('1872', '1', '1', '3', '2013-07-31 11:33:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_最新公告.html');
INSERT INTO `jc_log` VALUES ('1873', '1', '1', '3', '2013-07-31 11:42:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1874', '1', '1', '3', '2013-07-31 11:42:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1875', '1', '1', '3', '2013-07-31 11:43:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_使用帮助.html');
INSERT INTO `jc_log` VALUES ('1876', '1', '1', '3', '2013-07-31 11:43:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_免费提升流量.html');
INSERT INTO `jc_log` VALUES ('1877', '1', '1', '3', '2013-07-31 11:44:23', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_常见问题.html');
INSERT INTO `jc_log` VALUES ('1878', '1', '1', '3', '2013-07-31 11:44:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_最新公告.html');
INSERT INTO `jc_log` VALUES ('1879', '1', '1', '3', '2013-07-31 11:44:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1880', '1', '1', '3', '2013-07-31 11:44:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/其他页栏目_网站流量优化.html');
INSERT INTO `jc_log` VALUES ('1881', '1', null, '1', '2013-07-31 15:54:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1882', '1', null, '1', '2013-07-31 17:50:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1883', '1', '1', '3', '2013-07-31 17:54:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_会员注册.html');
INSERT INTO `jc_log` VALUES ('1884', '1', '1', '3', '2013-07-31 17:54:44', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_会员注册.html');
INSERT INTO `jc_log` VALUES ('1885', '1', '1', '3', '2013-07-31 17:59:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1886', '1', '1', '3', '2013-07-31 17:59:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/liured/css/stylesoft.css');
INSERT INTO `jc_log` VALUES ('1887', '1', '1', '3', '2013-07-31 18:10:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_会员注册.html');
INSERT INTO `jc_log` VALUES ('1888', '1', '1', '3', '2013-07-31 18:13:36', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_会员注册.html');
INSERT INTO `jc_log` VALUES ('1889', '1', '1', '3', '2013-07-31 18:13:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_会员注册.html');
INSERT INTO `jc_log` VALUES ('1890', '1', '1', '3', '2013-07-31 18:19:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_会员注册.html');
INSERT INTO `jc_log` VALUES ('1891', '1', '1', '3', '2013-07-31 18:19:55', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_会员注册.html');
INSERT INTO `jc_log` VALUES ('1892', '1', null, '1', '2013-08-01 08:53:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1893', '1', '1', '3', '2013-08-01 08:54:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_会员注册.html');
INSERT INTO `jc_log` VALUES ('1894', '1', '1', '3', '2013-08-01 09:00:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_会员注册.html');
INSERT INTO `jc_log` VALUES ('1895', '1', '1', '3', '2013-08-01 09:27:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1896', '1', null, '1', '2013-08-03 09:33:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1897', null, null, '2', '2013-08-03 09:36:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录失败', 'username=admin;password=19901028');
INSERT INTO `jc_log` VALUES ('1898', '1', null, '1', '2013-08-03 09:36:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1899', '1', null, '1', '2013-08-03 15:23:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1900', '1', null, '1', '2013-08-03 16:14:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1901', '1', null, '1', '2013-08-03 16:52:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1902', '1', '1', '3', '2013-08-03 17:43:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=92;name=找回密码(发送邮箱验证码)');
INSERT INTO `jc_log` VALUES ('1903', '1', '1', '3', '2013-08-03 17:43:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=94;title=null');
INSERT INTO `jc_log` VALUES ('1904', '1', '1', '3', '2013-08-03 17:44:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=首页栏目管理_找回密码1');
INSERT INTO `jc_log` VALUES ('1905', '1', '1', '3', '2013-08-03 17:45:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=首页栏目管理_找回密码2');
INSERT INTO `jc_log` VALUES ('1906', '1', '1', '3', '2013-08-03 17:45:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码1.html');
INSERT INTO `jc_log` VALUES ('1907', '1', '1', '3', '2013-08-03 17:45:54', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码2.html');
INSERT INTO `jc_log` VALUES ('1908', '1', '1', '3', '2013-08-03 17:47:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码1.html');
INSERT INTO `jc_log` VALUES ('1909', '1', '1', '3', '2013-08-03 17:48:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码2.html');
INSERT INTO `jc_log` VALUES ('1910', '1', '1', '3', '2013-08-03 17:48:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码2.html');
INSERT INTO `jc_log` VALUES ('1911', '1', '1', '3', '2013-08-03 17:48:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=92;name=找回密码(发送邮箱验证码)');
INSERT INTO `jc_log` VALUES ('1912', '1', '1', '3', '2013-08-03 17:49:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=94;name=找回密码（设置密码）');
INSERT INTO `jc_log` VALUES ('1913', '1', '1', '3', '2013-08-03 17:50:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1914', '1', '1', '3', '2013-08-03 17:50:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1915', '1', null, '1', '2013-08-03 18:33:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1916', '1', null, '1', '2013-08-03 18:38:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1917', '1', null, '1', '2013-08-05 11:29:27', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1918', '1', null, '1', '2013-08-05 13:12:53', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1919', '1', null, '1', '2013-08-05 13:25:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1920', '1', null, '1', '2013-08-05 13:29:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1921', '1', '1', '3', '2013-08-05 13:30:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/channel/首页栏目管理_找回密码1.html');
INSERT INTO `jc_log` VALUES ('1922', '1', '1', '3', '2013-08-05 14:55:33', '127.0.0.1', '/liuliang/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/liuroot/index/首页.html');
INSERT INTO `jc_log` VALUES ('1923', '1', null, '1', '2013-08-06 09:22:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1924', '1', null, '1', '2013-08-07 14:51:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `jc_log` VALUES ('1925', '1', '1', '3', '2013-08-07 14:53:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=464;title=加强对病毒木马的拦截处理');
INSERT INTO `jc_log` VALUES ('1926', '1', '1', '3', '2013-08-07 14:53:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=463;title=优化软件对系统资源的占用');
INSERT INTO `jc_log` VALUES ('1927', '1', '1', '3', '2013-08-07 14:54:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=462;title=增强网址过滤功能，优化执行效率');
INSERT INTO `jc_log` VALUES ('1928', '1', '1', '3', '2013-08-07 14:54:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=461;title=修改了几处在某些运行环境下可能会出现的崩溃');
INSERT INTO `jc_log` VALUES ('1929', '1', '1', '3', '2013-08-07 14:55:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=460;title=优化了流量模式的执行效率');
INSERT INTO `jc_log` VALUES ('1930', '1', '1', '3', '2013-08-07 14:55:50', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=459;title=屏蔽了提升流量的时候网页里可能存在影响到电脑剪贴板的JS代码');
INSERT INTO `jc_log` VALUES ('1931', '1', '1', '3', '2013-08-07 14:56:13', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=458;title=修复了在某些情况下不提示升级的bug');
INSERT INTO `jc_log` VALUES ('1932', '1', '1', '3', '2013-08-07 14:56:31', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=459;title=屏蔽了网页里可能存在影响到电脑剪贴板的JS代码');
INSERT INTO `jc_log` VALUES ('1933', '1', '1', '3', '2013-08-07 14:57:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=471;title=怎么刷QQ空间人气？');
INSERT INTO `jc_log` VALUES ('1934', '1', '1', '3', '2013-08-07 14:58:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=470;title=为什么流量王开了很久还没流量？');
INSERT INTO `jc_log` VALUES ('1935', '1', '1', '3', '2013-08-07 14:58:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=469;title=流量王的流量是真实IP吗？');
INSERT INTO `jc_log` VALUES ('1936', '1', '1', '3', '2013-08-07 14:59:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=468;title=流量王的工作原理是什么？');
INSERT INTO `jc_log` VALUES ('1937', '1', '1', '3', '2013-08-07 14:59:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=467;title=添加多个任务流量会成倍增加吗？');
INSERT INTO `jc_log` VALUES ('1938', '1', '1', '3', '2013-08-07 14:59:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=466;title=为什么360会报毒？');
INSERT INTO `jc_log` VALUES ('1939', '1', '1', '3', '2013-08-07 15:00:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=465;title=流量宝可以刷多少流量？');
INSERT INTO `jc_log` VALUES ('1940', '1', '1', '3', '2013-08-07 15:00:59', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=478;title=流量宝新增对JavaScript链接的点击功能');
INSERT INTO `jc_log` VALUES ('1941', '1', '1', '3', '2013-08-07 15:01:17', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=477;title=流量宝会员系统新增UA设置功能');
INSERT INTO `jc_log` VALUES ('1942', '1', '1', '3', '2013-08-07 15:01:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=476;title=流量宝可否刷投票');
INSERT INTO `jc_log` VALUES ('1943', '1', '1', '3', '2013-08-07 15:01:52', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=475;title=流量宝比其他刷流量软件具有哪些优点？');
INSERT INTO `jc_log` VALUES ('1944', '1', '1', '3', '2013-08-07 15:02:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=474;title=流量王会员服务使用方法');
INSERT INTO `jc_log` VALUES ('1945', '1', '1', '3', '2013-08-07 15:02:35', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=478;title=流量王新增对JavaScript链接的点击功能');
INSERT INTO `jc_log` VALUES ('1946', '1', '1', '3', '2013-08-07 15:02:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=477;title=流量王会员系统新增UA设置功能');
INSERT INTO `jc_log` VALUES ('1947', '1', '1', '3', '2013-08-07 15:02:56', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=476;title=流量王可否刷投票');
INSERT INTO `jc_log` VALUES ('1948', '1', '1', '3', '2013-08-07 15:03:08', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=475;title=流量王比其他刷流量软件具有哪些优点？');
INSERT INTO `jc_log` VALUES ('1949', '1', '1', '3', '2013-08-07 15:03:38', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=473;title=添加广告优化任务教程');
INSERT INTO `jc_log` VALUES ('1950', '1', '1', '3', '2013-08-07 15:04:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=472;title=流量宝隐藏挂机介绍');
INSERT INTO `jc_log` VALUES ('1951', '1', '1', '3', '2013-08-07 15:06:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=461;title=修改了某些运行环境下可能出现崩溃');
INSERT INTO `jc_log` VALUES ('1952', '1', '1', '3', '2013-08-07 15:06:57', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=459;title=屏蔽了网页里存在影响到电脑的JS代码');
INSERT INTO `jc_log` VALUES ('1953', '1', '1', '3', '2013-08-07 15:11:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=479;title=添加多任务执行');
INSERT INTO `jc_log` VALUES ('1954', '1', '1', '3', '2013-08-07 15:12:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=438;title=免费提升流量');
INSERT INTO `jc_log` VALUES ('1955', '1', '1', '3', '2013-08-07 15:12:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=346;title=真实有效');
INSERT INTO `jc_log` VALUES ('1956', '1', '1', '3', '2013-08-07 15:13:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=345;title=绿色安全');
INSERT INTO `jc_log` VALUES ('1957', '1', '1', '3', '2013-08-07 15:13:32', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=344;title=平台控制精准');
INSERT INTO `jc_log` VALUES ('1958', '1', '1', '3', '2013-08-07 15:14:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=343;title=更多神秘功能？');
INSERT INTO `jc_log` VALUES ('1959', '1', '1', '3', '2013-08-07 15:18:24', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=95;title=null');
INSERT INTO `jc_log` VALUES ('1960', '1', '1', '3', '2013-08-07 15:19:14', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=484;title=电话');
INSERT INTO `jc_log` VALUES ('1961', '1', '1', '3', '2013-08-07 15:19:45', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=485;title=QQ');
INSERT INTO `jc_log` VALUES ('1962', '1', '1', '3', '2013-08-07 15:21:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=486;title=地址');
INSERT INTO `jc_log` VALUES ('1963', '1', '1', '3', '2013-08-07 15:26:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=481;title=刷流量最重要的事 ');
INSERT INTO `jc_log` VALUES ('1964', '1', '1', '3', '2013-08-07 15:27:28', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=480;title=可不可以同时刷同一个网址很多次');
INSERT INTO `jc_log` VALUES ('1965', '1', '1', '3', '2013-08-07 15:27:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=480;title=可不可以同时刷同一个网址很多次');
INSERT INTO `jc_log` VALUES ('1966', '1', '1', '3', '2013-08-07 15:28:41', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=425;title=24小时不间断自动刷流量的神器');
INSERT INTO `jc_log` VALUES ('1967', '1', '1', '3', '2013-08-07 15:29:16', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=424;title=新站刷流量');
INSERT INTO `jc_log` VALUES ('1968', '1', '1', '3', '2013-08-07 15:29:49', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=423;title=斯蒂芬金克里斯');
INSERT INTO `jc_log` VALUES ('1969', '1', '1', '3', '2013-08-07 15:30:22', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=423;title=网站刷流量不可放弃内容建设 ');
INSERT INTO `jc_log` VALUES ('1970', '1', '1', '3', '2013-08-07 15:33:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=481;title=刷流量最重要的事 ');
INSERT INTO `jc_log` VALUES ('1971', '1', '1', '3', '2013-08-07 15:33:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=480;title=可不可以同时刷同一个网址很多次');
INSERT INTO `jc_log` VALUES ('1972', '1', '1', '3', '2013-08-07 15:33:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=425;title=24小时不间断自动刷流量的神器');
INSERT INTO `jc_log` VALUES ('1973', '1', '1', '3', '2013-08-07 15:33:58', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=424;title=新站刷流量');
INSERT INTO `jc_log` VALUES ('1974', '1', '1', '3', '2013-08-07 15:34:09', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=423;title=网站刷流量不可放弃内容建设 ');
INSERT INTO `jc_log` VALUES ('1975', '1', '1', '3', '2013-08-07 15:35:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=81;name=网站流量优化');
INSERT INTO `jc_log` VALUES ('1976', '1', '1', '3', '2013-08-07 15:38:25', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=478;title=流量王新增对JavaScript链接的点击功能');
INSERT INTO `jc_log` VALUES ('1977', '1', '1', '3', '2013-08-07 15:38:47', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=477;title=流量王会员系统新增UA设置功能');
INSERT INTO `jc_log` VALUES ('1978', '1', '1', '3', '2013-08-07 15:39:00', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=476;title=流量王可否刷投票');
INSERT INTO `jc_log` VALUES ('1979', '1', '1', '3', '2013-08-07 15:39:15', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=475;title=流量王比其他刷流量软件具有哪些优点？');
INSERT INTO `jc_log` VALUES ('1980', '1', '1', '3', '2013-08-07 15:39:37', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=474;title=流量王会员服务使用方法');
INSERT INTO `jc_log` VALUES ('1981', '1', '1', '3', '2013-08-07 15:39:48', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=475;title=流量王比其他刷流量软件具有哪些优点？');
INSERT INTO `jc_log` VALUES ('1982', '1', '1', '3', '2013-08-07 15:40:06', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=474;title=流量王会员服务使用方法');
INSERT INTO `jc_log` VALUES ('1983', '1', '1', '3', '2013-08-07 15:40:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=478;title=流量王新增对JavaScript链接的点击功能');
INSERT INTO `jc_log` VALUES ('1984', '1', '1', '3', '2013-08-07 15:41:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=477;title=流量王会员系统新增UA设置功能');
INSERT INTO `jc_log` VALUES ('1985', '1', '1', '3', '2013-08-07 15:41:11', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=476;title=流量王可否刷投票');
INSERT INTO `jc_log` VALUES ('1986', '1', '1', '3', '2013-08-07 15:41:18', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=475;title=流量王比其他刷流量软件具有哪些优点？');
INSERT INTO `jc_log` VALUES ('1987', '1', '1', '3', '2013-08-07 15:41:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=474;title=流量王会员服务使用方法');
INSERT INTO `jc_log` VALUES ('1988', '1', '1', '3', '2013-08-07 15:41:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=473;title=添加广告优化任务教程');
INSERT INTO `jc_log` VALUES ('1989', '1', '1', '3', '2013-08-07 15:41:40', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=472;title=流量宝隐藏挂机介绍');
INSERT INTO `jc_log` VALUES ('1990', '1', '1', '3', '2013-08-07 15:42:02', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=464;title=加强对病毒木马的拦截处理');
INSERT INTO `jc_log` VALUES ('1991', '1', '1', '3', '2013-08-07 15:42:10', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=463;title=优化软件对系统资源的占用');
INSERT INTO `jc_log` VALUES ('1992', '1', '1', '3', '2013-08-07 15:42:20', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=462;title=增强网址过滤功能，优化执行效率');
INSERT INTO `jc_log` VALUES ('1993', '1', '1', '3', '2013-08-07 15:42:29', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=460;title=优化了流量模式的执行效率');
INSERT INTO `jc_log` VALUES ('1994', '1', '1', '3', '2013-08-07 15:42:39', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=459;title=屏蔽了网页里存在影响到电脑的JS代码');
INSERT INTO `jc_log` VALUES ('1995', '1', '1', '3', '2013-08-07 15:42:46', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=458;title=修复了在某些情况下不提示升级的bug');
INSERT INTO `jc_log` VALUES ('1996', '1', '1', '3', '2013-08-07 15:44:04', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=471;title=怎么刷QQ空间人气？');
INSERT INTO `jc_log` VALUES ('1997', '1', '1', '3', '2013-08-07 15:44:19', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=470;title=为什么流量王开了很久还没流量？');
INSERT INTO `jc_log` VALUES ('1998', '1', '1', '3', '2013-08-07 15:44:26', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=469;title=流量王的流量是真实IP吗？');
INSERT INTO `jc_log` VALUES ('1999', '1', '1', '3', '2013-08-07 15:44:34', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=468;title=流量王的工作原理是什么？');
INSERT INTO `jc_log` VALUES ('2000', '1', '1', '3', '2013-08-07 15:44:42', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=467;title=添加多个任务流量会成倍增加吗？');
INSERT INTO `jc_log` VALUES ('2001', '1', '1', '3', '2013-08-07 15:44:51', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=467;title=添加多个任务流量会成倍增加吗？');
INSERT INTO `jc_log` VALUES ('2002', '1', '1', '3', '2013-08-07 15:46:05', '127.0.0.1', '/liuliang/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=461;title=修改了某些运行环境下可能出现崩溃');
INSERT INTO `jc_message` VALUES ('2', '儿童', '过的人生观', '2013-06-07 15:49:52', '1', '5', '1', '0', '1');
INSERT INTO `jc_model` VALUES ('1', '新闻', '1', '新闻栏目', '新闻内容', '139', '139', '310', '310', '1', '1', '0', '1');
INSERT INTO `jc_model` VALUES ('2', '单页', '2', '单页', '', '139', '139', '310', '310', '2', '0', '0', '0');
INSERT INTO `jc_model` VALUES ('3', '作品', '3', '作品栏目', '作品内容', '139', '139', '310', '310', '3', '1', '0', '0');
INSERT INTO `jc_model` VALUES ('4', '下载', '4', '下载栏目', '下载内容', '139', '139', '310', '310', '4', '1', '0', '0');
INSERT INTO `jc_model` VALUES ('5', '图库', '5', '图库栏目', '图库内容', '139', '139', '310', '310', '5', '1', '0', '0');
INSERT INTO `jc_model` VALUES ('6', '视频', '6', '视频栏目', '视频内容', '139', '139', '310', '310', '10', '1', '0', '0');
INSERT INTO `jc_model` VALUES ('7', '产品', '7', '产品栏目', '产品内容', '139', '139', '310', '310', '10', '1', '0', '0');
INSERT INTO `jc_model` VALUES ('8', '首页管理', '8', '首页栏目管理', '首页内容管理', '139', '139', '310', '310', '10', '1', '0', '0');
INSERT INTO `jc_model` VALUES ('9', '其他页管理', '9', '其他页栏目', '其他页内容', '139', '139', '310', '310', '10', '1', '0', '0');
INSERT INTO `jc_model` VALUES ('10', '首页切换图片', '10', '首页栏目图片', '首页内容图片', '139', '139', '310', '310', '10', '1', '0', '0');
INSERT INTO `jc_model_item` VALUES ('1', '1', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('2', '1', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('3', '1', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('4', '1', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('5', '1', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('6', '1', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('7', '1', 'tplContent', '内容模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('8', '1', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('9', '1', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('10', '1', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('11', '1', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('12', '1', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('13', '1', 'finalStep', '终审级别', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('14', '1', 'afterCheck', '审核后', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('15', '1', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('16', '1', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('17', '1', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('18', '1', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('19', '1', 'userIds', '管理权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('20', '1', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('21', '1', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('22', '1', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('23', '1', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('24', '1', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('25', '1', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('26', '1', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('27', '1', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('28', '1', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('29', '1', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('30', '1', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('31', '1', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('32', '1', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('33', '1', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('34', '1', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('35', '1', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('36', '1', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('37', '1', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('38', '1', 'attachments', '附件', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('39', '1', 'media', '多媒体', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('40', '1', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('42', '2', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('43', '2', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('44', '2', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('45', '2', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('46', '2', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('47', '2', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('48', '2', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('49', '2', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('50', '2', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('51', '2', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('52', '2', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('53', '2', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('54', '3', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('55', '3', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('56', '3', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('57', '3', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('58', '3', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('59', '3', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('60', '3', 'tplContent', '内容模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('61', '3', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('62', '3', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('63', '3', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('64', '3', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('65', '3', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('66', '3', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('67', '3', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('68', '3', 'userIds', '管理权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('69', '3', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('70', '3', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('73', '3', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('74', '3', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('75', '3', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('76', '3', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('77', '3', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('78', '3', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('79', '3', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('80', '3', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('81', '3', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('82', '3', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('83', '3', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('84', '3', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('85', '3', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('86', '3', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('87', '3', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('88', '3', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('89', '3', 'attachments', '附件', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('90', '3', 'media', '多媒体', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('91', '3', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('92', '3', 'pictures', '图片集', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('93', '4', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('94', '4', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('95', '4', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('96', '4', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('97', '4', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('98', '4', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('99', '4', 'tplContent', '内容模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('100', '4', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('101', '4', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('102', '4', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('103', '4', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('104', '4', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('105', '4', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('106', '4', 'userIds', '管理权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('107', '4', 'channelId', '栏目', '1', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('108', '4', 'title', '软件名称', '2', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('109', '4', 'shortTitle', '软件简称', '3', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('110', '4', 'titleColor', '标题颜色', '4', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('111', '4', 'description', '摘要', '5', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('112', '4', 'author', '发布人', '6', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('113', '4', 'viewGroupIds', '浏览权限', '7', null, null, null, null, null, null, null, '7', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('114', '4', 'topLevel', '固顶级别', '8', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('115', '4', 'releaseDate', '发布时间', '9', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('116', '4', 'typeId', '内容类型', '21', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('117', '4', 'tplContent', '指定模板', '22', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('118', '4', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('119', '4', 'attachments', '资源上传', '11', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('120', '4', 'txt', '软件介绍', '20', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('121', '4', 'softType', '软件类型', '12', '国产软件', '国产软件,国外软件', '100', '3', '30', null, null, '6', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('122', '4', 'warrant', '软件授权', '13', '免费版', '免费版,共享版', '', '3', '30', '', '', '6', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('123', '4', 'relatedLink', '相关链接', '14', 'http://', '', '50', '3', '30', '', '', '1', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('124', '4', 'demoUrl', '演示地址', '15', 'http://', null, '60', '3', '30', null, null, '1', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('125', '5', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('126', '5', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('127', '5', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('128', '5', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('129', '5', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('130', '5', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('131', '5', 'tplContent', '内容模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('132', '5', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('133', '5', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('134', '5', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('135', '5', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('136', '5', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('137', '5', 'finalStep', '终审级别', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('138', '5', 'afterCheck', '审核后', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('139', '5', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('140', '5', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('141', '5', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('142', '5', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('143', '5', 'userIds', '管理权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('144', '5', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('145', '5', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('146', '5', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('147', '5', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('148', '5', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('149', '5', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('150', '5', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('151', '5', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('152', '5', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('153', '5', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('154', '5', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('155', '5', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('156', '5', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('157', '5', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('158', '5', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('159', '5', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('160', '5', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('161', '5', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('162', '5', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('163', '5', 'pictures', '图片集', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('164', '6', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('165', '6', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('166', '6', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('167', '6', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('168', '6', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('169', '6', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('170', '6', 'tplContent', '内容模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('171', '6', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('172', '6', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('173', '6', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('174', '6', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('175', '6', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('176', '6', 'finalStep', '终审级别', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('177', '6', 'afterCheck', '审核后', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('178', '6', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('179', '6', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('180', '6', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('181', '6', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('182', '6', 'userIds', '管理权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('183', '6', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('184', '6', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('185', '6', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('186', '6', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('187', '6', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('188', '6', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('189', '6', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('190', '6', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('191', '6', 'description', '内容简介', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('192', '6', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('193', '6', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('194', '6', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('195', '6', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('196', '6', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('197', '6', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('198', '6', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('199', '6', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('200', '6', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('201', '6', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('202', '6', 'attachments', '附件', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('203', '6', 'media', '多媒体', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('204', '7', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('205', '7', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('206', '7', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('207', '7', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('208', '7', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('209', '7', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('210', '7', 'tplContent', '内容模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('211', '7', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('212', '7', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('213', '7', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('214', '7', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('215', '7', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('216', '7', 'finalStep', '终审级别', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('217', '7', 'afterCheck', '审核后', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('218', '7', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('219', '7', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('220', '7', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('221', '7', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('222', '7', 'userIds', '管理权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('223', '7', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('224', '7', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('225', '7', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('226', '7', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('227', '7', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('228', '7', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('229', '7', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('230', '7', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('231', '7', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('232', '7', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('233', '7', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('234', '7', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('235', '7', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('236', '7', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('237', '7', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('238', '7', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('239', '7', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('240', '7', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('241', '7', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('242', '7', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('243', '7', 'marketprice', '市场价', '10', null, null, null, '3', '30', null, null, '3', '1', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('244', '7', 'price', '价格', '10', null, null, null, '3', '30', null, null, '3', '1', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('246', '4', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('247', '8', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('248', '8', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('249', '8', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('250', '8', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('255', '8', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('256', '8', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('257', '8', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('261', '8', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('262', '8', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('263', '8', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('264', '8', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('265', '8', 'userIds', '管理权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('266', '8', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('268', '8', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('269', '8', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('273', '8', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('274', '8', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('291', '8', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('296', '8', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('299', '8', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('303', '8', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('312', '8', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('313', '8', 'tplContent', '内容模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('314', '8', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('315', '8', 'finalStep', '终审级别', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('316', '8', 'afterCheck', '审核后', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('317', '8', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('348', '9', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('349', '9', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('350', '9', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('351', '9', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('352', '9', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('353', '9', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('354', '9', 'tplContent', '内容模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('355', '9', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('356', '9', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('357', '9', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('358', '9', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('359', '9', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('360', '9', 'finalStep', '终审级别', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('361', '9', 'afterCheck', '审核后', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('362', '9', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('363', '9', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('364', '9', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('365', '9', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('366', '9', 'userIds', '管理权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('367', '9', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('368', '9', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('369', '9', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('370', '9', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('374', '9', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('375', '9', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('379', '9', 'description', '关键字', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('381', '9', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('384', '9', 'releaseDate', '时间', '10', null, null, null, null, null, null, null, '5', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('385', '9', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('387', '9', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('392', '9', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('400', '9', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('415', '8', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('416', '10', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('466', '10', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('467', '10', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('479', '10', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('522', '10', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_receiver_message` VALUES ('2', '儿童', '过的人生观', '2013-06-07 15:49:52', '1', '5', '1', '0', '0', '2');
INSERT INTO `jc_role` VALUES ('1', null, '管理员', '10', '1');
INSERT INTO `jc_role` VALUES ('2', null, '普通', '10', '0');
INSERT INTO `jc_role_permission` VALUES ('2', '/keyword/');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/v_rename.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/o_swfupload.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/guestbook/');
INSERT INTO `jc_role_permission` VALUES ('2', '/sensitivity/');
INSERT INTO `jc_role_permission` VALUES ('2', '/frame/content');
INSERT INTO `jc_role_permission` VALUES ('2', '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/o_save.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/o_swfupload.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/o_create_dir.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/v_list.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/left.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/friendlink_ctg/');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/v_add.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/v_edit.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/v_tree.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/vote_topic/');
INSERT INTO `jc_role_permission` VALUES ('2', '/frame/assistant');
INSERT INTO `jc_role_permission` VALUES ('2', '/main.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/v_tree.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/index.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/o_delete_single.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/v_left.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/comment/');
INSERT INTO `jc_role_permission` VALUES ('2', '/acquisition/');
INSERT INTO `jc_role_permission` VALUES ('2', '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/static/');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/v_rename.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/tag/');
INSERT INTO `jc_role_permission` VALUES ('2', '/topic/');
INSERT INTO `jc_role_permission` VALUES ('2', '/guestbook_ctg/');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/v_edit.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/frame/template');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/o_delete.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/o_rename.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/top.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/o_rename.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/v_list.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/v_left.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/o_delete_single.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/right.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/o_save.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/o_update.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/v_upload.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/frame/channel');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/v_add.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/o_import.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/friendlink/');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/o_export.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/frame/maintain');
INSERT INTO `jc_role_permission` VALUES ('2', '/map.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/o_create_dir.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/lucene/');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/o_upload.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/resource/o_update.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/frame/generate');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/v_setting.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/frame/resource');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/o_delete.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/template/o_def_template.do');
INSERT INTO `jc_role_permission` VALUES ('2', '/personal/');
INSERT INTO `jc_role_permission` VALUES ('2', '/content_cycle/');
INSERT INTO `jc_role_permission` VALUES ('2', '/advertising_space/');
INSERT INTO `jc_role_permission` VALUES ('2', '/advertising/');
INSERT INTO `jc_sensitivity` VALUES ('1', '法论功', '***');
INSERT INTO `jc_site` VALUES ('1', '1', null, 'localhost', 'www', '流量', '流量', 'http://', '.jhtml', '.html', '/static', '1', '1', 'zh_CN', 'zh_CN', 'liuroot', '2', '2', '0', '1', '', '', '0');
INSERT INTO `jc_site_flow` VALUES ('1', '1', '127.0.0.1', '2012-12-27', '2012-12-27 16:27:33', 'http://localhost:8080/liuliang/', '', '', '', '本机地址', 'A46E80799C7E7B8299EBA5B7E0350223');
INSERT INTO `jc_site_flow` VALUES ('2', '1', '127.0.0.1', '2012-12-27', '2012-12-27 16:27:38', 'http://localhost:8080/liuliang/news/index.jhtml', 'http://localhost:8080', 'http://localhost:8080/liuliang/', '', '本机地址', 'A46E80799C7E7B8299EBA5B7E0350223');
INSERT INTO `jc_site_flow` VALUES ('3', '1', '127.0.0.1', '2012-12-27', '2012-12-27 16:28:05', 'http://localhost:8080/liuliang/veido/index.jhtml', 'http://localhost:8080', 'http://localhost:8080/liuliang/picture/index.jhtml', '', '本机地址', 'A46E80799C7E7B8299EBA5B7E0350223');
INSERT INTO `jc_site_flow` VALUES ('4', '1', '127.0.0.1', '2012-12-27', '2012-12-27 16:45:26', 'http://localhost:8080/liuliang/', '', '', '', '本机地址', '0DD7AFC4D7AB3D1AB10CBAD71B872D2C');
INSERT INTO `jc_site_flow` VALUES ('5', '1', '127.0.0.1', '2012-12-27', '2012-12-27 17:59:26', 'http://localhost:8080/liuliang/gnxw/341.jhtml', 'http://localhost:8080', 'http://localhost:8080/liuliang/jeeadmin/jeecms/content/v_list.do', '', '本机地址', 'E79C76CACA0A2ACB15C6891D74D471EA');
INSERT INTO `jc_site_flow` VALUES ('6', '1', '127.0.0.1', '2012-12-29', '2012-12-29 11:01:43', 'http://localhost:8080/liuliang/', 'http://localhost:8080', 'http://localhost:8080/liuliang/jeeadmin/jeecms/top.do', '', '本机地址', '19F4E94ACCC9ADA03459E7EC81D2F81D');
INSERT INTO `jc_site_flow` VALUES ('7', '1', '127.0.0.1', '2012-12-29', '2012-12-29 11:01:56', 'http://localhost:8080/liuliang/news/index.jhtml', 'http://localhost:8080', 'http://localhost:8080/liuliang/', '', '本机地址', '19F4E94ACCC9ADA03459E7EC81D2F81D');
INSERT INTO `jc_site_flow` VALUES ('8', '1', '127.0.0.1', '2012-12-29', '2012-12-29 12:37:19', 'http://localhost:8080/liuliang/download/index.jhtml', 'http://localhost:8080', 'http://localhost:8080/liuliang/', '', '本机地址', '19F4E94ACCC9ADA03459E7EC81D2F81D');
INSERT INTO `jc_site_flow` VALUES ('9', '1', '127.0.0.1', '2012-12-29', '2012-12-29 13:14:36', 'http://localhost:8080/liuliang/?locale=zh_CN', 'http://localhost:8080', 'http://localhost:8080/liuliang/', '', '本机地址', '19F4E94ACCC9ADA03459E7EC81D2F81D');
INSERT INTO `jc_site_flow` VALUES ('10', '1', '127.0.0.1', '2012-12-29', '2012-12-29 13:53:53', 'http://localhost:8080/liuliang/', 'http://localhost:8080', 'http://localhost:8080/liuliang/jeeadmin/jeecms/top.do', '', '本机地址', '6830551A1C35B187B5FE5A53D7553ED9');
INSERT INTO `jc_site_flow` VALUES ('11', '1', '127.0.0.1', '2012-12-29', '2012-12-29 15:16:42', 'http://localhost:8080/liuliang/product/index.jhtml', 'http://localhost:8080', 'http://localhost:8080/liuliang/', '', '本机地址', '6830551A1C35B187B5FE5A53D7553ED9');
INSERT INTO `jc_site_flow` VALUES ('12', '1', '127.0.0.1', '2012-12-29', '2012-12-29 15:17:22', 'http://localhost:8080/liuliang/veido/index.jhtml', 'http://localhost:8080', 'http://localhost:8080/liuliang/whxy/301.jhtml', '', '本机地址', '6830551A1C35B187B5FE5A53D7553ED9');
INSERT INTO `jc_site_flow` VALUES ('13', '1', '127.0.0.1', '2012-12-29', '2012-12-29 15:17:11', 'http://localhost:8080/liuliang/whxy/301.jhtml', 'http://localhost:8080', 'http://localhost:8080/liuliang/picture/index.jhtml', '', '本机地址', '6830551A1C35B187B5FE5A53D7553ED9');
INSERT INTO `jc_site_flow` VALUES ('14', '1', '127.0.0.1', '2012-12-29', '2012-12-29 15:17:46', 'http://localhost:8080/liuliang/download/index.jhtml', 'http://localhost:8080', 'http://localhost:8080/liuliang/', '', '本机地址', '6830551A1C35B187B5FE5A53D7553ED9');
INSERT INTO `jc_site_flow` VALUES ('15', '1', '127.0.0.1', '2012-12-31', '2012-12-31 10:34:28', 'http://localhost:8080/liuliang/wyty/339.jhtml', 'http://localhost:8080', 'http://localhost:8080/liuliang/jeeadmin/jeecms/content/v_view.do?id=339&cid=43&pageNo=&queryTitle=&queryInputUsername=&queryTopLevel=false&queryRecommend=false&queryTypeId=&queryStatus=&queryOrderBy=0', '', '本机地址', '6D5D2A73EDA997B7DAC97E966E622CEB');
INSERT INTO `jc_topic` VALUES ('1', null, '图片', null, '', '', null, null, '', '10', '0');
INSERT INTO `jc_user` VALUES ('1', '1', 'admin', 'admin@yahoo.com', '2011-01-03 00:00:00', '127.0.0.1', '2013-08-07 14:51:04', '127.0.0.1', '238', '9', '0', '0', null, '1', '0', '0', '0');
INSERT INTO `jc_user` VALUES ('5', '1', 'test', 'test@163.com', '2011-12-19 15:26:02', '192.168.0.173', '2013-06-07 15:56:09', '0:0:0:0:0:0:0:1', '2', '0', '0', '0', '2011-12-19', '0', '0', '0', '0');
INSERT INTO `jc_user` VALUES ('7', '1', 'tanjie', '821611867@qq.com', '2013-01-04 17:03:15', '127.0.0.1', '2013-06-07 16:02:00', '0:0:0:0:0:0:0:1', '3', '8', '0', '0', '2013-01-04', '1', '0', '0', '0');
INSERT INTO `jc_user_ext` VALUES ('1', 'JEECMS', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('5', null, null, null, null, ',', null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('7', null, '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_role` VALUES ('1', '1');
INSERT INTO `jc_user_role` VALUES ('2', '7');
INSERT INTO `jc_user_site` VALUES ('1', '1', '1', '2', '1');
INSERT INTO `jc_user_site` VALUES ('2', '7', '1', '1', '1');
INSERT INTO `jc_vote_item` VALUES ('1', '1', '基于java技术，安全稳定，易扩展', '21', '1');
INSERT INTO `jc_vote_item` VALUES ('4', '1', 'jsp是未来发展的趋势', '23', '4');
INSERT INTO `jc_vote_item` VALUES ('5', '1', 'java执行速度快，性能优良', '5', '5');
INSERT INTO `jc_vote_item` VALUES ('6', '1', '跨平台，支持windows、linux、unix', '6', '6');
INSERT INTO `jc_vote_item` VALUES ('7', '1', '学习研究', '11', '7');
INSERT INTO `jc_vote_item` VALUES ('8', '1', '其它', '10', '8');
INSERT INTO `jc_vote_record` VALUES ('1', null, '1', '2011-06-04 15:41:31', '127.0.0.1', '2600e4a345ba4fc289088d7abe59321c');
INSERT INTO `jc_vote_topic` VALUES ('1', '1', '您为什么选择jsp cms,java cms? ', '在php cms为建站主流CMS的年代，您为什么选择jsp cms,java cms？请给出您的意见吧！', null, null, null, '76', '3', '0', '0', '1', '0', '1');
INSERT INTO `jo_authentication` VALUES ('0422f444596341eda801d362c0ea2691', '1', 'admin', 'admin@yahoo.com', '2013-07-30 14:20:07', '127.0.0.1', '2013-07-30 18:21:43');
INSERT INTO `jo_authentication` VALUES ('085dc681cdbf4b449145e9504fffdb2b', '1', 'admin', 'admin@yahoo.com', '2013-08-03 16:52:25', '127.0.0.1', '2013-08-03 17:52:12');
INSERT INTO `jo_authentication` VALUES ('11c9df981e3b4630a3e272b6fc6a36ef', '1', 'admin', 'admin@yahoo.com', '2013-08-06 09:22:05', '127.0.0.1', '2013-08-06 09:59:16');
INSERT INTO `jo_authentication` VALUES ('1631ca4fa51747189947acf56bebffb3', '1', 'admin', 'admin@yahoo.com', '2013-07-31 17:50:13', '127.0.0.1', '2013-07-31 18:28:48');
INSERT INTO `jo_authentication` VALUES ('26fae09aeab54be4b589ac243f9dea22', '1', 'admin', 'admin@yahoo.com', '2013-08-03 16:14:18', '127.0.0.1', '2013-08-03 16:42:06');
INSERT INTO `jo_authentication` VALUES ('2d4af767ab8c48949dfe52c0614b4ae0', '1', 'admin', 'admin@yahoo.com', '2013-08-05 13:12:53', '127.0.0.1', '2013-08-05 13:24:54');
INSERT INTO `jo_authentication` VALUES ('30fbdb0f3b184def84cac9aff29d64d5', '1', 'admin', 'admin@yahoo.com', '2013-08-05 13:25:47', '127.0.0.1', '2013-08-05 13:27:22');
INSERT INTO `jo_authentication` VALUES ('31a6c441e1704f6b8771443069b2d414', '1', 'admin', 'admin@yahoo.com', '2013-08-07 14:51:03', '127.0.0.1', '2013-08-07 16:12:37');
INSERT INTO `jo_authentication` VALUES ('6220cfba66104dc6bb721114f9959968', '1', 'admin', 'admin@yahoo.com', '2013-08-03 18:38:04', '127.0.0.1', '2013-08-03 18:38:24');
INSERT INTO `jo_authentication` VALUES ('6505eac453bb4cf58c48314666c0eebb', '1', 'admin', 'admin@yahoo.com', '2013-08-03 15:23:08', '127.0.0.1', '2013-08-03 16:35:22');
INSERT INTO `jo_authentication` VALUES ('686b0ed54cc54c108d4691c6f966dd7b', '1', 'admin', 'admin@yahoo.com', '2013-07-31 09:38:32', '127.0.0.1', '2013-07-31 11:48:33');
INSERT INTO `jo_authentication` VALUES ('68f0de8566ef4b62b31879e3dc1fd0fc', '1', 'admin', 'admin@yahoo.com', '2013-08-05 11:29:27', '127.0.0.1', '2013-08-05 12:59:30');
INSERT INTO `jo_authentication` VALUES ('82c4e2e75e9c458db3bbb7f06af5d84e', '1', 'admin', 'admin@yahoo.com', '2013-08-05 13:29:38', '127.0.0.1', '2013-08-05 18:07:25');
INSERT INTO `jo_authentication` VALUES ('95efd1f4c1e34a848821f84c196f7197', '1', 'admin', 'admin@yahoo.com', '2013-07-31 15:54:18', '127.0.0.1', '2013-07-31 17:24:20');
INSERT INTO `jo_authentication` VALUES ('b67d817c69ee4df4ad6a54dd5328126d', '1', 'admin', 'admin@yahoo.com', '2013-08-01 08:53:37', '127.0.0.1', '2013-08-01 10:05:01');
INSERT INTO `jo_authentication` VALUES ('c4ef1a80ede448a58f8ffedeeb7d1361', '1', 'admin', 'admin@yahoo.com', '2013-08-03 18:33:37', '127.0.0.1', '2013-08-03 18:34:22');
INSERT INTO `jo_authentication` VALUES ('fb2f0bec6c004f7786b9478abd0fa0fc', '1', 'admin', 'admin@yahoo.com', '2013-08-03 09:36:37', '127.0.0.1', '2013-08-03 11:24:24');
INSERT INTO `jo_config` VALUES ('email_encoding', '');
INSERT INTO `jo_config` VALUES ('email_host', 'smtp.163.com');
INSERT INTO `jo_config` VALUES ('email_password', '1');
INSERT INTO `jo_config` VALUES ('email_personal', '');
INSERT INTO `jo_config` VALUES ('email_port', null);
INSERT INTO `jo_config` VALUES ('email_username', 'jeecms@163.com');
INSERT INTO `jo_config` VALUES ('login_error_interval', '30');
INSERT INTO `jo_config` VALUES ('login_error_times', '3');
INSERT INTO `jo_config` VALUES ('message_subject', 'JEECMS会员密码找回信息');
INSERT INTO `jo_config` VALUES ('message_text', '感谢您使用JEECMS系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');
INSERT INTO `jo_user` VALUES ('1', 'admin', 'admin@yahoo.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2011-01-03 00:00:00', '127.0.0.1', '2013-08-07 14:51:03', '127.0.0.1', '239', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('5', 'test', 'test@163.com', 'e10adc3949ba59abbe56e057f20f883e', '2011-12-19 15:26:02', '192.168.0.173', '2013-06-07 15:56:09', '0:0:0:0:0:0:0:1', '2', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('7', 'tanjie', '821611867@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2013-01-04 17:03:15', '127.0.0.1', '2013-06-07 16:02:00', '0:0:0:0:0:0:0:1', '3', null, null, null, '0', null, '1', null);
INSERT INTO `liuliang` VALUES ('14', '是大法师', '12 20 2012 11:34AM', '', '阿斯顿发阿斯顿发阿斯顿多少阿斯顿啊', '', null, '4', null);
INSERT INTO `liuliang` VALUES ('15', '阿斯顿发烧', '12 20 2012 11:35AM', '', '速度大飒飒的奥蒂斯阿斯顿速度是', '', null, '5', null);
INSERT INTO `liuliang` VALUES ('16', '阿斯顿发', '12 20 2012 11:35AM', '', '奥蒂斯奥蒂斯阿斯顿', '', null, '1', null);
INSERT INTO `liuliang` VALUES ('17', '奥蒂斯速度多少', '12 20 2012 11:35AM', '', '奥蒂斯阿斯顿阿斯顿', '', null, '2', null);
INSERT INTO `liuliang` VALUES ('18', '速度奥蒂斯', '12 20 2012 11:36AM', '', '&nbsp;阿斯顿阿斯顿速度速度', '', null, '3', null);
INSERT INTO `liuliang` VALUES ('19', 'sd', '12 20 2012 11:39AM', '', '<P>sadsfasdfasdf</P>', '', null, '1', null);
INSERT INTO `liuliang` VALUES ('20', 's', '2012/12/20', '', 'ssssssss', '', null, '1', null);
INSERT INTO `liutask` VALUES ('65', '3', '我的网站', 'http://www.baidu.com', '自定义', '1000', '3', '45-60秒停留', '自定义地区', '停用', '自动', '关闭', '', null, '0', '没有开始优化');
INSERT INTO `slider` VALUES ('8', '138', '123', '107', '72', '51', '48', '66', '87', '99', '129', '141', '165', '174', '183', '180', '180', '171', '150', '132', '141', '144', '129', '107', '81');
INSERT INTO `slider` VALUES ('9', '0', '0', '107', '72', '51', '48', '66', '87', '99', '129', '141', '165', '174', '183', '180', '180', '171', '150', '132', '141', '144', '129', '107', '81');
INSERT INTO `u_user` VALUES ('1', 'jetan1990', '20917c851c4a54f2a054390dac9085b7', '0', '0', '0', '821611867@qq.com', null, null, null);
INSERT INTO `u_user` VALUES ('3', 'jetan199', '20917c851c4a54f2a054390dac9085b7', '0', '0', '0', '821611867@qq.com', null, null, null);
INSERT INTO `u_user` VALUES ('4', 'jetan', 'e562e7e9cb1e395616ec15b868b81a93', '0', '0', '0', 'tanjie1990@126.com', null, null, null);
INSERT INTO `u_user` VALUES ('5', 'jetan', 'e562e7e9cb1e395616ec15b868b81a93', '0', '0', '0', 'tanjie1990@126.com', null, null, null);
INSERT INTO `u_user` VALUES ('6', 'jetan1', '4cee6b35b371eace0a953b47c13617e8', '0', '0', '0', '821611867@126.com', null, null, null);
INSERT INTO `weblog` VALUES ('1', null, 'http://www.baidu.com', '100%', '0');
