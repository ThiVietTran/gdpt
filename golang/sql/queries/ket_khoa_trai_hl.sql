-- name: CreateKetKhoaTraiHL :one
INSERT INTO ket_khoa_trai_hl (
    traihuanluyen_id, bhd_id, year, ngay_thi, dia_diem, ds_huynh_truong_ts, de_thi_trac_nghiem, de_thi_viet
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8
) RETURNING *;

-- name: UpdateKetKhoaTraiHL :one
UPDATE ket_khoa_trai_hl 
SET 
    dia_diem = $5, ds_huynh_truong_ts = $6, de_thi_trac_nghiem = $7, de_thi_viet = $8
WHERE traihuanluyen_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_thi = $4
RETURNING *;

-- name: FindAllKetKhoaTraiHL :many
SELECT * FROM ket_khoa_trai_hl;

-- name: FindKetKhoaTraiHLByIDAndDate :one
SELECT * FROM ket_khoa_trai_hl WHERE traihuanluyen_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_thi = $4 LIMIT 1;

-- name: DeleteKetKhoaTraiHLByIDAndDate :exec
DELETE FROM ket_khoa_trai_hl WHERE traihuanluyen_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_thi = $4;
