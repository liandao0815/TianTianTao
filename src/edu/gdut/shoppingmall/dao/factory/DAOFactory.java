package edu.gdut.shoppingmall.dao.factory;

import edu.gdut.shoppingmall.dao.impl.GoodsDAO;
import edu.gdut.shoppingmall.dao.impl.ManagerDAO;
import edu.gdut.shoppingmall.dao.impl.UserDAO;

public class DAOFactory {
	
	public static UserDAO getUserDAO() {
		 return new UserDAO();
	}
	public static ManagerDAO getManagerDAO() {
		 return new ManagerDAO();
	}
	public static GoodsDAO getGoodsDAO() {
		 return new GoodsDAO();
	}
	
}
