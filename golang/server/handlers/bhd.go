package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/julienschmidt/httprouter"
	"github.com/karlkeefer/pngr/golang/db"
	"github.com/karlkeefer/pngr/golang/env"
	"github.com/karlkeefer/pngr/golang/errors"
	"github.com/karlkeefer/pngr/golang/server/write"
)

func CreateBHD(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	decoder := json.NewDecoder(r.Body)
	p := &db.Bhd{}
	err := decoder.Decode(p)
	if err != nil || p == nil {
		return write.Error(errors.NoJSONBody)
	}

	return write.JSONorErr(env.DB().CreateBhd(r.Context(), db.CreateBhdParams{
		ID:   p.ID,
		Name: p.Name,
	}))
}

func GetBHD(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	params := httprouter.ParamsFromContext(r.Context())
	id := params.ByName("id")

	bhd, err := env.DB().FindBhdByIDs(r.Context(), id)
	if err != nil {
		if isNotFound(err) {
			return write.Error(errors.PostNotFound)
		}
		return write.Error(err)
	}

	return write.JSON(bhd)
}

func GetBHDs(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	return write.JSONorErr(env.DB().FindBhd(r.Context()))
}

func UpdateBHD(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	decoder := json.NewDecoder(r.Body)
	p := &db.Bhd{}
	err := decoder.Decode(p)
	if err != nil || p == nil {
		return write.Error(errors.NoJSONBody)
	}

	return write.JSONorErr(env.DB().UpdateBhd(r.Context(), db.UpdateBhdParams{
		ID:   p.ID,
		Name: p.Name,
	}))
}

func DeleteBHD(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	params := httprouter.ParamsFromContext(r.Context())
	id := params.ByName("id")

	return write.SuccessOrErr(env.DB().DeleteBhdByIDs(r.Context(), id))
}
