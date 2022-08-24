<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyle.css" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>TechBlog</title>
<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 89%, 43% 100%, 54% 79%, 0 100%, 0 0);
}
</style>
<meta charset="ISO-8859-1">
<title>Something Went Wrong</title>
</head>
<body>
	<div class="container text-center">
		<img src="Images/error_title.png" class="img-fluid">
		<h3 class="display-3">Sorry ! Something Went Wrong</h3>
		<%= exception %>
		<a class="btn primary-background btn-lg text-white mt-3" href="index.jsp">Home</a>

	</div>
</body>
</html>