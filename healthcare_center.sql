-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Jul 2022 um 10:48
-- Server-Version: 10.4.24-MariaDB
-- PHP-Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `healthcare_center`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctor`
--

CREATE TABLE `doctor` (
  `ID` int(11) NOT NULL,
  `specialty` varchar(30) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `intervention`
--

CREATE TABLE `intervention` (
  `ID` int(11) NOT NULL,
  `symptom` varchar(30) DEFAULT NULL,
  `treatment` varchar(30) DEFAULT NULL,
  `intervention_date` date DEFAULT NULL,
  `fk_patient_id` int(11) NOT NULL,
  `fk_doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `patient`
--

CREATE TABLE `patient` (
  `ID` int(11) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `ssnr` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `patient_unit`
--

CREATE TABLE `patient_unit` (
  `ID` int(11) NOT NULL,
  `fk_patient_id` int(11) NOT NULL,
  `fk_unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `unit`
--

CREATE TABLE `unit` (
  `ID` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `floor` varchar(30) DEFAULT NULL,
  `fk_doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indizes für die Tabelle `intervention`
--
ALTER TABLE `intervention`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_doctor_id` (`fk_doctor_id`),
  ADD KEY `intervention_ibfk_1` (`fk_patient_id`);

--
-- Indizes für die Tabelle `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ssnr` (`ssnr`);

--
-- Indizes für die Tabelle `patient_unit`
--
ALTER TABLE `patient_unit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `patient_unit_ibfk_1` (`fk_patient_id`),
  ADD KEY `patient_unit_ibfk_2` (`fk_unit_id`);

--
-- Indizes für die Tabelle `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `unit_ibfk_1` (`fk_doctor_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `doctor`
--
ALTER TABLE `doctor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `intervention`
--
ALTER TABLE `intervention`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `patient`
--
ALTER TABLE `patient`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `patient_unit`
--
ALTER TABLE `patient_unit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `unit`
--
ALTER TABLE `unit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `intervention_ibfk_1` FOREIGN KEY (`fk_patient_id`) REFERENCES `patient` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `intervention_ibfk_2` FOREIGN KEY (`fk_doctor_id`) REFERENCES `doctor` (`ID`);

--
-- Constraints der Tabelle `patient_unit`
--
ALTER TABLE `patient_unit`
  ADD CONSTRAINT `patient_unit_ibfk_1` FOREIGN KEY (`fk_patient_id`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_unit_ibfk_2` FOREIGN KEY (`fk_unit_id`) REFERENCES `unit` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`fk_doctor_id`) REFERENCES `doctor` (`ID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
