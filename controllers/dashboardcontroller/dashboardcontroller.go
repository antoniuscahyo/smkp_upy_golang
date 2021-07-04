package dashboardcontroller

import (
	"fmt"
	"html/template"
	"net/http"

	"github.com/kataras/go-sessions"
)

func Index(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	var data = map[string]string{
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}
	var t, err = template.ParseFiles(
		"views/home/dashboard.html",
		"views/template/_header.html",
		"views/template/_footer.html",
		"views/template/_sidebar.html",
	)

	if err != nil {
		fmt.Println(err.Error())
		http.Error(response, err.Error(), http.StatusInternalServerError)
		return
	}

	t.Execute(response, data)
	return
}

func Profile(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	var data = map[string]string{
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"nama_role":     session.GetString("nama_role"),
		"NamaAplikasi":  "SMKP UPY",
	}
	var t, err = template.ParseFiles(
		"views/home/profile.html",
		"views/template/_header.html",
		"views/template/_footer.html",
		"views/template/_sidebar.html",
	)

	if err != nil {
		fmt.Println(err.Error())
		http.Error(response, err.Error(), http.StatusInternalServerError)
		return
	}

	t.Execute(response, data)
	return
}
