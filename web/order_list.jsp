<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/19
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单表</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%----%>
<script>
    function checkOrder(oid){
        window.location.href="${pageContext.request.contextPath}/checkOrder?oid="+oid;
    }
    function delOrder(oid,orderItemList){
        if(confirm("你确定要删除此订单吗")){
            // alert("1");
            // alert(oid);
            // alert(orderItemList);
            // alert(JSON.stringify(orderItemList));
            // var orderItemListJson=JSON.stringify(orderItemList);
            // var list=orderItemList+"";
            // var a=0;
            // for(var i=0;i<orderItemList.length;i++){
            //     a++;
            // }
            // alert(a);
            <%--var orderItemListJson=JSON.parse("${order.orderItemList}");--%>
            // alert("2");
            window.location.href="${pageContext.request.contextPath}/delOrder?oid="+oid;
            alert("删除成功!");
        }
    }

</script>
<div class="container">
    <hr/><br/>

    <h1 style="text-align: center;color:#2aabd2">未支付订单</h1>
    <hr/>
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover table-condensed table-responsive">
            <tr>
                <th>订单号</th>
                <th>下单日期</th>
                <th>总计</th>
                <th>收件人姓名</th>
                <th>订单状态</th>
            </tr>
            <c:forEach items="${orderList}" var="order" varStatus="vs">
                <c:if test="${order.state==0}">
                    <tr>
                        <td style="height: 57px;line-height: 57px;">${order.oid}</td>
                        <td style="height: 57px;line-height: 57px;">${order.ordertime}</td>
                        <td style="height: 57px;line-height: 57px;">${order.total}</td>
                        <td style="height: 57px;line-height: 57px;">${order.name}</td>
                        <td style="height: 57px;line-height: 57px;">
                            <c:if test="${order.state==0}">
                                未支付
                            </c:if>
                            <c:if test="${order.state==1}">
                                已支付
                            </c:if>
                            <c:if test="${order.state==2}">
                                待发货
                            </c:if>
                            <c:if test="${order.state==3}">
                                运送中
                            </c:if>
                            <c:if test="${order.state==4}">
                                已签收
                            </c:if>
                        </td>
                        <td>
                            <button style="margin-top: 12px" class="btn btn-info" onclick="checkOrder('${order.oid}')">查看</button>
                        </td>
                        <td>
                            <button style="margin-top: 12px" class="btn btn-danger" onclick="delOrder('${order.oid}')">删除</button>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>


        </table>
    </div>
    <hr/><br/><br/><br/>

    <h1 style="text-align: center;color:greenyellow">已支付订单</h1>
    <hr/>
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover table-condensed table-responsive">
            <tr>
                <th>订单号</th>
                <th>下单日期</th>
                <th>总计</th>
                <th>收件人姓名</th>
                <th>订单状态</th>
            </tr>
            <c:forEach items="${orderList}" var="order" varStatus="vs">
                <c:if test="${order.state!=0}">
                    <tr>
                        <td style="height: 57px;line-height: 57px;">${order.oid}</td>
                        <td style="height: 57px;line-height: 57px;">${order.ordertime}</td>
                        <td style="height: 57px;line-height: 57px;">${order.total}</td>
                        <td style="height: 57px;line-height: 57px;">${order.name}</td>
                        <td style="height: 57px;line-height: 57px;">
                            <c:if test="${order.state==0}">
                                未支付
                            </c:if>
                            <c:if test="${order.state==1}">
                                已支付
                            </c:if>
                            <c:if test="${order.state==2}">
                                待发货
                            </c:if>
                            <c:if test="${order.state==3}">
                                运送中
                            </c:if>
                            <c:if test="${order.state==4}">
                                已签收
                            </c:if>
                        </td>
                        <td>
                            <button style="margin-top: 12px" class="btn btn-info" onclick="checkOrder('${order.oid}')">查看</button>
                        </td>
                        <td>
                            <button style="margin-top: 12px" class="btn btn-danger" onclick="delOrder('${order.oid}')">删除</button>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>


        </table>
    </div>
</div>
<hr/>
<%----%>
<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>
