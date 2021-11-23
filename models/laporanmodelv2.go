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

type SUpdateDataInline struct {
	Id      int64
	ColName string
	NewVal  string
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

func (*LaporanModelv2) DetailHarianv2(Tahun string, Bulan string, idUnit int64, idPegawai int64, idRole int64) ([]SDetailHarianv2, error) {
	db, err := config.GetDB()

	if err != nil {
		return nil, err
	} else {
		if idRole == 5 {
			rows, err2 := db.Query(`SELECT
				IFNULL(laporan_rekap_detail.id_pegawai,0) AS id_pegawai,
				IFNULL(laporan_rekap_detail.id_unit,0) AS id_unit,
				IFNULL(pegawai.pin_finger,'') AS pin_finger,
				IFNULL(pegawai.nama_pegawai,'') AS nama_pegawai,
				IFNULL(laporan_rekap_detail.tanggal,'') AS tanggal,
				IFNULL(TIME_FORMAT(laporan_rekap_detail.scan_masuk, "%H:%i"),'') AS scan_masuk,
				IFNULL(TIME_FORMAT(laporan_rekap_detail.scan_keluar, "%H:%i"),'') AS scan_keluar,
				IFNULL(TIME_FORMAT(laporan_rekap_detail.terlambat, "%H:%i"),'') AS terlambat,
				IFNULL(TIME_FORMAT(laporan_rekap_detail.bolos, "%H:%i"),'') AS bolos,
				IFNULL(TIME_FORMAT(laporan_rekap_detail.jumlah_jam_kehadiran, "%H:%i"),'') AS jumlah_kehadiran
			FROM
				laporan_rekap_detail
			INNER JOIN pegawai ON laporan_rekap_detail.id_pegawai = pegawai.id_pegawai
			WHERE
				laporan_rekap_detail.tahun = ? AND laporan_rekap_detail.bulan = ?
				AND laporan_rekap_detail.id_pegawai = ?
			ORDER BY 
			pegawai.nis_pegawai DESC,
			laporan_rekap_detail.tanggal ASC`, Tahun, Bulan, idPegawai)
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
						&detail.JumlahKehadiran)
					data = append(data, detail)
				}
				return data, nil
			}
		} else {
			rows, err2 := db.Query(`SELECT
				IFNULL(laporan_rekap_detail.id_pegawai,0) AS id_pegawai,
				IFNULL(laporan_rekap_detail.id_unit,0) AS id_unit,
				IFNULL(pegawai.pin_finger,'') AS pin_finger,
				IFNULL(pegawai.nama_pegawai,'') AS nama_pegawai,
				IFNULL(laporan_rekap_detail.tanggal,'') AS tanggal,
				IFNULL(TIME_FORMAT(laporan_rekap_detail.scan_masuk, "%H:%i"),'') AS scan_masuk,
				IFNULL(TIME_FORMAT(laporan_rekap_detail.scan_keluar, "%H:%i"),'') AS scan_keluar,
				IFNULL(TIME_FORMAT(laporan_rekap_detail.terlambat, "%H:%i"),'') AS terlambat,
				IFNULL(TIME_FORMAT(laporan_rekap_detail.bolos, "%H:%i"),'') AS bolos,
				IFNULL(TIME_FORMAT(laporan_rekap_detail.jumlah_jam_kehadiran, "%H:%i"),'') AS jumlah_kehadiran
			FROM
				laporan_rekap_detail
			INNER JOIN pegawai ON laporan_rekap_detail.id_pegawai = pegawai.id_pegawai
			WHERE
				laporan_rekap_detail.tahun = ? AND laporan_rekap_detail.bulan = ? AND laporan_rekap_detail.id_unit = ?
				AND laporan_rekap_detail.id_pegawai = ?
			ORDER BY 
			pegawai.nis_pegawai DESC,
			laporan_rekap_detail.tanggal ASC`, Tahun, Bulan, idUnit, idPegawai)
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
						&detail.JumlahKehadiran)
					data = append(data, detail)
				}
				return data, nil
			}
		}
	}
}

func (*LaporanModelv2) UpdateDataInline(data SUpdateDataInline) bool {
	db, err := config.GetDB()
	if err != nil {
		return false
	} else {
		queryRaw := "UPDATE laporan_rekap SET " + data.ColName + " = ? WHERE id = ?"
		result, err2 := db.Exec(queryRaw, data.NewVal, data.Id)
		if err2 != nil {
			return false
		} else {
			rowsAffected, _ := result.RowsAffected()
			return rowsAffected > 0
		}

	}
}
