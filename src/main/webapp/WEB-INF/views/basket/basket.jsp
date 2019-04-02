<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Editable CSS -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/assets/node_modules/jsgrid/jsgrid.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/assets/node_modules/jsgrid/jsgrid-theme.min.css">
<style>
	.paymentBtn{
		width: 50%;
		height: 10em;
	}
	.custom-control-label{
		position: relative;
		top: -15px;
		left: 10px;
		width: auto;
	}
</style>
<script>
	$(function() {

		$("#pay").click(function() {
		    let paymentAmount = 0;
		    $("#paymentCheckBox").each(function(i){
				if($(this).is(':checked')){
				    let tr =  $(this).parent().parent().parent();
				    paymentAmount += parseInt(tr.find('.price').text().replace(',',''));
				}
			});
		    console.log(paymentAmount);
		    $('#paymentAmount').html(paymentAmount);
		    $('#paymentModal').modal('toggle');
		});
		$('.paymentBtn').click(function(){
		    $('.paymentBtn').each(function(){
		        $(this).removeClass('active');
			});
		    $(this).addClass('active');
			$('#paycheck').removeAttr('disabled');
		});
		$("#cancel").click(function() {
			location.href = "${pageContext.servletContext.contextPath}";
		});
		$(".tdCheckbox").click(function(){
		    let clickCheckBox = $(this).find('[type="checkbox"]');
		    if(clickCheckBox.is(":checked")){
		        clickCheckBox.prop("checked",false);
			}else{
		        clickCheckBox.prop("checked",true);
			}
		})
	});
</script>

<div class="page-wrapper" >
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">My Basket</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
						<li class="breadcrumb-item active">My Basket</li>
					</ol>
				</div>
			</div>
		</div>

		<div class="card text-center">
			<div class="card-body">
				<div id="basicgrid" class="jsgrid"
					 style="position: relative; height: 500px; width: 100%;">
					<div class="jsgrid-grid-header jsgrid-header-scrollbar">
						<table class="jsgrid-table table table-striped table-hover">
							<tr class="jsgrid-header-row">
								<th
										class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
										style="width: 50px;">상품명</th>
								<th
										class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
										style="width: 50px;">판매자</th>
								<th
										class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
										style="width: 50px;">가격</th>

								<th class="jsgrid-header-cell jsgrid-align-center"
									style="width: 50px;">상품선택</th>
								<th
										class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
										style="width: 50px;">삭제</th>
							</tr>


						</table>
					</div>
					<div class="jsgrid-grid-body" style="height: 299px;">
						<table class="jsgrid-table table table-striped table-hover">
							<tbody>
							<tr class="jsgrid-row" style="">
								<td class="jsgrid-cell jsgrid-align-center"
									style="width: 50px;">자바강의1</td>
								<td class="jsgrid-cell jsgrid-align-center"
									style="width: 50px;">김도비</td>
								<td class="jsgrid-cell jsgrid-align-center price"
									style="width: 50px;">3,800</td>

								<td class="jsgrid-cell jsgrid-align-center tdCheckbox"	style="width: 50px;">
									<div class="custom-control custom-checkbox mr-sm-2">
										<input type="checkbox" class="custom-control-input" id="paymentCheckBox" name="select">
										<label class="custom-control-label" for='paymentCheckBox'></label>
									</div>
								</td>
								<td
										class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
										style="width: 50px;">
									<button class="jsgrid-button jsgrid-delete-button"
											type="button" title="Delete"></button>
								</td>
							</tr>
							</tbody>
						</table>
					</div>
					<span style="float: right">
								<button type="button" onclick="pay" id="pay"
										class="btn waves-effect waves-light btn-info">결제</button>
								<button type="button" onclick="cancel" id="cancel"
										class="btn waves-effect waves-light btn-danger">취소</button>
							</span>
				</div>
			</div>
		</div>

	</div>
</div>

<%--Modal START--%>
<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true" style="display: none;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel1">결제하기</h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			</div>
			<div class="modal-body">
				<h4>상품이름</h4>
				<h4 class="text-right">총 결제금액  <span id="paymentAmount">0</span>원</h4>
				<hr>
				
				<div class="form-group">
					<h4>결제수단 선택</h4><br>
						<fieldset class="controls">
                           <div class="custom-control custom-radio">
                            <input type="radio" name="pay" id="styled_radio1" class="custom-control-input">
                            <label class="custom-control-label" for="styled_radio1">무통장 입금</label>
                            </div>
                        </fieldset>
                        <fieldset class="controls">
                            <div class="custom-control custom-radio">
                            	<input type="radio" name="pay" required id="styled_radio2" class="custom-control-input">
                            	<label class="custom-control-label" for="styled_radio2">카드 결제</label>
                            </div>
                        </fieldset>
                        <fieldset class="controls">
                            <div class="custom-control custom-radio">
                            	<input type="radio" name="pay" required id="styled_radio3" class="custom-control-input">
                            	<label class="custom-control-label" for="styled_radio3">카카오 페이</label>
                            </div>
                        </fieldset>
					</div>
					<div class="custom-control custom-checkbox">
                        <input type="checkbox" id="styled_check" class="custom-control-input">
                    	<label class="custom-control-label" for="styled_check">동의합니다.</label>
                    </div>        
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"  disabled id="paycheck" name="paycheck">확인</button>
			</div>
		</div>
	</div>
</div>
<%--Modal END--%>