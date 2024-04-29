-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 01:33 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

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
-- Struktura tabeli dla tabeli `cpv`
--

CREATE TABLE `cpv` (
  `Kod` char(10) NOT NULL COMMENT 'wy] Kod CPV [https://eur-lex.europa.eu/legal-content/PL/TXT/?uri=celex%3A32008R0213]',
  `Opis` char(255) NOT NULL COMMENT 'Opis kodu CPV'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `identyfikatory_kontrahentow`
--

CREATE TABLE `identyfikatory_kontrahentow` (
  `Id` int(11) NOT NULL COMMENT 'Unikalny indetyfikator',
  `PESEL` char(11) DEFAULT NULL COMMENT 'Powszechny Elektroniczny System Ewidencji Ludności (PESEL) (numer osoby z tego systemu)',
  `NIP` char(10) DEFAULT NULL COMMENT 'Numer identyfikacji podatkowej (NIP)',
  `InnyIdentyfikator` char(255) DEFAULT NULL COMMENT 'Domyślnie NULL, pole ma za zadanie przechowywać zagraniczne identyfikatory'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kontrahenci`
--

CREATE TABLE `kontrahenci` (
  `KontrahentId` int(11) NOT NULL COMMENT 'Unikalny identyfikator kontrachenta z tabeli [identyfikatory_kontrahentow]',
  `Nazwa` char(255) NOT NULL COMMENT 'Pełna nazwa kontrahenta. Powinna być wystarczająco długa, aby pomieścić różnorodne nazwy firm i osób (obecnie najdłuższa prawnie ilośc znaków to 31 stan na 16.04.2024)',
  `SkrotNazwy` char(31) NOT NULL COMMENT 'Skrócona nazwa kontrachenta wedle prawa maksymalna długość to 31 znaków',
  `Grupa` char(100) NOT NULL COMMENT 'Kategoria lub grupa, do której należy kontrahent, pomagająca w klasyfikacji i segregacji klientów',
  `Adres` char(255) NOT NULL COMMENT 'Adres zamieszkania lub siedziby kontrahenta, zawierający informacje potrzebne do kontaktu pocztowego czy kurierskiego',
  `SkrotNazwyKraju` char(2) NOT NULL DEFAULT 'pl' COMMENT 'klucz obcy z tabeli [kraje]',
  `KodPocztowy` char(10) NOT NULL COMMENT 'Kod pocztowy miejsca zamieszkania lub siedziby kontrahenta',
  `IdMiejscowosci` char(6) NOT NULL COMMENT 'klucz obcy z tabeli [simc]',
  `Telefon` char(15) NOT NULL COMMENT 'Numer telefonu kontrahenta',
  `Mail` char(255) NOT NULL COMMENT 'Adres e-mail kontrahenta',
  `StronaInternetowa` char(255) NOT NULL COMMENT 'Adres url strony kontrachenta',
  `WaznyDo` date DEFAULT NULL COMMENT 'data ważności informacji kontrahenta na wypadek zmiany danych kluczowych'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kraje`
--

CREATE TABLE `kraje` (
  `Skrot` char(2) NOT NULL COMMENT '2 znakowy skrót nazwy kraju',
  `Nazwa` char(70) NOT NULL COMMENT 'Pełna nazwa kraju'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `kraje`
--

INSERT INTO `kraje` (`Skrot`, `Nazwa`) VALUES
('ad', 'Andora'),
('ae', 'Zjednoczone Emiraty Arabskie'),
('af', 'Afganistan'),
('ag', 'Antigua i Barbuda'),
('ai', 'Anguilla'),
('al', 'Albania'),
('am', 'Armenia'),
('ao', 'Angola'),
('aq', 'Antarktyka'),
('ar', 'Argentyna'),
('as', 'Samoa Amerykańskie'),
('at', 'Austria'),
('au', 'Australia'),
('aw', 'Aruba'),
('ax', 'Wyspy Alandzkie'),
('az', 'Azerbejdżan'),
('ba', 'Bośnia i Hercegowina'),
('bb', 'Barbados'),
('bd', 'Bangladesz'),
('be', 'Belgia'),
('bf', 'Burkina Faso'),
('bg', 'Bułgaria'),
('bh', 'Bahrajn'),
('bi', 'Burundi'),
('bj', 'Benin'),
('bl', 'Saint-Barthélemy'),
('bm', 'Bermudy'),
('bn', 'Brunei'),
('bo', 'Boliwia'),
('bq', 'Bonaire, Sint Eustatius i Saba'),
('br', 'Brazylia'),
('bs', 'Bahamy'),
('bt', 'Bhutan'),
('bv', 'Wyspa Bouveta'),
('bw', 'Botswana'),
('by', 'Białoruś'),
('bz', 'Belize'),
('ca', 'Kanada'),
('cc', 'Wyspy Kokosowe'),
('cd', 'Demokratyczna Republika Konga'),
('cf', 'Republika Środkowoafrykańska'),
('cg', 'Kongo'),
('ch', 'Szwajcaria'),
('ci', 'Wybrzeże Kości Słoniowej'),
('ck', 'Wyspy Cooka'),
('cl', 'Chile'),
('cm', 'Kamerun'),
('cn', 'Chiny'),
('co', 'Kolumbia'),
('cr', 'Kostaryka'),
('cu', 'Kuba'),
('cv', 'Republika Zielonego Przylądka'),
('cw', 'Curaçao'),
('cx', 'Wyspa Bożego Narodzenia'),
('cy', 'Cypr'),
('cz', 'Czechy'),
('de', 'Niemcy'),
('dj', 'Dżibuti'),
('dk', 'Dania'),
('dm', 'Dominika'),
('do', 'Dominikana'),
('dz', 'Algieria'),
('ec', 'Ekwador'),
('ee', 'Estonia'),
('eg', 'Egipt'),
('eh', 'Sahara Zachodnia'),
('er', 'Erytrea'),
('es', 'Hiszpania'),
('et', 'Etiopia'),
('fi', 'Finlandia'),
('fj', 'Fidżi'),
('fk', 'Falklandy'),
('fm', 'Mikronezja'),
('fo', 'Wyspy Owcze'),
('fr', 'Francja'),
('ga', 'Gabon'),
('gb', 'Wielka Brytania'),
('gd', 'Grenada'),
('ge', 'Gruzja'),
('gf', 'Gujana Francuska'),
('gg', 'Guernsey'),
('gh', 'Ghana'),
('gi', 'Gibraltar'),
('gl', 'Grenlandia'),
('gm', 'Gambia'),
('gn', 'Gwinea'),
('gp', 'Gwadelupa'),
('gq', 'Gwinea Równikowa'),
('gr', 'Grecja'),
('gs', 'Georgia Południowa i Sandwich Południowy'),
('gt', 'Gwatemala'),
('gu', 'Guam'),
('gw', 'Gwinea Bissau'),
('gy', 'Gujana'),
('hk', 'Hongkong'),
('hm', 'Wyspy Heard i McDonalda'),
('hn', 'Honduras'),
('hr', 'Chorwacja'),
('ht', 'Haiti'),
('hu', 'Węgry'),
('id', 'Indonezja'),
('ie', 'Irlandia'),
('il', 'Izrael'),
('im', 'Wyspa Man'),
('in', 'Indie'),
('io', 'Brytyjskie Terytorium Oceanu Indyjskiego'),
('iq', 'Irak'),
('ir', 'Iran'),
('is', 'Islandia'),
('it', 'Włochy'),
('je', 'Jersey'),
('jm', 'Jamajka'),
('jo', 'Jordania'),
('jp', 'Japonia'),
('ke', 'Kenia'),
('kg', 'Kirgistan'),
('kh', 'Kambodża'),
('ki', 'Kiribati'),
('km', 'Komory'),
('kn', 'Saint Kitts i Nevis'),
('kp', 'Korea Północna'),
('kr', 'Korea Południowa'),
('kw', 'Kuwejt'),
('ky', 'Kajmany'),
('kz', 'Kazachstan'),
('la', 'Laos'),
('lb', 'Liban'),
('lc', 'Saint Lucia'),
('li', 'Liechtenstein'),
('lk', 'Sri Lanka'),
('lr', 'Liberia'),
('ls', 'Lesotho'),
('lt', 'Litwa'),
('lu', 'Luksemburg'),
('lv', 'Łotwa'),
('ly', 'Libia'),
('ma', 'Maroko'),
('mc', 'Monako'),
('md', 'Mołdawia'),
('me', 'Czarnogóra'),
('mf', 'Saint-Martin'),
('mg', 'Madagaskar'),
('mh', 'Wyspy Marshalla'),
('mk', 'Macedonia Północna'),
('ml', 'Mali'),
('mm', 'Mjanma'),
('mn', 'Mongolia'),
('mo', 'Makau'),
('mp', 'Mariany Północne'),
('mq', 'Martynika'),
('mr', 'Mauretania'),
('ms', 'Montserrat'),
('mt', 'Malta'),
('mu', 'Mauritius'),
('mv', 'Malediwy'),
('mw', 'Malawi'),
('mx', 'Meksyk'),
('my', 'Malezja'),
('mz', 'Mozambik'),
('na', 'Namibia'),
('nc', 'Nowa Kaledonia'),
('ne', 'Niger'),
('nf', 'Norfolk'),
('ng', 'Nigeria'),
('ni', 'Nikaragua'),
('nl', 'Holandia'),
('no', 'Norwegia'),
('np', 'Nepal'),
('nr', 'Nauru'),
('nu', 'Niue'),
('nz', 'Nowa Zelandia'),
('om', 'Oman'),
('pa', 'Panama'),
('pe', 'Peru'),
('pf', 'Polinezja Francuska'),
('pg', 'Papua-Nowa Gwinea'),
('ph', 'Filipiny'),
('pk', 'Pakistan'),
('pl', 'Polska'),
('pm', 'Saint-Pierre i Miquelon'),
('pn', 'Pitcairn'),
('pr', 'Portoryko'),
('ps', 'Palestyna'),
('pt', 'Portugalia'),
('pw', 'Palau'),
('py', 'Paragwaj'),
('qa', 'Katar'),
('re', 'Reunion'),
('ro', 'Rumunia'),
('rs', 'Serbia'),
('ru', 'Rosja'),
('rw', 'Rwanda'),
('sa', 'Arabia Saudyjska'),
('sb', 'Wyspy Salomona'),
('sc', 'Seszele'),
('sd', 'Sudan'),
('se', 'Szwecja'),
('sg', 'Singapur'),
('sh', 'Wyspa Świętej Heleny, Wyspa Wniebowstąpienia i Tristan da Cunha'),
('si', 'Słowenia'),
('sj', 'Svalbard i Jan Mayen'),
('sk', 'Słowacja'),
('sl', 'Sierra Leone'),
('sm', 'San Marino'),
('sn', 'Senegal'),
('so', 'Somalia'),
('sr', 'Surinam'),
('ss', 'Sudan Południowy'),
('st', 'Wyspy Świętego Tomasza i Książęca'),
('sv', 'Salwador'),
('sx', 'Sint Maarten'),
('sy', 'Syria'),
('sz', 'Eswatini'),
('tc', 'Turks i Caicos'),
('td', 'Czad'),
('tf', 'Francuskie Terytoria Południowe i Antarktyczne'),
('tg', 'Togo'),
('th', 'Tajlandia'),
('tj', 'Tadżykistan'),
('tk', 'Tokelau'),
('tl', 'Timor Wschodni'),
('tm', 'Turkmenistan'),
('tn', 'Tunezja'),
('to', 'Tonga'),
('tr', 'Turcja'),
('tt', 'Trynidad i Tobago'),
('tv', 'Tuvalu'),
('tw', 'Tajwan'),
('tz', 'Tanzania'),
('ua', 'Ukraina'),
('ug', 'Uganda'),
('um', 'Dalekie Wyspy Mniejsze Stanów Zjednoczonych'),
('us', 'Stany Zjednoczone'),
('uy', 'Urugwaj'),
('uz', 'Uzbekistan'),
('va', 'Watykan'),
('vc', 'Saint Vincent i Grenadyny'),
('ve', 'Wenezuela'),
('vg', 'Brytyjskie Wyspy Dziewicze'),
('vi', 'Wyspy Dziewicze Stanów Zjednoczonych'),
('vn', 'Wietnam'),
('vu', 'Vanuatu'),
('wf', 'Wallis i Futuna'),
('ws', 'Samoa'),
('ye', 'Jemen'),
('yt', 'Majotta'),
('za', 'Południowa Afryka'),
('zm', 'Zambia'),
('zw', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kurs_euro`
--

CREATE TABLE `kurs_euro` (
  `Data` date NOT NULL COMMENT 'Data wprowadzenia obecnego kursy euro',
  `Kurs` decimal(6,4) NOT NULL COMMENT 'Kurs euro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `simc`
--

CREATE TABLE `simc` (
  `IdMiejscowosci` char(6) NOT NULL COMMENT 'Id miejscowości w Rejestrze Teryt, system SIMC (https://eteryt.stat.gov.pl/eTeryt/rejestr_teryt/udostepnianie_danych/baza_teryt/uzytkownicy_indywidualni/pobieranie/pliki_pelne.aspx?contrast=default)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status_zamowienia`
--

CREATE TABLE `status_zamowienia` (
  `Id` int(11) NOT NULL COMMENT 'Unikatowy identyfikator statusu',
  `NazwaStatusu` char(50) NOT NULL COMMENT 'Nazwa statusu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uprawnienia`
--

CREATE TABLE `uprawnienia` (
  `MocUprawnien` int(11) NOT NULL DEFAULT 1 COMMENT 'Moc uprawnienia 1 - podglad, 2 - dodawanie, 3 - podgląd i dodawamoe, 4 - edycja i usuwanie, 7 - wszystkie uprawnienia',
  `Nazwa` char(255) NOT NULL COMMENT 'Nazwa uprawnienia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `uprawnienia`
--

INSERT INTO `uprawnienia` (`MocUprawnien`, `Nazwa`) VALUES
(1, 'Podgląd'),
(2, 'Dodawanie'),
(3, 'Podgląd i dodawanie'),
(4, 'Edycja i usuwanie'),
(7, 'Wszystkie uprawnienia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uslugi_pod_wydatkiem`
--

CREATE TABLE `uslugi_pod_wydatkiem` (
  `WydatekId` int(11) NOT NULL COMMENT 'Identyfikator wydatku',
  `KodCPV` char(10) NOT NULL COMMENT 'Klucz obcy do kodu do tabeli [cpv]',
  `Netto` decimal(7,2) NOT NULL COMMENT 'Cena netto wydatku w zł',
  `Euro` decimal(7,2) NOT NULL COMMENT 'Cena netto w euro',
  `KursEuroWDniu` date NOT NULL COMMENT 'Data pobranego kursu euro. Klucz obcy do tabeli [kurs_euro]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `Id` int(11) NOT NULL,
  `Login` char(50) NOT NULL COMMENT 'Unikalna nazwa użytkownika używana do logowania do systemu',
  `Hash` char(255) NOT NULL COMMENT 'Hasło użytkownika zahashowane dla bezpieczeństwa',
  `Imie` char(50) NOT NULL COMMENT 'Imię użytkownika\r\n',
  `Nazwisko` char(50) NOT NULL COMMENT 'Nazwisko użytkownika',
  `Mail` char(255) DEFAULT NULL COMMENT 'Adres e-mail użytkownika',
  `Telefon` char(15) DEFAULT NULL COMMENT 'Numer telefonu użytkownika',
  `MocUprawnienia` int(11) NOT NULL COMMENT 'Identyfikator uprawnień danego użytkownika. Klucz obcy z tabeli [uprawnienia]',
  `Aktywne` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Czy konto nie zostało wyłączone'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `Uzytkownicy`
--

INSERT INTO `uzytkownicy` (`Id`, `Login`, `Hash`, `Imie`, `Nazwisko`, `Mail`, `Telefon`, `MocUprawnienia`, `Aktywne`) VALUES
('0', 'system', '92ea4d84852fea60d6b9f3b3716b52936b0555b58246fd4a51625a9026039481', 'system', 'system', NULL, NULL, '7', '1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wydatki`
--

CREATE TABLE `wydatki` (
  `Id` int(11) NOT NULL COMMENT 'Unikalny identyfikator wydatku',
  `NumerFaktury` char(255) NOT NULL COMMENT 'Numer faktury',
  `NazwaWydatku` char(255) NOT NULL COMMENT 'Nazwa wydatku, powinna krótko i dokładnie opisywać wydatek.',
  `PodstawaPrawna` char(255) DEFAULT NULL COMMENT 'Podstawa prawna wydatku. Może zawierać odniesienia do konkretnych przepisów prawa, na podstawie których dokonano wydatku.',
  `DataWydatku` date DEFAULT NULL,
  `KontrahentId` int(11) NOT NULL COMMENT ' Klucz obcy z tabeli [identyfikatory_kontrahentow]',
  `UzytkownikId` int(11) NOT NULL COMMENT 'Uzytkownik, który wprowadził zamówienie do bazy. Klucz obcy bazy [uzytkownicy]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wydatki_pod_zamowieniem`
--

CREATE TABLE `wydatki_pod_zamowieniem` (
  `ZamowienieId` int(11) NOT NULL COMMENT 'Identyfikator zamówienia',
  `WydatekId` int(11) NOT NULL COMMENT 'Wydatki pędące pod konkretnym zamówieniem'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `Id` int(11) NOT NULL COMMENT 'Unikatowy identyfikator zamówienia',
  `WprowadzonePrzez` char(50) NOT NULL COMMENT 'Urzytkownik, który wprowadził zamówienie do bazy. Klucz obcy bazy [uzytkownicy]',
  `NumerZamowienia` char(50) NOT NULL COMMENT 'Numer zamówienia, bądź umowy jaka widneje na dokumencie',
  `NumerWRejestrzeDokumentow` char(50) NOT NULL COMMENT 'Numer w rejestrze dokumentów',
  `DataWprowadzenia` date NOT NULL COMMENT 'Data wprowadzenia dokumentu',
  `DataDokumentu` date NOT NULL COMMENT 'Data dokumentu',
  `PrzedmiotZamowienia` char(255) NOT NULL COMMENT 'Przedmiot zamówienia',
  `StatusZamowieniaId` int(11) NOT NULL COMMENT 'Obecny status zamówienia',
  `SzacowanaWartoscNetto` decimal(7,2) NOT NULL COMMENT 'Szacowana wartość netto w zł',
  `KursEuroWDniu` date NOT NULL COMMENT 'Data pobranego kursu euro. Klucz obcy do tabeli [kurs_euro]',
  `SzacowanaWartoscEuro` decimal(7,2) NOT NULL COMMENT 'Szacowana cena w euro.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cpv`
--
ALTER TABLE `cpv`
  ADD PRIMARY KEY (`Kod`);

--
-- Indeksy dla tabeli `identyfikatory_kontrahentow`
--
ALTER TABLE `identyfikatory_kontrahentow`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `kontrahenci`
--
ALTER TABLE `kontrahenci`
  ADD KEY `KontrahentId` (`KontrahentId`),
  ADD KEY `SkrotNazwyKraju` (`SkrotNazwyKraju`),
  ADD KEY `IdMiejscowosci` (`IdMiejscowosci`);

--
-- Indeksy dla tabeli `kraje`
--
ALTER TABLE `kraje`
  ADD PRIMARY KEY (`Skrot`);

--
-- Indeksy dla tabeli `kurs_euro`
--
ALTER TABLE `kurs_euro`
  ADD PRIMARY KEY (`Data`);

--
-- Indeksy dla tabeli `simc`
--
ALTER TABLE `simc`
  ADD PRIMARY KEY (`IdMiejscowosci`);

--
-- Indeksy dla tabeli `status_zamowienia`
--
ALTER TABLE `status_zamowienia`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `uprawnienia`
--
ALTER TABLE `uprawnienia`
  ADD PRIMARY KEY (`MocUprawnien`);

--
-- Indeksy dla tabeli `uslugi_pod_wydatkiem`
--
ALTER TABLE `uslugi_pod_wydatkiem`
  ADD KEY `KodCPV` (`KodCPV`),
  ADD KEY `KursEuroWDniu` (`KursEuroWDniu`),
  ADD KEY `WydatekId` (`WydatekId`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Login` (`Login`),
  ADD KEY `UprawnienieId` (`MocUprawnienia`);

--
-- Indeksy dla tabeli `wydatki`
--
ALTER TABLE `wydatki`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `KontrahentId` (`KontrahentId`),
  ADD KEY `wydatki_ibfk_1` (`UzytkownikId`);

--
-- Indeksy dla tabeli `wydatki_pod_zamowieniem`
--
ALTER TABLE `wydatki_pod_zamowieniem`
  ADD KEY `ZamowienieId` (`ZamowienieId`),
  ADD KEY `WydatekId` (`WydatekId`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `WprowadzonePrzez` (`WprowadzonePrzez`),
  ADD KEY `StatusZamowieniaId` (`StatusZamowieniaId`),
  ADD KEY `KursEuroWDniu` (`KursEuroWDniu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `identyfikatory_kontrahentow`
--
ALTER TABLE `identyfikatory_kontrahentow`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unikalny indetyfikator', AUTO_INCREMENT=2198;

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `wydatki`
--
ALTER TABLE `wydatki`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unikalny identyfikator wydatku', AUTO_INCREMENT=32774;

--
-- AUTO_INCREMENT for table `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unikatowy identyfikator zamówienia';

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
