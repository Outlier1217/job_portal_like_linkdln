-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2025 at 10:25 AM
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
-- Database: `job_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `created_at`) VALUES
(2, 'outlier1217', '$2y$10$68H2gFY0S5NNVCAtmLoCnelQ2xa16.zG7wNLoqyeLZo/luY4W5ku2', '2025-07-16 08:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `education_experience`
--

CREATE TABLE `education_experience` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('school','college','certification','experience','internship') NOT NULL,
  `institution` varchar(255) NOT NULL,
  `degree_or_role` varchar(255) NOT NULL,
  `job_role` varchar(255) DEFAULT NULL,
  `current_post_role` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `education_experience`
--

INSERT INTO `education_experience` (`id`, `user_id`, `type`, `institution`, `degree_or_role`, `job_role`, `current_post_role`, `start_date`, `end_date`, `description`, `created_at`) VALUES
(7, 12, 'school', 'Govt. Sr. Sec. School Saran Faridabad', 'From 6th to 12th Class', 'NA', 'NA', '2006-01-12', '2013-03-12', 'Life was so fair at that time', '2025-02-12 18:24:44'),
(8, 12, 'college', 'Delhi University', 'B.Sc(Hons) Math', 'NA', 'NA', '2013-07-12', '2016-11-12', 'Initial stage of struggle ', '2025-02-12 18:26:12'),
(9, 12, 'certification', 'British Council', 'English Litrature', 'NA', 'NA', '2017-07-12', '2017-11-12', '', '2025-02-12 18:27:28'),
(10, 12, 'experience', 'D N Public School', 'NA', 'Math Lecturer of 11th and 12th Class', 'NA', '2014-11-12', '2015-08-12', '', '2025-02-12 18:29:08'),
(11, 12, 'experience', 'Aggarwal Modern Sr. Sec. School', 'NA', 'Math Lecturer of 11th and 12th Class', 'NA', '2015-12-13', '2018-10-13', '', '2025-02-12 18:30:23'),
(12, 12, 'experience', 'Modern B P Public School', 'NA', 'Math Lecturer of 11th and 12th Class', 'NA', '2018-11-13', '2019-11-13', '', '2025-02-12 18:31:23'),
(13, 12, 'experience', 'Policybazaar ', 'NA', 'Associate Service Consultant', 'NA', '2021-09-02', '2022-09-15', '', '2025-02-12 18:33:12'),
(14, 12, 'experience', 'Concentrix (CNX)', 'NA', 'Sr. Representative', 'NA', '2022-10-17', '2024-07-01', '', '2025-02-12 18:34:21'),
(15, 12, 'experience', 'BM Info Tech', 'NA', 'NA', 'Data Scientist', '2024-11-02', NULL, '', '2025-02-12 18:35:54');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `job_description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `user_id`, `job_title`, `job_description`, `created_at`) VALUES
(12, 12, 'I\'m Looking for a Job', 'Looking for a Part-Time PGT Math teaching Job, I have more than 5 Year Experience in teaching ', '2025-02-12 18:22:16');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `reported_by` int(11) NOT NULL,
  `reported_user` int(11) NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','reviewed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suggestions`
--

CREATE TABLE `suggestions` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `suggestion` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suggestions`
--

INSERT INTO `suggestions` (`id`, `email`, `suggestion`, `created_at`) VALUES
(1, 'raj@gmail.com', 'hii', '2025-02-12 16:35:01'),
(2, 'ashu@gmail.coo', 'hello', '2025-02-12 17:14:51'),
(3, 'gapesok821@idoidraw.com', 'bro please make this website better this doesnt work', '2025-05-05 17:56:42'),
(4, 'gapesok821@idoidraw.com', 'fix ur website bro please everything broken stop ngangguran', '2025-05-05 18:03:56'),
(5, 'loniw22583@exitings.com', 'your button in home page is cannot be use', '2025-05-05 18:04:03'),
(6, 'gapesok821@idoidraw.com', 'Make the post a response work bro', '2025-05-05 18:04:09');

-- --------------------------------------------------------

