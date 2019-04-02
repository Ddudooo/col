package com.col.channel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.col.channel.dao.ChannelVO;
import com.col.channel.dao.DashBoardDao;
import com.col.channel.dao.VideoVO;

@Service
public class DashBoardServiceImpl implements DashBoardService{

	@Autowired
	private DashBoardDao dashBoardDao;
	
	@Override
	 public void insertChnlInfo(ChannelVO chnlVO) throws Exception{
		dashBoardDao.insertChnlInfo(chnlVO);
	 }

	@Override
	public int existChnl(String userID) throws Exception{
		
		int result= dashBoardDao.existChnl(userID);
		return result;
	}
	
	@Override
	public void updateChnlInfo(ChannelVO chnlVO) throws Exception{
		dashBoardDao.updateChnlInfo(chnlVO);
	}
	
	@Override
	public void insertVideo(VideoVO videoVO)throws Exception{
		 dashBoardDao.insertVideo(videoVO);

	}
	
	@Override
	public List<VideoVO> selectVideoList(String userID) throws Exception{
		
		return dashBoardDao.selectVideoList(userID);
	}
}
