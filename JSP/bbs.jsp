<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-03-30
  Time: 오후 4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-widht", initial-scale="1">
    <link rel="stylesheet" href="lib/css/bootstrap.css">
</head>

<style>
    a, a:hover {
        color: #000000;
        text-decoration:none;
    }
</style>
<body>
<%
    String userID= null;
    if(session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    int pageNumber = 1;
    if(request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
        <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
            <thead>
                <tr>
                    <th style="background-color: #eeeeee; text-align: center">번호</th>
                    <th style="background-color: #eeeeee; text-align: center">제목</th>
                    <th style="background-color: #eeeeee; text-align: center">작성자</th>
                    <th style="background-color: #eeeeee; text-align: center">작성일</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BbsDAO bbsDAO = new BbsDAO();
                    ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                    for(int i=0; i< list.size(); i++) {
                %>
                <tr>
                    <td><%= list.get(i).getBbsID() %></td>
                    <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
                    <td><%= list.get(i).getUserID() %></td>
                    <td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시 " + list.get(i).getBbsDate().substring(14,16)+"분" %></td>
                </tr>

                <%  } %>
            </tbody>
        </table>
        <%  if(pageNumber != 1) {%>
              <a href="bbs.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arraw-left">이전</a>
        <%} if(bbsDAO.nextPage(pageNumber+1)) {%>
              <a href="bbs.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arraw-left">다음</a>
        <%}%>
        <a href="write.jsp" class="btn btn-primary pull-right">글 올리기</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="lib/js/bootstrap.js"></script>
</body>
</html>
