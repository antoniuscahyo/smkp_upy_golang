package models

import (
	"SMKPUPY/config"
	"SMKPUPY/entities"
	"fmt"
)

type JadwalKerjaModel struct {

}

func (*JadwalKerjaModel) FindAll() ([]entities.JadwalKerja, error) {
	db, err := config.GetDB()
	if	err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query(`SELECT 
		id_jadwal_kerja, 
		nama_jadwal_kerja, 
		unit_id,
		id_pegawai,
		id_jam_kerja
		FROM 
		jadwal_kerja`)
		if err2 != nil {
			return nil,err2
		} else {
			var jadwalkerjas []entities.JadwalKerja
			for rows.Next() {
				var jadwalkerja entities.JadwalKerja
				rows.Scan(&jadwalkerja.IdJadwalKerja, 
					&jadwalkerja.NamaJadwalKerja, 
					&jadwalkerja.IdUnit,
					&jadwalkerja.IdPegawai,
					&jadwalkerja.IdJamKerja)
				jadwalkerjas = append(jadwalkerjas, jadwalkerja)
			}
			return jadwalkerjas, nil
		}
	}
}

func (*JadwalKerjaModel) Find(id int64) (entities.JadwalKerja, error) {
	db, err := config.GetDB()
	if	err != nil {
		return entities.JadwalKerja{}, err
	} else {
		rows, err2 := db.Query(`SELECT 
			id_jadwal_kerja, 
			nama_jadwal_kerja, 
			unit_id,
			id_pegawai,
			id_jam_kerja
		FROM 
			jadwal_kerja
		WHERE 
			id_jadwal_kerja = ?`, id)
		if err2 != nil {
			return entities.JadwalKerja{}, err2
		} else {
			var jadwalkerja entities.JadwalKerja
			for rows.Next() {
				rows.Scan(&jadwalkerja.IdJadwalKerja, 
					&jadwalkerja.NamaJadwalKerja, 
					&jadwalkerja.IdUnit,
					&jadwalkerja.IdPegawai,
					&jadwalkerja.IdJamKerja)
			}
			return jadwalkerja, nil
		}
	}
}

func (*JadwalKerjaModel) Create(jadwalkerja *entities.JadwalKerja) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec(`INSERT INTO 
		jadwal_kerja(nama_jadwal_kerja, 
		unit_id,
		id_pegawai,
		id_jam_kerja) 
		VALUES (?,?,?,?)`, 
		jadwalkerja.NamaJadwalKerja, 
		jadwalkerja.IdUnit,
		jadwalkerja.IdPegawai,
		jadwalkerja.IdJamKerja)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*JadwalKerjaModel) Update(jadwalkerja entities.JadwalKerja) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec(`UPDATE jadwal_kerja SET 
		nama_jadwal_kerja = ?, 
		unit_id = ?,
		id_pegawai = ?,
		id_jam_kerja = ?
		WHERE id_jadwal_kerja = ?`, jadwalkerja.NamaJadwalKerja, 
		jadwalkerja.IdUnit, 
		jadwalkerja.IdPegawai, 
		jadwalkerja.IdJamKerja, 
		jadwalkerja.IdJadwalKerja)
		if err2 != nil {
			fmt.Println(err2)
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*JadwalKerjaModel) Delete(id int64) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec("DELETE FROM jadwal_kerja WHERE id_jadwal_kerja = ?", id)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}