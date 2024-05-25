-- name: CreateTraiHuanLuyen :one
INSERT INTO trai_huan_luyen (id, name) VALUES ($1, $2) RETURNING *;

-- name: UpdateTraiHuanLuyen :one
UPDATE trai_huan_luyen SET name = $2 WHERE id = $1 RETURNING *;

-- name: FindAllTraiHuanLuyen :many
SELECT * FROM trai_huan_luyen;

-- name: FindTraiHuanLuyenByID :one
SELECT * FROM trai_huan_luyen WHERE id = $1 LIMIT 1;

-- name: DeleteTraiHuanLuyenByID :exec
DELETE FROM trai_huan_luyen WHERE id = $1;
