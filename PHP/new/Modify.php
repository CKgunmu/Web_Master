<?
	require_once("DB_connect.php");
?>

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
	$no = $_GET[no];
	$query = "SELECT * FROM board where no='$no'";
	$result = mysqli_query($conn, $query);
	$row = mysqli_fetch_array($result);
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
						echo "<div class='col-12'><a>".$_COOKIE['user_name']."님 환영합니다 </a></div>";
						echo "<div class='col-12'><a href=./logout.php>로그아웃<a></div>";
						
					} else {
						echo "<a href='login.php'><img src='./IMG/login.PNG' width='60px' height='60px'></a>";
					}
				?>
			</div>
		</div>

		<div class="col-12" style="margin-top: 3%; padding-left:20px;">
			<div class="col-12" style="margin-bottom: 1%;">
				<b style="font-size:30px">글수정</b> 
				<b style="font-size: 15px; float: right;"></b>
			</div>
			
			<form action="Modify.php" method="POST">
				<div class="col-12 login-form-1">
                    <div class="category">
                        <input type="text" name="user" class="form-control" placeholder="Your id" value=<?echo $_COOKIE['user_name'];?> />
                    </div>
					
					<div class="category">
						<input type="text" name="title" class="form-control" placeholder="text title *" value=<?echo $row['title']?> />
					</div>

					<div class="category">
						 <select name="subject">
						  <option value="web">WEB</option>
						  <option value="Algorithm">Algorithm</option>
						  <option value="python">Python</option>
						  <option value="Hacking">Hacking</option>
						</select> 
					</div>

                    <textarea class="category" name="content" rows="10" cols="30" style="width:800px; height:350px;"> <?echo $row['texts']?></textarea>
					
                    <div id="button">
                        <input type="submit" name="login" class="btnSubmit" value="Login"/>
                    </div>
                    <input type="hidden" name="no" value=<?echo $no?>>
                </div>

                <?	
               		$user = $_POST[user];
                	$title = $_POST[title];
                	$cate = $_POST[subject];
                	$text = $_POST[content];
                	$login = $_POST[login];
                	$login_check = $_COOKIE['user_name'];
                	$no = $_POST[no];

                	if(isset($login) != NULL) {
                		if(isset($user) and isset($title) and isset($cate) and isset($text)) {
                			$query = "SELECT name FROM users where name='$login_check'";
                			$sql = mysqli_query($conn, $query);
                			$check_data = mysqli_num_rows($sql);

                			if($check_data) {
	                			$sql = "UPDATE board SET user='$user', title='$title', texts='$text', category='$cate' where no='$no'";
	                			mysqli_query($conn, $sql);
	                			echo "<script>alert('글이 수정되었습니다.');</script>";
	                			header('Location: ./'. $cate .'.php');
	                		} else {
								echo "빈칸을 확인해 주세요";
							}
	                	} else {
	                		echo "<script>alert('잘못된 사용자입니다.');</script>";
	                	}
					}

                ?>
            </form>
		</div>
	</div>
</body>
</html>
