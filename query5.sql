-- develop and test at least eight SQL queries using the JOIN syntax discussed in class 

-- Find all of the parks that people who cannot ride all coasters visited
-- by park_id, park_name sorted by park_id, park_name
-- Used NATURAL JOIN, restricted_guests view
SELECT park_id, park_name
FROM visitor NATURAL JOIN amusement_park NATURAL JOIN visit_park
WHERE visitor_id
IN (SELECT visitor_id FROM restricted_guests)
ORDER BY park_id, park_name;

-- Find all cedar point coasters that have two or more words in their names
-- by coaster_id, coaster_name, sorted by sum DESC, coaster_name
-- used cedar_point_coasters view, natural join, and having clause
SELECT coaster_name, SUM(coaster_count)
FROM cedar_point_coasters NATURAL JOIN visit_coaster
GROUP BY coaster_name
HAVING coaster_name LIKE '% %'
ORDER BY sum DESC, coaster_name;

-- Find the average coaster_length in meters (coverted from ft) for each of the prolific manufacturer's coasters
-- Using the prolific_manuf view
-- by manuf_name, avg
-- Used inner join with on, and prolific_manuf view
SELECT p.manuf_name, AVG(coaster_length) * (0.3048) AS avg_meters
FROM prolific_manuf AS p INNER JOIN roller_coaster AS r
ON p.manuf_id = r.manuf_id
GROUP BY p.manuf_name
ORDER BY AVG(coaster_length) DESC;

-- (This is a similar query from my multirelation.sql file, except we create a table with it here)
-- create a temp table containing all of the ride_ids, ride_names and park_names for six flags park
-- by ride_id, ride_name, park_name
-- useful for mapping all of the flat rides in all six flags parks quickly
CREATE TEMPORARY TABLE
six_flags_flat_rides AS (
	SELECT ride_id, ride_name, park_name
	FROM flat_ride INNER JOIN amusement_park ON flat_ride.park_id = amusement_park.park_id
	WHERE park_name like '%Six Flags%'
	);

-- List all flat rides in six flags parks and visitors who road them if they had any
-- by ride_name, visitor_name as person_name, flat_rate as rate sort by flat_rate
-- used outer join, and six_flags_flat_rides temp table, researched coalesce online to replace empty values in table
SELECT ride_name, COALESCE(visitor_name, 'No Riders') AS person_name, COALESCE(flat_rate, 0) AS rate
FROM six_flags_flat_rides LEFT OUTER JOIN (visit_flat NATURAL JOIN visitor)
ON six_flags_flat_rides.ride_id = visit_flat.ride_id
ORDER BY flat_rate;

-- Classify every food_stall by popularity, and then return an ordered list
-- by count, stall_name, popularity
-- used both join - using, and CASE
-- Can scale up this query when more entries are introduced
SELECT COUNT(stall_id), stall_name, 
CASE
	WHEN COUNT(stall_id) >= 3 THEN 'Popular'
	WHEN COUNT(stall_id) = 2 THEN 'Decent popularity'
	ELSE 'Not Popular'
END AS Popularity
FROM food_stall JOIN dine
USING (stall_id)
GROUP BY stall_name
ORDER BY count DESC;

-- list all coasters that have speed above 50 and more than 0 inversions selecting only from prolific_manuf view
-- and cedar point coasters
-- combining two views here with a natural join
SELECT manuf_name, coaster_name, speed, inversions
FROM prolific_manuf NATURAL JOIN cedar_point_coasters NATURAL JOIN roller_coaster
WHERE speed > 50 and inversions > 0
ORDER BY inversions DESC, speed;

-- Find all of the manufacturers that have coasters in cedar point
-- but that are not prolific
-- by manuf_name, used prolific_manuf view, cedar_point_coasters view, and EXCEPT clause
SELECT manuf_name
FROM manufacturer
WHERE manuf_name IN (
(SELECT manuf_name
FROM cedar_point_coasters NATURAL JOIN manufacturer NATURAL JOIN roller_coaster)
EXCEPT
(SELECT manuf_name
FROM prolific_manuf NATURAL JOIN cedar_point_coasters NATURAL JOIN roller_coaster)
);

-- (This is a similar query from my multirelation.sql file, except we create a table with it here)
-- create a temp table containing all of the coaster_id, coaster_name and park_names for six flags park
-- by coaster_id, coaster_name, park_name
-- useful for mapping all of the roller coasters in all six flags parks quickly
CREATE TEMPORARY TABLE
six_flags_coasters AS (
	SELECT coaster_id, coaster_name, park_name
	FROM roller_coaster INNER JOIN amusement_park ON roller_coaster.park_id = amusement_park.park_id
	WHERE park_name like '%Six Flags%'
	);

-- Similar to my Case query in multirelation from proj4 (for coaster_heights), but using a temp table for coasters in six flags
-- Classify every coaster by how loopy it is, and then return an ordered list from Very loopy, to No loops
-- coaster_name, inversions, Loopy_Class
SELECT coaster_name, inversions,
CASE
	WHEN inversions >= 5 THEN '1. Very loopy'
	WHEN inversions >= 2 THEN '2. Moderately loopy'
	WHEN inversions = 1 THEN '3. One inversion'
	ELSE '4. No inversions'
END AS Loopy_Class
FROM roller_coaster NATURAL JOIN amusement_park NATURAL JOIN six_flags_coasters
ORDER BY Loopy_Class;