package edu.gdut.shoppingmall.business.ebi;

import java.util.List;
import java.util.Map;

import edu.gdut.shoppingmall.vo.GoodsModel;

public interface GoodsEBI {

	boolean createGoods(GoodsModel gm);
	boolean deleteGoods(String id);
	boolean updateGoods(GoodsModel gm);
	
	List<GoodsModel> findAll();
	GoodsModel findById(String id);
	List<GoodsModel> findByCondition(Map<String,String> condition);
	List<GoodsModel> findCurrentData(Map<String,String> condition,int currentPage,int pageSize);
	int findCount(Map<String,String> condition);
	
}
