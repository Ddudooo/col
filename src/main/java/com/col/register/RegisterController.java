package com.col.register;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.col.channel.service.ChannelService;
import com.col.register.service.RegisterService;
import com.col.register.service.UserVO;

@Controller
public class RegisterController {
	
	@Autowired
	private RegisterService registerService;
	
	@Autowired
	private ChannelService chnlService;


	@RequestMapping(value="/register/form")
	public String registerForm(){
		return "register/regForm.tiles";
	}
	@RequestMapping(value="/register/welcome")
	public String welcome(){
		return "register/regComplete.tiles";
	}

	@RequestMapping(value = "/register")
	@ResponseBody
	public String register(@RequestParam("userID") String userID,
						   @RequestParam("userEmail") String userEmail,
						   @RequestParam("userName") String userName,
						   @RequestParam("userNick") String userNick,
						   @RequestParam("userPW") String userPW,
						    HttpSession session	) throws Exception {

		UserVO userVO = new UserVO();
		userVO.setUserID(userID);
		userVO.setUserEmail(userEmail);
		userVO.setUserName(userName);
		userVO.setUserNick(userNick);
		userVO.setUserPW(userPW);

		//유효성 검사 추가 하기
		//빈 입력값 검사
		if(!"NO_BLANK".equals(isBlankUserVO(userVO))){
			return "/register/form?blankinfo="+isBlankUserVO(userVO);
		}

		if(registerService.selectReg(userVO)>0){
			//이미 가입된 정보가 존재함.
			return "/register/form?failinfo=already";
		}

		if(userVO.getUserID().length() < 4 || userVO.getUserID().length() > 16){
			// Exception이 아닌 오류메세지(defaulutMessage)를 띄움
			return "/register/form?failinfo=userIDlength";
		}else if(!isValidEmail(userVO.getUserEmail())){
			return "/register/form?failinfo=userEmailvalid";
		}else if(userVO.getUserNick().length()<2||userVO.getUserNick().length()>16){
			return "/register/form?failinfo=userNicklength";
		}
		//유효성 검사 끝

		if(registerService.insertReg(userVO)){
			
			session.setAttribute("login", userID);
			chnlService.insertChnl(userID);
			
			return "/register/welcome";
		}


		return "/register/form";
	}
	public String isBlankUserVO(UserVO userVO){
		//userVO 필수 입력 항목 데이터 비어있는지 확인

		if(StringUtils.isBlank(userVO.getUserID())){
			return "userID";
		}else if(StringUtils.isBlank(userVO.getUserEmail())){
			return "userEmail";
		}else if(StringUtils.isBlank(userVO.getUserName())){
			return "userName";
		}else if(StringUtils.isBlank(userVO.getUserPW())){
			return "userPW";
		}


		return "NO_BLANK";
	}
	//EMail 검사용
	public boolean isValidEmail(String email) {
		boolean err = false;
		String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(email);
		if(m.matches()) {
			err = true;
		}
		return err;
	}
	@RequestMapping(value="/register/checkID", method=RequestMethod.POST ,produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkID(@RequestParam String userID) {
		System.out.println("checkID data input - "+userID);
		UserVO userVO = new UserVO();
		userVO.setUserID(userID);
		if(registerService.selectReg(userVO)!=0) {
			return "이미 사용중입니다.";
		}
		return " ";
	}
	@RequestMapping(value="/register/checkEmail", method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkEmail(@RequestParam String userEmail) {
		System.out.println("checkEmail data input - "+userEmail);
		UserVO userVO = new UserVO();
		userVO.setUserEmail(userEmail);
		if(registerService.selectReg(userVO)!=0) {
			return "이미 사용중입니다.";
		}
		return " ";
	}
	
	@RequestMapping(value="/register/checkNick", method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkNick(@RequestParam String userNick) {
		System.out.println("checkNick data input - "+userNick);
		UserVO userVO = new UserVO();
		userVO.setUserNick(userNick);
		if(registerService.selectReg(userVO)!=0) {
			return "이미 등록된 닉네임입니다"; 
		}
		return  " ";
	}
}
