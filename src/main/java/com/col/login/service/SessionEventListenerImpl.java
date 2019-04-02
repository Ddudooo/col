package com.col.login.service;

import java.util.Enumeration;
import java.util.Hashtable;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionEventListenerImpl implements HttpSessionListener, HttpSessionAttributeListener {

	private static SessionEventListenerImpl sessionEventListener=new SessionEventListenerImpl();

	public static SessionEventListenerImpl getInstance() {
		if(sessionEventListener==null){
			sessionEventListener = new SessionEventListenerImpl();
		}
		return sessionEventListener;
	}

	private static Hashtable loginUser = new Hashtable();

	public static Hashtable getLoginUser(){
		return loginUser;
	}


	@Override
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		System.out.println("    ###     세션 생성됨");

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
			HttpSession session = event.getSession();

			System.out.println("    ###     "+"세션 만료됨");
			if(session.getAttribute("login")!=null){
				System.out.println("    ###     "+"세션 만료로 인한 "+session.getAttribute("login")+" 로그아웃");
			}
			session.invalidate();
			synchronized (loginUser){
				loginUser.remove(session.getId());
			}
	}



	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		Enumeration enumeration = loginUser.keys();
		if("login".equals(event.getName())){
			//System.out.println("    ###     "+event.getValue()+" 로그인");
			while(enumeration.hasMoreElements()){
				HttpSession registeredSession = (HttpSession) enumeration.nextElement();
				String loginID = (String) registeredSession.getAttribute("login");
				if(loginID!=null) {

					if (event.getValue().equals(registeredSession.getAttribute("login"))) {
						System.out.println("    ###     " + "기존세션 삭제");
						registeredSession.invalidate();
						loginUser.remove(registeredSession);
						System.out.println("    ###     " + "기존세션 삭제됨");
//				System.out.println("    ###     "+event.getName()+"님 로그인");

					}

				}
			}
			loginUser.put( event.getSession(),event.getValue());
			System.out.println("    ###     "+event.getValue()+"님 로그인");

			System.out.println("    ###     "+"현재 접속자 수 "+loginUser.size());
		}

	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		if(event.getName().equals("login")) {
			System.out.println("	###		" + event.getValue() + " 로그아웃!");

			loginUser.remove(event.getSession());

			System.out.println("    ###     " + "현재 접속자 수 " + loginUser.size());
		}
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		attributeReplaced(event);
	}
}