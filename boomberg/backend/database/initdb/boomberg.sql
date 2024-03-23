--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.11 (Homebrew)

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
be6ebd1f1595
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
23927	Luis Rengifo	2B/3B/RF	2	S	R	27.1		0	4400000.0	1	1.93583	1.96062	19858	1
23928	Nolan Schanuel	1B	18	L	R	22.1		0	740000	1	0.117822	1.77163	33189	2
23929	Mike Trout	CF	27	R	R	32.6		0	35541666.66666667	1	3.00032	4.3415	10155	3
23930	Anthony Rendon	3B	6	R	R	33.8		0	35000000.0	1	0.167568	2.35242	12861	4
23931	Taylor Ward	LF/RF/CF	3	R	R	30.3		0	4800000.0	1	1.51085	2.3762	17548	5
23932	Brandon Drury	2B/1B/3B	23	R	R	31.6		0	8500000.0	1	2.48649	0.946175	11615	6
23933	Mickey Moniak	CF/RF/LF	16	L	R	25.9		0	740000	1	1.55315	0.179179	19956	7
23934	Logan O'Hoppe	C	14	R	R	24.1		0	740000	1	0.243691	2.08284	24729	8
23935	Zach Neto	SS	9	R	R	23.1		0	740000	1	1.07344	2.9649	31347	9
23936	Matt Thaiss	C/1B	21	L	R	28.9		0	740000	1	0.307545	0.305177	19318	Bench
23937	Jo Adell	RF/LF/CF	7	R	R	25.0		0	740000	1	0.226085	0.287174	20220	Bench
23938	Aaron Hicks	CF/LF/RF	12	S	R	34.5		0	740000.0	1	1.0336	0.500069	5297	Bench
23939	Patrick Sandoval	SP	43	L	L	27.4		0	5025000.0	1	2.3496	2.39018	19447	SP1
23940	Griffin Canning	SP	47	R	R	27.9		0	2600000.0	1	1.83104	2.08588	19867	SP2
23941	Reid Detmers	SP	48	L	L	24.7		0	740000	1	2.50839	2.50468	27468	SP3
23942	Chase Silseth	SP/RP	63	R	R	23.8		0	740000	1	0.208596	1.29256	30074	SP4
23943	Tyler Anderson	SP	31	L	L	34.2		0	13000000.0	1	1.14429	1.56004	12880	SP4
23944	Carlos Estévez	RP	53	R	R	31.2		0	6750000.0	1	0.914222	0.682527	14542	CL
23945	Matt Moore	RP	55	L	L	34.8		0	9000000.0	1	0.643589	0.145897	1890	SU8
23946	José Soriano	RP	59	R	R	25.4		0	740000	1	0.390509	0.626088	22100	SU7
23947	Luis García	RP	66	R	R	37.1		0	4250000.0	1	0.0881938	0.24194	6984	MID
23948	Adam Cimber	RP	90	R	R	33.6		0	1650000.0	1	-0.592549	-0.223857	15288	MID
23949	José Cisnero	RP	67	R	R	34.9		0	1750000.0	1	-0.0135295	0.0508111	6399	MID
23950	José Suarez	SP/RP	54	L	L	26.2		0	925000.0	1	-0.481846	0.201627	19911	LR
23951	Michael Stefanic	2B/3B	38	R	R	28.1	Strained quad	0	740000	1	0.23682	0.274703	25353	Inj
23952	Sam Bachman	SP/RP	40	R	R	24.5	Arthroscopic shoulder surgery	0	740000	1	0.163953	-0.0329478	29754	Inj
23953	Robert Stephenson	RP	24	R	R	31.1	Shoulder soreness	0	11000000.0	1	0.942149	0.512234	13594	Inj
23954	Cedric Mullins	CF	31	L	L	29.5		0	6325000.0	2	1.78884	2.84853	17929	1
23955	Adley Rutschman	C	35	S	R	26.1		0	740000	2	5.06364	5.30178	26288	2
23956	Gunnar Henderson	3B/SS	2	L	R	22.7		0	740000	2	4.64354	5.301	26289	3
23957	Anthony Santander	RF/LF/1B	25	S	R	29.4		0	11700000.0	2	2.63537	2.41846	14551	4
23958	Ryan O'Hearn	1B/RF/LF	32	L	L	30.7		0	3500000.0	2	1.43445	0.927191	16442	5
23959	Ryan Mountcastle	1B	6	R	R	27.1		0	4137000.0	2	1.65158	1.56831	18373	6
23960	Austin Hays	LF/RF/CF	21	R	R	28.7		0	6300000.0	2	2.20232	2.10258	19363	7
23961	Ramón Urías	3B/2B/1B	29	R	R	29.8		0	2100000.0	2	0.834256	1.02845	18795	8
23962	Jordan Westburg	2B/3B/SS	11	R	R	25.1		0	740000	2	1.07988	2.02907	27815	9
23963	James McCann	C	27	R	R	33.8		0	12150000.0	2	0.492868	0.437088	12859	Bench
23964	Jorge Mateo	SS/CF/2B	3	R	R	28.8		0	2700000.0	2	0.45637	0.506599	17273	Bench
23965	Colton Cowser	CF/RF/LF	17	L	R	24.0		0	740000	2	-0.399431	0.594347	29591	Bench
23966	Ryan McKenna	CF/RF/LF	26	R	R	27.1		0	800000.0	2	0.344059	0.0417385	19928	Bench
23967	Corbin Burnes	SP	39	R	R	29.4		0	15637500.0	2	3.43443	3.75877	19361	SP1
23968	Grayson Rodriguez	SP	30	R	R	24.4		0	740000	2	1.83354	2.61824	24492	SP2
23969	Tyler Wells	SP/RP	68	R	R	29.6		0	1962500.0	2	0.62513	0.526351	20000	SP3
23970	Dean Kremer	SP	64	R	R	28.2		0	740000	2	1.48825	1.76978	19350	SP4
23971	Cole Irvin	SP/RP	19	L	L	30.1		0	2000000.0	2	0.525438	0.418034	19244	SP5
23972	Craig Kimbrel	RP	46	R	R	35.8		0	13000000.0	2	1.12684	0.413055	6655	CL
23973	Yennier Cano	RP	78	R	R	30.0		0	740000	2	1.67735	0.446051	25911	SU8
23974	Danny Coulombe	RP	54	L	L	34.4		0	2300000.0	2	1.38192	0.280562	13293	SU7
23975	Dillon Tate	RP	55	R	R	29.9		0	1500000.0	2	\N	-0.0663421	17796	MID
23976	Cionel Pérez	RP	58	L	L	27.9		0	1200000.0	2	0.392302	0.100538	19614	MID
23977	Jacob Webb	RP	71	R	R	30.6		0	1000000.0	2	0.109185	0.0950656	19274	MID
23978	Mike Baumann	RP	53	R	R	28.5		0	740000	2	0.0166589	0.0104581	20206	MID
23979	Keegan Akin	RP/SP	45	L	L	29.0		0	825000.0	2	0.411454	0.209552	19362	LR
23980	Kyle Bradish	SP	38	R	R	27.5	Sprained elbow	0	740000	2	3.78228	1.50793	24586	Inj
23981	John Means	SP	47	L	L	30.9	Elbow soreness	0	3325000.0	2	0.159236	1.12619	16269	Inj
23982	Jarren Duran	CF/RF/LF	16	L	R	27.5		0	760000.0	3	2.3763	1.25955	24617	1
23983	Rafael Devers	3B	11	L	R	27.4		0	29000000.0	3	3.13014	4.32827	17350	2
23984	Trevor Story	SS/2B	10	R	R	31.4		0	23333333.33333333	3	0.242975	2.66539	12564	3
23985	Triston Casas	1B	36	L	R	24.2		0	760000.0	3	1.74727	2.73029	22514	4
23986	Tyler O'Neill	LF/CF/RF	17	R	R	28.8		0	5850000.0	3	0.803699	2.4316	15711	5
23987	Masataka Yoshida	LF/RF	7	L	R	30.7		0	18000000.0	3	0.625189	1.77541	31837	6
23988	Ceddanne Rafaela	CF/SS/2B	43	R	R	23.5		0	740000	3	0.0562013	1.5639	24262	7
23989	Enmanuel Valdez	2B/3B	47	L	R	25.2		0	740000	3	0.270591	0.454167	21716	8
23990	Connor Wong	C	12	R	R	27.8		0	760000.0	3	0.472565	0.410026	19896	9
23991	Reese McGuire	C	3	L	R	29.1		0	1500000.0	3	0.335216	0.866561	15674	Bench
23992	Pablo Reyes	2B/SS/CF	19	R	R	30.5		0	740000	3	0.458347	0.263426	16357	Bench
23993	Wilyer Abreu	LF/RF/CF	52	L	L	24.7		0	740000	3	0.563141	0.920111	23772	Bench
23994	Brayan Bello	SP	66	R	R	24.9		0	9166666.66666667	3	1.59948	2.62578	23920	SP1
23995	Nick Pivetta	SP	37	R	R	31.1		0	7500000.0	3	1.88075	2.0102	15454	SP2
23996	Kutter Crawford	SP/RP	50	R	R	28.0		0	760000.0	3	2.44703	1.92718	20531	SP3
23997	Garrett Whitlock	SP/RP	22	R	R	27.8		0	4687500.0	3	0.819507	1.80506	20191	SP4
23998	Tanner Houck	SP/RP	89	R	R	27.7		0	770000.0	3	1.21043	1.66997	19879	SP5
23999	Kenley Jansen	RP	74	S	R	36.5		0	16000000.0	3	1.09018	0.715045	3096	CL
24000	Chris Martin	RP	55	R	R	37.8		0	8750000.0	3	1.49227	0.805857	11847	SU8
24001	Josh Winckowski	RP	25	R	R	25.7		0	740000	3	0.804205	0.593409	22387	SU7
24002	Brennan Bernardino	RP	83	L	L	32.2		0	740000	3	0.742855	0.157948	16835	MID
24003	Isaiah Campbell	RP	44	R	R	26.6		0	740000	3	0.302751	0.270515	25551	MID
24004	Justin Slaten	RP	63	R	R	26.5		0	740000	3	\N	-0.0208232	\N	MID
24005	Chase Anderson	SP/RP	\N	R	R	36.3		0	740000	3	0.213778	-0.0255236	6895	LR
24006	Vaughn Grissom	SS/2B/3B	5	R	R	23.2	Strained groin	0	740000	3	-0.665292	2.05168	26031	Inj
24007	Rob Refsnyder	LF/CF/RF	30	R	R	33.0	Fractured toe	0	1850000.0	3	0.181838	0.403939	13770	Inj
24008	Lucas Giolito	SP	54	R	R	29.7	Elbow surgery (internal brace)	0	19250000.0	3	0.977849	\N	15474	Inj
24009	Bryan Mata	SP	79	R	R	24.9	Strained hamstring	0	740000	3	\N	0.0302872	\N	Inj
24010	Chris Murphy	SP/RP	72	L	L	25.8	Elbow soreness	0	740000	3	0.377732	\N	26214	Inj
24011	Liam Hendriks	RP	31	R	R	35.1	Tommy John surgery	0	5000000.0	3	-0.0548376	0.0403562	3548	Inj
24012	Andrew Benintendi	LF/RF	23	L	L	29.7		0	15000000.0	4	-0.0497933	1.51408	17901	1
24013	Yoán Moncada	3B	10	S	R	28.8		0	14000000.0	4	1.22346	2.37864	17232	2
24014	Luis Robert Jr.	CF	88	R	R	26.6		0	8333333.33333333	4	5.0234	4.03065	20043	3
24015	Eloy Jiménez	LF/RF	74	R	R	27.3		0	7166666.66666667	4	0.42041	1.96151	17484	4
24016	Andrew Vaughn	1B	25	R	R	26.0		0	3250000.0	4	0.254183	1.62142	26197	5
24017	Paul DeJong	SS	29	R	R	30.6		0	1750000.0	4	0.307071	0.681809	18015	6
24018	Dominic Fletcher	CF/RF/LF	7	L	L	26.6		0	740000	4	0.638946	0.385773	26149	7
24019	Martín Maldonado	C	15	R	R	37.6		0	4250000.0	4	-1.24746	-0.562957	6887	8
24020	Nicky Lopez	SS/2B/3B	8	L	R	29.0		0	4300000.0	4	1.07188	0.762143	19339	9
24021	Max Stassi	C	33	R	R	33.0		0	7500000.0	4	\N	0.890005	10059	Bench
24022	Gavin Sheets	1B/LF/RF	32	L	L	27.9		0	740000	4	-1.38995	0.0771131	19901	Bench
24023	Garrett Crochet	RP	45	L	L	24.8		0	800000.0	4	-0.125685	1.51416	27463	SP1
24024	Michael Soroka	SP	40	R	R	26.6		0	3000000.0	4	-0.400808	1.35571	18383	SP2
24025	Erick Fedde	SP	20	R	R	31.1		0	7500000.0	4	\N	1.08972	17425	SP3
24026	Chris Flexen	SP/RP	77	R	R	29.7		0	1750000.0	4	-0.469031	1.05992	13896	SP4
24027	Steven Wilson	RP	36	R	R	29.6		0	740000	4	0.422234	0.23227	20353	CL
24028	John Brebbia	RP	59	R	R	33.8		0	5500000.0	4	0.318021	0.35841	12777	CL
24029	Michael Kopech	SP	34	R	R	27.9		0	3000000.0	4	-0.887211	0.0864753	17282	CL
24030	Tim Hill	RP	54	L	L	34.1		0	1800000.0	4	-0.443333	-0.203103	16814	MID
24031	Deivi García	RP	64	R	R	24.8		0	740000	4	-0.185858	-0.347737	20276	MID
24032	Tanner Banks	RP	57	L	L	32.4		0	740000	4	0.126829	0.0678143	16990	MID
24033	Touki Toussaint	SP/RP	47	R	R	27.8		0	1300000.0	4	0.415367	-0.0235612	16929	LR
24034	Prelander Berroa	RP/SP	73	R	R	23.9	Shoulder discomfort	0	740000	4	-0.014169	-0.00265067	22932	Inj
24035	Shane Drohan	SP	71	L	L	25.2	Shoulder surgery (nerve decompression)	0	740000	4	\N	\N	\N	Inj
24036	Jimmy Lambert	RP	58	R	R	29.3	Shoulder soreness	0	740000	4	-0.533635	-0.0112302	19541	Inj
24037	Davis Martin	SP	65	L	R	27.2		0	740000	4	\N	\N	21448	Inj
24038	Steven Kwan	LF/CF/RF	38	L	L	26.5		0	740000	5	2.88951	2.83576	24610	1
24039	Andrés Giménez	2B/SS	0	L	R	25.5		0	15214285.71428571	5	3.64027	4.33715	19950	2
24040	José Ramírez	3B/2B	11	S	R	31.5		0	20142857.14285714	5	5.1012	5.15971	13510	3
24041	Josh Naylor	1B	22	L	L	26.8		0	6550000.0	5	2.49904	2.03375	18839	4
24042	Ramón Laureano	CF/RF	10	R	R	29.7		0	5150000.0	5	0.975834	1.54632	17128	5
24043	Will Brennan	RF/CF/LF	17	L	L	26.1		0	740000	5	0.732631	0.574194	25660	6
24044	Bo Naylor	C	23	L	R	24.1		0	740000	5	2.41666	2.26521	21865	7
24045	Estevan Florial	CF/RF/LF	90	L	R	26.3		0	740000	5	0.201099	0.865415	19151	8
24046	Brayan Rocchio	SS/2B/3B	4	S	R	23.2		0	740000	5	-0.561889	1.46753	23690	9
24047	Austin Hedges	C	27	R	R	31.6		0	4000000.0	5	0.771819	0.894562	12976	Bench
24048	David Fry	C/1B/3B	6	R	R	28.3		0	740000	5	0.0209496	0.232202	24934	Bench
24049	Gabriel Arias	SS/3B/RF	13	R	R	24.1		0	740000	5	0.37819	0.721086	22563	Bench
24050	Tyler Freeman	2B/SS/CF	2	R	R	24.8		0	740000	5	0.182226	0.827681	22532	Bench
24051	Shane Bieber	SP	57	R	R	28.8		0	13125000.0	5	2.06576	3.34869	19427	SP1
24052	Triston McKenzie	SP	24	R	R	26.6		0	1600000.0	5	0.219301	2.33901	18000	SP2
24053	Tanner Bibee	SP	28	R	R	25.1		0	740000	5	3.01726	2.05895	30134	SP3
24054	Logan Allen	SP	41	R	L	25.5		0	740000	5	1.65682	1.5288	27589	SP4
24055	Emmanuel Clase	RP	48	R	R	26.0		0	4000000.0	5	1.73069	1.35307	21032	CL
24056	Scott Barlow	RP	58	R	R	31.3		0	6700000.0	5	1.00281	0.655317	14993	SU8
24057	Nick Sandlin	RP	52	R	R	27.2		0	1075000.0	5	-0.275656	0.0514032	20517	SU7
24058	Eli Morgan	RP	49	R	R	27.9		0	740000	5	0.418839	0.13536	20203	MID
24059	Hunter Gaddis	SP/RP	33	R	R	26.0		0	740000	5	0.137183	0.0231367	25636	MID
24060	Tim Herrin	RP	29	L	L	27.5		0	740000	5	0.111358	0.207007	25139	MID
24061	Cade Smith	RP	91	R	R	24.9		0	740000	5	\N	0.105286	\N	MID
24062	Ben Lively	SP/RP	39	R	R	32.0	Illness	0	740000	5	0.378997	-0.0117168	14932	Inj
24063	Gavin Williams	SP	32	L	R	24.7	Elbow discomfort	0	740000	5	1.12717	1.16412	30122	Inj
24064	Sam Hentges	RP	31	L	L	27.7	Finger discomfort	0	1162500.0	5	1.07372	0.128284	18548	Inj
24065	James Karinchak	RP	99	R	R	28.5	Shoulder fatigue	0	1900000.0	5	-0.1973	0.121369	20151	Inj
24066	Trevor Stephan	RP	37	R	R	28.3	Elbow surgery (UCL)	0	2500000.0	5	0.923331	\N	19932	Inj
24067	Daniel Espino	SP	66	R	R	23.2		0	740000	5	\N	\N	\N	Inj
24068	Parker Meadows	CF/LF/RF	22	L	R	24.4		0	740000	6	1.01297	1.47496	23800	1
24069	Riley Greene	CF/RF/LF	31	L	L	23.5		0	740000	6	2.25918	2.7644	25976	2
24070	Spencer Torkelson	1B	20	R	R	24.6		0	740000	6	1.38757	2.07863	27465	3
24071	Kerry Carpenter	LF/RF	30	L	R	26.6		0	740000	6	2.17028	0.870864	25961	4
24072	Mark Canha	LF/RF/1B	21	R	R	35.1		0	11500000.0	6	1.56231	1.84106	11445	5
24073	Colt Keith	3B/2B	33	L	R	22.6		0	740000	6	\N	\N	\N	6
24074	Javier Báez	SS	28	R	R	31.3		0	23333333.33333333	6	0.801812	1.06569	12979	7
24075	Gio Urshela	3B/SS/1B	13	R	R	32.4		0	1500000.0	6	0.38525	1.0856	10681	8
24076	Jake Rogers	C	34	R	R	28.9		0	1700000.0	6	2.21833	1.54883	19452	9
24077	Carson Kelly	C	15	R	R	29.7		0	3500000.0	6	0.0610772	0.993173	13620	Bench
24078	Andy Ibáñez	2B/3B/LF	77	R	R	31.0		0	740000	6	1.57211	0.711548	18819	Bench
24079	Zach McKinstry	3B/2B/RF	39	L	R	28.9		0	740000	6	1.185	0.802008	19392	Bench
24080	Matt Vierling	RF/LF/3B	8	R	R	27.5		0	740000	6	1.20034	0.841558	21558	Bench
24081	Tarik Skubal	SP	29	L	L	27.3		0	2650000.0	6	3.28385	3.69485	22267	SP1
24082	Kenta Maeda	SP/RP	18	R	R	35.9		0	12000000.0	6	1.54876	1.73269	18498	SP2
24083	Jack Flaherty	SP	45	R	R	28.4		0	14000000.0	6	1.76314	1.49644	17479	SP3
24084	Casey Mize	SP	12	R	R	26.9		0	840000.0	6	\N	0.98565	20492	SP4
24085	Reese Olson	SP	40	R	R	24.6		0	740000	6	1.4759	1.56856	24968	SP5
24086	Alex Lange	RP	55	R	R	28.5		0	740000	6	-0.0701914	0.441366	19883	CL
24087	Jason Foley	RP	68	R	R	28.4		0	740000	6	1.5221	0.446945	19531	SU8
24088	Shelby Miller	RP	7	R	R	33.5		0	3250000.0	6	0.514524	0.106233	10197	SU7
24089	Andrew Chafin	RP	17	R	L	33.8		0	4750000.0	6	0.480097	0.284145	12988	MID
24090	Beau Brieske	RP	4	R	R	26.0		0	740000	6	0.242755	0.112052	26079	MID
24091	Tyler Holton	RP	87	L	L	27.8		0	740000	6	0.951775	0.224115	26231	MID
24092	Joey Wentz	SP/RP	43	L	L	26.5		0	740000	6	-0.611354	0.221965	19962	MID
24093	Alex Faedo	SP	49	R	R	28.4		0	740000	6	0.45881	0.190934	19874	LR
24094	Sawyer Gipson-Long	SP	66	R	R	26.3	Strained groin	0	740000	6	0.500673	0.496458	26048	Inj
24095	MJ Melendez	RF/LF/C	1	L	R	25.3		0	740000	7	0.0646611	0.9133	22197	1
24096	Bobby Witt Jr.	SS/3B	7	R	R	23.8		0	26252525.18181818	7	5.74073	4.56918	25764	2
24097	Vinnie Pasquantino	1B	9	L	L	26.5		0	740000	7	0.043548	2.36138	27676	3
24098	Salvador Perez	C/1B	13	R	R	33.9		0	20500000.0	7	-0.262208	1.08993	7304	4
24099	Hunter Renfroe	RF/LF/1B	16	R	R	32.2		0	6500000.0	7	0.599239	0.791006	15464	5
24100	Adam Frazier	2B/RF/LF	26	L	R	32.3		0	4500000.0	7	0.277668	0.610522	15223	6
24101	Maikel Garcia	3B/SS/2B	11	R	R	24.1		0	740000	7	1.92177	1.80888	22715	7
24102	Nelson Velázquez	CF/RF/LF	17	R	R	25.2		0	740000	7	0.727091	0.282742	23359	8
24103	Kyle Isbel	CF/RF/LF	28	L	R	27.1		0	740000	7	1.14368	1.58323	21614	9
24104	Freddy Fermin	C	34	R	R	28.9		0	740000	7	1.50888	1.01403	21840	Bench
24105	Nick Loftin	3B/2B/1B	12	R	R	25.5		0	740000	7	0.375538	0.290913	27630	Bench
24106	Garrett Hampson	SS/CF/RF	2	R	R	29.5		0	2000000.0	7	0.738858	0.179189	19262	Bench
24107	Dairon Blanco	CF/LF/RF	44	R	R	30.9		0	740000	7	1.12661	0.308049	19779	Bench
24108	Cole Ragans	SP	55	L	L	26.3		0	740000	7	2.24099	2.48031	21846	SP1
24109	Seth Lugo	RP	67	R	R	34.3		0	15000000.0	7	2.83283	1.81321	12447	SP2
24110	Michael Wacha	SP	52	R	R	32.7		0	16000000.0	7	2.61036	1.49995	14078	SP3
24111	Brady Singer	SP	51	R	R	27.6		0	4850000.0	7	1.90436	2.19439	25377	SP4
24112	Alec Marsh	SP	48	R	R	25.9		0	740000	7	-0.497597	0.729729	27451	SP5
24113	James McArthur	RP	66	R	R	27.3		0	740000	7	0.514165	0.163484	21527	CL
24114	Will Smith	RP	31	R	L	34.7		0	5000000.0	7	1.12707	0.261965	8048	CL
24115	John Schreiber	RP	46	R	R	30.1		0	1175000.0	7	0.100306	0.401048	20020	SU7
24116	Nick Anderson	RP	63	R	R	33.7		0	1575000.0	7	0.877101	0.264499	18337	MID
24117	Chris Stratton	RP	35	R	R	33.6		0	4000000.0	7	1.14653	0.238145	13761	MID
24118	Angel Zerpa	SP/RP	61	L	L	24.5		0	740000	7	0.141552	0.13987	22717	MID
24119	Jordan Lyles	SP	24	R	R	33.4		0	8500000.0	7	0.166872	0.237116	7593	MID
24120	Matt Sauer	SP	65	R	R	25.2		0	740000	7	\N	0.0110009	\N	LR
24121	Michael Massey	2B	19	L	R	26.0	Lower back tightness	0	740000	7	0.517012	1.19448	27684	Inj
24122	Jake Brentz	RP	59	L	L	29.5	Strained hamstring	0	950000.0	7	\N	-0.0103031	17783	Inj
24123	Carlos Hernández	RP	43	R	R	27.0	Shoulder soreness	0	1012500.0	7	0.250585	0.0457124	22713	Inj
24124	Josh Taylor	RP	38	L	L	31.1	Biceps soreness	0	1100000.0	7	0.0057821	0.0509078	17359	Inj
24125	Edouard Julien	2B	47	L	R	24.9		0	740000	8	2.78281	2.53208	27534	1
24126	Byron Buxton	CF	25	R	R	30.3		0	14285714.28571429	8	0.710614	2.9125	14161	2
24127	Carlos Correa	SS	4	R	R	29.5		0	33333333.33333333	8	1.1435	3.55778	14162	3
24128	Royce Lewis	SS/3B	23	R	R	24.8		0	740000	8	2.41517	3.99056	20437	4
24129	Max Kepler	RF/LF	26	L	L	31.1		0	10000000.0	8	2.62314	2.48025	12144	5
24130	Carlos Santana	1B	30	S	R	38.0		0	5250000.0	8	1.66188	0.704929	2396	6
24131	Matt Wallner	RF/LF	38	L	R	26.3		0	740000	8	1.88639	1.43241	26466	7
24132	Ryan Jeffers	C	27	R	R	26.8		0	2425000.0	8	2.70464	1.86176	24618	8
24133	Alex Kirilloff	1B/LF/RF	19	L	L	26.4		0	1350000.0	8	0.798766	0.762442	20325	9
24134	Christian Vázquez	C/1B	8	R	R	33.6		0	10000000.0	8	0.950065	1.30606	9774	Bench
24135	Kyle Farmer	SS/3B/2B	12	R	R	33.6		0	6300000.0	8	1.64694	0.719277	14813	Bench
24136	Willi Castro	LF/CF/3B	50	S	R	26.9		0	3300000.0	8	2.54121	1.00525	17338	Bench
24137	Manuel Margot	CF/RF/LF	13	R	R	29.5		0	12000000.0	8	0.490763	0.913067	14712	Bench
24138	Pablo López	SP	49	R	R	28.0		0	18375000.0	8	4.47028	4.05822	17085	SP1
24139	Joe Ryan	SP	41	R	R	27.8		0	740000	8	2.22009	2.77695	21390	SP2
24140	Bailey Ober	SP	17	R	R	28.7		0	740000	8	2.36044	2.09848	21224	SP3
24141	Chris Paddack	SP	20	R	R	28.2		0	4166666.66666667	8	0.0595433	2.04629	20099	SP4
24142	Louie Varland	SP/RP	37	L	R	26.3		0	740000	8	0.111928	1.49853	27691	SP5
24143	Griffin Jax	RP	22	R	R	29.3		0	740000	8	1.17766	0.63821	20253	CL
24144	Brock Stewart	RP	61	L	R	32.5		0	740000	8	0.859656	1.14824	16727	SU8
24145	Jorge Alcala	RP	66	R	R	28.7		0	845000.0	8	-0.44239	0.0662476	19459	SU7
24146	Steven Okert	RP	16	L	L	32.7		0	1062500.0	8	0.480171	0.500865	13580	MID
24147	Justin Topa	RP	48	R	R	33.0		0	1250000.0	8	1.10272	0.141552	15145	MID
24148	Josh Staumont	RP	63	R	R	30.3		0	950000.0	8	0.167997	0.0381391	18335	MID
24149	Kody Funderburk	RP	55	L	L	27.3		0	740000	8	0.278321	0.0433014	24993	MID
24150	Jay Jackson	RP	32	R	R	36.4		0	1500000.0	8	0.14134	0.254539	7432	LR
24151	Anthony DeSclafani	SP/RP	21	R	R	33.9	Strained forearm	0	12000000.0	8	0.954786	0.876957	13050	Inj
24152	Jhoan Duran	RP	59	R	R	26.2	Strained oblique	0	740000	8	1.03296	0.297897	21029	Inj
24153	Caleb Thielbar	RP	56	R	L	37.1	Strained hamstring	0	3225000.0	8	0.0870704	0.257401	10078	Inj
24154	DJ LeMahieu	3B/1B/2B	26	R	R	35.7		0	15000000.0	9	1.05949	2.3152	9874	1
24155	Juan Soto	LF/RF	22	L	L	25.4		0	31000000.0	9	5.53247	6.30719	20123	2
24156	Aaron Judge	RF/CF	99	R	R	31.9		0	40000000.0	9	5.26266	6.67977	15640	3
24157	Anthony Rizzo	1B	48	L	L	34.6		0	20000000.0	9	0.894266	1.35046	3473	4
24158	Gleyber Torres	2B	25	R	R	27.3		0	14200000.0	9	3.23541	3.78678	16997	5
24159	Giancarlo Stanton	RF/LF	27	R	R	34.4		0	25000000.0	9	-0.838386	0.884626	4949	6
24160	Alex Verdugo	LF/RF	24	L	L	27.9		0	8700000.0	9	2.04104	1.62104	17027	7
24161	Anthony Volpe	SS	11	R	R	22.9		0	740000	9	1.87831	2.80912	27647	8
24162	Jose Trevino	C	39	R	R	31.3		0	2730000.0	9	0.858769	2.09609	16725	9
24163	Austin Wells	C	88	L	R	25.5		0	740000	9	0.355493	1.29975	27562	Bench
24164	Oswaldo Cabrera	LF/RF/3B	95	S	R	25.1		0	740000	9	-0.64305	0.321044	21707	Bench
24165	Trent Grisham	CF	12	L	L	27.4		0	5500000.0	9	1.65925	1.3633	18564	Bench
24166	Nestor Cortes	SP	65	R	L	29.3		0	3950000.0	9	0.811173	2.17985	17874	SP1
24167	Carlos Rodón	SP	55	L	L	31.3		0	27000000.0	9	-0.151464	3.12657	16137	SP2
24168	Marcus Stroman	SP	0	R	R	32.9		0	18500000.0	9	2.74812	2.02425	13431	SP3
24169	Clarke Schmidt	SP	36	R	R	28.1		0	2025000.0	9	1.81274	1.80118	19899	SP4
24170	Clayton Beeter	SP	85	R	R	25.5		0	740000	9	\N	0.310222	\N	SP5
24171	Clay Holmes	RP	35	R	R	31.0		0	6000000.0	9	1.53651	0.788655	13649	CL
24172	Jonathan Loáisiga	RP	43	R	R	29.4		0	2500000.0	9	0.00104371	0.605623	19753	SU8
24173	Ian Hamilton	RP	71	R	R	28.8		0	740000	9	1.11666	0.465021	19261	SU7
24174	Caleb Ferguson	RP	64	R	L	27.7		0	2400000.0	9	1.29468	0.578452	19349	MID
24175	Ron Marinaccio	RP	97	R	R	28.7		0	740000	9	-0.168933	-0.138119	23488	MID
24176	Victor González	RP	47	L	L	28.4		0	860000.0	9	0.366284	0.0382304	16408	MID
24177	Luke Weaver	SP/RP	30	R	R	30.6		0	2000000.0	9	0.434947	0.16423	16918	LR
24178	Oswald Peraza	SS/3B/2B	91	R	R	23.8	Strained shoulder	0	740000	9	-0.336985	0.927466	22823	Inj
24179	Gerrit Cole	SP	45	R	R	33.5	Elbow discomfort	0	36000000.0	9	5.22698	1.81015	13125	Inj
24180	Tommy Kahnle	RP	41	R	R	34.6	Shoulder inflammation	0	5750000.0	9	0.267539	0.0500246	11384	Inj
24181	Ryan Noda	1B/RF/LF	49	L	L	28.0		0	740000	10	1.97989	1.21393	23312	1
24182	Zack Gelof	2B	20	R	R	24.4		0	740000	10	2.87359	2.38584	29766	2
24183	Brent Rooker	LF/RF	25	R	R	29.4		0	740000	10	2.00735	1.58849	19627	3
24184	Seth Brown	RF/LF/1B	15	L	L	31.7		0	2600000.0	10	-0.0273054	1.14783	18171	4
24185	J.D. Davis	3B/1B	5	R	R	30.9		0	2500000.0	10	2.1576	2.19548	16219	5
24186	JJ Bleday	CF/LF/RF	33	L	L	26.4		0	740000	10	0.111637	0.898385	26368	6
24187	Shea Langeliers	C	23	R	R	26.3		0	740000	10	0.720744	1.24457	25816	7
24188	Esteury Ruiz	CF/LF/RF	1	R	R	25.1		0	740000	10	1.27886	1.34744	21780	8
24189	Nick Allen	SS/2B	10	R	R	25.5		0	740000	10	-0.124841	1.10993	22277	9
24190	Abraham Toro	3B/2B/1B	31	S	R	27.3		0	1275000.0	10	0.197181	0.456395	19844	Bench
24191	Lawrence Butler	CF/RF/1B	2	L	R	23.7		0	740000	10	-0.207406	0.343852	22542	Bench
24192	Alex Wood	SP	57	R	L	33.2		0	8500000.0	10	0.18418	1.35576	13781	SP1
24193	Ross Stripling	SP/RP	36	R	R	34.3		0	12500000.0	10	-0.253237	1.35603	13273	SP2
24194	JP Sears	SP	38	9	L	28.1		0	740000	10	0.628044	1.71648	23429	SP3
24195	Paul Blackburn	SP	58	R	R	30.3		0	3450000.0	10	1.53379	1.27	14739	SP4
24196	Joe Boyle	SP	35	R	R	24.6		0	740000	10	0.401614	0.446512	29608	SP5
24197	Mason Miller	SP	19	R	R	25.6		0	740000	10	0.688787	1.23798	31757	CL
24198	Lucas Erceg	RP	70	L	R	28.9		0	740000	10	0.832249	0.403013	19360	CL
24199	Dany Jiménez	RP	56	R	R	30.2		0	740000	10	0.0620978	0.208223	21170	SU7
24200	Kyle Muller	SP	39	R	L	26.5		0	740000	10	-0.65512	0.21185	20167	MID
24201	Zach Jackson	RP	61	R	R	29.2		0	740000	10	0.4492	0.161452	19493	MID
24202	Michael Kelly	RP	47	R	R	31.5		0	740000	10	0.227018	0.0427047	12791	MID
24203	Mitch Spence	SP	69	R	R	25.9		0	740000	10	\N	0.440678	\N	LR
24204	Aledmys Díaz	SS/3B/LF	6	R	R	33.6	Strained groin	0	7250000.0	10	-0.401093	0.174797	15937	Inj
24205	Miguel Andujar	RF/1B/LF	22	R	R	29.1	Torn knee meniscus	0	1700000.0	10	0.139082	0.593642	15878	Inj
24206	Luis Medina	SP	46	R	R	24.9	Sprained knee	0	740000	10	0.480068	0.686428	21649	Inj
24207	Freddy Tarnok	SP	62	R	R	25.3	Hip surgery	0	740000	10	-0.342616	0.00675569	23324	Inj
24208	Scott Alexander	RP	54	L	L	34.7	Stress reaction in rib	0	2250000.0	10	0.671266	0.104402	10591	Inj
24209	Trevor Gott	RP	17	R	R	31.6	Tommy John surgery	0	1500000.0	10	0.998989	\N	15046	Inj
24210	Sean Newcomb	SP/RP	16	L	L	30.8	Arthroscopic knee surgery	0	1000000.0	10	0.16352	0.03127	16943	Inj
24211	J.P. Crawford	SS	3	L	R	29.2		0	10200000.0	11	4.91936	3.3384	15491	1
24212	Julio Rodríguez	CF/RF	44	R	R	23.2		0	17441666.66666667	11	5.87046	5.50843	23697	2
24213	Jorge Polanco	2B/3B/SS	7	S	R	30.7		0	10500000.0	11	1.52307	2.41002	13152	3
24214	Mitch Garver	C/1B	18	R	R	33.2		0	12000000.0	11	2.11411	1.44254	15161	4
24215	Cal Raleigh	C	29	S	R	27.3		0	740000	11	4.69042	3.65572	21534	5
24216	Mitch Haniger	RF/LF	17	R	R	33.2		0	17750000.0	11	-0.232169	1.01542	14274	6
24217	Dominic Canzone	LF/RF	8	L	R	26.6		0	740000	11	-0.453101	0.880537	26438	7
24218	Ty France	1B/3B	23	R	R	29.7		0	6775000.0	11	0.543213	2.04848	17982	8
24219	Josh Rojas	2B/3B/SS	4	L	R	29.7		0	3100000.0	11	1.13506	0.857599	19734	9
24220	Seby Zavala	C	33	R	R	30.6		0	740000	11	0.240834	0.344904	18887	Bench
24221	Luis Urías	3B/2B/SS	16	R	R	26.8		0	5000000.0	11	-0.081645	1.21468	16622	Bench
24222	Dylan Moore	2B/LF/SS	25	R	R	31.6		0	2958333.33333333	11	0.657489	0.770592	18042	Bench
24223	Luke Raley	RF/1B/LF	20	L	R	29.5		0	740000	11	2.61727	1.05357	19354	Bench
24224	Luis Castillo	SP	58	R	R	31.3		0	21600000.0	11	3.43067	3.76259	15689	SP1
24225	George Kirby	SP	68	R	R	26.1		0	740000	11	4.37777	3.7028	25436	SP2
24226	Logan Gilbert	SP	36	R	R	26.9		0	4050000.0	11	3.17108	3.02065	22250	SP3
24227	Bryce Miller	SP	50	R	R	25.6		0	740000	11	1.94188	1.63086	29837	SP4
24228	Bryan Woo	SP	22	R	R	24.1		0	740000	11	0.979788	1.48808	30279	SP5
24229	Andrés Muñoz	RP	75	R	R	25.2		0	1875000.0	11	1.25484	1.48544	20373	CL
24230	Ryne Stanek	RP	45	R	R	32.7		0	4000000.0	11	0.0604905	0.215631	15947	SU8
24231	Gabe Speier	RP	55	L	L	28.9		0	740000	11	0.604154	0.461386	17170	SU7
24232	Trent Thornton	RP	46	R	R	30.5		0	1200000.0	11	0.0698069	-0.0394287	17948	MID
24233	Tayler Saucedo	RP	60	L	L	30.8		0	740000	11	0.227025	0.00283727	17888	MID
24234	Cody Bolton	RP	67	R	R	25.8		0	740000	11	-0.180447	-0.0421006	23265	MID
24235	Austin Voth	SP/RP	30	R	R	31.7		0	1250000.0	11	-0.256777	0.0640219	15047	LR
24236	Matt Brash	RP	47	R	R	25.9	Elbow inflammation	0	740000	11	2.07265	0.158076	25756	Inj
24237	Gregory Santos	RP	48	R	R	24.6	Strained lat	0	740000	11	1.55479	0.271288	21894	Inj
24238	Yandy Díaz	1B	2	R	R	32.6		0	8000000.0	12	4.72479	3.67811	16578	1
24239	Brandon Lowe	2B	8	L	R	29.7		0	4000000.0	12	2.81245	2.78821	18882	2
24240	Randy Arozarena	LF/RF	56	R	R	29.1		0	8100000.0	12	3.34416	3.18229	19290	3
24241	Harold Ramírez	1B/RF/LF	43	R	R	29.5		0	3800000.0	12	1.791	0.490562	14387	4
24242	Isaac Paredes	3B/1B/2B	17	R	R	25.1		0	3400000.0	12	4.32443	3.45624	20036	5
24243	Richie Palacios	LF/CF/2B	1	L	R	26.9		0	740000	12	0.423032	0.519496	24589	6
24244	Jose Siri	CF	22	R	R	28.7		0	740000	12	2.69007	1.91405	17452	7
24245	José Caballero	2B/SS/3B	7	R	R	27.6		0	740000	12	2.17214	1.49352	23401	8
24246	René Pinto	C	50	R	R	27.4		0	740000	12	0.652931	1.64355	19859	9
24247	Curtis Mead	3B/2B	25	R	R	23.4		0	740000	12	0.194013	0.264598	23986	Bench
24248	Amed Rosario	SS/2B	10	R	R	28.3		0	1500000.0	12	0.192782	1.01682	15518	Bench
24249	Austin Shenton	3B/1B/LF	54	L	R	26.2		0	740000	12	\N	\N	\N	Bench
24250	Zach Eflin	SP	24	R	R	30.0		0	13333333.33333333	12	4.79957	3.64147	13774	SP1
24251	Aaron Civale	SP	34	R	R	28.8		0	4900000.0	12	2.53356	1.96095	19479	SP2
24252	Zack Littell	SP	52	R	R	28.5		0	1850000.0	12	1.09345	1.1605	15823	SP3
24253	Ryan Pepiot	SP	44	R	R	26.6		0	740000	12	0.40885	1.06092	26221	SP4
24254	Tyler Alexander	RP	14	R	L	29.7		0	1950000.0	12	0.110816	0.1499	17735	SP5
24255	Pete Fairbanks	RP	29	R	R	30.3		0	4000000.0	12	1.32315	1.80772	17998	CL
24256	Jason Adam	RP	47	R	R	32.6		0	2700000.0	12	0.375314	0.75721	11861	SU8
24257	Colin Poche	RP	38	L	L	30.2		0	2375000.0	12	1.09391	0.369757	19403	SU7
24258	Phil Maton	RP	88	R	R	31.0		0	6500000.0	12	0.581598	-0.00906194	18064	MID
24259	Shawn Armstrong	RP	64	R	R	33.5		0	2050000.0	12	1.27797	0.375537	12857	MID
24260	Garrett Cleavinger	RP	60	L	L	29.9		0	740000	12	-0.0914965	0.0869366	17897	MID
24261	Chris Devenski	RP	48	R	R	33.4		0	1100000.0	12	0.54109	0.100726	12763	MID
24262	Jacob Waguespack	RP/SP	67	R	R	30.4		0	740000	12	\N	0.0570369	18318	LR
24263	Taylor Walls	2B/3B/SS	6	S	R	27.7	Hip surgery (labrum repair)	0	740000	12	0.973787	0.91199	22458	Inj
24264	Jonathan Aranda	2B/1B/3B	62	L	R	25.8	Fractured finger	0	740000	12	0.141397	0.607129	21837	Inj
24265	Jonny DeLuca	CF/RF/LF	21	R	R	25.7	Fractured hand	0	740000	12	0.291654	0.412077	26365	Inj
24266	Josh Lowe	RF/CF/LF	15	L	R	26.1	Strained oblique	0	740000	12	3.81143	2.29248	19953	Inj
24267	Shane Baz	SP	11	R	R	24.8	Tommy John surgery	0	740000	12	\N	1.46531	22264	Inj
24268	Taj Bradley	SP	45	R	R	23.0	Strained pectoral	0	740000	12	0.773533	1.40158	22543	Inj
24269	Marcus Semien	2B/SS	2	R	R	33.5		0	25000000.0	13	6.30476	4.41351	12533	1
24270	Corey Seager	SS	5	L	R	29.9		0	32500000.0	13	6.09967	4.60944	13624	2
24271	Adolis García	RF/CF/LF	53	R	R	31.1		0	7000000.0	13	4.80987	2.54704	19287	3
24272	Evan Carter	CF/LF/RF	32	L	R	21.6		0	740000	13	1.32171	2.47758	27790	4
24273	Josh Jung	3B	6	R	R	26.1		0	740000	13	2.53555	2.49788	26299	6
24274	Jonah Heim	C	28	S	R	28.7		0	3050000.0	13	4.13324	3.57753	16930	7
24275	Leody Taveras	CF	3	S	R	25.5		0	2550000.0	13	2.23577	2.22632	18900	9
24276	Andrew Knizner	C	12	R	R	29.1		0	1825000.0	13	-0.138099	0.0572388	19514	Bench
24277	Ezequiel Duran	SS/LF/3B	20	R	R	24.8		0	740000	13	0.932906	0.494498	23733	Bench
24278	Josh Smith	SS/3B/LF	8	L	R	26.6		0	740000	13	-0.0183721	0.334861	26396	Bench
24279	Travis Jankowski	CF/LF/RF	16	L	R	32.8		0	1700000.0	13	0.998031	0.31899	13768	Bench
24280	Nathan Eovaldi	SP	17	R	R	34.1		0	17000000.0	13	2.4815	2.27579	9132	SP1
24281	Jon Gray	SP	22	R	R	32.4		0	14000000.0	13	1.84679	2.29176	14916	SP2
24282	Andrew Heaney	SP	44	L	L	32.8		0	12500000.0	13	1.33566	1.3452	15423	SP3
24283	Dane Dunning	SP	33	R	R	29.3		0	3325000.0	13	2.12197	1.73527	19409	SP4
24284	Cody Bradford	SP	61	L	L	26.1		0	740000	13	0.318508	0.305333	27597	SP5
24285	José Leclerc	RP	25	R	R	30.3		0	6250000.0	13	0.89813	0.409729	14524	CL
24286	David Robertson	RP	37	R	R	39.0		0	10533289.0	13	1.16843	0.315048	8241	CL
24287	Josh Sborz	RP	66	R	R	30.3		0	1025000.0	13	0.714602	0.725258	18323	SU8
24288	Kirby Yates	RP	39	L	R	37.0		0	4500000.0	13	-0.133293	-0.0326989	9073	SU7
24289	Brock Burke	RP	46	L	L	27.6		0	1035000.0	13	-0.189239	0.305072	17968	MID
24290	Marc Church	RP	68	R	R	23.0		0	740000	13	\N	0.0368014	\N	MID
24291	Grant Anderson	RP	65	R	R	26.8		0	740000	13	0.111081	0.0871179	20546	MID
24292	Michael Lorenzen	SP/RP	23	R	R	32.2		0	4500000.0	13	1.7008	0.688113	14843	LR
24293	Nathaniel Lowe	1B	30	L	R	28.7	Strained oblique	0	7500000.0	13	2.09108	1.94561	19566	Inj
24294	Tyler Mahle	SP	51	R	R	29.5	Tommy John surgery	0	11000000.0	13	0.359239	0.561438	16358	Inj
24295	Max Scherzer	SP	31	R	R	39.7	Back surgery (herniated disc)	0	43333333.33333333	13	2.16102	1.96115	3137	Inj
24296	Jonathan Hernández	RP	72	R	R	27.7	Strained lat	0	1245000.0	13	0.065728	0.0479155	17464	Inj
24297	George Springer	CF/RF	4	R	R	34.5		0	25000000.0	14	2.13738	2.8571	12856	1
24298	Bo Bichette	SS	11	R	R	26.1		0	11200000.0	14	3.83761	4.07498	19612	2
24299	Vladimir Guerrero Jr.	1B	27	R	R	25.0		0	19900000.0	14	0.984036	3.62661	19611	3
24300	Justin Turner	1B/3B	2	R	R	39.3		0	13000000.0	14	1.19944	1.61398	5235	4
24301	Daulton Varsho	CF/LF	25	L	R	27.7		0	5650000.0	14	2.16646	2.81756	19918	5
24302	Alejandro Kirk	C	30	R	R	25.4		0	2800000.0	14	1.636	3.06248	22581	6
24303	Kevin Kiermaier	CF	39	L	R	33.9		0	10500000.0	14	2.17423	1.70766	11038	7
24304	Isiah Kiner-Falefa	3B/SS/CF	7	R	R	29.0		0	7500000.0	14	0.151506	0.864974	16512	8
24305	Cavan Biggio	2B/RF/1B	8	L	R	29.0		0	4210000.0	14	1.04866	0.972429	19252	9
24306	Ernie Clement	SS/2B/3B	28	R	R	28.0		0	740000	14	0.646228	0.583604	20352	Bench
24307	Davis Schneider	2B/LF/3B	36	R	R	25.2		0	740000	14	2.00361	1.82662	23565	Bench
24308	Nathan Lukes	RF/LF/CF	38	L	R	29.7		0	740000	14	0.0280628	0.246353	18123	Bench
24309	José Berríos	SP	17	R	R	29.8		0	18714285.71428571	14	2.96652	2.43178	14168	SP1
24310	Chris Bassitt	SP	40	R	R	35.1		0	21000000.0	14	2.64196	2.8519	12304	SP2
24311	Yusei Kikuchi	SP	16	L	L	32.8		0	12000000.0	14	2.59685	1.89253	20633	SP3
24312	Bowden Francis	SP/RP	44	R	R	27.9		0	740000	14	0.198577	0.316319	20548	SP4
24313	Kevin Gausman	SP	34	R	R	33.2		0	22000000.0	14	5.29544	4.36009	14107	SP5
24314	Yimi García	RP	93	R	R	33.6		0	6000000.0	14	1.02946	0.636882	12095	CL
24315	Nate Pearson	RP	24	R	R	27.6		0	800000.0	14	-0.0226705	0.117609	20160	SU8
24316	Génesis Cabrera	RP	92	L	L	27.4		0	1512500.0	14	0.161903	0.143668	17490	SU7
24317	Chad Green	RP	57	L	R	32.8		0	10500000.0	14	0.264916	0.787692	15552	MID
24318	Tim Mayza	RP	58	L	L	32.2		0	3590000.0	14	1.30318	0.461649	15042	MID
24319	Trevor Richards	RP	33	R	R	30.9		0	2150000.0	14	0.410727	0.31475	19309	MID
24320	Zach Pop	RP	56	R	R	27.5		0	740000	14	-0.277961	0.00942918	20185	MID
24321	Mitch White	SP/RP	45	R	R	29.2		0	740000	14	-0.0372322	0.143048	19225	LR
24322	Danny Jansen	C	9	R	R	28.9	Fractured pisiform bone (wrist)	0	5200000.0	14	2.00126	1.80988	16535	Inj
24323	Alek Manoah	SP	6	R	R	26.2	Shoulder soreness	0	740000	14	-0.3985	0.938652	26410	Inj
24324	Yariel Rodriguez	SP/RP	29	R	R	27.0	Back spasms	0	740000	14	\N	0.249348	\N	Inj
24325	Jordan Romano	RP	68	R	R	30.9	Elbow inflammation	0	7750000.0	14	1.22394	0.41075	16122	Inj
24326	Erik Swanson	RP	50	R	R	30.5	Forearm soreness	0	2750000.0	14	0.908013	0.114867	16587	Inj
24327	Corbin Carroll	LF/RF/CF	7	L	L	23.6		0	13875000.0	15	6.05051	4.88902	25878	1
24328	Ketel Marte	2B	4	S	R	30.4		0	15200000.0	15	4.20949	3.69516	13613	2
24329	Lourdes Gurriel Jr.	LF	12	R	R	30.6		0	14000000.0	15	2.1102	1.56586	19238	3
24330	Christian Walker	1B	53	R	R	33.0		0	10900000.0	15	3.83501	2.55949	13419	4
24331	Joc Pederson	LF/RF	3	L	L	31.9		0	12500000.0	15	0.620099	1.16538	11899	5
24332	Gabriel Moreno	C	14	R	R	24.1		0	740000	15	1.67489	3.33042	22664	6
24333	Eugenio Suárez	3B	28	R	R	32.7		0	11285714.0	15	3.164	1.70168	12552	7
24334	Alek Thomas	CF/LF	5	L	L	23.9		0	740000	15	0.413981	2.08424	23792	8
24335	Geraldo Perdomo	SS/2B/3B	2	S	R	24.4		0	740000	15	2.71712	1.47068	22799	9
24336	Blaze Alexander	SS/2B/3B	62	R	R	24.8		0	740000	15	\N	\N	\N	Bench
24337	Emmanuel Rivera	3B/1B/SS	13	R	R	27.7		0	740000	15	0.288234	0.0710209	19890	Bench
24338	Jace Peterson	3B/2B/RF	6	L	R	33.9		0	5000000.0	15	0.381016	0.133796	12325	Bench
24339	Zac Gallen	SP	23	R	R	28.6		0	10011000.0	15	5.16585	3.34315	19291	SP1
24340	Merrill Kelly	SP	29	R	R	35.4		0	9000000.0	15	3.1732	2.36641	11156	SP2
24341	Brandon Pfaadt	SP	32	R	R	25.4		0	740000	15	0.334563	2.22129	27782	SP3
24342	Ryne Nelson	SP	19	R	R	26.1		0	740000	15	0.736399	1.0394	26253	SP4
24343	Tommy Henry	SP	47	L	L	26.7		0	740000	15	0.683621	0.584094	26285	SP5
24344	Paul Sewald	RP	38	R	R	33.8		0	7350000.0	15	0.860328	0.679183	13892	CL
24345	Kevin Ginkel	RP	37	R	R	30.0		0	1225000.0	15	1.27792	0.707899	19876	SU8
24346	Miguel Castro	RP	50	R	R	29.2		0	5000000.0	15	0.199257	0.23033	15684	SU7
24347	Scott McGough	RP	30	R	R	34.4		0	3125000.0	15	-0.0954781	0.432819	12056	MID
24348	Ryan Thompson	RP	81	R	R	31.7		0	1350000.0	15	0.0965167	0.157827	16647	MID
24349	Kyle Nelson	RP	24	L	L	27.7		0	740000	15	0.245455	0.187773	20515	MID
24350	Joe Mantiply	RP	35	R	L	33.1		0	925000.0	15	0.262859	0.0651422	14857	MID
24351	Bryce Jarvis	SP/RP	40	L	R	26.2		0	740000	15	-0.0813142	0.252679	27477	LR
24352	Randal Grichuk	LF/RF/CF	15	R	R	32.6	Ankle procedure (bone spur removal)	0	2000000.0	15	0.643058	0.215599	10243	Inj
24353	Eduardo Rodriguez	SP	57	L	L	31.0	Strained lat	0	20000000.0	15	3.00055	2.52899	13164	Inj
24354	Ronald Acuña Jr.	RF/CF	13	R	R	26.3		0	12500000.0	16	8.36214	7.4475	18401	1
24355	Ozzie Albies	2B	1	S	R	27.2		0	5000000.0	16	4.03628	3.64939	16556	2
24356	Austin Riley	3B	27	R	R	27.0		0	21200000.0	16	5.22996	4.42868	18360	3
24357	Matt Olson	1B	28	L	R	30.0		0	21000000.0	16	6.7045	4.24826	14344	4
24358	Marcell Ozuna	LF/RF	20	R	R	33.4		0	16250000.0	16	3.27298	1.38388	10324	5
24359	Michael Harris II	CF	23	L	L	23.0		0	9000000.0	16	3.91174	4.26213	25931	6
24360	Sean Murphy	C	12	R	R	29.5		0	12166666.66666667	16	4.21602	3.51032	19352	7
24361	Orlando Arcia	SS/3B/2B	11	R	R	29.6		0	2433333.33333333	16	2.27338	1.69331	13185	8
24362	Jarred Kelenic	LF/RF/CF	24	L	L	24.7		0	740000	16	1.30953	0.820261	22558	9
24363	Travis d'Arnaud	C	16	R	R	35.1		0	8000000.0	16	0.913151	1.47163	7739	Bench
24364	Luis Guillorme	SS/3B/2B	15	L	R	29.5		0	1100000.0	16	-0.252403	0.346109	16451	Bench
24365	Adam Duvall	LF/RF/CF	14	R	R	35.5		0	3000000.0	16	1.8609	0.381657	10950	Bench
24366	Forrest Wall	CF/LF/RF	73	L	R	28.3		0	740000	16	0.423713	0.0226588	16496	Bench
24367	Spencer Strider	SP	99	R	R	25.4		0	12500000.0	16	5.5186	4.95298	27498	SP1
24368	Max Fried	SP	54	L	L	30.2		0	15000000.0	16	1.89109	3.60657	13743	SP2
24369	Charlie Morton	SP	50	R	R	40.4		0	20000000.0	16	2.70492	1.97764	4676	SP3
24370	Chris Sale	SP	51	L	L	35.0		0	19000000.0	16	2.11804	2.80874	10603	SP4
24371	Reynaldo López	RP	40	R	R	30.2		0	10000000.0	16	0.787936	1.35793	16400	SP5
24372	Raisel Iglesias	RP	26	R	R	34.2		0	16000000.0	16	1.03684	1.2511	17130	CL
24373	A.J. Minter	RP	33	L	L	30.6		0	6220000.0	16	1.44444	1.16829	18655	SU8
24374	Joe Jiménez	RP	77	R	R	29.2		0	8666666.66666667	16	0.488828	0.515145	15761	SU7
24375	Pierce Johnson	RP	38	R	R	32.9		0	7125000.0	16	0.689104	0.582559	13435	MID
24376	Tyler Matzek	RP	68	L	L	33.4		0	1550000.0	16	\N	-0.0298908	10058	MID
24377	Aaron Bummer	RP	49	L	L	30.5		0	6750000.0	16	0.78827	0.413617	16258	MID
24378	Dylan Lee	RP	52	L	L	29.6		0	740000	16	0.0428495	0.189856	19996	MID
24379	Jackson Stephens	RP	53	R	R	29.9		0	740000	16	0.0643341	0.00205551	14420	LR
24380	Penn Murfee	RP	56	R	R	29.9	Elbow surgery	0	740000	16	0.0394554	0.00455808	25174	Inj
24381	Angel Perdomo	RP	67	L	L	29.9	Tommy John surgery	0	740000	16	0.492218	\N	17759	Inj
24382	Ian Anderson	SP	48	R	R	25.9		0	740000	16	\N	0.214313	19951	Inj
24383	Ian Happ	LF/CF	8	S	R	29.6		0	20333333.33333333	17	3.50943	2.91742	17919	1
24384	Seiya Suzuki	RF/LF	27	R	R	29.6		0	17000000.0	17	3.17891	2.38341	30116	2
24385	Cody Bellinger	CF/1B/RF	24	L	L	28.7		0	26666666.66666667	17	3.95256	2.56716	15998	3
24386	Christopher Morel	CF/2B/3B	5	R	R	24.7		0	740000	17	1.39999	1.62873	21897	4
24387	Dansby Swanson	SS	7	R	R	30.1		0	25285714.28571429	17	4.93463	3.72431	18314	5
24388	Michael Busch	2B/3B/1B	29	L	R	26.4		0	740000	17	-0.51939	0.976017	26319	6
24389	Nico Hoerner	2B/SS	2	R	R	26.9		0	11666666.66666667	17	4.66911	3.73371	21479	7
24390	Mike Tauchman	CF/RF/LF	40	L	L	33.3		0	1950000.0	17	1.75681	0.75142	15274	8
24391	Yan Gomes	C	15	R	R	36.7		0	6000000.0	17	0.951186	0.901405	9627	9
24392	Miguel Amaya	C	9	R	R	25.0		0	740000	17	0.575859	0.933158	21693	Bench
24393	Miles Mastrobuoni	3B/2B/RF	20	L	R	28.4		0	740000	17	0.272182	0.170563	20017	Bench
24394	Alexander Canario	RF/CF/LF	4	R	R	23.9		0	740000	17	-0.0588116	0.0413295	22842	Bench
24395	Justin Steele	SP	35	L	L	28.7		0	4000000.0	17	4.8721	3.16214	17312	SP1
24396	Shota Imanaga	SP	18	L	L	30.6		0	740000	17	\N	3.35783	\N	SP2
24397	Kyle Hendricks	SP	28	R	R	34.3		0	16000000.0	17	2.75693	1.59529	12049	SP3
24398	Jordan Wicks	SP	36	L	L	24.6		0	740000	17	0.279402	1.20993	30094	SP4
24399	Javier Assad	SP/RP	72	R	R	26.6		0	740000	17	0.915767	0.548494	21741	SP5
24400	Adbert Alzolay	RP	73	R	R	29.1		0	2110000.0	17	1.50633	0.933104	17859	CL
24401	Héctor Neris	RP	51	R	R	34.8		0	9000000.0	17	0.842547	0.652856	11804	SU8
24402	Julian Merryweather	RP	66	R	R	32.4		0	1175000.0	17	0.887263	0.748238	16703	SU7
24403	Mark Leiter Jr.	RP	38	R	R	33.0		0	1500000.0	17	0.635761	0.231203	15551	MID
24404	Drew Smyly	RP/SP	11	L	L	34.8		0	9500000.0	17	0.949364	0.319404	11760	MID
24405	Jose Cuas	RP	74	R	R	29.7		0	740000	17	-0.0402486	0.0489783	17701	MID
24406	Yency Almonte	RP	25	S	R	29.8		0	1900000.0	17	0.105339	0.0690697	15068	MID
24407	Hayden Wesneski	SP/RP	19	R	R	26.3		0	740000	17	-0.309712	0.337486	27581	LR
24408	Nick Madrigal	2B/3B	1	R	R	27.0	Strained hamstring	0	1810000.0	17	0.930016	0.833407	20521	Inj
24409	Patrick Wisdom	3B/1B/LF	16	R	R	32.6	Back discomfort	0	2725000.0	17	0.742995	0.744904	13602	Inj
24410	Caleb Kilian	SP	45	R	R	26.8	Strained shoulder	0	740000	17	0.0120158	0.0102879	26213	Inj
24411	Jameson Taillon	SP	50	R	R	32.3	Lower back tightness	0	17000000.0	17	1.58908	1.64365	11674	Inj
24412	Jonathan India	2B/3B	6	R	R	27.3		0	4400000.0	18	1.22385	1.43257	21523	1
24413	Elly De La Cruz	SS/3B	44	S	R	22.2		0	740000	18	1.70512	2.05211	26668	2
24414	Spencer Steer	1B/3B/LF	7	R	R	26.3		0	740000	18	2.12483	1.82456	26323	3
24415	Jake Fraley	RF/LF	27	L	L	28.8		0	2150000.0	18	1.36435	1.22156	19260	4
24416	Jeimer Candelario	3B/1B	3	S	R	30.3		0	15000000.0	18	3.29519	1.86256	13621	5
24417	Will Benson	RF/LF/CF	30	L	L	25.8		0	740000	18	1.66632	1.27941	21853	6
24418	Christian Encarnacion-Strand	1B/3B	33	R	R	24.3		0	740000	18	0.502905	1.56662	30011	7
24419	Nick Martini	RF/LF/1B	23	L	L	33.7		0	740000	18	0.383853	0.0540737	12005	8
24420	Tyler Stephenson	C	37	R	R	27.6		0	2525000.0	18	-0.716318	0.98103	17988	9
24421	Luke Maile	C	22	R	R	33.1		0	3500000.0	18	0.225897	0.631737	13355	Bench
24422	Santiago Espinal	2B/3B/SS	4	R	R	29.4		0	2725000.0	18	0.121748	0.562665	19997	Bench
24423	Stuart Fairchild	LF/RF/CF	17	R	R	28.0		0	740000	18	0.804881	0.386217	20321	Bench
24424	Bubba Thompson	CF/LF/RF	66	R	R	25.8		0	740000	18	-0.167777	0.0153778	22261	Bench
24425	Frankie Montas	SP	47	R	R	31.0		0	16000000.0	18	0.00533974	2.06071	14309	SP1
24426	Hunter Greene	SP	21	R	R	24.6		0	8833333.33333333	18	1.95078	2.55142	22182	SP2
24427	Graham Ashcraft	SP	51	L	R	26.1		0	740000	18	1.47852	2.18733	27552	SP3
24428	Nick Martinez	SP/RP	28	L	R	33.6		0	13000000.0	18	1.3516	1.83014	12730	SP4
24429	Andrew Abbott	SP	41	L	L	24.8		0	740000	18	2.15651	1.73668	29911	SP5
24430	Alexis Díaz	RP	43	R	R	27.5		0	740000	18	1.71998	0.786065	21132	CL
24431	Emilio Pagán	RP	15	L	R	32.9		0	8000000.0	18	1.1482	0.517554	14771	SU8
24432	Lucas Sims	RP	39	R	R	29.9		0	2850000.0	18	0.765489	0.201254	13470	SU7
24433	Fernando Cruz	RP	63	R	R	34.0		0	740000	18	1.61811	0.388612	7048	MID
24434	Brent Suter	RP	31	R	L	34.6		0	3000000.0	18	1.32928	0.171525	13942	MID
24435	Buck Farmer	RP	46	L	R	33.1		0	2250000.0	18	0.582725	0.133159	14814	MID
24436	Justin Wilson	RP	32	L	L	36.6		0	1500000.0	18	\N	0.0614938	4301	MID
24437	Tejay Antone	RP	70	R	R	30.3		0	830000.0	18	0.193492	0.0126163	16233	LR
24438	Matt McLain	SS/2B	9	R	R	24.6	Shoulder discomfort	0	740000	18	3.23787	2.27217	29695	Inj
24439	TJ Friedl	CF/LF/RF	29	L	L	28.6	Non-displaced wrist fracture	0	740000	18	4.45293	1.62088	19522	Inj
24440	Nick Lodolo	SP	40	L	L	26.1	Stress reaction in leg	0	740000	18	0.0374547	2.10965	26378	Inj
24441	Brandon Williamson	SP	55	L	L	26.0	Shoulder soreness	0	740000	18	1.78493	0.564423	25463	Inj
24442	Ian Gibaut	RP	79	R	R	30.3	Strained forearm	0	740000	18	0.901424	0.0987549	17871	Inj
24443	Sam Moll	RP	50	L	L	32.2	Shoulder soreness	0	740000	18	1.16409	0.0601924	14874	Inj
24444	Alex Young	RP	48	L	L	30.5	Back tightness	0	1160000.0	18	0.09999	0.041766	18333	Inj
24445	Charlie Blackmon	RF/LF	19	L	L	37.7		0	13000000.0	19	0.835415	0.070458	7859	1
24446	Kris Bryant	LF/RF/1B	23	R	R	32.2		0	26000000.0	19	-1.20493	0.731869	15429	2
24447	Nolan Jones	RF/LF	22	L	R	25.9		0	740000	19	3.68937	2.7233	20529	3
24448	Brendan Rodgers	2B	7	R	R	27.6		0	3200000.0	19	-0.0424134	1.66343	17907	4
24449	Ryan McMahon	3B	24	L	R	29.3		0	11666666.66666667	19	1.188	1.79597	15112	5
24450	Elias Díaz	C	35	R	R	33.3		0	4833333.33333333	19	0.0142864	-0.454346	11680	6
24451	Ezequiel Tovar	SS	14	R	R	22.6		0	740000	19	1.60627	1.61319	24064	7
24452	Sean Bouchard	RF/LF/1B	12	R	R	27.9		0	740000	19	0.445671	0.746686	21270	8
24453	Brenton Doyle	CF/RF/LF	9	R	R	25.9		0	740000	19	0.861638	0.516651	25479	9
24454	Jacob Stallings	C	25	R	R	34.3		0	2000000.0	19	-0.777261	0.408093	13723	Bench
24455	Elehuris Montero	1B/3B	44	R	R	25.6		0	740000	19	-0.855593	0.101685	20543	Bench
24456	Kyle Freeland	SP	21	L	L	30.9		0	12900000.0	19	1.19596	1.17432	16256	SP1
24457	Cal Quantrill	SP	47	L	R	28.5		0	6550000.0	19	0.719647	1.10739	19312	SP2
24458	Austin Gomber	SP	26	L	L	30.3		0	3150000.0	19	0.943832	1.27836	16561	SP3
24459	Ryan Feltner	SP	18	R	R	27.6		0	740000	19	0.912654	1.32325	21446	SP4
24460	Dakota Hudson	SP/RP	32	R	R	29.5		0	1500000.0	19	0.303916	0.848556	19206	SP5
24461	Justin Lawrence	RP	61	R	R	29.3		0	740000	19	1.19926	0.618616	17639	CL
24462	Tyler Kinley	RP	40	R	R	33.1		0	2083333.33333333	19	0.0751949	0.417094	18297	CL
24463	Jake Bird	RP	59	R	R	28.3		0	740000	19	1.4752	0.335116	21267	SU7
24464	Nick Mears	RP	46	R	R	27.5		0	740000	19	0.158934	0.0549122	25376	MID
24465	Jalen Beeks	RP	69	L	L	30.7		0	1675000.0	19	0.453274	0.156846	17192	MID
24466	Anthony Molina	SP	43	R	R	22.2		0	740000	19	\N	-0.0053902	\N	MID
24467	Germán Márquez	SP	48	R	R	29.1	Tommy John surgery	0	10000000.0	19	0.242508	0.393887	15038	Inj
24468	Daniel Bard	RP	52	R	R	38.7	Arthroscopic knee surgery	0	9500000.0	19	-0.505631	-0.13262	7115	Inj
24469	Lucas Gilbreath	RP	58	L	L	28.0	Tommy John surgery	0	760000.0	19	\N	0.00138197	21290	Inj
24470	Luis Arraez	2B/1B	3	L	R	27.0		0	10600000.0	20	3.42559	2.48637	18568	1
24471	Josh Bell	1B	9	S	R	31.6		0	16500000.0	20	0.371232	1.25636	13145	2
24472	Jake Burger	3B/1B	36	R	R	27.9		0	740000	20	2.53179	2.21952	22275	3
24473	Jazz Chisholm Jr.	CF/2B	2	L	R	26.1		0	2625000.0	20	1.85929	2.6959	20454	4
24474	Tim Anderson	SS/2B	7	R	R	30.7		0	5000000.0	20	-0.49406	1.35123	15172	5
24475	Jesús Sánchez	RF/LF/CF	12	L	R	26.5		0	2100000.0	20	1.34401	1.28066	19913	6
24476	Avisaíl García	RF/LF	24	R	R	32.8		0	13250000.0	20	-0.338264	-0.226928	5760	7
24477	Bryan De La Cruz	LF/RF/CF	14	R	R	27.3		0	740000	20	0.154827	1.08354	19600	8
24478	Christian Bethancourt	C/1B	25	R	R	32.6		0	2050000.0	20	0.599297	1.21563	10028	9
24479	Nick Fortes	C	4	R	R	27.4		0	740000	20	0.189849	1.28381	21538	Bench
24480	Jon Berti	SS/3B/LF	5	R	R	34.2		0	3625000.0	20	2.07518	1.01495	12037	Bench
24481	Vidal Bruján	2B/SS/RF	17	S	R	26.1		0	740000	20	-0.602558	0.324957	20536	Bench
24482	Nick Gordon	CF/LF/2B	1	L	R	28.4		0	900000.0	20	-0.422621	0.243875	16337	Bench
24483	Jesús Luzardo	SP	44	L	L	26.5		0	5500000.0	20	3.70814	3.2031	19959	SP1
24484	A.J. Puk	RP	35	L	L	28.9		0	1800000.0	20	0.873649	1.62458	19343	SP2
24485	Ryan Weathers	SP/RP	60	R	L	24.4		0	740000	20	-0.24454	0.380636	23796	SP3
24486	Trevor Rogers	SP	28	L	L	26.4		0	1530000.0	20	0.260208	1.79947	22286	SP4
24487	Max Meyer	SP	23	L	R	25.0		0	740000	20	\N	1.16847	27474	SP5
24488	Tanner Scott	RP	66	R	L	29.7		0	5700000.0	20	2.79182	1.33553	17586	CL
24489	Andrew Nardi	RP	33	L	L	25.6		0	740000	20	0.836481	0.739112	25942	SU8
24490	Anthony Bender	RP	37	R	R	29.1		0	770000.0	20	\N	0.385038	19742	SU7
24491	George Soriano	RP	62	R	R	25.0		0	740000	20	0.139862	-0.072109	21863	MID
24492	Sixto Sánchez	SP	45	R	R	25.7		0	740000	20	\N	0.265375	19680	MID
24493	Anthony Maldonado	RP	52	R	R	26.1		0	740000	20	\N	0.144975	\N	MID
24494	Declan Cronin	RP	51	R	R	26.5		0	740000	20	-0.303855	-0.0740564	25645	MID
24495	Bryan Hoeing	SP/RP	78	R	R	27.4		0	740000	20	-0.374361	0.0845287	26304	LR
24496	Edward Cabrera	SP	27	R	R	25.9	Shoulder impingement	0	740000	20	1.03929	1.35918	21690	Inj
24497	Braxton Garrett	SP	29	R	L	26.6	Shoulder soreness	0	740000	20	2.93034	1.98245	21844	Inj
24498	Eury Pérez	SP	39	R	R	20.9	Elbow inflammation	0	740000	20	1.42987	1.90495	27768	Inj
24499	JT Chargois	RP	84	S	R	33.3	Neck discomfort	0	1285000.0	20	0.378604	-0.0274178	13767	Inj
24500	Josh Simpson	RP	65	L	L	26.6	Elbow nerve irritation	0	740000	20	\N	0.0157525	\N	Inj
24501	Jose Altuve	2B	27	R	R	33.9		0	23357142.85714286	21	4.02498	3.85519	5417	1
24502	Yordan Alvarez	LF/1B	44	L	L	26.7		0	19166666.66666667	21	4.50001	5.58631	19556	2
24503	Kyle Tucker	RF/LF/CF	30	L	R	27.2		0	12000000.0	21	4.92635	4.9469	18345	3
24504	Alex Bregman	3B	2	R	R	30.0		0	20000000.0	21	4.34461	4.66342	17678	4
24505	José Abreu	1B	79	R	R	37.1		0	19500000.0	21	-0.641924	1.23703	15676	5
24506	Yainer Diaz	C/1B	21	R	R	25.5		0	740000	21	2.0293	2.1144	23003	6
24507	Chas McCormick	CF/LF/RF	20	R	L	28.9		0	2850000.0	21	3.83344	2.41327	19599	7
24508	Jeremy Peña	SS	3	R	R	26.5		0	740000	21	2.78879	2.55259	21636	8
24509	Jake Meyers	CF/LF/RF	6	R	L	27.8		0	740000	21	1.6805	1.45465	20308	9
24510	Victor Caratini	C/1B	17	S	R	30.6		0	6000000.0	21	1.1217	1.17008	14968	Bench
24511	Jon Singleton	1B	28	L	L	32.5		0	740000	21	-0.50678	0.16268	10441	Bench
24512	Mauricio Dubón	2B/CF/LF	14	R	R	29.7		0	3500000.0	21	1.85743	0.594693	16530	Bench
24513	Corey Julks	LF/RF/CF	9	R	R	28.1		0	740000	21	0.247679	0.0416252	20311	Bench
24514	Framber Valdez	SP	59	L	L	30.3		0	12100000.0	21	4.34135	3.7147	17295	SP1
24515	Cristian Javier	SP	53	R	R	27.0		0	12800000.0	21	1.92274	1.64923	17606	SP2
24516	Hunter Brown	SP	58	R	R	25.6		0	740000	21	1.77184	2.00968	25880	SP3
24517	Ronel Blanco	SP/RP	56	R	R	30.6		0	740000	21	-0.38248	0.393312	19407	SP4
24518	J.P. France	SP	68	R	R	29.0		0	740000	21	1.25907	0.542964	21212	SP5
24519	Josh Hader	RP	71	L	L	30.0		0	19000000.0	21	1.71502	1.24163	14212	CL
24520	Ryan Pressly	RP	55	R	R	35.3		0	15000000.0	21	1.06421	1.04483	7005	SU8
24521	Bryan Abreu	RP	52	R	R	26.6		0	1750000.0	21	1.48591	0.937254	16609	SU7
24522	Rafael Montero	RP	47	R	R	33.4		0	11500000.0	21	0.10599	0.223115	12760	MID
24523	Bennett Sousa	RP	62	L	L	29.0		0	740000	21	0.129061	0.195291	21345	MID
24524	Seth Martinez	RP	61	R	R	29.6		0	740000	21	0.110119	0.0746075	21045	MID
24525	Parker Mushinski	RP	67	L	L	28.3		0	740000	21	-0.356274	0.0251737	21324	MID
24526	Brandon Bielak	SP/RP	64	L	R	28.0		0	740000	21	0.108847	-0.0115411	19866	LR
24527	Grae Kessinger	SS/2B/3B	16	R	R	26.6	Strained hamstring	0	740000	21	0.240486	0.0296367	25813	Inj
24528	Shawn Dubin	SP/RP	66	R	R	28.5	Shoulder inflammation	0	740000	21	0.0971705	0.00127386	24977	Inj
24529	Luis Garcia	SP	77	R	R	27.3	Tommy John surgery	0	1875000.0	21	0.686535	0.269859	23735	Inj
24530	Lance McCullers Jr.	SP	43	L	R	30.5	Elbow surgery (flexor tendon/bone spur)	0	17000000.0	21	\N	1.02203	14120	Inj
24531	José Urquidy	SP	65	R	R	28.9	Strained forearm	0	3750000.0	21	0.176422	0.9202	18413	Inj
24532	Justin Verlander	SP	35	R	R	41.1	Shoulder soreness	0	40555555.33333333	21	3.30348	2.17643	8700	Inj
24533	Kendall Graveman	RP	31	R	R	33.3	Shoulder surgery	0	8000000.0	21	-0.106448	\N	15514	Inj
24534	Oliver Ortega	RP	63	R	R	27.5	Elbow surgery (loose bodies)	0	740000	21	-0.00999401	0.01698	21025	Inj
24535	Mookie Betts	RF/2B/SS	50	R	R	31.5		0	25554824.0	22	8.26848	6.0418	13611	1
24536	Shohei Ohtani	DH/SP	17	L	R	29.7		0	46078769.0	22	6.62437	3.89357	19755	2
24537	Freddie Freeman	1B	5	L	R	34.5		0	24700000.0	22	7.8965	4.4888	5361	3
24538	Will Smith	C	16	R	R	29.0		0	8550000.0	22	4.38775	4.09458	19197	4
24539	Max Muncy	3B/1B/2B	13	L	R	33.6		0	12000000.0	22	2.86379	2.1824	13301	5
24540	Teoscar Hernández	RF/LF	37	R	R	31.4		0	20433933.0	22	1.74512	1.90387	13066	6
24541	James Outman	CF/RF/LF	33	L	R	26.9		0	740000	22	4.38252	2.62533	24770	7
24542	Jason Heyward	RF/CF/LF	23	L	L	34.6		0	9000000.0	22	2.19645	1.1252	4940	8
24543	Gavin Lux	SS/2B	9	L	R	26.3		0	1225000.0	22	\N	1.7313	19955	9
24544	Austin Barnes	C	15	R	R	34.2		0	3500000.0	22	-0.782466	0.471293	12158	Bench
24545	Miguel Rojas	SS/2B/3B	11	R	R	35.1		0	5500000.0	22	0.568827	0.668595	7802	Bench
24546	Chris Taylor	LF/SS/3B	3	R	R	33.6		0	15000000.0	22	1.87087	1.02686	13757	Bench
24547	Enrique Hernández	SS/2B/CF	8	R	R	32.6		0	4000000.0	22	-1.26575	0.498588	10472	Bench
24548	Tyler Glasnow	SP	31	L	R	30.6		0	27312500.0	22	3.15045	3.23948	14374	SP1
24549	Yoshinobu Yamamoto	SP	18	R	R	25.6		0	27083333.33333333	22	\N	3.69778	33825	SP2
24550	Bobby Miller	SP	28	L	R	25.0		0	740000	22	2.82602	2.63838	27483	SP3
24551	Gavin Stone	SP	71	R	R	25.4		0	740000	22	-0.456207	0.752329	27792	SP4
24552	James Paxton	SP	65	L	L	35.4		0	7000000.0	22	1.03795	1.53665	11828	SP5
24553	Evan Phillips	RP	59	R	R	29.5		0	4000000.0	22	1.19979	0.893868	17734	CL
24554	Joe Kelly	RP	99	R	R	35.8		0	8000000.0	22	0.860614	0.631675	9761	SU8
24555	Ryan Brasier	RP	57	R	R	36.6		0	4500000.0	22	1.12994	0.516696	5615	SU7
24556	Alex Vesia	RP	51	L	L	27.9		0	1000000.0	22	0.694331	0.628273	25007	MID
24557	Daniel Hudson	RP	41	R	R	37.0		0	2000000.0	22	0.0489198	0.18793	7146	MID
24558	Kyle Hurt	SP/RP	63	R	R	25.8		0	740000	22	0.0521814	0.399594	27514	MID
24559	Ryan Yarbrough	SP/RP	56	R	L	32.2		0	3900000.0	22	0.833742	0.252974	16502	MID
24560	Michael Grove	SP	78	R	R	27.3		0	740000	22	0.765218	0.29828	23221	LR
24561	Walker Buehler	SP	21	R	R	29.7	Tommy John surgery	0	8025000.0	22	\N	2.33982	19374	15IL
24562	Emmet Sheehan	SP	80	R	R	24.4	Forearm inflammation	0	740000	22	0.463863	0.531333	29839	15IL
24563	Brusdar Graterol	RP	48	R	R	25.6	Shoulder inflammation	0	2700000.0	22	1.39116	0.117873	20367	15IL
24564	Blake Treinen	RP	49	R	R	35.7	Bruised lung	0	1000000.0	22	\N	0.127577	12572	15IL
24565	Nick Frasso	SP	79	R	R	25.4		0	740000	22	\N	\N	\N	Inj
24566	Garrett Mitchell	CF/RF/LF	5	L	R	25.5		0	740000	23	0.374764	1.27353	27555	1
24567	William Contreras	C	24	R	R	26.2		0	740000	23	5.36235	3.87797	20503	2
24568	Christian Yelich	LF/RF	22	L	R	32.3		0	23888888.88888889	23	4.11605	2.42056	11477	3
24569	Rhys Hoskins	1B	12	R	R	31.0		0	17000000.0	23	\N	1.81619	16472	4
24570	Willy Adames	SS	27	R	R	28.6		0	12250000.0	23	3.40673	3.67098	15986	5
24571	Sal Frelick	CF/RF/3B	10	L	R	23.9		0	740000	23	1.44677	1.91333	29622	6
24572	Gary Sánchez	C	99	R	R	31.3		0	3000000.0	23	1.72975	0.637105	11442	7
24573	Jackson Chourio	CF/RF	11	R	R	20.0		0	740000	23	\N	\N	\N	8
24574	Brice Turang	2B/SS	2	L	R	24.3		0	740000	23	0.178085	1.28404	22186	9
24575	Jake Bauers	1B/RF/LF	9	L	L	28.5		0	1350000.0	23	-0.51835	-0.00677017	15194	Bench
24576	Andruw Monasterio	3B/SS/2B	14	R	R	26.8		0	740000	23	0.379815	0.477688	19455	Bench
24577	Joey Ortiz	SS/2B/3B	3	R	R	25.7		0	740000	23	-0.0391702	1.03584	25493	Bench
24578	Blake Perkins	CF/RF/LF	16	S	R	27.5		0	740000	23	1.17182	0.230346	19921	Bench
24579	Freddy Peralta	SP	51	R	R	27.8		0	3100000.0	23	3.03412	3.08368	18679	SP1
24580	Colin Rea	SP/RP	48	R	R	33.7		0	4500000.0	23	0.779769	1.45198	12317	SP2
24581	Jakob Junis	SP/RP	35	R	R	31.5		0	7000000.0	23	0.717325	1.57817	13619	SP3
24582	Joe Ross	SP	41	R	R	30.8		0	1750000.0	23	\N	0.5216	12972	SP4
24583	DL Hall	SP/RP	37	L	L	25.5		0	740000	23	0.397455	1.81594	22207	SP5
24584	Trevor Megill	RP	29	L	R	30.3		0	740000	23	0.8367	1.42348	17722	CL
24585	Joel Payamps	RP	31	R	R	30.0		0	1650000.0	23	1.18585	0.565724	14332	CL
24586	Abner Uribe	RP	45	R	R	23.8		0	740000	23	0.587717	0.35796	25327	CL
24587	Hoby Milner	RP	55	L	L	33.2		0	2050000.0	23	1.01053	0.370476	13346	MID
24588	Elvis Peguero	RP	59	R	R	27.0		0	740000	23	0.589018	0.0954368	21652	MID
24589	Bryan Hudson	RP	78	L	L	26.9		0	740000	23	-0.00820204	0.0934315	19924	MID
24590	Thyago Vieira	RP	49	R	R	30.7		0	740000	23	0.0588644	0.0345756	14510	MID
24591	Bryse Wilson	RP	46	R	R	26.3		0	1000025.0	23	0.332375	-0.016439	19990	LR
24592	Wade Miley	SP	20	L	L	37.4	Shoulder soreness	0	8500000.0	23	1.05902	1.15706	8779	Inj
24593	Taylor Clarke	RP	32	R	R	30.9	Knee discomfort	0	1250000.0	23	-0.237326	0.137825	17611	Inj
24594	Devin Williams	RP	38	R	R	29.5	Stress fractures in back	0	7250000.0	23	1.8204	0.135878	15816	Inj
24595	CJ Abrams	SS/2B	5	L	R	23.5		0	740000	24	2.13761	2.52843	25768	1
24596	Lane Thomas	RF/CF/LF	28	R	R	28.6		0	5450000.0	24	2.81593	1.42891	16939	2
24597	Joey Meneses	1B/RF	45	R	R	31.9		0	740000	24	-0.233581	0.620498	14366	4
24598	Joey Gallo	1B/LF/RF	24	L	R	30.3		0	5000000.0	24	0.713682	0.805386	14128	5
24599	Keibert Ruiz	C	20	S	R	25.7		0	6250000.0	24	-0.0468599	1.44065	19610	6
24600	Nick Senzel	3B/LF/CF	13	R	R	28.7		0	2000000.0	24	-0.364609	-0.166035	19293	7
24601	Luis García Jr.	2B/SS	2	L	R	23.9		0	1950000.0	24	0.139959	1.25542	20391	8
24602	Victor Robles	CF	16	R	R	26.8		0	2650000.0	24	0.424465	1.08568	18363	9
24603	Riley Adams	C	15	R	R	27.7		0	740000	24	0.358424	-0.0439542	19864	Bench
24604	Ildemaro Vargas	3B/2B/LF	14	S	R	32.7		0	1100000.0	24	0.126497	0.554765	13324	Bench
24605	Josiah Gray	SP	40	R	R	26.3		0	740000	24	1.63949	1.39118	24580	SP1
24606	Patrick Corbin	SP	46	L	L	34.7		0	23333333.33333333	24	0.916657	1.03806	9323	SP2
24607	Jake Irvin	SP	27	R	R	27.1		0	740000	24	0.767782	1.00739	21504	SP3
24608	MacKenzie Gore	SP	1	L	L	25.1		0	740000	24	1.25483	2.21944	22201	SP4
24609	Trevor Williams	SP	32	R	R	31.9		0	6500000.0	24	-0.0832976	0.528683	16977	SP5
24610	Kyle Finnegan	RP	67	R	R	32.6		0	5100000.0	24	0.31702	0.70823	15009	CL
24611	Hunter Harvey	RP	73	R	R	29.3		0	2325000.0	24	1.33269	1.05947	15507	CL
24612	Tanner Rainey	RP	21	R	R	31.2		0	1500000.0	24	0.0156647	0.315783	17610	SU7
24613	Jordan Weems	RP	51	L	R	31.4		0	740000	24	0.00907648	0.157349	13190	MID
24614	Robert Garcia	RP	61	R	L	27.8		0	740000	24	0.562611	0.210632	23363	MID
24615	Dylan Floro	RP	44	L	R	33.2		0	2250000.0	24	1.14385	0.128907	13394	MID
24616	Stone Garrett	LF/RF	36	R	R	28.3	Fractured leg	0	740000	24	1.22065	0.00859131	19273	Inj
24617	Stephen Strasburg	SP	37	R	R	35.7	Thoracic outlet syndrome surgery	0	35000000.0	24	\N	\N	10131	Inj
24618	Cade Cavalli	SP	9	R	R	25.6	Tommy John surgery	0	740000	24	\N	0.504058	27473	Inj
24619	Jose A. Ferrer	RP	47	L	L	24.1	Strained upper back	0	740000	24	0.0803503	0.0187964	24017	Inj
24620	Mason Thompson	RP	71	R	R	26.1	Tommy John surgery	0	740000	24	0.47865	\N	21850	Inj
24621	Zach Brzykcy	RP	66	R	R	24.7		0	740000	24	\N	0.00929496	\N	Inj
24622	Brandon Nimmo	CF/LF/RF	9	L	R	31.0		0	20250000.0	25	4.35078	3.53096	12927	1
24623	Francisco Lindor	SS	12	S	R	30.4		0	31900000.0	25	6.019	4.71414	12916	2
24624	Pete Alonso	1B	20	R	R	29.3		0	20500000.0	25	2.79337	3.16172	19251	3
24625	J.D. Martinez	LF/RF	28	R	R	36.6		0	8966565.0	25	2.15658	0.69127	6184	4
24626	Jeff McNeil	2B/RF/LF	1	L	R	32.0		0	12500000.0	25	2.58455	2.71393	15362	5
24627	Starling Marte	RF/CF	6	R	R	35.5		0	19500000.0	25	-0.31919	1.50239	9241	6
24628	Francisco Alvarez	C	4	R	R	22.3		0	740000	25	2.69816	3.38257	26121	7
24629	Brett Baty	3B	22	L	R	24.4		0	740000	25	-0.517238	1.59647	26123	8
24630	Harrison Bader	CF	44	R	R	29.8		0	10500000.0	25	1.02806	2.1477	18030	9
24631	Omar Narváez	C	2	L	R	32.1		0	7500000.0	25	-0.0273016	0.916786	13338	Bench
24632	Mark Vientos	3B/1B	27	R	R	24.3		0	740000	25	-0.914019	0.755728	22184	Bench
24633	Joey Wendle	SS/2B/3B	13	L	R	33.9		0	2000000.0	25	-0.818406	0.092653	13853	Bench
24634	Tyrone Taylor	RF/LF/CF	15	R	R	30.2		0	2025000.0	25	0.843763	1.02292	13675	Bench
24635	Jose Quintana	SP	62	R	L	35.2		0	13000000.0	25	1.4989	1.66569	11423	SP1
24636	Luis Severino	SP	40	R	R	30.1		0	13000000.0	25	-0.607931	1.58753	15890	SP2
24637	Tylor Megill	SP/RP	38	R	R	28.7		0	740000	25	0.556627	0.516162	21318	SP3
24638	Sean Manaea	SP/RP	59	L	L	32.1		0	14000000.0	25	1.11648	2.14911	15873	SP4
24639	Adrian Houser	SP	35	R	R	31.1		0	5050000.0	25	1.75065	0.992125	12718	SP5
24640	Edwin Díaz	RP	39	R	R	30.0		0	18600000.0	25	\N	2.17507	14710	CL
24641	Adam Ottavino	RP	0	R	R	38.3		0	4500000.0	25	-0.0998331	0.224958	1247	SU8
24642	Brooks Raley	RP	25	L	L	35.7		0	6500000.0	25	0.647208	0.420706	10061	SU7
24643	Drew Smith	RP	33	R	R	30.5		0	2250000.0	25	0.13016	0.0779731	17755	MID
24644	Jake Diekman	RP	30	L	L	37.2		0	4000000.0	25	0.420163	-0.0326294	5003	MID
24645	Jorge López	RP	52	R	R	31.1		0	2000000.0	25	-0.960881	0.0697778	14527	MID
24646	Sean Reid-Foley	RP	71	R	R	28.6		0	740000	25	0.246504	0.0204143	17034	MID
24647	Michael Tonkin	RP	51	R	R	34.3		0	1000000.0	25	0.0842206	0.0745343	10315	LR
24648	Max Kranick	SP	32	R	R	26.7	Strained hamstring	0	740000	25	\N	-0.00902631	22175	Inj
24649	Kodai Senga	SP	34	L	R	31.1	Strained shoulder	0	15000000.0	25	3.38437	2.32666	31838	Inj
24650	Kyle Schwarber	LF/1B	12	L	R	31.0		0	19750000.0	26	1.43594	2.25622	16478	1
24651	Trea Turner	SS/2B	7	R	R	30.7		0	27272727.27272727	26	3.8059	4.54877	16252	2
24652	Bryce Harper	RF/1B	3	L	R	31.4		0	25384615.38461538	26	3.30524	4.10807	11579	3
24653	J.T. Realmuto	C	10	R	R	33.0		0	23100000.0	26	1.47158	2.79239	11739	4
24654	Bryson Stott	2B/SS	5	L	R	26.5		0	740000	26	3.90511	2.52635	26294	5
24655	Alec Bohm	3B	28	R	R	27.6		0	4000000.0	26	1.08516	1.84648	21618	6
24656	Nick Castellanos	RF/LF	8	R	R	32.1		0	20000000.0	26	0.961934	0.525713	11737	7
24657	Brandon Marsh	CF/RF/LF	16	L	R	26.3		0	740000	26	3.36741	1.65407	20202	8
24658	Johan Rojas	CF	18	R	R	23.6		0	740000	26	1.37603	0.749259	24336	9
24659	Garrett Stubbs	C	21	L	R	30.8		0	850000.0	26	-0.301761	0.0858337	18067	Bench
24660	Edmundo Sosa	3B/SS/2B	33	R	R	28.0		0	1700000.0	26	0.892142	0.455484	17022	Bench
24661	Whit Merrifield	2B/LF/3B	9	R	R	35.2		0	8000000.0	26	1.5269	0.211558	11281	Bench
24662	Cristian Pache	CF/RF/LF	19	R	R	25.3		0	740000	26	0.479624	0.166205	19948	Bench
24663	Zack Wheeler	SP	45	L	R	33.8		0	23600000.0	26	5.9443	4.95197	10310	SP1
24664	Aaron Nola	SP	27	R	R	30.8		0	24571429.0	26	3.88015	4.81238	16149	SP2
24665	Ranger Suárez	SP	55	L	L	28.6		0	5050000.0	26	2.41628	2.34421	17277	SP3
24666	Taijuan Walker	SP	99	R	R	31.6		0	18000000.0	26	2.46824	1.83674	11836	SP4
24667	Cristopher Sánchez	SP/RP	61	L	L	27.3		0	740000	26	1.8205	1.68258	20778	SP5
24668	José Alvarado	RP	46	L	L	28.8		0	7333333.33333333	26	1.32135	1.66704	17780	CL
24669	Jeff Hoffman	RP	23	R	R	31.2		0	2200000.0	26	1.53094	0.830139	17432	SU8
24670	Gregory Soto	RP	30	L	L	29.1		0	5000000.0	26	0.928388	0.552607	19677	SU7
24671	Seranthony Domínguez	RP	58	R	R	29.3		0	3625000.0	26	0.0688293	0.52082	19249	MID
24672	Matt Strahm	RP	25	L	L	32.4		0	7500000.0	26	1.9958	0.578273	13799	MID
24673	Luis F. Ortiz	RP	56	R	R	28.5		0	740000	26	0.202901	0.0722581	16942	MID
24674	Connor Brogdon	RP	75	R	R	29.1		0	740000	26	-0.100705	0.0468434	21205	MID
24675	Spencer Turnbull	SP/RP	22	R	R	31.5		0	2000000.0	26	-0.0441913	0.417834	16207	LR
24676	Dylan Covey	SP/RP	54	R	R	32.6	Shoulder tightness	0	850000.0	26	0.0391138	-0.00759642	14825	Inj
24677	Orion Kerkering	RP	50	R	R	23.0	Flu	0	740000	26	0.107711	0.421525	31776	Inj
24678	Michael Rucker	RP	39	R	R	29.9	Finger numbness	0	740000	26	-0.0624575	0.00129169	19454	Inj
24679	Oneil Cruz	SS	15	L	R	25.5		0	740000	27	0.311387	2.75111	21711	1
24680	Bryan Reynolds	LF/CF	10	S	R	29.2		0	13343750.0	27	2.27593	2.70348	19326	2
24681	Ke'Bryan Hayes	3B	13	R	R	27.1		0	8750000.0	27	3.25135	2.71284	18577	3
24682	Jack Suwinski	CF/RF/LF	65	L	L	25.7		0	740000	27	2.72149	1.9008	22244	4
24683	Andrew McCutchen	LF/RF	22	R	R	37.5		0	5000000.0	27	1.2492	0.335724	9847	5
24684	Rowdy Tellez	1B	44	L	L	29.0		0	3200000.0	27	-0.917703	0.558882	15679	6
24685	Henry Davis	C/RF	32	R	R	24.5		0	740000	27	-0.965261	1.64304	29617	7
24686	Michael A. Taylor	CF	\N	R	R	33.0		0	4000000.0	27	1.67832	0.959372	11489	8
24687	Jared Triolo	3B/2B/1B	19	R	R	26.1		0	740000	27	1.74733	1.08539	25807	9
24688	Jason Delay	C	55	R	R	29.0		0	740000	27	1.08128	0.15164	19806	Bench
24689	Connor Joe	RF/1B/LF	2	R	R	31.6		0	2125000.0	27	1.89294	0.797501	16572	Bench
24690	Alika Williams	SS/2B	75	R	R	25.0		0	740000	27	-0.339668	0.0893269	27604	Bench
24691	Edward Olivares	LF/RF/CF	38	R	R	28.0		0	1350000.0	27	0.41521	0.541379	19698	Bench
24692	Mitch Keller	SP	23	R	R	28.0		0	15400000.0	27	3.25453	2.91197	17594	SP1
24693	Martín Pérez	SP	54	L	L	33.0		0	8000000.0	27	0.456777	1.62686	6902	SP2
24694	Marco Gonzales	SP	27	L	L	32.1		0	12250000.0	27	0.60707	0.856665	15467	SP3
24695	Luis L. Ortiz	SP	48	R	R	25.2		0	740000	27	-0.343052	0.633404	27646	SP4
24696	David Bednar	RP	51	L	R	29.5		0	4510000.0	27	2.32957	1.47649	19569	CL
24697	Aroldis Chapman	RP	45	L	L	36.1		0	10500000.0	27	1.76578	0.78822	10233	SU8
24698	Colin Holderman	RP	35	R	R	28.5		0	740000	27	0.911215	0.495088	22361	SU7
24699	Carmen Mlodzinski	RP	50	R	R	25.1		0	740000	27	0.247078	0.191538	27572	MID
24700	Ryan Borucki	RP	43	L	L	30.0		0	1600000.0	27	0.630575	0.350529	16350	MID
24701	Josh Fleming	SP/RP	28	R	L	27.8		0	850000.0	27	-0.54778	0.0168139	20418	MID
24702	Roansy Contreras	SP	59	R	R	24.4		0	740000	27	0.073945	0.222674	22810	MID
24703	Bailey Falter	SP/RP	26	R	L	26.9		0	740000	27	0.383008	0.337569	20070	LR
24704	Yasmani Grandal	C	6	S	R	35.4	Plantar fascitis	0	2500000.0	27	-0.0535178	0.875808	11368	Inj
24705	Ji Hwan Bae	2B/CF/SS	3	L	R	24.7	Hip discomfort	0	740000	27	-0.274908	0.325256	23818	Inj
24706	Mike Burrows	SP	53	R	R	24.4		0	740000	27	\N	\N	\N	Inj
24707	Brendan Donovan	2B/1B/LF	33	L	R	27.2		0	740000	28	2.07268	1.74777	24679	1
24708	Paul Goldschmidt	1B	46	R	R	36.5		0	26000000.0	28	3.65777	3.08578	9218	2
24709	Nolan Gorman	2B/3B	16	L	R	23.9		0	740000	28	2.52568	2.37765	22263	3
24710	Nolan Arenado	3B	28	R	R	32.9		0	30555555.55555556	28	2.63283	3.71884	9777	4
24711	Willson Contreras	C	40	R	R	31.9		0	17500000.0	28	2.43113	2.40673	11609	5
24712	Alec Burleson	LF/1B/RF	41	L	L	25.3		0	740000	28	-0.9056	0.3433	27615	6
24713	Jordan Walker	RF/LF/CF	18	R	R	21.8		0	740000	28	0.202016	1.78328	27475	7
24714	Dylan Carlson	CF/RF/LF	3	S	L	25.4		0	2350000.0	28	0.158802	1.38277	20126	8
24715	Masyn Winn	SS	0	R	R	22.0		0	740000	28	-0.760309	1.76194	27479	9
24716	Iván Herrera	C	48	R	R	23.8		0	740000	28	0.520306	1.00479	20599	Bench
24717	Matt Carpenter	1B	13	L	R	38.3		0	740000.0	28	-0.309614	0.101468	8090	Bench
24718	Brandon Crawford	SS	35	L	R	37.2		0	2000000.0	28	0.434746	0.55065	5343	Bench
24719	Michael Siani	CF/LF/RF	63	L	L	24.7		0	740000	28	-0.104007	-0.00314917	22557	Bench
24720	Miles Mikolas	SP	39	R	R	35.6		0	18583333.33333333	28	3.06549	1.91934	9803	SP1
24721	Zack Thompson	SP/RP	57	L	L	26.4		0	740000	28	1.07058	0.377947	25918	SP2
24722	Lance Lynn	SP	31	R	R	36.9		0	11000000.0	28	0.505303	2.07675	2520	SP3
24723	Steven Matz	SP	32	R	L	32.8		0	11000000.0	28	1.97936	2.00263	13361	SP4
24724	Kyle Gibson	SP	44	R	R	36.4		0	13000000.0	28	2.55691	1.95367	10123	SP5
24725	Ryan Helsley	RP	56	R	R	29.7		0	3800000.0	28	1.49363	1.18121	18138	CL
24726	Giovanny Gallegos	RP	65	R	R	32.6		0	5500000.0	28	0.303713	0.810933	14986	SU8
24727	Andrew Kittredge	RP	27	R	R	34.0		0	2262500.0	28	0.142491	0.310224	12828	SU7
24728	JoJo Romero	RP	59	L	L	27.5		0	860000.0	28	1.20529	0.69654	19574	MID
24729	Andre Pallante	RP	53	R	R	25.5		0	740000	28	-0.0816329	0.119005	26108	MID
24730	Riley O'Brien	RP	55	R	R	29.1		0	740000	28	\N	0.00484679	20348	MID
24731	Ryan Fernandez	RP	64	R	R	25.8		0	740000	28	\N	0.0339778	\N	MID
24732	Matthew Liberatore	SP/RP	52	L	L	24.4		0	740000	28	0.791159	0.398857	22294	LR
24733	Tommy Edman	2B/SS/RF	19	S	R	28.9	Arthroscopic wrist surgery	0	8250000.0	28	2.25353	1.87627	19470	Inj
24734	Lars Nootbaar	CF/RF/LF	21	L	R	26.5	Non-displaced rib fractures	0	740000	28	3.19501	2.21006	21454	Inj
24735	Sonny Gray	SP	54	R	R	34.4	Strained hamstring	0	24949117.0	28	5.28453	2.86644	12768	Inj
24736	Drew Rom	SP	38	L	L	24.3	Strained forearm	0	740000	28	-0.0681731	0.0372552	24602	Inj
24737	Keynan Middleton	RP	93	R	R	30.5	Strained forearm	0	6000000.0	28	0.135236	0.0813986	15264	Inj
24738	Xander Bogaerts	2B/SS	2	R	R	31.5		0	25454545.45454545	29	4.41758	3.69217	12161	1
24739	Fernando Tatis Jr.	RF/CF/SS	23	R	R	25.2		0	24285714.0	29	4.37571	5.70557	19709	2
24740	Jake Cronenworth	2B/1B	9	L	R	30.2		0	11428571.42857143	29	1.04959	1.99829	18036	3
24741	Manny Machado	3B	13	R	R	31.7		0	31818181.81818182	29	3.47426	4.12647	11493	4
24742	Ha-Seong Kim	SS/2B/3B	7	R	R	28.4		0	7000000.0	29	4.36784	3.31468	27506	5
24743	Jurickson Profar	LF/RF/1B	10	S	R	31.1		0	1000000.0	29	-1.96303	0.366513	10815	6
24744	Luis Campusano	C	12	R	R	25.5		0	740000	29	1.08032	1.6486	22217	7
24745	Tyler Wade	SS/2B/CF	14	L	R	29.3		0	740000	29	0.136908	-0.00913175	15730	8
24746	Jackson Merrill	SS/LF/CF	3	L	R	20.9		0	740000	29	\N	0.865376	29490	9
24747	Kyle Higashioka	C	20	R	R	33.9		0	2180000.0	29	1.69097	1.21266	5517	Bench
24748	Graham Pauley	3B/2B/LF	22	L	R	23.5		0	740000	29	\N	0.351514	31363	Bench
24749	Eguy Rosario	3B/2B/SS	5	R	R	24.6		0	740000	29	0.152887	0.288633	19964	Bench
24750	José Azocar	CF/RF/LF	28	R	R	27.9		0	740000	29	0.134962	0.0969448	18821	Bench
24751	Yu Darvish	SP	11	R	R	37.6		0	18000000.0	29	2.40586	2.84116	13074	SP1
24752	Joe Musgrove	SP	44	R	R	31.3		0	20000000.0	29	2.10969	2.81614	12970	SP2
24753	Dylan Cease	SP	84	R	R	28.2		0	8000000.0	29	3.69019	2.97869	18525	SP3
24754	Michael King	SP/RP	34	R	R	28.8		0	3150000.0	29	2.19934	2.39679	19853	SP4
24755	Matt Waldron	SP	61	R	R	27.5		0	740000	29	0.0754922	0.736161	25550	SP5
24756	Robert Suarez	RP	75	R	R	33.1		0	9200000.0	29	-0.00773885	0.236641	30115	CL
24757	Yuki Matsui	RP	1	L	L	28.4		0	5600000.0	29	\N	1.14986	33826	SU8
24758	Enyel De Los Santos	RP	62	R	R	28.2		0	1160000.0	29	0.721024	0.322104	18403	SU7
24759	Wandy Peralta	RP	58	L	L	32.7		0	4125000.0	29	-0.491613	0.0510789	14295	MID
24760	Jeremiah Estrada	RP	56	S	R	25.4		0	740000	29	-0.43108	-0.0111414	22210	MID
24761	Tom Cosgrove	RP	59	L	L	27.8		0	740000	29	0.610285	0.126557	23443	MID
24762	Stephen Kolek	RP	32	R	R	26.9		0	740000	29	\N	-0.0540822	21487	MID
24763	Pedro Avila	SP/RP	60	R	R	27.2		0	740000	29	0.649707	0.127298	18864	LR
24764	Tucupita Marcano	SS/2B/LF	16	L	R	24.5	Knee surgery (torn ACL)	0	740000	29	-0.441651	0.00813142	22871	10IL
24765	Glenn Otto	SP/RP	49	R	R	28.0	Strained teres major	0	740000	29	-0.577154	0.00365498	21366	15IL
24766	Luis Patiño	SP/RP	77	R	R	24.4	Elbow inflammation	0	740000	29	-0.000792556	-0.023611	22815	15IL
24767	Jung Hoo Lee	CF/RF/LF	51	L	R	25.6		0	740000	30	\N	\N	\N	1
24768	Jorge Soler	RF/LF	2	R	R	32.1		0	14000000.0	30	1.86255	1.59482	14221	2
24769	LaMonte Wade Jr.	1B/LF/RF	31	L	L	30.2		0	3500000.0	30	2.05457	1.47687	18126	3
24770	Matt Chapman	3B	26	R	R	30.9		0	18000000.0	30	3.45492	3.33145	16505	4
24771	Michael Conforto	RF/LF	8	L	R	31.1		0	18000000.0	30	1.13139	1.31333	16376	5
24772	Thairo Estrada	2B/SS/LF	39	R	R	28.1		0	4700000.0	30	3.89191	2.16153	16426	6
24773	Mike Yastrzemski	RF/CF/LF	5	L	L	33.6		0	7900000.0	30	1.78551	1.53743	14854	7
24774	Patrick Bailey	C	14	S	R	24.8		0	740000	30	2.8367	3.10969	27478	8
24775	Tom Murphy	C	19	R	R	33.0		0	4125000.0	30	0.759165	0.89111	13499	Bench
24776	Wilmer Flores	1B/3B/2B	41	R	R	32.6		0	5500000.0	30	2.46358	1.4618	5827	Bench
24777	Tyler Fitzgerald	SS/CF/2B	49	R	R	26.5		0	740000	30	0.197909	0.105903	26208	Bench
24778	Luis Matos	CF/RF/LF	29	R	R	22.1		0	740000	30	-0.407308	0.281878	26467	Bench
24779	Logan Webb	SP	62	R	R	27.3		0	18000000.0	30	4.85458	4.18453	17995	SP1
24780	Kyle Harrison	SP	45	R	L	22.6		0	740000	30	-0.112184	1.54691	27758	SP2
24781	Jordan Hicks	SP/RP	12	R	R	27.5		0	11000000.0	30	1.11333	1.34429	19618	SP3
24782	Blake Snell	SP	7	L	L	31.3		0	29698347.0	30	4.09948	2.88189	13543	SP4
24783	Keaton Winn	SP/RP	67	R	R	26.1		0	740000	30	0.203303	0.729014	23499	SP5
24784	Camilo Doval	RP	75	R	R	26.7		0	740000	30	1.89147	0.927942	21992	CL
24785	Tyler Rogers	RP	71	R	R	33.3		0	3200000.0	30	0.567634	0.108746	15541	SU8
24786	Taylor Rogers	RP	33	L	L	33.3		0	11000000.0	30	0.27361	0.602601	13449	SU7
24787	Luke Jackson	RP	77	R	R	32.6		0	5750000.0	30	0.343306	0.0381743	11752	MID
24788	Ryan Walker	RP	74	R	R	28.3		0	740000	30	0.643903	0.331594	20423	MID
24789	Austin Slater	CF/LF/RF	13	R	R	31.3	Elbow surgery (bone spur removal/ulnar nerve transposition)	0	4000000.0	30	0.944207	0.624757	16153	Inj
24790	Alex Cobb	SP	38	R	R	36.5	Hip surgery	0	10000000.0	30	1.76923	2.31249	6562	Inj
24791	Sean Hjelle	SP/RP	64	R	R	26.9	Sprained elbow	0	740000	30	0.0503845	-0.00133409	21481	Inj
24792	Ethan Small	RP	63	L	L	27.1	Strained oblique	0	740000	30	-0.00668214	0.00407425	26364	Inj
\.


