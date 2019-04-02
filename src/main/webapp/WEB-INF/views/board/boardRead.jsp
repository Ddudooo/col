<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    $().ready(function () {
        $('#boardContext').html('${boardInfo.boardContent}');
        $(".reportBtn").click(function () {
            $("#reportfrm").modal();
        });
    })
</script>


<%-- 게시글 삭제 --%>
<script>
    $("#deleteBtn").click(function(){
       var check = ${comNum};

       if(check == 0 || "".equals(check) || check == null) {
           alert ("답변이 있는 게시글은 삭제할 수 없습니다.");
           return;
       }

       else {
           return "delete?boardCate=<c:out value="${boardInfo.boardCate}"/>&boardSeq=<c:out value="${boardInfo.boardSeq}"/>";
       }
    });
</script>

<script>

    // 댓글 저장
    function fn_formSubmit() {
        var form1 = document.form1;

        if (form1.userID.value == null || form1.userID.value == "") {
            alert("로그인 먼저 하세요.");
            return;
        }

        else if (form1.comContent.value == "" || form1.comContent.value == " " || form1.comContent.value == null) {
            alert("내용을 입력하세요.");
            form1.comContent.focus();
            return;
        }

        else {
            form1.submit();
        }
    }

    function fn_replyDelete(comNum) {
        if (!confirm("삭제하시겠습니까?")) {
            return;
        }

        var form2 = document.form2;

        form2.action = "boardComDelete";
        form2.comNum.value = comNum;
        form2.submit();
    }

    var updateComNum = updateComContent = null;

    function fn_replyUpdate(comNum) {
        var form2 = document.form2;
        var reply = document.getElementById("reply" + comNum);
        var replyDiv = document.getElementById("replyDiv");

        replyDiv.style.display = "";

        if (updateComNum) {
            document.body.appendChild(replyDiv);
            var oldComNum = document.getElementById("reply" + updateComNum);
            oldComNum.innerText = updateComContent;
        }

        form2.comNum.value = comNum;
        form2.comContent.value = reply.innerText;
        reply.innerText = "";
        reply.appendChild(replyDiv);
        updateComNum = comNum;
        updateComContent = form2.comContent.value;
        form2.comContent.focus();
    }


    function fn_replyUpdateSave() {
        var form2 = document.form2;

        if (form2.comContent.value == "" || form2.comContent.value == " " || form2.comContent.value == null) {
            alert("내용을 입력하세요.");
            form.comContent.focus();
            return;
        }

        else {
            form2.action = "boardComSave";
            form2.submit();
        }
    }


    function fn_replyUpdateCancel() {
        // var form = documnet.form2;
        var replyDiv = document.getElementById("replyDiv");
        document.body.appendChild(replyDiv);
        replyDiv.style.display = "none";

        var oldComNum = document.getElementById("reply" + updateComNum);
        oldComNum.innerText = updateComContent;
        updateComNum = updateComContent = null;
    }

    function fn_replyReply(comNum) {
        var form = document.form3;
        var reply = document.getElementById("reply" + comNum);
        var replyDia = document.getElementById("replyDialog");


        if (form.userID.value == "" || form.userID.value == null) {
            alert("로그인 먼저 하세요.");
            return;
        }

        else if (updateComNum) {
            fn_replyUpdateCancel();
        }

        else {
            replyDia.style.display = "";
            form.comContent.value = "";
            form.comParent.value = comNum;
            reply.appendChild(replyDia);
            form.comContent.focus();
        }
    }

    function hideDiv(id) {
        var div = document.getElementById(id);
        div.style.display = "none";
        document.body.appendChild(div);
    }

    function fn_replyReplyCancel() {
        hideDiv("replyDialog");
    }


    function fn_replyReplySave() {
        var form3 = document.form3;

        if (form3.comContent.value == "" || form3.comContent.value == " " || form3.comContent.value == null) {
            alert("내용을 입력하세요.");
            form3.comContent.focus();
        }

        else if (form3.comContent.value != "" || form3.comContent.value != " " || form3.comContent.value != null){
            form3.action = "boardComSave";
            form3.submit();
        }
    }

  //신고 스크립트
    function boardReport(){//게시글신고
    	var form = document.reportForm;
    	form.reporter.value = '${sessionScope.login}';
    	form.reportTarget.value = '${boardInfo.userID}';
    	form.reportTypeNum.value = '${boardInfo.boardSeq}';
    	//form.reportTypeNum2.value = '${boardInfo.boardSeq}';
    	form.reportText.value = $('#boardContext').text();
    	form.reportType.value = "게시글";
    }
    //댓글신고
    function commentReport(comID, comNum){
    	var form = document.reportForm;
    	form.reporter.value = '${sessionScope.login}';
    	form.reportTarget.value = comID;
    	form.reportTypeNum.value = '${boardInfo.boardSeq}';
    	//form.reportTypeNum2.value = '${boardInfo.boardSeq}';
    	form.reportText.value = $('#reply'+comNum).text();
    	form.reportType.value = "댓글";
    }
    //신고 넘기기 전 확인
    function reportSubmit(){
    	 var form = document.reportForm;
    	 
    	 if (form.reporter.value == ""){
    		 alert("로그인을 해주세요");
    		 return;
    	 }
    	 if (form.reportType.value == ""){
    		 alert("신고유형을 선택해주세요");
    		 return;
    	 }
    	 
    	 if (form.reportType.value == ""){
    		 alert("신고유형을 선택해주세요");
    		 return;
    	 }
    	 
    	 if (form.reportContent.value == ""){
    		 alert("신고사유를 선택해주세요");
    		 return;
    	 }
    	 
    	 form.submit();
    }
