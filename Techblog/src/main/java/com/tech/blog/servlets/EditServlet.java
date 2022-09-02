package com.tech.blog.servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.ProfileHelper;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		String useremail=request.getParameter("user_email");
		String username=request.getParameter("user_name");
		String userpwd=request.getParameter("user_pwd");
		Part part=request.getPart("profile_pic");
		String imagename=part.getSubmittedFileName();
		response.getWriter().println("<h1> This profile name is :"+imagename+"</h1><br>");
		
		//get user from session
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentuser");
		user.setEmail(useremail);
		user.setName(username);
		user.setPassword(userpwd);
		String oldprofilename=user.getProfile();
		if(imagename.equals("")) {
			imagename=user.getProfile();
		}
		user.setProfile(imagename);
		s.setAttribute("currentuser", user);
		String path=request.getRealPath("/")+"profile_pics"+"/"+imagename;
		InputStream is=part.getInputStream();	
		UserDao userdao=new UserDao(ConnectionProvider.getConn());
		boolean ans=userdao.updateUser(user);
		if(ans) {
			
			if(ProfileHelper.saveProfile(is, path)) {
				Message msg=new Message("Profile updated successfully","success","alert-success");
				s.setAttribute("msg", msg);
				if(!imagename.equals(oldprofilename)) {
				try {
					Thread.sleep(5000);}catch(Exception e) {}
				}
			response.sendRedirect("profile.jsp");
			}else {
				Message msg=new Message("Something went Wrong from 1st else","error","alert-danger");
				s.setAttribute("msg", msg);
			response.sendRedirect("profile.jsp");
			}
		
		}else {
			Message msg=new Message("Something went Wrong from 2nd else","error","alert-danger");
			s.setAttribute("msg", msg);
		response.sendRedirect("profile.jsp");
		}
		
	}

}
