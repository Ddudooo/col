<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<%@page import="java.util.*"%>
<%

    request.setCharacterEncoding("UTF-8");

%>
<style>
    .carousel-control-next, .carousel-control-prev{
        width: 3%;
    }
</style>
<script src="${pageContext.servletContext.contextPath}/resources/dist/js/perfect-scrollbar.jquery.min.js"></script>
<script>
    $().ready(function(){
    	$(".comment-widgets").perfectScrollbar();
    	console.log("ready");
    })
</script>
<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Container fluid  -->
    <!-- ============================================================== -->
    <div class="container-fluid">
        <div class="card-group m-t-20">
            <div class="card">
                <div class="row">
                    <div class="col-md-12" >
                        <div class="card bg-dark text-white m-b-0" style="height:50em;">

                                <div id="myCarouse1" class="carousel slide" data-ride="carousel" style="height: 100%;">
                                    <ol class="carousel-indicators">
                                        <c:forEach var="slide" items="${mainChnl}" varStatus="Status">
                                            <c:choose>
                                                <c:when test="${Status.first}">
                                                    <li data-target="#myCarouse1" data-slide-to="${Status.index}" class="active"></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li data-target="#myCarouse1" data-slide-to="${Status.index}"></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </ol>
                                    <!-- Carousel items -->
                                    <div class="carousel-inner" style="height: 100%;">

                                        <c:forEach var="chnl" items="${mainChnl}" varStatus="index">
                                            <c:choose>
                                                <c:when  test="${index.first }">
                                                    <div class="carousel-item active" style="height: 100%;">
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="carousel-item" style="height: 100%;">
                                                </c:otherwise>
                                             </c:choose>
                                                    <img src="${chnl.channelImg}" onerror="this.src='${pageContext.servletContext.contextPath}/resources/images/unknown2.jpg'" style="margin-left: auto; margin-right: auto; display: block;">
                                                    <%--<video src="${pageContext.servletContext.contextPath}/resources/fileUpload/video/pringles/KakaoTalk_Video_20181226_0038_25_894.mp4"  controls></video>--%>
                                                    <div class="carousel-caption d-none d-md-block">
                                                        <h3 class="text-white">${chnl.channelTitle}</h3>
                                                        <p>${chnl.channelNotice}</p>
                                                    </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                            <a class="carousel-control-prev" href="#myCarouse1" role="button" data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#myCarouse1" role="button" data-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                    <%--ENd--%>
                                </div>

                        </div>
                    </div>
                    <!-- Column -->
                </div>

            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Comment - table -->
        <!-- ============================================================== -->
        <div class="row">
            <!-- ============================================================== -->
            <!-- Comment widgets -->
            <!-- ============================================================== -->
            <c:if test="${sessionScope.login !=null}">
            <div class="col-lg-6" >
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Recent Comments</h5>
                    </div>
                    <!-- ============================================================== -->
                    <!-- Comment widgets -->
                    <!-- ============================================================== -->
                    <div class="comment-widgets" style="height: 400px">
                        <!-- Comment Row -->
                        <%--<div class="d-flex no-block comment-row">--%>
                            <%--<div class="p-2"><span class="round"><img src="${pageContext.servletContext.contextPath}/resources/assets/images/users/1.jpg" alt="user" width="50"></span></div>--%>
                            <%--<div class="comment-text w-100">--%>
                                <%--<h5 class="font-medium">James Anderson</h5>--%>
                                <%--<p class="m-b-10 text-muted">Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has beenorem Ipsum is simply dummy text of the printing and type setting industry.</p>--%>
                                <%--<div class="comment-footer">--%>
                                    <%--<span class="text-muted pull-right">April 14, 2016</span> <span class="badge badge-pill badge-info">Pending</span> <span class="action-icons">--%>
                                                    <%--<a href="javascript:void(0)"><i class="ti-pencil-alt"></i></a>--%>
                                                    <%--<a href="javascript:void(0)"><i class="ti-check"></i></a>--%>
                                                    <%--<a href="javascript:void(0)"><i class="ti-heart"></i></a>--%>
                                                <%--</span>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <c:forEach var="cmt" items="${userCmt}">
                            <div class="d-flex no-block comment-row" >
                                <div class="p-2"><span class="round"><img src="${cmt.userImg}" alt="user" width="50" onerror="this.src='${pageContext.servletContext.contextPath}/resources/images/unknown2.jpg'"></span></div>
                                    <div class="comment-text w-100">
                                        <h5 class="font-medium">${cmt.userID}</h5>
                                        <p class="m-b-10 text-muted">${cmt.comContent}</p>
                                        <div class="comment-footer">
                                            <span class="text-muted pull-right">${cmt.comDate}</span><span class="action-icons">
                                            <a href="javascript:void(0)"><i class="ti-pencil-alt"></i></a>
                                            <a href="javascript:void(0)"><i class="ti-check"></i></a>
                                            <a href="javascript:void(0)"><i class="ti-heart"></i></a>
                                            </span>
                                        </div>
                                    </div>
                            </div>

                        </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">YOU HAVE 5 NEW MESSAGES</h5>
                            <div class="message-box" id="msg" style="height: 430px;position: relative;">
                                <div class="message-widget message-scroll">
                                    <!-- Message -->
                                    <a href="javascript:void(0)">
                                        <div class="user-img"> <img src="${pageContext.servletContext.contextPath}/resources/assets/images/users/1.jpg" alt="user" class="img-circle"> <span class="profile-status online pull-right"></span> </div>
                                        <div class="mail-contnet">
                                            <h5>Pavan kumar</h5> <span class="mail-desc">Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been.</span> <span class="time">9:30 AM</span> </div>
                                    </a>
                                    <!-- Message -->
                                    <a href="javascript:void(0)">
                                        <div class="user-img"> <img src="${pageContext.servletContext.contextPath}/resources/assets/images/users/2.jpg" alt="user" class="img-circle"> <span class="profile-status busy pull-right"></span> </div>
                                        <div class="mail-contnet">
                                            <h5>Sonu Nigam</h5> <span class="mail-desc">I've sung a song! See you at</span> <span class="time">9:10 AM</span> </div>
                                    </a>
                                    <!-- Message -->
                                    <a href="javascript:void(0)">
                                        <div class="user-img"> <span class="round">A</span> <span class="profile-status away pull-right"></span> </div>
                                        <div class="mail-contnet">
                                            <h5>Arijit Sinh</h5> <span class="mail-desc">Simply dummy text of the printing and typesetting industry.</span> <span class="time">9:08 AM</span> </div>
                                    </a>
                                    <!-- Message -->
                                    <a href="javascript:void(0)">
                                        <div class="user-img"> <img src="${pageContext.servletContext.contextPath}/resources/assets/images/users/4.jpg" alt="user" class="img-circle"> <span class="profile-status offline pull-right"></span> </div>
                                        <div class="mail-contnet">
                                            <h5>Pavan kumar</h5> <span class="mail-desc">Just see the my admin!</span> <span class="time">9:02 AM</span> </div>
                                    </a>
                                    <!-- Message -->
                                    <a href="javascript:void(0)">
                                        <div class="user-img"> <img src="${pageContext.servletContext.contextPath}/resources/assets/images/users/1.jpg" alt="user" class="img-circle"> <span class="profile-status online pull-right"></span> </div>
                                        <div class="mail-contnet">
                                            <h5>Pavan kumar</h5> <span class="mail-desc">Welcome to the Elite Admin</span> <span class="time">9:30 AM</span> </div>
                                    </a>
                                    <!-- Message -->
                                    <a href="javascript:void(0)">
                                        <div class="user-img"> <img src="${pageContext.servletContext.contextPath}/resources/assets/images/users/2.jpg" alt="user" class="img-circle"> <span class="profile-status busy pull-right"></span> </div>
                                        <div class="mail-contnet">
                                            <h5>Sonu Nigam</h5> <span class="mail-desc">I've sung a song! See you at</span> <span class="time">9:10 AM</span> </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            </c:if>
            <!-- ============================================================== -->
            <!-- Table -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Comment - chats -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Over Visitor, Our income , slaes different and  sales prediction -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- End Page Content -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Todo, chat, notification -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- End Page Content -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Container fluid  -->
    <!-- ============================================================== -->
</div>