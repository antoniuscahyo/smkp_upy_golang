package config

import (
	// Import godotenv
	"log"
	"os"

	"github.com/joho/godotenv"
)

// use godot package to load/read the .env file and
// return the value of the key
func goDotEnvVariable(key string) string {

	// load .env file

	err := godotenv.Load(".env")

	if err != nil {
		log.Fatalf("Error loading .env file")
	}

	return os.Getenv(key)
}

func GetBulan(bulan string) string {
	switch bulan {
	case "1":
		return "Januari"
	case "2":
		return "Februari"
	case "3":
		return "Maret"
	case "4":
		return "April"
	case "5":
		return "Mei"
	case "6":
		return "Juni"
	case "7":
		return "Juli"
	case "8":
		return "Agustus"
	case "9":
		return "September"
	case "10":
		return "Oktober"
	case "11":
		return "November"
	case "12":
		return "Desember"
	}
	return ""
}
