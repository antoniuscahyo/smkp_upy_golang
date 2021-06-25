package models

import (
	"SMKPUPY/config"
	"SMKPUPY/entities"
)

type FakultasModel struct {

}

func (*FakultasModel) FindAll() ([]entities.Fakultas, error) {
	db, err := config.GetDB()
	if	err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query("SELECT id_fakultas,nama_fakultas FROM fakultas")
		if err2 != nil {
			return nil,err2
		} else {
			var fakultass []entities.Fakultas
			for rows.Next() {
				var fakultas entities.Fakultas
				rows.Scan(&fakultas.IdFakultas, &fakultas.NamaFakultas)
				fakultass = append(fakultass, fakultas)
			}
			return fakultass, nil
		}
	}
}