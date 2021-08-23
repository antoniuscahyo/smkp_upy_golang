package datapegawaicontroller

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

	var pegawaiModel models.PegawaiModel
	pegawai, _ := pegawaiModel.FindAll()
	// fmt.Println(pegawai)

	data := map[string]interface{}{
		"records":       pegawai,
		"username":      session.GetString("username"),
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  session.GetString("nama_aplikasi"),
		"foto":          session.GetString("foto"),
	}

	var t, err = template.ParseFiles(
		"views/data_pegawai/index.html",
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

	var unitkerjaModel models.UnitModel
	unitkerja, _ := unitkerjaModel.FindAll()

	var fakultasModel models.FakultasModel
	fakultas, _ := fakultasModel.FindAll()

	var programstudiModel models.ProgramstudiModel
	programstudi, _ := programstudiModel.FindAll()

	data := map[string]interface{}{
		"unitkerja":     unitkerja,
		"fakultas":      fakultas,
		"programstudi":  programstudi,
		"username":      session.GetString("username"),
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"foto":          session.GetString("foto"),
		"NamaAplikasi":  session.GetString("nama_aplikasi"),
	}

	var t, err = template.ParseFiles(
		"views/data_pegawai/add.html",
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
	var pegawai entities.Pegawai
	pegawai.IdUnit, _ = strconv.ParseInt(request.Form.Get("IdUnit"), 10, 64)
	pegawai.IdFakultas, _ = strconv.ParseInt(request.Form.Get("IdFakultas"), 10, 64)
	pegawai.IdProgramStudi, _ = strconv.ParseInt(request.Form.Get("IdProgramStudi"), 10, 64)
	pegawai.PinFinger = request.Form.Get("PinFinger")
	pegawai.NisPegawai = request.Form.Get("NisPegawai")
	pegawai.NamaPegawai = request.Form.Get("NamaPegawai")
	pegawai.JabatanPegawai = request.Form.Get("JabatanPegawai")
	pegawai.StatusAktif, _ = strconv.ParseInt(request.Form.Get("StatusAktif"), 10, 64)
	var pegawaiModel models.PegawaiModel
	pegawaiModel.Create(&pegawai)
	http.Redirect(response, request, "/data_pegawai", http.StatusSeeOther)
}

func Update(response http.ResponseWriter, request *http.Request) {
	request.ParseForm()
	var pegawai entities.Pegawai
	pegawai.IdPegawai, _ = strconv.ParseInt(request.Form.Get("IdPegawai"), 10, 64)
	pegawai.IdUnit, _ = strconv.ParseInt(request.Form.Get("IdUnit"), 10, 64)
	pegawai.IdFakultas, _ = strconv.ParseInt(request.Form.Get("IdFakultas"), 10, 64)
	pegawai.IdProgramStudi, _ = strconv.ParseInt(request.Form.Get("IdProgramStudi"), 10, 64)
	pegawai.PinFinger = request.Form.Get("PinFinger")
	pegawai.NisPegawai = request.Form.Get("NisPegawai")
	pegawai.NamaPegawai = request.Form.Get("NamaPegawai")
	pegawai.JabatanPegawai = request.Form.Get("JabatanPegawai")
	pegawai.StatusAktif, _ = strconv.ParseInt(request.Form.Get("StatusAktif"), 10, 64)
	var pegawaiModel models.PegawaiModel
	pegawaiModel.Update(pegawai)
	http.Redirect(response, request, "/data_pegawai", http.StatusSeeOther)
}

func Delete(response http.ResponseWriter, request *http.Request) {
	query := request.URL.Query()
	id, _ := strconv.ParseInt(query.Get("id"), 10, 64)
	var pegawaiModel models.PegawaiModel
	pegawaiModel.Delete(id)
	http.Redirect(response, request, "/data_pegawai", http.StatusSeeOther)
}

func Edit(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	query := request.URL.Query()
	id, _ := strconv.ParseInt(query.Get("id"), 10, 64)
	var pegawaiModel models.PegawaiModel
	pegawai, _ := pegawaiModel.Find(id)

	var unitkerjaModel models.UnitModel
	unitkerja, _ := unitkerjaModel.FindAll()

	var fakultasModel models.FakultasModel
	fakultas, _ := fakultasModel.FindAll()

	var programstudiModel models.ProgramstudiModel
	programstudi, _ := programstudiModel.FindAll()

	data := map[string]interface{}{
		"records":       pegawai,
		"unitkerja":     unitkerja,
		"fakultas":      fakultas,
		"programstudi":  programstudi,
		"username":      session.GetString("username"),
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"foto":          session.GetString("foto"),
		"NamaAplikasi":  session.GetString("nama_aplikasi"),
	}

	var t, err = template.ParseFiles(
		"views/data_pegawai/edit.html",
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
