% include('header.tpl')
<!-- Main content should go here-->
<h1>{{ page_name }}</h1>
<p>Welcome to the visitor search page. Here you can look up a visitor by Name, or ID. You may fill out none, one, or both fields.
The site would issue an AND search based on your entries and would try to find the best match.
If you want to view all of the visitors in the database, just search without filling out the boxes.</p>

<!-- <form onsubmit="/{{visitor_id}}/{{visitor_name}}}.html"> -->
<form onsubmit="myFunction()">
  <div class="form-group row">
    <label for="visitor_id" class="col-sm-2 col-form-label">Visitor id</label>
    <div class="col-sm-10">
      <input id="visitor_id_field" type="number" min="1" step="1" class="form-control" name="visitor_id" placeholder="ID goes here">
    </div>
  </div>
  <div class="form-group row">
    <label for="visitor_name" class="col-sm-2 col-form-label">Visitor name *</label>
    <div class="col-sm-10">
      <input id="visitor_name_field"  type="text" class="form-control" name="visitor_name" placeholder="Name goes here">
    </div>
  </div>
  <button type="submit" class="btn btn-primary btn-lg btn-block">Search</button>
</form>

<a href="/new_visitor.html" class="btn btn-success btn-lg btn-block" role="button">Add a new visitor to the database</a>

<script>
function myFunction() {
  event.preventDefault()
  var visitor_id = document.getElementById("visitor_id_field").value;
  var visitor_name = document.getElementById("visitor_name_field").value;
  var form = this;
  if (visitor_id == ''){
  	visitor_id = 'blank';
  }
  if (visitor_name == ''){
  	visitor_name = 'blank';
  }
  window.location.href = ("/visitor_id=" + visitor_id + "/visitor_name=" + visitor_name + ".html");
  return false;
}
</script>

% include('footer.tpl')