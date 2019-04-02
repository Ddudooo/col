<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
    <!-- Popup CSS -->
 	<link href="${pageContext.servletContext.contextPath}/resources/assets/node_modules/Magnific-Popup-master/dist/magnific-popup.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/resources/dist/css/pages/user-card.css" rel="stylesheet">
    <!-- Magnific popup JavaScript -->
    <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/Magnific-Popup-master/dist/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/Magnific-Popup-master/dist/jquery.magnific-popup-init.js"></script>
    
<script>
      function chnlList(channelCate){
         
         $.ajax({
            type : "post",
            url : "list",
            data: {channelCate : channelCate},
            dataType : "json",
            success : function(response, status, xhr){
                   proc(response);
            },
            error : function(xhr, status, error){
               console.log("error :: " +error);
            }
         });      
      }
      
      function proc(response){
         $.each(response, function (index, item){
            var str='<div class="col-lg-3 col-md-6 appendBody"><a href="${pageContext.servletContext.contextPath}/'+item.userID+'/channel"><div class="card text-white bg-dark"><div class="card-header"><h4 class="m-b-0 text-white">ID: '+ item.userID +'</h4></div><div class="el-card-item">'
            + '<div class="el-card-avatar el-overlay-1"><img src="${pageContext.servletContext.contextPath}/'
            + item.channelImg+'" style= "height:220px; object-fit:cover"/></div><div class="el-card-content"><h4 class="box-title">'
            +item.userID +'의 '+ item.channelTitle+'</h4><small>' +item.channelNotice+'</small><br/></div></div></a></div>';
            
            $('#chnlBody').append(str);
         });
      }
      
      $(document).ready(function(){
         var channelCate = $("#channelCate").val();
         
         if(channelCate=='0')
            {
             chnlList(channelCate);
            }
         
          $("#channelCate").change(function(){
             $('.appendBody').remove();
             
             var channelCate1 = $("#channelCate").val();
             chnlList(channelCate1);
             });
          
         
      });

</script>


<div class="page-wrapper">
          
            <div class="container-fluid">
            <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor">Channel</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
                                <li class="breadcrumb-item active">Channel</li>
                            </ol>
                            
                        </div>
                    </div>
                </div>

            <form id="searchChnl" method="post">
               <div class="form-group">
                           <select class="form-control custom-select" class="searchForm" id="channelCate" name="channelCate">
                              <option value="0" selected>선택하세요</option>
                              <option value="1">Java</option>
                              <option value="2">C++</option>
                              <option value="3">C</option>
                              <option value="4">Python</option>
                              <option value="5">JavaScript</option>
                              <option value="6">CSS</option>
                           </select>
               </div>
            </form>
      
            <div class="row el-element-overlay" id="chnlBody">
                   

            </div>
     
      </div>
</div>

      
   <script type="text/javascript">
    
   /*  var totalData = 1000;    // 총 데이터 수
    var dataPerPage = 20;    // 한 페이지에 나타낼 데이터 수
    var pageCount = 10;        // 한 화면에 나타낼 페이지 수
    
    function paging(totalData, dataPerPage, pageCount, currentPage){
        
        console.log("currentPage : " + currentPage);
        
        var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
        var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹
        
        console.log("pageGroup : " + pageGroup);
        
        var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
        if(last > totalPage)
            last = totalPage;
        var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
        var next = last+1;
        var prev = first-1;
        
        console.log("last : " + last);
        console.log("first : " + first);
        console.log("next : " + next);
        console.log("prev : " + prev);
 
        var $pingingView = $("#paging");
        
        var html = "";
        
        if(prev > 0)
            html += "<a href=# id='prev'><</a> ";
        
        for(var i=first; i <= last; i++){
            html += "<a href='#' id=" + i + ">" + i + "</a> ";
        }
        
        if(last < totalPage)
            html += "<a href=# id='next'>></a>";
        
        $("#paging").html(html);    // 페이지 목록 생성
        $("#paging a").css("color", "black");
        $("#paging a#" + currentPage).css({"text-decoration":"none", 
                                           "color":"red", 
                                           "font-weight":"bold"});    // 현재 페이지 표시
                                           
        $("#paging a").click(function(){
            
            var $item = $(this);
            var $id = $item.attr("id");
            var selectedPage = $item.text();
            
            if($id == "next")    selectedPage = next;
            if($id == "prev")    selectedPage = prev;
            
            paging(totalData, dataPerPage, pageCount, selectedPage);
        });
                                           
    }
    
    $("document").ready(function(){        
        paging(totalData, dataPerPage, pageCount, 1);
    }); */
</script>
 

     <!-- <div id="paging" size="10pt"></div> -->