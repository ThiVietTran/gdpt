CREATE SCHEMA thi_bac_hoc;

CREATE TABLE thi_bac_hoc (
    bachoc_id TEXT NOT NULL,
    bhd_id TEXT NOT NULL,
    year INT NOT NULL,
    ngay_thi TEXT NOT NULL,
    dia_diem TEXT NOT NULL,
    PRIMARY KEY (bachoc_id, bhd_id, ngay_thi, year),
    FOREIGN KEY (bachoc_id, bhd_id, year)
        REFERENCES nienkhoabachoc (bachoc_id, bhd_id, year),
    ds_huynh_truong JSONB NOT NULL,
    de_thi_trac_nghiem BYTEA NOT NULL,
    de_thi_viet BYTEA NOT NULL,
    bien_ban BYTEA NOT NULL
);
