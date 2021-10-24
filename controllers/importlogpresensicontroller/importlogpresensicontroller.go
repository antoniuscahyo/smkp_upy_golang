package importlogpresensicontroller

import (
	"github.com/kataras/go-sessions/v3"
	"SMKPUPY/config"
	"bufio"
	"database/sql"
	"fmt"
	"html/template"
	"io"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"time"
)

func Index(response http.ResponseWriter, request *http.Request) {

	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	data := map[string]interface{}{
		"username":      session.GetString("username"),
		"nama_pengguna": session.GetString("nama"),
		"Idrole":        session.GetString("Idrole"),
		"NamaAplikasi":  session.GetString("nama_aplikasi"),
		"foto":          session.GetString("foto"),
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

	DBNAME := config.GetEnv("DB_NAME")
	HOST := config.GetEnv("DB_HOST")
	PORT := config.GetEnv("DB_PORT")
	USER := config.GetEnv("DB_USER")
	PASS := config.GetEnv("DB_PASS")
	db, err := sql.Open("mysql", USER+":"+PASS+"@tcp("+HOST+":"+PORT+")/"+DBNAME)
	defer db.Close()

	for scanner.Scan() {
		someString := scanner.Text()
		words := strings.Fields(someString)
		_, err = db.Exec("insert ignore log_mesin_finger values (?, ?, ?)", words[0], words[1], words[2])
		if err != nil {
			fmt.Println(err.Error())
			return
		}
		// fmt.Println("insert success!")
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
