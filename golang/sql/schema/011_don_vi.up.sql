CREATE SCHEMA don_vi;

CREATE TABLE don_vi (
    donvi_id TEXT PRIMARY KEY,
    bhd_id TEXT NOT NULL REFERENCES bhd(id),
    name TEXT NOT NULL
);
