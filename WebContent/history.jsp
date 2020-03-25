<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/16
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<hr style="background-color:#fc0302;height: 5px;width:80%;border: none;"/>
<hr style="background-color:#f28b8a;height: 5px;width:70%;border: none;"/>
<hr style="background-color:#f3a358;height: 5px;width:60%;border: none;"/>
<hr style="background-color:#77cb00;height: 5px;width:50%;border: none;"/>
<hr style="background-color:#d5e19a;height: 5px;width:40%;border: none;"/>
<hr style="background-color:#74bce4;height: 5px;width:30%;border: none;"/>
<hr style="background-color:#705090;height: 5px;width:20%;border: none;"/>

<h2 style="color: #9acfea;text-align: center">历史记录</h2>
<div class="container-fluid" style="border:1px mediumpurple solid;padding: 10px">
    <div class="row" style="padding: 0px 30px 0px 100px">
        <c:if test="${!empty historyList}">
            <c:forEach items="${historyList}" var="book">
                <div class="col-lg-3 col-md-6 col-xs-12 bookInfo" style="height: 400px;width:16%" >
                    <div>
                        <a href="${pageContext.request.contextPath}/findBookInfo?id=${book.id}&&cid=${book.cid}&&currentPage=${pageBean.currentPage}">
                            <img src="${pageContext.request.contextPath}/bookImg/${book.imgurl}" class="img-responsive" style="margin: auto"/>
                        </a>
                    </div>
                    <div><p style="color: red;font-size: 20px">价格:${book.price}元</p></div>
                    <div>书名:<h3 style="text-align: center"><a href="${pageContext.request.contextPath}/findBookInfo?id=${book.id}&&cid=${book.cid}&&currentPage=${pageBean.currentPage}" class="bookname">${book.bname}</a></h3></div>
                    <div><h5>${book.description}</h5>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>

<hr style="background-color:#705090;height: 5px;width:20%;border: none;"/>
<hr style="background-color:#74bce4;height: 5px;width:30%;border: none;"/>
<hr style="background-color:#d5e19a;height: 5px;width:40%;border: none;"/>
<hr style="background-color:#77cb00;height: 5px;width:50%;border: none;"/>
<hr style="background-color:#f3a358;height: 5px;width:60%;border: none;"/>
<hr style="background-color:#f28b8a;height: 5px;width:70%;border: none;"/>
<hr style="background-color:#fc0302;height: 5px;width:80%;border: none;"/>
