package settingpenggunacontroller

import (
	"html/template"
	"net/http"
	"fmt"
	"github.com/kataras/go-sessions"
)

func Index(response http.ResponseWriter, request *http.Request) {

	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	data := map[string]interface{} {
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}

	var t, err = template.ParseFiles(
		"views/setting_pengguna/index.html",
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

func Add(response http.ResponseWriter, request *http.Request) {
}

func ProcessAdd(response http.ResponseWriter, request *http.Request) {
}

func Update(response http.ResponseWriter, request *http.Request) {
}

func Delete(response http.ResponseWriter, request *http.Request) {
}

func Edit(response http.ResponseWriter, request *http.Request) {
}