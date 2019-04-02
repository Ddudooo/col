<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- CSS -->

<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/col/file.css">
<link href="${pageContext.servletContext.contextPath}/resources/assets/node_modules/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />


<!-- js -->
<script src="${pageContext.servletContext.contextPath}/resources/js/col/file.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/col/jquery.form.js"></script>


<script type="text/javascript">

	$(function() {
		
		valueSetting();
		
		$("#dashBoardSubmit").click(function() {
			insertChnlInfo();
		});
		
		$("#setVideoBtn").click(function(){
			
			selectVideoList();
		});
	// ******dropify******* 시작
		 // Basic
        $('.dropify').dropify();

        // Translated
        $('.dropify-fr').dropify({
            messages: {
                default: 'Glissez-déposez un fichier ici ou cliquez',
                replace: 'Glissez-déposez un fichier ou cliquez pour remplacer',
                remove: 'Supprimer',
                error: 'Désolé, le fichier trop volumineux'
            }
        });

        // Used events
        var drEvent = $('#input-file-events').dropify();

        drEvent.on('dropify.beforeClear', function(event, element) {
            return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
        });

        drEvent.on('dropify.afterClear', function(event, element) {
            alert('File deleted');
        });

        drEvent.on('dropify.errors', function(event, element) {
            console.log('Has Errors');
        });

        var drDestroy = $('#input-file-to-destroy').dropify();
        drDestroy = drDestroy.data('dropify')
        $('#toggleDropify').on('click', function(e) {
            e.preventDefault();
            if (drDestroy.isDropified()) {
                drDestroy.destroy();
            } else {
                drDestroy.init();
            }
        })
       
        // ******dropify******* 끝
        
        
	});
	

	
	function LoadImg(value) {
		if (value.files && value.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#channelImg').attr('src', e.target.result);
			}

			reader.readAsDataURL(value.files[0]);
		}
	}
	
	function insertChnlInfo(){
		var channelTitle=$("#channelTitle").val();
		var channelNotice=$("#channelNotice").val();
		var channelCate=$("#channelCate").val();
		
		if(channelTitle==='' || channelNotice===''){
			alret('비어있는 값이 있습니다. 다시 확인해주세요.');
		}
		else{
			$("#channelInfo").attr("action", "insertChnl");
			$("#channelInfo").submit();
		}
	}
	
	function valueSetting(){
		$("#channelTitle").val("${chnlMap.channelTitle}");
		$("#channelLevel").val("${chnlMap.channelLevel}");
		$("#channelNotice").val("${chnlMap.channelNotice}");
		$("#channelCate").val("${chnlMap.channelCate}");
	}
	
	

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
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                     <li class="nav-item"> <a class="nav-link active"  href="${pageContext.servletContext.contextPath}/${sessionScope.login}/dash/live" ><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">채널설정</span></a> </li>
                     <li class="nav-item"> <a class="nav-link" href="${pageContext.servletContext.contextPath}/${sessionScope.login}/dash/video"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">동영상관리</span></a> </li>
                </ul>
                
                <!-- setChnl Tab -->
                <div class="tab-content tabcontent-border">
                	<div class="tab-pane active" id="setChnl" role="tabpanel">
               			 <div class="p-20">
                         <form id="channelInfo" method="post" enctype="multipart/form-data">
							<div>
							<div class="row">
								<div class="filebox">
									<div class="col-lg-6 col-md-6">
								         <div class="card">
								              <div class="card-body filebox">
								                   <h4 class="card-title ">채널화면</h4>
								                   <input type="file" id="input-file-now" class="dropify" data-default-file="${pageContext.servletContext.contextPath}/${chnlMap.channelImg}" class="borderimg1 w3-hover-grayscale" style="width: 60em; height: 30em; object-fit: cover;"/>
								                   <label for="fileUpload"> <!-- style="width: 20%; float: right; height: 40px; text-align: center" -->
												    <img src="${pageContext.servletContext.contextPath}/${chnlMap.channelImg}" id="channelImg" class="borderimg1 w3-hover-grayscale"
													style="width: 60em; height: 30em; object-fit: cover;" >
													</label> 
													<input type="file" id="fileUpload" name="file" class="upload-hidden fileUpload" style="width: 25%; float: right; height: 40px;" onchange="LoadImg(this);"> 
													<input class="upload-name" style="width: 60%; float: left; height: 40px;">
								              </div>
								         </div>
						           </div>
								</div>
							</div>
							<h3>채널제목</h3>
								<input type="text" style="top: 50px; height: 3em;"  id="channelTitle" name="channelTitle" placeholder="제목입력하기" >
								<hr>
							<h3>공지등록</h3>
								<input type="text" style="top: 50px; height: 3em;"  id="channelNotice" name="channelNotice" placeholder="제목입력하기">
							<h3>채널레벨</h3>
								<div class="form-group">
									<select class="form-control" id="channelLevel" name="channelLevel">
										<option value="0">숫자가 클수록 높은 등급!</option>
										<option value="1">Level_1</option>
										<option value="2">Level_2</option>
										<option value="3">Level_3</option>
										<option value="4">Level_4</option>
										<option value="5">Level_5</option>
									</select>
								</div>
							<hr>
							<h3>카테고리설정</h3>
								<div class="form-group">
									<select class="form-control" id="channelCate" name="channelCate">
										<option value="0">선택하세요</option>
										<option value="1">Java</option>
										<option value="2">C++</option>
										<option value="3">C</option>
										<option value="4">Python</option>
										<option value="5">JavaScript</option>
										<option value="6">CSS</option>
									</select>
								</div>
								<input type="button" class="btn btn-info" id="dashBoardSubmit" value="저장" style="width: 100px;  right: 300px;">
							</div>
						</form>
					</div>
                </div>
                                    
                <!-- setVideo Tab -->          
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
					
					<div id="videoListBody">
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
		

