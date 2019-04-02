<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<script>
	$(function() {
		settingInitData();

		$("#execute").click(function() {
			var myPassword = $('#inputUserPW').val();

			if (myPassword === "") {
				alert("비밀번호를 입력해주세요.")
				return false;
			} else {
				pwdConfirm(SHA256(myPassword))
				return true;
			}

		});

		$("#cancelBtn").click(function() {
			location.href = "${pageContext.servletContext.contextPath}/mypage";
		});

		$("#userDeleteCancel").click(function() {
			$("#confirmModal").modal("hide");
		});

		$("#userDeleteSubmit")
				.click(
						function() {
							$
									.ajax({
										type : "post",
										url : "deleteUser",
										success : function(responseData,
												status, xhr) {
											console.log('탈퇴성공');
											$("#confirmModal").modal('hide');
											$('.modal-backdrop').remove()

											location.href = "${pageContext.servletContext.contextPath}/mypage/exitCompleted"
										},
										error : function(xhr, status, error) {
											console.log("pwdConfirm Error:"
													+ error);
										}
									});
						});

	});

	function settingInitData() {
		$("#inputUserID").val("${sessionScope.login}");

	}

	function pwdConfirm(myPassword) {

		$.ajax({
			type : "post",
			url : "pwdCheck",
			data : {
				password : myPassword
			},
			success : function(responseData, status, xhr) {
				if (responseData === "Y") {
					console.log("성공!");
					$("#confirmModal").modal();
				} else if (responseData === "N") {
					alert("비밀번호가 일치하지 않습니다.");
				}
			},
			error : function(xhr, status, error) {
				console.log("pwdConfirm Error:" + error);
			}
		});

	}
</script>


<div class="page-wrapper">
	<div class="container-fluid">

		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">회원탈퇴</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0)">My
								page</a></li>
						<li class="breadcrumb-item active">User Delete</li>
					</ol>

				</div>
			</div>
		</div>

		<div class="card col-md-6" style="margin:0 auto">
			<div class="card-body">
						<h4 class="text-center">
							<strong>그 동안 이용해주셔서 감사합니다.</strong>
						</h4>
						<hr>
						<form id="deleteUserFrm" method="post">
							<div class="form-group">
								<div class="font1">아이디</div>
								<input type="text" class="form-control" id="inputUserID"
									name="inputUserID" readonly="readonly">
							</div>
							<div class="form-group">
								<div class="font1">비밀번호</div>
								<input type="password" class="form-control" id="inputUserPW"
									name="inputUserPW" placeholder="비밀번호를 입력하세요."
									required="required">
							</div>
							<div class="text-center">
							<button type="button" onclick="cancelBtn"  id="cancelBtn"
								class="btn waves-effect waves-light btn-danger">취소</button>
							<button type="button" class="btn btn-primary" data-toggle="modal"
							id="execute" data-target="#confirmModal" data-whatever="@mdo">탈퇴</button>
							</div>	
						</form>

			</div>

			<div class="modal" id="confirmModal" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" style="padding: 0px">
						<div class="modal-header">
							<h4 class="modal-title" id="userPwdConTitle"
								style="color: tomato;">
								<strong>정말로 탈퇴하시겠습니까?</strong>
							</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body" id="userPwdConContent">
							<h5 style="margin-top: 10px; color: DimGray;">탈퇴한
								아이디/이메일/닉네임은 다시 사용할 수 없습니다.</h5>
							<br>

						</div>
						<div class="modal-footer">
							<button type="button" id="userDeleteCancel"
								class="btn btn-danger btnCancel">취소</button>
							<button type="button" id="userDeleteSubmit"
								class="btn btn-danger btnStyle">확인</button>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
</div>

