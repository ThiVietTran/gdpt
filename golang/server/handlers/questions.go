package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/karlkeefer/pngr/golang/db"
	"github.com/karlkeefer/pngr/golang/env"
	"github.com/karlkeefer/pngr/golang/errors"
	"github.com/karlkeefer/pngr/golang/server/write"
)

func CreateQuestion(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	decoder := json.NewDecoder(r.Body)
	p := &db.Question{}
	err := decoder.Decode(p)
	if err != nil || p == nil {
		return write.Error(errors.NoJSONBody)
	}

	return write.JSONorErr(env.DB().CreateQuestion(r.Context(), db.CreateQuestionParams{
		BacHocID:     p.BacHocID,
		QuestionText: p.QuestionText,
		Option1:      p.Option1,
		Option2:      p.Option2,
		Option3:      p.Option3,
		Option4:      p.Option4,
		Explanation:  p.Explanation,
	}))
}

func GetQuestion(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	id, err := getID(r)
	if err != nil {
		return write.Error(errors.RouteNotFound)
	}

	post, err := env.DB().FindQuestionByIDs(r.Context(), id)
	if err != nil {
		if isNotFound(err) {
			return write.Error(errors.PostNotFound)
		}
		return write.Error(err)
	}

	return write.JSON(post)
}

func GetQuestions(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	return write.JSONorErr(env.DB().FindAllQuestions(r.Context()))
}

func UpdateQuestion(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	decoder := json.NewDecoder(r.Body)
	p := &db.Question{}
	err := decoder.Decode(p)
	if err != nil || p == nil {
		return write.Error(errors.NoJSONBody)
	}

	return write.JSONorErr(env.DB().UpdateQuestion(r.Context(), db.UpdateQuestionParams{
		BacHocID:     p.BacHocID,
		QuestionText: p.QuestionText,
		Option1:      p.Option1,
		Option2:      p.Option2,
		Option3:      p.Option3,
		Option4:      p.Option4,
		Explanation:  p.Explanation,
		ID:           p.ID,
	}))
}

func DeleteQuestion(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	id, err := getID(r)
	if err != nil {
		return write.Error(errors.RouteNotFound)
	}

	return write.SuccessOrErr(env.DB().DeleteQuestionByIDs(r.Context(), id))
}
