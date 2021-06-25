package rekaplaporanperpegawaicontroller

import (
	"SMKPUPY/models"
	"html/template"
	"net/http"
	"strconv"
	"fmt"
	"github.com/kataras/go-sessions"
)

func Index(response http.ResponseWriter, request *http.Request) {
	
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	var unitkerjaModel models.UnitModel
	unitkerja, _ := unitkerjaModel.FindAll()

	var pegawaiModel models.PegawaiModel
	pegawai, _ := pegawaiModel.FindAll()

	data := map[string]interface{} {
		"unitkerja": unitkerja,
		"pegawai": pegawai,
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}

	var t, err = template.ParseFiles(
		"views/rekap_laporan_bulanan_perpegawai/index.html",
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

	// pegawai.IdProgramStudi, _ = strconv.ParseInt(request.Form.Get("IdProgramStudi"), 10, 64)
	// pegawai.PinFinger = request.Form.Get("PinFinger")

	IdUnit, _ := strconv.ParseInt(request.PostFormValue("IdUnit"), 10, 64)
	IdPegawai, _ := strconv.ParseInt(request.PostFormValue("IdPegawai"), 10, 64)
	TanggalAwal := request.PostFormValue("TanggalAwal")
	TanggalAkhir := request.PostFormValue("TanggalAkhir")

	fmt.Println(IdUnit)
	fmt.Println(IdPegawai)
	fmt.Println(TanggalAwal)
	fmt.Println(TanggalAkhir)

	var laporanModel models.LaporanModel
	detailharian, _ := laporanModel.DetailHarian(TanggalAwal,TanggalAkhir,IdUnit,IdPegawai)

	data := map[string]interface{} {
		"data": detailharian,
		"NamaAplikasi":  "SMKP UPY",
	}

	var t, err = template.ParseFiles(
		"views/rekap_laporan_bulanan_perpegawai/tabel.html",
	)

	if err != nil {
		fmt.Println(err.Error())
		http.Error(response, err.Error(), http.StatusInternalServerError)
		return
	}
	
	t.Execute(response, data)
	return
}