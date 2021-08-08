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

	"github.com/kataras/go-sessions/v3"
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
		"foto":                              session.GetString("foto"),
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

	id, _ := strconv.ParseInt(session.GetString("IdPengguna"), 10, 64)

	var penggunaModel models.PenggunaModel
	datauser, _ := penggunaModel.Find(id)

	var data = map[string]interface{}{
		"datauser":      datauser,
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"IdPengguna":    session.GetString("IdPengguna"),
		"nama_role":     session.GetString("nama_role"),
		"foto":          session.GetString("foto"),
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

func UpdateProfile(w http.ResponseWriter, r *http.Request) {
	session := sessions.Start(w, r)
	if r.Method != "POST" {
		http.Error(w, "", http.StatusBadRequest)
		return
	}

	r.ParseForm()
	var pengguna entities.Pengguna

	if err := r.ParseMultipartForm(1024); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// STEP 1 CODE FROM https://dasarpemrogramangolang.novalagung.com/B-form-upload-file.html
	alias := r.FormValue("alias")
	if alias != "" {
		fmt.Println("Upload Foto Jalan!")
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
		pengguna.Foto = filename
		session.Set("foto", "uploads/profile/"+filename)

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

	}

	pengguna.IdPengguna, _ = strconv.ParseInt(r.Form.Get("IdPengguna"), 10, 64)
	pengguna.Username = r.Form.Get("Username")
	pengguna.Password = r.Form.Get("Password")
	pengguna.PasswordLama = r.Form.Get("PasswordLama")
	pengguna.Nama = r.Form.Get("NamaPengguna")
	var penggunaModel models.PenggunaModel
	penggunaModel.UpdateProfile(pengguna)

	session.Set("nama", pengguna.Nama)

	// fmt.Println("ini foto :" + r.FormValue("alias"))

	// w.Write([]byte("done"))
	http.Redirect(w, r, "/profile", http.StatusSeeOther)
}
