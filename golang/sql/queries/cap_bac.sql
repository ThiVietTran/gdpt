-- name: CreateCapBac :one
INSERT INTO cap_bac (id, name) VALUES ($1, $2) RETURNING *;

-- name: UpdateCapBac :one
UPDATE cap_bac SET name = $2 WHERE id = $1 RETURNING *;

-- name: FindAllCapBac :many
SELECT * FROM cap_bac;

-- name: FindCapBacByID :one
SELECT * FROM cap_bac WHERE id = $1 LIMIT 1;

-- name: DeleteCapBacByID :exec
DELETE FROM cap_bac WHERE id = $1;
