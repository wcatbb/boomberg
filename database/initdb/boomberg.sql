DROP DATABASE IF EXISTS boomberg;
CREATE DATABASE boomberg;
ALTER DATABASE boomberg OWNER TO postgres;

\connect boomberg

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: mlbplayer_value_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mlbplayer_value_history (
    id integer NOT NULL,
    mlbplayer_id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    dollars numeric NOT NULL,
    salary numeric NOT NULL,
    "WAR" numeric NOT NULL
);


ALTER TABLE public.mlbplayer_value_history OWNER TO postgres;

--
-- Name: mlbplayer_value_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mlbplayer_value_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mlbplayer_value_history_id_seq OWNER TO postgres;

--
-- Name: mlbplayer_value_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mlbplayer_value_history_id_seq OWNED BY public.mlbplayer_value_history.id;


--
-- Name: mlbplayers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mlbplayers (
    id integer NOT NULL,
    name text NOT NULL,
    "position" text NOT NULL,
    jnum smallint,
    bats text NOT NULL,
    throws text NOT NULL,
    age numeric NOT NULL,
    injury text,
    dollars numeric NOT NULL,
    salary numeric,
    team_id integer,
    "WAR" numeric,
    "xWAR" numeric,
    fg_id integer,
    role text NOT NULL
);


ALTER TABLE public.mlbplayers OWNER TO postgres;

--
-- Name: mlbplayers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mlbplayers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mlbplayers_id_seq OWNER TO postgres;

--
-- Name: mlbplayers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mlbplayers_id_seq OWNED BY public.mlbplayers.id;


--
-- Name: mlbplayers_portfolios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mlbplayers_portfolios (
    portfolio_id integer NOT NULL,
    mlbplayer_fgid integer NOT NULL
);


ALTER TABLE public.mlbplayers_portfolios OWNER TO postgres;

--
-- Name: mlbplayers_portfolios_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mlbplayers_portfolios_transactions (
    id integer NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    portfolio_id integer,
    kind text NOT NULL,
    dollars numeric NOT NULL,
    mlbplayer_fgid integer
);


ALTER TABLE public.mlbplayers_portfolios_transactions OWNER TO postgres;

--
-- Name: mlbplayers_portfolios_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mlbplayers_portfolios_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mlbplayers_portfolios_transactions_id_seq OWNER TO postgres;

--
-- Name: mlbplayers_portfolios_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mlbplayers_portfolios_transactions_id_seq OWNED BY public.mlbplayers_portfolios_transactions.id;


--
-- Name: mlbteam_value_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mlbteam_value_history (
    id integer NOT NULL,
    team_id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    wins numeric NOT NULL,
    dollars numeric NOT NULL,
    payroll numeric NOT NULL
);


ALTER TABLE public.mlbteam_value_history OWNER TO postgres;

--
-- Name: mlbteam_value_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mlbteam_value_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mlbteam_value_history_id_seq OWNER TO postgres;

--
-- Name: mlbteam_value_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mlbteam_value_history_id_seq OWNED BY public.mlbteam_value_history.id;


--
-- Name: mlbteams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mlbteams (
    id integer NOT NULL,
    fg_id smallint NOT NULL,
    short_name text NOT NULL,
    abb_name text NOT NULL,
    league text NOT NULL,
    division text NOT NULL,
    payroll integer NOT NULL,
    win_spend integer NOT NULL,
    "W" smallint NOT NULL,
    "L" smallint NOT NULL,
    "GB" numeric NOT NULL,
    "xW" smallint NOT NULL,
    "xL" smallint NOT NULL
);


ALTER TABLE public.mlbteams OWNER TO postgres;

--
-- Name: mlbteams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mlbteams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mlbteams_id_seq OWNER TO postgres;

--
-- Name: mlbteams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mlbteams_id_seq OWNED BY public.mlbteams.id;


--
-- Name: portfolio_value_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.portfolio_value_history (
    id integer NOT NULL,
    portfolio_id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    dollars numeric NOT NULL
);


ALTER TABLE public.portfolio_value_history OWNER TO postgres;

--
-- Name: portfolio_value_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.portfolio_value_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolio_value_history_id_seq OWNER TO postgres;

--
-- Name: portfolio_value_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.portfolio_value_history_id_seq OWNED BY public.portfolio_value_history.id;


--
-- Name: portfolios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.portfolios (
    id integer NOT NULL,
    name text NOT NULL,
    size smallint,
    trades smallint,
    dollars numeric NOT NULL,
    user_id integer
);


ALTER TABLE public.portfolios OWNER TO postgres;

--
-- Name: portfolios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.portfolios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolios_id_seq OWNER TO postgres;

--
-- Name: portfolios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.portfolios_id_seq OWNED BY public.portfolios.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    fav_team text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: mlbplayer_value_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayer_value_history ALTER COLUMN id SET DEFAULT nextval('public.mlbplayer_value_history_id_seq'::regclass);


--
-- Name: mlbplayers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayers ALTER COLUMN id SET DEFAULT nextval('public.mlbplayers_id_seq'::regclass);


--
-- Name: mlbplayers_portfolios_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayers_portfolios_transactions ALTER COLUMN id SET DEFAULT nextval('public.mlbplayers_portfolios_transactions_id_seq'::regclass);


--
-- Name: mlbteam_value_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbteam_value_history ALTER COLUMN id SET DEFAULT nextval('public.mlbteam_value_history_id_seq'::regclass);


--
-- Name: mlbteams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbteams ALTER COLUMN id SET DEFAULT nextval('public.mlbteams_id_seq'::regclass);


--
-- Name: portfolio_value_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio_value_history ALTER COLUMN id SET DEFAULT nextval('public.portfolio_value_history_id_seq'::regclass);


