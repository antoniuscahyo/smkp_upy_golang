package models

import (
	"SMKPUPY/config"
	"SMKPUPY/entities"
)

type ProgramstudiModel struct {

}

func (*ProgramstudiModel) FindAll() ([]entities.ProgramStudi, error) {
	db, err := config.GetDB()
	if	err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query("SELECT id_program_studi,id_fakultas,nama_program_studi FROM program_studi")
		if err2 != nil {
			return nil,err2
		} else {
			var programstudis []entities.ProgramStudi
			for rows.Next() {
				var programstudi entities.ProgramStudi
				rows.Scan(&programstudi.IdProgramStudi, &programstudi.IdFakultas, &programstudi.NamaProgramStudi)
				programstudis = append(programstudis, programstudi)
			}
			return programstudis, nil
		}
	}
}