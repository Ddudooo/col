package com.col.main;

import com.col.board.dao.BoardcomVO;
import com.col.channel.dao.ChannelVO;
import com.col.main.dao.MainComVO;
import com.col.main.service.MainChnlService;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.col.login.service.LoginService;
import com.col.register.service.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	private MainChnlService mainChnlService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model, HttpServletRequest req, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		System.out.println("heap memory: "+Runtime.getRuntime().maxMemory());
		List<ChannelVO> mainChnl = mainChnlService.selectUNION();
//		List selectChnl = mainChnlService.selectChnl();
//		if(mainChnl.size()<5){
//			mainChnl.addAll(selectChnl);
//		}
		for(ChannelVO i: mainChnl){
			System.out.println("    @@@     "+i.getUserID());

		}
		req.setAttribute("mainChnl",mainChnl);
		if(session.getAttribute("login")!=null){
			List<MainComVO> userCmt = mainChnlService.selectCmt(session.getAttribute("login").toString());
			req.setAttribute("userCmt", userCmt);
		}
		return "main/main.tiles";
	}
	
	@RequestMapping(value="/main/faq")
	public String faq() {
		return "main/faq.tiles";
	}
	
	@RequestMapping(value="/main/aboutUs")
	public String aboutUs() {
		
		return "main/aboutUs.tiles";
	}
	
	@RequestMapping(value="/login/findIdForm")
	public String findPW() {
		return "login/findIdForm.tiles";
	}
	
}