package edu.gdut.shoppingmall.controller.background;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutManagerServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 78456693236L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		session.removeAttribute("manager");
		resp.sendRedirect("./");
		
	}
	
	

}
