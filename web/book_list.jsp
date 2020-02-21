<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/14
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${category.cname}类型图书</title>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link href="css/Home_Page.css" rel="stylesheet" />
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <h1 style="color: #9acfea;text-align: center">${category.cname}类图书</h1>
        <hr style="color: #9acfea"/>
        <a class="btn btn-info" href="${pageContext.request.contextPath}/index">返回主页</a>
        <div class="container">
            <div class="row">

                <c:forEach items="${pageBean.list}" var="book">
                    <div class="col-lg-3 col-md-6 col-xs-12 bookInfo" style="height: 400px" >
                        <div><a href="${pageContext.request.contextPath}/findBookInfo?id=${book.id}&&cid=${cid}&&currentPage=${pageBean.currentPage}"><img src="${pageContext.request.contextPath}/bookImg/${book.imgurl}" class="img-responsive" style="margin: auto"/></a></div>
                    <div><p style="color: red;font-size: 20px">价格:${book.price}元</p></div>
                        <div>书名:<h3 style="text-align: center"><a href="${pageContext.request.contextPath}/findBookInfo?id=${book.id}&&cid=${cid}&&currentPage=${pageBean.currentPage}" class="bookname">${book.bname}</a></h3></div>
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
                    <c:if test="${pageBean.currentPage==1}">
                        <li class="disabled">
                            <a href="javascript:void(0)" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageBean.currentPage!=1}">
                        <li>
                            <a href="${pageContext.request.contextPath}/productList?currentPage=${pageBean.currentPage-1}&cid=${category.cid}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>


                    <%--<c:if test="${empty pageBean.list}">--%>
                    <%--<li><a href="javascript:void(0)">1</a></li>--%>
                    <%--</c:if>--%>
                    <c:forEach begin="1" end="${pageBean.totalPage}" varStatus="vs">
                        <c:if test="${pageBean.currentPage==vs.count}">
                            <li class="active"><a href="${pageContext.request.contextPath}/productList?currentPage=${vs.count}&cid=${category.cid}">${vs.count}</a></li>
                        </c:if>
                        <c:if test="${pageBean.currentPage!=vs.count}">
                            <li><a href="${pageContext.request.contextPath}/productList?currentPage=${vs.count}&cid=${category.cid}">${vs.count}</a></li>
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
                            <a href="${pageContext.request.contextPath}/productList?currentPage=${pageBean.currentPage+1}&cid=${category.cid}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </nav>
    <%--<hr color="mediumpurple"/>--%>

<jsp:include page="history.jsp"></jsp:include>
    <%--<h2 style="color: #9acfea;text-align: center">历史记录</h2>--%>
    <%--<div class="container" style="border:1px mediumpurple solid;padding: 10px">--%>
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

    <%--<hr/>--%>





    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
