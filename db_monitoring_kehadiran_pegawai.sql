/*
 Navicat Premium Data Transfer

 Source Server         : LOCALHOST-MAMP-PRO
 Source Server Type    : MySQL
 Source Server Version : 100508
 Source Host           : localhost:3306
 Source Schema         : db_monitoring_kehadiran_pegawai

 Target Server Type    : MySQL
 Target Server Version : 100508
 File Encoding         : 65001

 Date: 11/06/2021 08:40:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for datapresensi
-- ----------------------------
DROP TABLE IF EXISTS `datapresensi`;
CREATE TABLE `datapresensi` (
  `id_presensi` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) DEFAULT NULL,
  `pin_finger` varchar(50) DEFAULT NULL,
  `tanggal_presensi` date DEFAULT NULL,
  `jam_presensi` time DEFAULT NULL,
  PRIMARY KEY (`id_presensi`) USING BTREE,
  KEY `id_pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Records of datapresensi
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for fakultas
-- ----------------------------
DROP TABLE IF EXISTS `fakultas`;
CREATE TABLE `fakultas` (
  `id_fakultas` int(11) NOT NULL,
  `nama_fakultas` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_fakultas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Records of fakultas
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jadwal_kerja
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_kerja`;
CREATE TABLE `jadwal_kerja` (
  `id_jadwal_kerja` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jadwal_kerja` varchar(255) DEFAULT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `id_jam_kerja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_jadwal_kerja`) USING BTREE,
  KEY `id_pegawai` (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Records of jadwal_kerja
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jam_kerja
-- ----------------------------
DROP TABLE IF EXISTS `jam_kerja`;
CREATE TABLE `jam_kerja` (
  `id_jam_kerja` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jam_kerja` varchar(255) DEFAULT NULL,
  `jam_masuk_senin` time DEFAULT NULL,
  `jam_pulang_senin` time DEFAULT NULL,
  `jam_masuk_selasa` time DEFAULT NULL,
  `jam_pulang_selasa` time DEFAULT NULL,
  `jam_masuk_rabu` time DEFAULT NULL,
  `jam_pulang_rabu` time DEFAULT NULL,
  `jam_masuk_kamis` time DEFAULT NULL,
  `jam_pulang_kamis` time DEFAULT NULL,
  `jam_masuk_jumat` time DEFAULT NULL,
  `jam_pulang_jumat` time DEFAULT NULL,
  `jam_masuk_sabtu` time DEFAULT NULL,
  `jam_pulang_sabtu` time DEFAULT NULL,
  `jam_masuk_minggu` time DEFAULT NULL,
  `jam_pulang_minggu` time DEFAULT NULL,
  PRIMARY KEY (`id_jam_kerja`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Records of jam_kerja
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for log_mesin_finger
-- ----------------------------
DROP TABLE IF EXISTS `log_mesin_finger`;
CREATE TABLE `log_mesin_finger` (
  `pin_finger` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tabel bantu ambil data dari upload file attlog';

-- ----------------------------
-- Records of log_mesin_finger
-- ----------------------------
BEGIN;
INSERT INTO `log_mesin_finger` VALUES ('190115', '2020-09-02', '09:32:35');
INSERT INTO `log_mesin_finger` VALUES ('280720', '2020-09-02', '09:35:46');
INSERT INTO `log_mesin_finger` VALUES ('181105', '2020-09-02', '09:37:29');
INSERT INTO `log_mesin_finger` VALUES ('14018', '2020-09-02', '09:48:13');
INSERT INTO `log_mesin_finger` VALUES ('190105', '2020-09-02', '09:58:38');
INSERT INTO `log_mesin_finger` VALUES ('170107', '2020-09-02', '09:59:11');
INSERT INTO `log_mesin_finger` VALUES ('190115', '2020-09-02', '09:32:35');
INSERT INTO `log_mesin_finger` VALUES ('280720', '2020-09-02', '09:35:46');
INSERT INTO `log_mesin_finger` VALUES ('181105', '2020-09-02', '09:37:29');
INSERT INTO `log_mesin_finger` VALUES ('14018', '2020-09-02', '09:48:13');
INSERT INTO `log_mesin_finger` VALUES ('190105', '2020-09-02', '09:58:38');
INSERT INTO `log_mesin_finger` VALUES ('170107', '2020-09-02', '09:59:11');
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_menu` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `link_menu` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `icon_menu` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `kode_level_menu` char(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='desain dari naskah';

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES (1, 'Menu Utama', NULL, NULL, '01');
INSERT INTO `menu` VALUES (2, 'Dashboard', '/dashboard', 'fa fa-home', '01.01');
INSERT INTO `menu` VALUES (3, 'Rekap Laporan Bulanan Per Unit', '/rekap_laporan_bulanan_perunit', 'fa fa-file-text-o', '01.02');
INSERT INTO `menu` VALUES (4, 'Rekap Laporan Bulanan Per Pegawai', '/rekap_laporan_bulanan_perpegawai', 'fa fa-file-o', '01.03');
INSERT INTO `menu` VALUES (5, 'Menu Admin', NULL, NULL, '02');
INSERT INTO `menu` VALUES (6, 'Referensi Unit', '/referensi_unit', 'fa fa-university', '02.01');
INSERT INTO `menu` VALUES (7, 'Data Pegawai', '/data_pegawai', 'fa fa-users', '02.02');
INSERT INTO `menu` VALUES (8, 'Setting Pengguna', '/setting_pengguna', 'fa fa-user', '02.03');
INSERT INTO `menu` VALUES (9, 'Setting Menu', '/setting_menu', 'fa fa-list-alt', '02.04');
INSERT INTO `menu` VALUES (10, 'Setting Role', '/setting_role', 'fa fa-key', '02.05');
COMMIT;

-- ----------------------------
-- Table structure for olah_data_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `olah_data_pegawai`;
CREATE TABLE `olah_data_pegawai` (
  `nama_pegawai` varchar(255) DEFAULT NULL,
  `pendidikan` varchar(255) DEFAULT NULL,
  `nama_unit` varchar(255) DEFAULT NULL,
  `nis` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `is_fakultas` int(1) DEFAULT NULL,
  `is_unit` int(1) DEFAULT NULL,
  `is_aktif` int(1) DEFAULT NULL,
  `is_pegawai` int(255) DEFAULT NULL COMMENT '1=KARYAWAN,2=DOSEN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tabel bantu olah data pegawai';

-- ----------------------------
-- Records of olah_data_pegawai
-- ----------------------------
BEGIN;
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Okti  Purwaningsih, MP.', 'S3', 'Agroteknologi', '19711009 199812 2 005', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ir. Herman Budi Susetyo, MP.', 'S2', 'Agroteknologi', '19540526 198503 1 002', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Drs. M. Kusberyunadi, M.MA', 'S2', 'Agroteknologi', '19650321 199604 1 003', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ir. Ahmad Bahrum, M.P.', 'S2', 'Agroteknologi', '19630917 199503 1 002', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ir. Ardiyanto, M.Sc.', 'S2', 'Agroteknologi', '19640314 199503 1 005', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Ir. Paiman, M.P.', 'S3', 'Agroteknologi', '19650916 199503 1 003', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('C. Tri Kusumastuti, S.P., M.Sc.', 'S2', 'Agroteknologi', '19751116 200501 2 002', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Puguh Bintang Pamungkas, M.P', 'S2', 'Agroteknologi', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Prof. Dr. Ir. Prapto Yudhono, M.Sc', 'S3', 'Agroteknologi', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dra. Tri Siwi Nugrahani, S.E., M.Si.', 'S2', 'Akuntansi', '19671126 199303 2 002  ', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Dekeng Setyo Budiarto, Ak.CA.', 'S3', 'Akuntansi', '19740814 200607 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Sri Widodo, S.E.,M.Sc', 'S2', 'Akuntansi', '19780201 200607 1 004', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Sukhemi, M.Sc.', 'S2', 'Akuntansi', '19760307 200204 1 002', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Vidya Vitta Adhivinna., SE., M.Si.Ak', 'S2', 'Akuntansi', '19780429 200404 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Hari Purnama, S.E., M.M.', 'S2', 'Akuntansi', '19620221 199503 1 004', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ratna Purnama Sari, S.E., M.Si', 'S2', 'Akuntansi', '19880807 201404 2 007', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Rani Eka Diansari, S.E., M.Acc', 'S2', 'Akuntansi', '19860114 201508 2 000', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Yennisa, S.E., M.Sc.Ak.CA', 'S2', 'Akuntansi', '19850108 201508 2 006', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('M. Sulkhanul Umam, S.E., M.Si', 'S2', 'Akuntansi', '19900324 201604 1 013', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ningrum Pramudiati, S.E., M.Si', 'S2', 'Akuntansi', '19930916 201805 2 013', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Anandita Zulia Putri, S.E., M.Acc', 'S2', 'Akuntansi', '19920523 201805 2 025', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Lulu Amalia Nusron, S.E., M.Ak', 'S2', 'Akuntansi', '19931104 201806 2 026', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Zidni Husnia Fachrunnisa, S.E., M.Ak.', 'S2', 'Akuntansi', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Baniady Gennody Pronosokodewo, S.E., M.Si.', 'S2', 'Akuntansi', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Rahandhika Ivan Adyaksana, S.E., M.Si', 'S2', 'Akuntansi', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dra. Ika Ernawati, M.Pd.', 'S2', 'Bimbingan Konseling', '19601212 198703 2 002', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Drs. Djuwalman, M.Pd.', 'S2', 'Bimbingan Konseling', '19520705 198211 1 002 ', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Drs. Makin, M.Pd', 'S2', 'Bimbingan Konseling', '19591107 198703 1 002   ', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Enik Nur Kholidah, S.E., M.A.', 'S2', 'Bimbingan Konseling', '19711028 201004 2 003', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Arum Setiowati, S.Pd., M.Pd.', 'S2', 'Bimbingan Konseling', '19841129 201302 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dra. Hj. Nurwahyumiani, M.A', 'S2', 'Bimbingan Konseling', '19570310 198503 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dra. Suharni, M.Pd.', 'S2', 'Bimbingan Konseling', '19541109 198103 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Drajat Edy Kurniawan, S.Pd., M.Pd', 'S2', 'Bimbingan Konseling', '19901124 201604 1 018', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Shinta Purwaningrum, S.Pd., M.Pd', 'S2', 'Bimbingan Konseling', '19881217 201608 2 000', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Taufik Agung Pranowo, S.Pd., M.Pd', 'S2', 'Bimbingan Konseling', '19860902 201604 1 014', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Eko Perianto, S.Pd., M.Si', 'S2', 'Bimbingan Konseling', '19870323 201404 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Iis Latifah Nuryanto, S.Pd., M.Pd', 'S2', 'Bimbingan Konseling', '19881209 201404 2 002', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Herwinda Putri Daniswari, S.Pd.,M.Pd', 'S2', 'Bimbingan Konseling', '19940320 201805 2 008', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Fitri Susilowati, S.E., M.Sc', 'S2', 'Manajemen', '19820721 201404 2 006', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dra. Murti Sumarni, MM.', 'S2', 'Manajemen', '19530921 198103 2 001 ', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dra. Yati Suhartini, MA.', 'S2', 'Manajemen', '19590106 198503 2 007', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Drs. Arif Sudaryana, M.Si.', 'S2', 'Manajemen', '19610213 198703 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dra. Endang Tri Wahyuni, MM.', 'S2', 'Manajemen', '19580607 199503 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Lilik Siswanto, S.E, M.M', 'S2', 'Manajemen', '19670729 200204 1 003', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Arista Natia Afriany, S.E, M.BA', 'S2', 'Manajemen', '19831029 201508 2 000', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ahsan Sumantika, S.E, M.Sc', 'S2', 'Manajemen', '19870724 201508 1 000', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Adhi Prakosa,S.E. M.Sc', 'S2', 'Manajemen', '19860827 201508 1 000', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Faizal Ardiyanto, S.E., M.M', 'S2', 'Manajemen', '19901017 201604 1 009', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Saptaningsih Sumarmi, S.E., M.M', 'S2', 'Manajemen', '19731022 199710 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Anindita Imam Basri, S.E.I.,M.M', 'S2', 'Manajemen', '19891110 201805 1 003', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Natalia Ratna Ningrum, S.E.,M.M', 'S2', 'Manajemen', '19871217 201805 2 012', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Diah Aryanti Saptowarsi, S.E.,M.Sc', 'S2', 'Manajemen', '19740606 201805 2 005', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Inayat Hanum Indriati,S.E., M.M', 'S2', 'Manajemen', '19690910 201805 2 009', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Pradita Nindya Aryandha, S.E., M.B.A', 'S2', 'Manajemen', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Hapsari Dyah Herdiany, S.E., M.M', 'S2', 'Manajemen', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Latifah Putranti, S.E., M.Sc', 'S2', 'Manajemen', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Fikri Farhan, S.E., M.Sc', 'S2', 'Manajemen', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Guruh Ghifar Zalzalah, S.E., M.Sc', 'S2', 'Manajemen', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dra. Kristina Warniasih, M.Pd.', 'S2', 'Pend. Matematika', '19620816 198702 2 001  ', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dra. MM. Endang Susetyawati, M.Pd.', 'S2', 'Pend. Matematika', '19620516 198803 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Abdul Aziz Saefudin, S.Pd.I.,M.Pd.', 'S2', 'Pend. Matematika', '19820611 201104 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dhian Arista Istikomah, S.Si., M.Sc.', 'S2', 'Pend. Matematika', '19870426 201104 2 004', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Gunawan, S.Si., M.Pd', 'S2', 'Pend. Matematika', '19840704 201004 1 004', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Laela Sagita, S.Pd., M.Sc.', 'S2', 'Pend. Matematika', '19841222 201104 2 003', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Nendra Mursetya S D, S.Pd., M.Sc', 'S2', 'Pend. Matematika', '19831030 201004 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Niken Wahyu Utami, S.Pd.Si., M.Pd.', 'S2', 'Pend. Matematika', '19840422 200904 2 002', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Koryna Aviori, S.Si., M.Pd.', 'S2', 'Pend. Matematika', '19861206 201201 2 033', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Siska Candra Ningsih, S.Si., M.Sc.', 'S2', 'Pend. Matematika', '19780923 201401 2 000', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Titis Sunanti, S.Pd., M.Si.', 'S2', 'Pend. Matematika', '19800412 201408 2 000', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Palupi Sri Wijayanti, S.Pd., M.Pd', 'S2', 'Pend. Matematika', '19890615 201508 2 010', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Padrul Jana, S.Pd., M.Sc', 'S2', 'Pend. Matematika', '19890417 201508 1 012', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Kintoko, S.Pd., M.Pd', 'S2', 'Pend. Matematika', '19861225 201508 1 000', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Bintang Wicaksono, S.Pd., M.Pd', 'S2', 'Pend. Matematika', '19890123 201404 1 014', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ch. Eva Nuryani, S.Si., M.Sc', 'S2', 'Pend. Matematika', '19761224 200501 2 002', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Tri Wahana, S.Pd., M.Pd.', 'S2', 'Pend. Sejarah', '19681217 199412 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Darsono, S.Pd., M.Pd.', 'S2', 'Pend. Sejarah', '19671105 199412 1 002', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Drs. Siswanta, M.Pd', 'S2', 'Pend. Sejarah', '19650216 199109 1 004', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Drs. Johanes Sabari, M.Si.', 'S2', 'Pend. Sejarah', '19510701 198907 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Muhammad Iqbal Birsyada, S.Pd., M.Pd', 'S3', 'Pend. Sejarah', '19880210 201404 1 009', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Bayu Ananto Wibowo, S.Pd., M.Pd.', 'S2', 'Pend. Sejarah', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Fahruddin, S.Pd., M.Pd.', 'S2', 'Pend. Sejarah', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Sujatmiko, S.Pd.Ing., M.Hum.', 'S2', 'Pend. Bahasa Inggris', '19830609 201310 1 002', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Nafisah Endahati, S.Pd., M.Hum', 'S2', 'Pend. Bahasa Inggris', '19780316 201310 2 004', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Sri Wiyanah, S.Pd., M.Hum.', 'S2', 'Pend. Bahasa Inggris', '19790613 201401 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Rudha Widagsa, S.S., M.A.', 'S2', 'Pend. Bahasa Inggris', '19850102 201310 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Juang Kurniawan S, S.Pd., M.Pd.B.I', 'S2', 'Pend. Bahasa Inggris', '19870404 201402 1 000', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Andi Dian Rahmawan, S.Pd., M.A', 'S2', 'Pend. Bahasa Inggris', '19860421 201404 1 003', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Rifki Irawan, S.Pd., M.Pd', 'S2', 'Pend. Bahasa Inggris', '19921023 201805 1 018', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Primasari Wahyuni, S.Pd., M.Pd.', 'S2', 'PBS Indonesia', '19870421 201310 2 004', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Muncar Tyas Palupi, S.S., M.Hum.', 'S2', 'PBS Indonesia', '19760711 201310 2 002', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Rika Novita Kusumaningrum, S.S., M.A.', 'S2', 'PBS Indonesia', '19790818 201310 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Tri Ratna Herawati, S.Pd., M.Hum.', 'S2', 'PBS Indonesia', '19710115 201310 2 003', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Fitri Jamilah, S.Pd., M.Pd', 'S2', 'PBS Indonesia', '19840601 201404 2 005', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Nina Widyaningsih, S.Pd., M.Hum', 'S2', 'PBS Indonesia', '19821020 201404 2 004', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Yanuar Bagas Arwansyah, S.Pd., M.Pd', 'S2', 'PBS Indonesia', '19930113 201805 1 024', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Jalu Norva Illa Putra, S.S., M.A.', 'S2', 'PBS Indonesia', '19920906 201901 1 007', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Rosalia Susila Purwanti, S.Sn., M.Pd.', 'S2', 'PGSD', '19560713 198101 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Budiharti, S.Si., M.Pd.', 'S2', 'PGSD', '19850811 200804 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Deri Anggraini, S.Pd., M.Pd.', 'S2', 'PGSD', '19860303 200804 2 002', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Dhiniaty Gularso, S.Si., M.Pd.', 'S2', 'PGSD', '19800215 200804 2 004', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Siti Maisaroh, SE., M.Pd.', 'S3', 'PGSD', '19690916 200204 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Wahyu Kurniawati, S.Si., M.Pd.', 'S2', 'PGSD', '19840511 200804 2 003', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Setyo Eko Atmojo, S.Pd., M.Pd.', 'S3', 'PGSD', '19861227 201201 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Selly Rahmawati, S.Pd., M.Pd.', 'S2', 'PGSD', '19870723 201302 2 002', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Ahmad Agung Yuwono, S.E., S.Pd., M.Pd.', 'S3', 'PGSD', '19840510 201302 1 006', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ari Wibowo, S.Pd., M.Pd', 'S2', 'PGSD', '19861105 201302 1 005', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Rina Dyah Rahmawati, S.Si., M.Pd', 'S2', 'PGSD', '19790505 201404 2 011', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Taufik Muhtarom, S.Pd., M.Pd', 'S2', 'PGSD', '19880823 201404 1 012', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Danuri, S.Pd.Si., M.Pd', 'S2', 'PGSD', '19851231 201404 1 013', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Mahilda Dea Komalasari, S.Pd., M.Pd', 'S2', 'PGSD', '19900930 201508 2 000', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Hermawan Wahyu Setiadi, S.Pd., M.Pd', 'S2', 'PGSD', '19860623 201508 1 000', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Hengki Yudha Barnaba, S.Pd., M.Pd', 'S2', 'PGSD', '19881018 201508 1 003', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Bahtiyar Heru Susanto, S.Pd., M.Pd', 'S2', 'PGSD', '19900402 201604 1 006', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Beny Dwi Lukitoaji, S.Pd., M.Pd', 'S2', 'PGSD', '19891117 201604 1 007', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Urip Muhayat Wiji Wahyudi, S.Pd., M.Pd', 'S2', 'PGSD', '19900606 201805 1 021', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Rian Nurizka, S.Pd., M.Pd', 'S2', 'PGSD', '19920130 201805 1 016', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Amanatie, M.Pd., M.Si', 'S3', 'PGSD', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Ganung Anggraeni', 'S3', 'PGSD', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Arip Febrianto, S.Pd., M.Pd.I', 'S2', 'PGSD', '19910205 201606 1 002', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Hadna Suryantari, S.Pd, M.Pd.', 'S2', 'PGSD', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Henry Aditia Rigianti, S.Pd, M.Pd.', 'S2', 'PGSD', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Heru Purnomo, M.Pd', 'S2', 'PGSD', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Puguh Ardianto Iskandar, S.Pd., M.Pd', 'S2', 'PGSD', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Muhardila Fauziah, S.Pd.I., M.Pd', 'S2', 'PGSD', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Yogi Prihandoko, S.Pd., M.Pd', 'S2', 'PGSD', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Sukadari, SE., SH.,MM.', 'S3', 'Pendidikan IPS', '19570713 198303 1 003 ', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Prof. Dr. Buchory MS, M.Pd.', 'S3', 'Pendidikan IPS', '19570425 198403 1 002', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Salamah, M.Pd.', 'S3', 'Pendidikan IPS', '19612812 198702 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Sunarti, M.Pd.', 'S3', 'Pendidikan IPS', '19540228 198012 2 001  ', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Prof. Dr. Kodiran, MA', 'S3', 'Pendidikan IPS', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Prof. Dr. DJoko Suryo', 'S3', 'Pendidikan IPS', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr.Victor Novianto, S.Pd., M.Hum', 'S3', 'Pendidikan IPS', '19761114 200501 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Esti Setiawati, M.Pd', 'S3', 'Pendidikan IPS', '19650909 199512 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Drs. Tarto, S.T., M.Pd', 'S3', 'Pendidikan IPS', '19560613 201704 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Gunawan Sridiyatmiko, M.Pd.', 'S3', 'Pendidikan IPS', '19670719 199610 1 004', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Elsa Putri Ermisah Syafril', 'S3', 'Pendidikan IPS', '19771127 201404 2 008', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Sigit Handoko S.H., MH.', 'S2', 'PPKN', '19651110 199202 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ari Retno Purwanti, SH., MH.', 'S2', 'PPKN', '19690307 199301 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Supri Hartanto, S.Pd., M.Pd.', 'S2', 'PPKN', '19730411 201004 1 002', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dra. Rosalia Indriyati Saptatiningsih, M.Si', 'S2', 'PPKN', '19590716 198702 2 001  ', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Yitno Pringgowijoyo, SH., M.H', 'S2', 'PPKN', '19540321 198003 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Armansyah Prasakti, SH, Sp.N, M.H', 'S2', 'PPKN', '19650905 199212 1 006', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dr. Septian Aji Permana, S.Pd., M.Pd', 'S3', 'PPKN', '19870911201404 1 010 ', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Abdul Rahim, S.Pd., M.Pd', 'S2', 'PPKN', '19870909 201805 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('T. Heru Nurgiansah, S.Pd., M.Pd', 'S2', 'PPKN', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ahmad Riyadi, S.Si., M.Kom.', 'S2', 'Teknik Informatika', '19690214 199812 1 006', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Meilany Nonsi Tentua, S.Si., MT.', 'S2', 'Teknik Informatika', '19730512 200607 1 003', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('M. Fairuzabadi, S.Si., M.Kom.', 'S2', 'Teknik Informatika', '19740921 200204 1 004', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Marti Widya Sari, S.T., M.Eng', 'S2', 'Teknik Informatika', '19790327 201201 2 009', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Setia Wardani, S.Kom., M.Kom', 'S2', 'Teknik Informatika', '19840928 201504 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Wibawa, S.Si., M.Eng.', 'S2', 'Teknik Informatika', '19690607 201201 1 012', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Nurirwan Saputra, S.Kom., M.Eng', 'S2', 'Teknik Informatika', '19880520 201508 1 014', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Puji Handayani Putri, S.T., M.Kom', 'S2', 'Teknik Informatika', '19900222 201601 2 000', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Prahenusa Wahyu Ciptadi, S.T., M.T', 'S2', 'Teknik Informatika', '19841227 201604 1 000', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('R. Hafid Hardyanto, S.Pd., M.Pd', 'S2', 'Teknik Informatika', '19871205 201604 1 012', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Aditya Wahana, S.Pd.T., M.Kom', 'S2', 'Teknik Informatika', '19850424 201604 1 005', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Sunggito Oyama, S.Kom., M.T', 'S2', 'Teknik Informatika', '19840103 201508 1 000', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Tri Hastono, S.Kom.,M.T', 'S2', 'Teknik Informatika', '19830413 201805 1 020', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ari Kusuma Wardana, S.T., M.Cs', 'S2', 'Teknik Informatika', '19910423 201805 1 004', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Rianto, S.Kom., M.T', 'S2', 'Teknik Informatika', '19831229 201805 1 017', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Firdiyan Syah, S.Kom., M.Kom', 'S2', 'Teknik Informatika', '19770731 201805 1 006', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Novianti Retno Utami, S.Pd., M.Pd', 'S2', 'PG-PAUD', '19881118 201805 2 014', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Khikmah Novitasari, S.Pd., M.Pd', 'S2', 'PG-PAUD', '19921103 201805 2 010', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Herdi Handoko, S.Pd., M.Pd', 'S2', 'PG-PAUD', '19820314 201805 1 007', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Syahria Anggita Sakti, S.Pd., M.Pd', 'S2', 'PG-PAUD', '19860922 201805 1 002', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Titik Mulat Widyastuti, S.Pd., M.Pd', 'S2', 'PG-PAUD', '19641123 201805 2 019', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Windi Wulandari Iman Utama, S.Pd., M.Pd', 'S2', 'PG-PAUD', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Luqman Hidayat, S.Pd.,M.Pd', 'S2', 'Pendidikan Luar Biasa', '19920309 201805 1 011', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Faiz Noormiyanto, S.Pd., M.Pd', 'S2', 'Pendidikan Luar Biasa', '19901021 201605 1 002', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dwi Setianingsih, M.Pd', 'S2', 'Pendidikan Luar Biasa', '19900804 201605 2 001', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Yulian Agus Suminar, S.Pd., M.Pd', 'S2', 'Pendidikan Luar Biasa', '19840726 201608 2 002', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dwi Putri Fatmawati, S.Pd., M.Pd', 'S2', 'Pendidikan Luar Biasa', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ramdhan Harjana, S.Pd., M.Pd', 'S2', 'Pendidikan Luar Biasa', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Apt. Rahmat A.Hi Wahid, S.Farm., M.Farm', 'S2', 'Farmasi', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Apt. Margala Juang Bertorio, S.Farm., M.Clin.Pharm', 'S2', 'Farmasi', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Nurul Jannah., S.Farm., M.Pharm.Sci., Apt', 'S2', 'Farmasi', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Anis Febri Nilansari, S.Farm., M.Pharm.Sci., Apt', 'S2', 'Farmasi', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Hanifah Karimatulhajj, S.Farm., M.Farm', 'S2', 'Farmasi', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Kurniawanti, S.T., M.Sc', 'S2', 'Teknik Industri', '19850505 201604 2 003', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Yaning Tri Hapsari, S.T., M.Sc', 'S2', 'Teknik Industri', '19851209 201604 2 002', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Hasti Hasanati Marfuah, S.T., M.T', 'S2', 'Teknik Industri', '19870630 201604 2 004', 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Theofilus Bayu Dwinugroho, S.T., M.Sc', 'S2', 'Teknik Industri', '19820122 201610 1 001', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Guntur Samodro, S.T., M.T', 'S3', 'Teknik Industri', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Aldrin Febriansyah, ST., M.Sc.', 'S2', 'Teknik Arsitektur', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Eka Widyaningsih, ST., M.Sc.', 'S2', 'Teknik Arsitektur', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Radiaswari, ST., M.Sc.', 'S2', 'Teknik Arsitektur', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Rachmat Wahyu Prabowo, ST., M.Eng.', 'S2', 'Teknik Arsitektur', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Adinda Rafika Dani, S.T., M.Sc', 'S2', 'Teknik Arsitektur', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Amalia Cemara Nur’aidha, S.Si., M.Si', 'S2', 'Biomedis', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dhananjaya Yama Hudha, S.T, M. Biotech ', 'S2', 'Biomedis', '19880105 201610 1 002', 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('dr. R. Bopi Yudha Sapa, M.Sc., MMR', 'S3', 'Biomedis', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Wahyu Sugianto, S.Si., M.Si', 'S2', 'Biomedis', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Mira Setiana, S.Si., M.Si', 'S2', 'Biomedis', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ekha Rifki Fauzi, SKM, M.P.H', 'S2', 'Elektromedis', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Danang Widyawarman, S.ST, M.Sc', 'S2', 'Elektromedis', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dena Anugrah, S.Pd, M.Pd.', 'S2', 'Elektromedis', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Pebri Prihatmoko, S.Pd., M.Eng', 'S2', 'Elektromedis', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Herenda Sela Wismaya, S.Si., M.Si', 'S2', 'Elektromedis', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Brevi Istu Pambudi, S.Gz., M.Gizi.', 'S2', 'Gizi', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Laeli Nur Hasanah, S. Gz., M.Si.', 'S2', 'Gizi', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Astri Praba Shinta, S.Gz., M.P.H', 'S2', 'Gizi', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Rosmauli Jeremia, S.Gz., M.Gizi', 'S3', 'Gizi', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ryan Rohmansyah, S.Gz., M.Gz', 'S2', 'Gizi', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Didik Rohmantoro, S.Pd, M.Pd.', 'S2', 'PVTO', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Bayu Gilang Purnomo, S.Pd, M.Pd.', 'S2', 'PVTO', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Muhammad Priya Permana, S.Pd, M.Pd.', 'S2', 'PVTO', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Ir. Yulia Venti Yoanita,ST, M.Eng.', 'S2', 'PVTO', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Muhamad Amiruddin, S.Pd, M.Pd.', 'S2', 'PVTO', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Lana Santika Nadia, S.T.P., M.Sc.', 'S2', 'THP', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Atika Nur Syarifah, S.TP., M.Sc.', 'S2', 'THP', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Dewi Amrih, S.T.P., M.Sc.', 'S2', 'THP', NULL, 'P', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Adi Sutakwa, S.TP., M.Sc', 'S2', 'THP', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Suharman, S.TP., M.Sc', 'S2', 'THP', NULL, 'L', NULL, NULL, NULL, 2);
INSERT INTO `olah_data_pegawai` VALUES ('Citra Murti Anggraini, S.Pd', 'S1', 'BAAK', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Sru Hardoyo, A.Md.', 'D3', 'BAAK', '19700128 201410 1 001', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Nur Fatimah', 'SMA', 'BAAK', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Rahmad Nurcahya, A.Md.Kom', 'D3', 'BAAK', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('RA Hastin Kusumaningrum, A.Md.Sek', 'D3', 'BAAK', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Rizky Amanda Rachman, A.Md', 'D3', 'BAAK', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Dra. Muryani', 'S1', 'BAKu', '19651210 199208 2 002', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Setiawan Eko P., S.Kh.', 'S1', 'BAKu', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Mirwan Hanafi, S.E', 'S1', 'BAKu', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Anis Khoirin Nisa, A.Md.Ak', 'D3', 'BAKu', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Restu Dwi Nugraeni, S.Pd.', 'S1', 'Yayasan', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Suradi', 'SMP', 'Yayasan', '19680714 199308 2 003', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Agus Suparyanto', 'SMP', 'Yayasan', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Dra. Juliana Widarjanti', 'S1', 'BAUK', '19650603 198808 1 001', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Anom Wijono, ST.', 'S1', 'BAUK', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Suramin, S.Pd.', 'S1', 'BAUK', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Krisnayang Vertika, S.Pd', 'S1', 'BAUK', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Melan Tri Prasetya, S.Kom', 'S1', 'BAUK', '19690117 199308 2 004', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Rony Hanif Warayang, S.Hut', 'S1', 'BAUK', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Febri Aji Wisnulaksito, S.Kom', 'S1', 'BAUK', '19700223 199805 1 003', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Atmuji Handoko', 'SMP', 'BSP', '19831120 201410 1 002', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Sugiharto, S.Pd.', 'S1', 'BSP', '197406 20201710 1 003', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Eri Kriswanto', 'SMA', 'BSP', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Sudari', 'SMP', 'BSP', '19660227 199208 2 003', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Suparno', 'SMA', 'BSP', '19630914 199805 1 002', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Ngatinem, S.Pd.', 'S1', 'BSP', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Paijan', 'SD', 'BSP', '19730702 200710 1 002', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Wahyu Setiawan', 'SMP', 'BSP', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Agust. Suharwanto, M.Pd.', 'S2', 'BSP', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Jono', 'SD', 'BSP', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Ariadi Setya Wijaya, A.Md', 'D3', 'BSP', '19610525 200505 1 001', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Rakhmat Wahyudi, S.Pd.T', 'S1', 'BSP', '19690603 201710 2 001', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Lita Yuniatri, A.Md.', 'D3', 'TU LPPM', '19690501 199308 1 005', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Suntoro, S.Pd.', 'S1', 'TU FKIP', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Yanning Adhiyanti, S.P', 'S1', 'TU FKIP', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Riezki Desiana Nur Pramono, A.Md.Sek', 'D3', 'TU FKIP', '19720510 201610 2 001', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Iswati', 'SMP', 'TU F. Saintek', '19740620 200804 1 005', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Sumardi, S.Pd.', 'S1', 'TU Pascasarjana', '19640410 198808 1 001', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Waginah, S.Pd.', 'S1', 'TU Pend. Mtk', '19600609 200505 2 002', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Endah Rini Astuti, MPd.', 'S2', 'TU Pend. Sejarah', '19690117 199310 2 003', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Samsudin, S.Pd.', 'S1', 'TU PGSD', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Upik Kuswardhani', 'S1', 'TU PPKN', '19751108 201410 2 003', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Novita Setyaningsih, S.Pd', 'S1', 'TU PB Inggris', '19650712 198808 1 003', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Ahmad Edy Nugroho, S.Pd', 'S1', 'TU Fakultas Ekonomi', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Sri Nurhayati, S.Pd', 'S1', 'TU Manajemen', '19861123 201410 2 004', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Rahman Hasto Nugroho, S.Pd', 'S1', 'TU Akuntansi', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Heni Nurrohmah, S.Pd', 'S1', 'TU Fakultas Ekonomi', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Yuli Ibnu Darsana, S.Pd., M.A', 'S2', 'UPT Perpustakaan', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Fitri Riani, A.Md', 'D3', 'UPT Perpustakaan', '19660727 199601 1 001', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Munir Nugroho, SIP', 'S1', 'UPT Perpustakaan', '19640101 199805 1 004', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Nurul Sinto A., SIP', 'S1', 'UPT Perpustakaan', '19641106 201710 1 002', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Pepen Suherman, S.Kom.', 'S1', 'UPT PPTIK', '19741007 201710 1 004', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Friya Fratama Bekti Susanto, S.Kom', 'S1', 'UPT PPTIK', '19691205 201410 1 007', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Edy Purwanto, S.Kom', 'S1', 'UPT PPTIK', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Dian Fitri Utami, A.Md', 'D3', 'UPT PPTIK', '19750914 201410 1 005', 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Drs. Subur Mulyono', 'S1', 'Satpam ', '19690520 201806 1 001', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Wastono', 'SMP', 'Satpam ', '19751113 201710 1 005', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Abdullah', 'SMA', 'Satpam ', '19680717 201410 1 006', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Eko Pratamasiwi', 'SMA', 'Satpam ', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Jumadi', 'SMA', 'Satpam ', '19620112 199308 1 006', 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Sujiono, SS.', 'S1', 'Satpam ', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Sugeng Haryadi', 'SMK', 'Satpam ', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Triyanto, S.Pd', 'S1', 'Satpam ', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Djulianto', 'SMK', 'Satpam ', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Sarino', 'SMA', 'Satpam ', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Adi Prasetyo, S.Kom.', 'S1', 'Laboran Fakultas Teknik', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Fajar Ampi Dyantoro, S.Kom', 'S1', 'Laboran UPPL', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Drs. Eko Asihanto', 'S1', 'Laboran Sejarah', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Cerry Reggiani Catri S.Si', 'S2', 'Laboran Agro', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Danang Hanjaru, S.Pd', 'S1', 'LKK', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Drs. Sarjiman', 'S1', 'Pusat Karir', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Nofi Rini Dyah S, S.Pd', 'S1', 'PMB', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Supardi, ST.', 'S1', 'RUSUNAWA', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Hasan Muji Santoso', 'SD', 'Keamanan Unit II', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Sukirman ', 'SMP', 'Parkir', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Eka Nugraha Sari, S.Kom', 'S1', 'TIM PAK', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Muhari Agus Nugraha, S.Kom', 'S1', 'TIM PAK', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Margi Untungningsih', 'SMA', 'TU BK', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Karyadi', 'SMK', 'Keamanan Unit II', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Ida Setiani', 'ISLAM', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Tias Anggraheni', 'ISLAM', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Rismawati Artafasara, S.Pd', 'ISLAM', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Fitria Ratnasari', 'ISLAM', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Dwi Wulandari, S.Ak', 'ISLAM', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Ita Sari, S.Pd', 'ISLAM', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Nella Merita Kumalasari, S.Pd', 'ISLAM', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Naura Syauqina Firdausa', 'ISLAM', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Tyas Ayu Wahyu Ningsih', 'ISLAM', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Yunia Afiyati', 'ISLAM', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Pungki Revianti', 'ISLAM', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Khamidah', 'Islam', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Dhita Murti Santari', 'Islam', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Puspa Tikka Lovianti', 'Islam', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Athalia Fawwaz Agianto', 'Islam', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('M. Riyan Prastya', 'Islam', 'Magang', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Yulina Dwi', 'Islam', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Indri Widyastuti', 'Islam', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Luthfi Nabila', 'Islam', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Eka Cahyati Putri', 'Islam', 'Magang', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Septi Ari Wahyuni', 'ISLAM', 'Satpam Outsourching', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Mohammat Syamsul Hidayat', 'ISLAM', 'Satpam Outsourching', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Mitun Nur Laksono', 'ISLAM', 'Satpam Outsourching', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Fany Jaka Susila', NULL, 'Satpam Outsourching', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Eko Supriyono', 'ISLAM', 'Satpam Outsourching', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Ade', 'ISLAM', 'Satpam Outsourching', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Heru Purnomo', 'ISLAM', 'Satpam Outsourching', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Ariyo Swandoko', 'ISLAM', 'Satpam Outsourching', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Kurnia Ayus Munandar', 'ISLAM', 'Satpam Outsourching ', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Tri Wahyuni', 'ISLAM', 'Satpam Outsourching', NULL, 'P', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Imam Chusairi', 'ISLAM', 'Satpam Outsourching', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Bima', 'ISLAM', 'Satpam Outsourching', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Sukirdi', 'ISLAM', 'Satpam Outsourching Rusunawa', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Anggoro', 'ISLAM', 'Satpam Outsourching Rusunawa', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Musbadi', NULL, 'Cleaning Service', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Suraji', 'ISLAM', 'Cleaning Service', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Eko Dwi Purnomo', NULL, 'Cleaning Service', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Sumirang Jati Caroko', 'ISLAM', 'Cleaning Service', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Rahmat Dion', 'KRISTEN', 'Cleaning Service', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Dalud Purnomo', 'ISLAM', 'Cleaning Service', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Sukamto', 'ISLAM', 'Cleaning Service', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Tumiran', 'ISLAM', 'Cleaning Service', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Darobi', 'ISLAM', 'Cleaning Service', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('David', 'ISLAM', 'Cleaning Service', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Totok Supriyadi', 'ISLAM', 'Cleaning Service', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Asri Sudarisman', 'ISLAM', 'Parker', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Wisnu Sukmo Pamungkas', 'ISLAM', 'Parker', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Ferry Yulianto', 'ISLAM', 'Parker', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Suparman', 'ISLAM', 'Parker', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Supardiyono', 'ISLAM', 'Kebersihan Mobil/Tenaga Lepas', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Samijo', 'ISLAM', 'THL', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Danur', 'NON', 'THL', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Fatturrohman', 'ISLAM', 'THL', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Danang Prijantoro', 'ISLAM', 'THL', NULL, 'L', NULL, NULL, NULL, 1);
INSERT INTO `olah_data_pegawai` VALUES ('Ngadiman', 'ISLAM', 'THL', NULL, 'L', NULL, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for pegawai
-- ----------------------------
DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai` (
  `id_pegawai` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_unit` int(11) DEFAULT NULL,
  `id_fakultas` int(11) DEFAULT NULL,
  `id_program_studi` int(11) DEFAULT NULL,
  `pin_finger` varchar(50) DEFAULT NULL,
  `nis_pegawai` varchar(255) DEFAULT NULL,
  `nama_pegawai` varchar(255) DEFAULT NULL,
  `jabatan_pegawai` varchar(255) DEFAULT NULL,
  `status_aktif` int(11) DEFAULT 1,
  PRIMARY KEY (`id_pegawai`),
  KEY `fk_id_unit` (`id_unit`),
  CONSTRAINT `fk_id_unit` FOREIGN KEY (`id_unit`) REFERENCES `unit` (`unit_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Records of pegawai
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  `id_pegawai` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`) USING BTREE,
  KEY `id_role` (`id_role`),
  KEY `id_pegawai` (`id_pegawai`),
  CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='desain dari naskah';

-- ----------------------------
-- Records of pengguna
-- ----------------------------
BEGIN;
INSERT INTO `pengguna` VALUES (1, 'admin', '$2y$10$.Fn8oY1zaoo3RZiuhBbRneNjSMNhtWO8UINoYygcw8vDV1JSBNSaS', 'Antonius Eko Cahyo Nadi', 1, NULL);
INSERT INTO `pengguna` VALUES (2, 'biro_kepegawaian', NULL, 'Biro Kepegawaian', 1, NULL);
INSERT INTO `pengguna` VALUES (3, 'biro_keuangan', NULL, 'Biro Keuangan', 2, NULL);
INSERT INTO `pengguna` VALUES (4, 'kepegawaian', NULL, 'Kepala Unit Biro Kepegawaian', 5, NULL);
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='tabel riset, tidak terpakai';

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1, 'Kopiss', 60000, 4, 'Kopi Luwaksss');
INSERT INTO `product` VALUES (6, 'Americano', 15000, 3, 'Americano Ice');
COMMIT;

-- ----------------------------
-- Table structure for program_studi
-- ----------------------------
DROP TABLE IF EXISTS `program_studi`;
CREATE TABLE `program_studi` (
  `id_program_studi` int(11) NOT NULL,
  `id_fakultas` int(11) DEFAULT NULL,
  `nama_program_studi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_program_studi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Records of program_studi
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id_role` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_role` varchar(255) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'Admin');
INSERT INTO `role` VALUES (2, 'Biro Kepegawaian');
INSERT INTO `role` VALUES (4, 'Biro Keuangan');
INSERT INTO `role` VALUES (5, 'Kepala Unit Kerja');
INSERT INTO `role` VALUES (6, 'Pegawai');
COMMIT;

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id_role_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `status_aktif` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_role_menu`) USING BTREE,
  KEY `fk_role` (`id_role`),
  KEY `fk_menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Records of role_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_nama` varchar(255) DEFAULT NULL,
  `unit_level` int(1) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Records of unit
-- ----------------------------
BEGIN;
INSERT INTO `unit` VALUES (1, 'BAAK', NULL);
INSERT INTO `unit` VALUES (2, 'BAKu', NULL);
INSERT INTO `unit` VALUES (3, 'BAUK', NULL);
INSERT INTO `unit` VALUES (4, 'BSP', NULL);
INSERT INTO `unit` VALUES (5, 'Cleaning Service', NULL);
INSERT INTO `unit` VALUES (6, 'Keamanan Unit II', NULL);
INSERT INTO `unit` VALUES (7, 'Kebersihan Mobil/Tenaga Lepas', NULL);
INSERT INTO `unit` VALUES (8, 'Laboran Agro', NULL);
INSERT INTO `unit` VALUES (9, 'Laboran Fakultas Teknik', NULL);
INSERT INTO `unit` VALUES (10, 'Laboran Sejarah', NULL);
INSERT INTO `unit` VALUES (11, 'Laboran UPPL', NULL);
INSERT INTO `unit` VALUES (12, 'LKK', NULL);
INSERT INTO `unit` VALUES (13, 'Magang', NULL);
INSERT INTO `unit` VALUES (14, 'Parkir', NULL);
INSERT INTO `unit` VALUES (15, 'PMB', NULL);
INSERT INTO `unit` VALUES (16, 'Pusat Karir', NULL);
INSERT INTO `unit` VALUES (17, 'RUSUNAWA', NULL);
INSERT INTO `unit` VALUES (18, 'Satpam ', NULL);
INSERT INTO `unit` VALUES (19, 'Satpam Outsourching', NULL);
INSERT INTO `unit` VALUES (20, 'Satpam Outsourching Rusunawa', NULL);
INSERT INTO `unit` VALUES (21, 'THL', NULL);
INSERT INTO `unit` VALUES (22, 'TIM PAK', NULL);
INSERT INTO `unit` VALUES (23, 'TU Akuntansi', NULL);
INSERT INTO `unit` VALUES (24, 'TU BK', NULL);
INSERT INTO `unit` VALUES (25, 'TU F. Saintek', NULL);
INSERT INTO `unit` VALUES (26, 'TU Fakultas Ekonomi', NULL);
INSERT INTO `unit` VALUES (27, 'TU FKIP', NULL);
INSERT INTO `unit` VALUES (28, 'TU LPPM', NULL);
INSERT INTO `unit` VALUES (29, 'TU Manajemen', NULL);
INSERT INTO `unit` VALUES (30, 'TU Pascasarjana', NULL);
INSERT INTO `unit` VALUES (31, 'TU PB Inggris', NULL);
INSERT INTO `unit` VALUES (32, 'TU Pend. Mtk', NULL);
INSERT INTO `unit` VALUES (33, 'TU Pend. Sejarah', NULL);
INSERT INTO `unit` VALUES (34, 'TU PGSD', NULL);
INSERT INTO `unit` VALUES (35, 'TU PPKN', NULL);
INSERT INTO `unit` VALUES (36, 'UPT Perpustakaan', NULL);
INSERT INTO `unit` VALUES (37, 'UPT PPTIK', NULL);
INSERT INTO `unit` VALUES (38, 'Yayasan', NULL);
INSERT INTO `unit` VALUES (39, 'Agroteknologi', NULL);
INSERT INTO `unit` VALUES (40, 'Akuntansi', NULL);
INSERT INTO `unit` VALUES (41, 'Bimbingan Konseling', NULL);
INSERT INTO `unit` VALUES (42, 'Biomedis', NULL);
INSERT INTO `unit` VALUES (43, 'Elektromedis', NULL);
INSERT INTO `unit` VALUES (44, 'Farmasi', NULL);
INSERT INTO `unit` VALUES (45, 'Gizi', NULL);
INSERT INTO `unit` VALUES (46, 'Manajemen', NULL);
INSERT INTO `unit` VALUES (47, 'PBS Indonesia', NULL);
INSERT INTO `unit` VALUES (48, 'Pend. Bahasa Inggris', NULL);
INSERT INTO `unit` VALUES (49, 'Pend. Matematika', NULL);
INSERT INTO `unit` VALUES (50, 'Pend. Sejarah', NULL);
INSERT INTO `unit` VALUES (51, 'Pendidikan IPS', NULL);
INSERT INTO `unit` VALUES (52, 'Pendidikan Luar Biasa', NULL);
INSERT INTO `unit` VALUES (53, 'PG-PAUD', NULL);
INSERT INTO `unit` VALUES (54, 'PGSD', NULL);
INSERT INTO `unit` VALUES (55, 'PPKN', NULL);
INSERT INTO `unit` VALUES (56, 'PVTO', NULL);
INSERT INTO `unit` VALUES (57, 'Teknik Arsitektur', NULL);
INSERT INTO `unit` VALUES (58, 'Teknik Industri', NULL);
INSERT INTO `unit` VALUES (59, 'Teknik Informatika', NULL);
INSERT INTO `unit` VALUES (60, 'THP', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
