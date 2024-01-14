-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2023 at 01:39 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `capstone`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int NOT NULL,
  `judul` varchar(50) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `penerbit` varchar(20) NOT NULL,
  `tahun_terbit` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_user` bigint UNSIGNED DEFAULT NULL,
  `status_buku` int NOT NULL DEFAULT '0',
  `upload_date` date DEFAULT NULL,
  `deskripsi_buku` varchar(500) NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `kategori`, `penerbit`, `tahun_terbit`, `id_user`, `status_buku`, `upload_date`, `deskripsi_buku`, `img`) VALUES
(1, 'Jaringan Komputer', 'Komputer', 'Airlangga', '2022', 1, 0, '2023-11-23', 'Buku ini berisikan uraian padat mengenai hal-hal terkait jaringan komputer, yang meliputi pengenalan jaringan, klasifikasi jenis dan macam-macam perangkat jaringan, virtual LAN, OSI model dan TCP/IP model, subneting, media jaringan komputer, IP routing, network address translation (NAT), networking tool, troubleshooting, kemananan jaringan, manajemen jaringan, dan pemahaman IP address serta mac address.', 'Jaringan_Komputer.jpg'),
(2, 'Antropologi Budaya', 'Antropologi', 'Gramedia', '2021', 1, 0, '2023-11-23', 'Garis besar pembahasan yang disajikan dalam buku ini dibatasi pada tiga kajian utama, yang dieksposisikan dalam beberapa bab. Pertama, orientasi umum tentang Antropologi Budaya yang tergambar dalam teori-teori yang terdapat dalam dunia Antropologi, baik berupa konsep dasar, metode-metode yang khas, hubungannya dengan ilmu lain, sejarah dan manfaat pengkajian, maupun berbagai permasalahan yang terkait dengan penerapannya.', 'Antropologi_Budaya.jpg'),
(3, 'Filsafat Pendidikan', 'Filsafat', 'Gramedia', '2022', 1, 0, NULL, 'Buku ini terdiri dari 15 bab, membahas mulai dari pengertian filsafat, definisi filsafat, subjek dan objek filsafat, dan pentingnya filsafat dalam kehidupan manusia, teori kebenaran, filsafat pancasila, etika, dan sebagainya.\r\nOleh karena itu, buku ini memberikan paparan yang komprehensif dan mudah dipahami, sehingga dapat dibaca oleh siapa saja yang berminat dengan kajian filsafat dan filsafat pendidikan, mulai dari mahasiswa, dosen dan peminat filsafat pada umumnya.', 'Filsafat_Pendidikan.jpg'),
(4, 'Laut Bercerita', 'Fiksi', 'Gramedia', '2020', 1, 1, '2023-11-28', 'Novel ini merupakan perwujudan dalam bentuk fiksi bahwa kita sebagai bangsa Indonesia tidak boleh melupakan sejarah yang telah membentuk sekaligus menjadi tumpuan bangsa Ini. Novel ini juga mengajak pembaca menguak misteri-misteri bangsa ini yang mana tidak diajarkan di sekolah. Walaupun novel ini adalah fiksi, laut bercerita menunjukkan kepada pembaca bahwa negeri ini pernah memasuki masa pemerintahan yang kelam.', 'Laut_Bercerita.png'),
(5, 'Holtikultura', 'Biologi', 'Hang Tuah', '2021', 1, 0, NULL, 'Buku ini juga menguraikan tentang pentingnya potensi bunga potong dan kelengkapan rangkaian bunga yang sebenarnya sangat potensial untuk dieksplorasi menjadi komoditi di Indonesia karena pengusahaannya dapat dilakukan sepanjang tahun (bukan seperti di negara sub tropis, tidak mungkin sepanjang tahun), di Indonesia belum banyak mendapat perhatian.\r\n', 'holtikultura.jpg'),
(6, 'Astronomi Islam', 'Astronomi', 'Grafika', '2021', 1, 0, NULL, 'Jejak perkembangan hisab rukyat di Indonesia dibukukan dengan judul “Studi Astronomi Islam Menelusuri Karya dan Peristiwa”. Buku ini bermanfaat bagi manusia yang hidup tidak sezaman dengan pendahulu. Kalaupun belum lengkap namun rintisan menelusuri tapak-tapak itu diperlukan untuk mengevaluasi kegiatan yang pernah berlangsung', 'astronomi_islam.jpg'),
(7, 'Filosofi Teras', 'Pengembangan Diri', 'Grafika', '2020', 1, 0, '2023-11-29', 'Lebih dari 2.000 tahun lalu, sebuah mazhab filsafat menemukan akar masalah dan juga solusi dari banyak emosi negatif. Stoisisme, atau Filosofi Teras, adalah filsafat Yunani-Romawi kuno yang bisa membantu kita mengatasi emosi negatif dan menghasilkan mental yang tangguh dalam menghadapi naik-turunnya kehidupan. Jauh dari kesan filsafat sebagai topik berat dan mengawang-awang, Filosofi Teras justru bersifat praktis dan relevan dengan kehidupan Generasi Milenial dan Gen-Z masa kini.', 'filosofi_teras.png'),
(8, 'Filsafat Etika', 'Filsafat', 'Hang Tuah', '2022', 1, 0, NULL, 'Salah satu bagian penting dari persoalan etika adalah masalah perbuatan (amal). Apakah pembahasan-pembahasan teoritis tentang etika akan membawa kita kepada perbuatan, mengingat bahwa etika adalah ilmu praktik? Apakah sebuah perbuatan diserahkan begitu saja kepada ulama dan pemberi nasihat, sementara filsafat tidak memiliki kepentingan apa-apa? Inilah pokok-pokok persoalan yang terkandung dalam buku ini.', 'filsafat_etika.jpg'),
(9, 'Dongeng Dunia Anak', 'Dongeng', 'Erlangga', '2020', 1, 0, NULL, 'Mendidik anak banyak sekali caranya, salah satunya dapat dilakukan dengan membacakan dongeng. Dari dongeng, selain kita dapat mencari hikmah, kita juga dapat membangun karakter anak. Buku Dongeng Anak Dunia ini memuat kumpulan cerita untuk anak dari berbagai dunia yang di dalamnya mengandung cerita inspiratif dan pendidikan karakter untuk anak. Buku ini disertai dengan ilustrasi yang menarik yang disukai anak-anak.', 'Dongeng_Dunia_Anak.jpg'),
(10, 'Atomic Habits', 'Pengembangan Diri', 'Gramedia', '2021', 1, 0, '2023-11-27', 'Orang mengira ketika Anda ingin mengubah hidup, Anda perlu memikirkan hal-hal besar. Namun pakar kebiasaan terkenal kelas dunia James Clear telah menemukan sebuah cara lain. Ia tahu bahwa perubahan nyata berasal dari efek gabungan ratusan keputusan kecil—dari mengerjakan dua push-up sehari, bangun lima menit lebih awal, sampai menahan sebentar hasrat untuk menelepon.', 'atomic_habits.jpg'),
(11, 'Farmakologi Kedokteran', 'Medis', 'Grafika', '2019', 1, 0, NULL, 'Buku Farmakologi Kedokteran Gigi Praktis ini terdiri 5 Bab. Pada Bab 1 dan 2 dipaparkan tentang pendahuluan dan prinsip dasar farmakologi. Pada Bab 3 dan 4 dipaparkan tentang pengobatan rasional dan penulisan resep serta obat-obat yang sering dipakai dan wajib diketahui oleh dokter gigi. Pada Bab terakhir dipaparkan mengenai penulisan resep kasus kedokteran gigi.', 'Farmakologi_Kedokteran.jpg'),
(12, 'Psikologi Komunikasi', 'Psikologi', 'Gramedia', '2020', 1, 0, '2023-11-28', 'Karena disajikan dalam bahasa yang mudah dicerna, maka buku Psikologi Komunikasi ini tidak hanya perlu dimiliki oleh para mahasiswa fakultas ilmu komunikasi dan mahasiswa fakultas psikologi saja, tetapi juga oleh siapa saja yang berminat memahami dan memperbaiki komunikasi yang mereka lakukan.', 'psi_komunikasi.jpg'),
(13, 'Manajemen Pemasaran', 'Pemasaran', 'Hang Tuah', '2019', 1, 0, NULL, 'Buku Manajemen Pemasaran menekankan bahwa tugas pemasaran bukan lagi monopoli departemen pemasaran saja. Sebaliknya, pemasaran merupakan kegiatan dari semua departemen di dalam suatu perusahaan. Konsep Pemasaran Holistik yang mengakui bahwa segala sesuatu bisa terjadi pada pemasaran. Oleh karena itu, pemasaran harus dikelola (manage) dengan sistemik agar tujuan pemasaran dapat tercapai sesuai dengan target perusahaan.', 'Manajemen-Pemasaran.jpg'),
(14, 'Biografi Gus Dur', 'Biografi', 'Gramedia', '2018', 1, 0, NULL, 'Abdurrahman Wahid atau yang lebih populer dengan sebutan Gus Dur, merupakan tokoh panutan yang sangat dihormati oleh banyak kalangan karena pengabdiannya kepada masyarakat, demokrasi, dan Islam toleran. Sosoknya penuh teka-teki dan kontroversial sehingga pemikiran dan tindakannya sering disalahpahami oleh banyak kalangan.', 'Biografi_GusDur.jpg'),
(15, 'Fisika Mekanika', 'Fisika', 'Erlangga', '2021', 1, 0, NULL, 'Buku “Fisika Mekanika” yang ditulis oleh Alfred Boediman dan Agus Maulana ini berisi penjabaran lengkap terkait materi fisika. Pembahasannya terdiri dari 17 bab, yang meliputi tentang satuan, gaya, vektor, dan lain sebagainya.', 'Fisika_Mekanika.jpg'),
(16, 'Bekam Medik', 'Medis', 'Hang Tuah', '2019', 1, 0, NULL, 'Teknik bekam yang tidak steril dan sembarangan, timbulnya malpraktek bekam, dan susah dipahaminya patofisiologi bekam menurut kedokteran modern, merupakan salah satu alasan kenapa bekam (al-hijamah) belum bisa diterima seutuhnya oleh pengobatan modern.', 'bekam_medik.jpg'),
(17, 'Psikologi Kepribadian', 'Psikologi', 'Grafika', '2020', 1, 0, '2023-11-29', 'Psikologi kepribadian kaya dengan ermacam-macam teori dalam menggambarkan dan menentukan kepribadian individu. Untuk mendapatkan ikhtisarnya, di dalam buku ini dikemukakan penggolongna psikologi kepribadian yangtelah ada smapai dewasa ini. Penggolongna tersebut didasarkan pada metode yang digunakan, komponen kepribadian yang dipakai sebagai landasan, dan cara pendekatan. ', 'psi_kepribadian.jpg'),
(18, 'Teori Ekonomi Makro', 'Ekonomi', 'Erlangga', '2020', 1, 0, NULL, 'Buku teks makroekonomi dengan menggunakan studi kasus dan data riil terkini di Indonesia masih terbatas. Buku teks makroekonomi di tingkat intermediet dan advanced di Indonesia juga masih terbatas. Buku ini ingin membuat jembatan antara buku intermediet dan advanced, namun tidak tertutup kemungkinan untuk digunakan sebagai pengetahuan dasar makroekonomi bagi tingkat S1 reguler.', 'teori_ekonomi_makro.jpg'),
(19, 'Biologi Reproduksi', 'Biologi', 'Grafika', '2020', 1, 0, NULL, 'Buku Biologi Reproduksi Hewan ini merupakan buku pegangan bagi mahasiswa S1 dan S2 di bidang Reproduksi Hewan. Kajian reproduksi di dalam buku ini meliputi kajian fisiologi, seluler dan molekuler.', 'biologi_reproduksi.jpg'),
(20, 'Dasar Teknik Informatika', 'Komputer', 'Hang Tuah', '2020', 1, 0, '2023-11-27', 'Teknologi informasi merupakan suatu teknologi yang digunakan untuk mengolah data, termasuk memproses, mendapatkan, menyusun, menyimpan, memanipulasi data dalam berbagai cara untuk menghasilkan informasi yang berkualitas, yaitu informasi yang relevan, akurat, dan tepat waktu. ', 'dasar_ti.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int NOT NULL,
  `jenis_buku` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `jenis_buku`) VALUES
(20, 'Antropologi'),
(16, 'Astronomi'),
(17, 'Biografi'),
(12, 'Biologi'),
(1, 'Bisnis'),
(13, 'Dongeng'),
(2, 'Ekonomi'),
(19, 'Fiksi'),
(4, 'Filsafat'),
(3, 'Fisika'),
(5, 'Komputer'),
(18, 'Masak'),
(6, 'Medis'),
(14, 'Musik'),
(8, 'Pemasaran'),
(7, 'Pengembangan Diri'),
(9, 'Psikologi'),
(10, 'Sastra'),
(11, 'Sejarah'),
(15, 'Sosiologi');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int NOT NULL,
  `id_peminjam` int NOT NULL,
  `id_buku` int NOT NULL,
  `id_pemilik` int NOT NULL,
  `status_pinjam` enum('dipinjam','tidak dipinjam') NOT NULL,
  `status_transaksi` enum('selesai','belum selesai') NOT NULL,
  `waktu_pinjam` datetime NOT NULL,
  `waktu_kembali` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id`, `id_peminjam`, `id_buku`, `id_pemilik`, `status_pinjam`, `status_transaksi`, `waktu_pinjam`, `waktu_kembali`) VALUES
