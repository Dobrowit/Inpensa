-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8500
-- Generation Time: Apr 24, 2024 at 12:55 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `budzet`
--

-- --------------------------------------------------------

--
-- Table structure for table `cpv`
--

CREATE TABLE `cpv` (
  `Kod` char(10) COLLATE utf8_polish_ci NOT NULL COMMENT 'wy] Kod CPV [https://eur-lex.europa.eu/legal-content/PL/TXT/?uri=celex%3A32008R0213]',
  `Opis` char(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Opis kodu CPV'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `identyfikatory_kontrahentow`
--

CREATE TABLE `identyfikatory_kontrahentow` (
  `Id` int(11) NOT NULL COMMENT 'Unikalny indetyfikator',
  `PESEL` char(11) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'Powszechny Elektroniczny System Ewidencji Ludności (PESEL) (numer osoby z tego systemu)',
  `NIP` char(10) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'Numer identyfikacji podatkowej (NIP)',
  `InnyIdentyfikator` char(255) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'Domyślnie NULL, pole ma za zadanie przechowywać zagraniczne identyfikatory'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kontrahenci`
--

CREATE TABLE `kontrahenci` (
  `KontrahentId` int(11) NOT NULL COMMENT 'Unikalny identyfikator kontrachenta z tabeli [identyfikatory_kontrahentow]',
  `Nazwa` char(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Pełna nazwa kontrahenta. Powinna być wystarczająco długa, aby pomieścić różnorodne nazwy firm i osób (obecnie najdłuższa prawnie ilośc znaków to 31 stan na 16.04.2024)',
  `SkrotNazwy` char(31) COLLATE utf8_polish_ci NOT NULL COMMENT 'Skrócona nazwa kontrachenta wedle prawa maksymalna długość to 31 znaków',
  `Grupa` char(100) COLLATE utf8_polish_ci NOT NULL COMMENT 'Kategoria lub grupa, do której należy kontrahent, pomagająca w klasyfikacji i segregacji klientów',
  `Adres` char(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Adres zamieszkania lub siedziby kontrahenta, zawierający informacje potrzebne do kontaktu pocztowego czy kurierskiego',
  `SkrotNazwyKraju` char(2) COLLATE utf8_polish_ci NOT NULL COMMENT 'klucz obcy z tabeli [kraje]',
  `KodPocztowy` char(10) COLLATE utf8_polish_ci NOT NULL COMMENT 'Kod pocztowy miejsca zamieszkania lub siedziby kontrahenta',
  `IdMiejscowosci` char(6) COLLATE utf8_polish_ci NOT NULL COMMENT 'klucz obcy z tabeli [simc]',
  `Telefon` char(15) COLLATE utf8_polish_ci NOT NULL COMMENT 'Numer telefonu kontrahenta',
  `Mail` char(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Adres e-mail kontrahenta',
  `StronaInternetowa` char(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Adres url strony kontrachenta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kraje`
--

CREATE TABLE `kraje` (
  `Skrot` char(2) COLLATE utf8_polish_ci NOT NULL COMMENT '2 znakowy skrót nazwy kraju',
  `Nazwa` char(40) COLLATE utf8_polish_ci NOT NULL COMMENT 'Pełna nazwa kraju (do poprawki na lokalizację PL)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `kraje`
--

INSERT INTO `kraje` (`Skrot`, `Nazwa`) VALUES
('ad', 'Andorra'),
('ae', 'Arabiar Emirerri Batuak'),
('af', 'Afganistan'),
('ag', 'Antigua eta Barbuda'),
('al', 'Albania'),
('am', 'Armenia'),
('ao', 'Angola'),
('ar', 'Argentina'),
('at', 'Austria'),
('au', 'Australia'),
('az', 'Azerbaijan'),
('ba', 'Bosnia-Herzegovina'),
('bb', 'Barbados'),
('bd', 'Bangladesh'),
('be', 'Belgika'),
('bf', 'Burkina Faso'),
('bg', 'Bulgaria'),
('bh', 'Bahrain'),
('bi', 'Burundi'),
('bj', 'Benin'),
('bn', 'Brunei'),
('bo', 'Bolivia'),
('br', 'Brasil'),
('bs', 'Bahamak'),
('bt', 'Bhutan'),
('bw', 'Botswana'),
('by', 'Bielorrusia'),
('bz', 'Belize'),
('ca', 'Kanada'),
('cd', 'Kongoko Errepublika Demokratikoa'),
('cf', 'Afrika Erdiko Errepublika'),
('cg', 'Kongoko Errepublika'),
('ch', 'Suitza'),
('ci', 'Boli Kosta'),
('cl', 'Txile'),
('cm', 'Kamerun'),
('cn', 'Txina'),
('co', 'Kolonbia'),
('cr', 'Costa Rica'),
('cu', 'Kuba'),
('cv', 'Cabo Verde'),
('cy', 'Zipre'),
('cz', 'Txekia'),
('de', 'Alemania'),
('dj', 'Djibuti'),
('dk', 'Danimarka'),
('dm', 'Dominika'),
('do', 'Dominikar Errepublika'),
('dz', 'Aljeria'),
('ec', 'Ekuador'),
('ee', 'Estonia'),
('eg', 'Egipto'),
('er', 'Eritrea'),
('es', 'Espainia'),
('et', 'Etiopia'),
('fi', 'Finlandia'),
('fj', 'Fiji'),
('fm', 'Mikronesiako Estatu Federatuak'),
('fr', 'Frantzia'),
('ga', 'Gabon'),
('gb', 'Erresuma Batua'),
('gd', 'Grenada'),
('ge', 'Georgia'),
('gh', 'Ghana'),
('gm', 'Gambia'),
('gn', 'Ginea'),
('gq', 'Ekuatore Ginea'),
('gr', 'Grezia'),
('gt', 'Guatemala'),
('gw', 'Ginea-Bissau'),
('gy', 'Guyana'),
('hn', 'Honduras'),
('hr', 'Kroazia'),
('ht', 'Haiti'),
('hu', 'Hungaria'),
('id', 'Indonesia'),
('ie', 'Irlandako Errepublika'),
('il', 'Israel'),
('in', 'India'),
('iq', 'Irak'),
('ir', 'Iran'),
('is', 'Islandia'),
('it', 'Italia'),
('jm', 'Jamaika'),
('jo', 'Jordania'),
('jp', 'Japonia'),
('ke', 'Kenya'),
('kg', 'Kirgizistan'),
('kh', 'Kanbodia'),
('ki', 'Kiribati'),
('km', 'Komoreak'),
('kn', 'Saint Kitts eta Nevis'),
('kp', 'Ipar Korea'),
('kr', 'Hego Korea'),
('kw', 'Kuwait'),
('kz', 'Kazakhstan'),
('la', 'Laos'),
('lb', 'Libano'),
('lc', 'Santa Luzia'),
('li', 'Liechtenstein'),
('lk', 'Sri Lanka'),
('lr', 'Liberia'),
('ls', 'Lesotho'),
('lt', 'Lituania'),
('lu', 'Luxenburgo'),
('lv', 'Letonia'),
('ly', 'Libia'),
('ma', 'Maroko'),
('mc', 'Monako'),
('md', 'Moldavia'),
('me', 'Montenegro'),
('mg', 'Madagaskar'),
('mh', 'Marshall Uharteak'),
('mk', 'Ipar Mazedonia'),
('ml', 'Mali'),
('mm', 'Myanmar'),
('mn', 'Mongolia'),
('mr', 'Mauritania'),
('mt', 'Malta'),
('mu', 'Maurizio'),
('mv', 'Maldivak'),
('mw', 'Malawi'),
('mx', 'Mexiko'),
('my', 'Malaysia'),
('mz', 'Mozambike'),
('na', 'Namibia'),
('ne', 'Niger'),
('ng', 'Nigeria'),
('ni', 'Nikaragua'),
('nl', 'Herbehereak'),
('no', 'Norvegia'),
('np', 'Nepal'),
('nr', 'Nauru'),
('nz', 'Zeelanda Berria'),
('om', 'Oman'),
('pa', 'Panama'),
('pe', 'Peru'),
('pg', 'Papua Ginea Berria'),
('ph', 'Filipinak'),
('pk', 'Pakistan'),
('pl', 'Polonia'),
('pt', 'Portugal'),
('pw', 'Palau'),
('py', 'Paraguai'),
('qa', 'Qatar'),
('ro', 'Errumania'),
('rs', 'Serbia'),
('ru', 'Errusia'),
('rw', 'Ruanda'),
('sa', 'Saudi Arabia'),
('sb', 'Salomon Uharteak'),
('sc', 'Seychelleak'),
('sd', 'Sudan'),
('se', 'Suedia'),
('sg', 'Singapur'),
('si', 'Eslovenia'),
('sk', 'Eslovakia'),
('sl', 'Sierra Leona'),
('sm', 'San Marino'),
('sn', 'Senegal'),
('so', 'Somalia'),
('sr', 'Surinam'),
('ss', 'Hego Sudan'),
('st', 'Sao Tome eta Principe'),
('sv', 'El Salvador'),
('sy', 'Siria'),
('sz', 'Eswatini'),
('td', 'Txad'),
('tg', 'Togo'),
('th', 'Thailandia'),
('tj', 'Tajikistan'),
('tl', 'Ekialdeko Timor'),
('tm', 'Turkmenistan'),
('tn', 'Tunisia'),
('to', 'Tonga'),
('tr', 'Turkia'),
('tt', 'Trinidad eta Tobago'),
('tv', 'Tuvalu'),
('tz', 'Tanzania'),
('ua', 'Ukraina'),
('ug', 'Uganda'),
('us', 'AEB'),
('uy', 'Uruguai'),
('uz', 'Uzbekistan'),
('vc', 'Saint Vincent eta Grenadinak'),
('ve', 'Venezuela'),
('vn', 'Vietnam'),
('vu', 'Vanuatu'),
('ws', 'Samoa'),
('ye', 'Yemen'),
('za', 'Hegoafrika'),
('zm', 'Zambia'),
('zw', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `kurs_euro`
--

CREATE TABLE `kurs_euro` (
  `Data` date NOT NULL COMMENT 'Data wprowadzenia obecnego kursy euro',
  `Kurs` decimal(6,4) NOT NULL COMMENT 'Kurs euro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `simc`
--

CREATE TABLE `simc` (
  `IdMiejscowosci` char(6) COLLATE utf8_polish_ci NOT NULL COMMENT 'Id miejscowości w Rejestrze Teryt, system SIMC (https://eteryt.stat.gov.pl/eTeryt/rejestr_teryt/udostepnianie_danych/baza_teryt/uzytkownicy_indywidualni/pobieranie/pliki_pelne.aspx?contrast=default)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_zamowienia`
--

CREATE TABLE `status_zamowienia` (
  `Id` int(11) NOT NULL COMMENT 'Unikatowy identyfikator statusu',
  `NazwaStatusu` char(50) COLLATE utf8_polish_ci NOT NULL COMMENT 'Nazwa statusu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uprawnienia`
--

CREATE TABLE `uprawnienia` (
  `Id` int(11) NOT NULL COMMENT 'Unikatowy Identyfikator uprawnienia',
  `Nazwa` char(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Nazwa uprawnienia',
  `MocUprawnien` int(11) NOT NULL DEFAULT '1' COMMENT 'Moc uprawnienia 1 - podglad, 2 - dodawanie, 3 - podgląd i dodawamoe, 4 - edycja i usuwanie, 7 - wszystkie uprawnienia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uslugi_pod_wydatkiem`
--

CREATE TABLE `uslugi_pod_wydatkiem` (
  `WydatekId` int(11) NOT NULL COMMENT 'Identyfikator wydatku',
  `KodCPV` char(10) COLLATE utf8_polish_ci NOT NULL COMMENT 'Klucz obcy do kodu do tabeli [cpv]',
  `Netto` decimal(7,2) NOT NULL COMMENT 'Cena netto wydatku w zł',
  `Euro` decimal(7,2) NOT NULL COMMENT 'Cena netto w euro',
  `KursEuroWDniu` date NOT NULL COMMENT 'Data pobranego kursu euro. Klucz obcy do tabeli [kurs_euro]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `Login` char(50) COLLATE utf8_polish_ci NOT NULL COMMENT 'Unikalna nazwa użytkownika używana do logowania do systemu',
  `Hash` char(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Hasło użytkownika zahashowane dla bezpieczeństwa',
  `Imie` char(50) COLLATE utf8_polish_ci NOT NULL COMMENT 'Imię użytkownika\r\n',
  `Nazwisko` char(50) COLLATE utf8_polish_ci NOT NULL COMMENT 'Nazwisko użytkownika',
  `Mail` char(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Adres e-mail użytkownika',
  `Telefon` char(15) COLLATE utf8_polish_ci NOT NULL COMMENT 'Numer telefonu użytkownika',
  `UprawnienieId` int(11) NOT NULL COMMENT 'Identyfikator uprawnień danego użytkownika. Klucz obcy z tabeli [uprawnienia]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wydatki`
--

CREATE TABLE `wydatki` (
  `Id` int(11) NOT NULL COMMENT 'Unikalny identyfikator wydatku',
  `WprowadzonePrzez` char(50) COLLATE utf8_polish_ci NOT NULL COMMENT 'Urzytkownik, który wprowadził zamówienie do bazy. Klucz obcy bazy [uzytkownicy]',
  `NazwaWydatku` char(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Nazwa wydatku, powinna krótko i dokładnie opisywać wydatek.',
  `PodstawaPrawna` char(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Podstawa prawna wydatku. Może zawierać odniesienia do konkretnych przepisów prawa, na podstawie których dokonano wydatku.',
  `KontrahentId` int(11) NOT NULL COMMENT ' Klucz obcy z tabeli [identyfikatory_kontrahentow]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wydatki_pod_zamowieniem`
--

CREATE TABLE `wydatki_pod_zamowieniem` (
  `ZamowienieId` int(11) NOT NULL COMMENT 'Identyfikator zamówienia',
  `WydatekId` int(11) NOT NULL COMMENT 'Wydatki pędące pod konkretnym zamówieniem'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zamowienia`
--

CREATE TABLE `zamowienia` (
  `Id` int(11) NOT NULL COMMENT 'Unikatowy identyfikator zamówienia',
  `WprowadzonePrzez` char(50) COLLATE utf8_polish_ci NOT NULL COMMENT 'Urzytkownik, który wprowadził zamówienie do bazy. Klucz obcy bazy [uzytkownicy]',
  `NumerZamowienia` char(50) COLLATE utf8_polish_ci NOT NULL COMMENT 'Numer zamówienia, bądź umowy jaka widneje na dokumencie',
  `NumerWRejestrzeDokumentow` char(50) COLLATE utf8_polish_ci NOT NULL COMMENT 'Numer w rejestrze dokumentów',
  `DataWprowadzenia` date NOT NULL COMMENT 'Data wprowadzenia dokumentu',
  `DataDokumentu` date NOT NULL COMMENT 'Data dokumentu',
  `PrzedmiotZamowienia` char(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Przedmiot zamówienia',
  `StatusZamowieniaId` int(11) NOT NULL COMMENT 'Obecny status zamówienia',
  `SzacowanaWartoscNetto` decimal(7,2) NOT NULL COMMENT 'Szacowana wartość netto w zł',
  `KursEuroWDniu` date NOT NULL COMMENT 'Data pobranego kursu euro. Klucz obcy do tabeli [kurs_euro]',
  `SzacowanaWartoscEuro` decimal(7,2) NOT NULL COMMENT 'Szacowana cena w euro.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cpv`
--
ALTER TABLE `cpv`
  ADD PRIMARY KEY (`Kod`);

--
-- Indexes for table `identyfikatory_kontrahentow`
--
ALTER TABLE `identyfikatory_kontrahentow`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `kontrahenci`
--
ALTER TABLE `kontrahenci`
  ADD KEY `KontrahentId` (`KontrahentId`),
  ADD KEY `SkrotNazwyKraju` (`SkrotNazwyKraju`),
  ADD KEY `IdMiejscowosci` (`IdMiejscowosci`);

--
-- Indexes for table `kraje`
--
ALTER TABLE `kraje`
  ADD PRIMARY KEY (`Skrot`);

--
-- Indexes for table `kurs_euro`
--
ALTER TABLE `kurs_euro`
  ADD PRIMARY KEY (`Data`);

--
-- Indexes for table `simc`
--
ALTER TABLE `simc`
  ADD PRIMARY KEY (`IdMiejscowosci`);

--
-- Indexes for table `status_zamowienia`
--
ALTER TABLE `status_zamowienia`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `uprawnienia`
--
ALTER TABLE `uprawnienia`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `uslugi_pod_wydatkiem`
--
ALTER TABLE `uslugi_pod_wydatkiem`
  ADD KEY `KursEuroWDniu` (`KursEuroWDniu`),
  ADD KEY `WydatekId` (`WydatekId`),
  ADD KEY `KodCPV` (`KodCPV`);

--
-- Indexes for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`Login`),
  ADD KEY `UprawnienieId` (`UprawnienieId`);

--
-- Indexes for table `wydatki`
--
ALTER TABLE `wydatki`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `WprowadzonePrzez` (`WprowadzonePrzez`),
  ADD KEY `KontrahentId` (`KontrahentId`);

--
-- Indexes for table `wydatki_pod_zamowieniem`
--
ALTER TABLE `wydatki_pod_zamowieniem`
  ADD PRIMARY KEY (`ZamowienieId`),
  ADD KEY `WydatekId` (`WydatekId`);

--
-- Indexes for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `WprowadzonePrzez` (`WprowadzonePrzez`),
  ADD KEY `StatusZamowieniaId` (`StatusZamowieniaId`),
  ADD KEY `KursEuroWDniu` (`KursEuroWDniu`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kontrahenci`
--
ALTER TABLE `kontrahenci`
  ADD CONSTRAINT `IdMiejscowosci` FOREIGN KEY (`IdMiejscowosci`) REFERENCES `simc` (`IdMiejscowosci`),
  ADD CONSTRAINT `KontrahentId` FOREIGN KEY (`KontrahentId`) REFERENCES `identyfikatory_kontrahentow` (`Id`),
  ADD CONSTRAINT `SkrotNazwyKraju` FOREIGN KEY (`SkrotNazwyKraju`) REFERENCES `kraje` (`Skrot`);

--
-- Constraints for table `uslugi_pod_wydatkiem`
--
ALTER TABLE `uslugi_pod_wydatkiem`
  ADD CONSTRAINT `uslugi_pod_wydatkiem_ibfk_1` FOREIGN KEY (`KursEuroWDniu`) REFERENCES `kurs_euro` (`Data`),
  ADD CONSTRAINT `uslugi_pod_wydatkiem_ibfk_2` FOREIGN KEY (`WydatekId`) REFERENCES `wydatki` (`Id`),
  ADD CONSTRAINT `uslugi_pod_wydatkiem_ibfk_3` FOREIGN KEY (`KodCPV`) REFERENCES `cpv` (`Kod`);

--
-- Constraints for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD CONSTRAINT `uzytkownicy_ibfk_1` FOREIGN KEY (`UprawnienieId`) REFERENCES `uprawnienia` (`Id`);

--
-- Constraints for table `wydatki`
--
ALTER TABLE `wydatki`
  ADD CONSTRAINT `wydatki_ibfk_1` FOREIGN KEY (`WprowadzonePrzez`) REFERENCES `uzytkownicy` (`Login`),
  ADD CONSTRAINT `wydatki_ibfk_2` FOREIGN KEY (`KontrahentId`) REFERENCES `identyfikatory_kontrahentow` (`Id`);

--
-- Constraints for table `wydatki_pod_zamowieniem`
--
ALTER TABLE `wydatki_pod_zamowieniem`
  ADD CONSTRAINT `WydatekId` FOREIGN KEY (`WydatekId`) REFERENCES `wydatki` (`Id`),
  ADD CONSTRAINT `ZamowienieId` FOREIGN KEY (`ZamowienieId`) REFERENCES `zamowienia` (`Id`);

--
-- Constraints for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`WprowadzonePrzez`) REFERENCES `uzytkownicy` (`Login`),
  ADD CONSTRAINT `zamowienia_ibfk_2` FOREIGN KEY (`StatusZamowieniaId`) REFERENCES `status_zamowienia` (`Id`),
  ADD CONSTRAINT `zamowienia_ibfk_3` FOREIGN KEY (`KursEuroWDniu`) REFERENCES `kurs_euro` (`Data`),
  ADD CONSTRAINT `zamowienia_ibfk_4` FOREIGN KEY (`Id`) REFERENCES `wydatki_pod_zamowieniem` (`ZamowienieId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
