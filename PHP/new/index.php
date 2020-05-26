<?include 'DB_connect.php'; ?>
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

<script type="text/javascript">
 function toggleImg1() { document.getElementById("main-img").src = "./IMG/1.jpg"; }
 function toggleImg2() { document.getElementById("main-img").src = "./IMG/2.jpg"; }
 function toggleImg3() { document.getElementById("main-img").src = "./IMG/3.jpg"; }
 function toggleImg4() { document.getElementById("main-img").src = "./IMG/4.jpg"; }
</script>

<body>
	<div class="container row">
		<div class="col-12 row" style="padding-top: 2.5%;">
			<div class="col-8 row" id="list">
				<ul>
					<li><a href="index.php?">Main</a></li>
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

		<div class="col-12" style="margin-top: 3%">
			<div class="col-5" id="button-group">
				<button onclick="toggleImg1()">Web</button>
				<button onclick="toggleImg2()">Python</button>
			 	<button onclick="toggleImg3()">Hacking</button>
				<button onclick="toggleImg4()">Algorithm</button>
			</div> 
			<img src="1.JPG" id="main-img">
		</div>
	</div>
</body>
</html>
