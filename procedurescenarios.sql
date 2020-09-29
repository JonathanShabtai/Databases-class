/*
To show that your fourth (non-trigger) stored procedure works,
create a script procedurescenarios.sql that shows the effect of the stored procedure.
*/


-- Find how satisfied a visitor is from all his visits
-- Takes a visitor_name and returns his/hers satisfaction level
-- Should return 'Very happy' if visitor has at least 2 more 'GREAT!' reviews than 'Bad'
-- returns 'Neutral' if there is an equal number of GREAT!s and Bads
-- and 'Not very happy' otherwise
-- showcase all visitors and their ratings
SELECT * FROM visitor NATURAL JOIN visit_park
WHERE visitor_name = 'Yoni Shabtai' OR visitor_name = 'Nathan Ray' OR visitor_name = 'Michael Hall';
SELECT assessHappiness('Yoni Shabtai');
SELECT assessHappiness('Nathan Ray');
SELECT assessHappiness('Michael Hall');


-- Charge tax from all restaurants
-- Show how the revenue is lower by a factor of 0.8 on the second table
SELECT * FROM dine LIMIT 10; -- before tax
SELECT food_stall_after_tax(); -- Note that this will display an empty table. Couldn't find a 'call' statement for the function
SELECT * FROM dine LIMIT 10; -- after tax