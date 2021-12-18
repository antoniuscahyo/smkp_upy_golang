package rekaplaporanperunitcontrollerv2

import (
	"SMKPUPY/config"
	"SMKPUPY/models"
	"encoding/json"
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

	var unitkerjaModel models.UnitModel
	unitkerja, _ := unitkerjaModel.FindAll()

	data := map[string]interface{}{
		"unitkerja":     unitkerja,
		"username":      session.GetString("username"),
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"id_unit":       session.GetString("id_unit"),
		"NamaAplikasi":  session.GetString("nama_aplikasi"),
		"foto":          session.GetString("foto"),
	}

	var t, err = template.ParseFiles(
		"views/rekap_laporan_bulanan_perunitv2/index.html",
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
	Tahun := request.PostFormValue("Tahun")
	Bulan := request.PostFormValue("Bulan")

	var laporanModel models.LaporanModelv2
	rekaplaporan, _ := laporanModel.RekapLaporanv2(Tahun, Bulan, IdUnit)

	data := map[string]interface{}{
		"data":         rekaplaporan,
		"NamaAplikasi": session.GetString("nama_aplikasi"),
	}

	var t, err = template.ParseFiles(
		"views/rekap_laporan_bulanan_perunitv2/tabel.html",
	)

	if err != nil {
		fmt.Println(err.Error())
		http.Error(response, err.Error(), http.StatusInternalServerError)
		return
	}

	t.Execute(response, data)
	return
}

type Data struct {
	Status string
}

func UpdateInline(response http.ResponseWriter, request *http.Request) {
	request.ParseForm()
	var UpdateDataInline models.SUpdateDataInline
	UpdateDataInline.Id, _ = strconv.ParseInt(request.PostFormValue("Id"), 10, 64)
	if request.PostFormValue("ColName") == "ValVK" {
		UpdateDataInline.ColName = "jumlah_validasi"
	} else if request.PostFormValue("ColName") == "ValPIK" {
		UpdateDataInline.ColName = "jumlah_pot_insentif_kehadiran"
	} else if request.PostFormValue("ColName") == "ValVIK" {
		UpdateDataInline.ColName = "validasi_pot_insentif_kehadiran"
	} else if request.PostFormValue("ColName") == "ValUMKK" {
		UpdateDataInline.ColName = "umk_kehadiran"
	} else if request.PostFormValue("ColName") == "ValVUMK" {
		UpdateDataInline.ColName = "umk_validasi"
	}
	UpdateDataInline.NewVal = request.PostFormValue("NewVal")

	var laporanv2Model models.LaporanModelv2
	laporanv2Model.UpdateDataInline(UpdateDataInline)
	response.Header().Set("Content-Type", "application/json")
	p := Data{"success"}
	json.NewEncoder(response).Encode(p)
}

func Print(response http.ResponseWriter, request *http.Request) {

	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}
	IdUnit, _ := strconv.ParseInt(request.FormValue("IdUnit"), 10, 64)
	Tahun := request.FormValue("Tahun")
	Bulan := request.FormValue("Bulan")

	var laporanModel models.LaporanModelv2
	rekaplaporan, _ := laporanModel.RekapLaporanv2_print(Tahun, Bulan, IdUnit)

	var unitModel models.UnitModel
	unit, _ := unitModel.Find(IdUnit)

	var pegawaiModel models.PegawaiModel
	pegawai, _ := pegawaiModel.Find(unit.IdPegawai)

	data := map[string]interface{}{
		"data":         rekaplaporan,
		"unit_nama":    unit.UnitNama,
		"unit_kepala":  pegawai.NamaPegawai,
		"bulan":        config.GetBulan(Bulan),
		"tahun":        Tahun,
		"NamaAplikasi": session.GetString("nama_aplikasi"),
	}

	var t, err = template.ParseFiles(
		"views/rekap_laporan_bulanan_perunitv2/print.html",
	)

	if err != nil {
		fmt.Println(err.Error())
		http.Error(response, err.Error(), http.StatusInternalServerError)
		return
	}

	t.Execute(response, data)
	return
}
