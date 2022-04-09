-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2021 at 10:27 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verbal_autopsy`
--

-- --------------------------------------------------------

--
-- Table structure for table `interviewers`
--

CREATE TABLE `interviewers` (
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `interviewers`
--

INSERT INTO `interviewers` (`username`, `email`, `pword`) VALUES
('Nadson Carliva', 'nadies@gmail.com', 'qwerty'),
('sdwood', 'sdwood@gmail.com', 'sd1561'),
('Sengayo Gideon', 'sengayo@nac.com', 'pppp');

-- --------------------------------------------------------

--
-- Table structure for table `va_data`
--

CREATE TABLE `va_data` (
  `index` bigint(20) DEFAULT NULL,
  `birth_year` double DEFAULT NULL,
  `deceased_sex` text DEFAULT NULL,
  `death_year` double DEFAULT NULL,
  `last_age` double DEFAULT NULL,
  `marital_status` text DEFAULT NULL,
  `last_education` text DEFAULT NULL,
  `education_years` double DEFAULT NULL,
  `respondent_sex` text DEFAULT NULL,
  `respondent_relationship` text DEFAULT NULL,
  `had_asthma` text DEFAULT NULL,
  `had_arthritis` text DEFAULT NULL,
  `had_cancer` text DEFAULT NULL,
  `had_copd` text DEFAULT NULL,
  `had_dementia` text DEFAULT NULL,
  `had_depression` text DEFAULT NULL,
  `had_deabetes` text DEFAULT NULL,
  `had_epilepsy` text DEFAULT NULL,
  `had_heart_disease` text DEFAULT NULL,
  `had_hypertension` text DEFAULT NULL,
  `had_obesity` text DEFAULT NULL,
  `had_stroke` text DEFAULT NULL,
  `had_tb` text DEFAULT NULL,
  `had_aids` text DEFAULT NULL,
  `care_sought` text DEFAULT NULL,
  `care_from_traditional_healer` text DEFAULT NULL,
  `care_from_govt_hosp` text DEFAULT NULL,
  `care_from_private_hospital` text DEFAULT NULL,
  `care_from_private_physician` text DEFAULT NULL,
  `care_from_phrmacy` text DEFAULT NULL,
  `have_health_records` text DEFAULT NULL,
  `show_health_records` text DEFAULT NULL,
  `death_certificate_issued` text DEFAULT NULL,
  `show_death_certificate` text DEFAULT NULL,
  `used_cigarattes` text DEFAULT NULL,
  `drank_alcohol` text DEFAULT NULL,
  `alcohol_amount` text DEFAULT NULL,
  `memory_loss_experience_3_last_months` text DEFAULT NULL,
  `experience_loss_of_conciousness` text DEFAULT NULL,
  `had_headaches` text DEFAULT NULL,
  `vomit_final_week` text DEFAULT NULL,
  `had_cough` text DEFAULT NULL,
  `cough_blood` text DEFAULT NULL,
  `breathing_difficulty` text DEFAULT NULL,
  `fast_breathing` text DEFAULT NULL,
  `had_sores` text DEFAULT NULL,
  `had_fever` text DEFAULT NULL,
  `fever_severity` text DEFAULT NULL,
  `sweat_wit_fever` text DEFAULT NULL,
  `had_rash` text DEFAULT NULL,
  `possile_COD` text DEFAULT NULL,
  `model_confidence` double DEFAULT NULL,
  `interviewee_name` text DEFAULT NULL,
  `interviewee_phone` text DEFAULT NULL,
  `interview_location` text DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `va_data`
--

INSERT INTO `va_data` (`index`, `birth_year`, `deceased_sex`, `death_year`, `last_age`, `marital_status`, `last_education`, `education_years`, `respondent_sex`, `respondent_relationship`, `had_asthma`, `had_arthritis`, `had_cancer`, `had_copd`, `had_dementia`, `had_depression`, `had_deabetes`, `had_epilepsy`, `had_heart_disease`, `had_hypertension`, `had_obesity`, `had_stroke`, `had_tb`, `had_aids`, `care_sought`, `care_from_traditional_healer`, `care_from_govt_hosp`, `care_from_private_hospital`, `care_from_private_physician`, `care_from_phrmacy`, `have_health_records`, `show_health_records`, `death_certificate_issued`, `show_death_certificate`, `used_cigarattes`, `drank_alcohol`, `alcohol_amount`, `memory_loss_experience_3_last_months`, `experience_loss_of_conciousness`, `had_headaches`, `vomit_final_week`, `had_cough`, `cough_blood`, `breathing_difficulty`, `fast_breathing`, `had_sores`, `had_fever`, `fever_severity`, `sweat_wit_fever`, `had_rash`, `possile_COD`, `model_confidence`, `interviewee_name`, `interviewee_phone`, `interview_location`, `comments`, `email`) VALUES
(0, 9000, 'Female', 1324, 1234, 'Married', 'Primary School', 13, 'Female', 'Father', 'No', 'No', 'Don\'t Know', 'Don\'t Know', 'Yes', 'Don\'t Know', 'Refused to Answer', 'Yes', 'Don\'t Know', 'No', 'Yes', 'Yes', 'Yes', 'Don\'t Know', 'No', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'Don\'t Know', 'No', 'Don\'t Know', 'No', 'No', 'Yes', 'Moderate', 'Yes', 'Yes', 'Yes', 'Refused to Answer', 'Don\'t Know', 'Don\'t Know', 'Don\'t Know', 'No', 'Don\'t Know', 'Don\'t Know', 'Mild', 'Don\'t Know', 'No', 'AIDS', 33.257, 'Solid Snake', '657896922', 'Makulu', 'Smooth and quick', 'nadies@gmail.com'),
(1, 1938, 'Male', 2009, 71, 'Married', 'Primary School', 10, 'Male', 'Sister', 'No', 'No', 'Yes', 'No', 'Don\'t Know', 'Yes', 'Refused to Answer', 'Refused to Answer', 'Refused to Answer', 'Refused to Answer', 'No', 'No', 'Yes', 'No', 'No', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'Don\'t Know', 'Yes', 'Yes', 'Yes', 'Yes', 'Don\'t Know', 'Low', 'No', 'No', 'No', 'Don\'t Know', 'Yes', 'Yes', 'Yes', 'No', 'No', 'Yes', 'Severe', 'No', 'No', 'Drowning', 17.296, 'Aisha Mwakere', '255691000000', 'Iringa Vijijini', 'Hard and violent', 'nadies@gmail.com'),
(2, 1309, 'Female', 20459, 909, 'Never Married', 'No Schooling', 2345, 'Male', 'Grandmother', 'Yes', 'Yes', 'Don\'t Know', 'No', 'No', 'Don\'t Know', 'Don\'t Know', 'Refused to Answer', 'Refused to Answer', 'Yes', 'No', 'Don\'t Know', 'Yes', 'Yes', 'No', 'No', 'No', 'Yes', 'Yes', 'Yes', 'Don\'t Know', 'No', 'No', 'Yes', 'No', 'Yes', 'High', 'Don\'t Know', 'Yes', 'Yes', 'Don\'t Know', 'No', 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'Severe', 'Yes', 'No', 'AIDS', 51.302, 'Aisha Mwakere', '255234234908', 'Makulu', 'Hard and violent', 'nadies@gmail.com'),
(3, 2000, 'Male', 2017, 17, 'Never Married', 'High School', 16, 'Female', 'Brother', 'No', 'Don\'t Know', 'No', 'Don\'t Know', 'No', 'Yes', 'Don\'t Know', 'Don\'t Know', 'No', 'Don\'t Know', 'Yes', 'No', 'No', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'No', 'No', 'Yes', 'Yes', 'No', 'Yes', 'Moderate', 'Yes', 'Don\'t Know', 'Yes', 'Don\'t Know', 'Yes', 'No', 'Don\'t Know', 'No', 'No', 'Yes', 'Moderate', 'Yes', 'Yes', 'Diabetes', 35.786, 'saida wood', '255234234908', 'Dar es Salaam', 'have a little problem with interview because deceased dont spend alot of time home he stay in college witjo', 'sdwood@gmail.com'),
(4, 1990, 'Male', 2017, 27, 'Never Married', 'High School', 18, 'Male', 'Mother', 'No', 'No', 'Don\'t Know', 'No', 'No', 'Yes', 'No', 'Don\'t Know', 'No', 'Don\'t Know', 'Yes', 'No', 'No', 'Don\'t Know', 'Yes', 'No', 'Yes', 'No', 'No', 'Yes', 'Yes', 'Yes', 'Don\'t Know', 'No', 'No', 'Yes', 'Low', 'No', 'Yes', 'Yes', 'No', 'Yes', 'No', 'No', 'No', 'Don\'t Know', 'Yes', 'Don\'t Know', 'No', 'Don\'t Know', 'Suicide', 45.00100000000001, 'Anita Bakary', '657896922', 'Makulu', 'Hard', 'nadies@gmail.com'),
(5, 1961, 'Male', 2021, 60, 'Married', 'College or Higher', 27, 'Male', 'Sister', 'No', 'Don\'t Know', 'No', 'Yes', 'No', 'Yes', 'Yes', 'No', 'No', 'Yes', 'Yes', 'No', 'No', 'No', 'Yes', 'No', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'Moderate', 'No', 'Yes', 'No', 'Don\'t Know', 'Yes', 'No', 'No', 'No', 'Don\'t Know', 'Yes', 'Moderate', 'No', 'Yes', 'Diabetes', 34.703, 'Maria Simon', '255676354278', 'Dar es Salaam', 'Calm and willing', 'sengayo@nac.com'),
(6, 1990, 'Male', 2020, 30, 'Divorced', 'High School', 18, 'Female', 'Father', 'No', 'Don\'t Know', 'Don\'t Know', 'No', 'Yes', 'Yes', 'No', 'No', 'Don\'t Know', 'Don\'t Know', 'Don\'t Know', 'Don\'t Know', 'No', 'No', 'Yes', 'No', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'No', 'Yes', 'Yes', 'Moderate', 'No', 'No', 'Yes', 'Don\'t Know', 'Yes', 'No', 'No', 'No', 'Don\'t Know', 'Yes', 'Don\'t Know', 'No', 'Yes', 'Suicide', 24.568, 'Issa Juma', '+255234234908', 'Mbeya', 'Smoot', 'nadies@gmail.com'),
(7, 2001, 'Female', 2019, 18, 'Never Married', 'College or Higher', 15, 'Female', 'Husband', 'No', 'Yes', 'Don\'t Know', 'Yes', 'Yes', 'No', 'No', 'Refused to Answer', 'Yes', 'Yes', 'Don\'t Know', 'Yes', 'No', 'Don\'t Know', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'High', 'Yes', 'Yes', 'No', 'Yes', 'No', 'Don\'t Know', 'Yes', 'Don\'t Know', 'Yes', 'Don\'t Know', 'Severe', 'Yes', 'Don\'t Know', 'Leukemia/Lymphomas', 37.603, 'saida wood', '0657896922', 'Iringa Vijijini', 'Smooth and quick', 'nadies@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `interviewers`
--
ALTER TABLE `interviewers`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `va_data`
--
ALTER TABLE `va_data`
  ADD KEY `ix_va_data_index` (`index`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