--
-- Name: portfolios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolios ALTER COLUMN id SET DEFAULT nextval('public.portfolios_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
5c72756d982d
\.


--
-- Data for Name: mlbplayer_value_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlbplayer_value_history (id, mlbplayer_id, date, dollars, salary, "WAR") FROM stdin;
\.


--
-- Data for Name: mlbplayers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlbplayers (id, name, "position", jnum, bats, throws, age, injury, dollars, salary, team_id, "WAR", "xWAR", fg_id, role) FROM stdin;
23104	Mickey Moniak	CF/RF/LF	16	L	R	25.8		0	740000	1	1.54428	0.213706	19956	1
23105	Nolan Schanuel	1B	18	L	R	22.1		0	740000	1	0.117976	1.77141	33189	2
23106	Mike Trout	CF	27	R	R	32.6		0	35541666.66666667	1	2.97404	4.34186	10155	3
23107	Anthony Rendon	3B	6	R	R	33.8		0	35000000.0	1	0.166818	2.35254	12861	4
23108	Taylor Ward	LF/RF/CF	3	R	R	30.2		0	4800000.0	1	1.51847	2.37636	17548	5
23109	Brandon Drury	2B/1B/3B	23	R	R	31.6		0	8500000.0	1	2.48625	0.946935	11615	6
23110	Luis Rengifo	2B/3B/RF	2	S	R	27.0		0	4400000.0	1	1.93605	1.93553	19858	7
23111	Logan O'Hoppe	C	14	R	R	24.1		0	740000	1	0.243917	2.08288	24729	8
23112	Zach Neto	SS	9	R	R	23.1		0	740000	1	1.07432	2.96488	31347	9
23113	Matt Thaiss	C/1B	21	L	R	28.9		0	740000	1	0.307883	0.305353	19318	Bench
23114	Jo Adell	RF/LF/CF	7	R	R	24.9		0	740000	1	0.225711	0.304126	20220	Bench
23115	Aaron Hicks	CF/LF/RF	12	S	R	34.4		0	740000.0	1	1.04245	0.459792	5297	Bench
23116	Reid Detmers	SP	48	L	L	24.7		0	740000	1	2.50839	2.50935	27468	SP1
23117	Griffin Canning	SP	47	R	R	27.8		0	2600000.0	1	1.83104	2.08886	19867	SP2
23118	Patrick Sandoval	SP	43	L	L	27.4		0	5025000.0	1	2.3496	2.3949	19447	SP3
23119	Tyler Anderson	SP	31	L	L	34.2		0	13000000.0	1	1.14429	1.56409	12880	SP4
23120	Chase Silseth	SP/RP	63	R	R	23.8		0	740000	1	0.208596	1.2876	30074	SP4
23121	Carlos Estévez	RP	53	R	R	31.2		0	6750000.0	1	0.914222	0.68507	14542	CL
23122	Robert Stephenson	RP	24	R	R	31.0		0	11000000.0	1	0.942149	1.16453	13594	SU8
23123	Matt Moore	RP	55	L	L	34.7		0	9000000.0	1	0.643589	0.124116	1890	SU7
23124	José Soriano	RP	59	R	R	25.4		0	740000	1	0.390509	0.361432	22100	MID
23125	Luis García	RP	66	R	R	37.1		0	4250000.0	1	0.0881938	0.20028	6984	MID
23126	Adam Cimber	RP	90	R	R	33.6		0	1650000.0	1	-0.592549	-0.148512	15288	MID
23127	José Cisnero	RP	67	R	R	34.9		0	1750000.0	1	-0.0135295	0.0133569	6399	MID
23128	José Suarez	SP/RP	54	L	L	26.2		0	925000.0	1	-0.481846	0.304098	19911	LR
23129	Sam Bachman	SP/RP	40	R	R	24.5	Arthroscopic shoulder surgery	0	740000	1	0.163953	-0.0511563	29754	Inj
23130	Cedric Mullins	CF	31	L	L	29.4		0	6325000.0	2	1.78758	2.84829	17929	1
23131	Adley Rutschman	C	35	S	R	26.1		0	740000	2	5.06442	5.30194	26288	2
23132	Gunnar Henderson	3B/SS	2	L	R	22.7		0	740000	2	4.64346	4.88016	26289	3
23133	Anthony Santander	RF/LF/1B	25	S	R	29.4		0	11700000.0	2	2.64071	2.41853	14551	4
23134	Ryan O'Hearn	1B/RF/LF	32	L	L	30.6		0	3500000.0	2	1.43492	0.924828	16442	5
23135	Ryan Mountcastle	1B	6	R	R	27.1		0	4137000.0	2	1.65281	1.56867	18373	6
23136	Austin Hays	LF/RF/CF	21	R	R	28.7		0	6300000.0	2	2.20077	2.10275	19363	7
23137	Jordan Westburg	2B/3B/SS	11	R	R	25.1		0	740000	2	1.08066	2.2238	27815	9
23138	James McCann	C	27	R	R	33.7		0	12150000.0	2	0.493124	0.437278	12859	Bench
23139	Ramón Urías	3B/2B/1B	29	R	R	29.8		0	2100000.0	2	0.834975	1.03785	18795	Bench
23140	Jorge Mateo	SS/CF/2B	3	R	R	28.7		0	2700000.0	2	0.453263	0.539392	17273	Bench
23141	Colton Cowser	CF/RF/LF	17	L	R	24.0		0	740000	2	-0.399716	0.577386	29591	Bench
23142	Corbin Burnes	SP	39	R	R	29.4		0	15637500.0	2	3.43443	3.76737	19361	SP1
23143	Grayson Rodriguez	SP	30	R	R	24.3		0	740000	2	1.83354	2.6227	24492	SP2
23144	Dean Kremer	SP	64	R	R	28.2		0	740000	2	1.48825	1.77422	19350	SP3
23145	Tyler Wells	SP/RP	68	R	R	29.5		0	1962500.0	2	0.62513	0.527508	20000	SP4
23146	Cole Irvin	SP/RP	19	L	L	30.1		0	2000000.0	2	0.525438	0.481907	19244	SP5
23147	Craig Kimbrel	RP	46	R	R	35.8		0	13000000.0	2	1.12684	0.415671	6655	CL
23148	Yennier Cano	RP	78	R	R	30.0		0	740000	2	1.67735	0.447975	25911	SU8
23149	Danny Coulombe	RP	54	L	L	34.4		0	2300000.0	2	1.38192	0.282568	13293	SU7
23150	Dillon Tate	RP	55	R	R	29.9		0	1500000.0	2	\N	-0.0647778	17796	MID
23151	Cionel Pérez	RP	58	L	L	27.9		0	1200000.0	2	0.392302	0.101765	19614	MID
23152	Jacob Webb	RP	71	R	R	30.6		0	1000000.0	2	0.109185	0.094998	19274	MID
23153	Mike Baumann	RP	53	R	R	28.5		0	740000	2	0.0166589	0.0109293	20206	MID
23154	Keegan Akin	RP/SP	45	L	L	29.0		0	825000.0	2	0.411454	0.210183	19362	LR
23155	Kyle Bradish	SP	38	R	R	27.5	Sprained elbow	0	740000	2	3.78228	1.26989	24586	Inj
23156	John Means	SP	47	L	L	30.9	Elbow soreness	0	3325000.0	2	0.159236	1.13195	16269	Inj
23157	Jarren Duran	CF/RF/LF	16	L	R	27.5		0	760000.0	3	2.3589	1.26743	24617	1
23158	Rafael Devers	3B	11	L	R	27.4		0	29000000.0	3	3.12926	4.32824	17350	2
23159	Trevor Story	SS/2B	10	R	R	31.3		0	23333333.33333333	3	0.242434	2.66565	12564	3
23160	Tyler O'Neill	LF/CF/RF	17	R	R	28.7		0	5850000.0	3	0.806686	2.44686	15711	4
23161	Masataka Yoshida	LF/RF	7	L	R	30.7		0	18000000.0	3	0.634765	1.78119	31837	5
23162	Triston Casas	1B	36	L	R	24.2		0	760000.0	3	1.74753	2.71765	22514	6
23163	Ceddanne Rafaela	CF/SS/2B	43	R	R	23.5		0	740000	3	0.0555083	1.32554	24262	7
23164	Enmanuel Valdez	2B/3B	47	L	R	25.2		0	740000	3	0.270105	0.472216	21716	8
23165	Connor Wong	C	12	R	R	27.8		0	760000.0	3	0.472987	0.410161	19896	9
23166	Reese McGuire	C	3	L	R	29.0		0	1500000.0	3	0.335449	0.86647	15674	Bench
23167	Pablo Reyes	2B/SS/CF	19	R	R	30.5		0	740000	3	0.457733	0.246042	16357	Bench
23168	Wilyer Abreu	LF/RF/CF	52	L	L	24.7		0	740000	3	0.56292	0.909065	23772	Bench
23169	Nick Pivetta	SP	37	R	R	31.1		0	7500000.0	3	1.88075	2.01503	15454	SP1
23170	Brayan Bello	SP	66	R	R	24.8		0	9166666.66666667	3	1.59948	2.63113	23920	SP2
23171	Kutter Crawford	SP/RP	50	R	R	27.9		0	760000.0	3	2.44703	1.93174	20531	SP3
23172	Tanner Houck	SP/RP	89	R	R	27.7		0	770000.0	3	1.21043	1.6735	19879	SP4
23173	Garrett Whitlock	SP/RP	22	R	R	27.8		0	4687500.0	3	0.819507	1.63969	20191	SP5
23174	Kenley Jansen	RP	74	S	R	36.5		0	16000000.0	3	1.09018	0.718586	3096	CL
23175	Chris Martin	RP	55	R	R	37.8		0	8750000.0	3	1.49227	0.807146	11847	SU8
23176	Josh Winckowski	RP	25	R	R	25.7		0	740000	3	0.804205	0.752491	22387	SU7
23177	Brennan Bernardino	RP	83	L	L	32.2		0	740000	3	0.742855	0.159454	16835	MID
23178	Isaiah Campbell	RP	44	R	R	26.6		0	740000	3	0.302751	0.271645	25551	MID
23179	Greg Weissert	RP	57	R	R	29.1		0	740000	3	0.0259525	0.0792705	20375	MID
23180	Justin Slaten	RP	63	R	R	26.5		0	740000	3	\N	-0.0153231	\N	LR
23181	Vaughn Grissom	SS/2B/3B	5	R	R	23.2	Strained groin	0	740000	3	-0.667189	2.14383	26031	Inj
23182	Rob Refsnyder	LF/CF/RF	30	R	R	33.0	Fractured toe	0	1850000.0	3	0.1819	0.600263	13770	Inj
23183	Lucas Giolito	SP	54	R	R	29.7	Elbow surgery (internal brace)	0	19250000.0	3	0.977849	\N	15474	Inj
23184	Bryan Mata	SP	79	R	R	24.9	Strained hamstring	0	740000	3	\N	0.0268587	\N	Inj
23185	Liam Hendriks	RP	31	R	R	35.1	Tommy John surgery	0	5000000.0	3	-0.0548376	0.0346848	3548	Inj
23186	Andrew Benintendi	LF/RF	23	L	L	29.7		0	15000000.0	4	-0.0483349	1.51442	17901	1
23187	Yoán Moncada	3B	10	S	R	28.8		0	14000000.0	4	1.22295	2.36868	17232	2
23188	Luis Robert Jr.	CF	88	R	R	26.6		0	8333333.33333333	4	4.98103	3.98731	20043	3
23189	Eloy Jiménez	LF/RF	74	R	R	27.3		0	7166666.66666667	4	0.420791	1.96164	17484	4
23190	Andrew Vaughn	1B	25	R	R	25.9		0	3250000.0	4	0.253576	1.62178	26197	5
23191	Dominic Fletcher	CF/RF/LF	7	L	L	26.5		0	740000	4	0.638684	0.368346	26149	6
23192	Paul DeJong	SS	29	R	R	30.6		0	1750000.0	4	0.302801	0.68168	18015	7
23193	Nicky Lopez	SS/2B/3B	8	L	R	29.0		0	4300000.0	4	1.07325	0.735739	19339	8
23194	Martín Maldonado	C	15	R	R	37.6		0	4250000.0	4	-1.247	-0.589956	6887	9
23195	Max Stassi	C	33	R	R	33.0		0	7500000.0	4	\N	0.917041	10059	Bench
23196	Gavin Sheets	1B/LF/RF	32	L	L	27.9		0	740000	4	-1.39083	0.0838207	19901	Bench
23197	Erick Fedde	SP	20	R	R	31.0		0	7500000.0	4	\N	1.07171	17425	SP1
23198	Michael Kopech	SP	34	R	R	27.9		0	3000000.0	4	-0.887211	0.802749	17282	SP2
23199	Michael Soroka	SP	40	R	R	26.6		0	3000000.0	4	-0.400808	1.2165	18383	SP3
23200	Chris Flexen	SP/RP	77	R	R	29.7		0	1750000.0	4	-0.469031	0.759405	13896	SP4
23201	Garrett Crochet	RP	45	L	L	24.7		0	800000.0	4	-0.125685	0.921816	27463	SP5
23202	Steven Wilson	RP	\N	R	R	29.6		0	740000	4	0.422234	0.0898744	20353	CL
23203	John Brebbia	RP	59	R	R	33.8		0	5500000.0	4	0.318021	0.376799	12777	CL
23204	Deivi García	RP	64	R	R	24.8		0	740000	4	-0.185858	-0.6356	20276	CL
23205	Tim Hill	RP	54	L	L	34.1		0	1800000.0	4	-0.443333	-0.298014	16814	MID
23206	Tanner Banks	RP	57	L	L	32.4		0	740000	4	0.126829	0.0671351	16990	MID
23207	Touki Toussaint	SP/RP	47	R	R	27.7		0	1300000.0	4	0.415367	-0.0106052	16929	LR
23208	Prelander Berroa	RP/SP	73	R	R	23.9	Shoulder discomfort	0	740000	4	-0.014169	-0.00382561	22932	Inj
23209	Shane Drohan	SP	71	L	L	25.2	Shoulder surgery (nerve decompression)	0	740000	4	\N	\N	\N	Inj
23210	Jimmy Lambert	RP	58	R	R	29.3	Shoulder soreness	0	740000	4	-0.533635	-0.0226466	19541	Inj
23211	Davis Martin	SP	65	L	R	27.2		0	740000	4	\N	\N	21448	Inj
23212	Steven Kwan	LF/CF/RF	38	L	L	26.5		0	740000	5	2.90052	2.83542	24610	1
23213	Andrés Giménez	2B/SS	0	L	R	25.5		0	15214285.71428571	5	3.64014	4.33709	19950	2
23214	José Ramírez	3B/2B	11	S	R	31.5		0	20142857.14285714	5	5.10421	5.19405	13510	3
23215	Josh Naylor	1B	22	L	L	26.7		0	6550000.0	5	2.49879	2.0093	18839	4
23216	Ramón Laureano	CF/RF	10	R	R	29.7		0	5150000.0	5	0.980177	1.52804	17128	5
23217	Bo Naylor	C	23	L	R	24.1		0	740000	5	2.41692	2.2269	21865	6
23218	Gabriel Arias	SS/3B/RF	13	R	R	24.0		0	740000	5	0.378864	1.1526	22563	8
23219	Myles Straw	CF	7	R	R	29.4		0	5000000.0	5	0.355872	1.01526	17620	9
23220	Austin Hedges	C	27	R	R	31.6		0	4000000.0	5	0.771634	0.86821	12976	Bench
23221	Deyvison De Los Santos	3B/1B	70	R	R	20.7		0	740000	5	\N	\N	\N	Bench
23222	Tyler Freeman	2B/SS/CF	2	R	R	24.8		0	740000	5	0.180895	0.709894	22532	Bench
23223	Estevan Florial	CF/RF/LF	90	L	R	26.3		0	740000	5	0.207554	0.747867	19151	Bench
23224	Shane Bieber	SP	57	R	R	28.8		0	13125000.0	5	2.06576	3.3584	19427	SP1
23225	Triston McKenzie	SP	24	R	R	26.6		0	1600000.0	5	0.219301	2.34486	18000	SP2
23226	Tanner Bibee	SP	28	R	R	25.0		0	740000	5	3.01726	2.06502	30134	SP3
23227	Logan Allen	SP	41	R	L	25.5		0	740000	5	1.65682	1.53437	27589	SP4
23228	Gavin Williams	SP	32	L	R	24.6		0	740000	5	1.12717	1.33627	30122	SP5
23229	Emmanuel Clase	RP	48	R	R	26.0		0	4000000.0	5	1.73069	1.35707	21032	CL
23230	Scott Barlow	RP	58	R	R	31.2		0	6700000.0	5	1.00281	0.658304	14993	SU8
23231	Sam Hentges	RP	31	L	L	27.7		0	1162500.0	5	1.07372	0.616574	18548	SU7
23232	Nick Sandlin	RP	52	R	R	27.2		0	1075000.0	5	-0.275656	0.043678	20517	MID
23233	Eli Morgan	RP	49	R	R	27.8		0	740000	5	0.418839	0.162548	20203	MID
23234	Tim Herrin	RP	29	L	L	27.4		0	740000	5	0.111358	0.135266	25139	MID
23235	Cade Smith	RP	91	R	R	24.8		0	740000	5	\N	0.0511916	\N	MID
23236	James Karinchak	RP	99	R	R	28.5	Shoulder fatigue	0	1900000.0	5	-0.1973	0.0652013	20151	Inj
23237	Trevor Stephan	RP	37	R	R	28.3	Bone bruise -- elbow	0	2500000.0	5	0.923331	0.0712373	19932	Inj
23238	Daniel Espino	SP	66	R	R	23.2		0	740000	5	\N	\N	\N	Inj
23239	Parker Meadows	CF/LF/RF	22	L	R	24.4		0	740000	6	1.01317	1.47526	23800	1
23240	Riley Greene	CF/RF/LF	31	L	L	23.5		0	740000	6	2.25489	2.76455	25976	2
23241	Spencer Torkelson	1B	20	R	R	24.5		0	740000	6	1.38813	2.07905	27465	3
23242	Kerry Carpenter	LF/RF	30	L	R	26.5		0	740000	6	2.17503	0.871027	25961	4
23243	Mark Canha	LF/RF/1B	21	R	R	35.1		0	11500000.0	6	1.56087	1.84135	11445	5
23244	Colt Keith	3B/2B	33	L	R	22.6		0	740000	6	\N	\N	\N	6
23245	Javier Báez	SS	28	R	R	31.3		0	23333333.33333333	6	0.804748	1.06603	12979	7
23246	Gio Urshela	3B/SS/1B	13	R	R	32.4		0	1500000.0	6	0.385698	1.08579	10681	8
23247	Jake Rogers	C	34	R	R	28.9		0	1700000.0	6	2.21874	1.61284	19452	9
23248	Carson Kelly	C	15	R	R	29.7		0	3500000.0	6	0.061039	0.948187	13620	Bench
23249	Andy Ibáñez	2B/3B/LF	77	R	R	30.9		0	740000	6	1.57401	0.711683	18819	Bench
23250	Zach McKinstry	3B/2B/RF	39	L	R	28.9		0	740000	6	1.18731	0.802113	19392	Bench
23251	Matt Vierling	RF/LF/3B	8	R	R	27.5		0	740000	6	1.18697	0.84176	21558	Bench
23252	Tarik Skubal	SP	29	L	L	27.3		0	2650000.0	6	3.28385	3.69965	22267	SP1
23253	Jack Flaherty	SP	45	R	R	28.4		0	14000000.0	6	1.76314	1.50017	17479	SP2
23254	Kenta Maeda	SP/RP	18	R	R	35.9		0	12000000.0	6	1.54876	1.73577	18498	SP3
23255	Matt Manning	SP	25	R	R	26.1		0	740000	6	0.613128	1.08317	20369	SP4
23256	Reese Olson	SP	40	R	R	24.6		0	740000	6	1.4759	1.57125	24968	SP5
23257	Alex Lange	RP	55	R	R	28.4		0	740000	6	-0.0701914	0.445277	19883	CL
23258	Jason Foley	RP	68	R	R	28.4		0	740000	6	1.5221	0.448418	19531	SU8
23259	Shelby Miller	RP	7	R	R	33.4		0	3250000.0	6	0.514524	0.0826927	10197	SU7
23260	Andrew Chafin	RP	17	R	L	33.7		0	4750000.0	6	0.480097	0.287028	12988	MID
23261	Will Vest	RP	19	R	R	28.8		0	740000	6	1.15694	0.451339	19769	MID
23262	Tyler Holton	RP	87	L	L	27.7		0	740000	6	0.951774	0.224764	26231	MID
23263	Miguel Díaz	RP	58	R	R	29.3		0	740000	6	0.395592	0.0466615	18815	MID
23264	Joey Wentz	SP/RP	43	L	L	26.4		0	740000	6	-0.611354	0.135379	19962	LR
23265	MJ Melendez	RF/LF/C	1	L	R	25.3		0	740000	7	0.0142082	0.913586	22197	1
23266	Bobby Witt Jr.	SS/3B	7	R	R	23.7		0	26252525.18181818	7	5.74191	4.56928	25764	2
23267	Vinnie Pasquantino	1B	9	L	L	26.4		0	740000	7	0.0440356	2.36145	27676	3
23268	Salvador Perez	C/1B	13	R	R	33.8		0	20500000.0	7	-0.261653	1.09008	7304	4
23269	Nick Pratto	1B/LF/RF	32	L	L	25.4		0	740000	7	-0.577339	0.0482298	22117	5
23270	Hunter Renfroe	RF/LF/1B	16	R	R	32.1		0	6500000.0	7	0.600076	0.764988	15464	6
23271	Michael Massey	2B	19	L	R	26.0		0	740000	7	0.519849	1.21208	27684	7
23272	Maikel Garcia	3B/SS/2B	11	R	R	24.0		0	740000	7	1.92462	1.80267	22715	8
23273	Kyle Isbel	CF/RF/LF	28	L	R	27.0		0	740000	7	1.1212	1.46635	21614	9
23274	Freddy Fermin	C	34	R	R	28.8		0	740000	7	1.50915	1.01445	21840	Bench
23275	Adam Frazier	2B/RF/LF	26	L	R	32.2		0	4500000.0	7	0.284734	0.602543	15223	Bench
23276	Garrett Hampson	SS/CF/RF	2	R	R	29.4		0	2000000.0	7	0.737104	0.196981	19262	Bench
23277	Dairon Blanco	CF/LF/RF	44	R	R	30.9		0	740000	7	1.12757	0.18967	19779	Bench
23278	Cole Ragans	SP	55	L	L	26.3		0	740000	7	2.24099	2.4852	21846	SP1
23279	Seth Lugo	RP	67	R	R	34.3		0	15000000.0	7	2.83283	1.81672	12447	SP2
23280	Michael Wacha	SP	52	R	R	32.7		0	16000000.0	7	2.61036	1.50332	14078	SP3
23281	Brady Singer	SP	51	R	R	27.6		0	4850000.0	7	1.90436	2.19757	25377	SP4
23282	Jordan Lyles	SP	24	R	R	33.4		0	8500000.0	7	0.166872	0.519416	7593	SP5
23283	James McArthur	RP	66	R	R	27.3		0	740000	7	0.514165	0.165561	21527	CL
23284	Will Smith	RP	31	R	L	34.7		0	5000000.0	7	1.12707	0.264015	8048	CL
23285	John Schreiber	RP	46	R	R	30.0		0	1175000.0	7	0.100306	0.403851	20020	SU7
23286	Nick Anderson	RP	63	R	R	33.7		0	1575000.0	7	0.877101	0.265055	18337	MID
23287	Chris Stratton	RP	35	R	R	33.6		0	4000000.0	7	1.14653	0.241322	13761	MID
23288	Josh Taylor	RP	38	L	L	31.0		0	1100000.0	7	0.0057821	0.118623	17359	MID
23289	Matt Sauer	SP	65	R	R	25.1		0	740000	7	\N	0.012965	\N	LR
23290	Carlos Hernández	RP	43	R	R	27.0	Shoulder soreness	0	1012500.0	7	0.250585	0.0271315	22713	Inj
23291	Edouard Julien	2B	47	L	R	24.9		0	740000	8	2.77967	2.53235	27534	1
23292	Byron Buxton	CF	25	R	R	30.2		0	14285714.28571429	8	0.711007	2.91272	14161	2
23293	Royce Lewis	SS/3B	23	R	R	24.8		0	740000	8	2.41879	3.9909	20437	3
23294	Carlos Correa	SS	4	R	R	29.5		0	33333333.33333333	8	1.13949	3.56204	14162	4
23295	Max Kepler	RF/LF	26	L	L	31.1		0	10000000.0	8	2.62767	2.48043	12144	5
23296	Carlos Santana	1B	30	S	R	37.9		0	5250000.0	8	1.66132	0.705215	2396	6
23297	Matt Wallner	RF/LF	38	L	R	26.3		0	740000	8	1.88714	1.51043	26466	7
23298	Ryan Jeffers	C	27	R	R	26.8		0	2425000.0	8	2.70502	1.86192	24618	8
23299	Alex Kirilloff	1B/LF/RF	19	L	L	26.3		0	1350000.0	8	0.80013	0.73261	20325	9
23300	Christian Vázquez	C/1B	8	R	R	33.6		0	10000000.0	8	0.950451	1.30615	9774	Bench
23301	Kyle Farmer	SS/3B/2B	12	R	R	33.6		0	6300000.0	8	1.64898	0.719334	14813	Bench
23302	Willi Castro	LF/CF/3B	50	S	R	26.9		0	3300000.0	8	2.51185	1.00573	17338	Bench
23303	Manuel Margot	CF/RF/LF	13	R	R	29.5		0	12000000.0	8	0.42423	0.913231	14712	Bench
23304	Pablo López	SP	49	R	R	28.0		0	18375000.0	8	4.47028	4.06105	17085	SP1
23305	Joe Ryan	SP	41	R	R	27.8		0	740000	8	2.22009	2.78367	21390	SP2
23306	Bailey Ober	SP	17	R	R	28.7		0	740000	8	2.36044	2.1022	21224	SP3
23307	Chris Paddack	SP	20	R	R	28.2		0	4166666.66666667	8	0.0595433	2.04825	20099	SP4
23308	Louie Varland	SP/RP	37	L	R	26.3		0	740000	8	0.111928	1.28584	27691	SP5
23309	Jhoan Duran	RP	59	R	R	26.2		0	740000	8	1.03296	1.82718	21029	CL
23310	Griffin Jax	RP	22	R	R	29.3		0	740000	8	1.17766	0.596226	20253	SU8
23311	Brock Stewart	RP	61	L	R	32.4		0	740000	8	0.859656	0.98496	16727	SU7
23312	Caleb Thielbar	RP	56	R	L	37.1		0	3225000.0	8	0.0870704	0.601079	10078	MID
23313	Justin Topa	RP	48	R	R	33.0		0	1250000.0	8	1.10272	0.110889	15145	MID
23314	Steven Okert	RP	16	L	L	32.7		0	1062500.0	8	0.480171	0.102203	13580	MID
23315	Josh Staumont	RP	63	R	R	30.2		0	950000.0	8	0.167997	0.0687936	18335	MID
23316	Jay Jackson	RP	32	R	R	36.4		0	1500000.0	8	0.14134	0.255111	7432	LR
23317	Anthony DeSclafani	SP/RP	21	R	R	33.9	Elbow soreness	0	12000000.0	8	0.954786	1.05608	13050	Inj
23318	DJ LeMahieu	3B/1B/2B	26	R	R	35.7		0	15000000.0	9	1.06229	2.31535	9874	1
23319	Juan Soto	LF/RF	22	L	L	25.4		0	31000000.0	9	5.53362	6.29977	20123	2
23320	Aaron Judge	RF/CF	99	R	R	31.9		0	40000000.0	9	5.32592	6.68021	15640	3
23321	Anthony Rizzo	1B	48	L	L	34.6		0	20000000.0	9	0.894225	1.35067	3473	4
23322	Gleyber Torres	2B	25	R	R	27.2		0	14200000.0	9	3.2355	3.78711	16997	5
23323	Giancarlo Stanton	RF/LF	27	R	R	34.3		0	25000000.0	9	-0.838441	0.884824	4949	6
23324	Alex Verdugo	LF/RF	24	L	L	27.8		0	8700000.0	9	2.03593	1.62131	17027	7
23325	Anthony Volpe	SS	11	R	R	22.9		0	740000	9	1.87862	2.80945	27647	8
23326	Austin Wells	C	88	L	R	25.5		0	740000	9	0.355578	1.33828	27562	9
23327	Jose Trevino	C	39	R	R	31.3		0	2730000.0	9	0.858959	1.91053	16725	Bench
23328	Ben Rortvedt	C	38	L	R	26.5		0	740000	9	0.101372	0.196535	20287	Bench
23329	Oswaldo Cabrera	LF/RF/3B	95	S	R	25.0		0	740000	9	-0.643608	0.34274	21707	Bench
23330	Trent Grisham	CF	12	L	L	27.4		0	5500000.0	9	1.65859	1.36344	18564	Bench
23331	Marcus Stroman	SP	0	R	R	32.9		0	18500000.0	9	2.74812	2.01959	13431	SP1
23332	Carlos Rodón	SP	55	L	L	31.3		0	27000000.0	9	-0.151464	3.09606	16137	SP2
23333	Clarke Schmidt	SP	36	R	R	28.1		0	2025000.0	9	1.81274	1.59927	19899	SP3
23334	Nestor Cortes	SP	65	R	L	29.3		0	3950000.0	9	0.811173	2.05383	17874	SP4
23335	Clayton Beeter	SP	85	R	R	25.4		0	740000	9	\N	0.323616	\N	SP5
23336	Clay Holmes	RP	35	R	R	31.0		0	6000000.0	9	1.53651	0.793741	13649	CL
23337	Jonathan Loáisiga	RP	43	R	R	29.4		0	2500000.0	9	0.00104371	0.608387	19753	SU8
23338	Ian Hamilton	RP	71	R	R	28.7		0	740000	9	1.11666	0.383315	19261	SU7
23339	Caleb Ferguson	RP	64	R	L	27.7		0	2400000.0	9	1.29468	0.710066	19349	MID
23340	Ron Marinaccio	RP	97	R	R	28.7		0	740000	9	-0.168933	-0.136522	23488	MID
23341	Victor González	RP	47	L	L	28.3		0	860000.0	9	0.366284	0.0412224	16408	MID
23342	Cody Poteet	SP/RP	72	R	R	29.6		0	740000	9	\N	-0.0154037	18769	MID
23343	Luke Weaver	SP/RP	30	R	R	30.6		0	2000000.0	9	0.434947	0.0917921	16918	LR
23344	Oswald Peraza	SS/3B/2B	91	R	R	23.7	Strained shoulder	0	740000	9	-0.338434	0.981309	22823	Inj
23345	Gerrit Cole	SP	45	R	R	33.5	Elbow discomfort	0	36000000.0	9	5.22698	3.32246	13125	Inj
23346	Tommy Kahnle	RP	41	R	R	34.6	Shoulder inflammation	0	5750000.0	9	0.267539	0.0934155	11384	Inj
23347	Ryan Noda	1B/RF/LF	49	L	L	28.0		0	740000	10	1.98264	1.21421	23312	1
23348	Zack Gelof	2B	20	R	R	24.4		0	740000	10	2.87627	2.30996	29766	2
23349	Brent Rooker	LF/RF	25	R	R	29.4		0	740000	10	2.0082	1.58873	19627	3
23350	Seth Brown	RF/LF/1B	15	L	L	31.7		0	2600000.0	10	-0.0233106	1.09411	18171	4
23351	Shea Langeliers	C	23	R	R	26.3		0	740000	10	0.721299	1.23917	25816	5
23352	JJ Bleday	CF/LF/RF	33	L	L	26.3		0	740000	10	0.13061	0.634145	26368	6
23353	Esteury Ruiz	CF/LF/RF	1	R	R	25.1		0	740000	10	1.20847	1.47608	21780	7
23354	Abraham Toro	3B/2B/1B	31	S	R	27.2		0	1275000.0	10	0.197062	1.0859	19844	8
23355	Nick Allen	SS/2B	10	R	R	25.4		0	740000	10	-0.117435	1.14872	22277	9
23356	Tyler Soderstrom	C/1B	21	L	R	22.3		0	740000	10	-1.04268	0.0673921	27467	Bench
23357	Darell Hernaiz	SS/3B/2B	48	R	R	22.6		0	740000	10	\N	\N	\N	Bench
23358	Miguel Andujar	RF/1B/LF	22	R	R	29.0		0	1700000.0	10	0.138451	0.600375	15878	Bench
23359	Lawrence Butler	CF/RF/1B	2	L	R	23.7		0	740000	10	-0.206836	0.522011	22542	Bench
23360	JP Sears	SP	38	9	L	28.1		0	740000	10	0.628044	1.71668	23429	SP1
23361	Paul Blackburn	SP	58	R	R	30.3		0	3450000.0	10	1.53379	1.26968	14739	SP2
23362	Alex Wood	SP	57	R	L	33.2		0	8500000.0	10	0.18418	1.35566	13781	SP3
23363	Ross Stripling	SP/RP	36	R	R	34.3		0	12500000.0	10	-0.253237	1.34738	13273	SP4
23364	Joe Boyle	SP	35	R	R	24.6		0	740000	10	0.401614	0.529146	29608	SP5
23365	Mason Miller	SP	19	R	R	25.6		0	740000	10	0.688787	1.23769	31757	CL
23366	Lucas Erceg	RP	70	L	R	28.9		0	740000	10	0.832249	0.403469	19360	CL
23367	Dany Jiménez	RP	56	R	R	30.2		0	740000	10	0.0620978	0.208656	21170	SU7
23368	Sean Newcomb	SP/RP	16	L	L	30.8		0	1000000.0	10	0.16352	0.00477957	16943	MID
23369	Trevor Gott	RP	17	R	R	31.5		0	1500000.0	10	0.998989	0.304966	15046	MID
23370	Scott Alexander	RP	54	L	L	34.7		0	2250000.0	10	0.671266	0.214165	10591	MID
23371	Kyle Muller	SP	39	R	L	26.4		0	740000	10	-0.65512	0.189316	20167	MID
23372	Mitch Spence	SP	69	R	R	25.9		0	740000	10	\N	0.338798	\N	LR
23373	Aledmys Díaz	SS/3B/LF	6	R	R	33.6	Strained groin	0	7250000.0	10	-0.403078	0.19414	15937	Inj
23374	Luis Medina	SP	46	R	R	24.9	Sprained knee	0	740000	10	0.480068	0.683312	21649	Inj
23375	Freddy Tarnok	SP	62	R	R	25.3	Hip surgery	0	740000	10	-0.342616	0.00512618	23324	Inj
23376	J.P. Crawford	SS	3	L	R	29.2		0	10200000.0	11	4.9171	3.33869	15491	1
23377	Julio Rodríguez	CF/RF	44	R	R	23.2		0	17441666.66666667	11	5.86238	5.50872	23697	2
23378	Jorge Polanco	2B/3B/SS	7	S	R	30.7		0	10500000.0	11	1.52277	2.41032	13152	3
23379	Mitch Garver	C/1B	18	R	R	33.2		0	12000000.0	11	2.1145	1.44275	15161	4
23380	Cal Raleigh	C	29	S	R	27.3		0	740000	11	4.69106	3.65587	21534	5
23381	Mitch Haniger	RF/LF	17	R	R	33.2		0	17750000.0	11	-0.215692	1.01557	14274	6
23382	Dominic Canzone	LF/RF	8	L	R	26.6		0	740000	11	-0.452409	0.880599	26438	7
23383	Ty France	1B/3B	23	R	R	29.7		0	6775000.0	11	0.543346	2.07224	17982	8
23384	Josh Rojas	2B/3B/SS	4	L	R	29.7		0	3100000.0	11	1.13675	0.857774	19734	9
23385	Seby Zavala	C	33	R	R	30.5		0	740000	11	0.241014	0.34507	18887	Bench
23386	Luis Urías	3B/2B/SS	16	R	R	26.8		0	5000000.0	11	-0.0830997	1.21486	16622	Bench
23387	Dylan Moore	2B/LF/SS	25	R	R	31.6		0	2958333.33333333	11	0.660604	0.769591	18042	Bench
23388	Luke Raley	RF/1B/LF	20	L	R	29.5		0	740000	11	2.6285	1.0248	19354	Bench
23389	Luis Castillo	SP	58	R	R	31.2		0	21600000.0	11	3.43067	3.77071	15689	SP1
23390	Logan Gilbert	SP	36	R	R	26.9		0	4050000.0	11	3.17108	3.0227	22250	SP3
23391	George Kirby	SP	68	R	R	26.1		0	740000	11	4.37777	3.70718	25436	SP3
23392	Bryce Miller	SP	50	R	R	25.6		0	740000	11	1.94188	1.63302	29837	SP4
23393	Bryan Woo	SP	22	R	R	24.1		0	740000	11	0.979788	1.49001	30279	SP5
23394	Andrés Muñoz	RP	75	R	R	25.2		0	1875000.0	11	1.25484	1.48831	20373	CL
23395	Ryne Stanek	RP	45	R	R	32.6		0	4000000.0	11	0.0604905	0.218664	15947	SU8
23396	Gabe Speier	RP	55	L	L	28.9		0	740000	11	0.604154	0.462888	17170	SU7
23397	Trent Thornton	RP	46	R	R	30.5		0	1200000.0	11	0.0698069	-0.0381708	17948	MID
23398	Tayler Saucedo	RP	60	L	L	30.7		0	740000	11	0.227025	0.0044017	17888	MID
23399	Carlos Vargas	RP	54	R	R	24.4		0	740000	11	-0.125017	-0.159675	22915	MID
23400	Austin Voth	SP/RP	30	R	R	31.7		0	1250000.0	11	-0.256777	0.067724	15047	LR
23401	Matt Brash	RP	47	R	R	25.8	Elbow inflammation	0	740000	11	2.07265	0.158632	25756	Inj
23402	Gregory Santos	RP	48	R	R	24.5	Strained lat	0	740000	11	1.55479	0.271834	21894	Inj
23403	Yandy Díaz	1B	2	R	R	32.6		0	8000000.0	12	4.7248	3.6784	16578	1
23404	Brandon Lowe	2B	8	L	R	29.7		0	4000000.0	12	2.81045	2.78816	18882	2
23405	Randy Arozarena	LF/RF	56	R	R	29.0		0	8100000.0	12	3.34717	3.18269	19290	3
23406	Josh Lowe	RF/CF/LF	15	L	R	26.1		0	740000	12	3.81331	2.51692	19953	4
23407	Isaac Paredes	3B/1B/2B	17	R	R	25.1		0	3400000.0	12	4.32223	3.41864	20036	5
23408	Jonathan Aranda	2B/1B/3B	62	L	R	25.8		0	740000	12	0.142106	0.664798	21837	6
23409	Jose Siri	CF	22	R	R	28.6		0	740000	12	2.70443	1.88931	17452	7
23410	José Caballero	2B/SS/3B	7	R	R	27.5		0	740000	12	2.17151	1.49348	23401	8
23411	René Pinto	C	50	R	R	27.4		0	740000	12	0.65305	1.6186	19859	9
23412	Curtis Mead	3B/2B	25	R	R	23.4		0	740000	12	0.193188	0.250047	23986	Bench
23413	Amed Rosario	SS/2B	10	R	R	28.3		0	1500000.0	12	0.191354	1.01072	15518	Bench
23414	Harold Ramírez	1B/RF/LF	43	R	R	29.5		0	3800000.0	12	1.79116	0.467774	14387	Bench
23415	Zach Eflin	SP	24	R	R	29.9		0	13333333.33333333	12	4.79957	3.64944	13774	SP1
23416	Aaron Civale	SP	34	R	R	28.8		0	4900000.0	12	2.53356	1.96567	19479	SP2
23417	Zack Littell	SP	52	R	R	28.4		0	1850000.0	12	1.09345	1.16356	15823	SP3
23418	Ryan Pepiot	SP	44	R	R	26.6		0	740000	12	0.40885	1.06574	26221	SP4
23419	Tyler Alexander	RP	14	R	L	29.7		0	1950000.0	12	0.110816	0.0142343	17735	SP5
23420	Pete Fairbanks	RP	29	R	R	30.2		0	4000000.0	12	1.32315	1.81363	17998	CL
23421	Jason Adam	RP	47	R	R	32.6		0	2700000.0	12	0.375314	0.761997	11861	SU8
23422	Colin Poche	RP	38	L	L	30.2		0	2375000.0	12	1.09391	0.373051	19403	SU7
23423	Phil Maton	RP	88	R	R	31.0		0	6500000.0	12	0.581598	-0.00685829	18064	MID
23424	Shawn Armstrong	RP	64	R	R	33.5		0	2050000.0	12	1.27797	0.379178	12857	MID
23425	Garrett Cleavinger	RP	60	L	L	29.9		0	740000	12	-0.0914965	0.228532	17897	MID
23426	Kevin Kelly	RP	49	R	R	26.3		0	740000	12	1.19024	0.0640615	25679	MID
23427	Chris Devenski	RP	48	R	R	33.3		0	1100000.0	12	0.54109	0.124092	12763	LR
23428	Taylor Walls	2B/3B/SS	6	S	R	27.7	Hip surgery (labrum repair)	0	740000	12	0.972517	0.911972	22458	Inj
23429	Jonny DeLuca	CF/RF/LF	21	R	R	25.7	Fractured hand	0	740000	12	0.29306	0.479409	26365	Inj
23430	Taj Bradley	SP	45	R	R	23.0	Strained pectoral	0	740000	12	0.773533	1.44096	22543	Inj
23431	Jeffrey Springs	SP	59	L	L	31.5	Tommy John surgery	0	7750000.0	12	0.717778	0.848545	17677	Inj
23432	Marcus Semien	2B/SS	2	R	R	33.5		0	25000000.0	13	6.30571	4.41403	12533	1
23433	Evan Carter	CF/LF/RF	32	L	R	21.5		0	740000	13	1.32277	2.50693	27790	2
23434	Adolis García	RF/CF/LF	53	R	R	31.0		0	7000000.0	13	4.81881	2.54749	19287	4
23435	Jonah Heim	C	28	S	R	28.7		0	3050000.0	13	4.13381	3.57761	16930	5
23436	Josh Jung	3B	6	R	R	26.1		0	740000	13	2.53669	2.50293	26299	6
23437	Leody Taveras	CF	3	S	R	25.5		0	2550000.0	13	2.27493	2.23157	18900	7
23438	Justin Foscue	2B/3B/1B	56	R	R	25.0		0	740000	13	\N	\N	\N	8
23439	Ezequiel Duran	SS/LF/3B	20	R	R	24.8		0	740000	13	0.934263	0.474769	23733	9
23440	Andrew Knizner	C	12	R	R	29.1		0	1825000.0	13	-0.138374	0.0572366	19514	Bench
23441	Jose Barrero	SS/CF/RF	19	R	R	25.9		0	740000	13	-0.319211	0.0532132	23378	Bench
23442	Josh Smith	SS/3B/LF	8	L	R	26.6		0	740000	13	-0.0197066	0.362482	26396	Bench
23443	Travis Jankowski	CF/LF/RF	16	L	R	32.7		0	1700000.0	13	1.04519	0.330611	13768	Bench
23444	Nathan Eovaldi	SP	17	R	R	34.1		0	17000000.0	13	2.4815	2.28059	9132	SP1
23445	Jon Gray	SP	22	R	R	32.4		0	14000000.0	13	1.84679	2.29795	14916	SP2
23446	Andrew Heaney	SP	44	L	L	32.8		0	12500000.0	13	1.33566	1.40764	15423	SP3
23447	Dane Dunning	SP	33	R	R	29.2		0	3325000.0	13	2.12197	1.83811	19409	SP4
23448	Cody Bradford	SP	61	L	L	26.1		0	740000	13	0.318508	0.465572	27597	SP5
23449	José Leclerc	RP	25	R	R	30.2		0	6250000.0	13	0.89813	0.412367	14524	CL
23450	David Robertson	RP	37	R	R	38.9		0	10533289.0	13	1.16843	0.31878	8241	CL
23451	Josh Sborz	RP	66	R	R	30.2		0	1025000.0	13	0.714602	0.730409	18323	SU8
23452	Kirby Yates	RP	39	L	R	37.0		0	4500000.0	13	-0.133293	-0.0305093	9073	SU7
23453	Brock Burke	RP	46	L	L	27.6		0	1035000.0	13	-0.189239	0.307941	17968	MID
23454	Marc Church	RP	68	R	R	23.0		0	740000	13	\N	0.0382531	\N	MID
23455	Grant Anderson	RP	65	R	R	26.7		0	740000	13	0.111081	0.087695	20546	MID
23456	Nathaniel Lowe	1B	30	L	R	28.7	Strained oblique	0	7500000.0	13	2.09119	1.99042	19566	Inj
23457	Corey Seager	SS	5	L	R	29.9	Sports hernia surgery	0	32500000.0	13	6.09536	4.60932	13624	Inj
23458	Jacob deGrom	SP	48	L	R	35.7	Tommy John surgery	0	37000000.0	13	1.46642	0.889795	10954	Inj
23459	Tyler Mahle	SP	51	R	R	29.5	Tommy John surgery	0	11000000.0	13	0.359239	0.56232	16358	Inj
23460	Max Scherzer	SP	31	R	R	39.6	Back surgery (herniated disc)	0	43333333.33333333	13	2.16102	1.96522	3137	Inj
23461	Jonathan Hernández	RP	72	R	R	27.7	Strained lat	0	1245000.0	13	0.065728	0.0482646	17464	Inj
23462	George Springer	CF/RF	4	R	R	34.5		0	25000000.0	14	2.16945	2.85746	12856	1
23463	Bo Bichette	SS	11	R	R	26.0		0	11200000.0	14	3.83659	4.07529	19612	2
23464	Vladimir Guerrero Jr.	1B	27	R	R	25.0		0	19900000.0	14	0.984238	3.627	19611	3
23465	Justin Turner	1B/3B	2	R	R	39.3		0	13000000.0	14	1.19924	1.63185	5235	4
23466	Daulton Varsho	CF/LF	25	L	R	27.7		0	5650000.0	14	2.13315	2.81835	19918	5
23467	Alejandro Kirk	C	30	R	R	25.3		0	2800000.0	14	1.63648	2.8858	22581	6
23468	Kevin Kiermaier	CF	39	L	R	33.9		0	10500000.0	14	2.17153	1.70814	11038	7
23469	Isiah Kiner-Falefa	3B/SS/CF	7	R	R	29.0		0	7500000.0	14	0.15289	0.707573	16512	8
23470	Cavan Biggio	2B/RF/1B	8	L	R	28.9		0	4210000.0	14	1.03462	0.930434	19252	9
23471	Danny Jansen	C	9	R	R	28.9		0	5200000.0	14	2.0016	2.18331	16535	Bench
23472	Ernie Clement	SS/2B/3B	28	R	R	28.0		0	740000	14	0.645304	0.385711	20352	Bench
23473	Davis Schneider	2B/LF/3B	36	R	R	25.1		0	740000	14	2.00775	1.58793	23565	Bench
23474	Nathan Lukes	RF/LF/CF	38	L	R	29.7		0	740000	14	0.027638	0.246479	18123	Bench
23475	José Berríos	SP	17	R	R	29.8		0	18714285.71428571	14	2.96652	2.4398	14168	SP1
23476	Chris Bassitt	SP	40	R	R	35.1		0	21000000.0	14	2.64196	2.86143	12304	SP2
23477	Yusei Kikuchi	SP	16	L	L	32.7		0	12000000.0	14	2.59685	1.8996	20633	SP3
23478	Kevin Gausman	SP	34	R	R	33.2		0	22000000.0	14	5.29544	4.37359	14107	SP4
23479	Bowden Francis	SP/RP	44	R	R	27.9		0	740000	14	0.198577	0.244247	20548	SP5
23480	Jordan Romano	RP	68	R	R	30.9		0	7750000.0	14	1.22394	1.03394	16122	CL
23481	Erik Swanson	RP	50	R	R	30.5		0	2750000.0	14	0.908013	0.661986	16587	SU8
23482	Yimi García	RP	93	R	R	33.6		0	6000000.0	14	1.02946	0.490331	12095	SU7
23483	Tim Mayza	RP	58	L	L	32.2		0	3590000.0	14	1.30318	0.464953	15042	MID
23484	Chad Green	RP	57	L	R	32.8		0	10500000.0	14	0.264916	0.420873	15552	MID
23485	Génesis Cabrera	RP	92	L	L	27.4		0	1512500.0	14	0.161903	0.0770969	17490	MID
23486	Trevor Richards	RP	33	R	R	30.8		0	2150000.0	14	0.410727	0.106358	19309	MID
23487	Mitch White	SP/RP	45	R	R	29.2		0	740000	14	-0.0372322	0.182521	19225	LR
23488	Alek Manoah	SP	6	R	R	26.2	Shoulder soreness	0	740000	14	-0.3985	1.02283	26410	Inj
23489	Corbin Carroll	LF/RF/CF	7	L	L	23.6		0	13875000.0	15	5.98997	4.8872	25878	1
23490	Ketel Marte	2B	4	S	R	30.4		0	15200000.0	15	4.21349	3.69349	13613	2
23491	Gabriel Moreno	C	14	R	R	24.1		0	740000	15	1.67446	3.31818	22664	3
23492	Christian Walker	1B	53	R	R	33.0		0	10900000.0	15	3.83477	2.55836	13419	4
23493	Joc Pederson	LF/RF	3	L	L	31.9		0	12500000.0	15	0.620167	1.16429	11899	5
23494	Lourdes Gurriel Jr.	LF	12	R	R	30.6		0	14000000.0	15	2.11194	1.57198	19238	6
23495	Eugenio Suárez	3B	28	R	R	32.7		0	11285714.0	15	3.16299	1.70074	12552	7
23496	Alek Thomas	CF/LF	5	L	L	23.9		0	740000	15	0.500793	2.08325	23792	8
23497	Geraldo Perdomo	SS/2B/3B	2	S	R	24.4		0	740000	15	2.71852	1.46957	22799	9
23498	Blaze Alexander	SS/2B/3B	62	R	R	24.8		0	740000	15	\N	\N	\N	Bench
23499	Jace Peterson	3B/2B/RF	6	L	R	33.8		0	5000000.0	15	0.380732	0.133542	12325	Bench
23500	Randal Grichuk	LF/RF/CF	15	R	R	32.6		0	2000000.0	15	0.64472	0.204921	10243	Bench
23501	Zac Gallen	SP	23	R	R	28.6		0	10011000.0	15	5.16585	3.3491	19291	SP1
23502	Merrill Kelly	SP	29	R	R	35.4		0	9000000.0	15	3.1732	2.37248	11156	SP2
23503	Eduardo Rodriguez	SP	57	L	L	30.9		0	20000000.0	15	3.00055	3.04119	13164	SP3
23504	Brandon Pfaadt	SP	32	R	R	25.4		0	740000	15	0.334563	2.19977	27782	SP4
23505	Ryne Nelson	SP	19	R	R	26.1		0	740000	15	0.736399	0.900224	26253	SP5
23506	Paul Sewald	RP	38	R	R	33.8		0	7350000.0	15	0.860328	0.683125	13892	CL
23507	Kevin Ginkel	RP	37	R	R	30.0		0	1225000.0	15	1.27792	0.710875	19876	SU8
23508	Miguel Castro	RP	50	R	R	29.2		0	5000000.0	15	0.199257	0.232865	15684	SU7
23509	Andrew Saalfrank	RP	27	L	L	26.6		0	740000	15	0.13411	0.277441	26203	MID
23510	Scott McGough	RP	30	R	R	34.4		0	3125000.0	15	-0.0954781	0.33482	12056	MID
23511	Ryan Thompson	RP	81	R	R	31.7		0	1350000.0	15	0.0965167	0.133461	16647	MID
23512	Joe Mantiply	RP	35	R	L	33.0		0	925000.0	15	0.262859	0.0654986	14857	MID
23513	Luis Frías	RP	65	R	R	25.8		0	740000	15	-0.0613043	0.0337297	21997	LR
23514	Ronald Acuña Jr.	RF/CF	13	R	R	26.2		0	12500000.0	16	8.28978	7.44593	18401	1
23515	Ozzie Albies	2B	1	S	R	27.2		0	5000000.0	16	4.03327	3.64827	16556	2
23516	Austin Riley	3B	27	R	R	26.9		0	21200000.0	16	5.22673	4.42754	18360	3
23517	Matt Olson	1B	28	L	R	30.0		0	21000000.0	16	6.7039	4.24696	14344	4
23518	Marcell Ozuna	LF/RF	20	R	R	33.3		0	16250000.0	16	3.27261	1.46553	10324	5
23519	Michael Harris II	CF	23	L	L	23.0		0	9000000.0	16	3.96744	4.3555	25931	6
23520	Sean Murphy	C	12	R	R	29.4		0	12166666.66666667	16	4.21552	3.50951	19352	7
23521	Jarred Kelenic	LF/RF/CF	24	L	L	24.7		0	740000	16	1.313	1.00038	22558	8
23522	Orlando Arcia	SS/3B/2B	11	R	R	29.6		0	2433333.33333333	16	2.27328	1.69776	13185	9
23523	Travis d'Arnaud	C	16	R	R	35.1		0	8000000.0	16	0.912818	1.46866	7739	Bench
23524	Luis Guillorme	SS/3B/2B	15	L	R	29.5		0	1100000.0	16	-0.252101	0.222061	16451	Bench
23525	Forrest Wall	CF/LF/RF	73	L	R	28.3		0	740000	16	0.423458	0.0643814	16496	Bench
23526	Spencer Strider	SP	99	R	R	25.4		0	12500000.0	16	5.5186	4.95972	27498	SP1
23527	Max Fried	SP	54	L	L	30.1		0	15000000.0	16	1.89109	3.61105	13743	SP2
23528	Charlie Morton	SP	50	R	R	40.3		0	20000000.0	16	2.70492	1.98379	4676	SP3
23529	Chris Sale	SP	51	L	L	35.0		0	19000000.0	16	2.11804	2.81327	10603	SP4
23530	Reynaldo López	RP	40	R	R	30.2		0	10000000.0	16	0.787936	1.00393	16400	SP5
23531	Raisel Iglesias	RP	26	R	R	34.2		0	16000000.0	16	1.03684	1.25433	17130	CL
23532	A.J. Minter	RP	33	L	L	30.5		0	6220000.0	16	1.44444	1.17179	18655	SU8
23533	Joe Jiménez	RP	77	R	R	29.2		0	8666666.66666667	16	0.488828	0.517345	15761	SU7
23534	Pierce Johnson	RP	38	R	R	32.8		0	7125000.0	16	0.689104	0.585016	13435	MID
23535	Tyler Matzek	RP	68	L	L	33.4		0	1550000.0	16	\N	-0.0271048	10058	MID
23536	Aaron Bummer	RP	49	L	L	30.5		0	6750000.0	16	0.78827	0.417	16258	MID
23537	Dylan Lee	RP	52	L	L	29.6		0	740000	16	0.0428495	0.102753	19996	MID
23538	Jackson Stephens	RP	53	R	R	29.8		0	740000	16	0.0643341	0.00199233	14420	LR
23539	Penn Murfee	RP	56	R	R	29.9	Elbow surgery	0	740000	16	0.0394554	0.00761382	25174	Inj
23540	Angel Perdomo	RP	67	L	L	29.9	Tommy John surgery	0	740000	16	0.492218	\N	17759	Inj
23541	Ian Anderson	SP	48	R	R	25.9		0	740000	16	\N	0.197367	19951	Inj
23542	Nico Hoerner	2B/SS	2	R	R	26.8		0	11666666.66666667	17	4.668	3.77112	21479	1
23543	Dansby Swanson	SS	7	R	R	30.1		0	25285714.28571429	17	4.93552	3.73568	18314	2
23544	Ian Happ	LF/CF	8	S	R	29.6		0	20333333.33333333	17	3.50068	2.89501	17919	3
23545	Cody Bellinger	CF/1B/RF	24	L	L	28.7		0	26666666.66666667	17	4.10778	2.50383	15998	4
23546	Seiya Suzuki	RF/LF	27	R	R	29.6		0	17000000.0	17	3.18037	2.37604	30116	5
23547	Christopher Morel	CF/2B/3B	5	R	R	24.7		0	740000	17	1.40019	1.62272	21897	6
23548	Michael Busch	2B/3B/1B	29	L	R	26.3		0	740000	17	-0.519409	0.980207	26319	7
23549	Yan Gomes	C	15	R	R	36.7		0	6000000.0	17	0.950708	0.8951	9627	8
23550	Mike Tauchman	CF/RF/LF	40	L	L	33.3		0	1950000.0	17	1.75714	0.782577	15274	9
23551	Miguel Amaya	C	9	R	R	25.0		0	740000	17	0.575682	0.932635	21693	Bench
23552	Nick Madrigal	2B/3B	1	R	R	27.0		0	1810000.0	17	0.933676	0.98039	20521	Bench
23553	Patrick Wisdom	3B/1B/LF	16	R	R	32.5		0	2725000.0	17	0.742798	0.716251	13602	Bench
23554	Justin Steele	SP	35	L	L	28.7		0	4000000.0	17	4.8721	3.166	17312	SP1
23555	Shota Imanaga	SP	18	L	L	30.5		0	740000	17	\N	2.89505	\N	SP2
23556	Kyle Hendricks	SP	28	R	R	34.3		0	16000000.0	17	2.75693	1.59694	12049	SP3
23557	Jordan Wicks	SP	36	L	L	24.5		0	740000	17	0.279402	1.21267	30094	SP4
23558	Hayden Wesneski	SP/RP	19	R	R	26.3		0	740000	17	-0.309712	0.437614	27581	SP5
23559	Adbert Alzolay	RP	73	R	R	29.0		0	2110000.0	17	1.50633	0.93593	17859	CL
23560	Héctor Neris	RP	51	R	R	34.7		0	9000000.0	17	0.842547	0.65507	11804	SU8
23561	Julian Merryweather	RP	66	R	R	32.4		0	1175000.0	17	0.887263	0.750761	16703	SU7
23562	Drew Smyly	RP/SP	11	L	L	34.7		0	9500000.0	17	0.949364	0.371163	11760	MID
23563	Mark Leiter Jr.	RP	38	R	R	33.0		0	1500000.0	17	0.635761	0.23325	15551	MID
23564	Jose Cuas	RP	74	R	R	29.7		0	740000	17	-0.0402487	0.0627907	17701	MID
23565	Yency Almonte	RP	25	S	R	29.8		0	1900000.0	17	0.105339	0.0695647	15068	MID
23566	Javier Assad	SP/RP	72	R	R	26.6		0	740000	17	0.915767	0.629898	21741	LR
23567	Caleb Kilian	SP	45	R	R	26.8	Strained shoulder	0	740000	17	0.0120158	0.0104014	26213	Inj
23568	Jameson Taillon	SP	50	R	R	32.3	Lower back tightness	0	17000000.0	17	1.58908	1.77371	11674	Inj
23569	TJ Friedl	CF/LF/RF	29	L	L	28.6		0	740000	18	4.40579	2.26873	19522	1
23570	Elly De La Cruz	SS/3B	44	S	R	22.2		0	740000	18	1.70713	2.04523	26668	2
23571	Matt McLain	SS/2B	9	R	R	24.6		0	740000	18	3.23862	3.09303	29695	3
23572	Jeimer Candelario	3B/1B	3	S	R	30.3		0	15000000.0	18	3.29343	1.87148	13621	4
23573	Spencer Steer	1B/3B/LF	7	R	R	26.3		0	740000	18	2.12809	1.82282	26323	5
23574	Jonathan India	2B/3B	6	R	R	27.2		0	4400000.0	18	1.22268	1.38554	21523	6
23575	Will Benson	RF/LF/CF	30	L	L	25.7		0	740000	18	1.70435	1.18694	21853	7
23576	Christian Encarnacion-Strand	1B/3B	33	R	R	24.3		0	740000	18	0.502859	1.52414	30011	8
23577	Tyler Stephenson	C	37	R	R	27.6		0	2525000.0	18	-0.716944	0.980318	17988	9
23578	Luke Maile	C	22	R	R	33.1		0	3500000.0	18	0.22567	0.631202	13355	Bench
23579	Stuart Fairchild	LF/RF/CF	17	R	R	28.0		0	740000	18	0.725193	0.29743	20321	Bench
23580	Jake Fraley	RF/LF	27	L	L	28.8		0	2150000.0	18	1.44956	1.14312	19260	Bench
23581	Frankie Montas	SP	47	R	R	31.0		0	16000000.0	18	0.00533974	2.06858	14309	SP1
23582	Hunter Greene	SP	21	R	R	24.6		0	8833333.33333333	18	1.95078	2.55702	22182	SP2
23583	Graham Ashcraft	SP	51	L	R	26.1		0	740000	18	1.47852	2.19013	27552	SP3
23584	Nick Martinez	SP/RP	28	L	R	33.6		0	13000000.0	18	1.3516	1.83388	12730	SP4
23585	Andrew Abbott	SP	41	L	L	24.8		0	740000	18	2.15651	1.8767	29911	SP5
23586	Alexis Díaz	RP	43	R	R	27.5		0	740000	18	1.71998	0.78946	21132	CL
23587	Emilio Pagán	RP	15	L	R	32.9		0	8000000.0	18	1.1482	0.520302	14771	SU8
23588	Lucas Sims	RP	39	R	R	29.8		0	2850000.0	18	0.765489	0.204153	13470	SU7
23589	Fernando Cruz	RP	63	R	R	34.0		0	740000	18	1.61811	0.390266	7048	MID
23590	Brent Suter	RP	31	R	L	34.5		0	3000000.0	18	1.32928	0.173439	13942	MID
23591	Buck Farmer	RP	46	L	R	33.1		0	2250000.0	18	0.582725	0.134493	14814	MID
23592	Tejay Antone	RP	70	R	R	30.3		0	830000.0	18	0.193492	0.0141527	16233	MID
23593	Nick Lodolo	SP	40	L	L	26.1	Stress reaction in leg	0	740000	18	0.0374547	1.96008	26378	Inj
23594	Ian Gibaut	RP	79	R	R	30.3	Strained forearm	0	740000	18	0.901424	0.099507	17871	Inj
23595	Sam Moll	RP	50	L	L	32.2	Shoulder soreness	0	740000	18	1.16409	0.060745	14874	Inj
23596	Charlie Blackmon	RF/LF	19	L	L	37.7		0	13000000.0	19	0.834711	0.0694868	7859	1
23597	Kris Bryant	LF/RF/1B	23	R	R	32.2		0	26000000.0	19	-1.20415	0.71054	15429	2
23598	Nolan Jones	RF/LF	22	L	R	25.9		0	740000	19	3.68969	2.72224	20529	3
23599	Brendan Rodgers	2B	7	R	R	27.6		0	3200000.0	19	-0.0423775	1.66228	17907	4
23600	Ryan McMahon	3B	24	L	R	29.2		0	11666666.66666667	19	1.18546	1.79494	15112	5
23601	Elias Díaz	C	35	R	R	33.3		0	4833333.33333333	19	0.0136861	-0.455152	11680	6
23602	Sean Bouchard	RF/LF/1B	12	R	R	27.8		0	740000	19	0.447028	0.843242	21270	7
23603	Ezequiel Tovar	SS	14	R	R	22.6		0	740000	19	1.60812	1.60634	24064	8
23604	Brenton Doyle	CF/RF/LF	9	R	R	25.8		0	740000	19	0.86549	0.502085	25479	9
23605	Jacob Stallings	C	25	R	R	34.2		0	2000000.0	19	-0.777576	0.407684	13723	Bench
23606	Elehuris Montero	1B/3B	44	R	R	25.6		0	740000	19	-0.855567	0.114972	20543	Bench
23607	Sam Hilliard	CF/LF/RF	16	L	L	30.1		0	800000.0	19	0.00566428	0.0284064	17954	Bench
23608	Kyle Freeland	SP	21	L	L	30.8		0	12900000.0	19	1.19596	1.17606	16256	SP1
23609	Cal Quantrill	SP	47	L	R	28.4		0	6550000.0	19	0.719647	1.10813	19312	SP2
23610	Austin Gomber	SP	26	L	L	30.3		0	3150000.0	19	0.943832	1.27921	16561	SP3
23611	Ryan Feltner	SP	18	R	R	27.5		0	740000	19	0.912654	1.32559	21446	SP4
23612	Dakota Hudson	SP/RP	32	R	R	29.5		0	1500000.0	19	0.303916	0.85317	19206	SP5
23613	Justin Lawrence	RP	61	R	R	29.3		0	740000	19	1.19926	0.621947	17639	CL
23614	Tyler Kinley	RP	40	R	R	33.1		0	2083333.33333333	19	0.0751949	0.418735	18297	CL
23615	Jake Bird	RP	59	R	R	28.3		0	740000	19	1.4752	0.336873	21267	SU7
23616	Nick Mears	RP	46	R	R	27.4		0	740000	19	0.158934	0.0561879	25376	MID
23617	Jalen Beeks	RP	69	L	L	30.7		0	1675000.0	19	0.453274	0.158085	17192	MID
23618	Anthony Molina	SP	43	R	R	22.2		0	740000	19	\N	-0.00520357	\N	MID
23619	Evan Justice	RP	56	L	L	25.7		0	740000	19	-0.014347	-0.0613414	30008	MID
23620	Germán Márquez	SP	48	R	R	29.1	Tommy John surgery	0	10000000.0	19	0.242508	0.394532	15038	Inj
23621	Daniel Bard	RP	52	R	R	38.7	Arthroscopic knee surgery	0	9500000.0	19	-0.505631	-0.130024	7115	Inj
23622	Lucas Gilbreath	RP	58	L	L	28.0	Tommy John surgery	0	760000.0	19	\N	0.00208451	21290	Inj
23623	Luis Arraez	2B/1B	3	L	R	26.9		0	10600000.0	20	3.42351	2.42017	18568	1
23624	Josh Bell	1B	9	S	R	31.6		0	16500000.0	20	0.37228	1.2523	13145	2
23625	Jake Burger	3B/1B	36	R	R	27.9		0	740000	20	2.52965	2.28148	22275	3
23626	Jazz Chisholm Jr.	CF/2B	2	L	R	26.1		0	2625000.0	20	1.85896	2.65287	20454	4
23627	Tim Anderson	SS/2B	7	R	R	30.7		0	5000000.0	20	-0.488452	1.29176	15172	5
23628	Jesús Sánchez	RF/LF/CF	12	L	R	26.4		0	2100000.0	20	1.34794	1.27985	19913	6
23629	Avisaíl García	RF/LF	24	R	R	32.8		0	13250000.0	20	-0.33932	-0.204893	5760	7
23630	Bryan De La Cruz	LF/RF/CF	14	R	R	27.2		0	740000	20	0.156962	1.08921	19600	8
23631	Christian Bethancourt	C/1B	25	R	R	32.5		0	2050000.0	20	0.599673	1.21497	10028	9
23632	Nick Fortes	C	4	R	R	27.3		0	740000	20	0.189481	1.28323	21538	Bench
23633	Jon Berti	SS/3B/LF	5	R	R	34.1		0	3625000.0	20	2.07754	1.0401	12037	Bench
23634	Vidal Bruján	2B/SS/RF	17	S	R	26.1		0	740000	20	-0.577593	0.347393	20536	Bench
23635	Nick Gordon	CF/LF/2B	1	L	R	28.4		0	900000.0	20	-0.423461	0.231765	16337	Bench
23636	Jesús Luzardo	SP	44	L	L	26.5		0	5500000.0	20	3.70814	3.20784	19959	SP1
23637	Eury Pérez	SP	39	R	R	20.9		0	740000	20	1.42987	2.57186	27768	SP2
23638	A.J. Puk	RP	35	L	L	28.9		0	1800000.0	20	0.873649	1.472	19343	SP3
23639	Trevor Rogers	SP	28	L	L	26.3		0	1530000.0	20	0.260208	1.56131	22286	SP4
23640	Ryan Weathers	SP/RP	60	R	L	24.4		0	740000	20	-0.24454	0.33966	23796	SP5
23641	Tanner Scott	RP	66	R	L	29.6		0	5700000.0	20	2.79182	1.34199	17586	CL
23642	Andrew Nardi	RP	33	L	L	25.6		0	740000	20	0.836481	0.741715	25942	SU8
23643	Anthony Bender	RP	37	R	R	29.1		0	770000.0	20	\N	0.386441	19742	SU7
23644	George Soriano	RP	62	R	R	25.0		0	740000	20	0.139862	-0.0466839	21863	MID
23645	Sixto Sánchez	SP	45	R	R	25.6		0	740000	20	\N	0.166961	19680	MID
23646	Anthony Maldonado	RP	52	R	R	26.1		0	740000	20	\N	0.0356611	\N	MID
23647	Declan Cronin	RP	51	R	R	26.5		0	740000	20	-0.303855	-0.0803801	25645	MID
23648	Bryan Hoeing	SP/RP	78	R	R	27.4		0	740000	20	-0.374361	0.00250128	26304	LR
23649	Edward Cabrera	SP	27	R	R	25.9	Shoulder impingement	0	740000	20	1.03929	1.33801	21690	Inj
23650	Braxton Garrett	SP	29	R	L	26.6	Shoulder soreness	0	740000	20	2.93034	1.97021	21844	Inj
23651	JT Chargois	RP	84	S	R	33.3	Neck discomfort	0	1285000.0	20	0.378604	-0.0401776	13767	Inj
23652	Jose Altuve	2B	27	R	R	33.9		0	23357142.85714286	21	4.02517	3.85544	5417	1
23653	Yordan Alvarez	LF/1B	44	L	L	26.7		0	19166666.66666667	21	4.50002	5.58671	19556	2
23654	Alex Bregman	3B	2	R	R	30.0		0	20000000.0	21	4.34597	4.66397	17678	3
23655	Kyle Tucker	RF/LF/CF	30	L	R	27.2		0	12000000.0	21	4.93552	4.94733	18345	4
23656	José Abreu	1B	79	R	R	37.1		0	19500000.0	21	-0.641659	1.23739	15676	5
23657	Yainer Diaz	C/1B	21	R	R	25.5		0	740000	21	2.02968	2.11437	23003	6
23658	Chas McCormick	CF/LF/RF	20	R	L	28.9		0	2850000.0	21	3.83422	2.41341	19599	7
23659	Jeremy Peña	SS	3	R	R	26.5		0	740000	21	2.79029	2.55295	21636	8
23660	Jake Meyers	CF/LF/RF	6	R	L	27.7		0	740000	21	1.66995	1.4548	20308	9
23661	Victor Caratini	C/1B	17	S	R	30.6		0	6000000.0	21	1.12143	1.17019	14968	Bench
23662	Jon Singleton	1B	28	L	L	32.5		0	740000	21	-0.507797	0.162788	10441	Bench
23663	Mauricio Dubón	2B/CF/LF	14	R	R	29.7		0	3500000.0	21	1.85737	0.594838	16530	Bench
23664	Corey Julks	LF/RF/CF	9	R	R	28.0		0	740000	21	0.247313	0.0416377	20311	Bench
23665	Framber Valdez	SP	59	L	L	30.3		0	12100000.0	21	4.34135	3.72252	17295	SP1
23666	Cristian Javier	SP	53	R	R	27.0		0	12800000.0	21	1.92274	1.6648	17606	SP2
23667	José Urquidy	SP	65	R	R	28.9		0	3750000.0	21	0.176422	1.10115	18413	SP3
23668	Hunter Brown	SP	58	R	R	25.5		0	740000	21	1.77184	2.29265	25880	SP4
23669	J.P. France	SP	68	R	R	28.9		0	740000	21	1.25907	0.565171	21212	SP5
23670	Josh Hader	RP	71	L	L	29.9		0	19000000.0	21	1.71502	1.24651	14212	CL
23671	Ryan Pressly	RP	55	R	R	35.2		0	15000000.0	21	1.06421	1.0478	7005	SU8
23672	Bryan Abreu	RP	52	R	R	26.6		0	1750000.0	21	1.48591	0.940639	16609	SU7
23673	Rafael Montero	RP	47	R	R	33.4		0	11500000.0	21	0.10599	0.225155	12760	MID
23674	Ronel Blanco	SP/RP	56	R	R	30.5		0	740000	21	-0.38248	0.187454	19407	MID
23675	Bennett Sousa	RP	62	L	L	28.9		0	740000	21	0.129061	0.164593	21345	MID
23676	Seth Martinez	RP	61	R	R	29.5		0	740000	21	0.110119	0.0259598	21045	MID
23677	Brandon Bielak	SP/RP	64	L	R	27.9		0	740000	21	0.108847	-0.0149923	19866	LR
23678	Shawn Dubin	SP/RP	66	R	R	28.5	Shoulder inflammation	0	740000	21	0.0971705	0.00152089	24977	Inj
23679	Luis Garcia	SP	77	R	R	27.2	Tommy John surgery	0	1875000.0	21	0.686535	0.27031	23735	Inj
23680	Lance McCullers Jr.	SP	43	L	R	30.4	Elbow surgery (flexor tendon/bone spur)	0	17000000.0	21	\N	1.01627	14120	Inj
23681	Justin Verlander	SP	35	R	R	41.1	Shoulder soreness	0	40555555.33333333	21	3.30348	2.18036	8700	Inj
23682	Kendall Graveman	RP	31	R	R	33.2	Shoulder surgery	0	8000000.0	21	-0.106448	\N	15514	Inj
23683	Mookie Betts	RF/2B/SS	50	R	R	31.4		0	25554824.0	22	8.25861	5.93389	13611	1
23684	Shohei Ohtani	DH/SP	17	L	R	29.7		0	46078769.0	22	6.62505	3.88278	19755	2
23685	Freddie Freeman	1B	5	L	R	34.5		0	24700000.0	22	7.89772	4.53206	5361	3
23686	Will Smith	C	16	R	R	29.0		0	8550000.0	22	4.38712	4.08785	19197	4
23687	Max Muncy	3B/1B/2B	13	L	R	33.5		0	12000000.0	22	2.86119	2.2188	13301	5
23688	James Outman	CF/RF/LF	33	L	R	26.8		0	740000	22	4.38091	2.63859	24770	6
23689	Teoscar Hernández	RF/LF	37	R	R	31.4		0	20433933.0	22	1.7507	1.95048	13066	7
23690	Jason Heyward	RF/CF/LF	23	L	L	34.6		0	9000000.0	22	2.20124	1.11241	4940	8
23691	Gavin Lux	SS/2B	9	L	R	26.3		0	1225000.0	22	\N	1.75848	19955	9
23692	Austin Barnes	C	15	R	R	34.2		0	3500000.0	22	-0.782695	0.470839	12158	Bench
23693	Miguel Rojas	SS/2B/3B	11	R	R	35.0		0	5500000.0	22	0.567352	0.668204	7802	Bench
23694	Chris Taylor	LF/SS/3B	3	R	R	33.5		0	15000000.0	22	1.87248	1.02584	13757	Bench
23695	Enrique Hernández	SS/2B/CF	8	R	R	32.6		0	4000000.0	22	-1.26821	0.506761	10472	Bench
23696	Tyler Glasnow	SP	31	L	R	30.6		0	27312500.0	22	3.15045	3.26853	14374	SP1
23697	Yoshinobu Yamamoto	SP	18	R	R	25.6		0	740000	22	\N	3.83163	\N	SP2
23698	Bobby Miller	SP	28	L	R	24.9		0	740000	22	2.82602	2.64263	27483	SP3
23699	James Paxton	SP	65	L	L	35.3		0	7000000.0	22	1.03795	1.53999	11828	SP4
23700	Gavin Stone	SP	71	R	R	25.4		0	740000	22	-0.456207	0.290409	27792	SP5
23701	Evan Phillips	RP	59	R	R	29.5		0	4000000.0	22	1.19979	0.884377	17734	CL
23702	Joe Kelly	RP	99	R	R	35.8		0	8000000.0	22	0.860614	0.537019	9761	SU8
23703	Ryan Brasier	RP	57	R	R	36.5		0	4500000.0	22	1.12994	0.421717	5615	SU7
23704	Alex Vesia	RP	51	L	L	27.9		0	1000000.0	22	0.694331	0.487386	25007	MID
23705	Blake Treinen	RP	49	R	R	35.7		0	1000000.0	22	\N	0.211155	12572	MID
23706	Ryan Yarbrough	SP/RP	56	R	L	32.2		0	3900000.0	22	0.833742	0.25793	16502	MID
23707	Michael Grove	SP	78	R	R	27.2		0	740000	22	0.765218	0.178767	23221	LR
23708	Walker Buehler	SP	21	R	R	29.6	Tommy John surgery	0	8025000.0	22	\N	2.3387	19374	Inj
23709	Emmet Sheehan	SP	80	R	R	24.3	Shoulder soreness	0	740000	22	0.463863	1.08882	29839	Inj
23710	Brusdar Graterol	RP	48	R	R	25.5	Hip tightness	0	2700000.0	22	1.39116	0.685704	20367	Inj
23711	Nick Frasso	SP	79	R	R	25.4		0	740000	22	\N	\N	\N	Inj
23712	Garrett Mitchell	CF/RF/LF	5	L	R	25.5		0	740000	23	0.373873	0.91521	27555	1
23713	William Contreras	C	24	R	R	26.2		0	740000	23	5.36165	3.87695	20503	2
23714	Christian Yelich	LF/RF	22	L	R	32.3		0	23888888.88888889	23	4.1323	2.40296	11477	3
23715	Rhys Hoskins	1B	12	R	R	31.0		0	17000000.0	23	\N	1.78094	16472	4
23716	Willy Adames	SS	27	R	R	28.5		0	12250000.0	23	3.40708	3.65744	15986	5
23717	Sal Frelick	CF/RF/3B	10	L	R	23.9		0	740000	23	1.43967	1.84236	29622	6
23718	Gary Sánchez	C	99	R	R	31.3		0	3000000.0	23	1.72945	0.637898	11442	7
23719	Jackson Chourio	CF/RF	11	R	R	20.0		0	740000	23	\N	\N	\N	8
23720	Brice Turang	2B/SS	2	L	R	24.3		0	740000	23	0.179592	1.26024	22186	9
23721	Jake Bauers	1B/RF/LF	9	L	L	28.4		0	1350000.0	23	-0.512581	0.0000680585	15194	Bench
23722	Andruw Monasterio	3B/SS/2B	14	R	R	26.8		0	740000	23	0.37911	0.499343	19455	Bench
23723	Joey Ortiz	SS/2B/3B	3	R	R	25.7		0	740000	23	-0.0392608	1.15264	25493	Bench
23724	Joey Wiemer	CF/RF/LF	28	R	R	25.1		0	740000	23	1.09252	0.28881	27690	Bench
23725	Freddy Peralta	SP	51	R	R	27.8		0	3100000.0	23	3.03412	3.08972	18679	SP1
23726	Wade Miley	SP	20	L	L	37.3		0	8500000.0	23	1.05902	1.15997	8779	SP2
23727	Jakob Junis	SP/RP	35	R	R	31.5		0	7000000.0	23	0.717325	1.70594	13619	SP3
23728	Colin Rea	SP/RP	48	R	R	33.7		0	4500000.0	23	0.779769	1.35447	12317	SP4
23729	DL Hall	SP/RP	37	L	L	25.5		0	740000	23	0.397455	1.81924	22207	SP5
23730	Trevor Megill	RP	29	L	R	30.3		0	740000	23	0.8367	1.12151	17722	CL
23731	Joel Payamps	RP	31	R	R	29.9		0	1650000.0	23	1.18585	0.543592	14332	SU8
23732	Abner Uribe	RP	45	R	R	23.7		0	740000	23	0.587717	0.308232	25327	SU7
23733	Hoby Milner	RP	55	L	L	33.2		0	2050000.0	23	1.01053	0.303822	13346	MID
23734	Taylor Clarke	RP	32	R	R	30.8		0	1250000.0	23	-0.237326	0.0520744	17611	MID
23735	Bryse Wilson	RP	46	R	R	26.2		0	1000025.0	23	0.332375	-0.0138029	19990	MID
23736	Bryan Hudson	RP	78	L	L	26.8		0	740000	23	-0.00820204	0.0730156	19924	MID
23737	Joe Ross	SP	41	R	R	30.8		0	1750000.0	23	\N	0.591966	12972	LR
23738	Devin Williams	RP	38	R	R	29.5	Stress fractures in back	0	7250000.0	23	1.8204	1.29908	15816	Inj
23739	CJ Abrams	SS/2B	5	L	R	23.4		0	740000	24	2.14103	2.52686	25768	1
23740	Lane Thomas	RF/CF/LF	28	R	R	28.6		0	5450000.0	24	2.70654	1.42783	16939	2
23741	Joey Gallo	1B/LF/RF	24	L	R	30.3		0	5000000.0	24	0.722238	0.816394	14128	3
23742	Joey Meneses	1B/RF	45	R	R	31.9		0	740000	24	-0.234029	0.626188	14366	4
23743	Keibert Ruiz	C	20	S	R	25.6		0	6250000.0	24	-0.0475012	1.44812	19610	5
23744	Nick Senzel	3B/LF/CF	13	R	R	28.7		0	2000000.0	24	-0.36321	-0.163695	19293	7
23745	Luis García Jr.	2B/SS	2	L	R	23.8		0	1950000.0	24	0.139772	1.2998	20391	8
23746	Victor Robles	CF	16	R	R	26.8		0	2650000.0	24	0.424139	1.10147	18363	9
23747	Riley Adams	C	15	R	R	27.7		0	740000	24	0.358244	-0.0443035	19864	Bench
23748	Nasim Nuñez	SS/2B	26	S	R	23.6		0	740000	24	\N	\N	\N	Bench
23749	Ildemaro Vargas	3B/2B/LF	14	S	R	32.7		0	975000.0	24	0.127302	0.502692	13324	Bench
23750	Josiah Gray	SP	40	R	R	26.2		0	740000	24	1.63949	1.39487	24580	SP1
23751	Patrick Corbin	SP	46	L	L	34.7		0	23333333.33333333	24	0.916657	1.04042	9323	SP2
23752	MacKenzie Gore	SP	1	L	L	25.0		0	740000	24	1.25483	2.22349	22201	SP3
23753	Jake Irvin	SP	27	R	R	27.1		0	740000	24	0.767782	1.00954	21504	SP4
23754	Trevor Williams	SP	32	R	R	31.9		0	6500000.0	24	-0.0832976	0.445096	16977	SP5
23755	Kyle Finnegan	RP	67	R	R	32.5		0	5100000.0	24	0.31702	0.713778	15009	CL
23756	Hunter Harvey	RP	73	R	R	29.3		0	2325000.0	24	1.33269	1.06181	15507	CL
23757	Tanner Rainey	RP	21	R	R	31.2		0	1500000.0	24	0.0156647	0.317572	17610	SU7
23758	Jordan Weems	RP	51	L	R	31.3		0	740000	24	0.00907648	0.159398	13190	MID
23759	Robert Garcia	RP	61	R	L	27.7		0	740000	24	0.562611	0.211844	23363	MID
23760	Jose A. Ferrer	RP	47	L	L	24.0		0	740000	24	0.0803503	0.0767443	24017	MID
23761	Stone Garrett	LF/RF	36	R	R	28.3	Fractured leg	0	740000	24	1.21887	0.008026	19273	Inj
23762	Stephen Strasburg	SP	37	R	R	35.6	Thoracic outlet syndrome surgery	0	35000000.0	24	\N	\N	10131	Inj
23763	Cade Cavalli	SP	9	R	R	25.6	Tommy John surgery	0	740000	24	\N	0.514309	27473	Inj
23764	Dylan Floro	RP	44	L	R	33.2	Shoulder soreness	0	2250000.0	24	1.14385	0.0711795	13394	Inj
23765	Mason Thompson	RP	71	R	R	26.1	Tommy John surgery	0	740000	24	0.47865	\N	21850	Inj
23766	Zach Brzykcy	RP	66	R	R	24.7		0	740000	24	\N	0.0140923	\N	Inj
23767	Brandon Nimmo	CF/LF/RF	9	L	R	31.0		0	20250000.0	25	4.34937	3.52983	12927	1
23768	Jeff McNeil	2B/RF/LF	1	L	R	31.9		0	12500000.0	25	2.57011	2.61969	15362	2
23769	Francisco Lindor	SS	12	S	R	30.3		0	31900000.0	25	6.02057	4.70637	12916	3
23770	Pete Alonso	1B	20	R	R	29.3		0	20500000.0	25	2.79296	3.12888	19251	4
23771	Francisco Alvarez	C	4	R	R	22.3		0	740000	25	2.69768	3.10017	26121	5
23772	Starling Marte	RF/CF	6	R	R	35.4		0	19500000.0	25	-0.330515	1.50123	9241	6
23773	Harrison Bader	CF	44	R	R	29.8		0	10500000.0	25	1.0498	2.12666	18030	8
23774	Brett Baty	3B	22	L	R	24.3		0	740000	25	-0.515503	1.60398	26123	9
23775	Omar Narváez	C	2	L	R	32.1		0	7500000.0	25	-0.0274682	1.13707	13338	Bench
23776	Mark Vientos	3B/1B	27	R	R	24.3		0	740000	25	-0.914765	0.719114	22184	Bench
23777	Joey Wendle	SS/2B/3B	13	L	R	33.9		0	2000000.0	25	-0.822468	0.113239	13853	Bench
23778	Tyrone Taylor	RF/LF/CF	15	R	R	30.1		0	2025000.0	25	0.843855	0.973535	13675	Bench
23779	Jose Quintana	SP	62	R	L	35.1		0	13000000.0	25	1.4989	1.67389	11423	SP1
23780	Luis Severino	SP	40	R	R	30.1		0	13000000.0	25	-0.607931	1.59448	15890	SP2
23781	Sean Manaea	SP/RP	59	L	L	32.1		0	14000000.0	25	1.11648	2.15822	15873	SP3
23782	Adrian Houser	SP	35	R	R	31.1		0	5050000.0	25	1.75065	0.998872	12718	SP4
23783	Tylor Megill	SP/RP	38	R	R	28.6		0	740000	25	0.556627	0.530006	21318	SP5
23784	Edwin Díaz	RP	39	R	R	30.0		0	18600000.0	25	\N	2.18089	14710	CL
23785	Adam Ottavino	RP	0	R	R	38.3		0	4500000.0	25	-0.0998331	0.230222	1247	SU8
23786	Brooks Raley	RP	25	L	L	35.7		0	6500000.0	25	0.647208	0.425678	10061	SU7
23787	Drew Smith	RP	33	R	R	30.5		0	2250000.0	25	0.13016	0.0813021	17755	MID
23788	Jake Diekman	RP	30	L	L	37.1		0	4000000.0	25	0.420163	-0.0254382	5003	MID
23789	Shintaro Fujinami	RP/SP	19	R	R	29.9		0	3350000.0	25	0.231719	0.0884239	31839	MID
23790	Jorge López	RP	52	R	R	31.1		0	2000000.0	25	-0.960881	0.0252802	14527	MID
23791	Sean Reid-Foley	RP	71	R	R	28.5		0	740000	25	0.246504	0.0392421	17034	LR
23792	Max Kranick	SP	32	R	R	26.6	Strained hamstring	0	740000	25	\N	-0.00894686	22175	Inj
23793	Kodai Senga	SP	34	L	R	31.1	Strained shoulder	0	15000000.0	25	3.38437	2.33393	31838	Inj
23794	Kyle Schwarber	LF/1B	12	L	R	31.0		0	19750000.0	26	1.4377	2.25494	16478	1
23795	Trea Turner	SS/2B	7	R	R	30.7		0	27272727.27272727	26	3.8072	4.54775	16252	2
23796	Bryce Harper	RF/1B	3	L	R	31.4		0	25384615.38461538	26	3.3044	4.10654	11579	3
23797	J.T. Realmuto	C	10	R	R	33.0		0	23100000.0	26	1.47096	2.79155	11739	4
23798	Bryson Stott	2B/SS	5	L	R	26.4		0	740000	26	3.90331	2.5253	26294	5
23799	Alec Bohm	3B	28	R	R	27.6		0	4000000.0	26	1.08598	1.84538	21618	6
23800	Nick Castellanos	RF/LF	8	R	R	32.0		0	20000000.0	26	0.963127	0.524986	11737	7
23801	Brandon Marsh	CF/RF/LF	16	L	R	26.2		0	740000	26	3.367	1.65274	20202	8
23802	Johan Rojas	CF	18	R	R	23.6		0	740000	26	1.37748	0.747818	24336	9
23803	Garrett Stubbs	C	21	L	R	30.8		0	850000.0	26	-0.301903	0.0855423	18067	Bench
23804	Edmundo Sosa	3B/SS/2B	33	R	R	28.0		0	1700000.0	26	0.892448	0.45515	17022	Bench
23805	Whit Merrifield	2B/LF/3B	9	R	R	35.1		0	8000000.0	26	1.54826	0.21078	11281	Bench
23806	Cristian Pache	CF/RF/LF	19	R	R	25.3		0	740000	26	0.480699	0.165797	19948	Bench
23807	Zack Wheeler	SP	45	L	R	33.8		0	23600000.0	26	5.9443	4.95902	10310	SP1
23808	Aaron Nola	SP	27	R	R	30.8		0	24571429.0	26	3.88015	4.81679	16149	SP2
23809	Ranger Suárez	SP	55	L	L	28.5		0	5050000.0	26	2.41628	2.34844	17277	SP3
23810	Taijuan Walker	SP	99	R	R	31.6		0	18000000.0	26	2.46824	1.84113	11836	SP4
23811	Cristopher Sánchez	SP/RP	61	L	L	27.2		0	740000	26	1.8205	1.68513	20778	SP5
23812	José Alvarado	RP	46	L	L	28.8		0	7333333.33333333	26	1.32135	1.6715	17780	CL
23813	Jeff Hoffman	RP	23	R	R	31.2		0	2200000.0	26	1.53094	0.833809	17432	SU8
23814	Gregory Soto	RP	30	L	L	29.1		0	5000000.0	26	0.928388	0.555398	19677	SU7
23815	Seranthony Domínguez	RP	58	R	R	29.3		0	3625000.0	26	0.0688293	0.52564	19249	MID
23816	Matt Strahm	RP	25	L	L	32.3		0	7500000.0	26	1.9958	0.579842	13799	MID
23817	Orion Kerkering	RP	50	R	R	22.9		0	740000	26	0.107711	0.422255	31776	MID
23818	Connor Brogdon	RP	75	R	R	29.1		0	740000	26	-0.100705	0.0473508	21205	MID
23819	Spencer Turnbull	SP/RP	22	R	R	31.5		0	2000000.0	26	-0.0441913	0.422569	16207	LR
23820	Dylan Covey	SP/RP	54	R	R	32.6	Shoulder tightness	0	850000.0	26	0.0391138	-0.0103514	14825	Inj
23821	Michael Rucker	RP	39	R	R	29.9	Finger numbness	0	740000	26	-0.0624575	0.00155163	19454	Inj
23822	Oneil Cruz	SS	15	L	R	25.4		0	740000	27	0.310377	2.7501	21711	1
23823	Bryan Reynolds	LF/CF	10	S	R	29.1		0	13343750.0	27	2.28184	2.71336	19326	2
23824	Ke'Bryan Hayes	3B	13	R	R	27.1		0	8750000.0	27	3.24976	2.68189	18577	3
23825	Andrew McCutchen	LF/RF	22	R	R	37.4		0	5000000.0	27	1.24894	0.364728	9847	4
23826	Jack Suwinski	CF/RF/LF	65	L	L	25.6		0	740000	27	2.75205	2.05026	22244	5
23827	Henry Davis	C/RF	32	R	R	24.5		0	740000	27	-0.965924	1.6647	29617	6
23828	Rowdy Tellez	1B	44	L	L	29.0		0	3200000.0	27	-0.918607	0.558147	15679	7
23829	Edward Olivares	LF/RF/CF	38	R	R	28.0		0	1350000.0	27	0.407744	0.807766	19698	8
23830	Liover Peguero	SS/2B	31	R	R	23.2		0	740000	27	-0.0103445	0.543439	24273	9
23831	Yasmani Grandal	C	6	S	R	35.3		0	2500000.0	27	-0.0530439	0.972877	11368	Bench
23832	Connor Joe	RF/1B/LF	2	R	R	31.6		0	2125000.0	27	1.89384	0.785929	16572	Bench
23833	Jared Triolo	3B/2B/1B	19	R	R	26.1		0	740000	27	1.74686	0.624786	25807	Bench
23834	Ji Hwan Bae	2B/CF/SS	3	L	R	24.6		0	740000	27	-0.274916	0.420841	23818	Bench
23835	Mitch Keller	SP	23	R	R	27.9		0	15400000.0	27	3.25453	2.91763	17594	SP1
23836	Martín Pérez	SP	54	L	L	32.9		0	8000000.0	27	0.456777	1.63216	6902	SP2
23837	Marco Gonzales	SP	27	L	L	32.1		0	12250000.0	27	0.60707	0.858733	15467	SP3
23838	Luis L. Ortiz	SP	48	R	R	25.1		0	740000	27	-0.343052	0.6359	27646	SP4
23839	David Bednar	RP	51	L	R	29.4		0	4510000.0	27	2.32957	1.48152	19569	CL
23840	Aroldis Chapman	RP	45	L	L	36.0		0	10500000.0	27	1.76578	0.795001	10233	SU8
23841	Colin Holderman	RP	35	R	R	28.4		0	740000	27	0.911215	0.498762	22361	SU7
23842	Carmen Mlodzinski	RP	50	R	R	25.1		0	740000	27	0.247078	0.19396	27572	MID
23843	Ryan Borucki	RP	43	L	L	30.0		0	1600000.0	27	0.630575	0.351847	16350	MID
23844	Roansy Contreras	SP	59	R	R	24.3		0	740000	27	0.073945	0.620565	22810	MID
23845	Josh Fleming	SP/RP	28	R	L	27.8		0	850000.0	27	-0.54778	0.0297278	20418	MID
23846	Bailey Falter	SP/RP	26	R	L	26.9		0	740000	27	0.383008	0.307308	20070	LR
23847	Dauri Moreta	RP	36	R	R	27.9	Elbow discomfort	0	740000	27	1.04519	0.0263587	21101	Inj
23848	Mike Burrows	SP	53	R	R	24.3		0	740000	27	\N	\N	\N	Inj
23849	Brendan Donovan	2B/1B/LF	33	L	R	27.2		0	740000	28	2.07291	1.74672	24679	1
23850	Paul Goldschmidt	1B	46	R	R	36.5		0	26000000.0	28	3.65723	3.08469	9218	2
23851	Nolan Gorman	2B/3B	16	L	R	23.8		0	740000	28	2.52549	2.37663	22263	3
23852	Nolan Arenado	3B	28	R	R	32.9		0	30555555.55555556	28	2.63308	3.71766	9777	4
23853	Willson Contreras	C	40	R	R	31.8		0	17500000.0	28	2.43057	2.40588	11609	5
23854	Alec Burleson	LF/1B/RF	41	L	L	25.3		0	740000	28	-0.904598	0.363065	27615	6
23855	Jordan Walker	RF/LF/CF	18	R	R	21.8		0	740000	28	0.223695	1.78211	27475	7
23856	Dylan Carlson	CF/RF/LF	3	S	L	25.4		0	2350000.0	28	0.160921	1.34556	20126	8
23857	Masyn Winn	SS	0	R	R	22.0		0	740000	28	-0.760174	1.76091	27479	9
23858	Iván Herrera	C	48	R	R	23.8		0	740000	28	0.520256	1.00448	20599	Bench
23859	Matt Carpenter	1B	13	L	R	38.3		0	740000.0	28	-0.309972	0.101118	8090	Bench
23860	Brandon Crawford	SS	35	L	R	37.1		0	2000000.0	28	0.433631	0.550276	5343	Bench
23861	Michael Siani	CF/LF/RF	63	L	L	24.7		0	740000	28	-0.1041	-0.00876161	22557	Bench
23862	Miles Mikolas	SP	39	R	R	35.6		0	18583333.33333333	28	3.06549	1.92214	9803	SP1
23863	Kyle Gibson	SP	44	R	R	36.4		0	13000000.0	28	2.55691	1.95786	10123	SP2
23864	Lance Lynn	SP	31	R	R	36.8		0	11000000.0	28	0.505303	2.08147	2520	SP3
23865	Steven Matz	SP	32	R	L	32.8		0	11000000.0	28	1.97936	2.00578	13361	SP4
23866	Zack Thompson	SP/RP	57	L	L	26.4		0	740000	28	1.07058	0.372893	25918	SP5
23867	Ryan Helsley	RP	56	R	R	29.7		0	3800000.0	28	1.49363	1.18538	18138	CL
23868	Giovanny Gallegos	RP	65	R	R	32.6		0	5500000.0	28	0.303713	0.81381	14986	SU8
23869	Andrew Kittredge	RP	27	R	R	34.0		0	2262500.0	28	0.142491	0.311246	12828	SU7
23870	Keynan Middleton	RP	93	R	R	30.5		0	6000000.0	28	0.135236	0.266204	15264	MID
23871	JoJo Romero	RP	59	L	L	27.5		0	860000.0	28	1.20529	0.699207	19574	MID
23872	Andre Pallante	RP	53	R	R	25.5		0	740000	28	-0.081633	0.100457	26108	MID
23873	Riley O'Brien	RP	55	R	R	29.1		0	740000	28	\N	-0.00165111	20348	MID
23874	Ryan Fernandez	RP	64	R	R	25.8		0	740000	28	\N	0.0319998	\N	LR
23875	Tommy Edman	2B/SS/RF	19	S	R	28.8	Arthroscopic wrist surgery	0	8250000.0	28	2.25631	1.95982	19470	Inj
23876	Lars Nootbaar	CF/RF/LF	21	L	R	26.5	Non-displaced rib fractures	0	740000	28	3.20505	2.24696	21454	Inj
23877	Sonny Gray	SP	54	R	R	34.3	Strained hamstring	0	24949117.0	28	5.28453	2.87163	12768	Inj
23878	Xander Bogaerts	2B/SS	2	R	R	31.4		0	25454545.45454545	29	4.41885	3.72536	12161	1
23879	Fernando Tatis Jr.	RF/CF/SS	23	R	R	25.2		0	24285714.0	29	4.38089	5.73037	19709	2
23880	Jake Cronenworth	2B/1B	9	L	R	30.1		0	11428571.42857143	29	1.04876	2.00355	18036	3
23881	Manny Machado	3B	13	R	R	31.7		0	31818181.81818182	29	3.4767	4.0675	11493	4
23882	Ha-Seong Kim	SS/2B/3B	7	R	R	28.4		0	7000000.0	29	4.36972	3.34348	27506	5
23883	Luis Campusano	C	12	R	R	25.5		0	740000	29	1.08012	1.61323	22217	7
23884	Jurickson Profar	LF/RF/1B	10	S	R	31.1		0	1000000.0	29	-1.96206	0.370624	10815	8
23885	Kyle Higashioka	C	20	R	R	33.9		0	2180000.0	29	1.69127	1.211	5517	Bench
23886	Eguy Rosario	3B/2B/SS	5	R	R	24.6		0	740000	29	0.152244	0.294363	19964	Bench
23887	José Azocar	CF/RF/LF	28	R	R	27.8		0	740000	29	0.133283	0.144181	18821	Bench
23888	Yu Darvish	SP	11	R	R	37.6		0	18000000.0	29	2.40586	2.84625	13074	SP1
23889	Joe Musgrove	SP	44	R	R	31.3		0	20000000.0	29	2.10969	2.86851	12970	SP2
23890	Dylan Cease	SP	\N	R	R	28.2		0	8000000.0	29	3.69019	3.09602	18525	SP3
23891	Michael King	SP/RP	34	R	R	28.8		0	3150000.0	29	2.19934	2.42265	19853	SP4
23892	Jhony Brito	SP/RP	76	R	R	26.1		0	740000	29	0.402266	1.11608	25386	SP5
23893	Robert Suarez	RP	75	R	R	33.0		0	9200000.0	29	-0.00773885	0.157907	30115	CL
23894	Yuki Matsui	RP	1	L	L	28.4		0	740000	29	\N	1.01005	\N	SU8
23895	Enyel De Los Santos	RP	62	R	R	28.2		0	1160000.0	29	0.721024	0.322004	18403	SU7
23896	Wandy Peralta	RP	58	L	L	32.6		0	4125000.0	29	-0.491613	0.0468533	14295	MID
23897	Jeremiah Estrada	RP	56	S	R	25.4		0	740000	29	-0.43108	-0.0055659	22210	MID
23898	Tom Cosgrove	RP	59	L	L	27.7		0	740000	29	0.610285	0.0482264	23443	MID
23899	Woo-Suk Go	RP	21	R	R	25.6		0	740000	29	\N	0.374715	\N	MID
23900	Luis Patiño	SP/RP	77	R	R	24.4		0	740000	29	-0.000792556	-0.0708254	22815	LR
23901	Tucupita Marcano	SS/2B/LF	16	L	R	24.5	Knee surgery (torn ACL)	0	740000	29	-0.441943	0.00814086	22871	Inj
23902	Glenn Otto	SP/RP	49	R	R	28.0	Strained oblique	0	740000	29	-0.577154	0.0035664	21366	Inj
23903	Jung Hoo Lee	CF/RF/LF	51	L	R	25.6		0	740000	30	\N	\N	\N	1
23904	Thairo Estrada	2B/SS/LF	39	R	R	28.1		0	4700000.0	30	3.89424	2.16175	16426	2
23905	LaMonte Wade Jr.	1B/LF/RF	31	L	L	30.2		0	3500000.0	30	2.05357	1.47604	18126	3
23906	Jorge Soler	RF/LF	2	R	R	32.0		0	14000000.0	30	1.86244	1.59376	14221	4
23907	Michael Conforto	RF/LF	8	L	R	31.0		0	18000000.0	30	1.12239	1.31232	16376	5
23908	Matt Chapman	3B	26	R	R	30.9		0	18000000.0	30	3.45457	3.33323	16505	6
23909	Mike Yastrzemski	RF/CF/LF	5	L	L	33.6		0	7900000.0	30	1.77893	1.5366	14854	7
23910	Patrick Bailey	C	14	S	R	24.8		0	740000	30	2.8363	3.10865	27478	8
23911	Tom Murphy	C	19	R	R	32.9		0	4125000.0	30	0.759345	0.890583	13499	Bench
23912	Wilmer Flores	1B/3B/2B	41	R	R	32.6		0	5500000.0	30	2.46397	1.46141	5827	Bench
23913	Luis Matos	CF/RF/LF	29	R	R	22.1		0	740000	30	-0.425905	0.288164	26467	Bench
23914	Austin Slater	CF/LF/RF	13	R	R	31.2		0	4000000.0	30	0.945809	0.680547	16153	Bench
23915	Logan Webb	SP	62	R	R	27.3		0	18000000.0	30	4.85458	4.18936	17995	SP1
23916	Kyle Harrison	SP	45	R	L	22.6		0	740000	30	-0.112184	1.58541	27758	SP2
23917	Jordan Hicks	SP/RP	12	R	R	27.5		0	11000000.0	30	1.11333	1.44855	19618	SP3
23918	Keaton Winn	SP/RP	67	R	R	26.1		0	740000	30	0.203303	1.17577	23499	SP4
23919	Camilo Doval	RP	75	R	R	26.7		0	740000	30	1.89147	0.931806	21992	CL
23920	Tyler Rogers	RP	71	R	R	33.2		0	3200000.0	30	0.567634	0.110721	15541	SU8
23921	Taylor Rogers	RP	33	L	L	33.2		0	11000000.0	30	0.27361	0.60517	13449	SU7
23922	Luke Jackson	RP	77	R	R	32.6		0	5750000.0	30	0.343306	0.0397034	11752	MID
23923	Ryan Walker	RP	74	R	R	28.3		0	740000	30	0.643903	0.332806	20423	MID
23924	Ethan Small	RP	63	L	L	27.1		0	740000	30	-0.00668214	0.0265197	26364	MID
23925	Alex Cobb	SP	38	R	R	36.4	Hip surgery	0	10000000.0	30	1.76923	2.15849	6562	Inj
23926	Sean Hjelle	SP/RP	64	R	R	26.9	Sprained elbow	0	740000	30	0.0503845	0.145386	21481	Inj
\.


--
-- Data for Name: mlbplayers_portfolios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlbplayers_portfolios (portfolio_id, mlbplayer_fgid) FROM stdin;
2602	18373
\.


--
-- Data for Name: mlbplayers_portfolios_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlbplayers_portfolios_transactions (id, date, portfolio_id, kind, dollars, mlbplayer_fgid) FROM stdin;
22	2024-03-14 10:48:44.977942	2602	buy	121212.78	18373
\.


--
-- Data for Name: mlbteam_value_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlbteam_value_history (id, team_id, date, wins, dollars, payroll) FROM stdin;
\.


--
-- Data for Name: mlbteams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlbteams (id, fg_id, short_name, abb_name, league, division, payroll, win_spend, "W", "L", "GB", "xW", "xL") FROM stdin;
1474	23	Brewers	MIL	NL	C	151905581	1566037	92	70	0.0	97	65
1475	13	Rangers	TEX	AL	W	243824956	2621774	90	72	0.0	93	69
1476	22	Dodgers	LAD	NL	W	312640026	3435605	100	62	0.0	91	71
1477	8	Twins	MIN	AL	C	159734881	1815169	87	75	0.0	88	74
1478	21	Astros	HOU	AL	W	255721032	2973500	90	72	0.0	86	76
1479	16	Braves	ATL	NL	E	271103334	3152364	104	58	0.0	86	76
1480	2	Orioles	BAL	AL	E	122088667	1436337	101	61	0.0	85	77
1481	12	Rays	TBR	AL	E	136142955	1601682	99	63	2.0	85	77
1482	11	Mariners	SEA	AL	W	160336667	1886314	88	74	2.0	85	77
1483	17	Cubs	CHC	NL	C	237055715	2822092	83	79	9.0	84	78
1484	6	Tigers	DET	AL	C	122053750	1470527	78	84	9.0	83	79
1485	18	Reds	CIN	NL	C	118885000	1432349	82	80	10.0	83	79
1486	5	Guardians	CLE	AL	C	132586310	1616906	76	86	11.0	82	80
1487	14	Blue Jays	TOR	AL	E	249418453	3041688	89	73	12.0	82	80
1488	26	Phillies	PHI	NL	E	261833772	3232516	90	72	14.0	81	81
1489	27	Pirates	PIT	NL	C	117630417	1452227	76	86	16.0	81	81
1490	15	Diamondbacks	ARI	NL	W	191493381	2364116	84	78	16.0	81	81
1491	1	Angels	LAA	AL	W	189178334	2364729	73	89	17.0	80	82
1492	29	Padres	SDP	NL	W	223633680	2795421	82	80	18.0	80	82
1493	9	Yankees	NYY	AL	E	307661667	3845771	82	80	19.0	80	82
1494	20	Marlins	MIA	NL	E	124181667	1552271	84	78	20.0	80	82
1495	28	Cardinals	STL	NL	C	215362173	2726103	71	91	21.0	79	83
1496	30	Giants	SFG	NL	W	226211236	2863433	79	83	21.0	79	83
1497	3	Red Sox	BOS	AL	E	211364167	2709797	78	84	23.0	78	84
1498	4	White Sox	CHW	AL	C	123196667	1599957	61	101	26.0	77	85
1499	25	Mets	NYM	NL	E	328345000	4320329	75	87	29.0	76	86
1500	7	Royals	KCR	AL	C	162556692	2257732	56	106	31.0	72	90
1501	24	Nationals	WSN	NL	E	136250000	2033582	71	91	33.0	67	95
1502	10	Athletics	OAK	AL	W	79701667	1207601	50	112	40.0	66	96
1503	19	Rockies	COL	NL	W	158975000	2483984	59	103	41.0	64	98
1504	0	Replacements	REP	AL	W	0	0	48	114	0	48	114
\.


--
-- Data for Name: portfolio_value_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.portfolio_value_history (id, portfolio_id, date, dollars) FROM stdin;
\.


--
-- Data for Name: portfolios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.portfolios (id, name, size, trades, dollars, user_id) FROM stdin;
2603	than significants	20	93	154000000	2688
2604	them ofs	22	12	83000000	2673
2605	discussion remains	21	13	124000000	2692
2606	near hers	22	30	223000000	2656
2607	body assumes	20	92	165000000	2690
2608	five beautifuls	23	98	156000000	2669
2609	majority certainlys	17	94	106000000	2699
2610	participant responses	25	56	208000000	2674
2611	still proves	26	32	88000000	2653
2612	sound singles	15	51	145000000	2671
2613	pattern Congresss	15	59	120000000	2681
2614	leave whens	21	73	140000000	2687
2615	every edges	17	21	98000000	2686
2616	how its	17	25	196000000	2678
2617	look datas	26	70	120000000	2668
2618	beyond nationals	15	75	102000000	2699
2619	city fires	22	90	101000000	2698
2620	next positions	19	17	229000000	2658
2621	open conditions	19	97	214000000	2665
2622	matter partners	18	77	173000000	2665
2623	offer peaces	22	68	114000000	2668
2625	open attentions	16	79	127000000	2684
2602	buybye	21	41	133000000	2671
2626	doctor sometimess	16	43	234000000	2686
2627	talk challenges	26	29	178000000	2686
2628	edge statements	18	89	81000000	2663
2629	finally movements	22	43	114000000	2693
2630	establish others	26	80	96000000	2700
2631	again lays	23	90	88000000	2686
2632	partner sizes	25	24	176000000	2685
2633	street quites	16	14	172000000	2681
2634	ahead healths	21	66	228000000	2670
2635	threat lasts	24	50	157000000	2660
2636	rather worrys	16	31	135000000	2688
2637	property bases	22	24	173000000	2700
2638	agreement ins	16	74	143000000	2655
2639	hair becomes	22	54	193000000	2685
2640	student parents	19	50	164000000	2681
2641	whom afters	23	60	197000000	2652
2642	really months	15	98	137000000	2692
2643	part sings	18	10	92000000	2686
2644	board funds	22	23	95000000	2666
2645	color costs	21	51	181000000	2694
2646	they animals	24	16	157000000	2695
2647	much necessarys	20	45	76000000	2690
2648	drug arts	16	26	237000000	2687
2649	local serves	26	15	234000000	2680
2650	player orders	22	13	210000000	2675
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, username, password, fav_team) FROM stdin;
2651	Eric Franco	odickerson@example.net	austin118	8f6489ed9eb0510ad62b15e24b991cdec8dc716f07568f150108c145ed53d9adb1d585dad29e4a69d54db6eadf8247eaf93beead6af33ed5f2c4b75e3fe57119	\N
2652	Sarah Green	nelsonwilliam@example.com	wanda120	ecd0b0c07d76ddcbf35f610895feb73119da07ab74244a4cc2fdaeb59d170c5aea838e743226e9121cfa442027dc7efa925325cac9087fb5e6072494431b3933	\N
2653	Jonathan Winters	nthompson@example.org	clinton33	066953cb80885da5b547320ccefc44bfa5c4897edd1299ce4664faee590a0ebaf3cf057922ca164429df060320f54409c0c3cb99204880eebc0f14edda0b5eb5	\N
2654	Kelly Stewart	rachel99@example.net	lisa103	b4977c26e6128cd65a26faba45378150e161df315a99a7b5e0994270776b28e6edcaab1879bded2fc355ad56e3c95f60c9f093bbb7c03c871a34bc76372a944e	\N
2655	Richard Mcdowell	grant14@example.org	heather90	49a54da14d95a1cbca12a0842309616c580faf5d8237296a2f61c37ca090cb3ff6c4e2b94eafa56be1dba55ee181583745b14f77e98a0c86c0f29635c3402be8	\N
2656	Kayla Oneill	oallen@example.com	andrea13	b0b574d9cffe3ef4e0f7038b231638d7300f9dfd6e99e7d23f3607e69f1432c315dcb5fd2779b1d328abb8730d4a0a30e0e04ed3b4260c31cd0e9ce66509bfe1	\N
2657	Ian Pineda	michaelwhite@example.net	kenneth91	ec4638ea3ce168b654df6b020b8c28a7b28160ded3431364e0bc2072e8223c4475ea09dd96a2e77699e939e780f65e8574b17c488a6cf91dc11dc3627fbda210	\N
2658	Rachel Thompson	brian52@example.net	brian10	e2b37d7663f0eecd2cab73626cda451c45e5b48bf91e9dbcc802a059bcc2aa69133e8194d4af699cdff575badb18532735f126a749f43edc5440c66b8d867501	\N
2659	Charles Carson	mary75@example.net	thomas100	64d7b96ff03b3f96de85864931a2b69b3c7482b62365ba15df47aa0732944ed54d6ef23c6901b3bfe32380451d3686261d7f1ba0e31bb253d4d126c2da4df166	\N
2660	Ryan Meyer	smithnathan@example.org	scott65	d2d3398447514e648ee81bbeb76f3041c17551e7d57c9e34d6d6edb1f4281e3d430d5f8d7a0b35b51a8120808ab04f9860e8786a7d2d476ebffa6a5ab80333eb	\N
2661	Kelli Mckenzie	janet82@example.com	laurie1	1c42aecef24401b5d7d1d5d29f050830914b2f0b13da2ec8b56a5f4d8958d0c0299e7fc2f023b83739ba2129a8b0edc2d40b699a85d3864f2aee2b0c8f00cd3a	\N
2662	Ryan Lee	wgarcia@example.net	anne103	3ab542675628740efc87b1926e1254b5afedceae0b0bc30404f0da29d9767c4b281209eee79dc52b50cdf58317a3ab8c61338efd3a8ed7519c8df6736559e87c	\N
2663	Sean Harper	jonathan25@example.org	marissa148	8bce289153a431f43de1e3bef010abbc5f94f221ce8ea506802657ba34e255d1f1a24a40fde67c9fed8fd5f2440ebda11353be9ec23c46e80b37518476ae408a	\N
2665	Kurt Fritz	carterlisa@example.net	darrell112	fe961f3f0e8e14c18ed223b0daa7917421b8a482cad17dfaf54a8d81e28e8762bf5dbf8f8da81e6fd2b6c9c14854a8e2ce20562181aa33642a05637633ab4e93	\N
2666	Emily Bray	meganrodriguez@example.net	savannah10	fd7cf2c25cefd5703afd49564877f9cbff56d71a6e247c334c4f01479575db152e0f94dbe46e29f298ace882ab8c3fd1bbaf0ff47b3f0fdd136b68362deb2995	\N
2667	Donald Leon	ryanmichael@example.com	karen77	7eaba58db780c22b00892d458134f6c309328cf1a6b3be5930ba3072b1f4e61f82006af0aaffbc4885ac477aaaafa63b21b70794ebfd4500638d1955e21f9273	\N
2668	David Thornton	beltrankaren@example.net	kelly79	838dd83ba4908b644b5512ad2866530fb96f14a5d38efc0f5fe5bd223abd8a99ff90fbdaa8ca317fb6f44b0b073d466405f2964d1f3e56b47d4045fa0676946c	\N
2669	Kimberly Harris	rpoole@example.net	desiree77	81eaf0ecc19acf1f239f2b7d51184585d07b97fef63918b88b910e404d422af9d61c3dfd34d52f94b1267002b38d440f220933ad6493892253071e25a04f886d	\N
2670	Valerie Davis	stephaniewaters@example.com	stephanie84	b3180b9a9d2f938891cad5ead0102fb1fa85b3b4fe437800b402d240c3ede354a5d29508de5477dce34dec73a2c003a0c5573eb1b87bce6605f0573a992a97b0	\N
2671	Johnny Ross	zschmidt@example.org	denise139	02ab7bee1b292222fdc6cd9b58166cfc818143c9bcd246bb5cd81abf223d053cf612ac37e41c0ca545561b8a3fb454481b96e2b174ceedc432b824977b1a15a6	\N
2672	Sarah Chen	jillianbryant@example.net	belinda88	de001d05427b1ed44e990d404bb6f10d8d03ed819f98fdc75f98be0eb57a9a3205a14445b030c75ae49b642d927f2ce8f8804b0f3de13a4c03efe2829bc8fe6e	\N
2673	Duane Barrett	deborah82@example.org	michael46	ce47d3d5f6f81f838337d3489b4115f56174a9e33c20f7bf9dfe3b43e00a47a74662fdb1098d927b6c8e870fe16c0a4020c2883bef185084948648e4fc079b74	\N
2674	Felicia Gonzalez	benjamin46@example.com	timothy48	ac211ea499e00a4109c532cb88c877e1889a93b8460079ba6b14fa3a810b15371c59d93938269bff067b1535de288619d7e17299b01130b85ef3dee5672b6f54	\N
2675	Duane Kim	klopez@example.com	candace87	a71e5f57e8763012a80048aff8d77456df8fb69df69ffc0abdbdbca59e6a83300e62b908398885c3ae7077a225d82549c8a040e78bb0eeca6cd9943174134c01	\N
2676	Brian Randall	adamsandrew@example.com	david11	af1d0a72ddf289542e940e448fb7f5e138fcb9a75d1541c8c0eb2894cdc096a3c45b62fd1f9263e5c646e97583eda73e98d95dadb0c9846b51f55becf0846acd	\N
2677	Benjamin Thompson	jenningsbrittany@example.net	katrina131	e16348d2215bbc9d725ce90d1ae28ef58c2d2f89d0538f8bacdc9d4a18b8b3a5dd9550b8625dd8ae3caaf430da24f7939c4928a03a5b39a60602c43be3c893fb	\N
2678	Richard Flores	carolyn10@example.net	amber40	bee854d74a932964a6ce2ce506617c9b0da5affc8dda01810a1021312c02123cb316c7304ec9e93004a99c836f8df823266fb56cc63385a6a4a3364183e2dc3f	\N
2679	Jesse Miller	sarahrivera@example.org	jason103	d5f439c5b6b9a532b3a602d0b9c8c52184ebed2886cd940717faf1d4e935c6a0233dbf5e4a6dc0271a2ef1012597cb0c5e26b2b5ab2a85e2819563ffcc838b0b	\N
2680	Diana Galloway	tiffanycarter@example.net	leonard150	b4da38f242d5ef2014d4874e84e5d7c8b0b1694048b0bf2bd8ecc99b83fb13ee1fc265e4f68fee13153d887f643aab123a9a90cf76d29f1de5dfe5bcc79c058a	\N
2681	Timothy Young DDS	floydangela@example.net	alyssa141	9aa50dcce9d05d11a36a8c2c7c7c608c7c3cb046acb3f2599520817946f8ed49d01e958bd8b9dcf6709e3aeaecc7c66463291e91583074fe529eeeca8d30a31b	\N
2682	Vicki Gray	mezanina@example.net	brett98	89e887da21b9f13372dc1db81c68285b9610be83d9208bcc3a70f07aff978f2ad4e8db8dc367942e4446b8f0f69c9dc9a37ce9474e961c31a3baa681a0853755	\N
2683	Rose Daniels	josepherickson@example.org	kyle75	ca6f6559d02822c69e5ba2f3b6901ec162164a7e92c10f18c4fff4c357453d13e71e1127940f7a4d62717b621bf2ac1d5c332dc9f13db077c1b361ec710b7f99	\N
2684	Patrick Baker	kiaracastaneda@example.org	ronnie125	625dcf079e11c32a97a03442a654c93b7d5bb2580f944f4f8f7f03a58d8e8bad6d021286984583969e27524df24b5c69b8ecb05eca69ea92a6ab72e688f6cad1	\N
2685	Teresa Alvarez	johnsonlisa@example.com	debra131	3e951cb3a4daa0c1435ce54768a12513fd1d68f875f9dd4afc1ff109fe44d00864536a27eba63684fa4a5653883b74fb29682456c2d906c1ce7b5169989a8cf7	\N
2686	Christopher Thompson	sarah10@example.net	stephen2	c75066188349e7c678223b4d73252a1c7fe158fbb456a81a5118ddcbe0ff1793605161f9d82ef1a9274cb61924ed37f27465cd0e81243986e2c843b397f0d5c6	\N
2687	Colleen Krause	maryjames@example.net	sheena4	9c2b9930e048aab568ee814b1955511812197532b4ba38c190f2cf6de2ebad7fbbb0e51d898b4f22b7880462eab44af89a205f0f61276dc176c8d37d242f9aad	\N
2688	Jill Carter	millsandrew@example.com	daniel108	23f4578deae09d8c06baeda0bab142595059050112c4100ef42c2881d2d8fa8c1c9a95db303c5320b076326b2f6435a428d5bf665995378b1a858131cffd5be7	\N
2689	Carrie Reynolds	ashley45@example.net	kimberly99	eb3aa01506f556be4b9f01cb70e46a24aa284c7fb1b580e5d571bf40a9b2d7e4edc5666288740a01f07bad1875ce7111e53666bd9b41afe7562c6b6ef34c96e5	\N
2690	John Fisher	anthony40@example.org	alexis36	8d25014d0628968106dcbf7354684517b7868ef13857cebcb1f49b2a65393b40850e51dd4ca09fd91717046dec30dc841e9839da141ce73f11390698f6a09210	\N
2691	Ryan Jackson	sarah61@example.net	angela69	20a9eaebc391e4bbc8f5fb639c6541d49c6fd88114240253cdde4a6dba4cbc30abf13d4e7d3e3151e039bbffe922fed3b30a982e4cbc970d402b1942e935fa19	\N
2692	Andrea Boyd	owashington@example.net	jennifer68	fd9c148e1cfc7658f6c2ce40226a81f933902aedbeb32e52878d8e717004d0e60ca05324679a608af709b98478ec98cd35560627293b2c7e50e0ab0cade04e09	\N
2693	Alyssa Jefferson	lovewanda@example.net	ashley134	7cf7ab671a1f4c53ab65ee4ba198c301235bd0b9a18c17c8d1e0917a67a8e0c298c0b8793633d160b64018e3c104992b4ab2393a05648a93dcd24ce7fb7c2613	\N
2694	Patricia Edwards	erikchavez@example.com	james36	6d79286ed0903e80a0c335f5da98b796a80e545df9e8c0a4355a89f44bfccd36fff06d98118b59eb253b23df08abfd99e38442700e3d2737f5281f0756894e2e	\N
2695	Victor Moreno	llarsen@example.com	shannon87	f129a6dd3e7deadc7150f829f6d928a0c5248b153d4ef58b92952b6f6f03d32a96595794b7e2259c40f5901f3d26eff79b6f407e263994e3df9d239ddb585922	\N
2696	Paula Matthews	arnoldsarah@example.net	melinda104	bf03e5f50321ab1fccfedee5327e2b2c2b99ce70294ea242e1b0feeb7ef8c79abd9154c29cc2a6bcc9a3d8be73b7249f1f19206ac54a916e05d943b54d14b09d	\N
2697	Frank Foster	matthew02@example.net	mary121	7fb9b679b34b605e0ad63c4113ae5ecc737ca8b745dce6919688ba882670b8d14b003b14c794fb94ef295820d1b306f983ea910f64b26c09fa29f6c4508c10f6	\N
2698	Cameron Sharp	jvega@example.org	andre77	af4172304bb98fc671cdacab6b1c7f96e69d74d333177b0791e90df584ef553b7f9920f12b6d7183a439aeb74165b9d886d867500e98835f3daea246fe7589e7	\N
2699	Sarah Salazar	nnelson@example.net	jacob26	712638b7160cc39f7b050bc37bbb29a3b56359bd7624e479ef48aaefd1663b381856fb63e220ab439fc5e53665ace82bfaeef50d5c99a3c308ca23fee873881b	\N
2700	Jason Davis	thomasarmstrong@example.org	shelly32	8e1fdde08bee16a65492e8469f0481cacda712dde650adb4901637c53606d178700b45ca41972c475e32baf30ae32ead0171be04cf9d859019e36d982a95312e	\N
\.


