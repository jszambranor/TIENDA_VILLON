<?php 
	session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<?php include "includes/scripts.php";?>
	<title>Sisteme Ventas</title>
</head>
<body>
	<?php 

		include "includes/header.php";
		include "../conexion.php";

		$query_dash		= mysqli_query($conection,"CALL dataDashboard();");
		$result_dash = mysqli_num_rows($query_dash);
		if($result_dash > 0){
			$data_dash  = mysqli_fetch_assoc($query_dash);
			mysqli_close($conection);
		}

	?>
	<section id="container">
		<div class="divContainer">
			<div>
				<h1 class="titlePanelControl">Panel</h1>
			</div>
			<div class="dashboard">
				<?php 
					if ($_SESSION['rol'] == 1 || $_SESSION['rol'] == 2)
					 {
				?>
				<a href="lista_usuarios.php">
					<i class="fas fa-users"></i>
					<p>
						<strong>Usuarios</strong>
						<!--<span><?= $data_dash['usuarios']; ?></span>-->
					</p>
				</a>
				<?php 
					}
				?>
				<a href="lista_clientes.php">
					<i class="fas fa-user"></i>
					<p>
						<strong>Clientes</strong>
						<!--<span><?= $data_dash['clientes']; ?></span>-->
					</p>
				</a>
				<?php 
					if ($_SESSION['rol'] == 1 || $_SESSION['rol'] == 2)
					 {
				?>
				<a href="lista_proveedor.php">
					<i class="fas fa-building"></i>
					<p>
						<strong>Proveedor</strong>
						<!--<span><?= $data_dash['proveedores']; ?></span>-->
					</p>
				</a>
				<?php 
					}
				?>
				<a href="lista_producto.php">
					<i class="fas fa-cubes"></i>
					<p>
						<strong>Productos</strong>
						<!--<span><?= $data_dash['productos']; ?></span>-->
					</p>
				</a>
			</div>
		</div>
		<div class="divInfoSistema">
			<div>
				<h1 class="titlePanelControl">Usuario</h1>
			</div>
			<div class="containerPerfil">
				<div class="containerDataUser">
					<div class="logoUser">
						<!--<img src="img/logouser.png">-->
					</div>
					<div class="divDataUser">
						<h4>Informacion personal</h4>
						
						<div>
							<label>Nombre:</label> <span><?=$_SESSION['nombre']; ?></span>
						</div>
						<div>
							<label>Correo:</label> <span><?=$_SESSION['email']; ?></span>
						</div>
						<h4>Datos Usuario</h4>
						<div>
							<label>Rol:</label> <span><?=$_SESSION['rol_name']; ?></span>
						</div>
						<div>
							<label>Usuario:</label> <span><?=$_SESSION['user']; ?></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


<?php include "includes/footer.php";?>
</body>
</html>