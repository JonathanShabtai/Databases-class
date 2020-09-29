% include('header.tpl')
<!-- Main content should go here-->
<h1>{{ page_name }}</h1>
<form action ="/visitor" method="post">
    visitor name: <input name="visitor_name" type="text" />
    visitor ID: <input name="visitor_id" type="number" />
    visitor Height: <input name="visitor_height" type="number" />
    visitor Date of Birth: <input name="visitor_date_of_birth" type="number" />
    <input value="Search" type="submit" />
</form>  
% include('footer.tpl')