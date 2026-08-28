--
-- PostgreSQL database dump
--

\restrict zRkP3S5aJCTdzujdGSKy6uaqrDDdrRNR4UfbBRwxb2QM5uj0gmjlSqEy9UpgVRX

-- Dumped from database version 15.19 (Debian 15.19-0+deb12u1)
-- Dumped by pg_dump version 15.19 (Debian 15.19-0+deb12u1)

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

--
-- Name: cc_card_serial_set(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.cc_card_serial_set() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public'
    AS $$
  BEGIN
    UPDATE cc_card_seria SET value=value+1 WHERE id=NEW.id_seria;
    SELECT value INTO NEW.serial FROM cc_card_seria WHERE id=NEW.id_seria;
    RETURN NEW;
  END
$$;


--
-- Name: cc_card_serial_update(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.cc_card_serial_update() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public'
    AS $$
  BEGIN
    IF NEW.id_seria IS NOT NULL AND NEW.id_seria = OLD.id_seria THEN
      RETURN NEW;
    END IF;
    UPDATE cc_card_seria SET value=value+1 WHERE id=NEW.id_seria;
    SELECT value INTO NEW.serial FROM cc_card_seria WHERE id=NEW.id_seria;
    RETURN NEW;
  END
$$;


--
-- Name: cc_ratecard_validate_regex(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.cc_ratecard_validate_regex() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public'
    AS $_$
  BEGIN
    IF SUBSTRING(new.dialprefix,1,1) != '_' THEN
      RETURN new;
    END IF;
    PERFORM '0' ~* REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE('^' || new.dialprefix || '$', 'X', '[0-9]', 'g'), 'Z', '[1-9]', 'g'), 'N', '[2-9]', 'g'), E'\\.', E'\\.+', 'g'), '_', '', 'g');
    RETURN new;
  END
$_$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cc_iax_buddies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_iax_buddies (
    id integer NOT NULL,
    id_cc_card integer DEFAULT 0 NOT NULL,
    name character varying(80) DEFAULT ''::character varying NOT NULL,
    type character varying(6) DEFAULT 'friend'::character varying NOT NULL,
    username character varying(80) DEFAULT ''::character varying NOT NULL,
    accountcode character varying(20),
    regexten character varying(20),
    callerid character varying(80),
    amaflags character varying(7),
    secret character varying(80),
    disallow character varying(100) DEFAULT 'all'::character varying,
    allow character varying(100) DEFAULT 'gsm,ulaw,alaw'::character varying,
    host character varying(31) DEFAULT ''::character varying NOT NULL,
    qualify character varying(7) DEFAULT 'yes'::character varying NOT NULL,
    context character varying(80),
    defaultip character varying(15),
    language character varying(2),
    deny character varying(95),
    permit character varying(95),
    mask character varying(95),
    port character varying(5) DEFAULT ''::character varying NOT NULL,
    regseconds integer DEFAULT 0 NOT NULL,
    ipaddr character varying(15) DEFAULT ''::character varying NOT NULL,
    trunk character varying(3) DEFAULT 'no'::character varying,
    dbsecret character varying(40) DEFAULT ''::character varying NOT NULL,
    regcontext character varying(40) DEFAULT ''::character varying NOT NULL,
    sourceaddress character varying(20) DEFAULT ''::character varying NOT NULL,
    mohinterpret character varying(20) DEFAULT ''::character varying NOT NULL,
    mohsuggest character varying(20) DEFAULT ''::character varying NOT NULL,
    inkeys character varying(40) DEFAULT ''::character varying NOT NULL,
    outkey character varying(40) DEFAULT ''::character varying NOT NULL,
    cid_number character varying(40) DEFAULT ''::character varying NOT NULL,
    sendani character varying(10) DEFAULT ''::character varying NOT NULL,
    fullname character varying(40) DEFAULT ''::character varying NOT NULL,
    auth character varying(20) DEFAULT ''::character varying NOT NULL,
    maxauthreq character varying(15) DEFAULT ''::character varying NOT NULL,
    encryption character varying(20) DEFAULT ''::character varying NOT NULL,
    transfer character varying(10) DEFAULT ''::character varying NOT NULL,
    jitterbuffer character varying(10) DEFAULT ''::character varying NOT NULL,
    forcejitterbuffer character varying(10) DEFAULT ''::character varying NOT NULL,
    codecpriority character varying(40) DEFAULT ''::character varying NOT NULL,
    qualifysmoothing character varying(10) DEFAULT ''::character varying NOT NULL,
    qualifyfreqok character varying(10) DEFAULT ''::character varying NOT NULL,
    qualifyfreqnotok character varying(10) DEFAULT ''::character varying NOT NULL,
    timezone character varying(20) DEFAULT ''::character varying NOT NULL,
    adsi character varying(10) DEFAULT ''::character varying NOT NULL,
    setvar character varying(200) DEFAULT ''::character varying NOT NULL,
    requirecalltoken character varying(20) DEFAULT ''::character varying NOT NULL,
    maxcallnumbers character varying(10) DEFAULT ''::character varying NOT NULL,
    maxcallnumbers_nonvalidated character varying(10) DEFAULT ''::character varying NOT NULL
);


--
-- Name: _cc_iax_buddies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._cc_iax_buddies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _cc_iax_buddies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._cc_iax_buddies_id_seq OWNED BY public.cc_iax_buddies.id;


--
-- Name: cc_sip_buddies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_sip_buddies (
    id integer NOT NULL,
    id_cc_card integer DEFAULT 0 NOT NULL,
    name character varying(80) DEFAULT ''::character varying NOT NULL,
    type character varying(6) DEFAULT 'friend'::character varying NOT NULL,
    username character varying(80) DEFAULT ''::character varying NOT NULL,
    accountcode character varying(20),
    regexten character varying(20),
    callerid character varying(80),
    amaflags character varying(7),
    secret character varying(80),
    md5secret character varying(80),
    nat character varying(3) DEFAULT 'yes'::character varying NOT NULL,
    dtmfmode character varying(7) DEFAULT 'RFC2833'::character varying NOT NULL,
    disallow character varying(100) DEFAULT 'all'::character varying,
    allow character varying(100) DEFAULT 'gsm,ulaw,alaw'::character varying,
    host character varying(31) DEFAULT ''::character varying NOT NULL,
    qualify character varying(7) DEFAULT 'yes'::character varying NOT NULL,
    canreinvite character varying(20) DEFAULT 'yes'::character varying,
    callgroup character varying(10),
    context character varying(80),
    defaultip character varying(15),
    fromuser character varying(80),
    fromdomain character varying(80),
    insecure character varying(20),
    language character varying(2),
    mailbox character varying(50),
    deny character varying(95),
    permit character varying(95),
    mask character varying(95),
    pickupgroup character varying(10),
    port character varying(5) DEFAULT ''::character varying NOT NULL,
    restrictcid character varying(1),
    rtptimeout character varying(3),
    rtpholdtimeout character varying(3),
    musiconhold character varying(100),
    regseconds integer DEFAULT 0 NOT NULL,
    ipaddr character varying(15) DEFAULT ''::character varying NOT NULL,
    cancallforward character varying(3) DEFAULT 'yes'::character varying,
    fullcontact character varying(80),
    setvar character varying(100) DEFAULT ''::character varying NOT NULL,
    regserver character varying(20),
    lastms character varying(11),
    defaultuser character varying(40) DEFAULT ''::character varying NOT NULL,
    auth character varying(10) DEFAULT ''::character varying NOT NULL,
    subscribemwi character varying(10) DEFAULT ''::character varying,
    vmexten character varying(20) DEFAULT ''::character varying NOT NULL,
    cid_number character varying(40) DEFAULT ''::character varying NOT NULL,
    callingpres character varying(20) DEFAULT ''::character varying NOT NULL,
    usereqphone character varying(10) DEFAULT ''::character varying NOT NULL,
    incominglimit character varying(10) DEFAULT ''::character varying NOT NULL,
    subscribecontext character varying(40) DEFAULT ''::character varying NOT NULL,
    musicclass character varying(20) DEFAULT ''::character varying NOT NULL,
    mohsuggest character varying(20) DEFAULT ''::character varying NOT NULL,
    allowtransfer character varying(20) DEFAULT ''::character varying NOT NULL,
    autoframing character varying(10) DEFAULT ''::character varying NOT NULL,
    maxcallbitrate character varying(15) DEFAULT ''::character varying NOT NULL,
    outboundproxy character varying(40) DEFAULT ''::character varying NOT NULL,
    rtpkeepalive character varying(15) DEFAULT ''::character varying NOT NULL
);


--
-- Name: _cc_sip_buddies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._cc_sip_buddies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _cc_sip_buddies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._cc_sip_buddies_id_seq OWNED BY public.cc_sip_buddies.id;


--
-- Name: cc_agent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_agent (
    id bigint NOT NULL,
    datecreation timestamp without time zone DEFAULT now(),
    active boolean DEFAULT false NOT NULL,
    login character varying(20) NOT NULL,
    passwd character varying(40),
    location text,
    language character varying(5) DEFAULT 'en'::text,
    id_tariffgroup integer,
    options integer DEFAULT 0 NOT NULL,
    credit numeric(15,5) DEFAULT 0 NOT NULL,
    currency character varying(3) DEFAULT 'USD'::character varying NOT NULL,
    locale character varying(10) DEFAULT 'C'::character varying,
    commission numeric(10,4) DEFAULT 0 NOT NULL,
    vat numeric(10,4) DEFAULT 0 NOT NULL,
    banner text,
    perms integer,
    lastname character varying(50),
    firstname character varying(50),
    address character varying(100),
    city character varying(40),
    state character varying(40),
    country character varying(40),
    zipcode character varying(20),
    phone character varying(20),
    email character varying(70),
    fax character varying(20),
    company character varying(50),
    com_balance numeric(15,5) NOT NULL,
    threshold_remittance numeric(15,5) NOT NULL,
    bank_info text
);


--
-- Name: cc_agent_commission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_agent_commission (
    id bigint NOT NULL,
    id_payment bigint,
    id_card bigint NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    amount numeric(15,5) NOT NULL,
    description text,
    id_agent integer NOT NULL,
    commission_type smallint NOT NULL,
    commission_percent numeric(10,4) NOT NULL
);


--
-- Name: cc_agent_commission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_agent_commission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_agent_commission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_agent_commission_id_seq OWNED BY public.cc_agent_commission.id;


--
-- Name: cc_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_agent_id_seq OWNED BY public.cc_agent.id;


--
-- Name: cc_agent_signup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_agent_signup (
    id bigint NOT NULL,
    id_agent integer NOT NULL,
    code character varying(30) NOT NULL,
    id_tariffgroup integer NOT NULL,
    id_group integer NOT NULL
);


--
-- Name: cc_agent_signup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_agent_signup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_agent_signup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_agent_signup_id_seq OWNED BY public.cc_agent_signup.id;


--
-- Name: cc_agent_tariffgroup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_agent_tariffgroup (
    id_agent bigint NOT NULL,
    id_tariffgroup integer NOT NULL
);


--
-- Name: cc_alarm; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_alarm (
    id bigint NOT NULL,
    name text NOT NULL,
    periode integer DEFAULT 1 NOT NULL,
    type integer DEFAULT 1 NOT NULL,
    maxvalue numeric NOT NULL,
    minvalue numeric DEFAULT '-1'::integer NOT NULL,
    id_trunk integer,
    status integer DEFAULT 0 NOT NULL,
    numberofrun integer DEFAULT 0 NOT NULL,
    numberofalarm integer DEFAULT 0 NOT NULL,
    datecreate timestamp without time zone DEFAULT now(),
    datelastrun timestamp without time zone DEFAULT now(),
    emailreport text
);


--
-- Name: cc_alarm_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_alarm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_alarm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_alarm_id_seq OWNED BY public.cc_alarm.id;


--
-- Name: cc_alarm_report; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_alarm_report (
    id bigint NOT NULL,
    cc_alarm_id bigint NOT NULL,
    calculatedvalue numeric NOT NULL,
    daterun timestamp without time zone DEFAULT now()
);


--
-- Name: cc_alarm_report_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_alarm_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_alarm_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_alarm_report_id_seq OWNED BY public.cc_alarm_report.id;


--
-- Name: cc_autorefill_report; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_autorefill_report (
    id bigint NOT NULL,
    daterun timestamp(0) without time zone DEFAULT now(),
    totalcardperform integer,
    totalcredit double precision
);


--
-- Name: cc_autorefill_report_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_autorefill_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_autorefill_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_autorefill_report_id_seq OWNED BY public.cc_autorefill_report.id;


--
-- Name: cc_backup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_backup (
    id bigint NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    path character varying(255) DEFAULT ''::character varying NOT NULL,
    creationdate timestamp without time zone DEFAULT now()
);


--
-- Name: cc_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_backup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_backup_id_seq OWNED BY public.cc_backup.id;


--
-- Name: cc_billing_customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_billing_customer (
    id bigint NOT NULL,
    id_card bigint NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_invoice bigint NOT NULL,
    start_date timestamp without time zone
);


