package com.col.channel.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ChannelDao {

	void insertChnl(String userID) throws Exception;

	int existChnl(String userID) throws Exception;

	void updateChnlInfo(ChannelVO chnlVO) throws Exception;

	HashMap<String,String> selectChnlInfo(String userID) throws Exception;

	List<ChannelVO> selectChnlList(Map map) throws Exception;
	
	VideoVO selectVideoDetails(HashMap<String,String> map) throws Exception;
	
	int existFollow(HashMap<String,String> map) throws Exception;
	
	void insertFollow(HashMap<String,String> map) throws Exception;
	
	void deleteFollow(HashMap<String,String> map) throws Exception;
	
	List<FollowVO> selectMyFollower(String followChannel) throws Exception;
	
	List<FollowVO> selectMyFollowing(String followUser) throws Exception;
	
	int selectCntFollower(String followChannel) throws Exception;
	
	int selectCntFollowing(String followUser) throws Exception;

}

