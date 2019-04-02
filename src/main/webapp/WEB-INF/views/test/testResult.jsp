<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page-wrapper">
    <div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">Test - 상시테스트</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
						<li class="breadcrumb-item active">Test</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				문제 번호${testSub.testNum}<br>
				아이디 ${testSub.userID}<br>
				제출언어 ${testSub.subLang}<br>
				답안 <br>
				<pre><c:out value="${testSub.subAnswer}" escapeXml="false" />
				</pre><br>
				결과 <br>
				<pre>${testSub.subResult}</pre><br>
				정답<br>
				<pre>${testAnswer}</pre>
				소요시간 <br>${testSub.subTime}><br>
				제출수 ${testSub.subCnt}<br>
			</div>
		</div>
	</div>
</div>