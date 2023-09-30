-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2023 at 03:55 PM
-- Server version: 8.0.23
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `motivational_quotes`
--

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` int NOT NULL,
  `quote` varchar(1024) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `background_image_filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `author`, `background_image_filename`) VALUES
(1, 'It is never too late to be what you might have been.', 'George Eliot', 'background_01.jpg'),
(2, 'To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment', 'Ralph Waldo Emerson', 'background_01.jpg'),
(3, 'Pain is inevitable. Suffering is optional', 'Haruki Murakami', 'background_01.jpg'),
(4, 'Be kind, for everyone you meet is fighting a hard battle.', 'Plato', 'background_01.jpg'),
(5, 'Don\'t let your happiness depend on something you may lose.', 'C.S. Lewis', 'background_01.jpg'),
(6, 'We are all broken, that\'s how the light gets in.', 'Ernest Hemingway', 'background_01.jpg'),
(7, '\'Appreciation is a wonderful thing. It makes what is excellent in others belong to us as well.', 'Voltaire', 'background_01.jpg'),
(8, 'Nobody is a villain in their own story. We’re all the heroes of our own stories.', 'George RR Martin', 'background_01.jpg'),
(9, 'Books are a uniquely portable magic.', 'Stephen King', 'background_01.jpg'),
(10, 'The secret of happiness is not doing what one likes, but in liking what one does.', 'JM Barrie', 'background_01.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cnic` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `address`, `cnic`) VALUES
(1, 'kamran', 'kamran', 'kamran', 'Lahore', '22343-6745287-1'),
(2, 'rizwan', 'rizwan', 'rizwan', 'Karachi', '18943-6745287-1');

-- --------------------------------------------------------

--
-- Table structure for table `users_quotes`
--

CREATE TABLE `users_quotes` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `quote_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_quotes`
--
ALTER TABLE `users_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_idx` (`user_id`),
  ADD KEY `quotes_idx` (`quote_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_quotes`
--
ALTER TABLE `users_quotes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_quotes`
--
ALTER TABLE `users_quotes`
  ADD CONSTRAINT `quotes` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
