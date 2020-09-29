% include('header.tpl')
<!-- Main content should go here-->
<h1>{{ page_name }}</h1>
<h2>Fill out the records for a new visitor</h2>

<form action="/new_visitor/update_result.html" method="post">
  <div class="form-group row">
    <label for="visitor_name" class="col-sm-2 col-form-label">Visitor name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="visitor_name" placeholder="Enter a name">
    </div>
  </div>
  <div class="form-group row">
    <label for="visitor_height" class="col-sm-2 col-form-label">Visitor height</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="visitor_height" placeholder="Enter a positive integer. We will check for errors!">
    </div>
  </div>
  <div class="form-group row">
    <label for="visitor_date_of_birth" class="col-sm-2 col-form-label">Visitor date of birth</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="visitor_date_of_birth" placeholder="YYYY-MM-DD format, we will check for errors!">
    </div>
  </div>
  <button type="submit" class="btn btn-success mb-2">Add</button>
</form>
% include('footer.tpl')