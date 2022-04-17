-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2022 at 12:47 AM
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
-- Database: `cars_template`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_dat_table` (IN `databasename` NVARCHAR(64), IN `tablename` NVARCHAR(64))  BEGIN

DECLARE _tablename, _columnname nvarchar(64);
DECLARE _datatype, _dimension nvarchar(10);
DECLARE _count_blanks int;

DECLARE finished INTEGER DEFAULT 0;
DECLARE cur CURSOR FOR 
	SELECT `tablename`, `columnname`,`datatype`, `dimension`,  `count_blanks`
    FROM template_meta
    WHERE `tablename`= tablename
    ORDER BY `ordinal_position`;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

SET @sql = CONCAT('CREATE TABLE ',databasename,'.', 'dat_',tablename, ' (');

OPEN cur;
	testLoop: LOOP
		FETCH cur INTO _tablename, _columnname, _datatype, _dimension, _count_blanks ;
	
		IF finished = 1 THEN
			LEAVE testLoop;
		END IF;
    
		SET @sql = CONCAT(@sql,'`',_columnname,'`',' ', _datatype, ' ');
        IF (isnull(_dimension) OR _dimension= ''  ) THEN 
			SET @sql = CONCAT(@sql,' ');
		ELSE
			SET @sql = CONCAT(@sql,'(',_dimension,') '); 
		END IF;
        IF (_count_blanks>0) THEN
			SET @sql = CONCAT(@sql,' NULL,');
		ELSE
			SET @sql = CONCAT(@sql,' NOT NULL,'); 
		END IF;
	END LOOP testLoop;
	
    #cutoff surplus comma
    SET @sql = LEFT(@sql,length(@sql)-1);
    SET @sql = CONCAT(@sql,')');

    PREPARE cmd FROM @sql ; 
	EXECUTE cmd; 
	DEALLOCATE PREPARE cmd ;
        
CLOSE cur;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_tfm_sp` (IN `databasename` NVARCHAR(64), IN `tablename` NVARCHAR(64))  BEGIN

DECLARE _tablename, _columnname nvarchar(64);
    
DECLARE finished INTEGER DEFAULT 0;
DECLARE cur CURSOR FOR 
	SELECT `tablename`, `columnname`
	FROM template_meta
    WHERE `tablename`= tablename
    ORDER BY `ordinal_position`;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

SET @sql = CONCAT('CREATE PROCEDURE ', databasename, '.', 'tfm_sp_',tablename, '()\n');

SET @sql = CONCAT(@sql,'INSERT INTO ', databasename, '.', 'dat_',tablename, ' \n ');
SET @sql = CONCAT(@sql,'SELECT\n');
	
OPEN cur;
	testLoop: LOOP
		FETCH cur INTO _tablename, _columnname;
		
        IF finished = 1 THEN
			LEAVE testLoop;
		END IF;
    
		SET @sql = CONCAT(@sql,'`',_columnname,'`',',\n');
        
	END LOOP testLoop;
	
    #cutoff surplus comma and carriage return
    SET @sql = LEFT(@sql,length(@sql)-2);
    
    SET @sql = CONCAT(@sql,'\n',' FROM ', databasename,'.', 'tfm_vw_', tablename);  
    
    SELECT @sql;
    
    # This cant be done
    #Error Code: 1295 This command is not supported in the prepared statement protocol yet
    #https://www.mysqlfaqs.net/mysql-faqs/Errors/ERROR-1295-(HY000):-This-command-is-not-supported-in-the-prepared-statement-protocol-yet
    PREPARE cmd FROM @sql ; 
	EXECUTE cmd; 
	DEALLOCATE PREPARE cmd ;
        
