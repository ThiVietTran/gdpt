// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.15.0
// source: ngay_trai_huan_luyen.sql

package db

import (
	"context"

	"github.com/jackc/pgtype"
)

const createNgayTraiHuanLuyen = `-- name: CreateNgayTraiHuanLuyen :one
INSERT INTO ngay_trai_huan_luyen (
    traihuanluyen_id, bhd_id, year, ngay_huan_luyen, dia_diem, ds_huynh_truong_ts, de_tai_hoc, giao_tho
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8
) RETURNING traihuanluyen_id, bhd_id, year, ngay_huan_luyen, dia_diem, ds_huynh_truong_ts, de_tai_hoc, giao_tho
`

type CreateNgayTraiHuanLuyenParams struct {
	TraihuanluyenID string       `json:"traihuanluyen_id"`
	BhdID           string       `json:"bhd_id"`
	Year            int32        `json:"year"`
	NgayHuanLuyen   string       `json:"ngay_huan_luyen"`
	DiaDiem         string       `json:"dia_diem"`
	DsHuynhTruongTs pgtype.JSONB `json:"ds_huynh_truong_ts"`
	DeTaiHoc        pgtype.JSONB `json:"de_tai_hoc"`
	GiaoTho         pgtype.JSONB `json:"giao_tho"`
}

func (q *Queries) CreateNgayTraiHuanLuyen(ctx context.Context, arg CreateNgayTraiHuanLuyenParams) (NgayTraiHuanLuyen, error) {
	row := q.db.QueryRow(ctx, createNgayTraiHuanLuyen,
		arg.TraihuanluyenID,
		arg.BhdID,
		arg.Year,
		arg.NgayHuanLuyen,
		arg.DiaDiem,
		arg.DsHuynhTruongTs,
		arg.DeTaiHoc,
		arg.GiaoTho,
	)
	var i NgayTraiHuanLuyen
	err := row.Scan(
		&i.TraihuanluyenID,
		&i.BhdID,
		&i.Year,
		&i.NgayHuanLuyen,
		&i.DiaDiem,
		&i.DsHuynhTruongTs,
		&i.DeTaiHoc,
		&i.GiaoTho,
	)
	return i, err
}

const deleteNgayTraiHuanLuyenByIDAndDate = `-- name: DeleteNgayTraiHuanLuyenByIDAndDate :exec
DELETE FROM ngay_trai_huan_luyen WHERE traihuanluyen_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_huan_luyen = $4
`

type DeleteNgayTraiHuanLuyenByIDAndDateParams struct {
	TraihuanluyenID string `json:"traihuanluyen_id"`
	BhdID           string `json:"bhd_id"`
	Year            int32  `json:"year"`
	NgayHuanLuyen   string `json:"ngay_huan_luyen"`
}

func (q *Queries) DeleteNgayTraiHuanLuyenByIDAndDate(ctx context.Context, arg DeleteNgayTraiHuanLuyenByIDAndDateParams) error {
	_, err := q.db.Exec(ctx, deleteNgayTraiHuanLuyenByIDAndDate,
		arg.TraihuanluyenID,
		arg.BhdID,
		arg.Year,
		arg.NgayHuanLuyen,
	)
	return err
}

const findAllNgayTraiHuanLuyen = `-- name: FindAllNgayTraiHuanLuyen :many
SELECT traihuanluyen_id, bhd_id, year, ngay_huan_luyen, dia_diem, ds_huynh_truong_ts, de_tai_hoc, giao_tho FROM ngay_trai_huan_luyen
`

