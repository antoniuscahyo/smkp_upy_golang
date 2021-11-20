package main

import (
	"SMKPUPY/controllers/authcontroller"
	"SMKPUPY/controllers/homecontroller"
	"SMKPUPY/controllers/logincontroller"
	"SMKPUPY/controllers/productcontroller"
	"SMKPUPY/controllers/registercontroller"
	"fmt"
	"net/http"

	"SMKPUPY/controllers/dashboardcontroller"

	"SMKPUPY/controllers/rekaplaporanperpegawaicontroller"
	"SMKPUPY/controllers/rekaplaporanperunitcontroller"

	"SMKPUPY/controllers/rekaplaporanperpegawaicontrollerv2"
	"SMKPUPY/controllers/rekaplaporanperunitcontrollerv2"

	"SMKPUPY/controllers/referensijadwalkerjacontroller"
	"SMKPUPY/controllers/referensijamkerjacontroller"
	"SMKPUPY/controllers/referensiunitcontroller"

	"SMKPUPY/controllers/datapegawaicontroller"

	"SMKPUPY/controllers/settingmenucontroller"
	"SMKPUPY/controllers/settingpenggunacontroller"
	"SMKPUPY/controllers/settingrolecontroller"

	"SMKPUPY/controllers/importlogpresensicontroller"

	"SMKPUPY/config"
)

