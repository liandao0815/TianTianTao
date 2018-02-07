package edu.gdut.shoppingmall.dao.dai;

import edu.gdut.shoppingmall.vo.UserModel;

public interface UserDAI {

	boolean createUser(UserModel um);
	boolean updateUser(UserModel um);
	
	UserModel findUser(String name);
	
}
