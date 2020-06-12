<?require_once("DB_connect.php");?>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-sacle=1">
	<link rel="stylesheet" type="text/css" href="../lib/css/grid.css">
	<link rel="stylesheet" type="text/css" href="./CSS/index.css">
	<link rel="stylesheet" type="text/css" href="./CSS/write.css">
	<link rel="stylesheet" type="text/css" href="">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<?
$user = $_GET[user];
$title = $_GET[ti];
$no = $_GET[no];
$cate = $_GET[cate];
$cookie = $_COOKIE[user_name];
?>


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
					if(!empty($_COOKIE['user_name'])) {
						echo "<a href='logout.php'>로그아웃</a>";
					} else {
						echo "<a href='login.php'><img src='./IMG/login.PNG' width='60px' height='60px'></a>";
					}
				?>
			</div>
		</div>

		<div class="col-12" style="margin-top: 3%; padding-left:20px;">
			<div class="col-12" style="margin-bottom: 1%;">
				<b style="font-size:30px">게시판</b> 
				<b style="font-size: 15px; float: right; margin-left: 15px;"><a href="delete.php?no=<? echo $no ?>&cate=<? echo $cate ?>" >글삭제</a></b>
				<b style="font-size: 15px; float: right;"><a href="Modify.php?no=<? echo $no ?>&cate=<? echo $cate ?>" >글수정</a></b>
			</div>

			<div>
                <?
              
            		if(isset($user) and isset($title) and isset($no)) {
            			$sql = "SELECT texts FROM board where no='$no' and title='$title' and user='$user'";
            			$result = mysqli_query($conn, $sql);
            			$row = mysqli_fetch_array($result);
            			$text = $row['texts'];
            			echo '<div class="col-12">';
            			echo "<div class='col-12'>". $user . "</div>";	
            			echo "<div class='col-12'>". $title . "</div>";	
            			echo "<div class='col-6'>". $row['texts'] . "</div>";	
            			echo '</div>';

            		} else {
						echo "선택하신 게시물은 없습니다.";
					}

					if ($del_check === ture) {
						if($user === $cookie) {
							$query = "DELETE FROM board where no='$no'";
							mysqli_query($conn,$query);
							header("Location: ./". $cate .".php");
						}
					}
            
                ?>
            </div>
 		</div>
	</div>
</body>
</html>
