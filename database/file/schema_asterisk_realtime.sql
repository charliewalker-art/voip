--
-- PostgreSQL database dump
--

\restrict mxJGklh4ML7WANH9wqGBjf4Jhzp53NeFvQBOfn6v9QvAAInvqzhbsxO1JaHGYiN

-- Dumped from database version 15.18 (Debian 15.18-0+deb12u1)
-- Dumped by pg_dump version 15.18 (Debian 15.18-0+deb12u1)

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
-- Name: ast_bool_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.ast_bool_values AS ENUM (
    '0',
    '1',
    'off',
    'on',
    'false',
    'true',
    'no',
    'yes'
);


--
-- Name: moh_mode_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.moh_mode_values AS ENUM (
    'custom',
    'files',
    'mp3nb',
    'quietmp3nb',
    'quietmp3',
    'playlist'
);


--
-- Name: pjsip_100rel_values_v2; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_100rel_values_v2 AS ENUM (
    'no',
    'required',
    'peer_supported',
    'yes'
);


--
-- Name: pjsip_auth_type_values_v2; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_auth_type_values_v2 AS ENUM (
    'md5',
    'userpass',
    'google_oauth'
);


--
-- Name: pjsip_cid_privacy_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_cid_privacy_values AS ENUM (
    'allowed_not_screened',
    'allowed_passed_screened',
    'allowed_failed_screened',
    'allowed',
    'prohib_not_screened',
    'prohib_passed_screened',
    'prohib_failed_screened',
    'prohib',
    'unavailable'
);


--
-- Name: pjsip_connected_line_method_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_connected_line_method_values AS ENUM (
    'invite',
    'reinvite',
    'update'
);


--
-- Name: pjsip_direct_media_glare_mitigation_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_direct_media_glare_mitigation_values AS ENUM (
    'none',
    'outgoing',
    'incoming'
);


--
-- Name: pjsip_dtls_setup_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_dtls_setup_values AS ENUM (
    'active',
    'passive',
    'actpass'
);


--
-- Name: pjsip_dtmf_mode_values_v3; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_dtmf_mode_values_v3 AS ENUM (
    'rfc4733',
    'inband',
    'info',
    'auto',
    'auto_info'
);


--
-- Name: pjsip_incoming_call_offer_pref_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_incoming_call_offer_pref_values AS ENUM (
    'local',
    'local_first',
    'remote',
    'remote_first'
);


--
-- Name: pjsip_media_encryption_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_media_encryption_values AS ENUM (
    'no',
    'sdes',
    'dtls'
);


--
-- Name: pjsip_outgoing_call_offer_pref_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_outgoing_call_offer_pref_values AS ENUM (
    'local',
    'local_merge',
    'local_first',
    'remote',
    'remote_merge',
    'remote_first'
);


--
-- Name: pjsip_redirect_method_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_redirect_method_values AS ENUM (
    'user',
    'uri_core',
    'uri_pjsip'
);


--
-- Name: pjsip_t38udptl_ec_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_t38udptl_ec_values AS ENUM (
    'none',
    'fec',
    'redundancy'
);


--
-- Name: pjsip_taskprocessor_overload_trigger_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_taskprocessor_overload_trigger_values AS ENUM (
    'none',
    'global',
    'pjsip_only'
);


--
-- Name: pjsip_timer_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_timer_values AS ENUM (
    'forced',
    'no',
    'required',
    'yes'
);


--
-- Name: pjsip_transport_method_values_v2; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_transport_method_values_v2 AS ENUM (
    'default',
    'unspecified',
    'tlsv1',
    'tlsv1_1',
    'tlsv1_2',
    'tlsv1_3',
    'sslv2',
    'sslv23',
    'sslv3'
);


--
-- Name: pjsip_transport_protocol_values_v2; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pjsip_transport_protocol_values_v2 AS ENUM (
    'udp',
    'tcp',
    'tls',
    'ws',
    'wss',
    'flow'
);


--
-- Name: queue_autopause_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.queue_autopause_values AS ENUM (
    'yes',
    'no',
    'all'
);


--
-- Name: queue_strategy_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.queue_strategy_values AS ENUM (
    'ringall',
    'leastrecent',
    'fewestcalls',
    'random',
    'rrmemory',
    'linear',
    'wrandom',
    'rrordered'
);


--
-- Name: security_negotiation_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.security_negotiation_values AS ENUM (
    'no',
    'mediasec'
);


--
-- Name: sha_hash_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.sha_hash_values AS ENUM (
    'SHA-1',
    'SHA-256'
);


--
-- Name: yes_no_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.yes_no_values AS ENUM (
    'yes',
    'no'
);


