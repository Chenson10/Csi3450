-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2019 at 10:32 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moviedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `avaiable_on`
--

CREATE TABLE `avaiable_on` (
  `Avaiable_Id` int(11) NOT NULL,
  `MovieFk` int(11) NOT NULL,
  `Platform` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avaiable_on`
--

INSERT INTO `avaiable_on` (`Avaiable_Id`, `MovieFk`, `Platform`) VALUES
(2, 2, 'Hulu'),
(3, 1, 'Theaters'),
(4, 5, 'Netflix,Hulu'),
(5, 7, 'Netflix'),
(6, 10, 'Netflix');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_ID` int(11) NOT NULL,
  `Company Location` varchar(55) NOT NULL,
  `Company Country` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_ID`, `Company Location`, `Company Country`) VALUES
(1, 'Foxstudios', 'America');

-- --------------------------------------------------------

--
-- Table structure for table `directs_in`
--

CREATE TABLE `directs_in` (
  `MovieFk` int(11) NOT NULL,
  `Peoplefk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directs_in`
--

INSERT INTO `directs_in` (`MovieFk`, `Peoplefk`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `MovieID` int(11) NOT NULL,
  `MovieName` varchar(55) NOT NULL,
  `Mov_realasedate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`MovieID`, `MovieName`, `Mov_realasedate`) VALUES
(1, 'Us', '2019-04-01'),
(2, 'Troy', '2019-02-01'),
(5, 'Fiend', '2018-10-04'),
(7, 'Avengers', '2018-12-19'),
(10, 'A', '2019-04-09');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `PeopleID` int(11) NOT NULL,
  `MovieFK` int(55) NOT NULL,
  `peopleFname` varchar(55) NOT NULL,
  `peopleLname` varchar(55) NOT NULL,
  `Dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`PeopleID`, `MovieFK`, `peopleFname`, `peopleLname`, `Dob`) VALUES
(1, 1, 'Dude', 'man', '1987-01-22'),
(2, 5, 'Will', 'Smith', '1957-07-11'),
(5, 1, 'Tom', 'Cruise', '1999-02-12'),
(6, 10, 'Joe', 'john', '1980-08-06'),
(7, 2, 'Brad', 'Pit', '1988-08-15'),
(9, 10, 'Johny', 'Reacer', '2019-04-01');

-- --------------------------------------------------------

--
-- Table structure for table `production`
--

CREATE TABLE `production` (
  `company_ID` int(11) NOT NULL,
  `MovieFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `production`
--

INSERT INTO `production` (`company_ID`, `MovieFK`) VALUES
(1, 10),
(1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `starsin`
--

CREATE TABLE `starsin` (
  `MovieFk` int(11) NOT NULL,
  `PeopleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `starsin`
--

INSERT INTO `starsin` (`MovieFk`, `PeopleID`) VALUES
(2, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avaiable_on`
--
ALTER TABLE `avaiable_on`
  ADD PRIMARY KEY (`Avaiable_Id`),
  ADD KEY `MovieFk` (`MovieFk`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_ID`);

--
-- Indexes for table `directs_in`
--
ALTER TABLE `directs_in`
  ADD KEY `MovieFk` (`MovieFk`),
  ADD KEY `Peoplefk` (`Peoplefk`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`MovieID`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`PeopleID`),
  ADD KEY `MovieFK` (`MovieFK`);

--
-- Indexes for table `production`
--
ALTER TABLE `production`
  ADD KEY `company_ID` (`company_ID`),
  ADD KEY `MovieFK` (`MovieFK`);

--
-- Indexes for table `starsin`
--
ALTER TABLE `starsin`
  ADD UNIQUE KEY `MovieFk` (`MovieFk`),
  ADD UNIQUE KEY `PeopleID` (`PeopleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avaiable_on`
--
ALTER TABLE `avaiable_on`
  MODIFY `Avaiable_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `MovieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `PeopleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avaiable_on`
--
ALTER TABLE `avaiable_on`
  ADD CONSTRAINT `avaiable_on_ibfk_1` FOREIGN KEY (`MovieFk`) REFERENCES `movie` (`MovieID`) ON UPDATE CASCADE;

--
-- Constraints for table `directs_in`
--
ALTER TABLE `directs_in`
  ADD CONSTRAINT `directs_in_ibfk_1` FOREIGN KEY (`MovieFk`) REFERENCES `movie` (`MovieID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `directs_in_ibfk_2` FOREIGN KEY (`Peoplefk`) REFERENCES `people` (`PeopleID`) ON UPDATE CASCADE;

--
-- Constraints for table `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_ibfk_1` FOREIGN KEY (`MovieFK`) REFERENCES `movie` (`MovieID`) ON UPDATE CASCADE;

--
-- Constraints for table `production`
--
ALTER TABLE `production`
  ADD CONSTRAINT `production_ibfk_1` FOREIGN KEY (`MovieFK`) REFERENCES `movie` (`MovieID`),
  ADD CONSTRAINT `production_ibfk_2` FOREIGN KEY (`company_ID`) REFERENCES `company` (`company_ID`);

--
-- Constraints for table `starsin`
--
ALTER TABLE `starsin`
  ADD CONSTRAINT `starsin_ibfk_1` FOREIGN KEY (`PeopleID`) REFERENCES `people` (`PeopleID`),
  ADD CONSTRAINT `starsin_ibfk_2` FOREIGN KEY (`MovieFk`) REFERENCES `movie` (`MovieID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
