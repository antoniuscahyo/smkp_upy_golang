package models

import (
	"SMKPUPY/config"
	"fmt"
	// "SMKPUPY/entities"
)

type LaporanModelv2 struct {
}

type SRekapLaporanv2 struct {
	IdPK                      int
	No                        int
	NamaPegawai               string
	JumlahKehadiran           string
	ValidasiKehadiran         string
	PotonganInsentifKehadiran string
	ValidasiInsentifKehadiran string
	UMKKehadiran              string
	ValidasiUMKKehadiran      string
	Tahun                     string
	Bulan                     string
}

type SDetailHarianv2 struct {
	No              int
	IdPegawai       int64
	IdUnit          int64
	PinFinger       string
	NamaPegawai     string
	Tanggal         string
	ScanMasuk       string
	ScanKeluar      string
	Terlambat       string
	Bolos           string
	JumlahKehadiran string
	TandaTangan     string
	Keterangan      string
}

func (*LaporanModelv2) RekapLaporanv2(Tahun string, Bulan string, idUnit int64) ([]SRekapLaporanv2, error) {
	db, err := config.GetDB()

	if err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query(`SELECT
			laporan_rekap.id,
			pegawai.nama_pegawai AS nama,
			jumlah_kehadiran AS jumlah_kehadiran,
			IFNULL(jumlah_validasi,'-') AS jumlah_validasi,
			IFNULL(jumlah_pot_insentif_kehadiran,'-') AS jumlah_pot_insentif_kehadiran,
			IFNULL(validasi_pot_insentif_kehadiran,'-') AS validasi_pot_insentif_kehadiran,
			IFNULL(umk_kehadiran,'-') AS umk_kehadiran,
			IFNULL(umk_validasi,'-') AS umk_validasi
		FROM
		laporan_rekap
			LEFT JOIN pegawai ON pegawai.id_pegawai=laporan_rekap.id_pegawai
			LEFT JOIN unit ON pegawai.id_unit = unit.unit_id
			LEFT JOIN fakultas ON pegawai.id_fakultas = fakultas.id_fakultas
			LEFT JOIN program_studi ON pegawai.id_program_studi = program_studi.id_program_studi
		WHERE
			laporan_rekap.tahun = ? AND
			laporan_rekap.bulan = ? AND
			laporan_rekap.id_unit = ?
		ORDER BY 
		pegawai.nis_pegawai DESC`, Tahun, Bulan, idUnit)
		if err2 != nil {
			fmt.Println(err2)
			return nil, err2
		} else {
			var data []SRekapLaporanv2
			i := 1
			for rows.Next() {
				var detail SRekapLaporanv2
				detail.No = i
				i++
				rows.Scan(&detail.IdPK,
					&detail.NamaPegawai,
					&detail.JumlahKehadiran,
					&detail.ValidasiKehadiran,
					&detail.PotonganInsentifKehadiran,
					&detail.ValidasiInsentifKehadiran,
					&detail.UMKKehadiran,
					&detail.ValidasiUMKKehadiran)
				data = append(data, detail)
			}
			return data, nil
		}
	}
}