--
-- Data for Name: mlbplayers_portfolios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlbplayers_portfolios (portfolio_id, mlbplayer_fgid) FROM stdin;
\.


--
-- Data for Name: mlbplayers_portfolios_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlbplayers_portfolios_transactions (id, date, portfolio_id, kind, dollars, mlbplayer_fgid) FROM stdin;
22	2024-03-14 10:48:44.977942	\N	buy	121212.78	\N
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
1505	10	Athletics	OAK	AL	W	81461667	839811	0	0	0.0	97	65
1506	19	Rockies	COL	NL	W	159715000	1717366	0	0	0.0	93	69
1507	28	Cardinals	STL	NL	C	215362173	2392913	0	0	0.0	90	72
1508	5	Guardians	CLE	AL	C	132586310	1506663	0	0	0.0	88	74
1509	14	Blue Jays	TOR	AL	E	247433453	2877133	0	0	0.0	86	76
1510	23	Brewers	MIL	NL	C	151905581	1787124	0	0	0.0	85	77
1511	9	Yankees	NYY	AL	E	307661667	3619549	0	0	0.0	85	77
1512	18	Reds	CIN	NL	C	121630000	1430941	0	0	0.0	85	77
1513	27	Pirates	PIT	NL	C	120890417	1439172	0	0	0.0	84	78
1514	4	White Sox	CHW	AL	C	123196667	1466627	0	0	0.0	84	78
1515	13	Rangers	TEX	AL	W	247084956	2976927	0	0	0.0	83	79
1516	22	Dodgers	LAD	NL	W	313900026	3781928	1	1	0.0	83	79
1517	8	Twins	MIN	AL	C	157734881	1900420	0	0	0.0	83	79
1518	17	Cubs	CHC	NL	C	234555715	2860436	0	0	0.0	82	80
1519	26	Phillies	PHI	NL	E	261833772	3193095	0	0	0.0	82	80
1520	3	Red Sox	BOS	AL	E	210624167	2568587	0	0	0.0	82	80
1521	12	Rays	TBR	AL	E	134217955	1657012	0	0	0.0	81	81
1522	21	Astros	HOU	AL	W	255721032	3157050	0	0	0.0	81	81
1523	30	Giants	SFG	NL	W	253169583	3164620	0	0	0.0	80	82
1524	7	Royals	KCR	AL	C	162556692	2031959	0	0	0.0	80	82
1525	16	Braves	ATL	NL	E	273363334	3460295	0	0	0.0	79	83
1526	25	Mets	NYM	NL	E	336686565	4261855	0	0	0.0	79	83
1527	2	Orioles	BAL	AL	E	122088667	1545426	0	0	0.0	79	83
1528	11	Mariners	SEA	AL	W	160336667	2055598	0	0	0.0	78	84
1529	20	Marlins	MIA	NL	E	124181667	1612749	0	0	0.0	77	85
1530	29	Padres	SDP	NL	W	223633680	2942548	1	1	0.0	76	86
1531	6	Tigers	DET	AL	C	120053750	1644572	0	0	0.0	73	89
1532	15	Diamondbacks	ARI	NL	W	191493381	2858110	0	0	0.0	67	95
1533	24	Nationals	WSN	NL	E	136375000	2066288	0	0	0.0	66	96
1534	1	Angels	LAA	AL	W	189178334	3002831	0	0	0.0	63	99
1535	0	Replacements	REP	AL_NL	W_C_E	46330000	965209	48	114	0.0	48	114
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
2651	stage everys	18	66	236000000	2713
2652	turn sciences	25	57	219000000	2747
2653	why practices	18	79	88000000	2745
2654	cultural passs	21	31	147000000	2740
2655	throughout individuals	23	43	94000000	2740
2656	level whos	22	88	205000000	2745
2657	indeed whichs	21	96	192000000	2709
2658	also whats	25	41	173000000	2742
2659	let prepares	26	30	217000000	2743
2660	hundred aboves	26	47	148000000	2732
2661	affect colors	18	14	112000000	2717
2662	the bodys	19	34	172000000	2711
2663	remain boths	26	95	98000000	2712
2664	determine sures	22	21	96000000	2748
2665	huge simplys	25	43	170000000	2741
2666	itself strongs	19	50	244000000	2723
2667	week throughs	26	19	91000000	2732
2668	employee shoulds	18	99	128000000	2710
2669	treatment developments	26	28	83000000	2720
2670	feel foots	17	70	89000000	2727
2671	full balls	20	28	243000000	2725
2672	statement events	18	29	77000000	2702
2673	next passs	22	92	147000000	2737
2674	law behinds	22	46	173000000	2749
2675	catch Republicans	21	19	246000000	2711
2676	hospital foods	25	20	206000000	2722
2677	low describes	21	97	87000000	2742
2678	all sevens	23	40	149000000	2715
2679	him itselfs	22	30	137000000	2708
2680	every poors	17	48	75000000	2741
2681	Mr historys	18	72	244000000	2706
2682	tell stills	26	30	204000000	2703
2683	research lates	24	42	236000000	2706
2684	along fills	18	53	174000000	2745
2685	life determines	26	73	191000000	2706
2686	place jobs	26	61	242000000	2712
2687	we bys	24	45	153000000	2717
2688	will applys	19	83	75000000	2707
2689	bad steps	26	28	184000000	2732
2690	mind moderns	18	19	202000000	2701
2691	former grounds	19	46	145000000	2725
2692	blue agents	17	74	131000000	2746
2693	want values	20	38	98000000	2737
2694	hospital hands	26	86	203000000	2701
2695	task figures	22	80	96000000	2743
2696	job majoritys	17	97	154000000	2746
2697	agent visits	17	39	83000000	2725
2698	often laws	21	99	106000000	2715
2699	down democratics	23	82	104000000	2722
2700	lay downs	18	60	112000000	2733
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, username, password, fav_team) FROM stdin;
2701	Nicholas Myers	ncruz@example.net	anthony44	87477ac528b827d8a2c92a8603d0e9cd3110b7ab2761b9f132e1e7e4e9d5ffc057aa3815f17936ca9420e4d8c0fe58c506c046c850b94b8f84db0236c7433996	\N
2702	Cindy Dixon	jason30@example.com	patrick83	2f2ea31fd69660fd98570361ccc3a35e326918508a4e2a45c6c2ba97a8adf8087aff5c93453c8067ddfd3c51c60aa99b39763c328de236120ba41d301c5a03fb	\N
2703	Amy Kelley	patrick88@example.com	stephen14	aa3a2897aed33b059a9033383e04304fc8c817929d79376a41483f7132d2cc9016a15bc06e9d66e582a9946506c430a2d546a8b0649c8e2381120ab3f98c07ca	\N
2704	Anne Grant	jasonduncan@example.com	randy14	0633b8bde87967196e34ca6ecbdcd8b485c9e6432ba4355746237be68b3fc7ab40d0377d8f54de5b4e878b2163ae422658de254fbd2f757cc42fc83cd0d0a557	\N
2705	Linda Reynolds	timothywillis@example.net	derek57	95b159e2cb7e208bc3de6d7364d3179db5b3652a015cd3c3ef5630710d41d880edf9f10bdb3d8baefc051ea7c1ec7f09d518616f3e559eead2349ea8ffbe6261	\N
2706	Kathleen Parrish	brownbrenda@example.net	kyle68	039e5a0c04942da543224e60fd0d347dc168b1c4f5a12a58c20998e295ab8eb824294e899b0fc2eb37c4d53edcbfe721297d8476d88800b111ae14dd4543d8b9	\N
2707	Jennifer Alvarez	curtis70@example.org	michael113	88b33dfeb0cfc9c2b290f85cfa7931a5f69119f880a6f3e4d9f8a51376defa35197ff8089386979bf986956e0c499ac037b4804861ab0074bda632f5e4f1f1ff	\N
2708	Robin Ferguson	katie08@example.com	michelle132	16e639634048aab0955cc8d2cacf405ca7d78b194b936cdb478b0866183612c8e7ef444f1ee53c24191e284baff40a365f3d86d4db9bdf4e8cbd76af185886fc	\N
2709	David Hughes	atkinsonjennifer@example.org	kristin107	e1d964efd928d4bcbc2fdd9069e9d18f0af5cd4a685de486305295f2b499366273e01bd1b476b5258bf029925f1765af7f1ef86c12137f090e49486493acadcc	\N
2710	Daniel Chandler	barberrobert@example.org	krystal72	2de5e81ecfb2d2c4b26060b594a830cb180885d12ddf5745749d4b30c7a08e098c42218c52178395e4c5b067b4ec7824c748ea5dc1f00aab2db4ecd5d4362228	\N
2711	Ian Obrien	kimjames@example.org	john82	b1d55dd8d10a52ff5b11ce539214d99b627a58ed0526c0995e24d1414f6b71f89e128ae7db44a6f3d74dfb7233fea95751340d56700270a7e75d807a977c4ff8	\N
2712	Erin Campbell	sarah74@example.com	kathy112	2b1454e295e1d7f3bbf54243eb9bc1b6fcbfd0032d54424a51214606962fd8f04a5bc80e714e60ca6dcf27e5b170bf9d89e41ea8ebd4ff6001d2cf3b00817ab1	\N
2713	Katherine Frank	heather45@example.net	david23	a578b1b2caa101251aec61bd64d835fd92074fe65b0456d62dd39bae34b7849975e48df35f00aa692ec4429729d48cc560eb4e48cf8d3e0ee174b90df4815c69	\N
2714	Susan Taylor	bwilliams@example.net	brandi102	96c32c2a22a8b8c02e48fb6f03410ce279e74921f2e12d1c77bc2033a891eeaf1895bc2ebe13f7404d66dd1e43031d7912200f316278eeffef45de0b96f71797	\N
2715	David Mckay	michael41@example.net	zachary118	b296fd1d6f824c28946ee57a1739dd2b46291e5d256a98bd60998704f36d1a60f078a0741b07d3385b87bbef349dfaf1c4ba1d9011387ea8a12549e143d6894f	\N
2716	Steven Harris	stevenarroyo@example.org	robert139	697eeb201dce3b043f927299179ac10b66b828a56c71b1beb3d45c24b3880fb208f41d5801697b8774497f7b625f8b27fdef70bc5579d8736d05ab2ce279c36c	\N
2717	David Bean	erich@example.org	michele20	805524c704b337283bbbba3ab0bd77b48a60580aec3193bbdb128db01245416e236d5e5836481de028bb233c06c8b6ea9b222ad4c54ca10f04b95282d48d5699	\N
2718	Karen Rodriguez	lchavez@example.net	william19	b74d924b6ad24fee4e63e9a99af80d03dc7eaed22d4317f6fc393ba4b044a5057fa664497bb719cf766b31265b7e1ab84f92160a710a02c66bec3d4853a07e2d	\N
2719	Willie Nguyen	wilsonandrew@example.net	veronica117	29c1b08ebe0c99239c9418d5ee1a4d4d2b835ac4843b717b1d4ce8af589aee35e7bd396e03e8f1772167fd89dc37af6dbe7eafac389d38b7d139b2ef4ef4f782	\N
2720	Kim Andersen	daniel04@example.org	donna44	51865f1fe39b07f7f9b2e1517c74b759fca54bc28787afa974d42a82a8e3c2bf71e211c1561e57fab97a2666bfd8cd8804b9f0c8cb0d3f6c1a2b3ea7cae8b243	\N
2721	Mrs. Danielle Miller	susandecker@example.org	charles49	f2bced93a613952aefcedf40637fb0f9c8c7ab88c25be59a761f2eae446cc474b0567aa78fc147cf5ed08ed7cf267627d8536ff17c6203e14ce98d4ad0153f21	\N
2722	Michael Frank	tami68@example.org	christina47	3bcc4f48c22de0f63531b51e806a44861bf626bca1226aeed5f74016d39209b3bd0caa1f53c3d83a297e5761ffd76a739b917d0bb4ba294c3fee569928146b4e	\N
2723	Candace Robertson	awilliams@example.com	ryan132	b42f680398088ad9a9a8bc4f7584fea0531655409ccf06cdebbb9b833cb48fa2d5f7e3f588e2fd5e1710580ad6e9d169b6cb25a66d28c4e7630a192a283d81ce	\N
2724	Jennifer Brown	davidkelly@example.net	jillian84	d50fb616464c78ea15eb9d668d2d7f1b08d041b41fdc4053b99cc365f1be1d2f4c5a2d122f10e0bde386495021be3ca2565212cecb583b0ecdad2d7d46e5c2a9	\N
2725	Amber Eaton	christianlawson@example.com	jeremy95	ea143f41fe19a48537ade0781da98970481e32eddff0ba58de8db7a888b9f0ec6ca5df00e5710c449de123e222222f1b01c39b07cdfc19ead6e5e6ac2c10e50e	\N
2726	Teresa Kim	jamiecarroll@example.net	elizabeth71	c0da7a5a95d380341d70c5e72de041a49f2810fe5c755f9c07da1215422d0eb1244a61a1bef5af11bca6a9c5c154a46863a0a96b93d20361cee4e17c9a9c3930	\N
2727	Christopher Wood	christopherthomas@example.net	sarah122	3d5ffe786f5a8f1c1dc922f02abf9fac9708833a328db3a542e047e18e3d5b8612eb1e61a801bfaca9ac4455c77722e237864baa52dda23f542a66185ca25052	\N
2728	Tina Wolfe	bclark@example.net	mary96	22efdd7fd580b824ae87fa08f48284150f0109e039c531a3d9a8b75a8d7cd17010bd5f154f082259fca7b25ff9faa3498196e78386e030a36223424afa2a04cb	\N
2729	John Trujillo	sherrymorse@example.com	sabrina49	372875ea22e218b5a8b8a44efaf74d94946e9b2913f9127a777f53d2d8d6a6b6072f8a68d79c2819434b22362cfa9d2b96213f0f9e652e7d7a57c24ed5fa9480	\N
2730	Kristy Luna	baueranthony@example.net	bonnie55	38b18dae806c4a0cb39ce22cc9a576531a1b9ef35d2447e5c30f9c8abde0aa95955ed36d4ec527de49b6730a9b70c2527c92f8e9043d0ae9bae637311559cb29	\N
2731	Valerie Anderson	davidchavez@example.org	courtney54	f370cc3fdf956c2fa9bd54c6a22e71fb0431fd8c84c976acfb041222cec083600f2105e54242f020dbb516dd08241b3ea59a58d7f7f8d28f9031f19d3eefbeaf	\N
2732	Katherine Long	jenkinsmichael@example.org	heather49	d4ae2f5c1309b434f30c35b023cde98eafeb8dc531dc091579b972be6518c1eed303a3351e25dbb1cdcc287f951368da1910f25681409681bc37606bab0bf5fa	\N
2733	Gina Clarke	dylanhoward@example.net	jacqueline41	134b2076969e4b09715b9065c2b27ec313fd462158d224bba47ebe56a34588afc17cd4ec89e6b8d396d5de37e0a89f8d12496b8e3c67b2038cb28473e38fc80c	\N
2734	Angela Velazquez	hwilson@example.org	robin124	1e5ba420ec88207e5432f494a080978ca3f7d6ec2025ecf926af36112d83706ab9b580133a42407cca84197b75a829b5cd5ccbafe746bbe067f8915bc08c7952	\N
2735	Kevin Peters	rgonzales@example.org	stephanie89	84ec04f7376f72946cd34a696e5132a1f21871eaca23629a3520e4bcd83352f72e4445391f44bcb5fb18e23556eba75d2c82555d61d8e591cf585e18882a17b2	\N
2736	Kimberly Arnold	dana22@example.net	amanda53	42acc1b3a0cc4ea94f849f0b017d5e2404b505c87b94e71a24a81b32865d4a0ae2280fa47dc8dc49e2b564feac8780da613e87e9cb2e4beb02feb2ac1b859c5c	\N
2737	Paul Johnson	cbrowning@example.net	caitlin134	00f53ca045aeec7660958e179ae0555222b9370f71ea48679fe03cff310fcdab70b89405a8c45b1f55b22a2d28aafcadb4bf3b60bb2fd481bc941a6b1144b444	\N
2738	Joshua Dickson	gregorykelly@example.com	andrew145	a5a8339fd6c254df3a1e240050bae4f23bc145b0f9f4c94c979e414f208724f344241de3296cfd50a7ada3480d192bad5e31b8f7a6746accb1d2abeec1d4bcc9	\N
2739	Patrick Stephens	orusso@example.com	kristen22	c8981d2a14b26e2587017026fce749c1424646318d280b53059f0092066154c717c4d17e552cb6a83e31f4d96c22521af07ce64ef3b9c3ada1a5565cb8eff40e	\N
2740	Mrs. Mary Anderson DDS	tommy73@example.com	jill109	c679a0aa4af5f25eb1976fc1d3384e53f943abcc9018846d703c95278292f362d4290b94fec15d23930ab8df9f271b60915cc76902f7ddce1293eda0a2e975d3	\N
2741	Crystal Spears	jwalton@example.net	adam107	5a0db0c487bbc4459a0fdb7b5204d9877a654e1adb6f1cbe8d135e5e4f06bea68549dcfe2c234ae19f2f16853104d87c4432e8cfb680a0ba061c1cbe1f801ce8	\N
2742	Karen Graves	ybullock@example.org	ralph64	2ca99f129bbc097b5ddea1fe4b488364c42b267d1bfdbe18ad82d7cb12dbb47923c2ca52f86c4c7aae2b05ddbc11c87dea8edaa363f1c141cfde07d794b43168	\N
2743	Robert Jones	michaeldaniels@example.com	cheryl100	ada03cbe91108d3b21da994aef407f6966b85115feb07a9872fe74efb7d1f2c53d6a8c7c45a4183a09365931d50eff0dba17b0bf88f17829260daa05ef43ecf5	\N
2744	Carolyn Horton	whiterobert@example.com	paul144	b041cc4a6dd3655c5f163b07088295ff2e37910f1d670a73ecebdda3fdbddf1c55c530a36f9ff5464ab20bb60154d7d5ab5d7ad2bfe741205d5b56852b4113a9	\N
2745	Jeffrey Terry	clayraymond@example.com	kimberly106	7539d0d8a4d50278c03880720e7c18ce8f64993f3ba13d1efd68d32b2edbe65d1455058bd1cc9580c7cff383d4f858d4a66b4b4fb0b1d28744bdab1dc7749979	\N
2746	Antonio Bell	barbara47@example.com	nicholas40	c3659464684f5a7406e61bb7d142ae59bf4a410f9dbdeb0cd5b5fbb05d0d7c26e38bbc70b9dfc087d80e1e866219cf02997e79284d15fbf54d40a79354381f0f	\N
2747	James Richardson	tracy86@example.com	richard83	86818536ebe808416cd61147852c3371c18ad4b514f120973c0c70d9e9b82e458fa80b0ccc74a6f6c2f609685c4cc9f93e16a253a09e5455d0664a8b13fc5bd4	\N
2748	Jessica Sullivan	melissa87@example.com	cynthia104	cc7b5a56b353d57ee06b621568dbb3e673850d512242bd34e92c7fc9b9a8a2b2cc999507e86a181920fbfecd4e6f9d6b0346a5470dc8c0cde5bf115af7092847	\N
2749	Brian Lee	pnelson@example.com	angela25	d4c9d5906851cce45173b3f784a3d3a417a38697b0b13a8a536ab7f0f3b521c9ca96f48f094fdfddd89ca8bd6cf5030cc3bf28d64007662c028489c37e2015b5	\N
2750	Sandra Kennedy	edwardarcher@example.net	daniel123	f4d0b558d505cac9b68aa008179804f12db7ebe5635b8af1aa400deb889b3638915fbec344a4006496f4eac78c8b8b067843564b2da72bff67f425ae236c890f	\N
\.


