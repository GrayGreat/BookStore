<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/15
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>购物车车</title>
    <script>

        function delCartItem(id){
            if(confirm("你确定要删除该商品项吗?")){
                window.location.href="${pageContext.request.contextPath}/delCartItem?id="+id;
            }
        }
        function clearCartItems(){
            if(confirm("你确定要清空购物车车吗?")){
                window.location.href="${pageContext.request.contextPath}/clearCartItems";
            }
        }
        function returnBack(){
            history.go(-1);
        }
        function submitOrder(){
            // alert(array);
            window.location.href="${pageContext.request.contextPath}/submitOrder";
        }
        function  loginNow() {
            window.location.href="${pageContext.request.contextPath}/login.jsp";
        }
        function shopNow(){
            window.location.href="${pageContext.request.contextPath}/index";
        }
    </script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <%--购物车为空,显示兔子--%>
    <c:if test="${empty cart.cartItems}">
        <div class="container" style="background-color: #f5f5f5">
            <div class="row" style="height: 550px;padding: 115px 100px;">
                <div class="col-lg-5">
                    <img src="${pageContext.request.contextPath}/img/cart-empty.png" class="img-responsive" >
                </div>
                <div class="col-lg-7" style="height: 275px;padding: 51px 0px 0px 30px;">
                    <span style="color: #b0b0b0;font-weight: bold;font-size: 40px;">您的购物车是空的额！</span><br/><br/><br/>
                    <c:if test="${empty user}">
                        <span style="color: #b0b0b0;font-size: 20px;">登录后将显示您之前加入的商品</span><br/><br/>
                        <span style="display: inline-block;width: 172px;height: 50px;padding-left: 20px">
                            <button class="btn" onclick="loginNow()" style="background-color: #ff6700;width:100%;height:100%;color: white">立即登录</button>
                        </span>
                    </c:if>
                    <span style="display: inline-block;width: 172px;height: 50px;padding-left: 20px;">
                        <button class="btn" onclick="shopNow()" style="background-color: #f5f5f5;width:100%;height:100%;color: #ff6700;border: 1px #ff6700 solid">马上去购物</button>
                    </span>
                </div>

            </div>
        </div>

    </c:if>

    <%--购物车不为空,则显示购物车内容--%>
    <c:if test="${!empty cart.cartItems}">
        <div class="container table-responsive">
            <h1 style="color: darkorchid;text-align: center">购物车</h1>
            <hr/>
            <a class="btn btn-info" href="javascript:void(0)" onclick="returnBack()">返回上一层</a>
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <th>封面</th>
                    <th>书名</th>
                    <th>作者</th>
                    <th>类型</th>
                    <th>价格</th>
                    <th>库存量</th>
                    <th>购买数量</th>
                    <th>小计</th>
                </tr>
                <script>
                    function reduceNum(id,num){
                    //    先修改 session中的cart,在动态修改网页的显示内容
                        var pnumEle=$("#"+id+" input[type='text']");
                        var newNum=parseInt(pnumEle.val())-1;
                        pnumEle.val(newNum);
                        if(newNum<=1){
                            //动态修改button的disabled属性
                            $("#"+id+" button[name='reduce']").attr("disabled",true);
                        }else{
                            $("#"+id+" button[name='reduce']").attr("disabled",false);
                        }
                        if(newNum>=num){
                            //动态修改button的disabled属性
                            $("#"+id+" button[name='add']").attr("disabled",true);
                        }else{
                            $("#"+id+" button[name='add']").attr("disabled",false);
                        }
                        var buyNum=parseInt(newNum);
                        //ajax修改cart的内容--->传入购物车项的商品的id与新的购买数量
                        $.ajax({
                            async:true,
                            url:"${pageContext.request.contextPath}/changeCart",
                            dataType:"json",
                            data:{
                                "id":id,
                                "buyNum":buyNum
                            },
                            type:"POST",
                            success:function(data){
                                //成功则修改网页显示的内容
                                if(data.isSuccess){
                                    //修改小计
                                    $("#"+id+" td[name='subtotal']").html(data.subtotal);
                                    //修改总计
                                    $("#total").html(data.total);
                                }
                            }
                        });
                    }
                    function addNum(id,num){
                        // alert($("#total").html());
                        var pnumEle=$("#"+id+" input[type='text']");
                        var newNum=parseInt(pnumEle.val())+1;
                        pnumEle.val(newNum);
                        if(newNum>=num){
                            //动态修改button的disabled属性
                            $("#"+id+" button[name='add']").attr("disabled",true);
                        }else{
                            $("#"+id+" button[name='add']").attr("disabled",false);
                        }
                        if(newNum<=1){
                            //动态修改button的disabled属性
                            $("#"+id+" button[name='reduce']").attr("disabled",true);
                        }else{
                            $("#"+id+" button[name='reduce']").attr("disabled",false);
                        }
                        var buyNum=parseInt(newNum);
                        //ajax修改cart的内容--->传入购物车项的商品的id与新的购买数量
                        $.ajax({
                            async:true,
                            url:"${pageContext.request.contextPath}/changeCart",
                            dataType:"json",
                            data:{
                                "id":id,
                                "buyNum":buyNum
                            },
                            type:"POST",
                            success:function(data){
                                //成功则修改网页显示的内容
                                if(data.isSuccess){
                                    //修改小计
                                    $("#"+id+" td[name='subtotal']").html(data.subtotal);
                                    //修改总计
                                    $("#total").html(data.total);
                                }
                            }
                        });
                    }
                </script>
                <c:forEach items="${cart.cartItems}" var="entry" varStatus="vs">
                    <%--id为当前购物项商品的id值--%>
                    <tr id="${entry.value.book.id}">
                        <td><img src="${pageContext.request.contextPath}/bookImg/${entry.value.book.imgurl}" height="100px"></td>
                        <td style="height: 100px;line-height: 100px">${entry.value.book.bname}</td>
                        <td style="height: 100px;line-height: 100px">${entry.value.book.author}</td>
                        <td style="height: 100px;line-height: 100px">${entry.value.book.category.cname}</td>
                        <td style="height: 100px;line-height: 100px">${entry.value.book.price}元</td>
                        <td style="height: 100px;line-height: 100px">${entry.value.book.pnum}本</td>
                        <td style="height: 100px;line-height: 100px">
                            <button class="btn btn-danger" name="reduce" <c:if test="${entry.value.buyNum==1}">disabled</c:if> onclick="reduceNum('${entry.value.book.id}','${entry.value.book.pnum}')" >-</button>
                            <input type="text" name="num" value="${entry.value.buyNum}" onkeyup="changeNum('${entry.value.book.id}')" readonly style="width: 40px;height: 20px">
                            <button class="btn btn-success" name="add" <c:if test="${entry.value.buyNum>=entry.value.book.pnum}">disabled</c:if> onclick="addNum('${entry.value.book.id}','${entry.value.book.pnum}')">+</button>
                        </td>
                        <td style="height: 100px;line-height: 100px" name="subtotal">${entry.value.subtotal}元</td>
                        <td style="height: 100px;line-height: 100px">
                            <a class="btn btn-warning" href="javascript:void(0)" style="margin: 33px 10px" onclick="delCartItem('${entry.value.book.id}')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <hr/>
            <span style="color: red;font-size: 25px;font-weight: bold">总计:</span><span id="total">${cart.total}</span><span style="color: red;font-size: 25px;font-weight: bold">元</span>
            <a class="btn btn-success" style="float: right; margin-bottom: 20px" onclick="submitOrder()" href="javascript:void(0)">提交订单</a>
            <a class="btn btn-danger" style="float: right; margin: 0px 20px 20px 0px;" href="javascript:void(0)" onclick="clearCartItems()">清空购物车</a>

        </div>
    </c:if>


    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
