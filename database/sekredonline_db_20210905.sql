-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2021 at 10:01 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sekredonline_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `md_surat`
--

CREATE TABLE `md_surat` (
  `surat_id` int(11) NOT NULL,
  `nomor_surat` varchar(255) NOT NULL,
  `jenis_surat` int(11) NOT NULL COMMENT '0 = Default; \r\n1 = Undangan Liputan;\r\n2 = Pribadi',
  `kepada` varchar(255) NOT NULL,
  `pengirim` varchar(255) NOT NULL,
  `jabatan_pengirim` varchar(255) NOT NULL,
  `penerima` varchar(255) NOT NULL,
  `jabatan_penerima` varchar(255) NOT NULL,
  `instansi` varchar(255) NOT NULL,
  `tanggal_acara` date NOT NULL,
  `jam_acara` time NOT NULL,
  `tanggal_surat` date NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `pemeriksa` varchar(255) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_attachment_surat`
--

CREATE TABLE `m_attachment_surat` (
  `attachment_id` int(11) NOT NULL,
  `surat_id` int(11) NOT NULL,
  `attachment_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_emp`
--

CREATE TABLE `m_emp` (
  `emp_id` int(11) NOT NULL,
  `emp_nip` varchar(50) NOT NULL,
  `emp_fname` varchar(255) NOT NULL,
  `emp_nname` varchar(255) NOT NULL,
  `emp_photo` varchar(255) NOT NULL,
  `emp_ext` varchar(100) NOT NULL,
  `emp_phone1` varchar(100) NOT NULL,
  `emp_phone2` varchar(100) NOT NULL,
  `emp_jabatan` varchar(255) NOT NULL,
  `emp_program` varchar(255) NOT NULL,
  `emp_dept` varchar(255) NOT NULL,
  `emp_div` varchar(255) NOT NULL,
  `emp_comp` varchar(255) NOT NULL,
  `emp_birth_place` varchar(100) NOT NULL,
  `emp_birth_date` date NOT NULL,
  `emp_nik` varchar(100) NOT NULL,
  `emp_atasan` varchar(255) NOT NULL,
  `emp_atasan_phone` varchar(100) NOT NULL,
  `emp_email1` varchar(255) NOT NULL,
  `emp_email2` varchar(255) NOT NULL,
  `emp_address` text NOT NULL,
  `emp_kontak_darurat_nama` varchar(255) NOT NULL,
  `emp_kontak_darurat_nomor` varchar(100) NOT NULL,
  `emp_passport` varchar(255) NOT NULL,
  `emp_expiry_passport` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_emp`
--

INSERT INTO `m_emp` (`emp_id`, `emp_nip`, `emp_fname`, `emp_nname`, `emp_photo`, `emp_ext`, `emp_phone1`, `emp_phone2`, `emp_jabatan`, `emp_program`, `emp_dept`, `emp_div`, `emp_comp`, `emp_birth_place`, `emp_birth_date`, `emp_nik`, `emp_atasan`, `emp_atasan_phone`, `emp_email1`, `emp_email2`, `emp_address`, `emp_kontak_darurat_nama`, `emp_kontak_darurat_nomor`, `emp_passport`, `emp_expiry_passport`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(1, '9999999', 'Test', 'test', 'd7279b25b84eb3dd89d7e1c384578307.png', '123123', '123123', '123123', 'ardgzsdg', 'sdgfDFSDf', 'zsgzdrg', 'zdfgzsrg', 'zdsfgsrg', 'test', '2021-07-31', '23', 'SDfSDf', '123123', 'sdf@sdf.com', 'asdasd@sdf.com', 'adgs', 'sefdsEF', '123123', 'SDFSEdgf', '2134', 1, '2021-07-29 21:23:49', 1, '2021-07-29 21:36:30'),
(2, '1193755', 'VARUNA DEWI', 'VARUNA EDIT', 'c7c2259b39edf61c309d059a73b0b72b.jpg', '22005', '085358632070', '085358632070', 'PROGRAMMER', 'PROGRAM 1', 'MIS', 'IT', 'METRO TV', 'JAKARTA', '1996-05-06', '1271214506960004', 'HERMANTO SITUMORANG', '0123456789', 'varuna.dewi@metrotvnews.com', 'varuna.dewi@metrotvnews.com', 'JL. ABDUL HAKIM, GG. SETIA NO.16', 'KONTAK DARURAT', '0123456789', '12345678765432', '01/25', 1, '2021-08-07 20:40:02', 1, '2021-08-07 20:41:43'),
(3, '1193726', 'NURUL NOVIANA RAFIKA', 'NURUL', '5e3d063effa7b3257edad6418cbc5193.jpg', '22044', '085719149161', '085719149161', 'EXECUTIVE SECRETARY', 'PROGRAM 1', 'IT INFRASTRUCTURE', 'IT', 'METRO TV', 'BOGOR', '2021-08-16', '3276027011930010', 'ATASAN 1', '0123456789', 'nurul.noviana@metrotvnews.com', 'nurul.noviana@metrotvnews.com', 'JL. CENDRAWASIH NO. 28', 'KONTAK 1', '0123456789', 'Passport', '02/24', 1, '2021-08-16 21:01:13', 1, '2021-08-16 21:01:13'),
(4, '1122050', 'HERMANTO SITUMORANG', 'HERMANTO', '471a2380b84cb8fc76f15bb9241789b5.jpg', '22040', '08128880328', '08128880328', 'PROGRAMMER SECTION HEAD', 'PROGRAM 1', 'MIS', 'IT', 'METRO TV', 'SEI RAKYAT', '1977-09-28', '3276052809770010', 'ATASAN 1', '0123456789', 'hermanto.situmorang@metrotvnews.com', 'hermanto.situmorang@metrotvnews.com', 'KOMPLEK GDC GARDENIA BLOK R5 NO.23', 'KONTAK 1', '0123456789', 'Passport', '02/24', 1, '2021-08-16 22:12:21', 1, '2021-08-16 22:12:21'),
(5, '1234567', 'User Test', 'User', '', '', '', '', 'JABATAN USER', '', '', '', '', 'test', '2021-07-31', '12345678908', '', '', 'seftianalfredo.9@gmail.com', '', '', '', '', '', '', 1, '2021-07-29 21:23:49', 1, '2021-07-29 21:36:30');

-- --------------------------------------------------------

--
-- Table structure for table `m_form`
--

CREATE TABLE `m_form` (
  `form_id` int(11) NOT NULL,
  `form_name` varchar(255) NOT NULL,
  `form_description` text NOT NULL,
  `form_file` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_form`
--

INSERT INTO `m_form` (`form_id`, `form_name`, `form_description`, `form_file`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(1, 'FORM 1', 'KETERANGAN FORM 1', '5c144e166ee4987445a73f59a010185b.pdf', 1, '2021-08-03 23:02:05', 1, '2021-08-03 23:02:05');

-- --------------------------------------------------------

--
-- Table structure for table `m_informasi`
--

CREATE TABLE `m_informasi` (
  `informasi_id` int(11) NOT NULL,
  `informasi_text` varchar(255) NOT NULL,
  `informasi_content` text NOT NULL,
  `is_active` int(11) NOT NULL COMMENT '0 = No; 1 = Yes',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_informasi`
--

INSERT INTO `m_informasi` (`informasi_id`, `informasi_text`, `informasi_content`, `is_active`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(1, 'TEXT YANG TAMPIL DI TEXT 123', 'ISINYA NANTI SEPERTI INI EDIT', 1, 1, '2021-09-05 12:35:04', 1, '2021-09-05 12:35:14'),
(2, 'INFORMASI 2', 'TEXT NYA KAYAK GINI NANTI YANG TAMPIL NIHH TERSERAHHH', 1, 1, '2021-09-05 12:49:24', 1, '2021-09-05 12:49:24');

-- --------------------------------------------------------

--
-- Table structure for table `m_kontributor`
--

CREATE TABLE `m_kontributor` (
  `kontributor_id` int(11) NOT NULL,
  `kontributor_name` varchar(255) NOT NULL,
  `kontributor_gender` varchar(255) NOT NULL,
  `kontributor_birth_place` varchar(255) NOT NULL,
  `kontributor_birth_date` date NOT NULL,
  `kontributor_photo` varchar(255) NOT NULL,
  `kontributor_identity` varchar(255) NOT NULL,
  `kontributor_addr` text NOT NULL,
  `kontributor_addr_kirim` text NOT NULL,
  `kontributor_rek_number` varchar(255) NOT NULL,
  `kontributor_telephone` varchar(255) NOT NULL,
  `kontributor_telephone_2` varchar(255) NOT NULL,
  `kontributor_email` varchar(255) NOT NULL,
  `kontributor_email_2` varchar(255) NOT NULL,
  `kontributor_skype` varchar(255) NOT NULL,
  `kontributor_status` varchar(255) NOT NULL,
  `kontributor_platform` varchar(255) NOT NULL,
  `kontributor_area` varchar(255) NOT NULL,
  `kontributor_wilayah` varchar(255) NOT NULL,
  `kontributor_province` varchar(255) NOT NULL,
  `kontributor_country` varchar(255) NOT NULL,
  `kontributor_entry_date` date NOT NULL,
  `kontributor_ukuran_baju` varchar(100) NOT NULL,
  `kontributor_periode_start` date NOT NULL,
  `kontributor_periode_end` date NOT NULL,
  `kontributor_file` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_kontributor`
--

INSERT INTO `m_kontributor` (`kontributor_id`, `kontributor_name`, `kontributor_gender`, `kontributor_birth_place`, `kontributor_birth_date`, `kontributor_photo`, `kontributor_identity`, `kontributor_addr`, `kontributor_addr_kirim`, `kontributor_rek_number`, `kontributor_telephone`, `kontributor_telephone_2`, `kontributor_email`, `kontributor_email_2`, `kontributor_skype`, `kontributor_status`, `kontributor_platform`, `kontributor_area`, `kontributor_wilayah`, `kontributor_province`, `kontributor_country`, `kontributor_entry_date`, `kontributor_ukuran_baju`, `kontributor_periode_start`, `kontributor_periode_end`, `kontributor_file`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(1, 'Amiruddin Abdullah', 'Laki Laki', '', '0000-00-00', '', '', 'Desa Neulop Reubee, Kecamatan Delima, Kabupaten Pidie, Aceh', 'Desa Neulop Reubee, Kecamatan Delima, Kabupaten Pidie, Aceh', ' BRI SYARIAH 1051876918', '08126957241', '', 'amiruddin_abd@yahoo.com', '', '', 'Media Indonesia', 'Aktif', 'Pidie', 'Daerah', 'Aceh', 'Indonesia', '2007-03-01', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(2, 'Hendra Saputra', 'Laki Laki', '', '0000-00-00', '', '', 'Jalan Ateuk Jawo no 15. Desa Ateuk Deah Tanoh,  Baiturrahman, Banda Aceh', 'Jalan Ateuk Jawo no 15. Desa Ateuk Deah Tanoh,  Baiturrahman, Banda Aceh', 'Mandiri 1580000316307 ', '', '', 'hendra105@gmail.com', 'saputra@mediaindonesia.com', '', 'Media Indonesia', 'Aktif', 'Banda Aceh', 'Daerah', 'Aceh', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(3, 'Fajri Fatmawati', 'Perempuan', 'Banda Aceh', '1991-06-07', '', '1171084607910001', 'Jalan Cut Nyak Dhien, Lorong Cendawan, Nomor 65, Desa Lamtemen Barat, Kecamatan Jaya Baru, Kota Banda Aceh, Provinsi Aceh.', 'Jalan Cut Nyak Dhien, Lorong Cendawan, Nomor 65, Desa Lamtemen Barat, Kecamatan Jaya Baru, Kota Banda Aceh, Provinsi Aceh.', 'BNI Syariah 8357595480', '082310793677', '', 'fajriwaty@gmail.com', '', '', 'Medcom', 'Aktif', 'Aceh', 'Daerah', 'Aceh', 'Indonesia', '2019-01-01', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(4, 'Erdian Joko Kuswanto', 'Laki Laki', 'Meulaboh', '1981-12-03', '', '1175010312810001', ' Jl. Teuku Umar, Gang Terang Bulan No.12A, Kota Subulussalam - Aceh', ' Jl. Teuku Umar, Gang Terang Bulan No.12A, Kota Subulussalam - Aceh', 'BRI : 3526-01018032-535', '081265412323', '', 'erdian_jk@yahoo.co.id', 'Erdianmetrotv@gmail.com', '', 'Metro TV', 'Aktif', 'KOTA SUBULUSSALAM DAN KAB, ACEH SELATAN/ TAPAK TUAN', 'Daerah', 'Aceh', 'Indonesia', '2006-03-26', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(5, 'Dicky Juanda', 'Laki Laki', 'Banda Aceh', '1988-10-02', '', '1171070210880001', 'Jl. Kesatria, Lorong Keluarga Desa Geuceu Komplek Kec. Banda Raya Kota Banda Aceh. Kode Pos 23239', 'Jl. Kesatria. Lorong Keluarga Desa Geuceu Komplek Kec. Banda Raya Kota Banda Aceh. Kode Pos 23239', 'BRI : 3340.01.021805.53.3', '081264280280', '', 'dickyjuanda021088@gmail.com', '', 'dickyjuanda', 'Metro TV', 'Aktif', 'KABUPATEN ACEH BARAT DAN NAGAN RAYA', 'Daerah', 'Aceh', 'Indonesia', '2014-12-02', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(6, 'Faizi Woyla', 'Laki Laki', 'Paya Luah', '1989-06-02', '', '', 'Jln. Sukarela No.21 Desa Padang Hilir, Kecamatan Susoh,Kabupaten Aceh Barat Daya, Provinsi Aceh\n\n', 'Jln. Sukarela No.21 Desa Padang Hilir, Kecamatan Susoh,Kabupaten Aceh Barat Daya, Provinsi Aceh\n\n', 'Mandiri 158-00-0425847-1', '085359047322', '', 'faizi.meulaboh@gmail.com', '', '', 'Metro TV', 'Aktif', 'KAB. ACEH BARAT DAYA & NAGAN RAYA - ACEH', 'Daerah', 'Aceh', 'Indonesia', '2019-08-01', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(7, 'Firman', 'Laki Laki', 'Pidie', '1987-04-12', '', '', 'Alamat Kantor Persatuan Wartawan Indonesia (PWI) Sigli, Jalan Lingkar - Blang Paseh, Gampong Lampeudeu Baroh, Kecamatan Pidie, Kabupaten Pidie, Aceh', 'Alamat Kantor Persatuan Wartawan Indonesia (PWI) Sigli, Jalan Lingkar - Blang Paseh, Gampong Lampeudeu Baroh, Kecamatan Pidie, Kabupaten Pidie, Aceh', 'MANDIRI 158.00.0423716.0', '085260812464', '', 'firmanpaloh208@gmail.com', '', '', 'Metro TV', 'Aktif', 'KAB. ACEH PIDIE - ACEH', 'Daerah', 'Aceh', 'Indonesia', '2019-08-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(8, 'Ilhami', 'Laki Laki', 'Kecamatan Samalanga', '1984-04-14', '', '1111011404840001', 'Dusun Lhoknga, Desa Mesjid Tuha, Kecamatan Meureudu, Kabupaten Pidie Jaya- Aceh \n', 'Dusun Lhoknga, Desa Mesjid Tuha, Kecamatan Meureudu, Kabupaten Pidie Jaya- Aceh \n', 'Mandiri : 158.000.243.8463', '082361844483', '', 'ilham.agc@gmail.com', '', 'ilhami pidie', 'Metro TV', 'Aktif', 'KABUPATEN PIDIE JAYA /MEUREDU', 'Daerah', 'Aceh', 'Indonesia', '2014-12-02', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(9, 'Mahyuddin', 'Laki Laki', 'Kuta Binje', '1979-04-14', '', '', '', '', 'Mandiri 158.000.399.815.0 ', '082370500102', '', 'mahyuddinkenon@gmail.com', '', '', 'Metro TV', 'Aktif', 'LANGSA - ACEH', 'Daerah', 'Aceh', 'Indonesia', '2019-08-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(10, 'Muhammad MY', 'Laki Laki', 'Meudang Keureusek', '1989-03-10', '', '1108021003890000', 'Dusun Simpang KKA, Paloh Lada, Dewantara, Aceh Utara ', 'Kantor PWI Bireuen, Jln. Sultan Iskandar Muda no. 11, Kota Juang, Bireuen, Aceh. Hp. 0852-7685-3962', 'Mandiri : 158.000.149.8054', '085276853962', '', 'mamad.my@gmail.com', '', 'mamad_my?', 'Metro TV', 'Aktif', 'KABUPATEN BIREUN / BIREUN', 'Daerah', 'Aceh', 'Indonesia', '2015-08-27', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(11, 'Muhammad Zakaria', 'Laki Laki', '', '0000-00-00', '', '', '', '', 'MANDIRI : 158.000.349.405.1', '082165669882', '', '', '', '', 'Metro TV', 'Aktif', 'BENER MERIAH, ACEH TENGAH', 'Daerah', 'Aceh', 'Indonesia', '0000-00-00', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(12, 'Mujiburrahman ', 'Laki Laki', 'Bandung', '1971-04-14', '', '1116021404710002', 'Desa Tanjung Lipat. I, Kecamatan Bendahara Aceh Tamiang. Kode Pos 24475', 'Warkop Corner Coffee, Karang Baru, Aceh Tamiang - 24476', 'BNI : \'025.707.854.3', '085374151788', '', 'mujib.tamiang@gmail.com ', '', '', 'Metro TV', 'Aktif', 'KABUPATEN ACEH TAMIANG / KARANG BARU', 'Daerah', 'Aceh', 'Indonesia', '2013-12-04', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(13, 'Mulyadi', 'Laki Laki', 'Sigli', '1979-03-06', '', '1103030603790000', 'Dusun Lhok Bani Desa Keude Aceh Kec Idi Rayeuk ', 'METRO TV ACEH. JL. SOEKARNO HATTA, DESA LAMSAYEUN, NO. 50, KEC. INGIN JAYA, KAB ACEH BESAR. KODE POS 23371, ACEH.', 'Mandiri 158-00-0339185-1', '082364070600', '', 'mulya.metrotv@gmail.com', 'catatanmulya@gmail.com', '', 'Metro TV', 'Aktif', 'KOTA BANDA ACEH DAN ACEH BESAR / JANTHO', 'Daerah', 'Aceh', 'Indonesia', '2017-04-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(14, 'Selamet Abdullah', 'Laki Laki', 'Acehh Utara', '1993-07-19', '', '', '', '', 'BANK :ACEH SYARIAH 620.02.20.016044-0', '085297542709', '', 'adulthebadolz93@gmail.com', '', '', 'Metro TV', 'Aktif', 'LHOKSEUMAWE - ACEH', 'Daerah', 'Aceh', 'Indonesia', '2019-08-01', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(15, 'Surya Dharma', 'Laki Laki', 'Medan', '1976-07-08', '', '1207280807760001', 'Jl. Pantai Labu, Dusun Sadar Timur, Desa Sekip, Kecamatan Lubuk Pakam Kab. Deli Serdang 20517 ', 'Jl. Sadar Timur, Gg. Amanah No.061, Desa Sekip, Kec. Lubuk Pakam, Kab. Deli Serdang, Sumatera Utara, Kode Pos 20517', 'MANDIRI : 105-000-583-5628', '081375599356', '', 'surya76_deliserdang@yahoo.com', 'surya.metrotvdeliserdang@gmail.com', 'Surya Dharma', 'Metro TV', 'Aktif', 'DELI SERDANG, SERDANG BEDAGAI', 'Daerah', 'Sumatera Utara', 'Indonesia', '2005-03-15', 'XXXL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(16, 'Ahmed Arfiansyah', 'Laki Laki', '', '0000-00-00', '', '1401040101770030', 'Jl. Tangguk Bongkar III No. 74, Kelurahan Tegal Sari, Perumnas Mandala II,  Kecamatan Medan Denai, Medan, Sumatera Utara Kode Pos 20226\n\n\n', 'Jl. Tangguk Bongkar III No. 74, Kelurahan Tegal Sari, Perumnas Mandala II,  Kecamatan Medan Denai, Medan, Sumatera Utara Kode Pos 20226\n\n\n', 'MANDIRI : 106.00.1073230.6', '081376989543', '', 'ahmedarfiansyah@yahoo.co.id', '', 'ahmedarfiansyah', 'Metro TV', 'Aktif', 'MEDAN SUNGGAL', 'Daerah', 'Sumatera Utara', 'Indonesia', '2014-01-08', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(17, 'Catur Hariono', 'Laki Laki', 'Kisaran ', '1976-02-21', '', '1207022102760004', 'Jl. Pandan Lk. III Kel. Tambangan Kec. Padang Hilir, Kota Tebing Tinggi, Sumatera Utara Kode Pos 20631', 'Jl. Pandan Lk. III Kel. Tambangan Kec. Padang Hilir, Kota Tebing Tinggi, Sumatera Utara Kode Pos 20631', 'MANDIRI : 105.00.1078154.4', '085262213534', '', 'catoer_1976@yahoo.co.id', '', 'arie_metro', 'Metro TV', 'Aktif', 'TEBING TINGGI, BATU BARA', 'Daerah', 'Sumatera Utara', 'Indonesia', '2012-11-01', 'XXL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(18, 'Daniel Simanjutak', 'Laki Laki', 'Gunungsitoli', '1986-01-25', '', '1204012501860000', 'Zakk Foto Studio, Jalan Pasir Putih (depan praktek dokter Henni Duha) kecamatan Teluk dalam kabupaten Nias Selatan kode pos 22865', 'Zakk Foto Studio, Jalan Pasir Putih (depan praktek dokter Henni Duha) kecamatan Teluk dalam kabupaten Nias Selatan kode pos 22865', 'BNI 0189.979.656', '081362152919', '', 'dhanil.2511@gmail.com', '', '', 'Metro TV', 'Aktif', 'KEPULAUAN NIAS', 'Daerah', 'Sumatera Utara', 'Indonesia', '2019-08-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(19, 'Darwis Damanik', 'Laki Laki', 'Medan', '1990-02-02', '', '1271110202900000', 'Jalan Medan, Simpang Mesjid, Perumahan Graha Asido Daharo No.72, Kelurahan Nagapita, Kecamatan Siantar Martoba, Kota Pematangsiantar, Sumatera Utara\n', 'Jalan Medan, Simpang Mesjid, Perumahan Graha Asido Daharo No.72, Kelurahan Nagapita, Kecamatan Siantar Martoba, Kota Pematangsiantar, Sumatera Utara\n', 'MANDIRI : 107-00-0672820-0', '085297028496', '082167508052', 'Darwistvdamanik@gmail.com', '', 'Darwis Damanik', 'Metro TV', 'Aktif', 'KOTA PEMATANG SIANTAR DAN KAB SUMALUNGUN', 'Daerah', 'Sumatera Utara', 'Indonesia', '2014-05-07', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(20, 'Edikania Zega', 'Laki Laki', 'Hilibanua', '1990-04-15', '', '', 'Jl. Yos Sudarso No. 178 (Samping Gereja Hosiana) Kel. Saombo, Kec. Gunungsitoli, Kota Gunungsitoli, Sumut.\nKode Pos 22815', 'Jl. Yos Sudarso No. 178 (Samping Gereja Hosiana) Kel. Saombo, Kec. Gunungsitoli, Kota Gunungsitoli, Sumut.\nKode Pos 22815', 'Mandiri 107.00.1256300.5', '085275499233', '', 'edy90.nias@gmail.com', '', '', 'Metro TV', 'Aktif', 'KAB NIAS, NIAS UTARA DAN GN SITOLI', 'Daerah', 'Sumatera Utara', 'Indonesia', '2019-08-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(21, 'Endang Junaidi', 'Laki Laki', 'Binjai ', '1979-06-03', '', '1205070306790009', 'Komplek Tasri Blok C, No 34 Kelurahan Perdamaian, Kec. Stabat, Kab. Langkat, Sumut Kode Pos 20814 ', 'Komplek Tasri Blok C, No 34 Kelurahan Perdamaian, Kec. Stabat, Kab. Langkat, Sumut Kode Pos 20814 ', 'MANDIRI : 106-000-430-2587', '0811646177', '', 'endanglangkat@gmail.com', '', 'endangjunaidilangkat', 'Metro TV', 'Aktif', 'LANGKAT, BINJAI', 'Daerah', 'Sumatera Utara', 'Indonesia', '2005-02-01', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(22, 'Ferry Irawan', 'Laki Laki', 'B. Serbangan ', '1974-11-05', '', '', 'Jalan Protokol No. 64, Pasar XII, Kelurahan Binjai Serbangan, Kecamatan Airjoman, Kabupaten Asahan, Sumatera Utara \nKode pos 21263', 'Jalan Protokol No. 64, Pasar XII, Kelurahan Binjai Serbangan, Kecamatan Airjoman, Kabupaten Asahan, Sumatera Utara \nKode pos 21263', 'BRI 5283 01 032775 535', '085270386151', '', 'ferrymatondang365@gmail.com', '', '', 'Metro TV', 'Aktif', 'TANJUNG BALAI - SUMATERA UTARA', 'Daerah', 'Sumatera Utara', 'Indonesia', '2019-08-01', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(23, 'Hendri Fauzi ', 'Laki Laki', 'Medan', '1983-03-06', '', '1207260603830024', 'JL. Beringin Gg.Tempua No. 5 Pasar VII Tembung, Deli Serdang, Sumatera Utara', 'JL. Beringin Gg.Tempua No. 5 Pasar VII Tembung, Deli Serdang, Sumatera Utara', 'MANDIRI : 106-000-6986-569', '081362160704', '', 'hfmedan@yahoo.co.id', 'hendri.metrotvmedan@gmail.com', 'gohendri', 'Metro TV', 'Aktif', 'KOTA MEDAN', 'Daerah', 'Sumatera Utara', 'Indonesia', '2008-01-01', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(24, 'Kepin Sinaga', 'Laki Laki', 'Medan', '1990-04-06', '', '', 'Dusun Tiga Perkebunan Normark, Desa Perkebunan Normark, Kecamatan Kota Pinang, Kabupaten Labuhan Batu Selatan, Sumatera Utara.', 'Dusun Tiga Perkebunan Normark, Desa Perkebunan Normark, Kecamatan Kota Pinang, Kabupaten Labuhan Batu Selatan, Sumatera Utara.', 'Mandiri 1050012855536', '081375233843', '', 'vin.7naga90@gmail.com', '', '', 'Metro TV', 'Aktif', 'LABUHAN BATU SELATAN, SUMUT', 'Daerah', 'Sumatera Utara', 'Indonesia', '2019-08-01', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(25, 'Khottob Nasution', 'Laki Laki', '', '0000-00-00', '', '', 'Jl. AND, Gg. Damai (Belakang Masjid Nurul Hikmah), Kel. Kalangan, Kec. Pandan, Tapanuli Tengah, Sumatera Utara', 'Jl. AND, Gg. Damai (Belakang Masjid Nurul Hikmah), Kel. Kalangan, Kec. Pandan, Tapanuli Tengah, Sumatera Utara', 'BRI : 0085-01-008155-508', '08126478056', '081265449182', 'khottob_nst@yahoo.com', '', '\nKhottob Nasution', 'Metro TV', 'Aktif', 'SIBOLGA, TAPANULI TENGAH', 'Daerah', 'Sumatera Utara', 'Indonesia', '2005-08-08', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(26, 'Koko Hendrawan', 'Laki Laki', 'Medan', '1981-07-23', '', '1271202307810000', 'Jl. Bambu No 33 Kel. Gaharu Kec. Medan Timur, Medan 20235', 'Jl. Bambu No 33 Kel. Gaharu Kec. Medan Timur, Medan 20235', 'MANDIRI : 106.000.971236.8', '081264531359', '', 'koko.zava@yahoo.co.id', '', '', 'Metro TV', 'Aktif', 'BELAWAN', 'Daerah', 'Sumatera Utara', 'Indonesia', '2014-01-08', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(27, 'M. Harizal', 'Laki Laki', 'Alahan Panjang', '1975-01-30', '', '1271103001750000', 'Jl. Puri No. 253-A/145 Kel. Kota Matsum 1, Kec. Medan Area, Medan, Sumatera Utara', 'Jl. Puri No. 253-A/145 Kel. Kota Matsum 1, Kec. Medan Area, Medan, Sumatera Utara', 'MANDIRI : 105-000-527-3028', '08126565954', '081265659541', 'rizalhari@yahoo.com', 'harizalmedan@gmail.com', 'harizalmedan', 'Metro TV', 'Aktif', 'KOTA MEDAN', 'Daerah', 'Sumatera Utara', 'Indonesia', '2009-08-02', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(28, 'Muhammad Zulfahmi', 'Laki Laki', 'Binjai ', '1985-08-17', '', '127501170885003', 'Jl. Gunung Jaya Wijaya No. 141 Kel. Binjai Estate, Kec. Binjai Selatan, Kota Binjai, Sumatera Utara', 'Jl. Gunung Jaya Wijaya No. 141 Kel. Binjai Estate, Kec. Binjai Selatan, Kota Binjai, Sumatera Utara', 'MANDIRI : 106-000-663607-3', '081264864485', '', 'iyongmetro@yahoo.co.id', '', 'Muhammad zulfahmi Zulfahmi', 'Metro TV', 'Aktif', 'KOTA MEDAN', 'Daerah', 'Sumatera Utara', 'Indonesia', '2007-06-02', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(29, 'Puji Santoso', 'Laki Laki', 'Sukoharjo', '1968-04-21', '', '1271192104680000', 'Jln. Garuda Gang Sidarum no 70-A, Sei Sikambing, Medan Sunggal, kota Medan', 'Jln. Garuda Gang Sidarum no 70-A, Sei Sikambing, Medan Sunggal, kota Medan', 'Mandiri 105.001.405.054-0 ', '08126365405', '', 'puji@mediaindonesia.com', 'sayapujisantoso@gmail.com', '', 'Media Indonesia', 'Aktif', 'Medan', 'Daerah', 'Sumatera Utara', 'Indonesia', '2014-02-10', 'XXL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(30, 'Januari Hutabarat', 'Laki Laki', 'Padang Sidempuan', '1973-01-14', '', '1202141401730000', 'Jalan Sisinga Mangaraja Nomor : 193  Tarutung Kabupaten, Tapanuli Utara-Sumut.', 'Jalan Sisinga Mangaraja Nomor : 193  Tarutung Kabupaten, Tapanuli Utara-Sumut.', 'MANDIRI 107-00-0743854-4 ', '081260690797', '', 'januari@mediaindonesia.com', 'hutabaratjanuari@yahoo.com, ', '', 'Media Indonesia', 'Aktif', 'Taput', 'Daerah', 'Sumatera Utara', 'Indonesia', '2011-05-03', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(31, 'Apul Iskandar S', 'Laki Laki', 'Padang Sidempuan', '1971-09-17', '', '3173061709711000', 'Villa Viyata Yudha No. 66 Kelurahan Setia Negara Kecamatan Siantar Sitalasari Pematangsiantar Sumut', 'Villa Viyata Yudha No. 66 Kelurahan Setia Negara Kecamatan Siantar Sitalasari Pematangsiantar Sumut', 'Mandiri A/N Monica Sulastiati Adibrata 129.001.128.035-7 ', '0811628788', '', 'ais.belvania88@gmail.com', '', '', 'Media Indonesia', 'Aktif', 'Pematang Siantar', 'Daerah', 'Sumatera Utara', 'Indonesia', '2020-08-25', 'XXL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(32, 'Ricky Zulkarnain', 'Laki Laki', '', '0000-00-00', '', '1213012412820003', ' Jl. Medan-Padang, Gang Madrasah No. 93, Desa Parbangunan, Kec. Panyabungan, Kab. Mandailing Natal, Sumatera Utara ', ' Jl. Medan-Padang, Gang Madrasah No. 93, Desa Parbangunan, Kec. Panyabungan, Kab. Mandailing Natal, Sumatera Utara ', 'Mandiri Syariah : 7012728705', '081361377236', '', 'riky_lbs@yahoo.co.id', '', '081361956236', 'Metro TV', 'Aktif', 'PAYABUNGAN, PADANG LAWAS', 'Daerah', 'Sumatera Utara', 'Indonesia', '2013-01-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(33, 'Rinaldi Hafianto Tarigan', 'Laki Laki', 'Berastagi', '1976-07-31', '', '1206023107760002', 'Jl. Perwira (Rumah Buah) Sp. Kaliaga Berastagi, Kab. Karo, Medan, Sumatera Utara 22156\n', 'Jl. Perwira (Rumah Buah) Sp. Kaliaga Berastagi, Kab. Karo, Medan, Sumatera Utara 22156\n', 'MANDIRI : 105.001.0252.553', '081263354486', '', 'rinaldi_tgn@yahoo.com', '', 'naldi762', 'Metro TV', 'Aktif', 'TANAH KARO', 'Daerah', 'Sumatera Utara', 'Indonesia', '2009-09-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(34, 'Rudi Anto Sinaga', 'Laki Laki', 'Galang', '1982-10-20', '', '1211012010820005', ' Jl. Mandiri Panji Bako, Desa Sitinjo II Kec. Sitinjo, Kab. Dairi, Sumatera Utara', ' Jl. Mandiri Panji Bako, Desa Sitinjo II Kec. Sitinjo, Kab. Dairi, Sumatera Utara', 'BRI : 0194.0103.7492.500', '0821643490007', '', 'kap_dur@yahoo.com', '', '', 'Metro TV', 'Aktif', 'SIDIKALANG DAN KAB PAKPAK BHARAT', 'Daerah', 'Sumatera Utara', 'Indonesia', '2015-09-03', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(35, 'Sulaiman Siregar', 'Laki Laki', 'Tegal', '1979-01-14', '', '1220071401790001', 'Pasar Matanggor, Kec. Batang Onang, Padang Lawas Utara, Sumatera Utara ', 'Pasar Matanggor, Kec. Batang Onang, Padang Lawas Utara, Sumatera Utara ', 'MANDIRI : 107-00-0409836.6', '081361308779', '', 'lemanmetrotv@yahoo.co.id', '', '', 'Metro TV', 'Aktif', 'PADANG SIDEMPUAN', 'Daerah', 'Sumatera Utara', 'Indonesia', '2006-08-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(36, 'Teguh Angga Aditia Panjaitan', 'Laki Laki', '', '0000-00-00', '', '', 'Jl. Karya Jaya Gang Eka Famili No. 141 Kel. Gedung Johor, Kec. Medan Johor, Kota Medan, Sumatera Utara', 'Jl. Karya Jaya Gang Eka Famili No. 141 Kel. Gedung Johor, Kec. Medan Johor, Kota Medan, Sumatera Utara', 'MANDIRI 106-00-1240319-5', '082273083796', '', 'teguhpanjaitan92@gmail.com', '', '', 'Metro TV', 'Aktif', 'KOTA MEDAN', 'Daerah', 'Sumatera Utara', 'Indonesia', '2017-10-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(37, 'Tulus Pauli Sibuea', 'Laki Laki', 'Laut Tador', '1976-08-03', '', '1202020308760001', 'Jl. Marhusa Panggabean Lumban Tonga II Desa Pansur Napitu Kec. Siatas Barita, Tapanuli Utara', 'Jl. Marhusa Panggabean Lumban Tonga II Desa Pansur Napitu Kec. Siatas Barita, Tapanuli Utara', 'BNI : 012.397.5773', '081396350600', '', 'sibuea_metro@yahoo.com', '', '', 'Metro TV', 'Aktif', 'TAPANULI UTARA, TOBASA', 'Daerah', 'Sumatera Utara', 'Indonesia', '2007-02-14', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(38, 'Yoseph Pencawan', 'Laki Laki', '', '0000-00-00', '', '', 'Istana Bisnis Centre No. 6 Medan RT/RW 000/000, Sukaraja Kec. Medan Maimun Kota medan', 'Istana Bisnis Centre No. 6 Medan RT/RW 000/000, Sukaraja Kec. Medan Maimun Kota medan', 'BCA 061.263.120-2 ', '085370082081', '', 'yosep@mediaindonesia.com', '', '', 'Media Indonesia', 'Aktif', 'Medan', 'Daerah', 'Sumatera Utara', 'Indonesia', '2018-07-30', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(39, 'Apriyal', 'Laki Laki', 'Pekanbaru', '1986-11-13', '', '1471041311860001', 'Jl. Bangau No. 160 Perum Sidomulya Kec. Marpoyan Damai, Pekanbaru, Riau', 'Jl. Bangau No. 160 Perum Sidomulya Kec. Marpoyan Damai, Pekanbaru, Riau', 'MANDIRI : 108.001.2335809', '081378734386', '', 'apriyal302@gmail.com', '', 'apriyal.kampar', 'Metro TV', 'Aktif', 'KAMPAR', 'Daerah', 'Riau', 'Indonesia', '2012-11-13', 'XXL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(40, 'Bagus Himawan ', 'Laki Laki', '', '0000-00-00', '', '', '', '', '', '081365233309', '', '', '', '', 'Media Indonesia', 'Aktif', '', 'Daerah', 'Riau', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(41, 'Despandri', 'Laki Laki', 'Tandun', '1977-01-01', '', '1401040101770030', 'Kantor Tiki Tandun Jl. Raya Tandun Kec. Tandun Kab. Rokan Hulu Riau 28454 ', 'Kantor Tiki Tandun Jl. Raya Tandun Kec. Tandun Kab. Rokan Hulu Riau 28454 ', 'MANDIRI : 108.00.1108048.9', '085272238901', '', 'pencerah75@gmail.com', '', 'dedes.metrotv', 'Metro TV', 'Aktif', 'ROKAN HULU', 'Daerah', 'Riau', 'Indonesia', '2014-01-08', 'XXL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(42, 'Fitra Asrirama', 'Laki Laki', '', '0000-00-00', '', '', 'Jl. Wonosari Gg. Nasari No. 4, Tangkerang Selatan, Pekanbaru, Riau', 'Jl. Wonosari Gg. Nasari No. 4, Tangkerang Selatan, Pekanbaru, Riau', 'BCA : 034.147.6096', '08127616057', '', 'billy_the_target@yahoo.com', '', '', 'Metro TV', 'Aktif', 'KOTA PEKANBARU', 'Daerah', 'Riau', 'Indonesia', '2002-04-01', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(43, 'Rudi Kurniawansyah', 'Laki Laki', '', '0000-00-00', '', '', '', '', '', '082386322086', '', '', '', '', 'Media Indonesia', 'Aktif', '', 'Daerah', 'Riau', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(44, 'Agus Fahturrohman', 'Laki Laki', 'Cilacap', '1982-08-18', '', '2171021808820002', 'Perum Frensiana Garden Blok C No. 15, Batam Center, Kota Batam, Kepulauan Riau', 'Perum Frensiana Garden Blok C No. 15, Batam Center, Kota Batam, Kepulauan Riau', 'MANDIRI : 109.00.1220681.9', '081391000757', '', 'e_7_us@yahoo.com', '', 'initentangguebro', 'Metro TV', 'Aktif', 'BATAM', 'Daerah', 'Kepulauan Riau', 'Indonesia', '2008-05-17', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(45, 'Anwar Sadat Guna ', 'Laki Laki', '', '0000-00-00', '', '', 'Perumahan Bukit Palem Permai Blok N2 No 17, Batam Centre, Kota Batam', 'Perumahan Bukit Palem Permai Blok N2 No 17, Batam Centre, Kota Batam', 'Mandiri 9000029547354', '081372022799', '', 'sahabatpena78@gmail.com', '', '', 'Medcom', 'Aktif', 'Batam, Kepri', 'Daerah', 'Kepulauan Riau', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(46, 'Hendri Kremer ', 'Laki Laki', '', '0000-00-00', '', '', 'TIBAN DIAMOND, BLOK CG NO 11, KECAMATAN SEKUPANG, KOTA BATAM, KEPRI.', 'TIBAN DIAMOND, BLOK CG NO 11, KECAMATAN SEKUPANG, KOTA BATAM, KEPRI.', 'MANDIRI 109.001.857.576-1 ', '0811693084', '082169172929', 'hendrikremer@mediaindonesia.com', 'hendrikremer@yahoo.com', '', 'Media Indonesia', 'Aktif', 'Batam, Kepri', 'Daerah', 'Kepulauan Riau', 'Indonesia', '2002-02-01', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(47, 'Panca Bramasto', 'Laki Laki', '', '0000-00-00', '', '', 'Perumahan Bida Asri 1 Blok B1 No. 32 Kec. Batam, Kota Batam ', 'Perumahan Bandara Mas, Blok E4 No. 9 Kelurahan Belian, Kecamatan Batam Kota, Batam - Kepulauan Riau.', 'MANDIRI 1090.01234.0931', '082170453398', '', 'bramastopanca@gmail.com', '', 'panca bramasto', 'Metro TV', 'Aktif', 'TANJUNG PINANG', 'Daerah', 'Kepulauan Riau', 'Indonesia', '2016-05-25', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(48, 'Afriyandi', 'Laki Laki', 'Padang', '1970-04-13', '', '', 'Komplek Permata Gurun Laweh Blok E /2, Kec. Nanggalo, Padang ', 'Komplek Permata Gurun Laweh Blok E /2, Kec. Nanggalo, Padang ', 'BCA : 032.079.2088', '08126783846  ', '', 'andi_metrotv@yahoo.com', '', 'andi_padang', 'Metro TV', 'Aktif', 'PESISIR SELATAN, PAINAN', 'Daerah', 'Sumatera Barat', 'Indonesia', '2002-11-02', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(49, 'Bonar Harahap', 'Laki Laki', 'Medan', '1976-08-06', '', '1371090608760011', 'Jl. Mangga V No. 379 RT 04/ RW 10 Perumahan Belimbing, Kel. Kuranji, Kec. Kuranji, Kota Padang, Sumatera Barat ', 'Jl. Mangga V No. 379 RT 04/ RW 10 Perumahan Belimbing, Kel. Kuranji, Kec. Kuranji, Kota Padang, Sumatera Barat ', 'MANDIRI : 111-000-211-0720', '08126717645', '(0751) 7837183', ' bonarmetro@gmail.com', '', 'bonarpadang', 'Metro TV', 'Aktif', 'PADANG, PARIAMAN', 'Daerah', 'Sumatera Barat', 'Indonesia', '2002-11-22', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(50, 'Gusri El Faishal', 'Laki Laki', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', 'Metro TV', 'Aktif', 'Bukti Tinggi', 'Daerah', 'Sumatera Barat', 'Indonesia', '0000-00-00', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(51, 'Yose Hendra', 'Laki Laki', 'Tanjung Barulak', '1985-09-26', '', '1304022609850000', 'Jalan Koto Kaciak RT 04/ RW 010, Kel. Mata Air, Kec. Padang Selatan Kota Padang, Sumatra Barat', 'Jalan Koto Kaciak RT 04/ RW 010, Kel. Mata Air, Kec. Padang Selatan Kota Padang, Sumatra Barat', 'Mandiri 111.000.693.774-8 ', '081363078894', '', 'yose@mediaindonesia.com', 'yosehendra85@gmail.com', '', 'Media Indonesia', 'Aktif', 'Padang', 'Daerah', 'Sumatera Barat', 'Indonesia', '2010-01-01', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(52, 'Andi Iskandar Akbar', 'Laki Laki', 'Palembang', '1983-12-10', '', '', 'Dusun III Rt. 002 Desa Kace Kec. Mendo Barat Kab. Bangka Prov Babel', 'Sekretariat IJTI Babel Ruko Graha Asri Nomor A Jalan Soekarno Hatta (Depan Novotel Bangka) 33684 Pangkalanbaru Kabupaten Bangka Tengah Provinsi Kep Babel', 'BCA 041.096.8029', '085273430043', '08117170043', 'andi.andionesia@gmail.com', '', '', 'Metro TV', 'Aktif', 'Kota Pangkalpinang, Kab. Bangka, Kab. Bangka Tengah, Kab. Belitung, Kab. Belitung Timur, Kab. Bangka Barat, Kab. Bangka Selatan ', 'Daerah', 'Kepulauan Bangka Belitung', 'Indonesia', '2017-02-01', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(53, 'Rendy Ferdiansyah ', 'Laki Laki', 'Pangkal Pinang', '1979-08-27', '', '1971032708770000', 'Jalan Batin Tikal  Senang Hati RT. 3 Sungailiat Bangka', 'Jalan Batin Tikal  Senang Hati RT. 3 Sungailiat Bangka', 'Mandiri 1120005711366 ', '081368615579', '', 'rendy@mediaindonesia.com', 'babel.rndy@gmail.com', '', 'Media Indonesia', 'Aktif', 'Pangkal Pinang', 'Daerah', 'Kepulauan Bangka Belitung', 'Indonesia', '2003-10-27', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(54, 'Syamsul Bahri', 'Laki Laki', 'Jambi', '1966-12-11', '', '1,50501E+15', 'Perumahan Namura Indah 3  Blok E 149 RT. 09 Desa Pematang Gajah, Kec. Jambi Luar, Jambi', 'Perumahan Namura Indah 3  Blok E 149 RT. 09 Desa Pematang Gajah, Kec. Jambi Luar, Jambi', 'MANDIRI: 1100005913386', '081366293149', '', 'bahrisyamsul70@yahoo.com', '', '', 'Metro TV', 'Aktif', 'MERANGIN', 'Daerah', 'Jambi', 'Indonesia', '2009-06-01', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(55, 'Afrizal ', 'Laki Laki', '', '0000-00-00', '', '', 'Jl. Letkol Saman Idris, Rt.01 No. 39,kel.Sei Putri - kec. Telanaipura, Kota Jamb. No HP: 0852 666 86 555', 'Jl. Letkol Saman Idris, Rt.01 No. 39,kel.Sei Putri - kec. Telanaipura, Kota Jamb. No HP: 0852 666 86 555', 'MANDIRI : 900.002.578.4282', '085266686555', '', 'boyafrizal_69@yahoo.co.id', '', 'afrizal boy', 'Metro TV', 'Aktif', 'MUARO JAMBI', 'Daerah', 'Jambi', 'Indonesia', '2015-08-27', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(56, 'Fendry Hasari', 'Laki Laki', 'Sleman', '1985-03-16', '', '', 'Desa Koto Tengah Rt. 004, Kec. Danau Kerinci, Kab. Kerinci', 'Desa Koto Tengah Rt. 004, Kec. Danau Kerinci, Kab. Kerinci', 'BRI : 0117-01.013350538\n', '085266262091', '', 'rimbo.simpang@gmail.com', '', 'fendry fendry ', 'Metro TV', 'Aktif', 'KERINCI', 'Daerah', 'Jambi', 'Indonesia', '2015-08-27', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(57, 'Untung Iskandar', 'Laki Laki', 'Jambi', '1982-11-04', '', '1571010411820021', 'Jl. Kapten Pattimura, Lorong Langgar Masjid Al-Ikhlas, (Langgar Amanah) Depan Apotik k24 Sipin. RT 11/04, Kel. Simpang IV Sipin, Kec. Telanaipura, Kota jambi (36124).\n\n', 'Jl. Kapten Pattimura, Lorong Langgar Masjid Al-Ikhlas, (Langgar Amanah) Depan Apotik k24 Sipin. RT 11/04, Kel. Simpang IV Sipin, Kec. Telanaipura, Kota jambi (36124).\n\n', 'Mandiri 110.00.0633.0820', '085266859254', '', 'untung.iskandar04@gmail.com', '', '', 'Metro TV', 'Aktif', 'Kota Jambi', 'Daerah', 'Jambi', 'Indonesia', '2017-08-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(58, 'Solmi', 'Laki Laki', '', '0000-00-00', '', '', 'Jalan Gurami Nomor 37, RT 30, Blok I, Komp. Bumi Palmerah Indah, Kel. Lingkar Selatan Kec. Jambi Selatan, Kota Jambi', 'Jalan Gurami Nomor 37, RT 30, Blok I, Komp. Bumi Palmerah Indah, Kel. Lingkar Selatan Kec. Jambi Selatan, Kota Jambi', 'Mandiri 110.001.347.513-9 ', '085273026863', '', 'dindokyu@yahoo.com', '', '', 'Media Indonesia', 'Aktif', 'Jambi', 'Daerah', 'Jambi', 'Indonesia', '2000-01-01', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(59, 'Usamah', 'Laki Laki', 'Palembang', '1984-11-26', '', '1,67113E+15', 'Citra Damai 1 Jalan Sapta Marga No.112 RT.053 RW.003, Kelurahan Bukit Sangkal, Kecamatan Kalidoni, Palembang, Propinsi Sumatera Selatan\n', 'Citra Damai 1 Jalan Sapta Marga No.112 RT.053 RW.003, Kelurahan Bukit Sangkal, Kecamatan Kalidoni, Palembang, Propinsi Sumatera Selatan\n', 'MANDIRI : 900-001-406852-3', '081373011963', '', 'usamahucup626@gmail.com', '', 'usamahmetrotv ', 'Metro TV', 'Aktif', 'Prabunulih, Muara Enim, Pali', 'Daerah', 'Sumatera Selatan', 'Indonesia', '2012-12-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(60, 'Baharman', 'Laki Laki', '', '0000-00-00', '', '', '', '', '', '081373986070', '', '', '', '', 'Media Indonesia', 'Aktif', '', 'Daerah', 'Sumatera Selatan', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(61, 'Benny Wijaya', 'Laki Laki', 'Balikpapan', '1975-10-11', '', '1,67308E+15', 'Jl. Kenangan II RT. 6 No. 22 Kel. Kenanga, Kec. Lubuk Linggau Utara 31617', 'Jl. Kenangan II RT. 6 No. 22 Kel. Kenanga, Kec. Lubuk Linggau Utara 31617', 'MEGA 013130020009371', '081279208775', '', 'linggaubenny@gmail.com', '', '', 'Metro TV', 'Aktif', 'Lubuk Linggau, Muratara, dan Mura', 'Daerah', 'Sumatera Selatan', 'Indonesia', '2018-11-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(62, 'Dwi Apriani ', 'Perempuan', 'Prabumulih', '1989-04-01', '', '1674024104890000', 'Jalan Sukarela, Kompleks Sukarela Sejahtera Blok A3 Kelurahan Sukarami Kecamatan Sukarami, Palembang, Sumsel', '', 'Mandiri 112-001-155-760-5 ', '082176301612', '', 'dwi.apriani10@gmail.com', '', '', 'Media Indonesia', 'Aktif', 'Palembang', 'Daerah', 'Sumatera Selatan', 'Indonesia', '2016-03-08', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(63, 'Gonti Hadi  Wibowo', 'Laki Laki', 'Palembang', '1994-11-16', '', '1671091611940007', 'Jalan Mayor Salim Batubara Komplek PJKA RT 006/002 Sekip Jaya, Kemuning, Palembang', 'Jalan Mayor Salim Batubara Komplek PJKA RT 006/002 Sekip Jaya, Kemuning, Palembang', 'BCA 8570373162 ', '08977777297', '', 'gontiwibowo@gmail.com', 'Bowokkkghw@yahoo.com', '', 'Medcom', 'Aktif', 'Palembang', 'Daerah', 'Sumatera Selatan', 'Indonesia', '2019-01-11', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(64, 'Iwan Arianto', 'Laki Laki', 'Surabaya', '1977-01-18', '', '3,57806E+15', 'JL. Petemon 3A No. 18 Surabaya', 'JL. Petemon 3A No. 18 Surabaya', 'MANDIRI : 142-00-1243324-8', '081230211518', '', 'iwanariyant@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Banyuasin, Musi Banyuasin', 'Daerah', 'Sumatera Selatan', 'Indonesia', '2013-04-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(65, 'Jian Piere Papin', 'Laki Laki', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', 'Metro TV', 'Aktif', 'Palembang', 'Daerah', 'Sumatera Selatan', 'Indonesia', '0000-00-00', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(66, 'Mohamad Masrur', 'Laki Laki', 'Banyuwangi', '1978-08-20', '', '1,60805E+15', 'd/a Bp. Sahid Tahu, Kumpul Sari, Kelurahan Bukit Sari, Kecamatan Martapura, Kabputan OKU timur, Propinsi Sumatera Selatan ', 'd/a Bp. Sahid Tahu, Kumpul Sari, Kelurahan Bukit Sari, Kecamatan Martapura, Kabputan OKU timur, Propinsi Sumatera Selatan ', 'MANDIRI : 113.000.5376.714', '081373555566', '08127855626', 'muhammad.masrur@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Ogan Komering Ulu', 'Daerah', 'Sumatera Selatan', 'Indonesia', '2014-05-28', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(67, 'Sefti Feriansyah ', 'Laki Laki', 'Palembang', '1975-09-16', '', '1,67103E+15', 'Jl. TL Banten No. 1265, RT 024/RW 008  Kelurahan 14 Ulu, Kecamatan Seberang Ulu 2, Palembang', 'Jl. TL Banten No. 1265, RT 024/RW 008  Kelurahan 14 Ulu, Kecamatan Seberang Ulu 2, Palembang', 'BCA : 021.211.1404', '081278301818', '', 'sefti_feriansyah@yahoo.com', 'yayanvanluber75@gmail.com', 'Yayan.vanLuber', 'Laki Laki', 'Non Aktif', 'Palembang', 'Daerah', 'Sumatera Selatan', 'Indonesia', '2003-10-31', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(68, 'Zaifudin Zuhri', 'Laki Laki', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', 'Metro TV', 'Aktif', 'Lahat', 'Daerah', 'Sumatera Selatan', 'Indonesia', '0000-00-00', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(69, 'Hadi Wijaya', 'Laki Laki', 'Muara Dua', '1976-01-12', '', '', 'Vila Bukit Sejahtera RT 007 RW 001 Kayuara, Sekayu, Kab. Musi Banyuasin', 'Vila Bukit Sejahtera RT 007 RW 001 Kayuara, Sekayu, Kab. Musi Banyuasin', 'BRI 721.901.004.095.536', '081373524130', '', 'mubahadiwijaya@gmail.com', '', '', 'Metro TV', 'Aktif', 'Ogan Komering Ilir dan Ogan Ilir', 'Daerah', 'Sumatera Selatan', 'Indonesia', '2016-04-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(70, 'Eva Pardiana ', 'Perempuan', '', '0000-00-00', '', '', '', '', '', '082280558133', '', '', '', '', 'Media Indonesia', 'Aktif', '', 'Daerah', 'Lampung', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(71, 'Rahman Wijayanto', 'Laki Laki', 'Tulang Bawang', '1989-02-15', '', '1805231502890001', 'Kampung BanjarAgung RT 001 RW 004 Kec. Banjar Agung, Kab. Tulang Bawang - Lampung Kode Pos 34595 ', 'Kampung Tri Tunggal Jaya RT. 10 RW. 02 Kecamatan Banjar Agung, Kabupaten Tulang Bawang, Provinsi Lampung ', 'MANDIRI : 900.000.3711208', '085366308383', '', 'rahman.wijayanto@yahoo.co.id', '', '', 'Metro TV', 'Aktif', 'Kab. Mesuji, Tulang Bawang, Tulang Bawang Barat, Lampung', 'Daerah', 'Lampung', 'Indonesia', '2014-12-03', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(72, 'Andriego Pandega', 'Laki Laki', '', '0000-00-00', '', '', 'Gang Kemuning Raya, Rajabasa Raya, Kec. Rajabasa, Kota Bandar Lampung, Lampung 35142', 'Gang Kemuning Raya, Rajabasa Raya, Kec. Rajabasa, Kota Bandar Lampung, Lampung 35142', '013801007088533 BRI ANDRIEGO PANDEGA', '082373795451', '', '', '', '', 'Metro TV', 'Aktif', 'Bandat Lampung dan Lampung Selatan', 'Daerah', 'Lampung', 'Indonesia', '0000-00-00', 'S', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(73, 'Suranto', 'Laki Laki', 'Kediri', '1993-06-23', '', '1810022306930004', 'Desa Kediri, Kec. Gadingrejo, Kab. Pringsewu, Lampung / stkip Muhammadiyah Pringsewu Lampung, Jalan Makam KH. Ghalib No. 112 Pringsewu Kode Pos 35373', 'Jl. Makam KH. Ghalib, Pringsewu Barat. Kec. Pringsewu, Kabupaten Pringsewu, Lampung 35373\nNo telp. 085378119102', 'MANDIRI 1140020047059', '085768140020', '', 'surantoaja41@gmail.com', '', 'Suranto Lover\'s', 'Metro TV', 'Aktif', 'Kab. Pringsewu, Tanggamus, Pesisir Barat, Lampung Barat ', 'Daerah', 'Lampung', 'Indonesia', '2014-12-03', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(74, 'Feri Jaya Saputra', 'Laki Laki', 'Bengkulu ', '1990-02-15', '', '', 'Jl. Merawan 4 No. 48 Rt. 027/006 Sawah Lebar Kec. Ratu\nAgung Kota Bengkulu ', 'Jalan Merawan 7 Rt 27 Rw 07 No 48. Kelurahan Sawah Lebar. Kecamatan Ratu Agung. Kota Bengkulu. Provinsi Bengkulu. Nomor Hp. 085378481593', 'MANDIRI : 113.00.1107542.5', '085378481593', '', 'feryjsaputra@gmail.com', 'Feryjsaputra3@gmail.com', '', 'Metro TV', 'Aktif', 'Kota Bengkulu, Kab. Bengkulu Tengah, Kab. Muko Moko', 'Daerah', 'Bengkulu', 'Indonesia', '2016-04-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(75, 'Marliansyah ', 'Laki Laki', 'Bengkulu', '1977-03-12', '', '1773021203770010', 'Jln.Pepaya 2 No.66.RT.11/04.Kel.Lingkar Timur, Kec.Singaran Pati, Kota Bengkulu (38226)', 'Jln.Pepaya 2 No.66.RT.11/04.Kel.Lingkar Timur, Kec.Singaran Pati, Kota Bengkulu (38226)', ' Mandiri 179.000.209.922-9', '085267902424', '', 'marliansyah@mediaindonesia.com, ', '', '', 'Media Indonesia', 'Aktif', 'Bengkulu', 'Daerah', 'Bengkulu', 'Indonesia', '2007-09-15', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(76, 'Safran Ansyori', 'Laki Laki', 'Bengkulu', '1981-11-21', '', '', 'Jl. Ir. Rustandi Sugianto, Kelurahan Kandang, RT.03 RW.04, Kota Bengkulu', 'Jl. Ir. Rustandi Sugianto, Kelurahan Kandang, RT.03 RW.04, Kota Bengkulu', 'Mandiri 1790000122049', '081367689023', '081278189203', 'safranbkl@yahoo.com ', '', '', 'Metro TV', 'Aktif', 'Seluma, Bengkulu Selatan dan Kaur', 'Daerah', 'Bengkulu', 'Indonesia', '0000-00-00', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(77, 'Farhan Dwitama ', 'Laki Laki', 'Jakarta', '1987-02-05', '', '3674062005870004', 'Sentraland Boulevard Blok K9 Nomor 10, Parungpanjang, Bogor', 'Sentraland Boulevard Blok K9 Nomor 10, Parungpanjang, Bogor', 'Mandiri 1640 001400 268 a/n Farhan Dwitama', '081311304046', '082298491847', 'mudierketcoa@gmail.com ', '', '', 'Medcom', 'Aktif', 'Tangerang Selatan', 'Daerah', 'Banten', 'Indonesia', '2015-12-01', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(78, 'Hendrik Simorangkir', 'Laki Laki', 'Jakarta', '0000-00-00', '', '3173082504880008', 'Jalan H.Saaba Raya, Komplek Unilever Blok B 4 No.3 RT 02/09, Meruya Selatan, Kembangan, Jakarta Barat.', 'Jalan H.Saaba Raya, Komplek Unilever Blok B 4 No.3 RT 02/09, Meruya Selatan, Kembangan, Jakarta Barat.', 'Mandiri 125-00-1340096-5 a/n Hendrik', '082113047026', '', 'hen.direkindo@gmail.com', '', '', 'Medcom', 'Aktif', 'Banten', 'Daerah', 'Banten', 'Indonesia', '2017-01-03', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(79, 'Wibowo  ', 'Laki Laki', 'Medan', '1972-01-21', '', '3673012101720003', 'Komplek Griya Gemilang Sakti Blok E2 No. 9\nCinanggung, Serang, Banten\n\n', 'Komplek Griya Gemilang Sakti Blok E2 No. 9\nCinanggung, Serang, Banten\n\n', 'MANDIRI  116-00-0473286-4', '081386847008', '082111359542', 'metrotvbanten@yahoo.com', '', 'sangbowo', 'Metro TV', 'Aktif', 'Kab. Serang, Kota Serang', 'Daerah', 'Banten', 'Indonesia', '2003-11-25', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(80, 'Seprinal Sri Putra', 'Laki Laki', '', '0000-00-00', '', '', 'Perumahan Puri Krakatau Hijau, Blok E5 No. 34, Kelurahan Kota Sari, Kecamatan Grogol, Kota Cilegon, Banten ', 'Villa Permata Hijau, Cluster Serdang Resident No. 33, Serdang, Kecamatan Kramatwatu, Serang, Banten', 'Mandiri 163.000.000.4534', '082122262811', '', 'sefrinalputra@gmail.com', '', '', 'Metro TV', 'Aktif', 'Pandeglang, Lebak, Kab. Serang, Kota Serang, Kab. Rangkas Bitung, Cilegon', 'Daerah', 'Banten', 'Indonesia', '2017-06-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(81, 'Pahrul Roji', 'Laki Laki', '', '1982-07-23', '', '3671051410800004', ' jl.kh.hasyim ashari gg. Masjid rt 03/02 no.70 kenanga cipondoh kota tangerang', ' jl.kh.hasyim ashari gg. Masjid rt 03/02 no.70 kenanga cipondoh kota tangerang', 'MANDIRI 155.00727.999.79', '081281561555', '', 'arul_arlikayunaoji@yahoo.com', 'arul_sanjani@yahoo.com', '', 'Metro TV', 'Aktif', 'Kota Tangerang, kab Tangerang, Tangerang Selatan', 'Jabodetabek', 'Banten', 'Indonesia', '2004-03-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(82, 'Syarief Oebaydillah', 'Laki Laki', 'Tangerang', '1966-06-21', '', '3674062106660001', 'Jl. Aria Putra Rt 003/02, Kelurahan Kedaung, Kecamatan Pamulang Tangerang Selatan', 'Jl. Aria Putra Rt 003/02, Kelurahan Kedaung, Kecamatan Pamulang Tangerang Selatan', 'Mandiri 1640000512816 ', '081314880812', '', 'oebay@mediaindonesia.com', '', '', 'Media Indonesia', 'Aktif', 'Tangerang Selatan', 'Jabodetabek', 'Banten', 'Indonesia', '2021-08-01', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(83, 'Sumantri Handoyo', 'Laki Laki', '', '0000-00-00', '', '', 'Jl Sukabhakti GG Murdog RT/RW 01/13 Kelurahan Sukabhakti,  Kecamatan Curug, Kabupaten Tangerang', 'Jl Sukabhakti GG Murdog RT/RW 01/13 Kelurahan Sukabhakti,  Kecamatan Curug, Kabupaten Tangerang', 'BCA 1080570895 ', '08568787212', '', 'sumantrihandoyo@yahoo.com', '', '', 'Media Indonesia', 'Aktif', 'Tangerang ', 'Jabodetabek', 'Banten', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(84, 'Ahmad Nur Hidayat', 'Laki Laki', 'Lamongan', '1980-11-05', '', '', 'Jl. H. Naman No. 37, Kel. Pondok Kelapa, Jakarta Timur ', 'Jalan Swakarsa 1 No 92A Rt 002 Rw 03 (gang musola), Kelurahan Pondok Kelapa, Kecamatan Duren Sawit, Jakarta Timur', 'BCA : 248.157.3515', '081314299866', '', 'areby98@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Bekasi', 'Jabodetabek', 'Jawa Barat', 'Indonesia', '2015-01-20', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(85, 'Rudi Kurniawansyah', 'Laki Laki', 'Pekanbaru', '1981-09-07', '', '1471010709810000', 'Komplek Auri, Jalan Cendrawasih II Blok D No.33 RT 7/ RW 13 Kelurahan Margahayu, Kecamatan Bekasi Timur, Kota Bekasi, Jawa Barat', 'Komplek Auri, Jalan Cendrawasih II Blok D No.33 RT 7/ RW 13 Kelurahan Margahayu, Kecamatan Bekasi Timur, Kota Bekasi, Jawa Barat', 'Mandiri 108.002.007.840-9 ', '082386322086', '', 'rudi@mediaindonesia.com', 'rudi.inc@gmail.com', '', 'Media Indonesia', 'Aktif', 'Bekasi', 'Jabodetabek', 'Jawa Barat', 'Indonesia', '2005-10-01', 'XXL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(86, 'Dody Soebagio', 'Laki Laki', 'Jakarta', '1982-01-17', '', '3174061701820001', 'Jalan Kencana 3 No 58 Rt 007/013 Cilandak Barat Jakarta Selatan', 'Jalan Kencana 3 No 58 Rt 007/013 Cilandak Barat Jakarta Selatan', 'MANDIRI 126-000-517460-1', '081313132489 ', '021-94470031', 'dody_soebagio@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Jakarta Selatan', 'Jabodetabek', 'DKI Jakarta', 'Indonesia', '2003-08-31', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(87, 'Fahirmal Fahim', 'Laki Laki', '', '0000-00-00', '', '', 'Wisma Mas, Pondok Cabe Blok C-1 No. 11\nCinangka Depok 16516\n', 'Wisma Mas, Pondok Cabe Blok C-1 No. 11\nCinangka Depok 16516\n', 'BCA : 421.235.5791', '08128924488 ', '', 'fahirmal_depok@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Jakarta Selatan', 'Jabodetabek', 'DKI Jakarta', 'Indonesia', '2005-05-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(88, 'Mario Pasaribu', 'Laki Laki', 'Jakarta', '1976-07-07', '', '3174040707760019', 'Press Room KPK Lt. Dasar Jl. HR Rasuna Said Kav. C-1, Setia Budi, Jakarta Selatan', 'Press Room KPK Lt. Dasar Jl. HR Rasuna Said Kav. C-1, Setia Budi, Jakarta Selatan', 'MANDIRI 124-000-476-1137', '081808818100', '081257642287', 'mariopasaribu71@gmail.com', '', '', 'Metro TV', 'Aktif', 'Jakarta Pusat', 'Jabodetabek', 'DKI Jakarta', 'Indonesia', '2009-10-17', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(89, 'Christian', 'Laki Laki', 'Jakarta', '1985-12-31', '', '3175093112850003', 'Jalan Usman No. 21 RT 11 RW 04, Ciracas, Jakarta Timur', 'Jalan Usman No. 21 RT 11 RW 04, Ciracas, Jakarta Timur', 'BCA 2610067240', '081280534832', '', 'christwaras@gmail.com', '', '', 'Medcom', 'Aktif', 'Jakarta Pusat', 'Jabodetabek', 'DKI Jakarta', 'Indonesia', '2020-09-03', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(90, 'Yurike Budiman', 'Perempuan', 'Jakarta', '1992-05-27', '', '3172026705920006 ', 'Jl. Sunter Indah XII blok KF 1 no. 12, Sunter Jaya, Tanjung Priok, Jakarta 14350', 'Jl. Sunter Indah XII blok KF 1 no. 12, Sunter Jaya, Tanjung Priok, Jakarta 14350', 'BCA 5000066763', '087784992341', '', 'yuriyurike27@gmail.com', '', '', 'Medcom', 'Aktif', 'Jakarta Utara', 'Jabodetabek', 'DKI Jakarta', 'Indonesia', '2019-01-10', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(91, 'Nanang Yudisthira', 'Laki Laki', 'Jakarta ', '1981-02-11', '', '81021222179', 'Jl. Inpres IV No. 12 RT 04 RW 06 Larangan Utara, Tangerang 15154 \n', 'Jl. Kenanga Blok B No.36, Komplek Deplu, Pondok Betung, Kec. Pondok Aren, Tangerang Selatan\n', 'MANDIRI: 155-00-0675489-2', '085693739317', '', 'Bonank45@gmail.com', '', '', 'Metro TV', 'Aktif', 'Bandara Soetta Tangerang dan Tangerang Selatan', 'Jabodetabek', 'Banten', 'Indonesia', '2015-01-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(92, 'Noer Cholis', 'Laki Laki', '', '0000-00-00', '', '', 'Perum Griya Permata Mekarsari Blok M No. 19-20 RT 05 RW 10 Desa Gandoang, Kec. Cileungsi, Kab. Bogor,  Jawa Barat', 'Perum Griya Permata Mekarsari Blok M No. 19-20 RT 05 RW 10 Desa Gandoang, Kec. Cileungsi, Kab. Bogor,  Jawa Barat', 'MANDIRI 129.000.7410.521', '081280209899', '', 'noercholis76@gmail.com', '', '', 'Metro TV', 'Aktif', 'Bogor', 'Jabodetabek', 'Jawa Barat', 'Indonesia', '2003-10-01', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(93, 'Dede Susanti', 'Perempuan', '', '0000-00-00', '', '', 'Perumahan Curug Sari Agung, Blok B, No 6, Kelurahan Curug Kecamatan Bogor Barat, Kota Bogor, 16162', 'Perumahan Curug Sari Agung, Blok B, No 6, Kelurahan Curug Kecamatan Bogor Barat, Kota Bogor, 16162', 'mandiri 165.000.197.320-6 ', '081311338928', '085882779970', 'anti@mediaindonesia.com', 'shadeku2gmail.com,  ', '', 'Media Indonesia', 'Aktif', 'Bogor', 'Jabodetabek', 'Jawa Barat', 'Indonesia', '2005-08-18', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(94, 'Rizki Nur Mohamad', 'Laki Laki', 'Kebumen', '1988-12-12', '', '3305211212880003', 'Jl. Dr. KRT Radjiman Widyodiningrat, Pulo Jahe rt 005 Rw 014, Kel. Jatinegara Kec Cakung Jakarta Timur', 'Jl. Dr. KRT Radjiman Widyodiningrat, Pulo Jahe rt 005 Rw 014, Kel. Jatinegara Kec Cakung Jakarta Timur', 'Mandiri : 9000015769186', '087788262202', '', 'rizki.rnm1212@gmail.com', '', '', 'Metro TV', 'Aktif', 'Jakarta Pusat', 'Jabodetabek', 'DKI Jakarta', 'Indonesia', '2015-04-21', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25');
INSERT INTO `m_kontributor` (`kontributor_id`, `kontributor_name`, `kontributor_gender`, `kontributor_birth_place`, `kontributor_birth_date`, `kontributor_photo`, `kontributor_identity`, `kontributor_addr`, `kontributor_addr_kirim`, `kontributor_rek_number`, `kontributor_telephone`, `kontributor_telephone_2`, `kontributor_email`, `kontributor_email_2`, `kontributor_skype`, `kontributor_status`, `kontributor_platform`, `kontributor_area`, `kontributor_wilayah`, `kontributor_province`, `kontributor_country`, `kontributor_entry_date`, `kontributor_ukuran_baju`, `kontributor_periode_start`, `kontributor_periode_end`, `kontributor_file`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(95, 'Sidharta Agung', 'Laki Laki', '', '0000-00-00', '', '730212211714', 'Jl. Mawar Raya No. AA-9, RT 05 RW 24, Sukamaju, Cilodong, Depok', 'Jl. Mawar Raya No. AA-9, RT 05 RW 24, Sukamaju, Cilodong, Depok', 'MANDIRI 157-000-1426-734', '08567673913', '08170006056', 'arbatar@gmail.com ', '', '', 'Metro TV', 'Aktif', 'Depok', 'Jabodetabek', 'Jawa Barat', 'Indonesia', '2008-08-26', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(96, 'Kisar Radjaguguk', 'Laki Laki', '', '0000-00-00', '', '', 'Jl.Rukun No.111 Cibubur - Ciracas - Jakarta Timur', 'Jl.Rukun No.111 Cibubur - Ciracas - Jakarta Timur', 'Mandiri 1290020172017 ', '', '', 'kisar@mediaindonesia.com', '', '', 'Media Indonesia', 'Aktif', '', '', '', '', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(97, 'Sumantri', 'Laki Laki', 'Jakarta', '1982-06-10', '', '3173061006820002', 'jl. Peta utara rt 03 rw 02 kel pegadungan, kec. Kalideres, jakarta barat ', 'Jl. Otista, RT 11/RW 12, kampung melayu, jatinegara, kota Jakarta Timut. DKI JAKARTA 13330\n', 'MANDIRI : 1180007475709', '081220873635', '', 'trysumantri83@gmail.com', '', 'Mantri821', 'Metro TV', 'Aktif', 'Jakarta Timur', 'Jabodetabek', 'DKI Jakarta', 'Indonesia', '2015-07-01', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(98, 'Zaenal Arifin', 'Laki Laki', 'Jakarta', '1984-11-21', '', '3174052111840003', 'Jl. Praja Dalam K, Rt.06/05 No. 30, Kebayoran Lama Selatan, Jak-Sel.', 'Jl. Praja Dalam K, Rt.06/05 No. 30, Kebayoran Lama Selatan, Jak-Sel.', 'Mandiri 9000010118850', '081319423752', '', 'zaenalarifin21.kba@gmail.com', '', '', 'Medcom', 'Aktif', 'Jakarta Timur', 'Jabodetabek', 'DKI Jakarta', 'Indonesia', '2019-01-12', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(99, 'Syahrul Shaleh', 'Laki Laki', 'Jakarta', '1987-07-27', '', '', 'Jl. Curug Jaya 7 No.8 RT.007/001, Jaticempaka, Pondok Gede', 'Jl. Curug Jaya 7 No.8 RT.007/001, Jaticempaka, Pondok Gede', 'BCA : 537.503.6093', '081514228259', '', 'syahrulsaleh69@yahoo.co.id', '', 'arul arul ', 'Metro TV', 'Aktif', 'Jakarta Barat', 'Jabodetabek', 'DKI Jakarta', 'Indonesia', '2015-01-20', 'XXL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(100, 'Yudi Irawan', 'Laki Laki', 'Cirebon', '1979-09-08', '', '3201130809790011', 'Perumahan Puri Nirwana 3 Blok BF No.9 RT. 2 RW. 14 Karadenan Cibinong, Kab.  Bogor,  Jawa Barat\n', 'Perumahan Puri Nirwana 3 Blok BF No.9 RT. 2 RW. 14 Karadenan Cibinong, Kab.  Bogor,  Jawa Barat\n', 'MANDIRI 133-000-9848-201', '081218299527', '087874256609', 'yudibogor2010@gmail.com', '', '', 'Metro TV', 'Aktif', 'Bogor', 'Jabodetabek', 'Jawa Barat', 'Indonesia', '2009-10-01', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(101, 'Iwan Gumilar', 'Laki Laki', 'Garut', '1977-03-21', '', '3273202103770000', 'Jl. Kiarasari Permai No. 18 Komplek Kiara Sari RT.05/001 Kel. Margasari, Kec. Buahbatu, Kota Bandung ', 'Jl. Kiarasari Permai No. 18 Komplek Kiara Sari RT.05/001 Kel. Margasari, Kec. Buahbatu, Kota Bandung ', 'BCA : 086.025.8561', '08156075719', '022-70714877', 'iwann2003@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Kota Bandung', 'Daerah', 'Jawa Barat', 'Indonesia', '2003-06-01', 'XXL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(102, 'Akhmad Rofakhan', 'Laki Laki', 'Cirebon', '1985-09-03', '', '3209101805180009', 'Griya Mertapada Asri Blok J No 15 Desa Mertapada Wetan Kecamatan Astanajapura Kabupaten Cirebon 45181', 'Griya Mertapada Asri Blok J No 15 Desa Mertapada Wetan Kecamatan Astanajapura Kabupaten Cirebon 45181', 'BCA KCP Cirebon 1341629361', '085224303497', '', 'Ahmadrofahan@gmail.com', '', '', 'Medcom', 'Aktif', 'Cirebon, Indramayu, Majalengka, Kuningan', 'Daerah', 'Jawa Barat', 'Indonesia', '2015-03-16', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(103, 'Anda Nurlaila', 'Perempuan', '', '0000-00-00', '', '', 'Jalan Taman Cibalagung Indah nomor 2, Pasir Jaya, Kecamatan Bogor Barat', 'Jalan Taman Cibalagung Indah nomor 2, Pasir Jaya, Kecamatan Bogor Barat', '', '0818103316', '', 'ananda.nurlaila@gmail.com', '', '', 'Medcom', 'Aktif', '', 'Daerah', 'Jawa Barat', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(104, 'Antonio Joao Silvester Bano', 'Laki Laki', 'Bekasi', '1992-06-13', '', '3216051306920010', 'Jalan Kapuk Raya, No. 2, RT.05. RW. 018, Kelurahan Pengasinan. Kecamatan Rawa Lumbu Bekasi', 'Jalan Kapuk Raya, No. 2, RT.05. RW. 018, Kelurahan Pengasinan. Kecamatan Rawa Lumbu Bekasi', 'BCA 661451920', '082312165380 ', '085779854364 ', 'banoantonio45@gmail.com', 'Antonio.medcom@gmail.com', '', 'Medcom', 'Aktif', 'Kota dan Kab Bekasi', 'Daerah', 'Jawa Barat', 'Indonesia', '0000-00-00', 'M', '2021-06-15', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(105, 'Apit Haeruman', 'Laki Laki', 'Bandung', '1978-10-09', '', '3272020910780901', 'Perum Taman Asri Blok B15 No.5, RT. 07/14, Kel. Subang Jaya, Kec. Cikole, Kota Sukabumi', 'Perum Taman Asri Blok B15 No.5, RT. 07/14, Kel. Subang Jaya, Kec. Cikole, Kota Sukabumi', 'MANDIRI 133-001-0348-720', '081563518078', '', 'apithar2000@yahoo.co.id', '', '', 'Metro TV', 'Aktif', 'Kota/Kab Sukabumi', 'Daerah', 'Jawa Barat', 'Indonesia', '2008-09-15', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(106, 'Bambang Aris Nurdiyanto', 'Laki Laki', 'Indramayu', '1982-10-26', '', '', 'perum bumi cikampek baru, blok E 1 nomor 40. Desa balonggandu kecamatan jatisari kabupaten karawang jawa barat', 'perum bumi cikampek baru, blok E 1 nomor 40. Desa balonggandu kecamatan jatisari kabupaten karawang jawa barat', 'BCA : 055.057.2281', '0818275934', '', 'metrotv_subang@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Kota/Kab Karawang', 'Daerah', 'Jawa Barat', 'Indonesia', '2010-05-11', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(107, 'Bayu Anggoro Pratiwi', 'Laki Laki', 'Bandung', '1985-12-15', '', '3273071512850000', 'Jalan Cibogo Atas Nomor 6 RT 05/04 Kelurahan Sukawarna/Sukajadi, Kota Bandung, Jawa Barat. 40164', 'Jalan Cibogo Atas Nomor 6 RT 05/04 Kelurahan Sukawarna/Sukajadi, Kota Bandung, Jawa Barat. 40164', 'Mandiri 90000 0901 2379 ', '081223131985', '', 'anggoro@mediaindonesia.com', 'bayanggoken@gmail.com', '', 'Media Indonesia', 'Aktif', 'Bandung', 'Daerah', 'Jawa Barat', 'Indonesia', '2016-11-18', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(108, 'Benny Bastiandy ', 'Laki Laki', 'Cianjur', '1977-01-24', '', '3203011003111199', 'Jl Aria Cikondang Gg Harapan I No. 52B Rt 02/12 Kel Sayang Kec/Kab Cianjur', 'Jl Aria Cikondang Gg Harapan I No. 52B Rt 02/12 Kel Sayang Kec/Kab Cianjur', 'Mandiri 1320014293105', '081319300351', '', 'cianjurcakep@gmail.com', 'benny@mediaindonesia.com', '', 'Media Indonesia', 'Aktif', 'Sukabumi', 'Daerah', 'Jawa Barat', 'Indonesia', '2014-10-08', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(109, 'Dedy Setiyono Musashi', 'Laki Laki', 'Indramayu', '1973-07-31', '', '3212153107730001', 'Jln. Papandayan Blok 13 No. 11 Perum Margalaksana Indah 1. kel. Margadadi Indramayu 45212.', 'Jln. Papandayan Blok 13 No. 11 Perum Margalaksana Indah 1. kel. Margadadi Indramayu 45212.', 'BCA : 374.043.9633', '08156405199', '088980000654', 'dedy_musashi@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Kota/Kab Indramayu', 'Daerah', 'Jawa Barat', 'Indonesia', '2003-08-10', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(110, 'Depi Gunawan ', 'Laki Laki', 'Bandung', '1982-11-19', '', '3217011911820000', 'Jl. Maribaya No 70 Lembang Kab Bandung Barat', 'Jl. Maribaya No 70 Lembang Kab Bandung Barat', 'Mandiri 1320005865218 ', '0821-2635-2622', '0878-2365-1089', 'depigunawan777@gmail.com', '', '', 'Media Indonesia', 'Aktif', 'Bandung Barat', 'Daerah', 'Jawa Barat', 'Indonesia', '0000-00-00', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(111, 'Tjondro Resmiatie', 'Laki Laki', '', '0000-00-00', '', '', 'jl kalasan V nomer 73 pharmindo kelurahan melong kec cimahi selatan.', 'jl kalasan V nomer 73 pharmindo kelurahan melong kec cimahi selatan.', 'Mandiri 131.000.518.310-0 ', '085956540638', '', 'pantauanisu@gmail.com', 'Tjondro.r@gmail.com', '', 'Media Indonesia', 'Aktif', 'Bandung', 'Daerah', 'Jawa Barat', 'Indonesia', '2020-03-30', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(112, 'Muhammad Naviandri', 'Laki Laki', 'Bukittinggi', '1969-09-09', '', '1871050910690000', 'Kampung Patrol RT/RW 04/15, Desa Cihideng, Kecamatan Parongpong  Bandung Barat Jawa Barat', 'Kampung Patrol RT/RW 04/15, Desa Cihideng, Kecamatan Parongpong  Bandung Barat Jawa Barat', '', '08950860-8292', '', 'naviandri@mediaindonesia.com', '', '', 'Media Indonesia', 'Aktif', 'Bandung Barat dan sekitarnya', 'Daerah', 'Jawa Barat', 'Indonesia', '2021-07-01', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(113, 'Edwan Hadnansyah', 'Laki Laki', 'Bandung', '1988-02-13', '', '3273141302880002', 'jl. Padasuka Gg. Babakan Cihapit no. 30 Rt 02 / 06 kelurahan Pasir Layung kec. Cibeunying kidul  Bandung kode pos 40192', 'jl. Padasuka Gg. Babakan Cihapit no. 30 Rt 02 / 06 kelurahan Pasir Layung kec. Cibeunying kidul  Bandung kode pos 40192', 'BCA : 777.079.9010', '085721940001', '', 'edwan.metrotv@gmail.com', '', '', 'Metro TV', 'Aktif', 'Cimahi dan Kabupaten Bandung Barat', 'Daerah', 'Jawa Barat', 'Indonesia', '2010-10-04', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(114, 'Eriez M Rizal ', 'Laki Laki', '', '0000-00-00', '', '', '', '', '', '081324327768', '', '', '', '', 'Media Indonesia', 'Aktif', 'Bandung', 'Daerah', 'Jawa Barat', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(115, 'Faizal Nurathman', 'Laki Laki', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', 'Metro TV', 'Aktif', 'Cirebon', 'Daerah', 'Jawa Barat', 'Indonesia', '0000-00-00', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(116, 'Hendra Herdiana', 'Laki Laki', 'Tasikmalaya', '1976-01-12', '', '', 'Jl. Lingkar Dadaha (belakang gedung susi susanti), Layungsari II No. 3A RT. 04 RW.02 Kelurahan Nagarawangi, Kec. Cihideung, Kota Tasikmalaya, Jawa Barat ', 'Jl. Lingkar Dadaha (belakang gedung susi susanti), Layungsari II No. 3A RT. 04 RW.02 Kelurahan Nagarawangi, Kec. Cihideung, Kota Tasikmalaya, Jawa Barat ', 'BCA : 321.018.8915', '085315245591', '081221923009', 'Hendratasik14@gmail.com', '', 'HENDRA_EPOY', 'Metro TV', 'Aktif', 'Kota/Kab Tasikmalaya', 'Daerah', 'Jawa Barat', 'Indonesia', '2003-10-30', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(117, 'Husni Nursyaf', 'Laki Laki', 'Bandung', '1984-10-25', '', '', 'Kampung Cikak RT. 003/002, Desa Batulayang, Kec. Cililin, Kab. Bandung Barat 40562 ', 'Sekretariat Ikatan Jurnalis Televisi Indonesia (IJTI)\nJl. Prabu Geusan Ulun No. 125 (lt. 2) Komplek Graha Insun Medal (GIM), Sumedang, Jawa Barat', 'MANDIRI 132.00.1190067.8', '085659003900', '', 'hoesnierha@gmail.com', '', 'hoesnierhacadabra', 'Metro TV', 'Aktif', 'Kota/Kab Sumedang', 'Daerah', 'Jawa Barat', 'Indonesia', '2011-02-10', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(118, 'Kristiadi ', 'Laki Laki', 'Tasikmalaya', '1979-01-02', '', '3278030201790000', 'Jl. Saptamarga 114 No. 44 Kel. Cikalang Kec. Tawang Kota Tasikmalaya 46114', 'Jl. Saptamarga 114 No. 44 Kel. Cikalang Kec. Tawang Kota Tasikmalaya 46114', 'Mandiri 131-00-1196133-3 ', '081321896977', '081312692654', 'kristiadi@mediaindonesia.com', 'adi_kristan@yahoo.co.id', '', 'Media Indonesia', 'Aktif', 'Tasikmalaya - Priangan Timur', 'Daerah', 'Jawa Barat', 'Indonesia', '0201-11-01', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(119, 'Muchlis Bachtiar', 'Laki Laki', 'Cianjur', '1979-04-17', '', '', 'kp. pasir gede rt 02 rw 04 desa mekargalih kecamatan ciranjang kabupaten cianjur jabar ( MUCHLIS BACHTIAR )', 'kp. pasir gede rt 02 rw 04 desa mekargalih kecamatan ciranjang kabupaten cianjur jabar ( MUCHLIS BACHTIAR )', 'Mandiri    182.000.150.070.1', '082216732805', '', 'muchlis.bachtiar@gmail.com', '', '', 'Metro TV', 'Aktif', 'CIANJUR SELATAN - JAWA BARAT', 'Daerah', 'Jawa Barat', 'Indonesia', '2019-08-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(120, 'Nur Achmad Komeng', 'Laki Laki', 'Tangerang', '1976-06-28', '', '', 'Kp.Salakopi RT. 03 RW. 14, Pamoyanan, Cianjur, Jawa Barat', 'Jl. KH. Abdulah Bin Nuh, Pos Polisi 8 Cepu, Hypermart, Cianjur, Jawa Barat', 'BCA :  183.066.4587', '081563676724', '', 'nurachmad84@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Kota/Kab Cianjur', 'Daerah', 'Jawa Barat', 'Indonesia', '2011-10-20', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(121, 'Setyabudi Kansil', 'Laki Laki', 'Cianjur', '1954-06-08', '', '3203040612120006', 'Jl Binawan Utama Blok A4 No 38 Komplek BLK Residence Kabupaten Cianjur, Jawa Barat', 'Jl Binawan Utama Blok A4 No 38 Komplek BLK Residence Kabupaten Cianjur, Jawa Barat', 'Mandiri 165.000.197.322-2 ', '082114516667', '', 'budi_kansil@yahoo.com', '', '', 'Media Indonesia', 'Aktif', 'Cianjur', 'Daerah', 'Jawa Barat', 'Indonesia', '0000-00-00', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(122, 'Nurul Hidayah ', 'Perempuan', 'Makassar', '1977-09-24', '', '3274016409770000', 'Kompleks Jembar Agung Blok B No 23 B, Kelurahan Karyamulya,   Kecamatan Kesambi, Kota Cirebon', 'Kompleks Jembar Agung Blok B No 23 B, Kelurahan Karyamulya,   Kecamatan Kesambi, Kota Cirebon', ' Mandiri 134.001.773.976-3', '0813.241.62.950', '0822.40.8696.51', 'nurul@mediaindonesia.com', 'nurul-crb@yahoo.com/nurulhidayahdjakaria@gmail.com ', '', 'Media Indonesia', 'Aktif', 'Cirebon - Pantura', 'Daerah', 'Jawa Barat', 'Indonesia', '0000-00-00', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(123, 'Octavianus Dwi Sutrisno ', 'Laki Laki', '', '0000-00-00', '', '', 'Jln Kebon Kangung 11 No 22 Terusan Kiaracondong, Bandung', 'Jln Kebon Kangung 11 No 22 Terusan Kiaracondong, Bandung', 'BCA 2801218212', '08814597108', '08882020574', 'octa.morison@gmail.com', '', '', 'Medcom', 'Aktif', 'Bandung', 'Daerah', 'Jawa Barat', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(124, 'P Aditya Prakasa ', 'Laki Laki', 'Bandung', '1988-06-03', '', '327322060880003', 'Jalan Batu Permata III. No 8. RT 05/ RW 7, Kelurahan Cijawura, Kecamatan Buah Batu, Kota Bandung', 'Jalan Batu Permata III. No 8. RT 05/ RW 7, Kelurahan Cijawura, Kecamatan Buah Batu, Kota Bandung', 'BCA 0860556634 a/n Pangeran Aditya Prakasa', '081220666896', '', 'lumayanlada@gmail.com', '', '', 'Medcom', 'Aktif', 'Bandung Raya', 'Daerah', 'Jawa Barat', 'Indonesia', '2018-12-30', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(125, 'Rangga Tunggala', 'Laki Laki', 'Garut', '1982-11-20', '', '3275092011820017', 'Cluster Andalus Blok B93 RT. 04/08 Kel. Cimincrang, Kec. Gede Bage, Kota Bandung 40613', 'Ikatan Jurnalis Indonesia (IJTI), Komplek Bekamin,\nJl. Bekatonik No. 25, Cibeunying Kidul, Bandung, Jawa Barat  40124\n', 'BCA : 687.088.4719', '081290250973', '', 'ranggatunggala@yahoo.com', '', 'ranggametrotvkabbandung\n', 'Metro TV', 'Aktif', 'Kab. Bandung', 'Daerah', 'Jawa Barat', 'Indonesia', '2015-08-11', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(126, 'Reza Endang Sunarya', 'Laki Laki', 'Bandung', '1966-10-30', '', '321403010660004', 'Perum Panorama Indah Blok D2 No 37 Purwakarta 41118', 'Perum Panorama Indah Blok D2 No 37 Purwakarta 41118', 'BCA 2311842058 // MANDIRI 132.0009911224', '082113233520', '', 'eza_sunarya@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Kota/Kab Purwakarta dan Subang', 'Daerah', 'Jawa Barat', 'Indonesia', '2009-02-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(127, 'Rizky Dewantara', 'Laki Laki', 'Tegal', '1989-05-19', '', '3201371905890001', 'Pura Bojonggede Blok C4/6 RT 03/ RW 016 Desa Tajurhalang. Kec Tajurhalang', 'Pura Bojonggede Blok C4/6 RT 03/ RW 016 Desa Tajurhalang. Kec Tajurhalang', 'BCA 1671644137', '082124718266', '', 'dewantaratomz19@gmail.com', '', '', 'Medcom', 'Aktif', 'Bogor', 'Daerah', 'Jawa Barat', 'Indonesia', '2018-05-19', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(128, 'Roni Halim', 'Laki Laki', 'Garut', '1981-01-21', '', '3204282101810014', 'Kp. Panuusan RT. 01/06, Desa Sukamulya, Kec. Rancaekek, Kab. Bandung ', 'Cluster Andalus Blok B 93 Kelurahan. Cimincrang Kecamaran Gede Bage.kota bandung ', 'BNI : 0152768514', '085220530567', '(022)70993467', 'ronihalim@yahoo.com', '', 'RONIHALIM', 'Metro TV', 'Aktif', 'Kota Bandung', 'Daerah', 'Jawa Barat', 'Indonesia', '2009-11-06', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(129, 'Roni Kurniawan', 'Laki Laki', 'Bandung', '1985-05-09', '', '3273120509850007', 'Komplek Permata Cimahi Blok M2 No.19, Ngamprah, Kabupaten Bandung Barat', 'Komplek Permata Cimahi Blok M2 No.19, Ngamprah, Kabupaten Bandung Barat', 'BCA 0080379625', '087823111087', '', 'kamironi@yahoo.com', '', '', 'Medcom', 'Aktif', 'Bandung', 'Daerah', 'Jawa Barat', 'Indonesia', '2015-01-03', 'XXL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(130, 'Sonny Pratama Wijaya', 'Laki Laki', 'Kuningan', '1974-04-24', '', '3210112404740021', 'Dusun 03 Rt.003  Rw.006 (Belakang Agung Futsal) Desa Sutawangi Kecamatan Jatiwangi Kab Majalengka Jawa Barat 45454', 'Dusun 03 Rt.003  Rw.006 (Belakang Agung Futsal) Desa Sutawangi Kecamatan Jatiwangi Kab Majalengka Jawa Barat 45454', 'BRI 4296.01.009743.533', '085314570002', '', 'sonny.majalengka@gmail.com', '', '', 'Metro TV', 'Aktif', 'Kota/Kab Majalengka', 'Daerah', 'Jawa Barat', 'Indonesia', '2017-08-01', 'XXL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(131, 'Wildan Fadilah', 'Laki Laki', 'Garut', '1988-04-04', '', '3203205010404880009', 'Jl. Cimanuk sanding 418 gg. Cintamaya 3 rt 3 rw. 16 blk. Mesjid Al-Haq Kel. Muarasanding Kec. Garut Kota- Garut', 'Jl. Cimanuk sanding 418 gg. Cintamaya 3 rt 3 rw. 16 blk. Mesjid Al-Haq Kel. Muarasanding Kec. Garut Kota- Garut', 'BCA : 148 0756 475 ', '085223450290', '', 'wildanfadilah88@gmail.com', '', 'Wildan Fadilah', 'Metro TV', 'Aktif', 'Kota/Kab Garut', 'Daerah', 'Jawa Barat', 'Indonesia', '2015-06-23', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(132, 'Saifal', 'Laki Laki', 'Bone Tondo', '1993-01-17', '', '', 'Perumahan Ganding Tutuka 1, Blok C3 No 17, Kecamatan Soreang, Kabupaten Bandung, Jawa Barat', 'Perumahan Ganding Tutuka 1, Blok C3 No 17, Kecamatan Soreang, Kabupaten Bandung, Jawa Barat', '', '085756873115', '', 'saifal795@gmail.com', '', '', 'Metro TV', 'Aktif', 'Kab. Bandung', 'Daerah', 'Jawa Barat', 'Indonesia', '2021-03-01', '', '2021-03-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(133, 'Yosep Trisna', 'Laki Laki', 'Tasikmalaya', '1980-09-27', '', '3207012709800002', 'Jl. Cirahong, Dusun. Pasir Peuteuy RT.01  RW.01, Desa Pawindan, Kecamatan Ciamis, Kabupaten Ciamis, Jawa barat.\n\n', 'Jl. Cirahong, Dusun. Pasir Peuteuy RT.01  RW.01, Desa Pawindan, Kecamatan Ciamis, Kabupaten Ciamis, Jawa barat.\n\n', 'MANDIRI 133-000-458-431-4', '081323181941', '085723992842', 'yos.trisna@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Kota/Kab Ciamis dan Pangandaran', 'Daerah', 'Jawa Barat', 'Indonesia', '2009-11-18', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(134, 'Supardji Rasban', 'Laki Laki', 'Brebes', '1960-05-25', '', '3376022505590002', 'JL. Sukosrono No. 24 RT. 09 RW. 02 Slerok, Kec Tegal Timur, Kota Tegal', 'JL. Sukosrono No. 24 RT. 09 RW. 02 Slerok, Kec Tegal Timur, Kota Tegal', 'BCA :131.008.6530', '0817288389 ', '(0283) 342624', 'supardji.tegal@gmail.com', '', 'su parji', 'Metro TV', 'Aktif', 'Brebes', 'Daerah', 'Jawa Tengah', 'Indonesia', '2004-04-21', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(135, 'Abas Zahrotin', 'Laki Laki', '', '0000-00-00', '', '', 'Perum Candi Asri H7 RT. 03 RW. 10 Candimulyo, Kedu, Temanggung, Jawa Tengah 56200', 'Perum Candi Asri H7 RT. 03 RW. 10 Candimulyo, Kedu, Temanggung, Jawa Tengah 56200', 'MANDIRI 1360.0072.14262\n\n', '081227057954', '', '\naa.abaz@rocketmail.com\n', '', 'Abazzahrotien', 'Metro TV', 'Aktif', 'Banjarnegara', 'Daerah', 'Jawa Tengah', 'Indonesia', '2016-10-15', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(136, 'Andy Kurniawan', 'Laki Laki', 'Klaten', '1985-03-13', '', '3310061305850001', 'Daleman, Palar, Trucuk, Klaten Jawa Tengah 57467 ', 'Perumahan Chrysan Regency No. B2 RT.6 RW.14, Puntukrejo, Ngringo, Jaten, Karanganyar, Jawa Tengah', 'MANDIRI 138.000.9729.117', '085640839517', '081226228517 / \'085728911911', 'bonchu13@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Karanganyar,Sragen, Wonogiri', 'Daerah', 'Jawa Tengah', 'Indonesia', '2011-04-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(137, 'Akhmad Safuan', 'Laki Laki', 'Semarang', '1967-04-03', '', '3321040304670000', 'Perum Kupang Asri 2 Blok B-2, Kec. Ambarawa, Semarang', 'Perum Kupang Asri 2 Blok B-2, Kec. Ambarawa, Semarang', 'Mandiri 1390002061145 ', '081229119432', '082137114227', 'akhmadsafuan7@gmail.com?', '', '', 'Media Indonesia', 'Aktif', 'Pekalongan', 'Daerah', 'Jawa Tengah', 'Indonesia', '1990-02-01', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(138, 'Arthurio Oktavianus A ', 'Laki Laki', '', '0000-00-00', '', '', 'Jalan Kakap VI Nomor 3 Mladang, Mintomartani, Ngaglik, Kabupaten Selman, Di Yogyakarta', 'Jalan Kakap VI Nomor 3 Mladang, Mintomartani, Ngaglik, Kabupaten Selman, Di Yogyakarta', 'BRI 481801015466537 a/n Arthurio Oktavianus', '081352123789', '', 'arthuriooktavianus@gmail.com', '', '', 'Medcom', 'Aktif', '', 'Daerah', 'Jawa Tengah', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(139, 'Bambang Mujiono', 'Laki Laki', 'Tegal ', '1969-05-19', '', '3378021905890001', 'Jl. KH. Mukhlas IV/ No.36 Kota Tegal', 'Jl. KH. Mukhlas IV/ No.36 Kota Tegal', 'BCA : 047.034.1483', '08156520036', '083837300000', 'bammuj@yahoo.com', '', 'Bammuj2', 'Metro TV', 'Aktif', 'Tegal, Pemalang', 'Daerah', 'Jawa Tengah', 'Indonesia', '2001-06-26', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(140, 'Budi Hutomo', 'Laki Laki', 'Pati', '1986-08-10', '', '3318111008860004', 'Ds. Babalan Rt. 01 Rw. 02 Kec. Gabus Kel. Babalan - Pati ', 'Ds. Babalan Rt. 01 Rw. 02 Kec. Gabus Kel. Babalan - Pati ', 'BCA 0980.1030.21', '085290736200', '', 'boedy.caem@gmail.com', '', 'budihutomo_metrotv', 'Metro TV', 'Aktif', 'Jepara, Demak', 'Daerah', 'Jawa Tengah', 'Indonesia', '2016-05-20', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(141, 'Darbe Tyas Waskitha', 'Laki Laki', 'Banyumas ', '1980-02-25', '', '3302242502800002', 'Kantor PWI (Komplek RRI Purwokerto) Jl. Jend. Sudirman 427 Purwokerto, Jawa Tengah', 'Kantor PWI (Komplek RRI Purwokerto) Jl. Jend. Sudirman 427 Purwokerto, Jawa Tengah', 'MANDIRI 139.0010.290827', '0815 697 3730\n', '', 'metrotv_bms@yahoo.com', '', 'darbetyas', 'Metro TV', 'Aktif', 'Cilacap, Purwokerto, Banyumas', 'Daerah', 'Jawa Tengah', 'Indonesia', '2007-06-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(142, 'Deo Dwi Fajar Hajar', 'Laki Laki', '', '0000-00-00', '', '', 'Perum taman kradenan asri F 10 , sukoharjo, kecamatan gunung pati, kota semarang.', 'Perum taman kradenan asri F 10 , sukoharjo, kecamatan gunung pati, kota semarang.', '', '082211736200', '085640872231', 'deowae90@yahoo.com', 'waedeo@gmail.com', '', 'Metro TV', 'Aktif', 'Semarang', 'Daerah', 'Jawa Tengah', 'Indonesia', '0000-00-00', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(143, 'Djoko Sardjono', 'Laki Laki', 'Klaten', '1950-04-14', '', '3310231404500000', 'Perum Klaten Kencana Blok C No 42 Klaten, Klaten (57451)', 'Perum Klaten Kencana Blok C No 42 Klaten, Klaten (57451)', 'Mandiri 900.003.928.534-2 ', '085743714450', '08122613941, 0272 - 330461', 'djoko@mediaindonesia.com', 'djoko57451@yahoo.com, ', '', 'Media Indonesia', 'Aktif', 'Klaten', 'Daerah', 'Jawa Tengah', 'Indonesia', '0000-00-00', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(144, 'Eka Hari Wibawa', 'Laki Laki', 'Sukoharjo', '1979-10-08', '', '331120810790004', 'Jl. Slamet Riadi 21, Kartasura 57167 ', 'Jl. Slamet Riadi 21, Kartasura 57167 ', 'BCA : 393.021.3712', '08179484806', '', 'sinuhun.eka.hari.wibawa@gmail.com', '', 'bengawansatu', 'Metro TV', 'Aktif', 'Surakarta, Sukoharjo', 'Daerah', 'Jawa Tengah', 'Indonesia', '2003-08-06', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(145, 'Ferdinand ', 'Laki Laki', '', '0000-00-00', '', '', '', '', '', '081393478900', '', '', '', '', 'Media Indonesia', 'Aktif', 'Solo', 'Daerah', 'Jawa Tengah', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(146, 'Feri Nugroho', 'Laki Laki', '', '0000-00-00', '', '3374100901870004', 'Jl. Kaba Utara RT 05 RW 12 Kel. Tandang, Kec. Tembalang, \nSemarang, Jawa Tengah 50274 ', 'Perum ungaran baru blok b, rt 3/12, leyangan, kec. Ungaran timur, kab. Semarang\n', 'BRI : 100701000531531', '082135266550 ', '082242206855', 'ferinugroho57@gmail.com', '', '', 'Metro TV', 'Aktif', 'Salatiga, kabupaten semarang', 'Daerah', 'Jawa Tengah', 'Indonesia', '2017-01-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(147, 'Hasanuddin (Udin Ali)', 'Laki Laki', 'Pintang', '1978-11-30', '', '3318073011780001', 'Desa Ketilang Wetan RT 1/2 Kecamatan Batangan, Pati', 'Ruko Plaza Puri No. 14 B, Kel. Puri Pati Kota 59113, Kab. Pati, Jawa Tengah', 'BCA : 894.015.7260', '081213311183', '087733818286', 'udinpati@gmail.com', '', 'Udin Ali Nani', 'Metro TV', 'Aktif', 'Kudus,Pati, Rembang', 'Daerah', 'Jawa Tengah', 'Indonesia', '2012-01-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(148, 'Haryanto ', 'Laki Laki', '', '0000-00-00', '', '332101051057001', ' JL. PUCANG ASRI III/48 PERUMNAS PUCANG GADING DEMAK -JAWA TENGAH', ' JL. PUCANG ASRI III/48 PERUMNAS PUCANG GADING DEMAK -JAWA TENGAH', 'Mandiri A/N Rusdiana 135.001.521.417-2 ', '082242206818', '', 'mbakmegakoe@gmail.com', '', '', 'Media Indonesia', 'Aktif', 'Semarang', 'Daerah', 'Jawa Tengah', 'Indonesia', '0000-00-00', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(149, 'Iswahyudi', 'Laki Laki', '', '0000-00-00', '', '332414020670003', 'Jl. Mangga I No. 9 RT 006/ RW 002, Brangsong, Kendal, Jawa Tengah', 'Jl. Mangga I No. 9 RT 006/ RW 002, Brangsong, Kendal, Jawa Tengah', 'BCA  0800474027', '08122567937', '', 'wahyuditv@gmail.com', 'yuditv@gmail.com', '', 'Metro TV', 'Aktif', 'Kendal', 'Daerah', 'Jawa Tengah', 'Indonesia', '2018-11-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(150, 'Iwan Purwoko', 'Laki Laki', 'Klaten', '1976-05-08', '', '', 'Perum Glodogan Indah B/575, Glodogan Klaten Selatan, Klaten, Jawa Tengah ', ' Perum Tambaksari Blok B/ 13, Desa Gemblegan, Kecamatan Kalikotes, Klaten, Jawa Tengah', 'BCA : 015.2523.724', '081393133756', '085728498049', 'iwanpurwoko@yahoo.com', '', 'Ike dian puspita', 'Metro TV', 'Aktif', 'Klaten, Boyolali', 'Daerah', 'Jawa Tengah', 'Indonesia', '2010-08-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(151, 'Kiswantoro', 'Laki Laki', '', '1975-10-19', '', '3323031910750001 ', 'Kauman Rt 02 Rw 02 Kel Temanggung 2, Temanggung, Jawa Tengah. ', 'Perum Aza Griya bolk B 12, Rt 01/ Rw 09 Kelurahan Walitelon Utara, Kec. Temanggung, Kab. Temanggung Jawa Tengah ', 'MANDIRI 900.00.1748061.8', '082138106002 ', '0882 1618 3613', 'kis_heaven@yahoo.co.id', '', 'Kiswantoro Temanggung', 'Metro TV', 'Aktif', 'Temanggung, Wonosobo', 'Daerah', 'Jawa Tengah', 'Indonesia', '2009-10-27', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(152, 'Kuntoro Tayubi ', 'Laki Laki', 'Brebes', '1978-02-19', '', '3329151902780007', 'Desa/Kecamatan Larangan RT 02 RW 05 Kabupaten Brebes, Jawa Tengah. 52262', 'Desa/Kecamatan Larangan RT 02 RW 05 Kabupaten Brebes, Jawa Tengah. 52262', 'BRI Unit Larangan Brebes 584601001586539', '082313959001', '087830064816', 'kuntorotayubi2016@gmail.com', 'kuntorotayubi@gmail.com', '', 'Medcom', 'Aktif', 'Kabupaten Brebes, Kabupaten Tegal dan Kota Tegal', 'Daerah', 'Jawa Tengah', 'Indonesia', '2015-01-11', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(153, 'Liliek Dharmawan', 'Laki Laki', 'Klaten', '1974-02-13', '', '3302161302740000', 'Perum Bumi Arca Indah blok 8 no 11 Arcawinangun, Purwokerto, Jawa Tengah', 'Perum Bumi Arca Indah blok 8 no 11 Arcawinangun, Purwokerto, Jawa Tengah', 'Mandiri 180.000.670.693-3 ', '08122664262', '085227401850', 'lilik@mediaindonesia.com', '', '', 'Media Indonesia', 'Aktif', 'Purwokerto', 'Daerah', 'Jawa Tengah', 'Indonesia', '0000-00-00', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(154, 'Mustholih ', 'Laki Laki', 'Pemalang', '1982-06-02', '', '3327010602820007', 'Jl. Kenari, Ds Brambang RT 06/RW 02, Kec. Karangawen. Kab. Demak, Jawa Tengah 59566', 'Jl. Kenari, Ds Brambang RT 06/RW 02, Kec. Karangawen. Kab. Demak, Jawa Tengah 59566', '4780218768 BCA KCP Wahid Hasyim atas nama Mustholih', '081513858389', '', 'wongsemar@gmail.com', '', '', 'Medcom', 'Aktif', 'Semarang', 'Daerah', 'Jawa Tengah', 'Indonesia', '2017-06-02', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(155, 'Nur Soli', 'Laki Laki', 'Grobogan', '1980-05-15', '', '3315121504800005', 'Desa Jono RT 2/4 Kec. Tawangharjo, Kab. Grobogan', 'Cafe Dewata Coffee Komplek Ruko Nusa Indah Permata (Belakang Bank Mandiri) Jl. R. Suprapto, Purwodadi, Grobogan, Jawa Tengah', 'BCA : 0810543833\n', '082115209811', '', 'bg.gambargrobogan@gmail.com', '', 'Nur sholly', 'Metro TV', 'Aktif', 'Grobogan', 'Daerah', 'Jawa Tengah', 'Indonesia', '2016-02-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(156, 'Putut Anom Karang Jati', 'Laki Laki', 'Jakarta', '1991-12-31', '', '', 'Perum Pagak Indah Blok C/02 RT. 02 RW. 10, Sumbersari, Banyu Urip, Purworejo 54171', 'Perum Pagak Indah Blok C/02 RT. 02 RW. 10, Sumbersari, Banyu Urip, Purworejo 54171', 'Mandiri 1370010982623\n', '087836324999', '', 'karangjatiputut@gmail.com', '', '', 'Metro TV', 'Aktif', 'Kulonprogo, Purworejo', 'Daerah', 'Jawa Tengah', 'Indonesia', '2018-02-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(157, 'Triawati Prihatsari Purwanto', 'Perempuan', 'Karanganyar', '1984-04-18', '', '3309085804840002', 'Tlawong RT 01 RW 01, Tlawong, Sawit, Boyolali, Jawa Tengah', 'Tlawong RT 01 RW 01, Tlawong, Sawit, Boyolali, Jawa Tengah', 'Mandiri 1380009830105', '085800634194', '', 'triawatiprihatsari@gmail.com', '', '', 'Medcom', 'Aktif', 'Solo', 'Daerah', 'Jawa Tengah', 'Indonesia', '2019-12-15', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(158, 'Rhobi Shani ', 'Laki Laki', 'Jepara', '1984-04-09', '', '3320110904840001', 'Jl Sido Mulyo RT5 RW3 Desa Langon - Tahunan Kabupaten Jepara, Jawa Tengah', 'Jl Sido Mulyo RT5 RW3 Desa Langon - Tahunan Kabupaten Jepara, Jawa Tengah', 'BCA Cabang Jepara 2471699511', '081230087478', '', 'cyantakass@gmail.com', '', '', 'Medcom', 'Aktif', 'Jepara, Kudus, Demak', 'Daerah', 'Jawa Tengah', 'Indonesia', '2015-12-16', 'XXL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(159, 'Jama\'ah', 'Laki Laki', 'Kudus', '1992-05-29', '', '3319022905920000', 'Komplek PWI Jalan Masjid Agung no.8 Desa Demaan, Kecamatan Kota,  Kabupaten Kudus', 'Komplek PWI Jalan Masjid Agung no.8 Desa Demaan, Kecamatan Kota,  Kabupaten Kudus', '', '085740224697', '', 'jamaahkudus1@gmail.com', '', '', 'Media Indonesia', 'Aktif', 'Kudus', 'Daerah', 'Jawa Tengah', 'Indonesia', '2021-08-05', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(160, 'Rizqi Kurniawan', 'Laki Laki', 'Tegal', '1985-04-29', '', '3328122904850003', 'Jl. Kaloran 1 NO. 13 RT.004/003 Kel. Mangkukusuman, Kec. Tegal Timur, Kota Tegal', 'Jl. Kaloran 1 NO. 13 RT.004/003 Kel. Mangkukusuman, Kec. Tegal Timur, Kota Tegal', 'BCA : 0470678976', '082227802066', '', 'krizqi20@gmail.com', '', '', 'Metro TV', 'Aktif', 'Pekalongan, Batang', 'Daerah', 'Jawa Tengah', 'Indonesia', '0000-00-00', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(161, 'Tosiani S', 'Laki Laki', '', '0000-00-00', '', '', 'Jalan Sarwodadi III No 855 Purwokerto Kidul, Kec Purwokerto Selatan', 'Jalan Sarwodadi III No 855 Purwokerto Kidul, Kec Purwokerto Selatan', 'Mandiri 165.000.148.000-4', '082225267336', '', 'toshi.wicak@gmail.com', '', '', 'Media Indonesia', 'Aktif', 'Temanggung - Magelang', 'Daerah', 'Jawa Tengah', 'Indonesia', '2007-06-16', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(162, 'Widjajadi ', 'Laki Laki', '', '1964-12-28', '', '377204281264001', 'Wonowoso RT 05/RW 12, Mojosongo,  Jebres, Solo', 'Wonowoso RT 05/RW 12, Mojosongo,  Jebres, Solo', 'Mandiri 1380000039201 ', '08122605182', '', 'widjajadi@mediaindonesia.com', 'wijyadi@yahoo.co.in, ', '', 'Media Indonesia', 'Aktif', 'Solo', 'Daerah', 'Jawa Tengah', 'Indonesia', '0000-00-00', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(163, 'Yuki Pramudya', 'Laki Laki', 'Purworejo', '1989-12-16', '', '3308101612890007', 'Dusun Gadungan Rt. 03 Rw. 02 Desa Pasuruan  Kecamatan Mertoyudan Kab Magelang', 'Dusun Gadungan Rt. 03 Rw. 02 Desa Pasuruan  Kecamatan Mertoyudan Kab Magelang', 'MANDIRI 1360011634489', '082243359709', '087734214398', 'yukipramudya@gmail.com', '', '', 'Metro TV', 'Aktif', 'Magelang, Kebumen', 'Daerah', 'Jawa Tengah', 'Indonesia', '2017-04-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(164, 'Agus Suci Iswahyudi', 'Laki Laki', 'Yogyakarta ', '1978-08-24', '', '3402122408780000', 'Jl. Tebumangli No. 105 A, Jagang Rejo, Bangun Tapan, Bantul, Yogyakarta ', 'Jl. Pringgolayan No. 104 A Kampung Jagangrejo RT/RW 004 Dusun Pelemwulung Kel./Kec. Banguntapan, Kabupaten Bantul, DI ogyakarta. d/a. Bapak HS Mursid', 'BRI  0245-01-000435-53-4', '081324543248', '', 'agus_suci@yahoo.com', '', 'agussucimetrotv', 'Metro TV', 'Aktif', 'Bantul', 'Daerah', 'Yogyakarta', 'Indonesia', '2010-01-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(165, 'Agus Utantoro', 'Laki Laki', 'Yogyakarta ', '1962-08-10', '', '34040071008620006', 'Jl. Mawar I/209 Perumnas Condongcatur, Depok, Yogyakarta Kode Pos 55283', 'Jl. Tluki 2/138, Perum Condongcatur, Yogyakarta 55283', 'BCA : 456.066.0991', '081328345755', '', 'agus.metrojogja@gmail.com', '', '', 'Metro TV', 'Aktif', 'Sleman', 'Daerah', 'Yogyakarta', 'Indonesia', '2003-05-01', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(166, 'Ahmad Mustaqim ', 'Laki Laki', 'Blora', '1991-02-16', '', '3316141602910004', 'Dusun Bantar Wetan, RT5/RW3, Desa Banguncipto, Kecamatan Sentolo, Kabupaten Kulon Progo, Daerah Istimewa Yogyakarta', 'Dusun Bantar Wetan, RT5/RW3, Desa Banguncipto, Kecamatan Sentolo, Kabupaten Kulon Progo, Daerah Istimewa Yogyakarta', 'Mandiri 137 00 11653389', '085643650282', '085225060995', 'mustaqimikal@gmail.com', '', '', 'Medcom', 'Aktif', 'Sleman, Kulon Progo, Bantul, Kota Yogyakarta, Gunungkidul', 'Daerah', 'Yogyakarta', 'Indonesia', '2015-05-05', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(167, 'Ardi Teristi Hardi', 'Laki Laki', '', '1984-06-14', '', '3374061406840000', 'Perum Griya Kembang Putih, Jalan Kadipaten No 23, Kelurahan Guwosari, Kecamatan  Pajangan, Kabupaten Bantul', 'Perum Griya Kembang Putih, Jalan Kadipaten No 23, Kelurahan Guwosari, Kecamatan  Pajangan, Kabupaten Bantul', 'MANDIRI 1290007870898 ', '082221774614', '', 'ardi@mediaindonesia.com', '', '', 'Media Indonesia', 'Aktif', 'Yogyakarta', 'Daerah', 'Yogyakarta', 'Indonesia', '0201-12-11', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(168, 'Erwin Hidayat', 'Laki Laki', 'Gunung Kidul', '1986-01-29', '', '3403012901860002', 'Jl. Baron RT. 07/08 No. 5, Tegalsari, Siraman, Wonosari, Gunung Kidul, DI Yogyakarta  55851', 'Jl. Baron RT. 07/08 No. 5, Tegalsari, Siraman, Wonosari, Gunung Kidul, DI Yogyakarta  55851', 'MANDIRI 137.000.588.2176', '081804049695', '', 'bloom_erwin@yahoo.com', '', 'bloom_erwin@yahoo.com', 'Metro TV', 'Aktif', 'Gunung Kidul', 'Daerah', 'Yogyakarta', 'Indonesia', '2008-04-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(169, 'Furqon Ulya Himawan ', 'Laki Laki', 'Kudus', '1983-07-18', '', '03319021807830000', 'Perum Graha Sativa No B4, Kadirojo, Kalasan, Sleman, DIY', 'Perum Graha Sativa No B4, Kadirojo, Kalasan, Sleman, DIY', 'Mandiri 135-00-1365642-4 ', '08157943727', '', 'furqon@mediaindonesia.com', 'nuyawa@yahoo.com', '', 'Media Indonesia', 'Aktif', 'Yogyakarta', 'Daerah', 'Yogyakarta', 'Indonesia', '0000-00-00', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(170, 'Hudha Sungsang Purwito', 'Laki Laki', 'Temanggung', '1982-06-12', '', '3323131706320001', 'Kuncen RT 02 RW 04 Badran, Kec. Kranggan, Kab. Temanggung, Jawa Tengah', 'Kuncen RT 02 RW 04 Badran, Kec. Kranggan, Kab. Temanggung, Jawa Tengah', 'MANDIRI 1360014667775', '081228354444', '085647613333', 'moccahudha4@gmail.com', '', 'hudhasungsang', 'Metro TV', 'Aktif', 'Kota Yogyakarta', 'Daerah', 'Yogyakarta', 'Indonesia', '2015-09-23', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(171, 'Patricia Vicka ', 'Perempuan', '', '0000-00-00', '', '', 'Jln Klasemen RT 04 RW 38 No 28 C, Sinduharjo, Ngaglik, Sleman Yogyakarta. (Dekat pasar Colombo di Jln Kaliurang Km 7)', 'Jln Klasemen RT 04 RW 38 No 28 C, Sinduharjo, Ngaglik, Sleman Yogyakarta. (Dekat pasar Colombo di Jln Kaliurang Km 7)', 'Mandiri 1020005024077', '08561501318', '081213139027', 'patriciavicka@gmail.com', '', '', 'Medcom', 'Aktif', 'Yogyakarta', 'Daerah', 'Yogyakarta', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(172, 'Abdur Rahman', 'Laki Laki', 'Bangkalan', '1974-12-11', '', '357311112740001', 'Perum Bumi Permai Blok r-2 Rt 2 Rw 4 Desa Tugurejo Keacamatan Ngasem Kabupaten Kediri ', 'Perum Bumi Permai Blok R/2  RT. 4 RW. 4 Desa Tugurejo, Dusun Jeruk, Kabupaten Kediri.\n\n', 'BCA : 439.0601.706', '081230860770', '08885586847', 'rahmanlunub@gmail.com', '', 'abdur.rahman3070', 'Metro TV', 'Aktif', 'Kediri, Nganjuk', 'Daerah', 'Jawa Timur', 'Indonesia', '2007-12-12', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(173, 'Amaluddin ', 'Laki Laki', 'Gresik', '1988-09-20', '', '3525182009880002', 'Dusun Pacinan, Desa Kepuh Teluk, Kecamatan Tambak, Bawean, Kabupaten Gresik', 'Dusun Pacinan, Desa Kepuh Teluk, Kecamatan Tambak, Bawean, Kabupaten Gresik', 'BCA 0881195657', '087753031116', '082334818752', 'amalnewsjitu@gmail.com', '', '', 'Medcom', 'Aktif', 'Gresik, Surabaya, Sidoarjo', 'Daerah', 'Jawa Timur', 'Indonesia', '2015-03-02', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(174, 'Andi Himawan', 'Laki Laki', 'Solo', '1971-05-07', '', '3510160705710007', 'Perumahan Kebalenan Baru 2 Blok I/9, Banyuwangi, Jawa Timur\n\n', 'Perumahan Kebalenan Baru 2 Blok I/9, Banyuwangi, Jawa Timur\n\n', 'BCA : 015.208.4691', '081329057871 ', '087755761640', 'widyaendoet@gmail.com', '', '', 'Metro TV', 'Aktif', 'Banyuwangi', 'Daerah', 'Jawa Timur', 'Indonesia', '2005-03-05', 'XXL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(175, 'Apryanto Catur Irawan', 'Laki Laki', 'Batang', '1983-04-10', '', '3578061004830011', 'Banyu Urip Wetan Tengah 5/3 RT. 004 RW. 007 Sawahan, Surabaya, Jawa Timur  60254', 'Banyu Urip Wetan Tengah 5/3 RT. 004 RW. 007 Sawahan, Surabaya, Jawa Timur  60254', 'MANDIRI 142.00.1301979.8', '081328785033', '083830360024', 'caturirawan83@gmail.com', '', 'caturmetrotv', 'Metro TV', 'Aktif', 'Surabaya', 'Daerah', 'Jawa Timur', 'Indonesia', '2014-01-08', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(176, 'Bagus Suryo Nugroho', 'Laki Laki', 'Sidoarjo', '1976-03-24', '', '3578232403760000', 'Perum Singhasari Residence Blok A6/23 Desa Purwoasri, Kecamatan Singosari, Kabupaten Malang, Jawa Timur', 'Perum Singhasari Residence Blok A6/23 Desa Purwoasri, Kecamatan Singosari, Kabupaten Malang, Jawa Timur', 'Mandiri a/n Tanti Darmastuti 141.001.910.091-6', '082244331108', '081334325569', 'bagussuryo@mediaindonesia.com', 'panembahanbagus@gmail.com', '', 'Media Indonesia', 'Aktif', 'Malang', 'Daerah', 'Jawa Timur', 'Indonesia', '2005-06-01', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(177, 'Bambang Yulianto', 'Laki Laki', 'Tuban', '1976-07-27', '', '1223052707760000', 'Puri Dander Asri Blok F/15, Ngumpak Dalem, Jl. Raya Dander KM. 5, Bojonegoro ', 'Perum Puri Dander Asri Blok F 15 RT49 RW 10 Ngumpakdalem, Dander, Bojonegoro, Jatim (62171)', 'MANDIRI 140-001097-2959', '081334737139', '085231274356', 'bambangtubo@gmail.com', '', '', 'Metro TV', 'Aktif', 'Tuban, Bojonegoro', 'Daerah', 'Jawa Timur', 'Indonesia', '2003-06-06', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(178, 'Mohammad Ahmad Yakub', 'Laki Laki', 'Tuban', '1975-04-11', '', '352-3171-1047-50002', 'Jalan Airlangga No 3 RT/RW 001/001 Desa Pentenan Panceng Gresik', 'Jalan Airlangga No 3 RT/RW 001/001 Desa Pentenan Panceng Gresik', 'MANDIRI 140-00-1313395-5', '0812-5952-8159', '', 'yakub@mediaindonesia.com', 'ahmadyakub54@gmail.com', '', 'Media Indonesia', 'Aktif', 'Bojonegoro', 'Daerah', 'Jawa Timur', 'Indonesia', '2007-01-01', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(179, 'Daviq Umar Al Faruq', 'Laki Laki', 'Malang', '1992-06-11', '', '3507220611920001', 'Perum Muara Sarana Indah E-9 Jetis, Mulyoagung, Dau, Malang, Jawa Timur', 'Perum Muara Sarana Indah E-9 Jetis, Mulyoagung, Dau, Malang, Jawa Timur', 'Mandiri:144-00-1733075-1 ', '085648484952', '', 'daviqisonfire@gmail.com', '', '', 'Medcom', 'Aktif', 'Malang Raya', 'Daerah', 'Jawa Timur', 'Indonesia', '2018-01-02', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(180, 'Dwi Wianto', 'Laki Laki', 'Kediri', '1972-03-29', '', '3575022903720000', 'Jl. Erlangga V/2 Purworejo, Kota Pasuran, Jawa Timur', 'Jl. Erlangga V/2 Purworejo, Kota Pasuran, Jawa Timur', 'MANDIRI 144-00-1206880-2', '081330462442', '', 'dwi_pas@yahoo.co.id', '', 'dwi.wianto', 'Metro TV', 'Aktif', 'Tulungagung, Trenggalek', 'Daerah', 'Jawa Timur', 'Indonesia', '2011-05-16', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(181, 'Faishol Taselan ', 'Laki Laki', 'Lamongan', '1971-08-05', '', '3515140508710000', 'Peruma Taman Aloha Blok D5/24 Sidoarjo', 'Peruma Taman Aloha Blok D5/24 Sidoarjo', 'Mandiri 1410001066307 ', '0811349883', '', 'faishol71@gmail.com', '', '', 'Media Indonesia', 'Aktif', 'Surabaya', 'Daerah', 'Jawa Timur', 'Indonesia', '1990-12-01', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(182, 'Fajar Agastya', 'Laki Laki', '', '1984-07-17', '', '3573031707840004', 'Jl. Danau Singkarak VI E 3D No. 14, Sawojajar, Malang ', 'Jl. Danau Singkarak VI E 3D No. 14, Sawojajar, Malang ', 'MANDIRI 900.00.1492973.2', '081330577299', '081333196686', 'agastya_ganteng@yahoo.co.id', '', 'fajar.agastya', 'Metro TV', 'Aktif', 'Kab. Malang, Blitar', 'Daerah', 'Jawa Timur', 'Indonesia', '2008-06-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(183, 'Fajar Sukemi', 'Laki Laki', 'Gunungkidul', '1981-12-03', '', '3403053012810001', 'Dukuh sahang rt 03/01 Desa Sahang Kecamatan Ngebel, Kabupaten Ponorogo ', 'Perumda Blok F 21, Kelurahan Keniten, kecamatan ponorogo, kab.ponorogo, jatim.  081331765029', 'BRI 6504.01.01.1391.537', '085646054901', '', 'dawn_fs@yahoo.co.id', '', 'fajarmtv', 'Metro TV', 'Aktif', 'Ponorogo, Pacitan', 'Daerah', 'Jawa Timur', 'Indonesia', '2013-12-04', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(184, 'Falentinus Laurensius Hartayan', 'Laki Laki', 'Surabaya', '1978-08-18', '', '3578081808780002', 'Jl. Kalibokor Kencana I/86, Surabaya', 'Jl. Kalibokor Kencana I/86, Surabaya', 'MANDIRI 142-000-780-5129', '0813330436060 ', '031-72175497', 'fal.sby@gmail.com', '', '', 'Metro TV', 'Aktif', 'Surabaya', 'Daerah', 'Jawa Timur', 'Indonesia', '2010-05-03', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(185, 'Herwanto', 'Laki Laki', 'Bangkalan', '1995-05-25', '', '', 'Jalan jokotole Gg 3 Rt5 Rw4 kelurahan Kraton kecamatan Bangkalan, Kabupaten Bangkalan Madura', 'Jalan jokotole Gg 3 Rt5 Rw4 kelurahan Kraton kecamatan Bangkalan, Kabupaten Bangkalan Madura', 'Mandiri 140.001.819.095.0\n', '085104049177', '', 'Kirigayaherwanto@gmail.com', '', '', 'Metro TV', 'Aktif', 'BANGKALAN & SAMPANG - MADURA, JAWA TIMUR', 'Daerah', 'Jawa Timur', 'Indonesia', '2019-08-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(186, 'Iwan Yudhi Atmoko', 'Laki Laki', 'Madiun', '1976-04-20', '', '3577032004760000', 'Jl. Ciliwung No. 65, Kota Madiun', 'Jl. Ciliwung No. 65, Kota Madiun', 'MANDIRI 144.00.1093889.9', '081335444883 ', '0351-7828270', 'iwanmadiun@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Madiun Kota dan Kabupaten', 'Daerah', 'Jawa Timur', 'Indonesia', '2005-07-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(187, 'Khairul Anam', 'Laki Laki', 'Pasuruan', '1980-02-16', '', '3575011602800003', 'Jl. Sriwijaya karangketig Rt. 02 Rw 03 No. 35 Pasuruan ', 'Jl. Sriwijaya karangketig Rt. 02 Rw 03 No. 35 Pasuruan ', 'BCA      0891082796', '081999977111', '', 'anampasuruan80@gmail.com', '', '', 'Metro TV', 'Aktif', 'Pasuruan', 'Daerah', 'Jawa Timur', 'Indonesia', '2018-11-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(188, 'Kumbang Ari W', 'Laki Laki', 'Malang', '1980-01-01', '', '3509211401800000', 'Taman Anggrek Regency, D-4/9 Jember - Jawa Timur', 'Taman Anggrek Regency, D-4/9 Jember - Jawa Timur', 'BCA : 011.180.1401', '08125233102', '', 'kumbangnews@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Jember, Lumajang', 'Daerah', 'Jawa Timur', 'Indonesia', '2005-06-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(189, 'Mamang Pratidina ', 'Laki Laki', 'Jember', '1970-11-08', '', '3509130811700000', 'Jl. Semeru No. 36 RT. 01/26, Rambipuji, Jember', 'Jl. Semeru No. 36 RT. 01/26, Rambipuji, Jember', 'BCA : 024.396.6946', '0816593403', '0331-7780070', 'amarepjem@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Jember', 'Daerah', 'Jawa Timur', 'Indonesia', '2003-09-24', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(190, 'Muhammad Amiruddin', 'Laki Laki', 'Jombang', '1984-11-11', '', '3517191111840004', 'Dusun Kemirigalih RT. 2 RW. 1, Desa Sawiji, Kec. Jogoroto, Jombang', 'Dusun Kemirigalih RT. 2 RW. 1, Desa Sawiji, Kec. Jogoroto, Jombang', 'MANDIRI 142.00.10536877', '081331211322 ', '0321-6112061 / 085790823239', 'kamerad_dr@yahoo.co.id', '', '', 'Metro TV', 'Aktif', 'Jombang', 'Daerah', 'Jawa Timur', 'Indonesia', '2011-05-03', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25');
INSERT INTO `m_kontributor` (`kontributor_id`, `kontributor_name`, `kontributor_gender`, `kontributor_birth_place`, `kontributor_birth_date`, `kontributor_photo`, `kontributor_identity`, `kontributor_addr`, `kontributor_addr_kirim`, `kontributor_rek_number`, `kontributor_telephone`, `kontributor_telephone_2`, `kontributor_email`, `kontributor_email_2`, `kontributor_skype`, `kontributor_status`, `kontributor_platform`, `kontributor_area`, `kontributor_wilayah`, `kontributor_province`, `kontributor_country`, `kontributor_entry_date`, `kontributor_ukuran_baju`, `kontributor_periode_start`, `kontributor_periode_end`, `kontributor_file`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(191, 'Mohammad Ghazi ', 'Laki Laki', 'Pamekasan', '1971-09-29', '', '3528012909710000', 'Ponpes Sumber Anyar,  Ds. Larangan Tokol, Kec. Tlanakan, Kab. Pamekasan, Jawa Timur', 'Ponpes Sumber Anyar,  Ds. Larangan Tokol, Kec. Tlanakan, Kab. Pamekasan, Jawa Timur', 'Mandiri 140.001.982.975-4 ', '08123490067', '081999284111', 'gubernurmadura@gmail.com', '', '', 'Media Indonesia', 'Aktif', 'Madura', 'Daerah', 'Jawa Timur', 'Indonesia', '2005-02-08', 'XXL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(192, 'Rahmatullah', 'Laki Laki', '', '0000-00-00', '', '', 'Dusun Bulu RT 003 / RW 005 Desa Pragaan Daja Kec. Pragaan Kab. Sumenep', 'Dusun Bulu RT 003 / RW 005 Desa Pragaan Daja Kec. Pragaan Kab. Sumenep', 'BNI atas nama Rhahmatullah: 331553721', '81939434995', '085331643994', '?rahmat.sumenep@yahoo.com', '', '', 'Medcom', 'Aktif', 'Sumenep', 'Daerah', 'Jawa Timur', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(193, 'Rizal Fahlevi Agaust', 'Laki Laki', 'Cimahi', '1981-12-03', '', '3524221908730001', 'Jalan Bromo RT 008/ RW 002 desa Klagen Gambiran Kecamatan Maospati Kabupaten magetan', 'Jalan Bromo RT 008/ RW 002 desa Klagen Gambiran Kecamatan Maospati Kabupaten magetan', 'MANDIRI  140-00-0983873-2', '085235299111 ', '081332426091', 'rizal_fahlevy@yahoo.com', '', 'rizal.fahlevy', 'Metro TV', 'Aktif', 'Magetan, Ngawi', 'Daerah', 'Jawa Timur', 'Indonesia', '2005-03-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(194, 'Rudi Ulhaq', 'Laki Laki', 'Probolinggo', '1979-01-09', '', '3508150901790000', 'Jl. K. Hasan Genggong / Gang Bayusari 6 No. 16, Probolinggo, Jawa Timur  67214', 'Jl. K. Hasan Genggong / Gang Bayusari 6 No. 16, Probolinggo, Jawa Timur  67214', 'BCA : 125.0488.323', '085236817640', '', 'rudi.ulhaq@yahoo.co.id', '', 'rudi.ulhaq', 'Metro TV', 'Aktif', 'Kab. & Kota Probolinggo', 'Daerah', 'Jawa Timur', 'Indonesia', '2011-10-24', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(195, 'Rudianto H. Pardosi', 'Laki Laki', 'Medan', '1982-11-18', '', '3515071811820000', 'Perum Larangan Megah Asri C/61, Sidoarjo, Jawa Timur (kirim di biro) ', 'Perum Larangan Megah Asri C/61, Sidoarjo, Jawa Timur (kirim di biro) ', 'MANDIRI 141.001.1034246', '08175088732', '', 'rudie_pardosi@yahoo.co.id', '', '', 'Metro TV', 'Aktif', 'Surabaya', 'Daerah', 'Jawa Timur', 'Indonesia', '2011-04-18', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(196, 'Sholihul Huda', 'Laki Laki', 'Lamongan', '1985-11-17', '', '3524081711850003', 'Jl. Topaz VI No. 11, Graha Bunder Asri RT/RW 005/006 Desa Kembangan, Kec. Kebomas, Kab. Gresik jawa Timur Kode Pos 61161 ', 'Jl. Topaz VI No. 11, Graha Bunder Asri RT/RW 005/006 Desa Kembangan, Kec. Kebomas, Kab. Gresik jawa Timur Kode Pos 61161 ', 'MANDIRI 142-00-0764862-8', '081357938007 ', '085648168559', 'huda.gresik@gmail.com', '', '', 'Metro TV', 'Aktif', 'Gresik, Lamongan', 'Daerah', 'Jawa Timur', 'Indonesia', '2010-02-15', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(197, 'Suyanto', 'Laki Laki', 'Pasuruan', '1977-05-19', '', '3575021405770000', 'Jl. Panglima Sudirman 14 No. 34D, Pasuruan 67115 (kirim di biro)', 'Jl. Panglima Sudirman 14 No. 34D, Pasuruan 67115 (kirim di biro)', 'MANDIRI 900000 218 2278', '085335221234', '081334444989', 'ithonkpro@yahoo.com', 'itong.mtv@gmail.com', 'itongsuyanto', 'Metro TV', 'Aktif', 'Surabaya', 'Daerah', 'Jawa Timur', 'Indonesia', '2012-02-02', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(198, 'Suyono  ', 'Laki Laki', 'Banyuwangi', '1969-09-10', '', '3510101009690008', 'Apotek Diponegoro Jl. Diponegoro 41 Rt. 04 Rw. 04 Kel Dawuhan Kec. Kota Situbondo Kode Pos 68350 ', ' Suyono d/a perum panorama blok T 22a panarukan situbondo', 'MANDIRI : 143.00.1508.7537', '0857735180840', '0985735180840/ 081358032679', 'yonosto69@gmail.com', '', 'yono_metrotv', 'Metro TV', 'Aktif', 'Bondowoso, Situbondo', 'Daerah', 'Jawa Timur', 'Indonesia', '2015-08-11', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(199, 'Syaikhul Hadi ', 'Laki Laki', '', '0000-00-00', '', '', 'Jl. Irawati I/35 RT 008/010 Kel. Sidotopo Kec. Semampir, Surabaya', 'Jl. Irawati I/35 RT 008/010 Kel. Sidotopo Kec. Semampir, Surabaya', 'Mandiri 1400014234588', '081357094414', '', 'hadi.mtvn@gmail.com', 'doankzdie@gmail.com', '', 'Medcom', 'Aktif', 'Sidoarjo', 'Daerah', 'Jawa Timur', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(200, 'Akh. Khairul Anwar', 'Laki Laki', '', '0000-00-00', '', '3529051403890000', 'Dusun Air Mata RT. 002/001 Kel. Sera Timur, Kec Bluto', 'Dusun Air Mata RT. 002/001 Kel. Sera Timur, Kec Bluto', '', '082330219333', '085923141444', 'irul.exil@gmail.com', '', '', 'Metro TV', 'Aktif', 'Sumenep', 'Daerah', 'Jawa Timur', 'Indonesia', '2021-08-01', '', '2021-08-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(201, 'Tamam Mubarok', 'Laki Laki', 'Gresik', '1989-10-01', '', '3525020110890020', 'Perum Puri Kokoh Blok. H No. 03, Puri, Mojokerto, Jawa Timur', 'Perum Puri Kokoh Blok. H No. 03, Puri, Mojokerto, Jawa Timur', 'BCA : 790.040.1064', '082131748174', '', 'tamammubarrok@gmail.com', '', 'Tamam Mubarrok', 'Metro TV', 'Aktif', 'Mojokerto', 'Daerah', 'Jawa Timur', 'Indonesia', '2014-09-16', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(202, ' Usman Affandi ', 'Laki Laki', '', '0000-00-00', '', '', 'Desa  Wringinpitu, Kec Tegaldlimo Banyuwangi', 'Desa  Wringinpitu, Kec Tegaldlimo Banyuwangi', 'BRI 329.701.023.119.535 ', '085811502123', '', 'usmanafandi@mediaindonesia.com', 'usman56254@gmail.com', '', 'Media Indonesia', 'Aktif', 'Banyuwangi ', 'Daerah', 'Jawa Timur', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(203, 'Wahyu Tiar Priyanto', 'Laki Laki', 'Semarang', '1978-06-07', '', '3573030706780006081', 'Jl. Kapisata Bali Blok. 16/B29, Pakis, Kab. Malang', 'Jl. Kapisata Bali Blok. 16/B29, Pakis, Kab. Malang', 'BCA : 439.031.8494', '08155523031', '0341-7013034', 'mbingyamakazi@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Kota Malang, Batu', 'Daerah', 'Jawa Timur', 'Indonesia', '2004-09-30', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(204, 'Yohanes Heri Susetyo', 'Laki Laki', 'Magetan', '1971-12-29', '', '3515162912710000', 'Perum Surya Regency D4/5, Gedangan, Sidoarjo, Jawa Timur', 'Perum Surya Regency D4/5, Gedangan, Sidoarjo, Jawa Timur', 'BCA : 177.082.0312', '08123521640', '031-60205102', 'herisusetyo@yahoo.com', '', 'herimetro', 'Metro TV', 'Aktif', 'Sidoarjo', 'Daerah', 'Jawa Timur', 'Indonesia', '2003-11-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(205, 'Arnoldhus Dhae ', 'Laki Laki', '', '0000-00-00', '', '', 'Jl Kecubung, Gang Cempaka 9X No. 7 Denpasar', 'Jl Kecubung, Gang Cempaka 9X No. 7 Denpasar', 'BCA 611-0267256 ', '085237508715', '', 'arnold@mediaindonesia.com', 'arnoldmeak@yahoo.co.id', '', 'Media Indonesia', 'Aktif', 'Denpasar', 'Daerah', 'Bali', 'Indonesia', '2008-06-14', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(206, 'Saifullah', 'Laki Laki', '', '1968-03-19', '', '3276011903680000', 'Jl. Nuansa Utama Selatan blok VII/14. Kori Nuansa (Komplek perumahan Taman Griya-Jimbaran Kuta- Bali) ', 'Komplek Perum. Taman Griya Jimbaran -Kuta- Badung- Bali. jln. Nuansa Utama Selatan VII/14 Kori Nuansa.', 'MANDIRI 145.000.43016.73', '081353326417', '08175746700', 'saif.bali@yahoo.com', 'metrotv.bali@yahoo.com', 'Metrotvbali.saiful', 'Metro TV', 'Aktif', 'Bali', 'Daerah', 'Bali', 'Indonesia', '2004-01-01', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(207, 'Gede Ruta Suryana', 'Laki Laki', 'Karangasem', '1963-01-14', '', '5103061401630000', 'Perum Dalung Permai Blok A2/19 Kuta Utara Badung Bali 80361', 'Perum Dalung Permai Blok A2/19 Kuta Utara Badung Bali 80361', 'Mandiri 175.000.148.870-8 ', '08113800999', '0361- 8438033', 'mi_suryana@yahoo.com', 'rutasuryana@mediaindonesia.com', '', 'Media Indonesia', 'Aktif', 'Kuta', 'Daerah', 'Bali', 'Indonesia', '0000-00-00', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(208, 'Fathia Nurul Haq', 'Perempuan', '', '0000-00-00', '', '', 'Jl Siulan, Gang Sekarsari 16 No 7, Banjar Mertasari, Denpasar Bali', 'Jl Siulan, Gang Sekarsari 16 No 7, Banjar Mertasari, Denpasar Bali', 'Mandiri 900.002.343.965-7 ', '087887994933', '', 'fathia@mediaindonesia.com', '', '', 'Media Indonesia', 'Aktif', 'Denpasar', 'Daerah', 'Bali', 'Indonesia', '2017-09-01', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(209, 'Bagus Putra Mas Suwarjana', 'Laki Laki', 'Jembrana', '1996-03-30', '', '5103063003960002', 'Gang Penyarikan Nomor 9, Lingkungan Padang, Kelurahan Kerobokan, Kecamatan Kuta Utara, Kabupaten Badung, Provinsi Bali', 'Gang Penyarikan Nomor 9, Lingkungan Padang, Kelurahan Kerobokan, Kecamatan Kuta Utara, Kabupaten Badung, Provinsi Bali', 'BNI   0686120781', '081237205285', '', 'bagusgede30@gmail.com', '', '', 'Metro TV', 'Aktif', 'Bali', 'Daerah', 'Bali', 'Indonesia', '2018-01-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(210, 'Lalu Muh Hasanuddin Sah', 'Laki Laki', 'Mataram', '1972-04-14', '', '5201141404720000', 'Jl. Kesatrian 5C Gianyar, Bali', 'Jl. Kesatrian 5C Gianyar, Bali', 'BNI   0513787903', '085322300775', '', '', '', '', 'Metro TV', 'Aktif', 'Gang Penyarikan Nomor 9, Banjar Padang, Kelurahan Kerobokan, Kecamatan Kuta Utara, Kabupaten Badung, Provinsi Bali \n', 'Daerah', 'Bali', 'Indonesia', '2019-01-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(211, 'Ruta Suryana ', 'Laki Laki', '', '0000-00-00', '', '', '', '', '', '08113800999', '', '', '', '', 'Media Indonesia', 'Aktif', '', 'Daerah', 'Bali', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(212, 'Ikra Hardiansyah', 'Laki Laki', 'Ngali ', '1983-10-01', '', '526040110830001', 'Studio Bima FM Radio, Jl. Gajah Mada No. 46, BTN Penatoi, Kota Bima, NTB', 'Studio Bima FM Radio, Jl. Gajah Mada No. 46, BTN Penatoi, Kota Bima, NTB', 'BRI 0079-01-024195-50-5 // MANDIRI 161-00-0118546-6', '085253526655', '081918002009', 'iqotrandys@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Bima, Dompu', 'Daerah', 'Nusa Tenggara Barat', 'Indonesia', '2009-06-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(213, 'Adhy Hendry', 'Laki Laki', 'Menggala Tanjung', '1984-11-22', '', '5208052211840000', 'Komplek Perum Griya Pancoran, \nJl. Anyelir Gang 7 No. A7, Dauh Peken, Tabanan, Bali ', 'Komplek Perum Griya Pancoran, \nJl. Anyelir Gang 7 No. A7, Dauh Peken, Tabanan, Bali ', 'MANDIRI 161-00-0210576-0', '081805224252', '', 'adhypemenang12@gmail.com', '', 'hendryadhy', 'Metro TV', 'Aktif', 'Mataram, Kab Lombok Barat, Sengigi, Lombok Timur', 'Daerah', 'Nusa Tenggara Barat', 'Indonesia', '2010-11-15', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(214, 'Moeis Damhoeiji', 'Laki Laki', 'Sumbawa', '1969-12-14', '', '524081412690004', 'Jl. Kartini No. 8, Sumbawa Besar, NTB 84314', 'Jl. Kartini No. 8, Sumbawa Besar, NTB 84314', 'MANDIRI  145.000.6896712', '08123775499', '081906910777', 'moeis_dam@yahoo.co.id', '', 'moeis.sumbawa', 'Metro TV', 'Aktif', 'Sumbawa', 'Daerah', 'Nusa Tenggara Barat', 'Indonesia', '2003-01-03', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(215, 'Yusuf Riaman ', 'Laki Laki', '', '0000-00-00', '', '', 'Perumahan Puri Citra Asri, Blok C, No.42, Jl. Pariwisata, Sandik, Batu Layar', 'Perumahan Puri Citra Asri, Blok C, No.42, Jl. Pariwisata, Sandik, Batu Layar', 'Mandiri 161.000.663.487-2 ', '08123772409', '081805578000', 'yusuf@mediaindonesia.com', 'yusuf_media@yahoo.com', '', 'Media Indonesia', 'Aktif', 'Mataram', 'Daerah', 'Nusa Tenggara Barat', 'Indonesia', '1992-06-01', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(216, 'Ferdinandus Rabu ', 'Laki Laki', 'Larantuka', '1980-09-14', '', '24500011409800008', ' D/A Gusti Kilok di SMA PGRI Jl. Trans Lembata, Lamahora, Kota Lewoleba, Kec. Nubatukan, Kabupaten Lembata, NTT.', ' D/A Gusti Kilok di SMA PGRI Jl. Trans Lembata, Lamahora, Kota Lewoleba, Kec. Nubatukan, Kabupaten Lembata, NTT.', 'BRI  3492-0102-8932-536', '085237919649', '', 'ferdi_virgo009@yahoo.com', '', 'ferdirabu', 'Metro TV', 'Aktif', 'Kabupaten Kupang, Kabupaten Timor Tengah Selatan,Kota Kupang, Pemprov, Rote, Alor, Sabu dan Belu\n', 'Daerah', 'Nusa Tenggara Timur', 'Indonesia', '2010-01-08', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(217, 'Alexander Paulus Taum', 'Laki Laki', '', '0000-00-00', '', '', 'Kios Antonio, Jl. RS Bukit Waikomo Kelurahan Lewoleba Barat, Kecamatan Nubatukan Kabupaten Lembata, NTT', 'Kios Antonio, Jl. RS Bukit Waikomo Kelurahan Lewoleba Barat, Kecamatan Nubatukan Kabupaten Lembata, NTT', 'BRI  A/N  KATARINA BAFUT J 3491-01-03849953-2 ', '082235695986', '0822 4750 6667', 'alexander@mediaindonesia.com', '', '', 'Media Indonesia', 'Aktif', 'Lembata', 'Daerah', 'Nusa Tenggara Timur', 'Indonesia', '2011-11-14', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(218, 'Ignasius L Kunda ', 'Laki Laki', 'Bajawa', '1983-08-31', '', '5309063108830001', 'Radio Max FM, No. 28. Kalu, Keluraham Prailiu, Kota Waingapu, Sumba Timur 87113 \n', 'd/a  Ira  Tiwu, Rumah Sakit Umum Daerah Aeramo, jalan w.z Yohanes, Aeramo, Mbay, Nagekeo, Nusa Tenggara Timur, 082166300138\n', 'BNI 0044.61.2060', '085239196099 ', '082166300138', 'ignaskunda@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Kab. Nagekeo, Ngada', 'Daerah', 'Nusa Tenggara Timur', 'Indonesia', '2011-06-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(219, 'Johanes Wao Lewar ', 'Laki Laki', 'Larantuka', '1972-10-01', '', '5315050110720000', 'Wae Sambi Rt.10/Rw.01 desa Batu Cetmin kecamatan Komodo Labuanbajo NTT', 'Wae Sambi Rt.10/Rw.01 desa Batu Cetmin kecamatan Komodo Labuanbajo NTT', 'BNI 013.9336126', '082145038300', '', 'johnlewar@gmail.com', '', 'jhon_lewar', 'Metro TV', 'Aktif', 'Labuanbajo, Manggarai Barat', 'Daerah', 'Nusa Tenggara Timur', 'Indonesia', '2012-02-06', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(220, 'Marselinus Mite Feni', 'Laki Laki', 'Maunori', '1973-06-02', '', '53088200206730001', 'Jl. Kokos VIII No.5 Perumnas Ende, Kel. Mautapaga, Kec. Ende Timur, Flores, NTT', 'Jl. Kokos VIII No.5 Perumnas Ende, Kel. Mautapaga, Kec. Ende Timur, Flores, NTT', 'BNI 73.48.33.67', '0813.1741.6111 ', '0822.3618.7587', 'marcelmitfen@yahoo.co.id', '', '', 'Metro TV', 'Aktif', 'Maumere, Ende', 'Daerah', 'Nusa Tenggara Timur', 'Indonesia', '2004-05-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(221, 'Palce Amalo ', 'Laki Laki', 'Rote', '1973-09-28', '', '5371042809730000', 'Jalan Petrus Pah, Gang Perjuangan, RT 28 RW 03, Kelurahan Liliba, Kota Kupang, Nusa Tenggara Timur', 'Jalan Petrus Pah, Gang Perjuangan, RT 28 RW 03, Kelurahan Liliba, Kota Kupang, Nusa Tenggara Timur', 'Mandiri 1450097036939 ', '081239557575', '085239178997', 'palce@mediaindonesia.com', 'palce2002@yahoo.com', '', 'Media Indonesia', 'Aktif', 'Kupang', 'Daerah', 'Nusa Tenggara Timur', 'Indonesia', '2004-05-07', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(222, 'Yohanes Manasye', 'Laki Laki', 'Golo, Manggarai Timur', '1981-11-21', '', '5310032111810001', 'Cumbi RT 003 RW 002, Kel. Cumbi, Kec. Ruteng, Manggarai, NTT \n\n', 'Pongara, RT 014/RW 005, Kelurahan Pitak, Kecamatan Langke Rembong, Kabupaten Manggarai, NTT.\n\n', 'BRI 027301001577534', '081239588658', '', 'johnmanasyemi@gmail.com', '', '', 'Metro TV', 'Aktif', 'Manggarai (Ruteng), Manggarai Timur bag. Barat (Borong)', 'Daerah', 'Nusa Tenggara Timur', 'Indonesia', '2017-02-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(223, 'Fransiskus Gerardus', 'Laki Laki', '', '0000-00-00', '', '5313050706870005', 'Aransina RT.003/005, Kel. Aransina, Kec.Tanjung Bunga', 'Aransina RT.003/005, Kel. Aransina, Kec.Tanjung Bunga', '', '082148138828', '', 'fransiskusgerardusmolo@gmail.com', '', '', 'Metro TV', 'Aktif', 'Flores', 'Daerah', 'Nusa Tenggara Timur', 'Indonesia', '2021-08-01', '', '2021-08-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(224, 'Gabriel Langga', 'Laki Laki', 'Maumere', '1987-05-01', '', '5307050105870005', 'Jl Wolombetan, Kelurahan Nangalimang, Kec Alok, Kab Sikka NTT', 'Jl Wolombetan, Kelurahan Nangalimang, Kec Alok, Kab Sikka NTT', 'Mandiri 181.000.083.806-1', '081337369320', '', 'macansikka@gmail.com', 'gabriellanggamediaindonesia@gmail.com', '', 'Media Indonesia', 'Aktif', 'Sikka', 'Daerah', 'Nusa Tenggara Timur', '', '2020-05-08', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(225, 'Budi Ismanto', 'Laki Laki', '', '0000-00-00', '', '', 'Jl. Purnasakti Komplek Permatasari Rt 28 No 26 A, Banjarmasin 70245', 'Jl. Purnasakti Komplek Permatasari Rt 28 No 26 A, Banjarmasin 70245', 'BCA 051.083.9927', '08125150659', '', 'budi_ismantosh@yahoo.com', '', 'BUDI.ISMANTO64', 'Metro TV', 'Aktif', 'Banjarmasin', 'Daerah', 'Kalimantan Selatan', 'Indonesia', '2002-06-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(226, 'Denny Susanto ', 'Laki Laki', 'Bangka', '1973-09-15', '', '6371051509730000', 'JL SUTOYO S NO. 1 RT 2, TELUK DALAM,  BANJARMASIN Tengah, KOTA BANJARMASIN, KALSEL', 'JL SUTOYO S NO. 1 RT 2, TELUK DALAM,  BANJARMASIN Tengah, KOTA BANJARMASIN, KALSEL', 'Mandiri 0310005010296 ', '08125007118', '', 'dennymedia@gmail.com', '', '', 'Media Indonesia', 'Aktif', 'Banjarmasin', 'Daerah', 'Kalimantan Selatan', 'Indonesia', '0000-00-00', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(227, 'Tantawi Jauhari', 'Laki Laki', 'Banjarmasi', '1970-05-21', '', '6271012105700002', ' JL RTA Milono Kompleks Bama Raya Permai\n Blok III no 1117, Palangkaraya, Kalimantan Tengah ', 'Jl Antang Kalang Induk No 63 Palangka Raya Kalimantan Tengah kode pos 73111', 'MANDIRI 031-000422196-9', '0811 52 2232 ', '081254463252', 'tantawijauhari@yahoo.com', '', 'tantawimetrotvkalteng01', 'Metro TV', 'Aktif', 'Palangkaraya', 'Daerah', 'Kalimantan Tengah', 'Indonesia', '2003-06-16', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(228, 'Akhmad Dian Noor', 'Laki Laki', 'Sampit ', '1970-07-07', '', '6202060707680000', 'Jalan  Kopi  No.69, RT 005, RW.002, Kecamatan Mentawa Baru Ketapang-Sampit', 'Jl.Kopi rt.05,rw.02 No.69 Kecamatan.MB.Ketapang- Sampit-Kalteng\n', '', '08125097619', '', 'dian_mtvspt@yahoo.co.id', '', '', 'Metro TV', 'Aktif', 'Sampit / Kotawaringin Timur', 'Daerah', 'Kalimantan Tengah', 'Indonesia', '2005-04-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(229, 'Surya Sriyanti ', 'Perempuan', 'Banjarmasin', '1971-02-16', '', '6271035602710000', 'Jalan Gagak No.247, Perumnas Baru Palangkaraya ,Kalteng 73112', 'Jalan Gagak No.247, Perumnas Baru Palangkaraya ,Kalteng 73112', 'Mandiri 159.000.197.540-7 ', '081251763629', '', 'sriyanti@mediaindonesia.com', 'surya_sriyanti2002@yahoo.com', '', 'Media Indonesia', 'Aktif', 'Palangkaraya', 'Daerah', 'Kalimantan Tengah', 'Indonesia', '2001-02-02', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(230, 'Moh. Aswandi ', 'Laki Laki', 'Batang Tarang ', '1979-01-26', '', '6171012601790009', 'Jalan Adi Sucipto. Gang : H. Muherman. No : 286. Pontianak Tenggara. Kota Pontianak. Kalimantan Barat.', 'Jalan Imam Bonjol.  Gang : Kuantan.  Nomor : 48. \nPontianak Selatan.  Kota Pontianak. Kalimantan Barat. HP : 08125713607', 'BCA : 171.049.4505', '085750808718', '08125713607', 'aswandi99@gmail.com', '', 'aswandi99', 'Metro TV', 'Aktif', 'Pontianak', 'Daerah', 'Kalimantan Barat', 'Indonesia', '2006-04-01', 'XXL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(231, 'Muhammad Nasir Putra', 'Laki Laki', 'Wajok Hilir', '1974-07-18', '', '', 'Jl. Raya Wajok Hilir Rt 02 Rw 03 Kel Wajok Hilir Kec. Siantan Kalimantan Barat', 'Jl. Raya Wajok Hilir Rt 02 Rw 03 Kel Wajok Hilir Kec. Siantan Kalimantan Barat', '', '085252606662', '', 'nasirputra2019@gmail.com', '', ' Nasir Putra', 'Metro TV', 'Aktif', 'Mempawah, Kubu Raya', 'Daerah', 'Kalimantan Barat', 'Indonesia', '2021-03-01', '', '2021-03-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(232, 'Rudi Agung Prabowo', 'Laki Laki', '', '0000-00-00', '', '', 'Jl Inpres IV (Padat karya II) KM 2 No 55 RT 10. Muara Rapak Balikpapan Utara, Kaltim', 'Jl Inpres IV (Padat karya II) KM 2 No 55 RT 10. Muara Rapak Balikpapan Utara, Kaltim', 'BCA 633.071.650-7 ', '085246429777', '', 'untuksaudararudi@yahoo.com', '', '', 'Media Indonesia', 'Aktif', 'Kalimantan Timur', 'Daerah', 'Kalimantan Timur', 'Indonesia', '2019-08-28', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(233, 'Muhamad Hilmansyah', 'Laki Laki', 'Marabahan', '1974-05-21', '', '647104210574006', 'Jl Abadi No. 44 RT. 11 Kel. Gn Sari Ilir, Balikpapan Tengah, Balikpapan - 706212', 'Jl Abadi No. 44 RT. 11 Kel. Gn Sari Ilir, Balikpapan Tengah, Balikpapan - 706212', 'BCA : 191.171.8150', '081346326871', '', 'muhammadhilmansyah@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Balikpapan', 'Daerah', 'Kalimantan Timur', 'Indonesia', '2004-01-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(234, 'Muhammad Amin', 'Laki Laki', 'Bima', '1986-06-25', '', '5206042606860001', 'Jln Dr Sutomo No 76, \nKelurahan Sidodadi, Kecamatan Samarinda Ulu, Kota Samarinda \nUP Mpm Finance (Chia)', 'Jln Dahlia no 7, kelurahan Bugis, kecamatan Samarinda Kota, kota Samarinda, Kantor Berita Antara news Kaltim, kode pos 75121\n', 'MANDIRI  : 1480011293597', '085242812328', '', 'amingladis07@gmail.com', '', 'amin gladis', 'Metro TV', 'Aktif', 'Samarinda', 'Daerah', 'Kalimantan Timur', 'Indonesia', '2016-04-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(235, 'Edi Akbar', 'Laki Laki', '', '0000-00-00', '', '', 'Jln mangga 3 sebelum cafe andika sebelah kanan jalan ada rumah hijau masuk gg,kelurahan karang ambun kecamatan tanjung redeb kabupaten berau kaltim 77311', 'Jln mangga 3 sebelum cafe andika sebelah kanan jalan ada rumah hijau masuk gg,kelurahan karang ambun kecamatan tanjung redeb kabupaten berau kaltim 77311', '', '081348134200', '', '', '', '', 'Metro TV', 'Aktif', 'Berau', 'Daerah', 'Kalimantan Timur', 'Indonesia', '2021-03-01', '', '2021-03-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(236, 'Muhammad  Reza Rizaldy', 'Laki Laki', 'Balaba', '1980-12-10', '', '6473041012800006', 'Jl. Padat Karya RT.16 No.98 Gg. Margodadi Karang Anyar Pantai Kota Tarakan Kalimantan Utara 77114//', 'Jl. Padat Karya RT.16 No.98 Gg. Margodadi Karang Anyar Pantai Kota Tarakan Kalimantan Utara 77114//', 'MANDIRI 148.00.1158807.9', '08115447798', '081254222900', 'mr_rezaku@yahoo.com ', '', 'reza_tarakan', 'Metro TV', 'Aktif', 'Tarakan, Nunukan, Bulungan, Berau, Malinau, Tidung - KalUt', 'Daerah', 'Kalimantan Utara', 'Indonesia', '2012-12-08', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(237, 'Andri Arnold', 'Laki Laki', 'Gorontalo ', '1985-09-09', '', '7501010609850001', 'Jln.Palma  Perum Balinda Blok. C17  Kelurahan Libuo,Kec.dunggingi Kota Gorontalo', 'Jln.Palma  Perum Balinda Blok. C17  Kelurahan Libuo,Kec.dunggingi Kota Gorontalo', 'BNI : 0168462501', '085240340956', '', 'andriarnold@rocketmail.com', '', 'andri arnold', 'Metro TV', 'Aktif', 'Gorontalo, Bone Bolango, Gorontalo Utara, Boalemo, Pohuwato', 'Daerah', 'Gorontalo', 'Indonesia', '2009-12-10', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(238, 'Achmad Fachmi', 'Laki Laki', 'Maros', '1993-12-13', '', '', ' Jl. Poros Kariango, Dusun Bugis No. 122, Desa Tenrigangkae, Kec. Mandai, Kab. Maros 90552', ' Jl. Poros Kariango, Dusun Bugis No. 122, Desa Tenrigangkae, Kec. Mandai, Kab. Maros 90552', 'Mandiri  152.001.753.695.0', '082349912233', '', 'fachmiachmad456@gmail.com', '', '', 'Metro TV', 'Aktif', 'MAROS & PANGKEP - SULAWESI SELATAN', 'Daerah', 'Sulawesi Selatan', 'Indonesia', '2019-08-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(239, 'Alfiansyah Anwar', 'Laki Laki', 'Pinrang', '1979-07-05', '', '', 'jl. Callakara no 1 kel labukkang kec ujung kota pare pare, Sulawesi Selatan 91111', 'jl. Callakara no 1 kel labukkang kec ujung kota pare pare, Sulawesi Selatan 91111', 'MANDIRI 152-001-0901-987', '085242214317', '081342688281  /  089 674 448 86  ', 'fiananwar@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Parepare, Pinrang, Sidrap, Barru', 'Daerah', 'Sulawesi Selatan', 'Indonesia', '2004-01-07', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(240, 'Ardiansah', 'Laki Laki', 'Kawari', '1987-12-02', '', '', 'Jl. Cendrawasih No. 133 RT 04 RW 01 Kode pos 90122 Kelurahan Mario Kecamatan Mariso Kota Makassar\nSulawesi Selatan', 'Jl. Cendrawasih No. 133 RT 04 RW 01 Kode pos 90122 Kelurahan Mario Kecamatan Mariso Kota Makassar\nSulawesi Selatan', 'MANDIRI 174.000.179.704.2 A/N NIRWANA', '085244540119', '', 'ardiansah.on@gmail.com', '', '', 'Metro TV', 'Aktif', 'JENEPONTO - SULAWESI SELATAN', 'Daerah', 'Sulawesi Selatan', 'Indonesia', '2019-08-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(241, 'Drs. Bahtiar', 'Laki Laki', 'Macanang', '1966-03-30', '', '7308213003660003 ', 'Jalan Sungai Limboto BTN Alda E.5\nKel. Bukak, Kec. Taneteriattang\nBone ? Sulawesi Selatan\n', 'Jalan Sungai Limboto BTN Alda E.5\nKel. Bukak, Kec. Taneteriattang\nBone ? Sulawesi Selatan\n', 'MANDIRI   152.00.0570030.3', '08124203090', '', 'tiarbn@yahoo.co.id', '', '', 'Metro TV', 'Aktif', 'Bone, Sinjai  (perbatasan Bone), Wajo', 'Daerah', 'Sulawesi Selatan', 'Indonesia', '2007-06-05', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(242, 'Faisal Wahab', 'Laki Laki', 'Ujung Pandang ', '1984-08-14', '', '7371081408840002 ', 'Komp. Graha Amaliah No.6, Jl. Muh. Tahir Ir No. 6 RT 03 RW 06, Kel.Balang Baru Kec. Tamalate Makasar, 90122 ', 'Jl.Muh Tahir lorong 5 \nPerumahan: Graha Amaliah No.6Kelurahan:  Balang BaruKecamatan: Tamlate Kota Makassar.\nKode Pos: 90224.No. Tlp: 081343600709   ', 'MANDIRI 152.00.109394.74', '081343600709', '', 'faizalwahab7@ymail.com', '', 'faizalwahab7', 'Metro TV', 'Aktif', 'Makassar, Maros, Pangkep', 'Daerah', 'Sulawesi Selatan', 'Indonesia', '2008-04-09', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(243, 'Lina Herlina ', 'Perempuan', 'Garut', '1979-06-20', '', '7371076006790000', 'Jl Dg Tata 1 Blok 5 Graha Tirta Duta D-4a, Makassar, Sulsel', 'Jl Dg Tata 1 Blok 5 Graha Tirta Duta D-4a, Makassar, Sulsel', '', '081241528796', '081213447078', 'lina@mediaindonesia.com', 'dikotadaeng@gmail.com', '', 'Media Indonesia', 'Aktif', 'Makassar', 'Daerah', 'Sulawesi Selatan', 'Indonesia', '2005-05-02', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(244, 'Muhajir Tangkesalu', 'Laki Laki', '', '0000-00-00', '', '', '', '', '2976788', '', '', '', '', '', 'Metro TV', 'Aktif', 'Tana Toraja', 'Daerah', 'Sulawesi Selatan', 'Indonesia', '0000-00-00', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(245, 'Muhammad Syawaluddin ', 'Laki Laki', 'Enrekang', '1987-03-06', '', '7371110306870001', 'Kota Makassar', '', 'Mandiri 152-00-1567671-7', '081355427008', '', 'syawal.alx@gmail.com', '', '', 'Medcom', 'Aktif', 'Sulawesi Selatan', 'Daerah', 'Sulawesi Selatan', 'Indonesia', '2019-01-16', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(246, 'Musdalifah', 'Perempuan', 'Bulukumba', '1986-11-27', '', '', 'BTN Puri Asri, Jl. Taman Bukit Permai No. 17, Desa Polewali, Kec. Gantarang, Kab. Bulukumba ', 'BTN Puri Asri, Jl. Taman Bukit Permai No. 17, Desa Polewali, Kec. Gantarang, Kab. Bulukumba ', 'MANDIRI 152.00.064859.12', '081341553663', '', 'ifamusdalifa2016@gmail.com', '', 'ifhametrotv86', 'Metro TV', 'Aktif', 'Bulukumba, Bantaeng, Sinjai (perbatasan Bulukumba)', 'Daerah', 'Sulawesi Selatan', 'Indonesia', '2007-06-05', 'S', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(247, 'Nurhalim Ali', 'Laki Laki', 'Batustanduk ', '1983-08-02', '', '', 'Dusun Buntu Tabang, Desa Sangtandung, Kab. Luwu', 'Dusun Buntu Tabang, Desa Sangtandung, Kab. Luwu', 'MANDIRI  152.000775436.5', '085397664480', '', 'aligalank@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Palopo, kab. Luwu, Luwu Utara, Luwu Timur', 'Daerah', 'Sulawesi Selatan', 'Indonesia', '2007-07-15', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(248, 'Slamet Basirun', 'Laki Laki', 'Ujung Pandang', '1975-03-07', '', '7,37112E+15', 'JL. Borong Jambu V No. 291 Prumnas Antang Blok I Kec Manggala', 'JL. Borong Jambu V No. 291 Prumnas Antang Blok I Kec Manggala', 'BCA      7890347813', '081334486227', '', 'memedtro@gmail.com', '', '', 'Metro TV', 'Aktif', 'Makassar,Gowa', 'Daerah', 'Sulawesi Selatan', 'Indonesia', '2018-11-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(249, 'Ahmad?Muhsin', 'Laki Laki', 'Ternate', '1979-09-15', '', '7271031509790002', 'Jalan Bulumasomba?No?88?Palu?Selatan?', 'Jalan Bulumasomba?No?88?Palu?Selatan?', 'MANDIRI  900.001.0840065', '081245209893', '', 'ahmadmatre@gmail.com', '', '', 'Metro TV', 'Aktif', 'Palu, Parigi Moutong, Donggala,Sigi', 'Daerah', 'Sulawesi Tengah', 'Indonesia', '2014-11-04', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(250, 'Mita Meinansi', 'Perempuan', 'Palu', '1982-05-07', '', '', 'Jl.  Brigjen Katamso Kel. Kasintuwu, Kec. Poso Kota Utara, Kab. Poso, Sulawesi Tengah ', 'Jl. Gelatik No. 48 (Depan SDIT Al Fahmi) Kel. Birobuli Utara, Kec. Palu Selatan, Kota Palu, Sulawesi Tengah. Kode Pos 94121.', 'MANDIRI 1510.0046.11122\n', '08124277599', '', 'mithameinansi@gmail.com', '', '', 'Metro TV', 'Aktif', 'Palu', 'Daerah', 'Sulawesi Tengah', 'Indonesia', '2016-05-25', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(251, 'M. Taufan SP Bustan ', 'Laki Laki', 'Palu', '1989-02-05', '', '7271020502890000', 'Jl, Uwe Pemata II, No 2, Kel Pengawu Kec Tatanga, Kota Palu, Prov Sulawesi Tengah  kode pos 94239', 'Jl, Uwe Pemata II, No 2, Kel Pengawu Kec Tatanga, Kota Palu, Prov Sulawesi Tengah  kode pos 94239', 'Mandiri 165.000.134.228-7 ', '08114511989', '085241113502', 'opn.m.taufan@gmail.com', '', '', 'Media Indonesia', 'Aktif', 'Palu', 'Daerah', 'Sulawesi Tengah', 'Indonesia', '2014-10-08', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(252, 'Abdul Halim Ahmad', 'Laki Laki', 'Ambon ', '1968-10-28', '', '7471102810680001', 'BTN Kendari Permai Blok V2 no 6 Kelurahan Padaleu Kecamatan kambu, kota kendari, Sulawesi Tenggara', 'BTN Kendari Permai Blok V2 no 6 Kelurahan Padaleu Kecamatan kambu, kota kendari, Sulawesi Tenggara', 'MANDIRI 152.000.2133.326', '0811407701', '', 'halim_agil@yahoo.com', '', '', 'Metro TV', 'Aktif', 'Kendari', 'Daerah', 'Sulawesi Tenggara', 'Indonesia', '2002-02-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(253, 'Amanda Komaling', 'Perempuan', 'Manado', '1978-04-20', '', '', 'Jln. Garuda Lorong Jiko no. 7 Makeret Barat Manado 95112 - Sulawesi Utara', 'Jln. Garuda Lorong Jiko no. 7 Makeret Barat Manado 95112 - Sulawesi Utara', 'BCA : 026.084.7589', '081356528206', '', 'amandakomaling@yahoo.com', '', 'amanda.komaling', 'Metro TV', 'Aktif', 'Manado, Minahasa, Minahasa Selatan,Utara,Tenggara, Kep. Sangihe, Talaud, Sitaro', 'Daerah', 'Sulawesi Utara', 'Indonesia', '2014-11-11', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(254, 'Mulyadi Pontororing', 'Laki Laki', '', '0000-00-00', '', '', 'Jl. Veteran, Jaga Vi, Desa Sea, Kec. Pineleng, Kab. Minahasa', 'Jl. Veteran, Jaga Vi, Desa Sea, Kec. Pineleng, Kab. Minahasa', 'BCA 7800320822', '085340333383', '', 'mulyadi.pontororing@gmail.com', '', '', 'Medcom', 'Aktif', 'Manado', 'Daerah', 'Sulawesi Utara', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(255, 'Voucke Lontaan ', 'Laki Laki', 'Manado', '1967-03-16', '', '7171051603670000', 'Jln Kelapa Kelurahan Banjer Lingkungan IV, Kecamatan Tikala, Kota Manado-Sulawesi Utara Kode Pos 95125', 'Jln Kelapa Kelurahan Banjer Lingkungan IV, Kecamatan Tikala, Kota Manado-Sulawesi Utara Kode Pos 95125', 'BCA 026-0707591 ', '081341030601', '', 'voucke@mediaindonesia.com', 'vouke_mdo@yahoo.com', '', 'Media Indonesia', 'Aktif', 'Manado', 'Daerah', 'Sulawesi Utara', 'Indonesia', '0000-00-00', 'XL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(256, 'Asrianto', 'Laki Laki', '', '0000-00-00', '', '', 'Jalan Ahmad Yani (belakang Alfamidi), Kelurahan Wattang, Kecamatan Polewali, Kabupaten Polewali Mandar, Sulawesi Barat. KP 91313.', 'Jalan Ahmad Yani (belakang Alfamidi), Kelurahan Wattang, Kecamatan Polewali, Kabupaten Polewali Mandar, Sulawesi Barat. KP 91313.', 'BRI 025901032306506 ', '081355530006', '', 'antobaladewa@gmail.com', '', '', 'Metro TV', 'Aktif', 'Polewali Mandar', 'Daerah', 'Sulawesi Barat', 'Indonesia', '2018-11-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(257, 'Irwan', 'Laki Laki', '', '0000-00-00', '', '7605081012930006', 'Segeri Kel. Baruga Dhua, Kec. Banggae Timur, Kab. Majene, Sulawesi Barat ', 'Jalan WR Monginsidi nomor 33, Lipu Kelurahan Labuang Utara Kecamatan Banggae Timur Kabupaten Majene, Sulawesi Barat Kantor Panwaslu Kecamatan Banggae Timur di depan Bengkel Majid Inti Motor.', 'BRI 746901004063530', '082347105579', '', 'irwanfals1993@gmail.com', '', '', 'Metro TV', 'Aktif', 'Majene, Mamuju, Mateng, Pasangkayu', 'Daerah', 'Sulawesi Barat', 'Indonesia', '2018-11-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(258, 'Hamdi Jempot', 'Laki Laki', 'Banda', '1977-11-20', '', '8171022211770005', 'Belakang SLB , Tanah Ratah Desa batu Merah, Kec. Sirimau, Kota Ambon Rt 06 Rw. 06, 97128', 'Belakang SLB , Tanah Ratah Desa batu Merah, Kec. Sirimau, Kota Ambon Rt 06 Rw. 06, 97128', 'MANDIRI : 152.001.115.2176', '085270232209', '081343004477', 'hjempot@yahoo.com', '', 'hamdijempot_metrotv', 'Metro TV', 'Aktif', 'Ambon', 'Daerah', 'Maluku', 'Indonesia', '2003-09-20', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(259, 'Hijrah Ibrahim', 'Laki Laki', 'Payahe', '1989-01-10', '', '', 'Kompleks Kelapa Pendek Rt 02 Rw 01, Kelurahan Mangga Dua Utara, Kecamatan Ternate Satan (Kediaman Ibu Wiwed Ichsan) Kabupaten/Kota : Ternate, Maluku Utara Kode Pos : 97713', 'Kompleks Kelapa Pendek Rt 02 Rw 01, Kelurahan Mangga Dua Utara, Kecamatan Ternate Satan (Kediaman Ibu Wiwed Ichsan) Kabupaten/Kota : Ternate, Maluku Utara Kode Pos : 97713', 'BNI 0466.221.011', '082291585989', '', 'hijrahternatee@gmail.com', '', '', 'Metro TV', 'Aktif', 'TERNATE - MALUKU UTARA', 'Daerah', 'Maluku', 'Indonesia', '2019-08-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(260, 'Andre Bernard Raunsay', 'Laki Laki', 'Lumpang ', '1986-11-09', '', '9201070911860005', 'AN. Surya Arifin, Dinas Pertambangan Dan Lingkungan Hidup  Jl. Sorong Klamono Km. 14 Kab. Sorong, Papua Barat', 'AN. Surya Arifin, Dinas Pertambangan Dan Lingkungan Hidup  Jl. Sorong Klamono Km. 14 Kab. Sorong, Papua Barat', 'BRI 2064-01-003172-50-9', '081344070711', '', 'liputantim@gmail.com', '', 'andre raunsay', 'Metro TV', 'Aktif', 'Kota Sorong', 'Daerah', 'Papua', 'Indonesia', '2016-05-25', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(261, 'Florentinus Alexander Tethool', 'Laki Laki', 'Kaimana', '1976-02-23', '', 'P9203.0028118', 'd.a. Rumah Bpk. Muhammad Taufik S. Jl. Trikora Wosi RT 02 Manokwari, Papua Barat\n', 'd.a. Rumah Bpk. Muhammad Taufik S. Jl. Trikora Wosi RT 02 Manokwari, Papua Barat\n', 'Mandiri 160-00-0069606-8\n', '085244240068', '', 'tethoolalex@gmail.com', '', 'Alex Tethool', 'Metro TV', 'Aktif', 'Fak Fak, Manokwari', 'Daerah', 'Papua', 'Indonesia', '2011-04-01', 'XXL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(262, 'Marcelinus Kelen ', 'Laki Laki', 'Flores Timur', '1984-04-09', '', '9171030904840000', 'Jln Swakarsa, Kampus C. Koya Barat, Distrik Muara Tami, Kota Jayapura - Papua', 'Jln Swakarsa, Kampus C. Koya Barat, Distrik Muara Tami, Kota Jayapura - Papua', 'MANDIRI 900-000-698-885-2 ', '081344816038', '', 'marcel.kelen@gmail.com', 'marcel@mediaindonesia.com', '', 'Media Indonesia', 'Aktif', 'Jayapura', 'Daerah', 'Papua', 'Indonesia', '0000-00-00', 'L', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(263, 'Martinus Solo', 'Laki Laki', 'Sumba', '1973-11-11', '', '9271021111730000', 'Jln.S.Kalagison,Km.10 Masuk,Kampung Bugis,Rt 1/Rw 3, Kota Sorong, Papua Barat', 'Jln.S.Kalagison,Km.10 Masuk,Kampung Bugis,Rt 1/Rw 3, Kota Sorong, Papua Barat', 'Mandiri 1540004815902 ', '082248322499', '', '', '', '', 'Media Indonesia', 'Aktif', 'Sorong, Papua Barat', 'Daerah', 'Papua', 'Indonesia', '2011-07-09', 'XXL', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(264, 'Michael Bambang Kabuare', 'Laki Laki', '', '0000-00-00', '', '', 'Jl. Danau Wam No. 22 PEPABRI Rufei, Kota Sorong, Papua Barat', 'Jl. Danau Wam No. 22 PEPABRI Rufei, Kota Sorong, Papua Barat', 'Mandiri 1600.0004.43222', '081344344181', '', 'mikesorong@gmail.com', 'martinus.solo@gmail.com', 'Michael Kabuare', 'Metro TV', 'Aktif', 'Kab. Sorong, Kota Sorong Selatan', 'Daerah', 'Papua', 'Indonesia', '2016-05-25', 'XL', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(265, 'Reyner Pietheyn Windesi', 'Laki Laki', '', '0000-00-00', '', '', 'Warnet Mahameru, Jl. Bandung No. 25 (belakang Masjid Alfalah) Kel. Karang Mulya, Kec. Nabire, Papua', 'Warnet Mahameru, Jl. Bandung No. 25 (belakang Masjid Alfalah) Kel. Karang Mulya, Kec. Nabire, Papua', 'Mandiri 154.001.145.6153', '085354493429', '', 'reynerwindesi@gmail.com', '', '', 'Metro TV', 'Aktif', 'Dogiyai, Deiyai, Intan Jaya PAPUA', 'Daerah', 'Papua', 'Indonesia', '2008-07-01', 'L', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(266, 'Ricardo Hutaean', 'Laki Laki', '', '0000-00-00', '', '', 'Jln. Kedamaian No. 8, Grand Kotara, Jayapura, Papua', 'Jln. Kedamaian No. 8, Grand Kotara, Jayapura, Papua', 'MANDIRI 900.002.042.3647', '081344045888', '', 'cardo_metro@yahoo.com', '', 'ricardo_hutahean', 'Metro TV', 'Aktif', 'Jayapura, Papua', 'Daerah', 'Papua', 'Indonesia', '2008-07-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(267, 'Roylinus Ratumakin ', 'Laki Laki', '', '0000-00-00', '', '', 'Jl. Sakura Gg Jati I No. A5 Perumnas II, Waena, Jayapura - Papua', 'Jl. Sakura Gg Jati I No. A5 Perumnas II, Waena, Jayapura - Papua', '', '82199369629', '', 'royratumakin@gmail.com', '', '', 'Medcom', 'Aktif', '', 'Daerah', 'Papua', 'Indonesia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(268, 'Terry Leisubun', 'Laki Laki', 'Nerong ', '1985-02-02', '', '', 'Terry  Leisubun alamat Kios Matoa Jalan Budi Utomo depan Satlantas,  Timika -papua Kode pos 99910', 'Terry  Leisubun alamat Kios Matoa Jalan Budi Utomo depan Satlantas,  Timika -papua Kode pos 99910', 'Mandiri 154.001.278.579.0  A.N Eleuterius Leisubun', '085244042030', '', 'terrytimika20@gmail.com', '', '', 'Metro TV', 'Aktif', 'KOTA ASMAT - PAPUA', 'Daerah', 'Papua', 'Indonesia', '2019-08-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(269, 'Fahmi Anhar Nurdiyanto', 'Laki Laki', '', '0000-00-00', '', '', 'Bourbon Docking & Sourcing DMCEST\nU-Bora Tower 2\n33rd Floor, Office No. 3301\nBusiness Bay, PO BOX 52782\nDubai, United Arab Emirates', 'Bourbon Docking & Sourcing DMCEST\nU-Bora Tower 2\n33rd Floor, Office No. 3301\nBusiness Bay, PO BOX 52782\nDubai, United Arab Emirates', 'BCA 1220857171  an Fahmi Anhar Nurdiyanto', '081227145999', '', 'fahmianhar21@gmail.com', '', '', 'Metro TV', 'Aktif', 'Dubai', 'Luar Negeri', 'Dubai', 'Uni Emirat Arab', '2018-07-04', 'M', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(270, 'Yusril Nurhidayat', 'Laki Laki', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', 'Metro TV', 'Aktif', 'Abu Dhabi', 'Luar Negeri', 'Abu Dhabi', 'Uni Emirat Arab', '0000-00-00', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(271, 'Mohamad Satria Wahab', 'Laki Laki', '', '0000-00-00', '', '', 'Jumeirah Village Circle, Plaza Residence 1302 B, Dubai, Uni Arab Emirat', 'Jumeirah Village Circle, Plaza Residence 1302 B, Dubai, Uni Arab Emirat', '', '081317939055', '', 'Riowahaab@gmail.com', '', '', 'Metro TV', 'Aktif', 'Dubai', 'Luar Negeri', 'Dubai', 'Uni Emirat Arab', '0000-00-00', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(272, 'Nobertus Ribut Santoso', 'Laki Laki', '', '0000-00-00', '', '', 'Malangrejo No.95 RT 02 RW 33 Wedomartani Ngemplak Sleman Yogyakarta', 'Malangrejo No.95 RT 02 RW 33 Wedomartani Ngemplak Sleman Yogyakarta', '', '081231119284', '', 'nobertusribut@gmail.com', '', '', 'Metro TV', 'Aktif', 'Manila', 'Luar Negeri', 'Manila', 'Filipina', '2019-11-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(273, 'Alis Nerindo', 'Laki Laki', '', '0000-00-00', '', '', 'Alamat yang sekarang: 13, Jalan K6, Amberhill, 53100 Kuala Lumpur, Selangor, Malaysia', 'Alamat yang sekarang: 13, Jalan K6, Amberhill, 53100 Kuala Lumpur, Selangor, Malaysia', '3920489451 BCA a.n. Rela Rasta Adytyana', '+60 1116754959', '', 'alisnerindo@gmail.com', '', '', 'Metro TV', 'Aktif', 'Kuala Lumpur', 'Luar Negeri', 'Kuala Lumpur', 'Malaysia', '2018-07-01', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(274, 'Nur Diyana Nawwar Ibrahim', 'Perempuan', '', '0000-00-00', '', '', 'Lot 535 Jalan Teluk Gadong 41250 Klang Selangor', 'Lot 535 Jalan Teluk Gadong 41250 Klang Selangor', '', '+60 1111645160', '', 'diyana.tmi@gmail.com', '', '', 'Metro TV', 'Aktif', 'Selangor', 'Luar Negeri', 'Selangor', 'Malaysia', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(275, 'Nadia Mohsin', 'Perempuan', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', 'Metro TV', 'Aktif', '', 'Luar Negeri', '', 'Malaysia', '0000-00-00', '', '2021-03-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(276, 'Muhammad Mahfudz Zelani', 'Laki Laki', 'Pamekasan', '1976-03-17', '', '', '17-2, Jalan Raja Abdullah\nKg. Baru Kuala Lumpur 50300\nMalaysia\n', '17-2, Jalan Raja Abdullah\nKg. Baru Kuala Lumpur 50300\nMalaysia\n', '', '+60 122588211', '', 'mahfudztejani@gmail.com', '', '', 'Metro TV', 'Aktif', 'Kuala Lumpur', 'Luar Negeri', 'Kuala Lumpur', 'Malaysia', '2020-06-13', '', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(277, 'Martha Ayu Mayaratih ', 'Perempuan', 'Denpasar', '1971-12-18', '', '', ' Brem 58, 7421 CH Deventer', ' Brem 58, 7421 CH Deventer', '\nMandiri 102-00-0616512-7\n', '+32 497905333', '', 'yukemayaratih@gmail.com', '', '', 'Metro TV', 'Aktif', 'Deventer', 'Luar Negeri', 'Deventer', 'Belanda', '2016-07-01', 'M', '2021-01-01', '2021-12-31', '', 1, '2021-07-30 00:20:14', 1, '2021-07-31 21:09:25'),
(278, 'Kontributor Admin', 'Laki Laki', 'Jakarta', '2021-08-31', 'c0348273ee46b66856091322d0bec21f.jpg', '-', 'kjlhgluyfl', 'ugvk', 'jhv', 'j,hv', ',jhv', 'kjads@sljdf.com', 'syguefygue@skudhf.com', 'sufgsiudgf', 'Aktif', 'Metro TV', 'Bogor', 'Jabodetabek', 'Jawa Barat', 'Indonesia', '2021-08-10', 'L', '2021-08-31', '2021-09-30', '3078f1dd2ab6447ec22b834e22fb4071.pdf', 1, '2021-08-31 21:46:14', 1, '2021-08-31 21:46:14');

-- --------------------------------------------------------

--
-- Table structure for table `m_kontributor_alat`
--

CREATE TABLE `m_kontributor_alat` (
  `id` int(11) NOT NULL,
  `kontributor_camera` varchar(255) NOT NULL,
  `kontributor_software` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_kontributor_alat`
--

INSERT INTO `m_kontributor_alat` (`id`, `kontributor_camera`, `kontributor_software`) VALUES
(278, 'mbg', 'cb');

-- --------------------------------------------------------

--
-- Table structure for table `m_kontributor_bpjs`
--

CREATE TABLE `m_kontributor_bpjs` (
  `id` int(11) NOT NULL,
  `kontributor_bpjs` varchar(255) NOT NULL,
  `kontributor_bpjs_nomor` varchar(255) NOT NULL,
  `kontributor_bpjs_istri` varchar(255) NOT NULL,
  `kontributor_bpjs_istri_nomor` varchar(255) NOT NULL,
  `kontributor_bpjs_anak1` varchar(255) NOT NULL,
  `kontributor_bpjs_anak1_nomor` varchar(255) NOT NULL,
  `kontributor_bpjs_anak2` varchar(255) NOT NULL,
  `kontributor_bpjs_anak2_nomor` varchar(255) NOT NULL,
  `kontributor_bpjs_anak3` varchar(255) NOT NULL,
  `kontributor_bpjs_anak3_nomor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_kontributor_bpjs`
--

INSERT INTO `m_kontributor_bpjs` (`id`, `kontributor_bpjs`, `kontributor_bpjs_nomor`, `kontributor_bpjs_istri`, `kontributor_bpjs_istri_nomor`, `kontributor_bpjs_anak1`, `kontributor_bpjs_anak1_nomor`, `kontributor_bpjs_anak2`, `kontributor_bpjs_anak2_nomor`, `kontributor_bpjs_anak3`, `kontributor_bpjs_anak3_nomor`) VALUES
(278, 'kjvkj', 'gvhjgv', 'mghv', 'mgv', 'm', 'gvcm', 'cgm', 'ghc', 'mg', 'hcmgc');

-- --------------------------------------------------------

--
-- Table structure for table `m_narasumber`
--

CREATE TABLE `m_narasumber` (
  `narasumber_id` int(11) NOT NULL,
  `narasumber_name` varchar(255) NOT NULL,
  `narasumber_telephone` varchar(255) NOT NULL,
  `narasumber_telephone_2` varchar(255) NOT NULL,
  `narasumber_email` varchar(255) NOT NULL,
  `narasumber_email_2` varchar(255) NOT NULL,
  `narasumber_addr` varchar(255) NOT NULL,
  `narasumber_city` varchar(255) NOT NULL,
  `narasumber_jabatan` varchar(255) NOT NULL,
  `narasumber_instansi` varchar(255) NOT NULL,
  `narasumber_partner` varchar(255) NOT NULL,
  `narasumber_partner_number` varchar(255) NOT NULL,
  `narasumber_keterangan` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_narasumber`
--

INSERT INTO `m_narasumber` (`narasumber_id`, `narasumber_name`, `narasumber_telephone`, `narasumber_telephone_2`, `narasumber_email`, `narasumber_email_2`, `narasumber_addr`, `narasumber_city`, `narasumber_jabatan`, `narasumber_instansi`, `narasumber_partner`, `narasumber_partner_number`, `narasumber_keterangan`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(2, 'asd', '123', '123', 'asd@123.com', 'bwe@09.com', 'sdfsdfsd', 'lknsksjdfnksjn', 'ljnjbkjn', 'kjnkjbnkjn', 'ASISTEN-sdfsdfsdfsdf', '123123', 'dfgsdfsdf', 1, '2021-07-14 21:57:59', 1, '2021-07-14 22:06:33');

-- --------------------------------------------------------

--
-- Table structure for table `m_nav`
--

CREATE TABLE `m_nav` (
  `nav_id` int(11) NOT NULL,
  `nav_name` varchar(255) NOT NULL,
  `nav_ctr` varchar(255) NOT NULL,
  `nav_icon` varchar(255) NOT NULL,
  `nav_order` int(11) NOT NULL,
  `is_stricted` int(11) NOT NULL DEFAULT 0 COMMENT '0 = No ; 1 = Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_nav`
--

INSERT INTO `m_nav` (`nav_id`, `nav_name`, `nav_ctr`, `nav_icon`, `nav_order`, `is_stricted`) VALUES
(2, 'Menu<br/>Admin', 'admin', 'fas fa-desktop', 10, 1),
(3, 'Surat <br/> Masuk', 'surat_masuk', 'fa fa-inbox', 1, 0),
(4, 'Surat<br/>Keluar', 'surat_keluar', 'fa fa-share-square', 2, 0),
(5, 'BPD<br/>Online', 'http://bpd-online.metrotv.co.id/login', 'fas fa-paper-plane', 3, 0),
(6, 'Booking<br/>Ruang Meeting', 'https://account.metrotv.co.id/auth/login', 'fas fa-handshake', 4, 0),
(7, 'Asset dan Loker<br/>Redaksi', 'https://account.metrotv.co.id/auth/login', 'fas fa-bars', 5, 0),
(8, 'Data <br/> Kontributor', 'kontributor', 'fas fa-users', 6, 0),
(9, 'Database<br/>SDM Redaksi', 'sdm_redaksi', 'fas fa-database', 7, 0),
(10, 'Database<br/>Narasumber', 'narasumber', 'fas fa-database', 8, 0),
(11, 'Form<br/>Redaksi', 'form', 'fa fa-file-alt', 9, 0),
(12, 'Navigation', 'admin/navigation', 'fas fa-cogs', 1, 1),
(13, 'User<br/>Management', 'admin/user_management', 'fas fa-users', 2, 1),
(14, 'User<br/>Access', 'admin/user_access', 'fas fa-desktop', 3, 1),
(15, 'Informasi', 'admin/informasi', 'fas fa-info-circle', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_nomor_surat`
--

CREATE TABLE `m_nomor_surat` (
  `id` int(11) NOT NULL,
  `last_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_role`
--

CREATE TABLE `m_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_role`
--

INSERT INTO `m_role` (`role_id`, `role_name`) VALUES
(1, 'User'),
(2, 'Admin'),
(3, 'Manager'),
(4, 'Wapemred'),
(5, 'Pemred');

-- --------------------------------------------------------

--
-- Table structure for table `m_status`
--

CREATE TABLE `m_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_status`
--

INSERT INTO `m_status` (`status_id`, `status_name`) VALUES
(1, 'DRAFT'),
(2, 'APPROVED'),
(3, 'SEND');

-- --------------------------------------------------------

--
-- Table structure for table `m_surat`
--

CREATE TABLE `m_surat` (
  `surat_id` int(11) NOT NULL,
  `surat_type` int(11) NOT NULL COMMENT '1 = In; 2 = Out',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_uac`
--

CREATE TABLE `m_uac` (
  `user_id` int(11) NOT NULL,
  `nav_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_uac`
--

INSERT INTO `m_uac` (`user_id`, `nav_id`, `created_by`, `created_date`) VALUES
(1, 2, 1, '2021-08-04 15:25:40'),
(1, 12, 1, '2021-08-04 15:25:40'),
(1, 13, 1, '2021-08-04 15:25:40'),
(1, 14, 1, '2021-08-04 15:25:40'),
(1, 15, 1, '2021-08-04 15:25:40'),
(2, 2, 1, '2021-08-04 21:48:26'),
(2, 12, 1, '2021-08-04 21:48:26'),
(2, 13, 1, '2021-08-04 21:48:26'),
(2, 14, 1, '2021-08-04 21:48:26'),
(2, 15, 1, '2021-08-04 21:48:26'),
(4, 2, 1, '2021-08-26 09:47:45'),
(4, 12, 1, '2021-08-26 09:47:45'),
(4, 13, 1, '2021-08-26 09:47:45'),
(4, 14, 1, '2021-08-26 09:47:45'),
(4, 15, 1, '2021-08-26 09:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `m_user`
--

CREATE TABLE `m_user` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_nip` varchar(100) NOT NULL,
  `user_fname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_photo` varchar(255) NOT NULL,
  `changed_password` int(11) NOT NULL COMMENT '0 = No; 1 = Yes',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_user`
--

INSERT INTO `m_user` (`user_id`, `role_id`, `user_name`, `user_pass`, `user_nip`, `user_fname`, `user_email`, `user_phone`, `user_photo`, `changed_password`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(1, 2, '9999999', '$2y$10$KkAc0DD7lUOzySKkCRKQ0ejDeQmnpdk0OUz6GwpD6JQxMeD.8QoYO', '9999999', 'Developer', 'it@mgn.com', '0123456789', 'a30b15504cfdda527df7f81e7da5bb47.jpeg', 1, 1, '2021-07-08 21:08:27', 1, '2021-09-01 20:52:39'),
(3, 1, '1193726', '$2y$10$6fLH3EJ36LO4KCHus79tkOIdubARV4QvlnIq75BHhDaz81GO8Vn7.', '1193726', 'Nurul Noviani Rafika', 'nurul.noviana@metrotvnews.com', '0', '', 1, 1, '2021-08-16 21:02:37', 3, '2021-08-16 21:07:06'),
(4, 2, '1193755', '$2y$10$eNHjVcYWqt6eiEw5oYgT.OhjwIspGQJfCBc7O7mqGw8ptxz2K7aIm', '1193755', 'Varuna Dewi', 'varuna.dewi@metrotvnews.com', '0', '', 1, 1, '2021-08-26 09:47:32', 4, '2021-08-26 09:48:09'),
(5, 2, '1111111', '$2y$10$KJd2R/..xaD1gklbjwOazuZV85F2Ioj8fb47le23UuAY62mzKDBO2', '1111111', 'Administrator', 'administrator@metrotvnews.com', '0', '', 0, 1, '2021-08-31 21:32:27', 1, '2021-08-31 21:32:27'),
(6, 5, '2222222', '$2y$10$br4LQGl/ZxT17i5BewjT/eUDkQEsDh8nY0q044bAjPe2Y2QBizIDC', '2222222', 'Pemred', 'pemred@metrotvnews.com', '0', '', 0, 1, '2021-08-31 21:32:48', 1, '2021-09-01 21:25:00'),
(7, 4, '3333333', '$2y$10$OffCCb0.FYCg55UEharRbuvRA7j2ikrn7jx9fjAqQSeXFiLHaQtmy', '3333333', 'Wapemred', 'wapemred@metrotvnews.com', '0', '', 0, 1, '2021-08-31 21:33:14', 1, '2021-09-01 21:24:52'),
(8, 3, '4444444', '$2y$10$B7wOLbjcvHznSKTkLF0YhOqO1mD2BQDbf0kyJ3nAV/OWG1YSsycem', '4444444', 'Manager', 'manager@metrotvnews.com', '0', '', 0, 1, '2021-08-31 21:33:34', 1, '2021-09-01 21:24:43'),
(9, 1, '0000000', '$2y$10$w/pItxUlRjS.rWfZ94pzPOhsXx8s3dBMbugpNTmm3E2PFcfQAXgei', '0000000', 'User', 'user@metrotvnews.com', '0', '', 1, 1, '2021-09-01 21:24:29', 9, '2021-09-01 21:25:24'),
(10, 1, '1122050', '$2y$10$Qx5c7c8RL7r03eJYKahsKeL2ochbzGtpUgkT8kTBsMPJGDMzCsRcu', '1122050', 'HERMANTO SITUMORANG', 'annomali74@gmail.com', '0', '', 1, 1, '2021-09-02 20:50:43', 1, '2021-09-05 13:36:06'),
(11, 1, '1234567', '$2y$10$BuTtysYc3JeyuMZom9XmyOEFsOficmeWg4jrwmogAXYPOu84bFoiG', '1234567', 'User Test', 'seftianalfredo.9@gmail.com', '0', '', 1, 1, '2021-09-03 20:45:07', 11, '2021-09-03 20:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `tr_disposisi`
--

CREATE TABLE `tr_disposisi` (
  `disposisi_id` int(11) NOT NULL,
  `surat_id` int(11) NOT NULL,
  `disposisi_title` varchar(255) NOT NULL,
  `disposisi_content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tr_notes_surat_keluar`
--

CREATE TABLE `tr_notes_surat_keluar` (
  `notes_id` int(11) NOT NULL,
  `surat_id` int(11) NOT NULL,
  `notes_context` text NOT NULL,
  `notes_by` int(11) NOT NULL,
  `notes_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tr_surat`
--

CREATE TABLE `tr_surat` (
  `tr_id` int(11) NOT NULL,
  `surat_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_count_kontributor`
-- (See below for the actual view)
--
CREATE TABLE `view_count_kontributor` (
`kontributor_province` varchar(255)
,`TOTAL` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_disposisi`
-- (See below for the actual view)
--
CREATE TABLE `view_disposisi` (
`disposisi_id` int(11)
,`surat_id` int(11)
,`disposisi_title` varchar(255)
,`user_fname` varchar(255)
,`user_email` varchar(255)
,`disposisi_content` text
,`created_by` int(11)
,`created_date` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_emp`
-- (See below for the actual view)
--
CREATE TABLE `view_emp` (
`emp_id` int(11)
,`emp_nip` varchar(50)
,`emp_fname` varchar(255)
,`emp_nname` varchar(255)
,`emp_photo` varchar(255)
,`emp_ext` varchar(100)
,`emp_phone1` varchar(100)
,`emp_phone2` varchar(100)
,`emp_jabatan` varchar(255)
,`emp_program` varchar(255)
,`emp_dept` varchar(255)
,`emp_div` varchar(255)
,`emp_comp` varchar(255)
,`emp_birth_place` varchar(100)
,`emp_birth_date` date
,`emp_nik` varchar(100)
,`emp_atasan` varchar(255)
,`emp_atasan_phone` varchar(100)
,`emp_email1` varchar(255)
,`emp_email2` varchar(255)
,`emp_address` text
,`emp_kontak_darurat_nama` varchar(255)
,`emp_kontak_darurat_nomor` varchar(100)
,`emp_passport` varchar(255)
,`emp_expiry_passport` varchar(100)
,`created_by` int(11)
,`created_date` datetime
,`modified_by` int(11)
,`modified_date` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_form`
-- (See below for the actual view)
--
CREATE TABLE `view_form` (
`form_id` int(11)
,`form_name` varchar(255)
,`form_description` text
,`form_file` varchar(255)
,`created_by` int(11)
,`created_date` datetime
,`modified_by` int(11)
,`modified_date` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_informasi`
-- (See below for the actual view)
--
CREATE TABLE `view_informasi` (
`informasi_id` int(11)
,`informasi_text` varchar(255)
,`informasi_content` text
,`is_active` int(11)
,`created_by` int(11)
,`created_date` datetime
,`modified_by` int(11)
,`modified_date` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_kontributor`
-- (See below for the actual view)
--
CREATE TABLE `view_kontributor` (
`kontributor_id` int(11)
,`kontributor_name` varchar(255)
,`kontributor_gender` varchar(255)
,`kontributor_birth_place` varchar(255)
,`kontributor_birth_date` date
,`kontributor_photo` varchar(255)
,`kontributor_identity` varchar(255)
,`kontributor_addr` text
,`kontributor_addr_kirim` text
,`kontributor_rek_number` varchar(255)
,`kontributor_telephone` varchar(255)
,`kontributor_telephone_2` varchar(255)
,`kontributor_email` varchar(255)
,`kontributor_email_2` varchar(255)
,`kontributor_skype` varchar(255)
,`kontributor_platform` varchar(255)
,`kontributor_status` varchar(255)
,`kontributor_area` varchar(255)
,`kontributor_wilayah` varchar(255)
,`kontributor_province` varchar(255)
,`kontributor_country` varchar(255)
,`kontributor_entry_date` date
,`kontributor_ukuran_baju` varchar(100)
,`kontributor_periode_start` date
,`kontributor_periode_end` date
,`kontributor_file` varchar(255)
,`created_by` int(11)
,`created_date` datetime
,`modified_by` int(11)
,`modified_date` datetime
,`kontributor_bpjs` varchar(255)
,`kontributor_bpjs_nomor` varchar(255)
,`kontributor_bpjs_istri` varchar(255)
,`kontributor_bpjs_istri_nomor` varchar(255)
,`kontributor_bpjs_anak1` varchar(255)
,`kontributor_bpjs_anak1_nomor` varchar(255)
,`kontributor_bpjs_anak2` varchar(255)
,`kontributor_bpjs_anak2_nomor` varchar(255)
,`kontributor_bpjs_anak3` varchar(255)
,`kontributor_bpjs_anak3_nomor` varchar(255)
,`kontributor_camera` varchar(255)
,`kontributor_software` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_narasumber`
-- (See below for the actual view)
--
CREATE TABLE `view_narasumber` (
`narasumber_id` int(11)
,`narasumber_name` varchar(255)
,`narasumber_telephone` varchar(255)
,`narasumber_telephone_2` varchar(255)
,`narasumber_email` varchar(255)
,`narasumber_email_2` varchar(255)
,`narasumber_addr` varchar(255)
,`narasumber_city` varchar(255)
,`narasumber_jabatan` varchar(255)
,`narasumber_instansi` varchar(255)
,`narasumber_partner` varchar(255)
,`narasumber_partner_number` varchar(255)
,`narasumber_keterangan` varchar(255)
,`created_by` int(11)
,`created_date` datetime
,`modified_by` int(11)
,`modified_date` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_nav`
-- (See below for the actual view)
--
CREATE TABLE `view_nav` (
`nav_id` int(11)
,`nav_name` varchar(255)
,`nav_ctr` varchar(255)
,`nav_icon` varchar(255)
,`nav_order` int(11)
,`is_stricted` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_nomor_surat`
-- (See below for the actual view)
--
CREATE TABLE `view_nomor_surat` (
`id` int(11)
,`last_number` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_notes_surat_keluar`
-- (See below for the actual view)
--
CREATE TABLE `view_notes_surat_keluar` (
`notes_id` int(11)
,`surat_id` int(11)
,`notes_context` text
,`notes_by` int(11)
,`user_nip` varchar(100)
,`user_fname` varchar(255)
,`user_email` varchar(255)
,`notes_date` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_surat`
-- (See below for the actual view)
--
CREATE TABLE `view_surat` (
`surat_id` int(11)
,`surat_type` int(11)
,`created_by` int(11)
,`created_date` datetime
,`modified_by` int(11)
,`modified_date` datetime
,`nomor_surat` varchar(255)
,`jenis_surat` int(11)
,`kepada` varchar(255)
,`pengirim` varchar(255)
,`jabatan_pengirim` varchar(255)
,`penerima` varchar(255)
,`jabatan_penerima` varchar(255)
,`instansi` varchar(255)
,`tanggal_acara` date
,`jam_acara` time
,`tanggal_surat` date
,`lokasi` varchar(255)
,`perihal` varchar(255)
,`area` varchar(255)
,`keterangan` varchar(255)
,`pemeriksa` varchar(255)
,`isi` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_surat_keluar`
-- (See below for the actual view)
--
CREATE TABLE `view_surat_keluar` (
`surat_id` int(11)
,`surat_type` int(11)
,`nomor_surat` varchar(255)
,`pengirim` varchar(255)
,`jabatan_pengirim` varchar(255)
,`penerima` varchar(255)
,`jabatan_penerima` varchar(255)
,`instansi` varchar(255)
,`tanggal_surat` date
,`perihal` varchar(255)
,`pemeriksa` varchar(255)
,`isi` text
,`created_by` int(11)
,`created_date` datetime
,`modified_by` int(11)
,`modified_date` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_surat_keluar_transaction`
-- (See below for the actual view)
--
CREATE TABLE `view_surat_keluar_transaction` (
`tr_id` int(11)
,`surat_id` int(11)
,`surat_type` int(11)
,`nomor_surat` varchar(255)
,`jenis_surat` int(11)
,`kepada` varchar(255)
,`pengirim` varchar(255)
,`pengirim_name` varchar(255)
,`pengirim_email` varchar(255)
,`jabatan_pengirim` varchar(255)
,`penerima` varchar(255)
,`jabatan_penerima` varchar(255)
,`instansi` varchar(255)
,`tanggal_acara` date
,`jam_acara` time
,`tanggal_surat` date
,`lokasi` varchar(255)
,`perihal` varchar(255)
,`area` varchar(255)
,`keterangan` varchar(255)
,`pemeriksa` varchar(255)
,`pemeriksa_name` varchar(255)
,`pemeriksa_email` varchar(255)
,`isi` text
,`status_id` int(11)
,`status_name` varchar(100)
,`created_by` int(11)
,`created_date` datetime
,`modified_by` int(11)
,`modified_date` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_surat_masuk`
-- (See below for the actual view)
--
CREATE TABLE `view_surat_masuk` (
`surat_id` int(11)
,`pengirim` varchar(255)
,`jenis_surat` int(11)
,`kepada` varchar(255)
,`user_fname` varchar(255)
,`user_email` varchar(255)
,`tanggal_acara` date
,`jam_acara` time
,`lokasi` varchar(255)
,`perihal` varchar(255)
,`area` varchar(255)
,`keterangan` varchar(255)
,`attachment_id` int(11)
,`attachment_name` varchar(255)
,`created_by` int(11)
,`created_date` datetime
,`modified_by` int(11)
,`modified_date` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_tr`
-- (See below for the actual view)
--
CREATE TABLE `view_tr` (
`tr_id` int(11)
,`surat_id` int(11)
,`surat_type` int(11)
,`nomor_surat` varchar(255)
,`jenis_surat` int(11)
,`kepada` varchar(255)
,`pengirim` varchar(255)
,`jabatan_pengirim` varchar(255)
,`penerima` varchar(255)
,`jabatan_penerima` varchar(255)
,`instansi` varchar(255)
,`tanggal_acara` date
,`jam_acara` time
,`tanggal_surat` date
,`lokasi` varchar(255)
,`perihal` varchar(255)
,`area` varchar(255)
,`keterangan` varchar(255)
,`pemeriksa` varchar(255)
,`isi` text
,`status_id` int(11)
,`status_name` varchar(100)
,`created_by` int(11)
,`created_date` datetime
,`modified_by` int(11)
,`modified_date` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_uac`
-- (See below for the actual view)
--
CREATE TABLE `view_uac` (
`user_id` int(11)
,`nav_id` int(11)
,`nav_name` varchar(255)
,`nav_ctr` varchar(255)
,`nav_icon` varchar(255)
,`nav_order` int(11)
,`is_stricted` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user`
-- (See below for the actual view)
--
CREATE TABLE `view_user` (
`user_id` int(11)
,`role_id` int(11)
,`role_name` varchar(100)
,`user_nip` varchar(100)
,`user_fname` varchar(255)
,`user_email` varchar(255)
,`user_phone` varchar(255)
,`user_photo` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_temp`
-- (See below for the actual view)
--
CREATE TABLE `vw_temp` (
`tr_id` int(11)
,`surat_id` int(11)
,`max_status_id` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `view_count_kontributor`
--
DROP TABLE IF EXISTS `view_count_kontributor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_count_kontributor`  AS SELECT `view_kontributor`.`kontributor_province` AS `kontributor_province`, count(0) AS `TOTAL` FROM `view_kontributor` GROUP BY `view_kontributor`.`kontributor_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_disposisi`
--
DROP TABLE IF EXISTS `view_disposisi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_disposisi`  AS SELECT `a`.`disposisi_id` AS `disposisi_id`, `a`.`surat_id` AS `surat_id`, `a`.`disposisi_title` AS `disposisi_title`, `b`.`user_fname` AS `user_fname`, `b`.`user_email` AS `user_email`, `a`.`disposisi_content` AS `disposisi_content`, `a`.`created_by` AS `created_by`, `a`.`created_date` AS `created_date` FROM (`tr_disposisi` `a` left join `m_user` `b` on(`a`.`disposisi_title` = `b`.`user_nip`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_emp`
--
DROP TABLE IF EXISTS `view_emp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_emp`  AS SELECT `m_emp`.`emp_id` AS `emp_id`, `m_emp`.`emp_nip` AS `emp_nip`, `m_emp`.`emp_fname` AS `emp_fname`, `m_emp`.`emp_nname` AS `emp_nname`, `m_emp`.`emp_photo` AS `emp_photo`, `m_emp`.`emp_ext` AS `emp_ext`, `m_emp`.`emp_phone1` AS `emp_phone1`, `m_emp`.`emp_phone2` AS `emp_phone2`, `m_emp`.`emp_jabatan` AS `emp_jabatan`, `m_emp`.`emp_program` AS `emp_program`, `m_emp`.`emp_dept` AS `emp_dept`, `m_emp`.`emp_div` AS `emp_div`, `m_emp`.`emp_comp` AS `emp_comp`, `m_emp`.`emp_birth_place` AS `emp_birth_place`, `m_emp`.`emp_birth_date` AS `emp_birth_date`, `m_emp`.`emp_nik` AS `emp_nik`, `m_emp`.`emp_atasan` AS `emp_atasan`, `m_emp`.`emp_atasan_phone` AS `emp_atasan_phone`, `m_emp`.`emp_email1` AS `emp_email1`, `m_emp`.`emp_email2` AS `emp_email2`, `m_emp`.`emp_address` AS `emp_address`, `m_emp`.`emp_kontak_darurat_nama` AS `emp_kontak_darurat_nama`, `m_emp`.`emp_kontak_darurat_nomor` AS `emp_kontak_darurat_nomor`, `m_emp`.`emp_passport` AS `emp_passport`, `m_emp`.`emp_expiry_passport` AS `emp_expiry_passport`, `m_emp`.`created_by` AS `created_by`, `m_emp`.`created_date` AS `created_date`, `m_emp`.`modified_by` AS `modified_by`, `m_emp`.`modified_date` AS `modified_date` FROM `m_emp` ;

-- --------------------------------------------------------

--
-- Structure for view `view_form`
--
DROP TABLE IF EXISTS `view_form`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_form`  AS SELECT `m_form`.`form_id` AS `form_id`, `m_form`.`form_name` AS `form_name`, `m_form`.`form_description` AS `form_description`, `m_form`.`form_file` AS `form_file`, `m_form`.`created_by` AS `created_by`, `m_form`.`created_date` AS `created_date`, `m_form`.`modified_by` AS `modified_by`, `m_form`.`modified_date` AS `modified_date` FROM `m_form` ;

-- --------------------------------------------------------

--
-- Structure for view `view_informasi`
--
DROP TABLE IF EXISTS `view_informasi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_informasi`  AS SELECT `m_informasi`.`informasi_id` AS `informasi_id`, `m_informasi`.`informasi_text` AS `informasi_text`, `m_informasi`.`informasi_content` AS `informasi_content`, `m_informasi`.`is_active` AS `is_active`, `m_informasi`.`created_by` AS `created_by`, `m_informasi`.`created_date` AS `created_date`, `m_informasi`.`modified_by` AS `modified_by`, `m_informasi`.`modified_date` AS `modified_date` FROM `m_informasi` ;

-- --------------------------------------------------------

--
-- Structure for view `view_kontributor`
--
DROP TABLE IF EXISTS `view_kontributor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_kontributor`  AS SELECT `a`.`kontributor_id` AS `kontributor_id`, `a`.`kontributor_name` AS `kontributor_name`, `a`.`kontributor_gender` AS `kontributor_gender`, `a`.`kontributor_birth_place` AS `kontributor_birth_place`, `a`.`kontributor_birth_date` AS `kontributor_birth_date`, `a`.`kontributor_photo` AS `kontributor_photo`, `a`.`kontributor_identity` AS `kontributor_identity`, `a`.`kontributor_addr` AS `kontributor_addr`, `a`.`kontributor_addr_kirim` AS `kontributor_addr_kirim`, `a`.`kontributor_rek_number` AS `kontributor_rek_number`, `a`.`kontributor_telephone` AS `kontributor_telephone`, `a`.`kontributor_telephone_2` AS `kontributor_telephone_2`, `a`.`kontributor_email` AS `kontributor_email`, `a`.`kontributor_email_2` AS `kontributor_email_2`, `a`.`kontributor_skype` AS `kontributor_skype`, `a`.`kontributor_platform` AS `kontributor_platform`, `a`.`kontributor_status` AS `kontributor_status`, `a`.`kontributor_area` AS `kontributor_area`, `a`.`kontributor_wilayah` AS `kontributor_wilayah`, `a`.`kontributor_province` AS `kontributor_province`, `a`.`kontributor_country` AS `kontributor_country`, `a`.`kontributor_entry_date` AS `kontributor_entry_date`, `a`.`kontributor_ukuran_baju` AS `kontributor_ukuran_baju`, `a`.`kontributor_periode_start` AS `kontributor_periode_start`, `a`.`kontributor_periode_end` AS `kontributor_periode_end`, `a`.`kontributor_file` AS `kontributor_file`, `a`.`created_by` AS `created_by`, `a`.`created_date` AS `created_date`, `a`.`modified_by` AS `modified_by`, `a`.`modified_date` AS `modified_date`, `b`.`kontributor_bpjs` AS `kontributor_bpjs`, `b`.`kontributor_bpjs_nomor` AS `kontributor_bpjs_nomor`, `b`.`kontributor_bpjs_istri` AS `kontributor_bpjs_istri`, `b`.`kontributor_bpjs_istri_nomor` AS `kontributor_bpjs_istri_nomor`, `b`.`kontributor_bpjs_anak1` AS `kontributor_bpjs_anak1`, `b`.`kontributor_bpjs_anak1_nomor` AS `kontributor_bpjs_anak1_nomor`, `b`.`kontributor_bpjs_anak2` AS `kontributor_bpjs_anak2`, `b`.`kontributor_bpjs_anak2_nomor` AS `kontributor_bpjs_anak2_nomor`, `b`.`kontributor_bpjs_anak3` AS `kontributor_bpjs_anak3`, `b`.`kontributor_bpjs_anak3_nomor` AS `kontributor_bpjs_anak3_nomor`, `c`.`kontributor_camera` AS `kontributor_camera`, `c`.`kontributor_software` AS `kontributor_software` FROM ((`m_kontributor` `a` left join `m_kontributor_bpjs` `b` on(`a`.`kontributor_id` = `b`.`id`)) left join `m_kontributor_alat` `c` on(`a`.`kontributor_id` = `c`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_narasumber`
--
DROP TABLE IF EXISTS `view_narasumber`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_narasumber`  AS SELECT `m_narasumber`.`narasumber_id` AS `narasumber_id`, `m_narasumber`.`narasumber_name` AS `narasumber_name`, `m_narasumber`.`narasumber_telephone` AS `narasumber_telephone`, `m_narasumber`.`narasumber_telephone_2` AS `narasumber_telephone_2`, `m_narasumber`.`narasumber_email` AS `narasumber_email`, `m_narasumber`.`narasumber_email_2` AS `narasumber_email_2`, `m_narasumber`.`narasumber_addr` AS `narasumber_addr`, `m_narasumber`.`narasumber_city` AS `narasumber_city`, `m_narasumber`.`narasumber_jabatan` AS `narasumber_jabatan`, `m_narasumber`.`narasumber_instansi` AS `narasumber_instansi`, `m_narasumber`.`narasumber_partner` AS `narasumber_partner`, `m_narasumber`.`narasumber_partner_number` AS `narasumber_partner_number`, `m_narasumber`.`narasumber_keterangan` AS `narasumber_keterangan`, `m_narasumber`.`created_by` AS `created_by`, `m_narasumber`.`created_date` AS `created_date`, `m_narasumber`.`modified_by` AS `modified_by`, `m_narasumber`.`modified_date` AS `modified_date` FROM `m_narasumber` ;

-- --------------------------------------------------------

--
-- Structure for view `view_nav`
--
DROP TABLE IF EXISTS `view_nav`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_nav`  AS SELECT `m_nav`.`nav_id` AS `nav_id`, `m_nav`.`nav_name` AS `nav_name`, `m_nav`.`nav_ctr` AS `nav_ctr`, `m_nav`.`nav_icon` AS `nav_icon`, `m_nav`.`nav_order` AS `nav_order`, `m_nav`.`is_stricted` AS `is_stricted` FROM `m_nav` ;

-- --------------------------------------------------------

--
-- Structure for view `view_nomor_surat`
--
DROP TABLE IF EXISTS `view_nomor_surat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_nomor_surat`  AS SELECT `m_nomor_surat`.`id` AS `id`, `m_nomor_surat`.`last_number` AS `last_number` FROM `m_nomor_surat` ORDER BY `m_nomor_surat`.`last_number` DESC LIMIT 0, 1 ;

-- --------------------------------------------------------

--
-- Structure for view `view_notes_surat_keluar`
--
DROP TABLE IF EXISTS `view_notes_surat_keluar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_notes_surat_keluar`  AS SELECT `a`.`notes_id` AS `notes_id`, `a`.`surat_id` AS `surat_id`, `a`.`notes_context` AS `notes_context`, `a`.`notes_by` AS `notes_by`, `b`.`user_nip` AS `user_nip`, `b`.`user_fname` AS `user_fname`, `b`.`user_email` AS `user_email`, `a`.`notes_date` AS `notes_date` FROM (`tr_notes_surat_keluar` `a` left join `m_user` `b` on(`a`.`notes_by` = `b`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_surat`
--
DROP TABLE IF EXISTS `view_surat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_surat`  AS SELECT `a`.`surat_id` AS `surat_id`, `a`.`surat_type` AS `surat_type`, `a`.`created_by` AS `created_by`, `a`.`created_date` AS `created_date`, `a`.`modified_by` AS `modified_by`, `a`.`modified_date` AS `modified_date`, `b`.`nomor_surat` AS `nomor_surat`, `b`.`jenis_surat` AS `jenis_surat`, `b`.`kepada` AS `kepada`, `b`.`pengirim` AS `pengirim`, `b`.`jabatan_pengirim` AS `jabatan_pengirim`, `b`.`penerima` AS `penerima`, `b`.`jabatan_penerima` AS `jabatan_penerima`, `b`.`instansi` AS `instansi`, `b`.`tanggal_acara` AS `tanggal_acara`, `b`.`jam_acara` AS `jam_acara`, `b`.`tanggal_surat` AS `tanggal_surat`, `b`.`lokasi` AS `lokasi`, `b`.`perihal` AS `perihal`, `b`.`area` AS `area`, `b`.`keterangan` AS `keterangan`, `b`.`pemeriksa` AS `pemeriksa`, `b`.`isi` AS `isi` FROM (`m_surat` `a` left join `md_surat` `b` on(`a`.`surat_id` = `b`.`surat_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_surat_keluar`
--
DROP TABLE IF EXISTS `view_surat_keluar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_surat_keluar`  AS SELECT `a`.`surat_id` AS `surat_id`, `a`.`surat_type` AS `surat_type`, `a`.`nomor_surat` AS `nomor_surat`, `a`.`pengirim` AS `pengirim`, `a`.`jabatan_pengirim` AS `jabatan_pengirim`, `a`.`penerima` AS `penerima`, `a`.`jabatan_penerima` AS `jabatan_penerima`, `a`.`instansi` AS `instansi`, `a`.`tanggal_surat` AS `tanggal_surat`, `a`.`perihal` AS `perihal`, `a`.`pemeriksa` AS `pemeriksa`, `a`.`isi` AS `isi`, `a`.`created_by` AS `created_by`, `a`.`created_date` AS `created_date`, `a`.`modified_by` AS `modified_by`, `a`.`modified_date` AS `modified_date` FROM `view_surat` AS `a` WHERE `a`.`surat_type` = 2 ;

-- --------------------------------------------------------

--
-- Structure for view `view_surat_keluar_transaction`
--
DROP TABLE IF EXISTS `view_surat_keluar_transaction`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_surat_keluar_transaction`  AS SELECT `a`.`tr_id` AS `tr_id`, `a`.`surat_id` AS `surat_id`, `a`.`surat_type` AS `surat_type`, `a`.`nomor_surat` AS `nomor_surat`, `a`.`jenis_surat` AS `jenis_surat`, `a`.`kepada` AS `kepada`, `a`.`pengirim` AS `pengirim`, `c`.`user_fname` AS `pengirim_name`, `c`.`user_email` AS `pengirim_email`, `a`.`jabatan_pengirim` AS `jabatan_pengirim`, `a`.`penerima` AS `penerima`, `a`.`jabatan_penerima` AS `jabatan_penerima`, `a`.`instansi` AS `instansi`, `a`.`tanggal_acara` AS `tanggal_acara`, `a`.`jam_acara` AS `jam_acara`, `a`.`tanggal_surat` AS `tanggal_surat`, `a`.`lokasi` AS `lokasi`, `a`.`perihal` AS `perihal`, `a`.`area` AS `area`, `a`.`keterangan` AS `keterangan`, `a`.`pemeriksa` AS `pemeriksa`, `d`.`user_fname` AS `pemeriksa_name`, `d`.`user_email` AS `pemeriksa_email`, `a`.`isi` AS `isi`, `a`.`status_id` AS `status_id`, `a`.`status_name` AS `status_name`, `a`.`created_by` AS `created_by`, `a`.`created_date` AS `created_date`, `a`.`modified_by` AS `modified_by`, `a`.`modified_date` AS `modified_date` FROM (((`view_tr` `a` join `vw_temp` `b` on(`a`.`surat_id` = `b`.`surat_id` and `a`.`status_id` = `b`.`max_status_id`)) left join `m_user` `c` on(`a`.`pengirim` = `c`.`user_nip`)) left join `m_user` `d` on(`a`.`pemeriksa` = `d`.`user_nip`)) WHERE `a`.`surat_type` = 2 ;

-- --------------------------------------------------------

--
-- Structure for view `view_surat_masuk`
--
DROP TABLE IF EXISTS `view_surat_masuk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_surat_masuk`  AS SELECT `a`.`surat_id` AS `surat_id`, `a`.`pengirim` AS `pengirim`, `a`.`jenis_surat` AS `jenis_surat`, `a`.`kepada` AS `kepada`, `c`.`user_fname` AS `user_fname`, `c`.`user_email` AS `user_email`, `a`.`tanggal_acara` AS `tanggal_acara`, `a`.`jam_acara` AS `jam_acara`, `a`.`lokasi` AS `lokasi`, `a`.`perihal` AS `perihal`, `a`.`area` AS `area`, `a`.`keterangan` AS `keterangan`, `b`.`attachment_id` AS `attachment_id`, `b`.`attachment_name` AS `attachment_name`, `a`.`created_by` AS `created_by`, `a`.`created_date` AS `created_date`, `a`.`modified_by` AS `modified_by`, `a`.`modified_date` AS `modified_date` FROM ((`view_surat` `a` left join `m_attachment_surat` `b` on(`a`.`surat_id` = `b`.`surat_id`)) left join `m_user` `c` on(`a`.`kepada` = `c`.`user_nip`)) WHERE `a`.`surat_type` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `view_tr`
--
DROP TABLE IF EXISTS `view_tr`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_tr`  AS SELECT `a`.`tr_id` AS `tr_id`, `a`.`surat_id` AS `surat_id`, `b`.`surat_type` AS `surat_type`, `b`.`nomor_surat` AS `nomor_surat`, `b`.`jenis_surat` AS `jenis_surat`, `b`.`kepada` AS `kepada`, `b`.`pengirim` AS `pengirim`, `b`.`jabatan_pengirim` AS `jabatan_pengirim`, `b`.`penerima` AS `penerima`, `b`.`jabatan_penerima` AS `jabatan_penerima`, `b`.`instansi` AS `instansi`, `b`.`tanggal_acara` AS `tanggal_acara`, `b`.`jam_acara` AS `jam_acara`, `b`.`tanggal_surat` AS `tanggal_surat`, `b`.`lokasi` AS `lokasi`, `b`.`perihal` AS `perihal`, `b`.`area` AS `area`, `b`.`keterangan` AS `keterangan`, `b`.`pemeriksa` AS `pemeriksa`, `b`.`isi` AS `isi`, `a`.`status_id` AS `status_id`, `c`.`status_name` AS `status_name`, `a`.`created_by` AS `created_by`, `a`.`created_date` AS `created_date`, `a`.`modified_by` AS `modified_by`, `a`.`modified_date` AS `modified_date` FROM ((`tr_surat` `a` left join `view_surat` `b` on(`a`.`surat_id` = `b`.`surat_id`)) left join `m_status` `c` on(`a`.`status_id` = `c`.`status_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_uac`
--
DROP TABLE IF EXISTS `view_uac`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_uac`  AS SELECT `a`.`user_id` AS `user_id`, `b`.`nav_id` AS `nav_id`, `b`.`nav_name` AS `nav_name`, `b`.`nav_ctr` AS `nav_ctr`, `b`.`nav_icon` AS `nav_icon`, `b`.`nav_order` AS `nav_order`, `b`.`is_stricted` AS `is_stricted` FROM (`m_uac` `a` left join `view_nav` `b` on(`a`.`nav_id` = `b`.`nav_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `view_user`  AS SELECT `a`.`user_id` AS `user_id`, `a`.`role_id` AS `role_id`, `b`.`role_name` AS `role_name`, `a`.`user_nip` AS `user_nip`, `a`.`user_fname` AS `user_fname`, `a`.`user_email` AS `user_email`, `a`.`user_phone` AS `user_phone`, `a`.`user_photo` AS `user_photo` FROM (`m_user` `a` left join `m_role` `b` on(`a`.`role_id` = `b`.`role_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_temp`
--
DROP TABLE IF EXISTS `vw_temp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `vw_temp`  AS SELECT `view_tr`.`tr_id` AS `tr_id`, `view_tr`.`surat_id` AS `surat_id`, max(`view_tr`.`status_id`) AS `max_status_id` FROM `view_tr` GROUP BY `view_tr`.`surat_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `md_surat`
--
ALTER TABLE `md_surat`
  ADD PRIMARY KEY (`surat_id`);

--
-- Indexes for table `m_attachment_surat`
--
ALTER TABLE `m_attachment_surat`
  ADD PRIMARY KEY (`attachment_id`);

--
-- Indexes for table `m_emp`
--
ALTER TABLE `m_emp`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `m_form`
--
ALTER TABLE `m_form`
  ADD PRIMARY KEY (`form_id`);

--
-- Indexes for table `m_informasi`
--
ALTER TABLE `m_informasi`
  ADD PRIMARY KEY (`informasi_id`);

--
-- Indexes for table `m_kontributor`
--
ALTER TABLE `m_kontributor`
  ADD PRIMARY KEY (`kontributor_id`);

--
-- Indexes for table `m_kontributor_alat`
--
ALTER TABLE `m_kontributor_alat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_kontributor_bpjs`
--
ALTER TABLE `m_kontributor_bpjs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_narasumber`
--
ALTER TABLE `m_narasumber`
  ADD PRIMARY KEY (`narasumber_id`);

--
-- Indexes for table `m_nav`
--
ALTER TABLE `m_nav`
  ADD PRIMARY KEY (`nav_id`);

--
-- Indexes for table `m_nomor_surat`
--
ALTER TABLE `m_nomor_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_role`
--
ALTER TABLE `m_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `m_status`
--
ALTER TABLE `m_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `m_surat`
--
ALTER TABLE `m_surat`
  ADD PRIMARY KEY (`surat_id`);

--
-- Indexes for table `m_uac`
--
ALTER TABLE `m_uac`
  ADD PRIMARY KEY (`user_id`,`nav_id`);

--
-- Indexes for table `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tr_disposisi`
--
ALTER TABLE `tr_disposisi`
  ADD PRIMARY KEY (`disposisi_id`);

--
-- Indexes for table `tr_notes_surat_keluar`
--
ALTER TABLE `tr_notes_surat_keluar`
  ADD PRIMARY KEY (`notes_id`);

--
-- Indexes for table `tr_surat`
--
ALTER TABLE `tr_surat`
  ADD PRIMARY KEY (`tr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_attachment_surat`
--
ALTER TABLE `m_attachment_surat`
  MODIFY `attachment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_emp`
--
ALTER TABLE `m_emp`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `m_form`
--
ALTER TABLE `m_form`
  MODIFY `form_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_informasi`
--
ALTER TABLE `m_informasi`
  MODIFY `informasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_kontributor`
--
ALTER TABLE `m_kontributor`
  MODIFY `kontributor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;

--
-- AUTO_INCREMENT for table `m_narasumber`
--
ALTER TABLE `m_narasumber`
  MODIFY `narasumber_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_nav`
--
ALTER TABLE `m_nav`
  MODIFY `nav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `m_nomor_surat`
--
ALTER TABLE `m_nomor_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_role`
--
ALTER TABLE `m_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `m_status`
--
ALTER TABLE `m_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_surat`
--
ALTER TABLE `m_surat`
  MODIFY `surat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_user`
--
ALTER TABLE `m_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tr_disposisi`
--
ALTER TABLE `tr_disposisi`
  MODIFY `disposisi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tr_notes_surat_keluar`
--
ALTER TABLE `tr_notes_surat_keluar`
  MODIFY `notes_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tr_surat`
--
ALTER TABLE `tr_surat`
  MODIFY `tr_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