func main() {
	http.HandleFunc("/", homecontroller.Index)
	http.HandleFunc("/register", registercontroller.Index)
	http.HandleFunc("/login", logincontroller.Index)
	http.HandleFunc("/login/auth", logincontroller.Login)
	http.HandleFunc("/logout", authcontroller.Logout)

	http.HandleFunc("/product", productcontroller.Index)
	http.HandleFunc("/product/index", productcontroller.Index)
	http.HandleFunc("/product/add", productcontroller.Add)
	http.HandleFunc("/product/processadd", productcontroller.ProcessAdd)
	http.HandleFunc("/product/delete", productcontroller.Delete)
	http.HandleFunc("/product/edit", productcontroller.Edit)
	http.HandleFunc("/product/update", productcontroller.Update)

	http.HandleFunc("/dashboard", dashboardcontroller.Index)
	http.HandleFunc("/profile", dashboardcontroller.Profile)
	http.HandleFunc("/profile/update_profile", dashboardcontroller.UpdateProfile)

	// Laporan Pegawai
	http.HandleFunc("/rekap_laporan_bulanan_perunit", rekaplaporanperunitcontroller.Index)
	http.HandleFunc("/rekap_laporan_bulanan_perunit/load_data", rekaplaporanperunitcontroller.LoadData)

	http.HandleFunc("/rekap_laporan_bulanan_perpegawai", rekaplaporanperpegawaicontroller.Index)
	http.HandleFunc("/rekap_laporan_bulanan_perpegawai/load_data", rekaplaporanperpegawaicontroller.LoadData)

	http.HandleFunc("/rekap_laporan_bulanan_perunitv2", rekaplaporanperunitcontrollerv2.Index)
	http.HandleFunc("/rekap_laporan_bulanan_perunitv2/load_data", rekaplaporanperunitcontrollerv2.LoadData)

	http.HandleFunc("/rekap_laporan_bulanan_perpegawaiv2", rekaplaporanperpegawaicontrollerv2.Index)
	http.HandleFunc("/rekap_laporan_bulanan_perpegawaiv2/load_data", rekaplaporanperpegawaicontrollerv2.LoadData)
	// Laporan Pegawai

	http.HandleFunc("/referensi_unit", referensiunitcontroller.Index)
	http.HandleFunc("/referensi_unit/add", referensiunitcontroller.Add)
	http.HandleFunc("/referensi_unit/processadd", referensiunitcontroller.ProcessAdd)
	http.HandleFunc("/referensi_unit/delete", referensiunitcontroller.Delete)
	http.HandleFunc("/referensi_unit/edit", referensiunitcontroller.Edit)
	http.HandleFunc("/referensi_unit/update", referensiunitcontroller.Update)

	http.HandleFunc("/referensi_jam_kerja", referensijamkerjacontroller.Index)
	http.HandleFunc("/referensi_jam_kerja/add", referensijamkerjacontroller.Add)
	http.HandleFunc("/referensi_jam_kerja/processadd", referensijamkerjacontroller.ProcessAdd)
	http.HandleFunc("/referensi_jam_kerja/delete", referensijamkerjacontroller.Delete)
	http.HandleFunc("/referensi_jam_kerja/edit", referensijamkerjacontroller.Edit)
	http.HandleFunc("/referensi_jam_kerja/update", referensijamkerjacontroller.Update)

	http.HandleFunc("/referensi_jadwal_kerja", referensijadwalkerjacontroller.Index)
	http.HandleFunc("/referensi_jadwal_kerja/add", referensijadwalkerjacontroller.Add)
	http.HandleFunc("/referensi_jadwal_kerja/processadd", referensijadwalkerjacontroller.ProcessAdd)
	http.HandleFunc("/referensi_jadwal_kerja/delete", referensijadwalkerjacontroller.Delete)
	http.HandleFunc("/referensi_jadwal_kerja/edit", referensijadwalkerjacontroller.Edit)
	http.HandleFunc("/referensi_jadwal_kerja/update", referensijadwalkerjacontroller.Update)

	http.HandleFunc("/data_pegawai", datapegawaicontroller.Index)
	http.HandleFunc("/data_pegawai/add", datapegawaicontroller.Add)
	http.HandleFunc("/data_pegawai/processadd", datapegawaicontroller.ProcessAdd)
	http.HandleFunc("/data_pegawai/delete", datapegawaicontroller.Delete)
	http.HandleFunc("/data_pegawai/edit", datapegawaicontroller.Edit)
	http.HandleFunc("/data_pegawai/update", datapegawaicontroller.Update)

	http.HandleFunc("/setting_pengguna", settingpenggunacontroller.Index)
	http.HandleFunc("/setting_pengguna/add", settingpenggunacontroller.Add)
	http.HandleFunc("/setting_pengguna/processadd", settingpenggunacontroller.ProcessAdd)
	http.HandleFunc("/setting_pengguna/delete", settingpenggunacontroller.Delete)
	http.HandleFunc("/setting_pengguna/edit", settingpenggunacontroller.Edit)
	http.HandleFunc("/setting_pengguna/update", settingpenggunacontroller.Update)

	http.HandleFunc("/setting_menu", settingmenucontroller.Index)
	http.HandleFunc("/setting_menu/add", settingmenucontroller.Add)
	http.HandleFunc("/setting_menu/processadd", settingmenucontroller.ProcessAdd)
	http.HandleFunc("/setting_menu/delete", settingmenucontroller.Delete)
	http.HandleFunc("/setting_menu/edit", settingmenucontroller.Edit)
	http.HandleFunc("/setting_menu/update", settingmenucontroller.Update)

	http.HandleFunc("/setting_role", settingrolecontroller.Index)
	http.HandleFunc("/setting_role/add", settingrolecontroller.Add)
	http.HandleFunc("/setting_role/processadd", settingrolecontroller.ProcessAdd)
	http.HandleFunc("/setting_role/delete", settingrolecontroller.Delete)
	http.HandleFunc("/setting_role/edit", settingrolecontroller.Edit)
	http.HandleFunc("/setting_role/update", settingrolecontroller.Update)

	http.HandleFunc("/import_log_presensi", importlogpresensicontroller.Index)
	http.HandleFunc("/import_log_presensi/process", importlogpresensicontroller.RouteSubmitPost)

	http.Handle("/static/",
		http.StripPrefix("/static/",
			http.FileServer(http.Dir("assets"))))

	http.Handle("/images/",
		http.StripPrefix("/images/",
			http.FileServer(http.Dir("assets/images"))))

	http.Handle("/uploads/",
		http.StripPrefix("/uploads/",
			http.FileServer(http.Dir("assets/uploads"))))

	PORT := config.GetEnv("APP_PORT")
	// HOST := config.GetEnv("APP_HOST")
	// config.SendBotTele("Engine","Engine Start On "+HOST+":"+PORT+" !")
	fmt.Println("App SMKP UPY Run ON Port :" + PORT)
	http.ListenAndServe(":"+PORT, nil)
}
