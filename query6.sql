-- find the the id and name of the roller coasters that were ridden by the largest number of different visitors (top 10)
-- by coaster_id, coaster_name, COUNT(coaster_id) as cnt
SELECT coaster_id, coaster_name, COUNT(coaster_id) as cnt
FROM roller_coaster NATURAL JOIN visitor NATURAL JOIN visit_coaster
GROUP BY coaster_id
ORDER BY COUNT(coaster_id) DESC
LIMIT 10;


-- find all of the visitors that road the tallest roller coasters (there will be a tie) for 90 or more times
-- by visitor_name, coaster_name, coaster_count, coaster_height
-- ordered by coaster_count DESC, coaster_name ASC

-- Utilizing idx_coaster_height here. Process is sped up by creating an index for coaster_height as I did in index6.sql

SELECT visitor_name, coaster_name, coaster_count, coaster_height
FROM roller_coaster NATURAL JOIN visitor NATURAL JOIN visit_coaster
WHERE coaster_height = (
	SELECT MAX(coaster_height)
	FROM roller_coaster)
AND coaster_count >= 90
ORDER BY coaster_count DESC, coaster_name;


-- find the number of positive reviews that people with first name: Nicholas, left for all parks
-- by park_name, COUNT(review as review_count)

-- Utilizing idx_visitor_name here. Process is sped up by creating an index for visitor_name as I did in index6.sql

SELECT review, COUNT(review) as review_count
FROM amusement_park NATURAL JOIN visitor NATURAL JOIN visit_park
WHERE visitor_name like '%Nicholas %' and review != 'Bad'
GROUP BY review;


-- Find the average coaster_height in meters (coverted from ft) for all of the parks that are located in Illinois
-- by avg_height_meters
-- Used inner join with on, and utilized again the coaster_height index

SELECT AVG(coaster_height) * (0.3048) AS avg_height_meters
FROM roller_coaster AS r INNER JOIN amusement_park AS p
ON r.park_id = p.park_id
GROUP BY p.location_state
HAVING p.location_state = 'Illinois';