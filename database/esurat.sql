-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2022 at 03:45 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esurat`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_disposisi`
--

CREATE TABLE `tbl_disposisi` (
  `id_disposisi` int(10) NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `isi_disposisi` mediumtext NOT NULL,
  `sifat` varchar(100) NOT NULL,
  `batas_waktu` date NOT NULL,
  `catatan` varchar(250) NOT NULL,
  `id_surat` int(10) NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_disposisi`
--

INSERT INTO `tbl_disposisi` (`id_disposisi`, `tujuan`, `isi_disposisi`, `sifat`, `batas_waktu`, `catatan`, `id_surat`, `id_user`) VALUES
(2, ' 15', 'sudah sampai besok', 'Penting', '2022-08-05', 'semoga semua baik baik saja', 3, 1),
(3, ' 15', 'hghhghghg', 'Rahasia', '2022-08-07', 'semoga semua baik baik saja', 4, 1),
(6, ' 16', 'akajsjdk', 'Rahasia', '2022-10-21', 'dkjkjdkd', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hak_user`
--

CREATE TABLE `tbl_hak_user` (
  `id_hak_akses` int(3) NOT NULL,
  `hak_akses` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_hak_user`
--

INSERT INTO `tbl_hak_user` (`id_hak_akses`, `hak_akses`) VALUES
(1, 'Super Admin	\r\n'),
(2, 'Kepala Bidang'),
(3, 'Sub Bidang');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_instansi`
--

CREATE TABLE `tbl_instansi` (
  `id_instansi` tinyint(1) NOT NULL,
  `institusi` varchar(150) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `kepala` varchar(50) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `website` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `logo` varchar(250) NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_instansi`
--

INSERT INTO `tbl_instansi` (`id_instansi`, `institusi`, `nama`, `status`, `alamat`, `kepala`, `nip`, `website`, `email`, `logo`, `id_user`) VALUES
(1, 'Yogyakarta', 'BPBD DIY', 'Daerah Istimewa Yogyakarta', 'Jl. Kenari No.14A, Semaki, Kec. Umbulharjo, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55166', 'Agus Siswadi', '-', 'http://bpbd.jogjaprov.go.id', 'BPBD@jogjaprov.go.id', 'logo.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_klasifikasi`
--

CREATE TABLE `tbl_klasifikasi` (
  `id_klasifikasi` int(5) NOT NULL,
  `kode` varchar(30) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `uraian` mediumtext NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_klasifikasi`
--

INSERT INTO `tbl_klasifikasi` (`id_klasifikasi`, `kode`, `nama`, `uraian`, `id_user`) VALUES
(3, '000', 'Umum', 'Surat Umum', 1),
(4, '100', 'Pemerintahan', 'Pemerintahan\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kode_internal`
--

CREATE TABLE `tbl_kode_internal` (
  `id_kode` int(3) NOT NULL,
  `unit_kerja` varchar(100) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kode_internal`
--

INSERT INTO `tbl_kode_internal` (`id_kode`, `unit_kerja`, `kode`, `id_user`) VALUES
(1, 'Kode Jabatan Deputi Tata Laksana', 'IV', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sett`
--

CREATE TABLE `tbl_sett` (
  `id_sett` tinyint(1) NOT NULL,
  `surat_masuk` tinyint(2) NOT NULL,
  `surat_keluar` tinyint(2) NOT NULL,
  `klasifikasi` tinyint(2) NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sett`
--

INSERT INTO `tbl_sett` (`id_sett`, `surat_masuk`, `surat_keluar`, `klasifikasi`, `id_user`) VALUES
(1, 20, 10, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surat_keluar`
--

CREATE TABLE `tbl_surat_keluar` (
  `id_surat` int(10) NOT NULL,
  `no_agenda` int(10) NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `kode` varchar(30) NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_catat` date NOT NULL,
  `file` varchar(250) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_surat_keluar`
--

INSERT INTO `tbl_surat_keluar` (`id_surat`, `no_agenda`, `tujuan`, `no_surat`, `kode`, `tgl_surat`, `tgl_catat`, `file`, `keterangan`, `id_user`) VALUES
(4, 0, 'Pemkot', '12345', '3', '2022-10-06', '2022-10-06', '', 'magang', 5),
(5, 0, 'Pemkot', '12345777', '3', '2022-10-18', '2022-10-18', '', 'mbhb', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surat_masuk`
--

CREATE TABLE `tbl_surat_masuk` (
  `id_surat` int(10) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `asal_surat` varchar(250) NOT NULL,
  `tujuan_surat` varchar(50) NOT NULL,
  `kode` varchar(30) NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_diterima` date NOT NULL,
  `file` varchar(250) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `jenis_surat` enum('internal','external') NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  `notif` enum('0','1') NOT NULL,
  `status_wa` enum('Terkirim','Gagal','Tertunda','Belum Dikirim') NOT NULL DEFAULT 'Belum Dikirim'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_surat_masuk`
--

INSERT INTO `tbl_surat_masuk` (`id_surat`, `no_surat`, `asal_surat`, `tujuan_surat`, `kode`, `tgl_surat`, `tgl_diterima`, `file`, `keterangan`, `jenis_surat`, `id_user`, `notif`, `status_wa`) VALUES
(3, '22121', 'Kode Jabatan Deputi Tata Laksana', '10', '3', '2022-08-05', '2022-08-05', '1943-WhatsApp Image 2021-09-08 at 21.57.48.jpeg', 'surat pengajuan magang', 'internal', 1, '1', 'Belum Dikirim'),
(4, '67676', 'Kode Jabatan Deputi Tata Laksana', '10', '3', '2022-08-07', '2022-08-07', '8615-makanan-khas-indonesia-header.png', 'magang', 'internal', 5, '1', 'Belum Dikirim'),
(6, '123', 'Kode Jabatan Deputi Tata Laksana', '10', '4', '2022-10-06', '2022-10-06', '6916-19.06.292_jurnal_eproc.pdf', 'magang', 'internal', 1, '1', 'Belum Dikirim'),
(7, '12345', 'bkd diy', '10', '4', '2022-10-06', '2022-10-06', '3447-FOpKAM1XsA4RkOu.jpg', 'penerima  mas eko', 'external', 1, '1', 'Belum Dikirim');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` tinyint(2) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `jabatan` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`, `nama`, `nip`, `admin`, `nohp`, `jabatan`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Superadmin', '-', 1, '085750251147', 'Developer'),
(5, 'kepalabidang', '21232f297a57a5a743894a0e4a801fc3', 'Kepala Bidang', '-', 2, '081254738486', 'Kepala Sub Bagian Umum'),
(10, 'subbagian', '21232f297a57a5a743894a0e4a801fc3', 'Sub Bagian', '197107152001122003', 3, '-', 'Kasubag Umum dan Kepegawaian');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_disposisi`
--
ALTER TABLE `tbl_disposisi`
  ADD PRIMARY KEY (`id_disposisi`);

--
-- Indexes for table `tbl_hak_user`
--
ALTER TABLE `tbl_hak_user`
  ADD PRIMARY KEY (`id_hak_akses`);

--
-- Indexes for table `tbl_instansi`
--
ALTER TABLE `tbl_instansi`
  ADD PRIMARY KEY (`id_instansi`);

--
-- Indexes for table `tbl_klasifikasi`
--
ALTER TABLE `tbl_klasifikasi`
  ADD PRIMARY KEY (`id_klasifikasi`);

--
-- Indexes for table `tbl_kode_internal`
--
ALTER TABLE `tbl_kode_internal`
  ADD PRIMARY KEY (`id_kode`);

--
-- Indexes for table `tbl_sett`
--
ALTER TABLE `tbl_sett`
  ADD PRIMARY KEY (`id_sett`);

--
-- Indexes for table `tbl_surat_keluar`
--
ALTER TABLE `tbl_surat_keluar`
  ADD PRIMARY KEY (`id_surat`);

--
-- Indexes for table `tbl_surat_masuk`
--
ALTER TABLE `tbl_surat_masuk`
  ADD PRIMARY KEY (`id_surat`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_disposisi`
--
ALTER TABLE `tbl_disposisi`
  MODIFY `id_disposisi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_hak_user`
--
ALTER TABLE `tbl_hak_user`
  MODIFY `id_hak_akses` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_klasifikasi`
--
ALTER TABLE `tbl_klasifikasi`
  MODIFY `id_klasifikasi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_kode_internal`
--
ALTER TABLE `tbl_kode_internal`
  MODIFY `id_kode` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_surat_keluar`
--
ALTER TABLE `tbl_surat_keluar`
  MODIFY `id_surat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_surat_masuk`
--
ALTER TABLE `tbl_surat_masuk`
  MODIFY `id_surat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