--
-- Name: mlbplayer_value_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mlbplayer_value_history_id_seq', 1, false);


--
-- Name: mlbplayers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mlbplayers_id_seq', 24792, true);


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

SELECT pg_catalog.setval('public.mlbteams_id_seq', 1535, true);


--
-- Name: portfolio_value_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.portfolio_value_history_id_seq', 1, false);


--
-- Name: portfolios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.portfolios_id_seq', 2700, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2750, true);


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
    ADD CONSTRAINT mlbplayers_portfolios_mlbplayer_fgid_fkey FOREIGN KEY (mlbplayer_fgid) REFERENCES public.mlbplayers(fg_id) ON DELETE CASCADE;


--
-- Name: mlbplayers_portfolios mlbplayers_portfolios_portfolio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayers_portfolios
    ADD CONSTRAINT mlbplayers_portfolios_portfolio_id_fkey FOREIGN KEY (portfolio_id) REFERENCES public.portfolios(id) ON DELETE CASCADE;


--
-- Name: mlbplayers_portfolios_transactions mlbplayers_portfolios_transactions_mlbplayer_fgid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mlbplayers_portfolios_transactions
    ADD CONSTRAINT mlbplayers_portfolios_transactions_mlbplayer_fgid_fkey FOREIGN KEY (mlbplayer_fgid) REFERENCES public.mlbplayers(fg_id) ON DELETE SET NULL;


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

