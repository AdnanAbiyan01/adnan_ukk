-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Apr 2024 pada 18.04
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `galery`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `albums`
--

INSERT INTO `albums` (`id`, `user_id`, `name`, `description`, `date_created`) VALUES
(1, 1, 'Pemandangan', 'gambar tok sehhh..', '2024-04-22 16:22:03'),
(2, 3, 'Blitz Krieg', 'perang?', '2024-04-22 18:34:38'),
(3, 2, 'Seni/art', 'Hanya Seni', '2024-04-20 22:54:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `content` text NOT NULL,
  `photo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `date`, `content`, `photo_id`) VALUES
(1, 2, '2024-04-22 18:35:33', 'hi', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `photo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `date`, `photo_id`) VALUES
(1, 2, '2024-04-22 18:35:16', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `photo` text NOT NULL,
  `description` text NOT NULL,
  `date_upload` datetime NOT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `photos`
--

INSERT INTO `photos` (`id`, `user_id`, `title`, `photo`, `description`, `date_upload`, `album_id`) VALUES
(1, 1, 'Dashboard', 'Blue And Pink Aesthetic Desktop Wallpaper.png.png', 'gambar gunung', '2024-04-22 16:35:45', 1),
(3, 1, 'Rumbling Eren', '1218892.jpg.jpg', 'AOT', '2024-04-22 17:06:32', 1),
(6, 2, 'Perang', 'Apik.jpg.jpg', 'Warr', '2024-04-22 19:20:53', 2),
(7, 1, 'Wall Sina', 'iyo.jpg.jpg', 'WUUUUUUUUUUUUUU', '2024-04-10 19:21:43', 1),
(8, 3, 'Negara', 'Country.jpg.jpg', 'Nama Nama Negara', '2024-04-06 22:53:30', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `name`, `address`) VALUES
(1, 'abi', '$2y$10$fPbwvCy.HpRvhuLKMTnVeugwB9lfEUvKUnomd2rIK/FppuJ4USFW.', 'aabi69932@gmail.com', 'Adnan Abiyan Amrullah', '321 Pine Street, Smalltown, USA'),
(2, 'iqbal', '$2y$10$Lm3OQ5qMUO5sJfmttiy4nOI90LV4pnL94J0bzmLvv8qHfb/1kQTai', 'iqbal@gmail.com', 'dani', 'US'),
(3, 'John', '$2y$10$D0/tZzonTXvh6n0j3MyNGezrxyfP4hZoLGPt7DFP0GZZDLcA7i706', 'budi.santoso@example.com', 'John Doe', 'Jalan Gatot Subroto No. 456');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKAlbums121534` (`user_id`);

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcomments967191` (`user_id`),
  ADD KEY `FKcomments251949` (`photo_id`);

--
-- Indeks untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlikes423537` (`user_id`),
  ADD KEY `FKlikes642678` (`photo_id`);

--
-- Indeks untuk tabel `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKphotos251249` (`album_id`),
  ADD KEY `FKphotos586317` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `FKAlbums121534` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FKcomments251949` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`),
  ADD CONSTRAINT `FKcomments967191` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `FKlikes423537` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKlikes642678` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`);

--
-- Ketidakleluasaan untuk tabel `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `FKphotos251249` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`),
  ADD CONSTRAINT `FKphotos586317` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
