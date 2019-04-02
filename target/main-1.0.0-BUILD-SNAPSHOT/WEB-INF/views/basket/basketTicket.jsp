<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<link href="${pageContext.servletContext.contextPath}/resources/dist/css/pages/pricing-page.css" rel="stylesheet">

<div class="page-wrapper">
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">Ticket</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
						<li class="breadcrumb-item active">Ticket</li>
					</ol>

				</div>
			</div>
		</div>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row pricing-plan">
                                    <div class="col-md-3 col-xs-12 col-sm-6 no-padding">
                                        <div class="pricing-box">
                                            <div class="pricing-body b-l">
                                                <div class="pricing-header">
                                                    <h2 class="text-center"><span class="price-sign"><i class="fas fa-won-sign"></i></span>9,900</h2>
                                                </div>
                                                <div class="price-table-content">
                                                    <div class="price-row"><i class="far fa-calendar-check"></i> 1주일</div>
                                                    <div class="price-row"><i class="far fa-folder-open"></i> 업로드 파일 크기 제한 없음</div>
                                                    <div class="price-row"><i class="far fa-play-circle"></i> 모든 영상 무료 열람</div>
                                                    <div class="price-row">
                                                        <button class="btn btn-success waves-effect waves-light m-t-20">구매하기</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-xs-12 col-sm-6 no-padding">
                                        <div class="pricing-box b-l">
                                            <div class="pricing-body">
                                                <div class="pricing-header">
                                                    <h2 class="text-center"><span class="price-sign"><i class="fas fa-won-sign"></i></span>39,800</h2>
                                                </div>
                                                <div class="price-table-content">
                                                    <div class="price-row"><i class="far fa-calendar-check"></i> 한 달</div>
                                                    <div class="price-row"><i class="far fa-folder-open"></i> 업로드 파일 크기 제한 없음</div>
                                                    <div class="price-row"><i class="far fa-play-circle"></i> 모든 영상 무료 열람</div>
                                                    <div class="price-row">
                                                        <button class="btn btn-success waves-effect waves-light m-t-20">구매하기</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-xs-12 col-sm-6 no-padding">
                                        <div class="pricing-box featured-plan">
                                            <div class="pricing-body">
                                                <div class="pricing-header">
                                                    <h4 class="price-lable text-white bg-warning"> Popular</h4>
                                                    <h2 class="text-center"><span class="price-sign"><i class="fas fa-won-sign"></i></span>99,900</h2>
                                                </div>
                                                <div class="price-table-content">
                                                    <div class="price-row"><i class="far fa-calendar-check"></i> 세 달</div>
                                                    <div class="price-row"><i class="far fa-folder-open"></i> 업로드 파일 크기 제한 없음</div>
                                                    <div class="price-row"><i class="far fa-play-circle"></i> 모든 영상 무료 열람</div>
                                                    <div class="price-row">
                                                        <button class="btn btn-lg btn-info waves-effect waves-light m-t-20">구매하기</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-xs-12 col-sm-6 no-padding">
                                        <div class="pricing-box">
                                            <div class="pricing-body b-r">
                                                <div class="pricing-header">
                                                    <h2 class="text-center"><span class="price-sign"><i class="fas fa-won-sign"></i></span>199,000</h2>
                                                </div>
                                                <div class="price-table-content">
                                                    <div class="price-row"><i class="far fa-calendar-check"></i> 1년</div>
                                                    <div class="price-row"><i class="far fa-folder-open"></i> 업로드 파일 크기 제한 없음</div>
                                                    <div class="price-row"><i class="far fa-play-circle"></i> 모든 영상 무료 열람</div>
                                                    <div class="price-row">
                                                        <button class="btn btn-success waves-effect waves-light m-t-20">구매하기</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
	</div>
</div>