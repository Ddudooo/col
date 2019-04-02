package com.col.basket.service;

import com.col.basket.dao.BasketVO;

public interface basketService {
	
	void insertChnlInfo(BasketVO basketVO) throws Exception;

	int existChnl(String userID) throws Exception;

	void updateChnlInfo(BasketVO  basketVO) throws Exception;

}
