package com.col.login.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.col.register.service.UserVO;

@Repository
public class LoginDaoImpl implements LoginDao{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int login(UserVO userVO) {
        LoginDao mapper = sqlSession.getMapper(LoginDao.class);
        return mapper.login(userVO);
    }

	@Override
	public String findID(UserVO userVO) {
		 LoginDao mapper = sqlSession.getMapper(LoginDao.class);
	     return mapper.findID(userVO);
	}
	
	@Override
	public String findPW(UserVO userVO) {
		LoginDao mapper = sqlSession.getMapper(LoginDao.class);
	    return mapper.findPW(userVO);
	}

	@Override
	public void updatePW(UserVO userVO) {
		// TODO Auto-generated method stub
		LoginDao mapper = sqlSession.getMapper(LoginDao.class);
		mapper.updatePW(userVO);
	}
	
}
