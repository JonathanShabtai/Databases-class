# Final project
## Jonathan Shabtai - Roller Coaster Database :roller_coaster:

*You will need to tunnel into the PostgreSQL database on UChicago's campus, to run final.py and look at the database under http://localhost:53001 succesfully. Since my class is over, the database is not hosted any longer (doesn't exist anymore). However, all of my code from the project is available here*

Through my web app, you can view visitors (RelationX) - edit information, delete, and view/add visited roller coasters (RelationY).

Upon running the final.py script, the web app should be accessible through: [http://localhost:53001](http://localhost:53001)
On the first page, you will see search on visitor (RelationX).

**ID should be a positive integer (error checking here through bootstrap), and name chould be any string. Visitor name is a wildcard.**
**Adding new visitors to RelationX is available from the navbar, homepage, and visitor search page via a button**

### What to run
First, test putting my name and id: 1, Jonathan Shabtai.
Then, test leaving id blank and visitor name as 'J', utilizing the wildcard (I used ILIKE to keep this case-insensitive).
Also try to look for visitors just by ID, leaving the name blank (i.e. test putting id as '2' and name left blank).
If there are no results, a table with 'No results found!' will appear. Try putting an ID of 100 to see this.

You may fill out both fields, one, or none. **If you fill out none of the fields, the database will run a SELECT \* on the relation and display all of the visitors in the database.** This page also available through the navbar at the top - very useful for quickly looking at the whole table (however, limited to 20 results). The URL is /visitor_id=blank/visitor_name=blank.html

You can try to edit existing users, delete users, and add new ones. See below for error handling.

*Note that when viewing all visitors, there is a limit of 20. If you add a new visitor via the add visitor button, that new visitor won't be seen when viewing all, unless you directly search for it, or delete an existing user so there are less than 20 users in the database*

I used Javascript and bottle to have a dynamic URL built for the main searches. You will see this in the URL. If a field is not filled out, the URL will have a 'blank' in it and I apply the SQL search accordingly (see if cases under my do_search function). I used bootstrap for all the forms.

I used dynamic URLs for all appropriate pages, and built templates that use variables from the URLs. 

**Highlight: When editing a visitor's information, you will see that their previous information is automatically populated in the form, and after changing the information, the web app will direct you to a page to see what changes were applied for the specific visitor.**

### Adding coasters to visitors
After finding results for visitor search, use Show Coasters to view RelationY. For convenience, I added a button on that template so users can add coasters quickly, but you can access Visitor Add Coaster directly from RelationX page.

**Highlight: when adding a roller coaster to a visitor (visit_coaster is RealtionY).**
If the visitor never road the coaster, it would add it to RelationY. If the visitor road it before, it will update the coaster_count field (adding the number entered to the previous one that exists in the database), and also update the rating (*rating is selected with a dropdown menu*). **There is error checking here for a positive integer entered.**

### Error checking
I created an error_handle.tpl that shows the user the exact error for any mistakes when filling out the forms.

For the editing page, there is error checking for *visitor height* and *date of birth*. Height should be a positive integer, and DOB must be in a YYYY-MM-DD format.

**Highlight: when there is an error in the input, the web app will direct the user to a URL using error_handle.tpl, and will inform the user of the type of error**.
**Same error checking is applied on check inputs for RelationY**. Adding number of visits for a coaster that is not an integer greater than 0 will direct the user to the error handler page.