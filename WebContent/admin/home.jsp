<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>后台管理页面</title>
    </head>
    
    <frameset rows="10%,*,10%" frameborder="10" border="1" >
    <frame src="${pageContext.request.contextPath}/admin/header.jsp" scrolling="NO" >
    <frameset cols="200,*">
        <frame src="${pageContext.request.contextPath}/admin/left.jsp">
        <frame src="${pageContext.request.contextPath}/admin/welcome.jsp" name="content">
    </frameset>
    <frame src="${pageContext.request.contextPath}/admin/footer.jsp" name="footer" scrolling="NO">
    </frameset>
    
    
    
</html>