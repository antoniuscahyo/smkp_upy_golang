package importlogpresensicontroller

import (
	"github.com/kataras/go-sessions"
	// "SMKPUPY/config"
	"database/sql"
	"path/filepath"
	"html/template"
	"net/http"
	"strings"
	"bufio"
	"time"
	"fmt"
	"log"
	"os"
	"io"
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

	var t, err = template.ParseFiles(
		"views/import_log_presensi/index.html",
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

func RouteSubmitPost(w http.ResponseWriter, r *http.Request) {

    if r.Method != "POST" {
        http.Error(w, "", http.StatusBadRequest)
        return
    }

    if err := r.ParseMultipartForm(1024); err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
        return
    }

	// STEP 1 CODE FROM https://dasarpemrogramangolang.novalagung.com/B-form-upload-file.html
    alias := r.FormValue("alias")

	uploadedFile, handler, err := r.FormFile("file")
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer uploadedFile.Close()

	dir, err := os.Getwd()
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// STEP 2 CODE FROM https://dasarpemrogramangolang.novalagung.com/B-form-upload-file.html
	filename := handler.Filename
	if alias != "" {
		filename = fmt.Sprintf("%s%s", alias, filepath.Ext(handler.Filename))
	}

	fileLocation := filepath.Join(dir, "/assets/uploads/log_presensi", filename)
	targetFile, err := os.OpenFile(fileLocation, os.O_WRONLY|os.O_CREATE, 0666)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer targetFile.Close()

	if _, err := io.Copy(targetFile, uploadedFile); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// INSERT TO SQL CODE
	file, err := os.Open(fileLocation)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	defer file.Close()

	reader := bufio.NewReader(file)
	scanner := bufio.NewScanner(reader)

	
	db, err := sql.Open("mysql", "root:12345@tcp(127.0.0.1:3306)/db_monitoring_kehadiran_pegawai")
    defer db.Close()

	for scanner.Scan() {
		someString := scanner.Text()
		words := strings.Fields(someString)
		_, err = db.Exec("insert into log_mesin_finger values (?, ?, ?)",words[0],words[1],words[2])
		if err != nil {
			fmt.Println(err.Error())
			return
		}
		fmt.Println("insert success!")
	}
	// INSERT TO SQL CODE

	// Code Blocks Delete File setelah 10 Detik upload sukses!!!
	time.Sleep(time.Second * 10)
	e := os.Remove(fileLocation)
    if e != nil {
        log.Fatal(e)
    }

	// w.Write([]byte("done"))
	http.Redirect(w, r, "/import_log_presensi", http.StatusSeeOther)
}