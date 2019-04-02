<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

나를 팔로우한 채널
<div class="row">
	<c:forEach var="followVO" items="${followVO}" varStatus="status">
			<!-- my video -->	
	             <div class="col-lg-3 col-md-6">
	             <!-- Card -->
	             <a href="${pageContext.servletContext.contextPath}/${followVO.myFollowerID}/channel">
	             	<div class="card">
	                   <img src="${pageContext.servletContext.contextPath}/<c:out value='${followVO.myFollowerImg}'/>"
							 class="img-circle img-responsive center-block" style="object-fit: cover;">
	                   	 
	                  		 <div class="card-body">
	                            <h4 class="card-title" id="title">userID: <c:out value="${followVO.myFollowerID}"/></h4>
	                            <p class="card-text" id="price" >userNick: <c:out value="${followVO.myFollowerNick}"/></p>
	              				
	                        </div> 
	                   </div>
	             </a>
	                   <!-- Card -->
	             </div>
	          
	       </c:forEach>
	       
	       </div>