SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE `cars_rdbms_business_keys`.`make`;
INSERT INTO `cars_rdbms_business_keys`.`make`
SELECT DISTINCT `data-make`
FROM `cars_stage`.`dat_american_cars`;

TRUNCATE TABLE `cars_rdbms_business_keys`.`model`;
INSERT INTO `cars_rdbms_business_keys`.`model`
SELECT DISTINCT `data-model`,`data-make`
FROM `cars_stage`.`dat_american_cars`;

TRUNCATE TABLE `cars_rdbms_business_keys`.`engine`;
INSERT INTO `cars_rdbms_business_keys`.`engine`
SELECT DISTINCT `data-engine`,`data-fueltype`,`data-model`,`data-make`
FROM `cars_stage`.`dat_american_cars`;

TRUNCATE TABLE `cars_rdbms_business_keys`.`trim`;
INSERT INTO `cars_rdbms_business_keys`.`trim`
SELECT DISTINCT `data-trim`,`data-model`,`data-make`
FROM `cars_stage`.`dat_american_cars`;

TRUNCATE TABLE `cars_rdbms_business_keys`.`extcolor`;
INSERT INTO `cars_rdbms_business_keys`.`extcolor`
SELECT DISTINCT `data-extcolor`
FROM `cars_stage`.`dat_american_cars`
WHERE NULLIF(`data-extcolor`, '') IS NOT NULL ;

TRUNCATE TABLE `cars_rdbms_business_keys`.`intcolor`;
INSERT INTO `cars_rdbms_business_keys`.`intcolor`
SELECT DISTINCT `data-intcolor`
FROM `cars_stage`.`dat_american_cars`
WHERE NULLIF(`data-intcolor`, '') IS NOT NULL ;

TRUNCATE TABLE `cars_rdbms_business_keys`.`bodystyle`;
INSERT INTO `cars_rdbms_business_keys`.`bodystyle`
SELECT DISTINCT `data-bodystyle`
FROM `cars_stage`.`dat_american_cars`
WHERE NULLIF(`data-bodystyle`, '') IS NOT NULL ;

TRUNCATE TABLE `cars_rdbms_business_keys`.`transmission`;
INSERT INTO `cars_rdbms_business_keys`.`transmission`
SELECT DISTINCT `data-trans`
FROM `cars_stage`.`dat_american_cars`
WHERE NULLIF(`data-trans`, '') IS NOT NULL ;

TRUNCATE TABLE `cars_rdbms_business_keys`.`vehicle`;
INSERT INTO `cars_rdbms_business_keys`.`vehicle`
SELECT `dat_american_cars`.`data-make`,
    `dat_american_cars`.`data-model`,
    `dat_american_cars`.`data-year`,
    `dat_american_cars`.`data-trim`,
    `dat_american_cars`.`data-extcolor`,
    `dat_american_cars`.`data-intcolor`,
    `dat_american_cars`.`data-trans`,
    `dat_american_cars`.`data-price`,
    `dat_american_cars`.`data-engine`,
    `dat_american_cars`.`data-fueltype`,
    `dat_american_cars`.`data-vehicletype`,
    `dat_american_cars`.`data-bodystyle`,
    `dat_american_cars`.`data-name`,
    `dat_american_cars`.`data-vin`,
    `dat_american_cars`.`data-modelcode`,
    `dat_american_cars`.`data-msrp`,
    `dat_american_cars`.`data-stocknum`
FROM `cars_stage`.`dat_american_cars`;
SET FOREIGN_KEY_CHECKS = 1;