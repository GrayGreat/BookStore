<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/14
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="header.jsp"></jsp:include>
    <title>商品详情</title>
    <style>
        .book_img{
            height: 520px;
        }
        .shop{
            padding: 10px;
            width: 150px;
            height: 50px;
            background-color: #df3033;
            color: #fbf9ff;
            display: block;
            text-align: center;
            vertical-align: center;
            font-size: 22px;
            text-decoration: none;
            margin:10px auto;
        }
        .shop:hover{
            text-decoration: none;
            color:#9acfea;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script>
        function addCart(){
            var buyNum=$("#buyNum").val();
            window.location.href="${pageContext.request.contextPath}/addBookToCart?id=${book.id}&cid=${category.cid}&buyNum="+buyNum;
        }
        $(function(){
            $.validator.addMethod(
                "num",
                function(value,element,params){
                    if(value>${book.pnum}){
                        return false;
                    }
                    return true;

                }
            )
            $("#buyForm").validate({
                rules:{
                    "buyNum":{
                        required:true,
                        number:true,
                        digits:true,
                        min:1,
                        num:true
                    }
                },
                messages:{
                    "buyNum":{
                        required:"必须要输入购买数量",
                        number:"必须要输入合法的数字",
                        digits:"购买数量不能小于1",
                        min:"购买数量不能小于1",
                        num:"购买数量必须小于库存量(${book.pnum}本)"
                    }
                }

            });


        });
    </script>
    <style>
        .error{
            font-size: 10px;
            color:red;
        }
    </style>
</head>
<body>
    <h1 style="color: #9acfea;text-align: center">商品购买</h1>
    <hr/>
    <div class="container book_img">
        <c:if test="${!empty currentPage}">
            <a class="btn btn-info" href="${pageContext.request.contextPath}/productList?cid=${category.cid}&&currentPage=${currentPage}">返回商品列表</a>
        </c:if>
        <c:if test="${empty currentPage&&empty index}">
            <script>
                function returnSearch() {
                    window.history.go(-1);
                }
            </script>
            <a class="btn btn-info" href="javascript:void(0)" onclick="returnSearch()">返回搜索界面</a>
        </c:if>

        <c:if test="${!empty index}">
            <a class="btn btn-info" href="${pageContext.request.contextPath}/index">返回主页</a>
        </c:if>


        <div class="row">
            <div class="col-lg-5" ><img src="${pageContext.request.contextPath}/bookImg/${book.imgurl}" height="90%"></div>
            <div class="col-lg-7" style="background-color: #f3f3f3">
                <h1>${book.bname}<small style="padding-left: 20px;color: #e38d13">作者:${book.author}</small></h1>
                <h2 style="color: red;">价格:${book.price}元<small style="padding-left: 20px;color: #2aabd2">库存:${book.pnum}本</small></h2>
                <p><h3>描述:</h3><span style="color:gray">${book.description}</span></p>
                <div style="width: 100%;height: 150px;">
                    <div style="width: 40%;height: 100%;display: block;float: left;margin-right: 20px;border: 5px #2aabd2 solid;padding-left: 20px">
                        <h3 style="color: mediumpurple">类型:<h2>${category.cname}</h2></h3>
                    </div>
                    <div style="width: 40%;height: 100%;display: block;float: left;border:5px red solid;padding-left: 20px">
                        <h3 style="color: mediumpurple">销量:<h2>${book.sales}本/月</h2></h3>
                    </div>
                </div>
                <div class="form-inline" style="padding-top: 10px">
                    <form id="buyForm" action="${pageContext.request.contextPath}/addBookToCart" method="post">
                        <%--购买数量: <input type="text" class="form-control"  id="buyNum" style="width: 100px" value="1" name="buyNum" placeholder="buyNum">--%>

                        <%--window.location.href="${pageContext.request.contextPath}/addBookToCart?id=${book.id}&cid=${category.cid}&buyNum="+buyNum;--%>
                        <input type="hidden" name="id" value="${book.id}"/>
                        <input type="hidden" name="cid" value="${category.cid}"/>
                        <%--<input type="hidden" name="buyNum" value="">--%>
                        购买数量: <input type="text" class="form-control"  id="buyNum" style="width: 100px" value="1" name="buyNum" placeholder="buyNum"/>
                        <label id="buyNum-error" class="error" for="buyNum"></label>
                            <br/><br/>
                        <input type="submit" id="shopcart" class="shop" value="加入购物车" style="float: right;"/></a>
                    </form>
                </div>

                <%--<div><a href="javascript:void(0)" onclick="addCart()" id="shopcart" class="shop" style="float: right;">加入购物车</a></div>--%>
            </div>

        </div>

    </div>
    <hr/>
    <br/>
    <br/>
    <hr/>
    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
