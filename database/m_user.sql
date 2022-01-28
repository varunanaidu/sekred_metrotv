-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2021 at 04:27 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sekredonline_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_user`
--

CREATE TABLE `m_user` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_nip` varchar(100) NOT NULL,
  `user_fname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_photo` varchar(255) NOT NULL,
  `changed_password` int(11) NOT NULL COMMENT '0 = No; 1 = Yes',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_user`
--

INSERT INTO `m_user` (`user_id`, `role_id`, `user_name`, `user_pass`, `user_nip`, `user_fname`, `user_email`, `user_phone`, `user_photo`, `changed_password`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(1, 2, '9999999', '$2y$10$KkAc0DD7lUOzySKkCRKQ0ejDeQmnpdk0OUz6GwpD6JQxMeD.8QoYO', '9999999', 'Developer', 'it@mgn.com', '0123456789', 'a30b15504cfdda527df7f81e7da5bb47.jpeg', 1, 1, '2021-07-08 21:08:27', 1, '2021-09-01 20:52:39'),
(3, 1, '1193726', '$2y$10$6fLH3EJ36LO4KCHus79tkOIdubARV4QvlnIq75BHhDaz81GO8Vn7.', '1193726', 'Nurul Noviani Rafika', 'nurul.noviana@metrotvnews.com', '0', '', 1, 1, '2021-08-16 21:02:37', 3, '2021-08-16 21:07:06'),
(4, 2, '1193755', '$2y$10$eNHjVcYWqt6eiEw5oYgT.OhjwIspGQJfCBc7O7mqGw8ptxz2K7aIm', '1193755', 'Varuna Dewi', 'varuna.dewi@metrotvnews.com', '0', '', 1, 1, '2021-08-26 09:47:32', 4, '2021-08-26 09:48:09'),
(5, 2, '1111111', '$2y$10$KJd2R/..xaD1gklbjwOazuZV85F2Ioj8fb47le23UuAY62mzKDBO2', '1111111', 'Administrator', 'administrator@metrotvnews.com', '0', '', 0, 1, '2021-08-31 21:32:27', 1, '2021-08-31 21:32:27'),
(6, 5, '2222222', '$2y$10$br4LQGl/ZxT17i5BewjT/eUDkQEsDh8nY0q044bAjPe2Y2QBizIDC', '2222222', 'Pemred', 'pemred@metrotvnews.com', '0', '', 0, 1, '2021-08-31 21:32:48', 1, '2021-09-01 21:25:00'),
(7, 4, '3333333', '$2y$10$OffCCb0.FYCg55UEharRbuvRA7j2ikrn7jx9fjAqQSeXFiLHaQtmy', '3333333', 'Wapemred', 'wapemred@metrotvnews.com', '0', '', 0, 1, '2021-08-31 21:33:14', 1, '2021-09-01 21:24:52'),
(8, 3, '4444444', '$2y$10$B7wOLbjcvHznSKTkLF0YhOqO1mD2BQDbf0kyJ3nAV/OWG1YSsycem', '4444444', 'Manager', 'manager@metrotvnews.com', '0', '', 0, 1, '2021-08-31 21:33:34', 1, '2021-09-01 21:24:43'),
(9, 1, '0000000', '$2y$10$w/pItxUlRjS.rWfZ94pzPOhsXx8s3dBMbugpNTmm3E2PFcfQAXgei', '0000000', 'User', 'user@metrotvnews.com', '0', '', 1, 1, '2021-09-01 21:24:29', 9, '2021-09-01 21:25:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_user`
--
ALTER TABLE `m_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
