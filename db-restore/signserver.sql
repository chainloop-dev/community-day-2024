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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: archivedata; Type: TABLE; Schema: public; Owner: signserver
--

CREATE TABLE public.archivedata (
    uniqueid character varying(255) NOT NULL,
    archivedata text,
    archiveid character varying(255),
    dataencoding integer,
    requestcertserialnumber character varying(255),
    requestip character varying(255),
    requestissuerdn character varying(255),
    signerid integer NOT NULL,
    "time" bigint NOT NULL,
    type integer NOT NULL
);


ALTER TABLE public.archivedata OWNER TO signserver;

--
-- Name: auditrecorddata; Type: TABLE; Schema: public; Owner: signserver
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


ALTER TABLE public.auditrecorddata OWNER TO signserver;

--
-- Name: globalconfigdata; Type: TABLE; Schema: public; Owner: signserver
--

CREATE TABLE public.globalconfigdata (
    propertykey character varying(255) NOT NULL,
    propertyvalue text
);


ALTER TABLE public.globalconfigdata OWNER TO signserver;

--
-- Name: keydata; Type: TABLE; Schema: public; Owner: signserver
--

CREATE TABLE public.keydata (
    keyalias text NOT NULL,
    certdata text,
    keydata text,
    wrappingcipher bigint NOT NULL,
    wrappingkeyalias character varying(255)
);


ALTER TABLE public.keydata OWNER TO signserver;

--
-- Name: keyusagecounter; Type: TABLE; Schema: public; Owner: signserver
--

CREATE TABLE public.keyusagecounter (
    keyhash character varying(255) NOT NULL,
    counter bigint NOT NULL
);


ALTER TABLE public.keyusagecounter OWNER TO signserver;

--
-- Name: signerconfigdata; Type: TABLE; Schema: public; Owner: signserver
--

CREATE TABLE public.signerconfigdata (
    signerid integer NOT NULL,
    signerconfigdata text,
    signername character varying(255),
    signertype integer
);


ALTER TABLE public.signerconfigdata OWNER TO signserver;

--
-- Name: 17163; Type: BLOB; Schema: -; Owner: signserver
--

SELECT pg_catalog.lo_create('17163');


ALTER LARGE OBJECT 17163 OWNER TO signserver;

--
-- Name: 17164; Type: BLOB; Schema: -; Owner: signserver
--

SELECT pg_catalog.lo_create('17164');


ALTER LARGE OBJECT 17164 OWNER TO signserver;

--
-- Name: 17165; Type: BLOB; Schema: -; Owner: signserver
--

SELECT pg_catalog.lo_create('17165');


ALTER LARGE OBJECT 17165 OWNER TO signserver;

--
-- Name: 17166; Type: BLOB; Schema: -; Owner: signserver
--

SELECT pg_catalog.lo_create('17166');


ALTER LARGE OBJECT 17166 OWNER TO signserver;

--
-- Name: 17167; Type: BLOB; Schema: -; Owner: signserver
--

SELECT pg_catalog.lo_create('17167');


ALTER LARGE OBJECT 17167 OWNER TO signserver;

--
-- Name: 25315; Type: BLOB; Schema: -; Owner: signserver
--

SELECT pg_catalog.lo_create('25315');


ALTER LARGE OBJECT 25315 OWNER TO signserver;

--
-- Data for Name: archivedata; Type: TABLE DATA; Schema: public; Owner: signserver
--

COPY public.archivedata (uniqueid, archivedata, archiveid, dataencoding, requestcertserialnumber, requestip, requestissuerdn, signerid, "time", type) FROM stdin;
\.


--
-- Data for Name: auditrecorddata; Type: TABLE DATA; Schema: public; Owner: signserver
--

COPY public.auditrecorddata (pk, additionaldetails, authtoken, customid, eventstatus, eventtype, module, nodeid, rowprotection, rowversion, searchdetail1, searchdetail2, sequencenumber, service, "timestamp") FROM stdin;
\.


--
-- Data for Name: globalconfigdata; Type: TABLE DATA; Schema: public; Owner: signserver
--

COPY public.globalconfigdata (propertykey, propertyvalue) FROM stdin;
GLOB.WSAUDITORS	17164
GLOB.WSARCHIVEAUDITORS	17165
GLOB.WSADMINS	17166
GLOB.ALLOWANYWSADMIN	25315
\.


--
-- Data for Name: keydata; Type: TABLE DATA; Schema: public; Owner: signserver
--

COPY public.keydata (keyalias, certdata, keydata, wrappingcipher, wrappingkeyalias) FROM stdin;
\.


--
-- Data for Name: keyusagecounter; Type: TABLE DATA; Schema: public; Owner: signserver
--

