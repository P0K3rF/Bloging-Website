<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="javax.swing.text.html.HTML"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User user = (User) session.getAttribute("currentuser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao postDao = new PostDao(ConnectionProvider.getConn());
Post p = postDao.getPostPostById(postId);
%>

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
<style>
#more {
	display: none;
}

#myBtn:hover {
	cursor: pointer;
}

.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-size: 20px;
}

.post-date {
	font-style: italic;
	font-weight: bold;
}

.post-user-info {
	font-size: 20px;
}

.row-user {
	border: 1px solid #e2e2e2;
	padding-top: 15px;
}
</style>



<meta charset="ISO-8859-1">
<title><%=p.getpTitle()%> || Techblog</title>
</head>
<body>
	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v14.0"
		nonce="r9V9Tbqo"></script>

	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><span class="fa fa-book"></span>
				Tech Blog</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="profile.jsp">Home</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Categories </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Programming
									Language</a></li>
							<li><a class="dropdown-item" href="#">Data Structures</a></li>
							<li><a class="dropdown-item" href="#">System Design</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#">Contact
							us</a></li>
					<li class="nav-item"><a class="nav-link active" href="#"
						data-bs-toggle="modal" data-bs-target="#add-post-modal"><span
							class="fa fa-cloud-upload"></span> Add Post</a></li>


				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item"><a class="nav-link active " href="#!"
						data-bs-toggle="modal" data-bs-target="#profile-modal"><span
							class="fa fa-user-circle"></span> <%=user.getName()%></a></li>
					<li class="nav-item"><a class="nav-link active "
						href="LogoutServlet"><span class="fa fa-user-plus"></span>
							Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<!-- Main content of the body -->

	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header">

						<h4 class="post-title my-3"><%=p.getpTitle()%></h4>
					</div>
					<div class="card-body">
						<div class="container text-center">
							<img src="blog_pics/<%=p.getpPic()%>" class="card-img-top my-2"
								alt="...">
						</div>
						<div class="row my-3 row-user">
							<div class="col-md-8">
								<p class="post-user-info">
									<a href="#"> <%
 User us = postDao.getUserByUserId(p.getUserId());
 %> <%=us.getName()%></a> has posted this
								</p>
							</div>

							<div class="col-md-4">
								<p class="post-date"><%=DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
							</div>
						</div>
						<div class="post-content">
							<%
							String s = p.getpContent();
							if (s.length() > 200) {
								String s1 = s.substring(0, 200);
								String s2 = s.substring(200, s.length());
							%>

							<p><%=s1%><span id="dots">...</span><span id="more"><%=s2%>
								</span><a onclick="myFunction()" id="myBtn" style="color: blue">
									(Read more) </a>
							</p>

							<%
							} else {
							%>
							<%=s%>
							<%
							}
							%>
						</div>
						<br> <br>
						<%
						String conv1 = p.getpCode().replaceAll("<", "&lt;");
						String conv2 = conv1.replaceAll(">", "&gt;");
						%>
						<pre><%=conv2%></pre>
					</div>
					<div class="card-footer primary-background py-2">
						<a onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)"
							class="btn btn-outline-light btn-lg"> <i
							class="fa fa-thumbs-o-up"></i><span class="like-counter">
								<%
								LikeDao ld = new LikeDao(ConnectionProvider.getConn());
								%><%=ld.countLikeOnPost(p.getPid())%></span></a> <a
							class="btn btn-outline-light btn-lg"><i
							class="fa fa-commenting-o"></i><span class="fb-comments-count"
							data-href="http://127.0.0.1/profile.html?post_id=<%=p.getPid()%>"></span></a>
					</div>
					<div class="card-footer">

						<div class="fb-comments"
							data-href="http://127.0.0.1/profile.html?post_id=<%=p.getPid()%>"
							data-width="" data-numposts="5"></div>

					</div>

					<br>

				</div>


			</div>

		</div>

	</div>


	<!-- profile model -->
	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<div id="profile-detail">
							<img src="profile_pics/<%=user.getProfile()%>" class="img-fluid"
								style="border-radius: 50%; height: 155px; width: 150px" /> <br>
							<h5 class="modal-title mt-2" id="exampleModalLabel"><%=user.getName()%></h5>
							<!-- deatils in table -->
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Name :</th>
										<td><%=user.getName()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td colspan="2"><%=user.getGender()%></td>

									</tr>
								</tbody>
							</table>
						</div>

						<!-- profile edit -->
						<div id="profile-edit" style="display: none;">
							<form action="EditServlet" method="POST"
								enctype="multipart/form-data">
								<img src="profile_pics/<%=user.getProfile()%>" id="output"
									class="img-fluid"
									style="border-radius: 50%; height: 155px; width: 150px" /><br>
								<label id="1st" class="btn custom-input-btn" style="color: blue"
									onchange="changepro(event)"> <input type="file"
									name="profile_pic" style="display: none" multiple> <i
									class="fa fa-pencil-square-o" style="color: blue"></i> Change
									Profile Pic
								</label>
								<table class="table">
									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control"
											name="user_name" value=<%=user.getName()%>></td>
									</tr>

									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control"
											name="user_email" value=<%=user.getEmail()%>></td>
									</tr>

									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control"
											name="user_pwd" value=<%=user.getPassword()%>></td>
									</tr>

								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save
										Changes</button>
								</div>

							</form>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!--End of profile modal-->






	<!--  Add post modal -->

	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Post</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="add_Post_form" action="AddPostServlet" method="POST"
						enctype="multipart/form-data">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Option---</option>
								<%
								PostDao postdao = new PostDao(ConnectionProvider.getConn());
								ArrayList<Categories> ar = postdao.getAllCategories();
								for (Categories c : ar) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>

								<%
								}
								%>
							</select>


						</div>
						<br>
						<div class="form-group">
							<input name="post_title" type="text"
								placeholder="Enter Post Title" class="form-control">
						</div>
						<br>
						<div class="form-group">
							<textarea name="post_content" placeholder="Enter Content here"
								class="form-control" style="height: 200px"></textarea>
						</div>
						<br>
						<div class="form-group">
							<textarea name="post_code" placeholder="Enter code here"
								class="form-control" style="height: 200px"></textarea>
						</div>
						<br>
						<div class="form-group">

							<label id="1st" class="btn custom-input-btn" style="color: blue">
								<i class="fa fa-cloud-upload" style="color: blue"></i> <input
								type="file" name="profile_pic" multiple>
							</label>

						</div>
						<br>
						<div class="container text-end">
							<button type="submit" class="btn btn-outline-dark btn-lg">Post</button>
						</div>

					</form>


				</div>

			</div>
		</div>
	</div>



	<!-- End of post modal -->






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
		let editStatus = false;
		$(document).ready(function() {
			$("#edit-profile-btn").click(function() {
				if (editStatus == false) {
					$("#profile-detail").hide();
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back")
				} else {
					$("#profile-detail").show();
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit")

				}

			});
			/* $("#1st").click(function(){
				var output=document.getElementById('output');
				output.src=URL.createObjectURL(eve)
			}); */

		});

		const mytime = setTimeout(remo, 5000);
		function remo() {
			document.getElementById("alert-msg").remove();
		}

		var changepro = function(event) {
			var output = document.getElementById('output');
			output.src = URL.createObjectURL(event.target.files[0]);
			output.onload = function() {
				URL.revokeObjectURL(output.src) // free memory
			}
		};
	</script>

	<!-- ADD post JS -->

	<script>
		$(document).ready(function(e) {
			$("#add_Post_form").on("submit", function(event) {
				console.log("submit button clicked");
				//this code gets called when form is submitted
				event.preventDefault();
				let form = new FormData(this);
				//now requesting to server
				$.ajax({
					url : "AddPostServlet",
					type : "POST",
					data : form,
					success : function(data, textStatus, jqXHR) {
						if (data.trim() == 'done') {
							swal("Good job!", "Saved Successfully", "success");
						} else {
							swal("Error!", "Something went wrong", "error");
						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(errorThrown);

					},
					processData : false,
					contentType : false
				})
			});
		});
	</script>
	<script>
		function myFunction() {
			var dots = document.getElementById("dots");
			var moreText = document.getElementById("more");
			var btnText = document.getElementById("myBtn");

			if (dots.style.display === "none") {
				dots.style.display = "inline";
				btnText.innerHTML = " (Read more)";
				moreText.style.display = "none";
			} else {
				dots.style.display = "none";
				btnText.innerHTML = " (Read less)";
				moreText.style.display = "inline";
			}
		}
	</script>

	<script>

function doLike(pid,uid){
	const d={
		uid:uid,
		pid:pid,
		operation:'Like'
	}
	$.ajax({
		url:"LikeServlet",
		data:d,
		success:function(data,textStatus,jqXHR){
			if(data.trim()=="true"){
				let c=$(".like-counter").html();
				c++;
				$(".like-counter").html(c);
				
			}
			
		},
		error:function(jqXHR,textStatus,errorThrown){
			console.log(errorThrown);
		},
		
	});
}


</script>
</body>
</html>