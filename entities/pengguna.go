package entities

type Pengguna struct {
	IdPengguna  int64
	Username 	string
	Password 	string
	Nama 		string
	IdRole   	int64
	IdPegawai 	int64
	NamaRole 	string
}