package models

import (
	"SMKPUPY/config"
	"SMKPUPY/entities"
)

type UnitModel struct {
}

func (*UnitModel) FindAll() ([]entities.Unit, error) {
	db, err := config.GetDB()
	if err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query(`SELECT unit_id, unit_nama, unit_level FROM unit`)
		if err2 != nil {
			return nil, err2
		} else {
			var units []entities.Unit
			for rows.Next() {
				var unit entities.Unit
				rows.Scan(&unit.IdUnit, &unit.UnitNama, &unit.UnitLevel)
				units = append(units, unit)
			}
			return units, nil
		}
	}
}

func (*UnitModel) Find(id int64) (entities.Unit, error) {
	db, err := config.GetDB()
	if err != nil {
		return entities.Unit{}, err
	} else {
		rows, err2 := db.Query("SELECT unit_id, unit_nama, unit_level, unit_kepala_id_pegawai FROM unit WHERE unit_id = ?", id)
		if err2 != nil {
			return entities.Unit{}, err2
		} else {
			var unit entities.Unit
			for rows.Next() {
				rows.Scan(&unit.IdUnit, &unit.UnitNama, &unit.UnitLevel, &unit.IdPegawai)
			}
			return unit, nil
		}
	}
}

func (*UnitModel) Create(unit *entities.Unit) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {
		result, err2 := db.Exec("INSERT INTO unit(unit_nama, unit_level) VALUES (?,?)", unit.UnitNama, unit.UnitLevel)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*UnitModel) Update(unit entities.Unit) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {
		result, err2 := db.Exec("UPDATE unit SET unit_nama = ?, unit_level = ?, unit_kepala_id_pegawai = ? WHERE unit_id = ?", unit.UnitNama, unit.UnitLevel, unit.IdPegawai, unit.IdUnit)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*UnitModel) Delete(id int64) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {
		result, err2 := db.Exec("DELETE FROM unit WHERE unit_id = ?", id)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}
