package models

import (
	"gocrud/config"
	"gocrud/entities"
)

type PenggunaModel struct {

}

func (*PenggunaModel) FindAll() ([]entities.Pengguna, error) {
	db, err := config.GetDB()
	if	err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query("SELECT id_pengguna,username,password,nama,id_role,id_pegawai FROM pengguna")
		if err2 != nil {
			return nil,err2
		} else {
			var penggunas []entities.Pengguna
			for rows.Next() {
				var pengguna entities.Pengguna
				rows.Scan(&pengguna.IdPengguna, &pengguna.Username, &pengguna.Password, &pengguna.Nama, &pengguna.IdRole, &pengguna.IdPegawai)
				penggunas = append(penggunas, pengguna)
			}
			return penggunas, nil
		}
	}
}

func (*PenggunaModel) Find(id int64) (entities.Pengguna, error) {
	db, err := config.GetDB()
	if	err != nil {
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
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec("INSERT INTO pengguna(username,password,nama,id_role,id_pegawai) VALUES (?,?,?,?,?)", pengguna.Username,pengguna.Password,pengguna.Nama,pengguna.IdRole,pengguna.IdPegawai)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*PenggunaModel) Update(pengguna entities.Pengguna) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec("UPDATE pengguna SET username = ?,password = ?,nama = ?,id_role = ?,id_pegawai = ? WHERE id_pengguna = ?", pengguna.Username,pengguna.Password,pengguna.Nama,pengguna.IdRole,pengguna.IdPegawai,pengguna.IdPengguna)
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
	if	err != nil {
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