<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/col/file.css">

<script type="text/javascript">
	$(function() {

		settingInitData();

		var beforeNick = "${userInfo.userNick}";
		var beforeEmail = "${userInfo.userEmail}";
		var beforeInter = "${userInfo.userInter}";

		$("#nickOverBtn").click(function() {
			overlapNick();
		});

		$("#emailOverBtn").click(function() {
			overlapEmail();
		});

		$("#submitUpdateBtn").click(function() {
			updateUserInfo(beforeNick, beforeEmail, beforeInter);
		});

		$("#nickModBtn").attr("data-dismiss", "modal").click(function() {
			$("#updateNick").val('Y');
			readOnly();
		});
		$("#emailModBtn").attr("data-dismiss", "modal").click(function() {
			$("#updateEmail").val('Y');
			readOnly();
		});

		$("#nickModConcel").click(function() {
			$("#nickOverModal").modal('hide');
			$('.modal-backdrop').remove();
		});

		$("#emailModConcel").click(function() {
			$("#emailOverModal").modal('hide');
			$('.modal-backdrop').remove();
		});

		var fileTarget = $('.filebox .upload-hidden');

		fileTarget.on('change',
				function() { // 값이 변경되면
					if (window.FileReader) { // modern browser
						var filename = $(this)[0].files[0].name;
					} else { // old IE
						var filename = $(this).val().split('/').pop().split(
								'\\').pop(); // 파일명만 추출
					}

					// 추출한 파일명 삽입
					$(this).siblings('.upload-name').val(filename);
				});

		$('#userNick').keyup(function() {
			if ($(this).val().length < 2) {
				//최소 길이 2
				$("#checkNickMsg").html("닉네임은 최소 두자리 이상으로 해주세요");

			} else {
				$('#nickOverBtn').removeAttr("disabled")

			}
		});

		$('#userEmail').keyup(function() {

			let msg = validateEmail($(this).val());
			if (!validateEmail($(this).val())) {
				//이메일 규약 필터링
				$("#checkEmailMsg").html("올바른 이메일주소를 입력해주세요");

			} else if ($(this).val().length != 0) {
				$('#emailOverBtn').removeAttr("disabled");
			}
		});

	});

	/* 회원 기초데이터 셋팅 */
	function settingInitData() {
		$("#userIDs").val("${userInfo.userID}");
		$("#userName").val("${userInfo.userName}");
		$("#userNick").val("${userInfo.userNick}");
		$("#userEmail").val("${userInfo.userEmail}");
		$("#userInter").val("${userInfo.userInter}");

		console.log("회원ID:${userInfo.userID}");
	}

	function updateUserInfo(beforeNick, beforeEmail, beforeInter) {

		var userNick = $("#userNick").val();
		var userEmail = $("#userEmail").val();
		var userInter = $("#userInter").val();

		var flag = false;

		if (userNick === "" || userEmail === "") {
			alert("빈칸이 없는지 확인해주세요.");
		} else {

			if (!((beforeNick == userNick) ^ (beforeEmail == userEmail))) {
				flag = true;
			} else {
				if (beforeNick != userNick) {
					if ($("#updateNick").val() === "Y")
						flag = true;
				}

				if (beforeEmail != userEmail) {
					if ($("#updateEmail").val() === "Y")
						flag = true;
				}
			}

			if (flag) {
				$("#updateFrm").attr("action", "updateUserInfo");
				$("#updateFrm").submit();
			} else {
				alert("닉네임/이메일 변경 시, 중복확인을 하셔야 합니다.");
			}
		}
	}

	/* 닉네임 중복체크 */
	function overlapNick() {
		var userNick = $("#userNick").val();

		if (userNick !== '${userInfo.userNick}') {
			$.ajax({
				type : "post",
				url : "duplicateNick",
				data : {
					userNick : userNick
				},
				dataType : "text",
				success : function(responseData, status, xhr) {

					console.log(responseData);
					$('#nickOverModal').modal();
					if (responseData === 'Y') {
						// 중복아님. 사용가능함.
						$("#dupNickContent").text(userNick + "(은/는) 사용가능합니다.");
						$("#nickModBtn").show();
						$("#nickOverBtn").attr("disabled","disabled");

					} else if (responseData === 'N') {
						// 중복. 사용불가능.
						$("#updateNick").val('N');
						$("#dupNickContent").text(
								userNick + "(은/는) 사용할 수 없습니다.");
						$("#nickModBtn").hide();
					}
				},
				error : function(xhr, status, error) {
					console.log(error);
				}

			});
		}

	}

	/* 이메일 중복체크 */
	function overlapEmail() {
		var userEmail = $("#userEmail").val();

		if (userEmail !== '${userInfo.userEmail}') {
			$.ajax({
				type : "post",
				url : "duplicateEmail",
				data : {
					userEmail : userEmail
				},
				dataType : "text",
				success : function(responseData, status, xhr) {

					$('#emailOverModal').modal();
					if (responseData === 'Y') {

						$("#dupEmailContent")
								.text(userEmail + "(은/는) 사용가능합니다.");
						$("#emailModBtn").show();
						$("#emailOverBtn").attr("disabled","disabled");

					} else if (responseData === 'N') {
						// 중복. 사용불가능.
						$("#updateEmail").val('N');
						$("#dupEmailContent").text(
								userEmail + "(은/는) 사용할 수 없습니다.");
						$("#emailModBtn").hide();
					}
				},
				error : function(xhr, status, error) {
					console.log(error);
				}

			});
		}

	}

	function readOnly() {

		if ($("#updateNick").val() === 'Y') {
			$("#userNick").attr("readonly", true);
		}

		if ($("#updateEmail").val() === 'Y') {
			$("#userEmail").attr("readonly", true);
		}
	}

	function validateEmail($email) {
		if ($email == null) {
			//널값 제외
			return false;
		}
		var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		//이메일 규약  example@sample.com
		return emailReg.test($email);
		//비교하여 값 반환
	}

	function LoadImg(value) {
		if (value.files && value.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#userImg').attr('src', e.target.result);
			}

			reader.readAsDataURL(value.files[0]);
		}
	}

	function ResetImg() {
		$('#userImg').val('');
		$('#userImg')
				.attr('src',
						'${pageContext.servletContext.contextPath}/resources/images/unknown2.jpg');

		if (/(MSIE|Trident)/.test(navigator.userAgent)) {
			// ie 일때 input[type=file] init.
			$("#fileUpload").replaceWith($("#fileUpload").clone(true));
		} else {
			// other browser 일때 input[type=file] init.
			$("#fileUpload").val("");
		}

	}
