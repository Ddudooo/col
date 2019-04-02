package com.col.basket.dao;

import com.col.basket.dao.BasketVO;

public interface basketDao {
	void insertChnlInfo(BasketVO BasketVO) throws Exception;

	int existChnl(String userID) throws Exception;

	void updateChnlInfo(BasketVO BasketVO) throws Exception;
}
