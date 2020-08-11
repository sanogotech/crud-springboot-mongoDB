-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 05, 2019 at 07:15 PM
-- Server version: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dogs`
--

-- --------------------------------------------------------

--
-- Table structure for table `breed`
--

CREATE TABLE `breed` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `descr` text,
  `date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `breed`
--

INSERT INTO `breed` (`id`, `name`, `descr`, `date`) VALUES
(1, 'Hounds', 'One of the oldest groups of dog originating thousands of years ago.', '2019-07-04 12:32:21.000000'),
(2, 'Terrier', 'A tough, no-nonsense, rabbiting and badgering dog.', '2019-07-04 12:32:21.000000');

-- --------------------------------------------------------

--
-- Table structure for table `breeder`
--

CREATE TABLE `breeder` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `state` varchar(10) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `phone` varchar(28) DEFAULT NULL,
  `email` varchar(28) DEFAULT NULL,
  `date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `breeder`
--

INSERT INTO `breeder` (`id`, `name`, `address`, `state`, `city`, `phone`, `email`, `date`) VALUES
(1, 'Joe Bloggs', '23 Smith St', 'NSW', 'Sydney', '02 7875 4545', 'joe@email.com', '2019-07-04 12:32:52.000000'),
(2, 'Tom Smith', '11 Tucker St', 'QLD', 'Brisbane', '07 023 2343', 'tom@email.com', '2019-07-04 12:32:53.000000');

-- --------------------------------------------------------

--
-- Table structure for table `breed__breeder`
--

CREATE TABLE `breed__breeder` (
  `breed_id` int(11) NOT NULL DEFAULT '0',
  `breeder_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `breed__breeder`
--

INSERT INTO `breed__breeder` (`breed_id`, `breeder_id`) VALUES
(1, 1),
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dog`
--

CREATE TABLE `dog` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `descr` text,
  `size` enum('small','medium','large') DEFAULT NULL,
  `date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `breed_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dog`
--

INSERT INTO `dog` (`id`, `name`, `descr`, `size`, `date`, `breed_id`) VALUES
(1, 'Max', 'Its distinctive appearance and deep foghorn voice make it stand out in a crowd.', 'medium', '2019-07-04 12:32:28.296691', 1),
(2, 'Jake', 'It loves human companionship and being part of the group.', 'medium', '2019-07-04 12:32:28.299088', 1),
(3, 'Buster', 'Short-legged but surprisingly strong and agile.', 'small', '2019-07-04 12:32:29.311627', 2);

-- --------------------------------------------------------

--
-- Table structure for table `rfid_dog`
--

CREATE TABLE `rfid_dog` (
  `dog_id` int(11) NOT NULL,
  `bar_code` varchar(128) NOT NULL,
  `notes` text,
  `iso_compliant` enum('y','n') DEFAULT 'n',
  `date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfid_dog`
--

INSERT INTO `rfid_dog` (`dog_id`, `bar_code`, `notes`, `iso_compliant`, `date`) VALUES
(1, '234k34340ll2342323022', 'This is a RFID tag for the Max', 'y', '2019-07-04 12:31:51.000000'),
(2, '09383638920290397d829', 'This is a RFID tag for the Jake', 'y', '2019-07-04 12:31:51.000000'),
(3, '30id8383837210jndal20', 'This is a RFID tag for the Buster', 'y', '2019-07-04 12:31:52.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `breed`
--
ALTER TABLE `breed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `breeder`
--
ALTER TABLE `breeder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `breed__breeder`
--
ALTER TABLE `breed__breeder`
  ADD PRIMARY KEY (`breed_id`,`breeder_id`);

--
-- Indexes for table `dog`
--
ALTER TABLE `dog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rfid_dog`
--
ALTER TABLE `rfid_dog`
  ADD PRIMARY KEY (`dog_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `breed`
--
ALTER TABLE `breed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `breeder`
--
ALTER TABLE `breeder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dog`
--
ALTER TABLE `dog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
