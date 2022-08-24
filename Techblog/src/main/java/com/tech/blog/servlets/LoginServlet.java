package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		UserDao  userdao=new UserDao(ConnectionProvider.getConn());
		User user=userdao.getUserByEmailandPassword(email, password);
		if(user==null) {
			Message msg=new Message("Invalid Details! try again","error","alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("msg", msg);
		response.sendRedirect("login.jsp");
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("currentuser", user);
			response.sendRedirect("profile.jsp");
		}
	}

}
