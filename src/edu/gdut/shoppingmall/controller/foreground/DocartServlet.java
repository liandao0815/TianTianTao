package edu.gdut.shoppingmall.controller.foreground;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DocartServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 45362185691L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String submitFlag = req.getParameter("submitFlag");
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("username");
		@SuppressWarnings("unchecked")
		Map<String, Integer> cartMap = (Map<String, Integer>) session.getAttribute(username + "cart");
		if ("cleanOne".equals(submitFlag)) {
			String id = req.getParameter("id");
			cartMap.remove(id);
			if (cartMap.size() == 0) {
				session.removeAttribute(username + "cart");
			}
			RequestDispatcher dispatcher = req.getRequestDispatcher("./jsp/foreground/cart.jsp");
			dispatcher.forward(req, resp);
		}
		if ("cleanAll".equals(submitFlag)) {
			session.removeAttribute(username + "cart");
			RequestDispatcher dispatcher = req.getRequestDispatcher("./jsp/foreground/cart.jsp");
			dispatcher.forward(req, resp);
		}
	}

}
