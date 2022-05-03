-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2022 at 08:53 AM
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
-- Database: `cars_rdbms_business_keys`
--

-- --------------------------------------------------------

--
-- Table structure for table `bodystyle`
--

CREATE TABLE `bodystyle` (
  `bodystyle` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bodystyle`
--

INSERT INTO `bodystyle` (`bodystyle`) VALUES
('2dr Car'),
('4dr Car'),
('Convertible'),
('Crew Cab Chassis-Cab'),
('Crew Cab Pickup'),
('Extended Cab Pickup'),
('Hatchback'),
('Regular Cab Chassis-Cab'),
('Regular Cab Pickup'),
('Sport Utility');

-- --------------------------------------------------------

--
-- Table structure for table `engine`
--

CREATE TABLE `engine` (
  `engine` varchar(50) NOT NULL,
  `fueltype` varchar(13) NOT NULL,
  `model` varchar(30) NOT NULL,
  `make` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `engine`
--

INSERT INTO `engine` (`engine`, `fueltype`, `model`, `make`) VALUES
('6 Cyl - 3.5 L', 'Gasoline Fuel', 'MDX', 'Acura'),
('2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'RDX', 'Acura'),
('3.5L V6 24V MPFI SOHC', 'Gasoline Fuel', 'RDX', 'Acura'),
('3.5L V6 24V GDI SOHC', 'Gasoline Fuel', 'RLX', 'Acura'),
('2.0L I4 16V GDI DOHC Turbo Flexible Fuel', 'Gasoline Fuel', 'Q5', 'Audi'),
('3.0L I6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'M3', 'BMW'),
('3.6L V6 24V GDI DOHC', 'Gasoline Fuel', 'Colorado', 'Chevrolet'),
('6.2L V8 16V GDI OHV', 'Gasoline Fuel', 'Corvette', 'Chevrolet'),
('4 Cyl - 1.8 L', 'Gasoline Fuel', 'Cruze', 'Chevrolet'),
('1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Malibu', 'Chevrolet'),
('1.8L I4 16V MPFI DOHC', 'Gasoline Fuel', 'Sonic', 'Chevrolet'),
('5.3L V8 16V GDI OHV', 'Flex Fuel', 'Tahoe', 'Chevrolet'),
('3.6L V6 24V GDI DOHC', 'Gasoline Fuel', 'Traverse', 'Chevrolet'),
('1.4L I4 16V MPFI DOHC Turbo', 'Gasoline Fuel', 'Trax', 'Chevrolet'),
('6.4L V8 16V MPFI OHV', 'Gasoline Fuel', 'Charger', 'Dodge'),
('3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 'Durango', 'Dodge'),
('1.0L I3 12V GDI DOHC Turbo', 'Gasoline Fuel', 'EcoSport', 'Ford'),
('2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'EcoSport', 'Ford'),
('4 Cyl - 2.0 L', 'Gasoline Fuel', 'EcoSport', 'Ford'),
('2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Edge', 'Ford'),
('2.7L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'Edge', 'Ford'),
('3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'Edge', 'Ford'),
('4 Cyl - 2.0 L', 'Gasoline Fuel', 'Edge', 'Ford'),
('1.5L I3 12V GDI DOHC Turbo', 'Gasoline Fuel', 'Escape', 'Ford'),
('1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Escape', 'Ford'),
('1.6L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Escape', 'Ford'),
('2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Escape', 'Ford'),
('4 Cyl - 2.0 L', 'Gasoline Fuel', 'Escape', 'Ford'),
('3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'Expedition', 'Ford'),
('2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Explorer', 'Ford'),
('3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'Explorer', 'Ford'),
('3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'Explorer', 'Ford'),
('6 Cyl - 3.0 L', 'Gasoline Fuel', 'Explorer', 'Ford'),
('6 Cyl - 3.5 L', 'Gasoline Fuel', 'Explorer', 'Ford'),
('2.7L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 'F-150', 'Ford'),
('3.3L V6 24V PDI DOHC Flexible Fuel', 'Gasoline Fuel', 'F-150', 'Ford'),
('3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'F-150', 'Ford'),
('3.5L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 'F-150', 'Ford'),
('5.0L V8 32V MPFI DOHC Flexible Fuel', 'Flex Fuel', 'F-150', 'Ford'),
('5.0L V8 32V PDI DOHC', 'Gasoline Fuel', 'F-150', 'Ford'),
('5.4L V8 16V MPFI SOHC Supercharged', 'Gasoline Fuel', 'F-150', 'Ford'),
('5.4L V8 24V MPFI SOHC Flexible Fuel', 'Flex Fuel', 'F-150', 'Ford'),
('6 Cyl - 2.7 L', 'Gasoline Fuel', 'F-150', 'Ford'),
('8 Cyl - 5.0 L', 'Gasoline Fuel', 'F-150', 'Ford'),
('6.2L V8 16V MPFI SOHC Flexible Fuel', 'Gasoline Fuel', 'F-250', 'Ford'),
('8 Cyl - 7.3 L', 'Gasoline Fuel', 'F-550 DRW', 'Ford'),
('4 Cyl - 1.6 L', 'Gasoline Fuel', 'Fiesta', 'Ford'),
('3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'Flex', 'Ford'),
('3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'Flex', 'Ford'),
('1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Fusion', 'Ford'),
('2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Fusion', 'Ford'),
('4 Cyl - 1.5 L', 'Gasoline Fuel', 'Fusion', 'Ford'),
('2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'Fusion Energi', 'Ford'),
('2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'Fusion Hybrid', 'Ford'),
('2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Mustang', 'Ford'),
('5.2L V8 32V MPFI DOHC Supercharged', 'Gasoline Fuel', 'Mustang', 'Ford'),
('2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Ranger', 'Ford'),
('4 Cyl - 2.3 L', 'Gasoline Fuel', 'Ranger', 'Ford'),
('6.2L V8 16V MPFI SOHC Flexible Fuel', 'Gasoline Fuel', 'Super Duty F-250 SRW', 'Ford'),
('6.4L V8 32V DDI OHV Twin Turbo Diesel', 'Diesel Fuel', 'Super Duty F-550 DRW', 'Ford'),
('3.5L V6 24V MPFI DOHC Flexible Fuel', 'Gasoline Fuel', 'Taurus', 'Ford'),
('2.5L I4 16V GDI DOHC', 'Gasoline Fuel', 'Acadia', 'GMC'),
('3.6L V6 24V GDI DOHC', 'Gasoline Fuel', 'Acadia', 'GMC'),
('4 Cyl - 1.8 L', 'Gasoline Fuel', 'Civic Sdn', 'Honda'),
('1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Civic Sedan', 'Honda'),
('1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'CR-V', 'Honda'),
('4 Cyl - 1.5 L', 'Gasoline Fuel', 'CR-V', 'Honda'),
('2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Santa Fe', 'Hyundai'),
('2.4L I4 16V GDI DOHC', 'Gasoline Fuel', 'Sonata', 'Hyundai'),
('3.2L V6 24V MPFI DOHC', 'Gasoline Fuel', 'Cherokee', 'Jeep'),
('2.4L I4 16V MPFI SOHC', 'Gasoline Fuel', 'Compass', 'Jeep'),
('6 Cyl - 3.6 L', 'Gasoline Fuel', 'Grand Cherokee', 'Jeep'),
('2.4L I4 16V MPFI DOHC', 'Gasoline Fuel', 'Patriot', 'Jeep'),
('3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 'Wrangler', 'Jeep'),
('3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 'Wrangler JK Unlimited', 'Jeep'),
('3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 'Wrangler Unlimited', 'Jeep'),
('6 Cyl - 3.6 L', 'Gasoline Fuel', 'Wrangler Unlimited', 'Jeep'),
('2.0L I4 16V MPFI DOHC', 'Gasoline Fuel', 'Forte', 'Kia'),
('2.4L I4 16V GDI DOHC', 'Gasoline Fuel', 'Sorento', 'Kia'),
('3.3L V6 24V GDI DOHC', 'Gasoline Fuel', 'Sorento', 'Kia'),
('4 Cyl - 2.0 L', 'Gasoline Fuel', 'Discovery Sport', 'Land Rover'),
('2.7L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'Continental', 'Lincoln'),
('2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'MKC', 'Lincoln'),
('3.5L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 'Navigator', 'Lincoln'),
('2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'Mazda CX-3', 'Mazda'),
('2.5L I4 16V GDI DOHC', 'Gasoline Fuel', 'Mazda CX-5', 'Mazda'),
('2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'Mazda3', 'Mazda'),
('2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Convertible', 'MINI'),
('4.0L V6 24V MPFI DOHC', 'Gasoline Fuel', 'Frontier', 'Nissan'),
('3.5L V6 24V GDI DOHC', 'Gasoline Fuel', 'Pathfinder', 'Nissan'),
('2.5L I4 16V MPFI DOHC', 'Gasoline Fuel', 'Rogue', 'Nissan'),
('3.6L V6 24V MPFI DOHC', 'Hybrid Fuel', '1500', 'RAM'),
('5.7L V8 16V MPFI OHV', 'Gasoline Fuel', '1500', 'RAM'),
('5.7L V8 16V MPFI OHV', 'Gasoline Fuel', '2500', 'RAM'),
('6.7L I6 24V DDI OHV Turbo Diesel', 'Diesel Fuel', '5500', 'RAM'),
('2.4L H4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Ascent', 'Subaru'),
('2.0L', 'Gasoline Fuel', 'Crosstrek', 'Subaru'),
('2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'Crosstrek', 'Subaru'),
('2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'Forester', 'Subaru'),
('2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'Forester', 'Subaru'),
('2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'Impreza', 'Subaru'),
('4 Cyl - 2.0 L', 'Gasoline Fuel', 'Impreza', 'Subaru'),
('2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'Legacy', 'Subaru'),
('2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'Legacy', 'Subaru'),
('2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'Outback', 'Subaru'),
('2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'Outback', 'Subaru'),
('3.6L H6 24V MPFI DOHC', 'Gasoline Fuel', 'Outback', 'Subaru'),
('2.0L H4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'WRX', 'Subaru'),
('1.8L I4 16V MPFI DOHC', 'Gasoline Fuel', 'Corolla', 'Toyota'),
('3.5L V6 24V PDI DOHC', 'Gasoline Fuel', 'Highlander', 'Toyota'),
('2.5L I4 16V PDI DOHC', 'Gasoline Fuel', 'RAV4', 'Toyota'),
('2.5L I4 16V PDI DOHC Hybrid', 'Hybrid Fuel', 'RAV4', 'Toyota'),
('5.7L V8 32V MPFI DOHC', 'Gasoline Fuel', 'Tundra', 'Toyota'),
('1.4L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'Jetta', 'Volkswagen'),
('2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'XC60', 'Volvo'),
('2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'XC90', 'Volvo');

-- --------------------------------------------------------

--
-- Table structure for table `extcolor`
--

CREATE TABLE `extcolor` (
  `extcolor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `extcolor`
--

INSERT INTO `extcolor` (`extcolor`) VALUES
('Aegean Blue Metallic'),
('Agate Black'),
('Agate Black Metallic'),
('Arctic White'),
('Aurora Black'),
('Austin Yellow Metallic'),
('Baltic Sea Green Metallic'),
('Basque Red Pearl II'),
('Billet Silver Metallic Clearcoat'),
('Black'),
('Black Clearcoat'),
('Black Sand Pearl'),
('Blue'),
('Blue Candy Metallic Tinted Clearcoat'),
('Blue Metallic'),
('Blueprint'),
('Bright White Clearcoat'),
('Brilliant Silver'),
('Brilliant Silver Metallic'),
('Burgundy'),
('Burgundy Velvet Metallic Tinted Clearcoat'),
('Caspian Blue Metallic'),
('Cinnamon Glaze Metallic'),
('Classic Silver Metallic'),
('Cool Gray Khaki'),
('Crimson Red Pearl'),
('Crystal Black Pearl'),
('Crystal Black Silica'),
('Crystal White Pearl'),
('Cuvee Silver Metallic'),
('Dark Blue Pearl'),
('Dark Gray Metallic'),
('Db Black Clearcoat'),
('Deep Crystal Blue Mica'),
('Diamond Black Crystal Pearlcoat'),
('Diamond White'),
('Ebony Black'),
('Ebony Twilight Metallic'),
('Galaxy Gray Metallic'),
('Ginger Ale Metallic'),
('Grabber Lime'),
('Granite Clearcoat'),
('Granite Crystal Metallic Clearcoat'),
('Graphite Blue'),
('Gray'),
('Guard Metallic'),
('Horizon Blue Pearl'),
('Ice Silver Metallic'),
('Iconic Silver Metallic'),
('Infinite Black'),
('Infinite Black Metallic'),
('Infinite Blue Metallic Tinted Clearcoat'),
('Ingot Silver Metallic'),
('Island Blue Pearl'),
('Jasper Green Metallic'),
('Lapis Blue Pearl'),
('Laser Blue Pearlcoat'),
('Lightning Blue'),
('Lightning Blue Metallic'),
('Magma Red Metallic'),
('Magnetic Black Pearl'),
('Magnetic Metallic'),
('Magnetite Gray Metallic'),
('Majestic Black Pearl'),
('Mineral Gray Metallic'),
('Modern Steel Metallic'),
('Moonwalk Grey Metallic'),
('Mosaic Black Metallic'),
('Octane Red Pearlcoat'),
('Osmium Grey Metallic'),
('Oxford White'),
('Phantom Black'),
('Platinum Gray Metallic'),
('Portofino Gray'),
('Quartz Blue Pearl'),
('Red'),
('Royal Red Metallic'),
('Ruby Red Metallic Tinted Clearcoat'),
('Sangria Metallic Clearcoat'),
('Sedona Orange Metallic'),
('Shadow Black'),
('Silver'),
('Silver Ice Metallic'),
('Slate Metallic'),
('Smoke Metallic'),
('Snowflake White Pearl Mica'),
('Sonic Blue Metallic'),
('Soul Red Crystal Metallic'),
('Star White Metallic Tri-Coat'),
('Sterling Gray Metallic'),
('Summit White'),
('Sunset Metallic'),
('Super Black'),
('Titanium Flash Mica'),
('Titanium Silver'),
('Velocity Blue Metallic'),
('Venetian Red Pearl'),
('White'),
('White Clearcoat'),
('White Gold'),
('White Gold Metallic'),
('White Knuckle Clearcoat'),
('White Orchid Pearl'),
('White Platinum Metallic Tri Coat'),
('White Platinum Metallic Tri-Coat'),
('White Platinum Tri-Coat'),
('Yulong White Metallic');

-- --------------------------------------------------------

--
-- Table structure for table `intcolor`
--

CREATE TABLE `intcolor` (
  `intcolor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `intcolor`
--

INSERT INTO `intcolor` (`intcolor`) VALUES
('Adrenaline Red'),
('Almond'),
('Ash'),
('Black'),
('Black W/Orange Stitching'),
('Black/Black'),
('Camel'),
('Cappuccino'),
('Carbon Black'),
('Charcoal'),
('Charcoal Black'),
('Chromite Gray/Chrcl Black'),
('Cognac'),
('Dark Atmosphere/Loft Brown'),
('Dark Earth Gray'),
('Dark Graphite'),
('Dark Slate Gray'),
('Diesel Gray/Black'),
('Dune'),
('Ebony'),
('Ebony Black'),
('Ebony Black w/Fire Orange'),
('Ebony Black w/Red Accent'),
('Ebony w/Smoke Gray'),
('Ebony/Ebony'),
('Graphite/White Stitching'),
('Gray'),
('Gray w/Yellow Stitching'),
('Graystone'),
('Ivory'),
('Java'),
('Jet Black'),
('Jet Black/Dark Ash'),
('Jet Black/Medium Titanium'),
('Mayan Gray/Umber'),
('Medium Earth Gray'),
('Medium Light Camel'),
('Medium Light Stone'),
('Medium stone'),
('Off-Black'),
('Parchment'),
('RED'),
('Ruby Red/Black'),
('Saddle Brown'),
('Satin Black'),
('Slate Black'),
('Soft Ceramic'),
('Steel'),
('Steel Gray'),
('Tan'),
('Titan Blk/Palladium Gray'),
('Titanium Gray'),
('Warm Ivory');

-- --------------------------------------------------------

--
-- Table structure for table `make`
--

CREATE TABLE `make` (
  `make` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `make`
--

INSERT INTO `make` (`make`) VALUES
('Acura'),
('Audi'),
('BMW'),
('Chevrolet'),
('Dodge'),
('Ford'),
('GMC'),
('Honda'),
('Hyundai'),
('Jeep'),
('Kia'),
('Land Rover'),
('Lincoln'),
('Mazda'),
('MINI'),
('Nissan'),
('RAM'),
('Subaru'),
('Toyota'),
('Volkswagen'),
('Volvo');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `model` varchar(30) NOT NULL,
  `make` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`model`, `make`) VALUES
('MDX', 'Acura'),
('RDX', 'Acura'),
('RLX', 'Acura'),
('Q5', 'Audi'),
('M3', 'BMW'),
('Colorado', 'Chevrolet'),
('Corvette', 'Chevrolet'),
('Cruze', 'Chevrolet'),
('Malibu', 'Chevrolet'),
('Sonic', 'Chevrolet'),
('Tahoe', 'Chevrolet'),
('Traverse', 'Chevrolet'),
('Trax', 'Chevrolet'),
('Charger', 'Dodge'),
('Durango', 'Dodge'),
('EcoSport', 'Ford'),
('Edge', 'Ford'),
('Escape', 'Ford'),
('Expedition', 'Ford'),
('Explorer', 'Ford'),
('F-150', 'Ford'),
('F-250', 'Ford'),
('F-550 DRW', 'Ford'),
('Fiesta', 'Ford'),
('Flex', 'Ford'),
('Fusion', 'Ford'),
('Fusion Energi', 'Ford'),
('Fusion Hybrid', 'Ford'),
('Mustang', 'Ford'),
('Ranger', 'Ford'),
('Super Duty F-250 SRW', 'Ford'),
('Super Duty F-550 DRW', 'Ford'),
('Taurus', 'Ford'),
('Acadia', 'GMC'),
('Civic Sdn', 'Honda'),
('Civic Sedan', 'Honda'),
('CR-V', 'Honda'),
('Santa Fe', 'Hyundai'),
('Sonata', 'Hyundai'),
('Cherokee', 'Jeep'),
('Compass', 'Jeep'),
('Grand Cherokee', 'Jeep'),
('Patriot', 'Jeep'),
('Wrangler', 'Jeep'),
('Wrangler JK Unlimited', 'Jeep'),
('Wrangler Unlimited', 'Jeep'),
('Forte', 'Kia'),
('Sorento', 'Kia'),
('Discovery Sport', 'Land Rover'),
('Continental', 'Lincoln'),
('MKC', 'Lincoln'),
('Navigator', 'Lincoln'),
('Mazda CX-3', 'Mazda'),
('Mazda CX-5', 'Mazda'),
('Mazda3', 'Mazda'),
('Convertible', 'MINI'),
('Frontier', 'Nissan'),
('Pathfinder', 'Nissan'),
('Rogue', 'Nissan'),
('1500', 'RAM'),
('2500', 'RAM'),
('5500', 'RAM'),
('Ascent', 'Subaru'),
('Crosstrek', 'Subaru'),
('Forester', 'Subaru'),
('Impreza', 'Subaru'),
('Legacy', 'Subaru'),
('Outback', 'Subaru'),
('WRX', 'Subaru'),
('Corolla', 'Toyota'),
('Highlander', 'Toyota'),
('RAV4', 'Toyota'),
('Tundra', 'Toyota'),
('Jetta', 'Volkswagen'),
('XC60', 'Volvo'),
('XC90', 'Volvo');

-- --------------------------------------------------------

--
-- Table structure for table `transmission`
--

CREATE TABLE `transmission` (
  `transmission` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transmission`
--

INSERT INTO `transmission` (`transmission`) VALUES
('Automatic'),
('Manual'),
('Variable');

-- --------------------------------------------------------

--
-- Table structure for table `trim`
--

CREATE TABLE `trim` (
  `trim` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `make` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trim`
--

INSERT INTO `trim` (`trim`, `model`, `make`) VALUES
('Base', 'MDX', 'Acura'),
('Base', 'RDX', 'Acura'),
('SH-AWD w/Technology Pkg', 'RDX', 'Acura'),
('Tech Pkg', 'RLX', 'Acura'),
('Premium Plus', 'Q5', 'Audi'),
('Base', 'M3', 'BMW'),
('4WD Crew Cab', 'Colorado', 'Chevrolet'),
('4WD LT Crew Cab', 'Colorado', 'Chevrolet'),
('Stingray 1LT', 'Corvette', 'Chevrolet'),
('LS', 'Cruze', 'Chevrolet'),
('LT', 'Malibu', 'Chevrolet'),
('LT', 'Sonic', 'Chevrolet'),
('LT', 'Tahoe', 'Chevrolet'),
('LT Leather', 'Traverse', 'Chevrolet'),
('LT AWD', 'Trax', 'Chevrolet'),
('R/T Scat Pack', 'Charger', 'Dodge'),
('GT', 'Durango', 'Dodge'),
('GT Plus', 'Durango', 'Dodge'),
('SXT AWD', 'Durango', 'Dodge'),
('S', 'EcoSport', 'Ford'),
('SE', 'EcoSport', 'Ford'),
('SE 4WD', 'EcoSport', 'Ford'),
('SES 4WD', 'EcoSport', 'Ford'),
('SE', 'Edge', 'Ford'),
('SE AWD', 'Edge', 'Ford'),
('SEL', 'Edge', 'Ford'),
('SEL AWD', 'Edge', 'Ford'),
('Sport', 'Edge', 'Ford'),
('ST', 'Edge', 'Ford'),
('ST AWD', 'Edge', 'Ford'),
('Titanium', 'Edge', 'Ford'),
('Titanium AWD', 'Edge', 'Ford'),
('SE', 'Escape', 'Ford'),
('SE 4WD', 'Escape', 'Ford'),
('SE AWD', 'Escape', 'Ford'),
('SEL', 'Escape', 'Ford'),
('SEL 4WD', 'Escape', 'Ford'),
('SEL AWD', 'Escape', 'Ford'),
('Titanium', 'Escape', 'Ford'),
('Titanium 4WD', 'Escape', 'Ford'),
('Limited', 'Expedition', 'Ford'),
('Limited 4X4', 'Expedition', 'Ford'),
('XLT', 'Expedition', 'Ford'),
('XLT 4X4', 'Expedition', 'Ford'),
('4WD', 'Explorer', 'Ford'),
('Platinum 4WD', 'Explorer', 'Ford'),
('Sport', 'Explorer', 'Ford'),
('Sport 4WD', 'Explorer', 'Ford'),
('ST 4WD', 'Explorer', 'Ford'),
('XLT', 'Explorer', 'Ford'),
('XLT 4WD', 'Explorer', 'Ford'),
('Lariat', 'F-150', 'Ford'),
('LARIAT SuperCrew', 'F-150', 'Ford'),
('Lightning', 'F-150', 'Ford'),
('Platinum SuperCrew', 'F-150', 'Ford'),
('Raptor', 'F-150', 'Ford'),
('XL SuperCab', 'F-150', 'Ford'),
('XL SuperCrew', 'F-150', 'Ford'),
('XLT', 'F-150', 'Ford'),
('XLT SuperCrew', 'F-150', 'Ford'),
('King Ranch Crew Cab', 'F-250', 'Ford'),
('XL 4WD 12FT LANDSCAPE DUMP', 'F-550 DRW', 'Ford'),
('SE', 'Fiesta', 'Ford'),
('Limited', 'Flex', 'Ford'),
('Limited EcoBoost', 'Flex', 'Ford'),
('SE', 'Flex', 'Ford'),
('SEL', 'Flex', 'Ford'),
('SE', 'Fusion', 'Ford'),
('Titanium', 'Fusion', 'Ford'),
('SE', 'Fusion Energi', 'Ford'),
('Titanium', 'Fusion Energi', 'Ford'),
('SE', 'Fusion Hybrid', 'Ford'),
('EcoBoost', 'Mustang', 'Ford'),
('Shelby GT500', 'Mustang', 'Ford'),
('Base', 'Ranger', 'Ford'),
('LARIAT', 'Ranger', 'Ford'),
('LARIAT SuperCrew', 'Ranger', 'Ford'),
('XLT', 'Ranger', 'Ford'),
('XLT 4WD SuperCrew', 'Ranger', 'Ford'),
('Lariat', 'Super Duty F-250 SRW', 'Ford'),
('XL Open Service Body', 'Super Duty F-550 DRW', 'Ford'),
('Limited', 'Taurus', 'Ford'),
('SLE', 'Acadia', 'GMC'),
('SLT AWD', 'Acadia', 'GMC'),
('EX', 'Civic Sdn', 'Honda'),
('EX-L', 'Civic Sedan', 'Honda'),
('EX-T', 'Civic Sedan', 'Honda'),
('EX', 'CR-V', 'Honda'),
('EX AWD', 'CR-V', 'Honda'),
('Limited AWD', 'Santa Fe', 'Hyundai'),
('2.4L SE', 'Sonata', 'Hyundai'),
('Limited', 'Cherokee', 'Jeep'),
('Latitude', 'Compass', 'Jeep'),
('Limited 4X4', 'Compass', 'Jeep'),
('Trailhawk', 'Compass', 'Jeep'),
('High Altitude', 'Grand Cherokee', 'Jeep'),
('Latitude', 'Patriot', 'Jeep'),
('Rubicon Hard Rock 4WD', 'Wrangler', 'Jeep'),
('Sport S', 'Wrangler JK Unlimited', 'Jeep'),
('Rubicon', 'Wrangler Unlimited', 'Jeep'),
('Sport 4WD', 'Wrangler Unlimited', 'Jeep'),
('S', 'Forte', 'Kia'),
('LX', 'Sorento', 'Kia'),
('LX AWD', 'Sorento', 'Kia'),
('SE 4WD', 'Discovery Sport', 'Land Rover'),
('Reserve', 'Continental', 'Lincoln'),
('Select', 'MKC', 'Lincoln'),
('Reserve 4X4', 'Navigator', 'Lincoln'),
('Touring', 'Mazda CX-3', 'Mazda'),
('Grand Touring', 'Mazda CX-5', 'Mazda'),
('Touring', 'Mazda CX-5', 'Mazda'),
('i Touring', 'Mazda3', 'Mazda'),
('Cooper S', 'Convertible', 'MINI'),
('PRO-4X', 'Frontier', 'Nissan'),
('SV', 'Frontier', 'Nissan'),
('SV', 'Pathfinder', 'Nissan'),
('S AWD', 'Rogue', 'Nissan'),
('SV', 'Rogue', 'Nissan'),
('SV AWD', 'Rogue', 'Nissan'),
('Big Horn', '1500', 'RAM'),
('BIG HORN BLACK QUAD CAB 4X4', '1500', 'RAM'),
('Big Horn Crew Cab', '1500', 'RAM'),
('Tradesman', '2500', 'RAM'),
('Tradesman', '5500', 'RAM'),
('Limited', 'Ascent', 'Subaru'),
('Limited Awd', 'Ascent', 'Subaru'),
('Limited Awd', 'Crosstrek', 'Subaru'),
('Premium', 'Crosstrek', 'Subaru'),
('Premium Awd', 'Crosstrek', 'Subaru'),
('Sport AWD', 'Crosstrek', 'Subaru'),
('AWD', 'Forester', 'Subaru'),
('Limited', 'Forester', 'Subaru'),
('Limited Awd', 'Forester', 'Subaru'),
('Premium Awd', 'Forester', 'Subaru'),
('Sport 4WD', 'Forester', 'Subaru'),
('Sport AWD', 'Forester', 'Subaru'),
('Touring 4WD', 'Forester', 'Subaru'),
('Touring AWD', 'Forester', 'Subaru'),
('AWD', 'Impreza', 'Subaru'),
('Premium', 'Impreza', 'Subaru'),
('Premium AWD', 'Impreza', 'Subaru'),
('Limited Awd', 'Legacy', 'Subaru'),
('Premium Awd', 'Legacy', 'Subaru'),
('Limited Awd', 'Outback', 'Subaru'),
('Premium', 'Outback', 'Subaru'),
('Premium AWD', 'Outback', 'Subaru'),
('Premium', 'WRX', 'Subaru'),
('Premium Awd', 'WRX', 'Subaru'),
('LE', 'Corolla', 'Toyota'),
('S', 'Corolla', 'Toyota'),
('S Plus', 'Corolla', 'Toyota'),
('Base', 'Highlander', 'Toyota'),
('Hybrid Limited', 'RAV4', 'Toyota'),
('XLE Premium', 'RAV4', 'Toyota'),
('Base', 'Tundra', 'Toyota'),
('1.4T S', 'Jetta', 'Volkswagen'),
('Dynamic', 'XC60', 'Volvo'),
('Momentum', 'XC90', 'Volvo');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `make` varchar(15) NOT NULL,
  `model` varchar(30) NOT NULL,
  `year` int(11) NOT NULL,
  `trim` varchar(35) NOT NULL,
  `extcolor` varchar(50) DEFAULT NULL,
  `intcolor` varchar(50) DEFAULT NULL,
  `transmission` varchar(10) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `engine` varchar(50) NOT NULL,
  `fueltype` varchar(13) NOT NULL,
  `vehicletype` varchar(4) NOT NULL,
  `bodystyle` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `vin` char(17) NOT NULL,
  `modelcode` varchar(11) DEFAULT NULL,
  `msrp` varchar(5) NOT NULL,
  `stocknum` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`make`, `model`, `year`, `trim`, `extcolor`, `intcolor`, `transmission`, `price`, `engine`, `fueltype`, `vehicletype`, `bodystyle`, `name`, `vin`, `modelcode`, `msrp`, `stocknum`) VALUES
('Jeep', 'Wrangler JK Unlimited', 2018, 'Sport S', 'Billet Silver Metallic Clearcoat', 'Black', 'Automatic', 34495, '3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Convertible', '2018 Jeep Wrangler JK Unlimited Sport S', '1C4BJWDG0JL931484', 'JKJM74', '39995', 'U14076'),
('Jeep', 'Wrangler Unlimited', 2015, 'Sport 4WD', 'Billet Silver Metallic Clearcoat', 'Black', 'Automatic', 24999, '3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Convertible', '2015 Jeep Wrangler Unlimited Sport 4WD', '1C4BJWDG8FL544401', 'JKJM74', '28999', 'US4926'),
('Jeep', 'Wrangler Unlimited', 2015, 'Sport 4WD', 'Black Clearcoat', 'Black', 'Automatic', 26499, '3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Convertible', '2015 Jeep Wrangler Unlimited Sport 4WD', '1C4BJWDGXFL609653', 'JKJM74', '28999', 'US5212'),
('Jeep', 'Wrangler', 2016, 'Rubicon Hard Rock 4WD', 'Black Clearcoat', 'Black', 'Automatic', 33999, '3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Convertible', '2016 Jeep Wrangler Rubicon Hard Rock 4WD', '1C4HJWCGXGL167986', 'JKJS72', '38999', 'US4754'),
('Jeep', 'Wrangler Unlimited', 2014, 'Rubicon', 'Black Clearcoat', 'Black', 'Automatic', 32995, '6 Cyl - 3.6 L', 'Gasoline Fuel', 'used', 'Convertible', '2014 Jeep Wrangler Unlimited Rubicon', '1C4HJWFG8EL189011', 'JKJS74', '0', 'U30061'),
('Jeep', 'Patriot', 2014, 'Latitude', 'Bright White Clearcoat', 'Dark Slate Gray', 'Automatic', 16495, '2.4L I4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2014 Jeep Patriot Latitude', '1C4NJRFB0ED617009', 'MKJM74', '19995', 'U30020'),
('Jeep', 'Cherokee', 2019, 'Limited', 'Granite Crystal Metallic Clearcoat', 'Black', 'Automatic', 27995, '3.2L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Jeep Cherokee Limited', '1C4PJMDX3KD384927', 'KLJP74', '29995', 'U30053'),
('Jeep', 'Cherokee', 2018, 'Limited', 'Bright White Clearcoat', 'Black', 'Automatic', 29995, '3.2L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Jeep Cherokee Limited', '1C4PJMDX9JD549197', 'KLJP74', '36995', 'U14040'),
('Dodge', 'Durango', 2019, 'SXT AWD', 'Granite Clearcoat', 'Black', 'Automatic', 30999, '3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Dodge Durango SXT AWD', '1C4RDJAG9KC781356', 'WDEL75', '33999', 'US5073'),
('Dodge', 'Durango', 2020, 'GT Plus', 'White Knuckle Clearcoat', 'Black', 'Automatic', 40495, '3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Dodge Durango GT Plus', '1C4RDJDG1LC229881', 'WDEH75', '45995', 'U30005'),
('Dodge', 'Durango', 2018, 'GT', 'Octane Red Pearlcoat', 'Black', 'Automatic', 32995, '3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Dodge Durango GT', '1C4RDJDG3JC409327', 'WDEH75', '38995', 'U14053'),
('Dodge', 'Durango', 2018, 'GT', 'Db Black Clearcoat', 'Black', 'Automatic', 38795, '3.6L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Dodge Durango GT', '1C4RDJDG5JC452129', 'WDEH75', '43995', 'U14149'),
('Jeep', 'Grand Cherokee', 2018, 'High Altitude', 'Sangria Metallic Clearcoat', 'Black', 'Automatic', 41995, '6 Cyl - 3.6 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Jeep Grand Cherokee High Altitude', '1C4RJFCG0JC504144', 'WKJS74', '0', 'U30060'),
('RAM', '1500', 2018, 'Big Horn Crew Cab', 'Bright White Clearcoat', 'Diesel Gray/Black', 'Automatic', 35799, '5.7L V8 16V MPFI OHV', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2018 RAM 1500 Big Horn Crew Cab', '1C6RR7LT9JS281823', 'DS6H98', '38999', 'US5037'),
('RAM', '1500', 2021, 'Big Horn', 'Billet Silver Metallic Clearcoat', 'Black', 'Automatic', 44995, '3.6L V6 24V MPFI DOHC', 'Hybrid Fuel', 'used', 'Crew Cab Pickup', '2021 RAM 1500 Big Horn', '1C6RRFFG7MN645135', 'DT6H98', '48995', 'U14004'),
('RAM', '1500', 2019, 'BIG HORN BLACK QUAD CAB 4X4', 'Diamond Black Crystal Pearlcoat', 'Diesel Gray/Black', 'Automatic', 39999, '5.7L V8 16V MPFI OHV', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 RAM 1500 BIG HORN BLACK QUAD CAB 4X4', '1C6SRFBT1KN546442', 'DT6H41', '42999', 'US5238'),
('RAM', '1500', 2020, 'Big Horn', 'Diamond Black Crystal Pearlcoat', 'Diesel Gray/Black', 'Automatic', 41995, '5.7L V8 16V MPFI OHV', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2020 RAM 1500 Big Horn', '1C6SRFBT4LN224394', 'DT6H41', '47995', 'U14078'),
('Ford', 'Mustang', 2020, 'Shelby GT500', 'Grabber Lime', 'Ebony w/Smoke Gray', 'Automatic', 89995, '5.2L V8 32V MPFI DOHC Supercharged', 'Gasoline Fuel', 'used', '2dr Car', '2020 Ford Mustang Shelby GT500', '1FA6P8SJ9L5503579', 'P8S', '93995', 'U14052'),
('Ford', 'Mustang', 2018, 'EcoBoost', 'Ingot Silver Metallic', 'Ebony', 'Automatic', 25999, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', '2dr Car', '2018 Ford Mustang EcoBoost', '1FA6P8TH3J5127356', 'P8T', '27999', 'US4941'),
('Ford', 'Taurus', 2018, 'Limited', 'White', '', 'Automatic', 26995, '3.5L V6 24V MPFI DOHC Flexible Fuel', 'Gasoline Fuel', 'used', '4dr Car', '2018 Ford Taurus Limited', '1FAHP2F85JG118129', 'P2F', '31995', 'U30001'),
('Ford', 'Super Duty F-550 DRW', 2008, 'XL Open Service Body', 'Oxford White', 'Medium stone', 'Automatic', 16999, '6.4L V8 32V DDI OHV Twin Turbo Diesel', 'Diesel Fuel', 'used', 'Crew Cab Chassis-Cab', '2008 Ford Super Duty F-550 DRW XL Open Service Body', '1FDAW57R18ED13508', 'W57', '18999', 'US4891'),
('Ford', 'F-550 DRW', 2020, 'XL 4WD 12FT LANDSCAPE DUMP', 'Oxford White', 'Medium Earth Gray', 'Automatic', 72999, '8 Cyl - 7.3 L', 'Gasoline Fuel', 'used', 'Regular Cab Chassis-Cab', '2020 Ford F-550 DRW XL 4WD 12FT LANDSCAPE DUMP', '1FDUF5HN3LEE11568', 'F5H', '0', 'US5273'),
('Ford', 'Explorer', 2018, '4WD', 'Ingot Silver Metallic', 'Medium Stone', 'Automatic', 27999, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Explorer 4WD', '1FM5K8B81JGC20933', 'K8B', '29999', 'US5267'),
('Ford', 'Explorer', 2019, 'XLT 4WD', 'Magnetic Metallic', 'Ebony Black', 'Automatic', 34999, '6 Cyl - 3.5 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT 4WD', '1FM5K8D80KGB32549', 'K8D', '0', 'US5275'),
('Ford', 'Explorer', 2019, 'XLT 4WD', 'Agate Black Metallic', 'Ebony Black', 'Automatic', 35999, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT 4WD', '1FM5K8D82KGB19060', 'K8D', '37999', 'US5220'),
('Ford', 'Explorer', 2019, 'XLT 4WD', 'Oxford White', 'Ebony Black', 'Automatic', 34999, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT 4WD', '1FM5K8D82KGB32536', 'K8D', '36999', 'US5263'),
('Ford', 'Explorer', 2018, 'XLT', 'Oxford White', 'Ebony Black', 'Automatic', 33995, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Explorer XLT', '1FM5K8D83JGA62155', 'K8D', '36995', 'U14086'),
('Ford', 'Explorer', 2019, 'XLT 4WD', 'Magnetic Metallic', 'Ebony Black', 'Automatic', 35999, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT 4WD', '1FM5K8D83KGA43879', 'K8D', '37999', 'US5231'),
('Ford', 'Explorer', 2019, 'XLT', 'Burgundy', '', 'Automatic', 32995, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT', '1FM5K8D83KGA57085', 'K8D', '37995', 'U14139'),
('Ford', 'Explorer', 2019, 'XLT 4WD', 'White Platinum Metallic Tri-Coat', 'Ebony Black w/Fire Orange', 'Automatic', 33799, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT 4WD', '1FM5K8D83KGB33078', 'K8D', '37999', 'US4826'),
('Ford', 'Explorer', 2018, 'XLT 4WD', 'Shadow Black', 'Ebony Black', 'Automatic', 30999, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Explorer XLT 4WD', '1FM5K8D84JGC20938', 'K8D', '35999', 'US4758'),
('Ford', 'Explorer', 2018, 'XLT', 'Ruby Red Metallic Tinted Clearcoat', 'Ebony Black', 'Automatic', 31495, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Explorer XLT', '1FM5K8D85JGC11312', 'K8D', '35995', 'U13983'),
('Ford', 'Explorer', 2019, 'XLT 4WD', 'Agate Black Metallic', 'Ebony Black', 'Automatic', 33999, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT 4WD', '1FM5K8D86KGA02033', 'K8D', '36999', 'US5041'),
('Ford', 'Explorer', 2018, 'XLT', 'Oxford White', '', 'Automatic', 26945, '6 Cyl - 3.5 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Explorer XLT', '1FM5K8D87JGB50237', 'K8D', '0', 'U14125'),
('Ford', 'Explorer', 2018, 'XLT 4WD', 'Oxford White', 'Ebony Black', 'Automatic', 29999, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Explorer XLT 4WD', '1FM5K8D87JGC30038', 'K8D', '31999', 'US5039'),
('Ford', 'Explorer', 2019, 'XLT 4WD', 'Magnetic Metallic', 'Ebony Black', 'Automatic', 34999, '6 Cyl - 3.5 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT 4WD', '1FM5K8D88KGA57082', 'K8D', '0', 'US5276'),
('Ford', 'Explorer', 2019, 'XLT', 'White Platinum Metallic Tri Coat', '', 'Automatic', 34995, '6 Cyl - 3.5 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT', '1FM5K8D88KGA82452', 'K8D', '0', 'U14124'),
('Ford', 'Explorer', 2019, 'XLT 4WD', 'Oxford White', 'Ebony Black', 'Automatic', 33499, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT 4WD', '1FM5K8D88KGA99591', 'K8D', '35999', 'US5050'),
('Ford', 'Explorer', 2018, 'XLT', 'Blue', '', 'Automatic', 34495, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Explorer XLT', '1FM5K8D89JGC50680', 'K8D', '39995', 'U30027'),
('Ford', 'Explorer', 2019, 'XLT 4WD', 'Magnetic Metallic', 'Medium Light Stone', 'Automatic', 33499, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT 4WD', '1FM5K8D89KGA48259', 'K8D', '36999', 'US4793'),
('Ford', 'Explorer', 2019, 'XLT', 'Blue Metallic', 'Ebony Black', 'Automatic', 33995, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT', '1FM5K8D89KGB32808', 'K8D', '38995', 'U14140'),
('Ford', 'Explorer', 2019, 'XLT 4WD', 'Magnetic Metallic', 'Ebony Black', 'Automatic', 33499, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT 4WD', '1FM5K8D8XKGA74837', 'K8D', '35999', 'US5117'),
('Ford', 'Explorer', 2018, 'XLT', 'Blue Metallic', 'Ebony Black', 'Automatic', 31995, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Explorer XLT', '1FM5K8DH1JGB37967', 'K8D', '35995', 'U14011'),
('Ford', 'Explorer', 2019, 'XLT 4WD', 'Oxford White', 'Ebony Black', 'Automatic', 33999, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer XLT 4WD', '1FM5K8DH7KGB18857', 'K8D', '35999', 'US5088'),
('Ford', 'Explorer', 2021, 'ST 4WD', 'Infinite Blue Metallic Tinted Clearcoat', 'Ebony', 'Automatic', 54999, '6 Cyl - 3.0 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2021 Ford Explorer ST 4WD', '1FM5K8GC6MGA66270', 'K8G', '0', 'US5288'),
('Ford', 'Explorer', 2018, 'Sport', 'Magnetic Metallic', 'Ebony Black w/Red Accent', 'Automatic', 35995, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Explorer Sport', '1FM5K8GT0JGC46968', 'K8G', '39995', 'U13992'),
('Ford', 'Explorer', 2019, 'Sport 4WD', 'Magnetic Metallic', 'Ebony Black w/Red Accent', 'Automatic', 38999, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer Sport 4WD', '1FM5K8GT0KGB32552', 'K8G', '42999', 'US4832'),
('Ford', 'Explorer', 2019, 'Sport 4WD', 'White Platinum Metallic Tri Coat', 'Ebony Black w/Red Accent', 'Automatic', 38499, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer Sport 4WD', '1FM5K8GT3KGA57099', 'K8G', '41999', 'US5189'),
('Ford', 'Explorer', 2019, 'Sport 4WD', 'Agate Black Metallic', 'Ebony Black w/Red Accent', 'Automatic', 39658, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer Sport 4WD', '1FM5K8GT3KGB00047', 'K8G', '42999', 'US4910'),
('Ford', 'Explorer', 2019, 'Sport', 'Blue Metallic', 'Ebony Black w/Red Accent', 'Automatic', 40995, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer Sport', '1FM5K8GT5KGB51131', 'K8G', '44995', 'U14094'),
('Ford', 'Explorer', 2019, 'Sport 4WD', 'Agate Black Metallic', 'Ebony Black w/Red Accent', 'Automatic', 39999, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer Sport 4WD', '1FM5K8GT7KGA02008', 'K8G', '40999', 'US5262'),
('Ford', 'Explorer', 2019, 'Platinum 4WD', 'Blue Metallic', 'Ebony Black', 'Automatic', 43499, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Explorer Platinum 4WD', '1FM5K8HTXKGA67319', 'K8H', '45999', 'US5151'),
('Ford', 'Escape', 2019, 'SE', 'White Platinum Metallic Tri-Coat', 'Chromite Gray/Chrcl Black', 'Automatic', 23499, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SE', '1FMCU0GD2KUA57981', 'U0G', '24999', 'US5203'),
('Ford', 'Escape', 2020, 'SE AWD', 'Agate Black Metallic', 'Dark Earth Gray', 'Automatic', 28999, '1.5L I3 12V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Ford Escape SE AWD', '1FMCU9G64LUA04190', 'U9G', '31999', 'US5099'),
('Ford', 'Escape', 2020, 'SE', '', '', 'Automatic', 28795, '1.5L I3 12V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Ford Escape SE', '1FMCU9G66LUB85423', 'U9G', '32995', 'U14175'),
('Ford', 'Escape', 2019, 'SE', 'Silver', '', 'Automatic', 28495, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SE', '1FMCU9GD0KUA66408', 'U9G', '33995', 'U30025'),
('Ford', 'Escape', 2019, 'SE 4WD', 'Sedona Orange Metallic', 'Medium Light Stone', 'Automatic', 22999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SE 4WD', '1FMCU9GD1KUA84447', 'U9G', '25999', 'US5114'),
('Ford', 'Escape', 2019, 'SE 4WD', 'Magnetic Metallic', 'Chromite Gray/Chrcl Black', 'Automatic', 26999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SE 4WD', '1FMCU9GD2KUA08963', 'U9G', '27999', 'US5222'),
('Ford', 'Escape', 2018, 'SE 4WD', 'Cinnamon Glaze Metallic', 'Medium Light Stone', 'Automatic', 21999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SE 4WD', '1FMCU9GD3JUA77241', 'U9G', '25999', 'US4761'),
('Ford', 'Escape', 2018, 'SE 4WD', 'Shadow Black', 'Charcoal Black', 'Automatic', 22799, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SE 4WD', '1FMCU9GD3JUD12365', 'U9G', '25999', 'US5022'),
('Ford', 'Escape', 2018, 'SE', '', '', 'Automatic', 23795, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SE', '1FMCU9GD3JUD40196', 'U9G', '28995', 'U14172'),
('Ford', 'Escape', 2018, 'SE 4WD', 'Magnetic Metallic', 'Medium Light Stone', 'Automatic', 21799, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SE 4WD', '1FMCU9GD4JUD25092', 'U9G', '25999', 'US4810'),
('Ford', 'Escape', 2019, 'SE 4WD', 'Sedona Orange Metallic', 'Chromite Gray/Chrcl Black', 'Automatic', 23999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SE 4WD', '1FMCU9GD5KUA00615', 'U9G', '25999', 'US5264'),
('Ford', 'Escape', 2019, 'SE 4WD', 'Oxford White', 'Chromite Gray/Chrcl Black', 'Automatic', 25999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SE 4WD', '1FMCU9GD5KUA57333', 'U9G', '27999', 'US5233'),
('Ford', 'Escape', 2019, 'SE 4WD', 'White Platinum Metallic Tri-Coat', 'Chromite Gray/Chrcl Black', 'Automatic', 24699, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SE 4WD', '1FMCU9GD5KUB74085', 'U9G', '26999', 'US5214'),
('Ford', 'Escape', 2018, 'SE', 'White Gold', '', 'Automatic', 22795, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SE', '1FMCU9GD7JUB93817', 'U9G', '26995', 'U14155'),
('Ford', 'Escape', 2018, 'SE 4WD', 'Lightning Blue Metallic', 'Charcoal Black', 'Automatic', 21499, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SE 4WD', '1FMCU9GD7JUC24743', 'U9G', '24999', 'US4859'),
('Ford', 'Escape', 2019, 'SE 4WD', 'Lightning Blue Metallic', 'Chromite Gray/Chrcl Black', 'Automatic', 24499, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SE 4WD', '1FMCU9GD7KUA84436', 'U9G', '26999', 'US4923'),
('Ford', 'Escape', 2019, 'SE', 'Oxford White', 'Chromite Gray/Chrcl Black', 'Automatic', 25995, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SE', '1FMCU9GD7KUB19086', 'U9G', '28995', 'U14059'),
('Ford', 'Escape', 2019, 'SE', 'Magnetic Metallic', 'Medium Light Stone', 'Automatic', 25495, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SE', '1FMCU9GD7KUB43582', 'U9G', '30995', 'U14162'),
('Ford', 'Escape', 2017, 'SE 4WD', 'Oxford White', 'Medium Light Stone', 'Automatic', 20799, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2017 Ford Escape SE 4WD', '1FMCU9GD9HUE61745', 'U9G', '23999', 'US4968'),
('Ford', 'Escape', 2019, 'SE 4WD', 'Ruby Red Metallic Tinted Clearcoat', 'Chromite Gray/Chrcl Black', 'Automatic', 20999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SE 4WD', '1FMCU9GD9KUA28126', 'U9G', '23999', 'US5004'),
('Ford', 'Escape', 2018, 'SE 4WD', 'Oxford White', 'Charcoal Black', 'Automatic', 21799, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SE 4WD', '1FMCU9GDXJUD25064', 'U9G', '24999', 'US4960'),
('Ford', 'Escape', 2019, 'SE 4WD', 'Sedona Orange Metallic', 'Chromite Gray/Chrcl Black', 'Automatic', 23799, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SE 4WD', '1FMCU9GDXKUB42104', 'U9G', '26999', 'US5034'),
('Ford', 'Escape', 2015, 'SE', 'Black', '', 'Automatic', 14995, '1.6L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2015 Ford Escape SE', '1FMCU9GX0FUB67657', 'U9G', '18995', 'U14016'),
('Ford', 'Escape', 2020, 'SEL AWD', 'Oxford White', 'Ebony', 'Automatic', 30499, '1.5L I3 12V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Ford Escape SEL AWD', '1FMCU9H67LUA19751', 'U9H', '31999', 'US5123'),
('Ford', 'Escape', 2019, 'SEL', 'Agate Black Metallic', 'Charcoal Black', 'Automatic', 27795, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL', '1FMCU9HD0KUA48800', 'U9H', '33995', 'U14056'),
('Ford', 'Escape', 2018, 'SEL', 'Black', '', 'Automatic', 23495, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SEL', '1FMCU9HD1JUD53415', 'U9H', '27995', 'U30033'),
('Ford', 'Escape', 2019, 'SEL 4WD', 'Sedona Orange Metallic', 'Charcoal Black', 'Automatic', 24799, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL 4WD', '1FMCU9HD1KUA28152', 'U9H', '27999', 'US4869'),
('Ford', 'Escape', 2019, 'SEL AWD', 'Oxford White', 'Charcoal Black', 'Automatic', 26499, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL AWD', '1FMCU9HD1KUA84480', 'U9H', '27999', 'US5046'),
('Ford', 'Escape', 2019, 'SEL 4WD', 'Magnetic Metallic', 'Charcoal Black', 'Automatic', 25799, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL 4WD', '1FMCU9HD2KUA00618', 'U9H', '28999', 'US4950'),
('Ford', 'Escape', 2019, 'SEL 4WD', 'Lightning Blue Metallic', 'Charcoal Black', 'Automatic', 26999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL 4WD', '1FMCU9HD3KUA73108', 'U9H', '28999', 'US5103'),
('Ford', 'Escape', 2019, 'SEL', 'Agate Black Metallic', 'Charcoal Black', 'Automatic', 26495, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL', '1FMCU9HD3KUA73304', 'U9H', '31995', 'U13998'),
('Ford', 'Escape', 2019, 'SEL 4WD', 'Agate Black Metallic', 'Charcoal Black', 'Automatic', 26499, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL 4WD', '1FMCU9HD3KUB42119', 'U9H', '28999', 'US4806'),
('Ford', 'Escape', 2019, 'SEL 4WD', 'Magnetic Metallic', 'Charcoal Black', 'Automatic', 25999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL 4WD', '1FMCU9HD4KUA37461', 'U9H', '27999', 'US4980'),
('Ford', 'Escape', 2018, 'SEL', '', '', 'Automatic', 23995, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SEL', '1FMCU9HD5JUA14821', 'U9H', '27995', 'U14168'),
('Ford', 'Escape', 2018, 'SEL 4WD', 'Ingot Silver Metallic', 'Charcoal Black', 'Automatic', 24499, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SEL 4WD', '1FMCU9HD5JUA87865', 'U9H', '26999', 'US4780'),
('Ford', 'Escape', 2018, 'SEL', 'Black', '', 'Automatic', 22995, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SEL', '1FMCU9HD5JUD30137', 'U9H', '28995', 'U30000'),
('Ford', 'Escape', 2019, 'SEL 4WD', 'Magnetic Metallic', 'Charcoal Black', 'Automatic', 26799, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL 4WD', '1FMCU9HD5KUA08969', 'U9H', '27999', 'US5215'),
('Ford', 'Escape', 2019, 'SEL 4WD', 'Oxford White', 'Charcoal Black', 'Automatic', 26499, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL 4WD', '1FMCU9HD5KUA08972', 'U9H', '28999', 'US5115'),
('Ford', 'Escape', 2019, 'SEL 4WD', 'Magnetic Metallic', 'Charcoal Black', 'Automatic', 24499, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL 4WD', '1FMCU9HD5KUA66273', 'U9H', '26999', 'US5096'),
('Ford', 'Escape', 2019, 'SEL AWD', 'Agate Black Metallic', 'Charcoal Black', 'Automatic', 26499, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL AWD', '1FMCU9HD5KUA73112', 'U9H', '28999', 'US5062'),
('Ford', 'Escape', 2018, 'SEL', 'White', '', 'Automatic', 28495, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SEL', '1FMCU9HD7JUD30138', 'U9H', '33995', 'U30028'),
('Ford', 'Escape', 2019, 'SEL 4WD', 'Oxford White', 'Charcoal Black', 'Automatic', 25499, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL 4WD', '1FMCU9HD7KUA73113', 'U9H', '27999', 'US5210'),
('Ford', 'Escape', 2019, 'SEL AWD', 'Magnetic Metallic', 'Charcoal Black', 'Automatic', 25799, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL AWD', '1FMCU9HD7KUB84034', 'U9H', '27999', 'US5063'),
('Ford', 'Escape', 2019, 'SEL 4WD', 'White Platinum Metallic Tri-Coat', 'Charcoal Black', 'Automatic', 27999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL 4WD', '1FMCU9HD7KUB91260', 'U9H', '31999', 'US4839'),
('Ford', 'Escape', 2019, 'SEL', 'Ingot Silver Metallic', 'Charcoal Black', 'Automatic', 26995, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL', '1FMCU9HD8KUA43781', 'U9H', '31995', 'U14012'),
('Ford', 'Escape', 2018, 'SEL 4WD', 'Blue Metallic', 'Charcoal Black', 'Automatic', 23999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SEL 4WD', '1FMCU9HD9JUC83923', 'U9H', '26999', 'US4750'),
('Ford', 'Escape', 2018, 'SEL 4WD', 'Ingot Silver Metallic', 'Charcoal Black', 'Automatic', 23999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SEL 4WD', '1FMCU9HDXJUC24749', 'U9H', '26999', 'US4837'),
('Ford', 'Escape', 2018, 'SEL', '', '', 'Automatic', 23795, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape SEL', '1FMCU9HDXJUD12068', 'U9H', '27995', 'U14171'),
('Ford', 'Escape', 2019, 'SEL 4WD', 'White Platinum Metallic Tri-Coat', 'Charcoal Black', 'Automatic', 26999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL 4WD', '1FMCU9HDXKUA66270', 'U9H', '29999', 'US4814'),
('Ford', 'Escape', 2019, 'SEL AWD', 'Oxford White', 'Charcoal Black', 'Automatic', 26799, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape SEL AWD', '1FMCU9HDXKUB73688', 'U9H', '28999', 'US5069'),
('Ford', 'Escape', 2013, 'Titanium 4WD', 'Ginger Ale Metallic', 'Charcoal Black', 'Automatic', 13499, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2013 Ford Escape Titanium 4WD', '1FMCU9J91DUA69678', 'U9J', '16999', 'US5149'),
('Ford', 'Escape', 2019, 'Titanium 4WD', 'Ingot Silver Metallic', 'Charcoal Black', 'Automatic', 29999, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape Titanium 4WD', '1FMCU9J91KUA73114', 'U9J', '32999', 'US4848'),
('Ford', 'Escape', 2018, 'Titanium 4WD', 'Magnetic Metallic', 'Charcoal Black', 'Automatic', 26999, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Escape Titanium 4WD', '1FMCU9J92JUD25063', 'U9J', '28999', 'US5190'),
('Ford', 'Escape', 2019, 'Titanium 4WD', 'White Platinum Metallic Tri-Coat', 'Charcoal Black', 'Automatic', 0, '4 Cyl - 2.0 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape Titanium 4WD', '1FMCU9J93KUA00620', 'U9J', '0', 'US5292'),
('Ford', 'Escape', 2019, 'Titanium', 'Ingot Silver Metallic', 'Charcoal Black', 'Automatic', 29995, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Escape Titanium', '1FMCU9J9XKUA22291', 'U9J', '33995', 'U14048'),
('Ford', 'Expedition', 2019, 'XLT', 'Ruby Red Metallic Tinted Clearcoat', 'Medium Stone', 'Automatic', 51995, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Expedition XLT', '1FMJU1JT3KEA30229', 'U1J', '55995', 'U14080'),
('Ford', 'Expedition', 2019, 'XLT 4X4', 'Agate Black Metallic', 'Ebony', 'Automatic', 50799, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Expedition XLT 4X4', '1FMJU1JT6KEA22061', 'U1J', '52999', 'US5015'),
('Ford', 'Expedition', 2020, 'XLT 4X4', 'Oxford White', 'Ebony', 'Automatic', 62999, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Ford Expedition XLT 4X4', '1FMJU1JT9LEA08544', 'U1J', '66999', 'US3151'),
('Ford', 'Expedition', 2018, 'Limited 4X4', 'Shadow Black', 'Ebony', 'Automatic', 49499, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Expedition Limited 4X4', '1FMJU2AT4JEA48257', 'U2A', '53999', 'US4884'),
('Ford', 'Expedition', 2019, 'Limited', 'White Platinum Metallic Tri-Coat', 'Ebony', 'Automatic', 56995, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Expedition Limited', '1FMJU2AT7KEA09485', 'U2A', '61995', 'U14008'),
('Ford', 'Expedition', 2020, 'Limited 4X4', 'Iconic Silver Metallic', 'Ebony', 'Automatic', 65999, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Ford Expedition Limited 4X4', '1FMJU2AT7LEA84320', 'U2A', '73999', 'US3359'),
('Ford', 'Explorer', 2020, 'XLT', 'Iconic Silver Metallic', 'Ebony', 'Automatic', 39995, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Ford Explorer XLT', '1FMSK8DH2LGA66994', 'K8D', '42995', 'U14096'),
('Ford', 'Explorer', 2020, 'XLT', 'Black', '', 'Automatic', 41995, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Ford Explorer XLT', '1FMSK8DH6LGC06464', 'K8D', '47995', 'U14064'),
('Ford', 'Explorer', 2020, 'XLT 4WD', 'Oxford White', 'Ebony', 'Automatic', 40999, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Ford Explorer XLT 4WD', '1FMSK8DHXLGB17738', 'K8D', '46999', 'US3538'),
('Ford', 'Explorer', 2020, 'XLT 4WD', 'Oxford White', 'Ebony', 'Automatic', 41499, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Ford Explorer XLT 4WD', '1FMSK8DHXLGB37715', 'K8D', '44999', 'US3259'),
('Ford', 'F-250', 2022, 'King Ranch Crew Cab', 'White', 'Java', 'Automatic', 74999, '6.2L V8 16V MPFI SOHC Flexible Fuel', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2022 Ford F-250 King Ranch Crew Cab', '1FT7W2B65NEC04653', 'W2B', '78999', 'US5206'),
('Ford', 'Super Duty F-250 SRW', 2017, 'Lariat', 'Oxford White', 'Camel', 'Automatic', 54495, '6.2L V8 16V MPFI SOHC Flexible Fuel', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2017 Ford Super Duty F-250 SRW Lariat', '1FT7W2B6XHEF04533', 'W2B', '57995', 'U14110'),
('Ford', 'Ranger', 2019, 'XLT', 'Magnetic Metallic', 'Ebony', 'Automatic', 35995, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Extended Cab Pickup', '2019 Ford Ranger XLT', '1FTER1FH1KLA36294', 'R1F', '39995', 'U14039'),
('Ford', 'Ranger', 2019, 'LARIAT', 'White Platinum Tri-Coat', 'Ebony', 'Automatic', 37795, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford Ranger LARIAT', '1FTER4FH0KLA25675', 'R4F', '42995', 'U13966'),
('Ford', 'Ranger', 2019, 'Base', 'Magnetic Metallic', '', 'Automatic', 40995, '4 Cyl - 2.3 L', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford Ranger', '1FTER4FH5KLB02556', 'R4F', '0', 'U14122'),
('Ford', 'Ranger', 2019, 'XLT 4WD SuperCrew', 'Magnetic Metallic', 'Ebony', 'Automatic', 34799, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford Ranger XLT 4WD SuperCrew', '1FTER4FH6KLA99909', 'R4F', '36999', 'US4938'),
('Ford', 'Ranger', 2019, 'LARIAT SuperCrew', 'Oxford White', 'Ebony', 'Automatic', 38999, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford Ranger LARIAT SuperCrew', '1FTER4FH8KLA07134', 'R4F', '40999', 'US5266'),
('Ford', 'Ranger', 2019, 'XLT', 'Oxford White', 'Ebony', 'Automatic', 37995, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford Ranger XLT', '1FTER4FH9KLA46878', 'R4F', '40995', 'U14038'),
('Ford', 'Ranger', 2019, 'LARIAT', 'Lightning Blue Metallic', 'Ebony', 'Automatic', 38495, '2.3L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford Ranger LARIAT', '1FTER4FHXKLA65634', 'R4F', '41995', 'U13960'),
('Ford', 'F-150', 2019, 'LARIAT SuperCrew', 'Ingot Silver Metallic', 'Black', 'Automatic', 48999, '3.5L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford F-150 LARIAT SuperCrew', '1FTEW1E46KFD39366', 'W1E', '51999', 'US4929'),
('Ford', 'F-150', 2020, 'XLT SuperCrew', 'Agate Black Metallic', 'Black', 'Automatic', 46999, '3.5L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2020 Ford F-150 XLT SuperCrew', '1FTEW1E4XLKD93665', 'W1E', '46999', 'US5163'),
('Ford', 'F-150', 2018, 'Platinum SuperCrew', 'Magnetic Metallic', 'Black', 'Automatic', 45999, '5.0L V8 32V PDI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2018 Ford F-150 Platinum SuperCrew', '1FTEW1E50JFC08246', 'W1E', '48999', 'US4899'),
('Ford', 'F-150', 2019, 'XLT SuperCrew', 'Oxford White', 'RED', 'Automatic', 0, '8 Cyl - 5.0 L', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford F-150 XLT SuperCrew', '1FTEW1E50KFA26578', 'W1E', '0', 'US5296'),
('Ford', 'F-150', 2018, 'XLT', 'Magma Red Metallic', 'Black', 'Automatic', 40499, '5.0L V8 32V PDI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2018 Ford F-150 XLT', '1FTEW1E51JFB61373', 'W1E', '41999', 'US4951'),
('Ford', 'F-150', 2018, 'XLT SuperCrew', 'Oxford White', 'Black', 'Automatic', 39999, '5.0L V8 32V PDI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2018 Ford F-150 XLT SuperCrew', '1FTEW1E52JFB00470', 'W1E', '41999', 'US5027'),
('Ford', 'F-150', 2018, 'XLT', 'Ingot Silver Metallic', 'Black', 'Automatic', 38995, '5.0L V8 32V PDI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2018 Ford F-150 XLT', '1FTEW1E56JFE54802', 'W1E', '40995', 'U14115'),
('Ford', 'F-150', 2019, 'XLT SuperCrew', 'Ruby Red Metallic Tinted Clearcoat', 'Black', 'Automatic', 44499, '5.0L V8 32V PDI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford F-150 XLT SuperCrew', '1FTEW1E57KFC51872', 'W1E', '48999', 'US5146'),
('Ford', 'F-150', 2019, 'LARIAT', 'Agate Black Metallic', 'Black', 'Automatic', 47495, '5.0L V8 32V PDI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford F-150 LARIAT', '1FTEW1E57KFD48280', 'W1E', '49995', 'U13996'),
('Ford', 'F-150', 2019, 'LARIAT', 'Red', '', 'Automatic', 48495, '5.0L V8 32V PDI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford F-150 LARIAT', '1FTEW1E58KFA04022', 'W1E', '51995', 'U30019'),
('Ford', 'F-150', 2019, 'XL SuperCrew', 'Agate Black Metallic', 'Dark Earth Gray', 'Automatic', 41999, '5.0L V8 32V PDI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford F-150 XL SuperCrew', '1FTEW1E5XKFA26698', 'W1E', '43999', 'US5026'),
('Ford', 'F-150', 2015, 'Platinum SuperCrew', 'Guard Metallic', 'Black', 'Automatic', 32799, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2015 Ford F-150 Platinum SuperCrew', '1FTEW1EG7FFA07940', 'W1E', '34999', 'US5191'),
('Ford', 'F-150', 2020, 'LARIAT SuperCrew', 'Iconic Silver Metallic', 'Medium Light Camel', 'Automatic', 54999, '2.7L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2020 Ford F-150 LARIAT SuperCrew', '1FTEW1EP1LKE82521', 'W1E', '59999', 'US3150'),
('Ford', 'F-150', 2018, 'XLT SuperCrew', 'Oxford White', 'Black', 'Automatic', 38999, '6 Cyl - 2.7 L', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2018 Ford F-150 XLT SuperCrew', '1FTEW1EP4JKF00216', 'W1E', '0', 'US5284'),
('Ford', 'F-150', 2018, 'XLT', 'Gray', '', 'Automatic', 38995, '2.7L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2018 Ford F-150 XLT', '1FTEW1EP6JFD65930', 'W1E', '40995', 'U30016'),
('Ford', 'F-150', 2018, 'XL SuperCrew', 'Lightning Blue', 'Dark Earth Gray', 'Automatic', 36999, '2.7L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2018 Ford F-150 XL SuperCrew', '1FTEW1EP8JFD81126', 'W1E', '39999', 'US4986'),
('Ford', 'F-150', 2018, 'XL SuperCrew', 'Lightning Blue', 'Dark Earth Gray', 'Automatic', 36499, '2.7L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2018 Ford F-150 XL SuperCrew', '1FTEW1EPXJFE54139', 'W1E', '40999', 'US4770'),
('Ford', 'F-150', 2019, 'XL SuperCab', 'Velocity Blue Metallic', 'Medium Earth Gray', 'Automatic', 36999, '3.3L V6 24V PDI DOHC Flexible Fuel', 'Gasoline Fuel', 'used', 'Extended Cab Pickup', '2019 Ford F-150 XL SuperCab', '1FTEX1EB7KKD35863', 'X1E', '38999', 'US5236'),
('Ford', 'F-150', 2011, 'XLT', 'Sterling Gray Metallic', 'Steel Gray', 'Automatic', 20495, '5.0L V8 32V MPFI DOHC Flexible Fuel', 'Flex Fuel', 'used', 'Crew Cab Pickup', '2011 Ford F-150 XLT', '1FTFW1EF4BFA98879', 'W1E', '23995', 'U14077'),
('Ford', 'F-150', 2010, 'Lariat', 'Royal Red Metallic', 'Tan', 'Automatic', 19495, '5.4L V8 24V MPFI SOHC Flexible Fuel', 'Flex Fuel', 'used', 'Crew Cab Pickup', '2010 Ford F-150 Lariat', '1FTFW1EV5AFB35590', 'W1E', '24995', 'U14067'),
('Ford', 'F-150', 2019, 'Raptor', 'Ingot Silver Metallic', 'Black', 'Automatic', 68995, '3.5L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Ford F-150 Raptor', '1FTFW1RG8KFC00204', 'W1R', '74995', 'U14026'),
('Chevrolet', 'Sonic', 2017, 'LT', 'Summit White', 'Jet Black', 'Automatic', 14999, '1.8L I4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Hatchback', '2017 Chevrolet Sonic LT', '1G1JD6SG8H4128487', '1JV48', '17999', 'US5230'),
('Chevrolet', 'Cruze', 2014, 'LS', 'Summit White', 'Jet Black/Medium Titanium', 'Automatic', 7945, '4 Cyl - 1.8 L', 'Gasoline Fuel', 'used', '4dr Car', '2014 Chevrolet Cruze LS', '1G1PA5SG2E7235350', '1PL69', '0', 'U14121'),
('Chevrolet', 'Corvette', 2019, 'Stingray 1LT', 'Arctic White', 'Adrenaline Red', 'Automatic', 58799, '6.2L V8 16V GDI OHV', 'Gasoline Fuel', 'used', '2dr Car', '2019 Chevrolet Corvette Stingray 1LT', '1G1YB2D77K5108002', '1YY07', '62999', 'US4719'),
('Chevrolet', 'Malibu', 2017, 'LT', 'Summit White', 'Dark Atmosphere/Loft Brown', 'Automatic', 23495, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2017 Chevrolet Malibu LT', '1G1ZE5ST3HF264084', '1ZD69', '26995', 'U30050'),
('Chevrolet', 'Colorado', 2019, '4WD Crew Cab', 'Black', 'Jet Black/Dark Ash', 'Automatic', 32999, '3.6L V6 24V GDI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Chevrolet Colorado 4WD Crew Cab', '1GCGTBEN6K1344967', '12M43', '34999', 'US5217'),
('Chevrolet', 'Colorado', 2019, '4WD LT Crew Cab', 'Black', 'Jet Black', 'Automatic', 25499, '3.6L V6 24V GDI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Chevrolet Colorado 4WD LT Crew Cab', '1GCGTCEN2K1117457', '12N43', '29999', 'US4888'),
('GMC', 'Acadia', 2019, 'SLE', 'Summit White', 'Jet Black', 'Automatic', 33495, '2.5L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 GMC Acadia SLE', '1GKKNSLA4KZ254825', 'TNK26', '37995', 'U30021'),
('GMC', 'Acadia', 2019, 'SLE', 'Summit White', 'Jet Black', 'Automatic', 32795, '2.5L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 GMC Acadia SLE', '1GKKNSLA7KZ123730', 'TNK26', '36995', 'U14174'),
('GMC', 'Acadia', 2019, 'SLT AWD', 'Ebony Twilight Metallic', 'Jet Black', 'Automatic', 37999, '3.6L V6 24V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 GMC Acadia SLT AWD', '1GKKNWLS3KZ140377', 'TNM26', '41999', 'US4843'),
('Chevrolet', 'Traverse', 2021, 'LT Leather', 'Mosaic Black Metallic', 'Jet Black', 'Automatic', 44495, '3.6L V6 24V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2021 Chevrolet Traverse LT Leather', '1GNEVHKW8MJ106212', '1NW56', '46995', 'U30036'),
('Chevrolet', 'Tahoe', 2019, 'LT', 'Black', 'Jet Black', 'Automatic', 50995, '5.3L V8 16V GDI OHV', 'Flex Fuel', 'used', 'Sport Utility', '2019 Chevrolet Tahoe LT', '1GNSKBKC5KR107945', 'CK15706', '52995', 'U30051'),
('Lincoln', 'Continental', 2018, 'Reserve', 'Black', '', 'Automatic', 41995, '2.7L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2018 Lincoln Continental Reserve', '1LN6L9NP3J5617825', 'L9N', '45995', 'U30003'),
('Nissan', 'Frontier', 2014, 'PRO-4X', 'Super Black', 'Graphite/White Stitching', 'Automatic', 24495, '4.0L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2014 Nissan Frontier PRO-4X', '1N6AD0EV0EN729149', '32614', '27995', 'U30054'),
('Nissan', 'Frontier', 2019, 'SV', 'Brilliant Silver Metallic', 'Steel', 'Automatic', 30495, '4.0L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2019 Nissan Frontier SV', '1N6AD0EV0KN772689', '32219', '36995', 'U13925'),
('Dodge', 'Charger', 2017, 'R/T Scat Pack', 'White Knuckle Clearcoat', 'Ruby Red/Black', 'Automatic', 41999, '6.4L V8 16V MPFI OHV', 'Gasoline Fuel', 'used', '4dr Car', '2017 Dodge Charger R/T Scat Pack', '2C3CDXGJ5HH623781', 'LDDR48', '43999', 'US5253'),
('Ford', 'Edge', 2014, 'SEL', 'Mineral Gray Metallic', 'Medium Light Stone', 'Automatic', 13995, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2014 Ford Edge SEL', '2FMDK3JC1EBA32401', 'K3J', '19995', 'U14019'),
('Ford', 'Flex', 2019, 'SE', 'Ingot Silver Metallic', 'Charcoal Black', 'Automatic', 26995, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Flex SE', '2FMGK5B82KBA12799', 'K5B', '30995', 'U13999'),
('Ford', 'Flex', 2016, 'SEL', 'Ingot Silver Metallic', 'Charcoal Black', 'Automatic', 20995, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2016 Ford Flex SEL', '2FMHK6C86GBA09453', 'K6C', '23995', 'U14138'),
('Ford', 'Flex', 2018, 'Limited', '', '', 'Automatic', 31795, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Flex Limited', '2FMHK6D85JBA00345', 'K6D', '35895', 'U14156'),
('Ford', 'Flex', 2019, 'Limited EcoBoost', 'Agate Black', 'Dark Earth Gray', 'Automatic', 41495, '3.5L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Flex Limited EcoBoost', '2FMHK6DT6KBA07679', 'K6D', '45995', 'U14109'),
('Ford', 'Edge', 2019, 'ST AWD', 'Ruby Red Metallic Tinted Clearcoat', 'Ebony', 'Automatic', 38499, '2.7L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Edge ST AWD', '2FMPK4AP3KBB78669', 'K4A', '39999', 'US5128'),
('Ford', 'Edge', 2019, 'ST', 'Agate Black Metallic', 'Ebony', 'Automatic', 38495, '2.7L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Edge ST', '2FMPK4AP5KBB11281', 'K4A', '40995', 'U14146'),
('Ford', 'Edge', 2017, 'Sport', 'Red', '', 'Automatic', 26595, '2.7L V6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2017 Ford Edge Sport', '2FMPK4AP9HBB14211', 'K4A', '28995', 'U14166'),
('Ford', 'Edge', 2018, 'SE', 'Shadow Black', 'Ebony', 'Automatic', 24495, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Edge SE', '2FMPK4G90JBC49060', 'K4G', '28995', 'U14188'),
('Ford', 'Edge', 2018, 'SE', 'Black', '', 'Automatic', 23795, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Edge SE', '2FMPK4G99JBC45525', 'K4G', '27995', 'U14141'),
('Ford', 'Edge', 2019, 'SE AWD', 'Ingot Silver Metallic', 'Ebony', 'Automatic', 26999, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Edge SE AWD', '2FMPK4G9XKBB17358', 'K4G', '28999', 'US5092'),
('Ford', 'Edge', 2018, 'SEL', 'Magnetic Metallic', 'Ebony', 'Automatic', 28495, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Edge SEL', '2FMPK4J80JBC45588', 'K4J', '32995', 'U13995'),
('Ford', 'Edge', 2018, 'SEL', '', '', 'Automatic', 27495, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Edge SEL', '2FMPK4J85JBC29886', 'K4J', '32995', 'U14169'),
('Ford', 'Edge', 2018, 'SEL', 'Burgundy Velvet Metallic Tinted Clearcoat', 'Dune', 'Automatic', 31495, '3.5L V6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Edge SEL', '2FMPK4J88JBC24360', 'K4J', '35995', 'U14189'),
('Ford', 'Edge', 2019, 'SEL AWD', 'Magnetic Metallic', 'Ebony', 'Automatic', 29499, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Edge SEL AWD', '2FMPK4J90KBB18785', 'K4J', '31999', 'US5160'),
('Ford', 'Edge', 2019, 'SEL AWD', 'Agate Black Metallic', 'Ebony', 'Automatic', 31999, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Edge SEL AWD', '2FMPK4J90KBB58980', 'K4J', '33999', 'US5250'),
('Ford', 'Edge', 2018, 'SEL AWD', 'White Platinum Metallic Tri-Coat', 'Mayan Gray/Umber', 'Automatic', 29999, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Edge SEL AWD', '2FMPK4J92JBB55335', 'K4J', '31999', 'US5074'),
('Ford', 'Edge', 2018, 'SEL AWD', 'Magnetic Metallic', 'Ebony', 'Automatic', 27499, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Edge SEL AWD', '2FMPK4J94JBB47057', 'K4J', '29999', 'US5165'),
('Ford', 'Edge', 2018, 'SEL AWD', 'Magnetic Metallic', 'Mayan Gray/Umber', 'Automatic', 27499, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Edge SEL AWD', '2FMPK4J97JBC17909', 'K4J', '29999', 'US5145'),
('Ford', 'Edge', 2019, 'SEL', 'Baltic Sea Green Metallic', 'Ebony', 'Automatic', 32495, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Edge SEL', '2FMPK4J98KBB73128', 'K4J', '35995', 'U14103'),
('Ford', 'Edge', 2018, 'SEL', 'Magnetic Metallic', 'Ebony', 'Automatic', 28795, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Edge SEL', '2FMPK4J99JBC39071', 'K4J', '33995', 'U14054'),
('Ford', 'Edge', 2019, 'SEL AWD', 'Magnetic Metallic', 'Ebony', 'Automatic', 29999, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Edge SEL AWD', '2FMPK4J99KBB17330', 'K4J', '30999', 'US5042'),
('Ford', 'Edge', 2019, 'SEL AWD', 'Ingot Silver Metallic', 'Ebony', 'Automatic', 30999, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Edge SEL AWD', '2FMPK4J99KBB19014', 'K4J', '35999', 'US4798'),
('Ford', 'Edge', 2019, 'SEL', 'Ingot Silver Metallic', 'Ebony', 'Automatic', 30495, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Edge SEL', '2FMPK4J9XKBB11522', 'K4J', '34995', 'U14035'),
('Ford', 'Edge', 2018, 'Titanium AWD', 'Shadow Black', 'Cognac', 'Automatic', 28799, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford Edge Titanium AWD', '2FMPK4K90JBC48885', 'K4K', '31999', 'US4933'),
('Ford', 'Edge', 2019, 'Titanium AWD', 'Agate Black Metallic', 'Ebony', 'Automatic', 35999, '4 Cyl - 2.0 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Edge Titanium AWD', '2FMPK4K90KBC10834', 'K4K', '0', 'US5277'),
('Ford', 'Edge', 2020, 'Titanium', 'Star White Metallic Tri-Coat', 'Soft Ceramic', 'Automatic', 39795, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Ford Edge Titanium', '2FMPK4K91LBA86221', 'K4K', '41995', 'U14114'),
('Ford', 'Edge', 2019, 'Titanium AWD', 'White Platinum Metallic Tri-Coat', 'Cognac', 'Automatic', 31999, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford Edge Titanium AWD', '2FMPK4K99KBB39715', 'K4K', '34999', 'US4994'),
('Ford', 'F-150', 2004, 'Lightning', 'Sonic Blue Metallic', 'Dark Graphite', 'Automatic', 49999, '5.4L V8 16V MPFI SOHC Supercharged', 'Gasoline Fuel', 'used', 'Regular Cab Pickup', '2004 Ford F-150 Lightning', '2FTRF073X4CA16212', 'F07', '50999', 'US4045'),
('Honda', 'Civic Sdn', 2008, 'EX', 'Galaxy Gray Metallic', '', 'Automatic', 6995, '4 Cyl - 1.8 L', 'Gasoline Fuel', 'used', '4dr Car', '2008 Honda Civic Sdn EX', '2HGFA16888H348244', '', '0', 'U30057'),
('Honda', 'Civic Sedan', 2016, 'EX-T', 'White Orchid Pearl', 'Gray', 'Variable', 20999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2016 Honda Civic Sedan EX-T', '2HGFC1F3XGH659512', 'FC1F3GJW', '24999', 'US4915'),
('Honda', 'CR-V', 2019, 'EX', 'White', '', 'Variable', 31995, '4 Cyl - 1.5 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Honda CR-V EX', '2HKRW2H54KH626383', 'RW2H5KJW', '0', 'U30059'),
('Honda', 'CR-V', 2019, 'EX', 'Red', '', 'Variable', 29795, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Honda CR-V EX', '2HKRW2H55KH629616', 'RW2H5KJW', '35995', 'U14164'),
('Honda', 'CR-V', 2017, 'EX AWD', 'Basque Red Pearl II', 'Black', 'Variable', 24499, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2017 Honda CR-V EX AWD', '2HKRW2H59HH660005', 'RW2H5HJW', '26999', 'US5091'),
('Toyota', 'Corolla', 2014, 'S', 'Classic Silver Metallic', 'Black', 'Variable', 16799, '1.8L I4 16V MPFI DOHC', 'Gasoline Fuel', 'used', '4dr Car', '2014 Toyota Corolla S', '2T1BURHE1EC083842', '1862', '19999', 'US5188'),
('Toyota', 'Corolla', 2016, 'S Plus', 'Slate Metallic', 'Black', 'Variable', 17499, '1.8L I4 16V MPFI DOHC', 'Gasoline Fuel', 'used', '4dr Car', '2016 Toyota Corolla S Plus', '2T1BURHE4GC745674', '1864', '19999', 'US5097'),
('Toyota', 'Corolla', 2017, 'LE', 'Black Sand Pearl', 'Ash', 'Variable', 18495, '1.8L I4 16V MPFI DOHC', 'Gasoline Fuel', 'used', '4dr Car', '2017 Toyota Corolla LE', '2T1BURHE9HC882997', '1852', '21995', 'U14071'),
('Toyota', 'RAV4', 2020, 'XLE Premium', 'Blueprint', 'Black', 'Automatic', 38995, '2.5L I4 16V PDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Toyota RAV4 XLE Premium', '2T3A1RFV7LC077183', '4478', '44995', 'U14131'),
('Jeep', 'Compass', 2018, 'Latitude', 'Laser Blue Pearlcoat', 'Black', 'Automatic', 24795, '2.4L I4 16V MPFI SOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Jeep Compass Latitude', '3C4NJDBBXJT481260', 'MPJM74', '27995', 'U14111'),
('Jeep', 'Compass', 2018, 'Limited 4X4', 'White Clearcoat', 'Black', 'Automatic', 26999, '2.4L I4 16V MPFI SOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Jeep Compass Limited 4X4', '3C4NJDCB5JT481889', 'MPJP74', '29999', 'US4833'),
('Jeep', 'Compass', 2017, 'Trailhawk', 'Diamond Black Crystal Pearlcoat', 'Ruby Red/Black', 'Automatic', 27995, '2.4L I4 16V MPFI SOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2017 Jeep Compass Trailhawk', '3C4NJDDB7HT630943', 'MPJH74', '32995', 'U30006'),
('RAM', '2500', 2016, 'Tradesman', 'Bright White Clearcoat', 'Diesel Gray/Black', 'Automatic', 39995, '5.7L V8 16V MPFI OHV', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2016 RAM 2500 Tradesman', '3C6TR5HT1GG259737', 'DJ7L92', '41995', 'U30002'),
('RAM', '5500', 2016, 'Tradesman', 'Bright White Clearcoat', 'Diesel Gray/Black', 'Automatic', 48995, '6.7L I6 24V DDI OHV Turbo Diesel', 'Diesel Fuel', 'used', 'Crew Cab Chassis-Cab', '2016 RAM 5500 Tradesman', '3C7WRNFL2GG135181', 'DP0L94', '54995', 'U14088'),
('Ford', 'Fusion', 2018, 'SE', 'Oxford White', 'Ebony', 'Automatic', 22999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2018 Ford Fusion SE', '3FA6P0HD3JR216283', 'P0H', '24999', 'US5225'),
('Ford', 'Fusion', 2018, 'SE', 'Black', '', 'Automatic', 24495, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2018 Ford Fusion SE', '3FA6P0HD3JR283014', 'P0H', '28995', 'U30032'),
('Ford', 'Fusion', 2014, 'SE', 'Sunset Metallic', 'Ebony', 'Automatic', 14999, '4 Cyl - 1.5 L', 'Gasoline Fuel', 'used', '4dr Car', '2014 Ford Fusion SE', '3FA6P0HD6ER172737', 'P0H', '0', 'US5290'),
('Ford', 'Fusion', 2020, 'SE', 'Magnetic Metallic', 'Ebony', 'Automatic', 27795, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2020 Ford Fusion SE', '3FA6P0HD9LR102145', 'P0H', '29995', 'U14098');
INSERT INTO `vehicle` (`make`, `model`, `year`, `trim`, `extcolor`, `intcolor`, `transmission`, `price`, `engine`, `fueltype`, `vehicletype`, `bodystyle`, `name`, `vin`, `modelcode`, `msrp`, `stocknum`) VALUES
('Ford', 'Fusion', 2018, 'Titanium', 'White Gold Metallic', 'Ebony', 'Automatic', 24999, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2018 Ford Fusion Titanium', '3FA6P0K91JR112766', 'P0K', '26999', 'US5047'),
('Ford', 'Fusion Hybrid', 2018, 'SE', 'Oxford White', 'Ebony', 'Variable', 21999, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2018 Ford Fusion Hybrid SE', '3FA6P0LU1JR279521', 'P0L', '24999', 'US5104'),
('Ford', 'Fusion Hybrid', 2019, 'SE', 'Black', '', 'Variable', 24995, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2019 Ford Fusion Hybrid SE', '3FA6P0LU3KR157213', 'P0L', '27995', 'U14142'),
('Ford', 'Fusion Hybrid', 2019, 'SE', 'Magnetic Metallic', 'Ebony', 'Variable', 24499, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2019 Ford Fusion Hybrid SE', '3FA6P0LU3KR208225', 'P0L', '25999', 'US5221'),
('Ford', 'Fusion Hybrid', 2019, 'SE', 'Blue Metallic', 'Ebony', 'Variable', 23999, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2019 Ford Fusion Hybrid SE', '3FA6P0LU4KR111339', 'P0L', '25999', 'US4932'),
('Ford', 'Fusion Hybrid', 2019, 'SE', 'Velocity Blue Metallic', 'Ebony', 'Variable', 22999, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2019 Ford Fusion Hybrid SE', '3FA6P0LU5KR110992', 'P0L', '25999', 'US4789'),
('Ford', 'Fusion Hybrid', 2019, 'SE', 'Agate Black', 'Ebony', 'Variable', 23499, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2019 Ford Fusion Hybrid SE', '3FA6P0LU5KR191864', 'P0L', '25999', 'US5172'),
('Ford', 'Fusion Hybrid', 2019, 'SE', 'Magnetic Metallic', 'Ebony', 'Variable', 23999, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2019 Ford Fusion Hybrid SE', '3FA6P0LU6KR157299', 'P0L', '25999', 'US5075'),
('Ford', 'Fusion Hybrid', 2019, 'SE', 'Oxford White', 'Ebony', 'Variable', 25499, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2019 Ford Fusion Hybrid SE', '3FA6P0LU7KR208227', 'P0L', '26999', 'US5171'),
('Ford', 'Fusion Hybrid', 2020, 'SE', 'Magnetic Metallic', 'Ebony', 'Variable', 25499, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2020 Ford Fusion Hybrid SE', '3FA6P0LU8LR121325', 'P0L', '27999', 'US5089'),
('Ford', 'Fusion Hybrid', 2019, 'SE', 'Blue', '', 'Variable', 23995, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2019 Ford Fusion Hybrid SE', '3FA6P0LU9KR157278', 'P0L', '26995', 'U30037'),
('Ford', 'Fusion Energi', 2018, 'SE', 'Shadow Black', 'Ebony', 'Variable', 22799, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2018 Ford Fusion Energi SE', '3FA6P0PU5JR275787', 'P0P', '24999', 'US4799'),
('Ford', 'Fusion Energi', 2019, 'Titanium', 'Ruby Red Metallic Tinted Clearcoat', 'Ebony', 'Variable', 25999, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2019 Ford Fusion Energi Titanium', '3FA6P0SU2KR264187', 'P0S', '27999', 'US4896'),
('Ford', 'Fusion Energi', 2019, 'Titanium', 'Ingot Silver Metallic', 'Ebony', 'Variable', 24499, '2.0L I4 16V MPFI DOHC Hybrid', 'Hybrid Fuel', 'used', '4dr Car', '2019 Ford Fusion Energi Titanium', '3FA6P0SU6KR244735', 'P0S', '26999', 'US5148'),
('Ford', 'Fiesta', 2019, 'SE', 'Shadow Black', 'Charcoal Black', 'Automatic', 17999, '4 Cyl - 1.6 L', 'Gasoline Fuel', 'used', 'Hatchback', '2019 Ford Fiesta SE', '3FADP4EJ5KM125443', 'P4E', '0', 'US5281'),
('Kia', 'Forte', 2019, 'S', 'Aurora Black', 'Black', 'Variable', 20999, '2.0L I4 16V MPFI DOHC', 'Gasoline Fuel', 'used', '4dr Car', '2019 Kia Forte S', '3KPF34AD8KE073315', 'C3442', '23999', 'US4962'),
('Volkswagen', 'Jetta', 2017, '1.4T S', 'Platinum Gray Metallic', 'Titan Blk/Palladium Gray', 'Manual', 16495, '1.4L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2017 Volkswagen Jetta 1.4T S', '3VW167AJ6HM313756', '1631F1', '19995', 'U30040'),
('Subaru', 'Legacy', 2019, 'Premium Awd', 'Magnetite Gray Metallic', 'Titanium Gray', 'Variable', 25499, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'used', '4dr Car', '2019 Subaru Legacy Premium Awd', '4S3BNAF69K3027484', 'KAD', '26999', 'US5122'),
('Subaru', 'Legacy', 2020, 'Limited Awd', 'Crystal White Pearl', 'Warm Ivory', 'Variable', 31999, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', '4dr Car', '2020 Subaru Legacy Limited Awd', '4S3BWAL66L3025887', 'LAF', '34999', 'US5111'),
('Subaru', 'Impreza', 2018, 'AWD', 'Lapis Blue Pearl', 'Ivory', 'Variable', 21999, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', '4dr Car', '2018 Subaru Impreza AWD', '4S3GKAA66J3617274', 'JJB', '23999', 'US5234'),
('Subaru', 'Impreza', 2019, 'AWD', 'Island Blue Pearl', 'Black', 'Variable', 22499, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Hatchback', '2019 Subaru Impreza AWD', '4S3GTAA65K3716490', 'KLB', '25999', 'US4731'),
('Subaru', 'Impreza', 2017, 'Premium', 'Lapis Blue Pearl', 'Ivory', 'Variable', 23995, '4 Cyl - 2.0 L', 'Gasoline Fuel', 'used', 'Hatchback', '2017 Subaru Impreza Premium', '4S3GTAB66H3739302', 'HLD', '0', 'U30049'),
('Subaru', 'Impreza', 2019, 'Premium AWD', 'Crimson Red Pearl', 'Ivory', 'Variable', 21999, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Hatchback', '2019 Subaru Impreza Premium AWD', '4S3GTAC61K3723840', 'KLD', '25999', 'US4914'),
('Subaru', 'Impreza', 2019, 'Premium', 'Crimson Red Pearl', 'Ivory', 'Variable', 25495, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Hatchback', '2019 Subaru Impreza Premium', '4S3GTAC69K3717686', 'KLD', '28995', 'U30038'),
('Subaru', 'Outback', 2017, 'Premium AWD', 'Crystal Black Silica', 'Slate Black', 'Variable', 25999, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2017 Subaru Outback Premium AWD', '4S4BSACC2H3233446', 'HDD', '27999', 'US4982'),
('Subaru', 'Outback', 2019, 'Premium Awd', 'Crystal White Pearl', 'Slate Black', 'Variable', 28999, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Outback Premium Awd', '4S4BSAFC6K3330779', 'KDD', '30999', 'US4889'),
('Subaru', 'Outback', 2019, 'Premium Awd', 'Crimson Red Pearl', 'Warm Ivory', 'Variable', 29499, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Outback Premium Awd', '4S4BSAHC2K3268228', 'KDD', '32999', 'US5169'),
('Subaru', 'Outback', 2019, 'Limited Awd', 'Crimson Red Pearl', 'Warm Ivory', 'Variable', 30999, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Outback Limited Awd', '4S4BSANC7K3322773', 'KDF', '31999', 'US5058'),
('Subaru', 'Outback', 2018, 'Limited Awd', 'Crystal White Pearl', 'Slate Black', 'Variable', 28999, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Subaru Outback Limited Awd', '4S4BSANC9J3306086', 'JDF', '32999', 'US4792'),
('Subaru', 'Outback', 2019, 'Limited Awd', 'Crimson Red Pearl', 'Warm Ivory', 'Variable', 34499, '3.6L H6 24V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Outback Limited Awd', '4S4BSENC9K3265760', 'KDK', '35999', 'US5142'),
('Subaru', 'Outback', 2020, 'Premium Awd', 'Ice Silver Metallic', 'Titanium Gray', 'Variable', 33499, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Subaru Outback Premium Awd', '4S4BTACC7L3162055', 'LDD', '36999', 'US4687'),
('Subaru', 'Outback', 2020, 'Premium Awd', 'Crystal Black Silica', 'Titanium Gray', 'Variable', 35499, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Subaru Outback Premium Awd', '4S4BTAEC4L3213329', 'LDD', '39999', 'US4602'),
('Subaru', 'Outback', 2020, 'Premium', 'Magnetite Gray Metallic', 'Titanium Gray', 'Variable', 32795, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Subaru Outback Premium', '4S4BTAEC5L3265522', 'LDD', '38995', 'U14003'),
('Subaru', 'Outback', 2021, 'Premium Awd', 'Crystal White Pearl', 'Slate Black', 'Variable', 33299, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2021 Subaru Outback Premium Awd', '4S4BTAFC4M3211032', 'MDD', '35999', 'US4861'),
('Subaru', 'Ascent', 2020, 'Limited Awd', 'Magnetite Gray Metallic', 'Slate Black', 'Variable', 41499, '2.4L H4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Subaru Ascent Limited Awd', '4S4WMALD7L3429914', 'LCD', '43999', 'US5126'),
('Subaru', 'Ascent', 2019, 'Limited', 'Crystal Black Pearl', 'Warm Ivory', 'Variable', 36495, '2.4L H4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Ascent Limited', '4S4WMAPD9K3459411', 'KCE', '40995', 'U30030'),
('Toyota', 'RAV4', 2021, 'Hybrid Limited', 'Black', '', 'Variable', 43995, '2.5L I4 16V PDI DOHC Hybrid', 'Hybrid Fuel', 'used', 'Sport Utility', '2021 Toyota RAV4 Hybrid Limited', '4T3D6RFVXMU012598', '4534', '46995', 'U30004'),
('Acura', 'RDX', 2017, 'Base', 'Modern Steel Metallic', 'Ebony', 'Automatic', 27495, '3.5L V6 24V MPFI SOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2017 Acura RDX', '5J8TB4H37HL004829', 'TB4H3HJNW', '31995', 'U14095'),
('Acura', 'RDX', 2020, 'SH-AWD w/Technology Pkg', 'Majestic Black Pearl', 'Ebony', 'Automatic', 39999, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Acura RDX SH-AWD w/Technology Pkg', '5J8TC2H54LL029425', 'TC2H5LKNW', '41999', 'US5216'),
('Acura', 'MDX', 2019, 'Base', 'Black', '', 'Automatic', 40995, '6 Cyl - 3.5 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Acura MDX', '5J8YD4H38KL027205', 'YD4H3KJNW', '0', 'U14119'),
('Lincoln', 'MKC', 2019, 'Select', 'White', '', 'Automatic', 32795, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Lincoln MKC Select', '5LMCJ2D95KUL07487', 'J2D', '37995', 'U14147'),
('Lincoln', 'MKC', 2019, 'Select', 'White', '', 'Automatic', 32995, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Lincoln MKC Select', '5LMCJ2D97KUL25215', 'J2D', '37995', 'U14161'),
('Lincoln', 'MKC', 2019, 'Select', 'Infinite Black Metallic', 'Cappuccino', 'Automatic', 33995, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Lincoln MKC Select', '5LMCJ2D9XKUL53381', 'J2D', '36995', 'U30052'),
('Lincoln', 'Navigator', 2020, 'Reserve 4X4', 'Infinite Black', 'Ebony', 'Automatic', 79499, '3.5L V6 24V PDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Lincoln Navigator Reserve 4X4', '5LMJJ2LT8LEL04776', 'J2L', '81999', 'US5153'),
('Nissan', 'Rogue', 2014, 'S AWD', 'Graphite Blue', 'Almond', 'Variable', 16999, '2.5L I4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2014 Nissan Rogue S AWD', '5N1AT2MVXEC834551', '22214', '18999', 'US5240'),
('Nissan', 'Pathfinder', 2019, 'SV', 'Caspian Blue Metallic', 'Charcoal', 'Variable', 27495, '3.5L V6 24V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Nissan Pathfinder SV', '5N1DR2MMXKC591936', '25219', '32995', 'U14182'),
('Hyundai', 'Santa Fe', 2020, 'Limited AWD', 'Portofino Gray', 'Black/Black', 'Automatic', 37999, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Hyundai Santa Fe Limited AWD', '5NMS5CAA8LH200471', '644A2AT5', '39999', 'US5269'),
('Hyundai', 'Sonata', 2015, '2.4L SE', 'Phantom Black', 'Gray', 'Automatic', 13999, '2.4L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', '4dr Car', '2015 Hyundai Sonata 2.4L SE', '5NPE24AF8FH008319', '28402F45', '15999', 'US5278'),
('Toyota', 'Highlander', 2019, 'Base', 'Silver', '', 'Automatic', 38495, '3.5L V6 24V PDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Toyota Highlander', '5TDJZRFH2KS933894', '', '43995', 'U30031'),
('Toyota', 'Tundra', 2020, 'Base', 'Black', '', 'Automatic', 49995, '5.7L V8 32V MPFI DOHC', 'Gasoline Fuel', 'used', 'Crew Cab Pickup', '2020 Toyota Tundra', '5TFDY5F12LX890424', '', '51995', 'U14143'),
('Kia', 'Sorento', 2014, 'LX', 'Titanium Silver', 'Black', 'Automatic', 14995, '3.3L V6 24V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2014 Kia Sorento LX', '5XYKT4A74EG461125', '74222', '18995', 'U14099'),
('Kia', 'Sorento', 2019, 'LX AWD', 'Ebony Black', 'Satin Black', 'Automatic', 29499, '2.4L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Kia Sorento LX AWD', '5XYPGDA33KG545584', '73422', '30999', 'US5159'),
('Subaru', 'WRX', 2019, 'Premium', 'Dark Gray Metallic', 'Carbon Black', 'Manual', 30495, '2.0L H4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2019 Subaru WRX Premium', 'JF1VA1C64K9802824', 'KUO', '36995', 'U14178'),
('Subaru', 'WRX', 2019, 'Premium Awd', 'Crystal Black Pearl', 'Carbon Black', 'Manual', 29999, '2.0L H4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2019 Subaru WRX Premium Awd', 'JF1VA1C65K9802072', 'KUO', '33999', 'US5186'),
('Subaru', 'Crosstrek', 2019, 'Premium Awd', 'Cool Gray Khaki', 'Black', 'Variable', 25999, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Crosstrek Premium Awd', 'JF2GTACC3K8271304', 'KRD', '28999', 'US5109'),
('Subaru', 'Crosstrek', 2019, 'Premium Awd', 'Crystal White Pearl', 'Gray', 'Variable', 25999, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Crosstrek Premium Awd', 'JF2GTACC9K8288866', 'KRD', '27999', 'US5024'),
('Subaru', 'Crosstrek', 2019, 'Premium', 'Dark Gray Metallic', 'Gray', 'Variable', 26995, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Crosstrek Premium', 'JF2GTAEC1KH253722', 'KRD', '35995', 'U14128'),
('Subaru', 'Crosstrek', 2019, 'Premium Awd', 'Venetian Red Pearl', 'Black', 'Variable', 26999, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Crosstrek Premium Awd', 'JF2GTAEC3K8341185', 'KRD', '29999', 'US5113'),
('Subaru', 'Crosstrek', 2019, 'Premium Awd', 'Dark Gray Metallic', 'Gray', 'Variable', 26999, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Crosstrek Premium Awd', 'JF2GTAEC6K8302851', 'KRD', '29999', 'US5200'),
('Subaru', 'Crosstrek', 2019, 'Limited Awd', 'Quartz Blue Pearl', 'Gray', 'Variable', 27999, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Crosstrek Limited Awd', 'JF2GTAMC1K8291162', 'KRE', '29999', 'US5110'),
('Subaru', 'Crosstrek', 2018, 'Limited Awd', 'Dark Gray Metallic', 'Black', 'Variable', 24499, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Subaru Crosstrek Limited Awd', 'JF2GTAMC7JH256401', 'JRE', '27999', 'US4771'),
('Subaru', 'Crosstrek', 2019, 'Limited Awd', 'Venetian Red Pearl', 'Black', 'Variable', 29999, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Crosstrek Limited Awd', 'JF2GTANC2KH267743', 'KRE', '32999', 'US4871'),
('Subaru', 'Crosstrek', 2021, 'Premium Awd', 'Crystal White Pearl', 'Black W/Orange Stitching', 'Variable', 31999, '2.0L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2021 Subaru Crosstrek Premium Awd', 'JF2GTAPC1M8259522', 'MRD', '33999', 'US5274'),
('Subaru', 'Crosstrek', 2021, 'Sport AWD', 'Crystal White Pearl', 'Gray w/Yellow Stitching', 'Variable', 33499, '2.0L', 'Gasoline Fuel', 'used', 'Sport Utility', '2021 Subaru Crosstrek Sport AWD', 'JF2GTHSC5MH214356', 'MRE', '36999', 'US4877'),
('Subaru', 'Forester', 2018, 'Premium Awd', 'Quartz Blue Pearl', 'Gray', 'Variable', 26499, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Subaru Forester Premium Awd', 'JF2SJAGC7JH469294', 'JFF', '28999', 'US5119'),
('Subaru', 'Forester', 2018, 'Limited Awd', 'Quartz Blue Pearl', 'Gray', 'Variable', 29999, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Subaru Forester Limited Awd', 'JF2SJAJC0JH585364', 'JFI', '34999', 'US4811'),
('Subaru', 'Forester', 2018, 'Limited', 'Quartz Blue Pearl', 'Gray', 'Variable', 27999, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Subaru Forester Limited', 'JF2SJARC2JH610527', 'JFI', '29999', 'US5051'),
('Subaru', 'Forester', 2018, 'Limited Awd', 'Crystal White Pearl', 'Gray', 'Variable', 27499, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Subaru Forester Limited Awd', 'JF2SJARCXJH589815', 'JFI', '31999', 'US4733'),
('Subaru', 'Forester', 2018, 'Touring AWD', 'Crystal Black Silica', 'Black', 'Variable', 29999, '2.5L H4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Subaru Forester Touring AWD', 'JF2SJAWC6JH574118', 'JFJ', '34999', 'US4714'),
('Subaru', 'Forester', 2019, 'AWD', 'Jasper Green Metallic', 'Gray', 'Variable', 25999, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester AWD', 'JF2SKAAC5KH514739', 'KFB', '27999', 'US5018'),
('Subaru', 'Forester', 2019, 'Premium Awd', 'Ice Silver Metallic', 'Black', 'Variable', 25499, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Premium Awd', 'JF2SKAEC0KH489551', 'KFF', '27999', 'US5082'),
('Subaru', 'Forester', 2019, 'Premium Awd', 'Crimson Red Pearl', 'Gray', 'Variable', 31499, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Premium Awd', 'JF2SKAEC3KH465843', 'KFF', '36999', 'US4734'),
('Subaru', 'Forester', 2019, 'Premium Awd', 'Dark Gray Metallic', 'Black', 'Variable', 27799, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Premium Awd', 'JF2SKAECXKH513354', 'KFF', '29999', 'US4952'),
('Subaru', 'Forester', 2019, 'Premium Awd', 'Jasper Green Metallic', 'Gray', 'Variable', 28999, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Premium Awd', 'JF2SKAGC1KH445149', 'KFF', '30999', 'US5249'),
('Subaru', 'Forester', 2019, 'Premium Awd', 'Ice Silver Metallic', 'Black', 'Variable', 27999, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Premium Awd', 'JF2SKAGC2KH479777', 'KFF', '31999', 'US4856'),
('Subaru', 'Forester', 2019, 'Premium Awd', 'Crystal Black Silica', 'Black', 'Variable', 26999, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Premium Awd', 'JF2SKAGC9KH500883', 'KFF', '31999', 'US4759'),
('Subaru', 'Forester', 2020, 'Premium Awd', 'Crystal Black Silica', 'Gray', 'Variable', 33995, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Subaru Forester Premium Awd', 'JF2SKAJC3LH403897', 'LFF', '37999', 'U30034'),
('Subaru', 'Forester', 2021, 'Premium Awd', 'Magnetite Gray Metallic', 'Black', 'Variable', 32999, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2021 Subaru Forester Premium Awd', 'JF2SKAJC3MH517500', 'MFF', '34999', 'US5218'),
('Subaru', 'Forester', 2021, 'Premium Awd', 'Crystal Black Pearl', 'Black', 'Variable', 32999, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2021 Subaru Forester Premium Awd', 'JF2SKAJC4MH553079', 'MFF', '34999', 'US5219'),
('Subaru', 'Forester', 2019, 'Sport AWD', 'Dark Gray Metallic', 'Gray', 'Variable', 33499, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Sport AWD', 'JF2SKAPC1KH465336', 'KFG', '36999', 'US4730'),
('Subaru', 'Forester', 2019, 'Sport 4WD', 'Dark Blue Pearl', 'Gray', 'Variable', 31499, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Sport 4WD', 'JF2SKAPC1KH531755', 'KFG', '36999', 'US4748'),
('Subaru', 'Forester', 2020, 'Sport AWD', 'Dark Blue Pearl', 'Gray', 'Variable', 34999, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Subaru Forester Sport AWD', 'JF2SKARC0LH560212', 'LFG', '39999', 'US4762'),
('Subaru', 'Forester', 2019, 'Limited AWD', 'Crystal White Pearl', 'Gray', 'Variable', 31799, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Limited AWD', 'JF2SKASC4KH425484', 'KFI', '33999', 'US5209'),
('Subaru', 'Forester', 2019, 'Limited Awd', 'Ice Silver Metallic', 'Black', 'Variable', 32999, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Limited Awd', 'JF2SKASC7KH494864', 'KFI', '35999', 'US4940'),
('Subaru', 'Forester', 2020, 'Limited Awd', 'Magnetite Gray Metallic', 'Black', 'Variable', 33999, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Subaru Forester Limited Awd', 'JF2SKAUC7LH498931', 'LFI', '37999', 'US4723'),
('Subaru', 'Forester', 2019, 'Touring AWD', 'Horizon Blue Pearl', 'Black', 'Variable', 35499, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Touring AWD', 'JF2SKAWC3KH469969', 'KFJ', '38999', 'US4924'),
('Subaru', 'Forester', 2019, 'Touring 4WD', 'Dark Gray Metallic', 'Black', 'Variable', 34799, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Touring 4WD', 'JF2SKAWC5KH503202', 'KFJ', '36999', 'US5173'),
('Subaru', 'Forester', 2019, 'Touring AWD', 'Crystal Black Silica', 'Black', 'Variable', 35499, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Touring AWD', 'JF2SKAWC7KH465925', 'KFJ', '38999', 'US4925'),
('Subaru', 'Forester', 2019, 'Touring AWD', 'Dark Gray Metallic', 'Saddle Brown', 'Variable', 33799, '2.5L H4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Subaru Forester Touring AWD', 'JF2SKAWC7KH503654', 'KFJ', '37999', 'US5006'),
('Acura', 'RLX', 2014, 'Tech Pkg', 'Crystal Black Pearl', 'Graystone', 'Automatic', 19495, '3.5L V6 24V GDI SOHC', 'Gasoline Fuel', 'used', '4dr Car', '2014 Acura RLX Tech Pkg', 'JH4KC1F58EC003032', 'KC1F5EKNW', '21995', 'U14097'),
('Honda', 'Civic Sedan', 2018, 'EX-T', 'Aegean Blue Metallic', 'Black', 'Variable', 20999, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2018 Honda Civic Sedan EX-T', 'JHMFC1F31JX002677', 'FC1F3JJW', '25999', 'US4917'),
('Honda', 'Civic Sedan', 2018, 'EX-L', 'Silver', '', 'Variable', 23995, '1.5L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2018 Honda Civic Sedan EX-L', 'JHMFC1F72JX039398', '', '27995', 'U30015'),
('Mazda', 'Mazda3', 2016, 'i Touring', 'Titanium Flash Mica', 'Black', 'Automatic', 18495, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Hatchback', '2016 Mazda3 i Touring', 'JM1BM1M72G1337266', 'M3HITRA', '20995', 'U14105'),
('Mazda', 'Mazda CX-3', 2019, 'Touring', 'Soul Red Crystal Metallic', 'Black', 'Automatic', 24995, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Mazda CX-3 Touring', 'JM1DKFC78K1410534', 'CX3TRXA', '29995', 'U30012'),
('Mazda', 'Mazda CX-5', 2019, 'Touring', 'Snowflake White Pearl Mica', 'Black', 'Automatic', 28495, '2.5L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Mazda CX-5 Touring', 'JM3KFBCM1K0535463', 'CX5TRXA', '33995', 'U30026'),
('Mazda', 'Mazda CX-5', 2019, 'Touring', 'Deep Crystal Blue Mica', 'Black', 'Automatic', 26995, '2.5L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Mazda CX-5 Touring', 'JM3KFBCM7K0536973', 'CX5TRXA', '32995', 'U14023'),
('Mazda', 'Mazda CX-5', 2018, 'Grand Touring', 'Soul Red Crystal Metallic', 'Parchment', 'Automatic', 26995, '2.5L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Mazda CX-5 Grand Touring', 'JM3KFBDM9J0407551', 'CX5GTXA', '32995', 'U14050'),
('Chevrolet', 'Trax', 2018, 'LT AWD', 'Silver Ice Metallic', 'Jet Black', 'Automatic', 22499, '1.4L I4 16V MPFI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Chevrolet Trax LT AWD', 'KL7CJPSB8JB710509', '1JS76', '25999', 'US5011'),
('Nissan', 'Rogue', 2018, 'SV', 'Brilliant Silver', 'Charcoal', 'Variable', 18499, '2.5L I4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Nissan Rogue SV', 'KNMAT2MTXJP506794', '22318', '21999', 'US4918'),
('Nissan', 'Rogue', 2019, 'SV AWD', 'Magnetic Black Pearl', 'Charcoal', 'Variable', 22499, '2.5L I4 16V MPFI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Nissan Rogue SV AWD', 'KNMAT2MV5KP527040', '22219', '24999', 'US5076'),
('Ford', 'EcoSport', 2019, 'S', 'Lightning Blue Metallic', 'Medium Stone', 'Automatic', 18999, '1.0L I3 12V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford EcoSport S', 'MAJ3S2FE8KC283275', 'S2F', '20999', 'US5078'),
('Ford', 'EcoSport', 2018, 'SES 4WD', 'Diamond White', 'Ebony Black', 'Automatic', 20499, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford EcoSport SES 4WD', 'MAJ6P1CL1JC196800', 'P1C', '22999', 'US5138'),
('Ford', 'EcoSport', 2018, 'SE', 'White Platinum Metallic Tri-Coat', 'Ebony Black', 'Automatic', 21495, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford EcoSport SE', 'MAJ6P1UL0JC171952', 'P1U', '25995', 'U13930'),
('Ford', 'EcoSport', 2018, 'SE 4WD', 'Shadow Black', 'Ebony Black', 'Automatic', 0, '4 Cyl - 2.0 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford EcoSport SE 4WD', 'MAJ6P1UL6JC226307', 'P1U', '0', 'US5291'),
('Ford', 'EcoSport', 2018, 'SE 4WD', 'Shadow Black', 'Ebony Black', 'Automatic', 20499, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford EcoSport SE 4WD', 'MAJ6P1UL9JC171951', 'P1U', '21999', 'US4954'),
('Ford', 'EcoSport', 2018, 'SE 4WD', 'Smoke Metallic', 'Ebony Black', 'Automatic', 20499, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2018 Ford EcoSport SE 4WD', 'MAJ6P1ULXJC245717', 'P1U', '22999', 'US5137'),
('Ford', 'EcoSport', 2019, 'SE 4WD', 'Diamond White', 'Ebony Black', 'Automatic', 21999, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford EcoSport SE 4WD', 'MAJ6S3GL1KC270500', 'S3G', '23999', 'US5168'),
('Ford', 'EcoSport', 2019, 'SE', 'Diamond White', 'Ebony Black', 'Automatic', 22995, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford EcoSport SE', 'MAJ6S3GL2KC276970', 'S3G', '28995', 'U14044'),
('Ford', 'EcoSport', 2019, 'SE 4WD', 'Blue Candy Metallic Tinted Clearcoat', 'Ebony Black', 'Automatic', 23999, '4 Cyl - 2.0 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford EcoSport SE 4WD', 'MAJ6S3GL8KC265889', 'S3G', '0', 'US5285'),
('Ford', 'EcoSport', 2019, 'SES 4WD', 'Smoke Metallic', 'Ebony Black', 'Automatic', 23499, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Ford EcoSport SES 4WD', 'MAJ6S3JL7KC293644', 'S3J', '25999', 'US5179'),
('Land Rover', 'Discovery Sport', 2019, 'SE 4WD', 'Yulong White Metallic', 'Ebony/Ebony', 'Automatic', 28911, '4 Cyl - 2.0 L', 'Gasoline Fuel', 'used', 'Sport Utility', '2019 Land Rover Discovery Sport SE 4WD', 'SALCP2FXXKH789098', 'AD550/350QB', '0', 'US5298'),
('Audi', 'Q5', 2015, 'Premium Plus', 'Cuvee Silver Metallic', '', 'Automatic', 21995, '2.0L I4 16V GDI DOHC Turbo Flexible Fuel', 'Gasoline Fuel', 'used', 'Sport Utility', '2015 Audi Q5 Premium Plus', 'WA1LFAFP8FA092526', '8RB52A', '25995', 'U30055'),
('BMW', 'M3', 2018, 'Base', 'Austin Yellow Metallic', 'Black', '', 62995, '3.0L I6 24V GDI DOHC Twin Turbo', 'Gasoline Fuel', 'used', '4dr Car', '2018 BMW M3', 'WBS8M9C55J5L71669', '18TN', '68995', 'U14068'),
('MINI', 'Convertible', 2019, 'Cooper S', 'Moonwalk Grey Metallic', 'Carbon Black', 'Automatic', 30999, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Convertible', '2019 MINI Cooper S Convertible', 'WMWWG9C58K3D22842', '19ME', '34999', 'US5121'),
('Volvo', 'XC60', 2017, 'Dynamic', 'Osmium Grey Metallic', 'Off-Black', 'Automatic', 25995, '2.0L I4 16V GDI DOHC Turbo', 'Gasoline Fuel', 'used', 'Sport Utility', '2017 Volvo XC60 Dynamic', 'YV440MRR0H2084604', 'XC60T5AWD', '29995', 'U14187'),
('Volvo', 'XC90', 2020, 'Momentum', 'White', '', 'Automatic', 53495, '2.0L I4 16V GDI DOHC', 'Gasoline Fuel', 'used', 'Sport Utility', '2020 Volvo XC90 Momentum', 'YV4A22PK2L1586245', 'XC90T6MAWD7', '57995', 'U30029');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bodystyle`
--
ALTER TABLE `bodystyle`
  ADD PRIMARY KEY (`bodystyle`);

--
-- Indexes for table `engine`
--
ALTER TABLE `engine`
  ADD PRIMARY KEY (`make`,`model`,`engine`);

--
-- Indexes for table `extcolor`
--
ALTER TABLE `extcolor`
  ADD PRIMARY KEY (`extcolor`);

--
-- Indexes for table `intcolor`
--
ALTER TABLE `intcolor`
  ADD PRIMARY KEY (`intcolor`);

--
-- Indexes for table `make`
--
ALTER TABLE `make`
  ADD PRIMARY KEY (`make`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`make`,`model`);

--
-- Indexes for table `transmission`
--
ALTER TABLE `transmission`
  ADD PRIMARY KEY (`transmission`);

--
-- Indexes for table `trim`
--
ALTER TABLE `trim`
  ADD PRIMARY KEY (`make`,`model`,`trim`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vin`),
  ADD KEY `fk_vehicle_make1_idx` (`make`),
  ADD KEY `fk_vehicle_engine1` (`make`,`model`,`engine`),
  ADD KEY `fk_vehicle_trim1` (`make`,`model`,`trim`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `engine`
--
ALTER TABLE `engine`
  ADD CONSTRAINT `fk_engine_model` FOREIGN KEY (`make`,`model`) REFERENCES `model` (`make`, `model`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `fk_model_make` FOREIGN KEY (`make`) REFERENCES `make` (`make`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `trim`
--
ALTER TABLE `trim`
  ADD CONSTRAINT `fk_trim_model` FOREIGN KEY (`make`,`model`) REFERENCES `model` (`make`, `model`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `fk_vehicle_engine1` FOREIGN KEY (`make`,`model`,`engine`) REFERENCES `engine` (`make`, `model`, `engine`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vehicle_make1` FOREIGN KEY (`make`) REFERENCES `make` (`make`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vehicle_model1` FOREIGN KEY (`make`,`model`) REFERENCES `model` (`make`, `model`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vehicle_trim1` FOREIGN KEY (`make`,`model`,`trim`) REFERENCES `trim` (`make`, `model`, `trim`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
