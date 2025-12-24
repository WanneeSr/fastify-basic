-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2025 at 05:49 PM
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
-- Database: `lms_compiler`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `class_name`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Class 1', 'Description 1', 2, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(2, 'Class 2', 'Description 2', 3, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(3, 'Class 3', 'Description 3', 4, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(4, 'Class 4', 'Description 4', 5, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(5, 'Class 5', 'Description 5', 6, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(6, 'Class 6', 'Description 6', 7, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(7, 'Class 7', 'Description 7', 8, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(8, 'Class 8', 'Description 8', 9, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(9, 'Class 9', 'Description 9', 10, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(10, 'Class 10', 'Description 10', 11, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(11, 'Class 11', 'Description 11', 12, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(12, 'Class 12', 'Description 12', 13, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(13, 'Class 13', 'Description 13', 14, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(14, 'Class 14', 'Description 14', 15, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(15, 'Class 15', 'Description 15', 16, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(16, 'Class 16', 'Description 16', 17, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(17, 'Class 17', 'Description 17', 18, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(18, 'Class 18', 'Description 18', 19, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(19, 'Class 19', 'Description 19', 20, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(20, 'Class 20', 'Description 20', 21, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(21, 'Class 21', 'Description 21', 2, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(22, 'Class 22', 'Description 22', 3, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(23, 'Class 23', 'Description 23', 4, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(24, 'Class 24', 'Description 24', 5, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(25, 'Class 25', 'Description 25', 6, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(26, 'Class 26', 'Description 26', 7, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(27, 'Class 27', 'Description 27', 8, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(28, 'Class 28', 'Description 28', 9, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(29, 'Class 29', 'Description 29', 10, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(30, 'Class 30', 'Description 30', 11, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(31, 'Class 31', 'Description 31', 12, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(32, 'Class 32', 'Description 32', 13, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(33, 'Class 33', 'Description 33', 14, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(34, 'Class 34', 'Description 34', 15, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(35, 'Class 35', 'Description 35', 16, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(36, 'Class 36', 'Description 36', 17, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(37, 'Class 37', 'Description 37', 18, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(38, 'Class 38', 'Description 38', 19, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(39, 'Class 39', 'Description 39', 20, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(40, 'Class 40', 'Description 40', 21, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(41, 'Class 41', 'Description 41', 2, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(42, 'Class 42', 'Description 42', 3, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(43, 'Class 43', 'Description 43', 4, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(44, 'Class 44', 'Description 44', 5, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(45, 'Class 45', 'Description 45', 6, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(46, 'Class 46', 'Description 46', 7, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(47, 'Class 47', 'Description 47', 8, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(48, 'Class 48', 'Description 48', 9, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(49, 'Class 49', 'Description 49', 10, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(50, 'Class 50', 'Description 50', 11, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(51, 'Class 51', 'Description 51', 12, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(52, 'Class 52', 'Description 52', 13, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(53, 'Class 53', 'Description 53', 14, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(54, 'Class 54', 'Description 54', 15, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(55, 'Class 55', 'Description 55', 16, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(56, 'Class 56', 'Description 56', 17, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(57, 'Class 57', 'Description 57', 18, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(58, 'Class 58', 'Description 58', 19, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(59, 'Class 59', 'Description 59', 20, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(60, 'Class 60', 'Description 60', 21, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(61, 'Class 61', 'Description 61', 2, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(62, 'Class 62', 'Description 62', 3, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(63, 'Class 63', 'Description 63', 4, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(64, 'Class 64', 'Description 64', 5, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(65, 'Class 65', 'Description 65', 6, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(66, 'Class 66', 'Description 66', 7, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(67, 'Class 67', 'Description 67', 8, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(68, 'Class 68', 'Description 68', 9, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(69, 'Class 69', 'Description 69', 10, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(70, 'Class 70', 'Description 70', 11, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(71, 'Class 71', 'Description 71', 12, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(72, 'Class 72', 'Description 72', 13, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(73, 'Class 73', 'Description 73', 14, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(74, 'Class 74', 'Description 74', 15, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(75, 'Class 75', 'Description 75', 16, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(76, 'Class 76', 'Description 76', 17, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(77, 'Class 77', 'Description 77', 18, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(78, 'Class 78', 'Description 78', 19, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(79, 'Class 79', 'Description 79', 20, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(80, 'Class 80', 'Description 80', 21, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(81, 'Class 81', 'Description 81', 2, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(82, 'Class 82', 'Description 82', 3, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(83, 'Class 83', 'Description 83', 4, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(84, 'Class 84', 'Description 84', 5, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(85, 'Class 85', 'Description 85', 6, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(86, 'Class 86', 'Description 86', 7, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(87, 'Class 87', 'Description 87', 8, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(88, 'Class 88', 'Description 88', 9, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(89, 'Class 89', 'Description 89', 10, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(90, 'Class 90', 'Description 90', 11, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(91, 'Class 91', 'Description 91', 12, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(92, 'Class 92', 'Description 92', 13, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(93, 'Class 93', 'Description 93', 14, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(94, 'Class 94', 'Description 94', 15, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(95, 'Class 95', 'Description 95', 16, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(96, 'Class 96', 'Description 96', 17, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(97, 'Class 97', 'Description 97', 18, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(98, 'Class 98', 'Description 98', 19, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(99, 'Class 99', 'Description 99', 20, '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(100, 'Class 100', 'Description 100', 21, '2025-12-22 07:12:40', '2025-12-22 07:12:40');

-- --------------------------------------------------------

--
-- Table structure for table `class_role`
--

