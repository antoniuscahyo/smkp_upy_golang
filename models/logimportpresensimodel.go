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
			INSERT INTO laporan_rekap_detail (
				id_pegawai,
				id_unit,
				id_fakultas,
				id_program_studi,
				tahun,
				bulan,
				tanggal,
				scan_masuk,
				scan_keluar,
				terlambat,
				bolos,
				jumlah_jam_kehadiran
			)
			SELECT
				IFNULL(pegawai.id_pegawai,0) AS id_pegawai,
				IFNULL(pegawai.id_unit,0) AS id_unit,
				IFNULL(pegawai.id_fakultas,0) AS id_fakultas,
				IFNULL(pegawai.id_program_studi,0) AS id_program_studi,
				? AS tahun,
				? AS bulan,
				IFNULL(log_mesin_finger.tanggal,'') AS tanggal,
				IFNULL(TIME_FORMAT(func_getscanmasuk(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS scan_masuk,
				IFNULL(TIME_FORMAT(func_getscankeluar(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS scan_keluar,
				IFNULL(TIME_FORMAT(func_getscanterlambat(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS terlambat,
				IFNULL(TIME_FORMAT(func_getscanbolos(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS bolos,
				IFNULL(TIME_FORMAT(func_getscanjumlahkehadiran(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS jumlah_kehadiran
			FROM
				log_mesin_finger
				INNER JOIN pegawai ON log_mesin_finger.pin_finger = pegawai.pin_finger
				LEFT JOIN unit ON pegawai.id_unit = unit.unit_id
				LEFT JOIN fakultas ON pegawai.id_fakultas = fakultas.id_fakultas
				LEFT JOIN program_studi ON pegawai.id_program_studi = program_studi.id_program_studi
			WHERE
				log_mesin_finger.tanggal >= ? AND log_mesin_finger.tanggal <= ?
			GROUP BY
				pegawai.id_pegawai,log_mesin_finger.tanggal
			ORDER BY 
			pegawai.nis_pegawai DESC,
			log_mesin_finger.tanggal ASC`, lap.Tahun, lap.Bulan, lap.TanggalLogAwal, lap.TanggalLogAkhir)
		if err2 != nil {
			fmt.Println(err2)
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}
	}
}
