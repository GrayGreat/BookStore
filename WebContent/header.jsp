<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){

			    $.ajax({
					async:true,
					url:"${pageContext.request.contextPath}/findAllCategory",
					dataType:"json",
					type:"POST",
					success:function(data){
					    var content="";
					    // alert(data);
						for(var i=0;i<data.length;i++){
						    content+="<li><a href='${pageContext.request.contextPath}/productList?cid="+data[i].cid+"'>"+data[i].cname+"</a></li>";
                        }
                        content+="<li><a href='${pageContext.request.contextPath}/findAllCategoryAsSearch'>条件查询</a></li>";
						$("#navlist").html(content);
                    }

				});

				$("#search").keyup(function(){
				    // alert($(this).val());
				    var info=$(this).val();
				    if(info!=""){
				        $("#info").css("display","block");
                        $.ajax({
							async:true,
							url:"${pageContext.request.contextPath}/searchInfo",
							type:"POST",
							data:{
								"info":info
							},
							dataType:"json",
							success:function(data){
							    var content="";
                                // border: 1px red solid
								for(var i=0;i<data.length;i++){
                                	content+="<div class='search' style='padding-left: 5px;height: 30px;line-height: 30px;width:196px'>" +
										"<a  href='${pageContext.request.contextPath}/findBookInfo?id="+data[i].id+"&cid="+data[i].cid+"'>"+data[i].bname+"</a>" +
										"</div>";
                                }

                                $("#info").html(content);

                            }
                        })
                    //     <div style="padding-left: 5px;height: 25px;line-height: 25px;border: 1px red solid"><a href="regist.jsp">sldajflkdjasfsadfsad</a></div>


					}else{
						$("#info").css("display","none");
					}
				});

			});


		</script>
    	<style>
    		.but2{
				font-size: 30px;
				color: orange;
				line-height: 74px;
    		}
			.shopcart{
				float: left;
				display: block;
				width: 100px;
				height: 80px;
				font-size: 18px;
				line-height: 80px;
				color: orange;
				margin-left: 30px;
				text-align: center;
				text-decoration: none;
			}
			.shopcart:hover{
				text-decoration: none;
				color: orange;
				border-bottom:orange 5px solid;
			}
            .search{
                padding-top: 0px;
                text-decoration: none;
                width: 196px;
                height: 30px;
                line-height: 30px;
                color:#2aabd2;
            }
            .search:hover{
                text-decoration: none;
                color:orange;
                width: 196px;
                height: 30px;
                line-height: 30px;
                border: 1px #77cb00 solid;
                background-color: #f8f8f8;
            }
    	</style>
    	<script>
			function logout(){
			    var isLogout=confirm("您确定要退出吗?");
			    var forcequit=confirm("需要强制退出吗?");
			    if(isLogout){
			        window.location.href="${pageContext.request.contextPath}/logout?quit="+forcequit;
				}
			}
		</script>
    </head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-lg-2 visible-lg">
					<span class="glyphicon glyphicon-grain" style="font-size: 70px;color: greenyellow;" aria-hidden="true"></span>
					<span style="font-size: 30px;font-weight: bold;color: deepskyblue;">图书馆</span>
				</div>
				<div class="col-lg-offset-3 col-lg-2 visible-lg visible-md" style="height: 80px;">
					<a href="javascript:void(0)"><span class="glyphicon glyphicon-user but2" aria-hidden="true" style="line-height: 80px;float: left;"></span></a>
					<a href="javascript:void(0)"><span class="glyphicon glyphicon-tree-conifer but2" aria-hidden="true" style="line-height: 80px;float: left;"></span></a>
					<a href="javascript:void(0)"><span class="glyphicon glyphicon-piggy-bank but2" aria-hidden="true" style="line-height: 80px;float: left;"></span></a>
				</div>
				<div class="col-lg-1">
					<span><a href="${pageContext.request.contextPath}/shop_cart.jsp" class="shopcart">购物车</a></span>
				</div>
				<div class="col-lg-1">
					<span><a href="${pageContext.request.contextPath}/orderList" class="shopcart">订单</a></span>
				</div>
				<c:if test="${empty sessionScope.user}">
					<div class="col-lg-1">
						<span><a href="${pageContext.request.contextPath}/regist.jsp" class="shopcart">注册</a></span>
					</div>
					<div class="col-lg-2">
						<span><a href="${pageContext.request.contextPath}/login.jsp" class="shopcart">登录</a></span>
					</div>
				</c:if>
				<c:if test="${!empty sessionScope.user}">
					<div class="col-lg-2">
						<c:if test="${user.role=='administrator'}">
							<span><a href="${pageContext.request.contextPath}/admin/home.jsp" class="shopcart">${user.username},欢迎您</a></span>
						</c:if>
						<c:if test="${user.role!='administrator'}">
							<span><a href="${pageContext.request.contextPath}/infomanage.jsp" class="shopcart">${user.username},欢迎您</a></span>
						</c:if>
					</div>
					<div class="col-lg-1">
						<span><a href="javascript:void(0)" onclick="logout()" class="shopcart">退出</a></span>
					</div>
				</c:if>

			</div>
			<%--导航栏--%>
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="${pageContext.request.contextPath}/index">首页</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

						<ul class="nav navbar-nav col-lg-8" id="navlist">
							<%--<c:forEach items="${categoryList}" var="category" varStatus="vs">--%>
									<%--<li><a href="${pageContext.request.contextPath}/productList?cid=${category.cid}">${category.cname}</a></li>--%>
							<%--</c:forEach>--%>
						</ul>

						<form class="navbar-form navbar-left col-lg-3">
							<div class="form-group">
								<input type="text" class="form-control" id="search" placeholder="Search">
								<div id="info" style="display: none;width: 196px;height: 220px;background-color: white;position: absolute;z-index: 1000;border: 1px black solid">
									<%--搜索框--%>
									<%--<div style="padding-left: 5px;height: 25px;line-height: 25px;border: 1px red solid"><a href="regist.jsp">sldajflkdjasfsadfsad</a></div>--%>
								</div>
							</div>
							<button type="submit" class="btn btn-default">Submit</button>
						</form>
					</div><!-- /.navbar-collapse -->
				</div><!-- /.container-fluid -->
			</nav>
			<hr/>
		</div>
 	</body>
</html>