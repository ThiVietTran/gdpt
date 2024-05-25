-- name: CreateDongGopBHD :one
INSERT INTO dong_gop_bhd (
    huynhtruong_id, bhd_id, nam_dong_gop, noi_dung_dong_gop
) VALUES (
    $1, $2, $3, $4
) RETURNING *;

-- name: UpdateDongGopBHD :one
UPDATE dong_gop_bhd 
SET 
    noi_dung_dong_gop = $4
WHERE huynhtruong_id = $1 AND bhd_id = $2 AND nam_dong_gop = $3
RETURNING *;

-- name: FindAllDongGopBHD :many
SELECT * FROM dong_gop_bhd;

-- name: FindDongGopBHDByIDAndYear :one
SELECT * FROM dong_gop_bhd WHERE huynhtruong_id = $1 AND bhd_id = $2 AND nam_dong_gop = $3 LIMIT 1;

-- name: DeleteDongGopBHDByIDAndYear :exec
DELETE FROM dong_gop_bhd WHERE huynhtruong_id = $1 AND bhd_id = $2 AND nam_dong_gop = $3;
