-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2022 at 08:40 AM
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
-- Database: `cee_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_acc`
--

CREATE TABLE `admin_acc` (
  `admin_id` int(11) NOT NULL,
  `admin_user` varchar(1000) NOT NULL,
  `admin_pass` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_acc`
--

INSERT INTO `admin_acc` (`admin_id`, `admin_user`, `admin_pass`) VALUES
(1, 'admin@username', 'admin@password');

-- --------------------------------------------------------

--
-- Table structure for table `course_tbl`
--

CREATE TABLE `course_tbl` (
  `cou_id` int(11) NOT NULL,
  `cou_name` varchar(1000) NOT NULL,
  `cou_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_tbl`
--

INSERT INTO `course_tbl` (`cou_id`, `cou_name`, `cou_created`) VALUES
(66, 'PHP', '2022-04-13 12:15:21'),
(67, 'JAVA', '2022-04-13 12:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `examinee_tbl`
--

CREATE TABLE `examinee_tbl` (
  `exmne_id` int(11) NOT NULL,
  `exmne_fullname` varchar(1000) NOT NULL,
  `exmne_course` varchar(1000) NOT NULL,
  `exmne_gender` varchar(1000) NOT NULL,
  `exmne_birthdate` varchar(1000) NOT NULL,
  `exmne_year_level` varchar(1000) NOT NULL,
  `exmne_email` varchar(1000) NOT NULL,
  `exmne_password` varchar(1000) NOT NULL,
  `exmne_status` varchar(1000) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examinee_tbl`
--

INSERT INTO `examinee_tbl` (`exmne_id`, `exmne_fullname`, `exmne_course`, `exmne_gender`, `exmne_birthdate`, `exmne_year_level`, `exmne_email`, `exmne_password`, `exmne_status`) VALUES
(10, 'Vivek Bodarya', '67', 'male', '2000-10-01', 'third year', 'vivekbodarya@gmail.com', 'vivek', 'active'),
(71, 'Darshak', '67', 'male', '2001', 'third year', 'darshak@gmail.com', 'darshak123', 'active'),
(72, 'Darshan', '67', 'male', '2001', 'third year', 'darshankheni@gmail.com', 'darshan123', 'active'),
(73, 'Garvit', '67', 'male', '2002', 'third year', 'garvit@gmail.com', 'garvit123', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `exam_answers`
--

CREATE TABLE `exam_answers` (
  `exans_id` int(11) NOT NULL,
  `axmne_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `exans_answer` varchar(1000) NOT NULL,
  `exans_status` varchar(1000) NOT NULL DEFAULT 'new',
  `exans_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_answers`
--

INSERT INTO `exam_answers` (`exans_id`, `axmne_id`, `exam_id`, `quest_id`, `exans_answer`, `exans_status`, `exans_created`) VALUES
(341, 10, 30, 49, 'Long to int', 'new', '2022-05-03 05:49:58'),
(342, 10, 30, 46, 'jk', 'new', '2022-05-03 05:49:58'),
(343, 71, 30, 48, '32 and 64', 'new', '2022-05-03 05:50:57'),
(344, 71, 30, 47, '8', 'new', '2022-05-03 05:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `exam_attempt`
--

CREATE TABLE `exam_attempt` (
  `examat_id` int(11) NOT NULL,
  `exmne_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `examat_status` varchar(1000) NOT NULL DEFAULT 'used'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_attempt`
--

INSERT INTO `exam_attempt` (`examat_id`, `exmne_id`, `exam_id`, `examat_status`) VALUES
(87, 10, 30, 'used'),
(88, 71, 30, 'used');

-- --------------------------------------------------------

--
-- Table structure for table `exam_img`
--

CREATE TABLE `exam_img` (
  `img_id` int(10) NOT NULL,
  `exmne_id` int(10) NOT NULL,
  `examId` int(10) NOT NULL,
  `img_src` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam_img`
--

INSERT INTO `exam_img` (`img_id`, `exmne_id`, `examId`, `img_src`) VALUES
(3, 10, 30, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gIoSUNDX1BST0ZJTEUAAQEAAAIYAAAAAAQwAABtbnRyUkdCIFhZWiAAAAAAAAAAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAAHRyWFlaAAABZAAAABRnWFlaAAABeAAAABRiWFlaAAABjAAAABRyVFJDAAABoAAAAChnVFJDAAABoAAAAChiVFJDAAABoAAAACh3dHB0AAAByAAAABRjcHJ0AAAB3AAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAFgAAAAcAHMAUgBHAEIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFhZWiAAAAAAAABvogAAOPUAAAOQWFlaIAAAAAAAAGKZAAC3hQAAGNpYWVogAAAAAAAAJKAAAA+EAAC2z3BhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABYWVogAAAAAAAA9tYAAQAAAADTLW1sdWMAAAAAAAAAAQAAAAxlblVTAAAAIAAAABwARwBvAG8AZwBsAGUAIABJAG4AYwAuACAAMgAwADEANv/bAEMAAwICAwICAwMDAwQDAwQFCAUFBAQFCgcHBggMCgwMCwoLCw0OEhANDhEOCwsQFhARExQVFRUMDxcYFhQYEhQVFP/bAEMBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIAGQAZAMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAFAAQGBwgDAQL/xAA+EAACAQMCAwQIAwUHBQAAAAABAgMABBEFEgYhMRMiQVEHCBQyYXGBkSNCoRVSscHRJDNiguHi8HKSosLS/8QAGgEAAgMBAQAAAAAAAAAAAAAAAgMBBAUABv/EACMRAAICAQQCAwEBAAAAAAAAAAABAhEDEiExUQRBEyJhMjP/2gAMAwEAAhEDEQA/AGmhWftt0ZCPwkYgE+Jo3ZWLdtcuq8jJnIHTkK5jT5NOhQxE9l7vTofKiNt2nsyqScNzI86z8a00h6XRwjdlecFd8qoSAPzUQsLNobdQ/ORubH416lsbR7KSNNvaTYJ8xtNFJLRSdy9Dzx5VbildnDWzsktrdg/QsTyHma4QwyJPNHGpEboyxswxtYg4+dGZIuwhjLDHdz865alblBYjB3GcMw/ymncslAZLWOxgWFN3cHMkYJPia5xwqkcjgZLHxo1fxh3y2A38aZX0a2umpKeQLtz+1SERu+0+W6cSEpF2ff3DngDrTC5twYnu4uftDdq2Rzyef+lSiePs9Mn3LiSSMgjxAx0oTHaMumQADn2S5B8eXSo5IZFliaS6UFe8Mn5cqFXsPbyMGZsHyOKl2mWq3WpBQOeGBB8O6ajUGLueWUf3MblQf3iKVJb2DXoDXGkWsDgSw73YbiSaVPNQPa3BJ58sUqE62XNrVnJZ9o8ab7aTDMo6fP500to1nkt4kOUCb2YeWeQrlMr305jeWR13YCBjj7UQ0y1xHOqrsMUpjGPhj+ppEV0FQ+a39quLUAckfPy5GnF2q243B13D8meteafETJhjnCk/pRG1t1mlCkDzOR0FWkiENinttzBJnFvFCuAfzMf6Up4+2li58lbP6V3si9zZylz7szhc+A3chTYCO2meSeQRwrG7lmOAMKTTCUMdXmiZGjAkZvAovQ+dDXD3lrYrMjJ7M7yOM++x27DjyG0n5/Kq/wCKvTzpumyyR2ML3rKf7wnap+XjUY0f1iYxqNw+p2JEc20fgPnYAMYwfvQ/boIt+4lWUMuTg/CuV2zQQIiIpYKANxoboPEOm8V2S3mm3CzRnG5M95D5MPA0c4mt/YNSMAHfKrsXzyAR/GjRBEZEurG7e/LRwrtKNtGc7u6D8xmhN5ajTIEhVMRqO7jxqTcSwhdH7EHJ7RCx8+8KF6uAISH5qOYPlQtdgsiUkwLnKnNKuk1uTIehpUFMAuPhiJZImv5QQJCeyVhg48/rUj0PTFuNOu36M87OPsKiwjmtZOz3tsAAAz4UdBA0+1ALZcEsM8upH8BSocDBxaSpbS3QmHfjiY4Azu8Bj60/s1MdqCwAkbmw/lQ72UWhsZFiUNPLtywycbTmiRhw2QT5U+PQLFZ2y29o5YhQXZu8fM1nz0+8cyiZtCs5cxRd6aRW94kZC/T+fwrRd3GiWsRYbtybiCPif6Vh3jbU/wBoarfXajb2szsU8sk8qYubYaIhe3XaFyxxgedCWnO7OcjxzTi6fcxGDzPSm9xoWphRJ7JKqHoSuBiidJWdQb4J44vOENZhu7WZuz3DtYQ2BKuean/nKti3GvWfFepHiK0dmsrq3hFqrD3QI1DE/HcCPpWCHMkExDcmHhWsfV8vJrz0bJHcgiKOdxEx/d5f+26hquCETPUCt2AmQe8OXyNDdYuFVWURM/yo1aWoudYtbc/nmVD9TUb1O4IuWiX3yxUCoafs7kissWoLK4gh/CzyDkEj4UqkbXaWuIxzx1PmaVBv0AW9xVpMmksWdc9ke9g9V865QyJdT2MMZDRRwiWUjxBY4A+dZ/uPWV029fdJpUzk8+dznP6V92vrN21tGVTRmRc90JcYwvgPd5/60mF9Bmk5HN/f2mRgI+4DwHI07vAbXMmNyD3gPKs42vrVwxPk6IzDz9q/2U4HrRW05DPoRbPX+2f7KbdPcijRt5Kl81lFAd0cdsGlcdOZYgCsVabwl+2dd1aK6cRLYyFJE8WIJ5D6irMHrUKI2ROHwhDEqFu8YXwz3P1of6PFfjLXeItVtY0tnvis6oT2mxssDnkM+f1FFObSLPj4/kyUR3QNP0uyuxEeHy0hORM53H6A0B4zne91NrSSRbK2VsAdCRVp6NwvqMnEa3N5Lk20jM7nluH5RjpyqtuO9GGpcS3bKwH4h7o6dalNXRbnhmsd/pW3EehxLYS3EMyz9l+Zc5wTWn/QZoq2Pon0qUFSJVaR23DAYseXXkcY5VSN/oCQ6bdAnIdDnl4Yr70D0xL6P9J9gNh7ckpEue22BeQBGNp8qi9+CjKOnc0Rpuqw6TxPYrcSqYBOjLIDnbhskH+VRQyma6u758r2zt2SHkVTPLl5mqjm9ZaIrJt0JRKVwr+0DuHz9znQ7UvWLjuzkaLsboSLnr/4USdrgUy2Lm5YTHB5fOlVFS+m/c5P7PkGfATj/wCaVTqmRTIaZWSUhZFcdAwPI04SeXwC8/EsK89otDnbEBX0jwdduBS7BvahxFLcDAwMD/EKdRzTjnt/UU0Rk8Biu6upIpqTaJVcjyGe5BO1fD94Vefq2cRew3V3azAIQ29T4ncAD9BtH/dVEx7T0NTv0VxyjiF3ikKlIWcgHG7BHI0M8cnFstePkWPIpGj+L76PS9Oe9hOGErGRmPIjA61VPFthINQe+7FraaRhL7O4IYIQCD8+fSrKS1bXdBhlZg0a3KMyHockcj9jQr0hRSrqdxHMYr+3YbtgG2WP4jzApUWqTRt5n9X0UpxTqgWzlQDBZSBt6mqs4gS5vbpmhsp1jACjMZ5VY3FOjSRzdpFIJbZ3ADDqvzoe8TqnM/SrGO521yYGWWl0yqbjTb0qf7JOPj2ZppNY3iHD20wPkUNWrOxQHnQm5mY558/M1z1+xNorUxTgkGKTP/SaVTiSfDefypUt5adUTq/CNxXJBHOncU+Mc+tBY5SpzTyGTcOfKmRjsAqDMUrOQFySfIVI9M4Z1TUEV1tzGmPfl7o/rT/0d8OSXMcVysDT3FwGW3QJuJwQCQPv9jVopwxqrSqns/ZgDcd8gHT61Yx4smSmhcskYsr+24FdFBnu+fisadPqT8qPaVpw4WWa5tpHNyyiJWk/xMozj4HBqwL/ANH0cGlTXN9q9pZ3Se5DGWkZuWRkAcvDrUX1gWSaDsF17TcSRNuCKQqMDlcE+ZUZp8sTprgOE02mXt6K7M3Ogarp87NIlskbhicljg+P+WuHEFrZ8XXl1YorR3tnbrKsqjB5k+P/ADrTP0GcSrqDOHYBrq2BcYxllODj7mrDvdGteGdO1HWHjRLuddqE/lUeH1PX5CsbFuq9npcrTT6MncbK2iSyRXTAMz7Q2MbqiMl2HXIPI9PjRX0p6hJxFeXc3arttssI8c358yPlVXx6tc2w7rb18VPhWlGLxrf2YGf7ytPgk13ccsZBoPczAk5JFMk1wSn8QYP6V5LeKwO0+HSlyltsxC/ThLJlzjP0pVwaYBjzH2pUjUuidzquhWgRO63Pr3qeLoFqbdmG8FRkYalSrclCHxt0V22WjYTS8OaRo09hI0M0cEYVx173vffJplJqd1Nq0u+eRiJCMliTSpUjjGqFdkxs7hxZDveFM2jD6ZeFuZKHr8CKVKnJWnY1eid+h9zHxPw+q8lBZMDxG1qsv076xdW2mGGN9qBelKlXnvG/uR6Gf+aMf67eywWEs64MnalDuGQQQQQaecIcO6dxRZsl1apC4x+Jb5Vjn7jw8qVKvQYUpY3ZgZfbAfGHCVjoZxbmVhuK/iMD5+QFQSX8OVgCcClSrKyKpOiYO4bnyOfWlSpVVlyPo//Z'),
(4, 71, 30, 'data:image/jpeg;base64,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');

-- --------------------------------------------------------

--
-- Table structure for table `exam_question_tbl`
--

CREATE TABLE `exam_question_tbl` (
  `eqt_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `exam_question` varchar(1000) NOT NULL,
  `exam_ch1` varchar(1000) NOT NULL,
  `exam_ch2` varchar(1000) NOT NULL,
  `exam_ch3` varchar(1000) NOT NULL,
  `exam_ch4` varchar(1000) NOT NULL,
  `exam_answer` varchar(1000) NOT NULL,
  `exam_status` varchar(1000) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_question_tbl`
--

INSERT INTO `exam_question_tbl` (`eqt_id`, `exam_id`, `exam_question`, `exam_ch1`, `exam_ch2`, `exam_ch3`, `exam_ch4`, `exam_answer`, `exam_status`) VALUES
(39, 27, 'PHP Q1?', 'op1 ', 'op2', 'op3', 'op4', 'op2', 'active'),
(40, 27, 'PHP Q2?', 'op1', 'op2', 'op3', 'op4', 'op1', 'active'),
(41, 27, 'PHP Q3?', 'op1', 'op2', 'op3', 'op4', 'op3', 'active'),
(42, 27, 'PHP Q4?', '1', '2', '3', '4', '4', 'active'),
(43, 27, 'PHP Q5?', '1', '3', '5', '7', '5', 'active'),
(44, 28, 'Java Q1', '101', '20', '30', '40', '20', 'active'),
(45, 29, 'jeeh', 'hcjejehjf', 'hvehjh1j', 'jhjvjnvj', 'xyz', 'xyz', 'active'),
(46, 30, 'hdejhjh', 'jhjhrj1jj', 'jj', 'hjkhjkh', 'jk', 'jk', 'active'),
(47, 30, 'Number of primitive data types in Java are?', '6', '7', '8', '9', '8', 'active'),
(48, 30, 'What is the size of float and double in java?', '32 and 64', '32 and 32', '64 and 64', '64 and 32', '32 and 64', 'active'),
(49, 30, 'Automatic type conversion is possible in which of the possible cases?', 'Byte to int', 'Int to long', 'Long to int', 'Short to int', 'Int to long', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `exam_tbl`
--

CREATE TABLE `exam_tbl` (
  `ex_id` int(11) NOT NULL,
  `cou_id` int(11) NOT NULL,
  `ex_title` varchar(1000) NOT NULL,
  `ex_time_limit` varchar(1000) NOT NULL,
  `ex_questlimit_display` int(11) NOT NULL,
  `ex_description` varchar(1000) NOT NULL,
  `ex_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_tbl`
--

INSERT INTO `exam_tbl` (`ex_id`, `cou_id`, `ex_title`, `ex_time_limit`, `ex_questlimit_display`, `ex_description`, `ex_created`) VALUES
(28, 67, 'Java Exam test 1', '10', 10, 'Good Luck!!', '2022-04-13 12:44:11'),
(29, 67, 'Java test 2', '30', 10, 'Good Luck!!', '2022-04-21 11:33:51'),
(30, 67, 'Java test 3', '10', 2, 'Good..!', '2022-05-01 08:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks_tbl`
--

CREATE TABLE `feedbacks_tbl` (
  `fb_id` int(11) NOT NULL,
  `exmne_id` int(11) NOT NULL,
  `fb_exmne_as` varchar(1000) NOT NULL,
  `fb_feedbacks` varchar(1000) NOT NULL,
  `fb_date` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_acc`
--
ALTER TABLE `admin_acc`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `course_tbl`
--
ALTER TABLE `course_tbl`
  ADD PRIMARY KEY (`cou_id`);

--
-- Indexes for table `examinee_tbl`
--
ALTER TABLE `examinee_tbl`
  ADD PRIMARY KEY (`exmne_id`);

--
-- Indexes for table `exam_answers`
--
ALTER TABLE `exam_answers`
  ADD PRIMARY KEY (`exans_id`);

--
-- Indexes for table `exam_attempt`
--
ALTER TABLE `exam_attempt`
  ADD PRIMARY KEY (`examat_id`);

--
-- Indexes for table `exam_img`
--
ALTER TABLE `exam_img`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `exam_question_tbl`
--
ALTER TABLE `exam_question_tbl`
  ADD PRIMARY KEY (`eqt_id`);

--
-- Indexes for table `exam_tbl`
--
ALTER TABLE `exam_tbl`
  ADD PRIMARY KEY (`ex_id`);

--
-- Indexes for table `feedbacks_tbl`
--
ALTER TABLE `feedbacks_tbl`
  ADD PRIMARY KEY (`fb_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_acc`
--
ALTER TABLE `admin_acc`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_tbl`
--
ALTER TABLE `course_tbl`
  MODIFY `cou_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `examinee_tbl`
--
ALTER TABLE `examinee_tbl`
  MODIFY `exmne_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `exam_answers`
--
ALTER TABLE `exam_answers`
  MODIFY `exans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345;

--
-- AUTO_INCREMENT for table `exam_attempt`
--
ALTER TABLE `exam_attempt`
  MODIFY `examat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `exam_img`
--
ALTER TABLE `exam_img`
  MODIFY `img_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam_question_tbl`
--
ALTER TABLE `exam_question_tbl`
  MODIFY `eqt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `exam_tbl`
--
ALTER TABLE `exam_tbl`
  MODIFY `ex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `feedbacks_tbl`
--
ALTER TABLE `feedbacks_tbl`
  MODIFY `fb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