</script>


<%-- 추천 --%>
<script>
    <%--$().ready(function(){--%>
        <%--$('.fa-heart').click(function() {--%>
            <%--if(${sessionScope.login == null}) {--%>
                <%--alert("로그인 하세요");--%>
                <%--return;--%>
            <%--}--%>

            <%--else {--%>
                <%--console.log($(this));--%>
                <%--if ($(this).hasClass('far')) {--%>
                    <%--$(this).removeClass('far');--%>
                    <%--$(this).addClass('fas');--%>
                <%--}--%>

                <%--else {--%>
                    <%--$(this).removeClass('fas');--%>
                    <%--$(this).addClass('far');--%>
                <%--}--%>
            <%--}--%>
        <%--});--%>
    <%--});--%>

    $("#likeBtn").click(function(){
        var userID="${sessionScope.login}";

        $.ajax({
            type : 'post',
            url : 'like',
            data:{
                userID:userID
            },
            success : function (responseData, status, xhr){
                alert(responseData);

                if(responseData==1) {
                    $('#likeBtn').prop("class","fas fa-check");
                }
                else if(responseData=0){
                    $('#likeBtn').prop("class","far fa-heart");
                }

            },
            error : function (xhr, status, error){
                console.log("::follow error:: "+error);
            }
        });

    });
</script>


