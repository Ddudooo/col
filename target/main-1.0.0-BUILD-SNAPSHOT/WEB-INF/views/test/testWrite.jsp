<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/codemirror/lib/codemirror.css">
<script type = "text/javascript" src = "<%=request.getContextPath()%>/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/lib/codemirror.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/addon/selection/active-line.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script type="text/javascript">
    $(function(){
        if(${sessionScope.login == null}){
            document.getElementById('id01').style.display='block';

        }
        //입력값 설정
        var editor = CodeMirror.fromTextArea(document.getElementById('testInput'), {
            lineNumbers: true,
            lineWrapping: true,
            styleActiveLine: true
        });
        //정답값 설정
		var answer = CodeMirror.fromTextArea(document.getElementById('testAnswer'), {
            lineNumbers: true,
            lineWrapping: true,
            styleActiveLine: true
        });
        //전역변수
        var oEditors = [];
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "testContent",
            sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
            htParams : {
                fOnBeforeUnload : function(){}
            }
        });
        //전송버튼
        $("#btnSave").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            oEditors.getById["testContent"].exec("UPDATE_CONTENTS_FIELD", []);
            let testcontent = $("#testContent").val().replace(/"/gi,"'");
            console.log(testcontent);
            $("#testContent").val(testcontent);
			$('#testInput').val(editor.getValue().replace(/\n/gi,"<br>"));
			$('#testAnswer').val(answer.getValue().replace(/\n/gi,"<br>"));
            //폼 submit
            if(${sessionScope.login == null}){
                document.getElementById('id01').style.display='block';
                return false;
            }
            let nullCheck = false;
			//ajax 제출
            let userData = "{";
            $(".testWrite").each(function(){
                userData+='"'+$(this).attr('name')+'"';
                userData+=":";
                if(isBlank($(this).val())){
                    userData+='null';
                    nullCheck=true;
				}else{
                	userData+='"'+$(this).val()+'"';
                }
                userData+=",";
			});
            userData = userData.substr(0, userData.length -1);
            userData+="}";

            console.log(userData);
            console.log("transform JSONDATA");
			console.log(JSON.stringify(JSON.parse(userData)));
            if(nullCheck) {
                console.log("null check!");
                return false;
            }
			$.ajax({
				type:'post',
				url: '${pageContext.servletContext.contextPath}'+'/test/upload',
				data:JSON.parse(userData)

			}).done(function (msg){
				if(msg=='success'){
				    document.location.href="${pageContext.servletContext.contextPath}/test/list";
				}else{
                    console.log(msg);
                }
            }).fail(function(xhr, status, errorThrown) {
                console.log(xhr);
                console.log(status);
                console.log(errorThrown);
                //예상치못한 오류
                /*
				$("#text").html("오류가 발생했습니다.<br>")

					.append("오류명: " + errorThrown + "<br>")

					.append("상태: " + status);
				*/
            })
            // $("#writeForm").submit();
        });
        function isBlank(str) {
            return (!str || /^\s*$/.test(str));
        }
        //난이도 설정
        $("#levelSelect").click(function () {
            console.log($(this).val());
            var x = document.getElementById("levelBox");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
        });
		$('#levelBox button').click(function(){
		    console.log($(this).val());
            var x = document.getElementById("levelBox");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
		    // $('#levelSelect').className = $('#levelSelect').className.replace(" w3-show", "");
            $('#levelSelect').val($(this).val());
            $('#levelSelect').html($(this).val());
		});
		//점수 설정
        $("#testPoint").click(function () {
            console.log($(this).val());
            var x = document.getElementById("pointInput");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
                $('#pointInput input').focus();
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
        });
        $('#pointInput input').focusout(function(){
            console.log($(this).val());
            var x = document.getElementById("pointInput");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
            // $('#levelSelect').className = $('#levelSelect').className.replace(" w3-show", "");
            $('#testPoint').val($(this).val());
            $('#testPoint').html($(this).val());
        });
		//카테고리 설정
        $("#testCate").click(function () {
            console.log($(this).val());
            var x = document.getElementById("cateBox");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
        });
        $('#cateBox button').click(function(){
            console.log($(this).val());
            var x = document.getElementById("cateBox");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
            // $('#levelSelect').className = $('#levelSelect').className.replace(" w3-show", "");
            $('#testCate').val($(this).val());
            $('#testCate').html($(this).val());
        });
    });
