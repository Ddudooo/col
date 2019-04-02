<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
if('${userID}'==""){
	alert("등록된 회원이 아닙니다.");
	history.go(-1);
}
</script>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="row page-titles">
				<div class="col-md-5 align-self-center">
					<h4 class="text-themecolor">아이디 찾기</h4>
				</div>
				<div class="col-md-7 align-self-center text-right">
					<div class="d-flex justify-content-end align-items-center">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
							<li class="breadcrumb-item active">Login</li>
						</ol>
						<button type="button" class="btn btn-info d-none d-lg-block m-l-15" onclick="document.location='${pageContext.servletContext.contextPath}/login/findPwForm';">
						비밀번호 찾기</button>
					</div>
				</div>
			</div>
			
			<div class="card col-md-6" style="margin:0 auto">
			<div class="card-body">
					<div class="text-center">
						<img src="${pageContext.servletContext.contextPath}/resources/images/hello.png" class="img-responsive center-block" style=" object-fit:cover;">
					</div>
					<div class="text-center" style="font-weight: 700; font-size: 13pt; margin-top: 10px; color: DimGray;">
					<c:if test="${userID!=null}">
					회원님의 아이디는 <a href="#" style="color:tomato">${userID }</a>입니다.
					</c:if>
					</div>
	
				</div>	
			</div>
		</div>
	</div>