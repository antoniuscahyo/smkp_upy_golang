package entities

type JamKerja struct {
	IdJamKerja   	int64
	NamaJamKerja 	string
	JamMasukSenin   string  
	JamPulangSenin  string 
	JamMasukSelasa  string  
	JamPulangSelasa string  
	JamMasukRabu   	string  
	JamPulangRabu  	string
	JamMasukKamis   string  
	JamPulangKamis  string 
	JamMasukJumat   string  
	JamPulangJumat  string  
	JamMasukSabtu   string  
	JamPulangSabtu  string
	JamMasukMinggu  string  
	JamPulangMinggu string  
}