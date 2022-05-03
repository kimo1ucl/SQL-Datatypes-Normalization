-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2022 at 02:13 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cars_rdbms_pseudo_keys`
--
CREATE DATABASE IF NOT EXISTS `cars_rdbms_pseudo_keys` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cars_rdbms_pseudo_keys`;

DELIMITER $$
--
-- Functions
--
DROP FUNCTION IF EXISTS `fn_lookup_bodystyle_id`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_lookup_bodystyle_id` (`bodystyle` VARCHAR(30)) RETURNS INT(11) BEGIN                                                           
	DECLARE id INT;                                               
	SELECT bodystyle_id INTO id 
    FROM bodystyle 
    WHERE bodystyle.bodystyle = bodystyle;
RETURN id;                                                      
END$$

DROP FUNCTION IF EXISTS `fn_lookup_color_id`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_lookup_color_id` (`make` VARCHAR(15), `intcolor` VARCHAR(50), `extcolor` VARCHAR(50)) RETURNS INT(11) BEGIN
	DECLARE id INT;
	SELECT color_id INTO id 
    FROM color 
    INNER JOIN make ON make.make_id = color.make_id
    WHERE color.intcolor = IFNULL(nullif(intcolor,''), 'UNK')
    AND   color.extcolor = IFNULL(nullif(extcolor,''), 'UNK')
    AND   make.make = make;
RETURN id;
END$$

DROP FUNCTION IF EXISTS `fn_lookup_engine_id`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_lookup_engine_id` (`make` VARCHAR(15), `model` VARCHAR(30), `engine` VARCHAR(50), `fueltype` VARCHAR(13)) RETURNS INT(11) BEGIN                                                           
	DECLARE id INT;                                               
	SELECT engine_id INTO id 
    FROM engine 
    INNER JOIN model ON model.model_id = engine.model_id
    INNER JOIN make ON make.make_id = model.make_id 
    WHERE engine.engine = engine
    AND  engine.fueltype = fueltype
    AND model.model = model
    AND   make.make = make;
RETURN id;                                                      
END$$

DROP FUNCTION IF EXISTS `fn_lookup_make_id`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_lookup_make_id` (`make` VARCHAR(15)) RETURNS INT(11) BEGIN
	DECLARE id INT;
	SELECT make_id INTO id 
    FROM make 
    WHERE make.make = make ;
RETURN id;
END$$

DROP FUNCTION IF EXISTS `fn_lookup_model_id`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_lookup_model_id` (`make` VARCHAR(15), `model` VARCHAR(30)) RETURNS INT(11) BEGIN
	DECLARE id INT;
	SELECT model_id INTO id 
    FROM model 
    INNER JOIN make ON make.make_id = model.make_id
    WHERE model.model = model
    AND   make.make = make;
RETURN id;
END$$

DROP FUNCTION IF EXISTS `fn_lookup_transmission_id`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_lookup_transmission_id` (`transmission` VARCHAR(10)) RETURNS INT(11) BEGIN                                                           
	DECLARE id INT;                                               
	SELECT transmission_id INTO id 
    FROM transmission 
    WHERE transmission.transmission = IFNULL(nullif(transmission,''), 'UNK');
RETURN id;                                                      
END$$

DROP FUNCTION IF EXISTS `fn_lookup_trim_id`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_lookup_trim_id` (`make` VARCHAR(15), `model` VARCHAR(30), `trim` VARCHAR(50)) RETURNS INT(11) BEGIN                                                           
	DECLARE id INT;                                               
	SELECT trim_id INTO id 
    FROM trim 
    INNER JOIN model ON model.model_id = trim.model_id
    INNER JOIN make ON make.make_id = model.make_id 
    WHERE trim.trim = trim
    AND model.model = model
    AND   make.make = make;
RETURN id;                                                      
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bodystyle`
--

DROP TABLE IF EXISTS `bodystyle`;
CREATE TABLE `bodystyle` (
  `bodystyle_id` int(11) NOT NULL,
  `bodystyle` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bodystyle`
--

INSERT INTO `bodystyle` (`bodystyle_id`, `bodystyle`) VALUES
(1, 'Regular Cab Pickup'),
(2, 'Crew Cab Chassis-Cab'),
(3, 'Sport Utility'),
(4, '4dr Car'),
(5, 'Convertible'),
(6, 'Crew Cab Pickup'),
(7, 'Hatchback'),
(8, '2dr Car'),
(9, 'Extended Cab Pickup'),
(10, 'Regular Cab Chassis-Cab');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `color_id` int(11) NOT NULL,
  `extcolor` varchar(50) NOT NULL,
  `intcolor` varchar(50) NOT NULL,
  `make_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`color_id`, `extcolor`, `intcolor`, `make_id`) VALUES
(1, 'Sonic Blue Metallic', 'Dark Graphite', 1),
(2, 'Oxford White', 'Medium stone', 1),
(3, 'Ginger Ale Metallic', 'Charcoal Black', 1),
(4, 'Classic Silver Metallic', 'Black', 2),
(5, 'Graphite Blue', 'Almond', 3),
(6, 'Sunset Metallic', 'Ebony', 1),
(7, 'Billet Silver Metallic Clearcoat', 'Black', 4),
(8, 'Guard Metallic', 'Black', 1),
(9, 'Black Clearcoat', 'Black', 4),
(10, 'Phantom Black', 'Gray', 5),
(11, 'White Orchid Pearl', 'Gray', 6),
(12, 'Slate Metallic', 'Black', 2),
(13, 'Oxford White', 'Medium Light Stone', 1),
(14, 'Crystal Black Silica', 'Slate Black', 7),
(15, 'Basque Red Pearl II', 'Black', 6),
(16, 'Summit White', 'Jet Black', 8),
(17, 'White Knuckle Clearcoat', 'Ruby Red/Black', 9),
(18, 'Crystal Black Silica', 'Black', 7),
(19, 'Crystal White Pearl', 'Gray', 7),
(20, 'Blue Metallic', 'Charcoal Black', 1),
(21, 'Shadow Black', 'Ebony Black', 1),
(22, 'Cinnamon Glaze Metallic', 'Medium Light Stone', 1),
(23, 'Lightning Blue', 'Dark Earth Gray', 1),
(24, 'Ingot Silver Metallic', 'Charcoal Black', 1),
(25, 'Crystal White Pearl', 'Slate Black', 7),
(26, 'Dark Gray Metallic', 'Black', 7),
(27, 'Shadow Black', 'Ebony', 1),
(28, 'Magnetic Metallic', 'Medium Light Stone', 1),
(29, 'Quartz Blue Pearl', 'Gray', 7),
(30, 'White Clearcoat', 'Black', 4),
(31, 'Lightning Blue Metallic', 'Charcoal Black', 1),
(32, 'Magnetic Metallic', 'Black', 1),
(33, 'Aegean Blue Metallic', 'Black', 6),
(34, 'Brilliant Silver', 'Charcoal', 3),
(35, 'Ingot Silver Metallic', 'Ebony', 1),
(36, 'Shadow Black', 'Cognac', 1),
(37, 'Oxford White', 'Charcoal Black', 1),
(38, 'Magma Red Metallic', 'Black', 1),
(39, 'Shadow Black', 'Charcoal Black', 1),
(40, 'Oxford White', 'Black', 1),
(41, 'Silver Ice Metallic', 'Jet Black', 8),
(42, 'Bright White Clearcoat', 'Diesel Gray/Black', 10),
(43, 'Oxford White', 'Ebony Black', 1),
(44, 'White Gold Metallic', 'Ebony', 1),
(45, 'White Platinum Metallic Tri-Coat', 'Mayan Gray/Umber', 1),
(46, 'Oxford White', 'Ebony', 1),
(47, 'Diamond White', 'Ebony Black', 1),
(48, 'Smoke Metallic', 'Ebony Black', 1),
(49, 'Magnetic Metallic', 'Mayan Gray/Umber', 1),
(50, 'Magnetic Metallic', 'Ebony', 1),
(51, 'Magnetic Metallic', 'Charcoal Black', 1),
(52, 'Lapis Blue Pearl', 'Ivory', 7),
(53, 'Ingot Silver Metallic', 'Medium Stone', 1),
(54, 'Arctic White', 'Adrenaline Red', 8),
(55, 'Island Blue Pearl', 'Black', 7),
(56, 'Dark Gray Metallic', 'Gray', 7),
(57, 'Crimson Red Pearl', 'Gray', 7),
(58, 'Dark Blue Pearl', 'Gray', 7),
(59, 'Velocity Blue Metallic', 'Ebony', 1),
(60, 'Agate Black Metallic', 'Charcoal Black', 1),
(61, 'White Platinum Metallic Tri-Coat', 'Charcoal Black', 1),
(62, 'White Platinum Metallic Tri-Coat', 'Ebony Black w/Fire Orange', 1),
(63, 'Magnetic Metallic', 'Ebony Black w/Red Accent', 1),
(64, 'Ebony Twilight Metallic', 'Jet Black', 11),
(65, 'Ice Silver Metallic', 'Black', 7),
(66, 'Sedona Orange Metallic', 'Charcoal Black', 1),
(67, 'Venetian Red Pearl', 'Black', 7),
(68, 'Ruby Red Metallic Tinted Clearcoat', 'Ebony', 1),
(69, 'Black', 'Jet Black', 8),
(70, 'Agate Black Metallic', 'Ebony Black w/Red Accent', 1),
(71, 'Lightning Blue Metallic', 'Chromite Gray/Chrcl Black', 1),
(72, 'Crimson Red Pearl', 'Ivory', 7),
(73, 'Horizon Blue Pearl', 'Black', 7),
(74, 'Ingot Silver Metallic', 'Black', 1),
(75, 'Blue Metallic', 'Ebony', 1),
(76, 'Aurora Black', 'Black', 12),
(77, 'Ruby Red Metallic Tinted Clearcoat', 'Chromite Gray/Chrcl Black', 1),
(78, 'White Platinum Metallic Tri-Coat', 'Cognac', 1),
(79, 'Dark Gray Metallic', 'Saddle Brown', 7),
(80, 'Agate Black Metallic', 'Ebony', 1),
(81, 'Agate Black Metallic', 'Dark Earth Gray', 1),
(82, 'Jasper Green Metallic', 'Gray', 7),
(83, 'Agate Black Metallic', 'Ebony Black', 1),
(84, 'Sedona Orange Metallic', 'Chromite Gray/Chrcl Black', 1),
(85, 'Crimson Red Pearl', 'Warm Ivory', 7),
(86, 'Granite Clearcoat', 'Black', 9),
(87, 'Magnetic Black Pearl', 'Charcoal', 3),
(88, 'Lightning Blue Metallic', 'Medium Stone', 1),
(89, 'Sedona Orange Metallic', 'Medium Light Stone', 1),
(90, 'Cool Gray Khaki', 'Black', 7),
(91, 'Magnetic Metallic', 'Ebony Black', 1),
(92, 'Magnetite Gray Metallic', 'Titanium Gray', 7),
(93, 'Moonwalk Grey Metallic', 'Carbon Black', 13),
(94, 'Blue Metallic', 'Ebony Black', 1),
(95, 'Ruby Red Metallic Tinted Clearcoat', 'Black', 1),
(96, 'Ebony Black', 'Satin Black', 12),
(97, 'Agate Black', 'Ebony', 1),
(98, 'Crystal Black Pearl', 'Carbon Black', 7),
(99, 'White Platinum Metallic Tri Coat', 'Ebony Black w/Red Accent', 1),
(100, 'White Platinum Metallic Tri-Coat', 'Chromite Gray/Chrcl Black', 1),
(101, 'Black', 'Jet Black/Dark Ash', 8),
(102, 'Magnetic Metallic', 'Chromite Gray/Chrcl Black', 1),
(103, 'Diamond Black Crystal Pearlcoat', 'Diesel Gray/Black', 10),
(104, 'Oxford White', 'Chromite Gray/Chrcl Black', 1),
(105, 'Velocity Blue Metallic', 'Medium Earth Gray', 1),
(106, 'Oxford White', 'RED', 1),
(107, 'Blue Candy Metallic Tinted Clearcoat', 'Ebony Black', 1),
(108, 'Yulong White Metallic', 'Ebony/Ebony', 14),
(109, 'Iconic Silver Metallic', 'Medium Light Camel', 1),
(110, 'Iconic Silver Metallic', 'Ebony', 1),
(111, 'Crystal Black Silica', 'Titanium Gray', 7),
(112, 'Ice Silver Metallic', 'Titanium Gray', 7),
(113, 'Magnetite Gray Metallic', 'Black', 7),
(114, 'Crystal White Pearl', 'Warm Ivory', 7),
(115, 'Magnetite Gray Metallic', 'Slate Black', 7),
(116, 'Infinite Black', 'Ebony', 15),
(117, 'Agate Black Metallic', 'Black', 1),
(118, 'Majestic Black Pearl', 'Ebony', 16),
(119, 'Portofino Gray', 'Black/Black', 5),
(120, 'Oxford White', 'Medium Earth Gray', 1),
(121, 'Crystal White Pearl', 'Gray w/Yellow Stitching', 7),
(122, 'Crystal Black Pearl', 'Black', 7),
(123, 'Crystal White Pearl', 'Black W/Orange Stitching', 7),
(124, 'Infinite Blue Metallic Tinted Clearcoat', 'Ebony', 1),
(125, 'White', 'Java', 1),
(126, 'Galaxy Gray Metallic', 'UNK', 6),
(127, 'Royal Red Metallic', 'Tan', 1),
(128, 'Sterling Gray Metallic', 'Steel Gray', 1),
(129, 'Mineral Gray Metallic', 'Medium Light Stone', 1),
(130, 'Bright White Clearcoat', 'Dark Slate Gray', 4),
(131, 'Crystal Black Pearl', 'Graystone', 16),
(132, 'Titanium Silver', 'Black', 12),
(133, 'Super Black', 'Graphite/White Stitching', 3),
(134, 'Summit White', 'Jet Black/Medium Titanium', 8),
(135, 'Black', 'UNK', 1),
(136, 'Cuvee Silver Metallic', 'UNK', 17),
(137, 'Titanium Flash Mica', 'Black', 18),
(138, 'Red', 'UNK', 1),
(139, 'Osmium Grey Metallic', 'Off-Black', 19),
(140, 'Diamond Black Crystal Pearlcoat', 'Ruby Red/Black', 4),
(141, 'Black Sand Pearl', 'Ash', 2),
(142, 'Modern Steel Metallic', 'Ebony', 16),
(143, 'Platinum Gray Metallic', 'Titan Blk/Palladium Gray', 20),
(144, 'Oxford White', 'Camel', 1),
(145, 'Summit White', 'Dark Atmosphere/Loft Brown', 8),
(146, 'White Platinum Metallic Tri-Coat', 'Ebony Black', 1),
(147, 'Ruby Red Metallic Tinted Clearcoat', 'Ebony Black', 1),
(148, 'Db Black Clearcoat', 'Black', 9),
(149, 'Bright White Clearcoat', 'Black', 4),
(150, 'White Gold', 'UNK', 1),
(151, 'UNK', 'UNK', 1),
(152, 'Soul Red Crystal Metallic', 'Parchment', 18),
(153, 'Octane Red Pearlcoat', 'Black', 9),
(154, 'Austin Yellow Metallic', 'Black', 21),
(155, 'Burgundy Velvet Metallic Tinted Clearcoat', 'Dune', 1),
(156, 'White', 'UNK', 1),
(157, 'Black', 'UNK', 15),
(158, 'Silver', 'UNK', 6),
(159, 'Gray', 'UNK', 1),
(160, 'Blue', 'UNK', 1),
(161, 'Laser Blue Pearlcoat', 'Black', 4),
(162, 'Sangria Metallic Clearcoat', 'Black', 4),
(163, 'Oxford White', 'UNK', 1),
(164, 'Brilliant Silver Metallic', 'Steel', 3),
(165, 'Lightning Blue Metallic', 'Ebony', 1),
(166, 'White Platinum Tri-Coat', 'Ebony', 1),
(167, 'White Platinum Metallic Tri-Coat', 'Ebony', 1),
(168, 'Burgundy', 'UNK', 1),
(169, 'Deep Crystal Blue Mica', 'Black', 18),
(170, 'White', 'UNK', 15),
(171, 'Red', 'UNK', 6),
(172, 'Summit White', 'Jet Black', 11),
(173, 'Dark Gray Metallic', 'Carbon Black', 7),
(174, 'Caspian Blue Metallic', 'Charcoal', 3),
(175, 'Ruby Red Metallic Tinted Clearcoat', 'Medium Stone', 1),
(176, 'Soul Red Crystal Metallic', 'Black', 18),
(177, 'Silver', 'UNK', 1),
(178, 'Crystal Black Pearl', 'Warm Ivory', 7),
(179, 'Silver', 'UNK', 2),
(180, 'Snowflake White Pearl Mica', 'Black', 18),
(181, 'Blue Metallic', 'Ebony Black w/Red Accent', 1),
(182, 'Baltic Sea Green Metallic', 'Ebony', 1),
(183, 'Agate Black', 'Dark Earth Gray', 1),
(184, 'Granite Crystal Metallic Clearcoat', 'Black', 4),
(185, 'Infinite Black Metallic', 'Cappuccino', 15),
(186, 'White Platinum Metallic Tri Coat', 'UNK', 1),
(187, 'Magnetic Metallic', 'UNK', 1),
(188, 'White', 'UNK', 6),
(189, 'Black', 'UNK', 16),
(190, 'Blueprint', 'Black', 2),
(191, 'Black', 'UNK', 2),
(192, 'Grabber Lime', 'Ebony w/Smoke Gray', 1),
(193, 'White Knuckle Clearcoat', 'Black', 9),
(194, 'White', 'UNK', 19),
(195, 'Crystal Black Silica', 'Gray', 7),
(196, 'Star White Metallic Tri-Coat', 'Soft Ceramic', 1),
(197, 'Billet Silver Metallic Clearcoat', 'Black', 10),
(198, 'Mosaic Black Metallic', 'Jet Black', 8);

