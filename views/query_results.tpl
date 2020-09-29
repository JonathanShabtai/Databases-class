% include('header.tpl')
<!-- Main content should go here-->
<h1>{{ page_name }}</h1>
<table class="table table-striped table-bordered">
  %if len(results) == 0:
    <tr>
      <td>No results found!</td>
    </tr>
  %else:
    <tr>
      <th>visitor ID</th> <th>visitor name</th> <th> visitor Height </th> <th>Date of birth</th> <th colspan="4" class="text-center">Options</th>
    </tr>
    %for entry in results:
      <tr>
      %for value in entry:
        <td>{{ value }}</td>
      %end
      <td> <a href="/visitor_edit/{{entry[0]}}.html">View / Edit</a></td>
      <td> <a href="/visitor_delete/{{entry[0]}}.html">Delete</a></td>
      <td> <a href="/visitor_show_coasters/{{entry[0]}}.html">Show Coasters</a></td>
      <td> <a href="/visitor_add_coaster/{{entry[0]}}.html">Add New Coasters</a> </td>
      </tr>
    %end
  %end
</table>
<a href="/" class="btn btn-primary btn-lg btn-block" role="button">Go back to the visitor search page</a>
<a href="/new_visitor.html" class="btn btn-success btn-lg btn-block" role="button">Add a new visitor to the database</a>
% include('footer.tpl')