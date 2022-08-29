<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	
<%@ include file="../common/cssLink.jsp"%>
<body>
<%@ include file="../common/mainheader.jsp"%>
	

<%-- 바디 시작 --%>

<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h2 class="card-title text-center mb-5 fw-bold fs-2" id="find-title">비밀번호 찾기</h2>
						<form action="${contextPath}/member/find" method="post" name="form-find-password" id="form-find">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="member_id" name="member_id" placeholder="text" maxlength="50" > 
								<label for="member_id" >이메일</label>
							</div>
							<div class="mb-3 text-secondary text-center" style="font-size: 14px;">
								회원가입 시 등록한 이메일 입력해 주시면 
								<br> 임시 비밀번호를 발급해 드립니다.
							</div>
							
							<div class="d-grid">
								<button class="btn btn-dark btn-login text-uppercase fw-bold border-0" id="btn-send" type="submit" style="background-color: #98DDE3;">임시 비밀번호 전송</button><br>
							</div>
								<div style="font-size: 14px; margin-top: -20px;">
									* 메일이 도착하기까지 몇 분 정도 소요될 수 있습니다.
									<br>* 스팸 메일함으로 발송될 수 있으니 체크 바랍니다.
								</div>
							<div class="d-grid mt-3">
								<a href="${contextPath}/login" class="btn btn-dark btn-login text-uppercase fw-bold" id="" type="submit">뒤로가기</a>
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
		var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; <%-- 이메일 유효성 --%>
		
		$("#btn-send").on("click",function(e){
			
			e.preventDefault();
			
			member_id = $("#member_id").val();
			
			if(member_id == ""){
				fnModal("이메일을 입력해주세요");
				return false;
			} else if(!reg_email.test(member_id)) {
				fnModal("이메일 형식이 올바르지 않습니다.");
				return false;
			} 
			
			$("#form-find").submit();
			
		}); 
		
	
		
	});

</script>	

</body>
</html>
