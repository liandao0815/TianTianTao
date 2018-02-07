package edu.gdut.shoppingmall.vo;

public enum GoodsType {
	A("图书"), B("食品"), C("数码"), D("家电"), E("服饰");
	private String description;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	GoodsType(String description) {
		this.description = description;
	}

}
