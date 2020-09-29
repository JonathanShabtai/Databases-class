from bottle import Bottle, post, get, HTTPResponse, request, response, template, route
import bottle
import os
import sys
import psycopg2 as pg
import logging
import argparse

from datetime import datetime


#The logging level to control what messages are shown (skipping debug)
logging.basicConfig(level=logging.INFO)

#Our bottle app, using the default. We can store variables in app
app = bottle.default_app()

@get('/index.html')
def index():
    # Use a template to get the HTML to return. This template needs variables page_name (also for header.tpl) and  body 
    return template('main', page_name='index', body='Welcome to the roller coaster database! Use the navbar above!')

@route('/')
def search():
    return template('visitor', page_name='Visitor Search', visitor_id=1, visitor_name='Jonathan Shabtai')

# handle the search function
@route('/visitor_id=<visitor_id>/visitor_name=<visitor_name>.html')
def do_search(visitor_id=1, visitor_name='Jonathan Shabtai'):
    # deal with blank entry so it works in SQL
    if visitor_id == 'blank':
        visitor_id = ''
    if visitor_name == 'blank':
        visitor_name = ''

    visitor_name = '%' + visitor_name + '%'  # apply % for wildcard usage
    cur = app.db_connection.cursor()

    # input checking to verify what to search on
    if visitor_id != '' and visitor_name != '':
        query = ('SELECT * FROM visitor WHERE (visitor_name ILIKE %s AND visitor_id=%s) ORDER BY visitor_id LIMIT 20', (visitor_name, visitor_id))
    elif visitor_name != '' and visitor_id == '':
        query = ('SELECT * FROM visitor WHERE visitor_name ILIKE %s ORDER BY visitor_id LIMIT 20', (visitor_name,))
    elif visitor_name == '' and visitor_id != '':
        query = ('SELECT * FROM visitor WHERE visitor_id=%s ORDER BY visitor_id LIMIT 20', (visitor_id,))
    else:
        query = ('SELECT * FROM visitor ORDER BY visitor_id LIMIT 20', ())

    cur.execute(query[0], query[1])
    query_results = cur.fetchall()
    cur.close()
    return template('query_results', page_name='Visitor Search', results=query_results)

@route('/new_visitor.html')
def add_visitor():
    return template('add_visitor', page_name='Add New Visitor')

@route('/new_visitor/update_result.html', method='POST')
def do_add_visitor():
    visitor_name_input = request.forms.get('visitor_name')
    visitor_height_input = request.forms.get('visitor_height')
    visitor_date_of_birth_input = request.forms.get('visitor_date_of_birth')
    cur = app.db_connection.cursor()

    # Error checking:
    # Check date's format for date of birth
    try:
        datetime.strptime(str(visitor_date_of_birth_input), '%Y-%m-%d')
    except ValueError:
        cur.close()
        return template('error_handle', page_name='bad date', body='Date should be inputed at YYYY-MM-DD')

    # Check height is a positive integer
    try:
        value = int(visitor_height_input)
        if value <= 0:
            cur.close()
            return template('error_handle', page_name='bad height', body='Height should be a positive integer!')
    except ValueError:
        cur.close()
        return template('error_handle', page_name='bad height', body='Height should be a positive integer!')

    cur.execute('INSERT INTO visitor (visitor_name, visitor_height, visitor_date_of_birth) VALUES (%s, %s, %s)', (visitor_name_input, visitor_height_input, visitor_date_of_birth_input,))
    app.db_connection.commit()
    cur.close()

    cur = app.db_connection.cursor()
    cur.execute('SELECT visitor_id FROM visitor WHERE visitor_name = %s AND visitor_height = %s AND visitor_date_of_birth = %s', (visitor_name_input, visitor_height_input, visitor_date_of_birth_input,))
    visitor_id = cur.fetchall()
    cur.close()

    visitor_info_new = [visitor_id[0][0], visitor_name_input, visitor_height_input, visitor_date_of_birth_input]

    return template('confirm_add_visitor', page_name='Confirm Add Visitor', visitor_info_new=visitor_info_new)


# create a dynamic page with visitor_id for edits
@route('/visitor_edit/<visitor_id>.html')
def edit_visitor_info(visitor_id=1):
    cur = app.db_connection.cursor()
    cur.execute('SELECT * FROM visitor WHERE visitor_id=%s', (visitor_id, ))
    query_results = cur.fetchall()
    cur.close()
    # convert datetime object to a string
    date_str = str(query_results[0][3].strftime("%Y-%m-%d"))
    return template('visitor_edit', page_name='Visitor Edit', results=query_results, date=date_str)

