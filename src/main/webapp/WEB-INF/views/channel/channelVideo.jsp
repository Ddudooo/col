<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>


<div class="row">
			<c:forEach var="chnlMap" items="${chnlMap}" varStatus="status">
			<!-- my video -->	
	             <div class="col-lg-3 col-md-6">
	             <!-- Card -->
	             	<c:url var="link" value="/${chnlMap.userID}/channel/video">
                        <c:param name="videoNum" value="${chnlMap.videoNum}"/>
                    </c:url>
                    <span class="hidden-sm-up"><i class="fas fa-cart-plus" id="basket"></i></span> 
                    <a href = "${link}">
	                   <div class="card">
	                   	  <video class="card-img-top img-responsive" src="${pageContext.servletContext.contextPath}/<c:out value='${chnlMap.videoAddr}'/>" controls loop width="320" height="170"></video>
	                  		 <div class="card-body">
	                              <h4 class="card-title" id="title"><c:out value="${chnlMap.videoTitle}"/></h4>
	                              <p class="card-text" id="price" >가격: <c:out value="${chnlMap.videoPrice}"/> 원</p>
	                              
	                              <c:choose>
							         <c:when test = "${chnlMap.videoLevel==1}">
							           	<input type="button" class="btn waves-effect waves-light btn btn-primary"  value="LEVEL.1"/></c:when>
							         
							         <c:when test = "${chnlMap.videoLevel==2}">
							           	<input type="button" class="btn waves-effect waves-light btn btn-success"  value="LEVEL.2"/></c:when>
							         
							         <c:when test = "${chnlMap.videoLevel==3}">
							           	<input type="button" class="btn waves-effect waves-light btn btn-info"  value="LEVEL.3"/></c:when>
							         
							         <c:when test = "${chnlMap.videoLevel==4}">
							           	<input type="button" class="btn waves-effect waves-light btn btn-warning"  value="LEVEL.4"/> </c:when>
							         
							         <c:when test = "${chnlMap.videoLevel==5}">
							           	<input type="button" class="btn waves-effect waves-light btn btn-danger"  value="LEVEL.5"/></c:when>
							      </c:choose>

	                              <c:choose>
							         <c:when test = "${chnlMap.videoCate==1}">
							           	<input type="button" class="btn waves-effect waves-light btn btn-primary"  value="JAVA"/></c:when>
							         
							         <c:when test = "${chnlMap.videoCate==2}">
							           	<input type="button" class="btn waves-effect waves-light btn btn-success"  value="C++"/></c:when>
							         
							         <c:when test = "${chnlMap.videoCate==3}">
							           	<input type="button" class="btn waves-effect waves-light btn btn-info"  value="C"/></c:when>
							         
							         <c:when test = "${chnlMap.videoCate==4}">
							           	<input type="button" class="btn waves-effect waves-light btn btn-warning"  value="Python"/> </c:when>
							         
							         <c:when test = "${chnlMap.videoCate==5}">
							           	<input type="button" class="btn waves-effect waves-light btn btn-danger"  value="JavaScript"/></c:when>
							         <c:when test = "${chnlMap.videoCate==6}">
							           	<input type="button" class="btn waves-effect waves-light btn btn-danger"  value="CSS"/></c:when>
							           	
							      </c:choose>
	                              
	                        </div> 
	                   </div>
	                </a>
	               
	                   <!-- Card -->
	             </div>
	          
	       </c:forEach>
</div>