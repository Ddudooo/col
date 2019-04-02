package com.col.basket.dao;

public class FreePassVO {

	private String userID;// 아이디
	private int productSeq;// 상품번호
	private int productCate;// 상품종류
	private int productName;// 상품명
	private String productExpireDate;// 상품만료일
	private int productPrice; // 가격

	// 사용자설정
	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	// 상품번호
	public int getproductSeq() {
		return productSeq;
	}

	public void setproductSeq(int productSeq) {
		this.productSeq = productSeq;
	}

	// 상품종류
	public int getproductCate() {
		return productCate;
	}

	public void setproductCate(int productCate) {
		this.productCate = productCate;
	}

	// 상품명
	public int getproductName() {
		return productName;
	}

	public void setproductName(int productName) {
		this.productName = productName;
	}

	// 상품만료일
	public String getproductExpireDate() {
		return productExpireDate;
	}

	public void setproductExpireDate(String productExpireDate) {
		this.productExpireDate = productExpireDate;
	}

	// 상품가격
	public int getproductPrice() {
		return productPrice;
	}

	public void setproductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
}
