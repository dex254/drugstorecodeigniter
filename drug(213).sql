-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2022 at 10:50 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drug`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `date`) VALUES
(1, 'Pharmaceuticals', '2019-01-29 08:43:00'),
(2, 'Non-Pharmaceuticals', '2019-01-29 08:43:00'),
(3, 'Nutrition', '2019-03-28 11:37:35'),
(4, 'Laboratory ', '2022-02-13 12:56:46'),
(5, 'Renal Products', '2022-02-13 13:01:04'),
(6, 'Linen Items', '2022-02-13 13:01:04'),
(7, 'X ray items', '2022-02-13 13:01:04'),
(8, 'Dental Items', '2022-02-13 13:01:04'),
(9, 'Public Health Products', '2022-02-13 13:01:04'),
(10, 'Basic Equipment', '2022-02-13 13:01:04'),
(11, 'CHV Kits', '2022-02-13 13:01:04'),
(12, 'Covid-19 supplies', '2022-02-13 13:01:04'),
(13, 'Orthopaedic Products', '2022-02-13 13:01:04');

-- --------------------------------------------------------

--
-- Table structure for table `denote`
--

CREATE TABLE `denote` (
  `id` int(11) NOT NULL,
  `deliveryNo` varchar(100) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `funds` varchar(100) NOT NULL,
  `deliveredBy` varchar(100) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '1',
  `totalcost` int(100) NOT NULL,
  `regBy` int(10) NOT NULL,
  `approvedBy` int(100) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `denote`
--

INSERT INTO `denote` (`id`, `deliveryNo`, `supplier`, `funds`, `deliveredBy`, `status`, `totalcost`, `regBy`, `approvedBy`, `Date`) VALUES
(1, 'EMB-2-053092-2021/2022', 'KEMSA', 'Uasin Gishu County', 'Murungi', 4, 23495900, 17, 17, '2022-04-01 09:13:05'),
(2, 'STOCK TAKE', 'STORE', 'STORE', 'STORE', 1, 0, 17, 0, '2022-04-01 09:13:31');

-- --------------------------------------------------------

--
-- Table structure for table `dispensed`
--

CREATE TABLE `dispensed` (
  `id` int(11) NOT NULL,
  `receiptNo` int(100) NOT NULL,
  `batch` varchar(100) NOT NULL,
  `drugId` int(10) NOT NULL,
  `facilityId` int(10) NOT NULL,
  `quantity` int(20) NOT NULL,
  `uom` varchar(100) NOT NULL,
  `issuedTo` varchar(100) NOT NULL,
  `cartId` int(100) NOT NULL,
  `registeredBy` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dispensestatus`
--

CREATE TABLE `dispensestatus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispensestatus`
--

INSERT INTO `dispensestatus` (`id`, `name`) VALUES
(1, 'First Round'),
(2, 'Secord Round'),
(3, 'Thirth Round'),
(4, 'Forth Round'),
(5, 'Fifth Round');

-- --------------------------------------------------------

--
-- Table structure for table `dispensewl`
--

