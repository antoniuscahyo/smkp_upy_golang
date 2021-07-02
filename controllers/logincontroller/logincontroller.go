package logincontroller

import (
	"html/template"
	"net/http"
	"github.com/kataras/go-sessions"
	"golang.org/x/crypto/bcrypt"
	"SMKPUPY/config"
	"fmt"
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
		session.Set("namarole", users.NamaRole)
		if users.Idrole == 4 || users.Idrole == 5 {
			http.Redirect(response, request, "/profile", 302)
		} else {
			http.Redirect(response, request, "/dashboard", 302)
		}
		fmt.Println("Login Sukses")
	} else {
		//login failed
		fmt.Println(passwordtes)
		http.Redirect(response, request, "/login", 302)
	}
}

type user struct {
	ID       int
	Username string
	Nama     string
	Password string
	Idrole   int
	NamaRole string
}

func QueryUser(username string) user {
	var users = user{}
	db,err := config.GetDB()
	if err != nil {

	}
	
	db.QueryRow(`
	SELECT 
	pengguna.id_pengguna, 
	pengguna.username, 
	pengguna.nama, 
	pengguna.password,
	pengguna.id_role,
	role.nama_role
	FROM pengguna
	JOIN role ON pengguna.id_role=role.id_role
	WHERE pengguna.username=?`, username).
	Scan(
		&users.ID,
		&users.Username,
		&users.Nama,
		&users.Password,
		&users.Idrole,
		&users.NamaRole,
	)
	return users
}