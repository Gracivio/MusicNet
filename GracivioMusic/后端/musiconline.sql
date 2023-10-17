/*
 Navicat Premium Data Transfer

 Source Server         : Gracivio
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : musiconline

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 16/07/2023 15:53:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NOT NULL,
  `sex` tinyint(1) NULL DEFAULT NULL,
  `phoneNum` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `birthday` datetime(6) NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `avator` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `registerTime` datetime(6) NULL DEFAULT NULL,
  `updateTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (1, '长草的小提琴', '123456', 1, '17855954516', '3184247758@qq.com', '2003-04-25 00:00:00.000000', '好好学习，天天向上', '重庆-沙坪坝', '/img/SingerPic/1689141538027微信图片_20230712135845.jpg', '2023-06-30 20:40:52.000000', '2023-07-12 13:58:58.000000');
INSERT INTO `client` VALUES (3, 'prince', '123456', 0, '15253267874', '2010894578@qq.com', '2003-07-06 00:00:00.000000', '热爱滚烫', '江苏-苏州', '/img/SingerPic/1688141527826girl1.png', '2023-06-30 23:15:00.000000', '2023-07-01 00:12:07.000000');
INSERT INTO `client` VALUES (4, '轻描', '123456', 0, '15955369485', '3164928705@qq.com', '2023-09-09 00:00:00.000000', '相逢的人会再相遇', '重庆-沙坪坝', '/img/SingerPic/1688141536814girl2.png', '2023-07-01 00:06:54.000000', '2023-07-01 00:12:16.000000');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL,
  `type` tinyint(0) NULL DEFAULT NULL,
  `song_id` int(0) NULL DEFAULT NULL,
  `song_list_id` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_german2_ci COMMENT = '0表示歌曲，1表示歌单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (5, 1, 0, 24, NULL, '2023-07-05 01:49:36');
INSERT INTO `collect` VALUES (9, 1, 0, 12, NULL, '2023-07-05 02:02:36');
INSERT INTO `collect` VALUES (10, 1, 0, 8, NULL, '2023-07-05 02:17:44');
INSERT INTO `collect` VALUES (18, 1, 0, 23, NULL, '2023-07-05 02:47:32');
INSERT INTO `collect` VALUES (20, 1, 0, 22, NULL, '2023-07-05 02:51:51');
INSERT INTO `collect` VALUES (21, 1, 0, 10, NULL, '2023-07-05 03:20:56');
INSERT INTO `collect` VALUES (22, 1, 0, 11, NULL, '2023-07-05 10:16:20');
INSERT INTO `collect` VALUES (23, 1, 0, 21, NULL, '2023-07-05 15:15:11');
INSERT INTO `collect` VALUES (24, 1, 0, 14, NULL, '2023-07-12 17:20:31');
INSERT INTO `collect` VALUES (25, 1, 0, 18, NULL, '2023-07-13 16:37:53');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT NULL,
  `song_id` int(0) NULL DEFAULT NULL,
  `songlist_id` int(0) NULL DEFAULT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL,
  `up` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for listsong
-- ----------------------------
DROP TABLE IF EXISTS `listsong`;
CREATE TABLE `listsong`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `song_id` int(0) NULL DEFAULT NULL,
  `songlist_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of listsong
-- ----------------------------
INSERT INTO `listsong` VALUES (1, 9, 2);
INSERT INTO `listsong` VALUES (3, 8, 2);
INSERT INTO `listsong` VALUES (4, 14, 2);
INSERT INTO `listsong` VALUES (5, 10, 5);
INSERT INTO `listsong` VALUES (6, 11, 5);
INSERT INTO `listsong` VALUES (7, 13, 2);
INSERT INTO `listsong` VALUES (9, 17, 6);
INSERT INTO `listsong` VALUES (10, 18, 5);
INSERT INTO `listsong` VALUES (11, 21, 8);
INSERT INTO `listsong` VALUES (12, 22, 8);
INSERT INTO `listsong` VALUES (13, 24, 8);
INSERT INTO `listsong` VALUES (14, 26, 7);
INSERT INTO `listsong` VALUES (15, 28, 7);
INSERT INTO `listsong` VALUES (16, 27, 7);

-- ----------------------------
-- Table structure for musiclist
-- ----------------------------
DROP TABLE IF EXISTS `musiclist`;
CREATE TABLE `musiclist`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `singer_id` int(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `lyric` text CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `click_times` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of musiclist
-- ----------------------------
INSERT INTO `musiclist` VALUES (8, 1, '薛之谦-演员', '初学者', '2023-06-29 21:22:44', '2023-07-01 17:48:26', '/img/SingerPic/1688046968356演员.png', '[00:00.31] 演员 - 薛之谦\n[00:08.61] 词曲：薛之谦\n[00:21.12] 简单点说话的方式简单点\n[00:30.20] 递进的情绪请省略\n[00:33.64] 你又不是个演员\n[00:36.38] 别设计那些情节\n[00:41.93] 没意见我只想看看你怎么圆\n[00:51.54] 你难过的太表面 像没天赋的演员\n[00:57.15] 观众一眼能看见\n[01:02.22] 该配合你演出的我演视而不见\n[01:07.68] 在逼一个最爱你的人即兴表演\n[01:12.90] 什么时候我们开始收起了底线\n[01:18.02] 顺应时代的改变看那些拙劣的表演\n[01:23.42] 可你曾经那么爱我干嘛演出细节\n[01:28.63] 我该变成什么样子才能延缓厌倦\n[01:33.87] 原来当爱放下防备后的这些那些\n[01:39.37] 才是考验\n[01:44.60] 没意见你想怎样我都随便\n[01:54.53] 你演技也有限\n[01:57.58] 又不用说感言\n[02:00.15] 分开就平淡些\n[02:05.16] 该配合你演出的我演视而不见\n[02:10.53] 别逼一个最爱你的人即兴表演\n[02:15.81] 什么时候我们开始没有了底线\n[02:21.00] 顺着别人的谎言被动就不显得可怜\n[02:26.42] 可你曾经那么爱我干嘛演出细节\n[02:31.52] 我该变成什么样子才能配合出演\n[02:36.72] 原来当爱放下防备后的这些那些\n[02:41.86] 都有个期限\n[02:47.56] 其实台下的观众就我一个\n[02:53.04] 其实我也看出你有点不舍\n[02:58.34] 场景也习惯我们来回拉扯\n[03:02.93] 还计较着什么\n[03:08.71] 其实说分不开的也不见得\n[03:14.03] 其实感情最怕的就是拖着\n[03:19.21] 越演到重场戏越哭不出了\n[03:24.07] 是否还值得\n[03:29.07] 该配合你演出的我尽力在表演\n[03:34.39] 像情感节目里的嘉宾任人挑选\n[03:39.68] 如果还能看出我有爱你的那面\n[03:44.82] 请剪掉那些情节让我看上去体面\n[03:50.04] 可你曾经那么爱我干嘛演出细节\n[03:55.31] 不在意的样子是我最后的表演\n[04:01.05] 是因为爱你我才选择表演这种成全', '/song/1688048593035演员 - 薛之谦.mp3', 12);
INSERT INTO `musiclist` VALUES (9, 1, '薛之谦-丑八怪', '意外', '2023-06-29 21:23:48', '2023-07-03 18:22:19', '/img/SingerPic/1688047170022意外.png', '[00:00.63]丑八怪 - 薛之谦\n[00:03.13]作词：甘世佳\n[00:05.32]作曲：李荣浩\n[00:16.98]\n[00:20.26]如果世界漆黑 其实我很美\n[00:23.88]在爱情里面进退 最多被消费\n[00:27.70]不管同样的是非\n[00:29.69]又怎么不对 无所谓\n[00:35.69]如果像你一样 总有人谄媚\n[00:39.32]围绕着我的卑微 也许能消退\n[00:43.32]其实我并不在意 有很多机会\n[00:46.69]像巨人一样的无畏\n[00:49.51]放纵我心里的鬼\n[00:51.20]可是我不配\n[00:54.46]丑八怪 能否别把灯打开\n[01:02.21]我要的爱 出没在漆黑一片的舞台\n[01:09.46]丑八怪 在这暧昧的时代\n[01:17.58]我的存在 像意外\n[01:24.48]\n[01:37.79]有人用一滴泪 会红颜祸水\n[01:41.35]有人丢掉称谓 什么也不会\n[01:45.29]只要你足够虚伪\n[01:47.10]就不怕魔鬼 对不对\n[01:53.05]如果剧本写好 谁比谁高贵\n[01:56.74]我只能沉默以对 美丽本无罪\n[02:00.63]当欲望开始贪杯 有更多机会\n[02:04.07]像尘埃一样的无畏\n[02:06.89]化成灰谁认得谁管他配不配\n[02:08.65]\n[02:11.96]丑八怪 能否别把灯打开\n[02:19.52]我要的爱 出没在漆黑一片的舞台\n[02:26.83]丑八怪 在这暧昧的时代\n[02:34.96]我的存在 不意外\n[02:42.33]\n[03:01.96]丑八怪 其实见多就不怪\n[03:09.96]放肆去high 用力踩\n[03:14.15]那不堪一击的洁白\n[03:17.21]丑八怪 这是我们的时代\n[03:25.48]我不存在 才意外', '/song/1688379739207丑八怪（电视剧《如果我爱你》插曲）-薛之谦.mp3', 5);
INSERT INTO `musiclist` VALUES (10, 9, 'IU-Celebrity', 'LILAC', '2023-06-29 22:07:16', '2023-07-03 23:29:16', '/img/SingerPic/1688047703379celebrity.png', '[00:00.000] 作词 : IU\n[00:00.000] 作曲 : 无\n[00:00.000] 作曲 : Ryan S. Jhun/Jeppe London Bilsby/Lauritz Emil Christiansen/IU/Chloe Latimer/Celine Svanbäck\n[00:00.001] UPLOAD by 陈启甸\n[00:00.428]翻唱：恩恩\n[00:00.857]세상의 모서리\n[00:00.857]世界的四方棱角\n[00:03.372]구부정하게 커버린\n[00:03.372]以微驼伛偻的姿态 成长起来的\n[00:05.782]골칫거리 outsider\n[00:05.782]令人伤脑筋 不入流的人\n[00:09.780]\n[00:10.352]걸음걸이, 옷차림,\n[00:10.352]步调仪态 衣裳穿着\n[00:13.046]이어폰 너머 play list\n[00:13.046]耳机另一端 所播放的列表\n[00:15.369]음악까지 다 minor\n[00:15.369]就连音乐 也都是小众曲目\n[00:19.468]\n[00:20.085]넌 모르지\n[00:20.085]你并不知晓吧\n[00:22.429]떨군 고개 위\n[00:22.429]耷拉的脑袋上方\n[00:24.571]환한 빛 조명이\n[00:24.571]明亮灿烂的灯火\n[00:27.050]어딜 비추는지\n[00:27.050]是在朝何处照耀\n[00:29.271]\n[00:29.521]느려도 좋으니\n[00:29.521]就算有些迟缓也无妨\n[00:31.734]결국 알게 되길\n[00:31.734]希望你终能了然于心\n[00:34.285]The one and only\n[00:34.285]如此独一无二的你\n[00:37.201]You are my celebrity\n[00:37.201]在我看来 你就是耀眼名人\n[00:39.823]\n[00:40.029]잊지마 넌 흐린 어둠 사이\n[00:40.029]请不要忘却 你在朦胧黑暗间\n[00:44.814]왼손으로 그린 별 하나\n[00:44.814]用左手所勾勒的那颗星星\n[00:49.360]보이니 그 유일함이 얼마나\n[00:49.360]你可有看见吗 那份唯一\n[00:54.286]아름다운지 말야\n[00:54.286]是有多么美不堪言\n[00:56.730]You are my celebrity\n[00:56.730]你是独属于我的名人\n[00:58.980]\n[01:06.645]celebrity\n[01:06.645]\n[01:15.858]You are my celebrity\n[01:15.858]你是独属于我的名人\n[01:17.877]\n[01:18.059]지쳐버린 표정 마치\n[01:18.059]疲惫不堪的表情\n[01:20.126]전원을 꺼놓은 듯이\n[01:20.126]就好似已关掉电源般\n[01:22.560]심장소린 too quiet\n[01:22.560]心跳声 实在太过安静\n[01:26.810]\n[01:27.326]네가 가진 반짝거림,\n[01:27.326]你所拥有的闪光之处\n[01:29.665]상상력, identity\n[01:29.665]想象力 以及你本身\n[01:32.194]까지 모조리 diet\n[01:32.194]所有一切 都令我甘之如饴\n[01:35.753]\n[01:36.968]넌 모르지\n[01:36.968]你未曾得知吧\n[01:39.145]아직 못다 핀\n[01:39.145]为还没完全盛放的你 (注: 此处与呼应)\n[01:41.301]널 위해 쓰여진\n[01:41.301]而提笔撰写创作的\n[01:43.846]오래된 사랑시\n[01:43.846]古老的爱之诗歌 (注: 사랑시 理解为呼应IU迷你五辑及其同名收录曲, 오래되다 亦可译作陈旧的/许久以前的来表达多重含义)\n[01:46.113]\n[01:46.301]헤매도 좋으니\n[01:46.301]就算稍作彷徨也无妨\n[01:48.567]웃음 짓게 되길\n[01:48.567]唯愿能令你绽放笑颜\n[01:51.214]The one and only\n[01:51.214]如此独一无二的你\n[01:54.138]You are my celebrity\n[01:54.138]在我看来 你就是耀眼名人\n[01:56.742]\n[01:57.026]잊지마 넌 흐린 어둠 사이\n[01:57.026]请不要忘却 你在浑浊黑暗间\n[02:01.581]왼손으로 그린 별 하나\n[02:01.581]用左手所绘出的那颗星星\n[02:06.479]보이니 그 유일함이 얼마나\n[02:06.479]你可有看见吗 那份唯一\n[02:11.177]아름다운지 말야\n[02:11.177]是有多么无与伦比\n[02:13.608]You are my celebrity\n[02:13.608]你是独属于我的名人\n[02:15.859]\n[02:15.934]발자국마다 이어진 별자리\n[02:15.934]伴随每一步 逐渐连接完整的星座\n[02:20.052]그 서투른 걸음이 새겨놓은 밑그림\n[02:20.052]那笨拙的步伐 所镌刻而下的草图\n[02:25.600]오롯이 너를 만나러 가는 길\n[02:25.600]为去与你相见 而孤寂前行之路\n[02:29.740]그리로 가면 돼 점선을 따라\n[02:29.740]只需沿着虚线 朝那里走去即可\n[02:34.718]\n[02:35.168]잊지마 이 오랜 겨울 사이\n[02:35.168]请不要遗忘 在这漫长冬季间\n[02:39.925]언 틈으로 피울 꽃 하나\n[02:39.925]从冰缝之隙 绽放的一朵花\n[02:44.538]보이니 하루 뒤 봄이 얼마나\n[02:44.538]你可有看见吗 一日后的暖春\n[02:49.654]아름다울지 말야\n[02:49.654]是有多么美不堪言\n[02:51.932]You are my celebrity\n[02:51.932]你是独属于我的名人\n[02:53.965]\n[03:01.828]celebrity\n[03:01.828]\n[03:11.141]You are my celebrity\n[03:11.141]你是专属我的 闪闪发光的所在', '/song/1688047727881IU-Celebrity.mp3', 24);
INSERT INTO `musiclist` VALUES (11, 9, 'IU-Flu', 'LILAC', '2023-06-29 23:50:23', '2023-07-03 23:29:57', '/img/SingerPic/1688054390973flu.png', '暂无歌词', '/song/1688053823407IU-Flu.mp3', 7);
INSERT INTO `musiclist` VALUES (12, 10, '林俊杰-修炼爱情', '因你而在', '2023-06-30 00:01:19', '2023-07-09 15:25:42', '/img/SingerPic/1688054491793修炼爱情.png', '[00:00.000] 作词 : 易家扬\n[00:00.750] 作曲 : 林俊杰\n[00:01.500] 编曲 : 吴庆隆\n[00:02.250] 制作人 : 林俊杰\n[00:16.972]凭什么要失望\n[00:03.000]\n[00:24.043]藏眼泪到心脏\n[00:28.830]往事不会说谎 别跟它为难\n[00:36.057]我们两人之间不需要这样\n[00:43.191]我想\n[00:46.215]修炼爱情的心酸\n[00:49.821]学会放好以前的渴望\n[00:53.833]我们那些信仰要忘记多难\n[01:00.477]远距离的欣赏 近距离的迷惘\n[01:04.046]谁说太阳会找到月亮\n[01:08.078]别人有的爱我们不可能模仿\n[01:14.608]修炼爱情的悲欢\n[01:18.275]我们这些努力不简单\n[01:22.229]快乐炼成泪水是一种勇敢\n[01:28.912]几年前的幻想 几年后的原谅\n[01:32.539]为一张脸去养一身伤\n[01:36.490]别讲想念我 我会受不了这样\n[01:45.793]记忆它真嚣张\n[01:52.936]路灯把痛点亮\n[01:57.799]情人一起看过多少次月亮\n[02:04.931]它在天空看过多少次遗忘\n[02:11.599]多少心慌\n[02:15.053]修炼爱情的心酸\n[02:18.704]学会放好以前的渴望\n[02:22.745]我们那些信仰要忘记多难\n[02:29.275]远距离的欣赏 近距离的迷惘\n[02:32.908]谁说太阳会找到月亮\n[02:36.880]别人有的爱我们不可能模仿\n[02:43.604]修炼爱情的悲欢\n[02:47.155]我们这些努力不简单\n[02:51.083]快乐炼成泪水是一种勇敢\n[02:57.709]几年前的幻想 几年后的原谅\n[03:01.374]为一张脸去养一身伤\n[03:05.342]别讲想念我 我会受不了这样 Oh\n[03:23.573]笑着说爱让人疯狂\n[03:27.142]哭着说爱让人紧张\n[03:30.775]忘不了那个人就投降\n[03:38.603]修炼爱情的悲欢\n[03:42.225]我们这些努力不简单\n[03:46.221]快乐炼成泪水是一种勇敢 Wooh\n[03:52.849]几年前的幻想 几年后的原谅\n[03:56.424]为一张脸去养一身伤\n[04:00.414]别讲想念我 我会受不了这样\n[04:07.068]几年前的幻想 几年后的原谅\n[04:10.701]为一张脸去养一身伤\n[04:14.647]别讲想念我\n[04:16.770]我会受不了这样\n[04:18.361] 配唱编写 : 许环良\n[04:19.952] 制作协力 : Gary Leo/周信廷\n[04:21.543] 键盘 : 吴庆隆\n[04:23.134] 吉他 : Jamie Wilson/Grecco Buratto\n[04:24.725] 鼓 : Brendan Buckley\n[04:26.316] 低音吉他 : Eric Holden\n[04:27.907] 第一小提琴 : 孔朝辉/顾文丽/魏喆/陈大伟/孔宪隆\n[04:29.498] 第二小提琴 : 隋晶晶/尹淑占/孔宪隆\n[04:31.089] 中提琴 : 水兵/关旗\n[04:32.680] 大提琴 : 王言/赵羽儿\n[04:34.271] 和声编写 : 林俊杰\n[04:35.862] 和声 : 林俊杰\n[04:37.453] 录音室 : The Fire (SG)/Yellow Box (SG)/Studio In The Hill (SG)/Boss Studio (SG)/Impactstudio (Taipei)/Layer Cake Studio (LA)\n[04:39.044] 录音师 : 许环良/Gary Leo/Philip Wong/陈忠宏/Brendan Buckley\n[04:40.635] 混音室 : 白金录音室 (Taipei)\n[04:42.226] 混音师 : 林正忠', '/song/168805447983410.修炼爱情 - 林俊杰.mp3', 7);
INSERT INTO `musiclist` VALUES (14, 11, '于文文-体面', '体面', '2023-06-30 00:10:47', '2023-07-03 23:28:41', '/img/SingerPic/1688055055696体面.png', '[00:00.000] 作词 : 唐恬\n[00:01.000] 作曲 : 于文文\n[00:16.120]别堆砌怀念让剧情变得狗血\n[00:26.454]深爱了多年又何必毁了经典\n[00:35.271]都已成年不拖不欠\n[00:40.904]浪费时间是我情愿\n[00:46.843]像谢幕的演员\n[00:50.136]眼看着灯光熄灭\n[00:58.088]来不及再轰轰烈烈\n[01:03.570]就保留告别的尊严\n[01:08.970]我爱你不后悔\n[01:12.592]也尊重故事结尾\n[01:20.570]分手应该体面 谁都不要说抱歉\n[01:27.436]何来亏欠 我敢给就敢心碎\n[01:32.969]镜头前面 是从前的我们\n[01:37.470]在喝彩 流着泪声嘶力竭\n[01:42.887]离开也很体面 才没辜负这些年\n[01:49.820]爱得热烈 认真付出的画面\n[01:55.520]别让执念 毁掉了昨天\n[02:00.540]我爱过你 利落干脆\n[02:27.979]最熟悉的街主角却换了人演\n[02:38.245]我哭到哽咽心再痛就当破茧\n[02:48.143]来不及再轰轰烈烈\n[02:53.695]就保留告别的尊严\n[02:59.445]我爱你不后悔\n[03:02.895]也尊重故事结尾\n[03:10.546]分手应该体面 谁都不要说抱歉\n[03:17.545]何来亏欠 我敢给就敢心碎\n[03:23.094]镜头前面 是从前的我们\n[03:27.594]在喝彩 流着泪声嘶力竭\n[03:33.045]离开也很体面 才没辜负这些年\n[03:40.095]爱得热烈 认真付出的画面\n[03:46.262]别让执念 毁掉了昨天\n[03:50.579]我爱过你 利落干脆\n[03:56.578]再见 不负遇见', '/song/1688055047283于文文-体面.mp3', 9);
INSERT INTO `musiclist` VALUES (15, 13, '邓紫棋-泡沫', 'Xposed', '2023-06-30 00:18:01', '2023-07-03 23:32:24', '/img/SingerPic/1688055497207泡沫.png', '[00:00.00] 作词 : G.E.M.邓紫棋\n[00:00.19] 作曲 : G.E.M.邓紫棋\n[00:00.39] 编曲 : Lupo Groinig\n[00:00.59] 制作人 : Lupo Groinig\n[00:00.79]阳光下的泡沫 是彩色的\n[00:08.29]就像被骗的我 是幸福的\n[00:15.37]追究什么对错 你的谎言\n[00:22.32]基于你还爱我\n[00:28.32]美丽的泡沫 虽然一刹花火\n[00:35.66]你所有承诺 虽然都太脆弱\n[00:42.67]但爱像泡沫 如果能够看破\n[00:49.67]有什么难过\n[00:57.78]早该知道泡沫 一触就破\n[01:04.76]就像已伤的心 不胜折磨\n[01:11.89]也不是谁的错 谎言再多\n[01:18.86]基于你还爱我\n[01:25.11]美丽的泡沫 虽然一刹花火\n[01:32.00]你所有承诺 虽然都太脆弱\n[01:39.16]爱本是泡沫 如果能够看破\n[01:46.24]有什么难过\n[01:53.37]再美的花朵 盛开过就凋落\n[02:00.39]再亮眼的星 一闪过就坠落\n[02:07.39]爱本是泡沫 如果能够看破\n[02:14.37]有什么难过\n[02:21.58]为什么难过 有什么难过\n[02:35.65]为什么难过\n[02:46.23]全都是泡沫 只一刹的花火\n[02:53.23]你所有承诺 全部都太脆弱\n[03:00.34]而你的轮廓 怪我没有看破\n[03:07.34]才如此难过\n[03:14.47]相爱的把握 要如何再搜索\n[03:21.50]相拥着寂寞 难道就不寂寞\n[03:28.71]爱本是泡沫 怪我没有看破\n[03:35.65]才如此难过\n[03:43.73]在雨下的泡沫 一触就破\n[03:50.70]当初炽热的心 早已沉没\n[03:57.73]说什么你爱我 如果骗我\n[04:04.76]我宁愿你沉默', '/song/1688055481982__泡沫-G.E.M.邓紫棋(5321854).mp3', 0);
INSERT INTO `musiclist` VALUES (16, 13, '邓紫棋-多远都要在一起', '新的心跳', '2023-06-30 00:19:58', '2023-07-03 23:32:49', '/img/SingerPic/1688055608805多远都要在一起.png', '[00:00.00] 作词 : G.E.M.邓紫棋\n[00:01.00] 作曲 : G.E.M.邓紫棋\n[00:02.00] 编曲 : Lupo Groinig\n[00:03.00] 制作人 : Lupo Groinig\n[00:04.00] 监制 : Lupo Groinig\n[00:11.09]\n[00:14.28]想听你听过的音乐\n[00:16.69]想看你看过的小说\n[00:20.31]我想收集每一刻\n[00:22.72]我想看到你眼里的世界\n[00:28.23]想到你到过的地方\n[00:30.75]和你曾渡过的时光\n[00:34.42]不想错过每一刻\n[00:36.77]多希望我一直在你身旁\n[00:42.80]未来何从何去\n[00:45.18]你快乐我也就没关系\n[00:48.50]对你我最熟悉\n[00:50.91]你爱自由我却更爱你\n[00:55.38]我能习惯远距离\n[00:58.95]爱总是身不由己\n[01:02.43]宁愿换个方式至少还能\n[01:07.25]遥远爱着你\n[01:09.53]爱能克服远距离\n[01:13.21]多远都要在一起\n[01:16.53]你已经不再存在我世界里\n[01:21.83]请不要离开我的回忆\n[01:39.10]想你说爱我的语气\n[01:41.57]想你望着我的眼睛\n[01:45.02]不想忘记每一刻\n[01:47.32]用思念让我们一直前进\n[01:52.93]想像你失落的唇印\n[01:55.28]想像你失约的旅行\n[01:58.76]想像你离开的一刻\n[02:01.38]如果我有留下你的勇气\n[02:06.18]我能习惯远距离\n[02:09.25]爱总是身不由己\n[02:13.05]宁愿换个方式至少还能\n[02:17.77]遥远爱着你\n[02:20.19]爱能克服远距离\n[02:23.64]多远都要在一起\n[02:27.59]我已经不再存在你的心里\n[02:32.28]就让我独自守着回忆\n[02:36.09]如果阳光永远都炽热\n[02:39.65]如果彩虹不会掉颜色\n[02:42.99]你能不能不离开呢\n[02:50.02]我能习惯远距离\n[02:53.68]爱总是身不由己\n[02:57.40]宁愿换个方式至少还能\n[03:01.91]遥远爱着你\n[03:04.24]爱能克服远距离\n[03:07.75]多远都要在一起\n[03:11.54]你已经不再存在我世界里\n[03:16.62]请不要离开我的回忆\n[03:25.73]请不要离开\n[03:27.23]不要离开我的回忆', '/song/1688055598885G.E.M.邓紫棋 - 多远都要在一起.mp3', 0);
INSERT INTO `musiclist` VALUES (17, 12, '陈奕迅-十年', '黑白灰', '2023-06-30 00:23:27', '2023-07-03 23:31:55', '/img/SingerPic/1688055823471十年.png', '[00:00.00] 作曲 : 陈小霞\n[00:01.00] 编曲 : 陈辉阳\n[00:02.00] 制作人 : 陈小霞/陈辉阳\n[00:03.00] 录音师 : 陈忠宏/亚祥 (HK)\n[00:04.00] 录音室 : 白金/AVON (HK)\n[00:05.00] 混音工程师 : 王家栋\n[00:06.00] 混音录音室 : 节奏\n[00:15.54]如果那两个字没有颤抖\n[00:19.26]我不会发现 我难受\n[00:22.64]怎么说出口\n[00:26.08]也不过是分手\n[00:30.77]如果对于明天没有要求\n[00:34.85]牵牵手就像旅游\n[00:37.96]成千上万个门口\n[00:41.70]总有一个人要先走\n[00:47.39]怀抱既然不能逗留\n[00:50.89]何不在离开的时候\n[00:53.77]一边享受 一边泪流\n[01:00.93]十年之前\n[01:02.95]我不认识你\n[01:04.89]你不属于我\n[01:06.87]我们还是一样\n[01:09.24]陪在一个陌生人左右\n[01:13.12]走过渐渐熟悉的街头\n[01:16.46]十年之后\n[01:18.33]我们是朋友\n[01:20.31]还可以问候\n[01:22.27]只是那种温柔\n[01:24.70]再也找不到拥抱的理由\n[01:28.64]情人最后难免沦为朋友\n[01:57.07]怀抱既然不能逗留\n[02:00.54]何不在离开的时候\n[02:03.58]一边享受 一边泪流\n[02:10.63]十年之前\n[02:12.65]我不认识你\n[02:14.63]你不属于我\n[02:16.50]我们还是一样\n[02:18.98]陪在一个陌生人左右\n[02:22.72]走过渐渐熟悉的街头\n[02:26.15]十年之后我们是朋友\n[02:30.04]还可以问候\n[02:32.01]只是那种温柔\n[02:34.38]再也找不到拥抱的理由\n[02:38.27]情人最后难免沦为朋友\n[02:48.19]直到和你做了多年朋友\n[02:52.38]才明白我的眼泪\n[02:55.21]不是为你而流\n[02:58.99]也为别人而流', '/song/1688055807815陈奕迅 - 十年.mp3', 4);
INSERT INTO `musiclist` VALUES (18, 17, 'BLACKPINK-DUU-DU DUU-DU', 'DUU-DU DUU-DU', '2023-06-30 23:33:02', '2023-06-30 23:33:36', '/img/SingerPic/1688139216262duu.png', '暂无歌词', '/song/1688139182726DDU-DU DDU-DU (Japanese Ver.) - BLACKPINK.mp3', 7);
INSERT INTO `musiclist` VALUES (19, 1, '薛之谦-笑场', '尘', '2023-07-03 23:43:10', '2023-07-04 15:39:51', '/img/SingerPic/1688398996271笑场.png', '[00:00.000] 作词 : 裴志森/薛之谦\n[00:01.000] 作曲 : 张洢豪\n[00:17.679]狭小的房间空荡荡\n[00:21.475]你不在的心房多空旷\n[00:33.941]脆弱的神经被流放\n[00:37.598]却越不过想念的山岗\n[00:49.647]混乱的思绪在闲逛\n[00:53.310]矫情的台词多了几行\n[00:58.089]怎样才算准备妥当\n[01:00.473]让告别和告白一个样\n[01:09.912]我尚未开口你先笑场\n[01:13.532]如同我脸上画了滑稽的妆\n[01:17.896]这尴尬立即将我捆绑\n[01:21.814]否认的方式叫做时机不当\n[01:26.150]我全情投入你却笑场\n[01:30.079]好像我赤身裸体没穿衣裳\n[01:34.525]反正献媚后都要松绑  我也本无处躲藏\n[02:17.091]无趣的画面被遗忘\n[02:20.351]伤人的字句小心隐藏\n[02:24.317]让我尽量发挥想象\n[02:27.257]别让我们这些年寥寥收场\n[02:33.315]不舍的情绪在释放\n[02:36.687]矫情的台词补了几行\n[02:41.174]我以为我已准备妥当\n[02:43.754]让告别和告白一个样\n[02:49.133]我尚未开口你先笑场\n[02:53.011]如同我脸上画了滑稽的妆\n[02:57.341]这尴尬立即将我捆绑\n[03:01.102]否认的方式叫做时机不当\n[03:05.500]我全情投入你却笑场\n[03:09.665]好像我赤身裸体没穿衣裳\n[03:13.754]反正献媚后都要松绑  我也本无处躲藏\n[03:38.954]我自以为是的在圆场\n[03:42.677]如同我脸上画了滑稽的妆\n[03:46.711]这献媚慢慢没了声响\n[03:50.845]付出的人最后都无处安放\n[03:55.140]我全情投入你却离场\n[03:59.279]我甘愿承受所有世俗眼光\n[04:03.423]没关系幸好我很健忘  习惯对自己说谎\n[04:05.658] 制作人：薛之谦\n[04:07.893] 编曲：韦伟\n[04:10.128] 电吉他：Derrick Sepnio\n[04:12.363] Bass：Rayvaughn Covington \n[04:14.598] 鼓：Padget Nanton III\n[04:16.833] 键盘：韦伟\n[04:19.068] 小号:李禾昊 jack（uk）\n[04:21.303] 木吉他:王振兴\n[04:23.538] 人声录制：郑伟 夏之炜\n[04:25.773] 和音：薛之谦\n[04:28.008] 录音棚：上海广播大厦200studio\n[04:30.243] 混音/母带：李越\n[04:32.478] 混音棚：野火春风工作室', '/song/1688398990793笑场 - 薛之谦.mp3', 2);
INSERT INTO `musiclist` VALUES (20, 1, '薛之谦-哑巴', '怪咖', '2023-07-03 23:44:43', '2023-07-03 23:44:50', '/img/SingerPic/1688399090974哑巴.png', '[00:00.00] 作词 : 薛之谦/汪苏泷\r\n[00:01.00] 作曲 : 薛之谦/汪苏泷\r\n[00:28.49]我们都迁就嘴巴\r\n[00:33.82]我们都憋着真话\r\n[00:38.50]我们都让爱先发芽\r\n[00:48.31]我们会接受惩罚\r\n[00:52.39]有一个变成哑巴\r\n[00:57.11]越退让越不会表达\r\n[01:04.47]所有的安静都是人造的冷清\r\n[01:09.66]所有的杂音在安慰后平静\r\n[01:14.61]我不需要证明\r\n[01:19.11]我不需要声音\r\n[01:28.59]我就像一个哑巴一样\r\n[01:33.79]你翻译不了我的声响\r\n[01:40.77]怕腻烦过量\r\n[01:42.84]我举止要限量\r\n[01:49.31]你可以当我哑巴一样\r\n[01:55.15]你不会看见我的抵抗\r\n[02:04.59]请别怕我受伤 我自己会圆场\r\n[02:36.33]我们会接受惩罚\r\n[02:40.42]有一个变成哑巴\r\n[02:44.58]越退让越不会表达\r\n[02:51.88]所有的安静都是人造的冷清\r\n[02:56.10]所有的杂音在安慰后平静\r\n[03:00.61]我不需要证明\r\n[03:04.97]我不需要声音\r\n[03:08.52]我就像一个哑巴一样\r\n[03:12.49]你翻译不了我的声响\r\n[03:16.88]怕腻烦过量\r\n[03:20.14]我举止要限量\r\n[03:25.38]你可以当我哑巴一样\r\n[03:29.59]你不会看见我的抵抗\r\n[03:34.81]请别怕我受伤 我自己会圆场\r\n[03:47.65]我就像一个哑巴一样\r\n[03:57.04]反正我也不擅长抵抗\r\n[03:58.75] 制作人：郑伟\r\n[04:00.46] 编曲：郑伟\r\n[04:02.18] 吉他：王山\r\n[04:03.89] 合音：薛之谦\r\n[04:05.61] 混音：郑伟\r\n[04:07.32] 人声录制：莫家伟（上海广播大厦200Studio）\r\n[04:09.03] 母带制作：全相彦（OK Master Studio）\r\n[04:10.75] 原唱：刘维\r\n[04:12.46] \r\n[04:14.18] 原词曲： 汪苏泷\r\n[04:15.89] \r\n[04:17.60] 新版作词：薛之谦 汪苏泷\r\n[04:19.32] \r\n[04:21.03] 新版作曲：薛之谦 汪苏泷', '/song/1688399083597哑巴 - 薛之谦.mp3', 1);
INSERT INTO `musiclist` VALUES (21, 1, '薛之谦-像风一样', '渡', '2023-07-03 23:47:59', '2023-07-03 23:55:47', '/img/SingerPic/1688399291173像风一样.png', '[00:00.00] 作词 : 薛之谦\r\n[00:01.00] 作曲 : 薛之谦\r\n[00:11.85]\r\n[00:31.65]我等的模样好不具象\r\n[00:39.27]用皮肤感受你的流向\r\n[00:47.49]你竟然能做到带走阳光\r\n[00:55.25]我一味的跟随过了量\r\n[01:03.78]像风一样\r\n[01:06.32]你靠近云都下降\r\n[01:10.38]你卷起千层海浪我躲也不躲往里闯\r\n[01:18.60]你不就像风一样\r\n[01:22.64]侵略时沙沙作响\r\n[01:26.81]再宣布恢复晴朗就好像我们两个没爱过一样\r\n[01:45.15]曲折的夕阳负责格挡\r\n[01:52.52]让委屈的感官无法释放\r\n[02:00.72]最近我的伤口没生长\r\n[02:08.50]因为我躲在没风的地方\r\n[02:17.00]像风一样\r\n[02:19.46]你靠近云都下降\r\n[02:23.41]你卷起千层海浪我躲也不躲往里闯\r\n[02:31.53]你不就像风一样\r\n[02:35.51]侵略时沙沙作响\r\n[02:39.71]再宣布恢复晴朗就好像我们两个没爱过一样\r\n[02:53.62]你像风一样\r\n[02:55.91]触摸时温柔流淌\r\n[03:00.01]席卷我所有抵抗不急着要我投降\r\n[03:08.11]你不就像风一样\r\n[03:12.22]掠夺时沙沙作响\r\n[03:16.27]可惜我自投罗网你也就没什么可骄傲的地方\r\n[03:34.66]和风一样\r\n[03:37.27]你离开不声不响\r\n[03:41.74]我喜欢这种收场看上去谁也不曾亏欠过对方\r\n[03:58.76]\r\n[04:00.39] 制作人：薛之谦\r\n[04:02.03] 编曲：张宝宇 郑伟\r\n[04:03.66] 混音：郑伟\r\n[04:05.30] 合音：薛之谦\r\n[04:06.93] 鼓：褚伟明\r\n[04:08.57] bass：宣一亨\r\n[04:10.20] 吉他：孙闻楠\r\n[04:11.84] 人声录制：莫家伟（上海广播大厦200studio）\r\n[04:13.47] 乐器录制：吴身宝（soundhub studio）\r\n[04:15.11] 母带制作：Ted Jensen', '/song/1688399747080像风一样 (电视剧《小女花不弃》插曲) - 薛之谦.mp3', 32);
INSERT INTO `musiclist` VALUES (22, 1, '薛之谦-木偶人', '尘', '2023-07-03 23:50:29', '2023-07-03 23:55:57', '/img/SingerPic/1688399444399木偶人.png', '[00:00.000] 作词 : 薛之谦\r\n[00:01.000] 作曲 : 薛之谦\r\n[00:17.154]听专情的古人  把美言留给最爱的人\r\n[00:25.069]看裹小脚的人  为诗人的恶习在隐忍\r\n[00:33.070]你没读懂课本  可世人硬要捧\r\n[00:41.350]看感情里的人  用肉眼分出三六九等\r\n[00:49.820]再配合些掌声  看上去全都忠心耿耿\r\n[00:58.000]谁定的烂台本  可当代都在跟  气氛已麻木不仁\r\n[01:11.813]\r\n[01:12.202]所以 当我们都变成木偶人\r\n[01:17.471]你何苦再做一个痴情人表忠贞\r\n[01:21.797]文字叙述工整  配上廉价伤痕  你还会哭多感人\r\n[01:29.805]\r\n[01:30.107]让我们都变成木偶人\r\n[01:33.678]再缝几针爱几次后就不会疼\r\n[01:37.965]去除惦记功能  再遇到你时像个陌生人\r\n[01:46.963]\r\n[01:50.846]以前爱过的人  偷偷的藏起红绿两本\r\n[01:58.724]现在相爱的人  能耍的方式五花八门\r\n[02:07.230]要一式要两份  把热吻当罪证\r\n[02:15.298]让动了情的人  还要去分辨好人坏人\r\n[02:23.458]别在雨里对阵  用可乐拉环陪你的人\r\n[02:31.606]已变成俗剧本  你何必太当真  不要提那辛路历程\r\n[02:46.341]\r\n[02:46.606]所以 当我们都变成木偶人\r\n[02:51.507]你何苦再做一个痴情人表忠贞\r\n[02:55.511]文字叙述工整  重复廉价伤痕  你还会哭多感人\r\n[03:03.407]\r\n[03:03.825]让我们都变成木偶人\r\n[03:07.373]再缝几针爱几次后就不会疼\r\n[03:11.594]去除惦记功能  再遇到你时像个陌生人\r\n[03:21.158]\r\n[03:36.779]没有人能变成木偶人\r\n[03:39.795]无非是在感情里的逃避过程\r\n[03:43.999]我们盛气凌人  掩饰无权过问\r\n[03:48.773]遇见谁要拆几针\r\n[03:52.354]\r\n[03:52.631]当我们都羡慕木偶人\r\n[03:55.899]学会他在场面上的玩弄过程\r\n[04:00.004]美化措辞追捧  似拟人的掌声是我爱人\r\n[04:12.490]防备厚厚一本  是我献出自己的后遗症\r\n[04:16.283] 制作人 : 陈迪@TalentUnion\r\n[04:20.076] 编曲 : 陈迪\r\n[04:23.869] 吉他 : 劳国贤\r\n[04:27.662] 贝斯 : 崔文正\r\n[04:31.455] 鼓 : 王鹏\r\n[04:35.248] 弦乐团 : 中国爱乐乐团\r\n[04:39.041] 人声监制 : 杨祎\r\n[04:42.834] 缩混 : 杨祎@RaySound Studio\r\n[04:46.627] 母带 : 鲍锐@录顶技', '/song/1688399757787木偶人 - 薛之谦.mp3', 10);
INSERT INTO `musiclist` VALUES (23, 1, '薛之谦-其实', '意外', '2023-07-03 23:51:37', '2023-07-12 17:25:56', '/img/SingerPic/1688399635811意外.png', '[00:00.000] 作词 : 薛之谦\n[00:01.000] 作曲 : 薛之谦\n[00:18.330]不需要借口\n[00:21.510]爱淡了就放手\n[00:25.960]我不想听\n[00:27.960]你也没说平静的交错\n[00:34.880]随便找个理由\n[00:38.070]决定了就别回头\n[00:42.500]不爱你的人\n[00:44.560]说什么都没用\n[00:50.390]分开时难过不能说\n[00:54.590]谁没谁不能好好过\n[00:58.740]那天我们走了很久没有争吵过\n[01:07.260]分开时难过不要说\n[01:12.050]如果被你一笑而过\n[01:15.960]还不如让你选择想要的生活\n[01:24.440]分开后我会笑着说\n[01:28.610]当朋友问你关于我\n[01:32.750]我都会轻描淡写仿佛没爱过\n[01:41.360]其实我根本没人说\n[01:45.420]其实我没你不能活\n[01:49.640]其实我给你的爱比你想的多\n[02:31.900]分开时难过不能说\n[02:36.510]谁没谁不能好好过\n[02:40.620]那天我们走了很久没有争吵过\n[02:49.230]分开时难过不要说\n[02:53.370]如果被你一笑而过\n[02:57.500]还不如让你选择想要的生活\n[03:06.350]分开后我会笑着说\n[03:10.640]当朋友问你关于我\n[03:15.010]我都会轻描淡写仿佛没爱过\n[03:23.500]其实我根本没人说\n[03:27.630]其实我没你不能活\n[03:32.100]其实我给你的爱比你想的多\n[03:40.430]其实我爱你比你想的多得多', '/song/1688399497550其实(电视剧《妈妈像花儿一样》插曲) - 薛之谦.mp3', 2);
INSERT INTO `musiclist` VALUES (24, 1, '薛之谦-暧昧', '渡', '2023-07-03 23:57:01', '2023-07-03 23:57:44', '/img/SingerPic/1688399864987暧昧.png', '[00:00.000] 作词 : 薛之谦\r\n[00:01.000] 作曲 : 薛之谦\r\n[00:14.800]反正现在的感情 都暧昧\r\n[00:20.130]你大可不必为难 找般配\r\n[00:24.820]付出过的人排队 谈体会\r\n[00:29.290]趁年轻别害怕一个人睡\r\n[00:34.170]可能是现在感情 太昂贵\r\n[00:39.080]让付出真心的人 好狼狈\r\n[00:43.950]还不如听首情歌 的机会 忘了谁\r\n[00:54.880]感情像牛奶一杯 越甜越让人生畏\r\n[01:04.320]都早有些防备 润色前的原味\r\n[01:13.350]所以人们都拿起咖啡 把试探放在两人位\r\n[01:23.860]距离感一对 就不必再赤裸相对\r\n[01:31.820]反正现在的感情 都暧昧\r\n[01:36.590]你大可不必为难 找般配\r\n[01:41.500]付出过的人排队 谈体会\r\n[01:46.150]弃之可惜 食而无味\r\n[01:51.080]可能是现在感情 太珍贵\r\n[01:55.630]让付出真心的人 好疲惫\r\n[02:00.600]谁不曾用过卑微的词汇 想留住谁\r\n[02:49.110]还贪恋着衣衫昂贵 却输给了廉价香水\r\n[02:59.080]他先诱你入位 还刻意放低了分贝\r\n[03:08.310]可感情越爱越妩媚 像烂掉的苹果一堆\r\n[03:17.980]连基因都不对 还在意什么鱼腥味\r\n[03:27.020]反正现在的感情 都暧昧\r\n[03:31.720]你大可不必为难 找般配\r\n[03:36.500]何必给自己沉迷 的机会\r\n[03:41.280]不如用误会来结尾\r\n[03:46.320]反正现在的我们 算暧昧\r\n[03:50.570]我愿意给的感情 请浪费\r\n[03:55.740]反正流过的眼泪 难收回\r\n[04:00.310]就别再安慰\r\n[04:05.450]看你入眠的侧脸 有多美\r\n[04:10.820]和你丢下的一切 好匹配\r\n[04:16.870]我还以为我能 多狼狈\r\n[04:23.090]我自以为\r\n[04:29.230] 制作人：郑伟\r\n[04:35.370] 编曲：薛之谦 郑伟\r\n[04:41.510] 混音：郑伟\r\n[04:47.650] 大提琴：周润青\r\n[04:53.790] 女声：孟楠\r\n[04:59.930] 合音：薛之谦 张石狄\r\n[05:06.070] 录音：莫家伟\r\n[05:12.210] 母带：Chris Gehringer', '/song/1688399821558暧昧 - 薛之谦.mp3', 10);
INSERT INTO `musiclist` VALUES (26, 19, 'Taylor Swift-lover', 'lover', '2023-07-10 16:01:29', '2023-07-10 16:01:37', '/img/SingerPic/1688976097861lover.png', '[00:00.00] 作词 : Taylor Swift/Shawn Mendes/Scott Harris\r\n[00:01.00] 作曲 : Taylor Swift/Shawn Mendes/Scott Harris\r\n[00:15.00]We could leave the Christmas lights up \'til January\r\n[00:21.99]This is our place we make the rules\r\n[00:27.87]And there\'s a dazzling haze\r\n[00:29.85]A mysterious way about you dear\r\n[00:35.70]Have I known you 20 seconds or 20 years\r\n[00:42.08]Can I go where you go\r\n[00:48.90]Can we always be this close\r\n[00:54.13]Forever and ever\r\n[00:55.90]And ah take me out\r\n[00:58.68]And take me home\r\n[01:02.99]You\'re my my my my\r\n[01:09.39]Lover\r\n[01:16.56]We could light a bunch of candles and dance around the kitchen, baby\r\n[01:24.25]Pictures of when we were young would hang on the wall\r\n[01:30.85]We\'ll sit on the stoop, I\'ll sing love songs to you when we\'re eighty\r\n[01:37.48]See I finally got you now, honey, I won\'t let you fall\r\n[01:45.11]Can I go where you go\r\n[01:51.96]Can we always be this close\r\n[01:57.39]Forever and ever\r\n[01:58.97]And ah take me out\r\n[02:01.77]And take me home\r\n[02:04.35]Forever and ever\r\n[02:06.02]You\'re my my my my\r\n[02:12.32]Lover\r\n[02:13.36]Ladies and gentlemen will you please stand\r\n[02:16.73]With every guitar string scar on my hand\r\n[02:20.15]I take this magnetic force of a man\r\n[02:23.28]To be my lover\r\n[02:27.35]Look in my eyes they will tell you the truth\r\n[02:30.56]The girl in my story has always been you\r\n[02:34.30]I’d go down with the Titanic, it’s true for you\r\n[02:39.40]Lover\r\n[02:41.20]And you\'ll save all your dirtiest jokes for me\r\n[02:47.36]And at every table I\'ll save you a seat\r\n[02:52.70]Save you a seat\r\n[02:53.79]Lover\r\n[02:55.36]Can I go where you go\r\n[02:58.89]Can I go where you go baby\r\n[03:02.05]Can we always be this close\r\n[03:07.42]Forever and ever\r\n[03:09.08]And ah take me out\r\n[03:11.90]And take me home(Forever and ever)\r\n[03:14.63]Forever and ever\r\n[03:16.09]You\'re my my my my\r\n[03:22.62]Oh you\'re my my my my\r\n[03:29.57]Darling you\'re my my my my\r\n[03:36.52]Lover', '/song/1688976089832Taylor Swift-Lover.mp3', 0);
INSERT INTO `musiclist` VALUES (27, 19, 'Taylor Swift-willow', 'evermore', '2023-07-10 16:05:13', '2023-07-10 16:05:28', '/img/SingerPic/1688976328426屏幕截图 2023-07-10 160357.png', '[00:00.00] 作词 : Aaron Dessner/Taylor Swift\r\n[00:01.00] 作曲 : Aaron Dessner/Taylor Swift\r\n[00:11.95]I\'m like the water when your ship rolled in that night\r\n[00:17.48]Rough on the surface but you cut through like a knife\r\n[00:23.70]And if it was an open/shut case\r\n[00:26.54]I never would\'ve known from that look on your face\r\n[00:29.58]Lost in your current like a priceless wine\r\n[00:35.14]The more that you say the less I know\r\n[00:38.05]Wherever you stray I follow\r\n[00:40.89]I\'m begging for you to take my hand\r\n[00:43.89]Wreck my plans that\'s my man\r\n[00:47.54]Life was a willow and it bent right to your wind\r\n[00:53.22]Head on the pillow I could feel you sneaking in\r\n[00:59.37]As if you were a mythical thing\r\n[01:02.38]Like you were a trophy or a champion ring\r\n[01:05.06]And there was one prize I\'d cheat to win\r\n[01:10.84]The more that you say the less I know\r\n[01:13.75]Wherever you stray I follow\r\n[01:16.66]I\'m begging for you to take my hand\r\n[01:19.61]Wreck my plans that\'s my man\r\n[01:22.29]You know that my train could take you home\r\n[01:25.35]Anywhere else is hollow\r\n[01:28.08]I\'m begging for you to take my hand\r\n[01:31.06]Wreck my plans that\'s my man\r\n[01:37.57]Life was a willow and it bent right to your wind\r\n[01:43.53]They count me out time and time again\r\n[01:48.92]Life was a willow and it bent right to your wind\r\n[01:54.87]But I come back stronger than a 90\'s trend\r\n[01:58.96]Wait for the signal and I\'ll meet you after dark\r\n[02:04.67]Show me the places where the others gave you scars\r\n[02:11.02]Now this is an open/shut case\r\n[02:13.73]I guess I should\'ve known from the look on your face\r\n[02:16.70]Every bait and switch was a work of art\r\n[02:22.34]The more that you say the less I know\r\n[02:25.25]Wherever you stray I follow\r\n[02:28.04]I\'m begging for you to take my hand\r\n[02:31.02]Wreck my plans that\'s my man\r\n[02:33.85]You know that my train could take you home\r\n[02:36.75]Anywhere else is hollow\r\n[02:39.37]I\'m begging for you to take my hand\r\n[02:42.46]Wreck my plans that\'s my man\r\n[02:45.25]The more that you say the less I know\r\n[02:48.16]Wherever you stray I follow\r\n[02:50.93]I\'m begging for you to take my hand\r\n[02:53.86]Wreck my plans that\'s my man\r\n[02:56.55]You know that my train could take you home\r\n[02:59.64]Anywhere else is hollow\r\n[03:02.26]I\'m begging for you to take my hand\r\n[03:05.34]Wreck my plans that\'s my man\r\n[03:09.30]Hey that\'s my man\r\n[03:12.50]That\'s my man\r\n[03:15.29]Yeah that\'s my man\r\n[03:16.82]Every bait and switch was a work of art\r\n[03:19.82]That\'s my man\r\n[03:22.21]Hey that\'s my man\r\n[03:25.16]I\'m begging for you to take my hand\r\n[03:28.18]Wreck my plans that\'s my man', '/song/1688976313851Taylor Swift-willow.mp3', 1);
INSERT INTO `musiclist` VALUES (28, 19, 'Taylor Swift-afterglow', 'lover', '2023-07-10 16:08:22', '2023-07-10 16:23:29', '/img/SingerPic/1688976521563lover.png', '[00:00.00] 作词 : Taylor Swift/Louis Bell/Adam King Feeney\n[00:01.00] 作曲 : Taylor Swift/Louis Bell/Adam King Feeney\n[00:04.49]I blew things out of proportion, now you\'re blue\n[00:08.85]Put you in jail for something you didn’t do\n[00:12.89]I pinned your hands behind your back, oh\n[00:17.49]Thought I had reason to attack, but no\n[00:21.67]Fighting with a true love is boxing with no gloves\n[00:25.89]Chemistry \'til it blows up, \'til there’s no us\n[00:29.87]Why\'d I have to break what I love so much?\n[00:34.47]It\'s on your face, and I\'m to blame, I need to say\n[00:39.17]Hey, it\'s all me, in my head\n[00:44.67]I\'m the one who burned us down\n[00:48.97]But it\'s not what I meant\n[00:53.27]Sorry that I hurt you\n[00:56.34]I don\'t wanna do, I don’t wanna do this to you (Ooh)\n[01:00.21]I don’t wanna lose, I don\'t wanna lose this with you (Ooh)\n[01:03.38]I need to say, hey, it’s all me, just don\'t go\n[01:10.61]Meet me in the afterglow\n[01:15.98]It\'s so excruciating to see you low\n[01:20.13]Just wanna lift you up and not let you go\n[01:24.24]This ultraviolet morning light below\n[01:28.88]Tells me this love is worth the fight, oh\n[01:33.00]I lived like an island, punished you with silence\n[01:37.10]Went off like sirens, just crying\n[01:40.86]Why\'d I have to break what I love so much?\n[01:45.75]It’s on your face, don\'t walk away, I need to say\n[01:50.45]Hey, it\'s all me, in my head\n[01:56.03]I\'m the one who burned us down\n[02:00.34]But it\'s not what I meant\n[02:04.69]I’m sorry that I hurt you\n[02:07.70]I don\'t wanna do, I don\'t wanna do this to you (Ooh)\n[02:11.54]I don\'t wanna lose, I don\'t wanna lose this with you (Ooh)\n[02:14.93]I need to say, hey, it\'s all me, just don\'t go\n[02:22.02]Meet me in the afterglow\n[02:25.01]Tell me that you\'re still mine\n[02:27.00]Tell me that we\'ll be just fine\n[02:29.08]Even when I lose my mind\n[02:32.44]I need to say\n[02:33.75]Tell me that it\'s not my fault\n[02:35.58]Tell me that I\'m all you want\n[02:37.66]Even when I break your heart\n[02:41.13]I need to say\n[02:42.34]Hey, it\'s all me, in my head\n[02:47.93]I\'m the one who burned us down\n[02:52.18]But it\'s not what I meant\n[02:56.70]Sorry that I hurt you\n[02:59.50]I don\'t wanna do, I don\'t wanna do this to you (Ooh)\n[03:03.35]I don\'t wanna lose, I don\'t wanna lose this with you (Ooh)\n[03:06.86]I need to say, hey, it\'s all me, just don\'t go\n[03:14.06]Meet me in the afterglow\n[03:17.26]', '/song/1688976516726Taylor Swift-Afterglow.mp3', 5);

-- ----------------------------
-- Table structure for rank
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank`  (
  `id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for singerlist
-- ----------------------------
DROP TABLE IF EXISTS `singerlist`;
CREATE TABLE `singerlist`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `sex` tinyint(1) NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `introduction` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of singerlist
-- ----------------------------
INSERT INTO `singerlist` VALUES (1, '薛之谦', 1, '/img/SingerPic/1688201977828Xue.png', '1983-07-17 00:00:00', '中国上海', '薛之谦是一位中国内地男歌手、词曲创作人和演员。他于1983年7月17日出生在中国上海市。薛之谦以其独特的音乐风格和深情的歌曲而广受欢迎。薛之谦的音乐作品涵盖了多种流派，包括流行、民谣和R&B等。他的歌曲常常以细腻的情感和真实的表达而著称，触动了许多人的心灵。他的代表作品包括《演员》、《认真的雪》、《我好像在哪见过你》等。');
INSERT INTO `singerlist` VALUES (9, 'IU', 0, '/img/SingerPic/1687988166544iu.png', '1993-05-16 00:00:00', '韩国', '\r\nIU（李知恩）是一位韩国女歌手、演员和主持人。她于1993年5月16日出生在韩国首尔。IU以其甜美的嗓音和多样化的音乐风格而备受赞誉。她的音乐作品涵盖了流行、舞曲、摇滚和民谣等多种流派。IU的歌曲常以温柔、感性和深情的风格著称，她的代表作品包括《Good Day》、《Palette》和《Through the Night》等。除了音乐活动，IU也在演艺圈有着出色的表现，参演了多部电视剧，展现了她的演技。她是韩国娱乐界备受瞩目的一位艺人');
INSERT INTO `singerlist` VALUES (10, '林俊杰', 1, '/img/SingerPic/1688049979403linjunjie.png', '1981-03-27 00:00:00', '新加坡', '林俊杰（JJ Lin），全名林俊杰，是一位来自新加坡的华语流行歌手、词曲创作人和音乐制作人。他于2003年发行首张个人专辑《乐行者》，从而正式进入音乐界。林俊杰以其独特的音乐风格、出色的歌唱实力和才华横溢的创作能力而备受瞩目。林俊杰的音乐作品涵盖了多种风格，包括流行、摇滚、R&B、电子等。他的歌曲常常融入了深情的情感表达和富有诗意的歌词，深受听众喜爱。他的歌曲既有动感的舞曲，也有抒情的情歌，每一首歌曲都展现了他多样化的音乐才华。');
INSERT INTO `singerlist` VALUES (11, '于文文', 0, '/img/SingerPic/1687992151226yww.png', '1993-12-31 00:00:00', '中国湖南', '于文文（Yuwen Wen）是一位中国内地女歌手和词曲创作人。她于1993年12月31日出生在中国湖南省长沙市。于文文以其独特的音乐风格和出色的歌唱实力而备受关注。于文文的音乐作品涵盖了多种流派，包括流行、民谣和R&B等。她的歌曲常以温柔、感性和深情的风格著称，触动了许多人的心灵。她的代表作品包括《体面》、《魔鬼中的天使》、《遥远的她》等。');
INSERT INTO `singerlist` VALUES (12, '陈奕迅', 1, '/img/SingerPic/1688201449773jackson.png', '1974-07-27 00:00:00', '中国香港', '陈奕迅（Eason Chan），1974年7月27日出生于香港，是一位华语流行男歌手、演员和词曲创作人。陈奕迅以其独特的嗓音、出色的演唱技巧和多样化的音乐风格而备受赞誉。陈奕迅的音乐作品涵盖了多种流派，包括流行、摇滚、R&B和民谣等。他的歌曲常以深情的情感和真实的表达而著称，触动了许多人的心灵。他的代表作品包括《爱情转移》、《K歌之王》、《十年》等。');
INSERT INTO `singerlist` VALUES (13, '邓紫棋', 0, '/img/SingerPic/1687989171253dzq.png', '1991-08-16 00:00:00', '中国香港', '邓紫棋（G.E.M.）是一位华语流行女歌手、词曲创作人和音乐制作人。她于1991年8月16日出生在中国上海，后移居香港。邓紫棋以其独特的音乐风格、出色的歌唱实力和才华横溢的创作能力而备受瞩目。邓紫棋的音乐作品融合了流行、R&B、摇滚和电子音乐等多种元素。她的歌曲常以深情的情感和真实的表达而著称，触动了许多人的心灵。她的代表作品包括《喜欢你》、《光年之外》、《画》等。');
INSERT INTO `singerlist` VALUES (17, 'BLACKPINK', 2, '/img/SingerPic/1688202093070bp.png', '2016-08-08 00:00:00', '韩国', '2016年8月8日，发行首张单曲专辑《SQUARE ONE》并正式出道，《WHISTLE》在八个音乐网站周排行榜冠军，是首个以出道曲创下该纪录的女团 [2] ；11月1日，发行第二张单曲专辑《SQUARE TWO》 [142] 。2017年6月22日，发布单曲《As If It’s Your Last》。2018年6月15日，发行首张迷你专辑《SQUARE UP》 [143] ；10月25日，发行与杜阿·利帕的合作单曲《Kiss and Make Up》 [154] ，组合之后凭借该曲成为第一个获得BRIT白银单曲认证的K-Pop组合 [99] 。2019年4月5日，发行第二张迷你专辑《KILL THIS LOVE》 [152] 。2020年8月28日，与赛琳娜·戈麦斯合作发行《Ice Cream》 [139] ，该曲刷新了K-pop女团在Billboard Hot 100的记录 [140-141]；8月30日，凭借《How You Like That》获第37届MTV音乐录影带大奖“夏日歌曲奖” [4] ；10月2日，发行第一张正规专辑《THE ALBUM》 [5] 。2022年9月16日，发行第二张正规专辑《BORN PINK》 [121] ，凭借此专辑成为登上美国Billboard 200和英国官方专辑排行榜榜首的首位亚洲女艺人 [138] ；12月5日，被《时代周刊》评选为年度艺人 [338] 。');
INSERT INTO `singerlist` VALUES (19, 'Taylor Swift', 0, '/img/SingerPic/1688975959719taylor.png', '1989-12-13 00:00:00', '美国', '泰勒·斯威夫特（Taylor Swift），1989年12月13日出生于美国宾夕法尼亚州，美国女歌手、词曲作者、音乐制作人、演员。2006年，发行个人首张音乐专辑《Taylor Swift》，该专辑获得美国唱片业协会认证5倍白金唱片销量。2008年，发行音乐专辑《Fearless》 ，该专辑在美国公告牌专辑榜上获11周冠军，认证7倍白金唱片销量，并获得第52届格莱美奖“年度专辑奖”。2010年，发行音乐专辑《Speak Now》，凭借单曲《Mean》获得第54届格莱美奖“最佳乡村歌手奖”和“最佳乡村歌曲奖” 。2012年，开始向流行乐歌手转型，发行音乐专辑《Red》  。2013年，获得第47届乡村音乐协会奖“巅峰奖” 。2014年，发行音乐专辑《1989》 ，该专辑获得第58届格莱美奖“年度专辑奖” ；同年，她当选国际唱片业协会（IFPI）评出的“2014年全球销量最高的音乐人” 。');

-- ----------------------------
-- Table structure for song_comment
-- ----------------------------
DROP TABLE IF EXISTS `song_comment`;
CREATE TABLE `song_comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `song_id` int(0) NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song_comment
-- ----------------------------
INSERT INTO `song_comment` VALUES (1, 12, '好听！');
INSERT INTO `song_comment` VALUES (2, 12, '好听！');
INSERT INTO `song_comment` VALUES (3, 10, '好听！');
INSERT INTO `song_comment` VALUES (4, 10, '做像星星一样耀眼的人吧');
INSERT INTO `song_comment` VALUES (5, 21, '像风行了八千里，不问归期');
INSERT INTO `song_comment` VALUES (6, 21, '这个世界上只有风让人捉摸不定');
INSERT INTO `song_comment` VALUES (7, 21, '你是无意穿堂风，偏偏孤倨引山洪');
INSERT INTO `song_comment` VALUES (8, 11, '好听');
INSERT INTO `song_comment` VALUES (9, 17, '很喜欢的歌');
INSERT INTO `song_comment` VALUES (10, 8, '好听');

-- ----------------------------
-- Table structure for song_list_comment
-- ----------------------------
DROP TABLE IF EXISTS `song_list_comment`;
CREATE TABLE `song_list_comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `song_list_id` int(0) NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song_list_comment
-- ----------------------------
INSERT INTO `song_list_comment` VALUES (26, 5, '好听');

-- ----------------------------
-- Table structure for songlist
-- ----------------------------
DROP TABLE IF EXISTS `songlist`;
CREATE TABLE `songlist`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  `introduction` text CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL,
  `style` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of songlist
-- ----------------------------
INSERT INTO `songlist` VALUES (5, 'PopMusic', '/img/SingerPic/1688138852665日韩.png', '这里有一封写给夜晚的信', '日韩');
INSERT INTO `songlist` VALUES (6, '粤语经典', '/img/SingerPic/1688201920366hk.png', '生活中有四件事可以改变你：爱，文字音乐和失去', '粤语');
INSERT INTO `songlist` VALUES (7, '欧美流行', '/img/SingerPic/1688477761290欧美.png', '好听的歌第一次就上头', '欧美');
INSERT INTO `songlist` VALUES (8, '情歌', '/img/SingerPic/1688981848701屏幕截图 2023-07-10 173719.png', '当我陈列你的缺点时，\n却发现自己已经成为，\n一座想念的博物馆。', '华语流行');

-- ----------------------------
-- Table structure for visited
-- ----------------------------
DROP TABLE IF EXISTS `visited`;
CREATE TABLE `visited`  (
  `id` int(0) NOT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `song_id` int(0) NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `typeOfSong` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for web_for_manage
-- ----------------------------
DROP TABLE IF EXISTS `web_for_manage`;
CREATE TABLE `web_for_manage`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_german2_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_for_manage
-- ----------------------------
INSERT INTO `web_for_manage` VALUES (1, 'gracivio', '123456');

SET FOREIGN_KEY_CHECKS = 1;
