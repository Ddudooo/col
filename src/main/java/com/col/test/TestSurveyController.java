package com.col.test;

import com.col.test.service.TestService;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping(value = "/test/*")
public class TestSurveyController {
	@Autowired
	private TestService testService;
	
	@RequestMapping(value = "testSurveyChoice")
	public String TestSurveyChoice(HttpSession session) {
		if(session.getAttribute("login")==null) return "redirect:/";
		if(testService.selectUserGrade(String.valueOf(session.getAttribute("login")))!=0) return "redirect:/";
		return "test/testSurveyChoice.tiles";
	}
	@RequestMapping(value = "surveyTest", method= RequestMethod.POST)
	@ResponseBody
	public String surveyChoice(@RequestBody String data,
							   HttpServletRequest req,
							   HttpSession session){
//		2 3 1  1 2
		Map answer = new HashMap();
		answer.put("steps0","2");
		answer.put("steps1","3");
		answer.put("steps2","1");
		answer.put("steps3","1");
		answer.put("steps4","2");
		//와 하드 코딩!
		int resultPoint=1;
		System.out.println("	@@@		data \n"+data);
		JsonParser parser = new JsonParser();
		JsonObject object = parser.parse(data).getAsJsonObject();
		System.out.println("	@@@		step0 "+object.get("steps0"));
		Set keyset = object.keySet();
		Iterator item = keyset.iterator();
		while(item.hasNext()) {
			String key = (String) item.next();
			System.out.println("	@@@		유저입력 문제 : " + key);
			System.out.println("	@@@		유저입력 value : "+ object.get(key).getAsString());
			System.out.println("	@@@		"+answer.get(key));
			if(answer.get(key).equals(object.get(key).getAsString())){
				System.out.println("	@@@		정답!");
				resultPoint +=1;
			}
		}
		if(resultPoint>5) resultPoint=5;
		testService.testSurveyUpdate(resultPoint,50,session.getAttribute("login").toString());

		return "testSurveyResult?grade="+resultPoint;
	}
	@RequestMapping(value = "testSurveyResult")
	public String TestSurveyResult() {

		return "test/testSurveyResult.tiles";
	}
	@RequestMapping(value = "surveyAnswer")
	public String TestSurveyAnswer() {

		return "test/testSurveyAnswer.tiles";
	}
	@RequestMapping(value = "testSurveyList")
	public String testSurveyList() {

		return "test/testSurveyList";
	}

}
