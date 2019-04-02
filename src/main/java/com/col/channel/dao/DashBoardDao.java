package com.col.channel.dao;

import java.util.List;

public interface DashBoardDao {
	
	 void insertChnlInfo(ChannelVO chnlVO) throws Exception;
	 
	 int existChnl(String userID) throws Exception;
	 
	 void updateChnlInfo(ChannelVO chnlVO) throws Exception;
	 
	 void insertVideo(VideoVO videoVO) throws Exception;
	 
	 List<VideoVO> selectVideoList(String userID) throws Exception;

}
