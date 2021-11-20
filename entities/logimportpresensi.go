package entities

type LogImportPresensi struct {
	Id              int64
	TanggalImport   string
	TanggalLogAwal  string
	TanggalLogAkhir string
	Tahun           string
	Bulan           string
	LokasiMesin     string
	JumlahData      int
	NamaFile        string
}
