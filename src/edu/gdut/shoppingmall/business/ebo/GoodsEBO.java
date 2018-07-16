package edu.gdut.shoppingmall.business.ebo;

import java.util.List;
import java.util.Map;

import edu.gdut.shoppingmall.business.ebi.GoodsEBI;
import edu.gdut.shoppingmall.dao.factory.DAOFactory;
import edu.gdut.shoppingmall.dao.impl.GoodsDAO;
import edu.gdut.shoppingmall.vo.GoodsModel;

public class GoodsEBO implements GoodsEBI {

	@Override
	public boolean createGoods(GoodsModel gm) {
		GoodsDAO gdao = DAOFactory.getGoodsDAO();
		return gdao.createGoods(gm);
	}

	@Override
	public boolean deleteGoods(String id) {
		GoodsDAO gdao = DAOFactory.getGoodsDAO();
		return gdao.deleteGoods(id);
	}

	@Override
	public boolean updateGoods(GoodsModel gm) {
		GoodsDAO gdao = DAOFactory.getGoodsDAO();
		return gdao.updateGoods(gm);
	}

	@Override
	public List<GoodsModel> findAll() {
		GoodsDAO gdao = DAOFactory.getGoodsDAO();
		List<GoodsModel> list = gdao.findAll();
		return list;
	}

	@Override
	public GoodsModel findById(String id) {
		GoodsDAO gdao = DAOFactory.getGoodsDAO();
		return gdao.findById(id);
	}

	@Override
	public List<GoodsModel> findByCondition(Map<String, String> condition) {
		GoodsDAO gdao = DAOFactory.getGoodsDAO();
		List<GoodsModel> list = gdao.findByCondition(condition);
		return list;
	}

	@Override
	public List<GoodsModel> findCurrentData(Map<String, String> condition, int currentPage, int pageSize) {
		GoodsDAO gdao = DAOFactory.getGoodsDAO();
		List<GoodsModel> list = gdao.findCurrentData(condition, currentPage, pageSize);
		return list;
	}

	@Override
	public int findCount(Map<String, String> condition) {
		GoodsDAO gdao = DAOFactory.getGoodsDAO();
		return gdao.findCount(condition);
	}

}
