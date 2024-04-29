# Żródła słowników

## Kody krajów
Użyto kody krajów wg normy ISO 3166-1 zaczerpnięte z rep. stefangabos/world_countries:
 - https://github.com/stefangabos/world_countries/tree/master

## Wspólny Słownik Samówień - CPV
Podstawa prawna - Rozporządzenie Komisji WE nr 213/2008 z 28 listopada 2007 r. zmieniającego rozporządzenie (WE) nr 2195/2002 Parlamentu Europejskiego i Rady w sprawie Wspólnego Słownika Zamówień (CPV) oraz dyrektywy 2004/17/WE i 2004/18/WE Parlamentu Europejskiego i Rady dotyczące procedur udzielania zamówień publicznych w zakresie zmiany CPV:
- https://eur-lex.europa.eu/legal-content/PL/TXT/?uri=celex%3A32008R0213

> [!NOTE]
> Wspólny Słownik Zamówień (CPV) stanowi jednolity system klasyfikacji udzielanych zamówień publicznych, którego celem jest standaryzacja terminologii wykorzystywanej przy dokonywaniu opisu przedmiotu zamówienia przez instytucje zamawiające.
> Klasyfikacje CPV stosuje się w celu opisu przedmiotu zamówienia od dnia 15 września 2008 r.
> Obowiązek posługiwania się Słownikiem w procesie opisu przedmiotu zamówienia publicznego wynika bezpośrednio z brzmienia art. 99 ust. 3 ustawy z dnia 11 września 2019 r. – Prawo zamówień publicznych (DZ. U. z 2019 poz. 2019):
> - https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id=WDU20190002019

## Słowniki adresowe
Zastosowano słowniki województw, powiatów, gmin, miejscowości i ulic wg bazy danych TERYT:
- https://eteryt.stat.gov.pl/eTeryt/rejestr_teryt/udostepnianie_danych/baza_teryt/uzytkownicy_indywidualni/pobieranie/pliki_pelne.aspx?contrast=default
> [!NOTE]
> - zbiór TERC: nazwa województwa/powiatu/gminy oraz odpowiedni kod wg TERYT
> - zbiór SIMC: nazwa miejscowości oraz odpowiedni kod wg TERYT
> - zbiór ULIC: nazwy/rodzaj ulicy oraz odpowiedni kod wg TERYT

# Walidacja danych
## Kody pocztowe
10 znaków alfanumerycznych. Lista międzynarodowych kodów pocztowych:
 - https://en.wikipedia.org/wiki/List_of_postal_codes
 - https://www.apaczka.pl/centrum_pomocy/formaty-kodow-pocztowych/

## Numery ewidencyjne (NIP/PESEL)
 - https://pl.wikipedia.org/wiki/Numer_identyfikacji_podatkowej
 - https://pl.wikipedia.org/wiki/PESEL

# Stuktura bazy danych (wykaz tabel)

**`Klucz podstawowy`**
_`Klucz obcy`_
**[Relacja z tabelą]**

## cpv
| Kolumna | Typ | Opis |
|---------|-----|------|
| **`Kod`** | char(10)  | Kod CPV https://eur-lex.europa.eu/legal-content/PL/TXT/?uri=celex%3A32008R0213 |
| Opis      | char(255) | Opis kodu CPV |

## identyfikatory_kontrahentow
| Kolumna | Typ | Opis |
|---------|-----|------|
| **`Id`**          | int(11), AUTO_INCREMENT   | Unikalny indetyfikator |
| PESEL             | char(11), Domyślnie NULL  | Powszechny Elektroniczny System Ewidencji Ludności (PESEL) (numer osoby z tego systemu) |
| NIP               | char(10), Domyślnie NULL  | Numer identyfikacji podatkowej (NIP) |
| InnyIdentyfikator | char(255), Domyślnie NULL | Kolumna ma za zadanie przechowywać zagraniczne identyfikatory |

## kontrahenci
| Kolumna | Typ | Opis |
|---------|-----|------|
| _`KontrahentId`_    | int(11)                   | Unikalny identyfikator kontrachenta z tabeli **[identyfikatory_kontrahentow]** |
| Nazwa               | char(255)                 | Pełna nazwa kontrahenta. Powinna być wystarczająco długa, aby pomieścić różnorodne nazwy firm i osób (obecnie najdłuższa prawnie ilośc znaków to 31 stan na 16.04.2024) |
| SkrotNazwy          | char(31), Domyślnie pl    | Skrócona nazwa kontrachenta wedle prawa maksymalna długość to 31 znaków |
| Grupa               | char(100)                 | Kategoria lub grupa, do której należy kontrahent, pomagająca w klasyfikacji i segregacji klientów |
| Adres               | char(255)                 | Adres zamieszkania lub siedziby kontrahenta, zawierający informacje potrzebne do kontaktu pocztowego czy kurierskiego |
| _`SkrotNazwyKraju`_ | char(2)                   | klucz obcy z tabeli **[kraje]** |
| KodPocztowy         | char(10)                  | Kod pocztowy miejsca zamieszkania lub siedziby kontrahenta |
| _`IdMiejscowosci`_  | char(6)                   | klucz obcy z tabeli **[simc]** |
| Telefon             | char(15), Domyślnie NULL  | Numer telefonu kontrahenta |
| Mail                | char(255), Domyślnie NULL | Adres e-mail kontrahenta |
| StronaInternetowa   | char(255)                 | Adres url strony kontrachenta |
| WaznyDo             | data, Domyślnie NULL      | Data ważności informacji kontrahenta na wypadek zmiany danych kluczowych |

