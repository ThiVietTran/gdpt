-- name: CreateDongGopDV :one
INSERT INTO dong_gop_dv (
    huynhtruong_id, donvi_id, nam_dong_gop, noi_dung_dong_gop
) VALUES (
    $1, $2, $3, $4
) RETURNING *;

-- name: UpdateDongGopDV :one
UPDATE dong_gop_dv 
SET 
    noi_dung_dong_gop = $4
WHERE huynhtruong_id = $1 AND donvi_id = $2 AND nam_dong_gop = $3
RETURNING *;

-- name: FindAllDongGopDV :many
SELECT * FROM dong_gop_dv;

-- name: FindDongGopDVByIDAndYear :one
SELECT * FROM dong_gop_dv WHERE huynhtruong_id = $1 AND donvi_id = $2 AND nam_dong_gop = $3 LIMIT 1;

-- name: DeleteDongGopDVByIDAndYear :exec
DELETE FROM dong_gop_dv WHERE huynhtruong_id = $1 AND donvi_id = $2 AND nam_dong_gop = $3;
