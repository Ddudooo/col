<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.servletContext.contextPath}/resources/js/sha256.js"></script>

  <style>
  .modal-header-style, .close-modal {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  </style>
  


<div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">Code Of Legends</p>
        </div>
</div>

<div id="main-wrapper" >
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.servletContext.contextPath}">
                        <!-- Logo icon --><b>
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="${pageContext.servletContext.contextPath}/resources/images/col6.png" alt="homepage" class="dark-logo" width="50" height="30"/>
                            <!-- Light Logo icon -->
                            <img src="${pageContext.servletContext.contextPath}/resources/images/col6.png" alt="homepage" class="light-logo" width="50" height="30"/>
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text --><span>
                         <!-- dark Logo text -->
                         <img src="${pageContext.servletContext.contextPath}/resources/images/textcol1.png" alt="homepage" class="dark-logo" width="150"/>
                         <!-- Light Logo text -->    
                         <img src="${pageContext.servletContext.contextPath}/resources/images/textcol1.png" class="light-logo" alt="homepage" width="150" /></span> </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse" >
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto">
                        <!-- This is  -->
                        <li class="nav-item"> <a class="nav-link nav-toggler d-block d-md-none waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                        <li class="nav-item"> <a class="nav-link sidebartoggler d-none d-lg-block d-md-block waves-effect waves-dark" href="javascript:void(0)"><i class="icon-menu"></i></a> </li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class="nav-item">
                            <form class="app-search d-none d-md-block d-lg-block" action="${pageContext.servletContext.contextPath}/search">
                                <input type="text" class="form-control" id="searchBar"placeholder="Search & enter">
                            </form>
                        </li>
                    </ul>
                    
                    
                     <ul class="navbar-nav my-lg-10">
          			
	          			<li class="nav-item dropdown">
	                            <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span class="hidden-md-down">Test &nbsp;<i class="fa fa-angle-down"></i></span> </a>
	                            <div class="dropdown-menu dropdown-menu-right animated flipInY">
	                                <!-- text-->
	                                <a href="${pageContext.servletContext.contextPath}/test/testSurveyChoice" class="dropdown-item"><i class="ti-wallet"></i> 배치고사</a>
	                                <!-- text-->
	                                <a href="${pageContext.servletContext.contextPath}/test/list" class="dropdown-item"><i class="ti-wallet"></i> 상시고사</a>
	                                
	                            </div>
	                    </li>
	          			<li class="nav-item dropdown">
	                            <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span class="hidden-md-down">Community &nbsp;<i class="fa fa-angle-down"></i></span> </a>
	                            <div class="dropdown-menu dropdown-menu-right animated flipInY">
	                                <!-- text-->
	                                <a href="${pageContext.servletContext.contextPath}/board/list?boardCate=1" class="dropdown-item"><i class="ti-wallet"></i> 자유게시판</a>
	                                <!-- text-->
	                                <a href="${pageContext.servletContext.contextPath}/board/list?boardCate=2" class="dropdown-item"><i class="ti-wallet"></i> 질문게시판</a>
	                                
	                            </div>
	                    </li>
          			
          			
          				<li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="${pageContext.servletContext.contextPath}/channel/all" > <span class="hidden-md-down"> Channel &nbsp;<i class="fa fa-angle-down"></i></span></a> 
                        </li>
          			
          			</ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">
                        <!-- ============================================================== -->
                        <!-- Comment -->
                        <!-- ============================================================== -->
                        <c:if test="${sessionScope.login!=null}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="ti-email"></i>
                                <div class="notify otherNotify"> <span class="heartbit"></span> <span class="point"></span> </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right mailbox animated bounceInDown" style="z-index:999999;">
                                <ul>
                                    <li>
                                        <div class="drop-title">Notifications</div>
                                    </li>
                                    <li>
                                        <div class="message-center otherPreview">
                                            <!-- Message  sample-->
                                            <%--<a href="javascript:void(0)">--%>
                                                <%--<div class="btn btn-danger btn-circle"><i class="fa fa-link"></i></div>--%>
                                                <%--<div class="mail-contnet">--%>
                                                    <%--<h5>Luanch Admin</h5> <span class="mail-desc">Just see the my new admin!</span> <span class="time">9:30 AM</span> </div>--%>
                                            <%--</a>--%>
                                        </div>
                                    </li>
                                    <li>
                                        <a class="nav-link text-center link" href="javascript:void(0);"> <strong>Check all notifications</strong> <i class="fa fa-angle-right"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- End Comment -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- Messages -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle waves-effect waves-dark" href="" id="2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="icon-note"></i>
                                <div class="notify msgNotify"> <span class="heartbit"></span> <span class="point"></span> </div>
                            </a>
                            <div class="dropdown-menu mailbox dropdown-menu-right animated bounceInDown" aria-labelledby="2">
                                <ul>
                                    <li>
                                        <div class="drop-title newMsg">0건의 새로운 메시지가 있습니다</div>
                                    </li>
									<li>
										<div class="message-center msgPreview">
											<!-- Message  sample-->
												<%--<a href="javascript:void(0)">--%>
												<%--<div class="btn btn-danger btn-circle"><i class="fa fa-link"></i></div>--%>
												<%--<div class="mail-contnet">--%>
												<%--<h5>Luanch Admin</h5> <span class="mail-desc">Just see the my new admin!</span> <span class="time">9:30 AM</span> </div>--%>
												<%--</a>--%>
										</div>
									</li>
                                    <li>
                                        <a class="nav-link text-center link" href="${pageContext.servletContext.contextPath}/message/list"> <strong>See all e-Mails</strong> <i class="fa fa-angle-right"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </li>

                        <!-- ============================================================== -->
                        <!-- End Messages -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- mega menu -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown mega-dropdown"> 
                        <a class="nav-link dropdown-toggle waves-effect waves-dark" 
                           href="${pageContext.servletContext.contextPath}/basketTicket" 
                           >
                           <i class="ti-layout-width-default" href="${pageContext.servletContext.contextPath}/basket/Ticket"></i></a>
                           
                                    </li>
                        </c:if>
                        <!-- ============================================================== -->
                        <!-- End mega menu -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- User Profile -->
                        <!-- ============================================================== -->
                        
                        <c:if test="${sessionScope.login == null}" >
                        <!-- 로그인 -->
						 	<li class="nav-item dropdown">
                            	<a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" id="loginBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span class="hidden-md-down">Login &nbsp;<i class="fa fa-angle-down"></i></span> </a> 
                        	</li>
						 	
						 
						</c:if>
                        
                        <c:if test="${sessionScope.login != null}" >
                        <li class="nav-item dropdown u-pro">
                            <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${pageContext.servletContext.contextPath}/${sessionScope.loginUserImg}" alt="user" class="">
                            	 <span class="hidden-md-down">${sessionScope.loginUserNick} &nbsp;<i class="fa fa-angle-down"></i></span> </a>
                            <div class="dropdown-menu dropdown-menu-right animated flipInY">
                                <!-- text-->
                                <a href="${pageContext.servletContext.contextPath}/mypage" class="dropdown-item"><i class="ti-user"></i> Mypage</a>
                               
                                <!-- text-->
                                <a href="${pageContext.servletContext.contextPath}/${sessionScope.login}/channel" class="dropdown-item"><i class="ti-layout-media-right-alt"></i> My Channel</a>
                                <!-- text-->
                                <a href="${pageContext.servletContext.contextPath}/${sessionScope.login}/dash/live" class="dropdown-item"><i class="ti-files"></i> My DashBoard</a>
                                <!-- text-->
                                <a href="${pageContext.servletContext.contextPath}/basket" class="dropdown-item"><i class="ti-wallet"></i> My Basket</a>
                                
                                <!-- text-->
                                <div class="dropdown-divider"></div>
                                <!-- text-->
                                <a href="${pageContext.servletContext.contextPath}/logout" class="dropdown-item"><i class="fa fa-power-off"></i> Logout</a>
                                <!-- text-->
                            </div>
                        </li>
                        
                        </c:if>
                        <!-- ============================================================== -->
                        <!-- End User Profile -->
                        <!-- ============================================================== -->
                        
                    </ul>
                </div>
            </nav>
        </header>
        
        <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header modal-header-style" style="padding:35px 50px;">
        	<h4><span class="glyphicon glyphicon-lock"></span>Login</h4>
          <button type="button" class="close close-modal" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body login-body" style="padding:40px 50px;">
      
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control"  placeholder="Enter email" name="usrname" id="userID" required>
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" placeholder="Enter password" name="psw" id="userPW" required>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn waves-effect waves-light btn-block btn-success" onclick="login()"><span class="glyphicon glyphicon-off"></span> Login</button>
     		<div style="margin-top:20px">
				<!-- sns계정연동 구글 -->
				<button class="btn waves-effect waves-light btn-block btn-danger" type="submit" onclick="googleLogin();">
				<i class='fab fa-google-plus-g' style="font-size:100%;"></i>&nbsp;Sign in with Google
				</button>
				<!-- sns계정연동 카카오 -->
				<button class="btn waves-effect waves-light btn-block btn-warning" type="submit" onclick="kakaoLogin();">
				<i class='fa fa-comments' style="font-size:100%;"></i>&nbsp;Sign in with KaKao
				</button>
				<!-- sns계정연동 네이버 -->
				<button class="btn btn-success btn-block" type="submit" onclick="naverLogin();">
					N&nbsp;&nbsp;Sign in with Naver
				</button>
			</div>
        </div>
        
        <div class="modal-footer">
          <p>Not a member? <a href="${pageContext.servletContext.contextPath}/register/form">Sign Up</a></p>
          <p>Forgot <a href="${pageContext.servletContext.contextPath}/login/findIdForm">Password?</a></p>
        </div>
      </div>
      
    </div>
  </div>
  </div>


