--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-12-27 10:05:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 16385)
-- Name: applicants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE applicants (
    id integer NOT NULL,
    job_id integer,
    user_id integer,
    arrival timestamp with time zone,
    departure timestamp with time zone
);


ALTER TABLE applicants OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16388)
-- Name: applicants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE applicants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE applicants_id_seq OWNER TO postgres;

--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 184
-- Name: applicants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE applicants_id_seq OWNED BY applicants.id;


--
-- TOC entry 185 (class 1259 OID 16390)
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jobs (
    id integer NOT NULL,
    description character varying
);


ALTER TABLE jobs OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16396)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jobs_id_seq OWNER TO postgres;

--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 186
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jobs_id_seq OWNED BY jobs.id;


--
-- TOC entry 193 (class 1259 OID 16473)
-- Name: schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schedules (
    job_id integer,
    user_id integer,
    id character varying(20) NOT NULL,
    venue_id integer,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    type character varying(5)
);


ALTER TABLE schedules OWNER TO postgres;

--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN schedules.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN schedules.type IS 'Should be either "pend" for pending, or "final" for a finalized schedule.';


--
-- TOC entry 187 (class 1259 OID 16406)
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tasks (
    id integer NOT NULL,
    job_id integer,
    place_id integer
);


ALTER TABLE tasks OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16409)
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_id_seq OWNER TO postgres;

--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 188
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- TOC entry 189 (class 1259 OID 16411)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    password character varying,
    created timestamp with time zone,
    modified timestamp with time zone,
    username character varying,
    email character varying,
    facebook_id character varying(20),
    role character varying DEFAULT 'applicant'::character varying,
    veteran smallint DEFAULT 0
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16418)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 190
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 191 (class 1259 OID 16453)
-- Name: venues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE venues (
    id integer NOT NULL,
    description character varying(50)
);


ALTER TABLE venues OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16456)
-- Name: venues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE venues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE venues_id_seq OWNER TO postgres;

--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 192
-- Name: venues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE venues_id_seq OWNED BY venues.id;


--
-- TOC entry 2017 (class 2604 OID 16420)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY applicants ALTER COLUMN id SET DEFAULT nextval('applicants_id_seq'::regclass);


--
-- TOC entry 2018 (class 2604 OID 16421)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jobs ALTER COLUMN id SET DEFAULT nextval('jobs_id_seq'::regclass);


--
-- TOC entry 2019 (class 2604 OID 16423)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 16424)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 16458)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venues ALTER COLUMN id SET DEFAULT nextval('venues_id_seq'::regclass);


--
-- TOC entry 2027 (class 2606 OID 16426)
-- Name: pk_applicant_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY applicants
    ADD CONSTRAINT pk_applicant_id PRIMARY KEY (id);


--
-- TOC entry 2029 (class 2606 OID 16428)
-- Name: pk_jobs_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT pk_jobs_id PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 16531)
-- Name: pk_schedules; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT pk_schedules PRIMARY KEY (id);


--
-- TOC entry 2031 (class 2606 OID 16430)
-- Name: pk_users_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT pk_users_id PRIMARY KEY (id);


--
-- TOC entry 2033 (class 2606 OID 16463)
-- Name: pk_venues; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venues
    ADD CONSTRAINT pk_venues PRIMARY KEY (id);


--
-- TOC entry 2024 (class 1259 OID 16446)
-- Name: fki_jobs_applicant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_jobs_applicant_id ON applicants USING btree (job_id);


--
-- TOC entry 2034 (class 1259 OID 16484)
-- Name: fki_schedules_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_schedules_job_id ON schedules USING btree (job_id);


--
-- TOC entry 2035 (class 1259 OID 16490)
-- Name: fki_schedules_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_schedules_user_id ON schedules USING btree (user_id);


--
-- TOC entry 2036 (class 1259 OID 16537)
-- Name: fki_schedules_venue_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_schedules_venue_id ON schedules USING btree (venue_id);


--
-- TOC entry 2025 (class 1259 OID 16452)
-- Name: fki_users_applicant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_users_applicant_id ON applicants USING btree (user_id);


--
-- TOC entry 2039 (class 2606 OID 16441)
-- Name: fk_jobs_applicant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY applicants
    ADD CONSTRAINT fk_jobs_applicant_id FOREIGN KEY (job_id) REFERENCES jobs(id);


--
-- TOC entry 2041 (class 2606 OID 16479)
-- Name: fk_schedules_job_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT fk_schedules_job_id FOREIGN KEY (job_id) REFERENCES jobs(id);


--
-- TOC entry 2042 (class 2606 OID 16485)
-- Name: fk_schedules_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT fk_schedules_user_id FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2043 (class 2606 OID 16532)
-- Name: fk_schedules_venue_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT fk_schedules_venue_id FOREIGN KEY (venue_id) REFERENCES venues(id);


--
-- TOC entry 2040 (class 2606 OID 16575)
-- Name: fk_users_applicant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY applicants
    ADD CONSTRAINT fk_users_applicant_id FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


-- Completed on 2016-12-27 10:05:40

--
-- PostgreSQL database dump complete
--

