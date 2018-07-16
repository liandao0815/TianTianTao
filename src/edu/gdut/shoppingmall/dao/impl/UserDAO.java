package edu.gdut.shoppingmall.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import edu.gdut.shoppingmall.common.DBConnector;
import edu.gdut.shoppingmall.dao.dai.UserDAI;
import edu.gdut.shoppingmall.vo.UserModel;

public class UserDAO implements UserDAI {

	@Override
	public boolean createUser(UserModel um) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnector.getConn();
			String sql = "INSERT INTO ttt_userinfo (name,password) VALUES(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, um.getName());
			pstmt.setString(2, um.getPassword());
			pstmt.execute();
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	@Override
	public boolean updateUser(UserModel um) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnector.getConn();
			String sql = "UPDATE ttt_userinfo SET password=?,address=?,mobile=?,email=?,status=?"
					+ " WHERE name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, um.getPassword());
			pstmt.setString(2, um.getAddress());
			pstmt.setString(3, um.getMobile());
			pstmt.setString(4, um.getEmail());
			pstmt.setInt(5, um.getStatus());
			pstmt.setString(6, um.getName());
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	@Override
	public UserModel findUser(String name) {
		Connection conn = null;
		Statement stmt = null;
		UserModel um = null;
		try {
			conn = DBConnector.getConn();
			String sql = "SELECT * FROM ttt_userinfo WHERE name='"+name+"'";
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				um = new UserModel();
				um.setName(rs.getString(2));
				um.setPassword(rs.getString(3));
				um.setAddress(rs.getString(4));
				um.setMobile(rs.getString(5));
				um.setEmail(rs.getString(6));
				um.setStatus(rs.getInt(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
 		return um;
	}
		
}
