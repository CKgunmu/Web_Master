<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-03-31
  Time: 오전 6:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    session.invalidate();
%>
<script>
    location.href('main.jsp');
</script>
</body>
</html>
