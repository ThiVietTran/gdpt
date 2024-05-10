package handlers

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/karlkeefer/pngr/golang/db"
	"github.com/karlkeefer/pngr/golang/env"
	"github.com/karlkeefer/pngr/golang/errors"
	"github.com/karlkeefer/pngr/golang/server/write"
)

type CameraCMD struct {
	CameraCmd string `json:"cmd"`
}

func CameraCommand(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc {
	if user.Status != db.UserStatusActive {
		return write.Error(errors.RouteUnauthorized)
	}

	decoder := json.NewDecoder(r.Body)
	cmd := &CameraCMD{}
	err := decoder.Decode(&cmd)
	if err != nil || cmd == nil {
		return write.Error(errors.NoJSONBody)
	}

	log.Println("------------ CAMERA COMMAND -------- ", cmd.CameraCmd)

	return write.Success()
}
