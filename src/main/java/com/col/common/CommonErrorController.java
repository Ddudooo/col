package com.col.common;

import java.util.Iterator;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
@RequestMapping("/common/errors")
public class CommonErrorController {
	
	private static final Logger logger=LoggerFactory.getLogger(CommonErrorController.class);
	
	//throwable 오류
    @RequestMapping(value="/throwable", method=RequestMethod.GET)
    public String throwable(HttpServletRequest request, Model model) throws Exception{
       logger.info("throwable");
       pageErrorLog(request);
       model.addAttribute("code", "Throwable");
       model.addAttribute("msg", "예외가 발생하였습니다.");
       
       return "errors/error.tiles";
    }
    
    //exception 오류
    @RequestMapping(value="/exception", method=RequestMethod.GET)
    public String exception(HttpServletRequest request, Model model) throws Exception{
       logger.info("exception");
       pageErrorLog(request);
       model.addAttribute("code","Exception");
       model.addAttribute("msg", "예외가 발생하였습니다.");
       
       return "errors/error.tiles";
    }
    
    //400 오류
    @RequestMapping(value="/error400", method=RequestMethod.GET)
    public String pageError400(HttpServletRequest request, Model model) throws Exception{
        logger.info("page error code 400");
        pageErrorLog(request);
        model.addAttribute("code","400");
        model.addAttribute("msg", "Bad Request !");
        
        return "errors/error.tiles";
     }
    
    //403 오류
    @RequestMapping(value="/error403", method=RequestMethod.GET)
    public String pageError403(HttpServletRequest request, Model model) throws Exception{
        logger.info("page error code 403");
        pageErrorLog(request);
        model.addAttribute("code","403");
        model.addAttribute("msg", "Forbidden !");
        
        return "errors/error.tiles";
     }
    
    //404 오류
    @RequestMapping(value="/error404", method=RequestMethod.GET)
    public String pageError404(HttpServletRequest request, Model model) throws Exception{
        logger.info("page error code 404");
        pageErrorLog(request);
        model.addAttribute("code","404");
        model.addAttribute("msg", "page not found !");
        
        return "errors/error.tiles";
     }
    
    //405 오류
    @RequestMapping(value="/error405", method=RequestMethod.GET)
    public String pageError405(HttpServletRequest request, Model model) throws Exception{
        logger.info("page error code 405");
        pageErrorLog(request);
        model.addAttribute("code","405");
        model.addAttribute("msg", "Method Not Allowed !");
        
        return "errors/error.tiles";
     }
    
    //500 오류
    @RequestMapping(value="/error500", method=RequestMethod.GET)
    public String pageError500(HttpServletRequest request, Model model) throws Exception{
        logger.info("page error code 500");
        pageErrorLog(request);
        model.addAttribute("code","500");
        model.addAttribute("msg", "Internal Server Error !");
        
        return "errors/error.tiles";
     }
   
    //503 오류
    @RequestMapping(value="/error503", method=RequestMethod.GET)
    public String pageError503(HttpServletRequest request, Model model) throws Exception{
        logger.info("page error code 503");
        pageErrorLog(request);
        model.addAttribute("code","503");
        model.addAttribute("msg", "This site is getting up in few minutes !");
        
        return "errors/error.tiles";
     }
    
    private void pageErrorLog(HttpServletRequest request){
    	logger.info("status_code : " + request.getAttribute("javax.servlet.error.status_code"));
    	logger.info("exception_type : " + request.getAttribute("javax.servlet.error.exception_type"));
    	logger.info("message : " + request.getAttribute("javax.servlet.error.message"));
    	logger.info("request_url : " + request.getAttribute("javax.servlet.error.request_url"));
    	logger.info("exception : " + request.getAttribute("javax.servlet.error.exception"));
    	logger.info("servlet_name : " + request.getAttribute("javax.servlet.error.servlet_name"));
    }
}
