package authcontroller

import (
	"net/http"
	"github.com/kataras/go-sessions/v3"
)

func Login(response http.ResponseWriter, request *http.Request) {
}

func Logout(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	session.Clear()
	sessions.Destroy(response, request)
	http.Redirect(response, request, "/", 302)
}