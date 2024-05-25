-- name: CreateNgayTraiHuanLuyen :one
INSERT INTO ngay_trai_huan_luyen (
    traihuanluyen_id, bhd_id, year, ngay_huan_luyen, dia_diem, ds_huynh_truong_ts, de_tai_hoc, giao_tho
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8
) RETURNING *;

-- name: UpdateNgayTraiHuanLuyen :one
UPDATE ngay_trai_huan_luyen 
SET 
    dia_diem = $5, ds_huynh_truong_ts = $6, de_tai_hoc = $7, giao_tho = $8
WHERE traihuanluyen_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_huan_luyen = $4
RETURNING *;

-- name: FindAllNgayTraiHuanLuyen :many
SELECT * FROM ngay_trai_huan_luyen;

-- name: FindNgayTraiHuanLuyenByIDAndDate :one
SELECT * FROM ngay_trai_huan_luyen WHERE traihuanluyen_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_huan_luyen = $4 LIMIT 1;

-- name: DeleteNgayTraiHuanLuyenByIDAndDate :exec
DELETE FROM ngay_trai_huan_luyen WHERE traihuanluyen_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_huan_luyen = $4;
