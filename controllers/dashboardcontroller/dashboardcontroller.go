package dashboardcontroller

import (
	"SMKPUPY/models"
	"fmt"
	"html/template"
	"net/http"
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
