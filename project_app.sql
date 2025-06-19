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
-- Database: `project_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `22050513012_book`
--

CREATE TABLE `22050513012_book` (
  `book_id` int(11) NOT NULL,
  `week` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `date_time` varchar(255) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `id_sign` varchar(255) DEFAULT NULL,
  `co_sign` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `22050513090_book`
--

CREATE TABLE `22050513090_book` (
  `book_id` int(255) NOT NULL,
  `week` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `date_time` varchar(255) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `id_sign` varchar(255) DEFAULT NULL,
  `co_sign` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `22050513090_book`
--

INSERT INTO `22050513090_book` (`book_id`, `week`, `day`, `date_time`, `activity`, `photo`, `id_sign`, `co_sign`) VALUES
(1, 'week 1', 'monday', '2025-05-26', 'Termination of wire plus the maintainmace of computer in the whole organisation under the superviosn of our industrial Supervisor all the time ', '', 'signature_68375bb1ea1597.67923882.png', 'signature_6836ffd24f8e33.84208834.png'),
(3, 'week 3', 'monday', '2025-05-28', 'activating windows and ubuntu', NULL, 'signature_6837684abaac43.73208019.png', 'signature_6837736cd3a9d3.88463096.png'),
(4, 'week 3', 'tuesday', '2025-05-28', 'terminating wire', NULL, 'signature_683768c80cb5b3.46619528.png', 'signature_6837738cc8c826.14346534.png'),
(5, 'week 1', 'tuesday', '2025-05-30', 'working on networking by doing trunking in various areas of the organization', NULL, 'signature_683944c58784c5.67958996.png', 'signature_6845b40db57d57.71638376.png'),
(6, 'week 1', 'wednesday', '2025-06-03', 'maintaining computers always ', NULL, 'signature_683f4ebc91baa8.40064052.png', 'signature_6846b51f43aa27.67885082.png'),
(8, 'week 2', 'weekly', '2025-06-04', 'just roaming', '683fdb688db411.01300118.png', 'signature_683fdb760509f3.62686481.png', 'signature_683fe43c3e61d6.70238524.png'),
(9, 'week 6', 'weekly', '2025-06-04', 'inclusion of IP address in every computer in these organization plus test', '684006cc591cc4.32664707.jpg', 'signature_684006db13f2a5.57825346.png', 'signature_68400716d56fb3.90218852.png'),
(10, 'week 1', 'weekly', '2025-06-09', 'cable termination', '6846b75e8ccd78.32430739.png', 'signature_6846b77e818a85.16826884.png', NULL),
(11, 'week 1', 'friday', '2025-06-09', 'networking', NULL, 'signature_6846b7d74684e4.85232825.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `22050513090_college`
--

CREATE TABLE `22050513090_college` (
  `college_id` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `supervisor` varchar(255) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `admin_no` varchar(255) DEFAULT NULL,
  `management_score` varchar(255) DEFAULT NULL,
  `student_score` varchar(255) DEFAULT NULL,
  `log_score` varchar(255) DEFAULT NULL,
  `problem_student` varchar(255) DEFAULT NULL,
  `problem_management` varchar(255) DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  `calendar` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `22050513090_college`
--

INSERT INTO `22050513090_college` (`college_id`, `company`, `supervisor`, `student_name`, `admin_no`, `management_score`, `student_score`, `log_score`, `problem_student`, `problem_management`, `observation`, `view`, `calendar`, `signature`) VALUES
(1, 'mkoa halmashauri', 'fabian lucas', 'abdul kagera', '22050513090', '31', '35', '24', 'goof', 'Good ', 'no comment', 'no suggestion ', '2025-06-18', 'signature_68526ea5ebbc51.68792124.png');

-- --------------------------------------------------------

--
-- Table structure for table `22050513090_industry`
--

CREATE TABLE `22050513090_industry` (
  `industry_id` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `supervisor` varchar(255) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `admin_no` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `asses_score` varchar(255) DEFAULT NULL,
  `report_date` varchar(255) DEFAULT NULL,
  `finish_date` varchar(255) DEFAULT NULL,
  `permission_with` varchar(255) DEFAULT NULL,
  `permission_without` varchar(255) DEFAULT NULL,
  `opinion_skill` varchar(255) DEFAULT NULL,
  `opinion_adequacy` varchar(255) DEFAULT NULL,
  `calendar` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `22050513090_industry`
--

INSERT INTO `22050513090_industry` (`industry_id`, `company`, `supervisor`, `student_name`, `admin_no`, `level`, `department`, `program`, `asses_score`, `report_date`, `finish_date`, `permission_with`, `permission_without`, `opinion_skill`, `opinion_adequacy`, `calendar`, `signature`) VALUES
(1, 'mkoa halmashauri', 'rhobin deus', 'abdul kagera', '22050513090', 'Level 5', 'IT', 'Computer Science', '58', '12/24/2024', '3/12/2024', 'none', 'none', 'good', 'good', '2025-06-18', 'signature_68526d72057ca3.83823876.png');

-- --------------------------------------------------------

--
-- Table structure for table `22050513090_marker`
--

CREATE TABLE `22050513090_marker` (
  `marker_id` int(255) NOT NULL,
  `technical_report` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `22050513090_marker`
--

INSERT INTO `22050513090_marker` (`marker_id`, `technical_report`, `total`) VALUES
(1, '50', '80.2');

-- --------------------------------------------------------

--
-- Table structure for table `22050513090_report`
--

CREATE TABLE `22050513090_report` (
  `technical_id` int(11) NOT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `admin_no` varchar(255) DEFAULT NULL,
  `technical_report` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `22050513090_report`
--

INSERT INTO `22050513090_report` (`technical_id`, `student_name`, `admin_no`, `technical_report`) VALUES
(1, 'abdul kagera', '22050513090', 'FINA YERA PROJECTS.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `admin_region_table`
--

CREATE TABLE `admin_region_table` (
  `region_no` int(255) NOT NULL,
  `region_name` varchar(255) NOT NULL,
  `lecture_admission1` varchar(255) NOT NULL,
  `lecture_admission2` varchar(255) NOT NULL,
  `lecture_admission3` varchar(255) NOT NULL,
  `marker` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_region_table`
