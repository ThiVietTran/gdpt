CREATE SCHEMA bac_hoc;

CREATE TABLE bac_hoc (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    UNIQUE(name)
);
