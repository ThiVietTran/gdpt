// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.15.0
// source: dam_nhiem_cv_dv.sql

package db

import (
	"context"

	"github.com/jackc/pgtype"
)

const createDamNhiemCVDV = `-- name: CreateDamNhiemCVDV :one
INSERT INTO dam_nhiem_cv_dv (
    huynhtruong_id, donvi_id, nam_dam_nhiem_cv, chuc_vu_dam_nhiem
) VALUES (
    $1, $2, $3, $4
) RETURNING huynhtruong_id, donvi_id, nam_dam_nhiem_cv, chuc_vu_dam_nhiem
`

type CreateDamNhiemCVDVParams struct {
	HuynhtruongID  string       `json:"huynhtruong_id"`
	DonviID        string       `json:"donvi_id"`
	NamDamNhiemCv  int32        `json:"nam_dam_nhiem_cv"`
	ChucVuDamNhiem pgtype.JSONB `json:"chuc_vu_dam_nhiem"`
}

func (q *Queries) CreateDamNhiemCVDV(ctx context.Context, arg CreateDamNhiemCVDVParams) (DamNhiemCvDv, error) {
	row := q.db.QueryRow(ctx, createDamNhiemCVDV,
		arg.HuynhtruongID,
		arg.DonviID,
		arg.NamDamNhiemCv,
		arg.ChucVuDamNhiem,
	)
	var i DamNhiemCvDv
	err := row.Scan(
		&i.HuynhtruongID,
		&i.DonviID,
		&i.NamDamNhiemCv,
		&i.ChucVuDamNhiem,
	)
	return i, err
}

const deleteDamNhiemCVDVByIDAndYear = `-- name: DeleteDamNhiemCVDVByIDAndYear :exec
DELETE FROM dam_nhiem_cv_dv WHERE huynhtruong_id = $1 AND donvi_id = $2 AND nam_dam_nhiem_cv = $3
`

type DeleteDamNhiemCVDVByIDAndYearParams struct {
	HuynhtruongID string `json:"huynhtruong_id"`
	DonviID       string `json:"donvi_id"`
	NamDamNhiemCv int32  `json:"nam_dam_nhiem_cv"`
}

func (q *Queries) DeleteDamNhiemCVDVByIDAndYear(ctx context.Context, arg DeleteDamNhiemCVDVByIDAndYearParams) error {
	_, err := q.db.Exec(ctx, deleteDamNhiemCVDVByIDAndYear, arg.HuynhtruongID, arg.DonviID, arg.NamDamNhiemCv)
	return err
}

const findAllDamNhiemCVDV = `-- name: FindAllDamNhiemCVDV :many
SELECT huynhtruong_id, donvi_id, nam_dam_nhiem_cv, chuc_vu_dam_nhiem FROM dam_nhiem_cv_dv
`

func (q *Queries) FindAllDamNhiemCVDV(ctx context.Context) ([]DamNhiemCvDv, error) {
	rows, err := q.db.Query(ctx, findAllDamNhiemCVDV)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []DamNhiemCvDv{}
	for rows.Next() {
		var i DamNhiemCvDv
		if err := rows.Scan(
			&i.HuynhtruongID,
			&i.DonviID,
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

const findDamNhiemCVDVByIDAndYear = `-- name: FindDamNhiemCVDVByIDAndYear :one
SELECT huynhtruong_id, donvi_id, nam_dam_nhiem_cv, chuc_vu_dam_nhiem FROM dam_nhiem_cv_dv WHERE huynhtruong_id = $1 AND donvi_id = $2 AND nam_dam_nhiem_cv = $3 LIMIT 1
`

type FindDamNhiemCVDVByIDAndYearParams struct {
	HuynhtruongID string `json:"huynhtruong_id"`
	DonviID       string `json:"donvi_id"`
	NamDamNhiemCv int32  `json:"nam_dam_nhiem_cv"`
}

func (q *Queries) FindDamNhiemCVDVByIDAndYear(ctx context.Context, arg FindDamNhiemCVDVByIDAndYearParams) (DamNhiemCvDv, error) {
	row := q.db.QueryRow(ctx, findDamNhiemCVDVByIDAndYear, arg.HuynhtruongID, arg.DonviID, arg.NamDamNhiemCv)
	var i DamNhiemCvDv
	err := row.Scan(
		&i.HuynhtruongID,
		&i.DonviID,
		&i.NamDamNhiemCv,
		&i.ChucVuDamNhiem,
	)
	return i, err
}

const updateDamNhiemCVDV = `-- name: UpdateDamNhiemCVDV :one
UPDATE dam_nhiem_cv_dv 
SET 
    chuc_vu_dam_nhiem = $4
WHERE huynhtruong_id = $1 AND donvi_id = $2 AND nam_dam_nhiem_cv = $3
RETURNING huynhtruong_id, donvi_id, nam_dam_nhiem_cv, chuc_vu_dam_nhiem
`

type UpdateDamNhiemCVDVParams struct {
	HuynhtruongID  string       `json:"huynhtruong_id"`
	DonviID        string       `json:"donvi_id"`
	NamDamNhiemCv  int32        `json:"nam_dam_nhiem_cv"`
	ChucVuDamNhiem pgtype.JSONB `json:"chuc_vu_dam_nhiem"`
}

func (q *Queries) UpdateDamNhiemCVDV(ctx context.Context, arg UpdateDamNhiemCVDVParams) (DamNhiemCvDv, error) {
	row := q.db.QueryRow(ctx, updateDamNhiemCVDV,
		arg.HuynhtruongID,
		arg.DonviID,
		arg.NamDamNhiemCv,
		arg.ChucVuDamNhiem,
	)
	var i DamNhiemCvDv
	err := row.Scan(
		&i.HuynhtruongID,
		&i.DonviID,
		&i.NamDamNhiemCv,
		&i.ChucVuDamNhiem,
	)
	return i, err
}
