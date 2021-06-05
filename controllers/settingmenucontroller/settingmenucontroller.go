package settingmenucontroller

import (
	"html/template"
	"net/http"
	"fmt"
	"github.com/kataras/go-sessions"
	"gocrud/models"	
	"gocrud/entities"
	"strconv"
)

func Index(response http.ResponseWriter, request *http.Request) {

	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	var menuModel models.MenuModel
	menus, _ := menuModel.FindAll()

	data := map[string]interface{} {
		"menus": menus,
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}

	var t, err = template.ParseFiles(
		"views/setting_menu/index.html",
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
		"views/setting_menu/add.html",
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

func ProcessAdd(response http.ResponseWriter, request *http.Request) {
	request.ParseForm()
	var menu entities.Menu
	menu.NamaMenu = request.Form.Get("NamaMenu")
	menu.LinkMenu = request.Form.Get("LinkMenu")
	menu.IconMenu = request.Form.Get("IconMenu")
	menu.KodeLevelMenu = request.Form.Get("KodeLevelMenu")
	var menuModel models.MenuModel
	menuModel.Create(&menu)
	http.Redirect(response, request, "/setting_menu", http.StatusSeeOther)
}

func Update(response http.ResponseWriter, request *http.Request) {
	request.ParseForm()
	var menu entities.Menu
	menu.IdMenu, _ = strconv.ParseInt(request.Form.Get("IdMenu"), 10, 64)
	menu.NamaMenu = request.Form.Get("NamaMenu")
	menu.LinkMenu = request.Form.Get("LinkMenu")
	menu.IconMenu = request.Form.Get("IconMenu")
	menu.KodeLevelMenu = request.Form.Get("KodeLevelMenu")
	var menuModel models.MenuModel
	menuModel.Update(menu)
	http.Redirect(response, request, "/setting_menu", http.StatusSeeOther)
}


func Delete(response http.ResponseWriter, request *http.Request) {
	query := request.URL.Query()
	id, _ := strconv.ParseInt(query.Get("id"), 10, 64)
	var menuModel models.MenuModel
	menuModel.Delete(id)
	http.Redirect(response, request, "/setting_menu", http.StatusSeeOther)
}

func Edit(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	query := request.URL.Query()
	id, _ := strconv.ParseInt(query.Get("id"), 10, 64)
	var menuModel models.MenuModel
	menu, _ := menuModel.Find(id)
	
	data := map[string]interface{} {
		"menu": menu,
		"username":      session.GetString("username"),
		"message":       "Welcome to the Go !",
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  "SMKP UPY",
	}

	var t, err = template.ParseFiles(
		"views/setting_menu/edit.html",
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