package edu.gdut.shoppingmall.controller.foreground;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.gdut.shoppingmall.business.factory.EBOFactory;
import edu.gdut.shoppingmall.vo.UserModel;

public class UpdateinfoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 78866396548L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("username");
		
		if(username != null || username != "") {
			if(this.Update(req)) {
				resp.sendRedirect("./personal");
			}
		}
	}
	
	private boolean Update(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("username");
		UserModel um = EBOFactory.getUserEBO().findUser(username);
		um.setAddress(req.getParameter("address"));
		um.setMobile(req.getParameter("mobile"));
		um.setEmail(req.getParameter("email"));
		return EBOFactory.getUserEBO().updateUser(um);
	}
		
}
