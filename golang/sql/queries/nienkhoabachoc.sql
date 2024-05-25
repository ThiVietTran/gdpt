-- name: CreateNienKhoaBacHoc :one
INSERT INTO nienkhoabachoc (
    bachoc_id, bhd_id, year, ds_huynh_truong, giao_trinh, giao_tho, bqt
) VALUES (
    $1, $2, $3, $4, $5, $6, $7
) RETURNING *;

-- name: UpdateNienKhoaBacHoc :one
UPDATE nienkhoabachoc 
SET 
    ds_huynh_truong = $4, giao_trinh = $5, giao_tho = $6, bqt = $7
WHERE bachoc_id = $1 AND bhd_id = $2 AND year = $3
RETURNING *;

-- name: FindAllNienKhoaBacHoc :many
SELECT * FROM nienkhoabachoc;

-- name: FindNienKhoaBacHocByIDAndYear :one
SELECT * FROM nienkhoabachoc WHERE bachoc_id = $1 AND bhd_id = $2 AND year = $3 LIMIT 1;

-- name: DeleteNienKhoaBacHocByIDAndYear :exec
DELETE FROM nienkhoabachoc WHERE bachoc_id = $1 AND bhd_id = $2 AND year = $3;
