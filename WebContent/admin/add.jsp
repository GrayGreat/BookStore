<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/9
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>书籍信息添加</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script>

        $(function(){
            $("#addForm").validate({
                rules:{
                    // imgurl cid sales description pnum price bname author
                    "author":{
                        required:true,
                    },
                    "bname":{
                        required:true
                    },
                    "price":{
                        required:true,
                        number:true,
                        // digits:true,
                        min:0
                    },
                    "pnum":{
                        required:true,
                        number:true,
                        digits:true,
                        min:1
                    },
                    "description":{
                        required:true
                    },
                    "sales":{
                        required:true,
                        number:true,
                        digits:true,
                        min:1
                    },
                    "cid":{
                        required:true
                    },
                    "imgurl":{
                        required:true
                    }

                },
                messages:{
                    "author":{
                        required:"作者不能为空",
                    },
                    "bname":{
                        required:"书名不能为空"
                    },
                    "price":{
                        required:"价格不能为空",
                        number:"必须输入合法的数字",
                        // digits:true,
                        min:"价格必须大于0"
                    },
                    "pnum":{
                        required:"库存量不能为空",
                        number:"必须输入合法的数字",
                        digits:"必须输入正数",
                        min:"库存量必须大于0"
                    },
                    "description":{
                        required:"描述不能为空"
                    },
                    "sales":{
                        required:"销量不能为空",
                        number:"必须输入合法的数字",
                        digits:"必须输入正数",
                        min:"销量必须大于0"
                    },
                    "cid":{
                        required:"请选择类型"
                    },
                    "imgurl":{
                        required:"请上传图片"
                    }
                }
            });
        })

    </script>
    <style>
        .error{
            font-size: 10px;
            color: red;
        }
    </style>
</head>
<body>

<h1 style="color: #5cb85c;text-align: center">录入书籍信息</h1>
<hr color="gray"/>
<div class="container table-responsive">
    <table class="table table-striped">
        <a class="btn btn-success" href="${pageContext.request.contextPath}/adminFindAllBooks" role="button">上一层</a>
        <form class="form-horizontal" action="${pageContext.request.contextPath}/uploadFile" enctype="multipart/form-data" id="addForm" method="post">
            <tr>
                <div class="form-group">
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
                        <label for="price" class="control-label text-right">价格:</label>
                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="price" name="price" placeholder="Price">
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
                        <label for="sales" class="control-label text-right">销量</label>
                    </td>
                    <td align="right">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="sales" name="sales" placeholder="Sales">
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
                        <label for="imgurl">图书封面</label>
                    </td>
                    <td>
                        <input type="file" id="imgurl" name="imgurl">
                    </td>
                </div>

                <div class="form-group">
                    <td>
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" class="btn btn-default" value="添加"/>
                        </div>
                    </td>
                </div>
            </tr>
        </form>
    </table>
</div>
</body>
</html>
