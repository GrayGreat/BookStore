<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"  type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</head>
<body>

<div class="panel-group" >
	<div class="panel panel-success">
	  	<div class="panel-heading ">
	  	 	<a  data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
	  	 		<font size="4">QQ邮箱</font>
        	</a>
		</div>
		<div id="collapseOne" class="panel-collapse collapse">
			<div class="panel-body">
		  		<h4>地址:<a href="https://mail.qq.com/cgi-bin/loginpage">https://mail.qq.com/cgi-bin/loginpage</a></h4>
		 	</div>
		</div>
	</div>

	<div class="panel panel-danger">
		<div class="panel-heading">
		  	<a  href="#collapseTwo" data-toggle = "collapse" data-parent="#accordion">
		  		<font size="4" >网易163邮箱</font>
		   </a>
		 </div>
		<div id="collapseTwo" class="panel-collapse collapse">
			<div class="panel-body">
		  		<h4>地址:<a href="https://mail.163.com/">https://mail.163.com/</a></h4>
			
			</div>
		</div>
	</div>
		
	<div class="panel panel-info">
  		<div class="panel-heading">
  			<a  href="#collapseThree" data-toggle="collapse" data-parent="#accordion">
  				<font size="4" >网易126邮箱</font>
        	</a>
  		</div>
  		<div id="collapseThree" class="panel-collapse collapse">
			<div class="panel-body" >
			  	<h4>地址:<a href="https://mail.126.com/">https://mail.126.com/</a></h4>
	  		</div>
  		</div>
	</div>

</div>
</body>
</html>