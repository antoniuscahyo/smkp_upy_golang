package main

import (
	"gocrud/controllers/homecontroller"
	"gocrud/controllers/registercontroller"
	"gocrud/controllers/logincontroller"
	"gocrud/controllers/productcontroller"
	"gocrud/controllers/authcontroller"
	"net/http"

	"gocrud/controllers/dashboardcontroller"
	"gocrud/controllers/rekaplaporanperunitcontroller"
	"gocrud/controllers/rekaplaporanperpegawaicontroller"

	"gocrud/controllers/referensiunitcontroller"
	"gocrud/controllers/datapegawaicontroller"
	"gocrud/controllers/settingpenggunacontroller"
	"gocrud/controllers/settingmenucontroller"
	"gocrud/controllers/settingrolecontroller"
	"gocrud/controllers/importlogpresensicontroller"
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
	http.HandleFunc("/rekap_laporan_bulanan_perunit", rekaplaporanperunitcontroller.Index)
	http.HandleFunc("/rekap_laporan_bulanan_perpegawai", rekaplaporanperpegawaicontroller.Index)

	http.HandleFunc("/referensi_unit", referensiunitcontroller.Index)
	http.HandleFunc("/referensi_unit/add", referensiunitcontroller.Add)
	http.HandleFunc("/referensi_unit/processadd", referensiunitcontroller.ProcessAdd)
	http.HandleFunc("/referensi_unit/delete", referensiunitcontroller.Delete)
	http.HandleFunc("/referensi_unit/edit", referensiunitcontroller.Edit)
	http.HandleFunc("/referensi_unit/update", referensiunitcontroller.Update)

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
	http.HandleFunc("/import_log_presensi/add", importlogpresensicontroller.Add)
	http.HandleFunc("/import_log_presensi/processadd", importlogpresensicontroller.ProcessAdd)
	http.HandleFunc("/import_log_presensi/delete", importlogpresensicontroller.Delete)
	http.HandleFunc("/import_log_presensi/edit", importlogpresensicontroller.Edit)
	http.HandleFunc("/import_log_presensi/update", importlogpresensicontroller.Update)

	http.Handle("/static/",
		http.StripPrefix("/static/",
			http.FileServer(http.Dir("assets"))))

	http.Handle("/images/",
		http.StripPrefix("/images/",
			http.FileServer(http.Dir("assets/images"))))

	http.ListenAndServe(":3000", nil)

}
