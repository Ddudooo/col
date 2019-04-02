package com.col.channel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.col.channel.dao.ChannelVO;
import com.col.channel.dao.FollowVO;
import com.col.channel.dao.VideoVO;

public interface ChannelService {

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
    
    HashMap<String,String> settingFollowInfo(String userID) throws Exception;
}