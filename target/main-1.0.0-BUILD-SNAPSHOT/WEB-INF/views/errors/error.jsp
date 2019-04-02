<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>

<link href="${pageContext.servletContext.contextPath}/resources/dist/css/pages/error-pages.css" rel="stylesheet">

<section id="wrapper" class="error-page">
        <div class="error-box">
            <div class="error-body text-center">
                <h1>${code}</h1>
                <h3 class="text-uppercase">${msg}</h3>
                <br>
                <a href="${pageContext.servletContext.contextPath}" class="btn btn-info btn-rounded waves-effect waves-light m-b-40">Back to home</a> </div>
            
        </div>
</section>