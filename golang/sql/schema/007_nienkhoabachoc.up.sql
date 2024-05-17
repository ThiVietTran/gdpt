CREATE SCHEMA nienkhoabachoc;

CREATE TABLE nienkhoabachoc (
    bachoc_id TEXT NOT NULL REFERENCES bac_hoc(id),
    bhd_id TEXT NOT NULL REFERENCES bhd(id),
    year INT NOT NULL,
    giao_trinh TEXT NOT NULL,
    giao_tho TEXT NOT NULL,
    bqt TEXT NOT NULL,
    PRIMARY KEY (bachoc_id, bhd_id, year)
);
