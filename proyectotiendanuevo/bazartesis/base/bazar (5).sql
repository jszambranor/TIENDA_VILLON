-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2020 a las 20:14:51
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bazar`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_precio_producto` (`n_cantidad` INT, `n_precio` DECIMAL(10,2), `codigo` INT)  BEGIN
    	DECLARE nueva_existencia int;
        DECLARE nuevo_total  decimal(10,2);
        DECLARE nuevo_precio decimal(10,2);
        
        DECLARE cant_actual int;
        DECLARE pre_actual decimal(10,2);
        
        DECLARE actual_existencia int;
        DECLARE actual_precio decimal(10,2);
                
        SELECT precio,existencia INTO actual_precio,actual_existencia FROM producto WHERE codproducto = codigo;
        SET nueva_existencia = actual_existencia + n_cantidad;
        SET nuevo_total = (actual_existencia * actual_precio) + (n_cantidad * n_precio);
        SET nuevo_precio = nuevo_total / nueva_existencia;
        
        UPDATE producto SET existencia = nueva_existencia, precio = nuevo_precio WHERE codproducto = codigo;
        
        SELECT nueva_existencia,nuevo_precio;
        
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dataDashboard` ()  BEGIN
    
    	DECLARE usuarios int;
        DECLARE clientes int;
        DECLARE proveedores int;
        DECLARE productos int;
       
        
        SELECT COUNT(*) INTO usuarios from usuario WHERE estatus != 10;
        SELECT COUNT(*) INTO clientes from cliente WHERE estatus != 10;
        SELECT COUNT(*) INTO proveedores from proveedor WHERE estatus != 10;
        SELECT COUNT(*) INTO productos from producto WHERE estatus != 10;
       
       SELECT usuarios,clientes,proveedores,productos;
       
        END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nit` int(11) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `dateadd` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nit`, `nombre`, `telefono`, `direccion`, `dateadd`, `usuario_id`, `estatus`) VALUES
(1, 0, 'Diego Villon', 2840469, '36 y chambers', '2020-01-17 00:23:51', 1, 0),
(2, 2840, 'federico villon', 2447177, 'vacgalindo', '2020-01-17 00:28:25', 1, 1),
(3, 25, 'federico villon', 2447177, 'vacgalindo', '2020-01-17 00:34:39', 1, 0),
(4, 0, 'diego', 2584695, '36 y chambers', '2020-01-17 00:34:56', 1, 1),
(5, 0, 'diego', 2584695, '36 y chambers', '2020-01-17 00:39:04', 1, 0),
(6, 10, 'firu', 644152258, 'San AndrÃ©s   64', '2020-01-17 00:48:15', 1, 1),
(7, 56, 'ged', 2840, 'dfdf', '2020-01-17 02:29:22', 7, 0),
(8, 0, 'firu', 25468, 'San AndrÃ©s   64', '2020-01-17 07:10:06', 1, 0),
(9, 456, 'junaito', 245678945, '36 y chambers', '2020-04-03 14:32:45', 1, 1),
(10, 9789, 'abue', 2840469, '36 y chambers', '2020-04-06 14:31:07', 1, 1),
(11, 9503469, 'ade', 2840469, 'kkyhashchd', '2020-04-06 14:51:31', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `correlativo` int(11) NOT NULL,
  `codproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `preciototal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `correlativo` int(11) NOT NULL,
  `codproducto` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `usuario_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entradas`
--

INSERT INTO `entradas` (`correlativo`, `codproducto`, `fecha`, `cantidad`, `precio`, `usuario_id`) VALUES
(1, 1, '2020-01-17 16:08:02', 150, '110.00', 1),
(2, 2, '2020-01-17 16:12:39', 100, '1500.00', 1),
(3, 3, '2020-01-20 01:12:46', 0, '2000.00', 1),
(4, 4, '2020-01-20 01:17:14', 0, '2000.00', 1),
(5, 5, '2020-01-20 01:18:39', 0, '80.00', 1),
(6, 6, '2020-01-20 01:19:16', 100, '80.00', 1),
(7, 7, '2020-01-20 01:24:04', 100, '100.00', 1),
(8, 8, '2020-01-20 10:02:27', 80, '100.00', 1),
(9, 9, '2020-01-20 10:17:49', 50, '200.00', 1),
(10, 10, '2020-03-24 15:59:13', 2, '1.00', 1),
(11, 11, '2020-04-01 18:33:12', 25, '25.00', 1),
(12, 12, '2020-04-01 18:33:42', 456, '4.00', 1),
(13, 13, '2020-04-05 18:34:46', 52, '52.00', 1),
(14, 14, '2020-04-05 18:35:08', 25, '25.00', 1),
(15, 15, '2020-04-06 14:52:46', 456, '25.00', 1),
(16, 16, '2020-04-10 11:11:47', 26, '50.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codproducto` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `proveedor` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1,
  `foto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codproducto`, `descripcion`, `proveedor`, `precio`, `existencia`, `date_add`, `usuario_id`, `estatus`, `foto`) VALUES
