<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>


<script src="${pageContext.servletContext.contextPath}/resources/js/col/change.js"></script>
<script>
	   $(function(){
      levelConvert();
      cateConvert();

   });
   


</script>



<!-- Tab panes -->
<div class="tab-content tabcontent-border">
    <div class="tab-pane active" id="chnlInfo" role="tabpanel">
           <div class="p-20">
                   <h4 class="card-title">어서오세요!</h4>
                   <h6 class="card-subtitle"><code>${chnlMap.userID}</code>의 채널입니다.</h6> 
                           
                   <h4>채널제목</h4>
                   <br>
                   ${chnlMap.channelTitle}
                   <div>
                   <h4>채널레벨</h4>
                   <hr>
                   <input type="button" class="btn waves-effect waves-light " id="level" value="${chnlMap.channelLevel}"/>
                   </div>
                   <hr>
                   <h3>카테고리</h3>
                   <input type="button" class="btn waves-effect waves-light " id="cate" value="${chnlMap.channelCate}"/>
                   <hr>
                   <h3>공지사항</h3>
                   <br> ${chnlMap.channelNotice}
                  </div>
                                 
                                  
                                
                                  </div>
                                  

                         </div>
                         
                    