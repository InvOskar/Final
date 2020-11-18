-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 18 2020 г., 04:35
-- Версия сервера: 10.4.14-MariaDB
-- Версия PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `aitunews`
--

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Author` varchar(255) NOT NULL,
  `Genre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`Id`, `Name`, `Author`, `Genre`) VALUES
(1, 'The Hobbit, or There and Back Again', 'J. R. R. Tolkien', 'Fantasy'),
(2, 'Pride and Prejudice', 'Jane Austen', 'Romance novel'),
(3, 'Percy Jackson & the Olympians', 'Rick Riordan', 'Fantasy'),
(4, 'Harry Potter and the Philosopher\'s Stone', 'J. K. Rowling', 'Fantasy novel'),
(5, 'The Lord of the Rings', '	J. R. R. Tolkien', 'Fantasy'),
(6, 'Harry Potter and the Chamber of Secrets', 'J. K. Rowling', 'Fantasy novel'),
(7, 'Harry Potter and the Goblet of Fire', 'J. K. Rowling', 'Fantasy novel'),
(8, 'Harry Potter and the Cursed Child', 'J. K. Rowling', 'Fantasy novel'),
(9, 'The Adventures of Sherlock Holmes', 'Conan Doyle', 'Detective fiction'),
(10, 'A Game of Thrones', 'George R. R. Martin', 'Political novel, epic fantasy'),
(11, 'The Witcher', 'Andrzej Sapkowski', 'Fantasy'),
(12, 'Little Women', 'Louisa May Alcott', 'Coming of age\r\nBildungsroman'),
(13, 'Fahrenheit 451', 'Ray Bradbury', '	Dystopian'),
(14, 'Charlotte’s Web', 'E. B. White', 'Childrens');

-- --------------------------------------------------------

--
-- Структура таблицы `clubs`
--

CREATE TABLE `clubs` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `clubs`
--

INSERT INTO `clubs` (`Id`, `Name`) VALUES
(1, 'AITU Football'),
(2, 'Event club'),
(3, 'Phoenix'),
(4, 'AITU Media'),
(5, 'AITU life'),
(6, 'AITU Volunteers'),
(7, 'AITU Volleyball'),
(8, 'AITU Jokers'),
(9, 'AITU Cheerleading'),
(10, 'AITU Music'),
(11, 'AITU Dance'),
(12, 'AITU Cooking'),
(31, 'AITU Basketball');

-- --------------------------------------------------------

--
-- Структура таблицы `club_members`
--

