package com.col.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.col.board.dao.BoardVO;
import com.col.mypage.dao.MypageDao;
import com.col.register.service.UserVO;


@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDao mypageDao;
	
	@Override
	public List<BoardVO> selectMyBoardList(String userID) throws Exception{
		return mypageDao.selectMyBoardList(userID);
	}
	
	@Override
	public UserVO selectUser(String userID) throws Exception{
		
		return mypageDao.selectUser(userID);
	}

}
