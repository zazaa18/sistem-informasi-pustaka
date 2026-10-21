-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2026 at 03:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pustaka_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_admin`, `created_at`) VALUES
(1, 'admin', '$2y$10$emhten3N1JxP6lBwzFDRcuuAhcZEkAHb6myRLb5aK9M35mLWS4tAG', 'Petugas Perpustakaan', '2026-10-20 16:02:55');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `penulis` varchar(150) NOT NULL,
  `penerbit` varchar(150) DEFAULT NULL,
  `cover_buku` varchar(255) DEFAULT 'cover-default.jpg',
  `stok_total` int(11) NOT NULL DEFAULT 1,
  `stok_tersedia` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `judul_buku`, `penulis`, `penerbit`, `cover_buku`, `stok_total`, `stok_tersedia`, `created_at`, `gambar`) VALUES
(1, 2, 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', 'cover-default.jpg', 10, 3, '2026-10-20 12:52:14', 'buku_6ad7a62613d0e5.22679725.jpg'),
(2, 1, 'Pemrograman Python untuk Pemula', 'Sugeng Winardi, S.Kom., M.T.', 'Deepublish', 'cover-default.jpg', 15, 11, '2026-10-20 12:52:14', 'buku_6ad7a494ddcb36.34944377.jpg'),
(3, 2, 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Lentera Dipantara', 'cover-default.jpg', 8, 1, '2026-10-20 12:52:14', 'buku_6ad7a35d35e265.30483109.jpg'),
(4, 2, 'Filosofi Teras', 'Henry Manampiring', 'Kompas', 'cover-default.jpg', 5, 0, '2026-10-20 12:52:14', 'filosofi.jpg'),
(5, 3, 'Matematika Diskrit', 'Rinaldi Munir', 'Informatika', 'cover-default.jpg', 12, 6, '2026-10-20 12:52:14', 'buku_6ad7a239929f12.23273818.jpg'),
(7, 4, 'Manajemen Strategik & Bisnis.', 'Dr. Yanto Ramli, M.M. dan Prof. Dr. Hj. Dwi Kartini, S.E., Spec. Lic.', 'Bumi Aksara.', 'cover-default.jpg', 14, 13, '2026-10-20 12:52:14', 'manajemen.jpg'),
(8, 4, 'Digital Marketing', 'Avijit Kumar Roy dan Aritra Kumar Roy', 'OrangeBooks Publication', 'cover-default.jpg', 9, 0, '2026-10-20 12:52:14', 'digital.jpg'),
(9, 5, 'Sejarah Dunia yang Disembunyikan', 'Jonathan Black', 'Alvabet', 'cover-default.jpg', 15, 15, '2026-10-20 12:52:14', 'sejarah.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `created_at`) VALUES
(1, 'Teknologi & Komputer', '2026-10-20 12:52:14'),
(2, 'Novel & Sastra', '2026-10-20 12:52:14'),
(3, 'Sains & Matematika', '2026-10-20 12:52:14'),
(4, 'Ekonomi & Bisnis', '2026-10-20 12:52:14'),
(5, 'Sejarah & Kebudayaan', '2026-10-20 12:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `kode_transaksi` varchar(20) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `nama_peminjam` varchar(150) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `tanggal_pengajuan` datetime DEFAULT current_timestamp(),
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali_rencana` date NOT NULL,
  `tanggal_kembali_real` date DEFAULT NULL,
  `denda` decimal(10,2) DEFAULT 0.00,
  `status` enum('Pending','Dipinjam','Selesai','Ditolak') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `kode_transaksi`, `id_buku`, `nama_peminjam`, `no_hp`, `tanggal_pengajuan`, `tanggal_pinjam`, `tanggal_kembali_rencana`, `tanggal_kembali_real`, `denda`, `status`, `created_at`) VALUES
(1, 'TRX2026102004BC', 9, 'zaza', '89876534312', '2026-10-20 17:22:19', NULL, '2026-10-28', NULL, 0.00, 'Ditolak', '2026-10-20 15:22:19'),
(2, 'TRX20261020AAEE', 9, 'zaza', '89876534312', '2026-10-20 17:23:49', '2026-10-20', '2026-10-28', '2026-10-21', 0.00, 'Selesai', '2026-10-20 15:23:49'),
(3, 'TRX202610201F5F', 9, 'zaza', '87654329876', '2026-10-20 17:25:38', NULL, '2026-10-28', NULL, 0.00, 'Ditolak', '2026-10-20 15:25:38'),
(4, 'TRX20261020AD66', 7, 'neyra', '087543854321', '2026-10-20 21:55:56', '2026-10-20', '2026-10-24', '2026-10-21', 0.00, 'Selesai', '2026-10-20 19:55:56'),
(5, 'TRX20261020BD48', 2, 'bella', '085432179765', '2026-10-20 21:56:30', NULL, '2026-10-26', NULL, 0.00, 'Pending', '2026-10-20 19:56:30'),
(6, 'TRX202610215F9B', 7, 'aura', '085432198765', '2026-10-21 01:31:56', '2026-10-21', '2026-10-30', NULL, 0.00, 'Dipinjam', '2026-10-20 23:31:56'),
(7, 'TRX202610212699', 2, 'dika', '085432761987', '2026-10-21 01:32:31', '2026-10-21', '2026-11-05', NULL, 0.00, 'Dipinjam', '2026-10-20 23:32:31'),
(8, 'TRX20261021E1C2', 5, 'dinda', '087654321768', '2026-10-21 01:37:59', '2026-10-21', '2026-10-28', NULL, 0.00, 'Dipinjam', '2026-10-20 23:37:59'),
(9, 'TRX202610214683', 5, 'femy', '087654321678', '2026-10-21 01:53:33', NULL, '2026-10-24', NULL, 0.00, 'Pending', '2026-10-20 23:53:33'),
(10, 'TRX20261021A064', 5, 'andin', '087654321765', '2026-10-21 02:03:30', NULL, '2026-10-29', NULL, 0.00, 'Ditolak', '2026-10-21 00:03:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD UNIQUE KEY `kode_transaksi` (`kode_transaksi`),
  ADD KEY `id_buku` (`id_buku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
