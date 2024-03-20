-- SQL Script to rank countries' origin og bands by the fans they have
-- Resultset should be grouped by origin and ordered by sum of fans aliased as nb_fans

SELECT `origin`, SUM(`fans`) AS `nb_fans` FROM `metal_bands`
    GROUP BY `origin`
    ORDER BY `nb_fans` DESC;
