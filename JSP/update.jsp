<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-03-31
  Time: 오후 6:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter" %>
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
    }
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
    </div>
</nav>

<div class="container">
    <div class="row">
        <form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                <tr>
                    <th colspan="2" style="background-color: #eeeeee; text-align: center">게시판 글 수정 양식</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input text="text" class="form-control", placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>"></td>
                </tr>
                <tr>
                    <td><textarea text="text" class="form-control", placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%=bbs.getBbsContent()%></textarea></td>
                </tr>
                </tbody>
                <input type="submit" class="btn btn-primary pull-right" value="글 수정">글 올리기</input>
            </table>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="lib/js/bootstrap.js"></script>
</body>
</html>


