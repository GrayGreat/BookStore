<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/15
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书查询</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Home_Page.css"/>

    <style>
        .condition{
            /*display: inline-block;*/
            font-size: 15px;
            font-weight: 400;
            padding:22px;
            /*margin-top: 5px;*/
            /*vertical-align: center;*/
        }

    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <form class="form-inline" action="${pageContext.request.contextPath}/findProductByCondition" method="post">
            <input type="hidden" value="1" name="flag">
            <div class="form-group">
                <span class="condition">作者:</span>
                <input type="text" class="form-control" id="author" name="author" placeholder="Author">
            </div>
            <div class="form-group">
                <span class="condition">书名:</span>
                <input type="text" class="form-control" id="bname" name="bname" placeholder="Bname">
            </div>
            <div class="form-group">
                <span class="condition">类型:</span>
                <select class="form-control" id="cid" name="cid" style="width: 90px">
                    <option value="" style="text-align: center">请选择</option>
                    <c:forEach items="${categoryList}" var="category">
                        <option value="${category.cid}" style="text-align: center">${category.cname}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <span class="condition">价格区间:</span>
                <input type="text" class="form-control" style="width: 90px" id="bottom" name="bottom" placeholder="Bottom">
                -
                <input type="text" class="form-control" style="width: 90px" id="top" name="top" placeholder="Top">
            </div>
            <button type="submit" class="btn btn-default">Search</button>
        </form>
    </div>
    <hr/>

    <%--<div class="container">--%>

    <%--</div>--%>


    <div class="container">
        <h1 style="color: #9acfea;text-align: center">全部图书</h1>
        <hr style="color: #9acfea"/>
        <h5 style="color: mediumpurple;">上次查询条件</h5>
        <form class="form-inline">
            <div class="form-group">
                <span class="condition">作者:</span>
                <input type="text" class="form-control" placeholder="Author" value="${condition.author}" readonly>
            </div>
            <div class="form-group">
                <span class="condition">书名:</span>
                <input type="text" class="form-control" placeholder="Bname" value="${condition.bname}" readonly>
            </div>
            <div class="form-group">
                <span class="condition">类型:</span>
                <select class="form-control" name="category" style="width: 90px"  readonly="#opt">
                    <option id="opt">${condition.cid}</option>
                </select>
            </div>
            <div class="form-group">
                <span class="condition">价格区间:</span>
                <input type="text" class="form-control" style="width: 90px"  placeholder="Bottom" value="${condition.bottom}" readonly>
                -
                <input type="text" class="form-control" style="width: 90px"  placeholder="Top" value="${condition.top}" readonly>
            </div>
        </form>

        <hr style="color: #9acfea"/>
        <a class="btn btn-info" href="${pageContext.request.contextPath}/index">返回主页</a>
        <div class="container">
            <div class="row">
                <c:forEach items="${pageBean.list}" var="book" varStatus="vs">
                    <div class="col-lg-3 col-md-6 col-xs-12 bookInfo" style="height: 400px" >
                        <div><a href="${pageContext.request.contextPath}/findBookInfo?id=${book.id}&&cid=${book.cid}"><img src="${pageContext.request.contextPath}/bookImg/${book.imgurl}" class="img-responsive" style="margin: auto"/></a></div>
                        <div><p style="color: red;font-size: 20px">价格:${book.price}元</p></div>
                        <div>书名:<h3 style="text-align: center"><a href="${pageContext.request.contextPath}/findBookInfo?id=${book.id}&&cid=${book.cid}" class="bookname">${book.bname}</a></h3></div>
                        <div><h5>${book.description}</h5>
                        </div>
                    </div>
                </c:forEach>


                <%--<div class="col-lg-3 col-md-6 col-xs-12 bookInfo" style="height: 400px" >--%>
                    <%--<div><a href="${pageContext.request.contextPath}/book_info.jsp"><img src="${pageContext.request.contextPath}/img/book2.png" class="img-responsive" style="margin: auto"/></a></div>--%>
                    <%--<div><p style="color: red;font-size: 20px">价格:499元</p></div>--%>
                    <%--<div>书名:<h3 style="text-align: center"><a href="${pageContext.request.contextPath}/book_info.jsp" class="bookname">知更鸟女孩</a></h3></div>--%>
                    <%--<div><h5>描述:暗网之信徒，末日之信仰。死亡天使遗失了羽毛，没有人知道她是谁。媲--%>
                        <%--美《哈利·波特》《权力的游戏》的史诗经典系列；震撼全美数百万读者的悬爱之书。....</h5>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-lg-3 col-md-6 col-xs-12 bookInfo" style="height: 400px" >--%>
                    <%--<div><a href="${pageContext.request.contextPath}/book_info.jsp"><img src="${pageContext.request.contextPath}/img/book3.png" class="img-responsive" style="margin: auto"/></a></div>--%>
                    <%--<div><p style="color: red;font-size: 20px">价格:499元</p></div>--%>
                    <%--<div>书名:<h3 style="text-align: center"><a href="${pageContext.request.contextPath}/book_info.jsp" class="bookname">知更鸟女孩</a></h3></div>--%>
                    <%--<div><h5>描述:暗网之信徒，末日之信仰。死亡天使遗失了羽毛，没有人知道她是谁。媲--%>
                        <%--美《哈利·波特》《权力的游戏》的史诗经典系列；震撼全美数百万读者的悬爱之书。....</h5>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-lg-3 col-md-6 col-xs-12 bookInfo" style="height: 400px" >--%>
                    <%--<div><a href="${pageContext.request.contextPath}/book_info.jsp"><img src="${pageContext.request.contextPath}/img/book4.png" class="img-responsive" style="margin: auto"/></a></div>--%>
                    <%--<div><p style="color: red;font-size: 20px">价格:499元</p></div>--%>
                    <%--<div>书名:<h3 style="text-align: center"><a href="${pageContext.request.contextPath}/book_info.jsp" class="bookname">知更鸟女孩</a></h3></div>--%>
                    <%--<div><h5>描述:暗网之信徒，末日之信仰。死亡天使遗失了羽毛，没有人知道她是谁。媲--%>
                        <%--美《哈利·波特》《权力的游戏》的史诗经典系列；震撼全美数百万读者的悬爱之书。....</h5>--%>
                    <%--</div>--%>
                <%--</div>--%>

            </div>

        </div>

    </div>



    <hr/>

    <nav class="navbar navbar-default" style="text-align: center">
        <div class="container">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageBean.currentPage==1||empty pageBean}">
                        <li class="disabled">
                            <a href="javascript:void(0)" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageBean.currentPage!=1&&!empty pageBean}">
                        <li>
                            <a href="${pageContext.request.contextPath}/findProductByCondition?currentPage=${pageBean.currentPage-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>


                    <c:if test="${empty pageBean}">
                        <li><a href="javascript:void(0)">1</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${pageBean.totalPage}" varStatus="vs">
                        <c:if test="${pageBean.currentPage==vs.count}">
                            <li class="active"><a href="${pageContext.request.contextPath}/findProductByCondition?currentPage=${vs.count}">${vs.count}</a></li>
                        </c:if>
                        <c:if test="${pageBean.currentPage!=vs.count}">
                            <li><a href="${pageContext.request.contextPath}/findProductByCondition?currentPage=${vs.count}">${vs.count}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageBean.currentPage==pageBean.totalPage}">
                        <li class="disabled">
                            <a href="javascript:void(0)" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageBean.currentPage!=pageBean.totalPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/findProductByCondition?currentPage=${pageBean.currentPage+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </nav>



    <jsp:include page="history.jsp"></jsp:include>
    <%--<h2 style="color: #9acfea;text-align: center">历史记录</h2>--%>
    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<div class="col-lg-3 col-md-6 col-xs-12 bookInfo" style="height: 400px" >--%>
                <%--<div><a href="${pageContext.request.contextPath}/book_info.jsp"><img src="${pageContext.request.contextPath}/img/book1.png" class="img-responsive" style="margin: auto"/></a></div>--%>
                <%--<div><p style="color: red;font-size: 20px">价格:499元</p></div>--%>
                <%--<div>书名:<h3 style="text-align: center"><a href="${pageContext.request.contextPath}/book_info.jsp" class="bookname">知更鸟女孩</a></h3></div>--%>
                <%--<div><h5>描述:暗网之信徒，末日之信仰。死亡天使遗失了羽毛，没有人知道她是谁。媲--%>
                    <%--美《哈利·波特》《权力的游戏》的史诗经典系列；震撼全美数百万读者的悬爱之书。....</h5>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>

    <%--<hr color="mediumpurple"/>--%>

    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
