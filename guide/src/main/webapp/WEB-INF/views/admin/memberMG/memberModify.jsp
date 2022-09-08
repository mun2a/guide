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
                    <p class="mb-4">${memberModify.member_id}</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 상세 정보</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <form action="${contextPath}/admin/memberMG/memberModifyPost" method="post" id="modifyForm">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <tbody>
	                                	<tr>
	                                        <td>이메일: ${memberModify.member_id}
	                                        	<input type="hidden" name="member_id" value="${memberModify.member_id}">
	                                        </td>
	                                    </tr>
	                                    <%-- <tr><td>권한:
	                                    <c:forEach items="${memberModify.getAuthList() }" var="auth">
	                                    ${auth.getMember_authority() }
	                                    </c:forEach>
	                                    </td></tr> --%>
	                                	<tr>
	                                        <td>비밀번호: <input type="password" class="form-control" name="member_password" id="member_password">
	                                        	<span id="span-member-password">　</span>
	                                        </td>
	                                    </tr>
	                                	<tr>
	                                        <td>비밀번호: 확인 <input type="password" class="form-control" name="member_password_confirm" id="member_password_confirm" >
	                                        	<span id="span-member-password-confirm">　</span>
	                                        </td>
	                                    </tr>
	                                	<tr>
	                                        <td>이름: ${memberModify.member_name }</td>
	                                    </tr>
	                                	<tr>
	                                        <td>닉네임: <input type="text" class="form-control" name="member_nickname" id="member_nickname" value="${memberModify.member_nickname}">
	                                        	<input type="hidden" name="ori_member_nick" id="ori_member_nick"  value="${memberModify.member_nickname}">
	                                        	<span id="span-member-nickname">　</span>
	                                        </td>
	                                    </tr>
	                                	<tr>
	                                        <td>가입일: ${memberModify.member_regist_date}</td>
	                                    </tr>
	                                	<tr>
	                                		<td>
	                                		<select name="member_lock"  class="form-control" id="member_lock">
	                                			<c:choose>
	                                				<c:when test="${memberModify.member_lock == 'N'}">
	                                					<option value="N" selected="selected">일반</option>
	                                					<option value="Y">잠금</option>
	                                				</c:when>
	                                				<c:otherwise>
	                                					<option value="N">일반</option>
	                                					<option value="Y" selected="selected">잠금</option>
	                                				</c:otherwise>
	                                			</c:choose>
	                                			
                            				</select>
                            				</td>
                            				
	                                    </tr>
	                                    <tr>
	                                        <td>
	                                        	<a class="modify btn btn-primary btn-sm" href="${memberModify.member_id}">수정하기</a>
	                                        	<a class="cancle btn btn-danger btn-sm" >취소하기</a>
	                                        </td>
	                                    </tr>

                                    </tbody>
                                </table>
                                <input type="hidden" name="pageNum" value="${cri.pageNum }">
    							<input type="hidden" name="amount" value="${cri.amount }">
							    <input type="hidden" name="type" value="${cri.type }">
							    <input type="hidden" name="keyword" value="${cri.keyword }">
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->


<form id="actionForm" action="${contextPath}/admin/memberMG/memberModify" method="get">
	<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
</form>

<script type="text/javascript">
	var actionForm = $("#actionForm");
	
	
	//회원 수정 취소
	$(".cancle").on("click", function(e) {

		location.href = "${contextPath}/admin/memberMG/memberDetail?pageNum=${cri.pageNum}"
			+"&amount=${cri.amount}"
			+"&type=${cri.type}&keyword=${cri.keyword}&member_id=${memberModify.member_id}";
	});
</script>
            
