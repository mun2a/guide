<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	
<%@ include file="../common/cssLink.jsp"%>
<body>
<%@ include file="../common/mainheader.jsp"%>
	

<%-- 바디 시작 --%>


		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
					<div class="card border-0 shadow rounded-3 my-5">
						<div class="card-body px-5 py-3 p-sm-5">
							<h2 class="card-title text-center mb-5 fw-bold fs-2">문의글</h2>
								<form action="${contextPath}/qna/delete" method="post" name="" id="">
									<input type="hidden"  class="form-control" id="" name="qna_no" value="${qnaInfo.qna_no}">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<input type="hidden" name="pageNum" value="${criteria.pageNum}" />
								    <div class="form-group row mb-3">
								      <label for="board_title" class="col-sm-2 col-form-label fw-bolder">글 제목</label>
								      <div class="col-sm-10">
								        <input type="text"  class="form-control bg-white pe-none" id="" name="" value="${qnaInfo.qna_title ne '1' ? qnaInfo.qna_title ne '2' ? '기타 문의' : '일정 문의' : '계정 문의'} " readonly="readonly" maxlength="30">
								      </div>
								    </div>
								    <div class="form-group row mb-3">
								      <label for="member_name" class="col-sm-2 col-form-label fw-bolder">작성자</label>
								      <div class="col-sm-10">
								        <input type="text"  class="form-control bg-white pe-none" id="" name="" value="${empty qnaInfo.qna_write_name ? '비회원' : qnaInfo.qna_write_name}" readonly="readonly">
								      </div>
								    </div>
								    <div class="form-group row mb-3">
								      <label for="board_contents" class="col-sm-2 col-form-label align-middle fw-bolder" >글 내용</label>
								      <div class="col-sm-10">
								        <textarea class="form-control bg-white" id=""  name="qna_content" rows="10" readonly="readonly" style="resize: none;" maxlength="1300">${qnaInfo.qna_content}</textarea>
								      </div>
								    </div>
								    
								    <%-- 비회원 접근시 버튼 --%>
								    <sec:authorize access=" isAnonymous()">
										<div class="w-100">
											<a href="${contextPath}/qna/list?pageNum=${criteria.pageNum}&pageNum=${criteria.pageNum}" class="w-50">
												<input type="button" value="목록보기" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-25" style="margin-left: 75%">
											</a>
										</div>
									</sec:authorize>
								    
								    
								    <%-- 회원 접근시 버튼 --%>
								     <sec:authorize access="isAuthenticated()">
									  	 
									  	 <%-- 관리자 버튼 --%>
									  	 <c:if test="${principal.authorities eq '[ROLE_ADMIN, ROLE_MEMBER]'}">
									  	 
									  	 	<c:choose>
									  	 	
									  	 		<c:when test="${principal.username eq qnaInfo.qna_write}">
									  	 			<div class="hstack gap-3 w-75 ms-auto">
									  	 				<input type="button" value="댓글등록" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-50" id="btn-reply-add">
											  	 		<a href="${contextPath}/qna/modify?pageNum=${criteria.pageNum}&qna_no=${qnaInfo.qna_no}" class="w-50">
															<input type="button" value="글 수정" class="btn btn-dark btn-login text-uppercase fw-boldr w-100">
														</a>
															<input type="submit" value="글 삭제" class="btn btn-dark btn-login text-uppercase fw-bold w-50">
														<a href="${contextPath}/qna/list?pageNum=${criteria.pageNum}" class="w-50">
															<input type="button" value="목록보기" class="btn btn-dark btn-login text-uppercase fw-bold w-100 " style="float: right;">
														</a>
											  	 	</div>
									  	 		</c:when>
									  	 		
									  	 		<c:otherwise>
									  	 			<div class="hstack gap-3 w-75 ms-auto">
									  	 				<input type="button" value="댓글등록" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-50" id="btn-reply-add">
														<a href="${contextPath}/qna/list?pageNum=${criteria.pageNum}" class="w-50">
															<input type="button" value="목록보기" class="btn btn-dark btn-login text-uppercase fw-bold w-100 " style="float: right;">
														</a>
													</div>
									  	 		</c:otherwise>
									  	 	</c:choose>
									  	 	
									  	 </c:if>
									  	 
									  	 <%-- 일반회원 버튼 --%>
									  	  <c:if test="${principal.authorities eq '[ROLE_MEMBER]'}">
									  	 	
									  	 	<c:choose>
									  	 	
									  	 		<c:when test="${principal.username eq qnaInfo.qna_write}">
									  	 			<div class="hstack gap-3 w-75 ms-auto">
										  	 			<a href="${contextPath}/qna/modify?pageNum=${criteria.pageNum}&qna_no=${qnaInfo.qna_no}" class="w-50">
															<input type="button" value="글 수정" class="btn btn-dark btn-login text-uppercase fw-boldr w-100">
														</a>
															<input type="submit" value="글 삭제" class="btn btn-dark btn-login text-uppercase fw-bold w-50">
														<a href="${contextPath}/qna/list?pageNum=${criteria.pageNum}" class="w-50">
															<input type="button" value="목록보기" class="btn btn-dark btn-login text-uppercase fw-bold w-100 " style="float: right;">
														</a>
										  	 		</div>
									  	 		</c:when>
									  	 		
									  	 		<c:otherwise>
									  	 			<div class="w-100">
														<a href="${contextPath}/qna/list?pageNum=${criteria.pageNum}&pageNum=${criteria.pageNum}" class="w-50">
															<input type="button" value="목록보기" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-25" style="margin-left: 75%">
														</a>
													</div>
									  	 		</c:otherwise>
									  	 	</c:choose>
									  	   </c:if>
									  	 
									</sec:authorize>
									
								</form>
								
								
								<div class="section-title-container mt-5">
		                           <div class="float-start border-0" style="height: 25px; width: 10px; background-color: #98DDE3; margin-right: 10px"></div>
		                           <h5 style="margin-bottom: 15px">
		                           	  <b>댓글</b>
		                           </h5>
		                        </div>
								<div class="div-reply">
		                        <%-- 리뷰가 있는 경우 --%>
								<c:forEach items="${replyList}" var="replyList">
								
									<div class="col-sm-12 col-md-12 col-lg-12 mx-auto border-0 p-4 pb-5 shadow rounded-3 my-4" id="${replyList.qna_reply_no}">
									${replyList.qna_reply_content}
									<sec:authorize access="hasRole('ROLE_ADMIN')">
									<br>
									<button type="button" class="btn shadow rounded-3 float-end btn-reply-delete" data-reply="${replyList.qna_reply_no}" data-qna="${replyList.qna_no}">삭제</button>
									<button type="button" class="btn shadow rounded-3 float-end me-4 btn-reply-modify" data-reply="${replyList.qna_reply_no}" data-qna="${replyList.qna_no}">수정</button>
									</sec:authorize>
									
									</div>
								</c:forEach>
								</div>
								<!-- Button trigger modal -->
									
									
									<!-- Modal -->
									<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
									
									</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	
