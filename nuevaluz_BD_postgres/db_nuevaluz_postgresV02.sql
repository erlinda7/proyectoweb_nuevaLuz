--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11
-- Dumped by pg_dump version 10.11

-- Started on 2020-02-09 09:15:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16414)
-- Name: cargo_lider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cargo_lider (
    id_cargo_lider integer NOT NULL,
    nombre_cargo character varying(100) NOT NULL
);


ALTER TABLE public.cargo_lider OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16412)
-- Name: cargo_lider_id_cargo_lider_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cargo_lider_id_cargo_lider_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cargo_lider_id_cargo_lider_seq OWNER TO postgres;

--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 196
-- Name: cargo_lider_id_cargo_lider_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cargo_lider_id_cargo_lider_seq OWNED BY public.cargo_lider.id_cargo_lider;


--
-- TOC entry 199 (class 1259 OID 16420)
-- Name: diezmo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diezmo (
    id_diezmo integer NOT NULL,
    fecha date NOT NULL,
    monto integer NOT NULL,
    tesorero_enc character varying(150) NOT NULL,
    id_miembro integer NOT NULL
);


ALTER TABLE public.diezmo OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16418)
-- Name: diezmo_id_diezmo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diezmo_id_diezmo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diezmo_id_diezmo_seq OWNER TO postgres;

--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 198
-- Name: diezmo_id_diezmo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diezmo_id_diezmo_seq OWNED BY public.diezmo.id_diezmo;


--
-- TOC entry 201 (class 1259 OID 16428)
-- Name: evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evento (
    id_evento integer NOT NULL,
    titulo character varying(200) NOT NULL,
    descripcion text NOT NULL,
    lugar character varying(100) NOT NULL,
    fecha date NOT NULL,
    imagen character varying(255) NOT NULL,
    id_iglesia integer NOT NULL
);


ALTER TABLE public.evento OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16426)
-- Name: evento_id_evento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evento_id_evento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evento_id_evento_seq OWNER TO postgres;

--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 200
-- Name: evento_id_evento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evento_id_evento_seq OWNED BY public.evento.id_evento;


--
-- TOC entry 203 (class 1259 OID 16437)
-- Name: fotografia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fotografia (
    id_fotografia integer NOT NULL,
    foto character varying(200) NOT NULL,
    id_miembro integer NOT NULL
);


ALTER TABLE public.fotografia OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16435)
-- Name: fotografia_id_fotografia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fotografia_id_fotografia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fotografia_id_fotografia_seq OWNER TO postgres;

--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 202
-- Name: fotografia_id_fotografia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fotografia_id_fotografia_seq OWNED BY public.fotografia.id_fotografia;


--
-- TOC entry 205 (class 1259 OID 16443)
-- Name: gestion_cargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gestion_cargo (
    id_gestion_cargo integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    id_miembro integer NOT NULL
);


ALTER TABLE public.gestion_cargo OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16441)
-- Name: gestion_cargo_id_gestion_cargo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gestion_cargo_id_gestion_cargo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gestion_cargo_id_gestion_cargo_seq OWNER TO postgres;

--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 204
-- Name: gestion_cargo_id_gestion_cargo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gestion_cargo_id_gestion_cargo_seq OWNED BY public.gestion_cargo.id_gestion_cargo;


--
-- TOC entry 207 (class 1259 OID 16449)
-- Name: iglesia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iglesia (
    id_iglesia integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono integer NOT NULL,
    email character varying(50) NOT NULL,
    whatsapp character varying(50) NOT NULL
);


ALTER TABLE public.iglesia OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16447)
-- Name: iglesia_id_iglesia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iglesia_id_iglesia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iglesia_id_iglesia_seq OWNER TO postgres;

--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 206
-- Name: iglesia_id_iglesia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iglesia_id_iglesia_seq OWNED BY public.iglesia.id_iglesia;


