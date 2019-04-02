package com.col.report.dao;

public class ReportVO {
	
	private String reportNum;		//신고번호
    private String reporter;		//신고자
    private String reportTarget;	//피신고자
    private String reportType;		//신고유형-게시글인지 댓글인지
    private String reportTypeNum;	//게시글 번호
    private String reportContent;	//신고사유
    private String reportContent2;	//신고상세내용
    private String reportDate;		//신고날짜
    private String reportResult;	//신고결과
	
    public String getReportNum() {
		return reportNum;
	}
	public void setReportNum(String reportNum) {
		this.reportNum = reportNum;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getReportTarget() {
		return reportTarget;
	}
	public void setReportTarget(String reportTarget) {
		this.reportTarget = reportTarget;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getReportTypeNum() {
		return reportTypeNum;
	}
	public void setReportTypeNum(String reportTypeNum) {
		this.reportTypeNum = reportTypeNum;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getReportContent2() {
		return reportContent2;
	}
	public void setReportContent2(String reportContent2) {
		this.reportContent2 = reportContent2;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportResult() {
		return reportResult;
	}
	public void setReportResult(String reportResult) {
		this.reportResult = reportResult;
	}
    
	

}
