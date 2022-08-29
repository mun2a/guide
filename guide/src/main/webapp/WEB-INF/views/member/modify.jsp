<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	
<%@ include file="../common/cssLink.jsp"%>
<body>
<%@ include file="../common/mainheader.jsp"%>
	

<%-- 바디 시작 --%>

<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-7 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h2 class="card-title text-center mb-5 fw-bold fs-2">
							${memberInfo.member_nickname}
							<br>
							<span class="fs-5">님의 프로필</span>
						</h2>
						
						<form action="" method="post" name="frm" id="frm" >
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
							<div class="section-title-container">
                                <div class="float-start border-0" style="height: 25px; width: 10px; background-color: #98DDE3; margin-right: 10px"></div>
                                <h5 style="margin-bottom: 15px">
                                <b>기본정보</b></h5>
                            </div>
							<div class="form-floating mb-2">
								<input type="text" class="form-control pe-none bg-white" id="member_id" name="member_id" value="${memberInfo.member_id}" placeholder="text" maxlength="50" readonly="readonly"> 
								<label for="member_id">아이디</label>
								<span class="fs-6 text-danger" id="span-member-id">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="text" class="form-control pe-none bg-white"  id="member_name" name="member_name" value="${memberInfo.member_name}" placeholder="text" maxlength="5" readonly="readonly"> 
								<label for="member_name">이름</label>
								<span class="fs-6 text-danger" id="span-member-name">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="text" class="form-control " id="member_nickname" name="member_nickname" value="${memberInfo.member_nickname}" placeholder="text" maxlength="5"> 
								<label for="member_nickname">닉네임</label>
								<span class="fs-6 text-danger" id="span-member-nickname">　</span>
							</div>
							
							<div class="section-title-container">
                                <div class="float-start border-0" style="height: 25px; width: 10px; background-color: #98DDE3; margin-right: 10px"></div>
                                <h5 style="margin-bottom: 15px">
                                <b>비밀번호</b></h5>
                            </div>
							<div class="form-floating mb-2">
								<input type="password" class="form-control" id="member_password" name="member_password"  placeholder="text" maxlength="20" > 
								<label for="member_password">비밀번호</label>
								<span class="fs-6 text-danger" id="span-member-password">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="password" class="form-control"  id="new_password" name="new_password"  placeholder="text" maxlength="20" > 
								<label for="new_password">새 비밀번호</label>
								<span class="fs-6 text-danger" id="span-new-member-password">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="password" class="form-control" id="confirm_new_password" name="confirm_new_password"  placeholder="text" maxlength="20"> 
								<label for="confirm_new_password">새 비밀번호 확인</label>
								<span class="fs-6 text-danger" id="span-confirm-new-password">　</span>
							</div>
							
							<div class="hstack gap-3 mb-3">
								<button class="btn btn-dark btn-login text-uppercase fw-bold w-100 border-0" id="btn-modify" type="submit" style=" background-color: #98DDE3;">
									정보수정
								</button>
							</div>
							<div class="hstack gap-3">
								<button class="btn btn-dark btn-login text-uppercase fw-bold w-50" id="btn-delete" type="submit">
									회원탈퇴
								</button>
								<a href="${contextPath}/member/info" class="w-50">
									<input type="button" value="뒤로가기" class="btn btn-dark btn-login text-uppercase fw-bold w-100">
								</a>
							</div>
						</form>
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
		
		$("#btn-modify").on("click",function(e){
			e.preventDefault();
			
			$("#frm").attr("action", "${contextPath}/member/modify");
			$("#frm").submit();
		});
		
		$("#btn-delete").on("click",function(e){
			e.preventDefault();
			
			$("#frm").attr("action", "${contextPath}/member/delete");
			$("#frm").submit();
		});
		
		
		
		
	});



</script>


</body>
</html>