CREATE TABLE `class_role` (
  `class_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_role`
--

INSERT INTO `class_role` (`class_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(99, 2),
(100, 2);

-- --------------------------------------------------------

--
-- Table structure for table `class_user`
--

CREATE TABLE `class_user` (
  `class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_user`
--

INSERT INTO `class_user` (`class_id`, `user_id`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14),
(14, 15),
(15, 16),
(16, 17),
(17, 18),
(18, 19),
(19, 20),
(20, 21),
(21, 2),
(22, 3),
(23, 4),
(24, 5),
(25, 6),
(26, 7),
(27, 8),
(28, 9),
(29, 10),
(30, 11),
(31, 12),
(32, 13),
(33, 14),
(34, 15),
(35, 16),
(36, 17),
(37, 18),
(38, 19),
(39, 20),
(40, 21),
(41, 2),
(42, 3),
(43, 4),
(44, 5),
(45, 6),
(46, 7),
(47, 8),
(48, 9),
(49, 10),
(50, 11),
(51, 12),
(52, 13),
(53, 14),
(54, 15),
(55, 16),
(56, 17),
(57, 18),
(58, 19),
(59, 20),
(60, 21),
(61, 2),
(62, 3),
(63, 4),
(64, 5),
(65, 6),
(66, 7),
(67, 8),
(68, 9),
(69, 10),
(70, 11),
(71, 12),
(72, 13),
(73, 14),
(74, 15),
(75, 16),
(76, 17),
(77, 18),
(78, 19),
(79, 20),
(80, 21),
(81, 2),
(82, 3),
(83, 4),
(84, 5),
(85, 6),
(86, 7),
(87, 8),
(88, 9),
(89, 10),
(90, 11),
(91, 12),
(92, 13),
(93, 14),
(94, 15),
(95, 16),
(96, 17),
(97, 18),
(98, 19),
(99, 20),
(100, 21);

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `exercise_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `max_score` int(11) DEFAULT 100,
  `deadline` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`exercise_id`, `lesson_id`, `title`, `description`, `max_score`, `deadline`) VALUES
(1, 1, 'Exercise 1', 'Solve this problem', 100, NULL),
(2, 6, 'Exercise 6', 'Solve this problem', 100, NULL),
(3, 11, 'Exercise 11', 'Solve this problem', 100, NULL),
(4, 16, 'Exercise 16', 'Solve this problem', 100, NULL),
(5, 21, 'Exercise 21', 'Solve this problem', 100, NULL),
(6, 26, 'Exercise 26', 'Solve this problem', 100, NULL),
(7, 31, 'Exercise 31', 'Solve this problem', 100, NULL),
(8, 36, 'Exercise 36', 'Solve this problem', 100, NULL),
(9, 41, 'Exercise 41', 'Solve this problem', 100, NULL),
(10, 46, 'Exercise 46', 'Solve this problem', 100, NULL),
(11, 51, 'Exercise 51', 'Solve this problem', 100, NULL),
(12, 56, 'Exercise 56', 'Solve this problem', 100, NULL),
(13, 61, 'Exercise 61', 'Solve this problem', 100, NULL),
(14, 66, 'Exercise 66', 'Solve this problem', 100, NULL),
(15, 71, 'Exercise 71', 'Solve this problem', 100, NULL),
(16, 76, 'Exercise 76', 'Solve this problem', 100, NULL),
(17, 81, 'Exercise 81', 'Solve this problem', 100, NULL),
(18, 86, 'Exercise 86', 'Solve this problem', 100, NULL),
(19, 91, 'Exercise 91', 'Solve this problem', 100, NULL),
(20, 96, 'Exercise 96', 'Solve this problem', 100, NULL),
(21, 2, 'Exercise 2', 'Solve this problem', 100, NULL),
(22, 7, 'Exercise 7', 'Solve this problem', 100, NULL),
(23, 12, 'Exercise 12', 'Solve this problem', 100, NULL),
(24, 17, 'Exercise 17', 'Solve this problem', 100, NULL),
(25, 22, 'Exercise 22', 'Solve this problem', 100, NULL),
(26, 27, 'Exercise 27', 'Solve this problem', 100, NULL),
(27, 32, 'Exercise 32', 'Solve this problem', 100, NULL),
(28, 37, 'Exercise 37', 'Solve this problem', 100, NULL),
(29, 42, 'Exercise 42', 'Solve this problem', 100, NULL),
(30, 47, 'Exercise 47', 'Solve this problem', 100, NULL),
(31, 52, 'Exercise 52', 'Solve this problem', 100, NULL),
(32, 57, 'Exercise 57', 'Solve this problem', 100, NULL),
(33, 62, 'Exercise 62', 'Solve this problem', 100, NULL),
(34, 67, 'Exercise 67', 'Solve this problem', 100, NULL),
(35, 72, 'Exercise 72', 'Solve this problem', 100, NULL),
(36, 77, 'Exercise 77', 'Solve this problem', 100, NULL),
(37, 82, 'Exercise 82', 'Solve this problem', 100, NULL),
(38, 87, 'Exercise 87', 'Solve this problem', 100, NULL),
(39, 92, 'Exercise 92', 'Solve this problem', 100, NULL),
(40, 97, 'Exercise 97', 'Solve this problem', 100, NULL),
(41, 3, 'Exercise 3', 'Solve this problem', 100, NULL),
(42, 8, 'Exercise 8', 'Solve this problem', 100, NULL),
(43, 13, 'Exercise 13', 'Solve this problem', 100, NULL),
(44, 18, 'Exercise 18', 'Solve this problem', 100, NULL),
(45, 23, 'Exercise 23', 'Solve this problem', 100, NULL),
(46, 28, 'Exercise 28', 'Solve this problem', 100, NULL),
(47, 33, 'Exercise 33', 'Solve this problem', 100, NULL),
(48, 38, 'Exercise 38', 'Solve this problem', 100, NULL),
(49, 43, 'Exercise 43', 'Solve this problem', 100, NULL),
(50, 48, 'Exercise 48', 'Solve this problem', 100, NULL),
(51, 53, 'Exercise 53', 'Solve this problem', 100, NULL),
(52, 58, 'Exercise 58', 'Solve this problem', 100, NULL),
(53, 63, 'Exercise 63', 'Solve this problem', 100, NULL),
(54, 68, 'Exercise 68', 'Solve this problem', 100, NULL),
(55, 73, 'Exercise 73', 'Solve this problem', 100, NULL),
(56, 78, 'Exercise 78', 'Solve this problem', 100, NULL),
(57, 83, 'Exercise 83', 'Solve this problem', 100, NULL),
(58, 88, 'Exercise 88', 'Solve this problem', 100, NULL),
(59, 93, 'Exercise 93', 'Solve this problem', 100, NULL),
(60, 98, 'Exercise 98', 'Solve this problem', 100, NULL),
(61, 4, 'Exercise 4', 'Solve this problem', 100, NULL),
(62, 9, 'Exercise 9', 'Solve this problem', 100, NULL),
(63, 14, 'Exercise 14', 'Solve this problem', 100, NULL),
(64, 19, 'Exercise 19', 'Solve this problem', 100, NULL),
(65, 24, 'Exercise 24', 'Solve this problem', 100, NULL),
(66, 29, 'Exercise 29', 'Solve this problem', 100, NULL),
(67, 34, 'Exercise 34', 'Solve this problem', 100, NULL),
(68, 39, 'Exercise 39', 'Solve this problem', 100, NULL),
(69, 44, 'Exercise 44', 'Solve this problem', 100, NULL),
(70, 49, 'Exercise 49', 'Solve this problem', 100, NULL),
(71, 54, 'Exercise 54', 'Solve this problem', 100, NULL),
(72, 59, 'Exercise 59', 'Solve this problem', 100, NULL),
(73, 64, 'Exercise 64', 'Solve this problem', 100, NULL),
(74, 69, 'Exercise 69', 'Solve this problem', 100, NULL),
(75, 74, 'Exercise 74', 'Solve this problem', 100, NULL),
(76, 79, 'Exercise 79', 'Solve this problem', 100, NULL),
(77, 84, 'Exercise 84', 'Solve this problem', 100, NULL),
(78, 89, 'Exercise 89', 'Solve this problem', 100, NULL),
(79, 94, 'Exercise 94', 'Solve this problem', 100, NULL),
(80, 99, 'Exercise 99', 'Solve this problem', 100, NULL),
(81, 5, 'Exercise 5', 'Solve this problem', 100, NULL),
(82, 10, 'Exercise 10', 'Solve this problem', 100, NULL),
(83, 15, 'Exercise 15', 'Solve this problem', 100, NULL),
(84, 20, 'Exercise 20', 'Solve this problem', 100, NULL),
(85, 25, 'Exercise 25', 'Solve this problem', 100, NULL),
(86, 30, 'Exercise 30', 'Solve this problem', 100, NULL),
(87, 35, 'Exercise 35', 'Solve this problem', 100, NULL),
(88, 40, 'Exercise 40', 'Solve this problem', 100, NULL),
(89, 45, 'Exercise 45', 'Solve this problem', 100, NULL),
(90, 50, 'Exercise 50', 'Solve this problem', 100, NULL),
(91, 55, 'Exercise 55', 'Solve this problem', 100, NULL),
(92, 60, 'Exercise 60', 'Solve this problem', 100, NULL),
(93, 65, 'Exercise 65', 'Solve this problem', 100, NULL),
(94, 70, 'Exercise 70', 'Solve this problem', 100, NULL),
(95, 75, 'Exercise 75', 'Solve this problem', 100, NULL),
(96, 80, 'Exercise 80', 'Solve this problem', 100, NULL),
(97, 85, 'Exercise 85', 'Solve this problem', 100, NULL),
(98, 90, 'Exercise 90', 'Solve this problem', 100, NULL),
(99, 95, 'Exercise 95', 'Solve this problem', 100, NULL),
(100, 100, 'Exercise 100', 'Solve this problem', 100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exercise_language`
--

CREATE TABLE `exercise_language` (
  `exercise_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercise_language`
--

INSERT INTO `exercise_language` (`exercise_id`, `language_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL,
  `language_name` enum('Python','C','C++') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`language_id`, `language_name`) VALUES
(1, 'Python'),
(2, 'C'),
(3, 'C++');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `lesson_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`lesson_id`, `class_id`, `title`, `content`, `created_at`) VALUES
(1, 1, 'Lesson 1', 'Lesson content', '2025-12-22 07:12:40'),
(2, 21, 'Lesson 21', 'Lesson content', '2025-12-22 07:12:40'),
(3, 41, 'Lesson 41', 'Lesson content', '2025-12-22 07:12:40'),
(4, 61, 'Lesson 61', 'Lesson content', '2025-12-22 07:12:40'),
(5, 81, 'Lesson 81', 'Lesson content', '2025-12-22 07:12:40'),
(6, 2, 'Lesson 2', 'Lesson content', '2025-12-22 07:12:40'),
(7, 22, 'Lesson 22', 'Lesson content', '2025-12-22 07:12:40'),
(8, 42, 'Lesson 42', 'Lesson content', '2025-12-22 07:12:40'),
(9, 62, 'Lesson 62', 'Lesson content', '2025-12-22 07:12:40'),
(10, 82, 'Lesson 82', 'Lesson content', '2025-12-22 07:12:40'),
(11, 3, 'Lesson 3', 'Lesson content', '2025-12-22 07:12:40'),
(12, 23, 'Lesson 23', 'Lesson content', '2025-12-22 07:12:40'),
(13, 43, 'Lesson 43', 'Lesson content', '2025-12-22 07:12:40'),
(14, 63, 'Lesson 63', 'Lesson content', '2025-12-22 07:12:40'),
(15, 83, 'Lesson 83', 'Lesson content', '2025-12-22 07:12:40'),
(16, 4, 'Lesson 4', 'Lesson content', '2025-12-22 07:12:40'),
(17, 24, 'Lesson 24', 'Lesson content', '2025-12-22 07:12:40'),
(18, 44, 'Lesson 44', 'Lesson content', '2025-12-22 07:12:40'),
(19, 64, 'Lesson 64', 'Lesson content', '2025-12-22 07:12:40'),
(20, 84, 'Lesson 84', 'Lesson content', '2025-12-22 07:12:40'),
(21, 5, 'Lesson 5', 'Lesson content', '2025-12-22 07:12:40'),
(22, 25, 'Lesson 25', 'Lesson content', '2025-12-22 07:12:40'),
(23, 45, 'Lesson 45', 'Lesson content', '2025-12-22 07:12:40'),
(24, 65, 'Lesson 65', 'Lesson content', '2025-12-22 07:12:40'),
(25, 85, 'Lesson 85', 'Lesson content', '2025-12-22 07:12:40'),
(26, 6, 'Lesson 6', 'Lesson content', '2025-12-22 07:12:40'),
(27, 26, 'Lesson 26', 'Lesson content', '2025-12-22 07:12:40'),
(28, 46, 'Lesson 46', 'Lesson content', '2025-12-22 07:12:40'),
(29, 66, 'Lesson 66', 'Lesson content', '2025-12-22 07:12:40'),
(30, 86, 'Lesson 86', 'Lesson content', '2025-12-22 07:12:40'),
(31, 7, 'Lesson 7', 'Lesson content', '2025-12-22 07:12:40'),
(32, 27, 'Lesson 27', 'Lesson content', '2025-12-22 07:12:40'),
(33, 47, 'Lesson 47', 'Lesson content', '2025-12-22 07:12:40'),
(34, 67, 'Lesson 67', 'Lesson content', '2025-12-22 07:12:40'),
(35, 87, 'Lesson 87', 'Lesson content', '2025-12-22 07:12:40'),
(36, 8, 'Lesson 8', 'Lesson content', '2025-12-22 07:12:40'),
(37, 28, 'Lesson 28', 'Lesson content', '2025-12-22 07:12:40'),
(38, 48, 'Lesson 48', 'Lesson content', '2025-12-22 07:12:40'),
(39, 68, 'Lesson 68', 'Lesson content', '2025-12-22 07:12:40'),
(40, 88, 'Lesson 88', 'Lesson content', '2025-12-22 07:12:40'),
(41, 9, 'Lesson 9', 'Lesson content', '2025-12-22 07:12:40'),
(42, 29, 'Lesson 29', 'Lesson content', '2025-12-22 07:12:40'),
(43, 49, 'Lesson 49', 'Lesson content', '2025-12-22 07:12:40'),
(44, 69, 'Lesson 69', 'Lesson content', '2025-12-22 07:12:40'),
(45, 89, 'Lesson 89', 'Lesson content', '2025-12-22 07:12:40'),
(46, 10, 'Lesson 10', 'Lesson content', '2025-12-22 07:12:40'),
(47, 30, 'Lesson 30', 'Lesson content', '2025-12-22 07:12:40'),
(48, 50, 'Lesson 50', 'Lesson content', '2025-12-22 07:12:40'),
(49, 70, 'Lesson 70', 'Lesson content', '2025-12-22 07:12:40'),
(50, 90, 'Lesson 90', 'Lesson content', '2025-12-22 07:12:40'),
(51, 11, 'Lesson 11', 'Lesson content', '2025-12-22 07:12:40'),
(52, 31, 'Lesson 31', 'Lesson content', '2025-12-22 07:12:40'),
(53, 51, 'Lesson 51', 'Lesson content', '2025-12-22 07:12:40'),
(54, 71, 'Lesson 71', 'Lesson content', '2025-12-22 07:12:40'),
(55, 91, 'Lesson 91', 'Lesson content', '2025-12-22 07:12:40'),
(56, 12, 'Lesson 12', 'Lesson content', '2025-12-22 07:12:40'),
(57, 32, 'Lesson 32', 'Lesson content', '2025-12-22 07:12:40'),
(58, 52, 'Lesson 52', 'Lesson content', '2025-12-22 07:12:40'),
(59, 72, 'Lesson 72', 'Lesson content', '2025-12-22 07:12:40'),
(60, 92, 'Lesson 92', 'Lesson content', '2025-12-22 07:12:40'),
(61, 13, 'Lesson 13', 'Lesson content', '2025-12-22 07:12:40'),
(62, 33, 'Lesson 33', 'Lesson content', '2025-12-22 07:12:40'),
(63, 53, 'Lesson 53', 'Lesson content', '2025-12-22 07:12:40'),
(64, 73, 'Lesson 73', 'Lesson content', '2025-12-22 07:12:40'),
(65, 93, 'Lesson 93', 'Lesson content', '2025-12-22 07:12:40'),
(66, 14, 'Lesson 14', 'Lesson content', '2025-12-22 07:12:40'),
(67, 34, 'Lesson 34', 'Lesson content', '2025-12-22 07:12:40'),
(68, 54, 'Lesson 54', 'Lesson content', '2025-12-22 07:12:40'),
(69, 74, 'Lesson 74', 'Lesson content', '2025-12-22 07:12:40'),
(70, 94, 'Lesson 94', 'Lesson content', '2025-12-22 07:12:40'),
(71, 15, 'Lesson 15', 'Lesson content', '2025-12-22 07:12:40'),
(72, 35, 'Lesson 35', 'Lesson content', '2025-12-22 07:12:40'),
(73, 55, 'Lesson 55', 'Lesson content', '2025-12-22 07:12:40'),
(74, 75, 'Lesson 75', 'Lesson content', '2025-12-22 07:12:40'),
(75, 95, 'Lesson 95', 'Lesson content', '2025-12-22 07:12:40'),
(76, 16, 'Lesson 16', 'Lesson content', '2025-12-22 07:12:40'),
(77, 36, 'Lesson 36', 'Lesson content', '2025-12-22 07:12:40'),
(78, 56, 'Lesson 56', 'Lesson content', '2025-12-22 07:12:40'),
(79, 76, 'Lesson 76', 'Lesson content', '2025-12-22 07:12:40'),
(80, 96, 'Lesson 96', 'Lesson content', '2025-12-22 07:12:40'),
(81, 17, 'Lesson 17', 'Lesson content', '2025-12-22 07:12:40'),
(82, 37, 'Lesson 37', 'Lesson content', '2025-12-22 07:12:40'),
(83, 57, 'Lesson 57', 'Lesson content', '2025-12-22 07:12:40'),
(84, 77, 'Lesson 77', 'Lesson content', '2025-12-22 07:12:40'),
(85, 97, 'Lesson 97', 'Lesson content', '2025-12-22 07:12:40'),
(86, 18, 'Lesson 18', 'Lesson content', '2025-12-22 07:12:40'),
(87, 38, 'Lesson 38', 'Lesson content', '2025-12-22 07:12:40'),
(88, 58, 'Lesson 58', 'Lesson content', '2025-12-22 07:12:40'),
(89, 78, 'Lesson 78', 'Lesson content', '2025-12-22 07:12:40'),
(90, 98, 'Lesson 98', 'Lesson content', '2025-12-22 07:12:40'),
(91, 19, 'Lesson 19', 'Lesson content', '2025-12-22 07:12:40'),
(92, 39, 'Lesson 39', 'Lesson content', '2025-12-22 07:12:40'),
(93, 59, 'Lesson 59', 'Lesson content', '2025-12-22 07:12:40'),
(94, 79, 'Lesson 79', 'Lesson content', '2025-12-22 07:12:40'),
(95, 99, 'Lesson 99', 'Lesson content', '2025-12-22 07:12:40'),
(96, 20, 'Lesson 20', 'Lesson content', '2025-12-22 07:12:40'),
(97, 40, 'Lesson 40', 'Lesson content', '2025-12-22 07:12:40'),
(98, 60, 'Lesson 60', 'Lesson content', '2025-12-22 07:12:40'),
(99, 80, 'Lesson 80', 'Lesson content', '2025-12-22 07:12:40'),
(100, 100, 'Lesson 100', 'Lesson content', '2025-12-22 07:12:40');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'user who triggered action',
  `action` varchar(100) NOT NULL COMMENT 'LOGIN_SUCCESS, SUBMIT_CODE, DELETE_CLASS',
  `action_detail` varchar(255) DEFAULT NULL COMMENT 'short non-sensitive description',
  `target_type` enum('class','lesson','exercise','submission','test_case','user','file','system') DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL COMMENT 'id of related resource',
  `module` enum('auth','class','lesson','exercise','compiler','submission','admin','system') NOT NULL,
  `log_level` enum('INFO','WARN','ERROR') DEFAULT 'INFO',
  `http_method` varchar(10) DEFAULT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'can be hashed',
  `user_agent` varchar(255) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'safe contextual metadata' CHECK (json_valid(`metadata`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `user_id`, `action`, `action_detail`, `target_type`, `target_id`, `module`, `log_level`, `http_method`, `endpoint`, `status_code`, `ip_address`, `user_agent`, `metadata`, `created_at`) VALUES
(1, 128, 'LOGIN_FAILURE', 'User login wannee.fahsai@gmail.com', NULL, NULL, 'auth', 'WARN', NULL, NULL, NULL, NULL, NULL, '{\"result\":\"wannee.fahsai@gmail.com\",\"note\":\"success\",\"source\":\"auth\"}', '2025-12-24 15:31:00');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `user_id`, `message`, `is_read`, `created_at`) VALUES
(1, 1, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(2, 10, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(3, 100, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(4, 11, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(5, 12, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(6, 13, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(7, 14, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(8, 15, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(9, 16, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(10, 17, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(11, 18, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(12, 19, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(13, 2, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(14, 20, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(15, 21, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(16, 22, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(17, 23, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(18, 24, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(19, 25, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(20, 26, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(21, 27, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(22, 28, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(23, 29, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(24, 3, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(25, 30, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(26, 31, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(27, 32, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(28, 33, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(29, 34, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(30, 35, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(31, 36, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(32, 37, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(33, 38, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(34, 39, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(35, 4, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(36, 40, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(37, 41, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(38, 42, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(39, 43, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(40, 44, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(41, 45, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(42, 46, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(43, 47, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(44, 48, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(45, 49, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(46, 5, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(47, 50, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(48, 51, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(49, 52, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(50, 53, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(51, 54, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(52, 55, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(53, 56, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(54, 57, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(55, 58, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(56, 59, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(57, 6, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(58, 60, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(59, 61, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(60, 62, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(61, 63, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(62, 64, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(63, 65, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(64, 66, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(65, 67, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(66, 68, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(67, 69, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(68, 7, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(69, 70, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(70, 71, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(71, 72, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(72, 73, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(73, 74, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(74, 75, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(75, 76, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(76, 77, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(77, 78, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(78, 79, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(79, 8, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(80, 80, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(81, 81, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(82, 82, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(83, 83, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(84, 84, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(85, 85, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(86, 86, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(87, 87, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(88, 88, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(89, 89, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(90, 9, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(91, 90, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(92, 91, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(93, 92, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(94, 93, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(95, 94, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(96, 95, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(97, 96, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(98, 97, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(99, 98, 'Welcome to the system', 0, '2025-12-22 07:12:40'),
(100, 99, 'Welcome to the system', 0, '2025-12-22 07:12:40');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` enum('admin','instructor','learner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'admin'),
(2, 'instructor'),
(3, 'learner');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `score_id` int(11) NOT NULL,
  `submission_id` int(11) NOT NULL,
  `total_score` int(11) NOT NULL,
  `evaluated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`score_id`, `submission_id`, `total_score`, `evaluated_at`) VALUES
(1, 1, 100, '2025-12-22 07:12:40'),
(2, 6, 100, '2025-12-22 07:12:40'),
(3, 11, 100, '2025-12-22 07:12:40'),
(4, 16, 100, '2025-12-22 07:12:40'),
(5, 21, 100, '2025-12-22 07:12:40'),
(6, 26, 100, '2025-12-22 07:12:40'),
(7, 31, 100, '2025-12-22 07:12:40'),
(8, 36, 100, '2025-12-22 07:12:40'),
(9, 41, 100, '2025-12-22 07:12:40'),
(10, 46, 100, '2025-12-22 07:12:40'),
(11, 51, 100, '2025-12-22 07:12:40'),
(12, 56, 100, '2025-12-22 07:12:40'),
(13, 61, 100, '2025-12-22 07:12:40'),
(14, 66, 100, '2025-12-22 07:12:40'),
(15, 71, 100, '2025-12-22 07:12:40'),
(16, 76, 100, '2025-12-22 07:12:40'),
(17, 81, 100, '2025-12-22 07:12:40'),
(18, 86, 100, '2025-12-22 07:12:40'),
(19, 91, 100, '2025-12-22 07:12:40'),
(20, 96, 100, '2025-12-22 07:12:40'),
(21, 2, 100, '2025-12-22 07:12:40'),
(22, 7, 100, '2025-12-22 07:12:40'),
(23, 12, 100, '2025-12-22 07:12:40'),
(24, 17, 100, '2025-12-22 07:12:40'),
(25, 22, 100, '2025-12-22 07:12:40'),
(26, 27, 100, '2025-12-22 07:12:40'),
(27, 32, 100, '2025-12-22 07:12:40'),
(28, 37, 100, '2025-12-22 07:12:40'),
(29, 42, 100, '2025-12-22 07:12:40'),
(30, 47, 100, '2025-12-22 07:12:40'),
(31, 52, 100, '2025-12-22 07:12:40'),
(32, 57, 100, '2025-12-22 07:12:40'),
(33, 62, 100, '2025-12-22 07:12:40'),
(34, 67, 100, '2025-12-22 07:12:40'),
(35, 72, 100, '2025-12-22 07:12:40'),
(36, 77, 100, '2025-12-22 07:12:40'),
(37, 82, 100, '2025-12-22 07:12:40'),
(38, 87, 100, '2025-12-22 07:12:40'),
(39, 92, 100, '2025-12-22 07:12:40'),
(40, 97, 100, '2025-12-22 07:12:40'),
(41, 3, 100, '2025-12-22 07:12:40'),
(42, 8, 100, '2025-12-22 07:12:40'),
(43, 13, 100, '2025-12-22 07:12:40'),
(44, 18, 100, '2025-12-22 07:12:40'),
(45, 23, 100, '2025-12-22 07:12:40'),
(46, 28, 100, '2025-12-22 07:12:40'),
(47, 33, 100, '2025-12-22 07:12:40'),
(48, 38, 100, '2025-12-22 07:12:40'),
(49, 43, 100, '2025-12-22 07:12:40'),
(50, 48, 100, '2025-12-22 07:12:40'),
(51, 53, 100, '2025-12-22 07:12:40'),
(52, 58, 100, '2025-12-22 07:12:40'),
(53, 63, 100, '2025-12-22 07:12:40'),
(54, 68, 100, '2025-12-22 07:12:40'),
(55, 73, 100, '2025-12-22 07:12:40'),
(56, 78, 100, '2025-12-22 07:12:40'),
(57, 83, 100, '2025-12-22 07:12:40'),
(58, 88, 100, '2025-12-22 07:12:40'),
(59, 93, 100, '2025-12-22 07:12:40'),
(60, 98, 100, '2025-12-22 07:12:40'),
(61, 4, 100, '2025-12-22 07:12:40'),
(62, 9, 100, '2025-12-22 07:12:40'),
(63, 14, 100, '2025-12-22 07:12:40'),
(64, 19, 100, '2025-12-22 07:12:40'),
(65, 24, 100, '2025-12-22 07:12:40'),
(66, 29, 100, '2025-12-22 07:12:40'),
(67, 34, 100, '2025-12-22 07:12:40'),
(68, 39, 100, '2025-12-22 07:12:40'),
(69, 44, 100, '2025-12-22 07:12:40'),
(70, 49, 100, '2025-12-22 07:12:40'),
(71, 54, 100, '2025-12-22 07:12:40'),
(72, 59, 100, '2025-12-22 07:12:40'),
(73, 64, 100, '2025-12-22 07:12:40'),
(74, 69, 100, '2025-12-22 07:12:40'),
(75, 74, 100, '2025-12-22 07:12:40'),
(76, 79, 100, '2025-12-22 07:12:40'),
(77, 84, 100, '2025-12-22 07:12:40'),
(78, 89, 100, '2025-12-22 07:12:40'),
(79, 94, 100, '2025-12-22 07:12:40'),
(80, 99, 100, '2025-12-22 07:12:40'),
(81, 5, 100, '2025-12-22 07:12:40'),
(82, 10, 100, '2025-12-22 07:12:40'),
(83, 15, 100, '2025-12-22 07:12:40'),
(84, 20, 100, '2025-12-22 07:12:40'),
(85, 25, 100, '2025-12-22 07:12:40'),
(86, 30, 100, '2025-12-22 07:12:40'),
(87, 35, 100, '2025-12-22 07:12:40'),
(88, 40, 100, '2025-12-22 07:12:40'),
(89, 45, 100, '2025-12-22 07:12:40'),
(90, 50, 100, '2025-12-22 07:12:40'),
(91, 55, 100, '2025-12-22 07:12:40'),
(92, 60, 100, '2025-12-22 07:12:40'),
(93, 65, 100, '2025-12-22 07:12:40'),
(94, 70, 100, '2025-12-22 07:12:40'),
(95, 75, 100, '2025-12-22 07:12:40'),
(96, 80, 100, '2025-12-22 07:12:40'),
(97, 85, 100, '2025-12-22 07:12:40'),
(98, 90, 100, '2025-12-22 07:12:40'),
(99, 95, 100, '2025-12-22 07:12:40'),
(100, 100, 100, '2025-12-22 07:12:40');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`section_id`, `lesson_id`, `title`, `content`, `order_no`) VALUES
(1, 1, 'Section 1', 'Section content', 1),
(2, 6, 'Section 6', 'Section content', 1),
(3, 11, 'Section 11', 'Section content', 1),
(4, 16, 'Section 16', 'Section content', 1),
(5, 21, 'Section 21', 'Section content', 1),
(6, 26, 'Section 26', 'Section content', 1),
(7, 31, 'Section 31', 'Section content', 1),
(8, 36, 'Section 36', 'Section content', 1),
(9, 41, 'Section 41', 'Section content', 1),
(10, 46, 'Section 46', 'Section content', 1),
(11, 51, 'Section 51', 'Section content', 1),
(12, 56, 'Section 56', 'Section content', 1),
(13, 61, 'Section 61', 'Section content', 1),
(14, 66, 'Section 66', 'Section content', 1),
(15, 71, 'Section 71', 'Section content', 1),
(16, 76, 'Section 76', 'Section content', 1),
(17, 81, 'Section 81', 'Section content', 1),
(18, 86, 'Section 86', 'Section content', 1),
(19, 91, 'Section 91', 'Section content', 1),
(20, 96, 'Section 96', 'Section content', 1),
(21, 2, 'Section 2', 'Section content', 1),
(22, 7, 'Section 7', 'Section content', 1),
(23, 12, 'Section 12', 'Section content', 1),
(24, 17, 'Section 17', 'Section content', 1),
(25, 22, 'Section 22', 'Section content', 1),
(26, 27, 'Section 27', 'Section content', 1),
(27, 32, 'Section 32', 'Section content', 1),
(28, 37, 'Section 37', 'Section content', 1),
(29, 42, 'Section 42', 'Section content', 1),
(30, 47, 'Section 47', 'Section content', 1),
(31, 52, 'Section 52', 'Section content', 1),
(32, 57, 'Section 57', 'Section content', 1),
(33, 62, 'Section 62', 'Section content', 1),
(34, 67, 'Section 67', 'Section content', 1),
(35, 72, 'Section 72', 'Section content', 1),
(36, 77, 'Section 77', 'Section content', 1),
(37, 82, 'Section 82', 'Section content', 1),
(38, 87, 'Section 87', 'Section content', 1),
(39, 92, 'Section 92', 'Section content', 1),
(40, 97, 'Section 97', 'Section content', 1),
(41, 3, 'Section 3', 'Section content', 1),
(42, 8, 'Section 8', 'Section content', 1),
(43, 13, 'Section 13', 'Section content', 1),
(44, 18, 'Section 18', 'Section content', 1),
(45, 23, 'Section 23', 'Section content', 1),
(46, 28, 'Section 28', 'Section content', 1),
(47, 33, 'Section 33', 'Section content', 1),
(48, 38, 'Section 38', 'Section content', 1),
(49, 43, 'Section 43', 'Section content', 1),
(50, 48, 'Section 48', 'Section content', 1),
(51, 53, 'Section 53', 'Section content', 1),
(52, 58, 'Section 58', 'Section content', 1),
(53, 63, 'Section 63', 'Section content', 1),
(54, 68, 'Section 68', 'Section content', 1),
(55, 73, 'Section 73', 'Section content', 1),
(56, 78, 'Section 78', 'Section content', 1),
(57, 83, 'Section 83', 'Section content', 1),
(58, 88, 'Section 88', 'Section content', 1),
(59, 93, 'Section 93', 'Section content', 1),
(60, 98, 'Section 98', 'Section content', 1),
(61, 4, 'Section 4', 'Section content', 1),
(62, 9, 'Section 9', 'Section content', 1),
(63, 14, 'Section 14', 'Section content', 1),
(64, 19, 'Section 19', 'Section content', 1),
(65, 24, 'Section 24', 'Section content', 1),
(66, 29, 'Section 29', 'Section content', 1),
(67, 34, 'Section 34', 'Section content', 1),
(68, 39, 'Section 39', 'Section content', 1),
(69, 44, 'Section 44', 'Section content', 1),
(70, 49, 'Section 49', 'Section content', 1),
(71, 54, 'Section 54', 'Section content', 1),
(72, 59, 'Section 59', 'Section content', 1),
(73, 64, 'Section 64', 'Section content', 1),
(74, 69, 'Section 69', 'Section content', 1),
(75, 74, 'Section 74', 'Section content', 1),
(76, 79, 'Section 79', 'Section content', 1),
(77, 84, 'Section 84', 'Section content', 1),
(78, 89, 'Section 89', 'Section content', 1),
(79, 94, 'Section 94', 'Section content', 1),
(80, 99, 'Section 99', 'Section content', 1),
(81, 5, 'Section 5', 'Section content', 1),
(82, 10, 'Section 10', 'Section content', 1),
(83, 15, 'Section 15', 'Section content', 1),
(84, 20, 'Section 20', 'Section content', 1),
(85, 25, 'Section 25', 'Section content', 1),
(86, 30, 'Section 30', 'Section content', 1),
(87, 35, 'Section 35', 'Section content', 1),
(88, 40, 'Section 40', 'Section content', 1),
(89, 45, 'Section 45', 'Section content', 1),
(90, 50, 'Section 50', 'Section content', 1),
(91, 55, 'Section 55', 'Section content', 1),
(92, 60, 'Section 60', 'Section content', 1),
(93, 65, 'Section 65', 'Section content', 1),
(94, 70, 'Section 70', 'Section content', 1),
(95, 75, 'Section 75', 'Section content', 1),
(96, 80, 'Section 80', 'Section content', 1),
(97, 85, 'Section 85', 'Section content', 1),
(98, 90, 'Section 90', 'Section content', 1),
(99, 95, 'Section 95', 'Section content', 1),
(100, 100, 'Section 100', 'Section content', 1);

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE `submission` (
  `submission_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `source_code` longtext NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','passed','failed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submission`
--

INSERT INTO `submission` (`submission_id`, `exercise_id`, `user_id`, `language_id`, `source_code`, `submitted_at`, `status`) VALUES
(1, 1, 21, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(2, 21, 41, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(3, 41, 61, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(4, 61, 81, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(5, 81, 21, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(6, 2, 22, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(7, 22, 42, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(8, 42, 62, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(9, 62, 82, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(10, 82, 22, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(11, 3, 23, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(12, 23, 43, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(13, 43, 63, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(14, 63, 83, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(15, 83, 23, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(16, 4, 24, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(17, 24, 44, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(18, 44, 64, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(19, 64, 84, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(20, 84, 24, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(21, 5, 25, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(22, 25, 45, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(23, 45, 65, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(24, 65, 85, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(25, 85, 25, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(26, 6, 26, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(27, 26, 46, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(28, 46, 66, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(29, 66, 86, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(30, 86, 26, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(31, 7, 27, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(32, 27, 47, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(33, 47, 67, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(34, 67, 87, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(35, 87, 27, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(36, 8, 28, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(37, 28, 48, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(38, 48, 68, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(39, 68, 88, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(40, 88, 28, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(41, 9, 29, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(42, 29, 49, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(43, 49, 69, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(44, 69, 89, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(45, 89, 29, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(46, 10, 30, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(47, 30, 50, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(48, 50, 70, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(49, 70, 90, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(50, 90, 30, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(51, 11, 31, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(52, 31, 51, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(53, 51, 71, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(54, 71, 91, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(55, 91, 31, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(56, 12, 32, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(57, 32, 52, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(58, 52, 72, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(59, 72, 92, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(60, 92, 32, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(61, 13, 33, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(62, 33, 53, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(63, 53, 73, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(64, 73, 93, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(65, 93, 33, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(66, 14, 34, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(67, 34, 54, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(68, 54, 74, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(69, 74, 94, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(70, 94, 34, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(71, 15, 35, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(72, 35, 55, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(73, 55, 75, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(74, 75, 95, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(75, 95, 35, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(76, 16, 36, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(77, 36, 56, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(78, 56, 76, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(79, 76, 96, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(80, 96, 36, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(81, 17, 37, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(82, 37, 57, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(83, 57, 77, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(84, 77, 97, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(85, 97, 37, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(86, 18, 38, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(87, 38, 58, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(88, 58, 78, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(89, 78, 98, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(90, 98, 38, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(91, 19, 39, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(92, 39, 59, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(93, 59, 79, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(94, 79, 99, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(95, 99, 39, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(96, 20, 40, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(97, 40, 60, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(98, 60, 80, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(99, 80, 100, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed'),
(100, 100, 40, 1, 'print(1+2)', '2025-12-22 07:12:40', 'passed');

-- --------------------------------------------------------

--
-- Table structure for table `test_case`
--

CREATE TABLE `test_case` (
  `test_case_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `input_data` text NOT NULL,
  `expected_output` text NOT NULL,
  `score_weight` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_case`
--

INSERT INTO `test_case` (`test_case_id`, `exercise_id`, `input_data`, `expected_output`, `score_weight`) VALUES
(1, 1, '1 2', '3', 1),
(2, 21, '1 2', '3', 1),
(3, 41, '1 2', '3', 1),
(4, 61, '1 2', '3', 1),
(5, 81, '1 2', '3', 1),
(6, 2, '1 2', '3', 1),
(7, 22, '1 2', '3', 1),
(8, 42, '1 2', '3', 1),
(9, 62, '1 2', '3', 1),
(10, 82, '1 2', '3', 1),
(11, 3, '1 2', '3', 1),
(12, 23, '1 2', '3', 1),
(13, 43, '1 2', '3', 1),
(14, 63, '1 2', '3', 1),
(15, 83, '1 2', '3', 1),
(16, 4, '1 2', '3', 1),
(17, 24, '1 2', '3', 1),
(18, 44, '1 2', '3', 1),
(19, 64, '1 2', '3', 1),
(20, 84, '1 2', '3', 1),
(21, 5, '1 2', '3', 1),
(22, 25, '1 2', '3', 1),
(23, 45, '1 2', '3', 1),
(24, 65, '1 2', '3', 1),
(25, 85, '1 2', '3', 1),
(26, 6, '1 2', '3', 1),
(27, 26, '1 2', '3', 1),
(28, 46, '1 2', '3', 1),
(29, 66, '1 2', '3', 1),
(30, 86, '1 2', '3', 1),
(31, 7, '1 2', '3', 1),
(32, 27, '1 2', '3', 1),
(33, 47, '1 2', '3', 1),
(34, 67, '1 2', '3', 1),
(35, 87, '1 2', '3', 1),
(36, 8, '1 2', '3', 1),
(37, 28, '1 2', '3', 1),
(38, 48, '1 2', '3', 1),
(39, 68, '1 2', '3', 1),
(40, 88, '1 2', '3', 1),
(41, 9, '1 2', '3', 1),
(42, 29, '1 2', '3', 1),
(43, 49, '1 2', '3', 1),
(44, 69, '1 2', '3', 1),
(45, 89, '1 2', '3', 1),
(46, 10, '1 2', '3', 1),
(47, 30, '1 2', '3', 1),
(48, 50, '1 2', '3', 1),
(49, 70, '1 2', '3', 1),
(50, 90, '1 2', '3', 1),
(51, 11, '1 2', '3', 1),
(52, 31, '1 2', '3', 1),
(53, 51, '1 2', '3', 1),
(54, 71, '1 2', '3', 1),
(55, 91, '1 2', '3', 1),
(56, 12, '1 2', '3', 1),
(57, 32, '1 2', '3', 1),
(58, 52, '1 2', '3', 1),
(59, 72, '1 2', '3', 1),
(60, 92, '1 2', '3', 1),
(61, 13, '1 2', '3', 1),
(62, 33, '1 2', '3', 1),
(63, 53, '1 2', '3', 1),
(64, 73, '1 2', '3', 1),
(65, 93, '1 2', '3', 1),
(66, 14, '1 2', '3', 1),
(67, 34, '1 2', '3', 1),
(68, 54, '1 2', '3', 1),
(69, 74, '1 2', '3', 1),
(70, 94, '1 2', '3', 1),
(71, 15, '1 2', '3', 1),
(72, 35, '1 2', '3', 1),
(73, 55, '1 2', '3', 1),
(74, 75, '1 2', '3', 1),
(75, 95, '1 2', '3', 1),
(76, 16, '1 2', '3', 1),
(77, 36, '1 2', '3', 1),
(78, 56, '1 2', '3', 1),
(79, 76, '1 2', '3', 1),
(80, 96, '1 2', '3', 1),
(81, 17, '1 2', '3', 1),
(82, 37, '1 2', '3', 1),
(83, 57, '1 2', '3', 1),
(84, 77, '1 2', '3', 1),
(85, 97, '1 2', '3', 1),
(86, 18, '1 2', '3', 1),
(87, 38, '1 2', '3', 1),
(88, 58, '1 2', '3', 1),
(89, 78, '1 2', '3', 1),
(90, 98, '1 2', '3', 1),
(91, 19, '1 2', '3', 1),
(92, 39, '1 2', '3', 1),
(93, 59, '1 2', '3', 1),
(94, 79, '1 2', '3', 1),
(95, 99, '1 2', '3', 1),
(96, 20, '1 2', '3', 1),
(97, 40, '1 2', '3', 1),
(98, 60, '1 2', '3', 1),
(99, 80, '1 2', '3', 1),
(100, 100, '1 2', '3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `upload_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `related_class_id` int(11) DEFAULT NULL,
  `related_lesson_id` int(11) DEFAULT NULL,
  `related_exercise_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 'user1', 'user1@example.com', 'hash1', '/avatar/user1.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(2, 'user2', 'user2@example.com', 'hash2', '/avatar/user2.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(3, 'user3', 'user3@example.com', 'hash3', '/avatar/user3.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(4, 'user4', 'user4@example.com', 'hash4', '/avatar/user4.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(5, 'user5', 'user5@example.com', 'hash5', '/avatar/user5.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(6, 'user6', 'user6@example.com', 'hash6', '/avatar/user6.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(7, 'user7', 'user7@example.com', 'hash7', '/avatar/user7.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(8, 'user8', 'user8@example.com', 'hash8', '/avatar/user8.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(9, 'user9', 'user9@example.com', 'hash9', '/avatar/user9.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(10, 'user10', 'user10@example.com', 'hash10', '/avatar/user10.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(11, 'user11', 'user11@example.com', 'hash11', '/avatar/user11.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(12, 'user12', 'user12@example.com', 'hash12', '/avatar/user12.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(13, 'user13', 'user13@example.com', 'hash13', '/avatar/user13.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(14, 'user14', 'user14@example.com', 'hash14', '/avatar/user14.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(15, 'user15', 'user15@example.com', 'hash15', '/avatar/user15.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(16, 'user16', 'user16@example.com', 'hash16', '/avatar/user16.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(17, 'user17', 'user17@example.com', 'hash17', '/avatar/user17.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(18, 'user18', 'user18@example.com', 'hash18', '/avatar/user18.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(19, 'user19', 'user19@example.com', 'hash19', '/avatar/user19.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(20, 'user20', 'user20@example.com', 'hash20', '/avatar/user20.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(21, 'user21', 'user21@example.com', 'hash21', '/avatar/user21.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(22, 'user22', 'user22@example.com', 'hash22', '/avatar/user22.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(23, 'user23', 'user23@example.com', 'hash23', '/avatar/user23.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(24, 'user24', 'user24@example.com', 'hash24', '/avatar/user24.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(25, 'user25', 'user25@example.com', 'hash25', '/avatar/user25.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(26, 'user26', 'user26@example.com', 'hash26', '/avatar/user26.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(27, 'user27', 'user27@example.com', 'hash27', '/avatar/user27.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(28, 'user28', 'user28@example.com', 'hash28', '/avatar/user28.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(29, 'user29', 'user29@example.com', 'hash29', '/avatar/user29.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(30, 'user30', 'user30@example.com', 'hash30', '/avatar/user30.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(31, 'user31', 'user31@example.com', 'hash31', '/avatar/user31.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(32, 'user32', 'user32@example.com', 'hash32', '/avatar/user32.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(33, 'user33', 'user33@example.com', 'hash33', '/avatar/user33.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(34, 'user34', 'user34@example.com', 'hash34', '/avatar/user34.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(35, 'user35', 'user35@example.com', 'hash35', '/avatar/user35.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(36, 'user36', 'user36@example.com', 'hash36', '/avatar/user36.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(37, 'user37', 'user37@example.com', 'hash37', '/avatar/user37.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(38, 'user38', 'user38@example.com', 'hash38', '/avatar/user38.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(39, 'user39', 'user39@example.com', 'hash39', '/avatar/user39.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(40, 'user40', 'user40@example.com', 'hash40', '/avatar/user40.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(41, 'user41', 'user41@example.com', 'hash41', '/avatar/user41.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(42, 'user42', 'user42@example.com', 'hash42', '/avatar/user42.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(43, 'user43', 'user43@example.com', 'hash43', '/avatar/user43.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(44, 'user44', 'user44@example.com', 'hash44', '/avatar/user44.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(45, 'user45', 'user45@example.com', 'hash45', '/avatar/user45.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(46, 'user46', 'user46@example.com', 'hash46', '/avatar/user46.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(47, 'user47', 'user47@example.com', 'hash47', '/avatar/user47.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(48, 'user48', 'user48@example.com', 'hash48', '/avatar/user48.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(49, 'user49', 'user49@example.com', 'hash49', '/avatar/user49.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(50, 'user50', 'user50@example.com', 'hash50', '/avatar/user50.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(51, 'user51', 'user51@example.com', 'hash51', '/avatar/user51.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(52, 'user52', 'user52@example.com', 'hash52', '/avatar/user52.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(53, 'user53', 'user53@example.com', 'hash53', '/avatar/user53.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(54, 'user54', 'user54@example.com', 'hash54', '/avatar/user54.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(55, 'user55', 'user55@example.com', 'hash55', '/avatar/user55.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(56, 'user56', 'user56@example.com', 'hash56', '/avatar/user56.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(57, 'user57', 'user57@example.com', 'hash57', '/avatar/user57.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(58, 'user58', 'user58@example.com', 'hash58', '/avatar/user58.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(59, 'user59', 'user59@example.com', 'hash59', '/avatar/user59.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(60, 'user60', 'user60@example.com', 'hash60', '/avatar/user60.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(61, 'user61', 'user61@example.com', 'hash61', '/avatar/user61.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(62, 'user62', 'user62@example.com', 'hash62', '/avatar/user62.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(63, 'user63', 'user63@example.com', 'hash63', '/avatar/user63.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(64, 'user64', 'user64@example.com', 'hash64', '/avatar/user64.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(65, 'user65', 'user65@example.com', 'hash65', '/avatar/user65.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(66, 'user66', 'user66@example.com', 'hash66', '/avatar/user66.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(67, 'user67', 'user67@example.com', 'hash67', '/avatar/user67.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(68, 'user68', 'user68@example.com', 'hash68', '/avatar/user68.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(69, 'user69', 'user69@example.com', 'hash69', '/avatar/user69.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(70, 'user70', 'user70@example.com', 'hash70', '/avatar/user70.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(71, 'user71', 'user71@example.com', 'hash71', '/avatar/user71.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(72, 'user72', 'user72@example.com', 'hash72', '/avatar/user72.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(73, 'user73', 'user73@example.com', 'hash73', '/avatar/user73.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(74, 'user74', 'user74@example.com', 'hash74', '/avatar/user74.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(75, 'user75', 'user75@example.com', 'hash75', '/avatar/user75.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(76, 'user76', 'user76@example.com', 'hash76', '/avatar/user76.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(77, 'user77', 'user77@example.com', 'hash77', '/avatar/user77.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(78, 'user78', 'user78@example.com', 'hash78', '/avatar/user78.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(79, 'user79', 'user79@example.com', 'hash79', '/avatar/user79.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(80, 'user80', 'user80@example.com', 'hash80', '/avatar/user80.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(81, 'user81', 'user81@example.com', 'hash81', '/avatar/user81.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(82, 'user82', 'user82@example.com', 'hash82', '/avatar/user82.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(83, 'user83', 'user83@example.com', 'hash83', '/avatar/user83.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(84, 'user84', 'user84@example.com', 'hash84', '/avatar/user84.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(85, 'user85', 'user85@example.com', 'hash85', '/avatar/user85.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(86, 'user86', 'user86@example.com', 'hash86', '/avatar/user86.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(87, 'user87', 'user87@example.com', 'hash87', '/avatar/user87.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(88, 'user88', 'user88@example.com', 'hash88', '/avatar/user88.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(89, 'user89', 'user89@example.com', 'hash89', '/avatar/user89.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(90, 'user90', 'user90@example.com', 'hash90', '/avatar/user90.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(91, 'user91', 'user91@example.com', 'hash91', '/avatar/user91.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(92, 'user92', 'user92@example.com', 'hash92', '/avatar/user92.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(93, 'user93', 'user93@example.com', 'hash93', '/avatar/user93.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(94, 'user94', 'user94@example.com', 'hash94', '/avatar/user94.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(95, 'user95', 'user95@example.com', 'hash95', '/avatar/user95.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(96, 'user96', 'user96@example.com', 'hash96', '/avatar/user96.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(97, 'user97', 'user97@example.com', 'hash97', '/avatar/user97.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(98, 'user98', 'user98@example.com', 'hash98', '/avatar/user98.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(99, 'user99', 'user99@example.com', 'hash99', '/avatar/user99.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(100, 'user100', 'user100@example.com', 'hash100', '/avatar/user100.png', '2025-12-22 07:12:40', '2025-12-22 07:12:40'),
(128, 'wannee sriwanna', 'wannee.fahsai@gmail.com', '$2b$10$2HOLqNpGASPTskaS7U5vmeTTaKgoUzqimoQYvu0mjYwn6I5SRJ.Sy', NULL, '2025-12-24 14:41:01', '2025-12-24 14:41:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(79, 3),
(80, 3),
(81, 3),
(82, 3),
(83, 3),
(84, 3),
(85, 3),
(86, 3),
(87, 3),
(88, 3),
(89, 3),
(90, 3),
(91, 3),
(92, 3),
(93, 3),
(94, 3),
(95, 3),
(96, 3),
(97, 3),
(98, 3),
(99, 3),
(100, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `class_role`
--
ALTER TABLE `class_role`
  ADD PRIMARY KEY (`class_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `class_user`
--
ALTER TABLE `class_user`
  ADD PRIMARY KEY (`class_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`exercise_id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Indexes for table `exercise_language`
--
ALTER TABLE `exercise_language`
  ADD PRIMARY KEY (`exercise_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`),
  ADD UNIQUE KEY `language_name` (`language_name`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `idx_logs_user_id` (`user_id`),
  ADD KEY `idx_logs_action` (`action`),
  ADD KEY `idx_logs_target` (`target_type`,`target_id`),
  ADD KEY `idx_logs_module` (`module`),
  ADD KEY `idx_logs_created_at` (`created_at`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`score_id`),
  ADD UNIQUE KEY `submission_id` (`submission_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Indexes for table `submission`
--
ALTER TABLE `submission`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `exercise_id` (`exercise_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `test_case`
--
ALTER TABLE `test_case`
  ADD PRIMARY KEY (`test_case_id`),
  ADD KEY `exercise_id` (`exercise_id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`upload_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `related_class_id` (`related_class_id`),
  ADD KEY `related_lesson_id` (`related_lesson_id`),
  ADD KEY `related_exercise_id` (`related_exercise_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `exercise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `submission`
--
ALTER TABLE `submission`
  MODIFY `submission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `test_case`
--
ALTER TABLE `test_case`
  MODIFY `test_case_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `class_role`
--
ALTER TABLE `class_role`
  ADD CONSTRAINT `class_role_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  ADD CONSTRAINT `class_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

--
-- Constraints for table `class_user`
--
ALTER TABLE `class_user`
  ADD CONSTRAINT `class_user_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  ADD CONSTRAINT `class_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `exercises_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`lesson_id`) ON DELETE CASCADE;

--
-- Constraints for table `exercise_language`
--
ALTER TABLE `exercise_language`
  ADD CONSTRAINT `exercise_language_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`exercise_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exercise_language_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `fk_logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`submission_id`) REFERENCES `submission` (`submission_id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`lesson_id`) ON DELETE CASCADE;

--
-- Constraints for table `submission`
--
ALTER TABLE `submission`
  ADD CONSTRAINT `submission_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`exercise_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submission_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submission_ibfk_3` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`);

--
-- Constraints for table `test_case`
--
ALTER TABLE `test_case`
  ADD CONSTRAINT `test_case_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`exercise_id`) ON DELETE CASCADE;

--
-- Constraints for table `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `uploads_ibfk_2` FOREIGN KEY (`related_class_id`) REFERENCES `class` (`class_id`),
  ADD CONSTRAINT `uploads_ibfk_3` FOREIGN KEY (`related_lesson_id`) REFERENCES `lessons` (`lesson_id`),
  ADD CONSTRAINT `uploads_ibfk_4` FOREIGN KEY (`related_exercise_id`) REFERENCES `exercises` (`exercise_id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
