% include('header.tpl')
<!-- Main content should go here-->
<h1>Success!</h1>
<h2>{{ visitor_info_new[1] }}'s has been added!</h2>
<h3> After update: </h3>
<table class="table table-striped table-bordered">
<tr>
  <th>visitor ID</th> <th>visitor name</th> <th> visitor Height </th> <th>Date of birth</th>
</tr>
<tr>
    %for entry in visitor_info_new:
      <td>{{ entry }}</td>
    %end
</tr>
</table>

<a href="/" class="btn btn-success btn-lg btn-block" role="button">Go back to the visitor search page</a>
%end
% include('footer.tpl')