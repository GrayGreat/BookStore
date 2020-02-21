<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/15
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <jsp:include page="header.jsp"></jsp:include>
    <title>订单详情</title>
    <%--<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <%--表单校验--%>
    <script>

        $(function(){
            $("#orderForm").validate({
                rules:{
                    "name":{
                        required:true
                    },
                    "address":{
                        required:true
                    },
                    "telephone":{
                        required:true
                    },
                    // checkTelephone checkAddress checkName
                    "checkName":{
                        required:true
                    },
                    "checkAddress":{
                        required:true
                    },
                    "checkTelephone":{
                        required:true
                    },
                },
                messages:{
                    "name":{
                        required:"收件人姓名不能为空"
                    },
                    "address":{
                        required:"收货地址不能为空"
                    },
                    "telephone":{
                        required:"收件人手机号码不能为空"
                    },
                    "checkName":{
                        required:"姓名不能为空"
                    },
                    "checkAddress":{
                        required:"地址不能为空"
                    },
                    "checkTelephone":{
                        required:"手机号不能为空"
                    }
                }
            });
        });
    </script>
    <style>
        .error{
            font-size: 10px;
            color: red;
            height: 34px;
            line-height: 34px;
        }
    </style>
</head>
<body>
<c:if test="${empty user}">
    <%
        response.sendRedirect(request.getContextPath()+"/login.jsp");
    %>
