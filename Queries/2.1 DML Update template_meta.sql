UPDATE `cars_template`.`template_meta` SET `dimension` = '15' WHERE (`ordinal_position` = '1') and (`tablename` = 'ext_american_cars') and (`columnname` = 'data-make');
UPDATE `cars_template`.`template_meta` SET `dimension` = '30' WHERE (`ordinal_position` = '2') and (`tablename` = 'ext_american_cars') and (`columnname` = 'data-model');
UPDATE `cars_template`.`template_meta` SET `dimension` = '35' WHERE (`ordinal_position` = '4') and (`tablename` = 'ext_american_cars') and (`columnname` = 'data-trim');
UPDATE `cars_template`.`template_meta` SET `datatype` = 'INT', `dimension` = NULL WHERE (`ordinal_position` = '3') and (`tablename` = 'ext_american_cars') and (`columnname` = 'data-year');
UPDATE `cars_template`.`template_meta` SET `dimension` = '50' WHERE (`ordinal_position` = '5') and (`tablename` = 'ext_american_cars') and (`columnname` = 'data-extcolor');
UPDATE `cars_template`.`template_meta` SET `dimension` = '50' WHERE (`ordinal_position` = '6') and (`tablename` = 'ext_american_cars') and (`columnname` = 'data-intcolor');
UPDATE `cars_template`.`template_meta` SET `dimension` = '10' WHERE (`ordinal_position` = '7') and (`tablename` = 'ext_american_cars') and (`columnname` = 'data-trans');
UPDATE `cars_template`.`template_meta` SET `datatype` = 'INT', `dimension` = NULL WHERE (`ordinal_position` = '8') and (`tablename` = 'ext_american_cars') and (`columnname` = 'data-price');
UPDATE `cars_template`.`template_meta` SET `dimension` = '50' WHERE (`ordinal_position` = '9') and (`tablename` = 'ext_american_cars') and (`columnname` = 'data-engine');
UPDATE `cars_template`.`template_meta` SET `dimension` = '30' WHERE (`ordinal_position` = '12') and (`tablename` = 'ext_american_cars') and (`columnname` = 'data-bodystyle');
UPDATE `cars_template`.`template_meta` SET `dimension` = '100' WHERE (`ordinal_position` = '13') and (`tablename` = 'ext_american_cars') and (`columnname` = 'data-name');
UPDATE `cars_template`.`template_meta` SET `datatype` = 'char' WHERE (`ordinal_position` = '14') and (`tablename` = 'ext_american_cars') and (`columnname` = 'data-vin');