</script>


<div class="page-wrapper">
    <div class="container-fluid">
    	<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">TEST 작성</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
						<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}/test/list">Test</a></li>
						<li class="breadcrumb-item active">Write</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="card">
		<div class="card-body">


				<div class="form-group">
                   	 작성자
                    <c:out value="${sessionScope.login}"/>
                    <input class="testWrite"type="hidden" name="testUploadID" value="${sessionScope.login}" />
                </div>
                
                <div class="form-group">
               		<label>제목</label>
                	<input type="text" name="testTitle" class="form-control testWrite" value="<c:out value="${boardInfo.boardTitle}"/>" placeholder="제목을 입력해주세요">
                </div>

				<div class="w3-row w3-section ">
					<div class="w3-dropdown-click">
						<button type="button" id="testCate" name="testCate" value="10" class="testWrite w3-button w3-black" style="min-width: 65px">카테고리</button>
						<div id="cateBox" class="w3-dropdown-content w3-bar-block w3-border">
							<button type="button" value = "배치고사" class="w3-bar-item w3-button">배치고사</button>
							<button type="button" value = "상시고사" class="w3-bar-item w3-button">상시고사</button>
							<button type="button" value = "미정카테고리" class="w3-bar-item w3-button">미정카테고리</button>
							<button type="button" value = "미정카테고리2" class="w3-bar-item w3-button">미정카테고리2</button>
							<button type="button" value = "미정카테고리3" class="w3-bar-item w3-button">미정카테고리3</button>
						</div>
					</div>

					<div class="w3-dropdown-click">
						<button type="button" id="levelSelect" name="testLevel" value="1" class="testWrite w3-button w3-black" style="min-width: 65px">난이도</button>
						<div id="levelBox" class="w3-dropdown-content w3-bar-block w3-border">
							<button type="button" value = "1" class="w3-bar-item w3-button">1</button>
							<button type="button" value = "2" class="w3-bar-item w3-button">2</button>
							<button type="button" value = "3" class="w3-bar-item w3-button">3</button>
							<button type="button" value = "4" class="w3-bar-item w3-button">4</button>
							<button type="button" value = "5" class="w3-bar-item w3-button">5</button>
						</div>
					</div>

					<div class="w3-dropdown-click">
						<button type="button" id="testPoint" name="testPoint" value="10" class="testWrite w3-button w3-black" style="min-width: 65px">점수</button>
						<div id="pointInput" class="w3-dropdown-content w3-bar-block w3-border">
							<input value ="10" class="w3-input w3-border w3-light-grey" type="number">
						</div>
					</div>

				</div>
				<div class="w3-row w3-section">
					내용
					<textarea id="testContent" class="testWrite" name="testContent" style="width: 100%"></textarea>
				</div>

				<div class="w3-selection">
					테스트 입력값
					<textarea id="testInput" class="testWrite" name="testInput"></textarea>
				</div>
				<div class="w3-selection">
					정답 리턴값
					<textarea id="testAnswer" class="testWrite" name="testAnswer"></textarea>
				</div>
				<div class="w3-section">
					<input type="button" name = "btnSave" id="btnSave" class="w3-button w3-green" value="저장">
					<%--<a href="#" id = "btnSave" name = "btnSave" data-role = "button" class="w3-button w3-green" onclick="form1.submit()">저장</a>--%>
					<a href = "#" onclick="history.back(-1)" data-role="button" class="w3-button w3-red">취소</a>
					<%--<a href = "${pageContext.request.contextPath}/board/list" data-role="button" class="w3-button w3-red">취소</a>--%>
				</div>

		</div>
		</div>
	</div>
</div>