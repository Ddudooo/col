<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="msgViewWindow" class="modal fade" role="dialog">
	<div class="modal-dialog" style="max-width:500px">

		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Message</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>


			<div class="modal-body">
				<div class="w3-section w3-white">
					<span id="msgViewSendID"></span>
				<pre id="msgViewContent">

				</pre>

				</div>
			</div>
			<div class="modal-footer">
				<button id="msgReplySubmit" class="btn btn-danger waves-effect waves-light msgView"   type="button">답장</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
		<script>
			$().ready(function(){
				 $('#msgReplySubmit').click(function(){
					 modalWindow('msgViewWindow');
					 modalWindow('msgSendWindow');
					 console.log($('#msgViewSendID').text());
					 $('#msgSendWindow input[name="msgReciveID"]').val($('#msgViewSendID').text());
					 reciveID = true;
				 })

			})
		</script>



	</div>
</div>