@route('/visitor_edit/update_result.html', method='POST')
def do_edit_visitor_info(visitor_id=1):
    visitor_id_input = request.forms.get('visitor_id')
    visitor_name_input = request.forms.get('visitor_name')
    visitor_height_input = request.forms.get('visitor_height')
    visitor_date_of_birth_input = request.forms.get('visitor_date_of_birth')
    visitor_info_new = [visitor_id_input, visitor_name_input, visitor_height_input, visitor_date_of_birth_input]
    cur = app.db_connection.cursor()
    cur.execute('SELECT * FROM visitor WHERE visitor_id=%s', (visitor_id_input,))
    query_results = cur.fetchall()
    visitor_id_original = visitor_id_input
    visitor_name_original = query_results[0][1]
    visitor_height_original = query_results[0][2]
    visitor_date_of_birth_original = query_results[0][3]

    # Error checking:
    # Check date's format for date of birth
    try:
        datetime.strptime(str(visitor_date_of_birth_input), '%Y-%m-%d')
    except ValueError:
        cur.close()
        return template('error_handle', page_name='Bad Date', body='Date should be inputed at YYYY-MM-DD')

    # Check height is a positive integer
    try:
        value = int(visitor_height_input)
        if value <= 0:
            cur.close()
            return template('error_handle', page_name='Bad Height', body='Height should be a positive integer!')
    except ValueError:
        cur.close()
        return template('error_handle', page_name='Bad Height', body='Height should be a positive integer!')

    visitor_info_original = [visitor_id_original, visitor_name_original, visitor_height_original, str(visitor_date_of_birth_original.strftime("%Y-%m-%d"))]
    cur.execute('UPDATE visitor SET visitor_name = %s WHERE visitor_name = %s', (visitor_name_input, visitor_name_original,))
    cur.execute('UPDATE visitor SET visitor_height = %s WHERE visitor_name = %s', (visitor_height_input, visitor_name_original,))
    cur.execute('UPDATE visitor SET visitor_date_of_birth = %s WHERE visitor_name = %s', (visitor_date_of_birth_input, visitor_name_original,))
    app.db_connection.commit()
    cur.close()
    return template('confirm_change_edit', page_name='Edit Visitor Info', visitor_info_original=visitor_info_original, visitor_info_new=visitor_info_new)

@route('/visitor_delete/<visitor_id>.html')
def delete_visitor(visitor_id=1):
    cur = app.db_connection.cursor()
    cur.execute('SELECT * FROM visitor WHERE visitor_id=%s', (visitor_id, ))
    query_results = cur.fetchall()
    cur.close()
    # convert datetime object to a string
    date_str = str(query_results[0][3].strftime("%Y-%m-%d"))
    return template('visitor_delete', page_name='Visitor Delete', results=query_results, date=date_str)

@route('/visitor_delete/delete_result.html', method='POST')
def do_delete_visitor(visitor_id=1):
    visitor_id_input = request.forms.get('visitor_id')
    visitor_name_input = request.forms.get('visitor_name')
    visitor_height_input = request.forms.get('visitor_height')
    visitor_date_of_birth_input = request.forms.get('visitor_date_of_birth')
    cur = app.db_connection.cursor()
    cur.execute('SELECT * FROM visitor WHERE visitor_id=%s', (visitor_id_input,))
    query_results = cur.fetchall()
    visitor_id_original = visitor_id_input  # will be used for the template
    visitor_name_original = query_results[0][1]  # will be used for the template
    visitor_height_original = query_results[0][2]
    visitor_date_of_birth_original = query_results[0][3]
    cur.execute('DELETE FROM visitor WHERE visitor_id = %s', (visitor_id_original,))
    app.db_connection.commit()
    cur.close()
    return template('main', page_name='Deleted!', body=f'The user: ID: {visitor_id_original}, Name: {visitor_name_original}, was deleted.')    

@route('/visitor_show_coasters/<visitor_id>.html')
def show_visitor_coaster(visitor_id=1):
    cur = app.db_connection.cursor()
    cur.execute('SELECT visitor_name FROM visitor WHERE visitor_id = %s', (visitor_id, ))
    visitor_name = cur.fetchall()
    cur.close()

    # if you fill out a url for a visitor_id that does not exist in the database
    if visitor_name == []:
        return template('error_handle', page_name='Bad id', body='The requested visitor id is not in the database!')
    
    cur = app.db_connection.cursor()
    cur.execute('SELECT visitor_name, coaster_id, coaster_name, coaster_count, coaster_rate FROM visitor NATURAL JOIN roller_coaster NATURAL JOIN visit_coaster WHERE visitor_id=%s ORDER BY coaster_id', (visitor_id, ))
    query_results = cur.fetchall()
    cur.close()

    return template('visitor_coaster', page_name='Visitor Coaster', visitor_id=visitor_id, visitor_name=visitor_name[0][0], results=query_results)

