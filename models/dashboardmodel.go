package models

import (
	"SMKPUPY/config"
	"log"
)

type DashboardModel struct {
}

func (*DashboardModel) GetJumlahPegawai() int {
	var count int
	db, err := config.GetDB()
	if err != nil {
		log.Fatal(err)
	} else {
		err := db.QueryRow("SELECT COUNT(*) FROM pegawai WHERE status_aktif=1").Scan(&count)
		if err != nil {
			log.Fatal(err)
		}
	}
	return count
}

func (*DashboardModel) GetJumlahPegawaiMasuk() int {
	var count int
	db, err := config.GetDB()
	if err != nil {
		log.Fatal(err)
	} else {
		err := db.QueryRow(`SELECT
		COUNT(*)
		FROM (
		SELECT
		pegawai.id_pegawai,
		pegawai.nama_pegawai,
		log_mesin_finger.tanggal,
		MIN(log_mesin_finger.jam)
		FROM
		pegawai
		LEFT JOIN log_mesin_finger ON pegawai.pin_finger = log_mesin_finger.pin_finger
		WHERE 
		status_aktif=1 AND
		log_mesin_finger.tanggal = DATE_FORMAT(NOW(), '%Y-%m-%d')
		GROUP BY pegawai.id_pegawai
		) x`).Scan(&count)
		if err != nil {
			log.Fatal(err)
		}
	}
	return count
}

func (*DashboardModel) GetJumlahPegawaiTidakMasuk() int {
	var count int
	db, err := config.GetDB()
	if err != nil {
		log.Fatal(err)
	} else {
		err := db.QueryRow(`SELECT
		COUNT(*)
		FROM (
		SELECT
		pegawai.id_pegawai,
		pegawai.nama_pegawai,
		log_mesin_finger.tanggal,
		log_mesin_finger.jam
		FROM
		pegawai
		LEFT JOIN log_mesin_finger ON pegawai.pin_finger = log_mesin_finger.pin_finger
		WHERE 
		status_aktif=1 AND
		log_mesin_finger.jam IS NULL AND
		log_mesin_finger.tanggal = DATE_FORMAT(NOW(), '%Y-%m-%d')
		GROUP BY pegawai.id_pegawai
		) x`).Scan(&count)
		if err != nil {
			log.Fatal(err)
		}
	}
	return count
}

func (*DashboardModel) GetJumlahPegawaiTidakMemenuhiJamKehadiran() int {
	var count int
	db, err := config.GetDB()
	if err != nil {
		log.Fatal(err)
	} else {
		err := db.QueryRow(`SELECT
		COUNT(*)
		FROM (
		SELECT
		pegawai.id_pegawai,
		pegawai.nama_pegawai,
		log_mesin_finger.tanggal,
		MIN(log_mesin_finger.jam) AS jam_masuk,
		MAX(log_mesin_finger.jam) AS jam_pulang,
		func_getscanjumlahkehadiran(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger)
		FROM
		pegawai
		LEFT JOIN log_mesin_finger ON pegawai.pin_finger = log_mesin_finger.pin_finger
		WHERE 
		status_aktif=1 AND
		log_mesin_finger.tanggal = DATE_FORMAT(NOW(), '%Y-%m-%d')
		AND func_getscanjumlahkehadiran(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger) < '08:00:00'
		GROUP BY pegawai.id_pegawai
		) x`).Scan(&count)
		if err != nil {
			log.Fatal(err)
		}
	}
	return count
}