</script>

	
	
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
                                <li class="breadcrumb-item"><a href="javascript:void(0)">My page</a></li>
                                <li class="breadcrumb-item active">Info Update</li>
                            </ol>
                            
                        </div>
                    </div>
                </div> 
            
  <div class="card">
   <div class="row">
   <div class="container" style=" width:5%; ">	</div>

 

<div class="contrainer margin_10" style="width:60%;margin: 5%; margin-top: 5%;" >
	
	<div class="row">
		<div class="col-md-6 col-md-offset-4" style="width: 150%; ">
			<h4>
				<strong>회원정보수정</strong>
			</h4>
			<hr>
			<form id="updateFrm" method="post" enctype="multipart/form-data">
				<div class="form-group"
					style="margin-top: 20px; margin-bottom: 50px;">
					<div class="font1">회원사진</div>
					<div class="row">
						<img
							src="${pageContext.servletContext.contextPath}/${userInfo.userImg}"
							id="userImg" class="img-circle img-responsive center-block"
							style="width: 300px; height: 300px; object-fit: cover;">
					</div>
					<div class="filebox">

						<input class="upload-name"
							style="width: 60%; float: left; height: 40px;">
							<!-- 기본화면설정 -->
						<button type="button" class="btn waves-effect waves-light btn-primary"
							id="resetImg"
							style="width: 20%; float: right; height: 40px; text-align: center;"
							 onclick="ResetImg()">초기화</button>
			
						<label for="fileUpload" style="width: 20%; float: right; height: 40px; text-align: center; background-color:white">파일업로드</label>
						<input type="file" id="fileUpload" name="file" class="upload-hidden"
							style="width: 25%; float: right; height: 40px;" onchange="LoadImg(this);"> 
		
					</div>
				</div>

				<%-- 				<div class="form-group">
							<div class="font1">회원사진</div>
							
								<div class="row">
									<img src="${pageContext.servletContext.contextPath}/resources/images/mypage/dobby.PNG" class="img-circle img-responsive center-block" style="width: 100px; height: 100px; object-fit:cover;">
									<input type="button" id="submitBtn" class="btn_full" style="background-color: Mint; width:50%; height:50%" value="사진변경">					
								</div>
						</div> --%>
				<hr>
				<div class="form-group">
					<div class="font1">회원이름</div>
					<input type="text" class="form-control" id="userName" name="userName" readonly="readonly">
				</div>

				<div class="form-group">
					<div class="font1">회원아이디</div>
					<input type="text" class="form-control" id="userIDs" name="userIDs" readonly="readonly">
				</div>

				<div class="form-group">
					<div class="font1">회원닉네임</div>
					<input type="text" class="form-control" id="userNick" name="userNick"> 
					<input type="button" class="form-control" id="nickOverBtn" style="width: 25%; float: right" value="중복확인" disabled="disabled">
					<input type="hidden" id="updateNick" value="N">
				</div>

				<div class="form-group">
					<div class="font1">회원이메일</div>
					<input type="text" class="form-control" id="userEmail" name="userEmail"> 
					<input type="button" class="form-control" id="emailOverBtn" style="width: 25%; float: right" value="중복확인" disabled="disabled">
					<input type="hidden" id="updateEmail" value="N">
				</div>

				<div class="form-group">
					<div class="font1">관심분야</div>

					<select class="form-control" id="userInter" name="userInter">
						<option value="0">선택하세요</option>
						<option value="1">Java</option>
						<option value="2">C++</option>
						<option value="3">C</option>
						<option value="4">Python</option>
						<option value="5">JavaScript</option>
						<option value="6">CSS</option>
					</select>
				</div>

				<div id="pass-info" class="clearfix"></div>
				
				<div class="text-center">
					<button type="button" id="submitUpdateBtn" 
					class="btn waves-effect waves-light btn-info">회원정보수정</button>
					
					<button type="button" onclick="document.location.href='${pageContext.servletContext.contextPath}/mypage'" 
					class="btn waves-effect waves-light btn-danger">취소</button>
				</div>
			</form>
			<hr>
		</div>
	</div>
	</div>
</div>


<!-- 닉네임확인 모달창 -->
<div class="modal" id="nickOverModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="dupNickTitle" style="color: tomato;">닉네임 중복확인</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body" id="dupNickContent"></div>
			<div class="modal-footer">
				<button type="button" id="nickModConcel" class="btn btn-danger btnStyle">취소</button>
				<button type="button" id="nickModBtn" class="btn btn-primary btnStyle">사용하기</button>
			</div>
		</div>
	</div>
</div>
</div>


<!-- 이메일확인 모달창 -->
<div class="modal" id="emailOverModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="dupEmailTitle" style="color: tomato;">닉네임
					중복확인</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body" id="dupEmailContent"></div>
			<div class="modal-footer">
				<button type="button" id="emailModConcel"
					class="btn btn-danger btnStyle">취소</button>
				<button type="button" id="emailModBtn"
					class="btn btn-primary btnStyle">사용하기</button>
			</div>
		</div>
	</div>
</div>



</div>
</div>

