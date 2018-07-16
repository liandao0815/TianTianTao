package edu.gdut.shoppingmall.controller.foreground;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.gdut.shoppingmall.business.factory.EBOFactory;
import edu.gdut.shoppingmall.vo.UserModel;

public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 21236412395L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
		
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		UserModel um = EBOFactory.getUserEBO().findUser(name);
		
		if(name == "" || password == "") {
			String jsonStr = "{\"state\": \"用户名或密码不能为空！\",\"code\":1}";
			out.write(jsonStr);
			return;
		}
		if(um != null) {
			String jsonStr = "{\"state\": \"该用户名已存在！\",\"code\":2}";
			out.write(jsonStr);
			return;
		}
		if(this.create(req)) {
			String jsonStr = "{\"state\": \"用户注册成功！\",\"code\":0}";
			out.write(jsonStr);
		}
	}
	
	private boolean create(HttpServletRequest req) {
		UserModel um = new UserModel();
		um.setName(req.getParameter("name"));
		um.setPassword(req.getParameter("password"));
		return EBOFactory.getUserEBO().createUser(um);
	}
	
	
}