COPY public.keyusagecounter (keyhash, counter) FROM stdin;
7c8d43a6499b41e382dbf456a510f50241c1fa22c7acb27521f9d01fe24158a7	0
32d06ee52a2942b09d6e7e19ef0ee495886064a466b9f8ee6b6ac9f76b974a3b	10
\.


--
-- Data for Name: signerconfigdata; Type: TABLE DATA; Schema: public; Owner: signserver
--

COPY public.signerconfigdata (signerid, signerconfigdata, signername, signertype) FROM stdin;
1	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.20" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>version</string>\n   <float>2.0</float>\n  </void>\n  <void method="put">\n   <string>PROPERTIES</string>\n   <object class="java.util.Properties">\n    <void method="put">\n     <string>IMPLEMENTATION_CLASS</string>\n     <string>org.signserver.server.signers.CryptoWorker</string>\n    </void>\n    <void method="put">\n     <string>KEYSTORETYPE</string>\n     <string>INTERNAL</string>\n    </void>\n    <void method="put">\n     <string>KEYSTOREPASSWORD</string>\n     <string>foo123</string>\n    </void>\n    <void method="put">\n     <string>TYPE</string>\n     <string>CRYPTO_WORKER</string>\n    </void>\n    <void method="put">\n     <string>CRYPTOTOKEN_IMPLEMENTATION_CLASS</string>\n     <string>org.signserver.server.cryptotokens.KeystoreCryptoToken</string>\n    </void>\n    <void method="put">\n     <string>NAME</string>\n     <string>CryptoTokenInternal</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>AUTHORIZED_CLIENTS</string>\n   <object class="java.util.HashSet"/>\n  </void>\n  <void method="put">\n   <string>AUTHORIZED_CLIENTS_GEN2</string>\n   <object class="java.util.HashSet"/>\n  </void>\n  <void method="put">\n   <string>CLASSPATH</string>\n   <string>org.signserver.common.WorkerConfig</string>\n  </void>\n  <void method="put">\n   <string>KEYSTORE_DATA</string>\n   <string>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</string>\n  </void>\n </object>\n</java>\n	CryptoTokenInternal	11
2	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.20" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>version</string>\n   <float>2.0</float>\n  </void>\n  <void method="put">\n   <string>PROPERTIES</string>\n   <object class="java.util.Properties">\n    <void method="put">\n     <string>CRYPTOTOKEN</string>\n     <string>CryptoTokenInternal</string>\n    </void>\n    <void method="put">\n     <string>AUTHTYPE</string>\n     <string>NOAUTH</string>\n    </void>\n    <void method="put">\n     <string>IMPLEMENTATION_CLASS</string>\n     <string>org.signserver.module.cmssigner.PlainSigner</string>\n    </void>\n    <void method="put">\n     <string>DEFAULTKEY</string>\n     <string>plainSigner</string>\n    </void>\n    <void method="put">\n     <string>DO_LOGREQUEST_DIGEST</string>\n     <string></string>\n    </void>\n    <void method="put">\n     <string>ACCEPTED_HASH_DIGEST_ALGORITHMS</string>\n     <string>SHA-256,SHA-384,SHA-512</string>\n    </void>\n    <void method="put">\n     <string>SIGNATUREALGORITHM</string>\n     <string>SHA256withECDSA</string>\n    </void>\n    <void method="put">\n     <string>TYPE</string>\n     <string>PROCESSABLE</string>\n    </void>\n    <void method="put">\n     <string>LOGREQUEST_DIGESTALGORITHM</string>\n     <string>SHA256</string>\n    </void>\n    <void method="put">\n     <string>DISABLEKEYUSAGECOUNTER</string>\n     <string>false</string>\n    </void>\n    <void method="put">\n     <string>NAME</string>\n     <string>PlainSigner</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>AUTHORIZED_CLIENTS</string>\n   <object class="java.util.HashSet"/>\n  </void>\n  <void method="put">\n   <string>AUTHORIZED_CLIENTS_GEN2</string>\n   <object class="java.util.HashSet"/>\n  </void>\n  <void method="put">\n   <string>CLASSPATH</string>\n   <string>org.signserver.common.WorkerConfig</string>\n  </void>\n </object>\n</java>\n	PlainSigner	2
3	<?xml version="1.0" encoding="UTF-8"?>\n<java version="11.0.20" class="java.beans.XMLDecoder">\n <object class="org.cesecore.util.Base64PutHashMap">\n  <void method="put">\n   <string>version</string>\n   <float>2.0</float>\n  </void>\n  <void method="put">\n   <string>PROPERTIES</string>\n   <object class="java.util.Properties">\n    <void method="put">\n     <string>CRYPTOTOKEN</string>\n     <string>CryptoTokenInternal</string>\n    </void>\n    <void method="put">\n     <string>ACCEPTANYPOLICY</string>\n     <string>true</string>\n    </void>\n    <void method="put">\n     <string>AUTHTYPE</string>\n     <string>NOAUTH</string>\n    </void>\n    <void method="put">\n     <string>IMPLEMENTATION_CLASS</string>\n     <string>org.signserver.module.tsa.TimeStampSigner</string>\n    </void>\n    <void method="put">\n     <string>DEFAULTKEY</string>\n     <string>timeStamp</string>\n    </void>\n    <void method="put">\n     <string>ACCEPTEDALGORITHMS</string>\n     <string>SHA256;SHA384;SHA512</string>\n    </void>\n    <void method="put">\n     <string>VERIFY_TOKEN_SIGNATURE</string>\n     <string>true</string>\n    </void>\n    <void method="put">\n     <string>TYPE</string>\n     <string>PROCESSABLE</string>\n    </void>\n    <void method="put">\n     <string>DEFAULTTSAPOLICYOID</string>\n     <string>1.3.6.1.4.1.22408.1.2.3.45</string>\n    </void>\n    <void method="put">\n     <string>DISABLEKEYUSAGECOUNTER</string>\n     <string>false</string>\n    </void>\n    <void method="put">\n     <string>NAME</string>\n     <string>TimeStampSigner</string>\n    </void>\n   </object>\n  </void>\n  <void method="put">\n   <string>AUTHORIZED_CLIENTS</string>\n   <object class="java.util.HashSet"/>\n  </void>\n  <void method="put">\n   <string>AUTHORIZED_CLIENTS_GEN2</string>\n   <object class="java.util.HashSet"/>\n  </void>\n  <void method="put">\n   <string>CLASSPATH</string>\n   <string>org.signserver.common.WorkerConfig</string>\n  </void>\n </object>\n</java>\n	TimeStampSigner	2
\.


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: -
--

