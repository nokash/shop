-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 01, 2020 at 05:29 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(40, '2014_10_12_000000_create_users_table', 1),
(41, '2014_10_12_100000_create_password_resets_table', 1),
(42, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(43, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(44, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(45, '2016_06_01_000004_create_oauth_clients_table', 1),
(46, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(47, '2019_08_19_000000_create_failed_jobs_table', 1),
(48, '2020_02_27_021702_create_orders_table', 1),
(49, '2020_02_27_022406_create_orderdetails_table', 1),
(50, '2020_02_27_022623_create_products__table', 1),
(51, '2020_02_27_023344_create_supplier_products_table', 1),
(52, '2020_02_27_024054_create_suppliers_table', 1),
(53, '2020_02_27_031045_order_details_integrity', 1),
(54, '2020_02_27_032615_supplier_product_integrity', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('11fd31be7a8f1a81234d4e064d44362f3a5fcdb68c78a4842ebe03b61c381eacc48c399024076bcf', 3, 1, 'MyShop', '[]', 0, '2020-02-27 09:05:40', '2020-02-27 09:05:40', '2021-02-27 12:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'VyJfdPO6L16i8p43Xty2cRnDY9hghw7AO2RudPAl', 'http://localhost', 1, 0, 0, '2020-02-27 09:05:25', '2020-02-27 09:05:25'),
(2, NULL, 'Laravel Password Grant Client', 'sI5WbkgHX54fhD5qUjU9hiYr0hSJPfPaLlrfrgiJ', 'http://localhost', 0, 1, 0, '2020-02-27 09:05:25', '2020-02-27 09:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-02-27 09:05:25', '2020-02-27 09:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'F0:A6:B9:65:96:3B', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(2, '1A:91:D8:E9:59:46', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(3, '39:7A:4B:1F:7D:0A', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(4, '17:A9:38:C0:2E:47', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(5, 'CB:E2:3A:2D:74:9F', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(6, '5A:72:EC:F8:72:D5', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(7, 'B6:B8:27:DD:ED:36', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(8, '80:FD:1C:7D:70:C3', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(9, 'E9:64:44:06:F7:18', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(10, '7C:41:11:B8:C0:F8', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(11, 'FB:50:9A:CB:7D:D0', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(12, 'D9:BA:D4:00:CA:D2', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(13, '75:45:C8:96:77:5E', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(14, '75:D7:A9:60:F9:56', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(15, '3C:34:48:6C:D4:A3', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(16, '0D:49:2C:6D:2E:AE', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(17, '6B:1D:15:76:CD:35', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(18, '43:E3:48:B3:03:18', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(19, 'B9:8A:53:32:1E:AF', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL),
(20, '6D:7B:B1:06:CD:A1', '2020-02-27 23:31:49', '2020-02-27 23:31:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 16, 16, '2020-02-17 21:00:00', '2020-02-18 21:00:00', '2020-02-02 21:00:00'),
(2, 14, 2, '2020-02-18 21:00:00', '2020-02-03 21:00:00', '2020-02-18 21:00:00'),
(3, 16, 4, '2020-02-12 21:00:00', '2020-02-26 21:00:00', '2020-02-20 21:00:00'),
(4, 14, 10, '2020-02-11 21:00:00', '2020-02-26 21:00:00', '2020-02-25 21:00:00'),
(5, 15, 11, '2020-02-11 21:00:00', '2020-02-07 21:00:00', '2020-02-26 21:00:00'),
(6, 18, 13, '2020-02-28 21:00:00', '2020-02-28 21:00:00', '2020-02-28 21:00:00'),
(7, 17, 6, '2020-02-24 21:00:00', '2020-02-24 21:00:00', '2020-02-24 21:00:00'),
(8, 19, 14, '2020-02-18 21:00:00', '2020-02-13 21:00:00', '2020-02-28 21:00:00'),
(9, 4, 3, '2020-02-10 21:00:00', '2020-02-19 21:00:00', '2020-02-28 21:00:00'),
(10, 6, 9, '2020-02-27 21:00:00', '2020-02-27 21:00:00', '2020-02-27 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Miss Reva Shields', 'Lubowitz LLC', '9', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(2, 'Prof. Hellen Ankunding', 'Rempel PLC', '8', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(3, 'Shayna Luettgen Jr.', 'Dare Ltd', '2', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(4, 'Guadalupe Schuppe', 'Olson, Abernathy and Sauer', '4', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(5, 'Cordell Lindgren', 'Donnelly, Nitzsche and Rutherford', '2', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(6, 'Reba Konopelski', 'Bergstrom-Abbott', '3', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(7, 'Prof. Lupe Breitenberg', 'Weber, Gleichner and Beier', '9', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(8, 'Clare McKenzie DDS', 'Klocko, Towne and Johns', '2', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(9, 'Dahlia Wisozk', 'Denesik-Pacocha', '5', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(10, 'Mr. Freddie Buckridge Sr.', 'Koelpin Inc', '9', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(11, 'Vidal Monahan III', 'Kautzer PLC', '4', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(12, 'Johnny Schoen', 'Beier-Kreiger', '4', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(13, 'Mrs. Antonina Langworth', 'Hartmann-Schuster', '8', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(14, 'Rosa Jaskolski', 'Trantow LLC', '0', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(15, 'Ms. Margarette Jaskolski I', 'Dare, Macejkovic and Herzog', '6', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(16, 'Dr. Arvel Nitzsche II', 'Fahey PLC', '6', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(17, 'Ms. Cathryn Lang', 'Batz, Daniel and Brekke', '4', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(18, 'Dr. Jaclyn Cruickshank MD', 'Tremblay Inc', '2', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(19, 'Miss Emily Rempel', 'Mayer Ltd', '2', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL),
(20, 'Maymie Dickinson', 'Christiansen-Conroy', '8', '2020-02-27 23:26:10', '2020-02-27 23:26:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(21, 'Schmidt-Farrell', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(22, 'Carroll, Huels and Kshlerin', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(23, 'Kunze Group', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(24, 'Reilly, Witting and Keebler', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(25, 'Morissette PLC', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(26, 'Langosh-Hartmann', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(27, 'Dickens Inc', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(28, 'Maggio Group', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(29, 'Prohaska and Sons', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(30, 'Kshlerin-Baumbach', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(31, 'Mraz, Runolfsdottir and Skiles', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(32, 'Schamberger-Toy', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(33, 'Rodriguez-Mayert', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(34, 'Dickens, Howe and Lockman', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(35, 'Gutkowski, Purdy and Keeling', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(36, 'Jacobi LLC', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(37, 'Langosh, Turcotte and Bednar', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(38, 'Russel PLC', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(39, 'Volkman, Mitchell and Satterfield', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(40, 'Reilly, Tillman and Reichel', '2020-02-27 23:30:09', '2020-02-27 23:30:09', NULL),
(41, 'Tenemos', '2020-02-28 03:41:53', '2020-02-28 04:11:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_products`
--

CREATE TABLE `supplier_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_products`
--

INSERT INTO `supplier_products` (`id`, `supplier_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 22, 8, '2019-09-30 21:00:00', '2020-02-25 21:00:00', '2020-02-25 21:00:00'),
(2, 21, 14, '2020-02-18 21:00:00', '2020-02-18 21:00:00', '2020-02-12 21:00:00'),
(3, 29, 2, '2020-02-18 21:00:00', '2020-02-19 21:00:00', '2020-02-04 21:00:00'),
(4, 28, 4, '2020-02-18 21:00:00', '2020-02-28 21:00:00', '2020-02-19 21:00:00'),
(5, 40, 13, '2020-02-11 21:00:00', '2020-02-07 21:00:00', '2020-02-26 21:00:00'),
(6, 34, 19, '2020-02-12 21:00:00', '2020-02-05 21:00:00', '2020-02-13 21:00:00'),
(7, 27, 5, '2019-09-30 21:00:00', '2020-02-05 21:00:00', '2020-02-20 21:00:33'),
(8, 29, 10, '2020-02-27 21:00:30', '2019-06-03 03:38:43', '2020-02-27 21:00:00'),
(9, 35, 11, '2020-02-04 21:00:00', '2020-02-18 21:00:00', '2020-02-12 21:00:00'),
(10, 38, 8, '2020-02-27 21:00:00', '2020-02-26 21:00:00', '2020-02-19 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Sanford Rolfson', 'greyson.cormier@example.org', '2020-02-27 23:11:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Mq0qexX9tB', '2020-02-27 23:11:04', '2020-02-27 23:11:04'),
(2, 'Miss Reina Hyatt', 'ayden.haag@example.org', '2020-02-27 23:11:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dQ8arIJzi6', '2020-02-27 23:11:04', '2020-02-27 23:11:04'),
(3, 'Mertie O\'Hara', 'dratke@example.org', '2020-02-27 23:11:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EHJqkLmFuJ', '2020-02-27 23:11:04', '2020-02-27 23:11:04'),
(4, 'Lina Kuvalis DVM', 'jnikolaus@example.net', '2020-02-27 23:11:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'q6qiRg3jvf', '2020-02-27 23:11:04', '2020-02-27 23:11:04'),
(5, 'Melyna Bayer', 'ojohns@example.net', '2020-02-27 23:11:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WQlY51F8vg', '2020-02-27 23:11:04', '2020-02-27 23:11:04'),
(6, 'Colin Cruickshank', 'weber.elsa@example.net', '2020-02-27 23:11:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '19wGLGjaon', '2020-02-27 23:11:04', '2020-02-27 23:11:04'),
(7, 'Mrs. Carissa Schaden', 'hudson.nora@example.com', '2020-02-27 23:11:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NoCNgMWlg8', '2020-02-27 23:11:04', '2020-02-27 23:11:04'),
(8, 'Hilda Ward', 'rodrigo.lindgren@example.org', '2020-02-27 23:11:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l6DfZSsGCv', '2020-02-27 23:11:04', '2020-02-27 23:11:04'),
(9, 'Dr. Jerrold Ondricka PhD', 'pierre06@example.com', '2020-02-27 23:11:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TFc7bgpuNy', '2020-02-27 23:11:04', '2020-02-27 23:11:04'),
(10, 'Judson Rowe', 'jerod77@example.com', '2020-02-27 23:11:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WdNaWGCrZ0', '2020-02-27 23:11:04', '2020-02-27 23:11:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_index` (`order_id`),
  ADD KEY `order_details_product_id_index` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_products`
--
ALTER TABLE `supplier_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_products_supplier_id_index` (`supplier_id`),
  ADD KEY `supplier_products_product_id_index` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `supplier_products`
--
ALTER TABLE `supplier_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supplier_products`
--
ALTER TABLE `supplier_products`
  ADD CONSTRAINT `supplier_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `supplier_products_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
