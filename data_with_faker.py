from faker import Faker
import random

# duplicate data may be generated (i.e. duplicate primary keys). In those cases, I fixed it manually.
# will update the script for very large datasets in the future.

def visitor_filler():
    faker = Faker()
    print('visitors:')
    for i in range (2,20):
        print(f'({i}, \'{faker.name()}\', {random.randint(30,90)}, \'{faker.date()}\'),')
    print('*-*-*-*-*-*-*-*-*-*')

def visit_coaster_filler():
    print('visit_coaster:')
    for _ in range(19):
        print(f'({random.randint(1,20)}, {random.randint(1,20)}, {random.randint(1,30)}, {random.randint(1,5)}),')
    print('*-*-*-*-*-*-*-*-*-*')

def food_stalls_filler():
    food_stalls_dict = {
        1: ('Panda Express', 'Asian'),
        2: ('Burger King', 'American'),
        3: ('McDonalds', 'American'),
        4: ('Taco Bell', 'Mexican'),
        5: ('Wendys', 'American'),
        6: ('KFC', 'American'),
        7: ('Popeyes', 'American'),
        8: ('Dominos', 'Italian'),
        9: ('Pita Inn', 'Middle Eastern'),
        10: ('Gyros', 'Greek'),
        11: ('Dippin Dots', 'Ice Cream'),
        12: ('Sushi inc.', 'Asian'),
        13: ('Ramen inc.', 'Asian'),
        14: ('Chipotle', 'Mexican'),
        15: ('Qdoba', 'Mexican'),
        16: ('Jennys', 'Ice Cream'),
        17: ('Chick-fil-a', 'American'),
        18: ('BBQ', 'American'),
        19: ('Papa Johns', 'Italian'),
        20: ('Chinese Buffet', 'Asian'),
    }
    
    print('food_stalls:')
    for key, value in food_stalls_dict.items():
        print(f'({key}, \'{value[0]}\', \'{value[1]}\', {random.randint(1,20)}),')
    print('*-*-*-*-*-*-*-*-*-*')

def dine_filler():
    print('dine:')
    for _ in range(20):
        print(f'({random.randint(1,20)}, {random.randint(1,20)}, {random.randint(20,100)}),')
    print('*-*-*-*-*-*-*-*-*-*')

def visit_park_filler():
    print('visit_park:')
    review_options = ['Bad', 'OK', 'GREAT!']
    for _ in range(20):
        print(f'({random.randint(1,20)}, {random.randint(1,20)}, \'{random.choice(review_options)}\'),')
    print('*-*-*-*-*-*-*-*-*-*')

def main():
    visit_coaster_filler()
    visitor_filler()
    food_stalls_filler()
    dine_filler()
    visit_park_filler()

if __name__ == '__main__':
    main()
