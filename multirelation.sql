-- multirelations queries

-- Find all visitors who are not allowed to ride El Toro due to height restriction
-- by visitor_name, visitor_height
SELECT visitor_name, visitor_height as height_in_inches
FROM (visitor NATURAL JOIN roller_coaster)
WHERE visitor_height < height_restriction
AND coaster_name = 'El Toro';

-- Find the parks and flat rides in them which have a thrill level of 1 and their capacity is greater than 50
-- by Park and Ride
SELECT park_name as Park, ride_name as Ride
FROM (flat_ride NATURAL JOIN amusement_park)
WHERE ride_thrill_level = 1 and ride_capacity > 50;

-- Find all the coasters in all six flags parks
-- by coaster_name, park_name
SELECT coaster_name, park_name
FROM roller_coaster INNER JOIN amusement_park ON roller_coaster.park_id = amusement_park.park_id
WHERE park_name like '%Six Flags%';

-- Find all pairs of visitors who have the same ride count on any coaster
-- by visitor_id, visitor_name, coaster_count
SELECT DISTINCT r1.visitor_id, r1.visitor_name, r1.coaster_count
FROM (visitor NATURAL JOIN visit_coaster) r1, (visitor NATURAL JOIN visit_coaster) r2
WHERE r1.coaster_count = r2.coaster_count
AND r1.visitor_id != r2.visitor_id;

-- Classify every coaster by heights, and then return an ordered list from Strata type to Regular
-- only for Cedar Point, by coaster_name, Height_Class, park_name
SELECT coaster_name,
CASE
	WHEN coaster_height >= 400 THEN '1. Strata Coaster'
	WHEN coaster_height >= 300 and coaster_height < 400 THEN '2. Giga Coaster'
	WHEN coaster_height < 300 and coaster_height >= 200 THEN '3. Hyper Coaster'
	ELSE '4. Regular Height Coaster'
END AS Height_Class,
park_name
FROM roller_coaster NATURAL JOIN amusement_park
WHERE park_name = 'Cedar Point'
ORDER BY Height_Class;

-- Find all the the visitors who dined at a 'Chipotle', and attended a park in the state of Ohio
-- by visitor_name
SELECT visitor_name
FROM visitor NATURAL JOIN dine NATURAL JOIN food_stall
WHERE stall_name = 'Chipotle' and visitor_name IN (SELECT visitor_name
	FROM visitor NATURAL JOIN visit_park NATURAL JOIN amusement_park
	WHERE location_state = 'OH');

-- Find all visitors that road coasters in which the drop was greater than the coaster's height
-- and that the coaster is located in Six Flags Great America
-- by visitor_name, coaster_name, drop, coaster_height
SELECT visitor_name, coaster_name, drop, coaster_height
FROM visitor NATURAL JOIN visit_coaster NATURAL JOIN roller_coaster
WHERE drop IS NOT NULL AND coaster_height IS NOT NULL AND drop > coaster_height
AND coaster_id IN (SELECT coaster_id
	FROM roller_coaster natural join amusement_park
	WHERE park_name = 'Six Flags Great America');
