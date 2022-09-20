<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/adminHeader.jsp"%>

<!-- Begin table header -->
<head>
    <!-- Custom styles for this page -->
    <link href="${contextPath }/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<style type="text/css">
.replyDiv , .replyAddDiv{
	border: 1px solid #e3e6f0;
	border-radius: 10px;
	padding: 10px;
	padding-bottom: 45px;
}

.replyAddArea {
	width: 100%; 
	resize: none;
	border: 1px solid #858796;
	padding: 10px;
}

</style>
</head>

<!-- End table header -->


                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">TBL_QNA</h1>
                    <p class="mb-4">문의글 목록.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Q & A &nbsp;&nbsp;&nbsp;
                            <a class="qna_remove btn btn-danger btn-sm" > 문의글 삭제</a>
                            <a class="list btn btn-secondary btn-sm" style="float: right;">목록</a>
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <tbody>
	                                	<tr>
	                                		<td colspan="3">
	                                			<span style="float: left;">문의글 번호: ${qnaDetail.qna_no}</span>
	                                			<span style="float: right;">등록일: ${qnaDetail.qna_regist_date}</span>
	                                		</td>
	                                	</tr>
	                                	<tr>
	                                		<td width="33%">제목:  
		                                        <c:choose>
		                                        	<c:when test="${qnaDetail.qna_title == '1'}">
		                                        	계정 문의
		                                        	</c:when>
		                                        	<c:when test="${qnaDetail.qna_title == '2'}">
		                                        	일정 문의
		                                        	</c:when>
		                                        	<c:when test="${qnaDetail.qna_title == '3'}">
		                                        	기타 문의
		                                        	</c:when>
		                                        </c:choose>
	                                        </td>
	                                        <td width="33%">아이디: ${qnaDetail.qna_write}</td>
	                                        <td width="33%">이름: ${qnaDetail.qna_write_name}</td>
	                                    </tr>
	                                	<tr>
	                                        <td colspan="3">
	                                        	<p style="padding: 0px 10px;">${qnaDetail.qna_content}</p>
	                                        </td>
	                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Q & A Reply &nbsp;&nbsp;&nbsp;</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<div class="replyAddDiv">
                           			<p style="padding: 10px; margin-bottom: 0;">
										<textarea class="replyAddArea" id="qna_reply_content" name="qna_reply_content" rows="5" placeholder="댓글을 입력하세요."></textarea>
									</p>
									<a class="qna_reply_add btn btn-primary btn-sm float-end me-4" >답변 등록하기</a>
                            	</div>
                            	<br>
                           		<c:choose>
									<c:when test="${empty qnaReplyList}">
                           				<div>
									         <p align="center">
									            <b><span >등록된 답변이 없습니다.</span></b>
									        </p>
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach items="${qnaReplyList }" var="qnaReDto">
										<div class="replyDiv" >
	                                		<span>
	                                			${qnaReDto.member_id}
	                                			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
	                                			${qnaReDto.qna_reply_regist_date }
	                                		</span>
	                                		<br>
	                                		<div id="div_${qnaReDto.qna_reply_no}">
		                                		<div id="div2_${qnaReDto.qna_reply_no}">
		                                			<p style="margin: 15px;">${qnaReDto.qna_reply_content }</p>
		                                		
		                                			<a class="qna_reply_remove btn btn-danger btn-sm float-end me-4" data-qna_reply="${qnaReDto.qna_reply_no}">답변 삭제</a>
			                                		<a class="qna_reply_modify btn btn-primary btn-sm float-end me-4" data-qna_reply="${qnaReDto.qna_reply_no}" data-qna_reply_content="${qnaReDto.qna_reply_content}">답변 수정하기</a>
		                                		</div>
	                                		</div>
										</div>
										<br>
										</c:forEach>
                                	</c:otherwise>
								</c:choose>
                            </div>
                        </div>
                        
                    </div>

                </div>
                <!-- /.container-fluid -->
                
                