<%-- 바디 끝 --%>

	
<%@ include file="../common/mainfooter.jsp"%>
<%@ include file="../common/jsLink.jsp"%>


<script type="text/javascript">
	$(document).ready(function(){
		
		var csrf_headername = "${_csrf.headerName}"; 
		var csrf_token = "${_csrf.token}";
		
		<%-- 댓글 등록버튼 모달띄우기 --%>
		$("#btn-reply-add").on("click", function(e){	
			
			e.preventDefault();
			
			str = '';
			
			str += '<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">';
			str += '<div class="modal-content">';
			str += '<div class="modal-header">';
			str += '<h5 class="modal-title" id="staticBackdropLabel">댓글 등록</h5>'
			str += '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>';
			str += '</div>';
			str += '<div class="modal-body">';
			str += '<form action="" method="post" name="" id="reply">';
			str += '<input type="hidden" id="qna_no" name="qna_no" value="${qnaInfo.qna_no}"><br>';
			str += '<input type="hidden" id="member_id" name="member_id" value="${memberInfo.member_id}" /><br>';
			str += '<div class="form-group row mb-3">';
			str += '<label for="member_name" class="col-sm-2 col-form-label fw-bolder">작성자</label>';
			str += '<div class="col-sm-10">';
			str += '<input type="text"  class="form-control bg-white pe-none" id="" name="" value="${memberInfo.member_name}" readonly="readonly">';
			str += '</div>';
			str += '</div>';
			str += '<div class="form-group row mb-3">';
			str += '<label for="board_contents" class="col-sm-2 col-form-label align-middle fw-bolder" >글 내용</label>';
			str += '<div class="col-sm-10">';
			str += '<textarea class="form-control" id="qna_reply_content"  name="qna_reply_content" rows="10" style="resize: none;" maxlength="1300"></textarea>';
			str += '</div>';
			str += '</div>';
			str += '</form>';
			str += '</div>';
			str += '<div class="modal-footer">'
			str += '<button type="button" class="btn btn-dark" id="fn-reply-add">등록하기</button>';
			str += '<button type="button" class="btn btn-secondary btn-modal-close" data-bs-dismiss="modal">닫기</button>';
			str += '</div>';
			str += '</div>';
			str += '</div>';
			
			
			
			
			$("#staticBackdrop").html(str);
			$("#staticBackdrop").modal("show");
		});
			
			
		<%-- 댓글 등록시 추가되는 기능 --%>
		$(document).on("click","#fn-reply-add", function(e){
			
			e.preventDefault();
			
			var qna_no = $("#qna_no").val();
			var member_id = $("#member_id").val();
			var qna_reply_content = $("#qna_reply_content").val();
			var form = {qna_no:qna_no, member_id:member_id, qna_reply_content:qna_reply_content}
			
			$.ajax({
				type : "post",
				data :JSON.stringify(form),
				dataType : "json",
				url : "${contextPath}/reply/add",
				processData : true,                                                      
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(jObj) {
					$(".btn-modal-close").click();
					alert("댓글이 등록되었습니다");
					var str = "";
					
					str += '<div class="col-sm-12 col-md-12 col-lg-12 mx-auto border-0 p-4 pb-5 shadow rounded-3 my-4" id="' + jObj.qna_reply_no + '">';
					str += jObj.qna_reply_content;
					str += '<sec:authorize access="hasRole(\'ROLE_ADMIN\')">';
					str += '<br>';
					str += '<button type="button" class="btn shadow rounded-3 float-end btn-reply-delete" data-reply="' + jObj.qna_reply_no + '" data-qna="' + jObj.qna_no + '">삭제</button>';
					str += '<button type="button" class="btn shadow rounded-3 float-end me-4 btn-reply-modify" data-reply="' + jObj.qna_reply_no + '" data-qna="' + jObj.qna_no + '">수정</button>';
					str += '</sec:authorize>';
					str += '</div>';
					$(".div-reply").prepend(str);
					
				},
			});
			
			
			
		});
		
		<%-- 댓글 수정창 띄우기 --%>
		$(document).on("click",".btn-reply-modify", function(e){
			
			e.preventDefault();
			
			var qna_reply_no = $(this).data("reply");
			
			var form = {qna_reply_no:qna_reply_no}
			
			$.ajax({
				type : "post",
				data :JSON.stringify(form),
				dataType : "json",
				url : "${contextPath}/reply/list",
				processData : true,                                                      
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(jObj) {
					
					str = '';
					
					str += '<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">';
					str += '<div class="modal-content">';
					str += '<div class="modal-header">';
					str += '<h5 class="modal-title" id="staticBackdropLabel">댓글 수정</h5>'
					str += '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>';
					str += '</div>';
					str += '<div class="modal-body">';
					str += '<form action="" method="post" name="" id="reply">';
					str += '<input type="hidden" id="member_id" name="member_id" value="' + jObj.member_id + '" /><br>';
					str += '<div class="form-group row mb-3">';
					str += '<label for="member_name" class="col-sm-2 col-form-label fw-bolder">작성자</label>';
					str += '<div class="col-sm-10">';
					str += '<input type="text"  class="form-control bg-white pe-none" id="" name="" value="${memberInfo.member_name}" readonly="readonly">';
					str += '</div>';
					str += '</div>';
					str += '<div class="form-group row mb-3">';
					str += '<label for="board_contents" class="col-sm-2 col-form-label align-middle fw-bolder" >글 내용</label>';
					str += '<div class="col-sm-10">';
					str += '<textarea class="form-control" id="qna_reply_content"  name="qna_reply_content" rows="10" style="resize: none;" maxlength="1300">'
					str += jObj.qna_reply_content;
					str += '</textarea>';
					str += '</div>';
					str += '</div>';
					str += '</form>';
					str += '</div>';
					str += '<div class="modal-footer">'
					str += '<button type="button" class="btn btn-dark fn-reply-modify" data-reply="' + jObj.qna_reply_no + '">댓글수정</button>';
					str += '<button type="button" class="btn btn-secondary btn-modal-close" data-bs-dismiss="modal">닫기</button>';
					str += '</div>';
					str += '</div>';
					str += '</div>';
					
					$("#staticBackdrop").html(str);
					$("#staticBackdrop").modal("show");
					
				},
			});
			
		});
		
		
		<%-- 댓글 수정 기능 --%>
		$(document).on("click",".fn-reply-modify", function(e){
			
			e.preventDefault();
			
			var qna_reply_no = $(this).data("reply");
			var member_id = $("#member_id").val();
			var qna_reply_content = $("#qna_reply_content").val();
			var form = {qna_reply_no:qna_reply_no, member_id:member_id, qna_reply_content:qna_reply_content}
			
			$.ajax({
				type : "post",
				data :JSON.stringify(form),
				dataType : "json",
				url : "${contextPath}/reply/modify",
				processData : true,                                                      
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(jObj) {
					
					$(".btn-modal-close").click();
					
					str = '';
					
					str += jObj.qna_reply_content;
					str += '<sec:authorize access="hasRole(\'ROLE_ADMIN\')">';
					str += '<br>';
					str += '<button type="button" class="btn shadow rounded-3 float-end btn-reply-delete" data-reply="' + jObj.qna_reply_no + '" data-qna="' + jObj.qna_no + '">삭제</button>';
					str += '<button type="button" class="btn shadow rounded-3 float-end me-4 btn-reply-modify" data-reply="' + jObj.qna_reply_no + '" data-qna="' + jObj.qna_no + '">수정</button>';
					str += '</sec:authorize>';
					
					$("#" + qna_reply_no).html(str);				
					alert("댓글이 수정되었습니다");
					
				},
			});
			
			
		});
		
		
		
		
		
		
		
		<%-- 댓글 삭제 기능 --%>
		$(document).on("click",".btn-reply-delete", function(e){
			e.preventDefault();
			var qna_no = $(this).data("qna");
			var qna_reply_no = $(this).data("reply");
			
			
			var form = {qna_no:qna_no, qna_reply_no:qna_reply_no}
			
			$.ajax({
				type : "post",
				data :JSON.stringify(form),
				dataType : "json",
				url : "${contextPath}/reply/delete",
				processData : true,                                                      
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(data) {
					alert("댓글이 삭제되었습니다");
					$("#" + qna_reply_no).remove();
					
				}
			});
		});
		
		
	
		
		
		
	});
	
	

</script>

	
</body>
</html>
