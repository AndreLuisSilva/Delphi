-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 1.2.0-alpha1
-- PostgreSQL version: 17.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
CREATE DATABASE new_database;
-- ddl-end --


-- object: public.usuarios | type: TABLE --
-- DROP TABLE IF EXISTS public.usuarios CASCADE;
CREATE TABLE public.usuarios (
	id varchar(36) NOT NULL,
	nome varchar(50) NOT NULL,
	login varchar(20) NOT NULL,
	senha varchar(20) NOT NULL,
	status character(1) NOT NULL,
	data date NOT NULL,
	CONSTRAINT usuarios_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.usuarios OWNER TO postgres;
-- ddl-end --

-- object: public.caixa | type: TABLE --
-- DROP TABLE IF EXISTS public.caixa CASCADE;
CREATE TABLE public.caixa (
	id varchar(36) NOT NULL,
	numero_doc varchar(20) NOT NULL,
	descricao varchar(200),
	valor decimal(18,2) NOT NULL,
	tipo character(1) NOT NULL,
	data_cadastro date NOT NULL,
	CONSTRAINT caixa_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.caixa OWNER TO postgres;
-- ddl-end --

-- object: public.contas_pagar | type: TABLE --
-- DROP TABLE IF EXISTS public.contas_pagar CASCADE;
CREATE TABLE public.contas_pagar (
	id varchar(36) NOT NULL,
	numero_documento varchar(20) NOT NULL,
	descricao varchar(200),
	parcela integer NOT NULL,
	valor_parcela decimal(18,2) NOT NULL,
	valor_compra decimal(18,2) NOT NULL,
	valor_abatido decimal(18,2) NOT NULL,
	data_compra date NOT NULL,
	data_cadastro date NOT NULL,
	data_vencimento date NOT NULL,
	data_pagamento date,
	status character(1) NOT NULL,
	CONSTRAINT contas_pagar_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.contas_pagar OWNER TO postgres;
-- ddl-end --

-- object: public.contas_receber | type: TABLE --
-- DROP TABLE IF EXISTS public.contas_receber CASCADE;
CREATE TABLE public.contas_receber (
	id varchar(36) NOT NULL,
	numero_documento varchar(20) NOT NULL,
	descricao varchar(200),
	parcela integer NOT NULL,
	valor_parcela decimal(18,2) NOT NULL,
	valor_compra decimal(18,2) NOT NULL,
	valor_abatido decimal(18,2) NOT NULL,
	data_compra date NOT NULL,
	data_cadastro date NOT NULL,
	data_vencimento date NOT NULL,
	data_pagamento date,
	status character(1) NOT NULL,
	CONSTRAINT contas_receber_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.contas_receber OWNER TO postgres;
-- ddl-end --

-- object: public.contas_pagar_detalhes | type: TABLE --
-- DROP TABLE IF EXISTS public.contas_pagar_detalhes CASCADE;
CREATE TABLE public.contas_pagar_detalhes (
	id varchar(36) NOT NULL,
	id_conta_pagar integer NOT NULL,
	detalhes varchar(200) NOT NULL,
	valor decimal(18,2) NOT NULL,
	data date NOT NULL,
	usuario varchar(50) NOT NULL,
	CONSTRAINT contas_pagar_detalhes_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.contas_pagar_detalhes OWNER TO postgres;
-- ddl-end --

-- object: public.contas_receber_detalhes | type: TABLE --
-- DROP TABLE IF EXISTS public.contas_receber_detalhes CASCADE;
CREATE TABLE public.contas_receber_detalhes (
	id varchar(36) NOT NULL,
	id_contas_receber integer NOT NULL,
	detalhes varchar(200) NOT NULL,
	valor decimal(18,2) NOT NULL,
	data date NOT NULL,
	usuario varchar(50) NOT NULL,
	CONSTRAINT contas_receber_detalhes_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.contas_receber_detalhes OWNER TO postgres;
-- ddl-end --


