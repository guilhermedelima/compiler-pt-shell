create schema syntax;

CREATE TABLE syntax.verbos
(
  id_verbo serial NOT NULL,
  infinitivo character varying(15),
  "is" character varying(100),
  fi character varying(100),
  ti character varying(100),
  ii character varying(100),
  fn character varying(100),
  ps character varying(100),
  mi character varying(100),
  "in" character varying(100),
  ia character varying(100),
  fs character varying(100),
  pi character varying(100),
  ip character varying(100),
  ei character varying(100),
  CONSTRAINT verbos_pkey PRIMARY KEY (id_verbo )
);
