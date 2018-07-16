package edu.gdut.shoppingmall.business.ebo;

import edu.gdut.shoppingmall.business.ebi.UserEBI;
import edu.gdut.shoppingmall.dao.factory.DAOFactory;
import edu.gdut.shoppingmall.dao.impl.UserDAO;
import edu.gdut.shoppingmall.vo.UserModel;

public class UserEBO implements UserEBI {

	@Override
	public boolean createUser(UserModel um) {
		UserDAO udao = DAOFactory.getUserDAO();
		return udao.createUser(um);
	}

	@Override
	public boolean updateUser(UserModel um) {
		UserDAO udao = DAOFactory.getUserDAO();
		return udao.updateUser(um);
	}

	@Override
	public UserModel findUser(String name) {
		UserDAO udao = DAOFactory.getUserDAO();
		return udao.findUser(name);
	}
	
}
