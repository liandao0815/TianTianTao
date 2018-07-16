package edu.gdut.shoppingmall.controller.background;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.gdut.shoppingmall.business.factory.EBOFactory;
import edu.gdut.shoppingmall.vo.ManagerModel;

public class ManagerServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 74513639875L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		 
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		
		ManagerModel mm = EBOFactory.getManagerEBO().findManager(name);
		
		resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
		
		if(mm == null || !mm.getPassword().equals(password)) {
	        String jsonStr = "{\"state\": \"用户名或密码不正确！\",\"code\":1}";
			out.write(jsonStr);
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("manager", mm.getName());
			String jsonStr = "{\"state\": \"管理员登录成功！\",\"code\":0}";
			out.write(jsonStr);
		}
		
	}
	
}
