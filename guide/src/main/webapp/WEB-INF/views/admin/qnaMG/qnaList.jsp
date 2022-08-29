<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/adminHeader.jsp"%>

<!-- Begin table header -->
<head>
    <!-- Custom styles for this page -->
    <link href="${contextPath }/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<style type="text/css">
.form-control {
	display: inline;
	width: 19%;
}

label {
    display: block;
}

.qnaDto:hover {
	background-color: #CCE5FF;
	cursor: pointer;
}

</style>

</head>
<!-- End table header -->


                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">TBL_QNA</h1>
                    <p class="mb-4">문의글 목록</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Q & A</h6>
                        </div>
                        <div class="card-body">
                        
                        
                        <!-- 검색 -->
                      <div id="dataTable_filter" class="dataTables_filter">
                        <form id="searchForm" action="#" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<label>Search <br>
							검색 유형: &nbsp;
							<select name="type" id="type" class="form-control form-control-sm" aria-controls="dataTable" style="width: 10%;">
								<option selected value="QTEN" <c:out value="${pageMaker.cri.type == 'QTEN' ? 'selected' : ''}" />>--------</option>
								<option value="Q" <c:out value="${pageMaker.cri.type == 'Q' ? 'selected' : ''}" />>글 번호</option>
								<option value="T" <c:out value="${pageMaker.cri.type == 'T' ? 'selected' : ''}" />>제목</option>
								<option value="E" <c:out value="${pageMaker.cri.type == 'E' ? 'selected' : ''}" />>아이디</option>
								<option value="N" <c:out value="${pageMaker.cri.type == 'N' ? 'selected' : ''}" />>이름</option>
							</select>
							
							<input type="search" name="keyword" placeholder="Search" value="${pageMaker.cri.keyword}" class="form-control form-control-sm" placeholder="" aria-controls="dataTable" style="width: 29%;">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">  
                            <input type="hidden" name="amount" value="${pageMaker.cri.amount}"> 
							<button class="btn btn-default" id="searchBtn"><i class="fa fa-search"></i>검색</button>
							</label>
						</form>
						</div>  
						<!-- End 검색 -->
                        
                        
                        
                        
                            <div class="table-responsive">
                                <table class="table table-bordered" id="#" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>글 번호</th>
                                            <th>제목</th>
                                            <th>작성자 아이디</th>
                                            <th>작성자 이름</th>
                                            <th>등록일</th>
                                            <th>답변</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>글 번호</th>
                                            <th>제목</th>
                                            <th>작성자 아이디</th>
                                            <th>작성자 이름</th>
                                            <th>등록일</th>
                                            <th>답변</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:choose>
										<c:when test="${empty qnaMGList}">
										    <tr>
										      <td colspan="6">
										         <p align="center">
										            <b><span >등록된 문의글이 없습니다.</span></b>
										        </p>
										      </td>  
										    </tr>
										</c:when>
										<c:otherwise>
										<c:forEach items="${qnaMGList }" var="qnaDto">
	                                	<tr class="qnaDto" onclick="detail(${qnaDto.qna_no});">
	                                        <td>${qnaDto.qna_no}</td>
	                                        <td>
	                                        <c:choose>
	                                        	<c:when test="${qnaDto.qna_title == '1'}">
	                                        	계정 문의
	                                        	</c:when>
	                                        	<c:when test="${qnaDto.qna_title == '2'}">
	                                        	일정 문의
	                                        	</c:when>
	                                        	<c:when test="${qnaDto.qna_title == '3'}">
	                                        	기타 문의
	                                        	</c:when>
	                                        </c:choose>
	                                        </td>
	                                        <td>${qnaDto.qna_write}</td>
	                                        <td>${qnaDto.qna_write_name}</td>
	                                        <td>${qnaDto.qna_regist_date }</td>
	                                        <c:choose>
	                                        	<c:when test="${qnaDto.qna_reply_exist == 'N'}">
	                                        		<td>X</td>
	                                        	</c:when>
	                                        	<c:when test="${qnaDto.qna_reply_exist == 'Y'}">
	                                        		<td>O</td>
	                                        	</c:when>
	                                        </c:choose>
	                                    </tr>
	                                	</c:forEach>
	                                	</c:otherwise>
										</c:choose>

                                    </tbody>
                                </table>
                                
                                
                                <div class="pull-right" style="float: right;">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                            	<ul class="pagination">
                            		<c:if test="${pageMaker.prev }">
                            			<li class="paginate_button page-item previous" id="dataTable_previous">
                            				<a href="${pageMaker.startPage - 1 }" aria-controls="dataTable" data-dt-idx="${pageMaker.startPage - 1 }" tabindex="0" class="page-link">Previous</a>
                            			</li>
                            		</c:if>
                            		
                            		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                            			<li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? 'active' : '' }">
                            				<a href="${num }" aria-controls="dataTable" data-dt-idx="${num }" tabindex="0" class="page-link">${num }</a>
                            			</li>
                            		</c:forEach>
                            		
                            		<c:if test="${pageMaker.next }">
                            			<li class="paginate_button page-item next" id="dataTable_next">
                            				<a href="${pageMaker.endPage + 1 }" aria-controls="dataTable" data-dt-idx="${pageMaker.endPage + 1 }" tabindex="0" class="page-link">Next</a>
                            			</li>
                            		</c:if>
                            	</ul>
                            </div>
                            </div>
                            
                            
                            <form id="actionForm" action="${contextPath}/admin/qnaMG/qnaList" method="post">
                            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                            	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                            	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                            </form>
                                
                                
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->


<%-- <form id="actionForm" action="${contextPath}/admin/memberMG/memberList" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form> --%>

<script type="text/javascript">
	var actionForm = $("#actionForm");
	
	//문의글 상세
	function detail(qna_no) {
		actionForm.append("<input type='hidden' name='qna_no' value='" + qna_no + "'>");
		actionForm.attr("action", "${contextPath}/admin/qnaMG/qnaDetail");
		actionForm.submit();
	}
	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		
		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
</script>
            


<%@ include file="../includes/adminFooter.jsp"%> 
