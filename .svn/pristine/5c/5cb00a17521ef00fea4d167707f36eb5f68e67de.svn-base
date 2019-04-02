package com.col.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.col.test.dao.TestDao;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestDao testDao;
	
	@Override//테스트목록
	public List<TestVO> testList(int page) throws Exception {
		return testDao.testList(page);
	}

	@Override
	public int testListMaxPage() {
		return testDao.testListMaxPage();
	}

	@Override
	public TestVO selectTest(int testNum) {
		return testDao.selectTest(testNum);
	}

	@Override
	public int selectTestAnswerCnt(TestSubVO testSubVO) {
		return testDao.selectTestAnswerCnt(testSubVO);
	}

	@Override
	public int selectUserGrade(String userID) {
		return testDao.selectUserGrade(userID);
	}

	@Override
	public void insertTest(TestVO vo) throws Exception {
		// TODO Auto-generated method stub
		testDao.insertTest(vo);
	}

	@Override
	public void insertTestAnswer(TestSubVO testSubVO) {
		testDao.insertTestAnswer(testSubVO);
	}

	@Override
	public void viewIncrement(int testNum) {
		testDao.viewIncrement(testNum);
	}

	@Override
	public void testSurveyUpdate(int userGrade, int userGradePoint, String userID) {
		testDao.testSurveyUpdate(userGrade,userGradePoint,userID);
	}

}
