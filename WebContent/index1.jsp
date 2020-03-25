<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>图书馆</title>
		<link href="css/Home_Page.css" type="text/css" rel="stylesheet"/>
		<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/Home_Page.js"></script>
    </head>
    <body>
    	<!--整体whole-->
		<div id="whole">
			<!--导航栏-->
			<div id="head">
				<div id="nav1">
					<span class="glyphicon glyphicon-grain but1" aria-hidden="true" style="float: left;"></span>
					<span style="color: gold; text-align: center;  float: left; display: block; font-size: 30px; line-height: 80px; width: 120px; height: 80px; line-height: 80px;">地球</span>
				</div>
				<div id="nav2">
					<ul class="ul1">
						<li><a class="one" href="Home_Page.html">首页</a></li>
						<li><a class="one" href="javascript:void(0)">旅游景点</a></li>
						<li><a class="one" href="javascript:void(0)">旅游攻略</a></li>
						<li><a class="one" href="javascript:void(0)">旅游商城</a></li>
						<li><a class="one" href="javascript:void(0)">酒店</a></li>
						<li class="search">
							<form class="navbar-form navbar-left">
				       			 <div class="form-group">
				          		<input type="text" class="form-control" placeholder="Search">
				        		</div>
				       			<button type="submit" class="btn btn-default">Submit</button>
				      		</form>
						</li>
					</ul>
				</div>
				<div id="nav3">
					<a href="javascript:void(0)"><span class="glyphicon glyphicon-user but2" aria-hidden="true" style="float: left;"></span></a>
					<a href="javascript:void(0)"><span class="glyphicon glyphicon-tree-conifer but2" aria-hidden="true" style="float: left;"></span></a>
					<a href="javascript:void(0)"><span class="glyphicon glyphicon-piggy-bank but2" aria-hidden="true" style="float: left;"></span></a>
					<p><a class="nav-right" href="javascript:void(0)">登录</a></p>
					<p><a class="nav-right right1" href="register.html">注册</a></p>
				</div>
			</div>
			<hr width="80%" color="lightgray" />
			
			<!--内容栏-->
			<div id="content">
				<!---->
				<!--轮播图-->
				<div id="carousel-example-generic" class="carousel slide lunbo" data-ride="carousel">
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="5"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="6"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="7"></li>
				  	<li data-target="#carousel-example-generic" data-slide-to="8"></li>
				  	<li data-target="#carousel-example-generic" data-slide-to="9"></li>
				  </ol>
				
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox">
				    <div class="item active">
				      <img src="img/1.png" alt="" class="img1">
				      <div class="carousel-caption">
				        
				      </div>
				    </div>
				    <div class="item">
				      <img src="img/2.png" alt="" class="img1">
				      <div class="carousel-caption  ">
				        ...
				      </div>
				    </div>
				    <div class="item">
				      <img src="img/3.png" alt="" class="img1">
				      <div class="carousel-caption  ">
				        ...
				      </div>
				    </div>
				    <div class="item">
				      <img src="img/4.png" alt="" class="img1">
				      <div class="carousel-caption  ">
				        ...
				      </div>
				    </div>
				    <div class="item">
				      <img src="img/5.png" alt="" class="img1">
				      <div class="carousel-caption  ">
				        ...
				      </div>
				    </div>
				    <div class="item">
				      <img src="img/6.png" alt="" class="img1">
				      <div class="carousel-caption  ">
				        ...
				      </div>
				    </div>
				    <div class="item">
				      <img src="img/7.png" alt="" class="img1">
				      <div class="carousel-caption  ">
				        ...
				      </div>
				    </div>
				    <div class="item">
				      <img src="img/8.png" alt="" class="img1">
				      <div class="carousel-caption  ">
				        ...
				      </div>
				    </div>
				    <div class="item">
				      <img src="img/19.jpg" alt="" class="img1">
				      <div class="carousel-caption  ">
				        ...
				      </div>
				    </div>
				    <div class="item">
				      <img src="img/101.png" alt="" class="img1">
				      <div class="carousel-caption  ">
				        ...
				      </div>
				    </div>
				  </div>
				
				  <!-- Controls -->
				  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
				
				<!---->
				<hr width="80%" color="darkgray" />
				<div id="content_bgcolor1">
				<div id="content_down">
					<!--选项卡  左边-->
					<div class="content_down_left">
						<div id="outer1">
							<input type="button" value="瀑布" class="aactive but3" />
							<input type="button" value="蓝洞" class="but3" />
							<input type="button" value="埃塞"  class="but3"/>
							<input type="button" value="波浪谷" class="but3" />
							<div style="display: block;">
								<img src="img/left1.jpg" class="img2"/>
								<img src="img/right1.jpg" class="img2" />
								<h2 style="padding-left:18px;color: orange">尼亚加拉大瀑布</h2>
								<p class="introduce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									尼亚加拉瀑布(Niagara Falls)位于加拿大安大略省和美国
									纽约州的交界处，瀑布源头为尼亚加拉河，主瀑布位于加拿大境内
									，是瀑布的最佳观赏地；在美国境内瀑布由月亮岛隔开，观赏的是
									瀑布侧面。同时，该瀑布也是世界第一大跨国瀑布。</p>
							</div>
							<div>
								<img src="img/left2.jpg" class="img2"/>
								<img src="img/right2.jpg" class="img2" />
								<h2 style="padding-left:18px;color: orange">洪都拉斯蓝洞</h2>
								<p class="introduce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									在某些静谧的近海洋面上，会突然出现一汪深蓝色的圆形水域，从高空看，仿佛是大海的瞳孔，从莫名
									的深处望过来，深邃、神秘、诡异，这种现象被人们称为蓝洞。全世界海洋中分布着有许多大小不同形
									态各异的蓝洞，其中最著名的，便是位于中美洲伯利兹首都Belize City（伯利兹城）东面60英
									里海面上的蓝洞。</p>
							</div>
							<div>
								<img src="img/left3.jpg" class="img2"/>
								<img src="img/right3.jpg" class="img2" />
								<h2 style="padding-left:18px;color: orange">埃塞地狱之门</h2>
								<p class="introduce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									尔塔阿雷火山（Erta Ale Volcano）位于埃塞俄比亚东北部阿法尔州境内，是东非大裂谷达
									纳基勒洼地中的一个盾形火山，是埃塞俄比亚最活跃的火山之一。尔塔阿雷火山顶端的熔岩湖（Lava
									 Lake），则是地球上仅存的五大熔岩湖之一。BBC曾经有一部纪录片名为《地球上最热的地方》，
									 讲述的便是这里的故事。尽管这里有诸多令游客望而生畏的元素，但这里依然吸引着来自世界各地的旅
									 行者，因为这里能让人们感受到地球真正的力量</p>
							</div>
							<div>
								<img src="img/left4.png" class="img2"/>
								<img src="img/right4.png" class="img2" />
								<h2 style="padding-left:18px;color: orange">波浪谷</h2>
								<p class="introduce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									靖边波浪谷位于距陕西省靖边县东南22公里处龙洲乡的闫家寨子，俗称闫寨子。从靖边县城出发
									，半个小时的车程就可以到达龙州。<br/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									靖边波浪谷岩石叫红砂岩，学术上被称为"砒砂岩"，成于古生代二叠纪和中生代三叠纪、侏罗纪、
									白垩纪之间。这是地球历史中地质最活跃、生物最繁茂、动物最庞大的时代。</p>
							</div>
						</div>
					</div>
				<!--新闻列表 右边-->
					<div class="content_down_right">
						<div id="outer2">
							<ul class="p1">
								<li class="two"><span class="glyphicon glyphicon-leaf content_right_logo" aria-hidden="true"></span></li>
								<li class="two"><span class="content_down_title">地球新闻</span></li>
								<li class="two"><a href="javascript:void(0)" style="text-decoration: none;"><span class="glyphicon glyphicon-list content_left_logo" aria-hidden="true"></span></a></li>
							</ul>
							<div id="news">
								
								<p class="content_news">
									<span class="glyphicon glyphicon-tree-deciduous news_logo" aria-hidden="true"></span>
									<a href="javascript:void(0)" class="content_new_a" style="text-decoration: none;">芬兰人痴迷冰雪运动，为保证滑雪道雪量，竟用巨型“铺盖”储藏雪</a>
								</p>
								<p class="content_news">
									<span class="glyphicon glyphicon-tree-deciduous news_logo" aria-hidden="true"></span>
									<a href="javascript:void(0)" class="content_new_a" style="text-decoration: none;">消费最低的国家之一：每月3千足够吃喝玩乐，生活质量却不差</a>
								</p>
								<p class="content_news">
									<span class="glyphicon glyphicon-tree-deciduous news_logo" aria-hidden="true"></span>
									<a href="javascript:void(0)" class="content_new_a" style="text-decoration: none;">畅游春季美景，细品两汉三国——汉中十佳旅游线路线上评选</a>
								</p>
								<p class="content_news">
									<span class="glyphicon glyphicon-tree-deciduous news_logo" aria-hidden="true"></span>
									<a href="javascript:void(0)" class="content_new_a" style="text-decoration: none;">九洞十瀑十八峰，鬼斧神工；百景千珍十二肖，人神共羡，水岩</a>
								</p>
								<p class="content_news">
									<span class="glyphicon glyphicon-tree-deciduous news_logo" aria-hidden="true"></span>
									<a href="javascript:void(0)" class="content_new_a" style="text-decoration: none;">什么样的人适合陪你去旅行？</a>
								</p>
								<p class="content_news">
									<span class="glyphicon glyphicon-tree-deciduous news_logo" aria-hidden="true"></span>
									<a href="javascript:void(0)" class="content_new_a" style="text-decoration: none;">初识江南最大的天然湿地，德清下渚湖藏不住的美 附游玩攻略</a>
								</p>
								<p class="content_news">
									<span class="glyphicon glyphicon-tree-deciduous news_logo" aria-hidden="true"></span>
									<a href="javascript:void(0)" class="content_new_a" style="text-decoration: none;">我国以水果命名的3个城市，一个“甜”过一个，有你的家乡吗？</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				</div>
				<!--dian ji jin ru-->
				<div id="content_bgcolor2">
				<div id="place_introduce">
					<div class="content_one">
						<img src="img/top1.jpg" class="img-responsive img-thumbnail place_img" height="207.5px" width="326.1px" alt="Responsive image">
						<div class="content_two">
							<!---->
							<p class="place_p">乌尤尼盐沼在玻利维亚波托西省西部高原内，海拔3,656米（11,995英尺），长150公里，宽130公
								里，面积9,065平方公里，为世界最大的盐层覆盖的荒原，有“天空之镜”的美称。边缘有盐场，主要盐场间有公路相通。</p>
							<button type="button" class="btn btn-success place_btn">详情了解</button>
						</div>
					</div>
					<div class="content_one">
						<img src="img/top2.png" class="img-responsive img-thumbnail place_img" alt="Responsive image">
						<div class="content_two">
							<!---->
							<p class="place_p">美国大峡谷空中走廊（Grand Canyon Skywalk）：被喻为“世界第八大奇景”。该空中走廊以独特的玻
								璃制成，悬空于科罗拉多河1219米之上，向大峡谷悬崖以外延伸21.34米，可承载相当于71架满员波音747飞机的重量，游客站在大
								峡谷空中走廊，可以720度的角度欣赏大峡谷奇观。大峡谷空中走廊自2007年3月开放以来，迅速成为美国著名的观光景点之一。</p>
							<button type="button" class="btn btn-info place_btn">详情了解</button>
						</div>
					</div>
					<div class="content_one">
						<img src="img/top3.jpg" class="img-responsive img-thumbnail place_img" alt="Responsive image">
						<div class="content_two">
							<!---->
							<p class="place_p">死海位于以色列， 巴勒斯坦、约旦交界，是世界上最低的湖泊，湖面海拔-430.5米。湖最深处3
								80.29米，最深处湖床海拔-800.112米。也是地球上盐分居第三位的水体，仅次于含盐量第二的吉布提阿萨勒湖（Lake Assal）
								及第一的南极洲唐胡安池。</p>
							<button type="button" class="btn-warning place_btn">详情了解</button>
						</div>
					</div>
					<div class="content_one">
						<img src="img/top4.jpg" class="img-responsive img-thumbnail place_img" alt="Responsive image">
						<div class="content_two">
							<!---->
							<p class="place_p">稻城亚丁红草地位于稻城县城以北28公里处桑堆镇公路边一个不起眼的小水塘，每年秋天布满红色的水草。该景点因而得名</p>
							<button type="button" class="btn btn-danger place_btn">详情了解</button>
						</div>
					</div>
				</div>
				</div>
				<div id="content_bgcolor3">
				<div id="comment">
					<div id="comment_head">
						<span style="font-weight: 400; font-size: 35px;">网友评论</span>
						<span style="color: orange;  display: inline-block; width: 800px;">&nbsp;&nbsp;&nbsp;&nbsp;文明上网理性发言，请遵守软工B1班的班规,否则罚款一块钱</span>
						<span style="color: #38f; font-size: 20px; ">3条评论</span>
					</div>
					<div id="comment_area">
						<span class="glyphicon glyphicon-user but4" aria-hidden="true"></span>
						<textarea cols="100" rows="5"></textarea>
						<button type="button" style="height: 119px; width: 150px; float: right; margin-right: 277px;" class="btn btn-info"><span style="font-size: 20px;">提交</span></button>

					</div>
					<div id="comment_foot">
						<div class="comment_foot_up">
							<span style="margin-left:30px;font-size: 25px;">全部评论</span>
							<span>/</span>
							<span style="color: #38f;">我的评论</span>
							<span style="font-weight: 500; display: inline-block; text-align: right; width: 782px; ">软工B1班热评</span>
						</div>
						<div id="comment_foot_down">
							<div class="user_comment" onmouseover="onReport(1)" onmouseout="outReport(1)">
								<img src="img/达浩.jpg" class="comment_img" width="100" height="100"  /> 
								<p style="float: left; margin: 16px; "><span style="color: #38f; font-size: 18px; margin: 10px;">达浩</span><span style="color:orange;">刚刚</span></p>
								<span class="code_red">
									<a href="javascript:void(0)" class="code_red_a">
										<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
										举报
									</a>
								</span>
								<br /><br /><br />
								<p style="float: left;  margin-left: 16px;">这是谁做的网页?哇 !!!!五分钟,五分钟内我要拿到这个人的所有信息</p>
							</div>
							<div class="user_comment" onmouseover="onReport(2)" onmouseout="outReport(2)">
								<img src="img/喷子.jpg" class="comment_img" width="100" height="100"  /> 
								<p style="float: left; margin: 16px; "><span style="color: #38f; font-size: 18px; margin: 10px;">喷子</span><span style="color:orange;">五分钟前</span></p>
								<span class="code_red">
									<a href="javascript:void(0)" class="code_red_a">
										<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
										举报
									</a>
								</span>
								<br /><br /><br />
								<p style="float: left; margin-left: 16px;">辣鸡!!!闭着眼我都能做出来</p>
							</div>	
							<div class="user_comment" onmouseover="onReport(3)" onmouseout="outReport(3)">
								<img src="img/大神.png"  width="100" height="100" class="comment_img"/>
								<p style="float: left; margin: 16px; "><span style="color: #38f; font-size: 18px; margin: 10px;">大神</span><span style="color:orange;">一小时前</span></p>
								<span class="code_red">
									<a href="javascript:void(0)" class="code_red_a">
										<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
										举报
									</a>
								</span>
								<br /><br /><br />
								<p style="float: left; margin-left: 16px;">css做的样式还行,使用bootstrap的滚动图实例,js运用的比较少,中规中矩的网页,做的不错</p>
							</div>
						</div>
					</div>
					
				</div>
				</div>
			</div>
			
			<!--底部内容-->
			<div id="footer_color1">
			<div id="foot">
				<div class="foot_logo">
					<img src="img/3.png" width="150px" height="90px" style="margin: auto;" />
				</div>
				<p id="foot_ul">
					<span class="foot_two"><a class="foot_a" href="javascript:void(0)">加入我们</a></span>
					<span class="foot_one"><a class="foot_a" href="javascript:void(0)">软件工程</a></span>
					<span class="foot_one"><a class="foot_a" href="javascript:void(0)">师资力量</a></span>
					<span class="foot_one"><a class="foot_a" href="javascript:void(0)">班委</a></span>
					<span class="foot_one"><a class="foot_a" href="javascript:void(0)">社团干部</a></span>
				</p>
				<br />
				<p style="color:lightgray; text-align: center;">@佛山_GGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小灰灰<br/>软件</p>
				
			</div>
			</div>
		</div>
    	
    	
 	</body>
</html>