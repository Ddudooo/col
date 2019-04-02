package com.col.message.service;

import com.col.message.dao.MessageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDao messageDao;

	@Override
	public List<MessageVO> selectMsgList(String userID, int page) {
		return messageDao.selectMsgList(userID,page);
	}

	@Override
	public MessageVO selectMsg(int msgSeq) {
		return messageDao.selectMsg(msgSeq);
	}

	@Override
	public int selectMaxPage(String userID) {
		return messageDao.selectMaxPage(userID);
	}

	@Override
	public List<MessageVO> selectNewMsg(String userID) {
		return messageDao.selectNewMsg(userID);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public void insertMsgSend(MessageVO msg)throws Exception {
		messageDao.insertMsgSend(msg);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public void updateMsgCh(String userID, int page) {
		messageDao.updateMsgCh(userID,page);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public boolean deleteMsg(int msgSeq) {
		return messageDao.deleteMsg(msgSeq);
	}
}