--
-- TOC entry 209 (class 1259 OID 16455)
-- Name: miembro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miembro (
    id_miembro integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido_paterno character varying(50) NOT NULL,
    apellido_materno character varying(50) NOT NULL,
    telefono integer NOT NULL,
    estado_civil character varying(50) NOT NULL,
    fecha_nac date NOT NULL,
    fecha_conversion date,
    iglesia_conversion character varying(100) NOT NULL,
    fecha_bautizo date NOT NULL,
    iglesia_bautizo character varying(100) NOT NULL,
    nom_completo_pastor_bautizo character varying(150) NOT NULL,
    id_cargo_lider integer NOT NULL
);


ALTER TABLE public.miembro OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16453)
-- Name: miembro_id_miembro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.miembro_id_miembro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.miembro_id_miembro_seq OWNER TO postgres;

--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 208
-- Name: miembro_id_miembro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.miembro_id_miembro_seq OWNED BY public.miembro.id_miembro;


--
-- TOC entry 211 (class 1259 OID 16464)
-- Name: ministerio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ministerio (
    id_ministerio integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion_corta character varying(255) NOT NULL,
    descripcion text NOT NULL,
    lugar character varying(200) NOT NULL,
    nombre_responsable character varying(155) NOT NULL,
    email character varying(50) NOT NULL,
    telefono integer NOT NULL,
    foto character varying(255) NOT NULL,
    imagen character varying(100) NOT NULL,
    id_iglesia integer NOT NULL
);


ALTER TABLE public.ministerio OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16462)
-- Name: ministerio_id_ministerio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ministerio_id_ministerio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ministerio_id_ministerio_seq OWNER TO postgres;

--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 210
-- Name: ministerio_id_ministerio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ministerio_id_ministerio_seq OWNED BY public.ministerio.id_ministerio;


--
-- TOC entry 213 (class 1259 OID 16473)
-- Name: ministerio_miembro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ministerio_miembro (
    id_ministerio_miembro integer NOT NULL,
    id_ministerio integer NOT NULL,
    id_miembro integer NOT NULL
);


ALTER TABLE public.ministerio_miembro OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16471)
-- Name: ministerio_miembro_id_ministerio_miembro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ministerio_miembro_id_ministerio_miembro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ministerio_miembro_id_ministerio_miembro_seq OWNER TO postgres;

--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 212
-- Name: ministerio_miembro_id_ministerio_miembro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ministerio_miembro_id_ministerio_miembro_seq OWNED BY public.ministerio_miembro.id_ministerio_miembro;


--
-- TOC entry 215 (class 1259 OID 16479)
-- Name: reunion_iglesia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reunion_iglesia (
    id_reunion_iglesia integer NOT NULL,
    titulo character varying(200) NOT NULL,
    dia character varying(50) NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL,
    id_iglesia integer NOT NULL
);


ALTER TABLE public.reunion_iglesia OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16477)
-- Name: reunion_iglesia_id_reunion_iglesia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reunion_iglesia_id_reunion_iglesia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reunion_iglesia_id_reunion_iglesia_seq OWNER TO postgres;

--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 214
-- Name: reunion_iglesia_id_reunion_iglesia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reunion_iglesia_id_reunion_iglesia_seq OWNED BY public.reunion_iglesia.id_reunion_iglesia;


--
-- TOC entry 217 (class 1259 OID 16485)
-- Name: reunion_ministerio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reunion_ministerio (
    id_reunion_ministerio integer NOT NULL,
    dia character varying(50) NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL,
    id_ministerio integer NOT NULL
);


ALTER TABLE public.reunion_ministerio OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16483)
-- Name: reunion_ministerio_id_reunion_ministerio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reunion_ministerio_id_reunion_ministerio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reunion_ministerio_id_reunion_ministerio_seq OWNER TO postgres;

--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 216
-- Name: reunion_ministerio_id_reunion_ministerio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reunion_ministerio_id_reunion_ministerio_seq OWNED BY public.reunion_ministerio.id_reunion_ministerio;


