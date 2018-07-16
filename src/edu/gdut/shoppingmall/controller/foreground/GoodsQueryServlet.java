package edu.gdut.shoppingmall.controller.foreground;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.gdut.shoppingmall.vo.GoodsService;
import edu.gdut.shoppingmall.vo.PageBean;

public class GoodsQueryServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 77336201596L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String currentPage = req.getParameter("currentPage");
		String pageSize = req.getParameter("pageSize");
		if (currentPage == null || currentPage.equals(""))
			currentPage = "1";
		if (pageSize == null || pageSize.equals(""))
			pageSize = "9";

		Map<String, String> condition = new HashMap<String, String>();
		Enumeration<String> paramNames = req.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String key = paramNames.nextElement();
			String value = req.getParameter(key);
			if (value != null && value.trim().length() != 0)
				condition.put(key, value);
		}

		if (condition.get("currentPage") != null || condition.get("currentPage") != "")
			condition.remove("currentPage");
		if (condition.get("pageSize") != null || condition.get("pageSize") != "")
			condition.remove("pageSize");

		GoodsService goodsService = new GoodsService();
		PageBean pageBean = goodsService.queryPageBean(condition, Integer.parseInt(currentPage),
				Integer.parseInt(pageSize));
		req.setAttribute("result", pageBean);
		RequestDispatcher dispatcher = req.getRequestDispatcher("./jsp/foreground/goods.jsp");
		dispatcher.forward(req, resp);

	}

}
