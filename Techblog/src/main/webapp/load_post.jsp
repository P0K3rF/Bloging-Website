<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">

	<%
	Thread.sleep(500);
	PostDao pd = new PostDao(ConnectionProvider.getConn());
	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts = null;
	if (cid == 0) {
		posts = pd.getAllPost();

	} else {
		posts = pd.getPostByCatId(cid);

	}
	if (posts.isEmpty()) {
		out.println("<h3 class='display-3 text-center'>No post on this category</h3>");
		return;
	}
	for (Post p : posts) {
	%>

	<div class="col-md-5 mt-3 box">
		<div class="card shadow-lg p-3 mb-5  bg-white rounded">
			<div class="card-header">

				<%
				PostDao postDao = new PostDao(ConnectionProvider.getConn());
				User us = postDao.getUserByUserId(p.getUserId());
				%>
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-2" style="">
							<img src="profile_pics/<%=us.getProfile()%>" class="img-fluid "
								style="border-radius: 50%; height: 40px; width: 40px" />

						</div>
						<div class="col-md-6 pt-2">
							<h5><%=us.getName()%></h5>
						</div>
						<div class="col-md-4 pt-2 post-date">
							<h6><%=DateFormat.getDateInstance().format(p.getpDate())%></h6>
						</div>
					</div>

				</div>




			</div>
			<%
			if (!p.getpPic().equals("")) {
			%>
			<div class="container text-center px-2 my-2">
				<img src="blog_pics/<%=p.getpPic()%>" class="card-img-top img-fluid"
					style="height: 300px; width: 350px;">
			</div>
			<%
			}
			%>
			<hr>

			<div class="card-body ">
				<b><%=p.getpTitle()%></b>
				<%
				String s = p.getpContent();
				if (s.length() > 150) {
					String s1 = s.substring(0, 150);
				%>
				<p><%=s1%>...
				</p>
				<%
				} else {
				%>
				<p><%=s%></p>
				<%
				}
				%>
			</div>
			<div class="card-footer primary-background text-center">
				<a href="#!" class="btn btn-outline-light btn-sm disabled"> <i
					class="fa fa-thumbs-o-up"></i><span class="like-counter"> <%
 LikeDao ld = new LikeDao(ConnectionProvider.getConn());
 %><%=ld.countLikeOnPost(p.getPid())%>
				</span></a> <a href="show_blog_post.jsp?post_id=<%=p.getPid()%>"
					class="btn btn-outline-light btn-sm">Read More</a> <a href="#!"
					class="btn btn-outline-light btn-sm disabled"><i
					class="fa fa-commenting-o"></i><span> </span></a>
			</div>


		</div>


	</div>


	<%
	}
	%>

</div>