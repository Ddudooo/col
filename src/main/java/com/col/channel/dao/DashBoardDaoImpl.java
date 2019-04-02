package com.col.channel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class DashBoardDaoImpl implements DashBoardDao{
	
	@Autowired
    private SqlSession sqlSession;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public void insertChnlInfo(ChannelVO chnlVO) throws Exception{
		
		DashBoardDao mapper = sqlSession.getMapper(DashBoardDao.class);
		mapper.insertChnlInfo(chnlVO);		
	}
	
	@Override
	public int existChnl(String userID) throws Exception{
		
		DashBoardDao mapper= sqlSession.getMapper(DashBoardDao.class);
		int result=mapper.existChnl(userID);
		
		return result;
	}
	
	@Override
	public void updateChnlInfo(ChannelVO chnlVO) throws Exception{
		DashBoardDao mapper= sqlSession.getMapper(DashBoardDao.class);
		
		mapper.updateChnlInfo(chnlVO);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public void insertVideo(VideoVO videoVO) throws Exception{
		DashBoardDao mapper=sqlSession.getMapper(DashBoardDao.class);
		mapper.insertVideo(videoVO);
	}
	
	@Override
	public List<VideoVO> selectVideoList(String userID) throws Exception{
		DashBoardDao mapper=sqlSession.getMapper(DashBoardDao.class);
		return mapper.selectVideoList(userID);
	}

}
