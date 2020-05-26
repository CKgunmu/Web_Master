<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019-03-30
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-widht", initial-scale="1">
    <link rel="stylesheet" href="lib/css/bootstrap.css">
</head>
<body>
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
            	<li><a href="main.jsp">메인</a></li>
            	<li><a href="bbs.jsp">게시판</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
            	<li class="bropdown">
            		<a href="#" class="dropdown-toggle"
            					data-toggle="dropdown"
            					role="button" aria-haspopup="true"
            					aria-expanded="false">접속하기<span class="caret"></span></a>
            		<ul class="dropdown-menu">
            			<li class="active"><a href="Login.jsp">로그인</a></li>
            			<li ><a href="join.jsp">회원가입</a></li>
					</ul>
            	</li>
            </ul>
        </div>
    </nav>

    <div class="container">
    	<div class="col-lg-4"></div>
   		<div class="col-lg-4">
   			<div class="jumbotron" style="padding-top: 20px">
   				<form action="LoginAction.jsp" method="post"> 
   					<h3 style="text-align: center;">로그인 화면</h3>
   					<div class="form-group">
   						<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20">
   						<input type="password" class="form-control" placeholder="PassWords" name="userPassword" maxlength="20">
   						<input type="submit" class="btn btn-primary form-control" value="Login">
   					</div>
   				</form>
   			</div>
   		</div>
   		<div class="col-lg-4"></div>
    </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="lib/js/bootstrap.js"></script>
</body>
</html>