</c:if>
<c:if test="${!empty user}">

    <div class="container table-responsive">
        <h1 style="color: darkorchid;text-align: center">我的订单</h1>
        <hr/>
        <a class="btn btn-info" href="${pageContext.request.contextPath}/orderList">返回订单列表界面</a>
        <c:if test="${order.state!=0}">
            <h3 style="color:yellowgreen">已支付</h3>
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <th>封面</th>
                    <th>书名</th>
                    <th>作者</th>
                    <th>单价</th>
                    <th>库存量</th>
                    <th>小计</th>
                    <th>购买数量</th>
                    <th>商品状态</th>
                </tr>

                <%--遍历所有订单--%>
                <%--<c:forEach items="${paidOrders}" var="order">--%>
                    <%--遍历所有订单中的订单项--->两次for循环--%>
                    <%--private String itemid;//订单项id--%>
                    <%--private int count;//购买数量--%>
                    <%--private double subtotal;//小计--%>
                    <%--private Book Book;//购买的 商品--%>
                    <%--private Order order;//所属哪一个订单--%>
                    <c:forEach items="${order.orderItemList}" var="item">
                        <tr>
                            <td><img src="${pageContext.request.contextPath}/bookImg/${item.book.imgurl}" height="100px"></td>
                            <td style="height: 100px;line-height: 100px">${item.book.bname}</td>
                            <td style="height: 100px;line-height: 100px">${item.book.author}</td>
                            <%--<td style="height: 100px;line-height: 100px">文学</td>--%>
                            <td style="height: 100px;line-height: 100px">${item.book.price}元</td>
                            <td style="height: 100px;line-height: 100px">${item.book.pnum}本</td>
                            <td style="height: 100px;line-height: 100px">${item.subtotal}元</td>
                            <td style="height: 100px;line-height: 100px">${item.count}本</td>
                            <td style="height: 100px;line-height: 100px">
                                <%--<c:if test="${item.state==0}">--%>
                                    <%--未支付--%>
                                <%--</c:if>--%>
                                <%--<c:if test="${order.state==1}">--%>
                                    <%--已支付--%>
                                <%--</c:if>--%>
                                <c:if test="${item.itemstate==2}">
                                    待发货
                                </c:if>
                                <c:if test="${item.itemstate==3}">
                                    运送中
                                </c:if>
                                <c:if test="${item.itemstate==4}">
                                    已签收
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                <%--</c:forEach>--%>
            </table>
            <hr/>
            <br/>
        </c:if>
        
        <c:if test="${order.state==0}">
            <h3 style="color:yellowgreen">未支付</h3>
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <th>封面</th>
                    <th>书名</th>
                    <th>作者</th>
                    <th>单价</th>
                    <th>库存量</th>
                    <th>小计</th>
                    <th>购买数量</th>
                    <th>商品状态</th>
                </tr>

                    <%--遍历所有订单--%>
                <%--<c:forEach items="${noPayOrders}" var="order">--%>
                    <%--遍历所有订单中的订单项--->两次for循环--%>
                    <%--private String itemid;//订单项id--%>
                    <%--private int count;//购买数量--%>
                    <%--private double subtotal;//小计--%>
                    <%--private Book Book;//购买的 商品--%>
                    <%--private Order order;//所属哪一个订单--%>
                    <c:forEach items="${order.orderItemList}" var="item">
                        <tr>
                            <td><img src="${pageContext.request.contextPath}/bookImg/${item.book.imgurl}" height="100px"></td>
                            <td style="height: 100px;line-height: 100px">${item.book.bname}</td>
                            <td style="height: 100px;line-height: 100px">${item.book.author}</td>
                                <%--<td style="height: 100px;line-height: 100px">文学</td>--%>
                            <td style="height: 100px;line-height: 100px">${item.book.price}元</td>
                            <td style="height: 100px;line-height: 100px">${item.book.pnum}本</td>
                            <td style="height: 100px;line-height: 100px">${item.subtotal}元</td>
                            <td style="height: 100px;line-height: 100px">${item.count}本</td>
                            <c:if test="${order.state==0}">
                                <td style="height: 100px;line-height: 100px">未支付</td>
                            </c:if>
                            <c:if test="${order.state==1}">
                                <td style="height: 100px;line-height: 100px">已支付</td>
                            </c:if>
                            <%--<c:if test="${item.itemstate==2}">--%>
                                <%--待发货--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${item.itemstate==3}">--%>
                                <%--运送中--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${item.itemstate==4}">--%>
                                <%--已签收--%>
                            <%--</c:if>--%>
                        </tr>
                    </c:forEach>
                <%--</c:forEach>--%>
            </table>
            <br/>

            <hr style="background-color:yellowgreen;height: 5px;width:80%;border: none;"/>
            <br/>
            <h3 style="text-align: center;color: #2aabd2">填写个人信息</h3>
            <hr/>

            <%--表单--%>
            <form class="form-horizontal" method="post" id="orderForm" action="${pageContext.request.contextPath}/payment">
                <input type="hidden" name="oid" value="${order.oid}">
                <div class="form-group">
                    <label for="name" class="col-sm-3 control-label">姓名:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="name" name="name" placeholder="Name">
                    </div>
                    <div class="col-sm-3">
                        <label id="Name-error" class="error" for="name"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="address" class="col-sm-3 control-label">地址:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="address" name="address" placeholder="Address">
                    </div>
                    <div class="col-sm-3">
                        <label id="Address-error" class="error" for="address"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="telephone" class="col-sm-3 control-label">手机号码:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="telephone" name="telephone" placeholder="Telephone">
                    </div>
                    <div class="col-sm-3">
                        <label id="Telephone-error" class="error" for="telephone"></label>
                    </div>
                </div>

                <hr/>

                <%----%>

                <div style="margin: auto;width: 100%;border: 1px red solid;padding-left: 200px;">
                    <div style="margin-bottom: 20px;">
                        <input id="ICBC-NET-B2C" type="radio" name="yh"	value="ICBC-NET-B2C" checked="checked" />
                        <img	name="ICBC-NET-B2C" align="middle"		src="bank_img/icbc.bmp" />
                        <input	id="CMBCHINA-NET-B2C" type="radio" name="yh"	value="CMBCHINA-NET-B2C" />
                        <img name="CMBCHINA-NET-B2C"	align="middle" src="bank_img/cmb.bmp"/>
                        <input
                                id="ABC-NET-B2C" type="radio" name="yh" value="ABC-NET-B2C" />
                        <img
                                name="ABC-NET-B2C" align="middle"
                                src="bank_img/abc.bmp"/>
                        <input
                                id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C" />
                        <img
                                name="CCB-NET-B2C" align="middle"
                                src="bank_img/ccb.bmp" />
                    </div>
                    <div style="margin-bottom: 20px;">
                        <input id="BCCB-NET-B2C" type="radio" name="yh"
                               value="BCCB-NET-B2C" />
                        <img name="BCCB-NET-B2C" align="middle"
                             src="bank_img/bj.bmp" /> <input
                            id="BOCO-NET-B2C" type="radio" name="yh" value="BOCO-NET-B2C" />
                        <img name="BOCO-NET-B2C" align="middle"
                             src="bank_img/bcc.bmp" />
                        <input
                                id="CIB-NET-B2C" type="radio" name="yh" value="CIB-NET-B2C" />
                        <img
                                name="CIB-NET-B2C" align="middle"
                                src="bank_img/cib.bmp" /> <input
                            id="NJCB-NET-B2C" type="radio" name="yh" value="NJCB-NET-B2C" />
                        <img name="NJCB-NET-B2C" align="middle"
                             src="bank_img/nanjing.bmp" />
                    </div>
                    <div style="margin-bottom: 20px;">
                        <input id="CMBC-NET-B2C" type="radio" name="yh"
                               value="CMBC-NET-B2C" />
                        <img name="CMBC-NET-B2C" align="middle"
                             src="bank_img/cmbc.bmp" /> <input
                            id="CEB-NET-B2C" type="radio" name="yh" value="CEB-NET-B2C" /> <img
                            name="CEB-NET-B2C" align="middle"
                            src="bank_img/guangda.bmp" /> <input
                            id="BOC-NET-B2C" type="radio" name="yh" value="BOC-NET-B2C" /> <img
                            name="BOC-NET-B2C" align="middle"
                            src="bank_img/bc.bmp" /> <input
                            id="PINGANBANK-NET" type="radio" name="yh" value="PINGANBANK-NET" />
                        <img name="PINGANBANK-NET" align="middle"
                             src="bank_img/pingan.bmp" />
                    </div>
                    <div style="margin-bottom: 20px;">
                        <input id="CBHB-NET-B2C" type="radio" name="yh"
                               value="CBHB-NET-B2C" /> <img name="CBHB-NET-B2C" align="middle"
                                                            src="bank_img/bh.bmp" /> <input
                            id="HKBEA-NET-B2C" type="radio" name="yh" value="HKBEA-NET-B2C" />
                        <img name="HKBEA-NET-B2C" align="middle"
                             src="bank_img/dy.bmp" /> <input
                            id="NBCB-NET-B2C" type="radio" name="yh" value="NBCB-NET-B2C" />
                        <img name="NBCB-NET-B2C" align="middle"
                             src="bank_img/ningbo.bmp" /> <input
                            id="ECITIC-NET-B2C" type="radio" name="yh" value="ECITIC-NET-B2C" />
                        <img name="ECITIC-NET-B2C" align="middle"
                             src="bank_img/zx.bmp" />
                    </div>
                    <div style="margin-bottom: 20px;">
                        <input id="SDB-NET-B2C" type="radio" name="yh" value="SDB-NET-B2C" />
                        <img name="SDB-NET-B2C" align="middle"
                             src="bank_img/sfz.bmp" /> <input
                            id="GDB-NET-B2C" type="radio" name="yh" value="GDB-NET-B2C" /> <img
                            name="GDB-NET-B2C" align="middle"
                            src="bank_img/gf.bmp" /> <input
                            id="SHB-NET-B2C" type="radio" name="yh" value="SHB-NET-B2C" /> <img
                            name="SHB-NET-B2C" align="middle"
                            src="bank_img/sh.bmp" /> <input
                            id="SPDB-NET-B2C" type="radio" name="yh" value="SPDB-NET-B2C" />
                        <img name="SPDB-NET-B2C" align="middle"
                             src="bank_img/shpd.bmp" />
                    </div>
                    <div style="margin-bottom: 20px;">
                        <input id="POST-NET-B2C" type="radio" name="yh"
                               value="POST-NET-B2C" /> <img name="POST-NET-B2C" align="middle"
                                                            src="bank_img/post.bmp" /> <input
                            id="BJRCB-NET-B2C" type="radio" name="yh" value="BJRCB-NET-B2C" />
                        <img name="BJRCB-NET-B2C" align="middle"
                             src="bank_img/beijingnongshang.bmp" /> <input
                            id="HXB-NET-B2C" type="radio" name="yh" value="HXB-NET-B2C" /> <img
                            name="HXB-NET-B2C" align="middle"
                            src="bank_img/hx.bmp" /> <input id="CZ-NET-B2C"
                                                            type="radio" name="yh" value="CZ-NET-B2C" /> <img
                            name="CZ-NET-B2C" align="middle"
                            src="bank_img/zheshang.bmp" />
                    </div>
                </div>

                <%--<jsp:include page="pay.jsp"></jsp:include>--%>
                <span>商品总额:<span style="font-size: 30px;color:red;padding: 0px 15px">${ order.total}</span>元</span>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <%--<button onclick="payment()" type="submit" class="btn btn-success" style="float: right;margin-bottom: 20px">支付订单</button>--%>

                            <%----%>
                        <br/>
                        <!-- Button trigger modal -->
                        <button type="button" style="float: right;" onclick="getInfo()" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">
                            支付订单
                        </button>
                        <script>
                            function getInfo(){
                                var name=$("#name").val();
                                var address=$("#address").val();
                                var telephone=$("#telephone").val();
                                // checkName checkAddress checkTelephone
                                $("#checkName").val(name);
                                $("#checkAddress").val(address);
                                $("#checkTelephone").val(telephone);

                            }

                        </script>
                                <%--
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">姓名:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="address" class="col-sm-2 control-label">地址:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="address" name="address" placeholder="Address">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-2 control-label">手机号码:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="telephone" name="telephone" placeholder="Telephone">
                                    </div>
                                </div>

                                --%>
                        <!-- Modal -->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">信息详情</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>收件人信息</p>
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="checkName" class="col-sm-2 control-label">姓名:</label>
                                                <div class="col-sm-7">
                                                    <input type="text" class="form-control" id="checkName" name="checkName" placeholder="未填写" readonly>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label class="error" for="checkName"></label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="checkAddress" class="col-sm-2 control-label">地址:</label>
                                                <div class="col-sm-7">
                                                    <input type="text" class="form-control" id="checkAddress" name="checkAddress" placeholder="未填写" readonly>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label class="error" for="checkAddress"></label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="checkTelephone" class="col-sm-2 control-label">手机号码:</label>
                                                <div class="col-sm-7">
                                                    <input type="text" class="form-control" id="checkTelephone" name="checkTelephone" placeholder="未填写" readonly>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label class="error" for="checkTelephone"></label>
                                                </div>
                                            </div>
                                        </form>

                                        <%----%>


                                        <p>共${fn:length(order.orderItemList)}件商品</p>
                                        <p>
                                            账单号:${order.oid}
                                            <%--<c:forEach items="${noPayOrders}" var="order" varStatus="vs">--%>
                                                <%--<br/>${vs.count})${order.oid}--%>
                                            <%--</c:forEach>--%>
                                        </p>
                                        <span>总额:<span style="color: red;font-size: 25px">${order.total}</span>元</span>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Payment</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                            <%----%>


                    </div>
                </div>
                <br/><hr style="margin-bottom: 10px"/>
            </form>
            <hr/>
        </c:if>
    </div>
        <%--<div class="container">--%>

        <%--</div>--%>



    <jsp:include page="footer.jsp"></jsp:include>

</c:if>
</body>
</html>
