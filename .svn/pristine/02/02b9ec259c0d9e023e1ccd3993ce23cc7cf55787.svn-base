<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	$(function(){	

		$("#cancleID").click(function(){
			location.href="${pageContext.servletContext.contextPath}";
		});
		
	});
	 function userFindID(userName, userEmail){
			
			    if(userName===''||userEmail===''){
			    	alert("이름과 이메일을 입력해주세요");
			        return false;
				}else{
					/* alert(userName);
			        location.href="${pageContext.servletContext.contextPath}/login/findID"; */
				}
			
	}
	      

</script>
    
 	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="row page-titles">
				<div class="col-md-5 align-self-center">
					<h4 class="text-themecolor">아이디 찾기</h4>
				</div>
				<div class="col-md-7 align-self-center text-right">
					<div class="d-flex justify-content-end align-items-center">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
							<li class="breadcrumb-item active">Login</li>
						</ol>
						<button type="button" class="btn btn-info d-none d-lg-block m-l-15" onclick="document.location='${pageContext.servletContext.contextPath}/login/findPwForm';">
						비밀번호 찾기</button>
					</div>
				</div>
			</div>
			<div class="card col-md-6" style="margin:0 auto">
			<div class="card-body">
				<form id="findIDform" method="post" action="${pageContext.servletContext.contextPath}/login/findID">
					<div class="text-center">
						<img src="${pageContext.servletContext.contextPath}/resources/images/sadd.png" class="img-responsive center-block" >
					</div>
					
					<div class="form-group" >
						<div class="font1">이름</div>
						<input type="text" class="form-control" class="userName" id="userName" name="userName"  placeholder="이름을 입력해주세요" required="required" >
					</div>
					
					<div class="form-group">
						<div class="font1">이메일</div>
						<input type="text" class="form-control" class="userEmail" id="userEmail" name="userEmail"  placeholder="example@gmail.com" required="required">
					</div>
       
					<div class="text-center">
						<button type="submit" class="btn btn-primary waves-effect waves-light">아이디찾기</button>
				 	</div>
				 </form>
			</div>
			</div>
		</div>
	</div>