<script>
    var websocket = new WebSocket('ws://localhost:8080/col/count');
    $(document).ready(function(){
        $("#loginBtn").click(function(){
            $("#myModal").modal();
        });
        if(${sessionScope.login != null}){
            //로그인 되있을시
            $('.msgNotify').css("display","none");
            $('.otherNotify').css("display","none");
            websocket.onopen = function(evt) {
                websocket.send('{"login":"${sessionScope.login}"}');
                onOpen(evt);

            };
            function onOpen(evt){

            }

            websocket.onmessage = function(evt) {
                onMessage(evt);
            };
            function onMessage(evt) {
                //메시지 JSON형태로 날라옴
				console.log(JSON.parse(evt.data));
                let msgJSON = JSON.parse(evt.data);
                //메시지 알람
                if(!msgJSON.hasOwnProperty('msg')){
                    $('.newMsg').html("0건의 읽지않은 메시지가 있습니다");
                    $('#sideBarMsgCnt').html("");
                    $('.msgNotify').css("display","none");
                }else{
                    // alert(evt.data+"건의 읽지않은 메시지가 있습니다");
                    const msgAlarm = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 3000
                    });
                    msgAlarm({
                        type: 'info',
                        title: msgJSON.msg.length+"건의 읽지 않은 새로운 메시지가 있습니다"
                    });
                    $('.newMsg').html(msgJSON.msg.length+"건의 읽지않은 메시지가 있습니다");
                    $('.msgNotify').css("display","");
                    $('#sideBarMsgCnt').html(msgJSON.msg.length);
                    // fas fa-envelope
					for(let i = 0; i<msgJSON.msg.length;i++) {
					    if($('#msgNotify'+msgJSON.msg[i].msgSeq).length>0) continue;
                        let newMsgPreview = "<a href=" +"'${pageContext.servletContext.contextPath}/message/list'"+ "id='msgNotify"+msgJSON.msg[i].msgSeq+"'>" +
                            "<div class='btn btn-primary btn-circle'> <i class='fas fa-envelope'></i></div>" +
                            "<div class='mail-contnet'>" +
                            "<h5>"+msgJSON.msg[i].msgSendID+"</h5> <span class='mail-desc'>"+msgJSON.msg[i].msgContent.substr(0,10)+"..."+"</span></div>" +
                            "</a>";
                        $('.msgPreview').append(newMsgPreview);
                    }
                }
                //댓글 알람
                if(msgJSON.hasOwnProperty('comment')){
                    if(msgJSON.comment!=false) {
                        const commentAlarm = Swal.mixin({
                            toast: true,
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 3000
                        });

                        commentAlarm({
                            type: 'info',
                            title: "작성글에 새로운 댓글이 작성되었습니다"
                        });
                        if ($('.otherNotify').css("display") == "none") {
                            $('.otherNotify').css("display", "");
                        }
                        let newNotify = "<a href=" + msgJSON.URI + ">" +
                            "<div class='btn btn-primary btn-circle'> <i class='fas fa-comments'></i></div>" +
                            "<div class='mail-contnet'>" +
                            "<h5>New Comment</h5> <span class='mail-desc'>작성글에 새로운 댓글이 작성되었습니다!</span></div>" +
                            "</a>";
                        $('.otherPreview').append(newNotify);

                        //message sample
                        <%--<a href="javascript:void(0)">--%>
                        <%--<div class="btn btn-danger btn-circle"><i class="fa fa-link"></i></div>--%>
                        <%--<div class="mail-contnet">--%>
                        <%--<h5>Luanch Admin</h5> <span class="mail-desc">Just see the my new admin!</span> <span class="time">9:30 AM</span> </div>--%>
                        <%--</a>--%>

                    }
                }
                //팔로우 알람
				if(msgJSON.hasOwnProperty('follow')){
						const followAlarm = Swal.mixin({
							toast: true,
							position: 'top-end',
							showConfirmButton: false,
							timer: 3000
						});
				    if(msgJSON.follow){
                        followAlarm({
                            type: 'info',
                            title: "채널에 새로운 팔로워가 생겼습니다!"
                        });
                        if ($('.otherNotify').css("display") == "none") {
                            $('.otherNotify').css("display", "");
                        }
                        let newNotify = "<a href=" +"${pageContext.servletContext.contextPath}/${sessionScope.login}/channel>"+
                            "<div class='btn btn-primary btn-circle'> <i class='fas fa-user-plus'></i></div>" +
                            "<div class='mail-contnet'>" +
                            "<h5>"+msgJSON.followID+"</h5> <span class='mail-desc'>내 채널을 팔로우 합니다!</span></div>" +
                            "</a>";
                        $('.otherPreview').append(newNotify);
                    }else{
                        followAlarm({
                            type: 'info',
                            title: "채널에 팔로워가 사라졌습니다!"
                        });
                    }
                }
				//팔로우 채널 업로드 알람
				if(msgJSON.hasOwnProperty("followUpload")){
                    const followAlarm = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 3000
                    });

					followAlarm({
						type: 'info',
						title: "팔로우 채널에서 새로운 영상 업로드!"
					});
                    if ($('.otherNotify').css("display") == "none") {
                        $('.otherNotify').css("display", "");
                    }
                    let newNotify = "<a href=" +"${pageContext.servletContext.contextPath}/"+msgJSON.followUpload+"/channel>"+
                        "<div class='btn btn-primary btn-circle'> <i class='fas fa-user-plus'></i></div>" +
                        "<div class='mail-contnet'>" +
                        "<h5>"+msgJSON.followUpload+"</h5> <span class='mail-desc'>따끈따끈한 새 영상!</span></div>" +
                        "</a>";
                    $('.otherPreview').append(newNotify);

                }
            }
        }
    });

function googleLogin(){

    document.location.href = "${pageContext.servletContext.contextPath}/login/googleLogin";
}
function naverLogin(){
    document.location.href = "${pageContext.servletContext.contextPath}/login/naverLogin";
}
function kakaoLogin(){
    document.location.href = "${pageContext.servletContext.contextPath}/login/kakaoLogin";
}
$('.login-body input').keyup(function(event){
    if(event.key =='Enter'){
       login();
    }

});

function login(){
    $.ajax({
        type : 'post',
        url : '${pageContext.servletContext.contextPath}' + '/login',
        data : {userID:$('#userID').val(), userPW:SHA256($('#userPW').val()),userStat:'Y'}
        ,error:function(request,status,error) {
            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    },1000)
        .done(function(msg){
            if(msg=="success"){
                <%--$(location).attr('href', '${pageContext.servletContext.contextPath}');--%>
				window.location.reload();
            }else{
                alert("로그인 실패!");
                $("#userID").val("");
                $("#userPW").val("");
            }

        })
        .fail(function(){
            alert("로그인 실패!");
            $("#userID").val("");
            $("#userPW").val("");
        })

}




</script>
        