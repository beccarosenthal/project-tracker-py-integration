--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: grades; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE grades (
    id integer NOT NULL,
    student_github character varying(30),
    project_title text,
    grade integer
);


ALTER TABLE grades OWNER TO "user";

--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE grades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grades_id_seq OWNER TO "user";

--
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE grades_id_seq OWNED BY grades.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE projects (
    id integer NOT NULL,
    title character varying(30),
    description text,
    max_grade integer
);


ALTER TABLE projects OWNER TO "user";

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO "user";

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE students (
    id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    github character varying(30)
);


ALTER TABLE students OWNER TO "user";

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE students_id_seq OWNER TO "user";

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE students_id_seq OWNED BY students.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY grades ALTER COLUMN id SET DEFAULT nextval('grades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY students ALTER COLUMN id SET DEFAULT nextval('students_id_seq'::regclass);


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: user
--

COPY grades (id, student_github, project_title, grade) FROM stdin;
1	jhacks	Markov	10
2	jhacks	Blockly	2
3	sdevelops	Markov	50
4	sdevelops	Blockly	100
5	sdevelops	CSS Hell	67
6	sdevelops	HTML HEAVEN	74
7	sdevelops	JSON Dating Game	69
8	sdevelops	Obscenicorn	69
9	jhacks	Obscenicorn	68
\.


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('grades_id_seq', 9, true);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: user
--

COPY projects (id, title, description, max_grade) FROM stdin;
1	Markov	Tweets generated from Markov chains	50
2	Blockly	Programatic logic puzzle game	100
3	Obscenicorn	Try not to annoy your classmates	69
4	CSS Hell	Try to make a website not look like crap despite the css syntax	75
5	HTML Heaven	Try not to get stuck in the clouds with magestic HTML	75
6	JSON Dating Game	Use the eventbrite API to play with JSON	85
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('projects_id_seq', 6, true);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: user
--

COPY students (id, first_name, last_name, github) FROM stdin;
1	Sarah	Developer	sdevelops
2	Jane	Hacker	jhacks
\.


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('students_id_seq', 2, true);


--
-- Name: grades_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: students_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
