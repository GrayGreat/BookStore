<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>图书馆首页</title>
    	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/css/Home_Page.css" rel="stylesheet"/>
    	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script>
            //
            window.onload=function(){
                var outer=document.getElementById('outer1');
                var oInput=outer.getElementsByTagName('input');//
                var oDiv=outer.getElementsByTagName('div');//3
                for(var i=0;i<oInput.length;i++){
                    oInput[i].index=i;
                    oInput[i].onclick=function(){
                        for(var j=0;j<oInput.length;j++){
                            oInput[j].className="but3";
                            oDiv[j].style.display="none";
                        }
                        this.className="aactive but3";
                        oDiv[this.index].style.display="block";
                    }
                }
            }
            function onReport(id){
                var foot=document.getElementById("comment_foot_down");
                var fSpan=foot.getElementsByTagName("span");
                for(var i=0;i<fSpan.length;i++){
                    if(i%4==2)
                        fSpan[4*id-2].style.display="block";
                }
            }

            function outReport(id){
                var foot=document.getElementById("comment_foot_down");
                var fSpan=foot.getElementsByTagName("span");
                for(var i=0;i<fSpan.length;i++){
                    if(i%4==2)
                        fSpan[i].style.display="none";
                }
            }

            //
        </script>
    </head>
    <body>
		<jsp:include page="header.jsp"></jsp:include>
        <div class="container-fluid">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                <li data-target="#carousel-example-generic" data-slide-to="4"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner container-fluid" role="listbox">
                <div class="item active"class="img-responsive">
                    <img style="margin:auto;" src="${pageContext.request.contextPath}/img/fighter.jpg" class="img-responsive" alt="...">
                    <div class="carousel-caption">
                        图书封面
                    </div>
                </div>
                <div class="item" class="img-responsive">
                    <img src="${pageContext.request.contextPath}/img/3-3.png" class="img-responsive" alt="...">
                    <div class="carousel-caption">
                        图书封面
                    </div>
                </div>
                <div class="item" class="img-responsive">
                    <img src="${pageContext.request.contextPath}/img/4-4.png" class="img-responsive" alt="...">
                    <div class="carousel-caption">
                        图书封面
                    </div>
                </div>
                <div class="item" class="img-responsive">
                    <img src="${pageContext.request.contextPath}/img/1-1.png" class="img-responsive" alt="...">
                    <div class="carousel-caption">
                        图书封面
                    </div>
                </div>
                <div class="item"class="img-responsive">
                    <img src="${pageContext.request.contextPath}/img/2-2.png" class="img-responsive" alt="...">
                    <div class="carousel-caption">
                        图书封面
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
        </div>
        <hr style="color: lightgray" />
        <%----%>
        <div class="container-fluid hidden-sm hidden-xs">
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
                            <li class="two"><span class="content_down_title">旅游新闻</span></li>
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
        </div>
        <hr style="color: rebeccapurple"/>
        <%----%>
        <div class="container">
            <h2 style="color: red;">热门书籍</h2>
            <hr color:purple/>
            <div class="row">
                <c:forEach items="${bookList}" var="book">
                    <div class="col-lg-3 col-md-6 col-xs-12 bookInfo" style="height: 400px" >
                        <div><a href="${pageContext.request.contextPath}/findBookInfo?id=${book.id}&&cid=${book.cid}&&index=index"><img src="${pageContext.request.contextPath}/bookImg/${book.imgurl}" class="img-responsive" style="margin: auto"/></a></div>
                        <div><p style="color: red;font-size: 20px">价格:${book.price}元</p></div>
                        <div>书名:<h3 style="text-align: center"><a href="${pageContext.request.contextPath}/findBookInfo?id=${book.id}&&cid=${book.cid}&&index=index" class="bookname">${book.bname}</a></h3></div>
                        <div><h5>${book.description}</h5>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <hr/>


    	<jsp:include page="footer.jsp"></jsp:include>
 	</body>
</html>