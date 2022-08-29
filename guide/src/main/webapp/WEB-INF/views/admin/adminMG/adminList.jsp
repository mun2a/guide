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
                    <h1 class="h3 mb-2 text-gray-800">TBL_MEMBER</h1>
                    <p class="mb-4">관리자 목록</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">관리자 정보
								<a class="btn btn-success btn-icon-split" href="#" data-toggle="modal" data-target="#moaModal" style="float: right;">
									<span class="icon text-white-50">
										<i class='fas fa-plus' style='color:white;'></i>
									</span>
									<span class="text">관리자 추가</span>
								</a>
							</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>이메일</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>가입일</th>
                                            <th>권한</th>
                                            <th>설정</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>이메일</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>가입일</th>
                                            <th>권한</th>
                                            <th>설정</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
										<c:forEach items="${adminMGList }" var="adDto">
	                                	<tr>
	                                        <td>${adDto.member_id}</td>
	                                        <td>${adDto.member_name }</td>
	                                        <td>${adDto.member_nickname}</td>
	                                        <td>${adDto.member_regist_date}</td>
	                                        <td>${adDto.getAuthList().get(0).getMember_authority() }
	                                    </td>
	                                        <td>
	                                        	<a class="remove btn btn-danger btn-sm" href="${adDto.member_id}">권한 삭제</a>
	                                        </td>
	                                    </tr>
	                                	</c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->


<form id="actionForm" action="${contextPath}/admin/adminMG/adminList" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>



 <!-- 관리자 권한 추가 Modal-->
  <div class="modal fade" id="moaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">관리자 권한 추가</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">x</span>
          </button>
        </div>
        <div class="modal-body">
	     	<form id="adminAuthForm" action="${contextPath}/admin/adminMG/addAdminAuth" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="member_id" name="member_id" placeholder="text" maxlength="50" > 
					<label for="member_id" >관리자 이메일을 입력</label>
				</div>
				<span id="span-member-id"></span>
			</form>
        </div>
        <div class="modal-footer">
			<button class="authAdd btn btn-success" type="button" data-dismiss="modal">관리자 추가</button>
         	<button class="cancle btn btn-dark" type="button" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>
  



<script type="text/javascript">

$(document).ready(function(){
	var csrf_headername = "${_csrf.headerName}"; 
	var csrf_token = "${_csrf.token}"; 

	/* 정규식 */
	var reg_blank = /[\s]/g;                        													
	var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
	
	var emailResult = 0;
	
	$("#member_id").on("keyup",function(){
		var member_id = $("#member_id").val();
		var form = {member_id : member_id};
		if(member_id == ""){
			$("#span-member-id").html("이메일을 입력해주세요.");
			$("#member_id").addClass("is-invalid");
		} else if (reg_blank.test(member_id)){
			$("#span-member-id").html("공백이 존재합니다.");
			$("#member_id").addClass("is-invalid");
		} else if (!reg_email.test(member_id)){
			$("#span-member-id").html("올바르지않는 이메일 형식입니다.");
			$("#member_id").addClass("is-invalid");
		} else if (reg_email.test(member_id)){
			emailResult = 0;
			$.ajax({
				type : "post",
				data : member_id,
				url : "${contextPath}/admin/adminMG/confirmPK",
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(data) {
					if(data != "0") {
						$("#span-member-id").html("  ");
						$("#member_id").removeClass("is-invalid");
						emailResult = 1;
					} else {
						$("#span-member-id").html("등록된 이메일 정보가 없습니다.");
						$("#member_id").removeClass("is-valid");
						$("#member_id").addClass("is-invalid");
					}
				},
				error : function(request, error) {                                     
					$("#span-member-id").html("error");
					$("#member_id").removeClass("is-valid");
					$("#member_id").addClass("is-invalid"); 
			    },
			});
		}
	});
	
	var adminAuthForm = $("#adminAuthForm");
	
	$(".authAdd").on("click", function(e) {
		e.preventDefault();
		var member_id = $("#member_id").val();
		
		if(member_id == "") {
			alert("이메일을 입력해주세요.");
			$("#member_id").focus();
			return false;
		} else if(reg_blank.test(member_id) || !reg_email.test(member_id)){
			alert("이메일을 확인해주세요.");
			$("#member_id").focus();
			return false;
		}  else if(emailResult = 0){
			return false;
		}else {
			adminAuthForm.submit();
		}
		
	
	});
	
});

	var actionForm = $("#actionForm");
	
	//관리자 권한 삭제
 	$(".remove").on("click", function(e) {
		e.preventDefault();
		var pk = $(this).attr("href");
		
		if (confirm("관리자 권한을 삭제 하시겠습니까? : " + pk)) {
			actionForm.append("<input type='hidden' name='member_id' value='" + pk + "'>");
			actionForm.attr("action", "${contextPath}/admin/adminMG/removeAdminAuth");
			actionForm.submit();
			alert("관리자 권한이 삭제되었습니다. : " + pk );
		}  
	
	}); 
	
	
</script>
            


<%@ include file="../includes/adminFooter.jsp"%> 
