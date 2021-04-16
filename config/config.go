package config

import (
	"database/sql"

	_ "github.com/go-sql-driver/mysql"
)

func GetDB() (db *sql.DB, err error) {
	dbDriver := "mysql"
	dbName 	 := "db_monitoring_kehadiran_pegawai"
	dbHost   := "localhost"
	dbPort   := "3306"
	dbUser   := "root"
	dbPass   := "12345"
	db, err = sql.Open(dbDriver, dbUser+":"+dbPass+"@tcp("+dbHost+":"+dbPort+")/"+dbName)
	return
}
