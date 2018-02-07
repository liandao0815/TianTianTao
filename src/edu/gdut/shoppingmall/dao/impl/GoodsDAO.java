package edu.gdut.shoppingmall.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import edu.gdut.shoppingmall.common.DBConnector;
import edu.gdut.shoppingmall.dao.dai.GoodsDAI;
import edu.gdut.shoppingmall.vo.GoodsModel;
import edu.gdut.shoppingmall.vo.GoodsType;

public class GoodsDAO implements GoodsDAI {

	@Override
	public boolean createGoods(GoodsModel gm) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnector.getConn();
			String sql = "INSERT INTO ttt_goodsinfo VALUES(?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gm.getId());
			pstmt.setString(2, gm.getName());
			pstmt.setString(3, gm.getDescription());
			pstmt.setString(4, gm.getCategory().toString());
			pstmt.setFloat(5, gm.getPrice());
			pstmt.setInt(6, gm.getIsNew());
			pstmt.setInt(7, gm.getCommend());
			pstmt.setInt(8, gm.getDiscount());
			pstmt.setInt(9, gm.getStock());
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
	public boolean deleteGoods(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnector.getConn();
			String sql = "DELETE FROM ttt_goodsinfo WHERE id=" + id;
			pstmt = conn.prepareStatement(sql);
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
	public boolean updateGoods(GoodsModel gm) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnector.getConn();
			String sql = "UPDATE ttt_goodsinfo SET name=?,description=?,category=?,"
					+ "price=?,isNew=?,commend=?,discount=?,stock=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gm.getName());
			pstmt.setString(2, gm.getDescription());
			pstmt.setString(3, gm.getCategory().toString());
			pstmt.setFloat(4, gm.getPrice());
			pstmt.setInt(5, gm.getIsNew());
			pstmt.setInt(6, gm.getCommend());
			pstmt.setInt(7, gm.getDiscount());
			pstmt.setInt(8, gm.getStock());
			pstmt.setString(9, gm.getId());
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
	public List<GoodsModel> findAll() {
		Connection conn = null;
		Statement stmt = null;
		List<GoodsModel> list = new ArrayList<GoodsModel>();
		GoodsModel gm = null;
		try {
			conn = DBConnector.getConn();
			String sql = "SELECT * FROM ttt_goodsinfo";
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				gm = new GoodsModel();
				gm.setId(rs.getString(1));
				gm.setName(rs.getString(2));
				gm.setDescription(rs.getString(3));
				gm.setCategory(GoodsType.valueOf(rs.getString(4)));
				gm.setPrice(rs.getFloat(5));
				gm.setIsNew(rs.getInt(6));
				gm.setCommend(rs.getInt(7));
				gm.setDiscount(rs.getInt(8));
				gm.setStock(rs.getInt(9));
				list.add(gm);
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
		return list;
	}

	@Override
	public GoodsModel findById(String id) {
		Connection conn = null;
		Statement stmt = null;
		GoodsModel gm = null;
		try {
			conn = DBConnector.getConn();
			String sql = "SELECT * FROM ttt_goodsinfo WHERE id=" + id;
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				gm = new GoodsModel();
				gm.setId(rs.getString(1));
				gm.setName(rs.getString(2));
				gm.setDescription(rs.getString(3));
				gm.setCategory(GoodsType.valueOf(rs.getString(4)));
				gm.setPrice(rs.getFloat(5));
				gm.setIsNew(rs.getInt(6));
				gm.setCommend(rs.getInt(7));
				gm.setDiscount(rs.getInt(8));
				gm.setStock(rs.getInt(9));
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
		return gm;
	}

	@Override
	public List<GoodsModel> findByCondition(Map<String, String> condition) {
		Connection conn = null;
		Statement stmt = null;
		List<GoodsModel> list = new ArrayList<GoodsModel>();
		GoodsModel gm = null;
		try {
			conn = DBConnector.getConn();
			String sqlf = "SELECT * FROM ttt_goodsinfo WHERE 1=1";
			String sql = this.getSQL(sqlf, condition);
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				gm = new GoodsModel();
				gm.setId(rs.getString(1));
				gm.setName(rs.getString(2));
				gm.setDescription(rs.getString(3));
				gm.setCategory(GoodsType.valueOf(rs.getString(4)));
				gm.setPrice(rs.getFloat(5));
				gm.setIsNew(rs.getInt(6));
				gm.setCommend(rs.getInt(7));
				gm.setDiscount(rs.getInt(8));
				gm.setStock(rs.getInt(9));
				list.add(gm);
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
		return list;
	}

	@Override
	public List<GoodsModel> findCurrentData(Map<String, String> condition, int currentPage, int pageSize) {
		Connection conn = null;
		Statement stmt = null;
		List<GoodsModel> list = new ArrayList<GoodsModel>();
		GoodsModel gm = null;
		try {
			conn = DBConnector.getConn();
			String sqlf = "SELECT * FROM ttt_goodsinfo WHERE 1=1";
			int startNo = (currentPage - 1) * pageSize;
			String sql = this.getSQL(sqlf, condition) + " LIMIT " + startNo + "," + pageSize;
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				gm = new GoodsModel();
				gm.setId(rs.getString(1));
				gm.setName(rs.getString(2));
				gm.setDescription(rs.getString(3));
				gm.setCategory(GoodsType.valueOf(rs.getString(4)));
				gm.setPrice(rs.getFloat(5));
				gm.setIsNew(rs.getInt(6));
				gm.setCommend(rs.getInt(7));
				gm.setDiscount(rs.getInt(8));
				gm.setStock(rs.getInt(9));
				list.add(gm);
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
		return list;
	}

	@Override
	public int findCount(Map<String, String> condition) {
		Connection conn = null;
		Statement stmt = null;
		int count = 0;
		try {
			conn = DBConnector.getConn();
			String sqlf = "SELECT * FROM ttt_goodsinfo WHERE 1=1";
			String sql = this.getSQL(sqlf, condition);
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.last();
			count = rs.getRow();
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
		return count;
	}

	private String getSQL(String sqlf, Map<String, String> condition) {
		StringBuffer sql = new StringBuffer(sqlf);
		Iterator<Entry<String, String>> iter = condition.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry<String, String> entry = iter.next();
			String key = entry.getKey();
			String value = entry.getValue();
			if ("id".equals(key)) {
				sql.append(" and id like " + value);
			}
			if ("name".equals(key)) {
				sql.append(" and name like '%" + value + "%'");
			}
			if ("category".equals(key)) {
				sql.append(" and category='" + value + "'");
			}
			if ("commend".equals(key)) {
				sql.append(" and commend=" + value);
			}
			if ("discount".equals(key)) {
				sql.append(" and discount=" + value);
			}
			if ("pricegt".equals(key)) {
				sql.append(" and price>=" + value);
			}
			if ("pricelt".equals(key)) {
				sql.append(" and price<=" + value);
			}
		}
		return sql.toString();
	}
}
