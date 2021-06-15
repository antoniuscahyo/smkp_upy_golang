package referensijadwalkerjacontroller

import (
	"html/template"
	// "SMKPUPY/models"
	// "SMKPUPY/entities"
	"github.com/kataras/go-sessions"
	"net/http"
	// "strconv"
	"fmt"
)

func Index(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	data := map[string]interface{} {
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}

	/*var data = map[string]string{
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}*/
	var t, err = template.ParseFiles(
		"views/referensi_jadwal_kerja/index.html",
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

func Add(response http.ResponseWriter, request *http.Request) {
	/*
	fmt.Println("Run add")
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	data := map[string]interface{} {
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}

	var t, err = template.ParseFiles(
		"views/product/add.html",
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

	// tmp, _ := template.ParseFiles("views/product/add.html")
	// tmp.Execute(response, nil)
	*/
}

func ProcessAdd(response http.ResponseWriter, request *http.Request) {
	/*
	request.ParseForm()
	var product entities.Product
	product.Name = request.Form.Get("name")
	product.Price, _ = strconv.ParseFloat(request.Form.Get("price"), 64)
	product.Quantity, _ = strconv.ParseInt(request.Form.Get("quantity"), 10, 64)
	product.Description = request.Form.Get("description")
	var productModel models.ProductModel
	productModel.Create(&product)
	http.Redirect(response, request, "/product", http.StatusSeeOther)
	*/
}

func Update(response http.ResponseWriter, request *http.Request) {
	/*
	request.ParseForm()
	var product entities.Product
	product.Id, _ = strconv.ParseInt(request.Form.Get("id"), 10, 64)
	product.Name = request.Form.Get("name")
	product.Price, _ = strconv.ParseFloat(request.Form.Get("price"), 64)
	product.Quantity, _ = strconv.ParseInt(request.Form.Get("quantity"), 10, 64)
	product.Description = request.Form.Get("description")
	var productModel models.ProductModel
	productModel.Update(product)
	http.Redirect(response, request, "/product", http.StatusSeeOther)
	*/
}


func Delete(response http.ResponseWriter, request *http.Request) {
	/*
	query := request.URL.Query()
	id, _ := strconv.ParseInt(query.Get("id"), 10, 64)
	var productModel models.ProductModel
	productModel.Delete(id)
	http.Redirect(response, request, "/product", http.StatusSeeOther)
	*/
}

func Edit(response http.ResponseWriter, request *http.Request) {
	/*
	// fmt.Println("Edittt woy")
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	query := request.URL.Query()
	id, _ := strconv.ParseInt(query.Get("id"), 10, 64)
	var productModel models.ProductModel
	product, _ := productModel.Find(id)
	
	// data := map[string]interface{} {
	// 	"product": product,
	// }
	data := map[string]interface{} {
		"product": product,
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}

	// tmp, _ := template.ParseFiles("views/product/edit.html")
	// tmp.Execute(response, data)

	var t, err = template.ParseFiles(
		"views/product/edit.html",
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
	*/
}