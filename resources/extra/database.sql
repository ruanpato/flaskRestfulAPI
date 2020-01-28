-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: "Person" | type: TABLE --
-- DROP TABLE IF EXISTS "Person" CASCADE;
CREATE TABLE "Person" (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(255) NOT NULL,
	title varchar(255),
	email varchar(255) NOT NULL,
	birthday date NOT NULL,
	"id_Contact" integer,
	CONSTRAINT "Person_pk" PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE "Person" OWNER TO postgres;
-- ddl-end --

-- object: "Person_Role" | type: TABLE --
-- DROP TABLE IF EXISTS "Person_Role" CASCADE;
CREATE TABLE "Person_Role" (
	"id_Role" integer,
	"id_Person" integer
);
-- ddl-end --
-- ALTER TABLE "Person_Role" OWNER TO postgres;
-- ddl-end --

-- object: "Role" | type: TABLE --
-- DROP TABLE IF EXISTS "Role" CASCADE;
CREATE TABLE "Role" (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	description varchar(100) NOT NULL,
	CONSTRAINT "Role_pk" PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE "Role" OWNER TO postgres;
-- ddl-end --

-- object: "Person_fk" | type: CONSTRAINT --
-- ALTER TABLE "Person_Role" DROP CONSTRAINT IF EXISTS "Person_fk" CASCADE;
ALTER TABLE "Person_Role" ADD CONSTRAINT "Person_fk" FOREIGN KEY ("id_Person")
REFERENCES "Person" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Role_fk" | type: CONSTRAINT --
-- ALTER TABLE "Person_Role" DROP CONSTRAINT IF EXISTS "Role_fk" CASCADE;
ALTER TABLE "Person_Role" ADD CONSTRAINT "Role_fk" FOREIGN KEY ("id_Role")
REFERENCES "Role" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Contact" | type: TABLE --
-- DROP TABLE IF EXISTS "Contact" CASCADE;
CREATE TABLE "Contact" (
	id integer NOT NULL,
	CONSTRAINT "Contact_pk" PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE "Contact" OWNER TO postgres;
-- ddl-end --

-- object: "Contact_fk" | type: CONSTRAINT --
-- ALTER TABLE "Person" DROP CONSTRAINT IF EXISTS "Contact_fk" CASCADE;
ALTER TABLE "Person" ADD CONSTRAINT "Contact_fk" FOREIGN KEY ("id_Contact")
REFERENCES "Contact" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Person_uq" | type: CONSTRAINT --
-- ALTER TABLE "Person" DROP CONSTRAINT IF EXISTS "Person_uq" CASCADE;
ALTER TABLE "Person" ADD CONSTRAINT "Person_uq" UNIQUE ("id_Contact");
-- ddl-end --

-- object: "Address" | type: TABLE --
-- DROP TABLE IF EXISTS "Address" CASCADE;
CREATE TABLE "Address" (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	street_number varchar(45) NOT NULL,
	street_name varchar(255) NOT NULL,
	zip_code varchar(45) NOT NULL,
	"id_Contact" integer,
	"id_City" integer,
	CONSTRAINT "Address_pk" PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE "Address" OWNER TO postgres;
-- ddl-end --

-- object: "Contact_fk" | type: CONSTRAINT --
-- ALTER TABLE "Address" DROP CONSTRAINT IF EXISTS "Contact_fk" CASCADE;
ALTER TABLE "Address" ADD CONSTRAINT "Contact_fk" FOREIGN KEY ("id_Contact")
REFERENCES "Contact" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "City" | type: TABLE --
-- DROP TABLE IF EXISTS "City" CASCADE;
CREATE TABLE "City" (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(100) NOT NULL,
	"id_Country" integer,
	CONSTRAINT city_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE "City" OWNER TO postgres;
-- ddl-end --

-- object: "City_fk" | type: CONSTRAINT --
-- ALTER TABLE "Address" DROP CONSTRAINT IF EXISTS "City_fk" CASCADE;
ALTER TABLE "Address" ADD CONSTRAINT "City_fk" FOREIGN KEY ("id_City")
REFERENCES "City" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Country" | type: TABLE --
-- DROP TABLE IF EXISTS "Country" CASCADE;
CREATE TABLE "Country" (
	id integer NOT NULL,
	name varchar(100) NOT NULL,
	CONSTRAINT country_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE "Country" OWNER TO postgres;
-- ddl-end --

-- object: "Country_fk" | type: CONSTRAINT --
-- ALTER TABLE "City" DROP CONSTRAINT IF EXISTS "Country_fk" CASCADE;
ALTER TABLE "City" ADD CONSTRAINT "Country_fk" FOREIGN KEY ("id_Country")
REFERENCES "Country" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- Deleta todas tabelas
/*
DROP TABLE "Person_Role";
DROP TABLE "Role";
DROP TABLE "Person";
DROP TABLE "Address";
DROP TABLE "Contact";
DROP TABLE "City";
DROP TABLE "Country";
*/