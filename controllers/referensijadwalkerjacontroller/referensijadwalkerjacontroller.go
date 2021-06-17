package referensijadwalkerjacontroller

import (
	"html/template"
	"SMKPUPY/models"
	"SMKPUPY/entities"
	"github.com/kataras/go-sessions"
	"net/http"
	"strconv"
	"fmt"
)

func Index(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	var jadwalkerjaModel models.JadwalKerjaModel
	jadwalkerja, _ := jadwalkerjaModel.FindAll()

	data := map[string]interface{} {
		"records": jadwalkerja,
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}

	var t, err = template.ParseFiles(
		"views/referensi_jadwal_kerja/index.html",
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

	var jamkerjaModel models.JamKerjaModel
	jamkerja, _ := jamkerjaModel.FindAll()

	var unitkerjaModel models.UnitModel
	unitkerja, _ := unitkerjaModel.FindAll()

	data := map[string]interface{} {
		"jamkerja": jamkerja,
		"unitkerja": unitkerja,
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}

	var t, err = template.ParseFiles(
		"views/referensi_jadwal_kerja/add.html",
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
	var jadwalkerja entities.JadwalKerja
	jadwalkerja.NamaJadwalKerja = request.Form.Get("NamaJadwalKerja")
	jadwalkerja.IdJamKerja, _ = strconv.ParseInt(request.Form.Get("IdJamKerja"), 10, 64)
	jadwalkerja.IdUnit, _ = strconv.ParseInt(request.Form.Get("IdUnit"), 10, 64)
	var jadwalkerjaModel models.JadwalKerjaModel
	jadwalkerjaModel.Create(&jadwalkerja)
	http.Redirect(response, request, "/referensi_jadwal_kerja", http.StatusSeeOther)
}

func Update(response http.ResponseWriter, request *http.Request) {
	request.ParseForm()
	var jadwalkerja entities.JadwalKerja
	jadwalkerja.IdJadwalKerja, _ = strconv.ParseInt(request.Form.Get("id"), 10, 64)
	jadwalkerja.NamaJadwalKerja = request.Form.Get("NamaJadwalKerja")
	jadwalkerja.IdJamKerja, _ = strconv.ParseInt(request.Form.Get("IdJamKerja"), 10, 64)
	jadwalkerja.IdUnit, _ = strconv.ParseInt(request.Form.Get("IdUnit"), 10, 64)
	var jadwalkerjaModel models.JadwalKerjaModel
	jadwalkerjaModel.Update(jadwalkerja)
	http.Redirect(response, request, "/referensi_jadwal_kerja", http.StatusSeeOther)
}


func Delete(response http.ResponseWriter, request *http.Request) {
	query := request.URL.Query()
	id, _ := strconv.ParseInt(query.Get("id"), 10, 64)
	var jadwalkerjaModel models.JadwalKerjaModel
	jadwalkerjaModel.Delete(id)
	http.Redirect(response, request, "/referensi_jadwal_kerja", http.StatusSeeOther)
}

func Edit(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	query := request.URL.Query()
	id, _ := strconv.ParseInt(query.Get("id"), 10, 64)

	var jadwalkerjaModel models.JadwalKerjaModel
	jadwalkerja, _ := jadwalkerjaModel.Find(id)

	var jamkerjaModel models.JamKerjaModel
	jamkerja, _ := jamkerjaModel.FindAll()

	var unitkerjaModel models.UnitModel
	unitkerja, _ := unitkerjaModel.FindAll()
	
	data := map[string]interface{} {
		"records": jadwalkerja,
		"jamkerja": jamkerja,
		"unitkerja": unitkerja,
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}

	var t, err = template.ParseFiles(
		"views/referensi_jadwal_kerja/edit.html",
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