CREATE TABLE `club_members` (
  `Club_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `club_members`
--

INSERT INTO `club_members` (`Club_id`, `User_id`) VALUES
(1, 8),
(1, 9),
(1, 10),
(1, 12),
(1, 13),
(2, 10),
(2, 12),
(2, 8),
(2, 14),
(3, 9),
(3, 11),
(3, 13),
(3, 15),
(4, 10),
(4, 12),
(5, 8),
(5, 14),
(12, 9),
(10, 11),
(11, 13),
(9, 15),
(9, 9),
(11, 11),
(8, 13),
(8, 15),
(7, 10),
(6, 12),
(7, 8),
(6, 14),
(10, 10),
(12, 12),
(8, 8),
(9, 14),
(11, 9),
(7, 11),
(6, 13),
(7, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE `events` (
  `Header` varchar(256) NOT NULL,
  `Main_part` text NOT NULL,
  `Date/time` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`Header`, `Main_part`, `Date/time`, `Location`) VALUES
('Defence of Final project Advanced Java!', 'At 18 of November SE-1905/SE-1908 groups have project defense in 15 o\'clock. Manglayev T. will check students\' works. Deadline of submition is 15th of November at 23:59 and of cource late submision would be punished.', '18th of November', 'Teams'),
('Participate in secret Santa!', 'What could be nicer than making someone happy. Secret Santa is a greate chance to do someone happy and be happy. So aitu_event club organizing Secret Santa for all students of our University. You can get detailed information in our Instagram eventclub_aitu! ', 'Registration until December 20!', 'our Instagram eventclub_aitu.');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `Header` varchar(255) NOT NULL,
  `Main_part` text NOT NULL,
  `Author` varchar(255) NOT NULL,
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`Header`, `Main_part`, `Author`, `Id`) VALUES
('The holidays are coming!', 'asdfsdf dg sdg sdg sdf asdfxc sdavsd vfs vsfd vsf vsd fvsdav asdfsdf dg sdg sdg sdf asdfxc sdavsd vfs vsfd vsf vsd fvsdav  asdfsdf dg sdg sdg sdf asdfxc sdavsd vfs vsfd vsf vsd fvsdav  asdfsdf dg sdg sdg sdf asdfxc sdavsd vfs vsfd vsf vsd fvsdav asdfsdf dg sdg sdg sdf asdfxc sdavsd vfs vsfd vsf vsd fvsdav vasdfsdf dg sdg sdg sdf asdfxc sdavsd vfs vsfd vsf vsd fvsdav asdfsdf dg sdg sdg sdf asdfxc sdavsd vfs vsfd vsf vsd fvsdav asdfsdf dg sdg sdg sdf asdfxc sdavsd vfs vsfd vsf vsd fvsdav asdfsdf dg sdg sdg sdf asdfxc sdavsd vfs vsfd vsf vsd fvsdav asdfsdf dg sdg sdg sdf asdfxc sdavsd vfs vsfd vsf vsd fvsdav vasdfsdf dg sdg sdg sdf asdfxc sdavsd vfs vsfd vsf vsd fvsdav asdfsdf dg sdg sdg sdf asdfxc sdavsd vfs vsfd vsf vsd fvsdav v', 'Alina Naufalova', 20),
('ASdskfsldagflsdkgvnsdlfkvsd', 'asdlflncvmsdxcvncsdljmvn sdsdcnv ms,d nsdacmv nsdcvmnsdmcv,nsdxcvmndscvmndsk nsdk jsdmn,vc asdlflncvmsdxcvncsdljmvn sdsdcnv ms,d nsdacmv nsdcvmnsdmcv,nsdxcvmndscvmndsk nsdk jsdmn,vcasdlflncvmsdxcvncsdljmvn sdsdcnv ms,d nsdacmv nsdcvmnsdmcv,nsdxcvmndscvmndsk nsdk jsdmn,vcasdlflncvmsdxcvncsdljmvn sdsdcnv ms,d nsdacmv nsdcvmnsdmcv,nsdxcvmndscvmndsk nsdk jsdmn,vcasdlflncvmsdxcvncsdljmvn sdsdcnv ms,d nsdacmv nsdcvmnsdmcv,nsdxcvmndscvmndsk nsdk jsdmn,vc', 'Askar', 22);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(250) NOT NULL,
  `Address` text NOT NULL,
  `City` varchar(250) NOT NULL,
  `PostalCode` varchar(30) NOT NULL,
  `Country` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_customer`
--

INSERT INTO `tbl_customer` (`CustomerID`, `CustomerName`, `Address`, `City`, `PostalCode`, `Country`) VALUES
(1, 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo', 'Avda. de la Construction 2222', 'Mexico D.F.', '5021', 'Mexico'),
(3, 'Antonio Moreno', 'Mataderos 2312', 'Mexico D.F.', '5023', 'Mexico'),
(4, 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Paula Parente', 'Rua do Mercado, 12', 'Resende', '08737-363', 'Brazil'),
(6, 'Wolski Zbyszek', 'ul. Filtrowa 68', 'Walla', '01-012', 'Poland'),
(7, 'Matti Karttunen', 'Keskuskatu 45', 'Helsinki', '21240', 'Finland'),
(8, 'Karl Jablonski', '305 - 14th Ave. S. Suite 3B', 'Seattle', '98128', 'USA'),
(9, 'Paula Parente', 'Rua do Mercado, 12', 'Resende', '08737-363', 'Brazil'),
(10, 'Pirkko Koskitalo', 'Torikatu 38', 'Oulu', '90110', 'Finland');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Surname` varchar(255) NOT NULL,
  `Major` varchar(255) NOT NULL,
  `SGroup` varchar(255) NOT NULL,
  `Year` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`Id`, `Username`, `Name`, `Surname`, `Major`, `SGroup`, `Year`, `Password`, `Type`) VALUES
(8, 'Oskar', 'Askar', 'Yelubayev', 'SE', 'se-1908', '2019', 'a', 0),
(9, 'Amper', 'Alisher', 'Amerinov', 'CS', 'cs-1901', '2019', 'alik', 0),
(10, 'Dauka', 'Dauren', 'Zhaparov', 'SE', 'se-1908', '2019', 'daukaxxx', 0),
(11, 'Bota', 'Akbota', 'Kairatova', 'BDA', 'bda-1917', '2019', 'bb', 0),
(12, 'Baga', 'Bagdaulet', 'Kanatbek', 'SE', 'se-1908', '2019', 'baga', 0),
(13, 'Alim', 'Alimzhan', 'Ismagambetov', 'ITM', 'itm-1904', '2019', 'a', 0),
(14, 'Moyabi', 'Dayana', 'Abisheva', 'SE', 'se-2008', '2020', 'abi', 0),
(15, 'Alina', 'Alina', 'Naufalova', 'SE', 'se-1908', '2019', 'aa', 0),
(16, 'Admin', 'Admin', 'Admin', 'Admin', 'Admin', 'Admin', 'Admin', 1),
(25, 'Starosta', 'Aigerim', 'Kapasheva', 'BDA', 'bda-1917', '2019', 'a', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `club_members`
--
ALTER TABLE `club_members`
  ADD KEY `Club_id` (`Club_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `clubs`
--
ALTER TABLE `clubs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `club_members`
--
ALTER TABLE `club_members`
  ADD CONSTRAINT `club_members_ibfk_1` FOREIGN KEY (`Club_id`) REFERENCES `clubs` (`Id`),
  ADD CONSTRAINT `club_members_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `users` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
