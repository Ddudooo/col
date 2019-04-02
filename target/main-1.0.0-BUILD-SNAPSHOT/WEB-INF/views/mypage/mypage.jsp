<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script>

	function pwdConfirm(myPassword){
		
		console.log("myPassword:"+myPassword);
		$.ajax({
			type: "post",
			url: "mypage/pwdCheck",
			data:{
				password:myPassword
			},
			success: function(responseData, status, xhr){
				
				if(responseData ==="Y")
					{
						$("#userPwdConfirm").modal('hide');
						$('.modal-backdrop').remove();
						location.href="mypage/infoUpdate";
					}
				else if (responseData === "N") {
					alert("비밀번호가 일치하지 않습니다.");
				}
			},
			error: function(xhr, status, error){
				console.log("pwdConfirm Error:" + error);
			}
		});

	}
	
	

	$(function(){
		$("#userInfoUpdate").click(function(){
			$("#myPassword").val("");
			$("#userPwdConfirm").modal();
		});
		
		
		$("#pwUpdate").click(function(){
			location.href = "mypage/pwUpdate";
		});
		$("#userDelete").click(function(){
			location.href = "mypage/userDelete";
		});
		$("#myVideo").click(function(){
			location.href = "mypage/videoList";
		});
		$("#myPayment").click(function(){
			location.href = "mypage/paymentList";
		});
		$("#myBoard").click(function(){
			location.href="mypage/boardList";
		});
		$("#myTest").click(function(){
			location.href = "mypage/testList";
		});
		$("#myPoint").click(function(){
			location.href = "mypage/pointList";
		});
		
		$("#PwdCancel").click(function() {
			$("#userPwdConfirm").modal('hide');
			$('.modal-backdrop').remove();
		});
		
		$("#PwdSubmit").click(function() {
			var myPassword = SHA256($('#myPassword').val());
	
			if (myPassword === "") {
				alert("비밀번호를 입력해주세요.");
			} else {	
				pwdConfirm(myPassword);
			}
		
		});
	});
	
	$(document).ready(function(){

		$('.container').each(function(){
		var highestBox = 0;
		$('.card-columns', this).each(function(){

		if($(this).height() > highestBox)
		highestBox = $(this).height();
		});

		$('.card-columns',this).height(highestBox);

		});

		});

</script>

<style>

#mypagemenu{
width: 100%;
margin: 5px;
}

</style>

<div class="page-wrapper">
       <div class="container-fluid">
				<div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor">My page</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                                <li class="breadcrumb-item active">My page</li>
                            </ol>
                            
                        </div>
                    </div>
                </div>
			 
			<div class="card">
			<div class="card-body">
				<div class="card-columns" id="mypagemenu">
			 		<div class="card text-center">
			    		<img class="card-img-top" src="${pageContext.servletContext.contextPath}/${sessionScope.loginUserImg}" alt="Card image" style="width:50%; margin:5%">
			    		<div class="card-body">
			      			<h4 class="card-title">ID: ${sessionScope.login}</h4>
			      			<p class="card-text">Nick: ${sessionScope.loginUserNick }</p>
			    		</div>
			  		</div>
			  	
			  		<div class="card text-center">
			    		<img class="card-img-top" src="resources/images/mypage/bronze-medal.png" alt="Card image" style="width:50%; margin:5%;">
			    		<div class="card-body">
			      			<h4 class="card-title">gradeName</h4>
			      			<p class="card-text">gradePoint</p>
			    		</div>
			  		</div>
			
			  		<div class="card text-center" id="myPoint">
			    		<img class="card-img-top" src="resources/images/mypage/bean.png" alt="Card image" style="width:50%; margin:5%;">
			    		<div class="card-body">
			      			<h4 class="card-title">point...</h4>
			      			<p class="card-text">??</p>
			    		</div>
			  		</div>
			  	</div>
			  	<br><br>
			  	<div class="card-body text-center" style="padding-bottom:30px">
			  		<input type="button" class="btn btn-primary" id="userInfoUpdate" value="회원정보수정" >
			  		<input type="button" class="btn btn-primary" id="pwUpdate" value="비밀번호수정">
			  		<input type="button" class="btn btn-primary" id="myVideo" value="구매강의">
			  		<input type="button" class="btn btn-primary" id="myPayment" value="결제내역">
			  		<input type="button" class="btn btn-primary" id="myBoard" value="내가 작성한 게시글">
			  		<input type="button" class="btn btn-primary" id="myTest" value="내가푼 문제">
					<input type="button" class="btn btn-primary" id="userDelete" value="회원탈퇴">
				</div>
		 	</div>
		 	</div>
	</div>
</div>



<div class="modal" id="userPwdConfirm">
	<div class="modal-dialog">
		<div class="modal-content" style="padding:0px">
			<div class="modal-header">		
				<h4 class="modal-title" id="userPwdConTitle" style="color: tomato;">회원정보를 수정하시겠습니까?</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			</div>
			<div class="modal-body" id="userPwdConContent">
			<h5 style=" margin-top: 10px; color: DimGray;">비밀번호를 한번 더 확인합니다</h5>
			<br>
				<div style="color: DimGray; font-size: 14px; margin-bottom: 2%;">
					<strong>비밀번호를 입력해주세요</strong>
				</div>
				<input type="password" id="myPassword" name="myPassword" class="form-control" style="width: 100%">
			</div>
			<div class="modal-footer">
				<button type="button" id="PwdCancel" class="btn btn-primary btnCancel">취소</button>
				<button type="button" id="PwdSubmit" class="btn btn-primary btnStyle">확인</button>
			</div>
		</div>
	</div>
	</div>
  	
  		