CLOSE cur;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_tfm_view` (IN `databasename` NVARCHAR(64), IN `tablename` NVARCHAR(64))  BEGIN

DECLARE _tablename, _columnname nvarchar(64);
DECLARE _datatype, _dimension nvarchar(10);
DECLARE _cast_datatype nvarchar(10);
    
DECLARE finished INTEGER DEFAULT 0;
DECLARE cur CURSOR FOR 
	SELECT `tablename`, `columnname`,`datatype`, `dimension`,
	CASE WHEN (`datatype` = 'varchar') THEN 'NCHAR' 
	WHEN (`datatype` = 'char') THEN 'CHAR' 
    WHEN (`datatype` = 'int') THEN 'SIGNED'
	ELSE 'Unknown'  
	END AS cast_datatype
    FROM template_meta
    WHERE `tablename`= tablename
    ORDER BY `ordinal_position`;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

SET @sql = CONCAT('CREATE VIEW ',databasename,'.', 'tfm_vw_',tablename, ' AS \nSELECT\n ');
	
OPEN cur;
	testLoop: LOOP
		FETCH cur INTO _tablename, _columnname, _datatype, _dimension,_cast_datatype ;
		IF finished = 1 THEN
			LEAVE testLoop;
		END IF;
    
		SET @sql = CONCAT(@sql,'CAST(`',_columnname,'`',' AS ',_cast_datatype);
        
        IF (isnull(_dimension) OR _dimension= ''  ) THEN 
			SET @sql = CONCAT(@sql,' ');
		ELSE
			SET @sql = CONCAT(@sql,'(',_dimension,') '); 
		END IF;
        #ends the cast
        SET @sql = CONCAT(@sql,')');
        SET @sql = CONCAT(@sql,' AS ','`',_columnname,'`',',','\n');
        
	END LOOP testLoop;
	
    #cutoff surplus comma and carriage return
    SET @sql = LEFT(@sql,length(@sql)-2);
    
    SET @sql = CONCAT(@sql,'\n',' FROM ', databasename,'.', 'ext_', tablename);  
    
    PREPARE cmd FROM @sql ; 
	EXECUTE cmd; 
	DEALLOCATE PREPARE cmd ;
        
CLOSE cur;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sample` (IN `x` INT, IN `y` INT)  BEGIN
	
    SET @s = CONCAT('SELECT ',x,'+',y , ' as Result' );
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_seed_template_meta` (IN `databasename` NVARCHAR(64), IN `tablename` NVARCHAR(64))  BEGIN
DECLARE _columnname nvarchar(64);
DECLARE _ordinal_position int;

DECLARE finished INTEGER DEFAULT 0;
DECLARE cur CURSOR FOR 
	SELECT `COLUMN_NAME`,`ORDINAL_POSITION` 
	FROM `INFORMATION_SCHEMA`.`COLUMNS` 
	WHERE `TABLE_SCHEMA`=databasename 
	AND `TABLE_NAME`=tablename;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
OPEN cur;
		SET @sql = CONCAT('DELETE FROM template_meta WHERE tablename = "',tablename,'";');
        
    	PREPARE cmd FROM @sql ; 
		EXECUTE cmd; 
		DEALLOCATE PREPARE cmd ;
        
	testLoop: LOOP
		FETCH cur INTO _columnname, _ordinal_position;
		IF finished = 1 THEN
			LEAVE testLoop;
		END IF;
		
        SET @sql = CONCAT( 'insert into template_meta (tablename,columnname,ordinal_position,datatype, min_length, max_length, count_blanks, dimension) ');
		SET @sql = CONCAT(@sql, 'SELECT "', 
			tablename, '","',
            _columnname,'","', 
            _ordinal_position,'","', 
            'varchar" as datatype,',
            'MIN(LENGTH(','`',_columnname,'`',')),',
            'MAX(LENGTH(','`',_columnname,'`',')),',
			'0,',
            'MAX(LENGTH(','`',_columnname,'`',')) ',
            ' FROM ',databasename,'.',tablename, ' ',';'); 
        #use for debug
		#SELECT @sql;
		PREPARE cmd FROM @sql ; 
		EXECUTE cmd; 
		DEALLOCATE PREPARE cmd ;
		
        SET @sql = concat('UPDATE template_meta SET count_blanks = (SELECT COUNT(*) FROM ',databasename,'.',tablename);  
        SET @sql = concat(@sql,' WHERE `', _columnname, '` IS NULL OR `', _columnname, '` = '''' )');
        SET @sql = concat(@sql,' WHERE tablename = ','''', tablename, '''', ' AND columnname = ', '''', _columnname,'''',  ';');
        #use for debug
		SELECT @sql;
        PREPARE cmd FROM @sql ; 
		EXECUTE cmd; 
		DEALLOCATE PREPARE cmd ;
        
	END LOOP testLoop;
	
        
  CLOSE cur;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `template_meta`
--

CREATE TABLE `template_meta` (
  `tablename` varchar(64) NOT NULL,
  `columnname` varchar(64) NOT NULL,
  `ordinal_position` int(11) NOT NULL,
  `datatype` varchar(10) NOT NULL,
  `min_length` int(11) DEFAULT NULL,
  `max_length` int(11) NOT NULL,
  `count_blanks` int(11) NOT NULL,
  `dimension` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `template_meta`
--

INSERT INTO `template_meta` (`tablename`, `columnname`, `ordinal_position`, `datatype`, `min_length`, `max_length`, `count_blanks`, `dimension`) VALUES
('ext_american_cars', 'data-bodystyle', 12, 'varchar', 7, 23, 0, 30),
('ext_american_cars', 'data-engine', 9, 'varchar', 4, 40, 0, 50),
('ext_american_cars', 'data-extcolor', 5, 'varchar', 0, 41, 6, 50),
('ext_american_cars', 'data-fueltype', 10, 'varchar', 9, 13, 0, 13),
('ext_american_cars', 'data-intcolor', 6, 'varchar', 0, 26, 39, 50),
('ext_american_cars', 'data-make', 1, 'varchar', 3, 10, 0, 15),
('ext_american_cars', 'data-model', 2, 'varchar', 2, 21, 0, 30),
('ext_american_cars', 'data-modelcode', 15, 'varchar', 0, 11, 4, 11),
('ext_american_cars', 'data-msrp', 16, 'varchar', 1, 5, 0, 5),
('ext_american_cars', 'data-name', 13, 'varchar', 11, 51, 0, 100),
('ext_american_cars', 'data-price', 8, 'int', 1, 5, 0, NULL),
('ext_american_cars', 'data-stocknum', 17, 'varchar', 6, 6, 0, 6),
('ext_american_cars', 'data-trans', 7, 'varchar', 0, 9, 1, 10),
('ext_american_cars', 'data-trim', 4, 'varchar', 1, 27, 0, 35),
('ext_american_cars', 'data-vehicletype', 11, 'varchar', 4, 4, 0, 4),
('ext_american_cars', 'data-vin', 14, 'char', 17, 17, 0, 17),
('ext_american_cars', 'data-year', 3, 'int', 4, 4, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `template_meta`
--
ALTER TABLE `template_meta`
  ADD PRIMARY KEY (`tablename`,`columnname`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
