-- name: CreateNgayTuHoc :one
INSERT INTO ngay_tu_hoc (
    bachoc_id, bhd_id, year, ngay_hoc, dia_diem, ds_huynh_truong, de_tai_hoc, giao_tho, bien_ban
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, $9
) RETURNING *;

-- name: UpdateNgayTuHoc :one
UPDATE ngay_tu_hoc 
SET 
    dia_diem = $5, ds_huynh_truong = $6, de_tai_hoc = $7, giao_tho = $8, bien_ban = $9
WHERE bachoc_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_hoc = $4
RETURNING *;

-- name: FindAllNgayTuHoc :many
SELECT * FROM ngay_tu_hoc;

-- name: FindNgayTuHocByIDAndDate :one
SELECT * FROM ngay_tu_hoc WHERE bachoc_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_hoc = $4 LIMIT 1;

-- name: DeleteNgayTuHocByIDAndDate :exec
DELETE FROM ngay_tu_hoc WHERE bachoc_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_hoc = $4;
