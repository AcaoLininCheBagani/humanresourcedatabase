-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2020 at 04:14 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `humanresourcemanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(50) NOT NULL,
  `employee_timeframe_id` int(50) NOT NULL,
  `attendance_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cash_advance`
--

CREATE TABLE `cash_advance` (
  `cash_id` int(50) NOT NULL,
  `date_advance` date DEFAULT NULL,
  `employee_id` int(50) NOT NULL,
  `amount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(50) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `position_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `employee_details_id` int(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `employee_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_group`
--

CREATE TABLE `employee_group` (
  `employee_group_id` int(50) NOT NULL,
  `employee_id` int(50) NOT NULL,
  `department` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_timeframe`
--

CREATE TABLE `employee_timeframe` (
  `employee_timeframe_id` int(50) NOT NULL,
  `employee_id` int(50) NOT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `overtime`
--

CREATE TABLE `overtime` (
  `overtime_id` int(50) NOT NULL,
  `employee_timeframe_id` int(50) NOT NULL,
  `num_hrs_overtime` time DEFAULT NULL,
  `date_overtime` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `rate` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `time_deduction`
--

CREATE TABLE `time_deduction` (
  `time_deduction_id` int(50) NOT NULL,
  `late` time DEFAULT NULL,
  `absent` date DEFAULT NULL,
  `employee_timeframe_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `employee_timeframe_id` (`employee_timeframe_id`);

--
-- Indexes for table `cash_advance`
--
ALTER TABLE `cash_advance`
  ADD PRIMARY KEY (`cash_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `position` (`position_id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`employee_details_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee_group`
--
ALTER TABLE `employee_group`
  ADD PRIMARY KEY (`employee_group_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee_timeframe`
--
ALTER TABLE `employee_timeframe`
  ADD PRIMARY KEY (`employee_timeframe_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `overtime`
--
ALTER TABLE `overtime`
  ADD PRIMARY KEY (`overtime_id`),
  ADD KEY `employee_timeframe_id` (`employee_timeframe_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `time_deduction`
--
ALTER TABLE `time_deduction`
  ADD PRIMARY KEY (`time_deduction_id`),
  ADD KEY `employee_timeframe_id` (`employee_timeframe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_advance`
--
ALTER TABLE `cash_advance`
  MODIFY `cash_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `employee_details_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_group`
--
ALTER TABLE `employee_group`
  MODIFY `employee_group_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_timeframe`
--
ALTER TABLE `employee_timeframe`
  MODIFY `employee_timeframe_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `overtime`
--
ALTER TABLE `overtime`
  MODIFY `overtime_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_deduction`
--
ALTER TABLE `time_deduction`
  MODIFY `time_deduction_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_timeframe_id`) REFERENCES `employee_timeframe` (`employee_timeframe_id`);

--
-- Constraints for table `cash_advance`
--
ALTER TABLE `cash_advance`
  ADD CONSTRAINT `cash_advance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `position` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`);

--
-- Constraints for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD CONSTRAINT `employee_details_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `employee_group`
--
ALTER TABLE `employee_group`
  ADD CONSTRAINT `employee_group_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `employee_timeframe`
--
ALTER TABLE `employee_timeframe`
  ADD CONSTRAINT `employee_timeframe_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `overtime`
--
ALTER TABLE `overtime`
  ADD CONSTRAINT `overtime_ibfk_1` FOREIGN KEY (`employee_timeframe_id`) REFERENCES `employee_timeframe` (`employee_timeframe_id`);

--
-- Constraints for table `time_deduction`
--
ALTER TABLE `time_deduction`
  ADD CONSTRAINT `time_deduction_ibfk_1` FOREIGN KEY (`employee_timeframe_id`) REFERENCES `employee_timeframe` (`employee_timeframe_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
