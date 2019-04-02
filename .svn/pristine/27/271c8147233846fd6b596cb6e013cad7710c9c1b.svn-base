<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/col/file.css">
<link href="${pageContext.servletContext.contextPath}/resources/assets/node_modules/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />


<!-- js -->
<script src="${pageContext.servletContext.contextPath}/resources/js/col/file.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/col/jquery.form.js"></script>


<script>
	$(function() {
		
        $("input[name='videoPrice']").TouchSpin({
            min: 1000,
            max: 100000,
            step: 1000,
            decimals: 0,
            boostat: 5,
            maxboostedstep: 1000,
            postfix: 'W'
        });
   
        $('#submitVideo').click(function(){
        	
        	fileUpload();
        });
        
        
        $("#basket").click(function(){
        /* 	$.ajax({
                url :'',
                type :'POST',
                data : sendData,
                success : function(data){
                    that.prop('name',data);
                    if(data==1) {
                        $('#basket').prop("src","/resources/images/like2.png");
                    }
                    else{
                        $('#basket').prop("src","/resources/images/like1.png");
                    }


                }
            }); */
        });

	});
	
	
	function LoadImg(value) {
		if (value.files && value.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#channelImg').attr('src', e.target.result);
			};

			reader.readAsDataURL(value.files[0]);
		}
	}
	
	function fileUpload() {

		var videoTitle=$('#videoTitle').val();
		var videoCate = $('#videoCate').val();
		var videoLevel = $('#videoLevel').val();
		var videoPrice = $('#videoPrice').val();

		if(videoTitle===""||videoCate=='0'||videoLevel=='0'||videoPrice===""){
				 alert("누락된 값이 있습니다.");
		}else{
			
		$('#addVideoInfo').ajaxForm({
			url: "insertVideoInfo",
			enctype: "multipart/form-data", 
			success: function(result){
				swal({
					  title: "Good job!",
					  text: "동영상 업로드를 완료했습니다.",
					  icon: "success",
					  button: "확인",
					}).then();
				websocket.send('{"uploadID":"'+'${sessionScope.login}'+'"}');
			},
			error: function(xhr, status, error) {
				console.log("::error:" + error);
			}
			});
		
		$("#addVideoInfo").submit();
		}
		
	}
	
	
	/* function selectVideoList(){
		
		$.ajax({
			type:"post",
			url:"selectVideo",
			dataType : "json",
			success: function(response, status, xhr){
				myVideoList(response);

			},
			error : function(xhr, status, error) {
				console.log("::error:" + error);
			}
		});// end of ajax
	} 
	
	function myVideoList(response){
        $.each(response, function (index, item){
           var str='<div class="col-lg-3 col-md-6 appendVideoBody"><a href="${pageContext.servletContext.contextPath}/'+item.userID+'/channel/channelLive"><div class="card text-white bg-dark"><div class="el-card-item">'
           + '<div class="el-card-avatar el-overlay-1"><video src="${pageContext.servletContext.contextPath}/'+item.videoAddr+'" controls loop width="320" height="170"></video></div><div class="el-card-content"><h4 class="box-title">'
           +item.userID +'의 '+ item.videoTitle+'</h4><small>' +item.videoPrice+'</small><br/></div></div></a></div>';
           
           $('#videoListBody').append(str);
        });
     }
	*/

	

</script>



