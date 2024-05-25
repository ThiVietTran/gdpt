CREATE SCHEMA huynh_truong;

CREATE TABLE huynh_truong (
    huynhtruong_id TEXT PRIMARY KEY,
    bhd_id TEXT NOT NULL REFERENCES bhd(id),
    donvi_id TEXT NOT NULL REFERENCES don_vi(donvi_id),
    ht_name TEXT NOT NULL,
    ht_anh34 BYTEA NOT NULL,
    phap_danh TEXT NOT NULL,
    nam_sinh TEXT NOT NULL,
    chanh_quan TEXT NOT NULL,
    dia_chi TEXT NOT NULL,
    trinh_do TEXT NOT NULL,
    nghe_nghiep TEXT NOT NULL,
    hon_nhan TEXT NOT NULL,
    tho_gioi JSONB NOT NULL,
    bac_hoc JSONB NOT NULL,
    trai_huan_luyen JSONB NOT NULL,
    nang_khieu TEXT NOT NULL
);
