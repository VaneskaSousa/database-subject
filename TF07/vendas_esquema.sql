--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.3

-- Started on 2020-08-31 14:58:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12361)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16667)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categoria (
    id integer NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE categoria OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16673)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categoria_id_seq OWNER TO postgres;

--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 182
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;


--
-- TOC entry 183 (class 1259 OID 16675)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    usuario_id integer NOT NULL
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16678)
-- Name: estoque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estoque (
    filial_id integer NOT NULL,
    produto_id integer NOT NULL,
    quantidade integer NOT NULL
);


ALTER TABLE estoque OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16681)
-- Name: filial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE filial (
    id integer NOT NULL,
    razao_social character varying NOT NULL,
    endereco character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE filial OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16687)
-- Name: filial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filial_id_seq OWNER TO postgres;

--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 186
-- Name: filial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filial_id_seq OWNED BY filial.id;


--
-- TOC entry 187 (class 1259 OID 16689)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcionario (
    usuario_id integer NOT NULL,
    salario numeric NOT NULL
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16695)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto (
    id integer NOT NULL,
    descricao character varying NOT NULL,
    preco numeric NOT NULL
);


ALTER TABLE produto OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16701)
-- Name: produto_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto_categoria (
    produto_id integer NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE produto_categoria OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16704)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produto_id_seq OWNER TO postgres;

--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 190
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_id_seq OWNED BY produto.id;


--
-- TOC entry 191 (class 1259 OID 16706)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id integer NOT NULL,
    nome character varying NOT NULL,
    endereco character varying NOT NULL,
    email character varying NOT NULL,
    login character varying NOT NULL,
    senha character varying NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16712)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO postgres;

--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 192
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- TOC entry 193 (class 1259 OID 16714)
-- Name: usuario_telefone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario_telefone (
    usuario_id integer NOT NULL,
    ddd integer NOT NULL,
    numero numeric NOT NULL
);


ALTER TABLE usuario_telefone OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16720)
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE venda (
    id integer NOT NULL,
    data timestamp without time zone NOT NULL,
    cliente_id integer NOT NULL,
    funcionario_id integer NOT NULL,
    filial_id integer NOT NULL
);


ALTER TABLE venda OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16723)
-- Name: venda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE venda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE venda_id_seq OWNER TO postgres;

--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 195
-- Name: venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE venda_id_seq OWNED BY venda.id;


--
-- TOC entry 196 (class 1259 OID 16725)
-- Name: venda_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE venda_item (
    venda_id integer NOT NULL,
    produto_id integer NOT NULL,
    quantidade integer NOT NULL
);


ALTER TABLE venda_item OWNER TO postgres;

--
-- TOC entry 2039 (class 2604 OID 16728)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);


--
-- TOC entry 2040 (class 2604 OID 16729)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filial ALTER COLUMN id SET DEFAULT nextval('filial_id_seq'::regclass);


--
-- TOC entry 2041 (class 2604 OID 16730)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN id SET DEFAULT nextval('produto_id_seq'::regclass);


--
-- TOC entry 2042 (class 2604 OID 16731)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- TOC entry 2043 (class 2604 OID 16732)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda ALTER COLUMN id SET DEFAULT nextval('venda_id_seq'::regclass);


--
-- TOC entry 2045 (class 2606 OID 16734)
-- Name: categoria_descricao_ukey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_descricao_ukey UNIQUE (descricao);


--
-- TOC entry 2047 (class 2606 OID 16736)
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 2049 (class 2606 OID 16738)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (usuario_id);


--
-- TOC entry 2051 (class 2606 OID 16740)
-- Name: estoque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (filial_id, produto_id);


--
-- TOC entry 2053 (class 2606 OID 16742)
-- Name: filial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filial
    ADD CONSTRAINT filial_pkey PRIMARY KEY (id);


--
-- TOC entry 2055 (class 2606 OID 16744)
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (usuario_id);


--
-- TOC entry 2059 (class 2606 OID 16746)
-- Name: produto_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT produto_categoria_pkey PRIMARY KEY (produto_id, categoria_id);


--
-- TOC entry 2057 (class 2606 OID 16748)
-- Name: produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2061 (class 2606 OID 16750)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2063 (class 2606 OID 16752)
-- Name: usuario_telefone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_telefone
    ADD CONSTRAINT usuario_telefone_pkey PRIMARY KEY (usuario_id, ddd, numero);


