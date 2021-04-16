package main

import (
	"gocrud/controllers/homecontroller"
	"gocrud/controllers/registercontroller"
	"gocrud/controllers/logincontroller"
	"gocrud/controllers/logoutcontroller"
	"gocrud/controllers/productcontroller"
	"net/http"
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

	http.Handle("/static/",
		http.StripPrefix("/static/",
			http.FileServer(http.Dir("assets"))))

	http.Handle("/images/",
		http.StripPrefix("/images/",
			http.FileServer(http.Dir("assets/images"))))

	http.ListenAndServe(":3000", nil)

}
