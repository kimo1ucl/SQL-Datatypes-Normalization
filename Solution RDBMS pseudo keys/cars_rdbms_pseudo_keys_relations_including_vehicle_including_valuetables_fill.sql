USE `cars_rdbms_pseudo_keys`;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `make`;
TRUNCATE TABLE `model`;
TRUNCATE TABLE `trim`;
TRUNCATE TABLE `engine`;
TRUNCATE TABLE `color`;
TRUNCATE TABLE `bodystyle`;
TRUNCATE TABLE `transmission`;
TRUNCATE TABLE `vehicles`;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO `make`(`make`)
SELECT DISTINCT (`data-make`)
FROM `cars_stage`.`dat_american_cars`;

INSERT INTO `model` (`model`,`make_id`)
SELECT DISTINCT dat.`data-model`, m.make_id
FROM `cars_stage`.`dat_american_cars` AS dat
INNER JOIN `make` AS m ON dat.`data-make` = m.make;

INSERT INTO `trim` (`trim`,`model_id`)
SELECT DISTINCT dat.`data-trim`, mo.model_id
FROM  `cars_stage`.`dat_american_cars` AS dat
INNER JOIN `model` AS mo ON dat.`data-model` = mo.model;

INSERT INTO `engine` (`engine`,`fueltype`,`model_id`)
SELECT DISTINCT dat.`data-engine`, dat.`data-fueltype`, mo.model_id
FROM `cars_stage`.`dat_american_cars` AS dat
INNER JOIN `model` AS mo ON dat.`data-model` = mo.`model`;

INSERT INTO `color` (`intcolor`,`extcolor`,`make_id`)
SELECT DISTINCT 
IFNULL(nullif(dat.`data-intcolor`,''), 'UNK') AS intcolor,
IFNULL(nullif(dat.`data-extcolor`,''), 'UNK') AS extcolor, 
m.make_id
FROM  `cars_stage`.`dat_american_cars` AS dat
INNER JOIN `make` AS m ON dat.`data-make` = m.`make`;

INSERT INTO `bodystyle`
(`bodystyle`)
SELECT DISTINCT 
dat.`data-bodystyle`
FROM 
`cars_stage`.`dat_american_cars` AS dat;

INSERT INTO `transmission` (`transmission`)
SELECT DISTINCT 
# The column is nullable in the dat table, so we need to handle that case
IFNULL(nullif(dat.`data-trans`,''), 'UNK') AS transmission
FROM  `cars_stage`.`dat_american_cars` AS dat;


INSERT INTO `cars_rdbms_pseudo_keys`.`vehicles` 
(`make_id`,
`model_id`,
`year`,
`trim_id`,
`color_id`,
`transmission_id`,
`price`,
`engine_id`,
`vehicletype`,
`bodystyle_id`,
`name`,
`vin`,
`modelcode`,
`stocknum`)
SELECT 
`fn_lookup_make_id`(dat.`data-make`),
`fn_lookup_model_id`(dat.`data-make`, dat.`data-model`),
`dat`.`data-year`,
`fn_lookup_trim_id`(dat.`data-make`, dat.`data-model`, dat.`data-trim`),
`fn_lookup_color_id`(dat.`data-make`, dat.`data-intcolor`,dat.`data-extcolor`),
`fn_lookup_transmission_id`(dat.`data-trans`),
`dat`.`data-price`,
`fn_lookup_engine_id`(dat.`data-make`, dat.`data-model`, dat.`data-engine`, dat.`data-fueltype`),
`dat`.`data-vehicletype`,
`fn_lookup_bodystyle_id`(dat.`data-bodystyle`),
`dat`.`data-name`,        
`dat`.`data-vin`,             
`dat`.`data-modelcode`,
`dat`.`data-stocknum`
FROM 
`cars_stage`.`dat_american_cars` AS dat;

