package com.col.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.col.board.dao.BoardVO;
import com.col.register.service.UserVO;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Autowired
    private SqlSession sqlSession;
	
	@Override
	public List<BoardVO> selectMyBoardList(String userID) throws Exception{
		MypageDao mapper=sqlSession.getMapper(MypageDao.class);
		return mapper.selectMyBoardList(userID); 
	}
	
	@Override
	public UserVO selectUser(String userID) throws Exception{
		MypageDao mapper=sqlSession.getMapper(MypageDao.class);
		return mapper.selectUser(userID);
	}

}