<div class="page-wrapper">
    <div class="container-fluid">
        <div class="row page-titles">
            <div class="col-md-5 align-self-center">
                <h4 class="text-themecolor">Community</h4>
            </div>
            <div class="col-md-7 align-self-center text-right">
                <div class="d-flex justify-content-end align-items-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
                        <li class="breadcrumb-item active">Community</li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <div class="card-title">
                    <h3><c:out value="${boardInfo.boardTitle}"/></h3>
                    <p><c:out value="${boardInfo.userID}"/> | <c:out value="${boardInfo.boardRegDate}"/></p>
                </div>
                <hr>
                <div class="card-text">
                    <div id="boardContext"></div>
                    <div class="w3-row w3-section">
                        <h5><i class="fa fa-paperclip m-r-10 m-b-10"></i>첨부파일</h5>
                        <c:forEach var="listView" items="${listView}" varStatus="status">
                            <input type="checkbox" name="fileNum" value="<c:out value="${listView.fileNum}"/>">
                            <a href="fileDownload?fileName=<c:out value="${listView.fileName}"/>&downName=<c:out value="${listView.fileRealName }"/>">
                                <c:out value="${listView.fileName}"/>
                            </a>
                            <c:out value="${listView.size2String()}"/><br/>
                        </c:forEach>
                    </div>

                    <div class="card-body text-right" style="padding-bottom:0">
                        <input type="hidden" name="boardSeq" value="${boardInfo.boardSeq}">

                        <c:if test="${boardInfo.userID == sessionScope.login}">
                            <a href="writePage?boardSeq=<c:out value="${boardInfo.boardSeq}"/>" cla ss="w3-button">수정</a>
                            <%--<a href="delete?boardCate=<c:out value="${boardInfo.boardCate}"/>&boardSeq=<c:out value="${boardInfo.boardSeq}"/>" class="w3-button">삭제</a>--%>
                            <a href="#" id="deleteBtn" class="w3-button">삭제</a>
                        </c:if>

                        <a href="#" onclick="document.location='${pageContext.servletContext.contextPath}/board/list?boardCate=<c:out value="${boardInfo.boardCate}"/>'">목록</a>
                        <a href="#" onclick="boardReport();"  class="reportBtn">신고</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <%-- 댓글 작성 폼 --%>
                <div class="w3-row w3-section w3-container w3-card-4 w3-white w3-text-grey w3-white">
                    <form name="form1">
                        <input type="hidden" name="boardSeq" value="<c:out value="${boardInfo.boardSeq}"/> ">
                        작성자 : <c:out value="${sessionScope.login}"/><br>
                        <div class="input-group">
                        	<input type="hidden" id="userID" name="userID" value="${sessionScope.login}">
                        	<textarea id="comContent" class="form-control" name="comContent" cols="100%" rows="3" maxlength="300" placeholder="댓글을 입력하세요."></textarea>
                        	<div class="input-group-append">
	                    		<button onclick="fn_formSubmit()" class="btn btn-primary btn-sm" >저장</button>
							</div>
                    	</div>
                    </form>
                </div>

                <%-- 댓글 수정, 삭제 본인 댓글일 경우 표시--%>
                <c:forEach var="replyList" items="${replyList}" varStatus="status">
                    <div class="card-body" style="padding:10px; margin-left: <c:out value="${20*replyList.comDepth}"/>px;">

                        <c:out value="${replyList.userID}"/> <c:out value="${replyList.comDate}"/>

                        <c:if test="${replyList.userID == sessionScope.login}">
                            <button onclick="fn_replyUpdate('<c:out value="${replyList.comNum}"/>')" class="btn btn-primary btn-xs">수정</button>
                            <button onclick="fn_replyDelete('<c:out value="${replyList.comNum}"/>')" class="btn btn-primary btn-xs">삭제</button>
                        </c:if>

                        <button onclick="fn_replyReply('<c:out value="${replyList.comNum}"/>')"class="btn btn-primary btn-xs">댓글</button>
                        <button type="button" onclick="commentReport('<c:out value="${replyList.userID}"/>','<c:out value="${replyList.comNum}"/>');" class="reportBtn btn btn-primary btn-xs">신고</button>

                        <%-- 추천 --%>
                        <a href="#"> <i id="likeBtn" class="${check}"></i> </a>
                            <%--<a href="#" id="likeBtn" onclick="likeFn('${replyList.comNum}')" class="far fa-heart"></a>--%>
                            <%--<a href="#" id="likeBtn" onclick="likeFn('${replyList.comNum}')">--%>

                            <%--<img src="${pageContext.servletContext.contextPath}/resources/images/likecancel.png" style="height: 15px; width: 15px"/>--%>
                            <%--</a>--%>

                        <span style="float: right; margin-right: 5px">추천 : <c:out value="${replyList.comLikeCnt}"/></span>

                        <br/>
                        <div id="reply<c:out value="${replyList.comNum}"/>"><c:out value="${replyList.comContent}"/></div>
                    </div>
                </c:forEach>


                <%-- 댓글 수정 폼 --%>
                <div class="w3-container w3-card-4 w3-white w3-text-grey w3-white" id="replyDiv" style="width: 99%; display:none">
                    <form name="form2">
                        <input type="hidden" name="boardSeq" value="<c:out value="${boardInfo.boardSeq}"/>">
                        <input type="hidden" name="comNum">
                        <textarea name="comContent" rows="3" cols="60" maxlength="500"></textarea>
                        <button onclick="fn_replyUpdateSave()" class="btn btn-primary btn-sm">저장</button>
                        <button onclick="fn_replyUpdateCancel()" class="btn btn-primary btn-sm">취소</button>
                    </form>
                </div>


                <%-- 대댓글 작성 폼 --%>
                <div class="w3-container w3-card-4 w3-white w3-text-grey w3-white" id="replyDialog" style="width: 99%; display:none">
                    <form name="form3">
                        <input type="hidden" name="boardSeq" value="<c:out value="${boardInfo.boardSeq}"/>">
                        <input type="hidden" name="comParent">
                        <input type="hidden" name="comNum">
                        작성자: <c:out value="${sessionScope.login}"/><br>
                        <div class="input-group">
                        	<input type="hidden" id="userID" name="userID" value="${sessionScope.login}">
                        	<textarea name="comContent" class="form-control" rows="3" cols="60" maxlength="500"></textarea>
                        	<div class="input-group-append">
                        		<button onclick="fn_replyReplySave()" class="btn btn-primary btn-sm">저장</button>
                        		<button onclick="fn_replyReplyCancel()" class="btn btn-primary btn-sm">취소</button>
                   			</div>
                   		</div>
					</form>
                </div>
            </div>
        </div>


