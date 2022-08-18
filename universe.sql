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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    distance_from_earth_in_mly numeric(4,2),
    diameter_in_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    planet_type_id integer NOT NULL,
    diameter_in_km integer,
    has_water boolean,
    has_rings boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_in_ly numeric(6,2),
    mass_in_solar_masses numeric(4,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 0.00, 130000);
INSERT INTO public.galaxy VALUES (2, 'Draco II', NULL, 0.07, 120);
INSERT INTO public.galaxy VALUES (3, 'Sagittaurus Dwarf Sphr', 'elliptical', 0.07, 10000);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'spiral', 2.53, 220000);
INSERT INTO public.galaxy VALUES (5, 'Antlia Dwarf', NULL, 4.28, 3000);
INSERT INTO public.galaxy VALUES (6, 'NGC 55', 'spiral', 6.52, 70000);
INSERT INTO public.galaxy VALUES (7, 'IC 3583', 'irregular', 30.12, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3476, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22534, false, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, false, 3);
INSERT INTO public.moon VALUES (4, 'Io', 3642, true, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 3120, true, 2);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5468, true, 2);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820, true, 2);
INSERT INTO public.moon VALUES (8, 'Amalthea', 166, false, 2);
INSERT INTO public.moon VALUES (9, 'Mimas', 386, true, 11);
INSERT INTO public.moon VALUES (10, 'Enceladus', 504, true, 11);
INSERT INTO public.moon VALUES (11, 'Tethys', 1066, true, 11);
INSERT INTO public.moon VALUES (12, 'Dione', 1122, true, 11);
INSERT INTO public.moon VALUES (13, 'Rhea', 1526, true, 11);
INSERT INTO public.moon VALUES (14, 'Titan', 5148, true, 11);
INSERT INTO public.moon VALUES (15, 'Hyperion', 270, false, 11);
INSERT INTO public.moon VALUES (16, 'Triton', 2706, true, 8);
INSERT INTO public.moon VALUES (17, 'Nereid', 340, false, 8);
INSERT INTO public.moon VALUES (18, 'Larissa', 194, false, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 420, false, 8);
INSERT INTO public.moon VALUES (20, 'Despina', 156, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4, 12756, true, false, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', 1, 142984, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 4, 6784, true, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 3, 49582, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri-b', 4, 13776, true, false, 2);
INSERT INTO public.planet VALUES (4, 'Kelt-9b', 1, 400355, false, false, 9);
INSERT INTO public.planet VALUES (5, 'Trappist-1b', 4, 10051, true, false, 11);
INSERT INTO public.planet VALUES (6, 'Kepler-22b', 2, 30359, true, false, 10);
INSERT INTO public.planet VALUES (9, 'Trappist-1e', 4, 11735, true, false, 11);
INSERT INTO public.planet VALUES (10, 'Trappist-1h', 4, 9630, false, false, 11);
INSERT INTO public.planet VALUES (11, 'Saturn', 1, 120536, false, true, 1);
INSERT INTO public.planet VALUES (12, 'Mercury', 4, 4480, false, false, 1);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Gas Giant', 'A giant planet composed mainly of gas');
INSERT INTO public.planet_type VALUES (2, 'Super-Earth', 'A potentially rocky world, larger than Earth');
INSERT INTO public.planet_type VALUES (3, 'Neptune-like', 'Gaseous Worlds around the size of Neptune');
INSERT INTO public.planet_type VALUES (4, 'Terrestrial', 'A rocky world outside our solar sistem');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.00, 1.00, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.24, 0.12, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 8.71, 2.06, 1);
INSERT INTO public.star VALUES (4, 'Ran', 10.47, 0.82, 1);
INSERT INTO public.star VALUES (5, 'Procyon', 11.40, 1.49, 1);
INSERT INTO public.star VALUES (6, 'Gilese 1061', 11.98, 0.11, 1);
INSERT INTO public.star VALUES (7, 'Canis Majoris', 490.00, 13.51, 1);
INSERT INTO public.star VALUES (8, 'Pismis 24-17', 5900.00, 78.03, 1);
INSERT INTO public.star VALUES (9, 'Kelt-9', 615.45, 2.51, 1);
INSERT INTO public.star VALUES (10, 'Kepler-22', 635.00, 0.97, 1);
INSERT INTO public.star VALUES (11, 'Trappist-1', 41.00, 0.08, 1);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_planet_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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
