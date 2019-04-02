<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<script type="text/javascript">
   
$(function(){
	
	var pageName = $(this).attr("id");
	
	if(!pageName) { //최초 로딩시에는 pageName값 없음.
		blockPage("live");
	} 

	$(".channelMenu").click(function(){
		pageName = $(this).attr("id");
		blockPage(pageName);
	});
	

	$("#follow").click(function(){
		var userID="${sessionScope.login}";
		$.ajax({
			type : 'post',
			url : 'channel/follow',
			data:{
				userID:userID
			},
			success : function (responseData, status, xhr){
				alert(responseData);
              if(responseData=="Y") {
             	 $('#followBtn').prop("class","fas fa-check");
              }
              else if(responseData="N"){
                  $('#followBtn').prop("class","far fa-heart");
              }
				
			},
			error : function (xhr, status, error){
				console.log("::follow error:: "+error);
			}
		});
	
	});
	
});
	
	
function blockPage(pageName) {
	
	var pageKorName = $("#"+pageName).text();
	console.log(pageKorName);
	
		$.ajax({
			type : 'post',
			url : 'channel/'+pageName,
			dataType : 'html',
			success : function (responseData, status, xhr){
				$("#BlockContent").html(responseData);

				/* 페이지 href 셋팅. */
				$("#pageKorName").text(pageKorName);
				$("#pageforName").attr("href", pageName);
				
			},
			error : function (xhr, status, error){
				console.log(error);
			}
			
		}); // end : ajax			
			
}
 

 
</script>


<div class="page-wrapper">
          
      <div class="container-fluid">

         <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor">Channel</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
                                <li class="breadcrumb-item">Channel</li>
                                <li class="breadcrumb-item active" id="pageKorName"></li>
                            </ol>
                            
                        </div>
                    </div>
            </div>
            
             <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item"> <a class="nav-link active channelMenu" id="live" data-toggle="tab" href="#" role="tab"><span class="hidden-sm-up"><i class="icon-diamond"></i></span> <span class="hidden-xs-down"> Info</span></a> </li>
                                    <li class="nav-item"> <a class="nav-link channelMenu" id="cvideo" data-toggle="tab" href="#"><span class="hidden-sm-up"><i class="ti-video-clapper"></i></span> <span class="hidden-xs-down"> Video</span></a> </li>
                                    <li class="nav-item"> <a class="nav-link channelMenu" id="follower" data-toggle="tab" href="#" role="tab"><span class="hidden-sm-up"><i class="icon-people"></i></span> <span class="hidden-xs-down"> Follower ${cnt.cntFollower}</span></a> </li>
                                    <li class="nav-item"> <a class="nav-link channelMenu" id="following" data-toggle="tab" href="#" role="tab"><span class="hidden-sm-up"><i class="icon-user-following"></i></span> <span class="hidden-xs-down"> Following ${cnt.cntFollowing}</span></a> </li>
                                   	
                                   	<c:if test="${sessionScope.login!=null && sessionScope.login !=channelID}">
	                                   	<li class="btn btn-light btn-rounded waves-effect waves-dark" id="follow"><i class="${status}" id="followBtn">Follow</i> 
	                                   		<div class="notify"> <span class="heartbit" style="z-index:99999;"></span> <span class="point" ></span></div>
	                                   	</li>
	                                   	
                                   	</c:if>
                                </ul>
                                
                                <div id="BlockContent"></div>
                                
                           </div>
                       </div>
                   </div>
               
               </div>
                               
                    
            
</div>
</div>

<!-- row -->