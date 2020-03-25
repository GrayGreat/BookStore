<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/19
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息修改</title>
    <jsp:include page="header.jsp"></jsp:include>
    <%--<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>--%>
    <%--<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script>
        $(function() {
            $("#modify").validate({
                rules: {
                    "password": {
                        required: true
                    },
                    "repassword": {
                        required: true,
                        equalTo: "#password"
                    },
                    "telephone": {
                        required: true
                    }
                },
                messages: {
                    "password": {
                        required: "密码不能为空"
                    },
                    "repassword": {
                        required: "确认密码不能为空",
                        equalTo: "两次密码必须要一致"
                    },
                    "telephone": {
                        required: "手机号不能为空"
                    }

                }
            })
        });
        
        function  modifyInfo() {
            if(confirm("你确定要修改吗?(修改成功后需重新登录)")){
                return true;
            }
            return false;
        }
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


    <div class="container">
        <hr/>
        <h2 style="text-align: center;color:#46b8da">用户信息修改</h2>
        <hr/>
        <%--action="${pageContext.request.contextPath}/modifyInfo"--%>
        <form class="form-horizontal" id="modify" method="post"  onsubmit="return modifyInfo()" action="${pageContext.request.contextPath}/modifyInfo">
            <input type="hidden" value="${user.uid}" name="uid">
            <div class="form-group">
                <label for="email" class="col-sm-4 control-label">Email</label>
                <div class="col-sm-5">
                    <input type="email" class="form-control" id="email" value="${user.email}" placeholder="Email" readonly>
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-sm-4 control-label">Username</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="username" value="${user.username}" placeholder="Username" readonly>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-4 control-label">Password</label>
                <div class="col-sm-5">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                </div>
                <label class="error col-sm-2" for="password"></label>
            </div>
            <div class="form-group">
                <label for="repassword" class="col-sm-4 control-label">Repassword</label>
                <div class="col-sm-5">
                    <input type="password" class="form-control" id="repassword" name="repassword" placeholder="Repassword">
                </div>
                <label class="error col-sm-2" for="repassword"></label>
            </div>
            <div class="form-group">
                <label for="telephone" class="col-sm-4 control-label">Telephone</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="telephone" name="telephone" value="${user.telephone}" placeholder="Telephone">
                </div>
                <label class="error col-sm-2" for="telephone"></label>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-7">
                    <button type="submit" class="btn btn-danger">Modify</button>
                </div>
            </div>
        </form>

    </div>

    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
