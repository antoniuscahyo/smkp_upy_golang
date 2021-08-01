package models

import (
	"SMKPUPY/config"
	"SMKPUPY/entities"
	"fmt"
	"log"

	"golang.org/x/crypto/bcrypt"
)

type PenggunaModel struct {
}

func (*PenggunaModel) FindAll() ([]entities.Pengguna, error) {
	db, err := config.GetDB()
	if err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query(`SELECT 
		pengguna.id_pengguna,
		pengguna.username,
		pengguna.password,
		pengguna.nama,
		role.id_role,
		role.nama_role,
		pengguna.id_pegawai
		FROM
		pengguna
		LEFT JOIN role ON pengguna.id_role = role.id_role`)
		if err2 != nil {
			return nil, err2
		} else {
			var penggunas []entities.Pengguna
			for rows.Next() {
				var pengguna entities.Pengguna
				rows.Scan(&pengguna.IdPengguna, &pengguna.Username, &pengguna.Password, &pengguna.Nama, &pengguna.IdRole, &pengguna.NamaRole, &pengguna.IdPegawai)
				penggunas = append(penggunas, pengguna)
			}
			return penggunas, nil
		}
	}
}

func (*PenggunaModel) Find(id int64) (entities.Pengguna, error) {
	db, err := config.GetDB()
	if err != nil {
		return entities.Pengguna{}, err
	} else {
		rows, err2 := db.Query("SELECT id_pengguna,username,password,nama,id_role,id_pegawai FROM pengguna WHERE id_pengguna = ?", id)
		if err2 != nil {
			return entities.Pengguna{}, err2
		} else {
			var pengguna entities.Pengguna
			for rows.Next() {
				rows.Scan(&pengguna.IdPengguna, &pengguna.Username, &pengguna.Password, &pengguna.Nama, &pengguna.IdRole, &pengguna.IdPegawai)
			}
			return pengguna, nil
		}
	}
}

func (*PenggunaModel) Create(pengguna *entities.Pengguna) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {
		result, err2 := db.Exec("INSERT INTO pengguna(username,password,nama,id_role,id_pegawai) VALUES (?,?,?,?,?)", pengguna.Username, hashAndSalt(pengguna.Password), pengguna.Nama, pengguna.IdRole, pengguna.IdPegawai)
		if err2 != nil {
			fmt.Println(err2.Error())
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*PenggunaModel) Update(pengguna entities.Pengguna) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {

		// GET DATA IF NOT UPDATE
		if len(pengguna.Password) < 2 {
			pengguna.Password = pengguna.PasswordLama
		} else {
			pengguna.Password = hashAndSalt(pengguna.Password)
		}
		// GET DATA IF NOT UPDATE

		result, err2 := db.Exec(`UPDATE 
		pengguna 
		SET username = ?,
		password = ?,
		nama = ?,
		id_role = ?,
		id_pegawai = ? 
		WHERE id_pengguna = ?`,
			pengguna.Username,
			pengguna.Password,
			pengguna.Nama,
			pengguna.IdRole,
			pengguna.IdPegawai,
			pengguna.IdPengguna)

		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*PenggunaModel) Delete(id int64) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {
		result, err2 := db.Exec("DELETE FROM pengguna WHERE id_pengguna = ?", id)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func hashAndSalt(pwd string) string {

	// Use GenerateFromPassword to hash & salt pwd.
	// MinCost is just an integer constant provided by the bcrypt
	// package along with DefaultCost & MaxCost.
	// The cost can be any value you want provided it isn't lower
	// than the MinCost (4)
	bytePwd := []byte(pwd)
	hash, err := bcrypt.GenerateFromPassword(bytePwd, bcrypt.MinCost)
	if err != nil {
		log.Println(err)
	}
	// GenerateFromPassword returns a byte slice so we need to
	// convert the bytes to a string and return it
	return string(hash)
}

func (*PenggunaModel) UpdateProfile(pengguna entities.Pengguna) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {

		// GET DATA IF NOT UPDATE
		if len(pengguna.Password) < 2 {
			pengguna.Password = pengguna.PasswordLama
		} else {
			pengguna.Password = hashAndSalt(pengguna.Password)
		}

		if pengguna.FotoLama == "images/img.jpg" {
			pengguna.Foto = ""
		} else {
			pengguna.Foto = pengguna.Foto
		}
		// GET DATA IF NOT UPDATE

		result, err2 := db.Exec(`UPDATE 
		pengguna 
		SET username = ?,
		password = ?,
		nama = ?,
		foto = ?
		WHERE id_pengguna = ?`,
			pengguna.Username,
			pengguna.Password,
			pengguna.Nama,
			pengguna.Foto,
			pengguna.IdPengguna)

		if err2 != nil {
			fmt.Println(err2)
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}
