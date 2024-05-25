CREATE SCHEMA dam_nhiem_cv_dv;

CREATE TABLE dam_nhiem_cv_dv (
    huynhtruong_id TEXT NOT NULL REFERENCES huynh_truong(huynhtruong_id),
    donvi_id TEXT NOT NULL REFERENCES don_vi(donvi_id),
    nam_dam_nhiem_cv INT NOT NULL,
    chuc_vu_dam_nhiem JSONB NOT NULL,
    PRIMARY KEY (huynhtruong_id, donvi_id, nam_dam_nhiem_cv)
);
