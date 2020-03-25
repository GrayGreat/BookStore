<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
	    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
	    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

		<script>
			$(function(){
			   $("#checkAll").click(function(){
			       	$("#tBody input[name='check']").prop("checked",this.checked);
			   });
			   $("#add").click(function(){
			       window.location.href="${pageContext.request.contextPath}/addBookUI";
			   });

			   //批量删除
                $("#batchDel").click(function(){
                    if(confirm("你确定要删除选中项吗?")){
                        $("#tBody input[type=checkbox]:checked").each(function(i,dom){
                            var id=$(this).val();
                            $.ajax({
                                async:true,
                                url:"${pageContext.request.contextPath}/batchDelBook",
                                data:{
                                    "id":id
                                },
                                type:"POST",
                                dataType:"json",
                                success:function(data){
                                    if(data.isDel){
                                        //如果删除成功 ,则移除该节点
                                        $(dom).parent().parent().remove();
                                    }
                                }
                            });
                        });
                    }
                    window.location.href="${pageContext.request.contextPath}/adminFindAllBooks?currentPage=${pageBean.currentPage}";
                });
                $("#queryInfo").click(function(){
                    window.location.href="${pageContext.request.contextPath}/addBookUI?destination=query";
				});
                $("#rank").click(function(){
                    window.location.href="${pageContext.request.contextPath}/rankList";
				})
			});

            function delBookInfo(id){
                var isDel=confirm("确定要删除吗?(操作不可修改)");
                if(isDel){
					// var id=$("#bid").val();
					// alert(id);
					window.location.href="${pageContext.request.contextPath}/delBookInfo?id="+id;
					alert("删除成功!");
                }

            }


		</script>

    </head>
    <body>

		<%--<c:if test="${user==null}">--%>
			<%--<%--%>
				<%--response.sendRedirect(request.getContextPath()+"/login.jsp");--%>

			<%--%>--%>
		<%--</c:if>--%>


		<%--<c:if test="${user!=null}">--%>
		<div class="container">
			<h1 style="text-align: center">图书馆</h1>
			<div class="page-header">
				<h1 style="color: orange;">${sessionScope.user.username},<small>欢迎您!</small></h1>
			</div>
			<div style="width: 902px;margin: auto;margin-bottom: 5px">
				<span style="margin-right: 15px"><button type="button" class="btn btn-info" id="add">添加信息</button></span>
				<span style="margin-right: 15px"><button type="button" class="btn btn-danger" id="batchDel">批量删除</button></span>
				<span style="margin-right: 15px"><button type="button" class="btn btn-success" id="queryInfo">查询图书信息</button></span>
				<span style="margin-right: 15px"><button type="button" class="btn btn-warning" id="rank">销量榜</button></span>
			</div>
		</div>

		<div class="table-responsive container">
			<table class="table table-hover table-bordered table-striped">
				<thead>
					<tr>
						<th>全选<input type="checkbox" name="checkAll" id="checkAll"></th>
						<th>封面</th>
						<th>书名</th>
						<th>作者</th>
						<th>价格</th>
						<th>销量</th>
						<th>类型</th>
						<th>库存量</th>
					</tr>
				</thead>

				<tbody id="tBody">
					<c:forEach items="${requestScope.pageBean.list}" var="book" varStatus="vs">
						<tr>
							<td><input style="margin-top: 13px" type="checkbox" name="check" value="${book.id}"></td>
							<td><img src="${pageContext.request.contextPath}/bookImg/${book.imgurl}" width="50" height="40"></td>
							<td>${book.bname}</td>
							<td>${book.author}</td>
							<td>${book.price}元</td>
							<td>${book.sales}本</td>
							<td>${book.category.cname}</td>
							<td>${book.pnum}本</td>
							<td><a style="color: red;text-decoration: none;"  onclick="delBookInfo('${book.id}')" href="javascript:void(0)" >删除</a></td>
							<td><a style="color: red;text-decoration: none;" href="${pageContext.request.contextPath}/updateBookInfoUI?id=${book.id}">编辑</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>






			<%--//分页查询--%>
		<nav class="navbar navbar-default navbar-fixed-bottom">
			<div style="text-align: center">
				<nav aria-label="Page navigation">
					<ul class="pagination">


							<%--判断显示是不是第一页--%>
						<c:if test="${pageBean.currentPage==1||empty pageBean}">
							<li class="disabled">
								<a href="javascript:void(0)" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>

						<c:if test="${pageBean.currentPage!=1&&!empty pageBean}">
							<li>
								<a href="${pageContext.request.contextPath}/adminFindAllBooks?currentPage=${pageBean.currentPage-1}" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>

						<c:forEach begin="1" end="${pageBean.totalPage}" var="v">
							<c:if test="${pageBean.currentPage==v}">
								<li class="active"><a href="javascript:void(0)">${v}</a></li>
							</c:if>
							<c:if test="${pageBean.currentPage!=v}">
								<li><a href="${pageContext.request.contextPath}/adminFindAllBooks?currentPage=${v}">${v}</a></li>
							</c:if>

						</c:forEach>



						<c:if test="${empty pageBean}">
							<li>
								<a href="javascript:void(0)">1</a>
							</li>
						</c:if>

							<%--判断是是不是最后一页--%>
						<c:if test="${pageBean.totalPage==pageBean.currentPage}">
							<%--是--%>
							<li class="disabled">
								<a href="javascript:void(0)" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
						<c:if test="${pageBean.totalPage!=pageBean.currentPage}">
							<li>
								<a href="${pageContext.request.contextPath}/adminFindAllBooks?currentPage=${pageBean.currentPage+1}" aria-label="Previous">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>


					</ul>
				</nav>
			</div>
		</nav>
		<%--分页结束--%>

		<%--</c:if>--%>
 	</body>
</html>