package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	Connection con;
	public LikeDao(Connection con) {
		this.con=con;
	}
	
	public boolean insertLike(int postId,int userId) {
		boolean f=false;
		try {
			String query="insert into liked(pid,uid) values(?,?)";
			PreparedStatement psmt=this.con.prepareStatement(query);
			psmt.setInt(1, postId);
			psmt.setInt(2, userId);
			psmt.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

    public int countLikeOnPost(int postId) {
    	int count=0;
    	try {
    		String query="select count(*) from liked where pid=?";
    		PreparedStatement psmt=this.con.prepareStatement(query);
    		psmt.setInt(1, postId);
    		ResultSet rs=psmt.executeQuery();
    		if(rs.next()) {
    		count=rs.getInt("count(*)");
    		}
    		}
    	catch(Exception e) {
    		
    	}
    	
    	return count;
    }

   public boolean isLikedByUser(int postId,int userId) {
	   boolean f=false;
	   try {
		   String query="select * from liked where pid=? and uid=?";
		   PreparedStatement psmt=this.con.prepareStatement(query);
   		psmt.setInt(1, postId);
   		psmt.setInt(2, userId);
   		ResultSet rs=psmt.executeQuery();
   		if(rs.next()) {
   			f=true;
   		}
		   
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return f;
   }

   public boolean deleteLike(int postId,int userId) {
	   boolean f=false;
	   try {
	   String query="delete from liked where pid=? and uid=?";
	   PreparedStatement psmt=this.con.prepareStatement(query);
	   psmt.setInt(1, postId);
	   psmt.setInt(2, userId);
	   psmt.executeUpdate();
	   f=true;
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return f;
   }
 }
