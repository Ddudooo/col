package com.col.test.dao;

import java.util.List;

import com.col.test.service.TestSubVO;
import com.col.test.service.TestVO;
import org.apache.ibatis.annotations.Param;

public interface TestDao {

//	SELECT
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

	void testSurveyUpdate(@Param("userGrade") int userGrade, @Param("userGradePoint") int userGradePoint, @Param("userID") String userID);

}