--
-- TOC entry 219 (class 1259 OID 16491)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nombre_user character varying(100) NOT NULL,
    contrasenia character varying(100) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16489)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 218
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 2739 (class 2604 OID 16417)
-- Name: cargo_lider id_cargo_lider; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargo_lider ALTER COLUMN id_cargo_lider SET DEFAULT nextval('public.cargo_lider_id_cargo_lider_seq'::regclass);


--
-- TOC entry 2740 (class 2604 OID 16423)
-- Name: diezmo id_diezmo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diezmo ALTER COLUMN id_diezmo SET DEFAULT nextval('public.diezmo_id_diezmo_seq'::regclass);


--
-- TOC entry 2741 (class 2604 OID 16431)
-- Name: evento id_evento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento ALTER COLUMN id_evento SET DEFAULT nextval('public.evento_id_evento_seq'::regclass);


--
-- TOC entry 2742 (class 2604 OID 16440)
-- Name: fotografia id_fotografia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fotografia ALTER COLUMN id_fotografia SET DEFAULT nextval('public.fotografia_id_fotografia_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 16446)
-- Name: gestion_cargo id_gestion_cargo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gestion_cargo ALTER COLUMN id_gestion_cargo SET DEFAULT nextval('public.gestion_cargo_id_gestion_cargo_seq'::regclass);


--
-- TOC entry 2744 (class 2604 OID 16452)
-- Name: iglesia id_iglesia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iglesia ALTER COLUMN id_iglesia SET DEFAULT nextval('public.iglesia_id_iglesia_seq'::regclass);


--
-- TOC entry 2745 (class 2604 OID 16458)
-- Name: miembro id_miembro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro ALTER COLUMN id_miembro SET DEFAULT nextval('public.miembro_id_miembro_seq'::regclass);


--
-- TOC entry 2746 (class 2604 OID 16467)
-- Name: ministerio id_ministerio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ministerio ALTER COLUMN id_ministerio SET DEFAULT nextval('public.ministerio_id_ministerio_seq'::regclass);


--
-- TOC entry 2747 (class 2604 OID 16476)
-- Name: ministerio_miembro id_ministerio_miembro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ministerio_miembro ALTER COLUMN id_ministerio_miembro SET DEFAULT nextval('public.ministerio_miembro_id_ministerio_miembro_seq'::regclass);


--
-- TOC entry 2748 (class 2604 OID 16482)
-- Name: reunion_iglesia id_reunion_iglesia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reunion_iglesia ALTER COLUMN id_reunion_iglesia SET DEFAULT nextval('public.reunion_iglesia_id_reunion_iglesia_seq'::regclass);


--
-- TOC entry 2749 (class 2604 OID 16488)
-- Name: reunion_ministerio id_reunion_ministerio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reunion_ministerio ALTER COLUMN id_reunion_ministerio SET DEFAULT nextval('public.reunion_ministerio_id_reunion_ministerio_seq'::regclass);


--
-- TOC entry 2750 (class 2604 OID 16494)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 2907 (class 0 OID 16414)
-- Dependencies: 197
-- Data for Name: cargo_lider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cargo_lider (id_cargo_lider, nombre_cargo) FROM stdin;
1	Ninguno
2	Pastor
3	Anciano
4	Diacono
5	Diaconiza
6	Tesorero
7	Secretario
8	Superintendente
9	Femenil
10	Juvenil
11	Prejuvenil
12	Maestro
13	Recepcion Social
\.


--
-- TOC entry 2909 (class 0 OID 16420)
-- Dependencies: 199
-- Data for Name: diezmo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diezmo (id_diezmo, fecha, monto, tesorero_enc, id_miembro) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 16428)
-- Dependencies: 201
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evento (id_evento, titulo, descripcion, lugar, fecha, imagen, id_iglesia) FROM stdin;
1	CAMPAMENTO JUVENIL	Campamento juvenil de la zonal Quillacollo con el Tema "Dejando Huellas en el camino". No te lo pierdas 4 dias de bendición.	Ivirgarzama - Tropico de Cochabamba 	2020-01-30	/images/campamento.jpg	1
\.


