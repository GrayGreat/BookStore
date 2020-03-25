<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/21
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        function returnBack(){
            window.location.href="${pageContext.request.contextPath}/adminFindAllBooks";
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h1 style="color: orange;">${sessionScope.user.username},<small>欢迎您!</small></h1>
        </div>
        <h1 style="text-align: center">销量排行榜</h1>
        <hr/>
        <button class="btn btn-success" onclick="returnBack()" style="margin:16px;">上一层</button>
        <div class="table-responsive container">
            <table class="table table-hover table-bordered table-striped">
                <thead>
                <tr>
                    <%--<th>全选<input type="checkbox" name="checkAll" id="checkAll"></th>--%>
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
                <c:forEach items="${bookList}" var="book" varStatus="vs">
                    <tr>
                        <%--<td><input style="margin-top: 13px" type="checkbox" name="check" value="${book.id}"></td>--%>
                        <td><img src="${pageContext.request.contextPath}/bookImg/${book.imgurl}" width="50" height="40"></td>
                        <td>${book.bname}</td>
                        <td>${book.author}</td>
                        <td>${book.price}元</td>
                        <td>${book.sales}本</td>
                        <td>${book.category.cname}</td>
                        <td>${book.pnum}本</td>
                        <%--<td><a style="color: red;text-decoration: none;"  onclick="delBookInfo('${book.id}')" href="javascript:void(0)" >删除</a></td>--%>
                        <%--<td><a style="color: red;text-decoration: none;" href="${pageContext.request.contextPath}/updateBookInfoUI?id=${book.id}">编辑</a></td>--%>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>

</body>
</html>
