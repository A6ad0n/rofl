--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.4 (Homebrew)

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
-- Name: columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.columns (
    column_id integer NOT NULL,
    table_id integer NOT NULL,
    column_name character varying(255) NOT NULL,
    data_type_id integer NOT NULL,
    is_nullable boolean DEFAULT false NOT NULL,
    default_value text,
    "position" integer NOT NULL
);


ALTER TABLE public.columns OWNER TO postgres;

--
-- Name: constraint_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constraint_columns (
    constraint_id integer NOT NULL,
    column_id integer NOT NULL,
    column_order integer NOT NULL
);


ALTER TABLE public.constraint_columns OWNER TO postgres;

--
-- Name: constraint_referenced_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constraint_referenced_columns (
    constraint_id integer NOT NULL,
    referenced_column_id integer NOT NULL,
    column_order integer NOT NULL
);


ALTER TABLE public.constraint_referenced_columns OWNER TO postgres;

--
-- Name: constraint_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constraint_types (
    constraint_type_id integer NOT NULL,
    constraint_type_name character varying(255) NOT NULL
);


ALTER TABLE public.constraint_types OWNER TO postgres;

--
-- Name: constraints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constraints (
    constraint_id integer NOT NULL,
    constraint_name character varying(255) NOT NULL,
    constraint_type_id integer NOT NULL,
    table_id integer NOT NULL,
    referenced_table_id integer,
    expression text
);


ALTER TABLE public.constraints OWNER TO postgres;

