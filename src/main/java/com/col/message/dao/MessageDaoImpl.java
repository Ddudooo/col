package com.col.message.dao;

import com.col.message.service.MessageVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MessageDaoImpl implements MessageDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MessageVO> selectMsgList(String userID, int page) {
		MessageDao mapper = sqlSession.getMapper(MessageDao.class);
		return mapper.selectMsgList(userID, page);
	}

	@Override
	public MessageVO selectMsg(int msgSeq) {
		MessageDao mapper = sqlSession.getMapper(MessageDao.class);
		return mapper.selectMsg(msgSeq);
	}

	@Override
	public int selectMaxPage(String userID) {
		MessageDao mapper = sqlSession.getMapper(MessageDao.class);
		return mapper.selectMaxPage(userID);
	}

	@Override
	public List<MessageVO> selectNewMsg(String userID) {
		MessageDao mapper = sqlSession.getMapper(MessageDao.class);
		return mapper.selectNewMsg(userID);
	}

	@Override
	public void insertMsgSend(MessageVO msg) {
		MessageDao mapper = sqlSession.getMapper(MessageDao.class);
		mapper.insertMsgSend(msg);
	}

	@Override
	public void updateMsgCh(String userID, int page) {
		MessageDao mapper = sqlSession.getMapper(MessageDao.class);
		mapper.updateMsgCh(userID,page);
	}

	@Override
	public boolean deleteMsg(int msgSeq) {
		MessageDao mapper = sqlSession.getMapper(MessageDao.class);
		return mapper.deleteMsg(msgSeq);
	}
}
