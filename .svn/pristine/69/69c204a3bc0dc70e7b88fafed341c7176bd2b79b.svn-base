package com.col.mypage.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.col.mypage.dao.UserInfoDao;
import com.col.register.service.UserVO;

@Service
public class UserInfoServiceImpl implements UserInfoService{
	
	@Autowired
	private UserInfoDao userInfoDao;

	
	@Override
	public String checkPassword(HashMap<String,String> map) throws Exception{
		
		String result = userInfoDao.checkPassword(map);
		
		return result;
	}
	
	@Override
	public HashMap<String,String> selectUserInfo(String userID) throws Exception{
		
		HashMap<String,String> result=new HashMap<String,String>();
		result = userInfoDao.selectUserInfo(userID);
		
		return result;
	}
	
	@Override
	public String duplicateNick(HashMap<String,String> map) throws Exception{
		
		String result= userInfoDao.duplicateNick(map);
		
		return result;
	}
	
	@Override
	public String duplicateEmail(HashMap<String,String> map) throws Exception{
		
		String result= userInfoDao.duplicateEmail(map);
		
		return result;
	}
	
	@Override
	public HashMap<String,String> selectUserPW(String userID) throws Exception{
		
		HashMap<String,String> result=userInfoDao.selectUserPW(userID);
		return result;
	}

	@Override
	public int selectUserNullCheck(String nullCheck, String userID) {


		return userInfoDao.selectUserNullCheck(nullCheck,userID);
	}

	@Override
	public void updateUserPW(HashMap<String,String> map) throws Exception{
		userInfoDao.updateUserPW(map);
	}
	
	@Override
	public void updateUserStat(String userID) throws Exception{
		userInfoDao.updateUserStat(userID);
	}
	
	@Override
	public void updateUserInfo(UserVO userVO) throws Exception{
		userInfoDao.updateUserInfo(userVO);
	}

}
