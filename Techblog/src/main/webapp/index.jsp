<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
</head>
<body>

	<%@include file="navbar.jsp"%>

	<!--  Banner -->

	<div class="container-fluid m-0 p-0 banner-background">
		<div class="bg-dark text-light">
			<div class="container">
				<div class="container-fluid py-5">
					<h1 class="display-7 fw-bold">Tech Blog</h1>
					<p class="col-md-8 fs-6">A programming language is any set of
						rules that converts strings, or graphical program elements in the
						case of visual programming languages, to various kinds of machine
						code output.</p>
					<button class="btn primary-background btn-lg text-white me-2"
						type="button">
						<span class="fa fa-external-link"></span> Start ! its Free
					</button>
					<a href="login.jsp"
						class="btn primary-background btn-lg text-white" type="button">
						<span class="fa fa-user-circle fa-spin"></span> Login
					</a>
				</div>
			</div>
		</div>
		<br>

	</div>



	<!-- Cards -->


	<div class="container">

		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card">
				
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>

			<div class="col-md-4">
				<div class="card">
				
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>


			<div class="col-md-4">
				<div class="card">
				
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>

		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="card">
				
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>

			<div class="col-md-4">
				<div class="card">
				
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>


			<div class="col-md-4">
				<div class="card">
				
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>

		</div>
	</div>

	<!-- JavaScript Bundle with Popper -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	

</body>
</html>