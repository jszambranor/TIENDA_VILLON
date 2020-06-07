<?php 
	session_start();
	if($_SESSION['rol'] != 1 and $_SESSION['rol'] != 2)
	{
		header("location: ./");
	}
	include "../conexion.php";

	if(!empty($_POST))
	{
		if (empty($_POST['idproducto'])) {
			header("location: lista_producto.php");
			mysqli_close($conection);
		}
		$idproducto = $_POST['idproducto'];

		//$query_delete = mysqli_query($conection,"DELETE FROM usuario WHERE idusuario =$idusuario ");
		$query_delete = mysqli_query($conection,"UPDATE producto SET estatus = 0 WHERE codproducto = $idproducto ");
		mysqli_close($conection);
		if($query_delete){
			header("location: lista_producto.php");
		}else{
			echo "Error al eliminar";
		}

	}




	if(empty($_REQUEST['id']) )
	{
		header("location: lista_producto.php");
		mysqli_close($conection);
	}else{

		$idproducto = $_REQUEST['id'];

		$query = mysqli_query($conection,"SELECT * FROM producto 
												WHERE codproducto = $idproducto ");
		
		mysqli_close($conection);
		$result = mysqli_num_rows($query);

		if($result > 0){
			while ($data = mysqli_fetch_array($query)) {
				
				$descripcion = $data['descripcion'];
				
			}
		}else{
			header("location: lista_producto.php");
		}


	}


 ?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<?php include "includes/scripts.php"; ?>
	<title>Eliminar productos</title>
</head>
<body>
	<?php include "includes/header.php"; ?>
	<section id="container">
		<div class="data_delete">

			<i class="fas fa-user-times fa-7x" style="color: red"></i>
			<br>
			<h2>¿Está seguro de eliminar el siguiente producto?</h2>
			<p>Nombre del producto: <span><?php echo $descripcion; ?></span></p>

			<form method="post" action="">
				<input type="hidden" name="idproducto" value="<?php echo $idproducto; ?>">
				<a href="lista_producto.php" class="btn_cancel"><i class="fas fa-ban"></i> Cancelar</a>
				<button type="submit"  value="Eliminar" class="btn_ok"><i class="fas fa-trash"></i> Eliminar</button>
			</form>
		</div>


	</section>
	<?php include "includes/footer.php"; ?>
</body>
</html>