## kraje
| Kolumna | Typ | Opis |
|---------|-----|------|
| **`Skrot`** | char(2)   | 2-znakowy skrót nazwy kraju |
| Nazwa       | char(70)  | Pełna nazwa kraju |

## kurs_euro
| Kolumna | Typ | Opis |
|---------|-----|------|
| **`Data`** | date         | Data wprowadzenia obecnego kursy euro |
| Kurs       | decimal(6,4) | Kurs euro |

## simc
| Kolumna | Typ | Opis |
|---------|-----|------|
| **`IdMiejscowosci`** | char(6) | Id miejscowości w Rejestrze Teryt, system SIMC (https://eteryt.stat.gov.pl/eTeryt/rejestr_teryt/udostepnianie_danych/baza_teryt/uzytkownicy_indywidualni/pobieranie/pliki_pelne.aspx?contrast=default) |

## status_zamowienia
| Kolumna | Typ | Opis |
|---------|-----|------|
| **`Id`**     | int(11)  | Unikatowy identyfikator statusu |
| NazwaStatusu | char(50) | Nazwa statusu |

## uprawnienia
| Kolumna | Typ | Opis |
|---------|-----|------|
| **`MocUprawnien`** | int(11)   | Unikatowa Moc uprawnienia 1 - podglad, 2 - dodawanie, 3 - podgląd i dodawamoe, 4 - edycja i usuwanie, 7 - wszystkie uprawnienia |
| Nazwa        | char(255) | Nazwa uprawnienia |

## uslugi_pod_wydatkiem
| Kolumna | Typ | Opis |
|---------|-----|------|
| WydatekId         | int(11)      | Identyfikator wydatku |
| _`KodCPV`_        | char(10)     | Klucz obcy do kodu do tabeli **[cpv]** |
| Netto             | decimal(7,2) | Cena netto wydatku w zł |
| Euro              | decimal(7,2) | Cena netto w euro |
| _`KursEuroWDniu`_ | date         | Data pobranego kursu euro. Klucz obcy do tabeli **[kurs_euro]** |

## uzytkownicy
| Kolumna | Typ | Opis |
|---------|-----|------|
| **`Id`**          | Int                      | Unikalna nazwa użytkownika używana do logowania do systemu |
| Login             | char(50) Unique          | Unikalna nazwa użytkownika używana do logowania do systemu |
| Hash              | char(255)                | Hasło użytkownika zahashowane dla bezpieczeństwa |
| Imie              | char(50)                 | Imię użytkownika |
| Nazwisko          | char(50)                 | Nazwisko użytkownika |
| Mail              | char(255) Domyślnie NULL | Adres e-mail użytkownika |
| Telefon           | char(15)  Domyślnie NULL | Numer telefonu użytkownika |
| _`UprawnienieId`_ | int(11)                  | Identyfikator uprawnień danego użytkownika. Klucz obcy z tabeli **[uprawnienia]** |
| Aktywne           | tinyint(1)               | Czy konto nie zostało wyłączone |

## wydatki
| Kolumna | Typ | Opis |
|---------|-----|------|
| **`Id`**             | int(11), AUTO_INCREMENT  | Unikalny identyfikator wydatku |
| _`WprowadzonePrzez`_ | char(50)                 | Urzytkownik, który wprowadził zamówienie do bazy. Klucz obcy bazy **[uzytkownicy]** |
| NumerFaktury         | char(255)                | Numer faktury |
| NazwaWydatku         | char(255)                | Nazwa wydatku, powinna krótko i dokładnie opisywać wydatek |
| PodstawaPrawna       | char(255) Domyślnie NULL | Podstawa prawna wydatku. Może zawierać odniesienia do konkretnych przepisów prawa, na podstawie których dokonano wydatku |
| DataWydatku          | date Domyślnie NULL      | Data wydatku |
| _`KontrahentId`_     | int(11)                  | Klucz obcy z tabeli **[identyfikatory_kontrahentow]** |

## wydatki_pod_zamowieniem
| Kolumna | Typ | Opis |
|---------|-----|------|
| **`ZamowienieId`** | int(11) | Identyfikator zamówienia |
| _`WydatekId`_      | int(11) | Wydatki pędące pod konkretnym zamówieniem |

## zamowienia
| Kolumna | Typ | Opis |
|---------|-----|------|
| **`Id`**                  | int(11), AUTO_INCREMENT | Unikatowy identyfikator zamówienia |
| _`WprowadzonePrzez`_      | char(50)                | Urzytkownik, który wprowadził zamówienie do bazy. Klucz obcy bazy **[uzytkownicy]** |
| NumerZamowienia           | char(50)                | Numer zamówienia, bądź umowy jaka widneje na dokumencie |
| NumerWRejestrzeDokumentow | char(50)                | Numer w rejestrze dokumentów |
| DataWprowadzenia          | date                    | Data wprowadzenia dokumentu |
| DataDokumentu             | date                    | Data dokumentu |
| PrzedmiotZamowienia       | char(255)               | Przedmiot zamówienia |
| _`StatusZamowieniaId`_    | int(11)                 | Obecny status zamówienia |
| SzacowanaWartoscNetto     | decimal(7,2)            | Szacowana wartość netto w zł |
| _`KursEuroWDniu`_         | date                    | Data pobranego kursu euro. Klucz obcy do tabeli **[kurs_euro]** |
| SzacowanaWartoscEuro      | decimal(7,2)            | Szacowana cena w euro |
