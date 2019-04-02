<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside class="left-sidebar">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <c:if test="${sessionScope.login != null}" >
                        <li class="user-pro"> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><img src="${pageContext.servletContext.contextPath}/${sessionScope.loginUserImg}" alt="user-img" class="img-circle">
                            <span class="hide-menu">${sessionScope.loginUserNick} &nbsp;</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="${pageContext.servletContext.contextPath}/mypage"><i class="ti-user"></i> Mypage</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/${sessionScope.login}/channel"><i class="ti-layout-media-right-alt"></i> My Channel</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/${sessionScope.login}/dash/live"><i class="ti-files"></i>  My DashBoard</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/basket"><i class="ti-wallet"></i> My Basket</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/logout"><i class="fa fa-power-off"></i> Logout</a></li>
                            </ul>
                        </li>
                        </c:if>
                       
                        <li class="nav-small-cap">--- SUPPORT</li>
                        <li> <a class="waves-effect waves-dark" href="${pageContext.servletContext.contextPath}/main/faq" aria-expanded="false"><i class="far fa-circle text-info"></i><span class="hide-menu">FAQs</span></a></li>
                        <li> <a class="waves-effect waves-dark" href="${pageContext.servletContext.contextPath}/main/aboutUs" aria-expanded="false"><i class="far fa-circle"></i><span class="hide-menu">About Us</span></a></li>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>