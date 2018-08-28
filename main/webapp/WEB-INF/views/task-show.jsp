<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Show Tasks</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!-- Custom CSS goes below Bootstrap CSS -->
<link rel="stylesheet" href="/style.css" />
</head>
<body>
<main class="container">
		<h1>Task: ${ task.taskname }</h1>
		
		<div class="form-group row">
		    <label for="taskname" class="col-sm-2 col-form-label">Task Name</label>
		    <div class="col-sm-10 mt-2" id="taskname">${ task.taskname }</div>
		</div>
		<div class="form-group row">
		    <label for="duedate" class="col-sm-2 col-form-label">Due Date</label>
		    <div class="col-sm-10 mt-2" id="duedate">${ task.duedate }</div>
		</div>
		<a href="/tasks/${ task.id }/edit" class="btn btn-secondary">Edit</a>
		<a href="/tasks/${ task.id }/delete" class="btn btn-danger ml-2"
		   onclick="return confirm('Are you sure you want to delete this?')">Delete</a>
		<a href="/tasks" class="btn btn-link ml-2">Back</a>
		
		<h3 class="mt-4">Users</h3>
		<table class="table">
			<thead>
				<tr>
					<th>User Name</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${ task.users }">
					<tr>
						<td><a href="/users/${ user.id }">${ user.name }</a></td>
						<td><a href="/tasks/${task.id}/remove-user?userId=${ user.id }">Remove</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
</body>
</html>