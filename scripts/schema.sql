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
    "position" integer NOT NULL,
    CONSTRAINT ch_columns_column_name CHECK (((column_name)::text <> ''::text)),
    CONSTRAINT ch_columns_position CHECK (("position" >= 1))
);


ALTER TABLE public.columns OWNER TO postgres;

--
-- Name: constraint_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constraint_columns (
    constraint_id integer NOT NULL,
    column_id integer NOT NULL,
    column_order integer NOT NULL,
    CONSTRAINT ch_constraint_columns_column_order CHECK ((column_order >= 1))
);


ALTER TABLE public.constraint_columns OWNER TO postgres;

--
-- Name: constraint_referenced_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constraint_referenced_columns (
    constraint_id integer NOT NULL,
    referenced_column_id integer NOT NULL,
    column_order integer NOT NULL,
    CONSTRAINT ch_constraint_referenced_columns_column_order CHECK ((column_order >= 1))
);


ALTER TABLE public.constraint_referenced_columns OWNER TO postgres;

--
-- Name: constraint_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constraint_types (
    constraint_type_id integer NOT NULL,
    constraint_type_name character varying(255) NOT NULL,
    CONSTRAINT ch_constraint_types_constraint_type_name CHECK (((constraint_type_name)::text <> ''::text))
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
    expression text,
    CONSTRAINT ch_constraints_constraint_name CHECK (((constraint_name)::text <> ''::text))
);


ALTER TABLE public.constraints OWNER TO postgres;

--
-- Name: data_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_types (
    data_type_id integer NOT NULL,
    data_type_name character varying(255) NOT NULL,
    description text,
    CONSTRAINT ch_data_types_data_type_name CHECK (((data_type_name)::text <> ''::text))
);


ALTER TABLE public.data_types OWNER TO postgres;

--
-- Name: privilege_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privilege_types (
    privilege_type_id integer NOT NULL,
    privilege_type_name character varying(255) NOT NULL,
    description text,
    CONSTRAINT ch_privilege_types_privilege_type_name CHECK (((privilege_type_name)::text <> ''::text))
);


ALTER TABLE public.privilege_types OWNER TO postgres;

