PGDMP  1    "                |         
   Biblioteca    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16406 
   Biblioteca    DATABASE     �   CREATE DATABASE "Biblioteca" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Biblioteca";
                postgres    false            �            1259    16407    author    TABLE     �   CREATE TABLE public.author (
    author_id integer NOT NULL,
    name character varying(100),
    nationality character varying(50)
);
    DROP TABLE public.author;
       public         heap    postgres    false            �            1259    16417    book    TABLE     �   CREATE TABLE public.book (
    book_id integer NOT NULL,
    title character varying(100),
    genre character varying(50),
    publication_year integer,
    publisher_id integer
);
    DROP TABLE public.book;
       public         heap    postgres    false            �            1259    16427    book_author    TABLE     b   CREATE TABLE public.book_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);
    DROP TABLE public.book_author;
       public         heap    postgres    false            �            1259    16412 	   publisher    TABLE     �   CREATE TABLE public.publisher (
    publisher_id integer NOT NULL,
    name character varying(100),
    country character varying(50)
);
    DROP TABLE public.publisher;
       public         heap    postgres    false            �          0    16407    author 
   TABLE DATA           >   COPY public.author (author_id, name, nationality) FROM stdin;
    public          postgres    false    215   q       �          0    16417    book 
   TABLE DATA           U   COPY public.book (book_id, title, genre, publication_year, publisher_id) FROM stdin;
    public          postgres    false    217   �       �          0    16427    book_author 
   TABLE DATA           9   COPY public.book_author (book_id, author_id) FROM stdin;
    public          postgres    false    218   T       �          0    16412 	   publisher 
   TABLE DATA           @   COPY public.publisher (publisher_id, name, country) FROM stdin;
    public          postgres    false    216   }       &           2606    16411    author author_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);
 <   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pkey;
       public            postgres    false    215            ,           2606    16431    book_author book_author_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_pkey PRIMARY KEY (book_id, author_id);
 F   ALTER TABLE ONLY public.book_author DROP CONSTRAINT book_author_pkey;
       public            postgres    false    218    218            *           2606    16421    book book_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public            postgres    false    217            (           2606    16416    publisher publisher_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (publisher_id);
 B   ALTER TABLE ONLY public.publisher DROP CONSTRAINT publisher_pkey;
       public            postgres    false    216            -           2606    16422    book book_publisher_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_publisher_id_fkey FOREIGN KEY (publisher_id) REFERENCES public.publisher(publisher_id);
 E   ALTER TABLE ONLY public.book DROP CONSTRAINT book_publisher_id_fkey;
       public          postgres    false    217    4648    216            .           2606    16437    book_author fk_author    FK CONSTRAINT     ~   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES public.author(author_id);
 ?   ALTER TABLE ONLY public.book_author DROP CONSTRAINT fk_author;
       public          postgres    false    215    4646    218            /           2606    16432    book_author fk_book    FK CONSTRAINT     v   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES public.book(book_id);
 =   ALTER TABLE ONLY public.book_author DROP CONSTRAINT fk_book;
       public          postgres    false    217    4650    218            �   N   x�3�tO�/JOU�/*O���t*�,9�0/39�ˈ�+1/U����$5Y�7�([!�<13��17�(391/�+F��� q      �   u   x�3�4��0�t�,.9�� 39�7��4�2��/J/���W�T(J�*�L�����M�KN�4�04�4�2��I,VH,K�+)-�RR<J��sR�R��*�2��8��@=@��b���� ��$       �      x�3�4�2�4�2�4����� A      �   N   x�3���L*�/VHIU(��K?�'3/��3(H)��e��sq��'���$��R��3SS@"�i�E)(b���� ��.     