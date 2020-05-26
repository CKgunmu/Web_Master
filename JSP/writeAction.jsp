<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-03-31
  Time: 오전 9:23
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
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
    if(userID == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println(("alert('로그인을 하세요')"));
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
    } else {
        if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println(("alert('입력이 안 된 사항이 있습니다.')"));
            script.println("</script>");
        } else {
            BbsDAO bbsDAO = new BbsDAO();

            int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println(("alert('글 쓰기 실패')"));
                script.println("history.back()");
                script.println("</script>");
            } else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'bbs.jsp'");
                script.println("</script>");
            }
        }
    }
%>
</body>
</html>

