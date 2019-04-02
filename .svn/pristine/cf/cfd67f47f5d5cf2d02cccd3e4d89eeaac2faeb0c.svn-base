package com.col.channel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.col.channel.dao.ChannelVO;
import com.col.channel.dao.FollowVO;
import com.col.channel.dao.VideoVO;
import com.col.channel.service.ChannelService;
import com.col.channel.service.DashBoardService;
import com.google.gson.Gson;

@Controller
public class ChannelController {

   @Autowired
   private ChannelService chnlService;
   
   @Autowired
   private DashBoardService dashService;
      
   HttpSession session=null;
   
   @RequestMapping(value = "/channel/all")
   public String channel(HttpServletRequest req, HttpServletResponse res) throws Exception {
      
      return "channel/channel.tiles";

   }
   
   @RequestMapping(value = "/channel/list", produces="text/json; charset=UTF-8")
   @ResponseBody
   public String channelList(@RequestParam Map map, HttpServletRequest req, HttpServletResponse res) throws Exception{
      
      session = req.getSession(false);
      int channelCate = Integer.parseInt(req.getParameter("channelCate"));
      System.out.println("channelCate: "+channelCate);
      List<ChannelVO> list=chnlService.selectChnlList(map);
      
      String chnlImagePath = "";
      
      for(int i=0;i<list.size();i++)
      {
         int pathStartIndex=list.get(i).getChannelImg().indexOf("resources");
         
         if(pathStartIndex > -1){
            chnlImagePath = list.get(i).getChannelImg().substring(pathStartIndex);
         } else {
            chnlImagePath = "resources/images/unknown2.jpg";
         }
         
         list.get(i).setChannelImg(chnlImagePath);
      }
      
      Gson gson=new Gson();
      String chnlList=gson.toJson(list);
      
      return chnlList;
   }

   @RequestMapping(value="/{userID}/channel")
   public String channelPage(@PathVariable("userID") String followChannel, 
		   						HttpServletRequest req, HttpServletResponse res, ModelMap map) throws Exception{
	   
	   session = req.getSession(false);
	   String followUser=(String) session.getAttribute("login");
	   HashMap<String,String> followMap=new HashMap<String,String>();
	   followMap.put("followChannel", followChannel);
	   followMap.put("followUser", followUser);
		   
	   String status="";
	   String name="";
	   if(chnlService.existFollow(followMap)==0)
	   {
		status="far fa-heart";
		}else {
		status="fas fa-check";
	}
	   HashMap<String,String> followCntMap=new HashMap<String,String>();
	   followCntMap= chnlService.settingFollowInfo(followChannel);
	   
	   map.addAttribute("status",status);
	   map.addAttribute("cnt",followCntMap);
	   map.addAttribute("channelID",followChannel);
	   
	   return "channel/channelPage.tiles";
   }
   
   
   
   @RequestMapping(value = "/{userID}/channel/live")
   public String channelLive(@PathVariable("userID") String userID,
                     HttpServletRequest req, HttpServletResponse res, ModelMap map) throws Exception{

    session = req.getSession(false);
   // userID= (String) session.getAttribute("login");
         
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

      return "channel/channelLive.blocks";
   }
   
   
   @RequestMapping(value = "/{userID}/channel/cvideo")
   public String channelVideo(@PathVariable("userID") String userID, HttpServletRequest req, HttpServletResponse res, ModelMap map) throws Exception {

	   	session=req.getSession(false);
		  
		  List<VideoVO> videoList= dashService.selectVideoList(userID);

	      String chnlImagePath = "";
	      
	      for(int i=0;i<videoList.size();i++)
	      {
	         int pathStartIndex=videoList.get(i).getVideoAddr().indexOf("resources");

	         videoList.get(i).setVideoAddr(videoList.get(i).getVideoAddr().substring(pathStartIndex));
	      }
		  
	      map.addAttribute("chnlMap", videoList);
	  
      return "channel/channelVideo.blocks";
   }
   
   @RequestMapping(value="/{userID}/channel/follow")
   @ResponseBody
   public String follow(@PathVariable("userID") String followChannel, 
		   			HttpServletRequest req, HttpServletResponse res) throws Exception {
	   
	   session=req.getSession(false);
	   String followUser=req.getParameter("userID");
	   System.out.println("followUser"+followUser);
	   System.out.println("followChannel"+followChannel);
	   HashMap<String,String> followMap=new HashMap<String,String>();
	   followMap.put("followChannel", followChannel);
	   followMap.put("followUser", followUser);
	   
	   String status="";
	   if(chnlService.existFollow(followMap)==0)
	   {
		   chnlService.insertFollow(followMap);
		   status="Y";
	   }else {
		   chnlService.deleteFollow(followMap);
		   status="N";
	   }
	   
	return status;
   }
   
   @RequestMapping(value="/{userID}/channel/follower")
   public String chnlFollower(@PathVariable("userID") String followChannel, 
		   						HttpServletRequest req, HttpServletResponse res, ModelMap map) throws Exception{
	   
	   session=req.getSession(false);
	   List<FollowVO> followVO=chnlService.selectMyFollower(followChannel);
	   
	   for(int i=0;i<followVO.size();i++)
	   {
		   String serverFollowImg="";
		   int startIndex=followVO.get(i).getMyFollowerImg().indexOf("resources");
		   
		   if(startIndex>-1) {
			   serverFollowImg=followVO.get(i).getMyFollowerImg().substring(startIndex);
		   }else {
			   serverFollowImg= "resources/images/unknown2.jpg";
		   }
		   
		   followVO.get(i).setMyFollowerImg(serverFollowImg);
	   }
	   
	   map.addAttribute("followVO",followVO);
	   
	   return "channel/channelFollower.blocks";
   }
   
   @RequestMapping(value="/{userID}/channel/following")
   public String chnlFollowing(@PathVariable("userID") String followUser, HttpServletRequest req, HttpServletResponse res, ModelMap map) throws Exception{
	   
	   session=req.getSession(false);
	   List<FollowVO> followVO=chnlService.selectMyFollowing(followUser);
	   
	   for(int i=0;i<followVO.size();i++)
	   {
		   String serverFollowingImg="";
		   int startIndex=followVO.get(i).getMyFollowingImg().indexOf("resources");
		   
		   if(startIndex>-1) {
			   serverFollowingImg=followVO.get(i).getMyFollowingImg().substring(startIndex);
		   }else {
			   serverFollowingImg= "resources/images/unknown2.jpg";
		   }
		   
		   followVO.get(i).setMyFollowingImg(serverFollowingImg);
	   }
	   
	   map.addAttribute("followVO",followVO);
	   
	   return "channel/channelFollowing.blocks";
   }
   
   
   
   
   @RequestMapping(value= "/{userID}/channel/video")
   public String channelVideoDetails(@PathVariable("userID") String userID,
		   								HttpServletRequest req, HttpServletResponse res, ModelMap map) throws Exception {
	   
	   session = req.getSession(false);
	   String videoNum = req.getParameter("videoNum");
	   System.out.println("videoNum: "+videoNum);
	   
	   HashMap<String,String> hMap=new HashMap<String,String>();
	   hMap.put("videoNum", videoNum);
	   hMap.put("userID", userID);
	   VideoVO videoVO=new VideoVO();
	   videoVO=chnlService.selectVideoDetails(hMap);
	   videoVO.setVideoAddr(videoVO.getVideoAddr().substring(videoVO.getVideoAddr().indexOf("resources")));
	   
	   map.addAttribute("videoVO", videoVO);
	   
	   return "channel/videoPage.tiles";
   }
   
   
}