--
-- TOC entry 2913 (class 0 OID 16437)
-- Dependencies: 203
-- Data for Name: fotografia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fotografia (id_fotografia, foto, id_miembro) FROM stdin;
1	/images/pastor1.png	1
2	/images/pastor2.png	2
3	/images/anciano1.png	3
4	/images/anciano2.png	4
5	/images/anciano3.png	5
6	/images/anciano4.png	6
7	/images/anciano5.png	7
\.


--
-- TOC entry 2915 (class 0 OID 16443)
-- Dependencies: 205
-- Data for Name: gestion_cargo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gestion_cargo (id_gestion_cargo, fecha_inicio, fecha_fin, id_miembro) FROM stdin;
1	2020-01-01	2025-12-31	1
2	2016-01-01	2025-12-31	2
3	2020-01-01	2025-12-31	3
4	2020-01-01	2025-12-31	4
5	2020-01-01	2025-12-31	5
6	2020-01-01	2025-12-31	6
7	2020-01-01	2025-12-31	7
8	2020-01-01	2025-12-31	8
9	2020-01-01	2025-12-31	9
10	2020-01-01	2025-12-31	10
11	2020-01-01	2025-12-31	11
12	2020-01-01	2025-12-31	12
13	2020-01-01	2025-12-31	13
14	2020-01-01	2025-12-31	14
15	2020-01-01	2025-12-31	15
16	2020-01-01	2025-12-31	16
17	2020-01-01	2025-12-31	17
18	2020-01-01	2025-12-31	18
19	2020-01-01	2025-12-31	19
20	2020-01-01	2025-12-31	20
21	2020-01-01	2025-12-31	21
22	2020-01-01	2025-12-31	22
23	2020-01-01	2025-12-31	23
24	2020-01-01	2025-12-31	24
25	2020-01-01	2025-12-31	25
26	2020-01-01	2025-12-31	26
27	2020-01-01	2025-12-31	27
28	2020-01-01	2025-12-31	28
29	2020-01-01	2025-12-31	29
30	2020-01-01	2025-12-31	30
31	2020-01-01	2025-12-31	31
32	2020-01-01	2025-12-31	32
33	2020-01-01	2025-12-31	33
34	2020-01-01	2025-12-31	34
35	2020-01-01	2025-12-31	35
\.


--
-- TOC entry 2917 (class 0 OID 16449)
-- Dependencies: 207
-- Data for Name: iglesia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iglesia (id_iglesia, nombre, direccion, telefono, email, whatsapp) FROM stdin;
1	Nueva Luz	Av. 6 de Agosto - Barrio Nuevo - Ironcollo - Quillacollo - Cochabamba	4391304	iglesianuevaluzuce@gmail.com	78323149  - 70396979
\.


