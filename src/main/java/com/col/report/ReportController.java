package com.col.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.col.report.dao.ReportVO;
import com.col.report.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
    private ReportService reportService;
	
	@RequestMapping(value = "/report")
    public String boardSave(@RequestParam("reporter") String reporter, @RequestParam("reportTarget") String reportTarget,
			   @RequestParam("reportType") String reportType, @RequestParam("reportTypeNum") String reportTypeNum, 
			   @RequestParam("reportContent") String reportContent,
			   @RequestParam("reportContent2") String reportContent2) throws Exception {
		ReportVO reportVO = new ReportVO();
		reportVO.setReporter(reporter);
		reportVO.setReportTarget(reportTarget);
		reportVO.setReportType(reportType);
		reportVO.setReportTypeNum(reportTypeNum);
		reportVO.setReportContent(reportContent);
		reportVO.setReportContent2(reportContent2);		
        reportService.insertReport(reportVO);
        return "redirect:/board/read?boardSeq="+reportTypeNum;
    }
	
	@RequestMapping(value = "/admin/report/list")
    public String reportList(ModelMap modelMap) throws Exception {
    	
        List<ReportVO> listView = reportService.reportList();
        
        modelMap.addAttribute("listView", listView);
        
        return "admin/reportList.tiles";
    }
	
	@RequestMapping(value = "/reportUpdate")
	public String reportUpdate(@RequestParam("reportNum") String reportNum) throws Exception{
		ReportVO reportVO = new ReportVO();
		reportVO.setReportNum(reportNum);
		
		reportService.reportUpdate(reportVO);
		
		return "redirect:/admin/report/list";
	}

}
