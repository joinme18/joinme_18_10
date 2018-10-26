package com.sjl.joinme.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import com.sjl.joinme.database.JoinMeDB;

import utility.encryption_decryption;

public class UserDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addUser(UserDTO dto) {
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {

			String query = "insert into user( mobile_number,rating,coins,gender,unique_id,first_name,last_name,date_of_birth,email,location,about,password) values (?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getMobile_number());
			ps.setInt(2, dto.getRating());
			ps.setInt(3, dto.getCoins());
			ps.setString(4, "" + dto.getGender());
			ps.setString(5, dto.getUnique_id());
			ps.setString(6, dto.getFirst_name());
			ps.setString(7, dto.getLast_name());
			ps.setString(8, dto.getDate_of_birth());
			ps.setString(9, dto.getEmail());
			ps.setString(10, dto.getLocation());
			ps.setString(11, dto.getAbout());
			// ps.setString(12, dto.getCreated_datetime());
			ps.setString(12, /*encryption_decryption.encrypt(*/dto.getPassword()/*)*/);/////////////////////need to remove comment

			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception at add user:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}
	}

	public boolean checkUserPassword(String unique_id, String password) {
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {

			String query = "select password from user where unique_id='" + unique_id + "'";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				
				if (/*encryption_decryption.encrypt(*/password/*)*/.equals(rs.getString("password")))/////////////////////need to remove comment 
				{
					flag = true;
				}
			}
		} catch (Exception e) {
			System.out.println("+++Exception at checkuser" + e);
		} finally {
			return flag;
		}
	}

	public boolean updateUser(UserDTO dto) {
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {

			String query = "update user set mobile_number=?,rating=?,coins=?,gender=?,unique_id=?,first_name=?,last_name=?,date_of_birth=?,email=?,location=?,about=?,created_datetime=?,password=? where user_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getMobile_number());
			ps.setInt(2, dto.getRating());
			ps.setInt(3, dto.getCoins());
			ps.setString(4, "" + dto.getGender());
			ps.setString(5, dto.getUnique_id());
			ps.setString(6, dto.getFirst_name());
			ps.setString(7, dto.getLast_name());
			ps.setString(8, dto.getDate_of_birth());
			ps.setString(9, dto.getEmail());
			ps.setString(10, dto.getLocation());
			ps.setString(11, dto.getAbout());
			ps.setString(12, dto.getCreated_datetime());
			ps.setString(13, encryption_decryption.encrypt(dto.getPassword()));
			ps.setInt(14, dto.getUser_id());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++exception at updateUser" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteStudent(int user_id) {
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {

			String query = "delete from user where user_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++exception at delete user" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public ArrayList<UserDTO> getAllUsers() {
		UserDTO dto = null;
		ArrayList<UserDTO> list = new ArrayList<>();
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {

			String query = "select * from user ";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new UserDTO();

				// mobile_number,rating,coins,gender,unique_id,first_name,last_name,
				// date_of_birth,email,location,about,created_datetime,password

				dto.setUser_id(rs.getInt("user_id"));
				dto.setMobile_number(rs.getString("mobile_number"));
				dto.setRating(rs.getInt("rating"));
				dto.setAbout(rs.getString("about"));
				dto.setCoins(rs.getInt("coins"));
				dto.setCreated_datetime(rs.getString("created_datetime"));
				dto.setDate_of_birth(rs.getString("date_of_birth"));
				dto.setEmail(rs.getString("email"));
				dto.setFirst_name(rs.getString("first_name"));
				dto.setGender(rs.getString("gender").charAt(0));
				dto.setLast_name(rs.getString("last_name"));
				dto.setLocation(rs.getString("location"));
				dto.setPassword(encryption_decryption.decrypt(rs.getString("password")));
				dto.setUnique_id(rs.getString("unique_id"));
				list.add(dto);

			}
		} catch (Exception e) {
			System.out.println("+++exception at get all user" + e);
		} finally {
			if (list.isEmpty()) {
				return null;
			}
			ps = null;
			conn = null;
			rs = null;
			return list;
		}
	}

	public UserDTO getUser(int user_id) {
		UserDTO dto = null;
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {

			String query = "select * from user where user_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			rs = ps.executeQuery();

			if (rs.next()) {
				dto = new UserDTO();
				dto.setUser_id(rs.getInt("user_id"));
				dto.setMobile_number(rs.getString("mobile_number"));
				dto.setRating(rs.getInt("rating"));
				dto.setAbout(rs.getString("about"));
				dto.setCoins(rs.getInt("coins"));
				dto.setCreated_datetime(rs.getString("created_datetime"));
				dto.setDate_of_birth(rs.getString("date_of_birth"));
				dto.setEmail(rs.getString("email"));
				dto.setFirst_name(rs.getString("first_name"));
				dto.setGender(rs.getString("gender").charAt(0));
				dto.setLast_name(rs.getString("last_name"));
				dto.setLocation(rs.getString("location"));
				dto.setPassword(/*encryption_decryption.decrypt(*/rs.getString("password")/*)*/);
				dto.setUnique_id(rs.getString("unique_id"));

			}

		} catch (Exception e) {
			System.out.println("+++exception at getUser: " + e);
		} finally {

			ps = null;
			conn = null;
			rs = null;
			return dto;
		}
	}
	
	public int getUserID(String unique_id) {
		int user_id=-1;
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {

			String query = "select user_id from user where unique_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, unique_id);
			rs = ps.executeQuery();

			if (rs.next()) {
				user_id=rs.getInt("user_id");
			}

		} catch (Exception e) {
			System.out.println("+++exception at get student" + e);
		} finally {
			ps = null;
			conn = null;
			rs = null;
			return user_id;
		}
	}
	
	public boolean moblieNumberExist(String mobile_number) {
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {
			String query="select mobile_number from user where mobile_number=?";
			
			ps=conn.prepareStatement(query);
			ps.setString(1,mobile_number);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				flag=true;
			}

		} catch (Exception e) {
			System.out.println("+++exception at checkMoblieNumber" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean uniqueIDExist(String unique_id) {
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {
				String query="select unique_id from user where unique_id=?";
				
				ps=conn.prepareStatement(query);
				ps.setString(1,unique_id);
				rs=ps.executeQuery();
				
				if(rs.next()) {
					flag=true;
				}

		} catch (Exception e) {
			System.out.println("+++exception at uniqueIDExist" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}
	
	public boolean changePassword(String mobile_number,String new_password) {
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {
				String query="update user set password=? where mobile_number=?";
				ps=conn.prepareStatement(query);
				ps.setString(1, new_password);
				ps.setString(2, mobile_number);
				if(ps.executeUpdate()>0) {
					flag = true;
				}

		} catch (Exception e) {
			System.out.println("+++exception at changePassword" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

}
