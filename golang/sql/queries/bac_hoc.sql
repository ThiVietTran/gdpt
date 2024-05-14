-- name: CreateBacHoc :one
INSERT INTO bac_hoc (id, name) VALUES ($1, $2) RETURNING *;

-- name: UpdateBacHoc :one
UPDATE bac_hoc SET name = $2 WHERE id = $1 RETURNING *;

-- name: FindBacHoc :many
SELECT * FROM bac_hoc ORDER BY id DESC;

-- name: FindBacHocByIDs :one
SELECT * FROM bac_hoc WHERE id = $1 LIMIT 1;

-- name: DeleteBacHocByIDs :exec
DELETE FROM bac_hoc WHERE id = $1;
