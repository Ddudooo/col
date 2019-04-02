package com.col.mypage.service;

import java.util.HashMap;

import com.col.register.service.UserVO;

public interface UserInfoService {

	String checkPassword(HashMap<String,String> map) throws Exception;
	
	HashMap<String,String> selectUserInfo(String userID) throws Exception;

	String duplicateNick(HashMap<String,String> map) throws Exception;
	
	String duplicateEmail(HashMap<String,String> map) throws Exception;
	
	HashMap<String,String> selectUserPW(String userID) throws Exception;

	int selectUserNullCheck(String nullCheck, String userID);
	
	void updateUserPW(HashMap<String,String> map) throws Exception;
	
	void updateUserStat(String userID) throws Exception;
	
	void updateUserInfo(UserVO userVO) throws Exception;
}
