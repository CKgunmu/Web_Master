<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-03-31
  Time: 오전 8:45
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <form method="post" action="writeAction.jsp">
        <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
            <thead>
            <tr>
                <th colspan="2" style="background-color: #eeeeee; text-align: center">게시판 글쓰기 양식</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input text="text" class="form-control", placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
                </tr>
                <tr>
                    <td><textarea text="text" class="form-control", placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
                </tr>
            </tbody>
            <input type="submit" class="btn btn-primary pull-right" value="write">글 올리기</input>
        </table>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="lib/js/bootstrap.js"></script>
</body>
</html>