--
-- Name: mlbplayer_value_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mlbplayer_value_history_id_seq', 1, false);


--
-- Name: mlbplayers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mlbplayers_id_seq', 23926, true);


--
-- Name: mlbplayers_portfolios_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mlbplayers_portfolios_transactions_id_seq', 22, true);


--
-- Name: mlbteam_value_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mlbteam_value_history_id_seq', 1, false);


--
-- Name: mlbteams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mlbteams_id_seq', 1504, true);


--
-- Name: portfolio_value_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.portfolio_value_history_id_seq', 1, false);


--
-- Name: portfolios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.portfolios_id_seq', 2650, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2700, true);


--
-- Name: mlbplayer_value_history mlbplayer_value_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayer_value_history
    ADD CONSTRAINT mlbplayer_value_history_pkey PRIMARY KEY (id);


--
-- Name: mlbplayers mlbplayers_fg_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayers
    ADD CONSTRAINT mlbplayers_fg_id_key UNIQUE (fg_id);


--
-- Name: mlbplayers mlbplayers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayers
    ADD CONSTRAINT mlbplayers_pkey PRIMARY KEY (id);


--
-- Name: mlbplayers_portfolios_transactions mlbplayers_portfolios_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayers_portfolios_transactions
    ADD CONSTRAINT mlbplayers_portfolios_transactions_pkey PRIMARY KEY (id);


