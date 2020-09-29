/*
SELECT COUNT(*) AS amusement_park_count FROM amusement_park;
SELECT COUNT(*) AS manufacturer_count FROM manufacturer;
SELECT COUNT(*) AS visitor_count FROM visitor;
SELECT COUNT(*) AS roller_coaster_count FROM roller_coaster;
SELECT COUNT(*) AS food_stall_count FROM food_stall;
SELECT COUNT(*) AS flat_ride_count FROM flat_ride;
SELECT COUNT(*) AS visit_coaster_count FROM visit_coaster;
SELECT COUNT(*) AS dine_count FROM dine;
SELECT COUNT(*) AS visit_flat_count FROM visit_flat;
SELECT COUNT(*) AS visit_park_count FROM visit_park;
*/

-- Shows the number of entries for each table
-- Opted for the single result set.
-- Had to abbriviate the names of the columns to fit well in the terminal window (will need to have terminal on full screen).

SELECT
	(SELECT COUNT(*) FROM amusement_park) AS park_cnt,
	(SELECT COUNT(*) FROM manufacturer) AS manuf_cnt,
	(SELECT COUNT(*) FROM visitor) AS visitor_cnt,
	(SELECT COUNT(*) FROM roller_coaster) AS coaster_cnt,
	(SELECT COUNT(*) FROM food_stall) AS food_stall_cnt,
	(SELECT COUNT(*) FROM flat_ride) AS flat_ride_cnt,
	(SELECT COUNT(*) FROM visit_coaster) AS visit_coaster_cnt,
	(SELECT COUNT(*) FROM dine) AS dine_cnt,
	(SELECT COUNT(*) FROM visit_flat) AS visit_flat_cnt,
	(SELECT COUNT(*) FROM visit_park) AS visit_park_cnt
;