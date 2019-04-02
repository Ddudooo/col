package com.col.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.col.login.dao.LoginDao;
import com.col.register.service.UserVO;

@Service
@Transactional(readOnly = true)
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginDao loginDao;

    @Override
    public int login(UserVO userVO) {

        return loginDao.login(userVO);
    }

    @Override
	public String findID(UserVO userVO) {
		// TODO Auto-generated method stub
		return loginDao.findID(userVO);
	}

	@Override
	public String findPW(UserVO userVO) {
		// TODO Auto-generated method stub
		return loginDao.findPW(userVO);
	}

	@Override
	public void updatePW(UserVO userVO) {
		// TODO Auto-generated method stub
		loginDao.updatePW(userVO);
		
	}
}
