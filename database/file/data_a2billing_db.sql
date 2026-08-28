--
-- PostgreSQL database dump
--

\restrict bWdvzgv64AqpYAOZQ9WBPghqxSCHnRlmZqFjjrBesGnUAW3ioZDO4ma7MbryWHO

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
-- Data for Name: cc_tariffgroup; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_tariffgroup (id, iduser, idtariffplan, tariffgroupname, lcrtype, creationdate, removeinterprefix, id_cc_package_offer) VALUES (1, 0, 1, 'Groupe Interne', 0, '2026-08-22 19:03:55.303344', 0, 0);


--
-- Data for Name: cc_agent; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_agent_commission; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_agent_signup; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_agent_tariffgroup; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_alarm; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_alarm_report; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_autorefill_report; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_backup; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_billing_customer; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_call; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_call_archive; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_callback_spool; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_callerid; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_callerid (id, cid, id_cc_card, activated) VALUES (1, '1001', 1, true);
INSERT INTO public.cc_callerid (id, cid, id_cc_card, activated) VALUES (2, '1002', 2, true);
INSERT INTO public.cc_callerid (id, cid, id_cc_card, activated) VALUES (3, '1003', 3, true);
INSERT INTO public.cc_callerid (id, cid, id_cc_card, activated) VALUES (4, '1004', 4, true);
INSERT INTO public.cc_callerid (id, cid, id_cc_card, activated) VALUES (5, '1005', 5, true);
INSERT INTO public.cc_callerid (id, cid, id_cc_card, activated) VALUES (6, '1006', 6, true);


