<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/service/HuskyEZCreator.js"
        charset="utf-8"></script>


<script type="text/javascript">
    $(function () {
        //전역변수
        var oEditors = [];
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "boardContent",
            sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
            htParams: {
                fOnBeforeUnload: function () {
                }
            }

        });

        //전송버튼
        $("#btnSave").click(function () {
            //id가 smarteditor인 textarea에 에디터에서 대입
            var userID = ${sessionScope.login};
            var form = document.form.writeForm;

            if(userID == "" || userID == null) {
               alert("로그인를 해주세요.")
            }

            else if (form.boardTitle.value == null || form.boardTitle.value == "" || form.boardTitle.value == " ") {
                alert("제목을 입력하세요.")
            }

            else if (form.boardContent.value == null || form.boardContent.value == "" || form.boardContent.value == " ") {
                alert("내용을 입력하세요.")
            }

            else {
                oEditors.getById["boardContent"].exec("UPDATE_CONTENTS_FIELD", []);
            }

            //폼 submit
            $("#writeForm").submit();
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
                <div class="card-title" style="margin-bottom:20px">
                    <h4 class="text-themecolor">게시글 작성</h4>
                </div>
                <form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data" action="boardSave"
                      class="w3-container w3-card-4 w3-light-grey w3-text-grey w3-grey">

                    <div class="form-group">
                        작성자
                        <c:out value="${sessionScope.login}"/>
                        <input type="hidden" name="userID" value="${sessionScope.login}"/>
                    </div>

                    <div class="form-group">
                        <label>제목</label>
                        <input type="text" name="boardTitle" id="boardTitle" class="form-control"
                               value="<c:out value="${boardInfo.boardTitle}"/>" placeholder="제목을 입력해주세요">
                    </div>

                    <div class="form-group">
                        <textarea id="boardContent" name="boardContent" cols="100" rows="10"> <c:out
                                value="${boardInfo.boardContent}"/> </textarea>
                    </div>

                    <div class="form-group">
                        <label>파일첨부</label>
                        <c:forEach var="listView" items="${listView}" varStatus="status">
                            <input type="checkbox" name="fileNum" value="<c:out value="${listView.fileNum}"/>">
                            <a href="fileDownload?fileName=<c:out value="${listView.fileName}"/>&downName=<c:out value="${listView.fileRealName }"/>">
                                <c:out value="${listView.fileName}"/></a>
                            <c:out value="${listView.size2String()}"/><br/>
                        </c:forEach>
                        <input type="file" id="boardFile" name="boardFile" multiple="" class="dropify"
                               data-max-file-size="2M"/>
                    </div>

                    <div class="card-body text-center">
                        <input type="hidden" name="boardCate" value="<c:out value="${boardCate}"/>">
                        <input type="hidden" name="boardSeq" value="<c:out value="${boardInfo.boardSeq}"/>">
                        <button type="button" name="btnSave" id="btnSave"
                                class="btn waves-effect waves-light btn-primary" value="저장">저장
                        </button>
                        <a href="#" onclick="history.back(-1)" data-role="button"
                           class="btn waves-effect waves-light btn-dark">취소</a>
                    </div>
                </form>
            </div>
        </div>

        <script>
            $(document).ready(function () {
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

                drEvent.on('dropify.beforeClear', function (event, element) {
                    return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
                });

                drEvent.on('dropify.afterClear', function (event, element) {
                    alert('File deleted');
                });

                drEvent.on('dropify.errors', function (event, element) {
                    console.log('Has Errors');
                });

                var drDestroy = $('#input-file-to-destroy').dropify();
                drDestroy = drDestroy.data('dropify')
                $('#toggleDropify').on('click', function (e) {
                    e.preventDefault();
                    if (drDestroy.isDropified()) {
                        drDestroy.destroy();
                    } else {
                        drDestroy.init();
                    }
                })
            });
        </script>
    </div>
</div>