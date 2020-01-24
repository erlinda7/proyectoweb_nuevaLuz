-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-01-2020 a las 17:01:26
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
  `foto` varchar(255) NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `anciano`
--

INSERT INTO `anciano` (`id_anciano`, `foto`, `id_miembro`) VALUES
(1, 'img/anciano1.png', 5),
(2, 'img/anciano2.png', 6),
(3, 'img/anciano3.png', 7),
(4, 'img/anciano4.png', 8),
(5, 'img/anciano5.png', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_lider`
--

CREATE TABLE `cargo_lider` (
  `id_cargo_lider` int(10) NOT NULL,
  `nombre_cargo` varchar(100) NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo_lider`
--

INSERT INTO `cargo_lider` (`id_cargo_lider`, `nombre_cargo`, `id_miembro`) VALUES
(1, 'pastor', 1),
(2, 'pastor', 2),
(3, 'anciano', 5),
(4, 'anciano', 6),
(5, 'anciano', 7),
(6, 'anciano', 9),
(7, 'diacono', 10),
(8, 'diacono', 12),
(9, 'diacono', 13),
(10, 'diacono', 14),
(11, 'diacono', 15),
(12, 'diacono', 16),
(14, 'diaconiza', 17),
(15, 'diaconiza', 18),
(16, 'diaconiza', 19),
(17, 'diaconiza', 20),
(18, 'diaconiza', 21),
(19, 'diaconiza', 22),
(20, 'diaconiza', 23),
(21, 'diaconiza', 24),
(22, 'tesorero', 25),
(23, 'tesorero', 26),
(24, 'secretario', 27),
(25, 'superintendente', 28),
(26, 'superintendente', 29),
(28, 'superintendente', 31),
(29, 'superintendente', 30),
(31, 'maestro', 32),
(32, 'maestro', 33),
(33, 'maestro', 34),
(34, 'maestro', 35),
(35, 'maestro', 36),
(36, 'juvenil', 37),
(37, 'femenil', 38),
(38, 'anciano', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diezmo`
--

CREATE TABLE `diezmo` (
  `id_diezmo` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `monto` int(10) NOT NULL,
  `tesorero_enc` varchar(150) NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(10) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `lugar` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `id_iglesia` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id_evento`, `titulo`, `descripcion`, `lugar`, `fecha`, `imagen`, `id_iglesia`) VALUES
(1, 'CULTO ESPECIAL', 'Tendremos juegos - alabanza- predica - comida. no puedes faltar. \r\nSábado  partir de las 7:30 pm\r\n', 'Iglesia Nueva Luz', '2020-01-25', 'campamento.jpg', 1),
(2, 'CAMPAMENTO JUVENIL ', 'Campamento juvenil de la zonal Quillacollo con el Tema \"Dejando Huellas en el camino\".\r\nNo te lo pierdas 4 dias de bendición.', 'Ivirgarzama - Tropico de Cochabamba ', '2020-01-30', 'culto.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_cargo`
--

CREATE TABLE `gestion_cargo` (
  `id_gestion_cargo` int(10) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gestion_cargo`
--

INSERT INTO `gestion_cargo` (`id_gestion_cargo`, `fecha_inicio`, `fecha_fin`, `id_miembro`) VALUES
(1, '2020-01-01', '2020-12-31', 1),
(2, '2016-01-01', '2020-12-31', 2),
(3, '2020-01-01', '2020-12-31', 5),
(4, '2020-01-01', '2020-12-31', 6),
(5, '2020-01-01', '2020-12-31', 7),
(6, '2020-01-01', '2020-12-31', 8),
(7, '2020-01-01', '2020-12-31', 9),
(8, '2020-01-01', '2020-12-31', 10),
(9, '2020-01-01', '2020-12-31', 12),
(10, '2020-01-01', '2020-12-31', 13),
(11, '2020-01-01', '2020-12-31', 14),
(12, '2020-01-01', '2020-12-31', 15),
(13, '2020-01-01', '2020-12-31', 16),
(14, '2020-01-01', '2020-12-31', 17),
(15, '2020-01-01', '2020-12-31', 18),
(16, '2020-01-01', '2020-12-31', 19),
(17, '2020-01-01', '2020-12-31', 20),
(18, '2020-01-01', '2020-12-31', 21),
(19, '2020-01-01', '2020-12-31', 22),
(20, '2020-01-01', '2020-12-31', 23),
(21, '2020-01-01', '2020-12-31', 24),
(22, '2020-01-01', '2020-12-31', 25),
(23, '2020-01-01', '2020-12-31', 26),
(24, '2020-01-01', '2020-12-31', 27),
(25, '2020-01-01', '2020-12-31', 28),
(26, '2020-01-01', '2020-12-31', 29),
(27, '2020-01-01', '2020-12-31', 30),
(28, '2020-01-01', '2020-12-31', 31),
(29, '2020-01-01', '2020-12-31', 32),
(30, '2020-01-01', '2020-12-31', 33),
(31, '2020-01-01', '2020-12-31', 34),
(32, '2020-01-01', '2020-12-31', 35),
(33, '2020-01-01', '2020-12-31', 36),
(34, '2020-01-01', '2020-12-31', 37),
(35, '2020-01-01', '2020-12-31', 38);

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
  `nombre_iglesia` varchar(50) NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `iglesia_bautizo`
--

INSERT INTO `iglesia_bautizo` (`id_iglesia_bautizo`, `nombre_iglesia`, `id_miembro`) VALUES
(1, 'Libres', 1),
(2, 'Nueva Jerusalen UCE', 2),
(3, 'Bautista Kumara ', 5),
(4, 'Nueva Canaan', 33),
(5, 'Nueva Luz', 34),
(6, 'Nueva Luz', 37),
(7, 'Yoraq Kaqa', 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iglesia_conversion`
--

CREATE TABLE `iglesia_conversion` (
  `id_iglesia_conversion` int(10) NOT NULL,
  `nombre_iglesia` varchar(50) NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `iglesia_conversion`
--

INSERT INTO `iglesia_conversion` (`id_iglesia_conversion`, `nombre_iglesia`, `id_miembro`) VALUES
(1, 'Eben Ezer ', 1),
(2, 'Nueva Jerusalen UCE', 2),
(3, 'Baustista', 5),
(4, 'Nueva Canaan', 33),
(5, 'Nueva Luz', 34),
(6, 'Nueva Luz', 37),
(7, 'Nueva Canaan', 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembro`
--

CREATE TABLE `miembro` (
  `id_miembro` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `telefono` int(10) NOT NULL,
  `estado_civil` varchar(50) NOT NULL,
  `fecha_nac` date NOT NULL,
  `fecha_conversion` date DEFAULT NULL,
  `fecha_bautizo` date NOT NULL,
  `nom_completo_pastor_bautizo` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `miembro`
--

INSERT INTO `miembro` (`id_miembro`, `nombre`, `apellido_paterno`, `apellido_materno`, `telefono`, `estado_civil`, `fecha_nac`, `fecha_conversion`, `fecha_bautizo`, `nom_completo_pastor_bautizo`) VALUES
(1, 'Edgar', 'Jimenez ', 'Antezana', 78323149, 'casado', '1997-06-16', '1997-07-11', '0000-00-00', 'Lideres'),
(2, 'Feliciano', 'Mendoza ', 'Fabricano', 70396979, 'casado', '1984-04-12', '1994-06-12', '1996-09-30', 'Juan Cuellar'),
(5, 'Patricio', 'Quispe ', 'Colque', 68516412, 'casado', '1981-08-24', NULL, '0000-00-00', 'Agustin Cuti'),
(6, 'Gregorio', 'Villarroel', 'Villegas', 71766226, 'casado', '1970-01-06', '1984-06-06', '1986-06-00', 'Geronimo Ledezma'),
(7, 'Hector', 'Mamani', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(8, 'German', 'Cordova', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(9, 'Nestor ', 'Colque', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(10, 'Macario', 'Mamani', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(12, 'Felipe', 'Bautista', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(13, 'Grover', 'Valencia', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(14, 'Marcelo', 'Lopez', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(15, 'Eugenio', 'Duran', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(16, 'Adrian', 'Mamani', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(17, 'Epifania', 'Fernandez', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(18, 'Arminda', 'Beltran', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(19, 'Margarita', 'Fernandez', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(20, 'Julia', 'Quintana', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(21, 'Elza', 'Calle', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(22, 'Ortencia', 'Espinoza', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(23, 'Sabina', 'Espinoza', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(24, 'Delia', 'Colque', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(25, 'Cristobal', 'Quispe', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(26, 'Gabriela', 'Colque', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(27, 'Jamil', 'Quintana', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(28, 'Brayan', 'Colque', 'nulo', 0, 'soltero', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(29, 'Ruben', 'Rios', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(30, 'superintendente3', 'Mamani', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(31, 'superintendente4', 'nulo', 'nulo', 0, 'casado', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(32, 'Dario', 'Mamani', 'Mamani', 0, 'soltero', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(33, 'Martha', 'Mamani', 'Mamani', 63958774, 'soltera', '0000-05-15', '0000-12-25', '0000-00-00', 'Nueva Canaan'),
(34, 'Gladys', 'Mamani', 'Lopez', 63914553, 'soltero', '1998-06-21', '2011-09-00', '2013-12-25', 'Marcelino Camacho'),
(35, 'Erlinda', 'Chambi', 'Manzano', 76457459, 'soltero', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(36, 'Roxana', 'Fernandez', 'nulo', 0, 'soltero', '0000-00-00', NULL, '0000-00-00', 'nulo'),
(37, 'Oscar', 'Berrios', 'Luna', 68322275, 'casado', '1992-01-21', '2004-01-25', '2012-12-25', 'Marcelino Camacho\r\n'),
(38, 'Maria', 'Aguilar', 'Fernandez', 68597691, 'casado', '0000-06-22', '0000-09-23', '0000-09-23', 'Octavio Condori');

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

--
-- Volcado de datos para la tabla `ministerio`
--

INSERT INTO `ministerio` (`id_ministerio`, `nombre`, `descripcion_corta`, `descrpcion`, `lugar`, `nombre_responsable`, `email`, `telefono`, `foto`, `id_iglesia`) VALUES
(1, 'Femenil-Herederas del Rey', 'El 12 de agosto es el Día Internacional de la Juventud. La fecha fue proclamada', 'La juventud (del latín iuventus) es la edad que precede inmediatamente a la edad adulta1​ y se sitúa después de la infancia. La Organización Mundial de la Salud postula que la juventud comprende, en general, el rango de edad entre los 10 y los 29 años, aun cuando reconoce —por ejemplo— que puede haber «discrepancias entre la edad cronológica, la biológica y las etapas psicosociales del desarrollo», o también «grandes variaciones debidas a factores personales y ambientales».2​ Abarca la pubertad o adolescencia inicial (de 10 a 16 años), la adolescencia tardía (de 17 a 19 años) y la juventud plena (de 20 a 24 años).', 'Iglesia Nueva Luz', 'Maria Aguilar Fernandez', '@gmail.com', 68597691, 'img/fotoresponsable.jpg', 1),
(2, 'Juvenil- Mas que vencedores', 'El 12 de agosto es el Día Internacional de la Juventud. La fecha fue proclamada\r\n', 'La juventud (del latín iuventus) es la edad que precede inmediatamente a la edad adulta1​ y se sitúa después de la infancia. La Organización Mundial de la Salud postula que la juventud comprende, en general, el rango de edad entre los 10 y los 29 años, aun cuando reconoce —por ejemplo— que puede haber «discrepancias entre la edad cronológica, la biológica y las etapas psicosociales del desarrollo», o también «grandes variaciones debidas a factores personales y ambientales».2​ Abarca la pubertad o adolescencia inicial (de 10 a 16 años), la adolescencia tardía (de 17 a 19 años) y la juventud plena (de 20 a 24 años).', 'Iglesia Nueva Luz', 'Oscar Berrios Luna', '@gmail.com', 68322275, 'img/Oscar.png', 1),
(3, 'Prejuvenil - Emanuel', 'El 12 de agosto es el Día Internacional de la Juventud. La fecha fue proclamada el 17 ', 'La juventud (del latín iuventus) es la edad que precede inmediatamente a la edad adulta1​ y se sitúa después de la infancia. La Organización Mundial de la Salud postula que la juventud comprende, en general, el rango de edad entre los 10 y los 29 años, aun cuando reconoce —por ejemplo— que puede haber «discrepancias entre la edad cronológica, la biológica y las etapas psicosociales del desarrollo», o también «grandes variaciones debidas a factores personales y ambientales».2​ Abarca la pubertad o adolescencia inicial (de 10 a 16 años), la adolescencia tardía (de 17 a 19 años) y la juventud plena (de 20 a 24 años).', 'Iglesia Nueva Luz', 'Yhaser Quintana', '@gamil.com', 76493649, 'img/yhaser.png', 1),
(4, 'Escuela Dominical - Misioneros', 'El 12 de agosto es el Día Internacional de la Juventud. La fecha fue proclamada el 17 ', 'La juventud (del latín iuventus) es la edad que precede inmediatamente a la edad adulta1​ y se sitúa después de la infancia. La Organización Mundial de la Salud postula que la juventud comprende, en general, el rango de edad entre los 10 y los 29 años, aun cuando reconoce —por ejemplo— que puede haber «discrepancias entre la edad cronológica, la biológica y las etapas psicosociales del desarrollo», o también «grandes variaciones debidas a factores personales y ambientales».2​ Abarca la pubertad o adolescencia inicial (de 10 a 16 años), la adolescencia tardía (de 17 a 19 años) y la juventud plena (de 20 a 24 años).', 'Iglesia Nueva Luz', 'Martha Mamani Mamani', 'noestacreada@gmail.com', 63958774, 'img/matha.png', 1),
(5, 'Escuela Dominical - Evangelistas', 'El 12 de agosto es el Día Internacional de la Juventud. La fecha fue proclamada ', 'La juventud (del latín iuventus) es la edad que precede inmediatamente a la edad adulta1​ y se sitúa después de la infancia. La Organización Mundial de la Salud postula que la juventud comprende, en general, el rango de edad entre los 10 y los 29 años, aun cuando reconoce —por ejemplo— que puede haber «discrepancias entre la edad cronológica, la biológica y las etapas psicosociales del desarrollo», o también «grandes variaciones debidas a factores personales y ambientales».2​ Abarca la pubertad o adolescencia inicial (de 10 a 16 años), la adolescencia tardía (de 17 a 19 años) y la juventud plena (de 20 a 24 años).', 'Iglesia Nueva Luz', 'Gladys Mamani Lopez', '@gamil.com', 63914553, 'img/gladys.png', 1),
(6, 'Escuela Dominical - Tesoritos', 'El 12 de agosto es el Día Internacional de la Juventud. La fecha fue proclamada ', 'Para otros usos de este término, véase Juventud (desambiguación).\r\n\r\nDetalle del panel central de El jardín de las delicias, alegoría de la fuente de la juventud, pintura de Hieronymus Bosch —el Bosco—, 1504.\r\nLa juventud (del latín iuventus) es la edad que precede inmediatamente a la edad adulta1​ y se sitúa después de la infancia. La Organización Mundial de la Salud postula que la juventud comprende, en general, el rango de edad entre los 10 y los 29 años, aun cuando reconoce —por ejemplo— que puede haber «discrepancias entre la edad cronológica, la biológica y las etapas psicosociales del desarrollo», o también «grandes variaciones debidas a factores personales y ambientales».2​ Abarca la pubertad o adolescencia inicial (de 10 a 16 años), la adolescencia tardía (de 17 a 19 años) y la juventud plena (de 20 a 24 años).', 'Iglesia Nueva Luz', 'Erlinda Chambi Manzano', 'chambimanzanoerlinda@gmail.com', 76457459, 'img/foto.png', 1),
(7, 'Escuela Dominical - Joyitas', 'El 12 de agosto es el Día Internacional de la Juventud. La fecha fue proclamada e', 'La juventud (del latín iuventus) es la edad que precede inmediatamente a la edad adulta1​ y se sitúa después de la infancia. La Organización Mundial de la Salud postula que la juventud comprende, en general, el rango de edad entre los 10 y los 29 años, aun cuando reconoce —por ejemplo— que puede haber «discrepancias entre la edad cronológica, la biológica y las etapas psicosociales del desarrollo», o también «grandes variaciones debidas a factores personales y ambientales».2​ Abarca la pubertad o adolescencia inicial (de 10 a 16 años), la adolescencia tardía (de 17 a 19 años) y la juventud plena (de 20 a 24 años).', 'Iglesia Nueva Luz', 'Roxana Fernandez', '@gamil.com', 11111111, 'img/foto.png', 1),
(8, 'Horita Feliz', 'El 12 de agosto es el Día Internacional de la Juventud. La fecha fue proclamada el', 'La juventud (del latín iuventus) es la edad que precede inmediatamente a la edad adulta1​ y se sitúa después de la infancia. La Organización Mundial de la Salud postula que la juventud comprende, en general, el rango de edad entre los 10 y los 29 años, aun cuando reconoce —por ejemplo— que puede haber «discrepancias entre la edad cronológica, la biológica y las etapas psicosociales del desarrollo», o también «grandes variaciones debidas a factores personales y ambientales».2​ Abarca la pubertad o adolescencia inicial (de 10 a 16 años), la adolescencia tardía (de 17 a 19 años) y la juventud plena (de 20 a 24 años).', 'Pampa grande - Potrero -Quillacollo', 'Martha Mamani Mamani', '@gmail.com', 63958774, 'img/martha.png', 1),
(9, 'Club Oanza', 'El 12 de agosto es el Día Internacional de la Juventud. La fecha fue proclamada el', 'La juventud (del latín iuventus) es la edad que precede inmediatamente a la edad adulta1​ y se sitúa después de la infancia. La Organización Mundial de la Salud postula que la juventud comprende, en general, el rango de edad entre los 10 y los 29 años, aun cuando reconoce —por ejemplo— que puede haber «discrepancias entre la edad cronológica, la biológica y las etapas psicosociales del desarrollo», o también «grandes variaciones debidas a factores personales y ambientales».2​ Abarca la pubertad o adolescencia inicial (de 10 a 16 años), la adolescencia tardía (de 17 a 19 años) y la juventud plena (de 20 a 24 años).', 'Iglesia Nueva Luz', 'No esta asiganada encargada', '@gamil.com', 11111111, 'img/foto.png', 1);

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
  `biografia` text NOT NULL,
  `mensaje` text NOT NULL,
  `versiculo` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `id_miembro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pastor`
--

INSERT INTO `pastor` (`id_pastor`, `biografia`, `mensaje`, `versiculo`, `foto`, `id_miembro`) VALUES
(3, 'Albert Einstein (1879-1955) Nació el 14 de marzo de 1879, en Ulm (Alemania). Murió el 18 de abril de 1955, en Princeton (Estados Unidos de América). \r\nAlbert Einstein es quizá el científico mundialmente más conocido por el desarrollo de la Teoría de la Relatividad que revolucionó la ciencia conocida hasta el siglo XX.', 'La clasificación o definición siguiendo criterios meramente temporales o cronológicos se ha mostrado arbitraria e insuficiente ya que la juventud es un proceso engloba aspectos como la madurez física, social y psicológica de la persona, la educación, la incorporación al trabajo, autonomía e independencia que pueden conllevar la formación de un nuevo núcleo familiar, así como la construcción de una identidad propia que son difícilmente etiquetables en apartados cronológicos. ', '10 No temas, porque yo estoy contigo; no te desalientes, porque yo soy tu Dios. Te fortaleceré, ciertamente te ayudaré, sí, te sostendré con la diestra de mi justicia.\r\n\r\nIsaías 41:10', 'img/pastorgeneral.png', 1),
(4, 'sin bibliografia', 'sin  mensaje', 'sin versiculo', 'img/pastorJovenes.png', 2);

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
  `dia` varchar(50) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `id_ministerio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reunion_ministerio`
--

INSERT INTO `reunion_ministerio` (`id_reunion_ministerio`, `dia`, `hora_inicio`, `hora_fin`, `id_ministerio`) VALUES
(1, 'Jueves', '14:00:00', '17:00:00', 1),
(2, 'Sábado', '20:00:00', '22:00:00', 2),
(3, 'Sábado', '16:00:00', '18:00:00', 3),
(4, 'Domingo', '10:00:00', '12:00:00', 4),
(5, 'Domingo', '10:00:00', '12:00:00', 5),
(6, 'Domingo', '10:00:00', '12:00:00', 6),
(7, 'Domingo', '10:00:00', '12:00:00', 7),
(8, 'Sábado', '15:00:00', '16:00:00', 8),
(9, 'Domingo', '14:00:00', '16:00:00', 9);

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
  MODIFY `id_anciano` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cargo_lider`
--
ALTER TABLE `cargo_lider`
  MODIFY `id_cargo_lider` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `diezmo`
--
ALTER TABLE `diezmo`
  MODIFY `id_diezmo` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gestion_cargo`
--
ALTER TABLE `gestion_cargo`
  MODIFY `id_gestion_cargo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `iglesia`
--
ALTER TABLE `iglesia`
  MODIFY `id_iglesia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `iglesia_bautizo`
--
ALTER TABLE `iglesia_bautizo`
  MODIFY `id_iglesia_bautizo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `iglesia_conversion`
--
ALTER TABLE `iglesia_conversion`
  MODIFY `id_iglesia_conversion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `miembro`
--
ALTER TABLE `miembro`
  MODIFY `id_miembro` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `ministerio`
--
ALTER TABLE `ministerio`
  MODIFY `id_ministerio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ministerio_miembro`
--
ALTER TABLE `ministerio_miembro`
  MODIFY `id_ministerio_miembro` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pastor`
--
ALTER TABLE `pastor`
  MODIFY `id_pastor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reunion_iglesia`
--
ALTER TABLE `reunion_iglesia`
  MODIFY `id_reunion_iglesia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reunion_ministerio`
--
ALTER TABLE `reunion_ministerio`
  MODIFY `id_reunion_ministerio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