--
-- Table structure for table `tie_up_requests`
--

CREATE TABLE `tie_up_requests` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tie_up_requests`
--

INSERT INTO `tie_up_requests` (`id`, `sender_id`, `receiver_id`, `status`, `created_at`) VALUES
(41, 19, 12, 'accepted', '2025-04-16 15:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT 'default.png',
  `qualifications` text DEFAULT NULL,
  `job_experience` text DEFAULT NULL,
  `employment_status` enum('Employed','Self-Employed','Student') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `current_work_status` text DEFAULT NULL,
  `is_online` tinyint(1) DEFAULT 0,
  `current_organization` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `token_expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `profile_picture`, `qualifications`, `job_experience`, `employment_status`, `created_at`, `current_work_status`, `is_online`, `current_organization`, `password_reset_token`, `token_expires_at`) VALUES
(12, 'Mustak Aalam', 'mustakalam77@gmail.com', '$2y$10$VwXCS8iMjXFWFFmIf/UAP.Zq1rDYnxjDh8PTV7cX9FAHIjaEo1NTO', '67ace5d95a84d.jpg', 'B.Sc(Hons) Math', '10 Years', 'Self-Employed', '2025-02-12 18:18:01', 'Freelancer', 1, 'BM Info Tech', NULL, NULL),
(16, 'gdhh', 'tlk@gmail.com', '$2y$10$8WngTPadhBj/PMX3g2ga6uSb6CPjtNil8CroctRoRs12IBN3KdG.C', 'default.png', NULL, NULL, NULL, '2025-02-19 03:38:05', NULL, 1, NULL, NULL, NULL),
(19, 'Abhishek ', 'chandanchandan52100@gmail.com', '$2y$10$ewW2/7Z7YKo0jMwyEe0xJOSD/N/jAiFBeafFWeqXBbX/X.Th5l4iK', 'default.png', NULL, NULL, NULL, '2025-04-16 15:02:09', NULL, 1, NULL, NULL, NULL),
(21, 'Pravish Vikri', 'weipuw@imail.edu.pl', '$2y$10$tucKz7C4pwk3SnsebAZWeem8OsknF.Q1c/TmxOZILVn2XT0XhMPnO', 'default.png', NULL, NULL, NULL, '2025-05-05 17:50:48', NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_reports`
--

CREATE TABLE `user_reports` (
  `id` int(11) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `reported_user_id` int(11) NOT NULL,
  `report_reason` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_reports`
--

INSERT INTO `user_reports` (`id`, `reporter_id`, `reported_user_id`, `report_reason`, `created_at`) VALUES
(1, 1, 3, 'hiiiiiiiiii', '2025-02-11 07:01:48'),
(2, 1, 6, 'hello', '2025-02-11 07:06:11'),
(4, 1, 11, 'hello', '2025-02-12 17:33:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `comments_ibfk_1` (`user_id`);

--
-- Indexes for table `education_experience`
--
ALTER TABLE `education_experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_ibfk_1` (`user_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_ibfk_1` (`sender_id`),
  ADD KEY `messages_ibfk_2` (`receiver_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_ibfk_1` (`reported_by`),
  ADD KEY `reports_ibfk_2` (`reported_user`);

--
-- Indexes for table `suggestions`
--
ALTER TABLE `suggestions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tie_up_requests`
--
ALTER TABLE `tie_up_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tie_up_requests_ibfk_1` (`sender_id`),
  ADD KEY `tie_up_requests_ibfk_2` (`receiver_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_reports`
--
ALTER TABLE `user_reports`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `education_experience`
--
ALTER TABLE `education_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suggestions`
--
ALTER TABLE `suggestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tie_up_requests`
--
ALTER TABLE `tie_up_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_reports`
--
ALTER TABLE `user_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `education_experience`
--
ALTER TABLE `education_experience`
  ADD CONSTRAINT `education_experience_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`reported_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`reported_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tie_up_requests`
--
ALTER TABLE `tie_up_requests`
  ADD CONSTRAINT `tie_up_requests_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tie_up_requests_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