--
-- TOC entry 2919 (class 0 OID 16455)
-- Dependencies: 209
-- Data for Name: miembro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miembro (id_miembro, nombre, apellido_paterno, apellido_materno, telefono, estado_civil, fecha_nac, fecha_conversion, iglesia_conversion, fecha_bautizo, iglesia_bautizo, nom_completo_pastor_bautizo, id_cargo_lider) FROM stdin;
1	Edgar	Jimenez 	Antezana	78323149	casado	1997-06-16	1997-07-11	Eben Ezer	0001-01-01	Libres	Lideres	2
2	Feliciano	Mendoza 	Fabricano	70396979	casado	1984-04-12	1994-06-12	Nueva Jerusalen UCE	1996-09-30	Nueva Jerusalen UCE	Juan Cuellar	2
3	Patricio	Quispe 	Colque	68516412	casado	1981-08-24	\N	Bautista	0001-01-01	Bautista Kumara	Agustin Cuti	3
4	Gregorio	Villarroel	Villegas	71766226	casado	1970-01-06	1984-06-06		1986-06-01		Geronimo Ledezma	3
5	Hector	Mamani	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	3
6	German	Cordova	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	3
7	Nestor 	Colque	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	3
8	Macario	Mamani	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	4
9	Felipe	Bautista	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	4
10	Grover	Valencia	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	4
11	Marcelo	Lopez	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	4
12	Eugenio	Duran	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	4
13	Adrian	Mamani	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	4
14	Epifania	Fernandez	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	5
15	Arminda	Beltran	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	5
16	Margarita	Fernandez	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	5
17	Julia	Quintana	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	5
18	Elza	Calle	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	5
19	Ortencia	Espinoza	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	5
20	Sabina	Espinoza	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	5
21	Delia	Colque	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	5
22	Cristobal	Quispe	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	6
23	Gabriela	Colque	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	6
24	Jamil	Quintana	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	7
25	Brayan	Colque	nulo	0	soltero	0001-01-01	\N		0001-01-01		nulo	8
26	Ruben	Rios	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	8
27	David	Mamani	Colque	0	casado	0001-01-01	\N		0001-01-01		nulo	8
28	Venancio	Escalera	nulo	0	casado	0001-01-01	\N		0001-01-01		nulo	8
29	Dario	Mamani	Mamani	0	soltero	0001-01-01	\N		0001-01-01		nulo	11
30	Martha	Mamani	Mamani	63958774	soltera	0001-05-15	0001-12-25	Nueva Canaan	0001-01-01	Nueva Canaan		12
31	Gladys	Mamani	Lopez	63914553	soltero	1998-06-21	2011-09-01	Nueva Luz	2013-12-25	Nueva Luz	Marcelino Camacho	12
32	Erlinda	Chambi	Manzano	76457459	soltero	0001-01-01	\N		0001-01-01		nulo	12
33	Roxana	Fernandez	nulo	0	soltero	0001-01-01	\N		0001-01-01		nulo	12
34	Oscar	Berrios	Luna	68322275	casado	1992-01-21	2004-01-25	Nueva Luz	2012-12-25	Nueva Luz	Marcelino Camacho\\r\\n	10
35	Maria	Aguilar	Fernandez	68597691	casado	0001-06-22	0001-09-23	Nueva Canaan	0001-09-23	Yoraq Kaqa	Octavio Condori	9
\.


