-- name: CreateDonVi :one
INSERT INTO don_vi (
    donvi_id, bhd_id, name
) VALUES (
    $1, $2, $3
) RETURNING *;

-- name: UpdateDonVi :one
UPDATE don_vi 
SET 
    bhd_id = $2, name = $3
WHERE donvi_id = $1 
RETURNING *;

-- name: FindAllDonVi :many
SELECT * FROM don_vi;

-- name: FindDonViByID :one
SELECT * FROM don_vi WHERE donvi_id = $1 LIMIT 1;

-- name: DeleteDonViByID :exec
DELETE FROM don_vi WHERE donvi_id = $1;
