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
<title>Registration Page</title>
<style>
.radio1{
margin-right:4px;
}

 .radio2{
 margin-left:20px;
 margin-right:4px;
 }

</style>


<meta charset="ISO-8859-1">
<title>Register Page</title>
</head>
<body>
<%@include file="navbar.jsp" %>

	<main class="bg-dark" style="height:115vh">
		<div class="container py-5">
			<div class="col-md-5 offset-md-3">
				<div class="card">
					<div class="card-header text-center">
						<span class="fa fa-3x fa-user-circle"></span> <br> Register
						Here
					</div>
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="POST" enctype='multipart/form-data'>
						
						<div class="mb-3">
								<label for="user_name" class="form-label">User Name
									</label> <input name="user_name" type="text" class="form-control"
									id="user_name" aria-describedby="emailHelp" placeholder="Enter your name">
								 
							</div>
						
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your Email">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
						
						
						
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input name="user_pwd" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Enter your Password">
							</div>
							
							
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Select Your Gender</label><br>
								<input type="radio"
								class="radio1"	id="gender" name="gender" value="male">Male<span>   </span>
									<input type="radio" class="radio2"
									id="gender" name="gender" value="female">Female
							</div>
							
							
							
							<div class="mb-3 form-check">
								<input name="agree_tc" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms and Conditions</label>
									<br>
							</div>
							<div class="container text-center" id="loader" style="display:none">							
							<span class="fa fa-refresh fa-spin fa-3x" ></span>
							<h4>Please Wait.....</h4>
							</div>
							<br>
							<div class="container text-center">
							<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						</div>
						</form>

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
		<script src="js/myjs.js" type="text/javascript"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script>
		$(document).ready(function(){
			console.log("loaded.....");
			$('#reg-form').on('submit',function(event){
				
				event.preventDefault();
				let form=new FormData(this);
				$('#submit-btn').hide();
				$('#loader').show();
				//send to register Servlet
				$.ajax({
					url:"RegisterServlet",
					type:"POST",
					data:form,
					success:function(data,textStatus,jqXHR){
						
						$('#submit-btn').show();
						$('#loader').hide();
						if(data.trim()=='done'){
							swal("Registered Successfully..click ok to get Redirected to login page")
							.then((value) => {
							  window.location="login.jsp";
							});
						}else{
							swal(data);
						}
						
						
						
					},
					error:function(jqXHR,textStatus,errorThrown){
						$('#submit-btn').show();
						$('#loader').hide();
						
						swal("Something Went Wrong..try again")
						
					},
					processData:false,
					contentType:false
				});
			});
		});
	</script>
</body>
</html>