-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 28, 2023 at 08:00 PM
-- Server version: 8.0.32-0ubuntu0.20.04.2
-- PHP Version: 7.4.3-4ubuntu2.18

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loan_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

create database loan_db;
use loan_db;
CREATE TABLE `borrowers` (
  `id` int NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `contact_no` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `tax_id` varchar(50) NOT NULL,
  `date_created` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`id`, `firstname`, `middlename`, `lastname`, `contact_no`, `address`, `email`, `tax_id`, `date_created`) VALUES
(1, 'John', 'C', 'Smit', '+16554 454654', 'Sample address', 'jsmith@sample.com', '789845-23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `type`, `description`) VALUES
(1, 'System', 'couch db credentials are markGoldBerg:GoldBerg'),
(2, 'Software development', 'couch db credentials are markGoldBerg:GoldBerg'),
(3, 'System Management', 'couch db credentials are markGoldBerg:GoldBerg'),
(4, '	\r\nType Name:', 'Description: \r\nAyabonga you can\'t use your name as the password for the database , Please change it to something professional');

-- --------------------------------------------------------

--
-- Table structure for table `loan_list`
--

CREATE TABLE `loan_list` (
  `id` int NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `loan_type_id` int NOT NULL,
  `borrower_id` int NOT NULL,
  `purpose` text NOT NULL,
  `amount` double NOT NULL,
  `plan_id` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0= request, 1= confrimed,2=released,3=complteted,4=denied\r\n',
  `date_released` datetime NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `loan_list`
--

INSERT INTO `loan_list` (`id`, `ref_no`, `loan_type_id`, `borrower_id`, `purpose`, `amount`, `plan_id`, `status`, `date_released`) VALUES
(3, '81409630', 1, 1, 'Sample Only', 100000, 1, 2, '2020-09-26 09:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `loan_plan`
--

CREATE TABLE `loan_plan` (
  `id` int NOT NULL,
  `months` int NOT NULL,
  `interest_percentage` float NOT NULL,
  `penalty_rate` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `loan_plan`
--

INSERT INTO `loan_plan` (`id`, `months`, `interest_percentage`, `penalty_rate`) VALUES
(1, 36, 8, 3),
(2, 24, 5, 2),
(3, 27, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `loan_schedules`
--

CREATE TABLE `loan_schedules` (
  `id` int NOT NULL,
  `loan_id` int NOT NULL,
  `date_due` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `loan_schedules`
--

INSERT INTO `loan_schedules` (`id`, `loan_id`, `date_due`) VALUES
(2, 3, '2020-10-26'),
(3, 3, '2020-11-26'),
(4, 3, '2020-12-26'),
(5, 3, '2021-01-26'),
(6, 3, '2021-02-26'),
(7, 3, '2021-03-26'),
(8, 3, '2021-04-26'),
(9, 3, '2021-05-26'),
(10, 3, '2021-06-26'),
(11, 3, '2021-07-26'),
(12, 3, '2021-08-26'),
(13, 3, '2021-09-26'),
(14, 3, '2021-10-26'),
(15, 3, '2021-11-26'),
(16, 3, '2021-12-26'),
(17, 3, '2022-01-26'),
(18, 3, '2022-02-26'),
(19, 3, '2022-03-26'),
(20, 3, '2022-04-26'),
(21, 3, '2022-05-26'),
(22, 3, '2022-06-26'),
(23, 3, '2022-07-26'),
(24, 3, '2022-08-26'),
(25, 3, '2022-09-26'),
(26, 3, '2022-10-26'),
(27, 3, '2022-11-26'),
(28, 3, '2022-12-26'),
(29, 3, '2023-01-26'),
(30, 3, '2023-02-26'),
(31, 3, '2023-03-26'),
(32, 3, '2023-04-26'),
(33, 3, '2023-05-26'),
(34, 3, '2023-06-26'),
(35, 3, '2023-07-26'),
(36, 3, '2023-08-26'),
(37, 3, '2023-09-26');

-- --------------------------------------------------------

--
-- Table structure for table `loan_types`
--

CREATE TABLE `loan_types` (
  `id` int NOT NULL,
  `type_name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `loan_types`
--

INSERT INTO `loan_types` (`id`, `type_name`, `description`) VALUES
(1, 'Small Business', 'Small Business Loans'),
(2, 'Mortgages', 'Mortgages'),
(3, 'Personal Loans', 'Personal Loans'),
(4, 'https://res.cloudinary.com/practicaldev/image/fetch/s--XopwPmCB--/c_imagga_scale,f_auto,fl_progressive,h_900,q_auto,w_1600/https://i.postimg.cc/3Nb98bJQ/couch-wall.png', 'https://res.cloudinary.com/practicaldev/image/fetch/s--XopwPmCB--/c_imagga_scale,f_auto,fl_progressive,h_900,q_auto,w_1600/https://i.postimg.cc/3Nb98bJQ/couch-wall.png');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `loan_id` int NOT NULL,
  `payee` text NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `penalty_amount` float NOT NULL DEFAULT '0',
  `overdue` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=no , 1 = yes',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `loan_id`, `payee`, `amount`, `penalty_amount`, `overdue`, `date_created`) VALUES
(2, 3, 'Smith, John C', 3000, 90, 1, '2020-09-26 15:51:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'bob', '', '', 'bob', 'bob', 2),
(2, 2, 'math', 'mat@madadmaldcslndc;osncd;ocd', '2121561212313', 'Mathew', 'Mathew', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_list`
--
ALTER TABLE `loan_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_plan`
--
ALTER TABLE `loan_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_types`
--
ALTER TABLE `loan_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loan_list`
--
ALTER TABLE `loan_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loan_plan`
--
ALTER TABLE `loan_plan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `loan_types`
--
ALTER TABLE `loan_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