--
-- Name: data_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_types (
    data_type_id integer NOT NULL,
    data_type_name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.data_types OWNER TO postgres;

--
-- Name: privileges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privileges (
    privilege_id integer NOT NULL,
    privilege_name character varying(255) NOT NULL,
    privilege_type character varying(10) NOT NULL,
    description text
);


ALTER TABLE public.privileges OWNER TO postgres;

--
-- Name: role_privileges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_privileges (
    role_id integer NOT NULL,
    privilege_id integer NOT NULL,
    table_id integer
);


ALTER TABLE public.role_privileges OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role_name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: schemas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schemas (
    schema_id integer NOT NULL,
    schema_name character varying(255) NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.schemas OWNER TO postgres;

--
-- Name: system_privileges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_privileges (
    system_privilege_id integer NOT NULL,
    privilege_id integer NOT NULL,
    description text
);


ALTER TABLE public.system_privileges OWNER TO postgres;

--
-- Name: tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tables (
    table_id integer NOT NULL,
    schema_id integer NOT NULL,
    table_name character varying(255) NOT NULL,
    owner_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tables OWNER TO postgres;

--
-- Name: user_privileges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_privileges (
    user_id integer NOT NULL,
    privilege_id integer NOT NULL,
    table_id integer
);


ALTER TABLE public.user_privileges OWNER TO postgres;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: user_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_sessions (
    session_id integer NOT NULL,
    user_id integer NOT NULL,
    login_time timestamp without time zone NOT NULL,
    logout_time timestamp without time zone,
    session_token character varying(255)
);


ALTER TABLE public.user_sessions OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    registration_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    email character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.columns (column_id, table_id, column_name, data_type_id, is_nullable, default_value, "position") FROM stdin;
\.


--
-- Data for Name: constraint_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constraint_columns (constraint_id, column_id, column_order) FROM stdin;
\.


--
-- Data for Name: constraint_referenced_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constraint_referenced_columns (constraint_id, referenced_column_id, column_order) FROM stdin;
\.


--
-- Data for Name: constraint_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constraint_types (constraint_type_id, constraint_type_name) FROM stdin;
\.


--
-- Data for Name: constraints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constraints (constraint_id, constraint_name, constraint_type_id, table_id, referenced_table_id, expression) FROM stdin;
\.


--
-- Data for Name: data_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_types (data_type_id, data_type_name, description) FROM stdin;
\.


--
-- Data for Name: privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privileges (privilege_id, privilege_name, privilege_type, description) FROM stdin;
\.


--
-- Data for Name: role_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_privileges (role_id, privilege_id, table_id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, role_name, description) FROM stdin;
\.


--
-- Data for Name: schemas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schemas (schema_id, schema_name, owner_id) FROM stdin;
\.


--
-- Data for Name: system_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_privileges (system_privilege_id, privilege_id, description) FROM stdin;
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tables (table_id, schema_id, table_name, owner_id, created_at) FROM stdin;
\.


--
-- Data for Name: user_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_privileges (user_id, privilege_id, table_id) FROM stdin;
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_sessions (session_id, user_id, login_time, logout_time, session_token) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_name, password_hash, registration_time, email) FROM stdin;
\.


--
-- Name: columns columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_pkey PRIMARY KEY (column_id);


--
-- Name: columns columns_table_id_column_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_table_id_column_name_key UNIQUE (table_id, column_name);


--
-- Name: columns columns_table_id_position_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_table_id_position_key UNIQUE (table_id, "position");


--
-- Name: constraint_columns constraint_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_columns
    ADD CONSTRAINT constraint_columns_pkey PRIMARY KEY (constraint_id, column_id);


--
-- Name: constraint_referenced_columns constraint_referenced_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_referenced_columns
    ADD CONSTRAINT constraint_referenced_columns_pkey PRIMARY KEY (constraint_id, referenced_column_id);


--
-- Name: constraint_types constraint_types_constraint_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_types
    ADD CONSTRAINT constraint_types_constraint_type_name_key UNIQUE (constraint_type_name);


--
-- Name: constraint_types constraint_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_types
    ADD CONSTRAINT constraint_types_pkey PRIMARY KEY (constraint_type_id);


--
-- Name: constraints constraints_constraint_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraints
    ADD CONSTRAINT constraints_constraint_name_key UNIQUE (constraint_name);


--
-- Name: constraints constraints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraints
    ADD CONSTRAINT constraints_pkey PRIMARY KEY (constraint_id);


--
-- Name: data_types data_types_data_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_data_type_name_key UNIQUE (data_type_name);


--
-- Name: data_types data_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_pkey PRIMARY KEY (data_type_id);


--
-- Name: privileges privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privileges
    ADD CONSTRAINT privileges_pkey PRIMARY KEY (privilege_id);


--
-- Name: privileges privileges_privilege_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privileges
    ADD CONSTRAINT privileges_privilege_name_key UNIQUE (privilege_name);


--
-- Name: role_privileges role_privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT role_privileges_pkey PRIMARY KEY (role_id, privilege_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: roles roles_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_name_key UNIQUE (role_name);


--
-- Name: schemas schemas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemas
    ADD CONSTRAINT schemas_pkey PRIMARY KEY (schema_id);


--
-- Name: schemas schemas_schema_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemas
    ADD CONSTRAINT schemas_schema_name_key UNIQUE (schema_name);


--
-- Name: system_privileges system_privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_privileges
    ADD CONSTRAINT system_privileges_pkey PRIMARY KEY (system_privilege_id);


--
-- Name: system_privileges system_privileges_privilege_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_privileges
    ADD CONSTRAINT system_privileges_privilege_id_key UNIQUE (privilege_id);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);


--
-- Name: tables tables_table_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_table_name_key UNIQUE (table_name);


--
-- Name: user_privileges user_privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges
    ADD CONSTRAINT user_privileges_pkey PRIMARY KEY (user_id, privilege_id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: user_sessions user_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (session_id);


--
-- Name: user_sessions user_sessions_session_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_session_token_key UNIQUE (session_token);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);


--
-- Name: columns columns_data_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_data_type_id_fkey FOREIGN KEY (data_type_id) REFERENCES public.data_types(data_type_id);


--
-- Name: columns columns_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id);


--
-- Name: constraint_columns constraint_columns_column_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_columns
    ADD CONSTRAINT constraint_columns_column_id_fkey FOREIGN KEY (column_id) REFERENCES public.columns(column_id);


--
-- Name: constraint_columns constraint_columns_constraint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_columns
    ADD CONSTRAINT constraint_columns_constraint_id_fkey FOREIGN KEY (constraint_id) REFERENCES public.constraints(constraint_id);


--
-- Name: constraint_referenced_columns constraint_referenced_columns_constraint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_referenced_columns
    ADD CONSTRAINT constraint_referenced_columns_constraint_id_fkey FOREIGN KEY (constraint_id) REFERENCES public.constraints(constraint_id);


--
-- Name: constraint_referenced_columns constraint_referenced_columns_referenced_column_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_referenced_columns
    ADD CONSTRAINT constraint_referenced_columns_referenced_column_id_fkey FOREIGN KEY (referenced_column_id) REFERENCES public.columns(column_id);


--
-- Name: constraints constraints_constraint_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraints
    ADD CONSTRAINT constraints_constraint_type_id_fkey FOREIGN KEY (constraint_type_id) REFERENCES public.constraint_types(constraint_type_id);


--
-- Name: constraints constraints_referenced_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraints
    ADD CONSTRAINT constraints_referenced_table_id_fkey FOREIGN KEY (referenced_table_id) REFERENCES public.tables(table_id);


--
-- Name: constraints constraints_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraints
    ADD CONSTRAINT constraints_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id);


--
-- Name: role_privileges role_privileges_privilege_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT role_privileges_privilege_id_fkey FOREIGN KEY (privilege_id) REFERENCES public.privileges(privilege_id);


--
-- Name: role_privileges role_privileges_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT role_privileges_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


--
-- Name: role_privileges role_privileges_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT role_privileges_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id);


--
-- Name: schemas schemas_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemas
    ADD CONSTRAINT schemas_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(user_id);


--
-- Name: system_privileges system_privileges_privilege_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_privileges
    ADD CONSTRAINT system_privileges_privilege_id_fkey FOREIGN KEY (privilege_id) REFERENCES public.privileges(privilege_id);


--
-- Name: tables tables_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(user_id);


--
-- Name: tables tables_schema_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_schema_id_fkey FOREIGN KEY (schema_id) REFERENCES public.schemas(schema_id);


--
-- Name: user_privileges user_privileges_privilege_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges
    ADD CONSTRAINT user_privileges_privilege_id_fkey FOREIGN KEY (privilege_id) REFERENCES public.privileges(privilege_id);


--
-- Name: user_privileges user_privileges_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges
    ADD CONSTRAINT user_privileges_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id);


--
-- Name: user_privileges user_privileges_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges
    ADD CONSTRAINT user_privileges_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


--
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: user_sessions user_sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

