package com.sjl.joinme.tags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sjl.joinme.database.JoinMeDB;

public class TagsDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public TagsDAO() {
	}

	public boolean addTags(TagsDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "insert into tags(tag, tag_description) values(?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getTag());
			ps.setString(2, dto.getTag_description());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in addTags:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	
	
	
	
	
	
	



	public int tagNameToTagID(String tag)
	{
		int flag = -1;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "select tag_id from tags where tag='"+tag+"'";
			ps = conn.prepareStatement(query);
	
			rs = ps.executeQuery();
			if (rs.next()) {
				flag=rs.getInt("tag_id");
			}
		} catch (Exception e) {
			System.out.println("+++Exception in tagNameToTagID:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	
	
	
	
	
	
	public boolean updateTags(TagsDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "update tags set tag=?, tag_description=? where tag_id=" + dto.getTag_id();
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getTag());
			ps.setString(2, dto.getTag_description());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in updateTags:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteTags(int tag_id) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "delete from tags where tag_id=" + tag_id;
			ps = conn.prepareStatement(query);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in deleteTags:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public ArrayList<String> getAllTags() {
		ArrayList<String> al = new ArrayList<>();
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "select tag from tags";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				al.add(rs.getString("tag"));
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getAllTags:" + e);
		} finally {
			if (al.isEmpty()) {
				al = null;
			}
			ps = null;
			rs = null;
			conn = null;
			return al;
		}
	}
	
	public boolean checkTag(String tag) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "select tag from tags where tag="+tag;
			ps=conn.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in chackTag: " + e);
		} finally {
			rs=null;
			ps=null;
			conn=null;
			return flag;
		}
	}

	public boolean checkTagAndActivity(String tag, String activity) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "select tag from tags,created_activity_list where tags.tag_id=created_activity_list.tag_id and tag=? and activity_name=?";
			ps=conn.prepareStatement(query);
			ps.setString(1, tag);
			ps.setString(2, activity);
			rs = ps.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in checkTagAndActivity: " + e);
		} finally {
			return flag;
		}
	}
}
