// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0
// source: don_vi.sql

package db

import (
	"context"
)

const createDonVi = `-- name: CreateDonVi :one
INSERT INTO don_vi (
    donvi_id, bhd_id, name
) VALUES (
    $1, $2, $3
) RETURNING donvi_id, bhd_id, name
`

type CreateDonViParams struct {
	DonviID string `json:"donvi_id"`
	BhdID   string `json:"bhd_id"`
	Name    string `json:"name"`
}

func (q *Queries) CreateDonVi(ctx context.Context, arg CreateDonViParams) (DonVi, error) {
	row := q.db.QueryRow(ctx, createDonVi, arg.DonviID, arg.BhdID, arg.Name)
	var i DonVi
	err := row.Scan(&i.DonviID, &i.BhdID, &i.Name)
	return i, err
}

const deleteDonViByID = `-- name: DeleteDonViByID :exec
DELETE FROM don_vi WHERE donvi_id = $1
`

func (q *Queries) DeleteDonViByID(ctx context.Context, donviID string) error {
	_, err := q.db.Exec(ctx, deleteDonViByID, donviID)
	return err
}

const findAllDonVi = `-- name: FindAllDonVi :many
SELECT donvi_id, bhd_id, name FROM don_vi
`

func (q *Queries) FindAllDonVi(ctx context.Context) ([]DonVi, error) {
	rows, err := q.db.Query(ctx, findAllDonVi)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []DonVi{}
	for rows.Next() {
		var i DonVi
		if err := rows.Scan(&i.DonviID, &i.BhdID, &i.Name); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const findDonViByID = `-- name: FindDonViByID :one
SELECT donvi_id, bhd_id, name FROM don_vi WHERE donvi_id = $1 LIMIT 1
`

func (q *Queries) FindDonViByID(ctx context.Context, donviID string) (DonVi, error) {
	row := q.db.QueryRow(ctx, findDonViByID, donviID)
	var i DonVi
	err := row.Scan(&i.DonviID, &i.BhdID, &i.Name)
	return i, err
}

const updateDonVi = `-- name: UpdateDonVi :one
UPDATE don_vi 
SET 
    bhd_id = $2, name = $3
WHERE donvi_id = $1 
RETURNING donvi_id, bhd_id, name
`

type UpdateDonViParams struct {
	DonviID string `json:"donvi_id"`
	BhdID   string `json:"bhd_id"`
	Name    string `json:"name"`
}

func (q *Queries) UpdateDonVi(ctx context.Context, arg UpdateDonViParams) (DonVi, error) {
	row := q.db.QueryRow(ctx, updateDonVi, arg.DonviID, arg.BhdID, arg.Name)
	var i DonVi
	err := row.Scan(&i.DonviID, &i.BhdID, &i.Name)
	return i, err
}
