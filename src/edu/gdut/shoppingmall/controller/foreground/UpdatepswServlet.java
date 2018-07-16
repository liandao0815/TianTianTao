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

public class UpdatepswServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 56545578302L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("username");
		
		String oldpsw = req.getParameter("oldpsw");
		String newpsw = req.getParameter("newpsw");
		UserModel um = EBOFactory.getUserEBO().findUser(username);
		
		if(username != null || username != "") {
			if(!um.getPassword().equals(oldpsw)) {
				String jsonStr = "{\"state\": \"原密码不正确！\",\"code\":1}";
				out.write(jsonStr);
			} else if(oldpsw.equals(newpsw)) {
				String jsonStr = "{\"state\": \"新旧密码相同！\",\"code\":2}";
				out.write(jsonStr);
			} else {
				if(this.Update(req)) {
					String jsonStr = "{\"state\": \"密码更新成功！\",\"code\":0}";
					out.write(jsonStr);
				}
			}
		}
		
	}
	private boolean Update(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("username");
		UserModel um = EBOFactory.getUserEBO().findUser(username);
		um.setPassword(req.getParameter("newpsw"));
		return EBOFactory.getUserEBO().updateUser(um);
	}

}
