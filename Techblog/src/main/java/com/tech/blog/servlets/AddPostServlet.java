package com.tech.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.ProfileHelper;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part part=request.getPart("profile_pic");
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentuser");

		String pTitle=request.getParameter("post_title");
		String pContent=request.getParameter("post_content");
		String pCode=request.getParameter("post_code");
		String imageName=part.getSubmittedFileName();
		int cid=Integer.parseInt(request.getParameter("cid"));
		int uid=user.getId();
				
		Post p=new Post(pTitle,pContent,pCode,imageName,null,cid,uid);
		PostDao postdao=new PostDao(ConnectionProvider.getConn());
		boolean f=postdao.savePostData(p);
		if(f) {
			String path="C:\\Users\\ktaus\\git\\Bloging-Website\\Techblog\\src\\main\\webapp\\profile_pics"+imageName;
			ProfileHelper.saveProfile(part.getInputStream(), path);
			response.getWriter().println("done");
		}else {
			response.getWriter().println("error");
		}
		
		
	}

}
