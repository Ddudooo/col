package com.col.mypage.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.col.register.service.UserVO;

@Repository
public class UserInfoDaoImpl implements UserInfoDao {

	@Autowired
    private SqlSession sqlSession;
	
	@Override
	public String checkPassword(HashMap<String,String> map) throws Exception{
		
		UserInfoDao mapper=sqlSession.getMapper(UserInfoDao.class);
		
		return mapper.checkPassword(map);
	}
	
	@Override
	public HashMap<String,String> selectUserInfo(String userID) throws Exception{
		UserInfoDao mapper=sqlSession.getMapper(UserInfoDao.class);
		
		return mapper.selectUserInfo(userID);
	}
	
	@Override
	public String duplicateNick(HashMap<String,String> map) throws Exception{
		UserInfoDao mapper=sqlSession.getMapper(UserInfoDao.class);
		
		return mapper.duplicateNick(map);
	}
	
	@Override
	public String duplicateEmail(HashMap<String,String> map) throws Exception{
		UserInfoDao mapper=sqlSession.getMapper(UserInfoDao.class);
		
		return mapper.duplicateEmail(map);
	}
	
	@Override
	public HashMap<String,String> selectUserPW(String userID) throws Exception{
		UserInfoDao mapper=sqlSession.getMapper(UserInfoDao.class);
		return mapper.selectUserPW(userID);
	}

	@Override
	public int selectUserNullCheck(String nullCheck, String userID) {
		UserInfoDao mapper=sqlSession.getMapper(UserInfoDao.class);
		return mapper.selectUserNullCheck(nullCheck,userID);
	}

	@Override
	public void updateUserPW(HashMap<String,String> map) throws Exception{
		UserInfoDao mapper=sqlSession.getMapper(UserInfoDao.class);
		mapper.updateUserPW(map);
	}
	
	@Override
	public void updateUserStat(String userID) throws Exception{
		UserInfoDao mapper=sqlSession.getMapper(UserInfoDao.class);
		mapper.updateUserStat(userID);
	}
	
	@Override
	public void updateUserInfo(UserVO userVO) throws Exception{
		UserInfoDao mapper=sqlSession.getMapper(UserInfoDao.class);
		mapper.updateUserInfo(userVO);
	}
	
}
