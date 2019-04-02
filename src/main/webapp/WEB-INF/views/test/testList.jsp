<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="page-wrapper">
    <div class="container-fluid">
			<div class="row page-titles">
				<div class="col-md-5 align-self-center">
					<h4 class="text-themecolor">Test</h4>
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
			
			<div class="card text-center">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-hover">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>난이도</th>
							<th>점수</th>
							<th>조회수</th>
						</tr>

						<c:forEach var= "row" items="${test}">
							<tr onclick="location.href='${pageContext.servletContext.contextPath}/test/list?testNum=${row.testNum}'" style="cursor:pointer;">
								<td>${row.testNum}</td>
								<td>${row.testTitle}</td>
								<td>${row.testLevel}</td>
								<td>${row.testPoint}</td>
								<td>${row.testHit}</td>
							</tr>
						</c:forEach>

					</table>
					</div>
					<div class="paging w3-center">
						<ul class="pagination justify-content-center">
							<c:forEach var="i" begin="${startPage}" end="${page}" step="1">
								<c:if test="${i != page}">
									<li class="page-item"><a href="${requestScope['javax.servlet.forward.request_uri']}?page=${i}" class="page-link"><c:out value="${i}"/></a></li>
								</c:if>
							</c:forEach>
							<li class="page-item active"><a href="${requestScope['javax.servlet.forward.request_uri']}?page=${page}" class="page-link"><c:out value="${page}"/></a></li>
							<c:forEach var="j" begin="${page+1}" end="${page+6}" step="1">
								<c:if test="${j <=maxpage}">
									<li class="page-item"><a href="${requestScope['javax.servlet.forward.request_uri']}?page=${j}" class="page-link"><c:out value="${j}"/></a></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
	
	</div>
</div>