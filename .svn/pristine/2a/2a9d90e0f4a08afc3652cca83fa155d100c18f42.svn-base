package com.col.message;

import com.col.message.service.MessageService;
import com.col.message.service.MessageVO;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.col.mypage.service.MypageService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;



	@RequestMapping(value = "message/send", method = RequestMethod.POST)
	@ResponseBody
	public String msgSend(@RequestParam("msgReciveID")String msgReciveID,
						  @RequestParam("msgContent")String msgContent,
						  HttpSession session) {
		if(session.getAttribute("login")==null){
			return session.getServletContext().getContextPath();
		}
		MessageVO sendMsg = new MessageVO();
		sendMsg.setMsgSendID(String.valueOf(session.getAttribute("login")));
		sendMsg.setMsgReciveID(msgReciveID);
		sendMsg.setMsgContent(msgContent);
		try {
			msgService.insertMsgSend(sendMsg);
		} catch (Exception e) {
			System.out.println("	@@@		"+e);
			System.out.println("	@@@		"+"insertMsgError");
		}
		return "success";
	}
	@RequestMapping(value = "message/view")
	@ResponseBody
	public JsonObject msgView(@RequestParam("msgSeq")String msgSeq) {
		MessageVO selectMsg =msgService.selectMsg(Integer.parseInt(msgSeq));
		JsonObject json = new JsonObject();
		JsonParser parser = new JsonParser();
		json.add("msgContent",parser.parse(selectMsg.getMsgContent()));
		json.add("msgSendID",parser.parse(selectMsg.getMsgSendID()));
		return json;
	}
	@RequestMapping(value="message/delete", method=RequestMethod.POST)
	@ResponseBody
	public String msgDelete(@RequestParam("msgSeq") String msgSeq){
		if(msgService.deleteMsg(Integer.parseInt(msgSeq))){
			return "success";
		}
		return "fail";
	}

	
	@RequestMapping(value = "/message/list")
	public String msgList(@RequestParam(value="page",required = false) String page,
			HttpServletRequest req,
							  HttpSession session) {
		if(session.getAttribute("login")==null){
			return "redirect:/";
		}
		String loginID = String.valueOf(session.getAttribute("login"));
		int resPage = 0;
		if (page == null) resPage = 1 ;
		else resPage = Integer.parseInt(page);

		List<MessageVO> msgList = msgService.selectMsgList(loginID,(resPage-1)*10);
		msgService.updateMsgCh(loginID,(resPage-1)*10);
		req.setAttribute("msgList",msgList);
		req.setAttribute("startPage",(resPage-5<=1?1:resPage-5));
		req.setAttribute("page",resPage);
		req.setAttribute("maxPage",msgService.selectMaxPage(loginID));
		return "message/messageList.tiles";

	}

	
}
