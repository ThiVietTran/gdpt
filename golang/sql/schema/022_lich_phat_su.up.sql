CREATE SCHEMA lich_phat_su;

CREATE TABLE lich_phat_su (
    thang_nam DATE PRIMARY KEY,
    bhd_id TEXT NOT NULL REFERENCES bhd(id),
    noi_dung_ps JSONB NOT NULL
);
