CREATE SCHEMA dong_gop_bhd;

CREATE TABLE dong_gop_bhd (
    huynhtruong_id TEXT NOT NULL REFERENCES huynh_truong(huynhtruong_id),
    bhd_id TEXT NOT NULL REFERENCES bhd(id),
    nam_dong_gop INT NOT NULL,
    noi_dung_dong_gop JSONB NOT NULL,
    PRIMARY KEY (huynhtruong_id, bhd_id, nam_dong_gop)
);
