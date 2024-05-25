CREATE SCHEMA nienkhoatraihuanluyen;

CREATE TABLE nienkhoatraihuanluyen (
    traihuanluyen_id TEXT NOT NULL REFERENCES trai_huan_luyen(id),
    bhd_id TEXT NOT NULL REFERENCES bhd(id),
    year INT NOT NULL,
    ds_huynh_truong_ts JSONB NOT NULL,
    hoidonggiaotho JSONB NOT NULL,
    hoidonggianghuan JSONB NOT NULL,
    banquantrai JSONB NOT NULL,
    camnangtrai bytea NOT NULL DEFAULT 'update later',
    PRIMARY KEY (traihuanluyen_id, bhd_id, year)
);
