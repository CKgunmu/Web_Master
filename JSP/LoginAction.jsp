<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-03-30
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
	String userID=null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	if(userID != null) {
		session.setAttribute("userID",user.getUserID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println(("alert('이미 로그인 되어 있음')"));
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}

	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserID(), user.getUserPassword());

	if(result == 1) {
		session.setAttribute("userID",user.getUserID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println(("alert('로그인 성공')"));
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	else if(result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println(("alert('비밀번호가 존재하지 않음')"));
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println(("alert('아이디가 없음')"));
		script.println("history.back()");
		script.println("</script>");
	}

%>
</body>
</html>

