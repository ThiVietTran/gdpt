// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.15.0
// source: bac_hoc.sql

package db

import (
	"context"
)

const createBacHoc = `-- name: CreateBacHoc :one
INSERT INTO bac_hoc (id, name) VALUES ($1, $2) RETURNING id, name
`

type CreateBacHocParams struct {
	ID   string `json:"id"`
	Name string `json:"name"`
}

func (q *Queries) CreateBacHoc(ctx context.Context, arg CreateBacHocParams) (BacHoc, error) {
	row := q.db.QueryRow(ctx, createBacHoc, arg.ID, arg.Name)
	var i BacHoc
	err := row.Scan(&i.ID, &i.Name)
	return i, err
}

const deleteBacHocByIDs = `-- name: DeleteBacHocByIDs :exec
DELETE FROM bac_hoc WHERE id = $1
`

func (q *Queries) DeleteBacHocByIDs(ctx context.Context, id string) error {
	_, err := q.db.Exec(ctx, deleteBacHocByIDs, id)
	return err
}

const findBacHoc = `-- name: FindBacHoc :many
SELECT id, name FROM bac_hoc ORDER BY id DESC
`

func (q *Queries) FindBacHoc(ctx context.Context) ([]BacHoc, error) {
	rows, err := q.db.Query(ctx, findBacHoc)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []BacHoc{}
	for rows.Next() {
		var i BacHoc
		if err := rows.Scan(&i.ID, &i.Name); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const findBacHocByIDs = `-- name: FindBacHocByIDs :one
SELECT id, name FROM bac_hoc WHERE id = $1 LIMIT 1
`

func (q *Queries) FindBacHocByIDs(ctx context.Context, id string) (BacHoc, error) {
	row := q.db.QueryRow(ctx, findBacHocByIDs, id)
	var i BacHoc
	err := row.Scan(&i.ID, &i.Name)
	return i, err
}

const updateBacHoc = `-- name: UpdateBacHoc :one
UPDATE bac_hoc SET name = $2 WHERE id = $1 RETURNING id, name
`

type UpdateBacHocParams struct {
	ID   string `json:"id"`
	Name string `json:"name"`
}

func (q *Queries) UpdateBacHoc(ctx context.Context, arg UpdateBacHocParams) (BacHoc, error) {
	row := q.db.QueryRow(ctx, updateBacHoc, arg.ID, arg.Name)
	var i BacHoc
	err := row.Scan(&i.ID, &i.Name)
	return i, err
}
