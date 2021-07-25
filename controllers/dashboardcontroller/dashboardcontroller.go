package dashboardcontroller

import (
	"SMKPUPY/entities"
	"SMKPUPY/models"
	"fmt"
	"html/template"
	"io"
	"net/http"
	"os"
	"path/filepath"
	"strconv"

	"github.com/kataras/go-sessions"
)

func Index(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	var dashboardModel models.DashboardModel
	jumlahpegawai := dashboardModel.GetJumlahPegawai()
	jumlahpegawaimasuk := dashboardModel.GetJumlahPegawaiMasuk()
	jumlahpegawaitidakmasuk := dashboardModel.GetJumlahPegawaiTidakMasuk()
	jumlahpegawaitidakmemenuhijam := dashboardModel.GetJumlahPegawaiTidakMemenuhiJamKehadiran()

	var data = map[string]string{
		"username":                          session.GetString("username"),
		"message":                           "Welcome to the Go !",
		"nama_pengguna":                     session.GetString("nama"),
		"Idrole":                            session.GetString("Idrole"),
		"NamaAplikasi":                      "SMKP UPY",
		"jumlah_pegawai":                    strconv.Itoa(jumlahpegawai),
		"jumlah_pegawai_masuk":              strconv.Itoa(jumlahpegawaimasuk),
		"jumlah_pegawai_tidak_masuk":        strconv.Itoa(jumlahpegawaitidakmasuk),
		"jumlah_pegawai_tidak_memenuhi_jam": strconv.Itoa(jumlahpegawaitidakmemenuhijam),
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
		"IdPengguna":    session.GetString("IdPengguna"),
		"nama_role":     session.GetString("nama_role"),
		"foto":          session.GetString("foto"),
		"NamaAplikasi":  "SMKP UPY",
	}
	fmt.Println(session.GetString("foto"))
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

	http.Redirect(response, request, "/profile", http.StatusSeeOther)
}

func UpdateProfile(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Update Profile Jalan!")
	if r.Method != "POST" {
		http.Error(w, "", http.StatusBadRequest)
		return
	}

	if err := r.ParseMultipartForm(1024); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// STEP 1 CODE FROM https://dasarpemrogramangolang.novalagung.com/B-form-upload-file.html
	alias := r.FormValue("alias")

	uploadedFile, handler, err := r.FormFile("file")
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer uploadedFile.Close()

	dir, err := os.Getwd()
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// STEP 2 CODE FROM https://dasarpemrogramangolang.novalagung.com/B-form-upload-file.html
	filename := handler.Filename
	if alias != "" {
		filename = fmt.Sprintf("%s%s", alias, filepath.Ext(handler.Filename))
	}

	fileLocation := filepath.Join(dir, "/assets/uploads/profile", filename)
	targetFile, err := os.OpenFile(fileLocation, os.O_WRONLY|os.O_CREATE, 0666)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer targetFile.Close()

	if _, err := io.Copy(targetFile, uploadedFile); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	r.ParseForm()
	var pengguna entities.Pengguna
	pengguna.IdPengguna, _ = strconv.ParseInt(r.Form.Get("IdPengguna"), 10, 64)
	pengguna.Password = r.Form.Get("Password")
	pengguna.PasswordLama = r.Form.Get("PasswordLama")
	pengguna.Nama = r.Form.Get("NamaPengguna")
	pengguna.Foto = alias
	var penggunaModel models.PenggunaModel
	penggunaModel.Update(pengguna)

	// w.Write([]byte("done"))
	http.Redirect(w, r, "/profile", http.StatusSeeOther)
}
