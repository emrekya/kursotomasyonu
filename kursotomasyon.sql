-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 07 Oca 2018, 19:58:57
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ogrenci`
--

INSERT INTO `ogrenci` (`ogrid`, `ogrtc`, `ogradi`, `ogrsoyadi`, `ogrtarih`, `ogrtelefon`, `ogrmail`, `ogrokul`, `ogrbolum`, `ogrdurumu`, `ogradres`, `ogrsinifadi`, `ogrresim`, `ogrkayittarihi`, `ogrmezuntarihi`) VALUES
(1, '12321312312', 'Ali', 'YILMAZ', '12/12/1996', '(123) 123-1231', 'asdasdasd a asd', 'A Okulu', 'A Bölümü', 'lise', 'oıuyhgtfasdasdasda ad adasd', 3, '_16072238user4-128x128.jpg', '02/01/2018', NULL),
(4, '13222223231', 'Ahmet', 'BİLİR', '12/12/1996', '(234) 234-2342', 'SDEFSEF', 'B Okulu', 'B Bölümü', 'ortaokul', 'DFSDF', 4, NULL, '02/01/2018', NULL),
(5, '11111111111', 'Mehmet', 'TAŞ', '02/02/2018', '(223) 232-3232', 'dasdasd', 'C Okulu', 'C Bölümü', 'ortaokul', 'sadasd', 4, NULL, '02/01/2018', NULL),
(12, '12222222222', 'Mustafa', 'YILMAZ', '12/12/1996', '(123) 123-1231', 'asdasd@asd.com', 'D Okulu', 'D Bölümü', 'lisans', 'asd asd asdas dasdasd', 5, NULL, '02/01/2018', NULL),
(14, '13333333333', 'Hasan', 'BİLİR', '12/12/1996', '(123) 123-1231', 'asdasdasd', 'E Okulu', 'A Bölümü', 'ortaokul', 'asdas adasdadasda', 5, '_7635570user7-128x128.jpg', '02/01/2018', NULL),
(16, '15555555555', 'Hüseyin', 'TAŞ', '12/12/1996', '(123) 123-1231', 'asdasdasdasd', 'F Okulu', 'B Bölümü', 'lise', 'cxgvdfgdsgdfgdfdf  dfgdfgdfgdfd fdd gd dfg', 1, '_966366avatar3.png', '02/01/2018', NULL),
(20, '21111111111', 'Zeki', 'TAŞ', '12/12/1996', '(123) 123-1231', 'qwewqe@asd.com', 'A Okulu', 'C Bölümü', 'lise', 'asdasd asd asd asd asd asd', 1, NULL, '02/01/2018', NULL),
(25, '21111111112', 'Ayşe', 'YILMAZ', '12/12/1996', '(123) 123-1231', 'qwewqe@asd.com', 'B Okulu', 'D Bölümü', 'lise', 'asdasd asd asd asd asd asd', 1, NULL, '02/01/2018', NULL),
(26, '21111111113', 'Aynur', 'TAŞ', '12/12/1996', '(123) 123-1231', 'qwewqe@asd.com', 'C Okulu', 'A Bölümü', 'lise', 'asdasd asd asd asd asd asd', 1, NULL, '02/01/2018', NULL),
(29, '12233333333', 'Samet', 'BİLİR', '12/12/1996', '(312) 312-3123', 'dasrwerf asdf', 'E Okulu', 'B Bölümü', 'lise', '213qwdasda sdas adfaf', 2, NULL, '02/01/2018', NULL),
(32, '61111111111', 'Tolga', 'YILMAZ', '12/12/1996', '(123) 213-1231', '423432', 'F Okulu', 'C Bölümü', 'lisans', 'fsdfsdfsdf sdfsdf', 4, '_11927047Ekran Alıntısı.PNG', '03/01/2018', NULL),
(33, '32222222222', 'Çetin', 'TAŞ', '12/12/1996', '(123) 123-1231', 'asdasd@dsad.com', 'A Okulu', 'D Bölümü', 'ilkokul', 'asdas asd as asd ads', 2, NULL, '02/01/2018', '03/01/2018'),
(34, '14444444444', 'Zafer', 'TAŞ', '12/12/1996', '(123) 123-1231', 'asdasdasd', 'B Okulu', 'A Bölümü', 'lise', 'asd adasdadsad', 3, '_17905431avatar04.png', '02/01/2018', '03/01/2018'),
(35, '96666666666', 'Selma', 'YILMAZ', '12/12/1996', '(121) 214-5454', 'asdasd as dasd asd', 'A Okulu', 'C Bölümü', 'lisans', 'a sdas asasd', 2, NULL, '03/01/2018', '03/01/2018'),
(36, '12333333333', 'Veysel', 'YILMAZ', '12/12/1996', '(121) 212-1212', 'sadas@sadas.com', 'E Okulu', 'B Bölümü', 'lise', 'asdas asd asd asdasdasdasdas', 4, NULL, '02/01/2018', '03/01/2018'),
(37, '21111111114', 'Veli', 'TAŞ', '12/12/1996', '(123) 123-1231', 'qwewqe@asd.com', 'F Okulu', 'D Bölümü', 'lise', 'asdasd asd asd asd asd asd', 4, NULL, '02/01/2018', '03/01/2018'),
(38, '21333333333', 'Zeynep', 'TAŞ', '12/12/1996', '(123) 123-1231', 'dsae23wr asfesd ', 'B Okulu', 'A Bölümü', 'lise', 'asd dads asd dfgdrfg dgf', 1, '_17218000avatar3.png', '02/01/2018', '03/01/2018'),
(39, '12222222221', 'Buse', 'YILMAZ', '12/12/1996', '(123) 123-1231', 'dasddd@dsaasd', 'E Okulu', 'C Bölümü', 'ilkokul', 'ads asd asdasd asd as as asadasz', 5, NULL, '02/01/2018', '04/01/2018'),
(40, '98888888888', 'Ali', 'BİLİR', '12/12/1996', '(456) 448-9789', 'asdasd', 'F Okulu', 'D Bölümü', 'lise', 'sasdşlklş as asd asdasd aasdasda', 6, '_4497612avatar04.png', '06/01/2018', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

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
(39, '12222222221', 'asdasd', 'asdasd', '12/11/2031', '(123) 123-1231', 'dasddd@dsaasd', 'qwe123123', 'dasdqweqweqwadasd', 'ilkokul', 'ads asd asdasd asd as as asadasz', 'gfdsf', NULL, '02/01/2018', '04/01/2018'),
(46, '32222222222', 'sdşlkasldk', 'şlskdlşk', '12/03/2012', '(123) 123-1231', 'asdasd@dsad.com', 'lsdkjfklj', 'saldkj', 'ilkokul', 'asdas asd as asd ads', '2', NULL, '02/01/2018', '03/01/2018'),
(47, '14444444444', '4dasdasd', 'sadasd', '09/03/2013', '(123) 123-1231', 'asdasdasd', 'asdasdas', 'asdasd', 'lise', 'asd adasdadsad', '3', '_17905431avatar04.png', '02/01/2018', '03/01/2018'),
(48, '96666666666', 'Atakan', 'Ülker', '11/02/2022', '(121) 214-5454', 'asdasd as dasd asd', 'alksjdkl', 'slkdjaklsjd', 'lisans', 'a sdas asasd', '2', NULL, '03/01/2018', '03/01/2018'),
(49, '12333333333', 'Ali', 'Bilir', '12/12/1987', '(121) 212-1212', 'sadas@sadas.com', 'oasdkoaskodk', 'asdojaoısdj', 'lise', 'asdas asd asd asdasdasdasdas', '4', NULL, '02/01/2018', '03/01/2018'),
(50, '21111111114', '11asdasd', 'sadasd', '11/11/2011', '(123) 123-1231', 'qwewqe@asd.com', 'qweqwe', 'qweqwe', 'lise', 'asdasd asd asd asd asd asd', '4', NULL, '02/01/2018', '03/01/2018'),
(51, '21333333333', '33sadasdas', 'asdasd', '12/03/2012', '(123) 123-1231', 'dsae23wr asfesd ', 'g asfaszfa', 'dafsdaza', 'lise', 'asd dads asd dfgdrfg dgf', '1', '_17218000avatar3.png', '02/01/2018', '03/01/2018'),
(52, '12222222221', 'asdasd', 'asdasd', '12/11/2031', '(123) 123-1231', 'dasddd@dsaasd', 'qwe123123', 'dasdqweqweqwadasd', 'ilkokul', 'ads asd asdasd asd as as asadasz', '5', NULL, '02/01/2018', '04/01/2018');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `personel`
--

INSERT INTO `personel` (`perid`, `pertc`, `peradi`, `persoyadi`, `perdogumtarihi`, `pertelefon`, `peremail`, `peradres`, `perogrenimdurumu`, `perbitirdigiokul`, `perbrans`, `perbankaadi`, `periban`, `permaas`, `pergorev`, `persifre`, `perresimadi`, `peraktiflik`) VALUES
(2, '70270022700', 'Emre', 'KAYA', '02/24/1988', '(212) 123-2133', 'emrek3423aya1988@gmail.com', 'istanbul 234234', 'Doktora', 'Baü324234', 'Admin', 'Akbank234234', 'tr000000000000023423000000000000000', '234324', 'Admin', '234234', '_24260924user8-128x128.jpg', 1),
(3, '12345678912', 'Mustafa', 'BİLİR', '01/02/1965', '(212) 123-2134', 'emerea@asdasd.com', 'xdasdasdas ', 'Yüksek Lisans', 'balıkesi', 'Matematik ', 'asdlasjdkl', '2130719823789127389718973', '3434', 'Müdür', '12345', '_25763371avatar04.png', 1),
(4, '00000000000', 'Ayşe', 'BULUR', '01/02/1990', '(212) 123-2135', 'emerea@asdasd.com', 'xdasdasdas ', 'Doktora', 'balıkesi', 'Fizik', 'asdlasjdkl', '2130719823789127389718973', NULL, 'Müdür Yardımcısı', '00000', '_15794959avatar5.png', 1),
(5, '20000000000', 'Mustafa', 'KAYA', '01/02/1975', '(212) 123-2136', 'emerea@asdasd.com', 'xdasdasdas ', 'Lisans', 'balıkesi', 'Bilişim Teknolojileri', 'asdlasjdkl', '2130719823789127389718973', NULL, 'Öğretmen', '12345', '', 0),
(6, '76543234567', 'Hasan', 'YILMAZ', '01/02/1987', '(212) 123-2137', 'sdasdqq@sad.asd', 'asdasdasd', 'Lisans', 'asdasd', 'Fizik', 'asdasd', 'asdasd', NULL, 'Öğretmen', 'sdf', '', 0),
(7, '10203040501', 'Ali', 'Bilmem', '01/02/1989', '(212) 123-2138', 'sdasdqq@sad.asd', 'asdasdasd', 'Lisans', 'asdasd', 'Müzik', 'asdasd', 'asdasd', NULL, 'Öğretmen', 'asd', 'asdasdasdsadsad', 1),
(9, '25252525255', 'Mehmet', 'KARACA', '02/02/1985', '(212) 545-4565', 'asd@asdq.asd', 'asdasdasdaas asd asdasdasasdas', 'Lisans', 'asdasd', 'Din Kültürü', 'asdasd', '324234234234', '234324', 'Müdür', '2020', '_6601047user1-128x128.jpg', 1),
(10, '11111111111', 'EEEEE', 'EeEeE', '01/01/1991', '(121) 215-4545', 'asdas@asd.cpom', 'asdasljdlakjsdklj', 'Yüksek Lisans', 'sadasd', 'Beden Eğitimi', 'sdlksajdlk', '9287489237489', '238463827', 'Öğretmen', '11111', '', 1),
(11, '36936936936', 'Ahmet', 'Koşar', '01/02/1987', '(111) 111-1111', 'asdasd@das.com', 'asdasdasd', 'Lisans', 'asdasd', 'Türkçe', 'asdasdas', 'asdasd', '21412', 'Öğretmen', '369', '', 0),
(12, '78978978978', 'Adem', 'ADEM', '02/01/1988', '(123) 131-3213', 'qasdasd@asdasd.co', 'asdasdsadasd', 'Doktora', 'asdasd', 'asdasd', 'asdasd', 'asdasdasd', '13213', 'Öğretmen', '789', '', 1),
(13, '85285285285', 'Veli', 'KARACA', '01/02/1987', '(212) 455-6666', 'velikar@asd.com', 'Geldim gördüm yazdım ', 'Lisans', 'asd', 'şlasdlşkş', 'asdşlkşl', 'lasdlşkasşlk', '21312', 'Öğretmen', '852', '_29236400avatar5.png', 1),
(14, '10202020202', 'Hakkı', 'KAHVE', '01/02/1987', '(123) 123-1231', 'asdasd@asd.com', 'sadasdas asd asdas as dadadas dadas', 'Yüksek Lisans', 'Yüksek işte', 'SOSYAL', 'Bankacı', 'sdasda2s31d23as123123123132', '1000', 'Müdür', '1020', '_17514088user2-160x160.jpg', 1),
(15, '13245678945', 'Mustafa', 'Bilir', '01/02/1987', '(212) 100-0000', 'mustafabilir@gmail.com', 'Beyazıt/İstanbul', 'Lisans', 'Marmara Üniversitesi', 'Matematik', 'Akbank', 'TR01220000212456460000000000215421', '3600', 'Müdür', '12345', '_11986527avatar5.png', 1),
(16, '52525252525', 'Mert', 'ÖNER', '12/01/1991', '(212) 121-2121', 'mert@gmail.com', 'İstanbul/', 'Lisans', 'Baü', 'Bilişim', 'Akbank', 'tr002121548976453216548946513213', '3500', 'Müdür', '0123', '_14109372user6-128x128.jpg', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `siniflar`
--

INSERT INTO `siniflar` (`sinifid`, `sinifadi`, `ogrencisayisi`, `sinifseviye`) VALUES
(1, 'A Şubesi', 33, 'Seviye 1'),
(2, 'B Şubesi', 33, 'Seviye 2'),
(3, 'C Şubesi', 34, 'Seviye 2'),
(4, 'D Şubesi', 30, 'Seviye 3'),
(5, 'E Şubesi', 34, 'Seviye 1'),
(6, 'F Şubesi', 20, 'Seçiniz');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yoklama`
--

