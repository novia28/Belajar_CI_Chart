-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2016 at 11:22 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_opendata`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE IF NOT EXISTS `alumni` (
  `ID_ALUMNI` int(11) NOT NULL,
  `ID_PRODI` int(11) NOT NULL,
  `NAMA_ALUMNI` varchar(40) NOT NULL,
  `TAHUN_MASUK` int(11) NOT NULL,
  `TAHUN_KELUAR` int(11) NOT NULL,
  `EMAIL_ALUMNI` varchar(50) DEFAULT NULL,
  `NO_HP` varchar(13) DEFAULT NULL,
  `ALAMAT_ALUMNI` text,
  `PEKERJAAN` varchar(20) DEFAULT NULL,
  `USERNAME` varchar(10) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_ALUMNI`),
  KEY `FK_KULIAH_DI` (`ID_PRODI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`ID_ALUMNI`, `ID_PRODI`, `NAMA_ALUMNI`, `TAHUN_MASUK`, `TAHUN_KELUAR`, `EMAIL_ALUMNI`, `NO_HP`, `ALAMAT_ALUMNI`, `PEKERJAAN`, `USERNAME`, `PASSWORD`) VALUES
(0, 8, 'Mutiara Trie Aprilian', 2015, 2018, 'mutiara.trie.tif15@polban.ac.id', '02389203', 'Cililin', 'Sistem Analis', 'mutiara.tr', 'localhost'),
(1, 15, 'Novia Sukmasari Putri', 2015, 2018, 'sukmasarin@gmail.com', '089609391875', 'Komp. Gumil Jl. Panorama 5 No.1 RT 06/05 Desa Sariwangi, Kecamatan Parongpong, Kabupaten Bandung Barat', 'Software Engineer', 'novia28', 'localhost'),
(2, 15, 'Nita Amelia Wijaya', 2016, 2019, 'nita.amelia.tif16@polban.ac.id', '089609391877', 'Teuing', 'Web Developer', 'nita_ameli', 'localhost');

-- --------------------------------------------------------

--
-- Table structure for table `bekerja`
--

CREATE TABLE IF NOT EXISTS `bekerja` (
  `ID_BEKERJA` int(11) NOT NULL,
  `ID_ALUMNI` int(11) NOT NULL,
  `ID_PERUSAHAAN` int(11) NOT NULL,
  `JABATAN_PEKERJAAN` varchar(12) NOT NULL,
  `TAHUN_MULAI` int(11) NOT NULL,
  `TAHUN_BERHENTI` int(11) NOT NULL,
  PRIMARY KEY (`ID_BEKERJA`),
  KEY `FK_BEKERJA_DI` (`ID_ALUMNI`),
  KEY `FK_DITEMPATI_KERJA` (`ID_PERUSAHAAN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE IF NOT EXISTS `jurusan` (
  `ID_JURUSAN` int(11) NOT NULL,
  `NAMA_JURUSAN` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_JURUSAN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`ID_JURUSAN`, `NAMA_JURUSAN`) VALUES
(1, 'Administrasi Niaga'),
(2, 'Teknik Sipil'),
(3, 'Teknik Mesin'),
(4, 'Teknik Refrigasi dan Tata Udar'),
(5, 'Teknik Komputer dan Informatik'),
(6, 'Teknik Konversi Energi'),
(7, 'Teknik Elektro'),
(8, 'Teknik Kimia'),
(9, 'Akuntansi'),
(10, 'Bahasa Inggris');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE IF NOT EXISTS `perusahaan` (
  `ID_PERUSAHAAN` int(11) NOT NULL,
  `NAMA_PERUSAHAAN` varchar(20) NOT NULL,
  `EMAIL_PERUSAHAAN` varchar(40) NOT NULL,
  `NOMOR_TELEPON_PERUSAHAAN` int(11) DEFAULT NULL,
  `ALAMAT_PERUSAHAAN` varchar(20) NOT NULL,
  `BIDANG_PEKERJAAN` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_PERUSAHAAN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `program_studi`
--

CREATE TABLE IF NOT EXISTS `program_studi` (
  `ID_PRODI` int(11) NOT NULL,
  `ID_JURUSAN` int(11) NOT NULL,
  `NAMA_PRODI` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_PRODI`),
  KEY `FK_MEMILIKI` (`ID_JURUSAN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `program_studi`
--

INSERT INTO `program_studi` (`ID_PRODI`, `ID_JURUSAN`, `NAMA_PRODI`) VALUES
(1, 1, 'D3-Administrasi Bisnis'),
(2, 1, 'D3-Manajemen Pemasaran'),
(3, 1, 'D3-Usaha Perjalanan Wisata'),
(4, 1, 'D4-Manajemen Pemasaran'),
(5, 1, 'D4-Manajemen Aset'),
(6, 1, 'D4-Administrisi Bisnis'),
(7, 2, 'D3-Teknik Konstruksi Sipil'),
(8, 2, 'D3-Teknik Konstruksi Gedung'),
(9, 2, 'D4-Teknik Perancangan Jalan da'),
(10, 2, 'D4-Teknik Perawatan dan Perbai'),
(11, 3, 'D3-Teknik Mesin'),
(12, 3, 'D3-Aeronautika'),
(13, 3, 'D4-TPKM'),
(14, 3, 'D4-Proses Manufaktur'),
(15, 5, 'D3-Teknik Informatika'),
(16, 5, 'D4-Teknik Informatika'),
(17, 7, 'D3-Teknik Elektronika'),
(18, 7, 'D3-Teknik Listrik'),
(19, 7, 'D3-Teknik Telekomunikasi'),
(20, 7, 'D4-Teknik Elektronika'),
(21, 7, 'D4-Teknik Telekomunikasi'),
(22, 7, 'D4-Teknik Otomasi Industri'),
(23, 8, 'D3-Teknik Kimia'),
(24, 8, 'D3-Analis Kimia'),
(25, 8, 'D4-Teknik Kimia Produksi Bersi'),
(26, 9, 'D3-Akutansi'),
(27, 9, 'D3-Keuangan Perbankan'),
(28, 9, 'D4-Akutansi Manajemen Pemerint'),
(29, 9, 'D4-Keuangan Syariah'),
(30, 9, 'D4-Akutansi'),
(31, 10, 'D3-Bahasa Inggris'),
(32, 4, 'D3-Teknik Pendingin dan Tata U'),
(33, 4, 'D4-Teknik Pendingin dan Tata U'),
(34, 6, 'D3-Teknik Konversi Energi'),
(35, 6, 'D4-TPTL'),
(36, 6, 'D4-Teknik Konservasi Energi');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `ID_USER` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(11) NOT NULL,
  `ID_PRODI` int(11) DEFAULT NULL,
  `PASSWORD_USER` varchar(20) NOT NULL,
  `STATUS` int(11) NOT NULL,
  PRIMARY KEY (`ID_USER`),
  KEY `FK_KULIAH_DI_2_` (`ID_PRODI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni`
--
ALTER TABLE `alumni`
  ADD CONSTRAINT `FK_KULIAH_DI` FOREIGN KEY (`ID_PRODI`) REFERENCES `program_studi` (`ID_PRODI`);

--
-- Constraints for table `bekerja`
--
ALTER TABLE `bekerja`
  ADD CONSTRAINT `FK_DITEMPATI_KERJA` FOREIGN KEY (`ID_PERUSAHAAN`) REFERENCES `perusahaan` (`ID_PERUSAHAAN`),
  ADD CONSTRAINT `FK_BEKERJA_DI` FOREIGN KEY (`ID_ALUMNI`) REFERENCES `alumni` (`ID_ALUMNI`);

--
-- Constraints for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD CONSTRAINT `FK_MEMILIKI` FOREIGN KEY (`ID_JURUSAN`) REFERENCES `jurusan` (`ID_JURUSAN`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_KULIAH_DI_2_` FOREIGN KEY (`ID_PRODI`) REFERENCES `program_studi` (`ID_PRODI`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
