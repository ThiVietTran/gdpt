-- name: CreateThoCap :one
INSERT INTO tho_cap (
    ds_huynh_truong, bhd_id, cap_bac_id, nam_tho_cap, quyet_dinh_tho_cap
) VALUES (
    $1, $2, $3, $4, $5
) RETURNING *;

-- name: UpdateThoCap :one
UPDATE tho_cap 
SET 
    ds_huynh_truong = $1, quyet_dinh_tho_cap = $5
WHERE bhd_id = $2 AND cap_bac_id = $3 AND nam_tho_cap = $4
RETURNING *;

-- name: FindAllThoCap :many
SELECT * FROM tho_cap;

-- name: FindThoCapByIDAndYear :one
SELECT * FROM tho_cap WHERE bhd_id = $1 AND cap_bac_id = $2 AND nam_tho_cap = $3 LIMIT 1;

-- name: DeleteThoCapByIDAndYear :exec
DELETE FROM tho_cap WHERE bhd_id = $1 AND cap_bac_id = $2 AND nam_tho_cap = $3;