@route('/visitor_add_coaster/<visitor_id>.html')
def add_visitor_coaster(visitor_id=1):
    cur = app.db_connection.cursor()
    cur.execute('SELECT visitor_name FROM visitor WHERE visitor_id = %s', (visitor_id, ))
    visitor_name = cur.fetchall()
    cur.close()

    cur = app.db_connection.cursor()
    cur.execute('SELECT coaster_id, coaster_name FROM roller_coaster')
    query_results = cur.fetchall()
    cur.close()
    return template('visitor_add_coaster', page_name='Visitor Add Coaster', visitor_id=visitor_id, visitor_name=visitor_name[0][0], results=query_results)

@route('/visitor_add_coaster/<visitor_id>/<coaster_id>.html', method='POST')
def do_add_visitor_coaster(visitor_id=1, coaster_id=1):
    coaster_count = request.forms.get('coaster_count')
    coaster_rating = request.forms.get('coaster_rating')
    cur = app.db_connection.cursor()
    cur.execute('SELECT coaster_count, coaster_rate FROM visitor NATURAL JOIN roller_coaster NATURAL JOIN visit_coaster WHERE visitor_id=%s AND coaster_id=%s', (visitor_id, coaster_id,))
    query_results = cur.fetchall()

    # Error catching
    # coaster_count needs to be a positive integer
    try:
        value = int(coaster_count)
        if value <= 0:
            cur.close()
            return template('error_handle', page_name='Bad Coaster Count', body='Coaster count should be a positive integer!')
    except ValueError:
        cur.close()
        return template('error_handle', page_name='Bad Coaster Count', body='Coaster count should be a positive integer!')

    # check whether relation exists
    # if there are results, update instead of insert
    if query_results:
        new_coaster_count = int(query_results[0][0]) + int(coaster_count)
        new_coaster_rating = int(coaster_rating)
        cur.execute('UPDATE visit_coaster SET coaster_count = %s, coaster_rate = %s WHERE (visitor_id=%s AND coaster_id=%s)', (new_coaster_count, new_coaster_rating, visitor_id, coaster_id))
        # UPDATE visit_coaster SET coaster_count = 100, coaster_rate = 5 WHERE (visitor_id=1 AND coaster_id=1)
    # if relation does not exist yet
    elif not(query_results):
        cur.execute('INSERT INTO visit_coaster (visitor_id, coaster_id, coaster_count, coaster_rate) VALUES (%s, %s, %s, %s)', (visitor_id, coaster_id, coaster_count, coaster_rating,))
        app.db_connection.commit()
    cur.close()

    cur = app.db_connection.cursor()
    cur.execute('SELECT visitor_name FROM visitor WHERE visitor_id=%s', (visitor_id,))
    query_results = cur.fetchall()
    visitor_name = query_results[0]
    cur.close()
    return template('confirm_add_coaster', page_name='Visitor Add Coaster', visitor_name=visitor_name, visitor_id=visitor_id)

#The main function to start the server
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-c","--config",
        help="The path to the .conf configuration file.",
        default="server.conf"
    )
    parser.add_argument(
        "--host",
        help="Server hostname (default localhost)",
        default="localhost"
    )
    parser.add_argument(
        "-p","--port",
        help="Server port (default 53001)",
        default=53001,
        type=int
    )
    parser.add_argument(
        "--nodb",
        help="Disable DB connection on startup",
        action="store_true"
    )

    #Get the arguments
    args = parser.parse_args()
    if not os.path.isfile(args.config):
        logging.error("The file \"{}\" does not exist!".format(args.config))
        sys.exit(1)

    app.config.load_config(args.config)

    # Below is how to connect to a database. We put a connection in the default bottle application, app
    if not args.nodb:
        try:
            app.db_connection = pg.connect(
                dbname = app.config['db.dbname'],
                user = app.config['db.user'],
                password = app.config.get('db.password'),
                host = app.config['db.host'],
                port = app.config['db.port']
            )
        except KeyError as e:
            logging.error("Is your configuration file ({})".format(args.config) +
                        " missing options?")
            raise

    try:
        logging.info("Starting Bottle Web Server")
        app.run(host=args.host, port=args.port, debug=True)
    finally:
        #Ensure that the connection opened is closed 
        if not args.nodb:
            app.db_connection.close()
