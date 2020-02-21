/*
 Navicat Premium Data Transfer

 Source Server         : Starbug
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : productstore

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 21/02/2020 10:26:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `cid` int(0) NULL DEFAULT NULL,
  `pnum` int(0) NULL DEFAULT NULL,
  `imgurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sales` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('01a9db22-2ea1-4fd2-93a4-fdfa2d928a07', '镇魂', 71, 2, 522, '5a69722cN9ebf604f.jpg', '高人气畅销书作家Priest震撼人心的口碑巨作！随书赠送巍澜印章藏书票+黑胶概念长书签+口红烫金贴纸。镇生者之魂，安死者之心', 'Priest ', 1554);
INSERT INTO `book` VALUES ('030db11f-595d-4a5b-b4e5-4269b614f1e5', '\r\n无声告白', 29.1, 6, 335, 'book (43).jpg', '征服欧美文坛的华裔作家！击败村上春树等99位大牌作家，凭借处女作夺得2014年美国年度图书桂冠！我们终此一生，就是要摆脱他人的期待，找到真正的自己。', '伍绮诗', 725);
INSERT INTO `book` VALUES ('048656bd-09c3-4956-bcc3-6fbcc31d7bd1', '最初之前', 28.8, 7, 247, 'f77e85f9e22f6b1f.png', '从《你是zuihao的自己》开始，经历《我与世界只差一个你》《谢谢自己够勇敢》，直到《后来时间都与你有关》，这些年，张皓宸以累积超5,000,000册的销量，成为了90后作家排行榜冠军', '张皓宸', 502);
INSERT INTO `book` VALUES ('05176b34-25c4-4dc1-a5ab-969f259e5319', '基督山伯爵', 139.4, 7, 669, '5ce26f70N83fa8a5c.jpg', '余华不吃不喝不睡，疯了般读完《基督山伯爵》！人类全部的智慧尽在其中！全三册一字未删完整版', '大仲马', 684);
INSERT INTO `book` VALUES ('0add5d8f-8175-4f37-a364-18942967cf07', '\r\n起风了 ', 17.2, 7, 169, '59803acdNcc5463ca.jpg', '唯美典藏翻译+超值精装定价+知名设计制作 不一样的《起风了》 献给一直相信爱情的你； 日本动漫大师宫崎骏执导、获第86届奥斯卡金像奖提名的《起风了》原著', '堀辰雄 ', 898);
INSERT INTO `book` VALUES ('1', 'hibernate框架2', 88, 5, 1217, 'book (34).jpg', '人类在这个小小的行星（他们称之为“地球”）上，建立了两百多个不同的行政区域（他们称之为“国家”），直到地球上诞生了一个会思考的机器人。', '王五', 8455);
INSERT INTO `book` VALUES ('11', '深渊游戏', 100, 1, 997, 'book (36).jpg', '这是一款真身体验游戏。玩家在游戏中有且仅有一次生命,游戏里唯—的升级方式，就是吞噬同等级的玩家，同时获得积分奖励。只有成为“尊”等级的玩家，才有资格回到现实世界。', '劳资', 142);
INSERT INTO `book` VALUES ('12', 'I belonged to you', 56, 7, 1000, 'book (9).jpg', '他提出的“机器人学三大法则”是当代机器人学的基本法则，他预言了今天的生物科技，预言了互联网时代的数字图书馆，预言了人类将进行太空殖民。', '劳资', 1004);
INSERT INTO `book` VALUES ('13', '射雕英雄传', 100, 1, 1000, 'book (10).jpg', '京东定制：限量纪念礼盒装（内含：（朗声旧版）射雕英雄传+限量Q版手办+有声书兑换卡+明信片套装（15张）+纸胶带套装（3款）+礼品袋', '劳资', 1020);
INSERT INTO `book` VALUES ('14', '俏鼠记者', 175, 1, 238, 'book (11).jpg', '一天早晨，他收到一封信，来自二十年未见的老友奎妮。她患了癌症，写信告别。哈罗德写了回信，在寄出的路上，他由奎妮想到自己，越走越远', '劳资', 887);
INSERT INTO `book` VALUES ('16029bc1-d3a7-47ad-956b-0dc2009833fa', '肥猪的养成', 120, 8, 95, 'book (27).jpg', '一级棒一级棒一级棒一级棒', '刘冬梅', 1211);
INSERT INTO `book` VALUES ('2ebc57ef-334e-42c9-950d-de1664f6d157', '局外人', 37.4, 3, 1000, 'book (46).jpg', '此生必读！这一次终于读懂《局外人》：留法加缪研究专家原创万字导读，韩国插画师原创彩插还原经典场景，新锐译者全新译本！精装彩插典藏版！读客熊猫君出品', '[法] 加缪 ', 225);
INSERT INTO `book` VALUES ('3', 'SQL数据库', 60, 7, 66, 'book (2).jpg', '直至整个银河被统一，一个统治超过2500万个住人行星、疆域横跨十万光年、总计数兆亿人口的庞大帝国崛起——银河帝国。\r\n\r\n　　一个微妙的转折发生在银河帝国建国后的12020年。哈里·谢顿，这个刚满32岁的年轻数学家，开创了“心理史学”', '张三', 215);
INSERT INTO `book` VALUES ('350f85b6-3d46-4729-bd07-0b53a731dd6c', ' 小孩', 19.5, 4, 652, '5ad15ffbf7fbd158.jpg', '大冰2019年新书。走过的路越多，越喜欢宅着；见过的人越多，越喜欢孩子。《小孩》是一本可以用来下酒的奇书。随书附赠数十首有钱也买不到的原创民谣', '大冰 ', 100);
INSERT INTO `book` VALUES ('3706e055-3c66-481f-9c6a-2b3a159760da', '废青小彭宇', 100, 2, 1000, 'book (35).jpg', '《从你的全世界路过：让所有人心动的故事》是新媒体时代的写故事高手张嘉佳的短篇小说集。读过睡前故事的人会知道，这是一本精彩纷呈的书。', '刘慈欣', 1000);
INSERT INTO `book` VALUES ('3d4d80bf-e6d0-4c6c-83fc-4b77f2ccc5ab', '你在哪?', 111, 1, 999, 'book (34).jpg', '《挪威的森林》是日本作家村上春树所著的一部长篇爱情小说，影响了几代读者的青春名作。故事讲述主角渡边纠缠在情绪不稳定且患有精神疾病的直子和开朗活泼的小林绿子之间，', '[法] 加缪', 1111);
INSERT INTO `book` VALUES ('4', 'ANDRIOD安卓', 80, 7, 87, 'book (2).png', '一个微妙的转折发生在银河帝国建国后的12020年。哈里·谢顿，这个刚满32岁的年轻数学家，开创了“心理史学”，这门学科能用数学公式准确推演全人类的未来——“预言”从此成为一门可以信任的科学，人类由此可以看见未来。', '鲁迅', 775);
INSERT INTO `book` VALUES ('5', 'Python人工智能', 90, 7, 100, 'book (3).jpg', '　谢顿的预言是：虽然毫无征兆，但已存在一万两千年之久的银河帝国即将灭亡。\r\n\r\n一时间，银河震动，帝国飘摇；皇帝、宰相、夺权者、反叛星球，各方势力立刻剑拔弩张，人类银河时代伟大的传奇就此开启……', '行三', 114000);
INSERT INTO `book` VALUES ('6', '战时灯火', 100, 1, 1000, 'book (3).png', '诺贝尔奖得主石黑一雄熟读到可以背出来的书！“金布克奖”得主翁达杰！）（读客外国小说文库）', '鲁迅', 453);
INSERT INTO `book` VALUES ('65724156-db4e-4d6b-81ae-d8e997a49565', '局外人', 37.4, 3, 1000, 'book (46).jpg', '《平凡的世界》作者路遥成名作，影响千万青年的励志名篇\r\n路遥 著 ', '[法] 加缪', 120);
INSERT INTO `book` VALUES ('69ecfd6f-a296-4133-aebc-9c11b67e6c48', '人生', 100, 1, 1000, 'book (5).jpg', '书中讲述了发生在我们身边的爱情故事，故事里的人物嘴贱心善，真实得就像身边的哥儿们和闺密，在深夜和你掏心掏肺地讲述，讲述他走过的千山万水，经历过的爱恨情仇。', '劳资', 150);
INSERT INTO `book` VALUES ('7', '笑傲江湖', 80, 1, 70, 'book (4).jpg', '俄裔美籍作家，被读者誉为“神一样的人”；美国政府授予他“国家的资源与自然的奇迹”这个无与伦比的称号，以表彰他在“拓展人类想象力”上作出的杰出贡献。', '霍金', 453);
INSERT INTO `book` VALUES ('72191c04-6fcf-41b2-870b-7eb7d71c7aed', ' 怦然心动', 46.4, 6, 673, '5acdddbfN46d60ef9.jpg', '始于心动，终于白首，遇上方知情深。晋江口碑作者玖月晞暖心力作。精心修订，全新版本，新增番外，精美赠品，超值典藏。', '玖月晞', 1457);
INSERT INTO `book` VALUES ('72b04dfb-2a28-4120-9c36-5631d02c2db6', ' 杀死一只知更鸟', 36, 3, 0, '5b3b2d54N81779a3c.jpg', '父母必读，影响全球5000万家庭的殿堂级儿童教养之书，家庭教育的完美范本，美国中小学必读书目', '哈珀·李', 351);
INSERT INTO `book` VALUES ('7cde3eaa-5ffa-4af7-bb10-b69e0f2607e5', '人间失格', 48.8, 7, 150, '150af83d8e648b0a.jpg', '京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。 ', '堀辰雄 ', 745);
INSERT INTO `book` VALUES ('7e36ba7d-14b0-4aee-b445-738dbd0a7e63', '了不起的盖茨比', 19.9, 8, 111, '5bb07235N3da9b7ed.jpg', ' 小职员尼克初来纽约，租住的房子恰巧在大富翁盖茨比的豪宅旁边，因此结识了盖茨比，并无意间得知盖茨比内心深处的牵绊——纽约上层社会的旧情人——黛西。', ' F.S.菲茨杰拉德', 888);
INSERT INTO `book` VALUES ('96b5c9ae-e904-4924-b230-9392cf11d51b', '\r\n村上春树：挪威的森林', 12, 3, 123, 'book (33).jpg', '张嘉佳，毕业于南京大学，曾出版小说《几乎成了英雄》《情人书》。曾任电影《刀见笑》编剧，获2011年金马奖改编剧本提名。', '[法] 加缪', 1255);
INSERT INTO `book` VALUES ('a195a9ed-0c57-4ee0-b5c1-89cd5fb5606c', '竹鼠养生', 78, 8, 200, 'book (40).jpg', '飞洒地方士大夫撒旦肺癌微软发射点发射点', '小红', 1502);
INSERT INTO `book` VALUES ('a5dacde1-58e6-41e9-a5db-654948c53da7', '卖货才的小女孩', 123, 6, 1000, 'book (37).jpg', 'afdsafsadfasfastar', '广财大', 2000);
INSERT INTO `book` VALUES ('b016cedd-d066-49cb-9401-d52df0728b95', '睡美人', 59.9, 5, 430, '59db20a6Na14d5434.jpg', '一部照进现实的暗黑童话，让你汗毛倒立的两性寓言。金在作品中首次集中将两性关系中的恐惧、对立放大描写，故事是虚构的', '斯蒂芬·金', 885);
INSERT INTO `book` VALUES ('bbd753dc-fa4b-46d1-a4f0-f182c0900735', '东野圭吾：毕业 ', 54.3, 5, 555, '5bb07235N3da9b7ed.jpg', '东野圭吾《恶意》系列开篇之作，改变东野圭吾职业生涯的一本书。写给每个曾在毕业前期待又迷茫的人。如果成长需要交换，你一定不愿舍弃什么', '东野圭吾', 685);
INSERT INTO `book` VALUES ('c7ae717d-6593-4494-8145-1c6b79b30929', '人间喜剧', 100, 1, 999, 'book (12).jpg', '（新版典藏全集！法语翻译界泰斗傅雷历时25年传世译本，经典篇目全收录！一部人性百科全书，写尽了你一生可能遇到的所有人！）', '劳资', 1000);

-- ----------------------------
-- Table structure for book_copy1
-- ----------------------------
DROP TABLE IF EXISTS `book_copy1`;
CREATE TABLE `book_copy1`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `cid` int(0) NULL DEFAULT NULL,
  `pnum` int(0) NULL DEFAULT NULL,
  `imgurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sales` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_copy1
-- ----------------------------
INSERT INTO `book_copy1` VALUES ('01a9db22-2ea1-4fd2-93a4-fdfa2d928a07', '镇魂', 71, 2, 522, '5a69722cN9ebf604f.jpg', '高人气畅销书作家Priest震撼人心的口碑巨作！随书赠送巍澜印章藏书票+黑胶概念长书签+口红烫金贴纸。镇生者之魂，安死者之心', 'Priest ', 1554);
INSERT INTO `book_copy1` VALUES ('030db11f-595d-4a5b-b4e5-4269b614f1e5', '\r\n无声告白', 29.1, 6, 335, 'book (43).jpg', '征服欧美文坛的华裔作家！击败村上春树等99位大牌作家，凭借处女作夺得2014年美国年度图书桂冠！我们终此一生，就是要摆脱他人的期待，找到真正的自己。', '伍绮诗', 725);
INSERT INTO `book_copy1` VALUES ('048656bd-09c3-4956-bcc3-6fbcc31d7bd1', '最初之前', 28.8, 7, 250, 'f77e85f9e22f6b1f.png', '从《你是zuihao的自己》开始，经历《我与世界只差一个你》《谢谢自己够勇敢》，直到《后来时间都与你有关》，这些年，张皓宸以累积超5,000,000册的销量，成为了90后作家排行榜冠军', '张皓宸', 502);
INSERT INTO `book_copy1` VALUES ('05176b34-25c4-4dc1-a5ab-969f259e5319', '基督山伯爵', 139.4, 7, 669, '5ce26f70N83fa8a5c.jpg', '余华不吃不喝不睡，疯了般读完《基督山伯爵》！人类全部的智慧尽在其中！全三册一字未删完整版', '大仲马', 684);
INSERT INTO `book_copy1` VALUES ('0add5d8f-8175-4f37-a364-18942967cf07', '\r\n起风了 ', 17.2, 7, 169, '59803acdNcc5463ca.jpg', '唯美典藏翻译+超值精装定价+知名设计制作 不一样的《起风了》 献给一直相信爱情的你； 日本动漫大师宫崎骏执导、获第86届奥斯卡金像奖提名的《起风了》原著', '堀辰雄 ', 898);
INSERT INTO `book_copy1` VALUES ('1', 'hibernate框架2', 88, 5, 1220, 'book (34).jpg', '人类在这个小小的行星（他们称之为“地球”）上，建立了两百多个不同的行政区域（他们称之为“国家”），直到地球上诞生了一个会思考的机器人。', '王五', 8455);
INSERT INTO `book_copy1` VALUES ('11', '深渊游戏', 100, 1, 1005, 'book (36).jpg', '这是一款真身体验游戏。玩家在游戏中有且仅有一次生命,游戏里唯—的升级方式，就是吞噬同等级的玩家，同时获得积分奖励。只有成为“尊”等级的玩家，才有资格回到现实世界。', '劳资', 142);
INSERT INTO `book_copy1` VALUES ('12', 'I belonged to you', 56, 7, 1000, 'book (9).jpg', '他提出的“机器人学三大法则”是当代机器人学的基本法则，他预言了今天的生物科技，预言了互联网时代的数字图书馆，预言了人类将进行太空殖民。', '劳资', 1004);
INSERT INTO `book_copy1` VALUES ('13', '射雕英雄传', 100, 1, 1000, 'book (10).jpg', '京东定制：限量纪念礼盒装（内含：（朗声旧版）射雕英雄传+限量Q版手办+有声书兑换卡+明信片套装（15张）+纸胶带套装（3款）+礼品袋', '劳资', 1020);
INSERT INTO `book_copy1` VALUES ('14', '俏鼠记者', 175, 1, 246, 'book (11).jpg', '一天早晨，他收到一封信，来自二十年未见的老友奎妮。她患了癌症，写信告别。哈罗德写了回信，在寄出的路上，他由奎妮想到自己，越走越远', '劳资', 887);
INSERT INTO `book_copy1` VALUES ('16029bc1-d3a7-47ad-956b-0dc2009833fa', '肥猪的养成', 120, 8, 95, 'book (27).jpg', '一级棒一级棒一级棒一级棒', '刘冬梅', 1211);
INSERT INTO `book_copy1` VALUES ('2ebc57ef-334e-42c9-950d-de1664f6d157', '局外人', 37.4, 3, 1000, 'book (46).jpg', '此生必读！这一次终于读懂《局外人》：留法加缪研究专家原创万字导读，韩国插画师原创彩插还原经典场景，新锐译者全新译本！精装彩插典藏版！读客熊猫君出品', '[法] 加缪 ', 225);
INSERT INTO `book_copy1` VALUES ('3', 'SQL数据库', 60, 7, 66, 'book (2).jpg', '直至整个银河被统一，一个统治超过2500万个住人行星、疆域横跨十万光年、总计数兆亿人口的庞大帝国崛起——银河帝国。\r\n\r\n　　一个微妙的转折发生在银河帝国建国后的12020年。哈里·谢顿，这个刚满32岁的年轻数学家，开创了“心理史学”', '张三', 215);
INSERT INTO `book_copy1` VALUES ('350f85b6-3d46-4729-bd07-0b53a731dd6c', ' 小孩', 19.5, 4, 652, '5ad15ffbf7fbd158.jpg', '大冰2019年新书。走过的路越多，越喜欢宅着；见过的人越多，越喜欢孩子。《小孩》是一本可以用来下酒的奇书。随书附赠数十首有钱也买不到的原创民谣', '大冰 ', 254);
INSERT INTO `book_copy1` VALUES ('3706e055-3c66-481f-9c6a-2b3a159760da', '废青小彭宇', 100, 2, 1000, 'book (35).jpg', '《从你的全世界路过：让所有人心动的故事》是新媒体时代的写故事高手张嘉佳的短篇小说集。读过睡前故事的人会知道，这是一本精彩纷呈的书。', '刘慈欣', 1000);
INSERT INTO `book_copy1` VALUES ('3d4d80bf-e6d0-4c6c-83fc-4b77f2ccc5ab', '你在哪?', 111, 1, 1000, 'book (34).jpg', '《挪威的森林》是日本作家村上春树所著的一部长篇爱情小说，影响了几代读者的青春名作。故事讲述主角渡边纠缠在情绪不稳定且患有精神疾病的直子和开朗活泼的小林绿子之间，', '[法] 加缪', 1111);
INSERT INTO `book_copy1` VALUES ('4', 'ANDRIOD安卓', 80, 7, 87, 'book (2).png', '一个微妙的转折发生在银河帝国建国后的12020年。哈里·谢顿，这个刚满32岁的年轻数学家，开创了“心理史学”，这门学科能用数学公式准确推演全人类的未来——“预言”从此成为一门可以信任的科学，人类由此可以看见未来。', '鲁迅', 775);
INSERT INTO `book_copy1` VALUES ('5', 'Python人工智能', 90, 7, 100, 'book (3).jpg', '　谢顿的预言是：虽然毫无征兆，但已存在一万两千年之久的银河帝国即将灭亡。\r\n\r\n一时间，银河震动，帝国飘摇；皇帝、宰相、夺权者、反叛星球，各方势力立刻剑拔弩张，人类银河时代伟大的传奇就此开启……', '行三', 114);
INSERT INTO `book_copy1` VALUES ('6', '战时灯火', 100, 1, 1000, 'book (3).png', '诺贝尔奖得主石黑一雄熟读到可以背出来的书！“金布克奖”得主翁达杰！）（读客外国小说文库）', '鲁迅', 453);
INSERT INTO `book_copy1` VALUES ('65724156-db4e-4d6b-81ae-d8e997a49565', '局外人', 37.4, 3, 1000, 'book (46).jpg', '《平凡的世界》作者路遥成名作，影响千万青年的励志名篇\r\n路遥 著 ', '[法] 加缪', 120);
INSERT INTO `book_copy1` VALUES ('69ecfd6f-a296-4133-aebc-9c11b67e6c48', '人生', 100, 1, 1000, 'book (5).jpg', '书中讲述了发生在我们身边的爱情故事，故事里的人物嘴贱心善，真实得就像身边的哥儿们和闺密，在深夜和你掏心掏肺地讲述，讲述他走过的千山万水，经历过的爱恨情仇。', '劳资', 150);
INSERT INTO `book_copy1` VALUES ('7', '笑傲江湖', 80, 1, 80, 'book (4).jpg', '俄裔美籍作家，被读者誉为“神一样的人”；美国政府授予他“国家的资源与自然的奇迹”这个无与伦比的称号，以表彰他在“拓展人类想象力”上作出的杰出贡献。', '霍金', 453);
INSERT INTO `book_copy1` VALUES ('72191c04-6fcf-41b2-870b-7eb7d71c7aed', ' 怦然心动', 46.4, 6, 685, '5acdddbfN46d60ef9.jpg', '始于心动，终于白首，遇上方知情深。晋江口碑作者玖月晞暖心力作。精心修订，全新版本，新增番外，精美赠品，超值典藏。', '玖月晞', 1457);
INSERT INTO `book_copy1` VALUES ('72b04dfb-2a28-4120-9c36-5631d02c2db6', ' 杀死一只知更鸟', 36, 3, 0, '5b3b2d54N81779a3c.jpg', '父母必读，影响全球5000万家庭的殿堂级儿童教养之书，家庭教育的完美范本，美国中小学必读书目', '哈珀·李', 351);
INSERT INTO `book_copy1` VALUES ('7cde3eaa-5ffa-4af7-bb10-b69e0f2607e5', '人间失格', 48.8, 7, 150, '150af83d8e648b0a.jpg', '京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。 ', '堀辰雄 ', 745);
INSERT INTO `book_copy1` VALUES ('7e36ba7d-14b0-4aee-b445-738dbd0a7e63', '了不起的盖茨比', 19.9, 8, 112, '5bb07235N3da9b7ed.jpg', ' 小职员尼克初来纽约，租住的房子恰巧在大富翁盖茨比的豪宅旁边，因此结识了盖茨比，并无意间得知盖茨比内心深处的牵绊——纽约上层社会的旧情人——黛西。', ' F.S.菲茨杰拉德', 888);
INSERT INTO `book_copy1` VALUES ('96b5c9ae-e904-4924-b230-9392cf11d51b', '\r\n村上春树：挪威的森林', 12, 3, 123, 'book (33).jpg', '张嘉佳，毕业于南京大学，曾出版小说《几乎成了英雄》《情人书》。曾任电影《刀见笑》编剧，获2011年金马奖改编剧本提名。', '[法] 加缪', 1255);
INSERT INTO `book_copy1` VALUES ('b016cedd-d066-49cb-9401-d52df0728b95', '睡美人', 59.9, 5, 452, '59db20a6Na14d5434.jpg', '一部照进现实的暗黑童话，让你汗毛倒立的两性寓言。金在作品中首次集中将两性关系中的恐惧、对立放大描写，故事是虚构的', '斯蒂芬·金', 885);
INSERT INTO `book_copy1` VALUES ('bbd753dc-fa4b-46d1-a4f0-f182c0900735', '东野圭吾：毕业 ', 54.3, 5, 557, '5bb07235N3da9b7ed.jpg', '东野圭吾《恶意》系列开篇之作，改变东野圭吾职业生涯的一本书。写给每个曾在毕业前期待又迷茫的人。如果成长需要交换，你一定不愿舍弃什么', '东野圭吾', 685);
INSERT INTO `book_copy1` VALUES ('c7ae717d-6593-4494-8145-1c6b79b30929', '人间喜剧', 100, 1, 1000, 'book (12).jpg', '（新版典藏全集！法语翻译界泰斗傅雷历时25年传世译本，经典篇目全收录！一部人性百科全书，写尽了你一生可能遇到的所有人！）', '劳资', 1000);
INSERT INTO `book_copy1` VALUES ('e0c7ed4b-eb38-4099-a9b5-4de6e6b4650d', '月亮与六便士', 22.3, 2, 214, '5a94f880N65ff96a7.jpg', '2018京东小说销量桂冠！30万+五星好评奇迹！荣获豆瓣阅读桂冠！上海国际学校指定必读译本！靠口碑狂卖200万册纪录！认准作家榜经典文库，拒绝山寨劣质书', '毛姆 ', 1230);
INSERT INTO `book_copy1` VALUES ('e4134682-3ada-4e84-b1db-e669d4d641ca', '渣男修炼手册', 520, 1, 10, 'book (13).jpg', '《一个人的朝圣2》内容简介：在《一个人的朝圣》里，65岁的哈罗德，87天行走627英里，只为了一个信念：只要他在走，奎妮就会活下来。 ', '劳资', 1000);
INSERT INTO `book_copy1` VALUES ('ed34ef94-35be-41e5-b892-69dff5a8dba4', '2001：太空漫游', 100, 1, 120, 'book (16).jpg', '《漫长的告别》是真正意义上的灵魂交流的故事，是人与人之间自发地相互理解的故事，是人类抱有的美好幻想和它不可避免地引发的深深幻灭的故事。——村上春树', '村上春树', 767);

-- ----------------------------
-- Table structure for book_copy2
-- ----------------------------
DROP TABLE IF EXISTS `book_copy2`;
CREATE TABLE `book_copy2`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `cid` int(0) NULL DEFAULT NULL,
  `pnum` int(0) NULL DEFAULT NULL,
  `imgurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sales` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_copy2
-- ----------------------------
INSERT INTO `book_copy2` VALUES ('01a9db22-2ea1-4fd2-93a4-fdfa2d928a07', '镇魂', 71, 2, 522, '5a69722cN9ebf604f.jpg', '高人气畅销书作家Priest震撼人心的口碑巨作！随书赠送巍澜印章藏书票+黑胶概念长书签+口红烫金贴纸。镇生者之魂，安死者之心', 'Priest ', 1554);
INSERT INTO `book_copy2` VALUES ('030db11f-595d-4a5b-b4e5-4269b614f1e5', '\r\n无声告白', 29.1, 6, 335, 'book (43).jpg', '征服欧美文坛的华裔作家！击败村上春树等99位大牌作家，凭借处女作夺得2014年美国年度图书桂冠！我们终此一生，就是要摆脱他人的期待，找到真正的自己。', '伍绮诗', 725);
INSERT INTO `book_copy2` VALUES ('048656bd-09c3-4956-bcc3-6fbcc31d7bd1', '最初之前', 28.8, 7, 250, 'f77e85f9e22f6b1f.png', '从《你是zuihao的自己》开始，经历《我与世界只差一个你》《谢谢自己够勇敢》，直到《后来时间都与你有关》，这些年，张皓宸以累积超5,000,000册的销量，成为了90后作家排行榜冠军', '张皓宸', 502);
INSERT INTO `book_copy2` VALUES ('05176b34-25c4-4dc1-a5ab-969f259e5319', '基督山伯爵', 139.4, 7, 669, '5ce26f70N83fa8a5c.jpg', '余华不吃不喝不睡，疯了般读完《基督山伯爵》！人类全部的智慧尽在其中！全三册一字未删完整版', '大仲马', 684);
INSERT INTO `book_copy2` VALUES ('0add5d8f-8175-4f37-a364-18942967cf07', '\r\n起风了 ', 17.2, 7, 169, '59803acdNcc5463ca.jpg', '唯美典藏翻译+超值精装定价+知名设计制作 不一样的《起风了》 献给一直相信爱情的你； 日本动漫大师宫崎骏执导、获第86届奥斯卡金像奖提名的《起风了》原著', '堀辰雄 ', 898);
INSERT INTO `book_copy2` VALUES ('1', 'hibernate框架2', 88, 5, 1220, 'book (34).jpg', '人类在这个小小的行星（他们称之为“地球”）上，建立了两百多个不同的行政区域（他们称之为“国家”），直到地球上诞生了一个会思考的机器人。', '王五', 8455);
INSERT INTO `book_copy2` VALUES ('11', '深渊游戏', 100, 1, 1005, 'book (36).jpg', '这是一款真身体验游戏。玩家在游戏中有且仅有一次生命,游戏里唯—的升级方式，就是吞噬同等级的玩家，同时获得积分奖励。只有成为“尊”等级的玩家，才有资格回到现实世界。', '劳资', 142);
INSERT INTO `book_copy2` VALUES ('12', 'I belonged to you', 56, 7, 1000, 'book (9).jpg', '他提出的“机器人学三大法则”是当代机器人学的基本法则，他预言了今天的生物科技，预言了互联网时代的数字图书馆，预言了人类将进行太空殖民。', '劳资', 1004);
INSERT INTO `book_copy2` VALUES ('13', '射雕英雄传', 100, 1, 1000, 'book (10).jpg', '京东定制：限量纪念礼盒装（内含：（朗声旧版）射雕英雄传+限量Q版手办+有声书兑换卡+明信片套装（15张）+纸胶带套装（3款）+礼品袋', '劳资', 1020);
INSERT INTO `book_copy2` VALUES ('14', '俏鼠记者', 175, 1, 246, 'book (11).jpg', '一天早晨，他收到一封信，来自二十年未见的老友奎妮。她患了癌症，写信告别。哈罗德写了回信，在寄出的路上，他由奎妮想到自己，越走越远', '劳资', 887);
INSERT INTO `book_copy2` VALUES ('16029bc1-d3a7-47ad-956b-0dc2009833fa', '肥猪的养成', 120, 8, 95, 'book (27).jpg', '一级棒一级棒一级棒一级棒', '刘冬梅', 1211);
INSERT INTO `book_copy2` VALUES ('2ebc57ef-334e-42c9-950d-de1664f6d157', '局外人', 37.4, 3, 1000, 'book (46).jpg', '此生必读！这一次终于读懂《局外人》：留法加缪研究专家原创万字导读，韩国插画师原创彩插还原经典场景，新锐译者全新译本！精装彩插典藏版！读客熊猫君出品', '[法] 加缪 ', 225);
INSERT INTO `book_copy2` VALUES ('3', 'SQL数据库', 60, 7, 66, 'book (2).jpg', '直至整个银河被统一，一个统治超过2500万个住人行星、疆域横跨十万光年、总计数兆亿人口的庞大帝国崛起——银河帝国。\r\n\r\n　　一个微妙的转折发生在银河帝国建国后的12020年。哈里·谢顿，这个刚满32岁的年轻数学家，开创了“心理史学”', '张三', 215);
INSERT INTO `book_copy2` VALUES ('350f85b6-3d46-4729-bd07-0b53a731dd6c', ' 小孩', 19.5, 4, 652, '5ad15ffbf7fbd158.jpg', '大冰2019年新书。走过的路越多，越喜欢宅着；见过的人越多，越喜欢孩子。《小孩》是一本可以用来下酒的奇书。随书附赠数十首有钱也买不到的原创民谣', '大冰 ', 254);
INSERT INTO `book_copy2` VALUES ('3706e055-3c66-481f-9c6a-2b3a159760da', '废青小彭宇', 100, 2, 1000, 'book (35).jpg', '《从你的全世界路过：让所有人心动的故事》是新媒体时代的写故事高手张嘉佳的短篇小说集。读过睡前故事的人会知道，这是一本精彩纷呈的书。', '刘慈欣', 1000);
INSERT INTO `book_copy2` VALUES ('3d4d80bf-e6d0-4c6c-83fc-4b77f2ccc5ab', '你在哪?', 111, 1, 1000, 'book (34).jpg', '《挪威的森林》是日本作家村上春树所著的一部长篇爱情小说，影响了几代读者的青春名作。故事讲述主角渡边纠缠在情绪不稳定且患有精神疾病的直子和开朗活泼的小林绿子之间，', '[法] 加缪', 1111);
INSERT INTO `book_copy2` VALUES ('4', 'ANDRIOD安卓', 80, 7, 87, 'book (2).png', '一个微妙的转折发生在银河帝国建国后的12020年。哈里·谢顿，这个刚满32岁的年轻数学家，开创了“心理史学”，这门学科能用数学公式准确推演全人类的未来——“预言”从此成为一门可以信任的科学，人类由此可以看见未来。', '鲁迅', 775);
INSERT INTO `book_copy2` VALUES ('5', 'Python人工智能', 90, 7, 100, 'book (3).jpg', '　谢顿的预言是：虽然毫无征兆，但已存在一万两千年之久的银河帝国即将灭亡。\r\n\r\n一时间，银河震动，帝国飘摇；皇帝、宰相、夺权者、反叛星球，各方势力立刻剑拔弩张，人类银河时代伟大的传奇就此开启……', '行三', 114);
INSERT INTO `book_copy2` VALUES ('6', '战时灯火', 100, 1, 1000, 'book (3).png', '诺贝尔奖得主石黑一雄熟读到可以背出来的书！“金布克奖”得主翁达杰！）（读客外国小说文库）', '鲁迅', 453);
INSERT INTO `book_copy2` VALUES ('65724156-db4e-4d6b-81ae-d8e997a49565', '局外人', 37.4, 3, 1000, 'book (46).jpg', '《平凡的世界》作者路遥成名作，影响千万青年的励志名篇\r\n路遥 著 ', '[法] 加缪', 120);
INSERT INTO `book_copy2` VALUES ('69ecfd6f-a296-4133-aebc-9c11b67e6c48', '人生', 100, 1, 1000, 'book (5).jpg', '书中讲述了发生在我们身边的爱情故事，故事里的人物嘴贱心善，真实得就像身边的哥儿们和闺密，在深夜和你掏心掏肺地讲述，讲述他走过的千山万水，经历过的爱恨情仇。', '劳资', 150);
INSERT INTO `book_copy2` VALUES ('7', '笑傲江湖', 80, 1, 80, 'book (4).jpg', '俄裔美籍作家，被读者誉为“神一样的人”；美国政府授予他“国家的资源与自然的奇迹”这个无与伦比的称号，以表彰他在“拓展人类想象力”上作出的杰出贡献。', '霍金', 453);
INSERT INTO `book_copy2` VALUES ('72191c04-6fcf-41b2-870b-7eb7d71c7aed', ' 怦然心动', 46.4, 6, 685, '5acdddbfN46d60ef9.jpg', '始于心动，终于白首，遇上方知情深。晋江口碑作者玖月晞暖心力作。精心修订，全新版本，新增番外，精美赠品，超值典藏。', '玖月晞', 1457);
INSERT INTO `book_copy2` VALUES ('72b04dfb-2a28-4120-9c36-5631d02c2db6', ' 杀死一只知更鸟', 36, 3, 0, '5b3b2d54N81779a3c.jpg', '父母必读，影响全球5000万家庭的殿堂级儿童教养之书，家庭教育的完美范本，美国中小学必读书目', '哈珀·李', 351);
INSERT INTO `book_copy2` VALUES ('7cde3eaa-5ffa-4af7-bb10-b69e0f2607e5', '人间失格', 48.8, 7, 150, '150af83d8e648b0a.jpg', '京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。 ', '堀辰雄 ', 745);
INSERT INTO `book_copy2` VALUES ('7e36ba7d-14b0-4aee-b445-738dbd0a7e63', '了不起的盖茨比', 19.9, 8, 112, '5bb07235N3da9b7ed.jpg', ' 小职员尼克初来纽约，租住的房子恰巧在大富翁盖茨比的豪宅旁边，因此结识了盖茨比，并无意间得知盖茨比内心深处的牵绊——纽约上层社会的旧情人——黛西。', ' F.S.菲茨杰拉德', 888);
INSERT INTO `book_copy2` VALUES ('96b5c9ae-e904-4924-b230-9392cf11d51b', '\r\n村上春树：挪威的森林', 12, 3, 123, 'book (33).jpg', '张嘉佳，毕业于南京大学，曾出版小说《几乎成了英雄》《情人书》。曾任电影《刀见笑》编剧，获2011年金马奖改编剧本提名。', '[法] 加缪', 1255);
INSERT INTO `book_copy2` VALUES ('b016cedd-d066-49cb-9401-d52df0728b95', '睡美人', 59.9, 5, 452, '59db20a6Na14d5434.jpg', '一部照进现实的暗黑童话，让你汗毛倒立的两性寓言。金在作品中首次集中将两性关系中的恐惧、对立放大描写，故事是虚构的', '斯蒂芬·金', 885);
INSERT INTO `book_copy2` VALUES ('bbd753dc-fa4b-46d1-a4f0-f182c0900735', '东野圭吾：毕业 ', 54.3, 5, 557, '5bb07235N3da9b7ed.jpg', '东野圭吾《恶意》系列开篇之作，改变东野圭吾职业生涯的一本书。写给每个曾在毕业前期待又迷茫的人。如果成长需要交换，你一定不愿舍弃什么', '东野圭吾', 685);
INSERT INTO `book_copy2` VALUES ('c7ae717d-6593-4494-8145-1c6b79b30929', '人间喜剧', 100, 1, 1000, 'book (12).jpg', '（新版典藏全集！法语翻译界泰斗傅雷历时25年传世译本，经典篇目全收录！一部人性百科全书，写尽了你一生可能遇到的所有人！）', '劳资', 1000);
INSERT INTO `book_copy2` VALUES ('e0c7ed4b-eb38-4099-a9b5-4de6e6b4650d', '月亮与六便士', 22.3, 2, 214, '5a94f880N65ff96a7.jpg', '2018京东小说销量桂冠！30万+五星好评奇迹！荣获豆瓣阅读桂冠！上海国际学校指定必读译本！靠口碑狂卖200万册纪录！认准作家榜经典文库，拒绝山寨劣质书', '毛姆 ', 1230);
INSERT INTO `book_copy2` VALUES ('e4134682-3ada-4e84-b1db-e669d4d641ca', '渣男修炼手册', 520, 1, 10, 'book (13).jpg', '《一个人的朝圣2》内容简介：在《一个人的朝圣》里，65岁的哈罗德，87天行走627英里，只为了一个信念：只要他在走，奎妮就会活下来。 ', '劳资', 1000);
INSERT INTO `book_copy2` VALUES ('ed34ef94-35be-41e5-b892-69dff5a8dba4', '2001：太空漫游', 100, 1, 120, 'book (16).jpg', '《漫长的告别》是真正意义上的灵魂交流的故事，是人与人之间自发地相互理解的故事，是人类抱有的美好幻想和它不可避免地引发的深深幻灭的故事。——村上春树', '村上春树', 767);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '文学');
INSERT INTO `category` VALUES ('2', '科幻');
INSERT INTO `category` VALUES ('3', '哲学');
INSERT INTO `category` VALUES ('4', ' 音乐');
INSERT INTO `category` VALUES ('5', ' 漫画');
INSERT INTO `category` VALUES ('6', ' 政治');
INSERT INTO `category` VALUES ('7', ' 科学');
INSERT INTO `category` VALUES ('8', ' 军事');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `itemid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int(0) NULL DEFAULT NULL,
  `subtotal` double(10, 0) NULL DEFAULT NULL,
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemstate` int(0) NOT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('10407739-8832-4bb0-8e70-281df730dc17', 2, 222, '3d4d80bf-e6d0-4c6c-83fc-4b77f2ccc5ab', '4fc75b2a-256f-4a6a-8b43-d37ac106d8e0', 2);
INSERT INTO `orderitem` VALUES ('2855c5cb-1ee1-4101-9f21-a81ee61a0b60', 8, 800, '11', 'f4f7fad4-8f1f-4e9e-b45d-8b6358144db2', 3);
INSERT INTO `orderitem` VALUES ('37fab50e-fc5f-4acd-88b9-5986485b39df', 3, 270, '5', '4fc75b2a-256f-4a6a-8b43-d37ac106d8e0', 3);
INSERT INTO `orderitem` VALUES ('5551057c-7705-4970-881c-4a65cb4fdedc', 1, 175, '14', '4fc75b2a-256f-4a6a-8b43-d37ac106d8e0', 2);
INSERT INTO `orderitem` VALUES ('58fe848f-3449-41cb-a2f0-2f0f802db54b', 1, 20, '7e36ba7d-14b0-4aee-b445-738dbd0a7e63', '858fb836-45b2-43cd-a1a1-c6a6d2774b05', 2);
INSERT INTO `orderitem` VALUES ('72dbf7ac-c492-4122-9c4b-0f48b6163f33', 5, 600, '16029bc1-d3a7-47ad-956b-0dc2009833fa', 'b9b57a05-88b6-4296-9945-a8bc932d08cd', 4);
INSERT INTO `orderitem` VALUES ('74de71f7-d8ce-4d72-bb23-ed53658f5f49', 8, 1400, '14', 'f4f7fad4-8f1f-4e9e-b45d-8b6358144db2', 4);
INSERT INTO `orderitem` VALUES ('833324ac-fcb2-4b4c-b116-a2ca197a2920', 22, 1318, 'b016cedd-d066-49cb-9401-d52df0728b95', 'f291d961-38c0-4048-aeed-2bf0f2a31b13', 4);
INSERT INTO `orderitem` VALUES ('850f71be-c26c-4790-bedb-a8f5241dca66', 1, 111, '3d4d80bf-e6d0-4c6c-83fc-4b77f2ccc5ab', '6a3b9638-6334-4395-915d-a1b7052332a7', 2);
INSERT INTO `orderitem` VALUES ('868936ce-0e8b-4ba7-a521-87da6cfabadc', 1, 71, '01a9db22-2ea1-4fd2-93a4-fdfa2d928a07', '8c6be699-c7e6-4f1e-bcbb-6cf63ea609da', 3);
INSERT INTO `orderitem` VALUES ('8cc18f24-ce2d-4b73-ab72-98db3a316f6e', 5, 875, '14', 'b9b57a05-88b6-4296-9945-a8bc932d08cd', 2);
INSERT INTO `orderitem` VALUES ('9eb5f03b-d06e-402d-9aa3-273411841180', 7, 120, '0add5d8f-8175-4f37-a364-18942967cf07', 'a8a8a119-1299-4b9d-9e68-9fc5fb0fa803', 2);
INSERT INTO `orderitem` VALUES ('a00688cb-baa9-4c95-8d9a-f30a544e057c', 3, 86, '048656bd-09c3-4956-bcc3-6fbcc31d7bd1', '858fb836-45b2-43cd-a1a1-c6a6d2774b05', 2);
INSERT INTO `orderitem` VALUES ('a780f27b-83d2-4c98-9323-fa93130b8733', 5, 440, '1', '8c6be699-c7e6-4f1e-bcbb-6cf63ea609da', 4);
INSERT INTO `orderitem` VALUES ('c14f16c2-d34d-4d67-a44f-d4d2e1989084', 4, 115, '048656bd-09c3-4956-bcc3-6fbcc31d7bd1', '8c6be699-c7e6-4f1e-bcbb-6cf63ea609da', 2);
INSERT INTO `orderitem` VALUES ('c6093349-0340-4a88-9ff8-99c943c58e9e', 2, 40, '7e36ba7d-14b0-4aee-b445-738dbd0a7e63', 'a8a8a119-1299-4b9d-9e68-9fc5fb0fa803', 2);
INSERT INTO `orderitem` VALUES ('ce29f102-1a5c-4628-9591-7000a56eab6c', 2, 109, 'bbd753dc-fa4b-46d1-a4f0-f182c0900735', '6a3b9638-6334-4395-915d-a1b7052332a7', 2);
INSERT INTO `orderitem` VALUES ('db2d9256-a3c4-4b75-8e90-7d2bb321df67', 10, 800, '7', '38eace42-71c7-48f6-b5d3-7588588d597a', 2);
INSERT INTO `orderitem` VALUES ('dba36c6f-1a7c-4740-82eb-4efd261ece8e', 12, 557, '72191c04-6fcf-41b2-870b-7eb7d71c7aed', 'f291d961-38c0-4048-aeed-2bf0f2a31b13', 4);
INSERT INTO `orderitem` VALUES ('de3b51b5-df36-4b4e-a2d8-ea99a712ba79', 6, 224, '2ebc57ef-334e-42c9-950d-de1664f6d157', 'a8a8a119-1299-4b9d-9e68-9fc5fb0fa803', 2);
INSERT INTO `orderitem` VALUES ('fcf59d21-e63e-4b97-b018-010804bf8f20', 1, 100, 'c7ae717d-6593-4494-8145-1c6b79b30929', '858fb836-45b2-43cd-a1a1-c6a6d2774b05', 2);
INSERT INTO `orderitem` VALUES ('fdee792b-da9c-44d2-b7c1-8d92786d7af0', 3, 264, '1', '6a3b9638-6334-4395-915d-a1b7052332a7', 2);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ordertime` timestamp(0) NULL DEFAULT NULL,
  `total` double(20, 0) NULL DEFAULT NULL,
  `state` int(0) NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('38eace42-71c7-48f6-b5d3-7588588d597a', '2019-08-23 14:00:25', 800, 0, NULL, NULL, NULL, 31);
INSERT INTO `orders` VALUES ('4fc75b2a-256f-4a6a-8b43-d37ac106d8e0', '2019-08-22 15:38:02', 667, 1, '士大夫十大', '是的F是', '123124234234', 27);
INSERT INTO `orders` VALUES ('6a3b9638-6334-4395-915d-a1b7052332a7', '2019-09-19 11:13:45', 484, 0, NULL, NULL, NULL, 26);
INSERT INTO `orders` VALUES ('858fb836-45b2-43cd-a1a1-c6a6d2774b05', '2019-09-03 18:40:46', 206, 1, '312312', '2412412', '3123123', 26);
INSERT INTO `orders` VALUES ('8c6be699-c7e6-4f1e-bcbb-6cf63ea609da', '2019-08-22 16:42:11', 626, 1, '南极洲某小镇204号', '小火柴', '1231321', 26);
INSERT INTO `orders` VALUES ('a8a8a119-1299-4b9d-9e68-9fc5fb0fa803', '2019-08-22 16:40:51', 385, 1, '广东广州广财大', 'XingYu Liang', '1231321', 26);
INSERT INTO `orders` VALUES ('b9b57a05-88b6-4296-9945-a8bc932d08cd', '2019-08-23 10:20:40', 1475, 1, '广东广州广财大', '小火柴的小女孩', '312315453757', 26);
INSERT INTO `orders` VALUES ('f291d961-38c0-4048-aeed-2bf0f2a31b13', '2020-01-02 18:48:13', 1875, 1, 'werwer', 'ewrwr', 'werwer', 26);
INSERT INTO `orders` VALUES ('f4f7fad4-8f1f-4e9e-b45d-8b6358144db2', '2019-08-23 13:55:51', 2200, 1, '广东广州广财大', 'XingYu Liang', '1231321', 31);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduce` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(0) NULL DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `regist_time` timestamp(0) NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (26, 'tom', '123456', '1285226024@qq.com', '123456132', '131sd3f1dsaf', 'be16d798-cb33-4e44-b03f-0dfe21dba1fa', 1, 'general', '2019-08-22 15:17:52', 'male');
INSERT INTO `user` VALUES (27, 'XingYu', '1234567', 'a1285226024@163.com', 'asdfsdafgdafbdfg', 'dfgdsfgdsagsadf', 'd8741ca3-bb75-4b28-a026-d9a371879e85', 1, 'administrator', '2019-08-22 15:19:12', 'female');
INSERT INTO `user` VALUES (28, 'dead', '123456', '1285226024@qq.com', '123454', '231321asfd', '58a3c417-634e-4086-99e6-1bee23031c77', 1, 'general', '2019-08-22 16:06:33', 'male');
INSERT INTO `user` VALUES (30, 'admin', '123456789', 'a1285226024@163.com', '313215623151', '51531351564', 'd14a4994-45f0-4fc5-9bbe-81d6ce888e89', 1, 'administrator', '2019-08-23 13:45:57', 'female');
INSERT INTO `user` VALUES (31, 'lucy', '123456', '1285226024@qq.com', '5132156411231', '51321561', 'e8505d9c-38cd-4684-9d35-e7dce796ff21', 1, 'general', '2019-08-23 13:52:25', 'male');
INSERT INTO `user` VALUES (32, 'root', '123456', '1285226024@qq.com', '123123123', '123124124', 'ee348e22-7c05-4271-98fc-cbcbdce5c474', 1, 'administrator', '2019-09-19 11:17:58', 'male');
INSERT INTO `user` VALUES (33, 'tomx', '123456', '1285226024@qq.com', '1321s231fs21', '231dsaf231s3f', '70d17e78-8174-47c7-8ebd-f4c9f6056b94', 0, 'general', '2020-01-02 18:42:17', 'male');

SET FOREIGN_KEY_CHECKS = 1;
