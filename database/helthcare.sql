-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 02:46 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `appoinment`
--

CREATE TABLE `appoinment` (
  `appoinmentId` int(11) NOT NULL,
  `appoinmentDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `appoinmentDate` date NOT NULL,
  `patientId` int(11) NOT NULL,
  `paymentId` int(11) NOT NULL,
  `docId` int(11) NOT NULL,
  `hospitalId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appoinment`
--

INSERT INTO `appoinment` (`appoinmentId`, `appoinmentDateTime`, `appoinmentDate`, `patientId`, `paymentId`, `docId`, `hospitalId`) VALUES
(3, '2020-04-16 15:01:04', '2013-09-04', 1, 1, 1, 1),
(4, '2020-04-16 20:43:55', '2013-09-04', 1, 1, 1, 1),
(5, '2020-04-16 21:05:03', '2013-09-04', 1, 1, 1, 1),
(6, '2020-04-19 21:28:37', '2013-10-04', 1, 1, 1, 1),
(7, '2020-04-21 21:26:57', '2013-10-04', 1, 1, 1, 1),
(8, '2020-04-22 00:13:27', '2013-10-04', 1, 1, 1, 1),
(9, '2020-04-22 00:13:45', '2013-10-04', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `docId` int(11) NOT NULL,
  `fName` varchar(100) NOT NULL,
  `lNmae` varchar(100) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `age` int(11) NOT NULL,
  `docNIC` varchar(13) NOT NULL,
  `docEmail` varchar(200) DEFAULT NULL,
  `passwod` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`docId`, `fName`, `lNmae`, `gender`, `age`, `docNIC`, `docEmail`, `passwod`) VALUES
(1, 'a', 'a', '80', 0, '56545', 'as@f.com', '22');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospitalId` int(11) NOT NULL,
  `hospitalName` varchar(100) NOT NULL,
  `hospitalAddress` varchar(200) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `hospitalEmail` varchar(50) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `Status` varchar(15) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospitalId`, `hospitalName`, `hospitalAddress`, `phone`, `hospitalEmail`, `password`, `Status`) VALUES
(1, 'nevil', 'colombo', '123', 'd@.comfd', 'qwe', 'Deleted'),
(2, 'navaloka', 'colombo', '0715266345', 'a@ssf.b', 'sds2f', 'Deleted'),
(3, 'avil', 'Mathara', '0715244801', 'a@g.com', '5214', 'Deleted'),
(4, 'nevil', 'colombo', '0715244801', 'a@ssf.b', 'sds2f', 'Deleted'),
(5, 'esacool', 'col', '0112865538', 'a@ssf.b', 'sds2f', 'Deleted'),
(6, 'hemas', 'colombo', '0112865538', 'a@ssf.b', 'sds2f', 'Deleted'),
(7, 'avil', 'matugama', '0715244801', 'a@g.com', '5214', 'Deleted'),
(8, 'avil', 'colombo', '0715244801', 'a@g.com', '5214', 'Deleted'),
(9, 'avil', 'colombo', '0715244801', 'a@g.com', '5214', 'Deleted'),
(10, 'pilip', 'kaluthara', '0715244801', 'a@g.com', '3333', 'Deleted'),
(11, 'nagoda', 'kaluthara', '0715244801', 'a@g.com', '3333', 'Deleted'),
(12, 'pilip', 'kaluthara', '0715244801', 'a@g.com', '2222', 'Deleted'),
(13, 'zxz', 'sdsdf', 'trty', 'errd@', '123', 'Deleted'),
(14, 'suwa setha', 'mathugama', '0342278987', 'suwasetha@gmail.com', '789', 'active'),
(15, 'pilip', 'kaluthara', '0342246579', 'pilip10@gmail.com', '1222', 'active'),
(16, 'navaloka', 'colombo', '0342246579', 'navaloka@gmail.com', '3333', 'active'),
(17, 'nevil', 'malabe', '0342278940', 'nevil@gmail.com', '7090', 'active'),
(18, 'arogya', 'kandy', '0778907653', 'arogya1@gmail.com', '357', 'active'),
(19, 'sd+v', '123', '1234', 'xcv@xv', '123', 'Deleted'),
(20, 'aq w', 'qwe', '1234', 'qwe@we.com', '123', 'Deleted'),
(21, 'q   we', 'qwe', '12345', 'qwe@qwe.com', '1234', 'Deleted');

-- --------------------------------------------------------

--
-- Table structure for table `hospitaldoctor`
--

CREATE TABLE `hospitaldoctor` (
  `docId` int(11) NOT NULL,
  `hospitalId` int(11) NOT NULL,
  `avaliableDate` varchar(100) NOT NULL,
  `avaliableTime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laboratoryreport`
--

CREATE TABLE `laboratoryreport` (
  `labId` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `LabDate` date NOT NULL,
  `Desacription` varchar(600) NOT NULL,
  `patientId` int(11) NOT NULL,
  `hospitalId` int(11) NOT NULL,
  `phoneNumber` int(15) NOT NULL,
  `ststus` varchar(20) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laboratoryreport`
--

INSERT INTO `laboratoryreport` (`labId`, `type`, `LabDate`, `Desacription`, `patientId`, `hospitalId`, `phoneNumber`, `ststus`) VALUES
(1, 'dfv', '2020-04-22', 'dsdfs', 1, 3, 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientId` int(11) NOT NULL,
  `fNmae` varchar(50) NOT NULL,
  `lName` varchar(50) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `age` int(11) NOT NULL,
  `patientNIC` varchar(13) NOT NULL,
  `address` varchar(500) NOT NULL,
  `patientEmail` varchar(200) NOT NULL,
  `passwod` varchar(500) NOT NULL,
  `phoneNumber` int(15) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientId`, `fNmae`, `lName`, `gender`, `age`, `patientNIC`, `address`, `patientEmail`, `passwod`, `phoneNumber`, `status`) VALUES
(1, 'sa', 'sdf', 'f', 90, '9876v', 'difho', 'dfs@d.com', '4567', 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paymentDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentId`, `amount`, `paymentDate`) VALUES
(1, 5000, '2020-04-16 10:51:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appoinment`
--
ALTER TABLE `appoinment`
  ADD PRIMARY KEY (`appoinmentId`),
  ADD KEY `patientId` (`patientId`),
  ADD KEY `paymentId` (`paymentId`),
  ADD KEY `docId` (`docId`),
  ADD KEY `hospitalId` (`hospitalId`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`docId`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospitalId`);

--
-- Indexes for table `hospitaldoctor`
--
ALTER TABLE `hospitaldoctor`
  ADD PRIMARY KEY (`docId`,`hospitalId`),
  ADD KEY `docId` (`docId`),
  ADD KEY `hospitalId` (`hospitalId`);

--
-- Indexes for table `laboratoryreport`
--
ALTER TABLE `laboratoryreport`
  ADD PRIMARY KEY (`labId`),
  ADD KEY `patientId` (`patientId`),
  ADD KEY `hospitalId` (`hospitalId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appoinment`
--
ALTER TABLE `appoinment`
  MODIFY `appoinmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `docId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospitalId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `laboratoryreport`
--
ALTER TABLE `laboratoryreport`
  MODIFY `labId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appoinment`
--
ALTER TABLE `appoinment`
  ADD CONSTRAINT `FK_appoinment_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`),
  ADD CONSTRAINT `FK_appoinment_2` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`paymentId`),
  ADD CONSTRAINT `FK_appoinment_3` FOREIGN KEY (`docId`) REFERENCES `doctor` (`docId`),
  ADD CONSTRAINT `FK_appoinment_4` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`hospitalId`);

--
-- Constraints for table `hospitaldoctor`
--
ALTER TABLE `hospitaldoctor`
  ADD CONSTRAINT `FK_hospitaldoctor_1` FOREIGN KEY (`docId`) REFERENCES `doctor` (`docId`),
  ADD CONSTRAINT `FK_hospitaldoctor_2` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`hospitalId`);

--
-- Constraints for table `laboratoryreport`
--
ALTER TABLE `laboratoryreport`
  ADD CONSTRAINT `FK_laboratoryreport_1` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`hospitalId`),
  ADD CONSTRAINT `FK_laboratoryreport_2` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
