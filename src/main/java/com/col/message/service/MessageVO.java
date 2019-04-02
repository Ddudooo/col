package com.col.message.service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class MessageVO {
	private int msgSeq;
	private String msgSendID;
	private String msgReciveID;
	private String msgContent;
	private String msgRegDate;
	private String msgCh;

	public int getMsgSeq() {
		return msgSeq;
	}

	public void setMsgSeq(int msgSeq) {
		this.msgSeq = msgSeq;
	}

	public String getMsgSendID() {
		return msgSendID;
	}

	public void setMsgSendID(String msgSendID) {
		this.msgSendID = msgSendID;
	}

	public String getMsgReciveID() {
		return msgReciveID;
	}

	public void setMsgReciveID(String msgReciveID) {
		this.msgReciveID = msgReciveID;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getMsgRegDate() {
		return msgRegDate;
	}

	public void setMsgRegDate(String msgRegDate) {
		this.msgRegDate = String.format(msgRegDate, "yymmdd HH:MM");
	}

	public String getMsgCh() {
		return msgCh;
	}

	public void setMsgCh(String msgCh) {
		this.msgCh = msgCh;
	}
}
