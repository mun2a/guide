<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/adminHeader.jsp"%>

<!-- Begin table header -->
<head>
    <!-- Custom styles for this page -->
    <link href="${contextPath }/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
                                <table class="table table-bordered" id="#" width="100%" cellspacing="0">
                                    <tbody>
	                                	<tr>
	                                        <td>문의글 번호: ${qnaDetail.qna_no}</td>
	                                    </tr>
	                                	<tr>
	                                		<td>제목:  
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
	                                    </tr>
	                                	<tr>
	                                        <td>작성자 아이디: ${qnaDetail.qna_write}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>작성자 이름: ${qnaDetail.qna_write_name}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>등록일: ${qnaDetail.qna_regist_date}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>내용: ${qnaDetail.qna_content}</td>
	                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Q & A Reply &nbsp;&nbsp;&nbsp;
	                        <a class="qna_reply_remove btn btn-danger btn-sm" >답변 삭제</a>
	                        
	                        <c:choose>
							<c:when test="${empty qnaReplyList}">
                            	<a class="qna_reply_add btn btn-primary btn-sm" style="float: right;">답변 등록하기</a>
                            </c:when>
                            <c:otherwise>
                            	<a class="qna_reply_modify btn btn-primary btn-sm" style="float: right;">답변 수정하기</a>
                            </c:otherwise>
                            </c:choose>
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="#" width="100%" cellspacing="0">
                                    <tbody>
	                                	<c:choose>
										<c:when test="${empty qnaReplyList}">
										    <tr>
										      <td colspan="6">
										         <p align="center">
										            <b><span >등록된 답변이 없습니다.</span></b>
										        </p>
										      </td>  
										    </tr>
										</c:when>
										<c:otherwise>
										<c:forEach items="${qnaReplyList }" var="qnaReDto">
	                                	<tr>
	                                        <td>글 번호: ${qnaReDto.qna_no}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>답변 글 번호:  ${qnaReDto.qna_reply_no}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>작성자:  ${qnaReDto.member_id}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>답변 등록일:  ${qnaReDto.qna_reply_regist_date }</td>
	                                    </tr>
	                                	<tr>
	                                        <td>답변 내용:  ${qnaReDto.qna_reply_content }</td>
	                                    </tr>
	                                	</c:forEach>
	                                	</c:otherwise>
										</c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                    </div>

                </div>
                <!-- /.container-fluid -->
                
<a class="" href="#" data-toggle="modal" data-target="#infoModal">
	<i class="fas fa-arrow-right"></i>
</a> 
                
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
	
 	$(".qna_remove").on("click", function(e) {
		e.preventDefault();
		/* var pk = $(this).attr("href"); */
		
		if (confirm("문의를 삭제하시겠습니까? : " )){
			actionForm.attr("action", "${contextPath}/admin/qnaMG/delete");
			actionForm.submit();
		}
	});
	
/* 	$(".remove").on("click", function(e) {
		e.preventDefault();
		var pk = $(this).attr("href");
		
		actionForm.append("<input type='hidden' name='tour_no' value='" + pk + "'>");
		actionForm.attr("action", "${contextPath}/admin/qnaMG/qnaList");
		actionForm.submit();
		alert("삭제되었습니다. : " + pk );
	
	}); */
	
	
</script>
            


<%@ include file="../includes/adminFooter.jsp"%> 