--
-- Name: mlbteam_value_history mlbteam_value_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbteam_value_history
    ADD CONSTRAINT mlbteam_value_history_pkey PRIMARY KEY (id);


--
-- Name: mlbteams mlbteams_abb_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbteams
    ADD CONSTRAINT mlbteams_abb_name_key UNIQUE (abb_name);


--
-- Name: mlbteams mlbteams_fg_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbteams
    ADD CONSTRAINT mlbteams_fg_id_key UNIQUE (fg_id);


--
-- Name: mlbteams mlbteams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbteams
    ADD CONSTRAINT mlbteams_pkey PRIMARY KEY (id);


--
-- Name: mlbteams mlbteams_short_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbteams
    ADD CONSTRAINT mlbteams_short_name_key UNIQUE (short_name);


--
-- Name: portfolio_value_history portfolio_value_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio_value_history
    ADD CONSTRAINT portfolio_value_history_pkey PRIMARY KEY (id);


--
-- Name: portfolios portfolios_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT portfolios_name_key UNIQUE (name);


--
-- Name: portfolios portfolios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT portfolios_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: portfolios fk_portfolios_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT fk_portfolios_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: mlbplayer_value_history mlbplayer_value_history_mlbplayer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayer_value_history
    ADD CONSTRAINT mlbplayer_value_history_mlbplayer_id_fkey FOREIGN KEY (mlbplayer_id) REFERENCES public.mlbplayers(fg_id);


