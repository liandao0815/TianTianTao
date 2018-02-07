package edu.gdut.shoppingmall.controller.background;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.gdut.shoppingmall.business.factory.EBOFactory;
import edu.gdut.shoppingmall.vo.UserModel;

public class QueryUserServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 199865329654L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		UserModel um = EBOFactory.getUserEBO().findUser(name);
		
		resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        
        if(um == null) {
        	String jsonStr = "{\"state\": \"该用户不存在！\",\"code\":1}";
			out.write(jsonStr);
        } else {
        	String status = "";
        	if(um.getStatus() == 0) {
        		status = "未冻结";
        	} else {
        		status = "已冻结";
        	}
        	String jsonStr = "{\"name\": \""+um.getName()+"\",\"address\": \""+um.getAddress()+"\","
        			+ "\"mobile\": \""+um.getMobile()+"\",\"email\": \""+um.getEmail()+"\","
        			+ "\"status\": \""+status+"\",\"code\":0}";
			out.write(jsonStr);
        }
		
	}

	
}
