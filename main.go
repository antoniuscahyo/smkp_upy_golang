package main

import (
	"gocrud/controllers/homecontroller"
	"gocrud/controllers/registercontroller"
	"gocrud/controllers/logincontroller"
	//"gocrud/controllers/logoutcontroller"
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
)

func main() {
	http.HandleFunc("/", homecontroller.Index)
	http.HandleFunc("/register", registercontroller.Index)
	http.HandleFunc("/login", logincontroller.Index)
	http.HandleFunc("/login/auth", logincontroller.Login)
	http.HandleFunc("/logout", authcontroller.Logout)

	// http.HandleFunc("/", productcontroller.Index)
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
	http.HandleFunc("/data_pegawai", datapegawaicontroller.Index)
	http.HandleFunc("/setting_pengguna", settingpenggunacontroller.Index)
	http.HandleFunc("/setting_menu", settingmenucontroller.Index)
	http.HandleFunc("/setting_role", settingrolecontroller.Index)

	http.Handle("/static/",
		http.StripPrefix("/static/",
			http.FileServer(http.Dir("assets"))))

	http.Handle("/images/",
		http.StripPrefix("/images/",
			http.FileServer(http.Dir("assets/images"))))

	http.ListenAndServe(":3000", nil)

}
