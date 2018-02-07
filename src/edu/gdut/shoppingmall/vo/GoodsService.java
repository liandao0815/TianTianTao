package edu.gdut.shoppingmall.vo;

import java.util.List;
import java.util.Map;

import edu.gdut.shoppingmall.business.factory.EBOFactory;

public class GoodsService {

	public PageBean queryPageBean(Map<String,String> condition, int currentPage, int pageSize){
		
		PageBean page = new PageBean();
		
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize); 
		int totalCount = EBOFactory.getGoodsEBO().findCount(condition);
		page.setTotalCount(totalCount);
		List<GoodsModel> list = EBOFactory.getGoodsEBO().findCurrentData(condition, currentPage, pageSize);
		page.setData(list);
		
		return page;
	}
}
