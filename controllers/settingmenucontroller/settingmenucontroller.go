package settingmenucontroller

import (
	"html/template"
	"net/http"
	"fmt"
)

func Index(response http.ResponseWriter, request *http.Request) {

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

	t.Execute(response, nil)
	return
}