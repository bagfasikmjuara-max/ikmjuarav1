-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 20, 2026 at 07:06 PM
-- Server version: 10.11.19-MariaDB-cll-lve
-- PHP Version: 8.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vbittrgt_ikmjuara`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
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
-- Table structure for table `form_app_responses`
--

CREATE TABLE `form_app_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_id` bigint(20) UNSIGNED NOT NULL,
  `nama_ikm` varchar(255) DEFAULT NULL,
  `answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`answers`)),
  `total_score` int(11) NOT NULL DEFAULT 0,
  `max_score` int(11) NOT NULL DEFAULT 100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_app_responses`
--

INSERT INTO `form_app_responses` (`id`, `template_id`, `nama_ikm`, `answers`, `total_score`, `max_score`, `created_at`, `updated_at`) VALUES
(2, 2, 'Lilik Widiawati', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 99, 100, '2026-09-16 06:40:38', '2026-09-16 06:40:38'),
(3, 2, 'Sri Murniati', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 95, 100, '2026-09-16 06:41:36', '2026-09-16 06:41:36'),
(4, 2, 'Endang srirahayu', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 100, 100, '2026-09-16 06:41:51', '2026-09-16 06:41:51'),
(5, 2, 'Dina aryati', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 100, 100, '2026-09-16 06:42:01', '2026-09-16 06:42:01'),
(6, 2, 'Yuyun yuniati', '{\"q1\":\"Setuju\",\"q2\":\"Setuju\",\"q3\":\"Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Baik\",\"q12\":\"Baik\",\"q13\":\"Baik\",\"q14\":\"Baik\",\"q15\":\"Baik\",\"q16\":\"Baik\",\"q17\":\"Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Memuaskan\"}', 75, 100, '2026-09-16 06:42:16', '2026-09-16 06:42:16'),
(7, 2, 'Wiken Rahmawati Nasrikah', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Memuaskan\"}', 90, 100, '2026-09-16 06:42:38', '2026-09-16 06:42:38'),
(8, 2, 'Eny Mujayanah', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 100, 100, '2026-09-16 06:42:38', '2026-09-16 06:42:38'),
(9, 2, 'Wijiati', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 91, 100, '2026-09-16 06:43:08', '2026-09-16 06:43:08'),
(10, 2, 'Veronika Dwi Sulistiyani', '{\"q1\":\"Setuju\",\"q2\":\"Setuju\",\"q3\":\"Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Baik\",\"q12\":\"Baik\",\"q13\":\"Baik\",\"q14\":\"Baik\",\"q15\":\"Baik\",\"q16\":\"Baik\",\"q17\":\"Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 77, 100, '2026-09-16 06:43:59', '2026-09-16 06:43:59'),
(11, 2, 'Sutamah', '{\"q1\":\"Setuju\",\"q2\":\"Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Baik\",\"q12\":\"Baik\",\"q13\":\"Baik\",\"q14\":\"Baik\",\"q15\":\"Baik\",\"q16\":\"Baik\",\"q17\":\"Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Cukup\",\"q20\":\"Cukup\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 76, 100, '2026-09-16 06:44:39', '2026-09-16 06:44:39'),
(12, 2, 'Wiwik Rumiyani', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Setuju\",\"q3\":\"Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 89, 100, '2026-09-16 06:44:41', '2026-09-16 06:44:41'),
(13, 2, 'SHINTA WIJAYANTI CANDRA WARDHANI', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 100, 100, '2026-09-16 06:46:09', '2026-09-16 06:46:09'),
(14, 2, 'Wiwik Mariyati', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Cukup\",\"q20\":\"Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 90, 100, '2026-09-16 06:51:39', '2026-09-16 06:51:39'),
(15, 2, 'Wiwin supriani', '{\"q1\":\"Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Baik\",\"q16\":\"Baik\",\"q17\":\"Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Memuaskan\"}', 81, 100, '2026-09-16 06:53:52', '2026-09-16 06:53:52'),
(16, 2, 'Subiarsih', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Baik\",\"q13\":\"Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Baik\",\"q16\":\"Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 89, 100, '2026-09-16 06:55:10', '2026-09-16 06:55:10'),
(17, 2, 'Ratna Sugiarti SP', '{\"q1\":\"Setuju\",\"q2\":\"Setuju\",\"q3\":\"Setuju\",\"q4\":\"Setuju\",\"q5\":\"Cukup\",\"q6\":\"Cukup\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 83, 100, '2026-09-16 06:56:16', '2026-09-16 06:56:16'),
(18, 2, 'Siti rowiyah', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 100, 100, '2026-09-16 07:05:08', '2026-09-16 07:05:08'),
(19, 2, 'Novilia Ratnawati', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 95, 100, '2026-09-16 07:16:06', '2026-09-16 07:16:06'),
(20, 2, 'Nada Fairuz Izdihar', '{\"q1\":\"Setuju\",\"q2\":\"Setuju\",\"q3\":\"Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Baik\",\"q12\":\"Baik\",\"q13\":\"Baik\",\"q14\":\"Baik\",\"q15\":\"Baik\",\"q16\":\"Baik\",\"q17\":\"Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Cukup\"}', 74, 100, '2026-09-16 07:56:23', '2026-09-16 07:56:23'),
(21, 2, 'Sri wahyuni muji astuti', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 99, 100, '2026-09-16 08:24:24', '2026-09-16 08:24:24'),
(22, 2, 'Slamet', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 97, 100, '2026-09-16 08:36:35', '2026-09-16 08:36:35'),
(23, 2, 'Septy Kusumawardani', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 98, 100, '2026-09-16 08:37:23', '2026-09-16 08:37:23'),
(24, 2, 'Sundari', '{\"q1\":\"Setuju\",\"q2\":\"Setuju\",\"q3\":\"Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Baik\",\"q12\":\"Baik\",\"q13\":\"Baik\",\"q14\":\"Baik\",\"q15\":\"Baik\",\"q16\":\"Baik\",\"q17\":\"Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Memuaskan\"}', 75, 100, '2026-09-16 08:47:59', '2026-09-16 08:47:59'),
(25, 2, 'Kak seto', '{\"q1\":\"Setuju\",\"q2\":\"Setuju\",\"q3\":\"Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Baik\",\"q12\":\"Baik\",\"q13\":\"Baik\",\"q14\":\"Baik\",\"q15\":\"Baik\",\"q16\":\"Baik\",\"q17\":\"Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Cukup\",\"q20\":\"Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Cukup\",\"q23\":\"Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Memuaskan\"}', 73, 100, '2026-09-16 09:14:43', '2026-09-16 09:14:43'),
(26, 2, 'Helda Tri Habsari', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 95, 100, '2026-09-16 09:44:33', '2026-09-16 09:44:33'),
(27, 2, 'AGUS WIJANARKO', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 91, 100, '2026-09-16 10:06:47', '2026-09-16 10:06:47'),
(28, 2, 'Any Harijanti', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Cukup\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Memuaskan\"}', 84, 100, '2026-09-16 15:20:51', '2026-09-16 15:20:51'),
(29, 3, 'ARDHIANA SEPTIANINGRUM', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 98, 100, '2026-09-17 03:20:06', '2026-09-17 03:20:06'),
(30, 3, 'Yohanes Devin Alvianto', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 99, 100, '2026-09-17 03:20:56', '2026-09-17 03:20:56'),
(31, 3, 'Cicilia Ineke Lesmana', '{\"q1\":\"Setuju\",\"q2\":\"Setuju\",\"q3\":\"Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Baik\",\"q13\":\"Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Cukup\",\"q16\":\"Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Cukup\",\"q20\":\"Cukup\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Memuaskan\"}', 76, 100, '2026-09-17 03:22:24', '2026-09-17 03:22:24'),
(32, 3, 'Irfan Fadhillah', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Memuaskan\"}', 95, 100, '2026-09-17 03:22:45', '2026-09-17 03:22:45'),
(33, 3, 'Ari  Puji Astuti', '{\"q1\":\"Setuju\",\"q2\":\"Setuju\",\"q3\":\"Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Baik\",\"q12\":\"Baik\",\"q13\":\"Baik\",\"q14\":\"Baik\",\"q15\":\"Baik\",\"q16\":\"Baik\",\"q17\":\"Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Memuaskan\"}', 75, 100, '2026-09-17 03:22:54', '2026-09-17 03:22:54'),
(34, 3, 'Ratnawati al hasan', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 100, 100, '2026-09-17 03:23:24', '2026-09-17 03:23:24'),
(35, 3, 'Endang bagiyawanti', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 100, 100, '2026-09-17 03:23:32', '2026-09-17 03:23:32'),
(36, 3, 'Anik susiowati', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Baik\",\"q12\":\"Baik\",\"q13\":\"Baik\",\"q14\":\"Baik\",\"q15\":\"Baik\",\"q16\":\"Baik\",\"q17\":\"Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Cukup\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 79, 100, '2026-09-17 03:25:02', '2026-09-17 03:25:02'),
(37, 3, 'Asmy nuraidha sari', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 96, 100, '2026-09-17 03:25:09', '2026-09-17 03:25:09'),
(38, 3, 'Citra Putri Eritika', '{\"q1\":\"Setuju\",\"q2\":\"Cukup\",\"q3\":\"Cukup\",\"q4\":\"Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Cukup\",\"q7\":\"Setuju\",\"q8\":\"Cukup\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Baik\",\"q14\":\"Cukup\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Memuaskan\",\"q21\":\"Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Memuaskan\"}', 75, 100, '2026-09-17 03:25:21', '2026-09-17 03:25:21'),
(39, 3, 'Arni Rohayati', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Baik\",\"q12\":\"Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Baik\",\"q16\":\"Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 93, 100, '2026-09-17 03:27:06', '2026-09-17 03:27:06'),
(40, 3, 'Bunga melati', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Setuju\",\"q5\":\"Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Setuju\",\"q8\":\"Setuju\",\"q9\":\"Setuju\",\"q10\":\"Setuju\",\"q11\":\"Baik\",\"q12\":\"Baik\",\"q13\":\"Baik\",\"q14\":\"Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Baik\",\"q17\":\"Baik\",\"q18\":\"Memuaskan\",\"q19\":\"Memuaskan\",\"q20\":\"Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Memuaskan\",\"q23\":\"Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 82, 100, '2026-09-17 03:27:31', '2026-09-17 03:27:31'),
(41, 3, 'Hari Fadjar Tri Kusumawardani', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 100, 100, '2026-09-17 03:31:20', '2026-09-17 03:31:20'),
(42, 3, 'Hendra budiantono', '{\"q1\":\"Setuju\",\"q2\":\"Setuju\",\"q3\":\"Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 95, 100, '2026-09-17 03:32:37', '2026-09-17 03:32:37'),
(43, 3, 'Puji hastuti', '{\"q1\":\"Sangat Setuju\",\"q2\":\"Sangat Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Sangat Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Sangat Setuju\",\"q7\":\"Sangat Setuju\",\"q8\":\"Sangat Setuju\",\"q9\":\"Sangat Setuju\",\"q10\":\"Sangat Setuju\",\"q11\":\"Sangat Baik\",\"q12\":\"Sangat Baik\",\"q13\":\"Sangat Baik\",\"q14\":\"Sangat Baik\",\"q15\":\"Sangat Baik\",\"q16\":\"Sangat Baik\",\"q17\":\"Sangat Baik\",\"q18\":\"Sangat Memuaskan\",\"q19\":\"Sangat Memuaskan\",\"q20\":\"Sangat Memuaskan\",\"q21\":\"Sangat Memuaskan\",\"q22\":\"Sangat Memuaskan\",\"q23\":\"Sangat Memuaskan\",\"q24\":\"Sangat Memuaskan\",\"q25\":\"Sangat Memuaskan\"}', 100, 100, '2026-09-17 03:33:11', '2026-09-17 03:33:11'),
(44, 3, 'Swanto', '{\"q1\":\"Setuju\",\"q2\":\"Setuju\",\"q3\":\"Sangat Setuju\",\"q4\":\"Setuju\",\"q5\":\"Sangat Setuju\",\"q6\":\"Setuju\",\"q7\":\"Cukup\",\"q8\":\"Cukup\",\"q9\":\"Cukup\",\"q10\":\"Sangat Setuju\",\"q11\":\"Baik\",\"q12\":\"Cukup\",\"q13\":\"Baik\",\"q14\":\"Cukup\",\"q15\":\"Cukup\",\"q16\":\"Baik\",\"q17\":\"Baik\",\"q18\":\"Kurang Memuaskan\",\"q19\":\"Cukup\",\"q20\":\"Cukup\",\"q21\":\"Cukup\",\"q22\":\"Cukup\",\"q23\":\"Memuaskan\",\"q24\":\"Cukup\",\"q25\":\"Cukup\"}', 64, 100, '2026-09-17 08:46:27', '2026-09-17 08:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `form_app_templates`
--

CREATE TABLE `form_app_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `penyelenggara` varchar(255) NOT NULL DEFAULT 'Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun',
  `lokasi` varchar(255) NOT NULL DEFAULT 'Resto I Club Madiun (Aula Utama)',
  `tanggal` date NOT NULL,
  `slug` varchar(255) NOT NULL,
  `structure` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`structure`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_app_templates`
--

INSERT INTO `form_app_templates` (`id`, `title`, `penyelenggara`, `lokasi`, `tanggal`, `slug`, `structure`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'KUESIONER EVALUASI PELATIHAN PENINGKATAN DAYA SAING MOTIF BATIK KHAS KOTA MADIUN - 14 S.D 16 SEPTEMBER 2026', 'Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun', 'Ruang Pertemuan Lantai II, Gedung Dekranasda Kota Madiun', '2026-09-16', 'kuesioner-evaluasi-pelatihan-peningkatan-daya-saing-motif-batik-khas-kota-madiun-14-sd-16-september-2026-qofVhG', '{\"sections\":[{\"title\":\"Bagian A: Kualitas dan Relevansi Materi\",\"subtitle\":\"Penilaian terhadap kualitas dan relevansi materi pelatihan\",\"type\":\"agree\",\"questions\":[{\"id\":\"q1\",\"text\":\"Materi pelatihan mudah dipahami dan dicerna dengan baik.\"},{\"id\":\"q2\",\"text\":\"Materi sangat relevan dengan kondisi dan tantangan IKM Batik saat ini.\"},{\"id\":\"q3\",\"text\":\"Materi memberikan wawasan baru untuk inovasi produk batik khas Kota Madiun.\"},{\"id\":\"q4\",\"text\":\"Materi tentang efisiensi proses produksi dapat langsung diaplikasikan dengan mudah\"},{\"id\":\"q5\",\"text\":\"Strategi pemasaran digital (termasuk pembuatan konten media sosial/video) aplikatif untuk usaha saya.\"},{\"id\":\"q6\",\"text\":\"Materi mengenai branding, penamaan, dan legalitas merek dijelaskan dengan sangat jelas.\"},{\"id\":\"q7\",\"text\":\"Materi didukung dengan contoh-contoh kasus nyata (best practice) yang sesuai.\"},{\"id\":\"q8\",\"text\":\"Modul, handout, atau bahan ajar digital yang diberikan sangat informatif.\"},{\"id\":\"q9\",\"text\":\"Proporsi antara teori dasar dan aktivitas praktik sangat seimbang.\"},{\"id\":\"q10\",\"text\":\"Materi pelatihan selalu mengacu pada kebaruan informasi dan tren pasar terkini.\"}],\"options\":[{\"val\":\"Sangat Setuju\",\"label\":\"Sangat Setuju\",\"score\":4},{\"val\":\"Setuju\",\"label\":\"Setuju\",\"score\":3},{\"val\":\"Cukup\",\"label\":\"Cukup\",\"score\":2},{\"val\":\"Kurang Setuju\",\"label\":\"Kurang Setuju\",\"score\":1}]},{\"title\":\"Bagian B: Kinerja Fasilitator / Narasumber\",\"subtitle\":\"Penilaian terhadap kualitas kinerja narasumber selama pelatihan\",\"type\":\"performance\",\"questions\":[{\"id\":\"q11\",\"text\":\"Tingkat penguasaan fasilitator terhadap materi kewirausahaan dan daya saing.\"},{\"id\":\"q12\",\"text\":\"Sistematika dan keruntutan fasilitator dalam menyampaikan materi.\"},{\"id\":\"q13\",\"text\":\"Kemampuan fasilitator dalam mendorong pelaku IKM untuk berinteraksi dan berbagi pengalaman.\"},{\"id\":\"q14\",\"text\":\"Kemampuan fasilitator dalam memberikan solusi praktis dan tepat sasaran saat sesi tanya jawab.\"},{\"id\":\"q15\",\"text\":\"Kedisiplinan fasilitator terhadap waktu (mulai dan selesai tepat waktu).\"},{\"id\":\"q16\",\"text\":\"Pembawaan fasilitator dalam menjaga antusiasme dan energi peserta selama pelatihan.\"},{\"id\":\"q17\",\"text\":\"Kejelasan fasilitator saat memandu sesi simulasi atau praktik.\"}],\"options\":[{\"val\":\"Sangat Baik\",\"label\":\"Sangat Baik\",\"score\":4},{\"val\":\"Baik\",\"label\":\"Baik\",\"score\":3},{\"val\":\"Cukup\",\"label\":\"Cukup\",\"score\":2},{\"val\":\"Kurang\",\"label\":\"Kurang\",\"score\":1}]},{\"title\":\"Bagian C: Penyelenggaraan dan Fasilitas Pelatihan\",\"subtitle\":\"Tingkat kepuasan mengenai fasilitas dan layanan panitia\",\"type\":\"facility\",\"questions\":[{\"id\":\"q18\",\"text\":\"Kenyamanan ruangan (aula/tempat pelatihan) dan suasana belajar selama acara.\"},{\"id\":\"q19\",\"text\":\"Kualitas sarana pendukung audio visual (layar presentasi, mikrofon, dan tata suara).\"},{\"id\":\"q20\",\"text\":\"Kualitas dan ketepatan waktu penyajian konsumsi (makan, minum, atau coffee break).\"},{\"id\":\"q21\",\"text\":\"Keramahan, kesigapan, dan pelayanan dari panitia/penyelenggara selama kegiatan.\"},{\"id\":\"q22\",\"text\":\"Kecepatan dan efisiensi proses administrasi (registrasi, presensi, pembagian sertifikat).\"}],\"options\":[{\"val\":\"Sangat Memuaskan\",\"label\":\"Sangat Memuaskan\",\"score\":4},{\"val\":\"Memuaskan\",\"label\":\"Memuaskan\",\"score\":3},{\"val\":\"Cukup\",\"label\":\"Cukup\",\"score\":2},{\"val\":\"Kurang Memuaskan\",\"label\":\"Kurang Memuaskan\",\"score\":1}]},{\"title\":\"Bagian D: Dampak Keseluruhan dan Rencana Tindak Lanjut\",\"subtitle\":\"Penilaian dampak pelatihan terhadap perkembangan skala usaha\",\"type\":\"impact\",\"questions\":[{\"id\":\"q23\",\"text\":\"Pelatihan ini meningkatkan motivasi dan kepercayaan diri saya untuk mengembangkan skala usaha.\"},{\"id\":\"q24\",\"text\":\"Saya akan merekomendasikan pelatihan semacam ini kepada rekan pelaku IKM lainnya.\"},{\"id\":\"q25\",\"text\":\"Tingkat kepuasan Anda secara keseluruhan terhadap pelaksanaan kegiatan pelatihan ini.\"}],\"options\":[{\"val\":\"Sangat Memuaskan\",\"label\":\"Sangat Memuaskan / Sangat Setuju\",\"score\":4},{\"val\":\"Memuaskan\",\"label\":\"Memuaskan / Setuju\",\"score\":3},{\"val\":\"Cukup\",\"label\":\"Cukup\",\"score\":2},{\"val\":\"Kurang\",\"label\":\"Kurang Memuaskan / Kurang Setuju\",\"score\":1}]}]}', 1, '2026-09-16 05:20:07', '2026-09-16 05:20:07'),
(3, 'Pelatihan Peningkatan Daya Saing Produk Halal II dan III', 'Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun', 'Warung Latte - Jl. Cokroaminoto No.88, Pandean, Kec. Taman, Kota Madiun, Jawa Timur 63133', '2026-09-17', 'pelatihan-peningkatan-daya-saing-produk-halal-ii-dan-iii-WAlmiJ', '{\"sections\":[{\"title\":\"Bagian A: Kualitas dan Relevansi Materi\",\"subtitle\":\"Penilaian terhadap kualitas dan relevansi materi pelatihan\",\"type\":\"agree\",\"questions\":[{\"id\":\"q1\",\"text\":\"Materi pelatihan mudah dipahami dan dicerna dengan baik.\"},{\"id\":\"q2\",\"text\":\"Materi sangat relevan dengan kondisi dan tantangan IKM makanan dan minuman saat ini.\"},{\"id\":\"q3\",\"text\":\"Materi memberikan wawasan baru untuk inovasi produk makanan dan minuman halal khas Kota Madiun\"},{\"id\":\"q4\",\"text\":\"Materi tentang standar proses produksi Halal (termasuk rincian penanganan semua bahan-bahan di proses produksi) dapat langsung diaplikasikan dengan mudah.\"},{\"id\":\"q5\",\"text\":\"Strategi pemasaran digital untuk produk halal (termasuk pembuatan konten media sosial/video) aplikatif untuk usaha saya.\"},{\"id\":\"q6\",\"text\":\"Materi mengenai branding, pengemasan, dan legalitas usaha (terutama alur Sertifikasi Halal) dijelaskan dengan sangat jelas.\"},{\"id\":\"q7\",\"text\":\"Materi didukung dengan contoh-contoh kasus nyata (best practice) dari IKM makanan/minuman yang telah sukses tersertifikasi.\"},{\"id\":\"q8\",\"text\":\"Bahan ajar digital (seperti panduan Sistem Jaminan Produk Halal) yang diberikan sangat informatif.\"},{\"id\":\"q9\",\"text\":\"Proporsi antara teori dasar dan aktivitas praktik (seperti simulasi pendaftaran/kurasi bahan) sangat seimbang.\"},{\"id\":\"q10\",\"text\":\"Materi pelatihan selalu mengacu pada regulasi sertifikasi Halal terbaru dan tren pasar kuliner terkini.\"}],\"options\":[{\"val\":\"Sangat Setuju\",\"label\":\"Sangat Setuju\",\"score\":4},{\"val\":\"Setuju\",\"label\":\"Setuju\",\"score\":3},{\"val\":\"Cukup\",\"label\":\"Cukup\",\"score\":2},{\"val\":\"Kurang Setuju\",\"label\":\"Kurang Setuju\",\"score\":1}]},{\"title\":\"Bagian B: Kinerja Fasilitator / Narasumber\",\"subtitle\":\"Penilaian terhadap kualitas kinerja narasumber selama pelatihan\",\"type\":\"performance\",\"questions\":[{\"id\":\"q11\",\"text\":\"Tingkat penguasaan fasilitator terhadap materi kewirausahaan dan standar jaminan mutu Halal.\"},{\"id\":\"q12\",\"text\":\"Sistematika dan keruntutan fasilitator dalam menyampaikan materi.\"},{\"id\":\"q13\",\"text\":\"Kemampuan fasilitator dalam mendorong pelaku IKM untuk berinteraksi dan berbagi pengalaman terkait kendala produksi.\"},{\"id\":\"q14\",\"text\":\"Kemampuan fasilitator dalam memberikan solusi praktis dan tepat sasaran saat sesi tanya jawab (misalnya terkait titik kritis bahan baku yang meragukan).\"},{\"id\":\"q15\",\"text\":\"Kedisiplinan fasilitator terhadap waktu (mulai dan selesai tepat waktu).\"},{\"id\":\"q16\",\"text\":\"Pembawaan fasilitator dalam menjaga antusiasme dan energi peserta selama pelatihan.\"},{\"id\":\"q17\",\"text\":\"Kejelasan fasilitator saat memandu sesi simulasi atau praktik (misal: pengisian form pengajuan Halal).\"}],\"options\":[{\"val\":\"Sangat Baik\",\"label\":\"Sangat Baik\",\"score\":4},{\"val\":\"Baik\",\"label\":\"Baik\",\"score\":3},{\"val\":\"Cukup\",\"label\":\"Cukup\",\"score\":2},{\"val\":\"Kurang\",\"label\":\"Kurang\",\"score\":1}]},{\"title\":\"Bagian C: Penyelenggaraan dan Fasilitas Pelatihan\",\"subtitle\":\"Tingkat kepuasan mengenai fasilitas dan layanan panitia\",\"type\":\"facility\",\"questions\":[{\"id\":\"q18\",\"text\":\"Kenyamanan ruangan (aula/tempat pelatihan) dan suasana belajar selama acara.\"},{\"id\":\"q19\",\"text\":\"Kualitas sarana pendukung audio visual (layar presentasi, mikrofon, dan tata suara).\"},{\"id\":\"q20\",\"text\":\"Kualitas dan ketepatan waktu penyajian konsumsi (makan, minum, atau coffee break).\"},{\"id\":\"q21\",\"text\":\"Keramahan, kesigapan, dan pelayanan dari panitia/penyelenggara selama kegiatan.\"},{\"id\":\"q22\",\"text\":\"Kecepatan dan efisiensi proses administrasi (registrasi, presensi, pembagian sertifikat).\"}],\"options\":[{\"val\":\"Sangat Memuaskan\",\"label\":\"Sangat Memuaskan\",\"score\":4},{\"val\":\"Memuaskan\",\"label\":\"Memuaskan\",\"score\":3},{\"val\":\"Cukup\",\"label\":\"Cukup\",\"score\":2},{\"val\":\"Kurang Memuaskan\",\"label\":\"Kurang Memuaskan\",\"score\":1}]},{\"title\":\"Bagian D: Dampak Keseluruhan dan Rencana Tindak Lanjut\",\"subtitle\":\"Penilaian dampak pelatihan terhadap perkembangan skala usaha\",\"type\":\"impact\",\"questions\":[{\"id\":\"q23\",\"text\":\"Pelatihan ini meningkatkan motivasi dan kepercayaan diri saya untuk segera mengurus sertifikasi Halal dan mengembangkan skala usaha.\"},{\"id\":\"q24\",\"text\":\"Saya akan merekomendasikan pelatihan semacam ini kepada rekan pelaku IKM makanan dan minuman lainnya.\"},{\"id\":\"q25\",\"text\":\"Tingkat kepuasan Anda secara keseluruhan terhadap pelaksanaan kegiatan pelatihan ini.\"}],\"options\":[{\"val\":\"Sangat Memuaskan\",\"label\":\"Sangat Memuaskan / Sangat Setuju\",\"score\":4},{\"val\":\"Memuaskan\",\"label\":\"Memuaskan / Setuju\",\"score\":3},{\"val\":\"Cukup\",\"label\":\"Cukup\",\"score\":2},{\"val\":\"Kurang\",\"label\":\"Kurang Memuaskan / Kurang Setuju\",\"score\":1}]}]}', 1, '2026-09-16 15:32:34', '2026-09-16 15:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_konsultasis`
--

CREATE TABLE `kategori_konsultasis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_konsultasis`
--

INSERT INTO `kategori_konsultasis` (`id`, `nama_kategori`, `deskripsi`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Pendampingan Manajemen Usaha', 'Konsultasi mengenai tata kelola usaha, manajemen kas, dan legalitas', 1, '2026-07-29 15:49:13', '2026-07-29 15:49:13'),
(2, 'Strategi Pemasaran Digital', 'Konsultasi seputar promosi media sosial, TikTok/FB Ads, marketplace, dan branding', 1, '2026-07-29 15:49:13', '2026-07-29 15:49:13'),
(3, 'Keluhan / Aspirasi Industri', 'Penyampaian keluhan operasional, perizinan industri, dan fasilitasi dinas', 1, '2026-07-29 15:49:13', '2026-07-29 15:49:13'),
(4, 'Konsultasi SIINas', NULL, 1, '2026-07-29 16:06:35', '2026-07-29 16:06:35');

-- --------------------------------------------------------

--
-- Table structure for table `kbli`
--

CREATE TABLE `kbli` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(10) NOT NULL,
  `judul` text NOT NULL,
  `versi` varchar(255) NOT NULL DEFAULT 'KBLI 2020',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kbli`
--

INSERT INTO `kbli` (`id`, `kode`, `judul`, `versi`, `created_at`, `updated_at`) VALUES
(1, '01111', 'PERTANIAN JAGUNG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(2, '01112', 'PERTANIAN SEREALIA SELAIN PADI DAN JAGUNG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(3, '01113', 'PERTANIAN KEDELAI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(4, '01114', 'PERTANIAN KACANG TANAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(5, '01115', 'PERTANIAN KACANG HIJAU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(6, '01116', 'PERTANIAN ANEKA KACANG SELAIN KEDELAI, KACANG TANAH,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(7, '01117', 'PERTANIAN BIJI - BIJIAN PENGHASIL MINYAK MAKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(8, '01118', 'PERTANIAN BIJI - BIJIAN PENGHASIL MINYAK SELAIN MINYAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(9, '01121', 'PERTANIAN PADI HIBRIDA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(10, '01122', 'PERTANIAN PADI INBRIDA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(11, '01131', 'PERTANIAN SAYURAN DAUN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(12, '01132', 'PERTANIAN BUAH SEMUSIM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(13, '01133', 'PERTANIAN SAYURAN BUAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(14, '01134', 'PERTANIAN SAYURAN UMBI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(15, '01135', 'PERTANIAN UBI KAYU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(16, '01136', 'PERTANIAN JAMUR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(17, '01137', 'PERTANIAN BIT GULA DAN TANAMAN PEMANIS SELAIN TEBU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(18, '01138', 'PERTANIAN CABAI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(19, '01139', 'PERTANIAN UMBI LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(20, '01140', 'PERTANIAN TEBU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(21, '01150', 'PERTANIAN TEMBAKAU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(22, '01160', 'PERTANIAN TANAMAN BERSERAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(23, '01191', 'PERTANIAN TANAMAN PAKAN TERNAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(24, '01192', 'PEMBENIHAN TANAMAN PAKAN TERNAK DAN PEMBENIHAN BIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(25, '01193', 'PERTANIAN TANAMAN BUNGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(26, '01194', 'PERTANIAN PEMBENIHAN TANAMAN BUNGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(27, '01199', 'PERTANIAN TANAMAN SEMUSIM LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(28, '01210', 'PERTANIAN BUAH ANGGUR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(29, '01220', 'PERTANIAN BUAH - BUAHAN TROPIS DAN SUBTROPIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(30, '01230', 'PERTANIAN BUAH JERUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(31, '01240', 'PERTANIAN BUAH APEL DAN BUAH BATU (POME AND STONE', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(32, '01251', 'PERTANIAN BUAH BERI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(33, '01252', 'PERTANIAN BUAH BIJI KACANG - KACANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(34, '01253', 'PERTANIAN SAYURAN TAHUNAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(35, '01259', 'PERTANIAN BUAH SEMAK LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(36, '01261', 'PERTANIAN KELAPA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(37, '01262', 'PERTANIAN KELAPA SAWIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(38, '01269', 'PERTANIAN BUAH OLEAGIN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(39, '01271', 'PERTANIAN KOPI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(40, '01272', 'PERTANIAN TANAMAN TEH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(41, '01273', 'PERTANIAN KAKAO', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(42, '01279', 'PERTANIAN TANAMAN UNTUK BAHAN MINUMAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(43, '01281', 'PERTANIAN LADA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(44, '01282', 'PERTANIAN CENGKIH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(45, '01283', 'PERTANIAN PALA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(46, '01284', 'PERTANIAN TANAMAN AROMATIK/PENYEGAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(47, '01285', 'PERTANIAN TANAMAN OBAT RIMPANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(48, '01286', 'PERTANIAN TANAMAN OBAT NONRIMPANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(49, '01287', 'PERTANIAN TANAMAN NARKOTIKA DAN TANAMAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(50, '01289', 'PERTANIAN TANAMAN REMPAH - REMPAH DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(51, '01291', 'PERTANIAN POHON KARET DAN TANAMAN PENGHASIL GETAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(52, '01299', 'PERTANIAN TANAMAN TAHUNAN LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(53, '01301', 'PERTANIAN TANAMAN HIAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(54, '01302', 'PENANGKARAN TUMBUHAN LIAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(55, '01309', 'PEMBIAKAN TANAMAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(56, '01411', 'BUDI DAYA DAN PEMBIBITAN SAPI POTONG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(57, '01412', 'BUDI DAYA DAN PEMBIBITAN SAPI PERAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(58, '01413', 'BUDI DAYA DAN PEMBIBITAN KERBAU POTONG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(59, '01414', 'BUDI DAYA DAN PEMBIBITAN KERBAU PERAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(60, '01420', 'PETERNAKAN KUDA DAN SEJENISNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(61, '01430', 'PETERNAKAN UNTA DAN SEJENISNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(62, '01441', 'BUDI DAYA DAN PEMBIBITAN DOMBA POTONG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(63, '01442', 'BUDI DAYA DAN PEMBIBITAN KAMBING POTONG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(64, '01443', 'BUDI DAYA DAN PEMBIBITAN KAMBING PERAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(65, '01444', 'BUDI DAYA DAN PEMBIBITAN DOMBA PERAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(66, '01445', 'PRODUKSI BULU DOMBA MENTAH/RAW WOOL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(67, '01450', 'PETERNAKAN BABI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(68, '01461', 'BUDI DAYA AYAM RAS PEDAGING', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(69, '01462', 'BUDI DAYA AYAM RAS PETELUR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(70, '01463', 'PEMBIBITAN AYAM LOKAL DAN PERSILANGANNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(71, '01464', 'BUDI DAYA AYAM LOKAL DAN PERSILANGANNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(72, '01465', 'BUDI DAYA DAN PEMBIBITAN ITIK DAN BEBEK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(73, '01466', 'BUDI DAYA DAN PEMBIBITAN BURUNG PUYUH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(74, '01467', 'BUDI DAYA DAN PEMBIBITAN BURUNG MERPATI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(75, '01468', 'PEMBIBITAN AYAM RAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(76, '01469', 'BUDI DAYA DAN PEMBIBITAN UNGGAS LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(77, '01491', 'BUDI DAYA DAN PEMBIBITAN BURUNG UNTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(78, '01492', 'BUDI DAYA DAN PEMBIBITAN ULAT SUTRA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(79, '01493', 'BUDI DAYA DAN PEMBIBITAN LEBAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(80, '01494', 'BUDI DAYA DAN PEMBIBITAN RUSA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(81, '01495', 'BUDI DAYA DAN PEMBIBITAN KELINCI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(82, '01496', 'BUDI DAYA DAN PEMBIBITAN CACING', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(83, '01497', 'BUDI DAYA DAN PEMBIBITAN BURUNG WALET', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(84, '01498', 'PENANGKARAN SATWA LIAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(85, '01499', 'BUDI DAYA DAN PEMBIBITAN HEWAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(86, '01611', 'JASA PENGOLAHAN LAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(87, '01612', 'JASA PEMUPUKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(88, '01613', 'JASA PEMANENAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(89, '01614', 'JASA PENYEMPROTAN DAN PENYERBUKAN MELALUI UDARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(90, '01615', 'JASA PENGENDALIAN ORGANISME PENGGANGGU TUMBUHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(91, '01616', 'JASA PENANAMAN BENIH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(92, '01619', 'JASA PENUNJANG PERTANIAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(93, '01621', 'JASA PERKAWINAN TERNAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(94, '01622', 'JASA PENETASAN TELUR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(95, '01629', 'JASA PENUNJANG PETERNAKAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(96, '01630', 'JASA PASCAPANEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(97, '01640', 'PEMILIHAN BENIH TANAMAN UNTUK PEMBIAKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(98, '01700', 'PERBURUAN, PENANGKAPAN, DAN KEGIATAN JASA TERKAIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(99, '02101', 'PENGELOLAAN HUTAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(100, '02102', 'PEMANFAATAN KAYU HUTAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(101, '02103', 'PEMBENIHAN TANAMAN KEHUTANAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(102, '02201', 'PEMANENAN KAYU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(103, '02202', 'PEMUNGUTAN KAYU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(104, '02300', 'PEMUNGUTAN HASIL HUTAN BUKAN KAYU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(105, '02401', 'JASA LINGKUNGAN HUTAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(106, '02402', 'JASA PENGGUNAAN KAWASAN KEHUTANAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(107, '02409', 'JASA PENUNJANG KEHUTANAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(108, '03110', 'PENANGKAPAN IKAN DAN BIOTA AIR LAINNYA DI LAUT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(109, '03120', 'PENANGKAPAN IKAN DAN BIOTA AIR LAINNYA DI PERAIRAN AIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(110, '03211', 'PEMBUDIDAYAAN IKAN BERSIRIP (SELAIN IKAN HIAS) DAN BIOTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(111, '03212', 'PEMBUDIDAYAAN IKAN HIAS AIR LAUT YANG TIDAK DILINDUNGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(112, '03213', 'PEMBUDIDAYAAN TUMBUHAN AIR LAUT YANG TIDAK DILINDUNGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(113, '03214', 'PENGEMBANGBIAKAN IKAN DAN BIOTA AIR LAUT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(114, '03221', 'PEMBUDIDAYAAN IKAN BERSIRIP (SELAIN IKAN HIAS) DAN BIOTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(115, '03222', 'PEMBUDIDAYAAN IKAN HIAS AIR TAWAR YANG TIDAK DILINDUNGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(116, '03223', 'PEMBUDIDAYAAN TUMBUHAN AIR TAWAR YANG TIDAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(117, '03224', 'PENGEMBANGBIAKAN BIOTA AIR TAWAR YANG DILINDUNGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(118, '03231', 'PEMBUDIDAYAAN IKAN BERSIRIP (SELAIN IKAN HIAS) DAN BIOTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(119, '03232', 'PEMBUDIDAYAAN IKAN HIAS AIR PAYAU YANG TIDAK DILINDUNGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(120, '03233', 'PEMBUDIDAYAAN TUMBUHAN AIR PAYAU YANG TIDAK DILINDUNGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(121, '03234', 'PENGEMBANGBIAKAN BIOTA AIR PAYAU YANG DILINDUNGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(122, '03300', 'JASA PENUNJANG KEGIATAN PENANGKAPAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(123, '05101', 'PERTAMBANGAN BATU BARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(124, '05102', 'BENEFISIASI ATAU PENINGKATAN KUALITAS BATU BARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(125, '05200', 'PERTAMBANGAN LIGNIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(126, '06100', 'PERTAMBANGAN MINYAK BUMI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(127, '06201', 'PERTAMBANGAN GAS ALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(128, '06202', 'PENGUSAHAAN TENAGA PANAS BUMI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(129, '07101', 'PERTAMBANGAN PASIR BESI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(130, '07102', 'PERTAMBANGAN BIJIH BESI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(131, '07210', 'PERTAMBANGAN BIJIH URANIUM DAN TORIUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(132, '07221', 'PERTAMBANGAN EMAS DAN PERAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(133, '07229', 'PERTAMBANGAN BIJIH LOGAM MULIA LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(134, '07291', 'PERTAMBANGAN BIJIH TIMAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(135, '07292', 'PERTAMBANGAN BIJIH TIMAH HITAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(136, '07293', 'PERTAMBANGAN BIJIH BAUKSIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(137, '07294', 'PERTAMBANGAN BIJIH TEMBAGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(138, '07295', 'PERTAMBANGAN BIJIH NIKEL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(139, '07296', 'PERTAMBANGAN BIJIH MANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(140, '07299', 'PERTAMBANGAN BAHAN GALIAN LAINNYA YANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(141, '08101', 'PENGGALIAN BATU HIAS DAN BATU BANGUNAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(142, '08102', 'PENGGALIAN BATU KAPUR/GAMPING', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(143, '08103', 'PENGGALIAN KERIKIL/SIRTU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(144, '08104', 'PENGGALIAN PASIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(145, '08105', 'PENGGALIAN TANAH DAN TANAH LIAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(146, '08106', 'PENGGALIAN GIPS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(147, '08107', 'PENGGALIAN TRAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(148, '08108', 'PENGGALIAN BATU APUNG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(149, '08109', 'PENGGALIAN BATU, PASIR, DAN TANAH LIAT LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(150, '08911', 'PERTAMBANGAN BELERANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(151, '08912', 'PERTAMBANGAN FOSFAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(152, '08913', 'PERTAMBANGAN NITRAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(153, '08914', 'PERTAMBANGAN YODIUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(154, '08915', 'PERTAMBANGAN POTASH (KALIUM KARBONAT)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(155, '08919', 'PERTAMBANGAN MINERAL, BAHAN KIMIA, DAN BAHAN PUPUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(156, '08920', 'EKSTRAKSI TANAH GAMBUT (PEAT)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(157, '08930', 'EKSTRAKSI GARAM Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(158, '08991', 'PERTAMBANGAN BATU MULIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(159, '08992', 'PENGGALIAN FELDSPAR DAN KALSIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(160, '08993', 'PERTAMBANGAN ASPAL ALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(161, '08994', 'PENGGALIAN ASBES', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(162, '08995', 'PENGGALIAN KUARSA/PASIR KUARSA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(163, '08996', 'PERTAMBANGAN BIJIH LOGAM TANAH JARANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(164, '08999', 'PERTAMBANGAN DAN PENGGALIAN LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(165, '09100', 'AKTIVITAS PENUNJANG PERTAMBANGAN MINYAK BUMI DAN GAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(166, '09900', 'AKTIVITAS PENUNJANG PERTAMBANGAN DAN PENGGALIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(167, '10111', 'KEGIATAN RUMAH POTONG HEWAN RUMINANSIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(168, '10112', 'KEGIATAN RUMAH POTONG BABI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(169, '10113', 'KEGIATAN RUMAH POTONG UNGGAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(170, '10119', 'KEGIATAN RUMAH POTONG HEWAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(171, '10120', 'PENGOLAHAN DAN PENGAWETAN DAGING DAN PRODUK DAGING', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(172, '10211', 'PENGOLAHAN DAN PENGAWETAN IKAN DENGAN PENGGARAMAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(173, '10212', 'PENGOLAHAN DAN PENGAWETAN IKAN DENGAN PENGASAPAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(174, '10213', 'PENGOLAHAN DAN PENGAWETAN IKAN DENGAN PEMBEKUAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(175, '10214', 'PENGOLAHAN DAN PENGAWETAN IKAN DENGAN PEMINDANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(176, '10215', 'PENGOLAHAN DAN PENGAWETAN IKAN DENGAN FERMENTASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(177, '10216', 'PENGOLAHAN DAN PENGAWETAN IKAN DENGAN PELUMATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(178, '10217', 'PENGOLAHAN DAN PENGAWETAN IKAN DENGAN PENGALENGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(179, '10218', 'PENGOLAHAN DAN PENGAWETAN IKAN MENJADI PRODUK OLAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(180, '10219', 'PENGOLAHAN DAN PENGAWETAN IKAN DENGAN METODE LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(181, '10291', 'PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(182, '10292', 'PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(183, '10293', 'PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(184, '10294', 'PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(185, '10295', 'PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(186, '10296', 'PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(187, '10297', 'PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(188, '10298', 'PENGOLAHAN DAN PENGAWETAN RUMPUT LAUT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(189, '10299', 'PENGOLAHAN DAN PENGAWETAN BIOTA AIR LAINNYA DENGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(190, '10301', 'PENGASINAN BUAH - BUAHAN DAN SAYURAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(191, '10302', 'PELUMATAN BUAH - BUAHAN DAN SAYURAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(192, '10303', 'PENGERINGAN BUAH - BUAHAN DAN SAYURAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(193, '10304', 'PEMBEKUAN BUAH - BUAHAN DAN SAYURAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(194, '10305', 'PENGALENGAN BUAH - BUAHAN DAN SAYURAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(195, '10306', 'PENGOLAHAN SARI BUAH - BUAHAN DAN SAYURAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(196, '10307', 'PEMBUATAN TEMPE KEDELAI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(197, '10308', 'PEMBUATAN TAHU KEDELAI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(198, '10309', 'PENGOLAHAN DAN PENGAWETAN LAINNYA UNTUK BUAH - BUAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(199, '10411', 'INDUSTRI MINYAK MENTAH DAN LEMAK NABATI BUKAN KELAPA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(200, '10412', 'INDUSTRI MARGARIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(201, '10413', 'INDUSTRI MINYAK MENTAH DAN LEMAK DARI HEWAN SELAIN IKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(202, '10414', 'INDUSTRI MINYAK IKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(203, '10415', 'INDUSTRI MINYAK GORENG DAN MINYAK MAKAN BUKAN MINYAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(204, '10419', 'INDUSTRI MINYAK MENTAH DAN LEMAK NABATI DAN HEWANI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(205, '10421', 'INDUSTRI KOPRA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(206, '10422', 'INDUSTRI MINYAK MENTAH KELAPA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(207, '10423', 'INDUSTRI MINYAK GORENG KELAPA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(208, '10431', 'INDUSTRI MINYAK MENTAH KELAPA SAWIT (CRUDE PALM OIL)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(209, '10432', 'INDUSTRI MINYAK MENTAH INTI KELAPA SAWIT (CRUDE PALM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(210, '10433', 'INDUSTRI PEMISAHAN/FRAKSINASI MINYAK MENTAH KELAPA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(211, '10434', 'INDUSTRI PEMURNIAN MINYAK MENTAH KELAPA SAWIT DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(212, '10435', 'INDUSTRI PEMISAHAN/FRAKSINASI MINYAK MURNI KELAPA SAWIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(213, '10436', 'INDUSTRI PEMISAHAN/FRAKSINASI MINYAK MURNI INTI KELAPA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(214, '10437', 'INDUSTRI MINYAK GORENG KELAPA SAWIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(215, '10501', 'INDUSTRI SUSU SEGAR DAN KRIM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(216, '10502', 'INDUSTRI SUSU BUBUK DAN SUSU KENTAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(217, '10503', 'INDUSTRI ES KRIM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(218, '10504', 'INDUSTRI ES YANG DAPAT DIMAKAN DAN ES PENCUCI MULUT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(219, '10509', 'INDUSTRI PRODUK SUSU LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(220, '10611', 'INDUSTRI PRODUK GILINGAN GANDUM (SELAIN TEPUNG TERIGU)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(221, '10612', 'INDUSTRI PRODUK GILINGAN ANEKA KACANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(222, '10613', 'INDUSTRI PRODUK GILINGAN ANEKA UMBI, TANAMAN RIMPANG,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(223, '10614', 'INDUSTRI TEPUNG CAMPURAN DAN ADONAN TEPUNG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(224, '10615', 'INDUSTRI MAKANAN SEREAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(225, '10616', 'INDUSTRI TEPUNG TERIGU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(226, '10621', 's.d. 10623, seperti pati kentang, pati bengkuang, pati', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(227, '10622', 'INDUSTRI BERBAGAI MACAM PATI PALEM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(228, '10623', 'INDUSTRI GLUKOSA DAN SEJENISNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(229, '10629', 'INDUSTRI PATI DAN PRODUK PATI LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(230, '10631', 'INDUSTRI PENGGILINGAN PADI DAN PENYOSOHAN BERAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(231, '10632', 'INDUSTRI PEMIPILAN JAGUNG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(232, '10633', 'INDUSTRI TEPUNG BERAS DAN TEPUNG JAGUNG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(233, '10634', 'INDUSTRI PATI BERAS DAN JAGUNG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(234, '10635', 'INDUSTRI PEMANIS DARI BERAS DAN JAGUNG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(235, '10636', 'INDUSTRI MINYAK DARI BERAS DAN JAGUNG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(236, '10710', 'INDUSTRI PRODUK BAKERI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(237, '10721', 'INDUSTRI GULA PASIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(238, '10722', 'INDUSTRI GULA MERAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(239, '10723', 'INDUSTRI SIROP', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(240, '10729', 'INDUSTRI GULA LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(241, '10731', 'INDUSTRI PENGOLAHAN KAKAO', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(242, '10732', 'INDUSTRI COKELAT DAN KEMBANG GULA DARI COKELAT Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(243, '10733', 'INDUSTRI MANISAN BUAH - BUAHAN DAN SAYURAN KERING', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(244, '10739', 'INDUSTRI KEMBANG GULA LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(245, '10740', 'INDUSTRI MAKARONI, MI, COUSCOUS, DAN PRODUK SEJENISNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(246, '10750', 'INDUSTRI MAKANAN DAN MASAKAN OLAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(247, '10761', 'PENGOLAHAN KOPI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(248, '10762', 'PENGOLAHAN TEH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(249, '10771', 'INDUSTRI KECAP', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(250, '10772', 'INDUSTRI GARAM KONSUMSI BERYODIUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(251, '10773', 'INDUSTRI GARAM INDUSTRI ANEKA PANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(252, '10779', 'INDUSTRI BUMBU MASAKAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(253, '10791', 'INDUSTRI MAKANAN BAYI DAN MAKANAN KHUSUS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(254, '10792', 'INDUSTRI KUE BASAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(255, '10793', 'INDUSTRI PRODUK MAKANAN DARI KELAPA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(256, '10794', 'INDUSTRI KERUPUK, KERIPIK, PEYEK, DAN SEJENISNYA Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(257, '10795', 'INDUSTRI SARI NABATI DAN KRIMER NABATI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(258, '10796', 'INDUSTRI DODOL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(259, '10797', 'INDUSTRI INFUSI HERBAL/HERB INFUSION', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(260, '10798', 'INDUSTRI BAHAN MAKANAN DARI RUMPUT LAUT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(261, '10799', 'INDUSTRI PRODUK MAKANAN LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(262, '10801', 'INDUSTRI RANSUM PAKAN HEWAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(263, '10802', 'INDUSTRI KONSENTRAT PAKAN HEWAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(264, '11010', 'INDUSTRI PENYULINGAN, PEMURNIAN, DAN PENCAMPURAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(265, '11020', 'INDUSTRI MINUMAN BERALKOHOL HASIL FERMENTASI ANGGUR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(266, '11030', 'INDUSTRI MINUMAN BERALKOHOL HASIL FERMENTASI MALT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(267, '11040', 'INDUSTRI MALT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(268, '11051', 'INDUSTRI AIR KEMASAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(269, '11052', 'INDUSTRI AIR MINUM ISI ULANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(270, '11053', 'INDUSTRI MINUMAN RINGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(271, '11059', 'INDUSTRI MINUMAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(272, '12001', 'INDUSTRI SIGARET KRETEK TANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(273, '12002', 'INDUSTRI SIGARET KRETEK MESIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(274, '12003', 'INDUSTRI ROKOK PUTIH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(275, '12004', 'INDUSTRI PENGERINGAN DAN PENGOLAHAN TEMBAKAU Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(276, '12005', 'INDUSTRI BUMBU ROKOK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(277, '12009', 'INDUSTRI PRODUK TEMBAKAU LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(278, '13111', 'PERSIAPAN SERAT TEKSTIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(279, '13112', 'PEMINTALAN BENANG SELAIN BENANG JAHIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(280, '13113', 'PEMINTALAN BENANG JAHIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(281, '13121', 'PERTENUNAN TEKSTIL DENGAN MESIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(282, '13122', 'PERTENUNAN TEKSTIL BUKAN DENGAN MESIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(283, '13131', 'PENYEMPURNAAN BENANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(284, '13132', 'PENYEMPURNAAN BASAH KAIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(285, '13133', 'INDUSTRI KAIN BATIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(286, '13139', 'PENYEMPURNAAN TEKSTIL LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(287, '13911', 'INDUSTRI KAIN RAJUTAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(288, '13912', 'INDUSTRI KAIN CROCHETED', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(289, '13913', 'INDUSTRI BULU TIRUAN RAJUTAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(290, '13921', 'INDUSTRI BARANG TEKSTIL UNTUK KEPERLUAN RUMAH TANGGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(291, '13922', 'INDUSTRI BARANG TEKSTIL DENGAN BAHAN PENGISI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(292, '13923', 'INDUSTRI KARUNG GONI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(293, '13924', 'INDUSTRI KARUNG SELAIN KARUNG GONI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(294, '13929', 'INDUSTRI BARANG TEKSTIL BUKAN PAKAIAN JADI LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(295, '13930', 'INDUSTRI KARPET DAN PERMADANI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(296, '13941', 'INDUSTRI TALI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(297, '13942', 'INDUSTRI BARANG DARI TALI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(298, '13991', 'INDUSTRI KAIN NARROW', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(299, '13992', 'INDUSTRI KAIN YANG DILAPISI DAN SEJENISNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(300, '13993', 'INDUSTRI KAIN NIRTENUN/NONWOVEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(301, '13994', 'INDUSTRI KAIN BAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(302, '13995', 'INDUSTRI KAPUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(303, '13996', 'INDUSTRI KAIN TULE, KAIN JARING, DAN KAIN BORDIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(304, '13999', 'INDUSTRI TEKSTIL LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(305, '14111', 'INDUSTRI PAKAIAN JADI (KONFEKSI) DARI TEKSTIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(306, '14112', 'INDUSTRI PAKAIAN JADI (KONFEKSI) DARI KULIT DAN TIRUAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(307, '14120', 'INDUSTRI PENJAHITAN DAN PEMBUATAN (BUKAN KONFEKSI)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(308, '14131', 'INDUSTRI PERLENGKAPAN PAKAIAN DARI TEKSTIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(309, '14132', 'INDUSTRI PERLENGKAPAN PAKAIAN DARI KULIT DAN TIRUAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(310, '14200', 'INDUSTRI BARANG DARI KULIT BERBULU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(311, '14301', 'INDUSTRI PAKAIAN JADI DAN PERLENGKAPANNYA DARI RAJUTAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(312, '14302', 'INDUSTRI HOSIERY RAJUTAN DAN CROCHETED', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(313, '15111', 'PENGAWETAN KULIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(314, '15112', 'PENYAMAKAN KULIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(315, '15113', 'PEWARNAAN KULIT BERBULU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(316, '15114', 'INDUSTRI KULIT KOMPOSISI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(317, '15121', 'INDUSTRI KOPER, TAS TANGAN, DAN SEJENISNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(318, '15122', 'INDUSTRI PELANA, ALAT PENGEKANG/HARNESS, DAN BARANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(319, '15129', 'INDUSTRI BARANG LAINNYA DARI KULIT DAN KULIT KOMPOSISI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(320, '15201', 'INDUSTRI ALAS KAKI UNTUK KEPERLUAN SEHARI - HARI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(321, '15202', 'INDUSTRI SEPATU OLAHRAGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(322, '15203', 'INDUSTRI SEPATU TEKNIK LAPANGAN/KEPERLUAN INDUSTRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(323, '15209', 'INDUSTRI ALAS KAKI LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(324, '16101', 'PENGGERGAJIAN DAN PENGHALUSAN KAYU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(325, '16102', 'PENGAWETAN KAYU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(326, '16103', 'PENGAWETAN ROTAN, BAMBU, DAN SEJENISNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(327, '16104', 'PENGOLAHAN ROTAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(328, '16105', 'INDUSTRI PARTIKEL KAYU DAN SEJENISNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(329, '16211', 'INDUSTRI KAYU LAPIS Kelompok ini mencakup:', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(330, '16212', 'INDUSTRI VENIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(331, '16213', 'INDUSTRI KAYU LAMINASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(332, '16219', 'INDUSTRI PANEL KAYU LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(333, '16221', 'INDUSTRI BARANG BANGUNAN DARI KAYU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(334, '16222', 'INDUSTRI BANGUNAN PRAFABRIKASI DARI KAYU DAN SEJENISNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(335, '16230', 'INDUSTRI WADAH DARI KAYU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(336, '16291', 'INDUSTRI BARANG ANYAMAN DARI ROTAN DAN BAMBU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(337, '16292', 'INDUSTRI BARANG ANYAMAN DARI TANAMAN SELAIN ROTAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(338, '16293', 'INDUSTRI KERAJINAN UKIRAN DARI KAYU BUKAN FURNITUR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(339, '16294', 'INDUSTRI ALAT DAPUR DAN ALAT MAKAN DARI KAYU, ROTAN, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(340, '16295', 'INDUSTRI KAYU BAKAR DAN PELET DARI KAYU DAN BIOMASSA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(341, '16299', 'INDUSTRI BARANG LAINNYA DARI KAYU; INDUSTRI BARANG DARI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(342, '17011', 'INDUSTRI BUBUR KERTAS (PULP)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(343, '17012', 'INDUSTRI KERTAS BUDAYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(344, '17013', 'INDUSTRI KERTAS BERHARGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(345, '17014', 'INDUSTRI KERTAS KHUSUS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(346, '17019', 'INDUSTRI KERTAS LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(347, '17021', 'INDUSTRI KERTAS DAN PAPAN KERTAS BERGELOMBANG Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(348, '17022', 'INDUSTRI KEMASAN DAN KOTAK DARI KERTAS DAN KARTON', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(349, '17091', 'INDUSTRI KERTAS TISU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(350, '17099', 'INDUSTRI BARANG DARI KERTAS DAN PAPAN KERTAS LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(351, '18111', 'PENCETAKAN UMUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(352, '18112', 'PENCETAKAN KHUSUS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(353, '18113', 'PENCETAKAN TIGA DIMENSI (3D)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(354, '18120', 'KEGIATAN JASA PENUNJANG PENCETAKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(355, '18201', 'REPRODUKSI MEDIA REKAMAN SUARA DAN PERANGKAT LUNAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(356, '18202', 'REPRODUKSI MEDIA REKAMAN FILM DAN VIDEO', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(357, '19100', 'INDUSTRI PRODUK TANUR KOKAS Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(358, '19201', 'INDUSTRI BAHAN BAKAR DARI PEMURNIAN DAN PENGILANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(359, '19202', 'INDUSTRI MINYAK PELUMAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(360, '19203', 'INDUSTRI PRODUK DARI BAHAN LIMBAH MINYAK PELUMAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(361, '19204', 'INDUSTRI MINYAK PELUMAS DASAR (BAHAN BAKU PELUMAS)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(362, '19205', 'INDUSTRI BRIKET', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(363, '19206', 'INDUSTRI PRODUK DARI PENCAMPURAN HASIL KILANG MINYAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(364, '19209', 'INDUSTRI PRODUK LAINNYA DARI HASIL KILANG MINYAK BUMI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(365, '20111', 'INDUSTRI ASAM, BASA, DAN GARAM ANORGANIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(366, '20112', 'INDUSTRI GAS INDUSTRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(367, '20113', 'INDUSTRI KIMIA DASAR ZAT WARNA DAN PIGMEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(368, '20114', 'INDUSTRI KIMIA DASAR RADIOAKTIF', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(369, '20115', 'INDUSTRI KIMIA DASAR ORGANIK DARI SUMBER DAYA ALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(370, '20116', 'INDUSTRI KIMIA DASAR DARI MINYAK BUMI, GAS ALAM, DAN BATU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(371, '20119', 'INDUSTRI KIMIA DASAR ANORGANIK LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(372, '20121', 'INDUSTRI SENYAWA NITROGEN; PUPUK NITROGEN, FOSFAT, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(373, '20122', 'INDUSTRI PUPUK HARA MAKRO PRIMER LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(374, '20123', 'INDUSTRI PUPUK HARA MIKRO', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(375, '20124', 'INDUSTRI PUPUK ORGANIK, PUPUK HAYATI, DAN MEDIA TANAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(376, '20125', 'INDUSTRI BIOSTIMULAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(377, '20131', 'INDUSTRI DAMAR BUATAN (RESIN SINTETIS) DAN BAHAN BAKU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(378, '20132', 'INDUSTRI KARET BUATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(379, '20211', 'INDUSTRI BAHAN BAKU PEMBERANTAS HAMA (BAHAN AKTIF)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(380, '20212', 'INDUSTRI PEMBERANTAS HAMA (FORMULASI)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(381, '20213', 'INDUSTRI ZAT PENGATUR TUMBUH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(382, '20221', 'INDUSTRI CAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(383, '20222', 'INDUSTRI PERNIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(384, '20223', 'INDUSTRI DEMPUL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(385, '20229', 'INDUSTRI SEDIAAN PEWARNA DAN PELAPIS LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(386, '20231', 'INDUSTRI BAHAN DAN PRODUK PEMBERSIH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(387, '20232', 'INDUSTRI KOSMETIK UNTUK MANUSIA, CAIRAN LENSA KONTAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(388, '20233', 'INDUSTRI KOSMETIK UNTUK HEWAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(389, '20234', 'INDUSTRI PEREKAT GIGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(390, '20235', 'INDUSTRI PARFUM SESUAI PESANAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(391, '20291', 'INDUSTRI PEREKAT/LEM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(392, '20292', 'INDUSTRI BAHAN PELEDAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(393, '20293', 'INDUSTRI TINTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(394, '20294', 'INDUSTRI MINYAK ASIRI HULU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(395, '20295', 'INDUSTRI KOREK API', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(396, '20296', 'INDUSTRI MINYAK ASIRI RANTAI TENGAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(397, '20297', 'INDUSTRI BIOFUEL CAIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(398, '20298', 'INDUSTRI CAIRAN ROKOK ELEKTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(399, '20299', 'INDUSTRI BARANG KIMIA LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(400, '20301', 'INDUSTRI SERAT FILAMEN DAN STRIP BUATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(401, '20302', 'INDUSTRI SERAT STAPEL BUATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(402, '21011', 'INDUSTRI BAHAN BAKU FARMASI UNTUK MANUSIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(403, '21012', 'INDUSTRI PRODUK FARMASI UNTUK MANUSIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(404, '21013', 'INDUSTRI PRODUK FARMASI UNTUK HEWAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(405, '21014', 'INDUSTRI BAHAN BAKU FARMASI UNTUK HEWAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(406, '21015', 'INDUSTRI ALAT DIAGNOSIS MEDIS, PERBAN, KASA, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(407, '21021', 'INDUSTRI BAHAN BAKU OBAT BAHAN ALAM UNTUK MANUSIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(408, '21022', 'INDUSTRI PRODUK OBAT BAHAN ALAM UNTUK MANUSIA Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(409, '21023', 'INDUSTRI PRODUK OBAT BAHAN ALAM UNTUK HEWAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(410, '21024', 'INDUSTRI BAHAN BAKU OBAT BAHAN ALAM UNTUK HEWAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(411, '22111', 'INDUSTRI BAN LUAR DAN BAN DALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(412, '22112', 'INDUSTRI PEMBENTUKAN KEMBALI BAN DAN VULKANISASI BAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(413, '22121', 'INDUSTRI KARET ASAP', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(414, '22122', 'INDUSTRI KARET LEMBARAN DAN CREPE RUBBER', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(415, '22123', 'INDUSTRI KARET REMAH (CRUMB RUBBER)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(416, '22129', 'INDUSTRI KARET SETENGAH JADI LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(417, '22191', 'INDUSTRI BARANG DARI KARET UNTUK KEPERLUAN RUMAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(418, '22192', 'INDUSTRI BARANG DARI KARET UNTUK KEPERLUAN INDUSTRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(419, '22193', 'INDUSTRI BARANG DARI KARET UNTUK KEPERLUAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(420, '22194', 'INDUSTRI BARANG DARI KARET UNTUK KESEHATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(421, '22199', 'INDUSTRI BARANG LAINNYA DARI KARET YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(422, '22201', 'INDUSTRI BARANG DARI PLASTIK UNTUK BANGUNAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(423, '22202', 'INDUSTRI BARANG DARI PLASTIK DAN BIOPLASTIK UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(424, '22203', 'INDUSTRI PIPA PLASTIK DAN PERLENGKAPANNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(425, '22204', 'INDUSTRI PLASTIK LEMBARAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(426, '22205', 'INDUSTRI PERLENGKAPAN DAN PERALATAN RUMAH TANGGA DARI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(427, '22206', 'INDUSTRI BARANG DAN PERALATAN TEKNIK/INDUSTRI DARI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(428, '22209', 'INDUSTRI BARANG LAINNYA DARI PLASTIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(429, '23111', 'INDUSTRI KACA LEMBARAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(430, '23112', 'INDUSTRI KACA PENGAMAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(431, '23119', 'INDUSTRI KACA LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(432, '23121', 'INDUSTRI PERLENGKAPAN DAN PERALATAN RUMAH TANGGA DARI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(433, '23122', 'INDUSTRI PERALATAN LABORATORIUM DAN KESEHATAN DARI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(434, '23129', 'INDUSTRI PRODUK LAINNYA DARI KACA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(435, '23911', 'INDUSTRI BATA, MORTAR, SEMEN, DAN SEJENISNYA YANG TAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(436, '23919', 'INDUSTRI PRODUK REFRAKTORI (TAHAN API) LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(437, '23921', 'INDUSTRI BATU BATA DARI TANAH LIAT ATAU KERAMIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(438, '23922', 'INDUSTRI GENTENG DARI TANAH LIAT ATAU KERAMIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(439, '23929', 'INDUSTRI BAHAN BANGUNAN LAINNYA DARI TANAH LIAT ATAU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(440, '23931', 'INDUSTRI PERLENGKAPAN RUMAH TANGGA DARI PORSELEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(441, '23932', 'INDUSTRI PERLENGKAPAN RUMAH TANGGA DARI TANAH LIAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(442, '23933', 'INDUSTRI ALAT LABORATORIUM DAN ALAT LISTRIK ATAU TEKNIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(443, '23934', 'INDUSTRI PERALATAN SANITASI DARI PORSELEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(444, '23935', 'INDUSTRI PERALATAN SANITASI DARI TANAH LIAT ATAU KERAMIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(445, '23939', 'INDUSTRI PRODUK BUKAN BAHAN BANGUNAN LAINNYA DARI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(446, '23941', 'INDUSTRI SEMEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(447, '23942', 'INDUSTRI KAPUR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(448, '23943', 'INDUSTRI GIPS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(449, '23951', 'INDUSTRI BARANG DARI SEMEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25');
INSERT INTO `kbli` (`id`, `kode`, `judul`, `versi`, `created_at`, `updated_at`) VALUES
(450, '23952', 'INDUSTRI BARANG DARI KAPUR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(451, '23953', 'INDUSTRI BARANG DARI GIPS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(452, '23954', 'INDUSTRI BARANG DARI ASBES', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(453, '23955', 'INDUSTRI MORTAR, ACIAN, DAN BETON SIAP PAKAI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(454, '23961', 'INDUSTRI BARANG DARI BATU MARMER', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(455, '23962', 'INDUSTRI BARANG DARI BATU GRANIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(456, '23969', 'INDUSTRI BARANG DARI BATU LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(457, '23991', 'INDUSTRI PRODUK ABRASIF', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(458, '23992', 'INDUSTRI BATUAN ASPAL DAN BARANG DARI ASPAL ATAU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(459, '23993', 'INDUSTRI PRODUK HASIL PEMURNIAN MINERAL NONLOGAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(460, '23999', 'INDUSTRI PRODUK MINERAL NONLOGAM LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(461, '24101', 'INDUSTRI BESI DAN BAJA DASAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(462, '24102', 'PENGGILINGAN BAJA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(463, '24103', 'INDUSTRI PIPA DAN SAMBUNGAN PIPA DARI BESI DAN BAJA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(464, '24201', 'INDUSTRI LOGAM DASAR MULIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(465, '24202', 'INDUSTRI LOGAM DASAR BUKAN BESI LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(466, '24203', 'PENGGILINGAN LOGAM BUKAN BESI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(467, '24204', 'EKSTRUSI LOGAM BUKAN BESI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(468, '24205', 'INDUSTRI PIPA DAN SAMBUNGAN PIPA DARI LOGAM BUKAN BESI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(469, '24206', 'INDUSTRI BAHAN BAKAR NUKLIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(470, '24310', 'PENGECORAN BESI DAN BAJA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(471, '24320', 'PENGECORAN LOGAM BUKAN BESI DAN BAJA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(472, '25111', 'INDUSTRI PRODUK LOGAM STRUKTURAL BUKAN ALUMINIUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(473, '25112', 'INDUSTRI PRODUK LOGAM STRUKTURAL ALUMINIUM UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(474, '25113', 'INDUSTRI PRODUK LOGAM STRUKTURAL BAJA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(475, '25119', 'INDUSTRI PRODUK LOGAM STRUKTURAL LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(476, '25120', 'INDUSTRI TANGKI, TANDON AIR, DAN WADAH SEJENISNYA DARI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(477, '25130', 'INDUSTRI GENERATOR UAP BUKAN KETEL PEMANAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(478, '25200', 'INDUSTRI SENJATA DAN AMUNISI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(479, '25910', 'PENEMPAAN, PENGEPRESAN, PENCETAKAN, DAN PEMBENTUKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(480, '25920', 'PENGERJAAN DAN PELAPISAN LOGAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(481, '25931', 'INDUSTRI PERKAKAS TANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(482, '25932', 'INDUSTRI ALAT POTONG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(483, '25933', 'INDUSTRI ALAT MAKAN DARI LOGAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(484, '25934', 'INDUSTRI PERALATAN UMUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(485, '25940', 'INDUSTRI EMBER, KALENG, DRUM DAN WADAH SEJENISNYA DARI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(486, '25951', 'INDUSTRI BARANG DARI KAWAT LOGAM BUKAN KABEL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(487, '25952', 'INDUSTRI PAKU, MUR, DAN BAUT LOGAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(488, '25991', 'INDUSTRI BRANKAS, FILLING KANTOR, DAN SEJENISNYA Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(489, '25992', 'INDUSTRI PERALATAN DAPUR DAN PERALATAN MEJA DARI LOGAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(490, '25993', 'INDUSTRI PRODUK RUMAH TANGGA DARI LOGAM BUKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(491, '25994', 'INDUSTRI PROFIL LOGAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(492, '25995', 'INDUSTRI LAMPU DARI LOGAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(493, '25999', 'INDUSTRI PRODUK LOGAM LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(494, '26110', 'INDUSTRI SEL SURYA, PANEL SURYA, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(495, '26191', 'INDUSTRI TABUNG ELEKTRON DAN KONEKTOR ELEKTRONIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(496, '26199', 'INDUSTRI KOMPONEN DAN PAPAN ELEKTRONIK LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(497, '26210', 'INDUSTRI KOMPUTER DAN PERAKITAN KOMPUTER', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(498, '26220', 'INDUSTRI PERLENGKAPAN KOMPUTER', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(499, '26310', 'INDUSTRI PERALATAN TELEPON DAN FAKSIMILI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(500, '26320', 'INDUSTRI PERALATAN KOMUNIKASI TANPA KABEL (WIRELESS)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(501, '26391', 'INDUSTRI KARTU CERDAS (SMART CARD)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(502, '26399', 'INDUSTRI PERALATAN KOMUNIKASI LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(503, '26410', 'INDUSTRI TELEVISI, MONITOR TELEVISI, DAN DISPLAI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(504, '26420', 'INDUSTRI PERALATAN PEREKAM, PENERIMA, DAN PENGGANDA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(505, '26490', 'INDUSTRI PERALATAN AUDIO DAN VIDEO ELEKTRONIK LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(506, '26511', 'INDUSTRI ALAT UKUR DAN ALAT UJI MANUAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(507, '26512', 'INDUSTRI ALAT UKUR DAN ALAT UJI ELEKTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(508, '26513', 'INDUSTRI ALAT UKUR DAN ALAT UJI ELEKTRONIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(509, '26519', 'INDUSTRI ALAT UKUR, ALAT UJI, DAN PERALATAN NAVIGASI DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(510, '26520', 'INDUSTRI ALAT UKUR WAKTU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(511, '26601', 'INDUSTRI PERALATAN IRADIASI, PERLENGKAPAN,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(512, '26602', 'INDUSTRI PERALATAN ELEKTROMEDIK DAN ELEKTROTERAPI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(513, '26701', 'INDUSTRI PERALATAN FOTOGRAFI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(514, '26702', 'INDUSTRI PERALATAN SINEMATOGRAFI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(515, '26703', 'INDUSTRI LENSA BUKAN KACAMATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(516, '26709', 'INDUSTRI PERALATAN FOTOGRAFI DAN INSTRUMEN OPTIK BUKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(517, '26800', 'INDUSTRI MEDIA MAGNETIK DAN MEDIA OPTIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(518, '27111', 'INDUSTRI MOTOR LISTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(519, '27112', 'INDUSTRI GENERATOR PEMBANGKIT LISTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(520, '27113', 'INDUSTRI PENGUBAH TEGANGAN/TRANSFORMATOR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(521, '27120', 'INDUSTRI PERALATAN PENGONTROL DAN PENDISTRIBUSIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(522, '27201', 'INDUSTRI BATU BATERAI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(523, '27202', 'INDUSTRI AKUMULATOR LISTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(524, '27203', 'INDUSTRI BATERAI KENDARAAN LISTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(525, '27310', 'INDUSTRI KABEL SERAT OPTIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(526, '27320', 'INDUSTRI KABEL DAN KAWAT LISTRIK DAN ELEKTRONIK LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(527, '27330', 'INDUSTRI PERLENGKAPAN KABEL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(528, '27401', 'INDUSTRI BOLA LAMPU PIJAR, LAMPU SOROT, DAN LAMPU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(529, '27402', 'INDUSTRI LAMPU GAS DAN DISCHARGE', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(530, '27403', 'INDUSTRI PERALATAN PENERANGAN UNTUK KENDARAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(531, '27404', 'INDUSTRI LAMPU LED', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(532, '27409', 'INDUSTRI PERALATAN PENERANGAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(533, '27510', 'INDUSTRI PERALATAN LISTRIK RUMAH TANGGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(534, '27520', 'INDUSTRI PERALATAN ELEKTROTERMAL RUMAH TANGGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(535, '27530', 'INDUSTRI PERALATAN RUMAH TANGGA BUKAN LISTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(536, '27900', 'INDUSTRI PERALATAN LISTRIK LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(537, '28111', 'INDUSTRI MESIN UAP, TURBIN, DAN KINCIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(538, '28112', 'INDUSTRI MOTOR PEMBAKARAN DALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(539, '28113', 'INDUSTRI KOMPONEN DAN SUKU CADANG MESIN DAN TURBIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(540, '28120', 'INDUSTRI PERALATAN TENAGA ZAT CAIR DAN GAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(541, '28130', 'INDUSTRI POMPA LAINNYA, KOMPRESOR, KERAN, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(542, '28140', 'INDUSTRI BEARING, RODA GIGI, DAN ELEMEN PENGGERAK MESIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(543, '28151', 'INDUSTRI OVEN, PERAPIAN DAN TUNGKU PEMBAKAR SEJENIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(544, '28152', 'INDUSTRI OVEN, PERAPIAN DAN TUNGKU PEMBAKAR SEJENIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(545, '28160', 'INDUSTRI ALAT PENGANGKAT DAN PEMINDAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(546, '28171', 'INDUSTRI MESIN KANTOR DAN AKUNTANSI MANUAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(547, '28172', 'INDUSTRI MESIN KANTOR DAN AKUNTANSI ELEKTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(548, '28173', 'INDUSTRI MESIN KANTOR DAN AKUNTANSI ELEKTRONIK Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(549, '28179', 'INDUSTRI PERALATAN KANTOR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(550, '28180', 'INDUSTRI PERKAKAS TANGAN YANG DIGERAKKAN TENAGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(551, '28191', 'INDUSTRI MESIN UNTUK PEMBUNGKUS, PEMBOTOLAN, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(552, '28192', 'INDUSTRI MESIN TIMBANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(553, '28193', 'INDUSTRI MESIN PENDINGIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(554, '28199', 'INDUSTRI MESIN UNTUK KEPERLUAN UMUM LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(555, '28210', 'INDUSTRI MESIN PERTANIAN DAN KEHUTANAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(556, '28220', 'INDUSTRI MESIN DAN PERKAKAS MESIN UNTUK PENGERJAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(557, '28230', 'INDUSTRI MESIN METALURGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(558, '28240', 'INDUSTRI MESIN PENAMBANGAN, PENGGALIAN DAN KONSTRUKSI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(559, '28250', 'INDUSTRI MESIN PENGOLAHAN MAKANAN, MINUMAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(560, '28261', 'INDUSTRI MESIN JAHIT, MESIN CUCI, DAN MESIN PENGERING', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(561, '28262', 'INDUSTRI MESIN TEKSTIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(562, '28263', 'INDUSTRI MESIN PENYIAPAN DAN PEMBUATAN PRODUK KULIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(563, '28291', 'INDUSTRI MESIN PERCETAKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(564, '28292', 'INDUSTRI MESIN PABRIK KERTAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(565, '28299', 'INDUSTRI MESIN KEPERLUAN KHUSUS LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(566, '29100', 'INDUSTRI KENDARAAN BERMOTOR RODA EMPAT ATAU LEBIH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(567, '29200', 'INDUSTRI KAROSERI KENDARAAN BERMOTOR RODA EMPAT ATAU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(568, '29300', 'INDUSTRI SUKU CADANG DAN AKSESORI KENDARAAN BERMOTOR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(569, '30111', 'INDUSTRI KENDARAAN AIR DAN BAWAH AIR BERAWAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(570, '30112', 'INDUSTRI BANGUNAN LEPAS PANTAI DAN BANGUNAN TERAPUNG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(571, '30113', 'INDUSTRI KENDARAAN AIR DAN BAWAH AIR TANPA AWAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(572, '30120', 'INDUSTRI KAPAL DAN PERAHU UNTUK TUJUAN WISATA ATAU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(573, '30200', 'INDUSTRI LOKOMOTIF DAN GERBONG KERETA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(574, '30301', 'INDUSTRI PESAWAT UDARA BERAWAK DAN MESIN TERKAIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(575, '30302', 'INDUSTRI PESAWAT UDARA TANPA AWAK DAN MESIN TERKAIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(576, '30303', 'INDUSTRI WAHANA ANTARIKSA DAN MESIN TERKAIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(577, '30400', 'INDUSTRI KENDARAAN TEMPUR MILITER', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(578, '30911', 'INDUSTRI SEPEDA MOTOR RODA DUA DAN TIGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(579, '30912', 'INDUSTRI KOMPONEN DAN PERLENGKAPAN SEPEDA MOTOR RODA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(580, '30921', 'INDUSTRI SEPEDA DAN KURSI RODA TERMASUK BECAK Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(581, '30922', 'INDUSTRI PERLENGKAPAN SEPEDA DAN KURSI RODA TERMASUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(582, '30990', 'INDUSTRI ALAT ANGKUTAN LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(583, '31011', 'INDUSTRI FURNITUR DARI KAYU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(584, '31012', 'INDUSTRI FURNITUR DARI ROTAN DAN BAMBU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(585, '31021', 'INDUSTRI FURNITUR DARI PLASTIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(586, '31022', 'INDUSTRI FURNITUR DARI LOGAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(587, '31029', 'INDUSTRI FURNITUR DARI BAHAN LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(588, '32111', 'INDUSTRI PERMATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(589, '32112', 'INDUSTRI PERHIASAN DARI LOGAM MULIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(590, '32113', 'INDUSTRI BARANG BERHARGA DARI LOGAM MULIA BUKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(591, '32114', 'INDUSTRI PERHIASAN DARI MUTIARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(592, '32119', 'INDUSTRI BARANG BERHARGA LAINNYA DARI LOGAM MULIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(593, '32120', 'INDUSTRI PERHIASAN IMITASI DAN BARANG SEJENIS Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(594, '32201', 'INDUSTRI ALAT MUSIK TRADISIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(595, '32202', 'INDUSTRI ALAT MUSIK NONTRADISIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(596, '32300', 'INDUSTRI PERALATAN DAN PERLENGKAPAN OLAHRAGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(597, '32401', 'INDUSTRI ALAT PERMAINAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(598, '32402', 'INDUSTRI MAINAN TERMASUK DRONE REKREASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(599, '32501', 'INDUSTRI FURNITUR UNTUK OPERASI, PERAWATAN KEDOKTERAN,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(600, '32502', 'INDUSTRI PERALATAN KEDOKTERAN DAN KEDOKTERAN GIGI,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(601, '32503', 'INDUSTRI KACAMATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(602, '32509', 'INDUSTRI PERALATAN KEDOKTERAN DAN KEDOKTERAN GIGI,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(603, '32901', 'INDUSTRI ALAT TULIS DAN GAMBAR TERMASUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(604, '32902', 'INDUSTRI PITA MESIN TULIS ATAU GAMBAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(605, '32903', 'INDUSTRI KERAJINAN YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(606, '32904', 'INDUSTRI PERALATAN UNTUK PELINDUNG KESELAMATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(607, '32905', 'INDUSTRI SERAT SABUT KELAPA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(608, '32906', 'INDUSTRI RAMBUT, JANGGUT, DAN BULU MATA PALSU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(609, '32907', 'INDUSTRI KANCING DAN RITSLETING', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(610, '32908', 'INDUSTRI PEMANTIK API/LIGHTER', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(611, '32909', 'INDUSTRI PRODUK LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(612, '33111', 'REPARASI DAN PEMELIHARAAN PRODUK LOGAM STRUKTURAL,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(613, '33112', 'REPARASI DAN PEMELIHARAAN PRODUK SENJATA DAN AMUNISI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(614, '33119', 'REPARASI DAN PEMELIHARAAN PRODUK LOGAM PABRIKASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(615, '33121', 'REPARASI DAN PEMELIHARAAN MESIN UNTUK KEPERLUAN UMUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(616, '33122', 'REPARASI DAN PEMELIHARAAN MESIN UNTUK KEPERLUAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(617, '33131', 'REPARASI DAN PEMELIHARAAN ALAT UKUR, ALAT UJI, SERTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(618, '33132', 'REPARASI DAN PEMELIHARAAN PERALATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(619, '33133', 'REPARASI DAN PEMELIHARAAN PERALATAN FOTOGRAFI DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(620, '33141', 'REPARASI DAN PEMELIHARAAN MOTOR LISTRIK, GENERATOR,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(621, '33142', 'REPARASI DAN PEMELIHARAAN BATERAI DAN AKUMULATOR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(622, '33149', 'REPARASI DAN PEMELIHARAAN PERALATAN LISTRIK LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(623, '33151', 'REPARASI DAN PEMELIHARAAN KAPAL, PERAHU, DAN BANGUNAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(624, '33152', 'REPARASI DAN PEMELIHARAAN LOKOMOTIF DAN GERBONG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(625, '33153', 'REPARASI DAN PEMELIHARAAN PESAWAT UDARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(626, '33159', 'REPARASI DAN PEMELIHARAAN ALAT ANGKUTAN LAINNYA, BUKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(627, '33190', 'REPARASI DAN PEMELIHARAAN PERALATAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(628, '33201', 'INSTALASI/PEMASANGAN DAN PERANGKAIAN/INTEGRASI MESIN,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(629, '33202', 'PEMBONGKARAN MESIN, PERALATAN, DAN SISTEM INDUSTRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(630, '33203', 'PEMASANGAN PERLENGKAPAN METEOROLOGI, KLIMATOLOGI,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(631, '35111', 'PEMBANGKITAN TENAGA LISTRIK DARI SUMBER ENERGI TIDAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(632, '35112', 'PEMBANGKITAN TENAGA LISTRIK DARI SUMBER ENERGI TIDAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(633, '35120', 'PEMBANGKITAN TENAGA LISTRIK DARI SUMBER ENERGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(634, '35131', 'AKTIVITAS PENYALURAN TENAGA LISTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(635, '35132', 'AKTIVITAS PENYIMPANAN TENAGA LISTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(636, '35133', 'PENGOPERASIAN FASILITAS ATAU STASIUN PENGISIAN DAYA (SPBKLU).', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(637, '35140', 'PENYEDIAAN TENAGA LISTRIK DALAM SATU KESATUAN USAHA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(638, '35151', 'PENGOPERASIAN INSTALASI PENYEDIAAN TENAGA LISTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(639, '35152', 'PENGOPERASIAN INSTALASI PEMANFAATAN TENAGA LISTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(640, '35159', 'AKTIVITAS PENUNJANG TENAGA LISTRIK LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(641, '35201', 'PRODUKSI GAS ALAM DAN BUATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(642, '35202', 'DISTRIBUSI GAS ALAM DAN BUATAN MELALUI JARINGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(643, '35301', 'PENGADAAN UAP/AIR PANAS DAN UDARA DINGIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(644, '35302', 'PRODUKSI ES', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(645, '35401', 'AKTIVITAS BROKER DAN AGEN PENJUALAN TENAGA LISTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(646, '35402', 'AKTIVITAS BROKER DAN AGEN PENJUALAN GAS ALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(647, '36001', 'PENGOLAHAN DAN PENYEDIAAN AIR MINUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(648, '36002', 'PENAMPUNGAN DAN PENYEDIAAN AIR BAKU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(649, '36003', 'AKTIVITAS PENUNJANG PENYEDIAAN AIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(650, '37001', 'PENGUMPULAN AIR LIMBAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(651, '37002', 'PENGOLAHAN DAN PEMBUANGAN AIR LIMBAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(652, '38110', 'PENGUMPULAN LIMBAH ATAU SAMPAH TIDAK BERBAHAYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(653, '38121', 'PENGUMPULAN LIMBAH BERBAHAYA SELAIN LIMBAH RADIOKATIF', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(654, '38122', 'PENGUMPULAN LIMBAH RADIOAKTIF', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(655, '38211', 'PENGOLAHAN SAMPAH TIDAK BERBAHAYA UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(656, '38212', 'PRODUKSI KOMPOS SAMPAH ORGANIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(657, '38219', 'PENGOLAHAN DAN PEMBUANGAN LIMBAH ATAU SAMPAH TIDAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(658, '38221', 'PENGOLAHAN DAN PEMBUANGAN LIMBAH ATAU SAMPAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(659, '38222', 'PENGOLAHAN DAN PEMBUANGAN LIMBAH RADIOAKTIF', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(660, '38301', 'PEMULIHAN MATERIAL BARANG LOGAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(661, '38302', 'PEMULIHAN MATERIAL BARANG PLASTIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(662, '38309', 'PEMULIHAN MATERIAL LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(663, '39001', 'AKTIVITAS PENANGKAPAN KARBON', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(664, '39002', 'AKTIVITAS PENYIMPANAN KARBON', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(665, '39009', 'AKTIVITAS REMEDIASI DAN PENGELOLAAN LIMBAH ATAU SAMPAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(666, '41011', 'KONSTRUKSI KONVENSIONAL GEDUNG HUNIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(667, '41012', 'KONSTRUKSI KONVENSIONAL GEDUNG PERKANTORAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(668, '41013', 'KONSTRUKSI KONVENSIONAL GEDUNG INDUSTRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(669, '41014', 'KONSTRUKSI KONVENSIONAL GEDUNG PERBELANJAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(670, '41015', 'KONSTRUKSI KONVENSIONAL GEDUNG KESEHATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(671, '41016', 'KONSTRUKSI KONVENSIONAL GEDUNG PENDIDIKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(672, '41017', 'KONSTRUKSI KONVENSIONAL GEDUNG PENGINAPAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(673, '41018', 'KONSTRUKSI KONVENSIONAL GEDUNG HIBURAN DAN OLAHRAGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(674, '41019', 'KONSTRUKSI KONVENSIONAL GEDUNG LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(675, '41020', 'KONSTRUKSI PRAPABRIKASI BANGUNAN GEDUNG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(676, '42101', 'KONSTRUKSI JALAN PADA PERMUKAAN TANAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(677, '42102', 'KONSTRUKSI BANGUNAN SIPIL JEMBATAN, JALAN LAYANG, FLY', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(678, '42103', 'KONSTRUKSI JALAN REL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(679, '42104', 'KONSTRUKSI TEROWONGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(680, '42201', 'KONSTRUKSI JARINGAN IRIGASI DAN DRAINASE', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(681, '42202', 'KONSTRUKSI BANGUNAN SIPIL PENGOLAHAN AIR BERSIH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(682, '42203', 'KONSTRUKSI BANGUNAN SIPIL SISTEM PENGOLAHAN LIMBAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(683, '42204', 'KONSTRUKSI BANGUNAN SIPIL ELEKTRIKAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(684, '42205', 'KONSTRUKSI BANGUNAN SIPIL TELEKOMUNIKASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(685, '42206', 'KONSTRUKSI SENTRAL TELEKOMUNIKASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(686, '42207', 'KONSTRUKSI PENGEBORAN/PENGGALIAN AIR TANAH Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(687, '42209', 'KONSTRUKSI PROYEK UTILITAS LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(688, '42911', 'KONSTRUKSI BANGUNAN PRASARANA SUMBER DAYA AIR Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(689, '42912', 'KONSTRUKSI BANGUNAN PELABUHAN BUKAN PERIKANAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(690, '42913', 'KONSTRUKSI BANGUNAN PELABUHAN PERIKANAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(691, '42914', 'KONSTRUKSI RESERVOIR PEMBANGKIT LISTRIK TENAGA AIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(692, '42915', 'KONSTRUKSI BANGUNAN SIPIL PELINDUNG PANTAI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(693, '42919', 'KONSTRUKSI BANGUNAN SIPIL PRASARANA PERAIRAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(694, '42991', 'KONSTRUKSI BANGUNAN SIPIL MINYAK DAN GAS BUMI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(695, '42992', 'KONSTRUKSI BANGUNAN SIPIL PERTAMBANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(696, '42993', 'KONSTRUKSI BANGUNAN SIPIL PANAS BUMI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(697, '42994', 'KONSTRUKSI BANGUNAN SIPIL FASILITAS OLAHRAGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(698, '42995', 'KONSTRUKSI BANGUNAN SIPIL FASILITAS PENGOLAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(699, '42996', 'KONSTRUKSI BANGUNAN SIPIL FASILITAS MILITER DAN BANDAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(700, '42997', 'KONSTRUKSI BANGUNAN SIPIL FASILITAS SUMBER RADIASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(701, '42998', 'KONSTRUKSI BANGUNAN SIPIL REAKTOR NUKLIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(702, '42999', 'KONSTRUKSI BANGUNAN SIPIL LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(703, '43110', 'PEMBONGKARAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(704, '43120', 'PENYIAPAN LAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(705, '43211', 'PEMASANGAN JARINGAN LISTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(706, '43212', 'PEMASANGAN JARINGAN TELEKOMUNIKASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(707, '43213', 'PEMASANGAN SISTEM ELEKTRONIKA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(708, '43214', 'PEMASANGAN SISTEM NAVIGASI LAUT, SUNGAI, DAN UDARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(709, '43215', 'PEMASANGAN SISTEM PERSINYALAN DAN TELEKOMUNIKASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(710, '43216', 'PEMASANGAN PERLENGKAPAN JALAN BERBASIS LISTRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(711, '43221', 'PEMASANGAN SALURAN AIR (PLUMBING)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(712, '43222', 'PEMASANGAN SISTEM PEMANAS DAN GEOTERMAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(713, '43223', 'PEMASANGAN JARINGAN PENYALURAN GAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(714, '43224', 'PEMASANGAN PENDINGIN DAN VENTILASI UDARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(715, '43291', 'PEMASANGAN PERLENGKAPAN MEKANIKAL BANGUNAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(716, '43299', 'PEMASANGAN KONSTRUKSI LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(717, '43301', 'PEMASANGAN KACA, PINTU, KUSEN, JENDELA, DAN SEJENISNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(718, '43302', 'PENGERJAAN LANTAI, DINDING, DAN PLAFON', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(719, '43303', 'PENGECATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(720, '43309', 'PENYELESAIAN KONSTRUKSI BANGUNAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(721, '43400', 'JASA INTERMEDIASI KONSTRUKSI KHUSUS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(722, '43901', 'PEMASANGAN DAN REKAYASA STRUKTUR BANGUNAN Kelompok ini', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(723, '43902', 'PEMASANGAN PERANCAH (STEGER)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(724, '43903', 'PEMASANGAN RANGKA DAN ATAP/ROOF COVERING', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(725, '43904', 'PEMASANGAN KERANGKA BAJA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(726, '43905', 'PENYEWAAN ALAT KONSTRUKSI DENGAN OPERATOR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(727, '43909', 'KONSTRUKSI KHUSUS LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(728, '46100', 'PERDAGANGAN BESAR ATAS DASAR BALAS JASA (FEE) ATAU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(729, '46201', 'PERDAGANGAN BESAR PADI DAN PALAWIJA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(730, '46202', 'PERDAGANGAN BESAR BUAH YANG MENGANDUNG MINYAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(731, '46203', 'PERDAGANGAN BESAR BUNGA DAN TANAMAN HIAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(732, '46204', 'PERDAGANGAN BESAR TEMBAKAU RAJANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(733, '46205', 'PERDAGANGAN BESAR BINATANG HIDUP', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(734, '46206', 'PERDAGANGAN BESAR IKAN DAN BIOTA AIR HIDUP LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(735, '46207', 'PERDAGANGAN BESAR HASIL KEHUTANAN DAN PERBURUAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(736, '46208', 'PERDAGANGAN BESAR KULIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(737, '46209', 'PERDAGANGAN BESAR HASIL PERTANIAN DAN HEWAN HIDUP', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(738, '46311', 'PERDAGANGAN BESAR BERAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(739, '46312', 'PERDAGANGAN BESAR BUAH - BUAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(740, '46313', 'PERDAGANGAN BESAR SAYURAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(741, '46314', 'PERDAGANGAN BESAR KOPI, TEH, DAN KAKAO', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(742, '46315', 'PERDAGANGAN BESAR MINYAK DAN LEMAK NABATI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(743, '46319', 'PERDAGANGAN BESAR BAHAN MAKANAN DAN MINUMAN HASIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(744, '46321', 'PERDAGANGAN BESAR DAGING SAPI DAN DAGING SAPI OLAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(745, '46322', 'PERDAGANGAN BESAR DAGING AYAM DAN DAGING AYAM OLAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(746, '46323', 'PERDAGANGAN BESAR DAGING DAN DAGING OLAHAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(747, '46324', 'PERDAGANGAN BESAR HASIL PERIKANAN DAN OLAHAN TERKAIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(748, '46325', 'PERDAGANGAN BESAR TELUR DAN HASIL OLAHAN TELUR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(749, '46326', 'PERDAGANGAN BESAR SUSU DAN PRODUK SUSU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(750, '46327', 'PERDAGANGAN BESAR MINYAK DAN LEMAK HEWANI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(751, '46329', 'PERDAGANGAN BESAR BAHAN MAKANAN DAN MINUMAN HASIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(752, '46331', 'PERDAGANGAN BESAR GULA, COKELAT, DAN KEMBANG GULA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(753, '46332', 'PERDAGANGAN BESAR PRODUK BAKERI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(754, '46333', 'PERDAGANGAN BESAR MINUMAN BERALKOHOL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(755, '46334', 'PERDAGANGAN BESAR MINUMAN NONALKOHOL BUKAN SUSU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(756, '46335', 'PERDAGANGAN BESAR ROKOK DAN TEMBAKAU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(757, '46339', 'PERDAGANGAN BESAR MAKANAN DAN MINUMAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(758, '46411', 'PERDAGANGAN BESAR TEKSTIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(759, '46412', 'PERDAGANGAN BESAR PAKAIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(760, '46413', 'PERDAGANGAN BESAR ALAS KAKI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(761, '46414', 'PERDAGANGAN BESAR BARANG JADI TEKSTIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(762, '46415', 'PERDAGANGAN BESAR PERLENGKAPAN JAHIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(763, '46420', 'PERDAGANGAN BESAR FURNITUR, KARPET, PERLENGKAPAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(764, '46430', 'PERDAGANGAN BESAR ALAT FOTOGRAFI DAN BARANG OPTIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(765, '46441', 'PERDAGANGAN BESAR SEDIAAN FARMASI UNTUK MANUSIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(766, '46442', 'PERDAGANGAN BESAR SEDIAAN FARMASI UNTUK HEWAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(767, '46451', 'PERDAGANGAN BESAR ALAT TULIS DAN GAMBAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(768, '46452', 'PERDAGANGAN BESAR BARANG PERCETAKAN DAN PENERBITAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(769, '46491', 'PERDAGANGAN BESAR PERALATAN MASAK, PERALATAN DAPUR,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(770, '46492', 'PERDAGANGAN BESAR PERALATAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(771, '46493', 'PERDAGANGAN BESAR ALAT MUSIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(772, '46494', 'PERDAGANGAN BESAR PERHIASAN DAN JAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(773, '46495', 'PERDAGANGAN BESAR ALAT PERMAINAN DAN MAINAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(774, '46496', 'PERDAGANGAN BESAR TAS, DOMPET, KOPER, RANSEL, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(775, '46499', 'PERDAGANGAN BESAR BERBAGAI BARANG DAN PERLENGKAPAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(776, '46511', 'PERDAGANGAN BESAR KOMPUTER DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(777, '46512', 'PERDAGANGAN BESAR PERANGKAT LUNAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(778, '46521', 'PERDAGANGAN BESAR SUKU CADANG ELEKTRONIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(779, '46522', 'PERDAGANGAN BESAR DISKET, FLASH DRIVE, PITA AUDIO DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(780, '46523', 'PERDAGANGAN BESAR PERALATAN TELEKOMUNIKASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(781, '46530', 'PERDAGANGAN BESAR MESIN, PERALATAN DAN PERLENGKAPAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(782, '46591', 'PERDAGANGAN BESAR MESIN KANTOR DAN INDUSTRI, SUKU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(783, '46592', 'PERDAGANGAN BESAR ALAT TRANSPORTASI LAUT, SUKU CADANG,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(784, '46593', 'PERDAGANGAN BESAR ALAT TRANSPORTASI DARAT (BUKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(785, '46594', 'PERDAGANGAN BESAR ALAT TRANSPORTASI UDARA, SUKU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(786, '46599', 'PERDAGANGAN BESAR MESIN, PERALATAN, DAN PERLENGKAPAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(787, '46611', 'PERDAGANGAN BESAR MOBIL BARU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(788, '46612', 'PERDAGANGAN BESAR MOBIL BEKAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(789, '46620', 'PERDAGANGAN BESAR SUKU CADANG DAN AKSESORI MOBIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(790, '46631', 'PERDAGANGAN BESAR SEPEDA MOTOR BARU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(791, '46632', 'PERDAGANGAN BESAR SEPEDA MOTOR BEKAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(792, '46633', 'PERDAGANGAN BESAR SUKU CADANG SEPEDA MOTOR DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(793, '46710', 'PERDAGANGAN BESAR BAHAN BAKAR PADAT, CAIR, DAN GAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(794, '46721', 'PERDAGANGAN BESAR BIJIH DAN KONSENTRAT LOGAM Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(795, '46722', 'PERDAGANGAN BESAR PRODUK LOGAM SETENGAH JADI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(796, '46731', 'PERDAGANGAN BESAR BAHAN KONSTRUKSI DARI LOGAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(797, '46732', 'PERDAGANGAN BESAR KACA LEMBARAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(798, '46733', 'PERDAGANGAN BESAR BAHAN KONSTRUKSI DARI TANAH LIAT,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(799, '46734', 'PERDAGANGAN BESAR SEMEN, KAPUR, PASIR, DAN BATU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(800, '46735', 'PERDAGANGAN BESAR BAHAN KONSTRUKSI DARI PORSELEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(801, '46736', 'PERDAGANGAN BESAR BAHAN KONSTRUKSI DARI KAYU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(802, '46737', 'PERDAGANGAN BESAR CAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(803, '46738', 'PERDAGANGAN BESAR BERBAGAI MACAM MATERIAL BANGUNAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(804, '46739', 'PERDAGANGAN BESAR BAHAN KONSTRUKSI, PERKAKAS,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(805, '46741', 'PERDAGANGAN BESAR MINERAL BUKAN LOGAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(806, '46742', 'PERDAGANGAN BESAR MINERAL RADIOAKTIF', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(807, '46743', 'PERDAGANGAN BESAR ZAT RADIOAKTIF DAN PEMBANGKIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(808, '46751', 'PERDAGANGAN BESAR BAHAN DAN BARANG KIMIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(809, '46752', 'PERDAGANGAN BESAR PUPUK DAN PRODUK AGROKIMIA Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(810, '46753', 'PERDAGANGAN BESAR BAHAN BERBAHAYA (B2)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(811, '46791', 'PERDAGANGAN BESAR ALAT KESEHATAN DAN LABORATORIUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(812, '46792', 'PERDAGANGAN BESAR ALAT KESEHATAN UNTUK HEWAN Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(813, '46793', 'PERDAGANGAN BESAR KARET DAN PLASTIK DALAM BENTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(814, '46794', 'PERDAGANGAN BESAR KERTAS DAN KARTON', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(815, '46795', 'PERDAGANGAN BESAR BARANG DARI KERTAS DAN KARTON', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(816, '46796', 'PERDAGANGAN BESAR BARANG BEKAS DAN SKRAP', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(817, '46799', 'PERDAGANGAN BESAR PRODUK LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(818, '46901', 'PERDAGANGAN BESAR BERBAGAI MACAM BARANG DI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(819, '46902', 'PERDAGANGAN BESAR BERBAGAI MACAM BARANG SELAIN DI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(820, '47111', 'PERDAGANGAN ECERAN BERBAGAI MACAM BARANG YANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(821, '47112', 'PERDAGANGAN ECERAN BERBAGAI MACAM BARANG YANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(822, '47191', 'PERDAGANGAN ECERAN BERBAGAI MACAM BARANG YANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(823, '47192', 'PERDAGANGAN ECERAN BERBAGAI MACAM BARANG YANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(824, '47211', 's.d. 47216, seperti lada, pala, kunyit, kencur, temulawak,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(825, '47212', 'PERDAGANGAN ECERAN BUAH - BUAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(826, '47213', 'PERDAGANGAN ECERAN SAYURAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(827, '47214', 'PERDAGANGAN ECERAN HASIL PETERNAKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(828, '47215', 'PERDAGANGAN ECERAN HASIL PERIKANAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(829, '47216', 'PERDAGANGAN ECERAN HASIL KEHUTANAN DAN PERBURUAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(830, '47219', 'PERDAGANGAN ECERAN HASIL PERTANIAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(831, '47221', 'PERDAGANGAN ECERAN MINUMAN BERALKOHOL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(832, '47222', 'PERDAGANGAN ECERAN MINUMAN TIDAK BERALKOHOL Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(833, '47230', 'PERDAGANGAN ECERAN ROKOK DAN TEMBAKAU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(834, '47241', 'PERDAGANGAN ECERAN BERAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(835, '47242', 'PERDAGANGAN ECERAN ROTI, KUE KERING, SERTA KUE BASAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(836, '47243', 'PERDAGANGAN ECERAN KOPI, GULA PASIR, GULA MERAH, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(837, '47244', 'PERDAGANGAN ECERAN TAHU, TEMPE, TAUCO, DAN ONCOM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(838, '47245', 'PERDAGANGAN ECERAN DAGING OLAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(839, '47246', 'PERDAGANGAN ECERAN IKAN OLAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(840, '47249', 'PERDAGANGAN ECERAN MAKANAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(841, '47301', 'PERDAGANGAN ECERAN BAHAN BAKAR DI SARANA PENGISIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(842, '47302', 'PERDAGANGAN ECERAN BAHAN BAKAR SELAIN DI SARANA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(843, '47303', 'PERDAGANGAN ECERAN MINYAK PELUMAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(844, '47401', 'PERDAGANGAN ECERAN KOMPUTER DAN PERLENGKAPANNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(845, '47402', 'PERDAGANGAN ECERAN PERALATAN DAN PRODUK GIM VIDEO', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(846, '47403', 'PERDAGANGAN ECERAN PERANGKAT LUNAK (SOFTWARE)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(847, '47404', 'PERDAGANGAN ECERAN TELEPON BESERTA AKSESORISNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(848, '47405', 'PERDAGANGAN ECERAN MESIN DAN PERALATAN KANTOR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(849, '47406', 'PERDAGANGAN ECERAN PERALATAN AUDIO DAN VIDEO', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(850, '47511', 'PERDAGANGAN ECERAN TEKSTIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(851, '47512', 'PERDAGANGAN ECERAN PERLENGKAPAN RUMAH TANGGA DARI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(852, '47513', 'PERDAGANGAN ECERAN PERLENGKAPAN JAHIT MENJAHIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(853, '47521', 'PERDAGANGAN ECERAN BAHAN DAN MATERIAL KONSTRUKSI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(854, '47522', 'PERDAGANGAN ECERAN KACA LEMBARAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(855, '47523', 'PERDAGANGAN ECERAN PERKAKAS DAN PERALATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(856, '47524', 'PERDAGANGAN ECERAN PERALATAN KESELAMATAN DAN GAWAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(857, '47525', 'PERDAGANGAN ECERAN CAT, PERNIS DAN LAKERI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(858, '47526', 'PERDAGANGAN ECERAN BAHAN - BAHAN ENERGI TERBARUKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(859, '47530', 'PERDAGANGAN ECERAN KARPET, PERMADANI, SERTA PENUTUP', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(860, '47591', 'PERDAGANGAN ECERAN FURNITUR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(861, '47592', 'PERDAGANGAN ECERAN PERALATAN LISTRIK RUMAH TANGGA,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(862, '47593', 'PERDAGANGAN ECERAN BARANG PECAH BELAH; PERLENGKAPAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(863, '47594', 'PERDAGANGAN ECERAN ALAT MUSIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(864, '47599', 'PERDAGANGAN ECERAN PERALATAN DAN PERLENGKAPAN RUMAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(865, '47611', 'PERDAGANGAN ECERAN ALAT TULIS MENULIS DAN GAMBAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(866, '47612', 'PERDAGANGAN ECERAN HASIL PENCETAKAN DAN PENERBITAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(867, '47613', 'PERDAGANGAN ECERAN KERTAS, KERTAS KARTON, DAN BARANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(868, '47620', 'PERDAGANGAN ECERAN PERALATAN DAN PERLENGKAPAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(869, '47630', 'PERDAGANGAN ECERAN ALAT PERMAINAN DAN MAINAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(870, '47690', 'PERDAGANGAN ECERAN KHUSUS BARANG KESENIAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(871, '47711', 'PERDAGANGAN ECERAN PAKAIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(872, '47712', 'PERDAGANGAN ECERAN SEPATU, SANDAL, DAN ALAS KAKI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(873, '47713', 'PERDAGANGAN ECERAN PERLENGKAPAN PAKAIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25');
INSERT INTO `kbli` (`id`, `kode`, `judul`, `versi`, `created_at`, `updated_at`) VALUES
(874, '47714', 'PERDAGANGAN ECERAN TAS, DOMPET, KOPER, RANSEL, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(875, '47721', 'PERDAGANGAN ECERAN SEDIAAN FARMASI UNTUK MANUSIA DI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(876, '47722', 'PERDAGANGAN ECERAN SEDIAAN FARMASI UNTUK MANUSIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(877, '47723', 'PERDAGANGAN ECERAN OBAT BAHAN ALAM UNTUK MANUSIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(878, '47724', 'PERDAGANGAN ECERAN KOSMETIK UNTUK MANUSIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(879, '47725', 'PERDAGANGAN ECERAN ALAT KESEHATAN UNTUK MANUSIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(880, '47726', 'PERDAGANGAN ECERAN OBAT FARMASI UNTUK HEWAN Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(881, '47727', 'PERDAGANGAN ECERAN OBAT TRADISIONAL UNTUK HEWAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(882, '47728', 'PERDAGANGAN ECERAN KOSMETIK UNTUK HEWAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(883, '47729', 'PERDAGANGAN ECERAN BAHAN BAKU FARMASI DAN ALAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(884, '47731', 'PERDAGANGAN ECERAN ALAT FOTOGRAFI DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(885, '47732', 'PERDAGANGAN ECERAN ALAT OPTIK DAN PERLENGKAPANNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(886, '47733', 'PERDAGANGAN ECERAN KACAMATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(887, '47734', 'PERDAGANGAN ECERAN JAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(888, '47735', 'PERDAGANGAN ECERAN BARANG PERHIASAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(889, '47741', 'PERDAGANGAN ECERAN PERLENGKAPAN RUMAH TANGGA BEKAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(890, '47742', 'PERDAGANGAN ECERAN PAKAIAN, ALAS KAKI, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(891, '47743', 'PERDAGANGAN ECERAN BARANG PERLENGKAPAN PRIBADI BEKAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(892, '47744', 'PERDAGANGAN ECERAN BARANG LISTRIK DAN ELEKTRONIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(893, '47745', 'PERDAGANGAN ECERAN BAHAN KONSTRUKSI DAN SANITER', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(894, '47746', 'PERDAGANGAN ECERAN BARANG ANTIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(895, '47749', 'PERDAGANGAN ECERAN BARANG BEKAS LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(896, '47751', 'PERDAGANGAN ECERAN HEWAN KESAYANGAN (PET ANIMALS)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(897, '47752', 'PERDAGANGAN ECERAN HEWAN TERNAK DAN BIBIT HEWAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(898, '47753', 'PERDAGANGAN ECERAN IKAN DAN BIOTA AIR HIDUP LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(899, '47754', 'PERDAGANGAN ECERAN PAKAN TERNAK/UNGGAS/IKAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(900, '47761', 'PERDAGANGAN ECERAN BUNGA POTONG/FLORIST', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(901, '47762', 'PERDAGANGAN ECERAN TANAMAN DAN BIBIT TANAMAN SELAIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(902, '47763', 'PERDAGANGAN ECERAN PUPUK DAN PEMBERANTAS HAMA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(903, '47764', 'PERDAGANGAN ECERAN PERLENGKAPAN DAN MEDIA TANAMAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(904, '47765', 'PERDAGANGAN ECERAN TANAMAN DAN BIBIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(905, '47771', 'PERDAGANGAN ECERAN MINYAK TANAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(906, '47772', 'PERDAGANGAN ECERAN GAS TABUNG LPG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(907, '47773', 'PERDAGANGAN ECERAN BAHAN KIMIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(908, '47774', 'PERDAGANGAN ECERAN AROMATIK/PENYEGAR (MINYAK ASIRI)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(909, '47779', 'PERDAGANGAN ECERAN BAHAN KIMIA, AROMATIK/PENYEGAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(910, '47781', 'PERDAGANGAN ECERAN CENDERA MATA, KERAJINAN, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(911, '47782', 'PERDAGANGAN ECERAN LUKISAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(912, '47791', 'PERDAGANGAN ECERAN BERBAGAI MACAM MESIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(913, '47792', 'PERDAGANGAN ECERAN ALAT TRANSPORTASI DARAT TIDAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(914, '47793', 'PERDAGANGAN ECERAN ALAT TRANSPORTASI AIR DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(915, '47794', 'PERDAGANGAN ECERAN ALAT - ALAT PERTANIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(916, '47795', 'PERDAGANGAN ECERAN PERLENGKAPAN PENGENDARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(917, '47796', 'PERDAGANGAN ECERAN PEMBUNGKUS DARI PLASTIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(918, '47799', 'PERDAGANGAN ECERAN BARANG BARU LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(919, '47811', 'PERDAGANGAN ECERAN MOBIL BARU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(920, '47812', 'PERDAGANGAN ECERAN MOBIL BEKAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(921, '47820', 'PERDAGANGAN ECERAN SUKU CADANG DAN AKSESORI MOBIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(922, '47831', 'PERDAGANGAN ECERAN SEPEDA MOTOR BARU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(923, '47832', 'PERDAGANGAN ECERAN SEPEDA MOTOR BEKAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(924, '47833', 'PERDAGANGAN ECERAN SUKU CADANG SEPEDA MOTOR DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(925, '47901', 'PLATFORM DIGITAL INTERMEDIASI PERDAGANGAN ECERAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(926, '47909', 'JASA INTERMEDIASI PERDAGANGAN ECERAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(927, '49111', 'ANGKUTAN KERETA WISATA ANTARKOTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(928, '49119', 'TRANSPORTASI KERETA API ANTARKOTA LAINNYA UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(929, '49120', 'TRANSPORTASI KERETA API UNTUK BARANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(930, '49211', 'ANGKUTAN KERETA WISATA DALAM KOTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(931, '49212', 'ANGKUTAN KERETA API PERKOTAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(932, '49213', 'ANGKUTAN PERKOTAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(933, '49214', 'ANGKUTAN PERDESAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(934, '49219', 'TRANSPORTASI DARAT DALAM KOTA LAINNYA UNTUK PENUMPANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(935, '49221', 'ANGKUTAN ANTARKOTA ANTARPROVINSI (AKAP)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(936, '49222', 'ANGKUTAN ANTARKOTA DALAM PROVINSI (AKDP)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(937, '49223', 'ANGKUTAN LINTAS BATAS NEGARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(938, '49229', 'TRANSPORTASI ANTARKOTA LAINNYA UNTUK PENUMPANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(939, '49231', 'ANGKUTAN BERMOTOR UNTUK BARANG UMUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(940, '49232', 'ANGKUTAN BERMOTOR UNTUK BARANG KHUSUS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(941, '49233', 'ANGKUTAN TIDAK BERMOTOR UNTUK BARANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(942, '49291', 'ANGKUTAN KERETA API LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(943, '49292', 'ANGKUTAN PARIWISATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(944, '49293', 'ANGKUTAN TAKSI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(945, '49294', 'ANGKUTAN KHUSUS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(946, '49295', 'ANGKUTAN SEWA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(947, '49296', 'ANGKUTAN OJEK MOTOR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(948, '49297', 'ANGKUTAN TIDAK BERMOTOR UNTUK PENUMPANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(949, '49299', 'TRANSPORTASI DARAT LAINNYA UNTUK PENUMPANG YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(950, '49300', 'TRANSPORTASI MELALUI SALURAN PIPA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(951, '50111', 'ANGKUTAN LAUT DALAM NEGERI LINER DAN TRAMPER UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(952, '50112', 'ANGKUTAN LAUT DALAM NEGERI PERINTIS UNTUK PENUMPANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(953, '50113', 'ANGKUTAN LAUT DALAM NEGERI UNTUK WISATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(954, '50114', 'ANGKUTAN LAUT LUAR NEGERI LINER DAN TRAMPER UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(955, '50115', 'ANGKUTAN LAUT LUAR NEGERI UNTUK WISATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(956, '50121', 'ANGKUTAN LAUT DALAM NEGERI UNTUK BARANG UMUM Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(957, '50122', 'ANGKUTAN LAUT DALAM NEGERI UNTUK BARANG KHUSUS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(958, '50123', 'ANGKUTAN LAUT DALAM NEGERI PERINTIS UNTUK BARANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(959, '50124', 'ANGKUTAN LAUT DALAM NEGERI PELAYARAN RAKYAT UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(960, '50125', 'ANGKUTAN LAUT LUAR NEGERI UNTUK BARANG UMUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(961, '50126', 'ANGKUTAN LAUT LUAR NEGERI UNTUK BARANG KHUSUS Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(962, '50127', 'ANGKUTAN LAUT LUAR NEGERI PELAYARAN RAKYAT UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(963, '50131', 'ANGKUTAN PENYEBERANGAN UMUM ANTARPROVINSI UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(964, '50132', 'ANGKUTAN PENYEBERANGAN UMUM ANTARKABUPATEN/KOTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(965, '50133', 'ANGKUTAN PENYEBERANGAN UMUM DALAM KABUPATEN/KOTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(966, '50134', 'ANGKUTAN PENYEBERANGAN PERINTIS ANTARPROVINSI UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(967, '50135', 'ANGKUTAN PENYEBERANGAN PERINTIS ANTARKABUPATEN/KOTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(968, '50139', 'TRANSPORTASI PESISIR LAINNYA UNTUK PENUMPANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(969, '50141', 'ANGKUTAN PENYEBERANGAN UMUM ANTARPROVINSI UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(970, '50142', 'ANGKUTAN PENYEBERANGAN UMUM ANTARKABUPATEN/KOTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(971, '50143', 'ANGKUTAN PENYEBERANGAN UMUM DALAM KABUPATEN/KOTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(972, '50144', 'ANGKUTAN PENYEBERANGAN PERINTIS ANTARPROVINSI UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(973, '50145', 'ANGKUTAN PENYEBERANGAN PERINTIS ANTARKABUPATEN/KOTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(974, '50149', 'TRANSPORTASI PESISIR LAINNYA UNTUK BARANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(975, '50211', 'ANGKUTAN SUNGAI DAN DANAU LINER (TRAYEK TETAP DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(976, '50212', 'ANGKUTAN SUNGAI DAN DANAU TRAMPER (TRAYEK TIDAK TETAP', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(977, '50213', 'ANGKUTAN SUNGAI DAN DANAU UNTUK WISATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(978, '50221', 'ANGKUTAN SUNGAI DAN DANAU UNTUK BARANG UMUM Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(979, '50222', 'ANGKUTAN SUNGAI DAN DANAU UNTUK BARANG KHUSUS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(980, '50223', 'ANGKUTAN SUNGAI DAN DANAU UNTUK BARANG BERBAHAYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(981, '51101', 'ANGKUTAN UDARA NIAGA BERJADWAL UNTUK PENUMPANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(982, '51102', 'ANGKUTAN UDARA NIAGA TIDAK BERJADWAL UNTUK PENUMPANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(983, '51103', 'TRANSPORTASI ANTARIKSA UNTUK PENUMPANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(984, '51201', 'ANGKUTAN UDARA NIAGA BERJADWAL KHUSUS KARGO', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(985, '51202', 'ANGKUTAN UDARA NIAGA TIDAK BERJADWAL KHUSUS KARGO', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(986, '51203', 'TRANSPORTASI ANTARIKSA UNTUK BARANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(987, '52101', 'PENGELOLA GUDANG SISTEM RESI GUDANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(988, '52102', 'AKTIVITAS GUDANG DINGIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(989, '52103', 'AKTIVITAS GUDANG BERIKAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(990, '52104', 'PENYIMPANAN MINYAK DAN GAS BUMI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(991, '52105', 'AKTIVITAS PENYIMPANAN BARANG BERBAHAYA DAN BERACUN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(992, '52106', 'FASILITAS PENYIMPANAN SUMBER RADIASI PENGION', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(993, '52107', 'PENYIMPANAN MINERAL IKUTAN RADIOAKTIF', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(994, '52109', 'PERGUDANGAN DAN PENYIMPANAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(995, '52211', 'AKTIVITAS TERMINAL DARAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(996, '52212', 'AKTIVITAS PENYELENGGARAAN PRASARANA PERKERETAAPIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(997, '52213', 'AKTIVITAS JALAN TOL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(998, '52214', 'AKTIVITAS PERPARKIRAN DI BADAN JALAN (ON STREET PARKING)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(999, '52215', 'AKTIVITAS PERPARKIRAN DI LUAR BADAN JALAN (OFF STREET', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1000, '52219', 'AKTIVITAS JASA TERKAIT TRANSPORTASI DARAT LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1001, '52221', 'AKTIVITAS PELAYANAN KEPELABUHANAN LAUT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1002, '52222', 'AKTIVITAS PELAYANAN KEPELABUHANAN SUNGAI DAN DANAU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1003, '52223', 'AKTIVITAS PELAYANAN KEPELABUHANAN PENYEBERANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1004, '52224', 'AKTIVITAS PELABUHAN PERIKANAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1005, '52225', 'AKTIVITAS PENGELOLAAN KAPAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1006, '52226', 'AKTIVITAS AKTIVITAS PENYELAMATAN KAPAL DAN MUATANNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1007, '52227', 'ANGKUTAN PERAIRAN PELABUHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1008, '52229', 'AKTIVITAS JASA TERKAIT TRANSPORTASI PERAIRAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1009, '52231', 'AKTIVITAS KEBANDARUDARAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1010, '52232', 'JASA PELAYANAN NAVIGASI PENERBANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1011, '52233', 'PELAYANAN PENUMPANG, BAGASI, KARGO, POS, DAN TEKNIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1012, '52234', 'AKTIVITAS PEMERIKSAAN DAN PENGENDALIAN KEAMANAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1013, '52239', 'AKTIVITAS JASA TERKAIT ANGKUTAN UDARA LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1014, '52240', 'PENANGANAN KARGO (BONGKAR MUAT BARANG)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1015, '52291', 'ANGKUTAN MULTIMODA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1016, '52292', 'AKTIVITAS TALLY MANDIRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1017, '52299', 'AKTIVITAS PENUNJANG ANGKUTAN LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1018, '52311', 'JASA PENGURUSAN TRANSPORTASI (JPT)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1019, '52312', 'JASA KEAGENAN KAPAL/AGEN PERKAPALAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1020, '52313', 'AKTIVITAS PERWAKILAN OPERASIONAL TRANSPORTASI UDARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1021, '52319', 'JASA INTERMEDIASI TRANSPORTASI LAINNYA UNTUK BARANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1022, '52321', 'AGEN PENJUALAN TIKET TRANSPORTASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1023, '52322', 'AGEN PENGURUS PERSETUJUAN TERBANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1024, '52323', 'AKTIVITAS PERWAKILAN OPERASIONAL TRANSPORTASI UDARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1025, '52329', 'JASA INTERMEDIASI TRANSPORTASI LAINNYA UNTUK PENUMPANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1026, '53100', 'AKTIVITAS POS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1027, '53200', 'AKTIVITAS KURIR Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1028, '53301', 'AKTIVITAS JASA PORTAL INTERMEDIASI POS DAN KURIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1029, '53309', 'JASA INTERMEDIASI POS DAN KURIR LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1030, '55101', 'AKTIVITAS HOTEL BINTANG LIMA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1031, '55102', 'AKTIVITAS HOTEL BINTANG EMPAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1032, '55103', 'AKTIVITAS HOTEL BINTANG TIGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1033, '55104', 'AKTIVITAS HOTEL BINTANG DUA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1034, '55105', 'AKTIVITAS HOTEL BINTANG SATU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1035, '55106', 'AKTIVITAS HOTEL NONBINTANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1036, '55201', 'AKTIVITAS RUMAH TINGGAL SEWA (HOMESTAY)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1037, '55202', 'AKTIVITAS HOSTEL REMAJA (YOUTH HOSTEL)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1038, '55203', 'AKTIVITAS VILA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1039, '55204', 'AKTIVITAS APARTEMEN HOTEL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1040, '55209', 'AKTIVITAS PENYEDIAAN AKOMODASI JANGKA PENDEK LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1041, '55300', 'AKTIVITAS PENYEDIAAN BUMI PERKEMAHAN, PERSINGGAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1042, '55400', 'AKTIVITAS JASA INTERMEDIASI AKOMODASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1043, '55901', 'AKTIVITAS JASA MANAJEMEN AKOMODASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1044, '55909', 'PENYEDIAAN AKOMODASI LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1045, '56101', 'AKTIVITAS PENYEDIAAN MAKANAN DI BANGUNAN TETAP', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1046, '56102', 'AKTIVITAS PENYEDIAAN MAKANAN DI BANGUNAN TIDAK TETAP', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1047, '56210', 'AKTIVITAS JASA BOGA UNTUK ACARA TERTENTU (EVENT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1048, '56290', 'AKTIVITAS PENYEDIAAN JASA BOGA LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1049, '56301', 'AKTIVITAS BAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1050, '56302', 'AKTIVITAS KELAB MALAM ATAU DISKOTEK YANG UTAMANYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1051, '56303', 'AKTIVITAS RUMAH MINUM/KAFE', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1052, '56304', 'AKTIVITAS KEDAI MINUMAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1053, '56305', 'AKTIVITAS RUMAH/KEDAI OBAT BAHAN ALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1054, '56306', 'AKTIVITAS PENYEDIAAN MINUMAN KELILING/TEMPAT TIDAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1055, '56400', 'AKTIVITAS JASA INTERMEDIASI PENYEDIAAN MAKANAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1056, '58110', 'PENERBITAN BUKU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1057, '58120', 'PENERBITAN SURAT KABAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1058, '58130', 'PENERBITAN JURNAL DAN TERBITAN BERKALA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1059, '58190', 'AKTIVITAS PENERBITAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1060, '58211', 'PENERBITAN PERANGKAT LUNAK VIDEO GIM DALAM JARINGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1061, '58219', 'PENERBITAN PERANGKAT LUNAK VIDEO GIM LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1062, '58290', 'PENERBITAN PERANGKAT LUNAK (SOFTWARE) LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1063, '59111', 'AKTIVITAS PRODUKSI FILM, VIDEO, DAN PROGRAM TELEVISI OLEH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1064, '59112', 'AKTIVITAS PRODUKSI FILM, VIDEO, DAN PROGRAM TELEVISI OLEH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1065, '59121', 'AKTIVITAS PASCAPRODUKSI FILM, VIDEO, DAN PROGRAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1066, '59122', 'AKTIVITAS PASCAPRODUKSI FILM, VIDEO, DAN PROGRAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1067, '59131', 'AKTIVITAS DISTRIBUSI FILM, VIDEO, DAN PROGRAM TELEVISI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1068, '59132', 'AKTIVITAS DISTRIBUSI FILM, VIDEO. DAN PROGRAM TELEVISI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1069, '59140', 'AKTIVITAS PEMUTARAN FILM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1070, '59201', 'AKTIVITAS PEREKAMAN SUARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1071, '59202', 'AKTIVITAS PENERBITAN MUSIK DAN BUKU MUSIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1072, '60101', 'AKTIVITAS PENYIARAN RADIO ANALOG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1073, '60102', 'AKTIVITAS PENYIARAN RADIO DIGITAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1074, '60103', 'AKTIVITAS DISTRIBUSI DAN STREAMING AUDIO ATAS PERMINTAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1075, '60201', 'AKTIVITAS PENYIARAN DAN PEMROGRAMAN TELEVISI ANALOG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1076, '60202', 'AKTIVITAS PEMROGRAMAN DAN PENYIARAN TELEVISI DIGITAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1077, '60203', 'AKTIVITAS DISTRIBUSI DAN STREAMING VIDEO ATAS PERMINTAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1078, '60311', 'AKTIVITAS KANTOR BERITA OLEH PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1079, '60312', 'AKTIVITAS KANTOR BERITA OLEH SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1080, '60390', 'AKTIVITAS SITUS JEJARING SOSIAL DAN DISTRIBUSI KONTEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1081, '61101', 'AKTIVITAS TELEKOMUNIKASI DENGAN KABEL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1082, '61102', 'AKTIVITAS TELEKOMUNIKASI DENGAN NIRKABEL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1083, '61103', 'AKTIVITAS TELEKOMUNIKASI DENGAN SATELIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1084, '61104', 'AKTIVITAS JASA AKSES INTERNET (INTERNET SERVICE PROVIDER)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1085, '61105', 'AKTIVITAS JASA SISTEM KOMUNIKASI DATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1086, '61106', 'AKTIVITIAS JASA TELEVISI PROTOKOL INTERNET (IPTV)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1087, '61107', 'AKTIVITAS JASA GERBANG AKSES INTERNET (NETWORK ACCESS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1088, '61108', 'AKTIVITAS JASA TELEPONI DASAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1089, '61201', 'AKTIVITAS PENJUALAN KEMBALI JASA TELEKOMUNIKASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1090, '61209', 'AKTIVITAS PENJUALAN KEMBALI DAN JASA INTERMEDIASI UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1091, '61901', 'AKTIVITAS JASA PANGGILAN PREMIUM (PREMIUM CALL)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1092, '61902', 'AKTIVITAS JASA KONTEN SMS PREMIUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1093, '61903', 'AKTIVITAS JASA INTERNET TELEPONI UNTUK KEPERLUAN PUBLIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1094, '61904', 'AKTIVITAS JASA PANGGILAN TERKELOLA (CALLING CARD)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1095, '61905', 'AKTIVITAS JASA TELEKOMUNIKASI KHUSUS BERBASIS SATELIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1096, '61909', 'AKTIVITAS TELEKOMUNIKASI LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1097, '62110', 'PENGEMBANGAN VIDEO GIM, PERANGKAT LUNAK VIDEO GIM, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1098, '62191', 'AKTIVITAS PENGEMBANGAN APLIKASI PERDAGANGAN MELALUI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1099, '62192', 'AKTIVITAS PENGEMBANGAN APLIKASI DAN PRODUKSI KONTEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1100, '62193', 'AKTIVITAS PENGEMBANGAN APLIKASI BERBASIS TEKNOLOGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1101, '62194', 'AKTIVITAS PENGEMBANGAN KOMPONEN DASAR KECERDASAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1102, '62199', 'AKTIVITAS PEMROGRAMAN KOMPUTER LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1103, '62201', 'AKTIVITAS KONSULTANSI DAN MANAJEMEN KEAMANAN SIBER', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1104, '62202', 'AKTIVITAS PENYEDIAAN DAN PENGELOLAAN IDENTITAS DIGITAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1105, '62203', 'AKTIVITAS PENYEDIAAN SERTIFIKAT ELEKTRONIK DAN JASA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1106, '62204', 'AKTIVITAS KONSULTANSI DAN PERANCANGAN INTERNET OF', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1107, '62209', 'AKTIVITAS KONSULTANSI KOMPUTER DAN MANAJEMEN FASILITAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1108, '62900', 'AKTIVITAS JASA TEKNOLOGI INFORMASI DAN KOMPUTER LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1109, '63101', 'AKTIVITAS PENGOLAHAN DATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1110, '63102', 'AKTIVITAS PENYEDIAAN INFRASTRUKTUR KOMPUTASI, HOSTING,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1111, '63900', 'AKTIVITAS JASA PORTAL PENCARIAN WEB DAN INFORMASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1112, '64110', 'AKTIVITAS BANK SENTRAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1113, '64121', 'PERBANKAN UMUM KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1114, '64122', 'PERBANKAN UMUM SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1115, '64123', 'PERBANKAN KONVENSIONAL LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1116, '64124', 'PERBANKAN SYARIAH LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1117, '64191', 'AKTIVITAS PEMBERIAN KREDIT OLEH KOPERASI KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1118, '64192', 'AKTIVITAS PEMBERIAN KREDIT OLEH KOPERASI SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1119, '64193', 'PEMBIAYAAN MIKRO KONVENSIONAL NONPERBANKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1120, '64194', 'PEMBIAYAAN MIKRO SYARIAH NONPERBANKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1121, '64199', 'PERANTARA MONETER LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1122, '64210', 'AKTIVITAS PERUSAHAAN INDUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1123, '64220', 'AKTIVITAS PEMBIAYAAN CONDUIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1124, '64310', 'AKTIVITAS DANA PASAR UANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1125, '64320', 'AKTIVITAS DANA INVESTASI BUKAN PASAR UANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1126, '64330', 'AKTIVITAS TRUST, WARISAN, DAN KEAGENAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1127, '64910', 'AKTIVITAS SEWA GUNA USAHA FINANSIAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1128, '64920', 'AKTIVITAS PEMBIAYAAN PERDAGANGAN INTERNASIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1129, '64930', 'AKTIVITAS ANJAK PIUTANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1130, '64940', 'AKTIVITAS SEKURITISASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1131, '64951', 'PEMBIAYAAN INFRASTRUKTUR KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1132, '64952', 'PEMBIAYAAN INFRASTRUKTUR SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1133, '64953', 'AKTIVITAS GADAI KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1134, '64954', 'AKTIVITAS GADAI SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1135, '64955', 'PENGELOLAAN TABUNGAN PERUMAHAN RAKYAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1136, '64959', 'AKTIVITAS PEMBERIAN KREDIT LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1137, '64991', 'AKTIVITAS MODAL VENTURA KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1138, '64992', 'AKTIVITAS MODAL VENTURA SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1139, '64993', 'AKTIVITAS COUNTERPARTY UNTUK KLIRING DAN SETELMEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1140, '64994', 'PERDAGANGAN DI PASAR KEUANGAN ATAS NAMA SENDIRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1141, '64995', 'PERDAGANGAN UNIT KARBON ATAS NAMA SENDIRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1142, '64996', 'AKTIVITAS PERBANKAN BULION KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1143, '64997', 'AKTIVITAS PERBANKAN BULION SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1144, '64999', 'AKTIVITAS JASA KEUANGAN LAINNYA YTDL, BUKAN ASURANSI DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1145, '65111', 'ASURANSI JIWA KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1146, '65112', 'ASURANSI JIWA SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1147, '65121', 'ASURANSI UMUM KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1148, '65122', 'ASURANSI UMUM SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1149, '65123', 'AKTIVITAS PENJAMINAN SIMPANAN DAN ASURANSI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1150, '65131', 'PENJAMINAN KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1151, '65132', 'PENJAMINAN SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1152, '65201', 'REASURANSI KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1153, '65202', 'REASURANSI SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1154, '65203', 'PENJAMINAN ULANG KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1155, '65204', 'PENJAMINAN ULANG SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1156, '65301', 'AKTIVITAS DANA PENSIUN PEMBERI KERJA KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1157, '65302', 'AKTIVITAS DANA PENSIUN PEMBERI KERJA SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1158, '65303', 'AKTIVITAS DANA PENSIUN LEMBAGA KEUANGAN KONVENSIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1159, '65304', 'AKTIVITAS DANA PENSIUN LEMBAGA KEUANGAN SYARIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1160, '66111', 'PENYELENGGARAAN SISTEM PERDAGANGAN EFEK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1161, '66112', 'BURSA BERJANGKA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1162, '66113', 'PENYELENGGARAAN BURSA ASET KEUANGAN DIGITAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1163, '66114', 'PENYELENGGARAAN PERDAGANGAN KONTRAK DERIVATIF DI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1164, '66115', 'PENYELENGGARAAN SARANA TRANSAKSI DI PASAR UANG DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1165, '66116', 'AKTIVITAS PENGAWASAN JASA KEUANGAN SELAIN ASURANSI DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1166, '66117', 'AKTIVITAS REGULATOR MANDIRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1167, '66119', 'ADMINISTRASI PASAR KEUANGAN, PASAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1168, '66121', 'KEPIALANGAN EFEK SELAIN UNIT KARBON', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1169, '66122', 'KEPIALANGAN PERDAGANGAN KOMODITAS BERJANGKA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1170, '66123', 'KEPIALANGAN ASET KEUANGAN DIGITAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1171, '66124', 'KEPIALANGAN PASAR UANG DAN PASAR VALUTA ASING', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1172, '66125', 'AKTIVITAS PENUKARAN VALUTA ASING (MONEY CHANGER)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1173, '66126', 'PENAWARAN EFEK MELALUI LAYANAN URUN DANA BERBASIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1174, '66127', 'KEPIALANGAN UNIT KARBON', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1175, '66129', 'KEPIALANGAN EFEK DAN KONTRAK KOMODITAS LAINNYA Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1176, '66131', 'KLIRING DAN SETELMEN TRANSAKSI DI PASAR KEUANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1177, '66132', 'AKTIVITAS PENYIMPANAN ASET KEUANGAN DAN KONTRAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1178, '66133', 'AKTIVITAS ADMINISTRASI KEPEMILIKAN EFEK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1179, '66141', 'PENYEDIAAN JASA PEMBAYARAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1180, '66142', 'PENYELENGGARAAN INFRASTRUKTUR SISTEM PEMBAYARAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1181, '66143', 'PENYELENGGARAAN PENUNJANG SISTEM PEMBAYARAN Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1182, '66144', 'AKTIVITAS JASA PENGOLAHAN UANG RUPIAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1183, '66149', 'PENYELENGGARAAN TRANSAKSI KEUANGAN DAN PENGELOLAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1184, '66151', 'AKTIVITAS ADVISORI INVESTASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1185, '66152', 'AKTIVITAS ADVISORI PERDAGANGAN BERJANGKA KOMODITAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1186, '66153', 'AKTIVITAS ADVISORI SYARIAH PASAR MODAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1187, '66159', 'AKTIVITAS ADVISORI PASAR KEUANGAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1188, '66161', 'JASA INTERMEDIASI PINJAM MEMINJAM UANG BERBASIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1189, '66162', 'JASA INTERMEDIASI PINJAM MEMINJAM UANG BERBASIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1190, '66191', 'AKTIVITAS PENDANAAN UNTUK TRANSAKSI EFEK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1191, '66192', 'PENITIPAN DAN PENGELOLAAN BERDASARKAN PERJANJIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1192, '66193', 'PEMERINGKATAN EFEK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1193, '66194', 'PENILAIAN HARGA EFEK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1194, '66195', 'PENYELENGGARAAN DANA PERLINDUNGAN PEMODAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1195, '66196', 'PENJAMINAN EMISI EFEK (UNDERWRITER)', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1196, '66197', 'AKTIVITAS PENDUKUNG DI PASAR UANG DAN PASAR VALUTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1197, '66198', 'PEMERINGKATAN USAHA MIKRO, KECIL, MENENGAH, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1198, '66199', 'AKTIVITAS PENUNJANG JASA KEUANGAN LAINNYA YTDL, KECUALI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1199, '66211', 'AKTIVITAS PENILAI RISIKO ASURANSI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1200, '66212', 'AKTIVITAS PENILAI KERUGIAN ASURANSI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1201, '66221', 'AKTIVITAS AGEN ASURANSI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1202, '66222', 'AKTIVITAS PIALANG ASURANSI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1203, '66223', 'AKTIVITAS PIALANG REASURANSI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1204, '66224', 'AKTIVITAS AGEN PENJAMINAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1205, '66225', 'AKTIVITAS BROKER PENJAMINAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1206, '66226', 'AKTIVITAS BROKER PENJAMINAN ULANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1207, '66291', 'AKTIVITAS ADVISORI AKTUARIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1208, '66292', 'AKTIVITAS PENGAWASAN JASA KEUANGAN ASURANSI DAN DANA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1209, '66299', 'AKTIVITAS PENUNJANG LAINNYA UNTUK ASURANSI, PENJAMIAN,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1210, '66301', 'MANAJEMEN INVESTASI KONVENSIONAL DI PASAR KEUANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1211, '66302', 'MANAJEMEN INVESTASI SYARIAH DI PASAR KEUANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1212, '66303', 'MANAJEMEN INVESTASI DI PERDAGANGAN BERJANGKA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1213, '66309', 'AKTIVITAS MANAJEMEN DANA LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1214, '68111', 'AKTIVITAS PENGEMBANGAN BANGUNAN DAN LAHAN HUNIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1215, '68112', 'AKTIVITAS PENYEWAAN BANGUNAN DAN LAHAN HUNIAN MILIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1216, '68121', 'PENGELOLAAN KAWASAN PARIWISATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1217, '68122', 'PENGELOLAAN KAWASAN INDUSTRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1218, '68123', 'PENGELOLAAN KAWASAN EKONOMI KHUSUS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1219, '68124', 'PENYEWAAN TEMPAT PENYELENGGARAAN AKTIVITAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1220, '68125', 'PENGELOLAAN PUSAT PERBELANJAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1221, '68126', 'PENYEWAAN GUDANG DAN FASILITAS PENYIMPANAN MANDIRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1222, '68127', 'PENGELOLAAN GEDUNG PERKANTORAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1223, '68129', 'AKTIVITAS REAL ESTAT (BANGUNAN DAN LAHAN) NONHUNIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1224, '68210', 'AKTIVITAS JASA INTERMEDIASI REAL ESTAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1225, '68291', 'JASA PENAKSIR REAL ESTAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1226, '68292', 'PENGELOLAAN REAL ESTAT HUNIAN ATAS DASAR BALAS JASA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1227, '68299', 'AKTIVITAS REAL ESTAT ATAS DASAR BALAS JASA (FEE) ATAU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1228, '69101', 'AKTIVITAS PENGACARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1229, '69102', 'AKTIVITAS KONSULTAN HUKUM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1230, '69103', 'AKTIVITAS KONSULTAN KEKAYAAN INTELEKTUAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1231, '69104', 'AKTIVITAS NOTARIS DAN PEJABAT PEMBUAT AKTA TANAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1232, '69201', 'AKTIVITAS AKUNTANSI, PEMBUKUAN, DAN PEMERIKSA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1233, '69202', 'AKTIVITAS KONSULTANSI PAJAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1234, '70100', 'AKTIVITAS KANTOR PUSAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1235, '70201', 'AKTIVITAS KONSULTANSI MANAJEMEN DAN BISNIS PARIWISATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1236, '70202', 'AKTIVITAS KONSULTANSI MANAJEMEN DAN BISNIS INDUSTRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1237, '70203', 'AKTIVITAS KONSULTANSI MANAJEMEN DAN BISNIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1238, '70209', 'AKTIVITAS KONSULTASI MANAJEMEN DAN BISNIS LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1239, '71101', 'AKTIVITAS ARSITEKTURAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1240, '71102', 'AKTIVITAS PERANCANGAN DAN KONSULTANSI TEKNIS PABRIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1241, '71109', 'AKTIVITAS ENJINERING DAN KONSULTANSI TEKNIS TERKAIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1242, '71201', 'JASA SERTIFIKASI TEKNIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1243, '71202', 'JASA INSPEKSI TEKNIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1244, '71203', 'JASA VERIFIKASI DAN VALIDASI TEKNIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1245, '71204', 'JASA PENGUJIAN TEKNIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1246, '71209', 'PENGUJIAN DAN ANALISIS TEKNIS LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1247, '72101', 'PENELITIAN DAN PENGEMBANGAN ILMU ALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1248, '72102', 'PENELITIAN DAN PENGEMBANGAN ENJINERING DAN TEKNOLOGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1249, '72103', 'PENELITIAN DAN PENGEMBANGAN ILMU KEDOKTERAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1250, '72104', 'PENELITIAN DAN PENGEMBANGAN BIOTEKNOLOGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1251, '72105', 'PENELITIAN DAN PENGEMBANGAN ILMU PERTANIAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1252, '72106', 'PENELITIAN DAN PENGEMBANGAN KETENAGANUKLIRAN Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1253, '72109', 'PENELITIAN DAN PENGEMBANGAN EKSPERIMENTAL ILMU ALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1254, '72201', 'PENELITIAN DAN PENGEMBANGAN ILMU PENGETAHUAN SOSIAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1255, '72202', 'PENELITIAN DAN PENGEMBANGAN HUMANIORA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1256, '73100', 'AKTIVITAS PERIKLANAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1257, '73201', 'PENELITIAN PASAR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1258, '73202', 'JAJAK PENDAPAT OPINI PUBLIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1259, '73300', 'AKTIVITAS KEHUMASAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1260, '74111', 'AKTIVITAS DESAIN ALAT TRANSPORTASI DAN PERMESINAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1261, '74112', 'AKTIVITAS DESAIN PERALATAN RUMAH TANGGA DAN FURNITUR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1262, '74113', 'AKTIVITAS DESAIN TEKSTIL, MODE/FESYEN, DAN GARMEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1263, '74114', 'AKTIVITAS DESAIN INDUSTRI STRATEGIS DAN PERTAHANAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1264, '74115', 'AKTIVITAS DESAIN ALAT KOMUNIKASI DAN ELEKTRONIKA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1265, '74116', 'AKTIVITAS DESAIN PERALATAN OLAHRAGA DAN PERMAINAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1266, '74117', 'AKTIVITAS DESAIN PRODUK KESEHATAN, KOSMETIK, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1267, '74118', 'AKTIVITAS DESAIN PENGEMASAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1268, '74119', 'AKTIVITAS DESAIN INDUSTRI LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1269, '74191', 'AKTIVITAS DESAIN INTERIOR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1270, '74192', 'AKTIVITAS DESAIN GRAFIS/KOMUNIKASI VISUAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1271, '74193', 'AKTIVITAS DESAIN KHUSUS FILM, VIDEO, PROGRAM TELEVISI,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1272, '74194', 'AKTIVITAS DESAIN KONTEN GIM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1273, '74199', 'AKTIVITAS DESAIN KHUSUS LAINYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1274, '74201', 'AKTIVITAS FOTOGRAFI UDARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1275, '74209', 'AKTIVITAS FOTOGRAFI LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1276, '74300', 'AKTIVITAS PENERJEMAH ATAU INTERPRETER', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1277, '74910', 'AKTIVITAS BROKER DAN LAYANAN PEMASARAN PATEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1278, '74991', 'JASA METEOROLOGI DAN PRAKIRAAN CUACA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1279, '74999', 'SEMUA AKTIVITAS PROFESIONAL, ILMIAH DAN TEKNIS YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1280, '75001', 'AKTIVITAS PERSONEL KESEHATAN HEWAN MANDIRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1281, '75002', 'AKTIVITAS PENGELOLAAN SARANA KESEHATAN HEWAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1282, '75009', 'AKTIVITAS PENGELOLAAN KESEHATAN HEWAN LAINNYA Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1283, '77100', 'PENYEWAAN DAN SEWA GUNA USAHA KENDARAAN BERMOTOR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1284, '77210', 'PENYEWAAN DAN SEWA GUNA USAHA ALAT REKREASI DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1285, '77291', 'PENYEWAAN PERALATAN DAN PERLENGKAPAN ACARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1286, '77292', 'PENYEWAAN ALAT MUSIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1287, '77293', 'PENYEWAAN BARANG HASIL PENCETAKAN DAN PENERBITAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1288, '77294', 'PENYEWAAN BUNGA DAN TANAMAN HIAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1289, '77299', 'PENYEWAAN BARANG PRIBADI DAN BARANG RUMAH TANGGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1290, '77311', 'PENYEWAAN DAN SEWA GUNA USAHA ALAT TRANSPORTASI DARAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1291, '77312', 'PENYEWAAN DAN SEWA GUNA USAHA ALAT TRANSPORTASI AIR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1292, '77313', 'PENYEWAAN DAN SEWA GUNA USAHA ALAT TRANSPORTASI UDARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1293, '77391', 'PENYEWAAN DAN SEWA GUNA USAHA MESIN DAN PERALATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1294, '77392', 'PENYEWAAN DAN SEWA GUNA USAHA MESIN DAN ALAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1295, '77393', 'PENYEWAAN DAN SEWA GUNA USAHA MESIN DAN PERALATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1296, '77394', 'PENYEWAAN DAN SEWA GUNA USAHA MESIN DAN PERALATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1297, '77395', 'PENYEWAAN DAN SEWA GUNA MESIN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25');
INSERT INTO `kbli` (`id`, `kode`, `judul`, `versi`, `created_at`, `updated_at`) VALUES
(1298, '77396', 'PENYEWAAN DAN SEWA GUNA USAHA MESIN DAN PERALATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1299, '77397', 'PENYEWAAN DAN SEWA GUNA USAHA MESIN DAN PERALATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1300, '77399', 'PENYEWAAN DAN SEWA GUNA USAHA MESIN, PERALATAN, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1301, '77400', 'SEWA GUNA USAHA KEKAYAAN INTELEKTUAL DAN PRODUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1302, '77510', 'AKTIVITAS JASA INTERMEDIASI UNTUK PENYEWAAN DAN SEWA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1303, '77520', 'AKTIVITAS JASA INTERMEDIASI UNTUK PENYEWAAN DAN SEWA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1304, '78101', 'AKTIVITAS PENEMPATAN TENAGA KERJA UNTUK USAHA DI DALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1305, '78102', 'AKTIVITAS PENEMPATAN TENAGA KERJA LUAR NEGERI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1306, '78103', 'AKTIVITAS PENEMPATAN TENAGA KERJA UNTUK RUMAH TANGGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1307, '78104', 'AKTIVITAS PENEMPATAN AWAK KAPAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1308, '78105', 'AKTIVITAS PENYEDIAAN INFORMASI LOWONGAN KERJA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1309, '78109', 'AKTIVITAS PENEMPATAN TENAGA KERJA LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1310, '78200', 'AKTIVITAS PENYEDIAAN TENAGA KERJA SEMENTARA DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1311, '79110', 'AKTIVITAS AGEN PERJALANAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1312, '79121', 'AKTIVITAS BIRO PERJALANAN WISATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1313, '79122', 'AKTIVITAS BIRO PERJALANAN IBADAH UMRAH DAN HAJI KHUSUS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1314, '79129', 'AKTIVITAS BIRO PERJALANAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1315, '79901', 'JASA INFORMASI PARIWISATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1316, '79902', 'JASA INFORMASI DAYA TARIK WISATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1317, '79903', 'JASA PRAMUWISATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1318, '79909', 'AKTIVITAS TERKAIT PERJALANAN LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1319, '80110', 'AKTIVITAS INVESTIGASI DAN KEAMANAN SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1320, '80190', 'AKTIVITAS KEAMANAN YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1321, '81100', 'AKTIVITAS PENYEDIAAN GABUNGAN JASA PENUNJANG FASILITAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1322, '81210', 'AKTIVITAS KEBERSIHAN UMUM BANGUNAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1323, '81290', 'AKTIVITAS KEBERSIHAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1324, '81300', 'AKTIVITAS JASA LANSKAP Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1325, '82100', 'AKTIVITAS ADMINISTRASI KANTOR DAN PENUNJANG KANTOR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1326, '82200', 'AKTIVITAS PUSAT PANGGILAN (CALL CENTER) Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1327, '82300', 'PENYELENGGARAAN KONVENSI DAN PAMERAN BISNIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1328, '82400', 'JASA INTERMEDIASI UNTUK AKTIVITAS PENUNJANG USAHA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1329, '82911', 'AKTIVITAS AGEN PENAGIHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1330, '82912', 'AKTIVITAS BIRO KREDIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1331, '82921', 'AKTIVITAS PENGEPAKAN BAHAN DAN PRODUK HASIL PERTANIAN,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1332, '82922', 'AKTIVITAS PENGEPAKAN BAHAN DAN PRODUK MAKANAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1333, '82923', 'AKTIVITAS PENGEPAKAN TEKSTIL DAN PRODUK TEKSTIL Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1334, '82924', 'AKTIVITAS PENGEPAKAN BAHAN DAN PRODUK KIMIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1335, '82925', 'AKTIVITAS PENGEPAKAN BAHAN DAN PRODUK FARMASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1336, '82929', 'AKTIVITAS PENGEPAKAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1337, '82990', 'AKTIVITAS JASA PENUNJANG USAHA LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1338, '84111', 'LEMBAGA LEGISLATIF', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1339, '84112', 'PENYELENGGARAAN PEMERINTAHAN NEGARA DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1340, '84113', 'LEMBAGA EKSEKUTIF KEUANGAN, PERPAJAKAN, DAN BEA CUKAI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1341, '84114', 'LEMBAGA EKSEKUTIF PERENCANAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1342, '84115', 'LEMBAGA PEMERINTAH NONKEMENTERIAN DENGAN TUGAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1343, '84119', 'KEGIATAN ADMINISTRASI PEMERINTAHAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1344, '84121', 'ADMINISTRASI PELAYANAN PEMERINTAH BIDANG PENDIDIKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1345, '84122', 'ADMINISTRASI PELAYANAN PEMERINTAH BIDANG KESEHATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1346, '84123', 'ADMINISTRASI PELAYANAN PEMERINTAH BIDANG PERUMAHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1347, '84124', 'ADMINISTRASI PELAYANAN PEMERINTAH BIDANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1348, '84125', 'ADMINISTRASI PELAYANAN PEMERINTAH BIDANG KEAGAMAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1349, '84126', 'ADMINISTRASI PELAYANAN PEMERINTAH BIDANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1350, '84129', 'ADMINISTRASI PELAYANAN PEMERINTAH BIDANG SOSIAL LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1351, '84130', 'ADMINISTRASI PELAYANAN PEMERINTAH BIDANG LINGKUNGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1352, '84141', 'KEGIATAN LEMBAGA PEMERINTAHAN BIDANG PERTANIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1353, '84142', 'KEGIATAN LEMBAGA PEMERINTAHAN BIDANG PERTAMBANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1354, '84143', 'KEGIATAN LEMBAGA PEMERINTAHAN BIDANG PERINDUSTRIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1355, '84144', 'KEGIATAN LEMBAGA PEMERINTAHAN BIDANG KOMUNIKASI DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1356, '84145', 'KEGIATAN LEMBAGA PEMERINTAHAN BIDANG KONSTRUKSI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1357, '84146', 'KEGIATAN LEMBAGA PEMERINTAHAN BIDANG PERDAGANGAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1358, '84147', 'KEGIATAN LEMBAGA PEMERINTAHAN BIDANG PERHUBUNGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1359, '84148', 'KEGIATAN LEMBAGA PEMERINTAHAN BIDANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1360, '84149', 'KEGIATAN LEMBAGA PEMERINTAHAN UNTUK MENCIPTAKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1361, '84210', 'HUBUNGAN LUAR NEGERI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1362, '84221', 'LEMBAGA PERTAHANAN DAN ANGKATAN BERSENJATA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1363, '84222', 'ANGKATAN DARAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1364, '84223', 'ANGKATAN UDARA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1365, '84224', 'ANGKATAN LAUT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1366, '84231', 'KEPOLISIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1367, '84232', 'PERTAHANAN SIPIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1368, '84233', 'AKTIVITAS LEMBAGA PERADILAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1369, '84234', 'KEGIATAN LEMBAGA PEMERINTAHAN BIDANG PENANGGULANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1370, '84300', 'AKTIVITAS JAMINAN SOSIAL WAJIB', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1371, '85101', 'PENDIDIKAN TAMAN KANAK - KANAK UMUM PEMERINTAH Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1372, '85102', 'PENDIDIKAN TAMAN KANAK - KANAK UMUM SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1373, '85103', 'PENDIDIKAN PRASEKOLAH KEAGAMAAN ISLAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1374, '85104', 'PENDIDIKAN PRASEKOLAH KEAGAMAAN PROTESTAN, KATOLIK,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1375, '85201', 'PENDIDIKAN DASAR UMUM PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1376, '85202', 'PENDIDIKAN DASAR UMUM SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1377, '85203', 'PENDIDIKAN DASAR KEAGAMAAN ISLAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1378, '85204', 'PENDIDIKAN DASAR KEAGAMAAN PROTESTAN, KATOLIK, HINDU,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1379, '85311', 'PENDIDIKAN MENENGAH PERTAMA UMUM PEMERINTAH Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1380, '85312', 'PENDIDIKAN MENENGAH PERTAMA UMUM SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1381, '85313', 'PENDIDIKAN MENENGAH PERTAMA KEAGAMAAN ISLAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1382, '85314', 'PENDIDIKAN MENENGAH PERTAMA KEAGAMAAN PROTESTAN,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1383, '85315', 'PENDIDIKAN MENENGAH ATAS UMUM PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1384, '85316', 'PENDIDIKAN MENENGAH ATAS UMUM SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1385, '85317', 'PENDIDIKAN MENENGAH ATAS KEAGAMAAN ISLAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1386, '85318', 'PENDIDIKAN MENENGAH ATAS KEAGAMAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1387, '85321', 'PENDIDIKAN MENENGAH KEJURUAN UMUM PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1388, '85322', 'PENDIDIKAN MENENGAH KEJURUAN UMUM SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1389, '85323', 'PENDIDIKAN MENENGAH KEJURUAN KEAGAMAAN ISLAM Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1390, '85324', 'PENDIDIKAN MENENGAH KEJURUAN KEAGAMAAN PROTESTAN,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1391, '85330', 'PENDIDIKAN PASCAMENENGAH NONTERSIER', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1392, '85401', 'PENDIDIKAN TINGGI UMUM PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1393, '85402', 'PENDIDIKAN TINGGI UMUM SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1394, '85403', 'PENDIDIKAN TINGGI KEAGAMAAN PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1395, '85404', 'PENDIDIKAN TINGGI KEAGAMAAN SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1396, '85510', 'PENDIDIKAN OLAHRAGA DAN REKREASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1397, '85520', 'PENDIDIKAN KEBUDAYAAN 8552 PENDIDIKAN KEBUDAYAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1398, '85530', 'KEGIATAN SEKOLAH MENGEMUDI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1399, '85541', 'PENDIDIKAN PESANTREN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1400, '85542', 'PENDIDIKAN KEAGAMAAN ISLAM NONFORMAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1401, '85549', 'PENDIDIKAN KEAGAMAAN LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1402, '85550', 'PENDIDIKAN LAINNYA PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1403, '85560', 'PELATIHAN KERJA PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1404, '85571', 'PELATIHAN KERJA TEKNIK SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1405, '85572', 'PELATIHAN KERJA TEKNOLOGI INFORMASI DAN KOMUNIKASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1406, '85573', 'PELATIHAN KERJA INDUSTRI KREATIF SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1407, '85574', 'PELATIHAN KERJA PARIWISATA DAN PERHOTELAN SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1408, '85575', 'PELATIHAN KERJA BISNIS DAN MANAJEMEN SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1409, '85576', 'PELATIHAN KERJA PEKERJAAN DOMESTIK SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1410, '85577', 'PELATIHAN KERJA PERTANIAN DAN PERIKANAN SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1411, '85578', 'PENDIDIKAN DAN PELATIHAN PERSONEL PENERBANGAN Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1412, '85579', 'PELATIHAN KERJA SWASTA LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1413, '85581', 'PELATIHAN KERJA TEKNIK PERUSAHAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1414, '85582', 'PELATIHAN KERJA TEKNOLOGI INFORMASI DAN KOMUNIKASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1415, '85583', 'PELATIHAN KERJA INDUSTRI KREATIF PERUSAHAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1416, '85584', 'PELATIHAN KERJA PARIWISATA DAN PERHOTELAN PERUSAHAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1417, '85585', 'PELATIHAN KERJA BISNIS DAN MANAJEMEN PERUSAHAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1418, '85586', 'PELATIHAN KERJA PEKERJAAN DOMESTIK PERUSAHAAN Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1419, '85587', 'PELATIHAN KERJA PERTANIAN DAN PERIKANAN PERUSAHAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1420, '85589', 'PELATIHAN KERJA PERUSAHAAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1421, '85591', 'PENDIDIKAN MANAJEMEN DAN PERBANKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1422, '85592', 'PENDIDIKAN KOMPUTER (TEKNOLOGI INFORMASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1423, '85593', 'PENDIDIKAN BAHASA SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1424, '85594', 'PENDIDIKAN KESEHATAN SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1425, '85595', 'PENDIDIKAN BIMBINGAN BELAJAR DAN KONSELING SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1426, '85596', 'PENDIDIKAN TEKNIK SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1427, '85597', 'PENDIDIKAN KERAJINAN DAN INDUSTRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1428, '85599', 'PENDIDIKAN LAINNYA SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1429, '85610', 'JASA PERANTARA KURSUS DAN TUTOR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1430, '85691', 'AKTIVITAS SERTIFIKASI PROFESI HASIL PENDIDIKAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1431, '85692', 'AKTIVITAS SERTIFIKASI PROFESI HASIL PENDIDIKAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1432, '85693', 'AKTIVITAS SERTIFIKASI PROFESI OLEH ASOSIASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1433, '85694', 'AKTIVITAS SERTIFIKASI PROFESI INDEPENDEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1434, '85699', 'KEGIATAN PENUNJANG PENDIDIKAN LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1435, '86101', 'AKTIVITAS RUMAH SAKIT PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1436, '86102', 'AKTIVITAS PUSKESMAS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1437, '86103', 'AKTIVITAS RUMAH SAKIT SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1438, '86104', 'AKTIVITAS KLINIK PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1439, '86105', 'AKTIVITAS KLINIK SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1440, '86109', 'AKTIVITAS RUMAH SAKIT LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1441, '86201', 'AKTIVITAS PRAKTIK DOKTER', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1442, '86202', 'AKTIVITAS PRAKTIK DOKTER SPESIALIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1443, '86203', 'AKTIVITAS PRAKTIK DOKTER GIGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1444, '86910', 'AKTIVITAS JASA INTERMEDIASI UNTUK KESEHATAN MEDIS,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1445, '86991', 'AKTIVITAS PELAYANAN KESEHATAN YANG DILAKUKAN OLEH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1446, '86992', 'AKTIVITAS PELAYANAN KESEHATAN TRADISIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1447, '86993', 'AKTIVITAS PELAYANAN PENUNJANG KESEHATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1448, '86994', 'AKTIVITAS ANGKUTAN KHUSUS PENGANGKUTAN ORANG SAKIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1449, '86995', 'AKTIVITAS RUMAH PIJAT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1450, '87101', 'AKTIVITAS PERAWATAN DAN PEMULIHAN KESEHATAN BERBASIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1451, '87102', 'AKTIVITAS PERAWATAN DAN PEMULIHAN KESEHATAN BERBASIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1452, '87201', 'AKTIVITAS PERAWATANUNTUK ORANG YANG HIDUP DENGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1453, '87202', 'AKTIVITAS PERAWATAN UNTUK ORANG YANG HIDUP DENGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1454, '87301', 'AKTIVITAS PERAWATAN UNTUK LANJUT USIA ATAU PENYANDANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1455, '87302', 'AKTIVITAS SOSIAL UNTUK LANJUT USIA ATAU PENYANDANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1456, '87303', 'AKTIVITAS PENGELOLAAN AKOMODASI WARGA LANJUT USIA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1457, '87910', 'JASA INTERMEDIASI UNTUK AKTIVITAS PERAWATAN BERBASIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1458, '87991', 'AKTIVITAS LEMBAGA KESEJAHTERAAN SOSIAL ANAK BERBASIS', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1459, '87992', 'AKTIVITAS PERAWATANUNTUK ANAK YANG BERHADAPAN DENGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1460, '87993', 'AKTIVITAS TUNASOSIAL BERBASIS RESIDENSIAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1461, '88101', 'AKTIVITAS SOSIAL PEMERINTAH TANPA AKOMODASI UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1462, '88102', 'AKTIVITAS SOSIAL LEMBAGA KESEJAHTERAAN SOSIAL TANPA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1463, '88901', 'AKTIVITAS SOSIAL PEMERINTAH TANPA AKOMODASI LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1464, '88902', 'AKTIVITAS SOSIAL LEMBAGA KESEJAHTERAAN SOSIAL TANPA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1465, '88903', 'AKTIVITAS SOSIAL PENGUMPULAN DANA KEISLAMAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1466, '88904', 'AKTIVITAS SOSIAL PENGUMPULAN DANA NONISLAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1467, '88905', 'AKTIVITAS SOSIAL PENGUMPULAN DANA LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1468, '88906', 'PENDIDIKAN KELOMPOK BERMAIN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1469, '88907', 'PENDIDIKAN TAMAN PENITIPAN ANAK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1470, '90111', 'AKTIVITAS PENCIPTAAN KARYA SASTRA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1471, '90112', 'AKTIVITAS PENCIPTAAN KOMPOSISI MUSIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1472, '90113', 'AKTIVITAS JURNALIS BERITA INDEPENDEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1473, '90120', 'AKTIVITAS PENCIPTAAN KARYA SENI RUPA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1474, '90130', 'AKTIVITAS PENCIPTAAN KARYA SENI LAINNYA Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1475, '90200', 'AKTIVITAS SENI PERTUNJUKAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1476, '90310', 'AKTIVITAS OPERASIONAL TEMPAT DAN FASILITAS KESENIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1477, '90391', 'PENYELENGGARAAN KEGIATAN KESENIAN DAN KEBUDAYAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1478, '90399', 'AKTIVITAS PENUNJANG PENCIPTAAN KARYA SENI DAN SENI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1479, '91111', 'AKTIVITAS PERPUSTAKAAN PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1480, '91112', 'AKTIVITAS PERPUSTAKAAN SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1481, '91121', 'AKTIVITAS KEARSIPAN PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1482, '91122', 'AKTIVITAS KEARSIPAN SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1483, '91211', 'MUSEUM YANG DIKELOLA PEMERINTAH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1484, '91212', 'MUSEUM YANG DIKELOLA SWASTA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1485, '91221', 'AKTIVITAS SITUS BERSEJARAH DAN MONUMEN YANG DIKELOLA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1486, '91222', 'AKTIVITAS SITUS BERSEJARAH DAN MONUMEN YANG DIKELOLA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1487, '91300', 'KONSERVASI, RESTORASI, DAN AKTIVITAS PENUNJANG LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1488, '91410', 'AKTIVITAS TAMAN BOTANI DAN KEBUN BINATANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1489, '91421', 'SUAKA MARGASATWA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1490, '91422', 'TAMAN NASIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1491, '91423', 'HUTAN LINDUNG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1492, '91424', 'TAMAN WISATA ALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1493, '91425', 'TAMAN HUTAN RAYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1494, '91426', 'TAMAN LAUT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1495, '91429', 'AKTIVITAS CAGAR ALAM LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1496, '92000', 'AKTIVITAS PERJUDIAN DAN PERTARUHAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1497, '93111', 'FASILITAS STADION', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1498, '93112', 'FASILITAS SIRKUIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1499, '93113', 'FASILITAS GELANGGANG/ARENA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1500, '93114', 'FASILITAS LAPANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1501, '93115', 'FASILITAS OLAHRAGA BELADIRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1502, '93116', 'FASILITAS PUSAT KEBUGARAN/FITNESS CENTER', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1503, '93119', 'PENGELOLAAN FASILITAS OLAHRAGA LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1504, '93121', 'KLUB SEPAK BOLA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1505, '93122', 'KLUB GOLF', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1506, '93123', 'KLUB RENANG', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1507, '93124', 'KLUB TENIS LAPANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1508, '93125', 'KLUB TINJU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1509, '93126', 'KLUB BELA DIRI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1510, '93127', 'KLUB KEBUGARAN/FITNESS DAN BINARAGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1511, '93128', 'KLUB BOLING', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1512, '93129', 'KLUB OLAHRAGA LAINNYA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1513, '93191', 'PENYELENGGARAAN KEGIATAN OLAHRAGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1514, '93192', 'AKTIVITAS JURI DAN WASIT PROFESIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1515, '93193', 'AKTIVITAS PERBURUAN DI KAWASAN BURU', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1516, '93194', 'BADAN REGULASI DAN LIGA OLAHRAGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1517, '93195', 'AKTIVITAS OLAHRAGA TRADISIONAL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1518, '93196', 'PENGELOLAAN FASILITAS PEMANCINGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1519, '93197', 'AKTIVITAS OLAHARAGAWAN/ATLET INDEPENDEN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1520, '93199', 'AKTIVITAS LAINNYA YANG BERKAITAN DENGAN OLAHRAGA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1521, '93210', 'AKTIVITAS TAMAN BERTEMA DAN TAMAN HIBURAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1522, '93291', 'AKTIVITAS LANTAI DANSA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1523, '93292', 'PENGELOLAAN FASILITAS KARAOKE', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1524, '93293', 'PENGELOLAAN ARENA PERMAINAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1525, '93294', 'WISATA GUA, PEMANDIAN, DAN PETUALANGAN ALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1526, '93295', 'WISATA PANTAI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1527, '93296', 'WISATA AGRO', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1528, '93297', 'WISATA TIRTA Kelompok ini mencakup', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1529, '93299', 'AKTIVITAS HIBURAN DAN REKREASI LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1530, '94110', 'AKTIVITAS ORGANISASI BISNIS DAN PENGUSAHA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1531, '94121', 'AKTIVITAS ORGANISASI ILMU PENGETAHUAN SOSIAL DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1532, '94122', 'AKTIVITAS ORGANISASI ILMU PENGETAHUAN ALAM', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1533, '94200', 'AKTIVITAS ORGANISASI BURUH', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1534, '94910', 'AKTIVITAS ORGANISASI KEAGAMAAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1535, '94920', 'AKTIVITAS ORGANISASI POLITIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1536, '94990', 'AKTIVITAS ORGANISASI KEANGGOTAAN LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1537, '95101', 'REPARASI DAN PEMELIHARAAN KOMPUTER DAN PERALATAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1538, '95102', 'REPARASI DAN PEMELIHARAAN PERALATAN KOMUNIKASI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1539, '95210', 'REPARASI DAN PEMELIHARAAN ALAT - ALAT ELEKTRONIK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1540, '95220', 'REPARASI DAN PEMELIHARAAN PERALATAN RUMAH TANGGA DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1541, '95230', 'REPARASI DAN PEMELIHARAAN ALAS KAKI DAN BARANG DARI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1542, '95240', 'REPARASI DAN PEMELIHARAAN FURNITUR DAN PERLENGKAPAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1543, '95291', 'AKTIVITAS VERMAK PAKAIAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1544, '95299', 'REPARASI DAN PEMELIHARAAN BARANG KEPERLUAN PRIBADI DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1545, '95311', 'REPARASI MOBIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1546, '95312', 'PENCUCIAN DAN SALON MOBIL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1547, '95320', 'REPARASI DAN PERAWATAN SEPEDA MOTOR', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1548, '95400', 'JASA INTERMEDIASI REPARASI DAN PERAWATAN KOMPUTER,', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1549, '96100', 'AKTIVITAS PENCUCIAN DAN PEMBERSIHAN PRODUK TEKSTIL DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1550, '96210', 'AKTIVITAS PENATAAN DAN PANGKAS RAMBUT Kelompok', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1551, '96220', 'AKTIVITAS PERAWATAN KECANTIKAN DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1552, '96230', 'AKTIVITAS SANTE PAR AQUA (SPA) HARIAN, SAUNA, DAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1553, '96300', 'AKTIVITAS PEMAKAMAN DAN KEGIATAN TERKAIT', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1554, '96400', 'AKTIVITAS JASA INTERMEDIASI UNTUK JASA PERORANGAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1555, '96900', 'AKTIVITAS JASA PERORANGAN LAINNYA YTDL', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1556, '97000', 'AKTIVITAS RUMAH TANGGA SEBAGAI PEMBERI KERJA BAGI', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1557, '98100', 'AKTIVITAS PRODUKSI BARANG OLEH RUMAH TANGGA UNTUK', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1558, '98200', 'AKTIVITAS PRODUKSI BERAGAM JASA OLEH RUMAH TANGGA', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1559, '99000', 'AKTIVITAS BADAN INTERNASIONAL DAN BADAN', 'KBLI 2020', '2026-07-24 15:41:25', '2026-07-24 15:41:25'),
(1561, '10710', 'INDUSTRI PRODUK ROTI DAN KUE', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1562, '10793', 'INDUSTRI MAKANAN DARI KEDELAI DAN KACANG-KACANGAN (SAMBEL PECEL)', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1563, '10794', 'INDUSTRI KERUPIK, KERIPIK, PEYEK DAN SEJENISNYA', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1564, '10613', 'INDUSTRI TEPUNG DARI PORANG', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1565, '11051', 'PRODUKSI AIR MINUM DALAM KEMASAN (AMDK)', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1566, '13134', 'INDUSTRI BATIK TULIS DAN CAP TRADISIONAL', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1567, '14120', 'PENJAHITAN DAN PEMBUATAN PAKAIAN SESUAI PESANAN (KONVEKSI)', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1568, '25920', 'JASA INDUSTRI UNTUK BERBAGAI PENGERJAAN KHUSUS LOGAM DAN BARANG DARI LOGAM', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1569, '28193', 'INDUSTRI MESIN PENDINGIN & PERALATAN TEKNIK', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1570, '30200', 'INDUSTRI LOKOMOTIF DAN GERBONG KERETA SERTA SUKU CADANGNYA', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1571, '33141', 'REPARASI MOTOR LISTRIK, GENERATOR DAN TRANSFORMATOR', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1572, '62019', 'AKTIVITAS PEMROGRAMAN KOMPUTER & TEKNOLOGI INFORMASI', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1573, '62090', 'AKTIVITAS TEKNOLOGI INFORMASI DAN JASA KOMPUTER LAINNYA', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1574, '21022', 'INDUSTRI PRODUK OBAT TRADISIONAL DAN HERBAL UNTUK MANUSIA', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1575, '11090', 'INDUSTRI MINUMAN LAINNYA & JAMU BOTOLAN', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1576, '18111', 'PERCETAKAN UMUM DAN KEMASAN KERTAS', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1577, '16292', 'INDUSTRI KERAJINAN BARANG DARI KAYU, BAMBU, GONI DAN ANYAMAN', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1578, '10750', 'INDUSTRI MAKANAN DAN MASAKAN OLAHAN SIAP SAJI', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1579, '20292', 'INDUSTRI BAHAN PELEDAK DAN KEMBANG API', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26'),
(1580, '14111', 'INDUSTRI PAKAIAN JADI (KONFEKSI) DARI TEKSTIL', 'KBLI 2025', '2026-07-30 03:39:26', '2026-07-30 03:39:26');

-- --------------------------------------------------------

--
-- Table structure for table `konsultasi`
--

CREATE TABLE `konsultasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_ikm` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `sumber` varchar(50) NOT NULL DEFAULT 'Umum',
  `jenis_usaha` varchar(255) NOT NULL,
  `keluhan` text NOT NULL,
  `jawaban` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Belum Dijawab',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `konsultasi`
--

INSERT INTO `konsultasi` (`id`, `nama_ikm`, `email`, `nik`, `sumber`, `jenis_usaha`, `keluhan`, `jawaban`, `status`, `created_at`, `updated_at`) VALUES
(1, 'bagfas.ikmjuara@gmail.com', 'bagfas.ikmjuara@gmail.com', NULL, 'Umum', 'Kritik & Saran', 'Bagus', 'Baik Terima kasih', 'Sudah Dijawab', '2026-07-24 02:02:01', '2026-07-24 02:05:36'),
(2, 'CInta Sejati Makmur', 'bagfas.ikmjuara@gmail.com', NULL, 'Umum', 'Strategi Pemasaran Digital', 'Bagaimana cara agar pemasaran lebih optimal', 'sama sama ka', 'Sudah Dijawab', '2026-07-24 16:12:10', '2026-07-24 16:27:45'),
(3, 'Test IKM', 'test@example.com', '1234567890123456', 'IKM Juara', 'Pendampingan Manajemen', 'Ini keluhan', 'ok', 'Sudah Dijawab', '2026-07-24 16:48:49', '2026-07-24 16:52:45'),
(4, 'NASI KOTAK', 'lilikwahyuningsih105@gmail.com', '3573010000000105', 'IKM Juara', 'Pendampingan Manajemen', 'Selamat pagi, saya ingin mendaftarkan usaha keripik tempe saya untuk mengikuti program pembinaan tahun ini. Bagaimana prosedur pendaftarannya?', '\"Selamat pagi, Bapak/Ibu. Untuk pendaftaran pelatihan, sekarang sudah terintegrasi secara digital. Bapak/Ibu bisa langsung mendaftar melalui portal web IKM JUARA. Cukup buat akun, lengkapi profil usaha termasuk melampirkan Nomor Induk Berusaha (NIB), lalu pilih menu \'Jadwal Pelatihan\' untuk mendaftar di kelas yang tersedia.', 'Belum Dijawab', '2026-07-24 16:51:45', '2026-07-24 16:56:30'),
(5, 'GUDEG, AYAM BAKAR', 'harrykusumahendriyanto104@gmail.com', '3573010000000104', 'IKM Juara', 'Pendampingan Manajemen', 'Selamat Pagi', 'untuk itu diwajibkan membawa ktp dan etiket merek ke kantor', 'Selesai', '2026-07-28 04:21:14', '2026-07-28 04:59:14'),
(6, 'Bengkel Las Jaya', '08123456789', '3573336890980650', 'IKM Juara', 'Pendampingan Manajemen Usaha', 'Selamat malam, mohon informasi pendampingan sertifikasi halal', 'iya', 'Sudah Dijawab', '2026-07-29 16:00:56', '2026-07-29 16:04:03'),
(7, 'Konveksi Baju Ceria', '81234567894@ikmjuara.com', '3573275259659190', 'IKM Juara', 'Pendampingan Manajemen Usaha', 'Selamat malam', 'Jl. bolodewo no 8 ka', 'Selesai', '2026-07-29 16:02:59', '2026-07-29 16:06:05'),
(8, 'buidaaditya@gmail.com', 'buidaaditya@gmail.com', NULL, 'Umum', 'Kritik & Saran', 'test', 'iya', 'Sudah Dijawab', '2026-07-30 08:15:28', '2026-07-30 08:15:44'),
(10, 'buidaaditya@gmail.com', 'buidaaditya@gmail.com', NULL, 'Umum', 'Kritik & Saran', 'saya ingin tanya soal pengurusan merek? bagaimana ya?', 'bisa datang ke kantor untuk lebih lanjut', 'Selesai', '2026-07-30 15:46:44', '2026-07-30 16:00:56'),
(11, 'yanuara16@gmail.com', 'yanuara16@gmail.com', NULL, 'Umum', 'Kritik & Saran', 'cara daftar pelatihan bagaimana?', NULL, 'Selesai', '2026-07-30 15:50:12', '2026-07-30 16:01:02'),
(12, 'yanuara16@gmail.com', 'yanuara16@gmail.com', NULL, 'Umum', 'Kritik & Saran', 'bagaimana cara saya bisa ikut pelatihan', NULL, 'Selesai', '2026-07-30 15:54:35', '2026-07-30 16:01:09'),
(13, 'buidaaditya@gmail.com', 'buidaaditya@gmail.com', NULL, 'Umum', 'Kritik & Saran', 'dimana alamat disnakerkukm kota madiun?', NULL, 'Selesai', '2026-07-30 16:00:11', '2026-07-30 16:01:20');

-- --------------------------------------------------------

--
-- Table structure for table `konsultasi_pesan`
--

CREATE TABLE `konsultasi_pesan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `konsultasi_id` bigint(20) UNSIGNED NOT NULL,
  `sender` enum('admin','user') NOT NULL,
  `pesan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `konsultasi_pesan`
--

INSERT INTO `konsultasi_pesan` (`id`, `konsultasi_id`, `sender`, `pesan`, `created_at`, `updated_at`) VALUES
(1, 2, 'admin', 'baik bisa melalui website dna juga sosmed ya', '2026-07-24 16:24:18', '2026-07-24 16:24:18'),
(2, 2, 'user', 'sosmed apa saja ka yang mudah digunakan', '2026-07-24 16:24:53', '2026-07-24 16:24:53'),
(3, 2, 'admin', 'seperti halnya instagram, facebook, dan Tik tok sangat mudah digunakan', '2026-07-24 16:25:58', '2026-07-24 16:25:58'),
(4, 2, 'admin', 'dan perlu dipelajari terkait AI ya ka', '2026-07-24 16:26:18', '2026-07-24 16:26:18'),
(5, 2, 'user', 'baik ka. terima kasih sarannya', '2026-07-24 16:26:54', '2026-07-24 16:26:54'),
(6, 2, 'admin', 'sama sama ka', '2026-07-24 16:27:45', '2026-07-24 16:27:45'),
(7, 3, 'user', 'Ini balasan saya', '2026-07-24 16:48:59', '2026-07-24 16:48:59'),
(8, 4, 'admin', '\"Selamat pagi, Bapak/Ibu. Untuk pendaftaran pelatihan, sekarang sudah terintegrasi secara digital. Bapak/Ibu bisa langsung mendaftar melalui portal web IKM JUARA. Cukup buat akun, lengkapi profil usaha termasuk melampirkan Nomor Induk Berusaha (NIB), lalu pilih menu \'Jadwal Pelatihan\' untuk mendaftar di kelas yang tersedia.', '2026-07-24 16:52:22', '2026-07-24 16:52:22'),
(9, 3, 'admin', 'ok', '2026-07-24 16:52:45', '2026-07-24 16:52:45'),
(10, 4, 'user', 'baik', '2026-07-24 16:56:30', '2026-07-24 16:56:30'),
(11, 5, 'admin', 'Selamat pagi juga', '2026-07-28 04:26:52', '2026-07-28 04:26:52'),
(12, 5, 'admin', 'ada yang bisa dibantu?', '2026-07-28 04:30:49', '2026-07-28 04:30:49'),
(13, 5, 'user', 'bagaimana cara untuk memperoleh surat rekomendasi merek ?', '2026-07-28 04:31:27', '2026-07-28 04:31:27'),
(14, 5, 'admin', 'untuk itu diwajibkan membawa ktp dan etiket merek ke kantor', '2026-07-28 04:32:06', '2026-07-28 04:32:06'),
(15, 5, 'admin', 'Sesi konsultasi ini telah diakhiri oleh Admin Dinas.', '2026-07-28 04:59:14', '2026-07-28 04:59:14'),
(16, 7, 'admin', 'Selamat malam juga', '2026-07-29 16:03:45', '2026-07-29 16:03:45'),
(17, 6, 'admin', 'iya', '2026-07-29 16:04:03', '2026-07-29 16:04:03'),
(18, 7, 'user', 'dimana letak disnakerkukm kota madiun', '2026-07-29 16:05:02', '2026-07-29 16:05:02'),
(19, 7, 'admin', 'Jl. bolodewo no 8 ka', '2026-07-29 16:05:29', '2026-07-29 16:05:29'),
(20, 7, 'admin', 'Sesi konsultasi ini telah diakhiri oleh Admin Dinas.', '2026-07-29 16:06:05', '2026-07-29 16:06:05'),
(21, 8, 'admin', 'iya', '2026-07-30 08:15:44', '2026-07-30 08:15:44'),
(22, 10, 'admin', 'bisa datang ke kantor untuk lebih lanjut', '2026-07-30 16:00:50', '2026-07-30 16:00:50'),
(23, 10, 'admin', 'Sesi konsultasi ini telah diakhiri oleh Admin Dinas.', '2026-07-30 16:00:56', '2026-07-30 16:00:56'),
(24, 11, 'admin', 'Sesi konsultasi ini telah diakhiri oleh Admin Dinas.', '2026-07-30 16:01:02', '2026-07-30 16:01:02'),
(25, 12, 'admin', 'Sesi konsultasi ini telah diakhiri oleh Admin Dinas.', '2026-07-30 16:01:09', '2026-07-30 16:01:09'),
(26, 13, 'admin', 'Sesi konsultasi ini telah diakhiri oleh Admin Dinas.', '2026-07-30 16:01:20', '2026-07-30 16:01:20');

-- --------------------------------------------------------

--
-- Table structure for table `list_kegiatan`
--

CREATE TABLE `list_kegiatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kegiatan` varchar(255) DEFAULT NULL,
  `sub_pelaksana` varchar(255) DEFAULT NULL,
  `tgl_mulai` timestamp NULL DEFAULT NULL,
  `tgl_selesai` timestamp NULL DEFAULT NULL,
  `tempat_kegiatan` varchar(255) DEFAULT NULL,
  `kuota_peserta` int(11) DEFAULT 0,
  `deskripsi_kegiatan` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `list_kegiatan`
--

INSERT INTO `list_kegiatan` (`id`, `nama_kegiatan`, `sub_pelaksana`, `tgl_mulai`, `tgl_selesai`, `tempat_kegiatan`, `kuota_peserta`, `deskripsi_kegiatan`, `is_active`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pelatihan Merek HKI', 'Peran Serta Masyarakat', NULL, NULL, 'Kantor Dinas Tenaga Kerja, KUKM', 25, 'Pelatihan merek HKI meningkatkan pemahaman perlindungan hukum, branding, strategi bisnis, serta mendorong pelaku usaha mendaftarkan merek secara resmi dan berkelanjutan', 0, 'aktif', NULL, NULL),
(2, 'Pelatihan Sistem Informasi Industri Nasional (SIINas)', 'Pengelolaan Data Industri', '2026-03-30 17:00:00', '2026-03-24 17:00:00', 'Kantor Dinas Tenaga Kerja, KUKM', 20, 'Pelatihan SIINas meningkatkan kemampuan pelaporan industri, validasi data, kepatuhan regulasi, serta mendukung integrasi sistem informasi industri nasional secara efektif berkelanjutan', 0, 'aktif', NULL, NULL),
(3, 'Pelatihan Digital Marketing untuk IKM', 'Sumber Daya Industri', NULL, NULL, 'Resto Ayam Goreng Pemuda', 20, 'Meningkatkan kemampuan pemasaran online melalui media sosial, marketplace, dan strategi konten untuk memperluas jangkauan pasar.', 0, 'aktif', NULL, NULL),
(4, 'Pelatihan Standarisasi Produk dan Sertifikasi Halal', 'Prasarana Industri', NULL, NULL, 'Resto Buli Buli Kota Madiun - Jl. Soetomo 68, Kartoharjo, Kota Madiun', 5, 'Membekali pelaku usaha dengan pengetahuan standar produk dan proses pengajuan sertifikasi halal.', 0, 'aktif', NULL, NULL),
(5, 'Pelatihan Produksi Efisien dan Manajemen Operasional', 'Peran Serta Masyarakat', NULL, NULL, 'Gedung Diklat - Jl. Duku No 9, Kejuron, Kota Madiun', 15, 'Membantu pelaku usaha meningkatkan efisiensi produksi dan pengelolaan operasional untuk menekan biaya.', 0, 'aktif', NULL, NULL),
(7, 'Pelatihan Halal Self Declare', 'Peran Serta Masyarakat', '2026-08-10 17:00:00', '2026-08-12 17:00:00', 'Ayostart Coworking Space', 20, 'Untuk Pendaftaran Halal SelfDeclare bagi pelaku usaha roti', 0, 'aktif', NULL, NULL),
(8, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', '3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat', NULL, NULL, 'Ayostart Coworkingspace - Jl. Cokroaminoto No. 88, Kota Madiun', 20, 'Program 2-in-1 ini mengintegrasikan pelatihan produk olahan dengan fasilitas sertifikasi halal secara gratis dan tanpa dipungut biaya. \r\n\r\nPeserta yang lolos seleksi akan dihubungi langsung oleh panitia serta diumumkan melalui media sosial resmi dinas.', 0, 'aktif', NULL, NULL),
(9, 'Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare', '3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyaraka', NULL, NULL, 'Ayostart Coworkingspace - Jl. Cokroaminoto No. 88, Kota Madiun', 20, 'Program 2-in-1 ini mengintegrasikan pelatihan produk olahan dengan fasilitas sertifikasi halal secara gratis dan tanpa dipungut biaya.\r\n\r\nPeserta yang lolos seleksi akan dihubungi langsung oleh panitia serta diumumkan melalui media sosial resmi dinas.', 1, 'aktif', NULL, NULL),
(10, 'Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare', '3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat', NULL, NULL, 'Ayostart Coworkingspace - Jl. Cokroaminoto No. 88, Kota Madiun', 20, 'Program 2-in-1 ini mengintegrasikan pelatihan produk olahan dengan fasilitas sertifikasi halal secara gratis dan tanpa dipungut biaya.\r\n\r\nPeserta yang lolos seleksi akan dihubungi langsung oleh panitia serta diumumkan melalui media sosial resmi dinas.', 1, 'aktif', NULL, NULL),
(11, 'Pelatihan Olahan Sambal - Fasilitasi Sertifikasi Halal Self Declare', '3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat', NULL, NULL, 'Ayostart Coworkingspace - Jl. Cokroaminoto No. 88, Kota Madiun', 20, 'Program 2-in-1 ini mengintegrasikan pelatihan produk olahan dengan fasilitas sertifikasi halal secara gratis dan tanpa dipungut biaya.\r\n\r\nPeserta yang lolos seleksi akan dihubungi langsung oleh panitia serta diumumkan melalui media sosial resmi dinas.', 1, 'aktif', NULL, NULL),
(12, 'Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare', '3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat', NULL, NULL, 'Ayostart Coworkingspace - Jl. Cokroaminoto No. 88, Kota Madiun', 20, 'Program 2-in-1 ini mengintegrasikan pelatihan produk olahan dengan fasilitas sertifikasi halal secara gratis dan tanpa dipungut biaya.\r\n\r\nPeserta yang lolos seleksi akan dihubungi langsung oleh panitia serta diumumkan melalui media sosial resmi dinas.', 1, 'aktif', NULL, NULL),
(13, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', '3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat', NULL, NULL, 'Kantor Dinas Tenaga Kerja, KUKM - Jl. Bolodewo No. 8, Kartoharjo, Kota Madiun', 15, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut oleh DISNAKER KUKM Kota Madiun! Pelatihan ini dirancang khusus untuk Anda yang ingin mengembangkan kompetensi dan usaha kopi. Anda akan belajar strategi bisnis, teknik seduh profesional, latte art, hingga standarisasi kualitas kopi dengan praktik langsung bersama ahlinya.', 0, 'aktif', NULL, NULL),
(14, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', '3.31.02.2.01.0005 - Koordinasi, Sinkronisasi, dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat', NULL, NULL, 'Kantor Dinas Tenaga Kerja, KUKM - Jl. Bolodewo No. 8, Kartoharjo, Kota Madiun', 30, 'Program dari DISNAKER KUKM Kota Madiun ini diselenggarakan khusus bagi para pengrajin batik di Kota Madiun. Melalui pelatihan ini, mari kita tingkatkan keterampilan, inovasi desain, dan daya saing produk batik lokal, sekaligus melestarikan warisan budaya bangsa.', 0, 'aktif', NULL, NULL);

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_03_19_051204_create_konsultasi_table', 1),
(5, '2026_03_20_014513_create_pelaku_usahas_table', 1),
(6, '2026_03_20_022949_update_pelaku_usaha_table', 1),
(7, '2026_03_20_040405_add_investasi_to_pelaku_usaha_table', 1),
(8, '2026_03_22_065232_add_indexes_to_pelaku_usaha', 1),
(9, '2026_03_22_093832_add_foto_ktp_to_pelaku_usaha', 1),
(10, '2026_03_22_103002_create_registrasi_pelatihans_table', 1),
(11, '2026_03_23_191715_create_list_kegiatan_table', 1),
(12, '2026_03_23_191835_add_soft_deletes_to_registrasi_pelatihan', 1),
(13, '2026_03_29_094648_add_status_to_list_kegiatan_table', 2),
(14, '2026_03_29_105034_add_active_status_to_publikasi_table', 3),
(15, '2026_03_30_215111_add_role_to_users_table', 4),
(16, '2026_03_30_215112_add_admin_columns_to_pelaku_usaha_table', 4),
(17, '2026_03_30_215113_add_site_stats_to_statistik_kecamatan_table', 5),
(18, '2026_03_30_215114_add_legalities_and_status_to_pelaku_usaha_table', 6),
(19, '2026_07_24_085746_add_reply_fields_to_konsultasi_table', 7),
(20, '2026_07_24_091816_add_visitor_and_social_fields_to_statistik_kecamatan', 8),
(21, '2026_07_24_092842_add_contact_fields_to_statistik_kecamatan', 9),
(22, '2026_07_24_120620_create_usulan_perubahan_table', 10),
(23, '2026_07_24_122027_add_missing_fields_to_usulan_perubahan_table', 11),
(24, '2026_07_24_220143_make_legacy_fields_nullable_in_pelaku_usaha_table', 12),
(25, '2026_07_24_221504_add_tipe_usulan_to_usulan_perubahan_table', 13),
(26, '2026_07_24_224035_create_kbli_table', 14),
(27, '2026_07_24_232001_create_konsultasi_pesan_table', 15),
(28, '2026_07_24_234241_add_nik_and_sumber_to_konsultasi_table', 16),
(29, '2026_07_27_215756_alter_role_column_in_users_table', 17),
(30, '2026_07_27_221404_create_peta_sebaran_table', 18),
(31, '2026_07_27_224602_upgrade_peta_sebaran_table_fields', 19),
(32, '2026_07_27_225408_add_tingkat_risiko_and_clean_kategori_in_peta_sebaran', 20),
(33, '2026_07_28_073851_normalize_kelurahan_names_in_peta_sebaran', 21),
(34, '2026_07_28_134000_add_kbli_investasi_tenaga_kerja_to_peta_sebaran', 22),
(35, '2026_07_29_183000_add_legalitas_fields_to_peta_sebaran', 23),
(36, '2026_07_29_184000_add_link_gdrive_to_peta_sebaran', 24),
(37, '2026_07_29_185000_add_individual_gdrive_links_to_peta_sebaran', 25),
(38, '2026_07_29_191000_add_tgl_berakhir_hki_to_peta_sebaran', 26),
(39, '2026_07_29_201000_add_is_legalitas_tracked_to_peta_sebaran', 27),
(40, '2026_07_29_204500_create_tna_digitals_table', 28),
(41, '2026_07_29_230000_create_kategori_konsultasis_table', 29),
(42, '2026_07_29_234500_create_tna_pertanyaans_table', 30),
(43, '2026_07_30_110000_create_siinas_industries_table', 31),
(44, '2026_07_30_120000_add_versi_to_kbli_table', 32),
(45, '2026_07_30_130000_drop_unique_kbli_kode', 33),
(46, '2026_07_30_120000_add_tkdn_fields_to_peta_sebaran_table', 34),
(47, '2026_07_30_233000_create_permohonan_hki_merek_table', 35),
(48, '2026_03_18_000000_create_publikasi_table', 36),
(49, '2026_03_18_000001_create_statistik_kecamatan_table', 36),
(50, '2026_09_15_230000_create_form_app_tables', 37);

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
-- Table structure for table `pelaku_usaha`
--

CREATE TABLE `pelaku_usaha` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nib` varchar(255) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `skala_usaha` varchar(255) DEFAULT NULL,
  `jenis_perusahaan` varchar(255) DEFAULT NULL,
  `nama_perusahaan` varchar(255) DEFAULT NULL,
  `nama_proyek` varchar(255) DEFAULT NULL,
  `nama_pemilik` varchar(255) DEFAULT NULL,
  `alamat_usaha` longtext DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kbli` varchar(255) DEFAULT NULL,
  `uraian_kbli` longtext DEFAULT NULL,
  `tingkat_risiko` varchar(255) DEFAULT NULL,
  `investasi` varchar(255) DEFAULT NULL,
  `tenaga_kerja` int(11) DEFAULT 0,
  `no_telp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tgl_terbit` varchar(255) DEFAULT NULL,
  `nama_usaha` varchar(255) DEFAULT NULL,
  `pemilik` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `sertifikat_halal` varchar(255) DEFAULT NULL,
  `bpom` varchar(255) DEFAULT NULL,
  `cppob` varchar(255) DEFAULT NULL,
  `sni` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelaku_usaha`
--

INSERT INTO `pelaku_usaha` (`id`, `nib`, `nik`, `skala_usaha`, `jenis_perusahaan`, `nama_perusahaan`, `nama_proyek`, `nama_pemilik`, `alamat_usaha`, `kecamatan`, `kbli`, `uraian_kbli`, `tingkat_risiko`, `investasi`, `tenaga_kerja`, `no_telp`, `email`, `tgl_terbit`, `nama_usaha`, `pemilik`, `alamat`, `kelurahan`, `latitude`, `longitude`, `kategori`, `created_at`, `updated_at`, `status`, `sertifikat_halal`, `bpom`, `cppob`, `sni`) VALUES
(1, '9120000000001', '3573010000000001', 'Mikro', 'Perseorangan', 'Lapak UMKM Kartini', 'Lapak UMKM Kartini', 'Budi', 'Jl. Kartini 55, Madiun', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 3, '081234567001', 'budi1@gmail.com', '2026-01-02', 'Lapak UMKM Kartini', 'Budi', 'Jl. Kartini 55, Madiun', 'Madiun Lor', NULL, NULL, 'Kuliner', '2026-03-31 03:00:33', NULL, 'Aktif', 'ID35110000000001', NULL, 'CP3500001', NULL),
(4, '9120000000004', '3573010000000004', 'Mikro', 'Perseorangan', 'Kentang - Krezznya Madiun', 'Kentang - Krezznya Madiun', 'Yanuar', 'Jl. Oro Oro Ombo No 8, Kota Madiun, Jawa Timur, Jawa, 63117, Indonesia', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 3, '081234567004', 'yanuar4@gmail.com', '2026-01-05', 'Kentang - Krezznya Madiun', 'Yanuar', 'Jl. Oro Oro Ombo No 8, Kota Madiun, Jawa Timur, Jawa, 63117, Indonesia', 'Oro Oro Ombo', NULL, NULL, 'Kuliner', '2026-04-01 15:02:34', '2026-07-23 06:40:57', 'Aktif', 'ID35110000000004', NULL, 'CP3500004', NULL),
(8, '9120000000008', '3573010000000008', 'Mikro', 'Perseorangan', 'RUJAK BUAH MARIYADI', 'RUJAK BUAH MARIYADI', 'Yanuar', 'Jl. Rimba Darma 87', 'Kartoharjo', '14111', 'Industri Pakaian Jadi Konveksi (Fashion)', 'Rendah', '20000000', 4, '081234567008', 'yanuar8@gmail.com', '2026-01-09', 'RUJAK BUAH MARIYADI', 'Yanuar', 'Jl. Rimba Darma 87', 'Oro Oro Ombo', NULL, NULL, 'Fashion', '2026-04-01 15:26:32', '2026-07-23 06:40:43', 'Aktif', 'ID35110000000008', NULL, NULL, 'SNI-01-0008'),
(9, '9120000000009', '3573010000000009', 'Mikro', 'Perseorangan', 'Rido Aluna', 'Rido Aluna', 'AR LUNIA', 'Jl. Panglima Sudirman NO 66', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 2, '081234567009', 'arlunia9@gmail.com', '2026-01-10', 'Rido Aluna', 'AR LUNIA', 'Jl. Panglima Sudirman NO 66', 'Kejuron', NULL, NULL, 'Kuliner', '2026-04-02 14:05:06', NULL, 'Aktif', 'ID35110000000009', 'TR2600009', NULL, NULL),
(10, '9120000000010', '3573010000000010', 'Mikro', 'Perseorangan', 'Pisang Coklat', 'Pisang Coklat', 'Agus Budiono', 'Kejuron, Kota Madiun, Jawa Timur, Jawa, 63139, Indonesia', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 3, '081234567010', 'agusbudiono10@gmail.com', '2026-01-11', 'Pisang Coklat', 'Agus Budiono', 'Kejuron, Kota Madiun, Jawa Timur, Jawa, 63139, Indonesia', 'Kejuron', NULL, NULL, 'Kuliner', '2026-04-03 02:46:42', NULL, 'Aktif', 'ID35110000000010', NULL, 'CP3500010', NULL),
(12, '9120000000012', '3573010000000012', 'Mikro', 'Perseorangan', 'Rido Aluna', 'Rido Aluna', 'AR LUNIA', 'Jl. Panglima Sudirman NO 66', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 2, '081234567012', 'arlunia12@gmail.com', '2026-01-13', 'Rido Aluna', 'AR LUNIA', 'Jl. Panglima Sudirman NO 66', 'Kejuron', NULL, NULL, 'Kuliner', '2026-04-03 03:57:42', NULL, 'Aktif', NULL, 'TR2600012', NULL, NULL),
(13, '9120000000013', '3573010000000013', 'Mikro', 'Perseorangan', 'WAFFLE KERING', 'WAFFLE KERING', 'HARI FITRI', 'JL. COKROAMINOTO GG. RINGIN 8', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 3, '081234567013', 'harifitri13@gmail.com', '2026-01-14', 'WAFFLE KERING', 'HARI FITRI', 'JL. COKROAMINOTO GG. RINGIN 8', 'KEJURON', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000013', NULL, 'CP3500013', NULL),
(14, '9120000000014', '3573010000000014', 'Mikro', 'Perseorangan', 'ANEKA KUE BASAH | \nANEKA KUE KERING | \nCATERING | \nRISOL FROZEN', 'ANEKA KUE BASAH | \nANEKA KUE KERING | \nCATERING | \nRISOL FROZEN', 'SITI NURUL RAHAYUWATI', 'PERUM GRIYA KITA BLOK B-8', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 4, '081234567014', 'sitinurulrahayuwati14@gmail.com', '2026-01-15', 'ANEKA KUE BASAH | \nANEKA KUE KERING | \nCATERING | \nRISOL FROZEN', 'SITI NURUL RAHAYUWATI', 'PERUM GRIYA KITA BLOK B-8', 'WINONGO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000014', NULL, NULL, 'SNI-01-0014'),
(15, '9120000000015', '3573010000000015', 'Mikro', 'Perseorangan', 'UNTIR-UNTIR | \nKUPING GAJAH | \nCUMI-CUMI  | \nSTIK KEJU | \nSTIK SELEDRI | \nKERING KENTANG', 'UNTIR-UNTIR | \nKUPING GAJAH | \nCUMI-CUMI  | \nSTIK KEJU | \nSTIK SELEDRI | \nKERING KENTANG', 'SUMARNI', 'JL. SRIGADING 12 A', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 2, '081234567015', 'sumarni15@gmail.com', '2026-01-16', 'UNTIR-UNTIR | \nKUPING GAJAH | \nCUMI-CUMI  | \nSTIK KEJU | \nSTIK SELEDRI | \nKERING KENTANG', 'SUMARNI', 'JL. SRIGADING 12 A', 'ORO-ORO OMBO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000015', 'TR2600015', NULL, NULL),
(16, '9120000000016', '3573010000000016', 'Mikro', 'Perseorangan', 'KEBAB', 'KEBAB', 'ARRI WIDYA DAMAYANTI', 'JALAN ANEKA SARI NO 10 REJOMULYO MADIUN', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 3, '081234567016', 'arriwidyadamayanti16@gmail.com', '2026-01-17', 'KEBAB', 'ARRI WIDYA DAMAYANTI', 'JALAN ANEKA SARI NO 10 REJOMULYO MADIUN', 'REJOMULYO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000016', NULL, 'CP3500016', NULL),
(17, '9120000000017', '3573010000000017', 'Mikro', 'Perseorangan', 'MAKARONI', 'MAKARONI', 'DIMAS SETIAWAN', 'JL PANGLIMA SUDIRMAN GG JAMBE 14', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 4, '081234567017', 'dimassetiawan17@gmail.com', '2026-01-18', 'MAKARONI', 'DIMAS SETIAWAN', 'JL PANGLIMA SUDIRMAN GG JAMBE 14', 'KEJURON', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000017', NULL, NULL, 'SNI-01-0017'),
(18, '9120000000018', '3573010000000018', 'Mikro', 'Perseorangan', 'CAMILAN DAN MAKANAN', 'CAMILAN DAN MAKANAN', 'RETNO INDARTI', 'JL CATUR JAYA SIDOMULYO 1 NO.35', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 2, '081234567018', 'retnoindarti18@gmail.com', '2026-01-19', 'CAMILAN DAN MAKANAN', 'RETNO INDARTI', 'JL CATUR JAYA SIDOMULYO 1 NO.35', 'KANIGORO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, 'TR2600018', NULL, NULL),
(19, '9120000000019', '3573010000000019', 'Mikro', 'Perseorangan', 'SULAM BORDIR | \nSAMBEL PECEL', 'SULAM BORDIR | \nSAMBEL PECEL', 'ASTUTIK', 'JL. KIAGENG PEMANAHAN L.269/19 RT.029 RW.007 KEL. KANIGORO', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 3, '081234567019', 'astutik19@gmail.com', '2026-01-20', 'SULAM BORDIR | \nSAMBEL PECEL', 'ASTUTIK', 'JL. KIAGENG PEMANAHAN L.269/19 RT.029 RW.007 KEL. KANIGORO', 'KANIGORO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000019', NULL, 'CP3500019', NULL),
(20, '9120000000020', '3573010000000020', 'Mikro', 'Perseorangan', 'SAMBEL PECEL', 'SAMBEL PECEL', 'RATNAWATI AL HASAN', 'JLN TAMAN ASRI NO 4 MADIUN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 4, '081234567020', 'ratnawatialhasan20@gmail.com', '2026-01-21', 'SAMBEL PECEL', 'RATNAWATI AL HASAN', 'JLN TAMAN ASRI NO 4 MADIUN', 'BANJAREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000020', NULL, NULL, 'SNI-01-0020'),
(21, '9120000000021', '3573010000000021', 'Mikro', 'Perseorangan', 'MINUMAN JAMU | \nKOPI REMPAH', 'MINUMAN JAMU | \nKOPI REMPAH', 'SUMARNI', 'JL. SRI GADIS GG. MELATI NO. 8 F', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 2, '081234567021', 'sumarni21@gmail.com', '2026-01-22', 'MINUMAN JAMU | \nKOPI REMPAH', 'SUMARNI', 'JL. SRI GADIS GG. MELATI NO. 8 F', 'KANIGORO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000021', 'TR2600021', NULL, NULL),
(22, '9120000000022', '3573010000000022', 'Mikro', 'Perseorangan', 'SAMBEL PECEL', 'SAMBEL PECEL', 'HERUWATI', 'JLN BOROBUDUR NO 4-G', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 3, '081234567022', 'heruwati22@gmail.com', '2026-01-23', 'SAMBEL PECEL', 'HERUWATI', 'JLN BOROBUDUR NO 4-G', 'MADIUN LOR', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000022', NULL, 'CP3500022', NULL),
(23, '9120000000023', '3573010000000023', 'Mikro', 'Perseorangan', 'SAMBEL PECEL', 'SAMBEL PECEL', 'SULISTIYOWATI', 'JL. GULUN NO 5-B RT 48 RW 15', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 4, '081234567023', 'sulistiyowati23@gmail.com', '2026-01-24', 'SAMBEL PECEL', 'SULISTIYOWATI', 'JL. GULUN NO 5-B RT 48 RW 15', 'KEJURON', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000023', NULL, NULL, 'SNI-01-0023'),
(24, '9120000000024', '3573010000000024', 'Mikro', 'Perseorangan', 'SAMBEL PECEL', 'SAMBEL PECEL', 'ULUL SUFIANA', 'JL ROKAN NO. 1 RT 48/ RW 15 TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 2, '081234567024', 'ululsufiana24@gmail.com', '2026-01-25', 'SAMBEL PECEL', 'ULUL SUFIANA', 'JL ROKAN NO. 1 RT 48/ RW 15 TAMAN', 'TAMAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, 'TR2600024', NULL, NULL),
(25, '9120000000025', '3573010000000025', 'Mikro', 'Perseorangan', 'KEBAB', 'KEBAB', 'WAHYU WISMA PRIYANI', 'JL GEGONO MANIS G3/11 MANISREJO', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 3, '081234567025', 'wahyuwismapriyani25@gmail.com', '2026-01-26', 'KEBAB', 'WAHYU WISMA PRIYANI', 'JL GEGONO MANIS G3/11 MANISREJO', 'MANISREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000025', NULL, 'CP3500025', NULL),
(26, '9120000000026', '3573010000000026', 'Mikro', 'Perseorangan', 'SAMBEL PECEL | \nKERING KENTANG', 'SAMBEL PECEL | \nKERING KENTANG', 'NOVITA DWI HARINI', 'JALAN WUNI NO.12, KEJURON,', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 4, '081234567026', 'novitadwiharini26@gmail.com', '2026-01-27', 'SAMBEL PECEL | \nKERING KENTANG', 'NOVITA DWI HARINI', 'JALAN WUNI NO.12, KEJURON,', 'KEJURON', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000026', NULL, NULL, 'SNI-01-0026'),
(27, '9120000000027', '3573010000000027', 'Mikro', 'Perseorangan', 'SAMBEL PECEL', 'SAMBEL PECEL', 'CHAIRATUN LIES SETYORINI', 'H.O.S.COKROAMINOTO,GG: RINGIN NO 3 , MADIUN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 2, '081234567027', 'chairatunliessetyorini27@gmail.com', '2026-01-28', 'SAMBEL PECEL', 'CHAIRATUN LIES SETYORINI', 'H.O.S.COKROAMINOTO,GG: RINGIN NO 3 , MADIUN', 'KEJURON', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000027', 'TR2600027', NULL, NULL),
(28, '9120000000028', '3573010000000028', 'Mikro', 'Perseorangan', 'BENGKEL LAS', 'BENGKEL LAS', 'RUSMANTO', 'JL.MIJIL SULASTRI,', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 3, '081234567028', 'rusmanto28@gmail.com', '2026-01-29', 'BENGKEL LAS', 'RUSMANTO', 'JL.MIJIL SULASTRI,', 'SOGATEN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000028', NULL, 'CP3500028', NULL),
(29, '9120000000029', '3573010000000029', 'Mikro', 'Perseorangan', 'KERAJINAN SULAM', 'KERAJINAN SULAM', 'R.R.YOENI ASTOETI', 'JL. BANDA NO.18', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 4, '081234567029', 'r.r.yoeniastoeti29@gmail.com', '2026-01-30', 'KERAJINAN SULAM', 'R.R.YOENI ASTOETI', 'JL. BANDA NO.18', 'MADIUN LOR', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000029', NULL, NULL, 'SNI-01-0029'),
(30, '9120000000030', '3573010000000030', 'Mikro', 'Perseorangan', 'NASI BOX', 'NASI BOX', 'MARTATIK', 'Jl. Setinggil No. 19 RT. 30 RW. 01', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 2, '081234567030', 'martatik30@gmail.com', '2026-01-31', 'NASI BOX', 'MARTATIK', 'Jl. Setinggil No. 19 RT. 30 RW. 01', 'DEMANGAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, 'TR2600030', NULL, NULL),
(31, '9120000000031', '3573010000000031', 'Mikro', 'Perseorangan', 'BRONDONG, JIPANG', 'BRONDONG, JIPANG', 'TUTIK RAHAYU', 'JL MANGGA XIII/3-B', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 3, '081234567031', 'tutikrahayu31@gmail.com', '2026-02-01', 'BRONDONG, JIPANG', 'TUTIK RAHAYU', 'JL MANGGA XIII/3-B', 'KEJURON', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000031', NULL, 'CP3500031', NULL),
(32, '9120000000032', '3573010000000032', 'Mikro', 'Perseorangan', 'PENTOL CORAH', 'PENTOL CORAH', 'APRILIA', 'JALAN DELIMA NO9 BLK MADIUN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 4, '081234567032', 'aprilia32@gmail.com', '2026-02-02', 'PENTOL CORAH', 'APRILIA', 'JALAN DELIMA NO9 BLK MADIUN', 'KEJURON', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000032', NULL, NULL, 'SNI-01-0032'),
(33, '9120000000033', '3573010000000033', 'Mikro', 'Perseorangan', 'NUGGET AYAM', 'NUGGET AYAM', 'BARIAH SUCIATI', 'Jl. Taman Raya, No. 3, RT 027, TW 007, Kelurahan Banjareho, Kecamatan Taman, Kota Madiun, Jawa Timur 63137', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 2, '081234567033', 'bariahsuciati33@gmail.com', '2026-02-03', 'NUGGET AYAM', 'BARIAH SUCIATI', 'Jl. Taman Raya, No. 3, RT 027, TW 007, Kelurahan Banjareho, Kecamatan Taman, Kota Madiun, Jawa Timur 63137', 'BANJAREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000033', 'TR2600033', NULL, NULL),
(34, '9120000000034', '3573010000000034', 'Mikro', 'Perseorangan', 'BENGKEL MOTOR', 'BENGKEL MOTOR', 'PUDJI HARTONO', 'JALAN KAPTEN TENDEAN NO.50, BANJAREJO', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 3, '081234567034', 'pudjihartono34@gmail.com', '2026-02-04', 'BENGKEL MOTOR', 'PUDJI HARTONO', 'JALAN KAPTEN TENDEAN NO.50, BANJAREJO', 'BANJAREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000034', NULL, 'CP3500034', NULL),
(35, '9120000000035', '3573010000000035', 'Mikro', 'Perseorangan', 'AKSESORIS', 'AKSESORIS', 'HESTY IRAWATI', 'JL. TAWANG BHAKTI NO. 24 A RT. 021 RW. 006', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 4, '081234567035', 'hestyirawati35@gmail.com', '2026-02-05', 'AKSESORIS', 'HESTY IRAWATI', 'JL. TAWANG BHAKTI NO. 24 A RT. 021 RW. 006', 'TAWANGREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000035', NULL, NULL, 'SNI-01-0035'),
(36, '9120000000036', '3573010000000036', 'Mikro', 'Perseorangan', 'SAMBEL', 'SAMBEL', 'ENGGAR LESTARI RAHAYU', '\"JL. TAWANGBARU RT 09, RW 02, KEL TAWANGREJO, KEC KARTOHARJO\"', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 2, '081234567036', 'enggarlestarirahayu36@gmail.com', '2026-02-06', 'SAMBEL', 'ENGGAR LESTARI RAHAYU', '\"JL. TAWANGBARU RT 09, RW 02, KEL TAWANGREJO, KEC KARTOHARJO\"', 'TAWANGREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, 'TR2600036', NULL, NULL),
(37, '9120000000037', '3573010000000037', 'Mikro', 'Perseorangan', 'ROTI BAKERY', 'ROTI BAKERY', 'ENGGAR LESTARI RAHAYU', 'JL. TAWANGBARU RT 09, RW 02, KEL TAWANGREJO, KEC KARTOHARJO', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 3, '081234567037', 'enggarlestarirahayu37@gmail.com', '2026-02-07', 'ROTI BAKERY', 'ENGGAR LESTARI RAHAYU', 'JL. TAWANGBARU RT 09, RW 02, KEL TAWANGREJO, KEC KARTOHARJO', 'TAWANGREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000037', NULL, 'CP3500037', NULL),
(38, '9120000000038', '3573010000000038', 'Mikro', 'Perseorangan', 'NASI BOX', 'NASI BOX', 'MULYANI', 'JALAN SERAYU BARAT NO 52B, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 4, '081234567038', 'mulyani38@gmail.com', '2026-02-08', 'NASI BOX', 'MULYANI', 'JALAN SERAYU BARAT NO 52B, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000038', NULL, NULL, 'SNI-01-0038'),
(39, '9120000000039', '3573010000000039', 'Mikro', 'Perseorangan', 'SAMBEL PECEL', 'SAMBEL PECEL', 'SUTIKNYO', 'JL TIRTO MANIS 1 NO 13 MADIUN, DESA/KELURAHAN MANISREJO, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 2, '081234567039', 'sutiknyo39@gmail.com', '2026-02-09', 'SAMBEL PECEL', 'SUTIKNYO', 'JL TIRTO MANIS 1 NO 13 MADIUN, DESA/KELURAHAN MANISREJO, KEC. TAMAN', 'MANISREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000039', 'TR2600039', NULL, NULL),
(40, '9120000000040', '3573010000000040', 'Mikro', 'Perseorangan', 'SUSU SARI KEDELAI', 'SUSU SARI KEDELAI', 'FADLITSANIYA ABSHAR NURRAMADAN', 'JL.NGEBONG RT10/RW03, BANJAREJO, TAMAN, MADIUN, DESA/KELURAHAN BANJAREJO, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 3, '081234567040', 'fadlitsaniyaabsharnurramadan40@gmail.com', '2026-02-10', 'SUSU SARI KEDELAI', 'FADLITSANIYA ABSHAR NURRAMADAN', 'JL.NGEBONG RT10/RW03, BANJAREJO, TAMAN, MADIUN, DESA/KELURAHAN BANJAREJO, KEC. TAMAN', 'BANJAREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000040', NULL, 'CP3500040', NULL),
(41, '9120000000041', '3573010000000041', 'Mikro', 'Perseorangan', 'KERIPIK DAN KEBAB', 'KERIPIK DAN KEBAB', 'HUDA UMAR ALKAFF', 'JL.PARIANOM B4 NO.33, DESA/KELURAHAN SOGATEN, KEC. MANGUHARJO, KOTA MADIUN,', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 4, '081234567041', 'hudaumaralkaff41@gmail.com', '2026-02-11', 'KERIPIK DAN KEBAB', 'HUDA UMAR ALKAFF', 'JL.PARIANOM B4 NO.33, DESA/KELURAHAN SOGATEN, KEC. MANGUHARJO, KOTA MADIUN,', 'SOGATEN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000041', NULL, NULL, 'SNI-01-0041'),
(42, '9120000000042', '3573010000000042', 'Mikro', 'Perseorangan', 'KUE TRADISIONAL', 'KUE TRADISIONAL', 'BETTY ARININGSIH', 'PERUM GRAND RESPATI A.27, DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 2, '081234567042', 'bettyariningsih42@gmail.com', '2026-02-12', 'KUE TRADISIONAL', 'BETTY ARININGSIH', 'PERUM GRAND RESPATI A.27, DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN', 'JOSENAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, 'TR2600042', NULL, NULL),
(43, '9120000000043', '3573010000000043', 'Mikro', 'Perseorangan', 'SAMBEL, ABON', 'SAMBEL, ABON', 'SRI SUHARTINI', 'JL. PRAJURITAN GG. TANGKIS I/6, DESA/KELURAHAN MADIUN LOR, KEC. MANGUHARJO, KOTA MADIUN', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 3, '081234567043', 'srisuhartini43@gmail.com', '2026-02-13', 'SAMBEL, ABON', 'SRI SUHARTINI', 'JL. PRAJURITAN GG. TANGKIS I/6, DESA/KELURAHAN MADIUN LOR, KEC. MANGUHARJO, KOTA MADIUN', 'MADIUN LOR', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000043', NULL, 'CP3500043', NULL),
(44, '9120000000044', '3573010000000044', 'Mikro', 'Perseorangan', 'WADER CRISPY', 'WADER CRISPY', 'SUMINAH', 'JALAN KAMPAR 46, DESA/KELURAHAN TAMAN, KEC. TAMAN,', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 4, '081234567044', 'suminah44@gmail.com', '2026-02-14', 'WADER CRISPY', 'SUMINAH', 'JALAN KAMPAR 46, DESA/KELURAHAN TAMAN, KEC. TAMAN,', 'TAMAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000044', NULL, NULL, 'SNI-01-0044'),
(45, '9120000000045', '3573010000000045', 'Mikro', 'Perseorangan', 'GORDEN, KELAMBU', 'GORDEN, KELAMBU', 'IIS NINGTYAS', 'JL. URIP SUMOHARJO NO. 04, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 2, '081234567045', 'iisningtyas45@gmail.com', '2026-02-15', 'GORDEN, KELAMBU', 'IIS NINGTYAS', 'JL. URIP SUMOHARJO NO. 04, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO', 'MANGUHARJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000045', 'TR2600045', NULL, NULL),
(46, '9120000000046', '3573010000000046', 'Mikro', 'Perseorangan', 'SAMBEL PECEL', 'SAMBEL PECEL', 'AMIRUDIN', 'JL. MURIA NO. 21/11, RT.002, RW.001, DESA/KELURAHAN PANGONGANGAN, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 3, '081234567046', 'amirudin46@gmail.com', '2026-02-16', 'SAMBEL PECEL', 'AMIRUDIN', 'JL. MURIA NO. 21/11, RT.002, RW.001, DESA/KELURAHAN PANGONGANGAN, KEC. MANGUHARJO', 'PANGONGANGAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000046', NULL, NULL, NULL),
(47, '9120000000047', '3573010000000047', 'Mikro', 'Perseorangan', 'KERIPIK DAN SAMBAL PECEL', 'KERIPIK DAN SAMBAL PECEL', 'HARI TRI RAHAYU', 'PERUM WIDODO KENCONO INDAH 1 BLOK C-6 RT 56 RW 18, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 4, '081234567047', 'haritrirahayu47@gmail.com', '2026-02-17', 'KERIPIK DAN SAMBAL PECEL', 'HARI TRI RAHAYU', 'PERUM WIDODO KENCONO INDAH 1 BLOK C-6 RT 56 RW 18, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000047', NULL, NULL, NULL),
(48, '9120000000048', '3573010000000048', 'Mikro', 'Perseorangan', 'BENGKEL LAS', 'BENGKEL LAS', 'MURDOKO', 'JL. SALAK NO. 32, DESA/KELURAHAN MOJOREJO, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 2, '081234567048', 'murdoko48@gmail.com', '2026-02-18', 'BENGKEL LAS', 'MURDOKO', 'JL. SALAK NO. 32, DESA/KELURAHAN MOJOREJO, KEC. TAMAN', 'MOJOREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(49, '9120000000049', '3573010000000049', 'Mikro', 'Perseorangan', 'SAMBEL PECEL', 'SAMBEL PECEL', 'SUTINI', 'PERUM GRIYA SALAK BLOK B-51 RT 048 RW 016. PANDEAN. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 3, '081234567049', 'sutini49@gmail.com', '2026-02-19', 'SAMBEL PECEL', 'SUTINI', 'PERUM GRIYA SALAK BLOK B-51 RT 048 RW 016. PANDEAN. TAMAN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000049', NULL, NULL, NULL),
(50, '9120000000050', '3573010000000050', 'Mikro', 'Perseorangan', 'BAJU BORDIR', 'BAJU BORDIR', 'HENY MOERDANINGSIH', 'JL. DWI JAYA 3 NO. 9 MADIUN, DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO, KOTA MADIUN', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 4, '081234567050', 'henymoerdaningsih50@gmail.com', '2026-02-20', 'BAJU BORDIR', 'HENY MOERDANINGSIH', 'JL. DWI JAYA 3 NO. 9 MADIUN, DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO, KOTA MADIUN', 'KLEGEN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000050', NULL, NULL, NULL),
(51, '9120000000051', '3573010000000051', 'Mikro', 'Perseorangan', 'KUE', 'KUE', 'DWI WAHYUNINGSIH', 'JL. MANDIRI PERUM RED TULIP BLOK A NO. 4, DESA/KELURAHAN DEMANGAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 2, '081234567051', 'dwiwahyuningsih51@gmail.com', '2026-02-21', 'KUE', 'DWI WAHYUNINGSIH', 'JL. MANDIRI PERUM RED TULIP BLOK A NO. 4, DESA/KELURAHAN DEMANGAN, KEC. TAMAN', 'DEMANGAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000051', NULL, NULL, NULL),
(52, '9120000000052', '3573010000000052', 'Mikro', 'Perseorangan', 'DAGING ASAP, SOSIS, BAKSO, DAGING BERBUMBU', 'DAGING ASAP, SOSIS, BAKSO, DAGING BERBUMBU', 'DARMAWAN MULYADI', 'Jl. Salak III No. 8, Taman, Kec. Taman, Kota Madiun, Jawa Timur 63131', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 3, '081234567052', 'darmawanmulyadi52@gmail.com', '2026-02-22', 'DAGING ASAP, SOSIS, BAKSO, DAGING BERBUMBU', 'DARMAWAN MULYADI', 'Jl. Salak III No. 8, Taman, Kec. Taman, Kota Madiun, Jawa Timur 63131', 'TAMAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000052', NULL, NULL, NULL),
(53, '9120000000053', '3573010000000053', 'Mikro', 'Perseorangan', 'OLAHAN SAMBEL', 'OLAHAN SAMBEL', 'BAGUS SURYA NUGRAHA', 'JALAN PUSPA INDAH BLOK Y2 PERUM KARTOHARJO INDAH, DESA/KELURAHAN KELUN, KEC. KARTOHARJO, KOTA MADIUN', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 4, '081234567053', 'bagussuryanugraha53@gmail.com', '2026-02-23', 'OLAHAN SAMBEL', 'BAGUS SURYA NUGRAHA', 'JALAN PUSPA INDAH BLOK Y2 PERUM KARTOHARJO INDAH, DESA/KELURAHAN KELUN, KEC. KARTOHARJO, KOTA MADIUN', 'KELUN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000053', NULL, NULL, NULL),
(54, '9120000000054', '3573010000000054', 'Mikro', 'Perseorangan', 'AYAM UNGKEP FROZEN', 'AYAM UNGKEP FROZEN', 'NUR KHIKMAH', 'JL. SERAYU INDAH B-8 NO.32, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 2, '081234567054', 'nurkhikmah54@gmail.com', '2026-02-24', 'AYAM UNGKEP FROZEN', 'NUR KHIKMAH', 'JL. SERAYU INDAH B-8 NO.32, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(55, '9120000000055', '3573010000000055', 'Mikro', 'Perseorangan', 'OLAHAN FROZEN', 'OLAHAN FROZEN', 'IMAM SUGIRI', 'JL TILAMUPIH 24 , DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 3, '081234567055', 'imamsugiri55@gmail.com', '2026-02-25', 'OLAHAN FROZEN', 'IMAM SUGIRI', 'JL TILAMUPIH 24 , DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN', 'JOSENAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000055', NULL, NULL, NULL),
(56, '9120000000056', '3573010000000056', 'Mikro', 'Perseorangan', 'GITAR', 'GITAR', 'WAHYU WIJOYONO', 'JL. FLORES NO. 48, DESA/KELURAHAN KARTOHARJO, KEC. KARTOHARJO,', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 4, '081234567056', 'wahyuwijoyono56@gmail.com', '2026-02-26', 'GITAR', 'WAHYU WIJOYONO', 'JL. FLORES NO. 48, DESA/KELURAHAN KARTOHARJO, KEC. KARTOHARJO,', 'KARTOHARJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000056', NULL, NULL, NULL),
(57, '9120000000057', '3573010000000057', 'Mikro', 'Perseorangan', 'SEPATU TEKNIK', 'SEPATU TEKNIK', 'MUHAMMAD YUSUF', 'JL. MARGA BAKTI NO 9, DESA/KELURAHAN MOJOREJO, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 2, '081234567057', 'muhammadyusuf57@gmail.com', '2026-02-27', 'SEPATU TEKNIK', 'MUHAMMAD YUSUF', 'JL. MARGA BAKTI NO 9, DESA/KELURAHAN MOJOREJO, KEC. TAMAN', 'MOJOREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000057', NULL, NULL, NULL),
(58, '9120000000058', '3573010000000058', 'Mikro', 'Perseorangan', 'DIMSUM', 'DIMSUM', 'AMIRUL MA`RUF', 'JALAN SUKOYONO PERUM ADDA PURIARTHA D-12A, DESA/KELURAHAN JOSENAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 3, '081234567058', 'amirulma`ruf58@gmail.com', '2026-02-28', 'DIMSUM', 'AMIRUL MA`RUF', 'JALAN SUKOYONO PERUM ADDA PURIARTHA D-12A, DESA/KELURAHAN JOSENAN, KEC. TAMAN', 'JOSENAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000058', NULL, NULL, NULL),
(59, '9120000000059', '3573010000000059', 'Mikro', 'Perseorangan', 'UNGKEP JEROAN', 'UNGKEP JEROAN', 'ERFANA HENDRAWATI', 'JL. AIRLANGGA II NO.8 RT 07 RW 02 WINONGO, MANGUHARJO, MADIUN', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 4, '081234567059', 'erfanahendrawati59@gmail.com', '2026-03-01', 'UNGKEP JEROAN', 'ERFANA HENDRAWATI', 'JL. AIRLANGGA II NO.8 RT 07 RW 02 WINONGO, MANGUHARJO, MADIUN', 'WINONGO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000059', NULL, NULL, NULL),
(60, '9120000000060', '3573010000000060', 'Mikro', 'Perseorangan', 'SAMBEL PECEL', 'SAMBEL PECEL', 'LELLY MIRYANTI', 'TAMAN ASRI I/A-15 BANJAREJO TAMAN MADIUN, DESA/KELURAHAN BANJAREJO, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 2, '081234567060', 'lellymiryanti60@gmail.com', '2026-03-02', 'SAMBEL PECEL', 'LELLY MIRYANTI', 'TAMAN ASRI I/A-15 BANJAREJO TAMAN MADIUN, DESA/KELURAHAN BANJAREJO, KEC. TAMAN', 'BANJAREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(61, '9120000000061', '3573010000000061', 'Mikro', 'Perseorangan', 'TAHU WALIK', 'TAHU WALIK', 'SITI ROSYIDAH', 'JL. TEMUGIRING NO. 22 BLK , DESA/KELURAHAN NGEGONG, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 3, '081234567061', 'sitirosyidah61@gmail.com', '2026-03-03', 'TAHU WALIK', 'SITI ROSYIDAH', 'JL. TEMUGIRING NO. 22 BLK , DESA/KELURAHAN NGEGONG, KEC. MANGUHARJO', 'NGEGONG', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000061', NULL, NULL, NULL),
(62, '9120000000062', '3573010000000062', 'Mikro', 'Perseorangan', 'SAMBAL KACANG', 'SAMBAL KACANG', 'INDAH RATNAWATI', 'JL. DADALI NO.11 RT.16 RW.005 , DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 4, '081234567062', 'indahratnawati62@gmail.com', '2026-03-04', 'SAMBAL KACANG', 'INDAH RATNAWATI', 'JL. DADALI NO.11 RT.16 RW.005 , DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO', 'NAMBANGAN KIDUL', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000062', NULL, NULL, NULL),
(63, '9120000000063', '3573010000000063', 'Mikro', 'Perseorangan', 'OLAHAN JAMUR TIRAM', 'OLAHAN JAMUR TIRAM', 'VILGA VICHARIO', 'JL.MANYAR NO 32, DESA/KELURAHAN NAMBANGAN LOR, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 2, '081234567063', 'vilgavichario63@gmail.com', '2026-03-05', 'OLAHAN JAMUR TIRAM', 'VILGA VICHARIO', 'JL.MANYAR NO 32, DESA/KELURAHAN NAMBANGAN LOR, KEC. MANGUHARJO', 'NAMBANGAN LOR', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000063', NULL, NULL, NULL),
(64, '9120000000064', '3573010000000064', 'Mikro', 'Perseorangan', 'JAMU SERAI', 'JAMU SERAI', 'DYAH RATNA WULANDARI', 'JL. PANORAMA RAYA NO. 12B, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 3, '081234567064', 'dyahratnawulandari64@gmail.com', '2026-03-06', 'JAMU SERAI', 'DYAH RATNA WULANDARI', 'JL. PANORAMA RAYA NO. 12B, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000064', NULL, NULL, NULL),
(65, '9120000000065', '3573010000000065', 'Mikro', 'Perseorangan', 'OMELET', 'OMELET', 'NELLY NOVI DAMAYANTI', 'JL SERAYU BARAT GG V NO 49, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 4, '081234567065', 'nellynovidamayanti65@gmail.com', '2026-03-07', 'OMELET', 'NELLY NOVI DAMAYANTI', 'JL SERAYU BARAT GG V NO 49, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000065', NULL, NULL, NULL),
(66, '9120000000066', '3573010000000066', 'Mikro', 'Perseorangan', 'MAKANAN OLAHAN', 'MAKANAN OLAHAN', 'IRAWATI', 'JL.JENGGOLO MANIK 12, DESA/KELURAHAN KELUN, KEC. KARTOHARJO', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 2, '081234567066', 'irawati66@gmail.com', '2026-03-08', 'MAKANAN OLAHAN', 'IRAWATI', 'JL.JENGGOLO MANIK 12, DESA/KELURAHAN KELUN, KEC. KARTOHARJO', 'KELUN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(67, '9120000000067', '3573010000000067', 'Mikro', 'Perseorangan', 'TELOR ASIN', 'TELOR ASIN', 'HARTATI', 'JL WIRARAJA NO 3, DESA/KELURAHAN WINONGO, KEC. MANGUHARJO, KOTA MADIUN', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 3, '081234567067', 'hartati67@gmail.com', '2026-03-09', 'TELOR ASIN', 'HARTATI', 'JL WIRARAJA NO 3, DESA/KELURAHAN WINONGO, KEC. MANGUHARJO, KOTA MADIUN', 'WINONGO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000067', NULL, NULL, NULL),
(68, '9120000000068', '3573010000000068', 'Mikro', 'Perseorangan', 'MAKANAN OLAHAN', 'MAKANAN OLAHAN', 'IKE VISQHIE MARSHA HAYU', 'JL. ELANG II NO 6, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO, KOTA MADIUN', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 4, '081234567068', 'ikevisqhiemarshahayu68@gmail.com', '2026-03-10', 'MAKANAN OLAHAN', 'IKE VISQHIE MARSHA HAYU', 'JL. ELANG II NO 6, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO, KOTA MADIUN', 'NAMBANGAN LOR', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000068', NULL, NULL, NULL),
(69, '9120000000069', '3573010000000069', 'Mikro', 'Perseorangan', 'TEMPE MENDOAN', 'TEMPE MENDOAN', 'SRI WAHYUNI', 'JL.NANGKA NO 6, DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 2, '081234567069', 'sriwahyuni69@gmail.com', '2026-03-11', 'TEMPE MENDOAN', 'SRI WAHYUNI', 'JL.NANGKA NO 6, DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN', 'TAMAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000069', NULL, NULL, NULL),
(70, '9120000000070', '3573010000000070', 'Mikro', 'Perseorangan', 'KEBAB', 'KEBAB', 'ANNY DWI POERWAHJOENINGTYAS', 'JL. IMAM BONJOL GG. JATI TRUBUS NO. 7 , DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 3, '081234567070', 'annydwipoerwahjoeningtyas70@gmail.com', '2026-03-12', 'KEBAB', 'ANNY DWI POERWAHJOENINGTYAS', 'JL. IMAM BONJOL GG. JATI TRUBUS NO. 7 , DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO', 'KLEGEN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000070', NULL, NULL, NULL),
(71, '9120000000071', '3573010000000071', 'Mikro', 'Perseorangan', 'KAIN BATIK', 'KAIN BATIK', 'VERONIKA DWI SULISTIYANI', 'JL. CANDI BOKO NO. 09 KEL. PATIHAN, KEC. MANGUHARJO, KOTA MADIUN', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 4, '081234567071', 'veronikadwisulistiyani71@gmail.com', '2026-03-13', 'KAIN BATIK', 'VERONIKA DWI SULISTIYANI', 'JL. CANDI BOKO NO. 09 KEL. PATIHAN, KEC. MANGUHARJO, KOTA MADIUN', 'PATIHAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000071', NULL, NULL, NULL),
(72, '9120000000072', '3573010000000072', 'Mikro', 'Perseorangan', 'BAJU', 'BAJU', 'PT BERDIKARI BERKAT SEMESTA', 'JALAN MERAK PERUM PURI PERMATA HIJAU BLOK A NOMOR 27, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 2, '081234567072', 'ptberdikariberkatsemesta72@gmail.com', '2026-03-14', 'BAJU', 'PT BERDIKARI BERKAT SEMESTA', 'JALAN MERAK PERUM PURI PERMATA HIJAU BLOK A NOMOR 27, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO', 'NAMBANGAN KIDUL', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(73, '9120000000073', '3573010000000073', 'Mikro', 'Perseorangan', 'REPARASI', 'REPARASI', 'CV ADIWARNA KARSA EMPAT TUJUH', 'JL. PILANG DARMA NO.11, DESA/KELURAHAN PILANGBANGO, KEC. KARTOHARJO', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 3, '081234567073', 'cvadiwarnakarsaempattujuh73@gmail.com', '2026-03-15', 'REPARASI', 'CV ADIWARNA KARSA EMPAT TUJUH', 'JL. PILANG DARMA NO.11, DESA/KELURAHAN PILANGBANGO, KEC. KARTOHARJO', 'PILANGBANGO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000073', NULL, NULL, NULL),
(74, '9120000000074', '3573010000000074', 'Mikro', 'Perseorangan', 'BENGKEL MOBIL', 'BENGKEL MOBIL', 'DONNY KURNIAWAN NOTOWIDJOJO', 'JL. SOEKARNO HATTA 66, DESA/KELURAHAN DEMANGAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 4, '081234567074', 'donnykurniawannotowidjojo74@gmail.com', '2026-03-16', 'BENGKEL MOBIL', 'DONNY KURNIAWAN NOTOWIDJOJO', 'JL. SOEKARNO HATTA 66, DESA/KELURAHAN DEMANGAN, KEC. TAMAN', 'DEMANGAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000074', NULL, NULL, NULL),
(75, '9120000000075', '3573010000000075', 'Mikro', 'Perseorangan', 'BENGKEL MOBIL', 'BENGKEL MOBIL', 'CV. SUKSES KARYA LANGGENG', 'JL. SOEKARNO HATTA NO. 66, DESA/KELURAHAN DEMANGAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 2, '081234567075', 'cv.sukseskaryalanggeng75@gmail.com', '2026-03-17', 'BENGKEL MOBIL', 'CV. SUKSES KARYA LANGGENG', 'JL. SOEKARNO HATTA NO. 66, DESA/KELURAHAN DEMANGAN, KEC. TAMAN', 'DEMANGAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000075', NULL, NULL, NULL),
(76, '9120000000076', '3573010000000076', 'Mikro', 'Perseorangan', 'BENGKEL MOTOR', 'BENGKEL MOTOR', 'PT. CAKRA USAHA NUSANTARA', 'JL. AHMAD YANI 57, DESA/KELURAHAN PANGONGANGAN, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 3, '081234567076', 'pt.cakrausahanusantara76@gmail.com', '2026-03-18', 'BENGKEL MOTOR', 'PT. CAKRA USAHA NUSANTARA', 'JL. AHMAD YANI 57, DESA/KELURAHAN PANGONGANGAN, KEC. MANGUHARJO', 'PANGONGANGAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000076', NULL, NULL, NULL),
(77, '9120000000077', '3573010000000077', 'Mikro', 'Perseorangan', 'BENGKEL MOTOR', 'BENGKEL MOTOR', 'PT. SAHABAT MANDIRI MOTOR', 'JL.H.AGUS SALIM 133/145, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 4, '081234567077', 'pt.sahabatmandirimotor77@gmail.com', '2026-03-19', 'BENGKEL MOTOR', 'PT. SAHABAT MANDIRI MOTOR', 'JL.H.AGUS SALIM 133/145, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000077', NULL, NULL, NULL),
(78, '9120000000078', '3573010000000078', 'Mikro', 'Perseorangan', 'BENGKEL MOBIL', 'BENGKEL MOBIL', 'PT SUN MEGA MOTOR', 'JALAN MAYJEND SUNGKONO NO. 140, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 2, '081234567078', 'ptsunmegamotor78@gmail.com', '2026-03-20', 'BENGKEL MOBIL', 'PT SUN MEGA MOTOR', 'JALAN MAYJEND SUNGKONO NO. 140, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO', 'NAMBANGAN KIDUL', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(79, '9120000000079', '3573010000000079', 'Mikro', 'Perseorangan', 'AKSESORIS', 'AKSESORIS', 'TJATUR AMBARWATI', 'JL. THAMRIN GG MELATI,KLEGEN, KARTOHARJO KOTA MADIUN', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 3, '081234567079', 'tjaturambarwati79@gmail.com', '2026-03-21', 'AKSESORIS', 'TJATUR AMBARWATI', 'JL. THAMRIN GG MELATI,KLEGEN, KARTOHARJO KOTA MADIUN', 'KLEGEN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000079', NULL, NULL, NULL),
(80, '9120000000080', '3573010000000080', 'Mikro', 'Perseorangan', 'ANEKA JAJANAN', 'ANEKA JAJANAN', 'MARTINI SARI UNDARTI', 'JL. TAWANG BHAKTI 15B RT21/RW06 KELURAHAN TAWANGREJO KECAMATAN KARTOHARJO', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 4, '081234567080', 'martinisariundarti80@gmail.com', '2026-03-22', 'ANEKA JAJANAN', 'MARTINI SARI UNDARTI', 'JL. TAWANG BHAKTI 15B RT21/RW06 KELURAHAN TAWANGREJO KECAMATAN KARTOHARJO', 'TAWANGREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000080', NULL, NULL, NULL),
(81, '9120000000081', '3573010000000081', 'Mikro', 'Perseorangan', 'SAMBAL BABY CUMI', 'SAMBAL BABY CUMI', 'SURYA NUR INSANA', 'JL. KOLONEL MARHADI GG. KENARI NO 22, DESA/KELURAHAN NAMBANGAN LOR, KEC. MANGUHARJO, KOTA MADIUN', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 2, '081234567081', 'suryanurinsana81@gmail.com', '2026-03-23', 'SAMBAL BABY CUMI', 'SURYA NUR INSANA', 'JL. KOLONEL MARHADI GG. KENARI NO 22, DESA/KELURAHAN NAMBANGAN LOR, KEC. MANGUHARJO, KOTA MADIUN', 'NAMBANGAN LOR', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000081', NULL, NULL, NULL),
(82, '9120000000082', '3573010000000082', 'Mikro', 'Perseorangan', 'EMAS DAN PERAK', 'EMAS DAN PERAK', 'SUGIANTO', 'JL. MERAK SELATAN 22A RT 07/03, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 3, '081234567082', 'sugianto82@gmail.com', '2026-03-24', 'EMAS DAN PERAK', 'SUGIANTO', 'JL. MERAK SELATAN 22A RT 07/03, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO', 'NAMBANGAN KIDUL', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000082', NULL, NULL, NULL),
(83, '9120000000083', '3573010000000083', 'Mikro', 'Perseorangan', 'BENGKEL MOTOR', 'BENGKEL MOTOR', 'HERU ISDARTO', 'JL. ASAHAN NO.36 D, DESA/KELURAHAN TAMAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 4, '081234567083', 'heruisdarto83@gmail.com', '2026-03-25', 'BENGKEL MOTOR', 'HERU ISDARTO', 'JL. ASAHAN NO.36 D, DESA/KELURAHAN TAMAN, KEC. TAMAN', 'TAMAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000083', NULL, NULL, NULL),
(84, '9120000000084', '3573010000000084', 'Mikro', 'Perseorangan', 'PLASTIK KEMASAN', 'PLASTIK KEMASAN', 'CV KARYA MANUNGGAL JAYA', 'JL. KALIMOSODO 46, DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 2, '081234567084', 'cvkaryamanunggaljaya84@gmail.com', '2026-03-26', 'PLASTIK KEMASAN', 'CV KARYA MANUNGGAL JAYA', 'JL. KALIMOSODO 46, DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN', 'JOSENAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(85, '9120000000085', '3573010000000085', 'Mikro', 'Perseorangan', 'BENGKEL MOBIL', 'BENGKEL MOBIL', 'PT. ASTRA INTERNATIONAL', 'JALAN RINGROAD BARAT, BLOK DUKUH, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 3, '081234567085', 'pt.astrainternational85@gmail.com', '2026-03-27', 'BENGKEL MOBIL', 'PT. ASTRA INTERNATIONAL', 'JALAN RINGROAD BARAT, BLOK DUKUH, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO', 'MANGUHARJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000085', NULL, NULL, NULL),
(86, '9120000000086', '3573010000000086', 'Mikro', 'Perseorangan', 'ANEKA JAJANAN', 'ANEKA JAJANAN', 'MUJIWARDANI FEBRIHEKSARINI', 'JL KY JALAK NO 3 RT 25 RW 08 , DESA/KELURAHAN JOSENAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 4, '081234567086', 'mujiwardanifebriheksarini86@gmail.com', '2026-03-28', 'ANEKA JAJANAN', 'MUJIWARDANI FEBRIHEKSARINI', 'JL KY JALAK NO 3 RT 25 RW 08 , DESA/KELURAHAN JOSENAN, KEC. TAMAN', 'JOSENAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000086', NULL, NULL, NULL),
(87, '9120000000087', '3573010000000087', 'Mikro', 'Perseorangan', 'BEBEK UNGKEP FROZEN', 'BEBEK UNGKEP FROZEN', 'WAHYU FITRI NURCAHYONO', 'Jl. Makam Tentara No. 82, Taman, Kec. Taman, Kota Madiun, Jawa Timur 63131', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 2, '081234567087', 'wahyufitrinurcahyono87@gmail.com', '2026-03-29', 'BEBEK UNGKEP FROZEN', 'WAHYU FITRI NURCAHYONO', 'Jl. Makam Tentara No. 82, Taman, Kec. Taman, Kota Madiun, Jawa Timur 63131', 'TAMAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000087', NULL, NULL, NULL),
(88, '9120000000088', '3573010000000088', 'Mikro', 'Perseorangan', 'BAKSO, PEMPEK', 'BAKSO, PEMPEK', 'KOMARIA LESTARI', 'JL. GEDONG NO. 35, DESA/KELURAHAN BANJAREJO, KEC. TAMAN', 'Taman', '10120', 'PENGOLAHAN DAN PENGAWETAN DAGING DAN PRODUK DAGING', 'Rendah', '20000000', 3, '081234567088', 'komarialestari88@gmail.com', '2026-03-30', 'BAKSO, PEMPEK', 'KOMARIA LESTARI', 'JL. GEDONG NO. 35, DESA/KELURAHAN BANJAREJO, KEC. TAMAN', 'BANJAREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', '2026-07-30 15:19:47', 'Aktif', 'ID35110000000088', NULL, NULL, NULL),
(89, '9120000000089', '3573010000000089', 'Mikro', 'Perseorangan', 'BENGKEL MOTOR', 'BENGKEL MOTOR', 'CV MAJU SUKSES PERKASA', 'JL. URIP SUMOHARJO NO. 33, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 4, '081234567089', 'cvmajusuksesperkasa89@gmail.com', '2026-03-31', 'BENGKEL MOTOR', 'CV MAJU SUKSES PERKASA', 'JL. URIP SUMOHARJO NO. 33, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO', 'MANGUHARJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000089', NULL, NULL, NULL),
(90, '9120000000090', '3573010000000090', 'Mikro', 'Perseorangan', 'MAKARONI DAN POTATO GORENG', 'MAKARONI DAN POTATO GORENG', 'DARSINI', 'JL.KAMPAR GG II NO 30E , DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 2, '081234567090', 'darsini90@gmail.com', '2026-01-01', 'MAKARONI DAN POTATO GORENG', 'DARSINI', 'JL.KAMPAR GG II NO 30E , DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN', 'TAMAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(91, '9120000000091', '3573010000000091', 'Mikro', 'Perseorangan', 'SERUNDENG AYAM', 'SERUNDENG AYAM', 'MARTANTI', 'JL LAMBANG SARI III B-5 NO 32, PERUM SOGATEN, RT27/RW09 MADIUN, DESA/KELURAHAN SOGATEN, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 3, '081234567091', 'martanti91@gmail.com', '2026-01-02', 'SERUNDENG AYAM', 'MARTANTI', 'JL LAMBANG SARI III B-5 NO 32, PERUM SOGATEN, RT27/RW09 MADIUN, DESA/KELURAHAN SOGATEN, KEC. MANGUHARJO', 'SOGATEN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000091', NULL, NULL, NULL),
(92, '9120000000092', '3573010000000092', 'Mikro', 'Perseorangan', 'DENDENG NABATI JANTUNG PISANG', 'DENDENG NABATI JANTUNG PISANG', 'RIMA LOESTANTI', 'JL. TRENGGULI NO.11A, DESA/KELURAHAN ORO-ORO OMBO, KEC. KARTOHARJO', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 4, '081234567092', 'rimaloestanti92@gmail.com', '2026-01-03', 'DENDENG NABATI JANTUNG PISANG', 'RIMA LOESTANTI', 'JL. TRENGGULI NO.11A, DESA/KELURAHAN ORO-ORO OMBO, KEC. KARTOHARJO', 'ORO-ORO OMBO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000092', NULL, NULL, NULL),
(93, '9120000000093', '3573010000000093', 'Mikro', 'Perseorangan', 'BENGKEL MOBIL', 'BENGKEL MOBIL', 'SAPTIYA CANDRA PRATAMA', 'JL. USADA SARI NO. 3, DESA/KELURAHAN REJOMULYO, KEC. KARTOHARJO', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 2, '081234567093', 'saptiyacandrapratama93@gmail.com', '2026-01-04', 'BENGKEL MOBIL', 'SAPTIYA CANDRA PRATAMA', 'JL. USADA SARI NO. 3, DESA/KELURAHAN REJOMULYO, KEC. KARTOHARJO', 'REJOMULYO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000093', NULL, NULL, NULL),
(94, '9120000000094', '3573010000000094', 'Mikro', 'Perseorangan', 'TAHU WALIK', 'TAHU WALIK', 'TIVIK SRI NUGRAHENI', 'JL. GLATIK NO.253, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO', 'Manguharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 3, '081234567094', 'tiviksrinugraheni94@gmail.com', '2026-01-05', 'TAHU WALIK', 'TIVIK SRI NUGRAHENI', 'JL. GLATIK NO.253, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO', 'NAMBANGAN KIDUL', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000094', NULL, NULL, NULL),
(95, '9120000000095', '3573010000000095', 'Mikro', 'Perseorangan', 'OLAHAN KREMESAN AYAM', 'OLAHAN KREMESAN AYAM', 'SITI HAFSIYAH', 'JL. KARTIKA MANIS NO. 20, DESA/KELURAHAN MANISREJO, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 4, '081234567095', 'sitihafsiyah95@gmail.com', '2026-01-06', 'OLAHAN KREMESAN AYAM', 'SITI HAFSIYAH', 'JL. KARTIKA MANIS NO. 20, DESA/KELURAHAN MANISREJO, KEC. TAMAN', 'MANISREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000095', NULL, NULL, NULL),
(96, '9120000000096', '3573010000000096', 'Mikro', 'Perseorangan', 'SPOORING', 'SPOORING', 'JOHAN WIJAYA', 'JL. TRUNOJOYO 117, DESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 2, '081234567096', 'johanwijaya96@gmail.com', '2026-01-07', 'SPOORING', 'JOHAN WIJAYA', 'JL. TRUNOJOYO 117, DESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, NULL, NULL, NULL);
INSERT INTO `pelaku_usaha` (`id`, `nib`, `nik`, `skala_usaha`, `jenis_perusahaan`, `nama_perusahaan`, `nama_proyek`, `nama_pemilik`, `alamat_usaha`, `kecamatan`, `kbli`, `uraian_kbli`, `tingkat_risiko`, `investasi`, `tenaga_kerja`, `no_telp`, `email`, `tgl_terbit`, `nama_usaha`, `pemilik`, `alamat`, `kelurahan`, `latitude`, `longitude`, `kategori`, `created_at`, `updated_at`, `status`, `sertifikat_halal`, `bpom`, `cppob`, `sni`) VALUES
(97, '9120000000097', '3573010000000097', 'Mikro', 'Perseorangan', 'MAKANAN OLAHAN', 'MAKANAN OLAHAN', 'NURUL KHAMIDIYAH', 'PERUM BUMI MAS, DESA/KELURAHAN MANISREJO, KEC. TAMAN, KOTA MADIUN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 3, '081234567097', 'nurulkhamidiyah97@gmail.com', '2026-01-08', 'MAKANAN OLAHAN', 'NURUL KHAMIDIYAH', 'PERUM BUMI MAS, DESA/KELURAHAN MANISREJO, KEC. TAMAN, KOTA MADIUN', 'MANISREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000097', NULL, NULL, NULL),
(98, '9120000000098', '3573010000000098', 'Mikro', 'Perseorangan', 'JASA CAT MOTOR MOBIL', 'JASA CAT MOTOR MOBIL', 'NURUL KHAMIDIYAH', 'JALAN MARGOBAWERO, DESA/KELURAHAN MOJOREJO, KEC. TAMAN, KOTA MADIUN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 4, '081234567098', 'nurulkhamidiyah98@gmail.com', '2026-01-09', 'JASA CAT MOTOR MOBIL', 'NURUL KHAMIDIYAH', 'JALAN MARGOBAWERO, DESA/KELURAHAN MOJOREJO, KEC. TAMAN, KOTA MADIUN', 'MOJOREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000098', NULL, NULL, NULL),
(99, '9120000000099', '3573010000000099', 'Mikro', 'Perseorangan', 'MAKARONI GORENG', 'MAKARONI GORENG', 'IRNA WAHYUNINGSIH', 'JL. CILIWUNG GANG 4 NO.7, DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN', 'Taman', '10794', 'INDUSTRI KERUPIK, KERIPIK, PEYEK DAN SEJENISNYA', 'Rendah', '25000000', 2, '081234567099', 'irnawahyuningsih99@gmail.com', '2026-01-10', 'MAKARONI GORENG', 'IRNA WAHYUNINGSIH', 'JL. CILIWUNG GANG 4 NO.7, DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN', 'TAMAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', '2026-07-30 15:19:25', 'Aktif', 'ID35110000000099', NULL, NULL, NULL),
(100, '9120000000100', '3573010000000100', 'Mikro', 'Perseorangan', 'MEMASANG BAN', 'MEMASANG BAN', 'KRISTIAN EDI WALUYO WIBISONO', 'JL. SLAMET RIYADI NO. 25, DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO, KOTA MADIUN', 'Kartoharjo', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 3, '081234567100', 'kristianediwaluyowibisono100@gmail.com', '2026-01-11', 'MEMASANG BAN', 'KRISTIAN EDI WALUYO WIBISONO', 'JL. SLAMET RIYADI NO. 25, DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO, KOTA MADIUN', 'KLEGEN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000100', NULL, NULL, NULL),
(101, '9120000000101', '3573010000000101', 'Mikro', 'Perseorangan', 'NASI BOX', 'NASI BOX', 'ULFA NURDIANA', 'JL. SIAK 33 B RT. 33 RW. 11, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 4, '081234567101', 'ulfanurdiana101@gmail.com', '2026-01-12', 'NASI BOX', 'ULFA NURDIANA', 'JL. SIAK 33 B RT. 33 RW. 11, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000101', NULL, NULL, NULL),
(102, '9120000000102', '3573010000000102', 'Mikro', 'Perseorangan', 'NASI BOX', 'NASI BOX', 'MARSINI', 'PERUM SERAYU INDAH BLOK B-07, RT. 045, RW.015, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 2, '081234567102', 'marsini102@gmail.com', '2026-01-13', 'NASI BOX', 'MARSINI', 'PERUM SERAYU INDAH BLOK B-07, RT. 045, RW.015, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(103, '9120000000103', '3573010000000103', 'Mikro', 'Perseorangan', 'NASI AYAM LAOS', 'NASI AYAM LAOS', 'SRI WAHYUNI', 'JL. INDRAGIRI NO 32, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 3, '081234567103', 'sriwahyuni103@gmail.com', '2026-01-14', 'NASI AYAM LAOS', 'SRI WAHYUNI', 'JL. INDRAGIRI NO 32, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000103', NULL, NULL, NULL),
(104, '9120000000104', '3573010000000104', 'Mikro', 'Perseorangan', 'GUDEG, AYAM BAKAR', 'GUDEG, AYAM BAKAR', 'HARRY KUSUMA HENDRIYANTO', 'JL. SERAYU TIMUR V NO 4, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '25000000', 4, '081234567104', 'harrykusumahendriyanto104@gmail.com', '2026-01-15', 'GUDEG, AYAM BAKAR', 'HARRY KUSUMA HENDRIYANTO', 'JL. SERAYU TIMUR V NO 4, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000104', NULL, NULL, NULL),
(105, '9120000000105', '3573010000000105', 'Mikro', 'Perseorangan', 'NASI KOTAK', 'NASI KOTAK', 'LILIK WAHYUNINGSIH', 'JL. TUNTANG NO. 19 RT. 41 RW. 14, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '5000000', 2, '081234567105', 'lilikwahyuningsih105@gmail.com', '2026-01-16', 'NASI KOTAK', 'LILIK WAHYUNINGSIH', 'JL. TUNTANG NO. 19 RT. 41 RW. 14, DESA/KELURAHAN PANDEAN, KEC. TAMAN', 'PANDEAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000105', NULL, NULL, NULL),
(106, '9120000000106', '3573010000000106', 'Mikro', 'Perseorangan', 'SERUNDENG', 'SERUNDENG', 'EVA MAYA LAKSMINA DEWI', 'JL. SOEKARNO HATTA 39 , DESA/KELURAHAN DEMANGAN, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '10000000', 3, '081234567106', 'evamayalaksminadewi106@gmail.com', '2026-01-17', 'SERUNDENG', 'EVA MAYA LAKSMINA DEWI', 'JL. SOEKARNO HATTA 39 , DESA/KELURAHAN DEMANGAN, KEC. TAMAN', 'DEMANGAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000106', NULL, NULL, NULL),
(107, '9120000000107', '3573010000000107', 'Mikro', 'Perseorangan', 'REPARASI MOTOR', 'REPARASI MOTOR', 'NOVEN DE GOLFO', 'JL. ANGGORO MANIS NO 4, DESA/KELURAHAN MANISREJO, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '15000000', 4, '081234567107', 'novendegolfo107@gmail.com', '2026-01-18', 'REPARASI MOTOR', 'NOVEN DE GOLFO', 'JL. ANGGORO MANIS NO 4, DESA/KELURAHAN MANISREJO, KEC. TAMAN', 'MANISREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', 'ID35110000000107', NULL, NULL, NULL),
(108, '9120000000108', '3573010000000108', 'Mikro', 'Perseorangan', 'SAMBEL PECEL', 'SAMBEL PECEL', 'UMI SULISTIANY', 'JL. GEGONO MANIS 4A, DESA/KELURAHAN MANISREJO, KEC. TAMAN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '20000000', 2, '081234567108', 'umisulistiany108@gmail.com', '2026-01-19', 'SAMBEL PECEL', 'UMI SULISTIANY', 'JL. GEGONO MANIS 4A, DESA/KELURAHAN MANISREJO, KEC. TAMAN', 'MANISREJO', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(109, '9120000000109', '3573010000000109', 'Kecil', 'Perseorangan', 'KAIN', 'KAIN', 'ELLYSA SANTOSO', 'JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN', 'Taman', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'Rendah', '26000005', 15, '081234567109', 'ellysasantoso01@gmail.com', '2026-01-20', 'KAIN', 'ELLYSA SANTOSO', 'JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN', 'TAMAN', NULL, NULL, 'Kuliner', '2026-04-03 04:09:24', '2026-07-24 14:20:28', 'Aktif', 'ID35110000000109', 'BPOM02', NULL, NULL),
(111, '9120000000667', '3573010000000667', 'Mikro', 'Makanan Minuman', 'CInta Sejati Makmur', 'CInta Sejati Makmur', 'Bu Cinta', 'Jl. Selalu Sayang 55', 'Taman', '11090', 'Industri Minuman Dengan Pengolahan', 'Mikro', '100000000', 88, '085655488220', 'bagfas.ikmjuara@gmail.com', '2026-07-15', 'CInta Sejati Makmur', 'Bu Cinta', 'Jl. Selalu Sayang 55', 'Kartoharjo', NULL, NULL, NULL, '2026-07-24 15:08:24', NULL, 'Aktif', 'ID7723724149294920', 'u2372747', '724274727', 'ID727742'),
(113, '5309033439831', '3573407473554860', 'Kecil', 'Ninin Lia Herlina', 'Ninin Lia Herlina', 'Mebel Kayu', 'Joko Anwar', 'JL Purwosari NO. 55', 'Taman', '10799', 'INDUSTRI PRODUK MAKANAN LAINNYA YTDL', 'Menengah Rendah', '225000000', 2, '089516488224', 'nininliaherlina@gmail.com', NULL, 'Kerajinan Kayu Jati', 'Joko Anwar', 'Jl. Cokroaminoto', 'Kejuron', NULL, NULL, NULL, '2026-07-29 10:36:25', '2026-07-30 15:08:59', 'Aktif', NULL, NULL, NULL, NULL),
(114, '9999999999999', '3577019999999999', 'Mikro', 'Pangan', 'Test Verifikasi Perusahaan', NULL, 'Test Verifikasi Pemilik', 'Jl. Test No 17', 'Taman', NULL, NULL, NULL, '0', 1, '085712345678', NULL, NULL, 'Test Verifikasi Perusahaan', 'Test Verifikasi Pemilik', 'Jl. Test No 17', 'Pandean', NULL, NULL, NULL, '2026-07-31 07:55:18', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(115, '5089747908747', '3573336890980650', 'Kecil', 'Metal dan Mesin', 'Bengkel Las Jaya Madiun', 'Pagar dan Teralis', 'Hendra Gunawan', 'Jl. Thamrin No. 45', 'Kartoharjo', '10795', 'INDUSTRI SARI NABATI DAN KRIMER NABATI', 'Menengah Tinggi', '3300067800', 10, '081234567897', '-', NULL, 'Bengkel Las Jaya Madiun', 'Hendra Gunawan', 'Jl. Thamrin No. 45', 'Klegen', NULL, NULL, NULL, '2026-07-31 08:55:35', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(116, '5089747908746', '3528838888888883', 'Mikro', 'Pangan', 'Nilahi', 'Roti Basah', 'Nilainahitadil', 'Perum Panorama Wilis 84', 'Taman', '10792', 'INDUSTRI KUE BASAH', 'Rendah', '20000000000', 2, '0856365357375', '-', NULL, 'Nilahi', 'Nilainahitadil', 'Perum Panorama Wilis 84', 'Pandean', NULL, NULL, NULL, '2026-07-31 09:00:52', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(117, '1111222233334', '3577111122223333', 'Kecil', 'Sandang', 'IKM Sepatu Keren Madiun', 'Sepatu Kulit Asli', 'Samsul Arifin', 'Jl. Pahlawan No. 12', 'Kartoharjo', '15201', 'Industri Sepatu Olahraga', 'Rendah', '500000000', 5, '081234567800', '-', NULL, 'IKM Sepatu Keren Madiun', 'Samsul Arifin', 'Jl. Pahlawan No. 12', 'Kanigoro', NULL, NULL, NULL, '2026-07-31 09:07:27', NULL, 'Aktif', NULL, NULL, NULL, NULL),
(118, '9999888877776', '3577999988887777', 'Mikro', 'Pangan', 'IKM Sambal Pecel Asli', 'Sambal Pecel Madiun', 'Siti Rohmah', 'Jl. Salak No. 8', 'Taman', '10799', 'Industri Produk Makanan Lainnya', 'Rendah', '15000000', 2, '081234567811', '-', NULL, 'IKM Sambal Pecel Asli', 'Siti Rohmah', 'Jl. Salak No. 8', 'Manisrejo', NULL, NULL, NULL, '2026-07-31 09:07:28', NULL, 'Aktif', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permohonan_hki_merek`
--

CREATE TABLE `permohonan_hki_merek` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nib` varchar(13) NOT NULL,
  `nama_merek` varchar(255) NOT NULL,
  `kelas_merek` varchar(255) NOT NULL,
  `uraian_barang_jasa` text DEFAULT NULL,
  `alamat_ktp` text NOT NULL,
  `alamat_usaha` text NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `file_ktp` varchar(255) DEFAULT NULL,
  `file_nib` varchar(255) DEFAULT NULL,
  `file_etiket_merek` varchar(255) DEFAULT NULL,
  `file_surat_pernyataan` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `catatan_admin` text DEFAULT NULL,
  `link_gdrive_rekom` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permohonan_hki_merek`
--

INSERT INTO `permohonan_hki_merek` (`id`, `nama_lengkap`, `nik`, `nib`, `nama_merek`, `kelas_merek`, `uraian_barang_jasa`, `alamat_ktp`, `alamat_usaha`, `no_hp`, `file_ktp`, `file_nib`, `file_etiket_merek`, `file_surat_pernyataan`, `status`, `catatan_admin`, `link_gdrive_rekom`, `created_at`, `updated_at`) VALUES
(2, 'Yanuar Priambodo', '3577020102650003', '1306250070146', 'Mbok DE', 'Kelas 29 (Makanan Olahan Daging/Buah/Sayur)', NULL, 'Jl. Gulun No 5-B', 'Jl. Gulun No 5-B', '085655480223', '/uploads/hki_merek/1785429223_ktp_6a6b7ce791e2a.png', '/uploads/hki_merek/1785429223_nib_6a6b7ce792942.png', '/uploads/hki_merek/1785429223_etiket_6a6b7ce792ebe.jpeg', '/uploads/hki_merek/1785429223_surat_6a6b7ce793249.jpeg', 'Disetujui', NULL, 'https://drive.google.com/file/d/1wGe1dlYHBxDHs9lLmjYc5PBN8uT_LDiU/view?usp=drive_link', '2026-07-30 16:33:43', '2026-07-30 16:51:20'),
(3, 'Siti Aminah Testing', '3577025501920005', '9120000888999', 'Kue Madiun Juara', 'Kelas 30 (Kopi, Teh, Bumbu, Roti, Sambal, Kue)', NULL, 'Jl. Pandean No. 8, Madiun', 'Jl. Pandean No. 8, Madiun', '085712345678', NULL, NULL, NULL, NULL, 'Disetujui', NULL, 'https://drive.google.com/file/d/1wGe1dlYHBxDHs9lLmjYc5PBN8uT_LDiU/view?usp=drive_link', '2026-07-30 16:47:16', '2026-07-31 00:00:16'),
(6, 'SRI WULANDARI', '3577020605680055', '2504250023077', 'Sintara', '30', 'Sambal Pecel', 'Jl. Salak No. 84, Kel. Taman, Kec. Taman', 'Jl. Salak No. 84, Kel. Taman, Kec. Taman', '082143131616', '/uploads/hki_merek/1785455927_ktp_6a6be537053d3.jpeg', '/uploads/hki_merek/1785455927_nib_6a6be53705dba.pdf', '/uploads/hki_merek/1785455927_etiket_6a6be5370668f.png', '/uploads/hki_merek/1785455927_surat_6a6be53706f7d.pdf', 'Disetujui', NULL, 'https://drive.google.com/file/d/1wGe1dlYHBxDHs9lLmjYc5PBN8uT_LDiU/view?usp=drive_link', '2026-07-30 23:58:47', '2026-10-20 11:58:13');

-- --------------------------------------------------------

--
-- Table structure for table `peta_sebaran`
--

CREATE TABLE `peta_sebaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_usaha` varchar(255) DEFAULT NULL,
  `pemilik` varchar(255) DEFAULT NULL,
  `nib` varchar(255) DEFAULT NULL,
  `link_gdrive_nib` varchar(255) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL,
  `produk` varchar(255) DEFAULT NULL,
  `alamat_jalan` longtext DEFAULT NULL,
  `alamat_no` varchar(255) DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kota_madiun` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `kbli` varchar(255) DEFAULT NULL,
  `uraian_kbli` longtext DEFAULT NULL,
  `investasi` varchar(255) DEFAULT NULL,
  `tenaga_kerja` int(11) DEFAULT 0,
  `skala_usaha` varchar(255) DEFAULT NULL,
  `tingkat_risiko` varchar(255) DEFAULT NULL,
  `status_halal` varchar(255) DEFAULT NULL,
  `no_halal` varchar(255) DEFAULT NULL,
  `link_gdrive_halal` varchar(255) DEFAULT NULL,
  `status_bpom_cppob` varchar(255) DEFAULT NULL,
  `no_bpom_cppob` varchar(255) DEFAULT NULL,
  `link_gdrive_bpom_cppob` varchar(255) DEFAULT NULL,
  `status_sni` varchar(255) DEFAULT NULL,
  `no_sni` varchar(255) DEFAULT NULL,
  `link_gdrive_sni` varchar(255) DEFAULT NULL,
  `status_hki_merek` varchar(255) DEFAULT NULL,
  `no_hki_merek` varchar(255) DEFAULT NULL,
  `nama_merek` varchar(255) DEFAULT NULL,
  `tgl_berakhir_hki` varchar(255) DEFAULT NULL,
  `link_gdrive_hki_merek` varchar(255) DEFAULT NULL,
  `status_tkdn` varchar(255) DEFAULT NULL,
  `no_sertifikat_tkdn` varchar(255) DEFAULT NULL,
  `persentase_tkdn` varchar(255) DEFAULT NULL,
  `link_gdrive_tkdn` varchar(255) DEFAULT NULL,
  `is_legalitas_tracked` varchar(255) DEFAULT NULL,
  `tgl_terbit_legalitas` varchar(255) DEFAULT NULL,
  `link_gdrive_legalitas` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peta_sebaran`
--

INSERT INTO `peta_sebaran` (`id`, `nama_usaha`, `pemilik`, `nib`, `link_gdrive_nib`, `nik`, `no_hp`, `produk`, `alamat_jalan`, `alamat_no`, `kelurahan`, `kecamatan`, `kota_madiun`, `kategori`, `kbli`, `uraian_kbli`, `investasi`, `tenaga_kerja`, `skala_usaha`, `tingkat_risiko`, `status_halal`, `no_halal`, `link_gdrive_halal`, `status_bpom_cppob`, `no_bpom_cppob`, `link_gdrive_bpom_cppob`, `status_sni`, `no_sni`, `link_gdrive_sni`, `status_hki_merek`, `no_hki_merek`, `nama_merek`, `tgl_berakhir_hki`, `link_gdrive_hki_merek`, `status_tkdn`, `no_sertifikat_tkdn`, `persentase_tkdn`, `link_gdrive_tkdn`, `is_legalitas_tracked`, `tgl_terbit_legalitas`, `link_gdrive_legalitas`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'Lapak UMKM Kartini', 'Budi', '9120000000001', NULL, '3573010000000001', '081234567001', 'Lapak UMKM Kartini', 'Jl. Kartini 55, Madiun', '-', 'Madiun Lor', 'Manguharjo', 'Kota Madiun', 'Pangan', '10799', 'Industri Produk Makanan Lainnya', '310000000.00', 7, 'Mikro', 'Rendah', 'Ada', 'ID35110000408721', NULL, 'Ada', 'MD 4607325281', NULL, 'Ada', 'SNI 01-7843-2025', NULL, 'Ada', NULL, 'Lapak UMKM Kartini', '2026-09-14', NULL, 'Ada', 'TKDN/IK/2025/00101', '32.50%', 'https://drive.google.com/file/d/1cc9e77b5f2830411/view', '1', '2026-07-30', NULL, '-7.62180000', '111.52340000', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(2, 'Kentang - Krezznya Madiun', 'Yanuar', '9120000000004', NULL, '3573010000000004', '081234567004', 'Kentang - Krezznya Madiun', 'Jl. Oro Oro Ombo No 8, Kota Madiun, Jawa Timur, Jawa, 63117, Indonesia', '-', 'Oro-Oro Ombo', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10799', 'Industri Produk Makanan Lainnya', '125000000.00', 15, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025262311', 'Kentang - Krezznya Madiun', '2031-07-29', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-07-07', NULL, '-7.62670600', '111.52871670', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(3, 'RUJAK BUAH MARIYADI', 'Yanuar', '9120000000008', NULL, '3573010000000242', '081234567008', 'RUJAK BUAH MARIYADI', 'Jl. Rimba Darma 87', '-', 'Oro-Oro Ombo', 'Kartoharjo', 'Kota Madiun', 'Sandang', '14111', 'Industri Pakaian Jadi (Konveksi) Dari Tekstil', '135000000.00', 14, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '0', '2026-03-14', NULL, '-7.62735590', '111.52725480', '2026-07-27 15:14:21', '2026-07-29 13:13:13'),
(4, 'Rido Aluna', 'AR LUNIA', '9120000000009', NULL, '3573010000000009', '081234567009', 'Rido Aluna', 'Jl. Panglima Sudirman NO 66', '-', 'Kejuron', 'Taman', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '330000000.00', 11, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00104', '55.10%', 'https://drive.google.com/file/d/1b8966e68b23ad722/view', '0', '2025-10-11', NULL, '-7.63095400', '111.52190400', '2026-07-27 15:14:21', '2026-07-30 05:18:25'),
(5, 'Pisang Coklat', 'Agus Budiono', '9120000000010', NULL, '3573010000000010', '081234567010', 'Pisang Coklat', 'Kejuron, Kota Madiun, Jawa Timur, Jawa, 63139, Indonesia', '-', 'Kejuron', 'Taman', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '115000000.00', 3, 'Mikro', 'Rendah', 'Ada', 'ID35110000971797', NULL, 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025140818', 'Pisang Coklat', '2026-09-26', NULL, 'Belum', NULL, NULL, NULL, '1', '2025-10-22', NULL, '-7.63841500', '111.52573070', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(6, 'Rido Aluna', 'AR LUNIA', '9120000000009', NULL, '3573010000000009', '081234567009', 'Rido Aluna', 'Jl. Panglima Sudirman NO 66', '-', 'Kejuron', 'Taman', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '230000000.00', 15, 'Mikro', 'Rendah', 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Proses', NULL, '38.90%', NULL, '1', '2026-03-07', NULL, '-7.63418989', '111.52665234', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(7, 'WAFFLE KERING', 'HARI FITRI', '9120000000013', NULL, '3573010000000013', '081234567013', 'WAFFLE KERING', 'JL. COKROAMINOTO GG. RINGIN 8', '-', 'Kejuron', 'Taman', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '275000000.00', 12, 'Mikro', 'Rendah', 'Ada', 'ID35110000564001', NULL, 'Ada', 'MD 9724869506', NULL, 'Ada', 'SNI 01-3859-2025', NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00107', '45.00%', 'https://drive.google.com/file/d/1a07d14d0c2ec22aa/view', '1', '2026-04-15', NULL, '-7.63485660', '111.51953990', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(8, 'ANEKA KUE BASAH | \nANEKA KUE KERING | \nCATERING | \nRISOL FROZEN', 'SITI NURUL RAHAYUWATI', '9120000000014', NULL, '3573010000000014', '081234567014', 'ANEKA KUE BASAH | \nANEKA KUE KERING | \nCATERING | \nRISOL FROZEN', 'PERUM GRIYA KITA BLOK B-8', '-', 'Winongo', 'Manguharjo', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '60000000.00', 2, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '0', '2026-06-01', NULL, '-7.61916870', '111.50548550', '2026-07-27 15:14:21', '2026-07-30 08:11:35'),
(9, 'UNTIR-UNTIR | \nKUPING GAJAH | \nCUMI-CUMI  | \nSTIK KEJU | \nSTIK SELEDRI | \nKERING KENTANG', 'SUMARNI', '9120000000015', NULL, '3573010000000015', '081234567015', 'UNTIR-UNTIR | \nKUPING GAJAH | \nCUMI-CUMI  | \nSTIK KEJU | \nSTIK SELEDRI | \nKERING KENTANG', 'JL. SRIGADING 12 A', '-', 'Oro-Oro Ombo', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '220000000.00', 2, 'Mikro', 'Rendah', 'Ada', 'ID35110000201769', NULL, 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2025-11-06', NULL, '-7.62149690', '111.53127870', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(10, 'KEBAB', 'ARRI WIDYA DAMAYANTI', '9120000000016', NULL, '3573010000000016', '081234567016', 'KEBAB', 'JALAN ANEKA SARI NO 10 REJOMULYO MADIUN', '-', 'Rejomulyo', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '325000000.00', 14, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Ada', 'MD 9457250886', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00110', '67.15%', 'https://drive.google.com/file/d/144de5bd8f29131b3/view', '1', '2025-11-24', NULL, '-7.61865830', '111.53667330', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(11, 'MAKARONI', 'DIMAS SETIAWAN', '9120000000017', NULL, '3573010000000017', '081234567017', 'MAKARONI', 'JL PANGLIMA SUDIRMAN GG JAMBE 14', '-', 'Kejuron', 'Taman', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '90000000.00', 13, 'Mikro', 'Rendah', 'Ada', 'ID35110000905598', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025515675', 'MAKARONI', '2034-07-29', NULL, 'Proses', NULL, '32.50%', NULL, '1', '2026-04-04', NULL, '-7.63170770', '111.52396600', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(12, 'CAMILAN DAN MAKANAN', 'RETNO INDARTI', '9120000000018', NULL, '3573010000000018', '081234567018', 'CAMILAN DAN MAKANAN', 'JL CATUR JAYA SIDOMULYO 1 NO.35', '-', 'Kanigoro', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10799', 'Industri Produk Makanan Lainnya', '65000000.00', 4, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2026-03-05', NULL, '-7.63087440', '111.54151180', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(13, 'SULAM BORDIR | \nSAMBEL PECEL', 'ASTUTIK', '9120000000019', NULL, '3573010000000019', '081234567019', 'SULAM BORDIR | \nSAMBEL PECEL', 'JL. KIAGENG PEMANAHAN L.269/19 RT.029 RW.007 KEL. KANIGORO', '-', 'Kanigoro', 'Kartoharjo', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '110000000.00', 2, 'Mikro', 'Rendah', 'Ada', 'ID35110000193423', NULL, 'Ada', 'MD 2060207317', NULL, 'Ada', 'SNI 01-6211-2025', NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00113', '48.75%', 'https://drive.google.com/file/d/1bdbfa0ed63601653/view', '1', '2026-05-09', NULL, '-7.62704000', '111.54698820', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(14, 'SAMBEL PECEL', 'RATNAWATI AL HASAN', '9120000000020', NULL, '3573010000000020', '081234567020', 'SAMBEL PECEL', 'JLN TAMAN ASRI NO 4 MADIUN', '-', 'Banjarejo', 'Taman', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '265000000.00', 14, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025356596', 'SAMBEL PECEL', '2031-07-29', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-03-23', NULL, '-7.65178660', '111.52746880', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(15, 'MINUMAN JAMU | \nKOPI REMPAH', 'SUMARNI', '9120000000021', NULL, '3573010000000021', '081234567021', 'MINUMAN JAMU | \nKOPI REMPAH', 'JL. SRI GADIS GG. MELATI NO. 8 F', '-', 'Kanigoro', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '260000000.00', 7, 'Mikro', 'Rendah', 'Ada', 'ID35110000875592', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Proses', NULL, 'MINUMAN JAMU | \nKOPI REMPAH', '2026-07-01', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-05-05', NULL, '-7.63302660', '111.54596870', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(16, 'SAMBEL PECEL', 'HERUWATI', '9120000000020', NULL, '3573010000000020', '081234567020', 'SAMBEL PECEL', 'JLN BOROBUDUR NO 4-G', '-', 'Madiun Lor', 'Taman', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '75000000.00', 15, 'Mikro', 'Rendah', 'Proses', NULL, NULL, 'Ada', 'MD 7437723294', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00116', '38.90%', 'https://drive.google.com/file/d/1305dab55a37a7348/view', '1', '2026-01-22', NULL, '-7.61219970', '111.52660040', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(17, 'SAMBEL PECEL', 'SULISTIYOWATI', '9120000000020', NULL, '3573010000000020', '081234567020', 'SAMBEL PECEL', 'JL. GULUN NO 5-B RT 48 RW 15', '-', 'Kejuron', 'Taman', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '240000000.00', 7, 'Mikro', 'Rendah', 'Ada', 'ID35110000444567', NULL, 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025878327', 'SAMBEL PECEL', '2026-08-11', NULL, 'Belum', NULL, NULL, NULL, '1', '2025-11-21', NULL, '-7.63347000', '111.52599180', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(18, 'SAMBEL PECEL', 'ULUL SUFIANA', '9120000000020', NULL, '3573010000000020', '081234567020', 'SAMBEL PECEL', 'JL ROKAN NO. 1 RT 48/ RW 15 TAMAN', '-', 'Taman', 'Taman', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '65000000.00', 5, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2026-03-26', NULL, '-7.64578840', '111.52219310', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(19, 'KEBAB', 'WAHYU WISMA PRIYANI', '9120000000016', NULL, '3573010000000016', '081234567016', 'KEBAB', 'JL GEGONO MANIS G3/11 MANISREJO', '-', 'Manisrejo', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '165000000.00', 8, 'Mikro', 'Rendah', 'Ada', 'ID35110000892131', NULL, 'Ada', 'MD 5300764784', NULL, 'Ada', 'SNI 01-1419-2025', NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00119', '29.80%', 'https://drive.google.com/file/d/1285d068911fdc4bb/view', '1', '2026-02-03', NULL, '-7.64046300', '111.54173450', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(20, 'SAMBEL PECEL | \nKERING KENTANG', 'NOVITA DWI HARINI', '9120000000026', NULL, '3573010000000026', '081234567026', 'SAMBEL PECEL | \nKERING KENTANG', 'JALAN WUNI NO.12, KEJURON,', '-', 'Kejuron', 'Taman', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '125000000.00', 6, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025694389', 'SAMBEL PECEL | \nKERING KENTANG', '2030-07-29', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-05-01', NULL, '-7.63286220', '111.52380410', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(21, 'SAMBEL PECEL', 'CHAIRATUN LIES SETYORINI', '9120000000020', NULL, '3573010000000020', '081234567020', 'SAMBEL PECEL', 'H.O.S.COKROAMINOTO,GG: RINGIN NO 3 , MADIUN', '-', 'Kejuron', 'Taman', 'Kota Madiun', 'Pangan', '10792', 'Industri Bumbu Masak Dan Penyedap Masakan', '80000000.00', 8, 'Mikro', 'Rendah', 'Ada', 'ID35110000567087', NULL, 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Proses', NULL, '32.50%', NULL, '1', '2026-03-12', NULL, '-7.63681470', '111.52098690', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(22, 'BENGKEL LAS', 'RUSMANTO', '9120000000028', NULL, '3573010000000028', '081234567028', 'BENGKEL LAS', 'JL.MIJIL SULASTRI,', '-', 'Sogaten', 'Manguharjo', 'Kota Madiun', 'Pangan', '10792', 'Industri Bumbu Masak Dan Penyedap Masakan', '290000000.00', 13, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Ada', 'MD 3226386722', NULL, 'Belum', NULL, NULL, 'Proses', NULL, 'BENGKEL LAS', '2026-07-19', NULL, 'Ada', 'TKDN/IK/2025/00122', '41.20%', 'https://drive.google.com/file/d/122b0b057ad5d3adf/view', '1', '2025-12-16', NULL, '-7.60924870', '111.52367010', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(23, 'KERAJINAN SULAM', 'R.R.YOENI ASTOETI', '9120000000029', NULL, '3573010000000029', '081234567029', 'KERAJINAN SULAM', 'JL. BANDA NO.18', '-', 'Madiun Lor', 'Manguharjo', 'Kota Madiun', 'Pangan', '10799', 'Industri Produk Makanan Lainnya', '100000000.00', 12, 'Mikro', 'Rendah', 'Ada', 'ID35110000350058', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025410988', 'KERAJINAN SULAM', '2030-07-29', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-06-16', NULL, '-7.62184430', '111.52717390', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(24, 'NASI BOX', 'MARTATIK', '9120000000030', NULL, '3573010000000030', '081234567030', 'NASI BOX', 'Jl. Setinggil No. 19 RT. 30 RW. 01', '-', 'Demangan', 'Taman', 'Kota Madiun', 'Pangan', '10799', 'Industri Produk Makanan Lainnya', '150000000.00', 8, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2026-01-16', NULL, '-7.65933520', '111.51552970', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(25, 'BRONDONG, JIPANG', 'TUTIK RAHAYU', '9120000000031', NULL, '3573010000000031', '081234567031', 'BRONDONG, JIPANG', 'JL MANGGA XIII/3-B', '-', 'Kejuron', 'Taman', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '55000000.00', 6, 'Mikro', 'Rendah', 'Ada', 'ID35110000718438', NULL, 'Ada', 'MD 4095916147', NULL, 'Ada', 'SNI 01-8633-2025', NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00125', '62.40%', 'https://drive.google.com/file/d/1516b9027d41ac325/view', '1', '2025-11-25', NULL, '-7.63354170', '111.52143030', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(26, 'PENTOL CORAH', 'APRILIA', '9120000000032', NULL, '3573010000000032', '081234567032', 'PENTOL CORAH', 'JALAN DELIMA NO9 BLK MADIUN', '-', 'Kejuron', 'Taman', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '290000000.00', 6, 'Mikro', 'Rendah', 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025835084', 'PENTOL CORAH', '2033-07-29', NULL, 'Proses', NULL, '38.90%', NULL, '1', '2026-05-30', NULL, '-7.63294370', '111.52087400', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(27, 'NUGGET AYAM', 'BARIAH SUCIATI', '9120000000033', NULL, '3573010000000033', '081234567033', 'NUGGET AYAM', 'Jl. Taman Raya, No. 3, RT 027, TW 007, Kelurahan Banjareho, Kecamatan Taman, Kota Madiun, Jawa Timur 63137', '-', 'Banjarejo', 'Taman', 'Kota Madiun', 'Pangan', '10792', 'Industri Bumbu Masak Dan Penyedap Masakan', '160000000.00', 10, 'Mikro', 'Rendah', 'Ada', 'ID35110000677091', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2025-11-29', NULL, '-7.65641960', '111.53260680', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(28, 'BENGKEL MOTOR', 'PUDJI HARTONO', '9120000000034', NULL, '3573010000000034', '081234567034', 'BENGKEL MOTOR', 'JALAN KAPTEN TENDEAN NO.50, BANJAREJO', '-', 'Banjarejo', 'Taman', 'Kota Madiun', 'Pangan', '10792', 'Industri Bumbu Masak Dan Penyedap Masakan', '90000000.00', 10, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Ada', 'MD 2869242044', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00128', '52.30%', 'https://drive.google.com/file/d/199fa93786901d77f/view', '1', '2026-07-09', NULL, '-7.66067890', '111.53165700', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(29, 'AKSESORIS', 'HESTY IRAWATI', '9120000000035', NULL, '3573010000000035', '081234567035', 'AKSESORIS', 'JL. TAWANG BHAKTI NO. 24 A RT. 021 RW. 006', '-', 'Tawangrejo', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '185000000.00', 13, 'Mikro', 'Rendah', 'Ada', 'ID35110000885248', NULL, 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025514070', 'AKSESORIS', '2026-08-08', NULL, 'Belum', NULL, NULL, NULL, '1', '2025-11-10', NULL, '-7.60686230', '111.53715920', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(30, 'SAMBEL', 'ENGGAR LESTARI RAHAYU', '9120000000036', NULL, '3573010000000036', '081234567036', 'SAMBEL', '\"JL. TAWANGBARU RT 09, RW 02, KEL TAWANGREJO, KEC KARTOHARJO\"', '-', 'Tawangrejo', 'Kartoharjo', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '315000000.00', 2, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2026-01-05', NULL, '-7.63337180', '111.52644020', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(31, 'ROTI BAKERY', 'ENGGAR LESTARI RAHAYU', '9120000000037', NULL, '3573010000000037', '081234567037', 'ROTI BAKERY', 'JL. TAWANGBARU RT 09, RW 02, KEL TAWANGREJO, KEC KARTOHARJO', '-', 'Tawangrejo', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10792', 'Industri Bumbu Masak Dan Penyedap Masakan', '165000000.00', 12, 'Mikro', 'Rendah', 'Ada', 'ID35110000732701', NULL, 'Ada', 'MD 5012675706', NULL, 'Ada', 'SNI 01-7193-2025', NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00131', '32.50%', 'https://drive.google.com/file/d/10a2354d036c87bec/view', '1', '2026-07-05', NULL, '-7.60076460', '111.54512950', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(32, 'NASI BOX', 'MULYANI', '9120000000030', NULL, '3573010000000030', '081234567030', 'NASI BOX', 'JALAN SERAYU BARAT NO 52B, DESA/KELURAHAN PANDEAN, KEC. TAMAN', '-', 'Pandean', 'Taman', 'Kota Madiun', 'Pangan', '10792', 'Industri Bumbu Masak Dan Penyedap Masakan', '90000000.00', 3, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025757919', 'NASI BOX', '2034-07-29', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-03-01', NULL, '-7.64589660', '111.52003560', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(33, 'SAMBEL PECEL', 'SUTIKNYO', '9120000000020', NULL, '3573010000000020', '081234567020', 'SAMBEL PECEL', 'JL TIRTO MANIS 1 NO 13 MADIUN, DESA/KELURAHAN MANISREJO, KEC. TAMAN', '-', 'Manisrejo', 'Taman', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '135000000.00', 2, 'Mikro', 'Rendah', 'Ada', 'ID35110000805609', NULL, 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2026-05-23', NULL, '-7.63781220', '111.54490390', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(34, 'SUSU SARI KEDELAI', 'FADLITSANIYA ABSHAR NURRAMADAN', '9120000000040', NULL, '3573010000000040', '081234567040', 'SUSU SARI KEDELAI', 'JL.NGEBONG RT10/RW03, BANJAREJO, TAMAN, MADIUN, DESA/KELURAHAN BANJAREJO, KEC. TAMAN', '-', 'Banjarejo', 'Taman', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '25000000.00', 15, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Ada', 'MD 6639266282', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00134', '55.10%', 'https://drive.google.com/file/d/17878cb0f1a5d14a4/view', '1', '2026-01-23', NULL, '-7.65456770', '111.52997380', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(35, 'KERIPIK DAN KEBAB', 'HUDA UMAR ALKAFF', '9120000000041', NULL, '3573010000000041', '081234567041', 'KERIPIK DAN KEBAB', 'JL.PARIANOM B4 NO.33, DESA/KELURAHAN SOGATEN, KEC. MANGUHARJO, KOTA MADIUN,', '-', 'Sogaten', 'Manguharjo', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '340000000.00', 2, 'Mikro', 'Rendah', 'Ada', 'ID35110000943309', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025995170', 'KERIPIK DAN KEBAB', '2032-07-29', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-02-12', NULL, '-7.60904130', '111.52095490', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(36, 'KUE TRADISIONAL', 'BETTY ARININGSIH', '9120000000042', NULL, '3573010000000042', '081234567042', 'KUE TRADISIONAL', 'PERUM GRAND RESPATI A.27, DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN', '-', 'Josenan', 'Taman', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '235000000.00', 5, 'Mikro', 'Rendah', 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Proses', NULL, 'KUE TRADISIONAL', '2026-07-20', NULL, 'Proses', NULL, '38.90%', NULL, '1', '2025-10-09', NULL, '-7.65126590', '111.51519700', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(37, 'SAMBEL, ABON', 'SRI SUHARTINI', '9120000000043', NULL, '3573010000000043', '081234567043', 'SAMBEL, ABON', 'JL. PRAJURITAN GG. TANGKIS I/6, DESA/KELURAHAN MADIUN LOR, KEC. MANGUHARJO, KOTA MADIUN', '-', 'Madiun Lor', 'Manguharjo', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '345000000.00', 14, 'Mikro', 'Rendah', 'Ada', 'ID35110000716912', NULL, 'Ada', 'MD 9085851490', NULL, 'Ada', 'SNI 01-2006-2025', NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00137', '45.00%', 'https://drive.google.com/file/d/196e60623cecc6466/view', '1', '2025-11-04', NULL, '-7.61808080', '111.52124750', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(38, 'WADER CRISPY', 'SUMINAH', '9120000000044', NULL, '3573010000000044', '081234567044', 'WADER CRISPY', 'JALAN KAMPAR 46, DESA/KELURAHAN TAMAN, KEC. TAMAN,', '-', 'Taman', 'Taman', 'Kota Madiun', 'Pangan', '10799', 'Industri Produk Makanan Lainnya', '105000000.00', 5, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025683473', 'WADER CRISPY', '2032-07-29', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-01-12', NULL, '-7.64281240', '111.52248060', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(39, 'GORDEN, KELAMBU', 'IIS NINGTYAS', '9120000000045', NULL, '3573010000000045', '081234567045', 'GORDEN, KELAMBU', 'JL. URIP SUMOHARJO NO. 04, DESA/KELURAHAN MANGUHARJO, KEC. MANGUHARJO', '-', 'Manguharjo', 'Manguharjo', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '80000000.00', 10, 'Mikro', 'Rendah', 'Ada', 'ID35110000734506', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2026-07-13', NULL, '-7.62909320', '111.51172960', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(40, 'SAMBEL PECEL', 'AMIRUDIN', '9120000000020', NULL, '3573010000000020', '081234567020', 'SAMBEL PECEL', 'JL. MURIA NO. 21/11, RT.002, RW.001, DESA/KELURAHAN PANGONGANGAN, KEC. MANGUHARJO', '-', 'Pangongangan', 'Taman', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '30000000.00', 3, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Ada', 'MD 4332524898', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00140', '67.15%', 'https://drive.google.com/file/d/121b53a913ea5b19e/view', '1', '2026-03-18', NULL, '-7.62897910', '111.51530180', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(41, 'KERIPIK DAN SAMBAL PECEL', 'HARI TRI RAHAYU', '9120000000047', NULL, '3573010000000047', '081234567047', 'KERIPIK DAN SAMBAL PECEL', 'PERUM WIDODO KENCONO INDAH 1 BLOK C-6 RT 56 RW 18, DESA/KELURAHAN PANDEAN, KEC. TAMAN', '-', 'Pandean', 'Taman', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '345000000.00', 7, 'Mikro', 'Rendah', 'Ada', 'ID35110000353870', NULL, 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025374061', 'KERIPIK DAN SAMBAL PECEL', '2026-10-02', NULL, 'Proses', NULL, '32.50%', NULL, '1', '2025-10-30', NULL, '-7.65004750', '111.53251450', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(42, 'BENGKEL LAS', 'MURDOKO', '9120000000028', NULL, '3573010000000028', '081234567028', 'BENGKEL LAS', 'JL. SALAK NO. 32, DESA/KELURAHAN MOJOREJO, KEC. TAMAN', '-', 'Mojorejo', 'Manguharjo', 'Kota Madiun', 'Pangan', '10792', 'Industri Bumbu Masak Dan Penyedap Masakan', '345000000.00', 13, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2026-05-05', NULL, '-7.64310320', '111.53161050', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(43, 'SAMBEL PECEL', 'SUTINI', '9120000000020', NULL, '3573010000000020', '081234567020', 'SAMBEL PECEL', 'PERUM GRIYA SALAK BLOK B-51 RT 048 RW 016. PANDEAN. TAMAN', '-', 'Pandean', 'Taman', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '280000000.00', 13, 'Mikro', 'Rendah', 'Ada', 'ID35110000454425', NULL, 'Ada', 'MD 6960975915', NULL, 'Ada', 'SNI 01-4169-2025', NULL, 'Proses', NULL, 'SAMBEL PECEL', '2026-07-18', NULL, 'Ada', 'TKDN/IK/2025/00143', '48.75%', 'https://drive.google.com/file/d/1573e08b3b64ec740/view', '1', '2025-10-06', NULL, '-7.64426360', '111.53023280', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(44, 'BAJU BORDIR', 'HENY MOERDANINGSIH', '9120000000050', NULL, '3573010000000050', '081234567050', 'BAJU BORDIR', 'JL. DWI JAYA 3 NO. 9 MADIUN, DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO, KOTA MADIUN', '-', 'Klegen', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10799', 'Industri Produk Makanan Lainnya', '120000000.00', 13, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025199560', 'BAJU BORDIR', '2028-07-29', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-04-16', NULL, '-7.62859900', '111.53984400', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(45, 'KUE', 'DWI WAHYUNINGSIH', '9120000000051', NULL, '3573010000000051', '081234567051', 'KUE', 'JL. MANDIRI PERUM RED TULIP BLOK A NO. 4, DESA/KELURAHAN DEMANGAN, KEC. TAMAN', '-', 'Demangan', 'Taman', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '170000000.00', 4, 'Mikro', 'Rendah', 'Ada', 'ID35110000850073', NULL, 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2026-05-12', NULL, '-7.65739580', '111.52841580', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(46, 'DAGING ASAP, SOSIS, BAKSO, DAGING BERBUMBU', 'DARMAWAN MULYADI', '9120000000052', NULL, '3573010000000052', '081234567052', 'DAGING ASAP, SOSIS, BAKSO, DAGING BERBUMBU', 'Jl. Salak III No. 8, Taman, Kec. Taman, Kota Madiun, Jawa Timur 63131', '-', 'Taman', 'Taman', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '195000000.00', 4, 'Mikro', 'Rendah', 'Proses', NULL, NULL, 'Ada', 'MD 6007604366', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00146', '38.90%', 'https://drive.google.com/file/d/1fe8cc59e89b4e7d3/view', '1', '2026-06-19', NULL, '-7.64325580', '111.52802850', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(47, 'OLAHAN SAMBEL', 'BAGUS SURYA NUGRAHA', '9120000000053', NULL, '3573010000000053', '081234567053', 'OLAHAN SAMBEL', 'JALAN PUSPA INDAH BLOK Y2 PERUM KARTOHARJO INDAH, DESA/KELURAHAN KELUN, KEC. KARTOHARJO, KOTA MADIUN', '-', 'Kelun', 'Kartoharjo', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '45000000.00', 14, 'Mikro', 'Rendah', 'Ada', 'ID35110000235283', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025336903', 'OLAHAN SAMBEL', '2034-07-29', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-05-09', NULL, '-7.60115200', '111.55459620', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(48, 'AYAM UNGKEP FROZEN', 'NUR KHIKMAH', '9120000000054', NULL, '3573010000000054', '081234567054', 'AYAM UNGKEP FROZEN', 'JL. SERAYU INDAH B-8 NO.32, DESA/KELURAHAN PANDEAN, KEC. TAMAN', '-', 'Pandean', 'Taman', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '115000000.00', 14, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2026-05-23', NULL, '-7.64948170', '111.52785200', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(49, 'OLAHAN FROZEN', 'IMAM SUGIRI', '9120000000055', NULL, '3573010000000055', '081234567055', 'OLAHAN FROZEN', 'JL TILAMUPIH 24 , DESA/KELURAHAN JOSENAN, KEC. TAMAN, KOTA MADIUN', '-', 'Josenan', 'Taman', 'Kota Madiun', 'Pangan', '10799', 'Industri Produk Makanan Lainnya', '90000000.00', 9, 'Mikro', 'Rendah', 'Ada', 'ID35110000313352', NULL, 'Ada', 'MD 9125716264', NULL, 'Ada', 'SNI 01-5709-2025', NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00149', '29.80%', 'https://drive.google.com/file/d/1a207ab7393a1a74e/view', '1', '2026-05-15', NULL, '-7.65283750', '111.51543840', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(50, 'GITAR', 'WAHYU WIJOYONO', '9120000000056', NULL, '3573010000000056', '081234567056', 'GITAR', 'JL. FLORES NO. 48, DESA/KELURAHAN KARTOHARJO, KEC. KARTOHARJO,', '-', 'Kartoharjo', 'Kartoharjo', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '95000000.00', 2, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025208717', 'GITAR', '2026-07-10', NULL, 'Belum', NULL, NULL, NULL, '1', '2025-12-25', NULL, '-7.62962480', '111.52557820', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(51, 'SEPATU TEKNIK', 'MUHAMMAD YUSUF', '9120000000057', NULL, '3573010000000057', '081234567057', 'SEPATU TEKNIK', 'JL. MARGA BAKTI NO 9, DESA/KELURAHAN MOJOREJO, KEC. TAMAN', '-', 'Mojorejo', 'Taman', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '165000000.00', 12, 'Mikro', 'Rendah', 'Ada', 'ID35110000581333', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Proses', NULL, '32.50%', NULL, '1', '2026-05-25', NULL, '-7.64088170', '111.53057480', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(52, 'DIMSUM', 'AMIRUL MA`RUF', '9120000000058', NULL, '3573010000000058', '081234567058', 'DIMSUM', 'JALAN SUKOYONO PERUM ADDA PURIARTHA D-12A, DESA/KELURAHAN JOSENAN, KEC. TAMAN', '-', 'Josenan', 'Taman', 'Kota Madiun', 'Pangan', '10799', 'Industri Produk Makanan Lainnya', '80000000.00', 7, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Ada', 'MD 3908914166', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00152', '41.20%', 'https://drive.google.com/file/d/10a31a44b426c850a/view', '1', '2026-01-18', NULL, '-7.65516640', '111.51756770', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(53, 'UNGKEP JEROAN', 'ERFANA HENDRAWATI', '9120000000059', NULL, '3573010000000059', '081234567059', 'UNGKEP JEROAN', 'JL. AIRLANGGA II NO.8 RT 07 RW 02 WINONGO, MANGUHARJO, MADIUN', '-', 'Winongo', 'Manguharjo', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '75000000.00', 8, 'Mikro', 'Rendah', 'Ada', 'ID35110000114112', NULL, 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025396816', 'UNGKEP JEROAN', '2026-09-26', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-01-18', NULL, '-7.61923680', '111.51360320', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(54, 'SAMBEL PECEL', 'LELLY MIRYANTI', '9120000000020', NULL, '3573010000000020', '081234567020', 'SAMBEL PECEL', 'TAMAN ASRI I/A-15 BANJAREJO TAMAN MADIUN, DESA/KELURAHAN BANJAREJO, KEC. TAMAN', '-', 'Banjarejo', 'Taman', 'Kota Madiun', 'Pangan', '10792', 'Industri Bumbu Masak Dan Penyedap Masakan', '225000000.00', 7, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2025-12-18', NULL, '-7.65191900', '111.52795380', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(55, 'TAHU WALIK', 'SITI ROSYIDAH', '9120000000061', NULL, '3573010000000061', '081234567061', 'TAHU WALIK', 'JL. TEMUGIRING NO. 22 BLK , DESA/KELURAHAN NGEGONG, KEC. MANGUHARJO', '-', 'Ngegong', 'Manguharjo', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '345000000.00', 15, 'Mikro', 'Rendah', 'Ada', 'ID35110000791087', NULL, 'Ada', 'MD 8575406435', NULL, 'Ada', 'SNI 01-4777-2025', NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00155', '62.40%', 'https://drive.google.com/file/d/19770a64ff459ef94/view', '1', '2026-04-22', NULL, '-7.60691620', '111.51899340', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(56, 'SAMBAL KACANG', 'INDAH RATNAWATI', '9120000000062', NULL, '3573010000000062', '081234567062', 'SAMBAL KACANG', 'JL. DADALI NO.11 RT.16 RW.005 , DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO', '-', 'Nambangan Kidul', 'Manguharjo', 'Kota Madiun', 'Pangan', '10799', 'Industri Produk Makanan Lainnya', '230000000.00', 5, 'Mikro', 'Rendah', 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025364319', 'SAMBAL KACANG', '2028-07-29', NULL, 'Proses', NULL, '38.90%', NULL, '1', '2026-06-08', NULL, '-7.64556670', '111.51723080', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(57, 'OLAHAN JAMUR TIRAM', 'VILGA VICHARIO', '9120000000063', NULL, '3573010000000063', '081234567063', 'OLAHAN JAMUR TIRAM', 'JL.MANYAR NO 32, DESA/KELURAHAN NAMBANGAN LOR, KEC. MANGUHARJO', '55', 'Nambangan Lor', 'Manguharjo', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '210000000.00', 2, 'Mikro', 'Rendah', 'Ada', 'ID35110000336510', NULL, 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Proses', NULL, 'OLAHAN JAMUR TIRAM', '2026-10-14', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-06-19', NULL, '-7.63560360', '111.51349150', '2026-07-27 15:14:21', '2026-07-27 15:58:38'),
(58, 'JAMU SERAI', 'DYAH RATNA WULANDARI', '9120000000064', NULL, '3573010000000064', '081234567064', 'JAMU SERAI', 'JL. PANORAMA RAYA NO. 12B, DESA/KELURAHAN PANDEAN, KEC. TAMAN', '-', 'Pandean', 'Taman', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '350000000.00', 7, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Ada', 'MD 3376278958', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00158', '52.30%', 'https://drive.google.com/file/d/1235c8de050594196/view', '1', '2026-05-03', NULL, '-7.64543810', '111.53371340', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(59, 'OMELET', 'NELLY NOVI DAMAYANTI', '9120000000065', NULL, '3573010000000065', '081234567065', 'OMELET', 'JL SERAYU BARAT GG V NO 49, DESA/KELURAHAN PANDEAN, KEC. TAMAN', '-', 'Pandean', 'Taman', 'Kota Madiun', 'Pangan', '11090', 'Industri Minuman Ringan Lainnya', '110000000.00', 12, 'Mikro', 'Rendah', 'Ada', 'ID35110000214297', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025809535', 'OMELET', '2034-07-29', NULL, 'Belum', NULL, NULL, NULL, '1', '2025-10-15', NULL, '-7.64588290', '111.51935540', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(60, 'MAKANAN OLAHAN', 'IRAWATI', '9120000000066', NULL, '3573010000000066', '081234567066', 'MAKANAN OLAHAN', 'JL.JENGGOLO MANIK 12, DESA/KELURAHAN KELUN, KEC. KARTOHARJO', '-', 'Kelun', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '325000000.00', 11, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2026-07-09', NULL, '-7.60307810', '111.54773120', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(61, 'TELOR ASIN', 'HARTATI', '9120000000067', NULL, '3573010000000067', '081234567067', 'TELOR ASIN', 'JL WIRARAJA NO 3, DESA/KELURAHAN WINONGO, KEC. MANGUHARJO, KOTA MADIUN', '-', 'Winongo', 'Manguharjo', 'Kota Madiun', 'Pangan', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '260000000.00', 9, 'Mikro', 'Rendah', 'Ada', 'ID35110000112741', NULL, 'Ada', 'MD 2764166323', NULL, 'Ada', 'SNI 01-9145-2025', NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00161', '32.50%', 'https://drive.google.com/file/d/19b0631b7dfb3f92c/view', '1', '2026-05-19', NULL, '-7.62197630', '111.51520220', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(62, 'MAKANAN OLAHAN', 'IKE VISQHIE MARSHA HAYU', '9120000000066', NULL, '3573010000000066', '081234567066', 'MAKANAN OLAHAN', 'JL. ELANG II NO 6, DESA/KELURAHAN NAMBANGAN KIDUL, KEC. MANGUHARJO, KOTA MADIUN', '-', 'Nambangan Lor', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10792', 'Industri Bumbu Masak Dan Penyedap Masakan', '240000000.00', 3, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025343859', 'MAKANAN OLAHAN', '2030-07-29', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-06-22', NULL, '-7.64860730', '111.51527820', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(63, 'TEMPE MENDOAN', 'SRI WAHYUNI', '9120000000069', NULL, '3573010000000069', '081234567069', 'TEMPE MENDOAN', 'JL.NANGKA NO 6, DESA/KELURAHAN TAMAN, KEC. TAMAN, KOTA MADIUN', '-', 'Taman', 'Taman', 'Kota Madiun', 'Pangan', '10799', 'Industri Produk Makanan Lainnya', '285000000.00', 2, 'Mikro', 'Rendah', 'Ada', 'ID35110000480390', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '1', '2025-10-09', NULL, '-7.64024130', '111.52345660', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(64, 'KEBAB', 'ANNY DWI POERWAHJOENINGTYAS', '9120000000016', NULL, '3573010000000016', '081234567016', 'KEBAB', 'JL. IMAM BONJOL GG. JATI TRUBUS NO. 7 , DESA/KELURAHAN KLEGEN, KEC. KARTOHARJO', '-', 'Klegen', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '40000000.00', 11, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Ada', 'MD 9902367095', NULL, 'Belum', NULL, NULL, 'Proses', NULL, 'KEBAB', '2026-07-18', NULL, 'Ada', 'TKDN/IK/2025/00164', '55.10%', 'https://drive.google.com/file/d/1d1f09250f3c05ee1/view', '1', '2025-12-12', NULL, '-7.62610280', '111.54042550', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(65, 'KAIN BATIK', 'VERONIKA DWI SULISTIYANI', '9120000000071', NULL, '3573010000000071', '081234567071', 'KAIN BATIK', 'JL. CANDI BOKO NO. 09 KEL. PATIHAN, KEC. MANGUHARJO, KOTA MADIUN', '-', 'Patihan', 'Manguharjo', 'Kota Madiun', 'Pangan', '10792', 'Industri Bumbu Masak Dan Penyedap Masakan', '115000000.00', 3, 'Mikro', 'Rendah', 'Ada', 'ID35110000531973', NULL, 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025526078', 'KAIN BATIK', '2026-08-19', NULL, 'Belum', NULL, NULL, NULL, '1', '2025-10-14', NULL, '-7.60702850', '111.52911050', '2026-07-27 15:14:21', '2026-07-27 15:14:21'),
(67, 'REPARASI', 'CV ADIWARNA KARSA EMPAT TUJUH', '9120000000073', NULL, '3573010000000073', '081234567073', 'REPARASI', 'JL. PILANG DARMA NO.11, DESA/KELURAHAN PILANGBANGO, KEC. KARTOHARJO', '-', 'Pilangbango', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10792', 'Industri Bumbu Masak Dan Penyedap Masakan', '285000000.00', 2, 'Mikro', 'Rendah', 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Proses', NULL, '38.90%', NULL, '1', '2026-02-26', NULL, '-7.62017390', '111.54579400', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(68, 'BENGKEL MOBIL', 'DONNY KURNIAWAN NOTOWIDJOJO', '9120000000074', NULL, '3573010000000074', '081234567074', 'BENGKEL MOBIL', 'JL. SOEKARNO HATTA 66, DESA/KELURAHAN DEMANGAN, KEC. TAMAN', '50', 'Demangan', 'Taman', 'Kota Madiun', 'Sandang', '14120', 'Industri Pakaian Jadi Menurut Pesanan', '330000000.00', 5, 'Mikro', 'Rendah', 'Ada', 'ID35110000673628', NULL, 'Ada', 'MD 4820572330', NULL, 'Ada', 'SNI 01-8031-2025', NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00167', '45.00%', 'https://drive.google.com/file/d/14ab40d9081156574/view', '1', '2025-10-27', NULL, '-7.65871119', '111.52735412', '2026-07-27 15:14:21', '2026-07-30 04:57:38'),
(69, 'Warung Makan Bu Susi', 'Susi Susanti', '2961251404189', NULL, '3573590573056990', '81234567891', 'Makanan dan Minuman', 'Jl. Diponegoro', '20', 'Madiun Lor', 'Manguharjo', 'Kota Madiun', 'Kimia dan Furnitur', '11090', 'Industri Minuman Ringan Lainnya', '310000000.00', 7, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Belum', NULL, NULL, NULL, '0', '2026-07-29', NULL, '-76250', '1115220', '2026-07-28 00:31:24', '2026-07-30 05:11:57'),
(70, 'Kerajinan Kayu Jati', 'Joko Anwar', '5309033439831', NULL, '3573407473554860', '81234567892', 'Mebel Kayu', 'Jl. Cokroaminoto', '45', 'Kejuron', 'Taman', 'Kota Madiun', 'Pangan', '10799', 'INDUSTRI PRODUK MAKANAN LAINNYA YTDL', '225000000.00', 2, 'Kecil', 'Menengah Rendah', 'Ada', 'ID35110000570365', NULL, 'Proses', NULL, NULL, 'Belum', NULL, NULL, 'Ada', NULL, 'Kerajinan Kayu Jati', '2026-08-27', NULL, 'Belum', NULL, NULL, NULL, '1', '2026-07-29', NULL, '-76310', '1115300', '2026-07-28 00:31:24', '2026-07-29 12:09:01'),
(71, 'Kopi Nusantara', 'Ahmad Dahlan', '3453385008862', NULL, '3573933251567390', '81234567893', 'Bubuk Kopi', 'Jl. Yos Sudarso', '12', 'Madiun Lor', 'Manguharjo', 'Kota Madiun', 'Kerajinan (Kriya)', '10794', 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya', '185000000.00', 8, 'Mikro', 'Rendah', 'Belum', NULL, NULL, 'Ada', 'MD 2090545555', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, NULL, NULL, 'Ada', 'TKDN/IK/2025/00170', '67.15%', 'https://drive.google.com/file/d/19ab5976d1396a315/view', '1', '2025-12-10', NULL, '-76245', '1115235', '2026-07-28 00:31:24', '2026-07-30 04:57:38'),
(72, 'Konveksi Baju Ceria', 'Siti Aminah', '2802754416809', NULL, '3573275259659190', '81234567894', 'Pakaian Jadi', 'Jl. Dr. Sutomo', '8', 'Kartoharjo', 'Kartoharjo', 'Kota Madiun', 'Pangan', '10710', 'Industri Produk Roti Dan Kue', '265000000.00', 11, 'Kecil', 'Menengah Rendah', 'Ada', 'ID35110000525654', NULL, 'Belum', NULL, NULL, 'Belum', NULL, NULL, 'Ada', 'IPT2025152303', 'Konveksi Baju Ceria', '2026-09-22', NULL, 'Proses', NULL, '32.50%', NULL, '1', '2026-07-29', NULL, '-76285', '1115280', '2026-07-28 00:31:24', '2026-07-30 04:57:38'),
(77, 'Test Verifikasi Perusahaan', 'Test Verifikasi Pemilik', '9999999999999', NULL, '3577019999999999', '085712345678', '-', 'Jl. Test No 17', NULL, 'Pandean', 'Taman', 'Kota Madiun', 'Pangan', '-', '-', '0.00', 1, 'Mikro', 'Rendah', 'Belum', '-', NULL, 'Belum', '-', NULL, 'Belum', '-', NULL, 'Belum', '-', '-', NULL, NULL, 'Belum', NULL, NULL, NULL, '1', NULL, NULL, '-7.6320', '111.5250', '2026-07-31 07:56:31', '2026-07-31 09:07:03'),
(78, 'Bengkel Las Jaya Madiun', 'Hendra Gunawan', '5089747908747', NULL, '3573336890980650', '081234567897', 'Pagar dan Teralis', 'Jl. Thamrin No. 45', NULL, 'Klegen', 'Kartoharjo', 'Kota Madiun', 'Metal dan Mesin', '10795', 'INDUSTRI SARI NABATI DAN KRIMER NABATI', '3300067800.00', 10, 'Kecil', 'Menengah Tinggi', 'Belum', '-', NULL, 'Belum', '-', NULL, 'Belum', '-', NULL, 'Belum', '-', '-', NULL, NULL, 'Belum', NULL, NULL, NULL, '1', NULL, NULL, '-7.6250', '111.5320', '2026-07-31 08:55:35', '2026-07-31 09:07:03'),
(79, 'Nilahi', 'Nilainahitadil', '5089747908746', NULL, '3528838888888883', '0856365357375', 'Roti Basah', 'Perum Panorama Wilis 84', '-', 'Pandean', 'Taman', 'Kota Madiun', 'Pangan', '10792', 'INDUSTRI KUE BASAH', '20000000.00', 2, 'Mikro', 'Rendah', 'Belum', '-', NULL, 'Belum', '-', NULL, 'Belum', '-', NULL, 'Belum', '-', '-', NULL, NULL, 'Belum', NULL, NULL, NULL, '1', NULL, NULL, '-7.647627', '111.532947', '2026-07-31 09:00:52', '2026-07-31 09:22:51'),
(80, 'DELATU', 'NURHARJANTI', '1703220011993', NULL, '3577016207700004', '081252487123', 'Jamu, Bakso, Sosis Solo, Singkong', 'Jl. Halmahera', '72', 'Kartoharjo', 'Taman', 'Kota Madiun', 'Pangan', '11053', 'INDUSTRI MINUMAN RINGAN', '1000000', 1, 'Mikro', 'Rendah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-7.627884', '111.5264441', '2026-08-12 14:35:06', '2026-08-12 14:35:06');

-- --------------------------------------------------------

--
-- Table structure for table `publikasi`
--

CREATE TABLE `publikasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tanggal` timestamp NULL DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `deskripsi` longtext DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publikasi`
--

INSERT INTO `publikasi` (`id`, `judul`, `gambar`, `tanggal`, `waktu`, `deskripsi`, `status`, `is_active`, `created_at`, `updated_at`) VALUES
(2, '2 Cara Cek Keaslian Sertifikat Halal', '/uploads/publikasi/1785513817_6a6cc759c1fc0.jpeg', '2026-07-12 17:00:00', '-', 'Halo Sobat IKM Juara! 👋 Udah pada tau belum gimana cara mastiin keaslian Sertifikat Halal? 🤔 Tenang, caranya gampang banget kok. Yuk, swipe ke kiri buat tau 2 langkah praktisnya! 👉✨\r\n\r\n#IKMJuara #SertifikatHalal #UMKMMadiun #KotaMadiun #InfoHalal', 'Informasi', 1, '2026-03-25 17:42:47', '2026-07-31 16:03:37'),
(3, '📢 GRATIS UNDUH! E-Book Program Pemberdayaan IKM HIJAU 2026 🌿', '/uploads/publikasi/1785512319_6a6cc17fed5b6.jpeg', '2026-07-21 17:00:00', '-', 'Dapatkan panduan lengkap untuk menerapkan aktivitas hijau pada usaha Anda bersama Kementerian Perindustrian. Mulai dari konsep, tahapan, hingga praktik langsung, semuanya ada di sini!\r\n\r\n📲 Download e-book sekarang:\r\nScan QR atau akses 👉 taplink.cc/ikmhijauofc\r\n\r\n#IKMHijau #KemenperinRI #EbookGratis #BisnisBerkelanjutan', 'Informasi', 1, '2026-03-25 17:43:42', '2026-07-31 15:38:39'),
(4, 'Waktunya upgrade mesin dan peralatan usahamu!', '/uploads/publikasi/1785511949_6a6cc00d17999.jpeg', '2026-06-30 17:00:00', '-', 'Kabar gembira untuk para pelaku industri! 📣 Program Restrukturisasi Mesin dan/atau Peralatan dari Kementerian Perindustrian HADIR KEMBALI.\r\n\r\nYuk, manfaatkan program ini untuk tingkatkan produktivitas usahamu. Catat tanggalnya:\r\n🗓️ 20 April 2026 s.d. 20 Agustus 2026\r\n💻 Ajukan permohonan melalui: siinas.kemenperin.go.id (pastikan sudah masuk ke akun SIINAS perusahaanmu, ya!)\r\n\r\nJangan sampai terlewat! ⚙️🚀\r\n#KemenperinRI #RestrukturisasiMesin #SIINAS #InfoIndustri #IKMNaikKelas', 'Informasi', 1, '2026-03-26 12:02:55', '2026-07-31 15:40:10'),
(5, 'Bikin kemasan produkmu makin menarik dan bernilai jual tinggi!', '/uploads/publikasi/1785512597_6a6cc29511604.jpeg', '2026-08-06 17:00:00', '09.30 Selesai', 'Ikuti Webinar \"Kemasan Cerdas untuk Industri Kecil\" GRATIS dari Kemenperin bersama ahlinya. Terbuka untuk umum + dapat E-Sertifikat! 🎓\r\n\r\n🗓️ 7 Agustus 2026 | 09.30 WIB\r\nDaftar segera di: bit.ly/webinarKDMK_7agustus atau scan QR di gambar ya!\r\n\r\n#UMKMIndonesia #WebinarUMKM #KemasanProduk #Kemenperin #IKMJuara', 'Selesai', 1, '2026-03-26 12:42:37', '2026-07-31 15:43:17'),
(6, '1. Cara Cek Keaslian Sertifikat Halal', '/uploads/publikasi/1785513937_6a6cc7d159dcd.jpeg', '2026-07-12 17:00:00', '-', 'Sobat IKM, sudah tahu belum kalau cek Sertifikat Halal itu semudah memotret? 📸\r\n\r\nNggak perlu repot, tinggal buka kamera HP atau aplikasi pembaca QR Code kamu, lalu arahkan ke sertifikat. Praktis, kan? Yuk, cobain sekarang dan pastikan sertifikat produkmu terdata dengan benar! ✅\r\n\r\n#HalalIndonesia #IKMMaju #KotaMadiun #UMKMNaikKelas #IKMJuara', 'Informasi', 1, '2026-03-29 06:46:08', '2026-07-31 16:05:37'),
(7, 'Tingkatkan daya saing produk lokal Anda dengan Sertifikat Halal!', '/uploads/publikasi/1785513676_6a6cc6ccd7016.jpeg', '2026-08-10 17:00:00', '08.00 Selesai', 'Disnaker KUKM Kota Madiun 2026 memfasilitasi Sertifikasi Halal Self Declare secara GRATIS khusus bagi pelaku industri kecil makanan. Legalitas kuat, usaha maju, masyarakat sejahtera!\r\n\r\nKuota sangat terbatas. Segera amankan slot pendaftaran Anda sekarang juga. 📝✅\r\n\r\n#KotaMadiun #DisnakerKUKMKotaMadiun #SertifikatHalal #UMKMNaikKelas #Madiun', 'Belum Dimulai', 1, '2026-03-29 06:46:54', '2026-07-31 16:01:16'),
(8, '2. Cara Cek Keaslian Sertifikat Halal', '/uploads/publikasi/1785514036_6a6cc83439f56.jpeg', '2026-07-12 17:00:00', '-', 'Lebih suka cek dokumen lewat PC atau Laptop? Tenang, verifikasi Sertifikat Halal juga bisa dilakukan via website Komdigi! 🌐💯\r\n\r\nCukup siapkan file format PDF dan unggah ke situs resminya untuk melihat detail tanda tangan elektroniknya. Praktis banget, kan? Ada yang sudah pernah coba cara kedua ini? Tulis pengalamanmu di kolom komentar ya! 👇\r\n\r\n#HalalIndonesia #IKMMaju #KotaMadiun #UMKMNaikKelas #IKMJuara', 'Informasi', 1, '2026-07-31 16:07:16', '2026-07-31 16:07:16');

-- --------------------------------------------------------

--
-- Table structure for table `registrasi_pelatihan`
--

CREATE TABLE `registrasi_pelatihan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kegiatan` varchar(255) DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `nib` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `foto_ktp` varchar(255) DEFAULT NULL,
  `foto_produk` longtext DEFAULT NULL,
  `nama_usaha` varchar(255) DEFAULT NULL,
  `produk_diproduksi` varchar(255) DEFAULT NULL,
  `alamat_usaha` longtext DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kota` varchar(255) DEFAULT NULL,
  `jenis_usaha` varchar(255) DEFAULT NULL,
  `tahun_mulai` varchar(255) DEFAULT NULL,
  `skala_usaha` varchar(255) DEFAULT NULL,
  `omzet_bulanan` varchar(255) DEFAULT NULL,
  `stabilitas_omzet` varchar(255) DEFAULT NULL,
  `tantangan_usaha` longtext DEFAULT NULL,
  `media_penjualan` longtext DEFAULT NULL,
  `cakupan_pemasaran` longtext DEFAULT NULL,
  `karyawan_tetap` int(11) DEFAULT 0,
  `karyawan_tidak_tetap` int(11) DEFAULT 0,
  `sistem_usaha` varchar(255) DEFAULT NULL,
  `level_digital` varchar(255) DEFAULT NULL,
  `pernah_pelatihan` varchar(255) DEFAULT NULL,
  `harapan_pelatihan` varchar(255) DEFAULT NULL,
  `target_6_bulan` varchar(255) DEFAULT NULL,
  `is_lolos` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registrasi_pelatihan`
--

INSERT INTO `registrasi_pelatihan` (`id`, `nama_kegiatan`, `nama_lengkap`, `nik`, `nib`, `email`, `whatsapp`, `jenis_kelamin`, `tanggal_lahir`, `foto_ktp`, `foto_produk`, `nama_usaha`, `produk_diproduksi`, `alamat_usaha`, `kelurahan`, `kecamatan`, `kota`, `jenis_usaha`, `tahun_mulai`, `skala_usaha`, `omzet_bulanan`, `stabilitas_omzet`, `tantangan_usaha`, `media_penjualan`, `cakupan_pemasaran`, `karyawan_tetap`, `karyawan_tidak_tetap`, `sistem_usaha`, `level_digital`, `pernah_pelatihan`, `harapan_pelatihan`, `target_6_bulan`, `is_lolos`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Pelatihan Merek HKI', 'ERLIN KURNIAWATI', '8401972635094817', '2211240019219', 'putri.melati@example.com', '082345678901', 'Perempuan', '1999-06-08', 'https://i.ibb.co/dswkxSn1/6edb5a68ff64.jpg', NULL, 'Sambel Pecel Mbak Erlin', NULL, 'Perum Dumai Indah Jln. Dwi Jaya IV/145', 'Klegen', 'Kartoharjo', 'Madiun', 'Kuliner', '2010', 'Mikro', '1250000', 'Ya', '[\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\"]', NULL, 1, 0, 'Sendiri', 'Belum', 'Belum', 'Mampu menerapkan ilmu pelatihan dalam operasional usaha sehari-hari.', 'Memperluas pemasaran melalui platform digital dan media sosial.', 0, '2026-03-23 14:12:53', '2026-07-31 10:29:11', '2026-07-31 11:27:18'),
(3, 'Pelatihan Merek HKI', 'Enita Yuliana', '3577036806030003', '2222222222222', 'yulianaenita425@gmail.com', '08656666668', 'Perempuan', '2026-03-02', 'https://i.ibb.co/HTw8r7Mg/16d430f98588.jpg', NULL, 'Kentang - Krezznya Madiun', NULL, 'Jl. Pandan 67 Gang Kelinci', 'Taman', 'Kartoharjo', 'Madiun', 'Kuliner', '2020', 'Mikro', '1000000', 'Ya', '[\"Modal terbatas\"]', '[\"Instagram\"]', NULL, 1, 0, 'Sendiri', 'Belum', 'Pernah', 'Dicoba', 'Dicoba', 0, '2026-03-24 16:18:02', '2026-07-31 10:29:42', '2026-07-31 11:28:01'),
(5, 'Pelatihan Merek HKI', 'Darmayadi', '2222222222222222', '2222222222222', 'yulianaenita425@gmail.com', '081234567890', 'Laki-laki', '2026-03-03', 'https://i.ibb.co/Fq8Xg6nn/8849a8ba30f9.jpg', NULL, 'crepes - Unagi', NULL, 'Jl. Testing', 'Taman', 'Kartoharjo', 'Madiun', 'Kuliner', '2020', 'Mikro', '600000', 'Ya', '[\"Modal terbatas\"]', '[\"Offline (toko)\"]', NULL, 1, 0, 'Sendiri', 'Belum', 'Belum', 'Testing 2', 'Testing 2', 0, '2026-03-24 17:42:50', '2026-07-31 10:29:53', '2026-07-31 11:28:07'),
(6, 'Pelatihan Merek HKI', 'Enita Yuliana', '5928301746502938', '0101250009948', 'yulianaenita425@gmail.com', '081234567890', 'Perempuan', '2026-03-18', 'https://i.ibb.co/KjjvmCHQ/1159e2a8192d.jpg', NULL, 'crepes - Unagi', NULL, 'Jl. Narata 971', 'Taman', 'Kartoharjo', 'Madiun', 'Kuliner', '2020', 'Mikro', '600000', 'Ya', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', NULL, 1, 0, 'Sendiri', 'Belum', 'Belum', 'Test', 'test', 1, '2026-03-26 14:58:32', '2026-07-31 10:31:00', '2026-07-31 11:27:47'),
(7, 'Pelatihan Produksi Efisien dan Manajemen Operasional', 'Yayan Mega', '4214155555555555', '1555254555555', 'jajalaeyayan@gmail.com', '014277571221', 'Perempuan', '2009-02-11', 'https://i.ibb.co/Q3f8vR6f/4181e666d018.jpg', NULL, 'Jus Teras Segar', NULL, 'Jl. Teratai Indah', 'Taman', 'Taman', 'Madiun', 'Fashion', '2021', 'Mikro', '5000000', 'Ya', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', NULL, 2, 0, 'Sendiri', 'Sudah tapi belum maksimal', 'Belum', 'bagus', 'tes', 1, '2026-07-24 17:03:18', '2026-07-24 17:03:18', '2026-07-31 11:28:13'),
(8, 'Pelatihan Digital Marketing IKM 2026', 'Budi Sambel Madiun', '3515000523154598', '0123708661870', 'budi_sambel@gmail.com', '081234567890', 'Laki-laki', '1992-05-15', 'https://i.ibb.co/k2Z9W4f1/bd0d97873620.jpg', '[\"https:\\/\\/i.ibb.co\\/k2Z9W4f1\\/bd0d97873620.jpg\"]', 'UD Sambel Pecel Madiun Juara', 'Sambel Pecel Kemasan & Keripik Tempe', 'Jl. Pahlawan No. 45 Madiun', 'Pandean', 'Taman', 'Madiun', 'Kuliner', '2021', 'Mikro', '15000000', 'Ya', '[]', '[]', NULL, 0, 0, 'Mandiri', 'Menengah', NULL, '-', 'Ekspor Sambel Pecel ke Surabaya & Malang', 1, '2026-07-30 14:31:10', '2026-07-30 14:31:10', '2026-07-31 11:27:41'),
(11, 'Pelatihan Standarisasi Produk dan Sertifikasi Halal', 'Yanuar Priambodo', '3577020102650003', 'Belum (Bersedia)', 'sriwulanwijayantiuung@gmail.com', '082143131616', 'Perempuan', '2026-07-08', 'https://i.ibb.co/9HzBbcyb/dcb27b9d391b.jpg', '[\"https:\\/\\/i.ibb.co\\/h1WTthzm\\/98f32ec0e986.jpg\"]', 'Nikmat Gurih', 'Keripik Tempe', 'Jl. Taman Asri VIII/100', 'Sukosari', 'Kartoharjo', 'Madiun', 'Kuliner', '2025', 'Mikro', '870000', 'Ya', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 2, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Makin melesat omzetnya', 'ingin menambah tenaga kerja', 0, '2026-07-31 01:46:14', '2026-07-31 11:50:53', '2026-07-31 11:28:19'),
(12, 'Pelatihan Standarisasi Produk dan Sertifikasi Halal', 'SRI WULANDARI', '3577034903690001', '1306250070146', 'sriwulanwijayantiuung@gmail.com', '082143131616', 'Perempuan', '2026-07-06', 'https://i.ibb.co/9HzBbcyb/dcb27b9d391b.jpg', '[\"https:\\/\\/i.ibb.co\\/LzdQp8Sn\\/b658d77027b9.jpg\"]', 'Gurihnya', 'Telur Asin', 'Jl. Pesanggrahan III No 8 Madiun', 'Kartoharjo', 'Kartoharjo', 'Madiun', 'Kuliner', '2024', 'Mikro', '650000', 'Ya', '[\"Produksi terbatas\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah aktif', 'Pernah', 'Ingin Berjualan di marketplace', 'ingin meluaskan lokasi produksi', 1, '2026-07-31 01:50:16', '2026-07-31 01:50:16', '2026-08-01 06:17:55'),
(14, 'Pelatihan Produksi Efisien dan Manajemen Operasional', 'SRI WULANDARI', '3577034903690001', '1306250070146', 'peserta@ikmjuara.my.id', '082143131616', 'Laki-laki', '1990-01-01', '-', NULL, 'Gurihnya', 'Telur Asin', 'Jl. Pesanggrahan III No 8 Madiun', 'Kartoharjo', 'Kartoharjo', 'Madiun', 'Pangan', '2026', 'Mikro', '< 10 Juta', 'Stabil', NULL, NULL, NULL, 0, 0, 'Perseorangan', 'Menengah', NULL, NULL, 'Meningkatkan omzet dan legalitas', 1, '2026-07-31 09:47:16', '2026-07-31 09:47:16', '2026-07-31 11:27:33'),
(17, 'Pelatihan Produksi Efisien dan Manajemen Operasional', 'Enita Yuliana', '5928301746502938', '0101250009948', 'peserta@ikmjuara.my.id', '081234567890', 'Laki-laki', '1990-01-01', '-', NULL, 'crepes - Unagi', '-', 'Jl. Narata 971', 'Taman', 'Kartoharjo', 'Madiun', 'Pangan', '2026', 'Mikro', '< 10 Juta', 'Stabil', NULL, NULL, NULL, 0, 0, 'Perseorangan', 'Menengah', NULL, NULL, 'Meningkatkan omzet dan legalitas', 0, '2026-07-31 10:31:19', '2026-07-31 10:31:52', '2026-07-31 11:27:28'),
(18, 'Pelatihan Sistem Informasi Industri Nasional (SIINas)', 'Enita Yuliana', '5928301746502938', '0101250009948', 'peserta@ikmjuara.my.id', '081234567890', 'Laki-laki', '1990-01-01', '-', NULL, 'crepes - Unagi', '-', 'Jl. Narata 971', 'Taman', 'Kartoharjo', 'Madiun', 'Pangan', '2026', 'Mikro', '< 10 Juta', 'Stabil', NULL, NULL, NULL, 0, 0, 'Perseorangan', 'Menengah', NULL, NULL, 'Meningkatkan omzet dan legalitas', 1, '2026-07-31 10:39:11', '2026-07-31 10:39:11', '2026-07-31 11:27:23'),
(20, 'Pelatihan Standarisasi Produk dan Sertifikasi Halal', 'UUNG SRIWULAN WIJAYANTI', '3577020102650003', '2504250023077', 'sriwulanwijayantiuung@gmail.com', '087715996212', 'Perempuan', '1989-05-16', 'https://i.ibb.co/RkpMpcRt/c8366b8b2361.jpg', '[\"https:\\/\\/i.ibb.co\\/PZByd4XK\\/9d28e77d5970.jpg\"]', 'Sri Rejeki', 'Tempe Kripik', 'JL Cokrobasonto Gang III No. 11', 'Demangan', 'Taman', 'Madiun', 'Kuliner', '2021', 'Mikro', '900000', 'Ya', '[\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Semakin sukses dengan mempelajari pelatihan dari disnaker', 'Bisa menambah pegawai dan volume produksi', 0, '2026-07-31 11:42:55', '2026-07-31 11:52:39', '2026-08-01 06:18:02'),
(22, 'Pelatihan Merek HKI', 'Nur Aini', '3577020605680055', '1708210010001', 'nuraini66@yopmail.com', '082662472742', 'Perempuan', '2026-07-16', 'https://i.ibb.co/KcJnRys0/6bcf7138561f.jpg', '[\"https:\\/\\/i.ibb.co\\/SwNfS0W4\\/cbbcb9b521d2.jpg\"]', 'Jamu Larasati', 'Jamu Botolan', 'Jl. Salak No. 84 Gang Tengah 5', 'Taman', 'Taman', 'Madiun', 'Kuliner', '2006', 'Mikro', '1500000', 'Ya', '[\"Marketing kurang efektif\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 3, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Ingin menemukan cara agar penjualan meningkat', 'Bisa memiliki dapur pengolahan mandiri', 1, '2026-07-31 11:58:39', '2026-07-31 12:13:22', '2026-08-01 06:18:08'),
(23, 'Pelatihan Produksi Efisien dan Manajemen Operasional', 'Nur Aini', '3577020605680055', '1708210010001', 'nuraini66@yopmail.com', '082662472742', 'Perempuan', '2026-07-09', 'https://i.ibb.co/PsbyfXWY/c7c73fe499b7.jpg', '[\"https:\\/\\/i.ibb.co\\/SwNfS0W4\\/cbbcb9b521d2.jpg\"]', 'Jamu Larasati', 'Jamu Serbuk', 'Jl. MJ Sungkono No 25B RT 35 RW 11', 'Taman', 'Taman', 'Madiun', 'Kuliner', '2020', 'Mikro', '1200000', 'Ya', '[\"Marketing kurang efektif\"]', '[\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 2, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'DIcoba dulu', 'Siap Maju Mendunia', 0, '2026-07-31 12:06:02', '2026-07-31 12:18:26', '2026-08-01 06:18:20'),
(24, 'Pelatihan Digital Marketing untuk IKM', 'Yanuar Priambodo', '3520111601980002', '1313141414143', 'yanuara16@gmail.com', '085655480223', 'Laki-laki', '1998-01-16', 'https://i.ibb.co/vC6L9mVh/bddc240ddbca.jpg', '[\"https:\\/\\/i.ibb.co\\/DgtTwhzB\\/eca15e9a903f.jpg\"]', 'Yans Crapes', 'Crapes', 'Perum Panorama Wilis F8', 'Pandean', 'Taman', 'Madiun', 'Kuliner', '2025', 'Mikro', '950000', 'Ya', '[\"Modal terbatas\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Ingin menambah wawasan soal digital marketing', 'Omset meningkat', 0, '2026-07-31 14:56:34', '2026-07-31 14:56:34', '2026-08-01 06:18:28'),
(25, 'Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare', 'Test', '3577034903690353', '2555555555222', 'test03@yopmail.com', '027222222224', 'Laki-laki', '2026-07-30', 'https://i.ibb.co/cSkMT0vS/67d6d2a2f540.jpg', '[\"https:\\/\\/i.ibb.co\\/wh11ZXLV\\/50e742e73ddc.jpg\"]', 'Jamu TEtes', 'JAmu', 'Jl. Oro oro ombo 66', 'Oro-Oro Ombo', 'Kartoharjo', 'Madiun', 'Kuliner', '2020', 'Mikro', '500000', 'Ya', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Test', 'Test', 0, '2026-08-01 01:49:58', '2026-08-01 01:49:58', '2026-08-01 04:30:27'),
(26, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Drwi, Sulistyani, SH', '3577036809770004', '1403230114883', 'dewisulistyanisuwoto@gmail.com', '081359137030', 'Perempuan', '1977-09-28', 'https://i.ibb.co/Y4wG2z8r/c642823ba83f.jpg', '[\"https:\\/\\/i.ibb.co\\/tMV9yJW8\\/c17c8f54a194.jpg\",\"https:\\/\\/i.ibb.co\\/1tKm8HM9\\/4001defcec55.jpg\"]', 'Wingko Besek', 'Wingko', 'Jl. Kemiri No. , RT. 39, RW. 12', 'Kejuron', 'Taman', 'Madiun', 'Kuliner', '2025', 'Mikro', '2000000', 'Ya', '[\"Marketing kurang efektif\",\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\",\"Regional (Antar Provinsi\\/Nasional)\"]', 2, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Ingin penjualan makin luas. Dan meningkatkan pendapatan', 'Omset makin naik dari sebelumnya. Dan pemasaran makin luas', 0, '2026-08-01 04:56:25', '2026-08-01 04:56:25', NULL),
(27, 'Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare', 'Erna dyah ayu Susilowaty', '3577036909810004', '0810230036742', 'ernadyah69@gmail.com', '081234703975', 'Perempuan', '1981-09-29', 'https://i.ibb.co/TB9wsnKC/e426f7def389.jpg', '[\"https:\\/\\/i.ibb.co\\/m5gtnQy9\\/34daf00d945d.jpg\"]', 'Mahkota', 'Krupuk lempeng', 'Jl.jambu kembar  no.8', 'Pandean', 'Taman', 'Madiun', 'Kuliner', '2008', 'Mikro', '2000000', 'Ya', '[\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Regional (Antar Provinsi\\/Nasional)\"]', 3, 0, 'Mandiri', 'Belum', 'Belum', 'Harapan saya setelah mendapatkan pelatihan usaha sy bisa mencakup keseluruhan  dan bisa mendapatkan modal dari pemerintah.', 'Menambah omzet sampai 3 x lipat', 0, '2026-08-01 09:38:52', '2026-08-01 09:38:52', NULL),
(28, 'Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare', 'Nurharjanti', '3577016207700004', '1703220011993', 'nungnurharjanti@gmail.com', '081252487123', 'Perempuan', '1970-07-22', 'https://i.ibb.co/PZXsgN49/9130ab5f5449.jpg', '[\"https:\\/\\/i.ibb.co\\/zTV4YcNN\\/3812a39d6964.jpg\"]', 'Delatu', 'Bakso, Sosis solo,  Singkong', 'Jl. Halmahera no. 72 Madiun', 'Kartoharjo', 'Kartoharjo', 'Madiun', 'Kuliner', '2022', 'Mikro', '500000', 'Musiman', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\"]', '[\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Produksi meningkat, bisa promosi di media sosial biar jangkauan pemasarannya lebih luas', 'Omset meningkat, penjualan meningkat', 1, '2026-08-01 11:59:18', '2026-08-12 14:26:13', NULL),
(29, 'Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare', 'HERIYANTO', '3577020407760002', 'Belum (Bersedia)', 'putriramadini806@gmail.com', '081335251661', 'Laki-laki', '1976-07-04', 'https://i.ibb.co/dqQ7mkg/96e3cc46238b.jpg', '[\"https:\\/\\/i.ibb.co\\/0RCFWMpb\\/c69be425965b.jpg\",\"https:\\/\\/i.ibb.co\\/hxmRr1gs\\/6e1e05d25258.jpg\",\"https:\\/\\/i.ibb.co\\/39FmL1cY\\/797555753c03.jpg\"]', 'PENGGILINGAN DAGING / SEMOGA SUKSES', 'BAKSO', '9G9C+4GM, Jl. Mangga Gg. III, RT.4 RW1, Kejuron, Kec. Taman, Kota Madiun, Jawa Timur 63132', 'Taman', 'Taman', 'Madiun', 'Kuliner', '2024', 'Kecil', '7000000', 'Ya', '[\"SDM kurang\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 2, 0, 'Mandiri', 'Belum', 'Belum', 'usahanya lebih berkembang dan maju', 'omset naik', 0, '2026-08-01 12:48:22', '2026-08-01 12:48:22', NULL),
(30, 'Pelatihan Olahan Sambal - Fasilitasi Sertifikasi Halal Self Declare', 'Asmy nuraidha sari', '3502175310910004', '1008220006354', 'asmynuraidha91@gmail.com', '081217133602', 'Perempuan', '1991-10-13', 'https://i.ibb.co/h1TrvxC7/bc2255dd8a55.jpg', '[\"https:\\/\\/i.ibb.co\\/Wp43fy4z\\/688415dbc237.jpg\",\"https:\\/\\/i.ibb.co\\/4RYZq6r4\\/6e06a4511426.jpg\",\"https:\\/\\/i.ibb.co\\/Z1GdnWzN\\/20872603a5a3.jpg\"]', 'Warung mbk sari', 'Makanan siap saji', 'Jl perintis kemerdekaan \r\nDepan xiomy', 'Manguharjo', 'Manguharjo', 'Madiun', 'Kuliner', '2020', 'Mikro', '4000000', 'Ya', '[\"Modal terbatas\",\"Produksi terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Semoga bisa menambah wawasan dan lancar usahanya', 'Bismillah buka cabang 🤲🤲', 0, '2026-08-01 17:48:20', '2026-08-01 17:48:20', NULL),
(31, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'NURI KUSTANTI', '3173055404820017', '1412220066754', 'pukiskentangyongemadiun@gmail.com', '085785244982', 'Perempuan', '1982-04-14', 'https://i.ibb.co/C3sLs8Wk/659ebce66a9b.jpg', '[\"https:\\/\\/i.ibb.co\\/fzgMdxmq\\/7d50d4fa947a.jpg\",\"https:\\/\\/i.ibb.co\\/dwwwhT22\\/c857b3cb968b.jpg\",\"https:\\/\\/i.ibb.co\\/9kk4HGQs\\/e591e71b01b1.jpg\"]', 'PUKIS KENTANG YONGE', 'PUKIS KENTANG', 'JL.COKROAMINOTO GG.TANJUNG II NO.151B MADIUN', 'Kejuron', 'Taman', 'Madiun', 'Kuliner', '2025', 'Mikro', '3000000', 'Ya', '[\"Marketing kurang efektif\",\"Produksi terbatas\"]', '[\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah aktif', 'Belum', 'Setelah mengikuti pelatihan ini ,maka customer akan lebih percaya bahwa produk kita aman untuk dikonsumsi dan pastinya dengan mengikuti pelatihan ini usaha pukis kentang ini bisa menjadi pilihan oleh-oleh kota madiun selain sambel pecel dan bluder', 'punya outlet karena sekarang masih rumahan', 0, '2026-08-02 08:50:43', '2026-08-02 08:50:43', NULL),
(32, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Hendra budiantono', '3578201607860001', '0912210011857', 'bqbbakery@gmail.com', '081241594635', 'Laki-laki', '1986-07-16', 'https://i.ibb.co/tpbHWbDh/7c4cd0014a5b.jpg', '[\"https:\\/\\/i.ibb.co\\/tMXgY5NC\\/5c4c29f69422.jpg\",\"https:\\/\\/i.ibb.co\\/jv9WdmPs\\/d0fdde8437ca.jpg\",\"https:\\/\\/i.ibb.co\\/7xy0npb8\\/8981e31b0aa5.jpg\"]', 'Tahu judes', 'Gorengan,dawet dan es sari kacang hijau', 'Jl. Taman Praja No.24, Mojorejo, Kec. Taman, Kota Madiun, Jawa Timur 63139', 'Mojorejo', 'Taman', 'Madiun', 'Kuliner', '2025', 'Mikro', '8000000', 'Ya', '[\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 2, 'Mandiri', 'Sudah aktif', 'Pernah', 'Ingin memperluas usaha dan menambah ilmu berdagang', 'Omzet naik terus', 0, '2026-08-02 11:10:46', '2026-08-02 11:10:46', NULL),
(33, 'Pelatihan Olahan Sambal - Fasilitasi Sertifikasi Halal Self Declare', 'Atik pundhi asmorowati', '3577034904800003', '1257000602731', 'poen.dhi@gmail.com', '082264704751', 'Perempuan', '1980-04-09', 'https://i.ibb.co/cMYb40S/ee3998822f30.jpg', NULL, 'Dorodasih', 'Sambel pecel', 'JL. Dorodasih manis no.4', 'Manisrejo', 'Taman', 'Madiun', 'Kuliner', '2015', 'Mikro', '1500000', 'Ya', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Belum', 'Belum', 'Ada peningkatan penjualan dan bantuan usaha modal', 'Bisa menaikkan omzet penjualan secara signifikan', 0, '2026-08-03 03:13:14', '2026-08-03 03:13:14', NULL),
(34, 'Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare', 'Emmy Emmanuelle T', '3577026811830004', '8120015172814', 'emmyemma2811@gmail.com', '08175086898', 'Perempuan', '1983-11-28', 'https://i.ibb.co/twfhg2SD/565106b2ef8f.jpg', '[\"https:\\/\\/i.ibb.co\\/9mzcCjtQ\\/71cf8a6d2d20.jpg\",\"https:\\/\\/i.ibb.co\\/s9MwYyPj\\/1ff6f2380a56.jpg\"]', 'Dumboo juice and kitchen', 'Fresh juice', 'Jl. Jambu no. 11 Madiun', 'Kejuron', 'Taman', 'Madiun', 'Kuliner', '2016', 'Mikro', '1500000', 'Tidak', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Harapan saya setelah ikut pelatihan. Skill saya meningkat dan penjualan laris manis', 'Omset meningkat 2-3x lipat', 0, '2026-08-03 04:58:14', '2026-08-03 04:58:14', NULL),
(35, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Cicilia Ineke Lesmana', '3577034402800004', '0406240019973', 'cicilia.ineke@gmail.com', '08113033236', 'Perempuan', '1980-02-04', 'https://i.ibb.co/rKKqkyDp/cb68838701f1.jpg', '[\"https:\\/\\/i.ibb.co\\/B958zfZ\\/3fc0184f0c6e.jpg\",\"https:\\/\\/i.ibb.co\\/xqbmkdrX\\/16298beb2901.jpg\",\"https:\\/\\/i.ibb.co\\/xKs1Jx7w\\/024395955f15.jpg\"]', 'Kuweh Nyonya', 'Roti, cake, kue kering , pastri', 'Jl. Cokroaminoto no.82', 'Pandean', 'Taman', 'Madiun', 'Kuliner', '2026', 'Mikro', '40000000', 'Tidak', '[\"Lainnya\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 5, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Memperluas jaringan', 'Omzet naik 2x lipat', 0, '2026-08-03 08:08:56', '2026-08-03 08:08:56', NULL),
(36, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Yohanes Devin Alvianto', '3577031704940001', '1309220036973', 'devinyohanes@gmail.com', '085157881728', 'Laki-laki', '1994-04-17', 'https://i.ibb.co/WN5CGjqF/a7a3278b176e.jpg', '[\"https:\\/\\/i.ibb.co\\/zVdvs4J1\\/0c355d4daf5b.jpg\"]', 'tjap Vivin, Pisang Goreng & Bakpao', 'Pisang goreng dan bakpao', 'jl Kapuas no 22 sebelah ici koffie, Madiun, Jawa Timur, Indonesia', 'Taman', 'Taman', 'Madiun', 'Kuliner', '2024', 'Mikro', '3000000', 'Tidak', '[\"Marketing kurang efektif\",\"Modal terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Memperluas jaringan usaha, mengerti teknik pemasaran, mengerti teknik penjualan dengan baik serta pengelolaan SDM dengan baik', 'menambah omset, dan membuka cabang di karisidenan madiun.', 0, '2026-08-04 01:22:41', '2026-08-04 01:22:41', NULL),
(37, 'Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare', 'Setio Wardhaningrum', '3577036912800002', 'Belum (Bersedia)', 'ayumbelva10@gmail.com', '082132731580', 'Perempuan', '1980-12-29', 'https://ikmjuara.my.id/uploads/ktp/1785917460_6a72f014a60db.jpg', '[\"https:\\/\\/ikmjuara.my.id\\/uploads\\/foto_produk\\/1785917490_6a72f032a9133.jpg\"]', 'Makaroni Jio', 'Makaroni Pedas, Makaroni Keju, Mie Kremes', 'Jl. Tumpak Manis No. 40', 'Manisrejo', 'Taman', 'Madiun', 'Kuliner', '2025', 'Mikro', '2000000', 'Musiman', '[\"Penjualan sepi\",\"Marketing kurang efektif\"]', '[\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Dapat memperluas penjualan sehingga banyak pesanan yang masuk dan omset meningkat', 'Ada tambahan menu dan kenaikan omset', 0, '2026-08-05 08:11:30', '2026-08-05 08:11:30', NULL),
(38, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Rahayu', '3508055404730005', '2901220010416', 'echosnack@gmail.com', '081338381932', 'Perempuan', '1973-04-14', 'https://i.ibb.co/r2D6Ny4K/433190786472.jpg', '[\"https:\\/\\/i.ibb.co\\/qYNnHtwm\\/05b1f78c901d.jpg\",\"https:\\/\\/i.ibb.co\\/gMSZXKG0\\/b221034fd597.jpg\",\"https:\\/\\/i.ibb.co\\/4w116pFH\\/2ae82260ed30.jpg\"]', 'Rhy cookies & snack', 'Onde onde mletek, bolu, kebab,takoyaki, nastar ,bronies', 'Jln Gajah mada no 10', 'Manguharjo', 'Manguharjo', 'Madiun', 'Kuliner', '2023', 'Mikro', '3000000', 'Musiman', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\",\"Lainnya\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 2, 'Mandiri', 'Belum', 'Pernah', 'Ingin jualan lewat medsos', 'Usaha bs maju , omset bertambah', 0, '2026-08-05 12:07:47', '2026-08-05 12:07:47', NULL),
(39, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'EMI SUJIANA', '3577036709720003', 'Belum (Bersedia)', 'emisujiana72@gmail.com', '0895367167213', 'Perempuan', '1972-09-27', 'https://i.ibb.co/RTX58Y7c/5aa2b63d7432.jpg', '[\"https:\\/\\/i.ibb.co\\/1t8GMbVC\\/17de6f6928ca.jpg\",\"https:\\/\\/i.ibb.co\\/fBvj94q\\/890405618924.jpg\",\"https:\\/\\/i.ibb.co\\/3YVG68r8\\/435a1b31bc24.jpg\"]', '\"Raafi cake\"', 'Kue basah', 'Jl.Mulya Bakti No.26 Kota Madiun', 'Mojorejo', 'Taman', 'Madiun', 'Kuliner', '2023', 'Mikro', '2500000', 'Tidak', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', '[]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Ingin memperluas jaringan reseler', 'Omset bisa bertambah naik', 0, '2026-08-05 15:27:43', '2026-08-05 15:27:43', NULL),
(40, 'Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare', 'Anik Susiowati', '3577025803830001', '0610230028831', 'susiowatianik739@gmail.com', '081375770687', 'Perempuan', '1983-03-18', 'https://i.ibb.co/XZ2D2hc2/379f5309ade7.jpg', '[\"https:\\/\\/i.ibb.co\\/svX80ktR\\/a4195d87daae.jpg\"]', 'A2 (Aneka Aes)', 'Es jeruk es blewah es melon aneka jus', 'Jln Raden Wijaya no 07 RT 21 RW 05 kec manguharjo Kel manguharjo Kota Madiun', 'Manguharjo', 'Manguharjo', 'Madiun', 'Kuliner', '2022', 'Kecil', '1000000', 'Ya', '[\"Lainnya\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Belum', 'Belum', 'Bisa belajar berbagai macam minuman', 'Omset meningkat', 0, '2026-08-06 02:28:26', '2026-08-06 02:28:26', NULL),
(41, 'Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare', 'Titik Rahayuni', '3577014507730002', '0708260080732', 'sudamanto8@gmail.com', '081399009370', 'Perempuan', '1973-07-05', 'https://i.ibb.co/dwVT4Tsz/481f4f3dc2de.jpg', '[\"https:\\/\\/i.ibb.co\\/gZjhthVS\\/12ba3023eb4e.jpg\"]', 'Keripik Tempe \"Berkah Rasa\"', 'Keripik Tempe', 'Jl. Sido Mukti No. 8 Kelun Kota Madiun', 'Kelun', 'Kartoharjo', 'Madiun', 'Kuliner', '2024', 'Mikro', '4000000', 'Ya', '[\"Modal terbatas\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 1, 'Mandiri', 'Belum', 'Belum', 'Mengembangkan produksi', 'Omzet meningkat', 0, '2026-08-07 10:11:23', '2026-08-07 10:11:23', NULL),
(42, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Heri Eli Nuriyani', '3577015111720002', '1301220001475', 'elinuriyani9@gmail.com', '085852241949', 'Perempuan', '1972-11-11', 'https://i.ibb.co/Pk4186j/ba99c3018a55.jpg', '[\"https:\\/\\/i.ibb.co\\/7tZT6PYp\\/35b211d0b071.jpg\",\"https:\\/\\/i.ibb.co\\/93w9tNvx\\/a9ac6748151d.jpg\",\"https:\\/\\/i.ibb.co\\/bgj3vkY6\\/25bccb998e6e.jpg\"]', 'PAWOEN D\'eli', 'Minuman ekstrak, cair, kue, cemilan', 'Jalan Sri Rejeki No. 55, RT 02/RW. 01, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun', 'Sukosari', 'Kartoharjo', 'Madiun', 'Kuliner', '2014', 'Mikro', '1000000', 'Ya', '[\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Ingin Produk terjual dengan maksimal lewat IG, Tiktok', 'Punya karyawan dan hasil meningkat', 0, '2026-08-09 12:06:44', '2026-08-09 12:06:44', NULL),
(43, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'JEA MAHATSA', '3577022411020004', 'Belum (Bersedia)', 'jeamahatsa372@gmail.com', '085334795813', 'Laki-laki', '2002-11-24', 'https://i.ibb.co/d42JDfd1/7c9d422d6fe9.jpg', '[\"https:\\/\\/i.ibb.co\\/5WFpbXGk\\/88e78eaff808.jpg\"]', 'STIK BAWANG JEJE', 'STIK BAWANG', 'Jl. Kasatrian No. 86 RT 16 RW 05', 'Patihan', 'Manguharjo', 'Madiun', 'Kuliner', '2026', 'Mikro', '800000', 'Ya', '[\"Lainnya\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Belum', 'Belum', 'Mendapatkan fasilitasi sertifikasi halal dan teknik marketing', 'Menambah pasar di toko retail', 0, '2026-08-12 03:49:25', '2026-08-12 03:49:25', NULL),
(44, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Krisisna Ermilaning Tari', '3577015405820002', '0607260027626', 'ermilacrisna@gmail.com', '081216308073', 'Perempuan', '1982-05-14', 'https://i.ibb.co/TMzrpgWt/19af39dd22b1.jpg', '[\"https:\\/\\/i.ibb.co\\/C36Z5g4Y\\/d0ad758fb661.jpg\",\"https:\\/\\/i.ibb.co\\/CpZw4qqW\\/cd090a45ef86.jpg\",\"https:\\/\\/i.ibb.co\\/gLJ2f5vT\\/6a1e41c1f3c6.jpg\"]', 'Kinarasa', 'kue balok', 'Jl. Trengguli No. 75 Kel. Oro Oro Ombo', 'Oro-Oro Ombo', 'Kartoharjo', 'Madiun', 'Kuliner', '2022', 'Mikro', '8000000', 'Tidak', '[\"Lainnya\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\",\"Regional (Antar Provinsi\\/Nasional)\"]', 2, 2, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Penjualan lebih banyak dan usaha semakin dikenal dan berkembang', 'Usaha semakin berkembang dan lebih di kenal banyak orang', 0, '2026-08-12 04:12:27', '2026-08-12 04:12:27', NULL),
(45, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'ANA ARUM SARI', '3577025909840001', 'Belum (Bersedia)', 'anaarumsari.aas@gmail.com', '082140677179', 'Perempuan', '1984-09-19', 'https://i.ibb.co/4R5tGQxb/689d2c4de656.jpg', '[\"https:\\/\\/i.ibb.co\\/ZpfnyVhn\\/61813330a8ef.jpg\",\"https:\\/\\/i.ibb.co\\/rKMVN2mG\\/03c564294080.jpg\",\"https:\\/\\/i.ibb.co\\/vxZxH7d8\\/8054c29c83aa.jpg\"]', 'DEAR COFFEE', 'Minuman kopi susu kekinian dan basic kopi', 'JL. GAMBIR SAWIT NO. 43 RT. 13 RW. 5', 'Sogaten', 'Manguharjo', 'Madiun', 'Kuliner', '2026', 'Mikro', '1500000', 'Tidak', '[\"Penjualan sepi\",\"Marketing kurang efektif\"]', '[\"Offline (toko)\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Sertifikasi dan ijin usaha yang dapat meyakinkan pelanggan dan lebih meningkatkan omzet sehingga dapat membuka lowongan kerja', 'Omzet naik 2x lipat dan punya karyawan', 0, '2026-08-13 01:50:48', '2026-08-13 01:50:48', NULL),
(46, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'ari kadarmaji', '3577030502710003', 'Belum (Bersedia)', 'akadarmaji@gmail.com', '085645740671', 'Laki-laki', '1971-02-05', 'https://i.ibb.co/hFCDpV8y/f67cc6108ada.jpg', '[\"https:\\/\\/i.ibb.co\\/9kRy2mYn\\/273fc98e1372.jpg\",\"https:\\/\\/i.ibb.co\\/JWNQCwvY\\/48915cc62f6c.jpg\"]', 'Happy Mood', 'Dimsum', 'Jl. Slamet Riadi 26 Kota Madiun', 'Klegen', 'Kartoharjo', 'Madiun', 'Kuliner', '2022', 'Mikro', '0', 'Tidak', '[\"Penjualan sepi\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\",\"Regional (Antar Provinsi\\/Nasional)\"]', 2, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'ingin jualan llaris di offline dan online', 'jualan laris dan berkembang', 0, '2026-08-13 03:30:20', '2026-08-13 03:30:20', NULL),
(47, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Enggar Lestari Rahayu', '3577037006820002', '0209210002268', 'enggar_lestari@ymail.com', '085732229652', 'Perempuan', '1982-06-30', 'https://i.ibb.co/v6GHGbGf/b85519755349.jpg', '[\"https:\\/\\/i.ibb.co\\/hxWYcFh0\\/2510f61fbef6.jpg\",\"https:\\/\\/i.ibb.co\\/cf48Lj2\\/fcedeee21c4b.jpg\",\"https:\\/\\/i.ibb.co\\/QBVT7s4\\/7c3e2b2aae8e.jpg\"]', 'Sauchasweets Cakes n cookies', 'Aneka kue dan kukis', 'Jl. Tawang Baru, RT 09/RW 02', 'Tawangrejo', 'Kartoharjo', 'Madiun', 'Kuliner', '2014', 'Mikro', '500000', 'Musiman', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\"]', '[\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Usaha bisa lebih berkembang dan omset menjadi meningkat', 'Memiliki sebuah mini bakery dan kedai kopi di teras depan garasi rumah', 0, '2026-08-13 06:06:57', '2026-08-13 06:06:57', NULL),
(48, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'HUSEIN ABDILLAH', '3577032104020004', 'Belum (Bersedia)', 'huseinabdillah4@gmail.com', '085748188404', 'Laki-laki', '2002-04-21', 'https://i.ibb.co/TMFP0BDX/329684172238.jpg', '[\"https:\\/\\/i.ibb.co\\/Rp53jjg5\\/ab8962eca1bf.jpg\",\"https:\\/\\/i.ibb.co\\/Rpn1nb47\\/b80af83fb6cc.jpg\",\"https:\\/\\/i.ibb.co\\/1YvrLdcr\\/2f9ec9b8fa75.jpg\"]', 'Kedai Sempulur', 'Kopi', 'Jl. Pepaya No. 53-A Kota Madiun', 'Taman', 'Taman', 'Madiun', 'Kuliner', '2026', 'Mikro', '1100000', 'Ya', '[\"Penjualan sepi\",\"Modal terbatas\"]', '[\"Offline (toko)\",\"Instagram\"]', '[]', 0, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Sharing pengalaman sesama pelaku usaha yang sama. Serta dapat mengimplementasikan materi yang diberikan.', 'Sustainable', 0, '2026-08-13 06:30:11', '2026-08-13 06:30:11', NULL),
(49, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Mochamad Arif Budi witjaksono', '3578082904770003', '2909250041801', 'mochamad.arif.budi78@gmail.com', '081358918818', 'Laki-laki', '1977-04-29', 'https://i.ibb.co/fdChjpt0/d98fb83a258c.jpg', '[\"https:\\/\\/i.ibb.co\\/4nZY4TFq\\/53e051d65c08.jpg\",\"https:\\/\\/i.ibb.co\\/3yNg0ggf\\/2a22ccf3b8de.jpg\",\"https:\\/\\/i.ibb.co\\/TxZTSrm1\\/9d8a49547389.jpg\"]', 'Tumbas Coffee', 'Kopi susu', 'Prambanan 23', 'Madiun Lor', 'Manguharjo', 'Madiun', 'Kuliner', '2025', 'Kecil', '500000', 'Tidak', '[\"Penjualan sepi\",\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\",\"Marketplace\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Bisa menambah ilmu dalam pembuatan coffe dan menambah kawan', 'Target penjualan KLO bisa bertambah dari 3 cup perhari bisa mencapai >100 cup/hari.serta bisa menambah varian menu coffee', 0, '2026-08-13 06:39:42', '2026-08-13 06:39:42', NULL),
(50, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Dyan Hira kuncahyowati', '3204094809770003', '1609210056042', 'hiradyan77@gmail.com', '085735148242', 'Perempuan', '1977-09-08', 'https://i.ibb.co/fzLNf7r6/dac164b3f370.jpg', '[\"https:\\/\\/i.ibb.co\\/KzzscXfh\\/a98c44e5eb40.jpg\",\"https:\\/\\/i.ibb.co\\/TDZC8n5W\\/1ea481e5269f.jpg\",\"https:\\/\\/i.ibb.co\\/zhkmZQR7\\/e2d364fdb13a.jpg\"]', 'UMIKO BAKERY MADIUN', 'Bolen, flossroll abon, aneka pastry n roti', 'Jl Ploso GG 1 no 52 Oro Oro Ombo Kartoharjo kota Madiun', 'Oro-Oro Ombo', 'Kartoharjo', 'Madiun', 'Kuliner', '2017', 'Mikro', '5000000', 'Ya', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"SDM kurang\"]', '[\"WhatsApp\",\"Instagram\",\"Website\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 2, 2, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Bisa meningkatkan penjualan', 'Menambah omzet', 0, '2026-08-13 06:42:51', '2026-08-13 06:42:51', NULL),
(51, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Mochamad Arif Budi witjaksono', '3578082904770003', '2909250041801', 'mochamad.arif.budi78@gmail.com', '081358918818', 'Laki-laki', '1977-04-29', 'https://i.ibb.co/tpz9mncf/1cd9b9a7183a.jpg', '[\"https:\\/\\/i.ibb.co\\/LdYb2kGF\\/99df358c8d89.png\",\"https:\\/\\/i.ibb.co\\/SDCmBtMp\\/1a37af9fc21a.jpg\",\"https:\\/\\/i.ibb.co\\/ks7nGX4t\\/5a6b7ff5c52f.jpg\"]', 'Tumbas Coffee', 'Kopi susu', 'Prambanan 23', 'Madiun Lor', 'Manguharjo', 'Madiun', 'Kuliner', '2025', 'Kecil', '500000', 'Tidak', '[\"Penjualan sepi\",\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\",\"Marketplace\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Bisa menambah ilmu dalam pembuatan coffee serta menambah menu varian dalam jualan dan menambah kawan', 'Bisa membeli mesin ekspresso serta bisa meningkatkan jumlah penjualan dalam sehari', 0, '2026-08-13 06:48:51', '2026-08-13 06:48:51', NULL),
(52, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'ANTON E PRASETYO', '3577031104860001', 'Belum (Bersedia)', 'omanprasetyo626@gmail.com', '083175610385', 'Laki-laki', '1986-04-11', 'https://i.ibb.co/3mWvkw47/ef1123a0f816.jpg', NULL, 'Oman Tea&Co', 'Minuman Kopi dan Teh', 'Jl. Joiranan no. 9B', 'Mojorejo', 'Taman', 'Madiun', 'Kuliner', '2026', 'Mikro', '300000', 'Tidak', '[\"Modal terbatas\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Semoga bisa buka Coffee Shop di tempat strategis', 'Menambah income bulanan', 0, '2026-08-13 07:24:13', '2026-08-13 07:24:13', NULL),
(53, 'Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare', 'Chofifah Fitriana', '2171105508849010', 'Belum (Bersedia)', 'chofifahfitriana373@gmail.com', '081536307031', 'Perempuan', '1984-08-15', 'https://i.ibb.co/LDbsP9Jw/4772fbc710ef.jpg', '[\"https:\\/\\/i.ibb.co\\/nqHz0d5N\\/80f2dca3ec52.jpg\",\"https:\\/\\/i.ibb.co\\/vCx3Njyj\\/642eb4723538.jpg\",\"https:\\/\\/i.ibb.co\\/WvSmcyH7\\/ec32123818e7.jpg\"]', 'Lempeng Huda', 'Lempeng', 'Jl.Merpati gang derkuku no 47b', 'Nambangan Lor', 'Manguharjo', 'Madiun', 'Kuliner', '2018', 'Kecil', '1200000', 'Ya', '[\"Lainnya\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Penjualan lebih luas lagi n lebih rame', 'Omset naik n menambah reseller', 0, '2026-08-13 08:23:16', '2026-08-13 08:23:16', NULL),
(54, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Anton Sulistyo Irawan, S.E.', '3577032607800001', '2807250116441', 'letterforanton@gmail.com', '085104477977', 'Laki-laki', '1980-07-26', 'https://i.ibb.co/ZRbnvwr9/70d379ef6818.jpg', '[\"https:\\/\\/i.ibb.co\\/1YmrZDJG\\/9384ea1db975.jpg\",\"https:\\/\\/i.ibb.co\\/MDXPMY1x\\/8c021c21ea51.jpg\",\"https:\\/\\/i.ibb.co\\/2YFVVd9K\\/7c2929e24144.jpg\"]', 'Kopi Seduhlur, by FoodLab', 'Kopi seduh dan telur. Rencananya menambah lini usaha di roastery dan produksi sirup.', 'Jl. Mastrip, Ruko Pasar Mojorejo No. 22', 'Mojorejo', 'Taman', 'Madiun', 'Kuliner', '2026', 'Mikro', '3500000', 'Ya', '[\"Modal terbatas\",\"SDM kurang\",\"Lainnya\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\",\"Marketplace\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\",\"Regional (Antar Provinsi\\/Nasional)\"]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Bisa membangun sistem dan training karyawan. Karena sedang bersiap ekspansi ke dalam maupun beberapa kota.', 'Menguasai sampai ke teknik roastery, menguasai jalur suppliet syrup dengan basis glucose, serta expansi brand keluar kota, dibantu teman2 distributor, dengan Madiun sebagai centernya, dan makanan nastel sebagai main signature nya.', 0, '2026-08-13 10:06:47', '2026-08-13 10:06:47', NULL),
(55, 'Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare', 'Anton Sulistyo Irawan, S.E.', '3577032607800001', '2807250116441', 'letterforanton@gmail.com', '085104477977', 'Laki-laki', '1980-07-26', 'https://i.ibb.co/ZRbnvwr9/70d379ef6818.jpg', '[\"https:\\/\\/i.ibb.co\\/SX2PX747\\/fabf47351af1.jpg\",\"https:\\/\\/i.ibb.co\\/1YmrZDJG\\/9384ea1db975.jpg\",\"https:\\/\\/i.ibb.co\\/BK50js9R\\/b522a32d8de5.jpg\"]', 'Kopi Seduhlur, by FoodLab', 'Kopi seduh dan telur. Rencananya menambah lini usaha di roastery dan produksi sirup.', 'Jl. Mastrip, Ruko Pasar Mojorejo No. 22.', 'Mojorejo', 'Taman', 'Madiun', 'Kuliner', '2026', 'Mikro', '3500000', 'Ya', '[\"Modal terbatas\",\"SDM kurang\",\"Lainnya\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\",\"Marketplace\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\",\"Regional (Antar Provinsi\\/Nasional)\"]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Membuka jalur franchise brand dengan Madiun sebagai centernya, dan memproduksi sendiri sirup2 utk minuman.', 'Membuka roastery dan produksi sirup. Terutama sirup2 untuk base kopi.', 0, '2026-08-13 10:13:47', '2026-08-13 10:13:47', NULL),
(56, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'DENI SATRIA PUTRA', '3577032712040001', 'Belum (Bersedia)', 'akui17534@gmail.com', '081990923728', 'Laki-laki', '2004-12-27', 'https://i.ibb.co/99zQZcqn/2c2cd4d0834e.jpg', '[\"https:\\/\\/i.ibb.co\\/7dV59wYp\\/dcfb89ead0fe.jpg\"]', 'swargacoffe', 'kopi susu botolan', 'Jl.Banjawaru kota madiun', 'Banjarejo', 'Taman', 'Madiun', 'Kuliner', '2026', 'Kecil', '500000', 'Ya', '[\"Modal terbatas\"]', '[\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'ingin produk saya dikenal banyak orang dan disukai semua kalangan', 'bisa buka kedai sendiri', 0, '2026-08-13 12:29:11', '2026-08-13 12:29:11', NULL),
(57, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Alvian surya adi cahya', '3501072010950001', '2601220039406', 'alvianzuto22@gmail.com', '082139079095', 'Laki-laki', '1995-10-20', 'https://i.ibb.co/R4Hy0tnC/ac4b81eccc11.jpg', '[\"https:\\/\\/i.ibb.co\\/DgtXtC92\\/63eb00e65f90.jpg\",\"https:\\/\\/i.ibb.co\\/8FQwzQB\\/1f31a9813792.jpg\"]', 'TOYIBAH KOPI', 'Kopi', 'Jl gegono manis 5 no:8 manisrejo, taman, madiun kota', 'Manisrejo', 'Taman', 'Madiun', 'Kuliner', '2021', 'Mikro', '500000', 'Ya', '[\"Modal terbatas\",\"Lainnya\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Laris manis', 'Produksi meningkat, punya outlet', 0, '2026-08-13 14:15:34', '2026-08-13 14:15:34', NULL),
(58, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Andhika Ali Mustafa', '3519040603060004', 'Belum (Bersedia)', 'andhikaalimustafa@gmail.com', '087855688304', 'Laki-laki', '2006-03-06', 'https://i.ibb.co/p6G3G7m6/d54b29ebfc4f.jpg', '[\"https:\\/\\/i.ibb.co\\/MDRjJLP3\\/5badb4a0b0f8.jpg\"]', '-', 'Kopi', '-', 'Oro-Oro Ombo', 'Kartoharjo', 'Madiun', 'Jasa', '00000', 'Mikro', '0', 'Tidak', '[\"Lainnya\"]', '[]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'bisa buka coffeshop sendiri', 'belajar skill barista lebih mendalam', 0, '2026-08-13 20:21:21', '2026-08-13 20:21:21', NULL),
(59, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Muhamad Noval', '3577012505020007', 'Belum (Bersedia)', 'masknopal25@gmail.com', '085536877898', 'Laki-laki', '2026-08-14', 'https://i.ibb.co/1t88CVkK/7db92702819b.png', '[\"https:\\/\\/i.ibb.co\\/pv29x0tK\\/29c83c9ba8d3.png\"]', 'YourCoffe', 'Minuman Coffe & Non-Coffe', 'Jl.Bhakti Wijaya No.25 Kel.Klegen Kec.Kartoharjo Kota Madiun', 'Klegen', 'Kartoharjo', 'Madiun', 'Kuliner', '2025', 'Menengah', '10000000', 'Ya', '[\"Marketing kurang efektif\"]', '[\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 6, 0, 'Mandiri', 'Sudah aktif', 'Belum', 'Usaha menjadi lebih ramai', 'Masyarakat dapat mengetahui bahwa YourCoffe itu merupakan usaha coffeshop yang memiliki rasa yang nikmat dan tempat yang sangat nyaman,bersih, dan cozy.', 0, '2026-08-14 00:13:49', '2026-08-14 00:13:49', NULL),
(60, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'NOVIAWAN ROBY PRATAMA', '3577020111920004', 'Belum (Bersedia)', '21noviawanroby@gmail.com', '08121608069', 'Laki-laki', '1992-11-01', 'https://i.ibb.co/ymgyCf7z/b08ce4e9d70b.jpg', NULL, 'Cafe Borobudur', 'Kopi dan caffe shop', 'Jl Borobudur gang 4 no 88 Kel Madiun Lor Kec Manguharjo Kota Madiun', 'Madiun Lor', 'Manguharjo', 'Madiun', 'Kuliner', '2026', 'Menengah', '2000000', 'Musiman', '[\"SDM kurang\"]', '[\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Harapan saya agar bisa buka coffe shop', 'Cuan cuan cuan', 0, '2026-08-14 01:24:32', '2026-08-14 01:24:32', NULL),
(61, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Anggriono Setiawan', '3577020207800003', '2011230107947', 'shintasetyowati77@gmail.com', '08118333295', 'Laki-laki', '1980-07-02', 'https://i.ibb.co/V0k7Zrb6/cea52cb38821.jpg', '[\"https:\\/\\/i.ibb.co\\/bjfSRWtw\\/784959548cb2.jpg\"]', 'Kedai KopiKen', 'Minuman', 'Taman lalu lintas Bantaran Kota Madiun', 'Madiun Lor', 'Manguharjo', 'Madiun', 'Kuliner', '2026', 'Kecil', '25000000', 'Ya', '[\"SDM kurang\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah aktif', 'Belum', 'Usaha semakin berkembang', 'Penambahan lokasi usaha', 0, '2026-08-14 01:38:59', '2026-08-14 01:38:59', NULL),
(62, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Vino munif ardianto', '3321013011840006', '2002250019569', 'vinomunifardianto@gmail.com', '087829633357', 'Laki-laki', '1984-11-30', 'https://i.ibb.co/twRHZDKz/e2bf911536b2.jpg', NULL, 'Prima rasa ae', 'Rica paru', 'Perum BWI 2 blok B 12a', 'Manguharjo', 'Manguharjo', 'Madiun', 'Kuliner', '2020', 'Mikro', '3000000', 'Ya', '[\"Modal terbatas\"]', '[\"WhatsApp\"]', '[]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Memperluas pemasaran', 'Omzet naik 10x\r\nPemasangan lambat luas', 0, '2026-08-14 04:15:18', '2026-08-14 04:15:18', NULL),
(63, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Chornelius Indra Wijaya', '3507251107010005', 'Belum (Bersedia)', 'kuunindra@gmail.com', '08990066787', 'Laki-laki', '2001-07-11', 'https://i.ibb.co/bRPdvVZK/db7f7d6dd95c.jpg', NULL, 'Medika Merpati', 'Obat', 'Jl. Ruko Merpati No 22', 'Nambangan Lor', 'Manguharjo', 'Madiun', 'Jasa', '2026', 'Menengah', '5000000', 'Musiman', '[\"Penjualan sepi\",\"SDM kurang\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 3, 0, 'Mandiri', 'Belum', 'Belum', 'Ingin Membuka usaha di bidang kopi sendiri', 'Membuka usaha di bidang kopi', 0, '2026-08-14 06:03:50', '2026-08-14 06:03:50', NULL),
(64, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Muhamad Al Fatih', '3577030508970002', 'Belum (Bersedia)', 'alfmuhamad05@gmail.com', '085895142784', 'Laki-laki', '1997-08-05', 'https://i.ibb.co/YFgxmR0Y/948b0a58dcee.jpg', '[\"https:\\/\\/i.ibb.co\\/8Hs6Hy5\\/68103f598b0a.jpg\",\"https:\\/\\/i.ibb.co\\/mVsscrW4\\/cb50470f1ea8.jpg\",\"https:\\/\\/i.ibb.co\\/XxMMXLn9\\/9adad88d25d7.jpg\"]', 'Kopi Saujana', 'Kopi', 'Jl.Taman Praja Depan STIKES', 'Pandean', 'Taman', 'Madiun', 'Kuliner', '2023', 'Menengah', '18000000', 'Ya', '[\"Modal terbatas\",\"Produksi terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 3, 2, 'Mandiri', 'Sudah aktif', 'Belum', 'ingin menjangkau pembeli secara luas, misalnya se karesidenan madiun', 'Menambah jumlah titik outlet', 0, '2026-08-14 07:33:23', '2026-08-14 07:33:23', NULL),
(65, 'Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare', 'Nur Habibah salam', '3577034304950004', '0701250013275', 'nurhabibahsalam03@gmail.com', '083122011291', 'Perempuan', '1995-04-03', 'https://i.ibb.co/N2xQwDNc/c1d6e810bce2.jpg', '[\"https:\\/\\/i.ibb.co\\/s9gfGywG\\/8129764b2ba6.jpg\"]', 'Pentol goreng', 'Pentol goreng isi puyuh,sosis', 'Jalan setia Budi no.89d', 'Mojorejo', 'Taman', 'Madiun', 'Kuliner', '2025', 'Kecil', '200000', 'Ya', '[\"Modal terbatas\"]', '[\"Offline (toko)\"]', '[]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Ingin bisa berjualan online agar orang bisa membeli lewat online', 'Semoga bisa maju terus', 0, '2026-08-14 08:18:41', '2026-08-14 08:18:41', NULL),
(66, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'GABRIELLE LETY CLEARESTA', '3577035907030003', '2808210002933', 'gabriellelety19@gmail.com', '085712734045', 'Perempuan', '2003-07-19', 'https://i.ibb.co/mrnBQRc7/c1c4a2002437.jpg', '[\"https:\\/\\/i.ibb.co\\/14b9BLs\\/b5dfd37a2f0c.jpg\",\"https:\\/\\/i.ibb.co\\/3YydgVpR\\/b774b3fa055e.jpg\",\"https:\\/\\/i.ibb.co\\/fz36tt0q\\/d0cb672cce72.jpg\"]', 'BEE’S', 'Layers Cake, Zuppa Soup, Kue Kering Lebaran, Donat, Croissant, Roti Manis', 'Jl. Pucang Arum No.9 RT.15/RW.05\r\nKecamatan Taman, Kelurahan Manisrejo, Kota Madiun', 'Manisrejo', 'Taman', 'Madiun', 'Kuliner', '2019', 'Menengah', '5000000', 'Ya', '[\"Lainnya\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\",\"Regional (Antar Provinsi\\/Nasional)\"]', 2, 2, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Bisa memperluas penjualan lebih safety dengan sertifikat halal', 'omzet naik 2x lipat', 0, '2026-08-14 11:23:26', '2026-08-14 11:23:26', NULL),
(67, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Elvian Tri Windrarti', '3577036506720003', '0611240017335', 'elvianomar72@gmail.com', '082131349994', 'Perempuan', '1972-06-25', 'https://i.ibb.co/fddRXFTR/dc16e14633e1.jpg', '[\"https:\\/\\/i.ibb.co\\/cSYdkGZp\\/a85f59cba6e9.jpg\"]', 'Omah Bu Tri', 'Makanan dan masakan olahan', 'Perum Bumi Mas III Blok III No.06', 'Mojorejo', 'Taman', 'Madiun', 'Kuliner', '2024', 'Mikro', '500000', 'Musiman', '[\"Penjualan sepi\"]', '[\"Offline (toko)\",\"Instagram\"]', '[\"Regional (Antar Provinsi\\/Nasional)\"]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Ingin bisa menjual produk di berbagai platform digital dan memperluas relasi', 'Omzet naik 2x', 0, '2026-08-16 07:07:18', '2026-08-16 07:07:18', NULL),
(68, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Lilik Widiawati', '3577026312750002', '1710210005475', 'm.widya.hendra75@gmail.com', '081217133836', 'Perempuan', '1975-12-23', 'https://i.ibb.co/QGCk6jq/42fd434e4044.jpg', '[\"https:\\/\\/i.ibb.co\\/gMxt7PLD\\/a406600339bf.jpg\",\"https:\\/\\/i.ibb.co\\/MDQbzyHZ\\/beba6e4b5b91.jpg\",\"https:\\/\\/i.ibb.co\\/39Y1Mk8f\\/2e1a093b4004.jpg\"]', 'WMH Batik', 'Batik tulis dan cap', 'Jl. Gajah Mada 21 Madiun', 'Winongo', 'Manguharjo', 'Madiun', 'Kriya', '2018', 'Kecil', '4000000', 'Ya', '[\"Modal terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\",\"Marketplace\"]', '[\"Regional (Antar Provinsi\\/Nasional)\"]', 2, 2, 'Mandiri', 'Sudah aktif', 'Pernah', 'Meningkatkan value dan penjualan pada produk', 'Value dan income bertambah', 0, '2026-08-18 01:49:12', '2026-08-18 01:49:12', NULL),
(69, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Veronika Dwi Sulistiyani', '3577035407710003', '9120006611071', 'veronikads1971@gmail.com', '085124255339', 'Perempuan', '1971-07-14', 'https://i.ibb.co/pvV3mhVN/4f2401a7eb3c.jpg', '[\"https:\\/\\/i.ibb.co\\/v6ZrfnZ1\\/28c103f4a47c.jpg\",\"https:\\/\\/i.ibb.co\\/m5gFScBs\\/8ca8223a5a2c.jpg\",\"https:\\/\\/i.ibb.co\\/n8zZvxY2\\/5c0003b7a87a.jpg\"]', 'Aveilla Batik', 'Kain ,fashion ,craft batik', 'Jl.Candi Boko No.9 Rt.07 Rw.02 Patihan', 'Patihan', 'Manguharjo', 'Madiun', 'Fashion', '2012', 'Mikro', '40000000', 'Tidak', '[\"Marketing kurang efektif\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\",\"Marketplace\"]', '[\"Regional (Antar Provinsi\\/Nasional)\"]', 2, 2, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Mengembangakan usaha batik n fashion', 'Meningkatkan produksi dg motif yg lebih variatif dan bagus', 0, '2026-08-18 01:50:00', '2026-08-18 01:50:00', NULL),
(70, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'SITI ROWIYAH', '3577036911730002', '0203230011455', 'srowiyah382@gmail.com', '082143385379', 'Perempuan', '2026-11-29', 'https://i.ibb.co/FkyPMHZp/a98cd9ec6a16.jpg', '[\"https:\\/\\/i.ibb.co\\/zh3j2yY3\\/926ec6be53a7.jpg\",\"https:\\/\\/i.ibb.co\\/RTBBCTQt\\/9e8ce870c1bf.jpg\",\"https:\\/\\/i.ibb.co\\/N6CkRYMn\\/02502ec2748f.jpg\"]', 'Fortuna 73', 'Batik tulis dan batik cap', 'Perum Griya Persada Asri no A.11 jl.koperasi RT 12 RW 04 Kel.Banjarejo kec Taman kota Madiun', 'Banjarejo', 'Taman', 'Madiun', 'Kriya', '2011', 'Mikro', '250', 'Ya', '[\"Modal terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 2, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Ingin bisa mendesain batik kota Madiun yg lebih estetik lgi', 'Menambah omzet', 0, '2026-08-18 01:50:44', '2026-08-18 01:50:44', NULL);
INSERT INTO `registrasi_pelatihan` (`id`, `nama_kegiatan`, `nama_lengkap`, `nik`, `nib`, `email`, `whatsapp`, `jenis_kelamin`, `tanggal_lahir`, `foto_ktp`, `foto_produk`, `nama_usaha`, `produk_diproduksi`, `alamat_usaha`, `kelurahan`, `kecamatan`, `kota`, `jenis_usaha`, `tahun_mulai`, `skala_usaha`, `omzet_bulanan`, `stabilitas_omzet`, `tantangan_usaha`, `media_penjualan`, `cakupan_pemasaran`, `karyawan_tetap`, `karyawan_tidak_tetap`, `sistem_usaha`, `level_digital`, `pernah_pelatihan`, `harapan_pelatihan`, `target_6_bulan`, `is_lolos`, `created_at`, `updated_at`, `deleted_at`) VALUES
(71, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Septy Kusumawardani', '3577034409720002', '0511210000879', 'mbaksepti77@gmail.com', '085336947438', 'Perempuan', '1972-09-04', 'https://i.ibb.co/q3hwnjjt/4f0a011ea047.jpg', '[\"https:\\/\\/i.ibb.co\\/fdNt9vGc\\/80ad0017a2b8.jpg\",\"https:\\/\\/i.ibb.co\\/v4pqpryh\\/0e3aaf9f2c9d.jpg\",\"https:\\/\\/i.ibb.co\\/Fk5LD7PN\\/a36136566e91.jpg\"]', 'Deyfa batik', 'Batik tulis,cap,kombinasi cap tulis', 'Jl.Pagu Indah 6 no 6 Manisrejo Taman Madiun', 'Manisrejo', 'Taman', 'Madiun', 'Fashion', '2020', 'Mikro', '2000000', 'Ya', '[\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\",\"Regional (Antar Provinsi\\/Nasional)\"]', 1, 1, 'Mandiri', 'Belum', 'Pernah', 'Bisa meningkatkan skill sehingga menghasilkan produk yang lebih baik,unik dengan ide desain kreatif untuk meningkatkan omset', 'Menambah omset penjualan', 0, '2026-08-18 01:52:30', '2026-08-18 01:52:30', NULL),
(72, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Helda Tri Habsari', '3577035801840003', '1505240026057', 'soethinkseraphim@gmail.com', '082132083171', 'Perempuan', '1984-01-18', 'https://i.ibb.co/PG25nzrq/e4cb92c0f38d.jpg', '[\"https:\\/\\/i.ibb.co\\/RT36Rgzt\\/7072df03e817.jpg\"]', 'Batik Habsari', 'Kain Batik Tulis', 'Perum Widodo Kencana Indah 1 blok H3 Madiun', 'Pandean', 'Taman', 'Madiun', 'Kriya', '2018', 'Mikro', '500000', 'Musiman', '[\"Produksi terbatas\"]', '[\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\",\"Regional (Antar Provinsi\\/Nasional)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Lebih memperdalam skill produksi batik tulis', 'Menambah produksi dan penjualan', 0, '2026-08-18 01:52:34', '2026-08-18 01:52:34', NULL),
(73, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Eny Mujayanah', '3577015903770002', '1509210044936', 'enymujayanah.2021@gmail.com', '081335817372', 'Perempuan', '1977-03-19', 'https://i.ibb.co/rRLKwqNp/7368955fdba1.jpg', '[\"https:\\/\\/i.ibb.co\\/N2VV7Pjk\\/244caab59034.jpg\",\"https:\\/\\/i.ibb.co\\/0jrt4GTp\\/7b7bac3e3fdf.jpg\",\"https:\\/\\/i.ibb.co\\/1x0kQSd\\/5e9ca2eb14ef.jpg\"]', 'Batik Aruny', 'Batik tulis, cap, ciprat', 'Jalan Masjid 3C RT 22 RW 5 Kota Madiun', 'Kanigoro', 'Kartoharjo', 'Madiun', 'Kriya', '2019', 'Mikro', '3000000', 'Ya', '[\"Modal terbatas\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Untuk meningkatkan skill Agar usaha semakin maju dan berkembang', 'Usaha maju dan omzet naik 5x lipat', 0, '2026-08-18 01:52:41', '2026-08-18 01:52:41', NULL),
(74, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Ratna Sugiarti Sukati Putri', '3577015910820001', '2110210026605', 'chana2stars@gmail.com', '087753831122', 'Perempuan', '1982-10-19', 'https://i.ibb.co/4nD7kBf2/4935c4aa2f07.jpg', '[\"https:\\/\\/i.ibb.co\\/XfJT56cs\\/c68377543f69.jpg\"]', 'Batik Ndalem Nusantara', 'Kain batik', 'Jl.Nusantara no.6b', 'Klegen', 'Kartoharjo', 'Madiun', 'Fashion', '2023', 'Mikro', '300000', 'Tidak', '[\"Penjualan sepi\",\"Modal terbatas\",\"Produksi terbatas\"]', '[\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Mendapatkan banyak orderan', 'Omset naik', 0, '2026-08-18 01:53:31', '2026-08-18 01:53:31', NULL),
(75, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'wiwin panorama', '3518146907770001', '1109210033467', 'win.panoramabatik@gmail.com', '085604148600', 'Perempuan', '1977-07-29', 'https://i.ibb.co/WvztL6Td/a9baa71fa098.jpg', '[\"https:\\/\\/i.ibb.co\\/4wd40Nr3\\/ec907ad9716f.jpg\",\"https:\\/\\/i.ibb.co\\/MxWSfN0r\\/b39e62d58ff8.jpg\",\"https:\\/\\/i.ibb.co\\/Qj3hf9rF\\/679ef00c5e65.jpg\"]', 'Panorama', 'Batik tulis, cap, kombinasi, ecoprint, shibory ciprat craf', 'Perum panorama wilis blok a no 23 rt 55 re 18', 'Pandean', 'Taman', 'Madiun', 'Kriya', '2013', 'Mikro', '3500000', 'Ya', '[]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\",\"Website\"]', '[\"Regional (Antar Provinsi\\/Nasional)\"]', 2, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Menambah variasi utk motif batik', 'Omset rp 10.000.000 per bulan', 0, '2026-08-18 01:55:54', '2026-08-18 01:55:54', NULL),
(76, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Wiwik Mariyati', '3577014501740003', '0210000902584', 'wiwikmariyati0501@gmail.com', '085732842848', 'Perempuan', '1974-01-05', 'https://i.ibb.co/6cLKrQDy/079563835a19.jpg', '[\"https:\\/\\/i.ibb.co\\/twkgbBmh\\/a8f78e126574.jpg\",\"https:\\/\\/i.ibb.co\\/MDPb20qg\\/3aefc4fb2bd3.jpg\",\"https:\\/\\/i.ibb.co\\/0Vcyqgpp\\/d70f784f4b3e.jpg\"]', 'Batik Dewi anggraini', 'Kain batik', 'Jl Gambir sawit selatan no 27 kelurahan sogaten', 'Sogaten', 'Manguharjo', 'Madiun', 'Fashion', '2015', 'Mikro', '2000000', 'Ya', '[\"Penjualan sepi\",\"Marketing kurang efektif\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 2, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Mampu meningkatkan mutu produk', 'Membuat produk pakaian jadi dan tas batik atau craf dari batik', 0, '2026-08-18 02:20:07', '2026-08-18 02:20:07', NULL),
(77, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Dina Aryati', '3577024308810002', '1406220028406', 'dinaaryati99@gmail.com', '085235790579', 'Perempuan', '1981-08-03', 'https://i.ibb.co/3ysryHFH/330ef2ccb978.jpg', '[\"https:\\/\\/i.ibb.co\\/wN1Wy1bm\\/35a152d84797.jpg\",\"https:\\/\\/i.ibb.co\\/Y7gkHdbr\\/4f167db2e5c3.jpg\",\"https:\\/\\/i.ibb.co\\/fYxZRs3s\\/cd969e6687ed.jpg\"]', 'Batik tulis nurdina', 'Batik tulis dan cap', 'Jl. Mj. sungkono gg. perkutut no.16b Rw.12 Rt.51', 'Nambangan Lor', 'Manguharjo', 'Madiun', 'Kerajinan', '2012', 'Mikro', '1000000', 'Tidak', '[\"Penjualan sepi\",\"Modal terbatas\",\"Lainnya\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 2, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Ingin jangkauan penjualan lebih luas dan lebih bisa bersaing dengan produk yang lain', 'Menambah karyawan dan memiliki galeri', 0, '2026-08-18 02:21:14', '2026-08-18 02:21:14', '2026-08-18 03:57:04'),
(78, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'SHINTA WIJAYANTI CANDRA WARDHANI', '3577034401870003', '1601250061989', 'shinta.wijayanti04@gmail.com', '085645859956', 'Perempuan', '1987-01-04', 'https://i.ibb.co/hxT48fVn/5cfe94df7458.jpg', '[\"https:\\/\\/i.ibb.co\\/mVQRHKXP\\/0ab67722d058.jpg\"]', 'MEGANUSA', 'Batik', 'Jl. Mangga no.63', 'Kejuron', 'Taman', 'Madiun', 'Kriya', '2024', 'Mikro', '1050000', 'Musiman', '[\"Produksi terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\",\"Website\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\",\"Regional (Antar Provinsi\\/Nasional)\"]', 0, 0, 'Mandiri', 'Sudah aktif', 'Belum', 'ingin mendapatkan ilmu yang berhubungan dengan batik seperti cara design / pola yg benar dan hasilnya bisa menarik customer dengan begitu bisa meningkatkan kualitas usaha diri', 'menambah customer baru + omzet, bisa memproduksi banyak jenis pola batik yang lagi diminati trend sekarang', 0, '2026-08-18 02:22:14', '2026-08-18 02:22:14', NULL),
(79, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Yuyun yuniati', '3577014606740003', '2701230062891', 'yuyunzeila974@gmail.com', '081234479525', 'Perempuan', '1974-06-06', 'https://i.ibb.co/SXw5k933/96b982d2a262.jpg', '[\"https:\\/\\/i.ibb.co\\/nqG3st6k\\/dc6553939fab.jpg\",\"https:\\/\\/i.ibb.co\\/Kx0LG3Sr\\/c2c88f60e2e6.jpg\",\"https:\\/\\/i.ibb.co\\/V0xDQW22\\/002f1566d99d.jpg\"]', 'Liem\'Tsye Snack& Cookies', 'Kue', 'Jl. Tri Jaya VIII/ 208  RT 033 RW 007 Kel. Klegen Kec. Kartoharjo Kota Madiun', 'Klegen', 'Kartoharjo', 'Madiun', 'Kuliner', '2019', 'Mikro', '300000', 'Musiman', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\"]', '[\"WhatsApp\"]', '[]', 1, 0, 'Mandiri', 'Belum', 'Belum', 'Ingin lebih maju dan bisa mengembangkan usaha sehingga omzet semakin meningkat', 'Omzet naik', 0, '2026-08-18 02:26:48', '2026-08-18 02:26:48', NULL),
(80, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Nada Fairuz Izdihar', '3577034803000004', '1103220004568', 'fairuznada08@gmail.com', '083845701440', 'Perempuan', '2000-03-08', 'https://i.ibb.co/tTt93xmP/a6d6cd1fcf71.jpg', '[\"https:\\/\\/i.ibb.co\\/DPxkLBmw\\/2cb6210369d6.jpg\"]', 'Batik Nadthom', 'Batik tulis', 'Jl Sentul GG IV No 4B', 'Banjarejo', 'Taman', 'Madiun', 'Fashion', '2019', 'Mikro', '2500000', 'Musiman', '[\"Produksi terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 2, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Menghasilkan produk yang lebih baik dan berdaya saing', 'Omzet naik dua kali lipat', 0, '2026-08-18 02:42:27', '2026-08-18 02:42:27', NULL),
(81, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'SLAMET', '3577020508720001', '2704220022874', 'castifaslamet@gmail.com', '085648695229', 'Laki-laki', '1972-08-05', 'https://i.ibb.co/kgWs8PDc/7394ee540a3c.jpg', '[\"https:\\/\\/i.ibb.co\\/pr1QkC4q\\/6b0cc0ebf65a.jpg\"]', 'BATIK PINCOEK', 'Batik tulis', 'Jln. Merpati no.47B', 'Nambangan Lor', 'Manguharjo', 'Madiun', 'Kerajinan', '2014', 'Mikro', '800000', 'Musiman', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 4, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Ingin menjual produk melalui Tiktok, Shopee agar penjualan lebih maksimal', 'Menambah omzet 2x lipat', 0, '2026-08-18 02:42:28', '2026-08-18 02:42:28', NULL),
(82, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Agus Wijanarko', '3577021411790001', '0306250007516', 'sanggarkayonkridakenanga@gmail.com', '081235902190', 'Laki-laki', '1979-11-14', 'https://i.ibb.co/JwQhVLKn/a71a13f8b673.jpg', '[\"https:\\/\\/i.ibb.co\\/nMncDZcP\\/38edf040e234.jpg\",\"https:\\/\\/i.ibb.co\\/sp0dzNRn\\/7509dd285cb6.jpg\",\"https:\\/\\/i.ibb.co\\/zV3d8fJJ\\/3fb3f7c449b9.jpg\"]', 'Sanggar Kayon Krida Kenanga', 'Industri Batik & Kriya Wayang Kulit', 'Jl. Minak Koncar GG. I no 2', 'Winongo', 'Manguharjo', 'Madiun', 'Kriya', '2025', 'Mikro', '500000', 'Musiman', '[\"Produksi terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Memperluas jaringan', 'Peningkatan omset', 0, '2026-08-18 02:43:00', '2026-08-18 02:43:00', NULL),
(83, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Dina Aryati', '3577024308810002', '1406220028406', 'dinaaryati99@gmail.com', '085235790579', 'Perempuan', '1981-08-03', 'https://i.ibb.co/XfdM6Fvd/aa2610b335a9.jpg', '[\"https:\\/\\/i.ibb.co\\/cXg2GmRt\\/5e5d12bc8e77.jpg\",\"https:\\/\\/i.ibb.co\\/C3jLYLnb\\/9db753ad0cea.jpg\",\"https:\\/\\/i.ibb.co\\/PGhnBKmQ\\/0473117e7a59.jpg\"]', 'Batik Tulis Nurdina', 'Batik tulis dan batik cap', 'Jl. Mj. Sungkono Gg. Perkutut No. 16B RT 51 RW 12', 'Nambangan Lor', 'Manguharjo', 'Madiun', 'Kerajinan', '2012', 'Mikro', '1000000', 'Tidak', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 2, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Ingin menjangkau pemasaran lebih luas', 'Menambah karyawan dan memiliki galeri atau butik', 0, '2026-08-18 02:43:12', '2026-08-18 02:43:12', '2026-08-18 03:57:12'),
(84, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Dina Aryati', '3577024308810002', '1406220028406', 'dinaaryati99@gmail.com', '085235790579', 'Perempuan', '1981-08-03', 'https://i.ibb.co/XfdM6Fvd/aa2610b335a9.jpg', '[\"https:\\/\\/i.ibb.co\\/cXg2GmRt\\/5e5d12bc8e77.jpg\",\"https:\\/\\/i.ibb.co\\/C3jLYLnb\\/9db753ad0cea.jpg\",\"https:\\/\\/i.ibb.co\\/PGhnBKmQ\\/0473117e7a59.jpg\"]', 'Batik Tulis Nurdina', 'Batik Tulis dan Batik cap', 'Jl. Mj Sungkono Gg. Perkutut No. 16B RT 51 RW 12', 'Nambangan Lor', 'Manguharjo', 'Madiun', 'Kerajinan', '2012', 'Mikro', '1000000', 'Tidak', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 2, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Ingin memperluas pemasaran dan layak bersaing dengan produk lain', 'Menambah karyawan dan memiliki butik', 0, '2026-08-18 02:48:53', '2026-08-18 02:48:53', NULL),
(85, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'ELY INAYAH', '3577026904710003', '1108210005529', 'elyinayah@gmail.com', '085136026495', 'Perempuan', '1971-04-29', 'https://i.ibb.co/MkjK5Ftg/9d3d80441be9.jpg', '[\"https:\\/\\/ikmjuara.my.id\\/uploads\\/foto_produk\\/1787025784_6a83d97881f18.jpg\"]', 'BATIK RETNO DUMILAH', 'BATIK TULIS', 'JL.Cendrawasih gang pinguin 42 kota madiun', 'Nambangan Lor', 'Manguharjo', 'Madiun', 'Fashion', '2018', 'Kecil', '500000', 'Musiman', '[\"Modal terbatas\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 3, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'UMKM terus terkafer sampai bisa meningkatkan produksi dan pemasaran', 'Tambah omzet penjualan dan meluas', 0, '2026-08-18 04:03:04', '2026-08-18 04:03:04', NULL),
(86, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Sundari', '3577016308680001', '1904220028231', 's19065810@gmail.com', '082116550678', 'Perempuan', '2026-08-23', 'https://i.ibb.co/6RQvXRLb/c4d93952bbd8.jpg', '[\"https:\\/\\/i.ibb.co\\/CptNys8d\\/497899d26349.jpg\",\"https:\\/\\/i.ibb.co\\/s9gdNW85\\/d1c0eeecdec8.jpg\",\"https:\\/\\/i.ibb.co\\/rK24TntZ\\/dc66248f47a5.jpg\"]', 'Batik tulis ndredes', 'Batik tulis', 'Jl Jaya 15b', 'Klegen', 'Kartoharjo', 'Madiun', 'Fashion', '2012', 'Kecil', '500000', 'Tidak', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 1, 'Mandiri', 'Belum', 'Pernah', 'Lebih dikenal produknya', 'Omset bertambah', 0, '2026-08-18 04:17:33', '2026-08-18 04:17:33', NULL),
(87, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'WIJIATI', '3577024605670002', '0411240004628', 'wijiatimadiun@gmail.com', '085335306070', 'Perempuan', '1967-05-06', 'https://i.ibb.co/Z1KScx5N/700b862a1c29.jpg', '[\"https:\\/\\/i.ibb.co\\/20Hxv7ch\\/ae356070558c.jpg\"]', 'Batik tulis Ndima', 'Batik tulis', 'Jl. Walet No. 15', 'Nambangan Kidul', 'Manguharjo', 'Madiun', 'Kriya', '2019', 'Mikro', '2500000', 'Tidak', '[\"Modal terbatas\",\"Produksi terbatas\"]', '[\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Mampu menguasai teknik pembuatan dan eksplorasi desain motif batik khas Kota Madiun', 'Mengembangkan dan merilis minimal 3–5 motif batik khas Kota Madiun', 0, '2026-08-18 04:30:59', '2026-08-18 04:30:59', '2026-08-18 06:03:12'),
(88, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'ALVIO MARCHELLY WINARKO', '3577020103040003', 'Belum (Bersedia)', 'alvioatj@gmail.com', '089630781115', 'Laki-laki', '2004-03-01', 'https://i.ibb.co/v6yR3TfQ/4942f32f6874.jpg', '[\"https:\\/\\/i.ibb.co\\/svMJTvRV\\/210dac04f609.jpg\",\"https:\\/\\/i.ibb.co\\/VYmZFPFn\\/63f2ecd1cf5c.jpg\",\"https:\\/\\/i.ibb.co\\/s9jvDLP2\\/001e707493eb.jpg\"]', 'Svaada', 'Perkopian', 'Jl. Sabdopalon', 'Winongo', 'Manguharjo', 'Madiun', 'Kuliner', '2026', 'Mikro', '100000', 'Musiman', '[\"Penjualan sepi\",\"Modal terbatas\",\"Produksi terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\",\"Website\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Menambah wawasan', 'Menambah reseller baru', 0, '2026-08-18 04:31:41', '2026-08-18 04:31:41', NULL),
(89, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Wijiati', '3577024605670002', '0408220021771', 'wijiatimadiun@gmail.com', '085335306070', 'Perempuan', '1967-05-06', 'https://i.ibb.co/Z1KScx5N/700b862a1c29.jpg', '[\"https:\\/\\/i.ibb.co\\/Jwc95T3B\\/f1e419495289.jpg\",\"https:\\/\\/i.ibb.co\\/YFBfJZS1\\/23ac590d7e83.jpg\",\"https:\\/\\/i.ibb.co\\/20Hxv7ch\\/ae356070558c.jpg\"]', 'Batik tulis Ndima', 'Kain batik', 'Jl walet mo 5', 'Nambangan Kidul', 'Manguharjo', 'Madiun', 'Fashion', '2019', 'Mikro', '1500000', 'Ya', '[\"Penjualan sepi\",\"Produksi terbatas\"]', '[]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Mampu meningkatkan produksi dan mutu produk', 'Meningkatkan penjualan dan mutu produk', 0, '2026-08-18 04:38:26', '2026-08-18 04:38:26', NULL),
(90, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'WIKEN RAHMAWATI NASRIKAH', '3577034811870001', '2410210010895', 'we.rahma811@gmail.com', '082257139723', 'Perempuan', '1987-11-08', 'https://i.ibb.co/BKgSx0YK/30db2443ef41.jpg', '[\"https:\\/\\/i.ibb.co\\/zhcqnrkN\\/1ea67e1e520c.jpg\",\"https:\\/\\/i.ibb.co\\/nMmbznGN\\/5ef80ea15eb8.jpg\",\"https:\\/\\/i.ibb.co\\/6RFXLhV2\\/6c656b9b3b7a.jpg\"]', 'Wiyarta Raya Batik', 'Batik tulis', 'Jl Tilamupih GG V', 'Josenan', 'Taman', 'Madiun', 'Kerajinan', '2020', 'Mikro', '1000000', 'Musiman', '[\"Produksi terbatas\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Ingin meningkatkan kualitas produk dan dapat berkreasi dengan motif motif baru yang bisa menjadi trend di era sekarang', 'Omset naik diatas 10juta / bulan, buka toko online disemua medsos dan banyak orderan, motif dan warna batik lebih bervariatif', 0, '2026-08-18 04:41:36', '2026-08-18 04:41:36', NULL),
(91, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'ANY HARIJANTI', '3577014812690001', '1710210004729', 'anyharijanti@gmail.com', '081217198468', 'Perempuan', '1969-12-08', 'https://i.ibb.co/fjMbh7S/41c50ccf82cb.jpg', '[\"https:\\/\\/i.ibb.co\\/0ySst1bt\\/fa9123a5acc8.jpg\",\"https:\\/\\/i.ibb.co\\/pN93yff\\/d627a7137d52.jpg\",\"https:\\/\\/i.ibb.co\\/kgBNqrJN\\/a9d6bd0dd23c.jpg\"]', 'Yu.An Batik', 'Batik Tulis, Batik Cap, Batik Ciprat', 'Jl. Sarana Mulya Gg. Buntu No. 21', 'Rejomulyo', 'Kartoharjo', 'Madiun', 'Kerajinan', '2019', 'Mikro', '1200000', 'Ya', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Produksi terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\",\"Regional (Antar Provinsi\\/Nasional)\"]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Ingin meningkatkan penjualan melalui media sosial', 'Menambah omzet', 0, '2026-08-18 04:43:45', '2026-08-18 04:43:45', NULL),
(92, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Sutamah', '3517206511640001', '0711220036616', 'sutama698@gmail.com', '085755006759', 'Perempuan', '1964-11-25', 'https://i.ibb.co/YngBTyh/78284b23bbe7.jpg', '[\"https:\\/\\/i.ibb.co\\/MyPhHLXc\\/66b1b525686e.jpg\",\"https:\\/\\/i.ibb.co\\/3mJnbRCS\\/71e7350eed1a.jpg\"]', 'Batik Utama', 'Kain batik', 'Jl. Dieng Gg. Pangeran No.16 Rt.17/Rw.06', 'Pangongangan', 'Manguharjo', 'Madiun', 'Fashion', '2014', 'Mikro', '2000000', 'Musiman', '[\"Penjualan sepi\",\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Bisa memperluas pemasaran di media sosial', 'Menaikkan omzet penjualan', 0, '2026-08-18 04:44:54', '2026-08-18 04:44:54', NULL),
(93, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'SUBIARSIH', '3577026409680001', '0711220033354', 'subiarsih24@gmail.com', '085257038858', 'Perempuan', '1968-09-24', 'https://i.ibb.co/Q3KFB3pV/4a10eb22b414.jpg', '[\"https:\\/\\/i.ibb.co\\/8gBpHMqQ\\/e61d07ba6930.jpg\",\"https:\\/\\/i.ibb.co\\/PGkwKRf6\\/05f0f06e70e2.jpg\"]', 'Samara Batik', 'Kain Batik', 'Jl. Sriti, Gg. Swadaya No. 9D', 'Nambangan Lor', 'Manguharjo', 'Madiun', 'Fashion', '2012', 'Kecil', '1100000', 'Musiman', '[\"Marketing kurang efektif\",\"SDM kurang\"]', '[\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'bisa lebih maksimal dalam penjualan', 'semakin banyak orderan', 0, '2026-08-18 04:48:01', '2026-08-18 04:48:01', NULL),
(94, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Yuyun yuniati', '3577014606740003', '2701230062891', 'yuyunzeila974@gmail.com', '081234479525', 'Perempuan', '1974-06-06', 'https://i.ibb.co/1GNpDyGR/af41bd4c32b4.jpg', '[\"https:\\/\\/i.ibb.co\\/353HwBGT\\/a27c6987fc53.jpg\",\"https:\\/\\/i.ibb.co\\/mVHZ4p5r\\/69ca1bdc772b.jpg\",\"https:\\/\\/i.ibb.co\\/W48jynwX\\/fb707155965a.jpg\"]', 'Batik tulis Canting Yunita', 'Batik tulis', 'Jl. Tri Jaya VIII/208 RT 033 RW 007 Kel. Klegen Kec. Kartoharjo Kota Madiun', 'Klegen', 'Kartoharjo', 'Madiun', 'Fashion', '2019', 'Mikro', '300000', 'Musiman', '[\"Marketing kurang efektif\",\"Modal terbatas\"]', '[\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Belum', 'Belum', 'Ingin semakin berkembang', 'Omzet naik', 0, '2026-08-18 04:52:21', '2026-08-18 04:52:21', NULL),
(95, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'DIAH ANGGRAINI', '3506176109690003', '1312210015044', 'diahanggraini021@gmail.com', '081230181068', 'Perempuan', '1969-09-21', 'https://i.ibb.co/tp2WK3gZ/5c7f3aca19fc.jpg', '[\"https:\\/\\/i.ibb.co\\/ywtRfF8\\/a0eaa10f0a31.jpg\"]', 'Batik.pergiwo pergiwati', 'Batik Tulis', 'Jl Borobudur gg V/1', 'Madiun Lor', 'Manguharjo', 'Madiun', 'Fashion', '2018', 'Mikro', '500000', 'Ya', '[\"Penjualan sepi\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\",\"Marketplace\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Ingin menambah wawasan desain lebih baik.lag dan bisa.mengikuti perkembangan ( up to date) serta selalu.di upgrade pengetahuan desain ny', 'Menambah variasi desain.yg. pada.ujungny ada peningktan.produksi serta.peningkatan income', 0, '2026-08-18 04:52:58', '2026-08-18 04:52:58', NULL),
(96, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Sri Murniati', '3577016112670001', '0811210040396', 'batikmurnimadiun@gmail.com', '081335547087', 'Perempuan', '1967-12-21', 'https://i.ibb.co/1G5K6WtD/8dedb1bafd5c.jpg', '[\"https:\\/\\/i.ibb.co\\/wNxG4Rrz\\/fa7165a5001a.jpg\",\"https:\\/\\/i.ibb.co\\/dwrLCCQh\\/0604b8c775e8.jpg\",\"https:\\/\\/i.ibb.co\\/PvW8KkTf\\/089277dab085.jpg\"]', 'Batik Murni Madiun', 'Batik tulis, Batik cap, Batik Kombinasi cap & tulis, Batik Sarimbit, Batik Pecel, Batik Pendekar', 'Jl. Halmahera No. 21', 'Oro-Oro Ombo', 'Kartoharjo', 'Madiun', 'Fashion', '2011', 'Mikro', '22467750', 'Ya', '[\"Marketing kurang efektif\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\",\"Regional (Antar Provinsi\\/Nasional)\"]', 1, 2, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'ingin berjualan di tiktok shop, shopee', 'omzet meningkat', 0, '2026-08-18 05:08:30', '2026-08-18 05:08:30', NULL),
(97, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Djoko Slameto', '3577021302560001', '0220208811034', 'batikathanisa19@gmail.com', '085855528577', 'Laki-laki', '1956-02-13', 'https://i.ibb.co/yF51Vpg4/0460c504694f.jpg', '[\"https:\\/\\/i.ibb.co\\/3yWWgM7V\\/59c11896bdfc.jpg\",\"https:\\/\\/i.ibb.co\\/mFtwkDZX\\/2a9d4a50627c.jpg\"]', 'Batik athanisa', 'Batik tulis', 'Jl. Sabdopalon no 19 Madiun', 'Winongo', 'Manguharjo', 'Madiun', 'Kriya', '2010', 'Mikro', '2000000', 'Tidak', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Belum', 'Pernah', 'Pendapatan meningkat', 'Pendapatan meningkat', 0, '2026-08-18 05:18:10', '2026-08-18 05:18:10', NULL),
(98, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Wiwik rumiyani', '3577026702700001', '0306220016884', 'rumiyaniwiwik@gmail.com', '+62 895-8085-03366', 'Perempuan', '1970-02-27', 'https://i.ibb.co/jvnL6XDd/61c0a72fed89.jpg', '[\"https:\\/\\/i.ibb.co\\/F4K0NLjz\\/cd9350b91e50.jpg\",\"https:\\/\\/i.ibb.co\\/QBJzRK6\\/dfeb708fb5e9.jpg\",\"https:\\/\\/i.ibb.co\\/cK9HzBCt\\/a5dc8cc1ba6e.jpg\"]', 'Batik abadi', 'Kain batik', 'Jl sikatan gang gemak no 16 Nambangan lor', 'Nambangan Lor', 'Manguharjo', 'Madiun', 'Fashion', '2012', 'Mikro', '1000000', 'Ya', '[\"Marketing kurang efektif\",\"Produksi terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Bisa meningkatkan kualitas produk', 'Menambah produksi dengan kwalitas terbaik', 0, '2026-08-18 05:25:22', '2026-08-18 05:25:22', NULL),
(99, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Marsuni', '3577026311750001', '2410210000532', 'marsunisuwarsono@gmail.com', '082142788653', 'Perempuan', '1975-11-23', 'https://i.ibb.co/rLPL1fq/65154750c1f0.jpg', '[\"https:\\/\\/i.ibb.co\\/HLZzMfMS\\/fa56196eb613.jpg\",\"https:\\/\\/i.ibb.co\\/6RWZRHXZ\\/d10d6abcc8a3.jpg\",\"https:\\/\\/i.ibb.co\\/6cgZrq9B\\/eb8f5934535f.jpg\"]', 'Batik Qiyasan', 'Batik tulis ,cap ,kombinasi batik tulis dan cap', 'Jl.cendrawasih gg.pinguin no.24 rt 22 rw 06 kelurahan nambangan lor', 'Nambangan Lor', 'Manguharjo', 'Madiun', 'Fashion', '2012', 'Mikro', '500000', 'Ya', '[\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 1, 'Mandiri', 'Belum', 'Belum', 'Memprluas jaringan dan wawasan dan ingin jualan onlin', 'Omsetnya naik 2× lipat dan smua warga kota madiun memakai batik', 0, '2026-08-18 05:26:21', '2026-08-18 05:26:21', NULL),
(100, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Aulia  Afiifah Fauzi', '3577016502980002', '1601230004677', 'auliafauzi02@gmail.com', '087858042353', 'Perempuan', '1998-02-25', 'https://i.ibb.co/9m2hqTkL/2c297bba05a8.jpg', NULL, 'Batik Nabastala', 'Kain batik tulis dan Pakaian batik', 'Jalan serayu Perumahan Mutiara kencana B-7', 'Pandean', 'Taman', 'Madiun', 'Kriya', '2022', 'Mikro', '300000', 'Musiman', '[\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Ingin meningkatkan pemahaman mengenai bisnis dan meningkat produksi', 'Rutin memproduksi kain batik', 0, '2026-08-18 05:35:59', '2026-08-18 05:35:59', NULL),
(101, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Djoko Slameto', '3577021302560001', '0220208811034', 'batikathanisa19@gmail.com', '085855528577', 'Laki-laki', '1956-02-13', 'https://i.ibb.co/yF51Vpg4/0460c504694f.jpg', '[\"https:\\/\\/i.ibb.co\\/mFtwkDZX\\/2a9d4a50627c.jpg\",\"https:\\/\\/i.ibb.co\\/kshDcNK5\\/23c1cb2b0491.jpg\",\"https:\\/\\/i.ibb.co\\/3yWWgM7V\\/59c11896bdfc.jpg\"]', 'Batik athanisa', 'Batik tulis', 'Jl.sapdopalon , Madiun', 'Winongo', 'Manguharjo', 'Madiun', 'Kriya', '2010', 'Mikro', '2000000', 'Tidak', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Belum', 'Pernah', 'Penjualan meningkat', 'Penjualan meningkat', 0, '2026-08-18 05:41:38', '2026-08-18 05:41:38', '2026-08-18 06:02:20'),
(102, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Suyitno', '3577021109490001', '1005220006733', 'wiwikmariyati0501@gmail.com', '+62 898-5547-616', 'Laki-laki', '1949-09-11', 'https://i.ibb.co/ccp9ttrV/11fa842413f5.jpg', '[\"https:\\/\\/i.ibb.co\\/FkJ0dm4j\\/69bf63f2eda5.jpg\",\"https:\\/\\/i.ibb.co\\/Nn6Y9zgB\\/dfdc65cf9a22.jpg\",\"https:\\/\\/i.ibb.co\\/jkYWDcPZ\\/af5b70d5155a.jpg\"]', 'Batik Rejo keningar', 'Kain batik', 'Jl keningar', 'Ngegong', 'Manguharjo', 'Madiun', 'Fashion', '2010', 'Mikro', '2000000', 'Ya', '[\"Marketing kurang efektif\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Meningkatkan produksi dan mutu produk', 'Meningkatkan penjualan dengan menjaga kwalitas produk', 0, '2026-08-18 06:28:04', '2026-08-18 06:28:04', NULL),
(103, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Sri Wahyuni Muji Astuti', '3577015504650001', '2110210001664', 'sriwahyunimujiastuti65@gmail.com', '08123406200', 'Perempuan', '1965-04-15', 'https://i.ibb.co/rRf1Gmf7/86b9b5f28c66.jpg', '[\"https:\\/\\/i.ibb.co\\/MystdzWP\\/e506fd0dae8c.jpg\"]', 'Kiyoshi', 'Batik dan ecoprint', 'Jl Anekasari no 4', 'Rejomulyo', 'Kartoharjo', 'Madiun', 'Fashion', '2018', 'Mikro', '6000000', 'Tidak', '[\"Penjualan sepi\"]', '[\"Offline (toko)\",\"Instagram\"]', '[\"Regional (Antar Provinsi\\/Nasional)\"]', 1, 2, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Bisa jualan di tiktok ,etsy,omzet naik walaupun kondisi lesu', 'Omzet naik,bisa nmbh tenaga kerja', 0, '2026-08-18 06:53:29', '2026-08-18 06:53:29', NULL),
(104, 'Pelatihan Peningkatan Daya Saing Motif Batik Khas Kota Madiun', 'Novilia Ratnawati', '3577015411730002', '2704220015876', 'liaalioo600@gmail.co', '082143777744', 'Perempuan', '1973-11-14', 'https://i.ibb.co/Kc6jPRjM/f8c5d657ac5f.jpg', '[\"https:\\/\\/i.ibb.co\\/GvVCJ3MX\\/ef5687a7229c.jpg\"]', 'Lialio Batik', 'Kain dan baju batik tulis, kain dan baju shibori, kain dan baju ecoprint', 'Jl Jati Kampir A-6', 'Kanigoro', 'Kartoharjo', 'Madiun', 'Kerajinan', '2019', 'Mikro', '1500000', 'Musiman', '[\"Penjualan sepi\",\"Modal terbatas\"]', '[\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 2, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Dapat menambah ilmu dan diaplikasikan ke produk sehingga menmbah pesanan.', 'Adanya penambahan pesanan', 0, '2026-08-18 07:48:10', '2026-08-18 07:48:10', NULL),
(105, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'ADITYA MUSTOFA PUTRA', '3519070101940002', '1407260114418', 'putra1263022@gmail.com', '08132604035', 'Laki-laki', '1994-01-01', 'https://i.ibb.co/hJNFLGpy/16368925e051.jpg', '[\"https:\\/\\/i.ibb.co\\/PzvRyVdW\\/2e69f0dbee5d.jpg\",\"https:\\/\\/i.ibb.co\\/mVT1jhTh\\/a1a9b1acbcf2.jpg\",\"https:\\/\\/i.ibb.co\\/ZQ9KKWY\\/cf18f7f7999e.jpg\"]', 'TERAS SEGAR', 'Jus Buah', 'Jl. Endah Manis II No. 21', 'Manisrejo', 'Taman', 'Madiun', 'Kuliner', '2026', 'Mikro', '5000000', 'Musiman', '[\"Penjualan sepi\",\"Modal terbatas\",\"Produksi terbatas\",\"Lainnya\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah aktif', 'Belum', 'memperluas jaringan penjualan di sosial media maupun offline', 'menaikkan omzet 2x dan menambah fasilitas alat', 0, '2026-08-20 07:16:57', '2026-08-20 07:16:57', NULL),
(106, 'Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare', 'ANGELIKA GUNADI WIDJANARKO', '3577034806820001', '0712210013688', 'chirochips.id@gmail.com', '085735831635', 'Perempuan', '1982-06-08', 'https://i.ibb.co/mVwtDM2c/dc8a00532adc.jpg', NULL, 'Keripik Rambak Pisang Cheero Chips', 'Keripik Rambak Pisang', 'Jl Cokroaminoto no 88', 'Pandean', 'Taman', 'Madiun', 'Kuliner', '2020', 'Mikro', '3000000', 'Tidak', '[\"Penjualan sepi\",\"Produksi terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\",\"Marketplace\"]', '[\"Regional (Antar Provinsi\\/Nasional)\"]', 0, 2, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Bisa mendapat sertifikat halal', 'Masuk ke retail komersial seperti supermarket, indomaret, alfamart', 0, '2026-08-20 07:19:37', '2026-08-20 07:19:37', NULL),
(107, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'TIWUK WARIYANTI', '3577024109890002', 'Belum (Bersedia)', 'kedaizhikya@gmail.com', '085854682746', 'Perempuan', '1989-09-01', 'https://i.ibb.co/SwhR1JJb/6cc3ac117fab.jpg', '[\"https:\\/\\/i.ibb.co\\/BKGKch5M\\/8e85e17d52f5.jpg\",\"https:\\/\\/i.ibb.co\\/6cmnDTM1\\/f59a36919f4b.jpg\",\"https:\\/\\/i.ibb.co\\/mFyCrKh1\\/dad5295e90dc.jpg\"]', 'Kedai zhikya', 'Jasuke, telur gulung, basreng, sosis bakar, dll', 'TAMAN LALU LINTAS BANTARAN', 'Manguharjo', 'Manguharjo', 'Madiun', 'Kuliner', '2016', 'Kecil', '600000', 'Ya', '[\"Penjualan sepi\"]', '[\"WhatsApp\"]', '[]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Bisa jadi pebisnis, dn jualannya laris srta di minati bnyk orng', 'Omset naik dulu deh, bru buka cabang', 0, '2026-08-21 07:10:21', '2026-08-21 07:10:21', NULL),
(108, 'Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare', 'Argha Rahutama Sofiandi', '3509212003840002', '1006230023925', 'arsofiandi@gmail.com', '085234433973', 'Laki-laki', '1984-03-20', 'https://ikmjuara.my.id/uploads/ktp/1787309566_6a882dfee613d.jpg', '[\"https:\\/\\/ikmjuara.my.id\\/uploads\\/foto_produk\\/1787309568_6a882e00115f8.jpg\",\"https:\\/\\/ikmjuara.my.id\\/uploads\\/foto_produk\\/1787309569_6a882e0158bd8.jpg\"]', 'Cwie mie amien', 'Cwie mie', 'Jl keradenan', 'Demangan', 'Taman', 'Madiun', 'Kuliner', '4', 'Mikro', '1000000', 'Musiman', '[\"Lainnya\"]', '[\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 1, 'Mandiri', 'Belum', 'Belum', 'Bisa menyempurnakan produk dan menambah jaringan pemasaran agar omset bertambah dan usaha bisa dijadikan pemasukan untuk keluarga', 'Omset naik 5x lipat', 0, '2026-08-21 10:52:49', '2026-08-21 10:52:49', NULL),
(109, 'Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare', 'Chofifah Fitriana', '2171105508849010', 'Belum (Bersedia)', 'chofifahfitriana373@gmail.com', '081536307031', 'Perempuan', '1984-08-15', 'https://i.ibb.co/gM0PL8zF/3400de937844.jpg', '[\"https:\\/\\/i.ibb.co\\/nN4TPV0G\\/a46a48a0f605.jpg\"]', 'Huda', 'Lempeng', 'Jl merpati no 47', 'Nambangan Lor', 'Manguharjo', 'Madiun', 'Kuliner', '2018', 'Kecil', '1200000', 'Musiman', '[\"Lainnya\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Usaha lebih berkembang serta dapat ilmu', 'Penjualan meningkat', 0, '2026-08-24 16:41:14', '2026-08-24 16:41:14', NULL),
(110, 'Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare', 'JOFI TRIYONO', '3577030808830005', '2408260087773', 'halalindonesia1997+jofi@gmail.com', '085708443895', 'Laki-laki', '1983-08-08', 'https://i.ibb.co/JVwbBqP/6e95c4295666.jpg', '[\"https:\\/\\/i.ibb.co\\/1tJmm7H1\\/c5b5bf32cb77.jpg\"]', 'Ayam Goreng BuKaji', 'Ayam Ungkep', 'Jl. Serayu Timur, No. 15, Kota Madiun', 'Pandean', 'Taman', 'Madiun', 'Kuliner', '2025', 'Mikro', '6750000', 'Ya', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Omzet naik', 'Omzet naik', 0, '2026-08-25 02:10:45', '2026-08-25 02:10:45', NULL),
(111, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Yanuar Priambodo', '3520111209590001', '1611220035626', 'yanuara16@gmail.com', '085895464539', 'Laki-laki', '2026-08-11', 'https://i.ibb.co/0jKTTVXX/18b063554491.jpg', '[\"https:\\/\\/i.ibb.co\\/0jKTTVXX\\/18b063554491.jpg\"]', 'Es Doger Nona Manies', 'H', 'H', 'Pangongangan', 'Manguharjo', 'Madiun', 'Jasa', '2020', 'Kecil', '1000000', 'Tidak', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'H', 'H', 0, '2026-08-25 04:50:22', '2026-08-25 04:50:22', '2026-08-26 00:54:30'),
(112, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Fifit Faturohman', '3203162403840003', '0908240019194', 'fifitfaturohman999@gmail.com', '082139067114', 'Laki-laki', '1984-03-24', 'https://i.ibb.co/Kzs1KDVq/357932bc7d76.jpg', '[\"https:\\/\\/i.ibb.co\\/J8F4hxY\\/84e7773e9b52.jpg\",\"https:\\/\\/i.ibb.co\\/B5VDqFcs\\/fac04d9706e6.jpg\",\"https:\\/\\/i.ibb.co\\/9k5GCJdg\\/c269487eb16d.jpg\"]', 'Es Kopi SOMAD solomadiun', 'Es teh dan varian es kopi', 'Jl. Salak no 58b', 'Mojorejo', 'Taman', 'Madiun', 'Kuliner', '2024', 'Mikro', '9000000', 'Tidak', '[\"Penjualan sepi\",\"Modal terbatas\",\"Lainnya\"]', '[\"Offline (toko)\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 2, 2, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Menambah ilmu dan strategi dari pelatihan ini', 'Menambah omset', 0, '2026-08-25 05:06:49', '2026-08-25 05:06:49', NULL),
(113, 'Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare', 'Berlien safitri', '3577036408790002', '2608260003713', 'halalindonesia1997+berlien@gmail.com', '0895710447888', 'Perempuan', '1979-08-24', 'https://i.ibb.co/k23K4Bjp/114da6f441b4.jpg', '[\"https:\\/\\/i.ibb.co\\/LdKwJ9bc\\/77e7ee970d2a.jpg\"]', 'sehat bugar', 'minuman kunyit asem', 'jl mangga gg 7 no 7b', 'Kejuron', 'Taman', 'Madiun', 'Kuliner', '2025', 'Mikro', '5000000', 'Ya', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'omzet bertambah', 'omzet bertambah', 0, '2026-08-26 02:34:43', '2026-08-26 02:34:43', NULL),
(114, 'Pelatihan Olahan Sambal - Fasilitasi Sertifikasi Halal Self Declare', 'atien kiswani', '3216066907760011', '2608260004229', 'halalindonesia1997+atien@gmail.com', '081233301967', 'Perempuan', '1976-07-26', 'https://i.ibb.co/3HVJPj2/18777890f2c4.jpg', '[\"https:\\/\\/i.ibb.co\\/LzMHGnF0\\/008cbd5a3aa2.jpg\"]', 'Rahayu', 'sambel pecel Rahayu', 'jl mangga gg7 no 1', 'Pandean', 'Taman', 'Madiun', 'Kuliner', '2025', 'Mikro', '5000000', 'Ya', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'ingin omzet meningat', 'ingin omzet meningkat', 0, '2026-08-26 02:43:07', '2026-08-26 02:43:07', NULL),
(115, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Hari fadjar tri kusumawardani engle', '3577035107700004', '1509250072335', 'halalindonesia1997+hari@gmail.com', '081357686886', 'Perempuan', '1970-07-11', 'https://i.ibb.co/8LPFznv9/773e2ce2e873.jpg', '[\"https:\\/\\/i.ibb.co\\/DD5GSc1j\\/e97944deb6d9.jpg\"]', 'jajanan basah nena cake', 'lumpia', 'jl mundu no 20', 'Taman', 'Taman', 'Madiun', 'Kuliner', '2025', 'Mikro', '10000000', 'Ya', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Produksi terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Marketplace\"]', '[]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'ingin omzet meningkat', 'ingin omzet meningka', 0, '2026-08-26 04:29:42', '2026-08-26 04:29:42', NULL),
(116, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Rr.Maria guadalupe sekar puspitasari nurtjahjo', '3577035711000002', '2608260007394', 'halalindonesia1997+maria@gmail.com', '085784971990', 'Perempuan', '2000-11-17', 'https://i.ibb.co/pB9GrK8D/afbc28c743b9.jpg', '[\"https:\\/\\/i.ibb.co\\/LXc8Vnfg\\/318c7eb9cad1.jpg\"]', 'Dacheesey bakery & cake', 'cupcake', 'jl mundo no 20', 'Taman', 'Taman', 'Madiun', 'Kuliner', '2025', 'Mikro', '10000000', 'Ya', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Marketplace\"]', '[]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'ingin omzet meningkat', 'ingin omzet meningkat', 0, '2026-08-26 04:39:21', '2026-08-26 04:39:21', NULL),
(117, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Ratnawati Al Hasan', '3577036311630002', '2710210015455', 'ratnawatialhasan5@gmail.com', '081231337322', 'Perempuan', '1963-11-23', 'https://i.ibb.co/pvfDYthZ/7f63c37fb364.jpg', '[\"https:\\/\\/i.ibb.co\\/Dg9nj9Tg\\/1571a3229a33.jpg\"]', 'Warung Stop Inflasi', 'Kedai', 'Perum Taman asri No. 4', 'Banjarejo', 'Taman', 'Madiun', 'Kuliner', '2018', 'Mikro', '2000000', 'Tidak', '[\"Penjualan sepi\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Ingin lebih mendapatkan pengakuan legalitas produk', 'Bisa menambah omzet', 0, '2026-08-27 01:56:07', '2026-08-27 01:56:07', NULL),
(118, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'RIA HARUM MAWARNI', '3577015911770001', '1248000531179', 'riaharum77@gmail.com', '082337663901', 'Perempuan', '1977-11-19', 'https://i.ibb.co/MkfT1C8G/cc4d44fd0b6a.jpg', '[\"https:\\/\\/i.ibb.co\\/Jjfz0hwD\\/b8c84e3c6019.jpg\"]', 'Numani', 'Pia', 'Jl. Imam Bonjol Gang Jati Subur No. 24', 'Klegen', 'Kartoharjo', 'Madiun', 'Kuliner', '2020', 'Mikro', '1500000', 'Tidak', '[\"Modal terbatas\"]', '[\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'ingin menambah ilmu', 'bisa memproduksi lebih banyak', 0, '2026-08-27 02:03:29', '2026-08-27 02:03:29', NULL),
(119, 'Pelatihan Olahan Sambal - Fasilitasi Sertifikasi Halal Self Declare', 'Suharni', '3577024108630002', 'Belum (Bersedia)', 'dhehar55@gmail.com', '081334655383', 'Perempuan', '1963-08-01', 'https://i.ibb.co/G355bXhG/46239b238881.jpg', '[\"https:\\/\\/i.ibb.co\\/XkN1b2Rb\\/de1c8e85ba27.jpg\",\"https:\\/\\/i.ibb.co\\/XrzwhSzH\\/eae1a355601c.jpg\"]', 'Kedai Dhe Har', 'Nasi Pecel, Peyek', 'Jl. Banda Block C No. 40C', 'Madiun Lor', 'Manguharjo', 'Madiun', 'Kuliner', '2021', 'Mikro', '1000000', 'Ya', '[\"Modal terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Belum', 'Belum', 'Ingin melengkapi halal', 'semoga makin laris lagi', 0, '2026-08-27 02:12:34', '2026-08-27 02:12:34', NULL),
(120, 'Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare', 'Ari Puji Astuti', '3577025605760004', '2206220030655', 'aripuji693@gmail.com', '082264484500', 'Perempuan', '1976-05-16', 'https://i.ibb.co/27jr7J8z/b16cd08c2133.jpg', '[\"https:\\/\\/i.ibb.co\\/ZRxBKL4X\\/8733df1ffe10.jpg\"]', 'Kedai PRC', 'Soto, Rawon', 'JL.RING ROAD NO.01', 'Sogaten', 'Manguharjo', 'Madiun', 'Kuliner', '2024', 'Mikro', '2000000', 'Ya', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Belum', 'Belum', 'ingin lebih meningkatkan omzet', 'bisa menambah cabang jualan', 0, '2026-08-27 02:18:01', '2026-08-27 02:18:01', NULL),
(121, 'Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare', 'RETNO INDARTI', '3674025507790004', '3001220005737', 'dutabintaro0911@gmail.com', '081909000907', 'Perempuan', '1979-07-15', 'https://ikmjuara.my.id/uploads/ktp/1787798278_6a8fa306bddbe.jpg', '[\"https:\\/\\/i.ibb.co\\/20mN4sbd\\/cebaca40053d.jpg\"]', 'Asinan Simoel', 'Salad Buah, Rujak, Asinan', 'Jl. Sidomulyo 1 No. 35', 'Kanigoro', 'Kartoharjo', 'Madiun', 'Kuliner', '2019', 'Mikro', '1500000', 'Tidak', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Ingin melengkapi halal produk saya', 'semoga semakin maju dan sukses', 0, '2026-08-27 02:37:59', '2026-08-27 02:37:59', NULL),
(122, 'Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare', 'DIYAH SRI KUSUMA DEWI', '3577034909850004', '0811210043952', 'dadocakep30@gmail.com', '081334629835', 'Perempuan', '1985-09-09', 'https://ikmjuara.my.id/uploads/ktp/1787798561_6a8fa421801c1.jpg', '[\"https:\\/\\/i.ibb.co\\/8DDht1my\\/c9038d285532.jpg\"]', 'Cireng Mb Diyah', 'Cireng', 'Jl. Asahan No. 36', 'Taman', 'Taman', 'Madiun', 'Kuliner', '2018', 'Mikro', '3000000', 'Tidak', '[\"Marketing kurang efektif\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 2, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Memperbaharui legalitas saya', 'bisa menambah omzet signifikan', 0, '2026-08-27 02:42:43', '2026-08-27 02:42:43', NULL),
(123, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'CITRA PUTRI ERITIKA', '3520117112890002', '2907230085116', 'halalindon.es.ia1.23@gmail.com', '081252420682', 'Perempuan', '1989-12-31', 'https://i.ibb.co/ks3W92Nq/4514e45c6fcb.jpg', '[\"https:\\/\\/i.ibb.co\\/Vp0bXmbK\\/2731d67cc72b.jpg\"]', 'mamach.eat', 'Bakery', 'PERUMAHAN REJOMULYO JL MEGA MULYA BLOK G/14', 'Rejomulyo', 'Kartoharjo', 'Madiun', 'Kuliner', '2024', 'Mikro', '1000000', 'Ya', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Ingin dapat halal', 'meningkatkan omzet', 0, '2026-08-27 02:48:49', '2026-08-27 02:48:49', NULL),
(124, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Noviawan Roby Pratama', '3577020111920004', 'Belum (Bersedia)', 'noviawanroby@gmail.com', '08121608069', 'Laki-laki', '1992-11-01', 'https://i.ibb.co/NdfZXwCk/df3d4b8ab90f.jpg', NULL, 'Kletak kopi', 'Caffe', 'Jl Borobudur Kota Madiun', 'Madiun Lor', 'Manguharjo', 'Madiun', 'Kuliner', '2026', 'Menengah', '4000000', 'Ya', '[\"Penjualan sepi\",\"Modal terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\",\"Marketplace\",\"Website\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Semoga bisa menjadi barista handal', 'Ber cuan dan menguntungkan', 0, '2026-08-27 10:17:26', '2026-08-27 10:17:26', NULL),
(125, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Anny Dwi Poerwahjoeningtyas', '3577014612790002', '1509210046863', 'anny.dwi01@gmail.com', '08121663279', 'Perempuan', '1979-12-06', 'https://i.ibb.co/5XFj5mnY/5d8e68b7d237.jpg', '[\"https:\\/\\/i.ibb.co\\/MDDqP8cL\\/52790bff46e8.jpg\"]', 'Queen Oke', 'Sari kedelai', 'Jl. Imam Bonjol Gg Jati Trubus no 7', 'Klegen', 'Kartoharjo', 'Madiun', 'Kuliner', '2015', 'Mikro', '2000000', 'Ya', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Menambah varian produk', 'Omzet naik', 0, '2026-08-28 09:39:52', '2026-08-28 09:39:52', NULL),
(126, 'Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare', 'Anny Dwi Poerwahjoeningtyas', '3577014612790002', '1509210046863', 'anny.dwi01@gmail.com', '08121663279', 'Perempuan', '1979-12-06', 'https://i.ibb.co/5XFj5mnY/5d8e68b7d237.jpg', '[\"https:\\/\\/i.ibb.co\\/rKmSgJB8\\/e3a2d8c960ca.jpg\"]', 'Queen Oke', 'Kebab', 'Jl. Imam Bonjol Gg Jati Trubus no 7', 'Klegen', 'Kartoharjo', 'Madiun', 'Kuliner', '2015', 'Mikro', '2000000', 'Ya', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Menambah varian produk', 'Omzet naik', 0, '2026-08-28 09:45:03', '2026-08-28 09:45:03', NULL),
(127, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Anny Dwi Poerwahjoeningtyas', '3577014612790002', '1509210046863', 'anny.dwi01@gmail.com', '08121663279', 'Perempuan', '1979-12-06', 'https://i.ibb.co/5XFj5mnY/5d8e68b7d237.jpg', '[\"https:\\/\\/i.ibb.co\\/RpTVhNwH\\/c71f44f6e6b7.jpg\",\"https:\\/\\/i.ibb.co\\/XfJyvYDq\\/c30012ed4fcf.jpg\",\"https:\\/\\/i.ibb.co\\/KjcCX6GR\\/c2f95d14901f.jpg\"]', 'Queenny', 'Kue kue', 'Jl. Imam Bonjol Gg Jati Trubus no 7', 'Klegen', 'Kartoharjo', 'Madiun', 'Kuliner', '2020', 'Mikro', '1000000', 'Musiman', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[]', 1, 1, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'Menambah varian', 'Omzet naik', 0, '2026-08-28 09:49:33', '2026-08-28 09:49:33', NULL),
(128, 'Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare', 'BUNGA MELATI', '3577026506920001', '2808260059732', 'bungamelati92@yopmail.com', '085748652355', 'Perempuan', '1992-06-25', 'https://i.ibb.co/tPXpXQ62/a1462c6352ea.jpg', '[\"https:\\/\\/i.ibb.co\\/20gS9H9x\\/2866464a5807.jpg\"]', 'Cemkir (Cemilan Kenikir)', 'Cemkir (Cemilan Kenikir)', 'Jl. Podang No. 17B', 'Nambangan Kidul', 'Manguharjo', 'Madiun', 'Kuliner', '2024', 'Mikro', '1000000', 'Tidak', '[\"Modal terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Mendapatkan pemahaman mendalam tentang standar operasional dan prosedur pengajuan sertifikasi Halal khusus untuk produk olahan keripik.', 'Sertifikat Halal resmi terbit dan logo Halal sudah tercetak pada seluruh desain kemasan baru produk.', 0, '2026-08-31 00:45:48', '2026-08-31 00:45:48', NULL);
INSERT INTO `registrasi_pelatihan` (`id`, `nama_kegiatan`, `nama_lengkap`, `nik`, `nib`, `email`, `whatsapp`, `jenis_kelamin`, `tanggal_lahir`, `foto_ktp`, `foto_produk`, `nama_usaha`, `produk_diproduksi`, `alamat_usaha`, `kelurahan`, `kecamatan`, `kota`, `jenis_usaha`, `tahun_mulai`, `skala_usaha`, `omzet_bulanan`, `stabilitas_omzet`, `tantangan_usaha`, `media_penjualan`, `cakupan_pemasaran`, `karyawan_tetap`, `karyawan_tidak_tetap`, `sistem_usaha`, `level_digital`, `pernah_pelatihan`, `harapan_pelatihan`, `target_6_bulan`, `is_lolos`, `created_at`, `updated_at`, `deleted_at`) VALUES
(129, 'Pelatihan Olahan Keripik - Fasilitasi Sertifikasi Halal Self Declare', 'ARNI ROHAYATI', '3577024404740003', '2808260062566', 'arnirohayati04@yopmail.com', '085748652355', 'Perempuan', '1974-04-04', 'https://i.ibb.co/rKqNmyph/5cc9e02a3bf4.jpg', '[\"https:\\/\\/i.ibb.co\\/RWMcdym\\/ea803e299f3c.jpg\"]', 'Pangsit Balado Mbk Arni', 'Pangsit Balado', 'JL. PODANG NO. 32 MADIUN', 'Nambangan Kidul', 'Manguharjo', 'Madiun', 'Kuliner', '2025', 'Mikro', '1000000', 'Tidak', '[\"Penjualan sepi\",\"Modal terbatas\",\"Produksi terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Memahami aturan pencantuman logo Halal yang benar dan sah pada desain kemasan produk keripik.', 'Meningkatkan nilai jual atau harga produk secara wajar yang diimbangi dengan perbaikan kualitas kemasan bersertifikat.', 0, '2026-08-31 00:49:21', '2026-08-31 00:49:21', NULL),
(130, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Aradeansyah Satria Muladata', '3577011911860002', 'Belum (Bersedia)', 'aradata19@gmail.com', '085736645678', 'Laki-laki', '1986-11-19', 'https://i.ibb.co/931xtxbD/5bf3ed0a7f42.jpg', '[\"https:\\/\\/i.ibb.co\\/DD0bgs9M\\/bc4c9f76ee55.jpg\",\"https:\\/\\/i.ibb.co\\/mrz26NvT\\/3533c5f5ba1d.jpg\",\"https:\\/\\/i.ibb.co\\/svcCKX5z\\/daeeb0e44bce.jpg\"]', 'Kelakon Ngopi', 'Sajian minuman berbasis kopi dan non kopi', 'Jalan Rokan no 4 Taman Kota Madiun', 'Taman', 'Taman', 'Madiun', 'Kuliner', '2026', 'Kecil', '5000000', 'Ya', '[\"Modal terbatas\",\"Produksi terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\",\"Instagram\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Pernah', 'mengembangkan usaha dan bisnis', 'lebih dikenal dan tentunya menguntungkan', 0, '2026-08-31 01:57:09', '2026-08-31 01:57:09', NULL),
(131, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Agusta Permana putra', '3520041708980004', 'Belum (Bersedia)', 'agustapermana@gmail.com', '088217890619', 'Laki-laki', '1998-08-17', 'https://i.ibb.co/Fqn16CD0/f1c64660e5b0.jpg', '[\"https:\\/\\/i.ibb.co\\/Q3vPCVCm\\/7dc0af7cd4ce.jpg\",\"https:\\/\\/i.ibb.co\\/FqyKBZ7D\\/69b9b7f0910a.jpg\",\"https:\\/\\/i.ibb.co\\/gZ5r6HN0\\/82400ab7e1ee.jpg\"]', 'Srawung coffee', 'Kopi dan non kopi', 'Jl Raya Barat ds. Sempol Maospati', 'Winongo', 'Manguharjo', 'Madiun', 'Kuliner', '2026', 'Mikro', '15000000', 'Ya', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 6, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Memperluas market', 'Omzet naik, dan memperluas usaha', 0, '2026-08-31 03:29:22', '2026-08-31 03:29:22', NULL),
(132, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Suwanto', '3577033006770005', '2508230005586', 'oanto6378@gmail.com', '081214294533', 'Laki-laki', '1977-06-30', 'https://i.ibb.co/pvCrptrM/53fbace406e6.jpg', '[\"https:\\/\\/i.ibb.co\\/Z1Ng6CJ0\\/ecd54ed67904.jpg\"]', 'Soto', 'Makanan soto ayam', 'Jl Duku', 'Kejuron', 'Taman', 'Madiun', 'Kuliner', '2015', 'Kecil', '4000000', 'Tidak', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Berharap penjualan lebih laku lagi', 'Target saya supaya lebih berkembang lagi(laku).mengingat pembeli yang kurang sekali.', 0, '2026-08-31 04:19:35', '2026-08-31 04:19:35', NULL),
(133, 'Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare', 'ARDHIANA SEPTIANINGRUM', '3577025309920001', '0220206791842', 'ardhianasep13@gmail.com', '085736440004', 'Perempuan', '1992-09-13', 'https://i.ibb.co/FLTncS6v/0401934cd6ec.jpg', '[\"https:\\/\\/i.ibb.co\\/YBTx41Kg\\/9372864bbf41.jpg\"]', 'WRAHAS', 'KEFIR', 'JL. CAMPUR SARI III NO.4', 'Sogaten', 'Manguharjo', 'Madiun', 'Kuliner', '2026', 'Mikro', '5000000', 'Ya', '[\"Modal terbatas\",\"Produksi terbatas\"]', '[\"WhatsApp\",\"Instagram\",\"Marketplace\"]', '[\"Regional (Antar Provinsi\\/Nasional)\"]', 0, 0, 'Mandiri', 'Sudah aktif', 'Pernah', 'Product menjadi lebih di percaya masyarakat karena sudah halal', 'Naik omset 3x lipat', 0, '2026-08-31 12:31:25', '2026-08-31 12:31:25', NULL),
(134, 'Pelatihan Bakery dan Pastry - Fasilitasi Sertifikasi Halal Self Declare', 'Rini Yuni Rahayu', '3577037006750002', '2708260016261', 'riniyunirahayu@gmail.com', '085113221861', 'Perempuan', '1975-06-30', 'https://i.ibb.co/q3JskMhB/eca40c78162d.jpg', '[\"https:\\/\\/i.ibb.co\\/GvMP7vcR\\/d4ab976e097b.jpg\",\"https:\\/\\/i.ibb.co\\/V0711Dx2\\/d87ca58904f5.jpg\",\"https:\\/\\/i.ibb.co\\/pjzbKW8y\\/91d6893b3d2c.jpg\"]', 'Warung bu anik', 'Jajanan basah', 'Jl. Cempedak nomor 57 Kota madiun', 'Taman', 'Taman', 'Madiun', 'Kuliner', '2021', 'Mikro', '800000', 'Musiman', '[\"Penjualan sepi\",\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Belum', 'Pernah', 'Ingin berjualan di marketplace dan menambah modal', 'Omzet naik 2x lipat', 0, '2026-09-01 00:48:54', '2026-09-01 00:48:54', NULL),
(135, 'Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare', 'Suwanto', '3577033006770005', '2508230005586', 'oanto6378@gmail.com', '081214294533', 'Laki-laki', '1977-06-30', 'https://i.ibb.co/C58JmPdt/6f713d409dc9.jpg', '[\"https:\\/\\/i.ibb.co\\/Z1Ng6CJ0\\/ecd54ed67904.jpg\"]', 'Soto', 'Kuliner makanan soto ayam', 'Jl duku', 'Kejuron', 'Taman', 'Madiun', 'Kuliner', '2015', 'Kecil', '4000000', 'Tidak', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Bisa berkembang', 'Harapan nya bisa lebih laku lagi dan bisa lebih mencukupi kebutuhan keluarga', 0, '2026-09-01 02:06:12', '2026-09-01 02:06:12', NULL),
(136, 'Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare', 'Puji Hastuti', '3577034604770002', '0403240026255', 'pujih1092@gmail.com', '089696309051', 'Perempuan', '1978-04-06', 'https://i.ibb.co/LDBctSrS/1a8c0d50dbcd.jpg', '[\"https:\\/\\/i.ibb.co\\/WSjFSGB\\/8b4c550413a1.jpg\",\"https:\\/\\/i.ibb.co\\/RK17YHF\\/28945236b4b0.jpg\",\"https:\\/\\/i.ibb.co\\/S4kt10yb\\/b3e5a8eb7b7a.jpg\"]', 'Sabrina Juice', 'Juice buah, salad buah, sop buah, minuman sachet, kopi', 'Jl. Kapten saputra no 20', 'Kejuron', 'Taman', 'Madiun', 'Kuliner', '2022', 'Mikro', '2000000', 'Tidak', '[\"Penjualan sepi\",\"Modal terbatas\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Memperbanyak pembeli', 'Omset naik 2x', 0, '2026-09-01 04:52:52', '2026-09-01 04:52:52', NULL),
(137, 'Pelatihan Olahan Makanan Beku - Fasilitasi Sertifikasi Halal Self Declare', 'Irfan Fadhillah', '3577021809990003', '2708260020083', 'irfanfadhillah111@gmail.com', '083845528380', 'Laki-laki', '1999-09-18', 'https://i.ibb.co/mVy8Tx8V/233c5b905812.jpg', '[\"https:\\/\\/i.ibb.co\\/XxDM5pB9\\/fa968feee2c7.jpg\",\"https:\\/\\/i.ibb.co\\/s94Vc2YK\\/e64543f37537.jpg\",\"https:\\/\\/i.ibb.co\\/TBsCY48D\\/10ec52430902.jpg\"]', 'OKAYY DIMSUM', 'DIMSUM', 'Jalan Duku (Lapangan Gulun sisi Timur)', 'Kejuron', 'Taman', 'Madiun', 'Kuliner', '2025', 'Mikro', '4200000', 'Tidak', '[\"Penjualan sepi\",\"Marketing kurang efektif\",\"Modal terbatas\",\"Produksi terbatas\",\"SDM kurang\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Sudah tapi belum maksimal', 'Belum', 'Segera ingin memiliki sertifikasi Halal agar customer atau pelanggan lebih yakin untuk kulineran', 'Menurut saya tahun ini merasa ekonomi dari segi apapun lagi lesu , harapan untuk bulan kedepannya pembeli tetap ada dan usaha tetap bertahan', 0, '2026-09-01 13:17:25', '2026-09-01 13:17:25', NULL),
(138, 'Pelatihan Minuman Instan dan Sirup - Fasilitasi Sertifikasi Halal Self Declare', 'Endang Bagiyawanti', '3577036805600002', '2708260020408', 'endangsaigon60@gmail.com', '081359116278', 'Perempuan', '1960-05-28', 'https://i.ibb.co/xtJhYcvM/c72d0da36c4f.jpg', '[\"https:\\/\\/i.ibb.co\\/5gn3T915\\/1a4629360001.jpg\",\"https:\\/\\/i.ibb.co\\/q3dYKZ98\\/40c913658d2b.jpg\",\"https:\\/\\/i.ibb.co\\/Q3PGZHTY\\/26d033352143.jpg\"]', 'Coklat kurindu', 'Minuman es teh,dan es coklat', 'Jl duku lapangan gulun sebelah timhr', 'Kejuron', 'Taman', 'Madiun', 'Kuliner', '2024', 'Mikro', '1000000', 'Tidak', '[\"Penjualan sepi\",\"Marketing kurang efektif\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Ingin bisa berjualan di marketplace', 'Omzet naik 2x lipat', 0, '2026-09-02 00:32:40', '2026-09-02 00:32:40', NULL),
(139, 'Pelatihan Peningkatan Daya Saing Pelaku Usaha Kopi dan Sertifikasi Barista Lanjut', 'Ganang Dwiki Pamungkas', '3273230309950002', 'Belum (Bersedia)', 'ganangdwiki03@gmail.com', '082116096616', 'Laki-laki', '1995-09-03', 'https://i.ibb.co/tpv8dLx0/91780d496b63.jpg', '[\"https:\\/\\/i.ibb.co\\/Kzx25Km7\\/b66c6e352447.jpg\"]', 'Tjap Tjokro', 'Kopi', 'Jl. Indramanis 3 no.18', 'Manisrejo', 'Taman', 'Madiun', 'Kuliner', '2026', 'Mikro', '500000', 'Musiman', '[\"Penjualan sepi\",\"Modal terbatas\"]', '[\"Offline (toko)\",\"WhatsApp\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 0, 0, 'Mandiri', 'Belum', 'Belum', 'Memperluas jaringan', 'Menaikan omset', 0, '2026-09-02 05:33:29', '2026-09-02 05:33:29', NULL),
(140, 'Pelatihan Olahan Sambal - Fasilitasi Sertifikasi Halal Self Declare', 'Yanuar Priambodo', '3520111209590001', '1611220035626', 'yanuara16@gmail.com', '085655480223', 'Laki-laki', '2026-09-08', 'https://ikmjuara.my.id/uploads/ktp/1789512937_6aa9cce9917ee.jpg', '[\"https:\\/\\/ikmjuara.my.id\\/uploads\\/foto_produk\\/1789512937_6aa9cce9a1465.jpg\"]', 'Es Doger Nona Manies', 'H', 'Jl. Bolodewo No. 8', 'Kartoharjo', 'Kartoharjo', 'Madiun', 'Kuliner', '2020', 'Mikro', '1000000', 'Tidak', '[\"Penjualan sepi\"]', '[\"Offline (toko)\"]', '[\"Lokal (Kabupaten\\/Kota\\/Provinsi)\"]', 1, 0, 'Mandiri', 'Belum', 'Belum', 'Test', 'Test', 0, '2026-09-15 22:55:37', '2026-09-15 22:55:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ZxYCT9RalkQb79HoaVeJT5yQQkv2auUbN3MagxbV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidTJVbm1Gc093VFJVYURaeko0ZHBKUDdaWTRJalBMaDN2cmdvZDNHMyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1774324319);

-- --------------------------------------------------------

--
-- Table structure for table `siinas_industries`
--

CREATE TABLE `siinas_industries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `nama_perusahaan` varchar(255) NOT NULL,
  `alamat_kantor_pusat` text DEFAULT NULL,
  `provinsi_kantor` varchar(255) DEFAULT 'Jawa Timur',
  `kode_provinsi_kantor` varchar(255) DEFAULT NULL,
  `kabkota_kantor` varchar(255) DEFAULT 'Kota Madiun',
  `kode_kabkota_kantor` varchar(255) DEFAULT NULL,
  `kode_kelurahan_kantor` varchar(255) DEFAULT NULL,
  `kode_kecamatan_kantor` varchar(255) DEFAULT NULL,
  `alamat_pabrik` text DEFAULT NULL,
  `provinsi_pabrik` varchar(255) DEFAULT 'Jawa Timur',
  `kode_provinsi_pabrik` varchar(255) DEFAULT NULL,
  `kabkota_pabrik` varchar(255) DEFAULT 'Kota Madiun',
  `kode_kabkota_pabrik` varchar(255) DEFAULT NULL,
  `kode_kelurahan_pabrik` varchar(255) DEFAULT NULL,
  `kode_kecamatan_pabrik` varchar(255) DEFAULT NULL,
  `kbli` varchar(255) DEFAULT NULL,
  `bidang_usaha` text DEFAULT NULL,
  `tanggal_registrasi` varchar(255) DEFAULT NULL,
  `skala_usaha` varchar(255) DEFAULT NULL,
  `status_pelaporan` varchar(255) DEFAULT 'Terverifikasi SIINas',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siinas_industries`
--

INSERT INTO `siinas_industries` (`id`, `no_urut`, `nama_perusahaan`, `alamat_kantor_pusat`, `provinsi_kantor`, `kode_provinsi_kantor`, `kabkota_kantor`, `kode_kabkota_kantor`, `kode_kelurahan_kantor`, `kode_kecamatan_kantor`, `alamat_pabrik`, `provinsi_pabrik`, `kode_provinsi_pabrik`, `kabkota_pabrik`, `kode_kabkota_pabrik`, `kode_kelurahan_pabrik`, `kode_kecamatan_pabrik`, `kbli`, `bidang_usaha`, `tanggal_registrasi`, `skala_usaha`, `status_pelaporan`, `created_at`, `updated_at`) VALUES
(1, 1, 'PT Industri Kereta Api (Persero)', 'Jl. Yos Sudarso No. 71, Madiun Lor, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 71, Madiun Lor, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '28193,30200,29101', 'INDUSTRI MESIN PENDINGIN, INDUSTRI LOKOMOTIF DAN GERBONG KERETA SERTA INDUSTRI KENDARAAN BERMOTOR RODA EMPAT ATAU LEBIH', '04/11/2016 13:57', 'Besar', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(2, 2, 'PT PABRIK GULA RAJAWALI I', 'Jalan Undaan Kulon 57-59, Peneleh, Genteng, Kota Surabaya, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'PG Rejo Agung Baru Jl Yos. Sudarso No 23, Patihan, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '01140,20129,10722,10721,10771,20125,11059,86104,46331,11090', 'Perkebunan tebu, Perdagangan gula, Industri Gula Merah, Industri Gula Pasir, Industri Kecap', '30/08/2019 14:39', 'Besar', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(3, 3, 'PT NITAMA', 'Jl. Tawang Soko Tembus Sukosari Wonodadi, Rejomulyo, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Tawang Soko Tembus Sukosari, Wonodadi, Rejomulyo, Madiun 63119, Tawangrejo, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920,47521', 'JASA INDUSTRI UNTUK BERBAGAI PENGERJAAN KHUSUS LOGAM DAN BARANG DARI LOGAM, Hot Dip Galvanize', '06/11/2019 10:11', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(4, 4, 'PT Refindo Intiselaras Indonesia', 'Jl Basuki Rahmad No 5, Sukosari, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl Basuki Rahmad No 5, Sukosari, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25119,28240,25920,68111', 'INDUSTRI BARANG DARI LOGAM SIAP PASANG UNTUK KONSTRUKSI LAINNYA, INDUSTRI MESIN PENAMBANGAN', '27/04/2020 11:00', 'Besar', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(5, 5, 'PT Latuindo Murni Perkasa', 'JL. URIP SUMOHARJO NO. 108 A, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'JL. URIP SUMOHARJO NO. 108 A, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '30200', 'INDUSTRI LOKOMOTIF DAN GERBONG KERETA', '27/04/2020 15:37', 'Besar', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(6, 6, 'PT Rekaindo Global Jasa', 'Jalan Candi Sewu No. 30, Madiun Lor, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jalan Candi Sewu No. 30, Madiun Lor, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '33141,46593,27120,33152,62019,70202,33121,72102,78200,30200', 'Reparasi Motor Listrik, Generator, Transformator, Reparasi Lokomotif & Gerbong Kereta', '28/07/2020 17:54', 'Besar', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(7, 7, 'CV Cokro Bersatu', 'Jln. Hayam Wuruk No. 51-53, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jln. Hayam Wuruk No. 51-53, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti', '17/02/2021 11:05', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(8, 8, 'PT Surya Anugrah Gempita', 'Jl. Basuki Rahmad No. 3, Sukosari, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 3, Sukosari, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '45301,45201,45101', 'Perdagangan Besar Suku Cadang Dan Aksesori Mobil, REPARASI MOBIL', '06/07/2021 14:37', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(9, 9, 'PT Astra International', 'Menara Astra Lantai 58-63, Jl. Jenderal Sudirman Kav 5-6, Jakarta Pusat', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto 47, Kejuron, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '45201', 'Reparasi Mobil', '07/07/2021 20:56', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(10, 10, 'PT Willindo Kali Catur', 'Jl. Soekarno Hatta 1B, Demangan, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta 1B, Demangan, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '20292', 'Industri Bahan Peledak', '25/08/2021 10:47', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(11, 11, 'PR Arkana. Ud', 'Jl. Kalasan No 58, Patihan, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Kalasan No 58, Patihan, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '16221,16101,31001', 'Perdagangan kayu jati bahan mebel dan kusen, Industri mebel', '18/10/2021 15:03', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(12, 12, 'PT Pt.berdikari Berkat Semesta', 'Jl Merak, Perum Puri Permata Hijau Blok A No 27, Nambangan Kidul, Manguharjo', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl Merak, Perum Puri Permata Hijau Blok A No 27, Nambangan Kidul, Manguharjo', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '16230,47411,14111,47415', 'Peti mati covid, Perlengkapan komputer, Konveksi', '25/10/2021 09:56', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(13, 13, 'PT Pt.maju Mapan Pangastuti', 'Jl. Sari Mulya No. 65, Rejomulyo, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat 10-5, Sukosari, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '49431,23963,23957', 'Supplier Material, Stone Crusher, Ready Mixed and Dry Mixed Concrete', '26/10/2021 16:29', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(14, 14, 'PT Porang Rejeki Jaya', 'Jl. Tirta Raya No 33 Nambangan Kidul, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Tirta Raya No 33 Nambangan Kidul, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10613', 'INDUSTRI TEPUNG DARI PORANG', '27/10/2021 10:06', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(15, 15, 'PR Cipta Rasa', 'Jl. Mandalasari 9 Utara, Rejomulyo, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mandalasari No 9, Rejomulyo, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Kue kering tradisional', '21/12/2021 10:51', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(16, 16, 'PR Aveilla Batik', 'Jl. Candi Boko No. 9, Patihan, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Candi Boko No. 9, Patihan, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik', '21/12/2021 10:53', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(17, 17, 'PR Brovelda', 'Jl. Thamrin Gg Melati No. 03, Klegen, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'JL. THAMRIN GG. KAMBOJA 13C, Klegen, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13924', 'Industri Kerajinan', '21/12/2021 13:21', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(18, 18, 'CV Cipta Karya Abadi Bersama', 'JL. TIRTA RAYA, NAMBANGAN LOR, MANGUHARJO, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'JL. TIRTA RAYA, NAMBANGAN LOR, MANGUHARJO, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11051', 'PRODUKSI AIR MINUM DALAM KEMASAN', '11/02/2022 09:36', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(19, 19, 'PT Inka Multi Solusi Consulting', 'JL. SALAK NO 23, Manisrejo, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'JL. SALAK NO 23, Taman, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '71102,70209,62199,62029,71201,71101,62209', 'AKTIVITAS KEINSINYURAN DAN KONSULTASI TEKNIS YBDI, AKTIVITAS PERANCANGAN PABRIK', '18/03/2022 11:30', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(20, 20, 'CV Abbasy Megah Karya', 'JL. LUMBUNG HIDUP NO 20 RT 012 RW 004, NGEGONG, MANGUHARJO, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'JL. LUMBUNG HIDUP NO 20 RT 012 RW 004, NGEGONG, MANGUHARJO, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'PENJAHITAN DAN PEMBUATAN SESUAI PESANAN', '07/04/2022 17:50', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(21, 21, 'PR Eronggo', 'JL. SAMBIJAJAR NO. 11, TAMAN, TAMAN, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'JL. SAMBIJAJAR NO. 11, TAMAN, TAMAN, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10612,10614', 'Sambel Kacang, Sambel Kepyur', '11/04/2022 10:25', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(22, 22, 'PR ENY WAHYUNINGSIH', 'JL. WIRARAJA NO 3, WINONGO, MANGUHARJO, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'JL. WIRARAJA NO 3, WINONGO, MANGUHARJO, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10612,13134,10710', 'SAMBEL KACANG, BATIK KENANGA, ONDE ONDE', '19/04/2022 09:56', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(23, 23, 'PR Rita Batik', 'Jl Bawono Mulyo E 25 RT 33 RW 10, Rejomulyo, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl Bawono Mulyo E 25 RT 33 RW 10, Rejomulyo, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik', '19/04/2022 13:20', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(24, 24, 'PUD Perumda Air Minum Tirta Taman Sari', 'Jl. Sulawesi No. 18, Kartoharjo, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pesanggrahan, Kejuron, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11051', 'Air Minum Dalam Kemasan', '20/04/2022 07:59', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(25, 25, 'CV Faniyo', 'Jl. Tawangsuko, Sawah Lor Ban, Rejomulyo, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Tawangsuko, Sawah Lor Ban, Rejomulyo, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Pengerjaan Khusus Logam dan Barang Dari Logam', '21/06/2022 11:01', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(26, 26, 'PR Surya Kencana', 'Jl. Basuki Rahmat No. 9, Tawangrejo, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 9, Tawangrejo, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '20292', 'Kembang Api Mainan', '29/07/2022 15:54', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(27, 27, 'PR Lestari Wuni', 'JL. Wuni No. 12-B RT/RW 039/012, Kejuron, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'JL. Wuni No. 12-B RT/RW 039/012, Kejuron, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794,10793', 'Kering Kentang, Sambel Pecel', '23/08/2022 14:37', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(28, 28, 'PR Depot Air Minum Doni', 'Jl. Yos Sudarso Gg. Setia No. 19, Patihan, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso Gg. Setia No. 19, Patihan, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11052', 'Air Isi Ulang', '30/08/2022 09:25', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(29, 29, 'PR Istana Mode', 'Jl. Dungus Manis 18/20, Manisrejo, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Dungus Manis 18/20, Manisrejo, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Penjahit / Konveksi', '30/08/2022 11:16', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(30, 30, 'PR Rumah Produksi Suni', 'Jl. Terate Gg 2, Banjarejo, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Terate Gg 2, Banjarejo, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793,11090,10710', 'Produksi Sambel, Produksi Jamu, Produksi Pop Corn', '08/09/2022 16:13', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(31, 31, 'PR Tebu', 'Jl. Panglima Sudirman No. 25 RT.032 RW.010, Kejuron, Taman, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Panglima Sudirman No. 25 RT.032 RW.010, Kejuron, Taman, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '12019', 'Rokok Klobot', '16/09/2022 09:28', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(32, 32, 'CV Pink Inspiration', 'Jl. Widosari No. 28, Oro-oro Ombo, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Widosari No. 28, Oro-oro Ombo, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '18111,14111', 'Percetakan, Konveksi', '18/10/2022 14:31', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(33, 33, 'PR Rapi', 'Jalan Indragiri Gg II No 14, Pandean, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jalan Indragiri Gg II No 14, Pandean, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120,47712,47714,14111,47713', 'Konveksi, Sablon, Bordir, Perlengkapan Kantor dan Sekolah', '23/11/2022 09:10', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(34, 34, 'PR In Muno', 'Jl. Majapahit No 47 Madiun, Winongo, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Doho No 15 Madiun, Winongo, Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'TAS', '11/01/2023 16:09', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(35, 35, 'PR Myartin', 'Jl. Dwijaya 3 No 10, Klegen, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Dwijaya 3 No 10, Klegen, Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '32903,1412', 'Lukis kaca, Tas kain', '11/01/2023 16:16', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(36, 36, 'PR Charu Dhatri', 'Jln. Semangka No. 48 RT 32/RW 10, Taman, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jln. Semangka No. 36 RT 32/RW 10, Taman, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '16292', 'Kerajinan tas goni', '11/01/2023 16:18', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(37, 37, 'PR DIAH ANGGRAINI', 'Jl. Borobudur Gang V/1, Madiun Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Borobudur Gang V/1, Madiun Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis, Batik Pergiwo Pergiwati', '11/01/2023 16:22', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(38, 38, 'PR Heny Moerdaningsih', 'Jl. Dwi Jaya 3 no. 9 Madiun, Klegen, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Dwi Jaya 3 no. 9 Madiun, Klegen, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14302,13922', 'Baju, Tas, Jilbab', '11/01/2023 16:28', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(39, 39, 'PR Suciae', 'Jalan Borobudur Gg. I No. 97, Madiun Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jalan Borobudur Gg. I No. 97, Madiun Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '32903', 'Jilbab lukis, Tas lukis, Topi lukis', '11/01/2023 16:43', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(40, 40, 'PR WIWIN SUPRIANI', 'PERM PANORAMA WILIS BLOK A NO 23, Pandean, Taman, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'PERM PANORAMA WILIS BLOK A NO 23, Pandean, Taman, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Industri Batik', '13/01/2023 08:51', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(41, 41, 'PR Ketut Taylor', 'Jl. Kamboja No. 20, Oro-oro Ombo, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Kamboja No. 20, Oro-oro Ombo, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Penjahitan dan Pembuatan Pakaian sesuai Pesanan', '02/02/2023 13:58', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(42, 42, 'PR Grindo', 'Jl. Kutai 54, Pandean, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Kutai 54, Pandean, Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '12019', 'Industri', '24/02/2023 19:27', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(43, 43, 'PR Asih Wartiani', 'Jl. Jonggrang No. 34-B, Patihan, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Jonggrang No. 34-B, Patihan, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Jonggrang', '01/03/2023 16:38', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(44, 44, 'PR R.R Yoeni Astoeti', 'Jl. Banda No. 18, Madiun Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Banda No. 18, Madiun Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134,13912', 'Batik Ceriwis, YOEKFA CRAFT', '02/03/2023 09:36', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(45, 45, 'PR Wiwik Rumiyani', 'Jl. Sikatan Gg. Gemak No. 16, Nambangan Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Sikatan Gg. Gemak No. 16, Nambangan Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10750,13134', 'Industri Makanan dan Masakan Olahan, Batik Abadi', '02/03/2023 09:38', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(46, 46, 'PR SRI MURNIATI', 'Jl. Halmahera No. 14 RT/RW 026/006, Oro-oro Ombo, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Halmahera No. 21 RT/RW 026/006, Oro-oro Ombo, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134,10772', 'Batik Moerni 21, Sambel Pecel', '02/03/2023 09:40', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(47, 47, 'PR Wmh Batik', 'Jl. Gajahmada No. 21, Winongo, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Gajahmada No. 21, Winongo, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'WmH Batik', '02/03/2023 09:43', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(48, 48, 'PR Yu.an Batik', 'Jl. Sarana Mulya Gg. Buntu No. 21, Rejomulyo, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Sarana Mulya Gg. Buntu No. 21, Rejomulyo, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Yu.An Batik', '02/03/2023 09:45', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(49, 49, 'PR Kesiana Batik', 'Jl. Gambirsawit Utara No. 29, Sogaten, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Gambirsawit Utara No. 29, Sogaten, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134,38302', 'Batik tulis, Batik Kesiana Ana', '02/03/2023 10:25', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(50, 50, 'PR Batik Nadthom', 'Jl. Sentul Gg IV No 4-B, Banjarejo, Taman, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Sentul Gg IV No 4-B, Banjarejo, Taman, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Nadthom', '02/03/2023 10:28', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(51, 51, 'PR Deyfa Batik', 'Jl. Pagu Indah VI No. 6, Manisrejo, Taman, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pagu Indah VI No. 6, Manisrejo, Taman, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134,14111', 'Deyfa Batik, Deyfa Jahit', '02/03/2023 10:38', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(52, 52, 'PR Batik Aruny', 'Jl. Masjid No. 3C RT.22/RW.05, Kanigoro, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Masjid No. 3C RT.22/RW.05, Kanigoro, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Aruny', '02/03/2023 10:42', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(53, 53, 'PR Wijiati', 'Jl. Walet No. 15, Nambangan Kidul, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Walet No. 15, Nambangan Kidul, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'BATIK ZAHIDA', '02/03/2023 11:25', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(54, 54, 'PR MARSUNI', 'Jl. Cendrawasih Gg. Pinguin No.24, Nambangan Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Cendrawasih Gg. Pinguin No.24, Nambangan Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Permata', '02/03/2023 11:38', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(55, 55, 'PR Lintang Mas', 'Jl. Prajuritan Gang Sekolah No. 04, Madiun Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Prajuritan Gang Sekolah No. 04, Madiun Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '21022,13134,56103', 'Teh Rosela, Batik tulis dan cap, Makanan ringan', '02/03/2023 13:19', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(56, 56, 'PR Batik Ndredes', 'Jalan Jaya 11, Klegen, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jalan Jaya Nomor 15, Klegen, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Kain Batik', '02/03/2023 13:20', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(57, 57, 'PR Catering El', 'SABDOPALON GG 1. RT/RW 005/002, Winongo, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'SABDOPALON GG 1. RT/RW 005/002, Winongo, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10799', 'Makanan dan Minuman Lainnya', '02/03/2023 13:27', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(58, 58, 'PR D\'prim', 'Jalan Srigadis Gg Melati No 8 F, Kanigoro, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jalan Srigadis Gg Melati No 8 F, Kanigoro, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu D\'Prim', '02/03/2023 13:30', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(59, 59, 'PR Sidomulyo Kitchen', 'jl sido mulyo 1 no.35, Kanigoro, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'jl sido mulyo 1 no.35, Kanigoro, Kartoharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Roti dan Kue', '02/03/2023 13:49', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(60, 60, 'PR Batik Pincoek', 'Jl. Merpati No.47-B, Nambangan Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Merpati No.47-B, Nambangan Lor, Manguharjo, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Industri Batik', '02/03/2023 14:20', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(61, 61, 'PR Sundus Suraida', 'Jl. Yos Sudarso No. 92, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 92, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '09/04/2024 10:43', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(62, 62, 'PR Laksmita Endah Palupi', 'Jl. Basuki Rahmat No. 33, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 33, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '16/03/2024 10:48', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(63, 63, 'PR Argo Suryo Saputro', 'Jl. Yos Sudarso No. 67, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 67, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '25/08/2024 10:16', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(64, 64, 'PR Asrifan', 'Jl. Yos Sudarso No. 63, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 63, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '08/09/2024 10:39', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(65, 65, 'PR Hari Fitri Rokhayati', 'Jl. Thamrin No. 131, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 131, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '17/01/2024 10:57', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(66, 66, 'PR Eny Setiyowati', 'Jl. Serayu No. 3, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 3, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '18/12/2024 10:18', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(67, 67, 'PR Angelika Gunadi Widjanarko', 'Jl. HOS Cokroaminoto No. 139, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 139, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '15/06/2024 10:34', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(68, 68, 'PR Gleddy Dinar Andytha', 'Jl. Basuki Rahmat No. 119, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 119, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '06/08/2024 10:26', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(69, 69, 'PR Chairatun Lies Setyorini', 'Jl. Basuki Rahmat No. 30, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 30, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '21/04/2024 10:29', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(70, 70, 'PR Dyan Hira Kuncahyowati', 'Jl. Pandean No. 51, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 51, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '23/07/2024 10:12', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(71, 71, 'PR Endang Puji Astuti', 'Jl. Thamrin No. 61, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 61, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '05/11/2024 10:12', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(72, 72, 'PR Rizki Puspito Rahayu', 'Jl. Pandean No. 128, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 128, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '12/05/2024 10:21', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(73, 73, 'CV Energy Cipta Kreasi', 'Jl. HOS Cokroaminoto No. 84, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 84, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '10/03/2024 10:16', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(74, 74, 'PR Enny Indartie', 'Jl. Pandean No. 108, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 108, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '19/11/2024 10:34', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(75, 75, 'PR Ria Harum Mawarni', 'Jl. Soekarno Hatta No. 116, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 116, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '20/07/2024 10:11', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(76, 76, 'CV Bina Remaja Sejahtera', 'Jl. Yos Sudarso No. 35, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 35, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '10/06/2024 10:56', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(77, 77, 'PR Anny Dwi Poerwahjoeningtyas', 'Jl. Basuki Rahmat No. 52, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 52, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '23/03/2024 10:17', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(78, 78, 'PR Siti Jubaidhah', 'Jl. HOS Cokroaminoto No. 137, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 137, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '16/11/2024 10:53', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(79, 79, 'PT Gudang Makmur Tobacco', 'Jl. Thamrin No. 96, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 96, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '09/02/2024 10:56', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(80, 80, 'PR Marseno Budi Prasetiyo', 'Jl. Yos Sudarso No. 120, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 120, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '08/04/2024 10:28', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(81, 81, 'PR Nurul Khamidiyah', 'Jl. Pandean No. 122, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 122, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '18/11/2024 10:20', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(82, 82, 'PR Diah Fitri Puspitasari', 'Jl. Thamrin No. 144, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 144, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '25/02/2024 10:44', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(83, 83, 'PR Pamuko Kisyudho Hadi', 'Jl. Yos Sudarso No. 51, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 51, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '28/03/2024 10:26', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(84, 84, 'PR Yuni Sulistyowati', 'Jl. Mayjen Sungkono No. 100, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 100, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '06/11/2024 10:21', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(85, 85, 'PR Arik Ardiana', 'Jl. Soekarno Hatta No. 134, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 134, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '08/08/2024 10:44', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(86, 86, 'FA Hartono & Sons', 'Jl. Salak No. 88, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 88, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '28/03/2024 10:25', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(87, 87, 'PR Kusnan Marjuki', 'Jl. Yos Sudarso No. 109, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 109, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '15/10/2024 10:15', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(88, 88, 'PT Starone Mitra Telekomunikasi', 'Jl. Salak No. 72, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 72, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '16/11/2024 10:53', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(89, 89, 'CV Krakatoa Sukses Mandiri', 'Jl. Mayjen Sungkono No. 45, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 45, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '04/02/2024 10:23', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(90, 90, 'PR Syafril Hidayat', 'Jl. Mayjen Sungkono No. 5, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 5, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '21/02/2024 10:44', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(91, 91, 'PR Nurissa Ervikasari', 'Jl. Mayjen Sungkono No. 74, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 74, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920, 10710', 'PENGERJAAN DAN PELAPISAN LOGAM, INDUSTRI PRODUK BAKERI', '02/09/2024 10:16', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:06:42'),
(92, 92, 'PR Rustika Dewi Wijayanti', 'Jl. Basuki Rahmat No. 121, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 121, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090, 10750', 'INDUSTRI MINUMAN LAINNYA & JAMU BOTOLAN, INDUSTRI MAKANAN DAN MASAKAN OLAHAN', '04/02/2024 10:21', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:03:13'),
(93, 93, 'PR Cahyo Kuncoro Suni Pratomo', 'Jl. HOS Cokroaminoto No. 79, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 79, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '23/07/2024 10:19', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(94, 94, 'PR Rischy Anisa Posa Putri Antono', 'Jl. Pandean No. 28, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 28, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '22/10/2024 10:54', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(95, 95, 'PR Robet Frenida', 'Jl. Soekarno Hatta No. 120, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 120, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '07/06/2024 10:55', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(96, 96, 'PR Dyah Lukitasari Wardhani', 'Jl. Soekarno Hatta No. 12, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 12, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '02/09/2024 10:20', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(97, 97, 'PR Kuswati', 'Jl. Yos Sudarso No. 133, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 133, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '18/12/2024 10:33', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(98, 98, 'PR Ika Lusiana Magdalena', 'Jl. Basuki Rahmat No. 20, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 20, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '20/01/2024 10:54', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(99, 99, 'PR Enggar Lestari Rahayu', 'Jl. Thamrin No. 24, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 24, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '23/12/2024 10:59', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(100, 100, 'PR Wahyu Lestari', 'Jl. Thamrin No. 127, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 127, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '14/03/2024 10:18', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(101, 101, 'PR Peny Setyowati', 'Jl. Salak No. 113, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 113, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '02/02/2024 10:33', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(102, 102, 'PR Sri Suwartini', 'Jl. Trunojoyo No. 89, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 89, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '27/06/2024 10:14', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(103, 103, 'PR Rodhiyah Agustina', 'Jl. Trunojoyo No. 96, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 96, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '18/07/2024 10:56', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(104, 104, 'PD Indah Palupi', 'Jl. Pandean No. 103, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 103, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '27/12/2024 10:31', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(105, 105, 'PR Lily Nani Susanti', 'Jl. Trunojoyo No. 71, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 71, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '20/01/2024 10:35', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(106, 106, 'PR Fendi Dwi Iswanto', 'Jl. Soekarno Hatta No. 147, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 147, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '13/12/2024 10:42', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(107, 107, 'PR Diah Novia Erlensi', 'Jl. HOS Cokroaminoto No. 134, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 134, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '20/10/2024 10:11', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(108, 108, 'PR Retno Dinnar Mela Ambari', 'Jl. HOS Cokroaminoto No. 87, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 87, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '24/12/2024 10:13', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(109, 109, 'PR Eva Maya Laksmina Dewi', 'Jl. Soekarno Hatta No. 117, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 117, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '20/01/2024 10:22', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(110, 110, 'PT Mars Tech Global', 'Jl. Trunojoyo No. 78, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 78, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '02/09/2024 10:22', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(111, 111, 'PR Sri Ismiati', 'Jl. Serayu No. 128, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 128, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '16/01/2024 10:51', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(112, 112, 'PR Resmita Sari', 'Jl. Mayjen Sungkono No. 97, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 97, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '23/12/2024 10:56', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(113, 113, 'PR Hesty Irawati', 'Jl. Soekarno Hatta No. 110, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 110, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '19/02/2024 10:41', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(114, 114, 'PR Fariz Tresnanto Jati Kusuma', 'Jl. HOS Cokroaminoto No. 4, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 4, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '27/04/2024 10:52', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41');
INSERT INTO `siinas_industries` (`id`, `no_urut`, `nama_perusahaan`, `alamat_kantor_pusat`, `provinsi_kantor`, `kode_provinsi_kantor`, `kabkota_kantor`, `kode_kabkota_kantor`, `kode_kelurahan_kantor`, `kode_kecamatan_kantor`, `alamat_pabrik`, `provinsi_pabrik`, `kode_provinsi_pabrik`, `kabkota_pabrik`, `kode_kabkota_pabrik`, `kode_kelurahan_pabrik`, `kode_kecamatan_pabrik`, `kbli`, `bidang_usaha`, `tanggal_registrasi`, `skala_usaha`, `status_pelaporan`, `created_at`, `updated_at`) VALUES
(115, 115, 'PR Kristian Frenky Prasetyo', 'Jl. Basuki Rahmat No. 109, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 109, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '03/10/2024 10:29', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(116, 116, 'PR Vicha Aurelya Septiarty', 'Jl. Soekarno Hatta No. 12, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 12, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '24/10/2024 10:33', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(117, 117, 'PR Aditya Nur Pradipta', 'Jl. Mayjen Sungkono No. 89, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 89, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '19/01/2024 10:32', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(118, 118, 'PR Adella Firdhi Irawan', 'Jl. Mayjen Sungkono No. 71, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 71, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '04/10/2024 10:36', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(119, 119, 'PR Uung Sriwulan Wijayanti', 'Jl. HOS Cokroaminoto No. 54, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 54, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '21/05/2024 10:19', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(120, 120, 'PR Yusni Antarika Wijayanti', 'Jl. Yos Sudarso No. 51, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 51, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '27/10/2024 10:15', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(121, 121, 'PR Herlin Susilowati', 'Jl. Yos Sudarso No. 71, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 71, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '01/11/2024 10:56', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(122, 122, 'PR Dinada Wahyu Septiana', 'Jl. Trunojoyo No. 31, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 31, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '10/09/2024 10:37', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(123, 123, 'PR Diyah Sri Kusuma Dewi', 'Jl. Salak No. 84, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 84, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '01/12/2024 10:34', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(124, 124, 'PR Afrilia Fouri Akadiani', 'Jl. Trunojoyo No. 15, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 15, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '08/02/2024 10:17', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(125, 125, 'PR Hafidz Hazanul Azmi', 'Jl. HOS Cokroaminoto No. 144, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 144, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '11/07/2024 10:28', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(126, 126, 'CV Mitra Jaya Sejahtera', 'Jl. Salak No. 3, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 3, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '12/06/2024 10:22', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(127, 127, 'PR Yuli Nursanti', 'Jl. Trunojoyo No. 19, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 19, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '03/12/2024 10:18', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(128, 128, 'CV Toti Bintang Sakti', 'Jl. Salak No. 144, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 144, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '20/04/2024 10:16', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(129, 129, 'CV Tambang Kuliner Nusantara', 'Jl. Basuki Rahmat No. 72, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 72, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '21/08/2024 10:57', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(130, 130, 'CV Amins Project Teknologi Indonesia', 'Jl. Salak No. 84, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 84, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '12/02/2024 10:52', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(131, 131, 'CV Sumber Pangestu Mandiri', 'Jl. Yos Sudarso No. 104, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 104, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '04/11/2024 10:14', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(132, 132, 'PR Sudarti', 'Jl. Soekarno Hatta No. 110, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 110, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '15/03/2024 10:47', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(133, 133, 'PR Yenita Ginawati', 'Jl. Yos Sudarso No. 27, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 27, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '03/10/2024 10:24', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(134, 134, 'PR Endah Tri Lestari', 'Jl. HOS Cokroaminoto No. 89, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 89, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '10/04/2024 10:42', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(135, 135, 'PR Ema Maharani', 'Jl. Salak No. 65, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 65, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '01/05/2024 10:10', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(136, 136, 'CV Surya Buana Perkasa', 'Jl. Salak No. 102, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 102, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '17/01/2024 10:36', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(137, 137, 'CV Wirasena Mulia Abadi', 'Jl. Trunojoyo No. 130, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 130, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '05/03/2024 10:14', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(138, 138, 'PR Erma Indi Silviana', 'Jl. Basuki Rahmat No. 121, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 121, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '02/03/2024 10:14', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(139, 139, 'PT Crucil Factory Indonesia', 'Jl. Pandean No. 22, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 22, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '05/02/2024 10:40', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(140, 140, 'CV Tiga Putra Mandiri', 'Jl. Mayjen Sungkono No. 41, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 41, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '18/02/2024 10:23', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(141, 141, 'PT Yada Wasista Indonesia', 'Jl. Soekarno Hatta No. 51, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 51, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '05/09/2024 10:48', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(142, 142, 'PT Surya Kencana Sakti', 'Jl. Basuki Rahmat No. 10, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 10, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '01/11/2024 10:33', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(143, 143, 'PR Endah Prabaning Siwi', 'Jl. Mayjen Sungkono No. 107, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 107, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '25/07/2024 10:58', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(144, 144, 'PT Bebas Inti Cendekia', 'Jl. Mayjen Sungkono No. 65, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 65, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '05/04/2024 10:36', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(145, 145, 'PR Erlina Dhinardijah', 'Jl. Salak No. 62, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 62, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '02/08/2024 10:14', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(146, 146, 'PR Visca Lonika Silviola', 'Jl. Soekarno Hatta No. 123, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 123, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '22/06/2024 10:36', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(147, 147, 'PR Rahmat Yuliawan', 'Jl. Basuki Rahmat No. 125, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 125, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '22/01/2024 10:14', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(148, 148, 'CV Fotosintesis', 'Jl. Thamrin No. 118, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 118, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '17/06/2024 10:10', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(149, 149, 'PR Dewi Sulistyani', 'Jl. Pandean No. 22, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 22, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '27/08/2024 10:42', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(150, 150, 'PR Gunawan Sastrowiyono', 'Jl. Salak No. 138, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 138, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '28/09/2024 10:56', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(151, 151, 'CV Makmur Jaya Abadi', 'Jl. Thamrin No. 11, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 11, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '19/08/2024 10:57', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(152, 152, 'PR Sumarsih', 'Jl. Mayjen Sungkono No. 100, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 100, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '22/11/2024 10:14', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(153, 153, 'PR A.h Mintardja', 'Jl. Soekarno Hatta No. 66, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 66, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '28/02/2024 10:51', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(154, 154, 'PR Dewi Chuzaimah', 'Jl. Mayjen Sungkono No. 145, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 145, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '28/04/2024 10:50', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(155, 155, 'PR Wahyu Nawangsari', 'Jl. Mayjen Sungkono No. 139, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 139, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '25/03/2024 10:13', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(156, 156, 'PR Warsi Astutiningsih', 'Jl. Basuki Rahmat No. 46, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 46, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '24/11/2024 10:39', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(157, 157, 'CV Megah Kusuma', 'Jl. Mayjen Sungkono No. 49, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 49, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '17/05/2024 10:50', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(158, 158, 'PR Kristinar Ayu Dya', 'Jl. Trunojoyo No. 95, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 95, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '07/05/2024 10:58', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(159, 159, 'PR Wardoyo', 'Jl. Serayu No. 60, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 60, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '04/06/2024 10:46', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(160, 160, 'PR Ahmad Syafrie Syamsudin', 'Jl. Basuki Rahmat No. 129, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 129, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '10/03/2024 10:11', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(161, 161, 'PR E Kristin Yuliana', 'Jl. Serayu No. 138, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 138, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '23/05/2024 10:30', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(162, 162, 'PR Nunung Setiyani', 'Jl. Mayjen Sungkono No. 17, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 17, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '02/06/2024 10:15', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(163, 163, 'PR Yustikha Ratih', 'Jl. Salak No. 87, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 87, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '16/08/2024 10:56', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(164, 164, 'PR Muchamad Ludvi Ash Arianto', 'Jl. HOS Cokroaminoto No. 90, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 90, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '16/04/2024 10:55', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(165, 165, 'PR Aminah Cendrakasih', 'Jl. Thamrin No. 87, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 87, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '16/09/2024 10:39', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(166, 166, 'PR Diyah Arum Purnomo Wulan', 'Jl. Mayjen Sungkono No. 90, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 90, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '03/05/2024 10:54', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(167, 167, 'PR Tina Susanti', 'Jl. Thamrin No. 2, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 2, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '10/11/2024 10:22', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(168, 168, 'PR Tri Vyatra Rahmawati', 'Jl. Salak No. 28, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 28, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '07/01/2024 10:25', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(169, 169, 'PR Ana Kasri Hendarwati', 'Jl. Basuki Rahmat No. 131, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 131, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '22/01/2024 10:31', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(170, 170, 'PR Heri Eli Nuriyani', 'Jl. Salak No. 148, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 148, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '17/08/2024 10:35', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(171, 171, 'PR Novi Wijaya', 'Jl. Mayjen Sungkono No. 1, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 1, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '03/01/2024 10:43', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(172, 172, 'PR Yulis Andriana', 'Jl. Yos Sudarso No. 60, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 60, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '23/06/2024 10:44', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(173, 173, 'PR Sambal Cumi Mak E Arsy', 'Jl. Salak No. 137, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 137, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '04/08/2024 10:42', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(174, 174, 'PR Sambel Pecel Sembilan Bintang', 'Jl. Soekarno Hatta No. 118, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 118, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '11/04/2024 10:26', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(175, 175, 'PR Rahmad Rejeqi Kurniawan', 'Jl. Mayjen Sungkono No. 85, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 85, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '02/12/2024 10:38', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(176, 176, 'PT Nusa Karya Mulya Medika', 'Jl. Pandean No. 128, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 128, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '23/08/2024 10:20', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(177, 177, 'PR Sri Wurjanti', 'Jl. Mayjen Sungkono No. 122, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 122, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '11/05/2024 10:14', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:41', '2026-07-30 04:00:41'),
(178, 178, 'CV Berkah Konveksi', 'Jl. Trunojoyo No. 52, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 52, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '23/04/2024 10:26', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(179, 179, 'PR Rice Indyawati', 'Jl. Basuki Rahmat No. 109, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 109, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '26/02/2024 10:49', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(180, 180, 'PR Akhmad Subkhan', 'Jl. Serayu No. 116, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 116, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '24/08/2024 10:18', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(181, 181, 'PR Titin Supini', 'Jl. Soekarno Hatta No. 37, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 37, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '26/03/2024 10:56', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(182, 182, 'PR Yussuf Herlambang Nurendroyono', 'Jl. Salak No. 20, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 20, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '06/09/2024 10:29', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(183, 183, 'PR Yuyun Dwi Pangesti', 'Jl. HOS Cokroaminoto No. 22, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 22, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '17/09/2024 10:49', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(184, 184, 'PR Aan Pristianto', 'Jl. Serayu No. 72, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 72, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '22/10/2024 10:44', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(185, 185, 'PR Tutik Hariyanti', 'Jl. Serayu No. 148, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 148, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '16/02/2024 10:36', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(186, 186, 'PR Ani Sukowilistari', 'Jl. Mayjen Sungkono No. 85, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 85, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '25/06/2024 10:52', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(187, 187, 'PR Yahya Sriwinarti', 'Jl. Trunojoyo No. 124, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 124, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '08/10/2024 10:27', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(188, 188, 'PR Ervina Sulistyaningsih', 'Jl. Soekarno Hatta No. 45, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 45, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '21/03/2024 10:36', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(189, 189, 'PR Amalia Ekasari Haryanti', 'Jl. Basuki Rahmat No. 64, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 64, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '24/08/2024 10:34', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(190, 190, 'PR Sutiknyo', 'Jl. Basuki Rahmat No. 77, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 77, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '22/09/2024 10:55', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(191, 191, 'PR Sulistiyani', 'Jl. Yos Sudarso No. 62, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 62, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '07/04/2024 10:29', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(192, 192, 'PR Muhammad Saifudin', 'Jl. Basuki Rahmat No. 66, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 66, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '20/12/2024 10:22', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(193, 193, 'PR Helda Tri Habsari', 'Jl. Thamrin No. 89, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 89, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '09/08/2024 10:38', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(194, 194, 'PR Aditya Ilham Nuradhy', 'Jl. Serayu No. 125, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 125, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '03/05/2024 10:33', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(195, 195, 'PR Arlisa Jati Wulandari', 'Jl. Basuki Rahmat No. 58, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 58, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '12/04/2024 10:25', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(196, 196, 'PR Pipit Ananti Wulandari', 'Jl. Yos Sudarso No. 42, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 42, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '14/03/2024 10:25', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(197, 197, 'PR Rini Pujiastuti', 'Jl. Basuki Rahmat No. 111, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 111, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '15/03/2024 10:41', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(198, 198, 'PR Kiki Yuliana Gerssom', 'Jl. Basuki Rahmat No. 20, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 20, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '08/10/2024 10:33', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(199, 199, 'PR Shinta Wijayanti Candra Wardhani', 'Jl. Thamrin No. 33, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 33, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '08/08/2024 10:38', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(200, 200, 'PT Marolis Cahaya Internasional', 'Jl. Salak No. 4, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 4, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '06/07/2024 10:16', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(201, 201, 'PR Felicia Gunawan', 'Jl. Yos Sudarso No. 80, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 80, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '01/01/2024 10:45', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(202, 202, 'PR Sri Sugiarti', 'Jl. HOS Cokroaminoto No. 127, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 127, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '14/10/2024 10:50', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(203, 203, 'PR Indria Sari Dewi', 'Jl. Trunojoyo No. 140, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 140, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '20/10/2024 10:33', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(204, 204, 'PR Lilik Susiana', 'Jl. Basuki Rahmat No. 67, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 67, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '02/08/2024 10:23', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(205, 205, 'PR Tutik Purnamawati', 'Jl. Thamrin No. 27, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 27, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '18/12/2024 10:55', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(206, 206, 'PR Anita Puspitasari', 'Jl. Thamrin No. 23, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 23, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '14/07/2024 10:21', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(207, 207, 'PR Risalia Asri Dewi', 'Jl. Thamrin No. 138, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 138, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '14/11/2024 10:34', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(208, 208, 'PR Irma Prihatin', 'Jl. Pandean No. 24, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 24, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '28/04/2024 10:29', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(209, 209, 'PR Atik Pundhi Asmorowati', 'Jl. Salak No. 23, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 23, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '14/05/2024 10:18', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(210, 210, 'PR Wasini', 'Jl. Soekarno Hatta No. 66, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 66, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '14/12/2024 10:18', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(211, 211, 'PR Lexi Diana Rakhmayanti', 'Jl. Pandean No. 29, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 29, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '24/04/2024 10:23', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(212, 212, 'PR Heni Nur Chasanah', 'Jl. Mayjen Sungkono No. 109, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 109, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '11/06/2024 10:24', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(213, 213, 'PR Agustina Supriati', 'Jl. Pandean No. 97, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 97, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '26/01/2024 10:16', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(214, 214, 'PR Marmi', 'Jl. Serayu No. 73, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 73, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '22/02/2024 10:11', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(215, 215, 'PR Vivi Agustin', 'Jl. Soekarno Hatta No. 20, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 20, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '10/01/2024 10:56', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(216, 216, 'PR Dwi Ambar Wati', 'Jl. Thamrin No. 5, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 5, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '01/06/2024 10:33', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(217, 217, 'PR Wiwik Mariyati', 'Jl. Yos Sudarso No. 4, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 4, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '17/12/2024 10:29', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(218, 218, 'PR Fitria Krisnawati', 'Jl. Serayu No. 46, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 46, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '24/07/2024 10:32', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(219, 219, 'PR Sugeng Maryadi', 'Jl. Mayjen Sungkono No. 80, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 80, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '03/05/2024 10:54', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(220, 220, 'PR Indra Susilani', 'Jl. Trunojoyo No. 106, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 106, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '20/04/2024 10:32', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(221, 221, 'PR Romy Satya Yan Haryanto', 'Jl. Basuki Rahmat No. 69, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 69, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '12/10/2024 10:59', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(222, 222, 'PR Hasna Fadhilah', 'Jl. Serayu No. 38, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 38, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '10/12/2024 10:37', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(223, 223, 'PR Ariyanti', 'Jl. Pandean No. 2, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 2, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '23/02/2024 10:41', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(224, 224, 'PR Hasmawati', 'Jl. Trunojoyo No. 144, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 144, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '20/05/2024 10:58', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(225, 225, 'PR Yuningsih', 'Jl. Serayu No. 12, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 12, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '04/02/2024 10:50', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(226, 226, 'PR Septi Hari Kurniawati', 'Jl. Trunojoyo No. 83, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 83, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '04/11/2024 10:17', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(227, 227, 'PR Irawati Widyaningsih', 'Jl. Basuki Rahmat No. 86, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 86, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '05/04/2024 10:17', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42');
INSERT INTO `siinas_industries` (`id`, `no_urut`, `nama_perusahaan`, `alamat_kantor_pusat`, `provinsi_kantor`, `kode_provinsi_kantor`, `kabkota_kantor`, `kode_kabkota_kantor`, `kode_kelurahan_kantor`, `kode_kecamatan_kantor`, `alamat_pabrik`, `provinsi_pabrik`, `kode_provinsi_pabrik`, `kabkota_pabrik`, `kode_kabkota_pabrik`, `kode_kelurahan_pabrik`, `kode_kecamatan_pabrik`, `kbli`, `bidang_usaha`, `tanggal_registrasi`, `skala_usaha`, `status_pelaporan`, `created_at`, `updated_at`) VALUES
(228, 228, 'PR Syabella Rachmadiaocta Tataksmara', 'Jl. Yos Sudarso No. 73, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 73, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '28/07/2024 10:57', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(229, 229, 'PR Johanes Leo Agung', 'Jl. Salak No. 28, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 28, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '28/04/2024 10:44', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(230, 230, 'PR Sari Shanti Marahela', 'Jl. Salak No. 116, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 116, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '22/03/2024 10:42', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(231, 231, 'PR Vina Catur Agustin', 'Jl. Salak No. 84, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 84, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '20/01/2024 10:16', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(232, 232, 'PR Noven Pramusta', 'Jl. Salak No. 39, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 39, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '26/11/2024 10:46', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(233, 233, 'PR Revina Febriani Putri', 'Jl. HOS Cokroaminoto No. 37, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 37, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '12/02/2024 10:19', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(234, 234, 'PR Rahayu Pontjowati', 'Jl. HOS Cokroaminoto No. 57, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 57, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '07/01/2024 10:58', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(235, 235, 'PR Rini Wijayanti', 'Jl. Yos Sudarso No. 114, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 114, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '22/11/2024 10:17', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(236, 236, 'PR Betty Megayanti', 'Jl. HOS Cokroaminoto No. 117, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 117, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '27/11/2024 10:52', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(237, 237, 'PR Shara Ferista Maharani', 'Jl. Thamrin No. 107, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 107, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '02/01/2024 10:19', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(238, 238, 'PR Muhammad Amir Pramana', 'Jl. Serayu No. 31, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 31, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '22/10/2024 10:57', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(239, 239, 'PR Sunarko Tri Mulyo Seputro', 'Jl. Yos Sudarso No. 26, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 26, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '25/05/2024 10:21', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(240, 240, 'PR Indro Gautomo', 'Jl. Salak No. 109, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 109, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '17/07/2024 10:26', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(241, 241, 'PR Imaduddin Ifai', 'Jl. Soekarno Hatta No. 29, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 29, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '18/07/2024 10:35', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(242, 242, 'PR Lisa Christiani', 'Jl. Serayu No. 20, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 20, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '16/04/2024 10:15', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(243, 243, 'PR Nalia Anggraini', 'Jl. Mayjen Sungkono No. 101, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 101, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '01/06/2024 10:22', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(244, 244, 'PR Zofarlis Damayanti', 'Jl. Thamrin No. 72, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 72, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '05/02/2024 10:39', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(245, 245, 'PR Niniek Yuliarti Panembahan Bandoro Putri', 'Jl. Salak No. 79, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 79, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '21/02/2024 10:36', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(246, 246, 'PR Rahayu', 'Jl. Pandean No. 77, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 77, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '06/08/2024 10:24', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(247, 247, 'PR Okky Dian Pradika', 'Jl. Basuki Rahmat No. 121, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 121, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '02/12/2024 10:37', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(248, 248, 'PR Sri Utami', 'Jl. Pandean No. 130, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 130, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '03/09/2024 10:16', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(249, 249, 'PR Ferdinaya Ratu Wibawa', 'Jl. Soekarno Hatta No. 98, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 98, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '12/01/2024 10:53', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(250, 250, 'PR Devi Ani Astuti', 'Jl. Thamrin No. 78, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 78, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '27/07/2024 10:43', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(251, 251, 'PR Dita Ardianingrum', 'Jl. Trunojoyo No. 61, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 61, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '20/03/2024 10:19', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(252, 252, 'PR Andhi Juniawan', 'Jl. Mayjen Sungkono No. 119, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 119, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '19/01/2024 10:26', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(253, 253, 'PR Ayu Mega Agustina', 'Jl. Thamrin No. 56, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 56, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '24/01/2024 10:57', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(254, 254, 'PR Suhartini', 'Jl. HOS Cokroaminoto No. 51, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 51, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '25/07/2024 10:45', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(255, 255, 'PR Ratih Astria', 'Jl. Yos Sudarso No. 114, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 114, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '10/03/2024 10:29', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(256, 256, 'PR Ririn Rahayu Prihatmi', 'Jl. Serayu No. 30, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 30, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '09/11/2024 10:17', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(257, 257, 'PR Ariz Wahyu Sampurna', 'Jl. Yos Sudarso No. 12, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 12, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '19/09/2024 10:29', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(258, 258, 'PR Dessy Aryanti', 'Jl. Thamrin No. 86, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 86, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '22/09/2024 10:22', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(259, 259, 'PR Rizky Mahendra Wijaya', 'Jl. Salak No. 70, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 70, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '09/07/2024 10:42', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(260, 260, 'PR Lina Dian Anggraini', 'Jl. Mayjen Sungkono No. 30, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 30, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '11/12/2024 10:34', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(261, 261, 'PR Ardiana Septianingrum', 'Jl. Serayu No. 86, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 86, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '21/07/2024 10:16', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(262, 262, 'PR Bimo Galih Pinandhito', 'Jl. HOS Cokroaminoto No. 67, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 67, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '02/04/2024 10:55', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(263, 263, 'PR Tri Puji Handayani', 'Jl. Soekarno Hatta No. 1, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 1, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '28/03/2024 10:31', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(264, 264, 'PR Retno Hartatik', 'Jl. Pandean No. 128, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 128, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '19/09/2024 10:49', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(265, 265, 'PR Erna Dyah Ayu Susilowaty', 'Jl. Serayu No. 110, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 110, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '21/01/2024 10:23', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(266, 266, 'PR Nurul Ramadhani', 'Jl. Trunojoyo No. 118, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 118, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '13/12/2024 10:52', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(267, 267, 'PR Ninin Lia Herlina', 'Jl. Basuki Rahmat No. 111, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 111, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '13/09/2024 10:17', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(268, 268, 'PR Suratminingsih', 'Jl. Soekarno Hatta No. 3, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 3, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '18/02/2024 10:15', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(269, 269, 'PR Djajem', 'Jl. Basuki Rahmat No. 85, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 85, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '20/10/2024 10:17', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(270, 270, 'PR Sumarni', 'Jl. Salak No. 141, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 141, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '07/11/2024 10:51', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(271, 271, 'PR Dewi Kurniastutik', 'Jl. Serayu No. 116, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 116, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '25/10/2024 10:30', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(272, 272, 'PR Warsini', 'Jl. Pandean No. 122, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 122, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '18/07/2024 10:19', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(273, 273, 'PR Susy Kurniasari', 'Jl. Pandean No. 137, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 137, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '22/12/2024 10:18', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(274, 274, 'PR Yulisusilowati', 'Jl. Thamrin No. 26, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 26, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '25/04/2024 10:58', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(275, 275, 'PR Mutiara Zahra Arsyita', 'Jl. Thamrin No. 14, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 14, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '11/05/2024 10:45', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(276, 276, 'PR Ani Sutarni', 'Jl. Yos Sudarso No. 77, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 77, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '09/05/2024 10:11', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(277, 277, 'PR Muhammad Riyan Perkasa Utomo', 'Jl. Basuki Rahmat No. 81, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 81, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '19/07/2024 10:35', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(278, 278, 'PR Rokayah', 'Jl. Yos Sudarso No. 110, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 110, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '27/02/2024 10:28', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(279, 279, 'PR Aristin Ratna Ningrum', 'Jl. Soekarno Hatta No. 94, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 94, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '17/12/2024 10:59', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(280, 280, 'PR Edi Sutrisno', 'Jl. Serayu No. 73, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 73, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '02/02/2024 10:52', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(281, 281, 'PR Murniati', 'Jl. Basuki Rahmat No. 131, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 131, Kel. Nambangan Kidul, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '15/06/2024 10:30', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(282, 282, 'PR Sri Rahayuningsih', 'Jl. Pandean No. 140, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 140, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '28/12/2024 10:19', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(283, 283, 'PR Suryani', 'Jl. Serayu No. 78, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 78, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '24/02/2024 10:56', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(284, 284, 'CV Angkasa Muda', 'Jl. Thamrin No. 117, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 117, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '25/01/2024 10:16', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(285, 285, 'PR Anik Kasiatun', 'Jl. HOS Cokroaminoto No. 57, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 57, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '27/05/2024 10:44', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(286, 286, 'PR Dina Aryati', 'Jl. Thamrin No. 13, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 13, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '26/07/2024 10:34', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(287, 287, 'PR Batik Ndalem Nusantara', 'Jl. Thamrin No. 95, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 95, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '11/02/2024 10:27', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(288, 288, 'PR Batik Nabastala', 'Jl. Mayjen Sungkono No. 12, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 12, Kel. Pandean, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '27/05/2024 10:36', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(289, 289, 'PR ELY INAYAH', 'Jl. Thamrin No. 65, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 65, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '09/03/2024 10:54', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(290, 290, 'PR Soeyitno', 'Jl. Trunojoyo No. 29, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 29, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '15/04/2024 10:47', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(291, 291, 'PR Batik Tulis Pandan Putri', 'Jl. Mayjen Sungkono No. 2, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 2, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '10/04/2024 10:16', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(292, 292, 'PR Ryzha Batik', 'Jl. Pandean No. 92, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 92, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '06/09/2024 10:57', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(293, 293, 'PR Sutamah', 'Jl. Mayjen Sungkono No. 57, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 57, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '06/11/2024 10:24', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(294, 294, 'PR Rolas', 'Jl. HOS Cokroaminoto No. 107, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 107, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '09/06/2024 10:27', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(295, 295, 'PT Berdikari Berkat Semesta', 'Jl. Thamrin No. 115, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 115, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '06/01/2024 10:12', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(296, 296, 'PR Yuyun Yuniati', 'Jl. Serayu No. 100, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 100, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '18/04/2024 10:31', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(297, 297, 'PR Endang Sri Rahayu', 'Jl. HOS Cokroaminoto No. 16, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 16, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '06/01/2024 10:29', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(298, 298, 'PR Lilik Yulianti', 'Jl. HOS Cokroaminoto No. 3, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 3, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '18/06/2024 10:40', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(299, 299, 'PR Francisca Erida Irawati', 'Jl. Mayjen Sungkono No. 48, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 48, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '02/10/2024 10:19', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(300, 300, 'PR Siti Rowiyah', 'Jl. Salak No. 18, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 18, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '20/09/2024 10:30', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(301, 301, 'PR Novilia Ratnawati', 'Jl. Serayu No. 85, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 85, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '14/10/2024 10:49', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(302, 302, 'PR Djoko Slameto', 'Jl. Trunojoyo No. 149, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 149, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '18/01/2024 10:39', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(303, 303, 'PR Sri Wahyuni Mujiastuti', 'Jl. Pandean No. 112, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 112, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '19/09/2024 10:42', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(304, 304, 'PR Diyan Cahyati', 'Jl. HOS Cokroaminoto No. 113, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 113, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '20/12/2024 10:38', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(305, 305, 'PR Subiarsih', 'Jl. Basuki Rahmat No. 127, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 127, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '02/09/2024 10:11', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(306, 306, 'PR Tri Istini', 'Jl. Trunojoyo No. 84, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 84, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '01/01/2024 10:52', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(307, 307, 'PR Yuliana', 'Jl. Pandean No. 123, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 123, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '04/11/2024 10:47', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(308, 308, 'PR Heru Kuntoyo', 'Jl. Salak No. 65, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 65, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '07/04/2024 10:24', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(309, 309, 'PR Tunggal Sari Handayani', 'Jl. Serayu No. 15, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 15, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '26/04/2024 10:14', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(310, 310, 'PR Sukma Kurniasih', 'Jl. Pandean No. 134, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 134, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '04/01/2024 10:34', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(311, 311, 'PR Lien Choirul Hadjariah', 'Jl. Serayu No. 73, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 73, Kel. Madiun Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '09/10/2024 10:54', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(312, 312, 'PR Agustin Noraini', 'Jl. Salak No. 21, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 21, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '08/12/2024 10:49', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(313, 313, 'PR Sri Lestari', 'Jl. Yos Sudarso No. 111, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 111, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '16/06/2024 10:36', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(314, 314, 'PR Yuniati', 'Jl. Mayjen Sungkono No. 44, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Mayjen Sungkono No. 44, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '22/10/2024 10:25', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(315, 315, 'PR Mila Ponia', 'Jl. HOS Cokroaminoto No. 17, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 17, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '03/07/2024 10:50', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(316, 316, 'PR Ida Farida', 'Jl. Yos Sudarso No. 66, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 66, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '27/02/2024 10:31', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(317, 317, 'PR Mas Arief Kusumawijaya', 'Jl. Thamrin No. 70, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 70, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '07/10/2024 10:58', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(318, 318, 'PR Nunuk Sugiarti', 'Jl. Serayu No. 70, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 70, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '17/09/2024 10:55', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(319, 319, 'PR Nurharjanti', 'Jl. Soekarno Hatta No. 75, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 75, Kel. Sogaten, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '26/04/2024 10:27', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(320, 320, 'PR Endah Istiyani', 'Jl. Serayu No. 90, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 90, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '01/01/2024 10:48', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(321, 321, 'PR Eko Subekti Raharjo', 'Jl. Soekarno Hatta No. 18, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 18, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '24/12/2024 10:50', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(322, 322, 'PT Sinergi Mitra Utama', 'Jl. Trunojoyo No. 31, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 31, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '20/10/2024 10:36', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(323, 323, 'PR Ninik Wijaya', 'Jl. Salak No. 22, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Salak No. 22, Kel. Oro-oro Ombo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '02/08/2024 10:59', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(324, 324, 'PR Murtini', 'Jl. Soekarno Hatta No. 80, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 80, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '13/11/2024 10:49', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(325, 325, 'PR Astutik', 'Jl. Basuki Rahmat No. 139, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 139, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '08/08/2024 10:38', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(326, 326, 'PR Heruwati', 'Jl. Trunojoyo No. 104, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 104, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '21/01/2024 10:27', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(327, 327, 'PR Ratnawati Al Hasan', 'Jl. Pandean No. 115, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 115, Kel. Sukosari, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '17/09/2024 10:52', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(328, 328, 'PR Hidayati', 'Jl. Soekarno Hatta No. 135, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 135, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '17/06/2024 10:32', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(329, 329, 'PR Nafifah', 'Jl. Pandean No. 54, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Pandean No. 54, Kel. Josenan, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '05/02/2024 10:17', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(330, 330, 'PR Rachmawati Widyastuti', 'Jl. HOS Cokroaminoto No. 125, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 125, Kel. Kejuron, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '25/07/2024 10:26', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(331, 331, 'PR Eva Hetty Puspitasari', 'Jl. HOS Cokroaminoto No. 110, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. HOS Cokroaminoto No. 110, Kel. Tawangrejo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '06/06/2024 10:27', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(332, 332, 'PR Sulistiyowati', 'Jl. Serayu No. 89, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 89, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '10/04/2024 10:35', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(333, 333, 'PR Niniek Prasetyani', 'Jl. Basuki Rahmat No. 53, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 53, Kel. Winongo, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11040', 'Minuman Herbal / Olahan', '18/10/2024 10:42', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(334, 334, 'PR Fitrotul Mafulah', 'Jl. Soekarno Hatta No. 138, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 138, Kel. Klegen, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '14120', 'Konveksi & Tailor', '21/07/2024 10:31', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(335, 335, 'PR Sri Suhartini', 'Jl. Trunojoyo No. 140, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 140, Kel. Kanigoro, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '03/02/2024 10:11', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(336, 336, 'PR Rosmini', 'Jl. Thamrin No. 86, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Thamrin No. 86, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '02/04/2024 10:39', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(337, 337, 'PR Budi Handaru', 'Jl. Trunojoyo No. 111, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 111, Kel. Taman, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '17/02/2024 10:22', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(338, 338, 'PR Nyaminatun', 'Jl. Soekarno Hatta No. 32, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Soekarno Hatta No. 32, Kel. Nambangan Lor, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'Produksi Roti & Kue', '14/06/2024 10:38', 'Belum Melapor/Mengisi Investasi', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(339, 339, 'PR Kuni Chasanah', 'Jl. Serayu No. 30, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 30, Kel. Patihan, Kec. Manguharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10794', 'Keripik Tempe / Pisang', '17/12/2024 10:42', 'Menengah', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(340, 340, 'PR Ernawati', 'Jl. Serayu No. 18, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Serayu No. 18, Kel. Rejomulyo, Kec. Kartoharjo, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '11090', 'Jamu Tradisional', '18/02/2024 10:55', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(341, 341, 'CV Laksana Sinar Permata', 'Jl. Trunojoyo No. 17, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Trunojoyo No. 17, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '13134', 'Batik Tulis', '18/02/2024 10:24', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42');
INSERT INTO `siinas_industries` (`id`, `no_urut`, `nama_perusahaan`, `alamat_kantor_pusat`, `provinsi_kantor`, `kode_provinsi_kantor`, `kabkota_kantor`, `kode_kabkota_kantor`, `kode_kelurahan_kantor`, `kode_kecamatan_kantor`, `alamat_pabrik`, `provinsi_pabrik`, `kode_provinsi_pabrik`, `kabkota_pabrik`, `kode_kabkota_pabrik`, `kode_kelurahan_pabrik`, `kode_kecamatan_pabrik`, `kbli`, `bidang_usaha`, `tanggal_registrasi`, `skala_usaha`, `status_pelaporan`, `created_at`, `updated_at`) VALUES
(342, 342, 'PR Vitri Wulandari', 'Jl. Yos Sudarso No. 121, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Yos Sudarso No. 121, Kel. Manisrejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10793', 'Sambel Pecel', '03/01/2024 10:52', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(343, 343, 'PR Danuk Sri Arini', 'Jl. Basuki Rahmat No. 1, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Basuki Rahmat No. 1, Kel. Banjarejo, Kec. Taman, Kota Madiun, Jawa Timur', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '25920', 'Jasa Bengkel Las Logam', '04/08/2024 10:42', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:00:42', '2026-07-30 04:00:42'),
(346, 345, 'CInta Sejati Makmur', 'Jl. Gulun Utama Jaya, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, 'Jl. Gulun Utama Jaya, Kota Madiun', 'Jawa Timur', NULL, 'Kota Madiun', NULL, NULL, NULL, '10710', 'INDUSTRI PRODUK ROTI DAN KUE', '25/07/2026 11:30', 'Kecil', 'Terverifikasi SIINas', '2026-07-30 04:31:38', '2026-07-30 04:32:01');

-- --------------------------------------------------------

--
-- Table structure for table `statistik_kecamatan`
--

CREATE TABLE `statistik_kecamatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `jumlah_ikm` int(11) DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jumlah` varchar(255) DEFAULT NULL,
  `total_kunjungan` varchar(255) DEFAULT NULL,
  `pengunjung_aktif` varchar(255) DEFAULT NULL,
  `ikm_terdaftar` varchar(255) DEFAULT NULL,
  `kunjungan_hari_ini` varchar(255) DEFAULT NULL,
  `kunjungan_bulan_ini` varchar(255) DEFAULT NULL,
  `kunjungan_tahun_ini` varchar(255) DEFAULT NULL,
  `kunjungan_total` varchar(255) DEFAULT NULL,
  `sosial_media` longtext DEFAULT NULL,
  `telp_dinas` varchar(255) DEFAULT NULL,
  `email_dinas` varchar(255) DEFAULT NULL,
  `fonnte_token` varchar(255) DEFAULT NULL,
  `admin_wa_number` varchar(255) DEFAULT NULL,
  `wa_notif_active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statistik_kecamatan`
--

INSERT INTO `statistik_kecamatan` (`id`, `kecamatan`, `jumlah_ikm`, `updated_at`, `jumlah`, `total_kunjungan`, `pengunjung_aktif`, `ikm_terdaftar`, `kunjungan_hari_ini`, `kunjungan_bulan_ini`, `kunjungan_tahun_ini`, `kunjungan_total`, `sosial_media`, `telp_dinas`, `email_dinas`, `fonnte_token`, `admin_wa_number`, `wa_notif_active`) VALUES
(1, 'Kartoharjo', 2013, '2026-08-07 02:18:12', '0', '12840', '6', '560', '34', '164', '2153', '3656', '[{\"platform\":\"Instagram\",\"username\":\"@disnakerkukm.madiunkota\",\"url\":\"https://www.instagram.com/disnakerkukm.madiunkota?igsh=cXJqZ3ZjNmJudWFn\"},{\"platform\":\"Instagram\",\"username\":\"@perindustrian.kotamadiun\",\"url\":\"https://www.instagram.com/perindustrian.kotamadiun?igsh=MTFzYnQwMnRhamNs\"},{\"platform\":\"Facebook\",\"username\":\"Disnakerkukm Kota Madiun\",\"url\":\"https://www.facebook.com/share/19RgNeZgVq/\"},{\"platform\":\"TikTok\",\"username\":\"@disnakerkukmkotamadiun\",\"url\":\"https://vm.tiktok.com/ZS9hYefCLguks-CQgR6/\"},{\"platform\":\"X\",\"username\":\"@DisnakerKUKM\",\"url\":\"https://x.com/DisnakerKUKM\"}]', '(0351) 454288', 'disnaker@madiunkota.go.id', 'TqK5aiZZSwXPEqmRu411', '085655480223', 1),
(2, 'Manguharjo', 2371, '2026-08-07 02:18:12', '0', '12840', '6', '560', '34', '164', '2153', '3656', '[{\"platform\":\"Instagram\",\"username\":\"@disnakerkukm.madiunkota\",\"url\":\"https://www.instagram.com/disnakerkukm.madiunkota?igsh=cXJqZ3ZjNmJudWFn\"},{\"platform\":\"Instagram\",\"username\":\"@perindustrian.kotamadiun\",\"url\":\"https://www.instagram.com/perindustrian.kotamadiun?igsh=MTFzYnQwMnRhamNs\"},{\"platform\":\"Facebook\",\"username\":\"Disnakerkukm Kota Madiun\",\"url\":\"https://www.facebook.com/share/19RgNeZgVq/\"},{\"platform\":\"TikTok\",\"username\":\"@disnakerkukmkotamadiun\",\"url\":\"https://vm.tiktok.com/ZS9hYefCLguks-CQgR6/\"},{\"platform\":\"X\",\"username\":\"@DisnakerKUKM\",\"url\":\"https://x.com/DisnakerKUKM\"}]', '(0351) 454288', 'disnaker@madiunkota.go.id', 'TqK5aiZZSwXPEqmRu411', '085655480223', 1),
(3, 'Taman', 3507, '2026-08-07 02:18:12', '0', '12840', '6', '560', '34', '164', '2153', '3656', '[{\"platform\":\"Instagram\",\"username\":\"@disnakerkukm.madiunkota\",\"url\":\"https://www.instagram.com/disnakerkukm.madiunkota?igsh=cXJqZ3ZjNmJudWFn\"},{\"platform\":\"Instagram\",\"username\":\"@perindustrian.kotamadiun\",\"url\":\"https://www.instagram.com/perindustrian.kotamadiun?igsh=MTFzYnQwMnRhamNs\"},{\"platform\":\"Facebook\",\"username\":\"Disnakerkukm Kota Madiun\",\"url\":\"https://www.facebook.com/share/19RgNeZgVq/\"},{\"platform\":\"TikTok\",\"username\":\"@disnakerkukmkotamadiun\",\"url\":\"https://vm.tiktok.com/ZS9hYefCLguks-CQgR6/\"},{\"platform\":\"X\",\"username\":\"@DisnakerKUKM\",\"url\":\"https://x.com/DisnakerKUKM\"}]', '(0351) 454288', 'disnaker@madiunkota.go.id', 'TqK5aiZZSwXPEqmRu411', '085655480223', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tna_digitals`
--

CREATE TABLE `tna_digitals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ikm_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_usaha` varchar(255) NOT NULL,
  `pemilik` varchar(255) NOT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `nib` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `kendala_operasional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`kendala_operasional`)),
  `keterampilan_kurang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`keterampilan_kurang`)),
  `topik_pelatihan_prioritas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`topik_pelatihan_prioritas`)),
  `materi_praktik_spesifik` text DEFAULT NULL,
  `kebutuhan_ilmu_baru` text DEFAULT NULL,
  `metode_efektif` varchar(255) DEFAULT NULL,
  `komitmen_penerapan` varchar(255) NOT NULL DEFAULT 'Ya',
  `tag_antrean_pelatihan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tag_antrean_pelatihan`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tna_digitals`
--

INSERT INTO `tna_digitals` (`id`, `ikm_id`, `nama_usaha`, `pemilik`, `nik`, `nib`, `no_hp`, `kecamatan`, `kelurahan`, `kendala_operasional`, `keterampilan_kurang`, `topik_pelatihan_prioritas`, `materi_praktik_spesifik`, `kebutuhan_ilmu_baru`, `metode_efektif`, `komitmen_penerapan`, `tag_antrean_pelatihan`, `created_at`, `updated_at`) VALUES
(4, 72, 'Konveksi Baju Ceria', 'Siti Aminah', '3573275259659190', '2802754416809', '81234567894', 'Kartoharjo', 'Kartoharjo', '[\"Kesulitan akses permodalan\"]', '[\"Cara produksi sesuai standar mutu\"]', '[\"Fasilitasi Sertifikasi (Halal\\/BPOM\\/SNI)\",\"Manajemen Keuangan\",\"Desain Kemasan\"]', 'test', 'test', 'Pelatihan daring/Zoom', 'Ya', '[\"Antrean: Fasilitasi Sertifikasi (Halal\\/BPOM\\/SNI) (Batch 2026)\",\"Antrean: Manajemen Keuangan (Batch 2026)\",\"Antrean: Desain Kemasan (Batch 2026)\"]', '2026-07-29 16:19:05', '2026-07-29 16:19:05'),
(7, 69, 'Warung Makan Bu Susi', 'Susi Susanti', '3573590573056990', '2961251404189', '81234567891', 'Manguharjo', 'Madiun Lor', '[\"Kesulitan akses permodalan\"]', '[\"Cara produksi sesuai standar mutu\"]', '[\"Fasilitasi Sertifikasi (Halal\\/BPOM\\/SNI)\",\"Desain Kemasan\"]', 'Test', 'Test', 'Kelas tatap muka', 'Ya', '[\"Antrean: Fasilitasi Sertifikasi (Halal\\/BPOM\\/SNI) (Batch 2026)\",\"Antrean: Desain Kemasan (Batch 2026)\"]', '2026-07-29 16:25:06', '2026-07-29 16:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `tna_pertanyaans`
--

CREATE TABLE `tna_pertanyaans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bagian` int(11) NOT NULL DEFAULT 1,
  `nomor_soal` int(11) NOT NULL,
  `teks_pertanyaan` varchar(255) NOT NULL,
  `jenis_soal` varchar(255) NOT NULL DEFAULT 'checkbox',
  `opsi_jawaban` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`opsi_jawaban`)),
  `placeholder` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tna_pertanyaans`
--

INSERT INTO `tna_pertanyaans` (`id`, `bagian`, `nomor_soal`, `teks_pertanyaan`, `jenis_soal`, `opsi_jawaban`, `placeholder`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Apa kendala operasional terbesar yang paling menghambat perkembangan usaha Anda saat ini?', 'checkbox', '[\"Kesulitan akses permodalan\",\"Kualitas\\/kapasitas produksi terbatas\",\"Belum memiliki legalitas\\/sertifikasi\",\"Pembukuan keuangan berantakan\",\"Jiwa Kewirausahaan Kurang\",\"Entusias kurang\",\"Semangat kurang\",\"Motivasi Kuarang 31 JUli\"]', NULL, 1, '2026-07-29 16:44:59', '2026-07-31 04:24:16'),
(2, 1, 2, 'Keterampilan teknis apa yang saat ini dirasa paling kurang dan sangat Anda butuhkan?', 'checkbox', '[\"Penggunaan media sosial\\/marketplace\",\"Cara produksi sesuai standar mutu\",\"Manajemen kas\",\"Prosedur izin usaha\",\"Strategi pengemasan\\/packaging\"]', NULL, 1, '2026-07-29 16:44:59', '2026-07-29 16:53:08'),
(3, 2, 3, 'Topik pelatihan apa yang paling mendesak dan relevan untuk usaha Anda tahun depan?', 'checkbox', '[\"Fasilitasi Sertifikasi (Halal\\/BPOM\\/SNI)\",\"Digital Marketing & TikTok Shop\",\"Manajemen Keuangan & Pembukuan\",\"Desain Kemasan & Branding Produk\",\"Peningkatan Kualitas & Inovasi Produk\"]', NULL, 1, '2026-07-29 16:44:59', '2026-07-29 16:53:08'),
(4, 2, 4, 'Materi praktik spesifik yang paling ingin Anda pelajari secara langsung?', 'text', '[]', 'Contoh: Cara membuat iklan FB/TikTok Ads...', 1, '2026-07-29 16:44:59', '2026-07-29 16:44:59'),
(5, 2, 5, 'Kebutuhan ilmu baru dalam menghadapi persaingan bisnis saat ini?', 'text', '[]', 'Contoh: Penggunaan AI untuk desain promosi...', 1, '2026-07-29 16:44:59', '2026-07-29 16:44:59'),
(6, 3, 6, 'Metode pelatihan apa yang paling efektif bagi Anda?', 'radio', '[\"Kelas tatap muka\",\"Pelatihan daring\\/Zoom\",\"Pendampingan langsung (On-site)\"]', NULL, 1, '2026-07-29 16:44:59', '2026-07-29 16:44:59'),
(7, 3, 7, 'Apakah Anda berkomitmen menerapkan hasil pelatihan demi kemajuan usaha?', 'radio', '[\"Ya\",\"Tidak\"]', NULL, 1, '2026-07-29 16:44:59', '2026-07-29 16:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Yanuar Priambodo', 'Mimin02', '$2y$12$8NJFzHyanlyewkyAmxjzRuEUflbL0mrN.xuDQTVLAH0K.kyaIfssS', 'admin', NULL, '2026-03-25 04:05:18', '2026-03-25 04:05:18'),
(12, 'IKM Juara', 'Mimin06', '$2y$12$XAEy2gA4tFjW/h3JsthVs.P3rTBBEEKKPRYN2l.zRVJCD8P5riN4u', 'admin', NULL, '2026-03-25 06:19:21', '2026-03-25 06:19:21'),
(14, 'Tambahan', '123Admin', '$2y$12$OpiIpxPYDD9CgPGwvkCzCuXFXpY8tygji5.5liJh/17RVeOUL6cby', 'superadmin', NULL, '2026-03-30 15:01:26', '2026-03-30 15:01:26'),
(15, 'SuperAdmin2-Yanuar', 'SA2IKMJUARA', '$2y$12$T9akPcr8OFS6ZzPuz9gMeekiWvVTYy41gxgl2dxmYLw0nnxaA.Ub6', 'superadmin', NULL, '2026-03-31 02:46:56', '2026-03-31 02:48:44'),
(16, 'Admin Dukungan', 'dukungan', '$2y$12$KvIxW4GE1QS28UUob67SoOydlU.GoXICA3DM.OF59RnNGkc.5u7QW', 'dukungan', NULL, '2026-07-27 14:58:46', '2026-07-27 14:58:46'),
(18, 'Annisa Rahayu', 'dukungan02', '$2y$12$kj6Pjn258kDF8JlgjQNVL.A9zKf87ghQN.pSxNyhnLVgP7k9gzXwy', 'dukungan', NULL, '2026-07-30 14:08:35', '2026-07-30 14:08:35');

-- --------------------------------------------------------

--
-- Table structure for table `usulan_perubahan`
--

CREATE TABLE `usulan_perubahan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelaku_usaha_id` varchar(255) DEFAULT NULL,
  `nib` varchar(255) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `nama_perusahaan` varchar(255) DEFAULT NULL,
  `nama_proyek` varchar(255) DEFAULT NULL,
  `nama_pemilik` varchar(255) DEFAULT NULL,
  `kbli` varchar(255) DEFAULT NULL,
  `uraian_kbli` longtext DEFAULT NULL,
  `alamat_usaha` longtext DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `skala_usaha` varchar(255) DEFAULT NULL,
  `jenis_perusahaan` varchar(255) DEFAULT NULL,
  `tingkat_risiko` varchar(255) DEFAULT NULL,
  `investasi` varchar(255) DEFAULT NULL,
  `tenaga_kerja` int(11) DEFAULT 0,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tgl_terbit` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `sertifikat_halal` varchar(255) DEFAULT NULL,
  `bpom` varchar(255) DEFAULT NULL,
  `cppob` varchar(255) DEFAULT NULL,
  `sni` varchar(255) DEFAULT NULL,
  `status_usulan` varchar(255) DEFAULT NULL,
  `tipe_usulan` varchar(255) DEFAULT NULL,
  `catatan_admin` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usulan_perubahan`
--

INSERT INTO `usulan_perubahan` (`id`, `pelaku_usaha_id`, `nib`, `nik`, `nama_perusahaan`, `nama_proyek`, `nama_pemilik`, `kbli`, `uraian_kbli`, `alamat_usaha`, `kecamatan`, `kelurahan`, `skala_usaha`, `jenis_perusahaan`, `tingkat_risiko`, `investasi`, `tenaga_kerja`, `latitude`, `longitude`, `no_telp`, `email`, `tgl_terbit`, `status`, `sertifikat_halal`, `bpom`, `cppob`, `sni`, `status_usulan`, `tipe_usulan`, `catatan_admin`, `created_at`, `updated_at`) VALUES
(1, '109', '9120000000109', '3573010000000109', 'KAIN', NULL, 'ELLYSA SANTOSO', NULL, NULL, 'JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN', 'Taman', 'TAMAN', 'Kecil', 'Perseorangan', 'Rendah', '25000000', 12, NULL, NULL, '081234567109', 'ellysasantoso109@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'disetujui', 'perubahan', NULL, '2026-07-24 05:13:20', '2026-07-24 05:13:44'),
(2, '109', '9120000000109', '3573010000000109', 'KAIN', NULL, 'ELLYSA SANTOSO', NULL, NULL, 'JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN', 'Taman', 'TAMAN', 'Kecil', 'Perseorangan', 'Rendah', '25000000', 17, NULL, NULL, '081234567109', 'ellysasantoso109@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'disetujui', 'perubahan', NULL, '2026-07-24 05:14:40', '2026-07-24 05:15:21'),
(3, '109', '9120000000109', '3573010000000109', 'KAIN', 'KAIN', 'ELLYSA SANTOSO', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN', 'Taman', 'TAMAN', 'Kecil', 'Perseorangan', 'Rendah', '25000000', 17, NULL, NULL, '081234567109', 'ellysasantoso109@gmail.com', '2026-01-20', 'Tidak Aktif', 'ID35110000000109', 'BPOM02', NULL, NULL, 'disetujui', 'perubahan', NULL, '2026-07-24 05:24:25', '2026-07-24 05:24:48'),
(4, '109', '9120000000109', '3573010000000109', 'KAIN', 'KAIN', 'ELLYSA SANTOSO', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN', 'Taman', 'TAMAN', 'Kecil', 'Perseorangan', 'Rendah', '25000000', 17, NULL, NULL, '081234567109', 'ellysasantoso@gmail.com', '2026-01-20', 'Aktif', 'ID35110000000109', 'BPOM02', NULL, NULL, 'disetujui', 'perubahan', NULL, '2026-07-24 14:31:12', '2026-07-24 14:36:05'),
(5, '109', '9120000000109', '3573010000000109', 'KAIN', 'KAIN', 'ELLYSA SANTOSO', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN', 'Taman', 'TAMAN', 'Kecil', 'Perseorangan', 'Rendah', '26000000', 17, NULL, NULL, '081234567109', 'ellysasantoso@gmail.com', '2026-01-20', 'Aktif', 'ID35110000000109', 'BPOM02', NULL, NULL, 'disetujui', 'perubahan', NULL, '2026-07-24 14:36:36', '2026-07-24 14:36:52'),
(6, '109', '9120000000109', '3573010000000109', 'KAIN', 'KAIN', 'ELLYSA SANTOSO', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN', 'Taman', 'TAMAN', 'Kecil', 'Perseorangan', 'Rendah', '26000000', 15, NULL, NULL, '081234567109', 'ellysasantoso@gmail.com', '2026-01-20', 'Aktif', 'ID35110000000109', 'BPOM02', NULL, NULL, 'disetujui', 'perubahan', NULL, '2026-07-24 14:37:06', '2026-07-24 14:41:27'),
(7, '109', '9120000000109', '3573010000000109', 'KAIN', 'KAIN', 'ELLYSA SANTOSO', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN', 'Taman', 'TAMAN', 'Kecil', 'Perseorangan', 'Rendah', '26000000', 15, NULL, NULL, '081234567109', 'ellysasantoso01@gmail.com', '2026-01-20', 'Aktif', 'ID35110000000109', 'BPOM02', NULL, NULL, 'disetujui', 'perubahan', NULL, '2026-07-24 14:41:49', '2026-07-24 15:04:53'),
(8, '111', '9120000000667', '3573010000000667', 'CInta Sejati Makmur', 'CInta Sejati Makmur', 'Bu Cinta', '11090', 'Industri Minuman Dengan Pengolahan', 'Jl. Selalu Sayang 55', 'Taman', 'Kartoharjo', 'Mikro', 'Makanan', 'Mikro', '10000000', 1, NULL, NULL, '085655488220', 'bagfas.ikmjuara@gmail.com', '2026-07-15', 'Aktif', 'ID7723724149294920', 'u2372747', '724274727', 'ID727742', 'disetujui', 'perubahan', NULL, '2026-07-24 15:07:57', '2026-07-24 15:08:24'),
(9, '109', '9120000000109', '3573010000000109', 'KAIN', 'KAIN', 'ELLYSA SANTOSO', '56101', 'Penyediaan Makanan dan Minuman (Kuliner)', 'JL. P. SUDIRMAN 265 MADIUNDESA/KELURAHAN PANDEAN, KEC. TAMAN, KOTA MADIUN', 'Taman', 'TAMAN', 'Kecil', 'Perseorangan', 'Rendah', '26000005', 15, NULL, NULL, '081234567109', 'ellysasantoso01@gmail.com', '2026-01-20', 'Aktif', 'ID35110000000109', 'BPOM02', NULL, NULL, 'disetujui', 'perubahan', NULL, '2026-07-24 15:17:35', '2026-07-24 15:17:43'),
(10, '111', '9120000000667', '3573010000000667', 'CInta Sejati Makmur', 'CInta Sejati Makmur', 'Bu Cinta', '11090', 'Industri Minuman Dengan Pengolahan', 'Jl. Selalu Sayang 55', 'Taman', 'Kartoharjo', 'Mikro', 'Makanan', 'Mikro', '100000000', 88, NULL, NULL, '085655488220', 'bagfas.ikmjuara@gmail.com', '2026-07-15', 'Aktif', 'ID7723724149294920', 'u2372747', '724274727', 'ID727742', 'disetujui', 'perubahan', NULL, '2026-07-24 15:18:36', '2026-07-24 15:19:09'),
(11, '111', '9120000000667', '3573010000000667', 'CInta Sejati Makmur', 'CInta Sejati Makmur', 'Bu Cinta', '11090', 'Industri Minuman Dengan Pengolahan', 'Jl. Selalu Sayang 55', 'Taman', 'Kartoharjo', 'Mikro', 'Makanan Minuman', 'Mikro', '100000000', 88, NULL, NULL, '085655488220', 'bagfas.ikmjuara@gmail.com', '2026-07-15', 'Aktif', 'ID7723724149294920', 'u2372747', '724274727', 'ID727742', 'disetujui', 'perubahan', NULL, '2026-07-24 15:19:50', '2026-07-24 15:20:05'),
(12, '112', '5089747908747', '3573336890980650', 'Bengkel Las Jaya', 'Pagar dan Teralis', 'Hendra Gunawan', NULL, NULL, 'Jl. Thamrin', 'Kartoharjo', 'Klegen', 'Kecil', 'Logam dan Mesin', NULL, NULL, NULL, NULL, NULL, '081234567897', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'disetujui', 'perubahan', 'Usulan telah diverifikasi dan disetujui oleh Admin Dinas.', '2026-07-28 06:26:04', '2026-07-29 09:47:50'),
(13, '113', '5309033439831', '3573407473554860', 'Kerajinan Kayu Jati', 'Mebel Kayu', 'Joko Anwar', '10799', 'INDUSTRI PRODUK MAKANAN LAINNYA YTDL', 'Jl. Cokroaminoto', 'Taman', 'Kejuron', 'Kecil', 'Pangan', 'Menengah Rendah', '225000000', 2, NULL, NULL, '81234567892', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'disetujui', 'perubahan', 'Usulan telah diverifikasi dan disetujui oleh Admin Dinas.', '2026-07-29 10:36:03', '2026-07-29 10:36:25'),
(14, '75', '5089747908747', '3573336890980650', 'Bengkel Las Jaya', 'Pagar dan Teralis', 'Hendra Gunawan', '10795', 'INDUSTRI SARI NABATI DAN KRIMER NABATI', 'Jl. Thamrin', 'Kartoharjo', 'Klegen', 'Kecil', 'Logam dan Mesin', 'Menengah Tinggi', '33000500', 10, NULL, NULL, '081234567897', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'disetujui', 'perubahan', 'Usulan telah diverifikasi dan disetujui oleh Admin Dinas.', '2026-07-29 15:37:44', '2026-07-29 15:39:03'),
(15, '75', '5089747908747', '3573336890980650', 'Bengkel Las Jaya', 'Pagar dan Teralis', 'Hendra Gunawan', '10795', 'INDUSTRI SARI NABATI DAN KRIMER NABATI', 'Jl. Thamrin', 'Kartoharjo', 'Klegen', 'Kecil', 'Logam dan Mesin', 'Menengah Tinggi', '33000678', 10, NULL, NULL, '081234567897', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'disetujui', 'perubahan', 'Usulan telah diverifikasi dan disetujui oleh Admin Dinas.', '2026-07-29 15:40:07', '2026-07-29 15:40:38'),
(17, '114', '9999999999999', '3577019999999999', 'Test Verifikasi Perusahaan', NULL, 'Test Verifikasi Pemilik', NULL, NULL, 'Jl. Test No 17', 'Taman', 'Pandean', 'Mikro', 'Pangan', NULL, NULL, NULL, NULL, NULL, '085712345678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'disetujui', 'baru', 'Usulan telah diverifikasi dan disetujui oleh Admin Dinas.', '2026-07-31 07:55:18', '2026-07-31 07:55:18'),
(18, '115', '5089747908747', '3573336890980650', 'Bengkel Las Jaya Madiun', 'Pagar dan Teralis', 'Hendra Gunawan', '10795', 'INDUSTRI SARI NABATI DAN KRIMER NABATI', 'Jl. Thamrin No. 45', 'Kartoharjo', 'Klegen', 'Kecil', 'Metal dan Mesin', 'Menengah Tinggi', '3300067800', 10, NULL, NULL, '081234567897', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'disetujui', 'baru', 'Usulan telah diverifikasi dan disetujui oleh Admin Dinas.', '2026-07-31 08:53:51', '2026-07-31 08:55:35'),
(20, '116', '5089747908746', '3528838888888883', 'Nilahi', 'Roti Basah', 'Nilainahitadil', '10792', 'INDUSTRI KUE BASAH', 'Perum Panorama Wilis 84', 'Taman', 'Pandean', 'Mikro', 'Pangan', 'Rendah', '2000000', 1, NULL, NULL, '0856365357375', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'disetujui', 'baru', 'Usulan telah diverifikasi dan disetujui oleh Admin Dinas.', '2026-07-31 09:00:23', '2026-07-31 09:00:52'),
(23, '79', '5089747908746', '3528838888888883', 'Nilahi', 'Roti Basah', 'Nilainahitadil', '10792', 'INDUSTRI KUE BASAH', 'Perum Panorama Wilis 84', 'Taman', 'Pandean', 'Mikro', 'Pangan', 'Rendah', '200000000', 1, '-7.647627', '111.532947', '0856365357375', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'disetujui', 'perubahan', 'Usulan telah diverifikasi dan disetujui oleh Admin Dinas.', '2026-07-31 09:11:20', '2026-07-31 09:11:59'),
(25, '116', '5089747908746', '3528838888888883', 'Nilahi', 'Roti Basah', 'Nilainahitadil', '10792', 'INDUSTRI KUE BASAH', 'Perum Panorama Wilis 84', 'Taman', 'Pandean', 'Mikro', 'Pangan', 'Rendah', '20000000000', 2, '-7.647627', '111.532947', '0856365357375', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'disetujui', 'perubahan', 'Usulan telah diverifikasi dan disetujui oleh Admin Dinas.', '2026-07-31 09:21:47', '2026-07-31 09:22:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `form_app_responses`
--
ALTER TABLE `form_app_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_app_responses_template_id_foreign` (`template_id`);

--
-- Indexes for table `form_app_templates`
--
ALTER TABLE `form_app_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `form_app_templates_slug_unique` (`slug`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_konsultasis`
--
ALTER TABLE `kategori_konsultasis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kategori_konsultasis_nama_kategori_unique` (`nama_kategori`);

--
-- Indexes for table `kbli`
--
ALTER TABLE `kbli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konsultasi`
--
ALTER TABLE `konsultasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konsultasi_pesan`
--
ALTER TABLE `konsultasi_pesan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konsultasi_pesan_konsultasi_id_foreign` (`konsultasi_id`);

--
-- Indexes for table `list_kegiatan`
--
ALTER TABLE `list_kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pelaku_usaha`
--
ALTER TABLE `pelaku_usaha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permohonan_hki_merek`
--
ALTER TABLE `permohonan_hki_merek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peta_sebaran`
--
ALTER TABLE `peta_sebaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publikasi`
--
ALTER TABLE `publikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registrasi_pelatihan`
--
ALTER TABLE `registrasi_pelatihan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `siinas_industries`
--
ALTER TABLE `siinas_industries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistik_kecamatan`
--
ALTER TABLE `statistik_kecamatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tna_digitals`
--
ALTER TABLE `tna_digitals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tna_pertanyaans`
--
ALTER TABLE `tna_pertanyaans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tna_pertanyaans_nomor_soal_unique` (`nomor_soal`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usulan_perubahan`
--
ALTER TABLE `usulan_perubahan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_app_responses`
--
ALTER TABLE `form_app_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `form_app_templates`
--
ALTER TABLE `form_app_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_konsultasis`
--
ALTER TABLE `kategori_konsultasis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kbli`
--
ALTER TABLE `kbli`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1581;

--
-- AUTO_INCREMENT for table `konsultasi`
--
ALTER TABLE `konsultasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `konsultasi_pesan`
--
ALTER TABLE `konsultasi_pesan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `list_kegiatan`
--
ALTER TABLE `list_kegiatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `pelaku_usaha`
--
ALTER TABLE `pelaku_usaha`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `permohonan_hki_merek`
--
ALTER TABLE `permohonan_hki_merek`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `peta_sebaran`
--
ALTER TABLE `peta_sebaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `publikasi`
--
ALTER TABLE `publikasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `registrasi_pelatihan`
--
ALTER TABLE `registrasi_pelatihan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `siinas_industries`
--
ALTER TABLE `siinas_industries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT for table `statistik_kecamatan`
--
ALTER TABLE `statistik_kecamatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tna_digitals`
--
ALTER TABLE `tna_digitals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tna_pertanyaans`
--
ALTER TABLE `tna_pertanyaans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `usulan_perubahan`
--
ALTER TABLE `usulan_perubahan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `form_app_responses`
--
ALTER TABLE `form_app_responses`
  ADD CONSTRAINT `form_app_responses_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `form_app_templates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `konsultasi_pesan`
--
ALTER TABLE `konsultasi_pesan`
  ADD CONSTRAINT `konsultasi_pesan_konsultasi_id_foreign` FOREIGN KEY (`konsultasi_id`) REFERENCES `konsultasi` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
