<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="page-wrapper">
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">배치고사 결과</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
						<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}/test/testSurveyChoice">Survey Test</a></li>
						<li class="breadcrumb-item active">Result</li>
					</ol>
				</div>
			</div>
		</div>

		<div class="card text-center">
			<div class="card-body">
				<div class="table-responsive">
					<div id="surveyTestContent">
						<div style="margin:5em; ">
							배치 고사 결과!
						</div>
						<div style="margin: 5em;">
							<h4>당신 등급은</h4>
								<h2>
							<c:choose>
								<c:when test="${param.grade == 5}">
									다이아
								</c:when>
								<c:when test="${param.grade == 4}">
									플레티넘
								</c:when>
								<c:when test="${param.grade == 3}">
									골드
								</c:when>
								<c:when test="${param.grade == 2}">
									실버
								</c:when>
								<c:otherwise>
									브론즈
								</c:otherwise>
							</c:choose>
								</h2>
						</div>
						<div>
							<button class="btn btn-primary" onclick="document.location.href='${pageContext.servletContext.contextPath}/test/surveyAnswer'">
								문제 풀이
							</button>
							<button class="btn btn-primary" onclick="document.location.href='${pageContext.servletContext.contextPath}'">
								홈으로
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
