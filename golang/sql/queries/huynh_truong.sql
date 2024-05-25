-- name: CreateHuynhTruong :one
INSERT INTO huynh_truong (
    huynhtruong_id, bhd_id, donvi_id, ht_name, ht_anh34, phap_danh, nam_sinh, chanh_quan, 
    dia_chi, trinh_do, nghe_nghiep, hon_nhan, tho_gioi, bac_hoc, trai_huan_luyen, nang_khieu
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, 
    $9, $10, $11, $12, $13, $14, $15, $16
) RETURNING *;

-- name: UpdateHuynhTruong :one
UPDATE huynh_truong 
SET 
    bhd_id = $2, donvi_id = $3, ht_name = $4, ht_anh34 = $5, phap_danh = $6, nam_sinh = $7, 
    chanh_quan = $8, dia_chi = $9, trinh_do = $10, nghe_nghiep = $11, hon_nhan = $12, 
    tho_gioi = $13, bac_hoc = $14, trai_huan_luyen = $15, nang_khieu = $16
WHERE huynhtruong_id = $1 
RETURNING *;

-- name: FindAllHuynhTruong :many
SELECT * FROM huynh_truong;

-- name: FindHuynhTruongByID :one
SELECT * FROM huynh_truong WHERE huynhtruong_id = $1 LIMIT 1;

-- name: DeleteHuynhTruongByID :exec
DELETE FROM huynh_truong WHERE huynhtruong_id = $1;
