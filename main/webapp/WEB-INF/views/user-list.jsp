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
		<h1>List of Users Registered</h1>
		
		<table class="table">
			<thead>
				<tr>
					<th>Username</th><th>Email</th><th>Applications</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="student" items="${ students }">
					<tr>
						<td><a href="/students/${ student.id }">${ student.name }</a></td>
						<td>${ student.bootcamp.name }</td>
						<td>${ student.applications.size() }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<p>
			<a href="/users/add" class="btn btn-secondary">Add</a>
		</p>
	</main>
</body>
</html>