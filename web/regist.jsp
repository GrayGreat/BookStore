<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/13
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="header.jsp"></jsp:include>
    <title>会员注册</title>
    <%--<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>--%>
    <%--<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script>

        //自定义校验规则
       $.validator.addMethod(
            "isExist",
            function(value,element,params){
                //value是校验组件的value值
                // element是校验组件的节点对象
                //params是校验规则的参数
                var flag;
                $.ajax({
                    async: false,
                    url:"${pageContext.request.contextPath}/checkUsername",
                    data:{
                        "username":value
                    },
                    dataType:"text",
                    type:"POST",
                    success:function(data){
                        // flag=data.isExist;
                        flag=data;
                        // if(data=="1"){
                        //     $("#usernameTips").html("用户名可以使用");
                        //     $("#usernameTips").css("color","green");
                        // }else{
                        //     $("#usernameTips").html("用户名已经存在,不可用");
                        //     $("#usernameTips").css("color","red");
                        // }
                    }

                })
                if(flag=="1"){
                    return true;
                }else{
                    return false;
                }
            }
        )

        //ajax验证用户名不重复
        <%--$(function(){--%>
           <%--$("#username").blur(function(){--%>
               <%--var $username=$("#username").val();--%>
               <%--var flag=false;--%>
               <%--if($username!=""){--%>
                   <%--$.ajax({--%>
                       <%--async: true,--%>
                       <%--url:"${pageContext.request.contextPath}/checkUsername",--%>
                       <%--data:{--%>
                           <%--"username":$username--%>
                       <%--},--%>
                       <%--dataType:"json",--%>
                       <%--type:"POST",--%>
                       <%--success:function(data){--%>
                           <%--// alert(data.isExist);--%>
                           <%--flag=data.isExist;--%>
                           <%--if(data.isExist){--%>
                               <%--//用户名存在,不可用--%>
                               <%--// alert("1");--%>
                               <%--$("#ajaxTips").html("用户名已存在");--%>
                               <%--$("#ajaxTips").css("color","red");--%>
                           <%--}else{--%>
                               <%--// alert("2");--%>
                               <%--//用户名不存在,可用--%>
                               <%--$("#ajaxTips").html("用户名可使用 ");--%>
                               <%--$("#ajaxTips").css("color","green");--%>
                           <%--}--%>
                       <%--}--%>
                   <%--});--%>

               <%--}else{--%>
                   <%--$("#ajaxTips").html("");--%>
               <%--}--%>
           <%--});--%>
        <%--});--%>



        $(function(){

            $("#registForm").validate({
                rules:{
                    "username":{
                        required:true,
                        isExist:true
                    },
                    "password":{
                        required:true,
                        rangelength:[6,18]
                    },
                    "repassword":{
                        required:true,
                        rangelength:[6,18],
                        equalTo:"#password"
                    },
                    "gender":{
                        required:true
                    },
                    "email":{
                        required:true,
                        email:true
                    },
                    "telephone":{
                        required:true
                    },
                    "introduce":{
                        required:true
                    },
                    "role":{
                        required:true
                    },
                    "checkCode":{
                        required:true
                    }

                },
                messages:{
                    "username":{
                        required:"用户名不能为空",
                        isExist:"用户名已存在"
                    },
                    "password":{
                        required:"密码不能为空",
                        rangelength:"密码长度必须6-18位"
                    },
                    "repassword":{
                        required:"确认密码不能为空",
                        rangelength:"密码长度必须6-18位",
                        equalTo:"确认密码必须要一致"
                    },
                    "gender":{
                        required:"请选择性别"
                    },
                    "email":{
                        required:"邮件不能为空",
                        email:"请输入正确的邮箱格式"
                    },
                    "telephone":{
                        required:"手机号不能为空"
                    },
                    "introduce":{
                        required:"自我介绍不能为空"
                    },
                    "role":{
                        required:"请选择职位"
                    },
                    "checkCode":{
                        required:"验证码不能为空"
                    }
                }



           });



        });
        function changeCheckNum(){
            var elementById = document.getElementById("checkImg");
            elementById.src="${pageContext.request.contextPath}/checkCode?time="+new Date().getTime()
        }
    </script>
    <style>
        .error{
            color: red;
            font-size: 10px;
            height: 34px;
            line-height: 34px;
        }

    </style>
