<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Tasks</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!-- Custom CSS goes below Bootstrap CSS -->
<link rel="stylesheet" href="/style.css" />
</head>
<body>
	<main class="container">
		<h1>Tasks</h1>	
			<table class="table">
				<thead>
					<tr>
						<th>Status</th><th>Name</th><th>Due Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="task" items="${ tasks }">
						<tr>
							<td><a href="/tasks/${ task.id }">${ task.complete }</a></td>
							<td>${ task.taskname }</td>
							<td>${ task.duedate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<p>
			<a href="/tasks/add" class="btn btn-secondary">Add</a>
		</p>
	</main>
</body>
</html>