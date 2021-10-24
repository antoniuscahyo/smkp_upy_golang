package config

import (
	"time"
	"database/sql"

	_ "github.com/go-sql-driver/mysql"
	"github.com/go-telegram-bot-api/telegram-bot-api"
)

// var DB_DRIVER = goDotEnvVariable("DB_DRIVER")
// fmt.Println(DB_DRIVER)

func GetEnv(params string) string {
	return goDotEnvVariable(params)
}

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

func SendBotTele(Activity string, IsiPesan string) {
	// fmt.Println("Run Bot Tele")
	bot, err := tgbotapi.NewBotAPI(goDotEnvVariable("APP_TOKEN_BOT_TELEGRAM"))
	if err != nil {
		// fmt.Print(err)
	}
	bot.Debug = false
	// Send Message
	// msg := tgbotapi.NewMessage(update.Message.Chat.ID, update.Message.Text)
	currentTime := time.Now()
	timenow := currentTime.Format("2006-01-02 15:04:05")
	// msg := tgbotapi.NewMessage(516352671, IsiPesan+"\n"+timenow)
	BuildMessage := "[Activity "+Activity+" - "+goDotEnvVariable("APP_HOST")+"]\n\n"+IsiPesan+"\n\n"+timenow
	msg := tgbotapi.NewMessageToChannel("@logappsmkpupy", BuildMessage)
	bot.Send(msg)
	// Send Message
}