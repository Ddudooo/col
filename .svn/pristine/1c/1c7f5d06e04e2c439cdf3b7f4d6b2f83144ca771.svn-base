
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false"%>


<script>
	$(function() {

		$("#pay")
				.click(
						function() {
							location.href = "${pageContext.servletContext.contextPath}/basketPay";
						});

		$("#cancel").click(function() {
			location.href = "${pageContext.servletContext.contextPath}";
		});

	});
</script>
<div class="page-wrapper">
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">결제내역</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
						<li class="breadcrumb-item active">Payment List</li>
					</ol>
				</div>
			</div>
		</div>

		<div class="card text-center">
			<div class="card-body">
				<div class="table-responsive">
					<div id="surveyTestContent">
						<div class="jsgrid-grid-header jsgrid-header-scrollbar">
							<table class="jsgrid-table table table-striped table-hover">
								<tr class="jsgrid-header-row">
									<th
											class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
											style="width: 50px;">No.</th>
									<th
											class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
											style="width: 50px;">결제내역</th>
									<th
											class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
											style="width: 50px;">결제금액</th>

									<th class="jsgrid-header-cell jsgrid-align-center"
										style="width: 50px;">결제 방법</th>
									<th
											class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
											style="width: 50px;">결제일</th>
								</tr>


							</table>
						</div>
						<div class="jsgrid-grid-body" style="height: 299px;">
							<table class="jsgrid-table table table-striped table-hover">
								<tbody>
								<tr class="jsgrid-row" style="">
									<td class="jsgrid-cell jsgrid-align-center"
										style="width: 50px;">1</td>
									<td class="jsgrid-cell jsgrid-align-center"
										style="width: 50px;">자바강의</td>
									<td class="jsgrid-cell jsgrid-align-center"
										style="width: 50px;">3,800</td>

									<td class="jsgrid-cell jsgrid-align-center"
										style="width: 50px;">카드결제</td>
									<td
											class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
											style="width: 50px;">
										2018-12-11
									</td>
								</tr>



								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>