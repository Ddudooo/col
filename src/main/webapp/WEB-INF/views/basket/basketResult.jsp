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

$(function(){
	
	
	
	$("#paycancel").click(function(){
		location.href = "/col";
	});
	

	$("#paylist").click(function(){
		location.href = "mypage/paymentList";
	});


	
	
	
	
});
</script>


<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Container fluid  -->
	<!-- ============================================================== -->



	<div class="container-fluid">


		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">결제 완료</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0)">Basket</a></li>
						<li class="breadcrumb-item active">Basket Result</li>
					</ol>

				</div>
			</div>
		</div>

<div class="container margin_60" style="text-align:center; width:5em; height:4em; ">
</div>
<div class="container margin_10">
	<div class="row">


		<div class="container">
	
			<div style="font-size: 1.8em; font-weight: bold">
				상품명 
				<br>
				<br>
				<br>
				 결제금액
				 <br> <br>
				 <br>
				  결제일
				 <br><br>
				 <br>
			
				<br><br>
				
				<hr>
				 
			
			</div>
		</div>

	</div>
		<input type="button"  class="btn btn-info" id="paylist" 
				value="구매내역">
		<input style="right:30em;" type="button" class="btn btn-info" id="paycancel" value="확인">
	
	
</div>

<!-- End Container -->
</div></div>