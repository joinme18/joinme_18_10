package com.sjl.joinme.selected_activity_list;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sjl.joinme.created_activity_list.CreatedActivityListDTO;
import com.sjl.joinme.database.JoinMeDB;

public class SelectedActivityListDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addSelectedActivityList(SelectedActivityListDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "insert into selected_activity_list(user_id, activity_id)"
					+ " values(?,?)";
			ps = conn.prepareStatement(query);
			ps.setInt(1, dto.getUser_id());
			ps.setInt(2, dto.getActivity_id());
			//ps.setString(3, dto.getCreated_datetime());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in addSelectedActivityList:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean updateSelectedActivityList(SelectedActivityListDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "update selected_activity_list set user_id=?, activity_id=? where selected_activity_list_id="
					+ dto.getSelected_activity_list_id();
			ps = conn.prepareStatement(query);
			ps.setInt(1, dto.getUser_id());
			ps.setInt(2, dto.getActivity_id());
			//ps.setString(3, dto.getCreated_datetime());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in updateSelectedActivityList:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteSelectedActivityList(int selected_activity_list_id) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "delete from selected_activity_list where selected_activity_list_id="
					+ selected_activity_list_id;
			ps = conn.prepareStatement(query);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in deleteSelectedActivityList:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public SelectedActivityListDTO getSelectedActivityList(int selected_activity_list_id) {
		SelectedActivityListDTO dto = null;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "select * from selected_activity_list where selected_activity_list_id=" + selected_activity_list_id;
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new SelectedActivityListDTO();
				dto.setActivity_id(rs.getInt("activity_id"));
				dto.setCreated_datetime(rs.getString("created_datetime"));
				dto.setSelected_activity_list_id(rs.getInt("selected_activity_list_id"));
				dto.setUser_id(rs.getInt("user_id"));
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getSelectedActivityList:" + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return dto;
		}
	}

	public ArrayList<SelectedActivityListDTO> getAllSelectedActivityList() {
		ArrayList<SelectedActivityListDTO> al = new ArrayList<>();
		SelectedActivityListDTO dto = null;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "select * from selected_activity_list";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new SelectedActivityListDTO();
				dto.setActivity_id(rs.getInt("activity_id"));
				dto.setCreated_datetime(rs.getString("created_datetime"));
				dto.setSelected_activity_list_id(rs.getInt("selected_activity_list_id"));
				dto.setUser_id(rs.getInt("user_id"));
				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getAllSelectedActivityList:" + e);
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
}
