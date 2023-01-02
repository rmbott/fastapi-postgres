-- You will need to initialize Postgres database for this example.
-- Here is how I did that on linux. After installing Postgres (I was 
-- using version 14.6), run the following:

sudo -i -u postgres
createdb pcdb
psql -d pcdb
CREATE USER pcdbadmin WITH PASSWORD 'secret' CREATEDB NOCREATEROLE LOGIN;
GRANT ALL PRIVILEGES ON DATABASE "pcdb" to pcdbadmin;

-- SQLAlchemy will initilize the users and items tables for you. I've
-- included a dump of the users and items tables that were 
-- initialized by SQLAlchemy.

--
-- PostgreSQL database dump - table "users"
--

-- Dumped from database version 14.6
-- Dumped by pg_dump version 14.6

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
-- Name: users; Type: TABLE; Schema: public; Owner: pcdbadmin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying,
    hashed_password character varying,
    is_active boolean
);


ALTER TABLE public.users OWNER TO pcdbadmin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: pcdbadmin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO pcdbadmin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pcdbadmin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: pcdbadmin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: pcdbadmin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: pcdbadmin
--

CREATE UNIQUE INDEX ix_users_email ON public.users USING btree (email);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: pcdbadmin
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- PostgreSQL database dump complete
--




---------------------------------------------------------------------



--
-- PostgreSQL database dump - table "items
--

-- Dumped from database version 14.6
-- Dumped by pg_dump version 14.6

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
-- Name: items; Type: TABLE; Schema: public; Owner: pcdbadmin
--

CREATE TABLE public.items (
    id integer NOT NULL,
    title character varying,
    description character varying,
    owner_id integer
);


ALTER TABLE public.items OWNER TO pcdbadmin;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: pcdbadmin
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO pcdbadmin;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pcdbadmin
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: pcdbadmin
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: pcdbadmin
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: ix_items_description; Type: INDEX; Schema: public; Owner: pcdbadmin
--

CREATE INDEX ix_items_description ON public.items USING btree (description);


--
-- Name: ix_items_id; Type: INDEX; Schema: public; Owner: pcdbadmin
--

CREATE INDEX ix_items_id ON public.items USING btree (id);


--
-- Name: ix_items_title; Type: INDEX; Schema: public; Owner: pcdbadmin
--

CREATE INDEX ix_items_title ON public.items USING btree (title);


--
-- Name: items items_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pcdbadmin
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

