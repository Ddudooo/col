<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script>
    function fn_formSubmit(){
        document.form1.submit();
    }
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

        <div class="card text-center">
            <div class="card-body">
                <div class="card-title">
                    <c:if test="${sVO.boardCate == 1}">
                        <h4 class="text-themecolor"><strong>자유게시판</strong></h4>
                    </c:if>

                    <c:if test="${sVO.boardCate == 2}">
                        <h4 class="text-themecolor"><strong>Q&A게시판</strong></h4>
                    </c:if>

                    <c:if test="${sessionScope.login != null}">
                        <%--<a href = "writePage" class="w3-button w3-blue-grey">글쓰기</a>--%>
                        <button onclick="location.href='writePage?boardCate=<c:out value="${sVO.boardCate}'"/>" class="btn btn-primary d-none d-lg-block m-l-15">글쓰기</button>
                    </c:if>
                </div>

                <div class="table-responsive">
                    <table class="table">
                        <colgroup>
                            <col width='8%'/>   <%-- 번호 --%>
                            <col width='*%'/>   <%-- 제목 --%>
                            <col width='10%'/>   <%-- 작성자 --%>
                            <col width='20%'/>   <%-- 작성일 --%>
                            <col width='8%'/>   <%-- 조회수 --%>
                        </colgroup>

                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>날짜</th>
                            <th>조회</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var = "listView" items="${listView}" varStatus="status">
                            <c:url var="link" value="read">
                                <c:param name="boardSeq" value="${listView.boardSeq}"/>
                            </c:url>
                            <tr>
                                <td><c:out value="${sVO.totalRow-((sVO.page-1) * sVO.displayRowCount + status.index)}"/></td>       <%-- 번호 --%>
                                <td><a href = "${link}"><c:out value="${listView.boardTitle}"/></a></td>                           <%-- 제목 --%>
                                <td><c:out value="${listView.userID}"/></td>                                                       <%-- 작성자 --%>
                                <td><c:out value="${listView.boardRegDate}"/></td>                                                <%-- 작성일 --%>
                                <td><c:out value="${listView.boardCnt}"/></td>                                                     <%-- 조회수 --%>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <input type="hidden" name="page" id="page" value="" />

                <script type="text/javascript">
                    function fnSubmitForm(page){
                        document.form1.page.value=page;
                        document.form1.submit();
                    }
                </script>

            </div>
            <div class="card-body border-top">
                <%--검색--%>

                <%-- 페이징 --%>
                <c:if test="${sVO.totalPage>1}">
                    <div class="paging">

                        <ul class="pagination justify-content-center">
                            <c:forEach var="i" begin="${sVO.pageStart}" end="${sVO.pageEnd}" step="1" varStatus="status">
                                <c:url var="pageLink" value="list">
                                    <c:param name="page" value="${i}" />
                                </c:url>

                                <c:choose>
                                    <c:when test="${i eq sVO.page}">
                                        <li class="page-item active"><a href="${pageLink}" class="page-link"><c:out value="${i}"/></a></li>
                                    </c:when>

                                    <c:otherwise>
                                        <li class="page-item"><a href="${pageLink}" class="page-link"><c:out value="${i}"/></a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </ul>
                    </div>
                    <br>
                </c:if>

                <form id="form1" name="form1"  method="post">
                    <%--<jsp:include page="/WEB-INF/views/board/pagingforSubmit.jsp" />--%>
                    <div>
                        <input type="checkbox" name="searchType" value="boardTitle" <c:if test="${fn:indexOf(sVO.searchType, 'boardTitle')!=-1}">checked="checked"</c:if>/>
                        <label class="chkselect" for="searchType1">제목</label>
                        <input type="checkbox" name="searchType" value="boardContent" <c:if test="${fn:indexOf(sVO.searchType, 'boardContent')!=-1}">checked="checked"</c:if>/>
                        <label class="chkselect" for="searchType2">내용</label>
                        <input type="text" class = "w3-border w3-round" name="searchKeyword" style="width:30%;" maxlength="50"
                               value='<c:out value="${sVO.searchKeyword}"/>' onkeydown="if(event.keyCode == 13) { fn_formSubmit();}"/>
                        <button name="btn_search" class="reportBtn btn btn-primary btn-sm" onclick="fn_formSubmit()">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>