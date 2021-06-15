package models

import (
	"SMKPUPY/config"
	"SMKPUPY/entities"
)

type JamKerjaModel struct {

}

func (*JamKerjaModel) FindAll() ([]entities.JamKerja, error) {
	db, err := config.GetDB()
	if	err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query(`SELECT 
		id_jam_kerja, 
		nama_jam_kerja
		FROM
		jam_kerja`)
		if err2 != nil {
			return nil,err2
		} else {
			var jamkerjas []entities.JamKerja
			for rows.Next() {
				var jamkerja entities.JamKerja
				rows.Scan(&jamkerja.IdJamKerja, &jamkerja.NamaJamKerja)
				jamkerjas = append(jamkerjas, jamkerja)
			}
			return jamkerjas, nil
		}
	}
}

func (*JamKerjaModel) Find(id int64) (entities.JamKerja, error) {
	db, err := config.GetDB()
	if	err != nil {
		return entities.JamKerja{}, err
	} else {
		rows, err2 := db.Query(`SELECT
			id_jam_kerja, 
			nama_jam_kerja, 
			jam_masuk_senin, 
			jam_pulang_senin, 
			jam_masuk_selasa, 
			jam_pulang_selasa, 
			jam_masuk_rabu, 
			jam_pulang_rabu, 
			jam_masuk_kamis, 
			jam_pulang_kamis, 
			jam_masuk_jumat, 
			jam_pulang_jumat, 
			jam_masuk_sabtu, 
			jam_pulang_sabtu, 
			jam_masuk_minggu, 
			jam_pulang_minggu
		FROM
			jam_kerja 
		WHERE id_jam_kerja = ?`, id)
		if err2 != nil {
			return entities.JamKerja{}, err2
		} else {
			var jamkerja entities.JamKerja
			for rows.Next() {
				rows.Scan(&jamkerja.IdJamKerja,
					&jamkerja.NamaJamKerja,
					&jamkerja.JamMasukSenin,
					&jamkerja.JamPulangSenin,
					&jamkerja.JamMasukSelasa,
					&jamkerja.JamPulangSelasa,
					&jamkerja.JamMasukRabu,
					&jamkerja.JamPulangRabu,
					&jamkerja.JamMasukKamis,
					&jamkerja.JamPulangKamis,
					&jamkerja.JamMasukJumat,
					&jamkerja.JamPulangJumat,
					&jamkerja.JamMasukSabtu,
					&jamkerja.JamPulangSabtu,
					&jamkerja.JamMasukMinggu,
					&jamkerja.JamPulangMinggu)
			}
			return jamkerja, nil
		}
	}
}

func (*JamKerjaModel) Create(jamkerja *entities.JamKerja) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec(`INSERT INTO 
		jam_kerja(nama_jam_kerja, 
			jam_masuk_senin, 
			jam_pulang_senin, 
			jam_masuk_selasa, 
			jam_pulang_selasa, 
			jam_masuk_rabu, 
			jam_pulang_rabu, 
			jam_masuk_kamis, 
			jam_pulang_kamis, 
			jam_masuk_jumat, 
			jam_pulang_jumat, 
			jam_masuk_sabtu, 
			jam_pulang_sabtu, 
			jam_masuk_minggu, 
			jam_pulang_minggu
		) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`, 
		&jamkerja.NamaJamKerja,
		&jamkerja.JamMasukSenin,
		&jamkerja.JamPulangSenin,
		&jamkerja.JamMasukSelasa,
		&jamkerja.JamPulangSelasa,
		&jamkerja.JamMasukRabu,
		&jamkerja.JamPulangRabu,
		&jamkerja.JamMasukKamis,
		&jamkerja.JamPulangKamis,
		&jamkerja.JamMasukJumat,
		&jamkerja.JamPulangJumat,
		&jamkerja.JamMasukSabtu,
		&jamkerja.JamPulangSabtu,
		&jamkerja.JamMasukMinggu,
		&jamkerja.JamPulangMinggu)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*JamKerjaModel) Update(jamkerja entities.JamKerja) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec(`UPDATE jam_kerja SET 
		nama_jam_kerja = ?, 
		jam_masuk_senin = ?, 
		jam_pulang_senin = ?, 
		jam_masuk_selasa = ?, 
		jam_pulang_selasa = ?, 
		jam_masuk_rabu = ?, 
		jam_pulang_rabu = ?, 
		jam_masuk_kamis = ?, 
		jam_pulang_kamis = ?, 
		jam_masuk_jumat = ?, 
		jam_pulang_jumat = ?, 
		jam_masuk_sabtu = ?, 
		jam_pulang_sabtu = ?, 
		jam_masuk_minggu = ?, 
		jam_pulang_minggu = ?
		WHERE id_jam_kerja = ?`, 
		&jamkerja.NamaJamKerja,
		&jamkerja.JamMasukSenin,
		&jamkerja.JamPulangSenin,
		&jamkerja.JamMasukSelasa,
		&jamkerja.JamPulangSelasa,
		&jamkerja.JamMasukRabu,
		&jamkerja.JamPulangRabu,
		&jamkerja.JamMasukKamis,
		&jamkerja.JamPulangKamis,
		&jamkerja.JamMasukJumat,
		&jamkerja.JamPulangJumat,
		&jamkerja.JamMasukSabtu,
		&jamkerja.JamPulangSabtu,
		&jamkerja.JamMasukMinggu,
		&jamkerja.JamPulangMinggu,
		&jamkerja.IdJamKerja)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*JamKerjaModel) Delete(id int64) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec("DELETE FROM jam_kerja WHERE id_jam_kerja = ?", id)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}