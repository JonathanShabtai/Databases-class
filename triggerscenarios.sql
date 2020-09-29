/*
To show that your triggers work create a script called triggerscenarios.sql that shows,
for each trigger, the effect of two database modifications.
One modification should activate the trigger while the other should not.
In the script, show queries that demonstrate that the trigger has an effect in the first case and not in the second one.
*/

-- 1
-- Check height_checker trigger
-- put a 0 as height and expect an error
INSERT INTO visitor (visitor_name, visitor_height, visitor_date_of_birth)
VALUES ('Mark Garfield', 0, '1970-04-02');

-- expect to not find Mark Garfield
SELECT * FROM visitor;

-- try to insert a new visitor with valid inputs
-- expect no errors
INSERT INTO visitor (visitor_name, visitor_height, visitor_date_of_birth)
VALUES ('Mark Garfield', 70, '1970-04-02');

-- expect to find Mark Garfield
SELECT * FROM visitor WHERE visitor_name = 'Mark Garfield';


-- 2
-- Check check_date_coaster trigger
-- put an openning date that is later than the closed date and expect an error
INSERT INTO roller_coaster (coaster_name, coaster_length, coaster_height, drop,
	speed, inversions, duration, coaster_type, height_restriction, coaster_year_opened, coaster_year_closed, park_id, manuf_id)
VALUES
('New_Coaster_1', 5394, 230, 215, 80, 0, 140, 'Steel', 54, '2002-04-07', '2001-04-07', 1, 1);

-- expect to see an empty table
SELECT coaster_name, coaster_height FROM roller_coaster WHERE coaster_name = 'New_coaster_1';

-- test NULL openning year
INSERT INTO roller_coaster (coaster_name, coaster_length, coaster_height, drop,
	speed, inversions, duration, coaster_type, height_restriction, coaster_year_opened, coaster_year_closed, park_id, manuf_id)
VALUES
('New_Coaster_1', 5394, 230, 215, 80, 0, 140, 'Steel', 54, NULL, NULL, 1, 1);

-- expect to see an empty table
SELECT coaster_name, coaster_height FROM roller_coaster WHERE coaster_name = 'New_coaster_1';

-- put a valid openning date and closing date
-- expect no error
INSERT INTO roller_coaster (coaster_name, coaster_length, coaster_height, drop,
	speed, inversions, duration, coaster_type, height_restriction, coaster_year_opened, coaster_year_closed, park_id, manuf_id)
VALUES
('New_Coaster_2', 5394, 230, 215, 80, 0, 140, 'Steel', 54, '2001-04-07', '2002-04-07', 1, 1);

-- expect to see a table with one value
SELECT coaster_name, coaster_height FROM roller_coaster WHERE coaster_name = 'New_Coaster_2';


-- 3
-- Testing log table
-- Print the log table in between each change
-- Cut the new_val and old_val to 40 characters as they are long json strings
SELECT visitor_log_id, tstamp, operation, left(new_val, 40) AS new_val, left(old_val, 40) AS old_val FROM visitor_log;

INSERT INTO visitor (visitor_name, visitor_height, visitor_date_of_birth)
VALUES ('Mike Charles', 70, '1970-04-02');

SELECT visitor_log_id, tstamp, operation, left(new_val, 40) AS new_val, left(old_val, 40) AS old_val FROM visitor_log;

INSERT INTO visitor (visitor_name, visitor_height, visitor_date_of_birth)
VALUES ('Moshe Yass', 50, '1995-09-09');

SELECT visitor_log_id, tstamp, operation, left(new_val, 40) AS new_val, left(old_val, 40) AS old_val FROM visitor_log;

UPDATE visitor
SET visitor_name = 'Yoni Shabtai'
WHERE visitor_name = 'Jonathan Shabtai';

SELECT visitor_log_id, tstamp, operation, left(new_val, 40) AS new_val, left(old_val, 40) AS old_val FROM visitor_log;

DELETE FROM visitor
WHERE visitor_name = 'Mike Charles';

SELECT visitor_log_id, tstamp, operation, left(new_val, 40) AS new_val, left(old_val, 40) AS old_val FROM visitor_log;