<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.servletContext.contextPath}/resources/assets/node_modules/bootstrap-table/dist/bootstrap-table.min.css" rel="stylesheet" type="text/css" />
<style>
	.custom-control-label{
		position: relative;
		top: -15px;
		left: 10px;
		width: auto;
	}
</style>
    <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/bootstrap-table/dist/bootstrap-table.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/bootstrap-table/dist/bootstrap-table.ints.js"></script>
<script>

    var selectMsg = [];
    var reciveID = false;
	function modalWindow(IDname){

	    $('#'+IDname).modal("toggle");

	}

    $(document).ready(function(){

        $("#msgBtn").click(function(){
            $("#msgSendWindow").modal();
        });
        $("#delBtn").click(function(){
            //삭제버튼
			    //삭제 확인

                if(selectMsg.length >0){
					swal({
						title: "정말로 삭제하시겠습니까?",
						text: "삭제하면 복구할 수 없습니다!",
						type: "warning",
						showCancelButton: true,
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "네, 쓰레기통으로!",
						closeOnConfirm: false
					}).then((result) => {
							if (result.value) {
							for(msg in selectMsg){
								$.ajax({
									type:'post',
									async: false,
									url:'${pageContext.servletContext.contextPath}/message/delete',
									data: {msgSeq:selectMsg[msg]}
								}).done(function(callback){
									if(callback=='success'){
										console.log(selectMsg[msg]+"메시지 삭제됨");
									}
								});
								console.log(selectMsg[msg])
							}
							Swal(
								'삭제됨!',
								'소중한 쪽지를 쓰레기통으로 보냈어요!',
								'success'
							);
							window.location.reload();


						}
                        selectMsg = [];
				   })
                }


		});

        //메시지 체크
        $("tbody .msgCheckBoxes").click(function(){
            let selected = $(this).find('input').val();
			let checkboxValue = $('#checkbox'+selected);
			if(checkboxValue.is(":checked")==false){
                console.log("check");
				checkboxValue.prop("checked", true);
                selectMsg.push(selected);
			}
			else{
                console.log("uncheck");
                checkboxValue.prop("checked", false);
                selectMsg.splice(selectMsg.indexOf(selected),1);
			}
			console.log(selectMsg);
			let isAllChecked = false;
			$("tbody tr td input[type='checkbox']").each(function(){
			    if($(this).is(":checked")==false){
			        isAllChecked = false;
			        return false;
				}
			    isAllChecked=true;
			});
			if(isAllChecked){
			    $("#msgCheckBox").prop("checked",true);
			}else{
			    $("#msgCheckBox").prop("checked",false);
			}
			return false;

		});
		//메시지 전부 선택
		$("#msgCheckBox").click(function(){
		    console.log("checkAll");
		    if($(this).is(":checked")!=true){
		        $(this).prop("checked",false);
		        $("tbody .custom-control-input").each(function(){
		            $(this).prop("checked",false);
				});
				selectMsg=[];
			}else{
		        $(this).prop("checked",true);
		        $("tbody .custom-control-input").each(function(){
		            $(this).prop("checked",true);
		            if(selectMsg.indexOf($(this).val())==-1){
		                selectMsg.push($(this).val());
					}
				})
			}
		    console.log(selectMsg);
		})
    });

    function jsonData(classname){
        let json="{";
        $('.'+classname).each(function(){
            json +='"'+$(this).attr('name')+'"';
            json+=":";
            json+='"'+$(this).val()+'"';
            json+=",";
        });
        json = json.substr(0,json.length-1);
        json+="}";
        return json;
    }
    function clearClassname(classname){
        $('.'+classname).each(function(){
            $(this).val("");
        })
    }

    function msgView(content, sendID){
		$('#msgViewSendID').html(sendID);
        $('#msgViewContent').html(content);
        if($('#msgViewSendID').text() == '${sessionScope.login}'){
            $('#msgViewSendID').css("visibility","hidden");
            $('#msgReplySubmit').css("visibility","hidden");
        }else {
            $('#msgViewSendID').css("visibility", "visible");
            $('#msgReplySubmit').css("visibility", "visible");
        }
    }

    $().ready(function(){

        var content = false;
        //아이디 체크
        $('#msgSendWindow [name="msgReciveID"]').keyup(function(){

            reciveID =false;
            let checkID = $(this).val();

            if(!$('#Loading').length){//이미지가 존재하지 않을시 생성 및 위치 조정.
                let left = $(this).offset().left+$(this).width()-10;
                let top = $(this).offset().top;
                $('#msgSendWindow').append("<img id='Loading'" +
                    " src='${pageContext.servletContext.contextPath}/resources/images/animation/Spinner-1s-200px.gif'" +
                    " height='"+$(this).outerHeight(true)+"'"+
                    "style='position:absolute;left:"+left+"px;top:"+top+"px;'"+
                    ">");
            }else{//존재시 위치 조정 및 visible
                let left = $(this).offset().left+$(this).width()-10;
                let top = $(this).offset().top;
                $('#Loading').css("visibility","visible");
                $('#Loading').css("left",left+"px");
                $('#Loading').css("top",top+"px");
            }

            $.ajax({
                type : 'post',
                url : '${pageContext.servletContext.contextPath}' + '/register/checkID',
                data :{userID:checkID}
            }).done(function(msg){
                if(msg!=" "){
                    //아이디 사용중일때
                    $('#msgSendWindow [name="msgReciveID"]').css('border','1px solid #ccc');
                    reciveID = true;
                }else{
                    //아이디 중복 없음.
                    $('#msgSendWindow [name="msgReciveID"]').css('border','1px solid #FF0000');
                    reciveID = false;
                }
            }).always(function(){
                //항상 실행, 아작스 로딩 이미지 hidden
                if($('#Loading').length){
                    $('#Loading').css("visibility","hidden");
                }
            })
        });

        $('#msgSendSubmit').click(function sendMsg(){
            if($('#msgSendWindow [name="msgContent"]').length>0){
                content =true;
            }else{
                content=false;
            }
			console.log(reciveID);

            if(reciveID&&content){
                let str = $('#msgSendWindow textarea').val();
                str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
                $('#msgSendWindow textarea').val(str);
                let msgData = jsonData('msgRequired');
                console.log(msgData);

                clearClassname('msgRequired');
                reciveID=false;
                content=false;
                $.ajax({
                    type:'post',
                    url: '${pageContext.servletContext.contextPath}/message/send',
                    data : JSON.parse(msgData)
                }).done(function(msg){
                    if(msg=='success') {
                        $('#msgSendWindow').css('display', 'none');

                        websocket.send('{"reciveID":"'+JSON.parse(msgData).msgReciveID+'"}');
                        document.location.href="${requestScope['javax.servlet.forward.request_uri']}";
                    }else{
                        $('#msgSendWindow').css('display', 'none');
                        alert("알수없는 오류");
                    }
                })
            }

        });
        //delete

    })
