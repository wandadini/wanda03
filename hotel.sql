-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Mar 2022 pada 07.32
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `apartemen`
--

CREATE TABLE `apartemen` (
  `id_apartemen` int(11) NOT NULL,
  `nama_apartemen` varchar(200) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `harga` double NOT NULL,
  `harga_bulan` double NOT NULL,
  `harga_tahun` double NOT NULL,
  `foto` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apartemen`
--

INSERT INTO `apartemen` (`id_apartemen`, `nama_apartemen`, `id_kota`, `harga`, `harga_bulan`, `harga_tahun`, `foto`) VALUES
(10, 'DABELMROMM EXTRA DABEL', 1, 10000000, 100000, 100000, '0f2256fc70c1f7333a298ee8713fce1d1.jpg'),
(11, 'suporior', 1, 111, 111, 11111, '1479097083.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` int(11) NOT NULL,
  `fasilitas_hotel` varchar(200) NOT NULL,
  `foto` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fasilitas`
--

INSERT INTO `fasilitas` (`id_fasilitas`, `fasilitas_hotel`, `foto`) VALUES
(1, 'qehqhSHahdsaG', 'HOME.JPG\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `nama_kamar` varchar(200) NOT NULL,
  `id_type` int(11) NOT NULL,
  `fasilitas` varchar(200) NOT NULL,
  `harga` double NOT NULL,
  `harga_bulan` double NOT NULL,
  `harga_tahun` double NOT NULL,
  `foto` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nama_kamar`, `id_type`, `fasilitas`, `harga`, `harga_bulan`, `harga_tahun`, `foto`) VALUES
