package com.col.test.dao;

import java.util.List;

import com.col.test.service.TestSubVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.col.test.service.TestVO;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class TestDaoImpl implements TestDao{
	
	@Autowired
	SqlSession SqlSession;

	@Override
	public List<TestVO> testList(int page) throws Exception {
		TestDao mapper = SqlSession.getMapper(TestDao.class);
		return mapper.testList(page);
	}

	@Override
	public int testListMaxPage() {
		TestDao mapper = SqlSession.getMapper(TestDao.class);
		return mapper.testListMaxPage();
	}

	@Override
	public TestVO selectTest(int testNum) {
		TestDao mapper = SqlSession.getMapper(TestDao.class);
		return mapper.selectTest(testNum);
	}

	@Override
	public int selectTestAnswerCnt(TestSubVO testSubVO) {
		TestDao mapper = SqlSession.getMapper(TestDao.class);
		return mapper.selectTestAnswerCnt(testSubVO);
	}

	@Override
	public int selectUserGrade(String userID) {
		TestDao mapper = SqlSession.getMapper(TestDao.class);
		return mapper.selectUserGrade(userID);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public void insertTest(TestVO vo) throws Exception {
		TestDao mapper = SqlSession.getMapper(TestDao.class);
		mapper.insertTest(vo);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public void insertTestAnswer(TestSubVO testSubVO) {
		TestDao mapper = SqlSession.getMapper(TestDao.class);
		mapper.insertTestAnswer(testSubVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public void viewIncrement(int testNum) {
		TestDao mapper = SqlSession.getMapper(TestDao.class);
		mapper.viewIncrement(testNum);
	}

	@Override
	public void testSurveyUpdate(int userGrade, int userGradePoint, String userID) {
		TestDao mapper = SqlSession.getMapper(TestDao.class);
		mapper.testSurveyUpdate(userGrade,userGradePoint,userID);
	}


}
