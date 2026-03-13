-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2026 at 01:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schooldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(100) NOT NULL,
  `Department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`CourseID`, `CourseName`, `Department`) VALUES
(1, 'Information Management', 'Information Systems'),
(2, 'Data Structures', 'Computer Science'),
(3, 'Web Development', 'Information Technology'),
(4, 'Network Security', 'Information Technology'),
(5, 'Software Engineering', 'Computer Science');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `EnrollmentID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `EnrollmentDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`EnrollmentID`, `StudentID`, `CourseID`, `EnrollmentDate`) VALUES
(2, 1001, 3, '2024-02-01'),
(3, 1002, 2, '2024-01-16'),
(4, 1003, 1, '2024-01-17'),
(5, 1003, 5, '2024-01-17'),
(6, 1004, 4, '2024-01-18'),
(7, 1005, 1, '2024-01-19'),
(8, 1006, 5, '2024-01-20'),
(9, 1007, 4, '2024-01-21'),
(10, 1008, 1, '2023-08-15'),
(11, 1009, 2, '2024-01-22'),
(12, 1010, 4, '2024-01-23');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Age` int(11) DEFAULT NULL CHECK (`Age` >= 15 and `Age` <= 100),
  `Course` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `Name`, `Age`, `Course`) VALUES
(1001, 'Donalen Grace Rico', 20, 'BSCS'),
(1002, 'Marial Angel Zuniega', 19, 'BSCS'),
(1003, 'Sandy Murillo', 19, 'BSIT'),
(1004, 'Eunice Lozano', 20, 'BSCS'),
(1005, 'Abby Llaguno', 20, 'BSIS'),
(1006, 'Francheska Faith Batalla', 20, 'BSIT'),
(1007, 'Ally Cornal', 20, 'BSIS'),
(1008, 'Annaliza Juarez', 21, 'BSCS'),
(1009, 'Mary Franxine Nicol', 19, 'BSIS'),
(1010, 'Gabe Arcenal', 20, 'BSCS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`),
  ADD UNIQUE KEY `CourseName` (`CourseName`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `EnrollmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
