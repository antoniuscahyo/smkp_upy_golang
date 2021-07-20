package config

import (
	"database/sql"

	_ "github.com/go-sql-driver/mysql"
)

// var DB_DRIVER = goDotEnvVariable("DB_DRIVER")
// fmt.Println(DB_DRIVER)

func GetDB() (db *sql.DB, err error) {

	dbDriver := goDotEnvVariable("DB_DRIVER")
	dbName := goDotEnvVariable("DB_NAME")
	dbHost := goDotEnvVariable("DB_HOST")
	dbPort := goDotEnvVariable("DB_PORT")
	dbUser := goDotEnvVariable("DB_USER")
	dbPass := goDotEnvVariable("DB_PASS")
	db, err = sql.Open(dbDriver, dbUser+":"+dbPass+"@tcp("+dbHost+":"+dbPort+")/"+dbName)
	return
}
