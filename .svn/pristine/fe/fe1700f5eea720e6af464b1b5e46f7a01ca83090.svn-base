package com.col.report.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.col.report.dao.ReportVO;

@Service
public class ReportService {
	
	 @Autowired
	 private SqlSessionTemplate sqlSession;
	 
	 //신고 저장
	 public void insertReport(ReportVO param) throws Exception {
		 sqlSession.insert("insertReport", param);
	 }
	 
	 public List<ReportVO> reportList() {
	     return sqlSession.selectList("reportList");
	 }
	 
	 public void reportUpdate(ReportVO param) {
		 sqlSession.update("updateReport", param);
	 }
}
