DROP DATABASE IF EXISTS cars_template;
CREATE DATABASE cars_template;

USE cars_template;
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

ALTER TABLE `cars_template`.`template_meta` 
ADD PRIMARY KEY (`tablename`, `columnname`);

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
