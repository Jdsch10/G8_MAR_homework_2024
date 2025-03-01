PGDMP      2                |            database_dump    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16442    database_dump    DATABASE     �   CREATE DATABASE database_dump WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE database_dump;
                postgres    false            �            1259    16463    author    TABLE     �   CREATE TABLE public.author (
    author_id integer NOT NULL,
    name character varying(100),
    nationality character varying(50)
);
    DROP TABLE public.author;
       public         heap    postgres    false            �            1259    16473    book    TABLE     �   CREATE TABLE public.book (
    book_id integer NOT NULL,
    title character varying(100),
    genre character varying(50),
    publication_year integer,
    publisher_id integer
);
    DROP TABLE public.book;
       public         heap    postgres    false            �            1259    16483    book_author    TABLE     b   CREATE TABLE public.book_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);
    DROP TABLE public.book_author;
       public         heap    postgres    false            �            1259    16468 	   publisher    TABLE     �   CREATE TABLE public.publisher (
    publisher_id integer NOT NULL,
    name character varying(100),
    country character varying(50)
);
    DROP TABLE public.publisher;
       public         heap    postgres    false            �          0    16463    author 
   TABLE DATA           >   COPY public.author (author_id, name, nationality) FROM stdin;
    public          postgres    false    215   �       �          0    16473    book 
   TABLE DATA           U   COPY public.book (book_id, title, genre, publication_year, publisher_id) FROM stdin;
    public          postgres    false    217   W       �          0    16483    book_author 
   TABLE DATA           9   COPY public.book_author (book_id, author_id) FROM stdin;
    public          postgres    false    218   �       �          0    16468 	   publisher 
   TABLE DATA           @   COPY public.publisher (publisher_id, name, country) FROM stdin;
    public          postgres    false    216   ,       &           2606    16467    author author_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);
 <   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pkey;
       public            postgres    false    215            ,           2606    16487    book_author book_author_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_pkey PRIMARY KEY (book_id, author_id);
 F   ALTER TABLE ONLY public.book_author DROP CONSTRAINT book_author_pkey;
       public            postgres    false    218    218            *           2606    16477    book book_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public            postgres    false    217            (           2606    16472    publisher publisher_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (publisher_id);
 B   ALTER TABLE ONLY public.publisher DROP CONSTRAINT publisher_pkey;
       public            postgres    false    216            .           2606    16493 &   book_author book_author_author_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.author(author_id);
 P   ALTER TABLE ONLY public.book_author DROP CONSTRAINT book_author_author_id_fkey;
       public          postgres    false    218    4646    215            /           2606    16488 $   book_author book_author_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id);
 N   ALTER TABLE ONLY public.book_author DROP CONSTRAINT book_author_book_id_fkey;
       public          postgres    false    217    218    4650            -           2606    16478    book book_publisher_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_publisher_id_fkey FOREIGN KEY (publisher_id) REFERENCES public.publisher(publisher_id);
 E   ALTER TABLE ONLY public.book DROP CONSTRAINT book_publisher_id_fkey;
       public          postgres    false    216    217    4648            �   h   x�3�tO�/JOU�/*O���t*�,�,��2��J�KUp,-.I̓��pz�y�)��d�ÅM��A@�������ޘ�7�([!�<13��91/1([������ ��&~      �   �   x�M�1
�@�z�ӥ,�e����i�u�!2+�c�s��X�*�>�}~��E�k��a�v�ϙz�qÆE~��J(L	�۵��ɀ:v�!�e�xHx� �ui[�g���<lC߳�Y���!�_�ĳÑ���[r[֙Gc��/4�      �   "   x�3�4�2�4�2�4�2�4҆@ڈ+F��� 5k�      �   \   x�3�H�K/��Sp���.���,IMQ���KO���2���H�/JQ ���g�T*�c(4��H,*H-r����̃K�$��s��qqq ӵ$_     