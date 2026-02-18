--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: assignments; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.assignments (
    id bigint NOT NULL,
    course_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    deadline timestamp(0) without time zone NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.assignments OWNER TO root;

--
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assignments_id_seq OWNER TO root;

--
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.assignments_id_seq OWNED BY public.assignments.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO root;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO root;

--
-- Name: course_students; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.course_students (
    id bigint NOT NULL,
    course_id bigint NOT NULL,
    student_id bigint NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.course_students OWNER TO root;

--
-- Name: course_students_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.course_students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_students_id_seq OWNER TO root;

--
-- Name: course_students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.course_students_id_seq OWNED BY public.course_students.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    lecturer_id bigint NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    kode_matkul character varying(255)
);


ALTER TABLE public.courses OWNER TO root;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_id_seq OWNER TO root;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: discussions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.discussions (
    id bigint NOT NULL,
    course_id bigint NOT NULL,
    user_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    material_id bigint
);


ALTER TABLE public.discussions OWNER TO root;

--
-- Name: discussions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.discussions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.discussions_id_seq OWNER TO root;

--
-- Name: discussions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.discussions_id_seq OWNED BY public.discussions.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO root;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO root;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO root;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO root;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO root;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: materials; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.materials (
    id bigint NOT NULL,
    course_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    file_path character varying(255) NOT NULL,
    file_type character varying(255),
    file_size bigint,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.materials OWNER TO root;

--
-- Name: materials_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.materials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materials_id_seq OWNER TO root;

--
-- Name: materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.materials_id_seq OWNED BY public.materials.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO root;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO root;

--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO root;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO root;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO root;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name text NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO root;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO root;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: replies; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.replies (
    id bigint NOT NULL,
    discussion_id bigint NOT NULL,
    user_id bigint NOT NULL,
    content text NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.replies OWNER TO root;

--
-- Name: replies_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.replies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.replies_id_seq OWNER TO root;

--
-- Name: replies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.replies_id_seq OWNED BY public.replies.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO root;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO root;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO root;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO root;

--
-- Name: submissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.submissions (
    id bigint NOT NULL,
    assignment_id bigint NOT NULL,
    student_id bigint NOT NULL,
    file_path character varying(255) NOT NULL,
    score integer,
    feedback text,
    submitted_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.submissions OWNER TO root;

--
-- Name: submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.submissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submissions_id_seq OWNER TO root;

--
-- Name: submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.submissions_id_seq OWNED BY public.submissions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    nik character varying(16),
    nip character varying(20),
    nim character varying(20),
    jenis_kelamin character varying(255) DEFAULT 'Laki-laki'::character varying NOT NULL,
    tempat_lahir character varying(255),
    tanggal_lahir date,
    alamat text,
    no_hp character varying(15),
    role character varying(255) DEFAULT 'mahasiswa'::character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    remember_token character varying(100),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT users_jenis_kelamin_check CHECK (((jenis_kelamin)::text = ANY ((ARRAY['Laki-laki'::character varying, 'Perempuan'::character varying])::text[]))),
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['admin'::character varying, 'dosen'::character varying, 'mahasiswa'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: assignments id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.assignments ALTER COLUMN id SET DEFAULT nextval('public.assignments_id_seq'::regclass);


--
-- Name: course_students id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.course_students ALTER COLUMN id SET DEFAULT nextval('public.course_students_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: discussions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.discussions ALTER COLUMN id SET DEFAULT nextval('public.discussions_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: materials id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.materials ALTER COLUMN id SET DEFAULT nextval('public.materials_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: replies id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.replies ALTER COLUMN id SET DEFAULT nextval('public.replies_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: submissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.submissions ALTER COLUMN id SET DEFAULT nextval('public.submissions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.assignments (id, course_id, title, description, deadline, deleted_at, created_at, updated_at) FROM stdin;
1	2	php	test	2026-02-19 08:26:13	\N	2026-02-18 07:26:44	2026-02-18 07:26:44
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cache (key, value, expiration) FROM stdin;
e-kampus-cache-1b6453892473a467d07372d45eb05abc2031647a:timer	i:1771426969;	1771426969
e-kampus-cache-1b6453892473a467d07372d45eb05abc2031647a	i:2;	1771426969
e-kampus-cache-spatie.permission.cache	a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:66:{i:0;a:4:{s:1:"a";i:1;s:1:"b";s:15:"view_assignment";s:1:"c";s:3:"web";s:1:"r";a:4:{i:0;i:1;i:1;i:4;i:2;i:2;i:3;i:3;}}i:1;a:4:{s:1:"a";i:2;s:1:"b";s:19:"view_any_assignment";s:1:"c";s:3:"web";s:1:"r";a:4:{i:0;i:1;i:1;i:4;i:2;i:2;i:3;i:3;}}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:17:"create_assignment";s:1:"c";s:3:"web";s:1:"r";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:3;}}i:3;a:4:{s:1:"a";i:4;s:1:"b";s:17:"update_assignment";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:4;a:4:{s:1:"a";i:5;s:1:"b";s:18:"restore_assignment";s:1:"c";s:3:"web";s:1:"r";a:4:{i:0;i:1;i:1;i:4;i:2;i:2;i:3;i:3;}}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:22:"restore_any_assignment";s:1:"c";s:3:"web";s:1:"r";a:4:{i:0;i:1;i:1;i:4;i:2;i:2;i:3;i:3;}}i:6;a:4:{s:1:"a";i:7;s:1:"b";s:20:"replicate_assignment";s:1:"c";s:3:"web";s:1:"r";a:4:{i:0;i:1;i:1;i:4;i:2;i:2;i:3;i:3;}}i:7;a:4:{s:1:"a";i:8;s:1:"b";s:18:"reorder_assignment";s:1:"c";s:3:"web";s:1:"r";a:4:{i:0;i:1;i:1;i:4;i:2;i:2;i:3;i:3;}}i:8;a:4:{s:1:"a";i:9;s:1:"b";s:17:"delete_assignment";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:9;a:4:{s:1:"a";i:10;s:1:"b";s:21:"delete_any_assignment";s:1:"c";s:3:"web";s:1:"r";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:3;}}i:10;a:4:{s:1:"a";i:11;s:1:"b";s:23:"force_delete_assignment";s:1:"c";s:3:"web";s:1:"r";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:3;}}i:11;a:4:{s:1:"a";i:12;s:1:"b";s:27:"force_delete_any_assignment";s:1:"c";s:3:"web";s:1:"r";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:3;}}i:12;a:4:{s:1:"a";i:13;s:1:"b";s:11:"view_course";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:13;a:4:{s:1:"a";i:14;s:1:"b";s:15:"view_any_course";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:14;a:4:{s:1:"a";i:15;s:1:"b";s:13:"create_course";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:15;a:4:{s:1:"a";i:16;s:1:"b";s:13:"update_course";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:16;a:4:{s:1:"a";i:17;s:1:"b";s:14:"restore_course";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:17;a:4:{s:1:"a";i:18;s:1:"b";s:18:"restore_any_course";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:18;a:4:{s:1:"a";i:19;s:1:"b";s:16:"replicate_course";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:19;a:4:{s:1:"a";i:20;s:1:"b";s:14:"reorder_course";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:20;a:4:{s:1:"a";i:21;s:1:"b";s:13:"delete_course";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:21;a:4:{s:1:"a";i:22;s:1:"b";s:17:"delete_any_course";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:22;a:4:{s:1:"a";i:23;s:1:"b";s:19:"force_delete_course";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:23;a:4:{s:1:"a";i:24;s:1:"b";s:23:"force_delete_any_course";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:24;a:4:{s:1:"a";i:25;s:1:"b";s:13:"view_material";s:1:"c";s:3:"web";s:1:"r";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:3;}}i:25;a:4:{s:1:"a";i:26;s:1:"b";s:17:"view_any_material";s:1:"c";s:3:"web";s:1:"r";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:3;}}i:26;a:4:{s:1:"a";i:27;s:1:"b";s:15:"create_material";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:27;a:4:{s:1:"a";i:28;s:1:"b";s:15:"update_material";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:28;a:4:{s:1:"a";i:29;s:1:"b";s:16:"restore_material";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:29;a:4:{s:1:"a";i:30;s:1:"b";s:20:"restore_any_material";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:30;a:4:{s:1:"a";i:31;s:1:"b";s:18:"replicate_material";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:31;a:4:{s:1:"a";i:32;s:1:"b";s:16:"reorder_material";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:32;a:4:{s:1:"a";i:33;s:1:"b";s:15:"delete_material";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:33;a:4:{s:1:"a";i:34;s:1:"b";s:19:"delete_any_material";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:34;a:4:{s:1:"a";i:35;s:1:"b";s:21:"force_delete_material";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:35;a:4:{s:1:"a";i:36;s:1:"b";s:25:"force_delete_any_material";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:36;a:4:{s:1:"a";i:37;s:1:"b";s:9:"view_role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:37;a:4:{s:1:"a";i:38;s:1:"b";s:13:"view_any_role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:38;a:4:{s:1:"a";i:39;s:1:"b";s:11:"create_role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:39;a:4:{s:1:"a";i:40;s:1:"b";s:11:"update_role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:40;a:4:{s:1:"a";i:41;s:1:"b";s:11:"delete_role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:41;a:4:{s:1:"a";i:42;s:1:"b";s:15:"delete_any_role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:42;a:4:{s:1:"a";i:43;s:1:"b";s:9:"view_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:43;a:4:{s:1:"a";i:44;s:1:"b";s:13:"view_any_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:44;a:4:{s:1:"a";i:45;s:1:"b";s:11:"create_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:45;a:4:{s:1:"a";i:46;s:1:"b";s:11:"update_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:46;a:4:{s:1:"a";i:47;s:1:"b";s:12:"restore_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:47;a:4:{s:1:"a";i:48;s:1:"b";s:16:"restore_any_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:48;a:4:{s:1:"a";i:49;s:1:"b";s:14:"replicate_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:49;a:4:{s:1:"a";i:50;s:1:"b";s:12:"reorder_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:50;a:4:{s:1:"a";i:51;s:1:"b";s:11:"delete_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:51;a:4:{s:1:"a";i:52;s:1:"b";s:15:"delete_any_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:52;a:4:{s:1:"a";i:53;s:1:"b";s:17:"force_delete_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:53;a:4:{s:1:"a";i:54;s:1:"b";s:21:"force_delete_any_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:54;a:4:{s:1:"a";i:55;s:1:"b";s:15:"view_my::course";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:55;a:4:{s:1:"a";i:56;s:1:"b";s:17:"create_my::course";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:4;i:1;i:1;}}i:56;a:4:{s:1:"a";i:57;s:1:"b";s:17:"update_my::course";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:4;i:1;i:1;}}i:57;a:4:{s:1:"a";i:58;s:1:"b";s:19:"view_any_my::course";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:4;i:1;i:1;}}i:58;a:4:{s:1:"a";i:59;s:1:"b";s:22:"restore_any_my::course";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:4;i:1;i:1;}}i:59;a:4:{s:1:"a";i:60;s:1:"b";s:21:"delete_any_my::course";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:4;i:1;i:1;}}i:60;a:4:{s:1:"a";i:61;s:1:"b";s:27:"force_delete_any_my::course";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:4;i:1;i:1;}}i:61;a:4:{s:1:"a";i:62;s:1:"b";s:18:"restore_my::course";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:62;a:4:{s:1:"a";i:63;s:1:"b";s:20:"replicate_my::course";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:63;a:4:{s:1:"a";i:64;s:1:"b";s:18:"reorder_my::course";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:64;a:4:{s:1:"a";i:65;s:1:"b";s:17:"delete_my::course";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:65;a:4:{s:1:"a";i:66;s:1:"b";s:23:"force_delete_my::course";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}}s:5:"roles";a:4:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:11:"super_admin";s:1:"c";s:3:"web";}i:1;a:3:{s:1:"a";i:4;s:1:"b";s:9:"mahasiswa";s:1:"c";s:3:"web";}i:2;a:3:{s:1:"a";i:2;s:1:"b";s:5:"admin";s:1:"c";s:3:"web";}i:3;a:3:{s:1:"a";i:3;s:1:"b";s:5:"dosen";s:1:"c";s:3:"web";}}}	1771511749
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: course_students; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.course_students (id, course_id, student_id, deleted_at, created_at, updated_at) FROM stdin;
1	2	5	\N	2026-02-18 12:38:07	2026-02-18 12:38:07
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.courses (id, name, description, lecturer_id, deleted_at, created_at, updated_at, kode_matkul) FROM stdin;
2	Dasar Pemograman	daspro	4	\N	2026-02-18 06:25:31	2026-02-18 06:25:31	daspro
3	Database	db	4	\N	2026-02-18 12:13:44	2026-02-18 12:13:44	db
\.


--
-- Data for Name: discussions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.discussions (id, course_id, user_id, title, content, deleted_at, created_at, updated_at, material_id) FROM stdin;
10	2	4	Diskusi: php	Forum diskusi utama untuk mata kuliah ini. Mari berdiskusi tentang materi: php	\N	2026-02-18 22:01:52	2026-02-18 22:01:52	14
11	2	4	Diskusi: java	Forum diskusi utama untuk mata kuliah ini. Mari berdiskusi tentang materi: java	\N	2026-02-18 22:02:23	2026-02-18 22:02:23	15
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
1	default	{"uuid":"043260f8-d06c-4754-b7f2-8e75abcf6671","displayName":"App\\\\Events\\\\ReplyCreated","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":17:{s:5:\\"event\\";O:23:\\"App\\\\Events\\\\ReplyCreated\\":1:{s:5:\\"reply\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Reply\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:23:\\"deleteWhenMissingModels\\";b:1;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:12:\\"messageGroup\\";N;s:12:\\"deduplicator\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}","batchId":null},"createdAt":1771425605,"delay":null}	0	\N	1771425605	1771425605
2	default	{"uuid":"584b3c3b-6598-43b0-86d9-596e389489b1","displayName":"App\\\\Events\\\\ReplyCreated","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":17:{s:5:\\"event\\";O:23:\\"App\\\\Events\\\\ReplyCreated\\":1:{s:5:\\"reply\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Reply\\";s:2:\\"id\\";i:2;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:23:\\"deleteWhenMissingModels\\";b:1;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:12:\\"messageGroup\\";N;s:12:\\"deduplicator\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}","batchId":null},"createdAt":1771425630,"delay":null}	0	\N	1771425630	1771425630
3	default	{"uuid":"144096c4-d32c-4c0c-b071-eaeef2c60b07","displayName":"App\\\\Events\\\\ReplyCreated","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":17:{s:5:\\"event\\";O:23:\\"App\\\\Events\\\\ReplyCreated\\":1:{s:5:\\"reply\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Reply\\";s:2:\\"id\\";i:3;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:23:\\"deleteWhenMissingModels\\";b:1;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:12:\\"messageGroup\\";N;s:12:\\"deduplicator\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}","batchId":null},"createdAt":1771426920,"delay":null}	0	\N	1771426920	1771426920
4	default	{"uuid":"c2bf5d76-c466-43eb-888b-98bb6841a544","displayName":"App\\\\Events\\\\ReplyCreated","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":17:{s:5:\\"event\\";O:23:\\"App\\\\Events\\\\ReplyCreated\\":1:{s:5:\\"reply\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Reply\\";s:2:\\"id\\";i:4;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:23:\\"deleteWhenMissingModels\\";b:1;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:12:\\"messageGroup\\";N;s:12:\\"deduplicator\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}","batchId":null},"createdAt":1771427039,"delay":null}	0	\N	1771427039	1771427039
\.


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.materials (id, course_id, title, file_path, file_type, file_size, deleted_at, created_at, updated_at) FROM stdin;
14	2	php	materi-kuliah/npwp.pdf	pdf	19190	\N	2026-02-18 22:01:52	2026-02-18 22:01:52
15	2	java	materi-kuliah/1.pdf	pdf	42550	\N	2026-02-18 22:02:23	2026-02-18 22:02:23
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2026_02_17_145832_create_courses_table	1
5	2026_02_17_145954_create_course_students_table	1
6	2026_02_17_150140_create_materials_table	1
7	2026_02_17_150251_create_assignments_table	1
8	2026_02_17_150525_create_submissions_table	1
9	2026_02_17_151050_create_discussions_table	1
10	2026_02_17_151258_create_replies_table	1
13	2026_02_18_024840_update_course	2
14	2026_02_18_031845_create_permission_tables	3
15	2026_02_18_042823_create_personal_access_tokens_table	4
17	2026_02_18_214830_add_material_id	5
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
3	App\\Models\\User	4
4	App\\Models\\User	5
1	App\\Models\\User	1
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
1	view_assignment	web	2026-02-18 03:58:08	2026-02-18 03:58:08
2	view_any_assignment	web	2026-02-18 03:58:08	2026-02-18 03:58:08
3	create_assignment	web	2026-02-18 03:58:08	2026-02-18 03:58:08
4	update_assignment	web	2026-02-18 03:58:08	2026-02-18 03:58:08
5	restore_assignment	web	2026-02-18 03:58:08	2026-02-18 03:58:08
6	restore_any_assignment	web	2026-02-18 03:58:08	2026-02-18 03:58:08
7	replicate_assignment	web	2026-02-18 03:58:08	2026-02-18 03:58:08
8	reorder_assignment	web	2026-02-18 03:58:08	2026-02-18 03:58:08
9	delete_assignment	web	2026-02-18 03:58:08	2026-02-18 03:58:08
10	delete_any_assignment	web	2026-02-18 03:58:08	2026-02-18 03:58:08
11	force_delete_assignment	web	2026-02-18 03:58:08	2026-02-18 03:58:08
12	force_delete_any_assignment	web	2026-02-18 03:58:08	2026-02-18 03:58:08
13	view_course	web	2026-02-18 03:58:08	2026-02-18 03:58:08
14	view_any_course	web	2026-02-18 03:58:08	2026-02-18 03:58:08
15	create_course	web	2026-02-18 03:58:08	2026-02-18 03:58:08
16	update_course	web	2026-02-18 03:58:08	2026-02-18 03:58:08
17	restore_course	web	2026-02-18 03:58:08	2026-02-18 03:58:08
18	restore_any_course	web	2026-02-18 03:58:08	2026-02-18 03:58:08
19	replicate_course	web	2026-02-18 03:58:08	2026-02-18 03:58:08
20	reorder_course	web	2026-02-18 03:58:08	2026-02-18 03:58:08
21	delete_course	web	2026-02-18 03:58:08	2026-02-18 03:58:08
22	delete_any_course	web	2026-02-18 03:58:08	2026-02-18 03:58:08
23	force_delete_course	web	2026-02-18 03:58:08	2026-02-18 03:58:08
24	force_delete_any_course	web	2026-02-18 03:58:08	2026-02-18 03:58:08
25	view_material	web	2026-02-18 03:58:08	2026-02-18 03:58:08
26	view_any_material	web	2026-02-18 03:58:08	2026-02-18 03:58:08
27	create_material	web	2026-02-18 03:58:08	2026-02-18 03:58:08
28	update_material	web	2026-02-18 03:58:08	2026-02-18 03:58:08
29	restore_material	web	2026-02-18 03:58:08	2026-02-18 03:58:08
30	restore_any_material	web	2026-02-18 03:58:08	2026-02-18 03:58:08
31	replicate_material	web	2026-02-18 03:58:08	2026-02-18 03:58:08
32	reorder_material	web	2026-02-18 03:58:08	2026-02-18 03:58:08
33	delete_material	web	2026-02-18 03:58:08	2026-02-18 03:58:08
34	delete_any_material	web	2026-02-18 03:58:08	2026-02-18 03:58:08
35	force_delete_material	web	2026-02-18 03:58:08	2026-02-18 03:58:08
36	force_delete_any_material	web	2026-02-18 03:58:08	2026-02-18 03:58:08
37	view_role	web	2026-02-18 03:58:08	2026-02-18 03:58:08
38	view_any_role	web	2026-02-18 03:58:08	2026-02-18 03:58:08
39	create_role	web	2026-02-18 03:58:08	2026-02-18 03:58:08
40	update_role	web	2026-02-18 03:58:08	2026-02-18 03:58:08
41	delete_role	web	2026-02-18 03:58:08	2026-02-18 03:58:08
42	delete_any_role	web	2026-02-18 03:58:08	2026-02-18 03:58:08
43	view_user	web	2026-02-18 03:58:08	2026-02-18 03:58:08
44	view_any_user	web	2026-02-18 03:58:08	2026-02-18 03:58:08
45	create_user	web	2026-02-18 03:58:08	2026-02-18 03:58:08
46	update_user	web	2026-02-18 03:58:08	2026-02-18 03:58:08
47	restore_user	web	2026-02-18 03:58:08	2026-02-18 03:58:08
48	restore_any_user	web	2026-02-18 03:58:08	2026-02-18 03:58:08
49	replicate_user	web	2026-02-18 03:58:08	2026-02-18 03:58:08
50	reorder_user	web	2026-02-18 03:58:08	2026-02-18 03:58:08
51	delete_user	web	2026-02-18 03:58:08	2026-02-18 03:58:08
52	delete_any_user	web	2026-02-18 03:58:08	2026-02-18 03:58:08
53	force_delete_user	web	2026-02-18 03:58:08	2026-02-18 03:58:08
54	force_delete_any_user	web	2026-02-18 03:58:08	2026-02-18 03:58:08
55	view_my::course	web	2026-02-18 11:56:23	2026-02-18 11:56:23
56	create_my::course	web	2026-02-18 11:56:23	2026-02-18 11:56:23
57	update_my::course	web	2026-02-18 12:11:23	2026-02-18 12:11:23
58	view_any_my::course	web	2026-02-18 12:11:23	2026-02-18 12:11:23
59	restore_any_my::course	web	2026-02-18 12:11:23	2026-02-18 12:11:23
60	delete_any_my::course	web	2026-02-18 12:11:23	2026-02-18 12:11:23
61	force_delete_any_my::course	web	2026-02-18 12:11:23	2026-02-18 12:11:23
62	restore_my::course	web	2026-02-18 13:32:23	2026-02-18 13:32:23
63	replicate_my::course	web	2026-02-18 13:32:23	2026-02-18 13:32:23
64	reorder_my::course	web	2026-02-18 13:32:23	2026-02-18 13:32:23
65	delete_my::course	web	2026-02-18 13:32:23	2026-02-18 13:32:23
66	force_delete_my::course	web	2026-02-18 13:32:23	2026-02-18 13:32:23
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: replies; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.replies (id, discussion_id, user_id, content, deleted_at, created_at, updated_at) FROM stdin;
3	10	4	tes	\N	2026-02-18 22:02:00	2026-02-18 22:02:00
4	10	5	ya	\N	2026-02-18 22:03:59	2026-02-18 22:03:59
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
1	4
2	4
5	4
6	4
7	4
8	4
1	2
9	2
10	2
6	2
2	2
3	2
11	2
4	2
12	2
8	2
7	2
5	2
21	2
17	2
13	2
22	2
18	2
14	2
23	2
19	2
15	2
24	2
20	2
16	2
25	2
29	2
33	2
34	2
30	2
26	2
35	2
31	2
27	2
36	2
32	2
28	2
12	4
10	4
3	4
11	4
25	4
26	4
58	4
56	4
57	4
59	4
60	4
61	4
1	3
5	3
9	3
2	3
6	3
10	3
3	3
7	3
11	3
4	3
8	3
12	3
13	3
17	3
21	3
14	3
18	3
22	3
15	3
19	3
23	3
16	3
20	3
24	3
25	3
29	3
33	3
26	3
30	3
34	3
27	3
31	3
35	3
28	3
32	3
36	3
55	1
58	1
56	1
57	1
62	1
59	1
63	1
64	1
65	1
60	1
66	1
61	1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	super_admin	web	2026-02-18 03:24:36	2026-02-18 03:24:36
2	admin	web	2026-02-18 03:24:45	2026-02-18 03:24:45
3	dosen	web	2026-02-18 03:24:52	2026-02-18 03:24:52
4	mahasiswa	web	2026-02-18 03:25:04	2026-02-18 03:25:04
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
Ym5QnYiOvM0E4S5ePRTCtVwVpaliz2urL6jCTjnu	5	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTEM1UlFod0sweHJ2YzVFSE5MTk4xYkFyRXZyQlluSG5NdEh3QlEzcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vZS1rYW1wdXMuY29tL2FkbWluL21hdGVyaWFscy8xNCI7czo1OiJyb3V0ZSI7czozOToiZmlsYW1lbnQuYWRtaW4ucmVzb3VyY2VzLm1hdGVyaWFscy52aWV3Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMDg0MzM5N2Y0NzY5ZmJlNjEwYTdhOTA2NTdiMjQ3ODliYTUxYmI3ODdiNTQ2YzBlYjk0YzE4NmQ2NmI2ZGM1YyI7fQ==	1771427039
k2OV0s3h1RbXst04EKsZfGocOQIaBjM5J3EA7cGm	4	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	YTo2OntzOjY6Il90b2tlbiI7czo0MDoiYVlkMHpZR0F4U0RyTVo5MUwzOHUwWTRSV2NBTDFnV0xVa0dRak9ISiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vZS1rYW1wdXMuY29tL2FkbWluL21hdGVyaWFscy8xNSI7czo1OiJyb3V0ZSI7czozOToiZmlsYW1lbnQuYWRtaW4ucmVzb3VyY2VzLm1hdGVyaWFscy52aWV3Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiOTY2YjAxZTU3YmI3NWEzNzBkZTc3ODY2ZDZhMjAzNGEwNTdiZGFjYmEwYjJiOTgzM2E5NWRkMWZiNDRmYzlhZSI7czo4OiJmaWxhbWVudCI7YTowOnt9fQ==	1771426954
zHa496iHOf5ed5Vd6f8hplpooyuZMlKKbjlzBfCR	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	YTo2OntzOjY6Il90b2tlbiI7czo0MDoibngzZzZ6a04xY2YySU91YjNsRHd1M2tLcHRER05BbUFlVkRYSzJQaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vZS1rYW1wdXMuY29tL2FkbWluL3VzZXJzLzUvZWRpdCI7czo1OiJyb3V0ZSI7czozNToiZmlsYW1lbnQuYWRtaW4ucmVzb3VyY2VzLnVzZXJzLmVkaXQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIxMzc2MWU4ZTJhYzhjZjljNjE0YmE4MmE0NzdjMmZhODdmZTZiYzc5MTJhMmQ2OTRlZjA2NGVlNGRlOWRkZjQwIjtzOjg6ImZpbGFtZW50IjthOjA6e319	1771414884
\.


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.submissions (id, assignment_id, student_id, file_path, score, feedback, submitted_at, deleted_at, created_at, updated_at) FROM stdin;
1	1	5	submissions/01KHQTN8DW3MDBXQMAEPKQPZGY.pdf	59	perbaiki	2026-02-18 14:33:00	\N	2026-02-18 14:32:59	2026-02-18 18:53:18
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users (id, name, email, email_verified_at, password, nik, nip, nim, jenis_kelamin, tempat_lahir, tanggal_lahir, alamat, no_hp, role, is_active, remember_token, deleted_at, created_at, updated_at) FROM stdin;
5	test	nuariananda28@gmail.com	\N	$2y$12$VYl5RHI68GKBnyzX6ql1HeK2ThH3QPZoPvOwSGY3cWDNnlZNDhyUm	\N	445453	\N	Laki-laki	test	2026-02-19	Jl. Pelajar Rawa Mulia, Simpang Kanan	082274640028	mahasiswa	t	\N	\N	2026-02-18 04:48:41	2026-02-18 16:20:15
1	admin	admin@mail.com	\N	$2y$12$wtPNQd787.3so.JIVkxQ4O7zkEBM4f9Dz136h0xmqSdzxhKqxKaZW	\N	\N	\N	Laki-laki	\N	\N	\N	\N	admin	t	oZhWUNtthzpqJa5Lo9ULpUkLCXew4kX8256E225INyYZ5oyC0xC4T0CftGjY	\N	2026-02-17 17:38:04	2026-02-17 17:53:05
4	affan	affan@mail.com	\N	$2y$12$2WyBp0JNFoZc3HGz/pOex.3Ds1wSRqrMGJoHM9.h6DPUSPDpddcI2	\N	55184	\N	Laki-laki	test	2026-02-18	Jl. Pelajar Rawa Mulia, Simpang Kanan	082274640028	dosen	t	\N	\N	2026-02-18 04:04:57	2026-02-18 04:11:17
\.


--
-- Name: assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.assignments_id_seq', 1, true);


--
-- Name: course_students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.course_students_id_seq', 1, true);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.courses_id_seq', 3, true);


--
-- Name: discussions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.discussions_id_seq', 11, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.jobs_id_seq', 4, true);


--
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.materials_id_seq', 15, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.migrations_id_seq', 17, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.permissions_id_seq', 66, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: replies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.replies_id_seq', 4, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: submissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.submissions_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: course_students course_students_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.course_students
    ADD CONSTRAINT course_students_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: discussions discussions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussions_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: materials materials_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: replies replies_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: submissions submissions_assignment_id_student_id_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_assignment_id_student_id_unique UNIQUE (assignment_id, student_id);


--
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_nik_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nik_unique UNIQUE (nik);


--
-- Name: users users_nim_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nim_unique UNIQUE (nim);


--
-- Name: users users_nip_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nip_unique UNIQUE (nip);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: personal_access_tokens_expires_at_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX personal_access_tokens_expires_at_index ON public.personal_access_tokens USING btree (expires_at);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: assignments assignments_course_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- Name: course_students course_students_course_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.course_students
    ADD CONSTRAINT course_students_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- Name: course_students course_students_student_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.course_students
    ADD CONSTRAINT course_students_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: courses courses_lecturer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_lecturer_id_foreign FOREIGN KEY (lecturer_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: discussions discussions_course_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussions_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- Name: discussions discussions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: materials materials_course_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: replies replies_discussion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_discussion_id_foreign FOREIGN KEY (discussion_id) REFERENCES public.discussions(id) ON DELETE CASCADE;


--
-- Name: replies replies_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: submissions submissions_assignment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_assignment_id_foreign FOREIGN KEY (assignment_id) REFERENCES public.assignments(id) ON DELETE CASCADE;


--
-- Name: submissions submissions_student_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

