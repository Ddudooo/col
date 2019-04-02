package com.col.register.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.col.register.dao.RegisterDao;

@Service
@Transactional(readOnly = true)
public class RegisterServiceImpl implements RegisterService{
	@Autowired
    private RegisterDao registerDao;
	
	
	@Override
	public int selectReg(UserVO userVO) {
		
		return registerDao.selectReg(userVO);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public boolean insertReg(UserVO userVO) {
		try {
			registerDao.insertReg(userVO);
		}catch(Exception e) {
			System.out.println(e);
			return false;
		}
        return true;
	}


	

}
