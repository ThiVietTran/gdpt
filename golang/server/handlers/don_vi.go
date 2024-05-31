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

func CreateDonVi(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	decoder := json.NewDecoder(r.Body)
	p := &db.DonVi{}
	err := decoder.Decode(p)
	if err != nil || p == nil {
		return write.Error(errors.NoJSONBody)
	}

	return write.JSONorErr(env.DB().CreateDonVi(r.Context(), db.CreateDonViParams{
		DonviID: p.DonviID,
		BhdID:   p.BhdID,
		Name:    p.Name,
	}))
}

func GetDonVi(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	params := httprouter.ParamsFromContext(r.Context())
	id := params.ByName("id")

	post, err := env.DB().FindDonViByID(r.Context(), id)
	if err != nil {
		if isNotFound(err) {
			return write.Error(errors.PostNotFound)
		}
		return write.Error(err)
	}

	return write.JSON(post)
}

func GetDonVis(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	return write.JSONorErr(env.DB().FindAllDonVi(r.Context()))
}

func UpdateDonVi(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	decoder := json.NewDecoder(r.Body)
	p := &db.DonVi{}
	err := decoder.Decode(p)
	if err != nil || p == nil {
		return write.Error(errors.NoJSONBody)
	}

	return write.JSONorErr(env.DB().UpdateDonVi(r.Context(), db.UpdateDonViParams{
		DonviID: p.DonviID,
		BhdID:   p.BhdID,
		Name:    p.Name,
	}))
}

func DeleteDonVi(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	params := httprouter.ParamsFromContext(r.Context())
	id := params.ByName("id")

	return write.SuccessOrErr(env.DB().DeleteDonViByID(r.Context(), id))
}
