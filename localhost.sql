-- phpMyAdmin SQL Dump
-- version 4.0.9deb1.lucid~ppa.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 06, 2019 at 12:22 PM
-- Server version: 5.5.52-0ubuntu0.12.04.1-log
-- PHP Version: 5.3.10-1ubuntu3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dosterhoff`
--

-- --------------------------------------------------------

--
-- Table structure for table `Company`
--

CREATE TABLE IF NOT EXISTS `Company` (
  `companyName` varchar(64) NOT NULL,
  `companyType` varchar(64) NOT NULL,
  `companyLocation` varchar(64) NOT NULL,
  `companyCountry` varchar(64) NOT NULL,
  `subsidiaryOf` varchar(64) NOT NULL COMMENT 'this is a recursive relationship. company name goes here',
  PRIMARY KEY (`companyName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Company`
--

INSERT INTO `Company` (`companyName`, `companyType`, `companyLocation`, `companyCountry`, `subsidiaryOf`) VALUES
('awesome inc', '', '', '', ''),
('disney', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Directs`
--

CREATE TABLE IF NOT EXISTS `Directs` (
  `peopleID` int(32) NOT NULL,
  `movie` varchar(64) NOT NULL,
  PRIMARY KEY (`peopleID`,`movie`),
  KEY `movie` (`movie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Directs`
--

INSERT INTO `Directs` (`peopleID`, `movie`) VALUES
(5, 'davemovie.mov'),
(3, 'Movie1'),
(3, 'movie2'),
(4, 'movie3'),
(2, 'movie4'),
(3, 'the greatest movie ever'),
(5, 'the greatest movie ever');

-- --------------------------------------------------------

--
-- Table structure for table `People`
--

CREATE TABLE IF NOT EXISTS `People` (
  `peopleID` int(32) NOT NULL AUTO_INCREMENT,
  `peopleFNAM` varchar(32) NOT NULL,
  `peopleLNAM` varchar(64) NOT NULL,
  `DoB` date NOT NULL,
  PRIMARY KEY (`peopleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `People`
--

INSERT INTO `People` (`peopleID`, `peopleFNAM`, `peopleLNAM`, `DoB`) VALUES
(2, 'Will Smith', '', '0000-00-00'),
(3, 'dudeman', '', '0000-00-00'),
(4, 'heckyeah', '', '0000-00-00'),
(5, 'dave', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `Production`
--

CREATE TABLE IF NOT EXISTS `Production` (
  `companyName` varchar(64) NOT NULL,
  `movieName` varchar(64) NOT NULL,
  PRIMARY KEY (`companyName`,`movieName`),
  KEY `movieName` (`movieName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Production`
--

INSERT INTO `Production` (`companyName`, `movieName`) VALUES
('awesome inc', 'davemovie.mov'),
('disney', 'Movie1'),
('awesome inc', 'movie3'),
('disney', 'movie3'),
('awesome inc', 'the greatest movie ever');

-- --------------------------------------------------------

--
-- Table structure for table `Service`
--

CREATE TABLE IF NOT EXISTS `Service` (
  `serviceName` varchar(32) NOT NULL,
  PRIMARY KEY (`serviceName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Service`
--

INSERT INTO `Service` (`serviceName`) VALUES
('In Theaters'),
('Netflix');

-- --------------------------------------------------------

--
-- Table structure for table `availableON`
--

CREATE TABLE IF NOT EXISTS `availableON` (
  `movieName` varchar(64) NOT NULL,
  `serviceName` varchar(32) NOT NULL,
  PRIMARY KEY (`movieName`,`serviceName`),
  KEY `serviceName` (`serviceName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `availableON`
--

INSERT INTO `availableON` (`movieName`, `serviceName`) VALUES
('movie2', 'In Theaters'),
('davemovie.mov', 'Netflix'),
('Movie1', 'Netflix'),
('movie3', 'Netflix');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `movieName` varchar(64) NOT NULL,
  `dateReleased` date NOT NULL,
  `Budget` int(24) NOT NULL,
  `Revenue` int(24) NOT NULL,
  `ageRating` varchar(6) NOT NULL,
  `criticalRating` int(5) NOT NULL,
  `audienceRating` int(5) NOT NULL,
  `runtime` int(11) NOT NULL,
  PRIMARY KEY (`movieName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movieName`, `dateReleased`, `Budget`, `Revenue`, `ageRating`, `criticalRating`, `audienceRating`, `runtime`) VALUES
('davemovie.mov', '2019-03-13', 2500, 56444000, 'G', 95, 99, 196),
('Movie1', '0000-00-00', 0, 0, '', 0, 0, 99),
('movie2', '0000-00-00', 0, 0, '', 0, 0, 382),
('movie3', '0000-00-00', 0, 0, '', 0, 0, 3),
('movie4', '0000-00-00', 0, 0, '', 0, 0, 5),
('the greatest movie ever', '0000-00-00', 0, 0, '', 0, 0, 76);

-- --------------------------------------------------------

--
-- Table structure for table `starsIn`
--

CREATE TABLE IF NOT EXISTS `starsIn` (
  `peopleID` int(32) NOT NULL,
  `movieName` varchar(64) NOT NULL,
  PRIMARY KEY (`peopleID`,`movieName`),
  KEY `movieName` (`movieName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `starsIn`
--

INSERT INTO `starsIn` (`peopleID`, `movieName`) VALUES
(2, 'Movie1'),
(4, 'Movie1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Directs`
--
ALTER TABLE `Directs`
  ADD CONSTRAINT `Directs_ibfk_1` FOREIGN KEY (`peopleID`) REFERENCES `People` (`peopleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Directs_ibfk_2` FOREIGN KEY (`movie`) REFERENCES `movie` (`movieName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Production`
--
ALTER TABLE `Production`
  ADD CONSTRAINT `Production_ibfk_2` FOREIGN KEY (`movieName`) REFERENCES `movie` (`movieName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Production_ibfk_1` FOREIGN KEY (`companyName`) REFERENCES `Company` (`companyName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `availableON`
--
ALTER TABLE `availableON`
  ADD CONSTRAINT `availableON_ibfk_2` FOREIGN KEY (`serviceName`) REFERENCES `Service` (`serviceName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `availableON_ibfk_1` FOREIGN KEY (`movieName`) REFERENCES `movie` (`movieName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `starsIn`
--
ALTER TABLE `starsIn`
  ADD CONSTRAINT `starsIn_ibfk_2` FOREIGN KEY (`movieName`) REFERENCES `movie` (`movieName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `starsIn_ibfk_1` FOREIGN KEY (`peopleID`) REFERENCES `People` (`peopleID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
