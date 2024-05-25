CREATE SCHEMA ngay_trai_huan_luyen;

CREATE TABLE ngay_trai_huan_luyen (
    traihuanluyen_id TEXT NOT NULL REFERENCES trai_huan_luyen(id),
    bhd_id TEXT NOT NULL REFERENCES bhd(id),
    year INT NOT NULL,
    ngay_huan_luyen TEXT NOT NULL,
    dia_diem TEXT NOT NULL,
    PRIMARY KEY (traihuanluyen_id, bhd_id, ngay_huan_luyen, year),
    FOREIGN KEY (traihuanluyen_id, bhd_id, year)
        REFERENCES nienkhoatraihuanluyen (traihuanluyen_id, bhd_id, year),
    ds_huynh_truong_ts JSONB NOT NULL,
    de_tai_hoc JSONB NOT NULL,
    giao_tho JSONB NOT NULL
);
