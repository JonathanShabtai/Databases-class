/* populate tables with 20 tuples each */
INSERT INTO amusement_park (park_name, location_state, size_acres, park_year_opened, park_year_closed)
VALUES
('Six Flags Great Adventure', 'NJ', 510, '1974-07-01', NULL),
('Cedar Point', 'OH', 364, '1870-01-01', NULL),
('Six Flags Great America', 'IL', 304, '1976-05-29', NULL),
('Six Flags Magic Mountain', 'CA', 262, '1971-05-29', NULL),
('Walt Disney World', 'FL', 1100, '1971-10-01', NULL),
('Bush Gardens', 'FL', 335, '1959-03-31', NULL),
('Coney Island', 'NY', 442, '1895-01-01', NULL),
('Peony Park', 'NB', 200, '1919-01-01', '1994-01-01'),
('Hersheypark', 'PA', 121, '1906-05-30', NULL),
('Kennywood', 'PA', 80, '1899-05-30', NULL),
('Six Flags Fiesta Texas', 'TX', 250, '1992-03-14', NULL),
('Six Flags New England', 'MA', 320, '1870-01-01', NULL),
('Six Flags New Orleans', 'LA', 150, '2005-08-22', NULL),
('Adventureland', 'NY', 12, '1962-01-01', NULL),
('ABC Land', 'WY', 96, '1930-02-21', '1992-05-11'),
('SeaWorld', 'FL', 200, '1973-01-01', NULL),
('Universal Orlando Resort', 'FL', 160, '1990-06-07', NULL),
('Leogland', 'FL', 140, '1968-06-07', NULL),
('Indiana Beach', 'IN', 376, '1926-01-01', '2020-01-01'),
('Silverwood', 'MN', 221, '1988-06-20', NULL)
;

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

INSERT INTO roller_coaster (coaster_name, coaster_length, coaster_height, drop,
	speed, inversions, duration, coaster_type, height_restriction, coaster_year_opened, coaster_year_closed, park_id, manuf_id)
VALUES
('Nitro', 5394, 230, 215, 80, 0, 140, 'Steel', 54, '2001-04-07', NULL, 1, 1),
('El Toro', 4400, 181, 176, 70, 0, 102, 'Wooden', 48, '2006-06-12', NULL, 1, 2),
('Space Mountain', 3196, 90, NULL, 27, 0, 135, 'Steel', 44, '1975-01-15', NULL, 5, 3),
('Top Thrill Dragster', 2800, 420, 400, 120, 0, 30, 'Steel', 52, '2003-05-04', NULL, 2, 2),
('Millennium Force', 6595, 310, 300, 93, 0, 140, 'Steel', 47, '2000-05-13', NULL, 2, 2),
('GateKeeper', 4164, 170, 164, 67, 6, 160, 'Steel', 52, '2013-05-11', NULL, 2, 1),
('American Eagle', 4650, 127, 147, 66, 0, 143, 'Wooden', 42, '1981-05-23', NULL, 3, 2),
('Tatsu', 3602, 170, 111, 62, 4, 120, 'Steel', 54, '2006-05-13', NULL, 5, 3),
('X2', 3610, 175, 215, 76, 2, 130, 'Steel', 48, '2002-01-12', NULL, 4, 4),
('Blue Streak', 2558, 78, 72, 40, 0, 102, 'Wooden', 42, '1964-05-23', NULL, 2, 5),
('Maverick', 4450, 105, 100, 70, 2, 150, 'Steel', 54, '2007-05-26', NULL, 2, 2),
('Raptor', 3790, 137, 119, 57, 6, 136, 'Steel', 54, '1994-07-05', NULL, 2, 1),
('Steel Vengeance', 5740, 205, 200, 74, 4, 150, 'Hybrid', 47, '2008-05-24', NULL, 2, 6),
('Valravn', 3415, 223, 214, 74, 3, 120, 'Steel', 54, '2016-05-07', NULL, 2, 1),
('Batman The Ride', 2700, 100, NULL, 50, 5, 120, 'Steel', 54, '1992-05-09', NULL, 3, 1),
('Goliath', 3100, 165, 180, 72, 2, 90, 'Hybrid', 52, '2014-06-19', NULL, 3, 6),
('Joker', 1019, 120, 54, 38, 0, 70, 'Steel', 48, '2017-05-27', NULL, 3, 7),
('X-Flight', 3000, NULL, NULL, 55, 5, 75, 'Steel', 52, '2012-05-16', NULL, 3, 1),
('Deja Vu', 1204, 191.6, 177, 65.6, 3, 92, 'Steel', 48, '2001-10-07', '2007-10-28', 3, 8),
('Galaxy Orbit', NULL, NULL, NULL, NULL, 0, 85, 'Steel', 54, '1972-01-01', '1993-01-01', 8, 9)
;

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

