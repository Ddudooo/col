package com.col.basket.dao;

public class BasketVO {
	
	private String userID;
	private String basketNum;
	private int videoNum;

	//사용자설정
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	//장바구니번호
	public String getbasketNum() {
		return basketNum;
	}
	public void setbasketNum(String basketNum) {
		this.basketNum = basketNum;
	}
	//영상번호
	public int videoNum() {
		return videoNum;
	}
	public void setvideoNum(int videoNum) {
		this.videoNum = videoNum;
	}
	
	
	
}