(1, 'MOUSE', 13, '110.00', 150, '2020-01-17 16:08:02', 1, 0, 'mouse.jpg'),
(2, 'monitor', 14, '1500.00', 100, '2020-01-17 16:12:39', 1, 0, 'monitor.jpg'),
(3, 'almohada', 15, '2000.00', 0, '2020-01-20 01:12:46', 1, 0, 'img_095178dd5e8e444ab909d094133bbde4.jpg'),
(4, 'almohada', 15, '2000.00', 0, '2020-01-20 01:17:14', 1, 1, 'img_d05e2fd04fa4771186fafc21aed6fb51.jpg'),
(5, 'planvha', 13, '80.00', 0, '2020-01-20 01:18:39', 1, 1, 'img_ec3517375626d2538e7db62c2534e241.jpg'),
(6, 'planvha', 13, '80.00', 100, '2020-01-20 01:19:16', 1, 1, 'img_05115cc27e991151ce64ca8583f91ef4.jpg'),
(7, 'fesdr', 17, '100.00', 100, '2020-01-20 01:24:04', 1, 1, 'img_producto.png'),
(8, 'almohada', 15, '100.00', 80, '2020-01-20 10:02:27', 1, 1, 'img_38cf1d9833b87c036f94968c9d17c183.jpg'),
(9, 'Plancha', 15, '10.00', 50, '2020-01-20 10:17:49', 1, 1, 'img_producto.png'),
(10, 'gatitos', 17, '1.00', 2, '2020-03-24 15:59:13', 1, 1, 'img_dbc48fb5f2b54b55f91e581922f7dcf2.jpg'),
(11, 'almohada', 13, '25.00', 25, '2020-04-01 18:33:12', 1, 1, 'img_producto.png'),
(12, 'planvha', 13, '4.00', 456, '2020-04-01 18:33:42', 1, 1, 'img_producto.png'),
(13, '25', 15, '52.00', 52, '2020-04-05 18:34:46', 1, 1, 'img_producto.png'),
(14, 'cajita', 18, '25.00', 28, '2020-04-05 18:35:08', 1, 1, 'img_producto.png'),
(15, 'ajedrees', 17, '25.00', 459, '2020-04-06 14:52:46', 1, 1, 'img_producto.png'),
(16, 'mini', 17, '50.00', 26, '2020-04-10 11:11:47', 1, 1, 'img_producto.png');

