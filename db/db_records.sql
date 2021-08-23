/*
Navicat MySQL Data Transfer

Source Server         : localhost-xampp
Source Server Version : 100138
Source Host           : localhost:3306
Source Database       : db_monitoring_kehadiran_pegawai

Target Server Type    : MYSQL
Target Server Version : 100138
File Encoding         : 65001

Date: 2021-08-10 11:01:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fakultas
-- ----------------------------
DROP TABLE IF EXISTS `fakultas`;
CREATE TABLE `fakultas` (
`id_fakultas`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`nama_fakultas`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id_fakultas`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='desain dari naskah'
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of fakultas
-- ----------------------------
BEGIN;
INSERT INTO `fakultas` VALUES ('1', 'Ekonomi'), ('2', 'Pertanian'), ('3', 'Sains dan Teknologi'), ('4', 'Keguruan dan Ilmu Pendidikan'), ('5', 'Program Pascasarjana');
COMMIT;

-- ----------------------------
-- Table structure for jadwal_kerja
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_kerja`;
CREATE TABLE `jadwal_kerja` (
`id_jadwal_kerja`  int(11) NOT NULL AUTO_INCREMENT ,
`nama_jadwal_kerja`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`unit_id`  int(11) NULL DEFAULT NULL ,
`id_pegawai`  int(11) NULL DEFAULT NULL ,
`id_jam_kerja`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id_jadwal_kerja`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='desain dari naskah'
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of jadwal_kerja
-- ----------------------------
BEGIN;
INSERT INTO `jadwal_kerja` VALUES ('1', 'Jadwal Kerja Dosen Reguler', '1', '0', '2'), ('2', 'Jadwal Kerja Dosen Reguler', '59', '0', '2'), ('3', 'Jadwal Kerja Akademik', '62', '0', '2');
COMMIT;

-- ----------------------------
-- Table structure for jam_kerja
-- ----------------------------
DROP TABLE IF EXISTS `jam_kerja`;
CREATE TABLE `jam_kerja` (
`id_jam_kerja`  int(11) NOT NULL AUTO_INCREMENT ,
`nama_jam_kerja`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`jam_masuk_senin`  time NULL DEFAULT NULL ,
`jam_pulang_senin`  time NULL DEFAULT NULL ,
`jam_masuk_senin_toleransi`  time NULL DEFAULT NULL ,
`jam_pulang_senin_toleransi`  time NULL DEFAULT NULL ,
`jam_masuk_selasa`  time NULL DEFAULT NULL ,
`jam_pulang_selasa`  time NULL DEFAULT NULL ,
`jam_masuk_selasa_toleransi`  time NULL DEFAULT NULL ,
`jam_pulang_selasa_toleransi`  time NULL DEFAULT NULL ,
`jam_masuk_rabu`  time NULL DEFAULT NULL ,
`jam_pulang_rabu`  time NULL DEFAULT NULL ,
`jam_masuk_rabu_toleransi`  time NULL DEFAULT NULL ,
`jam_pulang_rabu_toleransi`  time NULL DEFAULT NULL ,
`jam_masuk_kamis`  time NULL DEFAULT NULL ,
`jam_pulang_kamis`  time NULL DEFAULT NULL ,
`jam_masuk_kamis_toleransi`  time NULL DEFAULT NULL ,
`jam_pulang_kamis_toleransi`  time NULL DEFAULT NULL ,
`jam_masuk_jumat`  time NULL DEFAULT NULL ,
`jam_pulang_jumat`  time NULL DEFAULT NULL ,
`jam_masuk_jumat_toleransi`  time NULL DEFAULT NULL ,
`jam_pulang_jumat_toleransi`  time NULL DEFAULT NULL ,
`jam_masuk_sabtu`  time NULL DEFAULT NULL ,
`jam_pulang_sabtu`  time NULL DEFAULT NULL ,
`jam_masuk_sabtu_toleransi`  time NULL DEFAULT NULL ,
`jam_pulang_sabtu_toleransi`  time NULL DEFAULT NULL ,
`jam_masuk_minggu`  time NULL DEFAULT NULL ,
`jam_pulang_minggu`  time NULL DEFAULT NULL ,
`jam_masuk_minggu_toleransi`  time NULL DEFAULT NULL ,
`jam_pulang_minggu_toleransi`  time NULL DEFAULT NULL ,
PRIMARY KEY (`id_jam_kerja`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='desain dari naskah'
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of jam_kerja
-- ----------------------------
BEGIN;
INSERT INTO `jam_kerja` VALUES ('2', 'Jam Kerja Dosen', '08:00:00', '16:00:00', null, null, '08:00:00', '16:00:00', null, null, '08:00:00', '16:00:00', null, null, '08:00:00', '16:00:00', null, null, '08:00:00', '16:00:00', null, null, '00:00:00', '00:00:00', null, null, '00:00:00', '00:00:00', null, null);
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
`id_menu`  int(11) NOT NULL AUTO_INCREMENT ,
`nama_menu`  char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`link_menu`  char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`icon_menu`  char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`kode_level_menu`  char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id_menu`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
COMMENT='desain dari naskah'
AUTO_INCREMENT=11

;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES ('1', 'Menu Utama', null, null, '01'), ('2', 'Dashboard', '/dashboard', 'fa fa-home', '01.01'), ('3', 'Rekap Laporan Bulanan Per Unit', '/rekap_laporan_bulanan_perunit', 'fa fa-file-text-o', '01.02'), ('4', 'Rekap Laporan Bulanan Per Pegawai', '/rekap_laporan_bulanan_perpegawai', 'fa fa-file-o', '01.03'), ('5', 'Menu Admin', null, null, '02'), ('6', 'Referensi Unit', '/referensi_unit', 'fa fa-university', '02.01'), ('7', 'Data Pegawai', '/data_pegawai', 'fa fa-users', '02.02'), ('8', 'Setting Pengguna', '/setting_pengguna', 'fa fa-user', '02.03'), ('9', 'Setting Menu', '/setting_menu', 'fa fa-list-alt', '02.04'), ('10', 'Setting Role', '/setting_role', 'fa fa-key', '02.05');
COMMIT;

-- ----------------------------
-- Table structure for pegawai
-- ----------------------------
DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai` (
`id_pegawai`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`id_unit`  int(11) NULL DEFAULT NULL ,
`id_fakultas`  int(11) NULL DEFAULT NULL ,
`id_program_studi`  int(11) NULL DEFAULT NULL ,
`pin_finger`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`nis_pegawai`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`nama_pegawai`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`jabatan_pegawai`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status_aktif`  int(11) NULL DEFAULT 1 ,
PRIMARY KEY (`id_pegawai`),
INDEX `idx_id_pegawai` (`id_pegawai`) USING BTREE ,
INDEX `idx_id_unit` (`id_unit`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='desain dari naskah'
AUTO_INCREMENT=364

;

-- ----------------------------
-- Records of pegawai
-- ----------------------------
BEGIN;
INSERT INTO `pegawai` VALUES ('1', '1', null, null, null, null, 'Citra Murti Anggraini, S.Pd', null, '1'), ('2', '1', null, null, null, '197001282014101001', 'Sru Hardoyo, A.Md.', null, '1'), ('3', '1', null, null, null, null, 'Nur Fatimah', null, '1'), ('4', '1', null, null, null, null, 'Rahmad Nurcahya, A.Md.Kom', null, '1'), ('5', '1', null, null, null, null, 'RA Hastin Kusumaningrum, A.Md.Sek', null, '0'), ('6', '1', null, null, null, null, 'Rizky Amanda Rachman, A.Md', null, '1'), ('7', '2', null, null, null, '196512101992082002', 'Dra. Muryani', null, '1'), ('8', '2', null, null, null, null, 'Setiawan Eko P., S.Kh.', null, '1'), ('9', '2', null, null, null, null, 'Mirwan Hanafi, S.E', null, '1'), ('10', '2', null, null, null, null, 'Anis Khoirin Nisa, A.Md.Ak', null, '1'), ('11', '3', null, null, null, '196506031988081001', 'Dra. Juliana Widarjanti', null, '1'), ('12', '3', null, null, null, null, 'Anom Wijono, ST.', null, '1'), ('13', '3', null, null, null, null, 'Suramin, S.Pd.', null, '1'), ('14', '3', null, null, null, null, 'Krisnayang Vertika, S.Pd', null, '1'), ('15', '3', null, null, null, '196901171993082004', 'Melan Tri Prasetya, S.Kom', null, '1'), ('16', '3', null, null, '190115', null, 'Rony Hanif Warayang, S.Hut', null, '1'), ('17', '3', null, null, null, '197002231998051003', 'Febri Aji Wisnulaksito, S.Kom', null, '1'), ('18', '4', null, null, null, '198311202014101002', 'Atmuji Handoko', null, '1'), ('19', '4', null, null, null, '197406202017101003', 'Sugiharto, S.Pd.', null, '1'), ('20', '4', null, null, null, null, 'Eri Kriswanto', null, '1'), ('21', '4', null, null, null, '196602271992082003', 'Sudari', null, '1'), ('22', '4', null, null, null, '196309141998051002', 'Suparno', null, '1'), ('23', '4', null, null, null, null, 'Ngatinem, S.Pd.', null, '1'), ('24', '4', null, null, null, '197307022007101002', 'Paijan', null, '1'), ('25', '4', null, null, null, null, 'Wahyu Setiawan', null, '1'), ('26', '4', null, null, null, null, 'Agust. Suharwanto, M.Pd.', null, '1'), ('27', '4', null, null, null, null, 'Jono', null, '1'), ('28', '4', null, null, null, '196105252005051001', 'Ariadi Setya Wijaya, A.Md', null, '1'), ('29', '4', null, null, null, '196906032017102001', 'Rakhmat Wahyudi, S.Pd.T', null, '0'), ('30', '5', null, null, null, null, 'Musbadi', null, '1'), ('31', '5', null, null, null, null, 'Suraji', null, '1'), ('32', '5', null, null, null, null, 'Eko Dwi Purnomo', null, '0'), ('33', '5', null, null, null, null, 'Sumirang Jati Caroko', null, '1'), ('34', '5', null, null, null, null, 'Rahmat Dion', null, '1'), ('35', '5', null, null, null, null, 'Dalud Purnomo', null, '1'), ('36', '5', null, null, null, null, 'Sukamto', null, '1'), ('37', '5', null, null, null, null, 'Tumiran', null, '1'), ('38', '5', null, null, null, null, 'Darobi', null, '1'), ('39', '5', null, null, null, null, 'David', null, '1'), ('40', '5', null, null, null, null, 'Totok Supriyadi', null, '1'), ('41', '6', null, null, null, null, 'Hasan Muji Santoso', null, '1'), ('42', '6', null, null, null, null, 'Karyadi', null, '0'), ('43', '7', null, null, null, null, 'Supardiyono', null, '0'), ('44', '8', null, null, null, null, 'Cerry Reggiani Catri S.Si', null, '1'), ('45', '9', null, null, null, null, 'Adi Prasetyo, S.Kom.', null, '1'), ('46', '10', null, null, null, null, 'Drs. Eko Asihanto', null, '1'), ('47', '11', null, null, null, null, 'Fajar Ampi Dyantoro, S.Kom', null, '1'), ('48', '12', null, null, null, null, 'Danang Hanjaru, S.Pd', null, '1'), ('49', '13', null, null, null, null, 'Ida Setiani', null, '1'), ('50', '13', null, null, null, null, 'Tias Anggraheni', null, '1'), ('51', '13', null, null, null, null, 'Rismawati Artafasara, S.Pd', null, '1'), ('52', '13', null, null, null, null, 'Fitria Ratnasari', null, '1'), ('53', '13', null, null, null, null, 'Dwi Wulandari, S.Ak', null, '1'), ('54', '13', null, null, null, null, 'Ita Sari, S.Pd', null, '1'), ('55', '13', null, null, null, null, 'Nella Merita Kumalasari, S.Pd', null, '1'), ('56', '13', null, null, null, null, 'Naura Syauqina Firdausa', null, '1'), ('57', '13', null, null, null, null, 'Tyas Ayu Wahyu Ningsih', null, '1'), ('58', '62', null, null, '141119', '141119', 'Yunia Afiyati', null, '1'), ('59', '13', null, null, null, null, 'Pungki Revianti', null, '0'), ('60', '13', null, null, null, null, 'Khamidah', null, '1'), ('61', '13', null, null, null, null, 'Dhita Murti Santari', null, '1'), ('62', '13', null, null, null, null, 'Puspa Tikka Lovianti', null, '1'), ('63', '13', null, null, null, null, 'Athalia Fawwaz Agianto', null, '1'), ('64', '13', null, null, null, null, 'M. Riyan Prastya', null, '1'), ('65', '13', null, null, null, null, 'Yulina Dwi', null, '1'), ('66', '13', null, null, null, null, 'Indri Widyastuti', null, '1'), ('67', '13', null, null, null, null, 'Luthfi Nabila', null, '1'), ('68', '13', null, null, null, null, 'Eka Cahyati Putri', null, '1'), ('69', '14', null, null, null, null, 'Sukirman ', null, '1'), ('70', '15', null, null, null, null, 'Nofi Rini Dyah S, S.Pd', null, '1'), ('71', '16', null, null, null, null, 'Drs. Sarjiman', null, '1'), ('72', '17', null, null, null, null, 'Supardi, ST.', null, '1'), ('73', '18', null, null, null, '196905202018061001', 'Drs. Subur Mulyono', null, '1'), ('74', '18', null, null, null, '197511132017101005', 'Wastono', null, '1'), ('75', '18', null, null, null, '196807172014101006', 'Abdullah', null, '1'), ('76', '18', null, null, null, null, 'Eko Pratamasiwi', null, '1'), ('77', '18', null, null, null, '196201121993081006', 'Jumadi', null, '1'), ('78', '18', null, null, null, null, 'Sujiono, SS.', null, '1'), ('79', '18', null, null, null, null, 'Sugeng Haryadi', null, '1'), ('80', '18', null, null, null, null, 'Triyanto, S.Pd', null, '1'), ('81', '18', null, null, null, null, 'Djulianto', null, '1'), ('82', '18', null, null, null, null, 'Sarino', null, '1'), ('83', '19', null, null, null, null, 'Septi Ari Wahyuni', null, '1'), ('84', '19', null, null, null, null, 'Mohammat Syamsul Hidayat', null, '1'), ('85', '19', null, null, null, null, 'Mitun Nur Laksono', null, '1'), ('86', '19', null, null, null, null, 'Fany Jaka Susila', null, '0'), ('87', '19', null, null, null, null, 'Eko Supriyono', null, '1'), ('88', '19', null, null, null, null, 'Ade', null, '0'), ('89', '19', null, null, null, null, 'Heru Purnomo', null, '1'), ('90', '19', null, null, null, null, 'Ariyo Swandoko', null, '1'), ('91', '19', null, null, null, null, 'Kurnia Ayus Munandar', null, '1'), ('92', '19', null, null, null, null, 'Tri Wahyuni', null, '1'), ('93', '19', null, null, null, null, 'Imam Chusairi', null, '1'), ('94', '19', null, null, null, null, 'Bima', null, '1'), ('95', '20', null, null, null, null, 'Sukirdi', null, '0'), ('96', '20', null, null, null, null, 'Anggoro', null, '0'), ('97', '21', null, null, null, null, 'Samijo', null, '1'), ('98', '21', null, null, null, null, 'Danur', null, '1'), ('99', '21', null, null, null, null, 'Fatturrohman', null, '1'), ('100', '21', null, null, null, null, 'Danang Prijantoro', null, '1');
INSERT INTO `pegawai` VALUES ('101', '21', null, null, null, null, 'Ngadiman', null, '1'), ('102', '22', null, null, null, null, 'Eka Nugraha Sari, S.Kom', null, '1'), ('103', '22', null, null, null, null, 'Muhari Agus Nugraha, S.Kom', null, '1'), ('104', '23', null, null, null, '196711261993032002', 'Dra. Tri Siwi Nugrahani, S.E., M.Si.', null, '1'), ('105', '23', null, null, null, '197408142006071001', 'Dr. Dekeng Setyo Budiarto, Ak.CA.', null, '1'), ('106', '23', null, null, null, '197802012006071004', 'Sri Widodo, S.E.,M.Sc', null, '1'), ('107', '23', null, null, null, '197603072002041002', 'Sukhemi, M.Sc.', null, '1'), ('108', '23', null, null, null, '197804292004042001', 'Vidya Vitta Adhivinna., SE., M.Si.Ak', null, '1'), ('109', '23', null, null, null, '196202211995031004', 'Hari Purnama, S.E., M.M.', null, '1'), ('110', '23', null, null, null, '198808072014042007', 'Ratna Purnama Sari, S.E., M.Si', null, '1'), ('111', '23', null, null, null, '198601142015082000', 'Rani Eka Diansari, S.E., M.Acc', null, '1'), ('112', '23', null, null, null, '198501082015082006', 'Yennisa, S.E., M.Sc.Ak.CA', null, '1'), ('113', '23', null, null, null, '199003242016041013', 'M. Sulkhanul Umam, S.E., M.Si', null, '1'), ('114', '23', null, null, null, '199309162018052013', 'Ningrum Pramudiati, S.E., M.Si', null, '1'), ('115', '23', null, null, null, '199205232018052025', 'Anandita Zulia Putri, S.E., M.Acc', null, '1'), ('116', '23', null, null, null, '199311042018062026', 'Lulu Amalia Nusron, S.E., M.Ak', null, '1'), ('117', '23', null, null, null, null, 'Zidni Husnia Fachrunnisa, S.E., M.Ak.', null, '1'), ('118', '23', null, null, null, null, 'Baniady Gennody Pronosokodewo, S.E., M.Si.', null, '1'), ('119', '23', null, null, null, null, 'Rahandhika Ivan Adyaksana, S.E., M.Si', null, '1'), ('120', '24', null, null, null, null, 'Margi Untungningsih', null, '0'), ('121', '25', null, null, null, '197406202008041005', 'Iswati', null, '1'), ('122', '27', null, null, null, null, 'Suntoro, S.Pd.', null, '1'), ('123', '27', null, null, null, null, 'Yanning Adhiyanti, S.P', null, '1'), ('124', '27', null, null, null, '197205102016102001', 'Riezki Desiana Nur Pramono, A.Md.Sek', null, '1'), ('125', '28', null, null, null, '196905011993081005', 'Lita Yuniatri, A.Md.', null, '1'), ('126', '29', null, null, null, '198611232014102004', 'Sri Nurhayati, S.Pd', null, '1'), ('127', '30', null, null, null, '196404101988081001', 'Sumardi, S.Pd.', null, '1'), ('128', '31', null, null, null, '196507121988081003', 'Novita Setyaningsih, S.Pd', null, '1'), ('129', '32', null, null, null, '196006092005052002', 'Waginah, S.Pd.', null, '1'), ('130', '33', null, null, null, '196901171993102003', 'Endah Rini Astuti, MPd.', null, '1'), ('131', '34', null, null, null, null, 'Samsudin, S.Pd.', null, '1'), ('132', '35', null, null, null, '197511082014102003', 'Upik Kuswardhani', null, '1'), ('133', '36', null, null, null, null, 'Yuli Ibnu Darsana, S.Pd., M.A', null, '1'), ('134', '36', null, null, null, '196607271996011001', 'Fitri Riani, A.Md', null, '1'), ('135', '36', null, null, null, '196401011998051004', 'Munir Nugroho, SIP', null, '1'), ('136', '36', null, null, null, '196411062017101002', 'Nurul Sinto A., SIP', null, '1'), ('137', '37', null, null, null, '197410072017101004', 'Pepen Suherman, S.Kom.', null, '1'), ('138', '37', null, null, null, '196912052014101007', 'Friya Fratama Bekti Susanto, S.Kom', null, '1'), ('139', '37', null, null, null, null, 'Edy Purwanto, S.Kom', null, '1'), ('140', '37', null, null, null, '197509142014101005', 'Dian Fitri Utami, A.Md', null, '1'), ('141', '38', null, null, null, null, 'Restu Dwi Nugraeni, S.Pd.', null, '1'), ('142', '38', null, null, null, '196807141993082003', 'Suradi', null, '1'), ('143', '38', null, null, null, null, 'Agus Suparyanto', null, '1'), ('144', '39', null, null, null, '197110091998122005', 'Dr. Okti  Purwaningsih, MP.', null, '1'), ('145', '39', null, null, null, '195405261985031002', 'Ir. Herman Budi Susetyo, MP.', null, '0'), ('146', '39', null, null, null, '196503211996041003', 'Drs. M. Kusberyunadi, M.MA', null, '0'), ('147', '39', null, null, null, '196309171995031002', 'Ir. Ahmad Bahrum, M.P.', null, '0'), ('148', '39', null, null, null, '196403141995031005', 'Ir. Ardiyanto, M.Sc.', null, '1'), ('149', '39', null, null, null, '196509161995031003', 'Dr. Ir. Paiman, M.P.', null, '1'), ('150', '39', null, null, null, '197511162005012002', 'C. Tri Kusumastuti, S.P., M.Sc.', null, '1'), ('151', '39', null, null, null, null, 'Puguh Bintang Pamungkas, M.P', null, '1'), ('152', '39', null, null, null, null, 'Prof. Dr. Ir. Prapto Yudhono, M.Sc', null, '1'), ('153', '40', null, null, null, '196711261993032002', 'Dra. Tri Siwi Nugrahani, S.E., M.Si.', null, '1'), ('154', '40', null, null, null, '197408142006071001', 'Dr. Dekeng Setyo Budiarto, Ak.CA.', null, '1'), ('155', '40', null, null, null, '197802012006071004', 'Sri Widodo, S.E.,M.Sc', null, '1'), ('156', '40', null, null, null, '197603072002041002', 'Sukhemi, M.Sc.', null, '1'), ('157', '40', null, null, null, '197804292004042001', 'Vidya Vitta Adhivinna., SE., M.Si.Ak', null, '1'), ('158', '40', null, null, null, '196202211995031004', 'Hari Purnama, S.E., M.M.', null, '1'), ('159', '40', null, null, null, '198808072014042007', 'Ratna Purnama Sari, S.E., M.Si', null, '1'), ('160', '40', null, null, null, '198601142015082000', 'Rani Eka Diansari, S.E., M.Acc', null, '1'), ('161', '40', null, null, null, '198501082015082006', 'Yennisa, S.E., M.Sc.Ak.CA', null, '1'), ('162', '40', null, null, null, '199003242016041013', 'M. Sulkhanul Umam, S.E., M.Si', null, '1'), ('163', '40', null, null, null, '199309162018052013', 'Ningrum Pramudiati, S.E., M.Si', null, '1'), ('164', '40', null, null, null, '199205232018052025', 'Anandita Zulia Putri, S.E., M.Acc', null, '1'), ('165', '40', null, null, null, '199311042018062026', 'Lulu Amalia Nusron, S.E., M.Ak', null, '1'), ('166', '40', null, null, null, null, 'Zidni Husnia Fachrunnisa, S.E., M.Ak.', null, '1'), ('167', '40', null, null, null, null, 'Baniady Gennody Pronosokodewo, S.E., M.Si.', null, '1'), ('168', '40', null, null, null, null, 'Rahandhika Ivan Adyaksana, S.E., M.Si', null, '1'), ('169', '41', null, null, null, '196012121987032002', 'Dra. Ika Ernawati, M.Pd.', null, '1'), ('170', '41', null, null, null, '195207051982111002', 'Drs. Djuwalman, M.Pd.', null, '1'), ('171', '41', null, null, null, '195911071987031002', 'Drs. Makin, M.Pd', null, '1'), ('172', '41', null, null, null, '197110282010042003', 'Enik Nur Kholidah, S.E., M.A.', null, '1'), ('173', '41', null, null, null, '198411292013022001', 'Arum Setiowati, S.Pd., M.Pd.', null, '1'), ('174', '41', null, null, null, '195703101985032001', 'Dra. Hj. Nurwahyumiani, M.A', null, '1'), ('175', '41', null, null, null, '195411091981032001', 'Dra. Suharni, M.Pd.', null, '1'), ('176', '41', null, null, null, '199011242016041018', 'Drajat Edy Kurniawan, S.Pd., M.Pd', null, '1'), ('177', '41', null, null, null, '198812172016082000', 'Shinta Purwaningrum, S.Pd., M.Pd', null, '1'), ('178', '41', null, null, null, '198609022016041014', 'Taufik Agung Pranowo, S.Pd., M.Pd', null, '1'), ('179', '41', null, null, null, '198703232014041001', 'Eko Perianto, S.Pd., M.Si', null, '1'), ('180', '41', null, null, null, '198812092014042002', 'Iis Latifah Nuryanto, S.Pd., M.Pd', null, '1'), ('181', '41', null, null, null, '199403202018052008', 'Herwinda Putri Daniswari, S.Pd.,M.Pd', null, '1'), ('182', '42', null, null, null, null, 'Amalia Cemara Nur’aidha, S.Si., M.Si', null, '1'), ('183', '42', null, null, null, '198801052016101002', 'Dhananjaya Yama Hudha, S.T, M. Biotech ', null, '1'), ('184', '42', null, null, null, null, 'dr. R. Bopi Yudha Sapa, M.Sc., MMR', null, '1'), ('185', '42', null, null, null, null, 'Wahyu Sugianto, S.Si., M.Si', null, '1'), ('186', '42', null, null, null, null, 'Mira Setiana, S.Si., M.Si', null, '1'), ('187', '43', null, null, null, null, 'Ekha Rifki Fauzi, SKM, M.P.H', null, '1'), ('188', '43', null, null, null, null, 'Danang Widyawarman, S.ST, M.Sc', null, '1'), ('189', '43', null, null, null, null, 'Dena Anugrah, S.Pd, M.Pd.', null, '1'), ('190', '43', null, null, null, null, 'Pebri Prihatmoko, S.Pd., M.Eng', null, '1'), ('191', '43', null, null, null, null, 'Herenda Sela Wismaya, S.Si., M.Si', null, '1'), ('192', '44', null, null, null, null, 'Apt. Rahmat A.Hi Wahid, S.Farm., M.Farm', null, '1'), ('193', '44', null, null, null, null, 'Apt. Margala Juang Bertorio, S.Farm., M.Clin.Pharm', null, '1'), ('194', '44', null, null, null, null, 'Nurul Jannah., S.Farm., M.Pharm.Sci., Apt', null, '1'), ('195', '44', null, null, null, null, 'Anis Febri Nilansari, S.Farm., M.Pharm.Sci., Apt', null, '1'), ('196', '44', null, null, null, null, 'Hanifah Karimatulhajj, S.Farm., M.Farm', null, '1'), ('197', '45', null, null, null, null, 'Brevi Istu Pambudi, S.Gz., M.Gizi.', null, '1'), ('198', '45', null, null, null, null, 'Laeli Nur Hasanah, S. Gz., M.Si.', null, '1'), ('199', '45', null, null, null, null, 'Astri Praba Shinta, S.Gz., M.P.H', null, '1'), ('200', '45', null, null, null, null, 'Rosmauli Jeremia, S.Gz., M.Gizi', null, '1');
INSERT INTO `pegawai` VALUES ('201', '45', null, null, null, null, 'Ryan Rohmansyah, S.Gz., M.Gz', null, '1'), ('202', '46', null, null, null, '198207212014042006', 'Fitri Susilowati, S.E., M.Sc', null, '1'), ('203', '46', null, null, null, '195309211981032001', 'Dra. Murti Sumarni, MM.', null, '1'), ('204', '46', null, null, null, '195901061985032007', 'Dra. Yati Suhartini, MA.', null, '1'), ('205', '46', null, null, null, '196102131987031001', 'Drs. Arif Sudaryana, M.Si.', null, '1'), ('206', '46', null, null, null, '195806071995032001', 'Dra. Endang Tri Wahyuni, MM.', null, '1'), ('207', '46', null, null, null, '196707292002041003', 'Lilik Siswanto, S.E, M.M', null, '0'), ('208', '46', null, null, null, '198310292015082000', 'Arista Natia Afriany, S.E, M.BA', null, '1'), ('209', '46', null, null, null, '198707242015081000', 'Ahsan Sumantika, S.E, M.Sc', null, '1'), ('210', '46', null, null, null, '198608272015081000', 'Adhi Prakosa,S.E. M.Sc', null, '1'), ('211', '46', null, null, null, '199010172016041009', 'Faizal Ardiyanto, S.E., M.M', null, '1'), ('212', '46', null, null, null, '197310221997102001', 'Saptaningsih Sumarmi, S.E., M.M', null, '1'), ('213', '46', null, null, null, '198911102018051003', 'Anindita Imam Basri, S.E.I.,M.M', null, '1'), ('214', '46', null, null, null, '198712172018052012', 'Natalia Ratna Ningrum, S.E.,M.M', null, '1'), ('215', '46', null, null, null, '197406062018052005', 'Diah Aryanti Saptowarsi, S.E.,M.Sc', null, '0'), ('216', '46', null, null, null, '196909102018052009', 'Inayat Hanum Indriati,S.E., M.M', null, '1'), ('217', '46', null, null, null, null, 'Pradita Nindya Aryandha, S.E., M.B.A', null, '1'), ('218', '46', null, null, null, null, 'Hapsari Dyah Herdiany, S.E., M.M', null, '1'), ('219', '46', null, null, null, null, 'Latifah Putranti, S.E., M.Sc', null, '1'), ('220', '46', null, null, null, null, 'Fikri Farhan, S.E., M.Sc', null, '1'), ('221', '46', null, null, null, null, 'Guruh Ghifar Zalzalah, S.E., M.Sc', null, '1'), ('222', '47', null, null, null, '198704212013102004', 'Primasari Wahyuni, S.Pd., M.Pd.', null, '1'), ('223', '47', null, null, null, '197607112013102002', 'Muncar Tyas Palupi, S.S., M.Hum.', null, '1'), ('224', '47', null, null, null, '197908182013102001', 'Rika Novita Kusumaningrum, S.S., M.A.', null, '1'), ('225', '47', null, null, null, '197101152013102003', 'Tri Ratna Herawati, S.Pd., M.Hum.', null, '1'), ('226', '47', null, null, null, '198406012014042005', 'Fitri Jamilah, S.Pd., M.Pd', null, '1'), ('227', '47', null, null, null, '198210202014042004', 'Nina Widyaningsih, S.Pd., M.Hum', null, '1'), ('228', '47', null, null, null, '199301132018051024', 'Yanuar Bagas Arwansyah, S.Pd., M.Pd', null, '1'), ('229', '47', null, null, null, '199209062019011007', 'Jalu Norva Illa Putra, S.S., M.A.', null, '1'), ('230', '48', null, null, null, '198306092013101002', 'Sujatmiko, S.Pd.Ing., M.Hum.', null, '1'), ('231', '48', null, null, null, '197803162013102004', 'Nafisah Endahati, S.Pd., M.Hum', null, '1'), ('232', '48', null, null, null, '197906132014012001', 'Sri Wiyanah, S.Pd., M.Hum.', null, '1'), ('233', '48', null, null, null, '198501022013101001', 'Rudha Widagsa, S.S., M.A.', null, '1'), ('234', '48', null, null, null, '198704042014021000', 'Juang Kurniawan S, S.Pd., M.Pd.B.I', null, '1'), ('235', '48', null, null, null, '198604212014041003', 'Andi Dian Rahmawan, S.Pd., M.A', null, '1'), ('236', '48', null, null, null, '199210232018051018', 'Rifki Irawan, S.Pd., M.Pd', null, '1'), ('237', '49', null, null, null, '196208161987022001', 'Dra. Kristina Warniasih, M.Pd.', null, '1'), ('238', '49', null, null, null, '196205161988032001', 'Dra. MM. Endang Susetyawati, M.Pd.', null, '1'), ('239', '49', null, null, null, '198206112011041001', 'Abdul Aziz Saefudin, S.Pd.I.,M.Pd.', null, '1'), ('240', '49', null, null, null, '198704262011042004', 'Dhian Arista Istikomah, S.Si., M.Sc.', null, '1'), ('241', '49', null, null, null, '198407042010041004', 'Gunawan, S.Si., M.Pd', null, '1'), ('242', '49', null, null, null, '198412222011042003', 'Laela Sagita, S.Pd., M.Sc.', null, '1'), ('243', '49', null, null, null, '198310302010041001', 'Nendra Mursetya S D, S.Pd., M.Sc', null, '1'), ('244', '62', '2', '4', '11074', '198404222009042002', 'Dr. Niken Wahyu Utami, S.Pd.Si., M.Pd.', null, '1'), ('245', '49', null, null, null, '198612062012012033', 'Koryna Aviori, S.Si., M.Pd.', null, '1'), ('246', '49', null, null, null, '197809232014012000', 'Siska Candra Ningsih, S.Si., M.Sc.', null, '1'), ('247', '49', null, null, null, '198004122014082000', 'Titis Sunanti, S.Pd., M.Si.', null, '1'), ('248', '49', null, null, null, '198906152015082010', 'Palupi Sri Wijayanti, S.Pd., M.Pd', null, '1'), ('249', '49', null, null, null, '198904172015081012', 'Padrul Jana, S.Pd., M.Sc', null, '1'), ('250', '49', null, null, null, '198612252015081000', 'Kintoko, S.Pd., M.Pd', null, '1'), ('251', '49', null, null, null, '198901232014041014', 'Bintang Wicaksono, S.Pd., M.Pd', null, '1'), ('252', '49', null, null, null, '197612242005012002', 'Ch. Eva Nuryani, S.Si., M.Sc', null, '1'), ('253', '50', null, null, null, '196812171994121001', 'Tri Wahana, S.Pd., M.Pd.', null, '1'), ('254', '50', null, null, null, '196711051994121002', 'Darsono, S.Pd., M.Pd.', null, '1'), ('255', '50', null, null, null, '196502161991091004', 'Drs. Siswanta, M.Pd', null, '1'), ('256', '50', null, null, null, '195107011989071001', 'Drs. Johanes Sabari, M.Si.', null, '1'), ('257', '50', null, null, null, '198802102014041009', 'Dr. Muhammad Iqbal Birsyada, S.Pd., M.Pd', null, '1'), ('258', '50', null, null, null, null, 'Bayu Ananto Wibowo, S.Pd., M.Pd.', null, '1'), ('259', '50', null, null, null, null, 'Fahruddin, S.Pd., M.Pd.', null, '1'), ('260', '51', null, null, null, '195707131983031003', 'Dr. Sukadari, SE., SH.,MM.', null, '1'), ('261', '51', null, null, null, '195704251984031002', 'Prof. Dr. Buchory MS, M.Pd.', null, '0'), ('262', '51', null, null, null, '196128121987022001', 'Dr. Salamah, M.Pd.', null, '1'), ('263', '51', null, null, null, '195402281980122001', 'Dr. Sunarti, M.Pd.', null, '1'), ('264', '51', null, null, null, null, 'Prof. Dr. Kodiran, MA', null, '1'), ('265', '51', null, null, null, null, 'Prof. Dr. DJoko Suryo', null, '1'), ('266', '51', null, null, null, '197611142005011001', 'Dr.Victor Novianto, S.Pd., M.Hum', null, '1'), ('267', '51', null, null, null, '196509091995122001', 'Dr. Esti Setiawati, M.Pd', null, '1'), ('268', '51', null, null, null, '195606132017041001', 'Dr. Drs. Tarto, S.T., M.Pd', null, '1'), ('269', '51', null, null, null, '196707191996101004', 'Dr. Gunawan Sridiyatmiko, M.Pd.', null, '1'), ('270', '51', null, null, null, '197711272014042008', 'Dr. Elsa Putri Ermisah Syafril', null, '1'), ('271', '52', null, null, null, '199203092018051011', 'Luqman Hidayat, S.Pd.,M.Pd', null, '1'), ('272', '52', null, null, null, '199010212016051002', 'Faiz Noormiyanto, S.Pd., M.Pd', null, '1'), ('273', '52', null, null, null, '199008042016052001', 'Dwi Setianingsih, M.Pd', null, '1'), ('274', '52', null, null, null, '198407262016082002', 'Yulian Agus Suminar, S.Pd., M.Pd', null, '1'), ('275', '52', null, null, null, null, 'Dwi Putri Fatmawati, S.Pd., M.Pd', null, '1'), ('276', '52', null, null, null, null, 'Ramdhan Harjana, S.Pd., M.Pd', null, '1'), ('277', '53', null, null, null, '198811182018052014', 'Novianti Retno Utami, S.Pd., M.Pd', null, '1'), ('278', '53', null, null, null, '199211032018052010', 'Khikmah Novitasari, S.Pd., M.Pd', null, '1'), ('279', '53', null, null, null, '198203142018051007', 'Herdi Handoko, S.Pd., M.Pd', null, '1'), ('280', '53', null, null, null, '198609222018051002', 'Syahria Anggita Sakti, S.Pd., M.Pd', null, '1'), ('281', '53', null, null, null, '196411232018052019', 'Titik Mulat Widyastuti, S.Pd., M.Pd', null, '1'), ('282', '53', null, null, null, null, 'Windi Wulandari Iman Utama, S.Pd., M.Pd', null, '1'), ('283', '54', null, null, null, '195607131981012001', 'Rosalia Susila Purwanti, S.Sn., M.Pd.', null, '1'), ('284', '54', null, null, null, '198508112008042001', 'Budiharti, S.Si., M.Pd.', null, '1'), ('285', '54', null, null, null, '198603032008042002', 'Deri Anggraini, S.Pd., M.Pd.', null, '1'), ('286', '54', null, null, null, '198002152008042004', 'Dr. Dhiniaty Gularso, S.Si., M.Pd.', null, '1'), ('287', '54', null, null, null, '196909162002042001', 'Dr. Siti Maisaroh, SE., M.Pd.', null, '1'), ('288', '54', null, null, null, '198405112008042003', 'Wahyu Kurniawati, S.Si., M.Pd.', null, '1'), ('289', '54', null, null, null, '198612272012011001', 'Dr. Setyo Eko Atmojo, S.Pd., M.Pd.', null, '1'), ('290', '54', null, null, null, '198707232013022002', 'Selly Rahmawati, S.Pd., M.Pd.', null, '1'), ('291', '54', null, null, null, '198405102013021006', 'Dr. Ahmad Agung Yuwono, S.E., S.Pd., M.Pd.', null, '1'), ('292', '54', null, null, null, '198611052013021005', 'Ari Wibowo, S.Pd., M.Pd', null, '1'), ('293', '54', null, null, null, '197905052014042011', 'Rina Dyah Rahmawati, S.Si., M.Pd', null, '1'), ('294', '54', null, null, null, '198808232014041012', 'Taufik Muhtarom, S.Pd., M.Pd', null, '1'), ('295', '54', null, null, null, '198512312014041013', 'Danuri, S.Pd.Si., M.Pd', null, '1'), ('296', '54', null, null, null, '199009302015082000', 'Mahilda Dea Komalasari, S.Pd., M.Pd', null, '1'), ('297', '54', null, null, null, '198606232015081000', 'Hermawan Wahyu Setiadi, S.Pd., M.Pd', null, '1'), ('298', '54', null, null, null, '198810182015081003', 'Hengki Yudha Barnaba, S.Pd., M.Pd', null, '1'), ('299', '54', null, null, null, '199004022016041006', 'Bahtiyar Heru Susanto, S.Pd., M.Pd', null, '1'), ('300', '54', null, null, null, '198911172016041007', 'Beny Dwi Lukitoaji, S.Pd., M.Pd', null, '1');
INSERT INTO `pegawai` VALUES ('301', '54', null, null, null, '199006062018051021', 'Urip Muhayat Wiji Wahyudi, S.Pd., M.Pd', null, '1'), ('302', '54', null, null, null, '199201302018051016', 'Rian Nurizka, S.Pd., M.Pd', null, '1'), ('303', '54', null, null, null, null, 'Dr. Amanatie, M.Pd., M.Si', null, '1'), ('304', '54', null, null, null, null, 'Dr. Ganung Anggraeni', null, '1'), ('305', '54', null, null, null, '199102052016061002', 'Arip Febrianto, S.Pd., M.Pd.I', null, '1'), ('306', '54', null, null, null, null, 'Hadna Suryantari, S.Pd, M.Pd.', null, '1'), ('307', '54', null, null, null, null, 'Henry Aditia Rigianti, S.Pd, M.Pd.', null, '1'), ('308', '54', null, null, null, null, 'Heru Purnomo, M.Pd', null, '1'), ('309', '54', null, null, null, null, 'Puguh Ardianto Iskandar, S.Pd., M.Pd', null, '1'), ('310', '54', null, null, null, null, 'Muhardila Fauziah, S.Pd.I., M.Pd', null, '1'), ('311', '54', null, null, null, null, 'Yogi Prihandoko, S.Pd., M.Pd', null, '1'), ('312', '55', null, null, null, '196511101992021001', 'Sigit Handoko S.H., MH.', null, '1'), ('313', '55', null, null, null, '196903071993012001', 'Ari Retno Purwanti, SH., MH.', null, '1'), ('314', '62', '17', '4', '241119', '197304112010041002', 'Supri Hartanto, S.Pd., M.Pd.', null, '1'), ('315', '55', null, null, null, '195907161987022001', 'Dra. Rosalia Indriyati Saptatiningsih, M.Si', null, '1'), ('316', '55', null, null, null, '195403211980031001', 'Yitno Pringgowijoyo, SH., M.H', null, '1'), ('317', '55', null, null, null, '196509051992121006', 'Armansyah Prasakti, SH, Sp.N, M.H', null, '1'), ('318', '55', null, null, null, '198709112014041010', 'Dr. Septian Aji Permana, S.Pd., M.Pd', null, '1'), ('319', '55', null, null, null, '198709092018051001', 'Abdul Rahim, S.Pd., M.Pd', null, '1'), ('320', '55', null, null, null, null, 'T. Heru Nurgiansah, S.Pd., M.Pd', null, '1'), ('321', '56', null, null, null, null, 'Didik Rohmantoro, S.Pd, M.Pd.', null, '1'), ('322', '56', null, null, null, null, 'Bayu Gilang Purnomo, S.Pd, M.Pd.', null, '1'), ('323', '56', null, null, null, null, 'Muhammad Priya Permana, S.Pd, M.Pd.', null, '1'), ('324', '56', null, null, null, null, 'Ir. Yulia Venti Yoanita,ST, M.Eng.', null, '1'), ('325', '56', null, null, null, null, 'Muhamad Amiruddin, S.Pd, M.Pd.', null, '1'), ('326', '57', null, null, null, null, 'Aldrin Febriansyah, ST., M.Sc.', null, '1'), ('327', '57', null, null, null, null, 'Eka Widyaningsih, ST., M.Sc.', null, '1'), ('328', '57', null, null, null, null, 'Radiaswari, ST., M.Sc.', null, '1'), ('329', '57', null, null, null, null, 'Rachmat Wahyu Prabowo, ST., M.Eng.', null, '1'), ('330', '57', null, null, null, null, 'Adinda Rafika Dani, S.T., M.Sc', null, '1'), ('331', '58', null, null, null, '198505052016042003', 'Kurniawanti, S.T., M.Sc', null, '1'), ('332', '58', null, null, null, '198512092016042002', 'Yaning Tri Hapsari, S.T., M.Sc', null, '1'), ('333', '58', null, null, null, '198706302016042004', 'Hasti Hasanati Marfuah, S.T., M.T', null, '1'), ('334', '58', null, null, null, '198201222016101001', 'Theofilus Bayu Dwinugroho, S.T., M.Sc', null, '1'), ('335', '58', null, null, null, null, 'Guntur Samodro, S.T., M.T', null, '1'), ('336', '59', null, null, null, '196902141998121006', 'Ahmad Riyadi, S.Si., M.Kom.', null, '1'), ('337', '59', null, null, null, '197305122006071003', 'Meilany Nonsi Tentua, S.Si., MT.', null, '1'), ('338', '59', null, null, null, '197409212002041004', 'M. Fairuzabadi, S.Si., M.Kom.', null, '1'), ('339', '59', null, null, null, '197903272012012009', 'Marti Widya Sari, S.T., M.Eng', null, '1'), ('340', '59', null, null, null, '198409282015042001', 'Setia Wardani, S.Kom., M.Kom', null, '1'), ('341', '59', null, null, null, '196906072012011012', 'Wibawa, S.Si., M.Eng.', null, '1'), ('342', '59', null, null, null, '198805202015081014', 'Nurirwan Saputra, S.Kom., M.Eng', null, '1'), ('343', '59', null, null, null, '199002222016012000', 'Puji Handayani Putri, S.T., M.Kom', null, '1'), ('344', '59', null, null, null, '198412272016041000', 'Prahenusa Wahyu Ciptadi, S.T., M.T', null, '1'), ('345', '59', null, null, null, '198712052016041012', 'R. Hafid Hardyanto, S.Pd., M.Pd', null, '1'), ('346', '59', null, null, null, '198504242016041005', 'Aditya Wahana, S.Pd.T., M.Kom', null, '1'), ('347', '2', '3', '5', '0', '198401032015081000', 'Sunggito Oyama, S.Kom., M.T', '-', '1'), ('348', '59', null, null, null, '198304132018051020', 'Tri Hastono, S.Kom.,M.T', null, '1'), ('349', '59', null, null, null, '199104232018051004', 'Ari Kusuma Wardana, S.T., M.Cs', null, '1'), ('350', '59', null, null, null, '198312292018051017', 'Rianto, S.Kom., M.T', null, '1'), ('351', '59', null, null, null, '197707312018051006', 'Firdiyan Syah, S.Kom., M.Kom', null, '1'), ('352', '60', null, null, null, null, 'Lana Santika Nadia, S.T.P., M.Sc.', null, '1'), ('353', '60', null, null, null, null, 'Atika Nur Syarifah, S.TP., M.Sc.', null, '1'), ('354', '60', null, null, null, null, 'Dewi Amrih, S.T.P., M.Sc.', null, '1'), ('355', '60', null, null, null, null, 'Adi Sutakwa, S.TP., M.Sc', null, '1'), ('356', '60', null, null, null, null, 'Suharman, S.TP., M.Sc', null, '1'), ('357', null, null, null, null, null, 'Ahmad Edy Nugroho, S.Pd', null, '1'), ('358', null, null, null, null, null, 'Rahman Hasto Nugroho, S.Pd', null, '1'), ('359', null, null, null, null, null, 'Heni Nurrohmah, S.Pd', null, '1'), ('360', null, null, null, null, null, 'Asri Sudarisman', null, '1'), ('361', null, null, null, null, null, 'Wisnu Sukmo Pamungkas', null, '1'), ('362', null, null, null, null, null, 'Ferry Yulianto', null, '1'), ('363', null, null, null, null, null, 'Suparman', null, '1');
COMMIT;

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna` (
`id_pengguna`  int(11) NOT NULL AUTO_INCREMENT ,
`username`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`password`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`nama`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`id_role`  int(11) NULL DEFAULT NULL ,
`id_unit`  int(11) NULL DEFAULT NULL ,
`id_pegawai`  int(11) UNSIGNED NULL DEFAULT NULL ,
`foto`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`datetime_create`  datetime NULL DEFAULT NULL ,
`datetime_update`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`id_pengguna`),
INDEX `id_role` (`id_role`) USING BTREE ,
INDEX `id_pegawai` (`id_pegawai`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
COMMENT='desain dari naskah'
AUTO_INCREMENT=15

;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
BEGIN;
INSERT INTO `pengguna` VALUES ('1', 'admin', '$2y$10$.Fn8oY1zaoo3RZiuhBbRneNjSMNhtWO8UINoYygcw8vDV1JSBNSaS', 'Administrator SMKP', '1', null, null, 'foto_02082021040808.jpg', null, '2021-08-02 16:39:09'), ('2', 'kepegawaian', '$2y$10$.Fn8oY1zaoo3RZiuhBbRneNjSMNhtWO8UINoYygcw8vDV1JSBNSaS', 'Biro Kepegawaian', '2', '3', null, null, null, '2021-07-04 23:13:33'), ('3', 'keuangan', '$2y$10$.Fn8oY1zaoo3RZiuhBbRneNjSMNhtWO8UINoYygcw8vDV1JSBNSaS', 'Biro Keuangan', '3', null, null, null, null, '2021-07-04 23:14:46'), ('4', 'roni', '$2y$10$.Fn8oY1zaoo3RZiuhBbRneNjSMNhtWO8UINoYygcw8vDV1JSBNSaS', 'Kepala Unit Biro Kepegawaian', '5', null, '16', null, null, '2021-07-03 00:41:52'), ('12', 'cahyonadi', '$2a$04$1hnS2qu.UHDblExAwq6dSenn6ianZJya0WgpYh3UNTdexhV8WmAnK', 'Antonius Eko Cahyo N', '1', null, '0', null, null, null), ('13', 'unit_kepegawaian', '$2a$04$1hnS2qu.UHDblExAwq6dSenn6ianZJya0WgpYh3UNTdexhV8WmAnK', 'Unit Kepegawaian', '4', '3', null, null, null, '2021-07-04 23:14:10'), ('14', 'superadmin', '$2a$04$OUmbn3FYVmQuserGj4FUs.R..ZFAEx3lPOTSJybjDOBDsEz9ftJjK', 'Superadmin', '1', null, '0', null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for program_studi
-- ----------------------------
DROP TABLE IF EXISTS `program_studi`;
CREATE TABLE `program_studi` (
`id_program_studi`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`id_fakultas`  int(11) NULL DEFAULT NULL ,
`nama_program_studi`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id_program_studi`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='desain dari naskah'
AUTO_INCREMENT=23

;

-- ----------------------------
-- Records of program_studi
-- ----------------------------
BEGIN;
INSERT INTO `program_studi` VALUES ('1', '1', 'Akuntansi'), ('2', '1', 'Manajemen'), ('3', '2', 'Agroteknologi'), ('4', '2', 'Teknologi Hasil Pertanian'), ('5', '3', 'Teknik Informatika'), ('6', '3', 'Teknik Industri'), ('7', '3', 'Teknik Biomedis'), ('8', '3', 'Teknik Rekayasa Elektromedis'), ('9', '3', 'Gizi'), ('10', '3', 'Farmasi'), ('11', '3', 'Arsitektur'), ('12', '4', 'Pendidikan Guru Sekolah Dasar'), ('13', '4', 'Pendidikan Sejarah'), ('14', '4', 'Pendidikan Matematika'), ('15', '4', 'Pendidikan Bahasa Inggris'), ('16', '4', 'Pendidikan Bahasa dan Sastra Indonesia'), ('17', '4', 'Pendidikan Pancasila dan Kewarganegaraan'), ('18', '4', 'Bimbingan dan Konseling'), ('19', '4', 'Pendidikan Luar Biasa'), ('20', '4', 'Pendidikan Guru PAUD'), ('21', '4', 'Pendidikan Vokasional Teknologi Otomotif'), ('22', '5', 'Pendidikan Ilmu Pengetahuan Sosial');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
`id_role`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`nama_role`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id_role`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='desain dari naskah'
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', 'Admin'), ('2', 'Biro Kepegawaian'), ('3', 'Biro Keuangan'), ('4', 'Unit Kerja'), ('5', 'Pegawai');
COMMIT;

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
`id_role_menu`  int(11) NOT NULL AUTO_INCREMENT ,
`id_role`  int(11) NULL DEFAULT NULL ,
`id_menu`  int(11) NULL DEFAULT NULL ,
`status_aktif`  int(1) NULL DEFAULT NULL ,
PRIMARY KEY (`id_role_menu`),
INDEX `fk_role` (`id_role`) USING BTREE ,
INDEX `fk_menu` (`id_menu`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='desain dari naskah'
AUTO_INCREMENT=71

;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
BEGIN;
INSERT INTO `role_menu` VALUES ('1', '1', '1', '1'), ('2', '1', '2', '1'), ('3', '1', '3', '1'), ('4', '1', '4', '1'), ('5', '1', '5', '1'), ('6', '1', '6', '1'), ('7', '1', '7', '1'), ('8', '1', '8', '1'), ('9', '1', '9', '1'), ('10', '1', '10', '1'), ('16', '2', '1', '1'), ('17', '2', '2', '1'), ('18', '2', '3', '1'), ('19', '2', '4', '1'), ('20', '2', '5', '1'), ('21', '2', '6', '1'), ('22', '2', '7', '1'), ('23', '2', '8', '1'), ('24', '2', '9', '1'), ('25', '2', '10', '1'), ('31', '3', '1', '1'), ('32', '3', '2', '1'), ('33', '3', '3', '1'), ('34', '3', '4', '1'), ('35', '3', '5', '1'), ('36', '3', '6', '1'), ('37', '3', '7', '1'), ('38', '3', '8', '1'), ('39', '3', '9', '1'), ('40', '3', '10', '1'), ('46', '4', '1', '1'), ('47', '4', '2', '1'), ('48', '4', '3', '1'), ('49', '4', '4', '1'), ('50', '4', '5', '1'), ('51', '4', '6', '1'), ('52', '4', '7', '1'), ('53', '4', '8', '1'), ('54', '4', '9', '1'), ('55', '4', '10', '1'), ('61', '5', '1', '1'), ('62', '5', '2', '1'), ('63', '5', '3', '1'), ('64', '5', '4', '1'), ('65', '5', '5', '1'), ('66', '5', '6', '1'), ('67', '5', '7', '1'), ('68', '5', '8', '1'), ('69', '5', '9', '1'), ('70', '5', '10', '1');
COMMIT;

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
`unit_id`  int(11) NOT NULL AUTO_INCREMENT ,
`unit_nama`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`unit_id_child`  int(11) NULL DEFAULT NULL ,
`unit_level`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`unit_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='desain dari naskah'
AUTO_INCREMENT=63

;

-- ----------------------------
-- Records of unit
-- ----------------------------
BEGIN;
INSERT INTO `unit` VALUES ('1', 'BAAK', null, ''), ('2', 'BAKu', null, ''), ('3', 'BAUK', null, ''), ('4', 'BSP', null, ''), ('5', 'Cleaning Service', null, ''), ('6', 'Keamanan Unit II', null, ''), ('7', 'Kebersihan Mobil/Tenaga Lepas', null, ''), ('8', 'Laboran Agro', null, ''), ('9', 'Laboran Fakultas Teknik', null, ''), ('10', 'Laboran Sejarah', null, ''), ('11', 'Laboran UPPL', null, ''), ('12', 'LKK', null, ''), ('14', 'Parkir', null, ''), ('15', 'PMB', null, ''), ('16', 'Pusat Karir', null, ''), ('17', 'RUSUNAWA', null, ''), ('18', 'Satpam ', null, ''), ('19', 'Satpam Outsourching', null, ''), ('20', 'Satpam Outsourching Rusunawa', null, ''), ('21', 'THL', null, ''), ('22', 'TIM PAK', null, ''), ('23', 'Akuntansi', null, ''), ('24', 'TU BK', null, ''), ('25', 'TU F. Saintek', null, ''), ('26', 'Fakultas Ekonomi', null, ''), ('27', 'TU FKIP', null, ''), ('28', 'TU LPPM', null, ''), ('29', 'TU Manajemen', null, ''), ('30', 'TU Pascasarjana', null, ''), ('31', 'TU PB Inggris', null, null), ('32', 'TU Pend. Mtk', null, null), ('33', 'TU Pend. Sejarah', null, null), ('34', 'TU PGSD', null, null), ('35', 'TU PPKN', null, null), ('36', 'UPT Perpustakaan', null, null), ('37', 'UPT PPTIK', null, null), ('38', 'Yayasan', null, null), ('39', 'Agroteknologi', null, null), ('40', 'Akuntansi', null, null), ('41', 'Bimbingan Konseling', null, null), ('42', 'Biomedis', null, null), ('43', 'Elektromedis', null, null), ('44', 'Farmasi', null, null), ('45', 'Gizi', null, null), ('46', 'Manajemen', null, null), ('47', 'PBS Indonesia', null, null), ('48', 'Pend. Bahasa Inggris', null, null), ('49', 'Pend. Matematika', null, null), ('50', 'Pend. Sejarah', null, null), ('51', 'Pendidikan IPS', null, null), ('52', 'Pendidikan Luar Biasa', null, null), ('53', 'PG-PAUD', null, null), ('54', 'PGSD', null, null), ('55', 'PPKN', null, null), ('56', 'PVTO', null, null), ('57', 'Teknik Arsitektur', null, null), ('58', 'Teknik Industri', null, null), ('59', 'Teknik Informatika', null, null), ('60', 'THP', null, null), ('62', 'Lembaga Pengembangan Pendidikan', null, null);
COMMIT;

-- ----------------------------
-- Auto increment value for fakultas
-- ----------------------------
ALTER TABLE `fakultas` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for jadwal_kerja
-- ----------------------------
ALTER TABLE `jadwal_kerja` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for jam_kerja
-- ----------------------------
ALTER TABLE `jam_kerja` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for menu
-- ----------------------------
ALTER TABLE `menu` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for pegawai
-- ----------------------------
ALTER TABLE `pegawai` AUTO_INCREMENT=364;

-- ----------------------------
-- Auto increment value for pengguna
-- ----------------------------
ALTER TABLE `pengguna` AUTO_INCREMENT=15;

-- ----------------------------
-- Auto increment value for program_studi
-- ----------------------------
ALTER TABLE `program_studi` AUTO_INCREMENT=23;

-- ----------------------------
-- Auto increment value for role
-- ----------------------------
ALTER TABLE `role` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for role_menu
-- ----------------------------
ALTER TABLE `role_menu` AUTO_INCREMENT=71;

-- ----------------------------
-- Auto increment value for unit
-- ----------------------------
ALTER TABLE `unit` AUTO_INCREMENT=63;
SET FOREIGN_KEY_CHECKS=1;