<form id="actionForm" action="#" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum }">
    <input type="hidden" name="amount" value="${cri.amount }">
    <input type="hidden" name="type" value="${cri.type }">
    <input type="hidden" name="keyword" value="${cri.keyword }">
	                            	
	<input type="hidden" name="qna_title" value="${cri.qna_title }">
	
	<input type="hidden" name="qna_no" value="${qnaDetail.qna_no }">
</form>


<script type="text/javascript">
	var actionForm = $("#actionForm");
	
	//문의글 목록
	$(".list").on("click", function(e) {
		location.href = "${contextPath}/admin/qnaMG/qnaList?pageNum=${cri.pageNum}"
			+"&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}"
			+"&qna_title=${cri.qna_title}";
	});
	
	//문의글 삭제
 	$(".qna_remove").on("click", function(e) {
		e.preventDefault();
		
		if (confirm("문의를 삭제하시겠습니까?  " )){
			actionForm.attr("action", "${contextPath}/admin/qnaMG/delete");
			actionForm.submit();
		}
	});
 	
 	//댓글 등록
 	$(".qna_reply_add").on("click", function(e) {
		e.preventDefault();
		var qna_reply_content = $("#qna_reply_content").val();
		var member_id = $("#userid").val();
		
		if (qna_reply_content == "") {
			alert("댓글 내용을 입력해주세요!")
		} else {
			actionForm.append("<input type='hidden' name='qna_reply_content' value='" + qna_reply_content + "'>");
			actionForm.append("<input type='hidden' name='member_id' value='" + member_id + "'>");
			actionForm.attr("action", "${contextPath}/admin/qnaReplyMG/addReply");
			actionForm.submit();
		}
		
	});
 	
 	
 	
 	//댓글 수정 버튼 클릭
 	$(".qna_reply_modify").on("click", function(e) {
		e.preventDefault();
		var content = "";
		var qna_reply_content = $(this).data("qna_reply_content");
		var qna_reply_no = $(this).data("qna_reply");
		
		content += '<div id="div3_'+ qna_reply_no +'">';
		content += '<p style="padding: 10px; margin-bottom: 0;">';
		content += '<textarea class="replyAddArea" id="new_content" name="qna_reply_content" rows="5">'+ qna_reply_content +'</textarea>';
		content += '</p>';
		content += '<a class="btn btn-secondary btn-sm float-end me-4" onclick="cancle('+ qna_reply_no +');" >취소하기</a>';
		content += '<a class="btn btn-primary btn-sm float-end me-4"onclick="modify('+ qna_reply_no +');" >수정하기</a>';
		content += '</div>';
		
		//$("#div_"+qna_reply_no).empty();
		$("#div2_"+qna_reply_no).hide();
		$("#div_"+qna_reply_no).append(content);
		
	});
 	
 	//수정 취소
 	function cancle(qna_reply_no) {
 		$("#div2_"+qna_reply_no).show();
 		$("#div3_"+qna_reply_no).remove();
	}
 	
 	// 댓글 수정 ==========================================
 	function modify(qna_reply_no) {
 		var member_id = $("#userid").val();
 		var qna_reply_content = $("#new_content").val();
 		
 		
 		if (qna_reply_content == "") {
			alert("댓글 내용을 입력해주세요!")
		} else {
 			actionForm.append("<input type='hidden' name='qna_reply_no' value='" + qna_reply_no + "'>");
			actionForm.append("<input type='hidden' name='qna_reply_content' value='" + qna_reply_content + "'>");
			actionForm.append("<input type='hidden' name='member_id' value='" + member_id + "'>");
			actionForm.attr("action", "${contextPath}/admin/qnaReplyMG/modifyReply");
			actionForm.submit();
		} 
 		
	}
 	
 	
 	//댓글 삭제
 	$(".qna_reply_remove").on("click", function(e) {
		e.preventDefault();
		var qna_reply_no = $(this).data("qna_reply");
		if (confirm("댓글을 삭제하시겠습니까?  " )){
			actionForm.append("<input type='hidden' name='qna_reply_no' value='" + qna_reply_no + "'>");
			actionForm.attr("action", "${contextPath}/admin/qnaReplyMG/removeReply");
			actionForm.submit();
		}
	});
	
	
	
</script>
            


<%@ include file="../includes/adminFooter.jsp"%> 
