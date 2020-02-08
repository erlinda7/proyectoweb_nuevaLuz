-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-02-2020 a las 20:22:03
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: nuevaluz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_lider`
--

CREATE TABLE cargo_lider (
  id_cargo_lider serial,
  nombre_cargo varchar(100) NOT NULL
) 

--
-- Volcado de datos para la tabla `cargo_lider`
--

INSERT INTO cargo_lider (id_cargo_lider, nombre_cargo) VALUES
(1, 'Ninguno'),
(2, 'Pastor'),
(3, 'Anciano'),
(4, 'Diacono'),
(5, 'Diaconiza'),
(6, 'Tesorero'),
(7, 'Secretario'),
(8, 'Superintendente'),
(9, 'Femenil'),
(10, 'Juvenil'),
(11, 'Prejuvenil'),
(12, 'Maestro'),
(13, 'Recepcion Social');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla diezmo
--

CREATE TABLE diezmo (
  id_diezmo serial,
  fecha date NOT NULL,
  monto integer NOT NULL,
  tesorero_enc varchar(150) NOT NULL,
  id_miembro integer NOT NULL
) 

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE evento (
  id_evento serial,
  titulo varchar(200) NOT NULL,
  descripcion text NOT NULL,
  lugar varchar(100) NOT NULL,
  fecha date NOT NULL,
  imagen varchar(255) NOT NULL,
  id_iglesia integer NOT NULL
) 

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO evento (id_evento, titulo, descripcion, lugar, fecha, imagen, id_iglesia) VALUES
(1, 'CAMPAMENTO JUVENIL ', 'Campamento juvenil de la zonal Quillacollo con el Tema "Dejando Huellas en el camino". No te lo pierdas 4 dias de bendición.', 'Ivirgarzama - Tropico de Cochabamba ', '2020-01-30', '/images/campamento.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotografia`
--

CREATE TABLE fotografia (
  id_fotografia serial,
  foto varchar(200) NOT NULL,
  id_miembro integer NOT NULL
) 

--
-- Volcado de datos para la tabla `fotografia`
--

