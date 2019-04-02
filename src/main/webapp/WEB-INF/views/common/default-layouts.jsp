<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- 공통 meta -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
    	<meta name="description" content="">
    	<meta name="author" content="">

		<!-- Favicon icon -->
	    <link rel="icon" type="image/gif" sizes="16x16" href="${pageContext.servletContext.contextPath}/resources/images/col6.png">
	    <title>Code Of Legends</title>
	    <!-- This page CSS -->
	    <!-- chartist CSS -->
	    <link href="${pageContext.servletContext.contextPath}/resources/assets/node_modules/morrisjs/morris.css" rel="stylesheet">
	    <!--Toaster Popup message CSS -->
	    <link href="${pageContext.servletContext.contextPath}/resources/assets/node_modules/toast-master/css/jquery.toast.css" rel="stylesheet">
	    <!-- Custom CSS -->
	    <link href="${pageContext.servletContext.contextPath}/resources/dist/css/style.min.css" rel="stylesheet">
	    <link href="${pageContext.servletContext.contextPath}/resources/dist/css/style.css" rel="stylesheet">
	    <!-- Dashboard 1 Page CSS -->
	    <link href="${pageContext.servletContext.contextPath}/resources/dist/css/pages/dashboard1.css" rel="stylesheet">
		<!--alerts CSS -->
		<link href="${pageContext.servletContext.contextPath}/resources/assets/node_modules/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">

	   	<link href="${pageContext.servletContext.contextPath}/resources/assets/icons/font-awesome/css/fontawesome-all.css" rel="stylesheet">
	   	<link href="${pageContext.servletContext.contextPath}/resources/assets/icons/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
   	 	 <!-- page css -->
  		<link href="${pageContext.servletContext.contextPath}/resources/dist/css/pages/tab-page.css" rel="stylesheet">

   	 	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/node_modules/dropify/dist/css/dropify.min.css">
		<!-- tab wizard -->
		<link href="${pageContext.servletContext.contextPath}/resources/assets/node_modules/wizard/steps.css" rel="stylesheet">
	    <!--alerts CSS -->
   	    <link href="${pageContext.servletContext.contextPath}/resources/assets/node_modules/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
		
	    
	    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	    <!--[if lt IE 9]>
	    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	
		
		 <!-- All Jquery -->
	    <!-- ============================================================== -->
	    <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/jquery/jquery-3.2.1.min.js"></script>
	
	        <!-- Bootstrap tether Core JavaScript -->
    	<script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/popper/popper.min.js"></script>
    	<script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	    <!-- slimscrollbar scrollbar JavaScript -->
	    <script src="${pageContext.servletContext.contextPath}/resources/dist/js/perfect-scrollbar.jquery.min.js"></script>
	    <!--Wave Effects -->
	    <script src="${pageContext.servletContext.contextPath}/resources/dist/js/waves.js"></script>
	    <!--Menu sidebar -->
	    <script src="${pageContext.servletContext.contextPath}/resources/dist/js/sidebarmenu.js"></script>
		<!-- Sweet-Alert  -->
		<script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/sweetalert/sweetalert.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/sweetalert/jquery.sweet-alert.custom.js"></script>
	    <!--Custom JavaScript -->
	    <script src="${pageContext.servletContext.contextPath}/resources/dist/js/custom.min.js"></script>
	    <!-- ============================================================== -->
	    <!-- This page plugins -->
	    <!-- ============================================================== -->
	    <!--morris JavaScript -->
	    <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/raphael/raphael-min.js"></script>
	    <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/morrisjs/morris.min.js"></script>
	    <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/jquery-sparkline/jquery.sparkline.min.js"></script>
	    <!-- Popup message jquery -->

	    <!-- Chart JS -->
	    <script src="${pageContext.servletContext.contextPath}/resources/dist/js/dashboard1.js"></script>
	    <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/toast-master/js/jquery.toast.js"></script>
		
		<!-- stickey kit -->
	    <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/sticky-kit-master/dist/sticky-kit.min.js"></script>
	
	    <!-- jQuery file upload -->
	    <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/dropify/dist/js/dropify.min.js"></script>
		
		
		<!-- Sweet-Alert  -->
     	 <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/sweetalert/sweetalert2.all.min.js"></script>
    	 <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/sweetalert/jquery.sweet-alert.custom.js"></script>
		
		
		
		<!-- Font Noto Sans -->
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
		<style>
		html, body, div, span, object, iframe, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, ol, ul, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video, h2, h3, h4, h5, h6
		{
			font-family: 'Noto Sans KR', sans-serif;
		}
		</style> 
		
  		<tiles:insertAttribute name="header"/>
  	</head>
	<body class="mini-sidebar skin-default fixed-layout" >
   	 	<tiles:insertAttribute name="left"/>
		<tiles:insertAttribute name="nav"/>
		<tiles:insertAttribute name="content"/>
		<tiles:insertAttribute name="footer"/>
	</body>
</html>
