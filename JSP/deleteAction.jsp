<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-03-31
  Time: 오후 7:04
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-03-31
  Time: 오후 6:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String userID= null;
    if(session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }

    if(userID == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println(("alert('로그인을 하세요')"));
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
    }

    int bbsID = 0;
    if(request.getParameter("bbsID") != null) {
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }

    if(bbsID == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println(("alert('유효하지 않는 글')"));
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");
    }
    Bbs bbs = new BbsDAO().getBbs(bbsID);
    if(!userID.equals(bbs.getUserID())) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println(("alert('권한이 없습니다.')"));
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");
    } else {
        BbsDAO bbsDAO = new BbsDAO();
        int result = bbsDAO.delete(bbsID);
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
%>
</body>
</html>


