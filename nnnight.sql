/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : nnnight

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2018-01-23 22:54:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hibernate_sequence`
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES ('3');
INSERT INTO `hibernate_sequence` VALUES ('3');

-- ----------------------------
-- Table structure for `nn_blog`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog`;
CREATE TABLE `nn_blog` (
  `blogId` int(11) NOT NULL AUTO_INCREMENT,
  `commentCount` int(8) NOT NULL DEFAULT '0',
  `content` text,
  `createTime` datetime DEFAULT NULL,
  `deleteFlag` tinyint(1) DEFAULT NULL,
  `deleteTime` datetime DEFAULT NULL,
  `draftFlag` tinyint(1) DEFAULT NULL,
  `favoriteCount` int(8) NOT NULL DEFAULT '0',
  `keyword` varchar(100) DEFAULT NULL,
  `praiseCount` int(8) NOT NULL DEFAULT '0',
  `publicFlag` tinyint(1) DEFAULT NULL,
  `readCount` int(8) NOT NULL DEFAULT '0',
  `recommendFlag` tinyint(1) DEFAULT NULL,
  `thumb` varchar(200) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `topFlag` tinyint(1) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `updateTime` datetime DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `thumbContent` text,
  PRIMARY KEY (`blogId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog
-- ----------------------------
INSERT INTO `nn_blog` VALUES ('1', '0', null, '2017-04-06 21:47:10', '0', null, '0', '0', null, '0', '0', '1', '1', null, '我的文章', '0', '2', null, '1', '这是内容哟');
INSERT INTO `nn_blog` VALUES ('2', '0', '\n				<p><img src=\"/nnnight/upload/l/20170409/1491741981344_3248510632291157.jpg\" alt=\"QQ图片20170301204510\" style=\"max-width:100%;\"><img src=\"/nnnight/upload/l/20170409/1491741984294_04135748596188238.png\" alt=\"QQ截图20170307192049\" style=\"max-width: 100%;\">这是缩略图测试！！！<br></p><p>这是缩略图测试！！！</p><p><br></p><p>这是缩略图测试！！！</p><p>这是缩略图测试！！！</p><p><br></p>', '2017-04-09 20:46:50', '0', null, '0', '0', null, '0', '0', '1', '1', '/nnnight/upload/s/20170409/1491741981344_3248510632291157.jpg|||/nnnight/upload/s/20170409/1491741984294_04135748596188238.png', '缩略图测试', '1', '1', null, '1', '这是缩略图测试！！！\n这是缩略图测试！！！\n\n这是缩略图测试！！！\n这是缩略图测试！！！\n');
INSERT INTO `nn_blog` VALUES ('4', '0', '\n				<p><img src=\"/nnnight/upload/l/20170409/1491743239440_02284444575528166.png\" alt=\"QQ截图20170409210623\" style=\"max-width:100%;\"><img src=\"/nnnight/upload/l/20170409/1491743242126_3505489243815887.jpg\" alt=\"QQ图片20170301204510\" style=\"max-width: 100%;\"><img src=\"/nnnight/upload/l/20170409/1491743245018_48874771826615726.png\" alt=\"head000\" style=\"max-width: 100%;\"><img src=\"/nnnight/upload/l/20170409/1491743248071_7844602198663451.png\" alt=\"me\" style=\"max-width: 100%;\"><br></p><p><br></p>', '2017-04-09 21:07:30', '0', null, '0', '0', null, '0', '0', '0', '1', '/nnnight/upload/s/20170409/1491743239440_02284444575528166.png|||/nnnight/upload/s/20170409/1491743242126_3505489243815887.jpg|||/nnnight/upload/s/20170409/1491743245018_48874771826615726.png', '新突破测试', '0', '1', null, '1', '\n');
INSERT INTO `nn_blog` VALUES ('5', '0', '\n				<p>testete</p>', '2017-04-16 14:48:13', '0', null, '0', '0', null, '0', '0', '0', '1', '', 'test', '0', '1', null, '1', 'testete');
INSERT INTO `nn_blog` VALUES ('6', '0', '\n				<p>pagerpagerpagerpagerpagerpagerpagerpagerpager</p><p>pagerpagerpagerpagerpagerpagerpagerpagerpager</p><p><br></p><p>pagerpagerpagerpagerpagerpagerpagerpagerpager</p><p>pagerpagerpagerpagerpagerpagerpagerpagerpager</p><p><br></p><p><br></p><p>pagerpagerpagerpagerpagerpagerpagerpagerpager</p><p><br></p><p><br></p>', '2017-04-16 15:02:10', '0', null, '0', '0', null, '0', '0', '1', '1', '', 'pager', '1', '1', null, '1', 'pagerpagerpagerpagerpagerpagerpagerpagerpager\npagerpagerpagerpagerpagerpagerpagerpagerpager\n\npagerpagerpagerpagerpagerpagerpagerpagerpager\npagerpagerpagerpagerpagerpagerpagerpagerpager\n\n\npagerpagerpagerpagerpagerpagerpagerpagerpager\n\n');
INSERT INTO `nn_blog` VALUES ('7', '0', '\n				<p>tetetetetetetete</p><p>tetetetetetetete</p><p>tetetete</p><p>tetetete</p><p><br></p>', '2017-04-16 15:09:33', '0', null, '0', '0', null, '0', '0', '0', '1', '', 'tetetete', '0', '1', null, '1', 'tetetetetetetete\ntetetetetetetete\ntetetete\ntetetete\n');
INSERT INTO `nn_blog` VALUES ('8', '0', '\n				<p style=\"text-align: center; \">床前明月光，</p><p style=\"text-align: center; \">疑似地上霜。</p><p style=\"text-align: center; \">举头望明月，</p><p style=\"text-align: center; \">低头思故乡。</p><p style=\"text-align: center; \">&nbsp;&nbsp;&nbsp;&nbsp;——<i>李白</i></p><p style=\"text-align: center;\"><br></p>', '2017-04-16 15:48:10', '0', null, '0', '0', null, '0', '0', '0', '0', '', '静夜思', '0', '1', null, '1', '床前明月光，疑似地上霜。举头望明月，低头思故乡。    ——李白');
INSERT INTO `nn_blog` VALUES ('9', '0', '\n				<p></p><div style=\"text-align: center;\">床前明月光，</div><div style=\"text-align: center;\">疑似地上霜。</div><div style=\"text-align: center;\">举头望明月，</div><div style=\"text-align: center;\">低头思故乡。</div><div style=\"text-align: center;\">&nbsp; &nbsp; ——<i>李白</i></div><p></p><p style=\"text-align: center;\"><br></p>', '2017-04-16 15:49:26', '0', null, '0', '0', null, '0', '0', '1', '0', '', '静夜思', '0', '3', '2017-05-09 17:00:29', '1', '床前明月光，疑似地上霜。举头望明月，低头思故乡。    ——李白\n');
INSERT INTO `nn_blog` VALUES ('10', '0', '\n				<p>pagerpagerpagerpagerpagerpagerpagerpagerpager pagerpagerpagerpagerpagerpagerpagerpagerpager pagerpagerpagerpagerpagerpagerpagerpagerpager pagerpagerpagerpagerpagerpagerpagerpagerpager pagerpagerpagerpagerpagerpagerpagerpagerpager</p><p><br></p>', '2017-04-16 15:50:20', '1', '2017-06-06 20:35:00', '0', '0', null, '0', '0', '1', '0', '', '安抚', '0', '1', null, '1', 'pagerpagerpagerpagerpagerpagerpagerpagerpager pagerpagerpagerpagerpagerpagerpagerpagerpager pagerpagerpagerpagerpagerpagerpagerpagerpager pagerpagerpagerpagerpagerpagerpagerpagerpager pagerpagerpagerpagerpagerpagerpagerpagerpager\n');
INSERT INTO `nn_blog` VALUES ('11', '0', '\n				<p>as</p>', '2017-04-16 15:57:38', '0', null, '0', '0', null, '0', '1', '0', '0', '', '私密测试', '0', '1', null, '1', 'as');
INSERT INTO `nn_blog` VALUES ('12', '0', '\n				<p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7a/shenshou_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bc/fuyun_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c9/geili_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f2/wg_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/70/vw_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/81/rabbit_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bc/otm_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/15/j_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/89/hufen_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c4/liwu_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ac/smilea_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0b/tootha_thumb.gif\"><img src=\"/nnnight/upload/l/20170504/1493862895270_040448528166811215.png\" alt=\"QQ截图20170307192049\" style=\"max-width: 100%;\">阿萨<br></p><p><br></p>', '2017-05-04 09:54:59', '1', '2017-06-06 20:34:04', '0', '0', null, '0', '0', '1', '0', '/nnnight/upload/s/20170504/1493862895270_040448528166811215.png', '个人呢', '0', '1', null, '1', '阿萨\n');
INSERT INTO `nn_blog` VALUES ('13', '0', '\n				<p>12</p>', '2017-05-04 10:11:50', '0', null, '0', '0', null, '0', '0', '1', '1', '', '推荐测试', '0', '1', null, '1', '12');
INSERT INTO `nn_blog` VALUES ('14', '0', '\n				<p>asd</p>', '2017-05-04 10:12:02', '0', null, '0', '1', null, '0', '0', '2', '0', '', '置顶测试', '1', '1', '2017-06-04 13:15:45', '1', 'asd');
INSERT INTO `nn_blog` VALUES ('15', '0', '\n				<p>asd速度</p>', '2017-05-09 15:42:50', '0', null, '0', '0', null, '0', '1', '1', '0', '', 'es人', '1', '2', '2017-05-09 16:30:54', '1', 'asd速度');
INSERT INTO `nn_blog` VALUES ('16', '0', '<p>as gdfdf</p><p>ds</p>', '2017-05-09 16:24:07', '0', null, '1', '0', null, '0', '0', '0', '1', null, '20175915156f', '0', '1', '2017-05-09 16:12:30', '1', null);
INSERT INTO `nn_blog` VALUES ('17', '0', 'gh', '2017-05-09 15:17:15', '0', null, '1', '0', null, '0', '0', '0', '0', null, 'fgt', '0', '1', null, '1', null);
INSERT INTO `nn_blog` VALUES ('18', '0', '<p>gh</p><p>fdc</p>', '2017-05-09 15:17:20', '0', null, '1', '0', null, '0', '0', '0', '0', null, 'fgt', '0', '1', null, '1', null);
INSERT INTO `nn_blog` VALUES ('19', '0', 'sdg', '2017-05-09 15:18:01', '0', null, '1', '0', null, '0', '0', '0', '0', null, 'sd', '0', '1', null, '1', null);
INSERT INTO `nn_blog` VALUES ('20', '0', 'saas', '2017-05-09 16:24:09', '0', null, '1', '0', null, '0', '1', '0', '0', null, 'as', '0', '1', '2017-05-09 16:13:13', '1', null);
INSERT INTO `nn_blog` VALUES ('21', '0', '十大', '2017-05-09 15:41:47', '1', '2017-06-06 20:34:34', '0', '1', null, '0', '0', '1', '0', '', '但是', '0', '1', '2017-06-04 11:45:50', '1', '十大');
INSERT INTO `nn_blog` VALUES ('22', '0', '地方地方', '2017-05-09 16:24:05', '0', null, '1', '0', null, '0', '0', '0', '0', null, '地方', '1', '1', '2017-05-09 16:24:44', '1', null);
INSERT INTO `nn_blog` VALUES ('23', '0', '地方地方', '2017-05-09 15:42:25', '0', null, '0', '0', null, '0', '1', '1', '0', '', '地方', '0', '1', '2017-05-09 16:31:09', '1', '地方地方');
INSERT INTO `nn_blog` VALUES ('24', '1', '<p>as gdfdf</p><p>ds</p>', '2017-05-09 16:24:27', '0', null, '0', '1', null, '1', '0', '3', '1', '', '20175915156f', '0', '1', '2017-06-06 22:00:13', '1', 'as gdfdf\nds');
INSERT INTO `nn_blog` VALUES ('25', '0', '+1', '2017-06-06 21:58:32', '0', null, '0', '0', null, '0', '0', '1', '0', '', '博客加一', '0', '1', null, '1', '+1');
INSERT INTO `nn_blog` VALUES ('26', '0', 'bujiayi', '2017-06-06 22:09:08', '0', null, '0', '0', null, '0', '1', '1', '0', '', 'bujiayi', '0', '1', null, '1', 'bujiayi');
INSERT INTO `nn_blog` VALUES ('27', '0', '<p><img src=\"/static/upload/img/blog/l/20170629/20170629201501604_32756542689552615.png\" alt=\"QQ截图20170307192049\" style=\"max-width:100%;\"><br></p><p><br></p>', '2017-06-29 20:15:43', '0', null, '0', '0', null, '0', '1', '1', '0', '', 'new test', '0', '1', null, '1', '\n');
INSERT INTO `nn_blog` VALUES ('28', '0', '<p><img src=\"/static/upload/img/blog/l/20170629/20170629201752335_35487826866908634.png\" alt=\"QQ截图20170307192049\" style=\"max-width:100%;\"></p><p><br></p>', '2017-06-29 20:17:59', '0', null, '0', '0', null, '0', '0', '1', '0', '', 'new test1', '0', '1', null, '1', '\n');
INSERT INTO `nn_blog` VALUES ('29', '0', '<p><img src=\"/static/upload/img/blog/l/20170629/20170629202026381_9819125599546197.png\" alt=\"QQ截图20170307192049\" style=\"max-width:100%;\"></p><p><br></p>', '2017-06-29 20:20:31', '0', null, '0', '0', null, '0', '0', '1', '0', '', '212', '0', '1', null, '1', '\n');
INSERT INTO `nn_blog` VALUES ('30', '0', '<p><img src=\"/static/upload/img/blog/l/20170629/20170629202151457_5641324560063148.png\" alt=\"QQ截图20170307192049\" style=\"max-width:100%;\"></p><p><img src=\"/static/upload/img/blog/l/20170629/20170629202155280_7856349575514812.png\" alt=\"head000\" style=\"max-width:100%;\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_thumb.gif\"><br></p><p><br></p>', '2017-06-29 20:22:02', '0', null, '0', '0', null, '0', '0', '1', '1', '/static/upload/img/blog/s/20170629/20170629202151457_5641324560063148.png|||/static/upload/img/blog/s/20170629/20170629202155280_7856349575514812.png', 'test again', '0', '1', null, '1', '\n\n');
INSERT INTO `nn_blog` VALUES ('31', '0', '<p style=\"text-align: center;\">华灯初上，夜未央。</p><p style=\"text-align: center;\">歌舞笙箫，古道旁。</p><p style=\"text-align: center;\">纸醉金迷，秦淮殇。</p><p style=\"text-align: center;\">墨色生香，皆虚妄。</p><p style=\"text-align: center;\">月影归人，眼迷惘。</p><p style=\"text-align: center;\">桂树桥旁，自相望。</p><p style=\"text-align: center;\">姣月之下，都成双。</p><p style=\"text-align: center; \">单身狗啊，加班忙。</p><p style=\"text-align: center;\"><br></p>', '2017-08-07 21:08:32', '0', null, '0', '0', null, '0', '0', '2', '1', '', '怜音赋改', '1', '1', null, '1', '华灯初上，夜未央。歌舞笙箫，古道旁。纸醉金迷，秦淮殇。墨色生香，皆虚妄。月影归人，眼迷惘。桂树桥旁，自相望。姣月之下，都成双。单身狗啊，加班忙。');

-- ----------------------------
-- Table structure for `nn_blog_album`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_album`;
CREATE TABLE `nn_blog_album` (
  `albumId` int(11) NOT NULL AUTO_INCREMENT,
  `albumDesc` varchar(200) DEFAULT NULL,
  `albumName` varchar(100) NOT NULL,
  `coverImg` varchar(200) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `photoCount` int(8) NOT NULL DEFAULT '0',
  `publicFlag` tinyint(1) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`albumId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_album
-- ----------------------------
INSERT INTO `nn_blog_album` VALUES ('1', 'wa', '23', 'nocover.png', '2017-09-09 08:10:15', '0', '1', '1');
INSERT INTO `nn_blog_album` VALUES ('2', '这是我的相册哟', '我的相册', 'nocover.png', '2017-09-09 08:37:06', '0', '1', '1');
INSERT INTO `nn_blog_album` VALUES ('3', '只有我能看到', '我的私密相册', 'nocover.png', '2017-09-09 08:37:20', '0', '0', '1');
INSERT INTO `nn_blog_album` VALUES ('4', '第四个！', '第四个相册', 'nocover.png', '2017-09-09 08:37:30', '0', '1', '1');
INSERT INTO `nn_blog_album` VALUES ('5', '555', '第五个相册', 'nocover.png', '2017-09-09 08:38:24', '17', '1', '1');

-- ----------------------------
-- Table structure for `nn_blog_comment`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_comment`;
CREATE TABLE `nn_blog_comment` (
  `commentId` varchar(36) NOT NULL,
  `blogId` int(11) NOT NULL,
  `comment` text,
  `createTime` datetime DEFAULT NULL,
  `parentId` varchar(36) DEFAULT NULL,
  `praiseCount` int(8) NOT NULL DEFAULT '0',
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_comment
-- ----------------------------
INSERT INTO `nn_blog_comment` VALUES ('402880895c04d610015c04e592db0000', '24', 'replyreply\nreply\n						<!-- \n							<div class=\"alert alert-default\" role=\"alert\">\n	    						<button class=\"close\"  data-dismiss=\"alert\" type=\"button\" >&times;</button>\n							    <p>回复 隔壁老王  #1 ：</p>\n							</div>\n							 -->\n						replyreply\nreply', '2017-05-14 11:01:10', '', '0', '1');
INSERT INTO `nn_blog_comment` VALUES ('402880895c04e793015c04e84ac60000', '24', '<div class=\"alert alert-default\" role=\"alert\"><p>回复 看風聼雨雪  #1 ：</p></div>reply', '2017-05-14 11:02:31', '402881e85bfb4e2e015bfb4eac880000', '0', '1');
INSERT INTO `nn_blog_comment` VALUES ('402880895c04e793015c04ed1d0f0001', '6', '\n						<!-- \n							<div class=\"alert alert-default\" role=\"alert\">\n	    						<button class=\"close\"  data-dismiss=\"alert\" type=\"button\" >&times;</button>\n							    <p>回复 隔壁老王  #1 ：</p>\n							</div>\n							 -->\n						评论测试', '2017-05-14 11:07:47', '', '0', '1');
INSERT INTO `nn_blog_comment` VALUES ('402880895c04e793015c04ed5a3f0002', '6', '<div class=\"alert alert-default\" role=\"alert\"><p>回复 看風聼雨雪  #1 ：</p></div>回复测试', '2017-05-14 11:08:03', '402880895c04e793015c04ed1d0f0001', '0', '1');
INSERT INTO `nn_blog_comment` VALUES ('402880895c04e793015c04ee27cd0003', '6', '<div class=\"alert alert-default\" role=\"alert\"><p>回复 看風聼雨雪  #1 ：</p></div>回复啊回复', '2017-05-14 11:08:56', '402880895c04e793015c04ed1d0f0001', '0', '1');
INSERT INTO `nn_blog_comment` VALUES ('402880895c04e793015c04f74bb30004', '14', '\n						<!-- \n							<div class=\"alert alert-default\" role=\"alert\">\n	    						<button class=\"close\"  data-dismiss=\"alert\" type=\"button\" >&times;</button>\n							    <p>回复 隔壁老王  #1 ：</p>\n							</div>\n							 -->\n						评论', '2017-05-14 11:18:55', '', '0', '1');
INSERT INTO `nn_blog_comment` VALUES ('402880895c04e793015c04f77e6f0005', '14', '\n						<!-- \n							<div class=\"alert alert-default\" role=\"alert\">\n	    						<button class=\"close\"  data-dismiss=\"alert\" type=\"button\" >&times;</button>\n							    <p>回复 隔壁老王  #1 ：</p>\n							</div>\n							 -->\n						平啊', '2017-05-14 11:19:08', '', '0', '1');
INSERT INTO `nn_blog_comment` VALUES ('402881e85bfb4e2e015bfb4eac880000', '24', 'comment test 1', '2017-05-13 11:01:14', null, '0', '1');
INSERT INTO `nn_blog_comment` VALUES ('402881e85bfb4e2e015bfb4f00b40001', '24', 'comment test 2', '2017-05-13 11:01:19', null, '0', '1');
INSERT INTO `nn_blog_comment` VALUES ('402881ea5c397bf0015c397d0dbc0000', '24', '\n						<!-- \n							<div class=\"alert alert-default\" role=\"alert\">\n	    						<button class=\"close\"  data-dismiss=\"alert\" type=\"button\" >&times;</button>\n							    <p>回复 隔壁老王  #1 ：</p>\n							</div>\n							 -->\n						sd', '2017-05-24 16:05:16', '', '0', '1');

-- ----------------------------
-- Table structure for `nn_blog_emotion`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_emotion`;
CREATE TABLE `nn_blog_emotion` (
  `id` varchar(36) NOT NULL,
  `emotion` text NOT NULL,
  `createTime` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `praiseCount` int(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_emotion
-- ----------------------------

-- ----------------------------
-- Table structure for `nn_blog_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_favorite`;
CREATE TABLE `nn_blog_favorite` (
  `favoriteId` varchar(36) NOT NULL,
  `blogId` int(11) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`favoriteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_favorite
-- ----------------------------
INSERT INTO `nn_blog_favorite` VALUES ('297e631b5c714b04015c7187d0550002', '14', '2017-06-04 13:15:45', '1');
INSERT INTO `nn_blog_favorite` VALUES ('402881e85c7133ca015c71357e840003', '21', '2017-06-04 11:45:50', '1');
INSERT INTO `nn_blog_favorite` VALUES ('402881ea5c7db285015c7db4b0d90001', '24', '2017-06-06 22:00:13', '10');

-- ----------------------------
-- Table structure for `nn_blog_goal`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_goal`;
CREATE TABLE `nn_blog_goal` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `goal` text NOT NULL,
  `status` char(1) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_goal
-- ----------------------------

-- ----------------------------
-- Table structure for `nn_blog_index_visitor`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_index_visitor`;
CREATE TABLE `nn_blog_index_visitor` (
  `indexVisitorId` varchar(32) NOT NULL,
  `clearFlag` tinyint(1) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `indexId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`indexVisitorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_index_visitor
-- ----------------------------

-- ----------------------------
-- Table structure for `nn_blog_leave_reply`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_leave_reply`;
CREATE TABLE `nn_blog_leave_reply` (
  `replyId` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `deleteFlag` tinyint(1) DEFAULT NULL,
  `leaveId` int(11) NOT NULL,
  `reply` text,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`replyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_leave_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `nn_blog_leave_word`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_leave_word`;
CREATE TABLE `nn_blog_leave_word` (
  `leaveId` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `deleteFlag` tinyint(1) DEFAULT NULL,
  `leaveUserId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `word` text,
  PRIMARY KEY (`leaveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_leave_word
-- ----------------------------

-- ----------------------------
-- Table structure for `nn_blog_music`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_music`;
CREATE TABLE `nn_blog_music` (
  `musicId` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(200) NOT NULL,
  `sortNo` int(4) NOT NULL,
  `userId` int(11) NOT NULL,
  `lrcurl` varchar(200) DEFAULT NULL,
  `singer` varchar(50) DEFAULT NULL,
  `cover` varchar(200) DEFAULT NULL,
  `type` char(1) NOT NULL,
  PRIMARY KEY (`musicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_music
-- ----------------------------
INSERT INTO `nn_blog_music` VALUES ('402892f160f31b140160f31e40400001', '2018-01-14 13:22:14', '北京东路的日子', 'http://music.163.com/song/media/outer/url?id=5240550.mp3', '0', '1', '/static/upload/music/file/20180114132214188_1.lrc', '冯飞等', '/static/upload/music/cover/20180114132214189_4.jpg', '1');

-- ----------------------------
-- Table structure for `nn_blog_photo`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_photo`;
CREATE TABLE `nn_blog_photo` (
  `photoId` varchar(36) NOT NULL,
  `albumId` int(11) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `deleteFlag` tinyint(1) DEFAULT NULL,
  `deleteTime` datetime DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `photoDesc` varchar(200) DEFAULT NULL,
  `praiseCount` int(8) NOT NULL DEFAULT '0',
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`photoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_photo
-- ----------------------------
INSERT INTO `nn_blog_photo` VALUES ('402881e75e64cd8c015e64ce201f0000', '5', '2017-09-09 12:03:04', '0', null, '20170909/20170909120303595_2d65738f8c5494eed074fc3127f5e0fe98257e84.jpg', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e75e64cd8c015e64ce21b60001', '5', '2017-09-09 12:03:04', '0', null, '20170909/20170909120304172_4ce31609b3de9c82e2d10aa76681800a18d8439a.jpg', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e75e64cd8c015e64ce222c0002', '5', '2017-09-09 12:03:04', '0', null, '20170909/20170909120304287_4ee95f22720e0cf31b4fbdd30046f21fbf09aa9f.jpg', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e75e64cd8c015e64ce227c0003', '5', '2017-09-09 12:03:04', '0', null, '20170909/20170909120304394_5b8e22dde71190ef60e161f7c41b9d16fdfa6038.jpg', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e75e64cd8c015e64ce22cf0004', '5', '2017-09-09 12:03:05', '0', null, '20170909/20170909120304479_6da74001a18b87d686fa58370d0828381e30fd9f.jpg', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e75e64cd8c015e64ce23260005', '5', '2017-09-09 12:03:05', '0', null, '20170909/20170909120304570_8fb41ef9d72a6059f9e412322234349b023bba5b.jpg', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e75e64cd8c015e64e8133e0006', '5', '2017-09-09 12:31:24', '0', null, '20170909/20170909123124283_1492441711199_14379470315228748.PNG', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e75e64cd8c015e64e813860007', '5', '2017-09-09 12:31:25', '0', null, '20170909/20170909123124501_QQ截图20170409210623.png', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e75e64cd8c015e64e813bd0008', '5', '2017-09-09 12:31:25', '0', null, '20170909/20170909123124577_register.jpg', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e75e64cd8c015e64e8148a0009', '5', '2017-09-09 12:31:25', '0', null, '20170909/20170909123124663_无标题.png', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e85f2e3762015f2e3b81c10000', '5', '2017-10-18 14:46:13', '0', null, '20171018/20171018144612372_QQ截图20170307192049.png', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e95f0a6a85015f0a7d302c0000', '5', '2017-10-11 16:11:37', '0', null, '20171011/20171011161137105_3-1.jpg', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e95f0a6a85015f0a857af20001', '5', '2017-10-11 16:20:41', '0', null, '20171011/20171011162040782_7-1.jpg', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402881e95f0a6a85015f0a857b270002', '5', '2017-10-11 16:20:41', '0', null, '20171011/20171011162040847_2-3.jpg', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402892f160f2e0030160f2efa10a0000', '5', '2018-01-14 12:31:19', '0', null, '20180114/20180114123118572_7.jpg', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402892f160f2e0030160f2efce400001', '5', '2018-01-14 12:31:30', '0', null, '20180114/20180114123130349_7.jpg', null, '0', '1');
INSERT INTO `nn_blog_photo` VALUES ('402892f160f2e0030160f2efd1c70002', '5', '2018-01-14 12:31:31', '0', null, '20180114/20180114123131249_7.jpg', null, '0', '1');

-- ----------------------------
-- Table structure for `nn_blog_praise`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_praise`;
CREATE TABLE `nn_blog_praise` (
  `praiseId` varchar(36) NOT NULL,
  `blogId` int(11) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`praiseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_praise
-- ----------------------------
INSERT INTO `nn_blog_praise` VALUES ('297e631b5c714b04015c7187f2d70003', '24', '2017-06-04 13:15:54', '1');

-- ----------------------------
-- Table structure for `nn_blog_style`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_style`;
CREATE TABLE `nn_blog_style` (
  `userId` int(11) NOT NULL,
  `banner` varchar(200) DEFAULT NULL,
  `style` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_style
-- ----------------------------

-- ----------------------------
-- Table structure for `nn_blog_type`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_type`;
CREATE TABLE `nn_blog_type` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `typeName` varchar(50) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_type
-- ----------------------------
INSERT INTO `nn_blog_type` VALUES ('1', '2017-03-29 21:50:22', '我的博客', '0');
INSERT INTO `nn_blog_type` VALUES ('2', '2017-03-30 21:57:21', '小城大事', '1');
INSERT INTO `nn_blog_type` VALUES ('3', '2017-04-09 19:30:36', 'Java', '1');
INSERT INTO `nn_blog_type` VALUES ('4', '2017-05-05 14:17:35', '测试分类', '1');
INSERT INTO `nn_blog_type` VALUES ('5', '2017-05-05 14:18:54', '222', '1');
INSERT INTO `nn_blog_type` VALUES ('6', '2017-05-05 14:20:24', '阿萨', '1');

-- ----------------------------
-- Table structure for `nn_blog_vistor`
-- ----------------------------
DROP TABLE IF EXISTS `nn_blog_vistor`;
CREATE TABLE `nn_blog_vistor` (
  `vistorId` varchar(36) NOT NULL,
  `blogId` int(11) NOT NULL,
  `clearFlag` tinyint(1) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `ipAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`vistorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_blog_vistor
-- ----------------------------
INSERT INTO `nn_blog_vistor` VALUES ('297e631b5c392ed1015c393026790000', '24', '0', '2017-06-06 22:08:52', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('297e631b5c392ed1015c393114bc0001', '21', '0', '2017-06-06 20:34:24', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('297e631b5c39348b015c39379e350000', '24', '0', '2017-06-11 20:29:58', '0', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('297e631b5c714b04015c7180f2610000', '14', '0', '2017-06-11 10:53:45', '0', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('297e631b5c724c43015c724e03ba0000', '6', '0', '2017-06-11 20:32:57', '0', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402880895cf3c3a2015cf3c74ad10000', '27', '0', '2017-06-29 20:15:43', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402880895cf3c3a2015cf3c95bcf0001', '28', '0', '2017-06-29 20:17:59', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402880895cf3c3a2015cf3cbb0a20002', '29', '0', '2017-06-29 20:20:40', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402880895cf3c3a2015cf3cd130a0003', '30', '0', '2018-01-21 13:00:39', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881e65c77048e015c770522500000', '15', '0', '2017-06-06 22:10:19', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881e75dbcce96015dbccfaa260000', '31', '0', '2018-01-21 12:56:01', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881e75e5f3565015e5f36ad240000', '31', '0', '2017-09-08 09:59:32', '0', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881e85c7133ca015c7135bb390004', '14', '0', '2018-01-21 12:55:57', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881ea5c7d3cf3015c7d3fbd7b0000', '23', '0', '2017-06-06 19:52:28', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881ea5c7d3cf3015c7d43061d0001', '1', '0', '2017-06-06 19:57:48', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881ea5c7d651c015c7d65b8210000', '12', '0', '2017-06-06 20:33:57', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881ea5c7d651c015c7d65ecdd0001', '2', '0', '2017-06-06 20:34:11', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881ea5c7d651c015c7d6684880002', '13', '0', '2017-06-06 20:35:03', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881ea5c7d651c015c7d668e070003', '10', '0', '2017-06-06 20:34:52', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881ea5c7d651c015c7d66c2a00004', '9', '0', '2017-06-06 20:35:06', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881ea5c7db285015c7db327bb0000', '25', '0', '2017-06-06 21:58:32', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881ea5c7db8ca015c7dbcdaf10000', '26', '0', '2017-06-06 22:09:08', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `nn_blog_vistor` VALUES ('402881ea5c97264e015c9726dfd70000', '24', '0', '2017-06-11 20:35:26', '12', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for `nn_login_history`
-- ----------------------------
DROP TABLE IF EXISTS `nn_login_history`;
CREATE TABLE `nn_login_history` (
  `loginHistoryId` varchar(36) NOT NULL,
  `loginIp` varchar(20) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `successFlag` tinyint(1) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`loginHistoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_login_history
-- ----------------------------

-- ----------------------------
-- Table structure for `nn_photo_praise`
-- ----------------------------
DROP TABLE IF EXISTS `nn_photo_praise`;
CREATE TABLE `nn_photo_praise` (
  `photoPraiseId` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `photoId` varchar(36) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`photoPraiseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_photo_praise
-- ----------------------------

-- ----------------------------
-- Table structure for `nn_user`
-- ----------------------------
DROP TABLE IF EXISTS `nn_user`;
CREATE TABLE `nn_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(200) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `lastLoginIp` varchar(20) DEFAULT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `registerIp` varchar(20) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `role` int(1) NOT NULL DEFAULT '1',
  `state` int(1) NOT NULL DEFAULT '1',
  `updateTime` datetime DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_user
-- ----------------------------
INSERT INTO `nn_user` VALUES ('1', '20180121130150677_7.jpg', '2017-03-30 21:15:10', '1.1.1.1', '2017-03-30 21:15:20', '看風聼雨雪', '01e75a7c8b0409c347740c761b94037d7c907e8a569b0eb384fd8d0258a6e5a988ced1d65ea4ec9b', '0.0.0.0', 'Tomorrow is another day!!!', '2', '1', '2017-06-11 20:26:03', 'fbicewind');
INSERT INTO `nn_user` VALUES ('3', 'head000.png', '2017-06-04 15:43:59', null, null, 'test', '56f04ff166936675732a32f12f4429686377e134b4615033eb9a5b33fbee036c60954f14747bc1dd', '0:0:0:0:0:0:0:1', 'as', '0', '0', null, 'test');
INSERT INTO `nn_user` VALUES ('4', 'head000.png', '2017-06-04 15:46:41', null, null, 'test12', 'bb3a05c3828df3583cd1ba943a7dd812a7c3ee119295e77748709f0e8732e6216ca3960e226a91fd', '0:0:0:0:0:0:0:1', 'test12', '0', '0', null, 'test12');
INSERT INTO `nn_user` VALUES ('5', 'head000.png', '2017-06-04 15:56:15', null, null, 'tetete', '90dfce9f3a4f81a68ec36facd0ca46f36a233ef27413634d05ea39e795efaf66cf4c68d48fc3005c', '0:0:0:0:0:0:0:1', '', '0', '0', null, 'tetete');
INSERT INTO `nn_user` VALUES ('6', 'head000.png', '2017-06-04 15:56:59', null, null, 'tettttt', '64aac457e6fafcd94a7d6a91dd60e35222867e9873f00c6f277db1b51e46cb33edf846125448b9b9', '0:0:0:0:0:0:0:1', '', '0', '0', null, 'tettttt');
INSERT INTO `nn_user` VALUES ('7', 'head000.png', '2017-06-04 16:00:05', null, null, 'qweqwe', '2db1d649858bbe65e44b9c03fa211d8b7f7a5f53bab6abc1d6f109de7cbc28a39f11d76da9c92592', '0:0:0:0:0:0:0:1', '', '0', '0', null, 'qweqwe');
INSERT INTO `nn_user` VALUES ('8', 'head000.png', '2017-06-04 16:01:14', null, null, 'asdassd', '06e9c7f76a0e1d5ae4048b0d8a62139e0834774c4e2301980fb63c25539c9449dbbeb01e10e52a6b', '0:0:0:0:0:0:0:1', '', '0', '0', null, 'asdassd');
INSERT INTO `nn_user` VALUES ('9', 'head000.png', '2017-06-04 16:18:27', null, null, 'tgfdawd', '769fea5a94ce840b534479d22b33c28e0f111316784e10c4ec53c45cc62905f937edf0fa6dfe5044', '0:0:0:0:0:0:0:1', '', '0', '0', null, 'tgfdawd');
INSERT INTO `nn_user` VALUES ('10', 'head000.png', '2017-06-06 21:59:50', null, null, 'fbicevon', '38a2dfd9d204f8c6682d8d09376bb57d9f56e5ea8824445c241c7a242b353b4f82f9978e295d15c3', '0:0:0:0:0:0:0:1', '', '0', '0', null, 'fbicevon');
INSERT INTO `nn_user` VALUES ('11', 'head000.png', '2017-06-11 19:22:43', null, null, 'tititi', '5b01be331f2b9c372765d91d5b2aab248ec14c860cde9063a1bb569ed910e3a999bc71cf2fb85323', '0:0:0:0:0:0:0:1', '', '0', '0', null, 'tititi');
INSERT INTO `nn_user` VALUES ('12', 'head000.png', '2017-06-11 20:29:18', null, null, 'wuwuwu', '0891a2e4e15ecc4e3946536ea2e567b9ac4812e820a51e627ae79f3f409b797c3791f382d43e3ae7', '0:0:0:0:0:0:0:1', '', '0', '0', null, 'wuwuwu');
INSERT INTO `nn_user` VALUES ('13', 'head000.png', '2018-01-23 22:29:47', null, null, 'sassa', 'f459520a58660c0342f677a393f4dcdb6036b4bb3c133a0567b6efe28b34871b8089dc698297db98', '0:0:0:0:0:0:0:1', '', '0', '0', null, 'fbicewindl2');
INSERT INTO `nn_user` VALUES ('14', 'head000.png', '2018-01-23 22:30:24', null, null, 'dsfew', '2aba5bedb410f20fd617e0e66f92b6d0072d003fd1898636f0fa6d78d11b57bd418060fd1f1111c8', '0:0:0:0:0:0:0:1', '', '0', '0', null, 'fbicewind12s');

-- ----------------------------
-- Table structure for `nn_user_ext_info`
-- ----------------------------
DROP TABLE IF EXISTS `nn_user_ext_info`;
CREATE TABLE `nn_user_ext_info` (
  `userId` int(11) NOT NULL,
  `birthday` date DEFAULT NULL,
  `blogCount` int(8) NOT NULL DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `gender` int(1) NOT NULL DEFAULT '2',
  `mobile` varchar(15) DEFAULT NULL,
  `musicCount` int(8) NOT NULL DEFAULT '0',
  `photoCount` int(8) NOT NULL DEFAULT '0',
  `profession` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nn_user_ext_info
-- ----------------------------
INSERT INTO `nn_user_ext_info` VALUES ('1', '1992-10-06', '16', '', '2', '', '0', '0', '');
INSERT INTO `nn_user_ext_info` VALUES ('3', '2017-06-28', '0', 'as@qq.com', '2', '12312312311', '0', '0', 'IT');
INSERT INTO `nn_user_ext_info` VALUES ('4', '2017-06-06', '0', 'sd@qq.com', '2', 'test12test1', '0', '0', 'test12');
INSERT INTO `nn_user_ext_info` VALUES ('5', null, '0', '', '2', '', '0', '0', '');
INSERT INTO `nn_user_ext_info` VALUES ('6', null, '0', '', '2', '', '0', '0', '');
INSERT INTO `nn_user_ext_info` VALUES ('7', null, '0', '', '2', '', '0', '0', '');
INSERT INTO `nn_user_ext_info` VALUES ('8', null, '0', '', '2', '', '0', '0', '');
INSERT INTO `nn_user_ext_info` VALUES ('9', null, '0', '', '2', '', '0', '0', '');
INSERT INTO `nn_user_ext_info` VALUES ('10', '2017-06-19', '0', '', '2', '', '0', '0', '');
INSERT INTO `nn_user_ext_info` VALUES ('11', null, '0', '', '1', '', '0', '0', '');
INSERT INTO `nn_user_ext_info` VALUES ('12', null, '0', '', '2', '', '0', '0', '');
INSERT INTO `nn_user_ext_info` VALUES ('13', null, '0', '', '1', '', '0', '0', '');
INSERT INTO `nn_user_ext_info` VALUES ('14', null, '0', '', '2', '', '0', '0', '');

-- ----------------------------
-- Table structure for `persistent_logins`
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
INSERT INTO `persistent_logins` VALUES ('fbicewind', 'NY/VzE3vu1l3A5RfzAIteQ==', 'ZAUkPm6Huq/Hjhu/EyoMow==', '2018-01-23 22:30:34');

-- ----------------------------
-- Table structure for `resume_work_experience`
-- ----------------------------
DROP TABLE IF EXISTS `resume_work_experience`;
CREATE TABLE `resume_work_experience` (
  `experienceId` varchar(36) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `project` varchar(30) NOT NULL,
  `company` varchar(20) NOT NULL,
  `workContent` text,
  `workTechnology` varchar(255) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`experienceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resume_work_experience
-- ----------------------------
INSERT INTO `resume_work_experience` VALUES ('6cb245e1-c12e-4fd4-8ca6-08f9781d55a5', '2016-10-10 20:14:16', '2016-11-30 20:14:29', '唐钢智慧服务项目', 'HPE', '后台bug修复|||导入导出excel功能修改|||APP后台接口修改', 'Spring,Hibernate,SpringMVC,Oracle,EasyUI', '<p>进入唐钢项目时，项目已经处于比较完善的状态，只需要修改一些bug，技术难度都不大。</p>');
INSERT INTO `resume_work_experience` VALUES ('a0c6a0fa-87b9-4662-903f-4efc8214b437', '2016-07-11 20:06:05', '2016-08-19 20:06:22', 'Java技术面试系统', 'HPE', '后台框架Spring + Hibernate + SpringMVC + MySql框架搭建|||前台Bootstrap + jQuery|||Hibernate的BaseDao，BaseService实现（CRUD，分页查询）|||JSP页面实现|||前后台交互功能实现|||带同期新人', 'Spring,Hibernate,SpringMVC,Bootstrap,jQuery,MySql', '<p>正式进入HPE，在准备期间独立开发的一个小系统，帮助team中的任何人都能进行技术面试。</p><p>自己搭了一个比较简单的框架，搜集了许多的面试题，能根据被面试者的不同技能水平出题。</p>');
INSERT INTO `resume_work_experience` VALUES ('c2728078-017e-4336-9a82-b83ff01fe07a', '2015-10-12 19:56:18', '2016-01-13 19:56:41', '网居网', '网居网技术（大连）有限公司', '前端静态页面实现|||个人中心部分功能实现|||社区模块开发|||整体项目中富文本编辑器的使用研究|||多图上传页面设计，js实现', 'Spring,Hibernate,SpringMVC,Spring Security,Bootstrap,jQuery,MySql', '<p>网居网规模不大，但是凝聚力很强。在网居网期间，学到了很多的东西。虽然还是实习期间，但过度挺短，之后就能独立负责模块的开发。</p><p>主要偏向前端开发，后台因为用的Hibernate，框架功能封装的好，用起来也比较简单。</p>');
INSERT INTO `resume_work_experience` VALUES ('cfd71641-6022-4f57-8809-5be41e390879', '2016-08-29 20:10:22', '2017-03-31 20:10:36', '可口可乐原物料追溯系统', 'HPE', '根据客户需求，修改开发后台功能，存在较大的需求变更|||手持设备PDA修改开发|||用例测试|||项目代码规范整理|||业务数据整理并支持项目上线|||项目上线后bug修复', 'Spring,Hibernate,SpringMVC,SQL Server,EasyUI,C#,SQLite,Sonar', '<p>进入HPE正式接手的第一个项目，一开始只是一个短期开发，项目处于收尾阶段，简单修改bug就行。但后来客户那边的需求变化比较大，UAT也测出了几个影响流程的bug，因此这个短期项目变成了长期项目。</p><p>MTS系统每一个环节都和前后关联比较大，修改起来难度也比较大，整个项目里就只有一个我这个开发，同时负责后台和PDA端的修改。</p>');
INSERT INTO `resume_work_experience` VALUES ('e04dc9cb-962c-48ac-9830-99a0ea33ee84', '2016-11-21 20:16:40', null, 'Yum MenuCenter', 'HPE', '敏捷开发，后台部分模块开发（EasyUI页面+后台CRUD）|||FTP + SSL文件上传功能开发|||上传功能修改，图片预览功能实现', 'Spring,MyBatis,SpringMVC,SQL Server,EasyUI,redis,shiro', '<p>MenuCenter项目是正式自己开发，自己修复bug的一个项目。</p><p>需要用到的东西也特别多，项目用到的是敏捷开发，但因为客户需求的不确定，反而给开发带来了许多麻烦。</p><p>在开发的同时，还带领了team里同期的一个同事，教一些开发相关的知识。</p>');
INSERT INTO `resume_work_experience` VALUES ('f6b891f6-5bc3-4e41-bcd2-6c1f99ec1c08', '2016-02-24 20:03:45', '2016-05-20 20:04:03', 'PRM & TestDrive', 'HPE', 'JSF和Primefaces的XHTML页面修改，布局样式调整|||RESTful接口实现', 'Spring,Spring Data JPA,SpringMVC,JSF,Primefaces', '<p>在HPE实习期间工作的两个项目，都是同一个团队同一个框架。前端用的是JSF和特别小众但是开发特别快的Primefaces。</p><p>后台持久层用的Spring Data JPA，功能也比较简单。前端用的是JSF和Primefaces，但是因为封装性比较好，所以界面的优化比较困难，因此这俩项目上更加注重前端的调整。</p>');
