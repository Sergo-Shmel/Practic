PGDMP  +    #                |            practice    16.2    16.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    114730    practice    DATABASE     j   CREATE DATABASE practice WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE practice;
                postgres    false            �            1259    114732    logs    TABLE     �   CREATE TABLE public.logs (
    id integer NOT NULL,
    ip character varying(15),
    "timestamp" timestamp without time zone,
    method character varying(10),
    url character varying(255),
    status integer,
    user_agent text
);
    DROP TABLE public.logs;
       public         heap    postgres    false            �            1259    114731    logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.logs_id_seq;
       public          postgres    false    216                       0    0    logs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;
          public          postgres    false    215            �            1259    114741    users    TABLE        CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50),
    password character varying(50)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    114740    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    218                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    217            z           2604    114735    logs id    DEFAULT     b   ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);
 6   ALTER TABLE public.logs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            {           2604    114744    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218                      0    114732    logs 
   TABLE DATA           T   COPY public.logs (id, ip, "timestamp", method, url, status, user_agent) FROM stdin;
    public          postgres    false    216   �                 0    114741    users 
   TABLE DATA           7   COPY public.users (id, username, password) FROM stdin;
    public          postgres    false    218                     0    0    logs_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.logs_id_seq', 5, true);
          public          postgres    false    215                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    217            }           2606    114739    logs logs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_pkey;
       public            postgres    false    216                       2606    114746    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218               Y   x�3�4�4�34��3�3�4202�50"C#+ �tw����KI���(���1��ͯ���I�7�3�2��c�M0��S�M����� BlM�            x�3�LL����,H,..�/J����� QJr     