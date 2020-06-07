<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Tienda</title>
    <meta charset="UTF-8">


    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">


    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    
  </head>
  <body>
  
  <div class="site-wrap">
    <?php include("./layouts/header.php"); ?> 

    <div class="site-section">
      <div class="container">

        <div class="row mb-5">
          <div class="col-md-9 order-2">

            <div class="row">
              <div class="col-md-12 mb-5">
                <div class="float-md-left mb-4"><h2 class="text-black h5">Productos</h2></div>
              </div>
            </div>
            <div class="row mb-5">
            <?php 
            include('./php/conexion.php');
            $resultado= $conexion ->query("select * from productos order by id DESC limit 9")or die($conexion ->error);
            while($fila=mysqli_fetch_array($resultado)){
            ?>
              <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                <div class="block-4 text-center border">
                  <figure class="block-4-image">
                    <a href="shop-single.php?id=<?php echo $fila['id'];?>">
                    <img src="images/<?php echo $fila['imagen'];?>" alt="<?php echo $fila['nombre'];?>" class="img-fluid"></a>
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="shop-single.php?id=<?php echo $fila['id'];?>"><?php echo $fila['nombre'];?></a></h3>
                    <p class="mb-0"><?php echo $fila['descripcion'];?></p>
                    <p class="text-primary font-weight-bold">$<?php echo $fila['precio'];?></p>
                  </div>
                </div>
              </div>
                    <?php } ?>


            </div>
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                  <ul>
                    <li><a href="#">&lt;</a></li>
                    <li class="active"><span>1</span></li>
                    <li><a href="">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&gt;</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <!--<div class="col-md-3 order-1 mb-5 mb-md-0"> 
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categorías</h3>
              <ul class="list-unstyled mb-0">
                <li class="mb-1"><a href="#" class="d-flex"><span>San Valentín</span> <span class="text-black ml-auto">(2,220)</span></a></li>
                <li class="mb-1"><a href="#" class="d-flex"><span>Cumpleaños</span> <span class="text-black ml-auto">(2,550)</span></a></li>
                <li class="mb-1"><a href="#" class="d-flex"><span>Aniversario</span> <span class="text-black ml-auto">(2,124)</span></a></li>
                <li class="mb-1"><a href="#" class="d-flex"><span>Matrimonio</span> <span class="text-black ml-auto">(2,124)</span></a></li>
                <li class="mb-1"><a href="#" class="d-flex"><span>Día del padre</span> <span class="text-black ml-auto">(2,124)</span></a></li>
                <li class="mb-1"><a href="#" class="d-flex"><span>Día de la madre</span> <span class="text-black ml-auto">(2,124)</span></a></li>
              </ul>
            </div>--> 

            <div class="border p-4 rounded mb-4">
              <div class="mb-4">
                  <p class="bg-danger text-white">POR FAVOR LEER</p>

                <h3 class="mb-3 h6 text-uppercase text-black d-block">CUALQUIER DETALLE SOLO ESTA DISPONIBLE PARA ENVÍO A LA CIUDAD DE GUAYAQUIL Y SUS ALREDEDORES / Envío 24-48 horas. Cualquier duda comunicarse a nuestro correo: bazarydetallesmym@gmail.com</h3>
                
                
              </div>

              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">
                Si algún artículo no está disponible a corto plazo, será reemplazado por uno equivalente o superior, gracias.</h3>
                
              </div>

            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-md-12">
            <div class="site-section site-blocks-2">
                <div class="row justify-content-center text-center mb-5">
                  <div class="col-md-7 site-section-heading pt-4">
                    <h2>MOMENTOS FELICES PARA QUIENES MAS AMAS</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
                    <a class="block-2-item" href="index2.php">
                      <figure class="image">
                        <img src="images/mujerdetalle.jpg" alt="" class="img-fluid">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Regalos para</span>
                        <h3>Mujeres</h3>
                      </div>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
                    <a class="block-2-item" href="index3.php">
                      <figure class="image">
                        <img src="images/niñosdetalle.jpg" alt="" class="img-fluid">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Regalos para</span>
                        <h3>Niños</h3>
                      </div>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
                    <a class="block-2-item" href="index4.php">
                      <figure class="image">
                        <img src="images/hombredetalle.jpg" alt="" class="img-fluid">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Regalos para</span>
                        <h3>Hombres</h3>
                      </div>
                    </a>
                  </div>
                </div>
              
            </div>
          </div>
        </div>
        
      </div>
    </div>
    <?php include("./layouts/header.php"); ?> 

    
  </div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
    
  </body>
</html>