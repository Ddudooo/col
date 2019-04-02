<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script>
      function myBoardList(){
         $.ajax({
            type : "get",
            url : "selectMyBoard",
            dataType : "json",
            success : function(response, status, xhr){
                  var tableHTML;
                  var i=0;
                  console.log(response);
                  for(var i in response)
                  {
                     tableHTML+="<tr><td>";
                     tableHTML+=response[i]['boardSeq'];
                     tableHTML+="</td><td><a href='${pageContext.servletContext.contextPath}/board/read?boardSeq="+response[i]['boardSeq']+"'>"
                           +response[i]['boardTitle']+"</td><td>"+response[i]['boardCnt'] +"</td><td>"+response[i]['boardRegDate']+"</td></tr>";
                     tableHTML+="</a>";
      
                  }      
                  $("#myBoardBoby").html(tableHTML);
                 
            },
            error : function(xhr, status, error){
               console.log("error :: " +error);
            }
         });   
      }
      
      $(document).ready(function(){
         myBoardList();
      });

</script>




<div class="page-wrapper">

     <div class="container-fluid">	
   
           	<div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor">My BoardList</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                                <li class="breadcrumb-item"><a href="javascript:void(0)">My page</a></li>
                                <li class="breadcrumb-item active">My BoardList</li>
                            </ol>
                            
                        </div>
                    </div>
                </div> 
            
  
	   <div class="card text-center">
			<div class="card-body">
				<div class="card-title">
	   				<h3><strong>내 게시글</strong></h3>
	   			</div>
				<div class="table-responsive">
					<table class="table table-striped table-hover" style="font-size:12px;">
						<thead>
							<tr>
								<th>NO.</th>
								<th>제목</th>
								<th>조회수</th>
								<th>생성날짜</th>
							</tr>
						</thead>
						
						<tbody id="myBoardBoby">
							
							
						</tbody>
						
						<tfoot>
							
			 			 </tfoot>
					</table>
					
					
				</div>
			
			
				<div align="center">
					<ul class="pagination justify-content-center">
			   			<li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
			   			<li class="page-item active"><a class="page-link" href="javascript:void(0);">1</a></li>
			    		<li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
			   			<li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
			 		 </ul>
			 	</div>			 
			 		
				
			</div>
	
		</div>
	</div>
</div>