--
-- Name: privileges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privileges (
    privilege_id integer NOT NULL,
    privilege_name character varying(255) NOT NULL,
    privilege_type_id integer NOT NULL,
    description text,
    CONSTRAINT ch_privileges_privilege_name CHECK (((privilege_name)::text <> ''::text))
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
    description text,
    CONSTRAINT ch_roles_role_name CHECK (((role_name)::text <> ''::text))
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: schemas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schemas (
    schema_id integer NOT NULL,
    schema_name character varying(255) NOT NULL,
    owner_id integer NOT NULL,
    CONSTRAINT ch_schemas_schema_name CHECK (((schema_name)::text <> ''::text))
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
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT ch_tables_table_name CHECK (((table_name)::text <> ''::text))
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
    session_token character varying(255),
    CONSTRAINT ch_user_sessions_logout_time CHECK (((logout_time IS NULL) OR (logout_time > login_time))),
    CONSTRAINT ch_user_sessions_session_token CHECK (((session_token IS NULL) OR ((session_token)::text <> ''::text)))
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
    email character varying(255),
    CONSTRAINT ch_users_email CHECK (((email)::text ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'::text))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.columns (column_id, table_id, column_name, data_type_id, is_nullable, default_value, "position") FROM stdin;
1	1	user_id	1	f	\N	1
2	1	user_name	2	f	\N	2
3	1	password_hash	2	f	\N	3
4	1	registration_time	3	f	CURRENT_TIMESTAMP	4
5	1	email	2	t	\N	5
6	2	schema_id	1	f	\N	1
7	2	schema_name	2	f	\N	2
8	2	owner_id	1	f	\N	3
9	3	data_type_id	1	f	\N	1
10	3	data_type_name	2	f	\N	2
11	3	description	4	t	\N	3
12	4	table_id	1	f	\N	1
13	4	schema_id	1	f	\N	2
14	4	table_name	2	f	\N	3
15	4	owner_id	1	f	\N	4
16	4	created_at	3	f	CURRENT_TIMESTAMP	5
17	5	column_id	1	f	\N	1
18	5	table_id	1	f	\N	2
19	5	column_name	2	f	\N	3
20	5	data_type_id	1	f	\N	4
21	5	is_nullable	5	f	FALSE	5
22	5	default_value	4	t	\N	6
23	5	position	1	f	\N	7
24	6	constraint_type_id	1	f	\N	1
25	6	constraint_type_name	2	f	\N	2
26	7	constraint_id	1	f	\N	1
27	7	constraint_name	2	f	\N	2
28	7	constraint_type_id	1	f	\N	3
29	7	table_id	1	f	\N	4
30	7	referenced_table_id	1	t	\N	5
31	7	expression	4	t	\N	6
32	8	constraint_id	1	f	\N	1
33	8	column_id	1	f	\N	2
34	8	column_order	1	f	\N	3
35	9	constraint_id	1	f	\N	1
36	9	referenced_column_id	1	f	\N	2
37	9	column_order	1	f	\N	3
38	10	role_id	1	f	\N	1
39	10	role_name	2	f	\N	2
40	10	description	4	t	\N	3
41	11	privilege_type_id	1	f	\N	1
42	11	privilege_type_name	2	f	\N	2
43	11	description	4	t	\N	3
44	12	privilege_id	1	f	\N	1
45	12	privilege_name	2	f	\N	2
46	12	privilege_type_id	1	f	\N	3
47	12	description	4	t	\N	4
48	13	system_privilege_id	1	f	\N	1
49	13	privilege_id	1	f	\N	2
50	13	description	4	t	\N	3
51	14	user_id	1	f	\N	1
52	14	role_id	1	f	\N	2
53	15	role_id	1	f	\N	1
54	15	privilege_id	1	f	\N	2
55	15	table_id	1	t	\N	3
56	16	user_id	1	f	\N	1
57	16	privilege_id	1	f	\N	2
58	16	table_id	1	t	\N	3
59	17	session_id	1	f	\N	1
60	17	user_id	1	f	\N	2
61	17	login_time	3	f	\N	3
62	17	logout_time	3	t	\N	4
63	17	session_token	2	t	\N	5
\.


--
-- Data for Name: constraint_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constraint_columns (constraint_id, column_id, column_order) FROM stdin;
1	1	1
2	2	1
3	5	1
4	5	1
5	6	1
6	7	1
7	7	1
8	8	1
9	9	1
10	10	1
11	10	1
12	12	1
13	14	1
14	14	1
15	13	1
16	15	1
17	17	1
18	18	1
18	19	2
19	18	1
19	23	2
20	19	1
21	23	1
22	18	1
23	20	1
24	24	1
25	25	1
26	25	1
27	26	1
28	27	1
29	27	1
30	28	1
31	29	1
32	30	1
33	32	1
33	33	2
34	34	1
35	32	1
36	33	1
37	35	1
37	36	2
38	37	1
39	35	1
40	36	1
41	38	1
42	39	1
43	39	1
44	41	1
45	42	1
46	42	1
47	44	1
48	45	1
49	45	1
50	46	1
51	48	1
52	49	1
53	49	1
54	51	1
54	52	2
55	51	1
56	52	1
57	53	1
57	54	2
58	53	1
59	54	1
60	55	1
61	56	1
61	57	2
62	56	1
63	57	1
64	58	1
65	59	1
66	63	1
67	61	1
67	62	2
68	63	1
69	60	1
\.


--
-- Data for Name: constraint_referenced_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constraint_referenced_columns (constraint_id, referenced_column_id, column_order) FROM stdin;
8	1	1
15	6	1
16	1	1
22	12	1
23	9	1
30	24	1
31	12	1
32	12	1
35	26	1
36	17	1
39	26	1
40	17	1
50	41	1
55	1	1
56	38	1
58	38	1
59	44	1
60	12	1
62	1	1
63	44	1
64	12	1
69	1	1
53	44	1
\.


--
-- Data for Name: constraint_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constraint_types (constraint_type_id, constraint_type_name) FROM stdin;
1	PRIMARY KEY
2	UNIQUE
3	CHECK
4	FOREIGN KEY
\.


--
-- Data for Name: constraints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constraints (constraint_id, constraint_name, constraint_type_id, table_id, referenced_table_id, expression) FROM stdin;
1	PK_users_user_id	1	1	\N	\N
2	UQ_users_user_name	2	1	\N	\N
3	UQ_users_email	2	1	\N	\N
4	CH_users_email	3	1	\N	email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'
5	PK_schemas_schema_id	1	2	\N	\N
6	UQ_schemas_schema_name	2	2	\N	\N
7	CH_schemas_schema_name	3	2	\N	schema_name <> ''
8	FK_schemas_owner_id	4	2	1	\N
9	PK_data_types_data_type_id	1	3	\N	\N
10	UQ_data_types_data_type_name	2	3	\N	\N
11	CH_data_types_data_type_name	3	3	\N	data_type_name <> ''
12	PK_tables_table_id	1	4	\N	\N
13	UQ_tables_table_name	2	4	\N	\N
14	CH_tables_table_name	3	4	\N	table_name <> ''
15	FK_tables_schema_id	4	4	2	\N
16	FK_tables_owner_id	4	4	1	\N
17	PK_columns_column_id	1	5	\N	\N
18	UQ_columns_table_id_column_name	2	5	\N	\N
19	UQ_columns_table_id_position	2	5	\N	\N
20	CH_columns_column_name	3	5	\N	column_name <> ''
21	CH_columns_position	3	5	\N	position >= 1
22	FK_columns_table_id	4	5	4	\N
23	FK_columns_data_type_id	4	5	3	\N
24	PK_constraint_types_constraint_type_id	1	6	\N	\N
25	UQ_constraint_types_constraint_type_name	2	6	\N	\N
26	CH_constraint_types_constraint_type_name	3	6	\N	constraint_type_name <> ''
27	PK_constraints_constraint_id	1	7	\N	\N
28	UQ_constraints_constraint_name	2	7	\N	\N
29	CH_constraints_constraint_name	3	7	\N	constraint_name <> ''
30	FK_constraints_constraint_type_id	4	7	6	\N
31	FK_constraints_table_id	4	7	4	\N
32	FK_constraints_referenced_table_id	4	7	4	\N
33	PK_constraint_columns_constraint_id_column_id	1	8	\N	\N
34	CH_constraint_columns_column_order	3	8	\N	column_order >= 1
35	FK_constraint_columns_constraint_id	4	8	7	\N
36	FK_constraint_columns_column_id	4	8	5	\N
37	PK_constraint_referenced_columns_constraint_id_referenced_column_id	1	9	\N	\N
38	CH_constraint_referenced_columns_column_order	3	9	\N	column_order >= 1
39	FK_constraint_referenced_columns_constraint_id	4	9	7	\N
40	FK_constraint_referenced_columns_referenced_column_id	4	9	5	\N
41	PK_roles_role_id	1	10	\N	\N
42	UQ_roles_role_name	2	10	\N	\N
43	CH_roles_role_name	3	10	\N	role_name <> ''
44	PK_privilege_types_privilege_type_id	1	11	\N	\N
45	UQ_privilege_types_privilege_type_name	2	11	\N	\N
46	CH_privilege_types_privilege_type_name	3	11	\N	privilege_type_name <> ''
47	PK_privileges_privilege_id	1	12	\N	\N
48	UQ_privileges_privilege_name	2	12	\N	\N
49	CH_privileges_privilege_name	3	12	\N	privilege_name <> ''
50	FK_privileges_privilege_type_id	4	12	11	\N
51	PK_system_privileges_system_privilege_id	1	13	\N	\N
52	UQ_system_privileges_privilege_id	2	13	\N	\N
53	FK_system_privileges_privilege_id	4	13	12	\N
54	PK_user_roles_user_id_role_id	1	14	\N	\N
55	FK_user_roles_user_id	4	14	1	\N
56	FK_user_roles_role_id	4	14	10	\N
57	PK_role_privileges_role_id_privilege_id	1	15	\N	\N
58	FK_role_privileges_role_id	4	15	10	\N
59	FK_role_privileges_privilege_id	4	15	12	\N
60	FK_role_privileges_table_id	4	15	4	\N
61	PK_user_privileges_user_id_privilege_id	1	16	\N	\N
62	FK_user_privileges_user_id	4	16	1	\N
63	FK_user_privileges_privilege_id	4	16	12	\N
64	FK_user_privileges_table_id	4	16	4	\N
65	PK_user_sessions_session_id	1	17	\N	\N
66	UQ_user_sessions_session_token	2	17	\N	\N
67	CH_user_sessions_logout_time	3	17	\N	logout_time IS NULL OR logout_time > login_time
68	CH_user_sessions_session_token	3	17	\N	session_token IS NULL OR session_token <> ''
69	FK_user_sessions_user_id	4	17	1	\N
\.


--
-- Data for Name: data_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_types (data_type_id, data_type_name, description) FROM stdin;
1	INTEGER	32-bit integer
2	VARCHAR	Variable-length character string
3	TIMESTAMP	Date and time with timezone
4	TEXT	Unlimited-length text
5	BOOLEAN	True/false value
\.


--
-- Data for Name: privilege_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privilege_types (privilege_type_id, privilege_type_name, description) FROM stdin;
1	TABLE	Privilege for table-level operations
2	SYSTEM	Privilege for system-level operations
3	ROLE	Privilege for role management
\.


--
-- Data for Name: privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privileges (privilege_id, privilege_name, privilege_type_id, description) FROM stdin;
1	SELECT_TABLE	1	Permission to select from tables
\.


--
-- Data for Name: role_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_privileges (role_id, privilege_id, table_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, role_name, description) FROM stdin;
1	admin_role	Administrator role with full access
\.


--
-- Data for Name: schemas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schemas (schema_id, schema_name, owner_id) FROM stdin;
1	public	1
\.


--
-- Data for Name: system_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_privileges (system_privilege_id, privilege_id, description) FROM stdin;
1	1	System-wide select privilege
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tables (table_id, schema_id, table_name, owner_id, created_at) FROM stdin;
1	1	users	1	2025-05-11 18:34:16.89725
2	1	schemas	1	2025-05-11 18:34:16.89725
3	1	data_types	1	2025-05-11 18:34:16.89725
4	1	tables	1	2025-05-11 18:34:16.89725
5	1	columns	1	2025-05-11 18:34:16.89725
6	1	constraint_types	1	2025-05-11 18:34:16.89725
7	1	constraints	1	2025-05-11 18:34:16.89725
8	1	constraint_columns	1	2025-05-11 18:34:16.89725
9	1	constraint_referenced_columns	1	2025-05-11 18:34:16.89725
10	1	roles	1	2025-05-11 18:34:16.89725
11	1	privilege_types	1	2025-05-11 18:34:16.89725
12	1	privileges	1	2025-05-11 18:34:16.89725
13	1	system_privileges	1	2025-05-11 18:34:16.89725
14	1	user_roles	1	2025-05-11 18:34:16.89725
15	1	role_privileges	1	2025-05-11 18:34:16.89725
16	1	user_privileges	1	2025-05-11 18:34:16.89725
17	1	user_sessions	1	2025-05-11 18:34:16.89725
\.


--
-- Data for Name: user_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_privileges (user_id, privilege_id, table_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
1	1
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_sessions (session_id, user_id, login_time, logout_time, session_token) FROM stdin;
1	1	2025-05-11 18:34:16.906013	\N	sample_token
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_name, password_hash, registration_time, email) FROM stdin;
1	admin	hashed_password	2025-05-11 18:34:16.895113	admin@example.com
\.


--
-- Name: columns columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_pkey PRIMARY KEY (column_id);


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
-- Name: constraint_types constraint_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_types
    ADD CONSTRAINT constraint_types_pkey PRIMARY KEY (constraint_type_id);


--
-- Name: constraints constraints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraints
    ADD CONSTRAINT constraints_pkey PRIMARY KEY (constraint_id);


--
-- Name: data_types data_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_pkey PRIMARY KEY (data_type_id);


--
-- Name: privilege_types privilege_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilege_types
    ADD CONSTRAINT privilege_types_pkey PRIMARY KEY (privilege_type_id);


--
-- Name: privileges privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privileges
    ADD CONSTRAINT privileges_pkey PRIMARY KEY (privilege_id);


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
-- Name: schemas schemas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemas
    ADD CONSTRAINT schemas_pkey PRIMARY KEY (schema_id);


--
-- Name: system_privileges system_privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_privileges
    ADD CONSTRAINT system_privileges_pkey PRIMARY KEY (system_privilege_id);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);


--
-- Name: columns uq_columns_table_id_column_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT uq_columns_table_id_column_name UNIQUE (table_id, column_name);


--
-- Name: columns uq_columns_table_id_position; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT uq_columns_table_id_position UNIQUE (table_id, "position");


--
-- Name: constraint_types uq_constraint_types_constraint_type_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_types
    ADD CONSTRAINT uq_constraint_types_constraint_type_name UNIQUE (constraint_type_name);


--
-- Name: constraints uq_constraints_constraint_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraints
    ADD CONSTRAINT uq_constraints_constraint_name UNIQUE (constraint_name);


--
-- Name: data_types uq_data_types_data_type_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT uq_data_types_data_type_name UNIQUE (data_type_name);


--
-- Name: privilege_types uq_privilege_types_privilege_type_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilege_types
    ADD CONSTRAINT uq_privilege_types_privilege_type_name UNIQUE (privilege_type_name);


--
-- Name: privileges uq_privileges_privilege_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privileges
    ADD CONSTRAINT uq_privileges_privilege_name UNIQUE (privilege_name);


--
-- Name: roles uq_roles_role_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT uq_roles_role_name UNIQUE (role_name);


--
-- Name: schemas uq_schemas_schema_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemas
    ADD CONSTRAINT uq_schemas_schema_name UNIQUE (schema_name);


--
-- Name: system_privileges uq_system_privileges_privilege_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_privileges
    ADD CONSTRAINT uq_system_privileges_privilege_id UNIQUE (privilege_id);


--
-- Name: tables uq_tables_table_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT uq_tables_table_name UNIQUE (table_name);


--
-- Name: user_sessions uq_user_sessions_session_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT uq_user_sessions_session_token UNIQUE (session_token);


--
-- Name: users uq_users_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uq_users_email UNIQUE (email);


--
-- Name: users uq_users_user_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uq_users_user_name UNIQUE (user_name);


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
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: columns fk_columns_data_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT fk_columns_data_type_id FOREIGN KEY (data_type_id) REFERENCES public.data_types(data_type_id);


--
-- Name: columns fk_columns_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT fk_columns_table_id FOREIGN KEY (table_id) REFERENCES public.tables(table_id);


--
-- Name: constraint_columns fk_constraint_columns_column_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_columns
    ADD CONSTRAINT fk_constraint_columns_column_id FOREIGN KEY (column_id) REFERENCES public.columns(column_id);


--
-- Name: constraint_columns fk_constraint_columns_constraint_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_columns
    ADD CONSTRAINT fk_constraint_columns_constraint_id FOREIGN KEY (constraint_id) REFERENCES public.constraints(constraint_id);


--
-- Name: constraint_referenced_columns fk_constraint_referenced_columns_constraint_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_referenced_columns
    ADD CONSTRAINT fk_constraint_referenced_columns_constraint_id FOREIGN KEY (constraint_id) REFERENCES public.constraints(constraint_id);


--
-- Name: constraint_referenced_columns fk_constraint_referenced_columns_referenced_column_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraint_referenced_columns
    ADD CONSTRAINT fk_constraint_referenced_columns_referenced_column_id FOREIGN KEY (referenced_column_id) REFERENCES public.columns(column_id);


--
-- Name: constraints fk_constraints_constraint_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraints
    ADD CONSTRAINT fk_constraints_constraint_type_id FOREIGN KEY (constraint_type_id) REFERENCES public.constraint_types(constraint_type_id);


--
-- Name: constraints fk_constraints_referenced_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraints
    ADD CONSTRAINT fk_constraints_referenced_table_id FOREIGN KEY (referenced_table_id) REFERENCES public.tables(table_id);


--
-- Name: constraints fk_constraints_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constraints
    ADD CONSTRAINT fk_constraints_table_id FOREIGN KEY (table_id) REFERENCES public.tables(table_id);


--
-- Name: privileges fk_privileges_privilege_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privileges
    ADD CONSTRAINT fk_privileges_privilege_type_id FOREIGN KEY (privilege_type_id) REFERENCES public.privilege_types(privilege_type_id);


--
-- Name: role_privileges fk_role_privileges_privilege_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT fk_role_privileges_privilege_id FOREIGN KEY (privilege_id) REFERENCES public.privileges(privilege_id);


--
-- Name: role_privileges fk_role_privileges_role_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT fk_role_privileges_role_id FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


--
-- Name: role_privileges fk_role_privileges_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT fk_role_privileges_table_id FOREIGN KEY (table_id) REFERENCES public.tables(table_id);


--
-- Name: schemas fk_schemas_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemas
    ADD CONSTRAINT fk_schemas_owner_id FOREIGN KEY (owner_id) REFERENCES public.users(user_id);


--
-- Name: system_privileges fk_system_privileges_privilege_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_privileges
    ADD CONSTRAINT fk_system_privileges_privilege_id FOREIGN KEY (privilege_id) REFERENCES public.privileges(privilege_id);


--
-- Name: tables fk_tables_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT fk_tables_owner_id FOREIGN KEY (owner_id) REFERENCES public.users(user_id);


--
-- Name: tables fk_tables_schema_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT fk_tables_schema_id FOREIGN KEY (schema_id) REFERENCES public.schemas(schema_id);


--
-- Name: user_privileges fk_user_privileges_privilege_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges
    ADD CONSTRAINT fk_user_privileges_privilege_id FOREIGN KEY (privilege_id) REFERENCES public.privileges(privilege_id);


--
-- Name: user_privileges fk_user_privileges_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges
    ADD CONSTRAINT fk_user_privileges_table_id FOREIGN KEY (table_id) REFERENCES public.tables(table_id);


--
-- Name: user_privileges fk_user_privileges_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges
    ADD CONSTRAINT fk_user_privileges_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: user_roles fk_user_roles_role_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_user_roles_role_id FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


--
-- Name: user_roles fk_user_roles_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_user_roles_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: user_sessions fk_user_sessions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT fk_user_sessions_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

