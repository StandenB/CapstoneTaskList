<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="/">Home</a><br>
<main class="container">
		<h1>Add New User</h1> <br>
		<h3>Please enter the following to create your account</h3><br>
		<!-- A form without an action submits back to the same URL, which is what we want here. -->
		<form method="post">
			<div class="form-group">
			    <label for="username">Name</label>
			    <input class="form-control" id="username" name="username" required minlength="2" autocomplete="off">
			</div>
			<div class="form-group">
			    <label for="email">Email</label>
			    <input class="form-control" type="email" id="email" name="email">
			</div>
			<div class="form-group">
			    <label for="password">Password</label>
			    <input class="form-control" placeholder="min length 8 characters" type="password" id="password" name="password" required minlength="8" autocomplete="off">    	
			</div>
			<button type="submit" class="btn btn-primary">Join</button>
			<a href="/" class="btn btn-link">Cancel</a>
		</form>
	</main>
</body>
</html>