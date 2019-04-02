<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>

<div class="page-wrapper">
    <div class="container-fluid">
         <div class="row page-titles">
              <div class="col-md-5 align-self-center">
              <h4 class="text-themecolor">Video</h4>
              </div>
              <div class="col-md-7 align-self-center text-right">
                  <div class="d-flex justify-content-end align-items-center">
                      <ol class="breadcrumb">
                          <li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
                          <li class="breadcrumb-item">Channel</li>
                          <li class="breadcrumb-item active">Video</li>
                      </ol>
                  </div>
              </div>
         </div>
         <div class="card">
         	<div class="container" style="margin:3em">
	         <video src="${pageContext.servletContext.contextPath}/${videoVO.videoAddr}" controls loop width="640" height="340"></video>
	         <h4>영상 제목: ${videoVO.videoTitle}</h4>
	         <h3>영상 가격: ${videoVO.videoPrice}원</h3>
	         <h3>영상 레벨: ${videoVO.videoLevel}</h3>
	         <h3>영상 카테고리: ${videoVO.videoCate}</h3>
         	</div>
         </div>      
     </div>
</div>
                