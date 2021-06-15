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
			id_pegawai,
			id_unit,
			id_fakultas,
			id_program_studi,	
			pin_finger,
			nis_pegawai,
			nama_pegawai,
			jabatan_pegawai,
			status_aktif
		FROM 
			pegawai
		`)
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
					&pegawai.StatusAktif)
				pegawais = append(pegawais, pegawai)
			}
			return pegawais, nil
		}
	}
}



/*
BARU PROSES EDIT
func (*PegawaiModel) Find(id int64) (entities.Menu, error) {
	db, err := config.GetDB()
	if	err != nil {
		return entities.Menu{}, err
	} else {
		rows, err2 := db.Query("SELECT id_menu,nama_menu,link_menu,icon_menu,kode_level_menu FROM menu WHERE id_menu = ?", id)
		if err2 != nil {
			return entities.Menu{}, err2
		} else {
			var menu entities.Menu
			for rows.Next() {
				rows.Scan(&menu.IdMenu, &menu.NamaMenu, &menu.LinkMenu, &menu.IconMenu, &menu.KodeLevelMenu)
			}
			return menu, nil
		}
	}
}

func (*PegawaiModel) Create(menu *entities.Menu) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec("INSERT INTO menu(nama_menu,link_menu,icon_menu,kode_level_menu) VALUES (?,?,?,?)", menu.NamaMenu, menu.LinkMenu, menu.IconMenu, menu.KodeLevelMenu)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*PegawaiModel) Update(menu entities.Menu) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec("UPDATE menu SET nama_menu = ?, link_menu = ?, icon_menu = ?, kode_level_menu = ? WHERE id_menu = ?", menu.NamaMenu, menu.LinkMenu, menu.IconMenu, menu.IdMenu, menu.KodeLevelMenu)
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
		result, err2 := db.Exec("DELETE FROM menu WHERE id_menu = ?", id)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}*/