-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-01-2020 a las 16:07:55
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nuevaluz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anciano`
--

CREATE TABLE `anciano` (
  `id_anciano` int(10) NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8 NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_lider`
--

CREATE TABLE `cargo_lider` (
  `id_cargo_lider` int(10) NOT NULL,
  `nombre_cargo` varchar(100) NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diezmo`
--

CREATE TABLE `diezmo` (
  `id_diezmo` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `monto` int(10) NOT NULL,
  `tesorero_enc` varchar(150) CHARACTER SET utf8 NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(10) NOT NULL,
  `titulo` varchar(200) CHARACTER SET utf8 NOT NULL,
  `descripcion` text CHARACTER SET utf8 NOT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(255) CHARACTER SET utf8 NOT NULL,
  `id_iglesia` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_cargo`
--

CREATE TABLE `gestion_cargo` (
  `id_gestion_cargo` int(10) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iglesia`
--

CREATE TABLE `iglesia` (
  `id_iglesia` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` int(10) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `iglesia`
--

INSERT INTO `iglesia` (`id_iglesia`, `nombre`, `direccion`, `telefono`, `email`) VALUES
(1, 'Nueva Luz', 'Av. 6 de Agosto - Barrio Nuevo - Ironcollo - Quillacollo - Cochabamba', 4391304, 'noestacreada@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iglesia_bautizo`
--

CREATE TABLE `iglesia_bautizo` (
  `id_iglesia_bautizo` int(10) NOT NULL,
  `nombre_iglesia` varchar(50) CHARACTER SET utf8 NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iglesia_conversion`
--

CREATE TABLE `iglesia_conversion` (
  `id_iglesia_conversion` int(10) NOT NULL,
  `nombre_iglesia` varchar(50) CHARACTER SET utf8 NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembro`
--

CREATE TABLE `miembro` (
  `id_miembro` int(10) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8 NOT NULL,
  `telefono` int(10) NOT NULL,
  `estado_civil` varchar(50) CHARACTER SET utf8 NOT NULL,
  `fecha_nac` date NOT NULL,
  `fecha_conversion` date DEFAULT NULL,
  `fecha_bautizo` date NOT NULL,
  `nom_completo_pastor_bautizo` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ministerio`
--

CREATE TABLE `ministerio` (
  `id_ministerio` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion_corta` varchar(255) NOT NULL,
  `descrpcion` text NOT NULL,
  `lugar` varchar(200) NOT NULL,
  `nombre_responsable` varchar(155) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` int(10) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `id_iglesia` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ministerio_miembro`
--

CREATE TABLE `ministerio_miembro` (
  `id_ministerio_miembro` int(10) NOT NULL,
  `id_ministerio` int(10) NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pastor`
--

CREATE TABLE `pastor` (
  `id_pastor` int(10) NOT NULL,
  `biografia` text CHARACTER SET utf8 NOT NULL,
  `mensaje` text CHARACTER SET utf8 NOT NULL,
  `versiculo` text CHARACTER SET utf8 NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8 NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reunion_iglesia`
--

CREATE TABLE `reunion_iglesia` (
  `id_reunion_iglesia` int(10) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `dia` varchar(50) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `id_iglesia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reunion_iglesia`
--

INSERT INTO `reunion_iglesia` (`id_reunion_iglesia`, `titulo`, `dia`, `hora_inicio`, `hora_fin`, `id_iglesia`) VALUES
(1, 'Escuela Dominical', 'Domingo', '10:00:00', '12:00:00', 1),
(2, 'Noche de alabanzas', 'Domingo', '20:00:00', '22:00:00', 1),
(3, 'Noche de oración', 'Martes', '20:00:00', '10:00:00', 1),
(4, 'Estudio bíblico', 'Jueves', '20:00:00', '22:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reunion_ministerio`
--

CREATE TABLE `reunion_ministerio` (
  `id_reunion_ministerio` int(10) NOT NULL,
  `dia` varchar(50) CHARACTER SET utf8 NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `id_ministerio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anciano`
--
ALTER TABLE `anciano`
  ADD PRIMARY KEY (`id_anciano`),
  ADD KEY `id_miembro` (`id_miembro`);

--
-- Indices de la tabla `cargo_lider`
--
ALTER TABLE `cargo_lider`
  ADD PRIMARY KEY (`id_cargo_lider`),
  ADD KEY `id_miembro` (`id_miembro`);

--
-- Indices de la tabla `diezmo`
--
ALTER TABLE `diezmo`
  ADD PRIMARY KEY (`id_diezmo`),
  ADD KEY `id_miembro` (`id_miembro`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_iglesia` (`id_iglesia`);

--
-- Indices de la tabla `gestion_cargo`
--
ALTER TABLE `gestion_cargo`
  ADD PRIMARY KEY (`id_gestion_cargo`),
  ADD KEY `id_miembro` (`id_miembro`);

--
-- Indices de la tabla `iglesia`
--
ALTER TABLE `iglesia`
  ADD PRIMARY KEY (`id_iglesia`);

--
-- Indices de la tabla `iglesia_bautizo`
--
ALTER TABLE `iglesia_bautizo`
  ADD PRIMARY KEY (`id_iglesia_bautizo`),
  ADD KEY `id_miembro` (`id_miembro`);

--
-- Indices de la tabla `iglesia_conversion`
--
ALTER TABLE `iglesia_conversion`
  ADD PRIMARY KEY (`id_iglesia_conversion`),
  ADD KEY `id_miembro` (`id_miembro`);

--
-- Indices de la tabla `miembro`
--
ALTER TABLE `miembro`
  ADD PRIMARY KEY (`id_miembro`);

--
-- Indices de la tabla `ministerio`
--
ALTER TABLE `ministerio`
  ADD PRIMARY KEY (`id_ministerio`),
  ADD KEY `id_iglesia` (`id_iglesia`);

--
-- Indices de la tabla `ministerio_miembro`
--
ALTER TABLE `ministerio_miembro`
  ADD PRIMARY KEY (`id_ministerio_miembro`),
  ADD KEY `id_ministerio` (`id_ministerio`),
  ADD KEY `id_miembro` (`id_miembro`);

--
-- Indices de la tabla `pastor`
--
ALTER TABLE `pastor`
  ADD PRIMARY KEY (`id_pastor`),
  ADD KEY `id_miembro` (`id_miembro`);

--
-- Indices de la tabla `reunion_iglesia`
--
ALTER TABLE `reunion_iglesia`
  ADD PRIMARY KEY (`id_reunion_iglesia`),
  ADD KEY `id_iglesia` (`id_iglesia`);

--
-- Indices de la tabla `reunion_ministerio`
--
ALTER TABLE `reunion_ministerio`
  ADD PRIMARY KEY (`id_reunion_ministerio`),
  ADD KEY `id_ministerio` (`id_ministerio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anciano`
--
ALTER TABLE `anciano`
  MODIFY `id_anciano` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargo_lider`
--
ALTER TABLE `cargo_lider`
  MODIFY `id_cargo_lider` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diezmo`
--
ALTER TABLE `diezmo`
  MODIFY `id_diezmo` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gestion_cargo`
--
ALTER TABLE `gestion_cargo`
  MODIFY `id_gestion_cargo` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `iglesia`
--
ALTER TABLE `iglesia`
  MODIFY `id_iglesia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `iglesia_bautizo`
--
ALTER TABLE `iglesia_bautizo`
  MODIFY `id_iglesia_bautizo` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `iglesia_conversion`
--
ALTER TABLE `iglesia_conversion`
  MODIFY `id_iglesia_conversion` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `miembro`
--
ALTER TABLE `miembro`
  MODIFY `id_miembro` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ministerio`
--
ALTER TABLE `ministerio`
  MODIFY `id_ministerio` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ministerio_miembro`
--
ALTER TABLE `ministerio_miembro`
  MODIFY `id_ministerio_miembro` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pastor`
--
ALTER TABLE `pastor`
  MODIFY `id_pastor` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reunion_iglesia`
--
ALTER TABLE `reunion_iglesia`
  MODIFY `id_reunion_iglesia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reunion_ministerio`
--
ALTER TABLE `reunion_ministerio`
  MODIFY `id_reunion_ministerio` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anciano`
--
ALTER TABLE `anciano`
  ADD CONSTRAINT `anciano_ibfk_1` FOREIGN KEY (`id_miembro`) REFERENCES `miembro` (`id_miembro`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cargo_lider`
--
ALTER TABLE `cargo_lider`
  ADD CONSTRAINT `cargo_lider_ibfk_1` FOREIGN KEY (`id_miembro`) REFERENCES `miembro` (`id_miembro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `diezmo`
--
ALTER TABLE `diezmo`
  ADD CONSTRAINT `diezmo_ibfk_1` FOREIGN KEY (`id_miembro`) REFERENCES `miembro` (`id_miembro`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_iglesia`) REFERENCES `iglesia` (`id_iglesia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `gestion_cargo`
--
ALTER TABLE `gestion_cargo`
  ADD CONSTRAINT `gestion_cargo_ibfk_1` FOREIGN KEY (`id_miembro`) REFERENCES `miembro` (`id_miembro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `iglesia_bautizo`
--
ALTER TABLE `iglesia_bautizo`
  ADD CONSTRAINT `iglesia_bautizo_ibfk_1` FOREIGN KEY (`id_miembro`) REFERENCES `miembro` (`id_miembro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `iglesia_conversion`
--
ALTER TABLE `iglesia_conversion`
  ADD CONSTRAINT `iglesia_conversion_ibfk_1` FOREIGN KEY (`id_miembro`) REFERENCES `miembro` (`id_miembro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ministerio`
--
ALTER TABLE `ministerio`
  ADD CONSTRAINT `ministerio_ibfk_1` FOREIGN KEY (`id_iglesia`) REFERENCES `iglesia` (`id_iglesia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ministerio_miembro`
--
ALTER TABLE `ministerio_miembro`
  ADD CONSTRAINT `ministerio_miembro_ibfk_1` FOREIGN KEY (`id_ministerio`) REFERENCES `ministerio` (`id_ministerio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ministerio_miembro_ibfk_2` FOREIGN KEY (`id_miembro`) REFERENCES `miembro` (`id_miembro`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pastor`
--
ALTER TABLE `pastor`
  ADD CONSTRAINT `pastor_ibfk_1` FOREIGN KEY (`id_miembro`) REFERENCES `miembro` (`id_miembro`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `reunion_iglesia`
--
ALTER TABLE `reunion_iglesia`
  ADD CONSTRAINT `reunion_iglesia_ibfk_1` FOREIGN KEY (`id_iglesia`) REFERENCES `iglesia` (`id_iglesia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `reunion_ministerio`
--
ALTER TABLE `reunion_ministerio`
  ADD CONSTRAINT `reunion_ministerio_ibfk_1` FOREIGN KEY (`id_ministerio`) REFERENCES `ministerio` (`id_ministerio`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
