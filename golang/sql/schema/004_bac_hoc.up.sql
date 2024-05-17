CREATE SCHEMA bac_hoc;

CREATE TABLE bac_hoc (
    id TEXT NOT NULL,
    name TEXT NOT NULL,
    CONSTRAINT bac_hoc_pkey PRIMARY KEY (id),
    CONSTRAINT bac_hoc_name_key UNIQUE (name)
);
