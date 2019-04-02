package com.col.main.dao;

import com.col.board.dao.BoardcomVO;
import com.col.channel.dao.ChannelVO;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainChnlDaoImpl implements MainChnlDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ChannelVO> selectFollowChnl() {
		MainChnlDao mapper = sqlSession.getMapper(MainChnlDao.class);
		return mapper.selectFollowChnl();
	}

	@Override
	public List<ChannelVO> selectViewChnl() {
		MainChnlDao mapper = sqlSession.getMapper(MainChnlDao.class);
		return mapper.selectViewChnl();
	}

	@Override
	public List<ChannelVO> selectVideoChnl() {
		MainChnlDao mapper = sqlSession.getMapper(MainChnlDao.class);
		return mapper.selectVideoChnl();
	}

	@Override
	public List<ChannelVO> selectUNION() {
		MainChnlDao mapper = sqlSession.getMapper(MainChnlDao.class);
		return mapper.selectUNION();
	}

	@Override
	public List<ChannelVO> selectChnl() {
		MainChnlDao mapper = sqlSession.getMapper(MainChnlDao.class);
		return mapper.selectChnl();
	}

	@Override
	public List<MainComVO> selectCmt(String userID) {
		MainChnlDao mapper = sqlSession.getMapper(MainChnlDao.class);
		return mapper.selectCmt(userID);
	}
}
