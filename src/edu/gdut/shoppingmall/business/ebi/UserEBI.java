package edu.gdut.shoppingmall.business.ebi;

import edu.gdut.shoppingmall.vo.UserModel;

public interface UserEBI {

	boolean createUser(UserModel um);
	boolean updateUser(UserModel um);
	
	UserModel findUser(String name);
	
}