<script>
$(document).ready(function(){
	var csrf_headername = "${_csrf.headerName}"; 
	var csrf_token = "${_csrf.token}"; 
	var modifyForm = $("#modifyForm");
	var confirm_number = "";
	
	<%-- 정규식 --%>
	var reg_blank = /[\s]/g;                        					<%-- 공백 유효성 --%>
	var reg_password = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/;		  	<%-- 비밀번호 유효성 --%>
	var reg_nick =  /^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]{2,20}$/;   									
	var reg_sc = /[`~!@#$%^&*|\\\'\";:\/?]/gi;	

	
	<%-- 비밀번호 유효성 blur처리 --%>
	$("#member_password").on("blur",function(){
		var member_password = $("#member_password").val();
		var member_password_confirm = $("#member_password_confirm").val();
		
		
		
		if (member_password == "") {
			$("#span-member-password").html(" ");
			$("#member_password").removeClass("is-invalid");
			$("#member_password").removeClass("is-valid");
		} else if (reg_blank.test(member_password)){
			$("#span-member-password").html("공백이 존재합니다.");
			$("#member_password").addClass("is-invalid");
		} else if (!reg_password.test(member_password) || reg_sc.test(member_password)){
			$("#span-member-password").html("비밀번호는 영어 숫자 조합 8~15자 입니다.");
			$("#member_password").addClass("is-invalid");
		} else if (reg_password.test(member_password)){
			$("#span-member-password").html("　");
			$("#member_password").removeClass("is-invalid");
			$("#member_password").addClass("is-valid");
		} 
		
		
		if(member_password_confirm != ""){
			if(member_password != member_password_confirm) {
				$("#span-member-password-confirm").html("비밀번호가 일치하지 않습니다.");
				$("#member_password_confirm").addClass("is-invalid");
			}
		}
	})
	
	<%-- 비밀번호확인 유효성 blur처리 --%>
	$("#member_password_confirm").on("blur",function(){
		var member_password = $("#member_password").val();
		var member_password_confirm = $("#member_password_confirm").val();
		
		if (member_password != member_password_confirm){
			$("#span-member-password-confirm").html("비밀번호가 일치하지 않습니다.");
			$("#member_password_confirm").addClass("is-invalid");
		} else if (member_password == member_password_confirm){
			$("#span-member-password-confirm").html("　");
			$("#member_password_confirm").removeClass("is-invalid");
			$("#member_password_confirm").addClass("is-valid");
		} 
		
		
		if(member_password_confirm != ""){
			if(member_password != member_password_confirm) {
				$("#span-member-password-confirm").html("비밀번호가 일치하지 않습니다.");
				$("#member_password_confirm").addClass("is-invalid");
			}
		}
	})


	<%-- 닉네임 유효성 blur 처리--%>
	$("#member_nickname").on("blur",function(){
		var member_nickname = $("#member_nickname").val();
		var ori_member_nick = $("#ori_member_nick").val();
		var form = {member_nickname:member_nickname}
		
		if(member_nickname == "") {
			$("#span-member-nickname").html("닉네임을 입력해주세요.");
			$("#member_nickname").addClass("is-invalid");
		} else if (reg_blank.test(member_nickname)){
			$("#span-member-nickname").html("공백이 존재합니다.");
			$("#member_nickname").addClass("is-invalid");
		} else if (!reg_nick.test(member_nickname)){
			$("#span-member-nickname").html("한글, 영어, 숫자로 2~20자 입력해주세요.");
			$("#member_nickname").addClass("is-invalid");
		} else if (reg_nick.test(member_nickname)){
			
			$.ajax({
				type : "post",
				data : JSON.stringify(form),
				url : "${contextPath}/admin/memberMG/confirmNick",
				processData : true, 
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
			    success : function(data) {
					if(data != "") {
						if (data == ori_member_nick) {
							$("#span-member-nickname").html(" ");
							$("#member_nickname").removeClass("is-invalid");
							$("#member_nickname").addClass("is-valid");
						} else {
							$("#span-member-nickname").html("존재하는 닉네임입니다.");
							$("#member_nickname").removeClass("is-valid");
							$("#member_nickname").addClass("is-invalid");
						}
					} else {
						$("#span-member-nickname").html(" 사용가능한 닉네임입니다. ");
						$("#member_nickname").removeClass("is-invalid");
						$("#member_nickname").addClass("is-valid");
					}
				},
				error : function(request, error) {                                     
			        alert("error"); 
			    },
			});
		} 
	});
	
	
	function password() {
		var member_password = $("#member_password").val();
		
		if (member_password == "") {
			return false
		} else if (reg_blank.test(member_password)){
			return true
		} else if (!reg_password.test(member_password) || reg_sc.test(member_password)){
			return true
		} else if (reg_password.test(member_password)){
			return false
		} 
	}
	
	
	
	$(".modify").on("click", function(e) {
		e.preventDefault();
		var member_password = $("#member_password").val();
		var member_password_confirm = $("#member_password_confirm").val();
		var member_nickname = $("#member_nickname").val();
		var ori_member_nick = $("#ori_member_nick").val();
		
		var form = {member_nickname:member_nickname}
		
		if(password()){
			alert("비밀번호를 확인해주세요.");
			$("#member_password").focus();
			return false;
		} else if(member_password != member_password_confirm){
			alert("비밀번호가 일치하지 않습니다.");
			$("#member_password_confirm").focus();
			return false;
		} else if(member_nickname == ""){
			alert("닉네임을 입력해주세요.");
			$("#member_nickname").focus();
			return false;
		} else if(!reg_nick.test(member_nickname)){
			alert("닉네임을 확인해주세요.");
			$("#member_nickname").focus();
			return false;
		} else if (reg_nick.test(member_nickname)){
			
			$.ajax({
				type : "post",
				data : JSON.stringify(form),
				url : "${contextPath}/admin/memberMG/confirmNick",
				processData : true, 
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(data) {
					if(data != "") {
						if (data == ori_member_nick) {
							modifyForm.submit();
						} else {
							alert("닉네임을 확인해주세요.");
						}
					} else {
						modifyForm.submit();
					}
				},
				error : function(request, error) {                                     
			        alert("error"); 
			    },
			});
		}
		
		/* modifyForm.submit(); */
	
	});
	
});



</script>


<%@ include file="../includes/adminFooter.jsp"%> 
