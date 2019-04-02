<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-wrapper">
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">배치고사</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
						<li class="breadcrumb-item active">Survey Test</li>
					</ol>
				</div>
			</div>
		</div>

		<div class="card text-center">
			<div class="card-body">
				<div class="table-responsive">
					<div id="surveyTestContent">
						<div style="margin:5em; ">
							<h3>프로그래밍을 해본 경험이 있으십니까?</h3>
					</div>
						<div class="testSurveySelect">
							<button type="button" class="btn waves-effect waves-light btn-info"  value="Y">예</button>
							<button type="button" class="btn waves-effect waves-light btn-danger"  value="N">아니오</button>
						</div>
						<script>
							$('.testSurveySelect button').click(function(){
								if($(this).val()=='Y'){
                                    $("#surveyTestContent").html("");
                                    $("#surveyTestContent").load("${pageContext.servletContext.contextPath}/test/testSurveyList");
								}
							})
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>