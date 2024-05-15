// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0
// source: bhd.sql

package db

import (
	"context"
)

const createBhd = `-- name: CreateBhd :one
INSERT INTO bhd (id, name) VALUES ($1, $2) RETURNING id, name
`

type CreateBhdParams struct {
	ID   string `json:"id"`
	Name string `json:"name"`
}

func (q *Queries) CreateBhd(ctx context.Context, arg CreateBhdParams) (Bhd, error) {
	row := q.db.QueryRow(ctx, createBhd, arg.ID, arg.Name)
	var i Bhd
	err := row.Scan(&i.ID, &i.Name)
	return i, err
}

const deleteBhdByIDs = `-- name: DeleteBhdByIDs :exec
DELETE FROM bhd WHERE id = $1
`

func (q *Queries) DeleteBhdByIDs(ctx context.Context, id string) error {
	_, err := q.db.Exec(ctx, deleteBhdByIDs, id)
	return err
}

const findBhd = `-- name: FindBhd :many
SELECT id, name FROM bhd ORDER BY id DESC
`

func (q *Queries) FindBhd(ctx context.Context) ([]Bhd, error) {
	rows, err := q.db.Query(ctx, findBhd)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Bhd{}
	for rows.Next() {
		var i Bhd
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

const findBhdByIDs = `-- name: FindBhdByIDs :one
SELECT id, name FROM bhd WHERE id = $1 LIMIT 1
`

func (q *Queries) FindBhdByIDs(ctx context.Context, id string) (Bhd, error) {
	row := q.db.QueryRow(ctx, findBhdByIDs, id)
	var i Bhd
	err := row.Scan(&i.ID, &i.Name)
	return i, err
}

const updateBhd = `-- name: UpdateBhd :one
UPDATE bhd SET name = $2 WHERE id = $1 RETURNING id, name
`

type UpdateBhdParams struct {
	ID   string `json:"id"`
	Name string `json:"name"`
}

func (q *Queries) UpdateBhd(ctx context.Context, arg UpdateBhdParams) (Bhd, error) {
	row := q.db.QueryRow(ctx, updateBhd, arg.ID, arg.Name)
	var i Bhd
	err := row.Scan(&i.ID, &i.Name)
	return i, err
}
