--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: ejbca
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO ejbca;

--
-- Name: exec(text); Type: FUNCTION; Schema: public; Owner: ejbca
--

CREATE FUNCTION public.exec(text) RETURNS text
    LANGUAGE plpgsql
    AS $_$
    BEGIN
      EXECUTE $1;
      RETURN $1;
    END;
$_$;


ALTER FUNCTION public.exec(text) OWNER TO ejbca;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accessrulesdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.accessrulesdata (
    pk integer NOT NULL,
    accessrule text NOT NULL,
    isrecursive boolean NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    rule integer NOT NULL,
    admingroupdata_accessrules integer
);


ALTER TABLE public.accessrulesdata OWNER TO ejbca;

--
-- Name: acmeaccountdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.acmeaccountdata (
    accountid text NOT NULL,
    currentkeyid text NOT NULL,
    rawdata text,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.acmeaccountdata OWNER TO ejbca;

--
-- Name: acmeauthorizationdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.acmeauthorizationdata (
    authorizationid text NOT NULL,
    identifier text,
    identifiertype text,
    expires bigint,
    status text,
    orderid text,
    accountid text NOT NULL,
    rawdata text,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.acmeauthorizationdata OWNER TO ejbca;

--
-- Name: acmechallengedata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.acmechallengedata (
    challengeid text NOT NULL,
    authorizationid text NOT NULL,
    type text NOT NULL,
    rawdata text,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.acmechallengedata OWNER TO ejbca;

--
-- Name: acmenoncedata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.acmenoncedata (
    nonce text NOT NULL,
    timeexpires bigint NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.acmenoncedata OWNER TO ejbca;

--
-- Name: acmeorderdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.acmeorderdata (
    orderid text NOT NULL,
    accountid text NOT NULL,
    fingerprint text,
    status text NOT NULL,
    rawdata text,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.acmeorderdata OWNER TO ejbca;

--
-- Name: adminentitydata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.adminentitydata (
    pk integer NOT NULL,
    caid integer NOT NULL,
    matchtype integer NOT NULL,
    matchvalue text,
    matchwith integer NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    tokentype text,
    admingroupdata_adminentities integer
);


ALTER TABLE public.adminentitydata OWNER TO ejbca;

--
-- Name: admingroupdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.admingroupdata (
    pk integer NOT NULL,
    admingroupname text NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.admingroupdata OWNER TO ejbca;

--
-- Name: adminpreferencesdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.adminpreferencesdata (
    id text NOT NULL,
    data bytea NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.adminpreferencesdata OWNER TO ejbca;

--
-- Name: approvaldata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.approvaldata (
    id integer NOT NULL,
    approvaldata text NOT NULL,
    approvalid integer NOT NULL,
    approvaltype integer NOT NULL,
    caid integer NOT NULL,
    endentityprofileid integer NOT NULL,
    expiredate bigint NOT NULL,
    remainingapprovals integer NOT NULL,
    subjectdn text,
    email text,
    reqadmincertissuerdn text,
    reqadmincertsn text,
    requestdata text NOT NULL,
    requestdate bigint NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public.approvaldata OWNER TO ejbca;

--
-- Name: auditrecorddata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.auditrecorddata (
    pk text NOT NULL,
    additionaldetails text,
    authtoken text NOT NULL,
    customid text,
    eventstatus text NOT NULL,
    eventtype text NOT NULL,
    module text NOT NULL,
    nodeid text NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    searchdetail1 text,
    searchdetail2 text,
    sequencenumber bigint NOT NULL,
    service text NOT NULL,
    "timestamp" bigint NOT NULL
);


ALTER TABLE public.auditrecorddata OWNER TO ejbca;

--
-- Name: authorizationtreeupdatedata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.authorizationtreeupdatedata (
    pk integer NOT NULL,
    authorizationtreeupdatenumber integer NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.authorizationtreeupdatedata OWNER TO ejbca;

--
-- Name: base64certdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.base64certdata (
    fingerprint text NOT NULL,
    base64cert text,
    rowprotection text,
    rowversion integer NOT NULL,
    certificaterequest text
);


ALTER TABLE public.base64certdata OWNER TO ejbca;

--
-- Name: blacklistdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.blacklistdata (
    id integer NOT NULL,
    type text NOT NULL,
    value text NOT NULL,
    data text,
    rowprotection text,
    rowversion integer NOT NULL,
    updatecounter integer NOT NULL
);


ALTER TABLE public.blacklistdata OWNER TO ejbca;

--
-- Name: cadata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.cadata (
    caid integer NOT NULL,
    data text NOT NULL,
    expiretime bigint NOT NULL,
    name text,
    rowprotection text,
    rowversion integer NOT NULL,
    status integer NOT NULL,
    subjectdn text,
    updatetime bigint NOT NULL
);


ALTER TABLE public.cadata OWNER TO ejbca;

--
-- Name: certificatedata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.certificatedata (
    fingerprint text NOT NULL,
    base64cert text,
    cafingerprint text,
    certificateprofileid integer NOT NULL,
    endentityprofileid integer,
    crlpartitionindex integer,
    expiredate bigint NOT NULL,
    issuerdn text NOT NULL,
    notbefore bigint,
    invaliditydate bigint,
    revocationdate bigint NOT NULL,
    revocationreason integer NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    serialnumber text NOT NULL,
    status integer NOT NULL,
    subjectaltname text,
    subjectdn text NOT NULL,
    subjectkeyid text,
    accountbindingid text,
    tag text,
    type integer NOT NULL,
    updatetime bigint NOT NULL,
    username text,
    certificaterequest text
);


ALTER TABLE public.certificatedata OWNER TO ejbca;

--
-- Name: certificateprofiledata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.certificateprofiledata (
    id integer NOT NULL,
    certificateprofilename text NOT NULL,
    data bytea NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.certificateprofiledata OWNER TO ejbca;

--
-- Name: certreqhistorydata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.certreqhistorydata (
    fingerprint text NOT NULL,
    issuerdn text NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    serialnumber text NOT NULL,
    "timestamp" bigint NOT NULL,
    userdatavo text NOT NULL,
    username text NOT NULL
);


ALTER TABLE public.certreqhistorydata OWNER TO ejbca;

--
-- Name: crldata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.crldata (
    fingerprint text NOT NULL,
    base64crl text NOT NULL,
    cafingerprint text NOT NULL,
    crlpartitionindex integer,
    crlnumber integer NOT NULL,
    deltacrlindicator integer NOT NULL,
    issuerdn text NOT NULL,
    nextupdate bigint NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    thisupdate bigint NOT NULL
);


ALTER TABLE public.crldata OWNER TO ejbca;

--
-- Name: cryptotokendata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.cryptotokendata (
    id integer NOT NULL,
    lastupdate bigint NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    tokendata text,
    tokenname text NOT NULL,
    tokenprops text,
    tokentype text NOT NULL
);


ALTER TABLE public.cryptotokendata OWNER TO ejbca;

--
-- Name: endentityprofiledata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.endentityprofiledata (
    id integer NOT NULL,
    data bytea NOT NULL,
    profilename text NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.endentityprofiledata OWNER TO ejbca;

--
-- Name: globalconfigurationdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.globalconfigurationdata (
    configurationid text NOT NULL,
    data bytea NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.globalconfigurationdata OWNER TO ejbca;

--
-- Name: incompleteissuancejournaldata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.incompleteissuancejournaldata (
    serialnumberandcaid text NOT NULL,
    starttime bigint NOT NULL,
    rawdata text,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.incompleteissuancejournaldata OWNER TO ejbca;

--
-- Name: internalkeybindingdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.internalkeybindingdata (
    id integer NOT NULL,
    certificateid text,
    cryptotokenid integer NOT NULL,
    keybindingtype text NOT NULL,
    keypairalias text NOT NULL,
    lastupdate bigint NOT NULL,
    name text NOT NULL,
    rawdata text,
    rowprotection text,
    rowversion integer NOT NULL,
    status text NOT NULL
);


ALTER TABLE public.internalkeybindingdata OWNER TO ejbca;

--
-- Name: keyrecoverydata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.keyrecoverydata (
    certsn text NOT NULL,
    issuerdn text NOT NULL,
    cryptotokenid integer DEFAULT 0 NOT NULL,
    keyalias text,
    keydata text NOT NULL,
    markedasrecoverable boolean NOT NULL,
    publickeyid text,
    rowprotection text,
    rowversion integer NOT NULL,
    username text
);


ALTER TABLE public.keyrecoverydata OWNER TO ejbca;

--
-- Name: noconflictcertificatedata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.noconflictcertificatedata (
    id text NOT NULL,
    fingerprint text NOT NULL,
    base64cert text,
    cafingerprint text,
    certificateprofileid integer NOT NULL,
    endentityprofileid integer,
    crlpartitionindex integer,
    expiredate bigint NOT NULL,
    issuerdn text NOT NULL,
    notbefore bigint,
    invaliditydate bigint,
    revocationdate bigint NOT NULL,
    revocationreason integer NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    serialnumber text NOT NULL,
    status integer NOT NULL,
    subjectaltname text,
    subjectdn text NOT NULL,
    subjectkeyid text,
    accountbindingid text,
    tag text,
    type integer NOT NULL,
    updatetime bigint NOT NULL,
    username text,
    certificaterequest text
);


ALTER TABLE public.noconflictcertificatedata OWNER TO ejbca;

--
-- Name: ocspresponsedata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.ocspresponsedata (
    id text NOT NULL,
    serialnumber text NOT NULL,
    producedat bigint NOT NULL,
    nextupdate bigint,
    ocspresponse bytea,
    caid integer,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.ocspresponsedata OWNER TO ejbca;

--
-- Name: peerdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.peerdata (
    id integer NOT NULL,
    connectorstate integer NOT NULL,
    data text,
    name text NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    url text NOT NULL
);


ALTER TABLE public.peerdata OWNER TO ejbca;

--
-- Name: profiledata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.profiledata (
    id integer NOT NULL,
    profilename text NOT NULL,
    profiletype text NOT NULL,
    rawdata text,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.profiledata OWNER TO ejbca;

--
-- Name: publisherdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.publisherdata (
    id integer NOT NULL,
    data text,
    name text,
    rowprotection text,
    rowversion integer NOT NULL,
    updatecounter integer NOT NULL
);


ALTER TABLE public.publisherdata OWNER TO ejbca;

--
-- Name: publisherqueuedata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.publisherqueuedata (
    pk text NOT NULL,
    fingerprint text,
    lastupdate bigint NOT NULL,
    publishstatus integer NOT NULL,
    publishtype integer NOT NULL,
    publisherid integer NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    timecreated bigint NOT NULL,
    trycounter integer NOT NULL,
    volatiledata text
);


ALTER TABLE public.publisherqueuedata OWNER TO ejbca;

--
-- Name: roledata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.roledata (
    id integer NOT NULL,
    rolename text NOT NULL,
    namespace text,
    rawdata text,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.roledata OWNER TO ejbca;

--
-- Name: rolememberdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.rolememberdata (
    primarykey integer NOT NULL,
    tokentype text NOT NULL,
    tokenissuerid integer NOT NULL,
    tokenproviderid integer DEFAULT 0 NOT NULL,
    tokenmatchkey integer NOT NULL,
    tokenmatchoperator integer NOT NULL,
    tokenmatchvalue text,
    roleid integer NOT NULL,
    description text,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.rolememberdata OWNER TO ejbca;

--
-- Name: sctdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.sctdata (
    pk text NOT NULL,
    logid integer NOT NULL,
    fingerprint text NOT NULL,
    certificateexpirationdate bigint NOT NULL,
    data text,
    rowprotection text,
    rowversion integer NOT NULL
);


ALTER TABLE public.sctdata OWNER TO ejbca;

--
-- Name: servicedata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.servicedata (
    id integer NOT NULL,
    data text,
    name text NOT NULL,
    nextruntimestamp bigint NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    runtimestamp bigint NOT NULL
);


ALTER TABLE public.servicedata OWNER TO ejbca;

--
-- Name: userdata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.userdata (
    username text NOT NULL,
    caid integer NOT NULL,
    cardnumber text,
    certificateprofileid integer NOT NULL,
    clearpassword text,
    endentityprofileid integer NOT NULL,
    extendedinformationdata text,
    hardtokenissuerid integer NOT NULL,
    keystorepassword text,
    passwordhash text,
    rowprotection text,
    rowversion integer NOT NULL,
    status integer NOT NULL,
    subjectaltname text,
    subjectdn text,
    subjectemail text,
    timecreated bigint NOT NULL,
    timemodified bigint NOT NULL,
    tokentype integer NOT NULL,
    type integer NOT NULL
);


ALTER TABLE public.userdata OWNER TO ejbca;

--
-- Name: userdatasourcedata; Type: TABLE; Schema: public; Owner: ejbca
--

CREATE TABLE public.userdatasourcedata (
    id integer NOT NULL,
    data text,
    name text NOT NULL,
    rowprotection text,
    rowversion integer NOT NULL,
    updatecounter integer NOT NULL
);


ALTER TABLE public.userdatasourcedata OWNER TO ejbca;

--
-- Data for Name: accessrulesdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.accessrulesdata (pk, accessrule, isrecursive, rowprotection, rowversion, rule, admingroupdata_accessrules) FROM stdin;
\.


--
-- Data for Name: acmeaccountdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.acmeaccountdata (accountid, currentkeyid, rawdata, rowprotection, rowversion) FROM stdin;
\.


--
-- Data for Name: acmeauthorizationdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.acmeauthorizationdata (authorizationid, identifier, identifiertype, expires, status, orderid, accountid, rawdata, rowprotection, rowversion) FROM stdin;
\.


--
-- Data for Name: acmechallengedata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.acmechallengedata (challengeid, authorizationid, type, rawdata, rowprotection, rowversion) FROM stdin;
\.


--
-- Data for Name: acmenoncedata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.acmenoncedata (nonce, timeexpires, rowprotection, rowversion) FROM stdin;
\.


--
-- Data for Name: acmeorderdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.acmeorderdata (orderid, accountid, fingerprint, status, rawdata, rowprotection, rowversion) FROM stdin;
\.


--
-- Data for Name: adminentitydata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.adminentitydata (pk, caid, matchtype, matchvalue, matchwith, rowprotection, rowversion, tokentype, admingroupdata_adminentities) FROM stdin;
\.


--
-- Data for Name: admingroupdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.admingroupdata (pk, admingroupname, rowprotection, rowversion) FROM stdin;
\.


--
-- Data for Name: adminpreferencesdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.adminpreferencesdata (id, data, rowprotection, rowversion) FROM stdin;
\.


--
-- Data for Name: approvaldata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.approvaldata (id, approvaldata, approvalid, approvaltype, caid, endentityprofileid, expiredate, remainingapprovals, subjectdn, email, reqadmincertissuerdn, reqadmincertsn, requestdata, requestdate, rowprotection, rowversion, status) FROM stdin;
\.


--
-- Data for Name: auditrecorddata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.auditrecorddata (pk, additionaldetails, authtoken, customid, eventstatus, eventtype, module, nodeid, rowprotection, rowversion, searchdetail1, searchdetail2, sequencenumber, service, "timestamp") FROM stdin;
\.


--
-- Data for Name: authorizationtreeupdatedata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.authorizationtreeupdatedata (pk, authorizationtreeupdatenumber, rowprotection, rowversion) FROM stdin;
2	0	\N	0
1	7	\N	5
\.


--
-- Data for Name: base64certdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.base64certdata (fingerprint, base64cert, rowprotection, rowversion, certificaterequest) FROM stdin;
b004102d9934c8335842ec2e792071872a5ddd04	MIICpjCCAgegAwIBAgIUcTxqJsDyAQbJzptHDlnLe+tgveowCgYIKoZIzj0EAwQw\nbTELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMScwJQYDVQQDDB5Db21tdW5pdHkgRGF5cyAy\nMDI0IFJvb3QgRUMgRzEwHhcNMjQwOTA1MTg1ODI1WhcNMzQwOTAzMTg1ODI0WjBt\nMQswCQYDVQQGEwJTRTESMBAGA1UECgwJS2V5ZmFjdG9yMSEwHwYDVQQLDBhDZXJ0\naWZpY2F0aW9uIEF1dGhvcml0ZXMxJzAlBgNVBAMMHkNvbW11bml0eSBEYXlzIDIw\nMjQgUm9vdCBFQyBHMTCBmzAQBgcqhkjOPQIBBgUrgQQAIwOBhgAEACXlDoyutMKe\n8m+3S0wZ0ZbKkssPYuVoWRphCZAYAb8D/FwNgrdQYJBDbMhhZ8NSOkIh4hTAhx3i\nv4+mdB5EYhlRALwTF8Ci03UtygP79GxmXZL7N0zHbCfyubJGUi7+U/U++wGb2b2b\nSj0W9DrLDDvWdK3OBBZTV5LnfIcqeuGjUVyUo0IwQDAPBgNVHRMBAf8EBTADAQH/\nMB0GA1UdDgQWBBRCWKO6Bwix3eyKPQH2i4A97fxMDjAOBgNVHQ8BAf8EBAMCAYYw\nCgYIKoZIzj0EAwQDgYwAMIGIAkIA23+nu6IG2hwWotNfi2ClccCZw3oS/HmnuZqU\ncAFlao7CkFVT3EaBeQV8SHVcaIy6jlrPW4KR1e2MEhEK5e2IlOYCQgHtPunDPWNo\nWkby54PNAyTXgCS+NsCn4yanUYmU75Yp6gZtycOuR97BEzVOBD8SFPclk2/+An2V\nI8y4jRmM6++viA==	\N	0	\N
50f1fffcfb2f55dec59f7a7ad5f9745525102e44	MIIDLjCCAo+gAwIBAgIUHVllnCcOZdAVo8QvZO+kq6nGS1UwCgYIKoZIzj0EAwQw\nbTELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMScwJQYDVQQDDB5Db21tdW5pdHkgRGF5cyAy\nMDI0IFJvb3QgRUMgRzEwHhcNMjQwOTA2MTczMzQ3WhcNMjkwOTA1MTczMzQ2WjBs\nMQswCQYDVQQGEwJTRTESMBAGA1UECgwJS2V5ZmFjdG9yMSEwHwYDVQQLDBhDZXJ0\naWZpY2F0aW9uIEF1dGhvcml0ZXMxJjAkBgNVBAMMHUNvbW11bml0eSBEYXlzIDIw\nMjQgU3ViIEVDIEcxMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE7Vy/foM/34H7\nzoD6ceP5vGh1cBHogpzz2quOQNbnC8jveKgTpDA7f+D0Ig5XU0cX7166YZlrMfEi\nfcECihGh1aOCAQwwggEIMBIGA1UdEwEB/wQIMAYBAf8CAQAwHwYDVR0jBBgwFoAU\nQlijugcIsd3sij0B9ouAPe38TA4wVQYIKwYBBQUHAQEESTBHMEUGCCsGAQUFBzAC\nhjlodHRwOi8vYWlhLmNvbW11bml0eTIwMjQubG9jYWwvYWlhL2NvbW0tcm9vdC1l\nYy1jYS1nMS5jcnQwSwYDVR0fBEQwQjBAoD6gPIY6aHR0cDovL2NybC5jb21tdW5p\ndHkyMDI0LmxvY2FsL2NybHMvY29tbS1yb290LWVjLWNhLWcxLmNybDAdBgNVHQ4E\nFgQUU0eFNfKNMAZI9A8Fy948s5C4I7AwDgYDVR0PAQH/BAQDAgGGMAoGCCqGSM49\nBAMEA4GMADCBiAJCAJQteDpDaxGGFpw0j6ZUHbSYRtO0Vq60QnpwejNw8aq9wFol\n+KTFyAPmEgLwW5P2rc778Act4aOFUX4/YpiYqmi2AkIBcQxn1HNpIBQjI+meugAt\n+GPkoE8KX5bDSsfiqC/edfeENwrZ6xaqAsz9NqFSpKpdQY8Gu22kFlmE9C0gscVm\nMZ8=	\N	0	\N
3c759ca2e1fe35dc3a1d80e418f481f5c51e5fe5	MIIDDDCCArGgAwIBAgIUFiVqzm4NwvRxRqROKhHMoTo5oSAwCgYIKoZIzj0EAwIw\nbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMSYwJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAy\nMDI0IFN1YiBFQyBHMTAeFw0yNDA5MDYxODU0NThaFw0yNzA5MDYxODU0NTdaMF0x\nCzAJBgNVBAYTAlNFMRIwEAYDVQQKDAlLZXlmYWN0b3IxEzARBgNVBAsMClBLSSBB\nZG1pbnMxJTAjBgNVBAMMHENvbW11bml0eSBEYXkgMjAyNCBQS0kgQWRtaW4wWTAT\nBgcqhkjOPQIBBggqhkjOPQMBBwNCAAR4ziBYQe3FXhJ5YrKWca6H2/o298607gmy\nqyP9BVM22fQzCxaUsBpg4uFzRAMG8eBksLkt/myJOvw2840juqO0o4IBPjCCATow\nHwYDVR0jBBgwFoAUU0eFNfKNMAZI9A8Fy948s5C4I7AwgYYGCCsGAQUFBwEBBHow\neDBEBggrBgEFBQcwAoY4aHR0cDovL2FpYS5jb21tdW5pdHkyMDI0LmxvY2FsL2Fp\nYS9jb21tLXN1Yi1lYy1jYS1nMS5jcnQwMAYIKwYBBQUHMAGGJGh0dHA6Ly9vY3Nw\nLmNvbW11bml0eTIwMjQubG9jYWwvb2NzcDATBgNVHSUEDDAKBggrBgEFBQcDAjBK\nBgNVHR8EQzBBMD+gPaA7hjlodHRwOi8vY3JsLmNvbW11bml0eTIwMjQubG9jYWwv\nY3Jscy9jb21tLXN1Yi1lYy1jYS1nMS5jcmwwHQYDVR0OBBYEFPxPpgfy6pok9wUj\nUXktWEGUDEV1MA4GA1UdDwEB/wQEAwIHgDAKBggqhkjOPQQDAgNJADBGAiEA7BEk\naWbjmA8A5vReHNrvCfnSB+n9Qr0kGZ/FKCn5N5ICIQCM5SOSGpdvo6FvO/1Epf39\npwSTOT4ZCf3fywA+LnY1QA==	\N	0	\N
55c59245a6e2d48d692b6843b27b7b1c98bf6b72	MIIC2DCCAn6gAwIBAgIUa82rLQoFVNiWWiKChtqAfV4HTD4wCgYIKoZIzj0EAwIw\nbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMSYwJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAy\nMDI0IFN1YiBFQyBHMTAeFw0yNDA5MDYxOTAwMDdaFw0yNTA5MDYxOTAwMDZaMAAw\nWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAASFvmTvd5MQYvQ6mYLjIYwr2Lm8SufJ\n50dI/mqIwoWqEVcAQW1JU9qsWpSGGSktaN48HrvT8c90jP71kQq4nGqho4IBaDCC\nAWQwHwYDVR0jBBgwFoAUU0eFNfKNMAZI9A8Fy948s5C4I7AwgYYGCCsGAQUFBwEB\nBHoweDBEBggrBgEFBQcwAoY4aHR0cDovL2FpYS5jb21tdW5pdHkyMDI0LmxvY2Fs\nL2FpYS9jb21tLXN1Yi1lYy1jYS1nMS5jcnQwMAYIKwYBBQUHMAGGJGh0dHA6Ly9v\nY3NwLmNvbW11bml0eTIwMjQubG9jYWwvb2NzcDAoBgNVHREBAf8EHjAcghplbnJv\nbGwuY29tbXVuaXR5MjAyNC5sb2NhbDATBgNVHSUEDDAKBggrBgEFBQcDATBKBgNV\nHR8EQzBBMD+gPaA7hjlodHRwOi8vY3JsLmNvbW11bml0eTIwMjQubG9jYWwvY3Js\ncy9jb21tLXN1Yi1lYy1jYS1nMS5jcmwwHQYDVR0OBBYEFB8LzXEe+YrBFqyIbF9N\ns9GExjkxMA4GA1UdDwEB/wQEAwIHgDAKBggqhkjOPQQDAgNIADBFAiAbR8K97T8U\nCs/s0jL14cOwjVjvA7nFz8PBQ4pWtY+3KgIhAIzFu2H5GrVxc85rmkKoFfvA4wI5\nvN7N/2JZmgjTnCi6	\N	0	\N
a03a34ed1fb23769ee11c09d57fff0d3b061628d	MIIC1jCCAnygAwIBAgIUIfqcf0MBHpkA/FL5P/0Fz6xdagIwCgYIKoZIzj0EAwIw\nbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMSYwJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAy\nMDI0IFN1YiBFQyBHMTAeFw0yNDA5MDYyMTE5NTdaFw0yNTA5MDYyMTE5NTZaMAAw\nWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQzbn508Zs6pXPZdTZByKp1VVJDGf+l\nVr+/UkTs4ux2/QRRS1KGgmDXIeHtK6XPJbFdx+l1eiP+czi7tlFKdAYUo4IBZjCC\nAWIwHwYDVR0jBBgwFoAUU0eFNfKNMAZI9A8Fy948s5C4I7AwgYYGCCsGAQUFBwEB\nBHoweDBEBggrBgEFBQcwAoY4aHR0cDovL2FpYS5jb21tdW5pdHkyMDI0LmxvY2Fs\nL2FpYS9jb21tLXN1Yi1lYy1jYS1nMS5jcnQwMAYIKwYBBQUHMAGGJGh0dHA6Ly9v\nY3NwLmNvbW11bml0eTIwMjQubG9jYWwvb2NzcDAmBgNVHREBAf8EHDAaghhzaWdu\nLmNvbW11bml0eTIwMjQubG9jYWwwEwYDVR0lBAwwCgYIKwYBBQUHAwEwSgYDVR0f\nBEMwQTA/oD2gO4Y5aHR0cDovL2NybC5jb21tdW5pdHkyMDI0LmxvY2FsL2NybHMv\nY29tbS1zdWItZWMtY2EtZzEuY3JsMB0GA1UdDgQWBBTLQ8u5s6lNKJbGK7OjWZ/h\nrHbY0DAOBgNVHQ8BAf8EBAMCB4AwCgYIKoZIzj0EAwIDSAAwRQIgGkXd1ui/8iEU\n7OEbry+eXdRXk3xyfKcHoudKp6T/VE4CIQDmFJh6BcW0u6OX7wCEN0tEyaCzrsLO\nRAhAe6ouMZhmVw==	\N	0	\N
792a5ca944256f2c5dd4efc103ddf25c69da344c	MIIDDTCCArKgAwIBAgIUNMkasM6KM2JwOn9su7oMH2+KASQwCgYIKoZIzj0EAwIw\nbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMSYwJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAy\nMDI0IFN1YiBFQyBHMTAeFw0yNDA5MDYyMTQ3MDZaFw0yNDEyMDUyMTQ3MDVaMF4x\nCzAJBgNVBAYTAlNFMRIwEAYDVQQKDAlLZXlmYWN0b3IxEDAOBgNVBAsMB1NpZ25l\ncnMxKTAnBgNVBAMMIENvbW11bml0eSBEYXlzIDIwMjQgUGxhaW4gU2lnbmVyMFkw\nEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEsGsraJn06p4+px5bCwYRuTHfMNuOSzFW\nRmy4EdUreJA8xrE7cd8IJ6v2PAMx21q5aL5XugL4hkEubpWpmgsWdaOCAT4wggE6\nMB8GA1UdIwQYMBaAFFNHhTXyjTAGSPQPBcvePLOQuCOwMIGGBggrBgEFBQcBAQR6\nMHgwRAYIKwYBBQUHMAKGOGh0dHA6Ly9haWEuY29tbXVuaXR5MjAyNC5sb2NhbC9h\naWEvY29tbS1zdWItZWMtY2EtZzEuY3J0MDAGCCsGAQUFBzABhiRodHRwOi8vb2Nz\ncC5jb21tdW5pdHkyMDI0LmxvY2FsL29jc3AwEwYDVR0lBAwwCgYIKwYBBQUHAwMw\nSgYDVR0fBEMwQTA/oD2gO4Y5aHR0cDovL2NybC5jb21tdW5pdHkyMDI0LmxvY2Fs\nL2NybHMvY29tbS1zdWItZWMtY2EtZzEuY3JsMB0GA1UdDgQWBBRpW7vZ2pLnAwVu\nRAoLwKleK5DBwDAOBgNVHQ8BAf8EBAMCBsAwCgYIKoZIzj0EAwIDSQAwRgIhAJ1g\nhPxmMzh4+KYXIF+S/Bfi4xXgDti15TV8lEbYMtRcAiEAjNHuAqC/LE/hAnJpDKAL\nKYO7qHmFNSwqjHoIhKwrEbE=	\N	0	\N
23ba08b1e021b78cc6a774b9c5ad2b70c9a53d9b	MIIDFTCCArqgAwIBAgIUOlZN8njYEghoTI6W8o23++1pRIowCgYIKoZIzj0EAwIw\nbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMSYwJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAy\nMDI0IFN1YiBFQyBHMTAeFw0yNDA5MDYyMTUwMjNaFw0yNTA5MDYyMTUwMjJaMGYx\nCzAJBgNVBAYTAlNFMRIwEAYDVQQKDAlLZXlmYWN0b3IxEDAOBgNVBAsMB1NpZ25l\ncnMxMTAvBgNVBAMMKENvbW11bml0eSBEYXlzIDIwMjQgVGltZSBTdGFtcCBBdXRo\nb3JpdHkwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQFGehav1IFdAaf91zibD23\n9vauFoGKNYo6ysK4y06FDxvKFPRtfDq/AsN0UJDhMC+hRKX8HklcLSpfc5rV8Rmr\no4IBPjCCATowHwYDVR0jBBgwFoAUU0eFNfKNMAZI9A8Fy948s5C4I7AwgYYGCCsG\nAQUFBwEBBHoweDBEBggrBgEFBQcwAoY4aHR0cDovL2FpYS5jb21tdW5pdHkyMDI0\nLmxvY2FsL2FpYS9jb21tLXN1Yi1lYy1jYS1nMS5jcnQwMAYIKwYBBQUHMAGGJGh0\ndHA6Ly9vY3NwLmNvbW11bml0eTIwMjQubG9jYWwvb2NzcDATBgNVHSUEDDAKBggr\nBgEFBQcDCDBKBgNVHR8EQzBBMD+gPaA7hjlodHRwOi8vY3JsLmNvbW11bml0eTIw\nMjQubG9jYWwvY3Jscy9jb21tLXN1Yi1lYy1jYS1nMS5jcmwwHQYDVR0OBBYEFAlG\nAekZmwBMfv/vDxm0Uqal8KeRMA4GA1UdDwEB/wQEAwIGwDAKBggqhkjOPQQDAgNJ\nADBGAiEA0wSJpgVxt15tPtlq0BuMTrbXiEnTgAAcDOwtCNtOHGkCIQDodPc81zfd\n3VuBotL5TE31sD1u+g3kH73mNBs0zbAi3Q==	\N	0	\N
892291e9807a4556be33055308ff7a719a68bcaf	MIIDFzCCAr2gAwIBAgIUYCdIjzEiRLIKHAIcpfWBHKbX2S8wCgYIKoZIzj0EAwIw\nbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMSYwJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAy\nMDI0IFN1YiBFQyBHMTAeFw0yNDA5MDYyMjA1MTJaFw0yNTA5MDYyMjA1MTFaMGYx\nCzAJBgNVBAYTAlNFMRIwEAYDVQQKDAlLZXlmYWN0b3IxEDAOBgNVBAsMB1NpZ25l\ncnMxMTAvBgNVBAMMKENvbW11bml0eSBEYXlzIDIwMjQgVGltZSBTdGFtcCBBdXRo\nb3JpdHkwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQFGehav1IFdAaf91zibD23\n9vauFoGKNYo6ysK4y06FDxvKFPRtfDq/AsN0UJDhMC+hRKX8HklcLSpfc5rV8Rmr\no4IBQTCCAT0wHwYDVR0jBBgwFoAUU0eFNfKNMAZI9A8Fy948s5C4I7AwgYYGCCsG\nAQUFBwEBBHoweDBEBggrBgEFBQcwAoY4aHR0cDovL2FpYS5jb21tdW5pdHkyMDI0\nLmxvY2FsL2FpYS9jb21tLXN1Yi1lYy1jYS1nMS5jcnQwMAYIKwYBBQUHMAGGJGh0\ndHA6Ly9vY3NwLmNvbW11bml0eTIwMjQubG9jYWwvb2NzcDAWBgNVHSUBAf8EDDAK\nBggrBgEFBQcDCDBKBgNVHR8EQzBBMD+gPaA7hjlodHRwOi8vY3JsLmNvbW11bml0\neTIwMjQubG9jYWwvY3Jscy9jb21tLXN1Yi1lYy1jYS1nMS5jcmwwHQYDVR0OBBYE\nFAlGAekZmwBMfv/vDxm0Uqal8KeRMA4GA1UdDwEB/wQEAwIGwDAKBggqhkjOPQQD\nAgNIADBFAiB7oS7OMWpdQkGky7/Gkhb3iZHnayFrgv4iOUAnNhtw7gIhAK/t8IrS\nnR9z8SeLlkWf/2OuQJSzAHEICcOF9Hppduph	\N	0	\N
349eeba7074792f05ef209ecac4ea0860d6082df	MIIC2TCCAoCgAwIBAgIUEPvEXtUf41Qrw/2f64n10OKzLqIwCgYIKoZIzj0EAwIw\nbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMSYwJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAy\nMDI0IFN1YiBFQyBHMTAeFw0yNDA5MTQxMzA4MDFaFw0yNTA5MTQxMzA4MDBaMAAw\nWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARvE9omfyc/FqCvOu+0LhDLZ82C/KB2\n62wh0d/UpzHoMkzW0En/oP2LTI4kBT3rQnsKN4tqzyFdXPRuao7nANEyo4IBajCC\nAWYwHwYDVR0jBBgwFoAUU0eFNfKNMAZI9A8Fy948s5C4I7AwgYYGCCsGAQUFBwEB\nBHoweDBEBggrBgEFBQcwAoY4aHR0cDovL2FpYS5jb21tdW5pdHkyMDI0LmxvY2Fs\nL2FpYS9jb21tLXN1Yi1lYy1jYS1nMS5jcnQwMAYIKwYBBQUHMAGGJGh0dHA6Ly9v\nY3NwLmNvbW11bml0eTIwMjQubG9jYWwvb2NzcDAqBgNVHREBAf8EIDAeghxyZWdp\nc3RyeS5jb21tdW5pdHkyMDI0LmxvY2FsMBMGA1UdJQQMMAoGCCsGAQUFBwMBMEoG\nA1UdHwRDMEEwP6A9oDuGOWh0dHA6Ly9jcmwuY29tbXVuaXR5MjAyNC5sb2NhbC9j\ncmxzL2NvbW0tc3ViLWVjLWNhLWcxLmNybDAdBgNVHQ4EFgQUaYhPAQprd4hsJ8Du\nRnbChynouk4wDgYDVR0PAQH/BAQDAgeAMAoGCCqGSM49BAMCA0cAMEQCIHNhcSi+\n3XEudkKJGje4SX5p6fNLgcpuP5WbK4pAl4+mAiBRjRolkCCOYww5425gIcgVewd4\nrJtHqDwntGVJMrjZVQ==	\N	0	\N
b2e01761b495f1583848ca58f756411ca414d736	MIIC5DCCAoqgAwIBAgIUH9QLtOSZUY/zd8aK78vjqSOzQgcwCgYIKoZIzj0EAwIw\nbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMSYwJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAy\nMDI0IFN1YiBFQyBHMTAeFw0yNDA5MjAxMTU4NTFaFw0yNTA5MjAxMTU4NTBaMAAw\nWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAASmUrGiPsyHO6AHqKENThwC8OvcUCqR\nXBU5RYtgzMxBVF7G1E8KcAivF2ijxGob2kPQLuwbr0Z91I9Vhg+6+eXyo4IBdDCC\nAXAwHwYDVR0jBBgwFoAUU0eFNfKNMAZI9A8Fy948s5C4I7AwgYYGCCsGAQUFBwEB\nBHoweDBEBggrBgEFBQcwAoY4aHR0cDovL2FpYS5jb21tdW5pdHkyMDI0LmxvY2Fs\nL2FpYS9jb21tLXN1Yi1lYy1jYS1nMS5jcnQwMAYIKwYBBQUHMAGGJGh0dHA6Ly9v\nY3NwLmNvbW11bml0eTIwMjQubG9jYWwvb2NzcDA0BgNVHREBAf8EKjAoghl2YXVs\ndC5jb21tdW5pdHkyMDI0LmxvY2FsggV2YXVsdIcEfwAAATATBgNVHSUEDDAKBggr\nBgEFBQcDATBKBgNVHR8EQzBBMD+gPaA7hjlodHRwOi8vY3JsLmNvbW11bml0eTIw\nMjQubG9jYWwvY3Jscy9jb21tLXN1Yi1lYy1jYS1nMS5jcmwwHQYDVR0OBBYEFK1F\nDQau8XvAeMnevHn3paS+QzwxMA4GA1UdDwEB/wQEAwIHgDAKBggqhkjOPQQDAgNI\nADBFAiAJDiPylvEBlaybXuSk0h/V8mBU5pDFVQy382kAyi5dBAIhAL+Yt+j7DRwV\nscCH1FI4QitkplJmbHse5vnDJX126JSO	\N	0	\N
\.


--
-- Data for Name: blacklistdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.blacklistdata (id, type, value, data, rowprotection, rowversion, updatecounter) FROM stdin;
\.


--
-- Data for Name: cadata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.cadata (caid, data, expiretime, name, rowprotection, rowversion, status, subjectdn, updatetime) FROM stdin;
1900100867	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.23" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>encodedvalidity</string>\n   <string>5y</string>\n  </void>\n  <void method="put">\n   <string>crlpublishers</string>\n   <object class="java.util.ArrayList"/>\n  </void>\n  <void method="put">\n   <string>signedby</string>\n   <int>1504435361</int>\n  </void>\n  <void method="put">\n   <string>keyvalidators</string>\n   <object class="java.util.ArrayList"/>\n  </void>\n  <void method="put">\n   <string>description</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>revokationreason</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>certificateprofileid</string>\n   <int>822716451</int>\n  </void>\n  <void method="put">\n   <string>usenoconflictcertificatedata</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>finishuser</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>includeinhealthcheck</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>doEnforceUniquePublicKeys</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>doEnforceKeyRenewal</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>doEnforceUniqueDistinguishedName</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>doEnforceUniqueSubjectDNSerialnumber</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>useCertreqHistory</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>useUserStorage</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>useCertificateStorage</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>acceptRevocationNonExistingEntry</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>keepExpiredCertsOnCRL</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>crlperiod</string>\n   <long>259200000</long>\n  </void>\n  <void method="put">\n   <string>crlIssueInterval</string>\n   <long>86400000</long>\n  </void>\n  <void method="put">\n   <string>crlOverlapTime</string>\n   <long>0</long>\n  </void>\n  <void method="put">\n   <string>deltacrlperiod</string>\n   <long>0</long>\n  </void>\n  <void method="put">\n   <string>generatecrluponrevocation</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>allowchangingrevocationreason</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>allowinvaliditydate</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>extendedcaservice5</string>\n   <object class="org.cesecore.util.Base64GetHashMap">\n    <void method="put">\n     <string>IMPLCLASS</string>\n     <string>org.ejbca.core.model.ca.caadmin.extendedcaservices.KeyRecoveryCAService</string>\n    </void>\n    <void method="put">\n     <string>extendedcaservicetype</string>\n     <int>5</int>\n    </void>\n    <void method="put">\n     <string>version</string>\n     <float>1.0</float>\n    </void>\n    <void method="put">\n     <string>status</string>\n     <int>2</int>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>extendedcaservices</string>\n   <object class="java.util.ArrayList">\n    <void method="add">\n     <int>5</int>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>approvals</string>\n   <object class="java.util.LinkedHashMap">\n    <void method="put">\n     <object class="java.lang.Enum" method="valueOf">\n      <class>org.cesecore.certificates.ca.ApprovalRequestType</class>\n      <string>ADDEDITENDENTITY</string>\n     </object>\n     <int>-1</int>\n    </void>\n    <void method="put">\n     <object class="java.lang.Enum" method="valueOf">\n      <class>org.cesecore.certificates.ca.ApprovalRequestType</class>\n      <string>KEYRECOVER</string>\n     </object>\n     <int>-1</int>\n    </void>\n    <void method="put">\n     <object class="java.lang.Enum" method="valueOf">\n      <class>org.cesecore.certificates.ca.ApprovalRequestType</class>\n      <string>REVOCATION</string>\n     </object>\n     <int>-1</int>\n    </void>\n    <void method="put">\n     <object class="java.lang.Enum" method="valueOf">\n      <class>org.cesecore.certificates.ca.ApprovalRequestType</class>\n      <string>ACTIVATECA</string>\n     </object>\n     <int>-1</int>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>policies</string>\n   <object class="java.util.ArrayList"/>\n  </void>\n  <void method="put">\n   <string>subjectaltname</string>\n   <string>None</string>\n  </void>\n  <void method="put">\n   <string>catype</string>\n   <int>1</int>\n  </void>\n  <void method="put">\n   <string>version</string>\n   <float>25.0</float>\n  </void>\n  <void method="put">\n   <string>msCaCompatible</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>useauthoritykeyidentifier</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>authoritykeyidentifiercritical</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>usecrlnumber</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>crlnumbercritical</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>defaultcrldistpoint</string>\n   <string>http://crl.community2024.local/crls/comm-sub-ec-ca-g1.crl</string>\n  </void>\n  <void method="put">\n   <string>defaultcrlissuer</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>cadefinedfreshestcrl</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>defaultocspservicelocator</string>\n   <string>http://ocsp.community2024.local/ocsp</string>\n  </void>\n  <void method="put">\n   <string>useutf8policytext</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>useprintablestringsubjectdn</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>useldapdnorder</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>usecrldistributionpointoncrl</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>crldistributionpointoncrlcritical</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>cmpraauthsecret</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>authorityinformationaccess</string>\n   <object class="java.util.ArrayList">\n    <void method="add">\n     <string>http://aia.community2024.local/aia/comm-sub-ec-ca-g1.crt</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>certificateaiadefaultcaissueruri</string>\n   <object class="java.util.ArrayList">\n    <void method="add">\n     <string>http://aia.community2024.local/aia/comm-sub-ec-ca-g1.crt</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>nameconstraintspermitted</string>\n   <object class="java.util.ArrayList"/>\n  </void>\n  <void method="put">\n   <string>nameconstraintsexcluded</string>\n   <object class="java.util.ArrayList"/>\n  </void>\n  <void method="put">\n   <string>serialnumberoctetsize</string>\n   <int>20</int>\n  </void>\n  <void method="put">\n   <string>dopreproduceocspresponses</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>dostoreocspondemand</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>dopreproduceocspresponsesuponissuanceandrevocation</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>usepartitionedcrl</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>crlpartitions</string>\n   <int>0</int>\n  </void>\n  <void method="put">\n   <string>suspendedcrlpartitions</string>\n   <int>0</int>\n  </void>\n  <void method="put">\n   <string>requestpreprocessor</string>\n   <null/>\n  </void>\n  <void method="put">\n   <string>catoken</string>\n   <object class="org.cesecore.util.Base64GetHashMap">\n    <void method="put">\n     <string>version</string>\n     <float>8.0</float>\n    </void>\n    <void method="put">\n     <string>cryptotokenid</string>\n     <string>-1123577625</string>\n    </void>\n    <void method="put">\n     <string>propertydata</string>\n     <string>certSignKey=signKey001\ncrlSignKey=signKey001\ntestKey=testKey\ndefaultKey=defaultKey001\n</string>\n    </void>\n    <void method="put">\n     <string>signaturealgorithm</string>\n     <string>SHA256withECDSA</string>\n    </void>\n    <void method="put">\n     <string>encryptionalgorithm</string>\n     <string>SHA256withECDSA</string>\n    </void>\n    <void method="put">\n     <string>sequenceformat</string>\n     <int>1</int>\n    </void>\n    <void method="put">\n     <string>sequence</string>\n     <string>00000</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>certificatechain</string>\n   <object class="java.util.ArrayList">\n    <void method="add">\n     <string>MIIDLjCCAo+gAwIBAgIUHVllnCcOZdAVo8QvZO+kq6nGS1UwCgYIKoZIzj0EAwQw\nbTELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMScwJQYDVQQDDB5Db21tdW5pdHkgRGF5cyAy\nMDI0IFJvb3QgRUMgRzEwHhcNMjQwOTA2MTczMzQ3WhcNMjkwOTA1MTczMzQ2WjBs\nMQswCQYDVQQGEwJTRTESMBAGA1UECgwJS2V5ZmFjdG9yMSEwHwYDVQQLDBhDZXJ0\naWZpY2F0aW9uIEF1dGhvcml0ZXMxJjAkBgNVBAMMHUNvbW11bml0eSBEYXlzIDIw\nMjQgU3ViIEVDIEcxMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE7Vy/foM/34H7\nzoD6ceP5vGh1cBHogpzz2quOQNbnC8jveKgTpDA7f+D0Ig5XU0cX7166YZlrMfEi\nfcECihGh1aOCAQwwggEIMBIGA1UdEwEB/wQIMAYBAf8CAQAwHwYDVR0jBBgwFoAU\nQlijugcIsd3sij0B9ouAPe38TA4wVQYIKwYBBQUHAQEESTBHMEUGCCsGAQUFBzAC\nhjlodHRwOi8vYWlhLmNvbW11bml0eTIwMjQubG9jYWwvYWlhL2NvbW0tcm9vdC1l\nYy1jYS1nMS5jcnQwSwYDVR0fBEQwQjBAoD6gPIY6aHR0cDovL2NybC5jb21tdW5p\ndHkyMDI0LmxvY2FsL2NybHMvY29tbS1yb290LWVjLWNhLWcxLmNybDAdBgNVHQ4E\nFgQUU0eFNfKNMAZI9A8Fy948s5C4I7AwDgYDVR0PAQH/BAQDAgGGMAoGCCqGSM49\nBAMEA4GMADCBiAJCAJQteDpDaxGGFpw0j6ZUHbSYRtO0Vq60QnpwejNw8aq9wFol\n+KTFyAPmEgLwW5P2rc778Act4aOFUX4/YpiYqmi2AkIBcQxn1HNpIBQjI+meugAt\n+GPkoE8KX5bDSsfiqC/edfeENwrZ6xaqAsz9NqFSpKpdQY8Gu22kFlmE9C0gscVm\nMZ8=</string>\n    </void>\n    <void method="add">\n     <string>MIICpjCCAgegAwIBAgIUcTxqJsDyAQbJzptHDlnLe+tgveowCgYIKoZIzj0EAwQw\nbTELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMScwJQYDVQQDDB5Db21tdW5pdHkgRGF5cyAy\nMDI0IFJvb3QgRUMgRzEwHhcNMjQwOTA1MTg1ODI1WhcNMzQwOTAzMTg1ODI0WjBt\nMQswCQYDVQQGEwJTRTESMBAGA1UECgwJS2V5ZmFjdG9yMSEwHwYDVQQLDBhDZXJ0\naWZpY2F0aW9uIEF1dGhvcml0ZXMxJzAlBgNVBAMMHkNvbW11bml0eSBEYXlzIDIw\nMjQgUm9vdCBFQyBHMTCBmzAQBgcqhkjOPQIBBgUrgQQAIwOBhgAEACXlDoyutMKe\n8m+3S0wZ0ZbKkssPYuVoWRphCZAYAb8D/FwNgrdQYJBDbMhhZ8NSOkIh4hTAhx3i\nv4+mdB5EYhlRALwTF8Ci03UtygP79GxmXZL7N0zHbCfyubJGUi7+U/U++wGb2b2b\nSj0W9DrLDDvWdK3OBBZTV5LnfIcqeuGjUVyUo0IwQDAPBgNVHRMBAf8EBTADAQH/\nMB0GA1UdDgQWBBRCWKO6Bwix3eyKPQH2i4A97fxMDjAOBgNVHQ8BAf8EBAMCAYYw\nCgYIKoZIzj0EAwQDgYwAMIGIAkIA23+nu6IG2hwWotNfi2ClccCZw3oS/HmnuZqU\ncAFlao7CkFVT3EaBeQV8SHVcaIy6jlrPW4KR1e2MEhEK5e2IlOYCQgHtPunDPWNo\nWkby54PNAyTXgCS+NsCn4yanUYmU75Yp6gZtycOuR97BEzVOBD8SFPclk2/+An2V\nI8y4jRmM6++viA==</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>expiretime</string>\n   <object class="java.util.Date">\n    <long>1883324026000</long>\n   </object>\n  </void>\n  <void method="put">\n   <string>externalcdp</string>\n   <null/>\n  </void>\n  <void method="put">\n   <string>alternatechains</string>\n   <object class="java.util.HashMap"/>\n  </void>\n </object>\n</java>\n	1883324026000	CommunityDaysSubEc-G1	\N	3	1	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1725647321361
1504435361	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.23" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>encodedvalidity</string>\n   <string>10y</string>\n  </void>\n  <void method="put">\n   <string>crlpublishers</string>\n   <object class="java.util.ArrayList"/>\n  </void>\n  <void method="put">\n   <string>signedby</string>\n   <int>1</int>\n  </void>\n  <void method="put">\n   <string>keyvalidators</string>\n   <object class="java.util.ArrayList"/>\n  </void>\n  <void method="put">\n   <string>description</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>revokationreason</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>certificateprofileid</string>\n   <int>1033547490</int>\n  </void>\n  <void method="put">\n   <string>usenoconflictcertificatedata</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>finishuser</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>includeinhealthcheck</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>doEnforceUniquePublicKeys</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>doEnforceKeyRenewal</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>doEnforceUniqueDistinguishedName</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>doEnforceUniqueSubjectDNSerialnumber</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>useCertreqHistory</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>useUserStorage</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>useCertificateStorage</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>acceptRevocationNonExistingEntry</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>keepExpiredCertsOnCRL</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>crlperiod</string>\n   <long>31536000000</long>\n  </void>\n  <void method="put">\n   <string>crlIssueInterval</string>\n   <long>0</long>\n  </void>\n  <void method="put">\n   <string>crlOverlapTime</string>\n   <long>0</long>\n  </void>\n  <void method="put">\n   <string>deltacrlperiod</string>\n   <long>0</long>\n  </void>\n  <void method="put">\n   <string>generatecrluponrevocation</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>allowchangingrevocationreason</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>allowinvaliditydate</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>extendedcaservice5</string>\n   <object class="org.cesecore.util.Base64GetHashMap">\n    <void method="put">\n     <string>IMPLCLASS</string>\n     <string>org.ejbca.core.model.ca.caadmin.extendedcaservices.KeyRecoveryCAService</string>\n    </void>\n    <void method="put">\n     <string>extendedcaservicetype</string>\n     <int>5</int>\n    </void>\n    <void method="put">\n     <string>version</string>\n     <float>1.0</float>\n    </void>\n    <void method="put">\n     <string>status</string>\n     <int>2</int>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>extendedcaservices</string>\n   <object class="java.util.ArrayList">\n    <void method="add">\n     <int>5</int>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>approvals</string>\n   <object class="java.util.LinkedHashMap">\n    <void method="put">\n     <object class="java.lang.Enum" method="valueOf">\n      <class>org.cesecore.certificates.ca.ApprovalRequestType</class>\n      <string>ADDEDITENDENTITY</string>\n     </object>\n     <int>-1</int>\n    </void>\n    <void method="put">\n     <object class="java.lang.Enum" method="valueOf">\n      <class>org.cesecore.certificates.ca.ApprovalRequestType</class>\n      <string>KEYRECOVER</string>\n     </object>\n     <int>-1</int>\n    </void>\n    <void method="put">\n     <object class="java.lang.Enum" method="valueOf">\n      <class>org.cesecore.certificates.ca.ApprovalRequestType</class>\n      <string>REVOCATION</string>\n     </object>\n     <int>-1</int>\n    </void>\n    <void method="put">\n     <object class="java.lang.Enum" method="valueOf">\n      <class>org.cesecore.certificates.ca.ApprovalRequestType</class>\n      <string>ACTIVATECA</string>\n     </object>\n     <int>-1</int>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>policies</string>\n   <object class="java.util.ArrayList"/>\n  </void>\n  <void method="put">\n   <string>subjectaltname</string>\n   <string>None</string>\n  </void>\n  <void method="put">\n   <string>catype</string>\n   <int>1</int>\n  </void>\n  <void method="put">\n   <string>version</string>\n   <float>25.0</float>\n  </void>\n  <void method="put">\n   <string>msCaCompatible</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>useauthoritykeyidentifier</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>authoritykeyidentifiercritical</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>usecrlnumber</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>crlnumbercritical</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>defaultcrldistpoint</string>\n   <string>http://crl.community2024.local/crls/comm-root-ec-ca-g1.crl</string>\n  </void>\n  <void method="put">\n   <string>defaultcrlissuer</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>cadefinedfreshestcrl</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>defaultocspservicelocator</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>useutf8policytext</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>useprintablestringsubjectdn</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>useldapdnorder</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>usecrldistributionpointoncrl</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>crldistributionpointoncrlcritical</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>cmpraauthsecret</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>authorityinformationaccess</string>\n   <object class="java.util.ArrayList">\n    <void method="add">\n     <string>http://aia.community2024.local/aia/comm-root-ec-ca-g1.crt</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>certificateaiadefaultcaissueruri</string>\n   <object class="java.util.ArrayList">\n    <void method="add">\n     <string>http://aia.community2024.local/aia/comm-root-ec-ca-g1.crt</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>nameconstraintspermitted</string>\n   <object class="java.util.ArrayList"/>\n  </void>\n  <void method="put">\n   <string>nameconstraintsexcluded</string>\n   <object class="java.util.ArrayList"/>\n  </void>\n  <void method="put">\n   <string>serialnumberoctetsize</string>\n   <int>20</int>\n  </void>\n  <void method="put">\n   <string>dopreproduceocspresponses</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>dostoreocspondemand</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>dopreproduceocspresponsesuponissuanceandrevocation</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>usepartitionedcrl</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>crlpartitions</string>\n   <int>0</int>\n  </void>\n  <void method="put">\n   <string>suspendedcrlpartitions</string>\n   <int>0</int>\n  </void>\n  <void method="put">\n   <string>requestpreprocessor</string>\n   <null/>\n  </void>\n  <void method="put">\n   <string>catoken</string>\n   <object class="org.cesecore.util.Base64GetHashMap">\n    <void method="put">\n     <string>version</string>\n     <float>8.0</float>\n    </void>\n    <void method="put">\n     <string>cryptotokenid</string>\n     <string>-1080031981</string>\n    </void>\n    <void method="put">\n     <string>propertydata</string>\n     <string>certSignKey=signKey001\ncrlSignKey=signKey001\ntestKey=testKey\ndefaultKey=defaultKey001\n</string>\n    </void>\n    <void method="put">\n     <string>signaturealgorithm</string>\n     <string>SHA512withECDSA</string>\n    </void>\n    <void method="put">\n     <string>encryptionalgorithm</string>\n     <string>SHA512withECDSA</string>\n    </void>\n    <void method="put">\n     <string>sequenceformat</string>\n     <int>1</int>\n    </void>\n    <void method="put">\n     <string>sequence</string>\n     <string>00000</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>certificatechain</string>\n   <object class="java.util.ArrayList">\n    <void method="add">\n     <string>MIICpjCCAgegAwIBAgIUcTxqJsDyAQbJzptHDlnLe+tgveowCgYIKoZIzj0EAwQw\nbTELMAkGA1UEBhMCU0UxEjAQBgNVBAoMCUtleWZhY3RvcjEhMB8GA1UECwwYQ2Vy\ndGlmaWNhdGlvbiBBdXRob3JpdGVzMScwJQYDVQQDDB5Db21tdW5pdHkgRGF5cyAy\nMDI0IFJvb3QgRUMgRzEwHhcNMjQwOTA1MTg1ODI1WhcNMzQwOTAzMTg1ODI0WjBt\nMQswCQYDVQQGEwJTRTESMBAGA1UECgwJS2V5ZmFjdG9yMSEwHwYDVQQLDBhDZXJ0\naWZpY2F0aW9uIEF1dGhvcml0ZXMxJzAlBgNVBAMMHkNvbW11bml0eSBEYXlzIDIw\nMjQgUm9vdCBFQyBHMTCBmzAQBgcqhkjOPQIBBgUrgQQAIwOBhgAEACXlDoyutMKe\n8m+3S0wZ0ZbKkssPYuVoWRphCZAYAb8D/FwNgrdQYJBDbMhhZ8NSOkIh4hTAhx3i\nv4+mdB5EYhlRALwTF8Ci03UtygP79GxmXZL7N0zHbCfyubJGUi7+U/U++wGb2b2b\nSj0W9DrLDDvWdK3OBBZTV5LnfIcqeuGjUVyUo0IwQDAPBgNVHRMBAf8EBTADAQH/\nMB0GA1UdDgQWBBRCWKO6Bwix3eyKPQH2i4A97fxMDjAOBgNVHQ8BAf8EBAMCAYYw\nCgYIKoZIzj0EAwQDgYwAMIGIAkIA23+nu6IG2hwWotNfi2ClccCZw3oS/HmnuZqU\ncAFlao7CkFVT3EaBeQV8SHVcaIy6jlrPW4KR1e2MEhEK5e2IlOYCQgHtPunDPWNo\nWkby54PNAyTXgCS+NsCn4yanUYmU75Yp6gZtycOuR97BEzVOBD8SFPclk2/+An2V\nI8y4jRmM6++viA==</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>expiretime</string>\n   <object class="java.util.Date">\n    <long>2040922704000</long>\n   </object>\n  </void>\n  <void method="put">\n   <string>externalcdp</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>alternatechains</string>\n   <object class="java.util.HashMap"/>\n  </void>\n </object>\n</java>\n	2040922704000	CommunityDaysRootEc-G1	\N	5	5	CN=Community Days 2024 Root EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1726319954431
\.


--
-- Data for Name: certificatedata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.certificatedata (fingerprint, base64cert, cafingerprint, certificateprofileid, endentityprofileid, crlpartitionindex, expiredate, issuerdn, notbefore, invaliditydate, revocationdate, revocationreason, rowprotection, rowversion, serialnumber, status, subjectaltname, subjectdn, subjectkeyid, accountbindingid, tag, type, updatetime, username, certificaterequest) FROM stdin;
b004102d9934c8335842ec2e792071872a5ddd04	\N	b004102d9934c8335842ec2e792071872a5ddd04	0	0	0	2040922704000	CN=Community Days 2024 Root EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1725562705000	-1	-1	-1	\N	0	646463248904512745059347668620493567173356207594	20	\N	CN=Community Days 2024 Root EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	QlijugcIsd3sij0B9ouAPe38TA4=	\N	\N	8	1725562705504	SYSTEMCA	\N
50f1fffcfb2f55dec59f7a7ad5f9745525102e44	\N	b004102d9934c8335842ec2e792071872a5ddd04	0	0	0	1883324026000	CN=Community Days 2024 Root EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1725644027000	-1	-1	-1	\N	0	167554350153403568114825605671384853472141003605	20	\N	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	U0eFNfKNMAZI9A8Fy948s5C4I7A=	\N	\N	2	1725644027640	SYSTEMCA	\N
3c759ca2e1fe35dc3a1d80e418f481f5c51e5fe5	\N	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	1542919907	890019301	0	1820256897000	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1725648898000	-1	-1	-1	\N	0	126432228677232988438527669986475926654757216544	20	\N	CN=Community Day 2024 PKI Admin,OU=PKI Admins,O=Keyfactor,C=SE	/E+mB/LqmiT3BSNReS1YQZQMRXU=	\N	\N	1	1725649498426	communityDay2024PKIAdmin	\N
55c59245a6e2d48d692b6843b27b7b1c98bf6b72	\N	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	389999629	889677003	0	1757185206000	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1725649207000	-1	-1	-1	\N	0	615448576770770411605732006162763799360948358206	20	dNSName=enroll.community2024.local		HwvNcR75isEWrIhsX02z0YTGOTE=	\N	\N	1	1725649807745	enroll.community2024.local	\N
a03a34ed1fb23769ee11c09d57fff0d3b061628d	\N	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	389999629	889677003	0	1757193596000	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1725657597000	-1	-1	-1	\N	0	193985514558349402251689324395577565273365768706	20	dNSName=sign.community2024.local		y0PLubOpTSiWxiuzo1mf4ax22NA=	\N	\N	1	1725658197102	sign.community2024.local	\N
792a5ca944256f2c5dd4efc103ddf25c69da344c	\N	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	499639567	1181467576	0	1733435225000	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1725659226000	-1	-1	-1	\N	0	301352294951413660663307772001480569613837795620	20	\N	CN=Community Days 2024 Plain Signer,OU=Signers,O=Keyfactor,C=SE	aVu72dqS5wMFbkQKC8CpXiuQwcA=	\N	\N	1	1725659826166	communityDays2024PlainSigner	MIHmMIGNAgEAMCsxKTAnBgNVBAMMIENvbW11bml0eSBEYXlzIDIwMjQgUGxhaW4g\nU2lnbmVyMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEsGsraJn06p4+px5bCwYR\nuTHfMNuOSzFWRmy4EdUreJA8xrE7cd8IJ6v2PAMx21q5aL5XugL4hkEubpWpmgsW\ndaAAMAoGCCqGSM49BAMCA0gAMEUCIAbaFi5Kw9P6jZRBjqkuOprFJuc+9XpjZjJz\nBlLgG8+JAiEA/odarFOk/51gJODu4n83Cn5Jfnbl2GUhtYQ7RIKL7Ho=
23ba08b1e021b78cc6a774b9c5ad2b70c9a53d9b	\N	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	2025547880	1181467576	0	1757195422000	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1725659423000	-1	-1	-1	\N	0	333046118949835127766904950965289696005081089162	20	\N	CN=Community Days 2024 Time Stamp Authority,OU=Signers,O=Keyfactor,C=SE	CUYB6RmbAEx+/+8PGbRSpqXwp5E=	\N	\N	1	1725660023333	communityDays2024TimeStampAuthority	MIHuMIGVAgEAMDMxMTAvBgNVBAMMKENvbW11bml0eSBEYXlzIDIwMjQgVGltZSBT\ndGFtcCBBdXRob3JpdHkwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQFGehav1IF\ndAaf91zibD239vauFoGKNYo6ysK4y06FDxvKFPRtfDq/AsN0UJDhMC+hRKX8Hklc\nLSpfc5rV8RmroAAwCgYIKoZIzj0EAwIDSAAwRQIgEGGEgeZ5iYAjLHaQaF8Z1mZ+\nT0Gm2adML5J2iSNowJQCIQDdrt5aX9jLQnvpUYzcQinIcS3muLBr0sWBXx+ErT2R\nIw==
892291e9807a4556be33055308ff7a719a68bcaf	\N	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	2025547880	1181467576	0	1757196311000	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1725660312000	-1	-1	-1	\N	0	548939163872106948257106285223233032909984618799	20	\N	CN=Community Days 2024 Time Stamp Authority,OU=Signers,O=Keyfactor,C=SE	CUYB6RmbAEx+/+8PGbRSpqXwp5E=	\N	\N	1	1725660912451	communityDays2024TimeStampAuthority	MIHuMIGVAgEAMDMxMTAvBgNVBAMMKENvbW11bml0eSBEYXlzIDIwMjQgVGltZSBT\ndGFtcCBBdXRob3JpdHkwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQFGehav1IF\ndAaf91zibD239vauFoGKNYo6ysK4y06FDxvKFPRtfDq/AsN0UJDhMC+hRKX8Hklc\nLSpfc5rV8RmroAAwCgYIKoZIzj0EAwIDSAAwRQIgEGGEgeZ5iYAjLHaQaF8Z1mZ+\nT0Gm2adML5J2iSNowJQCIQDdrt5aX9jLQnvpUYzcQinIcS3muLBr0sWBXx+ErT2R\nIw==
349eeba7074792f05ef209ecac4ea0860d6082df	\N	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	389999629	889677003	0	1757855280000	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1726319281000	-1	-1	-1	\N	0	96958445655888869453306205550971496896658615970	20	dNSName=registry.community2024.local		aYhPAQprd4hsJ8DuRnbChynouk4=	\N	\N	1	1726319881802	registry.community2024.local	\N
b2e01761b495f1583848ca58f756411ca414d736	\N	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	389999629	889677003	0	1758369530000	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1726833531000	-1	-1	-1	\N	0	181707491667458871227341008880814944059225489927	20	dNSName=vault.community2024.local, dNSName=vault, iPAddress=127.0.0.1		rUUNBq7xe8B4yd68efelpL5DPDE=	\N	\N	1	1726834130989	vault.community2024.local	\N
\.


--
-- Data for Name: certificateprofiledata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.certificateprofiledata (id, certificateprofilename, data, rowprotection, rowversion) FROM stdin;
1033547490	CommunityRootP521-10y	\\xaced0005737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000c07708000001000000007c74000776657273696f6e7372000f6a6176612e6c616e672e466c6f6174daedc9a2db3cf0ec02000146000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078704250000074000474797065737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e00050000000874000b6365727476657273696f6e74000658353039763374000f656e636f64656476616c696469747974000331307974001c757365636572746966696361746576616c69646974796f6666736574737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c7565787000740019636572746966696361746576616c69646974796f66667365747400042d31306d74002375736565787069726174696f6e7265737472696374696f6e666f727765656b6461797371007e001074002665787069726174696f6e7265737472696374696f6e666f727765656b646179736265666f72657371007e000f0174001d65787069726174696f6e7265737472696374696f6e7765656b64617973737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000777040000000771007e001571007e00157371007e000f0071007e001971007e001971007e001571007e001578740015616c6c6f7776616c69646974796f766572726964657371007e000f0174001b616c6c6f776578706972656476616c6964697479656e646461746571007e001074000b6465736372697074696f6e740000740016616c6c6f77657874656e73696f6e6f7665727269646571007e001074000f616c6c6f77646e6f7665727269646571007e0010740014616c6c6f77646e6f76657272696465627965656971007e0010740018616c6c6f776261636b64617465647265766f6b6174696f6e71007e0010740015757365636572746966696361746573746f7261676571007e001574001473746f726563657274696669636174656461746171007e001574001373746f72657375626a656374616c746e616d6571007e001b7400127573656261736963636f6e737472616e747371007e001b7400186261736963636f6e73747261696e7473637269746963616c71007e001b7400177573657375626a6563746b65796964656e74696669657271007e001b74001c7375626a6563746b65796964656e746966696572637269746963616c71007e0019740019757365617574686f726974796b65796964656e74696669657271007e001074001e617574686f726974796b65796964656e746966696572637269746963616c71007e00197400197573657375626a656374616c7465726e61746976656e616d6571007e001074001e7375626a656374616c7465726e61746976656e616d65637269746963616c71007e0010740018757365697373756572616c7465726e61746976656e616d6571007e001074001d697373756572616c7465726e61746976656e616d65637269746963616c71007e001074001775736563726c646973747269627574696f6e706f696e7471007e001074001e75736564656661756c7463726c646973747269627574696f6e706f696e7471007e001974001c63726c646973747269627574696f6e706f696e74637269746963616c71007e001974001763726c646973747269627574696f6e706f696e7475726974000074000e757365667265736865737463726c71007e00107400177573656361646566696e6564667265736865737463726c71007e001974000e667265736865737463726c75726971007e003474000963726c69737375657271007e00347400167573656365727469666963617465706f6c696369657371007e001074001b6365727469666963617465706f6c6963696573637269746963616c71007e00197400136365727469666963617465706f6c69636965737371007e00170000000077040000000078740016617661696c61626c656b6579616c676f726974686d737371007e001700000001770400000001740005454344534178740011617661696c61626c6565636375727665737371007e001700000001770400000001740005502d35323178740013617661696c61626c656269746c656e677468737371007e0017000000337704000000337371007e0008000000007371007e00080000006e7371007e0008000000707371007e0008000000717371007e00080000007e7371007e0008000000807371007e0008000000837371007e0008000000a07371007e0008000000a17371007e0008000000a27371007e0008000000a37371007e0008000000a77371007e0008000000ad7371007e0008000000b37371007e0008000000bd7371007e0008000000be7371007e0008000000bf7371007e0008000000c07371007e0008000000c17371007e0008000000e07371007e0008000000e17371007e0008000000e87371007e0008000000e97371007e0008000000ec7371007e0008000000ed7371007e0008000000ee7371007e0008000000ef7371007e0008000001007371007e0008000001017371007e0008000001197371007e00080000011a7371007e0008000001217371007e0008000001337371007e0008000001407371007e0008000001617371007e00080000016f7371007e0008000001807371007e0008000001977371007e0008000001997371007e0008000001a27371007e0008000001af7371007e0008000002007371007e0008000002097371007e00080000023a7371007e0008000004007371007e0008000006007371007e0008000008007371007e000800000c007371007e0008000010007371007e0008000018007371007e000800002000787400196d696e696d756d617661696c61626c656269746c656e67746871007e00457400196d6178696d756d617661696c61626c656269746c656e6774687371007e0008000020007400127369676e6174757265616c676f726974686d74000f534841353132776974684543445341740017757365416c7465726e61746976655369676e617475726571007e0010740021616c7465726e6174697665417661696c61626c654b6579416c676f726974686d737371007e00170000000877040000000874000a46414c434f4e2d35313274000b46414c434f4e2d313032347400084b594245523531327400084b594245523736387400094b594245523130323474000a44494c49544849554d3274000a44494c49544849554d3374000a44494c49544849554d357874001d616c7465726e61746976655369676e6174757265416c676f726974686d7074000b7573656b6579757361676571007e001b7400086b657975736167657371007e00170000000977040000000971007e001b71007e001071007e001071007e001071007e001071007e001b71007e001b71007e001071007e001078740015616c6c6f776b657975736167656f7665727269646571007e00107400106b65797573616765637269746963616c71007e001b740013757365657874656e6465646b6579757361676571007e0010740010657874656e6465646b657975736167657371007e00170000000077040000000078740018657874656e6465646b65797573616765637269746963616c71007e0019740013757365646f63756d656e74747970656c69737471007e0010740018646f63756d656e74747970656c697374637269746963616c71007e0019740010646f63756d656e74747970656c6973747371007e0017000000007704000000007874000c617661696c61626c656361737371007e0017000000017704000000017371007e0008ffffffff7874000e757365647075626c6973686572737371007e0017000000007704000000007874000e7573656f6373706e6f636865636b71007e001074000e7573656c646170646e6f7264657271007e0010740010757365637573746f6d646e6f7264657271007e00107400147573656d6963726f736f667474656d706c61746571007e00107400116d6963726f736f667474656d706c6174657400007400177573656d736f626a656374736964657874656e73696f6e71007e001074000d757365636172646e756d62657271007e001974000c757365636e706f737466697871007e0010740009636e706f737466697871007e00a07400127573657375626a656374646e73756273657471007e001074000f7375626a656374646e7375627365747371007e001700000000770400000000787400177573657375626a656374616c746e616d6573756273657471007e00107400147375626a656374616c746e616d657375627365747371007e00170000000077040000000078740017757365706174686c656e677468636f6e73747261696e7471007e0010740014706174686c656e677468636f6e73747261696e7471007e004574000e757365716373746174656d656e7471007e0010740011757365706b6978716373796e746178763271007e0019740016757365716373746174656d656e74637269746963616c71007e0019740014757365716373746174656d656e7472616e616d6571007e00a074000f757365716373656d6174696373696471007e00a07400157573657163657473697163636f6d706c69616e636571007e00197400187573657163657473697369676e617475726564657669636571007e001974001375736571636574736976616c75656c696d697471007e001974001071636574736976616c75656c696d697471007e004574001371636574736976616c75656c696d697465787071007e004574001871636574736976616c75656c696d697463757272656e637971007e00a0740018757365716365747369726574656e74696f6e706572696f6471007e0019740015716365747369726574656e74696f6e706572696f6471007e004574000e7573657163636f756e747269657371007e00197400107163636f756e74726965737472696e6771007e00a07400117573657163637573746f6d737472696e6771007e00197400117163637573746f6d737472696e676f696471007e00a07400127163637573746f6d737472696e677465787471007e00a07400097163657473697064737074000a716365747369747970657074001b75736576616c69646974796173737572656473686f72747465726d71007e001074002076616c69646974796173737572656473686f72747465726d637269746963616c71007e001974002175736563657274696669636174657472616e73706172656e6379696e636572747371007e001974002075736563657274696669636174657472616e73706172656e6379696e6f63737071007e001974002575736563657274696669636174657472616e73706172656e6379696e7075626c697368657271007e00197400177573657375626a6563746469726174747269627574657371007e00107400127573656e616d65636f6e73747261696e747371007e001074001d757365617574686f72697479696e666f726d6174696f6e61636365737371007e00107400096361697373756572737371007e0017000000007704000000007874001275736564656661756c74636169737375657271007e001974001c75736564656661756c746f637370736572766963656c6f6361746f7271007e00197400156f637370736572766963656c6f6361746f7275726971007e00a074000f6376636163636573737269676874737371007e000800000003740019757365646365727469666963617465657874656e73696f6e737371007e00170000000077040000000078740009617070726f76616c737371007e00003f40000000000006770800000008000000037e7200306f72672e63657365636f72652e6365727469666963617465732e63612e417070726f76616c526571756573745479706500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001041444445444954454e44454e5449545971007e00987e71007e00d474000a4b45595245434f56455271007e00987e71007e00d474000a5245564f434154494f4e71007e0098780074001e757365707269766b65797573616765706572696f646e6f746265666f726571007e0010740015757365707269766b65797573616765706572696f6471007e001074001d757365707269766b65797573616765706572696f646e6f74616674657271007e001074001d707269766b65797573616765706572696f6473746172746f66667365747372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c75657871007e00050000000000000000740018707269766b65797573616765706572696f646c656e6774687371007e00e00000000003c2670074002475736573696e676c656163746976656365727469666963617465636f6e73747261696e7471007e00197400186f76657272696461626c65657874656e73696f6e6f696473737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000013f400000000000007874001b6e6f6e6f76657272696461626c65657874656e73696f6e6f6964737371007e00e6770c000000013f400000000000007874000d6561626e616d657370616365737371007e00e6770c000000103f4000000000000078740013616c6c6f7763657274736e6f7665727269646571007e00107400207573657472756e63617465647375626a6563746b65796964656e74696669657271007e00107400236b65797573616765666f72626964656e6379727074696f6e7573616765666f7265636371007e0010740014757365637573746f6d646e6f726465726c64617071007e00107800	\N	1
822716451	CommunitySubP256-5y	\\xaced0005737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000c07708000001000000007c74000776657273696f6e7372000f6a6176612e6c616e672e466c6f6174daedc9a2db3cf0ec02000146000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078704250000074000474797065737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e00050000000274000b6365727476657273696f6e74000658353039763374000f656e636f64656476616c6964697479740002357974001c757365636572746966696361746576616c69646974796f6666736574737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c7565787000740019636572746966696361746576616c69646974796f66667365747400042d31306d74002375736565787069726174696f6e7265737472696374696f6e666f727765656b6461797371007e001074002665787069726174696f6e7265737472696374696f6e666f727765656b646179736265666f72657371007e000f0174001d65787069726174696f6e7265737472696374696f6e7765656b64617973737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000777040000000771007e001571007e00157371007e000f0071007e001971007e001971007e001571007e001578740015616c6c6f7776616c69646974796f766572726964657371007e000f0174001b616c6c6f776578706972656476616c6964697479656e646461746571007e001074000b6465736372697074696f6e740000740016616c6c6f77657874656e73696f6e6f7665727269646571007e001074000f616c6c6f77646e6f7665727269646571007e0010740014616c6c6f77646e6f76657272696465627965656971007e0010740018616c6c6f776261636b64617465647265766f6b6174696f6e71007e0010740015757365636572746966696361746573746f7261676571007e001574001473746f726563657274696669636174656461746171007e001574001373746f72657375626a656374616c746e616d6571007e001b7400127573656261736963636f6e737472616e747371007e001b7400186261736963636f6e73747261696e7473637269746963616c71007e001b7400177573657375626a6563746b65796964656e74696669657271007e001b74001c7375626a6563746b65796964656e746966696572637269746963616c71007e0019740019757365617574686f726974796b65796964656e74696669657271007e001b74001e617574686f726974796b65796964656e746966696572637269746963616c71007e00197400197573657375626a656374616c7465726e61746976656e616d6571007e001074001e7375626a656374616c7465726e61746976656e616d65637269746963616c71007e0010740018757365697373756572616c7465726e61746976656e616d6571007e001074001d697373756572616c7465726e61746976656e616d65637269746963616c71007e001074001775736563726c646973747269627574696f6e706f696e7471007e001b74001e75736564656661756c7463726c646973747269627574696f6e706f696e7471007e001b74001c63726c646973747269627574696f6e706f696e74637269746963616c71007e001074001763726c646973747269627574696f6e706f696e7475726974000074000e757365667265736865737463726c71007e00107400177573656361646566696e6564667265736865737463726c71007e001974000e667265736865737463726c75726971007e003474000963726c69737375657271007e00347400167573656365727469666963617465706f6c696369657371007e001074001b6365727469666963617465706f6c6963696573637269746963616c71007e00197400136365727469666963617465706f6c69636965737371007e00170000000077040000000078740016617661696c61626c656b6579616c676f726974686d737371007e001700000001770400000001740005454344534178740011617661696c61626c6565636375727665737371007e001700000001770400000001740005502d32353678740013617661696c61626c656269746c656e677468737371007e0017000000337704000000337371007e0008000000007371007e00080000006e7371007e0008000000707371007e0008000000717371007e00080000007e7371007e0008000000807371007e0008000000837371007e0008000000a07371007e0008000000a17371007e0008000000a27371007e0008000000a37371007e0008000000a77371007e0008000000ad7371007e0008000000b37371007e0008000000bd7371007e0008000000be7371007e0008000000bf7371007e0008000000c07371007e0008000000c17371007e0008000000e07371007e0008000000e17371007e0008000000e87371007e0008000000e97371007e0008000000ec7371007e0008000000ed7371007e0008000000ee7371007e0008000000ef7371007e0008000001007371007e0008000001017371007e0008000001197371007e00080000011a7371007e0008000001217371007e0008000001337371007e0008000001407371007e0008000001617371007e00080000016f7371007e0008000001807371007e0008000001977371007e0008000001997371007e0008000001a27371007e0008000001af7371007e0008000002007371007e0008000002097371007e00080000023a7371007e0008000004007371007e0008000006007371007e0008000008007371007e000800000c007371007e0008000010007371007e0008000018007371007e000800002000787400196d696e696d756d617661696c61626c656269746c656e67746871007e00457400196d6178696d756d617661696c61626c656269746c656e6774687371007e0008000020007400127369676e6174757265616c676f726974686d70740017757365416c7465726e61746976655369676e617475726571007e0019740021616c7465726e6174697665417661696c61626c654b6579416c676f726974686d737371007e00170000000877040000000874000a46414c434f4e2d35313274000b46414c434f4e2d313032347400084b594245523531327400084b594245523736387400094b594245523130323474000a44494c49544849554d3274000a44494c49544849554d3374000a44494c49544849554d357874001d616c7465726e61746976655369676e6174757265416c676f726974686d7074000b7573656b6579757361676571007e001b7400086b657975736167657371007e00170000000977040000000971007e001b71007e001071007e001071007e001071007e001071007e001b71007e001b71007e001071007e001078740015616c6c6f776b657975736167656f7665727269646571007e00107400106b65797573616765637269746963616c71007e001b740013757365657874656e6465646b6579757361676571007e0010740010657874656e6465646b657975736167657371007e00170000000077040000000078740018657874656e6465646b65797573616765637269746963616c71007e0019740013757365646f63756d656e74747970656c69737471007e0010740018646f63756d656e74747970656c697374637269746963616c71007e0019740010646f63756d656e74747970656c6973747371007e0017000000007704000000007874000c617661696c61626c656361737371007e0017000000017704000000017371007e0008ffffffff7874000e757365647075626c6973686572737371007e0017000000007704000000007874000e7573656f6373706e6f636865636b71007e001074000e7573656c646170646e6f7264657271007e0010740010757365637573746f6d646e6f7264657271007e00107400147573656d6963726f736f667474656d706c61746571007e00107400116d6963726f736f667474656d706c6174657400007400177573656d736f626a656374736964657874656e73696f6e71007e001074000d757365636172646e756d62657271007e001974000c757365636e706f737466697871007e0010740009636e706f737466697871007e009f7400127573657375626a656374646e73756273657471007e001074000f7375626a656374646e7375627365747371007e001700000000770400000000787400177573657375626a656374616c746e616d6573756273657471007e00107400147375626a656374616c746e616d657375627365747371007e00170000000077040000000078740017757365706174686c656e677468636f6e73747261696e7471007e001b740014706174686c656e677468636f6e73747261696e747371007e00080000000074000e757365716373746174656d656e7471007e0010740011757365706b6978716373796e746178763271007e0019740016757365716373746174656d656e74637269746963616c71007e0019740014757365716373746174656d656e7472616e616d6571007e009f74000f757365716373656d6174696373696471007e009f7400157573657163657473697163636f6d706c69616e636571007e00197400187573657163657473697369676e617475726564657669636571007e001974001375736571636574736976616c75656c696d697471007e001974001071636574736976616c75656c696d697471007e004574001371636574736976616c75656c696d697465787071007e004574001871636574736976616c75656c696d697463757272656e637971007e009f740018757365716365747369726574656e74696f6e706572696f6471007e0019740015716365747369726574656e74696f6e706572696f6471007e004574000e7573657163636f756e747269657371007e00197400107163636f756e74726965737472696e6771007e009f7400117573657163637573746f6d737472696e6771007e00197400117163637573746f6d737472696e676f696471007e009f7400127163637573746f6d737472696e677465787471007e009f7400097163657473697064737074000a716365747369747970657074001b75736576616c69646974796173737572656473686f72747465726d71007e001074002076616c69646974796173737572656473686f72747465726d637269746963616c71007e001974002175736563657274696669636174657472616e73706172656e6379696e636572747371007e001974002075736563657274696669636174657472616e73706172656e6379696e6f63737071007e001974002575736563657274696669636174657472616e73706172656e6379696e7075626c697368657271007e00197400177573657375626a6563746469726174747269627574657371007e00107400127573656e616d65636f6e73747261696e747371007e001074001d757365617574686f72697479696e666f726d6174696f6e61636365737371007e001b7400096361697373756572737371007e0017000000007704000000007874001275736564656661756c74636169737375657271007e001b74001c75736564656661756c746f637370736572766963656c6f6361746f7271007e001b7400156f637370736572766963656c6f6361746f7275726974000074000f6376636163636573737269676874737371007e000800000003740019757365646365727469666963617465657874656e73696f6e737371007e00170000000077040000000078740009617070726f76616c737371007e00003f40000000000006770800000008000000037e7200306f72672e63657365636f72652e6365727469666963617465732e63612e417070726f76616c526571756573745479706500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001041444445444954454e44454e5449545971007e00977e71007e00d574000a4b45595245434f56455271007e00977e71007e00d574000a5245564f434154494f4e71007e0097780074001e757365707269766b65797573616765706572696f646e6f746265666f726571007e0010740015757365707269766b65797573616765706572696f6471007e001074001d757365707269766b65797573616765706572696f646e6f74616674657271007e001074001d707269766b65797573616765706572696f6473746172746f66667365747372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c75657871007e00050000000000000000740018707269766b65797573616765706572696f646c656e6774687371007e00e10000000003c2670074002475736573696e676c656163746976656365727469666963617465636f6e73747261696e7471007e00197400186f76657272696461626c65657874656e73696f6e6f696473737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000013f400000000000007874001b6e6f6e6f76657272696461626c65657874656e73696f6e6f6964737371007e00e7770c000000013f400000000000007874000d6561626e616d657370616365737371007e00e7770c000000103f4000000000000078740013616c6c6f7763657274736e6f7665727269646571007e00107400207573657472756e63617465647375626a6563746b65796964656e74696669657271007e00107400236b65797573616765666f72626964656e6379727074696f6e7573616765666f7265636371007e0010740014757365637573746f6d646e6f726465726c64617071007e00107800	\N	1
389999629	tlsServerNoDn-1y	\\xaced0005737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000c07708000001000000007d74000776657273696f6e7372000f6a6176612e6c616e672e466c6f6174daedc9a2db3cf0ec02000146000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078704250000074000474797065737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e00050000000174000b6365727476657273696f6e74000658353039763374000f656e636f64656476616c6964697479740002317974001c757365636572746966696361746576616c69646974796f6666736574737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c7565787000740019636572746966696361746576616c69646974796f66667365747400042d31306d74002375736565787069726174696f6e7265737472696374696f6e666f727765656b6461797371007e001074002665787069726174696f6e7265737472696374696f6e666f727765656b646179736265666f72657371007e000f0174001d65787069726174696f6e7265737472696374696f6e7765656b64617973737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000777040000000771007e001571007e00157371007e000f0071007e001971007e001971007e001571007e001578740015616c6c6f7776616c69646974796f7665727269646571007e001074001b616c6c6f776578706972656476616c6964697479656e646461746571007e001074000b6465736372697074696f6e740000740016616c6c6f77657874656e73696f6e6f7665727269646571007e001074000f616c6c6f77646e6f7665727269646571007e0010740014616c6c6f77646e6f76657272696465627965656971007e0010740018616c6c6f776261636b64617465647265766f6b6174696f6e71007e0010740015757365636572746966696361746573746f726167657371007e000f0174001473746f726563657274696669636174656461746171007e002374001373746f72657375626a656374616c746e616d6571007e00237400127573656261736963636f6e737472616e747371007e00107400186261736963636f6e73747261696e7473637269746963616c71007e00237400177573657375626a6563746b65796964656e74696669657271007e002374001c7375626a6563746b65796964656e746966696572637269746963616c71007e0019740019757365617574686f726974796b65796964656e74696669657271007e002374001e617574686f726974796b65796964656e746966696572637269746963616c71007e00197400197573657375626a656374616c7465726e61746976656e616d6571007e002374001e7375626a656374616c7465726e61746976656e616d65637269746963616c71007e0023740018757365697373756572616c7465726e61746976656e616d6571007e001074001d697373756572616c7465726e61746976656e616d65637269746963616c71007e001074001775736563726c646973747269627574696f6e706f696e7471007e002374001e75736564656661756c7463726c646973747269627574696f6e706f696e7471007e002374001c63726c646973747269627574696f6e706f696e74637269746963616c71007e001074001763726c646973747269627574696f6e706f696e7475726974000074000e757365667265736865737463726c71007e00107400177573656361646566696e6564667265736865737463726c71007e001974000e667265736865737463726c75726971007e003474000963726c69737375657271007e00347400167573656365727469666963617465706f6c696369657371007e001074001b6365727469666963617465706f6c6963696573637269746963616c71007e00197400136365727469666963617465706f6c69636965737371007e00170000000077040000000078740016617661696c61626c656b6579616c676f726974686d737371007e001700000001770400000001740005454344534178740011617661696c61626c6565636375727665737371007e001700000001770400000001740005502d32353678740013617661696c61626c656269746c656e677468737371007e0017000000337704000000337371007e0008000000007371007e00080000006e7371007e0008000000707371007e0008000000717371007e00080000007e7371007e0008000000807371007e0008000000837371007e0008000000a07371007e0008000000a17371007e0008000000a27371007e0008000000a37371007e0008000000a77371007e0008000000ad7371007e0008000000b37371007e0008000000bd7371007e0008000000be7371007e0008000000bf7371007e0008000000c07371007e0008000000c17371007e0008000000e07371007e0008000000e17371007e0008000000e87371007e0008000000e97371007e0008000000ec7371007e0008000000ed7371007e0008000000ee7371007e0008000000ef7371007e0008000001007371007e0008000001017371007e0008000001197371007e00080000011a7371007e0008000001217371007e0008000001337371007e0008000001407371007e0008000001617371007e00080000016f7371007e0008000001807371007e0008000001977371007e0008000001997371007e0008000001a27371007e0008000001af7371007e0008000002007371007e0008000002097371007e00080000023a7371007e0008000004007371007e0008000006007371007e0008000008007371007e000800000c007371007e0008000010007371007e0008000018007371007e000800002000787400196d696e696d756d617661696c61626c656269746c656e67746871007e00457400196d6178696d756d617661696c61626c656269746c656e6774687371007e0008000020007400127369676e6174757265616c676f726974686d74000f534841323536776974684543445341740017757365416c7465726e61746976655369676e617475726571007e0019740021616c7465726e6174697665417661696c61626c654b6579416c676f726974686d737371007e00170000000877040000000874000a46414c434f4e2d35313274000b46414c434f4e2d313032347400084b594245523531327400084b594245523736387400094b594245523130323474000a44494c49544849554d3274000a44494c49544849554d3374000a44494c49544849554d357874001d616c7465726e61746976655369676e6174757265416c676f726974686d7074000b7573656b6579757361676571007e00237400086b657975736167657371007e00170000000977040000000971007e002371007e001071007e001071007e001071007e001071007e001071007e001071007e001071007e001078740015616c6c6f776b657975736167656f7665727269646571007e00107400106b65797573616765637269746963616c71007e0023740013757365657874656e6465646b6579757361676571007e0023740010657874656e6465646b657975736167657371007e001700000001770400000001740011312e332e362e312e352e352e372e332e3178740018657874656e6465646b65797573616765637269746963616c71007e0010740013757365646f63756d656e74747970656c69737471007e0010740018646f63756d656e74747970656c697374637269746963616c71007e0019740010646f63756d656e74747970656c6973747371007e0017000000007704000000007874000c617661696c61626c656361737371007e0017000000017704000000017371007e0008ffffffff7874000e757365647075626c6973686572737371007e0017000000007704000000007874000e7573656f6373706e6f636865636b71007e001074000e7573656c646170646e6f7264657271007e0010740010757365637573746f6d646e6f7264657271007e00107400147573656d6963726f736f667474656d706c61746571007e00107400116d6963726f736f667474656d706c6174657400007400177573656d736f626a656374736964657874656e73696f6e71007e001074000d757365636172646e756d62657271007e001074000c757365636e706f737466697871007e0010740009636e706f737466697871007e00a17400127573657375626a656374646e73756273657471007e001074000f7375626a656374646e7375627365747371007e001700000000770400000000787400177573657375626a656374616c746e616d6573756273657471007e00107400147375626a656374616c746e616d657375627365747371007e00170000000077040000000078740017757365706174686c656e677468636f6e73747261696e7471007e0019740014706174686c656e677468636f6e73747261696e7471007e004574000e757365716373746174656d656e7471007e0010740011757365706b6978716373796e746178763271007e0019740016757365716373746174656d656e74637269746963616c71007e0019740014757365716373746174656d656e7472616e616d6571007e00a174000f757365716373656d6174696373696471007e00a17400157573657163657473697163636f6d706c69616e636571007e00197400187573657163657473697369676e617475726564657669636571007e001974001375736571636574736976616c75656c696d697471007e001974001071636574736976616c75656c696d697471007e004574001371636574736976616c75656c696d697465787071007e004574001871636574736976616c75656c696d697463757272656e637971007e00a1740018757365716365747369726574656e74696f6e706572696f6471007e0019740015716365747369726574656e74696f6e706572696f6471007e004574000e7573657163636f756e747269657371007e00197400107163636f756e74726965737472696e6771007e00a17400117573657163637573746f6d737472696e6771007e00197400117163637573746f6d737472696e676f696471007e00a17400127163637573746f6d737472696e677465787471007e00a17400097163657473697064737074000a716365747369747970657074001b75736576616c69646974796173737572656473686f72747465726d71007e001074002076616c69646974796173737572656473686f72747465726d637269746963616c71007e001974002175736563657274696669636174657472616e73706172656e6379696e636572747371007e001974002075736563657274696669636174657472616e73706172656e6379696e6f63737071007e001974002575736563657274696669636174657472616e73706172656e6379696e7075626c697368657271007e00197400177573657375626a6563746469726174747269627574657371007e00107400127573656e616d65636f6e73747261696e747371007e001074001d757365617574686f72697479696e666f726d6174696f6e61636365737371007e00237400096361697373756572737371007e0017000000007704000000007874001275736564656661756c74636169737375657271007e002374001c75736564656661756c746f637370736572766963656c6f6361746f7271007e00237400156f637370736572766963656c6f6361746f7275726974000074000f6376636163636573737269676874737371007e000800000003740019757365646365727469666963617465657874656e73696f6e737371007e00170000000077040000000078740009617070726f76616c737371007e00003f40000000000006770800000008000000037e7200306f72672e63657365636f72652e6365727469666963617465732e63612e417070726f76616c526571756573745479706500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001041444445444954454e44454e5449545971007e00997e71007e00d674000a5245564f434154494f4e71007e00997e71007e00d674000a4b45595245434f56455271007e0099780074001e757365707269766b65797573616765706572696f646e6f746265666f726571007e0010740015757365707269766b65797573616765706572696f6471007e001074001d757365707269766b65797573616765706572696f646e6f74616674657271007e001074001d707269766b65797573616765706572696f6473746172746f66667365747372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c75657871007e00050000000000000000740018707269766b65797573616765706572696f646c656e6774687371007e00e20000000003c2670074002475736573696e676c656163746976656365727469666963617465636f6e73747261696e7471007e00107400186f76657272696461626c65657874656e73696f6e6f696473737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000013f400000000000007874001b6e6f6e6f76657272696461626c65657874656e73696f6e6f6964737371007e00e8770c000000013f400000000000007874000d6561626e616d657370616365737371007e00e8770c000000103f4000000000000078740013616c6c6f7763657274736e6f7665727269646571007e00107400207573657472756e63617465647375626a6563746b65796964656e74696669657271007e00107400236b65797573616765666f72626964656e6379727074696f6e7573616765666f7265636371007e001074001d757365636162666f7267616e697a6174696f6e6964656e74696669657271007e0010740014757365637573746f6d646e6f726465726c64617071007e00107800	\N	2
1542919907	pkiAdminEc-3y	\\xaced0005737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000c07708000001000000007d74000776657273696f6e7372000f6a6176612e6c616e672e466c6f6174daedc9a2db3cf0ec02000146000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078704250000074000474797065737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e00050000000174000b6365727476657273696f6e74000658353039763374000f656e636f64656476616c6964697479740002337974001c757365636572746966696361746576616c69646974796f6666736574737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c7565787000740019636572746966696361746576616c69646974796f66667365747400042d31306d74002375736565787069726174696f6e7265737472696374696f6e666f727765656b6461797371007e001074002665787069726174696f6e7265737472696374696f6e666f727765656b646179736265666f72657371007e000f0174001d65787069726174696f6e7265737472696374696f6e7765656b64617973737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000777040000000771007e001571007e00157371007e000f0071007e001971007e001971007e001571007e001578740015616c6c6f7776616c69646974796f7665727269646571007e001074001b616c6c6f776578706972656476616c6964697479656e646461746571007e001074000b6465736372697074696f6e740000740016616c6c6f77657874656e73696f6e6f7665727269646571007e001074000f616c6c6f77646e6f7665727269646571007e0010740014616c6c6f77646e6f76657272696465627965656971007e0010740018616c6c6f776261636b64617465647265766f6b6174696f6e71007e0010740015757365636572746966696361746573746f726167657371007e000f0174001473746f726563657274696669636174656461746171007e002374001373746f72657375626a656374616c746e616d6571007e00237400127573656261736963636f6e737472616e747371007e00107400186261736963636f6e73747261696e7473637269746963616c7371007e000f017400177573657375626a6563746b65796964656e74696669657271007e002374001c7375626a6563746b65796964656e746966696572637269746963616c71007e0019740019757365617574686f726974796b65796964656e74696669657271007e002374001e617574686f726974796b65796964656e746966696572637269746963616c71007e00197400197573657375626a656374616c7465726e61746976656e616d6571007e002374001e7375626a656374616c7465726e61746976656e616d65637269746963616c71007e0010740018757365697373756572616c7465726e61746976656e616d6571007e001074001d697373756572616c7465726e61746976656e616d65637269746963616c7371007e000f0074001775736563726c646973747269627574696f6e706f696e7471007e002374001e75736564656661756c7463726c646973747269627574696f6e706f696e7471007e002374001c63726c646973747269627574696f6e706f696e74637269746963616c71007e001074001763726c646973747269627574696f6e706f696e7475726974000074000e757365667265736865737463726c71007e00107400177573656361646566696e6564667265736865737463726c71007e001974000e667265736865737463726c75726971007e003674000963726c69737375657271007e00367400167573656365727469666963617465706f6c696369657371007e001074001b6365727469666963617465706f6c6963696573637269746963616c71007e00197400136365727469666963617465706f6c69636965737371007e00170000000077040000000078740016617661696c61626c656b6579616c676f726974686d737371007e001700000001770400000001740005454344534178740011617661696c61626c6565636375727665737371007e001700000001770400000001740005502d32353678740013617661696c61626c656269746c656e677468737371007e0017000000337704000000337371007e0008000000007371007e00080000006e7371007e0008000000707371007e0008000000717371007e00080000007e7371007e0008000000807371007e0008000000837371007e0008000000a07371007e0008000000a17371007e0008000000a27371007e0008000000a37371007e0008000000a77371007e0008000000ad7371007e0008000000b37371007e0008000000bd7371007e0008000000be7371007e0008000000bf7371007e0008000000c07371007e0008000000c17371007e0008000000e07371007e0008000000e17371007e0008000000e87371007e0008000000e97371007e0008000000ec7371007e0008000000ed7371007e0008000000ee7371007e0008000000ef7371007e0008000001007371007e0008000001017371007e0008000001197371007e00080000011a7371007e0008000001217371007e0008000001337371007e0008000001407371007e0008000001617371007e00080000016f7371007e0008000001807371007e0008000001977371007e0008000001997371007e0008000001a27371007e0008000001af7371007e0008000002007371007e0008000002097371007e00080000023a7371007e0008000004007371007e0008000006007371007e0008000008007371007e000800000c007371007e0008000010007371007e0008000018007371007e000800002000787400196d696e696d756d617661696c61626c656269746c656e67746871007e00477400196d6178696d756d617661696c61626c656269746c656e6774687371007e0008000020007400127369676e6174757265616c676f726974686d74000f534841323536776974684543445341740017757365416c7465726e61746976655369676e617475726571007e0019740021616c7465726e6174697665417661696c61626c654b6579416c676f726974686d737371007e00170000000877040000000874000a46414c434f4e2d35313274000b46414c434f4e2d313032347400084b594245523531327400084b594245523736387400094b594245523130323474000a44494c49544849554d3274000a44494c49544849554d3374000a44494c49544849554d357874001d616c7465726e61746976655369676e6174757265416c676f726974686d7074000b7573656b6579757361676571007e00237400086b657975736167657371007e00170000000977040000000971007e002371007e001071007e001071007e001071007e001071007e001071007e001071007e001071007e001078740015616c6c6f776b657975736167656f7665727269646571007e00107400106b65797573616765637269746963616c71007e0023740013757365657874656e6465646b6579757361676571007e0023740010657874656e6465646b657975736167657371007e001700000001770400000001740011312e332e362e312e352e352e372e332e3278740018657874656e6465646b65797573616765637269746963616c71007e0010740013757365646f63756d656e74747970656c69737471007e0010740018646f63756d656e74747970656c697374637269746963616c71007e0019740010646f63756d656e74747970656c6973747371007e0017000000007704000000007874000c617661696c61626c656361737371007e0017000000017704000000017371007e0008ffffffff7874000e757365647075626c6973686572737371007e0017000000007704000000007874000e7573656f6373706e6f636865636b71007e001074000e7573656c646170646e6f7264657271007e0010740010757365637573746f6d646e6f7264657271007e00107400147573656d6963726f736f667474656d706c61746571007e00107400116d6963726f736f667474656d706c6174657400007400177573656d736f626a656374736964657874656e73696f6e71007e001074000d757365636172646e756d62657271007e001074000c757365636e706f737466697871007e0010740009636e706f737466697871007e00a37400127573657375626a656374646e73756273657471007e001074000f7375626a656374646e7375627365747371007e001700000000770400000000787400177573657375626a656374616c746e616d6573756273657471007e00107400147375626a656374616c746e616d657375627365747371007e00170000000077040000000078740017757365706174686c656e677468636f6e73747261696e7471007e0019740014706174686c656e677468636f6e73747261696e7471007e004774000e757365716373746174656d656e7471007e0010740011757365706b6978716373796e746178763271007e0019740016757365716373746174656d656e74637269746963616c71007e0019740014757365716373746174656d656e7472616e616d6571007e00a374000f757365716373656d6174696373696471007e00a37400157573657163657473697163636f6d706c69616e636571007e00197400187573657163657473697369676e617475726564657669636571007e001974001375736571636574736976616c75656c696d697471007e001974001071636574736976616c75656c696d697471007e004774001371636574736976616c75656c696d697465787071007e004774001871636574736976616c75656c696d697463757272656e637971007e00a3740018757365716365747369726574656e74696f6e706572696f6471007e0019740015716365747369726574656e74696f6e706572696f6471007e004774000e7573657163636f756e747269657371007e00197400107163636f756e74726965737472696e6771007e00a37400117573657163637573746f6d737472696e6771007e00197400117163637573746f6d737472696e676f696471007e00a37400127163637573746f6d737472696e677465787471007e00a37400097163657473697064737074000a716365747369747970657074001b75736576616c69646974796173737572656473686f72747465726d71007e001074002076616c69646974796173737572656473686f72747465726d637269746963616c71007e001974002175736563657274696669636174657472616e73706172656e6379696e636572747371007e001974002075736563657274696669636174657472616e73706172656e6379696e6f63737071007e001974002575736563657274696669636174657472616e73706172656e6379696e7075626c697368657271007e00197400177573657375626a6563746469726174747269627574657371007e00107400127573656e616d65636f6e73747261696e747371007e001074001d757365617574686f72697479696e666f726d6174696f6e61636365737371007e00237400096361697373756572737371007e0017000000007704000000007874001275736564656661756c74636169737375657271007e002374001c75736564656661756c746f637370736572766963656c6f6361746f7271007e00237400156f637370736572766963656c6f6361746f7275726974000074000f6376636163636573737269676874737371007e000800000003740019757365646365727469666963617465657874656e73696f6e737371007e00170000000077040000000078740009617070726f76616c737371007e00003f40000000000006770800000008000000037e7200306f72672e63657365636f72652e6365727469666963617465732e63612e417070726f76616c526571756573745479706500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001041444445444954454e44454e5449545971007e009b7e71007e00d874000a5245564f434154494f4e71007e009b7e71007e00d874000a4b45595245434f56455271007e009b780074001e757365707269766b65797573616765706572696f646e6f746265666f726571007e0010740015757365707269766b65797573616765706572696f6471007e001074001d757365707269766b65797573616765706572696f646e6f74616674657271007e001074001d707269766b65797573616765706572696f6473746172746f66667365747372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c75657871007e00050000000000000000740018707269766b65797573616765706572696f646c656e6774687371007e00e40000000003c2670074002475736573696e676c656163746976656365727469666963617465636f6e73747261696e7471007e00107400186f76657272696461626c65657874656e73696f6e6f696473737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000013f400000000000007874001b6e6f6e6f76657272696461626c65657874656e73696f6e6f6964737371007e00ea770c000000013f400000000000007874000d6561626e616d657370616365737371007e00ea770c000000103f4000000000000078740013616c6c6f7763657274736e6f7665727269646571007e00107400207573657472756e63617465647375626a6563746b65796964656e74696669657271007e00107400236b65797573616765666f72626964656e6379727074696f6e7573616765666f7265636371007e001074001d757365636162666f7267616e697a6174696f6e6964656e74696669657271007e0010740014757365637573746f6d646e6f726465726c64617071007e00107800	\N	2
499639567	plainSigner-3mo	\\xaced0005737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000c07708000001000000007d74000776657273696f6e7372000f6a6176612e6c616e672e466c6f6174daedc9a2db3cf0ec02000146000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078704250000074000474797065737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e00050000000174000b6365727476657273696f6e74000658353039763374000f656e636f64656476616c6964697479740003336d6f74001c757365636572746966696361746576616c69646974796f6666736574737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c7565787000740019636572746966696361746576616c69646974796f66667365747400042d31306d74002375736565787069726174696f6e7265737472696374696f6e666f727765656b6461797371007e001074002665787069726174696f6e7265737472696374696f6e666f727765656b646179736265666f72657371007e000f0174001d65787069726174696f6e7265737472696374696f6e7765656b64617973737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000777040000000771007e001571007e00157371007e000f0071007e001971007e001971007e001571007e001578740015616c6c6f7776616c69646974796f7665727269646571007e001074001b616c6c6f776578706972656476616c6964697479656e646461746571007e001074000b6465736372697074696f6e740000740016616c6c6f77657874656e73696f6e6f7665727269646571007e001074000f616c6c6f77646e6f7665727269646571007e0010740014616c6c6f77646e6f76657272696465627965656971007e0010740018616c6c6f776261636b64617465647265766f6b6174696f6e71007e0010740015757365636572746966696361746573746f726167657371007e000f0174001473746f726563657274696669636174656461746171007e002374001373746f72657375626a656374616c746e616d6571007e00237400127573656261736963636f6e737472616e747371007e00107400186261736963636f6e73747261696e7473637269746963616c7371007e000f017400177573657375626a6563746b65796964656e74696669657271007e002374001c7375626a6563746b65796964656e746966696572637269746963616c71007e0019740019757365617574686f726974796b65796964656e74696669657271007e002374001e617574686f726974796b65796964656e746966696572637269746963616c71007e00197400197573657375626a656374616c7465726e61746976656e616d6571007e002374001e7375626a656374616c7465726e61746976656e616d65637269746963616c71007e0010740018757365697373756572616c7465726e61746976656e616d6571007e001074001d697373756572616c7465726e61746976656e616d65637269746963616c7371007e000f0074001775736563726c646973747269627574696f6e706f696e7471007e002374001e75736564656661756c7463726c646973747269627574696f6e706f696e7471007e002374001c63726c646973747269627574696f6e706f696e74637269746963616c71007e001074001763726c646973747269627574696f6e706f696e7475726974000074000e757365667265736865737463726c71007e00107400177573656361646566696e6564667265736865737463726c71007e001974000e667265736865737463726c75726971007e003674000963726c69737375657271007e00367400167573656365727469666963617465706f6c696369657371007e001074001b6365727469666963617465706f6c6963696573637269746963616c71007e00197400136365727469666963617465706f6c69636965737371007e00170000000077040000000078740016617661696c61626c656b6579616c676f726974686d737371007e001700000001770400000001740005454344534178740011617661696c61626c6565636375727665737371007e001700000001770400000001740005502d32353678740013617661696c61626c656269746c656e677468737371007e0017000000337704000000337371007e0008000000007371007e00080000006e7371007e0008000000707371007e0008000000717371007e00080000007e7371007e0008000000807371007e0008000000837371007e0008000000a07371007e0008000000a17371007e0008000000a27371007e0008000000a37371007e0008000000a77371007e0008000000ad7371007e0008000000b37371007e0008000000bd7371007e0008000000be7371007e0008000000bf7371007e0008000000c07371007e0008000000c17371007e0008000000e07371007e0008000000e17371007e0008000000e87371007e0008000000e97371007e0008000000ec7371007e0008000000ed7371007e0008000000ee7371007e0008000000ef7371007e0008000001007371007e0008000001017371007e0008000001197371007e00080000011a7371007e0008000001217371007e0008000001337371007e0008000001407371007e0008000001617371007e00080000016f7371007e0008000001807371007e0008000001977371007e0008000001997371007e0008000001a27371007e0008000001af7371007e0008000002007371007e0008000002097371007e00080000023a7371007e0008000004007371007e0008000006007371007e0008000008007371007e000800000c007371007e0008000010007371007e0008000018007371007e000800002000787400196d696e696d756d617661696c61626c656269746c656e67746871007e00477400196d6178696d756d617661696c61626c656269746c656e6774687371007e0008000020007400127369676e6174757265616c676f726974686d74000f534841323536776974684543445341740017757365416c7465726e61746976655369676e617475726571007e0019740021616c7465726e6174697665417661696c61626c654b6579416c676f726974686d737371007e00170000000877040000000874000a46414c434f4e2d35313274000b46414c434f4e2d313032347400084b594245523531327400084b594245523736387400094b594245523130323474000a44494c49544849554d3274000a44494c49544849554d3374000a44494c49544849554d357874001d616c7465726e61746976655369676e6174757265416c676f726974686d7074000b7573656b6579757361676571007e00237400086b657975736167657371007e00170000000977040000000971007e002371007e002371007e001071007e001071007e001071007e001071007e001071007e001071007e001078740015616c6c6f776b657975736167656f7665727269646571007e00107400106b65797573616765637269746963616c71007e0023740013757365657874656e6465646b6579757361676571007e0023740010657874656e6465646b657975736167657371007e001700000001770400000001740011312e332e362e312e352e352e372e332e3378740018657874656e6465646b65797573616765637269746963616c71007e0010740013757365646f63756d656e74747970656c69737471007e0010740018646f63756d656e74747970656c697374637269746963616c71007e0019740010646f63756d656e74747970656c6973747371007e0017000000007704000000007874000c617661696c61626c656361737371007e0017000000017704000000017371007e0008ffffffff7874000e757365647075626c6973686572737371007e0017000000007704000000007874000e7573656f6373706e6f636865636b71007e001074000e7573656c646170646e6f7264657271007e0010740010757365637573746f6d646e6f7264657271007e00107400147573656d6963726f736f667474656d706c61746571007e00107400116d6963726f736f667474656d706c6174657400007400177573656d736f626a656374736964657874656e73696f6e71007e001074000d757365636172646e756d62657271007e001074000c757365636e706f737466697871007e0010740009636e706f737466697871007e00a37400127573657375626a656374646e73756273657471007e001074000f7375626a656374646e7375627365747371007e001700000000770400000000787400177573657375626a656374616c746e616d6573756273657471007e00107400147375626a656374616c746e616d657375627365747371007e00170000000077040000000078740017757365706174686c656e677468636f6e73747261696e7471007e0019740014706174686c656e677468636f6e73747261696e7471007e004774000e757365716373746174656d656e7471007e0010740011757365706b6978716373796e746178763271007e0019740016757365716373746174656d656e74637269746963616c71007e0019740014757365716373746174656d656e7472616e616d6571007e00a374000f757365716373656d6174696373696471007e00a37400157573657163657473697163636f6d706c69616e636571007e00197400187573657163657473697369676e617475726564657669636571007e001974001375736571636574736976616c75656c696d697471007e001974001071636574736976616c75656c696d697471007e004774001371636574736976616c75656c696d697465787071007e004774001871636574736976616c75656c696d697463757272656e637971007e00a3740018757365716365747369726574656e74696f6e706572696f6471007e0019740015716365747369726574656e74696f6e706572696f6471007e004774000e7573657163636f756e747269657371007e00197400107163636f756e74726965737472696e6771007e00a37400117573657163637573746f6d737472696e6771007e00197400117163637573746f6d737472696e676f696471007e00a37400127163637573746f6d737472696e677465787471007e00a37400097163657473697064737074000a716365747369747970657074001b75736576616c69646974796173737572656473686f72747465726d71007e001074002076616c69646974796173737572656473686f72747465726d637269746963616c71007e001974002175736563657274696669636174657472616e73706172656e6379696e636572747371007e001974002075736563657274696669636174657472616e73706172656e6379696e6f63737071007e001974002575736563657274696669636174657472616e73706172656e6379696e7075626c697368657271007e00197400177573657375626a6563746469726174747269627574657371007e00107400127573656e616d65636f6e73747261696e747371007e001074001d757365617574686f72697479696e666f726d6174696f6e61636365737371007e00237400096361697373756572737371007e0017000000007704000000007874001275736564656661756c74636169737375657271007e002374001c75736564656661756c746f637370736572766963656c6f6361746f7271007e00237400156f637370736572766963656c6f6361746f7275726974000074000f6376636163636573737269676874737371007e000800000003740019757365646365727469666963617465657874656e73696f6e737371007e00170000000077040000000078740009617070726f76616c737371007e00003f40000000000006770800000008000000037e7200306f72672e63657365636f72652e6365727469666963617465732e63612e417070726f76616c526571756573745479706500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074000a4b45595245434f56455271007e009b7e71007e00d874001041444445444954454e44454e5449545971007e009b7e71007e00d874000a5245564f434154494f4e71007e009b780074001e757365707269766b65797573616765706572696f646e6f746265666f726571007e0010740015757365707269766b65797573616765706572696f6471007e001074001d757365707269766b65797573616765706572696f646e6f74616674657271007e001074001d707269766b65797573616765706572696f6473746172746f66667365747372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c75657871007e00050000000000000000740018707269766b65797573616765706572696f646c656e6774687371007e00e40000000003c2670074002475736573696e676c656163746976656365727469666963617465636f6e73747261696e7471007e00107400186f76657272696461626c65657874656e73696f6e6f696473737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000013f400000000000007874001b6e6f6e6f76657272696461626c65657874656e73696f6e6f6964737371007e00ea770c000000013f400000000000007874000d6561626e616d657370616365737371007e00ea770c000000103f4000000000000078740013616c6c6f7763657274736e6f7665727269646571007e00107400207573657472756e63617465647375626a6563746b65796964656e74696669657271007e00107400236b65797573616765666f72626964656e6379727074696f6e7573616765666f7265636371007e001074001d757365636162666f7267616e697a6174696f6e6964656e74696669657271007e0010740014757365637573746f6d646e6f726465726c64617071007e00107800	\N	2
2025547880	tsaSigner-1y	\\xaced0005737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000c07708000001000000007d74000776657273696f6e7372000f6a6176612e6c616e672e466c6f6174daedc9a2db3cf0ec02000146000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078704250000074000474797065737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e00050000000174000b6365727476657273696f6e74000658353039763374000f656e636f64656476616c6964697479740002317974001c757365636572746966696361746576616c69646974796f6666736574737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c7565787000740019636572746966696361746576616c69646974796f66667365747400042d31306d74002375736565787069726174696f6e7265737472696374696f6e666f727765656b6461797371007e001074002665787069726174696f6e7265737472696374696f6e666f727765656b646179736265666f72657371007e000f0174001d65787069726174696f6e7265737472696374696f6e7765656b64617973737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000777040000000771007e001571007e00157371007e000f0071007e001971007e001971007e001571007e001578740015616c6c6f7776616c69646974796f7665727269646571007e001074001b616c6c6f776578706972656476616c6964697479656e646461746571007e001074000b6465736372697074696f6e740000740016616c6c6f77657874656e73696f6e6f7665727269646571007e001074000f616c6c6f77646e6f7665727269646571007e0010740014616c6c6f77646e6f76657272696465627965656971007e0010740018616c6c6f776261636b64617465647265766f6b6174696f6e71007e0010740015757365636572746966696361746573746f726167657371007e000f0174001473746f726563657274696669636174656461746171007e002374001373746f72657375626a656374616c746e616d6571007e00237400127573656261736963636f6e737472616e747371007e00107400186261736963636f6e73747261696e7473637269746963616c7371007e000f017400177573657375626a6563746b65796964656e74696669657271007e002374001c7375626a6563746b65796964656e746966696572637269746963616c71007e0019740019757365617574686f726974796b65796964656e74696669657271007e002374001e617574686f726974796b65796964656e746966696572637269746963616c71007e00197400197573657375626a656374616c7465726e61746976656e616d6571007e002374001e7375626a656374616c7465726e61746976656e616d65637269746963616c71007e0010740018757365697373756572616c7465726e61746976656e616d6571007e001074001d697373756572616c7465726e61746976656e616d65637269746963616c7371007e000f0074001775736563726c646973747269627574696f6e706f696e7471007e002374001e75736564656661756c7463726c646973747269627574696f6e706f696e7471007e002374001c63726c646973747269627574696f6e706f696e74637269746963616c71007e001074001763726c646973747269627574696f6e706f696e7475726974000074000e757365667265736865737463726c71007e00107400177573656361646566696e6564667265736865737463726c71007e001974000e667265736865737463726c75726971007e003674000963726c69737375657271007e00367400167573656365727469666963617465706f6c696369657371007e001074001b6365727469666963617465706f6c6963696573637269746963616c71007e00197400136365727469666963617465706f6c69636965737371007e00170000000077040000000078740016617661696c61626c656b6579616c676f726974686d737371007e001700000001770400000001740005454344534178740011617661696c61626c6565636375727665737371007e001700000001770400000001740005502d32353678740013617661696c61626c656269746c656e677468737371007e0017000000337704000000337371007e0008000000007371007e00080000006e7371007e0008000000707371007e0008000000717371007e00080000007e7371007e0008000000807371007e0008000000837371007e0008000000a07371007e0008000000a17371007e0008000000a27371007e0008000000a37371007e0008000000a77371007e0008000000ad7371007e0008000000b37371007e0008000000bd7371007e0008000000be7371007e0008000000bf7371007e0008000000c07371007e0008000000c17371007e0008000000e07371007e0008000000e17371007e0008000000e87371007e0008000000e97371007e0008000000ec7371007e0008000000ed7371007e0008000000ee7371007e0008000000ef7371007e0008000001007371007e0008000001017371007e0008000001197371007e00080000011a7371007e0008000001217371007e0008000001337371007e0008000001407371007e0008000001617371007e00080000016f7371007e0008000001807371007e0008000001977371007e0008000001997371007e0008000001a27371007e0008000001af7371007e0008000002007371007e0008000002097371007e00080000023a7371007e0008000004007371007e0008000006007371007e0008000008007371007e000800000c007371007e0008000010007371007e0008000018007371007e000800002000787400196d696e696d756d617661696c61626c656269746c656e67746871007e00477400196d6178696d756d617661696c61626c656269746c656e6774687371007e0008000020007400127369676e6174757265616c676f726974686d74000f534841323536776974684543445341740017757365416c7465726e61746976655369676e617475726571007e0019740021616c7465726e6174697665417661696c61626c654b6579416c676f726974686d737371007e00170000000877040000000874000a46414c434f4e2d35313274000b46414c434f4e2d313032347400084b594245523531327400084b594245523736387400094b594245523130323474000a44494c49544849554d3274000a44494c49544849554d3374000a44494c49544849554d357874001d616c7465726e61746976655369676e6174757265416c676f726974686d7074000b7573656b6579757361676571007e00237400086b657975736167657371007e00170000000977040000000971007e002371007e002371007e001071007e001071007e001071007e001071007e001071007e001071007e001078740015616c6c6f776b657975736167656f7665727269646571007e00107400106b65797573616765637269746963616c71007e0023740013757365657874656e6465646b6579757361676571007e0023740010657874656e6465646b657975736167657371007e001700000001770400000001740011312e332e362e312e352e352e372e332e3878740018657874656e6465646b65797573616765637269746963616c71007e0023740013757365646f63756d656e74747970656c69737471007e0010740018646f63756d656e74747970656c697374637269746963616c71007e0019740010646f63756d656e74747970656c6973747371007e0017000000007704000000007874000c617661696c61626c656361737371007e0017000000017704000000017371007e0008ffffffff7874000e757365647075626c6973686572737371007e0017000000007704000000007874000e7573656f6373706e6f636865636b71007e001074000e7573656c646170646e6f7264657271007e0010740010757365637573746f6d646e6f7264657271007e00107400147573656d6963726f736f667474656d706c61746571007e00107400116d6963726f736f667474656d706c6174657400007400177573656d736f626a656374736964657874656e73696f6e71007e001074000d757365636172646e756d62657271007e001074000c757365636e706f737466697871007e0010740009636e706f737466697871007e00a37400127573657375626a656374646e73756273657471007e001074000f7375626a656374646e7375627365747371007e001700000000770400000000787400177573657375626a656374616c746e616d6573756273657471007e00107400147375626a656374616c746e616d657375627365747371007e00170000000077040000000078740017757365706174686c656e677468636f6e73747261696e7471007e0019740014706174686c656e677468636f6e73747261696e7471007e004774000e757365716373746174656d656e7471007e0010740011757365706b6978716373796e746178763271007e0019740016757365716373746174656d656e74637269746963616c71007e0019740014757365716373746174656d656e7472616e616d6571007e00a374000f757365716373656d6174696373696471007e00a37400157573657163657473697163636f6d706c69616e636571007e00197400187573657163657473697369676e617475726564657669636571007e001974001375736571636574736976616c75656c696d697471007e001974001071636574736976616c75656c696d697471007e004774001371636574736976616c75656c696d697465787071007e004774001871636574736976616c75656c696d697463757272656e637971007e00a3740018757365716365747369726574656e74696f6e706572696f6471007e0019740015716365747369726574656e74696f6e706572696f6471007e004774000e7573657163636f756e747269657371007e00197400107163636f756e74726965737472696e6771007e00a37400117573657163637573746f6d737472696e6771007e00197400117163637573746f6d737472696e676f696471007e00a37400127163637573746f6d737472696e677465787471007e00a37400097163657473697064737074000a716365747369747970657074001b75736576616c69646974796173737572656473686f72747465726d71007e001074002076616c69646974796173737572656473686f72747465726d637269746963616c71007e001974002175736563657274696669636174657472616e73706172656e6379696e636572747371007e001974002075736563657274696669636174657472616e73706172656e6379696e6f63737071007e001974002575736563657274696669636174657472616e73706172656e6379696e7075626c697368657271007e00197400177573657375626a6563746469726174747269627574657371007e00107400127573656e616d65636f6e73747261696e747371007e001074001d757365617574686f72697479696e666f726d6174696f6e61636365737371007e00237400096361697373756572737371007e0017000000007704000000007874001275736564656661756c74636169737375657271007e002374001c75736564656661756c746f637370736572766963656c6f6361746f7271007e00237400156f637370736572766963656c6f6361746f7275726974000074000f6376636163636573737269676874737371007e000800000003740019757365646365727469666963617465657874656e73696f6e737371007e00170000000077040000000078740009617070726f76616c737371007e00003f40000000000006770800000008000000037e7200306f72672e63657365636f72652e6365727469666963617465732e63612e417070726f76616c526571756573745479706500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074000a4b45595245434f56455271007e009b7e71007e00d874001041444445444954454e44454e5449545971007e009b7e71007e00d874000a5245564f434154494f4e71007e009b780074001e757365707269766b65797573616765706572696f646e6f746265666f726571007e0010740015757365707269766b65797573616765706572696f6471007e001074001d757365707269766b65797573616765706572696f646e6f74616674657271007e001074001d707269766b65797573616765706572696f6473746172746f66667365747372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c75657871007e00050000000000000000740018707269766b65797573616765706572696f646c656e6774687371007e00e40000000003c2670074002475736573696e676c656163746976656365727469666963617465636f6e73747261696e7471007e00107400186f76657272696461626c65657874656e73696f6e6f696473737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000013f400000000000007874001b6e6f6e6f76657272696461626c65657874656e73696f6e6f6964737371007e00ea770c000000013f400000000000007874000d6561626e616d657370616365737371007e00ea770c000000103f4000000000000078740013616c6c6f7763657274736e6f7665727269646571007e00107400207573657472756e63617465647375626a6563746b65796964656e74696669657271007e00107400236b65797573616765666f72626964656e6379727074696f6e7573616765666f7265636371007e001074001d757365636162666f7267616e697a6174696f6e6964656e74696669657271007e0010740014757365637573746f6d646e6f726465726c64617071007e00107800	\N	3
\.


--
-- Data for Name: certreqhistorydata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.certreqhistorydata (fingerprint, issuerdn, rowprotection, rowversion, serialnumber, "timestamp", userdatavo, username) FROM stdin;
\.


--
-- Data for Name: crldata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.crldata (fingerprint, base64crl, cafingerprint, crlpartitionindex, crlnumber, deltacrlindicator, issuerdn, nextupdate, rowprotection, rowversion, thisupdate) FROM stdin;
308328beae8a9bb5ed0b1c08c52c31e6bb5f43f0	MIIBazCBzQIBATAKBggqhkjOPQQDBDBtMQswCQYDVQQGEwJTRTESMBAGA1UECgwJ\nS2V5ZmFjdG9yMSEwHwYDVQQLDBhDZXJ0aWZpY2F0aW9uIEF1dGhvcml0ZXMxJzAl\nBgNVBAMMHkNvbW11bml0eSBEYXlzIDIwMjQgUm9vdCBFQyBHMRcNMjQwOTA1MTg1\nODI1WhcNMjUwOTA1MTg1ODI0WqAvMC0wHwYDVR0jBBgwFoAUQlijugcIsd3sij0B\n9ouAPe38TA4wCgYDVR0UBAMCAQEwCgYIKoZIzj0EAwQDgYwAMIGIAkIB+zUe1uY5\nnRltiDrNZhrFHGdjMt/OYR7dkqu0JqTYQWUGLJqEZ7iqJ7NWRnPyZySnII4an+H1\nb7+0Jqnv7spBP2ICQgDolrwforbeBRvJCctZgD8yMcNDX64AB+JdsGH6D6TA4E4C\ncRnmtUduX1S7AL4uH9Rr6MmR6Mp8+XLCQ3TgKRVS+w==	b004102d9934c8335842ec2e792071872a5ddd04	-1	1	-1	CN=Community Days 2024 Root EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1757098704000	\N	0	1725562705000
3b9e70cbabd9a5210483bf934e3421ab62c89e7d	MIIBJTCBzAIBATAKBggqhkjOPQQDAjBsMQswCQYDVQQGEwJTRTESMBAGA1UECgwJ\nS2V5ZmFjdG9yMSEwHwYDVQQLDBhDZXJ0aWZpY2F0aW9uIEF1dGhvcml0ZXMxJjAk\nBgNVBAMMHUNvbW11bml0eSBEYXlzIDIwMjQgU3ViIEVDIEcxFw0yNDA5MDYxNzMz\nNDdaFw0yNDA5MDkxNzMzNDZaoC8wLTAfBgNVHSMEGDAWgBRTR4U18o0wBkj0DwXL\n3jyzkLgjsDAKBgNVHRQEAwIBATAKBggqhkjOPQQDAgNIADBFAiEAhte1EYoY+o7R\nwhfNzuOq2fMQNMesB0ZHZEzGjg/pO5oCIANd5spducTUchVvNWTvfEjnPjr67N/z\n3Q+JMoRcuyCG	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	-1	1	-1	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1725903226000	\N	0	1725644027000
c1124610c003f53a8a5b079c6e99c8770b9ff90d	MIIBfjCCASQCAQEwCgYIKoZIzj0EAwIwbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoM\nCUtleWZhY3RvcjEhMB8GA1UECwwYQ2VydGlmaWNhdGlvbiBBdXRob3JpdGVzMSYw\nJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAyMDI0IFN1YiBFQyBHMRcNMjQwOTE0MTMz\nMTM0WhcNMjQwOTE3MTMzMTMzWqCBhjCBgzAfBgNVHSMEGDAWgBRTR4U18o0wBkj0\nDwXL3jyzkLgjsDBUBggrBgEFBQcBAQRIMEYwRAYIKwYBBQUHMAKGOGh0dHA6Ly9h\naWEuY29tbXVuaXR5MjAyNC5sb2NhbC9haWEvY29tbS1zdWItZWMtY2EtZzEuY3J0\nMAoGA1UdFAQDAgECMAoGCCqGSM49BAMCA0gAMEUCIGftu2h7xgJh7fbfGG3vVDTI\nr1BKKxqIiguEtdCOk8ToAiEA5alTs3WcJLbHjmyWEKpcvqPNYzbPH4hQ+Mvqju8W\n2VA=	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	-1	2	-1	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1726579893000	\N	0	1726320694000
eb623c51a243b237a11fc9a31b62367caa72e812	MIIBfjCCASQCAQEwCgYIKoZIzj0EAwIwbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoM\nCUtleWZhY3RvcjEhMB8GA1UECwwYQ2VydGlmaWNhdGlvbiBBdXRob3JpdGVzMSYw\nJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAyMDI0IFN1YiBFQyBHMRcNMjQwOTE1MTMx\nMjA0WhcNMjQwOTE4MTMxMjAzWqCBhjCBgzAfBgNVHSMEGDAWgBRTR4U18o0wBkj0\nDwXL3jyzkLgjsDBUBggrBgEFBQcBAQRIMEYwRAYIKwYBBQUHMAKGOGh0dHA6Ly9h\naWEuY29tbXVuaXR5MjAyNC5sb2NhbC9haWEvY29tbS1zdWItZWMtY2EtZzEuY3J0\nMAoGA1UdFAQDAgEDMAoGCCqGSM49BAMCA0gAMEUCIHy7mFOwGaR01BV7ZzviC3Ru\nMmGi6GmSLVi//q8tmhNIAiEAymuzdd/OO9yrTQ5v6Yns4ifTj+HFTmtssIILbu46\nxxM=	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	-1	3	-1	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1726665123000	\N	0	1726405924000
039e7b59d93aaf12d0541b0ac2f65a24c14235e6	MIIBfjCCASQCAQEwCgYIKoZIzj0EAwIwbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoM\nCUtleWZhY3RvcjEhMB8GA1UECwwYQ2VydGlmaWNhdGlvbiBBdXRob3JpdGVzMSYw\nJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAyMDI0IFN1YiBFQyBHMRcNMjQwOTE2MTMz\nMTMwWhcNMjQwOTE5MTMzMTI5WqCBhjCBgzAfBgNVHSMEGDAWgBRTR4U18o0wBkj0\nDwXL3jyzkLgjsDBUBggrBgEFBQcBAQRIMEYwRAYIKwYBBQUHMAKGOGh0dHA6Ly9h\naWEuY29tbXVuaXR5MjAyNC5sb2NhbC9haWEvY29tbS1zdWItZWMtY2EtZzEuY3J0\nMAoGA1UdFAQDAgEEMAoGCCqGSM49BAMCA0gAMEUCIQDdH8BNqhjVRvZBSFQ7RgOb\nS6rvKlV+uKo315V4ih97LgIgUgFfCJlfZC9pJq4POYkTNxKTqUs9jb+BXQw7NPSX\nmZA=	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	-1	4	-1	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1726752689000	\N	0	1726493490000
3234ffeeefbc11319b5307e8b7cdbf28abbf67fb	MIIBfjCCASQCAQEwCgYIKoZIzj0EAwIwbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoM\nCUtleWZhY3RvcjEhMB8GA1UECwwYQ2VydGlmaWNhdGlvbiBBdXRob3JpdGVzMSYw\nJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAyMDI0IFN1YiBFQyBHMRcNMjQwOTE3MTMw\nNzUxWhcNMjQwOTIwMTMwNzUwWqCBhjCBgzAfBgNVHSMEGDAWgBRTR4U18o0wBkj0\nDwXL3jyzkLgjsDBUBggrBgEFBQcBAQRIMEYwRAYIKwYBBQUHMAKGOGh0dHA6Ly9h\naWEuY29tbXVuaXR5MjAyNC5sb2NhbC9haWEvY29tbS1zdWItZWMtY2EtZzEuY3J0\nMAoGA1UdFAQDAgEFMAoGCCqGSM49BAMCA0gAMEUCIB+skhVh07T7JtL9W8QBpRhi\n0KJxyu5NZU2ZEEzjYm6CAiEA2MzqvseBvjXvjI03zMIc/DEu+2bq8Wp8x7/V7kat\nq/M=	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	-1	5	-1	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1726837670000	\N	0	1726578471000
900c34927cd9afb93ec0bea28df48902f8756a6b	MIIBfjCCASQCAQEwCgYIKoZIzj0EAwIwbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoM\nCUtleWZhY3RvcjEhMB8GA1UECwwYQ2VydGlmaWNhdGlvbiBBdXRob3JpdGVzMSYw\nJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAyMDI0IFN1YiBFQyBHMRcNMjQwOTE4MTIx\nNTA2WhcNMjQwOTIxMTIxNTA1WqCBhjCBgzAfBgNVHSMEGDAWgBRTR4U18o0wBkj0\nDwXL3jyzkLgjsDBUBggrBgEFBQcBAQRIMEYwRAYIKwYBBQUHMAKGOGh0dHA6Ly9h\naWEuY29tbXVuaXR5MjAyNC5sb2NhbC9haWEvY29tbS1zdWItZWMtY2EtZzEuY3J0\nMAoGA1UdFAQDAgEGMAoGCCqGSM49BAMCA0gAMEUCIHZhI+1Cejt1CfOIwKzELIXh\nL8VJ8BCt8c8Qx/bKAU6eAiEA0CVjldO+fnya6lIzBX9LV321W/F6jZfHy/qxSIX9\npuQ=	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	-1	6	-1	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1726920905000	\N	0	1726661706000
308fa403e8e8ed1c1d5b7dbe48d55ce1c166d20d	MIIBfjCCASQCAQEwCgYIKoZIzj0EAwIwbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoM\nCUtleWZhY3RvcjEhMB8GA1UECwwYQ2VydGlmaWNhdGlvbiBBdXRob3JpdGVzMSYw\nJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAyMDI0IFN1YiBFQyBHMRcNMjQwOTE5MTIw\nMzA1WhcNMjQwOTIyMTIwMzA0WqCBhjCBgzAfBgNVHSMEGDAWgBRTR4U18o0wBkj0\nDwXL3jyzkLgjsDBUBggrBgEFBQcBAQRIMEYwRAYIKwYBBQUHMAKGOGh0dHA6Ly9h\naWEuY29tbXVuaXR5MjAyNC5sb2NhbC9haWEvY29tbS1zdWItZWMtY2EtZzEuY3J0\nMAoGA1UdFAQDAgEHMAoGCCqGSM49BAMCA0gAMEUCIGlAbz53JVoI7/r1K8dVM2BT\nbvtECwZBQ6yYfCas8UHpAiEAgfaM1l77a9xg+88BYxGbUUBmCxM5u6rpvGhLSW6t\n6LM=	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	-1	7	-1	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1727006584000	\N	0	1726747385000
da40820bfb0281d55b927582938de32b49136fb2	MIIBfTCCASQCAQEwCgYIKoZIzj0EAwIwbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoM\nCUtleWZhY3RvcjEhMB8GA1UECwwYQ2VydGlmaWNhdGlvbiBBdXRob3JpdGVzMSYw\nJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAyMDI0IFN1YiBFQyBHMRcNMjQwOTIwMTMx\nNDI3WhcNMjQwOTIzMTMxNDI2WqCBhjCBgzAfBgNVHSMEGDAWgBRTR4U18o0wBkj0\nDwXL3jyzkLgjsDBUBggrBgEFBQcBAQRIMEYwRAYIKwYBBQUHMAKGOGh0dHA6Ly9h\naWEuY29tbXVuaXR5MjAyNC5sb2NhbC9haWEvY29tbS1zdWItZWMtY2EtZzEuY3J0\nMAoGA1UdFAQDAgEIMAoGCCqGSM49BAMCA0cAMEQCIBEl6dmmdMmQiKDoODUJ4nCi\nSpzxRyLl1YwfrzgF9dIwAiBq63l1iroNp7+GmuqFhNhNPenbplAKdGQF2ocI9p5i\nqg==	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	-1	8	-1	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1727097266000	\N	0	1726838067000
c77dfd6e6af5917cf278e4d5b862366b31a7c66d	MIIBfjCCASQCAQEwCgYIKoZIzj0EAwIwbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoM\nCUtleWZhY3RvcjEhMB8GA1UECwwYQ2VydGlmaWNhdGlvbiBBdXRob3JpdGVzMSYw\nJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAyMDI0IFN1YiBFQyBHMRcNMjQwOTIxMTQy\nNTAzWhcNMjQwOTI0MTQyNTAyWqCBhjCBgzAfBgNVHSMEGDAWgBRTR4U18o0wBkj0\nDwXL3jyzkLgjsDBUBggrBgEFBQcBAQRIMEYwRAYIKwYBBQUHMAKGOGh0dHA6Ly9h\naWEuY29tbXVuaXR5MjAyNC5sb2NhbC9haWEvY29tbS1zdWItZWMtY2EtZzEuY3J0\nMAoGA1UdFAQDAgEJMAoGCCqGSM49BAMCA0gAMEUCIEPSbiye+QJSc1BaJBIq4OIu\nJPvgdWEVbQFrME+rqSrnAiEAlw9MWK6jivmOdbrhl8JTluWb+ryVyl8VGjmqdprX\nuKc=	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	-1	9	-1	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1727187902000	\N	0	1726928703000
aa3f1ca2b557902d1a4f54bee410baebe6a81743	MIIBfzCCASQCAQEwCgYIKoZIzj0EAwIwbDELMAkGA1UEBhMCU0UxEjAQBgNVBAoM\nCUtleWZhY3RvcjEhMB8GA1UECwwYQ2VydGlmaWNhdGlvbiBBdXRob3JpdGVzMSYw\nJAYDVQQDDB1Db21tdW5pdHkgRGF5cyAyMDI0IFN1YiBFQyBHMRcNMjQwOTIyMTQz\nNzU5WhcNMjQwOTI1MTQzNzU4WqCBhjCBgzAfBgNVHSMEGDAWgBRTR4U18o0wBkj0\nDwXL3jyzkLgjsDBUBggrBgEFBQcBAQRIMEYwRAYIKwYBBQUHMAKGOGh0dHA6Ly9h\naWEuY29tbXVuaXR5MjAyNC5sb2NhbC9haWEvY29tbS1zdWItZWMtY2EtZzEuY3J0\nMAoGA1UdFAQDAgEKMAoGCCqGSM49BAMCA0kAMEYCIQD2nV6uB8X/EJZqtxhyW6zU\nLkNzd0WebM7tJEIBDTydNQIhAMcT5QJpQwhq9SW+3aOJ4JMuPETEVWbxyWr/1xFn\n54Sg	50f1fffcfb2f55dec59f7a7ad5f9745525102e44	-1	10	-1	CN=Community Days 2024 Sub EC G1,OU=Certification Authorites,O=Keyfactor,C=SE	1727275078000	\N	0	1727015879000
\.


--
-- Data for Name: cryptotokendata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.cryptotokendata (id, lastupdate, rowprotection, rowversion, tokendata, tokenname, tokenprops, tokentype) FROM stdin;
-1080031981	1725562319242	\N	3	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	CommunityRootCA	I1RodSBTZXAgMDUgMTg6NTE6NTkgVVRDIDIwMjQKdG9rZW5OYW1lPUNvbW11bml0eVJvb3RDQQo=	SoftCryptoToken
-1123577625	1725562400629	\N	3	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	CommunitySubCA	I1RodSBTZXAgMDUgMTg6NTM6MjAgVVRDIDIwMjQKcGluPTZiYzg0MWIyNzQ1ZTJjOTVlMDQyYTY4YjQ3NzdiMzRjCnRva2VuTmFtZT1Db21tdW5pdHlTdWJDQQo=	SoftCryptoToken
\.


--
-- Data for Name: endentityprofiledata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.endentityprofiledata (id, data, profilename, rowprotection, rowversion) FROM stdin;
1181467576	\\xaced0005737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000c0770800000100000000a574000776657273696f6e7372000f6a6176612e6c616e672e466c6f6174daedc9a2db3cf0ec02000146000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078704190000074000b4e554d4245524152524159737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000006e77040000006e737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e00050000000171007e000b7371007e000a0000000071007e000c71007e000c71007e000b71007e000c71007e000c71007e000c71007e000c71007e000c7371007e000a0000000171007e000d71007e000c71007e000c71007e000c71007e000d71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000b71007e000c71007e000c71007e000b71007e000b71007e000b71007e000b71007e000b71007e000b71007e000c7371007e000a0000000071007e000b71007e000b71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000b71007e000b71007e000b71007e000b71007e000c71007e000b71007e000c71007e000b71007e000b71007e000b71007e000b71007e000b71007e000b71007e000b7371007e000a0000000071007e000f71007e000f71007e000f71007e000f71007e000f71007e000f71007e000f71007e000f71007e000f787400135355424a454354444e4649454c444f524445527371007e0008000000047704000000047371007e000a0000c3507371007e000a0001adb07371007e000a0001d4c07371007e000a00027100787400185355424a454354414c544e414d454649454c444f524445527371007e000800000000770400000000787400185355424a454354444952415454524649454c444f524445527371007e0008000000007704000000007874000f5353485f4649454c445f4f524445527371007e0008000000007704000000007874000b50524f46494c455459504571007e000b71007e000c7400007371007e000a001e8480737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c75657870017371007e000a000f424071007e00207371007e000a002dc6c07371007e001f017371007e000a004c4b407371007e001f0071007e000b7400007371007e000a001e848171007e00237371007e000a000f424171007e00237371007e000a002dc6c171007e00207371007e000a004c4b4171007e00257371007e000a0000005f7400007371007e000a001e84df71007e00257371007e000a000f429f71007e00207371007e000a002dc71f71007e00207371007e000a004c4b9f71007e00257371007e000a00000060740001387371007e000a001e84e071007e00257371007e000a000f42a071007e00207371007e000a002dc72071007e00207371007e000a004c4ba071007e00257371007e000a000000057400007371007e000a001e848571007e00237371007e000a000f424571007e00207371007e000a002dc6c571007e00237371007e000a004c4b4571007e00257371007e000a0000001a7400007371007e000a001e849a7371007e001f007371007e000a000f425a71007e00237371007e000a002dc6da71007e00237371007e000a004c4b5a71007e00257371007e000a0000001d7400093439393633393536377371007e000a001e849d71007e00207371007e000a000f425d71007e00207371007e000a002dc6dd71007e00207371007e000a004c4b5d71007e00257371007e000a0000001e7400143439393633393536373b323032353534373838307371007e000a001e849e71007e00207371007e000a000f425e71007e00207371007e000a002dc6de71007e00207371007e000a004c4b5e71007e00257371007e000a0000001f740001317371007e000a001e849f71007e00207371007e000a000f425f71007e00207371007e000a002dc6df71007e00207371007e000a004c4b5f71007e00257371007e000a00000020740001317371007e000a001e84a071007e00207371007e000a000f426071007e00207371007e000a002dc6e071007e00207371007e000a004c4b6071007e00257371007e000a0000002171007e002c7371007e000a001e84a171007e00257371007e000a000f426171007e00207371007e000a002dc6e171007e00207371007e000a004c4b6171007e00257371007e000a0000002271007e002c7371007e000a001e84a271007e00207371007e000a000f426271007e00257371007e000a002dc6e271007e00207371007e000a004c4b6271007e00257371007e000a0000002674000a313930303130303836377371007e000a001e84a671007e00207371007e000a000f426671007e00207371007e000a002dc6e671007e00207371007e000a004c4b6671007e00257371007e000a0000002574000a313930303130303836377371007e000a001e84a571007e00207371007e000a000f426571007e00207371007e000a002dc6e571007e00207371007e000a004c4b6571007e00257371007e000a000000627400007371007e000a001e84e271007e00257371007e000a000f42a271007e00407371007e000a002dc72271007e00207371007e000a004c4ba271007e00257371007e000a0000006371007e00737371007e000a001e84e371007e00257371007e000a000f42a371007e00407371007e000a002dc72371007e00207371007e000a004c4ba371007e00257371007e000a0000006171007e002c7371007e000a001e84e171007e00257371007e000a000f42a171007e00407371007e000a002dc72171007e00207371007e000a004c4ba171007e00257371007e000a0000005b71007e002c7371007e000a001e84db71007e00407371007e000a000f429b71007e00407371007e000a002dc71b71007e00207371007e000a004c4b9b71007e00257371007e000a0000005e7400022d317371007e000a001e84de71007e00257371007e000a000f429e71007e00407371007e000a002dc71e71007e00207371007e000a004c4b9e71007e00257371007e000a0000005d7400022d317371007e000a001e84dd71007e00257371007e000a000f429d71007e00407371007e000a002dc71d71007e00207371007e000a004c4b9d71007e00257371007e000a0000005971007e002c7371007e000a001e84d971007e00407371007e000a000f429971007e00407371007e000a002dc71971007e00207371007e000a004c4b9971007e00257371007e000a0000005871007e002c7371007e000a001e84d871007e00407371007e000a000f429871007e00407371007e000a002dc71871007e00207371007e000a004c4b9871007e00257371007e000a0000005771007e002c7371007e000a001e84d771007e00257371007e000a000f429771007e00407371007e000a002dc71771007e00207371007e000a004c4b9771007e00257371007e000a00000056740001377371007e000a001e84d671007e00257371007e000a000f429671007e00407371007e000a002dc71671007e00257371007e000a004c4b9671007e00257371007e000a002dc78971007e00207371007e000a002dc78a71007e00207371007e000a002dc78b71007e00207371007e000a0000000b7400075369676e6572737371007e000a001e848b71007e00237371007e000a000f424b7371007e001f017371007e000a002dc6cb71007e00407371007e000a004c4b4b7371007e001f007371007e000a0000000c7400094b6579666163746f727371007e000a001e848c71007e00237371007e000a000f424c71007e00af7371007e000a002dc6cc71007e00407371007e000a004c4b4c71007e00b27371007e000a0000001074000253457371007e000a001e849071007e00237371007e000a000f425071007e00af7371007e000a002dc6d071007e00407371007e000a004c4b5071007e00b27371007e000a000f429a71007e00237371007e000a0000005a740001307371007e000a000f424271007e00407371007e000a0000000274000566616c73657371007e000a001e848271007e00407371007e000a0000006e74000074001352455645525345464649454c44434845434b5371007e004074000d414c4c4f575f4d45524745444e71007e0040740016414c4c4f575f4d554c54495f56414c55455f52444e5371007e00407371007e000a000f429c71007e0040740010555345455854454e53494f4e4441544171007e004074000f50534432514353544154454d454e5471007e004074000952454441435450494971007e00407371007e000a000f426371007e0040740011555345524e4f54494649434154494f4e537371007e000800000000770400000000787371007e000a000f425c71007e00407371007e000a001e849c71007e00407371007e000a0000001c71007e00c47371007e000a001e84a371007e00407371007e000a0000002371007e00c47800	signers	\N	1
890019301	\\xaced0005737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000c0770800000100000000aa74000776657273696f6e7372000f6a6176612e6c616e672e466c6f6174daedc9a2db3cf0ec02000146000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078704190000074000b4e554d4245524152524159737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000006e77040000006e737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e00050000000171007e000b7371007e000a0000000071007e000c71007e000c71007e000b71007e000c71007e000c71007e000c71007e000c71007e000c7371007e000a0000000171007e000d71007e000c71007e000c71007e000c71007e000d71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000b71007e000c71007e000c71007e000b71007e000b71007e000b71007e000b71007e000b71007e000b71007e000c71007e000d71007e000b71007e000b71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000b71007e000b71007e000b71007e000b71007e000c71007e000b71007e000c71007e000b71007e000b71007e000b71007e000b71007e000b71007e000b71007e000b7371007e000a0000000071007e000e71007e000e71007e000e71007e000e71007e000e71007e000e71007e000e71007e000e71007e000e787400135355424a454354444e4649454c444f524445527371007e0008000000047704000000047371007e000a0000c3507371007e000a0001adb07371007e000a0001d4c07371007e000a00027100787400185355424a454354414c544e414d454649454c444f524445527371007e0008000000017704000000017371007e000a00057e40787400185355424a454354444952415454524649454c444f524445527371007e0008000000007704000000007874000f5353485f4649454c445f4f524445527371007e0008000000007704000000007874000b50524f46494c455459504571007e000b71007e000c7400007371007e000a001e8480737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c75657870017371007e000a000f424071007e00207371007e000a002dc6c07371007e001f017371007e000a004c4b407371007e001f0071007e000b7400007371007e000a001e848171007e00237371007e000a000f424171007e00237371007e000a002dc6c171007e00207371007e000a004c4b4171007e00257371007e000a0000005f7400007371007e000a001e84df71007e00257371007e000a000f429f71007e00207371007e000a002dc71f71007e00207371007e000a004c4b9f71007e00257371007e000a00000060740001387371007e000a001e84e071007e00257371007e000a000f42a071007e00207371007e000a002dc72071007e00207371007e000a004c4ba071007e00257371007e000a000000057400007371007e000a001e848571007e00237371007e000a000f424571007e00207371007e000a002dc6c571007e00237371007e000a004c4b4571007e00257371007e000a0000001a7400007371007e000a001e849a7371007e001f007371007e000a000f425a71007e00237371007e000a002dc6da71007e00237371007e000a004c4b5a71007e00257371007e000a0000001d74000a313534323931393930377371007e000a001e849d71007e00207371007e000a000f425d71007e00207371007e000a002dc6dd71007e00207371007e000a004c4b5d71007e00257371007e000a0000001e74000a313534323931393930377371007e000a001e849e71007e00207371007e000a000f425e71007e00207371007e000a002dc6de71007e00207371007e000a004c4b5e71007e00257371007e000a0000001f740001317371007e000a001e849f71007e00207371007e000a000f425f71007e00207371007e000a002dc6df71007e00207371007e000a004c4b5f71007e00257371007e000a00000020740009313b323b353b333b347371007e000a001e84a071007e00207371007e000a000f426071007e00207371007e000a002dc6e071007e00207371007e000a004c4b6071007e00257371007e000a0000002171007e002c7371007e000a001e84a171007e00257371007e000a000f426171007e00207371007e000a002dc6e171007e00207371007e000a004c4b6171007e00257371007e000a0000002271007e002c7371007e000a001e84a271007e00207371007e000a000f426271007e00257371007e000a002dc6e271007e00207371007e000a004c4b6271007e00257371007e000a0000002674000a313930303130303836377371007e000a001e84a671007e00207371007e000a000f426671007e00207371007e000a002dc6e671007e00207371007e000a004c4b6671007e00257371007e000a0000002574000a313930303130303836377371007e000a001e84a571007e00207371007e000a000f426571007e00207371007e000a002dc6e571007e00207371007e000a004c4b6571007e00257371007e000a000000627400007371007e000a001e84e271007e00257371007e000a000f42a271007e00407371007e000a002dc72271007e00207371007e000a004c4ba271007e00257371007e000a0000006371007e00737371007e000a001e84e371007e00257371007e000a000f42a371007e00407371007e000a002dc72371007e00207371007e000a004c4ba371007e00257371007e000a0000006171007e002c7371007e000a001e84e171007e00257371007e000a000f42a171007e00407371007e000a002dc72171007e00207371007e000a004c4ba171007e00257371007e000a0000005b71007e002c7371007e000a001e84db71007e00407371007e000a000f429b71007e00407371007e000a002dc71b71007e00207371007e000a004c4b9b71007e00257371007e000a0000005e7400022d317371007e000a001e84de71007e00257371007e000a000f429e71007e00407371007e000a002dc71e71007e00207371007e000a004c4b9e71007e00257371007e000a0000005d7400022d317371007e000a001e84dd71007e00257371007e000a000f429d71007e00407371007e000a002dc71d71007e00207371007e000a004c4b9d71007e00257371007e000a0000005971007e002c7371007e000a001e84d971007e00407371007e000a000f429971007e00407371007e000a002dc71971007e00207371007e000a004c4b9971007e00257371007e000a0000005871007e002c7371007e000a001e84d871007e00407371007e000a000f429871007e00407371007e000a002dc71871007e00207371007e000a004c4b9871007e00257371007e000a0000005771007e002c7371007e000a001e84d771007e00257371007e000a000f429771007e00407371007e000a002dc71771007e00207371007e000a004c4b9771007e00257371007e000a00000056740001377371007e000a001e84d671007e00257371007e000a000f429671007e00407371007e000a002dc71671007e00257371007e000a004c4b9671007e00257371007e000a002dc78971007e00207371007e000a002dc78a71007e00207371007e000a002dc78b71007e00207371007e000a0000000b74000a504b492041646d696e737371007e000a001e848b71007e00237371007e000a000f424b71007e00237371007e000a002dc6cb71007e00407371007e000a004c4b4b71007e00407371007e000a0000000c7400094b6579666163746f727371007e000a001e848c71007e00237371007e000a000f424c71007e00237371007e000a002dc6cc71007e00407371007e000a004c4b4c71007e00407371007e000a0000001074000253457371007e000a001e849071007e00237371007e000a000f425071007e00237371007e000a002dc6d071007e00407371007e000a004c4b5071007e00407371007e000a000000247400007371007e000a001e84a471007e00407371007e000a000f426471007e00237371007e000a002dc6e471007e00237371007e000a004c4b6471007e00407371007e000a000f429a71007e00237371007e000a0000005a740001307371007e000a000f424271007e00407371007e000a0000000274000566616c73657371007e000a001e848271007e00407371007e000a0000006e74000074001352455645525345464649454c44434845434b5371007e004074000d414c4c4f575f4d45524745444e71007e0040740016414c4c4f575f4d554c54495f56414c55455f52444e5371007e00407371007e000a000f429c71007e0040740010555345455854454e53494f4e4441544171007e004074000f50534432514353544154454d454e5471007e004074000952454441435450494971007e00407371007e000a000f426371007e0040740011555345524e4f54494649434154494f4e537371007e000800000000770400000000787371007e000a000f425c71007e00407371007e000a001e849c71007e00407371007e000a0000001c71007e00c87371007e000a001e84a371007e00407371007e000a0000002371007e00c87800	pkiAdmin	\N	2
889677003	\\xaced0005737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000c0770800000100000000a574000776657273696f6e7372000f6a6176612e6c616e672e466c6f6174daedc9a2db3cf0ec02000146000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078704190000074000b4e554d4245524152524159737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000006e77040000006e737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e00050000000171007e000b7371007e000a0000000071007e000c71007e000c7371007e000a0000000071007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c7371007e000a000000037371007e000a0000000171007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000b71007e000c71007e000c71007e000b71007e000b71007e000b71007e000b71007e000b71007e000b71007e000c71007e000c71007e000b71007e000b71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000c71007e000b71007e000b71007e000b71007e000b71007e000c71007e000b71007e000c71007e000b71007e000b71007e000b71007e000b71007e000b71007e000b71007e000b7371007e000a0000000071007e001071007e001071007e001071007e001071007e001071007e001071007e001071007e001071007e0010787400135355424a454354444e4649454c444f524445527371007e000800000000770400000000787400185355424a454354414c544e414d454649454c444f524445527371007e0008000000047704000000047371007e000a0002bf207371007e000a0002bf217371007e000a0002bf227371007e000a0002e630787400185355424a454354444952415454524649454c444f524445527371007e0008000000007704000000007874000f5353485f4649454c445f4f524445527371007e0008000000007704000000007874000b50524f46494c455459504571007e000b71007e000c7400007371007e000a001e8480737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c75657870017371007e000a000f424071007e00217371007e000a002dc6c07371007e0020017371007e000a004c4b407371007e00200071007e000b7400007371007e000a001e848171007e00247371007e000a000f424171007e00247371007e000a002dc6c171007e00217371007e000a004c4b4171007e00267371007e000a0000005f7400007371007e000a001e84df71007e00267371007e000a000f429f71007e00217371007e000a002dc71f71007e00217371007e000a004c4b9f71007e00267371007e000a00000060740001387371007e000a001e84e071007e00267371007e000a000f42a071007e00217371007e000a002dc72071007e00217371007e000a004c4ba071007e00267371007e000a0000001a7400007371007e000a001e849a7371007e0020007371007e000a000f425a71007e00247371007e000a002dc6da71007e00247371007e000a004c4b5a71007e00267371007e000a0000001d7400093338393939393632397371007e000a001e849d71007e00217371007e000a000f425d71007e00217371007e000a002dc6dd71007e00217371007e000a004c4b5d71007e00267371007e000a0000001e7400093338393939393632397371007e000a001e849e71007e00217371007e000a000f425e71007e00217371007e000a002dc6de71007e00217371007e000a004c4b5e71007e00267371007e000a0000001f740001317371007e000a001e849f71007e00217371007e000a000f425f71007e00217371007e000a002dc6df71007e00217371007e000a004c4b5f71007e00267371007e000a00000020740009313b323b353b333b347371007e000a001e84a071007e00217371007e000a000f426071007e00217371007e000a002dc6e071007e00217371007e000a004c4b6071007e00267371007e000a0000002171007e002d7371007e000a001e84a171007e00267371007e000a000f426171007e00217371007e000a002dc6e171007e00217371007e000a004c4b6171007e00267371007e000a0000002271007e002d7371007e000a001e84a271007e00217371007e000a000f426271007e00267371007e000a002dc6e271007e00217371007e000a004c4b6271007e00267371007e000a0000002674000a313930303130303836377371007e000a001e84a671007e00217371007e000a000f426671007e00217371007e000a002dc6e671007e00217371007e000a004c4b6671007e00267371007e000a0000002574000a313930303130303836377371007e000a001e84a571007e00217371007e000a000f426571007e00217371007e000a002dc6e571007e00217371007e000a004c4b6571007e00267371007e000a000000627400007371007e000a001e84e271007e00267371007e000a000f42a271007e003b7371007e000a002dc72271007e00217371007e000a004c4ba271007e00267371007e000a0000006371007e006e7371007e000a001e84e371007e00267371007e000a000f42a371007e003b7371007e000a002dc72371007e00217371007e000a004c4ba371007e00267371007e000a0000006171007e002d7371007e000a001e84e171007e00267371007e000a000f42a171007e003b7371007e000a002dc72171007e00217371007e000a004c4ba171007e00267371007e000a0000005b71007e002d7371007e000a001e84db71007e003b7371007e000a000f429b71007e003b7371007e000a002dc71b71007e00217371007e000a004c4b9b71007e00267371007e000a0000005e7400022d317371007e000a001e84de71007e00267371007e000a000f429e71007e003b7371007e000a002dc71e71007e00217371007e000a004c4b9e71007e00267371007e000a0000005d7400022d317371007e000a001e84dd71007e00267371007e000a000f429d71007e003b7371007e000a002dc71d71007e00217371007e000a004c4b9d71007e00267371007e000a0000005971007e002d7371007e000a001e84d971007e003b7371007e000a000f429971007e003b7371007e000a002dc71971007e00217371007e000a004c4b9971007e00267371007e000a0000005871007e002d7371007e000a001e84d871007e003b7371007e000a000f429871007e003b7371007e000a002dc71871007e00217371007e000a004c4b9871007e00267371007e000a0000005771007e002d7371007e000a001e84d771007e00267371007e000a000f429771007e003b7371007e000a002dc71771007e00217371007e000a004c4b9771007e00267371007e000a00000056740001377371007e000a001e84d671007e00267371007e000a000f429671007e003b7371007e000a002dc71671007e00267371007e000a004c4b9671007e00267371007e000a002dc78971007e00217371007e000a002dc78a71007e00217371007e000a002dc78b71007e00217371007e000a000000127400007371007e000a001e849271007e00247371007e000a000f42527371007e0020017371007e000a002dc6d271007e00247371007e000a004c4b5271007e003b7371007e000a000000767400007371007e000a001e84f671007e003b7371007e000a000f42b671007e00aa7371007e000a002dc73671007e00247371007e000a004c4bb671007e003b7371007e000a000000da7400007371007e000a001e855a71007e003b7371007e000a000f431a71007e00aa7371007e000a002dc79a71007e00247371007e000a004c4c1a71007e003b7371007e000a000f429a71007e00247371007e000a0000005a740001307371007e000a000f424271007e003b7371007e000a0000000274000566616c73657371007e000a001e848271007e003b7371007e000a0000006e74000074001352455645525345464649454c44434845434b5371007e003b74000d414c4c4f575f4d45524745444e71007e003b740016414c4c4f575f4d554c54495f56414c55455f52444e5371007e003b7371007e000a000f429c71007e003b740010555345455854454e53494f4e4441544171007e003b74000f50534432514353544154454d454e5471007e003b74000952454441435450494971007e003b7371007e000a000f426371007e003b740011555345524e4f54494649434154494f4e537371007e000800000000770400000000787371007e000a000f425c71007e003b7371007e000a001e849c71007e003b7371007e000a0000001c71007e00be7371007e000a001e84a371007e003b7371007e000a0000002371007e00be7371007e000a000000137400007371007e000a001e849371007e003b7371007e000a000f425371007e00247371007e000a002dc6d371007e00247371007e000a004c4b5371007e003b7800	tlsServer	\N	3
\.


--
-- Data for Name: globalconfigurationdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.globalconfigurationdata (configurationid, data, rowprotection, rowversion) FROM stdin;
0	\\xaced0005737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000974000776657273696f6e7372000f6a6176612e6c616e672e466c6f6174daedc9a2db3cf0ec02000146000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870404000007400057469746c65740014454a4243412041646d696e697374726174696f6e74000a6865616462616e6e657274002061646d696e7765622f62616e6e6572732f686561645f62616e6e65722e6a737074000a666f6f7462616e6e65727400182f62616e6e6572732f666f6f745f62616e6e65722e6a737074001b656e64656e7469747970726f66696c656c696d69746174696f6e73737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578700174001661757468656e7469636174656475736572736f6e6c797371007e000e00740011656e61626c656b65797265636f7665727971007e0011740016656e61626c656963616f63616e616d656368616e676571007e0011740012737461746564756d705f6c6f636b646f776e71007e00117800	\N	0
UPGRADE	\\xaced0005737200226f72672e63657365636f72652e7574696c2e426173653634476574486173684d617007156f73c047aee9020000787200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000674000776657273696f6e7372000f6a6176612e6c616e672e466c6f6174daedc9a2db3cf0ec02000146000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787040400000740021656e64456e7469747950726f66696c65496e4365727469666963617465446174617400047472756574001e76616c6964697479576974685365636f6e64734772616e756c617269747971007e0009740013757067726164656446726f6d56657273696f6e740005382e332e327400117570677261646564546f56657273696f6e71007e000c740015706f73745570677261646564546f56657273696f6e740006372e31312e307800	\N	4
\.


--
-- Data for Name: incompleteissuancejournaldata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.incompleteissuancejournaldata (serialnumberandcaid, starttime, rawdata, rowprotection, rowversion) FROM stdin;
\.


--
-- Data for Name: internalkeybindingdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.internalkeybindingdata (id, certificateid, cryptotokenid, keybindingtype, keypairalias, lastupdate, name, rawdata, rowprotection, rowversion, status) FROM stdin;
\.


--
-- Data for Name: keyrecoverydata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.keyrecoverydata (certsn, issuerdn, cryptotokenid, keyalias, keydata, markedasrecoverable, publickeyid, rowprotection, rowversion, username) FROM stdin;
\.


--
-- Data for Name: noconflictcertificatedata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.noconflictcertificatedata (id, fingerprint, base64cert, cafingerprint, certificateprofileid, endentityprofileid, crlpartitionindex, expiredate, issuerdn, notbefore, invaliditydate, revocationdate, revocationreason, rowprotection, rowversion, serialnumber, status, subjectaltname, subjectdn, subjectkeyid, accountbindingid, tag, type, updatetime, username, certificaterequest) FROM stdin;
\.


--
-- Data for Name: ocspresponsedata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.ocspresponsedata (id, serialnumber, producedat, nextupdate, ocspresponse, caid, rowprotection, rowversion) FROM stdin;
\.


--
-- Data for Name: peerdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.peerdata (id, connectorstate, data, name, rowprotection, rowversion, url) FROM stdin;
\.


--
-- Data for Name: profiledata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.profiledata (id, profilename, profiletype, rawdata, rowprotection, rowversion) FROM stdin;
\.


--
-- Data for Name: publisherdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.publisherdata (id, data, name, rowprotection, rowversion, updatecounter) FROM stdin;
\.


--
-- Data for Name: publisherqueuedata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.publisherqueuedata (pk, fingerprint, lastupdate, publishstatus, publishtype, publisherid, rowprotection, rowversion, timecreated, trycounter, volatiledata) FROM stdin;
\.


--
-- Data for Name: roledata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.roledata (id, rolename, namespace, rawdata, rowprotection, rowversion) FROM stdin;
1	Super Administrator Role	\N	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.23" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>version</string>\n   <float>1.0</float>\n  </void>\n  <void method="put">\n   <string>accessRules</string>\n   <object class="java.util.LinkedHashMap">\n    <void method="put">\n     <string>/</string>\n     <boolean>true</boolean>\n    </void>\n   </object>\n  </void>\n </object>\n</java>\n	\N	0
\.


--
-- Data for Name: rolememberdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.rolememberdata (primarykey, tokentype, tokenissuerid, tokenproviderid, tokenmatchkey, tokenmatchoperator, tokenmatchvalue, roleid, description, rowprotection, rowversion) FROM stdin;
774896921	CliAuthenticationToken	0	0	0	1000	ejbca	1	\N	\N	0
2113594967	CertificateAuthenticationToken	1900100867	0	11	1001	16256ACE6E0DC2F47146A44E2A11CCA13A39A120	1	CommunityDay2024PkiAdmin	\N	0
\.


--
-- Data for Name: sctdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.sctdata (pk, logid, fingerprint, certificateexpirationdate, data, rowprotection, rowversion) FROM stdin;
\.


--
-- Data for Name: servicedata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.servicedata (id, data, name, nextruntimestamp, rowprotection, rowversion, runtimestamp) FROM stdin;
355027178	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.23" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>version</string>\n   <float>7.0</float>\n  </void>\n  <void method="put">\n   <string>ACTIVE</string>\n   <boolean>true</boolean>\n  </void>\n  <void method="put">\n   <string>HIDDEN</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>DESCRIPTION</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>ACTIONCLASSPATH</string>\n   <string>org.ejbca.core.model.services.actions.NoAction</string>\n  </void>\n  <void method="put">\n   <string>ACTIONPROPERTIES</string>\n   <object class="java.util.Properties"/>\n  </void>\n  <void method="put">\n   <string>WORKERCLASSPATH</string>\n   <string>org.ejbca.core.model.services.workers.CRLUpdateWorker</string>\n  </void>\n  <void method="put">\n   <string>WORKERPROPERTIES</string>\n   <object class="java.util.Properties">\n    <void method="put">\n     <string>worker.caidstocheck</string>\n     <string>1900100867</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>INTERVALCLASSPATH</string>\n   <string>org.ejbca.core.model.services.intervals.PeriodicalInterval</string>\n  </void>\n  <void method="put">\n   <string>INTERVALPROPERTIES</string>\n   <object class="java.util.Properties">\n    <void method="put">\n     <string>interval.periodical.value</string>\n     <string>1</string>\n    </void>\n    <void method="put">\n     <string>interval.periodical.unit</string>\n     <string>HOURS</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>RUNONALLNODES</string>\n   <boolean>false</boolean>\n  </void>\n  <void method="put">\n   <string>PINTONODES</string>\n   <array class="java.lang.String" length="0"/>\n  </void>\n </object>\n</java>\n	crlUpdate	1727033879869	\N	3	1727030279863
\.


--
-- Data for Name: userdata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.userdata (username, caid, cardnumber, certificateprofileid, clearpassword, endentityprofileid, extendedinformationdata, hardtokenissuerid, keystorepassword, passwordhash, rowprotection, rowversion, status, subjectaltname, subjectdn, subjectemail, timecreated, timemodified, tokentype, type) FROM stdin;
ejbca	0	\N	0	\N	1	\N	0	\N	$2a$01$/EVAONcW2YO4zoffsPFkee/jbdgA9DU7BEVV7vZeZcXaXc1oGdA.K	\N	0	40	\N	UID=ejbca	\N	1725561546537	1725561546537	0	0
communityDay2024PKIAdmin	1900100867		1542919907		890019301	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.23" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>version</string>\n   <float>4.0</float>\n  </void>\n  <void method="put">\n   <string>type</string>\n   <int>0</int>\n  </void>\n  <void method="put">\n   <string>subjectdirattributes</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>maxfailedloginattempts</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>remainingloginattempts</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>KEYSTORE_ALGORITHM_TYPE</string>\n   <string>ECDSA</string>\n  </void>\n  <void method="put">\n   <string>KEYSTORE_ALGORITHM_SUBTYPE</string>\n   <string>P-256</string>\n  </void>\n </object>\n</java>\n	0	\N		\N	1	40		CN=Community Day 2024 PKI Admin,OU=PKI Admins,O=Keyfactor,C=SE		1725649498374	1725649498443	2	1
enroll.community2024.local	1900100867		389999629		889677003	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.23" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>version</string>\n   <float>4.0</float>\n  </void>\n  <void method="put">\n   <string>type</string>\n   <int>0</int>\n  </void>\n  <void method="put">\n   <string>subjectdirattributes</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>maxfailedloginattempts</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>remainingloginattempts</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>KEYSTORE_ALGORITHM_TYPE</string>\n   <string>ECDSA</string>\n  </void>\n  <void method="put">\n   <string>KEYSTORE_ALGORITHM_SUBTYPE</string>\n   <string>P-256</string>\n  </void>\n </object>\n</java>\n	0	\N		\N	1	40	DNSNAME=enroll.community2024.local			1725649807735	1725649807762	4	1
sign.community2024.local	1900100867		389999629		889677003	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.23" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>version</string>\n   <float>4.0</float>\n  </void>\n  <void method="put">\n   <string>type</string>\n   <int>0</int>\n  </void>\n  <void method="put">\n   <string>subjectdirattributes</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>maxfailedloginattempts</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>remainingloginattempts</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>KEYSTORE_ALGORITHM_TYPE</string>\n   <string>ECDSA</string>\n  </void>\n  <void method="put">\n   <string>KEYSTORE_ALGORITHM_SUBTYPE</string>\n   <string>P-256</string>\n  </void>\n </object>\n</java>\n	0	\N		\N	1	40	DNSNAME=sign.community2024.local			1725658197045	1725658197169	4	1
communityDays2024PlainSigner	1900100867		499639567	\N	1181467576	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.23" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>version</string>\n   <float>4.0</float>\n  </void>\n  <void method="put">\n   <string>type</string>\n   <int>0</int>\n  </void>\n  <void method="put">\n   <string>subjectdirattributes</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>maxfailedloginattempts</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>remainingloginattempts</string>\n   <int>-1</int>\n  </void>\n </object>\n</java>\n	0	\N	$2a$01$bE5tpmnqsjBwu0ukm7SHE.ROJ/NhaAgynYFtFTPykbZOA1HsdaWOS	\N	1	40		CN=Community Days 2024 Plain Signer,OU=Signers,O=Keyfactor,C=SE		1725659826139	1725659826249	1	1
communityDays2024TimeStampAuthority	1900100867	\N	2025547880	\N	1181467576	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.23" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>version</string>\n   <float>4.0</float>\n  </void>\n  <void method="put">\n   <string>type</string>\n   <int>0</int>\n  </void>\n  <void method="put">\n   <string>subjectdirattributes</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>maxfailedloginattempts</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>remainingloginattempts</string>\n   <int>-1</int>\n  </void>\n </object>\n</java>\n	0	\N	$2a$01$TtjFzbY1CvG.KjRtMgE/3OdrG1LAfS/aw3bbvZ8099m5.jgexFkAi	\N	3	40		CN=Community Days 2024 Time Stamp Authority,OU=Signers,O=Keyfactor,C=SE		1725660023324	1725660912469	1	1
registry.community2024.local	1900100867		389999629		889677003	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.23" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>version</string>\n   <float>4.0</float>\n  </void>\n  <void method="put">\n   <string>type</string>\n   <int>0</int>\n  </void>\n  <void method="put">\n   <string>subjectdirattributes</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>maxfailedloginattempts</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>remainingloginattempts</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>KEYSTORE_ALGORITHM_TYPE</string>\n   <string>ECDSA</string>\n  </void>\n  <void method="put">\n   <string>KEYSTORE_ALGORITHM_SUBTYPE</string>\n   <string>P-256</string>\n  </void>\n </object>\n</java>\n	0	\N		\N	1	40	DNSNAME=registry.community2024.local			1726319881742	1726319881862	4	1
vault.community2024.local	1900100867		389999629		889677003	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.23" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>version</string>\n   <float>4.0</float>\n  </void>\n  <void method="put">\n   <string>type</string>\n   <int>0</int>\n  </void>\n  <void method="put">\n   <string>subjectdirattributes</string>\n   <string></string>\n  </void>\n  <void method="put">\n   <string>maxfailedloginattempts</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>remainingloginattempts</string>\n   <int>-1</int>\n  </void>\n  <void method="put">\n   <string>KEYSTORE_ALGORITHM_TYPE</string>\n   <string>ECDSA</string>\n  </void>\n  <void method="put">\n   <string>KEYSTORE_ALGORITHM_SUBTYPE</string>\n   <string>P-256</string>\n  </void>\n </object>\n</java>\n	0	\N		\N	1	40	DNSNAME=vault.community2024.local, DNSNAME=vault, IPADDRESS=127.0.0.1			1726834130935	1726834131051	4	1
\.


--
-- Data for Name: userdatasourcedata; Type: TABLE DATA; Schema: public; Owner: ejbca
--

COPY public.userdatasourcedata (id, data, name, rowprotection, rowversion, updatecounter) FROM stdin;
\.


--
-- Name: accessrulesdata accessrulesdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.accessrulesdata
    ADD CONSTRAINT accessrulesdata_pkey PRIMARY KEY (pk);


--
-- Name: acmeaccountdata acmeaccountdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.acmeaccountdata
    ADD CONSTRAINT acmeaccountdata_pkey PRIMARY KEY (accountid);


--
-- Name: acmeauthorizationdata acmeauthorizationdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.acmeauthorizationdata
    ADD CONSTRAINT acmeauthorizationdata_pkey PRIMARY KEY (authorizationid);


--
-- Name: acmechallengedata acmechallengedata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.acmechallengedata
    ADD CONSTRAINT acmechallengedata_pkey PRIMARY KEY (challengeid);


--
-- Name: acmenoncedata acmenoncedata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.acmenoncedata
    ADD CONSTRAINT acmenoncedata_pkey PRIMARY KEY (nonce);


--
-- Name: acmeorderdata acmeorderdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.acmeorderdata
    ADD CONSTRAINT acmeorderdata_pkey PRIMARY KEY (orderid);


--
-- Name: adminentitydata adminentitydata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.adminentitydata
    ADD CONSTRAINT adminentitydata_pkey PRIMARY KEY (pk);


--
-- Name: admingroupdata admingroupdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.admingroupdata
    ADD CONSTRAINT admingroupdata_pkey PRIMARY KEY (pk);


--
-- Name: adminpreferencesdata adminpreferencesdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.adminpreferencesdata
    ADD CONSTRAINT adminpreferencesdata_pkey PRIMARY KEY (id);


--
-- Name: approvaldata approvaldata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.approvaldata
    ADD CONSTRAINT approvaldata_pkey PRIMARY KEY (id);


--
-- Name: auditrecorddata auditrecorddata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.auditrecorddata
    ADD CONSTRAINT auditrecorddata_pkey PRIMARY KEY (pk);


--
-- Name: authorizationtreeupdatedata authorizationtreeupdatedata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.authorizationtreeupdatedata
    ADD CONSTRAINT authorizationtreeupdatedata_pkey PRIMARY KEY (pk);


--
-- Name: base64certdata base64certdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.base64certdata
    ADD CONSTRAINT base64certdata_pkey PRIMARY KEY (fingerprint);


--
-- Name: blacklistdata blacklistdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.blacklistdata
    ADD CONSTRAINT blacklistdata_pkey PRIMARY KEY (id);


--
-- Name: cadata cadata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.cadata
    ADD CONSTRAINT cadata_pkey PRIMARY KEY (caid);


--
-- Name: certificatedata certificatedata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.certificatedata
    ADD CONSTRAINT certificatedata_pkey PRIMARY KEY (fingerprint);


--
-- Name: certificateprofiledata certificateprofiledata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.certificateprofiledata
    ADD CONSTRAINT certificateprofiledata_pkey PRIMARY KEY (id);


--
-- Name: certreqhistorydata certreqhistorydata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.certreqhistorydata
    ADD CONSTRAINT certreqhistorydata_pkey PRIMARY KEY (fingerprint);


--
-- Name: crldata crldata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.crldata
    ADD CONSTRAINT crldata_pkey PRIMARY KEY (fingerprint);


--
-- Name: cryptotokendata cryptotokendata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.cryptotokendata
    ADD CONSTRAINT cryptotokendata_pkey PRIMARY KEY (id);


--
-- Name: endentityprofiledata endentityprofiledata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.endentityprofiledata
    ADD CONSTRAINT endentityprofiledata_pkey PRIMARY KEY (id);


--
-- Name: globalconfigurationdata globalconfigurationdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.globalconfigurationdata
    ADD CONSTRAINT globalconfigurationdata_pkey PRIMARY KEY (configurationid);


--
-- Name: incompleteissuancejournaldata incompleteissuancejournaldata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.incompleteissuancejournaldata
    ADD CONSTRAINT incompleteissuancejournaldata_pkey PRIMARY KEY (serialnumberandcaid);


--
-- Name: internalkeybindingdata internalkeybindingdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.internalkeybindingdata
    ADD CONSTRAINT internalkeybindingdata_pkey PRIMARY KEY (id);


--
-- Name: keyrecoverydata keyrecoverydata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.keyrecoverydata
    ADD CONSTRAINT keyrecoverydata_pkey PRIMARY KEY (certsn, issuerdn);


--
-- Name: noconflictcertificatedata noconflictcertificatedata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.noconflictcertificatedata
    ADD CONSTRAINT noconflictcertificatedata_pkey PRIMARY KEY (id);


--
-- Name: ocspresponsedata ocspresponsedata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.ocspresponsedata
    ADD CONSTRAINT ocspresponsedata_pkey PRIMARY KEY (id);


--
-- Name: peerdata peerdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.peerdata
    ADD CONSTRAINT peerdata_pkey PRIMARY KEY (id);


--
-- Name: profiledata profiledata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.profiledata
    ADD CONSTRAINT profiledata_pkey PRIMARY KEY (id);


--
-- Name: publisherdata publisherdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.publisherdata
    ADD CONSTRAINT publisherdata_pkey PRIMARY KEY (id);


--
-- Name: publisherqueuedata publisherqueuedata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.publisherqueuedata
    ADD CONSTRAINT publisherqueuedata_pkey PRIMARY KEY (pk);


--
-- Name: roledata roledata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.roledata
    ADD CONSTRAINT roledata_pkey PRIMARY KEY (id);


--
-- Name: rolememberdata rolememberdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.rolememberdata
    ADD CONSTRAINT rolememberdata_pkey PRIMARY KEY (primarykey);


--
-- Name: sctdata sctdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.sctdata
    ADD CONSTRAINT sctdata_pkey PRIMARY KEY (pk);


--
-- Name: servicedata servicedata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.servicedata
    ADD CONSTRAINT servicedata_pkey PRIMARY KEY (id);


--
-- Name: userdata userdata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.userdata
    ADD CONSTRAINT userdata_pkey PRIMARY KEY (username);


--
-- Name: userdatasourcedata userdatasourcedata_pkey; Type: CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.userdatasourcedata
    ADD CONSTRAINT userdatasourcedata_pkey PRIMARY KEY (id);


--
-- Name: acmeaccountdata_idx1; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX acmeaccountdata_idx1 ON public.acmeaccountdata USING btree (currentkeyid);


--
-- Name: acmeauthorizationdata_idx1; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX acmeauthorizationdata_idx1 ON public.acmeauthorizationdata USING btree (orderid, accountid, expires, status);


--
-- Name: acmeauthorizationdata_idx2; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX acmeauthorizationdata_idx2 ON public.acmeauthorizationdata USING btree (orderid);


--
-- Name: acmechallengedata_idx1; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX acmechallengedata_idx1 ON public.acmechallengedata USING btree (authorizationid);


--
-- Name: acmeorderdata_idx1; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX acmeorderdata_idx1 ON public.acmeorderdata USING btree (accountid);


--
-- Name: acmeorderdata_idx2; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX acmeorderdata_idx2 ON public.acmeorderdata USING btree (fingerprint, status);


--
-- Name: auditrecorddata_idx2; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE UNIQUE INDEX auditrecorddata_idx2 ON public.auditrecorddata USING btree (nodeid, sequencenumber);


--
-- Name: auditrecorddata_idx3; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX auditrecorddata_idx3 ON public.auditrecorddata USING btree ("timestamp");


--
-- Name: auditrecorddata_idx4; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX auditrecorddata_idx4 ON public.auditrecorddata USING btree (searchdetail2);


--
-- Name: blocklist_idx1; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX blocklist_idx1 ON public.blacklistdata USING btree (type, value);


--
-- Name: cadata_idx1; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE UNIQUE INDEX cadata_idx1 ON public.cadata USING btree (name);


--
-- Name: certificatedata_idx11; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx11 ON public.certificatedata USING btree (subjectkeyid);


--
-- Name: certificatedata_idx12; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE UNIQUE INDEX certificatedata_idx12 ON public.certificatedata USING btree (serialnumber, issuerdn);


--
-- Name: certificatedata_idx15; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx15 ON public.certificatedata USING btree (issuerdn, notbefore);


--
-- Name: certificatedata_idx16; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx16 ON public.certificatedata USING btree (issuerdn, revocationdate);


--
-- Name: certificatedata_idx17; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx17 ON public.certificatedata USING btree (issuerdn, status, crlpartitionindex);


--
-- Name: certificatedata_idx18; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx18 ON public.certificatedata USING btree (issuerdn, status, crlpartitionindex, revocationdate);


--
-- Name: certificatedata_idx2; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx2 ON public.certificatedata USING btree (username);


--
-- Name: certificatedata_idx4; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx4 ON public.certificatedata USING btree (subjectdn);


--
-- Name: certificatedata_idx5; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx5 ON public.certificatedata USING btree (type);


--
-- Name: certificatedata_idx6; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx6 ON public.certificatedata USING btree (issuerdn, status, revocationdate);


--
-- Name: certificatedata_idx7; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx7 ON public.certificatedata USING btree (certificateprofileid);


--
-- Name: certificatedata_idx_eab; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx_eab ON public.certificatedata USING btree (accountbindingid);


--
-- Name: certificatedata_idx_san; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx_san ON public.certificatedata USING btree ("left"(subjectaltname, 750));


--
-- Name: certificatedata_idx_serial; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX certificatedata_idx_serial ON public.certificatedata USING btree (serialnumber);


--
-- Name: crldata_idx5; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX crldata_idx5 ON public.crldata USING btree (crlnumber, issuerdn, crlpartitionindex);


--
-- Name: crldata_idx6; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE UNIQUE INDEX crldata_idx6 ON public.crldata USING btree (issuerdn, crlpartitionindex, deltacrlindicator, crlnumber);


--
-- Name: historydata_idx1; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX historydata_idx1 ON public.certreqhistorydata USING btree (username);


--
-- Name: historydata_idx3; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX historydata_idx3 ON public.certreqhistorydata USING btree (serialnumber);


--
-- Name: noconflictcertificatedata_idx1; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX noconflictcertificatedata_idx1 ON public.noconflictcertificatedata USING btree (serialnumber, issuerdn);


--
-- Name: noconflictcertificatedata_idx2; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX noconflictcertificatedata_idx2 ON public.noconflictcertificatedata USING btree (fingerprint);


--
-- Name: noconflictcertificatedata_idx3; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX noconflictcertificatedata_idx3 ON public.noconflictcertificatedata USING btree (issuerdn, status);


--
-- Name: noconflictcertificatedata_idx4; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX noconflictcertificatedata_idx4 ON public.noconflictcertificatedata USING btree (certificateprofileid);


--
-- Name: noconflictcertificatedata_idx5; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX noconflictcertificatedata_idx5 ON public.noconflictcertificatedata USING btree (issuerdn, status, crlpartitionindex);


--
-- Name: noconflictcertificatedata_idx6; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX noconflictcertificatedata_idx6 ON public.noconflictcertificatedata USING btree (issuerdn, status, crlpartitionindex, revocationdate);


--
-- Name: ocspresponsedata_idx1; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX ocspresponsedata_idx1 ON public.ocspresponsedata USING btree (caid);


--
-- Name: ocspresponsedata_idx2; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX ocspresponsedata_idx2 ON public.ocspresponsedata USING btree (serialnumber);


--
-- Name: ocspresponsedata_idx3; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX ocspresponsedata_idx3 ON public.ocspresponsedata USING btree (producedat);


--
-- Name: publisherqueue_idx3; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX publisherqueue_idx3 ON public.publisherqueuedata USING btree (publisherid, publishstatus, timecreated);


--
-- Name: rolemember_idx1; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX rolemember_idx1 ON public.rolememberdata USING btree (tokentype, roleid);


--
-- Name: sctdata_idx1; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX sctdata_idx1 ON public.sctdata USING btree (fingerprint);


--
-- Name: userdata_idx10; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX userdata_idx10 ON public.userdata USING btree (subjectdn);


--
-- Name: userdata_idx11; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX userdata_idx11 ON public.userdata USING btree (status);


--
-- Name: userdata_idx12; Type: INDEX; Schema: public; Owner: ejbca
--

CREATE INDEX userdata_idx12 ON public.userdata USING btree (timecreated);


--
-- Name: accessrulesdata fkabb4c1dfdbbc970; Type: FK CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.accessrulesdata
    ADD CONSTRAINT fkabb4c1dfdbbc970 FOREIGN KEY (admingroupdata_accessrules) REFERENCES public.admingroupdata(pk);


--
-- Name: adminentitydata fkd9a99ebcb3a110ad; Type: FK CONSTRAINT; Schema: public; Owner: ejbca
--

ALTER TABLE ONLY public.adminentitydata
    ADD CONSTRAINT fkd9a99ebcb3a110ad FOREIGN KEY (admingroupdata_adminentities) REFERENCES public.admingroupdata(pk);


--
-- PostgreSQL database dump complete
--

