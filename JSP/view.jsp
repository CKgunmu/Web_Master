<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-03-31
  Time: 오후 4:57
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-03-31
  Time: 오전 8:45
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-widht", initial-scale="1">
    <link rel="stylesheet" href="lib/css/bootstrap.css">
</head>
<body>
<%
    String userID= null;
    if(session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
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
%>
<nav class="navbar navbar-default">
    <div class="navbar-hedaer">
        <button type="button" class="navbar-toggle coolapsed"
                data-toggle="collapse" data-target="#bs-exmaple-navbar-collapse-1"
                aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="bbs.jsp">게시판</a></li>
            <li class="active"><a href="main.jsp">메인</a></li>
        </ul>
        <%
            if(userID == null) {
        %>

        <ul class="nav navbar-nav navbar-right">
            <li class="bropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown"
                   role="button" aria-haspopup="true"
                   aria-expanded="false">접속하기<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="Login.jsp">로그인</a></li>
                    <li><a href="join.jsp">회원가입</a></li>
                </ul>
            </li>
        </ul>
        <%} else {%>
        <ul class="nav navbar-nav navbar-right">
            <li class="bropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown"
                   role="button" aria-haspopup="true"
                   aria-expanded="false">회원관리<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="LogoutAction.jsp">로그아웃</a></li>
                </ul>
            </li>
        </ul>
        <%}%>
    </div>
</nav>

<div class="container">
    <div class="row">
        <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
            <thead>
                <tr>
                    <th colspan="3" style="background-color: #eeeeee; text-align: center">게시판 글 보기 양식</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="width:20%">글제목</td>
                    <td colspan="2"><%=bbs.getBbsTitle()%></td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td colspan="2"><%=bbs.getUserID()%></td>
                </tr>
                <tr>
                    <td>작성일자</td>
                    <td colspan="2"><%=bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시 " + bbs.getBbsDate().substring(14,16) + "분 "%></td>
                </tr>

                <tr>
                    <td>내용</td>
                    <td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt").replaceAll("\n","<br>")%></td>

                </tr>
            </tbody>
            <a href="bbs.jsp" class="btn btn-primary">목록</a>
            <%
                if(userID != null && userID.equals(bbs.getUserID())) {
            %>
                <a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
                <a href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
            <%}%>
        </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="lib/js/bootstrap.js"></script>
</body>
</html>

