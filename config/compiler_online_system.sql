-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2025 at 09:22 PM
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
-- Database: `compiler_online_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `action_logs`
--

CREATE TABLE `action_logs` (
  `action_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action_type` varchar(100) NOT NULL,
  `action_description` text DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_title` varchar(255) NOT NULL,
  `course_detail` varchar(255) DEFAULT NULL,
  `create_by` int(11) NOT NULL,
  `course_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=normal,2=deleted,3=hide',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_title`, `course_detail`, `create_by`, `course_status`, `created_at`, `updated_at`) VALUES
(1, 'การปรับพื้นฐานการเขียนโปรแกรม', 'เป็นคอร์สปรับพื้นฐานสำหรับนักศึกษาใหม่ สาขาวิทยากการคอมพิวเตอร์ ปีการศึกษา 2568', 3, 1, '2025-05-02 10:43:56', '2025-05-02 17:43:56'),
(2, 'JavaScript Basics', 'เรียนรู้พื้นฐานของ JavaScript สำหรับผู้เริ่มต้น', 1, 1, '2025-05-04 19:15:45', '2025-01-05 12:00:00'),
(3, 'Vue.js for Beginners', 'สอนการใช้งาน Vue.js แบบเข้าใจง่าย', 2, 1, '2025-05-04 19:15:45', '2025-01-10 14:00:00'),
(4, 'Advanced Python', 'คอร์สสำหรับผู้ที่มีพื้นฐาน Python แล้ว', 1, 1, '2025-05-04 19:15:45', '2025-02-01 16:00:00'),
(5, 'Data Structures', 'โครงสร้างข้อมูลเบื้องต้น เช่น array, stack, queue', 1, 1, '2025-05-04 19:15:45', '2025-02-10 18:30:00'),
(6, 'React Intermediate', 'พัฒนา React app ด้วย state และ hooks', 2, 3, '2025-05-04 19:15:45', '2025-03-01 09:00:00'),
(7, 'Deleted Course', 'คอร์สนี้ถูกลบ', 3, 2, '2025-05-04 19:15:45', '2024-12-25 11:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `event_logs`
--

CREATE TABLE `event_logs` (
  `event_id` int(11) NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `severity` enum('INFO','WARNING','ERROR','CRITICAL') DEFAULT 'INFO',
  `message` text NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_logs`
--

INSERT INTO `event_logs` (`event_id`, `event_type`, `severity`, `message`, `metadata`, `created_by`, `created_at`) VALUES
(1, 'register', 'INFO', 'New user registered: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"first_name\":\"Lookthor\",\"last_name\":\"Sullivan\"}', 1, '2025-04-30 21:18:20'),
(2, 'login_failure', 'WARNING', 'Login fail: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 1, '2025-04-30 21:20:28'),
(3, 'login_failure', 'WARNING', 'Login fail: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 1, '2025-04-30 21:20:54'),
(4, 'login_failure', 'WARNING', 'Login fail: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 1, '2025-04-30 21:21:13'),
(5, 'login_failure', 'WARNING', 'Login fail: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 1, '2025-04-30 21:22:01'),
(6, 'login_failure', 'WARNING', 'Login fail: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 1, '2025-04-30 21:22:13'),
(7, 'login_failure', 'WARNING', 'Login fail: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 1, '2025-04-30 21:23:58'),
(8, 'login_failure', 'WARNING', 'Login fail: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 1, '2025-04-30 21:24:15'),
(9, 'login_failure', 'WARNING', 'Login fail: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 1, '2025-04-30 21:27:41'),
(10, 'login_failure', 'WARNING', 'Login fail: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 1, '2025-04-30 21:31:37'),
(11, 'login_failure', 'WARNING', 'Login fail: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 1, '2025-04-30 21:32:37'),
(12, 'login_failure', 'WARNING', 'Login fail: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 1, '2025-04-30 21:33:03'),
(13, 'login_failure', 'WARNING', 'Login fail: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 1, '2025-04-30 21:33:23'),
(14, 'register', 'INFO', 'New user registered: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"first_name\":\"admin\",\"last_name\":\"admin\"}', 2, '2025-04-30 21:37:23'),
(15, 'login_failure', 'WARNING', 'Login fail: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 2, '2025-04-30 21:37:35'),
(16, 'login_failure', 'WARNING', 'Login fail: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"fail\",\"note\":\"Incorrect password\"}', 2, '2025-04-30 21:40:51'),
(17, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-04-30 21:56:03'),
(18, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-04-30 21:57:30'),
(19, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-04-30 21:59:21'),
(20, 'login_success', 'INFO', 'Login success: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 1, '2025-04-30 21:59:57'),
(21, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-05-01 05:29:59'),
(22, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-05-01 05:31:24'),
(23, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-05-01 05:31:42'),
(24, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-05-01 05:31:50'),
(25, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-05-01 06:32:58'),
(26, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-05-01 06:59:31'),
(27, 'login_success', 'INFO', 'Login success: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 1, '2025-05-01 08:37:42'),
(28, 'login_success', 'INFO', 'Login success: lookthor.sul@gmail.com', '{\"email\":\"lookthor.sul@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 1, '2025-05-01 08:45:33'),
(29, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-05-01 09:16:54'),
(30, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-05-02 07:51:20'),
(31, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-05-02 07:54:04'),
(32, 'login_success', 'INFO', 'Login success: admin@gmail.com', '{\"email\":\"admin@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 2, '2025-05-02 07:55:57'),
(33, 'login_success', 'INFO', 'Login success: zagon@gmail.com', '{\"email\":\"zagon@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 3, '2025-05-02 12:26:28'),
(34, 'login_success', 'INFO', 'Login success: zagon@gmail.com', '{\"email\":\"zagon@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 3, '2025-05-02 12:34:45'),
(35, 'login_success', 'INFO', 'Login success: zagon@gmail.com', '{\"email\":\"zagon@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 3, '2025-05-02 12:42:06'),
(36, 'login_success', 'INFO', 'Login success: zagon@gmail.com', '{\"email\":\"zagon@gmail.com\",\"status\":\"success\",\"note\":\"Login successful\"}', 3, '2025-05-02 12:50:58');

-- --------------------------------------------------------

--
-- Table structure for table `excercises`
--

CREATE TABLE `excercises` (
  `excercise_id` int(11) NOT NULL,
  `excercise_title` varchar(100) NOT NULL,
  `excercise_detail` varchar(255) DEFAULT NULL,
  `input_format` varchar(255) DEFAULT NULL,
  `output_format` varchar(255) DEFAULT NULL,
  `testcase_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `excercise_status` tinyint(1) NOT NULL COMMENT '1=normal,2=deleted, 3=hide',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `lesson_id` int(11) NOT NULL,
  `lesson_title` varchar(100) NOT NULL,
  `lesson_detail` varchar(255) NOT NULL,
  `lesson_file` varchar(255) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `lesson_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=normal,2=deleted,3=hide',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL,
  `section_title` varchar(80) NOT NULL,
  `course_id` int(11) NOT NULL,
  `section_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=normal,2=deleted,3=hide',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `user_profile` varchar(255) DEFAULT NULL,
  `user_role` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=admin, 2=teacher, 3=user',
  `user_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=normal,2=deleted',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `first_name`, `last_name`, `user_profile`, `user_role`, `user_status`, `created_at`, `updated_at`) VALUES
(1, 'lookthor.sul@gmail.com', '123456', 'Lookthor', 'Sullivan', NULL, 3, 1, '2025-04-30 21:21:57', '2025-05-01 04:21:57'),
(2, 'admin@gmail.com', '$2b$10$LpyQ3kev9h9DVKCT8npCNeKokWTir6At/xoaAxYuqeD', 'admin', 'admin', NULL, 1, 1, '2025-05-01 05:24:18', '2025-05-01 12:24:18'),
(3, 'zagon@gmail.com', '123456', 'zagon', 'bussabong', NULL, 2, 1, '2025-05-02 10:29:21', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action_logs`
--
ALTER TABLE `action_logs`
  ADD PRIMARY KEY (`action_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `event_logs`
--
ALTER TABLE `event_logs`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `excercises`
--
ALTER TABLE `excercises`
  ADD PRIMARY KEY (`excercise_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`lesson_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action_logs`
--
ALTER TABLE `action_logs`
  MODIFY `action_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `event_logs`
--
ALTER TABLE `event_logs`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `excercises`
--
ALTER TABLE `excercises`
  MODIFY `excercise_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
