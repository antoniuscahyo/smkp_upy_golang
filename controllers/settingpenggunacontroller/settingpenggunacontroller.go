package settingpenggunacontroller

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

	var penggunaModel models.PenggunaModel
	records, _ := penggunaModel.FindAll()

	// fmt.Printf("%+v\n", records)

	data := map[string]interface{}{
		"records":       records,
		"username":      session.GetString("username"),
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  session.GetString("nama_aplikasi"),
		"foto":          session.GetString("foto"),
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

	var roleModel models.RoleModel
	roles, _ := roleModel.FindAll()

	var pegawaiModel models.PegawaiModel
	pegawais, _ := pegawaiModel.FindAll()

	data := map[string]interface{}{
		"roles":         roles,
		"pegawais":      pegawais,
		"username":      session.GetString("username"),
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"foto":          session.GetString("foto"),
		"NamaAplikasi":  session.GetString("nama_aplikasi"),
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
	pengguna.Username = request.Form.Get("Username")
	pengguna.Password = request.Form.Get("Password")
	pengguna.PasswordLama = request.Form.Get("PasswordLama")
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

	var roleModel models.RoleModel
	roles, _ := roleModel.FindAll()

	var pegawaiModel models.PegawaiModel
	pegawais, _ := pegawaiModel.FindAll()

	data := map[string]interface{}{
		"roles":         roles,
		"pegawais":      pegawais,
		"records":       records,
		"username":      session.GetString("username"),
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"foto":          session.GetString("foto"),
		"NamaAplikasi":  session.GetString("nama_aplikasi"),
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
