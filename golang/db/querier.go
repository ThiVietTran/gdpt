// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.15.0

package db

import (
	"context"
)

type Querier interface {
	CreatePost(ctx context.Context, arg CreatePostParams) (Post, error)
	CreateQuestion(ctx context.Context, arg CreateQuestionParams) (Question, error)
	CreateReset(ctx context.Context, arg CreateResetParams) (Reset, error)
	CreateUser(ctx context.Context, arg CreateUserParams) (User, error)
	DeletePostByIDs(ctx context.Context, arg DeletePostByIDsParams) error
	DeleteQuestionByIDs(ctx context.Context, id int64) error
	DeleteResetsForUser(ctx context.Context, userID int64) error
	FindAllQuestions(ctx context.Context) ([]Question, error)
	FindPostByIDs(ctx context.Context, arg FindPostByIDsParams) (Post, error)
	FindPostsByAuthor(ctx context.Context, authorID int64) ([]Post, error)
	FindQuestionByIDs(ctx context.Context, id int64) (Question, error)
	FindResetByCode(ctx context.Context, code string) (Reset, error)
	FindUserByEmail(ctx context.Context, lower string) (User, error)
	FindUserByID(ctx context.Context, id int64) (User, error)
	FindUserByVerificationCode(ctx context.Context, verification string) (User, error)
	UpdatePost(ctx context.Context, arg UpdatePostParams) (Post, error)
	UpdateQuestionExplain(ctx context.Context, arg UpdateQuestionExplainParams) (Question, error)
	UpdateUserPassword(ctx context.Context, arg UpdateUserPasswordParams) error
	UpdateUserStatus(ctx context.Context, arg UpdateUserStatusParams) error
}

var _ Querier = (*Queries)(nil)
