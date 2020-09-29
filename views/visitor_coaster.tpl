% include('header.tpl')
<!-- Main content should go here-->
<h1>{{ page_name }}</h1>
<h2>Results for {{ visitor_name }}</h2>
<table class="table table-striped table-bordered">
  %if len(results) == 0:
    <tr>
      <td>No results found! The visitor did not ride a single coaster!</td>
    </tr>
  %else:
    <tr>
      <td>Coaster ID</td> <td>Coaster Name</td> <td>Coaster Count</td> <td>Rating by user</td>
    </tr>
    %for entry in results:
      <tr>
      <!-- skip first entry (the visitor_name) -->
      %for value in entry[1:]:
        <td>{{ value }}</td>
      %end
      </tr>
    %end
  %end
</table>
<a href="/visitor_add_coaster/{{visitor_id}}.html" class="btn btn-success btn-lg btn-block" role="button">Add coasters to {{ visitor_name }}'s record</a>
<a href="/" class="btn btn-primary btn-lg btn-block" role="button">Go back to home page</a>
% include('footer.tpl')