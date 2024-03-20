-- SQL Script to list all bands with 'Glam rock' as their main style ranked by their lifespan
--
-- SELECT `band_name`, (IFNULL(`split`, '2022') - `formed`) AS `lifespan` FROM `metal_bands`
-- WHERE `style` Like "%Glam rock%" ORDER BY `lifespan` DESC;

SELECT `band_name`, (IFNULL(`split`, '2022') - `formed`) AS `lifespan`
    FROM `metal_bands` WHERE FIND_IN_SET('Glam rock', IFNULL(`style`, "")) > 0
    ORDER BY `lifespan` DESC;
