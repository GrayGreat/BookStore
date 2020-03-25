<%--
  Created by IntelliJ IDEA.
  User: Not Today
  Date: 2019/8/15
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
//        request.getRequestDispatcher("/index").forward(request, response);
        response.sendRedirect(request.getContextPath()+"/index");
    %>


</body>
</html>
