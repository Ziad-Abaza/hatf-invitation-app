-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 28, 2025 at 02:32 PM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u147754879_invitation123`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjust_installs`
--

CREATE TABLE `adjust_installs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `app_name` varchar(255) NOT NULL,
  `date_range` varchar(255) NOT NULL,
  `installs` int(11) NOT NULL DEFAULT 0,
  `fetched_at` timestamp NULL DEFAULT NULL,
  `tracker_token` varchar(255) DEFAULT NULL,
  `tracker_name` varchar(255) DEFAULT NULL,
  `click_time` varchar(255) DEFAULT NULL,
  `install_time` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adjust_installs`
--

INSERT INTO `adjust_installs` (`id`, `user_id`, `app_name`, `date_range`, `installs`, `fetched_at`, `tracker_token`, `tracker_name`, `click_time`, `install_time`, `created_at`, `updated_at`) VALUES
(1, NULL, 'دعوة QR', '2024-08-18_to_2025-06-08', 72, '2025-06-08 22:47:03', '1lxo9qw3', NULL, NULL, NULL, '2025-06-08 22:47:03', '2025-06-08 22:47:03'),
(2, NULL, 'دعوة QR', '2024-08-18_to_2025-06-08', 28, '2025-06-08 22:47:03', '1okvnvkp', NULL, NULL, NULL, '2025-06-08 22:47:03', '2025-06-08 22:47:03'),
(3, NULL, 'دعوة QR', '2024-08-18_to_2025-06-08', 1, '2025-06-08 22:47:03', '1o82frqr', NULL, NULL, NULL, '2025-06-08 22:47:03', '2025-06-08 22:47:03'),
(4, NULL, 'دعوة QR', '2024-08-18_to_2025-06-09', 72, '2025-06-09 00:36:55', '1lxo9qw3', NULL, NULL, NULL, '2025-06-09 00:23:36', '2025-06-09 00:36:55'),
(5, NULL, 'دعوة QR', '2024-08-18_to_2025-06-09', 28, '2025-06-09 00:36:55', '1okvnvkp', NULL, NULL, NULL, '2025-06-09 00:23:36', '2025-06-09 00:36:55'),
(6, NULL, 'دعوة QR', '2024-08-18_to_2025-06-09', 1, '2025-06-09 00:36:55', '1o82frqr', NULL, NULL, NULL, '2025-06-09 00:23:36', '2025-06-09 00:36:55');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `address`, `email_verified_at`, `password`, `status`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ahmed', 'ahmedmaher0110@gmail.com', '01208982815', NULL, NULL, '$2y$12$RtWa1iXMZfn67LxwH71k/.qbi6vky7b4kwf3LuWcBYxp0.gMrkXwu', 1, NULL, 'RerxRXZcJTfLXt6b3RLpcjigDUe1CzAa5y4u1p8XW55asGsym9FP082sQjFq', '2024-08-19 21:05:49', '2024-08-19 21:05:49'),
(2, 'islam', 'islamm1995@gmail.com', '01272570173', 'cairo', NULL, '$2y$12$RtWa1iXMZfn67LxwH71k/.qbi6vky7b4kwf3LuWcBYxp0.gMrkXwu', 1, '2024-10-24_671a6c1c857ba.jpg', NULL, '2024-10-24 18:47:40', '2024-10-24 18:47:40'),
(3, 'ahmed', 'ahmedmaher01100@gmail.com', '012089828150', NULL, NULL, '$2y$12$RtWa1iXMZfn67LxwH71k/.qbi6vky7b4kwf3LuWcBYxp0.gMrkXwu', 1, NULL, NULL, '2024-08-19 21:05:49', '2024-08-19 21:05:49'),
(4, 'منه', 'workmenna44@gmail.com', '201140016370', NULL, NULL, '$2y$12$2064tEw1WBh7pN5wGTtZVeDuHXc2IyTk0snB5Sg4zOGapSJhVdrHy', 1, NULL, NULL, '2024-11-21 11:31:05', '2024-11-21 11:31:05');

-- --------------------------------------------------------

--
-- Table structure for table `device_invitations`
--

CREATE TABLE `device_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `remaining_invitations` int(11) NOT NULL DEFAULT 3,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `halls`
--

CREATE TABLE `halls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `desc` varchar(10000) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `longitude` varchar(255) NOT NULL DEFAULT '123654789',
  `latitude` varchar(255) NOT NULL DEFAULT '123654789',
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `halls`
--

INSERT INTO `halls` (`id`, `name`, `email`, `phone`, `desc`, `created_at`, `updated_at`, `longitude`, `latitude`, `url`) VALUES
(1, 'هتف', 'info@hatf.sa', '0530333218', 'تخصصنا في صناعة الإعلام الجديد والذي يُعتبر إحدى القوى المؤثرة في العالم وسُلطة رابعة في المُجتمع لا يُستهان بتأثيرها على تحريك الجماهير.ومن هنا تبلورت رؤيتنا بأن نصنع لعميلنا منتج إعلامي رصين قادر على التأثير في جمهوره و فئته المستهدفة و محققًا للأهداف التي وُضع لأجلها.', '2024-10-01 23:32:13', '2024-11-20 14:16:35', '123654789', '123654789', 'Https://hatf.sa');

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `number_of_users` int(11) NOT NULL,
  `prise` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `max_date` enum('day','month','year','unlimited') DEFAULT 'unlimited',
  `type` enum('opening','standard','limited') NOT NULL DEFAULT 'standard'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invitations`
--

INSERT INTO `invitations` (`id`, `name`, `number_of_users`, `prise`, `created_at`, `updated_at`, `max_date`, `type`) VALUES
(1, '{        \"name_ar\": \"دعوة خاصة\",        \"name_en\": \"private invitation\"    }', 1, 6.00, '2024-08-24 18:19:12', '2025-01-17 09:52:46', 'unlimited', 'standard'),
(2, '{    \"name_ar\": \"دعوة متوسطة\",    \"name_en\": \"Medium invitation\"}', 50, 5.00, '2024-08-24 18:19:59', '2025-01-17 09:51:51', 'unlimited', 'standard'),
(3, '{    \"name_ar\": \"دعوة عامة\",    \"name_en\": \"public invitation\"}', 100, 3.00, '2024-08-24 18:20:44', '2025-01-17 09:51:26', 'unlimited', 'standard'),
(5, '{    \"name_ar\": \"دعوة شهرية\",    \"name_en\": \"monthly invitation\"}', 1, 1.00, '2024-10-28 22:21:38', '2024-11-29 00:02:48', 'month', 'limited'),
(6, '{    \"name_ar\": \"دعوة سنوية\",    \"name_en\": \"anual invitation\"}', 1, 1.00, '2024-10-28 22:22:49', '2024-11-29 00:02:55', 'year', 'limited'),
(7, '{    \"name_ar\": \"دعوة يومية\",    \"name_en\": \"daily invitation\"}', 1, 1.00, '2024-10-28 22:23:13', '2024-11-29 00:03:41', 'day', 'limited'),
(8, '{\"name_ar\": \"دعوة خاصة\", \"name_en\": \"Premium Opening Invitation\"}', 1, 6.00, '2025-05-25 16:40:09', '2025-05-25 16:40:09', 'unlimited', 'opening'),
(9, '{\"name_ar\": \"دعوة متوسطة\", \"name_en\": \"Medium Opening Invitation\"}', 50, 5.00, '2025-05-25 16:40:09', '2025-05-25 16:40:09', 'unlimited', 'opening'),
(10, '{\"name_ar\": \"دعوة عامة\", \"name_en\": \"General Opening Invitation\"}', 100, 3.00, '2025-05-25 16:40:09', '2025-05-25 16:40:09', 'unlimited', 'opening');

-- --------------------------------------------------------

--
-- Table structure for table `invited_users`
--

CREATE TABLE `invited_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `qr` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `user_invitations_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `note` text DEFAULT NULL,
  `send_status` enum('pending','sent','failed','accepted','rejected') NOT NULL DEFAULT 'pending',
  `error_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invited_users`
--

INSERT INTO `invited_users` (`id`, `name`, `phone`, `code`, `qr`, `status`, `user_invitations_id`, `created_at`, `updated_at`, `note`, `send_status`, `error_message`) VALUES
(62, 'Ali Hashim', '966562827289', '1736611680919700', '2025-01-11_678297633f810.png', 0, 139, '2025-04-04 04:31:52', '2025-04-04 04:31:52', NULL, 'sent', NULL),
(64, '.نبع الحنان♥️♥️♥️', '966545924444', '1737841110188694', '2025-01-26_679559d90e8ef.png', 0, 148, '2025-04-04 04:31:52', '2025-04-04 04:31:52', NULL, 'sent', NULL),
(427, 'عبدالملك', '966557801901', '1746973697856415', '1746973700.png', 0, 375, '2025-05-11 17:28:20', '2025-05-11 17:28:23', NULL, 'sent', NULL),
(428, 'عبدالملك', '966557801901', '1746973699081814', '1746973700.png', 0, 375, '2025-05-11 17:28:20', '2025-05-11 17:28:25', NULL, 'sent', NULL),
(472, 'ابتسام عبدالوهاب السويعي', '966559333927', '1748084588635567', '1748084590.png', 1, 408, '2025-05-24 14:03:10', '2025-05-24 14:04:00', NULL, 'sent', NULL),
(603, 'اسم المدعو هنا', '966535763359', '1749604801969353', '1749604805.png', 0, 532, '2025-06-11 04:20:05', '2025-06-11 04:20:08', NULL, 'sent', NULL),
(604, 'معاذ', '966531333006', '1749604882393545', '1749604884.png', 0, 533, '2025-06-11 04:21:25', '2025-06-11 04:21:27', NULL, 'sent', NULL),
(605, 'اسم المدعو هنا', '966535763359', '1749605488062576', '1749605490.png', 0, 534, '2025-06-11 04:31:30', '2025-06-11 04:31:32', NULL, 'sent', NULL),
(606, 'معاذ المشالى', '966531333006', '1749612656787950', '1749612660.png', 0, 535, '2025-06-11 06:31:00', '2025-06-11 06:31:03', NULL, 'sent', NULL),
(607, 'معاذ', '966531333006', '1749641783510380', '1749641785.png', 0, 537, '2025-06-11 14:36:25', '2025-06-11 14:36:26', NULL, 'sent', NULL),
(640, 'Hema', '966535763359', '1749851290501086', '1749851294.png', 0, 576, '2025-06-14 00:48:14', '2025-06-14 00:48:16', NULL, 'sent', NULL),
(641, 'اسم المدعو هنا', '966535763359', '1749851664028278', '1749851667.png', 0, 577, '2025-06-14 00:54:27', '2025-06-14 00:54:29', NULL, 'sent', NULL),
(642, 'اسم المدعو هنا', '966535763359', '1749851791411438', '1749851794.png', 0, 578, '2025-06-14 00:56:34', '2025-06-14 00:56:36', NULL, 'sent', NULL),
(682, 'زياد حسن محمد', '201006403927', '1750027085781353', '1750027086.png', 0, 623, '2025-06-16 01:38:06', '2025-06-16 01:38:10', NULL, 'sent', NULL),
(683, 'زياد حسن محمد', '201006403927', '1750027197195725', '1750027198.png', 0, 624, '2025-06-16 01:39:58', '2025-06-16 01:40:02', NULL, 'sent', NULL),
(684, 'زياد حسن محمد', '201006403927', '1750027276963974', '1750027278.png', 0, 625, '2025-06-16 01:41:18', '2025-06-16 01:41:21', NULL, 'sent', NULL),
(685, 'زياد حسن محمد', '201006403927', '1750027442976420', '1750027444.png', 0, 626, '2025-06-16 01:44:04', '2025-06-16 01:44:07', NULL, 'sent', NULL),
(686, 'زياد حسن محمد', '201006403927', '1750027569740005', '1750027571.png', 0, 627, '2025-06-16 01:46:11', '2025-06-16 01:46:14', NULL, 'sent', NULL),
(687, 'زياد حسن محمد', '201006403927', '1750027656975859', '1750027658.png', 0, 628, '2025-06-16 01:47:38', '2025-06-16 01:47:43', NULL, 'sent', NULL),
(688, 'زياد حسن محمد', '201006403927', '1750027762551003', '1750027763.png', 0, 629, '2025-06-16 01:49:23', '2025-06-16 01:49:26', NULL, 'sent', NULL),
(689, 'ziad Hassan please', '201006403927', '1750027868334130', '1750027869.png', 0, 630, '2025-06-16 01:51:09', '2025-06-16 01:51:12', NULL, 'sent', NULL),
(690, 'زياد حسن محمد', '201006403927', '1750027937852352', '1750027939.png', 0, 631, '2025-06-16 01:52:19', '2025-06-16 01:52:22', NULL, 'sent', NULL),
(691, 'زياد حسن محمد', '201006403927', '1750028082509193', '1750028083.png', 0, 632, '2025-06-16 01:54:44', '2025-06-16 01:54:47', NULL, 'sent', NULL),
(692, 'زياد حسن محمد', '201006403927', '1750028166078143', '1750028167.png', 0, 633, '2025-06-16 01:56:07', '2025-06-16 01:56:09', NULL, 'sent', NULL),
(693, 'زياد حسن محمد', '201006403927', '1750028307805934', '1750028309.png', 0, 634, '2025-06-16 01:58:29', '2025-06-16 01:58:31', NULL, 'sent', NULL),
(694, 'زياد حسن محمد', '201006403927', '1750028665238207', '1750028666.png', 0, 637, '2025-06-16 02:04:26', '2025-06-16 02:04:30', NULL, 'sent', NULL),
(695, 'زياد حسن محمد', '201006403927', '1750028718512810', '1750028721.png', 0, 639, '2025-06-16 02:05:21', '2025-06-16 02:05:25', NULL, 'sent', NULL),
(696, 'زياد حسن محمد', '201006403927', '1750028821857495', '1750028824.png', 0, 640, '2025-06-16 02:07:05', '2025-06-16 02:07:08', NULL, 'sent', NULL),
(697, 'زياد حسن محمد', '201006403927', '1750028906807662', '1750028908.png', 0, 641, '2025-06-16 02:08:28', '2025-06-16 02:08:30', NULL, 'sent', NULL),
(698, 'زياد حسن محمد', '201006403927', '1750028985018655', '1750028986.png', 0, 642, '2025-06-16 02:09:46', '2025-06-16 02:09:50', NULL, 'sent', NULL),
(699, 'زياد حسن محمد', '201006403927', '1750029047549541', '1750029049.png', 0, 643, '2025-06-16 02:10:49', '2025-06-16 02:10:51', NULL, 'sent', NULL),
(700, 'زياد حسن محمد', '201006403927', '1750029106839507', '1750029109.png', 0, 644, '2025-06-16 02:11:49', '2025-06-16 02:11:52', NULL, 'sent', NULL),
(703, 'زياد حسن محمد', '201006403927', '1750029344223957', '1750029345.png', 0, 647, '2025-06-16 02:15:46', '2025-06-16 02:15:49', NULL, 'sent', NULL),
(706, 'زياد حسن محمد', '201006403927', '1750029844950622', '1750029846.png', 0, 650, '2025-06-16 02:24:06', '2025-06-16 02:24:08', NULL, 'sent', NULL),
(707, 'زياد حسن محمد', '201006403927', '1750029999575844', '1750030000.png', 0, 651, '2025-06-16 02:26:41', '2025-06-16 02:26:42', NULL, 'sent', NULL),
(708, 'زياد حسن محمد', '201006403927', '1750031079778932', '1750031082.png', 0, 652, '2025-06-16 02:44:42', '2025-06-16 02:44:44', NULL, 'sent', NULL),
(709, 'زياد حسن محمد', '201006403927', '1750031145271781', '1750031146.png', 0, 653, '2025-06-16 02:45:46', '2025-06-16 02:45:48', NULL, 'sent', NULL),
(710, 'زياد حسن محمد', '201006403927', '1750031443767153', '1750031445.png', 0, 654, '2025-06-16 02:50:45', '2025-06-16 02:50:47', NULL, 'sent', NULL),
(711, 'زياد حسن محمد', '201006403927', '1750031597247776', '1750031598.png', 0, 655, '2025-06-16 02:53:18', '2025-06-16 02:53:21', NULL, 'sent', NULL),
(712, 'ziad Hassan', '201006403927', '1750031958801350', '1750031961.png', 0, 656, '2025-06-16 02:59:21', '2025-06-16 02:59:25', NULL, 'sent', NULL),
(713, 'زياد حسن', '201006403927', '1750031997409603', '1750031999.png', 0, 657, '2025-06-16 02:59:59', '2025-06-16 03:00:02', NULL, 'sent', NULL),
(714, 'ziad Hassan', '201006403927', '1750032112785022', '1750032114.png', 0, 658, '2025-06-16 03:01:54', '2025-06-16 03:01:57', NULL, 'sent', NULL),
(715, 'زياد حسن', '201006403927', '1750032163684098', '1750032165.png', 0, 659, '2025-06-16 03:02:45', '2025-06-16 03:02:47', NULL, 'sent', NULL),
(716, 'زياد حسن محمد', '201006403927', '1750032327767030', '1750032329.png', 0, 660, '2025-06-16 03:05:29', '2025-06-16 03:05:33', NULL, 'sent', NULL),
(717, 'زياد حسن محمد', '201006403927', '1750032414412145', '1750032416.png', 0, 661, '2025-06-16 03:06:57', '2025-06-16 03:06:58', NULL, 'sent', NULL),
(718, 'اسم المدعو هنا', '966535763359', '1750035383453091', '1750035386.png', 0, 662, '2025-06-16 03:56:26', '2025-06-16 03:56:30', NULL, 'sent', NULL),
(719, 'زياد حسن محمد', '201006403927', '1750092520738868', '1750092523.png', 0, 663, '2025-06-16 19:48:43', '2025-06-16 19:48:45', NULL, 'sent', NULL),
(720, 'زياد حسن محمد', '201006403927', '1750092646234727', '1750092647.png', 0, 664, '2025-06-16 19:50:47', '2025-06-16 19:50:49', NULL, 'sent', NULL),
(721, 'زياد حسن محمد', '201006403927', '1750092760003367', '1750092762.png', 0, 665, '2025-06-16 19:52:42', '2025-06-16 19:52:44', NULL, 'sent', NULL),
(722, 'زياد حسن محمد', '201006403927', '1750092825009667', '1750092826.png', 0, 666, '2025-06-16 19:53:46', '2025-06-16 19:53:48', NULL, 'sent', NULL),
(723, 'زياد حسن محمد', '201006403927', '1750092866586582', '1750092867.png', 0, 667, '2025-06-16 19:54:28', '2025-06-16 19:54:32', NULL, 'sent', NULL),
(724, 'زياد حسن محمد', '201006403927', '1750092909252137', '1750092910.png', 0, 668, '2025-06-16 19:55:10', '2025-06-16 19:55:12', NULL, 'sent', NULL),
(725, 'زياد حسن محمد', '201006403927', '1750092980015894', '1750092982.png', 0, 669, '2025-06-16 19:56:22', '2025-06-16 19:56:25', NULL, 'sent', NULL),
(726, 'زياد حسن محمد', '201006403927', '1750093040665258', '1750093042.png', 0, 670, '2025-06-16 19:57:22', '2025-06-16 19:57:23', NULL, 'sent', NULL),
(727, 'زياد حسن محمد', '201006403927', '1750093661609290', '1750093662.png', 0, 671, '2025-06-16 20:07:43', '2025-06-16 20:07:46', NULL, 'sent', NULL),
(728, 'زياد حسن محمد', '201006403927', '1750093714435796', '1750093716.png', 0, 672, '2025-06-16 20:08:36', '2025-06-16 20:08:38', NULL, 'sent', NULL),
(729, 'زياد حسن محمد', '201006403927', '1750093769773474', '1750093772.png', 0, 673, '2025-06-16 20:09:32', '2025-06-16 20:09:36', NULL, 'sent', NULL),
(730, 'زياد حسن محمد', '201006403927', '1750094183142250', '1750094184.png', 0, 674, '2025-06-16 20:16:24', '2025-06-16 20:16:28', NULL, 'sent', NULL),
(731, 'زياد حسن محمد', '201006403927', '1750094239511944', '1750094241.png', 0, 675, '2025-06-16 20:17:22', '2025-06-16 20:17:23', NULL, 'sent', NULL),
(732, 'زياد حسن محمد', '201006403927', '1750094285857765', '1750094287.png', 0, 676, '2025-06-16 20:18:07', '2025-06-16 20:18:09', NULL, 'sent', NULL),
(733, 'زياد حسن محمد', '201006403927', '1750094399914566', '1750094401.png', 0, 677, '2025-06-16 20:20:01', '2025-06-16 20:20:05', NULL, 'sent', NULL),
(734, 'زياد حسن محمد', '201006403927', '1750094456973101', '1750094458.png', 0, 678, '2025-06-16 20:20:58', '2025-06-16 20:21:00', NULL, 'sent', NULL),
(735, 'زياد حسن محمد', '201006403927', '1750094496081838', '1750094497.png', 0, 679, '2025-06-16 20:21:37', '2025-06-16 20:21:40', NULL, 'sent', NULL),
(737, 'معاذ صالح المشعلي', '201006403927', '1750318724305237', '1750318727.png', 0, 681, '2025-06-19 10:38:48', '2025-06-19 10:38:51', NULL, 'sent', NULL),
(738, 'معاذ صالح المشعلي', '201006403927', '1750318838505790', '1750318840.png', 0, 682, '2025-06-19 10:40:41', '2025-06-19 10:40:43', NULL, 'sent', NULL),
(739, 'زياد حسن', '201006403927', '1750324273644333', '1750324276.png', 0, 683, '2025-06-19 12:11:16', '2025-06-19 12:11:19', NULL, 'sent', NULL),
(740, 'زياد حسن محمد', '201006403927', '1750324529545488', '1750324531.png', 0, 684, '2025-06-19 12:15:32', '2025-06-19 12:15:35', NULL, 'sent', NULL),
(742, 'زياد حسن', '201006403927', '1750324627171632', '1750324628.png', 0, 687, '2025-06-19 12:17:09', '2025-06-19 12:17:10', NULL, 'sent', NULL),
(743, 'زياد حسن', '201006403927', '1750324628705818', '1750324630.png', 0, 687, '2025-06-19 12:17:10', '2025-06-19 12:17:14', NULL, 'sent', NULL),
(744, 'زياد حسن محمد محمد', '201006403927', '1750324891882804', '1750324893.png', 0, 688, '2025-06-19 12:21:34', '2025-06-19 12:21:36', NULL, 'sent', NULL),
(745, 'زياد حسن محمد', '201006403927', '1750369091469959', '1750369096.png', 0, 689, '2025-06-20 00:38:16', '2025-06-20 00:38:20', NULL, 'sent', NULL),
(746, 'زياد حسن محمد', '201006403927', '1750370132379584', '1750370136.png', 0, 690, '2025-06-20 00:55:36', '2025-06-20 00:55:40', NULL, 'sent', NULL),
(747, 'ziad Hassan Mohammed', '201006403927', '1750371983944192', '1750371987.png', 0, 691, '2025-06-20 01:26:27', '2025-06-20 01:26:30', NULL, 'sent', NULL),
(749, 'ziad Hassan Mohammed', '201006403927', '1750372390338644', '1750372392.png', 0, 693, '2025-06-20 01:33:12', '2025-06-20 01:33:14', NULL, 'sent', NULL),
(750, 'ziad Hassan Mohammed', '201006403927', '1750372520481210', '1750372523.png', 0, 694, '2025-06-20 01:35:23', '2025-06-20 01:35:27', NULL, 'sent', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketer_codes`
--

CREATE TABLE `marketer_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marketer_codes`
--

INSERT INTO `marketer_codes` (`id`, `code`, `phone`, `created_at`, `updated_at`) VALUES
(9, '3537', '966532578017', '2024-11-27 14:03:25', '2024-11-27 14:03:25'),
(16, '7941', '966593785295', '2024-12-22 04:02:36', '2024-12-22 04:02:36'),
(31, '4895', '966504123501', '2025-01-21 23:17:01', '2025-01-21 23:17:01'),
(42, '4231', '966535763359', '2025-03-20 02:20:47', '2025-03-20 02:20:47'),
(45, '1034', '966582062150', '2025-04-22 14:05:00', '2025-04-22 14:05:00'),
(47, '9437', '966500292421', '2025-07-14 18:11:54', '2025-07-14 18:11:54');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(11, 'App\\Models\\UserInvitation', 201, 'ed58ac0f-2e0b-49c9-8c9f-5e9d5f513d07', 'default', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 04:34:59', '2025-04-08 04:34:59'),
(12, 'App\\Models\\UserInvitation', 202, 'a221b03a-0dc4-47d8-beeb-d477a9e871cc', 'default', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 04:36:31', '2025-04-08 04:36:31'),
(13, 'App\\Models\\UserInvitation', 203, '1d36dc56-9f34-4c57-a9d0-6179b6225cc1', 'userInvitation-', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 04:39:50', '2025-04-08 04:39:50'),
(15, 'App\\Models\\UserInvitation', 204, 'e1c7d88b-8095-44e4-b7a0-46a25fa5a208', 'userInvitation-', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 04:41:51', '2025-04-08 04:41:51'),
(17, 'App\\Models\\UserInvitation', 205, 'b1372a2c-9a2b-4a80-be84-d603a109000a', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 04:52:17', '2025-04-08 04:52:17'),
(18, 'App\\Models\\UserInvitation', 205, '3f631300-36d5-44cd-adbb-842b1f8ac40e', 'qr', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 2, '2025-04-08 04:52:17', '2025-04-08 04:52:17'),
(19, 'App\\Models\\UserInvitation', 206, 'a4f3c394-9958-4fc5-a1a5-3813b7f4b48e', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 04:53:41', '2025-04-08 04:53:41'),
(20, 'App\\Models\\UserInvitation', 206, '8b126d8d-2401-473c-ac7b-94a938dc9133', 'qr', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 2, '2025-04-08 04:53:41', '2025-04-08 04:53:41'),
(21, 'App\\Models\\UserInvitation', 207, 'dc64fcf7-cbd4-42a1-91a1-b89ce7462eeb', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 04:55:21', '2025-04-08 04:55:21'),
(22, 'App\\Models\\UserInvitation', 207, 'd8f751b2-029d-4789-9bb1-9cfd41d7a6fe', 'qr', '201090443562', '201090443562.png', 'image/png', 'public', 'public', 24553, '[]', '[]', '[]', '[]', 2, '2025-04-08 04:55:21', '2025-04-08 04:55:21'),
(23, 'App\\Models\\UserInvitation', 208, '7e70f241-c118-4d89-8d30-b40456b1ec1d', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 05:03:03', '2025-04-08 05:03:03'),
(24, 'App\\Models\\UserInvitation', 208, 'cfb9ed56-16ad-423f-96c5-f424b75dc8e1', 'qr', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 2, '2025-04-08 05:03:03', '2025-04-08 05:03:03'),
(26, 'App\\Models\\UserInvitation', 211, '57c67c6c-27a3-457a-b871-63b0b8fe919d', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 05:22:02', '2025-04-08 05:22:02'),
(27, 'App\\Models\\UserInvitation', 211, '36454201-1bae-47d1-92c4-7c89bfc5d2b6', 'qr', '1744079213', '1744079213.jpg', 'image/jpeg', 'public', 'public', 38692, '[]', '[]', '[]', '[]', 2, '2025-04-08 05:26:53', '2025-04-08 05:26:53'),
(28, 'App\\Models\\UserInvitation', 211, '17c9cfdb-d273-47e6-a5da-3f805051dae7', 'qr', '1744079379', '1744079379.jpg', 'image/jpeg', 'public', 'public', 38692, '[]', '[]', '[]', '[]', 3, '2025-04-08 05:29:39', '2025-04-08 05:29:39'),
(29, 'App\\Models\\UserInvitation', 211, 'ade0230b-fcd6-46cc-827d-375fb12e0ff8', 'qr', '1744079708', '1744079708.jpg', 'image/jpeg', 'public', 'public', 38692, '[]', '[]', '[]', '[]', 4, '2025-04-08 05:35:08', '2025-04-08 05:35:08'),
(30, 'App\\Models\\UserInvitation', 211, 'c5aa7bf3-9824-4ef1-aad6-b554892b5c9c', 'qr', '1744079792', '1744079792.jpg', 'image/jpeg', 'public', 'public', 38692, '[]', '[]', '[]', '[]', 5, '2025-04-08 05:36:32', '2025-04-08 05:36:32'),
(31, 'App\\Models\\UserInvitation', 212, '5ab0c428-907b-459c-bba5-eb2fdcad704f', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 05:46:09', '2025-04-08 05:46:09'),
(32, 'App\\Models\\UserInvitation', 212, 'b11b4872-c815-4cb8-b3c3-6a04102dd993', 'qr', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 2, '2025-04-08 05:46:09', '2025-04-08 05:46:09'),
(33, 'App\\Models\\UserInvitation', 213, '13b980f7-a873-4391-bf55-5229ac807b5d', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 05:47:05', '2025-04-08 05:47:05'),
(34, 'App\\Models\\UserInvitation', 213, '0402bfb3-d9b2-4327-9e16-2cf5cc53b878', 'qr', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 2, '2025-04-08 05:47:05', '2025-04-08 05:47:05'),
(35, 'App\\Models\\UserInvitation', 211, 'c3fb4c88-15ab-447f-820b-31c2ec0eb555', 'qr', '1744080454', '1744080454.jpg', 'image/jpeg', 'public', 'public', 38692, '[]', '[]', '[]', '[]', 6, '2025-04-08 05:47:34', '2025-04-08 05:47:34'),
(36, 'App\\Models\\UserInvitation', 211, 'b94c3b7b-9441-4ff7-a9ec-b86ed8e37d67', 'qr', '1744080509', '1744080509.jpg', 'image/jpeg', 'public', 'public', 38692, '[]', '[]', '[]', '[]', 7, '2025-04-08 05:48:29', '2025-04-08 05:48:29'),
(37, 'App\\Models\\UserInvitation', 211, 'f2102e98-f556-4e00-9a53-94a8867cc380', 'qr', '1744080696', '1744080696.jpg', 'image/jpeg', 'public', 'public', 38692, '[]', '[]', '[]', '[]', 8, '2025-04-08 05:51:36', '2025-04-08 05:51:36'),
(38, 'App\\Models\\UserInvitation', 214, 'be3bb952-72a5-463d-a3fe-7b59e0f23d21', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 05:52:06', '2025-04-08 05:52:06'),
(39, 'App\\Models\\UserInvitation', 214, 'ec4b7136-64de-444e-b34e-00064a356936', 'qr', '1744080726', '1744080726.jpg', 'image/jpeg', 'public', 'public', 38818, '[]', '[]', '[]', '[]', 2, '2025-04-08 05:52:06', '2025-04-08 05:52:06'),
(40, 'App\\Models\\UserInvitation', 215, 'a0bc1c60-1ba4-4d8c-8284-4976efe96dab', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 05:53:41', '2025-04-08 05:53:41'),
(41, 'App\\Models\\UserInvitation', 215, 'f707f845-2221-4981-8f0a-1c2439d704e6', 'qr', '1744080821', '1744080821.png', 'image/png', 'public', 'public', 29649, '[]', '[]', '[]', '[]', 2, '2025-04-08 05:53:41', '2025-04-08 05:53:41'),
(59, 'App\\Models\\Hall', 1, '7f1f599e-9e12-4f63-a227-784683080906', 'default', 'اغلفة---تصميم', 'اغلفة---تصميم.jpg', 'image/jpeg', 'public', 'public', 234122, '[]', '[]', '[]', '[]', 1, '2025-04-08 18:17:51', '2025-04-08 18:17:51'),
(61, 'App\\Models\\UserInvitation', 216, '6ed8d0c7-cc48-4c51-a2a3-09480eefb66f', 'qr', '1744125632', '1744125632.png', 'image/png', 'public', 'public', 29569, '[]', '[]', '[]', '[]', 2, '2025-04-08 18:20:32', '2025-04-08 18:20:32'),
(62, 'App\\Models\\UserInvitation', 217, '7b5d03f7-2ee1-4b4f-8af8-af6beadc4a33', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 18:28:56', '2025-04-08 18:28:56'),
(63, 'App\\Models\\UserInvitation', 217, 'a7e27871-cc09-4a43-bcd7-f5214309c071', 'qr', '1744126136', '1744126136.png', 'image/png', 'public', 'public', 28361, '[]', '[]', '[]', '[]', 2, '2025-04-08 18:28:57', '2025-04-08 18:28:57'),
(64, 'App\\Models\\UserInvitation', 217, 'b6b171be-8deb-4283-8a69-036dd1435bf2', 'qr', '1744126138', '1744126138.png', 'image/png', 'public', 'public', 27010, '[]', '[]', '[]', '[]', 3, '2025-04-08 18:28:58', '2025-04-08 18:28:58'),
(65, 'App\\Models\\UserInvitation', 217, '8daa34fb-a14d-4e95-a5bf-0a872cfafcc1', 'qr', '1744126139', '1744126139.png', 'image/png', 'public', 'public', 29569, '[]', '[]', '[]', '[]', 4, '2025-04-08 18:28:59', '2025-04-08 18:28:59'),
(67, 'App\\Models\\UserInvitation', 219, '509b4361-4a84-4f93-980a-cc8101648f4a', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-08 23:08:55', '2025-04-08 23:08:55'),
(68, 'App\\Models\\UserInvitation', 219, '4f25710d-2bc7-4303-8026-38bb009e863b', 'qr', '1744143155', '1744143155.jpg', 'image/jpeg', 'public', 'public', 38692, '[]', '[]', '[]', '[]', 2, '2025-04-08 23:12:35', '2025-04-08 23:12:35'),
(70, 'App\\Models\\UserInvitation', 220, '1e1dfe1e-40d3-4a9a-8793-7d42b79d43d4', 'qr', '1744143310', '1744143310.png', 'image/png', 'public', 'public', 30479, '[]', '[]', '[]', '[]', 2, '2025-04-08 23:15:10', '2025-04-08 23:15:10'),
(71, 'App\\Models\\UserInvitation', 221, '121795d9-acb7-4f1e-acaa-0bb709923c15', 'userInvitation', 'DA180225730 (1)', 'DA180225730-(1).pdf', 'application/pdf', 'public', 'public', 288605, '[]', '[]', '[]', '[]', 1, '2025-04-09 08:05:34', '2025-04-09 08:05:34'),
(72, 'App\\Models\\UserInvitation', 221, '8c19b77e-4a24-4328-92c3-989f0bc1c20e', 'qr', '1744175134', '1744175134.png', 'image/png', 'public', 'public', 35081, '[]', '[]', '[]', '[]', 2, '2025-04-09 08:05:34', '2025-04-09 08:05:34'),
(73, 'App\\Models\\UserInvitation', 222, '9c6c3861-c985-4d2f-8116-0ca4d45f06c1', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-09 14:34:00', '2025-04-09 14:34:00'),
(74, 'App\\Models\\UserInvitation', 222, '4093af16-106f-4531-b2bd-b853f775e1b3', 'qr', '1744198440', '1744198440.png', 'image/png', 'public', 'public', 29565, '[]', '[]', '[]', '[]', 2, '2025-04-09 14:34:00', '2025-04-09 14:34:00'),
(76, 'App\\Models\\UserInvitation', 223, '6c833f51-7d3b-4f03-88f3-37d272612a72', 'qr', '1744210248', '1744210248.png', 'image/png', 'public', 'public', 29558, '[]', '[]', '[]', '[]', 2, '2025-04-09 17:50:48', '2025-04-09 17:50:48'),
(77, 'App\\Models\\UserInvitation', 224, '28122d83-6907-451e-bcaa-c5d0fa3b734b', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-09 17:52:55', '2025-04-09 17:52:55'),
(78, 'App\\Models\\UserInvitation', 224, '7f83db00-cc70-4ab0-83f2-5c2a4b693030', 'qr', '1744210375', '1744210375.jpg', 'image/jpeg', 'public', 'public', 38818, '[]', '[]', '[]', '[]', 2, '2025-04-09 17:52:55', '2025-04-09 17:52:55'),
(79, 'App\\Models\\UserInvitation', 225, '989b29a4-73e3-4b67-ab0f-ef97fe5e8ccc', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-09 17:53:38', '2025-04-09 17:53:38'),
(80, 'App\\Models\\UserInvitation', 225, 'cdf28cf3-8f9d-43f2-99e6-74bc901fb58d', 'qr', '1744210418', '1744210418.jpg', 'image/jpeg', 'public', 'public', 38818, '[]', '[]', '[]', '[]', 2, '2025-04-09 17:53:38', '2025-04-09 17:53:38'),
(81, 'App\\Models\\UserInvitation', 226, '0a3a9aa7-ef30-49ec-b88a-7ec7b46a9799', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-09 17:57:54', '2025-04-09 17:57:54'),
(82, 'App\\Models\\UserInvitation', 226, 'c5a25a06-a314-4aaa-ba25-0a8c475ce18c', 'qr', '1744210674', '1744210674.png', 'image/png', 'public', 'public', 29541, '[]', '[]', '[]', '[]', 2, '2025-04-09 17:57:54', '2025-04-09 17:57:54'),
(83, 'App\\Models\\UserInvitation', 227, '8c0b6454-a878-4f73-b4bc-4b113b4cf8c1', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-09 18:25:35', '2025-04-09 18:25:35'),
(84, 'App\\Models\\UserInvitation', 228, '961d3c46-79df-4f90-8e07-58e85ad04a3b', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 16191, '[]', '[]', '[]', '[]', 1, '2025-04-09 18:26:48', '2025-04-09 18:26:48'),
(85, 'App\\Models\\UserInvitation', 228, '11ee8403-3dab-42f1-82b7-7f7c7c75056b', 'qr', '1744212408', '1744212408.png', 'image/png', 'public', 'public', 29570, '[]', '[]', '[]', '[]', 2, '2025-04-09 18:26:48', '2025-04-09 18:26:48'),
(86, 'App\\Models\\UserInvitation', 229, 'cc6790ba-46a5-4ed4-a1aa-c11b3a3775d9', 'userInvitation', 'ناصر، أشششكرك-1', 'ناصر،-أشششكرك-1.jpg', 'image/jpeg', 'public', 'public', 1489752, '[]', '[]', '[]', '[]', 1, '2025-04-09 19:37:33', '2025-04-09 19:37:33'),
(87, 'App\\Models\\UserInvitation', 229, '203adc9c-b4e6-49e9-9da3-e22c9f584ee8', 'qr', '1744216653', '1744216653.png', 'image/png', 'public', 'public', 35139, '[]', '[]', '[]', '[]', 2, '2025-04-09 19:37:33', '2025-04-09 19:37:33'),
(88, 'App\\Models\\UserInvitation', 230, '9d9d0ebb-11f2-437d-ad2f-c2774a9b9d83', 'userInvitation', 'ناصر، أشششكرك-1', 'ناصر،-أشششكرك-1.jpg', 'image/jpeg', 'public', 'public', 1489752, '[]', '[]', '[]', '[]', 1, '2025-04-09 19:39:12', '2025-04-09 19:39:12'),
(89, 'App\\Models\\UserInvitation', 230, '3700e2a9-7a77-43f9-bd7e-5bc83272faa6', 'qr', '1744216752', '1744216752.png', 'image/png', 'public', 'public', 32904, '[]', '[]', '[]', '[]', 2, '2025-04-09 19:39:13', '2025-04-09 19:39:13'),
(90, 'App\\Models\\UserInvitation', 231, '27f35e08-9d69-465e-bbb7-b30ff4e2444c', 'userInvitation', 'Screenshot_20230920-211342', 'Screenshot_20230920-211342.jpg', 'image/jpeg', 'public', 'public', 524336, '[]', '[]', '[]', '[]', 1, '2025-04-09 23:50:44', '2025-04-09 23:50:44'),
(92, 'App\\Models\\UserInvitation', 232, '5f2b4eb4-c96c-4f0a-8a42-ade482ddba96', 'qr', '1744232096', '1744232096.png', 'image/png', 'public', 'public', 17011, '[]', '[]', '[]', '[]', 2, '2025-04-09 23:54:56', '2025-04-09 23:54:56'),
(93, 'App\\Models\\UserInvitation', 232, '6c23b665-68ff-4e49-91b0-9b256ff62a95', 'qr', '1744232098', '1744232098.png', 'image/png', 'public', 'public', 17984, '[]', '[]', '[]', '[]', 3, '2025-04-09 23:54:58', '2025-04-09 23:54:58'),
(94, 'App\\Models\\UserInvitation', 233, '4ef1a321-ee4a-4aad-9074-f5cbf3bef374', 'userInvitation', 'Screenshot_20230925-142015_Calendar', 'Screenshot_20230925-142015_Calendar.jpg', 'image/jpeg', 'public', 'public', 177495, '[]', '[]', '[]', '[]', 1, '2025-04-10 01:22:41', '2025-04-10 01:22:41'),
(95, 'App\\Models\\UserInvitation', 233, '740d16ad-4ce1-4523-86b3-3b6440aabb88', 'qr', '1744237364', '1744237364.png', 'image/png', 'public', 'public', 17296, '[]', '[]', '[]', '[]', 2, '2025-04-10 01:22:44', '2025-04-10 01:22:44'),
(97, 'App\\Models\\UserInvitation', 234, '3f36e7a9-15de-4183-a8c8-10712395fa99', 'qr', '1744237988', '1744237988.png', 'image/png', 'public', 'public', 18040, '[]', '[]', '[]', '[]', 2, '2025-04-10 01:33:08', '2025-04-10 01:33:08'),
(98, 'App\\Models\\UserInvitation', 235, 'b0e20295-1706-41a7-9f38-6c7cba7351ea', 'userInvitation', 'ناصر، أشششكرك-1', 'ناصر،-أشششكرك-1.jpg', 'image/jpeg', 'public', 'public', 1489752, '[]', '[]', '[]', '[]', 1, '2025-04-10 18:02:44', '2025-04-10 18:02:44'),
(99, 'App\\Models\\UserInvitation', 235, '71f97e29-3ce0-4799-9308-bf2624ddcb1a', 'qr', '1744297364', '1744297364.png', 'image/png', 'public', 'public', 35079, '[]', '[]', '[]', '[]', 2, '2025-04-10 18:02:44', '2025-04-10 18:02:44'),
(102, 'App\\Models\\UserInvitation', 236, '24578380-3105-4d66-a903-76547d6060c7', 'qr', '1744387362', '1744387362.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 2, '2025-04-11 19:02:42', '2025-04-11 19:02:42'),
(105, 'App\\Models\\UserInvitation', 238, 'a892a4d7-ed14-42c5-bf8d-d52b6877a7e2', 'qr', '1744388333', '1744388333.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 2, '2025-04-11 19:18:53', '2025-04-11 19:18:53'),
(106, 'App\\Models\\UserInvitation', 239, '47fa972d-3fbf-4df2-918f-b2475588a3b5', 'userInvitation', 'معاذ المشعلي-2', 'معاذ-المشعلي-2.pdf', 'application/pdf', 'public', 'public', 1046772, '[]', '[]', '[]', '[]', 1, '2025-04-12 11:53:45', '2025-04-12 11:53:45'),
(107, 'App\\Models\\UserInvitation', 239, 'afa98865-0d36-41d2-bc94-d1ed2787d270', 'qr', '1744448025', '1744448025.png', 'image/png', 'public', 'public', 35079, '[]', '[]', '[]', '[]', 2, '2025-04-12 11:53:45', '2025-04-12 11:53:45'),
(108, 'App\\Models\\UserInvitation', 240, 'f18bb043-2bf6-405b-9636-bc730728da47', 'userInvitation', '_101_1740012710', '_101_1740012710.pdf', 'application/pdf', 'public', 'public', 4968713, '[]', '[]', '[]', '[]', 1, '2025-04-12 20:10:56', '2025-04-12 20:10:56'),
(109, 'App\\Models\\UserInvitation', 240, 'be880fd2-a5f5-49db-b456-138a4fa1ee29', 'qr', '1744477859', '1744477859.png', 'image/png', 'public', 'public', 17072, '[]', '[]', '[]', '[]', 2, '2025-04-12 20:10:59', '2025-04-12 20:10:59'),
(110, 'App\\Models\\UserInvitation', 241, '9cce227b-d91a-4fda-9df5-1b796c80cf06', 'userInvitation', 'Your details  VFS Global', 'Your-details--VFS-Global.pdf', 'application/pdf', 'public', 'public', 48551, '[]', '[]', '[]', '[]', 1, '2025-04-12 20:16:12', '2025-04-12 20:16:12'),
(111, 'App\\Models\\UserInvitation', 241, '5cc91686-689e-4c52-9c77-fa99c441b3b9', 'qr', '1744478174', '1744478174.png', 'image/png', 'public', 'public', 17074, '[]', '[]', '[]', '[]', 2, '2025-04-12 20:16:14', '2025-04-12 20:16:14'),
(112, 'App\\Models\\UserInvitation', 238, 'aef4ffbf-2379-4d6c-9fa5-022a14663ca8', 'qr', '1744478250', '1744478250.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 3, '2025-04-12 20:17:31', '2025-04-12 20:17:31'),
(113, 'App\\Models\\UserInvitation', 238, 'b03c9383-2331-4b13-8914-336fd678cedf', 'qr', '1744478252', '1744478252.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 4, '2025-04-12 20:17:32', '2025-04-12 20:17:32'),
(114, 'App\\Models\\UserInvitation', 238, '8bdfb6a8-0859-43b6-b3bc-9823edcb8bd5', 'qr', '1744478560', '1744478560.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 5, '2025-04-12 20:22:40', '2025-04-12 20:22:40'),
(115, 'App\\Models\\UserInvitation', 238, '2a8f3fe8-9887-436d-8a13-fcceaf4f9f88', 'qr', '1744478561', '1744478561.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 6, '2025-04-12 20:22:41', '2025-04-12 20:22:41'),
(116, 'App\\Models\\UserInvitation', 238, '1166db29-a4d3-4f63-887b-a05f5a9935c4', 'qr', '1744480027', '1744480027.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 7, '2025-04-12 20:47:08', '2025-04-12 20:47:08'),
(117, 'App\\Models\\UserInvitation', 238, 'd8831905-81e9-47f8-a47d-c50558c2cbc4', 'qr', '1744480028', '1744480028.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 8, '2025-04-12 20:47:08', '2025-04-12 20:47:08'),
(119, 'App\\Models\\UserInvitation', 242, '64c8be6b-f71b-48b2-a022-218e1226cac7', 'qr', '1744482284', '1744482284.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 2, '2025-04-12 21:24:44', '2025-04-12 21:24:44'),
(120, 'App\\Models\\UserInvitation', 243, '97b97ac9-e103-453c-b6a6-97d28708b680', 'userInvitation', 'Your details  VFS Global 2', 'Your-details--VFS-Global-2.pdf', 'application/pdf', 'public', 'public', 41366, '[]', '[]', '[]', '[]', 1, '2025-04-12 21:37:10', '2025-04-12 21:37:10'),
(121, 'App\\Models\\UserInvitation', 243, '917f3101-67c4-417b-8bff-9b4025e6ac57', 'qr', '1744483032', '1744483032.png', 'image/png', 'public', 'public', 17797, '[]', '[]', '[]', '[]', 2, '2025-04-12 21:37:12', '2025-04-12 21:37:12'),
(123, 'App\\Models\\UserInvitation', 244, 'bbdc47bc-cdb0-4600-8e31-217defbb8e75', 'qr', '1744523932', '1744523932.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 2, '2025-04-13 08:58:52', '2025-04-13 08:58:52'),
(124, 'App\\Models\\UserInvitation', 238, 'fc6c6a48-e983-45b6-ae7f-0287fba3ed4e', 'qr', '1744523978', '1744523978.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 9, '2025-04-13 08:59:38', '2025-04-13 08:59:38'),
(125, 'App\\Models\\UserInvitation', 238, 'cad9491e-a131-4190-b588-8fd365c0670e', 'qr', '1744523980', '1744523980.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 10, '2025-04-13 08:59:40', '2025-04-13 08:59:40'),
(127, 'App\\Models\\UserInvitation', 245, '27ae057c-008e-47b6-93a0-b42b1734f00b', 'qr', '1744573637', '1744573637.png', 'image/png', 'public', 'public', 30555, '[]', '[]', '[]', '[]', 2, '2025-04-13 22:47:17', '2025-04-13 22:47:17'),
(128, 'App\\Models\\UserInvitation', 246, '71cddf2b-4dba-483a-ad09-0400332a0e61', 'userInvitation', 'Deep_Learning_from_Scratch__1736910731', 'Deep_Learning_from_Scratch__1736910731.pdf', 'application/pdf', 'public', 'public', 9623161, '[]', '[]', '[]', '[]', 1, '2025-04-13 22:57:43', '2025-04-13 22:57:43'),
(129, 'App\\Models\\UserInvitation', 246, '11e8e9c8-237c-4ef0-b595-a53d9c9afaaa', 'qr', '1744574265', '1744574265.png', 'image/png', 'public', 'public', 17485, '[]', '[]', '[]', '[]', 2, '2025-04-13 22:57:45', '2025-04-13 22:57:45'),
(131, 'App\\Models\\UserInvitation', 247, '6a1376bb-e8f2-4e4a-bfd5-1e2a8a4b9000', 'qr', '1744574604', '1744574604.png', 'image/png', 'public', 'public', 30521, '[]', '[]', '[]', '[]', 2, '2025-04-13 23:03:24', '2025-04-13 23:03:24'),
(132, 'App\\Models\\UserInvitation', 248, '64b355eb-6d04-4f9a-833f-b4b8d321480c', 'userInvitation', 'members report', 'members-report.pdf', 'application/pdf', 'public', 'public', 112650, '[]', '[]', '[]', '[]', 1, '2025-04-14 00:14:56', '2025-04-14 00:14:56'),
(133, 'App\\Models\\UserInvitation', 249, '4ab726b8-cb2d-4459-b7a3-27cb55fe3013', 'userInvitation', 'members report', 'members-report.pdf', 'application/pdf', 'public', 'public', 112650, '[]', '[]', '[]', '[]', 1, '2025-04-14 00:15:22', '2025-04-14 00:15:22'),
(135, 'App\\Models\\UserInvitation', 250, '3f137155-4bcb-441d-b573-8f1da6667b93', 'qr', '1744579051', '1744579051.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 2, '2025-04-14 00:17:31', '2025-04-14 00:17:31'),
(136, 'App\\Models\\UserInvitation', 238, 'f62bcff8-4532-488e-b4a2-081c78072586', 'qr', '1744579105', '1744579105.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 11, '2025-04-14 00:18:25', '2025-04-14 00:18:25'),
(137, 'App\\Models\\UserInvitation', 238, '2a3c3854-b371-4aeb-a83c-d1ed973e821e', 'qr', '1744579107', '1744579107.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 12, '2025-04-14 00:18:27', '2025-04-14 00:18:27'),
(138, 'App\\Models\\UserInvitation', 238, '5f8eb772-ab4b-49dd-a436-e85526eacc19', 'document', '1744631162', '1744631162.pdf', 'application/pdf', 'public', 'public', 193984, '[]', '[]', '[]', '[]', 13, '2025-04-14 14:46:02', '2025-04-14 14:46:02'),
(139, 'App\\Models\\UserInvitation', 238, '35e30165-0603-4dbd-8a85-a800d6e9d54c', 'document', '1744631162', '1744631162.pdf', 'application/pdf', 'public', 'public', 193984, '[]', '[]', '[]', '[]', 14, '2025-04-14 14:46:02', '2025-04-14 14:46:02'),
(140, 'App\\Models\\UserInvitation', 238, '560665e4-ffe4-4553-8421-92c4c70aa45d', 'document', '1744631670', '1744631670.pdf', 'application/pdf', 'public', 'public', 1295, '[]', '[]', '[]', '[]', 15, '2025-04-14 14:54:30', '2025-04-14 14:54:30'),
(141, 'App\\Models\\UserInvitation', 238, '81f761de-6375-4c28-adde-abfd85a3a51d', 'document', '1744631671', '1744631671.pdf', 'application/pdf', 'public', 'public', 1295, '[]', '[]', '[]', '[]', 16, '2025-04-14 14:54:31', '2025-04-14 14:54:31'),
(142, 'App\\Models\\UserInvitation', 238, 'c0a42399-1e7f-4213-aef0-05f1f9b28c4c', 'qr', '1744631746', '1744631746.jpg', 'image/jpeg', 'public', 'public', 15782, '[]', '[]', '[]', '[]', 17, '2025-04-14 14:55:46', '2025-04-14 14:55:46'),
(143, 'App\\Models\\UserInvitation', 238, '11d6002a-ae38-40a8-b4aa-0174dfa33ab3', 'qr', '1744631746', '1744631746.png', 'image/png', 'public', 'public', 1291152, '[]', '[]', '[]', '[]', 18, '2025-04-14 14:55:46', '2025-04-14 14:55:46'),
(144, 'App\\Models\\UserInvitation', 238, 'a79be35c-5ea3-4560-9aeb-c94f42314dd3', 'qr', '1744632148', '1744632148.jpg', 'image/jpeg', 'public', 'public', 15782, '[]', '[]', '[]', '[]', 19, '2025-04-14 15:02:28', '2025-04-14 15:02:28'),
(145, 'App\\Models\\UserInvitation', 238, 'd4c261be-f6d3-4d6d-91c4-573be8235021', 'qr', '1744632150', '1744632150.png', 'image/png', 'public', 'public', 1291152, '[]', '[]', '[]', '[]', 20, '2025-04-14 15:02:31', '2025-04-14 15:02:31'),
(147, 'App\\Models\\UserInvitation', 251, '4de938cb-86cf-4427-8778-9a05e330eaea', 'qr', '1744638309', '1744638309.jpg', 'image/jpeg', 'public', 'public', 21526, '[]', '[]', '[]', '[]', 2, '2025-04-14 16:45:09', '2025-04-14 16:45:09'),
(149, 'App\\Models\\UserInvitation', 252, '707134e7-05c6-4466-a497-380d46fb08fa', 'qr', '1744638460', '1744638460.jpg', 'image/jpeg', 'public', 'public', 21526, '[]', '[]', '[]', '[]', 2, '2025-04-14 16:47:40', '2025-04-14 16:47:40'),
(150, 'App\\Models\\UserInvitation', 253, 'c2a86657-dafd-4c80-bee1-93456a8f24c8', 'qr', '1744638525', '1744638525.jpg', 'image/jpeg', 'public', 'public', 21526, '[]', '[]', '[]', '[]', 1, '2025-04-14 16:48:45', '2025-04-14 16:48:45'),
(151, 'App\\Models\\UserInvitation', 254, 'dac389c0-bdf4-4c1f-82d8-9cdbe809575e', 'qr', '1744638572', '1744638572.jpg', 'image/jpeg', 'public', 'public', 21526, '[]', '[]', '[]', '[]', 1, '2025-04-14 16:49:32', '2025-04-14 16:49:32'),
(152, 'App\\Models\\UserInvitation', 255, '5fb34f3e-bc24-49bf-af8f-de89d660f844', 'qr', '1744638591', '1744638591.jpg', 'image/jpeg', 'public', 'public', 21526, '[]', '[]', '[]', '[]', 1, '2025-04-14 16:49:51', '2025-04-14 16:49:51'),
(153, 'App\\Models\\UserInvitation', 256, 'eeff248e-f4cf-4787-9bd8-95ef0cf7b353', 'qr', '1744639567', '1744639567.jpg', 'image/jpeg', 'public', 'public', 21526, '[]', '[]', '[]', '[]', 1, '2025-04-14 17:06:07', '2025-04-14 17:06:07'),
(154, 'App\\Models\\UserInvitation', 257, '16186209-93cb-4aa9-9c7f-e6fc6da048ed', 'qr', '1744639637', '1744639637.png', 'image/png', 'public', 'public', 33446, '[]', '[]', '[]', '[]', 1, '2025-04-14 17:07:17', '2025-04-14 17:07:17'),
(155, 'App\\Models\\UserInvitation', 258, 'e1baa033-e39f-4a96-a12b-0e6305027632', 'qr', '1744639819', '1744639819.png', 'image/png', 'public', 'public', 33446, '[]', '[]', '[]', '[]', 1, '2025-04-14 17:10:19', '2025-04-14 17:10:19'),
(156, 'App\\Models\\UserInvitation', 259, 'f7b49dca-442a-4e5d-a2a1-58601feaad0d', 'qr', '1744639884', '1744639884.png', 'image/png', 'public', 'public', 33446, '[]', '[]', '[]', '[]', 1, '2025-04-14 17:11:24', '2025-04-14 17:11:24'),
(157, 'App\\Models\\UserInvitation', 260, '22e2c403-80ec-46a9-a84c-69904638ed56', 'qr', '1744645035', '1744645035.png', 'image/png', 'public', 'public', 33446, '[]', '[]', '[]', '[]', 1, '2025-04-14 18:37:16', '2025-04-14 18:37:16'),
(158, 'App\\Models\\UserInvitation', 261, 'e54a3bc0-fbf1-4246-beb7-3380652b945b', 'qr', '1744645084', '1744645084.png', 'image/png', 'public', 'public', 33446, '[]', '[]', '[]', '[]', 1, '2025-04-14 18:38:04', '2025-04-14 18:38:04'),
(159, 'App\\Models\\UserInvitation', 262, '82cc459c-0730-4277-b5ae-d94560835423', 'qr', '1744645237', '1744645237.png', 'image/png', 'public', 'public', 33446, '[]', '[]', '[]', '[]', 1, '2025-04-14 18:40:37', '2025-04-14 18:40:37'),
(161, 'App\\Models\\UserInvitation', 263, 'b9ee43e4-2b49-4e0d-a377-704587074671', 'qr', '1744645507', '1744645507.png', 'image/png', 'public', 'public', 33446, '[]', '[]', '[]', '[]', 2, '2025-04-14 18:45:07', '2025-04-14 18:45:07'),
(163, 'App\\Models\\UserInvitation', 264, '0484956c-f31e-43bc-ab01-b2b39625adea', 'qr', '1744645568', '1744645568.png', 'image/png', 'public', 'public', 33446, '[]', '[]', '[]', '[]', 2, '2025-04-14 18:46:08', '2025-04-14 18:46:08'),
(165, 'App\\Models\\UserInvitation', 265, '2bc2d533-0b2a-4752-a3be-af4edb010b94', 'qr', '1744645625', '1744645625.jpg', 'image/jpeg', 'public', 'public', 21526, '[]', '[]', '[]', '[]', 2, '2025-04-14 18:47:05', '2025-04-14 18:47:05'),
(167, 'App\\Models\\UserInvitation', 266, '6b3f1bbc-d0d3-47e1-b482-55cb7c88a403', 'qr', '1744645712', '1744645712.jpg', 'image/jpeg', 'public', 'public', 21526, '[]', '[]', '[]', '[]', 2, '2025-04-14 18:48:32', '2025-04-14 18:48:32'),
(169, 'App\\Models\\UserInvitation', 267, 'f6a532f7-e297-4fee-a311-a572868ace64', 'qr', '1744646103', '1744646103.jpg', 'image/jpeg', 'public', 'public', 21526, '[]', '[]', '[]', '[]', 2, '2025-04-14 18:55:03', '2025-04-14 18:55:03'),
(171, 'App\\Models\\UserInvitation', 268, 'b75434e0-d53a-48c1-998c-f3642b953da8', 'qr', '1744646261', '1744646261.jpg', 'image/jpeg', 'public', 'public', 21526, '[]', '[]', '[]', '[]', 2, '2025-04-14 18:57:41', '2025-04-14 18:57:41'),
(172, 'App\\Models\\UserInvitation', 238, 'd46292af-9f4f-4241-bc13-12f097cf29b6', 'qr', '1744647311', '1744647311.jpg', 'image/jpeg', 'public', 'public', 15782, '[]', '[]', '[]', '[]', 21, '2025-04-14 19:15:11', '2025-04-14 19:15:11'),
(173, 'App\\Models\\UserInvitation', 238, 'f7c2987f-2d51-448b-8301-1946923c2657', 'qr', '1744647312', '1744647312.png', 'image/png', 'public', 'public', 1291152, '[]', '[]', '[]', '[]', 22, '2025-04-14 19:15:13', '2025-04-14 19:15:13'),
(174, 'App\\Models\\UserInvitation', 238, '375ef263-564e-4eac-a8b7-fe046ddaecbe', 'qr', '1744647413', '1744647413.jpg', 'image/jpeg', 'public', 'public', 21133, '[]', '[]', '[]', '[]', 23, '2025-04-14 19:16:53', '2025-04-14 19:16:53'),
(175, 'App\\Models\\UserInvitation', 238, 'ef46c628-1624-492f-badb-cc0c9ce87931', 'qr', '1744647414', '1744647414.png', 'image/png', 'public', 'public', 1291152, '[]', '[]', '[]', '[]', 24, '2025-04-14 19:16:55', '2025-04-14 19:16:55'),
(176, 'App\\Models\\UserInvitation', 238, '7ed73388-5c1d-4ada-872b-1a403d8767dd', 'qr', '1744649483', '1744649483.jpg', 'image/jpeg', 'public', 'public', 21133, '[]', '[]', '[]', '[]', 25, '2025-04-14 19:51:23', '2025-04-14 19:51:23'),
(177, 'App\\Models\\UserInvitation', 238, '4cfca8b7-00a8-4a1c-aea9-b6447ac1d269', 'qr', '1744649484', '1744649484.png', 'image/png', 'public', 'public', 1291152, '[]', '[]', '[]', '[]', 26, '2025-04-14 19:51:25', '2025-04-14 19:51:25'),
(178, 'App\\Models\\UserInvitation', 238, '5c1fd421-1260-4824-a3e3-149665941485', 'qr', '1744649550', '1744649550.jpg', 'image/jpeg', 'public', 'public', 21133, '[]', '[]', '[]', '[]', 27, '2025-04-14 19:52:30', '2025-04-14 19:52:30'),
(180, 'App\\Models\\UserInvitation', 269, 'd9ffa331-30ff-47aa-9eff-a59707859bf6', 'qr', '1744666274', '1744666274.png', 'image/png', 'public', 'public', 19095, '[]', '[]', '[]', '[]', 2, '2025-04-15 00:31:14', '2025-04-15 00:31:14'),
(181, 'App\\Models\\UserInvitation', 270, '8380add1-f433-44f3-8a80-307dfa090824', 'qr', '1744799232', '1744799232.png', 'image/png', 'public', 'public', 30459, '[]', '[]', '[]', '[]', 1, '2025-04-16 13:27:12', '2025-04-16 13:27:12'),
(182, 'App\\Models\\UserInvitation', 270, 'a4c1df7b-fcf9-401f-8984-522935f49790', 'qr', '1744799233', '1744799233.png', 'image/png', 'public', 'public', 28319, '[]', '[]', '[]', '[]', 2, '2025-04-16 13:27:13', '2025-04-16 13:27:13'),
(183, 'App\\Models\\UserInvitation', 271, '66bbb854-c91e-42cd-bda3-bd6b8bb3e36c', 'qr', '1744799978', '1744799978.png', 'image/png', 'public', 'public', 27904, '[]', '[]', '[]', '[]', 1, '2025-04-16 13:39:38', '2025-04-16 13:39:38'),
(184, 'App\\Models\\UserInvitation', 272, '5a929e39-5859-4dc4-8dbf-9aa5118cda54', 'qr', '1745073159', '1745073159.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 1, '2025-04-19 17:32:39', '2025-04-19 17:32:39'),
(185, 'App\\Models\\UserInvitation', 273, 'd28b7faf-8677-456c-a5fe-8cf16c825a21', 'qr', '1745073240', '1745073240.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 1, '2025-04-19 17:34:00', '2025-04-19 17:34:00'),
(186, 'App\\Models\\UserInvitation', 273, '9d6f393d-dbb9-43e7-825e-f46b5d0d58c1', 'qr', '1745074326', '1745074326.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 2, '2025-04-19 17:52:06', '2025-04-19 17:52:06'),
(187, 'App\\Models\\UserInvitation', 273, '2d01f6a1-276a-4ee1-8702-030599cefb45', 'qr', '1745074327', '1745074327.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 3, '2025-04-19 17:52:07', '2025-04-19 17:52:07'),
(188, 'App\\Models\\UserInvitation', 273, '33ff4136-49d3-414e-8c50-bcd51d39a048', 'qr', '1745074376', '1745074376.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 4, '2025-04-19 17:52:56', '2025-04-19 17:52:56'),
(189, 'App\\Models\\UserInvitation', 273, 'b4753a94-88ba-4e05-8ed3-53b64a149418', 'qr', '1745074500', '1745074500.jpg', 'image/jpeg', 'public', 'public', 13377, '[]', '[]', '[]', '[]', 5, '2025-04-19 17:55:00', '2025-04-19 17:55:00'),
(190, 'App\\Models\\UserInvitation', 273, 'd7c51198-797f-41f2-8d29-741de0765b18', 'qr', '1745075022', '1745075022.jpg', 'image/jpeg', 'public', 'public', 13005, '[]', '[]', '[]', '[]', 6, '2025-04-19 18:03:42', '2025-04-19 18:03:42'),
(191, 'App\\Models\\UserInvitation', 273, '304cf3a4-d56b-4a1c-8c7f-87d7698fd0a4', 'qr', '1745075174', '1745075174.jpg', 'image/jpeg', 'public', 'public', 13005, '[]', '[]', '[]', '[]', 7, '2025-04-19 18:06:14', '2025-04-19 18:06:14'),
(192, 'App\\Models\\UserInvitation', 273, '96b6f541-9b03-4d28-bed4-023b83077f11', 'qr', '1745075241', '1745075241.jpg', 'image/jpeg', 'public', 'public', 13005, '[]', '[]', '[]', '[]', 8, '2025-04-19 18:07:21', '2025-04-19 18:07:21'),
(193, 'App\\Models\\UserInvitation', 273, '2d52b19a-345a-40ae-a2b0-307c99b3d1b9', 'qr', '1745076371', '1745076371.jpg', 'image/jpeg', 'public', 'public', 13005, '[]', '[]', '[]', '[]', 9, '2025-04-19 18:26:11', '2025-04-19 18:26:11'),
(194, 'App\\Models\\UserInvitation', 273, '62eb9d8e-01a6-40e1-81f4-dcb745673abd', 'qr', '1745076543', '1745076543.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 10, '2025-04-19 18:29:03', '2025-04-19 18:29:03'),
(195, 'App\\Models\\UserInvitation', 273, '611342d5-be70-48be-857d-85ce882ae4f5', 'qr', '1745076544', '1745076544.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 11, '2025-04-19 18:29:04', '2025-04-19 18:29:04'),
(196, 'App\\Models\\UserInvitation', 273, 'c9c9e738-e085-4085-94e7-0a6fbce71ea4', 'qr', '1745076603', '1745076603.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 12, '2025-04-19 18:30:03', '2025-04-19 18:30:03'),
(198, 'App\\Models\\UserInvitation', 274, '8f5defb8-4bf6-4098-801b-7c29f044d4d0', 'qr', '1745078598', '1745078598.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 2, '2025-04-19 19:03:18', '2025-04-19 19:03:18'),
(200, 'App\\Models\\UserInvitation', 275, 'd1c77632-4a47-46d8-97cd-5656805f440a', 'qr', '1745078652', '1745078652.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 2, '2025-04-19 19:04:12', '2025-04-19 19:04:12'),
(202, 'App\\Models\\UserInvitation', 276, '03bc79d4-9ffd-4203-928b-9d7e99b00a4f', 'qr', '1745078852', '1745078852.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 2, '2025-04-19 19:07:32', '2025-04-19 19:07:32'),
(203, 'App\\Models\\UserInvitation', 273, '19d23892-433a-4c3c-aea6-02748b4907ae', 'qr', '1745079033', '1745079033.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 13, '2025-04-19 19:10:33', '2025-04-19 19:10:33'),
(204, 'App\\Models\\UserInvitation', 276, '78bd9bf0-4423-47ff-ac6f-b82b5c52f1ad', 'qr', '1745079576', '1745079576.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 3, '2025-04-19 19:19:36', '2025-04-19 19:19:36'),
(205, 'App\\Models\\UserInvitation', 277, '99107920-4a04-4d99-af88-9bbad869671c', 'qr', '1745135446', '1745135446.png', 'image/png', 'public', 'public', 33816, '[]', '[]', '[]', '[]', 1, '2025-04-20 10:50:46', '2025-04-20 10:50:46'),
(206, 'App\\Models\\UserInvitation', 278, '4e55b783-0cb2-4414-96f5-14a2fee4c6e0', 'qr', '1745135782', '1745135782.png', 'image/png', 'public', 'public', 33838, '[]', '[]', '[]', '[]', 1, '2025-04-20 10:56:22', '2025-04-20 10:56:22'),
(208, 'App\\Models\\UserInvitation', 279, '24c9133e-af44-4e79-bf45-55dd4dcb58a0', 'qr', '1745135889', '1745135889.png', 'image/png', 'public', 'public', 17635, '[]', '[]', '[]', '[]', 2, '2025-04-20 10:58:09', '2025-04-20 10:58:09'),
(209, 'App\\Models\\UserInvitation', 280, '35433347-d4a9-4180-9a70-1d8895ca3704', 'userInvitation', '93 sar', '93-sar.png', 'image/png', 'public', 'public', 48640, '[]', '[]', '[]', '[]', 1, '2025-04-20 11:08:36', '2025-04-20 11:08:36'),
(210, 'App\\Models\\UserInvitation', 281, '59fa77ff-0975-47be-bae0-d738dc539693', 'userInvitation', '93 sar', '93-sar.png', 'image/png', 'public', 'public', 48640, '[]', '[]', '[]', '[]', 1, '2025-04-20 11:15:36', '2025-04-20 11:15:36'),
(211, 'App\\Models\\UserInvitation', 281, '84868116-9a54-4e86-8209-f3eaf3d0cd92', 'qr', '1745136940', '1745136940.png', 'image/png', 'public', 'public', 18220, '[]', '[]', '[]', '[]', 2, '2025-04-20 11:15:40', '2025-04-20 11:15:40'),
(212, 'App\\Models\\UserInvitation', 281, 'fa77d157-adb3-424c-b08a-37ba65036311', 'qr', '1745136941', '1745136941.png', 'image/png', 'public', 'public', 18248, '[]', '[]', '[]', '[]', 3, '2025-04-20 11:15:42', '2025-04-20 11:15:42'),
(214, 'App\\Models\\UserInvitation', 282, 'ecfbc449-04e8-4441-9fdd-0eefa7dbd9fa', 'qr', '1745197372', '1745197372.png', 'image/png', 'public', 'public', 18014, '[]', '[]', '[]', '[]', 2, '2025-04-21 04:02:52', '2025-04-21 04:02:52'),
(215, 'App\\Models\\UserInvitation', 283, '969e743e-8646-475c-adef-70acea892ba2', 'userInvitation', 'Screenshot_20230920-211342', 'Screenshot_20230920-211342.jpg', 'image/jpeg', 'public', 'public', 524336, '[]', '[]', '[]', '[]', 1, '2025-04-21 04:04:04', '2025-04-21 04:04:04'),
(216, 'App\\Models\\UserInvitation', 283, '4008fa02-770e-452d-bfd5-61af1f42ff03', 'qr', '1745197446', '1745197446.png', 'image/png', 'public', 'public', 18742, '[]', '[]', '[]', '[]', 2, '2025-04-21 04:04:06', '2025-04-21 04:04:06'),
(217, 'App\\Models\\UserInvitation', 284, '8a864714-f50a-4a01-9906-44bb813ccdb4', 'userInvitation', 'Screenshot_20231002-101841', 'Screenshot_20231002-101841.jpg', 'image/jpeg', 'public', 'public', 497164, '[]', '[]', '[]', '[]', 1, '2025-04-21 04:31:49', '2025-04-21 04:31:49'),
(218, 'App\\Models\\UserInvitation', 284, 'bbecb661-feb4-4dd9-9554-efe802dbcc06', 'qr', '1745199112', '1745199112.png', 'image/png', 'public', 'public', 16607, '[]', '[]', '[]', '[]', 2, '2025-04-21 04:31:52', '2025-04-21 04:31:52'),
(219, 'App\\Models\\UserInvitation', 285, '7fd57f8e-a7a6-4c28-8b6a-b81493a6eb20', 'qr', '1745199593', '1745199593.png', 'image/png', 'public', 'public', 16914, '[]', '[]', '[]', '[]', 1, '2025-04-21 04:39:54', '2025-04-21 04:39:54'),
(220, 'App\\Models\\UserInvitation', 286, '4e7ec8f8-60c4-4f20-aa8b-0f4ee4fe6ef1', 'userInvitation', 'Screenshot_20240311-082602', 'Screenshot_20240311-082602.jpg', 'image/jpeg', 'public', 'public', 62532, '[]', '[]', '[]', '[]', 1, '2025-04-21 04:41:35', '2025-04-21 04:41:35'),
(221, 'App\\Models\\UserInvitation', 286, 'e7d4eabe-437a-4a66-bf4f-6c2811772890', 'qr', '1745199695', '1745199695.png', 'image/png', 'public', 'public', 17493, '[]', '[]', '[]', '[]', 2, '2025-04-21 04:41:35', '2025-04-21 04:41:35'),
(223, 'App\\Models\\UserInvitation', 287, '7abfd301-9ab5-49d2-ac0c-2a72d8443f7d', 'qr', '1745202345', '1745202345.png', 'image/png', 'public', 'public', 13654, '[]', '[]', '[]', '[]', 2, '2025-04-21 05:25:45', '2025-04-21 05:25:45'),
(224, 'App\\Models\\UserInvitation', 288, '17bac7a8-e093-44eb-bc9f-cd7327db80ba', 'userInvitation', 'Screenshot_20230922-160554', 'Screenshot_20230922-160554.jpg', 'image/jpeg', 'public', 'public', 290745, '[]', '[]', '[]', '[]', 1, '2025-04-21 05:26:37', '2025-04-21 05:26:37'),
(225, 'App\\Models\\UserInvitation', 288, '5e2a45e9-e13c-4ae6-b14c-9a1b959db39c', 'qr', '1745202397', '1745202397.png', 'image/png', 'public', 'public', 12871, '[]', '[]', '[]', '[]', 2, '2025-04-21 05:26:37', '2025-04-21 05:26:37'),
(226, 'App\\Models\\UserInvitation', 276, '4213203d-f266-437c-9aeb-afe8b0a8c721', 'qr', '1745216453', '1745216453.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 4, '2025-04-21 09:20:53', '2025-04-21 09:20:53'),
(227, 'App\\Models\\UserInvitation', 289, 'ea62f7ed-c514-4fd3-8d7e-d4f54bd903e9', 'qr', '1745216547', '1745216547.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 1, '2025-04-21 09:22:27', '2025-04-21 09:22:27'),
(228, 'App\\Models\\UserInvitation', 290, '998921e6-42cf-45ff-86f7-a30a9a091ead', 'qr', '1745216571', '1745216571.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 1, '2025-04-21 09:22:51', '2025-04-21 09:22:51'),
(229, 'App\\Models\\UserInvitation', 276, 'c27b6e8d-bdca-48ea-8e52-aa46a56187e1', 'qr', '1745216803', '1745216803.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 5, '2025-04-21 09:26:43', '2025-04-21 09:26:43'),
(230, 'App\\Models\\UserInvitation', 276, '58a0e135-2991-4d9b-a107-2e896be6751c', 'qr', '1745217227', '1745217227.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 6, '2025-04-21 09:33:47', '2025-04-21 09:33:47'),
(231, 'App\\Models\\UserInvitation', 276, '59a52051-dfaa-4729-9b28-d4f46c81dbd9', 'qr', '1745218061', '1745218061.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 7, '2025-04-21 09:47:42', '2025-04-21 09:47:42'),
(232, 'App\\Models\\UserInvitation', 276, '50cededa-17fa-4c1b-9db3-16311b5c3792', 'qr', '1745218672', '1745218672.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 8, '2025-04-21 09:57:53', '2025-04-21 09:57:53'),
(233, 'App\\Models\\UserInvitation', 276, 'f47c8ff6-4833-4b73-ad73-5e41d71ad890', 'qr', '1745219483', '1745219483.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 9, '2025-04-21 10:11:23', '2025-04-21 10:11:23'),
(234, 'App\\Models\\UserInvitation', 276, '1c72275c-cc71-4b52-91bb-b43c34da4d2a', 'qr', '1745219535', '1745219535.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 10, '2025-04-21 10:12:15', '2025-04-21 10:12:15'),
(235, 'App\\Models\\UserInvitation', 291, 'd94b86a2-5dcc-4306-a447-bae32ca2ca17', 'qr', '1745219642', '1745219642.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 1, '2025-04-21 10:14:02', '2025-04-21 10:14:02'),
(236, 'App\\Models\\UserInvitation', 292, '79e0e88d-32c4-4003-9601-ceb4a81440fd', 'qr', '1745219664', '1745219664.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 1, '2025-04-21 10:14:24', '2025-04-21 10:14:24'),
(238, 'App\\Models\\UserInvitation', 293, 'e7763b6d-194c-4412-8b34-2712be2674de', 'qr', '1745219705', '1745219705.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-21 10:15:05', '2025-04-21 10:15:05'),
(239, 'App\\Models\\UserInvitation', 294, '21f88375-39ea-4bd3-9d92-1bd9503e4f31', 'qr', '1745219780', '1745219780.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 1, '2025-04-21 10:16:20', '2025-04-21 10:16:20'),
(241, 'App\\Models\\UserInvitation', 295, 'f87d6bd2-de7b-4b2c-af79-2f1fae795df0', 'qr', '1745219962', '1745219962.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-21 10:19:22', '2025-04-21 10:19:22'),
(242, 'App\\Models\\UserInvitation', 296, '511b9529-faac-4f43-b629-6e8b91b94474', 'qr', '1745219999', '1745219999.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 1, '2025-04-21 10:19:59', '2025-04-21 10:19:59'),
(244, 'App\\Models\\UserInvitation', 297, '490a18df-856e-4122-b8ad-82f59c95f499', 'qr', '1745220046', '1745220046.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 2, '2025-04-21 10:20:46', '2025-04-21 10:20:46'),
(246, 'App\\Models\\UserInvitation', 298, '5e1e9ac7-952e-457e-bc94-7fac91b16ea0', 'qr', '1745220083', '1745220083.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 2, '2025-04-21 10:21:23', '2025-04-21 10:21:23'),
(247, 'App\\Models\\UserInvitation', 276, '8d26de4c-89dd-45a3-9b95-80ee858860a2', 'qr', '1745220297', '1745220297.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 11, '2025-04-21 10:24:57', '2025-04-21 10:24:57'),
(248, 'App\\Models\\UserInvitation', 299, '7a54157d-4b06-4476-9091-f896302b69a5', 'qr', '1745221112', '1745221112.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 1, '2025-04-21 10:38:33', '2025-04-21 10:38:33'),
(249, 'App\\Models\\UserInvitation', 299, '58ca88cd-e2c2-418b-ac6a-9c7d80a41f89', 'qr', '1745221169', '1745221169.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 2, '2025-04-21 10:39:29', '2025-04-21 10:39:29'),
(251, 'App\\Models\\UserInvitation', 300, '77db3e20-32df-4024-a46c-efd837e930ca', 'qr', '1745221613', '1745221613.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 2, '2025-04-21 10:46:53', '2025-04-21 10:46:53'),
(253, 'App\\Models\\UserInvitation', 301, '1853f308-215d-422f-a683-792dc64e62fe', 'qr', '1745221793', '1745221793.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 2, '2025-04-21 10:49:53', '2025-04-21 10:49:53'),
(255, 'App\\Models\\UserInvitation', 302, 'feca4f3e-e6a2-4b7e-aa24-fbab9471adae', 'qr', '1745221846', '1745221846.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 2, '2025-04-21 10:50:46', '2025-04-21 10:50:46'),
(257, 'App\\Models\\UserInvitation', 303, '1117ac49-942f-4fdc-8461-78ebf29058e0', 'qr', '1745223940', '1745223940.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 2, '2025-04-21 11:25:40', '2025-04-21 11:25:40'),
(259, 'App\\Models\\UserInvitation', 304, '00b90636-dfbe-4ea8-a0db-37f1c65d7f51', 'qr', '1745223962', '1745223962.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 2, '2025-04-21 11:26:02', '2025-04-21 11:26:02'),
(260, 'App\\Models\\UserInvitation', 299, '2d9edba9-a6b3-493f-afd2-e249851139d8', 'qr', '1745223982', '1745223982.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 3, '2025-04-21 11:26:22', '2025-04-21 11:26:22'),
(261, 'App\\Models\\UserInvitation', 299, '3bcc220b-7f11-43bd-9f05-6023074bf6fc', 'qr', '1745224006', '1745224006.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 4, '2025-04-21 11:26:46', '2025-04-21 11:26:46'),
(262, 'App\\Models\\UserInvitation', 299, 'b7fc57b2-a9c1-4e87-8ed5-b91cc3ce680d', 'qr', '1745224972', '1745224972.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 5, '2025-04-21 11:42:52', '2025-04-21 11:42:52'),
(264, 'App\\Models\\UserInvitation', 305, '6e7bee95-4db0-439c-a339-1f875de7ff2d', 'qr', '1745228788', '1745228788.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 2, '2025-04-21 12:46:28', '2025-04-21 12:46:28'),
(265, 'App\\Models\\UserInvitation', 305, 'e4443671-76aa-4541-8e64-6eda0e2b21a5', 'qr', '1745229032', '1745229032.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 3, '2025-04-21 12:50:32', '2025-04-21 12:50:32'),
(266, 'App\\Models\\UserInvitation', 305, '72db1d28-ab8b-4a60-a77f-95a6d4b03761', 'qr', '1745229081', '1745229081.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 4, '2025-04-21 12:51:21', '2025-04-21 12:51:21'),
(267, 'App\\Models\\UserInvitation', 305, 'cb478f0b-ee3c-4367-af74-50704b696e84', 'qr', '1745229445', '1745229445.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 5, '2025-04-21 12:57:25', '2025-04-21 12:57:25'),
(268, 'App\\Models\\UserInvitation', 288, '72ca3773-d384-4bf8-9fab-4da217b27a7d', 'qr', '1745229582', '1745229582.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 3, '2025-04-21 12:59:42', '2025-04-21 12:59:42'),
(269, 'App\\Models\\UserInvitation', 288, '7028a1df-2c64-4614-a90e-57c268267506', 'qr', '1745229762', '1745229762.jpg', 'image/jpeg', 'public', 'public', 12987, '[]', '[]', '[]', '[]', 4, '2025-04-21 13:02:42', '2025-04-21 13:02:42'),
(270, 'App\\Models\\UserInvitation', 288, '3e23eea3-e5c9-4753-99e6-d315364e7965', 'qr', '1745229837', '1745229837.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 5, '2025-04-21 13:03:57', '2025-04-21 13:03:57'),
(271, 'App\\Models\\UserInvitation', 288, 'e4c2d759-5b8f-496d-a3d7-bbaad3f8cb71', 'qr', '1745230023', '1745230023.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 6, '2025-04-21 13:07:03', '2025-04-21 13:07:03'),
(272, 'App\\Models\\UserInvitation', 288, '9e2532a3-0753-404f-8379-4f5bf5a51c62', 'qr', '1745230086', '1745230086.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 7, '2025-04-21 13:08:06', '2025-04-21 13:08:06'),
(273, 'App\\Models\\UserInvitation', 288, '1c52dab2-032a-4e82-995f-1b3b903dfd76', 'qr', '1745230197', '1745230197.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 8, '2025-04-21 13:09:57', '2025-04-21 13:09:57'),
(275, 'App\\Models\\UserInvitation', 306, 'b83430a3-b45a-4b64-96be-ffb5466e4d33', 'qr', '1745232533', '1745232533.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 2, '2025-04-21 13:48:53', '2025-04-21 13:48:53'),
(276, 'App\\Models\\UserInvitation', 288, '5d114533-d23c-45f7-9f24-4dfc29305a8d', 'qr', '1745232594', '1745232594.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 9, '2025-04-21 13:49:54', '2025-04-21 13:49:54'),
(277, 'App\\Models\\UserInvitation', 288, '54404cd2-4514-43b0-b069-d6e7b6a75ef1', 'qr', '1745232624', '1745232624.jpg', 'image/jpeg', 'public', 'public', 39029, '[]', '[]', '[]', '[]', 10, '2025-04-21 13:50:24', '2025-04-21 13:50:24'),
(279, 'App\\Models\\UserInvitation', 307, '35508776-f59f-4329-b651-bb165036f669', 'qr', '1745232877', '1745232877.jpg', 'image/jpeg', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 2, '2025-04-21 13:54:37', '2025-04-21 13:54:37'),
(280, 'App\\Models\\UserInvitation', 288, 'f0120cd8-b6c8-4cae-a298-85f90ff9599c', 'qr', '1745234936', '1745234936.jpg', 'image/jpeg', 'public', 'public', 21185, '[]', '[]', '[]', '[]', 11, '2025-04-21 14:28:56', '2025-04-21 14:28:56'),
(281, 'App\\Models\\UserInvitation', 288, 'a49a507b-6cec-4acb-baf6-8158dc27f594', 'qr', '1745234943', '1745234943.jpg', 'image/jpeg', 'public', 'public', 21265, '[]', '[]', '[]', '[]', 12, '2025-04-21 14:29:03', '2025-04-21 14:29:03'),
(282, 'App\\Models\\UserInvitation', 307, '874d9270-2873-4820-a3e2-bf30aeeccbe4', 'qr', '1745235014', '1745235014.jpg', 'image/jpeg', 'public', 'public', 21185, '[]', '[]', '[]', '[]', 3, '2025-04-21 14:30:14', '2025-04-21 14:30:14');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(283, 'App\\Models\\UserInvitation', 307, 'e0a7dd60-053f-4612-a9d5-6a77291f0534', 'qr', '1745235021', '1745235021.jpg', 'image/jpeg', 'public', 'public', 21265, '[]', '[]', '[]', '[]', 4, '2025-04-21 14:30:21', '2025-04-21 14:30:21'),
(284, 'App\\Models\\UserInvitation', 307, 'c9ceaa99-ee00-428f-be8e-1c35a18366f2', 'qr', '1745235815', '1745235815.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 5, '2025-04-21 14:43:35', '2025-04-21 14:43:35'),
(285, 'App\\Models\\UserInvitation', 307, '3a649e29-1e5d-4ec5-b6b7-27fabc7d5aee', 'qr', '1745235822', '1745235822.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 6, '2025-04-21 14:43:42', '2025-04-21 14:43:42'),
(287, 'App\\Models\\UserInvitation', 308, '96dfdfab-8f5c-4bd8-b0d5-fa1b8a554813', 'qr', '1745236197', '1745236197.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-21 14:49:57', '2025-04-21 14:49:57'),
(288, 'App\\Models\\UserInvitation', 308, '43a7fd93-1222-4bbe-b466-726e0524b0a8', 'qr', '1745236198', '1745236198.jpg', 'image/jpeg', 'public', 'public', 22031, '[]', '[]', '[]', '[]', 3, '2025-04-21 14:49:58', '2025-04-21 14:49:58'),
(290, 'App\\Models\\UserInvitation', 309, 'f4462766-fefe-4dce-8404-72f6e60b7e55', 'qr', '1745237719', '1745237719.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-21 15:15:19', '2025-04-21 15:15:19'),
(291, 'App\\Models\\UserInvitation', 309, 'c7aa2a2d-3482-46ee-a13c-56fe02b81e6f', 'qr', '1745237720', '1745237720.jpg', 'image/jpeg', 'public', 'public', 22031, '[]', '[]', '[]', '[]', 3, '2025-04-21 15:15:20', '2025-04-21 15:15:20'),
(293, 'App\\Models\\UserInvitation', 310, '85507242-79f9-4efa-b8cf-ff34b698a879', 'qr', '1745237853', '1745237853.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-21 15:17:33', '2025-04-21 15:17:33'),
(294, 'App\\Models\\UserInvitation', 310, '8427d349-c5c0-4c50-9985-148f8a286fc5', 'qr', '1745237855', '1745237855.jpg', 'image/jpeg', 'public', 'public', 22031, '[]', '[]', '[]', '[]', 3, '2025-04-21 15:17:35', '2025-04-21 15:17:35'),
(296, 'App\\Models\\UserInvitation', 311, 'c4b0011f-e666-4ebc-8e45-54b2a208315d', 'qr', '1745238011', '1745238011.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-21 15:20:11', '2025-04-21 15:20:11'),
(297, 'App\\Models\\UserInvitation', 311, '6d4451b5-e698-4e52-af02-9bbc8d4ba005', 'qr', '1745238012', '1745238012.jpg', 'image/jpeg', 'public', 'public', 22031, '[]', '[]', '[]', '[]', 3, '2025-04-21 15:20:12', '2025-04-21 15:20:12'),
(299, 'App\\Models\\UserInvitation', 312, 'c67fdbe1-892e-4d7a-ada6-3eb0b03de14d', 'qr', '1745238603', '1745238603.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-21 15:30:03', '2025-04-21 15:30:03'),
(300, 'App\\Models\\UserInvitation', 312, '461ef56a-98f9-466c-9863-70338a04b727', 'qr', '1745238604', '1745238604.jpg', 'image/jpeg', 'public', 'public', 22031, '[]', '[]', '[]', '[]', 3, '2025-04-21 15:30:04', '2025-04-21 15:30:04'),
(301, 'App\\Models\\UserInvitation', 307, 'b4ea0c62-7187-435f-8822-8e6855a3b965', 'qr', '1745239648', '1745239648.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 7, '2025-04-21 15:47:28', '2025-04-21 15:47:28'),
(302, 'App\\Models\\UserInvitation', 307, 'cacd253a-cbcc-43c1-aac3-e482f3ff9908', 'qr', '1745239655', '1745239655.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 8, '2025-04-21 15:47:35', '2025-04-21 15:47:35'),
(303, 'App\\Models\\UserInvitation', 307, '8519f388-d08c-44e3-b8f4-25a3035d5470', 'qr', '1745239739', '1745239739.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 9, '2025-04-21 15:48:59', '2025-04-21 15:48:59'),
(304, 'App\\Models\\UserInvitation', 307, '6a7205ba-6b11-4cf5-b5a2-13427377d169', 'qr', '1745239747', '1745239747.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 10, '2025-04-21 15:49:07', '2025-04-21 15:49:07'),
(305, 'App\\Models\\UserInvitation', 307, '4c7997e6-034a-4c1a-9211-6abcf0af1e84', 'qr', '1745241564', '1745241564.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 11, '2025-04-21 16:19:24', '2025-04-21 16:19:24'),
(306, 'App\\Models\\UserInvitation', 307, '6418190a-75ed-4b21-97e3-58ce49dcf392', 'qr', '1745241575', '1745241575.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 12, '2025-04-21 16:19:35', '2025-04-21 16:19:35'),
(307, 'App\\Models\\UserInvitation', 307, '476759b3-1287-4cb7-baa4-8c5a5532a1f7', 'qr', '1745242288', '1745242288.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 13, '2025-04-21 16:31:28', '2025-04-21 16:31:28'),
(308, 'App\\Models\\UserInvitation', 307, '79154443-96e6-458d-8795-3007d61c7cfb', 'qr', '1745242290', '1745242290.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 14, '2025-04-21 16:31:30', '2025-04-21 16:31:30'),
(309, 'App\\Models\\UserInvitation', 313, '00e6ac5b-5b3f-46fe-b677-16c6b6186f1c', 'qr', '1745245193', '1745245193.png', 'image/png', 'public', 'public', 33519, '[]', '[]', '[]', '[]', 1, '2025-04-21 17:19:53', '2025-04-21 17:19:53'),
(310, 'App\\Models\\UserInvitation', 307, '02d920d0-c645-43d5-9031-3969a89a93f4', 'qr', '1745246876', '1745246876.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 15, '2025-04-21 17:47:56', '2025-04-21 17:47:56'),
(311, 'App\\Models\\UserInvitation', 307, '647bd7ed-689c-4ff1-9f11-8bc891596ee2', 'qr', '1745246878', '1745246878.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 16, '2025-04-21 17:47:58', '2025-04-21 17:47:58'),
(312, 'App\\Models\\UserInvitation', 307, '678525b2-aa9b-4ad3-8252-bdedce5424aa', 'qr', '1745246955', '1745246955.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 17, '2025-04-21 17:49:15', '2025-04-21 17:49:15'),
(313, 'App\\Models\\UserInvitation', 307, 'ae289184-4af5-44b8-ac9d-698252c5bb5e', 'qr', '1745246956', '1745246956.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 18, '2025-04-21 17:49:16', '2025-04-21 17:49:16'),
(314, 'App\\Models\\UserInvitation', 307, '815d1e64-72c3-4be5-b926-d56c24029304', 'qr', '1745248486', '1745248486.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 19, '2025-04-21 18:14:46', '2025-04-21 18:14:46'),
(315, 'App\\Models\\UserInvitation', 307, '7e74fb7e-5833-4844-802c-79a7fed76ee4', 'qr', '1745248488', '1745248488.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 20, '2025-04-21 18:14:48', '2025-04-21 18:14:48'),
(317, 'App\\Models\\UserInvitation', 314, 'b8b304e0-5aa1-4176-97f1-84bb2c7ce9e5', 'qr', '1745340213', '1745340213.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-22 19:43:33', '2025-04-22 19:43:33'),
(318, 'App\\Models\\UserInvitation', 314, 'c295169f-1f2b-4346-afdd-35cd3d00fe06', 'qr', '1745340214', '1745340214.jpg', 'image/jpeg', 'public', 'public', 22031, '[]', '[]', '[]', '[]', 3, '2025-04-22 19:43:34', '2025-04-22 19:43:34'),
(320, 'App\\Models\\UserInvitation', 315, '2d08e943-efe8-469f-a530-041d8dcafdc2', 'qr', '1745340418', '1745340418.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-22 19:46:58', '2025-04-22 19:46:58'),
(321, 'App\\Models\\UserInvitation', 315, 'd3601802-7672-413a-9121-4835e8e16a4b', 'qr', '1745340419', '1745340419.jpg', 'image/jpeg', 'public', 'public', 22031, '[]', '[]', '[]', '[]', 3, '2025-04-22 19:46:59', '2025-04-22 19:46:59'),
(323, 'App\\Models\\UserInvitation', 316, '9e67cb10-8856-4826-9b3f-bd447745479e', 'qr', '1745340473', '1745340473.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-22 19:47:53', '2025-04-22 19:47:53'),
(324, 'App\\Models\\UserInvitation', 316, '1ac6492b-16d5-4a53-9e2a-e12d3ab6eb21', 'qr', '1745340475', '1745340475.jpg', 'image/jpeg', 'public', 'public', 22031, '[]', '[]', '[]', '[]', 3, '2025-04-22 19:47:55', '2025-04-22 19:47:55'),
(326, 'App\\Models\\UserInvitation', 317, 'dd385ea9-943f-46b7-80b2-4a42a2e5e146', 'qr', '1745340889', '1745340889.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-22 19:54:49', '2025-04-22 19:54:49'),
(328, 'App\\Models\\UserInvitation', 318, '41d45bec-ecec-4d0e-beaa-84f718fb4a54', 'qr', '1745341137', '1745341137.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-22 19:58:57', '2025-04-22 19:58:57'),
(330, 'App\\Models\\UserInvitation', 319, 'b4f1d80a-f612-4597-a954-e08c3111e432', 'qr', '1745341205', '1745341205.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-22 20:00:05', '2025-04-22 20:00:05'),
(331, 'App\\Models\\UserInvitation', 307, 'e57b793d-703a-431c-bf95-a8f84db94f06', 'qr', '1745342128', '1745342128.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 21, '2025-04-22 20:15:28', '2025-04-22 20:15:28'),
(332, 'App\\Models\\UserInvitation', 307, '27fd9146-552e-4dea-a57c-b88e6377f76f', 'qr', '1745342129', '1745342129.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 22, '2025-04-22 20:15:29', '2025-04-22 20:15:29'),
(333, 'App\\Models\\UserInvitation', 307, '04f4a3c6-d8da-488a-bc04-4b6895898700', 'qr', '1745342186', '1745342186.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 23, '2025-04-22 20:16:26', '2025-04-22 20:16:26'),
(334, 'App\\Models\\UserInvitation', 307, '71e021e5-7e5c-43ab-9e2e-42fcf583dca2', 'qr', '1745342683', '1745342683.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 24, '2025-04-22 20:24:44', '2025-04-22 20:24:44'),
(335, 'App\\Models\\UserInvitation', 307, 'f589c28d-fbd1-4f1b-8a04-250e62217f2e', 'qr', '1745342727', '1745342727.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 25, '2025-04-22 20:25:27', '2025-04-22 20:25:27'),
(336, 'App\\Models\\UserInvitation', 307, 'dd2bd3da-2bda-48dd-b1fa-7df6c05c5b78', 'qr', '1745342775', '1745342775.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 26, '2025-04-22 20:26:15', '2025-04-22 20:26:15'),
(337, 'App\\Models\\UserInvitation', 307, '8bd54a5b-3e05-4442-8ab7-559b53c80ab6', 'qr', '1745342977', '1745342977.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 27, '2025-04-22 20:29:38', '2025-04-22 20:29:38'),
(338, 'App\\Models\\UserInvitation', 307, '76a0f472-befd-4f97-ad08-eaa9fa9a3172', 'qr', '1745343147', '1745343147.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 28, '2025-04-22 20:32:27', '2025-04-22 20:32:27'),
(339, 'App\\Models\\UserInvitation', 307, 'ba35daf5-3743-4d74-8a4c-d3a15a55c44d', 'qr', '1745344321', '1745344321.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 29, '2025-04-22 20:52:01', '2025-04-22 20:52:01'),
(340, 'App\\Models\\UserInvitation', 307, 'd8c0209b-1ccb-4204-8545-5526db27b14d', 'qr', '1745344418', '1745344418.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 30, '2025-04-22 20:53:38', '2025-04-22 20:53:38'),
(341, 'App\\Models\\UserInvitation', 307, 'd867770e-5e5a-41c1-bc1e-b3458d04aca8', 'qr', '1745344441', '1745344441.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 31, '2025-04-22 20:54:01', '2025-04-22 20:54:01'),
(342, 'App\\Models\\UserInvitation', 307, '88970482-1dda-44ff-9d21-36e790ba9aee', 'qr', '1745344496', '1745344496.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 32, '2025-04-22 20:54:56', '2025-04-22 20:54:56'),
(343, 'App\\Models\\UserInvitation', 307, '92d0b7f2-83b8-44a3-925a-23dac18fb095', 'qr', '1745344498', '1745344498.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 33, '2025-04-22 20:54:58', '2025-04-22 20:54:58'),
(344, 'App\\Models\\UserInvitation', 307, 'f5e1bdb6-028c-4f36-b6f9-7854974da55b', 'qr', '1745345596', '1745345596.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 34, '2025-04-22 21:13:17', '2025-04-22 21:13:17'),
(345, 'App\\Models\\UserInvitation', 307, 'd90ae329-784a-431b-a1f1-7920fd9c374d', 'qr', '1745345598', '1745345598.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 35, '2025-04-22 21:13:18', '2025-04-22 21:13:18'),
(347, 'App\\Models\\UserInvitation', 271, '4bf2d190-91a2-4ce9-94f9-b2d51671bc41', 'qr', '1745347421', '1745347421.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 2, '2025-04-22 21:43:41', '2025-04-22 21:43:41'),
(348, 'App\\Models\\UserInvitation', 271, '086d7b53-9e47-4043-95bb-f48d66308aea', 'qr', '1745347428', '1745347428.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 3, '2025-04-22 21:43:48', '2025-04-22 21:43:48'),
(349, 'App\\Models\\UserInvitation', 271, '50230c9a-facd-46d6-99c2-79105b17ad84', 'qr', '1745347496', '1745347496.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 4, '2025-04-22 21:44:56', '2025-04-22 21:44:56'),
(350, 'App\\Models\\UserInvitation', 271, '6ccfd092-e04c-43a1-bc86-74ea46f38334', 'qr', '1745351765', '1745351765.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 5, '2025-04-22 22:56:05', '2025-04-22 22:56:05'),
(353, 'App\\Models\\UserInvitation', 323, 'b921b175-24c7-4e92-9162-d658e1f02dce', 'qr', '1745352795', '1745352795.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 2, '2025-04-22 23:13:15', '2025-04-22 23:13:15'),
(355, 'App\\Models\\UserInvitation', 324, 'd57658a6-c27d-49ed-8d95-000de259191a', 'qr', '1745353029', '1745353029.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-22 23:17:09', '2025-04-22 23:17:09'),
(357, 'App\\Models\\UserInvitation', 325, '2b7044a0-48bd-4a2b-8d49-4bcc93959368', 'qr', '1745353392', '1745353392.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-22 23:23:12', '2025-04-22 23:23:12'),
(359, 'App\\Models\\UserInvitation', 326, 'effc7662-61e8-46e9-b124-ab6d524c2ee6', 'qr', '1745353433', '1745353433.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-22 23:23:53', '2025-04-22 23:23:53'),
(360, 'App\\Models\\UserInvitation', 323, '7b15138c-23bd-4923-a985-1a9d6cd9fc37', 'qr', '1745353490', '1745353490.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 3, '2025-04-22 23:24:50', '2025-04-22 23:24:50'),
(361, 'App\\Models\\UserInvitation', 323, '567f2a03-d7c5-4200-883d-c4dd5f3cd68c', 'qr', '1745353524', '1745353524.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 4, '2025-04-22 23:25:24', '2025-04-22 23:25:24'),
(362, 'App\\Models\\UserInvitation', 323, '354a99ab-ac23-4e7a-9b73-d4e780921a2d', 'qr', '1745353575', '1745353575.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 5, '2025-04-22 23:26:15', '2025-04-22 23:26:15'),
(363, 'App\\Models\\UserInvitation', 323, '99378817-9c04-4488-afee-62bf2af70a20', 'qr', '1745353696', '1745353696.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 6, '2025-04-22 23:28:16', '2025-04-22 23:28:16'),
(364, 'App\\Models\\UserInvitation', 323, '13764e98-09e4-4fc2-9baf-af5825a823ec', 'qr', '1745353725', '1745353725.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 7, '2025-04-22 23:28:45', '2025-04-22 23:28:45'),
(365, 'App\\Models\\UserInvitation', 323, '8e9e798e-4a32-4add-a7a8-fb353be366f7', 'qr', '1745355924', '1745355924.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 8, '2025-04-23 00:05:24', '2025-04-23 00:05:24'),
(366, 'App\\Models\\UserInvitation', 323, 'b7f61dff-5948-411b-a084-e7cd7e81125e', 'qr', '1745356055', '1745356055.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 9, '2025-04-23 00:07:35', '2025-04-23 00:07:35'),
(367, 'App\\Models\\UserInvitation', 323, 'be575785-c671-44b2-b2b8-157337e3fc9c', 'qr', '1745356055', '1745356055.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 10, '2025-04-23 00:07:35', '2025-04-23 00:07:35'),
(368, 'App\\Models\\UserInvitation', 323, '8c44102a-10d3-41a7-8f99-6f957158ec39', 'qr', '1745356191', '1745356191.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 11, '2025-04-23 00:09:51', '2025-04-23 00:09:51'),
(369, 'App\\Models\\UserInvitation', 323, '36135cb8-4d8a-486e-8f7f-0250a8b2e765', 'qr', '1745356191', '1745356191.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 12, '2025-04-23 00:09:51', '2025-04-23 00:09:51'),
(370, 'App\\Models\\UserInvitation', 323, '12a6a45d-6d50-43f4-8f8d-e8494914dba8', 'qr', '1745358990', '1745358990.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 13, '2025-04-23 00:56:30', '2025-04-23 00:56:30'),
(371, 'App\\Models\\UserInvitation', 323, '6f10894c-3e8d-4650-a5e4-26b2902b09a4', 'qr', '1745358990', '1745358990.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 14, '2025-04-23 00:56:30', '2025-04-23 00:56:30'),
(372, 'App\\Models\\UserInvitation', 323, 'acf466e2-a895-41e4-88ce-908e96a0578d', 'qr', '1745359039', '1745359039.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 15, '2025-04-23 00:57:20', '2025-04-23 00:57:20'),
(373, 'App\\Models\\UserInvitation', 323, '5885bba1-8ed0-4172-bd46-86dbfc50217d', 'qr', '1745359040', '1745359040.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 16, '2025-04-23 00:57:20', '2025-04-23 00:57:20'),
(374, 'App\\Models\\UserInvitation', 323, '47f3c67f-a1ab-459c-80bd-df4ed17a4a12', 'qr', '1745359080', '1745359080.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 17, '2025-04-23 00:58:00', '2025-04-23 00:58:00'),
(375, 'App\\Models\\UserInvitation', 323, '38ebff26-f8b8-437a-9435-fa227e355d2b', 'qr', '1745359080', '1745359080.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 18, '2025-04-23 00:58:00', '2025-04-23 00:58:00'),
(376, 'App\\Models\\UserInvitation', 323, '7acb51c9-fada-45b7-9341-e181654ee7f3', 'qr', '1745359168', '1745359168.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 19, '2025-04-23 00:59:28', '2025-04-23 00:59:28'),
(377, 'App\\Models\\UserInvitation', 323, '9da4f677-c8ec-4c12-b69f-ac1a987d2ee6', 'qr', '1745359168', '1745359168.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 20, '2025-04-23 00:59:28', '2025-04-23 00:59:28'),
(378, 'App\\Models\\UserInvitation', 323, '4d4c1e3d-e76e-461c-b580-7bda2cdbacbb', 'qr', '1745363378', '1745363378.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 21, '2025-04-23 02:09:38', '2025-04-23 02:09:38'),
(379, 'App\\Models\\UserInvitation', 323, '439e9bb5-e54e-4dc0-8a99-bcd75f28cdea', 'qr', '1745363378', '1745363378.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 22, '2025-04-23 02:09:38', '2025-04-23 02:09:38'),
(380, 'App\\Models\\UserInvitation', 323, '811db5db-186f-45b6-bc07-05c638933616', 'qr', '1745363609', '1745363609.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 23, '2025-04-23 02:13:29', '2025-04-23 02:13:29'),
(381, 'App\\Models\\UserInvitation', 323, '31eeae9e-f6a4-4d61-9db8-e8167bca7124', 'qr', '1745363609', '1745363609.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 24, '2025-04-23 02:13:29', '2025-04-23 02:13:29'),
(382, 'App\\Models\\UserInvitation', 323, 'd5486d2c-9632-41f6-84e7-85160ced4f62', 'qr', '1745363802', '1745363802.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 25, '2025-04-23 02:16:42', '2025-04-23 02:16:42'),
(383, 'App\\Models\\UserInvitation', 323, 'b4b404a7-22d7-4dbe-890c-d4012edf84f7', 'qr', '1745363802', '1745363802.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 26, '2025-04-23 02:16:42', '2025-04-23 02:16:42'),
(384, 'App\\Models\\UserInvitation', 323, '41586184-c316-4186-a350-6d8de443c25e', 'qr', '1745363956', '1745363956.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 27, '2025-04-23 02:19:16', '2025-04-23 02:19:16'),
(385, 'App\\Models\\UserInvitation', 323, 'a9e6975c-2074-416a-b245-92d74e45fbf0', 'qr', '1745363956', '1745363956.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 28, '2025-04-23 02:19:16', '2025-04-23 02:19:16'),
(386, 'App\\Models\\UserInvitation', 323, 'c1e5fd85-2a96-4bc9-b774-55c00cf7f6ca', 'qr', '1745364012', '1745364012.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 29, '2025-04-23 02:20:12', '2025-04-23 02:20:12'),
(387, 'App\\Models\\UserInvitation', 323, '4cf83f89-18ef-4a3e-a220-37d361eb7134', 'qr', '1745364012', '1745364012.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 30, '2025-04-23 02:20:12', '2025-04-23 02:20:12'),
(388, 'App\\Models\\UserInvitation', 323, 'db049fe2-05f9-4fff-92a3-ca7ecf9212fc', 'qr', '1745364186', '1745364186.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 31, '2025-04-23 02:23:06', '2025-04-23 02:23:06'),
(389, 'App\\Models\\UserInvitation', 323, '91125806-eb21-4df6-bfe3-2cfd37e56fdf', 'qr', '1745364186', '1745364186.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 32, '2025-04-23 02:23:06', '2025-04-23 02:23:06'),
(390, 'App\\Models\\UserInvitation', 323, '88711ec6-aa20-458b-be96-3c374a8676b8', 'qr', '1745364261', '1745364261.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 33, '2025-04-23 02:24:21', '2025-04-23 02:24:21'),
(391, 'App\\Models\\UserInvitation', 323, '9a99df1c-fade-4cc5-acad-7031bc58fb94', 'qr', '1745364261', '1745364261.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 34, '2025-04-23 02:24:21', '2025-04-23 02:24:21'),
(392, 'App\\Models\\UserInvitation', 323, 'f29e43dc-c2f4-4ef9-87c3-af877bbb368c', 'qr', '1745364434', '1745364434.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 35, '2025-04-23 02:27:14', '2025-04-23 02:27:14'),
(393, 'App\\Models\\UserInvitation', 323, 'd1ecc359-7d5b-47b4-aef2-1c0e1a5f5b0a', 'qr', '1745364434', '1745364434.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 36, '2025-04-23 02:27:14', '2025-04-23 02:27:14'),
(394, 'App\\Models\\UserInvitation', 323, 'c01d2f47-e64f-4ee0-a8b9-ede933ee83ac', 'qr', '1745364609', '1745364609.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 37, '2025-04-23 02:30:09', '2025-04-23 02:30:09'),
(395, 'App\\Models\\UserInvitation', 323, 'd6d5edf8-4ee1-4eb0-baf4-f8bbec3d8e9f', 'qr', '1745364609', '1745364609.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 38, '2025-04-23 02:30:09', '2025-04-23 02:30:09'),
(396, 'App\\Models\\UserInvitation', 323, 'a5b9ca8d-c75d-43f0-89f6-ef043a8fb914', 'qr', '1745367475', '1745367475.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 39, '2025-04-23 03:17:55', '2025-04-23 03:17:55'),
(397, 'App\\Models\\UserInvitation', 323, '4901b58b-77e3-49c5-882a-068c96e177a2', 'qr', '1745367475', '1745367475.jpg', 'image/jpeg', 'public', 'public', 21900, '[]', '[]', '[]', '[]', 40, '2025-04-23 03:17:55', '2025-04-23 03:17:55'),
(399, 'App\\Models\\UserInvitation', 327, 'be5cc7d5-25ef-4f2d-96d9-fcd93b311e05', 'qr', '1745425685', '1745425685.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-23 19:28:05', '2025-04-23 19:28:05'),
(401, 'App\\Models\\UserInvitation', 328, '2e795886-d324-4398-9144-88f9a369bb1c', 'qr', '1745426274', '1745426274.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-23 19:37:54', '2025-04-23 19:37:54'),
(403, 'App\\Models\\UserInvitation', 329, '1f271412-7403-4797-b469-de6f6b2268a3', 'qr', '1745428635', '1745428635.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-23 20:17:15', '2025-04-23 20:17:15'),
(405, 'App\\Models\\UserInvitation', 331, 'c85ffb2d-a470-4bfa-923e-d6af54cbbd1f', 'userInvitation', 'معاذ المشعلي-2', 'معاذ-المشعلي-2.pdf', 'application/pdf', 'public', 'public', 1046772, '[]', '[]', '[]', '[]', 1, '2025-04-23 21:03:34', '2025-04-23 21:03:34'),
(406, 'App\\Models\\UserInvitation', 332, 'bf4ef0e9-704d-4a9c-b9e5-b57f95107a54', 'userInvitation', 'معاذ المشعلي-2', 'معاذ-المشعلي-2.pdf', 'application/pdf', 'public', 'public', 1046772, '[]', '[]', '[]', '[]', 1, '2025-04-23 21:04:15', '2025-04-23 21:04:15'),
(413, 'App\\Models\\UserInvitation', 338, 'c46c890b-f190-41f9-a76d-77f1eaf9556b', 'qr', '1745436601', '1745436601.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-23 22:30:01', '2025-04-23 22:30:01'),
(415, 'App\\Models\\UserInvitation', 339, '73eeac11-80a6-44c0-8c55-d5731e583974', 'qr', '1745437407', '1745437407.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-23 22:43:27', '2025-04-23 22:43:27'),
(417, 'App\\Models\\UserInvitation', 340, 'a85be3ea-013d-4d61-8171-c63bcaa38156', 'qr', '1745437797', '1745437797.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-23 22:49:57', '2025-04-23 22:49:57'),
(424, 'App\\Models\\UserInvitation', 346, 'fdaca135-f1ab-4529-935b-3951492c5117', 'qr', '1745439574', '1745439574.jpg', 'image/jpeg', 'public', 'public', 21847, '[]', '[]', '[]', '[]', 2, '2025-04-23 23:19:34', '2025-04-23 23:19:34'),
(426, 'App\\Models\\UserInvitation', 347, 'b4d8773a-0b60-4a62-b267-3de891fecc77', 'qr', '1745439874', '1745439874.jpg', 'image/jpeg', 'public', 'public', 21992, '[]', '[]', '[]', '[]', 2, '2025-04-23 23:24:34', '2025-04-23 23:24:34'),
(427, 'App\\Models\\UserInvitation', 347, 'b4ca01a1-1531-4c9d-9aa3-198a130180a4', 'qr', '1745439874', '1745439874.jpg', 'image/jpeg', 'public', 'public', 22040, '[]', '[]', '[]', '[]', 3, '2025-04-23 23:24:34', '2025-04-23 23:24:34'),
(428, 'App\\Models\\UserInvitation', 347, '2afaaa26-8b11-48e6-912c-fa7fd86ad82f', 'qr', '1745439874', '1745439874.jpg', 'image/jpeg', 'public', 'public', 22077, '[]', '[]', '[]', '[]', 4, '2025-04-23 23:24:34', '2025-04-23 23:24:34'),
(429, 'App\\Models\\UserInvitation', 347, '25d76558-4e7a-4671-b6c0-1cb7faab89e2', 'qr', '1745439874', '1745439874.jpg', 'image/jpeg', 'public', 'public', 21979, '[]', '[]', '[]', '[]', 5, '2025-04-23 23:24:34', '2025-04-23 23:24:34'),
(430, 'App\\Models\\UserInvitation', 347, '2bd8e36b-27e5-4fb9-b78e-2c2c7771f36b', 'qr', '1745439874', '1745439874.jpg', 'image/jpeg', 'public', 'public', 22053, '[]', '[]', '[]', '[]', 6, '2025-04-23 23:24:34', '2025-04-23 23:24:34'),
(431, 'App\\Models\\UserInvitation', 347, '182ea840-a8d4-440f-80ec-a61281e02ad0', 'qr', '1745439874', '1745439874.jpg', 'image/jpeg', 'public', 'public', 22052, '[]', '[]', '[]', '[]', 7, '2025-04-23 23:24:34', '2025-04-23 23:24:34'),
(432, 'App\\Models\\UserInvitation', 348, '4190a859-084c-4f4f-a043-339e27f93da3', 'qr', '1745442808', '1745442808.png', 'image/png', 'public', 'public', 26772, '[]', '[]', '[]', '[]', 1, '2025-04-24 00:13:28', '2025-04-24 00:13:28'),
(433, 'App\\Models\\UserInvitation', 348, '62e271de-ded4-4bd4-8260-a3d3a7a3c7ea', 'qr', '1745443026', '1745443026.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 2, '2025-04-24 00:17:06', '2025-04-24 00:17:06'),
(435, 'App\\Models\\UserInvitation', 349, 'ee344648-d52c-47da-9896-c5e314600909', 'qr', '1745449402', '1745449402.png', 'image/png', 'public', 'public', 17943, '[]', '[]', '[]', '[]', 2, '2025-04-24 02:03:22', '2025-04-24 02:03:22'),
(436, 'App\\Models\\UserInvitation', 350, '4210364d-124d-47e1-8186-1a2174903889', 'userInvitation', 'Screenshot_20240310-130820', 'Screenshot_20240310-130820.jpg', 'image/jpeg', 'public', 'public', 59567, '[]', '[]', '[]', '[]', 1, '2025-04-24 02:05:09', '2025-04-24 02:05:09'),
(437, 'App\\Models\\UserInvitation', 350, '41223410-a2c7-416f-8309-afda55b1c963', 'qr', '1745449510', '1745449510.png', 'image/png', 'public', 'public', 19689, '[]', '[]', '[]', '[]', 2, '2025-04-24 02:05:10', '2025-04-24 02:05:10'),
(438, 'App\\Models\\UserInvitation', 351, '2bb33072-a197-4709-ad5e-06938cc2353d', 'userInvitation', 'Screenshot_20231002-101841', 'Screenshot_20231002-101841.jpg', 'image/jpeg', 'public', 'public', 497164, '[]', '[]', '[]', '[]', 1, '2025-04-24 02:08:43', '2025-04-24 02:08:43'),
(439, 'App\\Models\\UserInvitation', 351, '3c0300a5-aaac-45d4-94a9-5779671eb240', 'qr', '1745449725', '1745449725.png', 'image/png', 'public', 'public', 19053, '[]', '[]', '[]', '[]', 2, '2025-04-24 02:08:45', '2025-04-24 02:08:45'),
(440, 'App\\Models\\UserInvitation', 352, '43769975-8a5b-4936-bb6c-3fc0f2903e8b', 'userInvitation', 'Screenshot_20230920-211342', 'Screenshot_20230920-211342.jpg', 'image/jpeg', 'public', 'public', 524336, '[]', '[]', '[]', '[]', 1, '2025-04-24 03:06:57', '2025-04-24 03:06:57'),
(441, 'App\\Models\\UserInvitation', 352, 'f7cffaa1-b664-4565-b8e6-09c3ea231f48', 'qr', '1745453220', '1745453220.png', 'image/png', 'public', 'public', 16947, '[]', '[]', '[]', '[]', 2, '2025-04-24 03:07:00', '2025-04-24 03:07:00'),
(442, 'App\\Models\\UserInvitation', 353, '294e4440-f259-4423-97ec-a3a062c09528', 'userInvitation', 'Screenshot_20230920-211342', 'Screenshot_20230920-211342.jpg', 'image/jpeg', 'public', 'public', 524336, '[]', '[]', '[]', '[]', 1, '2025-04-24 03:09:46', '2025-04-24 03:09:46'),
(443, 'App\\Models\\UserInvitation', 353, '5105e6bb-0f1a-4283-823f-37a65701cf76', 'qr', '1745453388', '1745453388.png', 'image/png', 'public', 'public', 16335, '[]', '[]', '[]', '[]', 2, '2025-04-24 03:09:48', '2025-04-24 03:09:48'),
(444, 'App\\Models\\UserInvitation', 354, '6036cd48-196d-43fb-a7ea-25c54bd5fcfa', 'userInvitation', 'Screenshot_20230920-211342', 'Screenshot_20230920-211342.jpg', 'image/jpeg', 'public', 'public', 524336, '[]', '[]', '[]', '[]', 1, '2025-04-24 03:13:28', '2025-04-24 03:13:28'),
(445, 'App\\Models\\UserInvitation', 354, '42ce3cfb-fd1a-4e29-8858-6e471dd71c1b', 'qr', '1745453610', '1745453610.png', 'image/png', 'public', 'public', 17565, '[]', '[]', '[]', '[]', 2, '2025-04-24 03:13:30', '2025-04-24 03:13:30'),
(446, 'App\\Models\\UserInvitation', 355, 'a728b9dc-0db7-495c-a6a4-028a145635a6', 'userInvitation', 'Screenshot_20230920-211342', 'Screenshot_20230920-211342.jpg', 'image/jpeg', 'public', 'public', 524336, '[]', '[]', '[]', '[]', 1, '2025-04-24 03:13:56', '2025-04-24 03:13:56'),
(447, 'App\\Models\\UserInvitation', 355, 'fbd1ad83-3146-4d9e-81c5-18e80f27796d', 'qr', '1745453637', '1745453637.png', 'image/png', 'public', 'public', 17063, '[]', '[]', '[]', '[]', 2, '2025-04-24 03:13:57', '2025-04-24 03:13:57'),
(448, 'App\\Models\\UserInvitation', 351, 'd642eb7e-be6e-4ced-917c-d17ed4d74219', 'qr', '1745667458', '1745667458.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 3, '2025-04-26 14:37:38', '2025-04-26 14:37:38'),
(454, 'App\\Models\\UserInvitation', 362, '9ecf0b82-1d5e-4e56-8905-47cc10b86d5f', 'qr', '1745717084', '1745717084.png', 'image/png', 'public', 'public', 17321, '[]', '[]', '[]', '[]', 2, '2025-04-27 04:24:44', '2025-04-27 04:24:44'),
(456, 'App\\Models\\UserInvitation', 363, '8b141a86-123d-4944-bdf0-e2824e522845', 'qr', '1745842678', '1745842678.png', 'image/png', 'public', 'public', 22733, '[]', '[]', '[]', '[]', 2, '2025-04-28 15:17:58', '2025-04-28 15:17:58'),
(457, 'App\\Models\\UserInvitation', 364, 'c3c1e314-6e3a-4d8e-8820-49b1ceb50fdb', 'userInvitation', '93 sar', '93-sar.png', 'image/png', 'public', 'public', 48640, '[]', '[]', '[]', '[]', 1, '2025-04-29 04:25:32', '2025-04-29 04:25:32'),
(458, 'App\\Models\\UserInvitation', 364, '81bf863e-aee6-4469-a666-5716b549f0dc', 'qr', '1745889935', '1745889935.png', 'image/png', 'public', 'public', 17716, '[]', '[]', '[]', '[]', 2, '2025-04-29 04:25:35', '2025-04-29 04:25:35'),
(459, 'App\\Models\\UserInvitation', 365, 'c8b6fdd9-114b-4cc8-825e-438165e37645', 'userInvitation', 'معاذ المشعلي-2', 'معاذ-المشعلي-2.pdf', 'application/pdf', 'public', 'public', 1046772, '[]', '[]', '[]', '[]', 1, '2025-04-29 14:02:21', '2025-04-29 14:02:21'),
(460, 'App\\Models\\UserInvitation', 365, '66644f8c-04bb-4191-ac17-7b70ff90eb28', 'qr', '1745924541', '1745924541.png', 'image/png', 'public', 'public', 26943, '[]', '[]', '[]', '[]', 2, '2025-04-29 14:02:21', '2025-04-29 14:02:21'),
(461, 'App\\Models\\UserInvitation', 366, '251832dd-8216-4a47-bf26-21e9b249ab7c', 'userInvitation', 'presentation', 'presentation.pdf', 'application/pdf', 'public', 'public', 8146895, '[]', '[]', '[]', '[]', 1, '2025-04-29 14:46:02', '2025-04-29 14:46:02'),
(462, 'App\\Models\\UserInvitation', 366, '113149b5-9ec3-49ca-975e-a33aa8a07a2b', 'qr', '1745927162', '1745927162.png', 'image/png', 'public', 'public', 26544, '[]', '[]', '[]', '[]', 2, '2025-04-29 14:46:02', '2025-04-29 14:46:02'),
(463, 'App\\Models\\UserInvitation', 367, 'f6080847-813d-45f0-8a60-49b98326e50b', 'userInvitation', '93 sar', '93-sar.png', 'image/png', 'public', 'public', 48640, '[]', '[]', '[]', '[]', 1, '2025-04-30 00:02:11', '2025-04-30 00:02:11'),
(464, 'App\\Models\\UserInvitation', 367, '5e8b6cad-bcf5-4410-bb03-f44a6517c455', 'qr', '1745960535', '1745960535.png', 'image/png', 'public', 'public', 18272, '[]', '[]', '[]', '[]', 2, '2025-04-30 00:02:15', '2025-04-30 00:02:15'),
(465, 'App\\Models\\UserInvitation', 351, 'f6838f07-668d-4dd0-b11a-f33833e56a68', 'qr', '1746055133', '1746055133.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 4, '2025-05-01 02:18:53', '2025-05-01 02:18:53'),
(466, 'App\\Models\\UserInvitation', 351, '0b988ca2-93ae-4af1-9a86-9f0aa09eb359', 'qr', '1746055166', '1746055166.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 5, '2025-05-01 02:19:26', '2025-05-01 02:19:26'),
(467, 'App\\Models\\UserInvitation', 351, 'f645e1cd-6fd2-49db-a503-c5d9ae91fc62', 'qr', '1746055426', '1746055426.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 6, '2025-05-01 02:23:46', '2025-05-01 02:23:46'),
(469, 'App\\Models\\UserInvitation', 368, 'c0fe7cec-df49-4256-a839-31567d06517b', 'qr', '1746055554', '1746055554.jpg', 'image/jpeg', 'public', 'public', 21992, '[]', '[]', '[]', '[]', 2, '2025-05-01 02:25:54', '2025-05-01 02:25:54'),
(470, 'App\\Models\\UserInvitation', 368, '61302a4c-a6e7-4fba-98c6-066206be2492', 'qr', '1746055554', '1746055554.jpg', 'image/jpeg', 'public', 'public', 22040, '[]', '[]', '[]', '[]', 3, '2025-05-01 02:25:54', '2025-05-01 02:25:54'),
(471, 'App\\Models\\UserInvitation', 368, '0217ac05-0689-4499-ad3f-b58687c517c9', 'qr', '1746055554', '1746055554.jpg', 'image/jpeg', 'public', 'public', 22077, '[]', '[]', '[]', '[]', 4, '2025-05-01 02:25:54', '2025-05-01 02:25:54'),
(472, 'App\\Models\\UserInvitation', 368, 'be9215a0-edd0-404b-b5e5-cfae26f4e324', 'qr', '1746055554', '1746055554.jpg', 'image/jpeg', 'public', 'public', 21979, '[]', '[]', '[]', '[]', 5, '2025-05-01 02:25:54', '2025-05-01 02:25:54'),
(473, 'App\\Models\\UserInvitation', 368, '2e3d73b4-d50b-4794-aa1b-ab3e7a2ba8ad', 'qr', '1746055554', '1746055554.jpg', 'image/jpeg', 'public', 'public', 22053, '[]', '[]', '[]', '[]', 6, '2025-05-01 02:25:54', '2025-05-01 02:25:54'),
(474, 'App\\Models\\UserInvitation', 368, 'b2c34c64-fb52-469b-af23-ff46edcc58c4', 'qr', '1746055554', '1746055554.jpg', 'image/jpeg', 'public', 'public', 22052, '[]', '[]', '[]', '[]', 7, '2025-05-01 02:25:54', '2025-05-01 02:25:54'),
(475, 'App\\Models\\UserInvitation', 351, 'c6dbb593-7277-4734-a812-2f242dd8e583', 'qr', '1746055620', '1746055620.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 7, '2025-05-01 02:27:00', '2025-05-01 02:27:00'),
(476, 'App\\Models\\UserInvitation', 351, 'b6cdf1b4-a415-4d30-9d31-918933ee4e2c', 'qr', '1746055786', '1746055786.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 8, '2025-05-01 02:29:46', '2025-05-01 02:29:46'),
(477, 'App\\Models\\UserInvitation', 351, 'bba656db-e80a-418c-9705-2e75053d253a', 'qr', '1746086628', '1746086628.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 9, '2025-05-01 11:03:48', '2025-05-01 11:03:48'),
(478, 'App\\Models\\UserInvitation', 351, '1e9b82e5-9fcd-4427-a3d8-ea58956c8c5f', 'qr', '1746086663', '1746086663.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 10, '2025-05-01 11:04:23', '2025-05-01 11:04:23'),
(479, 'App\\Models\\UserInvitation', 351, 'e3f76267-8dc8-4833-923f-c248ff708410', 'qr', '1746087200', '1746087200.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 11, '2025-05-01 11:13:20', '2025-05-01 11:13:20'),
(480, 'App\\Models\\UserInvitation', 363, '13da37bd-3b46-4790-9230-004ae72178a5', 'qr', '1746087322', '1746087322.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 3, '2025-05-01 11:15:22', '2025-05-01 11:15:22'),
(481, 'App\\Models\\UserInvitation', 363, '2f603a29-5970-4d84-89fa-6473e106ec34', 'qr', '1746087428', '1746087428.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 4, '2025-05-01 11:17:08', '2025-05-01 11:17:08'),
(482, 'App\\Models\\UserInvitation', 363, '48aa2281-85c0-493b-8b3a-98e2e840ecec', 'qr', '1746087470', '1746087470.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 5, '2025-05-01 11:17:50', '2025-05-01 11:17:50'),
(484, 'App\\Models\\UserInvitation', 369, '7623538b-b2b4-4555-901c-caea85325f3a', 'qr', '1746087578', '1746087578.jpg', 'image/jpeg', 'public', 'public', 21992, '[]', '[]', '[]', '[]', 2, '2025-05-01 11:19:38', '2025-05-01 11:19:38'),
(486, 'App\\Models\\UserInvitation', 370, 'e99c98d7-8366-475b-b5b8-273e6857793c', 'qr', '1746087829', '1746087829.jpg', 'image/jpeg', 'public', 'public', 21992, '[]', '[]', '[]', '[]', 2, '2025-05-01 11:23:49', '2025-05-01 11:23:49'),
(487, 'App\\Models\\UserInvitation', 371, '12cf9c4d-bd2f-4c53-8678-71ec6dc59ccc', 'userInvitation', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 9900, '[]', '[]', '[]', '[]', 1, '2025-05-07 22:34:41', '2025-05-07 22:34:41'),
(488, 'App\\Models\\UserInvitation', 371, '04fc1746-47bc-4678-bbb7-7582fb504b8d', 'qr', '1746646486', '1746646486.png', 'image/png', 'public', 'public', 13188, '[]', '[]', '[]', '[]', 2, '2025-05-07 22:34:46', '2025-05-07 22:34:46'),
(489, 'App\\Models\\UserInvitation', 363, 'ba63b365-b27e-4dca-bfe5-7fc74e4c80c8', 'qr', '1746807736', '1746807736.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 6, '2025-05-09 19:22:16', '2025-05-09 19:22:16'),
(490, 'App\\Models\\UserInvitation', 372, '7d78a891-a544-4ba3-b23e-740a3712fa87', 'userInvitation', 'معاذ المشعلي-2(1)', 'معاذ-المشعلي-2(1).pdf', 'application/pdf', 'public', 'public', 1035938, '[]', '[]', '[]', '[]', 1, '2025-05-11 13:26:22', '2025-05-11 13:26:22'),
(491, 'App\\Models\\UserInvitation', 372, '7d03d451-1ef9-4f4c-a2c6-a007b4746e7f', 'qr', '1746959185', '1746959185.png', 'image/png', 'public', 'public', 26530, '[]', '[]', '[]', '[]', 2, '2025-05-11 13:26:26', '2025-05-11 13:26:26'),
(492, 'App\\Models\\UserInvitation', 373, 'd7e86aa9-2783-4df1-b80a-0f782efd150e', 'userInvitation', 'معاذ المشعلي-2(1)', 'معاذ-المشعلي-2(1).pdf', 'application/pdf', 'public', 'public', 1035938, '[]', '[]', '[]', '[]', 1, '2025-05-11 13:26:30', '2025-05-11 13:26:30'),
(493, 'App\\Models\\UserInvitation', 374, '8ae2e224-29d9-471f-b06b-dc1f0386f3a3', 'userInvitation', 'توزيع مادة - اللغة الإنجليزية', 'توزيع-مادة---اللغة-الإنجليزية.pdf', 'application/pdf', 'public', 'public', 13503536, '[]', '[]', '[]', '[]', 1, '2025-05-11 17:27:43', '2025-05-11 17:27:43'),
(494, 'App\\Models\\UserInvitation', 375, 'a2a97a64-fcb0-4495-8676-310af164e352', 'userInvitation', 'توزيع مادة - اللغة الإنجليزية', 'توزيع-مادة---اللغة-الإنجليزية.pdf', 'application/pdf', 'public', 'public', 13503536, '[]', '[]', '[]', '[]', 1, '2025-05-11 17:28:04', '2025-05-11 17:28:04'),
(495, 'App\\Models\\UserInvitation', 375, '66298058-e888-483c-872e-d8418bba00b0', 'qr', '1746973700', '1746973700.png', 'image/png', 'public', 'public', 17983, '[]', '[]', '[]', '[]', 2, '2025-05-11 17:28:20', '2025-05-11 17:28:20'),
(496, 'App\\Models\\UserInvitation', 375, '02e2ac84-9057-463c-88f7-d191ca6c6f3b', 'qr', '1746973700', '1746973700.png', 'image/png', 'public', 'public', 18054, '[]', '[]', '[]', '[]', 3, '2025-05-11 17:28:20', '2025-05-11 17:28:20'),
(498, 'App\\Models\\UserInvitation', 376, '8db5a4a9-50f9-4412-b420-036bb7bd966d', 'qr', '1747066432', '1747066432.jpg', 'image/jpeg', 'public', 'public', 21992, '[]', '[]', '[]', '[]', 2, '2025-05-12 19:13:52', '2025-05-12 19:13:52'),
(500, 'App\\Models\\UserInvitation', 377, '036ac770-0068-4193-9cd9-f3c4df8fd962', 'qr', '1747066453', '1747066453.jpg', 'image/jpeg', 'public', 'public', 21992, '[]', '[]', '[]', '[]', 2, '2025-05-12 19:14:13', '2025-05-12 19:14:13'),
(502, 'App\\Models\\UserInvitation', 378, '95c9a5b6-3abe-4adf-a219-30644aec3b9a', 'qr', '1747066510', '1747066510.jpg', 'image/jpeg', 'public', 'public', 21992, '[]', '[]', '[]', '[]', 2, '2025-05-12 19:15:10', '2025-05-12 19:15:10'),
(504, 'App\\Models\\UserInvitation', 379, 'bffd9648-cea9-4f58-a572-fc2800390803', 'qr', '1747066548', '1747066548.jpg', 'image/jpeg', 'public', 'public', 21992, '[]', '[]', '[]', '[]', 2, '2025-05-12 19:15:48', '2025-05-12 19:15:48'),
(506, 'App\\Models\\UserInvitation', 380, 'b07924b5-11b7-4c3c-9533-a5a8a88f4189', 'qr', '1747066635', '1747066635.jpg', 'image/jpeg', 'public', 'public', 21992, '[]', '[]', '[]', '[]', 2, '2025-05-12 19:17:15', '2025-05-12 19:17:15'),
(507, 'App\\Models\\UserInvitation', 363, 'a9c03ec1-6594-4cea-9bbf-65bc6e1149f2', 'qr', '1747066731', '1747066731.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 7, '2025-05-12 19:18:51', '2025-05-12 19:18:51'),
(508, 'App\\Models\\UserInvitation', 363, 'd8183b18-1c14-418e-bf65-37259b9eae40', 'qr', '1747067608', '1747067608.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 8, '2025-05-12 19:33:28', '2025-05-12 19:33:28'),
(509, 'App\\Models\\UserInvitation', 363, '2ff9a33d-862e-4f13-ab91-270b9ba53ca7', 'qr', '1747067816', '1747067816.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 9, '2025-05-12 19:36:56', '2025-05-12 19:36:56'),
(511, 'App\\Models\\UserInvitation', 381, '4727b1ef-ad26-4a81-a03b-a32082dc63f3', 'qr', '1747068190', '1747068190.png', 'image/png', 'public', 'public', 22498, '[]', '[]', '[]', '[]', 2, '2025-05-12 19:43:10', '2025-05-12 19:43:10'),
(512, 'App\\Models\\UserInvitation', 381, 'e508ef3a-1647-4bad-a48a-2c6d992cb53d', 'qr', '1747068951', '1747068951.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 3, '2025-05-12 19:55:51', '2025-05-12 19:55:51'),
(513, 'App\\Models\\UserInvitation', 381, 'fec9330c-6b77-4d63-9cf4-f88a6d0fd43c', 'qr', '1747068993', '1747068993.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 4, '2025-05-12 19:56:33', '2025-05-12 19:56:33'),
(514, 'App\\Models\\UserInvitation', 381, '392180bd-3f7d-4e98-9567-6acd1055418a', 'qr', '1747070384', '1747070384.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 5, '2025-05-12 20:19:44', '2025-05-12 20:19:44'),
(515, 'App\\Models\\UserInvitation', 381, 'b56d2b77-3426-4dc4-ba28-cd8595e6a7ec', 'qr', '1747070531', '1747070531.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 6, '2025-05-12 20:22:11', '2025-05-12 20:22:11'),
(516, 'App\\Models\\UserInvitation', 381, '741d35ff-4cae-4c49-9996-29d867b3d73a', 'qr', '1747070862', '1747070862.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 7, '2025-05-12 20:27:42', '2025-05-12 20:27:42'),
(517, 'App\\Models\\UserInvitation', 381, 'c2939623-a8c8-48d8-8b93-07833b4d169b', 'qr', '1747071070', '1747071070.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 8, '2025-05-12 20:31:10', '2025-05-12 20:31:10'),
(519, 'App\\Models\\UserInvitation', 382, 'd223f38a-a864-451f-8c9c-46e30975ed69', 'qr', '1747071180', '1747071180.jpg', 'image/jpeg', 'public', 'public', 21992, '[]', '[]', '[]', '[]', 2, '2025-05-12 20:33:00', '2025-05-12 20:33:00'),
(521, 'App\\Models\\UserInvitation', 383, 'dafa1c19-1699-4173-8bc2-86190c923866', 'qr', '1747071244', '1747071244.jpg', 'image/jpeg', 'public', 'public', 21992, '[]', '[]', '[]', '[]', 2, '2025-05-12 20:34:04', '2025-05-12 20:34:04'),
(522, 'App\\Models\\UserInvitation', 381, 'f5eeb581-9138-4741-9b60-36e8e6bd50f5', 'qr', '1747071399', '1747071399.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 9, '2025-05-12 20:36:39', '2025-05-12 20:36:39'),
(523, 'App\\Models\\Invitation', 1, 'c4e20c92-ce59-497c-8d18-9f60e0039888', 'default', 'WhatsApp Image 2025-04-25 at 07.13.23_acef78cc 3', 'WhatsApp-Image-2025-04-25-at-07.13.23_acef78cc-3.png', 'image/png', 'public', 'public', 5037, '[]', '[]', '[]', '[]', 3, '2025-05-13 21:59:42', '2025-05-13 21:59:42'),
(525, 'App\\Models\\Invitation', 3, '72dc592e-2507-486a-a8c8-2e3f1fe83125', 'default', 'WhatsApp Image 2025-04-25 at 07.13.23_acef78cc 3 (1)', 'WhatsApp-Image-2025-04-25-at-07.13.23_acef78cc-3-(1).png', 'image/png', 'public', 'public', 8059, '[]', '[]', '[]', '[]', 3, '2025-05-13 22:01:17', '2025-05-13 22:01:17'),
(527, 'App\\Models\\Invitation', 6, '02698cdf-3101-49cf-b5ac-d9066fabd356', 'default', 'WhatsApp Image 2025-04-25 at 07.13.23_acef78cc 3', 'WhatsApp-Image-2025-04-25-at-07.13.23_acef78cc-3.png', 'image/png', 'public', 'public', 5037, '[]', '[]', '[]', '[]', 5, '2025-05-13 22:02:46', '2025-05-13 22:02:46'),
(528, 'App\\Models\\Invitation', 5, 'bac4cc0e-6c56-4ba6-8f04-04060a2c928c', 'default', 'WhatsApp Image 2025-04-25 at 07.13.23_acef78cc 3', 'WhatsApp-Image-2025-04-25-at-07.13.23_acef78cc-3.png', 'image/png', 'public', 'public', 5037, '[]', '[]', '[]', '[]', 6, '2025-05-13 22:03:02', '2025-05-13 22:03:02'),
(529, 'App\\Models\\Invitation', 2, '941ef0a9-6ec5-492c-8be4-51b34808f8a3', 'default', 'WhatsApp Image 2025-04-25 at 07.13.23_acef78cc 3 (1)', 'WhatsApp-Image-2025-04-25-at-07.13.23_acef78cc-3-(1).png', 'image/png', 'public', 'public', 8059, '[]', '[]', '[]', '[]', 4, '2025-05-13 22:03:27', '2025-05-13 22:03:27'),
(530, 'App\\Models\\Invitation', 7, 'da445f29-31b2-4888-b5b7-298293a0b710', 'default', 'WhatsApp Image 2025-04-25 at 07.13.23_acef78cc 3', 'WhatsApp-Image-2025-04-25-at-07.13.23_acef78cc-3.png', 'image/png', 'public', 'public', 5037, '[]', '[]', '[]', '[]', 4, '2025-05-13 22:04:04', '2025-05-13 22:04:04'),
(531, 'App\\Models\\UserInvitation', 384, 'f869ea3d-6561-48b2-a2c0-1fa02bd26fad', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-15 03:01:51', '2025-05-15 03:01:51'),
(532, 'App\\Models\\UserInvitation', 384, 'a1a0b894-be11-4425-9f6e-02d5add37b44', 'qr', '1747267321', '1747267321.png', 'image/png', 'public', 'public', 31140, '[]', '[]', '[]', '[]', 2, '2025-05-15 03:02:01', '2025-05-15 03:02:01'),
(533, 'App\\Models\\UserInvitation', 385, '0525e044-4d07-498b-be8a-94c8dbb9bd4e', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-15 03:08:03', '2025-05-15 03:08:03'),
(534, 'App\\Models\\UserInvitation', 385, '7235b79e-62cc-4853-a637-304ae470f2fc', 'qr', '1747267688', '1747267688.png', 'image/png', 'public', 'public', 30676, '[]', '[]', '[]', '[]', 2, '2025-05-15 03:08:08', '2025-05-15 03:08:08'),
(535, 'App\\Models\\UserInvitation', 381, '37102c47-a211-4e6f-8f55-3a812eaa09aa', 'qr', '1747332148', '1747332148.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 10, '2025-05-15 21:02:28', '2025-05-15 21:02:28'),
(536, 'App\\Models\\UserInvitation', 381, '3919fc48-0e3d-42d6-a894-7851d505d65b', 'qr', '1747332329', '1747332329.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 11, '2025-05-15 21:05:29', '2025-05-15 21:05:29'),
(537, 'App\\Models\\UserInvitation', 381, 'ded4c851-52fa-4ca5-9a81-14e0c81abf79', 'qr', '1747332519', '1747332519.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 12, '2025-05-15 21:08:39', '2025-05-15 21:08:39'),
(539, 'App\\Models\\UserInvitation', 386, 'ff4a2ac9-a582-447a-8a51-c0743815fe1e', 'qr', '1747332777', '1747332777.jpg', 'image/jpeg', 'public', 'public', 21992, '[]', '[]', '[]', '[]', 2, '2025-05-15 21:12:57', '2025-05-15 21:12:57'),
(540, 'App\\Models\\UserInvitation', 381, '22004726-d804-4471-95dd-0879b8e425ab', 'qr', '1747412778', '1747412778.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 13, '2025-05-16 19:26:18', '2025-05-16 19:26:18'),
(541, 'App\\Models\\UserInvitation', 381, 'be7dd5b6-1e9b-4c20-9122-96ee5814eae2', 'qr', '1747413670', '1747413670.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 14, '2025-05-16 19:41:10', '2025-05-16 19:41:10'),
(542, 'App\\Models\\UserInvitation', 381, '36072aa3-7d31-47ad-b9e9-5930dc155f75', 'qr', '1747413949', '1747413949.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 15, '2025-05-16 19:45:49', '2025-05-16 19:45:49'),
(543, 'App\\Models\\UserInvitation', 381, '65b8f94b-6c51-41ff-9dca-30070bfb3690', 'qr', '1747415348', '1747415348.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 16, '2025-05-16 20:09:08', '2025-05-16 20:09:08'),
(544, 'App\\Models\\UserInvitation', 381, '18f632a9-b01c-4c45-8cc0-336dc0b35a8f', 'qr', '1747416175', '1747416175.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 17, '2025-05-16 20:22:55', '2025-05-16 20:22:55'),
(545, 'App\\Models\\UserInvitation', 381, '5e333c48-3525-4b1f-ba1c-6dad7025fbdb', 'qr', '1747416793', '1747416793.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 18, '2025-05-16 20:33:13', '2025-05-16 20:33:13'),
(546, 'App\\Models\\UserInvitation', 381, '04f4e180-66f8-4e71-b70e-865b0898900b', 'qr', '1747426096', '1747426096.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 19, '2025-05-16 23:08:17', '2025-05-16 23:08:17'),
(547, 'App\\Models\\UserInvitation', 381, 'e041f092-11e3-4671-bfc6-a86ee5d42fad', 'qr', '1747427812', '1747427812.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 20, '2025-05-16 23:36:52', '2025-05-16 23:36:52');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(548, 'App\\Models\\UserInvitation', 381, '1db25611-9f51-4f27-80fd-52fffb367292', 'qr', '1747427890', '1747427890.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 21, '2025-05-16 23:38:10', '2025-05-16 23:38:10'),
(549, 'App\\Models\\UserInvitation', 381, '59e8ef60-87d3-41fa-b960-32226eb512a2', 'qr', '1747428007', '1747428007.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 22, '2025-05-16 23:40:07', '2025-05-16 23:40:07'),
(550, 'App\\Models\\UserInvitation', 381, 'fc705c0c-1512-452c-90c1-987a362ead61', 'qr', '1747428415', '1747428415.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 23, '2025-05-16 23:46:55', '2025-05-16 23:46:55'),
(551, 'App\\Models\\UserInvitation', 381, '9c29895b-782a-47e9-9569-84302a256bb9', 'qr', '1747428553', '1747428553.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 24, '2025-05-16 23:49:13', '2025-05-16 23:49:13'),
(552, 'App\\Models\\UserInvitation', 381, 'b105c525-040e-4215-a80c-dfd40fd0450c', 'qr', '1747428641', '1747428641.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 25, '2025-05-16 23:50:41', '2025-05-16 23:50:41'),
(553, 'App\\Models\\UserInvitation', 381, '0bd95f66-b44e-445a-832d-076d34f0adc3', 'qr', '1747428863', '1747428863.jpg', 'image/jpeg', 'public', 'public', 21748, '[]', '[]', '[]', '[]', 26, '2025-05-16 23:54:23', '2025-05-16 23:54:23'),
(554, 'App\\Models\\UserInvitation', 381, '0a981bf0-1876-4b07-a36c-b537d2378fe3', 'qr', '1747429545', '1747429545.jpg', 'image/jpeg', 'public', 'public', 21441, '[]', '[]', '[]', '[]', 27, '2025-05-17 00:05:45', '2025-05-17 00:05:45'),
(555, 'App\\Models\\UserInvitation', 381, 'd9b59116-47cf-4098-a02a-65b17a203bc6', 'qr', '1747480218', '1747480218.jpg', 'image/jpeg', 'public', 'public', 21441, '[]', '[]', '[]', '[]', 28, '2025-05-17 14:10:18', '2025-05-17 14:10:18'),
(556, 'App\\Models\\UserInvitation', 387, '6e9c309d-5e69-4366-b9f6-8fd16ae29e3f', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-19 01:04:57', '2025-05-19 01:04:57'),
(557, 'App\\Models\\UserInvitation', 387, '63f87519-2a1f-4cf3-a747-6c4584f1f8f7', 'qr', '1747605903', '1747605903.png', 'image/png', 'public', 'public', 30862, '[]', '[]', '[]', '[]', 2, '2025-05-19 01:05:03', '2025-05-19 01:05:03'),
(558, 'App\\Models\\UserInvitation', 388, '0a374336-35f5-4627-bdce-0a6a1c5ec5a5', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 08:26:31', '2025-05-24 08:26:31'),
(559, 'App\\Models\\UserInvitation', 389, '1b69b442-b3f6-43c5-8b54-1242e1a252bc', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 08:26:36', '2025-05-24 08:26:36'),
(560, 'App\\Models\\UserInvitation', 390, '39b9737b-ccf4-4613-8530-9c52f07a9d1e', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 08:26:41', '2025-05-24 08:26:41'),
(561, 'App\\Models\\UserInvitation', 391, 'c62c9713-a5ee-4acb-8de4-ba9e294ce5ba', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 08:26:53', '2025-05-24 08:26:53'),
(562, 'App\\Models\\UserInvitation', 392, '8a5d6058-2bd2-408b-bfa9-ce1ec4d3dbd1', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 08:29:15', '2025-05-24 08:29:15'),
(563, 'App\\Models\\UserInvitation', 393, '94592eec-0b86-41f0-beb5-c6c4eb0bf569', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 08:29:24', '2025-05-24 08:29:24'),
(564, 'App\\Models\\UserInvitation', 394, 'c641b133-a8b8-4868-94b5-aa5c6fb7d7fe', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 08:29:25', '2025-05-24 08:29:25'),
(565, 'App\\Models\\UserInvitation', 395, 'b0cf790f-d0c3-49bd-b605-3be055b1a0df', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 08:29:35', '2025-05-24 08:29:35'),
(566, 'App\\Models\\UserInvitation', 396, '8e10fe64-d755-4226-ac6d-50fc2afbd56b', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 08:46:47', '2025-05-24 08:46:47'),
(567, 'App\\Models\\UserInvitation', 397, 'c122d95c-7275-4b6b-8c1c-bd0126501355', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 32768, '[]', '[]', '[]', '[]', 1, '2025-05-24 08:47:13', '2025-05-24 08:47:13'),
(568, 'App\\Models\\UserInvitation', 398, '4b66192e-1f47-44eb-a964-d9856ed328db', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 08:47:16', '2025-05-24 08:47:16'),
(569, 'App\\Models\\UserInvitation', 399, 'b953a8d9-2aae-4a70-bcc1-689fc1057022', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 11:35:37', '2025-05-24 11:35:37'),
(570, 'App\\Models\\UserInvitation', 400, 'f43683d6-5e77-4981-a47c-fdd114707ba1', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 11:35:56', '2025-05-24 11:35:56'),
(571, 'App\\Models\\UserInvitation', 401, 'd84e7482-41ff-4b48-86c2-f930ffc29bc8', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 11:36:39', '2025-05-24 11:36:39'),
(572, 'App\\Models\\UserInvitation', 402, '31a91e8b-7725-4823-80a4-d5e7ef5a10fb', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 11:44:43', '2025-05-24 11:44:43'),
(573, 'App\\Models\\UserInvitation', 403, 'ba14e3f1-7c65-4175-99ad-fecd491ccb9f', 'userInvitation', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun Chat', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat.jpg', 'image/jpeg', 'public', 'public', 263274, '[]', '[]', '[]', '[]', 1, '2025-05-24 11:50:06', '2025-05-24 11:50:06'),
(574, 'App\\Models\\UserInvitation', 403, 'c5f9e216-83e1-4d9b-a798-1cdb55432f40', 'qr', '1748076610', '1748076610.png', 'image/png', 'public', 'public', 26705, '[]', '[]', '[]', '[]', 2, '2025-05-24 11:50:10', '2025-05-24 11:50:10'),
(575, 'App\\Models\\UserInvitation', 404, '39156584-da48-4f2c-b3e4-45459b8974c7', 'userInvitation', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat.jpg', 'image/jpeg', 'public', 'public', 263274, '[]', '[]', '[]', '[]', 1, '2025-05-24 11:52:33', '2025-05-24 11:52:33'),
(576, 'App\\Models\\UserInvitation', 404, 'b0ef1a38-af5a-4d77-abc2-77100bb29668', 'qr', '1748076755', '1748076755.png', 'image/png', 'public', 'public', 26364, '[]', '[]', '[]', '[]', 2, '2025-05-24 11:52:35', '2025-05-24 11:52:35'),
(577, 'App\\Models\\UserInvitation', 405, 'ebe8c8be-4583-4123-8f64-e8e9ed3036a3', 'userInvitation', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat.jpg', 'image/jpeg', 'public', 'public', 263274, '[]', '[]', '[]', '[]', 1, '2025-05-24 12:05:44', '2025-05-24 12:05:44'),
(578, 'App\\Models\\UserInvitation', 406, 'ca46bdd2-9f43-444d-8921-c32eeb99a17c', 'userInvitation', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat.jpg', 'image/jpeg', 'public', 'public', 263274, '[]', '[]', '[]', '[]', 1, '2025-05-24 12:18:51', '2025-05-24 12:18:51'),
(579, 'App\\Models\\UserInvitation', 407, 'a287a966-899a-4905-9054-593d4a95240f', 'userInvitation', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat.jpg', 'image/jpeg', 'public', 'public', 263274, '[]', '[]', '[]', '[]', 1, '2025-05-24 12:19:54', '2025-05-24 12:19:54'),
(580, 'App\\Models\\UserInvitation', 408, '1a367b41-3a4a-480c-9ad7-5c5312a0bd3f', 'userInvitation', 'IMG_0689', 'IMG_0689.PNG', 'image/png', 'public', 'public', 2630648, '[]', '[]', '[]', '[]', 1, '2025-05-24 14:02:56', '2025-05-24 14:02:56'),
(581, 'App\\Models\\UserInvitation', 408, 'baee8b8f-f472-4f43-847a-1b89aaad63e2', 'qr', '1748084590', '1748084590.png', 'image/png', 'public', 'public', 19089, '[]', '[]', '[]', '[]', 2, '2025-05-24 14:03:10', '2025-05-24 14:03:10'),
(582, 'App\\Models\\UserInvitation', 408, '21c391e4-1cde-465b-ac98-9d03fcc6cb41', 'qr', '1748084591', '1748084591.png', 'image/png', 'public', 'public', 19148, '[]', '[]', '[]', '[]', 3, '2025-05-24 14:03:11', '2025-05-24 14:03:11'),
(583, 'App\\Models\\UserInvitation', 409, 'fa0b3147-5b2d-4332-a4e7-476a2f0d5d8e', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-24 16:14:09', '2025-05-24 16:14:09'),
(584, 'App\\Models\\UserInvitation', 381, '34cd350d-2736-4f67-beeb-2f275a5bb519', 'qr', '1748101862', '1748101862.jpg', 'image/jpeg', 'public', 'public', 21103, '[]', '[]', '[]', '[]', 29, '2025-05-24 18:51:03', '2025-05-24 18:51:03'),
(585, 'App\\Models\\UserInvitation', 381, '7227e7fb-2d91-4efd-8bbf-56789f73d52f', 'qr', '1748102110', '1748102110.jpg', 'image/jpeg', 'public', 'public', 21103, '[]', '[]', '[]', '[]', 30, '2025-05-24 18:55:10', '2025-05-24 18:55:10'),
(586, 'App\\Models\\UserInvitation', 381, 'ab56d0c9-57af-4062-8392-7f1fd0d70b6f', 'qr', '1748102369', '1748102369.jpg', 'image/jpeg', 'public', 'public', 21103, '[]', '[]', '[]', '[]', 31, '2025-05-24 18:59:29', '2025-05-24 18:59:29'),
(587, 'App\\Models\\UserInvitation', 381, 'cfb6ec6f-f89e-420f-a13c-e4ec8e0f7c4c', 'qr', '1748102452', '1748102452.jpg', 'image/jpeg', 'public', 'public', 21103, '[]', '[]', '[]', '[]', 32, '2025-05-24 19:00:52', '2025-05-24 19:00:52'),
(588, 'App\\Models\\UserInvitation', 381, '1a05a5f9-e6c1-49f9-9cbd-a0cf49326b34', 'qr', '1748102582', '1748102582.jpg', 'image/jpeg', 'public', 'public', 21103, '[]', '[]', '[]', '[]', 33, '2025-05-24 19:03:02', '2025-05-24 19:03:02'),
(589, 'App\\Models\\UserInvitation', 381, '040c72ed-b537-4cd3-9098-97f4bc1d43b4', 'qr', '1748102671', '1748102671.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 34, '2025-05-24 19:04:31', '2025-05-24 19:04:31'),
(590, 'App\\Models\\UserInvitation', 381, 'a8fe5239-a00d-4d19-a685-a5fe383a0834', 'qr', '1748102802', '1748102802.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 35, '2025-05-24 19:06:42', '2025-05-24 19:06:42'),
(591, 'App\\Models\\UserInvitation', 381, 'cf180ae8-f28d-4562-9238-c036ed8faa87', 'qr', '1748103020', '1748103020.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 36, '2025-05-24 19:10:20', '2025-05-24 19:10:20'),
(592, 'App\\Models\\UserInvitation', 381, '718280b2-bde9-433c-92b6-c898f20797eb', 'userInvitation', '01f51267acc31e563586ca30fe1f3501', '01f51267acc31e563586ca30fe1f3501.jpg', 'image/jpeg', 'public', 'public', 59463, '[]', '[]', '[]', '[]', 37, '2025-05-24 19:10:20', '2025-05-24 19:10:20'),
(593, 'App\\Models\\UserInvitation', 403, '97109999-a85d-4169-987e-29687c8b1b71', 'qr', '1748103705', '1748103705.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 3, '2025-05-24 19:21:45', '2025-05-24 19:21:45'),
(594, 'App\\Models\\UserInvitation', 403, '692732e0-7ac5-4b69-a836-7caf4da52ce0', 'userInvitation', '5006d9b7d14b32947d55586670e24b53', '5006d9b7d14b32947d55586670e24b53.jpg', 'image/jpeg', 'public', 'public', 71401, '[]', '[]', '[]', '[]', 4, '2025-05-24 19:21:45', '2025-05-24 19:21:45'),
(595, 'App\\Models\\UserInvitation', 403, '41d8d06b-b812-4d54-8722-a30e502c6cd9', 'qr', '1748103779', '1748103779.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 5, '2025-05-24 19:22:59', '2025-05-24 19:22:59'),
(596, 'App\\Models\\UserInvitation', 403, 'be0f9a96-fb9a-476d-90ef-8aa946dff1d4', 'qr', '1748103852', '1748103852.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 6, '2025-05-24 19:24:12', '2025-05-24 19:24:12'),
(597, 'App\\Models\\UserInvitation', 403, '22ebece4-fe6b-4d21-ab96-d80d402b72b1', 'qr', '1748105866', '1748105866.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 7, '2025-05-24 19:57:46', '2025-05-24 19:57:46'),
(598, 'App\\Models\\UserInvitation', 403, '1df29b47-4a93-45a5-b03d-4597142bb655', 'userInvitation', '8dd57c268ae4bafc151170fa340352ea', '8dd57c268ae4bafc151170fa340352ea.jpg', 'image/jpeg', 'public', 'public', 71401, '[]', '[]', '[]', '[]', 8, '2025-05-24 19:57:46', '2025-05-24 19:57:46'),
(599, 'App\\Models\\UserInvitation', 403, 'fb515bc4-5ad5-447f-aaaf-c76862905165', 'qr', '1748105969', '1748105969.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 9, '2025-05-24 19:59:29', '2025-05-24 19:59:29'),
(600, 'App\\Models\\UserInvitation', 410, 'ff743267-06bd-4934-b378-4fafcf9124ae', 'userInvitation', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat.jpg', 'image/jpeg', 'public', 'public', 263274, '[]', '[]', '[]', '[]', 1, '2025-05-24 20:07:12', '2025-05-24 20:07:12'),
(601, 'App\\Models\\UserInvitation', 411, '99bdce7d-a0b7-443c-899d-aec7bc8a883c', 'userInvitation', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat.jpg', 'image/jpeg', 'public', 'public', 263274, '[]', '[]', '[]', '[]', 1, '2025-05-24 20:11:33', '2025-05-24 20:11:33'),
(602, 'App\\Models\\UserInvitation', 411, 'cd6055ca-a7f6-4dd3-9679-3d4b041863d9', 'qr', '1748106696', '1748106696.png', 'image/png', 'public', 'public', 22432, '[]', '[]', '[]', '[]', 2, '2025-05-24 20:11:36', '2025-05-24 20:11:36'),
(603, 'App\\Models\\UserInvitation', 412, '51382efd-3c47-4c5a-a8b2-ffbcdf89d47f', 'userInvitation', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat.jpg', 'image/jpeg', 'public', 'public', 263274, '[]', '[]', '[]', '[]', 1, '2025-05-24 20:11:53', '2025-05-24 20:11:53'),
(604, 'App\\Models\\UserInvitation', 413, 'fc5e9de9-84f4-4e5d-8750-80d9c67ae19d', 'userInvitation', 'IMG_20250524_162921', 'IMG_20250524_162921.jpg', 'image/jpeg', 'public', 'public', 104106, '[]', '[]', '[]', '[]', 1, '2025-05-24 20:13:55', '2025-05-24 20:13:55'),
(605, 'App\\Models\\UserInvitation', 413, 'b5205297-b12b-4ada-a48e-b28e00e46cff', 'qr', '1748106837', '1748106837.png', 'image/png', 'public', 'public', 22376, '[]', '[]', '[]', '[]', 2, '2025-05-24 20:13:57', '2025-05-24 20:13:57'),
(606, 'App\\Models\\UserInvitation', 414, '3d01b4f3-49d9-4e84-8aab-7e8208d9ee15', 'userInvitation', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat.jpg', 'image/jpeg', 'public', 'public', 263274, '[]', '[]', '[]', '[]', 1, '2025-05-24 20:24:40', '2025-05-24 20:24:40'),
(607, 'App\\Models\\UserInvitation', 414, 'c235cfbb-9c2b-4ef7-ad89-596c621ca62a', 'qr', '1748107482', '1748107482.png', 'image/png', 'public', 'public', 22430, '[]', '[]', '[]', '[]', 2, '2025-05-24 20:24:42', '2025-05-24 20:24:42'),
(608, 'App\\Models\\UserInvitation', 413, '24ac433f-ca21-4258-810b-673f64daf7c3', 'qr', '1748107904', '1748107904.jpg', 'image/jpeg', 'public', 'public', 23810, '[]', '[]', '[]', '[]', 3, '2025-05-24 20:31:44', '2025-05-24 20:31:44'),
(609, 'App\\Models\\UserInvitation', 413, '90b6ab6f-abea-4070-84a8-98ed1043d475', 'userInvitation', 'c815cfc4416e8a622458987b052b8a7b', 'c815cfc4416e8a622458987b052b8a7b.jpg', 'image/jpeg', 'public', 'public', 62295, '[]', '[]', '[]', '[]', 4, '2025-05-24 20:31:44', '2025-05-24 20:31:44'),
(610, 'App\\Models\\UserInvitation', 413, 'b5bf8e67-a5c5-4a83-aab2-1f3bc194dbe9', 'qr', '1748108208', '1748108208.jpg', 'image/jpeg', 'public', 'public', 23810, '[]', '[]', '[]', '[]', 5, '2025-05-24 20:36:48', '2025-05-24 20:36:48'),
(611, 'App\\Models\\UserInvitation', 413, '591a70aa-b478-4c52-9e7e-d1b55fb87404', 'userInvitation', '0dd39b7ad8d8a3cd88b62a2f911b41e4', '0dd39b7ad8d8a3cd88b62a2f911b41e4.jpg', 'image/jpeg', 'public', 'public', 99782, '[]', '[]', '[]', '[]', 6, '2025-05-24 20:36:48', '2025-05-24 20:36:48'),
(612, 'App\\Models\\UserInvitation', 413, '872ab2e2-d20d-49ef-bb5a-294dffae90df', 'qr', '1748109115', '1748109115.jpg', 'image/jpeg', 'public', 'public', 23810, '[]', '[]', '[]', '[]', 7, '2025-05-24 20:51:55', '2025-05-24 20:51:55'),
(613, 'App\\Models\\UserInvitation', 413, 'fe565813-e88b-4a40-8860-686e4e4dd26e', 'userInvitation', '049c0e1c0a3dc24a1b659cc12e16a191', '049c0e1c0a3dc24a1b659cc12e16a191.jpg', 'image/jpeg', 'public', 'public', 99782, '[]', '[]', '[]', '[]', 8, '2025-05-24 20:51:55', '2025-05-24 20:51:55'),
(614, 'App\\Models\\UserInvitation', 413, 'c4a0489d-a0b5-4611-a807-fb95972e0f1c', 'qr', '1748109166', '1748109166.jpg', 'image/jpeg', 'public', 'public', 23810, '[]', '[]', '[]', '[]', 9, '2025-05-24 20:52:46', '2025-05-24 20:52:46'),
(615, 'App\\Models\\UserInvitation', 413, '698e5529-8f44-464e-b1e0-7438f772b1f0', 'userInvitation', '242ea538fe8d3988d27f7836a87abfc6', '242ea538fe8d3988d27f7836a87abfc6.jpg', 'image/jpeg', 'public', 'public', 99782, '[]', '[]', '[]', '[]', 10, '2025-05-24 20:52:46', '2025-05-24 20:52:46'),
(616, 'App\\Models\\UserInvitation', 413, '38914a45-0a2f-474a-a323-b6fa925634fc', 'qr', '1748109199', '1748109199.jpg', 'image/jpeg', 'public', 'public', 23810, '[]', '[]', '[]', '[]', 11, '2025-05-24 20:53:19', '2025-05-24 20:53:19'),
(617, 'App\\Models\\UserInvitation', 413, 'a8df2b83-6093-4d07-8b34-ce566427025e', 'userInvitation', 'a352ca389496c1c0a14afeed11ab19a1', 'a352ca389496c1c0a14afeed11ab19a1.jpg', 'image/jpeg', 'public', 'public', 99782, '[]', '[]', '[]', '[]', 12, '2025-05-24 20:53:19', '2025-05-24 20:53:19'),
(618, 'App\\Models\\UserInvitation', 413, '1c77e9bf-f311-45e7-bd36-5e40bb89c21d', 'qr', '1748109390', '1748109390.jpg', 'image/jpeg', 'public', 'public', 23810, '[]', '[]', '[]', '[]', 13, '2025-05-24 20:56:30', '2025-05-24 20:56:30'),
(619, 'App\\Models\\UserInvitation', 413, 'cb0c295a-6aa5-4924-b100-385ff5dd9eab', 'userInvitation', 'f1f31badceaadab521b65030c27cdac4', 'f1f31badceaadab521b65030c27cdac4.jpg', 'image/jpeg', 'public', 'public', 99782, '[]', '[]', '[]', '[]', 14, '2025-05-24 20:56:30', '2025-05-24 20:56:30'),
(620, 'App\\Models\\UserInvitation', 413, '38ed41d0-4d96-4012-b9e1-ffe756ed15a0', 'qr', '1748109771', '1748109771.jpg', 'image/jpeg', 'public', 'public', 23810, '[]', '[]', '[]', '[]', 15, '2025-05-24 21:02:51', '2025-05-24 21:02:51'),
(621, 'App\\Models\\UserInvitation', 413, '930f4c27-8703-4d6c-b9ac-bf9b96232faf', 'userInvitation', '09a17b058508bb490f7926cb5d05b37a', '09a17b058508bb490f7926cb5d05b37a.jpg', 'image/jpeg', 'public', 'public', 99782, '[]', '[]', '[]', '[]', 16, '2025-05-24 21:02:51', '2025-05-24 21:02:51'),
(622, 'App\\Models\\UserInvitation', 413, '76908275-ae3a-472c-abc2-37624c5d712f', 'qr', '1748110269', '1748110269.jpg', 'image/jpeg', 'public', 'public', 23810, '[]', '[]', '[]', '[]', 17, '2025-05-24 21:11:09', '2025-05-24 21:11:09'),
(623, 'App\\Models\\UserInvitation', 413, '5a20c221-85c1-43bd-a203-19224716e00b', 'userInvitation', 'ba4fae4684c427bceae06ef846da0fa6', 'ba4fae4684c427bceae06ef846da0fa6.jpg', 'image/jpeg', 'public', 'public', 99782, '[]', '[]', '[]', '[]', 18, '2025-05-24 21:11:09', '2025-05-24 21:11:09'),
(624, 'App\\Models\\UserInvitation', 413, 'a5ef56b4-5820-456e-83f8-e1eb371c8932', 'qr', '1748110672', '1748110672.jpg', 'image/jpeg', 'public', 'public', 23810, '[]', '[]', '[]', '[]', 19, '2025-05-24 21:17:52', '2025-05-24 21:17:52'),
(625, 'App\\Models\\UserInvitation', 413, '2ae73d0f-9f08-4c61-b88a-084c7a9c3ab1', 'userInvitation', '68325efb5dcf585dbd7191fa400cb6f7', '68325efb5dcf585dbd7191fa400cb6f7.jpg', 'image/jpeg', 'public', 'public', 99782, '[]', '[]', '[]', '[]', 20, '2025-05-24 21:17:52', '2025-05-24 21:17:52'),
(626, 'App\\Models\\UserInvitation', 415, 'b102ade6-9d3f-498b-a493-e030b5afa643', 'userInvitation', 'PSX_20240722_235008', 'PSX_20240722_235008.jpg', 'image/jpeg', 'public', 'public', 1887724, '[]', '[]', '[]', '[]', 1, '2025-05-24 21:46:24', '2025-05-24 21:46:24'),
(627, 'App\\Models\\UserInvitation', 416, '029ab0d7-da4a-4ee0-87b6-9403f0af4c47', 'userInvitation', 'PSX_20240722_235008', 'PSX_20240722_235008.jpg', 'image/jpeg', 'public', 'public', 1887724, '[]', '[]', '[]', '[]', 1, '2025-05-24 21:49:25', '2025-05-24 21:49:25'),
(628, 'App\\Models\\UserInvitation', 417, 'cfa52f37-b157-42b7-aa1c-cb016b15fcb4', 'userInvitation', 'PSX_20240722_235008', 'PSX_20240722_235008.jpg', 'image/jpeg', 'public', 'public', 1887724, '[]', '[]', '[]', '[]', 1, '2025-05-24 21:52:47', '2025-05-24 21:52:47'),
(629, 'App\\Models\\UserInvitation', 418, '42175462-6e82-4df3-95c1-521a5a8d356c', 'userInvitation', 'PSX_20240722_235008', 'PSX_20240722_235008.jpg', 'image/jpeg', 'public', 'public', 1887724, '[]', '[]', '[]', '[]', 1, '2025-05-24 21:52:51', '2025-05-24 21:52:51'),
(630, 'App\\Models\\UserInvitation', 419, 'a9f80d9d-5028-438b-8c82-e346c6fd1ecd', 'userInvitation', 'PSX_20240722_235008', 'PSX_20240722_235008.jpg', 'image/jpeg', 'public', 'public', 1887724, '[]', '[]', '[]', '[]', 1, '2025-05-24 21:53:10', '2025-05-24 21:53:10'),
(631, 'App\\Models\\UserInvitation', 420, '8d2ef0e1-52b9-4168-b45d-48e0d26baf37', 'userInvitation', 'PSX_20240722_235008', 'PSX_20240722_235008.jpg', 'image/jpeg', 'public', 'public', 1887724, '[]', '[]', '[]', '[]', 1, '2025-05-24 22:04:10', '2025-05-24 22:04:10'),
(632, 'App\\Models\\UserInvitation', 413, '433d9d82-b6de-4062-b856-a613222d6c75', 'qr', '1748113740', '1748113740.jpg', 'image/jpeg', 'public', 'public', 23810, '[]', '[]', '[]', '[]', 21, '2025-05-24 22:09:00', '2025-05-24 22:09:00'),
(633, 'App\\Models\\UserInvitation', 413, '45e9015a-6c31-4b9b-8518-0f3e69bbf89d', 'userInvitation', '67c3459539c08d706e1b349942f9f778', '67c3459539c08d706e1b349942f9f778.jpg', 'image/jpeg', 'public', 'public', 99782, '[]', '[]', '[]', '[]', 22, '2025-05-24 22:09:00', '2025-05-24 22:09:00'),
(634, 'App\\Models\\UserInvitation', 413, '72933e20-eb6f-4dae-8f29-d28ee1832ae9', 'qr', '1748113772', '1748113772.jpg', 'image/jpeg', 'public', 'public', 23810, '[]', '[]', '[]', '[]', 23, '2025-05-24 22:09:32', '2025-05-24 22:09:32'),
(635, 'App\\Models\\UserInvitation', 413, '69a60294-5f57-4ca7-b02f-59c3ddcde7a3', 'userInvitation', 'b12758a8eaed4aaf6fd234af725711a2', 'b12758a8eaed4aaf6fd234af725711a2.jpg', 'image/jpeg', 'public', 'public', 106975, '[]', '[]', '[]', '[]', 24, '2025-05-24 22:09:32', '2025-05-24 22:09:32'),
(636, 'App\\Models\\UserInvitation', 413, 'e8cf2d8a-d74c-4348-b788-699399d2b595', 'qr', '1748114126', '1748114126.jpg', 'image/jpeg', 'public', 'public', 21916, '[]', '[]', '[]', '[]', 25, '2025-05-24 22:15:26', '2025-05-24 22:15:26'),
(637, 'App\\Models\\UserInvitation', 413, '8b486cc2-2eaa-4df4-8db4-6de79d60f264', 'userInvitation', 'cd9f63d146955e948d50cdef5c2197fa', 'cd9f63d146955e948d50cdef5c2197fa.jpg', 'image/jpeg', 'public', 'public', 106645, '[]', '[]', '[]', '[]', 26, '2025-05-24 22:15:26', '2025-05-24 22:15:26'),
(638, 'App\\Models\\UserInvitation', 413, 'a088f82f-9cb2-4113-8b21-ee099cf12804', 'qr', '1748114429', '1748114429.jpg', 'image/jpeg', 'public', 'public', 21443, '[]', '[]', '[]', '[]', 27, '2025-05-24 22:20:29', '2025-05-24 22:20:29'),
(639, 'App\\Models\\UserInvitation', 413, 'f840673f-b781-46b7-acd6-81de14f65f9c', 'userInvitation', '8d88ec226bf5f8739b4d9456941321eb', '8d88ec226bf5f8739b4d9456941321eb.jpg', 'image/jpeg', 'public', 'public', 105297, '[]', '[]', '[]', '[]', 28, '2025-05-24 22:20:29', '2025-05-24 22:20:29'),
(640, 'App\\Models\\UserInvitation', 413, '07565a7b-bce8-40db-877e-8fab4d106931', 'qr', '1748114818', '1748114818.jpg', 'image/jpeg', 'public', 'public', 19296, '[]', '[]', '[]', '[]', 29, '2025-05-24 22:26:58', '2025-05-24 22:26:58'),
(641, 'App\\Models\\UserInvitation', 413, 'b30b3052-454e-4777-946f-8243b1d6aadc', 'userInvitation', 'fb55b515e4653f74ac0687aac1572cb0', 'fb55b515e4653f74ac0687aac1572cb0.jpg', 'image/jpeg', 'public', 'public', 105297, '[]', '[]', '[]', '[]', 30, '2025-05-24 22:26:58', '2025-05-24 22:26:58'),
(642, 'App\\Models\\UserInvitation', 421, 'dc16b70a-b5c4-4171-aae2-7b132e1bc868', 'userInvitation', 'PSX_20240722_235008', 'PSX_20240722_235008.jpg', 'image/jpeg', 'public', 'public', 1887724, '[]', '[]', '[]', '[]', 1, '2025-05-24 22:35:42', '2025-05-24 22:35:42'),
(643, 'App\\Models\\UserInvitation', 422, 'b610637c-618c-48cb-9dc6-76a37f59701a', 'userInvitation', 'IMG_20240922_171753', 'IMG_20240922_171753.jpg', 'image/jpeg', 'public', 'public', 2658036, '[]', '[]', '[]', '[]', 1, '2025-05-24 22:44:03', '2025-05-24 22:44:03'),
(644, 'App\\Models\\UserInvitation', 423, '0d7a9f09-7573-4912-8be5-2cffc2631666', 'userInvitation', 'PSX_20240722_235008', 'PSX_20240722_235008.jpg', 'image/jpeg', 'public', 'public', 1887724, '[]', '[]', '[]', '[]', 1, '2025-05-24 22:49:16', '2025-05-24 22:49:16'),
(645, 'App\\Models\\UserInvitation', 424, '84259e35-d288-42d1-b9fe-1455b0e3c10d', 'userInvitation', 'PSX_20240722_235008', 'PSX_20240722_235008.jpg', 'image/jpeg', 'public', 'public', 1887724, '[]', '[]', '[]', '[]', 1, '2025-05-24 23:04:58', '2025-05-24 23:04:58'),
(646, 'App\\Models\\UserInvitation', 425, 'c5acc523-c8e1-47d3-bd28-7706cf3abd67', 'userInvitation', 'PSX_20240722_235008', 'PSX_20240722_235008.jpg', 'image/jpeg', 'public', 'public', 1887724, '[]', '[]', '[]', '[]', 1, '2025-05-24 23:05:32', '2025-05-24 23:05:32'),
(647, 'App\\Models\\UserInvitation', 427, 'eecc8b5b-cd39-4307-8787-63eea424687c', 'userInvitation', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat', 'Screenshot_٢٠٢٥٠٥٢٤_١١٤٨٣٦_Karzoun-Chat.jpg', 'image/jpeg', 'public', 'public', 263274, '[]', '[]', '[]', '[]', 1, '2025-05-24 23:21:24', '2025-05-24 23:21:24'),
(648, 'App\\Models\\UserInvitation', 413, '85bb4b14-ed20-4d9e-a7e9-302d98cdef49', 'qr', '1748191406', '1748191406.jpg', 'image/jpeg', 'public', 'public', 21745, '[]', '[]', '[]', '[]', 31, '2025-05-25 19:43:26', '2025-05-25 19:43:26'),
(649, 'App\\Models\\UserInvitation', 413, '837df5ad-8ca8-4e66-be53-ac21804aee46', 'userInvitation', '858ea8f9243619ec7fc216e428833fee', '858ea8f9243619ec7fc216e428833fee.jpg', 'image/jpeg', 'public', 'public', 98182, '[]', '[]', '[]', '[]', 32, '2025-05-25 19:43:26', '2025-05-25 19:43:26'),
(650, 'App\\Models\\UserInvitation', 413, '90cabbad-5a8a-4c7d-b234-4d9e2e297d37', 'qr', '1748191844', '1748191844.jpg', 'image/jpeg', 'public', 'public', 21745, '[]', '[]', '[]', '[]', 33, '2025-05-25 19:50:44', '2025-05-25 19:50:44'),
(651, 'App\\Models\\UserInvitation', 413, 'bac3fdd8-b988-405b-ba55-f15969dbb89a', 'userInvitation', '494e8ff6a5f5b977f66cc88b5086c874', '494e8ff6a5f5b977f66cc88b5086c874.jpg', 'image/jpeg', 'public', 'public', 95250, '[]', '[]', '[]', '[]', 34, '2025-05-25 19:50:44', '2025-05-25 19:50:44'),
(652, 'App\\Models\\UserInvitation', 413, '372a7d83-4d62-4278-938f-91f878b085e7', 'qr', '1748192055', '1748192055.jpg', 'image/jpeg', 'public', 'public', 21745, '[]', '[]', '[]', '[]', 35, '2025-05-25 19:54:15', '2025-05-25 19:54:15'),
(653, 'App\\Models\\UserInvitation', 413, '7ea3c3d9-f9b4-4d2d-8f34-3244f8e4702c', 'qr', '1748192117', '1748192117.jpg', 'image/jpeg', 'public', 'public', 21745, '[]', '[]', '[]', '[]', 36, '2025-05-25 19:55:17', '2025-05-25 19:55:17'),
(654, 'App\\Models\\UserInvitation', 413, '91d4d9d3-2a41-46ec-8ea5-f5cb1d8f51e2', 'userInvitation', 'a1e5efab9abc790afc77a531d76a1630', 'a1e5efab9abc790afc77a531d76a1630.jpg', 'image/jpeg', 'public', 'public', 97261, '[]', '[]', '[]', '[]', 37, '2025-05-25 19:55:17', '2025-05-25 19:55:17'),
(655, 'App\\Models\\UserInvitation', 413, '0925866e-4aeb-4e52-b6dc-79576334afc0', 'qr', '1748194200', '1748194200.jpg', 'image/jpeg', 'public', 'public', 21745, '[]', '[]', '[]', '[]', 38, '2025-05-25 20:30:00', '2025-05-25 20:30:00'),
(656, 'App\\Models\\UserInvitation', 413, '0cbba850-7ffb-4862-b4b3-bb4380e588fd', 'userInvitation', 'f1d0e61bf34a456bf92cac8500accdf9', 'f1d0e61bf34a456bf92cac8500accdf9.jpg', 'image/jpeg', 'public', 'public', 97592, '[]', '[]', '[]', '[]', 39, '2025-05-25 20:30:00', '2025-05-25 20:30:00'),
(657, 'App\\Models\\Invitation', 10, 'f10fb98b-0352-4c4d-b100-13ee09058159', 'default', 'WhatsApp Image 2025-04-25 at 07.13.23_acef78cc 3', 'WhatsApp-Image-2025-04-25-at-07.13.23_acef78cc-3.png', 'image/png', 'public', 'public', 5037, '[]', '[]', '[]', '[]', 1, '2025-05-25 21:31:28', '2025-05-25 21:31:28'),
(658, 'App\\Models\\Invitation', 9, 'c3c86c8c-1546-4d7d-ac0f-d4ca642b5234', 'default', 'WhatsApp Image 2025-04-25 at 07.13.23_acef78cc 3 (1)', 'WhatsApp-Image-2025-04-25-at-07.13.23_acef78cc-3-(1).png', 'image/png', 'public', 'public', 8059, '[]', '[]', '[]', '[]', 1, '2025-05-25 21:31:43', '2025-05-25 21:31:43'),
(659, 'App\\Models\\Invitation', 8, '11c61e21-3768-41b1-b803-d39a8468e5e8', 'default', 'WhatsApp Image 2025-04-25 at 07.13.23_acef78cc 3 (1)', 'WhatsApp-Image-2025-04-25-at-07.13.23_acef78cc-3-(1).png', 'image/png', 'public', 'public', 8059, '[]', '[]', '[]', '[]', 1, '2025-05-25 21:31:57', '2025-05-25 21:31:57'),
(660, 'App\\Models\\UserInvitation', 428, '2932978e-f940-4665-b818-4401d0ac07cc', 'userInvitation', 'IMG-20250525-WA0158', 'IMG-20250525-WA0158.jpeg', 'image/jpeg', 'public', 'public', 1219990, '[]', '[]', '[]', '[]', 1, '2025-05-26 01:57:05', '2025-05-26 01:57:05'),
(661, 'App\\Models\\UserInvitation', 429, '17beff2f-5c1e-4a8c-8d7f-c19983131d1f', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-26 07:40:26', '2025-05-26 07:40:26'),
(662, 'App\\Models\\UserInvitation', 429, 'a622e849-f65a-4de4-bce9-ab2703d22426', 'qr', '1748234426', '1748234426.png', 'image/png', 'public', 'public', 31726, '[]', '[]', '[]', '[]', 2, '2025-05-26 07:40:26', '2025-05-26 07:40:26'),
(663, 'App\\Models\\UserInvitation', 430, '90b55dc6-3d02-4c85-98b3-0985044625e9', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-26 08:10:05', '2025-05-26 08:10:05'),
(664, 'App\\Models\\UserInvitation', 431, '8f3a9748-ab1e-4e1f-a7c4-25fb6aa411a2', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-26 08:13:11', '2025-05-26 08:13:11'),
(665, 'App\\Models\\UserInvitation', 431, 'e129fb07-d220-404a-98b7-2a60b895c0e9', 'qr', '1748236395', '1748236395.png', 'image/png', 'public', 'public', 31563, '[]', '[]', '[]', '[]', 2, '2025-05-26 08:13:15', '2025-05-26 08:13:15'),
(666, 'App\\Models\\UserInvitation', 431, '4834680c-d3bc-4b25-bbcf-7b87df0844d1', 'qr', '1748236395', '1748236395.png', 'image/png', 'public', 'public', 30572, '[]', '[]', '[]', '[]', 3, '2025-05-26 08:13:15', '2025-05-26 08:13:15'),
(667, 'App\\Models\\UserInvitation', 413, 'a83e9d2f-cac1-45cc-a0df-31911f09208c', 'qr', '1748257674', '1748257674.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 40, '2025-05-26 14:07:54', '2025-05-26 14:07:54'),
(668, 'App\\Models\\UserInvitation', 413, 'c8a3f939-a6e8-449c-b2eb-523b1faca430', 'userInvitation', 'c2795e441bea3b448711ec049fdc9363', 'c2795e441bea3b448711ec049fdc9363.jpg', 'image/jpeg', 'public', 'public', 95912, '[]', '[]', '[]', '[]', 41, '2025-05-26 14:07:54', '2025-05-26 14:07:54'),
(669, 'App\\Models\\UserInvitation', 413, 'ed6c7614-544a-4485-97ca-a6043ee17390', 'qr', '1748257822', '1748257822.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 42, '2025-05-26 14:10:22', '2025-05-26 14:10:22'),
(670, 'App\\Models\\UserInvitation', 413, '9126b8a5-59b9-4603-95cc-89c4a9037f6e', 'userInvitation', '4a76510d60cbd989936af82f5a47edcf', '4a76510d60cbd989936af82f5a47edcf.jpg', 'image/jpeg', 'public', 'public', 95884, '[]', '[]', '[]', '[]', 43, '2025-05-26 14:10:22', '2025-05-26 14:10:22'),
(671, 'App\\Models\\UserInvitation', 432, 'b1481318-1623-4810-a19a-4a6a866d464b', 'userInvitation', 'PSX_20240722_235008', 'PSX_20240722_235008.jpg', 'image/jpeg', 'public', 'public', 1887724, '[]', '[]', '[]', '[]', 1, '2025-05-26 15:26:05', '2025-05-26 15:26:05'),
(672, 'App\\Models\\UserInvitation', 433, '8bb8695d-8b7e-4902-856d-f6fec8e235a3', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-26 16:24:37', '2025-05-26 16:24:37'),
(673, 'App\\Models\\UserInvitation', 433, '200ae409-5351-43de-a93d-797bb51ccdd0', 'qr', '1748265880', '1748265880.png', 'image/png', 'public', 'public', 21863, '[]', '[]', '[]', '[]', 2, '2025-05-26 16:24:40', '2025-05-26 16:24:40'),
(674, 'App\\Models\\UserInvitation', 434, '03bc2f0a-1143-47a2-8e0a-2f6053c2718f', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-26 16:47:26', '2025-05-26 16:47:26'),
(675, 'App\\Models\\UserInvitation', 434, 'a914b131-2aec-4cc2-aeaf-d45d6b05bfd2', 'qr', '1748267250', '1748267250.png', 'image/png', 'public', 'public', 21624, '[]', '[]', '[]', '[]', 2, '2025-05-26 16:47:30', '2025-05-26 16:47:30'),
(676, 'App\\Models\\UserInvitation', 435, '89ff9413-a081-4366-a624-b8cdd8caf889', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-27 02:58:47', '2025-05-27 02:58:47'),
(677, 'App\\Models\\UserInvitation', 435, '7a453442-d4ff-4a2c-bac6-b17da0a0df4e', 'qr', '1748303931', '1748303931.png', 'image/png', 'public', 'public', 31484, '[]', '[]', '[]', '[]', 2, '2025-05-27 02:58:51', '2025-05-27 02:58:51'),
(678, 'App\\Models\\UserInvitation', 436, '9de7823b-eb4d-415f-981f-1314dac18e10', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-27 03:08:08', '2025-05-27 03:08:08'),
(679, 'App\\Models\\UserInvitation', 436, '5292ec5e-0c6c-4a67-9d6c-e8f920e29ac5', 'qr', '1748304490', '1748304490.png', 'image/png', 'public', 'public', 31399, '[]', '[]', '[]', '[]', 2, '2025-05-27 03:08:10', '2025-05-27 03:08:10'),
(680, 'App\\Models\\UserInvitation', 436, 'c97dd76e-5528-43ed-b16c-f5dd4db294ac', 'userInvitation', 'e676634c0c04980fd1174bc9c11c71dd', 'e676634c0c04980fd1174bc9c11c71dd.jpg', 'image/jpeg', 'public', 'public', 86629, '[]', '[]', '[]', '[]', 3, '2025-05-27 03:08:10', '2025-05-27 03:08:10'),
(681, 'App\\Models\\UserInvitation', 373, '64694a9c-bc09-4066-a86f-d12541a8654e', 'qr', '1748311597', '1748311597.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 2, '2025-05-27 05:06:37', '2025-05-27 05:06:37'),
(682, 'App\\Models\\UserInvitation', 437, '8f11836f-01e9-4c22-9a7b-f1282740496f', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-27 05:07:29', '2025-05-27 05:07:29'),
(683, 'App\\Models\\UserInvitation', 437, 'f6b3a26e-a9e5-46a7-9967-d3de21e1a601', 'qr', '1748311653', '1748311653.png', 'image/png', 'public', 'public', 22862, '[]', '[]', '[]', '[]', 2, '2025-05-27 05:07:33', '2025-05-27 05:07:33'),
(684, 'App\\Models\\UserInvitation', 438, '8b57cca8-a3c6-4eac-9b97-54dbb7696f35', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-27 05:14:39', '2025-05-27 05:14:39'),
(685, 'App\\Models\\UserInvitation', 438, 'dc1452e5-14c4-4022-8f0f-bb73f3dcf44f', 'qr', '1748312081', '1748312081.png', 'image/png', 'public', 'public', 21396, '[]', '[]', '[]', '[]', 2, '2025-05-27 05:14:41', '2025-05-27 05:14:41'),
(686, 'App\\Models\\UserInvitation', 439, 'ee51163c-c41d-4169-ab22-6b99ed72664a', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-27 23:17:19', '2025-05-27 23:17:19'),
(687, 'App\\Models\\UserInvitation', 439, '0663b61d-c8bb-49af-b276-d5bd95dfe801', 'qr', '1748377042', '1748377042.png', 'image/png', 'public', 'public', 31536, '[]', '[]', '[]', '[]', 2, '2025-05-27 23:17:23', '2025-05-27 23:17:23'),
(688, 'App\\Models\\UserInvitation', 439, '5764ded4-d6c7-4ef9-895b-a79994583772', 'userInvitation', '2b07a48717ae0c786b350b310d3faa86', '2b07a48717ae0c786b350b310d3faa86.jpg', 'image/jpeg', 'public', 'public', 86629, '[]', '[]', '[]', '[]', 3, '2025-05-27 23:17:23', '2025-05-27 23:17:23'),
(689, 'App\\Models\\UserInvitation', 440, 'b6197b47-8576-47f6-8003-2f529d71558b', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-27 23:36:35', '2025-05-27 23:36:35'),
(690, 'App\\Models\\UserInvitation', 440, '60e82d51-8375-4a39-85cb-e3e2817357c8', 'qr', '1748378197', '1748378197.png', 'image/png', 'public', 'public', 33635, '[]', '[]', '[]', '[]', 2, '2025-05-27 23:36:38', '2025-05-27 23:36:38'),
(691, 'App\\Models\\UserInvitation', 440, 'be0a8494-27f0-41d3-a373-f65ac493ed90', 'userInvitation', '615a26597b1d92b9021534200ae58d64', '615a26597b1d92b9021534200ae58d64.jpg', 'image/jpeg', 'public', 'public', 87090, '[]', '[]', '[]', '[]', 3, '2025-05-27 23:36:38', '2025-05-27 23:36:38'),
(692, 'App\\Models\\UserInvitation', 441, 'a5397d71-0d71-48d3-b55d-02839eaabca6', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-27 23:53:38', '2025-05-27 23:53:38'),
(693, 'App\\Models\\UserInvitation', 441, 'fb9cfbd8-bf4b-42a3-85bb-42590b96e586', 'qr', '1748379222', '1748379222.png', 'image/png', 'public', 'public', 33392, '[]', '[]', '[]', '[]', 2, '2025-05-27 23:53:42', '2025-05-27 23:53:42'),
(694, 'App\\Models\\UserInvitation', 441, 'b35cb292-b83b-4eb7-8b6e-acfd2c474228', 'userInvitation', '54b35e5e11c8dc09694d2e6b8c77636c', '54b35e5e11c8dc09694d2e6b8c77636c.jpg', 'image/jpeg', 'public', 'public', 89981, '[]', '[]', '[]', '[]', 3, '2025-05-27 23:53:42', '2025-05-27 23:53:42'),
(695, 'App\\Models\\UserInvitation', 373, 'daca5c2f-0c5a-48fc-87db-6aa9dc9d98ad', 'qr', '1748379635', '1748379635.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 3, '2025-05-28 00:00:35', '2025-05-28 00:00:35'),
(696, 'App\\Models\\UserInvitation', 373, 'e181b466-cce7-44bb-8982-bc2094848424', 'qr', '1748379729', '1748379729.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 4, '2025-05-28 00:02:09', '2025-05-28 00:02:09'),
(697, 'App\\Models\\UserInvitation', 442, 'e2c1c5f3-1ef3-4c9b-9ff4-14e07b3279ce', 'userInvitation', 'PSX_20240722_235008', 'PSX_20240722_235008.jpg', 'image/jpeg', 'public', 'public', 1887724, '[]', '[]', '[]', '[]', 1, '2025-05-28 00:04:28', '2025-05-28 00:04:28'),
(698, 'App\\Models\\UserInvitation', 442, '886d44e2-5c22-4c08-af36-276ad4855a22', 'qr', '1748379873', '1748379873.png', 'image/png', 'public', 'public', 21960, '[]', '[]', '[]', '[]', 2, '2025-05-28 00:04:33', '2025-05-28 00:04:33'),
(699, 'App\\Models\\UserInvitation', 441, 'c94348dc-a112-4c9f-88f4-eb395c454c3a', 'qr', '1748380190', '1748380190.jpg', 'image/jpeg', 'public', 'public', 21171, '[]', '[]', '[]', '[]', 4, '2025-05-28 00:09:50', '2025-05-28 00:09:50'),
(700, 'App\\Models\\UserInvitation', 441, 'e09d61b3-7643-45d4-84e5-018849e6cf97', 'userInvitation', '25ef9fbd679a0be1dc4e0a62b74dbc99', '25ef9fbd679a0be1dc4e0a62b74dbc99.jpg', 'image/jpeg', 'public', 'public', 86958, '[]', '[]', '[]', '[]', 5, '2025-05-28 00:09:50', '2025-05-28 00:09:50'),
(701, 'App\\Models\\UserInvitation', 443, '1d4630c2-63ae-4b05-a5e7-49d400ed9996', 'userInvitation', 'PSX_20240829_203659', 'PSX_20240829_203659.jpg', 'image/jpeg', 'public', 'public', 1032093, '[]', '[]', '[]', '[]', 1, '2025-05-28 00:43:27', '2025-05-28 00:43:27'),
(702, 'App\\Models\\UserInvitation', 443, '4b011fce-8672-4ccf-a172-2705aa6766a4', 'qr', '1748382214', '1748382214.png', 'image/png', 'public', 'public', 28032, '[]', '[]', '[]', '[]', 2, '2025-05-28 00:43:34', '2025-05-28 00:43:34'),
(703, 'App\\Models\\UserInvitation', 443, '81837407-5dea-42d3-ad08-670539de9654', 'userInvitation', '57e7b88dfac32d963896629581ba685e', '57e7b88dfac32d963896629581ba685e.jpg', 'image/jpeg', 'public', 'public', 1218211, '[]', '[]', '[]', '[]', 3, '2025-05-28 00:43:35', '2025-05-28 00:43:35'),
(704, 'App\\Models\\UserInvitation', 444, 'd97c9d94-d372-4348-981d-3b49a979d7b1', 'userInvitation', 'PSX_20240829_203659', 'PSX_20240829_203659.jpg', 'image/jpeg', 'public', 'public', 1032093, '[]', '[]', '[]', '[]', 1, '2025-05-28 00:47:23', '2025-05-28 00:47:23'),
(705, 'App\\Models\\UserInvitation', 444, '502740a9-a028-4af6-96f4-2fbd917604bb', 'qr', '1748382451', '1748382451.png', 'image/png', 'public', 'public', 28116, '[]', '[]', '[]', '[]', 2, '2025-05-28 00:47:31', '2025-05-28 00:47:31'),
(706, 'App\\Models\\UserInvitation', 444, 'c05aa7b7-5f6e-48c0-ab24-8c4f32148488', 'userInvitation', '3b9718eaa567a19672c6ffc2c2271f5c', '3b9718eaa567a19672c6ffc2c2271f5c.jpg', 'image/jpeg', 'public', 'public', 1220927, '[]', '[]', '[]', '[]', 3, '2025-05-28 00:47:31', '2025-05-28 00:47:31'),
(707, 'App\\Models\\UserInvitation', 445, 'b07d6850-5430-4086-ba1e-decc06a30d64', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-28 00:48:59', '2025-05-28 00:48:59'),
(708, 'App\\Models\\UserInvitation', 445, '38f3be85-19ec-4757-92e4-3bf6d89301a1', 'qr', '1748382541', '1748382541.png', 'image/png', 'public', 'public', 33983, '[]', '[]', '[]', '[]', 2, '2025-05-28 00:49:01', '2025-05-28 00:49:01'),
(709, 'App\\Models\\UserInvitation', 445, '50acd3bf-bf1d-428e-a3e4-6eb0264813db', 'userInvitation', 'cdc01f92aed8ac49edda1b8a07629bed', 'cdc01f92aed8ac49edda1b8a07629bed.jpg', 'image/jpeg', 'public', 'public', 92323, '[]', '[]', '[]', '[]', 3, '2025-05-28 00:49:01', '2025-05-28 00:49:01'),
(710, 'App\\Models\\UserInvitation', 446, '13436ada-8166-4b34-9515-282e6a2fe1d4', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-28 00:51:52', '2025-05-28 00:51:52'),
(711, 'App\\Models\\UserInvitation', 446, '8b1eaee2-00b1-433e-b784-b66ed9a4a9cb', 'qr', '1748382714', '1748382714.png', 'image/png', 'public', 'public', 34157, '[]', '[]', '[]', '[]', 2, '2025-05-28 00:51:54', '2025-05-28 00:51:54'),
(712, 'App\\Models\\UserInvitation', 446, 'a35ae69f-4444-4350-b11a-cbc189bd6640', 'userInvitation', '192f2cb815733dc978f036f1a0a87d83', '192f2cb815733dc978f036f1a0a87d83.jpg', 'image/jpeg', 'public', 'public', 90408, '[]', '[]', '[]', '[]', 3, '2025-05-28 00:51:54', '2025-05-28 00:51:54'),
(713, 'App\\Models\\UserInvitation', 447, '67274259-8993-4963-a859-0063ec8a696d', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-28 00:57:07', '2025-05-28 00:57:07'),
(714, 'App\\Models\\UserInvitation', 447, '11091269-d1f3-4df9-af5c-ecbe1099b80c', 'qr', '1748383029', '1748383029.png', 'image/png', 'public', 'public', 32268, '[]', '[]', '[]', '[]', 2, '2025-05-28 00:57:09', '2025-05-28 00:57:09'),
(715, 'App\\Models\\UserInvitation', 447, 'ba5e8835-0075-416e-9026-62afc3d998a3', 'userInvitation', '429538ddbb92259b683a2aeb7dec2d0a', '429538ddbb92259b683a2aeb7dec2d0a.jpg', 'image/jpeg', 'public', 'public', 89651, '[]', '[]', '[]', '[]', 3, '2025-05-28 00:57:09', '2025-05-28 00:57:09'),
(716, 'App\\Models\\UserInvitation', 448, '84d54fae-d93b-4bea-82fa-d1e816b82bf4', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-28 00:58:40', '2025-05-28 00:58:40'),
(717, 'App\\Models\\UserInvitation', 448, 'e404d99e-81c2-46da-accb-d15426444947', 'qr', '1748383122', '1748383122.png', 'image/png', 'public', 'public', 32527, '[]', '[]', '[]', '[]', 2, '2025-05-28 00:58:42', '2025-05-28 00:58:42'),
(718, 'App\\Models\\UserInvitation', 448, 'd11b5d72-2361-49db-8367-ef7f4b9ca5e2', 'userInvitation', '51f125f851c50d95aecd2a422f1fb531', '51f125f851c50d95aecd2a422f1fb531.jpg', 'image/jpeg', 'public', 'public', 92029, '[]', '[]', '[]', '[]', 3, '2025-05-28 00:58:42', '2025-05-28 00:58:42'),
(719, 'App\\Models\\UserInvitation', 449, 'cc0a1a50-b554-47c2-b0fd-ab23fa5d3cef', 'userInvitation', 'PSX_20240722_235132', 'PSX_20240722_235132.jpg', 'image/jpeg', 'public', 'public', 1830431, '[]', '[]', '[]', '[]', 1, '2025-05-28 01:01:20', '2025-05-28 01:01:20'),
(720, 'App\\Models\\UserInvitation', 449, 'f4628ee0-1cb9-400d-898b-02561f2c3bd4', 'qr', '1748383286', '1748383286.png', 'image/png', 'public', 'public', 27421, '[]', '[]', '[]', '[]', 2, '2025-05-28 01:01:26', '2025-05-28 01:01:26'),
(721, 'App\\Models\\UserInvitation', 449, 'ab82bd70-2bdf-475f-ac2e-b369dec09a40', 'userInvitation', '222a1eac954928b0f67a02f7540e99ac', '222a1eac954928b0f67a02f7540e99ac.jpg', 'image/jpeg', 'public', 'public', 2219667, '[]', '[]', '[]', '[]', 3, '2025-05-28 01:01:27', '2025-05-28 01:01:27'),
(722, 'App\\Models\\UserInvitation', 450, '58b8ca17-4eac-401d-b712-c08dce2615e8', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-28 01:02:48', '2025-05-28 01:02:48'),
(723, 'App\\Models\\UserInvitation', 450, '1ac53080-e744-4d6c-8a39-c7c444251765', 'qr', '1748383370', '1748383370.png', 'image/png', 'public', 'public', 32382, '[]', '[]', '[]', '[]', 2, '2025-05-28 01:02:50', '2025-05-28 01:02:50'),
(724, 'App\\Models\\UserInvitation', 450, '15f24696-9179-4b0a-aa41-b2995a46ff15', 'userInvitation', '75e5e3655e7d842bd7e6ea8a23a9793c', '75e5e3655e7d842bd7e6ea8a23a9793c.jpg', 'image/jpeg', 'public', 'public', 89886, '[]', '[]', '[]', '[]', 3, '2025-05-28 01:02:50', '2025-05-28 01:02:50'),
(725, 'App\\Models\\UserInvitation', 451, '496e7eb0-72ac-4c18-9a80-5128289963fb', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-28 01:08:19', '2025-05-28 01:08:19'),
(726, 'App\\Models\\UserInvitation', 451, '99491f02-0eec-4804-bb03-c9d27f53b9e9', 'qr', '1748383701', '1748383701.png', 'image/png', 'public', 'public', 32029, '[]', '[]', '[]', '[]', 2, '2025-05-28 01:08:21', '2025-05-28 01:08:21'),
(727, 'App\\Models\\UserInvitation', 451, '27ad535a-0ee3-4a62-beae-7b5bafac7201', 'userInvitation', '9e5c59d3b1ef5caa857c75d8b8410549', '9e5c59d3b1ef5caa857c75d8b8410549.jpg', 'image/jpeg', 'public', 'public', 88220, '[]', '[]', '[]', '[]', 3, '2025-05-28 01:08:21', '2025-05-28 01:08:21'),
(728, 'App\\Models\\UserInvitation', 452, '2b02d114-540c-4db8-a53a-30b6f7553f53', 'userInvitation', 'PhotoRoom-20220501_143506_edit_360174269790872', 'PhotoRoom-20220501_143506_edit_360174269790872.png', 'image/png', 'public', 'public', 420439, '[]', '[]', '[]', '[]', 1, '2025-05-28 01:09:04', '2025-05-28 01:09:04'),
(729, 'App\\Models\\UserInvitation', 452, '3d051534-99a4-4639-95c6-19a09a1b7749', 'qr', '1748383747', '1748383747.png', 'image/png', 'public', 'public', 27469, '[]', '[]', '[]', '[]', 2, '2025-05-28 01:09:07', '2025-05-28 01:09:07'),
(730, 'App\\Models\\UserInvitation', 452, '0158aa7c-37b4-43cb-95f6-46620e1357a5', 'userInvitation', 'c8a4b82d01c47ca55456ec4fbb8e94a6', 'c8a4b82d01c47ca55456ec4fbb8e94a6.jpg', 'image/jpeg', 'public', 'public', 83690, '[]', '[]', '[]', '[]', 3, '2025-05-28 01:09:07', '2025-05-28 01:09:07'),
(731, 'App\\Models\\UserInvitation', 453, '7f983ad8-0204-40f2-816e-141b0b149932', 'userInvitation', 'PSX_20231127_161554', 'PSX_20231127_161554.jpg', 'image/jpeg', 'public', 'public', 1465287, '[]', '[]', '[]', '[]', 1, '2025-05-28 01:22:29', '2025-05-28 01:22:29'),
(732, 'App\\Models\\UserInvitation', 453, '7f1551fa-f77f-4dda-8de2-1b55f403ca92', 'qr', '1748384552', '1748384552.png', 'image/png', 'public', 'public', 27549, '[]', '[]', '[]', '[]', 2, '2025-05-28 01:22:32', '2025-05-28 01:22:32'),
(733, 'App\\Models\\UserInvitation', 453, '70454f26-9ffc-4151-a236-4c4339d8d032', 'userInvitation', '8f630bf580fd8926f1c36d94038a6d33', '8f630bf580fd8926f1c36d94038a6d33.jpg', 'image/jpeg', 'public', 'public', 1794729, '[]', '[]', '[]', '[]', 3, '2025-05-28 01:22:33', '2025-05-28 01:22:33'),
(734, 'App\\Models\\UserInvitation', 454, 'f5c4e924-13e8-42a5-8bf3-cd56879c0c91', 'userInvitation', 'PSX_20231127_161554', 'PSX_20231127_161554.jpg', 'image/jpeg', 'public', 'public', 1465287, '[]', '[]', '[]', '[]', 1, '2025-05-28 01:38:45', '2025-05-28 01:38:45'),
(735, 'App\\Models\\UserInvitation', 454, '3e474e2b-7067-4634-b0fd-891064288927', 'qr', '1748385527', '1748385527.png', 'image/png', 'public', 'public', 27403, '[]', '[]', '[]', '[]', 2, '2025-05-28 01:38:48', '2025-05-28 01:38:48'),
(736, 'App\\Models\\UserInvitation', 454, 'b8b49afe-7866-40ac-84f0-cb29a9290435', 'userInvitation', 'edc9d1146e0b887c52e03731c3f0a11b', 'edc9d1146e0b887c52e03731c3f0a11b.jpg', 'image/jpeg', 'public', 'public', 1794385, '[]', '[]', '[]', '[]', 3, '2025-05-28 01:38:48', '2025-05-28 01:38:48'),
(737, 'App\\Models\\UserInvitation', 455, '64d2c194-b62b-4513-b35b-b57914a34941', 'userInvitation', 'PSX_20230923_005637', 'PSX_20230923_005637.jpg', 'image/jpeg', 'public', 'public', 1641882, '[]', '[]', '[]', '[]', 1, '2025-05-28 11:00:26', '2025-05-28 11:00:26'),
(738, 'App\\Models\\UserInvitation', 455, '07e1c13d-3e67-4f09-88ea-0d211bae5335', 'qr', '1748419229', '1748419229.png', 'image/png', 'public', 'public', 27381, '[]', '[]', '[]', '[]', 2, '2025-05-28 11:00:29', '2025-05-28 11:00:29'),
(739, 'App\\Models\\UserInvitation', 455, '0fd879a6-958a-4a06-a388-5d88942aa266', 'userInvitation', '666c9aaf4771b43afd2bd6e80dbd173d', '666c9aaf4771b43afd2bd6e80dbd173d.jpg', 'image/jpeg', 'public', 'public', 1989932, '[]', '[]', '[]', '[]', 3, '2025-05-28 11:00:30', '2025-05-28 11:00:30'),
(740, 'App\\Models\\UserInvitation', 456, '51466720-b704-4b5d-a48c-132f5285e37a', 'userInvitation', 'PSX_20240829_203659', 'PSX_20240829_203659.jpg', 'image/jpeg', 'public', 'public', 1032093, '[]', '[]', '[]', '[]', 1, '2025-05-28 11:03:50', '2025-05-28 11:03:50'),
(741, 'App\\Models\\UserInvitation', 456, '38feac1a-6d99-47a0-b3b6-f5138441be4b', 'qr', '1748419433', '1748419433.png', 'image/png', 'public', 'public', 27337, '[]', '[]', '[]', '[]', 2, '2025-05-28 11:03:53', '2025-05-28 11:03:53');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(742, 'App\\Models\\UserInvitation', 456, '82206ae6-104f-411a-bd7c-b0e8c8ff3ac0', 'userInvitation', 'a345f5d4660a93b23e0bbb0867364fd3', 'a345f5d4660a93b23e0bbb0867364fd3.jpg', 'image/jpeg', 'public', 'public', 1217031, '[]', '[]', '[]', '[]', 3, '2025-05-28 11:03:53', '2025-05-28 11:03:53'),
(743, 'App\\Models\\UserInvitation', 457, '683447fc-8bc0-4833-869a-6c5106abe726', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-28 13:12:58', '2025-05-28 13:12:58'),
(744, 'App\\Models\\UserInvitation', 457, 'f94018a2-430c-43ca-ba3b-971c7cbfd28a', 'qr', '1748427181', '1748427181.png', 'image/png', 'public', 'public', 32181, '[]', '[]', '[]', '[]', 2, '2025-05-28 13:13:01', '2025-05-28 13:13:01'),
(745, 'App\\Models\\UserInvitation', 457, '56e7c45e-a989-4d30-85d0-4b66d03f6510', 'userInvitation', '660cdc018f24ab9379c67ad3cf6606c1', '660cdc018f24ab9379c67ad3cf6606c1.jpg', 'image/jpeg', 'public', 'public', 88406, '[]', '[]', '[]', '[]', 3, '2025-05-28 13:13:01', '2025-05-28 13:13:01'),
(746, 'App\\Models\\UserInvitation', 458, 'ea09ff50-472d-4c07-9eed-e93d8dff0b8c', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-28 13:23:56', '2025-05-28 13:23:56'),
(747, 'App\\Models\\UserInvitation', 458, '6219ea24-5099-4993-9c64-44deccc309f6', 'qr', '1748427838', '1748427838.png', 'image/png', 'public', 'public', 32250, '[]', '[]', '[]', '[]', 2, '2025-05-28 13:23:58', '2025-05-28 13:23:58'),
(748, 'App\\Models\\UserInvitation', 458, '7f366db9-0cd3-47a3-87fb-1c38cd29c652', 'userInvitation', 'e4bcd71c42779c13594c5f3cd5ae7404', 'e4bcd71c42779c13594c5f3cd5ae7404.jpg', 'image/jpeg', 'public', 'public', 89329, '[]', '[]', '[]', '[]', 3, '2025-05-28 13:23:58', '2025-05-28 13:23:58'),
(749, 'App\\Models\\UserInvitation', 459, '2d5569f4-7677-44ea-9e4c-ae70c6889961', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-28 14:41:44', '2025-05-28 14:41:44'),
(750, 'App\\Models\\UserInvitation', 459, '26e603ad-8849-4d30-85ea-2786c0694211', 'qr', '1748432507', '1748432507.png', 'image/png', 'public', 'public', 32027, '[]', '[]', '[]', '[]', 2, '2025-05-28 14:41:47', '2025-05-28 14:41:47'),
(751, 'App\\Models\\UserInvitation', 459, 'b0d0b4d5-7c98-40d1-b263-a838419006cc', 'userInvitation', '44e40038f876b2258733eeea43a8eef9', '44e40038f876b2258733eeea43a8eef9.jpg', 'image/jpeg', 'public', 'public', 90253, '[]', '[]', '[]', '[]', 3, '2025-05-28 14:41:47', '2025-05-28 14:41:47'),
(752, 'App\\Models\\UserInvitation', 460, '383e0d8d-45de-4f58-988b-6e7d7eaec002', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-28 15:00:37', '2025-05-28 15:00:37'),
(753, 'App\\Models\\UserInvitation', 460, 'da6e676d-ed22-4097-9e50-da9533febbaf', 'qr', '1748433640', '1748433640.png', 'image/png', 'public', 'public', 32248, '[]', '[]', '[]', '[]', 2, '2025-05-28 15:00:40', '2025-05-28 15:00:40'),
(754, 'App\\Models\\UserInvitation', 460, '44c99a8d-91ab-477a-8df9-ecb8bc773b89', 'userInvitation', 'a5e080c9b3fe0e98d6d86e812539564d', 'a5e080c9b3fe0e98d6d86e812539564d.jpg', 'image/jpeg', 'public', 'public', 88483, '[]', '[]', '[]', '[]', 3, '2025-05-28 15:00:40', '2025-05-28 15:00:40'),
(755, 'App\\Models\\UserInvitation', 461, '9d00c4eb-04ec-48b8-8e64-ce6d9a96a3aa', 'userInvitation', 'PSX_20240829_203659', 'PSX_20240829_203659.jpg', 'image/jpeg', 'public', 'public', 1032093, '[]', '[]', '[]', '[]', 1, '2025-05-28 17:10:53', '2025-05-28 17:10:53'),
(756, 'App\\Models\\UserInvitation', 461, '5285d975-abbf-4b39-9543-b515b2c55e70', 'qr', '1748441460', '1748441460.png', 'image/png', 'public', 'public', 26667, '[]', '[]', '[]', '[]', 2, '2025-05-28 17:11:00', '2025-05-28 17:11:00'),
(757, 'App\\Models\\UserInvitation', 461, '10648856-fcf4-4537-a332-157b1a5b2108', 'userInvitation', '4a2708bdcf9fba61e616ad41c1c54c2c', '4a2708bdcf9fba61e616ad41c1c54c2c.jpg', 'image/jpeg', 'public', 'public', 1216654, '[]', '[]', '[]', '[]', 3, '2025-05-28 17:11:00', '2025-05-28 17:11:00'),
(758, 'App\\Models\\UserInvitation', 462, '18034881-45de-4756-893c-92d486037c26', 'userInvitation', 'IMG_20240922_171753', 'IMG_20240922_171753.jpg', 'image/jpeg', 'public', 'public', 2658036, '[]', '[]', '[]', '[]', 1, '2025-05-29 12:38:39', '2025-05-29 12:38:39'),
(759, 'App\\Models\\UserInvitation', 462, '32a0e141-b9ee-4462-9394-36cbf0dd13e0', 'qr', '1748511523', '1748511523.png', 'image/png', 'public', 'public', 26568, '[]', '[]', '[]', '[]', 2, '2025-05-29 12:38:43', '2025-05-29 12:38:43'),
(760, 'App\\Models\\UserInvitation', 462, '3661acf3-2d5f-4790-b8fb-54c3568b61ea', 'userInvitation', '90f07327a535916a8959ac69679f1dde', '90f07327a535916a8959ac69679f1dde.jpg', 'image/jpeg', 'public', 'public', 1734103, '[]', '[]', '[]', '[]', 3, '2025-05-29 12:38:43', '2025-05-29 12:38:43'),
(761, 'App\\Models\\UserInvitation', 463, 'c47ea5e7-0604-40b6-bf47-669089e2d090', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-05-29 15:19:13', '2025-05-29 15:19:13'),
(762, 'App\\Models\\UserInvitation', 463, '0332f3db-6c1f-4693-897d-4d83b7cd9e0b', 'qr', '1748521156', '1748521156.png', 'image/png', 'public', 'public', 30759, '[]', '[]', '[]', '[]', 2, '2025-05-29 15:19:17', '2025-05-29 15:19:17'),
(763, 'App\\Models\\UserInvitation', 464, '166972e1-a174-41a6-9827-023f8813399b', 'userInvitation', 'Blank-Engagemen', 'Blank-Engagemen.jpg', 'image/jpeg', 'public', 'public', 25249, '[]', '[]', '[]', '[]', 1, '2025-05-31 13:03:46', '2025-05-31 13:03:46'),
(764, 'App\\Models\\UserInvitation', 464, '50974fad-7dab-4647-ab1d-86bd3d350e10', 'qr', '1748685829', '1748685829.png', 'image/png', 'public', 'public', 31843, '[]', '[]', '[]', '[]', 2, '2025-05-31 13:03:49', '2025-05-31 13:03:49'),
(765, 'App\\Models\\UserInvitation', 465, '3680763f-fe39-4eee-9de4-ca23ab726ccf', 'userInvitation', 'Blank-Engagemen', 'Blank-Engagemen.jpg', 'image/jpeg', 'public', 'public', 25249, '[]', '[]', '[]', '[]', 1, '2025-05-31 13:04:45', '2025-05-31 13:04:45'),
(766, 'App\\Models\\UserInvitation', 465, 'b5f7f28d-97b6-4c25-a836-9a9ce67cb00e', 'qr', '1748685887', '1748685887.png', 'image/png', 'public', 'public', 31682, '[]', '[]', '[]', '[]', 2, '2025-05-31 13:04:47', '2025-05-31 13:04:47'),
(767, 'App\\Models\\UserInvitation', 466, '6cafb2a9-48bd-4706-a214-e37942dbcc5d', 'userInvitation', 'Blank-Engagemen', 'Blank-Engagemen.jpg', 'image/jpeg', 'public', 'public', 25249, '[]', '[]', '[]', '[]', 1, '2025-05-31 13:29:18', '2025-05-31 13:29:18'),
(768, 'App\\Models\\UserInvitation', 466, '5c3842ff-2d58-4966-bbd7-8ff99749f362', 'qr', '1748687361', '1748687361.png', 'image/png', 'public', 'public', 31643, '[]', '[]', '[]', '[]', 2, '2025-05-31 13:29:21', '2025-05-31 13:29:21'),
(769, 'App\\Models\\UserInvitation', 467, 'd2934583-bf62-4cc6-bb96-8cb280342abf', 'userInvitation', 'IMG_20240618_181907', 'IMG_20240618_181907.jpg', 'image/jpeg', 'public', 'public', 1306103, '[]', '[]', '[]', '[]', 1, '2025-05-31 13:34:42', '2025-05-31 13:34:42'),
(770, 'App\\Models\\UserInvitation', 467, '9d48981c-7f1e-42d7-99b1-b9ab8115ce01', 'qr', '1748687685', '1748687685.png', 'image/png', 'public', 'public', 26653, '[]', '[]', '[]', '[]', 2, '2025-05-31 13:34:45', '2025-05-31 13:34:45'),
(771, 'App\\Models\\UserInvitation', 467, '9a7c0d8e-c30c-4a2d-aad1-1cd3d3116aa2', 'userInvitation', 'cb72d6b7d5392bca2f6c6fa9b1a154b9', 'cb72d6b7d5392bca2f6c6fa9b1a154b9.jpg', 'image/jpeg', 'public', 'public', 1162141, '[]', '[]', '[]', '[]', 3, '2025-05-31 13:34:45', '2025-05-31 13:34:45'),
(772, 'App\\Models\\UserInvitation', 468, '84b3834a-cb5c-456a-b4a3-9229f54a844c', 'userInvitation', 'PSX_20240829_203659', 'PSX_20240829_203659.jpg', 'image/jpeg', 'public', 'public', 1032093, '[]', '[]', '[]', '[]', 1, '2025-05-31 13:37:52', '2025-05-31 13:37:52'),
(773, 'App\\Models\\UserInvitation', 468, '8e7c39f4-6740-4097-9eb1-5cdac83762ca', 'qr', '1748687874', '1748687874.png', 'image/png', 'public', 'public', 27262, '[]', '[]', '[]', '[]', 2, '2025-05-31 13:37:54', '2025-05-31 13:37:54'),
(774, 'App\\Models\\UserInvitation', 468, '40070d50-c31a-436f-bf7d-1dbac2891a81', 'userInvitation', 'ddbb82ecb10c5ef90286217b70b00852', 'ddbb82ecb10c5ef90286217b70b00852.jpg', 'image/jpeg', 'public', 'public', 1218038, '[]', '[]', '[]', '[]', 3, '2025-05-31 13:37:55', '2025-05-31 13:37:55'),
(775, 'App\\Models\\UserInvitation', 469, '8cfd24ee-0ffe-401a-8788-c95d7b590385', 'userInvitation', 'PSX_20240829_203659', 'PSX_20240829_203659.jpg', 'image/jpeg', 'public', 'public', 1032093, '[]', '[]', '[]', '[]', 1, '2025-05-31 13:40:19', '2025-05-31 13:40:19'),
(776, 'App\\Models\\UserInvitation', 469, 'a4a29112-b774-4ac5-81a7-977623b875d0', 'qr', '1748688021', '1748688021.png', 'image/png', 'public', 'public', 25959, '[]', '[]', '[]', '[]', 2, '2025-05-31 13:40:21', '2025-05-31 13:40:21'),
(777, 'App\\Models\\UserInvitation', 468, '9a4576bc-eac6-4bed-a978-0f45acbfaeb8', 'qr', '1748688156', '1748688156.jpg', 'image/jpeg', 'public', 'public', 21016, '[]', '[]', '[]', '[]', 4, '2025-05-31 13:42:36', '2025-05-31 13:42:36'),
(778, 'App\\Models\\UserInvitation', 468, '47d3673f-2012-4d33-820e-6f6e7a8bc49e', 'userInvitation', '15b8768a7b8a4d8434303411a49bff9f', '15b8768a7b8a4d8434303411a49bff9f.jpg', 'image/jpeg', 'public', 'public', 1216070, '[]', '[]', '[]', '[]', 5, '2025-05-31 13:42:36', '2025-05-31 13:42:36'),
(779, 'App\\Models\\UserInvitation', 468, '82526793-f926-4280-bd11-56108a0ccd91', 'qr', '1748688192', '1748688192.jpg', 'image/jpeg', 'public', 'public', 23579, '[]', '[]', '[]', '[]', 6, '2025-05-31 13:43:12', '2025-05-31 13:43:12'),
(780, 'App\\Models\\UserInvitation', 468, '386624d8-73dc-422d-9b06-443be4ff6a79', 'userInvitation', '1cdb4bd992faf4cb03f27c9398e76954', '1cdb4bd992faf4cb03f27c9398e76954.jpg', 'image/jpeg', 'public', 'public', 1221156, '[]', '[]', '[]', '[]', 7, '2025-05-31 13:43:12', '2025-05-31 13:43:12'),
(781, 'App\\Models\\UserInvitation', 470, '674f6225-876b-48f5-9160-3a2683a21c61', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-05-31 14:01:26', '2025-05-31 14:01:26'),
(782, 'App\\Models\\UserInvitation', 470, 'd336a4a3-c131-433d-888d-7da35adab389', 'qr', '1748689289', '1748689289.png', 'image/png', 'public', 'public', 27538, '[]', '[]', '[]', '[]', 2, '2025-05-31 14:01:29', '2025-05-31 14:01:29'),
(783, 'App\\Models\\UserInvitation', 471, '0a3a718d-e986-48a6-bfce-228c2c8dd4cf', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-05-31 14:04:57', '2025-05-31 14:04:57'),
(784, 'App\\Models\\UserInvitation', 471, '92f75634-9c89-4853-a375-86f60342fed5', 'qr', '1748689500', '1748689500.png', 'image/png', 'public', 'public', 27389, '[]', '[]', '[]', '[]', 2, '2025-05-31 14:05:00', '2025-05-31 14:05:00'),
(785, 'App\\Models\\UserInvitation', 471, '8802e75c-a1e1-4598-8475-4e31721f4a9e', 'userInvitation', '75c46203818676f534018bd838258a39', '75c46203818676f534018bd838258a39.jpg', 'image/jpeg', 'public', 'public', 486553, '[]', '[]', '[]', '[]', 3, '2025-05-31 14:05:00', '2025-05-31 14:05:00'),
(786, 'App\\Models\\UserInvitation', 472, '93cad727-a990-495f-9cd0-3b6fc85edfe7', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-05-31 15:10:17', '2025-05-31 15:10:17'),
(787, 'App\\Models\\UserInvitation', 472, '91619946-0f49-4139-8b03-2472c6558a09', 'qr', '1748693420', '1748693420.png', 'image/png', 'public', 'public', 27426, '[]', '[]', '[]', '[]', 2, '2025-05-31 15:10:20', '2025-05-31 15:10:20'),
(788, 'App\\Models\\UserInvitation', 473, 'acdc8d3c-4715-4777-a1f1-37fa51099f80', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-05-31 15:11:37', '2025-05-31 15:11:37'),
(789, 'App\\Models\\UserInvitation', 473, '39af18c0-8028-4fbe-b368-0ee8be6ad984', 'qr', '1748693500', '1748693500.png', 'image/png', 'public', 'public', 27459, '[]', '[]', '[]', '[]', 2, '2025-05-31 15:11:40', '2025-05-31 15:11:40'),
(790, 'App\\Models\\UserInvitation', 473, 'cb562ebe-3830-4905-8fd1-0dfbf8cbc210', 'userInvitation', '6e8431949d48903061ec42e4b4c2315e', '6e8431949d48903061ec42e4b4c2315e.jpg', 'image/jpeg', 'public', 'public', 485234, '[]', '[]', '[]', '[]', 3, '2025-05-31 15:11:40', '2025-05-31 15:11:40'),
(791, 'App\\Models\\UserInvitation', 474, '230b0fdf-9fc3-471a-a29d-97c5766f161f', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-05-31 15:14:01', '2025-05-31 15:14:01'),
(792, 'App\\Models\\UserInvitation', 474, 'd7090001-0a4d-4ba6-8d59-254a4d204b26', 'qr', '1748693644', '1748693644.png', 'image/png', 'public', 'public', 26444, '[]', '[]', '[]', '[]', 2, '2025-05-31 15:14:05', '2025-05-31 15:14:05'),
(793, 'App\\Models\\UserInvitation', 475, '00f2be08-6702-4cf0-b09c-ac837c3ec06d', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-05-31 15:15:54', '2025-05-31 15:15:54'),
(794, 'App\\Models\\UserInvitation', 475, '4dfb1616-2f9a-49b3-b14c-8d36a59e5a39', 'qr', '1748693757', '1748693757.png', 'image/png', 'public', 'public', 27279, '[]', '[]', '[]', '[]', 2, '2025-05-31 15:15:57', '2025-05-31 15:15:57'),
(795, 'App\\Models\\UserInvitation', 475, '18385b2e-2e4b-42ed-9b60-5d9b17f224ed', 'userInvitation', '8c129b165fa1f5d02373c5dd64216a50', '8c129b165fa1f5d02373c5dd64216a50.jpg', 'image/jpeg', 'public', 'public', 485146, '[]', '[]', '[]', '[]', 3, '2025-05-31 15:15:57', '2025-05-31 15:15:57'),
(796, 'App\\Models\\UserInvitation', 476, '96fe43dc-a8e7-46ac-83db-3e742a328bda', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-05-31 15:32:45', '2025-05-31 15:32:45'),
(797, 'App\\Models\\UserInvitation', 476, '04b79fa0-5974-4da7-a9cf-f3a03284b601', 'qr', '1748694767', '1748694767.png', 'image/png', 'public', 'public', 26644, '[]', '[]', '[]', '[]', 2, '2025-05-31 15:32:48', '2025-05-31 15:32:48'),
(798, 'App\\Models\\UserInvitation', 477, '6d12405f-4358-470c-ad09-a0969423596a', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-05-31 16:25:09', '2025-05-31 16:25:09'),
(799, 'App\\Models\\UserInvitation', 477, '679f5c86-2f20-4537-aa38-fbabe8e8e486', 'qr', '1748697912', '1748697912.png', 'image/png', 'public', 'public', 26562, '[]', '[]', '[]', '[]', 2, '2025-05-31 16:25:12', '2025-05-31 16:25:12'),
(800, 'App\\Models\\UserInvitation', 478, '3715f7e4-b308-4ac6-94eb-11bfe686ce26', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-01 20:01:04', '2025-06-01 20:01:04'),
(801, 'App\\Models\\UserInvitation', 479, 'b9857319-f3e2-4d8a-be6a-bed6e2a3c23c', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-06-01 20:03:52', '2025-06-01 20:03:52'),
(802, 'App\\Models\\UserInvitation', 480, 'd07409e2-53cb-474d-8b29-6b191354c7f3', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-01 20:14:31', '2025-06-01 20:14:31'),
(803, 'App\\Models\\UserInvitation', 480, '996abcd0-8c07-40da-a23b-e6286aaa54c6', 'qr', '1748798073', '1748798073.png', 'image/png', 'public', 'public', 26548, '[]', '[]', '[]', '[]', 2, '2025-06-01 20:14:33', '2025-06-01 20:14:33'),
(804, 'App\\Models\\UserInvitation', 481, 'db829e09-5d92-4575-971b-955b63fe9c9f', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-01 20:15:41', '2025-06-01 20:15:41'),
(805, 'App\\Models\\UserInvitation', 481, '56d23019-db9a-462d-93b2-c75b8a98d392', 'qr', '1748798144', '1748798144.png', 'image/png', 'public', 'public', 26445, '[]', '[]', '[]', '[]', 2, '2025-06-01 20:15:44', '2025-06-01 20:15:44'),
(806, 'App\\Models\\UserInvitation', 481, '4b7489fc-6bdf-4371-bb73-d081d2e6b9d3', 'userInvitation', '51ef0c4891b9c3cbdfe70940af0defc5', '51ef0c4891b9c3cbdfe70940af0defc5.jpg', 'image/jpeg', 'public', 'public', 484373, '[]', '[]', '[]', '[]', 3, '2025-06-01 20:15:44', '2025-06-01 20:15:44'),
(807, 'App\\Models\\UserInvitation', 482, 'a317f3ff-519b-49ac-a91d-f128aaa3498e', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-01 20:17:33', '2025-06-01 20:17:33'),
(808, 'App\\Models\\UserInvitation', 482, '58a2f4a7-9456-4ceb-8097-d44c5b925751', 'qr', '1748798255', '1748798255.png', 'image/png', 'public', 'public', 26464, '[]', '[]', '[]', '[]', 2, '2025-06-01 20:17:35', '2025-06-01 20:17:35'),
(809, 'App\\Models\\UserInvitation', 482, 'eef86059-3856-4ef5-bf02-1344e44445c1', 'userInvitation', '296f1f20f959d7a9f952038f89229746', '296f1f20f959d7a9f952038f89229746.jpg', 'image/jpeg', 'public', 'public', 484335, '[]', '[]', '[]', '[]', 3, '2025-06-01 20:17:35', '2025-06-01 20:17:35'),
(810, 'App\\Models\\UserInvitation', 483, '6786d2f3-2f10-4ef2-827b-ff20d7abfd68', 'userInvitation', 'invitation', 'invitation.jpg', 'image/jpeg', 'public', 'public', 38101, '[]', '[]', '[]', '[]', 1, '2025-06-01 21:01:45', '2025-06-01 21:01:45'),
(811, 'App\\Models\\UserInvitation', 483, '944ea783-29aa-4c37-82a1-fcf20f6461da', 'qr', '1748800908', '1748800908.png', 'image/png', 'public', 'public', 31572, '[]', '[]', '[]', '[]', 2, '2025-06-01 21:01:48', '2025-06-01 21:01:48'),
(812, 'App\\Models\\UserInvitation', 484, 'e0a50a86-7b26-4697-8a28-fce5eaddf4a4', 'userInvitation', 'Blank-Engagemen', 'Blank-Engagemen.jpg', 'image/jpeg', 'public', 'public', 25249, '[]', '[]', '[]', '[]', 1, '2025-06-02 17:24:47', '2025-06-02 17:24:47'),
(813, 'App\\Models\\UserInvitation', 484, 'f47e4af0-2691-41b7-98e7-43c2f5b5a2f0', 'qr', '1748874291', '1748874291.png', 'image/png', 'public', 'public', 32659, '[]', '[]', '[]', '[]', 2, '2025-06-02 17:24:51', '2025-06-02 17:24:51'),
(814, 'App\\Models\\UserInvitation', 485, 'b32c9ab0-de77-4795-a19e-9f4584c55549', 'userInvitation', 'Blank-Engagemen', 'Blank-Engagemen.jpg', 'image/jpeg', 'public', 'public', 25249, '[]', '[]', '[]', '[]', 1, '2025-06-02 17:30:22', '2025-06-02 17:30:22'),
(815, 'App\\Models\\UserInvitation', 485, '67f62a74-99a6-4d20-bdf1-f9d12746b939', 'qr', '1748874624', '1748874624.png', 'image/png', 'public', 'public', 31467, '[]', '[]', '[]', '[]', 2, '2025-06-02 17:30:24', '2025-06-02 17:30:24'),
(816, 'App\\Models\\UserInvitation', 486, '7ed0d027-1bd9-4e7b-8ed4-6781ca32ff69', 'userInvitation', 'Blank-Engagemen', 'Blank-Engagemen.jpg', 'image/jpeg', 'public', 'public', 25249, '[]', '[]', '[]', '[]', 1, '2025-06-02 17:34:38', '2025-06-02 17:34:38'),
(817, 'App\\Models\\UserInvitation', 486, 'fd95f96c-78d4-4cfe-9b7d-4a6606e61df9', 'qr', '1748874880', '1748874880.png', 'image/png', 'public', 'public', 31401, '[]', '[]', '[]', '[]', 2, '2025-06-02 17:34:40', '2025-06-02 17:34:40'),
(818, 'App\\Models\\UserInvitation', 487, '58e92833-3c1b-43f0-a5cb-0d4d1753c144', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-02 17:42:29', '2025-06-02 17:42:29'),
(819, 'App\\Models\\UserInvitation', 487, 'cc2a0031-6aa6-435c-9617-1f71f53e9d12', 'qr', '1748875352', '1748875352.png', 'image/png', 'public', 'public', 26789, '[]', '[]', '[]', '[]', 2, '2025-06-02 17:42:32', '2025-06-02 17:42:32'),
(820, 'App\\Models\\UserInvitation', 487, 'd2683318-8e22-4e1c-9f08-956a5d4de152', 'userInvitation', 'd766abb0890fcf5c2bcfebbb4bfcdfcb', 'd766abb0890fcf5c2bcfebbb4bfcdfcb.jpg', 'image/jpeg', 'public', 'public', 484389, '[]', '[]', '[]', '[]', 3, '2025-06-02 17:42:32', '2025-06-02 17:42:32'),
(821, 'App\\Models\\UserInvitation', 488, '47b9a8b6-01cf-480c-9dc8-11bf49ad5c67', 'userInvitation', 'inn', 'inn.jpg', 'image/jpeg', 'public', 'public', 89438, '[]', '[]', '[]', '[]', 1, '2025-06-02 18:05:40', '2025-06-02 18:05:40'),
(822, 'App\\Models\\UserInvitation', 488, '6776c197-9709-494d-b009-8cbada87e1b9', 'qr', '1748876743', '1748876743.png', 'image/png', 'public', 'public', 33709, '[]', '[]', '[]', '[]', 2, '2025-06-02 18:05:43', '2025-06-02 18:05:43'),
(823, 'App\\Models\\UserInvitation', 489, 'd9030acf-7110-4088-8f43-6cd9700546a1', 'userInvitation', 'inn', 'inn.jpg', 'image/jpeg', 'public', 'public', 89438, '[]', '[]', '[]', '[]', 1, '2025-06-02 18:12:16', '2025-06-02 18:12:16'),
(824, 'App\\Models\\UserInvitation', 489, '187be076-f9c3-4ec4-8b3c-a76cfa154e92', 'qr', '1748877138', '1748877138.png', 'image/png', 'public', 'public', 30608, '[]', '[]', '[]', '[]', 2, '2025-06-02 18:12:18', '2025-06-02 18:12:18'),
(825, 'App\\Models\\UserInvitation', 490, 'e42da440-4c33-44e7-b579-549068f9b921', 'userInvitation', 'inn', 'inn.jpg', 'image/jpeg', 'public', 'public', 89438, '[]', '[]', '[]', '[]', 1, '2025-06-02 18:24:27', '2025-06-02 18:24:27'),
(826, 'App\\Models\\UserInvitation', 490, '063a61ee-568d-4e60-8182-dbdb8c29499b', 'qr', '1748877870', '1748877870.png', 'image/png', 'public', 'public', 31208, '[]', '[]', '[]', '[]', 2, '2025-06-02 18:24:30', '2025-06-02 18:24:30'),
(827, 'App\\Models\\UserInvitation', 490, '6a6716c0-573d-4b52-a331-9ae471df75c1', 'userInvitation', 'bf10863f82c3cd0bc3b08b40d82ddbe0', 'bf10863f82c3cd0bc3b08b40d82ddbe0.jpg', 'image/jpeg', 'public', 'public', 178671, '[]', '[]', '[]', '[]', 3, '2025-06-02 18:24:30', '2025-06-02 18:24:30'),
(828, 'App\\Models\\UserInvitation', 491, 'fd3384b1-4347-4f04-a7d8-1722e28085a7', 'userInvitation', 'Screenshot 2025-06-03 at 1.08.35 AM', 'Screenshot-2025-06-03-at-1.08.35 AM.png', 'image/png', 'public', 'public', 114417, '[]', '[]', '[]', '[]', 1, '2025-06-03 01:19:13', '2025-06-03 01:19:13'),
(829, 'App\\Models\\UserInvitation', 491, '764ac11f-ca73-4203-b340-bf33f79b5fff', 'qr', '1748902757', '1748902757.png', 'image/png', 'public', 'public', 32712, '[]', '[]', '[]', '[]', 2, '2025-06-03 01:19:17', '2025-06-03 01:19:17'),
(830, 'App\\Models\\UserInvitation', 491, '7fc2ec23-5529-4334-b38c-24c31a894049', 'userInvitation', '576f4778e5759ed0e72cc7ba3c485d7f', '576f4778e5759ed0e72cc7ba3c485d7f.jpg', 'image/jpeg', 'public', 'public', 47135, '[]', '[]', '[]', '[]', 3, '2025-06-03 01:19:17', '2025-06-03 01:19:17'),
(831, 'App\\Models\\UserInvitation', 492, '9838c1db-02bb-471f-9c39-6bf7a5a237c7', 'userInvitation', 'Screenshot-2025-06-03-at-1.08.35 AM', 'Screenshot-2025-06-03-at-1.08.35 AM.png', 'image/png', 'public', 'public', 114417, '[]', '[]', '[]', '[]', 1, '2025-06-03 01:53:46', '2025-06-03 01:53:46'),
(832, 'App\\Models\\UserInvitation', 492, '5fbf52da-7379-49bf-bea7-6513e10c0bfb', 'qr', '1748904829', '1748904829.png', 'image/png', 'public', 'public', 33976, '[]', '[]', '[]', '[]', 2, '2025-06-03 01:53:49', '2025-06-03 01:53:49'),
(833, 'App\\Models\\UserInvitation', 492, '6f07849b-6fad-4525-8483-1c36c613a76c', 'userInvitation', '58d8376b8f55e48e1ca01cd85e285e7f', '58d8376b8f55e48e1ca01cd85e285e7f.jpg', 'image/jpeg', 'public', 'public', 48540, '[]', '[]', '[]', '[]', 3, '2025-06-03 01:53:49', '2025-06-03 01:53:49'),
(834, 'App\\Models\\UserInvitation', 493, '03d007f1-01ac-4ab1-84e7-b419521a0d50', 'userInvitation', 'Screenshot 2025-06-03 at 1.08.35 AM', 'Screenshot-2025-06-03-at-1.08.35 AM.png', 'image/png', 'public', 'public', 114417, '[]', '[]', '[]', '[]', 1, '2025-06-03 02:00:41', '2025-06-03 02:00:41'),
(835, 'App\\Models\\UserInvitation', 493, '51c47e89-f866-4a8e-a35e-fd0f61963898', 'qr', '1748905244', '1748905244.png', 'image/png', 'public', 'public', 31011, '[]', '[]', '[]', '[]', 2, '2025-06-03 02:00:44', '2025-06-03 02:00:44'),
(836, 'App\\Models\\UserInvitation', 494, '14e74ff1-7d22-4455-8998-c48bf00be660', 'userInvitation', 'Screenshot-2025-06-03-at-1.08.35 AM', 'Screenshot-2025-06-03-at-1.08.35 AM.png', 'image/png', 'public', 'public', 114417, '[]', '[]', '[]', '[]', 1, '2025-06-03 02:01:37', '2025-06-03 02:01:37'),
(837, 'App\\Models\\UserInvitation', 494, 'd636ff41-0242-45f9-8204-472c58bc48c0', 'qr', '1748905299', '1748905299.png', 'image/png', 'public', 'public', 30875, '[]', '[]', '[]', '[]', 2, '2025-06-03 02:01:39', '2025-06-03 02:01:39'),
(838, 'App\\Models\\UserInvitation', 495, '4a73b601-1925-40f8-a55e-c43b4408954a', 'userInvitation', 'Screenshot 2025-06-03 at 1.08.35 AM', 'Screenshot-2025-06-03-at-1.08.35 AM.png', 'image/png', 'public', 'public', 114417, '[]', '[]', '[]', '[]', 1, '2025-06-03 02:03:45', '2025-06-03 02:03:45'),
(839, 'App\\Models\\UserInvitation', 495, 'bd390f8d-388a-4940-be07-2e3cd89e884e', 'qr', '1748905428', '1748905428.png', 'image/png', 'public', 'public', 30320, '[]', '[]', '[]', '[]', 2, '2025-06-03 02:03:48', '2025-06-03 02:03:48'),
(840, 'App\\Models\\UserInvitation', 495, '684054c4-ab47-49e2-9abe-a18e7d08c081', 'userInvitation', '4aeccf8027b6486a74120386a8e62fe8', '4aeccf8027b6486a74120386a8e62fe8.jpg', 'image/jpeg', 'public', 'public', 47362, '[]', '[]', '[]', '[]', 3, '2025-06-03 02:03:48', '2025-06-03 02:03:48'),
(841, 'App\\Models\\UserInvitation', 496, '79cf30c2-b306-4428-bede-1074702abf28', 'userInvitation', 'Screenshot-2025-06-03-at-1.08.35 AM', 'Screenshot-2025-06-03-at-1.08.35 AM.png', 'image/png', 'public', 'public', 114417, '[]', '[]', '[]', '[]', 1, '2025-06-03 02:04:34', '2025-06-03 02:04:34'),
(842, 'App\\Models\\UserInvitation', 496, '738b73b0-0069-4b8b-b69f-a516d17510db', 'qr', '1748905476', '1748905476.png', 'image/png', 'public', 'public', 30339, '[]', '[]', '[]', '[]', 2, '2025-06-03 02:04:36', '2025-06-03 02:04:36'),
(843, 'App\\Models\\UserInvitation', 496, '75fa1542-b49f-4ac3-8278-e86fb02110c2', 'userInvitation', 'd982c0c3e8db2b60a47d585465e9080c', 'd982c0c3e8db2b60a47d585465e9080c.jpg', 'image/jpeg', 'public', 'public', 47860, '[]', '[]', '[]', '[]', 3, '2025-06-03 02:04:36', '2025-06-03 02:04:36'),
(844, 'App\\Models\\UserInvitation', 497, 'd4ddf7e3-43a1-4bae-94c7-823b6292c279', 'userInvitation', '1748989898726_resized', '1748989898726_resized.jpg', 'image/jpeg', 'public', 'public', 27851, '[]', '[]', '[]', '[]', 1, '2025-06-04 01:32:21', '2025-06-04 01:32:21'),
(845, 'App\\Models\\UserInvitation', 497, '01343108-b030-4121-8df7-878201e3c6cb', 'qr', '1748989944', '1748989944.png', 'image/png', 'public', 'public', 33787, '[]', '[]', '[]', '[]', 2, '2025-06-04 01:32:24', '2025-06-04 01:32:24'),
(846, 'App\\Models\\UserInvitation', 497, '9413f974-7b21-428f-87e5-688bb1dc6b4b', 'userInvitation', 'f1fafe61951a084c3a1da5faca705ddc', 'f1fafe61951a084c3a1da5faca705ddc.jpg', 'image/jpeg', 'public', 'public', 32259, '[]', '[]', '[]', '[]', 3, '2025-06-04 01:32:24', '2025-06-04 01:32:24'),
(847, 'App\\Models\\UserInvitation', 498, '05205eb2-b6b2-4417-a24b-c79c19f98e4e', 'userInvitation', '1748990377705_resized', '1748990377705_resized.jpg', 'image/jpeg', 'public', 'public', 27851, '[]', '[]', '[]', '[]', 1, '2025-06-04 01:41:28', '2025-06-04 01:41:28'),
(848, 'App\\Models\\UserInvitation', 498, '2ff20f45-324a-4e51-85cb-83bb2fad3b45', 'qr', '1748990490', '1748990490.png', 'image/png', 'public', 'public', 32292, '[]', '[]', '[]', '[]', 2, '2025-06-04 01:41:31', '2025-06-04 01:41:31'),
(849, 'App\\Models\\UserInvitation', 498, 'd5259b10-0256-4586-ac6e-918700fe180c', 'userInvitation', 'a8fb8fd7a298392550b70291d53b26f3', 'a8fb8fd7a298392550b70291d53b26f3.jpg', 'image/jpeg', 'public', 'public', 30965, '[]', '[]', '[]', '[]', 3, '2025-06-04 01:41:31', '2025-06-04 01:41:31'),
(850, 'App\\Models\\UserInvitation', 499, '55bb374f-deb3-406e-86c5-4fb484304d49', 'userInvitation', '1748990377705_resized', '1748990377705_resized.jpg', 'image/jpeg', 'public', 'public', 27851, '[]', '[]', '[]', '[]', 1, '2025-06-04 01:45:14', '2025-06-04 01:45:14'),
(851, 'App\\Models\\UserInvitation', 499, '6bbeda06-24ac-4d3c-a247-3179aa1335be', 'qr', '1748990716', '1748990716.png', 'image/png', 'public', 'public', 30523, '[]', '[]', '[]', '[]', 2, '2025-06-04 01:45:16', '2025-06-04 01:45:16'),
(852, 'App\\Models\\UserInvitation', 499, 'bb35aae4-1329-4393-9001-c151c6d9eb73', 'userInvitation', '2599d5cfa11210c2e9353ddbd0829fc0', '2599d5cfa11210c2e9353ddbd0829fc0.jpg', 'image/jpeg', 'public', 'public', 28854, '[]', '[]', '[]', '[]', 3, '2025-06-04 01:45:16', '2025-06-04 01:45:16'),
(853, 'App\\Models\\UserInvitation', 500, '8eb118c1-24a3-41ef-9ec4-2d73efda483a', 'userInvitation', '1748990894312_resized', '1748990894312_resized.jpg', 'image/jpeg', 'public', 'public', 27851, '[]', '[]', '[]', '[]', 1, '2025-06-04 01:48:40', '2025-06-04 01:48:40'),
(854, 'App\\Models\\UserInvitation', 500, '8813c379-bcb6-4a7e-8dfd-f972c96946b5', 'qr', '1748990922', '1748990922.png', 'image/png', 'public', 'public', 31551, '[]', '[]', '[]', '[]', 2, '2025-06-04 01:48:43', '2025-06-04 01:48:43'),
(855, 'App\\Models\\UserInvitation', 500, 'c33da372-9f61-4466-90d3-7501bd146b9f', 'userInvitation', '356d571c80e21bbf48dd7b5363efdc31', '356d571c80e21bbf48dd7b5363efdc31.jpg', 'image/jpeg', 'public', 'public', 30145, '[]', '[]', '[]', '[]', 3, '2025-06-04 01:48:43', '2025-06-04 01:48:43'),
(856, 'App\\Models\\UserInvitation', 501, 'bc2a9ff5-8277-4e12-8e42-554a84994463', 'userInvitation', '1748992223026_resized', '1748992223026_resized.jpg', 'image/jpeg', 'public', 'public', 43769, '[]', '[]', '[]', '[]', 1, '2025-06-04 02:10:44', '2025-06-04 02:10:44'),
(857, 'App\\Models\\UserInvitation', 501, '4ad700eb-31ab-437e-9823-b9d17c69014f', 'qr', '1748992247', '1748992247.png', 'image/png', 'public', 'public', 14779, '[]', '[]', '[]', '[]', 2, '2025-06-04 02:10:48', '2025-06-04 02:10:48'),
(858, 'App\\Models\\UserInvitation', 501, 'c8a59208-da97-47ac-afde-fd87ea7c89ea', 'userInvitation', '97871c179d4352cf0cd283b81b9a756f', '97871c179d4352cf0cd283b81b9a756f.jpg', 'image/jpeg', 'public', 'public', 46476, '[]', '[]', '[]', '[]', 3, '2025-06-04 02:10:48', '2025-06-04 02:10:48'),
(859, 'App\\Models\\UserInvitation', 502, '9e120dd4-cbba-431d-8f82-2958a9d6557b', 'userInvitation', '1749036703887_resized', '1749036703887_resized.jpg', 'image/jpeg', 'public', 'public', 52273, '[]', '[]', '[]', '[]', 1, '2025-06-04 14:31:56', '2025-06-04 14:31:56'),
(860, 'App\\Models\\UserInvitation', 502, '7d721d5f-f055-4d5b-8006-f1d3b8599d16', 'qr', '1749036720', '1749036720.png', 'image/png', 'public', 'public', 27076, '[]', '[]', '[]', '[]', 2, '2025-06-04 14:32:00', '2025-06-04 14:32:00'),
(861, 'App\\Models\\UserInvitation', 502, 'ed6df4e2-bdee-4f24-9d1d-2b33e428bfce', 'userInvitation', '622b26ad0b44dacd2a0b027b30318c53', '622b26ad0b44dacd2a0b027b30318c53.jpg', 'image/jpeg', 'public', 'public', 52765, '[]', '[]', '[]', '[]', 3, '2025-06-04 14:32:00', '2025-06-04 14:32:00'),
(862, 'App\\Models\\UserInvitation', 503, '3b23a210-ae74-45c1-8cad-5fca33b59d63', 'userInvitation', 'inv', 'inv.jpg', 'image/jpeg', 'public', 'public', 18101, '[]', '[]', '[]', '[]', 1, '2025-06-04 15:56:53', '2025-06-04 15:56:53'),
(863, 'App\\Models\\UserInvitation', 503, '13e07383-6ca7-4e2b-a667-5c6e10425d0f', 'qr', '1749041816', '1749041816.png', 'image/png', 'public', 'public', 31621, '[]', '[]', '[]', '[]', 2, '2025-06-04 15:56:56', '2025-06-04 15:56:56'),
(864, 'App\\Models\\UserInvitation', 504, '2ca35534-6078-4850-ad42-276ec13c51c5', 'userInvitation', 'inv', 'inv.jpg', 'image/jpeg', 'public', 'public', 18101, '[]', '[]', '[]', '[]', 1, '2025-06-04 15:57:31', '2025-06-04 15:57:31'),
(865, 'App\\Models\\UserInvitation', 504, 'b20a51af-b7d6-4e5c-9c1b-6d0b5c0ad1c7', 'qr', '1749041853', '1749041853.png', 'image/png', 'public', 'public', 31931, '[]', '[]', '[]', '[]', 2, '2025-06-04 15:57:33', '2025-06-04 15:57:33'),
(866, 'App\\Models\\UserInvitation', 505, '43ad4a7e-77c8-4ce6-89c9-653b0ae1697b', 'userInvitation', 'inv', 'inv.jpg', 'image/jpeg', 'public', 'public', 18101, '[]', '[]', '[]', '[]', 1, '2025-06-04 16:12:01', '2025-06-04 16:12:01'),
(867, 'App\\Models\\UserInvitation', 506, '3ba7f613-6df9-4870-8461-349b0373dc74', 'userInvitation', '93 sar', '93-sar.png', 'image/png', 'public', 'public', 48640, '[]', '[]', '[]', '[]', 1, '2025-06-04 16:39:55', '2025-06-04 16:39:55'),
(868, 'App\\Models\\UserInvitation', 506, '4f478a52-165b-41d1-9959-9f0907d4f151', 'qr', '1749044400', '1749044400.png', 'image/png', 'public', 'public', 17372, '[]', '[]', '[]', '[]', 2, '2025-06-04 16:40:00', '2025-06-04 16:40:00'),
(869, 'App\\Models\\UserInvitation', 507, 'e7064c0b-518a-49db-91cd-44c5a8de7b69', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-04 19:41:15', '2025-06-04 19:41:15'),
(870, 'App\\Models\\UserInvitation', 508, '19d15059-772f-4e15-8fed-833897ad9932', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-04 19:41:19', '2025-06-04 19:41:19'),
(871, 'App\\Models\\UserInvitation', 507, '34867130-acaa-497d-8e5f-88f05853e5d6', 'qr', '1749055279', '1749055279.png', 'image/png', 'public', 'public', 21950, '[]', '[]', '[]', '[]', 2, '2025-06-04 19:41:19', '2025-06-04 19:41:19'),
(872, 'App\\Models\\UserInvitation', 507, '2cf1b4b7-8b5e-4059-964c-8e155111d155', 'userInvitation', 'a3eb2048f600a86aabf8f8a2a272cafc', 'a3eb2048f600a86aabf8f8a2a272cafc.jpg', 'image/jpeg', 'public', 'public', 483792, '[]', '[]', '[]', '[]', 3, '2025-06-04 19:41:19', '2025-06-04 19:41:19'),
(873, 'App\\Models\\UserInvitation', 509, '8ccf7253-6c07-4e6f-adca-69f2cad85693', 'userInvitation', '1749055650954_resized', '1749055650954_resized.jpg', 'image/jpeg', 'public', 'public', 70101, '[]', '[]', '[]', '[]', 1, '2025-06-04 19:47:53', '2025-06-04 19:47:53'),
(874, 'App\\Models\\UserInvitation', 509, 'f93978dd-f3a0-499b-8418-1c3e2246894c', 'qr', '1749055677', '1749055677.png', 'image/png', 'public', 'public', 23299, '[]', '[]', '[]', '[]', 2, '2025-06-04 19:47:57', '2025-06-04 19:47:57'),
(875, 'App\\Models\\UserInvitation', 509, 'ce429b84-9771-44d5-b57f-2d866f4348f4', 'userInvitation', '4314a29b9ff6525363905f7b1e41e03b', '4314a29b9ff6525363905f7b1e41e03b.jpg', 'image/jpeg', 'public', 'public', 71472, '[]', '[]', '[]', '[]', 3, '2025-06-04 19:47:57', '2025-06-04 19:47:57'),
(876, 'App\\Models\\UserInvitation', 510, 'a6d6b199-2971-4b51-9b33-430b41e2f0fc', 'userInvitation', '1749055650954_resized', '1749055650954_resized.jpg', 'image/jpeg', 'public', 'public', 70101, '[]', '[]', '[]', '[]', 1, '2025-06-04 19:48:45', '2025-06-04 19:48:45'),
(877, 'App\\Models\\UserInvitation', 510, 'e7ce3dde-84f9-4ff2-80ee-ee61c4ad9610', 'qr', '1749055727', '1749055727.png', 'image/png', 'public', 'public', 23345, '[]', '[]', '[]', '[]', 2, '2025-06-04 19:48:47', '2025-06-04 19:48:47'),
(878, 'App\\Models\\UserInvitation', 510, 'ebec1788-35e8-471b-ae3e-4249593e541b', 'userInvitation', '648576263e20d9fcd9dd549033847d03', '648576263e20d9fcd9dd549033847d03.jpg', 'image/jpeg', 'public', 'public', 71472, '[]', '[]', '[]', '[]', 3, '2025-06-04 19:48:48', '2025-06-04 19:48:48'),
(879, 'App\\Models\\UserInvitation', 511, 'af2e052f-610b-4cf5-94ff-3f4a421894a1', 'userInvitation', '1749055650954_resized', '1749055650954_resized.jpg', 'image/jpeg', 'public', 'public', 70101, '[]', '[]', '[]', '[]', 1, '2025-06-04 19:49:56', '2025-06-04 19:49:56'),
(880, 'App\\Models\\UserInvitation', 511, 'c9ed2702-0212-44af-a5a5-d7a174cff773', 'qr', '1749055799', '1749055799.png', 'image/png', 'public', 'public', 23318, '[]', '[]', '[]', '[]', 2, '2025-06-04 19:49:59', '2025-06-04 19:49:59'),
(881, 'App\\Models\\UserInvitation', 511, 'c423d1ba-e20a-4636-b50d-0761a4c3e1ee', 'userInvitation', 'a7445e46dcb180963e62d1eb7840f40f', 'a7445e46dcb180963e62d1eb7840f40f.jpg', 'image/jpeg', 'public', 'public', 72037, '[]', '[]', '[]', '[]', 3, '2025-06-04 19:49:59', '2025-06-04 19:49:59'),
(882, 'App\\Models\\UserInvitation', 512, '66a01513-dca8-4766-8eb9-d780e1d185c0', 'userInvitation', '1749055650954_resized', '1749055650954_resized.jpg', 'image/jpeg', 'public', 'public', 70101, '[]', '[]', '[]', '[]', 1, '2025-06-04 19:50:34', '2025-06-04 19:50:34'),
(883, 'App\\Models\\UserInvitation', 512, '78dddbff-b244-42cd-ac78-2c82f781b9a8', 'qr', '1749055836', '1749055836.png', 'image/png', 'public', 'public', 22878, '[]', '[]', '[]', '[]', 2, '2025-06-04 19:50:36', '2025-06-04 19:50:36'),
(884, 'App\\Models\\UserInvitation', 512, '04e6af02-c95f-4688-a032-799787114176', 'userInvitation', '13ce2aa2ca761baa1671ed789e69522d', '13ce2aa2ca761baa1671ed789e69522d.jpg', 'image/jpeg', 'public', 'public', 72176, '[]', '[]', '[]', '[]', 3, '2025-06-04 19:50:36', '2025-06-04 19:50:36'),
(885, 'App\\Models\\UserInvitation', 513, 'c4e44d18-5d56-4e7e-90ff-c40df9d683b9', 'userInvitation', '1749055650954_resized', '1749055650954_resized.jpg', 'image/jpeg', 'public', 'public', 70101, '[]', '[]', '[]', '[]', 1, '2025-06-04 20:00:03', '2025-06-04 20:00:03'),
(886, 'App\\Models\\UserInvitation', 513, 'f746ddce-a952-4e64-aa3c-1d8d0fd4cd1d', 'qr', '1749056406', '1749056406.png', 'image/png', 'public', 'public', 23518, '[]', '[]', '[]', '[]', 2, '2025-06-04 20:00:06', '2025-06-04 20:00:06'),
(887, 'App\\Models\\UserInvitation', 513, 'eeba4711-29e8-458b-b0f7-0acd02ef8eea', 'userInvitation', 'a2a81075a08cbd4af42afe8442b2f69d', 'a2a81075a08cbd4af42afe8442b2f69d.jpg', 'image/jpeg', 'public', 'public', 72196, '[]', '[]', '[]', '[]', 3, '2025-06-04 20:00:06', '2025-06-04 20:00:06'),
(888, 'App\\Models\\UserInvitation', 514, 'd5714349-5be3-4675-bc0c-c9001f4c6154', 'userInvitation', '1749055650954_resized', '1749055650954_resized.jpg', 'image/jpeg', 'public', 'public', 70101, '[]', '[]', '[]', '[]', 1, '2025-06-04 20:01:32', '2025-06-04 20:01:32'),
(889, 'App\\Models\\UserInvitation', 514, 'e2f41afd-df76-4450-94e4-1e7a6361c669', 'qr', '1749056494', '1749056494.png', 'image/png', 'public', 'public', 23394, '[]', '[]', '[]', '[]', 2, '2025-06-04 20:01:34', '2025-06-04 20:01:34'),
(890, 'App\\Models\\UserInvitation', 514, '4784f84e-2fb3-46dc-acee-9a44a7bdc8b8', 'userInvitation', '0725387f858882a8d4fc06b1bb45497b', '0725387f858882a8d4fc06b1bb45497b.jpg', 'image/jpeg', 'public', 'public', 71322, '[]', '[]', '[]', '[]', 3, '2025-06-04 20:01:34', '2025-06-04 20:01:34'),
(891, 'App\\Models\\UserInvitation', 515, 'd2493276-6f0f-432e-8368-b51b6e761b87', 'userInvitation', '1749055650954_resized', '1749055650954_resized.jpg', 'image/jpeg', 'public', 'public', 70101, '[]', '[]', '[]', '[]', 1, '2025-06-04 20:06:10', '2025-06-04 20:06:10'),
(892, 'App\\Models\\UserInvitation', 515, '8a142326-9301-4c48-b442-8ed77652d22c', 'qr', '1749056772', '1749056772.png', 'image/png', 'public', 'public', 23274, '[]', '[]', '[]', '[]', 2, '2025-06-04 20:06:12', '2025-06-04 20:06:12'),
(893, 'App\\Models\\UserInvitation', 515, 'bf9a3cd6-0532-4153-a5cc-6fa9440d7e12', 'userInvitation', 'cd5292e94474fa36d7102d6b6ef82317', 'cd5292e94474fa36d7102d6b6ef82317.jpg', 'image/jpeg', 'public', 'public', 72003, '[]', '[]', '[]', '[]', 3, '2025-06-04 20:06:12', '2025-06-04 20:06:12'),
(894, 'App\\Models\\UserInvitation', 516, '4a2d906f-3356-45d6-bcd8-64d66ad45f7d', 'userInvitation', '1749055650954_resized', '1749055650954_resized.jpg', 'image/jpeg', 'public', 'public', 70101, '[]', '[]', '[]', '[]', 1, '2025-06-04 20:11:35', '2025-06-04 20:11:35'),
(895, 'App\\Models\\UserInvitation', 516, '7d307120-dea1-48af-9f2d-901770328a69', 'qr', '1749057097', '1749057097.png', 'image/png', 'public', 'public', 23335, '[]', '[]', '[]', '[]', 2, '2025-06-04 20:11:37', '2025-06-04 20:11:37'),
(896, 'App\\Models\\UserInvitation', 516, 'd46ca4b1-594c-4546-9726-cfd8ca110544', 'userInvitation', 'b6a8f05b8a0a01687542a47fc08a907c', 'b6a8f05b8a0a01687542a47fc08a907c.jpg', 'image/jpeg', 'public', 'public', 71972, '[]', '[]', '[]', '[]', 3, '2025-06-04 20:11:37', '2025-06-04 20:11:37'),
(897, 'App\\Models\\UserInvitation', 517, 'e12fc882-1181-4e10-83db-8f36cde78cca', 'userInvitation', '1749055650954_resized', '1749055650954_resized.jpg', 'image/jpeg', 'public', 'public', 70101, '[]', '[]', '[]', '[]', 1, '2025-06-04 20:14:40', '2025-06-04 20:14:40'),
(898, 'App\\Models\\UserInvitation', 517, 'c87e38f8-f96d-473a-95df-a3007a47ef9e', 'qr', '1749057282', '1749057282.png', 'image/png', 'public', 'public', 22897, '[]', '[]', '[]', '[]', 2, '2025-06-04 20:14:42', '2025-06-04 20:14:42'),
(899, 'App\\Models\\UserInvitation', 517, '1d798f52-8e6d-426e-98e3-08b938c2c28f', 'userInvitation', '889766d18cef509a7d42748699248225', '889766d18cef509a7d42748699248225.jpg', 'image/jpeg', 'public', 'public', 72400, '[]', '[]', '[]', '[]', 3, '2025-06-04 20:14:42', '2025-06-04 20:14:42'),
(900, 'App\\Models\\UserInvitation', 518, '96dd2234-6d59-4aa8-8005-88f24a636b8d', 'userInvitation', '1749057634000_resized', '1749057634000_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-04 20:20:49', '2025-06-04 20:20:49'),
(901, 'App\\Models\\UserInvitation', 518, '6f2ee876-667c-4c46-bfa3-859ed39cbdd2', 'qr', '1749057651', '1749057651.png', 'image/png', 'public', 'public', 22749, '[]', '[]', '[]', '[]', 2, '2025-06-04 20:20:51', '2025-06-04 20:20:51'),
(902, 'App\\Models\\UserInvitation', 518, '6006d58e-bc71-4796-9d07-afad02127641', 'userInvitation', '748165907cb2b51bdaa1dd3f65a433a7', '748165907cb2b51bdaa1dd3f65a433a7.jpg', 'image/jpeg', 'public', 'public', 45380, '[]', '[]', '[]', '[]', 3, '2025-06-04 20:20:51', '2025-06-04 20:20:51'),
(903, 'App\\Models\\UserInvitation', 519, '79811ac7-1af2-4f7f-86fb-2bce5450d662', 'userInvitation', '1749057634000_resized', '1749057634000_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-04 20:22:16', '2025-06-04 20:22:16'),
(904, 'App\\Models\\UserInvitation', 519, 'dfcac5db-a2e6-4479-8fe6-740bc6600e88', 'qr', '1749057738', '1749057738.png', 'image/png', 'public', 'public', 22678, '[]', '[]', '[]', '[]', 2, '2025-06-04 20:22:18', '2025-06-04 20:22:18'),
(905, 'App\\Models\\UserInvitation', 519, 'f2412bd0-5ace-4d5e-8897-ab70df4be385', 'userInvitation', '8e463ba640d3f9305550aa04d394158f', '8e463ba640d3f9305550aa04d394158f.jpg', 'image/jpeg', 'public', 'public', 45618, '[]', '[]', '[]', '[]', 3, '2025-06-04 20:22:18', '2025-06-04 20:22:18'),
(906, 'App\\Models\\UserInvitation', 520, '291cba61-3b00-412e-8b11-27e4f0b8313f', 'userInvitation', '1749057634000_resized', '1749057634000_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-04 20:24:13', '2025-06-04 20:24:13'),
(907, 'App\\Models\\UserInvitation', 520, '3bb7410a-4a35-4d0a-9959-783545ece26b', 'qr', '1749057855', '1749057855.png', 'image/png', 'public', 'public', 23407, '[]', '[]', '[]', '[]', 2, '2025-06-04 20:24:15', '2025-06-04 20:24:15'),
(908, 'App\\Models\\UserInvitation', 520, 'a8e0486b-22f1-403f-9f29-1c2fb8c1366c', 'userInvitation', '65c6ff4d25b8f97c102688ffd06ae2f0', '65c6ff4d25b8f97c102688ffd06ae2f0.jpg', 'image/jpeg', 'public', 'public', 45701, '[]', '[]', '[]', '[]', 3, '2025-06-04 20:24:15', '2025-06-04 20:24:15'),
(909, 'App\\Models\\UserInvitation', 521, '44e6ca13-2f60-4ed0-8eab-52f5d369fb70', 'userInvitation', '1749057634000_resized', '1749057634000_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-04 20:25:27', '2025-06-04 20:25:27'),
(910, 'App\\Models\\UserInvitation', 521, '628c49d4-4985-44fd-95a5-65bf696628e6', 'qr', '1749057929', '1749057929.png', 'image/png', 'public', 'public', 23317, '[]', '[]', '[]', '[]', 2, '2025-06-04 20:25:29', '2025-06-04 20:25:29'),
(911, 'App\\Models\\UserInvitation', 521, '97642d96-4cf2-4b9e-9957-9ccb7177574b', 'userInvitation', 'f9046509f0d25952709d593b45f6e42d', 'f9046509f0d25952709d593b45f6e42d.jpg', 'image/jpeg', 'public', 'public', 45707, '[]', '[]', '[]', '[]', 3, '2025-06-04 20:25:29', '2025-06-04 20:25:29'),
(912, 'App\\Models\\UserInvitation', 522, 'acac5028-2c82-46f5-94cb-2f038b884bea', 'userInvitation', '1749057634000_resized', '1749057634000_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-04 20:26:26', '2025-06-04 20:26:26'),
(913, 'App\\Models\\UserInvitation', 522, '52b114ac-29de-4d0c-b5ac-91ffa8aeaba1', 'qr', '1749057989', '1749057989.png', 'image/png', 'public', 'public', 22890, '[]', '[]', '[]', '[]', 2, '2025-06-04 20:26:29', '2025-06-04 20:26:29'),
(914, 'App\\Models\\UserInvitation', 522, '97dd6885-193f-4e71-b322-4bcae771e227', 'userInvitation', '2dba64635258ef9aa21c37f29a325047', '2dba64635258ef9aa21c37f29a325047.jpg', 'image/jpeg', 'public', 'public', 46254, '[]', '[]', '[]', '[]', 3, '2025-06-04 20:26:29', '2025-06-04 20:26:29'),
(915, 'App\\Models\\UserInvitation', 523, '714adfea-8812-44e6-ba76-4f05d2e794c9', 'userInvitation', '1749057634000_resized', '1749057634000_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-04 20:27:43', '2025-06-04 20:27:43'),
(916, 'App\\Models\\UserInvitation', 523, '8036fc0f-72c2-4717-9b84-34eb151480f0', 'qr', '1749058065', '1749058065.png', 'image/png', 'public', 'public', 22746, '[]', '[]', '[]', '[]', 2, '2025-06-04 20:27:46', '2025-06-04 20:27:46'),
(917, 'App\\Models\\UserInvitation', 523, 'c99e926a-5991-47b4-ac81-c54f4c31c612', 'userInvitation', 'aaa35861f5f79e6c87f216bd968525b1', 'aaa35861f5f79e6c87f216bd968525b1.jpg', 'image/jpeg', 'public', 'public', 45852, '[]', '[]', '[]', '[]', 3, '2025-06-04 20:27:46', '2025-06-04 20:27:46'),
(918, 'App\\Models\\UserInvitation', 524, 'b6d01bc0-1f6c-4de6-9ef7-e21f2068424e', 'userInvitation', '1749057634000_resized', '1749057634000_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-04 20:28:31', '2025-06-04 20:28:31'),
(919, 'App\\Models\\UserInvitation', 524, '6c00d340-fd9e-441e-ac03-592e39c79acb', 'qr', '1749058113', '1749058113.png', 'image/png', 'public', 'public', 23446, '[]', '[]', '[]', '[]', 2, '2025-06-04 20:28:33', '2025-06-04 20:28:33'),
(920, 'App\\Models\\UserInvitation', 524, '5943beb0-a22d-4714-a33a-0980337cd317', 'userInvitation', '82ad26c9408afbb39c157c168a8ed529', '82ad26c9408afbb39c157c168a8ed529.jpg', 'image/jpeg', 'public', 'public', 45732, '[]', '[]', '[]', '[]', 3, '2025-06-04 20:28:33', '2025-06-04 20:28:33'),
(921, 'App\\Models\\UserInvitation', 525, '2f8c948a-3aeb-428b-bb6c-f812f8e0f44a', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-07 01:01:44', '2025-06-07 01:01:44');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(922, 'App\\Models\\UserInvitation', 525, 'bcbb5946-7987-4d0c-9508-c40ece51b457', 'qr', '1749247308', '1749247308.png', 'image/png', 'public', 'public', 22288, '[]', '[]', '[]', '[]', 2, '2025-06-07 01:01:48', '2025-06-07 01:01:48'),
(923, 'App\\Models\\UserInvitation', 526, 'e1d4058c-729b-420b-b579-0eca0e882ed9', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-07 01:19:05', '2025-06-07 01:19:05'),
(924, 'App\\Models\\UserInvitation', 526, '8570db6a-cb65-4610-b6e4-f84b7e3b739f', 'qr', '1749248348', '1749248348.png', 'image/png', 'public', 'public', 22398, '[]', '[]', '[]', '[]', 2, '2025-06-07 01:19:08', '2025-06-07 01:19:08'),
(925, 'App\\Models\\UserInvitation', 527, 'b63b99e3-4bfe-4623-aac0-519b869f24c7', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-07 01:22:13', '2025-06-07 01:22:13'),
(926, 'App\\Models\\UserInvitation', 527, '0ac2915c-a872-4b6b-9d66-386a852154a5', 'qr', '1749248536', '1749248536.png', 'image/png', 'public', 'public', 22462, '[]', '[]', '[]', '[]', 2, '2025-06-07 01:22:16', '2025-06-07 01:22:16'),
(927, 'App\\Models\\UserInvitation', 528, '0e5412a7-ed30-4e23-ab35-aedefe8603af', 'userInvitation', '1749248962057_resized', '1749248962057_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-07 01:29:45', '2025-06-07 01:29:45'),
(928, 'App\\Models\\UserInvitation', 528, 'a95a8061-0279-417a-a41e-9da13b6c100f', 'qr', '1749248993', '1749248993.png', 'image/png', 'public', 'public', 22867, '[]', '[]', '[]', '[]', 2, '2025-06-07 01:29:53', '2025-06-07 01:29:53'),
(929, 'App\\Models\\UserInvitation', 528, '94f2329a-bbda-4a4d-aebb-c2b368547333', 'userInvitation', '01caeafacdd721efa91f494652e99012', '01caeafacdd721efa91f494652e99012.jpg', 'image/jpeg', 'public', 'public', 44517, '[]', '[]', '[]', '[]', 3, '2025-06-07 01:29:53', '2025-06-07 01:29:53'),
(930, 'App\\Models\\UserInvitation', 529, 'a0d1d580-7976-490f-b0bc-ffdef7798803', 'userInvitation', '1749249722351_resized', '1749249722351_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-07 01:42:17', '2025-06-07 01:42:17'),
(931, 'App\\Models\\UserInvitation', 529, '637df96e-61f4-433c-a403-7c104a13217c', 'qr', '1749249740', '1749249740.png', 'image/png', 'public', 'public', 23197, '[]', '[]', '[]', '[]', 2, '2025-06-07 01:42:20', '2025-06-07 01:42:20'),
(932, 'App\\Models\\UserInvitation', 529, '2f0061ea-754c-48b6-8f4c-002c2fc4a7ba', 'userInvitation', '2c60cf4accc52d1b73ea5c15d849f865', '2c60cf4accc52d1b73ea5c15d849f865.jpg', 'image/jpeg', 'public', 'public', 44780, '[]', '[]', '[]', '[]', 3, '2025-06-07 01:42:20', '2025-06-07 01:42:20'),
(933, 'App\\Models\\UserInvitation', 530, 'fdcd4372-efeb-4610-ab29-ca1318f5f592', 'userInvitation', '1749249722351_resized', '1749249722351_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-07 01:47:17', '2025-06-07 01:47:17'),
(934, 'App\\Models\\UserInvitation', 530, '2e236072-5635-4372-8c9c-8c7512bb946b', 'qr', '1749250039', '1749250039.png', 'image/png', 'public', 'public', 23109, '[]', '[]', '[]', '[]', 2, '2025-06-07 01:47:20', '2025-06-07 01:47:20'),
(935, 'App\\Models\\UserInvitation', 530, '45c836ce-b436-4e0c-888f-5252c5904de8', 'userInvitation', 'e655cec0659d6c6c5c20cdff1adfa569', 'e655cec0659d6c6c5c20cdff1adfa569.jpg', 'image/jpeg', 'public', 'public', 44814, '[]', '[]', '[]', '[]', 3, '2025-06-07 01:47:20', '2025-06-07 01:47:20'),
(936, 'App\\Models\\UserInvitation', 531, 'e72cbfe4-8f04-4a99-b280-96bafe4decad', 'userInvitation', '39b51933-74d1-4ff2-ba6c-75d91c599017', '39b51933-74d1-4ff2-ba6c-75d91c599017.png', 'image/png', 'public', 'public', 342792, '[]', '[]', '[]', '[]', 1, '2025-06-09 00:59:46', '2025-06-09 00:59:46'),
(937, 'App\\Models\\UserInvitation', 531, '40c3c2af-c051-4e12-a134-f981ce59a69f', 'qr', '1749419990', '1749419990.png', 'image/png', 'public', 'public', 22404, '[]', '[]', '[]', '[]', 2, '2025-06-09 00:59:50', '2025-06-09 00:59:50'),
(938, 'App\\Models\\UserInvitation', 532, '19c89085-8a2e-4290-b167-9682fb87eb68', 'userInvitation', 'inv', 'inv.jpg', 'image/jpeg', 'public', 'public', 18101, '[]', '[]', '[]', '[]', 1, '2025-06-11 04:20:01', '2025-06-11 04:20:01'),
(939, 'App\\Models\\UserInvitation', 532, '0c747a46-7c1d-412d-8854-1cf93b7158ad', 'qr', '1749604805', '1749604805.png', 'image/png', 'public', 'public', 32604, '[]', '[]', '[]', '[]', 2, '2025-06-11 04:20:05', '2025-06-11 04:20:05'),
(940, 'App\\Models\\UserInvitation', 532, 'edd07217-b8de-4167-b0c1-ef2610e2be26', 'userInvitation', 'aed5433941f95ab9259666634db0ec3e', 'aed5433941f95ab9259666634db0ec3e.jpg', 'image/jpeg', 'public', 'public', 61649, '[]', '[]', '[]', '[]', 3, '2025-06-11 04:20:05', '2025-06-11 04:20:05'),
(941, 'App\\Models\\UserInvitation', 533, 'b953142a-3e48-42d0-b329-9ad235e8f792', 'userInvitation', 'Screenshot_٢٠٢٥٠٦١٠_٢٠٥٣١٩_WhatsApp', 'Screenshot_٢٠٢٥٠٦١٠_٢٠٥٣١٩_WhatsApp.jpg', 'image/jpeg', 'public', 'public', 1044520, '[]', '[]', '[]', '[]', 1, '2025-06-11 04:21:21', '2025-06-11 04:21:21'),
(942, 'App\\Models\\UserInvitation', 533, '26dced5e-3149-4eca-ba4a-40497ac31c13', 'qr', '1749604884', '1749604884.png', 'image/png', 'public', 'public', 34007, '[]', '[]', '[]', '[]', 2, '2025-06-11 04:21:25', '2025-06-11 04:21:25'),
(943, 'App\\Models\\UserInvitation', 534, 'e7daf5fb-0e1c-49f6-85df-3fb62e3cf67b', 'userInvitation', 'inv', 'inv.jpg', 'image/jpeg', 'public', 'public', 18101, '[]', '[]', '[]', '[]', 1, '2025-06-11 04:31:27', '2025-06-11 04:31:27'),
(944, 'App\\Models\\UserInvitation', 534, '12a6d8cf-ffdf-42bb-b94e-29678a8e1a4e', 'qr', '1749605490', '1749605490.png', 'image/png', 'public', 'public', 32877, '[]', '[]', '[]', '[]', 2, '2025-06-11 04:31:30', '2025-06-11 04:31:30'),
(945, 'App\\Models\\UserInvitation', 534, '9b30aba1-8572-459d-8748-487dc891ea8a', 'userInvitation', '3286e4107cfc69a4b909982c65a0807e', '3286e4107cfc69a4b909982c65a0807e.jpg', 'image/jpeg', 'public', 'public', 60458, '[]', '[]', '[]', '[]', 3, '2025-06-11 04:31:30', '2025-06-11 04:31:30'),
(946, 'App\\Models\\UserInvitation', 535, 'b03bb242-f52e-479c-86b7-718202487541', 'userInvitation', 'classic-wedding-invitation-template-in-vintage-vector-43998324', 'classic-wedding-invitation-template-in-vintage-vector-43998324.jpg', 'image/jpeg', 'public', 'public', 139349, '[]', '[]', '[]', '[]', 1, '2025-06-11 06:30:57', '2025-06-11 06:30:57'),
(947, 'App\\Models\\UserInvitation', 535, 'e290a33e-36ce-4a41-b686-75069cfe37db', 'qr', '1749612660', '1749612660.png', 'image/png', 'public', 'public', 32295, '[]', '[]', '[]', '[]', 2, '2025-06-11 06:31:00', '2025-06-11 06:31:00'),
(948, 'App\\Models\\UserInvitation', 536, '74e25430-e445-4412-96c5-8e6df6892742', 'userInvitation', 'classic-wedding-invitation-template-in-vintage-vector-43998324', 'classic-wedding-invitation-template-in-vintage-vector-43998324.jpg', 'image/jpeg', 'public', 'public', 139349, '[]', '[]', '[]', '[]', 1, '2025-06-11 06:39:42', '2025-06-11 06:39:42'),
(949, 'App\\Models\\UserInvitation', 537, '5890c2fc-9729-410d-aff7-4c5655430433', 'userInvitation', 'Screenshot_٢٠٢٥٠٦١١_٠٤٥١٠٠_daewa QR', 'Screenshot_٢٠٢٥٠٦١١_٠٤٥١٠٠_daewa-QR.jpg', 'image/jpeg', 'public', 'public', 574848, '[]', '[]', '[]', '[]', 1, '2025-06-11 14:36:21', '2025-06-11 14:36:21'),
(950, 'App\\Models\\UserInvitation', 537, 'c6e39eb3-a3cd-4797-9b65-74ac6d9c294c', 'qr', '1749641785', '1749641785.png', 'image/png', 'public', 'public', 34076, '[]', '[]', '[]', '[]', 2, '2025-06-11 14:36:25', '2025-06-11 14:36:25'),
(951, 'App\\Models\\UserInvitation', 538, 'f8cf6946-880a-4cb3-9402-7e4ff0961018', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-11 15:50:32', '2025-06-11 15:50:32'),
(952, 'App\\Models\\UserInvitation', 538, '62b0810c-d05d-4fbb-8ada-833092ba21b4', 'qr', '1749646237', '1749646237.png', 'image/png', 'public', 'public', 23547, '[]', '[]', '[]', '[]', 2, '2025-06-11 15:50:38', '2025-06-11 15:50:38'),
(953, 'App\\Models\\UserInvitation', 538, '241aadaf-272c-4d01-a748-d0b99794521a', 'userInvitation', 'aa176883b5987baa90c8948cee19e918', 'aa176883b5987baa90c8948cee19e918.jpg', 'image/jpeg', 'public', 'public', 45167, '[]', '[]', '[]', '[]', 3, '2025-06-11 15:50:38', '2025-06-11 15:50:38'),
(954, 'App\\Models\\UserInvitation', 539, '1180480e-89b1-4e03-bec2-83da38f03df0', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-11 21:59:06', '2025-06-11 21:59:06'),
(955, 'App\\Models\\UserInvitation', 539, 'aff2e55d-9664-4b1c-95f1-32c7bbcaef85', 'qr', '1749668350', '1749668350.png', 'image/png', 'public', 'public', 27958, '[]', '[]', '[]', '[]', 2, '2025-06-11 21:59:10', '2025-06-11 21:59:10'),
(956, 'App\\Models\\UserInvitation', 540, 'b59cd775-fa59-4340-bcca-c43e0c12bcfc', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-11 22:12:55', '2025-06-11 22:12:55'),
(957, 'App\\Models\\UserInvitation', 540, '12bc2ed7-ad78-432b-be22-f4677ec68d81', 'qr', '1749669180', '1749669180.png', 'image/png', 'public', 'public', 27086, '[]', '[]', '[]', '[]', 2, '2025-06-11 22:13:00', '2025-06-11 22:13:00'),
(958, 'App\\Models\\UserInvitation', 540, '1046b9d0-addd-467b-b001-aa223599244f', 'userInvitation', '1c76b5951709ac66e4bef8dffd108781', '1c76b5951709ac66e4bef8dffd108781.jpg', 'image/jpeg', 'public', 'public', 45634, '[]', '[]', '[]', '[]', 3, '2025-06-11 22:13:00', '2025-06-11 22:13:00'),
(959, 'App\\Models\\UserInvitation', 541, '6e7d6f99-fb7f-47d8-9000-27b40bf4022a', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-11 22:17:38', '2025-06-11 22:17:38'),
(960, 'App\\Models\\UserInvitation', 541, 'c6c1c668-7851-4044-bdc4-85bbc70ba650', 'qr', '1749669462', '1749669462.png', 'image/png', 'public', 'public', 26799, '[]', '[]', '[]', '[]', 2, '2025-06-11 22:17:42', '2025-06-11 22:17:42'),
(961, 'App\\Models\\UserInvitation', 541, '4c3b6f08-3d66-4541-9eb2-b60695fad4e1', 'userInvitation', '7eee031d069dc42295603d4a75bec5cf', '7eee031d069dc42295603d4a75bec5cf.jpg', 'image/jpeg', 'public', 'public', 44968, '[]', '[]', '[]', '[]', 3, '2025-06-11 22:17:42', '2025-06-11 22:17:42'),
(962, 'App\\Models\\UserInvitation', 542, '5db627c7-6742-4a33-9fae-43cc0fcfef5f', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-11 22:47:47', '2025-06-11 22:47:47'),
(963, 'App\\Models\\UserInvitation', 542, 'd843a518-77cf-4290-8339-59d5fb29e8a5', 'qr', '1749671276', '1749671276.png', 'image/png', 'public', 'public', 26987, '[]', '[]', '[]', '[]', 2, '2025-06-11 22:47:56', '2025-06-11 22:47:56'),
(964, 'App\\Models\\UserInvitation', 542, '6ad4e066-fcd5-441b-ab3d-ceae6b6a5b31', 'userInvitation', '67a267aa78c43ed977db83d1c4a208a3', '67a267aa78c43ed977db83d1c4a208a3.jpg', 'image/jpeg', 'public', 'public', 44605, '[]', '[]', '[]', '[]', 3, '2025-06-11 22:47:56', '2025-06-11 22:47:56'),
(965, 'App\\Models\\UserInvitation', 543, 'eefd1b47-c1bb-408a-8d29-17814e5220e1', 'userInvitation', 'classic-wedding-invitation-template-in-vintage-vector-43998324', 'classic-wedding-invitation-template-in-vintage-vector-43998324.jpg', 'image/jpeg', 'public', 'public', 139349, '[]', '[]', '[]', '[]', 1, '2025-06-11 23:24:10', '2025-06-11 23:24:10'),
(966, 'App\\Models\\UserInvitation', 543, 'bf307f19-5545-4003-a39b-fed59f498805', 'qr', '1749673455', '1749673455.png', 'image/png', 'public', 'public', 33786, '[]', '[]', '[]', '[]', 2, '2025-06-11 23:24:15', '2025-06-11 23:24:15'),
(967, 'App\\Models\\UserInvitation', 544, '21e8d7c2-a742-4526-9504-b310b113e26f', 'userInvitation', 'classic-wedding-invitation-template-in-vintage-vector-43998324', 'classic-wedding-invitation-template-in-vintage-vector-43998324.jpg', 'image/jpeg', 'public', 'public', 139349, '[]', '[]', '[]', '[]', 1, '2025-06-11 23:26:59', '2025-06-11 23:26:59'),
(968, 'App\\Models\\UserInvitation', 545, '32c8186f-45fd-4020-88e0-129ffaf491de', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-12 21:05:27', '2025-06-12 21:05:27'),
(969, 'App\\Models\\UserInvitation', 545, 'b4b4473e-abd4-42e3-b135-c5367c0c7040', 'qr', '1749751532', '1749751532.png', 'image/png', 'public', 'public', 27176, '[]', '[]', '[]', '[]', 2, '2025-06-12 21:05:32', '2025-06-12 21:05:32'),
(970, 'App\\Models\\UserInvitation', 545, '934cb681-c200-407d-9899-4467c8565768', 'userInvitation', 'ce9a679b1e5158e2783b07f79b2e43fb', 'ce9a679b1e5158e2783b07f79b2e43fb.jpg', 'image/jpeg', 'public', 'public', 45055, '[]', '[]', '[]', '[]', 3, '2025-06-12 21:05:32', '2025-06-12 21:05:32'),
(971, 'App\\Models\\UserInvitation', 546, '41a74baf-9beb-42ac-83d6-b36db3997c34', 'userInvitation', 'classic-wedding-invitation-template-in-vintage-vector-43998324', 'classic-wedding-invitation-template-in-vintage-vector-43998324.jpg', 'image/jpeg', 'public', 'public', 139349, '[]', '[]', '[]', '[]', 1, '2025-06-13 14:48:10', '2025-06-13 14:48:10'),
(972, 'App\\Models\\UserInvitation', 546, 'ae7decfb-bdac-46a3-b5f7-b88777be1bac', 'qr', '1749815294', '1749815294.png', 'image/png', 'public', 'public', 30644, '[]', '[]', '[]', '[]', 2, '2025-06-13 14:48:14', '2025-06-13 14:48:14'),
(973, 'App\\Models\\UserInvitation', 547, '89a348ea-a4b5-4bb2-a82f-6405cc9a0f7b', 'userInvitation', 'classic-wedding-invitation-template-in-vintage-vector-43998324', 'classic-wedding-invitation-template-in-vintage-vector-43998324.jpg', 'image/jpeg', 'public', 'public', 139349, '[]', '[]', '[]', '[]', 1, '2025-06-13 14:48:45', '2025-06-13 14:48:45'),
(974, 'App\\Models\\UserInvitation', 547, '5155a523-eb50-4eed-8489-e0c675f5b58f', 'qr', '1749815327', '1749815327.png', 'image/png', 'public', 'public', 30951, '[]', '[]', '[]', '[]', 2, '2025-06-13 14:48:48', '2025-06-13 14:48:48'),
(975, 'App\\Models\\UserInvitation', 548, '0869a4d4-f8e3-492f-a333-72b24572b9fa', 'userInvitation', 'inv', 'inv.jpg', 'image/jpeg', 'public', 'public', 18101, '[]', '[]', '[]', '[]', 1, '2025-06-13 16:55:21', '2025-06-13 16:55:21'),
(976, 'App\\Models\\UserInvitation', 548, '99225269-dc6a-4c48-aa26-3f545883c492', 'qr', '1749822926', '1749822926.png', 'image/png', 'public', 'public', 31758, '[]', '[]', '[]', '[]', 2, '2025-06-13 16:55:26', '2025-06-13 16:55:26'),
(977, 'App\\Models\\UserInvitation', 548, 'bc1ebed5-7a2b-401a-a603-6665162aa09e', 'userInvitation', '867ba3576c49a4cd69c90c32f6456cb2', '867ba3576c49a4cd69c90c32f6456cb2.jpg', 'image/jpeg', 'public', 'public', 61131, '[]', '[]', '[]', '[]', 3, '2025-06-13 16:55:26', '2025-06-13 16:55:26'),
(978, 'App\\Models\\UserInvitation', 549, '3a399af0-42ab-4369-a31f-dd43aeb0c61a', 'userInvitation', 'inv', 'inv.jpg', 'image/jpeg', 'public', 'public', 18101, '[]', '[]', '[]', '[]', 1, '2025-06-13 17:07:01', '2025-06-13 17:07:01'),
(979, 'App\\Models\\UserInvitation', 549, '5800b9bf-e4b7-4e3e-992a-44debcd97d1b', 'qr', '1749823623', '1749823623.png', 'image/png', 'public', 'public', 31428, '[]', '[]', '[]', '[]', 2, '2025-06-13 17:07:04', '2025-06-13 17:07:04'),
(980, 'App\\Models\\UserInvitation', 549, '5f95b99f-dfff-4aaf-ab7a-57a3a54e5be6', 'userInvitation', '8b5ec9602506d83924c2163b98baa7bd', '8b5ec9602506d83924c2163b98baa7bd.jpg', 'image/jpeg', 'public', 'public', 59345, '[]', '[]', '[]', '[]', 3, '2025-06-13 17:07:04', '2025-06-13 17:07:04'),
(981, 'App\\Models\\UserInvitation', 550, '7eb0c77e-2a1c-4b71-8d65-8115ffd0c440', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-13 18:27:47', '2025-06-13 18:27:47'),
(982, 'App\\Models\\UserInvitation', 550, '810536a4-2bfe-44af-8900-ed3d3260b351', 'qr', '1749828472', '1749828472.png', 'image/png', 'public', 'public', 27111, '[]', '[]', '[]', '[]', 2, '2025-06-13 18:27:52', '2025-06-13 18:27:52'),
(983, 'App\\Models\\UserInvitation', 550, 'ea3ce2a9-f81e-41b1-9c1b-b190ca74df34', 'userInvitation', '2b819fb516ab706bf8deb44be6bcf109', '2b819fb516ab706bf8deb44be6bcf109.jpg', 'image/jpeg', 'public', 'public', 247604, '[]', '[]', '[]', '[]', 3, '2025-06-13 18:27:52', '2025-06-13 18:27:52'),
(984, 'App\\Models\\UserInvitation', 551, '35e82cc9-ddc2-4a77-9942-1f2eba600f1d', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 18:28:47', '2025-06-13 18:28:47'),
(985, 'App\\Models\\UserInvitation', 551, 'bd0ddef6-83e9-4117-8a87-158612b6a6d4', 'qr', '1749828529', '1749828529.png', 'image/png', 'public', 'public', 27179, '[]', '[]', '[]', '[]', 2, '2025-06-13 18:28:49', '2025-06-13 18:28:49'),
(986, 'App\\Models\\UserInvitation', 551, '36afb508-9345-46c1-902d-cad448e2780b', 'userInvitation', '41bb4a3682153cd422622582c9938fe1', '41bb4a3682153cd422622582c9938fe1.jpg', 'image/jpeg', 'public', 'public', 45055, '[]', '[]', '[]', '[]', 3, '2025-06-13 18:28:49', '2025-06-13 18:28:49'),
(987, 'App\\Models\\UserInvitation', 552, '1b106098-40b9-4c8a-b40d-ac6b062b40af', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-13 18:29:37', '2025-06-13 18:29:37'),
(988, 'App\\Models\\UserInvitation', 552, 'd46117db-8505-4b6a-b1f3-20751ca0580a', 'qr', '1749828580', '1749828580.png', 'image/png', 'public', 'public', 27193, '[]', '[]', '[]', '[]', 2, '2025-06-13 18:29:40', '2025-06-13 18:29:40'),
(989, 'App\\Models\\UserInvitation', 552, '6fb6d8e4-812c-47b9-b943-d5b222aaadef', 'userInvitation', '8090c098f575e9ae78d4ca808d50ff78', '8090c098f575e9ae78d4ca808d50ff78.jpg', 'image/jpeg', 'public', 'public', 247947, '[]', '[]', '[]', '[]', 3, '2025-06-13 18:29:40', '2025-06-13 18:29:40'),
(990, 'App\\Models\\UserInvitation', 553, '040bded3-ef81-4931-aba8-946aa577cd4f', 'userInvitation', '39b51933-74d1-4ff2-ba6c-75d91c599017', '39b51933-74d1-4ff2-ba6c-75d91c599017.png', 'image/png', 'public', 'public', 342792, '[]', '[]', '[]', '[]', 1, '2025-06-13 18:34:27', '2025-06-13 18:34:27'),
(991, 'App\\Models\\UserInvitation', 553, '1d003210-90a8-4249-a7dc-19edf4042371', 'qr', '1749828869', '1749828869.png', 'image/png', 'public', 'public', 26801, '[]', '[]', '[]', '[]', 2, '2025-06-13 18:34:29', '2025-06-13 18:34:29'),
(992, 'App\\Models\\UserInvitation', 553, '50fe804e-5ba9-4982-89ed-ed30318ff076', 'userInvitation', 'b7b0f55d89829bfac02d116e7c61a989', 'b7b0f55d89829bfac02d116e7c61a989.jpg', 'image/jpeg', 'public', 'public', 443006, '[]', '[]', '[]', '[]', 3, '2025-06-13 18:34:30', '2025-06-13 18:34:30'),
(993, 'App\\Models\\UserInvitation', 554, '628097d7-52a3-4ee4-a00d-d3b406f6cd62', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 18:52:18', '2025-06-13 18:52:18'),
(994, 'App\\Models\\UserInvitation', 554, 'ecfc7e21-9b2d-48d8-b3d9-8aa6b9c9ebb5', 'qr', '1749829945', '1749829945.png', 'image/png', 'public', 'public', 26481, '[]', '[]', '[]', '[]', 2, '2025-06-13 18:52:25', '2025-06-13 18:52:25'),
(995, 'App\\Models\\UserInvitation', 554, '85fec9b0-f4b7-4978-833f-a6710fd964d3', 'userInvitation', 'aed9c7a07ad182381df21f6ce6419a78', 'aed9c7a07ad182381df21f6ce6419a78.jpg', 'image/jpeg', 'public', 'public', 44794, '[]', '[]', '[]', '[]', 3, '2025-06-13 18:52:25', '2025-06-13 18:52:25'),
(996, 'App\\Models\\UserInvitation', 555, '12dc9814-baaf-4afa-8d93-95b465e5ba37', 'userInvitation', '39b51933-74d1-4ff2-ba6c-75d91c599017', '39b51933-74d1-4ff2-ba6c-75d91c599017.png', 'image/png', 'public', 'public', 342792, '[]', '[]', '[]', '[]', 1, '2025-06-13 18:53:00', '2025-06-13 18:53:00'),
(997, 'App\\Models\\UserInvitation', 555, 'e6b08e85-09f2-483f-98f4-9e7476f8d745', 'qr', '1749829984', '1749829984.png', 'image/png', 'public', 'public', 26863, '[]', '[]', '[]', '[]', 2, '2025-06-13 18:53:04', '2025-06-13 18:53:04'),
(998, 'App\\Models\\UserInvitation', 555, 'e30d30d5-51b6-4fae-a21c-660278203bc1', 'userInvitation', '821ac039fb0d7a5efb262e809f0aa9b4', '821ac039fb0d7a5efb262e809f0aa9b4.jpg', 'image/jpeg', 'public', 'public', 443450, '[]', '[]', '[]', '[]', 3, '2025-06-13 18:53:04', '2025-06-13 18:53:04'),
(999, 'App\\Models\\UserInvitation', 556, 'f77dc553-fe07-415b-9fda-d76e1d8712aa', 'userInvitation', '39b51933-74d1-4ff2-ba6c-75d91c599017', '39b51933-74d1-4ff2-ba6c-75d91c599017.png', 'image/png', 'public', 'public', 342792, '[]', '[]', '[]', '[]', 1, '2025-06-13 18:59:22', '2025-06-13 18:59:22'),
(1000, 'App\\Models\\UserInvitation', 556, '23484980-c9d0-48a2-b095-d1143a906ca8', 'qr', '1749830365', '1749830365.png', 'image/png', 'public', 'public', 27621, '[]', '[]', '[]', '[]', 2, '2025-06-13 18:59:25', '2025-06-13 18:59:25'),
(1001, 'App\\Models\\UserInvitation', 556, '8d5e94c3-5c2e-4e68-b503-fe2b29c4407c', 'userInvitation', '6fa7f8fc7b54a65199bb4a50841f91a4', '6fa7f8fc7b54a65199bb4a50841f91a4.jpg', 'image/jpeg', 'public', 'public', 445482, '[]', '[]', '[]', '[]', 3, '2025-06-13 18:59:25', '2025-06-13 18:59:25'),
(1002, 'App\\Models\\UserInvitation', 557, 'adea45de-486c-47fe-ac13-6fb6771a0009', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 19:02:45', '2025-06-13 19:02:45'),
(1003, 'App\\Models\\UserInvitation', 557, '1b6eb641-02cf-4687-9501-e379a2d07385', 'qr', '1749830568', '1749830568.png', 'image/png', 'public', 'public', 26352, '[]', '[]', '[]', '[]', 2, '2025-06-13 19:02:48', '2025-06-13 19:02:48'),
(1004, 'App\\Models\\UserInvitation', 558, 'a33ef279-4a94-49f3-bbc4-ad2d5a7d3d38', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 19:05:37', '2025-06-13 19:05:37'),
(1005, 'App\\Models\\UserInvitation', 558, '9ee28f9c-1914-456c-a092-583b0cf5f08d', 'qr', '1749830740', '1749830740.png', 'image/png', 'public', 'public', 26259, '[]', '[]', '[]', '[]', 2, '2025-06-13 19:05:40', '2025-06-13 19:05:40'),
(1006, 'App\\Models\\UserInvitation', 559, 'c96b89ce-e052-4d43-9681-904be92fbd0a', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 19:07:35', '2025-06-13 19:07:35'),
(1007, 'App\\Models\\UserInvitation', 559, '4f94775c-d265-4933-9e64-9884f6dbda17', 'qr', '1749830858', '1749830858.png', 'image/png', 'public', 'public', 26465, '[]', '[]', '[]', '[]', 2, '2025-06-13 19:07:38', '2025-06-13 19:07:38'),
(1008, 'App\\Models\\UserInvitation', 560, 'c1ea4fad-dd8d-4243-8e1c-7b2ba25bac95', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 19:11:50', '2025-06-13 19:11:50'),
(1009, 'App\\Models\\UserInvitation', 560, '6afa2912-f81a-43a2-8038-223dd1f818ce', 'qr', '1749831113', '1749831113.png', 'image/png', 'public', 'public', 25920, '[]', '[]', '[]', '[]', 2, '2025-06-13 19:11:53', '2025-06-13 19:11:53'),
(1010, 'App\\Models\\UserInvitation', 561, 'f1bf0e54-0b2a-4218-9110-bb4e6cbad071', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 19:18:20', '2025-06-13 19:18:20'),
(1011, 'App\\Models\\UserInvitation', 561, '1df2e262-da2f-4a08-beb1-a09203d4cd5d', 'qr', '1749831503', '1749831503.png', 'image/png', 'public', 'public', 26273, '[]', '[]', '[]', '[]', 2, '2025-06-13 19:18:23', '2025-06-13 19:18:23'),
(1012, 'App\\Models\\UserInvitation', 562, 'a5c2c28b-c7c3-413c-a104-d74ea2728a78', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 19:19:57', '2025-06-13 19:19:57'),
(1013, 'App\\Models\\UserInvitation', 562, '71ec9464-5908-4253-b7c0-c35241f84831', 'qr', '1749831600', '1749831600.png', 'image/png', 'public', 'public', 26728, '[]', '[]', '[]', '[]', 2, '2025-06-13 19:20:00', '2025-06-13 19:20:00'),
(1014, 'App\\Models\\UserInvitation', 562, '5553fd42-dbc0-4428-9dba-13181c51f445', 'userInvitation', '12e8ef3453f75aa34440162ac3c16bb2', '12e8ef3453f75aa34440162ac3c16bb2.jpg', 'image/jpeg', 'public', 'public', 44727, '[]', '[]', '[]', '[]', 3, '2025-06-13 19:20:00', '2025-06-13 19:20:00'),
(1015, 'App\\Models\\UserInvitation', 563, '70135ec6-2860-490a-805c-b58d0ef3e542', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-13 19:45:27', '2025-06-13 19:45:27'),
(1016, 'App\\Models\\UserInvitation', 563, '771635e5-1fcc-456c-b5b5-55da52bc898c', 'qr', '1749833130', '1749833130.png', 'image/png', 'public', 'public', 26925, '[]', '[]', '[]', '[]', 2, '2025-06-13 19:45:30', '2025-06-13 19:45:30'),
(1017, 'App\\Models\\UserInvitation', 563, 'da1982f6-f069-47f6-8e6d-1b82a7b573fd', 'userInvitation', 'd6ed0dd4a48118eab1823eb06592b257', 'd6ed0dd4a48118eab1823eb06592b257.jpg', 'image/jpeg', 'public', 'public', 246251, '[]', '[]', '[]', '[]', 3, '2025-06-13 19:45:30', '2025-06-13 19:45:30'),
(1018, 'App\\Models\\UserInvitation', 564, '8a683b03-cd5a-4a4d-953f-15cdbacbe8d6', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 19:48:39', '2025-06-13 19:48:39'),
(1019, 'App\\Models\\UserInvitation', 564, 'a5c29647-43e4-4d54-b8c9-43d8dc5526e2', 'qr', '1749833321', '1749833321.png', 'image/png', 'public', 'public', 26105, '[]', '[]', '[]', '[]', 2, '2025-06-13 19:48:41', '2025-06-13 19:48:41'),
(1020, 'App\\Models\\UserInvitation', 565, '714b44b9-8b89-4ba4-a9c1-6953190c7852', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-13 19:58:13', '2025-06-13 19:58:13'),
(1021, 'App\\Models\\UserInvitation', 565, '258c5ccc-7249-4e0d-b7c0-726200ed5b78', 'qr', '1749833897', '1749833897.png', 'image/png', 'public', 'public', 27256, '[]', '[]', '[]', '[]', 2, '2025-06-13 19:58:17', '2025-06-13 19:58:17'),
(1022, 'App\\Models\\UserInvitation', 565, 'b573a50f-3b21-4858-854d-40ac52fe72a5', 'userInvitation', 'eafb3a6d8588d384a6e4319709705644', 'eafb3a6d8588d384a6e4319709705644.jpg', 'image/jpeg', 'public', 'public', 247825, '[]', '[]', '[]', '[]', 3, '2025-06-13 19:58:17', '2025-06-13 19:58:17'),
(1023, 'App\\Models\\UserInvitation', 566, 'bd687b95-45fb-4156-836b-00b274147cb2', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 20:01:35', '2025-06-13 20:01:35'),
(1024, 'App\\Models\\UserInvitation', 567, '76dfe084-3175-4545-b6b4-16ce93edca71', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 20:01:38', '2025-06-13 20:01:38'),
(1025, 'App\\Models\\UserInvitation', 567, '91cbcd11-069b-4b56-bf81-5f273c5c2d72', 'qr', '1749834099', '1749834099.png', 'image/png', 'public', 'public', 27421, '[]', '[]', '[]', '[]', 2, '2025-06-13 20:01:39', '2025-06-13 20:01:39'),
(1026, 'App\\Models\\UserInvitation', 567, 'ed07d9be-a0cd-4461-a735-152cc0f7f3f2', 'qr', '1749834100', '1749834100.png', 'image/png', 'public', 'public', 27324, '[]', '[]', '[]', '[]', 3, '2025-06-13 20:01:40', '2025-06-13 20:01:40'),
(1027, 'App\\Models\\UserInvitation', 568, 'b575339e-2f70-42d8-b98a-841df8ec813a', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-13 20:02:07', '2025-06-13 20:02:07'),
(1028, 'App\\Models\\UserInvitation', 568, 'c90bfa0a-055e-406d-ae50-803f1a1e5907', 'qr', '1749834130', '1749834130.png', 'image/png', 'public', 'public', 27346, '[]', '[]', '[]', '[]', 2, '2025-06-13 20:02:10', '2025-06-13 20:02:10'),
(1029, 'App\\Models\\UserInvitation', 569, 'e089b3fe-8aa8-4a44-983a-4f8e72dd9cae', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-13 20:04:02', '2025-06-13 20:04:02'),
(1030, 'App\\Models\\UserInvitation', 569, '6a5ec1af-675a-470b-840f-6a3abe87670c', 'qr', '1749834244', '1749834244.png', 'image/png', 'public', 'public', 27300, '[]', '[]', '[]', '[]', 2, '2025-06-13 20:04:04', '2025-06-13 20:04:04'),
(1031, 'App\\Models\\UserInvitation', 569, '375bc69b-87d9-488f-8ceb-db79e52ce087', 'userInvitation', 'e30f3a9072f7e7dc5e263de066566e68', 'e30f3a9072f7e7dc5e263de066566e68.jpg', 'image/jpeg', 'public', 'public', 247975, '[]', '[]', '[]', '[]', 3, '2025-06-13 20:04:04', '2025-06-13 20:04:04'),
(1032, 'App\\Models\\UserInvitation', 570, '0e171772-8c3d-4ee8-a5e0-c58516e61dae', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 20:04:30', '2025-06-13 20:04:30'),
(1033, 'App\\Models\\UserInvitation', 570, 'c7f5d43c-8fb3-4aa4-84b5-0f58ebf4aced', 'qr', '1749834272', '1749834272.png', 'image/png', 'public', 'public', 26365, '[]', '[]', '[]', '[]', 2, '2025-06-13 20:04:32', '2025-06-13 20:04:32'),
(1034, 'App\\Models\\UserInvitation', 571, 'b0f4908b-d1e2-4cc2-a3f1-d8952e68d2c6', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-13 22:54:35', '2025-06-13 22:54:35'),
(1035, 'App\\Models\\UserInvitation', 571, 'b8cec43b-35c5-4582-86f8-82318ae7a441', 'qr', '1749844479', '1749844479.png', 'image/png', 'public', 'public', 26776, '[]', '[]', '[]', '[]', 2, '2025-06-13 22:54:39', '2025-06-13 22:54:39'),
(1036, 'App\\Models\\UserInvitation', 571, '6355decd-d836-4672-81eb-e0581aa74776', 'userInvitation', '00c0736d2cff59d79e63ee21a182c539', '00c0736d2cff59d79e63ee21a182c539.jpg', 'image/jpeg', 'public', 'public', 246347, '[]', '[]', '[]', '[]', 3, '2025-06-13 22:54:39', '2025-06-13 22:54:39'),
(1037, 'App\\Models\\UserInvitation', 572, '7195d6ef-42b4-478c-a555-8ac02296e3a3', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-13 22:57:39', '2025-06-13 22:57:39'),
(1038, 'App\\Models\\UserInvitation', 572, 'fc372a0a-3f83-493b-9a0a-803f81d6c4df', 'qr', '1749844664', '1749844664.png', 'image/png', 'public', 'public', 26776, '[]', '[]', '[]', '[]', 2, '2025-06-13 22:57:44', '2025-06-13 22:57:44'),
(1039, 'App\\Models\\UserInvitation', 573, '1b4acd40-3288-4bea-87ba-fe82b0e38de4', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-13 22:58:30', '2025-06-13 22:58:30'),
(1040, 'App\\Models\\UserInvitation', 573, 'dc8c9e48-edd4-432b-94fe-27e48ad4565d', 'qr', '1749844714', '1749844714.png', 'image/png', 'public', 'public', 26903, '[]', '[]', '[]', '[]', 2, '2025-06-13 22:58:34', '2025-06-13 22:58:34'),
(1041, 'App\\Models\\UserInvitation', 574, '190c5d60-0e75-4ee3-9a9b-98ad9af5c6c1', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-13 22:59:46', '2025-06-13 22:59:46'),
(1042, 'App\\Models\\UserInvitation', 574, 'b7b6b968-d9a2-4c3a-a01a-4949eca1aedf', 'qr', '1749844790', '1749844790.png', 'image/png', 'public', 'public', 26963, '[]', '[]', '[]', '[]', 2, '2025-06-13 22:59:50', '2025-06-13 22:59:50'),
(1043, 'App\\Models\\UserInvitation', 574, 'ce4ba742-d145-4466-9f33-d039d9a9fb27', 'userInvitation', 'a5ecdb5147333aac20c941277af64a6f', 'a5ecdb5147333aac20c941277af64a6f.jpg', 'image/jpeg', 'public', 'public', 246068, '[]', '[]', '[]', '[]', 3, '2025-06-13 22:59:50', '2025-06-13 22:59:50'),
(1044, 'App\\Models\\UserInvitation', 575, '163c2454-236c-484e-98be-2f902697b237', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-13 23:03:55', '2025-06-13 23:03:55'),
(1045, 'App\\Models\\UserInvitation', 575, '46742b37-1042-432f-ae0f-3b14f5f0704b', 'qr', '1749845037', '1749845037.png', 'image/png', 'public', 'public', 26918, '[]', '[]', '[]', '[]', 2, '2025-06-13 23:03:57', '2025-06-13 23:03:57'),
(1046, 'App\\Models\\UserInvitation', 576, 'eacc3124-c45f-492e-b718-d141362c9796', 'userInvitation', 'inv', 'inv.jpg', 'image/jpeg', 'public', 'public', 18101, '[]', '[]', '[]', '[]', 1, '2025-06-14 00:48:09', '2025-06-14 00:48:09'),
(1047, 'App\\Models\\UserInvitation', 576, 'a5defb14-c077-4e0b-9288-4a339eb6e2a9', 'qr', '1749851294', '1749851294.png', 'image/png', 'public', 'public', 31466, '[]', '[]', '[]', '[]', 2, '2025-06-14 00:48:14', '2025-06-14 00:48:14'),
(1048, 'App\\Models\\UserInvitation', 576, 'c768cb3e-1f9e-496f-91da-7240bf2dd19f', 'userInvitation', '1612d550468c5a81870738e52ba21140', '1612d550468c5a81870738e52ba21140.jpg', 'image/jpeg', 'public', 'public', 59345, '[]', '[]', '[]', '[]', 3, '2025-06-14 00:48:14', '2025-06-14 00:48:14'),
(1049, 'App\\Models\\UserInvitation', 577, '93c378ec-5163-4f85-9f2e-171694993f21', 'userInvitation', 'inv', 'inv.jpg', 'image/jpeg', 'public', 'public', 18101, '[]', '[]', '[]', '[]', 1, '2025-06-14 00:54:24', '2025-06-14 00:54:24'),
(1050, 'App\\Models\\UserInvitation', 577, '4fe356b8-0c9b-419d-8f63-e7cada94745a', 'qr', '1749851667', '1749851667.png', 'image/png', 'public', 'public', 32777, '[]', '[]', '[]', '[]', 2, '2025-06-14 00:54:27', '2025-06-14 00:54:27'),
(1051, 'App\\Models\\UserInvitation', 577, '12ef9b22-cc9c-4081-b464-b2fb1126c8bf', 'userInvitation', 'f951f26a6039093d962bd425b0411866', 'f951f26a6039093d962bd425b0411866.jpg', 'image/jpeg', 'public', 'public', 61908, '[]', '[]', '[]', '[]', 3, '2025-06-14 00:54:27', '2025-06-14 00:54:27'),
(1052, 'App\\Models\\UserInvitation', 578, 'd2c477f4-a6f9-4a4d-8bd0-f684c52fb3d8', 'userInvitation', 'inv', 'inv.jpg', 'image/jpeg', 'public', 'public', 18101, '[]', '[]', '[]', '[]', 1, '2025-06-14 00:56:31', '2025-06-14 00:56:31'),
(1053, 'App\\Models\\UserInvitation', 578, '03ec518e-1e2a-40ac-a1a6-8e832adb3796', 'qr', '1749851794', '1749851794.png', 'image/png', 'public', 'public', 32910, '[]', '[]', '[]', '[]', 2, '2025-06-14 00:56:34', '2025-06-14 00:56:34'),
(1054, 'App\\Models\\UserInvitation', 578, 'dc4fcf74-f4f9-433c-9867-81a6f1e959d6', 'userInvitation', '9cbaf62091b9984566ad8791e1cb1831', '9cbaf62091b9984566ad8791e1cb1831.jpg', 'image/jpeg', 'public', 'public', 60999, '[]', '[]', '[]', '[]', 3, '2025-06-14 00:56:34', '2025-06-14 00:56:34'),
(1055, 'App\\Models\\UserInvitation', 579, '5506904b-4bd6-4257-ac36-fab7c40f6ca1', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-14 01:32:47', '2025-06-14 01:32:47'),
(1056, 'App\\Models\\UserInvitation', 579, '2e47a260-0ed9-4468-b195-73a8f524f8dd', 'qr', '1749853971', '1749853971.png', 'image/png', 'public', 'public', 27152, '[]', '[]', '[]', '[]', 2, '2025-06-14 01:32:51', '2025-06-14 01:32:51'),
(1057, 'App\\Models\\UserInvitation', 579, '8ab4939b-f644-4266-beef-f522470121eb', 'userInvitation', '3cad907d565b212bc8cda8ee2117f404', '3cad907d565b212bc8cda8ee2117f404.jpg', 'image/jpeg', 'public', 'public', 246810, '[]', '[]', '[]', '[]', 3, '2025-06-14 01:32:51', '2025-06-14 01:32:51'),
(1058, 'App\\Models\\UserInvitation', 580, 'a2eafe0c-b518-4a1d-8954-2234fc44f64d', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-14 01:35:32', '2025-06-14 01:35:32'),
(1059, 'App\\Models\\UserInvitation', 580, 'd3c9ba57-974e-403b-b83d-61d7d81dea03', 'qr', '1749854137', '1749854137.png', 'image/png', 'public', 'public', 27225, '[]', '[]', '[]', '[]', 2, '2025-06-14 01:35:37', '2025-06-14 01:35:37'),
(1060, 'App\\Models\\UserInvitation', 580, 'e8c87b4e-62b4-44d0-b121-42061c221e81', 'userInvitation', '0ccff305c0a514ab8d1a82362b68c35d', '0ccff305c0a514ab8d1a82362b68c35d.jpg', 'image/jpeg', 'public', 'public', 247752, '[]', '[]', '[]', '[]', 3, '2025-06-14 01:35:37', '2025-06-14 01:35:37'),
(1061, 'App\\Models\\UserInvitation', 581, '376a6619-3cce-4b2e-863d-15bc8cc71dd6', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-14 01:48:07', '2025-06-14 01:48:07'),
(1062, 'App\\Models\\UserInvitation', 581, '059d2540-a0c4-4ad2-9aae-8af4112b3260', 'qr', '1749854893', '1749854893.png', 'image/png', 'public', 'public', 25860, '[]', '[]', '[]', '[]', 2, '2025-06-14 01:48:13', '2025-06-14 01:48:13'),
(1063, 'App\\Models\\UserInvitation', 581, '3d12a370-c63d-4d71-b29c-4f496a999e51', 'userInvitation', 'd8d39bd303d7be574b3d0611283b6d06', 'd8d39bd303d7be574b3d0611283b6d06.jpg', 'image/jpeg', 'public', 'public', 43953, '[]', '[]', '[]', '[]', 3, '2025-06-14 01:48:13', '2025-06-14 01:48:13'),
(1064, 'App\\Models\\UserInvitation', 582, '4bf5dd88-202d-479f-a83f-9b2431b74a17', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-14 01:55:47', '2025-06-14 01:55:47'),
(1065, 'App\\Models\\UserInvitation', 582, '00b7847e-a958-4001-8bc6-b8fb9aa19a81', 'qr', '1749855350', '1749855350.png', 'image/png', 'public', 'public', 26786, '[]', '[]', '[]', '[]', 2, '2025-06-14 01:55:50', '2025-06-14 01:55:50'),
(1066, 'App\\Models\\UserInvitation', 582, '556755e1-0d38-4691-958f-41d9d144c5d1', 'userInvitation', '7a12de92d74884a372c7d72eed977f10', '7a12de92d74884a372c7d72eed977f10.jpg', 'image/jpeg', 'public', 'public', 44812, '[]', '[]', '[]', '[]', 3, '2025-06-14 01:55:50', '2025-06-14 01:55:50'),
(1067, 'App\\Models\\UserInvitation', 583, '1b60206d-730b-4e28-b3ae-9e1ddd28ba53', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-14 01:58:21', '2025-06-14 01:58:21'),
(1068, 'App\\Models\\UserInvitation', 583, 'e1952de8-aea8-4940-a5d7-ac2ef26ee10c', 'qr', '1749855504', '1749855504.png', 'image/png', 'public', 'public', 25896, '[]', '[]', '[]', '[]', 2, '2025-06-14 01:58:24', '2025-06-14 01:58:24'),
(1069, 'App\\Models\\UserInvitation', 583, '5bba8fbe-d798-4c79-a06f-2757a23008c8', 'userInvitation', '772b63f0700f93b6161db1cc74edf348', '772b63f0700f93b6161db1cc74edf348.jpg', 'image/jpeg', 'public', 'public', 245442, '[]', '[]', '[]', '[]', 3, '2025-06-14 01:58:24', '2025-06-14 01:58:24'),
(1070, 'App\\Models\\UserInvitation', 584, '537fd79c-32d0-4995-a1b4-3270cfc7b2b9', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-14 01:59:06', '2025-06-14 01:59:06'),
(1071, 'App\\Models\\UserInvitation', 585, 'f04f01f2-504c-46b1-afd9-3dcebec9927e', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-14 01:59:24', '2025-06-14 01:59:24'),
(1072, 'App\\Models\\UserInvitation', 585, 'acda006d-998f-4c7f-a3bc-b293059f86f5', 'qr', '1749855567', '1749855567.png', 'image/png', 'public', 'public', 27199, '[]', '[]', '[]', '[]', 2, '2025-06-14 01:59:27', '2025-06-14 01:59:27'),
(1073, 'App\\Models\\UserInvitation', 585, 'd747c77c-6fed-4bd3-9d36-126f78ad30ea', 'userInvitation', '19708f8367a6d403ac1854969981d29f', '19708f8367a6d403ac1854969981d29f.jpg', 'image/jpeg', 'public', 'public', 45055, '[]', '[]', '[]', '[]', 3, '2025-06-14 01:59:27', '2025-06-14 01:59:27'),
(1074, 'App\\Models\\UserInvitation', 586, '2ab66bc8-f1fb-4c84-8a9e-93ccb7539893', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-14 02:00:26', '2025-06-14 02:00:26'),
(1075, 'App\\Models\\UserInvitation', 586, '68b9761b-6018-44d2-b1f7-9850cce7a559', 'qr', '1749855630', '1749855630.png', 'image/png', 'public', 'public', 26835, '[]', '[]', '[]', '[]', 2, '2025-06-14 02:00:30', '2025-06-14 02:00:30'),
(1076, 'App\\Models\\UserInvitation', 586, 'af5802d0-4f4e-42b3-accd-204a2bd19b6e', 'userInvitation', 'f23b4747108404dd35803b4552faf454', 'f23b4747108404dd35803b4552faf454.jpg', 'image/jpeg', 'public', 'public', 246119, '[]', '[]', '[]', '[]', 3, '2025-06-14 02:00:30', '2025-06-14 02:00:30'),
(1077, 'App\\Models\\UserInvitation', 587, 'cb85efe2-15a3-4be5-84aa-75c299fdead4', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-14 02:05:53', '2025-06-14 02:05:53'),
(1078, 'App\\Models\\UserInvitation', 587, '20c64b80-2185-4bcc-9882-9d23dc4868ef', 'qr', '1749855955', '1749855955.png', 'image/png', 'public', 'public', 26815, '[]', '[]', '[]', '[]', 2, '2025-06-14 02:05:55', '2025-06-14 02:05:55'),
(1079, 'App\\Models\\UserInvitation', 587, '868ccb3e-3f2c-4b2f-b949-e7df807a28eb', 'userInvitation', 'cba8543c605fbff6b61f81d2c258e3f8', 'cba8543c605fbff6b61f81d2c258e3f8.jpg', 'image/jpeg', 'public', 'public', 246841, '[]', '[]', '[]', '[]', 3, '2025-06-14 02:05:56', '2025-06-14 02:05:56'),
(1080, 'App\\Models\\UserInvitation', 588, 'c73f77da-20ac-45bb-9c59-7251405d2196', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-14 02:13:03', '2025-06-14 02:13:03'),
(1081, 'App\\Models\\UserInvitation', 588, '429b59eb-e590-4232-8a85-a8510ad5e0ec', 'qr', '1749856387', '1749856387.png', 'image/png', 'public', 'public', 27181, '[]', '[]', '[]', '[]', 2, '2025-06-14 02:13:07', '2025-06-14 02:13:07'),
(1082, 'App\\Models\\UserInvitation', 588, '2bd9f04f-d743-4c9f-91b6-aa604e007c19', 'userInvitation', '7eb0dc2b555594ffa3834b2dd2199355', '7eb0dc2b555594ffa3834b2dd2199355.jpg', 'image/jpeg', 'public', 'public', 247238, '[]', '[]', '[]', '[]', 3, '2025-06-14 02:13:07', '2025-06-14 02:13:07'),
(1083, 'App\\Models\\UserInvitation', 589, 'c6975a5f-548d-4cff-86dd-14a9c51ead12', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-14 02:18:39', '2025-06-14 02:18:39'),
(1084, 'App\\Models\\UserInvitation', 589, 'e91c3cda-78b9-4458-9af9-7c87f5c26b35', 'qr', '1749856723', '1749856723.png', 'image/png', 'public', 'public', 27204, '[]', '[]', '[]', '[]', 2, '2025-06-14 02:18:43', '2025-06-14 02:18:43'),
(1085, 'App\\Models\\UserInvitation', 589, '5d247b6d-f88f-44d6-967f-f35d994e56b4', 'userInvitation', '2938a0cf6f8c709c110c258bdfb19e40', '2938a0cf6f8c709c110c258bdfb19e40.jpg', 'image/jpeg', 'public', 'public', 248085, '[]', '[]', '[]', '[]', 3, '2025-06-14 02:18:43', '2025-06-14 02:18:43'),
(1086, 'App\\Models\\UserInvitation', 590, '68d1672d-4ef3-4570-9bc0-93508ebb6bda', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-14 02:27:06', '2025-06-14 02:27:06'),
(1087, 'App\\Models\\UserInvitation', 590, '8b90b042-05ee-40fd-a07f-d30994c975fb', 'qr', '1749857231', '1749857231.png', 'image/png', 'public', 'public', 27076, '[]', '[]', '[]', '[]', 2, '2025-06-14 02:27:11', '2025-06-14 02:27:11'),
(1088, 'App\\Models\\UserInvitation', 590, '7c7636c2-22f7-409b-9b22-28bd05762e95', 'userInvitation', 'c26715eef9c4898ef3888e1f79c9771e', 'c26715eef9c4898ef3888e1f79c9771e.jpg', 'image/jpeg', 'public', 'public', 246880, '[]', '[]', '[]', '[]', 3, '2025-06-14 02:27:11', '2025-06-14 02:27:11'),
(1089, 'App\\Models\\UserInvitation', 591, '56d0512a-7c1e-45b1-9197-3da0fce9f366', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-14 02:34:15', '2025-06-14 02:34:15'),
(1090, 'App\\Models\\UserInvitation', 591, '2113f59a-86f7-4a78-93ac-2fca462b043e', 'qr', '1749857659', '1749857659.png', 'image/png', 'public', 'public', 26029, '[]', '[]', '[]', '[]', 2, '2025-06-14 02:34:19', '2025-06-14 02:34:19'),
(1091, 'App\\Models\\UserInvitation', 591, '86af92aa-bb9a-4ebc-b323-88fa543f5866', 'userInvitation', '669f6826e1f57136dd92a7b1b8470c53', '669f6826e1f57136dd92a7b1b8470c53.jpg', 'image/jpeg', 'public', 'public', 246251, '[]', '[]', '[]', '[]', 3, '2025-06-14 02:34:20', '2025-06-14 02:34:20'),
(1092, 'App\\Models\\UserInvitation', 592, 'a61ea7de-4f5e-45bb-8c94-1bbe7958d2d7', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-14 02:38:39', '2025-06-14 02:38:39'),
(1093, 'App\\Models\\UserInvitation', 592, '2f34687a-604a-484a-8abd-3dcc8c628360', 'qr', '1749857923', '1749857923.png', 'image/png', 'public', 'public', 27151, '[]', '[]', '[]', '[]', 2, '2025-06-14 02:38:44', '2025-06-14 02:38:44'),
(1094, 'App\\Models\\UserInvitation', 592, '87957b27-1222-4495-b716-9350b54212b5', 'userInvitation', '6aa641aeb7346fc5c67645fe03c4e438', '6aa641aeb7346fc5c67645fe03c4e438.jpg', 'image/jpeg', 'public', 'public', 191871, '[]', '[]', '[]', '[]', 3, '2025-06-14 02:38:44', '2025-06-14 02:38:44'),
(1095, 'App\\Models\\UserInvitation', 593, '6724114f-f80f-4937-ac68-736a45e545fd', 'userInvitation', '39b51933-74d1-4ff2-ba6c-75d91c599017', '39b51933-74d1-4ff2-ba6c-75d91c599017.png', 'image/png', 'public', 'public', 342792, '[]', '[]', '[]', '[]', 1, '2025-06-14 02:43:14', '2025-06-14 02:43:14'),
(1096, 'App\\Models\\UserInvitation', 593, '85e739a9-90d0-4286-bb66-ce5dcdfe2cda', 'qr', '1749858199', '1749858199.png', 'image/png', 'public', 'public', 27495, '[]', '[]', '[]', '[]', 2, '2025-06-14 02:43:19', '2025-06-14 02:43:19'),
(1097, 'App\\Models\\UserInvitation', 593, '648ecd37-11d0-4d57-8de9-e8b2f72d739e', 'userInvitation', '3b1214e7f50142ba9908e7377b2fbbb4', '3b1214e7f50142ba9908e7377b2fbbb4.jpg', 'image/jpeg', 'public', 'public', 443937, '[]', '[]', '[]', '[]', 3, '2025-06-14 02:43:19', '2025-06-14 02:43:19'),
(1098, 'App\\Models\\UserInvitation', 594, 'a8e6bc9f-37f4-4d61-bbc0-2737cf55a499', 'userInvitation', '39b51933-74d1-4ff2-ba6c-75d91c599017', '39b51933-74d1-4ff2-ba6c-75d91c599017.png', 'image/png', 'public', 'public', 342792, '[]', '[]', '[]', '[]', 1, '2025-06-14 02:46:00', '2025-06-14 02:46:00'),
(1099, 'App\\Models\\UserInvitation', 594, '687ffab6-bebe-49e6-9f36-c2475824c53a', 'qr', '1749858364', '1749858364.png', 'image/png', 'public', 'public', 27075, '[]', '[]', '[]', '[]', 2, '2025-06-14 02:46:04', '2025-06-14 02:46:04'),
(1100, 'App\\Models\\UserInvitation', 594, 'a7d3260e-cba2-4a71-a547-fbc659959ac6', 'userInvitation', '92354d1316ee3d757e32e3f84c042bb4', '92354d1316ee3d757e32e3f84c042bb4.jpg', 'image/jpeg', 'public', 'public', 457701, '[]', '[]', '[]', '[]', 3, '2025-06-14 02:46:04', '2025-06-14 02:46:04'),
(1101, 'App\\Models\\UserInvitation', 595, '6b0ab072-4917-447d-856e-a71bb9b873ff', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-14 02:51:26', '2025-06-14 02:51:26'),
(1102, 'App\\Models\\UserInvitation', 595, '8937483f-1599-4696-8cc5-d1551ab7c799', 'qr', '1749858690', '1749858690.png', 'image/png', 'public', 'public', 27205, '[]', '[]', '[]', '[]', 2, '2025-06-14 02:51:30', '2025-06-14 02:51:30'),
(1103, 'App\\Models\\UserInvitation', 595, 'a2a961ab-f1c3-4a34-8e2a-62a2ec4a47f5', 'userInvitation', '86da4a9a3836a69c4571dc5543bff58f', '86da4a9a3836a69c4571dc5543bff58f.jpg', 'image/jpeg', 'public', 'public', 247283, '[]', '[]', '[]', '[]', 3, '2025-06-14 02:51:30', '2025-06-14 02:51:30');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1104, 'App\\Models\\UserInvitation', 596, 'af70e9da-2b0b-4b70-807c-a373eccb1a45', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-15 23:45:00', '2025-06-15 23:45:00'),
(1105, 'App\\Models\\UserInvitation', 596, '19b2f4c5-9c07-4876-a11c-49abaac61005', 'qr', '1750020305', '1750020305.png', 'image/png', 'public', 'public', 27284, '[]', '[]', '[]', '[]', 2, '2025-06-15 23:45:05', '2025-06-15 23:45:05'),
(1106, 'App\\Models\\UserInvitation', 596, '683cbdb3-dfaf-43ca-a657-58a9baa7df89', 'userInvitation', '69ac1384c8a69523852831693ed880bb', '69ac1384c8a69523852831693ed880bb.jpg', 'image/jpeg', 'public', 'public', 484632, '[]', '[]', '[]', '[]', 3, '2025-06-15 23:45:05', '2025-06-15 23:45:05'),
(1107, 'App\\Models\\UserInvitation', 597, 'ebf4b709-54db-4b01-97d3-879e17ef5692', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-15 23:49:39', '2025-06-15 23:49:39'),
(1108, 'App\\Models\\UserInvitation', 598, '9ea2b195-51bb-4435-9819-92ce298a7f3e', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-15 23:49:42', '2025-06-15 23:49:42'),
(1109, 'App\\Models\\UserInvitation', 597, 'dc7fdc98-4f25-4bc2-9003-30c28e8cbe4f', 'qr', '1750020582', '1750020582.png', 'image/png', 'public', 'public', 27236, '[]', '[]', '[]', '[]', 2, '2025-06-15 23:49:43', '2025-06-15 23:49:43'),
(1110, 'App\\Models\\UserInvitation', 597, '487a4c40-6df9-43ec-9e09-f11a6c62ca46', 'userInvitation', 'f820fd92759a6cd85d57e56416aaac92', 'f820fd92759a6cd85d57e56416aaac92.jpg', 'image/jpeg', 'public', 'public', 484632, '[]', '[]', '[]', '[]', 3, '2025-06-15 23:49:43', '2025-06-15 23:49:43'),
(1111, 'App\\Models\\UserInvitation', 599, '523c6434-78bb-450e-a28e-4c6e6bdb048d', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-15 23:49:45', '2025-06-15 23:49:45'),
(1112, 'App\\Models\\UserInvitation', 600, '10747def-b7f7-487b-9812-a4ecddf36991', 'userInvitation', '1749646190399_resized', '1749646190399_resized.jpg', 'image/jpeg', 'public', 'public', 43305, '[]', '[]', '[]', '[]', 1, '2025-06-15 23:50:33', '2025-06-15 23:50:33'),
(1113, 'App\\Models\\UserInvitation', 600, '06515521-a8f9-4ecd-ba08-3cb78a5cfe45', 'qr', '1750020636', '1750020636.png', 'image/png', 'public', 'public', 26894, '[]', '[]', '[]', '[]', 2, '2025-06-15 23:50:36', '2025-06-15 23:50:36'),
(1114, 'App\\Models\\UserInvitation', 601, '9388e64b-90f2-408d-99e5-94aaef6be48b', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-15 23:51:53', '2025-06-15 23:51:53'),
(1115, 'App\\Models\\UserInvitation', 601, 'e05326b2-1725-4fcf-aad4-f3fbe8c194f7', 'qr', '1750020715', '1750020715.png', 'image/png', 'public', 'public', 26896, '[]', '[]', '[]', '[]', 2, '2025-06-15 23:51:55', '2025-06-15 23:51:55'),
(1116, 'App\\Models\\UserInvitation', 601, '5af7eeb9-7e5d-4676-a7eb-e90fc9c30fd7', 'userInvitation', '13d73d73762acffe456709677a2b5acb', '13d73d73762acffe456709677a2b5acb.jpg', 'image/jpeg', 'public', 'public', 246321, '[]', '[]', '[]', '[]', 3, '2025-06-15 23:51:56', '2025-06-15 23:51:56'),
(1117, 'App\\Models\\UserInvitation', 602, 'ef8ff8eb-ca88-40f6-b013-a114f362a7ba', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 00:00:49', '2025-06-16 00:00:49'),
(1118, 'App\\Models\\UserInvitation', 602, '7dc8ec40-caf5-48f5-8795-41d34e43e503', 'qr', '1750021251', '1750021251.png', 'image/png', 'public', 'public', 26847, '[]', '[]', '[]', '[]', 2, '2025-06-16 00:00:51', '2025-06-16 00:00:51'),
(1119, 'App\\Models\\UserInvitation', 602, 'b7fb0c39-6577-467c-99e9-a96c3f4ad3eb', 'userInvitation', 'c9550b0a8541c9a169737f44968a59cd', 'c9550b0a8541c9a169737f44968a59cd.jpg', 'image/jpeg', 'public', 'public', 483868, '[]', '[]', '[]', '[]', 3, '2025-06-16 00:00:51', '2025-06-16 00:00:51'),
(1120, 'App\\Models\\UserInvitation', 603, '2e60d4cc-9920-4647-8ac7-d1b73660dbd6', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 00:13:29', '2025-06-16 00:13:29'),
(1121, 'App\\Models\\UserInvitation', 603, 'd81c4d95-0a6b-452c-89c3-c7eaaf8b1b40', 'qr', '1750022013', '1750022013.png', 'image/png', 'public', 'public', 26884, '[]', '[]', '[]', '[]', 2, '2025-06-16 00:13:34', '2025-06-16 00:13:34'),
(1122, 'App\\Models\\UserInvitation', 603, 'b60583c8-bc15-4c2e-9aa3-ab7279c2ea98', 'userInvitation', 'fa496c5dc7c5265b5661479063d0b4fe', 'fa496c5dc7c5265b5661479063d0b4fe.jpg', 'image/jpeg', 'public', 'public', 483852, '[]', '[]', '[]', '[]', 3, '2025-06-16 00:13:34', '2025-06-16 00:13:34'),
(1123, 'App\\Models\\UserInvitation', 604, '02fb87fa-2e43-4974-bef1-5072f57009d6', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 00:31:29', '2025-06-16 00:31:29'),
(1124, 'App\\Models\\UserInvitation', 604, '997e0b50-c75e-4545-a3a0-8c41e5284283', 'qr', '1750023098', '1750023098.png', 'image/png', 'public', 'public', 27175, '[]', '[]', '[]', '[]', 2, '2025-06-16 00:31:39', '2025-06-16 00:31:39'),
(1125, 'App\\Models\\UserInvitation', 604, '287b569b-2ac1-4e61-9252-6718a18c4e9b', 'userInvitation', '661d13ba5e488208a62ddb00d4c4798e', '661d13ba5e488208a62ddb00d4c4798e.jpg', 'image/jpeg', 'public', 'public', 484613, '[]', '[]', '[]', '[]', 3, '2025-06-16 00:31:39', '2025-06-16 00:31:39'),
(1126, 'App\\Models\\UserInvitation', 605, 'bcb5ae3c-d0ab-4e38-8b27-84eb369a63e5', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:05:50', '2025-06-16 01:05:50'),
(1127, 'App\\Models\\UserInvitation', 605, '812fea4b-8624-4b44-82db-19e74d6619cb', 'qr', '1750025154', '1750025154.png', 'image/png', 'public', 'public', 26902, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:05:54', '2025-06-16 01:05:54'),
(1128, 'App\\Models\\UserInvitation', 605, '4570ea44-5551-460f-81a2-2aca6a99b19d', 'userInvitation', '8cfda685f8c3e7e24599d40e324fe32e', '8cfda685f8c3e7e24599d40e324fe32e.jpg', 'image/jpeg', 'public', 'public', 483794, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:05:54', '2025-06-16 01:05:54'),
(1129, 'App\\Models\\UserInvitation', 606, 'a58a1169-eaa3-4d50-9ec7-06d324accd6e', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:08:25', '2025-06-16 01:08:25'),
(1130, 'App\\Models\\UserInvitation', 606, '4c8c8b2f-7f35-4fbf-96d4-f5fe1f891924', 'qr', '1750025309', '1750025309.png', 'image/png', 'public', 'public', 26890, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:08:29', '2025-06-16 01:08:29'),
(1131, 'App\\Models\\UserInvitation', 606, 'bfe63657-ec49-4cac-a94f-4e42c3cbaf84', 'userInvitation', '380ef17c5b20c0aab1940b28340276b0', '380ef17c5b20c0aab1940b28340276b0.jpg', 'image/jpeg', 'public', 'public', 483852, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:08:29', '2025-06-16 01:08:29'),
(1132, 'App\\Models\\UserInvitation', 607, 'cba09484-ba13-43e3-ba37-ddd08e1dfcef', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:08:32', '2025-06-16 01:08:32'),
(1133, 'App\\Models\\UserInvitation', 608, '50b459d9-aff2-46c9-a922-4163a1f90869', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:15:11', '2025-06-16 01:15:11'),
(1134, 'App\\Models\\UserInvitation', 609, '489c8761-fb8d-4bd6-bff6-88664c22a7d8', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:15:12', '2025-06-16 01:15:12'),
(1135, 'App\\Models\\UserInvitation', 609, '6c230833-d1cc-456a-b34c-239d1dd7c70d', 'qr', '1750025715', '1750025715.png', 'image/png', 'public', 'public', 27187, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:15:15', '2025-06-16 01:15:15'),
(1136, 'App\\Models\\UserInvitation', 609, '263f7b23-0b70-4533-b024-4dbd6965bd47', 'userInvitation', 'f9c914ffaf2a068db3d5aef077d5ff99', 'f9c914ffaf2a068db3d5aef077d5ff99.jpg', 'image/jpeg', 'public', 'public', 484613, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:15:15', '2025-06-16 01:15:15'),
(1137, 'App\\Models\\UserInvitation', 609, '7cc5f268-5e58-4412-89a4-b76901cf06bb', 'qr', '1750025715', '1750025715.png', 'image/png', 'public', 'public', 27279, '[]', '[]', '[]', '[]', 4, '2025-06-16 01:15:15', '2025-06-16 01:15:15'),
(1138, 'App\\Models\\UserInvitation', 609, '94499492-29c6-486a-9326-bff853cd281c', 'userInvitation', '37aa640d5149ac394b5d57af103441ba', '37aa640d5149ac394b5d57af103441ba.jpg', 'image/jpeg', 'public', 'public', 484613, '[]', '[]', '[]', '[]', 5, '2025-06-16 01:15:15', '2025-06-16 01:15:15'),
(1139, 'App\\Models\\UserInvitation', 610, '63bbffff-15c0-43fc-885e-0558c7647b8b', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:16:53', '2025-06-16 01:16:53'),
(1140, 'App\\Models\\UserInvitation', 610, '65a8af3c-afd6-4500-95d4-0ba0e5e26169', 'qr', '1750025816', '1750025816.png', 'image/png', 'public', 'public', 26955, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:16:56', '2025-06-16 01:16:56'),
(1141, 'App\\Models\\UserInvitation', 610, '5cbbddb8-e506-48bd-a740-a21a472b0bbe', 'userInvitation', 'b587a3fca74ef3d08599ca88b2322616', 'b587a3fca74ef3d08599ca88b2322616.jpg', 'image/jpeg', 'public', 'public', 483092, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:16:56', '2025-06-16 01:16:56'),
(1142, 'App\\Models\\UserInvitation', 611, 'cba51b80-ab4e-48b8-80a1-3c15dd51b092', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:18:51', '2025-06-16 01:18:51'),
(1143, 'App\\Models\\UserInvitation', 611, '9573af8e-57c2-464e-9ad7-35ebe3ab2df9', 'qr', '1750025933', '1750025933.png', 'image/png', 'public', 'public', 27766, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:18:53', '2025-06-16 01:18:53'),
(1144, 'App\\Models\\UserInvitation', 611, '3110178a-332c-45f9-9b45-bf48086731eb', 'userInvitation', 'a927c320f526e25a81e025d9cb008c84', 'a927c320f526e25a81e025d9cb008c84.jpg', 'image/jpeg', 'public', 'public', 484686, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:18:53', '2025-06-16 01:18:53'),
(1145, 'App\\Models\\UserInvitation', 612, '25fe9e00-c079-4815-b272-51e0203e425d', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:20:12', '2025-06-16 01:20:12'),
(1146, 'App\\Models\\UserInvitation', 612, 'a75f0f9c-f631-4427-8770-b51e42305171', 'qr', '1750026014', '1750026014.png', 'image/png', 'public', 'public', 26844, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:20:14', '2025-06-16 01:20:14'),
(1147, 'App\\Models\\UserInvitation', 612, 'd5240903-11af-4d06-a9de-f22fdb1bc5d3', 'userInvitation', '5e15713584289c47e29eb4c982c53a0f', '5e15713584289c47e29eb4c982c53a0f.jpg', 'image/jpeg', 'public', 'public', 484133, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:20:14', '2025-06-16 01:20:14'),
(1148, 'App\\Models\\UserInvitation', 613, 'f05b5763-0b24-46aa-bbd1-ddc5d61a8f7e', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:24:04', '2025-06-16 01:24:04'),
(1149, 'App\\Models\\UserInvitation', 613, '83452f4d-f311-4564-ab22-5f3bdb6cc27a', 'qr', '1750026248', '1750026248.png', 'image/png', 'public', 'public', 27968, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:24:08', '2025-06-16 01:24:08'),
(1150, 'App\\Models\\UserInvitation', 613, 'e5eb237c-7c23-427d-b649-293f72c232b0', 'userInvitation', '25b7f58007ad0113e6b67da0c08225d4', '25b7f58007ad0113e6b67da0c08225d4.jpg', 'image/jpeg', 'public', 'public', 485777, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:24:08', '2025-06-16 01:24:08'),
(1151, 'App\\Models\\UserInvitation', 614, '4c371536-3baf-40d3-85f5-4999b70595f1', 'userInvitation', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727', 'pngtree-printable-millimeter-grid-paper-with-color-lines-for-technical-measurement-photo-image_37215658_edit_472272923697727.jpg', 'image/jpeg', 'public', 'public', 594461, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:26:55', '2025-06-16 01:26:55'),
(1152, 'App\\Models\\UserInvitation', 614, 'a328424f-59e7-4369-9016-093f0c3f8852', 'qr', '1750026417', '1750026417.png', 'image/png', 'public', 'public', 27284, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:26:58', '2025-06-16 01:26:58'),
(1153, 'App\\Models\\UserInvitation', 614, '5bf31c83-3a17-4de8-a139-9093e487cc68', 'userInvitation', 'e4bb08b24cbc0e70a5868543fa7ef0d1', 'e4bb08b24cbc0e70a5868543fa7ef0d1.jpg', 'image/jpeg', 'public', 'public', 484604, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:26:58', '2025-06-16 01:26:58'),
(1154, 'App\\Models\\UserInvitation', 615, 'f10b2221-5637-4ef8-82b1-35bc0e65ca08', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:28:34', '2025-06-16 01:28:34'),
(1155, 'App\\Models\\UserInvitation', 615, '92c337f4-0525-4de6-83b9-79fa80614ccf', 'qr', '1750026517', '1750026517.png', 'image/png', 'public', 'public', 27112, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:28:37', '2025-06-16 01:28:37'),
(1156, 'App\\Models\\UserInvitation', 615, '89b19399-7393-4383-85f5-dd72ac3c65df', 'userInvitation', 'e3bbd8b03505f7d69b3ae997620368b2', 'e3bbd8b03505f7d69b3ae997620368b2.jpg', 'image/jpeg', 'public', 'public', 247059, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:28:37', '2025-06-16 01:28:37'),
(1157, 'App\\Models\\UserInvitation', 616, '16478884-ad5e-4976-b0d6-b88b518ace46', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:30:36', '2025-06-16 01:30:36'),
(1158, 'App\\Models\\UserInvitation', 616, 'd8798bd2-c8ae-4293-b4d5-ef981136f516', 'qr', '1750026639', '1750026639.png', 'image/png', 'public', 'public', 27154, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:30:39', '2025-06-16 01:30:39'),
(1159, 'App\\Models\\UserInvitation', 616, '2adf20f3-dd4c-4052-8bce-22e4122fea7c', 'userInvitation', '6e91813afee1d091b99c19bbd24760b8', '6e91813afee1d091b99c19bbd24760b8.jpg', 'image/jpeg', 'public', 'public', 246328, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:30:39', '2025-06-16 01:30:39'),
(1160, 'App\\Models\\UserInvitation', 617, '3d38dd19-2e88-4396-9975-13da2b3aeda0', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:31:42', '2025-06-16 01:31:42'),
(1161, 'App\\Models\\UserInvitation', 617, '5f1e2bcc-af0e-4ec4-9d80-850caa9eee3c', 'qr', '1750026705', '1750026705.png', 'image/png', 'public', 'public', 27223, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:31:45', '2025-06-16 01:31:45'),
(1162, 'App\\Models\\UserInvitation', 617, '20591706-2e88-45e2-a6a2-655b4495f263', 'userInvitation', 'da65d17a77d74b2f94d0560cfc07959e', 'da65d17a77d74b2f94d0560cfc07959e.jpg', 'image/jpeg', 'public', 'public', 247113, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:31:45', '2025-06-16 01:31:45'),
(1163, 'App\\Models\\UserInvitation', 618, 'd895c0bc-03d3-4ee4-800e-92ce91bd891f', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:32:48', '2025-06-16 01:32:48'),
(1164, 'App\\Models\\UserInvitation', 618, 'fe411eba-1df0-454d-8a70-9be159d1b0fa', 'qr', '1750026770', '1750026770.png', 'image/png', 'public', 'public', 27224, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:32:50', '2025-06-16 01:32:50'),
(1165, 'App\\Models\\UserInvitation', 618, '86f6c272-da87-4ad3-bb33-d6941e4f958f', 'userInvitation', 'ac7856e0ef94f0c1e651dee3cb21de11', 'ac7856e0ef94f0c1e651dee3cb21de11.jpg', 'image/jpeg', 'public', 'public', 246749, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:32:50', '2025-06-16 01:32:50'),
(1166, 'App\\Models\\UserInvitation', 619, 'e3f8ac83-45eb-4cd9-a4a3-8c3b0f108c87', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:33:53', '2025-06-16 01:33:53'),
(1167, 'App\\Models\\UserInvitation', 619, '2017c296-a29c-4f0e-afbf-731c0dab4e2b', 'qr', '1750026837', '1750026837.png', 'image/png', 'public', 'public', 27071, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:33:57', '2025-06-16 01:33:57'),
(1168, 'App\\Models\\UserInvitation', 619, 'bca51a82-2a87-4398-80ef-9e910f392d53', 'userInvitation', 'd3b32c28be1c9dc6080f5b576a4c28b5', 'd3b32c28be1c9dc6080f5b576a4c28b5.jpg', 'image/jpeg', 'public', 'public', 246584, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:33:57', '2025-06-16 01:33:57'),
(1169, 'App\\Models\\UserInvitation', 620, '9153a8de-afcd-4f36-aac8-afc8fafa3a99', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:34:53', '2025-06-16 01:34:53'),
(1170, 'App\\Models\\UserInvitation', 620, '96fb214d-b98b-49ba-a4c2-e2454f61c9e4', 'qr', '1750026895', '1750026895.png', 'image/png', 'public', 'public', 27199, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:34:56', '2025-06-16 01:34:56'),
(1171, 'App\\Models\\UserInvitation', 620, 'ff91483b-6997-4930-a5bb-865570c115ca', 'userInvitation', '6045fd3cc35840299725e81032732d9d', '6045fd3cc35840299725e81032732d9d.jpg', 'image/jpeg', 'public', 'public', 246430, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:34:56', '2025-06-16 01:34:56'),
(1172, 'App\\Models\\UserInvitation', 621, '95666aee-0fee-46e4-b65a-310eac0f9087', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:35:55', '2025-06-16 01:35:55'),
(1173, 'App\\Models\\UserInvitation', 621, '993853a8-3339-4d25-963c-e51f95138af1', 'qr', '1750026957', '1750026957.png', 'image/png', 'public', 'public', 27238, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:35:57', '2025-06-16 01:35:57'),
(1174, 'App\\Models\\UserInvitation', 621, '945b6ee5-219c-4447-91b1-c6106d66e040', 'userInvitation', '3e5a8c982c3929250307ac2b72347120', '3e5a8c982c3929250307ac2b72347120.jpg', 'image/jpeg', 'public', 'public', 246639, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:35:57', '2025-06-16 01:35:57'),
(1175, 'App\\Models\\UserInvitation', 622, 'a993aa9e-9a63-429c-a7ca-a07325718d0a', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:36:51', '2025-06-16 01:36:51'),
(1176, 'App\\Models\\UserInvitation', 622, '04dd8926-bda2-4f5b-8389-faf52012d9be', 'qr', '1750027014', '1750027014.png', 'image/png', 'public', 'public', 27175, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:36:54', '2025-06-16 01:36:54'),
(1177, 'App\\Models\\UserInvitation', 622, '63782fb4-3425-4e77-9452-4d753e03ed80', 'userInvitation', '382de90fb58e0a1fc81f9e497f9baee7', '382de90fb58e0a1fc81f9e497f9baee7.jpg', 'image/jpeg', 'public', 'public', 248275, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:36:54', '2025-06-16 01:36:54'),
(1178, 'App\\Models\\UserInvitation', 623, '81aea624-8f59-4645-8953-4791d826434f', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:38:04', '2025-06-16 01:38:04'),
(1179, 'App\\Models\\UserInvitation', 623, '52ec9175-860d-4c38-b0cb-85de5b7cc53c', 'qr', '1750027086', '1750027086.png', 'image/png', 'public', 'public', 27171, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:38:06', '2025-06-16 01:38:06'),
(1180, 'App\\Models\\UserInvitation', 623, 'cfa550ee-5e69-4126-8732-2d586b62d958', 'userInvitation', 'a0dbe51e1510b2ac5e4f96eb8c093368', 'a0dbe51e1510b2ac5e4f96eb8c093368.jpg', 'image/jpeg', 'public', 'public', 247254, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:38:06', '2025-06-16 01:38:06'),
(1181, 'App\\Models\\UserInvitation', 624, 'c735d5eb-f14a-4101-a9cf-a295b54a2f0c', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:39:55', '2025-06-16 01:39:55'),
(1182, 'App\\Models\\UserInvitation', 624, '314cc07e-b6f6-4862-83ac-fe3c48cfe051', 'qr', '1750027198', '1750027198.png', 'image/png', 'public', 'public', 27213, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:39:58', '2025-06-16 01:39:58'),
(1183, 'App\\Models\\UserInvitation', 624, 'a26ba4b1-0a2f-4c8b-8fc4-4ed012da584e', 'userInvitation', '5aea4ca93fd24e4fedd7d43c91b74d06', '5aea4ca93fd24e4fedd7d43c91b74d06.jpg', 'image/jpeg', 'public', 'public', 247279, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:39:58', '2025-06-16 01:39:58'),
(1184, 'App\\Models\\UserInvitation', 625, '871b851e-6b05-4b13-9356-3af7f4dffcf0', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:41:15', '2025-06-16 01:41:15'),
(1185, 'App\\Models\\UserInvitation', 625, 'd6514496-3b37-4c20-b3aa-7b44867098c5', 'qr', '1750027278', '1750027278.png', 'image/png', 'public', 'public', 27367, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:41:18', '2025-06-16 01:41:18'),
(1186, 'App\\Models\\UserInvitation', 625, 'f3b79fd4-4611-49d5-8eec-a8aaca50bc59', 'userInvitation', '2609f6353ad349f4ee00ff9900e16cad', '2609f6353ad349f4ee00ff9900e16cad.jpg', 'image/jpeg', 'public', 'public', 247254, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:41:18', '2025-06-16 01:41:18'),
(1187, 'App\\Models\\UserInvitation', 626, '680b0bd9-8fc3-41d2-84f6-8265ed1d4fc7', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:44:01', '2025-06-16 01:44:01'),
(1188, 'App\\Models\\UserInvitation', 626, 'f25452e7-a1f1-4842-9cae-6dc33cdaf318', 'qr', '1750027444', '1750027444.png', 'image/png', 'public', 'public', 27088, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:44:04', '2025-06-16 01:44:04'),
(1189, 'App\\Models\\UserInvitation', 626, 'a56a3148-58ab-404e-9dc8-f340bae8c2e7', 'userInvitation', 'ba745fc0ee6733ef4ea482a6606c87b3', 'ba745fc0ee6733ef4ea482a6606c87b3.jpg', 'image/jpeg', 'public', 'public', 247254, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:44:04', '2025-06-16 01:44:04'),
(1190, 'App\\Models\\UserInvitation', 627, '4ca97bdd-83f7-4b95-b0f2-36dc066b8da8', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:46:08', '2025-06-16 01:46:08'),
(1191, 'App\\Models\\UserInvitation', 627, '654af894-d1ab-4840-bbcb-b64e22d7f49a', 'qr', '1750027571', '1750027571.png', 'image/png', 'public', 'public', 27160, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:46:11', '2025-06-16 01:46:11'),
(1192, 'App\\Models\\UserInvitation', 627, 'd53b0ae6-ce12-47fa-b15b-e5d90250b86d', 'userInvitation', '9ef7f93ea9222ad1938c9c6a7a55b522', '9ef7f93ea9222ad1938c9c6a7a55b522.jpg', 'image/jpeg', 'public', 'public', 247254, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:46:11', '2025-06-16 01:46:11'),
(1193, 'App\\Models\\UserInvitation', 628, '82a01501-5b75-4936-a508-47fb942a802e', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:47:35', '2025-06-16 01:47:35'),
(1194, 'App\\Models\\UserInvitation', 628, 'ec5f3d33-035f-4683-af72-b057004538ad', 'qr', '1750027658', '1750027658.png', 'image/png', 'public', 'public', 27153, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:47:38', '2025-06-16 01:47:38'),
(1195, 'App\\Models\\UserInvitation', 628, 'd01ff587-eb86-4c29-8b20-865e37a6286c', 'userInvitation', '52379f5ef94ac08e284209d01241cb39', '52379f5ef94ac08e284209d01241cb39.jpg', 'image/jpeg', 'public', 'public', 244555, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:47:38', '2025-06-16 01:47:38'),
(1196, 'App\\Models\\UserInvitation', 629, '6c36236a-94af-4c8c-874f-151db8237e99', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:49:21', '2025-06-16 01:49:21'),
(1197, 'App\\Models\\UserInvitation', 629, 'a94ac5e7-a435-4de1-a1c2-bb807751b25b', 'qr', '1750027763', '1750027763.png', 'image/png', 'public', 'public', 27227, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:49:23', '2025-06-16 01:49:23'),
(1198, 'App\\Models\\UserInvitation', 629, '47ea7f9a-ca7a-45a8-bad5-ee7e37620859', 'userInvitation', 'b6837fd94becf6890550a5fc08d0b987', 'b6837fd94becf6890550a5fc08d0b987.jpg', 'image/jpeg', 'public', 'public', 253716, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:49:23', '2025-06-16 01:49:23'),
(1199, 'App\\Models\\UserInvitation', 630, 'be56be4f-e849-4d58-bb0a-94c6c24c219e', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:51:06', '2025-06-16 01:51:06'),
(1200, 'App\\Models\\UserInvitation', 630, '71fe36ff-667d-49e4-86a9-cd1a138e4340', 'qr', '1750027869', '1750027869.png', 'image/png', 'public', 'public', 28159, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:51:09', '2025-06-16 01:51:09'),
(1201, 'App\\Models\\UserInvitation', 630, '5e403026-7b23-4d73-8eee-b548ca009bef', 'userInvitation', 'a7a28edcb48b6664ec1282ada94d4301', 'a7a28edcb48b6664ec1282ada94d4301.jpg', 'image/jpeg', 'public', 'public', 263123, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:51:09', '2025-06-16 01:51:09'),
(1202, 'App\\Models\\UserInvitation', 631, '257d2d0f-f822-45af-860d-af61d6f74bb7', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:52:16', '2025-06-16 01:52:16'),
(1203, 'App\\Models\\UserInvitation', 631, 'b3ff9aa5-0c68-4c7c-9fd9-62bef6cd0bb0', 'qr', '1750027939', '1750027939.png', 'image/png', 'public', 'public', 27177, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:52:19', '2025-06-16 01:52:19'),
(1204, 'App\\Models\\UserInvitation', 631, '690dd380-0679-483a-a3c1-be742cead9ce', 'userInvitation', 'b9633677194bf239b862eb892006cfb6', 'b9633677194bf239b862eb892006cfb6.jpg', 'image/jpeg', 'public', 'public', 254155, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:52:19', '2025-06-16 01:52:19'),
(1205, 'App\\Models\\UserInvitation', 632, '85801b5d-51a8-407d-a6b5-8c4d27162ccb', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:54:41', '2025-06-16 01:54:41'),
(1206, 'App\\Models\\UserInvitation', 632, '839a141a-44ec-4ced-93d4-499898d823b2', 'qr', '1750028083', '1750028083.png', 'image/png', 'public', 'public', 27151, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:54:43', '2025-06-16 01:54:43'),
(1207, 'App\\Models\\UserInvitation', 632, '7060df8b-85f9-42c2-948a-c3290a5e1121', 'userInvitation', '37dd5364457713ebd75738c24cbcaeb7', '37dd5364457713ebd75738c24cbcaeb7.jpg', 'image/jpeg', 'public', 'public', 254154, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:54:44', '2025-06-16 01:54:44'),
(1208, 'App\\Models\\UserInvitation', 633, '2c273d5c-c634-4fd1-8aea-1a2e640c0377', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:56:04', '2025-06-16 01:56:04'),
(1209, 'App\\Models\\UserInvitation', 633, '424073e9-0639-4277-b6e0-2d68e91915a9', 'qr', '1750028167', '1750028167.png', 'image/png', 'public', 'public', 27162, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:56:07', '2025-06-16 01:56:07'),
(1210, 'App\\Models\\UserInvitation', 633, 'ac161a40-c7ee-4a23-94db-0e0d9464a263', 'userInvitation', 'b650fb6c4db4a5cebcb6d946ed3a5947', 'b650fb6c4db4a5cebcb6d946ed3a5947.jpg', 'image/jpeg', 'public', 'public', 253632, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:56:07', '2025-06-16 01:56:07'),
(1211, 'App\\Models\\UserInvitation', 634, 'efc67c74-820a-4fef-ac60-4f506c3604e3', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 01:58:26', '2025-06-16 01:58:26'),
(1212, 'App\\Models\\UserInvitation', 634, '107d8b7c-c3a3-442f-b1da-74e5b0dc7a5e', 'qr', '1750028309', '1750028309.png', 'image/png', 'public', 'public', 27284, '[]', '[]', '[]', '[]', 2, '2025-06-16 01:58:29', '2025-06-16 01:58:29'),
(1213, 'App\\Models\\UserInvitation', 634, 'a579d9d5-1df6-4de0-a4b2-58f58aed26dd', 'userInvitation', 'de8b56280c68b6c40b0dccfce6c84d54', 'de8b56280c68b6c40b0dccfce6c84d54.jpg', 'image/jpeg', 'public', 'public', 244555, '[]', '[]', '[]', '[]', 3, '2025-06-16 01:58:29', '2025-06-16 01:58:29'),
(1214, 'App\\Models\\UserInvitation', 635, '70fda03b-9748-464e-a428-4b77edbf60f7', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:01:37', '2025-06-16 02:01:37'),
(1215, 'App\\Models\\UserInvitation', 636, '230a2576-e836-4cbb-b496-2d2d38f3cf4a', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:01:40', '2025-06-16 02:01:40'),
(1216, 'App\\Models\\UserInvitation', 636, '7c57ae9f-7cd6-4bde-bd42-45c2e6276025', 'qr', '1750028500', '1750028500.png', 'image/png', 'public', 'public', 27279, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:01:40', '2025-06-16 02:01:40'),
(1217, 'App\\Models\\UserInvitation', 636, '4c3ebb2b-e420-40e8-a030-df6997f3c0a1', 'qr', '1750028502', '1750028502.png', 'image/png', 'public', 'public', 27153, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:01:42', '2025-06-16 02:01:42'),
(1218, 'App\\Models\\UserInvitation', 637, 'abb9b943-1d22-45e5-92d4-6eb8ef2a96c0', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:04:24', '2025-06-16 02:04:24'),
(1219, 'App\\Models\\UserInvitation', 637, '6c978d62-c672-468c-9ada-9979580d5bfa', 'qr', '1750028666', '1750028666.png', 'image/png', 'public', 'public', 27164, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:04:26', '2025-06-16 02:04:26'),
(1220, 'App\\Models\\UserInvitation', 637, '8fc13ad2-59da-414a-b8b1-dc089a9dd6c6', 'userInvitation', 'c03aedd2f09ed076eb064ced2efdd7de', 'c03aedd2f09ed076eb064ced2efdd7de.jpg', 'image/jpeg', 'public', 'public', 282382, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:04:26', '2025-06-16 02:04:26'),
(1221, 'App\\Models\\UserInvitation', 638, '8bad3148-3b08-40a5-844e-8766ee80de83', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:04:28', '2025-06-16 02:04:28'),
(1222, 'App\\Models\\UserInvitation', 639, '16a95bb7-d34c-4628-97d3-e6bdc94f0ba9', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:05:16', '2025-06-16 02:05:16'),
(1223, 'App\\Models\\UserInvitation', 639, '230f96af-8a58-4c28-8dee-a199db9d37fe', 'qr', '1750028721', '1750028721.png', 'image/png', 'public', 'public', 27186, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:05:21', '2025-06-16 02:05:21'),
(1224, 'App\\Models\\UserInvitation', 639, '8c22b319-af55-48ad-a0ad-42bba5eed892', 'userInvitation', '2f8f81ce94be5f1df7ee7d5798c2da82', '2f8f81ce94be5f1df7ee7d5798c2da82.jpg', 'image/jpeg', 'public', 'public', 253342, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:05:21', '2025-06-16 02:05:21'),
(1225, 'App\\Models\\UserInvitation', 640, '5586be00-f927-42a4-b8f2-3504e32e5118', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:06:59', '2025-06-16 02:06:59'),
(1226, 'App\\Models\\UserInvitation', 640, 'dc7bfc52-f428-4fc1-9c68-581c73bacb43', 'qr', '1750028824', '1750028824.png', 'image/png', 'public', 'public', 27108, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:07:04', '2025-06-16 02:07:04'),
(1227, 'App\\Models\\UserInvitation', 640, '9808833f-ac41-4edd-9425-f2ba4b78701a', 'userInvitation', '63e0fcb5a92c5dc35442dcbc90f7bf91', '63e0fcb5a92c5dc35442dcbc90f7bf91.jpg', 'image/jpeg', 'public', 'public', 253860, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:07:05', '2025-06-16 02:07:05'),
(1228, 'App\\Models\\UserInvitation', 641, '1376fb74-053c-4b99-8cb0-34b7bc8f82cf', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:08:25', '2025-06-16 02:08:25'),
(1229, 'App\\Models\\UserInvitation', 641, '22c5cdc0-4527-42d5-b4c0-c8b4b575be37', 'qr', '1750028908', '1750028908.png', 'image/png', 'public', 'public', 27244, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:08:28', '2025-06-16 02:08:28'),
(1230, 'App\\Models\\UserInvitation', 641, 'bebe69a6-1934-4304-a560-16cab45b47c9', 'userInvitation', '253752452dd9877263f78021ef89d2c8', '253752452dd9877263f78021ef89d2c8.jpg', 'image/jpeg', 'public', 'public', 254485, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:08:28', '2025-06-16 02:08:28'),
(1231, 'App\\Models\\UserInvitation', 642, '2edf7665-f09c-4099-b78b-c0716ce84eeb', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:09:43', '2025-06-16 02:09:43'),
(1232, 'App\\Models\\UserInvitation', 642, '97a80b5d-5c41-47a5-a558-dbb0da1934d5', 'qr', '1750028986', '1750028986.png', 'image/png', 'public', 'public', 27239, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:09:46', '2025-06-16 02:09:46'),
(1233, 'App\\Models\\UserInvitation', 642, 'bc3eb948-5095-42ce-933e-b271a9c8caaf', 'userInvitation', '6a9b3a89ed18c5da0dbe350aab612d0f', '6a9b3a89ed18c5da0dbe350aab612d0f.jpg', 'image/jpeg', 'public', 'public', 244555, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:09:46', '2025-06-16 02:09:46'),
(1234, 'App\\Models\\UserInvitation', 643, 'ac76419a-80c3-4892-b451-efec877bb03c', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:10:45', '2025-06-16 02:10:45'),
(1235, 'App\\Models\\UserInvitation', 643, '8dbffbb2-4999-43b8-934b-0e74a8cd10a4', 'qr', '1750029049', '1750029049.png', 'image/png', 'public', 'public', 27264, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:10:49', '2025-06-16 02:10:49'),
(1236, 'App\\Models\\UserInvitation', 643, '8050ea95-5f39-44a9-b0bb-cfa756b135c8', 'userInvitation', '5b5d5e7c1264ca3e56805e334ecdad7c', '5b5d5e7c1264ca3e56805e334ecdad7c.jpg', 'image/jpeg', 'public', 'public', 244555, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:10:49', '2025-06-16 02:10:49'),
(1237, 'App\\Models\\UserInvitation', 644, 'ea0e25f1-1993-4104-b8fd-b0fb372cc097', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:11:45', '2025-06-16 02:11:45'),
(1238, 'App\\Models\\UserInvitation', 644, '68c68f6a-9f47-49a2-9886-8539f14081db', 'qr', '1750029109', '1750029109.png', 'image/png', 'public', 'public', 27281, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:11:49', '2025-06-16 02:11:49'),
(1239, 'App\\Models\\UserInvitation', 644, 'de12118c-e9c0-4710-8533-7f9b1221864b', 'userInvitation', '47b388b3c24aabcf89f4657638052382', '47b388b3c24aabcf89f4657638052382.jpg', 'image/jpeg', 'public', 'public', 244555, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:11:49', '2025-06-16 02:11:49'),
(1240, 'App\\Models\\UserInvitation', 645, '3b6ca211-b9f1-4c6c-9f14-57afafcb2606', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:12:48', '2025-06-16 02:12:48'),
(1241, 'App\\Models\\UserInvitation', 645, '6a409c07-4f75-4913-b23c-e353ea84da7b', 'qr', '1750029172', '1750029172.png', 'image/png', 'public', 'public', 27021, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:12:52', '2025-06-16 02:12:52'),
(1242, 'App\\Models\\UserInvitation', 645, 'aab06e44-67c5-4c2d-800b-10e533ac392b', 'userInvitation', '1487aa06338c260786cef59f99c763da', '1487aa06338c260786cef59f99c763da.jpg', 'image/jpeg', 'public', 'public', 254259, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:12:52', '2025-06-16 02:12:52'),
(1243, 'App\\Models\\UserInvitation', 646, '62e89b81-adfc-4b2a-a7b4-6e5646e23ab4', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:14:17', '2025-06-16 02:14:17'),
(1244, 'App\\Models\\UserInvitation', 646, '18a45d8e-83f3-4760-ae61-d4ec6c18d9cc', 'qr', '1750029267', '1750029267.png', 'image/png', 'public', 'public', 27169, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:14:27', '2025-06-16 02:14:27'),
(1245, 'App\\Models\\UserInvitation', 646, '50987192-08ff-43b9-94b9-a869d71468f4', 'userInvitation', '26ace2b7d36daa51ab956204ddf8642f', '26ace2b7d36daa51ab956204ddf8642f.jpg', 'image/jpeg', 'public', 'public', 254178, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:14:28', '2025-06-16 02:14:28'),
(1246, 'App\\Models\\UserInvitation', 647, 'eebfbe5d-0535-45ff-abe7-3e533f41e068', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:15:42', '2025-06-16 02:15:42'),
(1247, 'App\\Models\\UserInvitation', 647, '90669b52-3da9-4203-b7da-bae6cb96a904', 'qr', '1750029345', '1750029345.png', 'image/png', 'public', 'public', 27197, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:15:45', '2025-06-16 02:15:45'),
(1248, 'App\\Models\\UserInvitation', 647, 'b09dedc8-6022-4b8e-80ac-27bee58dec8d', 'userInvitation', '506cd93505b4ad84369e5a61d3f7478b', '506cd93505b4ad84369e5a61d3f7478b.jpg', 'image/jpeg', 'public', 'public', 255557, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:15:46', '2025-06-16 02:15:46'),
(1249, 'App\\Models\\UserInvitation', 648, '3fadc998-b03d-4af1-9d5d-156067a7c629', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:19:20', '2025-06-16 02:19:20'),
(1250, 'App\\Models\\UserInvitation', 648, '6da674cf-aac8-4a6d-8664-49b86e240d9f', 'qr', '1750029564', '1750029564.png', 'image/png', 'public', 'public', 27149, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:19:24', '2025-06-16 02:19:24'),
(1251, 'App\\Models\\UserInvitation', 648, 'fad5b15c-b64a-446f-b762-c683ebf2fe96', 'userInvitation', '790ed8e002b6d54bdf8c16261869d9ad', '790ed8e002b6d54bdf8c16261869d9ad.jpg', 'image/jpeg', 'public', 'public', 254149, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:19:24', '2025-06-16 02:19:24'),
(1252, 'App\\Models\\UserInvitation', 649, '4315506c-032e-4398-9e3a-d3dfd5fd5985', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:20:54', '2025-06-16 02:20:54'),
(1253, 'App\\Models\\UserInvitation', 649, '7c7ba455-7d63-4d74-a5ff-eb8ff473ba54', 'qr', '1750029657', '1750029657.png', 'image/png', 'public', 'public', 27023, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:20:57', '2025-06-16 02:20:57'),
(1254, 'App\\Models\\UserInvitation', 649, '2d112b54-532c-4d2f-95fd-ba7339b58603', 'userInvitation', '7cd76a0fab009619aefcb05a9ba115f5', '7cd76a0fab009619aefcb05a9ba115f5.jpg', 'image/jpeg', 'public', 'public', 254295, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:20:57', '2025-06-16 02:20:57'),
(1255, 'App\\Models\\UserInvitation', 650, '575abdfe-1806-43cf-beba-69a061ea6b76', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:24:03', '2025-06-16 02:24:03'),
(1256, 'App\\Models\\UserInvitation', 650, 'd891cf0f-020e-4495-b858-fdc42a3a076a', 'qr', '1750029846', '1750029846.png', 'image/png', 'public', 'public', 27120, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:24:06', '2025-06-16 02:24:06'),
(1257, 'App\\Models\\UserInvitation', 650, '2920ea9a-13ea-428d-a67e-0d320d84ad09', 'userInvitation', '8b8b04312f0b7a645efbf53990361e67', '8b8b04312f0b7a645efbf53990361e67.jpg', 'image/jpeg', 'public', 'public', 255071, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:24:06', '2025-06-16 02:24:06'),
(1258, 'App\\Models\\UserInvitation', 651, '627166bf-ae7b-4274-886b-12fc422ee67e', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:26:38', '2025-06-16 02:26:38'),
(1259, 'App\\Models\\UserInvitation', 651, 'e04966e6-b001-46af-8d30-b7c5004ebf75', 'qr', '1750030000', '1750030000.png', 'image/png', 'public', 'public', 27061, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:26:40', '2025-06-16 02:26:40'),
(1260, 'App\\Models\\UserInvitation', 651, '8743e835-b753-4e5d-ae36-95851185546f', 'userInvitation', 'fce0db54f11985cf70bc8ab91f7336ff', 'fce0db54f11985cf70bc8ab91f7336ff.jpg', 'image/jpeg', 'public', 'public', 246100, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:26:41', '2025-06-16 02:26:41'),
(1261, 'App\\Models\\UserInvitation', 652, '4167a71d-5386-4d7c-bb54-56f3110ca8ec', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:44:37', '2025-06-16 02:44:37'),
(1262, 'App\\Models\\UserInvitation', 652, 'cd1d4014-26dc-46ff-8497-6530a4677400', 'qr', '1750031082', '1750031082.png', 'image/png', 'public', 'public', 27314, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:44:42', '2025-06-16 02:44:42'),
(1263, 'App\\Models\\UserInvitation', 652, 'b377d10d-9cba-408d-acb1-4e70d14473ff', 'userInvitation', '1a0e71475338ec2526ed0118061d4004', '1a0e71475338ec2526ed0118061d4004.jpg', 'image/jpeg', 'public', 'public', 250615, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:44:42', '2025-06-16 02:44:42'),
(1264, 'App\\Models\\UserInvitation', 653, '59da4938-f631-426c-aca0-8655856137fa', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:45:44', '2025-06-16 02:45:44'),
(1265, 'App\\Models\\UserInvitation', 653, '056cd81e-eb7b-406d-abd7-02d7d71ea83b', 'qr', '1750031146', '1750031146.png', 'image/png', 'public', 'public', 27312, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:45:46', '2025-06-16 02:45:46'),
(1266, 'App\\Models\\UserInvitation', 653, 'e32d39cb-1233-49d7-9843-cdb67d2ac155', 'userInvitation', '1b0cf12b3e961c6d5c19f258c362f2a4', '1b0cf12b3e961c6d5c19f258c362f2a4.jpg', 'image/jpeg', 'public', 'public', 250711, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:45:46', '2025-06-16 02:45:46'),
(1267, 'App\\Models\\UserInvitation', 654, '0c9df007-5313-4a83-a15d-1cc817b848ee', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:50:42', '2025-06-16 02:50:42'),
(1268, 'App\\Models\\UserInvitation', 654, '5918c956-e480-43f7-9f58-fce1e2cb480e', 'qr', '1750031445', '1750031445.png', 'image/png', 'public', 'public', 27189, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:50:45', '2025-06-16 02:50:45');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1269, 'App\\Models\\UserInvitation', 654, '690b63d5-0448-4774-ad0f-742628cd1834', 'userInvitation', 'bc40a44cd3858e5f93608edd0a1942bb', 'bc40a44cd3858e5f93608edd0a1942bb.jpg', 'image/jpeg', 'public', 'public', 249930, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:50:45', '2025-06-16 02:50:45'),
(1270, 'App\\Models\\UserInvitation', 655, 'ed90f91b-10bb-4d34-be83-cb03420f7f35', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:53:15', '2025-06-16 02:53:15'),
(1271, 'App\\Models\\UserInvitation', 655, '7c536bf0-3f30-4d69-8c45-0de3b926832f', 'qr', '1750031598', '1750031598.png', 'image/png', 'public', 'public', 27260, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:53:18', '2025-06-16 02:53:18'),
(1272, 'App\\Models\\UserInvitation', 655, '95a2eed6-4953-47b1-a714-1bf35e5bd3d2', 'userInvitation', '7795bf078468fde7c4d9bfb1c550cc69', '7795bf078468fde7c4d9bfb1c550cc69.jpg', 'image/jpeg', 'public', 'public', 253863, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:53:18', '2025-06-16 02:53:18'),
(1273, 'App\\Models\\UserInvitation', 656, '05f2c586-c473-4a6f-9f52-8814924ee3ab', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:59:16', '2025-06-16 02:59:16'),
(1274, 'App\\Models\\UserInvitation', 656, 'dda41cd6-6cfe-4570-aeab-00bc8b295473', 'qr', '1750031961', '1750031961.png', 'image/png', 'public', 'public', 27299, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:59:21', '2025-06-16 02:59:21'),
(1275, 'App\\Models\\UserInvitation', 656, '5f14aeca-024d-463a-adcf-fa6c08132381', 'userInvitation', '22930d8e6809ae770277a6e6840a3cb5', '22930d8e6809ae770277a6e6840a3cb5.jpg', 'image/jpeg', 'public', 'public', 255044, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:59:21', '2025-06-16 02:59:21'),
(1276, 'App\\Models\\UserInvitation', 657, 'bb59aefc-7e16-49a6-971c-0fabe0647b2b', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 02:59:54', '2025-06-16 02:59:54'),
(1277, 'App\\Models\\UserInvitation', 657, 'c0035a1c-73f0-4be7-aa8a-348d61006f29', 'qr', '1750031999', '1750031999.png', 'image/png', 'public', 'public', 26939, '[]', '[]', '[]', '[]', 2, '2025-06-16 02:59:59', '2025-06-16 02:59:59'),
(1278, 'App\\Models\\UserInvitation', 657, 'd2fe6b61-1d23-484f-a9b2-d1f5d051ece1', 'userInvitation', '8a4c5e36c33ad9a3f5bfd9803a2dd311', '8a4c5e36c33ad9a3f5bfd9803a2dd311.jpg', 'image/jpeg', 'public', 'public', 250833, '[]', '[]', '[]', '[]', 3, '2025-06-16 02:59:59', '2025-06-16 02:59:59'),
(1279, 'App\\Models\\UserInvitation', 658, 'bc070cbc-c22e-4e6a-a276-7070b892907f', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 03:01:51', '2025-06-16 03:01:51'),
(1280, 'App\\Models\\UserInvitation', 658, '66e0f681-3bc5-47b6-b5c3-e8a1a367f2f1', 'qr', '1750032114', '1750032114.png', 'image/png', 'public', 'public', 27382, '[]', '[]', '[]', '[]', 2, '2025-06-16 03:01:54', '2025-06-16 03:01:54'),
(1281, 'App\\Models\\UserInvitation', 658, 'cc0bfa8f-04c3-40b0-92ec-7df7ad16cd4e', 'userInvitation', 'e4b637e7950e360df1be812ee294dc7c', 'e4b637e7950e360df1be812ee294dc7c.jpg', 'image/jpeg', 'public', 'public', 255258, '[]', '[]', '[]', '[]', 3, '2025-06-16 03:01:54', '2025-06-16 03:01:54'),
(1282, 'App\\Models\\UserInvitation', 659, '59e6d66f-150f-423b-913c-92935c84cb42', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 03:02:42', '2025-06-16 03:02:42'),
(1283, 'App\\Models\\UserInvitation', 659, '4c1ca757-03aa-49ae-9a2d-4ed390b822df', 'qr', '1750032165', '1750032165.png', 'image/png', 'public', 'public', 26732, '[]', '[]', '[]', '[]', 2, '2025-06-16 03:02:45', '2025-06-16 03:02:45'),
(1284, 'App\\Models\\UserInvitation', 659, 'b2f5cbe9-281e-42a3-a554-e9e204ec4a31', 'userInvitation', '0c53ebff662cbc817d5f240e161692aa', '0c53ebff662cbc817d5f240e161692aa.jpg', 'image/jpeg', 'public', 'public', 250650, '[]', '[]', '[]', '[]', 3, '2025-06-16 03:02:45', '2025-06-16 03:02:45'),
(1285, 'App\\Models\\UserInvitation', 660, '7ed81fe5-3ab0-48be-b59d-aca450cede44', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 03:05:26', '2025-06-16 03:05:26'),
(1286, 'App\\Models\\UserInvitation', 660, '5164cc26-28cb-4edf-b50b-5536bfefaba9', 'qr', '1750032329', '1750032329.png', 'image/png', 'public', 'public', 27182, '[]', '[]', '[]', '[]', 2, '2025-06-16 03:05:29', '2025-06-16 03:05:29'),
(1287, 'App\\Models\\UserInvitation', 660, '09104503-f782-4621-b1c2-f02d75b24fcf', 'userInvitation', '58e8007f4c2e13b7824dac108b65b474', '58e8007f4c2e13b7824dac108b65b474.jpg', 'image/jpeg', 'public', 'public', 251540, '[]', '[]', '[]', '[]', 3, '2025-06-16 03:05:29', '2025-06-16 03:05:29'),
(1288, 'App\\Models\\UserInvitation', 661, 'ab85a271-3196-4e8b-adc6-f6633c8b7125', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 03:06:52', '2025-06-16 03:06:52'),
(1289, 'App\\Models\\UserInvitation', 661, 'aa390d3b-cf19-4b9d-a101-eb861d93dfde', 'qr', '1750032416', '1750032416.png', 'image/png', 'public', 'public', 27135, '[]', '[]', '[]', '[]', 2, '2025-06-16 03:06:57', '2025-06-16 03:06:57'),
(1290, 'App\\Models\\UserInvitation', 661, '82a93784-4ca4-4658-addd-0602e3b70fc1', 'userInvitation', '09907ec7917f529528754d56da6606f9', '09907ec7917f529528754d56da6606f9.jpg', 'image/jpeg', 'public', 'public', 260591, '[]', '[]', '[]', '[]', 3, '2025-06-16 03:06:57', '2025-06-16 03:06:57'),
(1291, 'App\\Models\\UserInvitation', 662, '8afe5e57-4720-4c4b-8c03-450ac375d730', 'userInvitation', 'inv', 'inv.jpg', 'image/jpeg', 'public', 'public', 18101, '[]', '[]', '[]', '[]', 1, '2025-06-16 03:56:21', '2025-06-16 03:56:21'),
(1292, 'App\\Models\\UserInvitation', 662, 'f5b80905-c75d-484e-ae7e-1e0eed43beac', 'qr', '1750035386', '1750035386.png', 'image/png', 'public', 'public', 32644, '[]', '[]', '[]', '[]', 2, '2025-06-16 03:56:26', '2025-06-16 03:56:26'),
(1293, 'App\\Models\\UserInvitation', 662, '9f5d8d51-1a2d-419d-90c6-a76fe46f346c', 'userInvitation', 'd7199d1dbaa7d4c6a5a5fe522757e51f', 'd7199d1dbaa7d4c6a5a5fe522757e51f.jpg', 'image/jpeg', 'public', 'public', 64703, '[]', '[]', '[]', '[]', 3, '2025-06-16 03:56:26', '2025-06-16 03:56:26'),
(1294, 'App\\Models\\UserInvitation', 663, 'a096138c-bc96-4042-9439-9aca359d0100', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 19:48:39', '2025-06-16 19:48:39'),
(1295, 'App\\Models\\UserInvitation', 663, '7de9f741-949f-42a4-a1a2-a87ea5df8512', 'qr', '1750092523', '1750092523.png', 'image/png', 'public', 'public', 27221, '[]', '[]', '[]', '[]', 2, '2025-06-16 19:48:43', '2025-06-16 19:48:43'),
(1296, 'App\\Models\\UserInvitation', 663, '000fdab7-15ae-438e-b547-e8cf29bf1ad6', 'userInvitation', 'ec7471fff14a6d70ca3a2b26c1780226', 'ec7471fff14a6d70ca3a2b26c1780226.jpg', 'image/jpeg', 'public', 'public', 250509, '[]', '[]', '[]', '[]', 3, '2025-06-16 19:48:43', '2025-06-16 19:48:43'),
(1297, 'App\\Models\\UserInvitation', 664, '0d59d76b-2999-40a0-bb47-1477669bb4e7', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 19:50:44', '2025-06-16 19:50:44'),
(1298, 'App\\Models\\UserInvitation', 664, '52ecc4cc-cafa-48df-8937-4f0322d0c0db', 'qr', '1750092647', '1750092647.png', 'image/png', 'public', 'public', 27309, '[]', '[]', '[]', '[]', 2, '2025-06-16 19:50:47', '2025-06-16 19:50:47'),
(1299, 'App\\Models\\UserInvitation', 664, '286aa3ab-874b-46c2-bba9-9cca7e42f45f', 'userInvitation', '2fbfced133e9b8d60a7d92e94d8b6ff0', '2fbfced133e9b8d60a7d92e94d8b6ff0.jpg', 'image/jpeg', 'public', 'public', 251735, '[]', '[]', '[]', '[]', 3, '2025-06-16 19:50:47', '2025-06-16 19:50:47'),
(1300, 'App\\Models\\UserInvitation', 665, 'e3a87fac-6b53-435a-a02f-a196dd17b8b8', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 19:52:38', '2025-06-16 19:52:38'),
(1301, 'App\\Models\\UserInvitation', 665, '535299d1-a2a7-4549-85fc-7024a385c7dc', 'qr', '1750092762', '1750092762.png', 'image/png', 'public', 'public', 27243, '[]', '[]', '[]', '[]', 2, '2025-06-16 19:52:42', '2025-06-16 19:52:42'),
(1302, 'App\\Models\\UserInvitation', 665, '4b640d77-ef15-40e8-b338-3732a2db3237', 'userInvitation', '53ddd9d8e9f8e6a79f0357d5291392dc', '53ddd9d8e9f8e6a79f0357d5291392dc.jpg', 'image/jpeg', 'public', 'public', 251147, '[]', '[]', '[]', '[]', 3, '2025-06-16 19:52:42', '2025-06-16 19:52:42'),
(1303, 'App\\Models\\UserInvitation', 666, 'a754337b-184b-4f2d-8d7a-5b435b8ceed9', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 19:53:43', '2025-06-16 19:53:43'),
(1304, 'App\\Models\\UserInvitation', 666, '6aa5f471-6f17-49a3-b4c2-28a9f7ef6fcc', 'qr', '1750092826', '1750092826.png', 'image/png', 'public', 'public', 27242, '[]', '[]', '[]', '[]', 2, '2025-06-16 19:53:46', '2025-06-16 19:53:46'),
(1305, 'App\\Models\\UserInvitation', 666, '15101b97-5b65-4d61-a5fa-7196dd2006c5', 'userInvitation', 'f7c9f7688ca20a86885815ed8f2ac45b', 'f7c9f7688ca20a86885815ed8f2ac45b.jpg', 'image/jpeg', 'public', 'public', 251608, '[]', '[]', '[]', '[]', 3, '2025-06-16 19:53:46', '2025-06-16 19:53:46'),
(1306, 'App\\Models\\UserInvitation', 667, 'fe818537-99c7-4413-bade-8faf6cdf456e', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 19:54:25', '2025-06-16 19:54:25'),
(1307, 'App\\Models\\UserInvitation', 667, '87d25789-12dc-4898-8d3c-c5728a0ea877', 'qr', '1750092867', '1750092867.png', 'image/png', 'public', 'public', 27183, '[]', '[]', '[]', '[]', 2, '2025-06-16 19:54:27', '2025-06-16 19:54:27'),
(1308, 'App\\Models\\UserInvitation', 667, '8bb4f054-2d39-4358-94cc-b3c001020613', 'userInvitation', 'a04a6630677f392c4d3b0732a81ee132', 'a04a6630677f392c4d3b0732a81ee132.jpg', 'image/jpeg', 'public', 'public', 261147, '[]', '[]', '[]', '[]', 3, '2025-06-16 19:54:28', '2025-06-16 19:54:28'),
(1309, 'App\\Models\\UserInvitation', 668, '3b4b907c-767b-4b51-96c5-0a658e321c82', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 19:55:08', '2025-06-16 19:55:08'),
(1310, 'App\\Models\\UserInvitation', 668, '4e3cac2d-a76a-4234-9310-c0575e112045', 'qr', '1750092910', '1750092910.png', 'image/png', 'public', 'public', 27238, '[]', '[]', '[]', '[]', 2, '2025-06-16 19:55:10', '2025-06-16 19:55:10'),
(1311, 'App\\Models\\UserInvitation', 668, '60f2757b-d595-407d-8e13-63d8b38da399', 'userInvitation', '14d0d97750b840a8cdf94073d453a9d9', '14d0d97750b840a8cdf94073d453a9d9.jpg', 'image/jpeg', 'public', 'public', 254392, '[]', '[]', '[]', '[]', 3, '2025-06-16 19:55:10', '2025-06-16 19:55:10'),
(1312, 'App\\Models\\UserInvitation', 669, '4e872d1c-0674-45d0-80a9-0ec8774cb972', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 19:56:17', '2025-06-16 19:56:17'),
(1313, 'App\\Models\\UserInvitation', 669, '8383e4dc-1449-4a73-9d67-d4d34c6940c2', 'qr', '1750092982', '1750092982.png', 'image/png', 'public', 'public', 27027, '[]', '[]', '[]', '[]', 2, '2025-06-16 19:56:22', '2025-06-16 19:56:22'),
(1314, 'App\\Models\\UserInvitation', 669, '55199fef-bb4e-4f13-bdb9-b953b5e4f0b9', 'userInvitation', '224bc972b0ce7d987aae674f9469e843', '224bc972b0ce7d987aae674f9469e843.jpg', 'image/jpeg', 'public', 'public', 253775, '[]', '[]', '[]', '[]', 3, '2025-06-16 19:56:22', '2025-06-16 19:56:22'),
(1315, 'App\\Models\\UserInvitation', 670, 'ca6c732c-6802-4b75-81ea-618fc401adea', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 19:57:18', '2025-06-16 19:57:18'),
(1316, 'App\\Models\\UserInvitation', 670, '60b8982d-b5c7-45bb-8940-7eb0525e9953', 'qr', '1750093042', '1750093042.png', 'image/png', 'public', 'public', 27112, '[]', '[]', '[]', '[]', 2, '2025-06-16 19:57:22', '2025-06-16 19:57:22'),
(1317, 'App\\Models\\UserInvitation', 670, '1ccfe26d-7b36-43eb-9616-9f7de0c7d4dd', 'userInvitation', '6d2a6d1fd9dc6977e519d25314904114', '6d2a6d1fd9dc6977e519d25314904114.jpg', 'image/jpeg', 'public', 'public', 259172, '[]', '[]', '[]', '[]', 3, '2025-06-16 19:57:22', '2025-06-16 19:57:22'),
(1318, 'App\\Models\\UserInvitation', 671, 'b37f8c7a-2f62-4a52-9adc-eb3aaf36f8eb', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 20:07:40', '2025-06-16 20:07:40'),
(1319, 'App\\Models\\UserInvitation', 671, '6c7fe289-c1a1-4da4-a300-6c42fbc2e803', 'qr', '1750093662', '1750093662.png', 'image/png', 'public', 'public', 27208, '[]', '[]', '[]', '[]', 2, '2025-06-16 20:07:43', '2025-06-16 20:07:43'),
(1320, 'App\\Models\\UserInvitation', 671, '1c79f9c6-0ec8-4f74-8a2b-cae8b36bbda7', 'userInvitation', '049bf5341678e16d455009a34008583a', '049bf5341678e16d455009a34008583a.jpg', 'image/jpeg', 'public', 'public', 258908, '[]', '[]', '[]', '[]', 3, '2025-06-16 20:07:43', '2025-06-16 20:07:43'),
(1321, 'App\\Models\\UserInvitation', 672, 'bb75d656-8c6a-45d3-8e7f-e3959a182293', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 20:08:33', '2025-06-16 20:08:33'),
(1322, 'App\\Models\\UserInvitation', 672, '79b149f0-13fc-4426-b34e-d5b4d8c29a21', 'qr', '1750093716', '1750093716.png', 'image/png', 'public', 'public', 27033, '[]', '[]', '[]', '[]', 2, '2025-06-16 20:08:36', '2025-06-16 20:08:36'),
(1323, 'App\\Models\\UserInvitation', 672, 'e2e8b915-c67e-4935-adeb-4b77c6e5255d', 'userInvitation', '7d52c882017dcea0691eb678c817a64c', '7d52c882017dcea0691eb678c817a64c.jpg', 'image/jpeg', 'public', 'public', 253375, '[]', '[]', '[]', '[]', 3, '2025-06-16 20:08:36', '2025-06-16 20:08:36'),
(1324, 'App\\Models\\UserInvitation', 673, '685c6476-8376-4dd1-8d75-b00619ef46b8', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 20:09:28', '2025-06-16 20:09:28'),
(1325, 'App\\Models\\UserInvitation', 673, 'da485c56-1a6d-4aee-bf7e-20d5f32b1d29', 'qr', '1750093772', '1750093772.png', 'image/png', 'public', 'public', 27216, '[]', '[]', '[]', '[]', 2, '2025-06-16 20:09:32', '2025-06-16 20:09:32'),
(1326, 'App\\Models\\UserInvitation', 673, '9173bc0c-de5e-47ab-ad53-022402109ccf', 'userInvitation', 'ba14e0d5d7bc63f75bca2089d0b6934d', 'ba14e0d5d7bc63f75bca2089d0b6934d.jpg', 'image/jpeg', 'public', 'public', 253969, '[]', '[]', '[]', '[]', 3, '2025-06-16 20:09:32', '2025-06-16 20:09:32'),
(1327, 'App\\Models\\UserInvitation', 674, 'cb4f6131-2ae3-4a75-b32a-4f04ad0a0d06', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 20:16:21', '2025-06-16 20:16:21'),
(1328, 'App\\Models\\UserInvitation', 674, '0c413da5-0d3b-4da5-8ab1-df0725ae0fc3', 'qr', '1750094184', '1750094184.png', 'image/png', 'public', 'public', 27153, '[]', '[]', '[]', '[]', 2, '2025-06-16 20:16:24', '2025-06-16 20:16:24'),
(1329, 'App\\Models\\UserInvitation', 674, 'bdf76d49-7c7c-4b64-a7d8-faa47148d74f', 'userInvitation', 'c31f43f1893961ecf335f2a3edd47ca4', 'c31f43f1893961ecf335f2a3edd47ca4.jpg', 'image/jpeg', 'public', 'public', 253811, '[]', '[]', '[]', '[]', 3, '2025-06-16 20:16:24', '2025-06-16 20:16:24'),
(1330, 'App\\Models\\UserInvitation', 675, '5c31820d-5ecf-49e1-8d64-1d6c5e0ccf4e', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 20:17:18', '2025-06-16 20:17:18'),
(1331, 'App\\Models\\UserInvitation', 675, '3c636bb3-6962-4258-8346-85a9ff54da2a', 'qr', '1750094241', '1750094241.png', 'image/png', 'public', 'public', 27232, '[]', '[]', '[]', '[]', 2, '2025-06-16 20:17:21', '2025-06-16 20:17:21'),
(1332, 'App\\Models\\UserInvitation', 675, 'f30d551f-278b-41e8-9db1-728618a129e5', 'userInvitation', 'b78454614488909424f3daba4ac9578d', 'b78454614488909424f3daba4ac9578d.jpg', 'image/jpeg', 'public', 'public', 254237, '[]', '[]', '[]', '[]', 3, '2025-06-16 20:17:22', '2025-06-16 20:17:22'),
(1333, 'App\\Models\\UserInvitation', 676, 'ffd9e9f9-200c-4bc8-bfd1-838851a93cd8', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 20:18:03', '2025-06-16 20:18:03'),
(1334, 'App\\Models\\UserInvitation', 676, 'dbcdf6dc-222a-4e98-8aa6-e14de8892ea9', 'qr', '1750094287', '1750094287.png', 'image/png', 'public', 'public', 27155, '[]', '[]', '[]', '[]', 2, '2025-06-16 20:18:07', '2025-06-16 20:18:07'),
(1335, 'App\\Models\\UserInvitation', 676, '932f04a2-a5fd-45c0-a3ef-ff21987ee516', 'userInvitation', '1f34c144836239ed2f27899524bf0148', '1f34c144836239ed2f27899524bf0148.jpg', 'image/jpeg', 'public', 'public', 252934, '[]', '[]', '[]', '[]', 3, '2025-06-16 20:18:07', '2025-06-16 20:18:07'),
(1336, 'App\\Models\\UserInvitation', 677, '7e2e28d7-e74f-4f66-81b7-44cf336553bf', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 20:19:58', '2025-06-16 20:19:58'),
(1337, 'App\\Models\\UserInvitation', 677, 'ef631146-4179-4265-8608-24a12fa141ad', 'qr', '1750094401', '1750094401.png', 'image/png', 'public', 'public', 27078, '[]', '[]', '[]', '[]', 2, '2025-06-16 20:20:01', '2025-06-16 20:20:01'),
(1338, 'App\\Models\\UserInvitation', 677, 'a8c38599-f928-4f3d-a8e6-359ae0f6c49a', 'userInvitation', '8768c5dab529ba61efec9d894803feed', '8768c5dab529ba61efec9d894803feed.jpg', 'image/jpeg', 'public', 'public', 254144, '[]', '[]', '[]', '[]', 3, '2025-06-16 20:20:01', '2025-06-16 20:20:01'),
(1339, 'App\\Models\\UserInvitation', 678, '09dce5ef-cf3a-4d3e-acfd-a20850c1671b', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 20:20:55', '2025-06-16 20:20:55'),
(1340, 'App\\Models\\UserInvitation', 678, 'f111aeec-c813-4a91-a6d3-c98fcd8c1231', 'qr', '1750094458', '1750094458.png', 'image/png', 'public', 'public', 27110, '[]', '[]', '[]', '[]', 2, '2025-06-16 20:20:58', '2025-06-16 20:20:58'),
(1341, 'App\\Models\\UserInvitation', 678, '23142cac-2394-4342-a00a-9a934da93b7a', 'userInvitation', '658c21ca8679e98b27fc24320e8645f8', '658c21ca8679e98b27fc24320e8645f8.jpg', 'image/jpeg', 'public', 'public', 253437, '[]', '[]', '[]', '[]', 3, '2025-06-16 20:20:58', '2025-06-16 20:20:58'),
(1342, 'App\\Models\\UserInvitation', 679, '6764a2df-dff1-4f3e-a5a3-22a2ef15cfae', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-16 20:21:35', '2025-06-16 20:21:35'),
(1343, 'App\\Models\\UserInvitation', 679, '3bf41cef-e036-4422-af77-42b2d9c27917', 'qr', '1750094497', '1750094497.png', 'image/png', 'public', 'public', 27140, '[]', '[]', '[]', '[]', 2, '2025-06-16 20:21:37', '2025-06-16 20:21:37'),
(1344, 'App\\Models\\UserInvitation', 679, 'f9004e48-f86f-42af-ab18-7cf9452e7871', 'userInvitation', 'bdd4dee7d89818a9a1ced395cd1631cd', 'bdd4dee7d89818a9a1ced395cd1631cd.jpg', 'image/jpeg', 'public', 'public', 254237, '[]', '[]', '[]', '[]', 3, '2025-06-16 20:21:37', '2025-06-16 20:21:37'),
(1345, 'App\\Models\\UserInvitation', 680, '6f7a7a0f-62cb-4f35-bf89-b88ba96ac5f4', 'userInvitation', '1-1 (1)', '1-1-(1).jpg', 'image/jpeg', 'public', 'public', 721833, '[]', '[]', '[]', '[]', 1, '2025-06-19 00:35:58', '2025-06-19 00:35:58'),
(1346, 'App\\Models\\UserInvitation', 680, '8178c7ab-d642-4401-aa73-bf5391ac96b9', 'qr', '1750282563', '1750282563.png', 'image/png', 'public', 'public', 35728, '[]', '[]', '[]', '[]', 2, '2025-06-19 00:36:03', '2025-06-19 00:36:03'),
(1347, 'App\\Models\\UserInvitation', 680, '05b4d032-ce04-4629-abee-3c1d37b7b11e', 'userInvitation', '306058b627c3ef4ef10e3023b2450061', '306058b627c3ef4ef10e3023b2450061.jpg', 'image/jpeg', 'public', 'public', 341625, '[]', '[]', '[]', '[]', 3, '2025-06-19 00:36:03', '2025-06-19 00:36:03'),
(1348, 'App\\Models\\UserInvitation', 681, '1b54d5a3-f5d3-4d39-bb0d-d395f4078a00', 'userInvitation', 'IMG-20250619-WA0001', 'IMG-20250619-WA0001.jpg', 'image/jpeg', 'public', 'public', 136330, '[]', '[]', '[]', '[]', 1, '2025-06-19 10:38:42', '2025-06-19 10:38:42'),
(1349, 'App\\Models\\UserInvitation', 681, 'f6499348-838d-498d-8604-c348ceba8236', 'qr', '1750318727', '1750318727.png', 'image/png', 'public', 'public', 28054, '[]', '[]', '[]', '[]', 2, '2025-06-19 10:38:47', '2025-06-19 10:38:47'),
(1350, 'App\\Models\\UserInvitation', 681, '8a0bd3ca-56e5-462a-b86a-7536506fad46', 'userInvitation', '5e8a5b3db00a86617ae292ea381f4075', '5e8a5b3db00a86617ae292ea381f4075.jpg', 'image/jpeg', 'public', 'public', 236497, '[]', '[]', '[]', '[]', 3, '2025-06-19 10:38:48', '2025-06-19 10:38:48'),
(1351, 'App\\Models\\UserInvitation', 682, '412bda73-4a9f-41c3-bff9-381a53d57361', 'userInvitation', 'null-20250619-WA0003', 'null-20250619-WA0003.jpg', 'image/jpeg', 'public', 'public', 138628, '[]', '[]', '[]', '[]', 1, '2025-06-19 10:40:38', '2025-06-19 10:40:38'),
(1352, 'App\\Models\\UserInvitation', 682, '0a556cb6-d3f6-4c59-b2ce-539db0ba1077', 'qr', '1750318840', '1750318840.png', 'image/png', 'public', 'public', 28129, '[]', '[]', '[]', '[]', 2, '2025-06-19 10:40:40', '2025-06-19 10:40:40'),
(1353, 'App\\Models\\UserInvitation', 682, '8d1e096b-b497-428e-9934-b7081c405118', 'userInvitation', '6b9439a46b95d4f14c3e7f3915c500c5', '6b9439a46b95d4f14c3e7f3915c500c5.jpg', 'image/jpeg', 'public', 'public', 247375, '[]', '[]', '[]', '[]', 3, '2025-06-19 10:40:41', '2025-06-19 10:40:41'),
(1354, 'App\\Models\\UserInvitation', 683, '7afbed52-3d81-43c3-899f-c8abd164ec13', 'userInvitation', '39b51933-74d1-4ff2-ba6c-75d91c599017', '39b51933-74d1-4ff2-ba6c-75d91c599017.png', 'image/png', 'public', 'public', 342792, '[]', '[]', '[]', '[]', 1, '2025-06-19 12:11:12', '2025-06-19 12:11:12'),
(1355, 'App\\Models\\UserInvitation', 683, '0a56f208-709d-4d14-b549-13475a59640d', 'qr', '1750324276', '1750324276.png', 'image/png', 'public', 'public', 26761, '[]', '[]', '[]', '[]', 2, '2025-06-19 12:11:16', '2025-06-19 12:11:16'),
(1356, 'App\\Models\\UserInvitation', 683, 'c16b98bc-3b4c-4b2f-91ae-dd75751b700d', 'userInvitation', 'c1c1995864e71c390772b98a941667e2', 'c1c1995864e71c390772b98a941667e2.jpg', 'image/jpeg', 'public', 'public', 445680, '[]', '[]', '[]', '[]', 3, '2025-06-19 12:11:16', '2025-06-19 12:11:16'),
(1357, 'App\\Models\\UserInvitation', 684, 'e0c7be81-2f53-46b1-9d44-05cef5be22d8', 'userInvitation', 'Picsart_25-06-19_12-14-22-902', 'Picsart_25-06-19_12-14-22-902.jpg', 'image/jpeg', 'public', 'public', 588381, '[]', '[]', '[]', '[]', 1, '2025-06-19 12:15:28', '2025-06-19 12:15:28'),
(1358, 'App\\Models\\UserInvitation', 684, 'ec13cf56-1a57-4bfe-b37a-78597d6575cc', 'qr', '1750324531', '1750324531.png', 'image/png', 'public', 'public', 27153, '[]', '[]', '[]', '[]', 2, '2025-06-19 12:15:31', '2025-06-19 12:15:31'),
(1359, 'App\\Models\\UserInvitation', 684, 'a6cb88f7-60e0-4b04-98b9-ef75c0fb8c40', 'userInvitation', '1e251fc140134a40bb86a0f2c7fb1405', '1e251fc140134a40bb86a0f2c7fb1405.jpg', 'image/jpeg', 'public', 'public', 445565, '[]', '[]', '[]', '[]', 3, '2025-06-19 12:15:32', '2025-06-19 12:15:32'),
(1360, 'App\\Models\\UserInvitation', 685, '06552dc8-45a0-4b7e-8592-dac48dfa442a', 'userInvitation', 'Picsart_25-06-19_12-14-22-902', 'Picsart_25-06-19_12-14-22-902.jpg', 'image/jpeg', 'public', 'public', 588381, '[]', '[]', '[]', '[]', 1, '2025-06-19 12:16:08', '2025-06-19 12:16:08'),
(1361, 'App\\Models\\UserInvitation', 685, '64468c26-aa15-4ad1-b480-a33b7d94d1ef', 'qr', '1750324571', '1750324571.png', 'image/png', 'public', 'public', 26863, '[]', '[]', '[]', '[]', 2, '2025-06-19 12:16:11', '2025-06-19 12:16:11'),
(1362, 'App\\Models\\UserInvitation', 685, '1d116fb6-6c1b-4559-a757-b87b3992bdf7', 'userInvitation', '90f21d89b1c73806adf44dec0bbaefb9', '90f21d89b1c73806adf44dec0bbaefb9.jpg', 'image/jpeg', 'public', 'public', 443309, '[]', '[]', '[]', '[]', 3, '2025-06-19 12:16:11', '2025-06-19 12:16:11'),
(1363, 'App\\Models\\UserInvitation', 686, '080d8677-6984-4d3e-85ab-7dcf2e572bbc', 'userInvitation', 'Picsart_25-06-19_12-14-22-902', 'Picsart_25-06-19_12-14-22-902.jpg', 'image/jpeg', 'public', 'public', 588381, '[]', '[]', '[]', '[]', 1, '2025-06-19 12:17:06', '2025-06-19 12:17:06'),
(1364, 'App\\Models\\UserInvitation', 687, '45cea55b-4bb4-46bb-826a-39f2943a1281', 'userInvitation', 'Picsart_25-06-19_12-14-22-902', 'Picsart_25-06-19_12-14-22-902.jpg', 'image/jpeg', 'public', 'public', 588381, '[]', '[]', '[]', '[]', 1, '2025-06-19 12:17:08', '2025-06-19 12:17:08'),
(1365, 'App\\Models\\UserInvitation', 687, 'fbfcd650-668b-4d7d-9e3e-52825f23ea61', 'qr', '1750324628', '1750324628.png', 'image/png', 'public', 'public', 26725, '[]', '[]', '[]', '[]', 2, '2025-06-19 12:17:08', '2025-06-19 12:17:08'),
(1366, 'App\\Models\\UserInvitation', 687, 'cedb40ef-9df6-4eda-bfdd-a6b8662aa77e', 'userInvitation', '3dae5c92c82e7cba7529e48624249aa0', '3dae5c92c82e7cba7529e48624249aa0.jpg', 'image/jpeg', 'public', 'public', 443309, '[]', '[]', '[]', '[]', 3, '2025-06-19 12:17:09', '2025-06-19 12:17:09'),
(1367, 'App\\Models\\UserInvitation', 687, '900b1abe-5fe0-4eb5-9087-a042c8f3a1a2', 'qr', '1750324630', '1750324630.png', 'image/png', 'public', 'public', 26911, '[]', '[]', '[]', '[]', 4, '2025-06-19 12:17:10', '2025-06-19 12:17:10'),
(1368, 'App\\Models\\UserInvitation', 687, '35602278-6ce1-4319-ab63-b4025a04999d', 'userInvitation', '6ed95cbe243abc72b263edb5f4f1391c', '6ed95cbe243abc72b263edb5f4f1391c.jpg', 'image/jpeg', 'public', 'public', 443309, '[]', '[]', '[]', '[]', 5, '2025-06-19 12:17:10', '2025-06-19 12:17:10'),
(1369, 'App\\Models\\UserInvitation', 688, '4cd3caf7-be9e-4e70-a49b-578852cf395c', 'userInvitation', 'Picsart_25-06-19_12-14-22-902', 'Picsart_25-06-19_12-14-22-902.jpg', 'image/jpeg', 'public', 'public', 588381, '[]', '[]', '[]', '[]', 1, '2025-06-19 12:21:31', '2025-06-19 12:21:31'),
(1370, 'App\\Models\\UserInvitation', 688, 'c19f4a4e-156a-4c9e-bfd7-be165b440fd1', 'qr', '1750324893', '1750324893.png', 'image/png', 'public', 'public', 27160, '[]', '[]', '[]', '[]', 2, '2025-06-19 12:21:33', '2025-06-19 12:21:33'),
(1371, 'App\\Models\\UserInvitation', 688, 'c32cf885-c65c-4e4d-b128-8ce5f8ed80f3', 'userInvitation', '70f6934798e39adbe709c8221d47b505', '70f6934798e39adbe709c8221d47b505.jpg', 'image/jpeg', 'public', 'public', 447666, '[]', '[]', '[]', '[]', 3, '2025-06-19 12:21:34', '2025-06-19 12:21:34'),
(1372, 'App\\Models\\UserInvitation', 689, 'c26940b2-5724-47fa-9451-21178d772d97', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-20 00:38:09', '2025-06-20 00:38:09'),
(1373, 'App\\Models\\UserInvitation', 689, 'be678c6c-7874-4cd9-b1a7-1af56fef4ece', 'qr', '1750369096', '1750369096.png', 'image/png', 'public', 'public', 27230, '[]', '[]', '[]', '[]', 2, '2025-06-20 00:38:16', '2025-06-20 00:38:16'),
(1374, 'App\\Models\\UserInvitation', 689, '56a3700d-036c-4dbe-aaff-f7b2ca9a2b03', 'userInvitation', '5038a9f69fa0df70c69a4d662a7df07f', '5038a9f69fa0df70c69a4d662a7df07f.jpg', 'image/jpeg', 'public', 'public', 244593, '[]', '[]', '[]', '[]', 3, '2025-06-20 00:38:16', '2025-06-20 00:38:16'),
(1375, 'App\\Models\\UserInvitation', 690, '3e069435-734b-41a6-afd3-8f8566c65868', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-20 00:55:30', '2025-06-20 00:55:30'),
(1376, 'App\\Models\\UserInvitation', 690, 'b811ee16-3daf-4dd1-a859-d855abca4bfa', 'qr', '1750370136', '1750370136.png', 'image/png', 'public', 'public', 27214, '[]', '[]', '[]', '[]', 2, '2025-06-20 00:55:36', '2025-06-20 00:55:36'),
(1377, 'App\\Models\\UserInvitation', 690, 'fdfccec4-cc07-417b-bbb9-df8ec94fbfb3', 'userInvitation', '905c9a51b359302a4a5e2862ca4c2496', '905c9a51b359302a4a5e2862ca4c2496.jpg', 'image/jpeg', 'public', 'public', 251240, '[]', '[]', '[]', '[]', 3, '2025-06-20 00:55:36', '2025-06-20 00:55:36'),
(1378, 'App\\Models\\UserInvitation', 691, 'cae14560-8d01-4848-b798-4acc51ba15ac', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-20 01:26:22', '2025-06-20 01:26:22'),
(1379, 'App\\Models\\UserInvitation', 691, 'df60a678-00e6-459d-9597-666dad9d0f82', 'qr', '1750371987', '1750371987.png', 'image/png', 'public', 'public', 29218, '[]', '[]', '[]', '[]', 2, '2025-06-20 01:26:27', '2025-06-20 01:26:27'),
(1380, 'App\\Models\\UserInvitation', 691, '97ede021-8e33-427d-9643-3b7106f26964', 'userInvitation', 'dd7c3e606cf927b34d911e4ea5c9b399', 'dd7c3e606cf927b34d911e4ea5c9b399.jpg', 'image/jpeg', 'public', 'public', 265112, '[]', '[]', '[]', '[]', 3, '2025-06-20 01:26:27', '2025-06-20 01:26:27'),
(1381, 'App\\Models\\UserInvitation', 692, '7a8a3eca-a066-4fca-a5d7-917097badf6c', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-20 01:31:56', '2025-06-20 01:31:56'),
(1382, 'App\\Models\\UserInvitation', 692, 'a8155679-71dc-45e5-8136-b52fb12a8792', 'qr', '1750372319', '1750372319.png', 'image/png', 'public', 'public', 29396, '[]', '[]', '[]', '[]', 2, '2025-06-20 01:32:00', '2025-06-20 01:32:00'),
(1383, 'App\\Models\\UserInvitation', 692, '51e48817-e740-4afd-93d8-621bd06854fc', 'userInvitation', '95931eaee2093b7e5cacee143a53dbb5', '95931eaee2093b7e5cacee143a53dbb5.jpg', 'image/jpeg', 'public', 'public', 258261, '[]', '[]', '[]', '[]', 3, '2025-06-20 01:32:00', '2025-06-20 01:32:00'),
(1384, 'App\\Models\\UserInvitation', 693, '21b4ea7a-2291-4f56-bcd2-28d0e717e743', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-20 01:33:09', '2025-06-20 01:33:09'),
(1385, 'App\\Models\\UserInvitation', 693, 'dd8bc974-e408-4594-b550-410d84687f73', 'qr', '1750372392', '1750372392.png', 'image/png', 'public', 'public', 29271, '[]', '[]', '[]', '[]', 2, '2025-06-20 01:33:12', '2025-06-20 01:33:12'),
(1386, 'App\\Models\\UserInvitation', 693, '54e97acc-e2ba-49ee-87f8-3a49388fe30b', 'userInvitation', '379a1387dad3742450cee2731523822d', '379a1387dad3742450cee2731523822d.jpg', 'image/jpeg', 'public', 'public', 252272, '[]', '[]', '[]', '[]', 3, '2025-06-20 01:33:12', '2025-06-20 01:33:12'),
(1387, 'App\\Models\\UserInvitation', 694, 'e1e32027-dcf9-465b-a3ac-53bca0b219b0', 'userInvitation', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785', 'b14cb9a34ab96b86ba996c7e982f09b1_edit_157999330335785.jpg', 'image/jpeg', 'public', 'public', 325564, '[]', '[]', '[]', '[]', 1, '2025-06-20 01:35:19', '2025-06-20 01:35:19'),
(1388, 'App\\Models\\UserInvitation', 694, 'c7f06036-ff3c-4878-973d-fcd484eb8cb2', 'qr', '1750372523', '1750372523.png', 'image/png', 'public', 'public', 29372, '[]', '[]', '[]', '[]', 2, '2025-06-20 01:35:23', '2025-06-20 01:35:23'),
(1389, 'App\\Models\\UserInvitation', 694, '424f008d-2210-49ac-88d5-f9a78ac18d13', 'userInvitation', 'b1f6487d8e05b7968bfbfe362cf0dbc4', 'b1f6487d8e05b7968bfbfe362cf0dbc4.jpg', 'image/jpeg', 'public', 'public', 252044, '[]', '[]', '[]', '[]', 3, '2025-06-20 01:35:23', '2025-06-20 01:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_admins_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2018_08_08_100000_create_telescope_entries_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2024_04_20_081022_create_halls_table', 1),
(7, '2024_04_20_084429_create_invitations_table', 1),
(8, '2024_04_21_080455_create_media_table', 1),
(9, '2024_06_01_143315_create_user_invitaions_table', 1),
(10, '2024_06_01_175024_create_invited_users_table', 1),
(11, '2024_07_24_190751_create_notifications_table', 1),
(12, '2024_07_26_173635_add_column_fcm_token_to_users_table', 1),
(13, '2024_07_27_123643_create_privacy_policies_table', 1),
(14, '2024_08_10_203234_create_payment_user_invitations_table', 1),
(15, '2024_08_18_161255_create_marketer_codes_table', 1),
(16, '2024_08_29_171359_add_bank_name_and_iban_to_users_table', 1),
(17, '2024_08_30_232016_add_uuid_col_to_table_payment_user_invitation', 1),
(18, '2024_09_10_192205_add_name_to_user_invitations_table', 1),
(19, '2024_09_11_205403_create_user_withdrawals_table', 1),
(20, '2024_09_22_205853_add_longitude_latitude_to_your_table_halls', 1),
(21, '2024_09_25_223128_add_time_to_your_table_user_invitations', 1),
(22, '2024_10_08_231106_create_settings_table', 1),
(23, '2024_10_13_151017_add_invitation_columns_to_user_invitations_table', 1),
(24, '2024_10_13_230705_add_last_login_columns_to_users_table', 1),
(25, '2024_10_13_230705_add_url_columns_to_halls_table', 1),
(26, '2024_10_17_201507_create_transferred_amounts_table', 1),
(27, '2024_10_21_002959_add_max_date_to_invitations_table', 1),
(28, '2024_10_21_065458_add_subscription_to_users_table', 1),
(29, '2024_10_30_034355_add_status_to_user_invitations_table', 2),
(30, '2024_11_12_180901_create_user_packages_table', 3),
(31, '2024_11_12_190533_add_user_package_id_to_user_invitations_table', 3),
(32, '2024_11_16_174344_add_note_to_invited_users_table', 4),
(33, '2024_11_28_224650_add_columns_to_payment_user_invitations_table', 5),
(34, '2025_05_25_005937_add_type_to_invitations_table', 6),
(35, '2025_05_26_121902_add_text_settings_to_user_invitations_table', 7),
(39, '2025_05_27_203845_create_device_invitations_table', 8),
(40, '2025_06_08_153013_create_adjust_installs_table', 8),
(41, '2025_06_08_154523_add_tracker_link_to_users_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_user_invitations`
--

CREATE TABLE `payment_user_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_payment` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `value` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_uuid` char(36) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transfered` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 is for not transferred, 1 is for transferred'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_user_invitations`
--

INSERT INTO `payment_user_invitations` (`id`, `id_payment`, `status`, `value`, `created_at`, `updated_at`, `payment_uuid`, `user_id`, `transfered`) VALUES
(142, NULL, 0, 7, '2025-01-01 21:50:02', '2025-01-01 21:50:02', '33c1e720-c871-11ef-811b-4bb5310072a8', 23, '0'),
(144, NULL, 0, 7, '2025-01-05 03:42:34', '2025-01-05 03:42:34', 'f36dca10-cafd-11ef-aba6-df72e9f17a85', 53, '0'),
(145, NULL, 0, 7, '2025-01-05 03:42:43', '2025-01-05 03:42:43', 'f8d092d0-cafd-11ef-aba6-df72e9f17a85', 53, '0'),
(146, NULL, 0, 7, '2025-01-05 03:42:46', '2025-01-05 03:42:46', 'fb336200-cafd-11ef-aba6-df72e9f17a85', 53, '0'),
(147, NULL, 0, 7, '2025-01-05 03:44:31', '2025-01-05 03:44:31', '395d6260-cafe-11ef-aba6-df72e9f17a85', 53, '0'),
(148, NULL, 0, 7, '2025-01-05 03:44:37', '2025-01-05 03:44:37', '3d1b06a0-cafe-11ef-aba6-df72e9f17a85', 53, '0'),
(149, NULL, 0, 7, '2025-01-05 03:44:47', '2025-01-05 03:44:47', '4330cbb0-cafe-11ef-aba6-df72e9f17a85', 53, '0'),
(150, NULL, 0, 7, '2025-01-05 03:44:49', '2025-01-05 03:44:49', '44d490a0-cafe-11ef-aba6-df72e9f17a85', 53, '0'),
(153, NULL, 0, 7, '2025-01-06 13:37:15', '2025-01-06 13:37:15', '2f6244c0-cc1a-11ef-ae58-2f0101dabbfc', 23, '0'),
(155, 'SFT2501121285205', 1, 7, '2025-01-11 19:07:45', '2025-01-11 19:08:00', '30c7b320-d036-11ef-984c-d9e9e74f70d7', 55, '0'),
(162, NULL, 0, 7, '2025-01-15 17:56:32', '2025-01-15 17:56:32', 'e7c55b50-d350-11ef-bc85-e3e0bcee5a1a', 56, '0'),
(163, 'SFT2501521468442', 1, 7, '2025-01-15 19:40:45', '2025-06-07 16:35:02', '76ce7350-d35f-11ef-8e38-ff6477caa2b5', 56, '1'),
(164, 'SFT2502521917802', 1, 6, '2025-01-26 00:38:20', '2025-06-07 16:35:02', 'b1420080-db64-11ef-bd8c-fdae41d8b1c2', 60, '1'),
(166, NULL, 0, 6, '2025-02-27 00:20:21', '2025-02-27 00:20:21', '78eb3ee0-f487-11ef-8805-93623e79d9cd', 69, '0'),
(169, 'SFT2507324369486', 1, 6, '2025-03-15 00:59:43', '2025-03-15 01:00:42', 'a234ab20-011f-11f0-ab42-2dfb95f84dcc', 69, '0'),
(171, NULL, 0, 1, '2025-03-20 17:20:18', '2025-03-20 17:20:18', '72ac67a0-0596-11f0-b318-1b2d5a3ee8aa', 69, '0'),
(173, 'SFT2509525491590', 1, 1, '2025-04-05 15:01:13', '2025-04-05 15:02:58', 'ac6f64c0-1215-11f0-aa59-cb3e7c98516a', 69, '0'),
(175, NULL, 0, 6, '2025-04-06 01:04:11', '2025-04-06 01:04:11', 'e719f730-1269-11f0-937e-e311efc1bf98', 69, '0'),
(190, '2962ce70-14b6-11f0-834a-7be5d5fde0d1', 1, 0, '2025-04-08 23:15:07', '2025-04-08 23:15:07', '2962ce70-14b6-11f0-834a-7be5d5fde0d1', 8, '0'),
(192, NULL, 0, 0, '2025-04-09 23:50:44', '2025-04-09 23:50:44', '4dbca380-1584-11f0-81f9-39dc02f40bff', 8, '0'),
(193, 'd1d83800-1584-11f0-81f9-39dc02f40bff', 1, 0, '2025-04-09 23:54:24', '2025-04-09 23:54:53', 'd1d83800-1584-11f0-81f9-39dc02f40bff', 8, '0'),
(194, '26c3c210-1591-11f0-944f-43613780b6b8', 1, 0, '2025-04-10 01:22:41', '2025-04-10 01:22:41', '26c3c210-1591-11f0-944f-43613780b6b8', 8, '0'),
(195, '9b3efb90-1592-11f0-a4d2-49bb4cfc2d3a', 1, 0, '2025-04-10 01:33:05', '2025-04-10 01:33:05', '9b3efb90-1592-11f0-a4d2-49bb4cfc2d3a', 8, '0'),
(196, '17d0c410-17c1-11f0-8208-f1ca9a870d0d', 1, 0, '2025-04-12 20:10:56', '2025-04-12 20:10:56', '17d0c410-17c1-11f0-8208-f1ca9a870d0d', 8, '0'),
(197, 'd54066e0-17c1-11f0-8208-f1ca9a870d0d', 0, 0, '2025-04-12 20:16:12', '2025-04-12 20:16:13', 'd54066e0-17c1-11f0-8208-f1ca9a870d0d', 8, '0'),
(198, '245e4de0-17cd-11f0-8208-f1ca9a870d0d', 1, 0, '2025-04-12 21:37:10', '2025-04-12 21:37:11', '245e4de0-17cd-11f0-8208-f1ca9a870d0d', 8, '0'),
(199, '093493c0-18a0-11f0-91f7-4b74816b4a26', 1, 0, '2025-04-13 22:47:12', '2025-04-13 22:47:12', '093493c0-18a0-11f0-91f7-4b74816b4a26', 8, '0'),
(200, '8a8d4240-18a1-11f0-b9ac-a37326cec832', 1, 0, '2025-04-13 22:57:43', '2025-04-13 22:57:43', '8a8d4240-18a1-11f0-b9ac-a37326cec832', 8, '0'),
(201, '4c277bf0-18a2-11f0-91f7-4b74816b4a26', 1, 0, '2025-04-13 23:03:23', '2025-04-13 23:03:23', '4c277bf0-18a2-11f0-91f7-4b74816b4a26', 8, '0'),
(204, 'c99d0980-1977-11f0-b72a-7dbdd8fb0b98', 1, 0, '2025-04-15 00:31:10', '2025-04-15 00:31:11', 'c99d0980-1977-11f0-b72a-7dbdd8fb0b98', 8, '0'),
(205, '31620fe0-1dbd-11f0-95a1-c9803658826e', 1, 0, '2025-04-20 10:58:06', '2025-04-20 10:58:06', '31620fe0-1dbd-11f0-95a1-c9803658826e', 8, '0'),
(207, 'a2a31080-1dbf-11f0-b10c-5d3e869c1178', 1, 0, '2025-04-20 11:15:36', '2025-04-20 11:15:36', 'a2a31080-1dbf-11f0-b10c-5d3e869c1178', 8, '0'),
(208, '587202e0-1e4c-11f0-a691-599dc353ddd3', 1, 0, '2025-04-21 04:02:49', '2025-04-21 04:02:49', '587202e0-1e4c-11f0-a691-599dc353ddd3', 8, '0'),
(209, '854736f0-1e4c-11f0-a691-599dc353ddd3', 1, 0, '2025-04-21 04:04:04', '2025-04-21 04:04:04', '854736f0-1e4c-11f0-a691-599dc353ddd3', 8, '0'),
(210, '654baa80-1e50-11f0-aa6f-3179631ff2a9', 1, 0, '2025-04-21 04:31:49', '2025-04-21 04:31:49', '654baa80-1e50-11f0-aa6f-3179631ff2a9', 8, '0'),
(211, 'ed03c280-1e57-11f0-8a9c-fbc9cf78db84', 1, 0, '2025-04-21 05:25:42', '2025-04-21 05:25:42', 'ed03c280-1e57-11f0-8a9c-fbc9cf78db84', 8, '0'),
(220, '67729b40-2097-11f0-bbeb-ebdefab5bf02', 1, 0, '2025-04-24 02:05:09', '2025-04-24 02:05:09', '67729b40-2097-11f0-bbeb-ebdefab5bf02', 8, '0'),
(221, 'e6c58420-2097-11f0-bbeb-ebdefab5bf02', 1, 0, '2025-04-24 02:08:43', '2025-04-24 02:08:44', 'e6c58420-2097-11f0-bbeb-ebdefab5bf02', 8, '0'),
(223, '6daff670-20a0-11f0-bbeb-ebdefab5bf02', 1, 0, '2025-04-24 03:09:46', '2025-04-24 03:09:46', '6daff670-20a0-11f0-bbeb-ebdefab5bf02', 8, '0'),
(224, 'f26c10b0-20a0-11f0-bbeb-ebdefab5bf02', 1, 0, '2025-04-24 03:13:28', '2025-04-24 03:13:28', 'f26c10b0-20a0-11f0-bbeb-ebdefab5bf02', 8, '0'),
(225, '03222c00-20a1-11f0-bbeb-ebdefab5bf02', 1, 0, '2025-04-24 03:13:56', '2025-04-24 03:13:56', '03222c00-20a1-11f0-bbeb-ebdefab5bf02', 8, '0'),
(233, NULL, 0, 1, '2025-04-27 02:49:07', '2025-04-27 02:49:07', '0bc3ae60-22f9-11f0-967b-df8b777a8ee4', 8, '0'),
(240, '6515d170-2306-11f0-997c-0185acd9014e', 1, 0, '2025-04-27 04:24:41', '2025-04-27 04:24:41', '6515d170-2306-11f0-997c-0185acd9014e', 8, '0'),
(241, 'd6f78520-2498-11f0-b184-f943f8e73b9f', 1, 0, '2025-04-29 04:25:32', '2025-04-29 04:25:32', 'd6f78520-2498-11f0-b184-f943f8e73b9f', 8, '0'),
(242, '37335870-253d-11f0-9f8c-ff6124dfd754', 1, 0, '2025-04-30 00:02:11', '2025-04-30 00:02:11', '37335870-253d-11f0-9f8c-ff6124dfd754', 8, '0'),
(243, '529dc080-2b7a-11f0-98a8-054f0d3b5da5', 1, 0, '2025-05-07 22:34:41', '2025-05-07 22:34:42', '529dc080-2b7a-11f0-98a8-054f0d3b5da5', 8, '0'),
(244, '5cf8ca90-2e52-11f0-b9ef-bb4aeeb9748d', 1, 0, '2025-05-11 13:26:22', '2025-05-11 13:26:22', '5cf8ca90-2e52-11f0-b9ef-bb4aeeb9748d', 8, '0'),
(245, '64c7d860-2e52-11f0-b9ef-bb4aeeb9748d', 1, 0, '2025-05-11 13:26:30', '2025-05-11 13:26:30', '64c7d860-2e52-11f0-b9ef-bb4aeeb9748d', 8, '0'),
(247, 'SFT2513127163834', 1, 6, '2025-05-11 17:28:04', '2025-05-11 17:28:17', '2059b780-2e74-11f0-9169-657b1863ee02', 53, '0'),
(248, '2d44d420-2f50-11f0-be5f-850b98619956', 1, 0, '2025-05-12 19:43:06', '2025-05-12 19:43:07', '2d44d420-2f50-11f0-be5f-850b98619956', 8, '0'),
(250, 'cce43360-311f-11f0-bf0f-6522c5aa1bc6', 1, 0, '2025-05-15 03:01:51', '2025-05-15 03:01:52', 'cce43360-311f-11f0-bf0f-6522c5aa1bc6', 8, '0'),
(251, 'aa747a00-3120-11f0-bf0f-6522c5aa1bc6', 1, 0, '2025-05-15 03:08:03', '2025-05-15 03:08:03', 'aa747a00-3120-11f0-bf0f-6522c5aa1bc6', 8, '0'),
(252, '2161d9d0-3434-11f0-804a-15169198f8c0', 1, 0, '2025-05-19 01:04:57', '2025-05-19 01:04:57', '2161d9d0-3434-11f0-804a-15169198f8c0', 8, '0'),
(253, NULL, 0, 12, '2025-05-24 08:26:31', '2025-05-24 08:26:31', 'a599bd10-385f-11f0-aad9-27e842983968', 98, '0'),
(254, NULL, 0, 12, '2025-05-24 08:26:36', '2025-05-24 08:26:36', 'a86bc8d0-385f-11f0-aad9-27e842983968', 98, '0'),
(255, NULL, 0, 12, '2025-05-24 08:26:41', '2025-05-24 08:26:41', 'ab3940b0-385f-11f0-aad9-27e842983968', 98, '0'),
(256, NULL, 0, 12, '2025-05-24 08:26:53', '2025-05-24 08:26:53', 'b2989cc0-385f-11f0-aad9-27e842983968', 98, '0'),
(257, NULL, 0, 12, '2025-05-24 08:29:15', '2025-05-24 08:29:15', '071b9770-3860-11f0-a096-f7d414970081', 98, '0'),
(258, NULL, 0, 12, '2025-05-24 08:29:24', '2025-05-24 08:29:24', '0c18e7a0-3860-11f0-a096-f7d414970081', 98, '0'),
(259, NULL, 0, 12, '2025-05-24 08:29:25', '2025-05-24 08:29:25', '0c9088a0-3860-11f0-a096-f7d414970081', 98, '0'),
(260, NULL, 0, 6, '2025-05-24 08:29:35', '2025-05-24 08:29:35', '12a7fb60-3860-11f0-a096-f7d414970081', 98, '0'),
(261, NULL, 0, 12, '2025-05-24 08:46:47', '2025-05-24 08:46:47', '79d1fa00-3862-11f0-9828-1d44ebf5cac5', 98, '0'),
(262, NULL, 0, 6, '2025-05-24 08:47:13', '2025-05-24 08:47:13', '8a593d20-3862-11f0-9828-1d44ebf5cac5', 98, '0'),
(263, NULL, 0, 6, '2025-05-24 08:47:16', '2025-05-24 08:47:16', '8bc26a10-3862-11f0-9828-1d44ebf5cac5', 98, '0'),
(268, '159c2460-387c-11f0-9e48-9ba3ffbc3f8c', 1, 0, '2025-05-24 11:50:06', '2025-05-24 11:50:06', '159c2460-387c-11f0-9e48-9ba3ffbc3f8c', 8, '0'),
(269, '6e1b7a00-387c-11f0-9e48-9ba3ffbc3f8c', 1, 0, '2025-05-24 11:52:33', '2025-05-24 11:52:33', '6e1b7a00-387c-11f0-9e48-9ba3ffbc3f8c', 8, '0'),
(270, '44d8d0a0-387e-11f0-905f-497e0e2be88a', 1, 0, '2025-05-24 12:05:44', '2025-05-24 12:05:44', '44d8d0a0-387e-11f0-905f-497e0e2be88a', 8, '0'),
(271, '19e0af10-3880-11f0-905f-497e0e2be88a', 1, 0, '2025-05-24 12:18:51', '2025-05-24 12:18:51', '19e0af10-3880-11f0-905f-497e0e2be88a', 8, '0'),
(272, '3ff38a60-3880-11f0-905f-497e0e2be88a', 1, 0, '2025-05-24 12:19:54', '2025-05-24 12:19:55', '3ff38a60-3880-11f0-905f-497e0e2be88a', 8, '0'),
(273, 'SFT2514427700356', 1, 6, '2025-05-24 14:02:56', '2025-05-24 14:03:05', 'a4b9d900-388e-11f0-b56c-8312236b3061', 97, '0'),
(275, '879de180-38c1-11f0-af40-cdb719c44bd6', 1, 0, '2025-05-24 20:07:12', '2025-05-24 20:07:12', '879de180-38c1-11f0-af40-cdb719c44bd6', 8, '0'),
(276, '21e8c840-38c2-11f0-af40-cdb719c44bd6', 1, 0, '2025-05-24 20:11:33', '2025-05-24 20:11:34', '21e8c840-38c2-11f0-af40-cdb719c44bd6', 8, '0'),
(277, '267184b0-38c2-11f0-af40-cdb719c44bd6', 1, 0, '2025-05-24 20:11:53', '2025-05-24 20:11:54', '267184b0-38c2-11f0-af40-cdb719c44bd6', 8, '0'),
(278, '783d75b0-38c2-11f0-af40-cdb719c44bd6', 1, 0, '2025-05-24 20:13:55', '2025-05-24 20:13:55', '783d75b0-38c2-11f0-af40-cdb719c44bd6', 8, '0'),
(279, 'f8b0a630-38c3-11f0-af40-cdb719c44bd6', 1, 0, '2025-05-24 20:24:40', '2025-05-24 20:24:40', 'f8b0a630-38c3-11f0-af40-cdb719c44bd6', 8, '0'),
(302, 'a915e3b0-38dc-11f0-a6d3-399e92f74830', 1, 0, '2025-05-24 23:21:24', '2025-05-24 23:21:24', 'a915e3b0-38dc-11f0-a6d3-399e92f74830', 8, '0'),
(304, NULL, 0, 1, '2025-05-26 07:17:08', '2025-05-26 07:17:08', '49af3360-39e8-11f0-93b6-d755413bba82', 8, '0'),
(305, NULL, 0, 1, '2025-05-26 07:17:14', '2025-05-26 07:17:14', '4d022ef0-39e8-11f0-93b6-d755413bba82', 8, '0'),
(306, NULL, 0, 1, '2025-05-26 07:17:16', '2025-05-26 07:17:16', '4e85e8c0-39e8-11f0-93b6-d755413bba82', 8, '0'),
(307, NULL, 0, 1, '2025-05-26 07:17:21', '2025-05-26 07:17:21', '51524f30-39e8-11f0-93b6-d755413bba82', 8, '0'),
(308, NULL, 0, 1, '2025-05-26 07:17:23', '2025-05-26 07:17:23', '52eb65c0-39e8-11f0-93b6-d755413bba82', 8, '0'),
(309, NULL, 0, 1, '2025-05-26 07:17:26', '2025-05-26 07:17:26', '54b9bd20-39e8-11f0-93b6-d755413bba82', 8, '0'),
(310, NULL, 0, 1, '2025-05-26 07:17:34', '2025-05-26 07:17:34', '591ca210-39e8-11f0-93b6-d755413bba82', 8, '0'),
(311, NULL, 0, 1, '2025-05-26 07:18:04', '2025-05-26 07:18:04', '6b034e20-39e8-11f0-93b6-d755413bba82', 8, '0'),
(313, 'SFT2514627789402', 1, 1, '2025-05-26 07:20:33', '2025-05-26 07:21:38', 'c2e922e0-39e8-11f0-9aa9-63d964cb2f0c', 8, '0'),
(314, 'adb2ab60-39ef-11f0-9aa9-63d964cb2f0c', 1, 0, '2025-05-26 08:10:05', '2025-05-26 08:10:05', 'adb2ab60-39ef-11f0-9aa9-63d964cb2f0c', 8, '0'),
(315, '1d6b2220-39f0-11f0-9aa9-63d964cb2f0c', 1, 0, '2025-05-26 08:13:11', '2025-05-26 08:13:12', '1d6b2220-39f0-11f0-9aa9-63d964cb2f0c', 8, '0'),
(317, 'c5800fe0-3a34-11f0-b122-d956bb3a3af3', 1, 0, '2025-05-26 16:24:37', '2025-05-26 16:24:37', 'c5800fe0-3a34-11f0-b122-d956bb3a3af3', 8, '0'),
(318, 'f55cfe50-3a37-11f0-8349-290d4f67bf70', 1, 0, '2025-05-26 16:47:26', '2025-05-26 16:47:27', 'f55cfe50-3a37-11f0-8349-290d4f67bf70', 8, '0'),
(319, '5c63f5e0-3a8d-11f0-8db3-dfb939df27fe', 1, 0, '2025-05-27 02:58:47', '2025-05-27 02:58:47', '5c63f5e0-3a8d-11f0-8db3-dfb939df27fe', 8, '0'),
(320, 'aab3ea10-3a8e-11f0-8db3-dfb939df27fe', 1, 0, '2025-05-27 03:08:08', '2025-05-27 03:08:08', 'aab3ea10-3a8e-11f0-8db3-dfb939df27fe', 8, '0'),
(321, '571e73f0-3a9f-11f0-9b5d-1bd6ebee1522', 1, 0, '2025-05-27 05:07:29', '2025-05-27 05:07:30', '571e73f0-3a9f-11f0-9b5d-1bd6ebee1522', 8, '0'),
(322, '56ff5dc0-3aa0-11f0-9b5d-1bd6ebee1522', 1, 0, '2025-05-27 05:14:39', '2025-05-27 05:14:39', '56ff5dc0-3aa0-11f0-9b5d-1bd6ebee1522', 8, '0'),
(323, '96c5c970-3b37-11f0-a2ec-8fa89f6ee882', 1, 0, '2025-05-27 23:17:19', '2025-05-27 23:17:19', '96c5c970-3b37-11f0-a2ec-8fa89f6ee882', 8, '0'),
(324, '4814a5a0-3b3a-11f0-a2ec-8fa89f6ee882', 1, 0, '2025-05-27 23:36:35', '2025-05-27 23:36:35', '4814a5a0-3b3a-11f0-a2ec-8fa89f6ee882', 8, '0'),
(325, 'a9f13840-3b3c-11f0-b210-4331462d520f', 1, 0, '2025-05-27 23:53:38', '2025-05-27 23:53:39', 'a9f13840-3b3c-11f0-b210-4331462d520f', 8, '0'),
(326, '1b124a40-3b3e-11f0-9fcf-a709ed7ec6d6', 1, 0, '2025-05-28 00:04:28', '2025-05-28 00:04:29', '1b124a40-3b3e-11f0-9fcf-a709ed7ec6d6', 8, '0'),
(329, '657581a0-3b44-11f0-b210-4331462d520f', 1, 0, '2025-05-28 00:48:59', '2025-05-28 00:49:00', '657581a0-3b44-11f0-b210-4331462d520f', 8, '0'),
(330, 'cc715640-3b44-11f0-b210-4331462d520f', 1, 0, '2025-05-28 00:51:52', '2025-05-28 00:51:52', 'cc715640-3b44-11f0-b210-4331462d520f', 8, '0'),
(331, '8804e610-3b45-11f0-b210-4331462d520f', 1, 0, '2025-05-28 00:57:07', '2025-05-28 00:57:07', '8804e610-3b45-11f0-b210-4331462d520f', 8, '0'),
(332, 'bfb3cfe0-3b45-11f0-b210-4331462d520f', 1, 0, '2025-05-28 00:58:40', '2025-05-28 00:58:40', 'bfb3cfe0-3b45-11f0-b210-4331462d520f', 8, '0'),
(334, '53455e90-3b46-11f0-b210-4331462d520f', 1, 0, '2025-05-28 01:02:48', '2025-05-28 01:02:48', '53455e90-3b46-11f0-b210-4331462d520f', 8, '0'),
(335, '18b41fe0-3b47-11f0-b210-4331462d520f', 1, 0, '2025-05-28 01:08:19', '2025-05-28 01:08:19', '18b41fe0-3b47-11f0-b210-4331462d520f', 8, '0'),
(341, '542e0080-3bac-11f0-8913-f57e137e5380', 1, 0, '2025-05-28 13:12:58', '2025-05-28 13:12:58', '542e0080-3bac-11f0-8913-f57e137e5380', 8, '0'),
(342, 'dca92920-3bad-11f0-8913-f57e137e5380', 1, 0, '2025-05-28 13:23:56', '2025-05-28 13:23:56', 'dca92920-3bad-11f0-8913-f57e137e5380', 8, '0'),
(343, 'ba8e3af0-3bb8-11f0-bc37-43ad550ce126', 1, 0, '2025-05-28 14:41:44', '2025-05-28 14:41:44', 'ba8e3af0-3bb8-11f0-bc37-43ad550ce126', 8, '0'),
(344, '5dc3edd0-3bbb-11f0-a6a7-b5b5ecab63c9', 1, 0, '2025-05-28 15:00:37', '2025-05-28 15:00:37', '5dc3edd0-3bbb-11f0-a6a7-b5b5ecab63c9', 8, '0'),
(347, '226e2260-3c87-11f0-83e2-1b1a7f8c24bc', 1, 0, '2025-05-29 15:19:13', '2025-05-29 15:19:13', '226e2260-3c87-11f0-83e2-1b1a7f8c24bc', 8, '0'),
(348, '892d2b10-3e06-11f0-ac1d-df29debebff4', 1, 0, '2025-05-31 13:03:46', '2025-05-31 13:03:46', '892d2b10-3e06-11f0-ac1d-df29debebff4', 8, '0'),
(349, 'ad0ea770-3e06-11f0-ac1d-df29debebff4', 1, 0, '2025-05-31 13:04:45', '2025-05-31 13:04:45', 'ad0ea770-3e06-11f0-ac1d-df29debebff4', 8, '0'),
(350, '1add9650-3e0a-11f0-afe4-fbee5c5bd0af', 1, 0, '2025-05-31 13:29:18', '2025-05-31 13:29:18', '1add9650-3e0a-11f0-afe4-fbee5c5bd0af', 8, '0'),
(367, '7ae93370-3f12-11f0-afe4-fbee5c5bd0af', 1, 0, '2025-06-01 21:01:45', '2025-06-01 21:01:46', '7ae93370-3f12-11f0-afe4-fbee5c5bd0af', 8, '0'),
(368, '564f6ce0-3fbd-11f0-8a94-09c0b34e3b0e', 1, 0, '2025-06-02 17:24:47', '2025-06-02 17:24:47', '564f6ce0-3fbd-11f0-8a94-09c0b34e3b0e', 8, '0'),
(369, '1de15c50-3fbe-11f0-8a94-09c0b34e3b0e', 1, 0, '2025-06-02 17:30:22', '2025-06-02 17:30:22', '1de15c50-3fbe-11f0-8a94-09c0b34e3b0e', 8, '0'),
(370, 'b63de090-3fbe-11f0-8a94-09c0b34e3b0e', 1, 0, '2025-06-02 17:34:38', '2025-06-02 17:34:38', 'b63de090-3fbe-11f0-8a94-09c0b34e3b0e', 8, '0'),
(372, '0c14fcc0-3fc3-11f0-8a94-09c0b34e3b0e', 1, 0, '2025-06-02 18:05:40', '2025-06-02 18:05:40', '0c14fcc0-3fc3-11f0-8a94-09c0b34e3b0e', 8, '0'),
(373, 'f8064b20-3fc3-11f0-8a94-09c0b34e3b0e', 1, 0, '2025-06-02 18:12:16', '2025-06-02 18:12:16', 'f8064b20-3fc3-11f0-8a94-09c0b34e3b0e', 8, '0'),
(374, 'abe7fca0-3fc5-11f0-8a94-09c0b34e3b0e', 1, 0, '2025-06-02 18:24:27', '2025-06-02 18:24:28', 'abe7fca0-3fc5-11f0-8a94-09c0b34e3b0e', 8, '0'),
(375, '9b966320-3fff-11f0-b8e8-6db2c5adc260', 1, 0, '2025-06-03 01:19:13', '2025-06-03 01:19:13', '9b966320-3fff-11f0-b8e8-6db2c5adc260', 8, '0'),
(376, '6f843eb0-4004-11f0-b8e8-6db2c5adc260', 1, 0, '2025-06-03 01:53:46', '2025-06-03 01:53:47', '6f843eb0-4004-11f0-b8e8-6db2c5adc260', 8, '0'),
(377, '66db5630-4005-11f0-b8e8-6db2c5adc260', 1, 0, '2025-06-03 02:00:41', '2025-06-03 02:00:41', '66db5630-4005-11f0-b8e8-6db2c5adc260', 8, '0'),
(378, '8815ce70-4005-11f0-b8e8-6db2c5adc260', 1, 0, '2025-06-03 02:01:37', '2025-06-03 02:01:37', '8815ce70-4005-11f0-b8e8-6db2c5adc260', 8, '0'),
(379, 'd4e09eb0-4005-11f0-b8e8-6db2c5adc260', 1, 0, '2025-06-03 02:03:45', '2025-06-03 02:03:46', 'd4e09eb0-4005-11f0-b8e8-6db2c5adc260', 8, '0'),
(380, 'f1af5860-4005-11f0-b8e8-6db2c5adc260', 1, 0, '2025-06-03 02:04:34', '2025-06-03 02:04:34', 'f1af5860-4005-11f0-b8e8-6db2c5adc260', 8, '0'),
(381, '9c001d30-40ca-11f0-8a6d-61cf7733a72f', 1, 0, '2025-06-04 01:32:21', '2025-06-04 01:32:21', '9c001d30-40ca-11f0-8a6d-61cf7733a72f', 8, '0'),
(382, 'e26b31a0-40cb-11f0-8a6d-61cf7733a72f', 1, 0, '2025-06-04 01:41:28', '2025-06-04 01:41:28', 'e26b31a0-40cb-11f0-8a6d-61cf7733a72f', 8, '0'),
(383, '693cbe60-40cc-11f0-8a6d-61cf7733a72f', 1, 0, '2025-06-04 01:45:14', '2025-06-04 01:45:14', '693cbe60-40cc-11f0-8a6d-61cf7733a72f', 8, '0'),
(384, 'e4583f20-40cc-11f0-8a6d-61cf7733a72f', 1, 0, '2025-06-04 01:48:40', '2025-06-04 01:48:41', 'e4583f20-40cc-11f0-8a6d-61cf7733a72f', 8, '0'),
(385, 'f996c160-40cf-11f0-9e66-cf5c97869f31', 1, 0, '2025-06-04 02:10:44', '2025-06-04 02:10:44', 'f996c160-40cf-11f0-9e66-cf5c97869f31', 8, '0'),
(386, '84c4ebb0-4137-11f0-8b07-531d7725a0e9', 1, 0, '2025-06-04 14:31:56', '2025-06-04 14:31:56', '84c4ebb0-4137-11f0-8b07-531d7725a0e9', 8, '0'),
(387, '628d0a30-4143-11f0-82aa-5ff48e336ecd', 1, 0, '2025-06-04 15:56:53', '2025-06-04 15:56:53', '628d0a30-4143-11f0-82aa-5ff48e336ecd', 8, '0'),
(388, '79514970-4143-11f0-82aa-5ff48e336ecd', 1, 0, '2025-06-04 15:57:31', '2025-06-04 15:57:31', '79514970-4143-11f0-82aa-5ff48e336ecd', 8, '0'),
(390, '65f023a0-4149-11f0-8ee0-17b82fd9682f', 1, 0, '2025-06-04 16:39:55', '2025-06-04 16:39:55', '65f023a0-4149-11f0-8ee0-17b82fd9682f', 8, '0'),
(417, '31998790-4662-11f0-a377-a9787c44f65e', 1, 0, '2025-06-11 04:20:01', '2025-06-11 04:20:02', '31998790-4662-11f0-a377-a9787c44f65e', 8, '0'),
(418, '6065f7c0-4662-11f0-ac8f-f18235981634', 1, 0, '2025-06-11 04:21:21', '2025-06-11 04:21:21', '6065f7c0-4662-11f0-ac8f-f18235981634', 8, '0'),
(419, 'ca491860-4663-11f0-a377-a9787c44f65e', 1, 0, '2025-06-11 04:31:27', '2025-06-11 04:31:28', 'ca491860-4663-11f0-a377-a9787c44f65e', 8, '0'),
(420, '783ed620-4674-11f0-bd23-832ebc4dcd69', 1, 0, '2025-06-11 06:30:57', '2025-06-11 06:30:57', '783ed620-4674-11f0-bd23-832ebc4dcd69', 8, '0'),
(422, '4c1ad8c0-46b8-11f0-b9eb-2dc27ad98de5', 1, 0, '2025-06-11 14:36:21', '2025-06-11 14:36:21', '4c1ad8c0-46b8-11f0-b9eb-2dc27ad98de5', 8, '0'),
(423, 'a7ad5640-46c2-11f0-be30-77eb97f672de', 1, 0, '2025-06-11 15:50:32', '2025-06-11 15:50:33', 'a7ad5640-46c2-11f0-be30-77eb97f672de', 127, '0'),
(424, '22a3baa0-46f6-11f0-911d-d16a58a8248e', 1, 0, '2025-06-11 21:59:06', '2025-06-11 21:59:06', '22a3baa0-46f6-11f0-911d-d16a58a8248e', 127, '0'),
(425, '13f3e4b0-46f8-11f0-8963-e54b47ba63af', 1, 0, '2025-06-11 22:12:55', '2025-06-11 22:12:56', '13f3e4b0-46f8-11f0-8963-e54b47ba63af', 127, '0'),
(426, 'bc0010c0-46f8-11f0-a93d-cbf04d6c1a02', 1, 0, '2025-06-11 22:17:38', '2025-06-11 22:17:39', 'bc0010c0-46f8-11f0-a93d-cbf04d6c1a02', 127, '0'),
(427, 'f00a38b0-46fc-11f0-90ea-5b9631dc288b', 1, 0, '2025-06-11 22:47:47', '2025-06-11 22:47:52', 'f00a38b0-46fc-11f0-90ea-5b9631dc288b', 127, '0'),
(428, '064fb8c0-4702-11f0-9b3e-f33d81d427e0', 1, 0, '2025-06-11 23:24:10', '2025-06-11 23:24:11', '064fb8c0-4702-11f0-9b3e-f33d81d427e0', 8, '0'),
(430, 'd065dfd0-47b7-11f0-883d-27e0fb2da8e7', 1, 0, '2025-06-12 21:05:27', '2025-06-12 21:05:27', 'd065dfd0-47b7-11f0-883d-27e0fb2da8e7', 127, '0'),
(431, '45fba740-484c-11f0-85c1-79f202847e71', 1, 0, '2025-06-13 14:48:10', '2025-06-13 14:48:10', '45fba740-484c-11f0-85c1-79f202847e71', 8, '0'),
(432, '5b25be80-484c-11f0-85c1-79f202847e71', 1, 0, '2025-06-13 14:48:45', '2025-06-13 14:48:45', '5b25be80-484c-11f0-85c1-79f202847e71', 8, '0'),
(433, '0b8f45f0-485e-11f0-8208-d5bfb8dfab67', 1, 0, '2025-06-13 16:55:21', '2025-06-13 16:55:22', '0b8f45f0-485e-11f0-8208-d5bfb8dfab67', 8, '0'),
(434, 'aceef5c0-485f-11f0-8208-d5bfb8dfab67', 1, 0, '2025-06-13 17:07:01', '2025-06-13 17:07:01', 'aceef5c0-485f-11f0-8208-d5bfb8dfab67', 8, '0'),
(435, 'eee56670-486a-11f0-8983-830cc69d31f8', 1, 0, '2025-06-13 18:27:47', '2025-06-13 18:27:48', 'eee56670-486a-11f0-8983-830cc69d31f8', 127, '0'),
(436, '18dc59c0-486b-11f0-8983-830cc69d31f8', 1, 0, '2025-06-13 18:28:47', '2025-06-13 18:28:47', '18dc59c0-486b-11f0-8983-830cc69d31f8', 127, '0'),
(437, '35b4fe80-486b-11f0-8983-830cc69d31f8', 1, 0, '2025-06-13 18:29:37', '2025-06-13 18:29:37', '35b4fe80-486b-11f0-8983-830cc69d31f8', 127, '0'),
(438, 'e21a2470-486b-11f0-8983-830cc69d31f8', 1, 0, '2025-06-13 18:34:27', '2025-06-13 18:34:27', 'e21a2470-486b-11f0-8983-830cc69d31f8', 127, '0'),
(439, '61ad38b0-486e-11f0-b35a-435d5656dbb0', 1, 0, '2025-06-13 18:52:18', '2025-06-13 18:52:19', '61ad38b0-486e-11f0-b35a-435d5656dbb0', 127, '0'),
(440, '79c28900-486e-11f0-8d12-01bce24456a6', 1, 0, '2025-06-13 18:53:00', '2025-06-13 18:53:00', '79c28900-486e-11f0-8d12-01bce24456a6', 127, '0'),
(441, '5dbc8110-486f-11f0-8d12-01bce24456a6', 1, 0, '2025-06-13 18:59:22', '2025-06-13 18:59:23', '5dbc8110-486f-11f0-8d12-01bce24456a6', 127, '0'),
(442, 'd6858650-486f-11f0-8d12-01bce24456a6', 1, 0, '2025-06-13 19:02:45', '2025-06-13 19:02:45', 'd6858650-486f-11f0-8d12-01bce24456a6', 127, '0'),
(443, '3e6c3020-4870-11f0-8d12-01bce24456a6', 1, 0, '2025-06-13 19:05:37', '2025-06-13 19:05:37', '3e6c3020-4870-11f0-8d12-01bce24456a6', 127, '0'),
(444, '83fa2070-4870-11f0-8d12-01bce24456a6', 1, 0, '2025-06-13 19:07:35', '2025-06-13 19:07:35', '83fa2070-4870-11f0-8d12-01bce24456a6', 127, '0'),
(445, '1c3d0230-4871-11f0-8d12-01bce24456a6', 1, 0, '2025-06-13 19:11:50', '2025-06-13 19:11:50', '1c3d0230-4871-11f0-8d12-01bce24456a6', 127, '0'),
(446, '04823880-4872-11f0-8d12-01bce24456a6', 1, 0, '2025-06-13 19:18:20', '2025-06-13 19:18:21', '04823880-4872-11f0-8d12-01bce24456a6', 127, '0'),
(447, '3ea41e20-4872-11f0-8d12-01bce24456a6', 1, 0, '2025-06-13 19:19:57', '2025-06-13 19:19:57', '3ea41e20-4872-11f0-8d12-01bce24456a6', 127, '0'),
(448, 'cdcd4240-4875-11f0-a9d3-9ff9dd6185a2', 1, 0, '2025-06-13 19:45:27', '2025-06-13 19:45:27', 'cdcd4240-4875-11f0-a9d3-9ff9dd6185a2', 127, '0'),
(449, '41b9c5c0-4876-11f0-a9d3-9ff9dd6185a2', 1, 0, '2025-06-13 19:48:39', '2025-06-13 19:48:39', '41b9c5c0-4876-11f0-a9d3-9ff9dd6185a2', 127, '0'),
(450, '97d54550-4877-11f0-b68e-893db0697887', 1, 0, '2025-06-13 19:58:13', '2025-06-13 19:58:13', '97d54550-4877-11f0-b68e-893db0697887', 127, '0'),
(451, '10547050-4878-11f0-9c06-35bf49cdae7f', 1, 0, '2025-06-13 20:01:35', '2025-06-13 20:01:35', '10547050-4878-11f0-9c06-35bf49cdae7f', 127, '0'),
(452, '12138570-4878-11f0-9c06-35bf49cdae7f', 1, 0, '2025-06-13 20:01:38', '2025-06-13 20:01:38', '12138570-4878-11f0-9c06-35bf49cdae7f', 127, '0'),
(453, '2385ebe0-4878-11f0-9c06-35bf49cdae7f', 1, 0, '2025-06-13 20:02:07', '2025-06-13 20:02:08', '2385ebe0-4878-11f0-9c06-35bf49cdae7f', 127, '0'),
(454, '678acb30-4878-11f0-9c06-35bf49cdae7f', 1, 0, '2025-06-13 20:04:02', '2025-06-13 20:04:02', '678acb30-4878-11f0-9c06-35bf49cdae7f', 127, '0'),
(455, '788ac0c0-4878-11f0-9c06-35bf49cdae7f', 1, 0, '2025-06-13 20:04:30', '2025-06-13 20:04:30', '788ac0c0-4878-11f0-9c06-35bf49cdae7f', 127, '0'),
(456, '39fba910-4890-11f0-8a67-5b82f658e83a', 1, 0, '2025-06-13 22:54:35', '2025-06-13 22:54:36', '39fba910-4890-11f0-8a67-5b82f658e83a', 127, '0'),
(457, 'a817ade0-4890-11f0-8a67-5b82f658e83a', 1, 0, '2025-06-13 22:57:39', '2025-06-13 22:57:39', 'a817ade0-4890-11f0-8a67-5b82f658e83a', 127, '0'),
(458, 'c507f950-4890-11f0-8ad5-59c0be79f9b7', 1, 0, '2025-06-13 22:58:30', '2025-06-13 22:58:30', 'c507f950-4890-11f0-8ad5-59c0be79f9b7', 127, '0'),
(459, 'e6f67f50-4890-11f0-8ad5-59c0be79f9b7', 1, 0, '2025-06-13 22:59:46', '2025-06-13 22:59:47', 'e6f67f50-4890-11f0-8ad5-59c0be79f9b7', 127, '0'),
(460, '85063640-4891-11f0-8ad5-59c0be79f9b7', 1, 0, '2025-06-13 23:03:55', '2025-06-13 23:03:55', '85063640-4891-11f0-8ad5-59c0be79f9b7', 127, '0'),
(461, '171c4020-48a0-11f0-82aa-67bbe8308f6d', 1, 0, '2025-06-14 00:48:09', '2025-06-14 00:48:10', '171c4020-48a0-11f0-82aa-67bbe8308f6d', 8, '0'),
(462, 'f6e38b00-48a0-11f0-a9c2-038c371da528', 1, 0, '2025-06-14 00:54:24', '2025-06-14 00:54:24', 'f6e38b00-48a0-11f0-a9c2-038c371da528', 8, '0'),
(463, '42470310-48a1-11f0-a9c2-038c371da528', 1, 0, '2025-06-14 00:56:31', '2025-06-14 00:56:31', '42470310-48a1-11f0-a9c2-038c371da528', 8, '0'),
(464, '5308ebf0-48a6-11f0-a7b3-232911cf6e80', 1, 0, '2025-06-14 01:32:47', '2025-06-14 01:32:47', '5308ebf0-48a6-11f0-a7b3-232911cf6e80', 127, '0'),
(465, '92788bb0-48a6-11f0-a7b3-232911cf6e80', 1, 0, '2025-06-14 01:35:32', '2025-06-14 01:35:34', '92788bb0-48a6-11f0-a7b3-232911cf6e80', 127, '0'),
(466, '780b08a0-48a8-11f0-a7b3-232911cf6e80', 1, 0, '2025-06-14 01:48:07', '2025-06-14 01:48:08', '780b08a0-48a8-11f0-a7b3-232911cf6e80', 127, '0'),
(467, '8a03c0a0-48a9-11f0-a7b3-232911cf6e80', 1, 0, '2025-06-14 01:55:46', '2025-06-14 01:55:47', '8a03c0a0-48a9-11f0-a7b3-232911cf6e80', 127, '0'),
(468, 'e4c8e790-48a9-11f0-a7b3-232911cf6e80', 1, 0, '2025-06-14 01:58:21', '2025-06-14 01:58:21', 'e4c8e790-48a9-11f0-a7b3-232911cf6e80', 127, '0'),
(469, 'e3602fd0-48a9-11f0-a7b3-232911cf6e80', 1, 0, '2025-06-14 01:59:06', '2025-06-14 01:59:08', 'e3602fd0-48a9-11f0-a7b3-232911cf6e80', 127, '0'),
(470, '0cb14630-48aa-11f0-a7b3-232911cf6e80', 1, 0, '2025-06-14 01:59:24', '2025-06-14 01:59:24', '0cb14630-48aa-11f0-a7b3-232911cf6e80', 127, '0'),
(471, '2e6c8730-48aa-11f0-a593-7bf53d96804c', 1, 0, '2025-06-14 02:00:26', '2025-06-14 02:00:26', '2e6c8730-48aa-11f0-a593-7bf53d96804c', 127, '0'),
(472, 'f2ac8c80-48aa-11f0-a593-7bf53d96804c', 1, 0, '2025-06-14 02:05:53', '2025-06-14 02:05:53', 'f2ac8c80-48aa-11f0-a593-7bf53d96804c', 127, '0'),
(473, 'f45f2910-48ab-11f0-bd4b-11d9d057687f', 1, 0, '2025-06-14 02:13:03', '2025-06-14 02:13:03', 'f45f2910-48ab-11f0-bd4b-11d9d057687f', 127, '0'),
(474, 'b95a19f0-48ac-11f0-b18d-65d161129b1b', 1, 0, '2025-06-14 02:18:39', '2025-06-14 02:18:40', 'b95a19f0-48ac-11f0-b18d-65d161129b1b', 127, '0'),
(475, 'e90a16e0-48ad-11f0-adc4-c91545a8129f', 1, 0, '2025-06-14 02:27:06', '2025-06-14 02:27:07', 'e90a16e0-48ad-11f0-adc4-c91545a8129f', 127, '0'),
(476, 'e8f7aae0-48ae-11f0-8024-15bb00ac7f37', 1, 0, '2025-06-14 02:34:15', '2025-06-14 02:34:15', 'e8f7aae0-48ae-11f0-8024-15bb00ac7f37', 127, '0'),
(477, '84c7d210-48af-11f0-9c20-05ed8ee71fd4', 1, 0, '2025-06-14 02:38:39', '2025-06-14 02:38:40', '84c7d210-48af-11f0-9c20-05ed8ee71fd4', 127, '0'),
(478, '29128950-48b0-11f0-8c90-13fedb05bac2', 1, 0, '2025-06-14 02:43:14', '2025-06-14 02:43:15', '29128950-48b0-11f0-8c90-13fedb05bac2', 127, '0'),
(479, '8c5155f0-48b0-11f0-8c90-13fedb05bac2', 1, 0, '2025-06-14 02:46:00', '2025-06-14 02:46:01', '8c5155f0-48b0-11f0-8c90-13fedb05bac2', 127, '0'),
(480, '4f851b60-48b1-11f0-8f20-f1965985bad8', 1, 0, '2025-06-14 02:51:26', '2025-06-14 02:51:26', '4f851b60-48b1-11f0-8f20-f1965985bad8', 127, '0'),
(481, '9538d650-4a29-11f0-b76f-79952a46af75', 1, 0, '2025-06-15 23:45:00', '2025-06-15 23:45:01', '9538d650-4a29-11f0-b76f-79952a46af75', 127, '0'),
(482, '3830a7c0-4a2a-11f0-b76f-79952a46af75', 1, 0, '2025-06-15 23:49:39', '2025-06-15 23:49:40', '3830a7c0-4a2a-11f0-b76f-79952a46af75', 127, '0'),
(483, '383562b0-4a2a-11f0-b76f-79952a46af75', 1, 0, '2025-06-15 23:49:42', '2025-06-15 23:49:42', '383562b0-4a2a-11f0-b76f-79952a46af75', 127, '0'),
(484, '3e603660-4a2a-11f0-b76f-79952a46af75', 1, 0, '2025-06-15 23:49:45', '2025-06-15 23:49:47', '3e603660-4a2a-11f0-b76f-79952a46af75', 127, '0'),
(485, '607d4670-4a2a-11f0-b76f-79952a46af75', 1, 0, '2025-06-15 23:50:33', '2025-06-15 23:50:33', '607d4670-4a2a-11f0-b76f-79952a46af75', 127, '0'),
(486, '8fa7dc30-4a2a-11f0-b76f-79952a46af75', 1, 0, '2025-06-15 23:51:53', '2025-06-15 23:51:53', '8fa7dc30-4a2a-11f0-b76f-79952a46af75', 127, '0'),
(487, 'cc24fa70-4a2b-11f0-b76f-79952a46af75', 1, 0, '2025-06-16 00:00:49', '2025-06-16 00:00:49', 'cc24fa70-4a2b-11f0-b76f-79952a46af75', 127, '0'),
(488, '9322f1d0-4a2d-11f0-abd9-f7e789da075a', 1, 0, '2025-06-16 00:13:29', '2025-06-16 00:13:30', '9322f1d0-4a2d-11f0-abd9-f7e789da075a', 127, '0'),
(489, '0bfea9d0-4a30-11f0-abd9-f7e789da075a', 1, 0, '2025-06-16 00:31:29', '2025-06-16 00:31:30', '0bfea9d0-4a30-11f0-abd9-f7e789da075a', 127, '0'),
(490, 'e2d351a0-4a34-11f0-8554-85adf2cfe7aa', 1, 0, '2025-06-16 01:05:50', '2025-06-16 01:05:50', 'e2d351a0-4a34-11f0-8554-85adf2cfe7aa', 127, '0'),
(491, '3f349c60-4a35-11f0-8554-85adf2cfe7aa', 1, 0, '2025-06-16 01:08:25', '2025-06-16 01:08:26', '3f349c60-4a35-11f0-8554-85adf2cfe7aa', 127, '0'),
(492, '42c78720-4a35-11f0-8554-85adf2cfe7aa', 1, 0, '2025-06-16 01:08:32', '2025-06-16 01:08:33', '42c78720-4a35-11f0-8554-85adf2cfe7aa', 127, '0'),
(493, '26c9e3a0-4a36-11f0-8554-85adf2cfe7aa', 1, 0, '2025-06-16 01:15:11', '2025-06-16 01:15:12', '26c9e3a0-4a36-11f0-8554-85adf2cfe7aa', 127, '0'),
(494, '2862d320-4a36-11f0-8554-85adf2cfe7aa', 1, 0, '2025-06-16 01:15:12', '2025-06-16 01:15:12', '2862d320-4a36-11f0-8554-85adf2cfe7aa', 127, '0'),
(495, '6e2a7110-4a36-11f0-8554-85adf2cfe7aa', 1, 0, '2025-06-16 01:16:53', '2025-06-16 01:16:53', '6e2a7110-4a36-11f0-8554-85adf2cfe7aa', 127, '0'),
(496, 'b46c2100-4a36-11f0-8554-85adf2cfe7aa', 1, 0, '2025-06-16 01:18:51', '2025-06-16 01:18:51', 'b46c2100-4a36-11f0-8554-85adf2cfe7aa', 127, '0'),
(497, 'e4cf84e0-4a36-11f0-8554-85adf2cfe7aa', 1, 0, '2025-06-16 01:20:12', '2025-06-16 01:20:12', 'e4cf84e0-4a36-11f0-8554-85adf2cfe7aa', 127, '0'),
(498, '67885510-4a37-11f0-8554-85adf2cfe7aa', 1, 0, '2025-06-16 01:24:04', '2025-06-16 01:24:05', '67885510-4a37-11f0-8554-85adf2cfe7aa', 127, '0'),
(499, 'd4c2d380-4a37-11f0-8554-85adf2cfe7aa', 1, 0, '2025-06-16 01:26:55', '2025-06-16 01:26:55', 'd4c2d380-4a37-11f0-8554-85adf2cfe7aa', 127, '0'),
(500, '10c16860-4a38-11f0-8554-85adf2cfe7aa', 1, 0, '2025-06-16 01:28:34', '2025-06-16 01:28:34', '10c16860-4a38-11f0-8554-85adf2cfe7aa', 127, '0'),
(501, '5a175d30-4a38-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:30:36', '2025-06-16 01:30:36', '5a175d30-4a38-11f0-9832-85044895b143', 127, '0'),
(502, '81ae4070-4a38-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:31:42', '2025-06-16 01:31:42', '81ae4070-4a38-11f0-9832-85044895b143', 127, '0'),
(503, 'a8fd9360-4a38-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:32:48', '2025-06-16 01:32:48', 'a8fd9360-4a38-11f0-9832-85044895b143', 127, '0'),
(504, 'cf74aec0-4a38-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:33:53', '2025-06-16 01:33:54', 'cf74aec0-4a38-11f0-9832-85044895b143', 127, '0'),
(505, 'f36baef0-4a38-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:34:53', '2025-06-16 01:34:53', 'f36baef0-4a38-11f0-9832-85044895b143', 127, '0'),
(506, '17999da0-4a39-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:35:55', '2025-06-16 01:35:55', '17999da0-4a39-11f0-9832-85044895b143', 127, '0'),
(507, '39ce7b70-4a39-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:36:51', '2025-06-16 01:36:52', '39ce7b70-4a39-11f0-9832-85044895b143', 127, '0'),
(508, '64fc4110-4a39-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:38:04', '2025-06-16 01:38:04', '64fc4110-4a39-11f0-9832-85044895b143', 127, '0'),
(509, 'a6dd5600-4a39-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:39:55', '2025-06-16 01:39:55', 'a6dd5600-4a39-11f0-9832-85044895b143', 127, '0'),
(510, 'd6bd8020-4a39-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:41:15', '2025-06-16 01:41:15', 'd6bd8020-4a39-11f0-9832-85044895b143', 127, '0'),
(511, '3a2c0f50-4a3a-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:44:01', '2025-06-16 01:44:01', '3a2c0f50-4a3a-11f0-9832-85044895b143', 127, '0'),
(512, '8492fef0-4a3a-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:46:08', '2025-06-16 01:46:08', '8492fef0-4a3a-11f0-9832-85044895b143', 127, '0'),
(513, 'b92f9fb0-4a3a-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:47:35', '2025-06-16 01:47:35', 'b92f9fb0-4a3a-11f0-9832-85044895b143', 127, '0'),
(514, 'f8640b30-4a3a-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:49:21', '2025-06-16 01:49:21', 'f8640b30-4a3a-11f0-9832-85044895b143', 127, '0'),
(515, '37507130-4a3b-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:51:06', '2025-06-16 01:51:07', '37507130-4a3b-11f0-9832-85044895b143', 127, '0'),
(516, '60944120-4a3b-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:52:16', '2025-06-16 01:52:16', '60944120-4a3b-11f0-9832-85044895b143', 127, '0'),
(517, 'b7709520-4a3b-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:54:41', '2025-06-16 01:54:41', 'b7709520-4a3b-11f0-9832-85044895b143', 127, '0'),
(518, 'e89aa460-4a3b-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:56:04', '2025-06-16 01:56:05', 'e89aa460-4a3b-11f0-9832-85044895b143', 127, '0'),
(519, '3d452440-4a3c-11f0-9832-85044895b143', 1, 0, '2025-06-16 01:58:26', '2025-06-16 01:58:26', '3d452440-4a3c-11f0-9832-85044895b143', 127, '0'),
(520, 'adb74e10-4a3c-11f0-9832-85044895b143', 1, 0, '2025-06-16 02:01:37', '2025-06-16 02:01:38', 'adb74e10-4a3c-11f0-9832-85044895b143', 127, '0'),
(521, 'aefe9b20-4a3c-11f0-9832-85044895b143', 1, 0, '2025-06-16 02:01:40', '2025-06-16 02:01:40', 'aefe9b20-4a3c-11f0-9832-85044895b143', 127, '0'),
(522, '115f8ae0-4a3d-11f0-9832-85044895b143', 1, 0, '2025-06-16 02:04:24', '2025-06-16 02:04:24', '115f8ae0-4a3d-11f0-9832-85044895b143', 127, '0'),
(523, '14408ac0-4a3d-11f0-9832-85044895b143', 1, 0, '2025-06-16 02:04:28', '2025-06-16 02:04:28', '14408ac0-4a3d-11f0-9832-85044895b143', 127, '0'),
(524, '2ddd8c80-4a3d-11f0-9832-85044895b143', 1, 0, '2025-06-16 02:05:16', '2025-06-16 02:05:17', '2ddd8c80-4a3d-11f0-9832-85044895b143', 127, '0'),
(525, '6f0b08e0-4a3d-11f0-9fb1-d1b1df64b8e4', 1, 0, '2025-06-16 02:06:59', '2025-06-16 02:07:00', '6f0b08e0-4a3d-11f0-9fb1-d1b1df64b8e4', 127, '0'),
(526, 'a0044420-4a3d-11f0-9fb1-d1b1df64b8e4', 1, 0, '2025-06-16 02:08:25', '2025-06-16 02:08:25', 'a0044420-4a3d-11f0-9fb1-d1b1df64b8e4', 127, '0'),
(527, 'd0de3790-4a3d-11f0-9fb1-d1b1df64b8e4', 1, 0, '2025-06-16 02:09:43', '2025-06-16 02:09:44', 'd0de3790-4a3d-11f0-9fb1-d1b1df64b8e4', 127, '0'),
(528, 'f3506c80-4a3d-11f0-9fb1-d1b1df64b8e4', 1, 0, '2025-06-16 02:10:45', '2025-06-16 02:10:46', 'f3506c80-4a3d-11f0-9fb1-d1b1df64b8e4', 127, '0'),
(529, '17713bd0-4a3e-11f0-9530-37a2102f642a', 1, 0, '2025-06-16 02:11:45', '2025-06-16 02:11:45', '17713bd0-4a3e-11f0-9530-37a2102f642a', 127, '0'),
(530, '3da95260-4a3e-11f0-9530-37a2102f642a', 1, 0, '2025-06-16 02:12:48', '2025-06-16 02:12:48', '3da95260-4a3e-11f0-9530-37a2102f642a', 127, '0'),
(531, '72762ae0-4a3e-11f0-9530-37a2102f642a', 1, 0, '2025-06-16 02:14:17', '2025-06-16 02:14:17', '72762ae0-4a3e-11f0-9530-37a2102f642a', 127, '0'),
(532, 'a60a8360-4a3e-11f0-9530-37a2102f642a', 1, 0, '2025-06-16 02:15:42', '2025-06-16 02:15:43', 'a60a8360-4a3e-11f0-9530-37a2102f642a', 127, '0'),
(533, '27d3ea80-4a3f-11f0-b3ac-eff237e314e6', 1, 0, '2025-06-16 02:19:20', '2025-06-16 02:19:21', '27d3ea80-4a3f-11f0-b3ac-eff237e314e6', 127, '0'),
(534, '5f32b880-4a3f-11f0-b3ac-eff237e314e6', 1, 0, '2025-06-16 02:20:54', '2025-06-16 02:20:54', '5f32b880-4a3f-11f0-b3ac-eff237e314e6', 127, '0'),
(535, 'd16fde50-4a3f-11f0-b3ac-eff237e314e6', 1, 0, '2025-06-16 02:24:03', '2025-06-16 02:24:04', 'd16fde50-4a3f-11f0-b3ac-eff237e314e6', 127, '0'),
(536, '2db1e140-4a40-11f0-b3ac-eff237e314e6', 1, 0, '2025-06-16 02:26:38', '2025-06-16 02:26:38', '2db1e140-4a40-11f0-b3ac-eff237e314e6', 127, '0'),
(537, 'b0be64d0-4a42-11f0-a809-6d1ff907b90a', 1, 0, '2025-06-16 02:44:37', '2025-06-16 02:44:38', 'b0be64d0-4a42-11f0-a809-6d1ff907b90a', 127, '0'),
(538, 'd87d6980-4a42-11f0-a809-6d1ff907b90a', 1, 0, '2025-06-16 02:45:44', '2025-06-16 02:45:44', 'd87d6980-4a42-11f0-a809-6d1ff907b90a', 127, '0'),
(539, '8aba8830-4a43-11f0-a809-6d1ff907b90a', 1, 0, '2025-06-16 02:50:42', '2025-06-16 02:50:43', '8aba8830-4a43-11f0-a809-6d1ff907b90a', 127, '0'),
(540, 'e5c5dfe0-4a43-11f0-a809-6d1ff907b90a', 1, 0, '2025-06-16 02:53:15', '2025-06-16 02:53:16', 'e5c5dfe0-4a43-11f0-a809-6d1ff907b90a', 127, '0'),
(541, 'bb7bce10-4a44-11f0-bb2e-6df48f7298ac', 1, 0, '2025-06-16 02:59:16', '2025-06-16 02:59:17', 'bb7bce10-4a44-11f0-bb2e-6df48f7298ac', 127, '0'),
(542, 'd1b0c5a0-4a44-11f0-bb2e-6df48f7298ac', 1, 0, '2025-06-16 02:59:54', '2025-06-16 02:59:56', 'd1b0c5a0-4a44-11f0-bb2e-6df48f7298ac', 127, '0'),
(543, '190e45d0-4a45-11f0-bb2e-6df48f7298ac', 1, 0, '2025-06-16 03:01:51', '2025-06-16 03:01:51', '190e45d0-4a45-11f0-bb2e-6df48f7298ac', 127, '0'),
(544, '370c30b0-4a45-11f0-bb2e-6df48f7298ac', 1, 0, '2025-06-16 03:02:42', '2025-06-16 03:02:42', '370c30b0-4a45-11f0-bb2e-6df48f7298ac', 127, '0'),
(545, '99635c70-4a45-11f0-bb2e-6df48f7298ac', 1, 0, '2025-06-16 03:05:26', '2025-06-16 03:05:27', '99635c70-4a45-11f0-bb2e-6df48f7298ac', 127, '0'),
(546, 'ccbcf5e0-4a45-11f0-9f5e-67168ca38b56', 1, 0, '2025-06-16 03:06:52', '2025-06-16 03:06:53', 'ccbcf5e0-4a45-11f0-9f5e-67168ca38b56', 127, '0'),
(547, 'b74a11a0-4a4c-11f0-8231-51d8bf13df8d', 1, 0, '2025-06-16 03:56:21', '2025-06-16 03:56:22', 'b74a11a0-4a4c-11f0-8231-51d8bf13df8d', 8, '0'),
(548, 'bca3d840-4ad1-11f0-a28f-853553b76523', 1, 0, '2025-06-16 19:48:39', '2025-06-16 19:48:39', 'bca3d840-4ad1-11f0-a28f-853553b76523', 127, '0'),
(549, '0974c300-4ad2-11f0-a28f-853553b76523', 1, 0, '2025-06-16 19:50:44', '2025-06-16 19:50:45', '0974c300-4ad2-11f0-a28f-853553b76523', 127, '0'),
(550, '48e7be20-4ad2-11f0-a28f-853553b76523', 1, 0, '2025-06-16 19:52:38', '2025-06-16 19:52:39', '48e7be20-4ad2-11f0-a28f-853553b76523', 127, '0'),
(551, '73eec1e0-4ad2-11f0-a28f-853553b76523', 1, 0, '2025-06-16 19:53:43', '2025-06-16 19:53:44', '73eec1e0-4ad2-11f0-a28f-853553b76523', 127, '0'),
(552, '8d29a670-4ad2-11f0-a28f-853553b76523', 1, 0, '2025-06-16 19:54:25', '2025-06-16 19:54:25', '8d29a670-4ad2-11f0-a28f-853553b76523', 127, '0'),
(553, 'a5a0c5d0-4ad2-11f0-a28f-853553b76523', 1, 0, '2025-06-16 19:55:08', '2025-06-16 19:55:08', 'a5a0c5d0-4ad2-11f0-a28f-853553b76523', 127, '0'),
(554, 'd04229f0-4ad2-11f0-9704-d363fd19231a', 1, 0, '2025-06-16 19:56:17', '2025-06-16 19:56:18', 'd04229f0-4ad2-11f0-9704-d363fd19231a', 127, '0'),
(555, 'f27029f0-4ad2-11f0-9704-d363fd19231a', 1, 0, '2025-06-16 19:57:18', '2025-06-16 19:57:19', 'f27029f0-4ad2-11f0-9704-d363fd19231a', 127, '0'),
(556, '65da4190-4ad4-11f0-9704-d363fd19231a', 1, 0, '2025-06-16 20:07:40', '2025-06-16 20:07:40', '65da4190-4ad4-11f0-9704-d363fd19231a', 127, '0'),
(557, '86e2ad50-4ad4-11f0-a3df-a7717da7888f', 1, 0, '2025-06-16 20:08:33', '2025-06-16 20:08:33', '86e2ad50-4ad4-11f0-a3df-a7717da7888f', 127, '0'),
(558, 'a3de1c50-4ad4-11f0-aeba-0b07bd40eb12', 1, 0, '2025-06-16 20:09:28', '2025-06-16 20:09:28', 'a3de1c50-4ad4-11f0-aeba-0b07bd40eb12', 127, '0'),
(559, '9dc92520-4ad5-11f0-aeba-0b07bd40eb12', 1, 0, '2025-06-16 20:16:21', '2025-06-16 20:16:21', '9dc92520-4ad5-11f0-aeba-0b07bd40eb12', 127, '0'),
(560, 'bfda7560-4ad5-11f0-a5bd-195bd1974c45', 1, 0, '2025-06-16 20:17:18', '2025-06-16 20:17:18', 'bfda7560-4ad5-11f0-a5bd-195bd1974c45', 127, '0'),
(561, 'da842c30-4ad5-11f0-a5bd-195bd1974c45', 1, 0, '2025-06-16 20:18:03', '2025-06-16 20:18:04', 'da842c30-4ad5-11f0-a5bd-195bd1974c45', 127, '0'),
(562, '1f6bf170-4ad6-11f0-a5bd-195bd1974c45', 1, 0, '2025-06-16 20:19:58', '2025-06-16 20:19:58', '1f6bf170-4ad6-11f0-a5bd-195bd1974c45', 127, '0'),
(563, '414e9090-4ad6-11f0-a5bd-195bd1974c45', 1, 0, '2025-06-16 20:20:55', '2025-06-16 20:20:55', '414e9090-4ad6-11f0-a5bd-195bd1974c45', 127, '0'),
(564, '584fb1c0-4ad6-11f0-a5bd-195bd1974c45', 1, 0, '2025-06-16 20:21:35', '2025-06-16 20:21:35', '584fb1c0-4ad6-11f0-a5bd-195bd1974c45', 127, '0'),
(565, '37f08f50-4c8c-11f0-b81d-958ffc53cceb', 1, 0, '2025-06-19 00:35:58', '2025-06-19 00:35:58', '37f08f50-4c8c-11f0-b81d-958ffc53cceb', 8, '0'),
(566, '6a6e8aa0-4ce0-11f0-afe9-f5169d12d6b7', 1, 0, '2025-06-19 10:38:42', '2025-06-19 10:38:43', '6a6e8aa0-4ce0-11f0-afe9-f5169d12d6b7', 127, '0'),
(567, 'b00db900-4ce0-11f0-afe9-f5169d12d6b7', 1, 0, '2025-06-19 10:40:38', '2025-06-19 10:40:38', 'b00db900-4ce0-11f0-afe9-f5169d12d6b7', 127, '0'),
(568, '56a15860-4ced-11f0-8742-830f50e1ac84', 1, 0, '2025-06-19 12:11:12', '2025-06-19 12:11:12', '56a15860-4ced-11f0-8742-830f50e1ac84', 127, '0'),
(569, 'ee397b30-4ced-11f0-8742-830f50e1ac84', 1, 0, '2025-06-19 12:15:28', '2025-06-19 12:15:29', 'ee397b30-4ced-11f0-8742-830f50e1ac84', 127, '0'),
(570, '0588bc60-4cee-11f0-8742-830f50e1ac84', 1, 0, '2025-06-19 12:16:08', '2025-06-19 12:16:08', '0588bc60-4cee-11f0-8742-830f50e1ac84', 127, '0'),
(571, '269f0ad0-4cee-11f0-8742-830f50e1ac84', 1, 0, '2025-06-19 12:17:06', '2025-06-19 12:17:06', '269f0ad0-4cee-11f0-8742-830f50e1ac84', 127, '0'),
(572, '26a3c5c0-4cee-11f0-8742-830f50e1ac84', 1, 0, '2025-06-19 12:17:08', '2025-06-19 12:17:08', '26a3c5c0-4cee-11f0-8742-830f50e1ac84', 127, '0'),
(573, 'c29816c0-4cee-11f0-8742-830f50e1ac84', 1, 0, '2025-06-19 12:21:31', '2025-06-19 12:21:31', 'c29816c0-4cee-11f0-8742-830f50e1ac84', 127, '0'),
(574, 'aed7c2e0-4d55-11f0-bcd3-4b86c85e9ba5', 1, 0, '2025-06-20 00:38:09', '2025-06-20 00:38:10', 'aed7c2e0-4d55-11f0-bcd3-4b86c85e9ba5', 127, '0'),
(575, '161bd930-4d58-11f0-bcd3-4b86c85e9ba5', 1, 0, '2025-06-20 00:55:30', '2025-06-20 00:55:31', '161bd930-4d58-11f0-bcd3-4b86c85e9ba5', 127, '0'),
(576, '6bc359e0-4d5c-11f0-b427-9f1ada42f24d', 1, 0, '2025-06-20 01:26:22', '2025-06-20 01:26:23', '6bc359e0-4d5c-11f0-b427-9f1ada42f24d', 127, '0'),
(577, '312a2bf0-4d5d-11f0-b427-9f1ada42f24d', 1, 0, '2025-06-20 01:31:56', '2025-06-20 01:31:57', '312a2bf0-4d5d-11f0-b427-9f1ada42f24d', 127, '0'),
(578, '5e27f6a0-4d5d-11f0-b427-9f1ada42f24d', 1, 0, '2025-06-20 01:33:09', '2025-06-20 01:33:09', '5e27f6a0-4d5d-11f0-b427-9f1ada42f24d', 127, '0'),
(579, 'aae58070-4d5d-11f0-b427-9f1ada42f24d', 1, 0, '2025-06-20 01:35:19', '2025-06-20 01:35:20', 'aae58070-4d5d-11f0-b427-9f1ada42f24d', 127, '0');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policies`
--

CREATE TABLE `privacy_policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privacy_policies`
--

INSERT INTO `privacy_policies` (`id`, `content`, `created_at`, `updated_at`) VALUES
(1, 'سياسة الاستخدام والخصوصية\r\nمقدّمة اتفاقية الاستخدام:\r\nتطبيقنا يرحّب بكم ويبلغكم بأنكم سوف تجدون أدناه الشروط والأحكام المُنظّمة لاستخدامكم لهذا التطبيق وكافة الآثار القانونية التي تنتج عن استخدامكم لخدمات التطبيق عبر الشبكة المعلوماتية، حيث إن استخدامكم للتطبيق سواءً كنت مستهلكاً لخدمة أو لمنتج أو غير ذلك فإن هذا موافقة وقبول منك وأنت بكامل أهليتك المعتبرة شرعاً لكافة مواد وأحكام هذه الاتفاقية وهو تأكيد لالتزامكم بقوانينا ولما ذُكر فيها، وتسري هذه الاتفاقية على جميع أنواع التعامل بيننا وبينكم.\r\nوتعتبر هذه الاتفاقية سارية المفعول ونافذة بمجرد قيامكم بالموافقة عليها والبدء في التسجيل بالتطبيق بموجب المادة العاشرة من نظام التعاملات الإلكترونية السعودي الصادر بالمرسوم الملكي رقم (م/18) وتاريخ 8 / 3 / 1428هـ.\r\n\r\nالمادة الأولى - المقدّمة والتعريفات:\r\nيعتبر التمهيد أعلاه جزءاً لا يتجزأ من هذه الاتفاقية ، كما تجدون أدناه الدلالات والتعريفات للعبارات الرئيسية المستهلكة في هذه الاتفاقية :\r\n\r\n1- ( التطبيق ) ويشمل هذا التعريف كافة أشكال التطبيق على الشبكة المعلوماتية، سواءً كانت تطبيق إلكتروني، أو موقع الكتروني على الشبكة العنكبوتية.\r\n\r\n2- ( المستهلك) الشخص الذي يتعامل بالتجارة الإلكترونية رغبةً في الحصول على المنتجات أو الخدمات التي يوفرها من المتجر عبر منصته الإلكترونية.\r\n\r\n3- ( الاتفاقية ) يقصَد بهذه العبارة شروط وأحكام هذه الاتفاقية، والتي تحكم وتنظّم العلاقة فيما بين أطراف هذه الاتفاقية.\r\n\r\nالمادة الثانية - أهلية المستهلك القانونية:\r\n1- يقر المستهلك بأنه ذا أهلية قانونية معتبرة شرعاً ونظاماً للتعامل مع المتجر، وأن عمره لا يقل عن ثمانية عشر عاماً.\r\n\r\n2- يوافق المستهلك بأنه في حال مخالفته لهذه المادة، فإنه يتحمّل تبعات هذه المخالفة أمام الغير.\r\n\r\nالمادة الثالثة - طبيعة الالتزام:\r\n1- إن التزام التطبيق تجاه المستهلكين هو توفير ( الخدمة أو المنتج ) .\r\n\r\n2- قد يوفّر التطبيق خدمات أخرى كخدمات ما بعد البيع أو غيرها من الخدمات ذات العلاقة، وذلك يعود لطبيعة ونوع ( الخدمة أو المنتج ) المطلوبة من المستهلك.\r\n\r\nالمادة الرابعة - ضوابط الاستخدام :\r\n1- يلتزم المستهلك باستخدام المنصة الالكترونية الخاصة بالتطبيق بما يتّفق مع الآداب العامة والأنظمة المعمول بها في المملكة العربية السعودية.\r\n\r\n2- يلتزم المستهلك عند شرائه لخدمة أو منتج من هذا المتجر ألا يستخدم هذه الخدمة أو المنتج بما يخالف الآداب العامة والأنظمة المعمول بها في المملكة العربية السعودية.\r\n\r\n3- في حال تبين لنا قيام المستهلك بمخالفة الآداب العامة والأنظمة المعمول بها في المملكة العربية السعودية فإنه يحق لنا فسخ العقد دون الرجوع إلى المستهلك.\r\n\r\nالمادة الخامسة - الحسابات والتزامات التسجيل:\r\nفور التقدم بطلب الانضمام إلى عضوية في هذا التطبيق كمستخدم تكون ملتزماً بالإفصاح عن معلومات محددة واختيار اسم مستخدم وكلمة مرور سرية لاستعمالها عند الولوج لخدمات التطبيق. وبذلك تكون قد وافقت على:\r\n\r\n1- أن تكون مسؤولاً عن المحافظة على سرية معلومات حسابك وسرية كلمة المرور ، وتكون بذلك موافقاً على إعلام هذا التطبيق حالاً بأي استخدام غير مفوض به لمعلومات حسابك لدى المتجر أو أي اختراق آخر لمعلوماتك السرية.\r\n\r\n2- لن يكون التطبيق بأي حال من الأحوال مسؤولاً عن أي خسارة قد تلحق بك بشكل مباشر أو غير مباشر معنويا أو ماديا نتيجة كشف معلومات اسم المستهلك أو كلمة الدخول.\r\n\r\n3- أنت تلتزم باستخدام حسابك أو عضويتك لدى المتجر بنفسك، حيث إنك مسؤول عنه مسؤولية كاملة، وإن قمت بتفويض غيرك  فليس علينا مسؤولية وليس لدينا صلاحية لإبداء الموافقة من عدمها.\r\n\r\n4- أنت تلتزم عند استخدام المتجر أن تستخدمها بكل جدية ومصداقية.\r\n\r\n5- أنت تلتزم بالإفصاح عن معلومات حقيقية وصحيحة ومحدثة و كاملة وقانونية عن نفسك حسبما هو مطلوب أثناء التسجيل لدى المتجر وتلتزم بتحديث بياناتك حال الحاجة إلى ذلك.\r\n\r\n6- إن تطبيقنا يلتزم بالتعامل مع معلوماتك الشخصية وعناوين الاتصال بك بسريّة تامة.\r\n\r\n7- إذا تبيّن للمتجر بأنك أفصحت عن معلومات غير حقيقية أو غير صحيحة أو غير راهنة أو غير كاملة أو غير قانونية أو مخالفة لما جاء في اتفاقية الاستخدام، فإن المتجر يمتلك الحق في وقف أو تجميد أو إلغاء عضويتك أو متجرك وحسابك في المنصة، وذلك دون إلحاق الأضرار بحقوق المتجر الأخرى ووسائلها المشروعة في استرداد حقوقها وحماية باقي المستهلكين.\r\n\r\n8- في حالة عدم الالتزام بأي مما ورد أعلاه فإن لإدارة المتجر الحق في إيقاف أو إلغاء حسابك أو عضويتك أو حجبك من الولوج لخدمات التطبيق مرة أخرى.\r\n\r\nالمادة السادسة - الاتصالات الإلكترونية ووسائل التواصل الرسمية:\r\n1- يوافق أطراف هذه الاتفاقية على أن التواصل يتم عبر الرقم المسجّل في المنصّة.\r\n\r\n2- يوافق المستهلك على أن جميع الاتفاقيات والإعلانات والبيانات والاتصالات الأخرى التي تزود بها إلكترونياً تقوم مقام مثيلاتها المكتوبة ، وهي حجة قائمة بذاتها ، في تلبية الاحتياجات النظامية والشرعية.\r\n\r\n3- يوافق المستهلك على إمكانية التواصل معه وتبليغه بأي أحكام تخص هذه الاتفاقية أو تخص التعامل معه من خلال قيام إدارة التطبيق ببث رسائل عامة ترد إلى كافة المستهلكين أو إلى مستخدمين محددين للتطبيق\r\n\r\nالمادة السابعة - التعديلات على اتفاقية الاستخدام والرسوم:\r\n1- في حال إلغاء أي مادة واردة أو بند ورد في ھذه الاتفاقیة أو أنّ ھناك أي مادة واردة أو أي بند ورد في ھذه الاتفاقیة لم یعد نافذًا، فإن مثل ھذا الأمر لا يلغي صلاحية باقي المواد والبنود والقواعد والأحكام الواردة في ھذه الاتفاقية وتظل سارية حتى إشعار آخر من إدارة المتجر.\r\n\r\n2- يحق للمتجر تحديث الشروط والأحكام بناء على ما يستجد على أنه يلتزم بإخطار المستهلك بتحديثه متى ما وجد، على أن ما تم بيعه من منافع وأعيان تنطبق عليه الأحكام الشرعية في لزومه وصحته.\r\n\r\n3- قد يفرض التطبيق رسومًا على بعض المستهلكين وذلك يعتمد على العروض أو المنتجات أو الخدمات التي يطلبونها أو ما تفرضه الدولة من رسوم أو ضرائب على طبيعة المنتج أو الخدمة.\r\n\r\n4- يحتفظ المتجر بحقه في إضافة أو زيادة أو خفض أو خصم أي رسوم أو نفقات بموجب مواد وبنود وأحكام اتفاقية الاستخدام ، على أي من المستهلكين أيا كان سبب تسجيلهم.\r\n\r\nالمادة الثامنة – خدمات الدفع والسداد للمتاجر في التطبيق\r\n1- يوفّر التطبيق عبر شركائه نظام الدفع والسداد عبر الانترنت كليا من خلال خيارات الدفع المتوفرة على التطبيق أو من خلال أي طريقة دفع يوفرها التطبيق من حين لآخر.\r\n\r\n2- يلتزم التطبيق بتحديد سعر الخدمة أو المنتج الذي يقوم بعرضه في متجره وفقاً للقيمة السوقية المتعارف عليها.\r\n\r\n3- يلتزم التطبيق بتوفير فواتير وسندات قبض وسندات استلام لجميع المبالغ والأرباح التي تنشأ في المتجر، ويلتزم بأن يعطي المستهلك فاتورة شرائه لخدمة أو منتج.\r\n\r\n4- يلتزم التطبيق بتوفير المواصفات المحاسبية المتعارف عليها في التطبيق ، تطبيقاً لأحكام هذه الاتفاقية، ولما في هذا التنظيم من مصالح قانونية واقتصادية وتجارية وتنظيمية .\r\n\r\nالمادة التاسعة – الملكية الفكرية:\r\n1- إن حقوق الملكية الفكرية الخاصة بالتطبيق هي حقوق مملوكة للتطبيق ملكية تامة، سواءً كانت مملوكة لهم قبل تأسيس هذه المنصة الإلكترونية أو بعد تأسيسها .\r\n\r\n2- يحترم المستهلك حقوق الملكية الفكرية الخاصة بالتطبيق، والتي من ضمنها اسم المتجر نفسه، والكلمات والشعارات والرموز الأخرى الخاصة بالتطبيق أو المعروضة عليه، حيث أن كل حق يتبع باسم التطبيق هي حقوق مملوكة ملكية فكرية كاملة للتطبيق\r\n\r\nالمادة العاشرة - مسؤولية التطبيق:\r\n1- يلتزم التطبيق بأن يمارس عمله التجاري عبر هذه المنصة الإلكترونية بشكل نظامي ووفقاً للأنظمة المعمول بها في المملكة العربية السعودية، ووفقاً لأحكام هذه الاتفاقية.\r\n\r\n2- المتجر لا يتحمل أي مطالبات تنشأ عن أخطاء أو إهمال ، سواء كانت ناتجة بشكل مباشر أو غير مباشر أو عرضي أو عن طريق المستهلك.\r\n\r\n3- يلتزم ( اسم التطبيق ) ومنسوبوها ومُلّاكها ومن يمثّلهم بأن يكون ( المنتج أو الخدمة ) سليمة و شرعية و مصرح به وفق أنظمة المملكة العربية السعودية ويتم استخدامه لأغراض شرعية.\r\n\r\nالمادة الحادية عشر - تقييد الولوج أو العضوية:\r\nيمكن للتطبيق وقف أو إلغاء عضوية المستهلك أو تقييد ولوج المستهلك إلى خدمات المنصة في أي وقت وبدون إنذار ولأي سبب، ودون تحديد.\r\n\r\nالمادة الثانية عشر - القانون أو النظام الواجب التطبيق:\r\nاتفاقية الاستخدام هذه محكومة ومصاغة بحسب القوانين والأنظمة والتشريعات المعمول بها والسارية في المملكة العربية السعودية ، وهي خاضعة تمامًا وكليًا للأنظمة المعمول بها لدى السلطات في المملكة العربية السعودية.\r\n(المادة الثانية عشر: التنازع والقضاء:\r\nيلتزم أطراف الدعوى في الأنظمة والتشريعات المعمول بها في المملكة العربية السعودية، وبما نصت عليه هذه الاتفاقية، وفي حال التنازع فإن الاختصاص المكاني ينعقد في مدينة (بريدة) في منطقة (القصيم).)\r\n\r\n\r\nالمادة الثالثة عشر- أحكام عامة:\r\nفي حال إلغاء أو عدم نفاذ أي مادة واردة أو بند وارد في اتفاقية الاستخدام هذه فإن مثل هذا الأمر لا يلغي صلاحية باقي المواد والبنود والأحكام الواردة في اتفاقية الاستخدام وتظل سارية حتى إشعار آخر من إدارة المتجر.\r\n\r\n[تفاقية الاستخدام هذه - والتي قد تعدل بين حين وآخر بحسب مقتضى الحال - تُشكّل إتفاقية الإستخدام وآلية العمل والتفاهم والاتفاق والتعاقد بين التطبيق وبين المستهلك ، كما يوافق كلا أطراف هذه الاتفاقية على أن يوضع في عين الاعتبار ما يلي:\r\n\r\n1- إن اللغة العربية هي اللغة المعمول بها عند تفسير أحكام هذه الاتفاقية، أو عند ترجمتها إلى لغة أخرى.\r\n\r\n2- إن جميع الأسعار المعروضة على خدمات أو منتجات المتجر قد تعدّل بين حينٍ وآخر.\r\n\r\n3- إن العروض الترويجية أو التسويقية التي قد يضعها المتجر هي عروض مؤقتة، حيث أنه للمتجر الحق في تعديل هذه العروض الترويجية أو التسويقية في أي وقت أو إيقافها.\r\n\r\n4- يلتزم أطراف هذه الاتفاقية بالتعامل فيما بينهم بما لا يخالف القواعد الشرعية والأنظمة والقوانين المعمول بها ذات العلاقة بطبيعة التعامل بين التطبيق والمستهلك.\r\n\r\n5- لا تُلغى اتفاقية الاستخدام هذه إلا بموجب قرار يصدر من إدارة التطبيق]\r\n\r\n', '2024-10-01 23:31:17', '2024-10-01 23:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transferred_amounts`
--

CREATE TABLE `transferred_amounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `history` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`history`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `user_verified` timestamp NULL DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `wallet` varchar(255) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `referral_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `subscription` enum('vip','ordinary') DEFAULT 'ordinary',
  `tracker_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `fcm_token`, `email_verified_at`, `user_verified`, `otp`, `code`, `url`, `wallet`, `password`, `remember_token`, `referral_id`, `created_at`, `updated_at`, `bank_name`, `iban`, `last_seen`, `subscription`, `tracker_link`) VALUES
(8, 'معاذ', 'muathalmushali@gmail.com', '966531333006', 'dJ8l4lf_QDu7l53eAZBiTv:APA91bF5Bm9ch1RZMqaDIzczLBO-6LN-4PF0r21uemep8tj7trOhcA7ptq4f1mHTacn0iYQeAoPyknSvWeq0SY5vMfwW_zrM_tp4UETLFrMvbd84sUQThDA', NULL, '2024-09-25 11:43:30', NULL, 'Wycl5', 'https://hatf.hatf.sa/register/Wycl5', '0.8751', '$2y$12$nGOhSpyHopabGNx38P2HLugqqJZMyX5KTP0fXZVOr4MliGeeS3fZm', NULL, NULL, '2024-09-25 11:29:33', '2025-09-28 01:53:12', 'الراجحي', 'SA52 8000 0108 6081 6048 8442', '2025-09-28 01:53:12', 'vip', 'https://app.adjust.com/1okvnvkp?campaign=Wycl5'),
(22, 'هتف', 'Info@hatf.sa', '966530333218', 'dt0Xx4xQQ4GxIwahLjzBDo:APA91bHF8yjMW4NYtw4FZhDD4NltqEtNZZUE3Vsdn8YJtV7LJXNXs9_YBbSe0_LQiGzBAIiGYFEbkaJHoDP2THj7Hx8iy9oaplwuw8DNMlZjXvktQyjQZsw', NULL, '2024-11-07 00:48:08', 2062, 'YF3z1', 'https://lightsteelblue-rail-575879.hostingersite.com/register/YF3z1', '0', '$2y$12$GZOsK.9UweeKKK09kbv9L.dULZ/Dt6xjHbq6R88tAXsmjBjGbfrGq', NULL, NULL, '2024-11-07 00:46:59', '2025-05-24 11:40:05', NULL, NULL, '2024-11-07 03:30:00', 'ordinary', NULL),
(23, 'محمد', 'm.gmalhat@yahoo.com', '966580828702', 'fb2GFTobA0bsls6iPmLx8m:APA91bHL52pTlGiYPrSmDPqlUnC_37u2n7epZE1GeVWXIyO40mPqIzHH9294ap2esQXsuiUIEYKYJregtLArl9WUE7r08JM8FW_3kwsyyRyjt_rV7itPGeM', NULL, '2024-11-07 07:43:13', NULL, 'zu8ft', 'https://lightsteelblue-rail-575879.hostingersite.com/register/zu8ft', '0', '$2y$12$zCf2rQ05lHAyrgnBkpeVx.i18dXbzBvgnRoh1U7fbQr/Q2P1WMVw2', NULL, NULL, '2024-11-07 07:42:43', '2025-02-23 09:38:33', NULL, NULL, '2025-02-23 09:38:33', 'ordinary', NULL),
(35, 'صالح الدخيل', 'sdokhayel@gmail.com', '966532544999', 'ceJYxARJTs-jFUcANZ9eRn:APA91bGiHVX5Ix3VsIxqbca7TIfOoWleW4FlcZlersJY-WS8qNnLSBFrs0sUFSKewjg8vHgxwMtiKKfFCRYPpgHnVHNRq2Jn0Rsy9GxbkthOtqiqxGuMyjo', NULL, '2024-11-27 18:59:06', NULL, '5HrUr', 'https://hatf.hatf.sa/register/5HrUr', '0', '$2y$12$2sTB3WJNs6BCCzyWlPg5..3LTpnNcnpf/jI2hk8pk7ImtmFk6FCqW', NULL, NULL, '2024-11-27 18:58:24', '2025-01-05 15:43:56', NULL, NULL, '2025-01-05 15:43:56', 'ordinary', NULL),
(36, 'aishah', 'aishah.baflah93@gmail.com', '966536453415', 'diXaHue4yUgPot_VKx3Jo3:APA91bHtJ3C4I_hqShmr_QNIToWRNDPyAfiQERzThRHYxdfPrQ7xdXQdga3FbfQ7vVbv7yp3UvKQCfWGEoSL8mzoAoR1c6OHwiWcBDI2XMbw15-DGaT2rQA', NULL, '2024-11-28 15:46:20', NULL, 'MT9V5', 'https://hatf.hatf.sa/register/MT9V5', '0', '$2y$12$q10UNF229uhpL5.hUZJd2eTqferzh69RrH988YqW9zSt8ok39pa96', NULL, 8, '2024-11-28 15:42:57', '2024-12-04 01:08:45', 'بنك الراجحي', 'SA27 8000 0544 6080 1609 8306', '2024-12-04 01:08:45', 'ordinary', NULL),
(37, 'مروة', 'alddmrwt@gmail.com', '966122797484', NULL, NULL, '2024-11-30 01:12:49', 5423, 'FdlSf', 'https://hatf.hatf.sa/register/FdlSf', '0', '$2y$12$OmoUOuJtmK4PltxT0M2GQuyQSLJZLs2eby4K1gIr6yLQwv4QJk0ti', NULL, NULL, '2024-11-30 01:12:49', '2024-11-30 01:14:09', NULL, NULL, NULL, 'ordinary', NULL),
(41, 'منصة اكس', NULL, NULL, NULL, NULL, NULL, NULL, 'L97eL', 'https://hatf.hatf.sa/register/L97eL', '0', 'AhLaGLYS4an4MsUvtToW', NULL, 8, '2024-12-02 14:26:20', '2024-12-02 14:26:20', NULL, NULL, NULL, 'ordinary', NULL),
(42, 'منصة تكتك', NULL, NULL, NULL, NULL, NULL, NULL, '2jVWw', 'https://hatf.hatf.sa/register/2jVWw', '0', 'dTNa6IuIcRfkpl49KG9N', NULL, 8, '2024-12-07 23:53:32', '2024-12-07 23:53:32', NULL, NULL, NULL, 'ordinary', NULL),
(43, 'عبسى', 'es930@hotmail.com', '966555920257', 'eSVSIY8MTUhDqjQUBxt8Hh:APA91bFBJd1XHqqYH-JS1VE-QXN4B6W0P3Q9ldkUFGgzQMfNoBlNE_onHXiUL_gv7afX2q1rIPiol6xzlOsvSzHx1aKWnjxADReXdaICeBRfpYerWoKxjUA', NULL, '2024-12-11 10:29:30', NULL, '5GzXr', 'https://hatf.hatf.sa/register/5GzXr', '0', '$2y$12$51.YhOszCmqlQH8oQHXAa.aQxL1XRI4zQb/aPBerFezI37sU/sRAq', NULL, NULL, '2024-12-11 10:28:46', '2024-12-11 10:29:30', NULL, NULL, '2024-12-11 10:29:30', 'ordinary', NULL),
(44, 'بهاء', 'bahaaabdelhady3@gmail.com', '966550211646', NULL, NULL, '2024-12-15 15:57:20', 5586, 'BYX1J', 'https://hatf.hatf.sa/register/BYX1J', '0', '$2y$12$dCu66t5xnpNh8aRyGGRuY.A9lBbixX5gqNB6kbgsXQ7kK4ujVOV3G', NULL, 8, '2024-12-12 16:18:23', '2024-12-16 22:49:22', 'الراجحي', 'sa90 8000 0192 6080 1608 5381', '2024-12-16 22:49:22', 'ordinary', NULL),
(45, 'عائشة', 'muathalmushali1@gmail.com', '966500079915', 'feIpF1Z08Uh0lO5NTxgyOP:APA91bGtWpMqIms-JX_jCu11oG0VVfPTDZXr4FU77-_AOkFcKNsTpzk-J4LnvPqFr2ySVJ1--fJNavHcCH73f1q2uxxuBm0i_7ZZI3XE_M2uDaW9iC6_rs4', NULL, '2024-12-14 15:43:20', NULL, 'JienC', 'https://hatf.hatf.sa/register/JienC', '0', '$2y$12$VjGMjZFD4OKbJ5TTDMxUKemc6LeioUoSADSACEvhKy/FoTAckTgm6', NULL, NULL, '2024-12-14 15:42:36', '2024-12-14 15:43:23', NULL, NULL, '2024-12-14 15:43:23', 'ordinary', NULL),
(46, 'البتول', 'albatolalreshed@gmail.com', '966531115827', 'dH5QHaIzc0lGukHJlZ9IAT:APA91bF_ErL4aED9MYdwg6iWFTyubxlk3K0OQGMoOY44muz0Ko4DKQYCUpKRMD4c123Vl5alBsyQ4IqBHabEY8Yu9_1KT70FwNheonb1G_I0ZijqgbJZU2o', NULL, '2024-12-21 18:02:51', NULL, 'BL5MT', 'https://hatf.hatf.sa/register/BL5MT', '0', '$2y$12$T7mWBp3r6MGRa.h0Zmbb/uuY6IEVFmCTNZxnaQocNWcFaifQv1WES', NULL, 8, '2024-12-21 17:49:21', '2024-12-21 18:05:12', NULL, NULL, '2024-12-21 18:05:12', 'ordinary', NULL),
(47, 'Maher', 'dm.digital.2010@gmail.com', '966502705395', 'cuHAMM1JPUYqhyJPXkvo2V:APA91bHGm8tAVfg_Rd5S6W-m8cOyF4jzSZOt4jnHDdKJe0becJ00gBZuMIJ3pACbd7_tme-xjSH-3CX7p1YUFC07iq-mMzhdndny5caiY-LBEvOtmP8mdE0', NULL, '2024-12-22 00:29:02', NULL, 'aVlL4', 'https://hatf.hatf.sa/register/aVlL4', '0', '$2y$12$wvCNVmY1zmvxmfVdb24KB.IFDBXoRHZT47vPjlSKCBlweBrONCNpy', NULL, NULL, '2024-12-21 23:58:19', '2024-12-22 00:32:16', NULL, NULL, '2024-12-22 00:32:16', 'ordinary', NULL),
(49, 'حكيم', 'Xhkoomyx@gmail.com', '966504785552', NULL, NULL, '2024-12-25 16:33:03', NULL, 'mowH4', 'https://hatf.hatf.sa/register/mowH4', '0', '$2y$12$3uD.Ftei1etZHQi7s1xomehAJ4aLhuIgxx96oWLhexMHlUVtJGUxe', NULL, 8, '2024-12-25 16:10:16', '2025-04-27 22:21:51', NULL, NULL, '2025-04-27 22:21:51', 'ordinary', NULL),
(50, 'افنان', 'afnanalwdt@gmail.com', '966560897978', 'dNAPFaJCXESWl4srDB_9bt:APA91bHEVnjGmZbsvmAk1TrsOY9HKRKFsjjipc1e4Ysjdn-foSpcujPunYWLMU_bRjGMC91wPT4ydnDHSKsjMQJSgsJBLjrRqJAVvr-Pwm5xvQskyhQBqis', NULL, '2024-12-25 16:28:58', NULL, 'Z3auG', 'https://hatf.hatf.sa/register/Z3auG', '0', '$2y$12$5u.7LfrGwGGblfloWjoE7uiJ9ROCY11dlI8lON.UKV4v27MXFTqy.', NULL, 8, '2024-12-25 16:23:26', '2024-12-25 16:29:01', NULL, NULL, '2024-12-25 16:29:01', 'ordinary', NULL),
(53, 'عبدالملك', 'bxu.8111@gmail.com', '966557801901', 'cTKBchsDDkb2mRFI71Kslj:APA91bF5KHZUjJNpD7ZyV1TTopTYtmzQjtmzVVa3jJrVjrCx72la2VNGbS1lRKXzAecGnMuZ9XWNLSTkuePl8u06y0stE796CuFVVk1e1dJizkxDxDgKwvQ', NULL, '2025-01-05 01:37:32', NULL, '9o8Xz', 'https://hatf.hatf.sa/register/9o8Xz', '0', '$2y$12$INpfm32HQutm2w3zYI0P3OAZ8CXAo8m3IPzbALfqDbS.eGqsC6kPS', NULL, NULL, '2025-01-05 01:35:47', '2025-05-11 17:28:23', NULL, NULL, '2025-05-11 17:28:23', 'ordinary', NULL),
(54, 'كفى', 'kafita1234@hotmail.com', '966505877722', 'clAhx_xR2UzTu1zzrVgORi:APA91bFksihbNe9o5q3lSqHkGdLY6PBsy7KvnKgiQbN3a2WlQIz0lAN42kPMfLBMl1myY84JKPT9R5sK3nMhx1HTFvGBXF47uCBuqRBsuWCcLs-t_dM4o8Q', NULL, '2025-01-06 17:55:00', NULL, 'ffGaN', 'https://hatf.hatf.sa/register/ffGaN', '0', '$2y$12$4U3qneZqep4bnIOstoK94OPJCfvzRTM4/3NvcL5VGcnN./Gxy8OJG', NULL, 8, '2025-01-06 17:49:49', '2025-01-06 17:55:00', NULL, NULL, '2025-01-06 17:55:00', 'ordinary', NULL),
(55, 'Lina', 'leenofa@gmail.com', '966505320301', 'fAjqE9VSWESSl-tDt7-p2v:APA91bGCCMgCQ-zlQ_ykfypv5FnSaP63k4b8YiERXYFsojAq6SrPaRsF9sRwpHQ5PSF7VcuWxYO9lkzWXz48gA8MzNv4NBEdyeHLjks-2zI04lKXtGSCB-E', NULL, '2025-01-11 13:03:06', NULL, 'KRV6w', 'https://hatf.hatf.sa/register/KRV6w', '0', '$2y$12$l3uCQf3QlZScH4cZ6N2c.OTC./f/7T40Td/KywY2gHXZkgSN.9Nzy', NULL, NULL, '2025-01-11 12:47:00', '2025-01-11 19:08:07', NULL, NULL, '2025-01-11 19:08:07', 'ordinary', NULL),
(56, 'ghym', 'ab9939eer@icloud.com', '966583559939', 'c94SK90GbU81gWKayhhO8X:APA91bFinMgPT_chwpDiQxzTn94eGqyhKm9yoLOyyFZrs5Iucj2yT2U5_vqlEMn56CnU3ALaHvIVCOVkK6nMnSEnt5CQLnNL9wpVIW9rYgSz4cXUYFqRd9o', NULL, '2025-01-14 23:59:34', NULL, '1mstv', 'https://hatf.hatf.sa/register/1mstv', '0', '$2y$12$3NKoss.JJ0OpX/gEJO.KzO8OTkn8VWry0duAnDWyoBCLrfafbegkC', NULL, 8, '2025-01-14 22:54:09', '2025-06-02 22:00:23', NULL, NULL, '2025-06-02 22:00:23', 'ordinary', NULL),
(58, 'عبدالمغيث', 'abdoalmoketh@gmail.com', '966534607275', 'dVmJV7_RRCG4b68V0d7aXx:APA91bEv4kqMm5ey7p-USEUlRrTMulu9yzaow9PiPHytJsvReCQhHtRdqB0ANi4kxycOypeuL7BpfiLhsUxLNqFXoR3vuG-bTcSN-QeHNyUUAFYmWgLx48M', NULL, '2025-01-21 15:14:47', NULL, '3fY7Y', 'https://hatf.hatf.sa/register/3fY7Y', '0', '$2y$12$kuasQ/IJQhTc69BL3OeH8epvLoYOXMo23Cpmo87zHps14BDzI.fBG', NULL, NULL, '2025-01-21 15:13:06', '2025-01-21 15:17:24', NULL, NULL, '2025-01-21 15:17:24', 'ordinary', NULL),
(60, 'ڤانسي', 'fancyyy1ll@gmail.com', '966533026857', 'eRYBzgCAbkaTqEojhnVxiW:APA91bHg4ROCu68GhC4GyVV_E2CSm5dJ8NGlotkMxV_mUN1nCIKLlY4G6jnn5FMBwEB-Hd4liooHWcvjCm19HKGUvC4pMnAT1DfAApRHbOo1MmhZPKGyBaI', NULL, '2025-01-25 22:24:00', NULL, '1zPaK', 'https://hatf.hatf.sa/register/1zPaK', '0', '$2y$12$TyXZ/STuYbZGp0ciuAfZwe0VLx8w4IWy76SBgCERd.0tsQHtONr2m', NULL, 8, '2025-01-25 22:09:40', '2025-01-26 00:38:44', NULL, NULL, '2025-01-26 00:38:44', 'ordinary', NULL),
(63, 'bushes', 'bushtk12@gmail.com', '966501544118', NULL, NULL, '2025-02-01 18:02:05', 7332, 'nQZ4l', 'https://hatf.hatf.sa/register/nQZ4l', '0', '$2y$12$OiQbWCXw1P21pny2GaBUwOm9Cmc8.Fb8Moz8cPPS5y0n688mvdjpq', NULL, NULL, '2025-02-01 18:02:05', '2025-02-01 18:06:05', NULL, NULL, NULL, 'ordinary', NULL),
(65, 'وليد', 'waleedt2018@icloud.com', '966534905380', 'fZkMrf-i9EAOgb0ISG9oZj:APA91bEsfw_2OLNxtMo6QwmsdxXU_XUf9qHeNvb06hY-JUMX4gJu-FKBH670h8bP7LaPIrLHkz2Xj_WoZWNeMG0JBSEf3aC7Iv1TPQgmXEucn3DzJGSNMlQ', NULL, '2025-02-12 17:55:53', NULL, 'tCVZ9', 'https://hatf.hatf.sa/register/tCVZ9', '0', '$2y$12$GnF8SOOyZRMzuz6/OaxuNeyfhKSrNOZ/5gNwqr3Ge1Y0488d4foK.', NULL, NULL, '2025-02-12 17:55:31', '2025-02-12 17:57:36', NULL, NULL, '2025-02-12 17:57:36', 'ordinary', NULL),
(67, 'ساره', 'sars68505@gmail.com', '966571009197', 'dFtCNKAsR-e4JnwGAMPj_7:APA91bHUv5CZMW0xdZ-qSaHNc9-V-6Mp4po6gz_sb3Im5mX2h--zjnxQ5tudojx5w45D83R2WMJEyqWKmb-S-Q4aT9qOVHtRS6SP9DUiO3MfDxqfEt0PzY8', NULL, '2025-02-20 18:33:34', NULL, 'tQS6d', 'https://hatf.hatf.sa/register/tQS6d', '0', '$2y$12$R.dXwzySwn.mG1CM9tztfOMuVFKZHagv4tJdzg3uxvNN6Iqsc/1Yy', NULL, 8, '2025-02-20 18:31:23', '2025-02-20 18:33:37', NULL, NULL, '2025-02-20 18:33:37', 'ordinary', NULL),
(68, 'جهاد', 'jehadbts@gmail.com', '966504661433', 'dBItv9fV00uJjZyFa-6Bf6:APA91bGPHgPA9p2-I1wo6hUwcxfg96_OHSJEP8emXUvw2GG-lsicenH47kTpqnqzHCNTzHGoaJAprOOI7_sWhfeWa1J3iCsP2dtzVkICKYbelVWE6fwpu04', NULL, '2025-02-22 02:42:55', NULL, 'X6KKK', 'https://hatf.hatf.sa/register/X6KKK', '0', '$2y$12$4CvVE2cyOU3ZNNJz4qa98.KHEgLGD6.3utW/klngJlesZA1xbraMe', NULL, NULL, '2025-02-22 02:41:58', '2025-02-22 02:42:59', NULL, NULL, '2025-02-22 02:42:59', 'ordinary', NULL),
(69, 'Ibrahim', 'eng.elgendy90@gmail.com', '966535763359', NULL, NULL, '2025-02-24 23:49:05', 6077, 'ezr97', 'https://hatf.hatf.sa/register/ezr97', '0', '$2y$12$bqty0OkDa71b/ZLrfJrwSuFmkPhRkT4Iviy4lFC/hfagyzQKsx56e', NULL, NULL, '2025-02-24 23:48:27', '2025-06-13 14:43:16', NULL, NULL, '2025-06-11 23:27:21', 'vip', NULL),
(70, 'ام ريان', 'lolomidololareno3@gmail.com', '966582062150', 'e_1mLyQZSUqlPiaTbV2Kyd:APA91bHRle1a3umVzluTD7MrwANtMxwui-EOHSHaCiRvBHvpAtQcgMfgpFn8hR-_A4P5ke2nLBVYNVZmYrQC8BMZUWtb8l4t2jRsGEkIoPYCV8Lwfj5QBNE', NULL, '2025-03-24 10:55:21', NULL, 'p2JPj', 'https://hatf.hatf.sa/register/p2JPj', '0', '$2y$12$sUQm4KeUuZBQj3EBTfu1DOwKmYIW3yGL/AcNyKQ68NYzKPgVc1fni', NULL, 8, '2025-03-24 10:52:22', '2025-04-07 23:43:38', 'الراحجي', 'SA39 8000 0589 6080 1604 2490', '2025-04-07 23:43:38', 'ordinary', NULL),
(71, 'فاطمه', 'fatimahms1414@gmail.com', '966532191002', 'dgfxwwE3hEc5uBvqTi5ThF:APA91bHARX388HMcktPVS94LMNe3ZD4_od1EYWEH2y2JJc2n-QPyCMw7IYdZ_YL026ZJ2_OUaTWyx3OZVzCAW94Bq-DProfbQ-pR7BEki5jHBit_jfxYQ6M', NULL, '2025-03-24 18:44:27', NULL, '4dcre', 'https://hatf.hatf.sa/register/4dcre', '0', '$2y$12$ox.1nyPGocv6ZRIQYCTGLOuACuZanz9Gd0.swgXw3qcVXnMlI1sdW', NULL, 70, '2025-03-24 18:42:18', '2025-03-24 18:44:27', NULL, NULL, '2025-03-24 18:44:27', 'ordinary', NULL),
(72, 'layan', 'layan.allarakia@gmail.com', '966532277468', 'diRJj_ncckPcmrSDp6v_Xe:APA91bERLvMSNM4D6j5jnodqfoRSHkdIw-i3JoMf-xJ1zyXFVt7cYCOBcHQeYZ-vFsSnt3J9NsnWJKtO-Un88LiXOqnfcqeFn7Jx9tz0cglaedPC5Q02uaE', NULL, '2025-04-02 22:50:41', NULL, '7ypN0', 'https://hatf.hatf.sa/register/7ypN0', '0', '$2y$12$3xdxOsJqNedmwnukOMhJ8ez0LcICf70rSJ.STFKoAJSpknSSJ0gBW', NULL, NULL, '2025-04-02 22:50:22', '2025-04-02 22:50:53', NULL, NULL, '2025-04-02 22:50:53', 'ordinary', NULL),
(79, 'فاطمة محمد القحطاني', 'mn75.zpqh@gmail.com', '966554636131', 'fhk2-_m2N0hRm2Nvfaulrn:APA91bElseYFg94CBJNVAvr0d8ZjU0cvFcBY77dBn6KzwBzm2Sq98mOtV-VffkxQY67rzsI8hWHtfpIH_LxRlb3SSIaPyh9PYTjhyj-eARa775TktVvdvQQ', NULL, '2025-05-09 07:28:50', NULL, 'Y2PfY', 'https://hatf.hatf.sa/register/Y2PfY', '0', '$2y$12$X2Boe9XTOn00nYVd.hBIuO3j5mQxzVpbShXx8zrhpVNb1y7wmiZOK', NULL, NULL, '2025-05-09 07:26:25', '2025-05-09 07:28:50', NULL, NULL, '2025-05-09 07:28:50', 'ordinary', NULL),
(83, 'rawan', 'rawanalfadli82@gmail.com', '966547143882', NULL, NULL, '2025-05-18 16:49:26', 4382, 'z1InZ', 'https://hatf.hatf.sa/register/z1InZ', '0', '$2y$12$4UG0jDDL7C/vsUUO/PCaLOPmjzNq6QoGwKiLctnapR6NdMyILyobm', NULL, NULL, '2025-05-18 16:49:26', '2025-05-18 16:50:31', NULL, NULL, NULL, 'ordinary', NULL),
(84, 'شروق', 'shoshmatar@icloud.com', '966558874051', 'dpPjRj4Q30g9kGMRDCYky0:APA91bEGkDquszQaVx1pg2wg5jjvVqxVQ5-KTT3ZAt_z_yIC6Ok1rl8egfvMKg0EqKBO3rMVI_bfOETzGm30jD9VMXCod3vzSkrNjsdtKO9QqgRvfKfr2p4', NULL, '2025-05-18 17:01:21', NULL, '3w7OC', 'https://hatf.hatf.sa/register/3w7OC', '0', '$2y$12$Qz8bCOENq8/XrgOKsiIuBeMLp.2nibDi332id6ep8cKkLzfO9VPyS', NULL, NULL, '2025-05-18 16:58:22', '2025-05-18 17:01:21', NULL, NULL, '2025-05-18 17:01:21', 'ordinary', NULL),
(88, 'مها', 'maheee5050@gmail.com', '966558285009', 'dwjRGNvYT7CBPezbG_fYU0:APA91bFvWaZ4ZoFeyd4_ToYtIYTR5suaqoDS2vd0TTpVKY_dmMveohg8jtJAOmaZYKKiJ_S_4tUiMlvVDUOFekOV-yt-aFl8JXf_gxeWBHo_1fOexHYnTO8', NULL, '2025-05-20 10:25:07', NULL, '5tBdK', 'https://hatf.hatf.sa/register/5tBdK', '0', '$2y$12$aKPf1uWpjpaLH29JE89mKe3gqrimJ2AKpxrGbe.2UusDT/lwitiC6', NULL, NULL, '2025-05-20 10:23:39', '2025-05-20 10:25:07', NULL, NULL, '2025-05-20 10:25:07', 'ordinary', NULL),
(89, 'Afaf', 'arabianswan@yahoo.ca', '966556608515', 'fr2RbwKf20ndsDhYI5odz3:APA91bH90m2idxbnFKU8eNhrmFFxsA0mklnYpVa4NViRMEilYfRPhb4bIwbazX9aILpiuks_vFKk8rt-Rffx3SgRCbgPf0TmgdUWQxMf-jYFI-o6kAiXUs8', NULL, '2025-05-22 15:42:04', NULL, 'pHGoq', 'https://hatf.hatf.sa/register/pHGoq', '0', '$2y$12$iOxdd8JgLVG3gtQk6WPv..DUlvf48tdf.gwXqOBXMtjrfzTLd.vhO', NULL, NULL, '2025-05-22 15:41:31', '2025-05-22 15:43:11', NULL, NULL, '2025-05-22 15:43:11', 'ordinary', NULL),
(90, 'hail', 'ayshhalasmry6@gmail.com', '966559452507', 'cMQoSy_uzE74mzk4Regpuv:APA91bEsCwzGDfOAqcNjXP_e0pl7K3FKj5FzhKdR-cMD278SKIrPnR0a3A8Xnb7dkyJFYnE8SrEyxKuQTGVL2Z_-KeNhf5JrxL7WxSGYvcn3c39FEFVQk4Q', NULL, '2025-05-23 06:47:58', NULL, 'DH96B', 'https://hatf.hatf.sa/register/DH96B', '0', '$2y$12$medb4fyBsacOuJqfkcTEteAwFbcRlF9/vZJJDi/DXRdGikgvCmC8m', NULL, NULL, '2025-05-23 06:13:58', '2025-06-16 01:37:15', NULL, NULL, '2025-06-16 01:37:15', 'ordinary', NULL),
(91, NULL, NULL, '966545000812', NULL, NULL, NULL, 5359, NULL, NULL, '0', '$2y$12$gSE3QdF0TGX4RLHhMash7uWtLAaxAkPbcJ6sqwK3gGUlhHtVj2Iv.', NULL, NULL, '2025-05-23 12:09:54', '2025-05-23 12:09:54', NULL, NULL, NULL, 'ordinary', NULL),
(92, NULL, NULL, '966503944368', NULL, NULL, NULL, 5998, NULL, NULL, '0', '$2y$12$RurXTMy7xyJBOqgn4gSf1uYqCmyUAJlz4E5L6Vx9Cke92rQvwtVFO', NULL, NULL, '2025-05-23 18:49:43', '2025-05-23 18:49:43', NULL, NULL, NULL, 'ordinary', NULL),
(93, NULL, NULL, '966551463887', NULL, NULL, NULL, 8809, NULL, NULL, '0', '$2y$12$ONNMrSvjDnAPNh38.SLZTuBzaK7K3wbwXes1RUJstwpNc7Vdjnh/C', NULL, NULL, '2025-05-23 21:32:10', '2025-05-23 21:32:10', NULL, NULL, NULL, 'ordinary', NULL),
(94, NULL, NULL, '966505570135', NULL, NULL, NULL, 5638, NULL, NULL, '0', '$2y$12$pVgO9itZOYPBY3zsDBiNye..8uKUci3PW.WJKK6N0ylIjS1udFSoS', NULL, NULL, '2025-05-23 23:40:41', '2025-05-23 23:40:41', NULL, NULL, NULL, 'ordinary', NULL),
(95, 'راكان القرني', 'rakanalqrny629@gmail.com', '966535418801', 'derMg-QDvkPerqn7xi3wd1:APA91bEggnr7l1PzQhqSHj_zONUDFbomn1pCcq1B71rjQ2DEXOn6wsR2C0E9LRWtVTATo7mxg3cxLLA9rVJWSs5h-6L7xIf1FzmR0jdhsBrkfP0wfFOOfLg', NULL, '2025-05-23 23:42:14', NULL, 'CFjvA', 'https://hatf.hatf.sa/register/CFjvA', '0', '$2y$12$Y8QZp/zlV2ZzPmadk.IjYulm8R1FX3VsjCt94jmAN3Nxls2EurOSu', NULL, NULL, '2025-05-23 23:41:10', '2025-05-23 23:42:14', NULL, NULL, '2025-05-23 23:42:14', 'ordinary', NULL),
(96, NULL, NULL, '966501191912', NULL, NULL, NULL, 6057, NULL, NULL, '0', '$2y$12$6p3PzREXH6Qb78bcPOfv1eq9Z7tDCJMvJN/lqe4F6IFMTsulBpMq.', NULL, NULL, '2025-05-24 06:06:25', '2025-05-24 06:06:25', NULL, NULL, NULL, 'ordinary', NULL),
(97, 'فهد بدر السويعي', 'fahadbader108@gmail.com', '966543911615', 'fXNcB7GWAEgJmmhXuYIvUQ:APA91bHdLH6Kkz7RrHUyADFx_Hgw5mFeSHIEUxs_e0RIqvG7QgoU6z-IjuO5dvi-Ufpf-Cr1WrwcCcJdvqk3PczjClwBe79IG02OQ0Xu_UfiP24g3f0VyDQ', NULL, '2025-05-24 11:33:27', NULL, 'hgdaD', 'https://hatf.hatf.sa/register/hgdaD', '0', '$2y$12$zWoKCuT77pOdxcQ5mOY8m.5INkRWQEWNEFLZFGZbwJTfGttUMaX8u', NULL, NULL, '2025-05-24 08:14:58', '2025-05-24 14:04:24', NULL, NULL, '2025-05-24 14:04:24', 'ordinary', NULL),
(98, 'تزهاك', 'fhdalswyy948@gmail.com', '966506994284', NULL, NULL, '2025-05-24 08:18:28', NULL, '8a7p4', 'https://hatf.hatf.sa/register/8a7p4', '0', '$2y$12$7Fh0Ei/wZW/3zP3JWTS65eXliDEDEGajrr5X3CYuFo90buyseTCvW', NULL, NULL, '2025-05-24 08:17:35', '2025-05-24 11:32:56', NULL, NULL, '2025-05-24 11:32:56', 'ordinary', NULL),
(99, 'A A', 'a.a@gmail.com', '966535653457', 'foR1ZWj6S2KlINadKJ4kth:APA91bEWZkaOSQevQfyl15x-mP8TL0qr9wmFP9QbOth56OY12XOFWWJjPof8s_3dcMx_TIPsnz9ryNJ3t9z-0JK7uGP5ajDK33lZSzrtjpxcK-cUGEPIjuI', NULL, '2025-05-24 11:45:13', NULL, 'Kfx5z', 'https://hatf.hatf.sa/register/Kfx5z', '0', '$2y$12$pgwrGYiXzcLkVC7i2yxOOevDpRUmrK/Qv5WyKcO3YkFBS1y2clq8q', NULL, NULL, '2025-05-24 11:44:35', '2025-05-24 11:45:13', NULL, NULL, '2025-05-24 11:45:13', 'ordinary', NULL),
(100, 'A A B', 'a_a_b@gmail.com', '966535643357', NULL, NULL, '2025-05-24 11:47:57', NULL, 'BgJdB', 'https://hatf.hatf.sa/register/BgJdB', '0', '$2y$12$B.AaFjr2rHbM6xxKgz7XIOC0TWtsxwWZ8w2TZ7VgSOh6cnRxS6sNK', NULL, NULL, '2025-05-24 11:47:20', '2025-05-24 12:03:54', NULL, NULL, '2025-05-24 12:03:54', 'ordinary', NULL),
(101, 'A B C', 'a_b_c@gmail.com', '966535764458', NULL, NULL, '2025-05-24 16:13:36', NULL, 'BtdJf', 'https://hatf.hatf.sa/register/BtdJf', '0', '$2y$12$UmZ85Ypw7SZdlnREVeBNX.dQzAOMxhbKE06Mnrs51ZCxUqr/DShga', NULL, NULL, '2025-05-24 16:12:50', '2025-05-24 16:16:14', NULL, NULL, '2025-05-24 16:16:14', 'ordinary', NULL),
(106, NULL, NULL, '966537692983', 'csb1JQPq302ir2HY2dUr53:APA91bGZhl0WVSOgyyZc9I_RUr7v4qY0Rix58HJfQcDs7VELjOBnRnJKKY-JcL-Nr9H9OXdHNP7L3aw4b3laz_92j86HyVzPfSU4Utdj6BZsNElK2C9RIu4', NULL, NULL, NULL, NULL, NULL, '0', '$2y$12$lLXTKSuGt7YCY3aeL4alu.J9Gyrq7fniRJiFBzLKDROBlK2442HUK', NULL, NULL, '2025-05-24 23:20:23', '2025-05-24 23:26:52', NULL, NULL, '2025-05-24 23:26:52', 'ordinary', NULL),
(107, 'سالم', 'saliimm044@gmail.com', '966506194214', 'fITT_SiUTD6T2baEaor8XU:APA91bGbnPq7P7TsAxKm57r496RyY7Vi0n8C9K0yRxPGG6z5bKI_ur6LdYg1fk6mkoaLYqNHaO-j0QDpg3zpbvskfsqB3uyyoM26vmuSwuK6xF0oMIW3znw', NULL, '2025-05-25 00:01:51', NULL, '9raSU', 'https://hatf.hatf.sa/register/9raSU', '0', '$2y$12$D9PxBOxQVw0DhpuN8MbEveuJ4bgFEdgQMa80xzc75Dm03hKfO6Vp2', NULL, NULL, '2025-05-25 00:00:34', '2025-05-25 00:02:46', NULL, NULL, '2025-05-25 00:02:46', 'ordinary', NULL),
(108, NULL, NULL, '966508159353', NULL, NULL, NULL, 5410, NULL, NULL, '0', '$2y$12$k1/M.faem30iELd69O0OB.VooM2EfXQKH6AUL76VGnKmcGN9lLUte', NULL, NULL, '2025-05-25 00:15:00', '2025-05-25 00:15:00', NULL, NULL, NULL, 'ordinary', NULL),
(109, 'B', 'maraksa2000@yahoo.com', '966551234843', 'fgBRWA1X5UAEqW-mvPSaYZ:APA91bG_WgTsYW5jBF0a0APl1ZX9dKcj_4P3lVa6FSdr8mVooT4UaxZdkf4Ph7dJ1FMaowVa5EYE_YXFl5tZ4miDSZ3UQEKHSxyzyOc2Zr0WYE-LiBUd4hY', NULL, '2025-05-25 00:57:42', NULL, 'YKkHC', 'https://hatf.hatf.sa/register/YKkHC', '0', '$2y$12$pbIwQW4Nfd6JY3g7Vor5tOj18D8Iyh7sjVBTmpfnw5d.laDPXTFK.', NULL, NULL, '2025-05-25 00:51:42', '2025-05-25 00:57:42', NULL, NULL, '2025-05-25 00:57:42', 'ordinary', NULL),
(110, 'أمل', 'amll13930@gmail.com', '966502794588', 'c1kjCpNMRACgnzZt6bbZOz:APA91bF9vhzEvqVpMPHRea3Lokiql6Rr47xVCqZZNeZSbRUWpJEghMIU6lsvbu5KGFSM4f9yjz7inZUK9QgOacKH58kASDQ23UhIKJR79KU1vaxrCJd7PH8', NULL, '2025-05-25 01:17:01', NULL, 'FWOE8', 'https://hatf.hatf.sa/register/FWOE8', '0', '$2y$12$O52rsOHrzLZLWX8DtW92.e1A1AXQKI1lUd1wWUePViW6lWuhxpY7i', NULL, NULL, '2025-05-25 01:16:01', '2025-05-25 01:18:26', NULL, NULL, '2025-05-25 01:18:26', 'ordinary', NULL),
(111, NULL, NULL, '966508267064', NULL, NULL, NULL, 7522, NULL, NULL, '0', '$2y$12$sPzBdpOX3qpPqHjY8wD.FeEB7iC3bkyfp24ncNUhH/Fywga0ABU4W', NULL, NULL, '2025-05-25 03:01:06', '2025-05-25 03:01:06', NULL, NULL, NULL, 'ordinary', NULL),
(112, 'اشواق', 'eshomutiri@gmail.com', '966567069315', NULL, NULL, '2025-05-25 03:46:22', 5672, 'vai2D', 'https://hatf.hatf.sa/register/vai2D', '0', '$2y$12$6ztSHF.ySur3.8oiHPp3lOo4xNHz8joQ3rVXVtypsDqrrMo7scZsC', NULL, NULL, '2025-05-25 03:46:22', '2025-05-25 03:46:22', NULL, NULL, NULL, 'ordinary', NULL),
(113, NULL, NULL, '966563254856', NULL, NULL, NULL, 2849, NULL, NULL, '0', '$2y$12$343T82H00rs55TJjJXF1be/ScBM6iKnY4Hdz1lo1yT6BR69BtGtGS', NULL, NULL, '2025-05-25 09:20:57', '2025-05-25 09:20:57', NULL, NULL, NULL, 'ordinary', NULL),
(114, 'هند', 'hhind-239@hotmil.com', '966546824443', 'cqtb628kLEZtqXhyGVHBjI:APA91bHmONe-Vp20tBtI8VbZmyLtyazmub6x2rfMAB4bc5NfeTwIBVDfgDGAgD2BUu-pJ_oqf0yCElwNxBF3E0Nlfi8U6HIZD3Xh8w8KljctfFxC71Uk0_8', NULL, '2025-05-25 11:34:05', NULL, 'S99kH', 'https://hatf.hatf.sa/register/S99kH', '0', '$2y$12$UFSFgGru7y9vg5U7b2.RTuMLZkYO8MDuoZRintAOEOiOD0pmtmSBa', NULL, NULL, '2025-05-25 11:29:32', '2025-05-25 11:34:05', NULL, NULL, '2025-05-25 11:34:05', 'ordinary', NULL),
(115, 'mazin', 'mazen55052@gmail.com', '966550524992', 'fuDGLribQzCCyM1ixklT3v:APA91bGSg3RjpsATmBQFr2engkje-3In32ZxVm3I2OqZoMHnLrMkrFWWMkRIeY65byM4GUM7MJjoWP3uBGzKc1dCNzfKz-rtkC6YtVL9UWIAKm5ma5Usy0U', NULL, '2025-05-26 01:54:50', NULL, 'B7Fiu', 'https://hatf.hatf.sa/register/B7Fiu', '0', '$2y$12$xqmeCMF4NrXbEkfLty6QaeDD/bhqBqTU/vGTYSbzqiIZbkaIIuxl6', NULL, NULL, '2025-05-26 01:54:30', '2025-05-26 01:57:15', NULL, NULL, '2025-05-26 01:57:15', 'ordinary', NULL),
(116, 'وليد', 'wleed8888@hotmail.com', '966552223048', 'ccaxtY-SMUOCq5DpDbq5ej:APA91bEQncwNv3laxd-CNq1Tr9IkgLp01EXvkVgB7Dwa7OxmAQSc3nuB4xxge_bPlsTlb1D91lgcQsMXnPBHTHiPh-YX0xldWK2I-L2oEcAlkDFsFzkEHto', NULL, '2025-05-29 09:27:52', NULL, 'VbRjJ', 'https://hatf.hatf.sa/register/VbRjJ', '0', '$2y$12$CkNpWg96QlKmcgTSoHhdHu1fJGy4ab2VDbEITEFHRmDV2XrWeAvFK', NULL, NULL, '2025-05-29 09:24:48', '2025-05-29 09:27:52', NULL, NULL, '2025-05-29 09:27:52', 'ordinary', NULL),
(117, 'Nouf', 'aannsstuy88@gmail.com', '966505312272', 'few-lvAnhEj9ppFKRdm5Oq:APA91bGbD8EHmg-8yv8mHcx0gumlbJMe0ZZGL6I8x20D4j-TDWfZdoxKxahQbHEkjFYew_haQ-ISq7a9XQBo9fGJXsytfLIpnqfi2eg_uuff4v_VgcRoZDk', NULL, '2025-06-02 01:11:49', NULL, 'VQGdE', 'https://hatf.hatf.sa/register/VQGdE', '0', '$2y$12$UhkyC0osNtsjYVAPVu3AY.OBGLNcIIzZ40CQG6j2SylfllRGDwtBm', NULL, NULL, '2025-06-02 01:08:06', '2025-06-02 01:11:49', NULL, NULL, '2025-06-02 01:11:49', 'ordinary', NULL),
(118, 'Mr.7KRH', 'skkyop9900@gmail.com', '966551504979', NULL, NULL, '2025-06-03 15:39:19', 6610, 'pgg9l', 'https://hatf.hatf.sa/register/pgg9l', '0', '$2y$12$S4PmZ0lb7P.Hn5QfG/l1wOp92coVSXDM/uLxrG.8czy0zf0IILNhK', NULL, NULL, '2025-06-03 15:39:19', '2025-06-03 15:43:31', NULL, NULL, NULL, 'ordinary', NULL),
(119, NULL, NULL, '966431333006', NULL, NULL, NULL, 2487, NULL, NULL, '0', '$2y$12$tsXFaUeGpkuJrLPudKUuIu5Y/2PUpwXgWRAqTxKXlMjci6GsEtPz2', NULL, NULL, '2025-06-05 13:43:29', '2025-06-05 13:43:29', NULL, NULL, NULL, 'ordinary', NULL),
(123, 'زياد حسن', 'zeyad.h.abaza@gmail.com', '201006403927', NULL, NULL, '2025-06-08 21:33:18', NULL, 'lLgo1', 'https://hatf.hatf.sa/register/lLgo1', '0', '$2y$12$FIWpIirrw1KpZoNusfNXdua5HRAqYQxDrmfAXA2p8VfRflRk4vsL.', NULL, NULL, '2025-06-08 21:33:02', '2025-06-08 22:21:06', NULL, NULL, '2025-06-08 22:21:06', 'ordinary', NULL),
(127, 'زياد حسن', 'ziadabaza09876@gmail.com', '966530000000', 'dwVru7ilQva8mOYMESLXul:APA91bEdVn9RMFPKfB5C1OtFqg8NPibny-wKv1ZL_IprTQ5ZDrQPLcIQ57bZr0OXSkXln-xnromYMv_klzCRYji5kNWQhLUPKNjWvlyaNpDEdjKldkW3LGQ', NULL, '2025-06-11 15:46:35', NULL, 'gkAik', 'https://hatf.hatf.sa/register/gkAik', '0', '$2y$12$fi7fvbhSkhfDXg/dRD3lxeji4EKzfYG3by7PliIdINtEubGZaFrTS', NULL, NULL, '2025-06-11 15:43:41', '2025-06-20 01:35:26', NULL, NULL, '2025-06-20 01:35:26', 'ordinary', NULL),
(128, 'sh', 'shahad77rashid@gmail.com', '966504973805', NULL, NULL, '2025-07-05 12:12:03', 1909, 'rU4w7', 'https://hatf.hatf.sa/register/rU4w7', '0', '$2y$12$6OQPYD0wPnsvgeJBLB/x8uHO5BeJVolaayQYsSvn3h/TpUsaUDwyS', NULL, NULL, '2025-07-05 12:12:03', '2025-07-05 12:13:08', NULL, NULL, NULL, 'ordinary', NULL),
(129, NULL, NULL, '966556268498', NULL, NULL, NULL, 4592, NULL, NULL, '0', '$2y$12$DEEuDLwKaToRvuH8nZBWGOK2Xh9utiLWJ5LhjoZ5zBT.dvYpBEO8K', NULL, NULL, '2025-08-20 20:22:53', '2025-08-20 22:13:02', NULL, NULL, NULL, 'ordinary', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_invitations`
--

CREATE TABLE `user_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `text_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`text_settings`)),
  `number_invitees` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invitation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invitation_date` date DEFAULT NULL,
  `invitation_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `time` date NOT NULL DEFAULT '2024-11-24',
  `type` enum('exclude','include') NOT NULL DEFAULT 'include' COMMENT 'Specifies whether to exclude or include on renewal after payment',
  `user_package_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_invitations`
--

INSERT INTO `user_invitations` (`id`, `name`, `text_settings`, `number_invitees`, `is_active`, `state`, `user_id`, `invitation_id`, `invitation_date`, `invitation_time`, `created_at`, `updated_at`, `time`, `type`, `user_package_id`) VALUES
(126, 'حفل زفاف', NULL, 1, 0, 1, 23, 1, '2025-01-14', '18:00:00', '2025-01-01 21:50:02', '2025-01-01 21:50:02', '2024-11-24', 'include', 35),
(128, 'عبدالملك', NULL, 1, 0, 1, 53, 1, '2025-01-15', '03:41:00', '2025-01-05 03:42:34', '2025-01-05 03:42:34', '2024-11-24', 'include', 37),
(129, 'عبدالملك', NULL, 1, 0, 1, 53, 1, '2025-01-15', '03:41:00', '2025-01-05 03:42:43', '2025-01-05 03:42:43', '2024-11-24', 'include', 38),
(130, 'عبدالملك', NULL, 1, 0, 1, 53, 1, '2025-01-15', '03:41:00', '2025-01-05 03:42:46', '2025-01-05 03:42:46', '2024-11-24', 'include', 39),
(139, 'دعوة حفل زفاف عمر و لينا', NULL, 2, 1, 1, 55, 1, '2025-01-24', '05:00:00', '2025-01-11 19:07:45', '2025-01-11 19:08:05', '2024-11-24', 'include', 48),
(148, 'مناسبة عشاء🍽️✨', NULL, 4, 1, 1, 60, 1, '2025-01-26', '08:00:00', '2025-01-26 00:38:20', '2025-01-30 21:27:20', '2024-11-24', 'include', 57),
(375, 'تجربة عمولة المسوق', NULL, 3, 1, 1, 53, 1, '2025-05-12', '17:25:00', '2025-05-11 17:28:04', '2025-05-11 17:28:25', '2024-11-24', 'include', 139),
(388, 'زواج عبدالعزيز بن بدر السويعي', NULL, 2, 0, 1, 98, 1, '2025-05-24', '00:01:00', '2025-05-24 08:26:31', '2025-05-24 08:26:31', '2024-11-24', 'include', 144),
(389, 'زواج عبدالعزيز بن بدر السويعي', NULL, 2, 0, 1, 98, 1, '2025-05-24', '00:01:00', '2025-05-24 08:26:36', '2025-05-24 08:26:36', '2024-11-24', 'include', 145),
(390, 'زواج عبدالعزيز بن بدر السويعي', NULL, 2, 0, 1, 98, 1, '2025-05-24', '00:01:00', '2025-05-24 08:26:41', '2025-05-24 08:26:41', '2024-11-24', 'include', 146),
(391, 'زواج عبدالعزيز بن بدر السويعي', NULL, 2, 0, 1, 98, 1, '2025-05-24', '00:01:00', '2025-05-24 08:26:53', '2025-05-24 08:26:53', '2024-11-24', 'include', 147),
(392, 'زواج عبدالعزيز بن بدر السويعي', NULL, 2, 0, 1, 98, 1, '2025-05-24', '00:01:00', '2025-05-24 08:29:15', '2025-05-24 08:29:15', '2024-11-24', 'include', 148),
(393, 'زواج عبدالعزيز بن بدر السويعي', NULL, 2, 0, 1, 98, 1, '2025-05-24', '00:01:00', '2025-05-24 08:29:24', '2025-05-24 08:29:24', '2024-11-24', 'include', 149),
(394, 'زواج عبدالعزيز بن بدر السويعي', NULL, 2, 0, 1, 98, 1, '2025-05-24', '00:01:00', '2025-05-24 08:29:25', '2025-05-24 08:29:25', '2024-11-24', 'include', 150),
(395, 'زواج عبدالعزيز بن بدر السويعي', NULL, 1, 0, 1, 98, 1, '2025-05-24', '00:01:00', '2025-05-24 08:29:35', '2025-05-24 08:29:35', '2024-11-24', 'include', 151),
(396, 'زواج عبدالعزيز بن بدر السويعي', NULL, 2, 0, 1, 98, 1, '2025-05-24', '08:50:00', '2025-05-24 08:46:47', '2025-05-24 08:46:47', '2024-11-24', 'include', 152),
(397, 'زواج عبدالعزيز بن بدر السويعي', NULL, 1, 0, 1, 98, 1, '2025-05-24', '08:50:00', '2025-05-24 08:47:13', '2025-05-24 08:47:13', '2024-11-24', 'include', 153),
(398, 'زواج عبدالعزيز بن بدر السويعي', NULL, 1, 0, 1, 98, 1, '2025-05-24', '08:50:00', '2025-05-24 08:47:16', '2025-05-24 08:47:16', '2024-11-24', 'include', 154),
(408, 'زواج عبدالعزيز بن بدر السويعي .', NULL, 3, 1, 1, 97, 1, '2025-05-24', '14:03:00', '2025-05-24 14:02:56', '2025-05-24 14:03:15', '2024-11-24', 'include', 164),
(532, 'Test', '{\"color\":\"#1d557e\",\"size\":\"30\",\"font\":\"MarkaziText\",\"x\":\"343.26975822077435\",\"y\":\"548.9396587492307\"}', 1, 1, 1, 8, 8, '2025-06-19', '04:18:00', '2025-06-11 04:20:01', '2025-06-11 04:20:02', '2024-11-24', 'include', 307),
(533, 'زواجي', NULL, 2, 1, 1, 8, 1, '2025-06-11', '04:20:00', '2025-06-11 04:21:21', '2025-06-11 04:21:27', '2024-11-24', 'include', 308),
(534, 'Test', '{\"color\":\"#2196f3\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.0\",\"y\":\"0.0\"}', 1, 1, 1, 8, 8, '2025-06-18', '04:25:00', '2025-06-11 04:31:27', '2025-06-11 04:31:28', '2024-11-24', 'include', 309),
(535, 'زواج', NULL, 2, 1, 1, 8, 1, '2025-06-20', '08:00:00', '2025-06-11 06:30:57', '2025-06-11 06:31:03', '2024-11-24', 'include', 310),
(537, 'تا', NULL, 2, 1, 1, 8, 1, '2025-06-11', '14:36:00', '2025-06-11 14:36:21', '2025-06-11 14:36:26', '2024-11-24', 'include', 312),
(576, 'Test INV', '{\"color\":\"#2196f3\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.0\",\"y\":\"0.0\"}', 1, 1, 1, 8, 8, '2025-06-26', '00:47:00', '2025-06-14 00:48:09', '2025-06-14 00:48:10', '2024-11-24', 'include', 351),
(577, 'Test', '{\"color\":\"#2196f3\",\"size\":\"28\",\"font\":\"Amiri\",\"x\":\"0.5303560958893357\",\"y\":\"0.5402159312061926\"}', 1, 1, 1, 8, 8, '2025-06-26', '00:52:00', '2025-06-14 00:54:24', '2025-06-14 00:54:24', '2024-11-24', 'include', 352),
(578, 'Test yyy', '{\"color\":\"#2196f3\",\"size\":\"24\",\"font\":\"Almarai\",\"x\":\"0.0\",\"y\":\"0.0\"}', 1, 1, 1, 8, 8, '2025-06-26', '00:55:00', '2025-06-14 00:56:31', '2025-06-14 00:56:31', '2024-11-24', 'include', 353),
(623, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.30687680269886275\",\"y\":\"0.7973200217543193\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-17', '01:37:00', '2025-06-16 01:38:04', '2025-06-16 01:38:04', '2024-11-24', 'include', 398),
(624, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.30687680269886275\",\"y\":\"0.7973200217543193\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-17', '01:37:00', '2025-06-16 01:39:55', '2025-06-16 01:39:55', '2024-11-24', 'include', 399),
(625, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.30687680269886275\",\"y\":\"0.7973200217543193\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-17', '01:37:00', '2025-06-16 01:41:15', '2025-06-16 01:41:15', '2024-11-24', 'include', 400),
(626, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.30687680269886275\",\"y\":\"0.7973200217543193\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-17', '01:37:00', '2025-06-16 01:44:01', '2025-06-16 01:44:01', '2024-11-24', 'include', 401),
(627, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.30687680269886275\",\"y\":\"0.7973200217543193\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-17', '01:37:00', '2025-06-16 01:46:08', '2025-06-16 01:46:08', '2024-11-24', 'include', 402),
(628, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.30687680269886275\",\"y\":\"0.7973200217543193\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-17', '01:37:00', '2025-06-16 01:47:35', '2025-06-16 01:47:35', '2024-11-24', 'include', 403),
(629, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.30687680269886275\",\"y\":\"0.7973200217543193\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-17', '01:37:00', '2025-06-16 01:49:21', '2025-06-16 01:49:21', '2024-11-24', 'include', 404),
(630, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 01:51:06', '2025-06-16 01:51:07', '2024-11-24', 'include', 405),
(631, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 01:52:16', '2025-06-16 01:52:16', '2024-11-24', 'include', 406),
(632, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 01:54:41', '2025-06-16 01:54:41', '2024-11-24', 'include', 407),
(633, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 01:56:04', '2025-06-16 01:56:05', '2024-11-24', 'include', 408),
(634, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 01:58:26', '2025-06-16 01:58:26', '2024-11-24', 'include', 409),
(635, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:01:37', '2025-06-16 02:01:38', '2024-11-24', 'include', 410),
(636, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:01:40', '2025-06-16 02:01:40', '2024-11-24', 'include', 411),
(637, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:04:24', '2025-06-16 02:04:24', '2024-11-24', 'include', 412),
(638, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:04:28', '2025-06-16 02:04:28', '2024-11-24', 'include', 413),
(639, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:05:16', '2025-06-16 02:05:17', '2024-11-24', 'include', 414),
(640, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:06:59', '2025-06-16 02:07:00', '2024-11-24', 'include', 415),
(641, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:08:25', '2025-06-16 02:08:25', '2024-11-24', 'include', 416),
(642, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:09:43', '2025-06-16 02:09:44', '2024-11-24', 'include', 417),
(643, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:10:45', '2025-06-16 02:10:46', '2024-11-24', 'include', 418),
(644, 'تجربه 3', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Almarai\",\"x\":\"0.27936959190341126\",\"y\":\"0.2591188728746921\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-30', '02:11:00', '2025-06-16 02:11:45', '2025-06-16 02:11:45', '2024-11-24', 'include', 419),
(645, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:12:48', '2025-06-16 02:12:48', '2024-11-24', 'include', 420),
(646, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:14:17', '2025-06-16 02:14:17', '2024-11-24', 'include', 421),
(647, 'تجربه 3', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Almarai\",\"x\":\"0.27936959190341126\",\"y\":\"0.2591188728746921\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-30', '02:11:00', '2025-06-16 02:15:42', '2025-06-16 02:15:43', '2024-11-24', 'include', 422),
(648, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:19:20', '2025-06-16 02:19:21', '2024-11-24', 'include', 423),
(649, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:20:54', '2025-06-16 02:20:54', '2024-11-24', 'include', 424),
(650, 'تجربه 3', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Almarai\",\"x\":\"0.27936959190341126\",\"y\":\"0.2591188728746921\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-30', '02:11:00', '2025-06-16 02:24:03', '2025-06-16 02:24:04', '2024-11-24', 'include', 425),
(651, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:26:38', '2025-06-16 02:26:38', '2024-11-24', 'include', 426),
(652, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:44:37', '2025-06-16 02:44:38', '2024-11-24', 'include', 427),
(653, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:45:44', '2025-06-16 02:45:44', '2024-11-24', 'include', 428),
(654, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.30687680269886275\",\"y\":\"0.7973200217543193\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-17', '01:37:00', '2025-06-16 02:50:42', '2025-06-16 02:50:43', '2024-11-24', 'include', 429),
(655, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.30687680269886275\",\"y\":\"0.7973200217543193\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-17', '01:37:00', '2025-06-16 02:53:15', '2025-06-16 02:53:16', '2024-11-24', 'include', 430),
(656, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.30687680269886275\",\"y\":\"0.7973200217543193\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-17', '01:37:00', '2025-06-16 02:59:16', '2025-06-16 02:59:17', '2024-11-24', 'include', 431),
(657, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 02:59:54', '2025-06-16 02:59:56', '2024-11-24', 'include', 432),
(658, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.30687680269886275\",\"y\":\"0.7973200217543193\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-17', '01:37:00', '2025-06-16 03:01:51', '2025-06-16 03:01:51', '2024-11-24', 'include', 433),
(659, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 03:02:42', '2025-06-16 03:02:42', '2024-11-24', 'include', 434),
(660, 'تجربه ٤', '{\"color\":\"#2196f3\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.37220646334769364\",\"y\":\"0.25075450751140443\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '03:03:00', '2025-06-16 03:05:26', '2025-06-16 03:05:27', '2024-11-24', 'include', 435),
(661, 'تجربه 5', '{\"color\":\"#2196f3\",\"size\":\"40\",\"font\":\"Tajawal\",\"x\":\"0.17507133594817806\",\"y\":\"0.24532485619020514\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-24', '03:06:00', '2025-06-16 03:06:52', '2025-06-16 03:06:53', '2024-11-24', 'include', 436),
(662, 'Test', '{\"color\":\"#2196f3\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.5292425309344759\",\"y\":\"0.5510835228893002\",\"width\":\"672.0\",\"height\":\"996.0\"}', 1, 1, 1, 8, 8, '2025-06-20', '03:55:00', '2025-06-16 03:56:21', '2025-06-16 03:56:22', '2024-11-24', 'include', 437),
(663, 'تجربه ٤', '{\"color\":\"#2196f3\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.37220646334769364\",\"y\":\"0.25075450751140443\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '03:03:00', '2025-06-16 19:48:39', '2025-06-16 19:48:39', '2024-11-24', 'include', 438),
(664, 'تجربه ٤', '{\"color\":\"#2196f3\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.37220646334769364\",\"y\":\"0.25075450751140443\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '03:03:00', '2025-06-16 19:50:44', '2025-06-16 19:50:45', '2024-11-24', 'include', 439),
(665, 'تجربه ٤', '{\"color\":\"#2196f3\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.37220646334769364\",\"y\":\"0.25075450751140443\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '03:03:00', '2025-06-16 19:52:38', '2025-06-16 19:52:39', '2024-11-24', 'include', 440),
(666, 'تجربه ٤', '{\"color\":\"#2196f3\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.37220646334769364\",\"y\":\"0.25075450751140443\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '03:03:00', '2025-06-16 19:53:43', '2025-06-16 19:53:44', '2024-11-24', 'include', 441),
(667, 'تجربه 5', '{\"color\":\"#2196f3\",\"size\":\"40\",\"font\":\"Tajawal\",\"x\":\"0.17507133594817806\",\"y\":\"0.24532485619020514\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-24', '03:06:00', '2025-06-16 19:54:25', '2025-06-16 19:54:25', '2024-11-24', 'include', 442),
(668, 'تجربه 2', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31260745994470335\",\"y\":\"0.7875933458918126\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '01:49:00', '2025-06-16 19:55:08', '2025-06-16 19:55:08', '2024-11-24', 'include', 443),
(669, 'زياد حسن محمد', '{\"color\":\"#5e4101\",\"size\":\"35\",\"font\":\"Amiri\",\"x\":\"0.30343843635906625\",\"y\":\"0.23074251382291847\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-30', '19:55:00', '2025-06-16 19:56:17', '2025-06-16 19:56:18', '2024-11-24', 'include', 444),
(670, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"37\",\"font\":\"Cairo\",\"x\":\"0.16360995143722556\",\"y\":\"0.7681266310368206\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-29', '19:56:00', '2025-06-16 19:57:18', '2025-06-16 19:57:19', '2024-11-24', 'include', 445),
(671, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"37\",\"font\":\"Cairo\",\"x\":\"0.16360995143722556\",\"y\":\"0.7681266310368206\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-29', '19:56:00', '2025-06-16 20:07:40', '2025-06-16 20:07:40', '2024-11-24', 'include', 446),
(672, 'تجربه ٦', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31719204175679205\",\"y\":\"0.2380448209482122\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-23', '20:08:00', '2025-06-16 20:08:33', '2025-06-16 20:08:33', '2024-11-24', 'include', 447),
(673, 'زياد حسن محمد', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.30687680269886225\",\"y\":\"0.8021832112063484\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-30', '20:09:00', '2025-06-16 20:09:28', '2025-06-16 20:09:28', '2024-11-24', 'include', 448),
(674, 'تجربه ٦', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31719204175679205\",\"y\":\"0.2380448209482122\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-23', '20:08:00', '2025-06-16 20:16:21', '2025-06-16 20:16:22', '2024-11-24', 'include', 449),
(675, 'لاسفل', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.3252149899086778\",\"y\":\"0.7965093252020657\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '20:16:00', '2025-06-16 20:17:18', '2025-06-16 20:17:18', '2024-11-24', 'include', 450),
(676, 'لأعلى', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31146131449168085\",\"y\":\"0.24290810938639235\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-30', '20:17:00', '2025-06-16 20:18:03', '2025-06-16 20:18:04', '2024-11-24', 'include', 451),
(677, 'لأعلى', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31146131449168085\",\"y\":\"0.24290810938639235\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-30', '20:17:00', '2025-06-16 20:19:58', '2025-06-16 20:19:58', '2024-11-24', 'include', 452),
(678, 'لأعلى', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.31146131449168085\",\"y\":\"0.24290810938639235\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-30', '20:17:00', '2025-06-16 20:20:55', '2025-06-16 20:20:55', '2024-11-24', 'include', 453),
(679, 'لاسفل', '{\"color\":\"#2196f3\",\"size\":\"30\",\"font\":\"Amiri\",\"x\":\"0.3252149899086778\",\"y\":\"0.7965093252020657\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-27', '20:16:00', '2025-06-16 20:21:35', '2025-06-16 20:21:35', '2024-11-24', 'include', 454),
(680, 'ال', '{\"color\":\"#ffffff\",\"size\":\"24\",\"font\":\"Almarai\",\"x\":\"0.18896200808814728\",\"y\":\"0.7244614407727981\",\"width\":\"1080.0\",\"height\":\"1920.0\"}', 1, 1, 1, 8, 8, '2025-06-19', '00:34:00', '2025-06-19 00:35:58', '2025-06-19 00:35:58', '2024-11-24', 'include', 455),
(681, 'معاذ', '{\"color\":\"#2196f3\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.367692095262318\",\"y\":\"0.7095222421925581\",\"width\":\"900.0\",\"height\":\"1600.0\"}', 1, 1, 1, 127, 8, '2025-06-23', '10:37:00', '2025-06-19 10:38:42', '2025-06-19 10:38:43', '2024-11-24', 'include', 456),
(682, 'زياد حسن محمد', '{\"color\":\"#f1f2f3\",\"size\":\"28\",\"font\":\"NotoNaskhArabic\",\"x\":\"0.25967286732286865\",\"y\":\"0.8935157144019101\",\"width\":\"900.0\",\"height\":\"1600.0\"}', 1, 1, 1, 127, 8, '2025-06-23', '10:39:00', '2025-06-19 10:40:38', '2025-06-19 10:40:38', '2024-11-24', 'include', 457),
(683, 'تيست', '{\"color\":\"#eae4e4\",\"size\":\"18\",\"font\":\"Amiri\",\"x\":\"0.2524320290832024\",\"y\":\"0.8392090430019894\",\"width\":\"1800.0\",\"height\":\"2402.0\"}', 1, 1, 1, 127, 8, '2025-06-22', '12:10:00', '2025-06-19 12:11:12', '2025-06-19 12:11:12', '2024-11-24', 'include', 458),
(684, 'افتتاح', '{\"color\":\"#9ea4ab\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.3735515446263108\",\"y\":\"0.7843017578124993\",\"width\":\"2289.0\",\"height\":\"2289.0\"}', 1, 1, 1, 127, 8, '2025-06-24', '12:14:00', '2025-06-19 12:15:28', '2025-06-19 12:15:29', '2024-11-24', 'include', 459),
(685, 'افتتاح', '{\"color\":\"#9ea4ab\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.3735515446263108\",\"y\":\"0.7843017578124993\",\"width\":\"2289.0\",\"height\":\"2289.0\"}', 1, 1, 1, 127, 8, '2025-06-24', '12:14:00', '2025-06-19 12:16:08', '2025-06-19 12:16:08', '2024-11-24', 'include', 460),
(686, 'افتتاح', '{\"color\":\"#9ea4ab\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.3735515446263108\",\"y\":\"0.7843017578124993\",\"width\":\"2289.0\",\"height\":\"2289.0\"}', 1, 1, 1, 127, 8, '2025-06-24', '12:14:00', '2025-06-19 12:17:06', '2025-06-19 12:17:06', '2024-11-24', 'include', 461),
(687, 'افتتاح', '{\"color\":\"#9ea4ab\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.3735515446263108\",\"y\":\"0.7843017578124993\",\"width\":\"2289.0\",\"height\":\"2289.0\"}', 1, 1, 1, 127, 8, '2025-06-24', '12:14:00', '2025-06-19 12:17:08', '2025-06-19 12:17:08', '2024-11-24', 'include', 462),
(688, 'افتتاح', '{\"color\":\"#9ea4ab\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.3735515446263108\",\"y\":\"0.7843017578124993\",\"width\":\"2289.0\",\"height\":\"2289.0\"}', 1, 1, 1, 127, 8, '2025-06-24', '12:14:00', '2025-06-19 12:21:31', '2025-06-19 12:21:31', '2024-11-24', 'include', 463),
(689, 'دعوة ٩', '{\"color\":\"#2196f3\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.3561605670439242\",\"y\":\"0.2458913180593747\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-30', '00:37:00', '2025-06-20 00:38:09', '2025-06-20 00:38:10', '2024-11-24', 'include', 464),
(690, 'دعوة ٩', '{\"color\":\"#2196f3\",\"size\":\"24\",\"font\":\"Amiri\",\"x\":\"0.3561605670439242\",\"y\":\"0.2458913180593747\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-30', '00:37:00', '2025-06-20 00:55:30', '2025-06-20 00:55:31', '2024-11-24', 'include', 465),
(691, 'محرر ااصور', '{\"color\":\"#cf6c20\",\"size\":\"32\",\"font\":\"Almarai\",\"x\":\"0.2553007474477576\",\"y\":\"0.25075450751140543\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-29', '01:24:00', '2025-06-20 01:26:22', '2025-06-20 01:26:23', '2024-11-24', 'include', 466),
(692, 'محرر ااصور', '{\"color\":\"#cf6c20\",\"size\":\"32\",\"font\":\"Almarai\",\"x\":\"0.2553007474477576\",\"y\":\"0.25075450751140543\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-29', '01:24:00', '2025-06-20 01:31:56', '2025-06-20 01:31:57', '2024-11-24', 'include', 467),
(693, 'محرر ااصور', '{\"color\":\"#cf6c20\",\"size\":\"32\",\"font\":\"Almarai\",\"x\":\"0.2553007474477576\",\"y\":\"0.25075450751140543\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-29', '01:24:00', '2025-06-20 01:33:09', '2025-06-20 01:33:09', '2024-11-24', 'include', 468),
(694, 'محرر ااصور', '{\"color\":\"#cf6c20\",\"size\":\"32\",\"font\":\"Almarai\",\"x\":\"0.2553007474477576\",\"y\":\"0.25075450751140543\",\"width\":\"1032.0\",\"height\":\"1460.0\"}', 1, 1, 1, 127, 8, '2025-06-29', '01:24:00', '2025-06-20 01:35:19', '2025-06-20 01:35:20', '2024-11-24', 'include', 469);

-- --------------------------------------------------------

--
-- Table structure for table `user_packages`
--

CREATE TABLE `user_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_user_invitation_id` bigint(20) UNSIGNED NOT NULL,
  `invitation_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_packages`
--

INSERT INTO `user_packages` (`id`, `payment_user_invitation_id`, `invitation_id`, `user_id`, `created_at`, `updated_at`) VALUES
(35, 142, 1, 23, '2025-01-01 21:50:02', '2025-01-01 21:50:02'),
(37, 144, 1, 53, '2025-01-05 03:42:34', '2025-01-05 03:42:34'),
(38, 145, 1, 53, '2025-01-05 03:42:43', '2025-01-05 03:42:43'),
(39, 146, 1, 53, '2025-01-05 03:42:46', '2025-01-05 03:42:46'),
(40, 147, 1, 53, '2025-01-05 03:44:31', '2025-01-05 03:44:31'),
(41, 148, 1, 53, '2025-01-05 03:44:37', '2025-01-05 03:44:37'),
(42, 149, 1, 53, '2025-01-05 03:44:47', '2025-01-05 03:44:47'),
(43, 150, 1, 53, '2025-01-05 03:44:49', '2025-01-05 03:44:49'),
(46, 153, 1, 23, '2025-01-06 13:37:15', '2025-01-06 13:37:15'),
(48, 155, 1, 55, '2025-01-11 19:07:45', '2025-01-11 19:07:45'),
(55, 162, 1, 56, '2025-01-15 17:56:32', '2025-01-15 17:56:32'),
(56, 163, 1, 56, '2025-01-15 19:40:45', '2025-01-15 19:40:45'),
(57, 164, 1, 60, '2025-01-26 00:38:20', '2025-01-26 00:38:20'),
(59, 166, 1, 69, '2025-02-27 00:20:21', '2025-02-27 00:20:21'),
(62, 169, 1, 69, '2025-03-15 00:59:43', '2025-03-15 00:59:43'),
(64, 171, 5, 69, '2025-03-20 17:20:18', '2025-03-20 17:20:18'),
(66, 173, 5, 69, '2025-04-05 15:01:13', '2025-04-05 15:01:13'),
(68, 175, 1, 69, '2025-04-06 01:04:11', '2025-04-06 01:04:11'),
(139, 247, 1, 53, '2025-05-11 17:28:04', '2025-05-11 17:28:04'),
(144, 253, 1, 98, '2025-05-24 08:26:31', '2025-05-24 08:26:31'),
(145, 254, 1, 98, '2025-05-24 08:26:36', '2025-05-24 08:26:36'),
(146, 255, 1, 98, '2025-05-24 08:26:41', '2025-05-24 08:26:41'),
(147, 256, 1, 98, '2025-05-24 08:26:53', '2025-05-24 08:26:53'),
(148, 257, 1, 98, '2025-05-24 08:29:15', '2025-05-24 08:29:15'),
(149, 258, 1, 98, '2025-05-24 08:29:24', '2025-05-24 08:29:24'),
(150, 259, 1, 98, '2025-05-24 08:29:25', '2025-05-24 08:29:25'),
(151, 260, 1, 98, '2025-05-24 08:29:35', '2025-05-24 08:29:35'),
(152, 261, 1, 98, '2025-05-24 08:46:47', '2025-05-24 08:46:47'),
(153, 262, 1, 98, '2025-05-24 08:47:13', '2025-05-24 08:47:13'),
(154, 263, 1, 98, '2025-05-24 08:47:16', '2025-05-24 08:47:16'),
(164, 273, 1, 97, '2025-05-24 14:02:56', '2025-05-24 14:02:56'),
(307, 417, 8, 8, '2025-06-11 04:20:01', '2025-06-11 04:20:01'),
(308, 418, 1, 8, '2025-06-11 04:21:21', '2025-06-11 04:21:21'),
(309, 419, 8, 8, '2025-06-11 04:31:27', '2025-06-11 04:31:27'),
(310, 420, 1, 8, '2025-06-11 06:30:57', '2025-06-11 06:30:57'),
(312, 422, 1, 8, '2025-06-11 14:36:21', '2025-06-11 14:36:21'),
(313, 423, 8, 127, '2025-06-11 15:50:32', '2025-06-11 15:50:32'),
(314, 424, 1, 127, '2025-06-11 21:59:06', '2025-06-11 21:59:06'),
(315, 425, 8, 127, '2025-06-11 22:12:55', '2025-06-11 22:12:55'),
(316, 426, 8, 127, '2025-06-11 22:17:38', '2025-06-11 22:17:38'),
(317, 427, 8, 127, '2025-06-11 22:47:47', '2025-06-11 22:47:47'),
(318, 428, 1, 8, '2025-06-11 23:24:10', '2025-06-11 23:24:10'),
(320, 430, 8, 127, '2025-06-12 21:05:27', '2025-06-12 21:05:27'),
(321, 431, 1, 8, '2025-06-13 14:48:10', '2025-06-13 14:48:10'),
(322, 432, 1, 8, '2025-06-13 14:48:45', '2025-06-13 14:48:45'),
(323, 433, 8, 8, '2025-06-13 16:55:21', '2025-06-13 16:55:21'),
(324, 434, 8, 8, '2025-06-13 17:07:01', '2025-06-13 17:07:01'),
(325, 435, 8, 127, '2025-06-13 18:27:47', '2025-06-13 18:27:47'),
(326, 436, 8, 127, '2025-06-13 18:28:47', '2025-06-13 18:28:47'),
(327, 437, 8, 127, '2025-06-13 18:29:37', '2025-06-13 18:29:37'),
(328, 438, 8, 127, '2025-06-13 18:34:27', '2025-06-13 18:34:27'),
(329, 439, 8, 127, '2025-06-13 18:52:18', '2025-06-13 18:52:18'),
(330, 440, 8, 127, '2025-06-13 18:53:00', '2025-06-13 18:53:00'),
(331, 441, 8, 127, '2025-06-13 18:59:22', '2025-06-13 18:59:22'),
(332, 442, 8, 127, '2025-06-13 19:02:45', '2025-06-13 19:02:45'),
(333, 443, 8, 127, '2025-06-13 19:05:37', '2025-06-13 19:05:37'),
(334, 444, 8, 127, '2025-06-13 19:07:35', '2025-06-13 19:07:35'),
(335, 445, 8, 127, '2025-06-13 19:11:50', '2025-06-13 19:11:50'),
(336, 446, 8, 127, '2025-06-13 19:18:20', '2025-06-13 19:18:20'),
(337, 447, 8, 127, '2025-06-13 19:19:57', '2025-06-13 19:19:57'),
(338, 448, 8, 127, '2025-06-13 19:45:27', '2025-06-13 19:45:27'),
(339, 449, 8, 127, '2025-06-13 19:48:39', '2025-06-13 19:48:39'),
(340, 450, 8, 127, '2025-06-13 19:58:13', '2025-06-13 19:58:13'),
(341, 451, 8, 127, '2025-06-13 20:01:35', '2025-06-13 20:01:35'),
(342, 452, 8, 127, '2025-06-13 20:01:38', '2025-06-13 20:01:38'),
(343, 453, 8, 127, '2025-06-13 20:02:07', '2025-06-13 20:02:07'),
(344, 454, 8, 127, '2025-06-13 20:04:02', '2025-06-13 20:04:02'),
(345, 455, 8, 127, '2025-06-13 20:04:30', '2025-06-13 20:04:30'),
(346, 456, 8, 127, '2025-06-13 22:54:35', '2025-06-13 22:54:35'),
(347, 457, 8, 127, '2025-06-13 22:57:39', '2025-06-13 22:57:39'),
(348, 458, 8, 127, '2025-06-13 22:58:30', '2025-06-13 22:58:30'),
(349, 459, 8, 127, '2025-06-13 22:59:46', '2025-06-13 22:59:46'),
(350, 460, 8, 127, '2025-06-13 23:03:55', '2025-06-13 23:03:55'),
(351, 461, 8, 8, '2025-06-14 00:48:09', '2025-06-14 00:48:09'),
(352, 462, 8, 8, '2025-06-14 00:54:24', '2025-06-14 00:54:24'),
(353, 463, 8, 8, '2025-06-14 00:56:31', '2025-06-14 00:56:31'),
(354, 464, 8, 127, '2025-06-14 01:32:47', '2025-06-14 01:32:47'),
(355, 465, 8, 127, '2025-06-14 01:35:32', '2025-06-14 01:35:32'),
(356, 466, 8, 127, '2025-06-14 01:48:07', '2025-06-14 01:48:07'),
(357, 467, 8, 127, '2025-06-14 01:55:46', '2025-06-14 01:55:46'),
(358, 468, 8, 127, '2025-06-14 01:58:21', '2025-06-14 01:58:21'),
(359, 469, 8, 127, '2025-06-14 01:59:06', '2025-06-14 01:59:06'),
(360, 470, 8, 127, '2025-06-14 01:59:24', '2025-06-14 01:59:24'),
(361, 471, 8, 127, '2025-06-14 02:00:26', '2025-06-14 02:00:26'),
(362, 472, 8, 127, '2025-06-14 02:05:53', '2025-06-14 02:05:53'),
(363, 473, 8, 127, '2025-06-14 02:13:03', '2025-06-14 02:13:03'),
(364, 474, 8, 127, '2025-06-14 02:18:39', '2025-06-14 02:18:39'),
(365, 475, 8, 127, '2025-06-14 02:27:06', '2025-06-14 02:27:06'),
(366, 476, 8, 127, '2025-06-14 02:34:15', '2025-06-14 02:34:15'),
(367, 477, 8, 127, '2025-06-14 02:38:39', '2025-06-14 02:38:39'),
(368, 478, 8, 127, '2025-06-14 02:43:14', '2025-06-14 02:43:14'),
(369, 479, 8, 127, '2025-06-14 02:46:00', '2025-06-14 02:46:00'),
(370, 480, 8, 127, '2025-06-14 02:51:26', '2025-06-14 02:51:26'),
(371, 481, 8, 127, '2025-06-15 23:45:00', '2025-06-15 23:45:00'),
(372, 482, 8, 127, '2025-06-15 23:49:39', '2025-06-15 23:49:39'),
(373, 483, 8, 127, '2025-06-15 23:49:42', '2025-06-15 23:49:42'),
(374, 484, 8, 127, '2025-06-15 23:49:45', '2025-06-15 23:49:45'),
(375, 485, 8, 127, '2025-06-15 23:50:33', '2025-06-15 23:50:33'),
(376, 486, 8, 127, '2025-06-15 23:51:53', '2025-06-15 23:51:53'),
(377, 487, 8, 127, '2025-06-16 00:00:49', '2025-06-16 00:00:49'),
(378, 488, 8, 127, '2025-06-16 00:13:29', '2025-06-16 00:13:29'),
(379, 489, 8, 127, '2025-06-16 00:31:29', '2025-06-16 00:31:29'),
(380, 490, 8, 127, '2025-06-16 01:05:50', '2025-06-16 01:05:50'),
(381, 491, 8, 127, '2025-06-16 01:08:25', '2025-06-16 01:08:25'),
(382, 492, 8, 127, '2025-06-16 01:08:32', '2025-06-16 01:08:32'),
(383, 493, 8, 127, '2025-06-16 01:15:11', '2025-06-16 01:15:11'),
(384, 494, 8, 127, '2025-06-16 01:15:12', '2025-06-16 01:15:12'),
(385, 495, 8, 127, '2025-06-16 01:16:53', '2025-06-16 01:16:53'),
(386, 496, 8, 127, '2025-06-16 01:18:51', '2025-06-16 01:18:51'),
(387, 497, 8, 127, '2025-06-16 01:20:12', '2025-06-16 01:20:12'),
(388, 498, 8, 127, '2025-06-16 01:24:04', '2025-06-16 01:24:04'),
(389, 499, 8, 127, '2025-06-16 01:26:55', '2025-06-16 01:26:55'),
(390, 500, 8, 127, '2025-06-16 01:28:34', '2025-06-16 01:28:34'),
(391, 501, 8, 127, '2025-06-16 01:30:36', '2025-06-16 01:30:36'),
(392, 502, 8, 127, '2025-06-16 01:31:42', '2025-06-16 01:31:42'),
(393, 503, 8, 127, '2025-06-16 01:32:48', '2025-06-16 01:32:48'),
(394, 504, 8, 127, '2025-06-16 01:33:53', '2025-06-16 01:33:53'),
(395, 505, 8, 127, '2025-06-16 01:34:53', '2025-06-16 01:34:53'),
(396, 506, 8, 127, '2025-06-16 01:35:55', '2025-06-16 01:35:55'),
(397, 507, 8, 127, '2025-06-16 01:36:51', '2025-06-16 01:36:51'),
(398, 508, 8, 127, '2025-06-16 01:38:04', '2025-06-16 01:38:04'),
(399, 509, 8, 127, '2025-06-16 01:39:55', '2025-06-16 01:39:55'),
(400, 510, 8, 127, '2025-06-16 01:41:15', '2025-06-16 01:41:15'),
(401, 511, 8, 127, '2025-06-16 01:44:01', '2025-06-16 01:44:01'),
(402, 512, 8, 127, '2025-06-16 01:46:08', '2025-06-16 01:46:08'),
(403, 513, 8, 127, '2025-06-16 01:47:35', '2025-06-16 01:47:35'),
(404, 514, 8, 127, '2025-06-16 01:49:21', '2025-06-16 01:49:21'),
(405, 515, 8, 127, '2025-06-16 01:51:06', '2025-06-16 01:51:06'),
(406, 516, 8, 127, '2025-06-16 01:52:16', '2025-06-16 01:52:16'),
(407, 517, 8, 127, '2025-06-16 01:54:41', '2025-06-16 01:54:41'),
(408, 518, 8, 127, '2025-06-16 01:56:04', '2025-06-16 01:56:04'),
(409, 519, 8, 127, '2025-06-16 01:58:26', '2025-06-16 01:58:26'),
(410, 520, 8, 127, '2025-06-16 02:01:37', '2025-06-16 02:01:37'),
(411, 521, 8, 127, '2025-06-16 02:01:40', '2025-06-16 02:01:40'),
(412, 522, 8, 127, '2025-06-16 02:04:24', '2025-06-16 02:04:24'),
(413, 523, 8, 127, '2025-06-16 02:04:28', '2025-06-16 02:04:28'),
(414, 524, 8, 127, '2025-06-16 02:05:16', '2025-06-16 02:05:16'),
(415, 525, 8, 127, '2025-06-16 02:06:59', '2025-06-16 02:06:59'),
(416, 526, 8, 127, '2025-06-16 02:08:25', '2025-06-16 02:08:25'),
(417, 527, 8, 127, '2025-06-16 02:09:43', '2025-06-16 02:09:43'),
(418, 528, 8, 127, '2025-06-16 02:10:45', '2025-06-16 02:10:45'),
(419, 529, 8, 127, '2025-06-16 02:11:45', '2025-06-16 02:11:45'),
(420, 530, 8, 127, '2025-06-16 02:12:48', '2025-06-16 02:12:48'),
(421, 531, 8, 127, '2025-06-16 02:14:17', '2025-06-16 02:14:17'),
(422, 532, 8, 127, '2025-06-16 02:15:42', '2025-06-16 02:15:42'),
(423, 533, 8, 127, '2025-06-16 02:19:20', '2025-06-16 02:19:20'),
(424, 534, 8, 127, '2025-06-16 02:20:54', '2025-06-16 02:20:54'),
(425, 535, 8, 127, '2025-06-16 02:24:03', '2025-06-16 02:24:03'),
(426, 536, 8, 127, '2025-06-16 02:26:38', '2025-06-16 02:26:38'),
(427, 537, 8, 127, '2025-06-16 02:44:37', '2025-06-16 02:44:37'),
(428, 538, 8, 127, '2025-06-16 02:45:44', '2025-06-16 02:45:44'),
(429, 539, 8, 127, '2025-06-16 02:50:42', '2025-06-16 02:50:42'),
(430, 540, 8, 127, '2025-06-16 02:53:15', '2025-06-16 02:53:15'),
(431, 541, 8, 127, '2025-06-16 02:59:16', '2025-06-16 02:59:16'),
(432, 542, 8, 127, '2025-06-16 02:59:54', '2025-06-16 02:59:54'),
(433, 543, 8, 127, '2025-06-16 03:01:51', '2025-06-16 03:01:51'),
(434, 544, 8, 127, '2025-06-16 03:02:42', '2025-06-16 03:02:42'),
(435, 545, 8, 127, '2025-06-16 03:05:26', '2025-06-16 03:05:26'),
(436, 546, 8, 127, '2025-06-16 03:06:52', '2025-06-16 03:06:52'),
(437, 547, 8, 8, '2025-06-16 03:56:21', '2025-06-16 03:56:21'),
(438, 548, 8, 127, '2025-06-16 19:48:39', '2025-06-16 19:48:39'),
(439, 549, 8, 127, '2025-06-16 19:50:44', '2025-06-16 19:50:44'),
(440, 550, 8, 127, '2025-06-16 19:52:38', '2025-06-16 19:52:38'),
(441, 551, 8, 127, '2025-06-16 19:53:43', '2025-06-16 19:53:43'),
(442, 552, 8, 127, '2025-06-16 19:54:25', '2025-06-16 19:54:25'),
(443, 553, 8, 127, '2025-06-16 19:55:08', '2025-06-16 19:55:08'),
(444, 554, 8, 127, '2025-06-16 19:56:17', '2025-06-16 19:56:17'),
(445, 555, 8, 127, '2025-06-16 19:57:18', '2025-06-16 19:57:18'),
(446, 556, 8, 127, '2025-06-16 20:07:40', '2025-06-16 20:07:40'),
(447, 557, 8, 127, '2025-06-16 20:08:33', '2025-06-16 20:08:33'),
(448, 558, 8, 127, '2025-06-16 20:09:28', '2025-06-16 20:09:28'),
(449, 559, 8, 127, '2025-06-16 20:16:21', '2025-06-16 20:16:21'),
(450, 560, 8, 127, '2025-06-16 20:17:18', '2025-06-16 20:17:18'),
(451, 561, 8, 127, '2025-06-16 20:18:03', '2025-06-16 20:18:03'),
(452, 562, 8, 127, '2025-06-16 20:19:58', '2025-06-16 20:19:58'),
(453, 563, 8, 127, '2025-06-16 20:20:55', '2025-06-16 20:20:55'),
(454, 564, 8, 127, '2025-06-16 20:21:35', '2025-06-16 20:21:35'),
(455, 565, 8, 8, '2025-06-19 00:35:58', '2025-06-19 00:35:58'),
(456, 566, 8, 127, '2025-06-19 10:38:42', '2025-06-19 10:38:42'),
(457, 567, 8, 127, '2025-06-19 10:40:38', '2025-06-19 10:40:38'),
(458, 568, 8, 127, '2025-06-19 12:11:12', '2025-06-19 12:11:12'),
(459, 569, 8, 127, '2025-06-19 12:15:28', '2025-06-19 12:15:28'),
(460, 570, 8, 127, '2025-06-19 12:16:08', '2025-06-19 12:16:08'),
(461, 571, 8, 127, '2025-06-19 12:17:06', '2025-06-19 12:17:06'),
(462, 572, 8, 127, '2025-06-19 12:17:08', '2025-06-19 12:17:08'),
(463, 573, 8, 127, '2025-06-19 12:21:31', '2025-06-19 12:21:31'),
(464, 574, 8, 127, '2025-06-20 00:38:09', '2025-06-20 00:38:09'),
(465, 575, 8, 127, '2025-06-20 00:55:30', '2025-06-20 00:55:30'),
(466, 576, 8, 127, '2025-06-20 01:26:22', '2025-06-20 01:26:22'),
(467, 577, 8, 127, '2025-06-20 01:31:56', '2025-06-20 01:31:56'),
(468, 578, 8, 127, '2025-06-20 01:33:09', '2025-06-20 01:33:09'),
(469, 579, 8, 127, '2025-06-20 01:35:19', '2025-06-20 01:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_withdrawals`
--

CREATE TABLE `user_withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjust_installs`
--
ALTER TABLE `adjust_installs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjust_installs_user_id_foreign` (`user_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_phone_unique` (`phone`);

--
-- Indexes for table `device_invitations`
--
ALTER TABLE `device_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `device_invitations_device_id_unique` (`device_id`),
  ADD KEY `device_invitations_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invited_users`
--
ALTER TABLE `invited_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invited_users_user_invitations_id_foreign` (`user_invitations_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `marketer_codes`
--
ALTER TABLE `marketer_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_user_invitations`
--
ALTER TABLE `payment_user_invitations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_user_invitations_user_id_foreign` (`user_id`);

--
-- Indexes for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transferred_amounts`
--
ALTER TABLE `transferred_amounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transferred_amounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_referral_id_foreign` (`referral_id`);

--
-- Indexes for table `user_invitations`
--
ALTER TABLE `user_invitations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_invitations_invitation_id_foreign` (`invitation_id`),
  ADD KEY `user_invitations_user_id_foreign` (`user_id`),
  ADD KEY `user_invitations_user_package_id_foreign` (`user_package_id`);

--
-- Indexes for table `user_packages`
--
ALTER TABLE `user_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_packages_payment_user_invitation_id_foreign` (`payment_user_invitation_id`),
  ADD KEY `user_packages_invitation_id_foreign` (`invitation_id`),
  ADD KEY `user_packages_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_withdrawals`
--
ALTER TABLE `user_withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_withdrawals_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjust_installs`
--
ALTER TABLE `adjust_installs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `device_invitations`
--
ALTER TABLE `device_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `halls`
--
ALTER TABLE `halls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `invited_users`
--
ALTER TABLE `invited_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=751;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=543;

--
-- AUTO_INCREMENT for table `marketer_codes`
--
ALTER TABLE `marketer_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1390;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `payment_user_invitations`
--
ALTER TABLE `payment_user_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=580;

--
-- AUTO_INCREMENT for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transferred_amounts`
--
ALTER TABLE `transferred_amounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `user_invitations`
--
ALTER TABLE `user_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=695;

--
-- AUTO_INCREMENT for table `user_packages`
--
ALTER TABLE `user_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=470;

--
-- AUTO_INCREMENT for table `user_withdrawals`
--
ALTER TABLE `user_withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjust_installs`
--
ALTER TABLE `adjust_installs`
  ADD CONSTRAINT `adjust_installs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `device_invitations`
--
ALTER TABLE `device_invitations`
  ADD CONSTRAINT `device_invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invited_users`
--
ALTER TABLE `invited_users`
  ADD CONSTRAINT `invited_users_user_invitations_id_foreign` FOREIGN KEY (`user_invitations_id`) REFERENCES `user_invitations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_user_invitations`
--
ALTER TABLE `payment_user_invitations`
  ADD CONSTRAINT `payment_user_invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transferred_amounts`
--
ALTER TABLE `transferred_amounts`
  ADD CONSTRAINT `transferred_amounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_referral_id_foreign` FOREIGN KEY (`referral_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user_invitations`
--
ALTER TABLE `user_invitations`
  ADD CONSTRAINT `user_invitations_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_invitations_user_package_id_foreign` FOREIGN KEY (`user_package_id`) REFERENCES `user_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_packages`
--
ALTER TABLE `user_packages`
  ADD CONSTRAINT `user_packages_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_packages_payment_user_invitation_id_foreign` FOREIGN KEY (`payment_user_invitation_id`) REFERENCES `payment_user_invitations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_packages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_withdrawals`
--
ALTER TABLE `user_withdrawals`
  ADD CONSTRAINT `user_withdrawals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
