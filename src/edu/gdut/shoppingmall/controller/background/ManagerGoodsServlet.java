package edu.gdut.shoppingmall.controller.background;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.gdut.shoppingmall.vo.GoodsType;
import edu.gdut.shoppingmall.business.factory.EBOFactory;
import edu.gdut.shoppingmall.vo.GoodsModel;

public class ManagerGoodsServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 45469710326L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String submitFlag = req.getParameter("submitFlag");
		String id = req.getParameter("id");
		GoodsModel gm = EBOFactory.getGoodsEBO().findById(id);
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out = resp.getWriter();

		if ("add".equals(submitFlag)) {
			if (this.add(req)) {
				String jsonStr = "{\"state\": \"商品添加成功！\",\"code\":1}";
				out.write(jsonStr);
			}
		}
		if ("delete".equals(submitFlag)) {
			if (gm == null) {
				String jsonStr = "{\"state\": \"商品不存在！\",\"code\":2}";
				out.write(jsonStr);
			} else {
				if (this.delete(req)) {
					String jsonStr = "{\"state\": \"商品删除成功！\",\"code\":3}";
					out.write(jsonStr);
				}
			}
		}
		if ("update".equals(submitFlag)) {
			if (gm == null) {
				String jsonStr = "{\"state\": \"商品不存在！\",\"code\":4}";
				out.write(jsonStr);
			} else {
				if (this.update(req)) {
					String jsonStr = "{\"state\": \"商品更新成功！\",\"code\":5}";
					out.write(jsonStr);
				}
			}
		}
		if ("select".equals(submitFlag)) {
			if (gm == null) {
				String jsonStr = "{\"state\": \"商品不存在！\",\"code\":6}";
				out.write(jsonStr);
			} else {
				String jsonStr = "{\"id\": \"" + gm.getId() + "\",\"name\": \"" + gm.getName() + "\","
						+ "\"description\": \"" + gm.getDescription() + "\",\"price\": \"" + gm.getPrice() + "\","
						+ "\"isNew\": \"" + gm.getIsNew() + "\",\"commend\": \"" + gm.getCommend() + "\","
						+ "\"discount\": \"" + gm.getDiscount() + "\",\"stock\": \"" + gm.getStock() + "\","
						+ "\"category\": \"" + gm.getCategory().getDescription() + "\",\"code\":0}";
				out.write(jsonStr);
			}
		}
	}

	private boolean add(HttpServletRequest req) {
		GoodsModel gm = new GoodsModel();
		gm.setId(req.getParameter("id"));
		gm.setName(req.getParameter("name"));
		gm.setDescription(req.getParameter("description"));
		gm.setPrice(Float.parseFloat(req.getParameter("price")));
		gm.setIsNew(Integer.parseInt(req.getParameter("isNew")));
		gm.setCommend(Integer.parseInt(req.getParameter("commend")));
		gm.setDiscount(Integer.parseInt(req.getParameter("discount")));
		gm.setStock(Integer.parseInt(req.getParameter("stock")));
		gm.setCategory(GoodsType.valueOf(req.getParameter("category")));
		return EBOFactory.getGoodsEBO().createGoods(gm);
	}

	private boolean delete(HttpServletRequest req) {
		return EBOFactory.getGoodsEBO().deleteGoods(req.getParameter("id"));
	}

	private boolean update(HttpServletRequest req) {
		GoodsModel gm = new GoodsModel();
		gm.setId(req.getParameter("id"));
		gm.setName(req.getParameter("name"));
		gm.setDescription(req.getParameter("description"));
		gm.setPrice(Float.parseFloat(req.getParameter("price")));
		gm.setIsNew(Integer.parseInt(req.getParameter("isNew")));
		gm.setCommend(Integer.parseInt(req.getParameter("commend")));
		gm.setDiscount(Integer.parseInt(req.getParameter("discount")));
		gm.setStock(Integer.parseInt(req.getParameter("stock")));
		gm.setCategory(GoodsType.valueOf(req.getParameter("category")));
		return EBOFactory.getGoodsEBO().updateGoods(gm);
	}
}