--
-- Name: cc_billing_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_billing_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_billing_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_billing_customer_id_seq OWNED BY public.cc_billing_customer.id;


--
-- Name: cc_call; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_call (
    id bigint NOT NULL,
    card_id bigint NOT NULL,
    sessionid text NOT NULL,
    uniqueid text NOT NULL,
    nasipaddress text,
    starttime timestamp without time zone,
    stoptime timestamp without time zone,
    sessiontime integer,
    calledstation text,
    destination integer DEFAULT 0,
    terminatecauseid smallint DEFAULT 1,
    sessionbill double precision,
    id_tariffgroup integer,
    id_tariffplan integer,
    id_ratecard integer,
    id_trunk integer,
    sipiax integer DEFAULT 0,
    src text,
    id_did integer,
    buycost numeric(15,5) DEFAULT 0,
    id_card_package_offer integer DEFAULT 0,
    real_sessiontime integer,
    dnid character varying(40)
);


--
-- Name: cc_call_archive; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_call_archive (
    id bigint NOT NULL,
    sessionid character varying(40) NOT NULL,
    uniqueid character varying(30) NOT NULL,
    card_id bigint NOT NULL,
    nasipaddress character varying(30) NOT NULL,
    starttime timestamp without time zone DEFAULT now() NOT NULL,
    stoptime timestamp without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone NOT NULL,
    sessiontime integer,
    calledstation character varying(30) NOT NULL,
    sessionbill double precision,
    id_tariffgroup integer,
    id_tariffplan integer,
    id_ratecard integer,
    id_trunk integer,
    sipiax integer DEFAULT 0,
    src character varying(40) NOT NULL,
    id_did integer,
    buycost numeric(15,5) DEFAULT 0.00000,
    id_card_package_offer integer DEFAULT 0,
    real_sessiontime integer,
    dnid character varying(40) NOT NULL,
    terminatecauseid smallint DEFAULT 1,
    destination integer DEFAULT 0
);


--
-- Name: cc_call_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_call_archive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_call_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_call_archive_id_seq OWNED BY public.cc_call_archive.id;


--
-- Name: cc_call_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_call_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_call_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_call_id_seq OWNED BY public.cc_call.id;


--
-- Name: cc_callback_spool; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_callback_spool (
    id bigint NOT NULL,
    uniqueid text,
    entry_time timestamp without time zone DEFAULT now(),
    status text,
    server_ip text,
    num_attempt integer DEFAULT 0 NOT NULL,
    last_attempt_time timestamp without time zone,
    manager_result text,
    agi_result text,
    callback_time timestamp without time zone,
    channel text,
    exten text,
    context text,
    priority text,
    application text,
    data text,
    timeout text,
    callerid text,
    variable character varying(300),
    account text,
    async text,
    actionid text,
    id_server integer,
    id_server_group integer
);


--
-- Name: cc_callback_spool_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_callback_spool_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_callback_spool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_callback_spool_id_seq OWNED BY public.cc_callback_spool.id;


--
-- Name: cc_callerid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_callerid (
    id bigint NOT NULL,
    cid text NOT NULL,
    id_cc_card bigint NOT NULL,
    activated boolean DEFAULT true NOT NULL
);


--
-- Name: cc_callerid_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_callerid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_callerid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_callerid_id_seq OWNED BY public.cc_callerid.id;


--
-- Name: cc_prefix; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_prefix (
    prefix bigint NOT NULL,
    destination character varying(60) NOT NULL
);


--
-- Name: cc_ratecard; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_ratecard (
    id integer NOT NULL,
    idtariffplan integer DEFAULT 0 NOT NULL,
    dialprefix text NOT NULL,
    destination bigint DEFAULT 0 NOT NULL,
    buyrate numeric(15,5) DEFAULT 0 NOT NULL,
    buyrateinitblock integer DEFAULT 0 NOT NULL,
    buyrateincrement integer DEFAULT 0 NOT NULL,
    rateinitial numeric(15,5) DEFAULT 0 NOT NULL,
    initblock integer DEFAULT 0 NOT NULL,
    billingblock integer DEFAULT 0 NOT NULL,
    connectcharge numeric(15,5) DEFAULT 0 NOT NULL,
    disconnectcharge numeric(15,5) DEFAULT 0 NOT NULL,
    stepchargea numeric(15,5) DEFAULT 0 NOT NULL,
    chargea numeric(15,5) DEFAULT 0 NOT NULL,
    timechargea integer DEFAULT 0 NOT NULL,
    billingblocka integer DEFAULT 0 NOT NULL,
    stepchargeb numeric(15,5) DEFAULT 0 NOT NULL,
    chargeb numeric(15,5) DEFAULT 0 NOT NULL,
    timechargeb integer DEFAULT 0 NOT NULL,
    billingblockb integer DEFAULT 0 NOT NULL,
    stepchargec numeric(15,5) DEFAULT 0 NOT NULL,
    chargec numeric(15,5) DEFAULT 0 NOT NULL,
    timechargec integer DEFAULT 0 NOT NULL,
    billingblockc integer DEFAULT 0 NOT NULL,
    startdate timestamp(0) without time zone DEFAULT now(),
    stopdate timestamp(0) without time zone,
    starttime integer DEFAULT 0 NOT NULL,
    endtime integer DEFAULT 10079 NOT NULL,
    id_trunk integer DEFAULT '-1'::integer,
    musiconhold character varying(100),
    id_outbound_cidgroup integer DEFAULT '-1'::integer NOT NULL,
    rounding_calltime integer DEFAULT 0 NOT NULL,
    rounding_threshold integer DEFAULT 0 NOT NULL,
    additional_block_charge numeric(15,5) DEFAULT 0 NOT NULL,
    additional_block_charge_time integer DEFAULT 0 NOT NULL,
    tag character varying(50),
    is_merged integer DEFAULT 0,
    additional_grace integer DEFAULT 0 NOT NULL,
    minimal_cost numeric(15,5) DEFAULT 0 NOT NULL,
    announce_time_correction numeric(5,3) DEFAULT 1.0 NOT NULL,
    disconnectcharge_after integer DEFAULT 0 NOT NULL,
    CONSTRAINT chk_timechargea_coherent CHECK (((chargea = (0)::numeric) OR (timechargea > 0)))
);


--
-- Name: cc_tariffgroup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_tariffgroup (
    id integer NOT NULL,
    iduser integer DEFAULT 0 NOT NULL,
    idtariffplan integer DEFAULT 0 NOT NULL,
    tariffgroupname text NOT NULL,
    lcrtype integer DEFAULT 0 NOT NULL,
    creationdate timestamp without time zone DEFAULT now(),
    removeinterprefix integer DEFAULT 0 NOT NULL,
    id_cc_package_offer bigint DEFAULT 0 NOT NULL
);


--
-- Name: cc_tariffgroup_plan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_tariffgroup_plan (
    idtariffgroup integer NOT NULL,
    idtariffplan integer NOT NULL
);


--
-- Name: cc_tariffplan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_tariffplan (
    id integer NOT NULL,
    iduser integer DEFAULT 0 NOT NULL,
    tariffname text NOT NULL,
    creationdate timestamp without time zone DEFAULT now(),
    startingdate timestamp without time zone DEFAULT now(),
    expirationdate timestamp without time zone,
    description text,
    id_trunk integer DEFAULT 0,
    secondusedreal integer DEFAULT 0,
    secondusedcarrier integer DEFAULT 0,
    secondusedratecard integer DEFAULT 0,
    reftariffplan integer DEFAULT 0,
    idowner integer DEFAULT 0,
    dnidprefix text DEFAULT 'all'::text NOT NULL,
    calleridprefix text DEFAULT 'all'::text NOT NULL
);


--
-- Name: cc_callplan_lcr; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.cc_callplan_lcr AS
 SELECT cc_ratecard.id,
    cc_prefix.destination,
    cc_ratecard.dialprefix,
    cc_ratecard.buyrate,
    cc_ratecard.rateinitial,
    cc_ratecard.startdate,
    cc_ratecard.stopdate,
    cc_ratecard.initblock,
    cc_ratecard.connectcharge,
    cc_ratecard.id_trunk,
    cc_ratecard.idtariffplan,
    cc_ratecard.id AS ratecard_id,
    cc_tariffgroup.id AS tariffgroup_id
   FROM ((((public.cc_tariffgroup
     RIGHT JOIN public.cc_tariffgroup_plan ON ((cc_tariffgroup_plan.idtariffgroup = cc_tariffgroup.id)))
     JOIN public.cc_tariffplan ON ((cc_tariffplan.id = cc_tariffgroup_plan.idtariffplan)))
     LEFT JOIN public.cc_ratecard ON ((cc_ratecard.idtariffplan = cc_tariffplan.id)))
     LEFT JOIN public.cc_prefix ON ((cc_prefix.prefix = cc_ratecard.destination)))
  WHERE (cc_ratecard.id IS NOT NULL);


--
-- Name: cc_campaign; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_campaign (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    creationdate timestamp without time zone DEFAULT now(),
    startingdate timestamp without time zone DEFAULT now(),
    expirationdate timestamp without time zone,
    description text,
    id_card bigint DEFAULT '0'::bigint NOT NULL,
    secondusedreal integer DEFAULT 0,
    nb_callmade integer DEFAULT 0,
    status integer DEFAULT 1 NOT NULL,
    frequency integer DEFAULT 20 NOT NULL,
    forward_number character varying(50),
    daily_start_time time without time zone DEFAULT '10:00:00'::time without time zone NOT NULL,
    daily_stop_time time without time zone DEFAULT '18:00:00'::time without time zone NOT NULL,
    monday smallint DEFAULT '1'::smallint NOT NULL,
    tuesday smallint DEFAULT '1'::smallint NOT NULL,
    wednesday smallint DEFAULT '1'::smallint NOT NULL,
    thursday smallint DEFAULT '1'::smallint NOT NULL,
    friday smallint DEFAULT '1'::smallint NOT NULL,
    saturday smallint DEFAULT '0'::smallint NOT NULL,
    sunday smallint DEFAULT '0'::smallint NOT NULL,
    id_cid_group integer NOT NULL,
    id_campaign_config integer NOT NULL,
    callerid character varying(60) NOT NULL
);


--
-- Name: cc_campaign_config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_campaign_config (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    flatrate numeric(15,5) DEFAULT 0 NOT NULL,
    context character varying(40) NOT NULL,
    description text
);


--
-- Name: cc_campaign_config_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_campaign_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_campaign_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_campaign_config_id_seq OWNED BY public.cc_campaign_config.id;


--
-- Name: cc_campaign_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_campaign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_campaign_id_seq OWNED BY public.cc_campaign.id;


--
-- Name: cc_campaign_phonebook; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_campaign_phonebook (
    id_campaign integer NOT NULL,
    id_phonebook integer NOT NULL
);