CREATE TABLE `dispensewl` (
  `id` int(11) NOT NULL,
  `drugId` int(10) NOT NULL,
  `facilityId` int(10) NOT NULL,
  `dispenseId` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `approvedQuant` int(100) NOT NULL DEFAULT '0',
  `status` int(10) NOT NULL DEFAULT '1',
  `registeredBy` int(10) NOT NULL,
  `registeredTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(11) NOT NULL,
  `category` int(10) NOT NULL,
  `name` varchar(535) NOT NULL,
  `currentStock` int(100) NOT NULL,
  `tracer` int(2) NOT NULL DEFAULT '0',
  `istatus` int(10) NOT NULL DEFAULT '0',
  `registered_by` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `category`, `name`, `currentStock`, `tracer`, `istatus`, `registered_by`, `date`) VALUES
(1, 2, 'Abdominal Gauze Swab X-Ray Detect.-24 Ply 22.5Cm X 22.5Cm', 161, 0, 5, 1, '2022-04-01 09:31:28'),
(2, 1, 'Abiraterone Tablets 250mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(3, 2, 'Absorbent Material for incontinence', 21, 0, 2, 1, '2022-04-01 10:51:26'),
(4, 8, 'Absorbent Paper Point Sz 15-40(28Mm-Length)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(5, 8, 'Absorbent Paper Points Assorted Sizes 45-80', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(6, 1, 'Acetazolamide Tablets 250mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(7, 1, 'Acetazolamide Tablets 250mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(8, 4, 'Acetone', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(9, 1, 'Acetylcysteine Inj. 200mg/ml, 10ml Ampoule', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(10, 1, 'Acetylsalicylic Acid Tablets - 300mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(11, 1, 'Acetylsalicylic Acid Tablets 75mg-Enteric Coated Blister Pack', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(12, 5, 'Acid Contentrate (Heamosafe)', 100, 1, 0, 1, '2022-04-01 09:52:11'),
(13, 5, 'Acid Contentrate (Lympha)', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(14, 8, 'Acrylic Teeth Lower Anterior Set Of 6', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(15, 8, 'Acrylic Teeth Upper Anterior Set Of 6', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(16, 5, 'Acute Dialysis Dual Lumen Catheter, Jugular 12FR x 16cm (Mahurkar)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(17, 5, 'Acute Dialysis Dual Lumen Catheter, Jugular 13.5FR x 16cm (Mahurkar)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(18, 1, 'Acyclovir 3% Ophthalmic Ointment', 200, 2, 0, 1, '2022-04-01 09:34:20'),
(19, 1, 'Acyclovir PFI 250mg vial', 94, 0, 4, 1, '2022-04-01 10:11:41'),
(20, 1, 'Acyclovir Tablets 400mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(21, 1, 'Acyclovir Tablets 400mg', 651, 0, 3, 1, '2022-04-01 11:10:45'),
(22, 2, 'Adhensive Skin Traction Kit, Adult', 72, 0, 4, 1, '2022-04-01 10:46:17'),
(23, 2, 'Adhesive Tape Surgical Porous, Transparent 2.5cm x 9.14M  ', 84, 0, 3, 1, '2022-04-01 10:32:15'),
(24, 13, 'Adjustable Clamps  Small', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(25, 13, 'Adjustable Clamps Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(26, 1, 'Adrenaline Injection - 1Mg/Ml', 5180, 0, 2, 1, '2022-04-01 09:30:19'),
(27, 13, 'Adult Skin Traction Kit', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(28, 2, 'Airway Guedel - Size 0', 63, 0, 4, 1, '2022-04-01 09:18:28'),
(29, 2, 'Airway Guedel - Size 00', 76, 0, 4, 1, '2022-04-01 09:44:43'),
(30, 2, 'Airway Guedel - Size 1', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(31, 2, 'Airway Guedel - Size 2', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(32, 2, 'Airway Guedel - Size 3', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(33, 2, 'Airway Guedel - Size 4', 72, 0, 4, 1, '2022-04-01 10:07:44'),
(34, 2, 'Airway Guedel - Size 5', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(35, 2, 'Airways Laryngeal Mask No 2', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(36, 2, 'Airways Laryngeal Mask No 2.5', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(37, 2, 'Airways Laryngeal Mask No 3', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(38, 2, 'Airways Laryngeal Mask No 4', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(39, 2, 'Airways Laryngeal Mask No 5', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(40, 4, 'Alanine Aminotransferase - CS-300 Chemistry analyzer:', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(41, 1, 'Albendazole Tablets 400mg', 500, 0, 2, 1, '2022-04-01 07:46:13'),
(42, 4, 'Albumin - CS-300 Chemistry analyzer:', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(43, 1, 'Albumin (Human) 20%', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(44, 1, 'Alcohol Based Hand Rub (KEM-rub)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(45, 12, 'Alcohol Based Hand Sanitizer', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(46, 2, 'Alcohol Preinjection Swabs', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(47, 1, 'Alcoholic Based Hand Rub, Alcohol Content 80% and Glycerol Ph 6.4-6.9, with Hand Pump', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(48, 1, 'Alendronic Acid 70mg Tablets', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(49, 4, 'Alkaline Phosphatase', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(50, 1, 'Allopurinol Tablets 100mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(51, 2, 'Ambu Bags With Masks - Adult', 2, 0, 2, 1, '2022-04-01 09:32:51'),
(52, 2, 'Ambu Bags With Masks - Neonate', 2, 0, 2, 1, '2022-04-01 09:43:28'),
(53, 2, 'Ambu Bagswith Masks - Child', 2, 0, 2, 1, '2022-04-01 09:30:53'),
(54, 1, 'Amikacin Sulphate 500Mg /2Ml Injection', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(55, 3, 'Amino Acid Solution for IV Infusion providing 8gm Amino acid (Bcaa) in 100ml for Hepatic insufficiency', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(56, 3, 'Amino Acids Solution Injection, Solution For Infusion, 5 - 6 Amino Acids With Glucose Paediatric Solution, 500ml bottle', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(57, 3, 'Amino Acids Solution Injection, Solution for Infusion, 7% Amino Acids without Electrolytes and without Carbohydrate', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(58, 3, 'Amino Acids Solution Injection, Solution for Infusion, 8% Amino Acids', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(59, 3, 'Amino Acids Solution With Electrolytes Injection, Solution for Infusion, 10% Amino Acids with Electrolytes', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(60, 1, 'Aminosidine Tablets 250mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(61, 1, 'Amitriptyline Tablets 25mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(62, 1, 'Amitriptyline Tablets 25mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(63, 1, 'Amlodipine Tablet 5mg', 500, 0, 3, 1, '2022-04-01 07:59:10'),
(64, 1, 'Amlodipine Tablets 5mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(65, 1, 'Amoxicillin Capsules 500mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(66, 1, 'Amoxicillin Tablet 250mg Dispersible, Scored', 12936, 0, 2, 1, '2022-04-01 07:51:50'),
(67, 1, 'Amoxicillin/Clavulanic 1.2g Injection', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(68, 1, 'Amoxycillin/Clavulanic Dispersible Tablets 228.5mg', 2415, 0, 3, 1, '2022-04-01 09:20:32'),
(69, 1, 'Amoxycillin/Clavulanic Potassium Tabs (875+125mg) 1gm', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(70, 1, 'Amphotericin B Injection, PFI 50mg (Liposomal)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(71, 1, 'Anastrozole Tablet, 1mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(72, 1, 'Anti-D (Rh) Injection - 300mcg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(73, 4, 'Anti-Human Globulin (AHG)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(74, 1, 'Anti-Rabies Serum Inj - 200 1U/Ml 5Ml Ampoule/Vial', 45, 0, 4, 1, '2022-04-01 11:23:14'),
(75, 6, 'Apron Disposable White Polythene', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(76, 8, 'Arch Bars', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(77, 1, 'Aripiprazole 15mg,Tablet', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(78, 5, 'Arterio - Venous Fistula Needles (Paired, Arterio & Venous) 16G', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(79, 5, 'Arterio - Venous Fistula Needles (Paired, Arterio & Venous) 17G', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(80, 4, 'Asot Kit (50 Tests)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(81, 4, 'Aspartate Aminotransferase', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(82, 1, 'Atorvastatin Tablets 10mg ', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(83, 1, 'Atorvastatin Tablets 20mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(84, 1, 'Atorvastatin Tablets 40mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(85, 1, 'Atracurium Injection-10Mg/Ml, 5Ml Ampoule', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(86, 1, 'Atropine Injection - 1mg/ml', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(87, 1, 'Atropine Injection - 1mg/ml', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(88, 2, 'Autoclaving Tape - ? ( 19Mm X 50M)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(89, 1, 'Azathioprine Tablets 50mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(90, 1, 'Azithromycin Oral Suspension (Pfr) - 200Mg/5Ml', 20000, 0, 3, 1, '2022-04-01 08:05:49'),
(91, 1, 'Azithromycin Tablets 500mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(92, 10, 'Baby Weighing Scale 10-20Kgs', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(93, 6, 'Baby Wrappers', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(94, 2, 'Bag, Enteral Feeding Set With Administration Set (1.2L)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(95, 2, 'Bandages Cotton Crepe Ridged/Wrinkled Elastic -15Cm X 4.5M Bp', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(96, 2, 'Bandages Cotton Crepe Ridged/Wrinkled Elastic- 5Cm X 4.5M Bp', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(97, 2, 'Bandages Cotton Crepe Ridged/Wrinkled Elastic- 5Cm X 4.5M Bp', 3, 0, 2, 1, '2022-04-01 10:49:59'),
(98, 2, 'Bandages Cotton Crepe Ridged/Wrinkled Elastic -7.5Cm X 4.5M Bp', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(99, 2, 'Bandages Cotton Crepe Ridged/Wrinkled Elastic -7.5cm X 4.5m Bp', 526, 0, 2, 1, '2022-04-01 09:56:31'),
(100, 2, 'Bandages Cotton Crepe Ridged/Wrinkled Elastic-10Cm X 4.5M Bp', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(101, 2, 'Bandages Cotton Crepe Ridged/Wrinkled Elastic-10Cm X 4.5M Bp', 637, 0, 2, 1, '2022-04-01 10:15:31'),
(102, 2, 'Bandages Cotton L/Woven Bp - 15Cm X 4.5M', 224, 0, 2, 1, '2022-04-01 10:55:57'),
(103, 2, 'Bandages Cotton L/Woven Bp - 5Cm X 4.5M Bp', 294, 0, 2, 1, '2022-04-01 10:02:50'),
(104, 2, 'Bandages Cotton L/Woven Bp - 7.5Cm X 4.5M', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(105, 2, 'Bandages Cotton L/Woven Bp- 10Cm X 4.5M', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(106, 2, 'Bandages Elastic Skin Adhesive Porous Plaster Bp-10Cmx4.5M', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(107, 2, 'Bandages Elastic Skin Adhesive Porous Plaster-7.5Cmx4.5M Bp', 88, 0, 2, 1, '2022-04-01 10:39:18'),
(108, 2, 'Bandages Plaster of Paris - 10cm x 2.70m Bp (Gypsona)', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(109, 2, 'Bandages Plaster of Paris - 20cm x 2.70m Bp (Gypsona)', 0, 0, 5, 1, '0000-00-00 00:00:00'),
(110, 2, 'Bandages Plaster of Paris - 7.5cm x 2.70m Bp (Gypsona)', 0, 0, 5, 1, '0000-00-00 00:00:00'),
(111, 7, 'Barium Sulphate Suspension - 0.95Gm/Ml', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(112, 1, 'Basal Insulin, long Acting Insulin Analog 100iu/ml (Insulin Glargine)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(113, 2, 'Basic Dressing Set with Green Towels (Drapes)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(114, 10, 'Bed - Delivery', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(115, 6, 'Bed Sheets, Large Size 160cm x 240cm, 100% Cotton', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(116, 6, 'Bed Spreads Std (Counter-Panes) - Light Cream-160X230Cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(117, 1, 'Benzathine Benzylpenicillin 1.2MU Vial', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(118, 1, 'Benzhexol 5Mg Tabs', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(119, 1, 'Benzhexol Tablets - 5Mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(120, 1, 'Benzyl Benzoate Emulsion - 25% Application', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(121, 1, 'Benzyl Benzoate Emulsion, 25% w/v, 100ml ', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(122, 1, 'Betamethasone Ointment, 0.1%, 15G', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(123, 1, 'Betamethasone Sodium Phosphate 0.1% W/V And Neomycin Sulphate 0.5% W/V', 0, 2, 4, 1, '0000-00-00 00:00:00'),
(124, 1, 'Bicalutamide Tablet, 50mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(125, 5, 'Bi-carbonate powder (750g) cartridge (Nipro)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(126, 5, 'Bi-carbonate powder 750g (Bellco)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(127, 5, 'Biflexy Bag 750gms (Flexya machine)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(128, 4, 'Bijou Bottles', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(129, 1, 'Bisacodyl Tablets  5mg', 835, 0, 2, 1, '2022-04-01 11:05:11'),
(130, 6, 'Blankets Cellular Std - 180X230Cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(131, 1, 'Bleomycin Injection, Lyophilised Powder for Reconstitution, 15mg  (Sulphate)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(132, 4, 'Blood Collection Needle G21', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(133, 4, 'Blood Collection Needle G23', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(134, 4, 'Blood Collection Tube (Red Top 4 Ml)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(135, 2, 'Blood Giving Sets Double Chamber', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(136, 2, 'Blood Giving Sets Double Chamber', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(137, 4, 'Blood Grouping Antisera (Ant-A)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(138, 4, 'Blood Grouping Antisera (Ant-B)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(139, 4, 'Blood Grouping Antisera (Anti -D Igm Monoclonal)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(140, 1, 'Bortezomib Injection, Lyophilised powder for reconstitution, 3.5mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(141, 4, 'Bovine Albumin 30%', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(142, 2, 'Brain Swabs', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(143, 1, 'Bromazepam Tablets 3mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(144, 4, 'Brucella Arbortus Kit (Antigen Test)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(145, 4, 'Brucella Melitensis Kit (Antigen Test)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(146, 1, 'Budesonide  Respules 0.25mg/ml, 2ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(147, 1, 'Budesonide, pressurized metered dose Inhaler, 100mcg/metered dose (200 dose)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(148, 1, 'Budesonide, pressurized metered dose Inhaler, 200mcg/metered dose (200 dose)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(149, 1, 'Budesonide+Formoterol 100mcg+6mcg metered dose Inhaler (120 dose)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(150, 1, 'Budesonide+Formoterol 200mcg+6mcg metered dose Inhaler (120 dose)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(151, 4, 'Buffer Tablets Ph 6.8', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(152, 4, 'Buffer Tablets Ph 7.2', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(153, 2, 'Bulb Sucker (100% Silicon)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(154, 1, 'Bupivacaine Hyd In Dextrose Inj - 5Mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(155, 1, 'Bupivacaine. Injection Spinal 0.5% + Glucose 8% (5mg+80mg/Ml), 4ml Ampoule, 5 Pack (Bupivacaine Heavy, Spinal)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(156, 1, 'Calcium Gluconate Injection, 10%, 10Ml Ampoule', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(157, 4, 'Calcium-Arsenazo', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(158, 13, 'Cannulated Screw set 3.5mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(159, 13, 'Cannulated Screw set 6.5mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(160, 1, 'Capecitabine Tablet 150mg ', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(161, 1, 'Capecitabine Tablet, 500mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(162, 4, 'Capillary Tube (Heparinised) 75Ul', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(163, 1, 'Carbamazepine Tablets 200Mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(164, 1, 'Carbamazepine Tablets 200Mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(165, 9, 'Carbaryl 7.5% Wp  Methyl Carbamine', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(166, 1, 'Carbetocin Injection, 100mcg/ml', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(167, 1, 'Carbimazole Tablets -  5mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(168, 1, 'Carboplatin injection, solution for injection, 10mg/ml, 15ml vial (150mg)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(169, 1, 'Carboplatin Injection, solution for injection,10mg/ml, 45ml vial (450mg)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(170, 4, 'Carry Blair Media Powder', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(171, 1, 'Carvedilol Tablets 12.5mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(172, 1, 'Carvedilol Tablets 6.25mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(173, 2, 'Catheter Folley\'s\' 16Fg 30Mls-3 Way', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(174, 2, 'Catheter Folley\'s 18Fg 30Mls-3 Way', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(175, 2, 'Catheter Folley\'s 20Fg 30Mls-3 Way', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(176, 2, 'Catheters Folley\'s 3 - 5Ml - Size - 8 FG 2 Way', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(177, 2, 'Catheters Folley\'s 3 -5Ml - Size - 10 FG 2 Way', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(178, 2, 'Catheters Folley\'s 30Ml - Size - 12 FG 2 Way', 393, 0, 2, 1, '2022-04-01 10:50:52'),
(179, 2, 'Catheters Folley\'s 30Ml - Size - 14 FG 2 Way', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(180, 2, 'Catheters Folley\'S 30Ml - Size - 16 FG', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(181, 2, 'Catheters Folley\'s 30Ml - Size - 20 FG 2 Way', 90, 0, 2, 1, '2022-04-01 10:14:06'),
(182, 2, 'Catheters Folley\'s 30ml - Size - 22FG 3 Way (Siliconised)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(183, 2, 'Catheters Folley\'s 30ml - Size - 24FG 3 Way (Siliconised)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(184, 2, 'Catheters Folley\'s 30Ml - Size 18 FG 2 Way', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(185, 2, 'Catheters Folley\'s 5Ml - Size - 6 FG 2 Way', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(186, 2, 'Catheters Nelaton Fg 12', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(187, 2, 'Catheters Nelaton Fg 16', 360, 0, 2, 1, '2022-04-01 10:20:01'),
(188, 1, 'Cefixime Tablet 400mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(189, 1, 'Ceftazidime Injection, 1g', 200, 0, 4, 1, '2022-04-01 08:36:38'),
(190, 1, 'Ceftriaxone Injection IM/ IV, 250mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(191, 1, 'Ceftriaxone Injection IM/IV, 1g', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(192, 1, 'Celecoxib  Capsules 200mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(193, 1, 'Celecoxib Capsules 200mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(194, 2, 'Cervical Rigid Collar (Large)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(195, 2, 'Cervical Rigid Collar (Medium)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(196, 1, 'Chemoport Huber Needle 20g Length 20mm', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(197, 1, 'Chemoport Huber Needle 22g Length 20mm', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(198, 1, 'Chlorambucil Tablet 2mg Blister', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(199, 5, 'Chlorhexidine acetate dressing 10cm x 10cm', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(200, 1, 'Chlorhexidine Gel 4% (As Digluconate 7.1%) - 10Gm Tube', 3090, 0, 2, 1, '2022-04-01 09:26:01'),
(201, 1, 'Chlorhexidine Gluconate - 5%', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(202, 1, 'Chlorhexidine Gluconate 0.2% Mouth Wash', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(203, 9, 'Chlorine Powder 4gm Satchets', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(204, 9, 'Chlorine Tablets 67mg', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(205, 9, 'Chlorine Tablets 67mg', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(206, 1, 'Chlorpromazine Injection - 50Mg/2Ml', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(207, 1, 'Chlorpromazine Tablets 100Mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(208, 1, 'Cholera Vaccine 2ml (Shanchol)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(209, 11, 'CHVS Backpack Carrier Bag', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(210, 11, 'CHVS First Aid Kit', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(211, 11, 'CHVS Jacket Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(212, 11, 'CHVS Jacket Medium', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(213, 11, 'CHVS Weighing Scale (Hanging Type)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(214, 1, 'Ciprofloxacin 0.3% + Dexamethasone 0.1% Eye Drops', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(215, 1, 'Ciprofloxacin 500mg Tablets', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(216, 1, 'Ciprofloxacin Eye Drops 0.3%', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(217, 1, 'Ciprofloxacin Solution For IV Infusion 2Mg/Ml (As Lactate)', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(218, 1, 'Cisplatin Injection, solution? for injection 1mg/ml, 50ml vial, (50mg)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(219, 5, 'Citro Plus 21%  (Citric acid,Lactic acid,Malic acid) ( Citrosterile GBL)', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(220, 1, 'Clarithromycin Tablets 500mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(221, 4, 'Clean Nozzle', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(222, 1, 'Clindamycin Capsules 150mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(223, 1, 'Clindamycin Injection 150mg/ml, 2ml Ampoule', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(224, 4, 'Clinical Chemical Calibration Serum', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(225, 4, 'Clinical Chemical Quality Control Serum Level 1', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(226, 4, 'Clinical Chemical Quality Control Serum Level 2', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(227, 8, 'Clinical Wire 0.4Mm Roll', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(228, 1, 'Clomiphene Citrate Tablets 50mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(229, 1, 'Clopidogrel Tablet, 75mg (as hydrogen sulfate)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(230, 1, 'Clotrimazole Cream - 1%', 980, 0, 2, 1, '2022-04-01 09:48:07'),
(231, 1, 'Clotrimazole Vaginal Pessaries 500Mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(232, 2, 'Colostomy Bag, 250Mm X 140Mm, Adult', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(233, 2, 'Colostomy Bag, Paediatric 150Mm X 150Mm', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(234, 2, 'Colostomy Bag, Size 180mm x 150mm, Paediatric', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(235, 2, 'Colostomy Bag, Size 280Mm X 160Mm, Adult', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(236, 2, 'Condom Catheters/ Uridoms Large', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(237, 2, 'Condom Catheters/ Uridoms Medium', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(238, 2, 'Condom Catheters/ Uridoms Small', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(239, 1, 'Co-Pack Of 4 Satchets Of Low Osmolarity Ors (500Ml Formulation) + 10 Tablets Of Dispersible Zinc Sulphate Tablets 20Mg', 3287, 0, 2, 1, '2022-04-01 09:57:48'),
(240, 2, 'Cord Clamp (Umbilical)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(241, 6, 'Cot Blankets 90 X 130Cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(242, 1, 'Co-Trimoxazole Suspension - 240Mg/5Ml', 30573, 0, 2, 1, '2022-04-01 09:37:57'),
(243, 1, 'Co-Trimoxazole Tablet, 480mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(244, 2, 'Cotton Gauze Plain L/Wvn Absorb-91Cmx91M 1500G Bp', 2000, 0, 2, 1, '2022-04-01 08:28:51'),
(245, 2, 'Cotton Gauze X-Ray Detectable L/Wvn Absorb-36X100 Yds 1500G Bp', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(246, 6, 'Cotton Material Green For Theatre Use, 36\'\' X 40M', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(247, 2, 'Cotton Wool Absorb White - 400 Gms Bp', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(248, 4, 'Cover Slips', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(249, 12, 'Coverall X-Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(250, 4, 'Crag (Cryptococcal Antigen Test), Cassette', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(251, 4, 'Crag (Cryptococcal Antigen Test), Strips', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(252, 4, 'Creatinine', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(253, 2, 'Crescent Knives', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(254, 4, 'Crystall Violet Powder', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(255, 4, 'Cs-Alkaline Detergent', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(256, 4, 'Cs-Anti-Bacterial Phosphor-Free Detergent', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(257, 1, 'Cyclophosphamide Injection, powder for reconstitution, 1g', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(258, 1, 'Cyclophosphamide Injection, Powder For Reconstitution, 200mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(259, 1, 'Cyclophosphamide Injection, powder for reconstitution, 500mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(260, 1, 'Cyclosporin Capsule 100mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(261, 1, 'Cyclosporin Capsule 25mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(262, 1, 'Cytarabine Injection, Powder For Reconstitution, 100mg Or Solution for Injection (Preservative Free 100mg/Ml)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(263, 1, 'Dacarbazine injection, lyophilized powder for reconstitution, 200mg (as citrate)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(264, 1, 'Dactinomycin Injection, Powder for Reconstitution, 500 MicroGrams Vial ', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(265, 1, 'Daunorubicin Injection, powder for Reconstitution, 20mg (as Hcl)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(266, 13, 'DCP 3.5 St. Steel. Holes 10, length 122mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(267, 13, 'DCP 3.5 St. Steel. Holes 5, length 62mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(268, 13, 'DCP 3.5 St. Steel. Holes 6, length 74mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(269, 13, 'DCP 3.5 St. Steel. Holes 7, length 86mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(270, 13, 'DCP 3.5 St. Steel. Holes9, length 110mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(271, 13, 'DCP 4.5, Broad, 12holes length 199mm,st.steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(272, 13, 'DCP 4.5, Broad, 14holes length 231mm,st.steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(273, 13, 'DCP 4.5, Broad, 16holes length 231mm,st.steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(274, 13, 'DCP 4.5, Broad, 8holes length 135mm,st.steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(275, 13, 'DCP 4.5, Broad, 9holes length 151mm,st.steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(276, 13, 'DCP 4.5, Narrow, 6holes length 103mm,st.steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(277, 13, 'DCP 4.5, Narrow, 7holes length 119mm,st.steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(278, 13, 'DCP 4.5, Narrow, 8holes length 135mm,st.steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(279, 1, 'Deferasirox Tablet, 100mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(280, 2, 'Delivery Set With Green Towels (Drapes)', 3, 0, 2, 1, '2022-04-01 10:53:59'),
(281, 8, 'Dental Needles 27G, Long', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(282, 8, 'Dental Needles 27G, Short', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(283, 1, 'Dexamethasone + Neomycin Eye Drops 0.1% /0.5%', 0, 2, 4, 1, '0000-00-00 00:00:00'),
(284, 1, 'Dexamethasone 0.1% + Gentamicin 0.3% Eye Drops', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(285, 1, 'Dexamethasone Eye Drops 0.1%, 5Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(286, 1, 'Dexamethasone Injection - 4Mg/Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(287, 1, 'Dexamethasone Tablets, 0.5mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(288, 1, 'Dextrose - 10% With Euro Cap/ Collapsible Bag', 4500, 0, 3, 1, '2022-04-01 08:38:49'),
(289, 1, 'Dextrose - 5% Euro Cap Bottle', 180, 0, 2, 1, '2022-04-01 10:01:56'),
(290, 1, 'Dextrose - 5% Nipple Head Bottle', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(291, 13, ' DHS/DCS basic instrument set ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(292, 13, ' DHS/DCS Lag screws, 12.5mm St. steel, length 100mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(293, 13, ' DHS/DCS Lag screws, 12.5mm St. steel, length 105mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(294, 13, ' DHS/DCS Lag screws, 12.5mm St. steel, length 110mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(295, 13, ' DHS/DCS Lag screws, 12.5mm St. steel, length 50mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(296, 13, ' DHS/DCS Lag screws, 12.5mm St. steel, length 60mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(297, 13, ' DHS/DCS Lag screws, 12.5mm St. steel, length 70mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(298, 13, ' DHS/DCS Lag screws, 12.5mm St. steel, length 75mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(299, 13, ' DHS/DCS Lag screws, 12.5mm St. steel, length 80mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(300, 13, ' DHS/DCS Lag screws, 12.5mm St. steel, length 85mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(301, 13, ' DHS/DCS Lag screws, 12.5mm St. steel, length 90mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(302, 13, ' DHS/DCS Lag screws, 12.5mm St. steel, length 95mm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(303, 5, 'Dialyzer High Flux Surface Area 1.9m2 (Bellco)', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(304, 5, 'Dialyzer High Flux Surface Area 2.0m2 (Bellco)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(305, 5, 'Dialyzer Surface area 1.7m2 (Nipro)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(306, 5, 'Dialyzer Surface area 1.8m2 (Fresenius)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(307, 5, 'Dialyzer Surface area 1.9m2 (Nipro)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(308, 2, 'Diapers (Extra Large) Adult', 54, 0, 3, 1, '2022-04-01 10:18:04'),
(309, 2, 'Diapers (Large) Adult', 32, 0, 3, 1, '2022-04-01 10:16:37'),
(310, 2, 'Diapers (Medium) Adult', 16, 0, 3, 1, '2022-04-01 10:27:58'),
(311, 1, 'Diazepam Injection 5mg/ml, 2ml Ampoule', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(312, 1, 'Diazepam Tablet 5mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(313, 10, 'Digital Foetal Doppler', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(314, 1, 'Digoxin Elixir/Oral Solution - 50Mcg/Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(315, 1, 'Digoxin Tablets - 250mcg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(316, 1, 'Dihydrocodeine Tartrate Tab 30mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(317, 1, 'Diloxanide Furoate Tab 500mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(318, 4, 'Direct Bilirubin', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(319, 2, 'Dispensing envelope, Plastic, Resealable (1x1000)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(320, 2, 'Dispensing Envelopes (Khaki)', 1200, 0, 2, 1, '2022-04-01 08:10:20'),
(321, 2, 'Dispensing Label Self-Adhesive x 200Pc', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(322, 2, 'Disposable Cusco Vaginal Speculum Large, Medium, Small', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(323, 6, 'Disposable Surgical Gown - Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(324, 6, 'Disposable Surgical Gown - Medium', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(325, 6, 'Disposable Surgical Gown - X-Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(326, 1, 'Divalproex Sodium tablet 500mg ', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(327, 1, 'Docetaxel Injection, solution for injection with solvent, 80mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(328, 1, 'Domperidone 10Mg Tablets', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(329, 1, 'Domperidone Img/ml Syrup', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(330, 1, 'Dopamine Injection 40mg/ml, 5ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(331, 2, 'Double J Stent With Guide Wire/Stent Positioner 18 X 3fr', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(332, 2, 'Double J Stent With Guide Wire/Stent Positioner 20 X 4fr', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(333, 2, 'Double J Stent With Guide Wire/Stent Positioner 26 X 4.7fr', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(334, 2, 'Double J Stent With Guide Wire/Stent Positioner 26 X 6fr', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(335, 1, 'Doxorubicin Injection, Lyophilised powder for reconstitution, 50mg (hydrochloride) OR solution for injection', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(336, 1, 'Doxycycline Capsules 100mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(337, 1, 'Doxycycline Capsules 100mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(338, 6, 'Draw Sheets, 66\'\' X 36', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(339, 2, 'Dressing, Iv Cannula, Adhesive-Sz 7Cm X 8.5Cm', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(340, 13, 'Drill Bit dia. 2.5mm, length 100/75mm, mini QCK Coupling', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(341, 13, 'Drill Bit dia. 3.2mm, length 240/215mm, mini QCK Coupling', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(342, 13, 'Drill Bit dia. 3.5mm, length 120/185,3 flute QCK Coupling', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(343, 13, 'Drill Bit dia. 4.5mm, length 145/120mm, 3 flute QCK Coupling', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(344, 13, 'Drill Bit dia.3.5mm, length 100/85mm,3 flute QCK Coupling', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(345, 13, 'Drill Bit dia3.5mm, length 145/120mm,3 flute QCK Coupling', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(346, 10, 'Drip Stand (Infusion)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(347, 7, 'Drystar DT5 B Films 20 x 25cm (AGFA)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(348, 7, 'Drystar DT5 B Films 25 x 30cm (AGFA)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(349, 7, 'Drystar Dt5 B Films For Direct Digital Thermal Printing For Use In Computerised Tomography (Ct) In Medical Imaging Size 35 X 43 Cm. (AGFA)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(350, 7, 'Dryview DVE Laser Imaging Film {20 x 25cm (8 x 10 Inch)} Carestream', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(351, 7, 'Dryview DVE Laser Imaging Film {25 x 30cm (10 x12 Inch)} Carestream', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(352, 7, 'Dryview DVE Laser Imaging Film {28 x 35cm (11 x 14 Inch)} Carestream', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(353, 7, 'Dryview DVE Laser Imaging Film {35 x 43cm (14 x 17 Inch)} Carestream', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(354, 7, 'Dryview DVM Mammography Laser Imaging Film  {20 x 25cm (8 x 10 Inch)} Carestream', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(355, 4, 'EDTA-K Blood Collection Tubes (Purple) 4Mls', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(356, 1, 'Enalapril Tablets - 5mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(357, 8, 'Endodontic Files Size Range 15 ? 40 (Dental)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(358, 8, 'Endodontic Reamers Sizes 15-40 (21Mm 25Mm 28Mm)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(359, 8, 'Endodontic Reamers Sizes 45-80 (21mm 25mm 28mm)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(360, 2, 'Endotracheal Cuffed Tube - Size 5.5', 370, 0, 4, 1, '2022-04-01 10:22:05'),
(361, 2, 'Endotracheal Cuffed Tube - Size 6.5', 94, 0, 4, 1, '2022-04-01 10:26:24'),
(362, 2, 'Endotracheal Cuffed Tube - Size 7.0', 492, 0, 4, 1, '2022-04-01 11:14:06'),
(363, 2, 'Endotracheal Cuffed Tube - Size 7.5', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(364, 2, 'Endotracheal Cuffed Tube - Size 8.0', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(365, 2, 'Endotracheal Tube Cuffed Size 3.5mm', 94, 0, 4, 1, '2022-04-01 10:07:04'),
(366, 2, 'Endotracheal Tube Cuffed Size 4.5mm', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(367, 2, 'Endotracheal Tube Size 5.0 Cuffed', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(368, 2, 'Endotracheal Tube Uncuffed - Size 2.5mm', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(369, 2, 'Endotracheal Tube Uncuffed - Size 3.0mm', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(370, 2, 'Endotracheal Tube Uncuffed - Size 3.5mm', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(371, 2, 'Endotracheal Tube Uncuffed - Size 4.5mm', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(372, 1, 'Enoxaparin injection (prefilled syringe) 80mg/0.8ml (Clexane)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(373, 1, 'Enoxaparin Sodium 40mg/0.4ml Injection (Clexane)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(374, 1, 'Enzymatic Detergent', 4, 0, 3, 1, '2022-04-01 10:08:58'),
(375, 1, 'Ephedrine Hcl Inj. 30mg/Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(376, 5, 'Erythropoetin 2000 I.U/0.5ml Injection ? (Generic)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(377, 1, 'Escitalopram Tablet 10mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(378, 4, 'ESR Tube With Stand', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(379, 1, 'Ethanol (Denatured) - 70%', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(380, 10, 'Examination Couch', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(381, 10, 'Examination Lamp', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(382, 13, 'External fixator instruments set', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(383, 2, 'Eye Pad, Size (1 5/8)? X (2 5/8)?', 90, 0, 0, 1, '2022-04-01 11:06:25'),
(384, 9, 'Face shield', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(385, 1, 'Febuxostat Tablets 40mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(386, 2, 'Feeding Tubes - Size 10 Fg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(387, 2, 'Feeding Tubes - Size 12 FG', 38, 0, 4, 1, '2022-04-01 10:04:23'),
(388, 2, 'Feeding Tubes - Size 16 FG', 86, 0, 4, 1, '2022-04-01 09:32:14'),
(389, 2, 'Feeding Tubes - Size 18 FG', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(390, 2, 'Feeding Tubes - Size 20 FG', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(391, 2, 'Feeding Tubes - Size 22 FG', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(392, 2, 'Feeding Tubes - Size 4 FG', 62, 0, 4, 1, '2022-04-01 09:17:35'),
(393, 2, 'Feeding Tubes - Size 6 FG', 31, 0, 4, 1, '2022-04-01 10:31:25'),
(394, 2, 'Feeding Tubes - Size 8 FG', 15, 0, 4, 1, '2022-04-01 10:26:54'),
(395, 2, 'Feeding Tubes - Size14 Fg', 40, 0, 4, 1, '2022-04-01 10:08:20'),
(396, 1, 'Fentanyl Citrate 50mcg/ml, 2ml ampoule', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(397, 1, 'Fentanyl Patch 50 micrograms in a patch', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(398, 1, 'Ferrous Sulph./Folic Acid Tablets 200mg/400mcg Blister Pack', 4135, 0, 2, 1, '2022-04-01 10:03:44'),
(399, 1, 'Ferrous Sulphate Tablets - 200Mg', 79, 0, 2, 1, '2022-04-01 10:40:21'),
(400, 1, 'Filgrastim Injection, prefilled syringe for Injection (300 micrograms) / 0.5 ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(401, 1, 'Finasteride tablets 5mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(402, 5, 'Flexya Cassette (Flexya machine)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(403, 1, 'Flucloxacillin 125mg/5ml Suspension, 100ml bottle', 10000, 0, 2, 1, '2022-04-01 08:40:09'),
(404, 1, 'Flucloxacillin Capsules 250Mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(405, 1, 'Flucloxacillin Capsules 250Mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(406, 1, 'Flucloxacillin Inj 500mg (PFI)', 990, 0, 3, 1, '2022-04-01 10:19:30'),
(407, 1, 'Flucloxacillin Injection - 250Mg', 3235, 0, 3, 1, '2022-04-01 10:12:30'),
(408, 1, 'Fluconazole Capsules - 200Mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(409, 1, 'Fluconazole IV 2mg/ml, 100ml bottle', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(410, 1, 'Fluconazole Suspension - 50Mg/5Ml', 237, 0, 2, 1, '2022-04-01 10:49:06'),
(411, 1, 'Fluorometholone Eye Drops  0.1%, W/V 5ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(412, 1, 'Fluorouracil Injection, Solution For Injection, 50 Mg/Ml,5ml Vial (250mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(413, 1, 'Fluoxetine Capsules - 20Mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(414, 1, 'Flupenthixol Decanoate - 20Mg/Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(415, 1, 'Fluphenazine Injection - 25Mg/Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(416, 1, 'Fluticasone,Nasal spray, 27.5mcg spray, 120 doses, pack size  Can', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(417, 1, 'Folic Acid Tablets 5mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(418, 1, 'Folinic Acid Injection 10mg/ml, Solution or Powder For Reconstitution, 5ml Vial ( 50mg As Calcium Folinate)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(419, 1, 'Folinic Acid Tablet, 15mg (As Calcium Folinate)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(420, 10, 'Food Trolley', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(421, 1, 'Formaldehyde ?(Formalin) 40% Solution', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(422, 4, 'Fuji analyser thermal roll', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(423, 4, 'Fuji Dri chem Electrolyte control QE', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(424, 4, 'Fuji Dri chem mixing cups', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(425, 4, 'Fuji Dri Chem Plain tube 0.5ml ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(426, 4, 'Fuji Dri chem slide CAPIIIS 24\'s', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(427, 4, 'Fuji Dri chem slide IPPSIIIS 24\'s', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(428, 4, 'Fuji Dri chem slide MGPIIIS 24\'s', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(429, 1, 'Furosemide Injection - 20Mg/2Ml', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(430, 1, 'Furosemide Tablets 40Mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(431, 4, 'Fuschin Basic', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(432, 1, 'Gabapentin Cap 300Mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(433, 2, 'Gauze Compress Swabs 8 Ply 10cm X 10cm, Sterile', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(434, 2, 'Gauze Swabs Dressing 12 Ply 10Cm X 10Cm, Sterile', 39, 0, 3, 1, '2022-04-01 09:52:46'),
(435, 1, 'Gemcitabine  Injection, Pfr, 1g Vial', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(436, 1, 'Gemcitabine Injection, Pfr, 200mg Vial', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(437, 4, 'Genexpert Catridges, pack of 50s', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(438, 1, 'Gentamicin Injection - 20Mg- 10Mg/Ml 2Ml Amp', 1250, 0, 2, 1, '2022-04-01 10:06:04'),
(439, 1, 'Gentamicin Injection - 80Mg- 40Mg/Ml 2Ml Amp', 6200, 0, 2, 1, '2022-04-01 09:47:22'),
(440, 1, 'Gentamycin Sulphate Eye/Ear Solution 0.3% 10ml', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(441, 1, 'Gentamycin Sulphate Injection, 20Mg/2Ml, 25 Pack (Paediatric)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(442, 1, 'Gentamycin Sulphate Solution  (Eye / Ear Drops)  0.3 % W/V', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(443, 4, 'Giemsa Stain', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(444, 2, 'Gloves  Surgeon, Size 7.5  Sterile (Powder Free)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(445, 2, 'Gloves Gynaecological Size 7.5\'\' Sterile', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(446, 2, 'Gloves Gynaecological Size 7.5\'\' Sterile', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(447, 2, 'Gloves Latex Examination Disposable Medium', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(448, 2, 'Gloves Surgeon - Size 7.0 Sterile', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(449, 2, 'Gloves Surgeon - Size 7.5 Sterile', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(450, 2, 'Gloves Surgeon - Size 8.0 Sterile', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(451, 12, 'Gloves Surgical Powdered Size 7.0 Sterile Cov', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(452, 1, 'Glucosamine 500Mg +Chondrointin 400Mg Capsules', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(453, 4, 'Glucose - Oxidase', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(454, 1, 'Glucose Injection 50% 50Ml (Dextrose) With Euro Cap/ Collapsible Bag', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(455, 4, 'Glucose Test Strips (Bionime).  One meter issued free of charge with every purchase of 10 packs of strips', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(456, 4, 'Glucose Test Strips (i-Sens).  One meter issued free of charge with every purchase of 10 packs of strips', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(457, 1, 'Glutaraldehyde 2% Solution', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(458, 4, 'Glycerol', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(459, 4, 'Glycohemoglobin (Hba1c) Calibrators', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(460, 4, 'Glycohemoglobin A1c', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(461, 1, 'Glycopyrronium Injection, Solution for Injection 200mcg/ml (As Bromide), 1ml Ampoule', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(462, 1, 'Goserelin Implant (In Syringe Applicator) 10.8 Mg (As Acetate) In A Prefilled Syringe', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(463, 1, 'Goserelin Injection, as Implant (in Syringe Applicator) 3.6mg (As Acetate) in a Prefilled Syringe', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(464, 1, 'Granisetron Hcl Injection 1mg/Ml-3ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(465, 1, 'Griseofulvin Tab 500mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(466, 1, 'Griseofulvin Tablets 125Mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(467, 6, 'Gumboots Size 10 (Black)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(468, 6, 'Gumboots Size 11 (Black)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(469, 6, 'Gumboots Size 7 (Black)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(470, 6, 'Gumboots Size 8 (Black)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(471, 6, 'Gumboots Size 9 (Black)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(472, 5, 'Haemodialysis Tubing (Blood Line) Universal With Bag, Percutor Art. & Ven. With Filter, Transducer, Infusion & Recirculator - Adult (Bellco)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(473, 4, 'Haemoglobinometer (HB Meter) - Diaspect', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(474, 4, 'Haemoglobinometer Cuvettes', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(475, 4, 'Halogen Lamp', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(476, 1, 'Haloperidol 5mg Tablet', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(477, 1, 'Haloperidol Decanoate Depot - 50Mg/Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(478, 1, 'Halothane Inhalation', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(479, 4, 'HBA1C (Glycated Haemoglobin) Cuvettes - SD Biosensor', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(480, 4, 'HBA1C (Glycated Haemoglobin) Test Analyzer - SD Biosensor', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(481, 4, 'HDL/LDL Calibrator', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(482, 2, 'Heat Moisture Exchange Bacterial/Viral Filter - Adult', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(483, 2, 'Heat Moisture Exchange Bacterial/Viral Filter - Paediatric', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(484, 4, 'Helicobacter Pylori Rapid Kit (Antigen)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(485, 10, 'Hemafuse-Auto Transfusion Device (Complete unit with Accessories)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(486, 5, 'Hemodialysis Blood Lines With Drainage Bag, Percutor Arterial And Venous Line With A Filter, Transducer, Infusion Set and Recirculator', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(487, 5, 'Hemodialysis blood lines with drainage bag, percutor arterial and venous line with a filter,transducer, infusion set & recirculator (Nipro)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(488, 4, 'Hemolyzer 3NG', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(489, 4, 'Hemolyzer 5NG (Closed mode)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(490, 4, 'Hemolyzer 5NG (Open mode)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(491, 4, 'Hemolyzer Hypocleaner', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(492, 5, 'Heparin injection 5000 iu/ ml  (Rotex Medica)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(493, 1, 'Heparine Injection - 5000Units/Ml 1Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(494, 1, 'Heparine Injection - 5000Units/Ml 5Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(495, 4, 'Hepatitis B (Hbsag) Test Strips', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(496, 1, 'Hepatitis B Vaccine (Adult) 20mcg/ml, 1ml vial (Generic)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(497, 4, 'High Density Lipoprotein- Cholesterol', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(498, 4, 'High Vaginal Swabs (Sterile)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(499, 1, 'Hydralazine Injection - 20Mg/5Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(500, 1, 'Hydralazine Tablets 25mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(501, 1, 'Hydrochlorothiazide Tablets 25mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(502, 1, 'Hydrochlorthiazide Tablets 50mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(503, 1, 'Hydrocortisone Injection - 100Mg', 20000, 0, 2, 1, '2022-04-01 08:20:29'),
(504, 1, 'Hydrocortisone Ointment - 1%', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(505, 1, 'Hydroxycarbamide (Hydroxyurea) Capsule, 500mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(506, 1, 'Hydroxychloroquin Tablets 200mg (as sulfate)', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(507, 1, 'Hydroxyethyl Starch Solution for IV Infusion, 6% in 0.9% Sodium Chloride, 500ml. Plasma Expander (Voluven)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(508, 1, 'Hyoscine Butyl Bromide Injection 20Mg/Ml', 10000, 0, 2, 1, '2022-04-01 08:34:16'),
(509, 1, 'Hyoscine Butylbromide Tablets 10Mg (F/C)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(510, 2, 'I.V. Cannulaes - 16G', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(511, 2, 'I.V. Cannulaes - 18G', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(512, 2, 'I.V. Cannulaes - 20G', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(513, 2, 'I.V. Cannulaes - 22G', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(514, 2, 'I.V. Cannulaes - 24G', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(515, 2, 'I.V. Cannulaes - 26G', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(516, 1, 'Ibuprofen Syrup 100Mg/5Ml 60Ml', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(517, 1, 'Ibuprofen Tablets - 200Mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(518, 2, 'Identification  Band - Adult', 45, 0, 2, 1, '2022-04-01 10:55:02'),
(519, 2, 'Identification Band - Baby', 3900, 0, 2, 1, '2022-04-01 10:22:42'),
(520, 2, 'Identification Band - Baby', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(521, 1, 'Ifosfamide With Mesna Injection, Ifosfamide 1gm Powder for Reconstitution/Mesna 600mg Solution for Injection in Combination Pack', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(522, 1, 'Ifosfamide With Mesna Injection, Ifosfamide 2gm Powder for Reconstitution/Mesna 1200mg Soluton for Injection in Combination Pack', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(523, 13, 'IM universal Femur Nails instrument set', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(524, 13, 'IM Universal Tibia Nails instrument set ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(525, 2, 'Implant Insertion Set With Green Towels (Drapes)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(526, 2, 'Implant Removal Set with Green Towels (Drapes)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(527, 4, 'Indian Ink (Nigrosin)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(528, 2, 'Infusion Giving Sets With Air Inlet', 1038, 0, 2, 1, '2022-04-01 10:45:28'),
(529, 1, 'Inhalation Spacer (for 2 Years and above)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(530, 1, 'Inhalation Spacer with baby mask (for 6months - 2 Years)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(531, 1, 'Insulin Biphasic 30/70 - 100Iu/Ml', 134, 0, 3, 1, '2022-04-01 11:20:43'),
(532, 1, 'Insulin Pen Needles 30Gx8Mm', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(533, 1, 'Insulin Soluble - 100Iu/Ml', 39, 0, 3, 1, '2022-04-01 11:21:35'),
(534, 1, 'Insulin Syringes (100) 1ml with Needle G31 X 6mm', 87, 0, 3, 1, '2022-04-01 09:38:34'),
(535, 2, 'Intercostal Drainage Tube With Trocar Size 28Fg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(536, 2, 'Intercostal Drainage Tube With Trocar Size Size 16Fg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(537, 2, 'Intercostal Drainage Tube With Trocar Size Size 30Fg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(538, 2, 'Intercostal Drainage Tubes - Size 28 Fg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(539, 2, 'Intercostal Drainage Tubes - Size 32 Fg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(540, 2, 'Intercostal Drainage Tubes With Trocar- Size 24 Fg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(541, 13, 'Interlocking I. M femur nail, stainless steel, length 36cm,diameter 10mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(542, 13, 'Interlocking I. M femur nail, stainless steel, length 36cm,diameter 8mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(543, 13, 'Interlocking I. M femur nail, stainless steel, length 38cm,diameter 10mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(544, 13, 'Interlocking I. M femur nail, stainless steel, length 40cm,diameter 10mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(545, 13, 'Interlocking I. M femur nail, stainless steel, length 42cm,diameter 10mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(546, 13, 'Interlocking I. M femur nail, stainless steel, length 42cm,diameter 11mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(547, 13, 'Interlocking I. M femur nail, stainless steel, length 42cm,diameter 12mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(548, 13, 'Interlocking I. M femur nail, stainless steel, size 11mm ? 36cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(549, 13, 'Interlocking I. M femur nail, stainless steel, size 11mm ? 38cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(550, 13, 'Interlocking I. M femur nail, stainless steel, size 11mm ? 40cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(551, 13, 'Interlocking I. M tibial nail, stainless steel, size 10mm ? 34cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(552, 13, 'Interlocking I. M tibial nail, stainless steel, size 10mm ? 36cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(553, 13, 'Interlocking I. M tibial nail, stainless steel, size 11mm ? 34cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(554, 13, 'Interlocking I. M tibial nail, stainless steel, size 11mm ? 36cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(555, 13, 'Interlocking I. M tibial nail, stainless steel, size 12mm ? 36cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(556, 13, 'Interlocking I. M tibial nail, stainless steel, size 9mm ? 34cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(557, 13, 'Interlocking I. M tibial nail, stainless steel, size 9mm ? 36cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(558, 2, 'Intraocular Lenses 23 Diopters, Posterior', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(559, 2, 'Intraocular Lenses--+21D, Posterior', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(560, 2, 'Intraocular Lenses--+22D, Posterior', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(561, 1, 'Irinotecan Injection, Solution For Injection, 20 Mg/Ml, 2 Ml Vial (40mg)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(562, 5, 'Iron sucrose 20mg/ml Injection  5ml (Venofar)', 10, 1, 4, 1, '2022-04-01 11:07:07'),
(563, 1, 'Isoflurane Liquid For Inhalation', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(564, 1, 'Itraconazole Capsules 100mg 4/Pk', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(565, 13, 'K- Wire dia 1.6mm, length 280 + 20mm,trocar tip St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(566, 13, 'K- Wire dia 1.7mm, length 150+ 10mm, trocar tip St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(567, 13, 'K- Wire dia 2.5mm, length 280 + 20mm,trocar tip St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(568, 10, 'Kepi Cool Box 1.7L', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(569, 2, 'Keratome Knives', 0, 0, 4, 1, '0000-00-00 00:00:00');
INSERT INTO `drugs` (`id`, `category`, `name`, `currentStock`, `tracer`, `istatus`, `registered_by`, `date`) VALUES
(570, 1, 'Ketamine Injection - 50Mg/Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(571, 1, 'Ketorolac Solution, Eye Drops, 0.5% (As Tromethamine)', 0, 2, 4, 1, '0000-00-00 00:00:00'),
(572, 12, 'KN95 Respirator Mask (COV)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(573, 13, 'K-Wire dia 1.5mm, length 150 + 10mm, trocar tip St.  steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(574, 13, 'K-Wire dia 1.5mm, length 280 + 20mm trocar tip St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(575, 13, 'K-Wire dia 1.6mm, length 150 + 10mm trocar tip St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(576, 13, 'K-Wire dia 1.7mm, length 280+20mm, trocar tip St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(577, 13, 'K-Wire dia 1.8mm, length 150+10mm, trocar tip St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(578, 13, 'K-Wire dia 1.8mm, length 280+20mm, trocar tip St.  steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(579, 13, 'K-Wire dia 2.2mm, length 280 + 20mm trocar tip St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(580, 13, 'K-Wire dia 2.5mm, length 150 + 10mm trocar tip St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(581, 13, 'L- Buttress plate 4.5, 4 holes, length 85mm,  St. steel Right', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(582, 1, 'Labetalol Injection 100mg, (5mg/ml), 20ml, Vial', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(583, 1, 'Lactulose Solution 3.4Mg/Ml,200Ml', 569, 0, 4, 1, '2022-04-01 10:33:47'),
(584, 9, 'Lambda Cyhalothrine (10cs) 62.5gm Satchets', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(585, 1, 'Lamotrigine Tablets 25mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(586, 1, 'Lansoprazole Dispersible Tablet 15Mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(587, 2, 'Laparatomy Sets With Green Towels (Drapes)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(588, 13, 'Large fragment instruments set', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(589, 1, 'L-Asparaginase Injection (PFI) 10,000IU', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(590, 13, 'Lateral Tibial head Buttress plates 4.5 for LEFT leg. St. steel 5  holes  length 117mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(591, 13, 'Lateral Tibial head Buttress plates 4.5 for LEFT leg. St. steel 7 holes  length 149mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(592, 13, 'Lateral Tibial head Buttress plates 4.5 for LEFT leg. St. steel 9 holes 9length 181mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(593, 13, 'Lateral Tibial head Buttress plates 4.5 for LEFT leg. St. steel holes 11 length 213mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(594, 13, 'Lateral Tibial head Buttress plates 4.5 for right leg. St. steel  5 holes  length 117mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(595, 13, 'Lateral Tibial head Buttress plates 4.5 for right leg. St. steel 11 holes  length 213mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(596, 13, 'Lateral Tibial head Buttress plates 4.5 for right leg. St. steel 7 holes  length 149mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(597, 13, 'Lateral Tibial head Buttress plates 4.5 for right leg. St. steel 9 holes length 181mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(598, 1, 'Leflunomide Tablet 20mg, Film Coated', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(599, 4, 'Leishman Stain (Powder)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(600, 1, 'Lenalidomide Capsule 25mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(601, 1, 'Lenalidomide Capsule 5mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(602, 4, 'Lens Cleaning Tissue', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(603, 1, 'Letrozole Tablet, 2.5mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(604, 1, 'Levetiracetam Injection,100mg/ml, 5ml vial', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(605, 1, 'Levofloxacin 500Mg Tablets', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(606, 1, 'Levothyroxine Sodium 100Mcg Tab', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(607, 8, 'Light Cure Composite Materials (Kit)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(608, 8, 'Lignocaine 2% Dental Cart With Adrenaline-1:80 000', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(609, 1, 'Lignocaine Hydrochloride Inj. 1%', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(610, 1, 'Lignocaine Hydrochloride Injection - 2%', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(611, 1, 'Linezolid Injection 2mg/Ml-300ml Bottle', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(612, 1, 'Linezolid Tablets 600mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(613, 1, 'Lisinopril Tablets 5mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(614, 1, 'Lisinopril Tablets 5mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(615, 13, 'Locking screws for I.M Femur nail diameter,4.9mm, stainless steel, length 30mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(616, 13, 'Locking screws for I.M Femur nail diameter,4.9mm, stainless steel, length 35mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(617, 13, 'Locking screws for I.M Femur nail diameter,4.9mm, stainless steel, length 40mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(618, 13, 'Locking screws for I.M Femur nail diameter,4.9mm, stainless steel, length 45mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(619, 13, 'Locking screws for I.M Femur nail diameter,4.9mm, stainless steel, length 50mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(620, 13, 'Locking screws for I.M Femur nail diameter,4.9mm, stainless steel, length 55mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(621, 13, 'Locking screws for I.M Femur nail diameter,4.9mm, stainless steel, length 60mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(622, 13, 'Locking screws for I.M tibial nail diameter,4.9mm, length 25mm stainless steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(623, 13, 'Locking screws for I.M tibial nail diameter,4.9mm, length 30mm, stainless steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(624, 13, 'Locking screws for I.M tibial nail diameter,4.9mm, length 35mm,stainless steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(625, 13, 'Locking screws for I.M tibial nail diameter,4.9mm, length 40mm, stainless steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(626, 13, 'Locking screws for I.M tibial nail diameter,4.9mm, length 45mm, stainless steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(627, 13, 'Locking screws for I.M tibial nail diameter,4.9mm, length 50mm, stainless steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(628, 13, 'Locking screws for I.M tibial nail diameter,4.9mm, length 55mm, stainless steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(629, 1, 'Loperamide Capsules - 2Mg', 111, 0, 2, 1, '2022-04-01 10:04:58'),
(630, 1, 'Loratidine Tablet, 10mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(631, 1, 'Losartan Pottasium 50Mg +Hydrochlothiazide 12.5 Mg Tablets', 12690, 0, 3, 1, '2022-04-01 10:16:01'),
(632, 1, 'Losatan 50Mg Tablets', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(633, 4, 'Low Density Lipoprotein- Cholesterol', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(634, 4, 'Magnesium', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(635, 1, 'Magnesium Sulphate Injection - 50%', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(636, 1, 'Mannitol 20% W/V Infusion 500Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(637, 2, 'Manual Vacuum  Aspiration Set', 1, 0, 2, 1, '2022-04-01 10:54:28'),
(638, 2, 'Mask, Anaesthetic - Adult Sizes 3, 4 & 5', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(639, 2, 'Mask, Anaesthetic - Child Sizes 1 & 2', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(640, 2, 'Maternity Pads (Towels)', 228, 0, 2, 1, '2022-04-01 09:15:50'),
(641, 6, 'Mattress for Standard Hospital Bed', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(642, 2, 'Measuring Spoon Double Sided (2.5/5Ml)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(643, 2, 'Medical Supplies Register', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(644, 2, 'Medicines Register', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(645, 4, 'Medionic Cleaning kit', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(646, 4, 'Medionic Microcapillaries ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(647, 4, 'Medonic Diluent ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(648, 4, 'Medonic Lyse ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(649, 1, 'Meningococcal (Group A,C,Y And W-135) Polysaccharide Diphtheria Toxoid Conjugate Vaccines 0.5ml  Liqiud For Intramuscular Injection (Menactra)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(650, 1, 'Mercaptopurine Tablet  50mg (Scored)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(651, 1, 'Meropenem Injection 1gm Vial', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(652, 1, 'Meropenem Injection PFR 500mg ', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(653, 1, 'Mesna Injection, Solution for Injection, 100mg/ml, 2ml Amp', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(654, 2, 'Metallic Vaginal Speculum Cusco Large Medium and Small', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(655, 1, 'Metformin Tablets 500Mg (100s in Blisters)', 83, 0, 2, 1, '2022-04-01 09:35:42'),
(656, 4, 'Methanol Ar', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(657, 1, 'Methotrexate Solution For Injection 25mg/ml, 2ml Vial, As Sodium Salt, Preservative Free', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(658, 1, 'Methotrexate Tablet, 2.5mg(As Sodium Salt)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(659, 1, 'Methyl Prednisolone 500mg Injection', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(660, 1, 'Methylated Spirit/Ethanol Denatured (Alcohol Content 94%-96%)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(661, 1, 'Methyldopa Tablets 250Mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(662, 1, 'Metoclopramide Injection - 5Mg/Ml, 2ml ampoule, 10 pack', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(663, 1, 'Metoclopramide Injection 5mg/ml', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(664, 1, 'Metoclopramide Tablets - 10Mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(665, 1, 'Metolazone Tablet, 5mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(666, 1, 'Metronidazole Injection - 5Mg/Ml', 533, 0, 4, 1, '2022-04-01 11:13:19'),
(667, 1, 'Metronidazole Suspension - 200Mg/5Ml', 41938, 0, 2, 1, '2022-04-01 09:16:29'),
(668, 1, 'Metronidazole Tablets 200mg', 1010, 0, 2, 1, '2022-04-01 09:54:17'),
(669, 4, 'Micro Pippette Tips (Blue) 200ul -1000ul', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(670, 4, 'Micro Pippette Tips (Yellow) 200ul-1000ul', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(671, 4, 'Microalbumin', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(672, 5, 'Micropore tape 2.5cm x 9.14M  (3M)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(673, 2, 'Micropore Tape Adhesive 5Cm X 4.5M', 1998, 0, 3, 1, '2022-04-01 08:17:39'),
(674, 2, 'Micropore Tape Adhesive 7.5Cm X 4.5M', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(675, 2, 'Micropore Tape Size - 2.3Cm X9.44M', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(676, 4, 'Microscope Slides (Plain)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(677, 4, 'Microscope Slides Frosted', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(678, 1, 'Midazolam Injection 1Mg/1Ml- 5Ml Ampoule', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(679, 2, 'Mini Close Wound Drainage/Suction Unit', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(680, 13, 'Mini external fixators ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(681, 1, 'Mirtazapine Tablet, 15mg (as Hydrochloride)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(682, 1, 'Misoprostol 200Mcg Tablets (Sublingual)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(683, 1, 'Mometasone Furoate Ointment 0.1% - 15G', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(684, 1, 'Montelukast (As Sodium Salt) Tablet 10mg', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(685, 1, 'Morphine 10mg Tablets', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(686, 1, 'Morphine Oral Solution 10mg/ml, 100ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(687, 1, 'Morphine Oral Solution 1mg/ml, 100ml (Paediatric)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(688, 1, 'Morphine Powder', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(689, 1, 'Morphine Sulphate Injection - 10Mg/Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(690, 10, 'Muac Tape (Paediatric)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(691, 10, 'MUAC Tape, Mid Upper Arm Circumference Adult', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(692, 1, 'Mupirocin Ointment 2% (15G)', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(693, 1, 'Mycophenolate Mofetil 500mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(694, 1, 'Mycophenolate Sodium 360mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(695, 1, 'Mycophenolic Acid Tablet (E/C), 180mg as Mycophenolate Sodium', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(696, 2, 'N95 Particulate respirator mask cone shape ', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(697, 1, 'Naloxone Hydrochloride  Injection - 400mcg/ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(698, 1, 'Naltrexone Implant 765mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(699, 2, 'Nasal Prongs For Oxygen Delivery -  Neonatal  Size', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(700, 2, 'Nasal Prongs For Oxygen Delivery - Adult Size', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(701, 2, 'Nasal Prongs For Oxygen Delivery - Paed Size', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(702, 2, 'Nebulizing Kit, Adult', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(703, 2, 'Nebulizing Kit, Paediatric', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(704, 4, 'Needle Holders', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(705, 2, 'Needles Disposabe G21', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(706, 2, 'Needles Disposable  G23', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(707, 2, 'Nelaton Catheter Fg14, One Way', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(708, 1, 'Neostigmine Injection - 2.5Mg/Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(709, 4, 'Neutral Red', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(710, 1, 'Nifedipine Tablets S/R 20mg', 1000, 0, 2, 1, '2022-04-01 07:49:11'),
(711, 1, 'Nitrofurantoin 100mg Tablets', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(712, 2, 'Non Breather Masks Adult', 494, 0, 3, 1, '2022-04-01 10:25:48'),
(713, 2, 'Non Breather Masks Paediatric', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(714, 7, 'Non-Ionic H2O Soluble With Iodine Content - 270Mg/Ml', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(715, 7, 'Non-Ionic H2O Soluble With Iodine Content - 300Mg/Ml', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(716, 1, 'Noradrenaline Injection 2mg/2ml, Ampoule', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(717, 1, 'Normal immunoglobulin (Human)  injection for IV administration,5% protein solution', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(718, 3, 'Nutritionally Complete Balanced diet for enteral powder form (Ensure)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(719, 3, 'Nutritionally complete feed  in powder form (for Expectant and Lactating Mothers - Liptomama)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(720, 1, 'Nystatin Suspension - 100 000Iu/Ml', 67, 0, 2, 1, '2022-04-01 10:14:50'),
(721, 2, 'OB KIT ?Braided coated Polyglactin 910 No 1, double arm heavy ? circle round body and ?, taper cutting 40mm 180 cm Plus 3/0 poliglecaprone 25mm undyed 3/8 circle 70cm  cutting', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(722, 4, 'Oil Immersion', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(723, 1, 'Olanzapine Dispersible Tablet 10mg', 25, 0, 3, 1, '2022-04-01 10:43:25'),
(724, 1, 'Olanzapine Tablets 10mg scored', 1000, 0, 4, 1, '2022-04-01 08:00:39'),
(725, 1, 'Omeprazole Capsules 20Mg (100s in Blisters)', 10000, 0, 2, 1, '2022-04-01 08:23:01'),
(726, 1, 'Omeprazole Injection 40Mg Vial', 3000, 0, 3, 1, '2022-04-01 08:04:20'),
(727, 1, 'Omeprazole PFI 40mg Vial', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(728, 1, 'Ondansetron Injection, 2mg/ml, 2ml ampoule', 52, 0, 3, 1, '2022-04-01 11:11:58'),
(729, 1, 'Ondansetron Tablet, 4mg (as hydrochloride) as disintegrating tablet', 2000, 0, 2, 1, '2022-04-01 08:03:16'),
(730, 13, 'One- third tubular plate 3.5 with collar, 5 holes, length 64mm, St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(731, 13, 'One- third tubular plate 3.5 with collar, 6 holes, length 76mm, St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(732, 13, 'One- third tubular plate 3.5 with collar, 7 holes, length 88mm, St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(733, 13, 'One- third tubular plate 3.5 with collar,8 holes, length 100mm, St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(734, 6, 'Operating Theatre Suits - Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(735, 6, 'Operating Theatre Suits - Medium', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(736, 6, 'Operating Theatre Suits - Small Size', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(737, 6, 'Operating Theatre Suits - X Large Size', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(738, 2, 'Orange Sticks With Cotton Wool Swab', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(739, 2, 'Orthopaedic /Undercast Padding (3\") 7.5Cm*2.7M (Soft Bandage)', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(740, 2, 'Orthopaedic /Undercast Padding (6\") 15Cm*2.7M (Soft Bandage)', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(741, 2, 'Orthopaedic /Undercast Padding (8\") 20Cm*2.7M (Soft Bandage)', 78, 0, 3, 1, '2022-04-01 11:09:28'),
(742, 2, 'Orthopaedic/Undercast Padding (4\") 10Cm*2.7M (Soft Bandage)', 120, 0, 5, 1, '2022-04-01 10:41:03'),
(743, 13, 'Oscillating Saw ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(744, 5, 'Oxagal Disinfectant', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(745, 1, 'Oxaliplatin Injection, solution for injection, 2mg/ml,25 ml vial (50mg)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(746, 1, 'Oxaliplatin Injection, solution for injection, 2mg/ml,50 ml vial (100mg)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(747, 10, 'Oxygen Concentrator', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(748, 2, 'Oxygen Mask With Strap - Adult', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(749, 2, 'Oxygen Mask With Strap - Neonate Size', 48, 0, 3, 1, '2022-04-01 10:27:29'),
(750, 2, 'Oxygen Maskwith Strap - Child Size', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(751, 1, 'Oxytocin Injection - 10iu/ml', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(752, 1, 'Paclitaxel Concentrate solution for injection, 6mg/ml,16.7ml vial (100 mg) ', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(753, 1, 'Paclitaxel Concentrate solution for injection,6mg/ml, 50ml (300mg) ', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(754, 1, 'Paclitaxel Injection, concentrate solution for injection (6mg/ml),5ml(30mg)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(755, 4, 'Pap Smear Kit', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(756, 2, 'Paracentesis Knife', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(757, 1, 'Paracetamol Solution for Intravenous Infusion 10Mg/Ml, 100Ml', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(758, 1, 'Paracetamol Suppositories 125Mg', 5000, 0, 2, 1, '2022-04-01 07:55:22'),
(759, 1, 'Paracetamol Suspension 120Mg/5Ml', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(760, 1, 'Paracetamol Tablets 500Mg (100s in Blisters)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(761, 2, 'Paraffin Gauze Dressing 10Cm X 10Cm', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(762, 6, 'Patient  Uniforms Pink (Free Dress) Antenatal Mothers Size Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(763, 6, 'Patient  Uniforms Pink (Free Dress) Antenatal Mothers Size Medium', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(764, 6, 'Patient  Uniforms Pink (Free Dress) Antenatal Mothers Size X- Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(765, 6, 'Patient Uniform Children,Pyjama Suit Size Medium  (6-12 Years)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(766, 6, 'Patient Uniform Children,Pyjama Suit Size Small (6-12 Years)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(767, 6, 'Patient Uniform Dress Green And White Stripped Large (For General Wards)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(768, 6, 'Patient uniform dress green and white stripped medium (for general wards)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(769, 6, 'Patient Uniform Dress Green And White Stripped Small (For General Wards)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(770, 6, 'Patient Uniform Dress Green And White Stripped X Large (For General Wards)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(771, 6, 'Patient Uniform Female Light Blue-Large (Gen Ward)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(772, 6, 'Patient Uniform- Mother Gowns (Breast-Feeding Mothers) Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(773, 6, 'Patient Uniform- Mother Gowns (Breast-Feeding Mothers) Medium', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(774, 6, 'Patient Uniform- Mother Gowns (Breast-Feeding Mothers) X-Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(775, 6, 'Patient Uniform- Mother Gowns (Breast-Feeding) Small', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(776, 6, 'Patient Uniform Pajamas Blue White Extra Large (Gen Ward)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(777, 6, 'Patient Uniform Pajamas Green And White Stripped Large (Gen Ward)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(778, 6, 'Patient Uniform Pajamas Green And White Stripped Small (Gen Ward)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(779, 6, 'Patient Uniform Pajamas Green/White Striped Extra Large (Gen Ward)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(780, 6, 'Patient Uniform Pajamas Green/White Striped Medium (Gen Ward)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(781, 6, 'Patient Uniform- Pyjamas Blue/White Cotton Drill-Large (Pych Unit)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(782, 6, 'Patient Uniform- Pyjamas Blue/White Cotton Drill-Medium (Psych Unit)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(783, 6, 'Patient Uniform- Pyjamas Blue/White Cotton Drill-Small (Psych Unit)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(784, 6, 'Patient Uniform- Pyjamas Blue/White Cotton Drill-Xtra Large (Psych Unit)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(785, 6, 'Patient Uniform- Pyjamas Blue/White Cotton Drill-Xxlarge (Psych Ward)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(786, 6, 'Patient Uniform- Pyjamas Blue/White Striped - Large (Gen Ward)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(787, 6, 'Patient Uniform- Pyjamas Blue/White Striped - Medium (Gen Ward)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(788, 6, 'Patient Uniform- Pyjamas Blue/White Striped - Small (Gen Ward)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(789, 13, 'Pediatric Skin Traction Kit ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(790, 1, 'Penicillin  Benzyl Injection  - 1MU', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(791, 1, 'Penicillin Benzyl Injection - 5MU', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(792, 1, 'Phenobarbital (Phenobarbitone) Injection 200mg/ml, Ampoule', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(793, 1, 'Phenobarbital (Phenobarbitone) Injection 60mg/ml, Ampoule', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(794, 1, 'Phenobarbital (Phenobarbitone) Sodium Injection 30mg/ml - 1ml Ampoule', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(795, 1, 'Phenobarbitone Tablets 30mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(796, 1, 'Phenytoin Sodium 25mg/5ml Injection(Epanutin)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(797, 1, 'Phenytoin Tablets 100Mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(798, 1, 'Phenytoin Tablets 50Mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(799, 4, 'Phosphorus', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(800, 1, 'Phytomenadione Injection (Vitamin K1) - 10mg/ml, 1ml Ampuole  (Adults)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(801, 1, 'Phytomenadione Injection (Vitamin K1) 10mg/ml, 0.2ml Ampoule (Paediatric)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(802, 6, 'Pillow Cases/ Slips With Inner Flep 50Cm X 70Cm White', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(803, 6, 'Pillow Covered With Mackintosh Water Proof', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(804, 1, 'Piperacillin/Tazobactum  Injection PFR 4.5gm Vial', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(805, 9, 'Pirimiphos Methyl 300gm/Ltrs Cs 833ml', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(806, 13, 'Plaster Cutter (Electrical)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(807, 13, 'Plaster Cutter (Manual)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(808, 8, 'Plaster of Paris x (25Kg)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(809, 4, 'Plastic Centrifuge Tubes (15Mls) With A Screw Cap', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(810, 4, 'Plastic Centrifuge Tubes (50Mls) With A Screw Cap', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(811, 13, 'Pneumatic tourniquet, duel fastening systems, comes with different sizes of cuffs, automatic pressure release, inflatable cuffs, a compressed gas source, monitor and control cuff, with a stand with moving wheels, power driven 220-240v', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(812, 4, 'Polypots (With Scooper Spoon)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(813, 2, 'Polythene Bags / Liners Black - 30 Litres', 28, 0, 2, 1, '2022-04-01 11:12:45'),
(814, 2, 'Polythene Bags / Liners Black - 50Litres', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(815, 2, 'Polythene Bags / Liners Red - 30 Litres', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(816, 2, 'Polythene Bags / Liners Red - 50Litres', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(817, 2, 'Polythene Bags / Liners Yellow - 30 Litres', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(818, 2, 'Polythene Bags / Liners Yellow - 50Litres', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(819, 1, 'Potassium Chloride Injection - 15%', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(820, 4, 'Potassium Iodide Powder', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(821, 1, 'Povidone-Iodine Solution - 10%', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(822, 13, 'Power Drills (Battery) with assorted saw blades', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(823, 12, 'PPE Kit (Complete with protective coverall, pair googles, pair nitrile gloves, face mask N-95, shoe cover pair)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(824, 1, 'Praziquantel Tablets 600Mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(825, 1, 'Prednisolone Tablet 5mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(826, 1, 'Prednisolone Tablets 5mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(827, 4, 'Pregnacy Test Kit', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(828, 2, 'Prescription Pads', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(829, 1, 'Propofol IV 10mg/Ml  ', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(830, 9, 'Propoxure EC 20%', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(831, 2, 'Prostatectomy Set With Green Towels (Drapes)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(832, 1, 'Protamine Sulphate 10mg/ml, 5ml Ampoule', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(833, 13, 'Proximal Femoral Instruments Set', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(834, 13, 'Proximal Femoral Nails, Stainless Steel,Size10mmx25cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(835, 13, 'Proximal Femoral Nails, Stainless Steel,Size11mmx25cm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(836, 10, 'Pulse Oximeter  Hand-Held complete with peadiatric, adult and neonate probes', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(837, 5, 'Puristerile Disinfectant for Water Plant 5 litre', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(838, 4, 'Quintus 5 Part  Lyse Stopper', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(839, 4, 'Quintus 5 Part Diluent', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(840, 4, 'Quintus 5 Part Lyse', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(841, 1, 'Rabbies Vaccine,Purified Verocell/Human Diploid', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(842, 2, 'Rectal Tube - Ch20 L30Cm Ster Disp', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(843, 2, 'Rectal Tube - Ch24 L30Cm Ster Disp', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(844, 5, 'Regenerating Salt for Water Softening 25kg', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(845, 5, 'Renal Dressing Catheter Connection Pack', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(846, 5, 'Renal Dressing Catheter Disconnection Pack', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(847, 5, 'Renal Fistula Dressing HD Connection- Disconnection Kit', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(848, 1, 'Retinol (Vitamin A) Palmitate Capsules  200,000 IU', 1000, 0, 2, 1, '2022-04-01 08:24:18'),
(849, 4, 'Rheumatoid Factor Kit 50', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(850, 6, 'Ripple Mattress', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(851, 1, 'Risperidone 2mg Tabs, Scored', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(852, 1, 'Rituximab Solution for injection, 10 mg/ml , 50ml vial (500mg) (Roche)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(853, 1, 'Rituximab Solution for injection, 10mg/ml, 10ml vial (100mg) (Roche)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(854, 1, 'Rivaroxaban tablet 10mg (film coated)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(855, 1, 'Rivaroxaban tablet 15mg (film coated)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(856, 1, 'Rivaroxaban tablet 20mg (film coated)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(857, 2, 'Safety Boxes', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(858, 1, 'Salbutamol Nebulizing Solution - 5Mg/Ml 10Ml', 600, 0, 2, 1, '2022-04-01 09:36:19'),
(859, 1, 'Salbutamol/Ipratropium 0.5/3.01 Mg In 2.5Ml Nebulising Sol (Combivent)', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(860, 1, 'Salbutamol+Beclomethasone 200 doses', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(861, 1, 'Saline Nasal Drops 0.9%, 10ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(862, 4, 'Salmonella Antigen Stool Test Kit, 25 Tests', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(863, 4, 'Sample Probe', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(864, 4, 'Samples Cups', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(865, 13, 'Schanz screws dia 2.0mm length 100mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(866, 13, 'Schanz screws dia 2.5mm length 127mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(867, 13, 'Schanz screws dia 3.0mm length 150mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(868, 13, 'Schanz screws dia 3.5mm length 177mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(869, 13, 'Schanz screws dia 4.5mm length 200mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(870, 13, 'Schanz screws dia 5.0mm length 200mm', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(871, 2, 'Set of Assorted Surgical Instruments In a Tray', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(872, 1, 'Sevoflurane Solution for Inhalation with Inbuilt Filter', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(873, 4, 'SFRI Diluent 5.1 ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(874, 4, 'SFRI Lyse 5.1 ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(875, 4, 'SFRI Quench 5.1', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(876, 1, 'Sildenafil Tablet, 25mg (as citrate)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(877, 1, 'Silver Nitrate Silver Ions 0.01% W/V, 250ml Bottle', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(878, 1, 'Silver Sulphadiazine Cream - 1%', 2000, 0, 2, 1, '2022-04-01 08:08:30'),
(879, 1, 'Silver Sulphadiazine Cream 1%', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(880, 2, 'Sims Vaginal Retractor Double End', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(881, 13, 'Skeletal Traction Kit', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(882, 5, 'Skin Adhesive Dressing for renal catheter with pores and waterproof   25\" x 10\" (Primapore)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(883, 2, 'Skin Grafting Blade No. 3', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(884, 2, 'Skin Grafting Blade No.4', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(885, 2, 'Skin Grafting Blade Standard', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(886, 13, 'Skull Traction Kit', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(887, 13, 'Small fragment instrument set', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(888, 1, 'Snake Venom Antiserum I.V Injection 10ml vial (Inoserp).  Covering 18 snake species:  Echis pyramidum, Echis ocellatus, Echis leucogaster, Bitis orietans, Bitis nasicornis, Bitis gabonica, Bitis rhinoceros, Dendroaspis polylepis, Dendroaspis viridis, Dendroaspis angusticeps, Dendroaspis jamesoni, Naja nigricollis, Naja melanoleuca, Naja haje, Naja pallida, Naja nubiae, Naja katiensis, Naja senegalensis', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(889, 7, 'Sod Amid / Meglumine Amidotrizoate-370Mg/Ml', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(890, 1, 'Sodium Bicarbonate Injection - 8.4%', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(891, 1, 'Sodium Bicarbonate Injection - 8.4% (84mg/ml), 10ml ampoule, 10 pack', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(892, 4, 'Sodium Chloride', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(893, 1, 'Sodium Chloride /Normal Saline Solution - 0.9% Euro Cap? Bottle', 660, 0, 2, 1, '2022-04-01 10:17:17'),
(894, 1, 'Sodium Chloride,Injection, solution for infusion, 0.9%, 500ml collapsable bag', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(895, 1, 'Sodium Chloride/Normal Saline Solution - 0.9% Nipple Head Bottle', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(896, 1, 'Sodium Chromoglycate Eye Drops 2%, 10Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(897, 1, 'Sodium Dichloroisocyanurate 2.5g Tablets', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(898, 1, 'Sodium Hypochlorite Solution (Orbicide) 5-5.6%W/V', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(899, 1, 'Sodium Hypochlorite Solution (Tbcide) 5-5.6%W/V', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(900, 1, 'Sodium Lactate Solution With Euro Cap/ Collapsible Bag', 5130, 0, 2, 1, '2022-04-01 09:53:40'),
(901, 1, 'Sodium Stibogluconate - 100Mg/Ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(902, 1, 'Sodium Valproate (Valproic Acid) Oral Solution (Syrup), 200mg/5ml', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(903, 1, 'Sodium valproate (valproic acid) Tablets 500mg, slow release', 288, 0, 4, 1, '2022-04-01 11:07:55'),
(904, 1, 'Sodium Valproate Injection, 100mg/ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(905, 2, 'Solusets for Blood', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(906, 2, 'Solusets for Fluids', 50, 0, 2, 1, '2022-04-01 10:18:51'),
(907, 1, 'Spacer With Mask, Paediatric', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(908, 10, 'Sphygmomanometer Digital (Aneroid)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(909, 10, 'Sphygmomanometer, Digital - Size Adult cuff 22cm to 42cm ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(910, 2, 'Spinal  Needle (0.9*90mm) G22, 1.65', 7, 0, 5, 1, '2022-04-01 09:33:36'),
(911, 2, 'Spinal Corsets - Thoraco-Lumbar (Tl)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(912, 2, 'Spinal Corsets Lumbo - Sacral(Ls)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(913, 2, 'Spinal Needle - 22G (0.9X90Mm) 3 1/2\'\' Ster Disp', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(914, 2, 'Spinal Needle - 22G (0.9X90Mm) Ster Disp', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(915, 2, 'Spinal Needle- 25G x 90Mm, (3 1/2\'\') Sterile, Disp', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(916, 1, 'Spironolactone 25 Mg Tablets', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(917, 9, 'Spray Pumps (Plastic)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(918, 2, 'Sterilization Pouch (14Cmx25Cm)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(919, 2, 'Sterilization Pouch (19Cmx33Cm)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(920, 2, 'Sterilization Pouch (9Cmx22Cm)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(921, 10, 'Stethoscope', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(922, 2, 'Stock Control Cards', 1250, 0, 2, 1, '2022-04-01 09:34:52'),
(923, 4, 'Stool Occult Blood Test (Tablet)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(924, 5, 'Sub Clavian Catheter for Dialysis- 12.0F x 20cm (Acute Dual Lumen)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(925, 2, 'Suction Catheter Size 16 Fg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(926, 2, 'Suction Catheters - Size 10 Fg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(927, 2, 'Suction Catheters - Size 12 Fg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(928, 2, 'Suction Catheters - Size 14 Fg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(929, 2, 'Suction Catheters - Size 18 Fg', 0, 0, 5, 1, '0000-00-00 00:00:00'),
(930, 2, 'Suction Catheters - Size 4 Fg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(931, 2, 'Suction Catheters - Size 6 Fg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(932, 2, 'Suction Catheters - Size 8 Fg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(933, 2, 'Suction Catheters With Regulatory Valve - Size 14 FG', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(934, 2, 'Suction Catheters With Regulatory Valve - Size 18 Fg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(935, 2, 'Suction Catheters With Regulatory Valve - Size 4 Fg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(936, 2, 'Suction Catheters With Regulatory Valve - Size 8 FG', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(937, 2, 'Suction Catheters With Regulatory Valve FR 12', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(938, 2, 'Suction Catheters With Regulatory Valve FR 16', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(939, 2, 'Suction Catheters With Regulatory Valve FR 6', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(940, 10, 'Suction Machine Electrical', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(941, 1, 'Surfactant Beractant or Poractant or equivalent, 25mg/ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(942, 12, 'Surgical 3 Ply Face Mask with Ear Loop (COV)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(943, 2, 'Surgical Blades Size 15, S.S/C.S On Disp Bp Handle Size 6', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(944, 2, 'Surgical Blades Size 23, S.S/C.S On Disp Bp Handle', 21, 0, 2, 1, '2022-04-01 09:21:19'),
(945, 2, 'Surgical Blades With Handle Size 11', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(946, 2, 'Surgical cap (disposable) sky blue/ light green', 124, 0, 2, 1, '2022-04-01 10:35:41'),
(947, 6, 'Surgical Gown Cotton Green Standard - Extra Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(948, 6, 'Surgical Gown Cotton Green Standard - Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(949, 6, 'Surgical Gown Cotton Green Standard - Medium', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(950, 6, 'Surgical Gown Cotton Green Standard - Small', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(951, 2, 'Surgical Mask Disposable 3 Ply with Four Ties ', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(952, 2, 'Suture  Polydiaxanone (Pds) No 3/0 , 22mm 1/2 Circle 75cm Rbn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(953, 2, 'Suture Braided Polyglactin 910 No. 1 RB/TC 40mm (Double arm) Heavy 1/2C 180cm', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(954, 2, 'Suture Nylon 9/0, 30Cm, 6.5Mm 3/8C micro spatulated', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(955, 2, 'Suture Nylon 9/0, 45Cm, 6.5Mm 1/2C Rcn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(956, 2, 'Suture Nylon No 1 75Cm, 40Mm 1/2 C Rcn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(957, 2, 'Suture Nylon No 1 75cm, 40mm 3/8 C Rcn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(958, 2, 'Suture Nylon No 2/0, 3/8 Circle,45mm,100cm Rcn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(959, 2, 'Suture Nylon No.1 On 90Mm ? Circle 100Cm Ccn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(960, 2, 'Suture Nylon No.1,1/2 Circle, 48mm, 100cm RCN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(961, 2, 'Suture Nylon No.1,1/2 Circle, 48mm, 100cm Rcn (Ethilon) - J & J (W738)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(962, 2, 'Suture Nylon No.2/0,3/8 Circle, 36Mm. 90Cm RCN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(963, 2, 'Suture Nylon No.2/0,3/8 Circle, 36Mm. 90cm Rcn (Ethilon)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(964, 2, 'Suture Nylon No.2/0,3/8 Circle,45Mm.100Cm Rcn (Ethilon) ', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(965, 2, 'Suture Nylon-3/0 75Cm ?C 26Mm-Rcn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(966, 2, 'Suture Poliglecaprone 3/0 26mm 3/8 Circle ,75cm Rcn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(967, 2, 'Suture Polydiaxanone (Pds)  No. 2/0 On 30mm 1/2circle 75cm  Taper Point', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(968, 2, 'Suture Polyglactin  Coated No 2, 1/2 Circle, 48mm, 75cm Rcn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(969, 2, 'Suture Polyglactin  Coated No 2/0,1/2 Circle,36mm.90cm Tcn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(970, 2, 'Suture Polyglactin 0 ?C 45Mm Rbn 75Cm.', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(971, 2, 'Suture Polyglactin 1 75Cm On 40Mm ?C RBN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(972, 2, 'Suture Polyglactin 1 90Cm On 45Mm ?C Rbn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(973, 2, 'Suture Polyglactin 2 90Cm On 45Mm ?C RCN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(974, 2, 'Suture Polyglactin 2 90Cm On 45Mm ?C RCN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(975, 2, 'Suture Polyglactin 2/0 75Cm On 40Mm ? C RCN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(976, 2, 'Suture Polyglactin 3/0 75Cm On 22Mm ?C RBN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(977, 2, 'Suture Polyglactin 910 Coated No.2,1/2 Circle,45Mm.75Cm Rbn (Ethicon)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(978, 2, 'Suture Polyglactin 910 Coated No.2,1/2 Circle,48Mm.75Cm Rcn (Ethicon) ', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(979, 2, 'Suture Polyglactin 910 Coated No.2/0,1/2 Circle,31Mm.75Cm Rbn (Ethicon)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(980, 2, 'Suture Polyglactin 910 Coated No.2/0,1/2 Circle,36Mm.90Cm Tcn (Ethicon)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(981, 2, 'Suture Polyglactin 910 Coated No.2/0,1/2 Circle,40Mm.75Cm Rbn (Ethicon) ', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(982, 2, 'Suture Polyglactin 910 Coated No.2/0,3/8 Circle,36Mm.75Cm Rcn (Ethicon)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(983, 2, 'Suture Polyglactin Coated No 2,1/2 Circle,45mm ,75cm Rbn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(984, 2, 'Suture Polyglactin Coated No 2/0,1/2 Circle,31mm.75cm Rbn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(985, 2, 'Suture Polyglactin Coated No 2/0,1/2 Circle,40mm.75cm Rbn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(986, 2, 'Suture Polyglactin Coated, 1, 75Cm, 40Mm, Rcn, 3/8 C', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(987, 2, 'Suture Polyglactin Coated, No. 1, 75cm, 40mm, Rcn, 1/2 C', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(988, 2, 'Suture Polyglactin No 1, 100cm on 65mm 3/8 Circle Blunt', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(989, 2, 'Suture Polyglactin No 3/0 75Cm, 26Mm 3/8 C RCN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(990, 2, 'Suture Polyglactin No 6/0, 45Cm, 17Mm 1/2C RCN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(991, 2, 'Suture Polyglactin No 8/0  Micropoint - Spatula 6.5mm 3/8c, 30cm', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(992, 2, 'Suture Polyglactin No. 4/0, 45Cm 17Mm 1/2C Rcn', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(993, 2, 'Suture Polyglactin No. 4/0, 75cm 16mm 3/8C RCN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(994, 2, 'Suture Polyglactin No.5/0, 45Cm 17Mm 3/8C RCN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(995, 2, 'Suture Polyglactin, No.1 On 40mm, 75cm 1/2circle Rcn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(996, 2, 'Suture Polyglactin, No.1 On 40mm, 90cm 1/2 circle RCN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(997, 2, 'Suture Polyglycolic  No 1, 75cm  3/8C 40mm RCN  ', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(998, 2, 'Suture Polyglycolic Acid  0  75cm on 40mm 1/2C Rbn', 0, 0, 22, 1, '0000-00-00 00:00:00'),
(999, 2, 'Suture Polyglycolic Acid 1, 90cm on 45mm ?C  RBN', 237, 0, 4, 1, '2022-04-01 10:53:16'),
(1000, 2, 'Suture polyglycolic acid 2/0  90cm  ?c 36mm TCN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1001, 2, 'Suture Polyglycolic Acid 2/0 90Cm ?C 36Mm Rcn', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1002, 2, 'Suture Polyglycolic Acid 2/0, 75cm on 40mm ? C RBN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1003, 2, 'Suture Polyglycolic Acid 5/0 75Cm On 19Mm ? C Rbn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1004, 2, 'Suture Polyglycolic Acid No 4/0 75cm On 22mm 1/2 Circle Rbn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1005, 2, 'Suture Polyglycolic Acid No 4/0 75Cm On 30Mm 1/2 Circle Rbn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1006, 2, 'Suture Polyglycolic Acid No. 3/0, 75cm On 35mm 1/2 Circle RBN', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1007, 2, 'Suture Polyglycolic? No 2/0, 75cm? ?C 40mm RBN?', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1008, 2, 'Suture Polyglycolic? No 2/0,? 75cm? ?C 31mm RBN ', 212, 0, 4, 1, '2022-04-01 10:10:25'),
(1009, 2, 'Suture Polypropylene No,3/0 75cm ?C 22mm Rbn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1010, 2, 'Suture Polypropylene-3/0 75Cm ?C 22Mm-Ccn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1011, 2, 'Suture Polypropylene-3/0 90cm ?C 26mm,Rbn, Double Armed', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1012, 2, 'Suture Silk No. 2 on 45mm 75cm 1/2 Circle RBN', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(1013, 2, 'Suture, Polyglycolic Acid, No.3/0, 26mm 3/8c,75cm Rcn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1014, 2, 'Suture, Polyglycolic Acid, No.3/0, 30Mm ?C Rcn, 75Cm', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1015, 2, 'Suture.Nylon-4/0 75Cm ?C 30Mm-Rcn', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1016, 2, 'Suturing Set with Green Towels (Drapes)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1017, 1, 'Suxamethonium Chloride Injection', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1018, 4, 'Swelab 3 Cleaning Kit', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1019, 4, 'Swelab 3 Part Diluent', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1020, 4, 'Swelab 3 Part Lyse', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1021, 4, 'Swelab Eazy Cleaner', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1022, 4, 'Swelab Lumi  5 Part Lyse-1 ', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1023, 4, 'Swelab Lumi 5 Part  Diluent', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1024, 4, 'Swelab Lumi 5 Part  Lyse-2', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1025, 4, 'Swelab Micro-Capillaries', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1026, 5, 'Syringe 20ml (Without Needle), BD Brand', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(1027, 2, 'Syringes 2Pc - 5Ml Rup With G 21Needle X 11/2', 347, 0, 2, 1, '2022-04-01 10:24:00'),
(1028, 2, 'Syringes 2Pc- 10Ml Rup With G 21 Needle X 11/2', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1029, 2, 'Syringes 2Pc- 20Ml With G21 Needle X 11/2', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1030, 2, 'Syringes 2Pc- 2Ml Rup With G23 Needle X 1', 2000, 0, 2, 1, '2022-04-01 07:44:38'),
(1031, 2, 'Syringes 60ml Without Needle,  Long Nozzle (Concentric)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1032, 2, 'Syringes 60ml without Needle, Short Nozzle (Concentric)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1033, 2, 'Syringes A D- Fixed Dose of 0.05ml With 27G Needle for B.C.G ', 333, 0, 2, 1, '2022-04-01 10:24:56'),
(1034, 2, 'Syringes A D- Fixed Dose of 0.5ml With 23G Needle ', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1035, 13, 'T- Buttress Plate 4.5, 10 holes, St. steel Left', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1036, 13, 'T- Buttress Plate 4.5, 10 holes, St. steel Right', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1037, 13, 'T- Buttress Plate 4.5, 4 holes, length 81mm St. steel L eft', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1038, 13, 'T- Buttress Plate 4.5, 4 holes, length 81mm St. steel Right', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1039, 13, 'T- Buttress Plate 4.5, 6 holes,  St. steel Left', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1040, 13, 'T- Buttress Plate 4.5, 6 holes,  St. steel Right', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1041, 13, 'T- Buttress Plate 4.5, 8 holes, St. steel Left', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1042, 13, 'T- Buttress Plate 4.5, 8 holes, St. steel Right', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1043, 13, 'T- Plate 4.5, 10 holes,  St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1044, 13, 'T- Plate 4.5, 12 holes,  St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1045, 13, 'T- Plate 4.5, 4 holes, length 84mm St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1046, 13, 'T- Plate 4.5, 6 holes, length 116mm St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1047, 13, 'T- Plate 4.5, 8 holes, length 148mm St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1048, 1, 'Tamoxifen Tablet, 20mg (as citrate)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1049, 1, 'Tamsulosin Hydrochloride Tablets 400mcg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1050, 1, 'Telmisartan 80mg + Hydrochlorthiazide 12.5mg Tablets', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1051, 1, 'Telmisartan Tablets 40mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1052, 1, 'Tenecteplase 50mg,20ml Vial', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1053, 1, 'Terbinafine 1% Cream 15gm tube', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1054, 1, 'Terbinafine Tablet 125mg Scored', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1055, 1, 'Tetracycline Eye Ointment  - 1%', 10000, 0, 2, 1, '2022-04-01 08:41:59'),
(1056, 1, 'Tetracycline Eye Ointment -1%', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1057, 6, 'Theatre Aprons - Reusable', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1058, 6, 'Theatre Boots Antistatic - Size 10', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1059, 6, 'Theatre Boots Antistatic - Size 11', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1060, 12, 'Theatre Boots Antistatic  Size 11. Cov', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1061, 6, 'Theatre Boots Antistatic - Size 6', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1062, 6, 'Theatre Boots Antistatic - Size 7', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1063, 12, 'Theatre Boots Antistatic  Size 7. Cov', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1064, 6, 'Theatre Boots Antistatic - Size 8', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1065, 12, 'Theatre Boots Antistatic  Size 8. Cov', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1066, 6, 'Theatre Boots Antistatic - Size 9', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1067, 6, 'Theatre Scholls (Clocs) Size 10-10?', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1068, 6, 'Theatre Scholls (Clocs) Size 11-11?', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1069, 6, 'Theatre Scholls (Clocs) Size 6-6?', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1070, 6, 'Theatre Scholls (Clocs) Size 8?-9?', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1071, 6, 'Theatre Scholls, (Clocs) Size 7-7?', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1072, 1, 'Therapeutic Vitamin A Capsules 50000Iu', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1073, 7, 'Thermal Printing Paper 110Mm X 18Metres', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1074, 1, 'Thiopentone Sodium Injection - 500Mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1075, 4, 'Thiosulphate Citrate Bile Salt Sucrose (TCBS)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1076, 2, 'Thyrodectomy set', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1077, 1, 'Timolol Eye Drops 0.5% 5Ml', 0, 2, 4, 1, '0000-00-00 00:00:00'),
(1078, 1, 'Tinidazole Tab 500Mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1079, 1, 'Tinidazole Tablets 500Mg (F/C)', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1080, 1, 'Tiotropium Bromide (Spiriva)+Hand Inhaler 18mcg, 30pk', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1081, 1, 'Torasemide Tablet 10mg scored', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1082, 4, 'Total Bilirubin', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1083, 4, 'Total Cholesterol', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1084, 4, 'Total Protein', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1085, 6, 'Toto/Baby Gown, Baby Wrapper Material Size: Large', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1086, 6, 'Toto/Baby Gown, Baby Wrapper Material, Size: Medium', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1087, 6, 'Toto/Baby Gown, Baby Wrapper Material, Size: Small', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1088, 2, 'Tourniquet', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1089, 13, 'T-Plate 3.5, right angled, 3/3 holes, length 50mm,St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1090, 13, 'T-Plate 3.5, right angled, 3/3 holes, length 74mm,St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1091, 13, 'T-Plate 3.5, right angled, 4/4 holes, length 56mm,St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1092, 13, 'T-Plate 3.5, right angled,5/3 holes, length 74mm,St. steel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1093, 2, 'Tracheostomy Tube - Size 3.5 Uncuffed', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1094, 2, 'Tracheostomy Tube - Size 4.0 Cuffed', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1095, 2, 'Tracheostomy Tube - Size 4.5 Cuffed', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1096, 2, 'Tracheostomy Tube - Size 5.0 Cuffed', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1097, 2, 'Tracheostomy Tube - Size 5.5 Cuffed', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1098, 2, 'Tracheostomy Tube - Size 6.0 Uncuffed', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1099, 2, 'Tracheostomy Tube - Size 6.5 Uncuffed', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1100, 2, 'Tracheostomy Tube - Size 7.0 Cuffed', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1101, 2, 'Tracheostomy Tube Size 8.0 Cuffed', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1102, 2, 'Traction Kit, Skin, Child', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1103, 1, 'Tramadol 50mg Capsules', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1104, 1, 'Tranexamic Acid 500Mg Tablets', 118, 0, 2, 1, '2022-04-01 10:48:26'),
(1105, 1, 'Tranexamic Acid Injection 500Mg/5Ml', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(1106, 5, 'Transpore tape 2.5cm x 9.14M  (3M)', 0, 1, 4, 1, '0000-00-00 00:00:00'),
(1107, 1, 'Trastuzumab Vial 440Mg (Herceptin)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1108, 1, 'Triamcinolone Acetonide Injection (Injectable Suspension) 40mg/1ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1109, 4, 'Triglycerides', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1110, 1, 'Trimetazidine tablet 35mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1111, 10, 'Trolley  dressing', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1112, 10, 'Trolley Anaesthetic drug', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1113, 10, 'Trolley Medicine', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1114, 4, 'Tube  Centrifuge 50ml Graduated Screw Cap  Falcon', 0, 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `drugs` (`id`, `category`, `name`, `currentStock`, `tracer`, `istatus`, `registered_by`, `date`) VALUES
(1115, 13, 'Tube to Tube Connectors', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1116, 13, 'Tubular Rods', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1117, 1, 'Typhoid Vaccine 20 Doses 10Ml Vial (Typhim)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1118, 7, 'Ultrasonic Gel', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1119, 2, 'Under water seal drainage bottle', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1120, 4, 'Universal  Bottles (Glass)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1121, 4, 'Urea', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1122, 4, 'Uric Acid', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1123, 2, 'Urine Bags Grad.With Inlet&Outlet - 2000Mls', 0, 0, 3, 1, '0000-00-00 00:00:00'),
(1124, 2, 'Urine Collector Bag 100ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1125, 4, 'Urine Containers (Plastic)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1126, 4, 'Urine Strips', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1127, 13, 'Vacuum Drains G10', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1128, 13, 'Vacuum Drains G14', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1129, 13, 'Vacuum Drains G16', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1130, 1, 'Valproic Acid (Sodium Valproate) 200Mg Tablets', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1131, 1, 'Vancomycin Injection 500mg Vial', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1132, 4, 'VDRL Test Strips - Syphillis Screening', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1133, 1, 'Verapamil Tablet 40mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1134, 1, 'Vinblastine Sulphate Solution for Injection, 1mg/ml, 10ml Vial (10mg)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1135, 1, 'Vincristine Injection, powder for reconstitution, 1mg (Sulfate) or solution for injection', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1136, 1, 'Vinorelbine Concentrate for Injection 10mg/ml, 5ml Vial', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1137, 1, 'Vitamin B1,B6,B12, Nicotinamide, Vitamin C Injection', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1138, 1, 'Warfarin Tablets  5mg', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1139, 13, 'Washer 7.0/4.7mm dia for small screws, St. steel.', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1140, 13, 'Washer,13/6.7 mm dia, for large cancellous Bone Screws, St. Screws', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1141, 1, 'Water Based Lubricant(Sterile) 42-50gm', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1142, 1, 'Water for Injection', 300224, 0, 2, 1, '2022-04-01 10:39:42'),
(1143, 6, 'Water Proof Sheeting Material,Deep Green (Mackintosh) 100cm X 50m', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1144, 10, 'Weight And Height Weighing Scale (Digital)', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1145, 10, 'Wheel Chair', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1146, 2, 'Wooden Tongue Depressor 140Mmx19Mm', 42, 0, 2, 1, '2022-04-01 09:43:00'),
(1147, 2, 'Yankauer Suction Tube With Handle', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1148, 1, 'Yellow Fever Vaccine (Stamaril) Multidose 10 Doses', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1149, 1, 'Yellow Fever Vaccine(Stamaril ) One Dose Syringe', 500, 0, 4, 1, '2022-04-01 11:24:18'),
(1150, 2, 'Zinc Oxide Strapping - Size 10Cm X 4.5M Bpc', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1151, 2, 'Zinc Oxide Strapping - Size 5Cm 4.5M Bpc', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1152, 2, 'Zinc Oxide Strapping - Size 7.5Cm X 4.5M Bpc', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1153, 1, 'Zinc Sulphate Tablets - 20Mg', 0, 0, 2, 1, '0000-00-00 00:00:00'),
(1154, 1, 'Zoledronic Acid Injection, PFR OR ready to use solution, 800mcg/ml,5ml vial (4mg)', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1155, 1, 'Zuclopenthixol Acupahse Injection, 100mg/2ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1156, 1, 'Zuclopenthixol decanoate injection 200mg/ml', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1157, 1, 'Zuclopenthixol Inj 50mg/ml Depot, 2ml Ampoule', 0, 0, 4, 1, '0000-00-00 00:00:00'),
(1158, 4, '?-Glutamyl Transferase', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1159, 4, 'Blood Expander(voluven) 6% Hydroxyethyl starch in 0.9% sodium chloride 500ml i.v solution', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(1160, 1, 'Leviethinyl Tablets (COC) 0.15MG/30M CO', 480, 0, 2, 1, '2022-04-01 09:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `drug_dispense_codes`
--

CREATE TABLE `drug_dispense_codes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drug_dispense_codes`
--

INSERT INTO `drug_dispense_codes` (`id`, `name`) VALUES
(1, 'Dental'),
(2, 'X-Ray'),
(3, 'Renal'),
(4, 'Lab'),
(5, 'Eye'),
(6, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `faccart`
--

CREATE TABLE `faccart` (
  `id` int(11) NOT NULL,
  `facilityId` int(10) NOT NULL,
  `regBy` int(10) NOT NULL,
  `requisition` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '1',
  `approvedBy` int(10) NOT NULL DEFAULT '0',
  `regTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faccartwl`
--

CREATE TABLE `faccartwl` (
  `id` int(11) NOT NULL,
  `facilityId` int(10) NOT NULL,
  `regBy` int(10) NOT NULL,
  `requisition` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `status` int(10) NOT NULL,
  `workloadRatio` varchar(10) NOT NULL,
  `approvedBy` int(10) NOT NULL,
  `regTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` int(10) NOT NULL,
  `facilityType` varchar(100) NOT NULL,
  `levelId` int(10) NOT NULL,
  `subCounty` varchar(100) NOT NULL,
  `ward` varchar(100) NOT NULL,
  `workload` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `regBy` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `name`, `code`, `facilityType`, `levelId`, `subCounty`, `ward`, `workload`, `phone`, `date`, `regBy`) VALUES
(1, 'Ainabkoi (RCEA) Health Centre', 16350, 'Basic primary health care facility', 3, 'AINABKOI', 'AINABKOI/OLARE', '10443', '2.55E+11', '0000-00-00 00:00:00', 1),
(2, 'Baharini Dispensary', 21238, 'Dispensary', 2, 'AINABKOI', 'AINABKOI/OLARE', '8071', '2.55E+11', '0000-00-00 00:00:00', 1),
(3, 'Barakeiywo Dispensary', 17360, 'Dispensary', 2, 'KESSES', 'TULWET/CHUIYAT', '7946', '2.55E+11', '0000-00-00 00:00:00', 1),
(4, 'Barsombe Dispensary', 14239, 'Dispensary', 2, 'SOY', 'SEGEROI/BARSOMBE', '11680', '2.55E+11', '0000-00-00 00:00:00', 1),
(5, 'Burnt Forest Sub County Hospital', 16347, 'Primary care hospitals', 5, 'AINABKOI', 'AINABKOI/OLARE', '48019', '2.55E+11', '0000-00-00 00:00:00', 1),
(6, 'Cengalo Dispensary', 14283, 'Dispensary', 2, 'KESSES', 'TARAKWA', '11292', '254', '0000-00-00 00:00:00', 1),
(7, 'Chagaiya Dispensary', 14284, 'Dispensary', 2, 'KESSES', 'TARAKWA', '9581', '2.55E+11', '0000-00-00 00:00:00', 1),
(8, 'Chebarus dispensary', 21892, 'Dispensary', 2, 'TURBO', 'KIPLOMBE', '7977', '2.55E+11', '0000-00-00 00:00:00', 1),
(9, 'Cheboin Dispensary', 20060, 'Dispensary', 2, 'AINABKOI', 'KAPSOYA', '8513', '2.55E+11', '0000-00-00 00:00:00', 1),
(10, 'Chemalal Dispensary', 21894, 'Dispensary', 2, 'TURBO', 'KAMAGUT', '13613', '2.55E+11', '0000-00-00 00:00:00', 1),
(11, 'Chembulet Health Centre', 14317, 'Basic primary health care facility', 3, 'MOIBEN', 'TEMBELIO', '31027', '254', '0000-00-00 00:00:00', 1),
(12, 'Chemororoch Dispensary', 15317, 'Dispensary', 2, 'SOY', 'KAPKURES', '13028', '2.55E+11', '0000-00-00 00:00:00', 1),
(13, 'Chepkanga Health Centre', 14335, 'Basic primary health care facility', 3, 'MOIBEN', 'KARUNA/MEIBEKI', '32162', '2.55E+11', '0000-00-00 00:00:00', 1),
(14, 'Chepkemel Dispensary', 14337, 'Dispensary', 2, 'TURBO', 'NGENYILEL', '11366', '2.55E+11', '0000-00-00 00:00:00', 1),
(15, 'Chepkero Dispensary', 14340, 'Dispensary', 2, 'AINABKOI', 'KAPTAGAT', '11003', '254', '0000-00-00 00:00:00', 1),
(16, 'Chepkigen Dispensary', 14341, 'Dispensary', 4, 'KESSES', 'CHEPTIRET/KIPCHAMO', '65190', '2.55E+11', '0000-00-00 00:00:00', 1),
(17, 'Chepkoilel Sisiwa Dispensary', 14343, 'Dispensary', 2, 'MOIBEN', 'KIMUMU', '5794', '254', '0000-00-00 00:00:00', 1),
(18, 'Cheplasgei Dispensary (Moiben)', 23558, 'Dispensary', 2, 'MOIBEN', 'SERGOIT', '7504', '2.55E+11', '0000-00-00 00:00:00', 1),
(19, 'Cheplaskei Dispensary', 14354, 'Dispensary', 2, 'TURBO', 'TAPSAGOI', '8609', '2.55E+11', '0000-00-00 00:00:00', 1),
(20, 'Cheplelabei Dispensary', 17239, 'Dispensary', 2, 'SOY', 'KAPKURES', '13947', '2.55E+11', '0000-00-00 00:00:00', 1),
(21, 'Chepngoror Dispensary', 14355, 'Dispensary', 2, 'AINABKOI', 'AINABKOI/OLARE', '8942', '254', '0000-00-00 00:00:00', 1),
(22, 'Chepsaita Dispensary', 14358, 'Dispensary', 2, 'TURBO', 'NGENYILEL', '10046', '2.55E+11', '0000-00-00 00:00:00', 1),
(23, 'Chepterit Dispensary', 21956, 'Dispensary', 2, 'SOY', 'SEGEROI/BARSOMBE', '13622', '2.55E+11', '0000-00-00 00:00:00', 1),
(24, 'Cheptigit Dispensary', 17830, 'Dispensary', 2, 'AINABKOI', 'KAPTAGAT', '8014', '2.55E+11', '0000-00-00 00:00:00', 1),
(25, 'Cheptiret Dispensary', 21884, 'Dispensary', 2, 'KESSES', 'CHEPTIRET/KIPCHAMO', '13774', '2.55E+11', '0000-00-00 00:00:00', 1),
(26, 'Cheramei Dispensary', 14377, 'Dispensary', 3, 'TURBO', 'KAMAGUT', '29639', '2.55E+11', '0000-00-00 00:00:00', 1),
(27, 'Chesunet Dispensary', 17358, 'Dispensary', 2, 'KESSES', 'TULWET/CHUIYAT', '7495', '2.55E+11', '0000-00-00 00:00:00', 1),
(28, 'Chobosta Dispensary', 21958, 'Dispensary', 2, 'SOY', 'KIPSOMBA', '4022', '2.55E+11', '0000-00-00 00:00:00', 1),
(29, 'Chuiyat Dispensary', 14389, 'Dispensary', 2, 'KESSES', 'TULWET/CHUIYAT', '6965', '2.55E+11', '0000-00-00 00:00:00', 1),
(30, 'Chukura Dispensary', 14390, 'Dispensary', 2, 'SOY', 'KAPKURES', '13868', '2.55E+11', '0000-00-00 00:00:00', 1),
(31, 'Dry\'s Dispensary', 17063, 'Dispensary', 2, 'AINABKOI', 'AINABKOI/OLARE', '7150', '2.55E+11', '0000-00-00 00:00:00', 1),
(32, 'Elgeyo Boader Dispensary', 14437, 'Dispensary', 3, 'MOIBEN', 'TEMBELIO', '9978', '2.55E+11', '0000-00-00 00:00:00', 1),
(33, 'EMC Kimumu Dispensary', 16349, 'Dispensary', 3, 'MOIBEN', 'KIMUMU', '33659', '2.55E+11', '0000-00-00 00:00:00', 1),
(34, 'Emkwen Dispensary', 21893, 'Dispensary', 2, 'TURBO', 'KIPLOMBE', '17178', '2.55E+11', '0000-00-00 00:00:00', 1),
(35, 'GK Prisons Dispensary (Eldoret East)', 14519, 'Dispensary', 2, 'MOIBEN', 'KIMUMU', '17928', '2.55E+11', '0000-00-00 00:00:00', 1),
(36, 'GK Prisons Dispensary (Ngeria)', 14524, 'Dispensary', 2, 'KAPSERET', 'MEGUN', '8485', '2.55E+11', '0000-00-00 00:00:00', 1),
(37, 'Huruma District Hospital', 14555, 'Primary care hospitals', 4, 'TURBO', 'HURUMA', '66980', '2.55E+11', '0000-00-00 00:00:00', 1),
(38, 'Jabali Dispensary', 17222, 'Dispensary', 2, 'SOY', 'MOI\'S BRIDGE', '9541', '2.55E+11', '0000-00-00 00:00:00', 1),
(39, 'Kabobo Health Centre', 14624, 'Basic primary health care facility', 3, 'SOY', 'SOY', '11698', '2.55E+11', '0000-00-00 00:00:00', 1),
(40, 'Kamuyu Dispensary( Kesses Sub County)', 21883, 'Dispensary', 2, 'KESSES', 'TARAKWA', '5856', '254', '0000-00-00 00:00:00', 1),
(41, 'Kapkei Dispensary', 16354, 'Dispensary', 2, 'MOIBEN', 'TEMBELIO', '8935', '254', '0000-00-00 00:00:00', 1),
(42, 'Kapkeno Dispensary', 10001, 'Dispensary ', 2, 'Ainabkoi', 'Olare', '7944', '254', '0000-00-00 00:00:00', 1),
(43, 'Kapkoi Disp', 17417, 'Dispensary', 2, 'KESSES', 'TARAKWA', '11733', '2.55E+11', '0000-00-00 00:00:00', 1),
(44, 'Kapkoros Dispensary', 22787, 'Dispensary', 2, 'TURBO', 'KAPSAOS', '20269', '254', '0000-00-00 00:00:00', 1),
(45, 'Kapkoros Dispensary(Moiben)', 3, 'Dispensary', 2, 'Moiben', 'Moiben', '6871', '254', '0000-00-00 00:00:00', 1),
(46, 'Kaplelach Chepyakwai Dispensary', 14736, 'Dispensary', 3, 'KAPSERET', 'NGERIA', '12129', '2.55E+11', '0000-00-00 00:00:00', 1),
(47, 'Kaplelach Tumoge', 14737, 'Dispensary', 2, 'KESSES', 'TULWET/CHUIYAT', '8797', '2.55E+11', '0000-00-00 00:00:00', 1),
(48, 'Kapngetuny Dispensary', 14744, 'Dispensary', 2, 'AINABKOI', 'AINABKOI/OLARE', '7711', '2.55E+11', '0000-00-00 00:00:00', 1),
(49, 'Kaprobu Dispensary', 21551, 'Dispensary', 2, 'MOIBEN', 'SERGOIT', '7481', '2.55E+11', '0000-00-00 00:00:00', 1),
(50, 'Kapserton Dispensary', 22071, 'Dispensary', 2, 'KAPSERET', 'SIMAT/KAPSERET', '12716', '2.55E+11', '0000-00-00 00:00:00', 1),
(51, 'Kapsoni Dispensary', 1010, 'Dispensary', 3, 'MOIBEN', 'TEMBELIO', '12279', '254', '0000-00-00 00:00:00', 1),
(52, 'Kapsoya Health Centre', 14769, 'Basic primary health care facility', 4, 'AINABKOI', 'KAPSOYA', '38118', '2.55E+11', '0000-00-00 00:00:00', 1),
(53, 'Kapteldet Dispensary', 19872, 'Dispensary', 2, 'KAPSERET', 'SIMAT/KAPSERET', '9227', '2.55E+11', '0000-00-00 00:00:00', 1),
(54, 'Kapteldon Health Centre', 14779, 'Basic primary health care facility', 4, 'KAPSERET', 'SIMAT/KAPSERET', '24419', '2.55E+11', '0000-00-00 00:00:00', 1),
(55, 'Kaptumo Dispensary', 14791, 'Dispensary', 2, 'KESSES', 'CHEPTIRET/KIPCHAMO', '12166', '2.55E+11', '0000-00-00 00:00:00', 1),
(56, 'Kapyemit Dispensary', 14799, 'Dispensary', 2, 'TURBO', 'KAPSAOS', '20505', '2.55E+11', '0000-00-00 00:00:00', 1),
(57, 'Karuna Dispensary', 14804, 'Dispensary', 2, 'MOIBEN', 'KARUNA/MEIBEKI', '10192', '254', '0000-00-00 00:00:00', 1),
(58, 'Katuiyo Dispensary', 14819, 'Dispensary', 2, 'AINABKOI', 'KAPTAGAT', '11491', '2.55E+11', '0000-00-00 00:00:00', 1),
(59, 'Kesses Health Centre', 14841, 'Basic primary health care facility', 4, 'KESSES', 'TULWET/CHUIYAT', '55748', '2.55E+11', '0000-00-00 00:00:00', 1),
(60, 'Kibagenge Dispensary', 14848, 'Dispensary', 2, 'SOY', 'SEGEROI/BARSOMBE', '8727', '2.55E+11', '0000-00-00 00:00:00', 1),
(61, 'Kibulgeny Dispensary', 16359, 'Dispensary', 2, 'SOY', 'KUINET/KAPSUSWA', '7044', '2.55E+11', '0000-00-00 00:00:00', 1),
(62, 'Kimoning Dispensary', 14879, 'Dispensary', 2, 'MOIBEN', 'TEMBELIO', '6619', '254', '0000-00-00 00:00:00', 1),
(63, 'Kimurgoi Dispensary', 21962, 'Dispensary', 2, 'SOY', 'ZIWA', '16109', '254', '0000-00-00 00:00:00', 1),
(64, 'Kimuri Dispensary', 17416, 'Dispensary', 2, 'KAPSERET', 'NGERIA', '8179', '2.55E+11', '0000-00-00 00:00:00', 1),
(65, 'Kipkabus Health Centre', 14893, 'Basic primary health care facility', 3, 'AINABKOI', 'AINABKOI/OLARE', '17099', '254', '0000-00-00 00:00:00', 1),
(66, 'Kipkenyo Dispensary', 14898, 'Dispensary', 2, 'KAPSERET', 'KIPKENYO', '14852', '2.55E+11', '0000-00-00 00:00:00', 1),
(67, 'Kiplombe AIC Dispensary', 10000, 'Dispensary', 2, 'Turbo', 'Kiplombe', '7897', '254', '0000-00-00 00:00:00', 1),
(68, 'Kipsigak Health Centre', 14915, 'Basic primary health care facility', 3, 'SOY', 'ZIWA', '15836', '2.55E+11', '0000-00-00 00:00:00', 1),
(69, 'Kiptanui Dispensary', 4, 'Dispensary', 2, 'Soy', 'Soy', '6871', '2.54E+02', '0000-00-00 00:00:00', 1),
(70, 'Kisor Dispensary', 14945, 'Dispensary', 2, 'KAPSERET', 'LANGAS', '19430', '2.55E+11', '0000-00-00 00:00:00', 1),
(71, 'Koitebes Dispensary', 4, 'Dispensary', 2, 'Kesses', 'Kesses', '6871', '2.54E+02', '0000-00-00 00:00:00', 1),
(72, 'Koitoror Dispensary', 14963, 'Dispensary', 2, 'MOIBEN', 'TEMBELIO', '8226', '254', '0000-00-00 00:00:00', 1),
(73, 'Kongnyalil Dispensary', 21550, 'Dispensary', 2, 'MOIBEN', 'KARUNA/MEIBEKI', '4781', '254', '0000-00-00 00:00:00', 1),
(74, 'Kuinet Dispensary', 14999, 'Dispensary', 2, 'SOY', 'KUINET/KAPSUSWA', '32894', '2.55E+11', '0000-00-00 00:00:00', 1),
(75, 'Lamaiywet Dispensary', 1, 'Dispensary', 2, 'KAPSERET SUB COUNTY', 'NGERIA', '8351', '254', '0000-00-00 00:00:00', 1),
(76, 'Leberio Dispensary', 17361, 'Dispensary', 2, 'KAPSERET', 'SIMAT/KAPSERET', '4577', '2.55E+11', '0000-00-00 00:00:00', 1),
(77, 'Lemoru Ngeny Dispensary', 0, 'Dispensary', 2, 'SOY', 'SEGEROI/BARSOMBE', '13630', '2.55E+11', '0000-00-00 00:00:00', 1),
(78, 'Lemoru Trinity', 15025, 'Dispensary', 2, 'SOY', 'SEGEROI/BARSOMBE', '11244', '2.55E+11', '0000-00-00 00:00:00', 1),
(79, 'Lingwai Dispensary', 15038, 'Dispensary', 2, 'KESSES', 'TARAKWA', '9938', '2.55E+11', '0000-00-00 00:00:00', 1),
(80, 'Matharu Dispensary', 15154, 'Dispensary', 2, 'KESSES', 'TARAKWA', '8507', '2.55E+11', '0000-00-00 00:00:00', 1),
(81, 'Meibeki Dispensary', 15169, 'Dispensary', 2, 'MOIBEN', 'KARUNA/MEIBEKI', '12634', '2.55E+11', '0000-00-00 00:00:00', 1),
(82, 'Merewet Dispensary', 15177, 'Dispensary', 2, 'SOY', 'KUINET/KAPSUSWA', '23303', '2.55E+11', '0000-00-00 00:00:00', 1),
(83, 'Mobet Dispensary', 15191, 'Dispensary', 2, 'SOY', 'KIPSOMBA', '13488', '2.55E+11', '0000-00-00 00:00:00', 1),
(84, 'Mogoon Dispensary', 15196, 'Dispensary', 2, 'SOY', 'KAPKURES', '14788', '2.55E+11', '0000-00-00 00:00:00', 1),
(85, 'Moiben Health Centre', 15206, 'Basic primary health care facility', 4, 'MOIBEN', 'MOIBEN', '29713', '2547', '0000-00-00 00:00:00', 1),
(86, 'Moi\'s Bridge Health Centre', 15209, 'Basic primary health care facility', 4, 'SOY', 'MOI\'S BRIDGE', '68216', '2.55E+11', '0000-00-00 00:00:00', 1),
(87, 'Mosop Dispensary', 23048, 'Dispensary', 2, 'MOIBEN', 'MOIBEN', '7216', '2.55E+11', '0000-00-00 00:00:00', 1),
(88, 'Muchorwe Dispensary', 21890, 'Dispensary', 2, 'KESSES', 'TARAKWA', '10069', '2.55E+11', '0000-00-00 00:00:00', 1),
(89, 'Murgor Hills Dispensary', 15254, 'Dispensary', 2, 'TURBO', 'TAPSAGOI', '12255', '2.55E+11', '0000-00-00 00:00:00', 1),
(90, 'Murgusi Dispensary', 15255, 'Dispensary', 2, 'TURBO', 'NGENYILEL', '13025', '2.55E+11', '0000-00-00 00:00:00', 1),
(91, 'Muyengwet Dispensary', 15264, 'Dispensary', 2, 'MOIBEN', 'TEMBELIO', '16548', '2.55E+11', '0000-00-00 00:00:00', 1),
(92, 'Nabkoi Dispensary', 15268, 'Dispensary', 3, 'KESSES', 'TARAKWA', '18136', '254', '0000-00-00 00:00:00', 1),
(93, 'Nairiri Dispensary', 22289, 'Dispensary', 2, 'KAPSERET', 'NGERIA', '9194', '2.55E+11', '0000-00-00 00:00:00', 1),
(94, 'Ngara Falls Dispensary', 2, 'Dispensary ', 2, 'KAPSERET', 'Ngeria', '7130', '254', '0000-00-00 00:00:00', 1),
(95, 'Ngelel Tarit Dispensary', 17829, 'Dispensary', 3, 'AINABKOI', 'KAPTAGAT', '18629', '2.55E+11', '0000-00-00 00:00:00', 1),
(96, 'Ngenyilel Dispensary', 15344, 'Dispensary', 3, 'TURBO', 'NGENYILEL', '14002', '2.55E+11', '0000-00-00 00:00:00', 1),
(97, 'Ngeria South Dispensary', 15345, 'Dispensary', 2, 'KAPSERET', 'MEGUN', '8808', '2.55E+11', '0000-00-00 00:00:00', 1),
(98, 'Ngoisa Dispensary', 4, 'Dispensary', 2, 'Moiben', 'Moiben', '6456', '254', '0000-00-00 00:00:00', 1),
(99, 'Ongata Dispensary', 15437, 'Dispensary', 2, 'KAPSERET', 'MEGUN', '10735', '2.55E+11', '0000-00-00 00:00:00', 1),
(100, 'Osorongai Dispensary', 15449, 'Dispensary', 2, 'TURBO', 'NGENYILEL', '17020', '2.55E+11', '0000-00-00 00:00:00', 1),
(101, 'Pioneer Health Centre', 15463, 'Basic primary health care facility', 4, 'KAPSERET', 'KIPKENYO', '49726', '2.55E+11', '0000-00-00 00:00:00', 1),
(102, 'Railways Dispensary', 15478, 'Dispensary', 3, 'SOY', 'KUINET/KAPSUSWA', '14627', '2.55E+11', '0000-00-00 00:00:00', 1),
(103, 'Sambut Dispensary', 15525, 'Dispensary', 2, 'TURBO', 'KAMAGUT', '9457', '2.55E+11', '0000-00-00 00:00:00', 1),
(104, 'Segero Central Dispensary', 21957, 'Dispensary', 2, 'SOY', 'SEGEROI/BARSOMBE', '10747', '2.55E+11', '0000-00-00 00:00:00', 1),
(105, 'Simotwo Dispensary (Eldoret East)', 15577, 'Dispensary', 2, 'MOIBEN', 'MOIBEN', '8652', '2.55E+11', '0000-00-00 00:00:00', 1),
(106, 'Sinonin Dispensary', 17240, 'Dispensary', 2, 'SOY', 'SOY', '11231', '2.55E+11', '0000-00-00 00:00:00', 1),
(107, 'Soliat Dispensary (Eldoret)', 21450, 'Dispensary', 2, 'AINABKOI', 'AINABKOI/OLARE', '6930', '2.55E+11', '0000-00-00 00:00:00', 1),
(108, 'Sosiani Health Centre', 15616, 'Basic primary health care facility', 3, 'TURBO', 'KAMAGUT', '20727', '2.55E+11', '0000-00-00 00:00:00', 1),
(109, 'Soy Health Centre', 15623, 'Basic primary health care facility', 4, 'SOY', 'SOY', '45454', '2.55E+11', '0000-00-00 00:00:00', 1),
(110, 'State Lodge Dispensary', 15674, 'Dispensary', 2, 'AINABKOI', 'KAPSOYA', '2975', '254', '0000-00-00 00:00:00', 1),
(111, 'Sugoi A Dispensary', 17331, 'Dispensary', 2, 'TURBO', 'TAPSAGOI', '12478', '2.55E+11', '0000-00-00 00:00:00', 1),
(112, 'Sugoi B Dispensary', 15680, 'Dispensary', 2, 'TURBO', 'TAPSAGOI', '9722', '2.55E+11', '0000-00-00 00:00:00', 1),
(113, 'Tangasir Dispensary', 15706, 'Dispensary', 2, 'MOIBEN', 'KARUNA/MEIBEKI', '9288', '254', '0000-00-00 00:00:00', 1),
(114, 'Tarakwa Dispensary (Eldoret West)', 17255, 'Dispensary', 2, 'SOY', 'KAPKURES', '14645', '2.55E+11', '0000-00-00 00:00:00', 1),
(115, 'Tingwa Dispensary', 14570, 'Dispensary', 2, 'AINABKOI', 'AINABKOI/OLARE', '4729', '2.55E+11', '0000-00-00 00:00:00', 1),
(116, 'Torochmoi Dispensary', 21549, 'Dispensary', 2, 'MOIBEN', 'MOIBEN', '8047', '2.55E+11', '0000-00-00 00:00:00', 1),
(117, 'Tugen Estate Dispensary', 15741, 'Dispensary', 2, 'MOIBEN', 'SERGOIT', '6927', '2.55E+11', '0000-00-00 00:00:00', 1),
(118, 'Tuiyoluk Dispensary', 17873, 'Dispensary', 2, 'MOIBEN', 'TEMBELIO', '7098', '2.55E+11', '0000-00-00 00:00:00', 1),
(119, 'Tulwet Dispensary', 17403, 'Dispensary', 2, 'KESSES', 'TULWET/CHUIYAT', '9146', '2.55E+11', '0000-00-00 00:00:00', 1),
(120, 'Turbo Sub County Hospital', 15753, 'Basic primary health care facility', 5, 'TURBO', 'TAPSAGOI', '58168', '2.55E+11', '0000-00-00 00:00:00', 1),
(121, 'Twiga Dispensary', 1234, 'Dispensary ', 2, 'Moiben ', 'Moiben', '11395', '254', '0000-00-00 00:00:00', 1),
(122, 'Uasin Gishu District Hospital', 15758, 'Primary care hospitals', 4, 'MOIBEN', 'KIMUMU', '137848', '2.55E+11', '0000-00-00 00:00:00', 1),
(123, 'Uhuru Dispensary', 15759, 'Dispensary', 3, 'AINABKOI', 'KAPTAGAT', '13668', '2.55E+11', '0000-00-00 00:00:00', 1),
(124, 'West Health Centre', 15779, 'Basic primary health care facility', 3, 'TURBO', 'HURUMA', '38043', '2.55E+11', '0000-00-00 00:00:00', 1),
(125, 'Ziwa Sub County Hospital', 15788, 'Primary care hospitals', 5, 'SOY', 'ZIWA', '77976', '2.55E+11', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `facility_level`
--

CREATE TABLE `facility_level` (
  `id` int(11) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facility_level`
--

INSERT INTO `facility_level` (`id`, `level`) VALUES
(1, 'Community'),
(2, 'Dispensary'),
(3, 'Health Centre'),
(4, 'Sub-County Hospital'),
(5, 'County Referal Hospital');

-- --------------------------------------------------------

--
-- Table structure for table `losses`
--

CREATE TABLE `losses` (
  `id` int(11) NOT NULL,
  `batch` varchar(100) NOT NULL,
  `drugId` int(10) NOT NULL,
  `quantity` int(100) NOT NULL,
  `uom` varchar(100) NOT NULL,
  `registeredBy` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderf`
--

CREATE TABLE `orderf` (
  `id` int(11) NOT NULL,
  `facilityId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prodcartwl`
--

CREATE TABLE `prodcartwl` (
  `id` int(11) NOT NULL,
  `drugId` int(10) NOT NULL,
  `faccartwlId` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `approvedQuant` int(10) NOT NULL,
  `regBy` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productcart`
--

CREATE TABLE `productcart` (
  `id` int(11) NOT NULL,
  `cartId` int(100) NOT NULL,
  `drugId` int(100) NOT NULL,
  `batch` varchar(100) NOT NULL,
  `expiry` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `approvedquant` int(100) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `receivedId` int(10) NOT NULL,
  `regBy` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `received`
--

CREATE TABLE `received` (
  `id` int(100) NOT NULL,
  `batch` varchar(100) NOT NULL,
  `denoteId` int(100) NOT NULL,
  `drugId` int(100) NOT NULL,
  `uom` varchar(100) NOT NULL,
  `quantity` int(10) NOT NULL,
  `stock` int(100) NOT NULL,
  `cost` int(100) NOT NULL,
  `totalCost` int(100) NOT NULL,
  `expiry` varchar(20) NOT NULL,
  `registeredBy` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `received`
--

INSERT INTO `received` (`id`, `batch`, `denoteId`, `drugId`, `uom`, `quantity`, `stock`, `cost`, `totalCost`, `expiry`, `registeredBy`, `date`) VALUES
(1, '80733', 1, 242, '39', 30000, 30000, 22, 660000, '2025-01-31', 10, '2022-04-01 07:39:38'),
(2, '80746', 1, 667, '3', 40000, 40000, 35, 1400000, '2024-07-31', 10, '2022-04-01 07:41:03'),
(3, '121020', 1, 1030, '73', 2000, 2000, 475, 950000, '2025-11-30', 10, '2022-04-01 07:44:38'),
(4, '2007035', 1, 41, '102', 500, 500, 2300, 1150000, '2022-12-31', 10, '2022-04-01 07:46:13'),
(5, 'AF0087', 1, 710, '10', 1000, 1000, 75, 75000, '2024-05-31', 10, '2022-04-01 07:49:11'),
(6, 'L54104', 1, 66, '73', 12936, 12936, 225, 2910600, '2024-03-31', 10, '2022-04-01 07:51:50'),
(7, '2005112001', 1, 900, '36', 4980, 4980, 45, 224100, '2023-05-31', 10, '2022-04-01 07:54:24'),
(8, 'KIACK013', 1, 758, '74', 5000, 5000, 100, 500000, '2023-11-30', 10, '2022-04-01 07:55:22'),
(10, '80315', 1, 63, '73', 500, 500, 50, 25000, '2024-12-31', 10, '2022-04-01 07:59:10'),
(11, '1801711', 1, 724, '73', 500, 500, 720, 360000, '2024-01-31', 10, '2022-04-01 08:00:39'),
(12, '210889', 1, 631, '81', 12075, 12075, 60, 724500, '2024-12-31', 10, '2022-04-01 08:02:13'),
(13, '20177602', 1, 729, '71', 2000, 2000, 91, 182000, '2022-09-30', 10, '2022-04-01 08:03:16'),
(14, '21014', 1, 726, '108', 3000, 3000, 170, 510000, '2023-10-31', 10, '2022-04-01 08:04:20'),
(15, '210789', 1, 90, '27', 20000, 20000, 70, 1400000, '2024-11-30', 10, '2022-04-01 08:05:49'),
(16, '80039', 1, 878, '21', 2000, 2000, 253, 506000, '2024-09-30', 10, '2022-04-01 08:08:30'),
(17, '202004', 1, 320, '72', 1200, 1200, 2405, 2886000, '2025-10-31', 10, '2022-04-01 08:10:20'),
(18, 'PK2110445', 1, 999, '60', 200, 200, 860, 172000, '2025-05-31', 10, '2022-04-01 08:12:18'),
(19, 'U2355', 1, 1008, '60', 200, 200, 2746, 549200, '2024-10-31', 10, '2022-04-01 08:14:30'),
(20, '102768461', 1, 673, '93', 1998, 1998, 200, 399600, '2023-01-31', 10, '2022-04-01 08:17:39'),
(21, '80013', 1, 398, '73', 4000, 4000, 83, 332000, '2024-09-30', 10, '2022-04-01 08:19:01'),
(22, 'XD1E012', 1, 503, '108', 20000, 20000, 27, 540000, '2023-01-31', 10, '2022-04-01 08:20:29'),
(23, '80310', 1, 725, '73', 10000, 10000, 100, 1000000, '2024-06-30', 10, '2022-04-01 08:23:01'),
(24, '8202765', 1, 848, '73', 1000, 1000, 740, 740000, '2023-11-30', 10, '2022-04-01 08:24:18'),
(25, '2T540038', 1, 1142, '2', 300000, 300000, 4, 1200000, '2023-02-28', 10, '2022-04-01 08:26:18'),
(26, 'JA210808F', 1, 244, '95', 2000, 2000, 1280, 2560000, '2025-08-31', 10, '2022-04-01 08:28:51'),
(27, '78750', 1, 583, '52', 500, 500, 290, 145000, '2024-03-31', 10, '2022-04-01 08:30:13'),
(29, 'ML21230', 1, 508, '50', 5000, 5000, 25, 125000, '2023-04-30', 10, '2022-04-01 08:34:16'),
(30, 'V21088', 1, 26, '50', 5000, 5000, 6, 30000, '2022-10-31', 10, '2022-04-01 08:34:59'),
(31, 'EP86BM1007', 1, 189, '108', 200, 200, 82, 16400, '2023-11-30', 10, '2022-04-01 08:36:38'),
(32, '2104131905', 1, 288, '36', 4500, 4500, 63, 283500, '2024-04-30', 10, '2022-04-01 08:38:49'),
(33, '2109309', 1, 403, '3', 10000, 10000, 75, 750000, '2024-08-31', 10, '2022-04-01 08:40:09'),
(34, 'E20023', 1, 1055, '105', 10000, 10000, 19, 190000, '2023-07-31', 10, '2022-04-01 08:41:59'),
(35, 'NA', 2, 640, '13', 228, 228, 0, 0, '2024-11-30', 10, '2022-04-01 09:15:50'),
(36, 'NA', 2, 667, '52', 1938, 1938, 0, 0, '2024-11-30', 10, '2022-04-01 09:16:29'),
(37, 'NA', 2, 392, '93', 62, 62, 0, 0, '2024-08-31', 10, '2022-04-01 09:17:35'),
(38, 'NA', 2, 28, '93', 63, 63, 0, 0, '2025-03-31', 10, '2022-04-01 09:18:28'),
(39, 'NA', 2, 68, '9', 2415, 2415, 0, 0, '2024-03-31', 10, '2022-04-01 09:20:32'),
(40, 'NA', 2, 944, '13', 21, 21, 0, 0, '2024-03-31', 10, '2022-04-01 09:21:19'),
(42, 'NA', 2, 200, '103', 3090, 3090, 0, 0, '2023-04-30', 10, '2022-04-01 09:26:01'),
(43, 'NA', 2, 26, '50', 180, 180, 0, 0, '2022-10-31', 10, '2022-04-01 09:30:19'),
(44, 'NA', 2, 53, '93', 2, 2, 0, 0, '2023-06-30', 10, '2022-04-01 09:30:53'),
(45, 'NA', 2, 1, '13', 161, 161, 0, 0, '2022-12-31', 10, '2022-04-01 09:31:28'),
(46, 'NA', 2, 388, '93', 86, 86, 0, 0, '2025-02-28', 10, '2022-04-01 09:32:14'),
(47, 'NA', 2, 51, '93', 2, 2, 0, 0, '2022-06-30', 10, '2022-04-01 09:32:51'),
(48, 'NA', 2, 910, '60', 7, 7, 0, 0, '2027-03-31', 10, '2022-04-01 09:33:36'),
(49, 'NA', 2, 18, '32', 200, 200, 0, 0, '2023-04-30', 10, '2022-04-01 09:34:20'),
(50, 'NA', 2, 922, '93', 1250, 1250, 0, 0, '2023-07-31', 10, '2022-04-01 09:34:52'),
(51, 'NA', 2, 655, '9', 83, 83, 0, 0, '2023-10-31', 10, '2022-04-01 09:35:42'),
(52, 'NA', 2, 858, '108', 600, 600, 0, 0, '2023-06-30', 10, '2022-04-01 09:36:19'),
(53, 'NA', 2, 242, '52', 573, 573, 0, 0, '2024-08-31', 10, '2022-04-01 09:37:57'),
(54, 'NA', 2, 534, '9', 87, 87, 0, 0, '2025-03-31', 10, '2022-04-01 09:38:34'),
(56, 'NA', 2, 1146, '73', 42, 42, 0, 0, '2024-04-29', 10, '2022-04-01 09:43:00'),
(57, 'NA', 2, 52, '93', 2, 2, 0, 0, '2023-06-30', 10, '2022-04-01 09:43:28'),
(59, 'NA', 2, 29, '93', 76, 76, 0, 0, '2023-09-30', 10, '2022-04-01 09:44:43'),
(60, 'NA', 2, 1160, '110', 480, 480, 0, 0, '2022-11-30', 10, '2022-04-01 09:46:32'),
(61, 'NA', 2, 439, '50', 6200, 6200, 0, 0, '2024-02-29', 10, '2022-04-01 09:47:22'),
(62, 'NA', 2, 230, '103', 980, 980, 0, 0, '2024-08-31', 10, '2022-04-01 09:48:07'),
(63, 'NA', 2, 12, '41', 100, 100, 0, 0, '2024-03-31', 10, '2022-04-01 09:52:11'),
(64, 'NA', 2, 434, '111', 39, 39, 0, 0, '2023-06-30', 10, '2022-04-01 09:52:46'),
(65, 'NA', 2, 900, '93', 150, 150, 0, 0, '2023-05-31', 10, '2022-04-01 09:53:40'),
(66, 'NA', 2, 668, '5', 1010, 1010, 0, 0, '2024-08-30', 10, '2022-04-01 09:54:17'),
(67, 'NA', 2, 99, '60', 526, 526, 0, 0, '2024-10-31', 10, '2022-04-01 09:56:31'),
(68, 'NA', 2, 239, '70', 3287, 3287, 0, 0, '2024-10-31', 10, '2022-04-01 09:57:48'),
(69, 'NA', 2, 289, '93', 180, 180, 0, 0, '2023-10-31', 10, '2022-04-01 10:01:56'),
(70, 'NA', 2, 103, '60', 294, 294, 0, 0, '2023-05-31', 10, '2022-04-01 10:02:50'),
(71, 'NA', 2, 398, '9', 135, 135, 0, 0, '2024-08-31', 10, '2022-04-01 10:03:44'),
(72, 'NA', 2, 387, '93', 38, 38, 0, 0, '2025-02-28', 10, '2022-04-01 10:04:23'),
(73, 'NA', 2, 629, '9', 111, 111, 0, 0, '2024-01-31', 10, '2022-04-01 10:04:58'),
(74, 'NA', 2, 438, '50', 1250, 1250, 0, 0, '2025-11-30', 10, '2022-04-01 10:06:04'),
(75, 'NA', 2, 365, '93', 94, 94, 0, 0, '2025-02-28', 10, '2022-04-01 10:07:04'),
(76, 'NA', 2, 33, '93', 72, 72, 0, 0, '2023-09-30', 10, '2022-04-01 10:07:44'),
(77, 'NA', 2, 395, '93', 40, 40, 0, 0, '2025-05-31', 10, '2022-04-01 10:08:20'),
(78, 'NA', 2, 374, '41', 4, 4, 0, 0, '2024-06-30', 10, '2022-04-01 10:08:58'),
(79, 'NA', 2, 1008, '60', 12, 12, 0, 0, '2024-10-31', 10, '2022-04-01 10:10:25'),
(80, 'NA', 2, 19, '108', 94, 94, 0, 0, '2022-09-30', 10, '2022-04-01 10:11:41'),
(81, 'NA', 2, 407, '89', 3235, 3235, 0, 0, '2024-07-31', 10, '2022-04-01 10:12:30'),
(82, 'NA', 2, 181, '93', 90, 90, 0, 0, '2024-10-31', 10, '2022-04-01 10:14:06'),
(83, 'NA', 2, 720, '52', 67, 67, 0, 0, '2023-08-31', 10, '2022-04-01 10:14:50'),
(84, 'NA', 2, 101, '95', 637, 637, 0, 0, '2026-05-31', 10, '2022-04-01 10:15:31'),
(85, 'NA', 2, 631, '29', 615, 615, 0, 0, '2024-08-30', 10, '2022-04-01 10:16:01'),
(86, 'NA', 2, 309, '13', 32, 32, 0, 0, '2023-02-28', 10, '2022-04-01 10:16:37'),
(87, 'NA', 2, 893, '93', 660, 660, 0, 0, '2023-07-31', 10, '2022-04-01 10:17:17'),
(88, 'NA', 2, 308, '13', 54, 54, 0, 0, '2024-03-31', 10, '2022-04-01 10:18:04'),
(89, 'NA', 2, 906, '93', 50, 50, 0, 0, '2026-09-30', 10, '2022-04-01 10:18:51'),
(90, 'NA', 2, 406, '108', 990, 990, 0, 0, '2024-06-30', 10, '2022-04-01 10:19:30'),
(91, 'NA', 2, 187, '93', 360, 360, 0, 0, '2022-09-30', 10, '2022-04-01 10:20:01'),
(92, 'NA', 2, 360, '93', 370, 370, 0, 0, '2024-01-31', 10, '2022-04-01 10:22:05'),
(93, 'NA', 2, 519, '93', 3900, 3900, 0, 0, '2023-11-30', 10, '2022-04-01 10:22:42'),
(94, 'NA', 2, 1027, '9', 347, 347, 0, 0, '2026-02-28', 10, '2022-04-01 10:24:00'),
(95, 'NA', 2, 1033, '9', 333, 333, 0, 0, '2024-05-31', 10, '2022-04-01 10:24:56'),
(96, 'NA', 2, 712, '93', 494, 494, 0, 0, '2025-06-30', 10, '2022-04-01 10:25:48'),
(97, 'NA', 2, 361, '93', 94, 94, 0, 0, '2024-05-31', 10, '2022-04-01 10:26:24'),
(98, 'NA', 2, 394, '93', 15, 15, 0, 0, '2025-05-31', 10, '2022-04-01 10:26:54'),
(99, 'NA', 2, 749, '93', 48, 48, 0, 0, '2023-10-31', 10, '2022-04-01 10:27:29'),
(100, 'NA', 2, 310, '13', 16, 16, 0, 0, '2023-07-31', 10, '2022-04-01 10:27:58'),
(101, 'NA', 2, 393, '93', 31, 31, 0, 0, '2025-01-31', 10, '2022-04-01 10:31:25'),
(102, 'NA', 2, 23, '13', 84, 84, 0, 0, '2023-09-30', 10, '2022-04-01 10:32:15'),
(103, 'NA', 2, 583, '52', 69, 69, 0, 0, '2024-03-31', 10, '2022-04-01 10:33:47'),
(104, 'NA', 2, 946, '9', 124, 124, 0, 0, '2024-11-30', 10, '2022-04-01 10:35:41'),
(105, 'NA', 2, 107, '95', 88, 88, 0, 0, '2023-09-30', 10, '2022-04-01 10:39:18'),
(106, 'NA', 2, 1142, '9', 224, 224, 0, 0, '2023-07-31', 10, '2022-04-01 10:39:42'),
(107, 'NA', 2, 399, '5', 79, 79, 0, 0, '2023-10-31', 10, '2022-04-01 10:40:21'),
(108, 'NA', 2, 742, '60', 120, 120, 0, 0, '2023-08-31', 10, '2022-04-01 10:41:03'),
(109, 'NA', 2, 723, '9', 25, 25, 0, 0, '2023-01-31', 10, '2022-04-01 10:43:25'),
(110, 'NA', 2, 528, '13', 1038, 1038, 0, 0, '2024-06-30', 10, '2022-04-01 10:45:28'),
(111, 'NA', 2, 22, '93', 72, 72, 0, 0, '2024-02-29', 10, '2022-04-01 10:46:17'),
(112, 'NA', 2, 1104, '29', 118, 118, 0, 0, '2022-09-30', 10, '2022-04-01 10:48:26'),
(113, 'NA', 2, 410, '52', 237, 237, 0, 0, '2023-03-31', 10, '2022-04-01 10:49:06'),
(114, 'NA', 2, 97, '95', 3, 3, 0, 0, '2023-03-31', 10, '2022-04-01 10:49:58'),
(115, 'NA', 2, 178, '93', 393, 393, 0, 0, '2024-10-31', 10, '2022-04-01 10:50:52'),
(116, 'NA', 2, 3, '13', 21, 21, 0, 0, '2022-07-31', 10, '2022-04-01 10:51:26'),
(117, 'NA', 2, 999, '60', 37, 37, 0, 0, '2026-01-31', 10, '2022-04-01 10:53:16'),
(118, 'NA', 2, 280, '93', 3, 3, 0, 0, '2023-01-31', 10, '2022-04-01 10:53:59'),
(119, 'NA', 2, 637, '93', 1, 1, 0, 0, '2024-06-30', 10, '2022-04-01 10:54:28'),
(120, 'NA', 2, 518, '93', 45, 45, 0, 0, '2025-04-30', 10, '2022-04-01 10:55:02'),
(121, 'NA', 2, 102, '60', 224, 224, 0, 0, '2023-05-31', 10, '2022-04-01 10:55:57'),
(122, 'NA', 2, 129, '9', 683, 683, 0, 0, '2024-01-31', 10, '2022-04-01 11:05:11'),
(123, 'NA', 2, 383, '9', 70, 70, 0, 0, '2025-10-31', 10, '2022-04-01 11:06:25'),
(124, 'NA', 2, 562, '108', 10, 10, 0, 0, '2023-09-30', 10, '2022-04-01 11:07:07'),
(125, 'NA', 2, 903, '9', 288, 288, 0, 0, '2023-08-31', 10, '2022-04-01 11:07:55'),
(126, 'NA', 2, 741, '60', 78, 78, 0, 0, '2023-09-30', 10, '2022-04-01 11:09:28'),
(127, 'NA', 2, 21, '9', 351, 351, 0, 0, '2023-07-31', 10, '2022-04-01 11:10:45'),
(128, 'NA', 2, 728, '50', 52, 52, 0, 0, '2023-01-31', 10, '2022-04-01 11:11:58'),
(129, 'NA', 2, 813, '9', 28, 28, 0, 0, '2024-07-31', 10, '2022-04-01 11:12:45'),
(130, 'NA', 2, 666, '52', 533, 533, 0, 0, '2023-07-31', 10, '2022-04-01 11:13:19'),
(131, 'NA', 2, 362, '93', 492, 492, 0, 0, '2023-04-30', 10, '2022-04-01 11:14:06'),
(132, 'NA', 2, 531, '108', 134, 134, 0, 0, '2023-02-28', 10, '2022-04-01 11:20:43'),
(133, 'NA', 2, 533, '108', 39, 39, 0, 0, '2024-03-31', 10, '2022-04-01 11:21:35'),
(134, 'NA', 2, 74, '108', 45, 45, 0, 0, '2025-08-31', 10, '2022-04-01 11:23:14'),
(135, 'NA', 2, 1149, '99', 500, 500, 0, 0, '2022-08-31', 10, '2022-04-01 11:24:18');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'System Admin'),
(2, 'County Admin'),
(3, 'Incharge Drug Store'),
(4, 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `roleId` int(10) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `facility` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registeredBy` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `roleId`, `fname`, `lname`, `username`, `facility`, `password`, `registeredBy`) VALUES
(1, 4, 'Timothy', 'Kigen', 'timothy', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2),
(2, 4, 'Rose', 'Jemutai', 'rJemuu', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(3, 3, 'Hestone', 'Sirmah', 'sirmah', 'County Drug Stores ', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(5, 4, 'Redemtor', 'Bwalei', 'bwalei', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(7, 4, 'Nelson', 'Maru', 'nelson', 'County drug store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(8, 3, 'EUNICE', 'CHEPKOGEI', 'DREUNICE', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(9, 4, 'Gladys', 'Kosgei', 'Gladys', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(10, 4, 'Francisca', 'Murei', 'france', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(11, 4, 'Tecla', 'Kibet', 'tecla2019', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(12, 4, 'ABRAHAM', 'AYABEI', 'ayabei', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2),
(13, 4, 'gloriah', 'murrey', 'mgloriah', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 12),
(14, 4, 'Murrey', 'Gloriah', 'gloriah', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 12),
(15, 4, 'Muigai', 'Njoroge', 'njoroge', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 12),
(16, 4, 'Mary', 'Tuitoek', 'kipkemoi', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(17, 3, 'Beatrice', 'Sawe', 'Beatrice', 'County Drug Stores', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(18, 4, 'Elijah', 'kimaru', 'kimaru', 'County Drug Store', '7c4a8d09ca3762af61e59520943dc26494f8941b', 8),
(19, 4, 'NICHOLAS', 'KOSGEI', 'KOSGEI', 'DRUG STORE', '7c4a8d09ca3762af61e59520943dc26494f8941b', 17);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'Active'),
(2, 'Pending'),
(3, 'In Progress'),
(4, 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `uom`
--

CREATE TABLE `uom` (
  `id` int(11) NOT NULL,
  `quantity` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uom`
--

INSERT INTO `uom` (`id`, `quantity`, `name`) VALUES
(1, 1, '1 Litre'),
(2, 1, '10 Ml Vial'),
(3, 1, '100 Ml'),
(4, 100, '100 Pcs'),
(5, 1000, '1000s'),
(6, 1, '100Gm'),
(7, 1, '100ml'),
(8, 1, '100Ml Bottle'),
(9, 100, '100\'s'),
(10, 100, '100s in Blisters'),
(11, 1, '10Gm'),
(12, 1, '10ML'),
(13, 10, '10\'s'),
(14, 1, '2.5 LITRE BOTTLE'),
(15, 1, '20 LITRE'),
(16, 20, '20 Respules'),
(17, 200, '200 Doses Cartridge'),
(18, 200, '200 Tubes'),
(19, 1, '20gm'),
(20, 25, '25 Test'),
(21, 1, '250Gm Jar'),
(22, 1, '250Ml Bottle'),
(23, 1, '25GM\r\n'),
(24, 1, '25Kg'),
(25, 28, '28\'S'),
(26, 1, '300GM satchet'),
(27, 1, '30Ml'),
(28, 1, '30Ml Vial'),
(29, 30, '30s'),
(30, 1, '35ML'),
(31, 1, '4 Litres'),
(32, 1, '4.5GM'),
(33, 1, '5 Litre Jerrican'),
(34, 1, '5 Ml Bottle'),
(35, 50, '50 Tests'),
(36, 1, '500Ml'),
(37, 1, '500Ml Bottle'),
(38, 1, '50ML'),
(39, 1, '50ml Bottle'),
(40, 576, '576\'S'),
(41, 1, '5Litre'),
(42, 1, '5Ml'),
(43, 1, '5Ml bottle'),
(44, 1, '5ML VIAL'),
(45, 1, '60Ml Bottle'),
(46, 60, '60s'),
(47, 1, '7.5 Ml Bottle'),
(48, 1, '8Ml'),
(49, 90, '90s'),
(50, 1, 'Ampoule'),
(51, 1, 'Booklet'),
(52, 1, 'Bottle'),
(53, 1, 'Bottle Of 35Ml'),
(54, 100, 'Box Of 100'),
(55, 10, 'Box Of 10S'),
(56, 50, 'Box Of 50 Pcs'),
(57, 1, 'Can'),
(58, 1, 'Cartridge'),
(59, 1, 'Co-Pack'),
(60, 12, 'Dozen'),
(61, 1, 'Each'),
(62, 1, 'Kit'),
(63, 50, 'KIT OF 50 TESTS'),
(64, 100, 'Kit X 100 Tests'),
(65, 100, 'Kit X 100 Tests'),
(66, 20, 'Kit X 20 Tests'),
(67, 40, 'Kit X 40 Tests'),
(68, 50, 'Kit X 50 Tests'),
(69, 1, 'meter'),
(70, 1, 'Pack'),
(71, 10, 'Pack Of 10'),
(72, 1000, 'Pack Of 1000S'),
(73, 100, 'Pack Of 100S'),
(74, 10, 'Pack of 10s'),
(75, 120, 'Pack of 120s'),
(76, 125, 'Pack of 125pcs'),
(77, 200, 'Pack Of 200\'S'),
(78, 20, 'Pack Of 20S'),
(79, 25, 'Pack Of 25S'),
(80, 28, 'Pack Of 28S'),
(81, 30, 'Pack Of 30S'),
(82, 36, 'Pack Of 36 Pcs'),
(83, 3, 'Pack Of 3S'),
(84, 50, 'Pack Of 50'),
(85, 50, 'Pack Of 50 Pair'),
(86, 500, 'Pack Of 500S'),
(87, 50, 'Pack Of 50S'),
(88, 5, 'Pack Of 5S'),
(89, 6, 'Pack Of 6S'),
(90, 1, 'Pack Size'),
(91, 1, 'Pair'),
(92, 1, 'Per Set'),
(93, 1, 'Piece'),
(94, 100, 'Pkts X 100Gms'),
(95, 1, 'Roll'),
(96, 1, 'Roll Of 1M'),
(97, 1, 'Set'),
(98, 6, 'Set Of 6'),
(99, 1, 'Syringe'),
(100, 1000, 'Tin Of 1000S'),
(101, 100, 'Tin Of 100S'),
(102, 500, 'Tin Of 500S'),
(103, 1, 'Tube'),
(104, 1, 'Tube 20Gm'),
(105, 1, 'Tube 3.5 Gm'),
(106, 1, 'Tube 5Mg'),
(107, 1, 'TUBE OF 15GM'),
(108, 1, 'Vial'),
(109, 14, 'Pack of 14s'),
(110, 21, '1X21\'S'),
(111, 25, '25\'s');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `denote`
--
ALTER TABLE `denote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispensed`
--
ALTER TABLE `dispensed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispensestatus`
--
ALTER TABLE `dispensestatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispensewl`
--
ALTER TABLE `dispensewl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drug_dispense_codes`
--
ALTER TABLE `drug_dispense_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faccart`
--
ALTER TABLE `faccart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faccartwl`
--
ALTER TABLE `faccartwl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facility_level`
--
ALTER TABLE `facility_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `losses`
--
ALTER TABLE `losses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderf`
--
ALTER TABLE `orderf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prodcartwl`
--
ALTER TABLE `prodcartwl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productcart`
--
ALTER TABLE `productcart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `received`
--
ALTER TABLE `received`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uom`
--
ALTER TABLE `uom`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `denote`
--
ALTER TABLE `denote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dispensed`
--
ALTER TABLE `dispensed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispensestatus`
--
ALTER TABLE `dispensestatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dispensewl`
--
ALTER TABLE `dispensewl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1161;

--
-- AUTO_INCREMENT for table `drug_dispense_codes`
--
ALTER TABLE `drug_dispense_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faccart`
--
ALTER TABLE `faccart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faccartwl`
--
ALTER TABLE `faccartwl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `facility_level`
--
ALTER TABLE `facility_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `losses`
--
ALTER TABLE `losses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderf`
--
ALTER TABLE `orderf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodcartwl`
--
ALTER TABLE `prodcartwl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productcart`
--
ALTER TABLE `productcart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `received`
--
ALTER TABLE `received`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uom`
--
ALTER TABLE `uom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
