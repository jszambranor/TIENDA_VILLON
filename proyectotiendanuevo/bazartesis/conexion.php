<?php
$host = 'localhost';
$user = 'root';
$passwoord = '';
$db = 'bazar';
$conection = @mysqli_connect($host,$user,$passwoord,$db);



if(!$conection){
	echo "error";
}
?>