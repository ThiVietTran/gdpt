// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.15.0
// source: dam_nhiem_cv_bhd.sql

package db

import (
	"context"

	"github.com/jackc/pgtype"
)

const createDamNhiemCVBHD = `-- name: CreateDamNhiemCVBHD :one
INSERT INTO dam_nhiem_cv_bhd (
    huynhtruong_id, bhd_id, nam_dam_nhiem_cv, chuc_vu_dam_nhiem
) VALUES (
    $1, $2, $3, $4
) RETURNING huynhtruong_id, bhd_id, nam_dam_nhiem_cv, chuc_vu_dam_nhiem
`

type CreateDamNhiemCVBHDParams struct {
	HuynhtruongID  string       `json:"huynhtruong_id"`
	BhdID          string       `json:"bhd_id"`
	NamDamNhiemCv  int32        `json:"nam_dam_nhiem_cv"`
	ChucVuDamNhiem pgtype.JSONB `json:"chuc_vu_dam_nhiem"`
}

func (q *Queries) CreateDamNhiemCVBHD(ctx context.Context, arg CreateDamNhiemCVBHDParams) (DamNhiemCvBhd, error) {
	row := q.db.QueryRow(ctx, createDamNhiemCVBHD,
		arg.HuynhtruongID,
		arg.BhdID,
		arg.NamDamNhiemCv,
		arg.ChucVuDamNhiem,
	)
	var i DamNhiemCvBhd
	err := row.Scan(
		&i.HuynhtruongID,
		&i.BhdID,
		&i.NamDamNhiemCv,
		&i.ChucVuDamNhiem,
	)
	return i, err
}

const deleteDamNhiemCVBHDByIDAndYear = `-- name: DeleteDamNhiemCVBHDByIDAndYear :exec
DELETE FROM dam_nhiem_cv_bhd WHERE huynhtruong_id = $1 AND bhd_id = $2 AND nam_dam_nhiem_cv = $3
`

type DeleteDamNhiemCVBHDByIDAndYearParams struct {
	HuynhtruongID string `json:"huynhtruong_id"`
	BhdID         string `json:"bhd_id"`
	NamDamNhiemCv int32  `json:"nam_dam_nhiem_cv"`
}

func (q *Queries) DeleteDamNhiemCVBHDByIDAndYear(ctx context.Context, arg DeleteDamNhiemCVBHDByIDAndYearParams) error {
	_, err := q.db.Exec(ctx, deleteDamNhiemCVBHDByIDAndYear, arg.HuynhtruongID, arg.BhdID, arg.NamDamNhiemCv)
	return err
}

const findAllDamNhiemCVBHD = `-- name: FindAllDamNhiemCVBHD :many
SELECT huynhtruong_id, bhd_id, nam_dam_nhiem_cv, chuc_vu_dam_nhiem FROM dam_nhiem_cv_bhd
`

func (q *Queries) FindAllDamNhiemCVBHD(ctx context.Context) ([]DamNhiemCvBhd, error) {
	rows, err := q.db.Query(ctx, findAllDamNhiemCVBHD)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []DamNhiemCvBhd{}
	for rows.Next() {
		var i DamNhiemCvBhd
		if err := rows.Scan(
			&i.HuynhtruongID,
			&i.BhdID,
			&i.NamDamNhiemCv,
			&i.ChucVuDamNhiem,
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

const findDamNhiemCVBHDByIDAndYear = `-- name: FindDamNhiemCVBHDByIDAndYear :one
SELECT huynhtruong_id, bhd_id, nam_dam_nhiem_cv, chuc_vu_dam_nhiem FROM dam_nhiem_cv_bhd WHERE huynhtruong_id = $1 AND bhd_id = $2 AND nam_dam_nhiem_cv = $3 LIMIT 1
`

type FindDamNhiemCVBHDByIDAndYearParams struct {
	HuynhtruongID string `json:"huynhtruong_id"`
	BhdID         string `json:"bhd_id"`
	NamDamNhiemCv int32  `json:"nam_dam_nhiem_cv"`
}

func (q *Queries) FindDamNhiemCVBHDByIDAndYear(ctx context.Context, arg FindDamNhiemCVBHDByIDAndYearParams) (DamNhiemCvBhd, error) {
	row := q.db.QueryRow(ctx, findDamNhiemCVBHDByIDAndYear, arg.HuynhtruongID, arg.BhdID, arg.NamDamNhiemCv)
	var i DamNhiemCvBhd
	err := row.Scan(
		&i.HuynhtruongID,
		&i.BhdID,
		&i.NamDamNhiemCv,
		&i.ChucVuDamNhiem,
	)
	return i, err
}

const updateDamNhiemCVBHD = `-- name: UpdateDamNhiemCVBHD :one
UPDATE dam_nhiem_cv_bhd 
SET 
    chuc_vu_dam_nhiem = $4
WHERE huynhtruong_id = $1 AND bhd_id = $2 AND nam_dam_nhiem_cv = $3
RETURNING huynhtruong_id, bhd_id, nam_dam_nhiem_cv, chuc_vu_dam_nhiem
`

type UpdateDamNhiemCVBHDParams struct {
	HuynhtruongID  string       `json:"huynhtruong_id"`
	BhdID          string       `json:"bhd_id"`
	NamDamNhiemCv  int32        `json:"nam_dam_nhiem_cv"`
	ChucVuDamNhiem pgtype.JSONB `json:"chuc_vu_dam_nhiem"`
}

func (q *Queries) UpdateDamNhiemCVBHD(ctx context.Context, arg UpdateDamNhiemCVBHDParams) (DamNhiemCvBhd, error) {
	row := q.db.QueryRow(ctx, updateDamNhiemCVBHD,
		arg.HuynhtruongID,
		arg.BhdID,
		arg.NamDamNhiemCv,
		arg.ChucVuDamNhiem,
	)
	var i DamNhiemCvBhd
	err := row.Scan(
		&i.HuynhtruongID,
		&i.BhdID,
		&i.NamDamNhiemCv,
		&i.ChucVuDamNhiem,
	)
	return i, err
}
