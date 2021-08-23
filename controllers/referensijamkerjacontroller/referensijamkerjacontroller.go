package referensijamkerjacontroller

import (
	"SMKPUPY/entities"
	"SMKPUPY/models"
	"fmt"
	"html/template"
	"net/http"
	"strconv"

	"github.com/kataras/go-sessions/v3"
)

func Index(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	var jamkerjaModel models.JamKerjaModel
	jamkerja, _ := jamkerjaModel.FindAll()

	data := map[string]interface{}{
		"records":       jamkerja,
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
		"foto":          session.GetString("foto"),
	}

	var t, err = template.ParseFiles(
		"views/referensi_jam_kerja/index.html",
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

	data := map[string]interface{}{
		"username":      session.GetString("username"),
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  session.GetString("nama_aplikasi"),
	}

	var t, err = template.ParseFiles(
		"views/referensi_jam_kerja/add.html",
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
	var jamkerja entities.JamKerja
	jamkerja.NamaJamKerja = request.Form.Get("NamaJamKerja")
	jamkerja.JamMasukSenin = request.Form.Get("JamMasukSenin")
	jamkerja.JamPulangSenin = request.Form.Get("JamPulangSenin")
	jamkerja.JamMasukSelasa = request.Form.Get("JamMasukSelasa")
	jamkerja.JamPulangSelasa = request.Form.Get("JamPulangSelasa")
	jamkerja.JamMasukRabu = request.Form.Get("JamMasukRabu")
	jamkerja.JamPulangRabu = request.Form.Get("JamPulangRabu")
	jamkerja.JamMasukKamis = request.Form.Get("JamMasukKamis")
	jamkerja.JamPulangKamis = request.Form.Get("JamPulangKamis")
	jamkerja.JamMasukJumat = request.Form.Get("JamMasukJumat")
	jamkerja.JamPulangJumat = request.Form.Get("JamPulangJumat")
	jamkerja.JamMasukSabtu = request.Form.Get("JamMasukSabtu")
	jamkerja.JamPulangSabtu = request.Form.Get("JamPulangSabtu")
	jamkerja.JamMasukMinggu = request.Form.Get("JamMasukMinggu")
	jamkerja.JamPulangMinggu = request.Form.Get("JamPulangMinggu")
	var jamkerjaModel models.JamKerjaModel
	jamkerjaModel.Create(&jamkerja)
	http.Redirect(response, request, "/referensi_jam_kerja", http.StatusSeeOther)
}

func Update(response http.ResponseWriter, request *http.Request) {
	request.ParseForm()
	var jamkerja entities.JamKerja
	jamkerja.IdJamKerja, _ = strconv.ParseInt(request.Form.Get("IdJamKerja"), 10, 64)
	jamkerja.NamaJamKerja = request.Form.Get("NamaJamKerja")
	jamkerja.JamMasukSenin = request.Form.Get("JamMasukSenin")
	jamkerja.JamPulangSenin = request.Form.Get("JamPulangSenin")
	jamkerja.JamMasukSelasa = request.Form.Get("JamMasukSelasa")
	jamkerja.JamPulangSelasa = request.Form.Get("JamPulangSelasa")
	jamkerja.JamMasukRabu = request.Form.Get("JamMasukRabu")
	jamkerja.JamPulangRabu = request.Form.Get("JamPulangRabu")
	jamkerja.JamMasukKamis = request.Form.Get("JamMasukKamis")
	jamkerja.JamPulangKamis = request.Form.Get("JamPulangKamis")
	jamkerja.JamMasukJumat = request.Form.Get("JamMasukJumat")
	jamkerja.JamPulangJumat = request.Form.Get("JamPulangJumat")
	jamkerja.JamMasukSabtu = request.Form.Get("JamMasukSabtu")
	jamkerja.JamPulangSabtu = request.Form.Get("JamPulangSabtu")
	jamkerja.JamMasukMinggu = request.Form.Get("JamMasukMinggu")
	jamkerja.JamPulangMinggu = request.Form.Get("JamPulangMinggu")
	var jamkerjaModel models.JamKerjaModel
	jamkerjaModel.Update(jamkerja)
	http.Redirect(response, request, "/referensi_jam_kerja", http.StatusSeeOther)
}

func Delete(response http.ResponseWriter, request *http.Request) {
	query := request.URL.Query()
	id, _ := strconv.ParseInt(query.Get("id"), 10, 64)
	var jamkerjaModel models.JamKerjaModel
	jamkerjaModel.Delete(id)
	http.Redirect(response, request, "/referensi_jam_kerja", http.StatusSeeOther)
}

func Edit(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	query := request.URL.Query()
	id, _ := strconv.ParseInt(query.Get("id"), 10, 64)
	var jamkerjaModel models.JamKerjaModel
	jamkerja, _ := jamkerjaModel.Find(id)

	data := map[string]interface{}{
		"records":       jamkerja,
		"username":      session.GetString("username"),
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  session.GetString("nama_aplikasi"),
	}

	var t, err = template.ParseFiles(
		"views/referensi_jam_kerja/edit.html",
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
