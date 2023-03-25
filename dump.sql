--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)

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
-- Name: hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    name character varying(100)
);


--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    description text,
    url text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: posts_hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts_hashtags (
    id integer NOT NULL,
    post_id integer NOT NULL,
    hashtag_id integer NOT NULL
);


--
-- Name: posts_hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_hashtags_id_seq OWNED BY public.posts_hashtags.id;


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: posts_likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts_likes (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: posts_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_likes_id_seq OWNED BY public.posts_likes.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    picture_url text
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: posts_hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_hashtags ALTER COLUMN id SET DEFAULT nextval('public.posts_hashtags_id_seq'::regclass);


--
-- Name: posts_likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_likes ALTER COLUMN id SET DEFAULT nextval('public.posts_likes_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (1, 'descriçãozinha marota 8', 'http://', '2023-03-22 21:37:16.160864');
INSERT INTO public.posts VALUES (2, 'descriçãozinha marota 9', 'http://', '2023-03-23 01:57:23.094195');
INSERT INTO public.posts VALUES (3, 'descriçãozinha marota 9', 'http://', '2023-03-23 01:57:26.403471');
INSERT INTO public.posts VALUES (4, 'descriçãozinha marota 9', 'http://', '2023-03-23 01:59:29.392432');
INSERT INTO public.posts VALUES (5, 'descriçãozinha marota 18', 'http://', '2023-03-23 01:59:38.168045');
INSERT INTO public.posts VALUES (6, 'googlezada rapeize', 'http://www.google.com', '2023-03-23 02:00:53.850143');
INSERT INTO public.posts VALUES (7, 'googlezada rapeize', 'http://www.google.com', '2023-03-23 02:49:25.346286');
INSERT INTO public.posts VALUES (8, 'googlezada rapeize', 'http://www.google.com', '2023-03-23 02:49:59.388957');
INSERT INTO public.posts VALUES (9, 'site para ver videos legais #videos #yt', 'http://www.youtube.com', '2023-03-23 02:58:24.23038');
INSERT INTO public.posts VALUES (10, 'site para comprar seus setup gamer #games #pczila', 'http://www.kabum.com', '2023-03-23 03:00:13.058223');
INSERT INTO public.posts VALUES (11, 'googlezada rapeize', 'http://www.google.com', '2023-03-24 19:05:49.895666');


--
-- Data for Name: posts_hashtags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts_likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 'a2fff05f-f1e9-4a89-8182-54e332245945', 1);
INSERT INTO public.sessions VALUES (2, '0f54bcbb-954a-42f7-bb2c-a8630fde712e', 1);
INSERT INTO public.sessions VALUES (3, '1666423d-354b-429d-824b-c7884314b3e4', 1);
INSERT INTO public.sessions VALUES (4, '89daabbf-3b57-4739-9d5e-a9f152eae744', 1);
INSERT INTO public.sessions VALUES (5, '1c2abf76-9ab1-4b98-a564-ce8e30bf96c5', 1);
INSERT INTO public.sessions VALUES (6, 'e13a2c00-26d8-439f-91ef-e1ecc2b69aa2', 1);
INSERT INTO public.sessions VALUES (7, '5201eeb7-0542-4a39-815c-434eef86384d', 1);
INSERT INTO public.sessions VALUES (8, 'e1243c2a-9397-440e-8ce4-0c4d5b3f72f4', 1);
INSERT INTO public.sessions VALUES (9, '81cbf0e3-4392-426a-81a5-4e5e7a05f4c1', 1);
INSERT INTO public.sessions VALUES (10, '921b5fb9-ddbd-4a87-9ecf-cf039ea22c9a', 1);
INSERT INTO public.sessions VALUES (11, '17c06af5-9d4e-4254-89f1-23eb428297f1', 1);
INSERT INTO public.sessions VALUES (12, '26dd9944-5f23-4c12-852d-d42086567bb8', 1);
INSERT INTO public.sessions VALUES (13, 'c85b24d6-a7c4-4c8f-bffd-d71eefc15ffe', 1);
INSERT INTO public.sessions VALUES (14, '662e657c-8ec8-4719-8785-594eb25d0f3f', 1);
INSERT INTO public.sessions VALUES (15, '982beb7a-b5ce-4e11-9d44-6d2d0ca56db6', 1);
INSERT INTO public.sessions VALUES (16, 'c4120302-8446-473b-ba6d-28090663d9c1', 2);
INSERT INTO public.sessions VALUES (17, '5e16e8e1-1b21-4330-8109-de3f5a7552a3', 2);
INSERT INTO public.sessions VALUES (18, '989359cc-9d8a-4a41-b097-f654e24b508a', 2);
INSERT INTO public.sessions VALUES (19, 'b63d36fd-314f-4b0c-a332-ebae19fbbcf7', 1);
INSERT INTO public.sessions VALUES (20, '4fcbd322-8733-41fc-aa44-aee43653c9b0', 2);
INSERT INTO public.sessions VALUES (21, '2e0887b5-4feb-4b13-b0bd-f2844bcb7b83', 1);
INSERT INTO public.sessions VALUES (22, '52682d2d-f36c-4eca-9862-31c195f8ab91', 2);
INSERT INTO public.sessions VALUES (23, '6d959d7b-7fce-4800-a1a7-bd4b2e93518b', 1);
INSERT INTO public.sessions VALUES (24, '90a82b5b-fcb6-428d-ab12-08fe63261a05', 2);
INSERT INTO public.sessions VALUES (25, 'd742adfc-c1e8-498b-8b1c-5f550975a32b', 1);
INSERT INTO public.sessions VALUES (26, '515e6381-744a-446e-a228-141d17dcee8c', 1);
INSERT INTO public.sessions VALUES (27, 'bc5c25d8-a124-457e-8521-f2239ae6f1ef', 1);
INSERT INTO public.sessions VALUES (28, 'de5d49b4-2578-4d60-8469-d04336cf8ec5', 2);
INSERT INTO public.sessions VALUES (29, '75754ff0-0b51-4849-a368-d457e3470701', 2);
INSERT INTO public.sessions VALUES (30, '615a16f7-6b3b-4350-a5de-4cfad110be6a', 2);
INSERT INTO public.sessions VALUES (31, '18b7dc41-95ff-44ea-ba2b-74f02da83863', 2);
INSERT INTO public.sessions VALUES (32, '4a70cfce-583d-4c71-bcf6-6291570ad12c', 2);
INSERT INTO public.sessions VALUES (33, 'd5a82d5a-87af-46bf-b1cb-d69810a345ef', 2);
INSERT INTO public.sessions VALUES (34, '480073cb-c848-4a9b-9144-ff287ac28472', 1);
INSERT INTO public.sessions VALUES (35, 'd88a6de7-dcad-48f5-9c29-d092b0c243d1', 1);
INSERT INTO public.sessions VALUES (36, '5eab82a2-e648-4aca-8ab3-24ae60ba3827', 1);
INSERT INTO public.sessions VALUES (37, 'dc35dcb6-f7fb-41b7-93ae-9d715b6d065b', 1);
INSERT INTO public.sessions VALUES (38, 'bf46f3c5-725c-4c32-9434-a3b0f145e224', 1);
INSERT INTO public.sessions VALUES (39, '98f17951-6693-4e11-9b38-8036f95b0e78', 1);
INSERT INTO public.sessions VALUES (40, 'c8d13d1b-7d29-4b61-b353-7da407a04922', 1);
INSERT INTO public.sessions VALUES (41, '9d17b2b2-894f-43c8-8dc5-e5fc86ce1269', 4);
INSERT INTO public.sessions VALUES (42, 'e7f0837d-d360-4ff2-888a-e950df6f2e11', 4);
INSERT INTO public.sessions VALUES (43, '7788773a-e694-4601-9d52-668c93246837', 4);
INSERT INTO public.sessions VALUES (44, '05a7f1b1-e1b1-44ae-98db-ddef3b597f4a', 4);
INSERT INTO public.sessions VALUES (45, 'bc36eb4a-25a0-47a0-b603-5c23b833c147', 4);
INSERT INTO public.sessions VALUES (46, 'ad7aaf3c-487a-4cb7-9522-65c0fab10ec7', 4);
INSERT INTO public.sessions VALUES (47, '5914435b-9d46-4514-9c4c-107b1a45e1a2', 4);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'luke', 'luke@email.com', '$2b$10$CIBsA.lURg46wMvGn1G9kOMLTGUX64cHl1OXWaj5/995tiGG21/vq', 'https://gartic.com.br/imgs/mural/ca/carlosantos1907/queixo-rubro.png');
INSERT INTO public.users VALUES (3, 'paco', 'paco@email.com', '$2b$10$n1OfgLHt6ZaRPZvKZCTMY.2Gf04UP4yPeKv0r2A/u2dxQ5caKYM0.', '');
INSERT INTO public.users VALUES (2, 'zer0', 'zer0@email.com', '$2b$10$0R4gYs6QdH4s8GaAbiH5.ezzXznkVE4pHxppSTYcYWF3u/.KTWyFW', '');
INSERT INTO public.users VALUES (4, 'paco2', 'pac2o@email.com', '$2b$10$CSv7Lmc83xYg1jg5RCrE1e5m2FmepYxnSvLXaNwd/3uwDZeI5TAzC', '');


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 1, false);


--
-- Name: posts_hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_hashtags_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 11, true);


--
-- Name: posts_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_likes_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 47, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: posts_hashtags posts_hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_hashtags
    ADD CONSTRAINT posts_hashtags_pkey PRIMARY KEY (id);


--
-- Name: posts_likes posts_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_likes
    ADD CONSTRAINT posts_likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: posts_hashtags posts_hashtags_hashtag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_hashtags
    ADD CONSTRAINT posts_hashtags_hashtag_id_fkey FOREIGN KEY (hashtag_id) REFERENCES public.hashtags(id);


--
-- Name: posts_hashtags posts_hashtags_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_hashtags
    ADD CONSTRAINT posts_hashtags_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: posts_likes posts_likes_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_likes
    ADD CONSTRAINT posts_likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: posts_likes posts_likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_likes
    ADD CONSTRAINT posts_likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

