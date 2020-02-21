<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/10
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录界面</title>
    <jsp:include page="header.jsp"></jsp:include>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">--%>
    <%--<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script>

    </script>
    <style>
        .error{
            color: red;
            font-size: 10px;
            height: 34px;
            line-height: 34px;
        }
    </style>
    <script>
        function changeCheckNum(){
            var elementById = document.getElementById("checkImg");
            elementById.src="${pageContext.request.contextPath}/checkCode?time="+new Date().getTime()
        }


        //登录表单验证
        $(function(){
           $("#loginForm").validate({
               rules:{
                   "username":{
                       required:true
                   },
                   "password":{
                       required:true
                   },
                   "checkCode":{
                       required:true
                   }
               },
               messages:{
                   "username":{
                       required:"用户名还没填呢"
                   },
                   "password":{
                       required:"密码还没填额"
                   },
                   "checkCode":{
                       required:"验证码也要填写"
                   }
               }
           });
           $("#autoLogin").click(function(){
               $("#remember").prop("checked",this.checked);
           });
        });



    </script>
</head>
<body>
    <div class="container" style="height: 509px">
        <h1 style="text-align: center;color: #46b8da">用户登录</h1>
        <hr/>
        <form action="${pageContext.request.contextPath}/login" id="loginForm"  class="form-horizontal"  method="post">
            <div class="form-group">
                <label for="username" class="col-sm-4 control-label">Username</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="username" name="username" value="${username}" placeholder="Username">
                </div>
                <div class="col-sm-4">
                    <label for="username" class="error" id="usernameTips"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-4 control-label">Password</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="password" name="password" value="${password}" placeholder="Password">
                </div>
                <div class="col-sm-4">
                    <label for="password" class="error" id="passwordTips"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="checkCode" class="col-sm-4 control-label">CheckCode</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="checkCode" name="checkCode" placeholder="CheckCode">
                </div>
                <div class="col-sm-2">
                    <img src="${pageContext.request.contextPath}/checkCode" id="checkImg" onclick="changeCheckNum()" style="width: 100px;height: 34px;">
                </div>
                <div class="col-sm-4">
                    <label for="checkCode" class="error" id="checkCodeTips"></label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-1">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"  id="remember" name="remember">Remember
                        </label>
                    </div>
                </div>
                <div class="col-sm-1">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="autoLogin" name="autoLogin">Auto
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-7">
                    <button type="submit" class="btn btn-success">Sign in</button>
                </div>
                <div class="col-sm-offset-5 col-sm-7">
                    <span id="loginInfo" style="color:red">${loginInfo}</span>
                </div>
            </div>
        </form>
    </div>

        <%--<hr/>--%>
        <%--<hr />--%>
            <%--<form action="${pageContext.request.contextPath}/login" id="loginForm"  class="form-horizontal"  method="post">--%>
                <%--<h1 style="text-align: center;color:#9acfea">登录</h1>--%>
                <%--<div class="form-group">--%>
                    <%--<label for="username" class="col-sm-4 control-label">用户名:</label>--%>
                    <%--<input type="text" class="form-control co" id="username" name="username" value="${username}" placeholder="Username">--%>
                <%--</div>--%>
                <%--<div class="form-group">--%>
                    <%--<label for="password" class="col-sm-4 control-label">密码:</label>--%>
                    <%--<input type="password" class="form-control" id="password" name="password" value="${password}" placeholder="Password">--%>
                <%--</div>--%>
                <%--<div class="form-group">--%>
                    <%--<label for="checkCode">checkCode</label><br/>--%>
                    <%--<input type="text" class="form-control" style="width:100px;" name="checkCode" id="checkCode" placeholder="checkCode">--%>
                    <%--<img src="${pageContext.request.contextPath}/checkCode" id="checkImg" onclick="changeCheckNum()" style="margin-top:5px;width: 100px;height: 36px;">--%>
                <%--</div>--%>
                <%--<div class="checkbox">--%>
                    <%--<label>--%>
                        <%--<input type="checkbox" id="remember" name="remember">记住密码--%>
                    <%--</label>--%>
                <%--</div>--%>
                <%--<div class="checkbox">--%>
                    <%--<label>--%>
                        <%--<input type="checkbox" id="autoLogin" name="autoLogin">自动登录--%>
                    <%--</label>--%>
                <%--</div>--%>
                <%--<button type="submit" class="btn btn-success" style="margin-left: 10%">Submit</button>--%>
                <%--<span id="loginInfo" style="color:red">${loginInfo}</span>--%>
            <%--</form>--%>
    <%--</div>--%>
    <hr />
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
