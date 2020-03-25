<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%--<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>--%>
        <%--<script type="text/javascript" src="js/jquery-3.3.1.js"></script>--%>
        <%--<script type="text/javascript" src="js/bootstrap.min.js"></script>--%>
        <style>

            .footer{
                width:310px;
                height: 30px;
                line-height: 30px;
                margin: auto;
            }
            .foot_two{
                width:100px;
                text-align: center;
            }
            .foot_a{
                text-decoration: none;
                color: black;
            }
            .foot_a:hover{
                color: orange;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid" style="background-color: lightgray;">
            <div class="row" style="padding:35px 0 20px 0;">
                <div style="height:100px;width:150px;margin:auto;">
                    <img src="${pageContext.request.contextPath}/img/moon.jpg" class="img-responsive" width="150px">
                </div>
            </div>
            <div class="row">
                <div class="footer">
                    <span class="foot_two"><a class="foot_a" href="javascript:void(0)">加入我们</a></span>
                    <span class="foot_two"><a class="foot_a" href="javascript:void(0)">软件工程</a></span>
                    <span class="foot_two"><a class="foot_a" href="javascript:void(0)">师资力量</a></span><br/>
                    <span class="foot_two"><a class="foot_a" href="javascript:void(0)">班委</a></span>
                    <span class="foot_two"><a class="foot_a" href="javascript:void(0)">社团干部</a></span>
                </div>
            </div>
            <div class="row" style="margin-bottom: 20px">
                <p style="color:deepskyblue; text-align: center;">@佛山_GGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小灰灰</p>
            </div>
        </div>
        <blockquote>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
            <footer>Someone famous in <cite title="Source Title">Source Title</cite></footer>
        </blockquote>
 	</body>
</html>