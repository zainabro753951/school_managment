-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2024 at 03:12 PM
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
-- Database: `school_managment`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(50) DEFAULT NULL,
  `adminAge` int(11) DEFAULT NULL,
  `adminGender` varchar(30) DEFAULT NULL,
  `adminPassword` varchar(800) DEFAULT NULL,
  `adminPic` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `adminName`, `adminAge`, `adminGender`, `adminPassword`, `adminPic`) VALUES
(1, 'Zain Ul Abbas', 18, 'Male', '$2y$10$pk7IAIxFF/pivJary9EIHeSLjId687JOgi1hFZqjJXXTbDd0M5kvG', '/upload/adminImage/admin.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `assId` int(11) NOT NULL,
  `title` varchar(80) DEFAULT NULL,
  `discription` text DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `batches` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `batchId` int(11) NOT NULL,
  `batchName` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courseId` int(11) NOT NULL,
  `courseName` varchar(150) DEFAULT NULL,
  `courseDisc` text DEFAULT NULL,
  `uploadedAt` timestamp NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `studentId` int(11) NOT NULL,
  `studentName` varchar(50) DEFAULT NULL,
  `studentPic` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `batcheId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacherId` int(11) NOT NULL,
  `teacherName` varchar(50) DEFAULT NULL,
  `teacherEmail` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Available',
  `password` varchar(800) DEFAULT NULL,
  `batchId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `userPic` varchar(500) DEFAULT NULL,
  `password` varchar(800) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`assId`),
  ADD KEY `fk03` (`batches`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`batchId`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseId`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentId`),
  ADD KEY `fk01` (`batcheId`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacherId`),
  ADD KEY `fk02` (`batchId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `assId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `batchId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `studentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacherId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `fk03` FOREIGN KEY (`batches`) REFERENCES `batches` (`batchId`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk01` FOREIGN KEY (`batcheId`) REFERENCES `batches` (`batchId`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `fk02` FOREIGN KEY (`batchId`) REFERENCES `batches` (`batchId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
