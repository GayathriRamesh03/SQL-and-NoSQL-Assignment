--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    student_id integer NOT NULL,
    street character varying(100),
    city character varying(50),
    state character varying(50)
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    id integer NOT NULL,
    name character varying(50),
    description text
);


ALTER TABLE public.course OWNER TO postgres;

--
-- Name: enrollment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollment (
    student_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.enrollment OWNER TO postgres;

--
-- Name: marks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marks (
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    score integer
);


ALTER TABLE public.marks OWNER TO postgres;

--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    name character varying(50),
    email character varying(100),
    phone character varying(15),
    graduated boolean DEFAULT false
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (student_id, street, city, state) FROM stdin;
102	2nd Street	Bangalore	KA
103	3rd Street	Mumbai	MH
101	1st Street	xyz	TN
206	XYZ Street	xyz	TN
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (id, name, description) FROM stdin;
201	Maths	Basic Math
202	Physics	Fundamentals of Physics
203	English	English Literature
204	Chemistry	Organic and Inorganic Chemistry
\.


--
-- Data for Name: enrollment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollment (student_id, course_id) FROM stdin;
101	201
101	202
102	201
102	202
103	202
102	204
103	201
103	203
207	201
208	201
209	201
\.


--
-- Data for Name: marks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marks (student_id, course_id, score) FROM stdin;
101	201	95
101	202	87
102	201	76
102	202	91
103	202	35
207	201	91
208	201	89
209	201	85
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, name, email, phone, graduated) FROM stdin;
103	C	c@mail.com	7777777777	f
105	E	e@mail.com	6666666666	f
206	F	f@mail.com	9876543200	f
101	A	a@mail.com	8888888888	t
102	B	b@mail.com	8888888888	t
207	G	g@mail.com	9000000001	f
208	H	h@mail.com	9000000002	f
209	I	i@mail.com	9000000003	f
\.


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (student_id);


--
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- Name: enrollment enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (student_id, course_id);


--
-- Name: marks marks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_pkey PRIMARY KEY (student_id, course_id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: address address_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: enrollment enrollment_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: enrollment enrollment_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: marks marks_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: marks marks_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- PostgreSQL database dump complete
--

