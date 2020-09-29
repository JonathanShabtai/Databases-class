-- Write at least three triggers procedures in PostgreSQL's format
/*
One of your triggers should enforce an integrity constraint on your database, this could be a complex attribute constraint/check or it could be a constraint that needs to check the state of another table(s) to ensure the state of the DB is 'correct'.
One trigger should keep track of changes to a given table in a log table (if you do not already have a log table in your database - which is very likely - you should create one for this assignment). Add a create table statement, and write/insert record changes to this log to capture how data changes in your create_db.sql file.
One trigger can do anything you want it to do!
*/

-- Trigger to check whether a visitor has a valid heighet (i.e. non negative number)
CREATE TRIGGER height_checker
BEFORE INSERT ON visitor
FOR EACH ROW
EXECUTE PROCEDURE check_height();

-- Trigger to check whether a coaster's openning date has taken place before its closing date (if a closing date exists)
-- and if an openning date is entered
CREATE TRIGGER check_date_coaster
BEFORE INSERT ON roller_coaster
FOR EACH ROW
EXECUTE PROCEDURE check_date_coaster();

-- Trigger to keep track of changes with regards to the visitor relation
-- Keeps track of inserts, updates, and delets in a text (json) format
CREATE TRIGGER visit_log
BEFORE INSERT OR UPDATE OR DELETE ON visitor
FOR EACH ROW
EXECUTE PROCEDURE visitor_log_update();