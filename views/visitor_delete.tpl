% include('header.tpl')
<!-- Main content should go here-->
<h1>{{ page_name }}</h1>
<p> Are you sure you want to delete the following visitor from the database? </p>
<form action ="/visitor_delete/delete_result.html" method="post">
    visitor ID: <input name="visitor_id" type="number" value='{{results[0][0]}}' readonly/>
    visitor name: <input name="visitor_name" type="text" value='{{results[0][1]}}' readonly/>
    visitor Height: <input name="visitor_height" type="number" value='{{results[0][2]}}' readonly/>
    visitor Date of Birth: <input name="visitor_date_of_birth" type="text" value='{{ date }}' readonly/>
    <input class="btn btn-danger btn-lg" role="button" value="Delete" type="submit" />
</form>
<a href="/" class="btn btn-warning btn-lg btn-block" role="button">I actually don't want to delete! Go back to the visitor search page</a>
% include('footer.tpl')