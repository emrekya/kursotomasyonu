-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 05 Oca 2018, 20:58:43
-- Sunucu sürümü: 10.1.29-MariaDB
-- PHP Sürümü: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kursotomasyon`
--
CREATE DATABASE IF NOT EXISTS `kursotomasyon` DEFAULT CHARACTER SET utf8 COLLATE utf8_turkish_ci;
USE `kursotomasyon`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dersler`
--

CREATE TABLE IF NOT EXISTS `dersler` (
  `dersid` int(11) NOT NULL AUTO_INCREMENT,
  `dersadi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dersicerigi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dersseviyesi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`dersid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `dersler`
--

INSERT INTO `dersler` (`dersid`, `dersadi`, `dersicerigi`, `dersseviyesi`) VALUES
(1, 'erewrxfvgxfv', 'werwe', NULL),
(2, 'matematikkkkk', 'kümeler', NULL),
(3, 'türkçe', 'ses bilgisi', 'null'),
(4, 'fen', 'sular', 'null');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogrenci`
--

CREATE TABLE IF NOT EXISTS `ogrenci` (
  `ogrid` int(11) NOT NULL AUTO_INCREMENT,
  `ogrtc` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `ogradi` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  `ogrsoyadi` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  `ogrtarih` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrtelefon` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrmail` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrokul` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrbolum` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrdurumu` enum('ilkokul','ortaokul','lise','lisans','yükseklisans') COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogradres` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrsinifadi` int(11) DEFAULT NULL,
  `ogrresim` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrkayittarihi` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrmezuntarihi` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`ogrid`),
  UNIQUE KEY `ogrtc` (`ogrtc`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ogrenci`
--

INSERT INTO `ogrenci` (`ogrid`, `ogrtc`, `ogradi`, `ogrsoyadi`, `ogrtarih`, `ogrtelefon`, `ogrmail`, `ogrokul`, `ogrbolum`, `ogrdurumu`, `ogradres`, `ogrsinifadi`, `ogrresim`, `ogrkayittarihi`, `ogrmezuntarihi`) VALUES
(1, '12321312312', 'asd', 'sad', '12312323', '(123) 123-1231', 'asdasdasd a asd', 'yeni okul', 'yeni bölüm ', 'lise', 'oıuyhgtfasdasdasda ad adasd', 3, '_16072238user4-128x128.jpg', '02/01/2018', NULL),
(4, '13222223231', 'SFDSF', 'SDFS', '12/02/2092', '(234) 234-2342', 'SDEFSEF', 'SDFSD', 'FSDFSD', 'ortaokul', 'DFSDF', 4, NULL, '02/01/2018', NULL),
(5, '11111111111', 'adsas', 'dasd', '02/02/2018', '(223) 232-3232', 'dasdasd', 'asda', 'sdasd', 'ortaokul', 'sadasd', 4, NULL, '02/01/2018', NULL),
(12, '12222222222', '2asdasd', 'asdasd', '09/03/2013', '(123) 123-1231', 'asdasd@asd.com', 'sdasdasd', 'asdasdas', 'lisans', 'asd asd asdas dasdasd', 5, NULL, '02/01/2018', NULL),
(14, '13333333333', 'sadasd', 'asdasd', '12/03/2012', '(123) 123-1231', 'asdasdasd', 'asdasdas', 'dasdasd', 'ortaokul', 'asdas adasdadasda', 5, '_7635570user7-128x128.jpg', '02/01/2018', NULL),
(16, '15555555555', 'dsffsdfsdf', 'sdfsdfsdf', '09/03/2012', '(123) 123-1231', 'asdasdasdasd', 'sadasdasd', 'sdasdasd', 'lise', 'cxgvdfgdsgdfgdfdf  dfgdfgdfgdfd fdd gd dfg', 1, '_966366avatar3.png', '02/01/2018', NULL),
(20, '21111111111', '11asdasd', 'sadasd', '11/11/2011', '(123) 123-1231', 'qwewqe@asd.com', 'qweqwe', 'qweqwe', 'lise', 'asdasd asd asd asd asd asd', 1, NULL, '02/01/2018', NULL),
(25, '21111111112', '11asdasd', 'sadasd', '11/11/2011', '(123) 123-1231', 'qwewqe@asd.com', 'qweqwe', 'qweqwe', 'lise', 'asdasd asd asd asd asd asd', 1, NULL, '02/01/2018', NULL),
(26, '21111111113', '11asdasd', 'sadasd', '11/11/2011', '(123) 123-1231', 'qwewqe@asd.com', 'qweqwe', 'qweqwe', 'lise', 'asdasd asd asd asd asd asd', 1, NULL, '02/01/2018', NULL),
(29, '12233333333', 'asdasd', 'asdas', '12/03/2012', '(312) 312-3123', 'dasrwerf asdf', ' as2qafds', 'a ff af asdf adsfx', 'lise', '213qwdasda sdas adfaf', 2, NULL, '02/01/2018', NULL),
(32, '61111111111', 'asdasd', 'asdasd', '12/03/2012', '(123) 213-1231', '423432', 'sdfasdas', 'dasdasd', 'lisans', 'fsdfsdfsdf sdfsdf', 4, '_11927047Ekran Alıntısı.PNG', '03/01/2018', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ogrencimezun`
--

CREATE TABLE IF NOT EXISTS `ogrencimezun` (
  `ogrid` int(11) NOT NULL AUTO_INCREMENT,
  `ogrtc` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `ogradi` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  `ogrsoyadi` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  `ogrtarih` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrtelefon` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrmail` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrokul` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrbolum` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrdurumu` enum('ilkokul','ortaokul','lise','lisans','yükseklisans') COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogradres` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrsinifadi` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrresim` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrkayittarihi` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrmezuntarihi` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`ogrid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ogrencimezun`
--

INSERT INTO `ogrencimezun` (`ogrid`, `ogrtc`, `ogradi`, `ogrsoyadi`, `ogrtarih`, `ogrtelefon`, `ogrmail`, `ogrokul`, `ogrbolum`, `ogrdurumu`, `ogradres`, `ogrsinifadi`, `ogrresim`, `ogrkayittarihi`, `ogrmezuntarihi`) VALUES
(33, '32222222222', 'sdşlkasldk', 'şlskdlşk', '12/03/2012', '(123) 123-1231', 'asdasd@dsad.com', 'lsdkjfklj', 'saldkj', 'ilkokul', 'asdas asd as asd ads', 'gfdsf', NULL, '02/01/2018', NULL),
(34, '14444444444', '4dasdasd', 'sadasd', '09/03/2013', '(123) 123-1231', 'asdasdasd', 'asdasdas', 'asdasd', 'lise', 'asd adasdadsad', 'gfdsf', '_17905431avatar04.png', '02/01/2018', '03/01/2018'),
(35, '96666666666', 'Atakan', 'Ülker', '11/02/2022', '(121) 214-5454', 'asdasd as dasd asd', 'alksjdkl', 'slkdjaklsjd', 'lisans', 'a sdas asasd', 'fen sınıfı', NULL, '03/01/2018', '03/01/2018'),
(36, '12333333333', 'Ali', 'Bilir', '12/12/1987', '(121) 212-1212', 'sadas@sadas.com', 'oasdkoaskodk', 'asdojaoısdj', 'lise', 'asdas asd asd asdasdasdasdas', 'a şubesi', NULL, '02/01/2018', '03/01/2018'),
(37, '21111111114', '11asdasd', 'sadasd', '11/11/2011', '(123) 123-1231', 'qwewqe@asd.com', 'qweqwe', 'qweqwe', 'lise', 'asdasd asd asd asd asd asd', 'asdasdasdsdasd', NULL, '02/01/2018', '03/01/2018'),
(38, '21333333333', '33sadasdas', 'asdasd', '12/03/2012', '(123) 123-1231', 'dsae23wr asfesd ', 'g asfaszfa', 'dafsdaza', 'lise', 'asd dads asd dfgdrfg dgf', 'gfdsf', '_17218000avatar3.png', '02/01/2018', '03/01/2018'),
(39, '12222222221', 'asdasd', 'asdasd', '12/11/2031', '(123) 123-1231', 'dasddd@dsaasd', 'qwe123123', 'dasdqweqweqwadasd', 'ilkokul', 'ads asd asdasd asd as as asadasz', 'gfdsf', NULL, '02/01/2018', '04/01/2018');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel`
--

CREATE TABLE IF NOT EXISTS `personel` (
  `perid` int(11) NOT NULL AUTO_INCREMENT,
  `pertc` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `peradi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `persoyadi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `perdogumtarihi` varchar(10) COLLATE utf8_turkish_ci NOT NULL,
  `pertelefon` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `peremail` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `peradres` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `perogrenimdurumu` enum('Ön Lisans','Lisans','Yüksek Lisans','Doktora') COLLATE utf8_turkish_ci DEFAULT NULL,
  `perbitirdigiokul` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `perbrans` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `perbankaadi` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `periban` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `permaas` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `pergorev` enum('Admin','Müdür','Müdür Yardımcısı','Öğretmen') COLLATE utf8_turkish_ci DEFAULT NULL,
  `persifre` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `perresimadi` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `peraktiflik` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`perid`),
  UNIQUE KEY `pertc` (`pertc`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `personel`
--

INSERT INTO `personel` (`perid`, `pertc`, `peradi`, `persoyadi`, `perdogumtarihi`, `pertelefon`, `peremail`, `peradres`, `perogrenimdurumu`, `perbitirdigiokul`, `perbrans`, `perbankaadi`, `periban`, `permaas`, `pergorev`, `persifre`, `perresimadi`, `peraktiflik`) VALUES
(2, '70270022774', 'Emre', 'KAYA', '02/24/1988', '234324534', 'emrek3423aya1988@gmail.com', 'istanbul 234234', 'Doktora', 'Baü324234', 'Admin', 'Akbank234234', 'tr000000000000023423000000000000000', '234324', 'Admin', '234234', '_24260924user8-128x128.jpg', 1),
(3, '12345678912', 'Emre', 'KAYA', '12/01/2017', 'null', 'emerea@asdasd.com', 'xdasdasdas ', 'Yüksek Lisans', 'balıkesi', 'Matematik ', 'asdlasjdkl', '2130719823789127389718973', '3434', 'Müdür', '12345', '', 1),
(4, '00000000000', 'Emre', 'KAYA', '12/01/2017', 'null', 'emerea@asdasd.com', 'xdasdasdas ', 'Doktora', 'balıkesi', 'Fizik', 'asdlasjdkl', '2130719823789127389718973', NULL, 'Müdür Yardımcısı', '00000', '_15794959avatar5.png', 1),
(5, '20000000000', 'Mustafa', 'KAYA', '12/01/2017', 'null', 'emerea@asdasd.com', 'xdasdasdas ', 'Lisans', 'balıkesi', 'Bilişim Teknolojileri', 'asdlasjdkl', '2130719823789127389718973', NULL, 'Öğretmen', '12345', '', 1),
(6, '76543234567', 'sdfsdf', 'sdfsdf', '11/01/2017', '(212) 123-2132', 'sdasdqq@sad.asd', 'asdasdasd', 'Lisans', 'asdasd', 'Fizik', 'asdasd', 'asdasd', NULL, 'Öğretmen', 'sdf', '', 0),
(7, '10203040501', 'Ali', 'Bilmem', '11/01/2017', '(212) 123-2132', 'sdasdqq@sad.asd', 'asdasdasd', 'Lisans', 'asdasd', 'Müzik', 'asdasd', 'asdasd', NULL, 'Öğretmen', 'asd', 'asdasdasdsadsad', 1),
(9, '25252525255', 'AAAAA', 'AAAAA', '02/02/1985', '(212) 545-4565', 'asd@asdq.asd', 'asdasdasdaas asd asdasdasasdas', 'Lisans', 'asdasd', 'Din Kültürü', 'asdasd', '324234234234', '234324', 'Müdür', '2020', '_6601047user1-128x128.jpg', 1),
(10, '11111111111', 'EEEEE', 'EeEeE', '01/01/1999', '(121) 215-4545', 'asdas@asd.cpom', 'asdasljdlakjsdklj', 'Yüksek Lisans', 'sadasd', 'Beden Eğitimi', 'sdlksajdlk', '9287489237489', '238463827', 'Öğretmen', '11111', '', 1),
(11, '36936936936', 'Ahmet', 'Koşar', '01/02/1987', '(111) 111-1111', 'asdasd@das.com', 'asdasdasd', 'Lisans', 'asdasd', 'Türkçe', 'asdasdas', 'asdasd', '21412', 'Öğretmen', '369', '', 0),
(12, '78978978978', 'Adem', 'ADEM', '02/01/1988', '(123) 131-3213', 'qasdasd@asdasd.co', 'asdasdsadasd', 'Doktora', 'asdasd', 'asdasd', 'asdasd', 'asdasdasd', '13213', 'Öğretmen', '789', '', 1),
(13, '85285285285', 'Veli', 'KARACA', '02/01/2014', '(212) 455-6666', 'velikar@asd.com', 'Geldim gördüm yazdım ', 'Lisans', 'asd', 'şlasdlşkş', 'asdşlkşl', 'lasdlşkasşlk', '21312', 'Öğretmen', '852', '_29236400avatar5.png', 1),
(14, '10202020202', 'Hakkı', 'KAHVE', '12/03/2013', '(123) 123-1231', 'asdasd@asd.com', 'sadasdas asd asdas as dadadas dadas', 'Yüksek Lisans', 'Yüksek işte', 'SOSYAL', 'Bankacı', 'sdasda2s31d23as123123123132', '1000', 'Müdür', '1020', '_17514088user2-160x160.jpg', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siniflar`
--

CREATE TABLE IF NOT EXISTS `siniflar` (
  `sinifid` int(11) NOT NULL AUTO_INCREMENT,
  `sinifadi` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrencisayisi` int(11) DEFAULT NULL,
  `sinifseviye` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`sinifid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `siniflar`
--

INSERT INTO `siniflar` (`sinifid`, `sinifadi`, `ogrencisayisi`, `sinifseviye`) VALUES
(1, 'asdasdasdsdasd', 33, 'Seviye 1'),
(2, 'dfsd', 33, 'Seviye 2'),
(3, 'gfdsf', 34, 'Seviye 2'),
(4, 'fen sınıfı', 30, 'Seviye 3'),
(5, 'a şubesi', 34, 'Seviye 1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yoklama`
--

CREATE TABLE IF NOT EXISTS `yoklama` (
  `yoklamaid` int(11) NOT NULL AUTO_INCREMENT,
  `ogrenciid` int(11) DEFAULT NULL,
  `gelmedigitarih` date DEFAULT NULL,
  `gelmemesebebi` enum('gelmedi','raporlu','izinli') COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`yoklamaid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yoklama`
--

INSERT INTO `yoklama` (`yoklamaid`, `ogrenciid`, `gelmedigitarih`, `gelmemesebebi`) VALUES
(1, 1, '2018-01-01', 'raporlu'),
(2, 1, '2018-01-05', 'raporlu'),
(3, 12, '0000-00-00', 'izinli'),
(4, 14, '0000-00-00', 'raporlu'),
(5, 4, '2018-01-05', 'izinli'),
(6, 5, '2018-01-05', 'raporlu'),
(7, 32, '2018-01-05', 'gelmedi'),
(8, 1, '2018-01-05', 'gelmedi'),
(9, 4, '2018-01-05', 'izinli'),
(10, 5, '2018-01-05', 'gelmedi'),
(11, 32, '2018-01-05', 'raporlu');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yoklamasinif`
--

CREATE TABLE IF NOT EXISTS `yoklamasinif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sinifid` int(11) DEFAULT NULL,
  `tarih` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yoklamasinif`
--

INSERT INTO `yoklamasinif` (`id`, `sinifid`, `tarih`) VALUES
(1, 1, '2018-01-01'),
(2, 3, '2018-01-05'),
(3, 4, '2018-01-05');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
