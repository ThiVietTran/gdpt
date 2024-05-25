-- name: CreateThiBacHoc :one
INSERT INTO thi_bac_hoc (
    bachoc_id, bhd_id, year, ngay_thi, dia_diem, ds_huynh_truong, de_thi_trac_nghiem, de_thi_viet, bien_ban
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, $9
) RETURNING *;

-- name: UpdateThiBacHoc :one
UPDATE thi_bac_hoc 
SET 
    dia_diem = $5, ds_huynh_truong = $6, de_thi_trac_nghiem = $7, de_thi_viet = $8, bien_ban = $9
WHERE bachoc_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_thi = $4
RETURNING *;

-- name: FindAllThiBacHoc :many
SELECT * FROM thi_bac_hoc;

-- name: FindThiBacHocByIDAndDate :one
SELECT * FROM thi_bac_hoc WHERE bachoc_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_thi = $4 LIMIT 1;

-- name: DeleteThiBacHocByIDAndDate :exec
DELETE FROM thi_bac_hoc WHERE bachoc_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_thi = $4;
