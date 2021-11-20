package importlogpresensicontroller

import (
	"SMKPUPY/config"
	"SMKPUPY/entities"
	"SMKPUPY/models"
	"bufio"
	"database/sql"
	"fmt"
	"html/template"
	"io"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"time"

	"github.com/kataras/go-sessions/v3"
)

func Index(response http.ResponseWriter, request *http.Request) {

	session := sessions.Start(response, request)
	if len(session.GetString("username")) == 0 {
		http.Redirect(response, request, "/login", 301)
	}

	var logModel models.LogImportPresensiModel
	logdata, _ := logModel.FindAll()

	data := map[string]interface{}{
		"logdata":       logdata,
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

	countData := 0
	for scanner.Scan() {
		someString := scanner.Text()
		words := strings.Fields(someString)
		_, err = db.Exec("INSERT IGNORE log_mesin_finger VALUES (?, ?, ?)", words[0], words[1], words[2])
		if err != nil {
			fmt.Println(err.Error())
			return
		}
		countData++
		// fmt.Println("insert success!")
	}
	// INSERT TO SQL CODE

	currentTime := time.Now()
	timenow := currentTime.Format("2006-01-02 15:04:05")

	var log entities.LogImportPresensi
	log.TanggalImport = timenow
	log.TanggalLogAwal = r.PostFormValue("TanggalAwal")
	log.TanggalLogAkhir = r.PostFormValue("TanggalAkhir")
	log.Tahun = r.PostFormValue("Tahun")
	log.Bulan = r.PostFormValue("Bulan")
	log.LokasiMesin = r.PostFormValue("LokasiMesin")
	log.JumlahData = countData
	log.NamaFile = filename
	var importLogModel models.LogImportPresensiModel
	importLogModel.Create(&log)

	var dataDeleteRekap entities.LogImportPresensi
	dataDeleteRekap.Tahun = r.PostFormValue("Tahun")
	dataDeleteRekap.Bulan = r.PostFormValue("Bulan")
	importLogModel.DeleteLaporanRekap(&dataDeleteRekap)

	var dataCreateRekap entities.LogImportPresensi
	dataCreateRekap.Tahun = r.PostFormValue("Tahun")
	dataCreateRekap.Bulan = r.PostFormValue("Bulan")
	dataCreateRekap.TanggalLogAwal = r.PostFormValue("TanggalAwal")
	dataCreateRekap.TanggalLogAkhir = r.PostFormValue("TanggalAkhir")
	importLogModel.CreateLaporanRekap(&dataCreateRekap)

	// Code Blocks Delete File setelah 10 Detik upload sukses!!!
	/*time.Sleep(time.Second * 10)
	e := os.Remove(fileLocation)
	if e != nil {
		log.Fatal(e)
	}*/

	// w.Write([]byte("done"))

	http.Redirect(w, r, "/import_log_presensi", http.StatusSeeOther)
	/*js := `<script type="text/javascript"  charset="utf-8">
	document.addEventListener("DOMContentLoaded", function(event) {
		notify('Sukses!','Update data log presensi, Berhasil','success');
		$('#modal-loader').modal('hide');
	});
	</script>`
	w.Write([]byte(js))
	return*/
}