func (*LaporanModelv2) DetailHarianv2(TanggalAwal string, TanggalAkhir string, idUnit int64, idPegawai int64, idRole int64) ([]SDetailHarianv2, error) {
	db, err := config.GetDB()

	// fmt.Println(TanggalAwal)
	// fmt.Println(TanggalAkhir)

	if err != nil {
		return nil, err
	} else {
		if idRole == 5 {
			rows, err2 := db.Query(`SELECT
				IFNULL(pegawai.id_pegawai,0) AS id_pegawai,
				IFNULL(pegawai.id_unit,0) AS id_unit,
				IFNULL(pegawai.pin_finger,'') AS pin_finger,
				IFNULL(pegawai.nama_pegawai,'') AS nama_pegawai,
				IFNULL(log_mesin_finger.tanggal,'') AS tanggal,
				IFNULL(TIME_FORMAT(func_getscanmasuk(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS scan_masuk,
				IFNULL(TIME_FORMAT(func_getscankeluar(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS scan_keluar,
				IFNULL(TIME_FORMAT(func_getscanterlambat(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS terlambat,
				IFNULL(TIME_FORMAT(func_getscanbolos(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS bolos,
				IFNULL(TIME_FORMAT(func_getscanjumlahkehadiran(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS jumlah_kehadiran,
				IFNULL(NULL,'') AS tanda_tangan,
				IFNULL(NULL,'') AS keterangan
			FROM
				log_mesin_finger
				INNER JOIN pegawai ON log_mesin_finger.pin_finger = pegawai.pin_finger
				LEFT JOIN unit ON pegawai.id_unit = unit.unit_id
				LEFT JOIN fakultas ON pegawai.id_fakultas = fakultas.id_fakultas
				LEFT JOIN program_studi ON pegawai.id_program_studi = program_studi.id_program_studi
			WHERE
				log_mesin_finger.tanggal >= ? AND log_mesin_finger.tanggal <= ?
				AND pegawai.id_pegawai = ?
			GROUP BY
				pegawai.id_pegawai,log_mesin_finger.tanggal
			ORDER BY 
			pegawai.nis_pegawai DESC,
			log_mesin_finger.tanggal ASC`, TanggalAwal, TanggalAkhir, idPegawai)
			if err2 != nil {
				fmt.Println(err2)
				return nil, err2
			} else {
				var data []SDetailHarianv2
				i := 1
				for rows.Next() {
					var detail SDetailHarianv2
					detail.No = i
					i++
					rows.Scan(&detail.IdPegawai,
						&detail.IdUnit,
						&detail.PinFinger,
						&detail.NamaPegawai,
						&detail.Tanggal,
						&detail.ScanMasuk,
						&detail.ScanKeluar,
						&detail.Terlambat,
						&detail.Bolos,
						&detail.JumlahKehadiran,
						&detail.TandaTangan,
						&detail.Keterangan)
					data = append(data, detail)
				}
				return data, nil
			}
		} else {
			rows, err2 := db.Query(`SELECT
				IFNULL(pegawai.id_pegawai,0) AS id_pegawai,
				IFNULL(pegawai.id_unit,0) AS id_unit,
				IFNULL(pegawai.pin_finger,'') AS pin_finger,
				IFNULL(pegawai.nama_pegawai,'') AS nama_pegawai,
				IFNULL(log_mesin_finger.tanggal,'') AS tanggal,
				IFNULL(TIME_FORMAT(func_getscanmasuk(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS scan_masuk,
				IFNULL(TIME_FORMAT(func_getscankeluar(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS scan_keluar,
				IFNULL(TIME_FORMAT(func_getscanterlambat(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS terlambat,
				IFNULL(TIME_FORMAT(func_getscanbolos(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS bolos,
				IFNULL(TIME_FORMAT(func_getscanjumlahkehadiran(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger), "%H:%i"),'') AS jumlah_kehadiran,
				IFNULL(NULL,'') AS tanda_tangan,
				IFNULL(NULL,'') AS keterangan
			FROM
				log_mesin_finger
				INNER JOIN pegawai ON log_mesin_finger.pin_finger = pegawai.pin_finger
				LEFT JOIN unit ON pegawai.id_unit = unit.unit_id
				LEFT JOIN fakultas ON pegawai.id_fakultas = fakultas.id_fakultas
				LEFT JOIN program_studi ON pegawai.id_program_studi = program_studi.id_program_studi
			WHERE
				log_mesin_finger.tanggal >= ? AND log_mesin_finger.tanggal <= ?
				AND pegawai.id_unit = ?
				AND pegawai.id_pegawai = ?
			GROUP BY
				pegawai.id_pegawai,log_mesin_finger.tanggal
			ORDER BY 
			pegawai.nis_pegawai DESC,
			log_mesin_finger.tanggal ASC`, TanggalAwal, TanggalAkhir, idUnit, idPegawai)
			if err2 != nil {
				fmt.Println(err2)
				return nil, err2
			} else {
				var data []SDetailHarianv2
				i := 1
				for rows.Next() {
					var detail SDetailHarianv2
					detail.No = i
					i++
					rows.Scan(&detail.IdPegawai,
						&detail.IdUnit,
						&detail.PinFinger,
						&detail.NamaPegawai,
						&detail.Tanggal,
						&detail.ScanMasuk,
						&detail.ScanKeluar,
						&detail.Terlambat,
						&detail.Bolos,
						&detail.JumlahKehadiran,
						&detail.TandaTangan,
						&detail.Keterangan)
					data = append(data, detail)
				}
				return data, nil
			}
		}
	}
}
