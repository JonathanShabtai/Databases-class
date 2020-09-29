/*
Create at four stored procedures written in plpgsql.
Three of these stored procedures are referenced/used by your triggers.
The fourth stored procedure is some logic that would be called by an application or user
(any function or statement that is beyond what a SQL statement can easily do).
*/


-- Procedure 1 - For Trigger
-- Procedure for Trigger that checks whether a visitor's heights is a non negative integer
CREATE OR REPLACE FUNCTION
check_height_visitor()
RETURNS TRIGGER AS $$
	BEGIN
		IF (NEW.visitor_height <= 0) THEN
			RAISE EXCEPTION 'Height must be a positive number!';
		END IF;
		RETURN NEW;
	END;
$$
LANGUAGE plpgsql;


-- Procedure 2 - For Trigger
-- Procedure for Trigger that checks whether a new entry of coaster
-- has a valid openning and closing years (An openning year was entered, and if a closing year was entered too, it has
-- to be later than the openning year)
CREATE OR REPLACE FUNCTION
check_date_coaster()
RETURNS TRIGGER AS $$
	BEGIN
		IF NEW.coaster_year_opened is NULL THEN
			RAISE EXCEPTION 'All coasters must have an openning year!';
		ELSIF NEW.coaster_year_closed is not NULL THEN
			IF (NEW.coaster_year_opened > NEW.coaster_year_closed) THEN
				RAISE EXCEPTION 'Openning year cannot be after a closing year!';
			END IF;
		END IF;
		RETURN NEW;
	END;
$$
LANGUAGE plpgsql;


-- Procedure 3 - Not used by triggers
-- Takes a visitor and asseses whether he/she has at least 2 more 'GREAT!' reviews than 'Bad'
-- Returns 'Very happy' if so, returns 'Neutral' if there is an equal number of GREAT!s and Bads
-- and 'Not very happy' otherwise
CREATE OR REPLACE FUNCTION
	assessHappiness(v_name text)
RETURNS text AS $$
DECLARE
	num_greats integer;
	num_bads integer;
BEGIN
	SELECT COUNT(*) INTO num_greats
	FROM visit_park NATURAL JOIN visitor
	WHERE visitor_name = v_name AND review = 'GREAT!';

	SELECT COUNT(*) INTO num_bads
	FROM visit_park NATURAL JOIN visitor
	WHERE visitor_name = v_name AND review = 'Bad';

	IF (num_greats - num_bads) >= 2
		THEN return 'Very happy';
	ELSIF (num_greats - num_bads) >= 0
		THEN return 'Neutral';
	ELSE
		return 'Upset';
	END IF;
END;
$$ LANGUAGE plpgsql;


-- Procedure 4 - Not used by triggers
-- Charge tax from all restaurants
-- Update all of the revenue from each costumer for each food stall
-- Such that it multiplies their value by a factor of 0.8
CREATE OR REPLACE FUNCTION
	food_stall_after_tax()
RETURNS void AS $$
	BEGIN
		UPDATE dine SET money_spent = money_spent * 0.8;
	END;
$$
LANGUAGE plpgsql;


-- Log table
-- used this site as reference: https://www.cybertec-postgresql.com/en/tracking-changes-in-postgresql/
-- The table will reflect all of the inserts, updates, and deletes for the visitor relation
-- Stores a time stamp, operation, and new and old values
CREATE OR REPLACE FUNCTION
	visitor_log_update()
RETURNS TRIGGER AS $$
	BEGIN
		if TG_OP = 'INSERT'  THEN
			INSERT INTO visitor_log (operation, new_val)
			VALUES (TG_OP, row_to_json(NEW));
			RETURN NEW;
		ELSIF TG_OP = 'UPDATE'  THEN
			INSERT INTO visitor_log (operation, new_val, old_val)
			VALUES (TG_OP, row_to_json(NEW), row_to_json(OLD));
			RETURN NEW;
		ELSIF TG_OP = 'DELETE'  THEN
			INSERT INTO visitor_log (operation, old_val)
			VALUES (TG_OP, row_to_json(OLD));
			RETURN OLD;
		END IF;
	END;
$$
language plpgsql;