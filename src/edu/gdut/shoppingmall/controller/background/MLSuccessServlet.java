package edu.gdut.shoppingmall.controller.background;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MLSuccessServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 45223698756L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("./jsp/background/manager.jsp");
		dispatcher.forward(req, resp);
		
	}

}