--

INSERT INTO `admin_region_table` (`region_no`, `region_name`, `lecture_admission1`, `lecture_admission2`, `lecture_admission3`, `marker`) VALUES
(1, 'Arusha', '22050513037', '22050513036', '22050513035', '22050513037');

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_no` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `course` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `admission_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`admin_no`, `fname`, `lname`, `sname`, `department`, `course`, `level`, `email`, `role`, `admission_number`) VALUES
(5, 'idan', 'olomi', 'bertam', 'IT', 'Computer Science', 'Level 8', 'idanbertam@gmail.com', 'student', '22050513038'),
(6, 'isaack', 'baltazari', 'bertam', 'IT', NULL, NULL, 'isack@gmail.com', 'lecture', '22050513039'),
(7, 'james', 'Elilekia', 'mariki', 'IT', NULL, NULL, 'james@gmail.com', 'lecture', '22050513036'),
(8, 'roritha', 'mbwambo', 'anusiata', 'IT', NULL, NULL, 'roritha@gmail.com', 'lecture', '22050513035'),
(9, 'shakira', 'mbaga', 'anusiata', 'IT', NULL, NULL, 'shakira@gmail.com', 'lecture', '22050513034'),
(10, 'emanuel', 'heri', 'nwganguka', 'IT', NULL, NULL, 'ema@gmail.com', 'lecture', '22050513033'),
(11, 'godlove', 'nyas', 'malombe', 'IT', NULL, NULL, 'malombe@gmail.com', 'lecture', '22050513032'),
(12, 'exavery', 'Koni', 'kamanda', 'IT', NULL, NULL, 'exavery@gmail.com', 'lecture', '22050513031'),
(13, 'bertam', 'Balthazar ', 'olomi', 'IT', NULL, NULL, 'olomiidan@gmail.com', 'lecture', '22050513037'),
(14, 'abdul', 'kagera', 'mwaisa', 'IT', 'Computer Science', 'Level 5', 'abdurafiuabdul2@gmail.com', 'student', '22050513090'),
(15, 'abdul', 'sylvester', 'zawadi', 'IT', 'Computer Science', 'Level 6', 'sylverter@gmail.com', 'student', '22050513050'),
(16, 'mkama', 'mkama', 'daudi', 'IT', 'Computer Science', 'Level 8', 'mka@gmail.com', 'student', '22050513012');

