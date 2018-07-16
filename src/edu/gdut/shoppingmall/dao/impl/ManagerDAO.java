package edu.gdut.shoppingmall.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import edu.gdut.shoppingmall.common.DBConnector;
import edu.gdut.shoppingmall.dao.dai.ManagerDAI;
import edu.gdut.shoppingmall.vo.ManagerModel;

public class ManagerDAO implements ManagerDAI{

	@Override
	public ManagerModel findManager(String name) {
		Connection conn = null;
		Statement stmt = null;
		ManagerModel mm = null;
		try {
			conn = DBConnector.getConn();
			String sql = "SELECT * FROM ttt_manager WHERE name='"+name+"'";
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				mm = new ManagerModel();
				mm.setName(rs.getString(2));
				mm.setPassword(rs.getString(3));
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
		return mm;
	}

}
