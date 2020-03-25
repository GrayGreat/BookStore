<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/20
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        function changeState(itemid,state){
            //异步请求修改该购物项的状态
            // alert(itemid+":"+state);
            $.ajax({
                url:"${pageContext.request.contextPath}/changeOrderItemState",
                async:true,
                data:{
                    "itemid":itemid,
                    "state":state
                },
                dataType:"json",
                type:"POST",
                success:function(data){
                    if(data.isSuccess){
                        alert("修改成功");
                    }else{
                        alert("修改失败");
                    }
                    alert("最后一个模块啦");
                }
            });
        }

    </script>
    <style>
        #tBody tr tdstyle {
            height: 111px;
            line-height: 111px;
        }

    </style>
</head>
<body>

    <div class="container">
        <blockquote>
            <p>订单详情</p>
            <footer>订单号:<cite title="Source Title">${order.oid}</cite></footer>
        </blockquote>

        <div class="table-responsive">
            <%--未支付订单详情--%>
            <c:if test="${order.state==0}">
                <table class="table table-bordered table-hover table-striped table-view table-condensed">
                    <thead>
                        <tr>
                            <th>购物项Id</th>
                            <th>封面</th>
                            <th>书名</th>
                            <th>作者</th>
                            <th>单价</th>
                            <th>购买数量</th>
                            <th>小计</th>
                            <th>物流状态</th>
                        </tr>
                    </thead>
                    <tbody id="tBody">
                        <c:forEach items="${order.orderItemList}" var="item">
                            <tr>
                                <td style="height: 111px;line-height: 111px">${item.itemid}</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/bookImg/${item.book.imgurl}" height="100px" width="100px"/>
                                </td>
                                <td style="height: 111px;line-height: 111px">${item.book.bname}</td>
                                <td style="height: 111px;line-height: 111px">${item.book.author}</td>
                                <td style="height: 111px;line-height: 111px">${item.book.price}</td>
                                <td style="height: 111px;line-height: 111px">${item.count}</td>
                                <td style="height: 111px;line-height: 111px">${item.subtotal}</td>
                                <td style="height: 111px;line-height: 111px">该订单未付款</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <%--已支付订单详情--%>
            <c:if test="${order.state==1}">
                <table class="table table-bordered table-hover table-striped table-view table-condensed">
                    <thead>
                        <tr>
                        <th>购物项Id</th>
                        <th>封面</th>
                        <th>书名</th>
                        <th>作者</th>
                        <th>单价</th>
                        <th>购买数量</th>
                        <th>小计</th>
                        <th>物流状态</th>
                        </tr>
                    </thead>
                    <tbody id="paidtBody">
                        <c:forEach items="${order.orderItemList}" var="item" varStatus="vs">
                            <tr>
                                <td style="height: 111px;line-height: 111px">${item.itemid}</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/bookImg/${item.book.imgurl}" height="100px" width="100px"/>
                                </td>
                                <td style="height: 111px;line-height: 111px">${item.book.bname}</td>
                                <td style="height: 111px;line-height: 111px">${item.book.author}</td>
                                <td style="height: 111px;line-height: 111px">${item.book.price}</td>
                                <td style="height: 111px;line-height: 111px">${item.count}</td>
                                <td style="height: 111px;line-height: 111px">${item.subtotal}</td>
                                <td>
                                    <select class="form-control" style="margin-top: 40px" onchange="changeState('${item.itemid}',this.value)">
                                        <%--<option>请选择</option>--%>
                                        <option <c:if test="${item.itemstate==2}">selected="selected"</c:if> value="2"><span style="color: #e38d13">待发货</span></option>
                                        <option <c:if test="${item.itemstate==3}">selected="selected"</c:if> value="3"><span style="color: #2aabd2">运送中</span></option>
                                        <option <c:if test="${item.itemstate==4}">selected="selected"</c:if> value="4"><span style="color: #77cb00">已签收</span></option>
                                    </select>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</body>
</html>
