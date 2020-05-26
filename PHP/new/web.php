<?require_once("DB_connect.php");?>
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
					<li><a href="index.php">Main</a></li>
					<li><a href="web.php">Web</a></li>
					<li><a href="python.php">Python</a></li>
					<li><a href="Hacking.php">Hacking</a></li>
					<li><a href="Algorithm.php">Algorithm</a></li>
				</ul>
			</div>

			<div class="col-4 row" id="right_list">
				<? 
					if(empty($_COOKIE['user_name'])) {
						echo "<li><a href='login.php'><img src='./IMG/login.PNG' width='60px' height='60px'></li>";
					} else {
						echo "<li><a href='./logout.php'>로그아웃</a></li>";
					}
				?>
			</div>
		</div>

		<div class="col-12" style="margin-top: 3%; padding-left:20px;">
			<div class="col-12" style="margin-bottom: 1%;">
				<b style="font-size:30px">Web 게시글</b> 
				<b style="font-size: 15px; float: right;"><a href="write.php">글쓰기</a></b>
			</div>

			<div class="col-12" style="text-align: center;">
				<div class="col-2">게시자</div>
				<div class="col-9">제목  </div>
				<div class="col-1">순서  </div>
				<?
					$sql = "SELECT * FROM board";
					$result = mysqli_query($conn, $sql);

					while ($row = mysqli_fetch_array($result)) {
						echo '<div class="col-12">';
						echo "<div class='col-2'>".$row['user']."</div>";
						echo "<div class='col-9'><a href='view.php?no=".$row['no']."&ti=".$row['title']."&user=".$row['user']."&cate=".$row['category']."'>".$row['title']."</a></div>";
						echo "<div class='col-1'>".$row['no']."</div>";
						echo '</div>';
					}
				?>
			</div>
		</div>
	</div>
</body>
</html>
