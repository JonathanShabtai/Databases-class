import pandas as pd
from faker import Faker
import random

faker = Faker()

"""
Create 10,000 visitors as visitors_no_index CSV file
Create 10,000 coasters as coasters_no_index CSV file
Create 60,000 visit park relations as visit_park_no_index CSV file
Create 60,000 visit coaster relations as visit_coaster_no_index CSV file
"""

# create 10,000 visitors
# by (visitor_name, visitor_height, visitor_date_of_birth)
visitors = []
for _ in range(10_000):
    visitors.append([faker.name(), random.randint(30, 90), faker.date()])

visitors_pd = pd.DataFrame(visitors)
visitors_pd.index += 1

visitors_pd.to_csv('visitors_no_index', index=None, header=None)

# create 10,000 coasters
# by (coaster_name, coaster_length, coaster_height, drop,
# 	speed, inversions, duration, coaster_type,
#   height_restriction, coaster_year_opened, coaster_year_closed, park_id, manuf_id)
coasters = []
for _ in range(10_000):
    coaster_name = (faker.words(random.randint(1, 3)))
    coaster_name = ' '.join(coaster_name)

    coaster_length = random.randint(100, 10_000)
    coaster_height = random.randint(10, 500)
    drop = random.randint(10, 500)
    speed = random.randint(10, 200)
    inversions = random.randint(0, 12)
    duration = random.randint(15, 300)
    coaster_type = random.choice(['wooden', 'steel'])
    height_restriction = random.randint(40, 54)
    coaster_year_opened = faker.date()
    coaster_closed_date = faker.date()
    # choose a close date larger than year opened
    while coaster_closed_date < coaster_year_opened:
        coaster_closed_date = faker.date()

    # only 1 in 5 parks will be closed, to ensure NULL on most
    coaster_year_closed = random.choice(['', '', '', '', coaster_closed_date])
    park_id = random.randint(1, 10_000)
    manuf_id = random.randint(1, 20)

    coasters.append([coaster_name, coaster_length,
                     coaster_height, drop, speed,
                     inversions, duration, coaster_type,
                     height_restriction, coaster_year_opened,
                     coaster_year_closed, park_id, manuf_id])

coasters_pd = pd.DataFrame(coasters)
coasters_pd.index += 1

coasters_pd.to_csv('coasters_no_index', index=None, header=None)

# create 10,000 amusement parks
# by (park_name, location_state, size_acres, park_year_opened, park_year_closed)
parks = []
for _ in range(10_000):
    park_name = (faker.words(random.randint(1, 4)))
    park_name = ' '.join(park_name)
    size_acres = random.randint(50, 2000)
    park_year_opened = faker.date()
    park_closed_date = faker.date()
    # choose a close date larger than year opened
    while park_closed_date < park_year_opened:
        park_closed_date = faker.date()

    # only 1 in 5 parks will be closed, to ensure NULL on most
    park_closed_date = random.choice(['', '', '', '', '', park_closed_date])

    parks.append([park_name, faker.state(), size_acres, park_year_opened, park_closed_date])

parks_pd = pd.DataFrame(parks)
parks_pd.index += 1

parks_pd.to_csv('parks_no_index', index=None, header=None)

# create 60,000 visit park relations
# by (visitor_id, park_id, review)
visit_park = []
visit_park_check = []  # prevent duplicated
for _ in range(60_000):
    visitor_id = random.randint(1, len(visitors))
    park_id = random.randint(1, len(parks))

    while [visitor_id, park_id] in visit_park_check:
        visitor_id = random.randint(1, len(visitors))
        park_id = random.randint(1, len(parks))
    visit_park_check.append([visitor_id, park_id])

    # (visitor_id, coaster_id, review)
    review = random.choice(['Bad', 'OK', 'GREAT!'])
    visit_park.append([visitor_id, park_id, review])

visit_park_pd = pd.DataFrame(visit_park)
visit_park_pd.index += 1
visit_park_pd.to_csv('visit_park_no_index', index=None, header=None)

# create 60,000 visit coaster relations
visit_coaster = []
visit_coaster_check = []  # prevent duplicated
for _ in range(60_000):
    visitor_id = random.randint(1, len(visitors))
    coaster_id = random.randint(1, len(coasters))

    while [visitor_id, coaster_id] in visit_coaster_check:
        visitor_id = random.randint(1, len(visitors))
        coaster_id = random.randint(1, len(coasters))
    visit_coaster_check.append([visitor_id, coaster_id])

    # (visitor_id, coaster_id, coaster_count, coaster_rate)
    visit_coaster.append([visitor_id, coaster_id, random.randint(1, 100), random.randint(1, 5)])

visit_coaster_pd = pd.DataFrame(visit_coaster)
visit_coaster_pd.index += 1
visit_coaster_pd.to_csv('visit_coaster_no_index', index=None, header=None)
