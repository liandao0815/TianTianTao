package edu.gdut.shoppingmall.business.ebo;

import edu.gdut.shoppingmall.business.ebi.ManagerEBI;
import edu.gdut.shoppingmall.dao.factory.DAOFactory;
import edu.gdut.shoppingmall.dao.impl.ManagerDAO;
import edu.gdut.shoppingmall.vo.ManagerModel;

public class ManagerEBO implements ManagerEBI {

	@Override
	public ManagerModel findManager(String name) {
		ManagerDAO mdao = DAOFactory.getManagerDAO();
		return mdao.findManager(name);
	}

}