func (q *Queries) FindAllNgayTraiHuanLuyen(ctx context.Context) ([]NgayTraiHuanLuyen, error) {
	rows, err := q.db.Query(ctx, findAllNgayTraiHuanLuyen)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []NgayTraiHuanLuyen{}
	for rows.Next() {
		var i NgayTraiHuanLuyen
		if err := rows.Scan(
			&i.TraihuanluyenID,
			&i.BhdID,
			&i.Year,
			&i.NgayHuanLuyen,
			&i.DiaDiem,
			&i.DsHuynhTruongTs,
			&i.DeTaiHoc,
			&i.GiaoTho,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const findNgayTraiHuanLuyenByIDAndDate = `-- name: FindNgayTraiHuanLuyenByIDAndDate :one
SELECT traihuanluyen_id, bhd_id, year, ngay_huan_luyen, dia_diem, ds_huynh_truong_ts, de_tai_hoc, giao_tho FROM ngay_trai_huan_luyen WHERE traihuanluyen_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_huan_luyen = $4 LIMIT 1
`

type FindNgayTraiHuanLuyenByIDAndDateParams struct {
	TraihuanluyenID string `json:"traihuanluyen_id"`
	BhdID           string `json:"bhd_id"`
	Year            int32  `json:"year"`
	NgayHuanLuyen   string `json:"ngay_huan_luyen"`
}

func (q *Queries) FindNgayTraiHuanLuyenByIDAndDate(ctx context.Context, arg FindNgayTraiHuanLuyenByIDAndDateParams) (NgayTraiHuanLuyen, error) {
	row := q.db.QueryRow(ctx, findNgayTraiHuanLuyenByIDAndDate,
		arg.TraihuanluyenID,
		arg.BhdID,
		arg.Year,
		arg.NgayHuanLuyen,
	)
	var i NgayTraiHuanLuyen
	err := row.Scan(
		&i.TraihuanluyenID,
		&i.BhdID,
		&i.Year,
		&i.NgayHuanLuyen,
		&i.DiaDiem,
		&i.DsHuynhTruongTs,
		&i.DeTaiHoc,
		&i.GiaoTho,
	)
	return i, err
}

const updateNgayTraiHuanLuyen = `-- name: UpdateNgayTraiHuanLuyen :one
UPDATE ngay_trai_huan_luyen 
SET 
    dia_diem = $5, ds_huynh_truong_ts = $6, de_tai_hoc = $7, giao_tho = $8
WHERE traihuanluyen_id = $1 AND bhd_id = $2 AND year = $3 AND ngay_huan_luyen = $4
RETURNING traihuanluyen_id, bhd_id, year, ngay_huan_luyen, dia_diem, ds_huynh_truong_ts, de_tai_hoc, giao_tho
`

type UpdateNgayTraiHuanLuyenParams struct {
	TraihuanluyenID string       `json:"traihuanluyen_id"`
	BhdID           string       `json:"bhd_id"`
	Year            int32        `json:"year"`
	NgayHuanLuyen   string       `json:"ngay_huan_luyen"`
	DiaDiem         string       `json:"dia_diem"`
	DsHuynhTruongTs pgtype.JSONB `json:"ds_huynh_truong_ts"`
	DeTaiHoc        pgtype.JSONB `json:"de_tai_hoc"`
	GiaoTho         pgtype.JSONB `json:"giao_tho"`
}

func (q *Queries) UpdateNgayTraiHuanLuyen(ctx context.Context, arg UpdateNgayTraiHuanLuyenParams) (NgayTraiHuanLuyen, error) {
	row := q.db.QueryRow(ctx, updateNgayTraiHuanLuyen,
		arg.TraihuanluyenID,
		arg.BhdID,
		arg.Year,
		arg.NgayHuanLuyen,
		arg.DiaDiem,
		arg.DsHuynhTruongTs,
		arg.DeTaiHoc,
		arg.GiaoTho,
	)
	var i NgayTraiHuanLuyen
	err := row.Scan(
		&i.TraihuanluyenID,
		&i.BhdID,
		&i.Year,
		&i.NgayHuanLuyen,
		&i.DiaDiem,
		&i.DsHuynhTruongTs,
		&i.DeTaiHoc,
		&i.GiaoTho,
	)
	return i, err
}
