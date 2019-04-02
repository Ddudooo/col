package com.col.message.service;



import java.util.List;


public interface MessageService {

	List<MessageVO> selectMsgList(String userID, int page);

	MessageVO selectMsg(int msgSeq);

	int selectMaxPage(String userID);

	List<MessageVO> selectNewMsg(String userID);

	void insertMsgSend(MessageVO msg) throws Exception;

	void updateMsgCh(String userID, int page);

	boolean deleteMsg(int msgSeq);

}
