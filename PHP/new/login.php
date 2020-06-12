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
                <h3>Login</h3>
                <form action="./login.php" method="POST">
                    <div class="form-group">
                        <input type="text" name="user" class="form-control" placeholder="Your id *" value="" />
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="Your Password *" value="" />
                    </div>
                    <div class="form-group">
                        <input type="submit" name="login" class="btnSubmit" value="Login"/>
                    </div>
                    <div class="form-group">
                        <a href="register.php" class="ForgetPwd">new member?</a>
                    </div>
                </form>

                <?php
					//if($_GET['user'] == NULL || $_GET['password'] == NULL) exit;
					
					$user = $_POST['user'];
					$pass = $_POST['password'];
					$check = $_POST['login'];


					if($check != null) {
						/*
						$user = mysqli_real_escape_string($user);
						$user = htmlspecialchars($user);

						$pass = mysqli_real_escape_string($pass);
						$pass = htmlspecialchars($pass);
						*/
						$query = "SELECT name, password FROM users where name='$user' and password='$pass'";
						$sql = mysqli_query($conn, $query);
						$row = mysqli_num_rows($sql);
						
						if($row > 0) {
							setcookie('user_name',$user,time()+(86400*30),'/');
							echo "<script>alert('환영합니다.');history.back();</script>";
							header('Location: ./index.php');
						} else {
							echo "<script>alert('아이디 또는 패스워드가 잘못되었습니다.');history.back();</script>";
							exit;
						}
					} 
				?>
            </div>
		</div>
	</div>
</body>
</html>
