/*
Navicat MySQL Data Transfer

Source Server         : localhost-xampp
Source Server Version : 100138
Source Host           : localhost:3306
Source Database       : db_monitoring_kehadiran_pegawai

Target Server Type    : MYSQL
Target Server Version : 100138
File Encoding         : 65001

Date: 2021-08-10 09:19:54
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Table structure for fakultas
-- ----------------------------
DROP TABLE IF EXISTS `fakultas`;
CREATE TABLE `fakultas` (
  `id_fakultas` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_fakultas` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_fakultas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Table structure for jadwal_kerja
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_kerja`;
CREATE TABLE `jadwal_kerja` (
  `id_jadwal_kerja` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jadwal_kerja` varchar(255) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `id_jam_kerja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_jadwal_kerja`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Table structure for jam_kerja
-- ----------------------------
DROP TABLE IF EXISTS `jam_kerja`;
CREATE TABLE `jam_kerja` (
  `id_jam_kerja` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jam_kerja` varchar(255) DEFAULT NULL,
  `jam_masuk_senin` time DEFAULT NULL,
  `jam_pulang_senin` time DEFAULT NULL,
  `jam_masuk_senin_toleransi` time DEFAULT NULL,
  `jam_pulang_senin_toleransi` time DEFAULT NULL,
  `jam_masuk_selasa` time DEFAULT NULL,
  `jam_pulang_selasa` time DEFAULT NULL,
  `jam_masuk_selasa_toleransi` time DEFAULT NULL,
  `jam_pulang_selasa_toleransi` time DEFAULT NULL,
  `jam_masuk_rabu` time DEFAULT NULL,
  `jam_pulang_rabu` time DEFAULT NULL,
  `jam_masuk_rabu_toleransi` time DEFAULT NULL,
  `jam_pulang_rabu_toleransi` time DEFAULT NULL,
  `jam_masuk_kamis` time DEFAULT NULL,
  `jam_pulang_kamis` time DEFAULT NULL,
  `jam_masuk_kamis_toleransi` time DEFAULT NULL,
  `jam_pulang_kamis_toleransi` time DEFAULT NULL,
  `jam_masuk_jumat` time DEFAULT NULL,
  `jam_pulang_jumat` time DEFAULT NULL,
  `jam_masuk_jumat_toleransi` time DEFAULT NULL,
  `jam_pulang_jumat_toleransi` time DEFAULT NULL,
  `jam_masuk_sabtu` time DEFAULT NULL,
  `jam_pulang_sabtu` time DEFAULT NULL,
  `jam_masuk_sabtu_toleransi` time DEFAULT NULL,
  `jam_pulang_sabtu_toleransi` time DEFAULT NULL,
  `jam_masuk_minggu` time DEFAULT NULL,
  `jam_pulang_minggu` time DEFAULT NULL,
  `jam_masuk_minggu_toleransi` time DEFAULT NULL,
  `jam_pulang_minggu_toleransi` time DEFAULT NULL,
  PRIMARY KEY (`id_jam_kerja`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Table structure for laporan_rekap_detail
-- ----------------------------
DROP TABLE IF EXISTS `laporan_rekap_detail`;
CREATE TABLE `laporan_rekap_detail` (
  `id_laporan_rekap_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) DEFAULT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `id_fakultas` int(11) DEFAULT NULL,
  `id_program_studi` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `scan_masuk` time DEFAULT NULL,
  `scan_keluar` time DEFAULT NULL,
  `terlambat` time DEFAULT NULL,
  `bolos` varchar(10) DEFAULT NULL,
  `jumlah_jam_kehadiran` time DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_laporan_rekap_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for log_mesin_finger
-- ----------------------------
DROP TABLE IF EXISTS `log_mesin_finger`;
CREATE TABLE `log_mesin_finger` (
  `pin_finger` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  PRIMARY KEY (`pin_finger`,`tanggal`,`jam`),
  UNIQUE KEY `idx_data_log` (`pin_finger`,`tanggal`,`jam`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='tabel bantu ambil data dari upload file attlog';

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
  `status_aktif` int(11) DEFAULT '1',
  PRIMARY KEY (`id_pegawai`),
  KEY `idx_id_pegawai` (`id_pegawai`) USING BTREE,
  KEY `idx_id_unit` (`id_unit`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `id_pegawai` int(11) unsigned DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `datetime_create` datetime DEFAULT NULL,
  `datetime_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pengguna`) USING BTREE,
  KEY `id_role` (`id_role`),
  KEY `id_pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='desain dari naskah';

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='tabel riset, tidak terpakai';

-- ----------------------------
-- Table structure for program_studi
-- ----------------------------
DROP TABLE IF EXISTS `program_studi`;
CREATE TABLE `program_studi` (
  `id_program_studi` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_fakultas` int(11) DEFAULT NULL,
  `nama_program_studi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_program_studi`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id_role` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_role` varchar(255) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id_role_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `status_aktif` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_role_menu`) USING BTREE,
  KEY `fk_role` (`id_role`),
  KEY `fk_menu` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_nama` varchar(100) DEFAULT NULL,
  `unit_id_child` int(11) DEFAULT NULL,
  `unit_level` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- Table structure for unit_simpeg
-- ----------------------------
DROP TABLE IF EXISTS `unit_simpeg`;
CREATE TABLE `unit_simpeg` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_nama` varchar(100) DEFAULT NULL,
  `unit_id_child` int(11) DEFAULT NULL,
  `unit_level` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='desain dari naskah';

-- ----------------------------
-- View structure for view_log_presensi
-- ----------------------------
DROP VIEW IF EXISTS `view_log_presensi`;
CREATE VIEW `view_log_presensi` AS select `pegawai`.`id_pegawai` AS `id_pegawai`,`unit`.`unit_id` AS `unit_id`,`fakultas`.`id_fakultas` AS `id_fakultas`,`program_studi`.`id_program_studi` AS `id_program_studi`,`log_mesin_finger`.`tanggal` AS `tanggal`,`log_mesin_finger`.`jam` AS `jam`,`pegawai`.`nama_pegawai` AS `nama_pegawai`,`pegawai`.`nis_pegawai` AS `nis_pegawai`,`unit`.`unit_nama` AS `unit_nama`,`fakultas`.`nama_fakultas` AS `nama_fakultas`,`program_studi`.`nama_program_studi` AS `nama_program_studi` from ((((`log_mesin_finger` join `pegawai` on(`log_mesin_finger`.`pin_finger` = `pegawai`.`pin_finger`)) left join `unit` on(`pegawai`.`id_unit` = `unit`.`unit_id`)) left join `fakultas` on(`pegawai`.`id_fakultas` = `fakultas`.`id_fakultas`)) left join `program_studi` on(`pegawai`.`id_program_studi` = `program_studi`.`id_program_studi`)) order by `pegawai`.`nis_pegawai` desc,`log_mesin_finger`.`tanggal` ;

-- ----------------------------
-- Function structure for func_getjumlahkehadiran
-- ----------------------------
DROP FUNCTION IF EXISTS `func_getjumlahkehadiran`;
DELIMITER ;;
CREATE FUNCTION `func_getjumlahkehadiran`(x_tglawal DATE,x_tglakhir DATE,x_idpegawai INT(11)) RETURNS char(8) CHARSET latin1
BEGIN
DECLARE x_jumlah_kehadiran INTEGER DEFAULT 0;

SELECT
	COUNT(tanggal) INTO x_jumlah_kehadiran
FROM (
SELECT
	log_mesin_finger.tanggal
FROM
	log_mesin_finger
LEFT JOIN pegawai ON log_mesin_finger.pin_finger = pegawai.pin_finger
WHERE
	log_mesin_finger.tanggal >= x_tglawal AND log_mesin_finger.tanggal <= x_tglakhir
	AND pegawai.id_pegawai = x_idpegawai
GROUP BY
	log_mesin_finger.tanggal
) a;

RETURN x_jumlah_kehadiran;



END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_getscanbolos
-- ----------------------------
DROP FUNCTION IF EXISTS `func_getscanbolos`;
DELIMITER ;;
CREATE FUNCTION `func_getscanbolos`(x_tgl DATE,x_idunit INT(11),x_idfinger INT(11)) RETURNS char(10) CHARSET latin1
BEGIN
DECLARE x_idhari INTEGER DEFAULT 1;

DECLARE datapresensi time DEFAULT '00:00:00'; -- return variable

DECLARE jamdatang time DEFAULT '00:00:00';
DECLARE jampulang time DEFAULT '00:00:00';
DECLARE toleransidatang time DEFAULT '00:00:00';
DECLARE toleransipulang time DEFAULT '00:00:00';

DECLARE x_jammendahului time DEFAULT '00:00:00';

DECLARE minsec time DEFAULT '00';
DECLARE maxsec time DEFAULT '00';
DECLARE minpresensi time DEFAULT '00:00:00';
DECLARE maxpresensi time DEFAULT '00:00:00'; 
DECLARE jmlhpresensi int(2) DEFAULT 0;
DECLARE minsts char(10) DEFAULT 'mesin';
DECLARE maxsts char(10) DEFAULT 'mesin';

SELECT DAYOFWEEK(x_tgl) INTO x_idhari FROM DUAL;

-- Hari Minggu ---
IF x_idhari = 1 THEN
		SELECT
		b.jam_masuk_minggu,
		b.jam_pulang_minggu,
		b.jam_masuk_minggu_toleransi,
		b.jam_pulang_minggu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Senin --
ELSEIF x_idhari = 2 THEN 
		SELECT
		b.jam_masuk_senin,
		b.jam_pulang_senin,
		b.jam_masuk_senin_toleransi,
		b.jam_pulang_senin_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Selasa --
ELSEIF x_idhari = 3 THEN 
		SELECT
		b.jam_masuk_selasa,
		b.jam_pulang_selasa,
		b.jam_masuk_selasa_toleransi,
		b.jam_pulang_selasa_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Rabu --
ELSEIF x_idhari = 4 THEN 
		SELECT
		b.jam_masuk_rabu,
		b.jam_pulang_rabu,
		b.jam_masuk_rabu_toleransi,
		b.jam_pulang_rabu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Kamis --
ELSEIF x_idhari = 5 THEN 
		SELECT
		b.jam_masuk_kamis,
		b.jam_pulang_kamis,
		b.jam_masuk_kamis_toleransi,
		b.jam_pulang_kamis_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Jumat --
ELSEIF x_idhari = 6 THEN 
		SELECT
		b.jam_masuk_jumat,
		b.jam_pulang_jumat,
		b.jam_masuk_jumat_toleransi,
		b.jam_pulang_jumat_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Sabtu --
ELSEIF x_idhari = 7 THEN 
		SELECT
		b.jam_masuk_sabtu,
		b.jam_pulang_sabtu,
		b.jam_masuk_sabtu_toleransi,
		b.jam_pulang_sabtu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
END IF;

SELECT COUNT(pin_finger),MIN(jam),MAX(jam),RIGHT(MIN(jam),2),RIGHT(MAX(jam),2) 
INTO jmlhpresensi,minpresensi,maxpresensi,minsec,maxsec 
FROM log_mesin_finger WHERE pin_finger=x_idfinger AND tanggal=x_tgl;

IF ((maxpresensi > '12:00:00') AND (maxpresensi < jampulang)) THEN
	SET x_jammendahului = sec_to_time((time_to_sec(jampulang))-time_to_sec(maxpresensi));
	SET x_jammendahului = sec_to_time(time_to_sec(jampulang)-time_to_sec(maxpresensi));
	SET datapresensi = x_jammendahului;
ELSE
	SET datapresensi = NULL;
END IF;

RETURN datapresensi;



END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_getscanjumlahkehadiran
-- ----------------------------
DROP FUNCTION IF EXISTS `func_getscanjumlahkehadiran`;
DELIMITER ;;
CREATE FUNCTION `func_getscanjumlahkehadiran`(x_tgl DATE,x_idunit INT(11),x_idfinger INT(11)) RETURNS char(8) CHARSET latin1
BEGIN
DECLARE x_idhari INTEGER DEFAULT 1;

DECLARE datapresensi time DEFAULT '00:00:00'; -- return variable

DECLARE jamdatang time DEFAULT '00:00:00';
DECLARE jampulang time DEFAULT '00:00:00';
DECLARE toleransidatang time DEFAULT '00:00:00';
DECLARE toleransipulang time DEFAULT '00:00:00';

DECLARE minsec time DEFAULT '00';
DECLARE maxsec time DEFAULT '00';
DECLARE minpresensi time DEFAULT '00:00:00';
DECLARE maxpresensi time DEFAULT '00:00:00'; 

DECLARE scandatang time DEFAULT '00:00:00';
DECLARE scanpulang time DEFAULT '00:00:00';

DECLARE jmlhpresensi int(2) DEFAULT 0;
DECLARE minsts char(10) DEFAULT 'mesin';
DECLARE maxsts char(10) DEFAULT 'mesin';

SELECT DAYOFWEEK(x_tgl) INTO x_idhari FROM DUAL;

-- Hari Minggu ---
IF x_idhari = 1 THEN
		SELECT
		b.jam_masuk_minggu,
		b.jam_pulang_minggu,
		b.jam_masuk_minggu_toleransi,
		b.jam_pulang_minggu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Senin --
ELSEIF x_idhari = 2 THEN 
		SELECT
		b.jam_masuk_senin,
		b.jam_pulang_senin,
		b.jam_masuk_senin_toleransi,
		b.jam_pulang_senin_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Selasa --
ELSEIF x_idhari = 3 THEN 
		SELECT
		b.jam_masuk_selasa,
		b.jam_pulang_selasa,
		b.jam_masuk_selasa_toleransi,
		b.jam_pulang_selasa_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Rabu --
ELSEIF x_idhari = 4 THEN 
		SELECT
		b.jam_masuk_rabu,
		b.jam_pulang_rabu,
		b.jam_masuk_rabu_toleransi,
		b.jam_pulang_rabu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Kamis --
ELSEIF x_idhari = 5 THEN 
		SELECT
		b.jam_masuk_kamis,
		b.jam_pulang_kamis,
		b.jam_masuk_kamis_toleransi,
		b.jam_pulang_kamis_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Jumat --
ELSEIF x_idhari = 6 THEN 
		SELECT
		b.jam_masuk_jumat,
		b.jam_pulang_jumat,
		b.jam_masuk_jumat_toleransi,
		b.jam_pulang_jumat_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Sabtu --
ELSEIF x_idhari = 7 THEN 
		SELECT
		b.jam_masuk_sabtu,
		b.jam_pulang_sabtu,
		b.jam_masuk_sabtu_toleransi,
		b.jam_pulang_sabtu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
END IF;

SELECT COUNT(pin_finger),MIN(jam),MAX(jam),RIGHT(MIN(jam),2),RIGHT(MAX(jam),2) 
INTO jmlhpresensi,minpresensi,maxpresensi,minsec,maxsec 
FROM log_mesin_finger WHERE pin_finger=x_idfinger AND tanggal=x_tgl;

IF ((minpresensi > '06:00:00') AND (minpresensi < '09:00:00')) THEN
	SET scandatang = minpresensi;
ELSE
	SET scandatang = '00:00:00';
END IF;

IF ((maxpresensi > '12:00:00') AND (maxpresensi < '23:00:00')) THEN
	SET scanpulang = maxpresensi;
ELSE
	SET scanpulang = '00:00:00';
END IF;

IF (scandatang <> '00:00:00') AND (scanpulang <> '00:00:00') THEN
	SET datapresensi = sec_to_time(time_to_sec(scanpulang)-(time_to_sec(scandatang)));
ELSE
 SET datapresensi = '00:00:00';
END IF;

RETURN datapresensi;



END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_getscankeluar
-- ----------------------------
DROP FUNCTION IF EXISTS `func_getscankeluar`;
DELIMITER ;;
CREATE FUNCTION `func_getscankeluar`(x_tgl DATE,x_idunit INT(11),x_idfinger INT(11)) RETURNS char(8) CHARSET latin1
BEGIN
DECLARE x_idhari INTEGER DEFAULT 1;

DECLARE datapresensi time DEFAULT '00:00:00'; -- return variable

DECLARE jamdatang time DEFAULT '00:00:00';
DECLARE jampulang time DEFAULT '00:00:00';
DECLARE toleransidatang time DEFAULT '00:00:00';
DECLARE toleransipulang time DEFAULT '00:00:00';

DECLARE minsec time DEFAULT '00';
DECLARE maxsec time DEFAULT '00';
DECLARE minpresensi time DEFAULT '00:00:00';
DECLARE maxpresensi time DEFAULT '00:00:00'; 
DECLARE jmlhpresensi int(2) DEFAULT 0;
DECLARE minsts char(10) DEFAULT 'mesin';
DECLARE maxsts char(10) DEFAULT 'mesin';

SELECT DAYOFWEEK(x_tgl) INTO x_idhari FROM DUAL;

-- Hari Minggu ---
IF x_idhari = 1 THEN
		SELECT
		b.jam_masuk_minggu,
		b.jam_pulang_minggu,
		b.jam_masuk_minggu_toleransi,
		b.jam_pulang_minggu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Senin --
ELSEIF x_idhari = 2 THEN 
		SELECT
		b.jam_masuk_senin,
		b.jam_pulang_senin,
		b.jam_masuk_senin_toleransi,
		b.jam_pulang_senin_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Selasa --
ELSEIF x_idhari = 3 THEN 
		SELECT
		b.jam_masuk_selasa,
		b.jam_pulang_selasa,
		b.jam_masuk_selasa_toleransi,
		b.jam_pulang_selasa_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Rabu --
ELSEIF x_idhari = 4 THEN 
		SELECT
		b.jam_masuk_rabu,
		b.jam_pulang_rabu,
		b.jam_masuk_rabu_toleransi,
		b.jam_pulang_rabu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Kamis --
ELSEIF x_idhari = 5 THEN 
		SELECT
		b.jam_masuk_kamis,
		b.jam_pulang_kamis,
		b.jam_masuk_kamis_toleransi,
		b.jam_pulang_kamis_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Jumat --
ELSEIF x_idhari = 6 THEN 
		SELECT
		b.jam_masuk_jumat,
		b.jam_pulang_jumat,
		b.jam_masuk_jumat_toleransi,
		b.jam_pulang_jumat_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Sabtu --
ELSEIF x_idhari = 7 THEN 
		SELECT
		b.jam_masuk_sabtu,
		b.jam_pulang_sabtu,
		b.jam_masuk_sabtu_toleransi,
		b.jam_pulang_sabtu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
END IF;

SELECT COUNT(pin_finger),MIN(jam),MAX(jam),RIGHT(MIN(jam),2),RIGHT(MAX(jam),2) 
INTO jmlhpresensi,minpresensi,maxpresensi,minsec,maxsec 
FROM log_mesin_finger WHERE pin_finger=x_idfinger AND tanggal=x_tgl;

IF ((maxpresensi > '12:00:00') AND (maxpresensi < '23:00:00')) THEN
	SET datapresensi = maxpresensi;
ELSE
	SET datapresensi = '00:00:00';
END IF;

RETURN datapresensi;



END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_getscanmasuk
-- ----------------------------
DROP FUNCTION IF EXISTS `func_getscanmasuk`;
DELIMITER ;;
CREATE FUNCTION `func_getscanmasuk`(x_tgl DATE,x_idunit INT(11),x_idfinger INT(11)) RETURNS char(8) CHARSET latin1
BEGIN
DECLARE x_idhari INTEGER DEFAULT 1;

DECLARE datapresensi time DEFAULT '00:00:00'; -- return variable

DECLARE jamdatang time DEFAULT '00:00:00';
DECLARE jampulang time DEFAULT '00:00:00';
DECLARE toleransidatang time DEFAULT '00:00:00';
DECLARE toleransipulang time DEFAULT '00:00:00';

DECLARE minsec time DEFAULT '00';
DECLARE maxsec time DEFAULT '00';
DECLARE minpresensi time DEFAULT '00:00:00';
DECLARE maxpresensi time DEFAULT '00:00:00'; 
DECLARE jmlhpresensi int(2) DEFAULT 0;
DECLARE minsts char(10) DEFAULT 'mesin';
DECLARE maxsts char(10) DEFAULT 'mesin';

SELECT DAYOFWEEK(x_tgl) INTO x_idhari FROM DUAL;

-- Hari Minggu ---
IF x_idhari = 1 THEN
		SELECT
		b.jam_masuk_minggu,
		b.jam_pulang_minggu,
		b.jam_masuk_minggu_toleransi,
		b.jam_pulang_minggu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Senin --
ELSEIF x_idhari = 2 THEN 
		SELECT
		b.jam_masuk_senin,
		b.jam_pulang_senin,
		b.jam_masuk_senin_toleransi,
		b.jam_pulang_senin_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Selasa --
ELSEIF x_idhari = 3 THEN 
		SELECT
		b.jam_masuk_selasa,
		b.jam_pulang_selasa,
		b.jam_masuk_selasa_toleransi,
		b.jam_pulang_selasa_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Rabu --
ELSEIF x_idhari = 4 THEN 
		SELECT
		b.jam_masuk_rabu,
		b.jam_pulang_rabu,
		b.jam_masuk_rabu_toleransi,
		b.jam_pulang_rabu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Kamis --
ELSEIF x_idhari = 5 THEN 
		SELECT
		b.jam_masuk_kamis,
		b.jam_pulang_kamis,
		b.jam_masuk_kamis_toleransi,
		b.jam_pulang_kamis_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Jumat --
ELSEIF x_idhari = 6 THEN 
		SELECT
		b.jam_masuk_jumat,
		b.jam_pulang_jumat,
		b.jam_masuk_jumat_toleransi,
		b.jam_pulang_jumat_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Sabtu --
ELSEIF x_idhari = 7 THEN 
		SELECT
		b.jam_masuk_sabtu,
		b.jam_pulang_sabtu,
		b.jam_masuk_sabtu_toleransi,
		b.jam_pulang_sabtu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
END IF;

SELECT COUNT(pin_finger),MIN(jam),MAX(jam),RIGHT(MIN(jam),2),RIGHT(MAX(jam),2) 
INTO jmlhpresensi,minpresensi,maxpresensi,minsec,maxsec 
FROM log_mesin_finger WHERE pin_finger=x_idfinger AND tanggal=x_tgl;

IF ((minpresensi > '06:00:00') AND (minpresensi < '09:00:00')) THEN
	SET datapresensi = minpresensi;
ELSE
	SET datapresensi = NULL;
END IF;

RETURN datapresensi;



END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_getscanterlambat
-- ----------------------------
DROP FUNCTION IF EXISTS `func_getscanterlambat`;
DELIMITER ;;
CREATE FUNCTION `func_getscanterlambat`(x_tgl DATE,x_idunit INT(11),x_idfinger INT(11)) RETURNS char(8) CHARSET latin1
BEGIN
DECLARE x_idhari INTEGER DEFAULT 1;

DECLARE datapresensi time DEFAULT '00:00:00'; -- return variable

DECLARE jamdatang time DEFAULT '00:00:00';
DECLARE jampulang time DEFAULT '00:00:00';
DECLARE toleransidatang time DEFAULT '00:00:00';
DECLARE toleransipulang time DEFAULT '00:00:00';

DECLARE x_jamtelat time DEFAULT '00:00:00';

DECLARE minsec time DEFAULT '00';
DECLARE maxsec time DEFAULT '00';
DECLARE minpresensi time DEFAULT '00:00:00';
DECLARE maxpresensi time DEFAULT '00:00:00'; 
DECLARE jmlhpresensi int(2) DEFAULT 0;
DECLARE minsts char(10) DEFAULT 'mesin';
DECLARE maxsts char(10) DEFAULT 'mesin';

SELECT DAYOFWEEK(x_tgl) INTO x_idhari FROM DUAL;

-- Hari Minggu ---
IF x_idhari = 1 THEN
		SELECT
		b.jam_masuk_minggu,
		b.jam_pulang_minggu,
		b.jam_masuk_minggu_toleransi,
		b.jam_pulang_minggu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Senin --
ELSEIF x_idhari = 2 THEN 
		SELECT
		b.jam_masuk_senin,
		b.jam_pulang_senin,
		b.jam_masuk_senin_toleransi,
		b.jam_pulang_senin_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Selasa --
ELSEIF x_idhari = 3 THEN 
		SELECT
		b.jam_masuk_selasa,
		b.jam_pulang_selasa,
		b.jam_masuk_selasa_toleransi,
		b.jam_pulang_selasa_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Rabu --
ELSEIF x_idhari = 4 THEN 
		SELECT
		b.jam_masuk_rabu,
		b.jam_pulang_rabu,
		b.jam_masuk_rabu_toleransi,
		b.jam_pulang_rabu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Kamis --
ELSEIF x_idhari = 5 THEN 
		SELECT
		b.jam_masuk_kamis,
		b.jam_pulang_kamis,
		b.jam_masuk_kamis_toleransi,
		b.jam_pulang_kamis_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Jumat --
ELSEIF x_idhari = 6 THEN 
		SELECT
		b.jam_masuk_jumat,
		b.jam_pulang_jumat,
		b.jam_masuk_jumat_toleransi,
		b.jam_pulang_jumat_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
-- Hari Sabtu --
ELSEIF x_idhari = 7 THEN 
		SELECT
		b.jam_masuk_sabtu,
		b.jam_pulang_sabtu,
		b.jam_masuk_sabtu_toleransi,
		b.jam_pulang_sabtu_toleransi
		INTO jamdatang,jampulang,toleransidatang,toleransipulang
		FROM
		jadwal_kerja a
		INNER JOIN jam_kerja b ON b.id_jam_kerja = a.id_jam_kerja
		WHERE
		a.unit_id = x_idunit
		-- 		AND	
		-- 		x_tgl >= a.jadwal_tglmulai
		-- 		AND
		-- 		x_tgl <= a.jadwal_tglberakhir
		;
END IF;

SELECT COUNT(pin_finger),MIN(jam),MAX(jam),RIGHT(MIN(jam),2),RIGHT(MAX(jam),2) 
INTO jmlhpresensi,minpresensi,maxpresensi,minsec,maxsec 
FROM log_mesin_finger WHERE pin_finger=x_idfinger AND tanggal=x_tgl;

IF ((minpresensi > jamdatang) AND (minpresensi < '09:00:00')) THEN
	SET x_jamtelat = sec_to_time(time_to_sec(minpresensi)-(time_to_sec(jamdatang)));
	SET datapresensi = x_jamtelat;
ELSE
	SET datapresensi = NULL;
END IF;
	
RETURN datapresensi;



END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