-- --------------------------------------------------------

--
-- Table structure for table `engine`
--

DROP TABLE IF EXISTS `engine`;
CREATE TABLE `engine` (
  `engine_id` int(11) NOT NULL,
  `engine` varchar(50) NOT NULL,
  `fueltype` varchar(13) NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `engine`
--

INSERT INTO `engine` (`engine_id`, `engine`, `fueltype`, `model_id`) VALUES
(1, '5.4L V8 16V MPFI SOHC Supercharged', 'Gasoline Fuel', 1),
(2, '6.4L V8 32V DDI OHV Twin Turbo Diesel', 'Diesel Fuel', 2),
(3, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 3),
(4, '1.8L I4 16V MPFI DOHC', 'Gasoline Fuel', 4),
(5, '2.5L I4 16V MPFI DOHC', 'Gasoline Fuel', 5),
(6, '4 Cyl - 1.5 L', 'Gasoline Fuel', 6),
(7, '3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 7),
(8, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 1),
(9, '2.4L I4 16V GDI DOHC', 'Gasoline Fuel', 8),
(10, '3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 9),
(11, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 10),
(12, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 3),
(13, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 11),
(14, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 12),
(15, '1.8L I4 16V MPFI DOHC', 'Gasoline Fuel', 13),
(16, '6.4L V8 16V MPFI OHV', 'Gasoline Fuel', 14),
(17, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 15),
(18, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 16),
(19, '2.7L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 1),
(20, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 17),
(21, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 18),
(22, '2.4L I4 16V MPFI SOHC', 'Gasoline Fuel', 19),
(23, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 20),
(24, '5.0L V8 32V PDI DOHC', 'Gasoline Fuel', 1),
(25, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 21),
(26, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 22),
(27, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 23),
(28, '1.4L I4 16V MPFI DOHC Turbo', 'Gasoline Fuel', 24),
(29, '5.7L V8 16V MPFI OHV', 'Gasoline Fuel', 25),
(30, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 6),
(31, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 26),
(32, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 6),
(33, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 27),
(34, '6 Cyl - 2.7 L', 'Gasoline Fuel', 1),
(35, '4 Cyl - 2.0 L', 'Gasoline Fuel', 23),
(36, '6.2L V8 16V GDI OHV', 'Gasoline Fuel', 28),
(37, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 15),
(38, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 16),
(39, '3.6L V6 24V GDI DOHC', 'Gasoline Fuel', 29),
(40, '3.6L V6 24V GDI DOHC', 'Gasoline Fuel', 30),
(41, '3.5L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 1),
(42, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 31),
(43, '2.0L I4 16V MPFI DOHC', 'Gasoline Fuel', 32),
(44, '3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 33),
(45, '1.0L I3 12V GDI DOHC Turbo', 'Gasoline Fuel', 23),
(46, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 16),
(47, '2.7L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 22),
(48, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 34),
(49, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 35),
(50, '3.6L H6 24V MPFI DOHC', 'Gasoline Fuel', 11),
(51, '2.4L I4 16V GDI DOHC', 'Gasoline Fuel', 36),
(52, '2.0L H4 16V GDI DOHC Turbo', 'Gasoline Fuel', 37),
(53, '3.3L V6 24V PDI DOHC Flexible Fuel', 'Gasoline Fuel', 1),
(54, '6 Cyl - 3.5 L', 'Gasoline Fuel', 16),
(55, '4 Cyl - 2.0 L', 'Gasoline Fuel', 3),
(56, '8 Cyl - 5.0 L', 'Gasoline Fuel', 1),
(57, '4 Cyl - 2.0 L', 'Gasoline Fuel', 22),
(58, '4 Cyl - 1.6 L', 'Gasoline Fuel', 38),
(59, '4 Cyl - 2.0 L', 'Gasoline Fuel', 39),
(60, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 11),
(61, '1.5L I3 12V GDI DOHC Turbo', 'Gasoline Fuel', 3),
(62, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 34),
(63, '2.4L H4 16V GDI DOHC Turbo', 'Gasoline Fuel', 40),
(64, '3.5L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 41),
(65, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 42),
(66, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 43),
(67, '8 Cyl - 7.3 L', 'Gasoline Fuel', 44),
(68, '2.0L', 'Gasoline Fuel', 17),
(69, '6 Cyl - 3.0 L', 'Gasoline Fuel', 16),
(70, '6.2L V8 16V MPFI SOHC Flexible Fuel', 'Gasoline Fuel', 45),
(71, '4 Cyl - 1.8 L', 'Gasoline Fuel', 46),
(72, '5.4L V8 24V MPFI SOHC Flexible Fuel', 'Flex Fuel', 1),
(73, '5.0L V8 32V MPFI DOHC Flexible Fuel', 'Flex Fuel', 1),
(74, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 22),
(75, '2.4L I4 16V MPFI DOHC', 'Gasoline Fuel', 47),
(76, '3.5L V6 24V GDI SOHC', 'Gasoline Fuel', 48),
(77, '3.3L V6 24V GDI DOHC', 'Gasoline Fuel', 36),
(78, '4.0L V6 24V MPFI DOHC', 'Gasoline Fuel', 49),
(79, '6 Cyl - 3.6 L', 'Gasoline Fuel', 7),
(80, '4 Cyl - 1.8 L', 'Gasoline Fuel', 50),
(81, '1.6L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 3),
(82, '2.0L I4 16V GDI DOHC Turbo Flexible Fuel', 'Gasoline Fuel', 51),
(83, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 52),
(84, '5.7L V8 16V MPFI OHV', 'Gasoline Fuel', 53),
(85, '6.7L I6 24V DDI OHV Turbo Diesel', 'Diesel Fuel', 54),
(86, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 55),
(87, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 56),
(88, '3.5L V6 24V MPFI SOHC', 'Gasoline Fuel', 42),
(89, '1.4L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 57),
(90, '6.2L V8 16V MPFI SOHC Flexible Fuel', 'Gasoline Fuel', 58),
(91, '4 Cyl - 2.0 L', 'Gasoline Fuel', 27),
(92, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 59),
(93, '3.2L V6 24V MPFI DOHC', 'Gasoline Fuel', 60),
(94, '2.5L I4 16V GDI DOHC', 'Gasoline Fuel', 61),
(95, '3.0L I6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 62),
(96, '3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 63),
(97, '3.5L V6 24V MPFI DOHC Flexible Fuel', 'Gasoline Fuel', 64),
(98, '2.7L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 65),
(99, '6 Cyl - 3.6 L', 'Gasoline Fuel', 66),
(100, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 67),
(101, '2.5L I4 16V GDI DOHC', 'Gasoline Fuel', 29),
(102, '3.5L V6 24V GDI DOHC', 'Gasoline Fuel', 68),
(103, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 69),
(104, '3.5L V6 24V PDI DOHC', 'Gasoline Fuel', 70),
(105, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 52),
(106, '5.3L V8 16V GDI OHV', 'Flex Fuel', 71),
(107, '4 Cyl - 2.3 L', 'Gasoline Fuel', 31),
(108, '4 Cyl - 1.5 L', 'Gasoline Fuel', 12),
(109, '6 Cyl - 3.5 L', 'Gasoline Fuel', 72),
(110, '2.5L I4 16V PDI DOHC', 'Gasoline Fuel', 73),
(111, '5.7L V8 32V MPFI DOHC', 'Gasoline Fuel', 74),
(112, '5.2L V8 32V MPFI DOHC Supercharged', 'Gasoline Fuel', 21),
(113, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 75),
(114, '3.6L V6 24V MPFI DOHC', 'Hybrid Fuel', 25),
(115, '2.5L I4 16V PDI DOHC Hybrid', 'Hybrid Fuel', 73),
(116, '3.6L V6 24V GDI DOHC', 'Gasoline Fuel', 76);

-- --------------------------------------------------------

--
-- Table structure for table `make`
--

DROP TABLE IF EXISTS `make`;
CREATE TABLE `make` (
  `make_id` int(11) NOT NULL,
  `make` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `make`
--

INSERT INTO `make` (`make_id`, `make`) VALUES
(1, 'Ford'),
(2, 'Toyota'),
(3, 'Nissan'),
(4, 'Jeep'),
(5, 'Hyundai'),
(6, 'Honda'),
(7, 'Subaru'),
(8, 'Chevrolet'),
(9, 'Dodge'),
(10, 'RAM'),
(11, 'GMC'),
(12, 'Kia'),
(13, 'MINI'),
(14, 'Land Rover'),
(15, 'Lincoln'),
(16, 'Acura'),
(17, 'Audi'),
(18, 'Mazda'),
(19, 'Volvo'),
(20, 'Volkswagen'),
(21, 'BMW');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `model_id` int(11) NOT NULL,
  `model` varchar(30) NOT NULL,
  `make_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`model_id`, `model`, `make_id`) VALUES
(1, 'F-150', 1),
(2, 'Super Duty F-550 DRW', 1),
(3, 'Escape', 1),
(4, 'Corolla', 2),
(5, 'Rogue', 3),
(6, 'Fusion', 1),
(7, 'Wrangler Unlimited', 4),
(8, 'Sonata', 5),
(9, 'Wrangler', 4),
(10, 'Civic Sedan', 6),
(11, 'Outback', 7),
(12, 'CR-V', 6),
(13, 'Sonic', 8),
(14, 'Charger', 9),
(15, 'Forester', 7),
(16, 'Explorer', 1),
(17, 'Crosstrek', 7),
(18, 'Fusion Energi', 1),
(19, 'Compass', 4),
(20, 'Expedition', 1),
(21, 'Mustang', 1),
(22, 'Edge', 1),
(23, 'EcoSport', 1),
(24, 'Trax', 8),
(25, '1500', 10),
(26, 'Fusion Hybrid', 1),
(27, 'Impreza', 7),
(28, 'Corvette', 8),
(29, 'Acadia', 11),
(30, 'Colorado', 8),
(31, 'Ranger', 1),
(32, 'Forte', 12),
(33, 'Durango', 9),
(34, 'Legacy', 7),
(35, 'Convertible', 13),
(36, 'Sorento', 12),
(37, 'WRX', 7),
(38, 'Fiesta', 1),
(39, 'Discovery Sport', 14),
(40, 'Ascent', 7),
(41, 'Navigator', 15),
(42, 'RDX', 16),
(43, 'Santa Fe', 5),
(44, 'F-550 DRW', 1),
(45, 'F-250', 1),
(46, 'Civic Sdn', 6),
(47, 'Patriot', 4),
(48, 'RLX', 16),
(49, 'Frontier', 3),
(50, 'Cruze', 8),
(51, 'Q5', 17),
(52, 'Flex', 1),
(53, '2500', 10),
(54, '5500', 10),
(55, 'Mazda3', 18),
(56, 'XC60', 19),
(57, 'Jetta', 20),
(58, 'Super Duty F-250 SRW', 1),
(59, 'Malibu', 8),
(60, 'Cherokee', 4),
(61, 'Mazda CX-5', 18),
(62, 'M3', 21),
(63, 'Wrangler JK Unlimited', 4),
(64, 'Taurus', 1),
(65, 'Continental', 15),
(66, 'Grand Cherokee', 4),
(67, 'MKC', 15),
(68, 'Pathfinder', 3),
(69, 'Mazda CX-3', 18),
(70, 'Highlander', 2),
(71, 'Tahoe', 8),
(72, 'MDX', 16),
(73, 'RAV4', 2),
(74, 'Tundra', 2),
(75, 'XC90', 19),
(76, 'Traverse', 8);

-- --------------------------------------------------------

--
-- Table structure for table `transmission`
--

DROP TABLE IF EXISTS `transmission`;
CREATE TABLE `transmission` (
  `transmission_id` int(11) NOT NULL,
  `transmission` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transmission`
--

INSERT INTO `transmission` (`transmission_id`, `transmission`) VALUES
(1, 'Automatic'),
(2, 'Variable'),
(3, 'Manual'),
(4, 'UNK');

-- --------------------------------------------------------

--
-- Table structure for table `trim`
--

DROP TABLE IF EXISTS `trim`;
CREATE TABLE `trim` (
  `trim_id` int(11) NOT NULL,
  `trim` varchar(35) NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trim`
--

INSERT INTO `trim` (`trim_id`, `trim`, `model_id`) VALUES
(1, 'Lightning', 1),
(2, 'XL Open Service Body', 2),
(3, 'Titanium 4WD', 3),
(4, 'S', 4),
(5, 'S AWD', 5),
(6, 'SE', 6),
(7, 'Sport 4WD', 7),
(8, 'Platinum SuperCrew', 1),
(9, '2.4L SE', 8),
(10, 'Rubicon Hard Rock 4WD', 9),
(11, 'EX-T', 10),
(12, 'S Plus', 4),
(13, 'SE 4WD', 3),
(14, 'Premium AWD', 11),
(15, 'EX AWD', 12),
(16, 'LT', 13),
(17, 'R/T Scat Pack', 14),
(18, 'Touring AWD', 15),
(19, 'Limited Awd', 15),
(20, 'SEL 4WD', 3),
(21, 'XLT 4WD', 16),
(22, 'XL SuperCrew', 1),
(23, 'Limited Awd', 11),
(24, 'Limited Awd', 17),
(25, 'SE', 18),
(26, 'Limited 4X4', 19),
(27, 'Limited 4X4', 20),
(28, 'SV', 5),
(29, 'EcoBoost', 21),
(30, 'Titanium AWD', 22),
(31, 'SE 4WD', 23),
(32, 'XLT', 1),
(33, 'XLT SuperCrew', 1),
(34, 'LT AWD', 24),
(35, 'Big Horn Crew Cab', 25),
(36, 'Titanium', 6),
(37, 'Limited', 15),
(38, 'SEL AWD', 22),
(39, 'SE', 26),
(40, 'Premium Awd', 15),
(41, 'SES 4WD', 23),
(42, 'AWD', 27),
(43, '4WD', 16),
(44, 'Stingray 1LT', 28),
(45, 'Sport AWD', 15),
(46, 'Sport 4WD', 15),
(47, 'Sport 4WD', 16),
(48, 'SLT AWD', 29),
(49, 'Titanium', 18),
(50, '4WD LT Crew Cab', 30),
(51, 'Premium AWD', 27),
(52, 'LARIAT SuperCrew', 1),
(53, 'XLT 4WD SuperCrew', 31),
(54, 'S', 32),
(55, 'Premium Awd', 17),
(56, 'XLT 4X4', 20),
(57, 'AWD', 15),
(58, 'SEL AWD', 3),
(59, 'SXT AWD', 33),
(60, 'SV AWD', 5),
(61, 'S', 23),
(62, 'SE AWD', 22),
(63, 'ST AWD', 22),
(64, 'Premium Awd', 34),
(65, 'Cooper S', 35),
(66, 'Platinum 4WD', 16),
(67, 'LX AWD', 36),
(68, 'Touring 4WD', 15),
(69, 'Premium Awd', 37),
(70, 'SE', 3),
(71, '4WD Crew Cab', 30),
(72, 'BIG HORN BLACK QUAD CAB 4X4', 25),
(73, 'XL SuperCab', 1),
(74, 'LARIAT SuperCrew', 31),
(75, 'SE', 38),
(76, 'SE 4WD', 39),
(77, 'SE AWD', 3),
(78, 'Limited Awd', 34),
(79, 'Limited Awd', 40),
(80, 'Reserve 4X4', 41),
(81, 'SH-AWD w/Technology Pkg', 42),
(82, 'Limited AWD', 43),
(83, 'XL 4WD 12FT LANDSCAPE DUMP', 44),
(84, 'Sport AWD', 17),
(85, 'ST 4WD', 16),
(86, 'King Ranch Crew Cab', 45),
(87, 'EX', 46),
(88, 'Lariat', 1),
(89, 'SEL', 22),
(90, 'Latitude', 47),
(91, 'Tech Pkg', 48),
(92, 'LX', 36),
(93, 'PRO-4X', 49),
(94, 'Rubicon', 7),
(95, 'LS', 50),
(96, 'Premium Plus', 51),
(97, 'SEL', 52),
(98, 'Tradesman', 53),
(99, 'Tradesman', 54),
(100, 'i Touring', 55),
(101, 'Sport', 22),
(102, 'Dynamic', 56),
(103, 'Trailhawk', 19),
(104, 'LE', 4),
(105, 'Base', 42),
(106, '1.4T S', 57),
(107, 'Lariat', 58),
(108, 'Premium', 27),
(109, 'LT', 59),
(110, 'SE', 23),
(111, 'XLT', 16),
(112, 'Sport', 16),
(113, 'SE', 22),
(114, 'GT', 33),
(115, 'Limited', 60),
(116, 'Limited', 52),
(117, 'Grand Touring', 61),
(118, 'SEL', 3),
(119, 'Base', 62),
(120, 'Sport S', 63),
(121, 'Limited', 64),
(122, 'Reserve', 65),
(123, 'EX-L', 10),
(124, 'Latitude', 19),
(125, 'High Altitude', 66),
(126, 'SV', 49),
(127, 'LARIAT', 31),
(128, 'Premium', 17),
(129, 'SE', 52),
(130, 'Limited', 20),
(131, 'Touring', 61),
(132, 'ST', 22),
(133, 'Raptor', 1),
(134, 'Select', 67),
(135, 'XLT', 31),
(136, 'Titanium', 3),
(137, 'EX', 12),
(138, 'SLE', 29),
(139, 'Premium', 37),
(140, 'SV', 68),
(141, 'XLT', 20),
(142, 'Touring', 69),
(143, 'Limited', 40),
(144, 'Base', 70),
(145, 'Limited EcoBoost', 52),
(146, 'LT', 71),
(147, 'Base', 31),
(148, 'Base', 72),
(149, 'XLE Premium', 73),
(150, 'Premium', 11),
(151, 'Base', 74),
(152, 'Shelby GT500', 21),
(153, 'GT Plus', 33),
(154, 'Big Horn', 25),
(155, 'Momentum', 75),
(156, 'Titanium', 22),
(157, 'Hybrid Limited', 73),
(158, 'LT Leather', 76);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `make_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `trim_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `transmission_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `engine_id` int(11) NOT NULL,
  `vehicletype` varchar(4) NOT NULL,
  `bodystyle_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `vin` char(17) NOT NULL,
  `modelcode` varchar(11) DEFAULT NULL,
  `stocknum` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`make_id`, `model_id`, `year`, `trim_id`, `color_id`, `transmission_id`, `price`, `engine_id`, `vehicletype`, `bodystyle_id`, `name`, `vin`, `modelcode`, `stocknum`) VALUES
(4, 63, 2018, 120, 7, 1, 34495, 96, 'used', 5, '2018 Jeep Wrangler JK Unlimited Sport S', '1C4BJWDG0JL931484', 'JKJM74', 'U14076'),
(4, 7, 2015, 7, 7, 1, 24999, 7, 'used', 5, '2015 Jeep Wrangler Unlimited Sport 4WD', '1C4BJWDG8FL544401', 'JKJM74', 'US4926'),
(4, 7, 2015, 7, 9, 1, 26499, 7, 'used', 5, '2015 Jeep Wrangler Unlimited Sport 4WD', '1C4BJWDGXFL609653', 'JKJM74', 'US5212'),
(4, 9, 2016, 10, 9, 1, 33999, 10, 'used', 5, '2016 Jeep Wrangler Rubicon Hard Rock 4WD', '1C4HJWCGXGL167986', 'JKJS72', 'US4754'),
(4, 7, 2014, 94, 9, 1, 32995, 79, 'used', 5, '2014 Jeep Wrangler Unlimited Rubicon', '1C4HJWFG8EL189011', 'JKJS74', 'U30061'),
(4, 47, 2014, 90, 130, 1, 16495, 75, 'used', 3, '2014 Jeep Patriot Latitude', '1C4NJRFB0ED617009', 'MKJM74', 'U30020'),
(4, 60, 2019, 115, 184, 1, 27995, 93, 'used', 3, '2019 Jeep Cherokee Limited', '1C4PJMDX3KD384927', 'KLJP74', 'U30053'),
(4, 60, 2018, 115, 149, 1, 29995, 93, 'used', 3, '2018 Jeep Cherokee Limited', '1C4PJMDX9JD549197', 'KLJP74', 'U14040'),
(9, 33, 2019, 59, 86, 1, 30999, 44, 'used', 3, '2019 Dodge Durango SXT AWD', '1C4RDJAG9KC781356', 'WDEL75', 'US5073'),
(9, 33, 2020, 153, 193, 1, 40495, 44, 'used', 3, '2020 Dodge Durango GT Plus', '1C4RDJDG1LC229881', 'WDEH75', 'U30005'),
(9, 33, 2018, 114, 153, 1, 32995, 44, 'used', 3, '2018 Dodge Durango GT', '1C4RDJDG3JC409327', 'WDEH75', 'U14053'),
(9, 33, 2018, 114, 148, 1, 38795, 44, 'used', 3, '2018 Dodge Durango GT', '1C4RDJDG5JC452129', 'WDEH75', 'U14149'),
(4, 66, 2018, 125, 162, 1, 41995, 99, 'used', 3, '2018 Jeep Grand Cherokee High Altitude', '1C4RJFCG0JC504144', 'WKJS74', 'U30060'),
(10, 25, 2018, 35, 42, 1, 35799, 29, 'used', 6, '2018 RAM 1500 Big Horn Crew Cab', '1C6RR7LT9JS281823', 'DS6H98', 'US5037'),
(10, 25, 2021, 154, 197, 1, 44995, 114, 'used', 6, '2021 RAM 1500 Big Horn', '1C6RRFFG7MN645135', 'DT6H98', 'U14004'),
(10, 25, 2019, 72, 103, 1, 39999, 29, 'used', 6, '2019 RAM 1500 BIG HORN BLACK QUAD CAB 4X4', '1C6SRFBT1KN546442', 'DT6H41', 'US5238'),
(10, 25, 2020, 154, 103, 1, 41995, 29, 'used', 6, '2020 RAM 1500 Big Horn', '1C6SRFBT4LN224394', 'DT6H41', 'U14078'),
(1, 21, 2020, 152, 192, 1, 89995, 112, 'used', 8, '2020 Ford Mustang Shelby GT500', '1FA6P8SJ9L5503579', 'P8S', 'U14052'),
(1, 21, 2018, 29, 35, 1, 25999, 25, 'used', 8, '2018 Ford Mustang EcoBoost', '1FA6P8TH3J5127356', 'P8T', 'US4941'),
(1, 64, 2018, 121, 156, 1, 26995, 97, 'used', 4, '2018 Ford Taurus Limited', '1FAHP2F85JG118129', 'P2F', 'U30001'),
(1, 2, 2008, 2, 2, 1, 16999, 2, 'used', 2, '2008 Ford Super Duty F-550 DRW XL Open Service Body', '1FDAW57R18ED13508', 'W57', 'US4891'),
(1, 44, 2020, 83, 120, 1, 72999, 67, 'used', 10, '2020 Ford F-550 DRW XL 4WD 12FT LANDSCAPE DUMP', '1FDUF5HN3LEE11568', 'F5H', 'US5273'),
(1, 16, 2018, 43, 53, 1, 27999, 18, 'used', 3, '2018 Ford Explorer 4WD', '1FM5K8B81JGC20933', 'K8B', 'US5267'),
(1, 16, 2019, 21, 91, 1, 34999, 54, 'used', 3, '2019 Ford Explorer XLT 4WD', '1FM5K8D80KGB32549', 'K8D', 'US5275'),
(1, 16, 2019, 21, 83, 1, 35999, 18, 'used', 3, '2019 Ford Explorer XLT 4WD', '1FM5K8D82KGB19060', 'K8D', 'US5220'),
(1, 16, 2019, 21, 43, 1, 34999, 18, 'used', 3, '2019 Ford Explorer XLT 4WD', '1FM5K8D82KGB32536', 'K8D', 'US5263'),
(1, 16, 2018, 111, 43, 1, 33995, 18, 'used', 3, '2018 Ford Explorer XLT', '1FM5K8D83JGA62155', 'K8D', 'U14086'),
(1, 16, 2019, 21, 91, 1, 35999, 18, 'used', 3, '2019 Ford Explorer XLT 4WD', '1FM5K8D83KGA43879', 'K8D', 'US5231'),
(1, 16, 2019, 111, 168, 1, 32995, 18, 'used', 3, '2019 Ford Explorer XLT', '1FM5K8D83KGA57085', 'K8D', 'U14139'),
(1, 16, 2019, 21, 62, 1, 33799, 18, 'used', 3, '2019 Ford Explorer XLT 4WD', '1FM5K8D83KGB33078', 'K8D', 'US4826'),
(1, 16, 2018, 21, 21, 1, 30999, 18, 'used', 3, '2018 Ford Explorer XLT 4WD', '1FM5K8D84JGC20938', 'K8D', 'US4758'),
(1, 16, 2018, 111, 147, 1, 31495, 18, 'used', 3, '2018 Ford Explorer XLT', '1FM5K8D85JGC11312', 'K8D', 'U13983'),
(1, 16, 2019, 21, 83, 1, 33999, 18, 'used', 3, '2019 Ford Explorer XLT 4WD', '1FM5K8D86KGA02033', 'K8D', 'US5041'),
(1, 16, 2018, 111, 163, 1, 26945, 54, 'used', 3, '2018 Ford Explorer XLT', '1FM5K8D87JGB50237', 'K8D', 'U14125'),
(1, 16, 2018, 21, 43, 1, 29999, 18, 'used', 3, '2018 Ford Explorer XLT 4WD', '1FM5K8D87JGC30038', 'K8D', 'US5039'),
(1, 16, 2019, 21, 91, 1, 34999, 54, 'used', 3, '2019 Ford Explorer XLT 4WD', '1FM5K8D88KGA57082', 'K8D', 'US5276'),
(1, 16, 2019, 111, 186, 1, 34995, 54, 'used', 3, '2019 Ford Explorer XLT', '1FM5K8D88KGA82452', 'K8D', 'U14124'),
(1, 16, 2019, 21, 43, 1, 33499, 18, 'used', 3, '2019 Ford Explorer XLT 4WD', '1FM5K8D88KGA99591', 'K8D', 'US5050'),
(1, 16, 2018, 111, 160, 1, 34495, 18, 'used', 3, '2018 Ford Explorer XLT', '1FM5K8D89JGC50680', 'K8D', 'U30027'),
(1, 16, 2019, 21, 28, 1, 33499, 18, 'used', 3, '2019 Ford Explorer XLT 4WD', '1FM5K8D89KGA48259', 'K8D', 'US4793'),
(1, 16, 2019, 111, 94, 1, 33995, 18, 'used', 3, '2019 Ford Explorer XLT', '1FM5K8D89KGB32808', 'K8D', 'U14140'),
(1, 16, 2019, 21, 91, 1, 33499, 18, 'used', 3, '2019 Ford Explorer XLT 4WD', '1FM5K8D8XKGA74837', 'K8D', 'US5117'),
(1, 16, 2018, 111, 94, 1, 31995, 46, 'used', 3, '2018 Ford Explorer XLT', '1FM5K8DH1JGB37967', 'K8D', 'U14011'),
(1, 16, 2019, 21, 43, 1, 33999, 46, 'used', 3, '2019 Ford Explorer XLT 4WD', '1FM5K8DH7KGB18857', 'K8D', 'US5088'),
(1, 16, 2021, 85, 124, 1, 54999, 69, 'used', 3, '2021 Ford Explorer ST 4WD', '1FM5K8GC6MGA66270', 'K8G', 'US5288'),
(1, 16, 2018, 112, 63, 1, 35995, 38, 'used', 3, '2018 Ford Explorer Sport', '1FM5K8GT0JGC46968', 'K8G', 'U13992'),
(1, 16, 2019, 47, 63, 1, 38999, 38, 'used', 3, '2019 Ford Explorer Sport 4WD', '1FM5K8GT0KGB32552', 'K8G', 'US4832'),
(1, 16, 2019, 47, 99, 1, 38499, 38, 'used', 3, '2019 Ford Explorer Sport 4WD', '1FM5K8GT3KGA57099', 'K8G', 'US5189'),
(1, 16, 2019, 47, 70, 1, 39658, 38, 'used', 3, '2019 Ford Explorer Sport 4WD', '1FM5K8GT3KGB00047', 'K8G', 'US4910'),
(1, 16, 2019, 112, 181, 1, 40995, 38, 'used', 3, '2019 Ford Explorer Sport', '1FM5K8GT5KGB51131', 'K8G', 'U14094'),
(1, 16, 2019, 47, 70, 1, 39999, 38, 'used', 3, '2019 Ford Explorer Sport 4WD', '1FM5K8GT7KGA02008', 'K8G', 'US5262'),
(1, 16, 2019, 66, 94, 1, 43499, 38, 'used', 3, '2019 Ford Explorer Platinum 4WD', '1FM5K8HTXKGA67319', 'K8H', 'US5151'),
(1, 3, 2019, 70, 100, 1, 23499, 12, 'used', 3, '2019 Ford Escape SE', '1FMCU0GD2KUA57981', 'U0G', 'US5203'),
(1, 3, 2020, 77, 81, 1, 28999, 61, 'used', 3, '2020 Ford Escape SE AWD', '1FMCU9G64LUA04190', 'U9G', 'US5099'),
(1, 3, 2020, 70, 151, 1, 28795, 61, 'used', 3, '2020 Ford Escape SE', '1FMCU9G66LUB85423', 'U9G', 'U14175'),
(1, 3, 2019, 70, 177, 1, 28495, 12, 'used', 3, '2019 Ford Escape SE', '1FMCU9GD0KUA66408', 'U9G', 'U30025'),
(1, 3, 2019, 13, 89, 1, 22999, 12, 'used', 3, '2019 Ford Escape SE 4WD', '1FMCU9GD1KUA84447', 'U9G', 'US5114'),
(1, 3, 2019, 13, 102, 1, 26999, 12, 'used', 3, '2019 Ford Escape SE 4WD', '1FMCU9GD2KUA08963', 'U9G', 'US5222'),
(1, 3, 2018, 13, 22, 1, 21999, 12, 'used', 3, '2018 Ford Escape SE 4WD', '1FMCU9GD3JUA77241', 'U9G', 'US4761'),
(1, 3, 2018, 13, 39, 1, 22799, 12, 'used', 3, '2018 Ford Escape SE 4WD', '1FMCU9GD3JUD12365', 'U9G', 'US5022'),
(1, 3, 2018, 70, 151, 1, 23795, 12, 'used', 3, '2018 Ford Escape SE', '1FMCU9GD3JUD40196', 'U9G', 'U14172'),
(1, 3, 2018, 13, 28, 1, 21799, 12, 'used', 3, '2018 Ford Escape SE 4WD', '1FMCU9GD4JUD25092', 'U9G', 'US4810'),
(1, 3, 2019, 13, 84, 1, 23999, 12, 'used', 3, '2019 Ford Escape SE 4WD', '1FMCU9GD5KUA00615', 'U9G', 'US5264'),
(1, 3, 2019, 13, 104, 1, 25999, 12, 'used', 3, '2019 Ford Escape SE 4WD', '1FMCU9GD5KUA57333', 'U9G', 'US5233'),
(1, 3, 2019, 13, 100, 1, 24699, 12, 'used', 3, '2019 Ford Escape SE 4WD', '1FMCU9GD5KUB74085', 'U9G', 'US5214'),
(1, 3, 2018, 70, 150, 1, 22795, 12, 'used', 3, '2018 Ford Escape SE', '1FMCU9GD7JUB93817', 'U9G', 'U14155'),
(1, 3, 2018, 13, 31, 1, 21499, 12, 'used', 3, '2018 Ford Escape SE 4WD', '1FMCU9GD7JUC24743', 'U9G', 'US4859'),
(1, 3, 2019, 13, 71, 1, 24499, 12, 'used', 3, '2019 Ford Escape SE 4WD', '1FMCU9GD7KUA84436', 'U9G', 'US4923'),
(1, 3, 2019, 70, 104, 1, 25995, 12, 'used', 3, '2019 Ford Escape SE', '1FMCU9GD7KUB19086', 'U9G', 'U14059'),
(1, 3, 2019, 70, 28, 1, 25495, 12, 'used', 3, '2019 Ford Escape SE', '1FMCU9GD7KUB43582', 'U9G', 'U14162'),
(1, 3, 2017, 13, 13, 1, 20799, 12, 'used', 3, '2017 Ford Escape SE 4WD', '1FMCU9GD9HUE61745', 'U9G', 'US4968'),
(1, 3, 2019, 13, 77, 1, 20999, 12, 'used', 3, '2019 Ford Escape SE 4WD', '1FMCU9GD9KUA28126', 'U9G', 'US5004'),
(1, 3, 2018, 13, 37, 1, 21799, 12, 'used', 3, '2018 Ford Escape SE 4WD', '1FMCU9GDXJUD25064', 'U9G', 'US4960'),
(1, 3, 2019, 13, 84, 1, 23799, 12, 'used', 3, '2019 Ford Escape SE 4WD', '1FMCU9GDXKUB42104', 'U9G', 'US5034'),
(1, 3, 2015, 70, 135, 1, 14995, 81, 'used', 3, '2015 Ford Escape SE', '1FMCU9GX0FUB67657', 'U9G', 'U14016'),
(1, 3, 2020, 58, 46, 1, 30499, 61, 'used', 3, '2020 Ford Escape SEL AWD', '1FMCU9H67LUA19751', 'U9H', 'US5123'),
(1, 3, 2019, 118, 60, 1, 27795, 12, 'used', 3, '2019 Ford Escape SEL', '1FMCU9HD0KUA48800', 'U9H', 'U14056'),
(1, 3, 2018, 118, 135, 1, 23495, 12, 'used', 3, '2018 Ford Escape SEL', '1FMCU9HD1JUD53415', 'U9H', 'U30033'),
(1, 3, 2019, 20, 66, 1, 24799, 12, 'used', 3, '2019 Ford Escape SEL 4WD', '1FMCU9HD1KUA28152', 'U9H', 'US4869'),
(1, 3, 2019, 58, 37, 1, 26499, 12, 'used', 3, '2019 Ford Escape SEL AWD', '1FMCU9HD1KUA84480', 'U9H', 'US5046'),
(1, 3, 2019, 20, 51, 1, 25799, 12, 'used', 3, '2019 Ford Escape SEL 4WD', '1FMCU9HD2KUA00618', 'U9H', 'US4950'),
(1, 3, 2019, 20, 31, 1, 26999, 12, 'used', 3, '2019 Ford Escape SEL 4WD', '1FMCU9HD3KUA73108', 'U9H', 'US5103'),
(1, 3, 2019, 118, 60, 1, 26495, 12, 'used', 3, '2019 Ford Escape SEL', '1FMCU9HD3KUA73304', 'U9H', 'U13998'),
(1, 3, 2019, 20, 60, 1, 26499, 12, 'used', 3, '2019 Ford Escape SEL 4WD', '1FMCU9HD3KUB42119', 'U9H', 'US4806'),
(1, 3, 2019, 20, 51, 1, 25999, 12, 'used', 3, '2019 Ford Escape SEL 4WD', '1FMCU9HD4KUA37461', 'U9H', 'US4980'),
(1, 3, 2018, 118, 151, 1, 23995, 12, 'used', 3, '2018 Ford Escape SEL', '1FMCU9HD5JUA14821', 'U9H', 'U14168'),
(1, 3, 2018, 20, 24, 1, 24499, 12, 'used', 3, '2018 Ford Escape SEL 4WD', '1FMCU9HD5JUA87865', 'U9H', 'US4780'),
(1, 3, 2018, 118, 135, 1, 22995, 12, 'used', 3, '2018 Ford Escape SEL', '1FMCU9HD5JUD30137', 'U9H', 'U30000'),
(1, 3, 2019, 20, 51, 1, 26799, 12, 'used', 3, '2019 Ford Escape SEL 4WD', '1FMCU9HD5KUA08969', 'U9H', 'US5215'),
(1, 3, 2019, 20, 37, 1, 26499, 12, 'used', 3, '2019 Ford Escape SEL 4WD', '1FMCU9HD5KUA08972', 'U9H', 'US5115'),
(1, 3, 2019, 20, 51, 1, 24499, 12, 'used', 3, '2019 Ford Escape SEL 4WD', '1FMCU9HD5KUA66273', 'U9H', 'US5096'),
(1, 3, 2019, 58, 60, 1, 26499, 12, 'used', 3, '2019 Ford Escape SEL AWD', '1FMCU9HD5KUA73112', 'U9H', 'US5062'),
(1, 3, 2018, 118, 156, 1, 28495, 12, 'used', 3, '2018 Ford Escape SEL', '1FMCU9HD7JUD30138', 'U9H', 'U30028'),
(1, 3, 2019, 20, 37, 1, 25499, 12, 'used', 3, '2019 Ford Escape SEL 4WD', '1FMCU9HD7KUA73113', 'U9H', 'US5210'),
(1, 3, 2019, 58, 51, 1, 25799, 12, 'used', 3, '2019 Ford Escape SEL AWD', '1FMCU9HD7KUB84034', 'U9H', 'US5063'),
(1, 3, 2019, 20, 61, 1, 27999, 12, 'used', 3, '2019 Ford Escape SEL 4WD', '1FMCU9HD7KUB91260', 'U9H', 'US4839'),
(1, 3, 2019, 118, 24, 1, 26995, 12, 'used', 3, '2019 Ford Escape SEL', '1FMCU9HD8KUA43781', 'U9H', 'U14012'),
(1, 3, 2018, 20, 20, 1, 23999, 12, 'used', 3, '2018 Ford Escape SEL 4WD', '1FMCU9HD9JUC83923', 'U9H', 'US4750'),
(1, 3, 2018, 20, 24, 1, 23999, 12, 'used', 3, '2018 Ford Escape SEL 4WD', '1FMCU9HDXJUC24749', 'U9H', 'US4837'),
(1, 3, 2018, 118, 151, 1, 23795, 12, 'used', 3, '2018 Ford Escape SEL', '1FMCU9HDXJUD12068', 'U9H', 'U14171'),
(1, 3, 2019, 20, 61, 1, 26999, 12, 'used', 3, '2019 Ford Escape SEL 4WD', '1FMCU9HDXKUA66270', 'U9H', 'US4814'),
(1, 3, 2019, 58, 37, 1, 26799, 12, 'used', 3, '2019 Ford Escape SEL AWD', '1FMCU9HDXKUB73688', 'U9H', 'US5069'),
(1, 3, 2013, 3, 3, 1, 13499, 3, 'used', 3, '2013 Ford Escape Titanium 4WD', '1FMCU9J91DUA69678', 'U9J', 'US5149'),
(1, 3, 2019, 3, 24, 1, 29999, 3, 'used', 3, '2019 Ford Escape Titanium 4WD', '1FMCU9J91KUA73114', 'U9J', 'US4848'),
(1, 3, 2018, 3, 51, 1, 26999, 3, 'used', 3, '2018 Ford Escape Titanium 4WD', '1FMCU9J92JUD25063', 'U9J', 'US5190'),
(1, 3, 2019, 3, 61, 1, 0, 55, 'used', 3, '2019 Ford Escape Titanium 4WD', '1FMCU9J93KUA00620', 'U9J', 'US5292'),
(1, 3, 2019, 136, 24, 1, 29995, 3, 'used', 3, '2019 Ford Escape Titanium', '1FMCU9J9XKUA22291', 'U9J', 'U14048'),
(1, 20, 2019, 141, 175, 1, 51995, 23, 'used', 3, '2019 Ford Expedition XLT', '1FMJU1JT3KEA30229', 'U1J', 'U14080'),
(1, 20, 2019, 56, 80, 1, 50799, 23, 'used', 3, '2019 Ford Expedition XLT 4X4', '1FMJU1JT6KEA22061', 'U1J', 'US5015'),
(1, 20, 2020, 56, 46, 1, 62999, 23, 'used', 3, '2020 Ford Expedition XLT 4X4', '1FMJU1JT9LEA08544', 'U1J', 'US3151'),
(1, 20, 2018, 27, 27, 1, 49499, 23, 'used', 3, '2018 Ford Expedition Limited 4X4', '1FMJU2AT4JEA48257', 'U2A', 'US4884'),
(1, 20, 2019, 130, 167, 1, 56995, 23, 'used', 3, '2019 Ford Expedition Limited', '1FMJU2AT7KEA09485', 'U2A', 'U14008'),
(1, 20, 2020, 27, 110, 1, 65999, 23, 'used', 3, '2020 Ford Expedition Limited 4X4', '1FMJU2AT7LEA84320', 'U2A', 'US3359'),
(1, 16, 2020, 111, 110, 1, 39995, 46, 'used', 3, '2020 Ford Explorer XLT', '1FMSK8DH2LGA66994', 'K8D', 'U14096'),
(1, 16, 2020, 111, 135, 1, 41995, 46, 'used', 3, '2020 Ford Explorer XLT', '1FMSK8DH6LGC06464', 'K8D', 'U14064'),
(1, 16, 2020, 21, 46, 1, 40999, 46, 'used', 3, '2020 Ford Explorer XLT 4WD', '1FMSK8DHXLGB17738', 'K8D', 'US3538'),
(1, 16, 2020, 21, 46, 1, 41499, 46, 'used', 3, '2020 Ford Explorer XLT 4WD', '1FMSK8DHXLGB37715', 'K8D', 'US3259'),
(1, 45, 2022, 86, 125, 1, 74999, 70, 'used', 6, '2022 Ford F-250 King Ranch Crew Cab', '1FT7W2B65NEC04653', 'W2B', 'US5206'),
(1, 58, 2017, 107, 144, 1, 54495, 90, 'used', 6, '2017 Ford Super Duty F-250 SRW Lariat', '1FT7W2B6XHEF04533', 'W2B', 'U14110'),
(1, 31, 2019, 135, 50, 1, 35995, 42, 'used', 9, '2019 Ford Ranger XLT', '1FTER1FH1KLA36294', 'R1F', 'U14039'),
(1, 31, 2019, 127, 166, 1, 37795, 42, 'used', 6, '2019 Ford Ranger LARIAT', '1FTER4FH0KLA25675', 'R4F', 'U13966'),
(1, 31, 2019, 147, 187, 1, 40995, 107, 'used', 6, '2019 Ford Ranger', '1FTER4FH5KLB02556', 'R4F', 'U14122'),
(1, 31, 2019, 53, 50, 1, 34799, 42, 'used', 6, '2019 Ford Ranger XLT 4WD SuperCrew', '1FTER4FH6KLA99909', 'R4F', 'US4938'),
(1, 31, 2019, 74, 46, 1, 38999, 42, 'used', 6, '2019 Ford Ranger LARIAT SuperCrew', '1FTER4FH8KLA07134', 'R4F', 'US5266'),
(1, 31, 2019, 135, 46, 1, 37995, 42, 'used', 6, '2019 Ford Ranger XLT', '1FTER4FH9KLA46878', 'R4F', 'U14038'),
(1, 31, 2019, 127, 165, 1, 38495, 42, 'used', 6, '2019 Ford Ranger LARIAT', '1FTER4FHXKLA65634', 'R4F', 'U13960'),
(1, 1, 2019, 52, 74, 1, 48999, 41, 'used', 6, '2019 Ford F-150 LARIAT SuperCrew', '1FTEW1E46KFD39366', 'W1E', 'US4929'),
(1, 1, 2020, 33, 117, 1, 46999, 41, 'used', 6, '2020 Ford F-150 XLT SuperCrew', '1FTEW1E4XLKD93665', 'W1E', 'US5163'),
(1, 1, 2018, 8, 32, 1, 45999, 24, 'used', 6, '2018 Ford F-150 Platinum SuperCrew', '1FTEW1E50JFC08246', 'W1E', 'US4899'),
(1, 1, 2019, 33, 106, 1, 0, 56, 'used', 6, '2019 Ford F-150 XLT SuperCrew', '1FTEW1E50KFA26578', 'W1E', 'US5296'),
(1, 1, 2018, 32, 38, 1, 40499, 24, 'used', 6, '2018 Ford F-150 XLT', '1FTEW1E51JFB61373', 'W1E', 'US4951'),
(1, 1, 2018, 33, 40, 1, 39999, 24, 'used', 6, '2018 Ford F-150 XLT SuperCrew', '1FTEW1E52JFB00470', 'W1E', 'US5027'),
(1, 1, 2018, 32, 74, 1, 38995, 24, 'used', 6, '2018 Ford F-150 XLT', '1FTEW1E56JFE54802', 'W1E', 'U14115'),
(1, 1, 2019, 33, 95, 1, 44499, 24, 'used', 6, '2019 Ford F-150 XLT SuperCrew', '1FTEW1E57KFC51872', 'W1E', 'US5146'),
(1, 1, 2019, 88, 117, 1, 47495, 24, 'used', 6, '2019 Ford F-150 LARIAT', '1FTEW1E57KFD48280', 'W1E', 'U13996'),
(1, 1, 2019, 88, 138, 1, 48495, 24, 'used', 6, '2019 Ford F-150 LARIAT', '1FTEW1E58KFA04022', 'W1E', 'U30019'),
(1, 1, 2019, 22, 81, 1, 41999, 24, 'used', 6, '2019 Ford F-150 XL SuperCrew', '1FTEW1E5XKFA26698', 'W1E', 'US5026'),
(1, 1, 2015, 8, 8, 1, 32799, 8, 'used', 6, '2015 Ford F-150 Platinum SuperCrew', '1FTEW1EG7FFA07940', 'W1E', 'US5191'),
(1, 1, 2020, 52, 109, 1, 54999, 19, 'used', 6, '2020 Ford F-150 LARIAT SuperCrew', '1FTEW1EP1LKE82521', 'W1E', 'US3150'),
(1, 1, 2018, 33, 40, 1, 38999, 34, 'used', 6, '2018 Ford F-150 XLT SuperCrew', '1FTEW1EP4JKF00216', 'W1E', 'US5284'),
(1, 1, 2018, 32, 159, 1, 38995, 19, 'used', 6, '2018 Ford F-150 XLT', '1FTEW1EP6JFD65930', 'W1E', 'U30016'),
(1, 1, 2018, 22, 23, 1, 36999, 19, 'used', 6, '2018 Ford F-150 XL SuperCrew', '1FTEW1EP8JFD81126', 'W1E', 'US4986'),
(1, 1, 2018, 22, 23, 1, 36499, 19, 'used', 6, '2018 Ford F-150 XL SuperCrew', '1FTEW1EPXJFE54139', 'W1E', 'US4770'),
(1, 1, 2019, 73, 105, 1, 36999, 53, 'used', 9, '2019 Ford F-150 XL SuperCab', '1FTEX1EB7KKD35863', 'X1E', 'US5236'),
(1, 1, 2011, 32, 128, 1, 20495, 73, 'used', 6, '2011 Ford F-150 XLT', '1FTFW1EF4BFA98879', 'W1E', 'U14077'),
(1, 1, 2010, 88, 127, 1, 19495, 72, 'used', 6, '2010 Ford F-150 Lariat', '1FTFW1EV5AFB35590', 'W1E', 'U14067'),
(1, 1, 2019, 133, 74, 1, 68995, 41, 'used', 6, '2019 Ford F-150 Raptor', '1FTFW1RG8KFC00204', 'W1R', 'U14026'),
(8, 13, 2017, 16, 16, 1, 14999, 15, 'used', 7, '2017 Chevrolet Sonic LT', '1G1JD6SG8H4128487', '1JV48', 'US5230'),
(8, 50, 2014, 95, 134, 1, 7945, 80, 'used', 4, '2014 Chevrolet Cruze LS', '1G1PA5SG2E7235350', '1PL69', 'U14121'),
(8, 28, 2019, 44, 54, 1, 58799, 36, 'used', 8, '2019 Chevrolet Corvette Stingray 1LT', '1G1YB2D77K5108002', '1YY07', 'US4719'),
(8, 59, 2017, 109, 145, 1, 23495, 92, 'used', 4, '2017 Chevrolet Malibu LT', '1G1ZE5ST3HF264084', '1ZD69', 'U30050'),
(8, 30, 2019, 71, 101, 1, 32999, 40, 'used', 6, '2019 Chevrolet Colorado 4WD Crew Cab', '1GCGTBEN6K1344967', '12M43', 'US5217'),
(8, 30, 2019, 50, 69, 1, 25499, 40, 'used', 6, '2019 Chevrolet Colorado 4WD LT Crew Cab', '1GCGTCEN2K1117457', '12N43', 'US4888'),
(11, 29, 2019, 138, 172, 1, 33495, 101, 'used', 3, '2019 GMC Acadia SLE', '1GKKNSLA4KZ254825', 'TNK26', 'U30021'),
(11, 29, 2019, 138, 172, 1, 32795, 101, 'used', 3, '2019 GMC Acadia SLE', '1GKKNSLA7KZ123730', 'TNK26', 'U14174'),
(11, 29, 2019, 48, 64, 1, 37999, 39, 'used', 3, '2019 GMC Acadia SLT AWD', '1GKKNWLS3KZ140377', 'TNM26', 'US4843'),
(8, 76, 2021, 158, 198, 1, 44495, 116, 'used', 3, '2021 Chevrolet Traverse LT Leather', '1GNEVHKW8MJ106212', '1NW56', 'U30036'),
(8, 71, 2019, 146, 69, 1, 50995, 106, 'used', 3, '2019 Chevrolet Tahoe LT', '1GNSKBKC5KR107945', 'CK15706', 'U30051'),
(15, 65, 2018, 122, 157, 1, 41995, 98, 'used', 4, '2018 Lincoln Continental Reserve', '1LN6L9NP3J5617825', 'L9N', 'U30003'),
(3, 49, 2014, 93, 133, 1, 24495, 78, 'used', 6, '2014 Nissan Frontier PRO-4X', '1N6AD0EV0EN729149', '32614', 'U30054'),
(3, 49, 2019, 126, 164, 1, 30495, 78, 'used', 6, '2019 Nissan Frontier SV', '1N6AD0EV0KN772689', '32219', 'U13925'),
(9, 14, 2017, 17, 17, 1, 41999, 16, 'used', 4, '2017 Dodge Charger R/T Scat Pack', '2C3CDXGJ5HH623781', 'LDDR48', 'US5253'),
(1, 22, 2014, 89, 129, 1, 13995, 74, 'used', 3, '2014 Ford Edge SEL', '2FMDK3JC1EBA32401', 'K3J', 'U14019'),
(1, 52, 2019, 129, 24, 1, 26995, 83, 'used', 3, '2019 Ford Flex SE', '2FMGK5B82KBA12799', 'K5B', 'U13999'),
(1, 52, 2016, 97, 24, 1, 20995, 83, 'used', 3, '2016 Ford Flex SEL', '2FMHK6C86GBA09453', 'K6C', 'U14138'),
(1, 52, 2018, 116, 151, 1, 31795, 83, 'used', 3, '2018 Ford Flex Limited', '2FMHK6D85JBA00345', 'K6D', 'U14156'),
(1, 52, 2019, 145, 183, 1, 41495, 105, 'used', 3, '2019 Ford Flex Limited EcoBoost', '2FMHK6DT6KBA07679', 'K6D', 'U14109'),
(1, 22, 2019, 63, 68, 1, 38499, 47, 'used', 3, '2019 Ford Edge ST AWD', '2FMPK4AP3KBB78669', 'K4A', 'US5128'),
(1, 22, 2019, 132, 80, 1, 38495, 47, 'used', 3, '2019 Ford Edge ST', '2FMPK4AP5KBB11281', 'K4A', 'U14146'),
(1, 22, 2017, 101, 138, 1, 26595, 47, 'used', 3, '2017 Ford Edge Sport', '2FMPK4AP9HBB14211', 'K4A', 'U14166'),
(1, 22, 2018, 113, 27, 1, 24495, 26, 'used', 3, '2018 Ford Edge SE', '2FMPK4G90JBC49060', 'K4G', 'U14188'),
(1, 22, 2018, 113, 135, 1, 23795, 26, 'used', 3, '2018 Ford Edge SE', '2FMPK4G99JBC45525', 'K4G', 'U14141'),
(1, 22, 2019, 62, 35, 1, 26999, 26, 'used', 3, '2019 Ford Edge SE AWD', '2FMPK4G9XKBB17358', 'K4G', 'US5092'),
(1, 22, 2018, 89, 50, 1, 28495, 74, 'used', 3, '2018 Ford Edge SEL', '2FMPK4J80JBC45588', 'K4J', 'U13995'),
(1, 22, 2018, 89, 151, 1, 27495, 74, 'used', 3, '2018 Ford Edge SEL', '2FMPK4J85JBC29886', 'K4J', 'U14169'),
(1, 22, 2018, 89, 155, 1, 31495, 74, 'used', 3, '2018 Ford Edge SEL', '2FMPK4J88JBC24360', 'K4J', 'U14189'),
(1, 22, 2019, 38, 50, 1, 29499, 26, 'used', 3, '2019 Ford Edge SEL AWD', '2FMPK4J90KBB18785', 'K4J', 'US5160'),
(1, 22, 2019, 38, 80, 1, 31999, 26, 'used', 3, '2019 Ford Edge SEL AWD', '2FMPK4J90KBB58980', 'K4J', 'US5250'),
(1, 22, 2018, 38, 45, 1, 29999, 26, 'used', 3, '2018 Ford Edge SEL AWD', '2FMPK4J92JBB55335', 'K4J', 'US5074'),
(1, 22, 2018, 38, 50, 1, 27499, 26, 'used', 3, '2018 Ford Edge SEL AWD', '2FMPK4J94JBB47057', 'K4J', 'US5165'),
(1, 22, 2018, 38, 49, 1, 27499, 26, 'used', 3, '2018 Ford Edge SEL AWD', '2FMPK4J97JBC17909', 'K4J', 'US5145'),
(1, 22, 2019, 89, 182, 1, 32495, 26, 'used', 3, '2019 Ford Edge SEL', '2FMPK4J98KBB73128', 'K4J', 'U14103'),
(1, 22, 2018, 89, 50, 1, 28795, 26, 'used', 3, '2018 Ford Edge SEL', '2FMPK4J99JBC39071', 'K4J', 'U14054'),
(1, 22, 2019, 38, 50, 1, 29999, 26, 'used', 3, '2019 Ford Edge SEL AWD', '2FMPK4J99KBB17330', 'K4J', 'US5042'),
(1, 22, 2019, 38, 35, 1, 30999, 26, 'used', 3, '2019 Ford Edge SEL AWD', '2FMPK4J99KBB19014', 'K4J', 'US4798'),
(1, 22, 2019, 89, 35, 1, 30495, 26, 'used', 3, '2019 Ford Edge SEL', '2FMPK4J9XKBB11522', 'K4J', 'U14035'),
(1, 22, 2018, 30, 36, 1, 28799, 26, 'used', 3, '2018 Ford Edge Titanium AWD', '2FMPK4K90JBC48885', 'K4K', 'US4933'),
(1, 22, 2019, 30, 80, 1, 35999, 57, 'used', 3, '2019 Ford Edge Titanium AWD', '2FMPK4K90KBC10834', 'K4K', 'US5277'),
(1, 22, 2020, 156, 196, 1, 39795, 26, 'used', 3, '2020 Ford Edge Titanium', '2FMPK4K91LBA86221', 'K4K', 'U14114'),
(1, 22, 2019, 30, 78, 1, 31999, 26, 'used', 3, '2019 Ford Edge Titanium AWD', '2FMPK4K99KBB39715', 'K4K', 'US4994'),
(1, 1, 2004, 1, 1, 1, 49999, 1, 'used', 1, '2004 Ford F-150 Lightning', '2FTRF073X4CA16212', 'F07', 'US4045'),
(6, 46, 2008, 87, 126, 1, 6995, 71, 'used', 4, '2008 Honda Civic Sdn EX', '2HGFA16888H348244', '', 'U30057'),
(6, 10, 2016, 11, 11, 2, 20999, 11, 'used', 4, '2016 Honda Civic Sedan EX-T', '2HGFC1F3XGH659512', 'FC1F3GJW', 'US4915'),
(6, 12, 2019, 137, 188, 2, 31995, 108, 'used', 3, '2019 Honda CR-V EX', '2HKRW2H54KH626383', 'RW2H5KJW', 'U30059'),
(6, 12, 2019, 137, 171, 2, 29795, 14, 'used', 3, '2019 Honda CR-V EX', '2HKRW2H55KH629616', 'RW2H5KJW', 'U14164'),
(6, 12, 2017, 15, 15, 2, 24499, 14, 'used', 3, '2017 Honda CR-V EX AWD', '2HKRW2H59HH660005', 'RW2H5HJW', 'US5091'),
(2, 4, 2014, 4, 4, 2, 16799, 4, 'used', 4, '2014 Toyota Corolla S', '2T1BURHE1EC083842', '1862', 'US5188'),
(2, 4, 2016, 12, 12, 2, 17499, 4, 'used', 4, '2016 Toyota Corolla S Plus', '2T1BURHE4GC745674', '1864', 'US5097'),
(2, 4, 2017, 104, 141, 2, 18495, 4, 'used', 4, '2017 Toyota Corolla LE', '2T1BURHE9HC882997', '1852', 'U14071'),
(2, 73, 2020, 149, 190, 1, 38995, 110, 'used', 3, '2020 Toyota RAV4 XLE Premium', '2T3A1RFV7LC077183', '4478', 'U14131'),
(4, 19, 2018, 124, 161, 1, 24795, 22, 'used', 3, '2018 Jeep Compass Latitude', '3C4NJDBBXJT481260', 'MPJM74', 'U14111'),
(4, 19, 2018, 26, 30, 1, 26999, 22, 'used', 3, '2018 Jeep Compass Limited 4X4', '3C4NJDCB5JT481889', 'MPJP74', 'US4833'),
(4, 19, 2017, 103, 140, 1, 27995, 22, 'used', 3, '2017 Jeep Compass Trailhawk', '3C4NJDDB7HT630943', 'MPJH74', 'U30006'),
(10, 53, 2016, 98, 42, 1, 39995, 84, 'used', 6, '2016 RAM 2500 Tradesman', '3C6TR5HT1GG259737', 'DJ7L92', 'U30002'),
(10, 54, 2016, 99, 42, 1, 48995, 85, 'used', 2, '2016 RAM 5500 Tradesman', '3C7WRNFL2GG135181', 'DP0L94', 'U14088'),
(1, 6, 2018, 6, 46, 1, 22999, 32, 'used', 4, '2018 Ford Fusion SE', '3FA6P0HD3JR216283', 'P0H', 'US5225'),
(1, 6, 2018, 6, 135, 1, 24495, 32, 'used', 4, '2018 Ford Fusion SE', '3FA6P0HD3JR283014', 'P0H', 'U30032'),
(1, 6, 2014, 6, 6, 1, 14999, 6, 'used', 4, '2014 Ford Fusion SE', '3FA6P0HD6ER172737', 'P0H', 'US5290'),
(1, 6, 2020, 6, 50, 1, 27795, 32, 'used', 4, '2020 Ford Fusion SE', '3FA6P0HD9LR102145', 'P0H', 'U14098'),
(1, 6, 2018, 36, 44, 1, 24999, 30, 'used', 4, '2018 Ford Fusion Titanium', '3FA6P0K91JR112766', 'P0K', 'US5047'),
(1, 26, 2018, 39, 46, 2, 21999, 31, 'used', 4, '2018 Ford Fusion Hybrid SE', '3FA6P0LU1JR279521', 'P0L', 'US5104'),
(1, 26, 2019, 39, 135, 2, 24995, 31, 'used', 4, '2019 Ford Fusion Hybrid SE', '3FA6P0LU3KR157213', 'P0L', 'U14142'),
(1, 26, 2019, 39, 50, 2, 24499, 31, 'used', 4, '2019 Ford Fusion Hybrid SE', '3FA6P0LU3KR208225', 'P0L', 'US5221'),
(1, 26, 2019, 39, 75, 2, 23999, 31, 'used', 4, '2019 Ford Fusion Hybrid SE', '3FA6P0LU4KR111339', 'P0L', 'US4932'),
(1, 26, 2019, 39, 59, 2, 22999, 31, 'used', 4, '2019 Ford Fusion Hybrid SE', '3FA6P0LU5KR110992', 'P0L', 'US4789'),
(1, 26, 2019, 39, 97, 2, 23499, 31, 'used', 4, '2019 Ford Fusion Hybrid SE', '3FA6P0LU5KR191864', 'P0L', 'US5172'),
(1, 26, 2019, 39, 50, 2, 23999, 31, 'used', 4, '2019 Ford Fusion Hybrid SE', '3FA6P0LU6KR157299', 'P0L', 'US5075'),
(1, 26, 2019, 39, 46, 2, 25499, 31, 'used', 4, '2019 Ford Fusion Hybrid SE', '3FA6P0LU7KR208227', 'P0L', 'US5171'),
(1, 26, 2020, 39, 50, 2, 25499, 31, 'used', 4, '2020 Ford Fusion Hybrid SE', '3FA6P0LU8LR121325', 'P0L', 'US5089'),
(1, 26, 2019, 39, 160, 2, 23995, 31, 'used', 4, '2019 Ford Fusion Hybrid SE', '3FA6P0LU9KR157278', 'P0L', 'U30037'),
(1, 18, 2018, 25, 27, 2, 22799, 21, 'used', 4, '2018 Ford Fusion Energi SE', '3FA6P0PU5JR275787', 'P0P', 'US4799'),
(1, 18, 2019, 49, 68, 2, 25999, 21, 'used', 4, '2019 Ford Fusion Energi Titanium', '3FA6P0SU2KR264187', 'P0S', 'US4896'),
(1, 18, 2019, 49, 35, 2, 24499, 21, 'used', 4, '2019 Ford Fusion Energi Titanium', '3FA6P0SU6KR244735', 'P0S', 'US5148'),
(1, 38, 2019, 75, 39, 1, 17999, 58, 'used', 7, '2019 Ford Fiesta SE', '3FADP4EJ5KM125443', 'P4E', 'US5281'),
(12, 32, 2019, 54, 76, 2, 20999, 43, 'used', 4, '2019 Kia Forte S', '3KPF34AD8KE073315', 'C3442', 'US4962'),
(20, 57, 2017, 106, 143, 3, 16495, 89, 'used', 4, '2017 Volkswagen Jetta 1.4T S', '3VW167AJ6HM313756', '1631F1', 'U30040'),
(7, 34, 2019, 64, 92, 2, 25499, 48, 'used', 4, '2019 Subaru Legacy Premium Awd', '4S3BNAF69K3027484', 'KAD', 'US5122'),
(7, 34, 2020, 78, 114, 2, 31999, 62, 'used', 4, '2020 Subaru Legacy Limited Awd', '4S3BWAL66L3025887', 'LAF', 'US5111'),
(7, 27, 2018, 42, 52, 2, 21999, 33, 'used', 4, '2018 Subaru Impreza AWD', '4S3GKAA66J3617274', 'JJB', 'US5234'),
(7, 27, 2019, 42, 55, 2, 22499, 33, 'used', 7, '2019 Subaru Impreza AWD', '4S3GTAA65K3716490', 'KLB', 'US4731'),
(7, 27, 2017, 108, 52, 2, 23995, 91, 'used', 7, '2017 Subaru Impreza Premium', '4S3GTAB66H3739302', 'HLD', 'U30049'),
(7, 27, 2019, 51, 72, 2, 21999, 33, 'used', 7, '2019 Subaru Impreza Premium AWD', '4S3GTAC61K3723840', 'KLD', 'US4914'),
(7, 27, 2019, 108, 72, 2, 25495, 33, 'used', 7, '2019 Subaru Impreza Premium', '4S3GTAC69K3717686', 'KLD', 'U30038'),
(7, 11, 2017, 14, 14, 2, 25999, 13, 'used', 3, '2017 Subaru Outback Premium AWD', '4S4BSACC2H3233446', 'HDD', 'US4982'),
(7, 11, 2019, 14, 25, 2, 28999, 13, 'used', 3, '2019 Subaru Outback Premium Awd', '4S4BSAFC6K3330779', 'KDD', 'US4889'),
(7, 11, 2019, 14, 85, 2, 29499, 13, 'used', 3, '2019 Subaru Outback Premium Awd', '4S4BSAHC2K3268228', 'KDD', 'US5169'),
(7, 11, 2019, 23, 85, 2, 30999, 13, 'used', 3, '2019 Subaru Outback Limited Awd', '4S4BSANC7K3322773', 'KDF', 'US5058'),
(7, 11, 2018, 23, 25, 2, 28999, 13, 'used', 3, '2018 Subaru Outback Limited Awd', '4S4BSANC9J3306086', 'JDF', 'US4792'),
(7, 11, 2019, 23, 85, 2, 34499, 50, 'used', 3, '2019 Subaru Outback Limited Awd', '4S4BSENC9K3265760', 'KDK', 'US5142'),
(7, 11, 2020, 14, 112, 2, 33499, 60, 'used', 3, '2020 Subaru Outback Premium Awd', '4S4BTACC7L3162055', 'LDD', 'US4687'),
(7, 11, 2020, 14, 111, 2, 35499, 60, 'used', 3, '2020 Subaru Outback Premium Awd', '4S4BTAEC4L3213329', 'LDD', 'US4602'),
(7, 11, 2020, 150, 92, 2, 32795, 60, 'used', 3, '2020 Subaru Outback Premium', '4S4BTAEC5L3265522', 'LDD', 'U14003'),
(7, 11, 2021, 14, 25, 2, 33299, 60, 'used', 3, '2021 Subaru Outback Premium Awd', '4S4BTAFC4M3211032', 'MDD', 'US4861'),
(7, 40, 2020, 79, 115, 2, 41499, 63, 'used', 3, '2020 Subaru Ascent Limited Awd', '4S4WMALD7L3429914', 'LCD', 'US5126'),
(7, 40, 2019, 143, 178, 2, 36495, 63, 'used', 3, '2019 Subaru Ascent Limited', '4S4WMAPD9K3459411', 'KCE', 'U30030'),
(2, 73, 2021, 157, 191, 2, 43995, 115, 'used', 3, '2021 Toyota RAV4 Hybrid Limited', '4T3D6RFVXMU012598', '4534', 'U30004'),
(16, 42, 2017, 105, 142, 1, 27495, 88, 'used', 3, '2017 Acura RDX', '5J8TB4H37HL004829', 'TB4H3HJNW', 'U14095'),
(16, 42, 2020, 81, 118, 1, 39999, 65, 'used', 3, '2020 Acura RDX SH-AWD w/Technology Pkg', '5J8TC2H54LL029425', 'TC2H5LKNW', 'US5216'),
(16, 72, 2019, 148, 189, 1, 40995, 109, 'used', 3, '2019 Acura MDX', '5J8YD4H38KL027205', 'YD4H3KJNW', 'U14119'),
(15, 67, 2019, 134, 170, 1, 32795, 100, 'used', 3, '2019 Lincoln MKC Select', '5LMCJ2D95KUL07487', 'J2D', 'U14147'),
(15, 67, 2019, 134, 170, 1, 32995, 100, 'used', 3, '2019 Lincoln MKC Select', '5LMCJ2D97KUL25215', 'J2D', 'U14161'),
(15, 67, 2019, 134, 185, 1, 33995, 100, 'used', 3, '2019 Lincoln MKC Select', '5LMCJ2D9XKUL53381', 'J2D', 'U30052'),
(15, 41, 2020, 80, 116, 1, 79499, 64, 'used', 3, '2020 Lincoln Navigator Reserve 4X4', '5LMJJ2LT8LEL04776', 'J2L', 'US5153'),
(3, 5, 2014, 5, 5, 2, 16999, 5, 'used', 3, '2014 Nissan Rogue S AWD', '5N1AT2MVXEC834551', '22214', 'US5240'),
(3, 68, 2019, 140, 174, 2, 27495, 102, 'used', 3, '2019 Nissan Pathfinder SV', '5N1DR2MMXKC591936', '25219', 'U14182'),
(5, 43, 2020, 82, 119, 1, 37999, 66, 'used', 3, '2020 Hyundai Santa Fe Limited AWD', '5NMS5CAA8LH200471', '644A2AT5', 'US5269'),
(5, 8, 2015, 9, 10, 1, 13999, 9, 'used', 4, '2015 Hyundai Sonata 2.4L SE', '5NPE24AF8FH008319', '28402F45', 'US5278'),
(2, 70, 2019, 144, 179, 1, 38495, 104, 'used', 3, '2019 Toyota Highlander', '5TDJZRFH2KS933894', '', 'U30031'),
(2, 74, 2020, 151, 191, 1, 49995, 111, 'used', 6, '2020 Toyota Tundra', '5TFDY5F12LX890424', '', 'U14143'),
(12, 36, 2014, 92, 132, 1, 14995, 77, 'used', 3, '2014 Kia Sorento LX', '5XYKT4A74EG461125', '74222', 'U14099'),
(12, 36, 2019, 67, 96, 1, 29499, 51, 'used', 3, '2019 Kia Sorento LX AWD', '5XYPGDA33KG545584', '73422', 'US5159'),
(7, 37, 2019, 139, 173, 3, 30495, 52, 'used', 4, '2019 Subaru WRX Premium', 'JF1VA1C64K9802824', 'KUO', 'U14178'),
(7, 37, 2019, 69, 98, 3, 29999, 52, 'used', 4, '2019 Subaru WRX Premium Awd', 'JF1VA1C65K9802072', 'KUO', 'US5186'),
(7, 17, 2019, 55, 90, 2, 25999, 20, 'used', 3, '2019 Subaru Crosstrek Premium Awd', 'JF2GTACC3K8271304', 'KRD', 'US5109'),
(7, 17, 2019, 55, 19, 2, 25999, 20, 'used', 3, '2019 Subaru Crosstrek Premium Awd', 'JF2GTACC9K8288866', 'KRD', 'US5024'),
(7, 17, 2019, 128, 56, 2, 26995, 20, 'used', 3, '2019 Subaru Crosstrek Premium', 'JF2GTAEC1KH253722', 'KRD', 'U14128'),
(7, 17, 2019, 55, 67, 2, 26999, 20, 'used', 3, '2019 Subaru Crosstrek Premium Awd', 'JF2GTAEC3K8341185', 'KRD', 'US5113'),
(7, 17, 2019, 55, 56, 2, 26999, 20, 'used', 3, '2019 Subaru Crosstrek Premium Awd', 'JF2GTAEC6K8302851', 'KRD', 'US5200'),
(7, 17, 2019, 24, 29, 2, 27999, 20, 'used', 3, '2019 Subaru Crosstrek Limited Awd', 'JF2GTAMC1K8291162', 'KRE', 'US5110'),
(7, 17, 2018, 24, 26, 2, 24499, 20, 'used', 3, '2018 Subaru Crosstrek Limited Awd', 'JF2GTAMC7JH256401', 'JRE', 'US4771'),
(7, 17, 2019, 24, 67, 2, 29999, 20, 'used', 3, '2019 Subaru Crosstrek Limited Awd', 'JF2GTANC2KH267743', 'KRE', 'US4871'),
(7, 17, 2021, 55, 123, 2, 31999, 20, 'used', 3, '2021 Subaru Crosstrek Premium Awd', 'JF2GTAPC1M8259522', 'MRD', 'US5274'),
(7, 17, 2021, 84, 121, 2, 33499, 68, 'used', 3, '2021 Subaru Crosstrek Sport AWD', 'JF2GTHSC5MH214356', 'MRE', 'US4877'),
(7, 15, 2018, 40, 29, 2, 26499, 17, 'used', 3, '2018 Subaru Forester Premium Awd', 'JF2SJAGC7JH469294', 'JFF', 'US5119'),
(7, 15, 2018, 19, 29, 2, 29999, 17, 'used', 3, '2018 Subaru Forester Limited Awd', 'JF2SJAJC0JH585364', 'JFI', 'US4811'),
(7, 15, 2018, 37, 29, 2, 27999, 17, 'used', 3, '2018 Subaru Forester Limited', 'JF2SJARC2JH610527', 'JFI', 'US5051'),
(7, 15, 2018, 19, 19, 2, 27499, 17, 'used', 3, '2018 Subaru Forester Limited Awd', 'JF2SJARCXJH589815', 'JFI', 'US4733'),
(7, 15, 2018, 18, 18, 2, 29999, 17, 'used', 3, '2018 Subaru Forester Touring AWD', 'JF2SJAWC6JH574118', 'JFJ', 'US4714'),
(7, 15, 2019, 57, 82, 2, 25999, 37, 'used', 3, '2019 Subaru Forester AWD', 'JF2SKAAC5KH514739', 'KFB', 'US5018'),
(7, 15, 2019, 40, 65, 2, 25499, 37, 'used', 3, '2019 Subaru Forester Premium Awd', 'JF2SKAEC0KH489551', 'KFF', 'US5082'),
(7, 15, 2019, 40, 57, 2, 31499, 37, 'used', 3, '2019 Subaru Forester Premium Awd', 'JF2SKAEC3KH465843', 'KFF', 'US4734'),
(7, 15, 2019, 40, 26, 2, 27799, 37, 'used', 3, '2019 Subaru Forester Premium Awd', 'JF2SKAECXKH513354', 'KFF', 'US4952'),
(7, 15, 2019, 40, 82, 2, 28999, 37, 'used', 3, '2019 Subaru Forester Premium Awd', 'JF2SKAGC1KH445149', 'KFF', 'US5249'),
(7, 15, 2019, 40, 65, 2, 27999, 37, 'used', 3, '2019 Subaru Forester Premium Awd', 'JF2SKAGC2KH479777', 'KFF', 'US4856'),
(7, 15, 2019, 40, 18, 2, 26999, 37, 'used', 3, '2019 Subaru Forester Premium Awd', 'JF2SKAGC9KH500883', 'KFF', 'US4759'),
(7, 15, 2020, 40, 195, 2, 33995, 37, 'used', 3, '2020 Subaru Forester Premium Awd', 'JF2SKAJC3LH403897', 'LFF', 'U30034'),
(7, 15, 2021, 40, 113, 2, 32999, 37, 'used', 3, '2021 Subaru Forester Premium Awd', 'JF2SKAJC3MH517500', 'MFF', 'US5218'),
(7, 15, 2021, 40, 122, 2, 32999, 37, 'used', 3, '2021 Subaru Forester Premium Awd', 'JF2SKAJC4MH553079', 'MFF', 'US5219'),
(7, 15, 2019, 45, 56, 2, 33499, 37, 'used', 3, '2019 Subaru Forester Sport AWD', 'JF2SKAPC1KH465336', 'KFG', 'US4730'),
(7, 15, 2019, 46, 58, 2, 31499, 37, 'used', 3, '2019 Subaru Forester Sport 4WD', 'JF2SKAPC1KH531755', 'KFG', 'US4748'),
(7, 15, 2020, 45, 58, 2, 34999, 37, 'used', 3, '2020 Subaru Forester Sport AWD', 'JF2SKARC0LH560212', 'LFG', 'US4762'),
(7, 15, 2019, 19, 19, 2, 31799, 37, 'used', 3, '2019 Subaru Forester Limited AWD', 'JF2SKASC4KH425484', 'KFI', 'US5209'),
(7, 15, 2019, 19, 65, 2, 32999, 37, 'used', 3, '2019 Subaru Forester Limited Awd', 'JF2SKASC7KH494864', 'KFI', 'US4940'),
(7, 15, 2020, 19, 113, 2, 33999, 37, 'used', 3, '2020 Subaru Forester Limited Awd', 'JF2SKAUC7LH498931', 'LFI', 'US4723'),
(7, 15, 2019, 18, 73, 2, 35499, 37, 'used', 3, '2019 Subaru Forester Touring AWD', 'JF2SKAWC3KH469969', 'KFJ', 'US4924'),
(7, 15, 2019, 68, 26, 2, 34799, 37, 'used', 3, '2019 Subaru Forester Touring 4WD', 'JF2SKAWC5KH503202', 'KFJ', 'US5173'),
(7, 15, 2019, 18, 18, 2, 35499, 37, 'used', 3, '2019 Subaru Forester Touring AWD', 'JF2SKAWC7KH465925', 'KFJ', 'US4925'),
(7, 15, 2019, 18, 79, 2, 33799, 37, 'used', 3, '2019 Subaru Forester Touring AWD', 'JF2SKAWC7KH503654', 'KFJ', 'US5006'),
(16, 48, 2014, 91, 131, 1, 19495, 76, 'used', 4, '2014 Acura RLX Tech Pkg', 'JH4KC1F58EC003032', 'KC1F5EKNW', 'U14097'),
(6, 10, 2018, 11, 33, 2, 20999, 11, 'used', 4, '2018 Honda Civic Sedan EX-T', 'JHMFC1F31JX002677', 'FC1F3JJW', 'US4917'),
(6, 10, 2018, 123, 158, 2, 23995, 11, 'used', 4, '2018 Honda Civic Sedan EX-L', 'JHMFC1F72JX039398', '', 'U30015'),
(18, 55, 2016, 100, 137, 1, 18495, 86, 'used', 7, '2016 Mazda3 i Touring', 'JM1BM1M72G1337266', 'M3HITRA', 'U14105'),
(18, 69, 2019, 142, 176, 1, 24995, 103, 'used', 3, '2019 Mazda CX-3 Touring', 'JM1DKFC78K1410534', 'CX3TRXA', 'U30012'),
(18, 61, 2019, 131, 180, 1, 28495, 94, 'used', 3, '2019 Mazda CX-5 Touring', 'JM3KFBCM1K0535463', 'CX5TRXA', 'U30026'),
(18, 61, 2019, 131, 169, 1, 26995, 94, 'used', 3, '2019 Mazda CX-5 Touring', 'JM3KFBCM7K0536973', 'CX5TRXA', 'U14023'),
(18, 61, 2018, 117, 152, 1, 26995, 94, 'used', 3, '2018 Mazda CX-5 Grand Touring', 'JM3KFBDM9J0407551', 'CX5GTXA', 'U14050'),
(8, 24, 2018, 34, 41, 1, 22499, 28, 'used', 3, '2018 Chevrolet Trax LT AWD', 'KL7CJPSB8JB710509', '1JS76', 'US5011'),
(3, 5, 2018, 28, 34, 2, 18499, 5, 'used', 3, '2018 Nissan Rogue SV', 'KNMAT2MTXJP506794', '22318', 'US4918'),
(3, 5, 2019, 60, 87, 2, 22499, 5, 'used', 3, '2019 Nissan Rogue SV AWD', 'KNMAT2MV5KP527040', '22219', 'US5076'),
(1, 23, 2019, 61, 88, 1, 18999, 45, 'used', 3, '2019 Ford EcoSport S', 'MAJ3S2FE8KC283275', 'S2F', 'US5078'),
(1, 23, 2018, 41, 47, 1, 20499, 27, 'used', 3, '2018 Ford EcoSport SES 4WD', 'MAJ6P1CL1JC196800', 'P1C', 'US5138'),
(1, 23, 2018, 110, 146, 1, 21495, 27, 'used', 3, '2018 Ford EcoSport SE', 'MAJ6P1UL0JC171952', 'P1U', 'U13930'),
(1, 23, 2018, 31, 21, 1, 0, 35, 'used', 3, '2018 Ford EcoSport SE 4WD', 'MAJ6P1UL6JC226307', 'P1U', 'US5291'),
(1, 23, 2018, 31, 21, 1, 20499, 27, 'used', 3, '2018 Ford EcoSport SE 4WD', 'MAJ6P1UL9JC171951', 'P1U', 'US4954'),
(1, 23, 2018, 31, 48, 1, 20499, 27, 'used', 3, '2018 Ford EcoSport SE 4WD', 'MAJ6P1ULXJC245717', 'P1U', 'US5137'),
(1, 23, 2019, 31, 47, 1, 21999, 27, 'used', 3, '2019 Ford EcoSport SE 4WD', 'MAJ6S3GL1KC270500', 'S3G', 'US5168'),
(1, 23, 2019, 110, 47, 1, 22995, 27, 'used', 3, '2019 Ford EcoSport SE', 'MAJ6S3GL2KC276970', 'S3G', 'U14044'),
(1, 23, 2019, 31, 107, 1, 23999, 35, 'used', 3, '2019 Ford EcoSport SE 4WD', 'MAJ6S3GL8KC265889', 'S3G', 'US5285'),
(1, 23, 2019, 41, 48, 1, 23499, 27, 'used', 3, '2019 Ford EcoSport SES 4WD', 'MAJ6S3JL7KC293644', 'S3J', 'US5179'),
(14, 39, 2019, 76, 108, 1, 28911, 59, 'used', 3, '2019 Land Rover Discovery Sport SE 4WD', 'SALCP2FXXKH789098', 'AD550/350QB', 'US5298'),
(17, 51, 2015, 96, 136, 1, 21995, 82, 'used', 3, '2015 Audi Q5 Premium Plus', 'WA1LFAFP8FA092526', '8RB52A', 'U30055'),
(21, 62, 2018, 119, 154, 4, 62995, 95, 'used', 4, '2018 BMW M3', 'WBS8M9C55J5L71669', '18TN', 'U14068'),
(13, 35, 2019, 65, 93, 1, 30999, 49, 'used', 5, '2019 MINI Cooper S Convertible', 'WMWWG9C58K3D22842', '19ME', 'US5121'),
(19, 56, 2017, 102, 139, 1, 25995, 87, 'used', 3, '2017 Volvo XC60 Dynamic', 'YV440MRR0H2084604', 'XC60T5AWD', 'U14187'),
(19, 75, 2020, 155, 194, 1, 53495, 113, 'used', 3, '2020 Volvo XC90 Momentum', 'YV4A22PK2L1586245', 'XC90T6MAWD7', 'U30029');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_american_cars`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vw_american_cars`;
CREATE TABLE `vw_american_cars` (
`make` varchar(15)
,`model` varchar(30)
,`year` int(11)
,`trim` varchar(35)
,`extcolor` varchar(50)
,`intcolor` varchar(50)
,`transmission` varchar(10)
,`price` int(11)
,`engine` varchar(50)
,`fueltype` varchar(13)
,`vehicletype` varchar(4)
,`bodystyle` varchar(30)
,`name` varchar(100)
,`vin` char(17)
,`modelcode` varchar(11)
,`stocknum` varchar(6)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_american_cars`
--
DROP TABLE IF EXISTS `vw_american_cars`;

DROP VIEW IF EXISTS `vw_american_cars`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_american_cars`  AS SELECT `make`.`make` AS `make`, `model`.`model` AS `model`, `v`.`year` AS `year`, `trim`.`trim` AS `trim`, `color`.`extcolor` AS `extcolor`, `color`.`intcolor` AS `intcolor`, `transmission`.`transmission` AS `transmission`, `v`.`price` AS `price`, `engine`.`engine` AS `engine`, `engine`.`fueltype` AS `fueltype`, `v`.`vehicletype` AS `vehicletype`, `bodystyle`.`bodystyle` AS `bodystyle`, `v`.`name` AS `name`, `v`.`vin` AS `vin`, `v`.`modelcode` AS `modelcode`, `v`.`stocknum` AS `stocknum` FROM (((((((`vehicles` `v` join `make` on(`make`.`make_id` = `v`.`make_id`)) join `model` on(`model`.`model_id` = `v`.`model_id`)) join `trim` on(`trim`.`trim_id` = `v`.`trim_id`)) join `color` on(`color`.`color_id` = `v`.`color_id`)) join `transmission` on(`transmission`.`transmission_id` = `v`.`transmission_id`)) join `engine` on(`engine`.`engine_id` = `v`.`engine_id`)) join `bodystyle` on(`bodystyle`.`bodystyle_id` = `v`.`bodystyle_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bodystyle`
--
ALTER TABLE `bodystyle`
  ADD PRIMARY KEY (`bodystyle_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`),
  ADD KEY `fk_color_make1_idx` (`make_id`);

--
-- Indexes for table `engine`
--
ALTER TABLE `engine`
  ADD PRIMARY KEY (`engine_id`),
  ADD KEY `fk_engine_model1_idx` (`model_id`);

--
-- Indexes for table `make`
--
ALTER TABLE `make`
  ADD PRIMARY KEY (`make_id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `fk_model_make_idx` (`make_id`);

--
-- Indexes for table `transmission`
--
ALTER TABLE `transmission`
  ADD PRIMARY KEY (`transmission_id`);

--
-- Indexes for table `trim`
--
ALTER TABLE `trim`
  ADD PRIMARY KEY (`trim_id`),
  ADD KEY `fk_trim_model1_idx` (`model_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vin`),
  ADD KEY `fk_vehicles_make1_idx` (`make_id`),
  ADD KEY `fk_vehicles_model1_idx` (`model_id`),
  ADD KEY `fk_vehicles_engine1_idx` (`engine_id`),
  ADD KEY `fk_vehicles_color1_idx` (`color_id`),
  ADD KEY `fk_vehicles_trim2` (`trim_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bodystyle`
--
ALTER TABLE `bodystyle`
  MODIFY `bodystyle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `engine`
--
ALTER TABLE `engine`
  MODIFY `engine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `make`
--
ALTER TABLE `make`
  MODIFY `make_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `transmission`
--
ALTER TABLE `transmission`
  MODIFY `transmission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `trim`
--
ALTER TABLE `trim`
  MODIFY `trim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `color`
--
ALTER TABLE `color`
  ADD CONSTRAINT `fk_color_make1` FOREIGN KEY (`make_id`) REFERENCES `make` (`make_id`);

--
-- Constraints for table `engine`
--
ALTER TABLE `engine`
  ADD CONSTRAINT `fk_engine_model1` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`);

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `fk_model_make` FOREIGN KEY (`make_id`) REFERENCES `make` (`make_id`);

--
-- Constraints for table `trim`
--
ALTER TABLE `trim`
  ADD CONSTRAINT `fk_trim_model1` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`);

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `fk_vehicles_color1` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`),
  ADD CONSTRAINT `fk_vehicles_engine1` FOREIGN KEY (`engine_id`) REFERENCES `engine` (`engine_id`),
  ADD CONSTRAINT `fk_vehicles_make1` FOREIGN KEY (`make_id`) REFERENCES `make` (`make_id`),
  ADD CONSTRAINT `fk_vehicles_model1` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`),
  ADD CONSTRAINT `fk_vehicles_trim2` FOREIGN KEY (`trim_id`) REFERENCES `trim` (`trim_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
