<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Edit Tasks</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!-- Custom CSS goes below Bootstrap CSS -->
<link rel="stylesheet" href="/style.css" />
</head>
<body>
<main class="container">
		<h1>Edit Task</h1>
		
		<!-- A form without an action submits back to the same URL, which is what we want here. -->
		<form method="post">
			<div class="form-group">
			    <label for="name">Task Name</label>
			    <input class="form-control" id="taskname" name="taskname" value="${ task.taskname }" required minlength="2" autocomplete="off">
			</div>
			<div class="form-group">
			    <label for="duedate">Due Date</label>
			    <input class="form-control" id="duedate" type="date" value="${ task.duedate }" name="duedate">
			</div>
			<button type="submit" class="btn btn-primary">Save</button>
			<a href="/tasks/${ task.id }" class="btn btn-link">Cancel</a>
		</form>
	</main>
</body>
</html>