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
		<h1>Edit User</h1>
		<form method="post">
			<div class="form-group">
			    <label for="name">Name</label>
			    <input class="form-control" id="name" name="name" value="${ user.username }" required minlength="2" autocomplete="off">
			</div>
			<div class="form-group">
			    <label for="task">Task</label>
			    <select class="form-control" id="task" name="task">
			    	<option value="">- None -</option>
			    	<c:forEach var="task" items="${ tasks }">
			    		<option value="${ task.id }" ${ task.id eq user.task.id ? 'selected' : '' }>${ task.taskname }</option>
			    	</c:forEach>
			    </select>
			</div>
			<button type="submit" class="btn btn-primary">Save</button>
			<a href="/users/${ user.id }" class="btn btn-link">Cancel</a>
		</form>
	</main>
</body>
</html>