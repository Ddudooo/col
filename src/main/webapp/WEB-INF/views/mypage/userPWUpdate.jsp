<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="${pageContext.servletContext.contextPath}/resources/js/sha256.js"></script>

<script>
	var formCheck = new Map();
	formCheck.set("userPW", false);
	formCheck.set("userNewPW", false);
	formCheck.set("userNewPW2", false);

	$(function() {
		var userPW = "${userPWMap.userPW}";

		$("#submitPWBtn").click(function() {
			userPWUpdate(userPW);
		});

		$("#cancelPWBtn").click(function() {
			location.href = "${pageContext.servletContext.contextPath}/mypage";
		});

		$('#userNewPW').keyup(function() {
			formCheck.set("userNewPW", false);
			let msg = validchain1($(this).val());
			if (msg != "success") {

				$("#checkPWMsg").html(msg);
				return false;
			}
			formCheck.set("userNewPW", true);

			$("#checkPWMsg").html(" ");
		});

		$('#userNewPW2').keyup(function() {
			if ($(this).val() == $('#userNewPW').val()) {
				formCheck.set("userNewPW", true);
				$("#checkPWMsg2").html(" ");
				return false;
			}
			formCheck.set("userNewPW", false);
			$("#checkPWMsg2").html("패스워드와 동일하게 입력해주세요");
		});
	});

	function validchain1($PW) {
		if ($PW.length >= 6 && $PW.length <= 16) {
			return validChain2($PW);
		}
		return "비밀번호는 6자이상 16자이상으로 해주세요";
	}

	function validChain2($PW) {
		var valid = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;
		if (valid.test($PW)) {
			return "success";
		}
		return "비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용해주세요";
	}

	function userPWUpdate(userPW) {
		let inputCheck = false;
		$('#updatePWFrm input').each(function() {
			if ($(this).val() == "" || $(this).val() == null) {
				inputCheck = false;

				return false;

			} else {
				inputCheck = true;
			}
		});
		console.log(inputCheck);

		if (inputCheck) {

			var inputUserPW = SHA256($("#inputUserPW").val());
			var userNewPW = SHA256($("#userNewPW").val());
			var userNewPW2 = SHA256($("#userNewPW2").val());

			var blank = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
			console.log("inputUserPW:" + inputUserPW);
			console.log("userPW:" + userPW);
			console.log("userNewPW:" + userNewPW);
			console.log("userNewPW2:" + userNewPW2);

			if (userPW !== inputUserPW) {
				alert("비밀번호가 틀립니다. 다시 입력해주세요.");
			} else {
				if (userPW === userNewPW) {
					alert("현재 비밀번호와 같습니다.");
				} else {
					$
							.ajax({
								type : "post",
								url : "updatePWCom",
								data : {
									userNewPW : userNewPW
								},
								success : function(result, status, xhr) {
									location.href = "${pageContext.servletContext.contextPath}/mypage";
								},
								error : function(xhr, status, error) {
									console.log(error);
								}
							});
				}
			}
		}
	}
</script>


<div class="page-wrapper">
	<div class="container-fluid"">
		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">비밀번호 수정</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0)">My
								page</a></li>
						<li class="breadcrumb-item active">PW Update</li>
					</ol>

				</div>
			</div>
		</div>

		<div class="card col-md-6" style="margin:0 auto">
			<div class="card-body">
				<form id="updatePWFrm" method="post">
					<div class="form-group">
						<div class="font1">현재 비밀번호</div>
						<input type="password" class="form-control" id="inputUserPW"
							name="inputUserPW" placeholder="현재 비밀번호를 입력하세요."
							required="required">
					</div>
					<div class="form-group">
						<div class="font1">새 비밀번호</div>
							<input type="password" class="form-control" id="userNewPW"
								name="userNewPW" placeholder="새 비밀번호를 입력하세요."
								required="required"> <span id="checkPWMsg">&nbsp;</span>
						</div>
						<div class="form-group">
							<div class="font1">새 비밀번호 확인</div>
							<input type="password" class="form-control" id="userNewPW2"
								name="userNewPW2" placeholder="새 비밀번호를 한번 더 입력하세요."
								required="required"> <span id="checkPWMsg2">&nbsp;</span>
						</div>
						<div id="pass-info" class="clearfix"></div>
						<div class="text-center">
						<button type="button" id="submitPWBtn"
							class="btn waves-effect waves-light btn-info">비밀번호수정</button>
						<button type="button" id=cancelPWBtn
								class="btn waves-effect waves-light btn-danger">취소</button>
						</div>

					</form>
			</div>
		</div>
		
	</div>
</div>