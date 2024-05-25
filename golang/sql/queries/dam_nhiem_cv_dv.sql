-- name: CreateDamNhiemCVDV :one
INSERT INTO dam_nhiem_cv_dv (
    huynhtruong_id, donvi_id, nam_dam_nhiem_cv, chuc_vu_dam_nhiem
) VALUES (
    $1, $2, $3, $4
) RETURNING *;

-- name: UpdateDamNhiemCVDV :one
UPDATE dam_nhiem_cv_dv 
SET 
    chuc_vu_dam_nhiem = $4
WHERE huynhtruong_id = $1 AND donvi_id = $2 AND nam_dam_nhiem_cv = $3
RETURNING *;

-- name: FindAllDamNhiemCVDV :many
SELECT * FROM dam_nhiem_cv_dv;

-- name: FindDamNhiemCVDVByIDAndYear :one
SELECT * FROM dam_nhiem_cv_dv WHERE huynhtruong_id = $1 AND donvi_id = $2 AND nam_dam_nhiem_cv = $3 LIMIT 1;

-- name: DeleteDamNhiemCVDVByIDAndYear :exec
DELETE FROM dam_nhiem_cv_dv WHERE huynhtruong_id = $1 AND donvi_id = $2 AND nam_dam_nhiem_cv = $3;
