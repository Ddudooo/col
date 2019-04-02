package com.col.main.dao;

import com.col.board.dao.BoardcomVO;

public class MainComVO extends BoardcomVO {
	//프로필 사진 주소
	private String userImg;

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
}
