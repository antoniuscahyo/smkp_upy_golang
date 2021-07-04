package rekaplaporanperunitcontroller

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

	var unitkerjaModel models.UnitModel
	unitkerja, _ := unitkerjaModel.FindAll()

	data := map[string]interface{}{
		"unitkerja":     unitkerja,
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"id_unit":       session.GetString("id_unit"),
		"NamaAplikasi":  "SMKP UPY",
	}

	var t, err = template.ParseFiles(
		"views/rekap_laporan_bulanan_perunit/index.html",
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

func LoadData(response http.ResponseWriter, request *http.Request) {
	IdUnit, _ := strconv.ParseInt(request.PostFormValue("IdUnit"), 10, 64)
	TanggalAwal := request.PostFormValue("TanggalAwal")
	TanggalAkhir := request.PostFormValue("TanggalAkhir")

	var laporanModel models.LaporanModel
	rekaplaporan, _ := laporanModel.RekapLaporan(TanggalAwal, TanggalAkhir, IdUnit)

	data := map[string]interface{}{
		"data":         rekaplaporan,
		"NamaAplikasi": "SMKP UPY",
	}

	var t, err = template.ParseFiles(
		"views/rekap_laporan_bulanan_perunit/tabel.html",
	)

	if err != nil {
		fmt.Println(err.Error())
		http.Error(response, err.Error(), http.StatusInternalServerError)
		return
	}

	t.Execute(response, data)
	return
}
