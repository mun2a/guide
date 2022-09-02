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
                    <h1 class="h3 mb-2 text-gray-800">회원 상세 정보</h1>
                    <p class="mb-4">${memberDetail.member_id}</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 상세 정보</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <tbody>
	                                	<tr>
	                                        <td>이메일: ${memberDetail.member_id}</td>
	                                    </tr>
	                                    <tr><td>권한:
	                                    <c:forEach items="${memberDetail.getAuthList() }" var="auth">
	                                    <c:if test="${auth.getMember_authority() == 'ROLE_MEMBER' }">
	                                    	회원
	                                    </c:if>
	                                    <c:if test="${auth.getMember_authority() == 'ROLE_ADMIN' }">
	                                    	관리자, 
	                                    </c:if>
	                                    </c:forEach>
	                                    </td></tr>
	                                	<tr>
	                                        <td>이름: ${memberDetail.member_name }</td>
	                                    </tr>
	                                	<tr>
	                                        <td>닉네임: ${memberDetail.member_nickname}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>가입일: ${memberDetail.member_regist_date}</td>
	                                    </tr>
	                                	<tr>
	                                        <c:choose>
	                                        	<c:when test="${memberDetail.member_lock == 'N'}">
	                                        		<td>잠금 상태: 일반</td>
	                                        	</c:when>
	                                        	<c:when test="${memberDetail.member_lock == 'Y'}">
	                                        		<td>잠금 상태: 잠금</td>
	                                        	</c:when>
	                                        	<c:otherwise>
	                                        		<td>기타</td>
	                                        	</c:otherwise>
	                                        </c:choose>
	                                    </tr>
	                                    <tr>
	                                        <td>
	                                        	<a class="modify btn btn-primary btn-sm" href="${memberDetail.member_id}">수정</a>
	                                        	<a class="withdraw btn btn-danger btn-sm" href="${memberDetail.member_id}">탈퇴</a>
	                                        	
	                                        	<a class="list btn btn-secondary btn-sm" style="float: right;">목록</a>
	                                        </td>
	                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->


<form id="actionForm" action="${contextPath}/admin/memberMG/memberDetail" method="get">
<%-- 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
    <input type="hidden" name="type" value="${pageMaker.cri.type }">
    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
    
    <input type="hidden" name="member_id" value="${memberDetail.member_id}">
</form>

<script type="text/javascript">

	
	var actionForm = $("#actionForm");
	
	//회원 수정
	$(".modify").on("click", function(e) {
		e.preventDefault();
		var pk = $(this).attr("href");
		
		actionForm.append("<input type='hidden' name='member_id' value='" + pk + "'>");
		actionForm.attr("action", "${contextPath}/admin/memberMG/memberModify");
		actionForm.submit();
	
	});
	
	//회원 탈퇴
	$(".withdraw").on("click", function(e) {
		e.preventDefault();
		var pk = $(this).attr("href");
		
		actionForm.append("<input type='hidden' name='member_id' value='" + pk + "'>");
		actionForm.attr("action", "${contextPath}/admin/memberMG/memberWD");
		actionForm.submit();
		alert("탈퇴되었습니다. : " + pk );
		
	
	});
	
	//회원 목록
	$(".list").on("click", function(e) {

		location.href = "${contextPath}/admin/memberMG/memberList?pageNum=${cri.pageNum}"
			+"&amount=${cri.amount}"
			+"&type=${cri.type}&keyword=${cri.keyword}";
	});
</script>
            


<%@ include file="../includes/adminFooter.jsp"%> 