</script>

<div class="page-wrapper" >
		<div class="container-fluid">
			<div class="row page-titles">
				<div class="col-md-5 align-self-center">
					<h4 class="text-themecolor">Message List</h4>
				</div>
				<div class="col-md-7 align-self-center text-right">
					<div class="d-flex justify-content-end align-items-center">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
							<li class="breadcrumb-item active">Message list</li>
						</ol>
						<button type="button" id="msgBtn"class="btn btn-info d-none d-lg-block m-l-15"><i class="fa fa-plus-circle"></i> New Message</button>
						<button type="button" id="delBtn"class="btn btn-danger d-none d-lg-block m-l-15"><i class="fa fa-plus-circle"></i> Delete Message</button>
					</div>
				</div>
			</div>

			<div class="card text-center">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table">

						<colgroup>
							<col width="2%"/>
							<col width='8%'/>
							<%-- 번호 --%>
							<col width='*%'/>
							<%-- 내용 --%>
							<col width='10%'/>
							<%-- 보낸사람 --%>
							<col width='10%'/>
							<%-- 받는사람 --%>
							<col width='12%'/>
							<%-- 날짜 --%>
						</colgroup>
						<thead>
						<tr>
							<th>
								<div class="custom-control custom-checkbox mr-sm-2">
								<input type="checkbox" class="custom-control-input" id='msgCheckBox'>
								<label class="custom-control-label" for='msgCheckBox'></label>
								</div>
							</th>
							<th>번호</th>
							<th>내용</th>
							<th>보낸사람</th>
							<th>받는사람</th>
							<th>날짜</th>
						</tr>
						</thead>
		
						<tbody>
						<c:forEach var="msg" items="${msgList}">
							<tr>
								<td class="msgCheckBoxes" >
									<div class="custom-control custom-checkbox mr-sm-2">
										<input type="checkbox" class="custom-control-input" id='checkbox${msg.msgSeq}' value="${msg.msgSeq}">
										<label class="custom-control-label" for='checkbox${msg.msgSeq}'></label>
									</div>
								</td>
								<td class="msgSeq">${msg.msgSeq}</td>
									<%-- 번호 --%>
								<td onclick="modalWindow('msgViewWindow');msgView('${msg.msgContent}', '${msg.msgSendID}');">
								<c:choose>
									<c:when test="${fn:length(msg.msgContent)>20}">
										${fn:substring(msg.msgContent,0 ,20 )}...
									</c:when>
									<c:otherwise>
										${msg.msgContent}
									</c:otherwise>

								</c:choose>
								<span id="sideBarMsgCnt"class="badge badge-pill badge-cyan ml-auto"><c:if test="${msg.msgCh==0&&msg.msgSendID != sessionScope.login}">new!</c:if></span>
								</td>
									<%-- 내용 --%>
								<td>${msg.msgSendID}</td>
									<%-- 작성자 --%>
								<td>${msg.msgReciveID}</td>
									<%--수신자--%>
								<td>
										${fn:substring(msg.msgRegDate,2 ,16 )}
								</td>
									<%-- 작성일 --%>
							</tr>
						</c:forEach>
		
						</tbody>
		
					</table>
					<br>
					<%-- 페이징 --%>
					<div class="paging w3-center">
						<ul class="pagination justify-content-center">
							<c:forEach var="i" begin="${startPage}" end="${page}" step="1">
								<c:if test="${i != page}">
									<li class="page-item"><a
											href="${requestScope['javax.servlet.forward.request_uri']}?page=${i}"
											class="page-link">${i}</a></li>
								</c:if>
							</c:forEach>
							<li class="page-item active"><a href="${requestScope['javax.servlet.forward.request_uri']}?page=${page}"
															class="page-link">${page}</a></li>
							<c:forEach var="j" begin="${page+1}" end="${page+6}" step="1">
								<c:if test="${j <=maxPage}">
									<li class="page-item"><a
											href="${requestScope['javax.servlet.forward.request_uri']}?page=${j}"
											class="page-link">${j}</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			</div>

	</div>
</div>



<!-- Modal -->
<div class="modal fade" id="msgSendWindow" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
			<h4 class="modal-title">쪽지 보내기</h4>
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="recipient-name" class="control-label">받는 사람</label>
					<input type="text" class="msgRequired form-control" name="msgReciveID" placeholder="아이디를 입력하세요" required="required"  style="ime-mode:disabled;">
				</div>
				<div class="form-group">
					<label for="message-text" class="control-label">내용</label>
					<textarea class="msgRequired form-control" name="msgContent" placeholder="내용 입력하기" style="height:100px"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button id="msgSendSubmit" class="btn btn-danger waves-effect waves-light"   type="button">전송</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<jsp:include page="messageView.jsp"></jsp:include>