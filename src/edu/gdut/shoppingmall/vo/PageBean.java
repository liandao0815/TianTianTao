package edu.gdut.shoppingmall.vo;

import java.util.List;

public class PageBean {
	
	private List<GoodsModel> data;
    @SuppressWarnings("unused")
	private int firstPage;  
    @SuppressWarnings("unused")
	private int prePage;  
    @SuppressWarnings("unused")
	private int nextPage; 
    @SuppressWarnings("unused")
	private int totalPage;
    private int currentPage;
    private int totalCount; 
    private int pageSize;
	
	public List<GoodsModel> getData() {
		return data;
	}
	public void setData(List<GoodsModel> data) {
		this.data = data;
	}
	public int getFirstPage() {
		return 1;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getPrePage() {
		return this.getCurrentPage() == this.getFirstPage() ? 1 : this.getCurrentPage()-1;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public int getNextPage() {
		return this.getCurrentPage()==this.getTotalPage()? this.getTotalPage() : this.getCurrentPage()+1;  
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getTotalPage() {
		return this.getTotalCount()%this.getPageSize()==0 ? 
				this.getTotalCount()/this.getPageSize() : this.getTotalCount()/this.getPageSize()+1;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
