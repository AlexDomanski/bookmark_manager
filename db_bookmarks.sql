-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Jul 2024 um 10:10
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_bookmarks`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_bewertungen`
--

CREATE TABLE `tbl_bewertungen` (
  `IDBewertung` int(10) UNSIGNED NOT NULL,
  `FIDUser` int(10) UNSIGNED NOT NULL,
  `FIDBookmark` int(10) UNSIGNED NOT NULL,
  `FIDNote` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_bookmarks`
--

CREATE TABLE `tbl_bookmarks` (
  `IDBookmark` int(10) UNSIGNED NOT NULL,
  `URL` varchar(256) NOT NULL,
  `Titel` varchar(64) NOT NULL,
  `Erstellungszeitpunkt` timestamp NOT NULL DEFAULT current_timestamp(),
  `Privat` tinyint(1) NOT NULL,
  `FIDUser` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_noten`
--

CREATE TABLE `tbl_noten` (
  `IDNote` int(10) UNSIGNED NOT NULL,
  `Note` int(1) UNSIGNED NOT NULL,
  `Beschreibung` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_noten`
--

INSERT INTO `tbl_noten` (`IDNote`, `Note`, `Beschreibung`) VALUES
(1, 1, 'Sehr gut'),
(2, 2, 'Gut'),
(3, 3, 'OK'),
(4, 0, 'Könnte besser sein'),
(5, 0, 'Schlecht'),
(6, 1, 'Sehr gut'),
(7, 2, 'Gut'),
(8, 3, 'Es passt'),
(9, 4, 'Könnte besser sein'),
(10, 5, 'Schlecht');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_personen`
--

CREATE TABLE `tbl_personen` (
  `IDPerson` int(10) UNSIGNED NOT NULL,
  `Username` varchar(32) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `Password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_bewertungen`
--
ALTER TABLE `tbl_bewertungen`
  ADD PRIMARY KEY (`IDBewertung`),
  ADD UNIQUE KEY `FIDUser` (`FIDUser`,`FIDBookmark`),
  ADD KEY `FIDBookmark` (`FIDBookmark`),
  ADD KEY `FIDNote` (`FIDNote`);

--
-- Indizes für die Tabelle `tbl_bookmarks`
--
ALTER TABLE `tbl_bookmarks`
  ADD PRIMARY KEY (`IDBookmark`),
  ADD KEY `FIDUser` (`FIDUser`);

--
-- Indizes für die Tabelle `tbl_noten`
--
ALTER TABLE `tbl_noten`
  ADD PRIMARY KEY (`IDNote`);

--
-- Indizes für die Tabelle `tbl_personen`
--
ALTER TABLE `tbl_personen`
  ADD PRIMARY KEY (`IDPerson`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_bewertungen`
--
ALTER TABLE `tbl_bewertungen`
  MODIFY `IDBewertung` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tbl_bookmarks`
--
ALTER TABLE `tbl_bookmarks`
  MODIFY `IDBookmark` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tbl_noten`
--
ALTER TABLE `tbl_noten`
  MODIFY `IDNote` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `tbl_personen`
--
ALTER TABLE `tbl_personen`
  MODIFY `IDPerson` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_bewertungen`
--
ALTER TABLE `tbl_bewertungen`
  ADD CONSTRAINT `tbl_bewertungen_ibfk_1` FOREIGN KEY (`FIDBookmark`) REFERENCES `tbl_bookmarks` (`IDBookmark`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_bewertungen_ibfk_2` FOREIGN KEY (`FIDNote`) REFERENCES `tbl_noten` (`IDNote`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_bewertungen_ibfk_3` FOREIGN KEY (`FIDUser`) REFERENCES `tbl_personen` (`IDPerson`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_bookmarks`
--
ALTER TABLE `tbl_bookmarks`
  ADD CONSTRAINT `tbl_bookmarks_ibfk_1` FOREIGN KEY (`FIDUser`) REFERENCES `tbl_personen` (`IDPerson`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
