package homecontroller

import (
	"html/template"
	// "SMKPUPY/models"
	// "SMKPUPY/entities"
	"fmt"
	"net/http"

	"github.com/kataras/go-sessions/v3"
)

func Index(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	var data = map[string]string{
		"username":      session.GetString("username"),
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"nama_role":     session.GetString("nama_role"),
		"NamaAplikasi":  session.GetString("nama_aplikasi"),
		"foto":          session.GetString("foto"),
	}
	var t, err = template.ParseFiles(
		"views/home/index.html",
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
