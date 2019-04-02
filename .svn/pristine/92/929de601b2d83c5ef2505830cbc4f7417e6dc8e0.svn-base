package com.col.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.col.login.kakao.KakaoLoginBO;
import com.col.login.naver.NaverLoginBO;
import com.col.login.service.LoginService;
import com.col.mypage.service.MypageService;
import com.col.mypage.service.UserInfoService;
import com.col.register.service.RegisterService;
import com.col.register.service.SHA256;
import com.col.register.service.UserVO;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;
    @Autowired
    private RegisterService registerService;
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private MypageService mypageService;

    //google
    @Autowired
    private GoogleConnectionFactory googleConnectionFactory;
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;

    private OAuth2Operations oauthOperations;
    
    //메일보내기
    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value="/login", method=RequestMethod.POST)
    @ResponseBody
    public String login(@RequestParam String userID,
                         @RequestParam String userPW,
                         @RequestParam String userStat,
                         HttpSession session) throws Exception{
        //test
        System.out.println("login check");
        System.out.println(userID);
        System.out.println(userPW);
        UserVO userVO = new UserVO();
        userVO.setUserID(userID);
        userVO.setUserPW(userPW);
        userVO.setUserStat(userStat);
        
        UserVO someVO= new UserVO();
        someVO=mypageService.selectUser(userID);

        String userImagePath = "";
		int pathStartIndex = someVO.getUserImg().indexOf("resources");
		
		System.out.println("path_start_index: "+pathStartIndex);
		if(pathStartIndex > -1){
			// 파일업로드경로 가지고 오기.
			userImagePath = someVO.getUserImg().substring(pathStartIndex);
		} else {
			// 대표이미지 없으면 기본이미지 가져오기.
			userImagePath = "resources/images/unknown2.jpg";
		}
		someVO.setUserImg(userImagePath);
        
        if(loginService.login(userVO)==1){
            session.setAttribute("login", userID);
            session.setAttribute("loginUserNick", someVO.getUserNick());
            session.setAttribute("loginUserImg", someVO.getUserImg());
           
            System.out.println("getUserImg: "+someVO.getUserImg());
            System.out.println("loginUserNick: "+someVO.getUserNick());
            
            return "success";
        }

        return "fail";
    }
    @RequestMapping(value="/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value="/login/googleLogin")
    public String googleLogin(HttpServletRequest request){
        oauthOperations=googleConnectionFactory.getOAuthOperations();
        String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        System.out.println(url);
        return "redirect:"+url;
    }


    //    google Login test
    @RequestMapping(value = "/login/google", method = { RequestMethod.GET, RequestMethod.POST })
    public String doSessionAssignActionPage(HttpServletRequest request, HttpSession session ) {
        System.out.println("access google");
        String code = request.getParameter("code");
//
//    oauthOperations = googleConnectionFactory.getOAuthOperations();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
                null);

        String accessToken = accessGrant.getAccessToken();
        Long expireTime = accessGrant.getExpireTime();

        if (expireTime != null && expireTime < System.currentTimeMillis()) {
            accessToken = accessGrant.getRefreshToken();
            System.out.printf("accessToken is expired. refresh token = {}", accessToken);

        }
//
        Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
        Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
        System.out.println(connection);

        PlusOperations plusOperations = google.plusOperations();
        Person profile = plusOperations.getGoogleProfile();
//        Person gp = plusOperations.
        UserVO userVO = new UserVO();

        userVO.setUserID("google"+profile.getId());
        userVO.setUserEmail(profile.getAccountEmail());
        userVO.setUserNick("google-"+profile.getDisplayName());
//        userVO.setUserNick(profile.getNick());
        if(loginService.login(userVO)==1){
            System.out.println("    ###     login GoogleAuth");
            session.setAttribute("login",profile.getDisplayName());
            
        }else{
            System.out.println("    ###     Registe GoogleAuth");
            registerService.insertReg(userVO);
            session.setAttribute("login",profile.getDisplayName());
        }

//        System.out.println("User Uid : " + profile.getId());
//        System.out.println("User Nick : " + profile.getDisplayName());
//        System.out.println("User Email : " + profile.getAccountEmail());
//        System.out.println("User Profile : " + profile.getImageUrl());


        // Access Token 취소
        try {
            System.out.println("Closing Token....");
            String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
            URL url = new URL(revokeUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setDoOutput(true);

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
        } catch (Exception e) {

            e.printStackTrace();
        }
        System.out.println("    ###     "+"redirect:/");
        return "redirect:/";

    }
    //google
    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;

    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    @RequestMapping("/login/naverLogin")
    public String naverLogin(Model model, HttpSession session) throws UnsupportedEncodingException {
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);

        //네이버
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "redirect:"+naverAuthUrl;
    }
    @RequestMapping("/login/naver")
    public String naverCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken));
        model.addAttribute("result", apiResult);
        System.out.println("result"+apiResult);
        /* 네이버 로그인 성공 페이지 View 호출 */
        JsonParser jsonParser = new JsonParser();
        JsonObject jsonObject = (JsonObject) jsonParser.parse(apiResult);
        JsonObject response = jsonObject.getAsJsonObject("response");
        String naverID = String.valueOf(response.get("id")).replaceAll("\"","");
        String name = String.valueOf(response.get("name")).replaceAll("\"","");
        UserVO naver = new UserVO();
        naver.setUserID("naver"+naverID);
        if(loginService.login(naver)==1){
            //계정 연동 되어 있음
            System.out.println("login NaverAuth");

        }else{
            //연동 안됨 계정 정보 등록
            System.out.println("register NaverAuth");
            naver.setUserName(name);
            naver.setUserNick("naver-"+String.valueOf(response.get("nickname")).replaceAll("\"",""));
            naver.setUserEmail(String.valueOf(response.get("email")).replaceAll("\"",""));
            //profile_image 프로필 사진
            registerService.insertReg(naver);
        }
        session.setAttribute("login", naverID);

        System.out.println("redirect:/");
        return "redirect:/";
    }
    @RequestMapping(value="/login/kakaoLogin")
    public String kakaoLogin(){

        String url = "https://kauth.kakao.com/oauth/authorize?client_id=55bdba35799ca5e188cfe3c592b2ed5b&redirect_uri=http://localhost:8080/col/login/kakao&response_type=code"; // 새로운 서버의 URL 변경

        System.out.println("kakao login redirect:"+url);
        return "redirect:"+url;

    }
    @RequestMapping(value="/login/kakao", produces = "application/json",method = {RequestMethod.GET,RequestMethod.POST})
    public String kakaoCallBack(@RequestParam(value="code", required=false) String code , HttpServletRequest request, HttpServletResponse response, HttpSession session){
        if(null==code){
            System.out.println("==============================================");
            System.out.println("kakao login reject!");
            System.out.println("==============================================");
            return "redirect:/";
        }

        System.out.println("==============================================");
        System.out.println(code);
        System.out.println("==============================================");
        JsonObject token = null;

        token = KakaoLoginBO.getAccessToken(code);
        JsonObject profile = KakaoLoginBO.getKakaoUserInfo(token);
        System.out.println(profile);

        UserVO kakao = new UserVO();
        kakao.setUserID("kakao"+profile.get("id"));
        if(loginService.login(kakao)==1){
            //계정 연동 되어 있음
            //필수 정보 입력 확인
            System.out.println("kakao user check Email infomation...");
            //이메일 체크
            if(userInfoService.selectUserNullCheck("userEmail",kakao.getUserID())!=0){
                try {
                    //정보 입력.
                    kakao = KakaoLoginBO.getKakaoUser(kakao, profile);
                }catch (Exception e){
                    System.out.println("필수정보 권한 없음");
                    System.out.println("사용자 동의 페이지 이동");
                    System.out.println("redirect:"+e.getMessage());
                    return "redirect:"+e.getMessage();

                }
            }
            System.out.println("login KakaoAuth");

        }else{
            //연동 안됨 계정 정보 등록
            System.out.println("register KakaoAuth");
            try {
                kakao = KakaoLoginBO.getKakaoUser(kakao, profile);
            }catch (Exception e){
                System.out.println("필수정보 권한 없음");
                System.out.println("사용자 동의 페이지 이동");
                System.out.println("redirect:"+e.getMessage());
                return "redirect:"+e.getMessage();

            }


            //profile_image 프로필 사진
            registerService.insertReg(kakao);
        }
        session.setAttribute("login",kakao.getUserID());

        System.out.println("redirect:/");
        return "redirect:/";
    }
    
    @RequestMapping(value="/login/findID")
    public String findID(@RequestParam String userName, @RequestParam String userEmail, ModelMap map){
        //아이디찾기
        System.out.println("ID check");
        System.out.println(userName);
        System.out.println(userEmail);
        UserVO userVO = new UserVO();
        userVO.setUserName(userName);
        userVO.setUserEmail(userEmail);
        
        String userID= loginService.findID(userVO);
        System.out.println(userVO.getUserID());
        map.addAttribute("userID",userID);

        return "login/findIdSuccess.tiles";
    }
    
    @RequestMapping(value="/login/findPwForm")
	public String findPW() {
		return "login/findPwForm.tiles";
	}
    
    @RequestMapping(value="/login/findPW")
    public String findPW(@RequestParam String userID, @RequestParam String userEmail, ModelMap map){
        //비밀번호
        System.out.println("ID check");
        System.out.println(userID);
        System.out.println(userEmail);
        UserVO userVO = new UserVO();
        userVO.setUserID(userID);
        userVO.setUserEmail(userEmail);
        
        String Email = loginService.findPW(userVO);
        System.out.println(userVO.getUserEmail());
        map.addAttribute("userEmail", Email);
        
        //임시 비밀번호 생성
        String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해줌.  
        uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌.  
        System.out.println(uuid);
        
        if(Email != "") {
        	String setfrom = "eunuchS2prince@gmail.com";         
            String tomail  =  userVO.getUserEmail();     				// 받는 사람 이메일
            String title   = "[COL] 임시비밀번호를 보내드립니다.";     			// 제목
            String content = "COL 임시비밀번호는  [ " + uuid + " ] 입니다.";   	// 내용
            SHA256 sha256 = new SHA256();
            String newPW = sha256.encryptSHA256(uuid);					//암호화
            userVO.setUserPW(newPW);
            System.out.println(userVO.getUserPW());
            loginService.updatePW(userVO);
            
            try {
            	MimeMessage message = mailSender.createMimeMessage();
            	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            	messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
            	messageHelper.setTo(tomail);     // 받는사람 이메일
            	messageHelper.setSubject(title); // 메일제목은 생략 가능
            	messageHelper.setText(content);  // 메일 내용
             
            	mailSender.send(message);
            } catch(Exception e){
            	System.out.println(e);
            }
        
        }
        
        return "login/findPwSuccess.tiles";
    }
    
}
