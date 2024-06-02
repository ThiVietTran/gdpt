-- name: CreateLichPhatSu :one
INSERT INTO lich_phat_su (
    thang_nam, bhd_id, noi_dung_ps
) VALUES (
    $1, $2, $3
) RETURNING *;

-- name: UpdateLichPhatSu :one
UPDATE lich_phat_su 
SET 
    bhd_id = $2, noi_dung_ps = $3
WHERE thang_nam = $1 
RETURNING *;

-- name: FindRangeLichPhatSu :many
SELECT * FROM lich_phat_su 
WHERE thang_nam BETWEEN $1 AND $2;

-- name: FindLichPhatSuByID :one
SELECT * FROM lich_phat_su WHERE thang_nam = $1 LIMIT 1;

-- name: DeleteLichPhatSuByID :exec
DELETE FROM lich_phat_su WHERE thang_nam = $1;