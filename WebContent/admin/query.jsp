<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/10
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>书籍筛选</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        function delbookInfo(id,currentPage){
            var isDel=confirm("确定要删除吗?(操作不可修改)");
            if(isDel){
                window.location.href="${pageContext.request.contextPath}/delBookInfo?destination=query&id="+id+"&currentPage="+currentPage;
                alert("删除成功!");
            }

        }
    </script>
</head>
<body>

<h1 style="color: #5cb85c;text-align: center">筛选书籍</h1>
<hr color="gray"/>
<div class="container">
    <table class="table table-striped">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/searchBookInfo" method="post">
            <!--传入一个隐藏值,判别用户点击的是搜索按钮还是分页按钮-->
            <a class="btn btn-success" href="${pageContext.request.contextPath}/adminFindAllBooks" role="button">上一层</a>
            <input type="hidden" name="flag" value="1">
            <tr>
                <div class="form-group">
                    <td style="text-align: right;padding-top: 13px">
                        <label for="bname" class="control-label text-right">书名:</label>
                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="bname" name="bname" placeholder="Bname">
                        </div>
                    </td>
                </div>
                <div class="form-group">
                    <td style="text-align: right;padding-top: 13px">
                        <label for="pricebottom" class="control-label">价格介于:</label>
                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="pricebottom" name="pricebottom" placeholder="PriceBottom">
                        </div>
                    <td style="text-align: right;padding-top: 13px">
                        <label class="control-label text-center">到</label>
                    </td>

                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="pricetop" name="pricetop" placeholder="PriceTop">
                        </div>
                    <td style="text-align: right;padding-top: 13px">
                        <label class="control-label text-center">之间</label>
                    </td>
                    </td>
                </div>
            </tr>
            <tr>
                <div class="form-group">
                    <td style="text-align: right;padding-top: 13px">
                        <label for="pnum" class="control-label text-right">库存量:</label>
                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="pnum" name="pnum" placeholder="Pnum">
                        </div>
                    </td>
                </div>
                <div class="form-group">
                    <td style="text-align: right;padding-top: 13px">
                        <label for="description" class="control-label text-right">描述:</label>
                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="description" name="description" placeholder="Description">
                        </div>
                    </td>

                </div>

                <div class="form-group">
                    <td style="text-align: right;padding-top: 13px">
                        <label for="author" class="control-label text-right">作者:</label>
                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="author" name="author" placeholder="Author">
                        </div>
                    </td>

                </div>
            </tr>
            <tr>
                <div class="form-group">
                    <td style="text-align: right;padding-top: 13px">
                        <label for="sales" class="control-label text-right">销量大于</label>
                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="sales" name="sales" placeholder="Sales">
                        </div>
                    </td>
                </div>
                <div class="form-group">
                    <td>
                        <label class="control-label" for="cid">类型:</label>
                    </td>
                    <td>
                        <div class="form-group" name="cid" id="cid">
                            <select name="cid" class="form-control col-lg-2">
                                <option value="">--请选择--</option>
                                <c:forEach items="${categorys}" var="category">
                                    <option value="${category.cid}">${category.cname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                </div>
                <div class="form-group">
                     <td>
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">搜索</button>
                        </div>
                    </td>
                </div>
            </tr>
        </form>
    </table>
    <hr color="gray">
    <div class="table-responsive container">
        <table class="table table-hover table-bordered table-striped">
            <thead>
            <tr >
                <th>全选<input type="checkbox" name="checkAll" id="checkAll"></th>
                <th>封面</th>
                <th>书名</th>
                <th>作者</th>
                <th>价格</th>
                <th>销量</th>
                <th>类型</th>
                <th>库存量</th>
                <%--<th>描述</th>--%>
            </tr>
            </thead>
            <tbody id="tBody">
            <c:forEach items="${requestScope.pageBean.list}" var="book" varStatus="vs">
                <tr>
                    <td><input style="margin-top: 13px" type="checkbox" name="check"></td>
                    <td><img src="${pageContext.request.contextPath}/bookImg/${book.imgurl}" width="50" height="40"></td>
                    <td>${book.bname}</td>
                    <td>${book.author}</td>
                    <td>${book.price}元</td>
                    <td>${book.sales}本</td>
                    <td>${book.category.cname}</td>
                    <td>${book.pnum}本</td>
                    <%--<td>${book.description}</td>--%>
                    <td>
                        <a style="color: red;text-decoration: none;"  onclick="delbookInfo('${book.id}','${pageBean.currentPage}')" href="javascript:void(0)" >删除</a>
                    </td>
                    <td>
                        <a style="color: red;text-decoration: none;" href="${pageContext.request.contextPath}/updateBookInfoUI?destination=query&id=${book.id}&currentPage=${pageBean.currentPage}">编辑</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <%--//分页查询--%>
    <nav class="navbar navbar-default navbar-fixed-bottom">
            <div style="text-align: center">
                <nav aria-label="Page navigation">
                    <ul class="pagination">


                        <%--判断显示是不是第一页--%>
                        <c:if test="${pageBean.currentPage==1||empty pageBean}">
                            <li class="disabled">
                                <a href="javascript:void(0)" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:if test="${pageBean.currentPage!=1&&!empty pageBean}">
                            <li>
                                <a href="${pageContext.request.contextPath}/searchBookInfo?currentPage=${pageBean.currentPage-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach begin="1" end="${pageBean.totalPage}" var="v">
                            <c:if test="${pageBean.currentPage==v}">
                                <li class="active"><a href="javascript:void(0)">${v}</a></li>
                            </c:if>
                            <c:if test="${pageBean.currentPage!=v}">
                                <li><a href="${pageContext.request.contextPath}/searchBookInfo?currentPage=${v}">${v}</a></li>
                            </c:if>

                        </c:forEach>



                        <c:if test="${empty pageBean}">
                            <li>
                                <a href="javascript:void(0)">1</a>
                            </li>
                        </c:if>

                        <%--判断是是不是最后一页--%>
                        <c:if test="${pageBean.totalPage==pageBean.currentPage}">
                            <%--是--%>
                            <li class="disabled">
                                <a href="javascript:void(0)" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${pageBean.totalPage!=pageBean.currentPage}">
                            <li>
                                <a href="${pageContext.request.contextPath}/searchBookInfo?currentPage=${pageBean.currentPage+1}" aria-label="Previous">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>


                    </ul>
                </nav>
            </div>
        </nav>
    </div>
    <%--分页结束--%>
</body>
</html>
