package com.col.mypage;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.col.board.dao.BoardVO;
import com.col.mypage.service.MypageService;
import com.col.mypage.service.UserInfoService;
import com.col.register.service.UserVO;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private MypageService mypageService;
	
	HttpSession session=null;
	
	@RequestMapping
	public String mypage(HttpServletRequest req, HttpServletResponse res,ModelMap map) throws Exception {
		
		return "mypage/mypage.tiles";
		
	}
	
	@RequestMapping(value="/infoUpdate")
	public String userInfoUpdatePage(HttpServletRequest req, HttpServletResponse res, ModelMap map) throws Exception {

		session = req.getSession(false);
		String userID= (String) session.getAttribute("login");
		
		HashMap<String,String> userInfo=new HashMap<String,String>();
		userInfo = userInfoService.selectUserInfo(userID);
		
		String userImagePath = "";
		int pathStartIndex = userInfo.get("userImg").indexOf("resources");
		
		System.out.println("path_start_index: "+pathStartIndex);
		if(pathStartIndex > -1){
			// 파일업로드경로 가지고 오기.
			System.out.println(userInfo.get("userImg").substring(pathStartIndex));
			userImagePath = userInfo.get("userImg").substring(pathStartIndex);
		} else {
			// 대표이미지 없으면 기본이미지 가져오기.
			userImagePath = "resources/images/unknown2.jpg";
		}
		
		userInfo.replace("userImg", userImagePath);
		
		System.out.println("userInfo.get(\"userImg\"): "+userInfo.get("userImg"));
		
		map.addAttribute("userInfo",userInfo);
	
		return "mypage/userInfoUpdate.tiles";
	}
	
	@RequestMapping(value="/updateUserInfo")
	public String userInfoUpdate(HttpServletRequest req, HttpServletResponse res, ModelMap map, MultipartFile file) throws Exception {
		
		session = req.getSession(false);
		String userID= (String) session.getAttribute("login");
		
		UserVO userVO=new UserVO();
		userVO.setUserID(userID);
		userVO.setUserNick(req.getParameter("userNick"));
		userVO.setUserEmail(req.getParameter("userEmail"));
		userVO.setUserInter(Integer.parseInt(req.getParameter("userInter")));
		

		PrintWriter out = null;
		String userImgFilePath="";
		if(file.isEmpty()){
			System.out.println("대표이미지 업로드 없음.");

		} else {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html;charset=utf-8");
			out = res.getWriter();
			//String uploadPath=req.getSession().getServletContext().getContextPath();
			String uploadPath="C:\\workspace_spring\\CoL\\src\\main\\webapp\\";
			String uploadPath2="resources\\fileUpload\\userImg";
	
		
		    out.println("절대경로 : " +  uploadPath);
		    
		    UUID uuid = UUID.randomUUID(); // 중복되지 않는 랜덤값 생성
			String org_filename = file.getOriginalFilename();
			String str_filename = uuid.toString() + org_filename;
			System.out.println("org_filename: "+org_filename);
			System.out.println("str_filename: "+str_filename);
			userImgFilePath=uploadPath2+ "\\" +str_filename;
			String filePath = uploadPath +userImgFilePath;
			
			
			File f = new File(filePath);
			try {
				if(!f.exists()){
					f.mkdirs();
				}
			} catch (Exception e) {
				System.out.println("업로드 파일 경로 생성 실패.");
			}
			file.transferTo(f);
			userVO.setUserImg(filePath);
			
		}
		userInfoService.updateUserInfo(userVO);

		String userImagePath="resources/images/unknown2.jpg";
	     if(userVO.getUserImg()!=""){
	    	 userImagePath = userImgFilePath;
	        
	     }
		session.removeAttribute("loginUserNick");
		session.removeAttribute("loginUserImg");
		
        session.setAttribute("loginUserNick", userVO.getUserNick());
        session.setAttribute("loginUserImg",userImagePath);
        
        
        System.out.println("userImagePath: "+userImagePath);
        
		return "redirect:/mypage/infoUpdate";
	}
	
	@RequestMapping(value="/pwdCheck")
	@ResponseBody
	public String pwdCheck(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		session = req.getSession(false);
		HashMap<String, String> map = new HashMap<>();
		
		map.put("password", req.getParameter("password"));
		map.put("userID", (String) session.getAttribute("login"));
		
		String result = userInfoService.checkPassword(map);
		System.out.println("결과:"+ result);
		return result;
	}
	
	@RequestMapping(value="/duplicateNick")
	@ResponseBody
	public String dupConfirmNick(@RequestParam("userNick") String userNick) throws Exception {
		HashMap<String, String> map=new HashMap<>();
		map.put("userNick",userNick);
		
		String result=userInfoService.duplicateNick(map);
		System.out.println(result);
		
		return result;
	}
	
	
	@RequestMapping(value="/duplicateEmail")
	@ResponseBody
	public String dupConfirmEmail(@RequestParam("userEmail") String userEmail) throws Exception{
		HashMap<String, String> map=new HashMap<>();
		map.put("userEmail",userEmail);
		String result=userInfoService.duplicateEmail(map);
		
		return result;
	}
	
	@RequestMapping(value="/pwUpdate")
	public String userPWUpdate(HttpServletRequest req, ModelMap map) throws Exception {
		
		session = req.getSession(false);
		String userID= (String) session.getAttribute("login");
		HashMap<String,String> userPWMap=new HashMap<String,String>();
		userPWMap = userInfoService.selectUserPW(userID);
		
		map.addAttribute("userPWMap", userPWMap);
		
		return "mypage/userPWUpdate.tiles";
	}
	
	@RequestMapping(value="/updatePWCom")
	public void updatePWCom(HttpServletRequest req,HttpServletResponse res) throws Exception{
		
		session=req.getSession(false);
		String userID= (String) session.getAttribute("login");
		String userNewPW= req.getParameter("userNewPW");
		HashMap<String,String> userMap=new HashMap<String,String>();
		userMap.put("userID", userID);
		userMap.put("userNewPW", userNewPW);
		
		userInfoService.updateUserPW(userMap);

	}
	
	@RequestMapping(value="/deleteUser")
	public void updateUserStat(HttpServletRequest req, HttpServletResponse res) throws Exception{
		session=req.getSession(false);
		String userID= (String) session.getAttribute("login");
		
		userInfoService.updateUserStat(userID);
		session.invalidate();
		
	}
	
	@RequestMapping(value="/exitCompleted")
	public String deleteCompleted() {
		
		return "mypage/exitCompleted.tiles";
	}
	
	@RequestMapping(value="/userDelete")
	public String userDelete() {
		
		return "mypage/userDelete.tiles";
	}
	
	@RequestMapping(value="/videoList")
	public String myVideo() {
		
		return "mypage/myVideo.tiles";
	}
	
	@RequestMapping(value="/paymentList")
	public String myPayment() {
		
		return "mypage/myPayment.tiles";
	}

	
	@RequestMapping(value="/boardList" ,produces="text/json; charset=UTF-8" )
	public String myBoard(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		return "mypage/myBoard.tiles";
	}
	
	@RequestMapping(value="/selectMyBoard" ,produces="text/json; charset=UTF-8" )
	@ResponseBody
	public String selectMyBoardList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		session = req.getSession(false);
		String userID= (String) session.getAttribute("login");
		List<BoardVO> list=mypageService.selectMyBoardList(userID);
		Gson gson=new Gson();
				
		String boardList=gson.toJson(list);
		
		return boardList;
	}

	@RequestMapping(value="/testList")
	public String myTest() {
		
		return "mypage/myTest.tiles";
	}
	
	@RequestMapping(value="/pointList")
	public String myPoint() {
		
		return "mypage/myPoint.tiles";
	}
	

}