INSERT INTO fotografia (id_fotografia, foto, id_miembro) VALUES
(1, '/images/pastor1.png', 1),
(2, '/images/pastor2.png', 2),
(3, '/images/anciano1.png', 3),
(4, '/images/anciano2.png', 4),
(5, '/images/anciano3.png', 5),
(6, '/images/anciano4.png', 6),
(7, '/images/anciano5.png', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_cargo`
--

CREATE TABLE gestion_cargo (
  id_gestion_cargo serial,
  fecha_inicio date NOT NULL,
  fecha_fin date NOT NULL,
  id_miembro integer NOT NULL
) 

--
-- Volcado de datos para la tabla `gestion_cargo`
--

INSERT INTO gestion_cargo (id_gestion_cargo, fecha_inicio, fecha_fin, id_miembro) VALUES
(1, '2020-01-01', '2025-12-31', 1),
(2, '2016-01-01', '2025-12-31', 2),
(3, '2020-01-01', '2025-12-31', 3),
(4, '2020-01-01', '2025-12-31', 4),
(5, '2020-01-01', '2025-12-31', 5),
(6, '2020-01-01', '2025-12-31', 6),
(7, '2020-01-01', '2025-12-31', 7),
(8, '2020-01-01', '2025-12-31', 8),
(9, '2020-01-01', '2025-12-31', 9),
(10, '2020-01-01', '2025-12-31', 10),
(11, '2020-01-01', '2025-12-31', 11),
(12, '2020-01-01', '2025-12-31', 12),
(13, '2020-01-01', '2025-12-31', 13),
(14, '2020-01-01', '2025-12-31', 14),
(15, '2020-01-01', '2025-12-31', 15),
(16, '2020-01-01', '2025-12-31', 16),
(17, '2020-01-01', '2025-12-31', 17),
(18, '2020-01-01', '2025-12-31', 18),
(19, '2020-01-01', '2025-12-31', 19),
(20, '2020-01-01', '2025-12-31', 20),
(21, '2020-01-01', '2025-12-31', 21),
(22, '2020-01-01', '2025-12-31', 22),
(23, '2020-01-01', '2025-12-31', 23),
(24, '2020-01-01', '2025-12-31', 24),
(25, '2020-01-01', '2025-12-31', 25),
(26, '2020-01-01', '2025-12-31', 26),
(27, '2020-01-01', '2025-12-31', 27),
(28, '2020-01-01', '2025-12-31', 28),
(29, '2020-01-01', '2025-12-31', 29),
(30, '2020-01-01', '2025-12-31', 30),
(31, '2020-01-01', '2025-12-31', 31),
(32, '2020-01-01', '2025-12-31', 32),
(33, '2020-01-01', '2025-12-31', 33),
(34, '2020-01-01', '2025-12-31', 34),
(35, '2020-01-01', '2025-12-31', 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iglesia`
--

CREATE TABLE iglesia (
  id_iglesia serial,
  nombre varchar(100) NOT NULL,
  direccion varchar(255) NOT NULL,
  telefono integer NOT NULL,
  email varchar(50) NOT NULL,
  whatsapp varchar(50) NOT NULL
) 

--
-- Volcado de datos para la tabla `iglesia`
--

INSERT INTO iglesia (id_iglesia, nombre, direccion, telefono, email, whatsapp) VALUES
(1, 'Nueva Luz', 'Av. 6 de Agosto - Barrio Nuevo - Ironcollo - Quillacollo - Cochabamba', 4391304, 'iglesianuevaluzuce@gmail.com', '78323149  - 70396979');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembro`
--

CREATE TABLE miembro (
  id_miembro serial,
  nombre varchar(50) NOT NULL,
  apellido_paterno varchar(50) NOT NULL,
  apellido_matern varchar(50) NOT NULL,
  telefono integer NOT NULL,
  estado_civil varchar(50) NOT NULL,
  fecha_nac date NOT NULL,
  fecha_conversion date DEFAULT NULL,
  iglesia_conversion varchar(100) NOT NULL,
  fecha_bautizo date NOT NULL,
  iglesia_bautizo varchar(100) NOT NULL,
  nom_completo_pastor_bautizo varchar(150) NOT NULL,
  id_cargo_lider integer NOT NULL
) 

--
-- Volcado de datos para la tabla `miembro`
--

INSERT INTO miembro (id_miembro, nombre, apellido_paterno, apellido_materno, telefono, estado_civil, fecha_nac, fecha_conversion, iglesia_conversion, fecha_bautizo, iglesia_bautizo, nom_completo_pastor_bautizo, id_cargo_lider) VALUES
(1, 'Edgar', 'Jimenez ', 'Antezana', 78323149, 'casado', '1997-06-16', '1997-07-11', 'Eben Ezer', '0001-01-01', 'Libres', 'Lideres', 2),
(2, 'Feliciano', 'Mendoza ', 'Fabricano', 70396979, 'casado', '1984-04-12', '1994-06-12', 'Nueva Jerusalen UCE', '1996-09-30', 'Nueva Jerusalen UCE', 'Juan Cuellar', 2),
(3, 'Patricio', 'Quispe ', 'Colque', 68516412, 'casado', '1981-08-24', NULL, 'Bautista', '0001-01-01', 'Bautista Kumara', 'Agustin Cuti', 3),
(4, 'Gregorio', 'Villarroel', 'Villegas', 71766226, 'casado', '1970-01-06', '1984-06-06', '', '1986-06-01', '', 'Geronimo Ledezma', 3),
(5, 'Hector', 'Mamani', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 3),
(6, 'German', 'Cordova', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 3),
(7, 'Nestor ', 'Colque', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 3),
(8, 'Macario', 'Mamani', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 4),
(9, 'Felipe', 'Bautista', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 4),
(10, 'Grover', 'Valencia', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 4),
(11, 'Marcelo', 'Lopez', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 4),
(12, 'Eugenio', 'Duran', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 4),
(13, 'Adrian', 'Mamani', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 4),
(14, 'Epifania', 'Fernandez', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 5),
(15, 'Arminda', 'Beltran', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 5),
(16, 'Margarita', 'Fernandez', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 5),
(17, 'Julia', 'Quintana', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 5),
(18, 'Elza', 'Calle', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 5),
(19, 'Ortencia', 'Espinoza', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 5),
(20, 'Sabina', 'Espinoza', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 5),
(21, 'Delia', 'Colque', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 5),
(22, 'Cristobal', 'Quispe', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 6),
(23, 'Gabriela', 'Colque', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 6),
(24, 'Jamil', 'Quintana', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 7),
(25, 'Brayan', 'Colque', 'nulo', 0, 'soltero', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 8),
(26, 'Ruben', 'Rios', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 8),
(27, 'David', 'Mamani', 'Colque', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 8),
(28, 'Venancio', 'Escalera', 'nulo', 0, 'casado', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 8),
(29, 'Dario', 'Mamani', 'Mamani', 0, 'soltero', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 11),
(30, 'Martha', 'Mamani', 'Mamani', 63958774, 'soltera', '0001-05-15', '0001-12-25', 'Nueva Canaan', '0001-01-01', 'Nueva Canaan', '', 12),
(31, 'Gladys', 'Mamani', 'Lopez', 63914553, 'soltero', '1998-06-21', '2011-09-01', 'Nueva Luz', '2013-12-25', 'Nueva Luz', 'Marcelino Camacho', 12),
(32, 'Erlinda', 'Chambi', 'Manzano', 76457459, 'soltero', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 12),
(33, 'Roxana', 'Fernandez', 'nulo', 0, 'soltero', '0001-01-01', NULL, '', '0001-01-01', '', 'nulo', 12),
(34, 'Oscar', 'Berrios', 'Luna', 68322275, 'casado', '1992-01-21', '2004-01-25', 'Nueva Luz', '2012-12-25', 'Nueva Luz', 'Marcelino Camacho\r\n', 10),
(35, 'Maria', 'Aguilar', 'Fernandez', 68597691, 'casado', '0001-06-22', '0001-09-23', 'Nueva Canaan', '0001-09-23', 'Yoraq Kaqa', 'Octavio Condori', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla ministerio`
--

CREATE TABLE ministerio (
  id_ministerio serial,
  nombre varchar(100) NOT NULL,
  descripcion_corta varchar(255) NOT NULL,
  descripcion text NOT NULL,
  lugar varchar(200) NOT NULL,
  nombre_responsable varchar(155) NOT NULL,
  email varchar(50) NOT NULL,
  telefono integer NOT NULL,
  foto varchar(255) NOT NULL,
  imagen varchar(100) NOT NULL,
  id_iglesia integer NOT NULL
) 

--
-- Volcado de datos para la tabla `ministerio`
--

INSERT INTO ministerio (id_ministerio, nombre, descripcion_corta, descripcion, lugar, nombre_responsable, email, telefono, foto, imagen, id_iglesia) VALUES
(1, 'Femenil - Herederas del Rey', 'La mujer que teme a Jehová, ésa será alabada', 'El ministerio femenil siendo un grupo de mujeres de la Iglesia que se reúnen con el propósito de aprender a desempeñar el rol de una esposa y madre dentro del hogar según la palabra de Dios. De esta manera alcanzar con el evangelio a los esposos y la comunidad que les rodea. ', 'Iglesia Nueva Luz', 'Maria Aguilar Fernandez', 'sin correo', 68597691, '/images/resp_femenil.png', '/images/femenil1.jpg', 1),
(2, 'Juvenil - Mas que vencedores', 'Acuérdate de tu Creador en los días de tu juventud', 'El ministerio juvenil tiene como objetivo alcanzar con el evangelio a todos los jóvenes de la zona y las comunidades aledañas, con el fin de que sean hombres que transformen y preparen a la sociedad para la generación venidera. Conducir a los jóvenes a descubrir y desarrollar sus dones para su integración en el liderazgo de la iglesia.', 'Iglesia Nueva Luz', 'Oscar Berrios Luna', 'master_os-12bl@hotmail.com', 68322275, '/images/resp_juvenil.png', '/images/juvenil.jpg', 1),
(3, 'Prejuvenil - Emanuel', 'No seas vencido de lo malo, sino vence con el bien el mal', 'El ministerio pre-juvenil tiene como propósito alcanzar a los adolescentes, ayudando a establecer una relación con Cristo, apoyar en su crecimiento como discípulo del Señor sembrando en ellos la palabra de Dios y afrontar los conflictos que presentan en su vida social, emocional y espiritual.', 'Iglesia Nueva Luz', 'Dario Mamani Mamani', 'dan06m2@gmail.com', 68536437, '/images/resp_prejuvenil.png', '/images/prejuvenil.jpg', 1),
(4, 'Escuela Dominical - Mensajeros', 'Hijos, obedeced a vuestros padres en el Señor', 'El ministerio mensajeros está dirigido a los niños desde los 10 a 12 años, tiene como objetivo  ampliar sus conocimientos sobre quien es Dios, enseñándoles la Palabra de Dios de una manera divertida y diferente durante la escuela dominical de la Iglesia.', 'Iglesia Nueva Luz', 'Martha Mamani Mamani', 'sin correo', 63958774, '/images/resp_mensajeros.png', '/images/mensajeros.jpg', 1),
(5, 'Escuela Dominical - Evangelistas', 'Crea en mí, Oh Dios, un corazón limpio', 'El ministerio evangelistas está dirigido a niños desde los 7 a 9 años, tiene como objetivo  ampliar sus conocimientos sobre quien es Dios, enseñándoles la Palabra de Dios de una manera divertida y diferente durante la escuela dominical de la Iglesia.', 'Iglesia Nueva Luz', 'Gladys Mamani Lopez', 'gladysmamanilopez949@gmail.com', 63914553, '/images/resp_evangelistas.png', '/images/evangelistas.jpg', 1),
(6, 'Escuela Dominical - Tesoritos', 'Jesús es la luz de mundo', 'El ministerio Tesoritos está dirigido a niños desde los 4 a 6 años, tiene como objetivo  ampliar sus conocimientos sobre quien es Dios, enseñándoles la Palabra de Dios de una manera divertida y diferente durante la escuela dominical de la Iglesia.', 'Iglesia Nueva Luz', 'Erlinda Chambi Manzano', 'chambimanzanoerlinda@gmail.com', 76457459, '/images/resp_tesoritos.png', '/images/tesoritos.jpg', 1),
(7, 'Escuela Dominical - Joyitas', 'No te angusties, porque yo soy tu Dios', 'El ministerio joyitas está dirigido a niños desde los 3 a 4 años, tiene como objetivo  ampliar sus conocimientos sobre quien es Dios, enseñándoles la Palabra de Dios de una manera divertida y diferente durante la escuela dominical de la Iglesia.', 'Iglesia Nueva Luz', 'Arminda beltran Villca', 'sin correo', 76945173, '/images/resp_joyitas.png', '/images/joyitas.jpg', 1),
(8, 'Horita Feliz', 'Si alguno está en Cristo, nueva criatura es', 'EL ministerio de Horita Feliz tiene como propósito alcanzar a niños de toda edad de la comunidad de Pampa Grande - Potrero y los alrededores llevando un mensaje de fe y esperanza a muchos niños que tanto lo necesitan. ', 'Pampa grande - Potrero - Quillacollo', 'Martha Mamani Mamani', 'sin correo', 63958774, '/images/resp_horitafeliz.png', '/images/horitafeliz.jpg', 1),
(9, 'Club OANSA', 'Escudriñad las Escrituras', 'El ministerio OANSA (Obreros Aprobados No Son Avergonzados) está dirigido a niños, niñas y jóvenes con el propósito de presentarles el evangelio de Jesucristo, discipularlos y entrenarlos para servir a Dios. Está centrado en la enseñanza, memorización, práctica de la Palabra de Dios y los valores cristianos.', 'Iglesia Nueva Luz', 'Gladys Mamani Lopez', 'gladysmamanilopez949@gmail.com', 63914553, '/images/resp_oanza.png', '/images/oanza.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla ministerio_miembro`
--

CREATE TABLE ministerio_miembro (
  id_ministerio_miembro serial,
  id_ministerio integer NOT NULL,
  id_miembro integer NOT NULL
) 

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reunion_iglesia`
--

CREATE TABLE reunion_iglesia (
  id_reunion_iglesia serial,
  titulo varchar(200) NOT NULL,
  dia varchar(50) NOT NULL,
  hora_inicio time NOT NULL,
  hora_fin time NOT NULL,
  id_iglesia integer NOT NULL
) 

--
-- Volcado de datos para la tabla `reunion_iglesia`
--

INSERT INTO reunion_iglesia (id_reunion_iglesia, titulo, dia, hora_inicio, hora_fin, id_iglesia) VALUES
(1, 'Escuela Dominical', 'Domingo', '10:00:00', '12:00:00', 1),
(2, 'Noche de alabanzas', 'Domingo', '20:00:00', '22:00:00', 1),
(3, 'Noche de oración', 'Martes', '20:00:00', '10:00:00', 1),
(4, 'Estudio bíblico', 'Jueves', '20:00:00', '22:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reunion_ministerio`
--

CREATE TABLE reunion_ministerio (
  id_reunion_ministerio serial,
  dia varchar(50) NOT NULL,
  hora_inicio time NOT NULL,
  hora_fin time NOT NULL,
  id_ministerio integer NOT NULL
) 

--
-- Volcado de datos para la tabla `reunion_ministerio`
--

INSERT INTO reunion_ministerio (id_reunion_ministerio, dia, hora_inicio, hora_fin, id_ministerio) VALUES
(1, 'Jueves', '14:00:00', '17:00:00', 1),
(2, 'Sábado', '20:00:00', '22:00:00', 2),
(3, 'Sábado', '16:00:00', '18:00:00', 3),
(4, 'Domingo', '10:00:00', '12:00:00', 4),
(5, 'Domingo', '10:00:00', '12:00:00', 5),
(6, 'Domingo', '10:00:00', '12:00:00', 6),
(7, 'Domingo', '10:00:00', '12:00:00', 7),
(8, 'Sábado', '15:00:00', '16:00:00', 8),
(9, 'Domingo', '14:00:00', '16:00:00', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE usuario (
  id_usuario serial,
  nombre_user varchar(100) NOT NULL,
  contrasenia varchar(100) NOT NULL
)

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO usuario (id_usuario, nombre_user, contrasenia) VALUES
(1, 'ErlindaChambiManzano', 'ECM_iglesianuevaluz.com'),
(2, 'nuevaluz', 'nuevaluz2020');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo_lider`
--
ALTER TABLE cargo_lider
  ADD PRIMARY KEY (id_cargo_lider);

--
-- Indices de la tabla `diezmo`
--
ALTER TABLE diezmo
  ADD PRIMARY KEY (id_diezmo),
  ADD KEY id_miembro (id_miembro); -------------------------------------------

--
-- Indices de la tabla `evento`
--
ALTER TABLE evento
  ADD PRIMARY KEY (id_evento),
  ADD KEY id_iglesia (id_iglesia); -------------------------------------------

--
-- Indices de la tabla `fotografia`
--
ALTER TABLE fotografia
  ADD PRIMARY KEY (id_fotografia),
  ADD KEY id_miembro (id_miembro);-------------------------------------------

--
-- Indices de la tabla `gestion_cargo`
--
ALTER TABLE gestion_cargo
  ADD PRIMARY KEY (id_gestion_cargo),
  ADD KEY id_miembro (id_miembro);------------------------------------------

--
-- Indices de la tabla `iglesia`
--
ALTER TABLE iglesia
  ADD PRIMARY KEY (id_iglesia);

--
-- Indices de la tabla `miembro`
--
ALTER TABLE miembro
  ADD PRIMARY KEY (id_miembro),
  ADD KEY id_cargo_lider (id_cargo_lider);------------------------------------------

--
-- Indices de la tabla `ministerio`
--
ALTER TABLE ministerio
  ADD PRIMARY KEY (id_ministerio),
  ADD KEY id_iglesia (id_iglesia);-----------------------------------------

--
-- Indices de la tabla ministerio_miembro`
--
ALTER TABLE ministerio_miembro
  ADD PRIMARY KEY (id_ministerio_miembro),
  ADD KEY id_ministerio (id_ministerio),----------------------------------------
  ADD KEY id_miembro (id_miembro);----------------------------------------

--
-- Indices de la tabla `reunion_iglesia`
--
ALTER TABLE reunion_iglesia
  ADD PRIMARY KEY (id_reunion_iglesia),
  ADD KEY id_iglesia (id_iglesia); ---------------------------------------- falta esto para clave primaria

--
-- Indices de la tabla reunion_ministerio
--
ALTER TABLE reunion_ministerio
  ADD PRIMARY KEY (id_reunion_ministerio),
  ADD KEY id_ministerio (id_ministerio);----------------------------------------

--
-- Indices de la tabla usuario
--
ALTER TABLE usuario
  ADD PRIMARY KEY (id_usuario);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo_lider`
--
ALTER TABLE `cargo_lider`
  MODIFY `id_cargo_lider` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `diezmo`
--
ALTER TABLE `diezmo`
  MODIFY `id_diezmo` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fotografia`
--
ALTER TABLE `fotografia`
  MODIFY `id_fotografia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT de la tabla `miembro`
--
ALTER TABLE `miembro`
  MODIFY `id_miembro` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
-- AUTO_INCREMENT de la tabla `reunion_iglesia`
--
ALTER TABLE `reunion_iglesia`
  MODIFY `id_reunion_iglesia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reunion_ministerio`
--
ALTER TABLE `reunion_ministerio`
  MODIFY `id_reunion_ministerio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `diezmo`
--
ALTER TABLE diezmo
  ADD CONSTRAINT diezmo_ibfk_1 FOREIGN KEY (id_miembro) REFERENCES miembro (id_miembro) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla evento`
--
ALTER TABLE evento
  ADD CONSTRAINT evento_ibfk_1 FOREIGN KEY (id_iglesia) REFERENCES iglesia (id_iglesia) ON UPDATE CASCADE;

--
-- Filtros para la tabla fotografia
--
ALTER TABLE fotografia
  ADD CONSTRAINT fotografia_ibfk_1 FOREIGN KEY (id_miembro) REFERENCES miembro (id_miembro) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla gestion_cargo
--
ALTER TABLE gestion_cargo
  ADD CONSTRAINT gestion_cargo_ibfk_1 FOREIGN KEY (id_miembro) REFERENCES miembro (id_miembro) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla miembro
--
ALTER TABLE miembro
  ADD CONSTRAINT miembro_ibfk_1 FOREIGN KEY (id_cargo_lider) REFERENCES cargo_lider (id_cargo_lider) ON UPDATE CASCADE;

--
-- Filtros para la tabla ministerio
--
ALTER TABLE ministerio
  ADD CONSTRAINT ministerio_ibfk_1 FOREIGN KEY (id_iglesia) REFERENCES iglesia (id_iglesia) ON UPDATE CASCADE;

--
-- Filtros para la tabla ministerio_miembro
--
ALTER TABLE ministerio_miembro
  ADD CONSTRAINT ministerio_miembro_ibfk_1 FOREIGN KEY (id_ministerio) REFERENCES ministerio (id_ministerio) ON UPDATE CASCADE,
  ADD CONSTRAINT ministerio_miembro_ibfk_2 FOREIGN KEY (id_miembro) REFERENCES miembro (id_miembro) ON UPDATE CASCADE;

--
-- Filtros para la tabla reunion_iglesia
--
ALTER TABLE reunion_iglesia
  ADD CONSTRAINT reunion_iglesia_ibfk_1 FOREIGN KEY (id_iglesia) REFERENCES iglesia (id_iglesia) ON UPDATE CASCADE;

--
-- Filtros para la tabla reunion_ministerio
--
ALTER TABLE reunion_ministerio
  ADD CONSTRAINT reunion_ministerio_ibfk_1 FOREIGN KEY (id_ministerio) REFERENCES ministerio (id_ministerio) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
