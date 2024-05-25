CREATE SCHEMA ket_khoa_trai_hl;

CREATE TABLE ket_khoa_trai_hl (
    traihuanluyen_id TEXT NOT NULL REFERENCES trai_huan_luyen(id),
    bhd_id TEXT NOT NULL REFERENCES bhd(id),
    year INT NOT NULL,
    ngay_thi TEXT NOT NULL,
    dia_diem TEXT NOT NULL,
    PRIMARY KEY (traihuanluyen_id, bhd_id, ngay_thi, year),
    FOREIGN KEY (traihuanluyen_id, bhd_id, year)
        REFERENCES nienkhoatraihuanluyen (traihuanluyen_id, bhd_id, year),
    ds_huynh_truong_ts JSONB NOT NULL,
    de_thi_trac_nghiem JSONB NOT NULL,
    de_thi_viet JSONB NOT NULL
);
