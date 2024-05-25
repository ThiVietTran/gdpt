CREATE SCHEMA trai_huan_luyen;

CREATE TABLE trai_huan_luyen (
    id TEXT NOT NULL,
    name TEXT NOT NULL,
    CONSTRAINT trai_huan_luyen_pkey PRIMARY KEY (id),
    CONSTRAINT trai_huan_luyen_name_key UNIQUE (name)
);