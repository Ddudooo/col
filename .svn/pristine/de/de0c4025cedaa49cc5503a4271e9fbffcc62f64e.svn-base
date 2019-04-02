package com.col.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.col.test.service.TestSubVO;
import com.google.gson.JsonElement;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import com.col.test.service.TestService;
import com.col.test.service.TestVO;

@Controller
@RequestMapping("/test/*")
public class TestController {
	
	@Autowired
	TestService testService;
	@RequestMapping(value="/write")
	public String write(HttpSession session){
		if(session.getAttribute("login")==null){
			return "redirect:/";
		}


		return "test/testWrite.tiles";
	}

	@RequestMapping(value="/upload", method=RequestMethod.POST)
	@ResponseBody
	public String upload(@RequestParam("testUploadID") String testUploadID,
						 @RequestParam("testTitle") String testTitle,
						 @RequestParam("testCate") String testCate,
						 @RequestParam("testLevel") String testLevel,
						 @RequestParam("testPoint") String testPoint,
						 @RequestParam("testContent") String testContent,
						 @RequestParam("testInput") String testInput,
						 @RequestParam("testAnswer") String testAnswer,
						 HttpSession session){
		TestVO testVO = new TestVO();
		testVO.setTestUploadID(testUploadID);
		testVO.setTestTitle(testTitle);
		testVO.setTestCate(testCate);
		testVO.setTestLevel(Integer.parseInt(testLevel));
		testVO.setTestPoint(Integer.parseInt(testPoint));
		testVO.setTestContent(testContent);
		testInput = testInput.replaceAll("<br>","\n");
		testVO.setTestInput(testInput);
		testAnswer = testAnswer.replaceAll("<br>","\n");
		testVO.setTestAnswer(testAnswer);
//		JsonElement json = new JsonParser().parse(resp.toString());
		System.out.println("	@@@		"+"test upload");
		System.out.println("	@@@		"+"input DATA");
		System.out.println("	@@@		");


		if(testVO.getTestUploadID()==null||
			session.getAttribute("login")==null){
			//로그인 혹은 입력값 정확하지 않음
			return "loginRequire";
		}
		try {
			testService.insertTest(testVO);
		} catch (Exception e) {
			e.printStackTrace();
			return "UNKOWNERROR";
		}

		return "success";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@RequestParam(required = false) String testNum,
					   @RequestParam(required = false) String page,
							 HttpServletRequest request) throws Exception {
		if(testNum!=null){
			TestVO testVO = testService.selectTest(Integer.parseInt(testNum));
			testService.viewIncrement(Integer.parseInt(testNum));
			request.setAttribute("test",testVO);
			return "test/testForm.tiles";
		}

		if(page == null){
			page = "1";
			request.setAttribute("startPage", Integer.parseInt(page));

		}else{
			int startPage = Integer.parseInt(page);
			if(startPage-5<0){
				startPage = 1;
			}
			request.setAttribute("startPage", startPage);
			int paging = Integer.parseInt(page)-1;

		}
		List<TestVO> testList = testService.testList((Integer.parseInt(page)-1)*10);

		request.setAttribute("test",testList);

		request.setAttribute("page",page);
		request.setAttribute("maxpage",testService.testListMaxPage());

		return "test/testList.tiles";
	}
	
	@RequestMapping(value="/answer", method = RequestMethod.POST)
	public String answer(@RequestParam("testNum") String testNum,//문제 번호
						@RequestParam("userID") String userID,//유저 아이디
						@RequestParam("sourceCode")String sourceCode,//소스 코드
						@RequestParam("subLang") String subLang,//제출 언어
						HttpServletRequest request){
		if(userID==null){
			return "redirect:/";
		}
		System.out.println("	###		"+"userID - "+ userID);
		System.out.println("	###		"+"testNum - " + testNum);
		System.out.println("	###		"+sourceCode);
		String input = testService.selectTest(Integer.parseInt(testNum)).getTestInput();
		TestSubVO testSubVO = new TestSubVO();
		testSubVO.setTestNum(Integer.parseInt(testNum));
		testSubVO.setUserID(userID);
		int cnt = testService.selectTestAnswerCnt(testSubVO);
		testSubVO.setSubCnt(++cnt);
		testSubVO.setSubAnswer(sourceCode);
		testSubVO.setSubLang(subLang);
		try {
			String token = ideAPI(sourceCode,subLang,input);
			JsonObject result = (JsonObject) new JsonParser().parse(token);
			JsonElement stdout =result.get("stdout");
			if(stdout != JsonNull.INSTANCE){
				testSubVO.setSubResult(result.get("stdout").getAsString());
				testSubVO.setSubTime(result.get("time").getAsString());
			}else{
				if(result.get("compile_output")!=JsonNull.INSTANCE) {
					testSubVO.setSubResult(result.get("compile_output").getAsString());
				}else{
					testSubVO.setSubResult("");
				}
				testSubVO.setSubTime("-1");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		testService.insertTestAnswer(testSubVO);
		TestVO testVO= testService.selectTest(Integer.parseInt(testNum));
		String testAnswer = testVO.getTestAnswer();
		request.setAttribute("testAnswer", testAnswer);
		request.setAttribute("testSub",testSubVO);
		return "test/testResult.tiles";
	}

	public String ideAPI(String source, String lang, String input) throws UnsupportedEncodingException {
		BufferedReader bufReader=null;
		String responCode=null;
		String token=null;
		lang = lang.toLowerCase();
		int langCode=27;
		if("java".equals(lang)){
			langCode=27;
		}else if("c++".equals(lang)){
			langCode=15;
		}else if("javascript".equals(lang)){
			langCode=29;
		}else if("python".equals(lang)){
			langCode=34;
		}
		//httpClient 추가
		CloseableHttpClient httpClient = HttpClients.createDefault();
		//Post설정 URL설정
		HttpPost httpPost = new HttpPost("https://api.judge0.com/submissions/?base64_encoded=false&wait=true");
		//헤더 정보 추가
		httpPost.addHeader("Content-type","application/json");
		//json 데이터
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("source_code",source);
		jsonObject.addProperty("language_id", langCode);
		jsonObject.addProperty("stdin",input);
		System.out.println("	###		"+jsonObject.toString()+" POST");
		StringEntity postString = new StringEntity(jsonObject.toString());
		httpPost.setEntity(postString);
		try {
			CloseableHttpResponse httpResponse = httpClient.execute(httpPost);
			System.out.println("	###		"+"POST Response Status");
			System.out.println("	###		"+httpResponse.getStatusLine().getStatusCode());
			responCode = String.valueOf(httpResponse.getStatusLine().getStatusCode());
			bufReader = new BufferedReader(new InputStreamReader(
					httpResponse.getEntity().getContent()
			));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while((inputLine = bufReader.readLine()) != null){
				response.append(inputLine);
			}
			bufReader.close();
			System.out.println("	###		"+response.toString());
			if("201".equals(responCode)){
				token = response.toString();
			}
			httpClient.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
//		JsonParser parser = new JsonParser();
//		JsonObject result = (JsonObject) parser.parse(token);

		return token;
	}

	
}
