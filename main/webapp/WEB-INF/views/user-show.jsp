<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!-- Custom CSS goes below Bootstrap CSS -->
<link rel="stylesheet" href="/style.css" />
</head>
<body>
<main class="container">
		<h1>Task List Manager for ${ user.username }</h1>
		
		<div class="form-group row">
		    <label for="name" class="col-sm-2 col-form-label">Name</label>
		    <div class="col-sm-10 mt-2" id="name">${ user.username }</div>
		</div>
		<div class="form-group row">
		    <label for="bootcamp" class="col-sm-2 col-form-label">Bootcamp</label>
		    <div class="col-sm-10 mt-2" id="bootcamp">${ student.bootcamp.name }</div>
		</div>
		<a href="/students/${ student.id }/edit" class="btn btn-secondary">Edit</a>
		<a href="/students/${ student.id }/delete" class="btn btn-danger ml-2"
		   onclick="return confirm('Are you sure you want to delete this?')">Delete</a>
		<a href="/students" class="btn btn-link ml-2">Back</a>
		
		<h3 class="mt-4">Applications</h3>
		<table class="table">
			<thead>
				<tr>
					<th>Company</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="employer" items="${ student.applications }">
					<tr>
						<td><a href="/employers/${ employer.id }">${ employer.name }</a></td>
						<td><a href="/students/${student.id}/remove-application?employerId=${ employer.id }">Remove</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form class="form-inline" action="/users/${ user.id }/task-add">
		  <label class="sr-only" for="application-employer">Name</label>
			<select class="form-control mb-2 mr-sm-2" id="application-employer" name="employerId">
		    	<option value="">- Select Employer -</option>
		    	<c:forEach var="employer" items="${ employers }">
		    		<option value="${ employer.id }">${ employer.name }</option>
		    	</c:forEach>
		    </select>
		
		  <button type="submit" class="btn btn-primary mb-2">Add Task</button>
		</form>
		
		<form>
		
		</form>
		<p>Finished?<a href="/logout">Log Out</a></p>
	</main>

</body>
</html>