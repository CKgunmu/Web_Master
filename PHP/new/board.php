<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-sacle=1">
	<link rel="stylesheet" type="text/css" href="../lib/css/grid.css">
	<link rel="stylesheet" type="text/css" href="./CSS/index.css">
	<link rel="stylesheet" type="text/css" href="">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<body>
	<div class="container row">
		<div class="col-12 row" style="padding-top: 2.5%;">
			<div class="col-8 row" id="list">
				<ul>
					<li><a href="">Web</a></li>
					<li><a href="">Python</a></li>
					<li><a href="">Hacking</a></li>
					<li><a href="">Algorithm</a></li>
				</ul>
			</div>

			<div class="col-4 row" id="right_list">
				<a href="login.html"><img src="./IMG/login.PNG" width="60px" height="60px"></a>
			</div>
		</div>

		<div class="col-12" style="margin-top: 3%; padding-left:20px;">
			<div class="col-12" style="margin-bottom: 1%;">
				<b style="font-size:30px">제목</b><br>
				<b style="font-size:20px">게시자</b>
			</div>

			<div class="col-12">
				ㄹㅇㄴㄹㄴㅁㄹㅇ나ㅣ론어ㅏ롱ㄴ러ㅏㅁㄴ올ㄴ어ㅏㅣ롬ㄴ어ㅏㅣ<br>
				ㄹㅇ너ㅏㄹㅇ노러ㅏㄴㅇ몲ㄴ어ㅏㅣ롱ㄴ러ㅏㅇㅁ노러ㅏㅇ노라ㅣ<br>
				머나이롬너ㅏ롬ㄴ어ㅏㅣㄻㄴㅇ<br>
			</div>
		</div>
	</div>
</body>
</html>

<!--
Query(document).ready(function(e) { /* 제이쿼리 문서 선언 */ 
$("#thumbImg a").click(function(){ /* 작은 이미지를 클릭 했을 때 동작 설정 */ 
var path = $(this).attr("href"); /* 변수 설정 : attr 속성을 이용해 href 첨부 */ $("#largeImg > img").attr({ src: path }); /* 큰 이미지 속성에 path 변수 첨부 */ 
return false; });

출처: https://webstoryboy.co.kr/1110 [@webstoryboy]
-!>