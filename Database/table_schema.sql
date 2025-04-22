DROP SCHEMA IF EXISTS cc_user CASCADE;
CREATE SCHEMA cc_user;
SET search_path = cc_user;

CREATE TABLE cc_user.parts (
    id integer,
    description character varying,
    code character varying,
    manufacturer_id  integer
);

CREATE TABLE cc_user.locations (
    id integer,
    part_id integer,
    location varchar(3),
    qty integer
);

create table cc_user.manufacturers (
    id integer PRIMARY KEY,
    name varchar
);

create table cc_user.reorder_options (
  id integer PRIMARY KEY,
  part_id integer,
  price_usd numeric(8,2),
  quantity integer
);