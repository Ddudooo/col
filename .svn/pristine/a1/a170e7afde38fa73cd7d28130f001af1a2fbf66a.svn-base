package com.col.basket.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class basketDaoImpl implements basketDao{
	
	@Autowired
    private SqlSession sqlSession;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public void insertChnlInfo(BasketVO basketVO) throws Exception{
		
		basketDao mapper = sqlSession.getMapper(basketDao.class);
		mapper.insertChnlInfo(basketVO);		
	}
	
	@Override
	public int existChnl(String userID) throws Exception{
		
		basketDao mapper= sqlSession.getMapper(basketDao.class);
		int result=mapper.existChnl(userID);
		
		return result;
	}
	
	@Override
	public void updateChnlInfo(BasketVO basketVO) throws Exception{
		basketDao mapper= sqlSession.getMapper(basketDao.class);
		
		mapper.updateChnlInfo(basketVO);
	}

}