--
-- TOC entry 2921 (class 0 OID 16464)
-- Dependencies: 211
-- Data for Name: ministerio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ministerio (id_ministerio, nombre, descripcion_corta, descripcion, lugar, nombre_responsable, email, telefono, foto, imagen, id_iglesia) FROM stdin;
1	Femenil - Herederas del Rey	La mujer que teme a Jehová, ésa será alabada	El ministerio femenil siendo un grupo de mujeres de la Iglesia que se reúnen con el propósito de aprender a desempeñar el rol de una esposa y madre dentro del hogar según la palabra de Dios. De esta manera alcanzar con el evangelio a los esposos y la comunidad que les rodea. 	Iglesia Nueva Luz	Maria Aguilar Fernandez	sin correo	68597691	/images/resp_femenil.png	/images/femenil1.jpg	1
2	Juvenil - Mas que vencedores	Acuérdate de tu Creador en los días de tu juventud	El ministerio juvenil tiene como objetivo alcanzar con el evangelio a todos los jóvenes de la zona y las comunidades aledañas, con el fin de que sean hombres que transformen y preparen a la sociedad para la generación venidera. Conducir a los jóvenes a descubrir y desarrollar sus dones para su integración en el liderazgo de la iglesia.	Iglesia Nueva Luz	Oscar Berrios Luna	master_os-12bl@hotmail.com	68322275	/images/resp_juvenil.png	/images/juvenil.jpg	1
3	Prejuvenil - Emanuel	No seas vencido de lo malo, sino vence con el bien el mal	El ministerio pre-juvenil tiene como propósito alcanzar a los adolescentes, ayudando a establecer una relación con Cristo, apoyar en su crecimiento como discípulo del Señor sembrando en ellos la palabra de Dios y afrontar los conflictos que presentan en su vida social, emocional y espiritual.	Iglesia Nueva Luz	Dario Mamani Mamani	dan06m2@gmail.com	68536437	/images/resp_prejuvenil.png	/images/prejuvenil.jpg	1
4	Escuela Dominical - Mensajeros	Hijos, obedeced a vuestros padres en el Señor	El ministerio mensajeros está dirigido a los niños desde los 10 a 12 años, tiene como objetivo  ampliar sus conocimientos sobre quien es Dios, enseñándoles la Palabra de Dios de una manera divertida y diferente durante la escuela dominical de la Iglesia.	Iglesia Nueva Luz	Martha Mamani Mamani	sin correo	63958774	/images/resp_mensajeros.png	/images/mensajeros.jpg	1
5	Escuela Dominical - Evangelistas	Crea en mí, Oh Dios, un corazón limpio	El ministerio evangelistas está dirigido a niños desde los 7 a 9 años, tiene como objetivo  ampliar sus conocimientos sobre quien es Dios, enseñándoles la Palabra de Dios de una manera divertida y diferente durante la escuela dominical de la Iglesia.	Iglesia Nueva Luz	Gladys Mamani Lopez	gladysmamanilopez949@gmail.com	63914553	/images/resp_evangelistas.png	/images/evangelistas.jpg	1
6	Escuela Dominical - Tesoritos	Jesús es la luz de mundo	El ministerio Tesoritos está dirigido a niños desde los 4 a 6 años, tiene como objetivo  ampliar sus conocimientos sobre quien es Dios, enseñándoles la Palabra de Dios de una manera divertida y diferente durante la escuela dominical de la Iglesia.	Iglesia Nueva Luz	Erlinda Chambi Manzano	chambimanzanoerlinda@gmail.com	76457459	/images/resp_tesoritos.png	/images/tesoritos.jpg	1
7	Escuela Dominical - Joyitas	No te angusties, porque yo soy tu Dios	El ministerio joyitas está dirigido a niños desde los 3 a 4 años, tiene como objetivo  ampliar sus conocimientos sobre quien es Dios, enseñándoles la Palabra de Dios de una manera divertida y diferente durante la escuela dominical de la Iglesia.	Iglesia Nueva Luz	Arminda beltran Villca	sin correo	76945173	/images/resp_joyitas.png	/images/joyitas.jpg	1
8	Horita Feliz	Si alguno está en Cristo, nueva criatura es	EL ministerio de Horita Feliz tiene como propósito alcanzar a niños de toda edad de la comunidad de Pampa Grande - Potrero y los alrededores llevando un mensaje de fe y esperanza a muchos niños que tanto lo necesitan. 	Pampa grande - Potrero - Quillacollo	Martha Mamani Mamani	sin correo	63958774	/images/resp_horitafeliz.png	/images/horitafeliz.jpg	1
9	Club OANSA	Escudriñad las Escrituras	El ministerio OANSA (Obreros Aprobados No Son Avergonzados) está dirigido a niños, niñas y jóvenes con el propósito de presentarles el evangelio de Jesucristo, discipularlos y entrenarlos para servir a Dios. Está centrado en la enseñanza, memorización, práctica de la Palabra de Dios y los valores cristianos.	Iglesia Nueva Luz	Gladys Mamani Lopez	gladysmamanilopez949@gmail.com	63914553	/images/resp_oanza.png	/images/oanza.jpg	1
\.


--
-- TOC entry 2923 (class 0 OID 16473)
-- Dependencies: 213
-- Data for Name: ministerio_miembro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ministerio_miembro (id_ministerio_miembro, id_ministerio, id_miembro) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 16479)
-- Dependencies: 215
-- Data for Name: reunion_iglesia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reunion_iglesia (id_reunion_iglesia, titulo, dia, hora_inicio, hora_fin, id_iglesia) FROM stdin;
1	Escuela Dominical	Domingo	10:00:00	12:00:00	1
2	Noche de alabanzas	Domingo	20:00:00	22:00:00	1
3	Noche de oración	Martes	20:00:00	10:00:00	1
4	Estudio bíblico	Jueves	20:00:00	22:00:00	1
\.


