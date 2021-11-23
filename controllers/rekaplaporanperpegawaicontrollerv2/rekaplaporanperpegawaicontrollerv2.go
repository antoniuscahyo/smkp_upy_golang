package rekaplaporanperpegawaicontrollerv2

import (
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

	IdRole, _ := strconv.ParseInt(session.GetString("Idrole"), 10, 64)
	IdUnit, _ := strconv.ParseInt(session.GetString("id_unit"), 10, 64)

	var pegawaiModel models.PegawaiModel
	pegawai, _ := pegawaiModel.FindAll2(IdRole, IdUnit)

	var unitkerjaModel models.UnitModel
	unitkerja, _ := unitkerjaModel.FindAll()

	data := map[string]interface{}{
		"unitkerja":     unitkerja,
		"pegawai":       pegawai,
		"username":      session.GetString("username"),
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"id_unit":       session.GetString("id_unit"),
		"id_pegawai":    session.GetString("id_pegawai"),
		"NamaAplikasi":  session.GetString("nama_aplikasi"),
		"foto":          session.GetString("foto"),
	}

	var t, err = template.ParseFiles(
		"views/rekap_laporan_bulanan_perpegawaiv2/index.html",
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
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	IdUnit, _ := strconv.ParseInt(request.PostFormValue("IdUnit"), 10, 64)
	IdPegawai, _ := strconv.ParseInt(request.PostFormValue("IdPegawai"), 10, 64)
	Tahun := request.PostFormValue("Tahun")
	Bulan := request.PostFormValue("Bulan")

	IdRole, _ := strconv.ParseInt(session.GetString("Idrole"), 10, 64)

	var laporanModel models.LaporanModelv2
	detailharian, _ := laporanModel.DetailHarianv2(Tahun, Bulan, IdUnit, IdPegawai, IdRole)

	data := map[string]interface{}{
		"data":         detailharian,
		"NamaAplikasi": session.GetString("nama_aplikasi"),
	}

	var t, err = template.ParseFiles(
		"views/rekap_laporan_bulanan_perpegawaiv2/tabel.html",
	)

	if err != nil {
		fmt.Println(err.Error())
		http.Error(response, err.Error(), http.StatusInternalServerError)
		return
	}

	t.Execute(response, data)
	return
}
