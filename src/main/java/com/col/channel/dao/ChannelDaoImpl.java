package com.col.channel.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class ChannelDaoImpl implements ChannelDao{
	
	@Autowired
    private SqlSession sqlSession;
	

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public void insertChnl(String userID) throws Exception{
	
		ChannelDao mapper = sqlSession.getMapper(ChannelDao.class);
		mapper.insertChnl(userID);	
	}
		
	@Override
	public int existChnl(String userID) throws Exception{
		
		ChannelDao mapper= sqlSession.getMapper(ChannelDao.class);
		int result=mapper.existChnl(userID);
		
		return result;
	}
	
	@Override
	public void updateChnlInfo(ChannelVO chnlVO) throws Exception{
		ChannelDao mapper= sqlSession.getMapper(ChannelDao.class);
		
		mapper.updateChnlInfo(chnlVO);
	}
	
	@Override
	public HashMap<String,String> selectChnlInfo(String userID) throws Exception{
		ChannelDao mapper=sqlSession.getMapper(ChannelDao.class);
		
		return mapper.selectChnlInfo(userID);
	}
	
	
	@Override
	public List<ChannelVO> selectChnlList(Map map) throws Exception{
		ChannelDao mapper=sqlSession.getMapper(ChannelDao.class);
		
		return mapper.selectChnlList(map);
	}
	
	@Override
	public VideoVO selectVideoDetails(HashMap<String,String> map) throws Exception{
		ChannelDao mapper=sqlSession.getMapper(ChannelDao.class);
		
		return mapper.selectVideoDetails(map);
	}
	
	@Override
	public int existFollow(HashMap<String,String> map) throws Exception{
		ChannelDao mapper=sqlSession.getMapper(ChannelDao.class);
		return mapper.existFollow(map);
	}
	
	@Override
	public void insertFollow(HashMap<String,String> map) throws Exception{
		ChannelDao mapper=sqlSession.getMapper(ChannelDao.class);
		 mapper.insertFollow(map);
	}
	
	@Override
	public void deleteFollow(HashMap<String,String> map) throws Exception{
		ChannelDao mapper=sqlSession.getMapper(ChannelDao.class);
		mapper.deleteFollow(map);
	}
	
	@Override
	public List<FollowVO> selectMyFollower(String followChannel) throws Exception{
		ChannelDao mapper=sqlSession.getMapper(ChannelDao.class);
		
		return mapper.selectMyFollower(followChannel);
	}
	
	@Override
	public List<FollowVO> selectMyFollowing(String followUser) throws Exception{
		ChannelDao mapper=sqlSession.getMapper(ChannelDao.class);
		return mapper.selectMyFollowing(followUser);
	}

	@Override
	public int selectCntFollower(String followChannel) throws Exception{
		ChannelDao mapper=sqlSession.getMapper(ChannelDao.class);
		return mapper.selectCntFollower(followChannel);
	}
	
	
	@Override
	public int selectCntFollowing(String followUser) throws Exception{
		ChannelDao mapper=sqlSession.getMapper(ChannelDao.class);
		return mapper.selectCntFollowing(followUser);
	}

}
