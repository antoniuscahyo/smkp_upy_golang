package models

import (
	"SMKPUPY/config"
	"fmt"
	// "SMKPUPY/entities"
)

type LaporanModel struct {

}

type SDetailHarian struct {
	IdPegawai  		int64
	IdUnit 	    	int64
	PinFinger   	string
	NamaPegawai 	string
	Tanggal 		string
	ScanMasuk 		string
	ScanKeluar 		string
	Terlambat 		string
	Bolos 			string
	JumlahKehadiran string
	TandaTangan 	string
	Keterangan 		string
}

func (*LaporanModel) DetailHarian(TanggalAwal string, TanggalAkhir string, idUnit int64, idPegawai int64) ([]SDetailHarian, error) {
	db, err := config.GetDB()
	
	fmt.Println(TanggalAwal)
	fmt.Println(TanggalAkhir)
	
	if	err != nil {
		return nil, err
	} else {
		rows, err2 := db.Query(`SELECT
			IFNULL(pegawai.id_pegawai,0) AS id_pegawai,
			IFNULL(pegawai.id_unit,0) AS id_unit,
			IFNULL(pegawai.pin_finger,'') AS pin_finger,
			IFNULL(pegawai.nama_pegawai,'') AS nama_pegawai,
			IFNULL(log_mesin_finger.tanggal,'') AS tanggal,
			IFNULL(func_getscanmasuk(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger),'') AS scan_masuk,
			IFNULL(func_getscankeluar(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger),'') AS scan_keluar,
			IFNULL(func_getscanterlambat(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger),'') AS terlambat,
			IFNULL(func_getscanbolos(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger),'') AS bolos,
			IFNULL(func_getscanjumlahkehadiran(log_mesin_finger.tanggal,pegawai.id_unit,pegawai.pin_finger),'') AS jumlah_kehadiran,
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
		log_mesin_finger.tanggal ASC`,TanggalAwal,TanggalAkhir,idUnit,idPegawai)
		if err2 != nil {
			fmt.Println(err2)
			return nil,err2
		} else {
			var data []SDetailHarian
			for rows.Next() {
				var detail SDetailHarian
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