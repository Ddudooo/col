package com.col.channel.service;

import java.util.List;

import com.col.channel.dao.ChannelVO;
import com.col.channel.dao.VideoVO;

public interface DashBoardService {
	
	 void insertChnlInfo(ChannelVO chnlVO) throws Exception;
	 
	 int existChnl(String userID) throws Exception;
	 
	 void updateChnlInfo(ChannelVO chnlVO) throws Exception;
	 
	 void insertVideo(VideoVO videoVO)throws Exception;
	 
	 List<VideoVO> selectVideoList(String userID) throws Exception;
}
