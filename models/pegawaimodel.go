package models

import (
	"SMKPUPY/config"
	"SMKPUPY/entities"
)

type PegawaiModel struct {

}

func (*PegawaiModel) FindAll() ([]entities.Pegawai, error) {
	db, err := config.GetDB()
	if	err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query(`
		SELECT
			pegawai.id_pegawai,
			pegawai.id_unit,
			pegawai.id_fakultas,
			pegawai.id_program_studi,
			pegawai.pin_finger,
			pegawai.nis_pegawai,
			pegawai.nama_pegawai,
			pegawai.jabatan_pegawai,
			pegawai.status_aktif,
			unit.unit_nama,
			fakultas.nama_fakultas,
			program_studi.nama_program_studi 
		FROM
			pegawai
		LEFT JOIN unit ON pegawai.id_unit = unit.unit_id
		LEFT JOIN fakultas ON pegawai.id_fakultas = fakultas.id_fakultas
		LEFT JOIN program_studi ON pegawai.id_program_studi = program_studi.id_program_studi`)
		if err2 != nil {
			return nil,err2
		} else {
			var pegawais []entities.Pegawai
			for rows.Next() {
				var pegawai entities.Pegawai
				rows.Scan(&pegawai.IdPegawai,
					&pegawai.IdUnit,
					&pegawai.IdFakultas,
					&pegawai.IdProgramStudi,
					&pegawai.PinFinger,
					&pegawai.NisPegawai,
					&pegawai.NamaPegawai,
					&pegawai.JabatanPegawai,
					&pegawai.StatusAktif,
					&pegawai.UnitNama,
					&pegawai.NamaFakultas,
					&pegawai.NamaProgramStudi)
				pegawais = append(pegawais, pegawai)
			}
			return pegawais, nil
		}
	}
}

func (*PegawaiModel) Find(id int64) (entities.Pegawai, error) {
	db, err := config.GetDB()
	if	err != nil {
		return entities.Pegawai{}, err
	} else {
		rows, err2 := db.Query(`SELECT
		pegawai.id_pegawai, 
		pegawai.id_unit, 
		pegawai.id_fakultas, 
		pegawai.id_program_studi, 
		pegawai.pin_finger, 
		pegawai.nis_pegawai, 
		pegawai.nama_pegawai, 
		pegawai.jabatan_pegawai, 
		pegawai.status_aktif
			FROM
		pegawai 
			WHERE
		pegawai.id_pegawai = ?`, id)
		if err2 != nil {
			return entities.Pegawai{}, err2
		} else {
			var pegawai entities.Pegawai
			for rows.Next() {
				rows.Scan(&pegawai.IdPegawai, 
					&pegawai.IdUnit, 
					&pegawai.IdFakultas, 
					&pegawai.IdProgramStudi, 
					&pegawai.PinFinger,
					&pegawai.NisPegawai,
					&pegawai.NamaPegawai,
					&pegawai.JabatanPegawai,
					&pegawai.StatusAktif)
			}
			return pegawai, nil
		}
	}
}

func (*PegawaiModel) Create(pegawai *entities.Pegawai) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec(`INSERT INTO 
		pegawai(
			id_unit, 
			id_fakultas, 
			id_program_studi, 
			pin_finger, 
			nis_pegawai, 
			nama_pegawai, 
			jabatan_pegawai, 
			status_aktif
		) VALUES (?,?,?,?,?,?,?,?)`, pegawai.IdUnit, 
			pegawai.IdFakultas, 
			pegawai.IdProgramStudi, 
			pegawai.PinFinger,
			pegawai.NisPegawai,
			pegawai.NamaPegawai,
			pegawai.JabatanPegawai,
			pegawai.StatusAktif)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*PegawaiModel) Update(pegawai entities.Pegawai) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec(`UPDATE pegawai SET 
			id_unit = ?, 
			id_fakultas = ?, 
			id_program_studi = ?, 
			pin_finger = ?, 
			nis_pegawai = ?, 
			nama_pegawai = ?, 
			jabatan_pegawai = ?, 
			status_aktif = ?
		WHERE 
			id_pegawai = ?`, 
			pegawai.IdUnit, 
			pegawai.IdFakultas, 
			pegawai.IdProgramStudi, 
			pegawai.PinFinger, 
			pegawai.NisPegawai,
			pegawai.NamaPegawai,
			pegawai.JabatanPegawai,
			pegawai.StatusAktif,
			pegawai.IdPegawai)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*PegawaiModel) Delete(id int64) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec("DELETE FROM pegawai WHERE id_pegawai = ?", id)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}