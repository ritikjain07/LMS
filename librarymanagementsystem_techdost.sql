-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2024 at 06:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librarymanagementsystem_techdost`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `authorId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `publisherName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `totalCopies` int(11) DEFAULT NULL,
  `isShow` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookdetails`
--

CREATE TABLE `bookdetails` (
  `ISBNCode` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `inStock` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `rackNumber` int(11) DEFAULT NULL,
  `totalCopies` int(11) DEFAULT NULL,
  `isShow` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryId` int(11) NOT NULL,
  `ISBNCode` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `parentCategory` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `totalBooks` int(11) DEFAULT NULL,
  `isShow` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fallsunder`
--

CREATE TABLE `fallsunder` (
  `categoryId` int(11) NOT NULL,
  `ISBNCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `isauthorof`
--

CREATE TABLE `isauthorof` (
  `authorId` int(11) NOT NULL,
  `ISBNCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `isissued`
--

CREATE TABLE `isissued` (
  `issueId` int(11) NOT NULL,
  `ISBNCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `isissuedby`
--

CREATE TABLE `isissuedby` (
  `admissionNumber` int(11) NOT NULL,
  `issueId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iskepton`
--

CREATE TABLE `iskepton` (
  `rackNumber` int(11) NOT NULL,
  `ISBNCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `isreturnedat`
--

CREATE TABLE `isreturnedat` (
  `issueId` int(11) NOT NULL,
  `returnId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issuedbooks`
--

CREATE TABLE `issuedbooks` (
  `issueId` int(11) NOT NULL,
  `bookName` varchar(255) DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `issueDate` date DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `isShow` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `racks`
--

CREATE TABLE `racks` (
  `rackNumber` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `totalBooks` int(11) DEFAULT NULL,
  `isShow` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returnwindow`
--

CREATE TABLE `returnwindow` (
  `returnId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `issueId` int(11) DEFAULT NULL,
  `isShow` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `admissionNumber` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rollNo` int(11) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `hasBooks` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`authorId`);

--
-- Indexes for table `bookdetails`
--
ALTER TABLE `bookdetails`
  ADD PRIMARY KEY (`ISBNCode`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `fallsunder`
--
ALTER TABLE `fallsunder`
  ADD PRIMARY KEY (`categoryId`,`ISBNCode`),
  ADD KEY `ISBNCode` (`ISBNCode`);

--
-- Indexes for table `isauthorof`
--
ALTER TABLE `isauthorof`
  ADD PRIMARY KEY (`authorId`,`ISBNCode`),
  ADD KEY `ISBNCode` (`ISBNCode`);

--
-- Indexes for table `isissued`
--
ALTER TABLE `isissued`
  ADD PRIMARY KEY (`issueId`,`ISBNCode`),
  ADD KEY `ISBNCode` (`ISBNCode`);

--
-- Indexes for table `isissuedby`
--
ALTER TABLE `isissuedby`
  ADD PRIMARY KEY (`admissionNumber`,`issueId`),
  ADD KEY `issueId` (`issueId`);

--
-- Indexes for table `iskepton`
--
ALTER TABLE `iskepton`
  ADD PRIMARY KEY (`rackNumber`,`ISBNCode`),
  ADD KEY `ISBNCode` (`ISBNCode`);

--
-- Indexes for table `isreturnedat`
--
ALTER TABLE `isreturnedat`
  ADD PRIMARY KEY (`issueId`,`returnId`),
  ADD KEY `returnId` (`returnId`);

--
-- Indexes for table `issuedbooks`
--
ALTER TABLE `issuedbooks`
  ADD PRIMARY KEY (`issueId`),
  ADD KEY `studentId` (`studentId`);

--
-- Indexes for table `racks`
--
ALTER TABLE `racks`
  ADD PRIMARY KEY (`rackNumber`);

--
-- Indexes for table `returnwindow`
--
ALTER TABLE `returnwindow`
  ADD PRIMARY KEY (`returnId`),
  ADD KEY `issueId` (`issueId`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`admissionNumber`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fallsunder`
--
ALTER TABLE `fallsunder`
  ADD CONSTRAINT `fallsunder_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fallsunder_ibfk_2` FOREIGN KEY (`ISBNCode`) REFERENCES `bookdetails` (`ISBNCode`) ON DELETE CASCADE;

--
-- Constraints for table `isauthorof`
--
ALTER TABLE `isauthorof`
  ADD CONSTRAINT `isauthorof_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `authors` (`authorId`) ON DELETE CASCADE,
  ADD CONSTRAINT `isauthorof_ibfk_2` FOREIGN KEY (`ISBNCode`) REFERENCES `bookdetails` (`ISBNCode`) ON DELETE CASCADE;

--
-- Constraints for table `isissued`
--
ALTER TABLE `isissued`
  ADD CONSTRAINT `isissued_ibfk_1` FOREIGN KEY (`issueId`) REFERENCES `issuedbooks` (`issueId`) ON DELETE CASCADE,
  ADD CONSTRAINT `isissued_ibfk_2` FOREIGN KEY (`ISBNCode`) REFERENCES `bookdetails` (`ISBNCode`) ON DELETE CASCADE;

--
-- Constraints for table `isissuedby`
--
ALTER TABLE `isissuedby`
  ADD CONSTRAINT `isissuedby_ibfk_1` FOREIGN KEY (`admissionNumber`) REFERENCES `student` (`admissionNumber`) ON DELETE CASCADE,
  ADD CONSTRAINT `isissuedby_ibfk_2` FOREIGN KEY (`issueId`) REFERENCES `issuedbooks` (`issueId`) ON DELETE CASCADE;

--
-- Constraints for table `iskepton`
--
ALTER TABLE `iskepton`
  ADD CONSTRAINT `iskepton_ibfk_1` FOREIGN KEY (`rackNumber`) REFERENCES `racks` (`rackNumber`) ON DELETE CASCADE,
  ADD CONSTRAINT `iskepton_ibfk_2` FOREIGN KEY (`ISBNCode`) REFERENCES `bookdetails` (`ISBNCode`) ON DELETE CASCADE;

--
-- Constraints for table `isreturnedat`
--
ALTER TABLE `isreturnedat`
  ADD CONSTRAINT `isreturnedat_ibfk_1` FOREIGN KEY (`issueId`) REFERENCES `issuedbooks` (`issueId`) ON DELETE CASCADE,
  ADD CONSTRAINT `isreturnedat_ibfk_2` FOREIGN KEY (`returnId`) REFERENCES `returnwindow` (`returnId`) ON DELETE CASCADE;

--
-- Constraints for table `issuedbooks`
--
ALTER TABLE `issuedbooks`
  ADD CONSTRAINT `issuedbooks_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`admissionNumber`) ON DELETE CASCADE;

--
-- Constraints for table `returnwindow`
--
ALTER TABLE `returnwindow`
  ADD CONSTRAINT `returnwindow_ibfk_1` FOREIGN KEY (`issueId`) REFERENCES `issuedbooks` (`issueId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
