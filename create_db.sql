/* create all tables */
CREATE TABLE amusement_park(
park_id serial NOT NULL,
park_name varchar(100) NOT NULL,
location_state varchar(20),
size_acres int,
park_year_opened date NOT NULL,
park_year_closed date,
PRIMARY KEY (park_id)
);

CREATE TABLE manufacturer(
manuf_id serial NOT NULL,
manuf_name varchar(100),
manuf_country varchar(100),
owner varchar(100),
manuf_year_opened date,
manuf_year_closed date,
PRIMARY KEY (manuf_id)
);

CREATE TABLE visitor(
visitor_id serial NOT NULL,
visitor_name varchar(100) NOT NULL,
visitor_height int NOT NULL,
visitor_date_of_birth date,
PRIMARY KEY (visitor_id)
);

CREATE TABLE roller_coaster(
coaster_id serial NOT NULL,
coaster_name varchar(100) not null,
coaster_length real,
coaster_height real,
drop real,
speed real,
inversions int,
duration int,
coaster_type varchar(100),
height_restriction real NOT NULL,
coaster_year_opened date NOT NULL,
coaster_year_closed date,
park_id int,
manuf_id int,
PRIMARY KEY (coaster_id),
FOREIGN KEY (park_id) REFERENCES amusement_park ON DELETE CASCADE,
FOREIGN KEY (manuf_id) REFERENCES manufacturer ON DELETE CASCADE
);

CREATE TABLE food_stall(
stall_id serial NOT NULL,
stall_name varchar(100) NOT NULL,
stall_type varchar(100),
park_id int,
PRIMARY KEY (stall_id),
FOREIGN KEY (park_id) REFERENCES amusement_park ON DELETE CASCADE
);

CREATE TABLE flat_ride(
ride_id serial NOT NULL,
ride_name varchar(100) NOT NULL,
ride_type varchar(100),
ride_capacity int,
ride_thrill_level int /* [constraint: between 1-5] */,
park_id int, 
PRIMARY KEY (ride_id),
FOREIGN KEY (park_id) REFERENCES amusement_park ON DELETE CASCADE
);

CREATE TABLE visit_coaster(
visitor_id int,
coaster_id int,
coaster_count int,
coaster_rate int, /* [constraint: between 1-5] */
PRIMARY KEY (visitor_id, coaster_id),
FOREIGN KEY (visitor_id) REFERENCES visitor ON DELETE CASCADE,
FOREIGN KEY (coaster_id) REFERENCES roller_coaster ON DELETE CASCADE
);

CREATE TABLE dine(
visitor_id int,
stall_id int,
money_spent real,
PRIMARY KEY (visitor_id, stall_id),
FOREIGN KEY (visitor_id) REFERENCES visitor ON DELETE CASCADE,
FOREIGN KEY (stall_id) REFERENCES food_stall ON DELETE CASCADE
);

CREATE TABLE visit_flat(
visitor_id int,
ride_id int,
flat_count int,
flat_rate int, /* [constraint: between 1-5] */
PRIMARY KEY (visitor_id, ride_id),
FOREIGN KEY (visitor_id) REFERENCES visitor ON DELETE CASCADE,
FOREIGN KEY (ride_id) REFERENCES flat_ride ON DELETE CASCADE
);

CREATE TABLE visit_park(
visitor_id int,
park_id int,
review varchar(500), /* [constraint: 500 characters max] */
PRIMARY KEY (visitor_id, park_id),
FOREIGN KEY (visitor_id) REFERENCES visitor ON DELETE CASCADE,
FOREIGN KEY (park_id) REFERENCES amusement_park ON DELETE CASCADE
);

CREATE TABLE visitor_log(
visitor_log_id serial,
tstamp timestamp(0) DEFAULT now(),
operation text,
new_val text,
old_val text
);
