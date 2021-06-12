package settingpenggunacontroller

import (
	"html/template"
	"net/http"
	"fmt"
	"github.com/kataras/go-sessions"
	"gocrud/models"	
	"gocrud/entities"
	"strconv"
)

func Index(response http.ResponseWriter, request *http.Request) {

	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}
	
	var penggunaModel models.PenggunaModel
	records, _ := penggunaModel.FindAll()

	// fmt.Printf("%+v\n", records)

	data := map[string]interface{} {
		"records" : records,
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
		"views/setting_pengguna/add.html",
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

func ProcessAdd(response http.ResponseWriter, request *http.Request) {
	request.ParseForm()
	var pengguna entities.Pengguna
	pengguna.Username = request.Form.Get("Username")
	pengguna.Password = request.Form.Get("Password")
	pengguna.Nama = request.Form.Get("NamaPengguna")
	pengguna.IdRole, _ = strconv.ParseInt(request.Form.Get("IdRole"), 10, 64)
	pengguna.IdPegawai, _ = strconv.ParseInt(request.Form.Get("IdPegawai"), 10, 64)
	var penggunaModel models.PenggunaModel
	penggunaModel.Create(&pengguna)
	http.Redirect(response, request, "/setting_pengguna", http.StatusSeeOther)
}

func Update(response http.ResponseWriter, request *http.Request) {
	request.ParseForm()
	var pengguna entities.Pengguna
	pengguna.IdPengguna, _ = strconv.ParseInt(request.Form.Get("IdPengguna"), 10, 64)
	pengguna.Password = request.Form.Get("Password")
	pengguna.Nama = request.Form.Get("NamaPengguna")
	pengguna.IdRole, _ = strconv.ParseInt(request.Form.Get("IdRole"), 10, 64)
	pengguna.IdPegawai, _ = strconv.ParseInt(request.Form.Get("IdPegawai"), 10, 64)
	var penggunaModel models.PenggunaModel
	penggunaModel.Update(pengguna)
	http.Redirect(response, request, "/setting_pengguna", http.StatusSeeOther)
}

func Delete(response http.ResponseWriter, request *http.Request) {
	query := request.URL.Query()
	id, _ := strconv.ParseInt(query.Get("id"), 10, 64)
	var penggunaModel models.PenggunaModel
	penggunaModel.Delete(id)
	http.Redirect(response, request, "/setting_pengguna", http.StatusSeeOther)
}

func Edit(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	query := request.URL.Query()
	id, _ := strconv.ParseInt(query.Get("id"), 10, 64)
	var penggunaModel models.PenggunaModel
	records, _ := penggunaModel.Find(id)
	
	data := map[string]interface{} {
		"records": records,
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}

	var t, err = template.ParseFiles(
		"views/setting_pengguna/edit.html",
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