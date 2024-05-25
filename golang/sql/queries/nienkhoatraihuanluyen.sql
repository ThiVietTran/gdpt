-- name: CreateNienKhoaTraiHuanLuyen :one
INSERT INTO nienkhoatraihuanluyen (
    traihuanluyen_id, bhd_id, year, ds_huynh_truong_ts, hoidonggiaotho, hoidonggianghuan, banquantrai, camnangtrai
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8
) RETURNING *;

-- name: UpdateNienKhoaTraiHuanLuyen :one
UPDATE nienkhoatraihuanluyen 
SET 
    ds_huynh_truong_ts = $4, hoidonggiaotho = $5, hoidonggianghuan = $6, banquantrai = $7, camnangtrai = $8
WHERE traihuanluyen_id = $1 AND bhd_id = $2 AND year = $3
RETURNING *;

-- name: FindAllNienKhoaTraiHuanLuyen :many
SELECT * FROM nienkhoatraihuanluyen;

-- name: FindNienKhoaTraiHuanLuyenByIDAndYear :one
SELECT * FROM nienkhoatraihuanluyen WHERE traihuanluyen_id = $1 AND bhd_id = $2 AND year = $3 LIMIT 1;

-- name: DeleteNienKhoaTraiHuanLuyenByIDAndYear :exec
DELETE FROM nienkhoatraihuanluyen WHERE traihuanluyen_id = $1 AND bhd_id = $2 AND year = $3;
