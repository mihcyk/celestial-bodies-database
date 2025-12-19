--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    discovery_year integer,
    distance_from_earth_in_mly numeric,
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_b_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_b_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_b_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_b_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_b_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    discovery_year integer,
    distance_from_earth_in_mly numeric,
    visible_from_earth boolean
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
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    discovery_year integer,
    distance_from_earth_in_au numeric,
    planet_id integer,
    visible_from_earth boolean
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
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    discovery_year integer,
    distance_from_earth_in_au numeric,
    star_id integer,
    visible_from_earth boolean
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
    name character varying(40) NOT NULL,
    description text,
    discovery_year integer,
    distance_from_earth_in_ly numeric,
    galaxy_id integer,
    visible_from_earth boolean
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_b_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 'Supermassive black hole at the center of the Milky Way galaxy, first imaged in 2022.', 1974, 0.00008, 1);
INSERT INTO public.black_hole VALUES (2, 'M31*', 'Supermassive black hole at the center of Andromeda galaxy.', 1993, 2.5, 2);
INSERT INTO public.black_hole VALUES (3, 'M33 X-7 BH', 'Stellar-mass black hole in Triangulum galaxy, one of the most massive known.', 2007, 2.7, 3);
INSERT INTO public.black_hole VALUES (4, 'LMC X-1', 'Confirmed stellar-mass black hole in binary system in Large Magellanic Cloud.', 1971, 0.163, 4);
INSERT INTO public.black_hole VALUES (5, 'SMC X-1', 'High-mass X-ray binary containing a black hole in Small Magellanic Cloud.', 1972, 0.2, 5);
INSERT INTO public.black_hole VALUES (6, 'Centaurus A BH', 'Active supermassive black hole powering radio jets in Centaurus A galaxy.', 1970, 13.7, 6);
INSERT INTO public.black_hole VALUES (7, 'M87*', 'Supermassive black hole in Messier 87 galaxy, first black hole ever directly imaged in 2019.', 1978, 53.5, 7);
INSERT INTO public.black_hole VALUES (8, 'Sombrero BH', 'Supermassive black hole at the center of Sombrero Galaxy (M104).', 1990, 29.3, 8);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home spiral galaxy with a central bar and supermassive black hole Sagittarius A*.', NULL, 0.000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major spiral galaxy, on collision course with Milky Way in billions of years.', 964, 2.500, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest in Local Group, face-on spiral galaxy.', 1654, 2.700, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular satellite galaxy visible from Southern Hemisphere.', 1519, 0.163, true);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Dwarf irregular galaxy, companion to LMC.', 1519, 0.200, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical radio galaxy with active nucleus and dust lane.', 1826, 13.700, false);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 'Giant elliptical galaxy with famous jet and imaged black hole.', 1781, 53.500, false);
INSERT INTO public.galaxy VALUES (8, 'Sombrero Galaxy', 'Spiral galaxy with prominent dust lane resembling a hat.', 1781, 29.300, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite, tidally locked.', NULL, 1.000, 3, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger Martian moon, potato-shaped, doomed to crash.', 1877, 1.520, 4, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller Martian moon, captured asteroid.', 1877, 1.520, 4, false);
INSERT INTO public.moon VALUES (4, 'Io', 'Most volcanically active body in Solar System.', 1610, 5.200, 5, false);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon with subsurface ocean, potential for life.', 1610, 5.200, 5, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in Solar System, own magnetic field.', 1610, 5.200, 5, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered, ancient surface.', 1610, 5.200, 5, false);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Small inner Jovian moon, reddish color.', 1892, 5.200, 5, false);
INSERT INTO public.moon VALUES (9, 'Himalia', 'Irregular outer moon of Jupiter.', 1904, 5.200, 5, false);
INSERT INTO public.moon VALUES (10, 'Titan', 'Largest Saturnian moon, thick atmosphere, lakes of methane.', 1655, 9.580, 6, false);
INSERT INTO public.moon VALUES (11, 'Enceladus', 'Icy moon with geysers, subsurface ocean.', 1789, 9.580, 6, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 'Icy moon with huge crater Odysseus.', 1684, 9.580, 6, false);
INSERT INTO public.moon VALUES (13, 'Dione', 'Icy moon with wispy terrain.', 1684, 9.580, 6, false);
INSERT INTO public.moon VALUES (14, 'Rhea', 'Second-largest Saturnian moon, possible rings.', 1672, 9.580, 6, false);
INSERT INTO public.moon VALUES (15, 'Iapetus', 'Two-toned moon, one side bright, one dark.', 1671, 9.580, 6, false);
INSERT INTO public.moon VALUES (16, 'Mimas', 'Death Star-like moon with huge Herschel crater.', 1789, 9.580, 6, false);
INSERT INTO public.moon VALUES (17, 'Hyperion', 'Chaotic rotator, sponge-like appearance.', 1848, 9.580, 6, false);
INSERT INTO public.moon VALUES (18, 'Phoebe', 'Captured outer moon, retrograde orbit.', 1899, 9.580, 6, false);
INSERT INTO public.moon VALUES (19, 'Titania', 'Largest Uranian moon, lightly cratered.', 1787, 19.200, 7, false);
INSERT INTO public.moon VALUES (20, 'Oberon', 'Outer Uranian moon, dark surface.', 1787, 19.200, 7, false);
INSERT INTO public.moon VALUES (21, 'Ariel', 'Brightest Uranian moon, canyons.', 1851, 19.200, 7, false);
INSERT INTO public.moon VALUES (22, 'Umbriel', 'Darkest major Uranian moon.', 1851, 19.200, 7, false);
INSERT INTO public.moon VALUES (23, 'Miranda', 'Uranian moon with extreme geology, cliffs.', 1948, 19.200, 7, false);
INSERT INTO public.moon VALUES (24, 'Triton', 'Largest Neptunian moon, retrograde, geysers.', 1846, 30.050, 8, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet, no atmosphere, extreme temperatures.', NULL, 0.610, 1, true);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet, thick CO2 atmosphere, runaway greenhouse.', NULL, 0.720, 1, true);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home, only known life-bearing planet.', NULL, 1.000, 1, false);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red planet, thin atmosphere, evidence of past water.', NULL, 1.520, 1, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest gas giant, Great Red Spot storm.', NULL, 5.200, 1, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Ringed gas giant, low density.', NULL, 9.580, 1, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant, tilted axis, faint rings.', 1781, 19.200, 1, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Windiest ice giant, deep blue color.', 1846, 30.050, 1, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Earth-sized exoplanet in habitable zone.', 2016, 4.250, 3, false);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 'Controversial hot rocky exoplanet very close to Alpha Centauri B (detection later disputed).', 2012, 4.370, 3, false);
INSERT INTO public.planet VALUES (11, 'Betelgeuse b', 'Hypothetical gas giant in the outer habitable zone of the red supergiant Betelgeuse.', NULL, 548.000, 4, false);
INSERT INTO public.planet VALUES (12, 'R136a1 b', 'Imaginary super-Jovian planet surviving in the extreme environment around the most massive known star.', NULL, 0.163, 5, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our G-type main-sequence star, center of Solar System.', NULL, 0.000, 1, true);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in night sky, binary system with white dwarf.', -300, 8.600, 1, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Closest star system, triple including Proxima Centauri.', 1915, 4.370, 1, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant in Orion, variable and nearing supernova.', -300, 548.000, 1, true);
INSERT INTO public.star VALUES (5, 'R136a1', 'Most massive known star, Wolf-Rayet type, extremely luminous.', 1985, 0.163, 4, false);
INSERT INTO public.star VALUES (6, 'SN 1987A progenitor', 'Blue supergiant that exploded as supernova in 1987.', NULL, 0.163, 4, false);
INSERT INTO public.star VALUES (7, 'Hypervelocity star HE 0437-5439', 'Star ejected from LMC, heading towards Milky Way.', 2005, 0.200, 5, false);
INSERT INTO public.star VALUES (8, 'M87 Jet Star', 'Hypothetical star near the jet in M87 galaxy.', NULL, 53.500, 7, false);


--
-- Name: black_hole_b_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_b_hole_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

