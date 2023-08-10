DROP TABLE tbl_disposisi;

CREATE TABLE `tbl_disposisi` (
  `id_disposisi` int(10) NOT NULL AUTO_INCREMENT,
  `tujuan` varchar(250) NOT NULL,
  `isi_disposisi` mediumtext NOT NULL,
  `sifat` varchar(100) NOT NULL,
  `batas_waktu` date NOT NULL,
  `catatan` varchar(250) NOT NULL,
  `id_surat` int(10) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_disposisi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO tbl_disposisi VALUES("2"," 15","sudah sampai besok","Penting","2022-08-05","semoga semua baik baik saja","3","1");



DROP TABLE tbl_hak_user;

CREATE TABLE `tbl_hak_user` (
  `id_hak_akses` int(3) NOT NULL AUTO_INCREMENT,
  `hak_akses` varchar(100) NOT NULL,
  PRIMARY KEY (`id_hak_akses`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_hak_user VALUES("1","Super Admin	/\n/");
INSERT INTO tbl_hak_user VALUES("2","Staff TU");
INSERT INTO tbl_hak_user VALUES("3","Pejabat Disposisi");
INSERT INTO tbl_hak_user VALUES("4","Pegawai ");



DROP TABLE tbl_instansi;

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
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_instansi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO tbl_instansi VALUES("1","Yogyakarta","BPBD DIY","Daerah Istimewa Yogyakarta","Jl. Kenari No.14A, Semaki, Kec. Umbulharjo, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55166","Agus Siswadi","-","http://bpbd.jogjaprov.go.id","BPBD@jogjaprov.go.id","logo.png","1");



DROP TABLE tbl_klasifikasi;

CREATE TABLE `tbl_klasifikasi` (
  `id_klasifikasi` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(30) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `uraian` mediumtext NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_klasifikasi`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO tbl_klasifikasi VALUES("3","000","Umum","Surat Umum","1");
INSERT INTO tbl_klasifikasi VALUES("4","100","Pemerintahan","Pemerintahan/\n/","1");



DROP TABLE tbl_kode_internal;

CREATE TABLE `tbl_kode_internal` (
  `id_kode` int(3) NOT NULL AUTO_INCREMENT,
  `unit_kerja` varchar(100) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_kode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_kode_internal VALUES("1","Kode Jabatan Deputi Tata Laksana","IV","1");



DROP TABLE tbl_sett;

CREATE TABLE `tbl_sett` (
  `id_sett` tinyint(1) NOT NULL,
  `surat_masuk` tinyint(2) NOT NULL,
  `surat_keluar` tinyint(2) NOT NULL,
  `klasifikasi` tinyint(2) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_sett`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO tbl_sett VALUES("1","20","10","10","1");



DROP TABLE tbl_surat_keluar;

CREATE TABLE `tbl_surat_keluar` (
  `id_surat` int(10) NOT NULL AUTO_INCREMENT,
  `no_agenda` int(10) NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `kode` varchar(30) NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_catat` date NOT NULL,
  `file` varchar(250) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_surat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;




DROP TABLE tbl_surat_masuk;

CREATE TABLE `tbl_surat_masuk` (
  `id_surat` int(10) NOT NULL AUTO_INCREMENT,
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
  `status_wa` enum('Terkirim','Gagal','Tertunda','Belum Dikirim') NOT NULL DEFAULT 'Belum Dikirim',
  PRIMARY KEY (`id_surat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO tbl_surat_masuk VALUES("2","e123","Kode Jabatan Deputi Tata Laksana","10","3","2021-12-17","2021-12-10","","asa","internal","1","1","Belum Dikirim");
INSERT INTO tbl_surat_masuk VALUES("3","22121","Kode Jabatan Deputi Tata Laksana","10","3","2022-08-05","2022-08-05","1943-WhatsApp Image 2021-09-08 at 21.57.48.jpeg","surat pengajuan magang","internal","1","1","Belum Dikirim");
INSERT INTO tbl_surat_masuk VALUES("4","67676","Kode Jabatan Deputi Tata Laksana","10","3","2022-08-07","2022-08-07","8615-makanan-khas-indonesia-header.png","magang","internal","5","1","Belum Dikirim");



DROP TABLE tbl_user;

CREATE TABLE `tbl_user` (
  `id_user` tinyint(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `jabatan` varchar(500) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

INSERT INTO tbl_user VALUES("1","admin","21232f297a57a5a743894a0e4a801fc3","Superadmin","-","1","085750251147","Developer");
INSERT INTO tbl_user VALUES("5","staf1","827ccb0eea8a706c4c34a16891f84e7b","Yusup Hidayat","-","2","081254738486","Staf");
INSERT INTO tbl_user VALUES("10","kasubag_uk","21232f297a57a5a743894a0e4a801fc3","Yulinde, S.Hut","197107152001122003","3","-","Kasubag Umum dan Kepegawaian");
INSERT INTO tbl_user VALUES("15","andika","21232f297a57a5a743894a0e4a801fc3","Andika Wahyu, SH","197107152001122003","4","081254738486","Pegawai");



