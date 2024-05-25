CREATE SCHEMA dong_gop_dv;

CREATE TABLE dong_gop_dv (
    huynhtruong_id TEXT NOT NULL REFERENCES huynh_truong(huynhtruong_id),
    donvi_id TEXT NOT NULL REFERENCES don_vi(donvi_id),
    nam_dong_gop INT NOT NULL,
    noi_dung_dong_gop JSONB NOT NULL,
    PRIMARY KEY (huynhtruong_id, donvi_id, nam_dong_gop)
);
