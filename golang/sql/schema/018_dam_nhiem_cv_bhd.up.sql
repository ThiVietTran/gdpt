CREATE SCHEMA dam_nhiem_cv_bhd;

CREATE TABLE dam_nhiem_cv_bhd (
    huynhtruong_id TEXT NOT NULL REFERENCES huynh_truong(huynhtruong_id),
    bhd_id TEXT NOT NULL REFERENCES bhd(id),
    nam_dam_nhiem_cv INT NOT NULL,
    chuc_vu_dam_nhiem JSONB NOT NULL,
    PRIMARY KEY (huynhtruong_id, bhd_id, nam_dam_nhiem_cv)
);
