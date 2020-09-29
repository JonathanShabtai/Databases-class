-- modification queries
-- INSERT a single tuple, INSERT using a output control (insert using select), DELETE and UPDATE.
-- 2 of each type

-- INSERT single tuples
-- Add a new visitor
INSERT INTO visitor (visitor_name, visitor_height, visitor_date_of_birth)
VALUES ('Mark Garfield', 70, '1970-04-02');

-- Add a new coaster
INSERT INTO roller_coaster (coaster_name, coaster_length, coaster_height, drop,
	speed, inversions, duration, coaster_type, height_restriction, coaster_year_opened, coaster_year_closed, park_id, manuf_id)
VALUES
('Kingda Ka', 3118, 456, 418, 128, 0, 28, 'Steel', 55, '2005-05-21', NULL, 1, 2);

-- insert using select
-- add a new relation of coasters and their heights
DROP TABLE if exists coaster_heights_table cascade; -- Drop the table first if it exists
SELECT coaster_name, coaster_height INTO coaster_heights_table
FROM roller_coaster WHERE coaster_height IS NOT NULL ORDER BY coaster_height;

-- add a new relation of coasters that are defunct between coaster_name and park_name
DROP TABLE if exists defunct_coasters cascade;  -- Drop the table first if it exists
SELECT coaster_name, park_name INTO defunct_coasters
FROM roller_coaster NATURAL JOIN amusement_park
WHERE coaster_year_closed IS NOT NULL;

-- DELETE
-- delete a visitor named 'Jonathan Shabtai'
DELETE FROM visitor
WHERE visitor_name='Jonathan Shabtai';

-- delete coaster that are exactly 100 ft tall or have 0 inversions
DELETE FROM roller_coaster
WHERE coaster_height = 100 OR inversions = 0;

-- UPDATE
-- update a visitors name
UPDATE visitor
SET visitor_name = 'Jonathan Shabtai'
WHERE visitor_name = 'Yoni Shabtai';

-- update a particular coaster_type for Steel Vengeance
UPDATE roller_coaster
SET coaster_type = 'Steel and Wood'
WHERE coaster_type = 'Hybrid' and coaster_name = 'Steel Vengeance';
