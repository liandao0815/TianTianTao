package edu.gdut.shoppingmall.vo;

public class GoodsModel {
	
	private String id;
	private String name;
	private String description;
	private GoodsType category;
	private float price;
	private int isNew;
	private int commend;
	private int discount;
	private int stock;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public GoodsType getCategory() {
		return category;
	}
	public void setCategory(GoodsType category) {
		this.category = category;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getIsNew() {
		return isNew;
	}
	public void setIsNew(int isNew) {
		this.isNew = isNew;
	}
	public int getCommend() {
		return commend;
	}
	public void setCommend(int commend) {
		this.commend = commend;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
}
