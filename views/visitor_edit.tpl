% include('header.tpl')
<!-- Main content should go here-->
<h1>{{ page_name }}</h1>
<h2>{{results[0][1]}}'s Records</h2>

<form action="/visitor_edit/update_result.html" method="post">
  <div class="form-group row">
    <label for="visitor_id" class="col-sm-2 col-form-label">visitor ID</label>
    <div class="col-sm-10">
      <input type="number" readonly class="form-control-plaintext" name="visitor_id" value="{{results[0][0]}}">
    </div>
  </div>
  <div class="form-group row">
    <label for="visitor_name" class="col-sm-2 col-form-label">Visitor name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="visitor_name" value="{{results[0][1]}}">
    </div>
  </div>
  <div class="form-group row">
    <label for="visitor_height" class="col-sm-2 col-form-label">Visitor height</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="visitor_height" value="{{results[0][2]}}">
    </div>
  </div>
  <div class="form-group row">
    <label for="visitor_date_of_birth" class="col-sm-2 col-form-label">Visitor date of birth</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="visitor_date_of_birth" value="{{date}}">
    </div>
  </div>
  <button type="submit" class="btn btn-success mb-2">Confirm changes</button>
</form>

% include('footer.tpl')