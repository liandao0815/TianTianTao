package edu.gdut.shoppingmall.controller.foreground;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 96969683625L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		if (id != null) {
			String setCount = req.getParameter("count");
			String minus = req.getParameter("minus");
			HttpSession session = req.getSession();
			String username = (String) session.getAttribute("username");
			@SuppressWarnings("unchecked")
			Map<String, Integer> cartMap = (Map<String, Integer>) session.getAttribute(username + "cart");
			if (cartMap == null) {
				cartMap = new HashMap<String, Integer>();
			}
			Integer count = cartMap.get(id);
			if (count != null) {
				if (setCount != null)
					cartMap.put(id, Integer.parseInt(setCount));
				else if (minus != null) {
					int minusCount = count <= 0 ? 0 : count - 1;
					cartMap.put(id, minusCount);
				} else
					cartMap.put(id, count + 1);
			} else
				cartMap.put(id, 1);
			session.setAttribute(username + "cart", cartMap);
		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("./jsp/foreground/cart.jsp");
		dispatcher.forward(req, resp);
	}

}
