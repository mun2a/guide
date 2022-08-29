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
	            <h2 class="card-title text-center mb-5 fw-bold fs-2">로그인</h2>
	            
	            <form action="${contextPath}/login" method="post" name="frm" id="form-login">
	              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	              <div class="form-floating mb-3">
	                <input type="text" class="form-control" id="member_id" name="member_id" placeholder="text" value="${cookie.remember_id.value}" maxlength="50">
	                <label for="member_id">아이디</label>
	              </div>
	              <div class="form-floating mb-3">
	                <input type="password" class="form-control" id="member_password" name="member_password" placeholder="Password" value="" maxlength="20">
	                <label for="member_password">비밀번호</label>
	              </div>
	
	              <div class="form-check mb-3">
	                <input class="form-check-input" type="checkbox"  id="remember" name="remember" ${empty cookie.remember_id.value ? "" : "checked"}>
	                <label class="form-check-label" for="remember">
	                  아이디 저장
	                </label>
	              </div>
	              <div class="d-grid">
	                <button class="btn btn-dark btn-login text-uppercase fw-bold border-0" id="btn-login"type="submit" style="background-color: #98DDE3;">
	                	로그인
	                </button>
	              </div>
	            </form>
	            <br>
	            <div class="text-center">
		              <a href="${contextPath}/member/join" class="text-decoration-none text-dark">회원가입</a> 
		              &nbsp;|&nbsp; 
		              <a href="${contextPath}/member/find" class="text-decoration-none text-dark">비밀번호찾기</a>
	            </div>
	              
	              <hr class="my-4">
	              <div class="d-grid mb-2">
	                <button class="btn btn-danger text-uppercase fw-bold" type="submit" style="background-color: red;">
	                  <i class="bi bi-google btn-google"></i> 구글 로그인
	                  
	                </button>
	              </div>
	              <div class="d-grid">
	                <button class="btn btn-primary text-uppercase fw-bold" type="submit" style="background-color: blue;">
	                  <i class="bi bi-facebook"></i> 페이스북 로그인
	                </button>
	              </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	

	
<%-- 바디 끝 --%>

	
<%@ include file="../common/mainfooter.jsp"%>
<%@ include file="../common/jsLink.jsp"%>

<script type="text/javascript">
	
	var csrf_headername = "${_csrf.headerName}"; 
	var csrf_token = "${_csrf.token}";
	

	$("#btn-login").on("click",function(e){
		e.preventDefault();
		
		member_id = $("#member_id").val();
		member_password = $("#member_password").val();
		remember = $("#remember").is(":checked");
		
		if(member_id == ""){
			fnModal("아이디를 입력해주세요.")
			return false;
		} else if (member_password == "") {
			fnModal("비밀번호를 입력해주세요.")
			return false;
		} else {
			
			$.ajax({
				type : "post",
				data : {member_id : member_id , remember : remember},
				url : "${contextPath}/remeberId",
				datatype : "json",
				beforeSend : function(xhr) {                                          
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
			    success : function(result) {                                            
					$("#form-login").submit();
			    }, 
			    error : function(request, error) {                                      
			        alert("에러"); 
			        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			    }
			});
		}
		
	});
	

</script>
	
</body>
</html>
