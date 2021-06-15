package models

import (
	"SMKPUPY/config"
	"SMKPUPY/entities"
)

type RoleModel struct {

}

func (*RoleModel) FindAll() ([]entities.Role, error) {
	db, err := config.GetDB()
	if	err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query("SELECT id_role,nama_role FROM role")
		if err2 != nil {
			return nil,err2
		} else {
			var roles []entities.Role
			for rows.Next() {
				var role entities.Role
				rows.Scan(&role.IdRole, &role.NamaRole)
				roles = append(roles, role)
			}
			return roles, nil
		}
	}
}

func (*RoleModel) Find(id int64) (entities.Role, error) {
	db, err := config.GetDB()
	if	err != nil {
		return entities.Role{}, err
	} else {
		rows, err2 := db.Query("SELECT * FROM role WHERE id_role = ?", id)
		if err2 != nil {
			return entities.Role{}, err2
		} else {
			var role entities.Role
			for rows.Next() {
				rows.Scan(&role.IdRole, &role.NamaRole)
			}
			return role, nil
		}
	}
}

func (*RoleModel) Create(role *entities.Role) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec("INSERT INTO role(nama_role) VALUES (?)", role.NamaRole)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*RoleModel) Update(role entities.Role) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec("UPDATE role SET nama_role = ? WHERE id_role = ?", role.NamaRole, role.IdRole)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*RoleModel) Delete(id int64) bool {
	db, err := config.GetDB()
	if	err != nil {
		return false
	} else {
		result, err2 := db.Exec("DELETE FROM role WHERE id_role = ?", id)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}