package edu.gdut.shoppingmall.controller.foreground;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonalServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 56565687596L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("./jsp/foreground/personal.jsp");
		dispatcher.forward(req, resp);
	}
	
}
