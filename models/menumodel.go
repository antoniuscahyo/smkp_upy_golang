package models

import (
	"SMKPUPY/config"
	"SMKPUPY/entities"
)

type MenuModel struct {

}

func (*MenuModel) FindAll() ([]entities.Menu, error) {
	db, err := config.GetDB()
	if	err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query("SELECT id_menu,nama_menu,link_menu,icon_menu,kode_level_menu FROM menu")
		if err2 != nil {
			return nil,err2
		} else {
			var menus []entities.Menu
			for rows.Next() {
				var menu entities.Menu
				rows.Scan(&menu.IdMenu, &menu.NamaMenu, &menu.LinkMenu, &menu.IconMenu, &menu.KodeLevelMenu)
				menus = append(menus, menu)
			}
			return menus, nil
		}
	}
}

func (*MenuModel) Find(id int64) (entities.Menu, error) {
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

func (*MenuModel) Create(menu *entities.Menu) bool {
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

func (*MenuModel) Update(menu entities.Menu) bool {
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

func (*MenuModel) Delete(id int64) bool {
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
}

func (*MenuModel) GetMenuByRole(id int64) (entities.Menu, error) {
	db, err := config.GetDB()
	if	err != nil {
		return entities.Menu{}, err
	} else {
		rows, err2 := db.Query(`
		SELECT
			menu.nama_menu, 
			menu.link_menu, 
			menu.icon_menu
		FROM role_menu 
			JOIN role ON role_menu.id_role = role.id_role
			JOIN menu ON role_menu.id_menu = menu.id_menu
		WHERE 
			role_menu.id_role = ? AND
			role_menu.status_aktif = 1 AND
			LENGTH(menu.kode_level_menu)=2
		ORDER BY
		menu.kode_level_menu ASC`, id)
		if err2 != nil {
			return entities.Menu{}, err2
		} else {
			var menu entities.Menu
			for rows.Next() {
				rows.Scan(&menu.NamaMenu, &menu.LinkMenu, &menu.IconMenu)
			}
			return menu, nil
		}
	}
}