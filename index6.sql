-- Create an index on visitor(visitor_name) as users of the database may want to often have a search on a specific
-- visitor to gain data about them. The users would not always have the specific visitor_id for each user of intereset, and
-- would not be able to advantage of the ordered visitor_id nature of the visitor relation.
CREATE INDEX idx_visitor_name ON visitor (visitor_name);

-- Create an index on roller_coaster(coaster_height) as I have used coaster_height in many of my past queries.
-- The list of coasters is not sorted by coaster_height, and therefore every query that relies on cetrain
-- values of the height will be expensive (search throughout the values).
-- Creating an index on coaster_height would speed up those queries significantly.
CREATE INDEX idx_coaster_height ON roller_coaster (coaster_height);