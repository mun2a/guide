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
                            <h6 class="m-0 font-weight-bold text-primary">Q & A</h6>
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
                            <h6 class="m-0 font-weight-bold text-primary">Q & A Reply</h6>
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
	                                	<tr>
	                                        <td>글 번호:  ${qnaReDto.qna_no}</td>
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



<script type="text/javascript">
	var actionForm = $("#actionForm");
/* 	$(".detail").on("click", function(e) {
		e.preventDefault();
		var pk = $(this).attr("href");
		
		actionForm.append("<input type='hidden' name='tour_no' value='" + pk + "'>");
		actionForm.attr("action", "${contextPath}/admin/tourMG/qnaDetail");
		actionForm.submit();
	
	}); */
	
/* 	$(".remove").on("click", function(e) {
		e.preventDefault();
		var pk = $(this).attr("href");
		
		actionForm.append("<input type='hidden' name='tour_no' value='" + pk + "'>");
		actionForm.attr("action", "${contextPath}/admin/tourMG/tourListDel");
		actionForm.submit();
		alert("삭제되었습니다. : " + pk );
	
	}); */
	
	
</script>
            


<%@ include file="../includes/adminFooter.jsp"%> 
