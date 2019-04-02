<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<script>
	$(function() {

		$("#paycancel").click(function() {
			location.href = "basket";
		});

	});

	function checkAnimal() {
		let isChecked = $(':input[name="paymentCheckBox"]').is(":checked");

		if (isChecked) {
			return false;

		} else {
            Swal({
                type: 'error',
                text: '이용약관 동의를 해주세요!'
            });
			return true;
		}
	}
	$(function() {

		$("#paycheck").click(function() {
							location.href = "${pageContext.servletContext.contextPath}/basketResult";
		});
	});
</script>

<div class="page-wrapper">
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">장바구니 결제</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0)">Basket</a></li>
						<li class="breadcrumb-item active">Basket Pay</li>
					</ol>
				</div>
			</div>
		</div>

		<div class="card text-center">
			<div class="card-body">
				<div class="table-responsive">
					<div id="surveyTestContent">
						<div class="card w3-center">
							<div class="m-t-20" style="font-size: 1.5em; font-weight: bold">
								<P>상품명</P>

								<P>결제금액</P>

								<P>결제일</P>

								<P>결제방법선택</P>

								<div>
									<input type="radio" name="payMeans" value="creditCard">
									신용카드 <input type="radio" name="payMeans" value="kakaoPay">
									카카오페이 <input type="radio" name="payMeans" value="nobankPay">
									무통장입금 <input type="radio" name="payMeans" value="phonePay">
									휴대폰소액결제
								</div>
							</div>
						</div>



								<div>
									<h3><input type="checkbox" name="paymentCheckBox" value="agree">이용 약관에 동의합니다.</h3>
								</div>
									<!-- 결재완료-->
									<div class="button-box">
										<button type="submit" class="btn btn-primary" data-toggle="modal"
												id="execute"	data-target="#exampleModal1" data-whatever="@mdo">결재진행</button>
									</div>

									<!-- 모달창 -->
									<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true" style="display: none;">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="exampleModalLabel1">결재가 완료되었습니다.</h4>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
												</div>

												<div class="modal-footer">

													<button type="button" class="btn btn-primary" id="paycheck" name="paycheck">확인</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 모달끝 -->
									<button type="button" class="btn waves-effect waves-light btn-danger" id="paycancel">결제취소</button>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>