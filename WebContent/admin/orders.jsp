<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/20
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单详情</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        function checkAdminOrder(oid){
            window.location.href="${pageContext.request.contextPath}/checkAdminOrder?oid="+oid;
        }


    </script>
</head>
<body>
<div class="container-fluid">
    <h3 style="text-align: center;color: #2aabd2">订单信息</h3>
    <%--<hr/>--%>
    <br/>
    <hr/>
    <div class="table-responsive">
        <h1 style="text-align: center;color:#2aabd2">未支付订单</h1>
        <hr/>
        <table style="margin: 0 auto" class="table table-striped table-bordered table-hover table-condensed table-responsive">
            <thead>
                <th>订单号</th>
                <th>下单时间</th>
                <th>总计</th>
                <th>收件人地址</th>
                <th>姓名</th>
                <th>手机号</th>
                <th>订单状态</th>
                <th>商品数量</th>
            </thead>

            <tbody>
                <c:forEach items="${orderList}" var="order" >
                    <c:if test="${order.state==0}">
                        <tr>
                            <td>${order.oid}</td>
                            <td>${order.ordertime}</td>
                            <td>${order.total}</td>
                            <td>${order.address}</td>
                            <td>${order.name}</td>
                            <td>${order.telephone}</td>
                            <td>
                                <c:if test="${order.state==0}">未支付</c:if>
                                <c:if test="${order.state==1}">已支付</c:if>
                            </td>
                            <td>
                                ${fn:length(order.orderItemList)}件
                            </td>
                            <td>
                                <button class="btn btn-info" onclick="checkAdminOrder('${order.oid}')">订单详情</button>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <br/>
    <hr/>
    <hr style="background-color:#705090;height: 5px;width:80%;border: none;"/>
    <hr/>
    <div class="table-responsive">
        <h1 style="text-align: center;color:greenyellow">已支付订单</h1>
        <hr/>
        <table style="margin: 0 auto" class="table table-striped table-bordered table-hover table-condensed table-responsive">
            <thead>
                <th>订单号</th>
                <th>下单时间</th>
                <th>总计</th>
                <th>收件人地址</th>
                <th>姓名</th>
                <th>手机号</th>
                <th>订单状态</th>
                <th>商品数量</th>
            </thead>

            <tbody>
                <c:forEach items="${orderList}" var="order" >
                    <c:if test="${order.state==1}">
                        <tr>
                            <td>${order.oid}</td>
                            <td>${order.ordertime}</td>
                            <td>${order.total}</td>
                            <td>${order.address}</td>
                            <td>${order.name}</td>
                            <td>${order.telephone}</td>
                            <td>
                                <c:if test="${order.state==0}">未支付</c:if>
                                <c:if test="${order.state==1}">已支付</c:if>
                            </td>
                            <td>
                                    ${fn:length(order.orderItemList)}件
                            </td>
                            <td>
                                <button class="btn btn-info" onclick="checkAdminOrder('${order.oid}')">订单详情</button>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>

    </div>

</div>



</body>
</html>
