% include('header.tpl')
<!-- Main content should go here-->
<h1>Success!</h1>
<h2>The coaster has been added to {{ visitor_name[0] }}'s records</h2>
<a href="/visitor_show_coasters/{{visitor_id}}.html" class="btn btn-primary btn-lg btn-block" role="button">See {{ visitor_name[0] }}'s page</a>
<a href="/visitor_add_coaster/{{visitor_id}}.html" class="btn btn-success btn-lg btn-block" role="button">Add more coasters to {{ visitor_name[0] }}'s record</a>
% include('footer.tpl')
