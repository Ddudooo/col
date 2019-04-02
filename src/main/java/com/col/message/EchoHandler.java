package com.col.message;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.LogManager;
import java.util.logging.Logger;

import com.col.channel.dao.FollowVO;
import com.col.channel.service.ChannelService;
import com.col.login.service.SessionEventListenerImpl;
import com.col.message.dao.MessageDao;
import com.col.message.service.MessageService;
import com.col.message.service.MessageVO;
import com.google.gson.*;
import org.apache.ibatis.session.SqlSession;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import javax.servlet.http.HttpSession;

@Component
public class EchoHandler extends TextWebSocketHandler {

	@Autowired
	SqlSession sqlSession;

	@Autowired
	private MessageService messageService;

	@Autowired
	private ChannelService channelService;

	Map<String, WebSocketSession> connect = new ConcurrentHashMap<>();



	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map httpSession = session.getAttributes();
		if(httpSession.get("login")==null){
			return;
			//미로그인시 미작동
		}
		System.out.println("	@@@		"+"알림 웹소켓 연결됨");
		this.connect.put(String.valueOf(httpSession.get("login")),session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

	}

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("	@@@		"+"알림 웹소켓 메시지 수신");
		JsonObject returnMsg = new JsonObject();//리턴 메시지
		String msg = message.getPayload();
		System.out.println("	@@@		"+msg);
		if(isJSON(msg)){
			JsonParser parser = new JsonParser();
			JsonObject jsonMsg = parser.parse(msg).getAsJsonObject();
			System.out.println(jsonMsg.get("reciveID"));
			if(jsonMsg.get("reciveID")!= JsonNull.INSTANCE&&jsonMsg.get("reciveID")!=null){
				String reciveID = jsonMsg.get("reciveID").getAsString();
				if(!connect.containsKey(reciveID)) return;
				session = connect.get(reciveID);
				if(jsonMsg.get("comment")!=JsonNull.INSTANCE&&jsonMsg.get("comment")!=null){
					returnMsg.addProperty("comment", true);
					returnMsg.addProperty("URI", String.valueOf(jsonMsg.get("URI")));
				}else{
					returnMsg.addProperty("comment",false);
				}
				if(jsonMsg.get("follow")!=JsonNull.INSTANCE&&jsonMsg.get("follow")!=null){
					returnMsg.add("follow",jsonMsg.get("follow"));
					returnMsg.add("followID",jsonMsg.get("sendID"));
				}
			}
			if(jsonMsg.get("uploadID")!= JsonNull.INSTANCE&&jsonMsg.get("uploadID")!=null){
				System.out.println(jsonMsg.get("uploadID").getAsString());
				List<FollowVO> followList = channelService.selectMyFollower(jsonMsg.get("uploadID").getAsString());
				for(FollowVO i : followList){
					JsonObject followMsg = new JsonObject();
					followMsg.addProperty("reciveID",i.getMyFollowerID());
					followMsg.add("followUpload",jsonMsg.get("uploadID"));
					if(connect.containsKey(i.getMyFollowerID())){
						connect.get(i.getMyFollowerID()).sendMessage(new TextMessage(String.valueOf(followMsg)));
					}
				}
				return;
			}

		}else{
			System.out.println("	@@@		"+msg+" is not JSONDATA");
			return;
		}

			Map httpSession = session.getAttributes();
			String loginID = String.valueOf(httpSession.get("login"));
			List<MessageVO> newMsgCnt = messageService.selectNewMsg(loginID);
			if(newMsgCnt.size()>0){
				Gson gson = new GsonBuilder().create();
				JsonArray  msgList = gson.toJsonTree(newMsgCnt).getAsJsonArray();

				returnMsg.add("msg",msgList);
			}

		session=connect.get(loginID);
		session.sendMessage(new TextMessage(String.valueOf(returnMsg)));
	}

	public boolean isJSON(String str){
		JsonParser parser = new JsonParser();
		try{
			parser.parse(str).getAsJsonObject();
		}catch (Exception e){
			return false;
		}


		return true;
	}

}