--
-- Name: mlbplayers_portfolios mlbplayers_portfolios_mlbplayer_fgid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayers_portfolios
    ADD CONSTRAINT mlbplayers_portfolios_mlbplayer_fgid_fkey FOREIGN KEY (mlbplayer_fgid) REFERENCES public.mlbplayers(fg_id);


--
-- Name: mlbplayers_portfolios mlbplayers_portfolios_portfolio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayers_portfolios
    ADD CONSTRAINT mlbplayers_portfolios_portfolio_id_fkey FOREIGN KEY (portfolio_id) REFERENCES public.portfolios(id) ON DELETE CASCADE;


--
-- Name: mlbplayers_portfolios_transactions mlbplayers_portfolios_transactions_mlbplayer_fgid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayers_portfolios_transactions
    ADD CONSTRAINT mlbplayers_portfolios_transactions_mlbplayer_fgid_fkey FOREIGN KEY (mlbplayer_fgid) REFERENCES public.mlbplayers(fg_id);


--
-- Name: mlbplayers_portfolios_transactions mlbplayers_portfolios_transactions_portfolio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayers_portfolios_transactions
    ADD CONSTRAINT mlbplayers_portfolios_transactions_portfolio_id_fkey FOREIGN KEY (portfolio_id) REFERENCES public.portfolios(id) ON DELETE SET NULL;


--
-- Name: mlbplayers mlbplayers_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayers
    ADD CONSTRAINT mlbplayers_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.mlbteams(fg_id);


--
-- Name: mlbteam_value_history mlbteam_value_history_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbteam_value_history
    ADD CONSTRAINT mlbteam_value_history_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.mlbteams(fg_id);


--
-- Name: portfolio_value_history portfolio_value_history_portfolio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio_value_history
    ADD CONSTRAINT portfolio_value_history_portfolio_id_fkey FOREIGN KEY (portfolio_id) REFERENCES public.portfolios(id);


--
-- PostgreSQL database dump complete
--

