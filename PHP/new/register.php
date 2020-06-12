<?include 'DB_connect.php'; ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-sacle=1">
	<link rel="stylesheet" type="text/css" href="../lib/css/grid.css">
	<link rel="stylesheet" type="text/css" href="./CSS/index.css">
	<link rel="stylesheet" type="text/css" href="./CSS/login.css">
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
					if(!empty($_COOKIE['user_name'])) {
						echo "<a href='logout.php'>로그아웃</a>";
					} else {
						echo "<a href='login.php'><img src='./IMG/login.PNG' width='60px' height='60px'></a>";
					}
				?>
			</div>
		</div>

		<div class="col-12" style="margin-top: 3%">
			<div class="col-12 login-form-1">
                <h3>Resister</h3>
                <form action="./register.php" method="POST">
                    <div class="form-group">
                        <input type="text" name="name" class="form-control" placeholder="Your id *" value="" />
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="Your Password *" value="" />
                    </div>
                    <div class="form-group">
                        <input type="text" name="mail" class="form-control" placeholder="Your email *" value="" />
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btnSubmit" value="Login" name="Login"/>
                    </div>
                </form>
                <?
                	#if(!isset($_POST['name']) || !isset($_POST['password']) || !isset($_POST['mail'])) exit;

                	$name = $_POST[name];
                	$password = $_POST[password];
                	$mail = $_POST[mail];
                	$check = $_POST[Login];

                	if($check != null) {
                		$query = "SELECT * FROM users where name='$name'";
						$sql = mysqli_query($conn, $query);
						$row = mysqli_num_rows($sql);

						if($row < 1) {
							$query = "INSERT INTO users(name, password, email) VALUES('$name','$password','$mail')";
							$sql = mysqli_query($conn, $query);

							echo "<script>alert('계정이 생성되었습니다.')</script>";
							header('Location: ./login.php');
						} else {
							echo "The ID that already exists.";
						}
           			}
                ?>
            </div>
		</div>
	</div>
</body>
</html>

