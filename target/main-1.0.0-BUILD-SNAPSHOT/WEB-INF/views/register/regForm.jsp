<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.servletContext.contextPath}/resources/js/sha256.js"></script>
<script>
  //제출시 비활성화 확인 안됨.
  //회원가입시 필터링 및 중복 검색
  //폼 기본 내용 확인용
  var formCheck = new Map();
  $().ready(function (){//페이지 로드시

    //폼 제출시 플래그 확인용
    //주요 정보라 따로 플래그 생성
    formCheck.set("userID", false);//아이디 확인
    formCheck.set("userEmail", false);//이메일 확인
    formCheck.set("userNick", false);//닉네임 확인
    formCheck.set("userPW", false);//패스워드 확인
    formCheck.set("userPWC", false);//패스워드확인 확인


    //ID 필터링 및 중복 방지
    $('#regForm [name="userID"]').keyup(function(event){
      //userID inputBOX에서 입력 발생시 실행
      if (!(event.keyCode >=37 && event.keyCode<=40)) {
        //한글 입력 제한
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
        if($(this).val().length==0)
          return false;
      }

      //입력발생시 플래그 변환
      formCheck.set("userID", false);
      if($(this).val().length<4){
        //ID 최소 길이 제한
        $("#checkIDMsg").html("아이디는 4자리 이상으로 해주세요");

        //$(this).css("-webkit-animation","warning 2s 1");

        // $('#regForm [name="userID"]').css("background-color", "#FF4B4B");
      }else{
        //ajax 실행 대기 이미지
        if(!$('#regLoading').length){//이미지가 존재하지 않을시 생성 및 위치 조정.
          let left = $(this).width();
          let top = $(this).offset().top-2*$(this).outerHeight(true)-3;
          $('#regForm').append("<img id='regLoading'" +
              " src='${pageContext.servletContext.contextPath}/resources/images/animation/Spinner-1s-200px.gif'" +
              " height='"+$(this).outerHeight(true)+"'"+
              "style='position:absolute;left:"+left+"px;top:"+top+"px;'"+
              ">");
        }else{//존재시 위치 조정 및 visible
          let left = $(this).width();
          let top = $(this).offset().top-2*$(this).outerHeight(true)-3;
          $('#regLoading').css("visibility","visible");
          $('#regLoading').css("left",left+"px");
          $('#regLoading').css("top",top+"px");
        }
        //ajax 실행
        $.ajax({
          type : 'post',
          url : '${pageContext.servletContext.contextPath}' + '/register/checkID',
          data : {userID:$('#regForm [name="userID"]').val()}
        },1000).done(function(msg){
          if(msg!=" "){
            //아이디 사용중일때
            $("#checkIDMsg").html(msg);
            $("#checkIDMsg").html("이미 사용중인 아이디입니다");
            // $('#regForm [name="userID"]').css("background-color", "#FF4B4B");
          }else{
            //아이디 중복 없음.
            formCheck.set("userID", true);
            $("#checkIDMsg").html("&nbsp");
            // $('#regForm [name="userID"]').css("background-color", "#7FFF77");
          }
        }).fail(function(xhr, status, errorThrown) {
          //기타 오류 처리
          /*
          $("#text").html("오류가 발생했습니다.<br>")

              .append("오류명: " + errorThrown + "<br>")

              .append("상태: " + status);
          */
        }).always(function(){
          //항상 실행, 아작스 로딩 이미지 hidden
          if($('#regLoading').length){
            $('#regLoading').css("visibility","hidden");
          }
        })
      }

    });
    //이메일 필터링 및 중복 방지
    $('#regForm [name="userEmail"]').keyup(function(){
      //이메일 입력칸에서 입력 발생시
      //입력 발생시 플래그 초기화
      formCheck.set("userEmail", false);
      if(!validateEmail($(this).val())){
        //이메일 규약 필터링
        $("#checkEmailMsg").html("올바른 이메일주소를 입력해주세요");

        // $('#regForm [name="userEmail"]').css("background-color", "#FF4B4B");
      }else if($(this).val().length!=0){
        //길이가 0일때 미실행.
        //ajax 실행 대기 이미지
        if(!$('#regLoading').length){
          let left = $(this).width();
          let top = $(this).offset().top-2*$(this).outerHeight(true)-3;
          $('#regForm').append("<img id='regLoading'" +
              " src='${pageContext.servletContext.contextPath}/resources/images/animation/Spinner-1s-200px.gif'" +
              " height='"+$(this).outerHeight(true)+"'"+
              "style='position:absolute;left:"+left+"px;top:"+top+"px;'"+
              ">");
        }else{
          let left = $(this).width();
          let top = $(this).offset().top-2*$(this).outerHeight(true)-3;

          $('#regLoading').css("visibility","visible");
          $('#regLoading').css("left",left+"px");
          $('#regLoading').css("top",top+"px");
        }
        //ajax 실행
        $.ajax({
          type : 'post',
          url : '${pageContext.servletContext.contextPath}' + '/register/checkEmail',
          data : {userEmail:$('#regForm [name="userEmail"]').val()}
        },1000).done(function(msg){
          if(msg!=" "){
            //이메일 중복
            $("#checkEmailMsg").html(msg);
            $("#checkEmailMsg").html("이미 등록된 이메일입니다");
            // $('#regForm [name="userEmail"]').css("background-color", "#FF4B4B");
          }else{
            //이메일 중복 아님
            formCheck.set("userEmail", true);
            $("#checkEmailMsg").html("&nbsp");

            // $('#regForm [name="userEmail"]').css("background-color", "#7FFF77");
          }
        }).fail(function(xhr, status, errorThrown) {
          //예상치못한 오류
          /*
          $("#text").html("오류가 발생했습니다.<br>")

              .append("오류명: " + errorThrown + "<br>")

              .append("상태: " + status);
          */
        }).always(function(){
          //ajax 로딩 이미지 hidden
          if($('#regLoading').length){
            $('#regLoading').css("visibility","hidden");
          }
        })
      }

    });

    //닉네임 필터링 및 중복 방지
    $('#regForm [name="userNick"]').keyup(function(){
      //닉네임 입력시 실행
      //닉네임 플래그 초기화
      formCheck.set("userNick", false);
      if($(this).val().length<2){
        //최소 길이 2
        $("#checkNickMsg").html("닉네임은 최소 두자리 이상으로 해주세요");

        // $('#regForm [name="userNick"]').css("background-color", "#FF4B4B");
      }else{
        //ajax 실행 대기 이미지
        if(!$('#regLoading').length){
          let left = $(this).width();
          let top = $(this).offset().top-2*$(this).outerHeight(true);
          $('#regForm').append("<img id='regLoading'" +
              " src='${pageContext.servletContext.contextPath}/resources/images/animation/Spinner-1s-200px.gif'" +
              " height='"+$(this).outerHeight(true)+"'"+
              "style='position:absolute;left:"+left+"px;top:"+top+"px;'"+
              ">");
        }else{
          let left = $(this).width();
          let top = $(this).offset().top-2*$(this).outerHeight(true);
          $('#regLoading').css("visibility","visible");
          $('#regLoading').css("left",left+"px");
          $('#regLoading').css("top",top+"px");
        }
        //ajax 실행
        $.ajax({
          type : 'post',
          url : '${pageContext.servletContext.contextPath}' + '/register/checkNick',
          data : {userNick:$('#regForm [name="userNick"]').val()}
        },1000).done(function(msg){
          if(msg!=" "){
            //중복 처리
            $("#checkNickMsg").html("&nbsp");
            $("#checkNickMsg").html("이미 사용중인 닉네임입니다");
            // $('#regForm [name="userNick"]').css("background-color", "#FF4B4B");
          }else{
            //중복 아닐시
            formCheck.set("userNick", true);
            $("#checkNickMsg").html("&nbsp");

            // $('#regForm [name="userNick"]').css("background-color", "#7FFF77");
          }
        }).fail(function(xhr, status, errorThrown) {
          //예상치못한 오류
          /*
          $("#text").html("오류가 발생했습니다.<br>")

              .append("오류명: " + errorThrown + "<br>")

              .append("상태: " + status);
          */
        }).always(function(){
          //ajax 로딩 이미지 hidden
          if($('#regLoading').length){
            $('#regLoading').css("visibility","hidden");
          }
        })
      }

    });

    //패스워드 필터링
    $('#regForm [name="userPW"]').keyup(function(){
      //패스워드 입력 발생시
      //패스워드 플래그 초기화
      formCheck.set("userPW", false);
      let msg = validchain1($(this).val());
      //패스워드 규약 체인
      //패스워드 길이 규약 6~16 - 체인 1
      //패스워드 입력 문자 제한 - 체인 2
      //패스워드 아이디 동일 제한 - 체인 3

      if(msg!="success"){
        //패스워드 규약 X
        $("#checkPWMsg").html(msg);
        //관련 규약 오류메시지 출력
        return false;
      }

      formCheck.set("userPW", true);
      //플래그 ON
      $("#checkPWMsg").html("&nbsp");
      //규약 통과시 메시지 출력칸 초기화
    });
    //패스워드 확인 체크
    $('#regForm [name="userPWC"]').keyup(function(){
      //패스워드 확인 입력 발생시 실행
      //플래그 초기화
      formCheck.set("userPWC", false);
      if($(this).val()==$('#regForm [name="userPW"]').val()){
        //동일 여부 확인
        formCheck.set("userPWC", true);
        //동일시 패스워드 확인 플래그 ON
        $("#checkPWCMsg").html("&nbsp");
        return false;
      }
      formCheck.set("userPWC", false);
      //미동일시 플래그 초기화
      $("#checkPWCMsg").html("패스워드와 동일하게 입력해주세요");
      //오류 메시지 출력
    });

    //이메일 규약 -필터링에 사용
    function validateEmail($email) {
      if($email==null){
        //널값 제외
        return false;
      }
      var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
      //이메일 규약  example@sample.com
      return emailReg.test( $email );
      //비교하여 값 반환
    }
    //패스워드 규약 체인1 - 패스워드 길이 6~16자
    function validchain1($PW){
      if($PW.length>=6&&$PW.length<=16){
        return validChain2($PW);
      }
      return "비밀번호는 6자이상 16자이상으로 해주세요";
    }
    //패스워드 규약 체인2 - 패스워드 입력 문자 제한
    function validChain2($PW){
      var valid = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;
      if(valid.test($PW)){
        return validChain3($PW);
      }
      return "비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용해주세요";
    }
    //패스워드 규약 체인3 - 패스워드와 아이디 동일시 제한
    function validChain3($PW){
      if($PW==$("#regForm [name='userID']").val()){
        return "비밀번호는 아이디와 동일해서는 안됩니다";
      }
      console.log(SHA256($('#regForm [name="userPW"]').val()));

      return "success";
    }

    //여기까지 패이지 로드시 실행
  });

  //제출 버튼 클릭 이벤트
  function registerSubmit(){
    $(this).prop("disabled", true);
    let inputCheck = false;
    $('#regForm input').each(function(){
      //입력칸 모두 확인
      if($(this).val()==""||$(this).val()==null){
        //빈칸확인시
        inputCheck = false;
        $(this).prop("disabled", false);
        return false;

      }else{
        inputCheck= true;
      }
    });
    for (var [key, value] of formCheck) {
      //입력 확인 플래그 확인
      if(!value){
        $(this).prop("disabled", false);
        inputCheck=false;

        $("#regForm [name="+key+"]").css("border","2px solid #FF0000");
      }
    }
    if(inputCheck){
      $('#regForm input').prop("disabled", true);

      //json 데이터로 전송을 위해 처리
      let userData = "{";
      $('#regForm input').each(function(){
        if(!$(this).is('[class="userPWC"]')){
          if($(this).is('[type="password"]')){
            //비밀번호 암호화
            userData += '"'+$(this).attr('name')+'"'+':"'+SHA256($(this).val())+'"';
          }else{
            //
            userData+='"'+$(this).attr('name')+'"'+':"'+$(this).val()+'"';
          }
          userData+=",";
        }
      });
      userData = userData.substr(0, userData.length -1);
      userData+="}";
      //JSON 처리 완료
      $.ajax({
        type : 'post',
        url : '${pageContext.servletContext.contextPath}' + '/register',
        data : JSON.parse(userData)
      },1000)
      .done(function (redirectURI) {
        document.location.href = '${pageContext.servletContext.contextPath}'+redirectURI;
      })
      .fail(function(xhr, status, errorThrown) {
        //예상치못한 오류
        /*
        $("#text").html("오류가 발생했습니다.<br>")

            .append("오류명: " + errorThrown + "<br>")

            .append("상태: " + status);
        */

      })



      //ajax로 처리 하여 아래 구문 미사용.
      //유저 비밀번호 암호화 하여 전송
      //$('#regForm [name="userPW"]').val(SHA256($('#regForm [name="userPW"]').val()));

      //$('#regForm').submit()
    }
  }

  //특수 문자 입력 제한
  function checkNumber(){
    var objEv = event.srcElement;
    var num ="{}[]()<>?_|~`!@#$%^&*-+\"'\\/ ";    //입력을 막을 특수문자 기재.
    event.returnValue = true;

    for (var i=0;i<objEv.value.length;i++)
    {
      if(-1 != num.indexOf(objEv.value.charAt(i)))
        event.returnValue = false;
    }
    if (!event.returnValue)
    {
      alert("특수문자는 입력하실 수 없습니다.");
      objEv.value="";
    }
  }