--
-- TOC entry 2067 (class 2606 OID 16754)
-- Name: venda_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda_item
    ADD CONSTRAINT venda_item_pkey PRIMARY KEY (venda_id, produto_id);


--
-- TOC entry 2065 (class 2606 OID 16756)
-- Name: venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (id);


--
-- TOC entry 2068 (class 2606 OID 16757)
-- Name: cliente_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2069 (class 2606 OID 16762)
-- Name: estoque_filial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estoque
    ADD CONSTRAINT estoque_filial_id_fkey FOREIGN KEY (filial_id) REFERENCES filial(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2070 (class 2606 OID 16767)
-- Name: estoque_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estoque
    ADD CONSTRAINT estoque_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES produto(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2071 (class 2606 OID 16772)
-- Name: funcionario_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2072 (class 2606 OID 16777)
-- Name: produto_categoria_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT produto_categoria_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES categoria(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2073 (class 2606 OID 16782)
-- Name: produto_categoria_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT produto_categoria_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES produto(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2074 (class 2606 OID 16787)
-- Name: usuario_telefone_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_telefone
    ADD CONSTRAINT usuario_telefone_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2075 (class 2606 OID 16792)
-- Name: venda_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES cliente(usuario_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2076 (class 2606 OID 16797)
-- Name: venda_filial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_filial_id_fkey FOREIGN KEY (filial_id) REFERENCES filial(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2077 (class 2606 OID 16802)
-- Name: venda_funcionario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_funcionario_id_fkey FOREIGN KEY (funcionario_id) REFERENCES funcionario(usuario_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2078 (class 2606 OID 16807)
-- Name: venda_item_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda_item
    ADD CONSTRAINT venda_item_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES produto(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2079 (class 2606 OID 16812)
-- Name: venda_item_venda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda_item
    ADD CONSTRAINT venda_item_venda_id_fkey FOREIGN KEY (venda_id) REFERENCES venda(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 181
-- Name: categoria; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE categoria FROM PUBLIC;
REVOKE ALL ON TABLE categoria FROM postgres;
GRANT ALL ON TABLE categoria TO postgres;

--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 183
-- Name: cliente; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cliente FROM PUBLIC;
REVOKE ALL ON TABLE cliente FROM postgres;
GRANT ALL ON TABLE cliente TO postgres;

--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 184
-- Name: estoque; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE estoque FROM PUBLIC;
REVOKE ALL ON TABLE estoque FROM postgres;
GRANT ALL ON TABLE estoque TO postgres;

--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 185
-- Name: filial; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE filial FROM PUBLIC;
REVOKE ALL ON TABLE filial FROM postgres;
GRANT ALL ON TABLE filial TO postgres;

--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 187
-- Name: funcionario; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE funcionario FROM PUBLIC;
REVOKE ALL ON TABLE funcionario FROM postgres;
GRANT ALL ON TABLE funcionario TO postgres;

--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 188
-- Name: produto; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE produto FROM PUBLIC;
REVOKE ALL ON TABLE produto FROM postgres;
GRANT ALL ON TABLE produto TO postgres;

--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 189
-- Name: produto_categoria; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE produto_categoria FROM PUBLIC;
REVOKE ALL ON TABLE produto_categoria FROM postgres;
GRANT ALL ON TABLE produto_categoria TO postgres;

--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 191
-- Name: usuario; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE usuario FROM PUBLIC;
REVOKE ALL ON TABLE usuario FROM postgres;
GRANT ALL ON TABLE usuario TO postgres;

--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 193
-- Name: usuario_telefone; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE usuario_telefone FROM PUBLIC;
REVOKE ALL ON TABLE usuario_telefone FROM postgres;
GRANT ALL ON TABLE usuario_telefone TO postgres;

--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 194
-- Name: venda; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE venda FROM PUBLIC;
REVOKE ALL ON TABLE venda FROM postgres;
GRANT ALL ON TABLE venda TO postgres;

--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 196
-- Name: venda_item; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE venda_item FROM PUBLIC;
REVOKE ALL ON TABLE venda_item FROM postgres;
GRANT ALL ON TABLE venda_item TO postgres;

-- Completed on 2020-08-31 14:58:07

--
-- PostgreSQL database dump complete
--