INSERT INTO `yoklama` (`yoklamaid`, `ogrenciid`, `gelmedigitarih`, `gelmemesebebi`) VALUES
(1, 1, '2018-01-01', 'raporlu'),
(2, 1, '2018-01-02', 'raporlu'),
(3, 12, '2018-01-02', 'izinli'),
(4, 14, '2018-01-03', 'raporlu'),
(5, 4, '2018-01-03', 'izinli'),
(6, 5, '2017-12-28', 'raporlu'),
(7, 32, '2017-12-13', 'gelmedi'),
(8, 1, '2018-01-05', 'gelmedi'),
(9, 4, '2018-01-05', 'izinli'),
(10, 5, '2018-01-02', 'gelmedi'),
(11, 32, '2018-01-05', 'raporlu'),
(12, 5, '2018-01-06', 'gelmedi'),
(13, 32, '2018-01-06', 'izinli'),
(14, 37, '2018-01-03', 'gelmedi'),
(15, 4, '2018-01-07', 'izinli'),
(16, 5, '2018-01-07', 'izinli'),
(17, 36, '2018-01-07', 'raporlu'),
(18, 16, '2018-01-07', 'izinli'),
(19, 20, '2018-01-07', 'gelmedi'),
(20, 26, '2018-01-07', 'raporlu'),
(21, 16, '2018-01-07', 'izinli'),
(22, 20, '2018-01-07', 'gelmedi'),
(23, 26, '2018-01-07', 'raporlu');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yoklamasinif`
--

CREATE TABLE IF NOT EXISTS `yoklamasinif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sinifid` int(11) DEFAULT NULL,
  `tarih` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yoklamasinif`
--

INSERT INTO `yoklamasinif` (`id`, `sinifid`, `tarih`) VALUES
(1, 1, '2018-01-01'),
(2, 3, '2018-01-05'),
(3, 4, '2018-01-05'),
(4, 4, '2018-01-06'),
(5, 4, '2018-01-07'),
(6, 1, '2018-01-07'),
(7, 1, '2018-01-07');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