--
-- Name: cc_campaign_phonestatus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_campaign_phonestatus (
    id_phonenumber bigint NOT NULL,
    id_campaign integer NOT NULL,
    id_callback character varying(40) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    lastuse timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: cc_campaignconf_cardgroup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_campaignconf_cardgroup (
    id_campaign_config integer NOT NULL,
    id_card_group integer NOT NULL
);


--
-- Name: cc_card; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_card (
    id bigint NOT NULL,
    creationdate timestamp without time zone DEFAULT now(),
    firstusedate timestamp without time zone,
    expirationdate timestamp without time zone,
    enableexpire integer DEFAULT 0,
    expiredays integer DEFAULT 0,
    username text NOT NULL,
    useralias text NOT NULL,
    uipass text,
    credit numeric(12,4) NOT NULL,
    tariff integer DEFAULT 0,
    id_didgroup integer DEFAULT 0,
    activated boolean DEFAULT false NOT NULL,
    lastname text,
    firstname text,
    address text,
    city text,
    state text,
    country text,
    zipcode text,
    phone text,
    email text,
    fax text,
    inuse integer DEFAULT 0,
    simultaccess integer DEFAULT 0,
    currency character varying(3) DEFAULT 'USD'::character varying,
    lastuse date DEFAULT now(),
    nbused integer DEFAULT 0,
    typepaid integer DEFAULT 0,
    creditlimit integer DEFAULT 0,
    voipcall integer DEFAULT 0,
    sip_buddy integer DEFAULT 0,
    iax_buddy integer DEFAULT 0,
    language text DEFAULT 'en'::text,
    redial text,
    runservice integer DEFAULT 0,
    nbservice integer DEFAULT 0,
    id_campaign integer DEFAULT 0,
    num_trials_done integer DEFAULT 0,
    vat numeric(6,3) DEFAULT 0,
    servicelastrun timestamp without time zone,
    initialbalance numeric(12,4) DEFAULT 0 NOT NULL,
    invoiceday integer DEFAULT 1,
    autorefill integer DEFAULT 0,
    loginkey text,
    mac_addr character varying(17) DEFAULT '00-00-00-00-00-00'::character varying NOT NULL,
    id_timezone integer DEFAULT 0,
    status integer DEFAULT 1 NOT NULL,
    tag character varying(50),
    voicemail_permitted integer DEFAULT 0 NOT NULL,
    voicemail_activated integer DEFAULT 0 NOT NULL,
    last_notification timestamp without time zone,
    email_notification character varying(70),
    notify_email smallint DEFAULT 0 NOT NULL,
    credit_notification integer DEFAULT '-1'::integer NOT NULL,
    id_group integer DEFAULT 1 NOT NULL,
    company_name character varying(50),
    company_website character varying(60),
    vat_rn character varying(40) DEFAULT NULL::character varying,
    traffic bigint DEFAULT 0,
    traffic_target text,
    discount numeric(5,2) DEFAULT '0'::numeric NOT NULL,
    restriction smallint DEFAULT '0'::smallint NOT NULL,
    id_seria integer,
    serial bigint,
    block smallint DEFAULT 0 NOT NULL,
    lock_pin character varying(15) DEFAULT NULL::character varying,
    lock_date timestamp without time zone
);


--
-- Name: cc_card_archive; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_card_archive (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    firstusedate timestamp without time zone,
    expirationdate timestamp without time zone,
    enableexpire integer DEFAULT 0,
    expiredays integer DEFAULT 0,
    username text NOT NULL,
    useralias text NOT NULL,
    uipass text,
    credit numeric(12,4) NOT NULL,
    tariff integer DEFAULT 0,
    id_didgroup integer DEFAULT 0,
    activated boolean DEFAULT false NOT NULL,
    lastname text,
    firstname text,
    address text,
    city text,
    state text,
    country text,
    zipcode text,
    phone text,
    email text,
    fax text,
    inuse integer DEFAULT 0,
    simultaccess integer DEFAULT 0,
    currency character varying(3) DEFAULT 'USD'::character varying,
    lastuse date DEFAULT now(),
    nbused integer DEFAULT 0,
    typepaid integer DEFAULT 0,
    creditlimit integer DEFAULT 0,
    voipcall integer DEFAULT 0,
    sip_buddy integer DEFAULT 0,
    iax_buddy integer DEFAULT 0,
    language text DEFAULT 'en'::text,
    redial text,
    runservice integer DEFAULT 0,
    nbservice integer DEFAULT 0,
    id_campaign integer DEFAULT 0,
    num_trials_done integer DEFAULT 0,
    vat numeric(6,3) DEFAULT 0,
    servicelastrun timestamp without time zone,
    initialbalance numeric(12,4) DEFAULT 0 NOT NULL,
    invoiceday integer DEFAULT 1,
    autorefill integer DEFAULT 0,
    loginkey text,
    mac_addr character varying(17) DEFAULT '00-00-00-00-00-00'::character varying NOT NULL,
    id_timezone integer DEFAULT 0,
    status integer DEFAULT 1 NOT NULL,
    tag character varying(50),
    voicemail_permitted integer DEFAULT 0 NOT NULL,
    voicemail_activated integer DEFAULT 0 NOT NULL,
    last_notification timestamp without time zone,
    email_notification character varying(70),
    notify_email smallint DEFAULT 0 NOT NULL,
    credit_notification integer DEFAULT '-1'::integer NOT NULL,
    id_group integer DEFAULT 1 NOT NULL,
    company_name character varying(50),
    company_website character varying(60),
    vat_rn character varying(40) DEFAULT NULL::character varying,
    traffic bigint DEFAULT 0,
    traffic_target text,
    discount numeric(5,2) DEFAULT '0'::numeric NOT NULL,
    restriction smallint DEFAULT '0'::smallint NOT NULL,
    id_seria integer,
    serial bigint
);


--
-- Name: cc_card_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_card_archive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_card_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_card_archive_id_seq OWNED BY public.cc_card_archive.id;


--
-- Name: cc_card_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_card_group (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(400) DEFAULT NULL::character varying,
    users_perms integer DEFAULT 0 NOT NULL,
    id_agent integer,
    flatrate numeric(15,5) DEFAULT 0 NOT NULL,
    campaign_context character varying(40),
    provisioning character varying(200)
);


--
-- Name: cc_card_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_card_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_card_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_card_group_id_seq OWNED BY public.cc_card_group.id;


--
-- Name: cc_card_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_card_history (
    id bigint NOT NULL,
    id_cc_card bigint,
    datecreated timestamp without time zone DEFAULT now(),
    description text
);


--
-- Name: cc_card_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_card_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_card_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_card_history_id_seq OWNED BY public.cc_card_history.id;


--
-- Name: cc_card_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_card_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_card_id_seq OWNED BY public.cc_card.id;


--
-- Name: cc_card_package_offer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_card_package_offer (
    id bigint NOT NULL,
    id_cc_card bigint NOT NULL,
    id_cc_package_offer bigint NOT NULL,
    date_consumption timestamp without time zone DEFAULT now(),
    used_secondes bigint NOT NULL
);


--
-- Name: cc_card_package_offer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_card_package_offer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_card_package_offer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_card_package_offer_id_seq OWNED BY public.cc_card_package_offer.id;


--
-- Name: cc_card_seria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_card_seria (
    id integer NOT NULL,
    name character(30) NOT NULL,
    description text,
    value bigint DEFAULT 0 NOT NULL
);


--
-- Name: cc_card_seria_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_card_seria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_card_seria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_card_seria_id_seq OWNED BY public.cc_card_seria.id;


--
-- Name: cc_card_subscription; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_card_subscription (
    id bigint NOT NULL,
    id_cc_card bigint DEFAULT 0 NOT NULL,
    id_subscription_fee integer DEFAULT 0 NOT NULL,
    startdate timestamp without time zone DEFAULT now(),
    stopdate timestamp without time zone,
    product_id character varying(100) DEFAULT NULL::character varying,
    product_name character varying(100) DEFAULT NULL::character varying,
    paid_status smallint DEFAULT 0 NOT NULL,
    last_run timestamp without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone NOT NULL,
    next_billing_date timestamp without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone NOT NULL,
    limit_pay_date timestamp without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone NOT NULL
);


--
-- Name: cc_card_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_card_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_card_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_card_subscription_id_seq OWNED BY public.cc_card_subscription.id;


--
-- Name: cc_cardgroup_service; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_cardgroup_service (
    id_card_group integer NOT NULL,
    id_service integer NOT NULL
);


--
-- Name: cc_charge; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_charge (
    id bigint NOT NULL,
    id_cc_card bigint NOT NULL,
    iduser integer DEFAULT 0 NOT NULL,
    creationdate timestamp without time zone DEFAULT now(),
    amount numeric(12,4) NOT NULL,
    chargetype integer DEFAULT 0,
    description text,
    id_cc_did bigint DEFAULT 0,
    id_cc_card_subscription bigint,
    cover_from date,
    cover_to date,
    charged_status smallint DEFAULT '0'::smallint NOT NULL,
    invoiced_status smallint DEFAULT '0'::smallint NOT NULL
);


--
-- Name: cc_charge_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_charge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_charge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_charge_id_seq OWNED BY public.cc_charge.id;


--
-- Name: cc_config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_config (
    id integer NOT NULL,
    config_title character varying(100) NOT NULL,
    config_key character varying(100) NOT NULL,
    config_value text NOT NULL,
    config_description text,
    config_valuetype integer DEFAULT 0 NOT NULL,
    config_listvalues text,
    config_group_title character varying(64) NOT NULL
);


--
-- Name: cc_config_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_config_group (
    id integer NOT NULL,
    group_title character varying(64) NOT NULL,
    group_description character varying(255) NOT NULL
);


--
-- Name: cc_config_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_config_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_config_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_config_group_id_seq OWNED BY public.cc_config_group.id;


--
-- Name: cc_config_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_config_id_seq OWNED BY public.cc_config.id;


--
-- Name: cc_configuration; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_configuration (
    configuration_id bigint NOT NULL,
    configuration_title character varying(64) NOT NULL,
    configuration_key character varying(64) NOT NULL,
    configuration_value character varying(255) NOT NULL,
    configuration_description character varying(255) NOT NULL,
    configuration_type integer DEFAULT 0 NOT NULL,
    use_function character varying(255),
    set_function character varying(255)
);


--
-- Name: cc_configuration_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_configuration_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_configuration_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_configuration_configuration_id_seq OWNED BY public.cc_configuration.configuration_id;


--
-- Name: cc_country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_country (
    id integer NOT NULL,
    countrycode text NOT NULL,
    countryprefix text DEFAULT '0'::text NOT NULL,
    countryname text NOT NULL
);


--
-- Name: cc_country_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_country_id_seq OWNED BY public.cc_country.id;


--
-- Name: cc_currencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_currencies (
    id integer NOT NULL,
    currency character(3) DEFAULT ''::bpchar NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    value numeric(12,5) DEFAULT 0.00000 NOT NULL,
    lastupdate timestamp without time zone DEFAULT now(),
    basecurrency character(3) DEFAULT 'USD'::bpchar NOT NULL
);


--
-- Name: cc_currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_currencies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_currencies_id_seq OWNED BY public.cc_currencies.id;


--
-- Name: cc_did; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_did (
    id bigint NOT NULL,
    id_cc_didgroup bigint NOT NULL,
    id_cc_country integer NOT NULL,
    activated integer DEFAULT 1 NOT NULL,
    reserved integer DEFAULT 0,
    iduser bigint DEFAULT 0 NOT NULL,
    did text NOT NULL,
    creationdate timestamp without time zone DEFAULT now(),
    startingdate timestamp without time zone DEFAULT now(),
    expirationdate timestamp without time zone,
    description text,
    secondusedreal integer DEFAULT 0,
    billingtype integer DEFAULT 0,
    fixrate numeric(12,4) NOT NULL,
    connection_charge numeric(15,5) DEFAULT '0'::numeric NOT NULL,
    selling_rate numeric(15,5) DEFAULT '0'::numeric NOT NULL
);


--
-- Name: cc_did_destination; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_did_destination (
    id bigint NOT NULL,
    destination text NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    id_cc_card bigint NOT NULL,
    id_cc_did bigint NOT NULL,
    creationdate timestamp without time zone DEFAULT now(),
    activated integer DEFAULT 1 NOT NULL,
    secondusedreal integer DEFAULT 0,
    voip_call integer DEFAULT 0
);


--
-- Name: cc_did_destination_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_did_destination_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_did_destination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_did_destination_id_seq OWNED BY public.cc_did_destination.id;


--
-- Name: cc_did_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_did_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_did_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_did_id_seq OWNED BY public.cc_did.id;


--
-- Name: cc_did_use; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_did_use (
    id bigint NOT NULL,
    id_cc_card bigint,
    id_did bigint NOT NULL,
    reservationdate timestamp without time zone DEFAULT now() NOT NULL,
    releasedate timestamp without time zone,
    activated integer DEFAULT 0,
    month_payed integer DEFAULT 0,
    reminded smallint DEFAULT '0'::smallint NOT NULL
);


--
-- Name: cc_did_use_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_did_use_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_did_use_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_did_use_id_seq OWNED BY public.cc_did_use.id;


--
-- Name: cc_didgroup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_didgroup (
    id bigint NOT NULL,
    creationdate timestamp without time zone DEFAULT now(),
    didgroupname text NOT NULL
);


--
-- Name: cc_didgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_didgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_didgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_didgroup_id_seq OWNED BY public.cc_didgroup.id;


--
-- Name: cc_epayment_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_epayment_log (
    id bigint NOT NULL,
    cardid bigint DEFAULT 0 NOT NULL,
    amount character varying(50) DEFAULT 0 NOT NULL,
    vat double precision DEFAULT 0 NOT NULL,
    paymentmethod character varying(255) NOT NULL,
    cc_owner character varying(255) NOT NULL,
    cc_number character varying(255) NOT NULL,
    cc_expires character varying(255) NOT NULL,
    creationdate timestamp(0) without time zone DEFAULT now(),
    status integer DEFAULT 0 NOT NULL,
    cvv character varying(4),
    credit_card_type character varying(20),
    currency character varying(4),
    transaction_detail text,
    item_type character varying(30),
    item_id bigint
);


--
-- Name: cc_epayment_log_agent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_epayment_log_agent (
    id bigint NOT NULL,
    agent_id bigint DEFAULT '0'::bigint NOT NULL,
    amount character varying(50) DEFAULT '0'::numeric NOT NULL,
    vat double precision DEFAULT '0'::double precision NOT NULL,
    paymentmethod character(50) NOT NULL,
    cc_owner character varying(64) DEFAULT NULL::character varying,
    cc_number character varying(32) DEFAULT NULL::character varying,
    cc_expires character varying(7) DEFAULT NULL::character varying,
    creationdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    cvv character varying(4) DEFAULT NULL::character varying,
    credit_card_type character varying(20) DEFAULT NULL::character varying,
    currency character varying(4) DEFAULT NULL::character varying,
    transaction_detail text
);


--
-- Name: cc_epayment_log_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_epayment_log_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_epayment_log_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_epayment_log_agent_id_seq OWNED BY public.cc_epayment_log_agent.id;


--
-- Name: cc_epayment_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_epayment_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_epayment_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_epayment_log_id_seq OWNED BY public.cc_epayment_log.id;


--
-- Name: cc_invoice; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_invoice (
    id bigint NOT NULL,
    reference character varying(30),
    id_card bigint NOT NULL,
    date timestamp without time zone DEFAULT now() NOT NULL,
    paid_status smallint DEFAULT '0'::smallint NOT NULL,
    status smallint DEFAULT '0'::smallint NOT NULL,
    title character varying(50) NOT NULL,
    description text NOT NULL
);


--
-- Name: cc_invoice_conf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_invoice_conf (
    id integer NOT NULL,
    key_val character varying(50) NOT NULL,
    value character varying(50) NOT NULL
);


--
-- Name: cc_invoice_conf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_invoice_conf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_invoice_conf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_invoice_conf_id_seq OWNED BY public.cc_invoice_conf.id;


--
-- Name: cc_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_invoice_id_seq OWNED BY public.cc_invoice.id;


--
-- Name: cc_invoice_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_invoice_item (
    id bigint NOT NULL,
    id_invoice bigint NOT NULL,
    date timestamp without time zone DEFAULT now() NOT NULL,
    price numeric(15,5) DEFAULT '0'::numeric NOT NULL,
    vat numeric(4,2) DEFAULT '0'::numeric NOT NULL,
    description text NOT NULL,
    id_ext bigint,
    type_ext character varying(10)
);


--
-- Name: cc_invoice_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_invoice_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_invoice_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_invoice_item_id_seq OWNED BY public.cc_invoice_item.id;


--
-- Name: cc_invoice_payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_invoice_payment (
    id_invoice bigint NOT NULL,
    id_payment bigint NOT NULL
);


--
-- Name: cc_iso639; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_iso639 (
    code text NOT NULL,
    name text NOT NULL,
    lname text,
    charset text DEFAULT 'ISO-8859-1'::text NOT NULL
);


--
-- Name: cc_logpayment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_logpayment (
    id bigint NOT NULL,
    date timestamp(0) without time zone DEFAULT now() NOT NULL,
    payment numeric(15,5) NOT NULL,
    card_id bigint NOT NULL,
    id_logrefill bigint,
    description text,
    added_refill smallint DEFAULT 0 NOT NULL,
    payment_type smallint DEFAULT 0 NOT NULL,
    added_commission smallint DEFAULT 0 NOT NULL,
    agent_id bigint
);


--
-- Name: cc_logpayment_agent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_logpayment_agent (
    id bigint NOT NULL,
    date timestamp without time zone DEFAULT now() NOT NULL,
    payment numeric(15,5) NOT NULL,
    agent_id bigint NOT NULL,
    id_logrefill bigint,
    description text,
    added_refill smallint DEFAULT '0'::smallint NOT NULL,
    payment_type smallint DEFAULT '0'::smallint NOT NULL,
    added_commission smallint DEFAULT '0'::smallint NOT NULL
);


--
-- Name: cc_logpayment_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_logpayment_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_logpayment_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_logpayment_agent_id_seq OWNED BY public.cc_logpayment_agent.id;


--
-- Name: cc_logpayment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_logpayment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_logpayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_logpayment_id_seq OWNED BY public.cc_logpayment.id;


--
-- Name: cc_logrefill; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_logrefill (
    id bigint NOT NULL,
    date timestamp(0) without time zone DEFAULT now() NOT NULL,
    credit numeric(15,5) NOT NULL,
    card_id bigint NOT NULL,
    description text,
    refill_type smallint DEFAULT 0 NOT NULL,
    added_invoice smallint DEFAULT '0'::smallint NOT NULL,
    agent_id bigint
);


--
-- Name: cc_logrefill_agent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_logrefill_agent (
    id bigint NOT NULL,
    date timestamp without time zone DEFAULT now() NOT NULL,
    credit numeric(15,5) NOT NULL,
    agent_id bigint NOT NULL,
    description text,
    refill_type smallint DEFAULT '0'::smallint NOT NULL
);


--
-- Name: cc_logrefill_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_logrefill_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_logrefill_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_logrefill_agent_id_seq OWNED BY public.cc_logrefill_agent.id;


--
-- Name: cc_logrefill_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_logrefill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_logrefill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_logrefill_id_seq OWNED BY public.cc_logrefill.id;


--
-- Name: cc_message_agent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_message_agent (
    id bigint NOT NULL,
    id_agent integer NOT NULL,
    message text,
    type smallint DEFAULT 0 NOT NULL,
    logo smallint DEFAULT 1 NOT NULL,
    order_display integer NOT NULL
);


--
-- Name: cc_message_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_message_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_message_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_message_agent_id_seq OWNED BY public.cc_message_agent.id;


--
-- Name: cc_monitor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_monitor (
    id bigint NOT NULL,
    label character varying(50) NOT NULL,
    dial_code integer,
    description character varying(250),
    text_intro character varying(250),
    query_type smallint DEFAULT 1 NOT NULL,
    query character varying(1000),
    result_type smallint DEFAULT 1 NOT NULL,
    enable smallint DEFAULT 1 NOT NULL
);


--
-- Name: cc_monitor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_monitor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_monitor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_monitor_id_seq OWNED BY public.cc_monitor.id;


--
-- Name: cc_notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_notification (
    id bigint NOT NULL,
    key_value character varying(255),
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    priority smallint DEFAULT '0'::smallint NOT NULL,
    from_type smallint NOT NULL,
    from_id bigint DEFAULT '0'::bigint,
    link_id bigint,
    link_type character varying(20)
);


--
-- Name: cc_notification_admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_notification_admin (
    id_notification bigint NOT NULL,
    id_admin integer NOT NULL,
    viewed smallint DEFAULT '0'::smallint NOT NULL
);


--
-- Name: cc_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_notification_id_seq OWNED BY public.cc_notification.id;


--
-- Name: cc_outbound_cid_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_outbound_cid_group (
    id bigint NOT NULL,
    creationdate timestamp(0) without time zone DEFAULT now(),
    group_name text NOT NULL
);


--
-- Name: cc_outbound_cid_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_outbound_cid_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_outbound_cid_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_outbound_cid_group_id_seq OWNED BY public.cc_outbound_cid_group.id;


--
-- Name: cc_outbound_cid_list; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_outbound_cid_list (
    id bigint NOT NULL,
    outbound_cid_group bigint NOT NULL,
    cid text NOT NULL,
    activated integer DEFAULT 0 NOT NULL,
    creationdate timestamp(0) without time zone DEFAULT now()
);


--
-- Name: cc_outbound_cid_list_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_outbound_cid_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_outbound_cid_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_outbound_cid_list_id_seq OWNED BY public.cc_outbound_cid_list.id;


--
-- Name: cc_package_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_package_group (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


--
-- Name: cc_package_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_package_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_package_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_package_group_id_seq OWNED BY public.cc_package_group.id;


--
-- Name: cc_package_offer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_package_offer (
    id bigint NOT NULL,
    creationdate timestamp without time zone DEFAULT now(),
    label text NOT NULL,
    packagetype integer NOT NULL,
    billingtype integer NOT NULL,
    startday integer NOT NULL,
    freetimetocall integer NOT NULL
);


--
-- Name: cc_package_offer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_package_offer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_package_offer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_package_offer_id_seq OWNED BY public.cc_package_offer.id;


--
-- Name: cc_package_rate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_package_rate (
    package_id integer NOT NULL,
    rate_id integer NOT NULL
);


--
-- Name: cc_packgroup_package; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_packgroup_package (
    packagegroup_id integer NOT NULL,
    package_id integer NOT NULL
);


--
-- Name: cc_payment_methods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_payment_methods (
    id bigint NOT NULL,
    payment_method text NOT NULL,
    payment_filename text NOT NULL
);


--
-- Name: cc_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_payment_methods_id_seq OWNED BY public.cc_payment_methods.id;


--
-- Name: cc_payments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_payments (
    id bigint NOT NULL,
    customers_id bigint DEFAULT '0'::bigint NOT NULL,
    customers_name text NOT NULL,
    customers_email_address text NOT NULL,
    item_name text NOT NULL,
    item_id text NOT NULL,
    item_quantity integer DEFAULT 0 NOT NULL,
    payment_method character varying(32) NOT NULL,
    cc_type character varying(20),
    cc_owner character varying(64),
    cc_number character varying(32),
    cc_expires character varying(6),
    orders_status integer NOT NULL,
    orders_amount numeric(14,6),
    last_modified timestamp without time zone,
    date_purchased timestamp without time zone,
    orders_date_finished timestamp without time zone,
    currency character varying(3),
    currency_value numeric(14,6)
);


--
-- Name: cc_payments_agent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_payments_agent (
    id bigint NOT NULL,
    agent_id bigint NOT NULL,
    agent_name character varying(200) NOT NULL,
    agent_email_address character varying(96) NOT NULL,
    item_name character varying(127) DEFAULT NULL::character varying,
    item_id character varying(127) DEFAULT NULL::character varying,
    item_quantity integer DEFAULT 0 NOT NULL,
    payment_method character varying(32) NOT NULL,
    cc_type character varying(20) DEFAULT NULL::character varying,
    cc_owner character varying(64) DEFAULT NULL::character varying,
    cc_number character varying(32) DEFAULT NULL::character varying,
    cc_expires character varying(4) DEFAULT NULL::character varying,
    orders_status integer NOT NULL,
    orders_amount numeric(14,6) DEFAULT NULL::numeric,
    last_modified timestamp without time zone,
    date_purchased timestamp without time zone,
    orders_date_finished timestamp without time zone,
    currency character(3) DEFAULT NULL::bpchar,
    currency_value numeric(14,6) DEFAULT NULL::numeric
);


--
-- Name: cc_payments_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_payments_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_payments_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_payments_agent_id_seq OWNED BY public.cc_payments_agent.id;


--
-- Name: cc_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_payments_id_seq OWNED BY public.cc_payments.id;


--
-- Name: cc_payments_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_payments_status (
    id bigint NOT NULL,
    status_id integer NOT NULL,
    status_name character varying(200) NOT NULL
);


--
-- Name: cc_payments_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_payments_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_payments_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_payments_status_id_seq OWNED BY public.cc_payments_status.id;


--
-- Name: cc_paypal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_paypal (
    id bigint NOT NULL,
    payer_id character varying(60) DEFAULT NULL::character varying,
    payment_date character varying(50) DEFAULT NULL::character varying,
    txn_id character varying(50) DEFAULT NULL::character varying,
    first_name character varying(50) DEFAULT NULL::character varying,
    last_name character varying(50) DEFAULT NULL::character varying,
    payer_email character varying(75) DEFAULT NULL::character varying,
    payer_status character varying(50) DEFAULT NULL::character varying,
    payment_type character varying(50) DEFAULT NULL::character varying,
    memo text,
    item_name character varying(127) DEFAULT NULL::character varying,
    item_number character varying(127) DEFAULT NULL::character varying,
    quantity bigint DEFAULT '0'::bigint NOT NULL,
    mc_gross numeric(9,2) DEFAULT NULL::numeric,
    mc_fee numeric(9,2) DEFAULT NULL::numeric,
    tax numeric(9,2) DEFAULT NULL::numeric,
    mc_currency character varying(3) DEFAULT NULL::character varying,
    address_name character varying(255) DEFAULT ''::character varying NOT NULL,
    address_street character varying(255) DEFAULT ''::character varying NOT NULL,
    address_city character varying(255) DEFAULT ''::character varying NOT NULL,
    address_state character varying(255) DEFAULT ''::character varying NOT NULL,
    address_zip character varying(255) DEFAULT ''::character varying NOT NULL,
    address_country character varying(255) DEFAULT ''::character varying NOT NULL,
    address_status character varying(255) DEFAULT ''::character varying NOT NULL,
    payer_business_name character varying(255) DEFAULT ''::character varying NOT NULL,
    payment_status character varying(255) DEFAULT ''::character varying NOT NULL,
    pending_reason character varying(255) DEFAULT ''::character varying NOT NULL,
    reason_code character varying(255) DEFAULT ''::character varying NOT NULL,
    txn_type character varying(255) DEFAULT ''::character varying NOT NULL
);


--
-- Name: cc_paypal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_paypal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_paypal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_paypal_id_seq OWNED BY public.cc_paypal.id;


--
-- Name: cc_phonebook; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_phonebook (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    id_card bigint NOT NULL
);


--
-- Name: cc_phonebook_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_phonebook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_phonebook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_phonebook_id_seq OWNED BY public.cc_phonebook.id;


--
-- Name: cc_phonenumber; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_phonenumber (
    id bigint NOT NULL,
    id_phonebook integer NOT NULL,
    number character varying(30) NOT NULL,
    name character varying(40),
    creationdate timestamp without time zone DEFAULT now() NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    info text,
    amount integer DEFAULT 0 NOT NULL
);


--
-- Name: cc_phonenumber_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_phonenumber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_phonenumber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_phonenumber_id_seq OWNED BY public.cc_phonenumber.id;


--
-- Name: cc_prefix_prefix_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_prefix_prefix_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_prefix_prefix_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_prefix_prefix_seq OWNED BY public.cc_prefix.prefix;


--
-- Name: cc_provider; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_provider (
    id bigint NOT NULL,
    provider_name text NOT NULL,
    creationdate timestamp without time zone DEFAULT now(),
    description text
);


--
-- Name: cc_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_provider_id_seq OWNED BY public.cc_provider.id;


--
-- Name: cc_ratecard_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_ratecard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_ratecard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_ratecard_id_seq OWNED BY public.cc_ratecard.id;


--
-- Name: cc_receipt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_receipt (
    id bigint NOT NULL,
    id_card bigint NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    title character varying(50) NOT NULL,
    description text NOT NULL,
    status smallint DEFAULT '0'::smallint NOT NULL
);


--
-- Name: cc_receipt_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_receipt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_receipt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_receipt_id_seq OWNED BY public.cc_receipt.id;


--
-- Name: cc_receipt_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_receipt_item (
    id bigint NOT NULL,
    id_receipt bigint NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    price numeric(15,5) DEFAULT '0'::numeric NOT NULL,
    description text NOT NULL,
    id_ext bigint,
    type_ext character varying(10) DEFAULT NULL::character varying
);


--
-- Name: cc_receipt_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_receipt_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_receipt_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_receipt_item_id_seq OWNED BY public.cc_receipt_item.id;


--
-- Name: cc_remittance_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_remittance_request (
    id bigint NOT NULL,
    id_agent bigint NOT NULL,
    amount numeric(15,5) NOT NULL,
    type smallint NOT NULL,
    date timestamp without time zone DEFAULT now() NOT NULL,
    status smallint DEFAULT 0 NOT NULL
);


--
-- Name: cc_remittance_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_remittance_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_remittance_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_remittance_request_id_seq OWNED BY public.cc_remittance_request.id;


--
-- Name: cc_restricted_phonenumber; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_restricted_phonenumber (
    id bigint NOT NULL,
    number character varying(50) NOT NULL,
    id_card bigint NOT NULL
);


--
-- Name: cc_restricted_phonenumber_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_restricted_phonenumber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_restricted_phonenumber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_restricted_phonenumber_id_seq OWNED BY public.cc_restricted_phonenumber.id;


--
-- Name: cc_server_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_server_group (
    id bigint NOT NULL,
    name text,
    description text
);


--
-- Name: cc_server_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_server_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_server_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_server_group_id_seq OWNED BY public.cc_server_group.id;


--
-- Name: cc_server_manager; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_server_manager (
    id bigint NOT NULL,
    id_group integer DEFAULT 1,
    server_ip text,
    manager_host text,
    manager_username text,
    manager_secret text,
    lasttime_used timestamp without time zone DEFAULT now()
);


--
-- Name: cc_server_manager_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_server_manager_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_server_manager_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_server_manager_id_seq OWNED BY public.cc_server_manager.id;


--
-- Name: cc_service; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_service (
    id bigint NOT NULL,
    name text NOT NULL,
    amount double precision NOT NULL,
    period integer DEFAULT 1 NOT NULL,
    rule integer DEFAULT 0 NOT NULL,
    daynumber integer DEFAULT 0 NOT NULL,
    stopmode integer DEFAULT 0 NOT NULL,
    maxnumbercycle integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    numberofrun integer DEFAULT 0 NOT NULL,
    datecreate timestamp(0) without time zone DEFAULT now(),
    datelastrun timestamp(0) without time zone DEFAULT now(),
    emailreport text,
    totalcredit double precision DEFAULT 0 NOT NULL,
    totalcardperform integer DEFAULT 0 NOT NULL,
    operate_mode smallint DEFAULT 0,
    dialplan integer DEFAULT 0,
    use_group smallint DEFAULT 0
);


--
-- Name: cc_service_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_service_id_seq OWNED BY public.cc_service.id;


--
-- Name: cc_service_report; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_service_report (
    id bigint NOT NULL,
    cc_service_id bigint NOT NULL,
    daterun timestamp(0) without time zone DEFAULT now(),
    totalcardperform integer,
    totalcredit double precision
);


--
-- Name: cc_service_report_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_service_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_service_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_service_report_id_seq OWNED BY public.cc_service_report.id;


--
-- Name: cc_sip_buddies_empty; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.cc_sip_buddies_empty AS
 SELECT cc_sip_buddies.id,
    cc_sip_buddies.id_cc_card,
    cc_sip_buddies.name,
    cc_sip_buddies.accountcode,
    cc_sip_buddies.regexten,
    cc_sip_buddies.amaflags,
    cc_sip_buddies.callgroup,
    cc_sip_buddies.callerid,
    cc_sip_buddies.canreinvite,
    cc_sip_buddies.context,
    cc_sip_buddies.defaultip,
    cc_sip_buddies.dtmfmode,
    cc_sip_buddies.fromuser,
    cc_sip_buddies.fromdomain,
    cc_sip_buddies.host,
    cc_sip_buddies.insecure,
    cc_sip_buddies.language,
    cc_sip_buddies.mailbox,
    cc_sip_buddies.md5secret,
    cc_sip_buddies.nat,
    cc_sip_buddies.permit,
    cc_sip_buddies.deny,
    cc_sip_buddies.mask,
    cc_sip_buddies.pickupgroup,
    cc_sip_buddies.port,
    cc_sip_buddies.qualify,
    cc_sip_buddies.restrictcid,
    cc_sip_buddies.rtptimeout,
    cc_sip_buddies.rtpholdtimeout,
    ''::text AS secret,
    cc_sip_buddies.type,
    cc_sip_buddies.username,
    cc_sip_buddies.disallow,
    cc_sip_buddies.allow,
    cc_sip_buddies.musiconhold,
    cc_sip_buddies.regseconds,
    cc_sip_buddies.ipaddr,
    cc_sip_buddies.cancallforward,
    cc_sip_buddies.fullcontact,
    cc_sip_buddies.setvar
   FROM public.cc_sip_buddies;


--
-- Name: cc_speeddial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_speeddial (
    id bigint NOT NULL,
    id_cc_card bigint DEFAULT 0 NOT NULL,
    phone text NOT NULL,
    name text NOT NULL,
    speeddial integer DEFAULT 0,
    creationdate timestamp without time zone DEFAULT now()
);


--
-- Name: cc_speeddial_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_speeddial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_speeddial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_speeddial_id_seq OWNED BY public.cc_speeddial.id;


--
-- Name: cc_status_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_status_log (
    id bigint NOT NULL,
    status integer NOT NULL,
    id_cc_card bigint NOT NULL,
    updated_date timestamp without time zone DEFAULT now()
);


--
-- Name: cc_status_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_status_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_status_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_status_log_id_seq OWNED BY public.cc_status_log.id;


--
-- Name: cc_subscription_service; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_subscription_service (
    id bigint NOT NULL,
    label character varying(200) NOT NULL,
    fee numeric(12,4) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    numberofrun integer DEFAULT 0 NOT NULL,
    datecreate timestamp(0) without time zone DEFAULT now(),
    datelastrun timestamp(0) without time zone DEFAULT now(),
    emailreport character varying(100) NOT NULL,
    totalcredit double precision DEFAULT 0 NOT NULL,
    totalcardperform integer DEFAULT 0 NOT NULL,
    startdate timestamp without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone NOT NULL,
    stopdate timestamp without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone NOT NULL
);


--
-- Name: cc_subscription_fee_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_subscription_fee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_subscription_fee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_subscription_fee_id_seq OWNED BY public.cc_subscription_service.id;


--
-- Name: cc_subscription_signup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_subscription_signup (
    id bigint NOT NULL,
    label character varying(50) NOT NULL,
    id_subscription bigint,
    description character varying(500) DEFAULT NULL::character varying,
    enable smallint DEFAULT '1'::smallint NOT NULL,
    id_callplan bigint
);


--
-- Name: cc_subscription_signup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_subscription_signup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_subscription_signup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_subscription_signup_id_seq OWNED BY public.cc_subscription_signup.id;


--
-- Name: cc_support; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_support (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(70),
    language character(5) DEFAULT 'en'::bpchar NOT NULL
);


--
-- Name: cc_support_component; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_support_component (
    id integer NOT NULL,
    id_support integer NOT NULL,
    name character varying(50) DEFAULT ''::character varying NOT NULL,
    activated smallint DEFAULT 1 NOT NULL,
    type_user smallint DEFAULT '2'::smallint NOT NULL
);


--
-- Name: cc_support_component_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_support_component_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_support_component_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_support_component_id_seq OWNED BY public.cc_support_component.id;


--
-- Name: cc_support_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_support_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_support_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_support_id_seq OWNED BY public.cc_support.id;


--
-- Name: cc_system_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_system_log (
    id bigint NOT NULL,
    iduser integer DEFAULT 0 NOT NULL,
    loglevel integer DEFAULT 0 NOT NULL,
    action text NOT NULL,
    description text,
    data text,
    tablename character varying(255),
    pagename character varying(255),
    ipaddress character varying(255),
    creationdate timestamp(0) without time zone DEFAULT now(),
    agent smallint DEFAULT 0
);


--
-- Name: cc_system_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_system_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_system_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_system_log_id_seq OWNED BY public.cc_system_log.id;


--
-- Name: cc_tariffgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_tariffgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_tariffgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_tariffgroup_id_seq OWNED BY public.cc_tariffgroup.id;


--
-- Name: cc_tariffplan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_tariffplan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_tariffplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_tariffplan_id_seq OWNED BY public.cc_tariffplan.id;


--
-- Name: cc_templatemail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_templatemail (
    id integer NOT NULL,
    mailtype text,
    fromemail text,
    fromname text,
    subject character varying(130) DEFAULT NULL::character varying,
    messagetext character varying(3000) DEFAULT NULL::character varying,
    messagehtml character varying(3000) DEFAULT NULL::character varying,
    id_language character varying(20) DEFAULT 'en'::character varying
);


--
-- Name: cc_templatemail_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_templatemail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_templatemail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_templatemail_id_seq OWNED BY public.cc_templatemail.id;


--
-- Name: cc_ticket; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_ticket (
    id bigint NOT NULL,
    id_component integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    priority smallint DEFAULT 0 NOT NULL,
    creationdate timestamp without time zone DEFAULT now() NOT NULL,
    creator bigint NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    creator_type smallint DEFAULT '0'::smallint NOT NULL,
    viewed_cust smallint DEFAULT '1'::smallint NOT NULL,
    viewed_agent smallint DEFAULT '1'::smallint NOT NULL,
    viewed_admin smallint DEFAULT '1'::smallint NOT NULL
);


--
-- Name: cc_ticket_comment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_ticket_comment (
    id bigint NOT NULL,
    date timestamp without time zone DEFAULT now() NOT NULL,
    id_ticket bigint NOT NULL,
    description text,
    creator bigint NOT NULL,
    creator_type smallint DEFAULT '0'::smallint NOT NULL,
    viewed_cust smallint DEFAULT '1'::smallint NOT NULL,
    viewed_agent smallint DEFAULT '1'::smallint NOT NULL,
    viewed_admin smallint DEFAULT '1'::smallint NOT NULL
);


--
-- Name: cc_ticket_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_ticket_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_ticket_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_ticket_comment_id_seq OWNED BY public.cc_ticket_comment.id;


--
-- Name: cc_ticket_comment_id_ticket_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_ticket_comment_id_ticket_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_ticket_comment_id_ticket_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_ticket_comment_id_ticket_seq OWNED BY public.cc_ticket_comment.id_ticket;


--
-- Name: cc_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_ticket_id_seq OWNED BY public.cc_ticket.id;


--
-- Name: cc_timezone; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_timezone (
    id integer NOT NULL,
    gmtzone character varying(255),
    gmttime character varying(255),
    gmtoffset bigint DEFAULT 0 NOT NULL
);


--
-- Name: cc_timezone_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_timezone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_timezone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_timezone_id_seq OWNED BY public.cc_timezone.id;


--
-- Name: cc_trunk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_trunk (
    id_trunk integer NOT NULL,
    trunkcode character varying(50) NOT NULL,
    trunkprefix text,
    providertech text NOT NULL,
    providerip text NOT NULL,
    removeprefix text,
    secondusedreal integer DEFAULT 0,
    secondusedcarrier integer DEFAULT 0,
    secondusedratecard integer DEFAULT 0,
    creationdate timestamp(0) without time zone DEFAULT now(),
    failover_trunk integer,
    addparameter text,
    id_provider integer,
    inuse integer DEFAULT 0,
    maxuse integer DEFAULT '-1'::integer,
    status integer DEFAULT 1,
    if_max_use integer DEFAULT 0
);


--
-- Name: cc_trunk_id_trunk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_trunk_id_trunk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_trunk_id_trunk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_trunk_id_trunk_seq OWNED BY public.cc_trunk.id_trunk;


--
-- Name: cc_ui_authen; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_ui_authen (
    userid bigint NOT NULL,
    login text NOT NULL,
    pwd_encoded text NOT NULL,
    groupid integer,
    perms integer,
    confaddcust integer,
    name text,
    direction text,
    zipcode text,
    state text,
    phone text,
    fax text,
    email character varying(70),
    datecreation timestamp without time zone DEFAULT now(),
    country character varying(40),
    city character varying(40)
);


--
-- Name: cc_ui_authen_userid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_ui_authen_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_ui_authen_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_ui_authen_userid_seq OWNED BY public.cc_ui_authen.userid;


--
-- Name: cc_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_version (
    version character varying(30) NOT NULL
);


--
-- Name: cc_voucher; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_voucher (
    id bigint NOT NULL,
    creationdate timestamp without time zone DEFAULT now(),
    usedate timestamp without time zone,
    expirationdate timestamp without time zone,
    voucher text NOT NULL,
    usedcardnumber text,
    tag text,
    credit numeric(12,4) NOT NULL,
    activated boolean DEFAULT true NOT NULL,
    used integer DEFAULT 0,
    currency character varying(3) DEFAULT 'USD'::character varying
);


--
-- Name: cc_voucher_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cc_voucher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_voucher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cc_voucher_id_seq OWNED BY public.cc_voucher.id;


--
-- Name: cc_agent id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_agent ALTER COLUMN id SET DEFAULT nextval('public.cc_agent_id_seq'::regclass);


--
-- Name: cc_agent_commission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_agent_commission ALTER COLUMN id SET DEFAULT nextval('public.cc_agent_commission_id_seq'::regclass);


--
-- Name: cc_agent_signup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_agent_signup ALTER COLUMN id SET DEFAULT nextval('public.cc_agent_signup_id_seq'::regclass);


--
-- Name: cc_alarm id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_alarm ALTER COLUMN id SET DEFAULT nextval('public.cc_alarm_id_seq'::regclass);


--
-- Name: cc_alarm_report id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_alarm_report ALTER COLUMN id SET DEFAULT nextval('public.cc_alarm_report_id_seq'::regclass);


--
-- Name: cc_autorefill_report id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_autorefill_report ALTER COLUMN id SET DEFAULT nextval('public.cc_autorefill_report_id_seq'::regclass);


--
-- Name: cc_backup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_backup ALTER COLUMN id SET DEFAULT nextval('public.cc_backup_id_seq'::regclass);


--
-- Name: cc_billing_customer id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_billing_customer ALTER COLUMN id SET DEFAULT nextval('public.cc_billing_customer_id_seq'::regclass);


--
-- Name: cc_call id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_call ALTER COLUMN id SET DEFAULT nextval('public.cc_call_id_seq'::regclass);


--
-- Name: cc_call_archive id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_call_archive ALTER COLUMN id SET DEFAULT nextval('public.cc_call_archive_id_seq'::regclass);


--
-- Name: cc_callback_spool id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_callback_spool ALTER COLUMN id SET DEFAULT nextval('public.cc_callback_spool_id_seq'::regclass);


--
-- Name: cc_callerid id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_callerid ALTER COLUMN id SET DEFAULT nextval('public.cc_callerid_id_seq'::regclass);


--
-- Name: cc_campaign id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_campaign ALTER COLUMN id SET DEFAULT nextval('public.cc_campaign_id_seq'::regclass);


--
-- Name: cc_campaign_config id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_campaign_config ALTER COLUMN id SET DEFAULT nextval('public.cc_campaign_config_id_seq'::regclass);


--
-- Name: cc_card id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card ALTER COLUMN id SET DEFAULT nextval('public.cc_card_id_seq'::regclass);


--
-- Name: cc_card_archive id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_archive ALTER COLUMN id SET DEFAULT nextval('public.cc_card_archive_id_seq'::regclass);


--
-- Name: cc_card_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_group ALTER COLUMN id SET DEFAULT nextval('public.cc_card_group_id_seq'::regclass);


--
-- Name: cc_card_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_history ALTER COLUMN id SET DEFAULT nextval('public.cc_card_history_id_seq'::regclass);


--
-- Name: cc_card_package_offer id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_package_offer ALTER COLUMN id SET DEFAULT nextval('public.cc_card_package_offer_id_seq'::regclass);


--
-- Name: cc_card_seria id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_seria ALTER COLUMN id SET DEFAULT nextval('public.cc_card_seria_id_seq'::regclass);


--
-- Name: cc_card_subscription id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_subscription ALTER COLUMN id SET DEFAULT nextval('public.cc_card_subscription_id_seq'::regclass);


--
-- Name: cc_charge id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_charge ALTER COLUMN id SET DEFAULT nextval('public.cc_charge_id_seq'::regclass);


--
-- Name: cc_config id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_config ALTER COLUMN id SET DEFAULT nextval('public.cc_config_id_seq'::regclass);


--
-- Name: cc_config_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_config_group ALTER COLUMN id SET DEFAULT nextval('public.cc_config_group_id_seq'::regclass);


--
-- Name: cc_configuration configuration_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_configuration ALTER COLUMN configuration_id SET DEFAULT nextval('public.cc_configuration_configuration_id_seq'::regclass);


--
-- Name: cc_country id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_country ALTER COLUMN id SET DEFAULT nextval('public.cc_country_id_seq'::regclass);


--
-- Name: cc_currencies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_currencies ALTER COLUMN id SET DEFAULT nextval('public.cc_currencies_id_seq'::regclass);


--
-- Name: cc_did id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_did ALTER COLUMN id SET DEFAULT nextval('public.cc_did_id_seq'::regclass);


--
-- Name: cc_did_destination id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_did_destination ALTER COLUMN id SET DEFAULT nextval('public.cc_did_destination_id_seq'::regclass);


--
-- Name: cc_did_use id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_did_use ALTER COLUMN id SET DEFAULT nextval('public.cc_did_use_id_seq'::regclass);


--
-- Name: cc_didgroup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_didgroup ALTER COLUMN id SET DEFAULT nextval('public.cc_didgroup_id_seq'::regclass);


--
-- Name: cc_epayment_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_epayment_log ALTER COLUMN id SET DEFAULT nextval('public.cc_epayment_log_id_seq'::regclass);


--
-- Name: cc_epayment_log_agent id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_epayment_log_agent ALTER COLUMN id SET DEFAULT nextval('public.cc_epayment_log_agent_id_seq'::regclass);


--
-- Name: cc_iax_buddies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_iax_buddies ALTER COLUMN id SET DEFAULT nextval('public._cc_iax_buddies_id_seq'::regclass);


--
-- Name: cc_invoice id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_invoice ALTER COLUMN id SET DEFAULT nextval('public.cc_invoice_id_seq'::regclass);


--
-- Name: cc_invoice_conf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_invoice_conf ALTER COLUMN id SET DEFAULT nextval('public.cc_invoice_conf_id_seq'::regclass);


--
-- Name: cc_invoice_item id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_invoice_item ALTER COLUMN id SET DEFAULT nextval('public.cc_invoice_item_id_seq'::regclass);


--
-- Name: cc_logpayment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_logpayment ALTER COLUMN id SET DEFAULT nextval('public.cc_logpayment_id_seq'::regclass);


--
-- Name: cc_logpayment_agent id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_logpayment_agent ALTER COLUMN id SET DEFAULT nextval('public.cc_logpayment_agent_id_seq'::regclass);


--
-- Name: cc_logrefill id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_logrefill ALTER COLUMN id SET DEFAULT nextval('public.cc_logrefill_id_seq'::regclass);


--
-- Name: cc_logrefill_agent id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_logrefill_agent ALTER COLUMN id SET DEFAULT nextval('public.cc_logrefill_agent_id_seq'::regclass);


--
-- Name: cc_message_agent id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_message_agent ALTER COLUMN id SET DEFAULT nextval('public.cc_message_agent_id_seq'::regclass);


--
-- Name: cc_monitor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_monitor ALTER COLUMN id SET DEFAULT nextval('public.cc_monitor_id_seq'::regclass);


--
-- Name: cc_notification id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_notification ALTER COLUMN id SET DEFAULT nextval('public.cc_notification_id_seq'::regclass);


--
-- Name: cc_outbound_cid_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_outbound_cid_group ALTER COLUMN id SET DEFAULT nextval('public.cc_outbound_cid_group_id_seq'::regclass);


--
-- Name: cc_outbound_cid_list id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_outbound_cid_list ALTER COLUMN id SET DEFAULT nextval('public.cc_outbound_cid_list_id_seq'::regclass);


--
-- Name: cc_package_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_package_group ALTER COLUMN id SET DEFAULT nextval('public.cc_package_group_id_seq'::regclass);


--
-- Name: cc_package_offer id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_package_offer ALTER COLUMN id SET DEFAULT nextval('public.cc_package_offer_id_seq'::regclass);


--
-- Name: cc_payment_methods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_payment_methods ALTER COLUMN id SET DEFAULT nextval('public.cc_payment_methods_id_seq'::regclass);


--
-- Name: cc_payments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_payments ALTER COLUMN id SET DEFAULT nextval('public.cc_payments_id_seq'::regclass);


--
-- Name: cc_payments_agent id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_payments_agent ALTER COLUMN id SET DEFAULT nextval('public.cc_payments_agent_id_seq'::regclass);


--
-- Name: cc_payments_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_payments_status ALTER COLUMN id SET DEFAULT nextval('public.cc_payments_status_id_seq'::regclass);


--
-- Name: cc_paypal id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_paypal ALTER COLUMN id SET DEFAULT nextval('public.cc_paypal_id_seq'::regclass);


--
-- Name: cc_phonebook id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_phonebook ALTER COLUMN id SET DEFAULT nextval('public.cc_phonebook_id_seq'::regclass);


--
-- Name: cc_phonenumber id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_phonenumber ALTER COLUMN id SET DEFAULT nextval('public.cc_phonenumber_id_seq'::regclass);


--
-- Name: cc_prefix prefix; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_prefix ALTER COLUMN prefix SET DEFAULT nextval('public.cc_prefix_prefix_seq'::regclass);


--
-- Name: cc_provider id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_provider ALTER COLUMN id SET DEFAULT nextval('public.cc_provider_id_seq'::regclass);


--
-- Name: cc_ratecard id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_ratecard ALTER COLUMN id SET DEFAULT nextval('public.cc_ratecard_id_seq'::regclass);


--
-- Name: cc_receipt id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_receipt ALTER COLUMN id SET DEFAULT nextval('public.cc_receipt_id_seq'::regclass);


--
-- Name: cc_receipt_item id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_receipt_item ALTER COLUMN id SET DEFAULT nextval('public.cc_receipt_item_id_seq'::regclass);


--
-- Name: cc_remittance_request id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_remittance_request ALTER COLUMN id SET DEFAULT nextval('public.cc_remittance_request_id_seq'::regclass);


--
-- Name: cc_restricted_phonenumber id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_restricted_phonenumber ALTER COLUMN id SET DEFAULT nextval('public.cc_restricted_phonenumber_id_seq'::regclass);


--
-- Name: cc_server_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_server_group ALTER COLUMN id SET DEFAULT nextval('public.cc_server_group_id_seq'::regclass);


--
-- Name: cc_server_manager id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_server_manager ALTER COLUMN id SET DEFAULT nextval('public.cc_server_manager_id_seq'::regclass);


--
-- Name: cc_service id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_service ALTER COLUMN id SET DEFAULT nextval('public.cc_service_id_seq'::regclass);


--
-- Name: cc_service_report id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_service_report ALTER COLUMN id SET DEFAULT nextval('public.cc_service_report_id_seq'::regclass);


--
-- Name: cc_sip_buddies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_sip_buddies ALTER COLUMN id SET DEFAULT nextval('public._cc_sip_buddies_id_seq'::regclass);


--
-- Name: cc_speeddial id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_speeddial ALTER COLUMN id SET DEFAULT nextval('public.cc_speeddial_id_seq'::regclass);


--
-- Name: cc_status_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_status_log ALTER COLUMN id SET DEFAULT nextval('public.cc_status_log_id_seq'::regclass);


--
-- Name: cc_subscription_service id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_subscription_service ALTER COLUMN id SET DEFAULT nextval('public.cc_subscription_fee_id_seq'::regclass);


--
-- Name: cc_subscription_signup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_subscription_signup ALTER COLUMN id SET DEFAULT nextval('public.cc_subscription_signup_id_seq'::regclass);


--
-- Name: cc_support id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_support ALTER COLUMN id SET DEFAULT nextval('public.cc_support_id_seq'::regclass);


--
-- Name: cc_support_component id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_support_component ALTER COLUMN id SET DEFAULT nextval('public.cc_support_component_id_seq'::regclass);


--
-- Name: cc_system_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_system_log ALTER COLUMN id SET DEFAULT nextval('public.cc_system_log_id_seq'::regclass);


--
-- Name: cc_tariffgroup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_tariffgroup ALTER COLUMN id SET DEFAULT nextval('public.cc_tariffgroup_id_seq'::regclass);


--
-- Name: cc_tariffplan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_tariffplan ALTER COLUMN id SET DEFAULT nextval('public.cc_tariffplan_id_seq'::regclass);


--
-- Name: cc_templatemail id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_templatemail ALTER COLUMN id SET DEFAULT nextval('public.cc_templatemail_id_seq'::regclass);


--
-- Name: cc_ticket id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_ticket ALTER COLUMN id SET DEFAULT nextval('public.cc_ticket_id_seq'::regclass);


--
-- Name: cc_ticket_comment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_ticket_comment ALTER COLUMN id SET DEFAULT nextval('public.cc_ticket_comment_id_seq'::regclass);


--
-- Name: cc_ticket_comment id_ticket; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_ticket_comment ALTER COLUMN id_ticket SET DEFAULT nextval('public.cc_ticket_comment_id_ticket_seq'::regclass);


--
-- Name: cc_timezone id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_timezone ALTER COLUMN id SET DEFAULT nextval('public.cc_timezone_id_seq'::regclass);


--
-- Name: cc_trunk id_trunk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_trunk ALTER COLUMN id_trunk SET DEFAULT nextval('public.cc_trunk_id_trunk_seq'::regclass);


--
-- Name: cc_ui_authen userid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_ui_authen ALTER COLUMN userid SET DEFAULT nextval('public.cc_ui_authen_userid_seq'::regclass);


--
-- Name: cc_voucher id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_voucher ALTER COLUMN id SET DEFAULT nextval('public.cc_voucher_id_seq'::regclass);


--
-- Name: cc_iax_buddies _cc_iax_buddies_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_iax_buddies
    ADD CONSTRAINT _cc_iax_buddies_name_key UNIQUE (name);


--
-- Name: cc_sip_buddies _cc_sip_buddies_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_sip_buddies
    ADD CONSTRAINT _cc_sip_buddies_name_key UNIQUE (name);


--
-- Name: cc_agent_commission cc_agent_commission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_agent_commission
    ADD CONSTRAINT cc_agent_commission_pkey PRIMARY KEY (id);


--
-- Name: cc_agent cc_agent_login_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_agent
    ADD CONSTRAINT cc_agent_login_key UNIQUE (login);


--
-- Name: cc_agent cc_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_agent
    ADD CONSTRAINT cc_agent_pkey PRIMARY KEY (id);


--
-- Name: cc_agent_signup cc_agent_signup_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_agent_signup
    ADD CONSTRAINT cc_agent_signup_code_key UNIQUE (code);


--
-- Name: cc_agent_signup cc_agent_signup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_agent_signup
    ADD CONSTRAINT cc_agent_signup_pkey PRIMARY KEY (id);


--
-- Name: cc_agent_tariffgroup cc_agent_tariffgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_agent_tariffgroup
    ADD CONSTRAINT cc_agent_tariffgroup_pkey PRIMARY KEY (id_agent, id_tariffgroup);


--
-- Name: cc_alarm cc_alarm_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_alarm
    ADD CONSTRAINT cc_alarm_pkey PRIMARY KEY (id);


--
-- Name: cc_alarm_report cc_alarm_report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_alarm_report
    ADD CONSTRAINT cc_alarm_report_pkey PRIMARY KEY (id);


--
-- Name: cc_autorefill_report cc_autorefill_report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_autorefill_report
    ADD CONSTRAINT cc_autorefill_report_pkey PRIMARY KEY (id);


--
-- Name: cc_backup cc_backup_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_backup
    ADD CONSTRAINT cc_backup_name_key UNIQUE (name);


--
-- Name: cc_backup cc_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_backup
    ADD CONSTRAINT cc_backup_pkey PRIMARY KEY (id);


--
-- Name: cc_billing_customer cc_billing_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_billing_customer
    ADD CONSTRAINT cc_billing_customer_pkey PRIMARY KEY (id);


--
-- Name: cc_call_archive cc_call_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_call_archive
    ADD CONSTRAINT cc_call_archive_pkey PRIMARY KEY (id);


--
-- Name: cc_call cc_call_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_call
    ADD CONSTRAINT cc_call_pkey PRIMARY KEY (id);


--
-- Name: cc_callback_spool cc_callback_spool_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_callback_spool
    ADD CONSTRAINT cc_callback_spool_pkey PRIMARY KEY (id);


--
-- Name: cc_callback_spool cc_callback_spool_uniqueid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_callback_spool
    ADD CONSTRAINT cc_callback_spool_uniqueid_key UNIQUE (uniqueid);


--
-- Name: cc_callerid cc_callerid_cid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_callerid
    ADD CONSTRAINT cc_callerid_cid_key UNIQUE (cid);


--
-- Name: cc_callerid cc_callerid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_callerid
    ADD CONSTRAINT cc_callerid_pkey PRIMARY KEY (id);


--
-- Name: cc_campaign_config cc_campaign_config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_campaign_config
    ADD CONSTRAINT cc_campaign_config_pkey PRIMARY KEY (id);


--
-- Name: cc_campaign cc_campaign_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_campaign
    ADD CONSTRAINT cc_campaign_name_key UNIQUE (name);


--
-- Name: cc_campaign_phonebook cc_campaign_phonebook_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_campaign_phonebook
    ADD CONSTRAINT cc_campaign_phonebook_pkey PRIMARY KEY (id_campaign, id_phonebook);


--
-- Name: cc_campaign_phonestatus cc_campaign_phonestatus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_campaign_phonestatus
    ADD CONSTRAINT cc_campaign_phonestatus_pkey PRIMARY KEY (id_phonenumber, id_campaign);


--
-- Name: cc_campaign cc_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_campaign
    ADD CONSTRAINT cc_campaign_pkey PRIMARY KEY (id);


--
-- Name: cc_campaignconf_cardgroup cc_campaignconf_cardgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_campaignconf_cardgroup
    ADD CONSTRAINT cc_campaignconf_cardgroup_pkey PRIMARY KEY (id_campaign_config, id_card_group);


--
-- Name: cc_card_archive cc_card_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_archive
    ADD CONSTRAINT cc_card_archive_pkey PRIMARY KEY (id);


--
-- Name: cc_card_archive cc_card_archive_useralias_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_archive
    ADD CONSTRAINT cc_card_archive_useralias_key UNIQUE (useralias);


--
-- Name: cc_card_archive cc_card_archive_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_archive
    ADD CONSTRAINT cc_card_archive_username_key UNIQUE (username);


--
-- Name: cc_card_group cc_card_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_group
    ADD CONSTRAINT cc_card_group_pkey PRIMARY KEY (id);


--
-- Name: cc_card_history cc_card_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_history
    ADD CONSTRAINT cc_card_history_pkey PRIMARY KEY (id);


--
-- Name: cc_card cc_card_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card
    ADD CONSTRAINT cc_card_pkey PRIMARY KEY (id);


--
-- Name: cc_card_seria cc_card_seria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_seria
    ADD CONSTRAINT cc_card_seria_pkey PRIMARY KEY (id);


--
-- Name: cc_card_subscription cc_card_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card_subscription
    ADD CONSTRAINT cc_card_subscription_pkey PRIMARY KEY (id);


--
-- Name: cc_card cc_card_useralias_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card
    ADD CONSTRAINT cc_card_useralias_key UNIQUE (useralias);


--
-- Name: cc_card cc_card_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_card
    ADD CONSTRAINT cc_card_username_key UNIQUE (username);


--
-- Name: cc_charge cc_charge_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_charge
    ADD CONSTRAINT cc_charge_pkey PRIMARY KEY (id);


--
-- Name: cc_config_group cc_config_group_group_title_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_config_group
    ADD CONSTRAINT cc_config_group_group_title_key UNIQUE (group_title);


--
-- Name: cc_config_group cc_config_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_config_group
    ADD CONSTRAINT cc_config_group_pkey PRIMARY KEY (id);


--
-- Name: cc_config cc_config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_config
    ADD CONSTRAINT cc_config_pkey PRIMARY KEY (id);


--
-- Name: cc_configuration cc_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_configuration
    ADD CONSTRAINT cc_configuration_pkey PRIMARY KEY (configuration_id);


--
-- Name: cc_country cc_country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_country
    ADD CONSTRAINT cc_country_pkey PRIMARY KEY (id);


--
-- Name: cc_currencies cc_currencies_currency_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_currencies
    ADD CONSTRAINT cc_currencies_currency_key UNIQUE (currency);


--
-- Name: cc_currencies cc_currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_currencies
    ADD CONSTRAINT cc_currencies_pkey PRIMARY KEY (id);


--
-- Name: cc_did_destination cc_did_destination_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_did_destination
    ADD CONSTRAINT cc_did_destination_pkey PRIMARY KEY (id);


--
-- Name: cc_did cc_did_did_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_did
    ADD CONSTRAINT cc_did_did_key UNIQUE (did);


--
-- Name: cc_did cc_did_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_did
    ADD CONSTRAINT cc_did_pkey PRIMARY KEY (id);


--
-- Name: cc_did cc_did_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_did
    ADD CONSTRAINT cc_did_uniq UNIQUE (did);


--
-- Name: cc_did_use cc_did_use_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_did_use
    ADD CONSTRAINT cc_did_use_pkey PRIMARY KEY (id);


--
-- Name: cc_didgroup cc_didgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_didgroup
    ADD CONSTRAINT cc_didgroup_pkey PRIMARY KEY (id);


--
-- Name: cc_epayment_log_agent cc_epayment_log_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_epayment_log_agent
    ADD CONSTRAINT cc_epayment_log_agent_pkey PRIMARY KEY (id);


--
-- Name: cc_epayment_log cc_epayment_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_epayment_log
    ADD CONSTRAINT cc_epayment_log_pkey PRIMARY KEY (id);


--
-- Name: cc_iax_buddies cc_iax_buddies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_iax_buddies
    ADD CONSTRAINT cc_iax_buddies_pkey PRIMARY KEY (id);


--
-- Name: cc_invoice_conf cc_invoice_conf_key_val_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_invoice_conf
    ADD CONSTRAINT cc_invoice_conf_key_val_key UNIQUE (key_val);


--
-- Name: cc_invoice_conf cc_invoice_conf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_invoice_conf
    ADD CONSTRAINT cc_invoice_conf_pkey PRIMARY KEY (id);


--
-- Name: cc_invoice_item cc_invoice_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_invoice_item
    ADD CONSTRAINT cc_invoice_item_pkey PRIMARY KEY (id);


--
-- Name: cc_invoice_payment cc_invoice_payment_id_payment_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_invoice_payment
    ADD CONSTRAINT cc_invoice_payment_id_payment_key UNIQUE (id_payment);


--
-- Name: cc_invoice_payment cc_invoice_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_invoice_payment
    ADD CONSTRAINT cc_invoice_payment_pkey PRIMARY KEY (id_invoice, id_payment);


--
-- Name: cc_invoice cc_invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_invoice
    ADD CONSTRAINT cc_invoice_pkey PRIMARY KEY (id);


--
-- Name: cc_invoice cc_invoice_reference_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_invoice
    ADD CONSTRAINT cc_invoice_reference_key UNIQUE (reference);


--
-- Name: cc_iso639 cc_iso639_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_iso639
    ADD CONSTRAINT cc_iso639_name_key UNIQUE (name);


--
-- Name: cc_iso639 cc_iso639_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_iso639
    ADD CONSTRAINT cc_iso639_pkey PRIMARY KEY (code);


--
-- Name: cc_logpayment_agent cc_logpayment_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_logpayment_agent
    ADD CONSTRAINT cc_logpayment_agent_pkey PRIMARY KEY (id);


--
-- Name: cc_logpayment cc_logpayment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_logpayment
    ADD CONSTRAINT cc_logpayment_pkey PRIMARY KEY (id);


--
-- Name: cc_logrefill_agent cc_logrefill_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_logrefill_agent
    ADD CONSTRAINT cc_logrefill_agent_pkey PRIMARY KEY (id);


--
-- Name: cc_logrefill cc_logrefill_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_logrefill
    ADD CONSTRAINT cc_logrefill_pkey PRIMARY KEY (id);


--
-- Name: cc_message_agent cc_message_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_message_agent
    ADD CONSTRAINT cc_message_agent_pkey PRIMARY KEY (id);


--
-- Name: cc_monitor cc_monitor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_monitor
    ADD CONSTRAINT cc_monitor_pkey PRIMARY KEY (id);


--
-- Name: cc_notification_admin cc_notification_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_notification_admin
    ADD CONSTRAINT cc_notification_admin_pkey PRIMARY KEY (id_notification, id_admin);


--
-- Name: cc_notification cc_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_notification
    ADD CONSTRAINT cc_notification_pkey PRIMARY KEY (id);


--
-- Name: cc_outbound_cid_group cc_outbound_cid_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_outbound_cid_group
    ADD CONSTRAINT cc_outbound_cid_group_pkey PRIMARY KEY (id);


--
-- Name: cc_outbound_cid_list cc_outbound_cid_list_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_outbound_cid_list
    ADD CONSTRAINT cc_outbound_cid_list_pkey PRIMARY KEY (id);


--
-- Name: cc_package_group cc_package_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_package_group
    ADD CONSTRAINT cc_package_group_pkey PRIMARY KEY (id);


--
-- Name: cc_package_rate cc_package_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_package_rate
    ADD CONSTRAINT cc_package_rate_pkey PRIMARY KEY (package_id, rate_id);


--
-- Name: cc_packgroup_package cc_packgroup_package_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_packgroup_package
    ADD CONSTRAINT cc_packgroup_package_pkey PRIMARY KEY (packagegroup_id, package_id);


--
-- Name: cc_payment_methods cc_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_payment_methods
    ADD CONSTRAINT cc_payment_methods_pkey PRIMARY KEY (id);


--
-- Name: cc_payments_agent cc_payments_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_payments_agent
    ADD CONSTRAINT cc_payments_agent_pkey PRIMARY KEY (id);


--
-- Name: cc_payments cc_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_payments
    ADD CONSTRAINT cc_payments_pkey PRIMARY KEY (id);


--
-- Name: cc_payments_status cc_payments_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_payments_status
    ADD CONSTRAINT cc_payments_status_pkey PRIMARY KEY (id);


--
-- Name: cc_paypal cc_paypal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_paypal
    ADD CONSTRAINT cc_paypal_pkey PRIMARY KEY (id);


--
-- Name: cc_paypal cc_paypal_txn_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_paypal
    ADD CONSTRAINT cc_paypal_txn_id_key UNIQUE (txn_id);


--
-- Name: cc_phonebook cc_phonebook_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_phonebook
    ADD CONSTRAINT cc_phonebook_pkey PRIMARY KEY (id);


--
-- Name: cc_phonenumber cc_phonenumber_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_phonenumber
    ADD CONSTRAINT cc_phonenumber_pkey PRIMARY KEY (id);


--
-- Name: cc_prefix cc_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_prefix
    ADD CONSTRAINT cc_prefix_pkey PRIMARY KEY (prefix);


--
-- Name: cc_provider cc_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_provider
    ADD CONSTRAINT cc_provider_pkey PRIMARY KEY (id);


--
-- Name: cc_provider cc_provider_provider_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_provider
    ADD CONSTRAINT cc_provider_provider_name_key UNIQUE (provider_name);


--
-- Name: cc_ratecard cc_ratecard_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_ratecard
    ADD CONSTRAINT cc_ratecard_pkey PRIMARY KEY (id);


--
-- Name: cc_receipt_item cc_receipt_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_receipt_item
    ADD CONSTRAINT cc_receipt_item_pkey PRIMARY KEY (id);


--
-- Name: cc_receipt cc_receipt_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_receipt
    ADD CONSTRAINT cc_receipt_pkey PRIMARY KEY (id);


--
-- Name: cc_remittance_request cc_remittance_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_remittance_request
    ADD CONSTRAINT cc_remittance_request_pkey PRIMARY KEY (id);


--
-- Name: cc_restricted_phonenumber cc_restricted_phonenumber_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_restricted_phonenumber
    ADD CONSTRAINT cc_restricted_phonenumber_pkey PRIMARY KEY (id);


--
-- Name: cc_server_group cc_server_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_server_group
    ADD CONSTRAINT cc_server_group_pkey PRIMARY KEY (id);


--
-- Name: cc_server_manager cc_server_manager_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_server_manager
    ADD CONSTRAINT cc_server_manager_pkey PRIMARY KEY (id);


--
-- Name: cc_service cc_service_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_service
    ADD CONSTRAINT cc_service_pkey PRIMARY KEY (id);


--
-- Name: cc_service_report cc_service_report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_service_report
    ADD CONSTRAINT cc_service_report_pkey PRIMARY KEY (id);


--
-- Name: cc_sip_buddies cc_sip_buddies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_sip_buddies
    ADD CONSTRAINT cc_sip_buddies_pkey PRIMARY KEY (id);


--
-- Name: cc_speeddial cc_speeddial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_speeddial
    ADD CONSTRAINT cc_speeddial_pkey PRIMARY KEY (id);


--
-- Name: cc_status_log cc_status_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_status_log
    ADD CONSTRAINT cc_status_log_pkey PRIMARY KEY (id);


--
-- Name: cc_subscription_service cc_subscription_fee_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_subscription_service
    ADD CONSTRAINT cc_subscription_fee_pkey PRIMARY KEY (id);


--
-- Name: cc_subscription_signup cc_subscription_signup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_subscription_signup
    ADD CONSTRAINT cc_subscription_signup_pkey PRIMARY KEY (id);


--
-- Name: cc_support_component cc_support_component_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_support_component
    ADD CONSTRAINT cc_support_component_pkey PRIMARY KEY (id);


--
-- Name: cc_support cc_support_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_support
    ADD CONSTRAINT cc_support_pkey PRIMARY KEY (id);


--
-- Name: cc_system_log cc_system_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_system_log
    ADD CONSTRAINT cc_system_log_pkey PRIMARY KEY (id);


--
-- Name: cc_tariffgroup cc_tariffgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_tariffgroup
    ADD CONSTRAINT cc_tariffgroup_pkey PRIMARY KEY (id);


--
-- Name: cc_tariffgroup_plan cc_tariffgroup_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_tariffgroup_plan
    ADD CONSTRAINT cc_tariffgroup_plan_pkey PRIMARY KEY (idtariffgroup, idtariffplan);


--
-- Name: cc_tariffplan cc_tariffplan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_tariffplan
    ADD CONSTRAINT cc_tariffplan_pkey PRIMARY KEY (id);


--
-- Name: cc_templatemail cc_templatemail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_templatemail
    ADD CONSTRAINT cc_templatemail_pkey PRIMARY KEY (id);


--
-- Name: cc_ticket_comment cc_ticket_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_ticket_comment
    ADD CONSTRAINT cc_ticket_comment_pkey PRIMARY KEY (id);


--
-- Name: cc_ticket cc_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_ticket
    ADD CONSTRAINT cc_ticket_pkey PRIMARY KEY (id);


--
-- Name: cc_timezone cc_timezone_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_timezone
    ADD CONSTRAINT cc_timezone_pkey PRIMARY KEY (id);


--
-- Name: cc_trunk cc_trunk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_trunk
    ADD CONSTRAINT cc_trunk_pkey PRIMARY KEY (id_trunk);


--
-- Name: cc_ui_authen cc_ui_authen_login_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_ui_authen
    ADD CONSTRAINT cc_ui_authen_login_key UNIQUE (login);


--
-- Name: cc_ui_authen cc_ui_authen_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_ui_authen
    ADD CONSTRAINT cc_ui_authen_pkey PRIMARY KEY (userid);


--
-- Name: cc_voucher cc_voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_voucher
    ADD CONSTRAINT cc_voucher_pkey PRIMARY KEY (id);


--
-- Name: cc_voucher cc_voucher_voucher_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_voucher
    ADD CONSTRAINT cc_voucher_voucher_key UNIQUE (voucher);


--
-- Name: cc_cardgroup_service cons_cc_cardgroup_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_cardgroup_service
    ADD CONSTRAINT cons_cc_cardgroup_unique UNIQUE (id_card_group, id_service);


--
-- Name: cc_speeddial cons_cc_speeddial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_speeddial
    ADD CONSTRAINT cons_cc_speeddial_pkey UNIQUE (id_cc_card, speeddial);


--
-- Name: cc_templatemail cons_cc_templatemail_mailtype; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_templatemail
    ADD CONSTRAINT cons_cc_templatemail_mailtype UNIQUE (mailtype, id_language);


--
-- Name: cc_tariffplan cons_iduser_tariffname; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_tariffplan
    ADD CONSTRAINT cons_iduser_tariffname UNIQUE (iduser, tariffname);


--
-- Name: cc_call_archive_idx_calledstation; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_call_archive_idx_calledstation ON public.cc_call_archive USING btree (calledstation);


--
-- Name: cc_call_archive_idx_starttime; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_call_archive_idx_starttime ON public.cc_call_archive USING btree (starttime);


--
-- Name: cc_call_archive_idx_terminatecauseid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_call_archive_idx_terminatecauseid ON public.cc_call_archive USING btree (terminatecauseid);


--
-- Name: cc_call_calledstation_ind; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_call_calledstation_ind ON public.cc_call USING btree (calledstation);


--
-- Name: cc_call_starttime_ind; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_call_starttime_ind ON public.cc_call USING btree (starttime);


--
-- Name: cc_call_terminatecause_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_call_terminatecause_id ON public.cc_call USING btree (terminatecauseid);


--
-- Name: cc_call_username_ind; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_call_username_ind ON public.cc_call USING btree (card_id);


--
-- Name: cc_card_archive_creationdate_ind; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_card_archive_creationdate_ind ON public.cc_card_archive USING btree (creationdate);


--
-- Name: cc_card_archive_username_ind; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_card_archive_username_ind ON public.cc_card_archive USING btree (username);


--
-- Name: cc_card_creationdate_ind; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_card_creationdate_ind ON public.cc_card USING btree (creationdate);


--
-- Name: cc_card_username_ind; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_card_username_ind ON public.cc_card USING btree (username);


--
-- Name: cc_iax_buddies_host; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_iax_buddies_host ON public.cc_iax_buddies USING btree (host);


--
-- Name: cc_iax_buddies_ipaddr; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_iax_buddies_ipaddr ON public.cc_iax_buddies USING btree (ipaddr);


--
-- Name: cc_iax_buddies_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_iax_buddies_name ON public.cc_iax_buddies USING btree (name);


--
-- Name: cc_iax_buddies_port; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_iax_buddies_port ON public.cc_iax_buddies USING btree (port);


--
-- Name: cc_prefix_dest; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_prefix_dest ON public.cc_prefix USING btree (destination);


--
-- Name: cc_sip_buddies_host; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_sip_buddies_host ON public.cc_sip_buddies USING btree (host);


--
-- Name: cc_sip_buddies_ipaddr; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_sip_buddies_ipaddr ON public.cc_sip_buddies USING btree (ipaddr);


--
-- Name: cc_sip_buddies_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_sip_buddies_name ON public.cc_sip_buddies USING btree (name);


--
-- Name: cc_sip_buddies_port; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cc_sip_buddies_port ON public.cc_sip_buddies USING btree (port);


--
-- Name: iax_friend_hp_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX iax_friend_hp_index ON public.cc_iax_buddies USING btree (host, port);


--
-- Name: iax_friend_ip_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX iax_friend_ip_index ON public.cc_iax_buddies USING btree (ipaddr, port);


--
-- Name: iax_friend_nh_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX iax_friend_nh_index ON public.cc_iax_buddies USING btree (name, host);


--
-- Name: iax_friend_nip_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX iax_friend_nip_index ON public.cc_iax_buddies USING btree (name, ipaddr, port);


--
-- Name: idtariffplan_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idtariffplan_index ON public.cc_ratecard USING btree (idtariffplan);


--
-- Name: ind_cc_card_package_offer_date_consumption; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ind_cc_card_package_offer_date_consumption ON public.cc_card_package_offer USING btree (date_consumption);


--
-- Name: ind_cc_card_package_offer_id_card; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ind_cc_card_package_offer_id_card ON public.cc_card_package_offer USING btree (id_cc_card);


--
-- Name: ind_cc_card_package_offer_id_package_offer; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ind_cc_card_package_offer_id_package_offer ON public.cc_card_package_offer USING btree (id_cc_package_offer);


--
-- Name: ind_cc_charge_creationdate; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ind_cc_charge_creationdate ON public.cc_charge USING btree (creationdate);


--
-- Name: ind_cc_charge_id_cc_card; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ind_cc_charge_id_cc_card ON public.cc_charge USING btree (id_cc_card);


--
-- Name: ind_cc_ratecard_dialprefix; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ind_cc_ratecard_dialprefix ON public.cc_ratecard USING btree (dialprefix);


--
-- Name: sip_friend_hp_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sip_friend_hp_index ON public.cc_sip_buddies USING btree (host, port);


--
-- Name: sip_friend_ip_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sip_friend_ip_index ON public.cc_sip_buddies USING btree (ipaddr, port);


--
-- Name: cc_card cc_card_serial; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER cc_card_serial BEFORE INSERT ON public.cc_card FOR EACH ROW EXECUTE FUNCTION public.cc_card_serial_set();


--
-- Name: cc_card cc_card_serial_upd; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER cc_card_serial_upd BEFORE UPDATE ON public.cc_card FOR EACH ROW EXECUTE FUNCTION public.cc_card_serial_update();


--
-- Name: cc_ratecard cc_ratecard_validate_regex; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER cc_ratecard_validate_regex BEFORE INSERT OR UPDATE ON public.cc_ratecard FOR EACH ROW EXECUTE FUNCTION public.cc_ratecard_validate_regex();


--
-- Name: cc_agent cc_agent_id_tariffgroup_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_agent
    ADD CONSTRAINT cc_agent_id_tariffgroup_fkey FOREIGN KEY (id_tariffgroup) REFERENCES public.cc_tariffgroup(id);


--
-- Name: cc_support_component cc_support_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_support_component
    ADD CONSTRAINT cc_support_id_fkey FOREIGN KEY (id_support) REFERENCES public.cc_support(id) ON DELETE CASCADE;


--
-- Name: cc_ticket_comment cc_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_ticket_comment
    ADD CONSTRAINT cc_ticket_id_fkey FOREIGN KEY (id_ticket) REFERENCES public.cc_ticket(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict zRkP3S5aJCTdzujdGSKy6uaqrDDdrRNR4UfbBRwxb2QM5uj0gmjlSqEy9UpgVRX

