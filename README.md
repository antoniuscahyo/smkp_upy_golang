Sistem Monitoring Kehadiran Pegawai <br>
Universitas PGRI Yogyakarta
===
Prolog
---
Aplikasi ini dibuat untuk mempermudah pengelolaan data dan online akses pada kampus Universitas PGRI Yogyakarta dan sekaligus digunakan oleh mahasiswa Teknik Informatika pemilik akun github ini :)

Sistem ini Berbasis Web menggunakan Bahasa Pemrograman GO dan di deploy pada docker microservice. Judul penelitian ini adalah `APLIKASI MONITORING KEHADIRAN PEGAWAI MENGGUNAKAN GO DAN DOCKER DI UNIVERSITAS PGRI YOGYAKARTA`

Kebutuhan
---
- Install GoLang pada komputer anda
- Mysql (Versi 5.6 keatas)


Fitur
---
- Gentelella Admin Panel
- Import data `.dat` file
- Admin Menu Mirip RBAC sih..
- Docker Compose

Penggunaan
---
Command line:

    $ cd smkp_upy_golang
    $ go run main.go
    
    > buka pada browser, http://localhost:3000

Docker:

    Menjalankan Build Image
    $ docker build -t image-smkp-upy:1.0 .

    Menjalankan Docker Compose Membuat Container
    $ docker-compose up

    Menjalankan Docker Compose Menghapus Container dengan Volumenya
    $ docker-compose down --remove-orphans --volumes
List Web Module Belum Selesai
---
- 
Entitas Login
---
- Admin
user: admin
pass: admin
- Admin Biro Kepegawaian
user: biro_kepegawaian
pass: admin
- Admin Biro Keuangan
user: biro_keuangan
pass: admin
- Kepala Unit
user: kepegawaian
pass: admin
- Pegawai
user: rony
pass: rony


Thanks To
---
- Universitas PGRI Yogyakarta
