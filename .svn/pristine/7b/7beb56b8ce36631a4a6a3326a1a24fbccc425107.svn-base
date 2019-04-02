package com.col.channel;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.col.channel.dao.ChannelVO;
import com.col.channel.dao.VideoVO;
import com.col.channel.service.ChannelService;
import com.col.channel.service.DashBoardService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/{userID}/dash/*")
public class DashBoardController {
   
   @Autowired
   private DashBoardService dashBoardService;
   
   @Autowired
   private ChannelService chnlService;
   
   HttpSession session=null;

   @RequestMapping(value = "live")
   public String dashboardSettingLive(@PathVariable("userID") String userID, HttpServletRequest req, HttpServletResponse res, ModelMap map) throws Exception {
      
      session = req.getSession(false);
      userID= (String) session.getAttribute("login");
      
      HashMap<String,String> chnlMap=new HashMap<String,String>();
      chnlMap = chnlService.selectChnlInfo(userID);
      String chnlImagePath = "";
      int pathStartIndex = -1;
      if(chnlMap.get("channelImg")!=null)
      {
         pathStartIndex = chnlMap.get("channelImg").indexOf("resources");
      }
      
      System.out.println("pathStartIndex: "+pathStartIndex);
      if(pathStartIndex > -1){
    	// 파일업로드경로 가지고 오기.
         chnlImagePath =  chnlMap.get("channelImg").substring(pathStartIndex);
         
      } else {
    	// 대표이미지 없으면 기본이미지 가져오기.
         chnlImagePath = "resources/images/unknown2.jpg";
         }
      
      chnlMap.replace("channelImg", chnlImagePath);
      
      map.addAttribute("chnlMap",chnlMap);

      return "channel/dashboardLive.tiles";
   
   }
   
   @RequestMapping(value="insertVideoInfo",  method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
   public String dashInsertVideo(@PathVariable("userID") String userID, 
		   					MultipartHttpServletRequest request, HttpServletRequest req, HttpServletResponse res) throws IOException, Exception {
	   
	   session=req.getSession(false);
	   userID= (String) session.getAttribute("login");

	   VideoVO videoVO = new VideoVO();
	   videoVO.setUserID(userID);
	   videoVO.setVideoTitle(req.getParameter("videoTitle"));
	   videoVO.setVideoCate(Integer.parseInt(req.getParameter("videoCate")));
	   videoVO.setVideoLevel(Integer.parseInt(req.getParameter("videoLevel")));
	   videoVO.setVideoPrice(Integer.parseInt(req.getParameter("videoPrice")));
	   
	   MultipartFile file=request.getFile("file");
	   
	   videoVO.setVideoSize((int)file.getSize());
	   System.out.println("file Size: "+(int)file.getSize());
	   if(file.isEmpty()){
	         System.out.println("업로드 파일이 존재하지 않습니다.");
	         videoVO.setVideoAddr(" ");
	         
	      } else {
	         res.setCharacterEncoding("UTF-8");
	         res.setContentType("text/html;charset=utf-8");
	         String uploadPath="C:\\workspace_spring\\CoL\\src\\main\\webapp\\resources\\fileUpload\\video";
	         
	         String filePath=UploadFileUtils.uploadFile(uploadPath,userID, file.getOriginalFilename(), file.getBytes());
	         
	         videoVO.setVideoAddr(uploadPath+filePath);
	         
	      }
	   
	   dashBoardService.insertVideo(videoVO);
	   
	   return "redirect:/{userID}/dash/live";
   }
   

   @RequestMapping(value = "video", produces = "text/plain;charset=UTF-8" )
   public String dashboardSettingVideo(@PathVariable("userID") String userID, 
		   								HttpServletRequest req, HttpServletResponse res, ModelMap map) throws Exception {
	  session=req.getSession(false);
	  userID = (String) session.getAttribute("login");
	  
	  List<VideoVO> videoList= dashBoardService.selectVideoList(userID);

      String chnlImagePath = "";
      
      for(int i=0;i<videoList.size();i++)
      {
         int pathStartIndex=videoList.get(i).getVideoAddr().indexOf("resources");
         
         if(pathStartIndex > -1){
            chnlImagePath = videoList.get(i).getVideoAddr().substring(pathStartIndex);
         } 
         videoList.get(i).setVideoAddr(chnlImagePath);
      }
	  
      map.addAttribute("videoList", videoList);
      
      return "channel/dashboardVideo.tiles";
	  /*Gson gson=new Gson();
      String list=gson.toJson(videoList);
      
      return list;*/
   }
   
   
   @RequestMapping(value="insertChnl")
   public String dashboardInsertChnlInfo( @RequestParam("channelTitle") String channelTitle,
                                 @RequestParam("channelNotice") String channelNotice,
                                 @RequestParam("channelLevel") String channelLevel,
                                 @RequestParam("channelCate") String channelCate, 
                                 @PathVariable("userID") String userID, HttpServletRequest req, HttpServletResponse res, ModelMap map, MultipartFile file) throws Exception{
      
      
      session = req.getSession(false);
      userID=(String) session.getAttribute("login");
      
      ChannelVO chnlVO=new ChannelVO();
      chnlVO.setUserID(userID);
      chnlVO.setChannelTitle(channelTitle);
      chnlVO.setChannelNotice(channelNotice);
      chnlVO.setChannelLevel(Integer.parseInt(channelLevel));
      chnlVO.setChannelCate(Integer.parseInt(channelCate));

      
      if(file.isEmpty()){
         System.out.println("업로드 파일이 존재하지 않습니다.");
         
      } else {
         res.setCharacterEncoding("UTF-8");
         res.setContentType("text/html;charset=utf-8");
         //String uploadPath=req.getSession().getServletContext().getContextPath();

         String uploadPath="C:\\workspace_spring\\CoL\\src\\main\\webapp\\resources\\fileUpload\\chnlImg";
		
		 String filePath=UploadFileUtils.uploadFile(uploadPath,userID, file.getOriginalFilename(), file.getBytes());
		 
         chnlVO.setChannelImg(uploadPath+filePath);
         
      }
      
      if(dashBoardService.existChnl(userID)==1) {
         dashBoardService.updateChnlInfo(chnlVO);
      }
      
      
      return "redirect:/{userID}/dash/live";
   }
}