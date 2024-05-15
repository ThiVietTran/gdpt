-- name: CreateBhd :one
INSERT INTO bhd (id, name) VALUES ($1, $2) RETURNING *;

-- name: UpdateBhd :one
UPDATE bhd SET name = $2 WHERE id = $1 RETURNING *;

-- name: FindBhd :many
SELECT * FROM bhd ORDER BY id DESC;

-- name: FindBhdByIDs :one
SELECT * FROM bhd WHERE id = $1 LIMIT 1;

-- name: DeleteBhdByIDs :exec
DELETE FROM bhd WHERE id = $1;
