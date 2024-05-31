package server

import (
	"log"
	"net/http"
	"runtime/debug"

	"github.com/julienschmidt/httprouter"
	"github.com/karlkeefer/pngr/golang/db"
	"github.com/karlkeefer/pngr/golang/env"
	"github.com/karlkeefer/pngr/golang/errors"
	"github.com/karlkeefer/pngr/golang/server/handlers"
	"github.com/karlkeefer/pngr/golang/server/write"
)

func (srv *server) ConfigureRouter() {
	srv.router = httprouter.New()

	// setup error handlers for our router
	srv.router.MethodNotAllowed = write.Error(errors.BadRequestMethod)
	srv.router.NotFound = write.Error(errors.RouteNotFound)
	srv.router.PanicHandler = func(w http.ResponseWriter, r *http.Request, err interface{}) {
		log.Println("Panic on", r.URL.Path)
		debug.PrintStack()
		write.Error(errors.InternalError)(w, r)
	}

	// SESSION
	srv.POST("/session", handlers.Login)
	srv.DELETE("/session", handlers.Logout)

	// RESETS
	srv.POST("/reset", handlers.CreateReset)
	srv.GET("/reset/:code", handlers.DoReset)

	// USER
	srv.POST("/user", handlers.Signup)
	srv.GET("/user", handlers.Whoami)
	srv.POST("/user/verify", handlers.Verify)
	srv.PUT("/user/password", handlers.UpdatePassword)

	// POSTS
	srv.GET("/post", handlers.GetPosts)
	srv.GET("/post/:id", handlers.GetPost)
	srv.POST("/post", handlers.CreatePost)
	srv.PUT("/post", handlers.UpdatePost)
	srv.DELETE("/post/:id", handlers.DeletePost)

	//CAMERA
	// srv.POST("/camera", handlers.CameraCommand)

	//TRACNGHIEM
	srv.GET("/question", handlers.GetQuestions)
	srv.GET("/question/:id", handlers.GetQuestion)
	srv.POST("/question", handlers.CreateQuestion)
	srv.PUT("/question", handlers.UpdateQuestion)
	srv.DELETE("/question/:id", handlers.DeleteQuestion)

	// BACHOC
	srv.GET("/bachoc", handlers.GetBacHocs)
	srv.GET("/bachoc/:id", handlers.GetBacHoc)
	srv.POST("/bachoc", handlers.CreateBacHoc)
	srv.PUT("/bachoc", handlers.UpdateBacHoc)
	srv.DELETE("/bachoc/:id", handlers.DeleteBacHoc)

	// BHD
	srv.GET("/bhd", handlers.GetBHDs)
	srv.GET("/bhd/:id", handlers.GetBHD)
	srv.POST("/bhd", handlers.CreateBHD)
	srv.PUT("/bhd", handlers.UpdateBHD)
	srv.DELETE("/bhd/:id", handlers.DeleteBHD)

	// HUYNH TRUONG
	srv.GET("/huynhtruong", handlers.GetHuynhTruongs)
	srv.GET("/huynhtruong/:id", handlers.GetHuynhTruong)
	srv.POST("/huynhtruong", handlers.CreateHuynhTruong)
	srv.PUT("/huynhtruong", handlers.UpdateHuynhTruong)
	srv.DELETE("/huynhtruong/:id", handlers.DeleteHuynhTruong)

	// DON VI
	srv.GET("/don_vis", handlers.GetDonVis)
	srv.GET("/don_vi/:id", handlers.GetDonVi)
	srv.POST("/don_vi", handlers.CreateDonVi)
	srv.PUT("/don_vi", handlers.UpdateDonVi)
	srv.DELETE("/don_vi/:id", handlers.DeleteDonVi)
}

// srvHandler is the extended handler function that our API routes use
type srvHandler func(env env.Env, user *db.User, w http.ResponseWriter, r *http.Request) http.HandlerFunc

// helpers for easily adding routes
func (srv *server) GET(path string, handler srvHandler) {
	srv.router.HandlerFunc(http.MethodGet, path, srv.wrap(handler))
}
func (srv *server) PUT(path string, handler srvHandler) {
	srv.router.HandlerFunc(http.MethodPut, path, srv.wrap(handler))
}
func (srv *server) POST(path string, handler srvHandler) {
	srv.router.HandlerFunc(http.MethodPost, path, srv.wrap(handler))
}
func (srv *server) DELETE(path string, handler srvHandler) {
	srv.router.HandlerFunc(http.MethodDelete, path, srv.wrap(handler))
}

// wrap does all the middleware together
func (srv *server) wrap(h srvHandler) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		// convert our fancy handler to a normal handlerFunc
		fn := withUserAndEnv(srv.env, h, w, r)
		// wrap it with middlewares
		wrapped := lag(csrf(cors(fn)))
		// execute the wrapped handler
		wrapped(w, r)
	}
}
