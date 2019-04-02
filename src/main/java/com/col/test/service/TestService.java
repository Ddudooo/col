package com.col.test.service;

import java.util.List;

public interface TestService {
//SELECT
	List<TestVO> testList(int page) throws Exception;

	int testListMaxPage();

	TestVO selectTest(int testNum);

	int selectTestAnswerCnt(TestSubVO testSubVO);

	int selectUserGrade(String userID);
//	INSERT
	void insertTest(TestVO vo) throws Exception;
	void insertTestAnswer(TestSubVO testSubVO);
//	UPDATE
	void viewIncrement(int testNum);

	void testSurveyUpdate(int userGrade, int userGradePoint, String userID);
}
