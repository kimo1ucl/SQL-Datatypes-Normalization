USE `cars_rdbms_pseudo_keys`;

DROP function IF EXISTS `fn_lookup_make_id`;
DELIMITER $$
CREATE FUNCTION fn_lookup_make_id (make varchar(15) )
RETURNS INTEGER
BEGIN
	DECLARE id INT;
	SELECT make_id INTO id 
    FROM make 
    WHERE make.make = make ;
RETURN id;
END$$
DELIMITER ;

DROP function IF EXISTS `fn_lookup_model_id`;
DELIMITER $$
CREATE FUNCTION fn_lookup_model_id (make varchar(15), model varchar(30) )
RETURNS INTEGER
BEGIN
	DECLARE id INT;
	SELECT model_id INTO id 
    FROM model 
    INNER JOIN make ON make.make_id = model.make_id
    WHERE model.model = model
    AND   make.make = make;
RETURN id;
END$$
DELIMITER ;

DROP function IF EXISTS `fn_lookup_color_id`;
DELIMITER $$
CREATE FUNCTION fn_lookup_color_id (make varchar(15), intcolor varchar(50), extcolor varchar(50) )
RETURNS INTEGER
BEGIN
	DECLARE id INT;
	SELECT color_id INTO id 
    FROM color 
    INNER JOIN make ON make.make_id = color.make_id
    WHERE color.intcolor = IFNULL(nullif(intcolor,''), 'UNK')
    AND   color.extcolor = IFNULL(nullif(extcolor,''), 'UNK')
    AND   make.make = make;
RETURN id;
END$$
DELIMITER ;                                                 

DROP function IF EXISTS `fn_lookup_engine_id`;                   
DELIMITER $$                                                    
CREATE FUNCTION fn_lookup_engine_id (make varchar(15), model varchar(30), engine varchar(50), fueltype varchar(13) )         
RETURNS INTEGER                                                 
BEGIN                                                           
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
DELIMITER ; 

DROP function IF EXISTS `fn_lookup_trim_id`;                   
DELIMITER $$                                                    
CREATE FUNCTION fn_lookup_trim_id (make varchar(15), model varchar(30), trim varchar(50) )         
RETURNS INTEGER                                                 
BEGIN                                                           
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

DROP function IF EXISTS `fn_lookup_transmission_id`;                   
DELIMITER $$                                                    
CREATE FUNCTION fn_lookup_transmission_id (transmission varchar(10) )         
RETURNS INTEGER                                                 
BEGIN                                                           
	DECLARE id INT;                                               
	SELECT transmission_id INTO id 
    FROM transmission 
    WHERE transmission.transmission = IFNULL(nullif(transmission,''), 'UNK');
RETURN id;                                                      
END$$                                                           
DELIMITER ; 

DROP function IF EXISTS `fn_lookup_bodystyle_id`;                   
DELIMITER $$                                                    
CREATE FUNCTION fn_lookup_bodystyle_id (bodystyle varchar(30) )         
RETURNS INTEGER                                                 
BEGIN                                                           
	DECLARE id INT;                                               
	SELECT bodystyle_id INTO id 
    FROM bodystyle 
    WHERE bodystyle.bodystyle = bodystyle;
RETURN id;                                                      
END$$                                                           
DELIMITER ;  


