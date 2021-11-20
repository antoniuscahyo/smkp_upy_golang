package models

import (
	"SMKPUPY/config"
	"SMKPUPY/entities"
	"fmt"
)

type LogImportPresensiModel struct {
}

func (*LogImportPresensiModel) FindAll() ([]entities.LogImportPresensi, error) {
	db, err := config.GetDB()
	if err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query("SELECT id,tanggal_import,ifnull(tanggal_log_awal,'-'),ifnull(tanggal_log_akhir,'-'),ifnull(lokasi_mesin,'-'),jumlah_data,nama_file FROM log_import_presensi")
		if err2 != nil {
			return nil, err2
		} else {
			var logimportpresensis []entities.LogImportPresensi
			for rows.Next() {
				var log entities.LogImportPresensi
				rows.Scan(&log.Id, &log.TanggalImport, &log.TanggalLogAwal, &log.TanggalLogAkhir, &log.LokasiMesin, &log.JumlahData, &log.NamaFile)
				logimportpresensis = append(logimportpresensis, log)
			}
			return logimportpresensis, nil
		}
	}
}

func (*LogImportPresensiModel) Create(log *entities.LogImportPresensi) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {
		result, err2 := db.Exec(`INSERT INTO log_import_presensi(
			tanggal_import,
			tanggal_log_awal,
			tanggal_log_akhir,
			tahun,
			bulan,
			lokasi_mesin,
			jumlah_data,
			nama_file
		) VALUES (?,?,?,?,?,?,?,?)`, log.TanggalImport, log.TanggalLogAwal, log.TanggalLogAkhir, log.Tahun, log.Bulan, log.LokasiMesin, log.JumlahData, log.NamaFile)
		if err2 != nil {
			fmt.Println(err2)
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*LogImportPresensiModel) DeleteLaporanRekap(lap *entities.LogImportPresensi) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {
		result, err2 := db.Exec(`DELETE FROM laporan_rekap WHERE tahun = ? AND bulan = ?`, lap.Tahun, lap.Bulan)
		if err2 != nil {
			fmt.Println(err2)
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*LogImportPresensiModel) CreateLaporanRekap(lap *entities.LogImportPresensi) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {
		result, err2 := db.Exec(`
			INSERT INTO laporan_rekap (
				id_pegawai,
				id_unit,
				id_fakultas,
				id_program_studi,
				tahun,
				bulan,
				jumlah_kehadiran
			)
			SELECT
			pegawai.id_pegawai,
			pegawai.id_unit,
			pegawai.id_fakultas,
			pegawai.id_program_studi,
			? AS tahun,
			? AS bulan,
			func_getjumlahkehadiran(?,?,pegawai.id_pegawai) AS jumlah_kehadiran
		FROM
			pegawai
			LEFT JOIN unit ON pegawai.id_unit = unit.unit_id
			LEFT JOIN fakultas ON pegawai.id_fakultas = fakultas.id_fakultas
			LEFT JOIN program_studi ON pegawai.id_program_studi = program_studi.id_program_studi
		ORDER BY 
		pegawai.nis_pegawai DESC`, lap.Tahun, lap.Bulan, lap.TanggalLogAwal, lap.TanggalLogAkhir)
		if err2 != nil {
			fmt.Println(err2)
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}


func (*LogImportPresensiModel) DeleteLaporanRekapDetail(lap *entities.LogImportPresensi) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {
		result, err2 := db.Exec(`DELETE FROM laporan_rekap_detail WHERE tahun = ? AND bulan = ?`, lap.Tahun, lap.Bulan)
		if err2 != nil {
			fmt.Println(err2)
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}

func (*LogImportPresensiModel) CreateLaporanRekapDetail(lap *entities.LogImportPresensi) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {
		result, err2 := db.Exec(`
			INSERT INTO laporan_rekap (
				id_pegawai,
				id_unit,
				id_fakultas,
				id_program_studi,
				tahun,
				bulan,
				jumlah_kehadiran
			)
			SELECT
			pegawai.id_pegawai,
			pegawai.id_unit,
			pegawai.id_fakultas,
			pegawai.id_program_studi,
			? AS tahun,
			? AS bulan,
			func_getjumlahkehadiran(?,?,pegawai.id_pegawai) AS jumlah_kehadiran
		FROM
			pegawai
			LEFT JOIN unit ON pegawai.id_unit = unit.unit_id
			LEFT JOIN fakultas ON pegawai.id_fakultas = fakultas.id_fakultas
			LEFT JOIN program_studi ON pegawai.id_program_studi = program_studi.id_program_studi
		ORDER BY 
		pegawai.nis_pegawai DESC`, lap.Tahun, lap.Bulan, lap.TanggalLogAwal, lap.TanggalLogAkhir)
		if err2 != nil {
			fmt.Println(err2)
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}
