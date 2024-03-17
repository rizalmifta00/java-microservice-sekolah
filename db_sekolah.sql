PGDMP  "                    |            sekolah    16.2    16.2 7    &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            )           1262    26789    sekolah    DATABASE     �   CREATE DATABASE sekolah WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE sekolah;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            *           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    26800    guru    TABLE     v   CREATE TABLE public.guru (
    id bigint NOT NULL,
    nama character varying(255),
    nip character varying(255)
);
    DROP TABLE public.guru;
       public         heap    postgres    false    4            �            1259    26799    guru_id_seq    SEQUENCE     t   CREATE SEQUENCE public.guru_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.guru_id_seq;
       public          postgres    false    218    4            +           0    0    guru_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.guru_id_seq OWNED BY public.guru.id;
          public          postgres    false    217            �            1259    26853    kelas    TABLE     x   CREATE TABLE public.kelas (
    id bigint NOT NULL,
    nama character varying(255),
    nama_angka integer NOT NULL
);
    DROP TABLE public.kelas;
       public         heap    postgres    false    4            �            1259    26852    kelas_id_seq    SEQUENCE     u   CREATE SEQUENCE public.kelas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.kelas_id_seq;
       public          postgres    false    4    220            ,           0    0    kelas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.kelas_id_seq OWNED BY public.kelas.id;
          public          postgres    false    219            �            1259    26860    mata_pelajaran    TABLE     �   CREATE TABLE public.mata_pelajaran (
    id bigint NOT NULL,
    deskripsi character varying(255),
    nama character varying(255),
    guru_id bigint
);
 "   DROP TABLE public.mata_pelajaran;
       public         heap    postgres    false    4            �            1259    26859    mata_pelajaran_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.mata_pelajaran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.mata_pelajaran_id_seq;
       public          postgres    false    222    4            -           0    0    mata_pelajaran_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.mata_pelajaran_id_seq OWNED BY public.mata_pelajaran.id;
          public          postgres    false    221            �            1259    26869    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(20),
    CONSTRAINT roles_name_check CHECK (((name)::text = ANY ((ARRAY['ROLE_USER'::character varying, 'ROLE_ADMIN'::character varying])::text[])))
);
    DROP TABLE public.roles;
       public         heap    postgres    false    4            �            1259    26868    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    4    224            .           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    223            �            1259    26791    siswa    TABLE     �   CREATE TABLE public.siswa (
    id bigint NOT NULL,
    alamat character varying(255),
    kelas character varying(255),
    nama character varying(255),
    jenis_kelamin character varying(255)
);
    DROP TABLE public.siswa;
       public         heap    postgres    false    4            �            1259    26790    siswa_id_seq    SEQUENCE     u   CREATE SEQUENCE public.siswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.siswa_id_seq;
       public          postgres    false    4    216            /           0    0    siswa_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.siswa_id_seq OWNED BY public.siswa.id;
          public          postgres    false    215            �            1259    26876 
   user_roles    TABLE     ^   CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false    4            �            1259    26882    users    TABLE     �   CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(50),
    password character varying(120),
    username character varying(20)
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            �            1259    26881    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    227    4            0           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    226            n           2604    26803    guru id    DEFAULT     b   ALTER TABLE ONLY public.guru ALTER COLUMN id SET DEFAULT nextval('public.guru_id_seq'::regclass);
 6   ALTER TABLE public.guru ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            o           2604    26856    kelas id    DEFAULT     d   ALTER TABLE ONLY public.kelas ALTER COLUMN id SET DEFAULT nextval('public.kelas_id_seq'::regclass);
 7   ALTER TABLE public.kelas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            p           2604    26863    mata_pelajaran id    DEFAULT     v   ALTER TABLE ONLY public.mata_pelajaran ALTER COLUMN id SET DEFAULT nextval('public.mata_pelajaran_id_seq'::regclass);
 @   ALTER TABLE public.mata_pelajaran ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            q           2604    26872    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            m           2604    26794    siswa id    DEFAULT     d   ALTER TABLE ONLY public.siswa ALTER COLUMN id SET DEFAULT nextval('public.siswa_id_seq'::regclass);
 7   ALTER TABLE public.siswa ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            r           2604    26885    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227                      0    26800    guru 
   TABLE DATA           -   COPY public.guru (id, nama, nip) FROM stdin;
    public          postgres    false    218   29                 0    26853    kelas 
   TABLE DATA           5   COPY public.kelas (id, nama, nama_angka) FROM stdin;
    public          postgres    false    220   `9                 0    26860    mata_pelajaran 
   TABLE DATA           F   COPY public.mata_pelajaran (id, deskripsi, nama, guru_id) FROM stdin;
    public          postgres    false    222   �9                  0    26869    roles 
   TABLE DATA           )   COPY public.roles (id, name) FROM stdin;
    public          postgres    false    224   �9                 0    26791    siswa 
   TABLE DATA           G   COPY public.siswa (id, alamat, kelas, nama, jenis_kelamin) FROM stdin;
    public          postgres    false    216   �9       !          0    26876 
   user_roles 
   TABLE DATA           6   COPY public.user_roles (user_id, role_id) FROM stdin;
    public          postgres    false    225    :       #          0    26882    users 
   TABLE DATA           >   COPY public.users (id, email, password, username) FROM stdin;
    public          postgres    false    227   =:       1           0    0    guru_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.guru_id_seq', 1, true);
          public          postgres    false    217            2           0    0    kelas_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.kelas_id_seq', 4, true);
          public          postgres    false    219            3           0    0    mata_pelajaran_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.mata_pelajaran_id_seq', 1, true);
          public          postgres    false    221            4           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          postgres    false    223            5           0    0    siswa_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.siswa_id_seq', 3, true);
          public          postgres    false    215            6           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    226            w           2606    26807    guru guru_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.guru
    ADD CONSTRAINT guru_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.guru DROP CONSTRAINT guru_pkey;
       public            postgres    false    218            y           2606    26858    kelas kelas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.kelas
    ADD CONSTRAINT kelas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.kelas DROP CONSTRAINT kelas_pkey;
       public            postgres    false    220            {           2606    26867 "   mata_pelajaran mata_pelajaran_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.mata_pelajaran
    ADD CONSTRAINT mata_pelajaran_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.mata_pelajaran DROP CONSTRAINT mata_pelajaran_pkey;
       public            postgres    false    222            }           2606    26875    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    224            u           2606    26798    siswa siswa_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.siswa
    ADD CONSTRAINT siswa_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.siswa DROP CONSTRAINT siswa_pkey;
       public            postgres    false    216            �           2606    26891 !   users uk6dotkott2kjsp8vw4d0m25fb7 
   CONSTRAINT     ]   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7;
       public            postgres    false    227            �           2606    26889 !   users ukr43af9ap4edm43mmtq01oddj6 
   CONSTRAINT     `   ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT ukr43af9ap4edm43mmtq01oddj6;
       public            postgres    false    227                       2606    26880    user_roles user_roles_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    225    225            �           2606    26887    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    227            �           2606    26892 &   user_roles fkh8ciramu9cc9q3qcqiv4ue8a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES public.roles(id);
 P   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6;
       public          postgres    false    4733    224    225            �           2606    26897 &   user_roles fkhfh9dx7w3ubf1co1vdev94g3f    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f;
       public          postgres    false    227    225    4741                  x�3�,ʬJ��47232" ����� P�H            x�3�L)M�4����� �c         #   x�3��N�I,V0��M,I���D�?�=... ��)             x������ � �         ;   x�3��J�N,*I���,ʬJ���I���\ƜYI�Ԣ���|$iC��!�=... �k�      !      x������ � �      #      x������ � �     