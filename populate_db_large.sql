/* populate tables with 20 tuples each, accept otherwise noted:
There will be 10,000 amusement parks, 10,000 roller coasters,
10,000 visitors, 60,000 coaster visit relations
and 60,000 park visit relations*/

-- insert 10,000 amusement parks from a csv file
\COPY amusement_park(park_name, location_state, size_acres, park_year_opened, park_year_closed) FROM './parks_no_index' WITH (FORMAT CSV);

INSERT INTO manufacturer (manuf_name, manuf_country, owner, manuf_year_opened, manuf_year_closed)
VALUES
('Bolliger & Mabillard', 'Switzerland', 'Jeff Lao', '1988-01-01', NULL),
('Intamin', 'Switzerland', 'Robert Spieldiener', '1967-01-01', NULL),
('Walter Elias Disney', 'USA', 'Walter Elias Disney', '1975-01-15', NULL),
('Arrow Dynamics', 'USA', 'Karl Bacon', '1945-11-01', '2002-01-01'),
('Philadelphia Toboggan Coasters, Inc.', 'USA', 'Henry Auchey', '1904-01-20', NULL),
('Rocky Mountain Construction', 'USA', 'Fred Grubb', '2001-01-01', NULL),
('S&S', 'USA', 'Eric Johnson', '1994-01-01', NULL),
('Vekoma', 'Netherlands', 'Bob Blake', '1926-01-01', NULL),
('SDC', 'Italy', 'Reggio Emilia', NULL, '1993-01-01'),
/* made up the following: */
('Teslas Coasters', 'USA', 'Elon Musk', '1995-01-01', NULL),
('Crazy Coasters', 'Germany', 'Henry Ford', '1960-04-01', '1999-01-01'),
('China Extreme', 'China', 'Ming Lao', '1940-01-01', NULL),
('ABC', 'Korea', 'Kyle Brooks', NULL, NULL),
('Fastest Rides', 'France', 'Claude Shawn', '1920-01-01', NULL),
('Slow and Safe', 'France', 'Claude Shawn', '1960-01-01', NULL),
('Only Steel', 'USA', 'Jeff Lao', '1990-01-01', NULL),
('Black Steel', 'USA', 'Jeff Lao', '1995-01-01', NULL),
('Only Wooden', 'Italy', 'Reggio Emilia', '1990-01-01', NULL),
('Sky', 'Italy', 'Fred Maggiano', '1890-01-01', '1993-01-01'),
('Federal Coasters', 'USA', 'Mark Maverick', '1999-01-01', NULL)
;

-- insert 10,000 roller coasters from a csv file
\COPY roller_coaster(coaster_name, coaster_length, coaster_height, drop, speed, inversions, duration, coaster_type, height_restriction, coaster_year_opened, coaster_year_closed, park_id, manuf_id) FROM './coasters_no_index' WITH (FORMAT CSV);

INSERT INTO flat_ride (ride_name, ride_type, ride_capacity, ride_thrill_level, park_id)
VALUES
('Power Tower', 'Drop Tower', 16, 4, 2),
('SlingShot', 'Sling Shot', 2, 5, 2),
('WindSeeker', 'Swing', 50, 3, 2),
('Big Wheel', 'Ferries Wheel', 35, 1, 1),
('Congo Rapids', 'Water', 36, 2, 1),
('Black Widow', 'Swing', 60, 4, 10),
('Spaceship Earth', 'Show', 100, 1, 5),
('Tower of Terror', 'Drop Tower', 16, 4, 5),
('Frozen Ever After', 'Water', 16, 3, 5),
('Brooklyn Flyer', 'Swing', 22, 2, 7),
/* made up the following: */
('SwingSwing', 'Swing', 30, 3, 18),
('SlingShotExtreme', 'Sling Shot', 2, 5, 1),
('Big Flume', 'Water', 20, 3, 15),
('Big Wheel', 'Ferries Wheel', 35, 1, 14),
('Congo Rapids', 'Water', 36, 2, 19),
('SeaSaw', 'Swing', 60, 4, 20),
('Cowboys', 'Show', 100, 1, 15),
('Tower of Terror', 'Drop Tower', 16, 4, 6),
('Big Drop', 'Water', 16, 3, 7),
('Fast Flyer', 'Swing', 22, 2, 7)
;

-- insert 10,000 roller coasters from a csv file
\COPY visitor(visitor_name, visitor_height, visitor_date_of_birth) FROM './visitors_no_index' WITH (FORMAT CSV);

-- insert 60,000 visit roller coasters relations from a csv file. Ensured no duplicate pkey in my python code.
\COPY visit_coaster(visitor_id, coaster_id, coaster_count, coaster_rate) FROM './visit_coaster_no_index' WITH (FORMAT CSV);

-- insert 60,000 visit park relations from a csv file. Ensured no duplicate pkey in my python code.
\COPY visit_park(visitor_id, park_id, review) FROM './visit_park_no_index' WITH (FORMAT CSV);

INSERT INTO visit_flat (visitor_id, ride_id, flat_count, flat_rate)
VALUES
(10, 1, 8, 5),
(2, 18, 1, 3),
(8, 14, 21, 4),
(7, 7, 26, 1),
(9, 4, 6, 2),
(4, 3, 26, 2),
(8, 18, 9, 2),
(5, 20, 9, 4),
(4, 12, 9, 3),
(13, 12, 16, 5),
(12, 16, 28, 4),
(3, 4, 28, 1),
(9, 10, 5, 2),
(17, 12, 6, 3),
(11, 6, 21, 3),
(15, 3, 24, 4),
(2, 9, 22, 4),
(17, 10, 25, 4),
(7, 17, 10, 5),
(7, 1, 4, 1)
;

INSERT INTO food_stall (stall_name, stall_type, park_id)
VALUES
('Panda Express', 'Asian', 15),
('Burger King', 'American', 1),
('McDonalds', 'American', 14),
('Taco Bell', 'Mexican', 18),
('Wendys', 'American', 14),
('KFC', 'American', 3),
('Popeyes', 'American', 4),
('Dominos', 'Italian', 15),
('Pita Inn', 'Middle Eastern', 2),
('Gyros', 'Greek', 16),
('Dippin Dots', 'Ice Cream', 13),
('Sushi inc.', 'Asian', 8),
('Ramen inc.', 'Asian', 6),
('Chipotle', 'Mexican', 4),
('Qdoba', 'Mexican', 9),
('Jennys', 'Ice Cream', 8),
('Chick fil a', 'American', 17),
('BBQ', 'American', 8),
('Papa Johns', 'Italian', 13),
('Chinese Buffet', 'Asian', 13)
;

INSERT INTO dine (visitor_id, stall_id, money_spent)
VALUES
(13, 1, 97),
(15, 12, 37),
(9, 12, 55),
(20, 9, 22),
(5, 15, 26),
(7, 14, 39),
(1, 2, 87),
(8, 5, 32),
(7, 12, 70),
(9, 4, 31),
(2, 7, 34),
(20, 14, 93),
(7, 15, 60),
(18, 15, 37),
(3, 9, 90),
(13, 20, 98),
(17, 10, 59),
(15, 3, 35),
(9, 3, 39),
(14, 13, 64)
;