--
-- TOC entry 2927 (class 0 OID 16485)
-- Dependencies: 217
-- Data for Name: reunion_ministerio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reunion_ministerio (id_reunion_ministerio, dia, hora_inicio, hora_fin, id_ministerio) FROM stdin;
1	Jueves	14:00:00	17:00:00	1
2	Sábado	20:00:00	22:00:00	2
3	Sábado	16:00:00	18:00:00	3
4	Domingo	10:00:00	12:00:00	4
5	Domingo	10:00:00	12:00:00	5
6	Domingo	10:00:00	12:00:00	6
7	Domingo	10:00:00	12:00:00	7
8	Sábado	15:00:00	16:00:00	8
9	Domingo	14:00:00	16:00:00	9
\.


--
-- TOC entry 2929 (class 0 OID 16491)
-- Dependencies: 219
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, nombre_user, contrasenia) FROM stdin;
1	ErlindaChambiManzano	ECM_iglesianuevaluz.com
2	nuevaluz	nuevaluz2020
\.


--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 196
-- Name: cargo_lider_id_cargo_lider_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cargo_lider_id_cargo_lider_seq', 13, true);


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 198
-- Name: diezmo_id_diezmo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diezmo_id_diezmo_seq', 1, true);


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 200
-- Name: evento_id_evento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evento_id_evento_seq', 1, false);


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 202
-- Name: fotografia_id_fotografia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fotografia_id_fotografia_seq', 7, true);


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 204
-- Name: gestion_cargo_id_gestion_cargo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gestion_cargo_id_gestion_cargo_seq', 35, true);


--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 206
-- Name: iglesia_id_iglesia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iglesia_id_iglesia_seq', 1, false);


--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 208
-- Name: miembro_id_miembro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.miembro_id_miembro_seq', 35, true);


--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 210
-- Name: ministerio_id_ministerio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ministerio_id_ministerio_seq', 9, true);


--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 212
-- Name: ministerio_miembro_id_ministerio_miembro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ministerio_miembro_id_ministerio_miembro_seq', 1, false);


--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 214
-- Name: reunion_iglesia_id_reunion_iglesia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reunion_iglesia_id_reunion_iglesia_seq', 4, true);


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 216
-- Name: reunion_ministerio_id_reunion_ministerio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reunion_ministerio_id_reunion_ministerio_seq', 9, true);


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 218
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 2, true);


--
-- TOC entry 2752 (class 2606 OID 16497)
-- Name: cargo_lider cargo_lider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargo_lider
    ADD CONSTRAINT cargo_lider_pkey PRIMARY KEY (id_cargo_lider);


--
-- TOC entry 2754 (class 2606 OID 16499)
-- Name: diezmo diezmo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diezmo
    ADD CONSTRAINT diezmo_pkey PRIMARY KEY (id_diezmo);


--
-- TOC entry 2756 (class 2606 OID 16501)
-- Name: evento evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id_evento);


--
-- TOC entry 2758 (class 2606 OID 16503)
-- Name: fotografia fotografia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fotografia
    ADD CONSTRAINT fotografia_pkey PRIMARY KEY (id_fotografia);


--
-- TOC entry 2760 (class 2606 OID 16505)
-- Name: gestion_cargo gestion_cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gestion_cargo
    ADD CONSTRAINT gestion_cargo_pkey PRIMARY KEY (id_gestion_cargo);


--
-- TOC entry 2762 (class 2606 OID 16507)
-- Name: iglesia iglesia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iglesia
    ADD CONSTRAINT iglesia_pkey PRIMARY KEY (id_iglesia);


--
-- TOC entry 2764 (class 2606 OID 16509)
-- Name: miembro miembro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro
    ADD CONSTRAINT miembro_pkey PRIMARY KEY (id_miembro);