</script>

<div class="page-wrapper">
<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">회원가입</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
						<li class="breadcrumb-item active">Register</li>
					</ol>
				</div>
			</div>
		</div>
			<div class="card col-md-6" style="margin:0 auto">
				<div class="card-body">
					<form id="regForm" method="post" action="${pageContext.servletContext.contextPath}/register">
						<div class="form-group" >
							<label>회원아이디</label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
	                            	<span class="input-group-text" id="basic-addon1"><i class="ti-face-smile"></i></span>
	                            </div>
								<input type="text" class="form-control" class="userID" name="userID" placeholder="아이디를 입력하세요" required="required"  style="ime-mode:disabled;" >
								<span id="checkIDMsg">&nbsp;</span>
							</div>
						</div>
						<div class="form-group">
							<label>회원이메일</label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
                                	<span class="input-group-text" id="basic-addon2"><i class="ti-email"></i></span>
                                </div>
								<input type="text" class="form-control" class="userEmail" name="userEmail"  placeholder="example@gmail.com" required="required">
								<span id="checkEmailMsg">&nbsp;</span>
							</div>
						</div>
						<div class="form-group" >
							<label>이름</label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
                                	<span class="input-group-text" id="basic-addon2"><i class="ti-user"></i></span>
                                </div>
								<input type="text" class="form-control" class="userName" name="userName"  placeholder="이름을 입력해주세요" required="required" onkeyup="checkNumber();">
							</div>			
						</div>
						<div class="form-group" >
							<label>닉네임</label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
                                	<span class="input-group-text" id="basic-addon2"><i class="ti-user"></i></span>
                                </div>
								<input type="text" class="form-control" class="userNick" name="userNick"  placeholder="닉네임을 입력해주세요" required="required" onkeyup="checkNumber();">
								<span id="checkNickMsg">&nbsp;</span>
							</div>
						</div>
						<div class="form-group">
							<label>비밀번호</label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
                                	<span class="input-group-text" id="basic-addon3"><i class="ti-lock"></i></span>
                                </div>
								<input type="password" class="form-control" class="userPW" name="userPW" placeholder="비밀번호를 입력하세요" required="required">
								<span id="checkPWMsg">&nbsp;</span>
							</div>
						</div>
	                    <div class="form-group">
	                        <label>비밀번호 확인</label>
	                        <div class="input-group mb-3">
	                        	<div class="input-group-prepend">
                                	<span class="input-group-text" id="basic-addon3"><i class="ti-lock"></i></span>
                                </div>
	                        	<input type="password" class="form-control" class="userPWC" name="userPWC" placeholder="비밀번호를 입력하세요" required="required">
	                        	<span id="checkPWCMsg">&nbsp;</span>
	                        </div>
						</div>
					</form>
                  </div>
                  <div class="card-body text-center">
						<div id="pass-info" class="clearfix"></div>
						<button class="btn btn-primary waves-effect waves-light m-r-10" onclick="registerSubmit();">회원가입</button>
				  </div>
				
			</div>
		</div>
		</div>