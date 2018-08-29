<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!-- Custom CSS goes below Bootstrap CSS -->
<link rel="stylesheet" href="/style.css" />
<title>Insert title here</title>
</head>
<body>
<h1>Welcome to the Task Organizer</h1> <br>
<p class="message">${ message }</p> <br>

<h3>New User? <button><a href="/register">Register</a></button></h3>
<br>
<h3>Returning User?<button><a href="/login">Log In</a></button></h3>
	<br>
	<c:if test="${ not empty user }">
		<p>Finished?<a href="/logout">Log Out</a></p>
	</c:if>
</body>
</html>