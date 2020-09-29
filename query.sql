-- view the top 10 tallest coasters in the USA
SELECT coaster_name, coaster_height FROM roller_coaster WHERE coaster_height IS NOT NULL ORDER BY coaster_height DESC LIMIT 10;

-- view all types of foods available in all amusement parks
SELECT DISTINCT stall_type FROM food_stall;

-- show oldest to newest manufacturer by manuf_name, manuf_year_opened
SELECT manuf_name, manuf_year_opened FROM manufacturer WHERE manuf_year_opened IS NOT NULL ORDER BY manuf_year_opened;

-- find all manufactuaring companies owned by Reggio Emilia by owner, manuf_name
SELECT owner, manuf_name FROM manufacturer WHERE owner = 'Reggio Emilia';

-- find flat_rides that are at exicement 3 or less by ride_id, ride_name
SELECT ride_id, ride_name FROM flat_ride WHERE ride_thrill_level < 4;

-- find all coasters built by Intamin (using two tables here to have more interesting queries)
SELECT coaster_name FROM roller_coaster natural join manufacturer WHERE manuf_name = 'Intamin';

-- view which visitor rode which coaster by visitor_name, coaster_name (using three tables here)
SELECT visitor_name, coaster_name FROM visitor natural join visit_coaster natural join roller_coaster;