(0, 'qsjqkjskq', 3, '', 121213, 32132312, 312321333333321, '0f2256fc70c1f7333a298ee8713fce1d51.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota`
--

CREATE TABLE `kota` (
  `id_kota` int(11) NOT NULL,
  `nama_kota` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kota`
--

INSERT INTO `kota` (`id_kota`, `nama_kota`) VALUES
(1, 'bandung'),
(2, 'surabaya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `kode_booking` varchar(20) NOT NULL,
  `nomor_kamar` varchar(20) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `permalam` int(11) NOT NULL,
  `checkin` date NOT NULL,
  `paket` varchar(200) NOT NULL,
  `jumlah_paket` int(11) NOT NULL,
  `total_bayar` double NOT NULL,
  `bukti_transfer` text DEFAULT NULL,
  `jenis_pembayaran` varchar(100) NOT NULL,
  `status_pembayaran` enum('sudah_dibayar','belum_dibayar','proses_verifikasi','ditolak') NOT NULL DEFAULT 'belum_dibayar',
  `tgl_pesan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `kode_booking`, `nomor_kamar`, `id_user`, `id_kamar`, `permalam`, `checkin`, `paket`, `jumlah_paket`, `total_bayar`, `bukti_transfer`, `jenis_pembayaran`, `status_pembayaran`, `tgl_pesan`) VALUES
(1, 'BK-0001', '305', 2, 1, 1, '2019-11-20', 'harian', 1, 300000, NULL, 'cash', 'sudah_dibayar', '2019-11-20'),
(2, 'BK-0002', '001', 2, 1, 1, '2019-11-20', 'harian', 1, 300000, '23.jpeg', 'transfer', 'sudah_dibayar', '2019-11-20'),
(3, 'BK-0003', NULL, 2, 1, 1, '2019-12-12', 'harian', 1, 300000, 'header2.jpg', 'transfer', 'sudah_dibayar', '2019-11-21'),
(4, 'BK-0004', NULL, 2, 1, 2, '2019-12-12', 'harian', 2, 600000, NULL, 'cash', 'ditolak', '2019-11-21'),
(5, 'BK-0005', '002', 2, 1, 12, '2019-12-12', 'harian', 12, 3600000, 'anime-boy-sad.jpg', 'transfer', 'sudah_dibayar', '2019-11-21'),
(6, 'BK-0006', '337', 3, 1, 3, '2019-11-21', 'harian', 3, 900000, '54350293_2593634993983993_2715256269874135040_n.jpg', 'transfer', 'sudah_dibayar', '2019-11-21'),
(7, 'BK-0007', 'j17', 4, 3, 3, '2020-06-24', 'harian', 3, 600000, NULL, 'cash', 'sudah_dibayar', '2020-06-10'),
(8, 'BK-0008', 'A001', 5, 4, 1, '2021-11-27', 'harian', 1, 550000, '1_.png', 'transfer', 'sudah_dibayar', '2021-11-26'),
(9, 'BK-0009', NULL, 1, 7, 210, '0077-09-09', 'bulanan', 7, -35, NULL, 'transfer', 'belum_dibayar', '2022-03-04'),
(10, 'BK-0010', '12', 6, 1, 1, '2022-03-23', 'harian', 1, 300000, 'home.jpg', 'transfer', 'sudah_dibayar', '2022-03-04'),
(11, 'BK-0011', NULL, 1, 8, 30, '2222-02-22', 'bulanan', 1, 1000, NULL, 'transfer', 'belum_dibayar', '2022-03-06'),
(12, 'BK-0012', NULL, 0, 8, 1, '0000-00-00', 'harian', 1, 1000, NULL, 'transfer', 'belum_dibayar', '2022-03-07'),
(13, 'BK-0013', NULL, 0, 9, 3, '0004-05-05', 'harian', 3, 300000, NULL, 'transfer', 'belum_dibayar', '2022-03-09'),
(0, '', NULL, 0, 1, 365, '2022-03-21', 'permalam', 1, 10000, NULL, 'transfer', 'belum_dibayar', '2022-03-16'),
(0, '', NULL, 0, 1, 365, '2022-03-19', 'permalam', 1, 10000, NULL, 'transfer', 'belum_dibayar', '2022-03-17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `type`
--

CREATE TABLE `type` (
  `id_type` int(11) NOT NULL,
  `type_kamar` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `type`
--

INSERT INTO `type` (`id_type`, `type_kamar`) VALUES
(1, 'TV,KULKAS,AC,KIPAS ANGIN,SOPA,KAMAR MANDI,SATU BAUAH TEMPAT TIDUR'),
(2, 'TV,KULKAS,AC,KIPAS ANGIN,SOPA,KAMAR MANDI,LEMARI,MEJA MAKAN,SATU BAUAH TEMPAT TIDUR'),
(3, 'KIPAS ANGIN,SOPA,KAMAR MANDI,LEMARI,MEJA MAKAN,SATU BAUAH TEMPAT TIDUR'),
(4, 'TV,KULKAS,AC,KIPAS ANGIN,SOPA,KAMAR MANDI,SATU BAUAH TEMPAT TIDUR'),
(5, 'TV,KULKAS,TV,KULKAS,ACAC,KIPAS ANGIN,SOPA,SATU BAUAH TEMPAT TIDUR'),
(6, 'TV,KULKAS,AC,SATU BAUAH TEMPAT TIDUR');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 = admin, 2 = tamu,3=resepsiomis'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `alamat`, `no_hp`, `username`, `password`, `level`) VALUES
(3, 'aldi', 'aldi', 'lkljj', 'aldi', 'aldi', 1),
(6, 'mulyani', 'ashdjhsafh', '343', 'aku', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(12, '12345easdfas', 'dsadasdas', 'cjdhsfjhsdjf', 'admin13', 'admin13', 1),
(4, 'hfhsfjhsjfhshf', 'dfjehsfjhsjhf', 'jfdjfkdsjfk', 'aldirahman', '1234567', 1),
(6, 'mulyani', 'ashdjhsafh', '343', 'aku', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(0, 'wida', 'ejrtejrterkjt', 'k4hrklweurwe', 'wida', '827ccb0eea8a706c4c34a16891f84e7b', 2),
(0, 'admin', 'xdfdghgshg', 'dsghasgvhdgasgd', 'mul', '81dc9bdb52d04dc20036dbd8313ed055', 2),
(1, 'weuwerjefhsjkdfeemfrn', 'eekrhjkewhfkhwef', '754756465', 'wil', '12345', 1),
(1, 'hhdjashdjas', ' sndjsahdas', 'h7665473546536', 'naz', '827ccb0eea8a706c4c34a16891f84e7b', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
