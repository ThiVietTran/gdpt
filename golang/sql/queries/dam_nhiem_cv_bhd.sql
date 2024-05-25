-- name: CreateDamNhiemCVBHD :one
INSERT INTO dam_nhiem_cv_bhd (
    huynhtruong_id, bhd_id, nam_dam_nhiem_cv, chuc_vu_dam_nhiem
) VALUES (
    $1, $2, $3, $4
) RETURNING *;

-- name: UpdateDamNhiemCVBHD :one
UPDATE dam_nhiem_cv_bhd 
SET 
    chuc_vu_dam_nhiem = $4
WHERE huynhtruong_id = $1 AND bhd_id = $2 AND nam_dam_nhiem_cv = $3
RETURNING *;

-- name: FindAllDamNhiemCVBHD :many
SELECT * FROM dam_nhiem_cv_bhd;

-- name: FindDamNhiemCVBHDByIDAndYear :one
SELECT * FROM dam_nhiem_cv_bhd WHERE huynhtruong_id = $1 AND bhd_id = $2 AND nam_dam_nhiem_cv = $3 LIMIT 1;

-- name: DeleteDamNhiemCVBHDByIDAndYear :exec
DELETE FROM dam_nhiem_cv_bhd WHERE huynhtruong_id = $1 AND bhd_id = $2 AND nam_dam_nhiem_cv = $3;
