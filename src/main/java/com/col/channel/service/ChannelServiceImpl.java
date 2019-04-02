package com.col.channel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.col.channel.dao.ChannelDao;
import com.col.channel.dao.ChannelVO;
import com.col.channel.dao.FollowVO;
import com.col.channel.dao.VideoVO;


@Service
public class ChannelServiceImpl implements ChannelService {

    @Autowired
    private ChannelDao channelDao;


    @Override
    public void insertChnl(String userID) throws Exception{
        channelDao.insertChnl(userID);
    }

    @Override
    public int existChnl(String userID) throws Exception{

        int result= channelDao.existChnl(userID);
        return result;
    }

    @Override
    public void updateChnlInfo(ChannelVO chnlVO) throws Exception{
        channelDao.updateChnlInfo(chnlVO);
    }

    @Override
    public HashMap<String,String> selectChnlInfo(String userID) throws Exception{
        return channelDao.selectChnlInfo(userID);

    }

    @Override
    public List<ChannelVO> selectChnlList(Map map) throws Exception{
        return channelDao.selectChnlList(map);
    }
    
    @Override
    public VideoVO selectVideoDetails(HashMap<String,String> map) throws Exception{
    	return channelDao.selectVideoDetails(map);
    			
    }
    
    @Override
    public int existFollow(HashMap<String,String> map) throws Exception{
    	return channelDao.existFollow(map);
    }
    
    @Override
    public void insertFollow(HashMap<String,String> map) throws Exception{
    	channelDao.insertFollow(map);
    }
    
    @Override
    public void deleteFollow(HashMap<String,String> map) throws Exception{
    	channelDao.deleteFollow(map);
    }

    @Override
    public List<FollowVO> selectMyFollower(String followChannel) throws Exception{
    	return channelDao.selectMyFollower(followChannel);
    }
    
    @Override
    public List<FollowVO> selectMyFollowing(String followUser) throws Exception{
    	return channelDao.selectMyFollowing(followUser);
    }
    
    @Override
    public HashMap<String,String> settingFollowInfo(String userID) throws Exception{
    	HashMap<String, String> followInfo = new HashMap<>();
		followInfo.put("cntFollower",channelDao.selectCntFollower(userID)+"");
		followInfo.put("cntFollowing",channelDao.selectCntFollowing(userID)+"");
		
		return followInfo;
    }
}