<div class="page-wrapper">
    <div class="container-fluid">
		<div class="row page-titles">
             <div class="col-md-5 align-self-center">
                  <h4 class="text-themecolor">My dashboard</h4>
             </div>
             <div class="col-md-7 align-self-center text-right">
                 <div class="d-flex justify-content-end align-items-center">
                     <ol class="breadcrumb">
                          <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                          <li class="breadcrumb-item active">My dashboard</li>
                     </ol>
                 </div>
             </div>
        </div>

		<div class="card">
            <div class="card-body">
                <ul class="nav nav-tabs" role="tablist">
                     <li class="nav-item"> <a class="nav-link"  href="${pageContext.servletContext.contextPath}/${sessionScope.login}/dash/live" ><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">채널설정</span></a> </li>
                     <li class="nav-item"> <a class="nav-link active" href="${pageContext.servletContext.contextPath}/${sessionScope.login}/dash/video"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">동영상관리</span></a> </li>
               	</ul>
                
			<div class="tab-pane  p-20" id="setVideo" role="tabpanel">
                 <a href="javascript:void(0)" data-toggle="modal" data-target="#addVideo" class="btn btn-primary text-white">+ Create New Video</a>
                         
                  <!-- modal -->
                  <div id="addVideo" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                       <div class="modal-dialog">
                             <div class="modal-content">
	                             <div class="modal-header">
	                                 <h4 class="modal-title" id="myModalLabel">Add Video</h4>
	                                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                             </div>
	                             <div class="modal-body">
	                                 <form class="form-horizontal" id="addVideoInfo" method="post" enctype="multipart/form-data">
	                                 <div class="form-group filebox">
	                                      <label class="col-md-12">동영상</label>
			                          	  <label for="fileUpload2"> <!-- style="width: 20%; float: right; height: 40px; text-align: center" -->
										  </label> 
										  <input type="file" id="fileUpload2" name="file" class="upload-hidden fileUpload" style="width: 25%; float: right; height: 40px;" onchange="LoadImg(this);"> 
										  <input class="upload-name" style="width: 60%; float: left; height: 40px;">
								     </div>
	
									 <div class="form-group">
	                                      <label class="col-md-12">동영상제목</label>
	                                            <div class="col-md-12">
	                                                  <input type="text" class="form-control" id="videoTitle" name="videoTitle" placeholder="Video Title"> </div>
	                                 </div>
	                                            
	                                 <div class="form-group">
	                                      <label class="col-md-12">동영상가격</label>
	                                      <div class="col-md-12">
	                                      	<input id="videoPrice" type="text" value="1000" name="videoPrice" data-bts-button-down-class="btn btn-secondary btn-outline" data-bts-button-up-class="btn btn-secondary btn-outline"> </div> 
	                                      </div>
	                                            
	                                 <div class="form-group">
										  <label class="col-md-12">동영상 카테고리</label>
										  <select class="form-control" id="videoCate" name="videoCate">
												<option value="0">선택하세요</option>
												<option value="1">Java</option>
												<option value="2">C++</option>
												<option value="3">C</option>
												<option value="4">Python</option>
												<option value="5">JavaScript</option>
												<option value="6">CSS</option>
										  </select>
									 </div>
	
									 <div class="form-group">
										  <label class="col-md-12">영상 난이도</label>
										  <select class="form-control" id="videoLevel" name="videoLevel">
												<option value="0">숫자가 클수록 높은 등급!</option>
												<option value="1">Level_1</option>
												<option value="2">Level_2</option>
												<option value="3">Level_3</option>
												<option value="4">Level_4</option>
												<option value="5">Level_5</option>
										  </select>
									 </div>
	                            	</form>
	                             </div>
                             
								<div class="modal-footer">
	                                 <button type="button" class="btn btn-primary waves-effect" data-dismiss="modal" id="submitVideo">Save</button>
	                                 <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Cancel</button>
	                            </div>
                                     
                       		</div>
                      		 <!-- /.modal-content -->
                   	</div>
                   <!-- /.modal-dialog -->
               		</div>
		 	</div>
			
			<div class="row">
			<c:forEach var="videoList" items="${videoList}" varStatus="status">
			<!-- my video -->	
	             <div class="col-lg-3 col-md-6">
	             <!-- Card -->
	             	<c:url var="link" value="/${videoList.userID}/channel/video">
                        <c:param name="videoNum" value="${videoList.videoNum}"/>
                    </c:url>
                    <span class="hidden-sm-up"><i class="fas fa-cart-plus" id="basket"></i></span> 
                    <a href = "${link}">
	                   <div class="card">
	                   	  <video class="card-img-top img-responsive" src="${pageContext.servletContext.contextPath}/<c:out value='${videoList.videoAddr}'/>" controls loop width="320" height="170"></video>
	                  		 <div class="card-body">
	                              <h4 class="card-title"><c:out value="${videoList.videoTitle}"/></h4>
	                              <p class="card-text">가격: <c:out value="${videoList.videoPrice}"/> 원</p>
	                              <p class="card-text">영상레벨: <c:out value="${videoList.videoLevel}"/> </p>
	                        </div>
	                   </div>
	                </a>
	               
	                   <!-- Card -->
	             </div>
	          
	             </c:forEach>
	             </div>
			</div>
			<!-- my video 끝 -->
		</div>
		</div>
	</div>
</div>




<script type="text/javascript">



</script>



