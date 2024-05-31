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

func CreateHuynhTruong(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	decoder := json.NewDecoder(r.Body)
	p := &db.HuynhTruong{}
	err := decoder.Decode(p)
	if err != nil || p == nil {
		return write.Error(errors.NoJSONBody)
	}

	return write.JSONorErr(env.DB().CreateHuynhTruong(r.Context(), db.CreateHuynhTruongParams{
		HuynhtruongID: p.HuynhtruongID,
		BhdID:         p.BhdID,
		DonviID:       p.DonviID,
		HtName:        p.HtName,
		HtAnh34:       p.HtAnh34,
		PhapDanh:      p.PhapDanh,
		NamSinh:       p.NamSinh,
		ChanhQuan:     p.ChanhQuan,
		DiaChi:        p.DiaChi,
		TrinhDo:       p.TrinhDo,
		NgheNghiep:    p.NgheNghiep,
		HonNhan:       p.HonNhan,
		ThoGioi:       p.ThoGioi,
		BacHoc:        p.BacHoc,
		TraiHuanLuyen: p.TraiHuanLuyen,
		NangKhieu:     p.NangKhieu,
	}))
}

func GetHuynhTruong(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	params := httprouter.ParamsFromContext(r.Context())
	id := params.ByName("id")

	post, err := env.DB().FindHuynhTruongByID(r.Context(), id)
	if err != nil {
		if isNotFound(err) {
			return write.Error(errors.PostNotFound)
		}
		return write.Error(err)
	}

	return write.JSON(post)
}

func GetHuynhTruongs(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	return write.JSONorErr(env.DB().FindAllHuynhTruong(r.Context()))
}

func UpdateHuynhTruong(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	decoder := json.NewDecoder(r.Body)
	p := &db.HuynhTruong{}
	err := decoder.Decode(p)
	if err != nil || p == nil {
		return write.Error(errors.NoJSONBody)
	}

	return write.JSONorErr(env.DB().UpdateHuynhTruong(r.Context(), db.UpdateHuynhTruongParams{
		HuynhtruongID: p.HuynhtruongID,
		BhdID:         p.BhdID,
		DonviID:       p.DonviID,
		HtName:        p.HtName,
		HtAnh34:       p.HtAnh34,
		PhapDanh:      p.PhapDanh,
		NamSinh:       p.NamSinh,
		ChanhQuan:     p.ChanhQuan,
		DiaChi:        p.DiaChi,
		TrinhDo:       p.TrinhDo,
		NgheNghiep:    p.NgheNghiep,
		HonNhan:       p.HonNhan,
		ThoGioi:       p.ThoGioi,
		BacHoc:        p.BacHoc,
		TraiHuanLuyen: p.TraiHuanLuyen,
		NangKhieu:     p.NangKhieu,
	}))
}

func DeleteHuynhTruong(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	params := httprouter.ParamsFromContext(r.Context())
	id := params.ByName("id")

	return write.SuccessOrErr(env.DB().DeleteHuynhTruongByID(r.Context(), id))
}