<!-- 신고모달입니다 -->
        <div id="reportfrm" class="modal fade">
        	<div class="modal-dialog">
               <form id="reportForm" name="reportForm" action="${pageContext.request.contextPath}/report" method="post">
               	<div class="modal-content">
		            <div class="modal-header">
						 <h4 class="modal-title">신고하기</h4>
		                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>                 
					</div>
			      
			      <div class="modal-body">
			          <p>
			          <input type="hidden" value="" name="reporter" id="reporter"/>
			          	작성자 : <input type="text" style="border:0" value="" name="reportTarget" id="reportTarget" readonly/><br>
			          	작성내용 : <input type="text" style="border:0" value="" name="reportText" id="reportText" readonly/>
			          </p>
			          <p>
			          </p>
			          <p>신고유형 :
			          <input id="reportType" name="reportType" value="" style="border:0" readonly/>
					  
					  <input type="hidden" name="reportTypeNum" id="reportTypeNum" value=""/>
					  <input type="hidden" name="reportTypeNum2" id="reportTypeNum2" value=""/>
					  </p>
						  
					 <div class="form-group">
						<h5>신고사유</h5>
						<fieldset class="controls">
                           <div class="custom-control custom-radio">
                            <input type="radio" name="reportContent" value="부적절한 홍보게시물" checked required id="styled_radio1" class="custom-control-input">
                            <label class="custom-control-label" for="styled_radio1">부적절한 홍보게시물</label>
                            </div>
                        </fieldset>
                        <fieldset class="controls">
                            <div class="custom-control custom-radio">
                            	<input type="radio" name="reportContent" value="음란성 또는 청소년에게 부적합한 내용" required id="styled_radio2" class="custom-control-input">
                            	<label class="custom-control-label" for="styled_radio2">음란성 또는 청소년에게 부적합한 내용</label>
                            </div>
                        </fieldset>
                        <fieldset class="controls">
                            <div class="custom-control custom-radio">
                            	<input type="radio" name="reportContent" value="특정인 대상의 비방/욕설" required id="styled_radio3" class="custom-control-input">
                            	<label class="custom-control-label" for="styled_radio3">특정인 대상의 비방/욕설</label>
                            </div>
                        </fieldset>
                        <fieldset class="controls">
                             <div class="custom-control custom-radio">
                            	<input type="radio" name="reportContent" value="명예훼손/사생활침해 및 저작권 침해" required id="styled_radio4" class="custom-control-input">
                            	<label class="custom-control-label" for="styled_radio4">명예훼손/사생활침해 및 저작권 침해</label>
                            </div>
                        </fieldset>
					</div>          
			    	상세내용
			          <textarea class="form-control" name="reportContent2" id="reportContent2"></textarea>
			      </div>
			      
			      <div class="modal-footer">
					<button onclick="reportSubmit();" type="button" class="btn btn-danger waves-effect waves-light">신고</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				  </div>
			      
			    </div>
				</form>
			</div>
		</div>
          
<!-- 신고모달끝 --> 

    </div>
</div>