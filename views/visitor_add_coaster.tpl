% include('header.tpl')
<!-- Main content should go here-->
<h1>{{ page_name }}</h1>
<h2>Choose coasters to add to {{visitor_name}}'s record</h2>
<table class="table table-striped table-bordered">
  %if len(results) == 0:
    <tr>
      <td>No results found!</td>
    </tr>
  %else:
    <tr>
      <td>Coaster ID</td> <td>Coaster Name</td> <td>Number of visits to add, and Rating</td>
    </tr>
    %for entry in results:
      <tr>
      %for value in entry:
        <td>{{ value }}</td>
      %end
      <td>
        <form action="/visitor_add_coaster/{{visitor_id}}/{{entry[0]}}.html" method="post">
          <div class="form-row">
            <div class="col">
              <label for="inputCount">Number of visits to add:</label>
              <input id="inputCount" name="coaster_count" type="number">
            </div>
            <div class="col">
              <label for="inputRating">Select rating:</label>
              <select id="inputRating" class="form-control" name="coaster_rating">
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
              </select>
            </div>
            <div class="col">
              <button type="submit" class="btn btn-success mb-2">Add</button>
            </div>
          </div>
        </form>
      </td>
      </tr>
    %end
  %end
</table>

% include('footer.tpl')