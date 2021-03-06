USE cars_rdbms_pseudo_key;

SELECT `make`,
    `model`,
    `year`,
    `trim`,
    `extcolor`,
    `intcolor`,
    `trans`,
    `price`,
    `engine`,
    `fueltype`,
    `vehicletype`,
    `bodystyle`,
    `name`,
    `vin`,
    `modelcode`,
    `stocknum`
FROM `vw_american_cars`
ORDER BY `make`,
    `model`,
    `year`,
    `trim`,
    `extcolor`,
    `intcolor`,
    `trans`,
    `price`,
    `engine`,
    `fueltype`,
    `vehicletype`,
    `bodystyle`,
    `name`,
    `vin`,
    `modelcode`,
    `stocknum`