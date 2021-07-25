package logincontroller

import (
	"SMKPUPY/config"
	"fmt"
	"html/template"
	"net/http"

	"github.com/kataras/go-sessions"
	"golang.org/x/crypto/bcrypt"
)

func Index(response http.ResponseWriter, request *http.Request) {
	tmp, _ := template.ParseFiles("views/login/index.html")
	tmp.Execute(response, nil)
}

func Login(response http.ResponseWriter, request *http.Request) {
	session := sessions.Start(response, request)
	if len(session.GetString("username")) != 0 {
		http.Redirect(response, request, "/home", 302)
	}
	if request.Method != "POST" {
		http.ServeFile(response, request, "views/login/index.html")
		return
	}
	username := request.FormValue("username")
	password := request.FormValue("password")

	users := QueryUser(username)

	//deskripsi dan compare password
	var passwordtes = bcrypt.CompareHashAndPassword([]byte(users.Password), []byte(password))

	if passwordtes == nil {
		//login success
		session := sessions.Start(response, request)
		session.Set("username", users.Username)
		session.Set("nama", users.Nama)
		session.Set("Idrole", users.Idrole)
		session.Set("IdPengguna", users.ID)
		session.Set("id_unit", users.IdUnit)
		session.Set("id_pegawai", users.IdPegawai)
		session.Set("nama_role", users.NamaRole)
		if users.Foto == "" {
			session.Set("foto", "images/img.jpg")
		} else {
			session.Set("foto", "uploads/profile/"+users.Foto)
		}

		if users.Idrole == 4 || users.Idrole == 5 {
			http.Redirect(response, request, "/profile", 302)
		} else {
			http.Redirect(response, request, "/dashboard", 302)
		}
		fmt.Println("Login Sukses")
	} else {
		//login failed
		fmt.Println(passwordtes)
		// http.Redirect(response, request, "/login", 302)

		js := `<script type="text/javascript"  charset="utf-8">
		if (confirm('Username/Password yang anda masukkan salah!')){
			window.location = window.location.protocol+window.location.hostname+":3000";
		 }else{
			window.location = window.location.protocol+window.location.hostname+":3000";
		 }
		</script>`

		response.Write([]byte(js))
	}
}

type user struct {
	ID        int
	Username  string
	Nama      string
	Password  string
	Idrole    int
	IdUnit    int
	IdPegawai int
	NamaRole  string
	Foto      string
}

func QueryUser(username string) user {
	var users = user{}
	db, err := config.GetDB()
	if err != nil {
		fmt.Println(err)
	}

	db.QueryRow(`
	SELECT 
	IFNULL(pengguna.id_pengguna,0) AS id_pengguna, 
	IFNULL(pengguna.username,'') AS username, 
	IFNULL(pengguna.nama,'') AS nama, 
	IFNULL(pengguna.password,'') AS password,
	IFNULL(pengguna.id_role,0) AS id_role,
	IFNULL(pengguna.id_unit,0) AS id_unit,
	IFNULL(pengguna.id_pegawai,0) AS id_pegawai,
	IFNULL(role.nama_role,'') AS nama_role,
	IFNULL(pengguna.foto,'') AS foto
	FROM pengguna
	JOIN role ON pengguna.id_role=role.id_role
	WHERE pengguna.username=?`, username).
		Scan(
			&users.ID,
			&users.Username,
			&users.Nama,
			&users.Password,
			&users.Idrole,
			&users.IdUnit,
			&users.IdPegawai,
			&users.NamaRole,
			&users.Foto,
		)
	return users
}
