<?php
$host = '3.14.82.157';
$user = 'villon';
$passwoord = '#passwordVILLON593';
$db = 'bazar';

$conection = @mysqli_connect($host,$user,$passwoord,$db);



if(!$conection){
	echo "error";
}
?>
