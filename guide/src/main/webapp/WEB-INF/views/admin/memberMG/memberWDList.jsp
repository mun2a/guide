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
</style>

</head>
<!-- End table header -->


                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">TBL_MEMBER</h1>
                    <p class="mb-4">탈퇴 회원</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">탈퇴 회원 정보</h6>
                        </div>
                        <div class="card-body">
                        
                        
                        <!-- 검색 -->
                        <div id="dataTable_filter" class="dataTables_filter">
                        <form id="searchForm" action="#" method="get">
							<label>Search <br>
							검색 유형: &nbsp;
							<select name="type" id="type" class="form-control form-control-sm" aria-controls="dataTable" style="width: 10%;">
								<option selected value="ENI" <c:out value="${pageMaker.cri.type == 'ENI' ? 'selected' : ''}" />>--------</option>
								<option value="E" <c:out value="${pageMaker.cri.type == 'E' ? 'selected' : ''}" />>이메일</option>
								<option value="N" <c:out value="${pageMaker.cri.type == 'N' ? 'selected' : ''}" />>이름</option>
								<option value="I" <c:out value="${pageMaker.cri.type == 'I' ? 'selected' : ''}" />>닉네임</option>
								<option value="L" <c:out value="${pageMaker.cri.type == 'L' ? 'selected' : ''}" />>잠금</option>
							</select>
							
							<input type="search" name="keyword" placeholder="Search" value="${pageMaker.cri.keyword}" class="form-control form-control-sm" placeholder="" aria-controls="dataTable" style="width: 29%;">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">  
                            <input type="hidden" name="amount" value="${pageMaker.cri.amount}"> 
							<button class="btn btn-default" id="searchBtn"><i class="fa fa-search"></i>검색</button>
							</label>
						</form>
						</div> <!-- End 검색 -->
						
						
						
						
                            <div class="table-responsive">
                                <table class="table table-bordered" id="#" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>이메일</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>가입일</th>
                                            <th>잠금</th>
                                            <th>설정</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>이메일</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>가입일</th>
                                            <th>잠금</th>
                                            <th>설정</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
										<c:choose>
										<c:when test="${empty memberMGList}">
										    <tr>
										      <td colspan="6">
										         <p align="center">
										            <b><span >탈퇴한 회원이 없습니다.</span></b>
										        </p>
										      </td>  
										    </tr>
										</c:when>
										<c:otherwise>
										<c:forEach items="${memberMGList }" var="memDto">
	                                	<tr>
	                                        <td>${memDto.member_id}</td>
	                                        <td>${memDto.member_name }</td>
	                                        <td>${memDto.member_nickname}</td>
	                                        <td>${memDto.member_regist_date}</td>
	                                        <c:choose>
	                                        	<c:when test="${memDto.member_lock == 'N'}">
	                                        		<td>일반</td>
	                                        	</c:when>
	                                        	<c:when test="${memDto.member_lock == 'Y'}">
	                                        		<td>잠금</td>
	                                        	</c:when>
	                                        	<c:otherwise>
	                                        		<td>기타</td>
	                                        	</c:otherwise>
	                                        </c:choose>
	                                        <td>
	                                        	<a class="cancle btn btn-primary btn-sm" href="${memDto.member_id}">탈퇴 취소</a>
	                                        	<a class="remove btn btn-danger btn-sm" href="${memDto.member_id}">삭제</a>
	                                        </td>
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
                            
                            
                            <form id="actionForm" action="${contextPath}/admin/memberMG/memberWDList" method="post">
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
	
	//탈퇴취소
	$(".cancle").on("click", function(e) {
		e.preventDefault();
		var pk = $(this).attr("href");
		
		if (confirm("탈퇴를 취소하시겠습니까? : " + pk)) {
			actionForm.append("<input type='hidden' name='member_id' value='" + pk + "'>");
			actionForm.attr("action", "${contextPath}/admin/memberMG/memberWDCancle");
			actionForm.submit();
			alert("탈퇴가 취소되었습니다. : " + pk);
		}
	
	});
	
	//회원 삭제
	$(".remove").on("click", function(e) {
		e.preventDefault();
		var pk = $(this).attr("href");
		
		if (confirm("회원 정보를 삭제 하시겠습니까? : " + pk)) {
			actionForm.append("<input type='hidden' name='member_id' value='" + pk + "'>");
			actionForm.attr("action", "${contextPath}/admin/memberMG/memberRemove");
			actionForm.submit();
			alert("회원 정보가 삭제되었습니다. : " + pk);
		}  
		
	});
	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		
		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
</script>


<%@ include file="../includes/adminFooter.jsp"%> 
