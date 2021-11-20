package entities

type LaporanRekap struct {
	Id              int64
	IdPegawai       int64
	IdUnit          int64
	IdFakultas      int64
	IdProgramStudi  int64
	Tahun           int64
	Bulan           int64
	JumlahKehadiran int64
	TanggalAwal     string
	TanggalAkhir    string
}
