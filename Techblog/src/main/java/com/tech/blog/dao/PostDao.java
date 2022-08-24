package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;

public class PostDao {
	Connection con;
	
	public PostDao(Connection con) {
		this.con=con;
	}
	public ArrayList<Categories> getAllCategories(){
		ArrayList<Categories> arraylist=new ArrayList<>();
		
		try{
			
			String query="select * from categories";
			PreparedStatement psmt=this.con.prepareStatement(query);
			ResultSet rs=psmt.executeQuery();
			while(rs.next()) {
				int cid=rs.getInt("cid");
			    String name=rs.getString("name");
			    String description=rs.getString("description");
			    Categories c=new Categories(cid,name,description);
			    arraylist.add(c);
			}
		}catch(Exception e) {
			
		}
		return arraylist;
	}
	
	public boolean savePostData(Post p) {
		boolean f=false;
		try {
			String query="insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			PreparedStatement psmt=this.con.prepareStatement(query);
			psmt.setString(1, p.getpTitle());
			psmt.setString(2, p.getpContent());
			psmt.setString(3, p.getpCode());
			psmt.setString(4, p.getpPic());
			psmt.setInt(5, p.getCatId());
			psmt.setInt(6, p.getUserId());
			psmt.executeUpdate();
			f=true;
		}catch(Exception e) {
		e.printStackTrace();
		}
		
		return f;
	}

    public List<Post> getAllPost(){
    	List<Post> list=new ArrayList<>();
    	//get all post
    	try {
    		String query="select * from posts order by pid";
    		PreparedStatement psmt=this.con.prepareStatement(query);
    		ResultSet rs=psmt.executeQuery();
    		while(rs.next()) {
    			int pid=rs.getInt("pid");
    			String pTitle=rs.getString("pTitle");
    			String pContent=rs.getString("pContent");
    			String pCode=rs.getString("pCode");
    			String pPic=rs.getString("pPic");
    			Timestamp pDate=rs.getTimestamp("pDate");
    			int catId=rs.getInt("catId");
    			int userId=rs.getInt("userId");
    			//Creating a single post and adding into list
    			Post p=new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
    			list.add(p);
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return list;
    }
    public List<Post> getPostByCatId(int catId){
    	List<Post> list=new ArrayList<>();
    	
    	//get all post by id
    	try {
    		String query="select * from posts where catId=?";
    		PreparedStatement psmt=this.con.prepareStatement(query);
    		psmt.setInt(1, catId);
    		ResultSet rs=psmt.executeQuery();
    		while(rs.next()) {
    			
    			int pid=rs.getInt("pid");
    			String pTitle=rs.getString("pTitle");
    			String pContent=rs.getString("pContent");
    			String pCode=rs.getString("pCode");
    			String pPic=rs.getString("pPic");
    			Timestamp pDate=rs.getTimestamp("pDate");
    			int userId=rs.getInt("userId");
    			//Creating a single post and adding into list
    			Post p=new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
    			list.add(p);
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	
    	
    	return list;
    }

    public Post getPostPostById(int postId) {
    	Post p=null;
    	try {
    	String query="select * from posts where pid=?";
    	PreparedStatement psmt=this.con.prepareStatement(query);
    	psmt.setInt(1, postId);
    	ResultSet rs=psmt.executeQuery();
    	if(rs.next()) {
    		String pTitle=rs.getString("pTitle");
			String pContent=rs.getString("pContent");
			String pCode=rs.getString("pCode");
			String pPic=rs.getString("pPic");
			Timestamp pDate=rs.getTimestamp("pDate");
			int userId=rs.getInt("userId");
			int cId=rs.getInt("catId");
			 p=new Post(postId,pTitle,pContent,pCode,pPic,pDate,cId,userId);
			
    	}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return p;
    }

    public User getUserByUserId(int userId) {
    	User user=null;
    	try {
    		String query="select * from user where id=?";
			PreparedStatement psmt=this.con.prepareStatement(query);
			psmt.setInt(1, userId);
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
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return user;
    }
}
