PGDMP  ,                    }            arch_vision_db    17.5    17.5     ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            /           1262    16388    arch_vision_db    DATABASE     �   CREATE DATABASE arch_vision_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE arch_vision_db;
                     postgres    false            �            1259    16395    db    TABLE     A  CREATE TABLE public.db (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(20),
    description text,
    services text[],
    date date,
    "time" time without time zone,
    created_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.db;
       public         heap r       postgres    false            �            1259    16394 	   db_id_seq    SEQUENCE     �   CREATE SEQUENCE public.db_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.db_id_seq;
       public               postgres    false    218            0           0    0 	   db_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE public.db_id_seq OWNED BY public.db.id;
          public               postgres    false    217            �            1259    16407    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    phone character varying(20),
    created_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16406    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    220            1           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    219            �           2604    16398    db id    DEFAULT     ^   ALTER TABLE ONLY public.db ALTER COLUMN id SET DEFAULT nextval('public.db_id_seq'::regclass);
 4   ALTER TABLE public.db ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �           2604    16410    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            '          0    16395    db 
   TABLE DATA           e   COPY public.db (id, name, email, phone, description, services, date, "time", created_at) FROM stdin;
    public               postgres    false    218   ?       )          0    16407    users 
   TABLE DATA           M   COPY public.users (id, name, email, password, phone, created_at) FROM stdin;
    public               postgres    false    220   \       2           0    0 	   db_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.db_id_seq', 1, false);
          public               postgres    false    217            3           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 7, true);
          public               postgres    false    219            �           2606    16403 
   db db_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY public.db
    ADD CONSTRAINT db_pkey PRIMARY KEY (id);
 4   ALTER TABLE ONLY public.db DROP CONSTRAINT db_pkey;
       public                 postgres    false    218            �           2606    16417    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    220            �           2606    16415    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    220            '      x������ � �      )      x�3�̮�ή�,.�(K�+)qH�M���K���4426153��4����4202�50�54S04�2��24�3644�0�2�0�¦.�U�1.컰��$1�2����"�8�HsM̭�L,�-��b���� ��1�     