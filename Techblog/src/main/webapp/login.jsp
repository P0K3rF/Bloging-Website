<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyle.css" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Login Page</title>
<style>
.banner-login {
	clip-path: polygon(100% 0, 90% 25%, 100% 50%, 90% 75%, 100% 100%, 0 100%, 10% 75%,
		0 50%, 10% 25%, 0 0);
}
</style>


<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<main class="d-flex align-items-center bg-dark" style="height: 93vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-plus fa-3x"></span> <br>
							<p>Login Here</p>
						</div>
						<%
					Message m=(Message)session.getAttribute("msg");
						if(m!=null){
							%>
							<div class="alert <%=m.getCssClass() %>" role="alert"> <%=m.getContent() %></div>
							<% 
							
						}
							session.removeAttribute("msg");
						
						%>
						<div class="card-body">
							<form id="login" action="LoginServlet" method="POST"
								enctype='multipart/form-data'>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input type="email" name="email" required
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input name="password" required type="password"
										class="form-control" id="exampleInputPassword1">
								</div>
								<div class="container text-center">
									<button type="submit" class="btn btn-primary">Log in</button>
								</div>
							</form>

						</div>

					</div>

				</div>

			</div>
		</div>

	</main>

	<!-- JavaScript Bundle with Popper -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- 	<script>
		
	$(document).ready(function(){
		
		console.log("loaded...");
	
	$('#login').on('submit',function(event){
		
		event.preventDefault();
		let form=new FormData(this);
		$.ajax({
			url:"LoginServlet",
			type:"POST",
			data:form,
			success:function(data,textStatus,jqXHR){
				console.log(data);
				if(data.trim()=='done'){
					window.location="profile.jsp";
				}else{
					swal(data);
				}
			},
		error:function(jqXHR,textStatus,errorThrown){
			swal(errorThrown);
		},
		processData:false,
		contentType:false
		});
	});
	});
		
		</script> -->

</body>
</html>