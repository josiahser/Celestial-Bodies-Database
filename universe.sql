--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dwarf_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planets (
    name character varying NOT NULL,
    dwarf_planets_id integer NOT NULL,
    has_moons boolean
);


ALTER TABLE public.dwarf_planets OWNER TO freecodecamp;

--
-- Name: dwarf_planets_dwarf_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planets_dwarf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planets_dwarf_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planets_dwarf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planets_dwarf_id_seq OWNED BY public.dwarf_planets.dwarf_planets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    width integer,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
    galaxy_type text NOT NULL,
    name character varying
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    mean_radius_in_km numeric NOT NULL,
    mass_compared_to_earths numeric NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    has_moon boolean NOT NULL,
    star_id integer,
    planet_types text NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    star_type text NOT NULL,
    mass_in_solar_units numeric NOT NULL,
    radius_in_solar_radii numeric NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: dwarf_planets dwarf_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets ALTER COLUMN dwarf_planets_id SET DEFAULT nextval('public.dwarf_planets_dwarf_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: dwarf_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planets VALUES ('Pluto', 1, true);
INSERT INTO public.dwarf_planets VALUES ('Ceres', 2, false);
INSERT INTO public.dwarf_planets VALUES ('Eris', 3, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 10, 47, 2.537, false, false, 'Great Spiral Galaxy', 'Andromeda');
INSERT INTO public.galaxy VALUES (2, 14, 52850, 0, true, false, 'Spiral Galaxy', 'Milky Way');
INSERT INTO public.galaxy VALUES (3, 21, 85000, 20.87, false, false, 'Spiral Galaxy', 'Pinwheel Galaxy');
INSERT INTO public.galaxy VALUES (4, 4, 30000, 2.73, false, false, 'Spiral Galaxy', 'Triangulum Galaxy');
INSERT INTO public.galaxy VALUES (5, 12750, 60500, 612.8, false, true, 'Ring Galaxy', 'Hoags Object');
INSERT INTO public.galaxy VALUES (6, 300, 65000, 489.2, false, false, 'Lenticular Ring Galaxy', 'Cartwheel Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('The Moon', 1, 1, 1737.4, 0.0123);
INSERT INTO public.moon VALUES ('Titan', 2, 6, 2574.73, 0.0225);
INSERT INTO public.moon VALUES ('Callisto', 3, 5, 2410.3, 0.018);
INSERT INTO public.moon VALUES ('Europa', 4, 5, 1560.8, 0.008);
INSERT INTO public.moon VALUES ('Io', 5, 5, 1821.6, 0.015);
INSERT INTO public.moon VALUES ('Mimas', 6, 6, 198.2, 0.0000063);
INSERT INTO public.moon VALUES ('Ganymede', 7, 5, 2634.1, 0.025);
INSERT INTO public.moon VALUES ('Enceladus', 8, 6, 252.1, 0.000018);
INSERT INTO public.moon VALUES ('Iapetus', 9, 6, 734.5, 0.00018);
INSERT INTO public.moon VALUES ('Dione', 10, 6, 561.4, 0.0001834);
INSERT INTO public.moon VALUES ('Tethys', 11, 6, 531.1, 0.000103);
INSERT INTO public.moon VALUES ('Triton', 12, 8, 1353.4, 0.00359);
INSERT INTO public.moon VALUES ('Phobos', 13, 4, 11.2667, 0.000000001784);
INSERT INTO public.moon VALUES ('Titania', 14, 7, 788.4, 0.000584);
INSERT INTO public.moon VALUES ('Oberon', 15, 7, 761.4, 0.0003076);
INSERT INTO public.moon VALUES ('Umbriel', 16, 7, 584.7, 0.0001275);
INSERT INTO public.moon VALUES ('Ariel', 17, 7, 578.9, 0.0001251);
INSERT INTO public.moon VALUES ('Rhea', 18, 6, 763.8, 0.00039);
INSERT INTO public.moon VALUES ('Miranda', 19, 7, 235.8, 0.00064);
INSERT INTO public.moon VALUES ('Hyperion', 20, 6, 135, 0.0000562);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, true, 2, 'Rocky Planet', false);
INSERT INTO public.planet VALUES ('Mercury', 2, false, 2, 'Rocky Planet', false);
INSERT INTO public.planet VALUES ('Venus', 3, false, 2, 'Rocky Planet', false);
INSERT INTO public.planet VALUES ('Mars', 4, true, 2, 'Rocky Planet', false);
INSERT INTO public.planet VALUES ('Jupiter', 5, true, 2, 'Gas Giant', true);
INSERT INTO public.planet VALUES ('Saturn', 6, true, 2, 'Gas Giant', true);
INSERT INTO public.planet VALUES ('Uranus
', 7, true, 2, 'Ice Giant', true);
INSERT INTO public.planet VALUES ('Neptune', 8, true, 2, 'Ice Giant', true);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 9, false, 6, 'Rocky Planet', true);
INSERT INTO public.planet VALUES ('Kepler-62f', 10, false, 7, 'Rocky Planet', true);
INSERT INTO public.planet VALUES ('Kepler-62e', 11, false, 7, 'Rocky Planet', true);
INSERT INTO public.planet VALUES ('Kepler-62d', 12, false, 7, 'Gas Giant', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Red Giant', 2.49, 100, 'Mirach');
INSERT INTO public.star VALUES (2, 2, 'Yellow Dwarf', 1, 1, 'The Sun');
INSERT INTO public.star VALUES (3, 4, 'Luminous Blue Variable Star', 60, 150, 'Var 83');
INSERT INTO public.star VALUES (4, 5, 'Cool Red Giant Star', 3.9, 239, 'Tau4 Serpentis');
INSERT INTO public.star VALUES (5, 6, 'SX-Arietis Type Variable Star', 5.01, 7.52, 'Alpha Sculptoris');
INSERT INTO public.star VALUES (6, 2, 'Red Dwarf', 0.1221, 0.1542, 'Proxima Centauri');
INSERT INTO public.star VALUES (7, 2, 'Orange Dwarf', 0.69, 0.64, 'Kepler-62');


--
-- Name: dwarf_planets_dwarf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planets_dwarf_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: dwarf_planets dwarf_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets
    ADD CONSTRAINT dwarf_planets_name_key UNIQUE (name);


--
-- Name: dwarf_planets dwarf_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets
    ADD CONSTRAINT dwarf_planets_pkey PRIMARY KEY (dwarf_planets_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
