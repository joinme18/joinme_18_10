package com.sjl.joinme.contact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sjl.joinme.database.JoinMeDB;

public class ContactDAO {
	
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addContact(int user_id, int friend_id) {
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {
			String query = "insert into contact(user_id,friend_id) values(?,?)";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			ps.setInt(2, friend_id);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("+++Exception at addContact"+ e);
		} finally {
			conn = null;
			ps = null;
			return flag;

		}
	
	}
	
	
	
	
	
	
	
	public boolean friendExist(int user_id, int friend_id) {
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {
			String query = "select * from contact where user_id="+user_id+" && friend_id="+friend_id;
			ps = conn.prepareStatement(query);
			rs=ps.executeQuery();
			if (rs.next()) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("+++Exception at friendExist"+ e);
		} finally {
			conn = null;
			ps = null;
			return flag;

		}
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
