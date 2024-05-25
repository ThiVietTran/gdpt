CREATE SCHEMA tho_cap;

CREATE TABLE tho_cap (
    ds_huynh_truong JSONB NOT NULL,
    bhd_id TEXT NOT NULL REFERENCES bhd(id),
    cap_bac_id TEXT NOT NULL REFERENCES cap_bac(id),
    nam_tho_cap INT NOT NULL,
    quyet_dinh_tho_cap BYTEA NOT NULL,
    PRIMARY KEY (bhd_id, cap_bac_id, nam_tho_cap)
);
