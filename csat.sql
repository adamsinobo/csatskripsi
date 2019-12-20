-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 04 Okt 2019 pada 08.59
-- Versi Server: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nohp` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `koment` text NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `feedback`
--

INSERT INTO `feedback` (`id`, `id_user`, `nohp`, `nilai`, `koment`, `created_date`) VALUES
(3, 14, 0, 1, 'oke', '2019-09-29'),
(4, 15, 0, 1, 'baik', '2019-09-29'),
(5, 14, 0, 2, 'cuek', '2019-09-29'),
(6, 15, 0, 2, 'kurang ramah', '2019-09-29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `nama` text NOT NULL,
  `nohp` text NOT NULL,
  `email` text NOT NULL,
  `status` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama`, `nohp`, `email`, `status`, `level`, `created_date`) VALUES
(16, 'fikaindah', 'e10adc3949ba59abbe56e057f20f883e', 'FIka Indah SP', '088889999', 'fika@gmail.com', 1, 1, '2019-09-29'),
(17, 'amelia.f', 'e10adc3949ba59abbe56e057f20f883e', 'Amelia Farina', '08122223333', 'amel@gmail.com', 1, 2, '2019-09-30'),
(18, 'indra.t', 'e10adc3949ba59abbe56e057f20f883e', 'Indra Tri M', '081111144444', 'indra@gmail.com', 1, 2, '2019-09-30'),
(20, 'adamwb', '827ccb0eea8a706c4c34a16891f84e7b', 'Adam Wibowo', '085327770335', 'adamw1613@gmail.com', 1, 3, '2019-09-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
