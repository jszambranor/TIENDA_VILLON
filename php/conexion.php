<?php
$servidor="3.14.82.157";
$nombreBd="carrito";
$usuario="villon";
$pass="#passwordVILLON593";
$conexion= new mysqli($servidor,$usuario,$pass,$nombreBd);
if($conexion-> connect_error){
	die("No se pudo conectar");

}
?>