package com.col.message.dao;

import com.col.message.service.MessageVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageDao {
//	SELECT
	List<MessageVO> selectMsgList(@Param("userID") String userID,@Param("page") int page);

	MessageVO selectMsg(int msgSeq);

	int selectMaxPage(String userID);

	List<MessageVO> selectNewMsg(String userID);
//	INSERT
	void insertMsgSend(MessageVO msg);

//	UPDATE
	void updateMsgCh(@Param("userID")String userID, @Param("page") int page);
//	DELETE
	boolean deleteMsg(int msgSeq);


}
