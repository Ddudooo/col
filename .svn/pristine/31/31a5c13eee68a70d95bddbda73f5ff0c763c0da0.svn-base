package com.col.register.dao;

import com.col.register.service.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegisterDaoImpl implements RegisterDao{

	@Autowired
    private SqlSession sqlSession;
	
	@Override
	public int selectReg(UserVO userVO) {
		RegisterDao mapper = sqlSession.getMapper(RegisterDao.class);
	     return mapper.selectReg(userVO);
	}
	
	@Override
	public boolean insertReg(UserVO userVO) {
		 RegisterDao mapper = sqlSession.getMapper(RegisterDao.class);
	     return mapper.insertReg(userVO);
	}


}
