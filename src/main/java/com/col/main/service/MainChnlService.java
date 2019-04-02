package com.col.main.service;

import com.col.board.dao.BoardcomVO;
import com.col.channel.dao.ChannelVO;
import com.col.main.dao.MainComVO;
import java.util.List;
import org.springframework.stereotype.Service;


public interface MainChnlService {
	List<ChannelVO> selectFollowChnl();

	List<ChannelVO> selectViewChnl();

	List<ChannelVO> selectVideoChnl();

	List<ChannelVO> selectChnl();

	List<ChannelVO> selectUNION();

	List<MainComVO> selectCmt(String userID);
}
