-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 19, 2025 at 08:48 AM
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
-- Database: `project_app2`
--

-- --------------------------------------------------------

--
-- Table structure for table `22050513090_book`
--

CREATE TABLE `22050513090_book` (
  `book_id` int(255) NOT NULL,
  `week` varchar(255) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  `date_time` varchar(255) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `id_sign` varchar(255) DEFAULT NULL,
  `co_sign` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `22050513090_book`
--

INSERT INTO `22050513090_book` (`book_id`, `week`, `day`, `date_time`, `activity`, `photo`, `id_sign`, `co_sign`) VALUES
(1, 'week 1', 'monday', NULL, 'hollah', '683df96dd56478.54911738.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Database Management_notes`
--

CREATE TABLE `Database Management_notes` (
  `notes_id` int(255) NOT NULL,
  `note_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Database Management_notes`
--

INSERT INTO `Database Management_notes` (`notes_id`, `note_name`) VALUES
(4, 'idan.docx');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `22050513090_book`
--
ALTER TABLE `22050513090_book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `Database Management_notes`
--
ALTER TABLE `Database Management_notes`
  ADD PRIMARY KEY (`notes_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `22050513090_book`
--
ALTER TABLE `22050513090_book`
  MODIFY `book_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Database Management_notes`
--
ALTER TABLE `Database Management_notes`
  MODIFY `notes_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
