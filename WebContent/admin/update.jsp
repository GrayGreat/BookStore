<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/10
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍信息修改</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $(function(){
            $("#category").find("option").each(function(i){
                if($(this).val()=="${book.cid}"){
                    $(this).prop("selected","selected");
                    // alert(i);
                }
                // alert(i);
            });
        });

    </script>
    <style>
        .bor:hover{
            border: 1px solid #77cb00;
        }
    </style>
</head>
<body>

<h1 style="color: #5cb85c;text-align: center">修改书籍信息</h1>
<hr color="gray"/>
<div class="container">
    <c:if test="${empty destination}">
        <a class="btn btn-success" href="${pageContext.request.contextPath}/adminFindAllBooks" role="button">上一层</a>
    </c:if>
    <c:if test="${!empty destination}">
        <a class="btn btn-success" href="${pageContext.request.contextPath}/searchBookInfo?currentPage=${currentPage}" role="button">上一层</a>
    </c:if>
    <table class="table table-striped">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/updateBookInfo" method="post" enctype="multipart/form-data">
            <input name="id" type="hidden" value="${book.id}">
            <tr>
                <div class="form-group">
                    <div class="form-group">
                        <td style="text-align: right;padding-top: 13px">
                            <label for="author" class="control-label text-right">作者:</label>
                        </td>
                        <td align="right">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="author" name="author" value="${book.author}" placeholder="Author">
                            </div>
                        </td>
                    </div>
                    <td style="text-align: right;padding-top: 13px">
                        <label for="bname" class="control-label text-right">书名:</label>
                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="bname" name="bname" value="${book.bname}" placeholder="Bname">
                        </div>
                    </td>
                </div>
                <div class="form-group">
                    <td style="text-align: right;padding-top: 13px">
                        <label for="price" class="control-label text-right">价格:</label>
                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="price" name="price" value="${book.price}" placeholder="Price">
                        </div>
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
                            <input type="text" class="form-control" id="pnum" name="pnum" value="${book.pnum}" placeholder="Pnum">
                        </div>
                    </td>
                </div>
                <div class="form-group">
                    <td style="text-align: right;padding-top: 13px">
                        <label for="description" class="control-label text-right">描述:</label>
                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="description" name="description" value="${book.description}" placeholder="Description">
                        </div>
                    </td>
                </div>

                <div class="form-group">
                    <td style="text-align: right;padding-top: 13px">
                        <label for="sales" class="control-label text-right">销量</label>
                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="sales" name="sales" value="${book.sales}" placeholder="Sales">
                        </div>
                    </td>
                </div>
            </tr>

            <tr>
                <div class="form-group">
                    <td>
                        <label class="control-label" for="cid">类型:</label>
                    </td>
                    <td>
                        <div class="form-group" name="cid" id="cid">
                            <select name="cid" class="form-control col-lg-2">
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.cid}">${category.cname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                </div>

                <div class="form-group">
                    <td>
                        <label for="imgurl">图书封面</label>
                    </td>
                    <td>
                        <input type="file" id="imgurl" name="imgurl" value="${book.imgurl}">
                        <p class="help-block">Example block-level help text here.</p>
                    </td>
                </div>

                <div class="form-group">
                    <td>
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">修改</button>
                        </div>
                    </td>
                </div>
            </tr>
        </form>
    </table>
    <img src="${pageContext.request.contextPath}/bookImg/${book.imgurl}" class="img-responsive bor"  style="text-align: center">
</div>
</body>
</html>
