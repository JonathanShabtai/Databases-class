-- Develop and test at least three views

-- create view that stores a list of coastes from cedar point sorted by coaster_height DESC
-- by coaster_id, coaster_name, coaster_height
-- allows easy querying on specific coasters in specific parks and specific attributes
-- (cedar point and height for instance)
CREATE VIEW
cedar_point_coasters AS (
	SELECT coaster_id, coaster_name, coaster_height
	FROM roller_coaster NATURAL JOIN amusement_park
	WHERE park_name = 'Cedar Point')
	ORDER BY coaster_height DESC;

-- create view that stores the people who cannot ride all of the coasters
-- i.e, their height is lower than the lowest restrication
-- by visitor_id, visitor_name, visitor_height
-- useful for the system as will allow querying the restricted guests group easily
CREATE VIEW
restricted_guests AS (
	SELECT visitor_id, visitor_name, visitor_height
	FROM visitor
	WHERE visitor_height < (
		SELECT MIN(height_restriction)
		FROM roller_coaster)
	);

-- create view of prolific manufacturers, i.e. that have more than 5 roller coasters manufactured
-- by manuf_id, manuf_name, count as coaster_count
-- useful in finding trends amongst the most popular manufacturers
CREATE VIEW
prolific_manuf AS (
	SELECT manuf_id, manuf_name, COUNT(coaster_id) AS coaster_count
	FROM manufacturer NATURAL JOIN roller_coaster
	GROUP BY manuf_id
	HAVING COUNT(coaster_id) >= 5
	);