--
-- Name: yesno_values; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.yesno_values AS ENUM (
    'yes',
    'no'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


--
-- Name: cdr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cdr (
    accountcode character varying(80),
    src character varying(80),
    dst character varying(80),
    dcontext character varying(80),
    clid character varying(80),
    channel character varying(80),
    dstchannel character varying(80),
    lastapp character varying(80),
    lastdata character varying(80),
    start timestamp without time zone,
    answer timestamp without time zone,
    "end" timestamp without time zone,
    duration integer,
    billsec integer,
    disposition character varying(45),
    amaflags character varying(45),
    userfield character varying(256),
    uniqueid character varying(150),
    linkedid character varying(150),
    peeraccount character varying(80),
    sequence integer
);


--
-- Name: conference_billing_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conference_billing_log (
    id integer NOT NULL,
    room_number character varying(20) NOT NULL,
    card_id bigint,
    callerid character varying(20),
    seconds_used integer NOT NULL,
    amount_charged numeric(12,4) NOT NULL,
    call_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: conference_billing_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conference_billing_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conference_billing_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conference_billing_log_id_seq OWNED BY public.conference_billing_log.id;


--
-- Name: conference_rooms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conference_rooms (
    id integer NOT NULL,
    room_number character varying(20) NOT NULL,
    name character varying(100),
    pin character varying(20),
    billed boolean DEFAULT false NOT NULL,
    rate_per_second numeric(12,4) DEFAULT 0,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    max_participants integer
);


--
-- Name: conference_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conference_rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conference_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conference_rooms_id_seq OWNED BY public.conference_rooms.id;


--
-- Name: ivr_menus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ivr_menus (
    id integer NOT NULL,
    number character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    welcome_text text NOT NULL,
    timeout_seconds integer DEFAULT 10 NOT NULL,
    invalid_text text DEFAULT 'Option invalide, veuillez réessayer.'::text NOT NULL,
    max_retries integer DEFAULT 3 NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_voicemail_access boolean DEFAULT false NOT NULL,
    is_balance_check boolean DEFAULT false NOT NULL,
    is_recharge boolean DEFAULT false NOT NULL
);


--
-- Name: ivr_menus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ivr_menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ivr_menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ivr_menus_id_seq OWNED BY public.ivr_menus.id;


--
-- Name: ivr_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ivr_options (
    id integer NOT NULL,
    menu_id integer NOT NULL,
    dtmf_key character varying(1) NOT NULL,
    prompt_text text NOT NULL,
    action_type character varying(20) NOT NULL,
    action_target character varying(100),
    CONSTRAINT ivr_options_action_type_check CHECK (((action_type)::text = ANY ((ARRAY['service'::character varying, 'submenu'::character varying, 'voicemail'::character varying, 'hangup'::character varying, 'repeat'::character varying])::text[])))
);


--
-- Name: ivr_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ivr_options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ivr_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ivr_options_id_seq OWNED BY public.ivr_options.id;


--
-- Name: ivr_services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ivr_services (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    destination_type character varying(20) NOT NULL,
    destination_value character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT ivr_services_destination_type_check CHECK (((destination_type)::text = ANY ((ARRAY['extension'::character varying, 'queue'::character varying, 'conference'::character varying])::text[])))
);


--
-- Name: ivr_services_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ivr_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ivr_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ivr_services_id_seq OWNED BY public.ivr_services.id;


--
-- Name: ivr_system_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ivr_system_settings (
    setting_key character varying(50) NOT NULL,
    setting_value text NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: musiconhold; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.musiconhold (
    name character varying(80) NOT NULL,
    mode public.moh_mode_values,
    directory character varying(255),
    application character varying(255),
    digit character varying(1),
    sort character varying(10),
    format character varying(10),
    stamp timestamp without time zone,
    loop_last public.yesno_values
);


--
-- Name: musiconhold_entry; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.musiconhold_entry (
    name character varying(80) NOT NULL,
    "position" integer NOT NULL,
    entry character varying(1024) NOT NULL
);


--
-- Name: ps_aors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_aors (
    id character varying(255) NOT NULL,
    contact character varying(255),
    default_expiration integer,
    mailboxes character varying(80),
    max_contacts integer,
    minimum_expiration integer,
    remove_existing public.ast_bool_values,
    qualify_frequency integer,
    authenticate_qualify public.ast_bool_values,
    maximum_expiration integer,
    outbound_proxy character varying(255),
    support_path public.ast_bool_values,
    qualify_timeout double precision,
    voicemail_extension character varying(40),
    remove_unavailable public.ast_bool_values,
    qualify_2xx_only public.ast_bool_values
);


--
-- Name: ps_asterisk_publications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_asterisk_publications (
    id character varying(40) NOT NULL,
    devicestate_publish character varying(40),
    mailboxstate_publish character varying(40),
    device_state public.ast_bool_values,
    device_state_filter character varying(256),
    mailbox_state public.ast_bool_values,
    mailbox_state_filter character varying(256)
);


--
-- Name: ps_auths; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_auths (
    id character varying(255) NOT NULL,
    auth_type public.pjsip_auth_type_values_v2,
    nonce_lifetime integer,
    md5_cred character varying(40),
    password character varying(80),
    realm character varying(255),
    username character varying(40),
    refresh_token character varying(255),
    oauth_clientid character varying(255),
    oauth_secret character varying(255),
    password_digest character varying(1024),
    supported_algorithms_uas character varying(1024),
    supported_algorithms_uac character varying(1024)
);


--
-- Name: ps_contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_contacts (
    id character varying(255) NOT NULL,
    uri character varying(511),
    expiration_time bigint,
    qualify_frequency integer,
    outbound_proxy character varying(255),
    path text,
    user_agent character varying(255),
    qualify_timeout double precision,
    reg_server character varying(255),
    authenticate_qualify public.ast_bool_values,
    via_addr character varying(40),
    via_port integer,
    call_id character varying(255),
    endpoint character varying(255),
    prune_on_boot public.ast_bool_values,
    qualify_2xx_only public.ast_bool_values
);


--
-- Name: ps_domain_aliases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_domain_aliases (
    id character varying(255) NOT NULL,
    domain character varying(255)
);


--
-- Name: ps_endpoint_id_ips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_endpoint_id_ips (
    id character varying(255) NOT NULL,
    endpoint character varying(255),
    match character varying(80),
    srv_lookups public.ast_bool_values,
    match_header character varying(255),
    match_request_uri character varying(255)
);


--
-- Name: ps_endpoints; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_endpoints (
    id character varying(255) NOT NULL,
    transport character varying(40),
    aors character varying(2048),
    auth character varying(255),
    context character varying(40),
    disallow character varying(200),
    allow character varying(200),
    direct_media public.ast_bool_values,
    connected_line_method public.pjsip_connected_line_method_values,
    direct_media_method public.pjsip_connected_line_method_values,
    direct_media_glare_mitigation public.pjsip_direct_media_glare_mitigation_values,
    disable_direct_media_on_nat public.ast_bool_values,
    dtmf_mode public.pjsip_dtmf_mode_values_v3,
    external_media_address character varying(40),
    force_rport public.ast_bool_values,
    ice_support public.ast_bool_values,
    identify_by character varying(80),
    mailboxes character varying(40),
    moh_suggest character varying(40),
    outbound_auth character varying(255),
    outbound_proxy character varying(255),
    rewrite_contact public.ast_bool_values,
    rtp_ipv6 public.ast_bool_values,
    rtp_symmetric public.ast_bool_values,
    send_diversion public.ast_bool_values,
    send_pai public.ast_bool_values,
    send_rpid public.ast_bool_values,
    timers_min_se integer,
    timers public.pjsip_timer_values,
    timers_sess_expires integer,
    callerid character varying(40),
    callerid_privacy public.pjsip_cid_privacy_values,
    callerid_tag character varying(40),
    "100rel" public.pjsip_100rel_values_v2,
    aggregate_mwi public.ast_bool_values,
    trust_id_inbound public.ast_bool_values,
    trust_id_outbound public.ast_bool_values,
    use_ptime public.ast_bool_values,
    use_avpf public.ast_bool_values,
    media_encryption public.pjsip_media_encryption_values,
    inband_progress public.ast_bool_values,
    call_group character varying(40),
    pickup_group character varying(40),
    named_call_group character varying(40),
    named_pickup_group character varying(40),
    device_state_busy_at integer,
    fax_detect public.ast_bool_values,
    t38_udptl public.ast_bool_values,
    t38_udptl_ec public.pjsip_t38udptl_ec_values,
    t38_udptl_maxdatagram integer,
    t38_udptl_nat public.ast_bool_values,
    t38_udptl_ipv6 public.ast_bool_values,
    tone_zone character varying(40),
    language character varying(40),
    one_touch_recording public.ast_bool_values,
    record_on_feature character varying(40),
    record_off_feature character varying(40),
    rtp_engine character varying(40),
    allow_transfer public.ast_bool_values,
    allow_subscribe public.ast_bool_values,
    sdp_owner character varying(40),
    sdp_session character varying(40),
    tos_audio character varying(10),
    tos_video character varying(10),
    sub_min_expiry integer,
    from_domain character varying(40),
    from_user character varying(40),
    mwi_from_user character varying(40),
    dtls_verify character varying(40),
    dtls_rekey character varying(40),
    dtls_cert_file character varying(200),
    dtls_private_key character varying(200),
    dtls_cipher character varying(200),
    dtls_ca_file character varying(200),
    dtls_ca_path character varying(200),
    dtls_setup public.pjsip_dtls_setup_values,
    srtp_tag_32 public.ast_bool_values,
    media_address character varying(40),
    redirect_method public.pjsip_redirect_method_values,
    set_var text,
    cos_audio integer,
    cos_video integer,
    message_context character varying(40),
    force_avp public.ast_bool_values,
    media_use_received_transport public.ast_bool_values,
    accountcode character varying(80),
    user_eq_phone public.ast_bool_values,
    moh_passthrough public.ast_bool_values,
    media_encryption_optimistic public.ast_bool_values,
    rpid_immediate public.ast_bool_values,
    g726_non_standard public.ast_bool_values,
    rtp_keepalive integer,
    rtp_timeout integer,
    rtp_timeout_hold integer,
    bind_rtp_to_media_address public.ast_bool_values,
    voicemail_extension character varying(40),
    mwi_subscribe_replaces_unsolicited public.ast_bool_values,
    deny character varying(95),
    permit character varying(95),
    acl character varying(40),
    contact_deny character varying(95),
    contact_permit character varying(95),
    contact_acl character varying(40),
    subscribe_context character varying(40),
    fax_detect_timeout integer,
    contact_user character varying(80),
    preferred_codec_only public.ast_bool_values,
    asymmetric_rtp_codec public.ast_bool_values,
    rtcp_mux public.ast_bool_values,
    allow_overlap public.ast_bool_values,
    refer_blind_progress public.ast_bool_values,
    notify_early_inuse_ringing public.ast_bool_values,
    max_audio_streams integer,
    max_video_streams integer,
    webrtc public.ast_bool_values,
    dtls_fingerprint public.sha_hash_values,
    incoming_mwi_mailbox character varying(40),
    bundle public.ast_bool_values,
    dtls_auto_generate_cert public.ast_bool_values,
    follow_early_media_fork public.ast_bool_values,
    accept_multiple_sdp_answers public.ast_bool_values,
    suppress_q850_reason_headers public.ast_bool_values,
    trust_connected_line public.ast_bool_values,
    send_connected_line public.ast_bool_values,
    ignore_183_without_sdp public.ast_bool_values,
    codec_prefs_incoming_offer character varying(128),
    codec_prefs_outgoing_offer character varying(128),
    codec_prefs_incoming_answer character varying(128),
    codec_prefs_outgoing_answer character varying(128),
    stir_shaken public.ast_bool_values,
    send_history_info public.ast_bool_values,
    allow_unauthenticated_options public.ast_bool_values,
    t38_bind_udptl_to_media_address public.ast_bool_values,
    geoloc_incoming_call_profile character varying(80),
    geoloc_outgoing_call_profile character varying(80),
    incoming_call_offer_pref public.pjsip_incoming_call_offer_pref_values,
    outgoing_call_offer_pref public.pjsip_outgoing_call_offer_pref_values,
    stir_shaken_profile character varying(80),
    security_negotiation public.security_negotiation_values,
    security_mechanisms character varying(512),
    send_aoc public.ast_bool_values,
    overlap_context character varying(80),
    tenantid character varying(80),
    suppress_moh_on_sendonly public.ast_bool_values,
    follow_redirect_methods character varying(95),
    rtp_port_start integer,
    rtp_port_end integer
);


--
-- Name: ps_globals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_globals (
    id character varying(40) NOT NULL,
    max_forwards integer,
    user_agent character varying(255),
    default_outbound_endpoint character varying(40),
    debug character varying(40),
    endpoint_identifier_order character varying(40),
    max_initial_qualify_time integer,
    default_from_user character varying(80),
    keep_alive_interval integer,
    regcontext character varying(80),
    contact_expiration_check_interval integer,
    default_voicemail_extension character varying(40),
    disable_multi_domain public.ast_bool_values,
    unidentified_request_count integer,
    unidentified_request_period integer,
    unidentified_request_prune_interval integer,
    default_realm character varying(40),
    mwi_tps_queue_high integer,
    mwi_tps_queue_low integer,
    mwi_disable_initial_unsolicited public.ast_bool_values,
    ignore_uri_user_options public.ast_bool_values,
    use_callerid_contact public.ast_bool_values,
    send_contact_status_on_update_registration public.ast_bool_values,
    taskprocessor_overload_trigger public.pjsip_taskprocessor_overload_trigger_values,
    norefersub public.ast_bool_values,
    allow_sending_180_after_183 public.ast_bool_values,
    all_codecs_on_empty_reinvite public.ast_bool_values,
    default_auth_algorithms_uas character varying(1024),
    default_auth_algorithms_uac character varying(1024)
);


--
-- Name: ps_inbound_publications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_inbound_publications (
    id character varying(255) NOT NULL,
    endpoint character varying(255),
    "event_asterisk-devicestate" character varying(40),
    "event_asterisk-mwi" character varying(40)
);


--
-- Name: ps_outbound_publishes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_outbound_publishes (
    id character varying(255) NOT NULL,
    expiration integer,
    outbound_auth character varying(255),
    outbound_proxy character varying(256),
    server_uri character varying(256),
    from_uri character varying(256),
    to_uri character varying(256),
    event character varying(40),
    max_auth_attempts integer,
    transport character varying(40),
    multi_user public.ast_bool_values,
    "@body" character varying(40),
    "@context" character varying(256),
    "@exten" character varying(256)
);


--
-- Name: ps_registrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_registrations (
    id character varying(255) NOT NULL,
    auth_rejection_permanent public.ast_bool_values,
    client_uri character varying(255),
    contact_user character varying(40),
    expiration integer,
    max_retries integer,
    outbound_auth character varying(255),
    outbound_proxy character varying(255),
    retry_interval integer,
    forbidden_retry_interval integer,
    server_uri character varying(255),
    transport character varying(40),
    support_path public.ast_bool_values,
    fatal_retry_interval integer,
    line public.ast_bool_values,
    endpoint character varying(255),
    support_outbound public.ast_bool_values,
    contact_header_params character varying(255),
    max_random_initial_delay integer,
    security_negotiation public.security_negotiation_values,
    security_mechanisms character varying(512)
);


--
-- Name: ps_resource_list; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_resource_list (
    id character varying(40) NOT NULL,
    list_item character varying(2048),
    event character varying(40),
    full_state public.ast_bool_values,
    notification_batch_interval integer,
    resource_display_name public.ast_bool_values
);


--
-- Name: ps_subscription_persistence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_subscription_persistence (
    id character varying(40) NOT NULL,
    packet character varying(2048),
    src_name character varying(128),
    src_port integer,
    transport_key character varying(64),
    local_name character varying(128),
    local_port integer,
    cseq integer,
    tag character varying(128),
    endpoint character varying(40),
    expires integer,
    contact_uri character varying(256),
    prune_on_boot public.ast_bool_values,
    generator_data text
);


--
-- Name: ps_systems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_systems (
    id character varying(40) NOT NULL,
    timer_t1 integer,
    timer_b integer,
    compact_headers public.ast_bool_values,
    threadpool_initial_size integer,
    threadpool_auto_increment integer,
    threadpool_idle_timeout integer,
    threadpool_max_size integer,
    disable_tcp_switch public.ast_bool_values,
    follow_early_media_fork public.ast_bool_values,
    accept_multiple_sdp_answers public.ast_bool_values,
    disable_rport public.ast_bool_values,
    taskpool_minimum_size integer,
    taskpool_initial_size integer,
    taskpool_auto_increment integer,
    taskpool_idle_timeout integer,
    taskpool_max_size integer
);


--
-- Name: ps_transports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ps_transports (
    id character varying(40) NOT NULL,
    async_operations integer,
    bind character varying(40),
    ca_list_file character varying(200),
    cert_file character varying(200),
    cipher character varying(200),
    domain character varying(40),
    external_media_address character varying(40),
    external_signaling_address character varying(40),
    external_signaling_port integer,
    method public.pjsip_transport_method_values_v2,
    local_net character varying(40),
    password character varying(40),
    priv_key_file character varying(200),
    protocol public.pjsip_transport_protocol_values_v2,
    require_client_cert public.ast_bool_values,
    verify_client public.ast_bool_values,
    verify_server public.ast_bool_values,
    tos character varying(10),
    cos integer,
    allow_reload public.ast_bool_values,
    symmetric_transport public.ast_bool_values,
    allow_wildcard_certs public.ast_bool_values,
    tcp_keepalive_enable boolean,
    tcp_keepalive_idle_time integer,
    tcp_keepalive_interval_time integer,
    tcp_keepalive_probe_count integer
);


--
-- Name: queue_members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.queue_members (
    queue_name character varying(80) NOT NULL,
    interface character varying(80) NOT NULL,
    membername character varying(80),
    state_interface character varying(80),
    penalty integer,
    paused integer,
    uniqueid integer NOT NULL,
    wrapuptime integer,
    ringinuse public.ast_bool_values,
    reason_paused character varying(80)
);


--
-- Name: queue_rules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.queue_rules (
    rule_name character varying(80) NOT NULL,
    "time" character varying(32) NOT NULL,
    min_penalty character varying(32) NOT NULL,
    max_penalty character varying(32) NOT NULL
);


--
-- Name: queues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.queues (
    name character varying(128) NOT NULL,
    musiconhold character varying(128),
    announce character varying(128),
    context character varying(128),
    timeout integer,
    ringinuse public.yesno_values,
    setinterfacevar public.yesno_values,
    setqueuevar public.yesno_values,
    setqueueentryvar public.yesno_values,
    monitor_format character varying(8),
    membermacro character varying(512),
    membergosub character varying(512),
    queue_youarenext character varying(128),
    queue_thereare character varying(128),
    queue_callswaiting character varying(128),
    queue_quantity1 character varying(128),
    queue_quantity2 character varying(128),
    queue_holdtime character varying(128),
    queue_minutes character varying(128),
    queue_minute character varying(128),
    queue_seconds character varying(128),
    queue_thankyou character varying(128),
    queue_callerannounce character varying(128),
    queue_reporthold character varying(128),
    announce_frequency integer,
    announce_to_first_user public.yesno_values,
    min_announce_frequency integer,
    announce_round_seconds integer,
    announce_holdtime character varying(128),
    announce_position character varying(128),
    announce_position_limit integer,
    periodic_announce character varying(50),
    periodic_announce_frequency integer,
    relative_periodic_announce public.yesno_values,
    random_periodic_announce public.yesno_values,
    retry integer,
    wrapuptime integer,
    penaltymemberslimit integer,
    autofill public.yesno_values,
    monitor_type character varying(128),
    autopause public.queue_autopause_values,
    autopausedelay integer,
    autopausebusy public.yesno_values,
    autopauseunavail public.yesno_values,
    maxlen integer,
    servicelevel integer,
    strategy public.queue_strategy_values,
    joinempty character varying(128),
    leavewhenempty character varying(128),
    reportholdtime public.yesno_values,
    memberdelay integer,
    weight integer,
    timeoutrestart public.yesno_values,
    defaultrule character varying(128),
    timeoutpriority character varying(128),
    log_restricted_caller_id public.ast_bool_values
);


--
-- Name: stir_tn; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stir_tn (
    id character varying(80) NOT NULL,
    private_key_file character varying(1024),
    public_cert_url character varying(1024),
    attest_level character varying(1),
    send_mky public.ast_bool_values
);


--
-- Name: voicemail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voicemail (
    uniqueid integer NOT NULL,
    context character varying(80) NOT NULL,
    mailbox character varying(80) NOT NULL,
    password character varying(80) NOT NULL,
    fullname character varying(80),
    alias character varying(80),
    email character varying(80),
    pager character varying(80),
    attach public.yes_no_values,
    attachfmt character varying(10),
    serveremail character varying(80),
    language character varying(20),
    tz character varying(30),
    deletevoicemail public.yes_no_values,
    saycid public.yes_no_values,
    sendvoicemail public.yes_no_values,
    review public.yes_no_values,
    tempgreetwarn public.yes_no_values,
    operator public.yes_no_values,
    envelope public.yes_no_values,
    sayduration integer,
    forcename public.yes_no_values,
    forcegreetings public.yes_no_values,
    callback character varying(80),
    dialout character varying(80),
    exitcontext character varying(80),
    maxmsg integer,
    volgain numeric(5,2),
    imapuser character varying(80),
    imappassword character varying(80),
    imapserver character varying(80),
    imapport character varying(8),
    imapflags character varying(80),
    stamp timestamp without time zone
);


--
-- Name: voicemail_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voicemail_messages (
    dir character varying(255) NOT NULL,
    msgnum integer NOT NULL,
    context character varying(80),
    macrocontext character varying(80),
    callerid character varying(80),
    origtime integer,
    duration integer,
    recording bytea,
    flag character varying(30),
    category character varying(30),
    mailboxuser character varying(30),
    mailboxcontext character varying(30),
    msg_id character varying(40)
);


--
-- Name: voicemail_uniqueid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voicemail_uniqueid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: voicemail_uniqueid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voicemail_uniqueid_seq OWNED BY public.voicemail.uniqueid;


--
-- Name: conference_billing_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conference_billing_log ALTER COLUMN id SET DEFAULT nextval('public.conference_billing_log_id_seq'::regclass);


--
-- Name: conference_rooms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conference_rooms ALTER COLUMN id SET DEFAULT nextval('public.conference_rooms_id_seq'::regclass);


--
-- Name: ivr_menus id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ivr_menus ALTER COLUMN id SET DEFAULT nextval('public.ivr_menus_id_seq'::regclass);


--
-- Name: ivr_options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ivr_options ALTER COLUMN id SET DEFAULT nextval('public.ivr_options_id_seq'::regclass);


--
-- Name: ivr_services id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ivr_services ALTER COLUMN id SET DEFAULT nextval('public.ivr_services_id_seq'::regclass);


--
-- Name: voicemail uniqueid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voicemail ALTER COLUMN uniqueid SET DEFAULT nextval('public.voicemail_uniqueid_seq'::regclass);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: conference_billing_log conference_billing_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conference_billing_log
    ADD CONSTRAINT conference_billing_log_pkey PRIMARY KEY (id);


--
-- Name: conference_rooms conference_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conference_rooms
    ADD CONSTRAINT conference_rooms_pkey PRIMARY KEY (id);


--
-- Name: conference_rooms conference_rooms_room_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conference_rooms
    ADD CONSTRAINT conference_rooms_room_number_key UNIQUE (room_number);


--
-- Name: ivr_menus ivr_menus_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ivr_menus
    ADD CONSTRAINT ivr_menus_number_key UNIQUE (number);


--
-- Name: ivr_menus ivr_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ivr_menus
    ADD CONSTRAINT ivr_menus_pkey PRIMARY KEY (id);


--
-- Name: ivr_options ivr_options_menu_id_dtmf_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ivr_options
    ADD CONSTRAINT ivr_options_menu_id_dtmf_key_key UNIQUE (menu_id, dtmf_key);


--
-- Name: ivr_options ivr_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ivr_options
    ADD CONSTRAINT ivr_options_pkey PRIMARY KEY (id);


--
-- Name: ivr_services ivr_services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ivr_services
    ADD CONSTRAINT ivr_services_pkey PRIMARY KEY (id);


--
-- Name: ivr_system_settings ivr_system_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ivr_system_settings
    ADD CONSTRAINT ivr_system_settings_pkey PRIMARY KEY (setting_key);


--
-- Name: musiconhold_entry musiconhold_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.musiconhold_entry
    ADD CONSTRAINT musiconhold_entry_pkey PRIMARY KEY (name, "position");


--
-- Name: musiconhold musiconhold_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.musiconhold
    ADD CONSTRAINT musiconhold_pkey PRIMARY KEY (name);


--
-- Name: ps_aors ps_aors_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_aors
    ADD CONSTRAINT ps_aors_id_key UNIQUE (id);


--
-- Name: ps_asterisk_publications ps_asterisk_publications_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_asterisk_publications
    ADD CONSTRAINT ps_asterisk_publications_id_key UNIQUE (id);


--
-- Name: ps_auths ps_auths_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_auths
    ADD CONSTRAINT ps_auths_id_key UNIQUE (id);


--
-- Name: ps_contacts ps_contacts_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_contacts
    ADD CONSTRAINT ps_contacts_id_key UNIQUE (id);


--
-- Name: ps_contacts ps_contacts_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_contacts
    ADD CONSTRAINT ps_contacts_uq UNIQUE (id, reg_server);


--
-- Name: ps_domain_aliases ps_domain_aliases_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_domain_aliases
    ADD CONSTRAINT ps_domain_aliases_id_key UNIQUE (id);


--
-- Name: ps_endpoint_id_ips ps_endpoint_id_ips_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_endpoint_id_ips
    ADD CONSTRAINT ps_endpoint_id_ips_id_key UNIQUE (id);


--
-- Name: ps_endpoints ps_endpoints_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_endpoints
    ADD CONSTRAINT ps_endpoints_id_key UNIQUE (id);


--
-- Name: ps_globals ps_globals_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_globals
    ADD CONSTRAINT ps_globals_id_key UNIQUE (id);


--
-- Name: ps_inbound_publications ps_inbound_publications_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_inbound_publications
    ADD CONSTRAINT ps_inbound_publications_id_key UNIQUE (id);


--
-- Name: ps_outbound_publishes ps_outbound_publishes_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_outbound_publishes
    ADD CONSTRAINT ps_outbound_publishes_id_key UNIQUE (id);


--
-- Name: ps_registrations ps_registrations_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_registrations
    ADD CONSTRAINT ps_registrations_id_key UNIQUE (id);


--
-- Name: ps_resource_list ps_resource_list_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_resource_list
    ADD CONSTRAINT ps_resource_list_id_key UNIQUE (id);


--
-- Name: ps_subscription_persistence ps_subscription_persistence_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_subscription_persistence
    ADD CONSTRAINT ps_subscription_persistence_id_key UNIQUE (id);


--
-- Name: ps_systems ps_systems_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_systems
    ADD CONSTRAINT ps_systems_id_key UNIQUE (id);


--
-- Name: ps_transports ps_transports_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ps_transports
    ADD CONSTRAINT ps_transports_id_key UNIQUE (id);


--
-- Name: queue_members queue_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.queue_members
    ADD CONSTRAINT queue_members_pkey PRIMARY KEY (queue_name, interface);


--
-- Name: queue_members queue_members_uniqueid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.queue_members
    ADD CONSTRAINT queue_members_uniqueid_key UNIQUE (uniqueid);


--
-- Name: queues queues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.queues
    ADD CONSTRAINT queues_pkey PRIMARY KEY (name);


--
-- Name: stir_tn stir_tn_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stir_tn
    ADD CONSTRAINT stir_tn_pkey PRIMARY KEY (id);


--
-- Name: voicemail_messages voicemail_messages_dir_msgnum; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voicemail_messages
    ADD CONSTRAINT voicemail_messages_dir_msgnum PRIMARY KEY (dir, msgnum);


--
-- Name: voicemail voicemail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voicemail
    ADD CONSTRAINT voicemail_pkey PRIMARY KEY (uniqueid);


--
-- Name: ps_aors_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_aors_id ON public.ps_aors USING btree (id);


--
-- Name: ps_aors_qualifyfreq_contact; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_aors_qualifyfreq_contact ON public.ps_aors USING btree (qualify_frequency, contact);


--
-- Name: ps_asterisk_publications_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_asterisk_publications_id ON public.ps_asterisk_publications USING btree (id);


--
-- Name: ps_auths_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_auths_id ON public.ps_auths USING btree (id);


--
-- Name: ps_contacts_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_contacts_id ON public.ps_contacts USING btree (id);


--
-- Name: ps_contacts_qualifyfreq_exp; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_contacts_qualifyfreq_exp ON public.ps_contacts USING btree (qualify_frequency, expiration_time);


--
-- Name: ps_domain_aliases_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_domain_aliases_id ON public.ps_domain_aliases USING btree (id);


--
-- Name: ps_endpoint_id_ips_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_endpoint_id_ips_id ON public.ps_endpoint_id_ips USING btree (id);


--
-- Name: ps_endpoints_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_endpoints_id ON public.ps_endpoints USING btree (id);


--
-- Name: ps_globals_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_globals_id ON public.ps_globals USING btree (id);


--
-- Name: ps_inbound_publications_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_inbound_publications_id ON public.ps_inbound_publications USING btree (id);


--
-- Name: ps_outbound_publishes_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_outbound_publishes_id ON public.ps_outbound_publishes USING btree (id);


--
-- Name: ps_registrations_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_registrations_id ON public.ps_registrations USING btree (id);


--
-- Name: ps_resource_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_resource_list_id ON public.ps_resource_list USING btree (id);


--
-- Name: ps_subscription_persistence_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_subscription_persistence_id ON public.ps_subscription_persistence USING btree (id);


--
-- Name: ps_systems_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_systems_id ON public.ps_systems USING btree (id);


--
-- Name: ps_transports_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ps_transports_id ON public.ps_transports USING btree (id);


--
-- Name: voicemail_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voicemail_context ON public.voicemail USING btree (context);


--
-- Name: voicemail_imapuser; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voicemail_imapuser ON public.voicemail USING btree (imapuser);


--
-- Name: voicemail_mailbox; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voicemail_mailbox ON public.voicemail USING btree (mailbox);


--
-- Name: voicemail_mailbox_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voicemail_mailbox_context ON public.voicemail USING btree (mailbox, context);


--
-- Name: voicemail_messages_dir; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voicemail_messages_dir ON public.voicemail_messages USING btree (dir);


--
-- Name: musiconhold_entry fk_musiconhold_entry_name_musiconhold; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.musiconhold_entry
    ADD CONSTRAINT fk_musiconhold_entry_name_musiconhold FOREIGN KEY (name) REFERENCES public.musiconhold(name);


--
-- Name: ivr_options ivr_options_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ivr_options
    ADD CONSTRAINT ivr_options_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public.ivr_menus(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict mxJGklh4ML7WANH9wqGBjf4Jhzp53NeFvQBOfn6v9QvAAInvqzhbsxO1JaHGYiN