--
-- Triggers `admin_table`
--
DELIMITER $$
CREATE TRIGGER `after_admin_table_insert` AFTER INSERT ON `admin_table` FOR EACH ROW BEGIN 
   INSERT INTO login_table(fname,lname,sname,department,course,level,email,role,admission_number,status) 
   VALUES(NEW.fname,NEW.lname,NEW.sname,NEW.department,NEW.course,NEW.level,NEW.email,NEW.role,NEW.admission_number,"unactive");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `DataBase Management_notes`
--

CREATE TABLE `DataBase Management_notes` (
  `notes_id` int(255) NOT NULL,
  `note_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DataBase Management_notes`
--

INSERT INTO `DataBase Management_notes` (`notes_id`, `note_name`) VALUES
(3, 'FINA YERA PROJECTS.pdf'),
(4, 'GROUP ASSIGNMENT 19.05.2025.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `DataBase Management_qualot`
--

CREATE TABLE `DataBase Management_qualot` (
  `question_id` int(11) NOT NULL,
  `question_note` varchar(255) DEFAULT NULL,
  `candidee_num` varchar(255) DEFAULT NULL,
  `candidee_answer` varchar(255) DEFAULT NULL,
  `candidee_level` varchar(255) DEFAULT NULL,
  `candidee_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DataBase Management_qualot`
--

INSERT INTO `DataBase Management_qualot` (`question_id`, `question_note`, `candidee_num`, `candidee_answer`, `candidee_level`, `candidee_time`) VALUES
(1, 'Thanks alot God for these time may i use it very good', NULL, NULL, NULL, NULL),
(11, 'Thanks alot God for these time may i use it very good', '22050513039', 'I thank God for these day', 'Level 5', '22:33'),
(12, 'Thanks alot God for these time may i use it very good', '22050513090', 'helllo', 'Level 5', '8:37');

-- --------------------------------------------------------

--
-- Table structure for table `DataBase Management_qucyb`
--

CREATE TABLE `DataBase Management_qucyb` (
  `question_id` int(11) NOT NULL,
  `question_note` varchar(255) DEFAULT NULL,
  `candidee_num` varchar(255) DEFAULT NULL,
  `candidee_answer` varchar(255) DEFAULT NULL,
  `candidee_level` varchar(255) DEFAULT NULL,
  `candidee_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DataBase Management_qucyb`
--

INSERT INTO `DataBase Management_qucyb` (`question_id`, `question_note`, `candidee_num`, `candidee_answer`, `candidee_level`, `candidee_time`) VALUES
(1, 'speak about cyber', NULL, NULL, NULL, NULL),
(2, 'speak about cyber', '22050513090', 'cyber criminal', 'Level 5', '13:26');

-- --------------------------------------------------------

--
-- Table structure for table `DataBase Management_quearth`
--

CREATE TABLE `DataBase Management_quearth` (
  `question_id` int(11) NOT NULL,
  `question_note` varchar(255) DEFAULT NULL,
  `candidee_num` varchar(255) DEFAULT NULL,
  `candidee_answer` varchar(255) DEFAULT NULL,
  `candidee_level` varchar(255) DEFAULT NULL,
  `candidee_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DataBase Management_quearth`
--

INSERT INTO `DataBase Management_quearth` (`question_id`, `question_note`, `candidee_num`, `candidee_answer`, `candidee_level`, `candidee_time`) VALUES
(1, 'why is the earth sphere while others argue about these term', NULL, NULL, NULL, NULL),
(2, 'why is the earth sphere while others argue about these term', '22050513039', 'because of foolishness of scientist', 'Level 8', '21:42');

-- --------------------------------------------------------

--
-- Table structure for table `DataBase Management_quinert`
--

CREATE TABLE `DataBase Management_quinert` (
  `question_id` int(11) NOT NULL,
  `question_note` varchar(255) DEFAULT NULL,
  `candidee_num` varchar(255) DEFAULT NULL,
  `candidee_answer` varchar(255) DEFAULT NULL,
  `candidee_level` varchar(255) DEFAULT NULL,
  `candidee_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DataBase Management_quinert`
--

INSERT INTO `DataBase Management_quinert` (`question_id`, `question_note`, `candidee_num`, `candidee_answer`, `candidee_level`, `candidee_time`) VALUES
(1, 'explain moment of inertia in physics term', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `DataBase Management_quneed`
--

CREATE TABLE `DataBase Management_quneed` (
  `question_id` int(11) NOT NULL,
  `question_note` varchar(255) DEFAULT NULL,
  `candidee_num` varchar(255) DEFAULT NULL,
  `candidee_answer` varchar(255) DEFAULT NULL,
  `candidee_level` varchar(255) DEFAULT NULL,
  `candidee_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DataBase Management_quneed`
--

INSERT INTO `DataBase Management_quneed` (`question_id`, `question_note`, `candidee_num`, `candidee_answer`, `candidee_level`, `candidee_time`) VALUES
(1, 'i need the vodacom application letter configuration ', NULL, NULL, NULL, NULL),
(2, 'i need the vodacom application letter configuration ', '22050514038', 'Go in their office right now', 'Level 6', '7:43'),
(3, 'i need the vodacom application letter configuration ', '22050514037', 'check the menu of phone', 'Level 6', '11:43'),
(4, 'i need the vodacom application letter configuration ', '22050514065', 'Ask the customer care', 'Level 6', '4:50'),
(5, 'i need the vodacom application letter configuration ', '22050513039', 'man it is really private ', 'Level 8', '21:42');

-- --------------------------------------------------------

--
-- Table structure for table `DataBase Management_video`
--

CREATE TABLE `DataBase Management_video` (
  `db_mg_id` int(255) NOT NULL,
  `db_mg_desc` varchar(255) NOT NULL,
  `db_mg_tuto` varchar(255) NOT NULL,
  `db_mg_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DataBase Management_video`
--

INSERT INTO `DataBase Management_video` (`db_mg_id`, `db_mg_desc`, `db_mg_tuto`, `db_mg_path`) VALUES
(5, 'repeat the video', 'chapter 1', '67fce2d04f6829.69648946.mp4'),
(8, 'rare info ', 'chapter 4', '67fcea5ad249d9.09474140.mp4'),
(16, 'maybe true', 'chapter 13', '67fd04d0e67668.88519070.mp4'),
(17, 'tale of nine wind', 'chapter 14', '67fd05652a7c65.79685300.mp4'),
(19, 'please God by your help may it work ', 'chapter 16', '67fd0969ebce50.59000088.mp4'),
(21, 'Thank You God', 'chapter 19', '67fd0b63464482.46471021.mp4'),
(22, 'thanks again God', 'chapter 20', '67fd12c4ed6816.20421236.mp4'),
(23, 'group ', 'chapter 21', '67ff52402034c7.91520902.mp4'),
(24, 'the season 1 of formula e in the world right now', 'chapter 22', '68007efd5bd951.44704273.mp4'),
(25, 'i dont know just read it', 'chapter 23', '68007fbf9b31a1.31812048.mp4'),
(27, 'carlsen', 'chèss', '6845cbd8ac14d8.32420379.mp4'),
(28, 'chapter 1', 'tutorial 1', '6846b426570639.84684171.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `enrolling_table`
--

CREATE TABLE `enrolling_table` (
  `enrolling_no` int(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `lecture_admission` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrolling_table`
--

INSERT INTO `enrolling_table` (`enrolling_no`, `department`, `course`, `level`, `module`, `lecture_admission`) VALUES
(3, 'IT', 'Computer Science', 'Level 5', 'DataBase Management', '22050513037'),
(4, 'IT', 'Computer Science', 'Level 6', 'Ethical planing', '22050513037');

-- --------------------------------------------------------

--
-- Table structure for table `Ethical planing_notes`
--

CREATE TABLE `Ethical planing_notes` (
  `notes_id` int(255) NOT NULL,
  `note_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Ethical planing_notes`
--

INSERT INTO `Ethical planing_notes` (`notes_id`, `note_name`) VALUES
(1, 'OSS -4. OSS Production.pptx');

-- --------------------------------------------------------

--
-- Table structure for table `Ethical planing_video`
--

CREATE TABLE `Ethical planing_video` (
  `db_mg_id` int(255) NOT NULL,
  `db_mg_desc` varchar(255) NOT NULL,
  `db_mg_tuto` varchar(255) NOT NULL,
  `db_mg_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Ethical planing_video`
--

INSERT INTO `Ethical planing_video` (`db_mg_id`, `db_mg_desc`, `db_mg_tuto`, `db_mg_path`) VALUES
(2, 'Thank God and may you lead us', 'chapter 1', '680547eaf20114.81713236.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `ipt_schedule`
--

CREATE TABLE `ipt_schedule` (
  `schedule_no` int(255) NOT NULL,
  `startingDate` varchar(255) NOT NULL,
  `endingDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ipt_schedule`
--

INSERT INTO `ipt_schedule` (`schedule_no`, `startingDate`, `endingDate`) VALUES
(1, '2025-06-04', '2025-06-27');

-- --------------------------------------------------------

--
-- Table structure for table `login_table`
--

CREATE TABLE `login_table` (
  `login_no` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `course` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `admission_number` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `forgot_otp` varchar(255) DEFAULT NULL,
  `reg_otp` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_table`
--

INSERT INTO `login_table` (`login_no`, `fname`, `lname`, `sname`, `department`, `course`, `level`, `email`, `role`, `admission_number`, `password`, `forgot_otp`, `reg_otp`, `status`) VALUES
(2, 'idan', 'olomi', 'bertam', 'IT', 'Computer Science', 'Level 8', '1idanbertam@gmail.com', 'admin', '22050513038', '$2y$10$ypZVW8QI3a7G.PvriX6SD.ANlap30mUT9E11QXW0Akm36dxkh/BxW', '', '', 'active'),
(3, 'isaack', 'baltazari', 'bertam', 'IT', NULL, 'Level 5', 'isack@gmail.com', 'lecture', '22050513039', NULL, NULL, NULL, 'unactive'),
(4, 'james', 'Elilekia', 'mariki', 'IT', NULL, 'Level 5', 'james@gmail.com', 'lecture', '22050513036', NULL, NULL, NULL, 'unactive'),
(5, 'roritha', 'mbwambo', 'anusiata', 'IT', NULL, 'Level 6', 'roritha@gmail.com', 'lecture', '22050513035', NULL, NULL, NULL, 'unactive'),
(6, 'shakira', 'mbaga', 'anusiata', 'IT', NULL, NULL, 'shakira@gmail.com', 'lecture', '22050513034', NULL, NULL, NULL, 'unactive'),
(7, 'emanuel', 'heri', 'nwganguka', 'IT', NULL, NULL, 'ema@gmail.com', 'lecture', '22050513033', NULL, NULL, 'k58d', 'unactive'),
(8, 'godlove', 'nyas', 'malombe', 'IT', NULL, NULL, 'malombe@gmail.com', 'lecture', '22050513032', NULL, NULL, NULL, 'unactive'),
(9, 'exavery', 'Koni', 'kamanda', 'IT', NULL, NULL, 'exavery@gmail.com', 'lecture', '22050513031', NULL, NULL, NULL, 'unactive'),
(10, 'bertam', 'Balthazar ', 'olomi', 'IT', NULL, NULL, 'olomiidan@gmail.com', 'lecture', '22050513037', '$2y$10$hbg9mBGjPeupJE1FDHm9T.ok.K0w7uVOZ8za3vcO3fCKe.FZBTeTq', '', '', 'active'),
(11, 'abdul', 'kagera', 'mwaisa', 'IT', 'Computer Science', 'Level 5', 'idanbertam@gmail.com', 'student', '22050513090', '$2y$10$yEJlKVIqILpckPxT52SI3ubYBKHrakpNTARXpC8RecmV2/iu23MO6', '', '', 'active'),
(12, 'abdul', 'sylvester', 'zawadi', 'IT', 'Computer Science', 'Level 6', 'sylverter@gmail.com', 'student', '22050513050', NULL, NULL, NULL, 'unactive'),
(13, 'mkama', 'mkama', 'daudi', 'IT', 'Computer Science', 'Level 8', 'mka@gmail.com', 'student', '22050513012', NULL, NULL, NULL, 'unactive');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(255) NOT NULL,
  `candidates_no` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `area_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `candidates_no`, `name`, `phone_no`, `region`, `street`, `area_desc`) VALUES
(5, '22050513090', 'abdul kagera', '255766531122', 'Arusha', 'kilimbo', 'OFISI YA MKOA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `22050513012_book`
--
ALTER TABLE `22050513012_book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `22050513090_book`
--
ALTER TABLE `22050513090_book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `22050513090_college`
--
ALTER TABLE `22050513090_college`
  ADD PRIMARY KEY (`college_id`);

--
-- Indexes for table `22050513090_industry`
--
ALTER TABLE `22050513090_industry`
  ADD PRIMARY KEY (`industry_id`);

--
-- Indexes for table `22050513090_marker`
--
ALTER TABLE `22050513090_marker`
  ADD PRIMARY KEY (`marker_id`);

--
-- Indexes for table `22050513090_report`
--
ALTER TABLE `22050513090_report`
  ADD PRIMARY KEY (`technical_id`);

--
-- Indexes for table `admin_region_table`
--
ALTER TABLE `admin_region_table`
  ADD PRIMARY KEY (`region_no`);

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_no`);

--
-- Indexes for table `DataBase Management_notes`
--
ALTER TABLE `DataBase Management_notes`
  ADD PRIMARY KEY (`notes_id`);

--
-- Indexes for table `DataBase Management_qualot`
--
ALTER TABLE `DataBase Management_qualot`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `DataBase Management_qucyb`
--
ALTER TABLE `DataBase Management_qucyb`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `DataBase Management_quearth`
--
ALTER TABLE `DataBase Management_quearth`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `DataBase Management_quinert`
--
ALTER TABLE `DataBase Management_quinert`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `DataBase Management_quneed`
--
ALTER TABLE `DataBase Management_quneed`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `DataBase Management_video`
--
ALTER TABLE `DataBase Management_video`
  ADD PRIMARY KEY (`db_mg_id`);

--
-- Indexes for table `enrolling_table`
--
ALTER TABLE `enrolling_table`
  ADD PRIMARY KEY (`enrolling_no`);

--
-- Indexes for table `Ethical planing_notes`
--
ALTER TABLE `Ethical planing_notes`
  ADD PRIMARY KEY (`notes_id`);

--
-- Indexes for table `Ethical planing_video`
--
ALTER TABLE `Ethical planing_video`
  ADD PRIMARY KEY (`db_mg_id`);

--
-- Indexes for table `login_table`
--
ALTER TABLE `login_table`
  ADD PRIMARY KEY (`login_no`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `22050513012_book`
--
ALTER TABLE `22050513012_book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `22050513090_book`
--
ALTER TABLE `22050513090_book`
  MODIFY `book_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `22050513090_college`
--
ALTER TABLE `22050513090_college`
  MODIFY `college_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `22050513090_industry`
--
ALTER TABLE `22050513090_industry`
  MODIFY `industry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `22050513090_marker`
--
ALTER TABLE `22050513090_marker`
  MODIFY `marker_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `22050513090_report`
--
ALTER TABLE `22050513090_report`
  MODIFY `technical_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_region_table`
--
ALTER TABLE `admin_region_table`
  MODIFY `region_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `admin_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `DataBase Management_notes`
--
ALTER TABLE `DataBase Management_notes`
  MODIFY `notes_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `DataBase Management_qualot`
--
ALTER TABLE `DataBase Management_qualot`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `DataBase Management_qucyb`
--
ALTER TABLE `DataBase Management_qucyb`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `DataBase Management_quearth`
--
ALTER TABLE `DataBase Management_quearth`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `DataBase Management_quinert`
--
ALTER TABLE `DataBase Management_quinert`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `DataBase Management_quneed`
--
ALTER TABLE `DataBase Management_quneed`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `DataBase Management_video`
--
ALTER TABLE `DataBase Management_video`
  MODIFY `db_mg_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `enrolling_table`
--
ALTER TABLE `enrolling_table`
  MODIFY `enrolling_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Ethical planing_notes`
--
ALTER TABLE `Ethical planing_notes`
  MODIFY `notes_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Ethical planing_video`
--
ALTER TABLE `Ethical planing_video`
  MODIFY `db_mg_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_table`
--
ALTER TABLE `login_table`
  MODIFY `login_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
