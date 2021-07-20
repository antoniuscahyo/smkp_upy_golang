package models

import (
	"SMKPUPY/config"
	"SMKPUPY/entities"
)

type AuthModel struct {
}

func (*AuthModel) GetUser(username string) (entities.User, error) {
	db, err := config.GetDB()
	if err != nil {
		return entities.User{}, err
	} else {
		rows, err2 := db.Query(`SELECT 
		id_pengguna, 
		username, 
		nama, 
		password,
		id_role 
		FROM 
		pengguna 
		WHERE 
		username = ?`, username)
		if err2 != nil {
			return entities.User{}, err2
		} else {
			var users entities.User
			for rows.Next() {
				rows.Scan(&users.ID, &users.Username, &users.Nama, &users.Password, &users.Idrole)
			}
			return users, nil
		}
	}
}
