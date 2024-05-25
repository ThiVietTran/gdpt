CREATE SCHEMA ngay_tu_hoc;

CREATE TABLE ngay_tu_hoc (
    bachoc_id TEXT NOT NULL,
    bhd_id TEXT NOT NULL,
    year INT NOT NULL,
    ngay_hoc TEXT NOT NULL,
    dia_diem TEXT NOT NULL,
    PRIMARY KEY (bachoc_id, bhd_id, ngay_hoc, year),
    FOREIGN KEY (bachoc_id, bhd_id, year)
        REFERENCES nienkhoabachoc (bachoc_id, bhd_id, year),
    ds_huynh_truong JSONB NOT NULL,
    de_tai_hoc TEXT NOT NULL,
    giao_tho TEXT NOT NULL,
    bien_ban BYTEA NOT NULL
);
