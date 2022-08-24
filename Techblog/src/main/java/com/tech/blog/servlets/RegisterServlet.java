package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{Thread.sleep(2000);}catch(Exception e) {}
		response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	String agree_tc=request.getParameter("agree_tc");
	if(agree_tc==null) {
		out.println("Please Agree Terms and Conditions");
	}
	else {
		String name=request.getParameter("user_name");
		String email=request.getParameter("user_email");
		String pwd=request.getParameter("user_pwd");
		String gender=request.getParameter("gender");
		//Creating a user object to save all the data
		
		User user=new User(name,email,pwd,gender);
		UserDao userdao=new UserDao(ConnectionProvider.getConn());
		if(userdao.saveUser(user)) {
			//save
			out.print("done");
		}else {
			out.print("Erroe Registering");
		}
	}
	}

}