--
-- Disparadores `producto`
--
DELIMITER $$
CREATE TRIGGER `entradas_A_I` AFTER INSERT ON `producto` FOR EACH ROW BEGIN
    	INSERT INTO entradas(codproducto,cantidad,precio,usuario_id)
      VALUES(new.codproducto,new.existencia,new.precio,new.usuario_id);
      END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `codproveedor` int(11) NOT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` bigint(11) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`codproveedor`, `proveedor`, `contacto`, `telefono`, `direccion`, `date_add`, `usuario_id`, `estatus`) VALUES
(12, 'vic', 'claudia estrada', 56, 'San AndrÃ©s   64', '2020-01-17 12:44:47', 1, 0),
(13, 'rec', 'stra', 722862514, 'Carretera CÃ¡diz-MÃ¡laga 25', '2020-01-17 13:05:00', 1, 1),
(14, 'stee', 'steeven', 4443, '2344', '2020-01-17 13:05:15', 1, 0),
(15, 'min', 'mini', 2840, '3456', '2020-01-17 13:05:47', 1, 1),
(16, 'firu', 'fityr', 344567, 'chamder dad', '2020-01-17 13:06:04', 1, 0),
(17, 'firu', 'fityr', 344567, 'chamder dad', '2020-01-17 13:13:34', 1, 1),
(18, 'resident', 'claudia estrada', 2840469, '36 y chambers', '2020-04-01 20:12:14', 1, 1),
(19, 'juanitobendeta', '2840469', 2840469, '21y cham,ner', '2020-04-06 14:52:05', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `rol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Supervisor'),
(3, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `usuario` varchar(15) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1,
  `foto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`, `rol`, `estatus`, `foto`) VALUES
(1, 'steeven', 'steevenfe@yopmail.com', '1234', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, NULL),
(7, 'diego', 'diego@yopmail.com', '2840', 'a78482ce76496fcf49085f2190e675b4', 2, 0, NULL),
(8, 'federico', 'fede@yopmail.com', '2444', '7fd804295ef7f6a2822bf4c61f9dc4a8', 3, 1, NULL),
(9, 'fanny', 'fanny@hotmail.com', '66', '8e296a067a37563370ded05f5a3bf3ec', 2, 0, NULL),
(10, 'dioselinamini', 'mininuda@yopmail.com', 'dioselina26', '4e732ced3463d06de0ca9a15b6153677', 1, 0, NULL),
(11, 'gaturro', 'steevenvillon12@hotmail.com', '123456', 'e10adc3949ba59abbe56e057f20f883e', 1, 0, NULL),
(12, 'mininudita', 'g@yopmail.com', 'g', '202cb962ac59075b964b07152d234b70', 3, 1, NULL),
(13, 'h', 'h@yopmail.com', 'h', '81dc9bdb52d04dc20036dbd8313ed055', 2, 1, NULL),
(14, 'y', 'y@yopmail.com', 'y', '81dc9bdb52d04dc20036dbd8313ed055', 3, 1, NULL),
(15, 'r', 'r@yopmail.com', 'r', '81dc9bdb52d04dc20036dbd8313ed055', 3, 1, NULL),
(16, 'q', 'q@yopmail.com', 'q', '81dc9bdb52d04dc20036dbd8313ed055', 3, 1, NULL),
(17, 'w', 'w@yopmail.com', 'w', '81dc9bdb52d04dc20036dbd8313ed055', 1, 1, NULL),
(18, 't', 't@yopmail.com', 't', '81dc9bdb52d04dc20036dbd8313ed055', 3, 1, NULL),
(19, 'u', 'u@yopmail.com', 'u', '81dc9bdb52d04dc20036dbd8313ed055', 3, 1, NULL),
(20, 'o', 'o@yopmail.com', 'o', '81dc9bdb52d04dc20036dbd8313ed055', 3, 1, NULL),
(21, 'abue2345', 'abue2840469@yopmail.com', '1234567891', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, NULL),
(22, 'hombredenegocios', 'hombre@yopmail.com', 'hombre', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, NULL),
(23, 'macho', 'men@yopmail.com', 'machomen', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, NULL),
(24, 'fanny', 'dd@yopmail.com', 'fanny', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, NULL),
(25, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(26, 'diego', 'mini@yopmail.com', '12345678', '81dc9bdb52d04dc20036dbd8313ed055', 1, 1, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`correlativo`),
  ADD KEY `codproducto` (`codproducto`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`correlativo`),
  ADD KEY `codproducto` (`codproducto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codproducto`),
  ADD KEY `proveedor` (`proveedor`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`codproveedor`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `correlativo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `correlativo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `codproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
