<?
require_once("DB_connect.php");
$cate = $_GET[cate];
$no = $_GET[no];

if($user === $cookie) {
	$query = "DELETE FROM board where no='$no'";
	mysqli_query($conn,$query);
	header("Location: ./". $cate .".php");
}


?>