BEGIN;

SELECT pg_catalog.lo_open('17163', 131072);
SELECT pg_catalog.lowrite(0, '\x74727565');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17164', 131072);
SELECT pg_catalog.lowrite(0, '\x313632353661636536653064633266343731343661343465326131316363613133613339613132302c434e3d436f6d6d756e69747920446179732032303234205375622045432047312c204f553d43657274696669636174696f6e20417574686f72697465732c204f3d4b6579666163746f722c20433d53453b');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17165', 131072);
SELECT pg_catalog.lowrite(0, '\x313632353661636536653064633266343731343661343465326131316363613133613339613132302c434e3d436f6d6d756e69747920446179732032303234205375622045432047312c204f553d43657274696669636174696f6e20417574686f72697465732c204f3d4b6579666163746f722c20433d53453b');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17166', 131072);
SELECT pg_catalog.lowrite(0, '\x313632353661636536653064633266343731343661343465326131316363613133613339613132302c434e3d436f6d6d756e69747920446179732032303234205375622045432047312c204f553d43657274696669636174696f6e20417574686f72697465732c204f3d4b6579666163746f722c20433d53453b');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17167', 131072);
SELECT pg_catalog.lowrite(0, '\x66616c7365');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('25315', 131072);
SELECT pg_catalog.lowrite(0, '\x74727565');
SELECT pg_catalog.lo_close(0);

COMMIT;

--
-- Name: archivedata archivedata_pkey; Type: CONSTRAINT; Schema: public; Owner: signserver
--

ALTER TABLE ONLY public.archivedata
    ADD CONSTRAINT archivedata_pkey PRIMARY KEY (uniqueid);


--
-- Name: auditrecorddata auditrecorddata_pkey; Type: CONSTRAINT; Schema: public; Owner: signserver
--

ALTER TABLE ONLY public.auditrecorddata
    ADD CONSTRAINT auditrecorddata_pkey PRIMARY KEY (pk);


--
-- Name: globalconfigdata globalconfigdata_pkey; Type: CONSTRAINT; Schema: public; Owner: signserver
--

ALTER TABLE ONLY public.globalconfigdata
    ADD CONSTRAINT globalconfigdata_pkey PRIMARY KEY (propertykey);


--
-- Name: keydata keydata_pkey; Type: CONSTRAINT; Schema: public; Owner: signserver
--

ALTER TABLE ONLY public.keydata
    ADD CONSTRAINT keydata_pkey PRIMARY KEY (keyalias);


--
-- Name: keyusagecounter keyusagecounter_pkey; Type: CONSTRAINT; Schema: public; Owner: signserver
--

ALTER TABLE ONLY public.keyusagecounter
    ADD CONSTRAINT keyusagecounter_pkey PRIMARY KEY (keyhash);


--
-- Name: signerconfigdata signerconfigdata_pkey; Type: CONSTRAINT; Schema: public; Owner: signserver
--

ALTER TABLE ONLY public.signerconfigdata
    ADD CONSTRAINT signerconfigdata_pkey PRIMARY KEY (signerid);


--
-- PostgreSQL database dump complete
--

