<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$().ready(function(){
		$(".reportLink").click(function(){
            $("#reportfrm").modal();
        });
	})
	
	function reportModal(reportNum, reportTypeNum, reporter, reportTarget, reportContent, reportContent2){
    	var form = document.reportForm;
		form.reportNum.value = reportNum;
		form.reportTypeNum.value = reportTypeNum;
    	form.reporter.value = reporter;
    	form.reportTarget.value = reportTarget;
    	form.reportContent.value = reportContent;
    	form.reportContent2.value = reportContent2;
    }
	
	function go(){
		var seq = document.getElementById('reportTypeNum').value;
		document.location.href='${pageContext.servletContext.contextPath}/board/read?boardSeq='+seq;
	} 
	
</script>

<div class="page-wrapper" >
	<div class="container-fluid"> 
	
		<div class="row page-titles">
				<div class="col-md-5 align-self-center">
					<h4 class="text-themecolor">Report</h4>
				</div>
				<div class="col-md-7 align-self-center text-right">
					<div class="d-flex justify-content-end align-items-center">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
							<li class="breadcrumb-item active">Report</li>
						</ol>
					</div>
				</div>
			</div>
			
			<div class="card text-center">
			<div class="card-body">
				<div class="card-title">
					<h3><strong>신고관리</strong></h3>
				</div>
				<div class="table-responsive">
		            <table class="table table-hover">
		                <colgroup>
		                    <col width='8%'/>   <%-- 번호 --%>
		                    <col width='8%'/>   <%-- 유형 --%>
		                    <col width='*%'/>   <%-- 내용 --%>
		                    <col width='10%'/>  <%-- 작성자 --%>
		                    <col width='20%'/>  <%-- 작성일 --%>
		                    <col width='10%'/>   <%-- 결과 --%>
		                </colgroup>
		
		                <thead>
		                <tr>
		                    <th>번호</th>
		                    <th>유형</th>
		                    <th>사유</th>
		                    <th>작성자</th>
		                    <th>날짜</th>
		                    <th>결과</th>
		                </tr>
		                </thead>
		
		                <tbody>
		                <c:forEach var = "listView" items="${listView}" varStatus="status">
		                    <c:url var="link" value="read">
		                        <c:param name="reportNum" value="${listView.reportNum}"/>
		                    </c:url>
		                    <tr>
		                        <td><c:out value="${listView.reportNum}"/></td>    <%-- 번호 --%>
		                        <td><c:out value="${listView.reportType}"/></td>    <%-- 유형 --%>
		                        <td class="reportLink" 
		                        onclick="reportModal('${listView.reportNum}','${listView.reportTypeNum}','${listView.reporter}','${listView.reportTarget}','${listView.reportContent}','${listView.reportContent2}');">
		                        <c:out value="${listView.reportContent}"/></td> <%-- 신고사유 --%>
		                        <td><c:out value="${listView.reporter}"/></td>     <%-- 작성자  --%>
		                        <td><c:out value="${listView.reportDate}"/></td>   <%-- 작성일  --%>
		                        <td>
		                        <c:if test="${empty listView.reportResult}">
		                        	<p class="text-primary">처리중</p>
		                        </c:if>
		                        <c:out value="${listView.reportResult}"/>
		                        </td> <%-- 처리결과 --%>
		                    </tr>
		                </c:forEach>
		                </tbody>
		            </table>
            	</div>
            </div>
			</div>
			
<!-- 신고처리모달 -->
        <div id="reportfrm" class="modal fade">
        	<div class="modal-dialog">			<%--${pageContext.request.contextPath}/reportUpdate --%>
               <form id="reportForm" name="reportForm" action="${pageContext.request.contextPath}/reportUpdate" method="post">
               	<div class="modal-content">
		            <div class="modal-header">
						 <h4 class="modal-title">신고 내용</h4>
		                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>                 
					</div>
			      
			      <div class="modal-body">
			      	<input type="hidden" name="reportNum" id="reportNum" value=""/>
			      	<input type="hidden" name="reportTypeNum" id="reportTypeNum" value=""/>
			      	<p>신고자: <input type="text" id="reporter" value="" style="border:0" readonly/></p>
			      	<p>신고대상: <input type="text" id="reportTarget" value="" style="border:0" readonly/></p>		
			      	<p>신고사유: <input type="text" id="reportContent" value="" style="border:0" readonly/></p>
			    	<p>상세내용: <input type="text" id="reportContent2" value="" style="border:0" readonly/></p>
			      </div>
			      
			      <div class="modal-footer">	
			      	<button type="button" class="btn btn-info" onclick="go();">글보기</button>
					<button type="submit" class="btn btn-danger waves-effect waves-light">처리완료</button>
			        <button type="button" class="btn waves-effect waves-light" data-dismiss="modal">취소</button>
				  </div>
			      
			     </div>
				</form>
			</div>
		</div>  
<!-- 모달끝 -->
			
			
	</div>
</div>