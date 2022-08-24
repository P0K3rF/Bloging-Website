package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	//method to insert a user in database
	public boolean saveUser(User user) {
		boolean f=false;
	try {
		String query="insert into user(name,email,password,sex) values(?,?,?,?)";
		PreparedStatement psmt=this.con.prepareStatement(query);
		psmt.setString(1, user.getName());
		psmt.setString(2, user.getEmail());
		psmt.setString(3, user.getPassword());
		psmt.setString(4, user.getGender());
		psmt.executeUpdate();
		f=true;
	}catch(Exception e) {
		e.printStackTrace();
	}
	return f;
	}
	
	//get user by email and password
	
	public User getUserByEmailandPassword(String email,String password) {
		User user=null;
		try{
			String query="select * from user where email=? and password=?";
			PreparedStatement psmt=this.con.prepareStatement(query);
			psmt.setString(1, email);
			psmt.setString(2, password);
			ResultSet rs=psmt.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("sex"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
			}
		}catch(Exception e) {
			
		}
		return user;
	}
	
	public boolean updateUser(User user) {
		boolean f=false;
		try {
			
			String query="update user set name=?, email=?, password=?, profile=? where id=?";
			PreparedStatement psmt=this.con.prepareStatement(query);
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getPassword());
			psmt.setString(4, user.getProfile());
			psmt.setInt(5, user.getId());  
			psmt.executeUpdate();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
