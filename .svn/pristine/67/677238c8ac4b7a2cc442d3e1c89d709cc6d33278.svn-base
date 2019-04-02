package com.col.main.service;

import com.col.board.dao.BoardcomVO;
import com.col.channel.dao.ChannelVO;
import com.col.main.dao.MainChnlDao;
import com.col.main.dao.MainComVO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainChnlServiceImpl implements MainChnlService{

	@Autowired
	private MainChnlDao mainChnlDao;

	@Override
	public List<ChannelVO> selectFollowChnl() {
		return mainChnlDao.selectFollowChnl();
	}

	@Override
	public List<ChannelVO> selectViewChnl() {
		return mainChnlDao.selectViewChnl();
	}

	@Override
	public List<ChannelVO> selectVideoChnl() {
		return mainChnlDao.selectVideoChnl();
	}

	@Override
	public List<ChannelVO> selectChnl() {
		return mainChnlDao.selectChnl();
	}

	@Override
	public List<ChannelVO> selectUNION() {
		return mainChnlDao.selectUNION();
	}

	@Override
	public List<MainComVO> selectCmt(String userID) {
		return mainChnlDao.selectCmt(userID);
	}
}
