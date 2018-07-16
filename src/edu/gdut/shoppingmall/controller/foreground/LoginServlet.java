package edu.gdut.shoppingmall.controller.foreground;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.gdut.shoppingmall.business.factory.EBOFactory;
import edu.gdut.shoppingmall.vo.UserModel;

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 78453695124L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
		
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String vercode = req.getParameter("vercode");
		HttpSession session = req.getSession();
		
		String code = (String)session.getAttribute("code");
		UserModel um = EBOFactory.getUserEBO().findUser(name);
		
		if(vercode == "" || !code.equals(vercode.toLowerCase())) {
			String jsonStr = "{\"state\": \"验证码不正确！\",\"code\":1}";
			out.write(jsonStr);	
		} else if(um == null || !um.getPassword().equals(password)) {
			String jsonStr = "{\"state\": \"用户名或密码不正确！\",\"code\":2}";
			out.write(jsonStr);
		} else if(um.getStatus() == 1) {
			String jsonStr = "{\"state\": \"该账号已被管理员冻结！\",\"code\":3}";
			out.write(jsonStr);
		} else {
			session.setAttribute("username",um.getName());
			String jsonStr = "{\"state\": \"用户登录成功！\",\"code\":0}";
			out.write(jsonStr);
		}
		
	}

}
