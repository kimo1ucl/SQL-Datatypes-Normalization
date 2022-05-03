CREATE  VIEW `vw_american_cars` AS 
select 
`make`.`make` AS `make`,
`model`.`model` AS `model`,
`v`.`year` AS `year`,
`trim`.`trim` AS `trim`,
`color`.`extcolor` AS `extcolor`,
`color`.`intcolor` AS `intcolor`,
`transmission`.`transmission` AS `transmission`,
`v`.`price` AS `price`,
`engine`.`engine` AS `engine`,
`engine`.`fueltype` AS `fueltype`,
`v`.`vehicletype` AS `vehicletype`,
`bodystyle`.`bodystyle` AS `bodystyle`,
`v`.`name` AS `name`,
`v`.`vin` AS `vin`,
`v`.`modelcode` AS `modelcode`,
`v`.`stocknum` AS `stocknum` 
from 
	`vehicles` AS `v` 
inner join `make` on `make`.`make_id` = `v`.`make_id`
inner join `model`on `model`.`model_id` = `v`.`model_id`
inner join `trim` on `trim`.`trim_id` = `v`.`trim_id`
inner join `color` on `color`.`color_id` = `v`.`color_id` 
inner join `transmission` on `transmission`.`transmission_id` = `v`.`transmission_id`
inner join `engine` on `engine`.`engine_id` = `v`.`engine_id` 
inner join `bodystyle` on  `bodystyle`.`bodystyle_id` = `v`.`bodystyle_id`;
