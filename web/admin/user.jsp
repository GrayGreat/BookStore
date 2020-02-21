<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/20
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <h3 style="text-align: center;color: #2aabd2">用户信息</h3>
        <div class="table-responsive">
            <table style="margin: 0 auto" class="table table-striped table-bordered table-hover table-condensed table-responsive">
                <thead>
                    <th>Uid</th>
                    <th>用户名</th>
                    <th>邮箱</th>
                    <th>手机号</th>
                    <th>注册时间</th>
                    <th>性别</th>
                    <th>状态</th>
                </thead>

                <tbody>
                    <c:forEach items="${userList}" var="user" >
                        <tr>
                            <td>${user.uid}</td>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user.telephone}</td>
                            <td>${user.regist_time}</td>
                            <td>${user.gender}</td>
                            <td>
                                <c:if test="${user.state==0}">
                                    未激活
                                </c:if>
                                <c:if test="${user.state==1}">
                                    已激活
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>


            </table>
        </div>

    </div>
</body>
</html>