INSERT INTO visitor (visitor_name, visitor_height, visitor_date_of_birth)
VALUES
('Jonathan Shabtai', 67, '1990-02-23'),
('Nathan Ray', 30, '1976-08-13'),
('Michael Hall', 89, '1986-04-11'),
('Corey Graham', 70, '2007-05-05'),
('Paula Carter', 31, '1980-12-28'),
('Mary Davis', 63, '2015-09-13'),
('Hunter Smith', 43, '2003-05-19'),
('Keith Cole', 79, '2017-11-20'),
('Richard Harris', 71, '1980-07-25'),
('Jeffrey Hawkins', 71, '2007-12-14'),
('Philip Avila', 54, '1981-08-12'),
('Hannah Stanley', 85, '1991-03-19'),
('Reginald Vargas', 88, '1976-04-21'),
('Damon Moss', 37, '1999-07-18'),
('Devin Dean', 68, '1984-04-04'),
('Michelle Thomas', 55, '1990-02-07'),
('Karen Lopez', 80, '2011-08-09'),
('Laura Buck', 64, '1978-05-15'),
('Jeremy Lang', 75, '2014-01-16'),
('Cam Buck', 40, '1993-07-02')
;

INSERT INTO visit_coaster (visitor_id, coaster_id, coaster_count, coaster_rate)
VALUES
(20, 1, 21, 2),
(7, 4, 24, 1),
(2, 15, 23, 2),
(11, 7, 18, 5),
(20, 2, 26, 3),
(5, 19, 19, 3),
(9, 14, 27, 3),
(6, 12, 3, 2),
(9, 5, 13, 5),
(17, 5, 17, 4),
(12, 10, 10, 4),
(10, 16, 26, 4),
(6, 15, 3, 5),
(16, 7, 26, 5),
(4, 16, 26, 4),
(9, 15, 24, 2),
(14, 6, 25, 2),
(16, 14, 6, 2),
(2, 16, 30, 5),
(2, 12, 1, 2),
(1, 2, 10, 5),
(1, 5, 21, 3),
(1, 13, 2, 1),
(3, 2, 1, 1),
(5, 18, 32, 4),
(7, 10, 20, 2),
(10, 1, 3, 4),
(12, 11, 22, 3),
(15, 2, 4, 2),
(18, 2, 9, 1),
(18, 4, 6, 1),
(19, 17, 28, 5)
;

INSERT INTO visit_park (visitor_id, park_id, review)
VALUES
(1, 1, 'GREAT!'),
(1, 3, 'OK'),
(1, 5, 'Bad'),
(4, 6, 'GREAT!'),
(6, 15, 'Bad'),
(2, 8, 'GREAT!'),
(12, 6, 'Bad'),
(19, 18, 'OK'),
(16, 4, 'OK'),
(19, 10, 'Bad'),
(18, 20, 'GREAT!'),
(9, 6, 'GREAT!'),
(14, 3, 'OK'),
(2, 13, 'OK'),
(2, 10, 'Bad'),
(2, 9, 'Bad'),
(13, 10, 'GREAT!'),
(11, 13, 'Bad'),
(9, 4, 'GREAT!'),
(4, 18, 'Bad'),
(20, 11, 'OK'),
(19, 6, 'Bad'),
(18, 10, 'Bad'),
(12, 17, 'GREAT!'),
(7, 2, 'Bad'),
(3, 1, 'GREAT!'),
(3, 5, 'GREAT!'),
(3, 10, 'GREAT!'),
(3, 9, 'Bad')
;

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