--
-- TOC entry 2768 (class 2606 OID 16513)
-- Name: ministerio_miembro ministerio_miembro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ministerio_miembro
    ADD CONSTRAINT ministerio_miembro_pkey PRIMARY KEY (id_ministerio_miembro);


--
-- TOC entry 2766 (class 2606 OID 16511)
-- Name: ministerio ministerio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ministerio
    ADD CONSTRAINT ministerio_pkey PRIMARY KEY (id_ministerio);


--
-- TOC entry 2770 (class 2606 OID 16515)
-- Name: reunion_iglesia reunion_iglesia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reunion_iglesia
    ADD CONSTRAINT reunion_iglesia_pkey PRIMARY KEY (id_reunion_iglesia);


--
-- TOC entry 2772 (class 2606 OID 16517)
-- Name: reunion_ministerio reunion_ministerio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reunion_ministerio
    ADD CONSTRAINT reunion_ministerio_pkey PRIMARY KEY (id_reunion_ministerio);


--
-- TOC entry 2774 (class 2606 OID 16519)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 2775 (class 2606 OID 16520)
-- Name: diezmo diezmo_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diezmo
    ADD CONSTRAINT diezmo_ibfk_1 FOREIGN KEY (id_miembro) REFERENCES public.miembro(id_miembro) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2776 (class 2606 OID 16525)
-- Name: evento evento_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_ibfk_1 FOREIGN KEY (id_iglesia) REFERENCES public.iglesia(id_iglesia) ON UPDATE CASCADE;


--
-- TOC entry 2777 (class 2606 OID 16530)
-- Name: fotografia fotografia_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fotografia
    ADD CONSTRAINT fotografia_ibfk_1 FOREIGN KEY (id_miembro) REFERENCES public.miembro(id_miembro) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2778 (class 2606 OID 16535)
-- Name: gestion_cargo gestion_cargo_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gestion_cargo
    ADD CONSTRAINT gestion_cargo_ibfk_1 FOREIGN KEY (id_miembro) REFERENCES public.miembro(id_miembro) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2779 (class 2606 OID 16540)
-- Name: miembro miembro_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro
    ADD CONSTRAINT miembro_ibfk_1 FOREIGN KEY (id_cargo_lider) REFERENCES public.cargo_lider(id_cargo_lider) ON UPDATE CASCADE;


--
-- TOC entry 2780 (class 2606 OID 16545)
-- Name: ministerio ministerio_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ministerio
    ADD CONSTRAINT ministerio_ibfk_1 FOREIGN KEY (id_iglesia) REFERENCES public.iglesia(id_iglesia) ON UPDATE CASCADE;


--
-- TOC entry 2781 (class 2606 OID 16550)
-- Name: ministerio_miembro ministerio_miembro_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ministerio_miembro
    ADD CONSTRAINT ministerio_miembro_ibfk_1 FOREIGN KEY (id_ministerio) REFERENCES public.ministerio(id_ministerio) ON UPDATE CASCADE;


--
-- TOC entry 2782 (class 2606 OID 16555)
-- Name: ministerio_miembro ministerio_miembro_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ministerio_miembro
    ADD CONSTRAINT ministerio_miembro_ibfk_2 FOREIGN KEY (id_miembro) REFERENCES public.miembro(id_miembro) ON UPDATE CASCADE;


--
-- TOC entry 2783 (class 2606 OID 16560)
-- Name: reunion_iglesia reunion_iglesia_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reunion_iglesia
    ADD CONSTRAINT reunion_iglesia_ibfk_1 FOREIGN KEY (id_iglesia) REFERENCES public.iglesia(id_iglesia) ON UPDATE CASCADE;


--
-- TOC entry 2784 (class 2606 OID 16565)
-- Name: reunion_ministerio reunion_ministerio_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reunion_ministerio
    ADD CONSTRAINT reunion_ministerio_ibfk_1 FOREIGN KEY (id_ministerio) REFERENCES public.ministerio(id_ministerio) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2020-02-09 09:15:14

--
-- PostgreSQL database dump complete
--