--
-- Data for Name: cc_campaign; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_campaign_config; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_campaign_phonebook; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_campaign_phonestatus; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_campaignconf_cardgroup; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_card; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_card (id, creationdate, firstusedate, expirationdate, enableexpire, expiredays, username, useralias, uipass, credit, tariff, id_didgroup, activated, lastname, firstname, address, city, state, country, zipcode, phone, email, fax, inuse, simultaccess, currency, lastuse, nbused, typepaid, creditlimit, voipcall, sip_buddy, iax_buddy, language, redial, runservice, nbservice, id_campaign, num_trials_done, vat, servicelastrun, initialbalance, invoiceday, autorefill, loginkey, mac_addr, id_timezone, status, tag, voicemail_permitted, voicemail_activated, last_notification, email_notification, notify_email, credit_notification, id_group, company_name, company_website, vat_rn, traffic, traffic_target, discount, restriction, id_seria, serial, block, lock_pin, lock_date) VALUES (6, '2026-08-25 14:28:54.909044', '2026-08-25 13:45:30.422623', NULL, 0, 0, '1006', '1006', NULL, 6086.0000, 1, 0, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'MGA', '2026-08-25', 1, 0, 0, 0, 0, 0, 'fr', '1002', 0, 0, 0, 0, 0.000, NULL, 0.0000, 1, 0, NULL, '00-00-00-00-00-00', 0, 1, NULL, 0, 0, NULL, NULL, 0, -1, 1, NULL, NULL, NULL, 0, NULL, 0.00, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO public.cc_card (id, creationdate, firstusedate, expirationdate, enableexpire, expiredays, username, useralias, uipass, credit, tariff, id_didgroup, activated, lastname, firstname, address, city, state, country, zipcode, phone, email, fax, inuse, simultaccess, currency, lastuse, nbused, typepaid, creditlimit, voipcall, sip_buddy, iax_buddy, language, redial, runservice, nbservice, id_campaign, num_trials_done, vat, servicelastrun, initialbalance, invoiceday, autorefill, loginkey, mac_addr, id_timezone, status, tag, voicemail_permitted, voicemail_activated, last_notification, email_notification, notify_email, credit_notification, id_group, company_name, company_website, vat_rn, traffic, traffic_target, discount, restriction, id_seria, serial, block, lock_pin, lock_date) VALUES (3, '2026-08-24 03:55:46.313501', NULL, NULL, 0, 0, '1003', '1003', NULL, 482.5000, 1, 0, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'MGA', '2026-08-24', 0, 0, 0, 0, 0, 0, 'fr', NULL, 0, 0, 0, 0, 0.000, NULL, 0.0000, 1, 0, NULL, '00-00-00-00-00-00', 0, 1, NULL, 0, 0, NULL, NULL, 0, -1, 1, NULL, NULL, NULL, 0, NULL, 0.00, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO public.cc_card (id, creationdate, firstusedate, expirationdate, enableexpire, expiredays, username, useralias, uipass, credit, tariff, id_didgroup, activated, lastname, firstname, address, city, state, country, zipcode, phone, email, fax, inuse, simultaccess, currency, lastuse, nbused, typepaid, creditlimit, voipcall, sip_buddy, iax_buddy, language, redial, runservice, nbservice, id_campaign, num_trials_done, vat, servicelastrun, initialbalance, invoiceday, autorefill, loginkey, mac_addr, id_timezone, status, tag, voicemail_permitted, voicemail_activated, last_notification, email_notification, notify_email, credit_notification, id_group, company_name, company_website, vat_rn, traffic, traffic_target, discount, restriction, id_seria, serial, block, lock_pin, lock_date) VALUES (5, '2026-08-25 10:52:44.926999', NULL, NULL, 0, 0, '1005', '1005', NULL, 94.5000, 1, 0, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'MGA', '2026-08-25', 0, 0, 0, 0, 0, 0, 'fr', NULL, 0, 0, 0, 0, 0.000, NULL, 0.0000, 1, 0, NULL, '00-00-00-00-00-00', 0, 1, NULL, 0, 0, NULL, NULL, 0, -1, 1, NULL, NULL, NULL, 0, NULL, 0.00, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO public.cc_card (id, creationdate, firstusedate, expirationdate, enableexpire, expiredays, username, useralias, uipass, credit, tariff, id_didgroup, activated, lastname, firstname, address, city, state, country, zipcode, phone, email, fax, inuse, simultaccess, currency, lastuse, nbused, typepaid, creditlimit, voipcall, sip_buddy, iax_buddy, language, redial, runservice, nbservice, id_campaign, num_trials_done, vat, servicelastrun, initialbalance, invoiceday, autorefill, loginkey, mac_addr, id_timezone, status, tag, voicemail_permitted, voicemail_activated, last_notification, email_notification, notify_email, credit_notification, id_group, company_name, company_website, vat_rn, traffic, traffic_target, discount, restriction, id_seria, serial, block, lock_pin, lock_date) VALUES (1, '2026-08-22 19:12:01.262031', '2026-08-23 07:12:55.885389', NULL, 0, 0, '1001', '1001', NULL, 7979.2500, 1, 0, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'MGA', '2026-08-27', 11, 0, 0, 0, 0, 0, 'fr', '1002', 0, 0, 0, 0, 0.000, NULL, 0.0000, 1, 0, NULL, '00-00-00-00-00-00', 0, 1, NULL, 0, 0, NULL, NULL, 0, -1, 1, NULL, NULL, NULL, 0, NULL, 0.00, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO public.cc_card (id, creationdate, firstusedate, expirationdate, enableexpire, expiredays, username, useralias, uipass, credit, tariff, id_didgroup, activated, lastname, firstname, address, city, state, country, zipcode, phone, email, fax, inuse, simultaccess, currency, lastuse, nbused, typepaid, creditlimit, voipcall, sip_buddy, iax_buddy, language, redial, runservice, nbservice, id_campaign, num_trials_done, vat, servicelastrun, initialbalance, invoiceday, autorefill, loginkey, mac_addr, id_timezone, status, tag, voicemail_permitted, voicemail_activated, last_notification, email_notification, notify_email, credit_notification, id_group, company_name, company_website, vat_rn, traffic, traffic_target, discount, restriction, id_seria, serial, block, lock_pin, lock_date) VALUES (4, '2026-08-25 07:30:23.788544', '2026-08-25 09:36:42.385402', NULL, 0, 0, '1004', '1004', NULL, 461.7500, 1, 0, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'MGA', '2026-08-25', 2, 0, 0, 0, 0, 0, 'fr', '1002', 0, 0, 0, 0, 0.000, NULL, 0.0000, 1, 0, NULL, '00-00-00-00-00-00', 0, 1, NULL, 0, 0, NULL, NULL, 0, -1, 1, NULL, NULL, NULL, 0, NULL, 0.00, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO public.cc_card (id, creationdate, firstusedate, expirationdate, enableexpire, expiredays, username, useralias, uipass, credit, tariff, id_didgroup, activated, lastname, firstname, address, city, state, country, zipcode, phone, email, fax, inuse, simultaccess, currency, lastuse, nbused, typepaid, creditlimit, voipcall, sip_buddy, iax_buddy, language, redial, runservice, nbservice, id_campaign, num_trials_done, vat, servicelastrun, initialbalance, invoiceday, autorefill, loginkey, mac_addr, id_timezone, status, tag, voicemail_permitted, voicemail_activated, last_notification, email_notification, notify_email, credit_notification, id_group, company_name, company_website, vat_rn, traffic, traffic_target, discount, restriction, id_seria, serial, block, lock_pin, lock_date) VALUES (2, '2026-08-22 19:12:42.991153', '2026-08-25 07:44:05.912227', NULL, 0, 0, '1002', '1002', NULL, 946.2500, 1, 0, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'MGA', '2026-08-27', 10, 0, 0, 0, 0, 0, 'fr', '1003', 0, 0, 0, 0, 0.000, NULL, 0.0000, 1, 0, NULL, '00-00-00-00-00-00', 0, 1, NULL, 0, 0, NULL, NULL, 0, -1, 1, NULL, NULL, NULL, 0, NULL, 0.00, 0, NULL, NULL, 0, NULL, NULL);


--
-- Data for Name: cc_card_archive; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_card_group; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_card_group (id, name, description, users_perms, id_agent, flatrate, campaign_context, provisioning) VALUES (1, 'DEFAULT', 'This group is the default group used when you create a customer. It''s forbidden to delete it because you need at least one group but you can edit it.', 262142, NULL, 0.00000, NULL, NULL);


--
-- Data for Name: cc_card_history; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_card_package_offer; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_card_seria; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_card_subscription; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_cardgroup_service; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_charge; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_config; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (1, 'Card Number length', 'interval_len_cardnumber', '10-15', 'Card Number length, You can define a Range e.g: 10-15.', 0, '10-15,5-20,10-30', 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (2, 'Card Alias length', 'len_aliasnumber', '15', 'Card Number Alias Length e.g: 15.', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (3, 'Voucher length', 'len_voucher', '15', 'Voucher Number Length.', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (4, 'Base Currency', 'base_currency', 'usd', 'Base Currency to use for application.', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (5, 'Invoice Image', 'invoice_image', 'asterisk01.jpg', 'Image to Display on the Top of Invoice', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (6, 'Admin Email', 'admin_email', 'root@localhost', 'Web Administrator Email Address.', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (7, 'DID Bill Payment Day', 'didbilling_daytopay', '5', 'DID Bill Payment Day of Month', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (8, 'Manager Host', 'manager_host', 'localhost', 'Manager Host Address', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (9, 'Manager User ID', 'manager_username', 'myasterisk', 'Manger Host User Name', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (10, 'Manager Password', 'manager_secret', 'mycode', 'Manager Host Password', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (11, 'Use SMTP Server', 'smtp_server', '0', 'Define if you want to use an STMP server or Send Mail (value yes for server SMTP)', 1, 'yes,no', 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (12, 'SMTP Host', 'smtp_host', 'localhost', 'SMTP Hostname', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (13, 'SMTP UserName', 'smtp_username', '', 'User Name to connect on the SMTP server', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (14, 'SMTP Password', 'smtp_password', '', 'Password to connect on the SMTP server', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (15, 'Use Realtime', 'use_realtime', '1', 'if Disabled, it will generate the config files and offer an option to reload asterisk after an update on the Voip settings', 1, 'yes,no', 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (16, 'Go To Customer', 'customer_ui_url', '../../customer/index.php', 'Link to the customer account', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (17, 'Context Callback', 'context_callback', 'a2billing-callback', 'Contaxt to use in Callback', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (18, 'Extension', 'extension', '1000', 'Extension to call while callback.', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (19, 'Wait before callback', 'sec_wait_before_callback', '10', 'Seconds to wait before callback.', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (20, 'Avoid Repeat Duration', 'sec_avoid_repeate', '10', 'Number of seconds before the call-back can be re-initiated from the web page to prevent repeated and unwanted calls.', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (21, 'Time out', 'timeout', '20', 'if the callback doesnt succeed within the value below, then the call is deemed to have failed.', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (22, 'Answer on Call', 'answer_call', '1', 'if we want to manage the answer on the call. Disabling this for callback trigger numbers makes it ring not hang up.', 1, 'yes,no', 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (23, 'No of Predictive Calls', 'nb_predictive_call', '10', 'number of calls an agent will do when the call button is clicked.', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (24, 'Delay for Availability', 'nb_day_wait_before_retry', '1', 'Number of days to wait before the number becomes available to call again.', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (25, 'PD Contect', 'context_preditctivedialer', 'a2billing-predictivedialer', 'The context to redirect the call for the predictive dialer.', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (26, 'Max Time to call', 'predictivedialer_maxtime_tocall', '5400', 'When a call is made we need to limit the call duration : amount in seconds.', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (27, 'PD Caller ID', 'callerid', '123456', 'Set the callerID for the predictive dialer and call-back.', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (28, 'Callback CallPlan ID', 'all_callback_tariff', '1', 'ID Call Plan to use when you use the all-callback mode, check the ID in the "list Call Plan" - WebUI.', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (29, 'Server Group ID', 'id_server_group', '1', 'Define the group of servers that are going to be used by the callback.', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (30, 'Audio Intro', 'callback_audio_intro', 'prepaid-callback_intro', 'Audio intro message when the callback is initiate.', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (238, 'DIDX ID', 'didx_id', '708XXX', 'DIDX parameter : ID', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (47, 'WebPhone Server', 'webphoneserver', 'localhost', 'IP address or domain name of asterisk server that would be used by the web-phone.', 0, NULL, 'webcustomerui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (50, 'CallerID Limit', 'limit_callerid', '5', 'The total number of callerIDs for CLI Recognition that can be add by the customer.', 0, NULL, 'webcustomerui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (51, 'Trunk Name', 'sip_iax_info_trunkname', 'YourDomain', 'Trunk Name to show in sip/iax info.', 0, NULL, 'sip-iax-info');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (52, 'Codecs Allowed', 'sip_iax_info_allowcodec', 'g729', 'Allowed Codec, ulaw, gsm, g729.', 0, NULL, 'sip-iax-info');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (53, 'Host', 'sip_iax_info_host', 'YourDomain.com', 'Host information.', 0, NULL, 'sip-iax-info');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (54, 'IAX Parms', 'iax_additional_parameters', 'canreinvite = no', 'IAX Additional Parameters.', 0, NULL, 'sip-iax-info');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (55, 'SIP Parms', 'sip_additional_parameters', 'trustrpid = yes | sendrpid = yes | canreinvite = no', 'SIP Additional Parameters.', 0, NULL, 'sip-iax-info');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (56, 'Enable', 'enable', '1', 'Enable/Disable.', 1, 'yes,no', 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (57, 'HTTP Server Customer', 'http_server', 'http://www.YourDomain.com', 'Set the Server Address of Customer Website, It should be empty for productive Servers.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (58, 'HTTPS Server Customer', 'https_server', 'https://www.YourDomain.com', 'https://localhost - Enter here your Secure Customers Server Address, should not be empty for productive servers.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (59, 'Server Customer IP/Domain', 'http_cookie_domain', '26.63.165.200', 'Enter your Domain Name or IP Address for the Customers application, eg, 26.63.165.200.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (60, 'Secure Server Customer IP/Domain', 'https_cookie_domain', '26.63.165.200', 'Enter your Secure server Domain Name or IP Address for the Customers application, eg, 26.63.165.200.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (61, 'Application Customer Path', 'http_cookie_path', '/customer/', 'Enter the Physical path of your Customers Application on your server.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (62, 'Secure Application Customer Path', 'https_cookie_path', '/customer/', 'Enter the Physical path of your Customers Application on your Secure Server.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (63, 'Application Customer Physical Path', 'dir_ws_http_catalog', '/customer/', 'Enter the Physical path of your Customers Application on your server.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (64, 'Secure Application Customer Physical Path', 'dir_ws_https_catalog', '/customer/', 'Enter the Physical path of your Customers Application on your Secure server.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (65, 'Enable SSL', 'enable_ssl', '1', 'secure webserver for checkout procedure?', 1, 'yes,no', 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (66, 'HTTP Domain', 'http_domain', '26.63.165.200', 'Http Address.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (67, 'Directory Path', 'dir_ws_http', '/customer/', 'Directory Path.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (68, 'Payment Amount', 'purchase_amount', '1:2:5:10:20', 'define the different amount of purchase that would be available - 5 amount maximum (5:10:15).', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (69, 'Item Name', 'item_name', 'Credit Purchase', 'Item name that would be display to the user when he will buy credit.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (70, 'Currency Code', 'currency_code', 'USD', 'Currency for the Credit purchase, only one can be define here.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (72, 'Paypal Verify URL', 'paypal_verify_url', 'ssl://www.paypal.com', 'paypal transaction verification url.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (73, 'Authorize.NET Payment URL', 'authorize_payment_url', 'https://secure.authorize.net/gateway/transact.dll', 'Define here the URL of Authorize gateway.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (74, 'PayPal Store Name', 'store_name', 'Asterisk2Billing', 'paypal store name to show in the paypal site when customer will go to pay.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (75, 'Transaction Key', 'transaction_key', 'asdf1212fasd121554sd4f5s45sdf', 'Transaction Key for security of Epayment Max length of 60 Characters.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (76, 'Secret Word', 'moneybookers_secretword', '', 'Moneybookers secret word.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (77, 'Enable', 'enable_signup', '0', 'Enable Signup Module.', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (78, 'Captcha Security', 'enable_captcha', '1', 'enable Captcha on the signup module (value : YES or NO).', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (79, 'Credit', 'credit', '0', 'amount of credit applied to a new user.', 0, NULL, 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (80, 'CallPlan ID List', 'callplan_id_list', '1,2', 'the list of id of call plans which will be shown in signup.', 0, NULL, 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (81, 'Card Activation', 'activated', '0', 'Specify whether the card is created as active or pending.', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (82, 'Access Type', 'simultaccess', '0', 'Simultaneous or non concurrent access with the card - 0 = INDIVIDUAL ACCESS or 1 = SIMULTANEOUS ACCESS.', 0, NULL, 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (83, 'Paid Type', 'typepaid', '0', 'PREPAID CARD  =  0 - POSTPAY CARD  =  1.', 0, NULL, 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (84, 'Credit Limit', 'creditlimit', '0', 'Define credit limit, which is only used for a POSTPAY card.', 0, NULL, 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (85, 'Run Service', 'runservice', '0', 'Authorise the recurring service to apply on this card  -  Yes 1 - No 0.', 0, NULL, 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (86, 'Enable Expire', 'enableexpire', '0', 'Enable the expiry of the card  -  Yes 1 - No 0.', 0, NULL, 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (87, 'Date Format', 'expirationdate', '', 'Expiry Date format YYYY-MM-DD HH:MM:SS. For instance 2004-12-31 00:00:00', 0, NULL, 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (88, 'Expire Limit', 'expiredays', '0', 'The number of days after which the card will expire.', 0, NULL, 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (89, 'Create SIP', 'sip_account', '1', 'Create a sip account from signup ( default : yes ).', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (90, 'Create IAX', 'iax_account', '1', 'Create an iax account from signup ( default : yes ).', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (91, 'Activate Card', 'activatedbyuser', '0', 'active card after the new signup. if No, the Signup confirmation is needed and an email will be sent to the user with a link for activation (need to put the link into the Signup mail template).', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (92, 'Customer Interface URL', 'urlcustomerinterface', 'http://localhost/customer/', 'url of the customer interface to display after activation.', 0, NULL, 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (93, 'Asterisk Reload', 'reload_asterisk_if_sipiax_created', '0', 'Define if you want to reload Asterisk when a SIP / IAX Friend is created at signup time.', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (94, 'Backup Path', 'backup_path', '/tmp', 'Path to store backup of database.', 0, NULL, 'backup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (95, 'GZIP Path', 'gzip_exe', '/bin/gzip', 'Path for gzip.', 0, NULL, 'backup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (96, 'GunZip Path', 'gunzip_exe', '/bin/gunzip', 'Path for gunzip .', 0, NULL, 'backup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (97, 'MySql Dump Path', 'mysqldump', '/usr/bin/mysqldump', 'path for mysqldump.', 0, NULL, 'backup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (98, 'PGSql Dump Path', 'pg_dump', '/usr/bin/pg_dump', 'path for pg_dump.', 0, NULL, 'backup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (99, 'MySql Path', 'mysql', '/usr/bin/mysql', 'Path for MySql.', 0, NULL, 'backup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (100, 'PSql Path', 'psql', '/usr/bin/psql', 'Path for PSql.', 0, NULL, 'backup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (101, 'SIP File Path', 'buddy_sip_file', '/etc/asterisk/additional_a2billing_sip.conf', 'Path to store the asterisk configuration files SIP.', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (102, 'IAX File Path', 'buddy_iax_file', '/etc/asterisk/additional_a2billing_iax.conf', 'Path to store the asterisk configuration files IAX.', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (103, 'API Security Key', 'api_security_key', 'Ae87v56zzl34v', 'API have a security key to validate the http request, the key has to be sent after applying md5, Valid characters are [a-z,A-Z,0-9].', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (104, 'Authorized IP', 'api_ip_auth', '127.0.0.1', 'API to restrict the IPs authorised to make a request, Define The the list of ips separated by '';''.', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (105, 'Admin Email', 'email_admin', 'root@localhost', 'Administative Email.', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (106, 'MOH Directory', 'dir_store_mohmp3', '/var/lib/asterisk/mohmp3', 'MOH (Music on Hold) base directory.', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (107, 'MOH Classes', 'num_musiconhold_class', '10', 'Number of MOH classes you have created in musiconhold.conf : acc_1, acc_2... acc_10 class	etc....', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (108, 'Display Help', 'show_help', '1', 'Display the help section inside the admin interface  (YES - NO).', 1, 'yes,no', 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (109, 'Max File Upload Size', 'my_max_file_size_import', '1024000', 'File Upload parameters, PLEASE CHECK ALSO THE VALUE IN YOUR PHP.INI THE LIMIT IS 2MG BY DEFAULT .', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (110, 'Audio Directory Path', 'dir_store_audio', '/var/lib/asterisk/sounds/a2billing', 'Not used yet, The goal is to upload files and use them in the IVR.', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (111, 'Max Audio File Size', 'my_max_file_size_audio', '3072000', 'upload maximum file size.', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (112, 'Extensions Allowed', 'file_ext_allow', 'gsm, mp3, wav', 'File type extensions permitted to be uploaded such as "gsm, mp3, wav" (separated by ,).', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (113, 'Muzic Files Allowed', 'file_ext_allow_musiconhold', 'mp3', 'File type extensions permitted to be uploaded for the musiconhold such as "gsm, mp3, wav" (separate by ,).', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (114, 'Link Audio', 'link_audio_file', '0', 'Enable link on the CDR viewer to the recordings. (YES - NO).', 1, 'yes,no', 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (115, 'Monitor Path', 'monitor_path', '/var/spool/asterisk/monitor', 'Path to link the recorded monitor files.', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (116, 'Monitor Format', 'monitor_formatfile', 'gsm', 'FORMAT OF THE RECORDED MONITOR FILE.', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (119, 'Currency', 'currency_choose', 'usd, eur, cad, hkd', 'Allow the customer to chose the most appropriate currency ("all" can be used).', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (121, 'Vouvher Export Fields', 'voucher_export_field_list', 'voucher, credit, tag, activated, usedcardnumber, usedate, currency', 'Field to export in csv format from cc_voucher table.', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (122, 'Advance Mode', 'advanced_mode', '0', 'Advanced mode - Display additional configuration options on the ratecard (progressive rates, musiconhold, ...).', 1, 'yes,no', 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (123, 'SIP/IAX Delete', 'delete_fk_card', '1', 'Delete the SIP/IAX Friend & callerid when a card is deleted.', 1, 'yes,no', 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (124, 'Type', 'type', 'friend', 'Refer to sip.conf & iax.conf documentation for the meaning of those parameters.', 0, NULL, 'peer_friend');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (125, 'Allow', 'allow', 'ulaw,alaw,gsm,g729', 'Refer to sip.conf & iax.conf documentation for the meaning of those parameters.', 0, NULL, 'peer_friend');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (126, 'Context', 'context', 'a2billing', 'Refer to sip.conf & iax.conf documentation for the meaning of those parameters.', 0, NULL, 'peer_friend');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (127, 'Nat', 'nat', 'yes', 'Refer to sip.conf & iax.conf documentation for the meaning of those parameters.', 0, NULL, 'peer_friend');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (128, 'AMA Flag', 'amaflag', 'billing', 'Refer to sip.conf & iax.conf documentation for the meaning of those parameters.', 0, NULL, 'peer_friend');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (130, 'Host', 'host', 'dynamic', 'Refer to sip.conf & iax.conf documentation for the meaning of those parameters.', 0, NULL, 'peer_friend');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (131, 'DTMF Mode', 'dtmfmode', 'RFC2833', 'Refer to sip.conf & iax.conf documentation for the meaning of those parameters.', 0, NULL, 'peer_friend');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (132, 'Alarm Log File', 'cront_alarm', '/var/log/a2billing/cront_a2b_alarm.log', 'To disable application logging, remove/comment the log file name aside service.', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (133, 'Auto refill Log File', 'cront_autorefill', '/var/log/a2billing/cront_a2b_autorefill.log', 'To disable application logging, remove/comment the log file name aside service.', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (134, 'Bactch Process Log File', 'cront_batch_process', '/var/log/a2billing/cront_a2b_batch_process.log', 'To disable application logging, remove/comment the log file name aside service .', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (135, 'Archive Log File', 'cront_archive_data', '/var/log/a2billing/cront_a2b_archive_data.log', 'To disable application logging, remove/comment the log file name aside service .', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (136, 'DID Billing Log File', 'cront_bill_diduse', '/var/log/a2billing/cront_a2b_bill_diduse.log', 'To disable application logging, remove/comment the log file name aside service .', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (137, 'Subscription Fee Log File', 'cront_subscriptionfee', '/var/log/a2billing/cront_a2b_subscription_fee.log', 'To disable application logging, remove/comment the log file name aside service.', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (138, 'Currency Cront Log File', 'cront_currency_update', '/var/log/a2billing/cront_a2b_currency_update.log', 'To disable application logging, remove/comment the log file name aside service.', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (139, 'Invoice Cront Log File', 'cront_invoice', '/var/log/a2billing/cront_a2b_invoice.log', 'To disable application logging, remove/comment the log file name aside service.', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (140, 'Cornt Log File', 'cront_check_account', '/var/log/a2billing/cront_a2b_check_account.log', 'To disable application logging, remove/comment the log file name aside service .', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (141, 'Paypal Log File', 'paypal', '/var/log/a2billing/a2billing_paypal.log', 'paypal log file, to log all the transaction & error.', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (142, 'EPayment Log File', 'epayment', '/var/log/a2billing/a2billing_epayment.log', 'epayment log file, to log all the transaction & error .', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (143, 'ECommerce Log File', 'api_ecommerce', '/var/log/a2billing/a2billing_api_ecommerce_request.log', 'Log file to store the ecommerce API requests .', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (144, 'Callback Log File', 'api_callback', '/var/log/a2billing/a2billing_api_callback_request.log', 'Log file to store the CallBack API requests.', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (145, 'Webservice Card Log File', 'api_card', '/var/log/a2billing/a2billing_api_card.log', 'Log file to store the Card Webservice Logs', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (146, 'AGI Log File', 'agi', '/var/log/a2billing/a2billing_agi.log', 'File to log.', 0, NULL, 'log-files');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (147, 'Description', 'description', 'agi-config', 'Description/notes field', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (149, 'Answer Call', 'answer_call', '1', 'Manage the answer on the call. Disabling this for callback trigger numbers makes it ring not hang up.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (150, 'Play Audio', 'play_audio', '1', 'Play audio - this will disable all stream file but not the Get Data , for wholesale ensure that the authentication works and than number_try = 1.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (151, 'Say GoodBye', 'say_goodbye', '0', 'play the goodbye message when the user has finished.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (152, 'Play Language Menu', 'play_menulanguage', '0', 'enable the menu to choose the language, press 1 for English, pulsa 2 para el español, Pressez 3 pour Français', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (154, 'Intro Prompt', 'intro_prompt', '', 'Introduction prompt : to specify an additional prompt to play at the beginning of the application .', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (155, 'Min Call Credit', 'min_credit_2call', '0', 'Minimum amount of credit to use the application .', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (156, 'Min Bill Duration', 'min_duration_2bill', '0', 'this is the minimum duration in seconds of a call in order to be billed any call with a length less than min_duration_2bill will have a 0 cost useful not to charge callers for system errors when a call was answered but it actually didn''t connect.', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (157, 'Not Enough Credit', 'notenoughcredit_cardnumber', '0', 'if user doesn''t have enough credit to call a destination, prompt him to enter another cardnumber .', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (153, 'Force Language', 'force_language', 'fr', 'force the use of a language, if you dont want to use it leave the option empty, Values : ES, EN, FR, etc... (according to the audio you have installed).', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (148, 'Asterisk Version', 'asterisk_version', '1_8', 'Asterisk Version Information, 1_1,1_2,1_4 By Default it will take 1_2 or higher .', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (158, 'New Caller ID', 'notenoughcredit_assign_newcardnumber_cid', '0', 'if notenoughcredit_cardnumber = YES  then	assign the CallerID to the new cardnumber.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (160, 'Not Use DNID', 'no_auth_dnid', '2400,2300', 'list the dnid on which you want to avoid the use of the previous option "use_dnid" .', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (162, 'Force CallPlan', 'force_callplan_id', '', 'this will force to select a specific call plan by the Rate Engine.', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (164, 'Say Balance After Call', 'say_balance_after_call', '0', 'Play the balance to the user after the call (values : yes - no).', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (165, 'Say Rate', 'say_rateinitial', '0', 'Play the initial cost of the route (values : yes - no)', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (168, 'Force CLID', 'force_callerid', '', 'If auto_setcallerid is enabled, the value of force_callerid will be set as CallerID.', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (169, 'CLID Sanitize', 'cid_sanitize', '0', 'If force_callerid is not set, then the following option ensures that CID is set to one of the card''s configured caller IDs or blank if none available.(NO - disable this feature, caller ID can be anything, CID - Caller ID must be one of the customers caller IDs, DID - Caller ID must be one of the customers DID nos, BOTH - Caller ID must be one of the above two items)', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (171, 'Ask PIN', 'cid_askpincode_ifnot_callerid', '1', 'if the CID does not exist, then the caller will be prompt to enter his cardnumber .', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (172, 'FailOver LCR/LCD Prefix', 'failover_lc_prefix', '0', 'if we will failover for LCR/LCD prefix. For instance if you have 346 and 34 for if 346 fail it will try to outbound with 34 route.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (173, 'Auto CLID', 'cid_auto_assign_card_to_cid', '1', 'if the callerID authentication is enable and the authentication fails then the user will be prompt to enter his cardnumber;this option will bound the cardnumber entered to the current callerID so that next call will be directly authenticate.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (180, 'Auto CLID Security', 'callerid_authentication_over_cardnumber', '0', 'to check callerID over the cardnumber authentication (to guard against spoofing).', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (181, 'SIP Call', 'sip_iax_friends', '0', 'enable the option to call sip/iax friend for free (values : YES - NO).', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (182, 'SIP Call Prefix', 'sip_iax_pstn_direct_call_prefix', '555', 'if SIP_IAX_FRIENDS is active, you can define a prefix for the dialed digits to call a pstn number .', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (183, 'Direct Call', 'sip_iax_pstn_direct_call', '0', 'this will enable a prompt to enter your destination number. if number start by sip_iax_pstn_direct_call_prefix we do directly a sip iax call, if not we do a normal call.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (184, 'IVR Voucher Refill', 'ivr_voucher', '0', 'enable the option to refill card with voucher in IVR (values : YES - NO) .', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (185, 'IVR Voucher Prefix', 'ivr_voucher_prefix', '8', 'if ivr_voucher is active, you can define a prefix for the voucher number to refill your card, values : number - don''t forget to change prepaid-refill_card_with_voucher audio accordingly .', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (186, 'IVR Low Credit', 'jump_voucher_if_min_credit', '0', 'When the user credit are below the minimum credit to call min_credit jump directly to the voucher IVR menu  (values: YES - NO) .', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (188, 'SIP/IAX Dial Command Params', 'dialcommand_param_sipiax_friend', '|60|HiL(3600000:61000:30000)', 'by default (3600000  =  1HOUR MAX CALL).', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (189, 'Outbound Call', 'switchdialcommand', '0', 'Define the order to make the outbound call<br>YES -> SIP/dialedphonenumber@gateway_ip - NO  SIP/gateway_ip/dialedphonenumber<br>Both should work exactly the same but i experimented one case when gateway was supporting dialedphonenumber@gateway_ip, So in case of trouble, try it out.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (170, 'CLID Enable', 'cid_enable', '1', 'enable the callerid authentication if this option is active the CC system will check the CID of caller  .', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (161, 'Try Count', 'number_try', '1', 'number of times the user can dial different number.', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (163, 'Say Balance After Auth', 'say_balance_after_auth', '0', 'Play the balance to the user after the authentication (values : yes - no).', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (166, 'Say Duration', 'say_timetocall', '0', 'Play the amount of time that the user can call (values : yes - no).', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (167, 'Auto Set CLID', 'auto_setcallerid', '0', 'enable the setup of the callerID number before the outbound is made, by default the user callerID value will be use.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (190, 'Failover Retry Limit', 'failover_recursive_limit', '2', 'failover recursive search - define how many time we want to authorize the research of the failover trunk when a call fails (value : 0 - 20) .', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (191, 'Max Time', 'maxtime_tocall_negatif_free_route', '5400', 'This setting specifies an upper limit for the duration of a call to a destination for which the selling rate is less than or equal to 0.', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (192, 'Send Reminder', 'send_reminder', '0', 'Send a reminder email to the user when they are under min_credit_2call.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (193, 'Record Call', 'record_call', '0', 'enable to monitor the call (to record all the conversations) value : YES - NO .', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (194, 'Monitor File Format', 'monitor_formatfile', 'gsm', 'format of the recorded monitor file.', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (195, 'AGI Force Currency', 'agi_force_currency', '', 'Force to play the balance to the caller in a predefined currency, to use the currency set for by the customer leave this field empty.', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (198, 'File Enter Destination', 'file_conf_enter_destination', 'prepaid-enter-dest', 'Please enter the file name you want to play when we prompt the calling party to enter the destination number, file_conf_enter_destination = prepaid-enter-number-u-calling-1-or-011.', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (199, 'Bill Callback', 'callback_bill_1stleg_ifcall_notconnected', '1', 'Define if you want to bill the 1st leg on callback even if the call is not connected to the destination.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (200, 'International prefixes', 'international_prefixes', '011,00,09,1', 'List the prefixes you want stripped off if the call plan requires it', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (201, 'Server GMT', 'server_GMT', 'GMT+10:00', 'Define the sever gmt time', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (202, 'Invoice Template Path', 'invoice_template_path', '../invoice/', 'gives invoice template path from default one', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (203, 'Outstanding Template Path', 'outstanding_template_path', '../outstanding/', 'gives outstanding template path from default one', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (204, 'Sales Template Path', 'sales_template_path', '../sales/', 'gives sales template path from default one', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (206, 'CallPlan threshold Deck switch', 'callplan_deck_minute_threshold', '', 'CallPlan threshold Deck switch. <br/>This option will switch the user callplan from one call plan ID to and other Callplan ID
The parameters are as follow : <br/>
-- ID of the first callplan : called seconds needed to switch to the next CallplanID <br/>
-- ID of the second callplan : called seconds needed to switch to the next CallplanID <br/>
-- if not needed seconds are defined it will automatically switch to the next one <br/>
-- if defined we will sum the previous needed seconds and check if the caller had done at least the amount of calls necessary to go to the next step and have the amount of seconds needed<br/>
value example for callplan_deck_minute_threshold = 1:300, 2:60, 3', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (207, 'Max Time For Unlimited Calls', 'maxtime_tounlimited_calls', '5400', 'For unlimited calls, limit the duration: amount in seconds .', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (208, 'Max Time For Free Calls', 'maxtime_tofree_calls', '5400', 'For free calls, limit the duration: amount in seconds .', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (209, 'Payment Amount', 'purchase_amount_agent', '100:200:500:1000', 'define the different amount of purchase that would be available.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (210, 'List of possible values to notify', 'values_notifications', '10:20:50:100:500:1000', 'Possible values to choose when the user receive a notification. You can define a List e.g: 10:20:100.', 0, NULL, 'notifications');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (211, 'Notifications Modules', 'notification', '1', 'Enable or Disable the module of notification for the customers', 1, 'yes,no', 'webcustomerui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (212, 'Notications Cron Module', 'cron_notifications', '1', 'Enable or Disable the cron module of notification for the customers. If it correctly configured in the crontab', 0, 'yes,no', 'notifications');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (213, 'Notications Delay', 'delay_notifications', '1', 'Delay in number of days to send an other notification for the customers. If the value is 0, it will notify the user everytime the cront is running.', 0, NULL, 'notifications');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (215, 'Extra charge DIDs', 'extracharge_did', '1800,1900', 'Add extra per-minute charges to this comma-separated list of DNIDs; needs "extracharge_fee" and "extracharge_buyfee"', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (218, 'Card Serial Pad Length', 'card_serial_length', '7', 'Value of zero padding for serial. If this value set to 3 serial wil looks like 001', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (219, 'Dial Balance reservation', 'dial_balance_reservation', '0.25', 'Credit to reserve from the balance when a call is made. This will prevent negative balance on huge peak.', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (159, 'Use DNID', 'use_dnid', '1', 'if YES it will use the DNID and try to dial out, without asking for the phonenumber to call.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (220, 'Menu Language Order', 'conf_order_menulang', 'en:fr:es', 'Enter the list of languages authorized for the menu.Use the code language separate by a colon charactere e.g: en:es:fr', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (221, 'Disable annoucement the second of the times that the card can call', 'disable_announcement_seconds', '0', 'Desactived the annoucement of the seconds when there are more of one minutes (values : yes - no)', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (222, 'Charge for the paypal extra fees', 'charge_paypal_fee', '0', 'Actived, if you want assum the fee of paypal and don''t apply it on the customer (values : yes - no)', 1, 'yes,no', 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (224, 'Context Campaign''s Callback', 'context_campaign_callback', 'a2billing-campaign-callback', 'Context to use in Campaign of Callback', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (225, 'Default Context forward Campaign''s Callback ', 'default_context_campaign', 'campaign', 'Context to use by default to forward the call in Campaign of Callback', 0, NULL, 'callback');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (196, 'Currency Associated', 'currency_association', 'usd:dollars,mxn:pesos,eur:euros,mga:ariarys,all:credit', 'Define all the audio (without file extensions) that you want to play according to currency (use , to separate, ie "usd:prepaid-dollar,mxn:pesos,eur:Euro,all:credit").', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (226, 'Card Show Fields', 'card_show_field_list', 'id:,username:, useralias:, lastname:,id_group:, id_agent:,  credit:, tariff:, status:, language:, inuse:, currency:, sip_buddy:, iax_buddy:, nbused, id_seria, serial:', 'Fields to show in Customer. Order is important. You can setup size of field using "fieldname:10%" notation or "fieldname:" for harcoded size,"fieldname" for autosize. <br/>You can use:<br/> id,username, useralias, lastname, id_group, id_agent,  credit, tariff, status, language, inuse, currency, sip_buddy, iax_buddy, nbused, firstname, email, discount, callerid', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (227, 'Enable CDR local cache', 'cache_enabled', '0', 'If you want enabled the local cache to save the CDR in a SQLite Database.', 1, 'yes,no', 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (228, 'Path for the CDR cache file', 'cache_path', '/etc/asterisk/cache_a2billing', 'Defined the file that you want use for the CDR cache to save the CDR in a local SQLite database.', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (229, 'PNL Pay Phones', 'report_pnl_pay_phones', '(8887798764,0.02,0.06)', 'Info for PNL report. Must be in form "(number1,buycost,sellcost),(number2,buycost,sellcost)", number can be prefix, i.e 1800', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (230, 'PNL Toll Free Numbers', 'report_pnl_toll_free', '(6136864646,0.1,0),(6477249717,0.1,0)', 'Info for PNL report. must be in form "(number1,buycost,sellcost),(number2,buycost,sellcost)", number can be prefix, i.e 1800', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (232, 'Logging', 'logging_level', '3', '0 = FATAL; 1 = ERROR; WARN = 2 ; INFO = 3 ; DEBUG = 4', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (233, 'Enable info module about customers', 'customer_info_enabled', 'LEFT', 'If you want enabled the info module customer and place it somewhere on the home page.', 0, 'NONE,LEFT,CENTER,RIGHT', 'dashboard');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (234, 'Enable info module about refills', 'refill_info_enabled', 'CENTER', 'If you want enabled the info module refills and place it somewhere on the home page.', 0, 'NONE,LEFT,CENTER,RIGHT', 'dashboard');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (235, 'Enable info module about payments', 'payment_info_enabled', 'CENTER', 'If you want enabled the info module payments and place it somewhere on the home page.', 0, 'NONE,LEFT,CENTER,RIGHT', 'dashboard');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (236, 'Enable info module about calls', 'call_info_enabled', 'RIGHT', 'If you want enabled the info module calls and place it somewhere on the home page.', 0, 'NONE,LEFT,CENTER,RIGHT', 'dashboard');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (237, 'PlugnPay Payment URL', 'plugnpay_payment_url', 'https://pay1.plugnpay.com/payment/pnpremote.cgi', 'Define here the URL of PlugnPay gateway.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (239, 'DIDX PASS', 'didx_pass', 'XXXXXXXXXX', 'DIDX parameter : Password', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (240, 'DIDX MIN RATING', 'didx_min_rating', '0', 'DIDX parameter : min rating', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (241, 'DIDX RING TO', 'didx_ring_to', '0', 'DIDX parameter : ring to', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (242, 'HTTP Server Agent', 'http_server_agent', 'http://www.YourDomain.com', 'Set the Server Address of Agent Website, It should be empty for productive Servers.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (243, 'HTTPS Server Agent', 'https_server_agent', 'https://www.YourDomain.com', 'https://localhost - Enter here your Secure Agents Server Address, should not be empty for productive servers.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (244, 'Server Agent IP/Domain', 'http_cookie_domain_agent', '26.63.165.200', 'Enter your Domain Name or IP Address for the Agents application, eg, 26.63.165.200.', 0, NULL, '5');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (245, 'Secure Server Agent IP/Domain', 'https_cookie_domain_agent', '26.63.165.200', 'Enter your Secure server Domain Name or IP Address for the Agents application, eg, 26.63.165.200.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (246, 'Application Agent Path', 'http_cookie_path_agent', '/agent/Public/', 'Enter the Physical path of your Agents Application on your server.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (247, 'Secure Application Agent Path', 'https_cookie_path_agent', '/agent/Public/', 'Enter the Physical path of your Agents Application on your Secure Server.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (248, 'Application Agent Physical Path', 'dir_ws_http_catalog_agent', '/agent/Public/', 'Enter the Physical path of your Agents Application on your server.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (249, 'Secure Application Agent Physical Path', 'dir_ws_https_catalog_agent', '/agent/Public/', 'Enter the Physical path of your Agents Application on your Secure server.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (250, 'Personal Info', 'personalinfo', '1', 'Enable or disable the page which allow agent to modify its personal information.', 0, 'yes,no', 'webagentui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (251, 'Return URL distant Login', 'return_url_distant_login', '', 'URL for specific return if an error occur after login', 0, NULL, 'webcustomerui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (252, 'Return URL distant Forget Password', 'return_url_distant_forgetpassword', '', 'URL for specific return if an error occur after forgetpassword', 0, NULL, 'webcustomerui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (216, 'Extra charge DID fees', 'extracharge_fee', '0,0', 'Comma-separated list of extra sell-rate charges corresponding to the DIDs in "extracharge_did" - ie : 0.08,0.18', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (217, 'Extra charge DID buy fees', 'extracharge_buyfee', '0,0', 'Comma-separated list of extra buy-rate charges corresponding to the DIDs in "extracharge_did" - ie : 0.04,0.13', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (120, 'Card Export Fields', 'card_export_field_list', 'cc_card.id, username, useralias, lastname, credit, tariff, activated, language, inuse, currency, sip_buddy, iax_buddy, nbused, mac_addr', 'Fields to export in csv format from cc_card table.', 0, NULL, 'webui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (253, 'SMTP Port', 'smtp_port', '25', 'Port to connect on the SMTP server', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (254, 'SMTP Secure', 'smtp_secure', '', 'sets the prefix to the SMTP server : tls ; ssl', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (255, 'Option CallerID update', 'callerid_update', '0', 'Prompt the caller to update his callerID', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (256, 'Cents Currency Associated', 'currency_cents_association', 'usd:prepaid-cents,eur:prepaid-cents,gbp:prepaid-pence,all:credit', 'Define all the audio (without file extensions) that you want to play according to cents currency (use , to separate, ie "amd:lumas").By default the file used is "prepaid-cents" .Use plural to define the cents currency sound, but import two sounds but cents currency defined : ending by ''s'' and not ending by ''s'' (i.e. for lumas , add 2 files : ''lumas'' and ''luma'') ', 0, NULL, 'ivr_creditcard');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (257, 'Option Local Dialing', 'local_dialing_addcountryprefix', '0', 'Add the countryprefix of the user in front of the dialed number if this one have only 1 leading zero', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (258, 'Call to free DID Dial Command Params', 'dialcommand_param_call_2did', '|60|HiL(%timeout%:61000:30000)', '%timeout% is the value of the paramater : ''Max time to Call a DID no billed''', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (259, 'Max time to Call a DID no billed', 'max_call_call_2_did', '3600', 'max time to call a did of the system and not billed . this max value is in seconde and by default (3600 = 1HOUR MAX CALL).', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (129, 'Qualify', 'qualify', 'no', 'Refer to sip.conf & iax.conf documentation for the meaning of those parameters.', 0, NULL, 'peer_friend');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (231, 'Verbosity', 'verbosity_level', '5', '0 = FATAL; 1 = ERROR; WARN = 2 ; INFO = 3 ; DEBUG = 4', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (71, 'Paypal Payment URL', 'paypal_payment_url', 'https://www.paypal.com/cgi-bin/webscr', 'Define here the URL of paypal gateway the payment (to test with paypal sandbox).', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (260, 'Auto Create Card', 'cid_auto_create_card', '0', 'if the callerID is captured on a2billing, this option will create automatically a new card and add the callerID to it.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (261, 'Auto Create Card Length', 'cid_auto_create_card_len', '10', 'set the length of the card that will be auto create (ie, 10).', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (262, 'Auto Create Card Type', 'cid_auto_create_card_typepaid', 'PREPAID', 'billing type of the new card( value : POSTPAID or PREPAID) .', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (263, 'Auto Create Card Credit', 'cid_auto_create_card_credit', '0', 'amount of credit of the new card.', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (264, 'Auto Create Card Limit', 'cid_auto_create_card_credit_limit', '0', 'if postpay, define the credit limit for the card.', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (265, 'Auto Create Card TariffGroup', 'cid_auto_create_card_tariffgroup', '1', 'the tariffgroup to use for the new card (this is the ID that you can find on the admin web interface) .', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (266, 'Paypal Amount Subscription', 'paypal_subscription_amount', '10', 'amount to billed each recurrence of payment ', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (267, 'Paypal Subscription Time period number', 'paypal_subscription_period_number', '1', 'number of time periods between each recurrence', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (268, 'Paypal Subscription Time period', 'paypal_subscription_time_period', 'M', 'time period (D=days, W=weeks, M=months, Y=years)', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (269, 'Enable PayPal subscription', 'paypal_subscription_enabled', '0', 'Enable Paypal subscription on the User home page, you need a Premier or Business account.', 1, 'yes,no', 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (270, 'Paypal Subscription account', 'paypal_subscription_account', '', 'Your PayPal ID or an email address associated with your PayPal account. Email addresses must be confirmed and bound to a Premier or Business Verified Account.', 0, NULL, 'epayment_method');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (271, 'Base Country', 'base_country', 'USA', 'Define the country code in 3 letters where you are located (ISO 3166-1 : "USA" for United States)', 0, '', 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (272, 'Base Language', 'base_language', 'en', 'Define your language code in 2 letters (ISO 639 : "en" for English)', 0, '', 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (273, 'Authorize Remittance Request', 'remittance_request', '1', 'Enable or disable the link which allow agent to submit a remittance request', 0, 'yes,no', 'webagentui');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (275, 'Archive Calls', 'archive_call_prior_x_month', '24', 'A cront can be enabled in order to archive your CDRs, this setting allow to define prior which month it will archive', 0, NULL, 'backup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (276, 'Days to bill before month anniversary', 'subscription_bill_days_before_anniversary', '3', 'Numbers of days to bill a subscription service before the month anniversary', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (277, 'Enable info module about system', 'system_info_enable', 'LEFT', 'Enabled this if you want to display the info module and place it somewhere on the Dashboard.', 0, 'NONE,LEFT,CENTER,RIGHT', 'dashboard');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (278, 'Enable news module', 'news_enabled', 'RIGHT', 'Enabled this if you want to display the news module and place it somewhere on the Dashboard.', 0, 'NONE,LEFT,CENTER,RIGHT', 'dashboard');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (279, 'Busy Timeout', 'busy_timeout', '1', 'Define the timeout in second when indicate the busy condition', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (280, 'Callback Reduce Balance', 'callback_reduce_balance', '1', 'Define the amount to reduce the balance on Callback in order to make sure that the B leg wont alter the account into a negative value.', 0, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (281, 'Language field', 'field_language', '1', 'Enable The Language Field -  Yes 1 - No 0.', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (282, 'Currency field', 'field_currency', '1', 'Enable The Currency Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (283, 'Last Name Field', 'field_lastname', '1', 'Enable The Last Name Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (284, 'First Name Field', 'field_firstname', '1', 'Enable The First Name Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (285, 'Address Field', 'field_address', '1', 'Enable The Address Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (286, 'City Field', 'field_city', '1', 'Enable The City Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (287, 'State Field', 'field_state', '1', 'Enable The State Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (288, 'Country Field', 'field_country', '1', 'Enable The Country Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (289, 'Zipcode Field', 'field_zipcode', '1', 'Enable The Zipcode Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (290, 'Timezone Field', 'field_id_timezone', '1', 'Enable The Timezone Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (291, 'Phone Field', 'field_phone', '1', 'Enable The Phone Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (292, 'Fax Field', 'field_fax', '1', 'Enable The Fax Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (293, 'Company Name Field', 'field_company', '1', 'Enable The Company Name Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (294, 'Company Website Field', 'field_company_website', '1', 'Enable The Company Website Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (295, 'VAT Registration Number Field', 'field_VAT_RN', '1', 'Enable The VAT Registration Number Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (296, 'Traffic Field', 'field_traffic', '1', 'Enable The Traffic Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (297, 'Traffic Target Field', 'field_traffic_target', '1', 'Enable The Traffic Target Field - Yes 1 - No 0. ', 1, 'yes,no', 'signup');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (298, 'IVR Locking option', 'ivr_enable_locking_option', '0', 'Enable the IVR which allow the users to lock their account with an extra lock code.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (299, 'IVR Account Information', 'ivr_enable_account_information', '0', 'Enable the IVR which allow the users to retrieve different information about their account.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (300, 'IVR Speed Dial', 'ivr_enable_ivr_speeddial', '0', 'Enable the IVR which allow the users add speed dial.', 1, 'yes,no', 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (302, 'Debug Shell Mode', 'debugshell', '0', NULL, 1, NULL, 'agi-conf1');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (274, 'Asterisk Version Global', 'asterisk_version', '1_8', 'Asterisk Version Information, 1_1, 1_2, 1_4, 1_6. By Default the version is 1_4.', 0, NULL, 'global');
INSERT INTO public.cc_config (id, config_title, config_key, config_value, config_description, config_valuetype, config_listvalues, config_group_title) VALUES (187, 'Dial Command Params', 'dialcommand_param', '|20|HRirL(%timeout%)', 'More information about the Dial : http://voip-info.org/wiki-Asterisk+cmd+dial<br>30 :  The timeout parameter is optional. If not specifed, the Dial command will wait indefinitely, exiting only when the originating channel hangs up, or all the dialed channels return a busy or error condition. Otherwise it specifies a maximum time, in seconds, that the Dial command is to wait for a channel to answer.<br>H: Allow the caller to hang up by dialing * <br>r: Generate a ringing tone for the calling party<br>R: Indicate ringing to the calling party when the called party indicates ringing, pass no audio until answered.<br>g: When the called party hangs up, exit to execute more commands in the current context. (new in 1.4)<br>i: Asterisk will ignore any forwarding (302 Redirect) requests received. Essential for DID usage to prevent fraud. (new in 1.4)<br>m: Provide Music on Hold to the calling party until the called channel answers.<br>L(x[:y][:z]): Limit the call to ''x'' ms, warning when ''y'' ms are left, repeated every ''z'' ms)<br>%timeout% tag is replaced by the calculated timeout according the credit & destination rate!.', 0, NULL, 'agi-conf1');


--
-- Data for Name: cc_config_group; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (1, 'global', 'This configuration group handles the global settings for application.');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (2, 'callback', 'This configuration group handles calllback settings.');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (3, 'webcustomerui', 'This configuration group handles Web Customer User Interface.');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (4, 'sip-iax-info', 'SIP & IAX client configuration information.');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (5, 'epayment_method', 'Epayment Methods Configuration.');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (6, 'signup', 'This configuration group handles the signup related settings.');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (7, 'backup', 'This configuration group handles the backup/restore related settings.');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (8, 'webui', 'This configuration group handles the WEBUI and API Configuration.');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (9, 'peer_friend', 'This configuration group define parameters for the friends creation.');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (10, 'log-files', 'This configuration group handles the Log Files Directory Paths.');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (11, 'agi-conf1', 'This configuration group handles the AGI Configuration.');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (12, 'notifications', 'This configuration group handles the notifcations configuration');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (13, 'dashboard', 'This configuration group handles the dashboard configuration');
INSERT INTO public.cc_config_group (id, group_title, group_description) VALUES (14, 'webagentui', 'This configuration group handles Web Agent Interface.');


--
-- Data for Name: cc_configuration; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (1, 'Login Username', 'MODULE_PAYMENT_AUTHORIZENET_LOGIN', 'testing', 'The login username used for the Authorize.net service', 0, NULL, NULL);
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (2, 'Transaction Key', 'MODULE_PAYMENT_AUTHORIZENET_TXNKEY', 'Test', 'Transaction Key used for encrypting TP data', 0, NULL, NULL);
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (3, 'Transaction Mode', 'MODULE_PAYMENT_AUTHORIZENET_TESTMODE', 'Test', 'Transaction mode used for processing orders', 0, NULL, 'tep_cfg_select_option(array(''Test'', ''Production''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (4, 'Transaction Method', 'MODULE_PAYMENT_AUTHORIZENET_METHOD', 'Credit Card', 'Transaction method used for processing orders', 0, NULL, 'tep_cfg_select_option(array(''Credit Card'', ''eCheck''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (5, 'Customer Notifications', 'MODULE_PAYMENT_AUTHORIZENET_EMAIL_CUSTOMER', 'False', 'Should Authorize.Net e-mail a receipt to the customer?', 0, NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (7, 'Enable PayPal Module', 'MODULE_PAYMENT_PAYPAL_STATUS', 'True', 'Do you want to accept PayPal payments?', 0, NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (8, 'E-Mail Address', 'MODULE_PAYMENT_PAYPAL_ID', 'you@yourbusiness.com', 'The e-mail address to use for the PayPal service', 0, NULL, NULL);
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (10, 'E-Mail Address', 'MODULE_PAYMENT_MONEYBOOKERS_ID', 'you@yourbusiness.com', 'The eMail address to use for the moneybookers service', 0, NULL, NULL);
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (11, 'Referral ID', 'MODULE_PAYMENT_MONEYBOOKERS_REFID', '989999', 'Your personal Referral ID from moneybookers.com', 0, NULL, NULL);
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (13, 'Transaction Language', 'MODULE_PAYMENT_MONEYBOOKERS_LANGUAGE', 'Selected Language', 'The default language for the payment transactions', 0, NULL, 'tep_cfg_select_option(array(''Selected Language'',''EN'', ''DE'', ''ES'', ''FR''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (14, 'Enable moneybookers Module', 'MODULE_PAYMENT_MONEYBOOKERS_STATUS', 'True', 'Do you want to accept moneybookers payments?', 0, NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (15, 'Enable PlugnPay Module', 'MODULE_PAYMENT_PLUGNPAY_STATUS', 'True', 'Do you want to accept payments through PlugnPay?', 0, NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (16, 'Login Username', 'MODULE_PAYMENT_PLUGNPAY_LOGIN', 'Your Login Name', 'Enter your PlugnPay account username', 0, NULL, NULL);
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (17, 'Publisher Email', 'MODULE_PAYMENT_PLUGNPAY_PUBLISHER_EMAIL', 'Enter Your Email Address', 'The email address you want PlugnPay conformations sent to', 0, NULL, NULL);
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (18, 'cURL Setup', 'MODULE_PAYMENT_PLUGNPAY_CURL', 'Not Compiled', 'Whether cURL is compiled into PHP or not.  Windows users, select not compiled.', 0, NULL, 'tep_cfg_select_option(array(''Not Compiled'', ''Compiled''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (19, 'cURL Path', 'MODULE_PAYMENT_PLUGNPAY_CURL_PATH', 'The Path To cURL', 'For Not Compiled mode only, input path to the cURL binary (i.e. c:/curl/curl)', 0, NULL, NULL);
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (20, 'Transaction Mode', 'MODULE_PAYMENT_PLUGNPAY_TESTMODE', 'Test', 'Transaction mode used for processing orders', 0, NULL, 'tep_cfg_select_option(array(''Test'', ''Test And Debug'', ''Production''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (21, 'Require CVV', 'MODULE_PAYMENT_PLUGNPAY_CVV', 'yes', 'Ask For CVV information', 0, NULL, 'tep_cfg_select_option(array(''yes'', ''no''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (22, 'Transaction Method', 'MODULE_PAYMENT_PLUGNPAY_PAYMETHOD', 'credit', 'Transaction method used for processing orders.<br><b>NOTE:</b> Selecting ''onlinecheck'' assumes you will offer ''credit'' as well.', 0, NULL, 'tep_cfg_select_option(array(''credit'', ''onlinecheck''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (23, 'Authorization Type', 'MODULE_PAYMENT_PLUGNPAY_CCMODE', 'authpostauth', 'Credit card processing mode', 0, NULL, 'tep_cfg_select_option(array(''authpostauth'', ''authonly''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (24, 'Customer Notifications', 'MODULE_PAYMENT_PLUGNPAY_DONTSNDMAIL', 'yes', 'Should PlugnPay not email a receipt to the customer?', 0, NULL, 'tep_cfg_select_option(array(''yes'', ''no''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (25, 'Accepted Credit Cards', 'MODULE_PAYMENT_PLUGNPAY_ACCEPTED_CC', 'Mastercard, Visa', 'The credit cards you currently accept', 0, NULL, '_selectOptions(array(''Amex'',''Discover'', ''Mastercard'', ''Visa''), ');
INSERT INTO public.cc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_type, use_function, set_function) VALUES (6, 'Enable Authorize.net Module', 'MODULE_PAYMENT_AUTHORIZENET_STATUS', 'False', 'Do you want to accept Authorize.net payments?', 0, NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');


--
-- Data for Name: cc_country; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (1, 'AFG', '93', 'Afghanistan');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (2, 'ALB', '355', 'Albania');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (3, 'DZA', '213', 'Algeria');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (4, 'ASM', '684', 'American Samoa');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (5, 'AND', '376', 'Andorra');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (6, 'AGO', '244', 'Angola');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (7, 'AIA', '1264', 'Anguilla');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (8, 'ATA', '672', 'Antarctica');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (9, 'ATG', '1268', 'Antigua And Barbuda');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (10, 'ARG', '54', 'Argentina');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (11, 'ARM', '374', 'Armenia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (12, 'ABW', '297', 'Aruba');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (13, 'AUS', '61', 'Australia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (14, 'AUT', '43', 'Austria');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (15, 'AZE', '994', 'Azerbaijan');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (16, 'BHS', '1242', 'Bahamas');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (17, 'BHR', '973', 'Bahrain');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (18, 'BGD', '880', 'Bangladesh');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (19, 'BRB', '1246', 'Barbados');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (20, 'BLR', '375', 'Belarus');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (21, 'BEL', '32', 'Belgium');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (22, 'BLZ', '501', 'Belize');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (23, 'BEN', '229', 'Benin');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (24, 'BMU', '1441', 'Bermuda');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (25, 'BTN', '975', 'Bhutan');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (26, 'BOL', '591', 'Bolivia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (27, 'BIH', '387', 'Bosnia And Herzegovina');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (28, 'BWA', '267', 'Botswana');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (29, 'BVT', '0', 'Bouvet Island');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (30, 'BRA', '55', 'Brazil');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (31, 'IOT', '1284', 'British Indian Ocean Territory');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (32, 'BRN', '673', 'Brunei Darussalam');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (33, 'BGR', '359', 'Bulgaria');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (34, 'BFA', '226', 'Burkina Faso');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (35, 'BDI', '257', 'Burundi');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (36, 'KHM', '855', 'Cambodia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (37, 'CMR', '237', 'Cameroon');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (38, 'CAN', '1', 'Canada');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (39, 'CPV', '238', 'Cape Verde');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (40, 'CYM', '1345', 'Cayman Islands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (41, 'CAF', '236', 'Central African Republic');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (42, 'TCD', '235', 'Chad');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (43, 'CHL', '56', 'Chile');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (44, 'CHN', '86', 'China');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (45, 'CXR', '618', 'Christmas Island');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (46, 'CCK', '61', 'Cocos (Keeling); Islands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (47, 'COL', '57', 'Colombia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (48, 'COM', '269', 'Comoros');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (49, 'COG', '242', 'Congo');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (50, 'COD', '243', 'Congo, The Democratic Republic Of The');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (51, 'COK', '682', 'Cook Islands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (52, 'CRI', '506', 'Costa Rica');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (54, 'HRV', '385', 'Croatia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (55, 'CUB', '53', 'Cuba');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (56, 'CYP', '357', 'Cyprus');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (57, 'CZE', '420', 'Czech Republic');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (58, 'DNK', '45', 'Denmark');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (59, 'DJI', '253', 'Djibouti');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (60, 'DMA', '1767', 'Dominica');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (61, 'DOM', '1809', 'Dominican Republic');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (62, 'ECU', '593', 'Ecuador');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (63, 'EGY', '20', 'Egypt');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (64, 'SLV', '503', 'El Salvador');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (65, 'GNQ', '240', 'Equatorial Guinea');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (66, 'ERI', '291', 'Eritrea');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (67, 'EST', '372', 'Estonia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (68, 'ETH', '251', 'Ethiopia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (69, 'FLK', '500', 'Falkland Islands (Malvinas);');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (70, 'FRO', '298', 'Faroe Islands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (71, 'FJI', '679', 'Fiji');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (72, 'FIN', '358', 'Finland');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (73, 'FRA', '33', 'France');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (74, 'GUF', '596', 'French Guiana');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (75, 'PYF', '594', 'French Polynesia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (76, 'ATF', '689', 'French Southern Territories');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (77, 'GAB', '241', 'Gabon');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (78, 'GMB', '220', 'Gambia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (79, 'GEO', '995', 'Georgia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (80, 'DEU', '49', 'Germany');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (81, 'GHA', '233', 'Ghana');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (82, 'GIB', '350', 'Gibraltar');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (83, 'GRC', '30', 'Greece');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (84, 'GRL', '299', 'Greenland');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (85, 'GRD', '1473', 'Grenada');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (86, 'GLP', '590', 'Guadeloupe');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (87, 'GUM', '1671', 'Guam');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (88, 'GTM', '502', 'Guatemala');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (89, 'GIN', '224', 'Guinea');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (90, 'GNB', '245', 'Guinea-Bissau');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (91, 'GUY', '592', 'Guyana');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (92, 'HTI', '509', 'Haiti');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (93, 'HMD', '0', 'Heard Island And McDonald Islands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (94, 'VAT', '0', 'Holy See (Vatican City State);');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (95, 'HND', '504', 'Honduras');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (96, 'HKG', '852', 'Hong Kong');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (97, 'HUN', '36', 'Hungary');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (98, 'ISL', '354', 'Iceland');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (99, 'IND', '91', 'India');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (100, 'IDN', '62', 'Indonesia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (101, 'IRN', '98', 'Iran, Islamic Republic Of');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (102, 'IRQ', '964', 'Iraq');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (103, 'IRL', '353', 'Ireland');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (104, 'ISR', '972', 'Israel');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (105, 'ITA', '39', 'Italy');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (106, 'JAM', '1876', 'Jamaica');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (107, 'JPN', '81', 'Japan');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (108, 'JOR', '962', 'Jordan');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (109, 'KAZ', '7', 'Kazakhstan');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (110, 'KEN', '254', 'Kenya');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (111, 'KIR', '686', 'Kiribati');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (112, 'PRK', '850', 'Korea, Democratic People''s Republic Of');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (113, 'KOR', '82', 'Korea, Republic of');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (114, 'KWT', '965', 'Kuwait');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (115, 'KGZ', '996', 'Kyrgyzstan');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (116, 'LAO', '856', 'Lao People''s Democratic Republic');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (117, 'LVA', '371', 'Latvia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (118, 'LBN', '961', 'Lebanon');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (119, 'LSO', '266', 'Lesotho');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (120, 'LBR', '231', 'Liberia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (121, 'LBY', '218', 'Libyan Arab Jamahiriya');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (122, 'LIE', '423', 'Liechtenstein');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (123, 'LTU', '370', 'Lithuania');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (124, 'LUX', '352', 'Luxembourg');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (125, 'MAC', '853', 'Macao');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (126, 'MKD', '389', 'Macedonia, The Former Yugoslav Republic Of');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (127, 'MDG', '261', 'Madagascar');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (128, 'MWI', '265', 'Malawi');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (129, 'MYS', '60', 'Malaysia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (130, 'MDV', '960', 'Maldives');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (131, 'MLI', '223', 'Mali');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (132, 'MLT', '356', 'Malta');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (133, 'MHL', '692', 'Marshall islands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (134, 'MTQ', '596', 'Martinique');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (135, 'MRT', '222', 'Mauritania');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (136, 'MUS', '230', 'Mauritius');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (137, 'MYT', '269', 'Mayotte');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (138, 'MEX', '52', 'Mexico');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (139, 'FSM', '691', 'Micronesia, Federated States Of');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (140, 'MDA', '1808', 'Moldova, Republic Of');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (141, 'MCO', '377', 'Monaco');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (142, 'MNG', '976', 'Mongolia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (143, 'MSR', '1664', 'Montserrat');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (144, 'MAR', '212', 'Morocco');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (145, 'MOZ', '258', 'Mozambique');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (146, 'MMR', '95', 'Myanmar');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (147, 'NAM', '264', 'Namibia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (148, 'NRU', '674', 'Nauru');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (149, 'NPL', '977', 'Nepal');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (150, 'NLD', '31', 'Netherlands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (151, 'ANT', '599', 'Netherlands Antilles');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (152, 'NCL', '687', 'New Caledonia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (153, 'NZL', '64', 'New Zealand');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (154, 'NIC', '505', 'Nicaragua');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (155, 'NER', '227', 'Niger');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (156, 'NGA', '234', 'Nigeria');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (157, 'NIU', '683', 'Niue');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (158, 'NFK', '672', 'Norfolk Island');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (159, 'MNP', '1670', 'Northern Mariana Islands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (160, 'NOR', '47', 'Norway');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (161, 'OMN', '968', 'Oman');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (162, 'PAK', '92', 'Pakistan');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (163, 'PLW', '680', 'Palau');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (164, 'PSE', '970', 'Palestinian Territory, Occupied');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (165, 'PAN', '507', 'Panama');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (166, 'PNG', '675', 'Papua New Guinea');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (167, 'PRY', '595', 'Paraguay');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (168, 'PER', '51', 'Peru');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (169, 'PHL', '63', 'Philippines');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (170, 'PCN', '0', 'Pitcairn');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (171, 'POL', '48', 'Poland');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (172, 'PRT', '351', 'Portugal');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (173, 'PRI', '1787', 'Puerto Rico');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (174, 'QAT', '974', 'Qatar');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (175, 'REU', '262', 'Reunion');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (176, 'ROU', '40', 'Romania');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (177, 'RUS', '7', 'Russian Federation');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (178, 'RWA', '250', 'Rwanda');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (179, 'SHN', '290', 'Saint Helena');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (180, 'KNA', '1869', 'Saint Kitts And Nevis');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (181, 'LCA', '1758', 'Saint Lucia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (182, 'SPM', '508', 'Saint Pierre And Miquelon');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (183, 'VCT', '1784', 'Saint Vincent And The Grenadines');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (184, 'WSM', '685', 'Samoa');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (185, 'SMR', '378', 'San Marino');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (186, 'STP', '239', 'São Tomé And Principe');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (187, 'SAU', '966', 'Saudi Arabia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (188, 'SEN', '221', 'Senegal');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (189, 'SYC', '248', 'Seychelles');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (190, 'SLE', '232', 'Sierra Leone');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (191, 'SGP', '65', 'Singapore');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (192, 'SVK', '421', 'Slovakia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (193, 'SVN', '386', 'Slovenia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (194, 'SLB', '677', 'Solomon Islands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (195, 'SOM', '252', 'Somalia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (196, 'ZAF', '27', 'South Africa');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (197, 'SGS', '0', 'South Georgia And The South Sandwich Islands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (198, 'ESP', '34', 'Spain');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (199, 'LKA', '94', 'Sri Lanka');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (200, 'SDN', '249', 'Sudan');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (201, 'SUR', '597', 'Suriname');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (202, 'SJM', '0', 'Svalbard and Jan Mayen');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (203, 'SWZ', '268', 'Swaziland');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (204, 'SWE', '46', 'Sweden');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (205, 'CHE', '41', 'Switzerland');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (206, 'SYR', '963', 'Syrian Arab Republic');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (207, 'TWN', '886', 'Taiwan, Province Of China');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (208, 'TJK', '992', 'Tajikistan');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (209, 'TZA', '255', 'Tanzania, United Republic Of');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (210, 'THA', '66', 'Thailand');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (211, 'TLS', '670', 'Timor-Leste');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (212, 'TGO', '228', 'Togo');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (213, 'TKL', '690', 'Tokelau');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (214, 'TON', '676', 'Tonga');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (215, 'TTO', '1868', 'Trinidad And Tobago');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (216, 'TUN', '216', 'Tunisia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (217, 'TUR', '90', 'Turkey');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (218, 'TKM', '993', 'Turkmenistan');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (219, 'TCA', '1649', 'Turks And Caicos Islands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (220, 'TUV', '688', 'Tuvalu');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (221, 'UGA', '256', 'Uganda');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (222, 'UKR', '380', 'Ukraine');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (223, 'ARE', '971', 'United Arab Emirates');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (224, 'GBR', '44', 'United Kingdom');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (225, 'USA', '1', 'United States');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (226, 'UMI', '0', 'United States Minor Outlying Islands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (227, 'URY', '598', 'Uruguay');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (228, 'UZB', '998', 'Uzbekistan');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (229, 'VUT', '678', 'Vanuatu');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (230, 'VEN', '58', 'Venezuela');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (231, 'VNM', '84', 'Vietnam');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (232, 'VGB', '1284', 'Virgin Islands, British');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (233, 'VIR', '808', 'Virgin Islands, U.S.');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (234, 'WLF', '681', 'Wallis And Futuna');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (235, 'ESH', '0', 'Western Sahara');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (236, 'YEM', '967', 'Yemen');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (237, 'YUG', '0', 'Yugoslavia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (238, 'ZMB', '260', 'Zambia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (239, 'ZWE', '263', 'Zimbabwe');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (240, 'ASC', '0', 'Ascension Island');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (241, 'DGA', '0', 'Diego Garcia');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (242, 'XNM', '0', 'Inmarsat');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (243, 'TMP', '0', 'East timor');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (244, 'AK', '0', 'Alaska');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (245, 'HI', '0', 'Hawaii');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (53, 'CIV', '225', 'Côte d''Ivoire');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (246, 'ALA', '35818', 'Aland Islands');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (247, 'BLM', '0', 'Saint Barthelemy');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (248, 'GGY', '441481', 'Guernsey');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (249, 'IMN', '441624', 'Isle of Man');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (250, 'JEY', '441534', 'Jersey');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (251, 'MAF', '0', 'Saint Martin');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (252, 'MNE', '382', 'Montenegro, Republic of');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (253, 'SRB', '381', 'Serbia, Republic of');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (254, 'CPT', '0', 'Clipperton Island');
INSERT INTO public.cc_country (id, countrycode, countryprefix, countryname) VALUES (255, 'TAA', '0', 'Tristan da Cunha');


--
-- Data for Name: cc_currencies; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (1, 'ALL', 'Albanian Lek (ALL)', 0.00974, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (2, 'DZD', 'Algerian Dinar (DZD)', 0.01345, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (3, 'XAL', 'Aluminium Ounces (XAL)', 1.08295, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (4, 'ARS', 'Argentine Peso (ARS)', 0.32455, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (5, 'AWG', 'Aruba Florin (AWG)', 0.55866, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (6, 'AUD', 'Australian Dollar (AUD)', 0.73384, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (7, 'BSD', 'Bahamian Dollar (BSD)', 1.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (8, 'BHD', 'Bahraini Dinar (BHD)', 2.65322, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (9, 'BDT', 'Bangladesh Taka (BDT)', 0.01467, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (10, 'BBD', 'Barbados Dollar (BBD)', 0.50000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (11, 'BYR', 'Belarus Ruble (BYR)', 0.00046, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (12, 'BZD', 'Belize Dollar (BZD)', 0.50569, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (13, 'BMD', 'Bermuda Dollar (BMD)', 1.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (14, 'BTN', 'Bhutan Ngultrum (BTN)', 0.02186, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (15, 'BOB', 'Bolivian Boliviano (BOB)', 0.12500, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (16, 'BRL', 'Brazilian Real (BRL)', 0.46030, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (17, 'GBP', 'British Pound (GBP)', 1.73702, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (18, 'BND', 'Brunei Dollar (BND)', 0.61290, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (19, 'BGN', 'Bulgarian Lev (BGN)', 0.60927, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (20, 'BIF', 'Burundi Franc (BIF)', 0.00103, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (21, 'KHR', 'Cambodia Riel (KHR)', 0.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (22, 'CAD', 'Canadian Dollar (CAD)', 0.86386, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (23, 'KYD', 'Cayman Islands Dollar (KYD)', 1.16496, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (24, 'XOF', 'CFA Franc (BCEAO) (XOF)', 0.00182, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (25, 'XAF', 'CFA Franc (BEAC) (XAF)', 0.00182, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (26, 'CLP', 'Chilean Peso (CLP)', 0.00187, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (27, 'CNY', 'Chinese Yuan (CNY)', 0.12425, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (28, 'COP', 'Colombian Peso (COP)', 0.00044, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (29, 'KMF', 'Comoros Franc (KMF)', 0.00242, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (30, 'XCP', 'Copper Ounces (XCP)', 2.16403, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (31, 'CRC', 'Costa Rica Colon (CRC)', 0.00199, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (32, 'HRK', 'Croatian Kuna (HRK)', 0.16249, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (33, 'CUP', 'Cuban Peso (CUP)', 1.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (34, 'CYP', 'Cyprus Pound (CYP)', 2.07426, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (35, 'CZK', 'Czech Koruna (CZK)', 0.04133, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (36, 'DKK', 'Danish Krone (DKK)', 0.15982, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (37, 'DJF', 'Dijibouti Franc (DJF)', 0.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (38, 'DOP', 'Dominican Peso (DOP)', 0.03035, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (39, 'XCD', 'East Caribbean Dollar (XCD)', 0.37037, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (40, 'ECS', 'Ecuador Sucre (ECS)', 0.00004, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (41, 'EGP', 'Egyptian Pound (EGP)', 0.17433, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (42, 'SVC', 'El Salvador Colon (SVC)', 0.11426, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (43, 'ERN', 'Eritrea Nakfa (ERN)', 0.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (44, 'EEK', 'Estonian Kroon (EEK)', 0.07615, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (45, 'ETB', 'Ethiopian Birr (ETB)', 0.11456, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (46, 'EUR', 'Euro (EUR)', 1.19175, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (47, 'FKP', 'Falkland Islands Pound (FKP)', 0.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (48, 'GMD', 'Gambian Dalasi (GMD)', 0.03515, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (49, 'GHC', 'Ghanian Cedi (GHC)', 0.00011, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (50, 'GIP', 'Gibraltar Pound (GIP)', 0.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (51, 'XAU', 'Gold Ounces (XAU)', 555.55556, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (52, 'GTQ', 'Guatemala Quetzal (GTQ)', 0.13103, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (53, 'GNF', 'Guinea Franc (GNF)', 0.00022, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (54, 'HTG', 'Haiti Gourde (HTG)', 0.02387, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (55, 'HNL', 'Honduras Lempira (HNL)', 0.05292, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (56, 'HKD', 'Hong Kong Dollar (HKD)', 0.12884, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (57, 'HUF', 'Hungarian Forint (HUF)', 0.00461, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (58, 'ISK', 'Iceland Krona (ISK)', 0.01436, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (59, 'INR', 'Indian Rupee (INR)', 0.02253, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (60, 'IDR', 'Indonesian Rupiah (IDR)', 0.00011, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (61, 'IRR', 'Iran Rial (IRR)', 0.00011, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (62, 'ILS', 'Israeli Shekel (ILS)', 0.21192, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (63, 'JMD', 'Jamaican Dollar (JMD)', 0.01536, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (64, 'JPY', 'Japanese Yen (JPY)', 0.00849, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (65, 'JOD', 'Jordanian Dinar (JOD)', 1.41044, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (66, 'KZT', 'Kazakhstan Tenge (KZT)', 0.00773, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (67, 'KES', 'Kenyan Shilling (KES)', 0.01392, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (68, 'KRW', 'Korean Won (KRW)', 0.00102, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (69, 'KWD', 'Kuwaiti Dinar (KWD)', 3.42349, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (70, 'LAK', 'Lao Kip (LAK)', 0.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (71, 'LVL', 'Latvian Lat (LVL)', 1.71233, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (72, 'LBP', 'Lebanese Pound (LBP)', 0.00067, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (73, 'LSL', 'Lesotho Loti (LSL)', 0.15817, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (74, 'LYD', 'Libyan Dinar (LYD)', 0.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (75, 'LTL', 'Lithuanian Lita (LTL)', 0.34510, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (76, 'MOP', 'Macau Pataca (MOP)', 0.12509, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (77, 'MKD', 'Macedonian Denar (MKD)', 0.01945, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (78, 'MGF', 'Malagasy Franc (MGF)', 0.00011, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (79, 'MWK', 'Malawi Kwacha (MWK)', 0.00752, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (80, 'MYR', 'Malaysian Ringgit (MYR)', 0.26889, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (81, 'MVR', 'Maldives Rufiyaa (MVR)', 0.07813, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (82, 'MTL', 'Maltese Lira (MTL)', 2.77546, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (83, 'MRO', 'Mauritania Ougulya (MRO)', 0.00369, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (84, 'MUR', 'Mauritius Rupee (MUR)', 0.03258, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (85, 'MXN', 'Mexican Peso (MXN)', 0.09320, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (86, 'MDL', 'Moldovan Leu (MDL)', 0.07678, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (87, 'MNT', 'Mongolian Tugrik (MNT)', 0.00084, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (88, 'MAD', 'Moroccan Dirham (MAD)', 0.10897, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (89, 'MZM', 'Mozambique Metical (MZM)', 0.00004, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (90, 'NAD', 'Namibian Dollar (NAD)', 0.15817, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (91, 'NPR', 'Nepalese Rupee (NPR)', 0.01408, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (92, 'ANG', 'Neth Antilles Guilder (ANG)', 0.55866, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (93, 'TRY', 'New Turkish Lira (TRY)', 0.73621, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (94, 'NZD', 'New Zealand Dollar (NZD)', 0.65096, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (95, 'NIO', 'Nicaragua Cordoba (NIO)', 0.05828, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (96, 'NGN', 'Nigerian Naira (NGN)', 0.00777, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (97, 'NOK', 'Norwegian Krone (NOK)', 0.14867, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (98, 'OMR', 'Omani Rial (OMR)', 2.59740, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (99, 'XPF', 'Pacific Franc (XPF)', 0.00999, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (100, 'PKR', 'Pakistani Rupee (PKR)', 0.01667, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (101, 'XPD', 'Palladium Ounces (XPD)', 277.77778, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (102, 'PAB', 'Panama Balboa (PAB)', 1.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (103, 'PGK', 'Papua New Guinea Kina (PGK)', 0.33125, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (104, 'PYG', 'Paraguayan Guarani (PYG)', 0.00017, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (105, 'PEN', 'Peruvian Nuevo Sol (PEN)', 0.29999, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (106, 'PHP', 'Philippine Peso (PHP)', 0.01945, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (107, 'XPT', 'Platinum Ounces (XPT)', 1000.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (108, 'PLN', 'Polish Zloty (PLN)', 0.30574, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (109, 'QAR', 'Qatar Rial (QAR)', 0.27476, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (110, 'ROL', 'Romanian Leu (ROL)', 0.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (111, 'RON', 'Romanian New Leu (RON)', 0.34074, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (112, 'RUB', 'Russian Rouble (RUB)', 0.03563, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (113, 'RWF', 'Rwanda Franc (RWF)', 0.00185, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (114, 'WST', 'Samoa Tala (WST)', 0.35492, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (115, 'STD', 'Sao Tome Dobra (STD)', 0.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (116, 'SAR', 'Saudi Arabian Riyal (SAR)', 0.26665, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (117, 'SCR', 'Seychelles Rupee (SCR)', 0.18114, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (118, 'SLL', 'Sierra Leone Leone (SLL)', 0.00034, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (119, 'XAG', 'Silver Ounces (XAG)', 9.77517, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (120, 'SGD', 'Singapore Dollar (SGD)', 0.61290, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (121, 'SKK', 'Slovak Koruna (SKK)', 0.03157, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (122, 'SIT', 'Slovenian Tolar (SIT)', 0.00498, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (123, 'SOS', 'Somali Shilling (SOS)', 0.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (124, 'ZAR', 'South African Rand (ZAR)', 0.15835, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (125, 'LKR', 'Sri Lanka Rupee (LKR)', 0.00974, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (126, 'SHP', 'St Helena Pound (SHP)', 0.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (127, 'SDD', 'Sudanese Dinar (SDD)', 0.00427, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (128, 'SRG', 'Surinam Guilder (SRG)', 0.36496, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (129, 'SZL', 'Swaziland Lilageni (SZL)', 0.15817, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (130, 'SEK', 'Swedish Krona (SEK)', 0.12609, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (131, 'CHF', 'Swiss Franc (CHF)', 0.76435, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (132, 'SYP', 'Syrian Pound (SYP)', 0.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (133, 'TWD', 'Taiwan Dollar (TWD)', 0.03075, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (134, 'TZS', 'Tanzanian Shilling (TZS)', 0.00083, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (135, 'THB', 'Thai Baht (THB)', 0.02546, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (136, 'TOP', 'Tonga Paanga (TOP)', 0.48244, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (137, 'TTD', 'Trinidad&Tobago Dollar (TTD)', 0.15863, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (138, 'TND', 'Tunisian Dinar (TND)', 0.73470, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (139, 'USD', 'U.S. Dollar (USD)', 1.00000, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (140, 'AED', 'UAE Dirham (AED)', 0.27228, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (141, 'UGX', 'Ugandan Shilling (UGX)', 0.00055, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (142, 'UAH', 'Ukraine Hryvnia (UAH)', 0.19755, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (143, 'UYU', 'Uruguayan New Peso (UYU)', 0.04119, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (144, 'VUV', 'Vanuatu Vatu (VUV)', 0.00870, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (145, 'VEB', 'Venezuelan Bolivar (VEB)', 0.00037, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (146, 'VND', 'Vietnam Dong (VND)', 0.00006, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (147, 'YER', 'Yemen Riyal (YER)', 0.00510, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (148, 'ZMK', 'Zambian Kwacha (ZMK)', 0.00031, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (149, 'ZWD', 'Zimbabwe Dollar (ZWD)', 0.00001, '2026-08-04 06:28:21.930049', 'USD');
INSERT INTO public.cc_currencies (id, currency, name, value, lastupdate, basecurrency) VALUES (150, 'GYD', 'Guyana Dollar (GYD)', 0.00527, '2026-08-04 06:28:21.930049', 'USD');


--
-- Data for Name: cc_did; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_did_destination; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_did_use; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_didgroup; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_epayment_log; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_epayment_log_agent; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_iax_buddies; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_invoice; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_invoice_conf; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_invoice_conf (id, key_val, value) VALUES (1, 'company_name', 'My company');
INSERT INTO public.cc_invoice_conf (id, key_val, value) VALUES (2, 'address', 'address');
INSERT INTO public.cc_invoice_conf (id, key_val, value) VALUES (3, 'zipcode', 'xxxx');
INSERT INTO public.cc_invoice_conf (id, key_val, value) VALUES (4, 'country', 'country');
INSERT INTO public.cc_invoice_conf (id, key_val, value) VALUES (5, 'city', 'city');
INSERT INTO public.cc_invoice_conf (id, key_val, value) VALUES (6, 'phone', 'xxxxxxxxxxx');
INSERT INTO public.cc_invoice_conf (id, key_val, value) VALUES (7, 'fax', 'xxxxxxxxxxx');
INSERT INTO public.cc_invoice_conf (id, key_val, value) VALUES (8, 'email', 'xxxxxxx@xxxxxxx.xxx');
INSERT INTO public.cc_invoice_conf (id, key_val, value) VALUES (9, 'vat', 'xxxxxxxxxx');
INSERT INTO public.cc_invoice_conf (id, key_val, value) VALUES (10, 'web', 'www.xxxxxxx.xxx');
INSERT INTO public.cc_invoice_conf (id, key_val, value) VALUES (11, 'display_account', '0');


--
-- Data for Name: cc_invoice_item; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_invoice_payment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_iso639; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ab', 'Abkhazian       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('om', 'Afan (Oromo)    ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('aa', 'Afar            ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('af', 'Afrikaans       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('sq', 'Albanian        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('am', 'Amharic         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ar', 'Arabic          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('hy', 'Armenian        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('as', 'Assamese        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ay', 'Aymara          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('az', 'Azerbaijani     ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ba', 'Bashkir         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('eu', 'Basque          ', 'Euskera         ', 'ISO-8859-15     ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('bn', 'Bengali Bangla  ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('dz', 'Bhutani         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('bh', 'Bihari          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('bi', 'Bislama         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('br', 'Breton          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('bg', 'Bulgarian       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('my', 'Burmese         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('be', 'Byelorussian    ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('km', 'Cambodian       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ca', 'Catalan         ', '          		    ', 'ISO-8859-15     ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('zh', 'Chinese         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('co', 'Corsican        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('hr', 'Croatian        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('cs', 'Czech           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('da', 'Danish          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('nl', 'Dutch           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('en', 'English         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('eo', 'Esperanto       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('et', 'Estonian        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('fo', 'Faroese         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('fj', 'Fiji            ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('fi', 'Finnish         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('fr', 'French          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('fy', 'Frisian         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('gl', 'Galician        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ka', 'Georgian        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('de', 'German          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('el', 'Greek           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('kl', 'Greenlandic     ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('gn', 'Guarani         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('gu', 'Gujarati        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ha', 'Hausa           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('he', 'Hebrew          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('hi', 'Hindi           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('hu', 'Hungarian       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('is', 'Icelandic       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('id', 'Indonesian      ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ia', 'Interlingua     ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ie', 'Interlingue     ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('iu', 'Inuktitut       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ik', 'Inupiak         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ga', 'Irish           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('it', 'Italian         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ja', 'Japanese        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('jv', 'Javanese        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('kn', 'Kannada         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ks', 'Kashmiri        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('kk', 'Kazakh          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('rw', 'Kinyarwanda     ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ky', 'Kirghiz         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('rn', 'Kurundi         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ko', 'Korean          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ku', 'Kurdish         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('lo', 'Laothian        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('la', 'Latin           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('lv', 'Latvian Lettish ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ln', 'Lingala         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('lt', 'Lithuanian      ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('mk', 'Macedonian      ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('mg', 'Malagasy        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ms', 'Malay           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ml', 'Malayalam       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('mt', 'Maltese         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('mi', 'Maori           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('mr', 'Marathi         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('mo', 'Moldavian       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('mn', 'Mongolian       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('na', 'Nauru           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ne', 'Nepali          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('no', 'Norwegian       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('oc', 'Occitan         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('or', 'Oriya           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ps', 'Pashto Pushto   ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('fa', 'Persian (Farsi) ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('pl', 'Polish          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('pt', 'Portuguese      ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('pa', 'Punjabi         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('qu', 'Quechua         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('rm', 'Rhaeto-Romance  ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ro', 'Romanian        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ru', 'Russian         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('sm', 'Samoan          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('sg', 'Sangho          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('sa', 'Sanskrit        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('gd', 'Scots Gaelic    ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('sr', 'Serbian         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('sh', 'Serbo-Croatian  ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('st', 'Sesotho         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('tn', 'Setswana        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('sn', 'Shona           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('sd', 'Sindhi          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('si', 'Singhalese      ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ss', 'Siswati         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('sk', 'Slovak          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('sl', 'Slovenian       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('so', 'Somali          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('es', 'Spanish         ', '         		     ', 'ISO-8859-15     ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('su', 'Sundanese       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('sw', 'Swahili         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('sv', 'Swedish         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('tl', 'Tagalog         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('tg', 'Tajik           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ta', 'Tamil           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('tt', 'Tatar           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('te', 'Telugu          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('th', 'Thai            ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('bo', 'Tibetan         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ti', 'Tigrinya        ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('to', 'Tonga           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ts', 'Tsonga          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('tr', 'Turkish         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('tk', 'Turkmen         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('tw', 'Twi             ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ug', 'Uigur           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('uk', 'Ukrainian       ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('ur', 'Urdu            ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('uz', 'Uzbek           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('vi', 'Vietnamese      ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('vo', 'Volapuk         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('cy', 'Welsh           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('wo', 'Wolof           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('xh', 'Xhosa           ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('yi', 'Yiddish         ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('yo', 'Yoruba          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('za', 'Zhuang          ', '                ', 'ISO-8859-1      ');
INSERT INTO public.cc_iso639 (code, name, lname, charset) VALUES ('zu', 'Zulu            ', '                ', 'ISO-8859-1      ');


--
-- Data for Name: cc_logpayment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_logpayment_agent; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_logrefill; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_logrefill (id, date, credit, card_id, description, refill_type, added_invoice, agent_id) VALUES (1, '2026-08-23 07:20:54', 500.00000, 1, 'Recharge par voucher (960) - code: 1001', 1, 0, NULL);
INSERT INTO public.cc_logrefill (id, date, credit, card_id, description, refill_type, added_invoice, agent_id) VALUES (2, '2026-08-23 08:08:29', 500.00000, 2, 'Recharge par voucher (960) - code: 1002', 1, 0, NULL);
INSERT INTO public.cc_logrefill (id, date, credit, card_id, description, refill_type, added_invoice, agent_id) VALUES (3, '2026-08-25 09:03:39', 500.00000, 2, 'Recharge par voucher (960) - code: 1002', 1, 0, NULL);
INSERT INTO public.cc_logrefill (id, date, credit, card_id, description, refill_type, added_invoice, agent_id) VALUES (4, '2026-08-25 09:34:55', 500.00000, 4, 'Recharge par voucher (960) - code: 1004', 1, 0, NULL);
INSERT INTO public.cc_logrefill (id, date, credit, card_id, description, refill_type, added_invoice, agent_id) VALUES (5, '2026-08-25 14:33:57', 1000.00000, 6, 'Recharge par voucher (960) - code: 1006', 1, 0, NULL);
INSERT INTO public.cc_logrefill (id, date, credit, card_id, description, refill_type, added_invoice, agent_id) VALUES (6, '2026-08-25 14:34:54', 5000.00000, 6, 'Recharge par voucher (960) - code: 1006', 1, 0, NULL);
INSERT INTO public.cc_logrefill (id, date, credit, card_id, description, refill_type, added_invoice, agent_id) VALUES (7, '2026-08-26 13:25:25', 1000.00000, 1, 'Recharge par voucher (960) - code: 1001', 1, 0, NULL);
INSERT INTO public.cc_logrefill (id, date, credit, card_id, description, refill_type, added_invoice, agent_id) VALUES (8, '2026-08-26 16:07:49', 500.00000, 1, 'Recharge par voucher (960) - code: 1001', 1, 0, NULL);
INSERT INTO public.cc_logrefill (id, date, credit, card_id, description, refill_type, added_invoice, agent_id) VALUES (9, '2026-08-27 12:25:07', 1000.00000, 1, 'Recharge par voucher (960) - code: 1001', 1, 0, NULL);
INSERT INTO public.cc_logrefill (id, date, credit, card_id, description, refill_type, added_invoice, agent_id) VALUES (10, '2026-08-27 14:04:42', 5000.00000, 1, 'Recharge par voucher (960) - code: 1001', 1, 0, NULL);
INSERT INTO public.cc_logrefill (id, date, credit, card_id, description, refill_type, added_invoice, agent_id) VALUES (11, '2026-08-27 15:33:57', 500.00000, 2, 'Recharge par voucher (960) - code: 1002', 1, 0, NULL);


--
-- Data for Name: cc_logrefill_agent; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_message_agent; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_monitor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_monitor (id, label, dial_code, description, text_intro, query_type, query, result_type, enable) VALUES (1, 'TotalCall', 2, 'To say the total amount of calls', 'The total amount of calls on your system is', 1, 'select count(*) from cc_call;', 3, 1);
INSERT INTO public.cc_monitor (id, label, dial_code, description, text_intro, query_type, query, result_type, enable) VALUES (2, 'Say Time', 1, 'just saying the current date and time', 'The current date and time is', 1, 'SELECT UNIX_TIMESTAMP( );', 2, 1);
INSERT INTO public.cc_monitor (id, label, dial_code, description, text_intro, query_type, query, result_type, enable) VALUES (3, 'Test Connectivity', 3, 'Test Connectivity with Google', 'your Internet connection is', 2, 'check_connectivity.sh', 1, 1);


--
-- Data for Name: cc_notification; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_notification_admin; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_outbound_cid_group; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_outbound_cid_list; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_package_group; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_package_offer; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_package_rate; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_packgroup_package; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_payment_methods; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_payment_methods (id, payment_method, payment_filename) VALUES (1, 'paypal', 'paypal.php');
INSERT INTO public.cc_payment_methods (id, payment_method, payment_filename) VALUES (3, 'MoneyBookers', 'moneybookers.php');
INSERT INTO public.cc_payment_methods (id, payment_method, payment_filename) VALUES (4, 'plugnpay', 'plugnpay.php');


--
-- Data for Name: cc_payments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_payments_agent; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_payments_status; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_payments_status (id, status_id, status_name) VALUES (1, -2, 'Failed');
INSERT INTO public.cc_payments_status (id, status_id, status_name) VALUES (2, -1, 'Denied');
INSERT INTO public.cc_payments_status (id, status_id, status_name) VALUES (3, 0, 'Pending');
INSERT INTO public.cc_payments_status (id, status_id, status_name) VALUES (4, 1, 'In-Progress');
INSERT INTO public.cc_payments_status (id, status_id, status_name) VALUES (5, 2, 'Completed');
INSERT INTO public.cc_payments_status (id, status_id, status_name) VALUES (6, 3, 'Processed');
INSERT INTO public.cc_payments_status (id, status_id, status_name) VALUES (7, 4, 'Refunded');
INSERT INTO public.cc_payments_status (id, status_id, status_name) VALUES (8, 5, 'Unknown');


--
-- Data for Name: cc_paypal; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_phonebook; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_phonenumber; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_prefix; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_prefix (prefix, destination) VALUES (1, 'Interne');


--
-- Data for Name: cc_provider; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_ratecard; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_ratecard (id, idtariffplan, dialprefix, destination, buyrate, buyrateinitblock, buyrateincrement, rateinitial, initblock, billingblock, connectcharge, disconnectcharge, stepchargea, chargea, timechargea, billingblocka, stepchargeb, chargeb, timechargeb, billingblockb, stepchargec, chargec, timechargec, billingblockc, startdate, stopdate, starttime, endtime, id_trunk, musiconhold, id_outbound_cidgroup, rounding_calltime, rounding_threshold, additional_block_charge, additional_block_charge_time, tag, is_merged, additional_grace, minimal_cost, announce_time_correction, disconnectcharge_after) VALUES (1, 1, '_.', 1, 0.00000, 0, 0, 0.00000, 0, 0, 0.00000, 0.00000, 0.00000, 60.00000, 999999, 1, 0.00000, 0.00000, 0, 0, 0.00000, 0.00000, 0, 0, '2026-08-22 19:06:24', NULL, 0, 10079, 1, NULL, -1, 0, 0, 0.00000, 0, NULL, 0, 0, 0.00000, 1.000, 0);


--
-- Data for Name: cc_receipt; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_receipt_item; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_remittance_request; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_restricted_phonenumber; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_server_group; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_server_group (id, name, description) VALUES (1, 'default', 'default group of server');


--
-- Data for Name: cc_server_manager; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_server_manager (id, id_group, server_ip, manager_host, manager_username, manager_secret, lasttime_used) VALUES (1, 1, 'localhost', 'localhost', 'myasterisk', 'mycode', '2026-08-04 06:28:21.930049');


--
-- Data for Name: cc_service; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_service_report; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_sip_buddies; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_speeddial; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_status_log; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_subscription_service; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_subscription_signup; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_support; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_support (id, name, email, language) VALUES (1, 'DEFAULT', NULL, 'en   ');


--
-- Data for Name: cc_support_component; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_support_component (id, id_support, name, activated, type_user) VALUES (1, 1, 'DEFAULT', 1, 2);


--
-- Data for Name: cc_system_log; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_tariffgroup_plan; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_tariffgroup_plan (idtariffgroup, idtariffplan) VALUES (1, 1);


--
-- Data for Name: cc_tariffplan; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_tariffplan (id, iduser, tariffname, creationdate, startingdate, expirationdate, description, id_trunk, secondusedreal, secondusedcarrier, secondusedratecard, reftariffplan, idowner, dnidprefix, calleridprefix) VALUES (1, 0, 'Interne 1s=1Ar', '2026-08-22 19:03:17.739419', '2026-08-22 19:03:17.739419', NULL, 'Tarif interne standard', 0, 613, 0, 0, 0, 0, 'all', 'all');


--
-- Data for Name: cc_templatemail; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (1, 'signup', 'info@YourDomain.com', 'YourDomain', 'SIGNUP CONFIRMATION', '
Thank you for registering with us
Please click on below link to activate your account.

http://YourDomain.com/activate.php?key$loginkey

Please make sure you active your account by making payment to us either by
credit card, wire transfer, money order, cheque, and western union money
transfer, money Gram, and Pay pal.


Kind regards,
YourDomain
', '', 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (2, 'epaymentverify', 'info@YourDomain.com', 'YourDomain', 'Epayment Gateway Security Verification Failed', 'Dear Administrator

Please check the e-payment logs, the system has logged an e-payment security failure. This may be an attack attempt on epayment module.

Time of Transaction: $time
Payment Gateway: $paymentgateway
Amount: $amount


Kind regards,
YourDomain
', '', 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (3, 'reminder', 'info@YourDomain.com', 'YourDomain', 'REMINDER', '

Your YourDomain Account number $cardnumber is running low on credit.

There is currently only $credit_currency $currency left on your account which is lower than the warning level defined ($credit_notification)


Please top up your account ASAP to ensure continued service

If you no longer wish to receive these notifications or would like to change the balance amount at which these warnings are generated,
please connect on your myaccount panel and change the appropriate parameters


your account information :
Your account number for VOIP authentication : $cardnumber

http://myaccount.YourDomain.com/
Your account login : $cardalias
Your account password : $password


Thanks,
YourDomain
 ', '', 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (4, 'forgetpassword', 'info@YourDomain.com', 'YourDomain', 'Login Information', 'Your login information is as below:

Your account is $card_gen

Your password is $password

Your cardalias is $cardalias

http://YourDomain.com/A2BCustomer_UI/


Kind regards,
YourDomain
', '', 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (5, 'signupconfirmed', 'info@YourDomain.com', 'YourDomain', 'SIGNUP CONFIRMATION', 'Thank you for registering with us

Please make sure you active your account by making payment to us either by
credit card, wire transfer, money order, cheque, and western union money
transfer, money Gram, and Pay pal.

Your account is $card_gen

Your password is $password

To go to your account :
http://YourDomain.com/customer/

Kind regards,
YourDomain
', '', 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (6, 'payment', 'info@YourDomain.com', 'YourDomain', 'PAYMENT CONFIRMATION', 'Thank you for shopping at YourDomain.

Shopping details is as below.

Item Name = <b>$itemName</b>
Item ID = <b>$itemID</b>
Amount = <b>$itemAmount</b>
Payment Method = <b>$paymentMethod</b>
Status = <b>$paymentStatus</b>


Kind regards,
YourDomain
', '', 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (8, 'did_paid', 'info@mydomainname.com', 'COMPANY NAME', 'DID notification - ($did$)', 'BALANCE REMAINING $balance_remaining$ $base_currency$\n\nAn automatic taking away of : $did_cost$ $base_currency$ has been carry out of your account to pay your DID ($did$)\n\nMonthly cost for DID : $did_cost$ $base_currency$\n\n', NULL, 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (9, 'did_unpaid', 'info@mydomainname.com', 'COMPANY NAME', 'DID notification - ($did$)', 'BALANCE REMAINING $balance_remaining$ $base_currency$\n\nYour credit is not enough to pay your DID number ($did$), the monthly cost is : $did_cost$ $base_currency$\n\nYou have $days_remaining$ days to pay the invoice (REF: $invoice_ref$ ) or the DID will be automatically released \n\n', NULL, 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (10, 'did_released', 'info@mydomainname.com', 'COMPANY NAME', 'DID released - ($did$)', 'The DID $did$ has been automatically released!\n\n', NULL, 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (11, 'new_ticket', 'info@mydomainname.com', 'COMPANY NAME', 'Support Ticket #$ticket_id$', 'New Ticket Open (#$ticket_id$) From $ticket_owner$.\n Title : $ticket_title$\n Priority : $ticket_priority$ \n Status : $ticket_status$ \n Description : $ticket_description$ \n', NULL, 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (12, 'modify_ticket', 'info@mydomainname.com', 'COMPANY NAME', 'Support Ticket #$ticket_id$', 'Ticket modified (#$ticket_id$) By $comment_creator$.\n Ticket Status -> $ticket_status$\n Description : $comment_description$ \n', NULL, 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (13, 'invoice_to_pay', 'info@mydomainname.com', 'COMPANY NAME', 'Invoice to pay Ref: $invoice_reference$', 'New Invoice send with the reference : $invoice_reference$ .\n 
    Title : $invoice_title$ .\n Description : $invoice_description$\n 
    TOTAL (exclude VAT) : $invoice_total$  $base_currency$\n TOTAL (invclude VAT) : $invoice_total_vat$ $base_currency$ \n\n 
    TOTAL TO PAY : $invoice_total_vat$ $base_currency$\n\n 
    You can check and pay this invoice by your account on the web interface : http://mydomainname.com/customer/  ', NULL, 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (14, 'subscription_paid', 'info@mydomainname.com', 'COMPANY NAME', 'Subscription notification - $subscription_label$ ($subscription_id$)', 'BALANCE  $credit$ $base_currency$\n\nA decrement of: $subscription_fee$ $base_currency$ has removed from your account to pay your service. ($subscription_label$)\n\nthe monthly cost is : $subscription_fee$\n\n', NULL, 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (15, 'subscription_unpaid', 'info@mydomainname.com', 'COMPANY NAME', 'Subscription notification - $subscription_label$ ($subscription_id$)', 'BALANCE $credit$ $base_currency$\n\nYou do not have enough credit to pay your subscription,($subscription_label$), the monthly cost is : $subscription_fee$ $base_currency$\n\nYou have $days_remaining$ days to pay the invoice (REF: $invoice_ref$ ) or your service may cease \n\n', NULL, 'en');
INSERT INTO public.cc_templatemail (id, mailtype, fromemail, fromname, subject, messagetext, messagehtml, id_language) VALUES (16, 'subscription_disable_card', 'info@mydomainname.com', 'COMPANY NAME', 'Service deactivated - unpaid service $subscription_label$ ($subscription_id$)', 'The account has been automatically deactivated until the invoice is settled.\n\n', NULL, 'en');


--
-- Data for Name: cc_ticket; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_ticket_comment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cc_timezone; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (1, '(GMT-12:00) International Date Line West', 'GMT-12:00', -43200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (2, '(GMT-11:00) Midway Island, Samoa', 'GMT-11:00', -39600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (3, '(GMT-10:00) Hawaii', 'GMT-10:00', -36000);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (4, '(GMT-09:00) Alaska', 'GMT-09:00', -32400);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (5, '(GMT-08:00) Pacific Time (US & Canada) Tijuana', 'GMT-08:00', -28800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (6, '(GMT-07:00) Arizona', 'GMT-07:00', -25200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (7, '(GMT-07:00) Chihuahua, La Paz, Mazatlan', 'GMT-07:00', -25200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (8, '(GMT-07:00) Mountain Time(US & Canada)', 'GMT-07:00', -25200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (9, '(GMT-06:00) Central America', 'GMT-06:00', -21600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (10, '(GMT-06:00) Central Time (US & Canada)', 'GMT-06:00', -21600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (11, '(GMT-06:00) Guadalajara, Mexico City, Monterrey', 'GMT-06:00', -21600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (12, '(GMT-06:00) Saskatchewan', 'GMT-06:00', -21600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (13, '(GMT-05:00) Bogota, Lima, Quito', 'GMT-05:00', -18000);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (14, '(GMT-05:00) Eastern Time (US & Canada)', 'GMT-05:00', -18000);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (15, '(GMT-05:00) Indiana (East)', 'GMT-05:00', -18000);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (16, '(GMT-04:00) Atlantic Time (Canada)', 'GMT-04:00', -14400);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (17, '(GMT-04:00) Caracas, La Paz', 'GMT-04:00', -14400);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (18, '(GMT-04:00) Santiago', 'GMT-04:00', -14400);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (19, '(GMT-03:30) NewFoundland', 'GMT-03:30', -12600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (20, '(GMT-03:00) Brasillia', 'GMT-03:00', -10800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (21, '(GMT-03:00) Buenos Aires, Georgetown', 'GMT-03:00', -10800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (22, '(GMT-03:00) Greenland', 'GMT-03:00', -10800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (23, '(GMT-03:00) Mid-Atlantic', 'GMT-03:00', -10800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (24, '(GMT-01:00) Azores', 'GMT-01:00', -3600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (25, '(GMT-01:00) Cape Verd Is.', 'GMT-01:00', -3600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (26, '(GMT) Casablanca, Monrovia', 'GMT+00:00', 0);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (27, '(GMT) Greenwich Mean Time : Dublin, Edinburgh, Lisbon,  London', 'GMT', 0);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (28, '(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna', 'GMT+01:00', 3600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (29, '(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague', 'GMT+01:00', 3600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (30, '(GMT+01:00) Brussels, Copenhagen, Madrid, Paris', 'GMT+01:00', 3600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (31, '(GMT+01:00) Sarajevo, Skopje, Warsaw, Zagreb', 'GMT+01:00', 3600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (32, '(GMT+01:00) West Central Africa', 'GMT+01:00', 3600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (33, '(GMT+02:00) Athens, Istanbul, Minsk', 'GMT+02:00', 7200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (34, '(GMT+02:00) Bucharest', 'GMT+02:00', 7200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (35, '(GMT+02:00) Cairo', 'GMT+02:00', 7200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (36, '(GMT+02:00) Harere, Pretoria', 'GMT+02:00', 7200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (37, '(GMT+02:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius', 'GMT+02:00', 7200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (38, '(GMT+02:00) Jeruasalem', 'GMT+02:00', 7200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (39, '(GMT+03:00) Baghdad', 'GMT+03:00', 10800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (40, '(GMT+03:00) Kuwait, Riyadh', 'GMT+03:00', 10800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (41, '(GMT+03:00) Moscow, St.Petersburg, Volgograd', 'GMT+03:00', 10800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (42, '(GMT+03:00) Nairobi', 'GMT+03:00', 10800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (43, '(GMT+03:30) Tehran', 'GMT+03:30', 12600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (44, '(GMT+04:00) Abu Dhabi, Muscat', 'GMT+04:00', 14400);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (45, '(GMT+04:00) Baku, Tbillisi, Yerevan', 'GMT+04:00', 14400);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (46, '(GMT+04:30) Kabul', 'GMT+04:30', 16200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (47, '(GMT+05:00) Ekaterinburg', 'GMT+05:00', 18000);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (48, '(GMT+05:00) Islamabad, Karachi, Tashkent', 'GMT+05:00', 18000);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (49, '(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi', 'GMT+05:30', 19800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (50, '(GMT+05:45) Kathmandu', 'GMT+05:45', 20700);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (51, '(GMT+06:00) Almaty, Novosibirsk', 'GMT+06:00', 21600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (52, '(GMT+06:00) Astana, Dhaka', 'GMT+06:00', 21600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (53, '(GMT+06:00) Sri Jayawardenepura', 'GMT+06:00', 21600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (54, '(GMT+06:30) Rangoon', 'GMT+06:30', 23400);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (55, '(GMT+07:00) Bangkok, Hanoi, Jakarta', 'GMT+07:00', 25200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (56, '(GMT+07:00) Krasnoyarsk', 'GMT+07:00', 25200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (57, '(GMT+08:00) Beijiing, Chongging, Hong Kong, Urumqi', 'GMT+08:00', 28800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (58, '(GMT+08:00) Irkutsk, Ulaan Bataar', 'GMT+08:00', 28800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (59, '(GMT+08:00) Kuala Lumpur, Singapore', 'GMT+08:00', 28800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (60, '(GMT+08:00) Perth', 'GMT+08:00', 28800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (61, '(GMT+08:00) Taipei', 'GMT+08:00', 28800);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (62, '(GMT+09:00) Osaka, Sapporo, Tokyo', 'GMT+09:00', 32400);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (63, '(GMT+09:00) Seoul', 'GMT+09:00', 32400);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (64, '(GMT+09:00) Yakutsk', 'GMT+09:00', 32400);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (65, '(GMT+09:00) Adelaide', 'GMT+09:00', 32400);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (66, '(GMT+09:30) Darwin', 'GMT+09:30', 34200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (67, '(GMT+10:00) Brisbane', 'GMT+10:00', 36000);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (68, '(GMT+10:00) Canberra, Melbourne, Sydney', 'GMT+10:00', 36000);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (69, '(GMT+10:00) Guam, Port Moresby', 'GMT+10:00', 36000);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (70, '(GMT+10:00) Hobart', 'GMT+10:00', 36000);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (71, '(GMT+10:00) Vladivostok', 'GMT+10:00', 36000);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (72, '(GMT+11:00) Magadan, Solomon Is., New Caledonia', 'GMT+11:00', 39600);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (73, '(GMT+12:00) Auckland, Wellington', 'GMT+1200', 43200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (74, '(GMT+12:00) Fiji, Kamchatka, Marshall Is.', 'GMT+12:00', 43200);
INSERT INTO public.cc_timezone (id, gmtzone, gmttime, gmtoffset) VALUES (75, '(GMT+13:00) Nuku alofa', 'GMT+13:00', 46800);


--
-- Data for Name: cc_trunk; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_trunk (id_trunk, trunkcode, trunkprefix, providertech, providerip, removeprefix, secondusedreal, secondusedcarrier, secondusedratecard, creationdate, failover_trunk, addparameter, id_provider, inuse, maxuse, status, if_max_use) VALUES (1, 'internal-pjsip', '', 'PJSIP', '%dialingnumber%', '', 2569, 0, 0, '2005-03-14 01:01:36', 0, '', NULL, 0, -1, 1, 0);


--
-- Data for Name: cc_ui_authen; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_ui_authen (userid, login, pwd_encoded, groupid, perms, confaddcust, name, direction, zipcode, state, phone, fax, email, datecreation, country, city) VALUES (1, 'root', '410fc6268dd3332226de95e42d9efa4046c5463769d7493b85e65cfa5c26362dc2455cc23c0bc5831deb008def4ab11a9eaa9b76ba3f377da134f39ec60dd758', 0, 5242879, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-26 20:33:27.691314-05', '2026-08-04 06:28:21.930049', NULL, NULL);
INSERT INTO public.cc_ui_authen (userid, login, pwd_encoded, groupid, perms, confaddcust, name, direction, zipcode, state, phone, fax, email, datecreation, country, city) VALUES (2, 'admin', '410fc6268dd3332226de95e42d9efa4046c5463769d7493b85e65cfa5c26362dc2455cc23c0bc5831deb008def4ab11a9eaa9b76ba3f377da134f39ec60dd758', 0, 5242879, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-26 21:14:05.391501-05', '2026-08-04 06:28:21.930049', NULL, NULL);


--
-- Data for Name: cc_version; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_version (version) VALUES ('1.7.0');


--
-- Data for Name: cc_voucher; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (1, '2026-08-23 05:20:20.632202', '2026-08-23 07:20:54.422504', NULL, '246411255453', '1001', NULL, 500.0000, true, 1, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (2, '2026-08-23 05:20:20.634408', '2026-08-23 08:08:29.25721', NULL, '075377472165', '1002', NULL, 500.0000, true, 1, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (3, '2026-08-23 05:20:20.647343', '2026-08-25 09:03:38.739841', NULL, '275767739512', '1002', NULL, 500.0000, true, 1, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (4, '2026-08-23 05:20:20.648413', '2026-08-25 09:34:54.890136', NULL, '974060940768', '1004', NULL, 500.0000, true, 1, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (7, '2026-08-23 19:02:40.816189', '2026-08-25 14:33:56.90575', NULL, '509349689851', '1006', NULL, 1000.0000, true, 1, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (9, '2026-08-25 15:32:08.149507', '2026-08-25 14:34:54.223208', NULL, '120874324735', '1006', NULL, 5000.0000, true, 1, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (10, '2026-08-26 11:20:09.318206', NULL, NULL, '332346518230', NULL, NULL, 1000.0000, true, 0, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (11, '2026-08-26 11:20:09.32253', '2026-08-26 13:25:25.390199', NULL, '208245149029', '1001', NULL, 1000.0000, true, 1, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (5, '2026-08-23 05:20:20.650683', '2026-08-26 16:07:49.441125', NULL, '890931412369', '1001', NULL, 500.0000, true, 1, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (6, '2026-08-23 19:02:40.812878', '2026-08-27 12:25:06.83671', NULL, '564870124925', '1001', NULL, 1000.0000, true, 1, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (13, '2026-08-27 10:49:55.875771', NULL, NULL, '554035534790', NULL, NULL, 500.0000, true, 0, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (14, '2026-08-27 10:49:55.883124', NULL, NULL, '219926670510', NULL, NULL, 500.0000, true, 0, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (15, '2026-08-27 10:49:55.895878', NULL, NULL, '705943278904', NULL, NULL, 500.0000, true, 0, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (16, '2026-08-27 10:49:55.902217', NULL, NULL, '949109615960', NULL, NULL, 500.0000, true, 0, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (17, '2026-08-27 10:49:55.911183', NULL, NULL, '440313221183', NULL, NULL, 500.0000, true, 0, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (18, '2026-08-27 10:49:55.914793', NULL, NULL, '156566266524', NULL, NULL, 500.0000, true, 0, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (19, '2026-08-27 10:49:55.916183', NULL, NULL, '909967573496', NULL, NULL, 500.0000, true, 0, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (20, '2026-08-27 10:49:55.917097', NULL, NULL, '719639424173', NULL, NULL, 500.0000, true, 0, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (21, '2026-08-27 10:49:55.918026', NULL, NULL, '708685326037', NULL, NULL, 500.0000, true, 0, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (8, '2026-08-25 15:32:08.146571', '2026-08-27 14:04:42.109629', NULL, '364146959696', '1001', NULL, 5000.0000, true, 1, 'MGA');
INSERT INTO public.cc_voucher (id, creationdate, usedate, expirationdate, voucher, usedcardnumber, tag, credit, activated, used, currency) VALUES (12, '2026-08-27 10:49:55.873463', '2026-08-27 15:33:56.981658', NULL, '312005444491', '1002', NULL, 500.0000, true, 1, 'MGA');


--
-- Name: _cc_iax_buddies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._cc_iax_buddies_id_seq', 1, false);


--
-- Name: _cc_sip_buddies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._cc_sip_buddies_id_seq', 1, false);


--
-- Name: cc_agent_commission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_agent_commission_id_seq', 1, false);


--
-- Name: cc_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_agent_id_seq', 1, false);


--
-- Name: cc_agent_signup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_agent_signup_id_seq', 1, false);


--
-- Name: cc_alarm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_alarm_id_seq', 1, false);


--
-- Name: cc_alarm_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_alarm_report_id_seq', 1, false);


--
-- Name: cc_autorefill_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_autorefill_report_id_seq', 1, false);


--
-- Name: cc_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_backup_id_seq', 1, false);


--
-- Name: cc_billing_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_billing_customer_id_seq', 1, false);


--
-- Name: cc_call_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_call_archive_id_seq', 1, false);


--
-- Name: cc_call_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_call_id_seq', 1, false);


--
-- Name: cc_callback_spool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_callback_spool_id_seq', 1, false);


--
-- Name: cc_callerid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_callerid_id_seq', 6, true);


--
-- Name: cc_campaign_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_campaign_config_id_seq', 1, false);


--
-- Name: cc_campaign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_campaign_id_seq', 1, false);


--
-- Name: cc_card_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_card_archive_id_seq', 1, false);


--
-- Name: cc_card_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_card_group_id_seq', 1, true);


--
-- Name: cc_card_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_card_history_id_seq', 1, false);


--
-- Name: cc_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_card_id_seq', 6, true);


--
-- Name: cc_card_package_offer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_card_package_offer_id_seq', 1, false);


--
-- Name: cc_card_seria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_card_seria_id_seq', 1, false);


--
-- Name: cc_card_subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_card_subscription_id_seq', 1, false);


--
-- Name: cc_charge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_charge_id_seq', 1, false);


--
-- Name: cc_config_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_config_group_id_seq', 14, true);


--
-- Name: cc_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_config_id_seq', 302, true);


--
-- Name: cc_configuration_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_configuration_configuration_id_seq', 25, true);


--
-- Name: cc_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_country_id_seq', 1, false);


--
-- Name: cc_currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_currencies_id_seq', 1, false);


--
-- Name: cc_did_destination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_did_destination_id_seq', 1, false);


--
-- Name: cc_did_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_did_id_seq', 1, false);


--
-- Name: cc_did_use_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_did_use_id_seq', 1, false);


--
-- Name: cc_didgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_didgroup_id_seq', 1, false);


--
-- Name: cc_epayment_log_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_epayment_log_agent_id_seq', 1, false);


--
-- Name: cc_epayment_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_epayment_log_id_seq', 1, false);


--
-- Name: cc_invoice_conf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_invoice_conf_id_seq', 11, true);


--
-- Name: cc_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_invoice_id_seq', 1, false);


--
-- Name: cc_invoice_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_invoice_item_id_seq', 1, false);


--
-- Name: cc_logpayment_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_logpayment_agent_id_seq', 1, false);


--
-- Name: cc_logpayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_logpayment_id_seq', 1, false);


--
-- Name: cc_logrefill_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_logrefill_agent_id_seq', 1, false);


--
-- Name: cc_logrefill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_logrefill_id_seq', 11, true);


--
-- Name: cc_message_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_message_agent_id_seq', 1, false);


--
-- Name: cc_monitor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_monitor_id_seq', 3, true);


--
-- Name: cc_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_notification_id_seq', 1, false);


--
-- Name: cc_outbound_cid_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_outbound_cid_group_id_seq', 1, false);


--
-- Name: cc_outbound_cid_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_outbound_cid_list_id_seq', 1, false);


--
-- Name: cc_package_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_package_group_id_seq', 1, false);


--
-- Name: cc_package_offer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_package_offer_id_seq', 1, false);


--
-- Name: cc_payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_payment_methods_id_seq', 4, true);


--
-- Name: cc_payments_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_payments_agent_id_seq', 1, false);


--
-- Name: cc_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_payments_id_seq', 1, false);


--
-- Name: cc_payments_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_payments_status_id_seq', 8, true);


--
-- Name: cc_paypal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_paypal_id_seq', 1, false);


--
-- Name: cc_phonebook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_phonebook_id_seq', 1, false);


--
-- Name: cc_phonenumber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_phonenumber_id_seq', 1, false);


--
-- Name: cc_prefix_prefix_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_prefix_prefix_seq', 1, true);


--
-- Name: cc_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_provider_id_seq', 1, false);


--
-- Name: cc_ratecard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_ratecard_id_seq', 1, true);


--
-- Name: cc_receipt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_receipt_id_seq', 1, false);


--
-- Name: cc_receipt_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_receipt_item_id_seq', 1, false);


--
-- Name: cc_remittance_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_remittance_request_id_seq', 1, false);


--
-- Name: cc_restricted_phonenumber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_restricted_phonenumber_id_seq', 1, false);


--
-- Name: cc_server_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_server_group_id_seq', 1, false);


--
-- Name: cc_server_manager_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_server_manager_id_seq', 1, true);


--
-- Name: cc_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_service_id_seq', 1, false);


--
-- Name: cc_service_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_service_report_id_seq', 1, false);


--
-- Name: cc_speeddial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_speeddial_id_seq', 1, false);


--
-- Name: cc_status_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_status_log_id_seq', 1, false);


--
-- Name: cc_subscription_fee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_subscription_fee_id_seq', 1, false);


--
-- Name: cc_subscription_signup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_subscription_signup_id_seq', 1, false);


--
-- Name: cc_support_component_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_support_component_id_seq', 1, false);


--
-- Name: cc_support_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_support_id_seq', 1, false);


--
-- Name: cc_system_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_system_log_id_seq', 1, false);


--
-- Name: cc_tariffgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_tariffgroup_id_seq', 1, true);


--
-- Name: cc_tariffplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_tariffplan_id_seq', 1, true);


--
-- Name: cc_templatemail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_templatemail_id_seq', 16, true);


--
-- Name: cc_ticket_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_ticket_comment_id_seq', 1, false);


--
-- Name: cc_ticket_comment_id_ticket_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_ticket_comment_id_ticket_seq', 1, false);


--
-- Name: cc_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_ticket_id_seq', 1, false);


--
-- Name: cc_timezone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_timezone_id_seq', 75, true);


--
-- Name: cc_trunk_id_trunk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_trunk_id_trunk_seq', 1, true);


--
-- Name: cc_ui_authen_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_ui_authen_userid_seq', 1, false);


--
-- Name: cc_voucher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cc_voucher_id_seq', 21, true);


--
-- PostgreSQL database dump complete
--

\unrestrict bWdvzgv64AqpYAOZQ9WBPghqxSCHnRlmZqFjjrBesGnUAW3ioZDO4ma7MbryWHO

