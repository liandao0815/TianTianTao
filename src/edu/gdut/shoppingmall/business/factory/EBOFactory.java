package edu.gdut.shoppingmall.business.factory;

import edu.gdut.shoppingmall.business.ebo.GoodsEBO;
import edu.gdut.shoppingmall.business.ebo.ManagerEBO;
import edu.gdut.shoppingmall.business.ebo.UserEBO;

public class EBOFactory {
	
	public static UserEBO getUserEBO() {
		return new UserEBO();
	}
	public static ManagerEBO getManagerEBO() {
		return new ManagerEBO();
	}
	public static GoodsEBO getGoodsEBO() {
		return new GoodsEBO();
	}
	
}