(3, 3, 4, 1, 'dipinjam', 'selesai', '2023-12-02 00:00:00', '2023-12-04 00:00:00'),
(4, 3, 7, 1, 'tidak dipinjam', 'belum selesai', '2023-12-02 00:00:00', '2023-12-04 00:00:00'),
(5, 3, 10, 1, 'tidak dipinjam', 'belum selesai', '2023-12-02 00:00:00', '2023-12-04 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int NOT NULL,
  `id_peminjam` bigint UNSIGNED DEFAULT NULL,
  `id_buku` int NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_akhir` datetime NOT NULL,
  `status_peminjam` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_peminjam`, `id_buku`, `tgl_mulai`, `tgl_akhir`, `status_peminjam`) VALUES
(37, 3, 4, '2023-12-02 00:00:00', '2023-12-04 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'eljo', 'eljo@gmail.com', NULL, '$2y$12$OIMdm6.lOlZlwIT9Sxdkw.lNdXjoH5U1SCMn5OauY6vkRC119nn1m', NULL, '2023-11-23 06:59:43', '2023-11-23 06:59:43'),
(2, 'elsa', 'elsa@gmail.com', NULL, '$2y$12$ijJ9ZnImZluQF1ZCXPBhtOXSrMG2bL7MUkvkplikywdZcSYBRj3B.', NULL, '2023-11-24 00:42:56', '2023-11-24 00:42:56'),
(3, 'peminjam', 'peminjam@gmail.com', NULL, '$2y$12$yiLyKULq/FpQRMAhppSduOSB1o/piOo5O9kqLUGy6cRFhxUQ5.Axm', NULL, '2023-11-26 06:54:46', '2023-11-26 06:54:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori` (`kategori`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jenis_buku` (`jenis_buku`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_peminjam` (`id_peminjam`,`id_buku`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`jenis_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_peminjam`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
