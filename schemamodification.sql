-- schemamodifications queries
-- one of each type - ADD column, ALTER column, DROP column

-- (ADD column) Add a favorite coaster column for each visitor (ADD column)
ALTER TABLE visitor
ADD favorite_coaster varchar(100);

-- (ALTER column) Change the newly made columns name from favorite_coaster to fav_coaster
ALTER TABLE visitor
RENAME column favorite_coaster to fav_coaster;

-- (DROP column) Drop the newly made column of fav_coaster
ALTER TABLE visitor
DROP column fav_coaster;