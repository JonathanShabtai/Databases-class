-- aggregation queries

-- find the number of roller coasters in each park, in DESC order of cnt
-- by park_name, cnt
SELECT park_name, count(*) as cnt
FROM roller_coaster NATURAL JOIN amusement_park
GROUP BY park_name
ORDER BY count(*) DESC;

-- find the tallest roller coaster that each manufacturer built
-- by height_in_ft, manuf_name ordered by height in desc order
SELECT max(coaster_height) as height_in_ft, manuf_name
FROM roller_coaster NATURAL JOIN manufacturer
GROUP BY manuf_name
HAVING max(coaster_height) IS NOT NULL
ORDER BY height_in_ft DESC;

-- find the type of cuisine that makes the most money across all parks, in DESC order
-- by stall_type, total_money
SELECT stall_type, sum(money_spent) as total_money
FROM food_stall NATURAL JOIN dine NATURAL JOIN visitor
GROUP BY stall_type
ORDER BY total_money DESC;

-- find the average speed of the coasters per park for average > 60
-- by park_name, speed 
SELECT park_name, avg(speed) as speed 
FROM roller_coaster NATURAL JOIN amusement_park
GROUP BY park_name
HAVING avg(speed) IS NOT NULL
AND avg(speed) > 60;

-- find how many coasters that are taller than 200ft each manufacturer built
-- by manufacturer, cnt ordered by cnt DESC and then manufacturer ASC
SELECT manuf_name, count(roller_coaster) AS cnt
FROM roller_coaster NATURAL JOIN manufacturer
WHERE coaster_height > 200
GROUP BY manuf_name
ORDER BY cnt DESC, manuf_name ASC;

-- find the visitor who has the highest coasters rode count as nct and visited exactly 2 different parks
-- by visitor_name, coasters count as cnt, sorted by cnt DESC and then visitor name ASC
SELECT visitor_name, sum(coaster_count) as cnt
FROM visitor NATURAL JOIN visit_coaster
GROUP BY visitor_name
HAVING visitor_name IN (SELECT visitor_name
	FROM visitor NATURAL JOIN visit_park
	GROUP BY visitor_name
	HAVING count(park_id) = 2)
ORDER BY cnt DESC, visitor_name ASC;