</head>
<body>
    <script type="text/javascript">
        $(function(){

            $.ajax({
                async:true,
                url:"${pageContext.request.contextPath}/findAllCategory",
                dataType:"json",
                type:"POST",
                success:function(data){
                    var content="";
                    // alert(data);
                    for(var i=0;i<data.length;i++){
                        content+="<li><a href='${pageContext.request.contextPath}/productList?cid="+data[i].cid+"'>"+data[i].cname+"</a></li>";
                    }
                    content+="<li><a href='${pageContext.request.contextPath}/findAllCategoryAsSearch'>条件查询</a></li>";
                    $("#navlist").html(content);
                }

            });


        });
    </script>
    <h1 style="text-align: center;color: deepskyblue">会员注册</h1>
    <hr color="gray"/>
    <div class="container">
        <hr />
        <form class="form-horizontal" id="registForm" action="${pageContext.request.contextPath}/regist" method="post">
            <div class="form-group">
                <label for="username" class="col-sm-4 control-label">用户名</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Username">
                    <span id="ajaxTips"></span>
                </div>
                <div class="col-sm-4">
                    <label for="username" class="error" id="usernameTips"></label>
                </div>
            </div>

            <div class="form-group">
                <label for="password" class="col-sm-4 control-label">密码</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                </div>
                <div class="col-sm-4">
                    <label for="password" class="error" id="passwordTips"></label>
                </div>
            </div>

            <div class="form-group">
                <label for="repassword" class="col-sm-4 control-label">确认密码</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="repassword" name="repassword" placeholder="Repassword">
                </div>
                <div class="col-sm-4">
                    <label for="repassword" class="error" id="repasswordTips"></label>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label">性别</label>
                <div class="col-sm-4">
                    <div class="radio">
                        <label>
                            <input type="radio" name="gender" id="gender1" value="male">男
                        </label>
                        <label>
                            <input type="radio" name="gender" id="gender2" value="female">女
                        </label>
                    </div>
                </div>
                <div class="col-sm-4">
                    <label for="gender" class="error" id="genderTips"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-4 control-label">邮箱</label>
                <div class="col-sm-4">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                </div>
                <div class="col-sm-4">
                    <label for="email" class="error" id="emailTips"></label>
                </div>
            </div>

            <div class="form-group">
                <label for="telephone" class="col-sm-4 control-label">手机号:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="telephone" name="telephone" placeholder="Telephone">
                </div>
                <div class="col-sm-4">
                    <label for="telephone" class="error" id="telephoneTips"></label>
                </div>
            </div>

            <div class="form-group">
                <label for="introduce" class="col-sm-4 control-label">自我介绍:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="introduce" name="introduce" placeholder="Introduce">
                </div>
                <div class="col-sm-4">
                    <label for="introduce" class="error" id="introduceTips"></label>
                </div>
            </div>

            <div class="form-group">
                <label for="role" class="col-sm-4 control-label">职位:</label>
                <div class="col-sm-4">
                    <select id="role" class="form-control" name="role">
                        <option value="">--请选择--</option>
                        <option value="administrator">管理员</option>
                        <option value="general">普通用户</option>
                    </select>
                </div>
                <div class="col-sm-4">
                    <label for="role" class="error" id="roleTips"></label>
                </div>
            </div>

            <div class="form-group">
                <label for="checkCode" class="col-sm-4 control-label">checkCode</label>
                <div class="col-sm-1">
                    <input type="text" class="form-control" style="width:100px;" name="checkCode" id="checkCode" placeholder="checkCode">
                </div>
                <div class="col-sm-3">
                    <img src="${pageContext.request.contextPath}/checkCode" id="checkImg" onclick="changeCheckNum()" style="margin-left:10px;width: 100px;height: 34px;">
                </div>
                <div class="col-sm-4">
                    <label for="checkCode" class="error" id="checkCodeTips">${checkCodeInfo}</label>
                </div>
            </div>


            <%--<div class="form-group">--%>
                <%--<div class="col-sm-offset-5 col-sm-7">--%>
                    <%--<div class="checkbox">--%>
                        <%--<label>--%>
                            <%--<input type="checkbox"> Remember me--%>
                        <%--</label>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-7">
                    <button type="submit" class="btn btn-default">Sign in</button>
                </div>
            </div>
        </form>
    </div>
    <hr />
    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
