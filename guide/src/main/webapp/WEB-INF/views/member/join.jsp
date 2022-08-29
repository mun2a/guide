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
						<h2 class="card-title text-center mb-5 fw-bold fs-2">회원가입</h2>
						
						<form action="${contextPath}/member/join" method="post" name="frm" id="form-join">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="form-floating mb-2">
								<input type="text" class="form-control float-start" style="width : 65%;" id="member_id" name="member_id" placeholder="text" maxlength="50"> 
								<input class="btn btn-dark btn-login fw-bold" id="btn-send" style="width: 30%; height: 58px; margin-left: 5%;" value="인증보내기" type="button"/>
								<label for="member_id">이메일</label>
								<span class="fs-6 text-danger" id="span-member-id">　</span>
							</div>
							<div class="form-floating mb-2" id="div-confirm-member-id" style="display: none">
								<input type="text" class="form-control" style="float: left; width : 65%;" id="confirm_member_id" name="confirm_member_id" placeholder="text" maxlength="10"> 
								<input class="btn btn-dark  btn-login fw-bold" id="btn-confirm" style="width: 30%; height: 58px; margin-left: 5%; " value="인증확인" type="button"  />
								<label for="confirm_member_id">인증번호</label>
								<span class="fs-6 text-danger" id="span-confirm-member-id">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="password" class="form-control" id="member_password" name="member_password" placeholder="text" maxlength="20"> 
								<label for="member_password">비밀번호(문자,숫자 조합 8~15자)</label>
								<span class="fs-6 text-danger" id="span-member-password">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="password" class="form-control" id="confirm_member_password" name="confirm_member_password" placeholder="text" maxlength="20"> 
								<label for="confirm_member_password">비밀번호 확인</label>
								<span class="fs-6 text-danger" id="span-confirm-member-password">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="text" class="form-control" id="member_name" name="member_name" placeholder="text" maxlength="5"> 
								<label for="member_name">이름</label>
								<span class="fs-6 text-danger" id="span-member-name">　</span>
							</div>
							<div class="form-floating mb-2">
								<input type="text" class="form-control" id="member_nickname" name="member_nickname" placeholder="text" maxlength="5"> 
								<label for="member_nickname">닉네임</label>
								<span class="fs-6 text-danger" id="span-member-nickname">　</span>
							</div>
							
							<div class="form-check mb-2">
							  <input class="form-check-input" type="checkbox" name="check1" id="check1">
							  <label class="form-check-label" for="check1">
							   &nbsp;[필수] 이용약관에 동의합니다.
							  </label>
							  <a href="#" class="text-decoration-none" id="link-check1" style="float: right;" >보기</a>
							</div>
							<div class="form-check mb-3">
							  <input class="form-check-input" type="checkbox" name="check2" id="check2">
							  <label class="form-check-label" for="check2">
							   &nbsp;[필수] 개인정보수집에 동의합니다.
							  </label>
							  <a href="#" class="text-decoration-none" id="link-check2" style="float: right;">보기</a>
							</div>
						
					      
							<div class="d-grid mb-3">
								<input type="submit" value="회원가입" class="btn btn-dark btn-login text-uppercase fw-bold border-0" id="btn-login" style="height: 40px; background-color: #98DDE3;">
							</div>
							<div class="d-grid">
								<button class="btn btn-dark btn-login text-uppercase fw-bold sub-hover" type="submit" style="height: 40px">
									취소
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade  modal-check" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title  modal-check-title" id="staticBackdropLabel"></h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body modal-check-content">
           
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
<%-- 바디 끝 --%>

	
<%@ include file="../common/mainfooter.jsp"%>
<%@ include file="../common/jsLink.jsp"%>

<script type="text/javascript">



$(document).ready(function(){
	
	var csrf_headername = "${_csrf.headerName}"; 
	var csrf_token = "${_csrf.token}"; 
	var confirm_number = "";
	<%-- 정규식 --%>
	
	var reg_blank = /[\s]/g;                        													<%-- 공백 유효성 --%>
	var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; <%-- 이메일 유효성 --%>
	var reg_password = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/;		  								 	<%-- 비밀번호 유효성 --%>
	var reg_name = /^[가-힣]{2,5}$/;     																	<%-- 이름 및 닉네임 유효성 --%>  
	var reg_kor  = /^[가-힣]+$/;   																		<%-- 한글 유효성 --%>
	var reg_sc = /[`~!@#$%^&*|\\\'\";:\/?]/gi;															<%-- 특수문자 유효성 --%>
	
	<%-- 유효성 검사 --%>
	<%-- 아이디 유효성 blur 처리 --%>
	$("#member_id").on("blur",function(){
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
			
			$.ajax({
				type : "post",
				data : JSON.stringify(form),
				dataType : "text",
				url : "${contextPath}/member/duplicateCheck",
				processData : true,                                                      
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(data) {
					if(data != "") {
						$("#span-member-id").html("존재하는 이메일입니다.");
						$("#member_id").removeClass("is-valid");
						$("#member_id").addClass("is-invalid");
					} else {
						$("#span-member-id").html("　");
						$("#member_id").removeClass("is-invalid");
					}
				},
				error : function(request, error) {                                     
			        alert("에러"); 
			        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			    },
			});
		}
	});
	
	
	<%-- 이메일 인증 보내기 --%>
	$("#btn-send").on("click", function(e){
		
		e.preventDefault();
		var member_id = $("#member_id").val();
		var form = {member_id:member_id}
		
		if(member_id == ""){
			$("#member_id").focus();
			return false;
		} else if (reg_blank.test(member_id)){
			$("#member_id").focus();
			return false;
		} else if (!reg_email.test(member_id)){
			$("#member_id").focus();
			return false;
		} else if (reg_email.test(member_id)){
			
			$.ajax({
				type : "post",
				data : JSON.stringify(form),
				dataType : "text",
				url : "${contextPath}/member/duplicateCheck",
				processData : true,                                                      
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(data) {
					if(data != "") {
						$("#member_id").focus();
						return false;
					} else {
						$("#div-confirm-member-id").show();
						$("#member_id").addClass("pe-none");
						fnModal("해당 메일로 인증번호가 전송되었습니다.");
						$.ajax({
						    type:  "post",
						    data: member_id,
						    dataType: "text",
						    url : "${contextPath}/member/email/certification",
						    processData : false,
							contentType: "application/text;charset=UTF-8",
						    beforeSend : function(xhr) {
						        xhr.setRequestHeader(csrf_headername, csrf_token);
						    },
						    success : function(data) {
						    	confirm_number = data;
						    	console.log("인증번호는요 : " + confirm_number);  <%-- 인증번호 --%>
						    }, 
						    error : function(request, error) {
						        alert("에러");
						        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
						    }
						});
					}
				},
				error : function(request, error) {                                     
			        alert("에러"); 
			        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			    },
			});
		}
	});
	
	<%-- 인증번호 확인 blur 처리 --%>
	$("#confirm_member_id").on("blur",function(e){
		e.preventDefault();
		var confirm_member_id = $("#confirm_member_id").val();
		
		if(confirm_member_id == "") {
			$("#span-confirm-member-id").html("인증번호를 입력해주세요.");
			$("#confirm_member_id").addClass("is-invalid")
			
		} else {
			$("#span-confirm-member-id").html("　");
			$("#confirm_member_id").removeClass("is-invalid")
		}
		
	})
	
	
	<%-- 인증번호 확인 --%>
	$("#btn-confirm").on("click",function(e){
		e.preventDefault();
		
		var confirm_member_id = $("#confirm_member_id").val();
		
		if(confirm_member_id == "") {
			$("#span-confirm-member-id").html("인증번호를 입력해주세요.");
			$("#confirm_member_id").addClass("is-invalid")
			
		} else if(confirm_member_id != confirm_number) {
			$("#span-confirm-member-id").html("인증번호가 일치하지 않습니다.");
			$("#confirm_member_id").addClass("is-invalid");
			
		} else if (confirm_member_id == confirm_number) {
			fnModal("인증이 완료되었습니다.");
			$("#div-confirm-member-id").hide();
			$("#member_id").addClass("is-valid");
			$("#btn-send").addClass("pe-none");
		}
		
	})
	
	
	<%-- 비밀번호 유효성 blur처리 --%>
	$("#member_password").on("blur",function(){
		var member_password = $("#member_password").val();
		var confirm_member_password = $("#confirm_member_password").val();
		
		if(member_password == "") {
			$("#span-member-password").html("비밀번호를 입력해주세요.");
			$("#member_password").addClass("is-invalid");
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
		
		
		if(confirm_member_password != ""){
			if(member_password != confirm_member_password) {
				$("#span-confirm-member-password").html("비밀번호가 일치하지 않습니다.");
				$("#confirm_member_password").addClass("is-invalid");
			}
		}
	})
	
	<%-- 비밀번호확인 유효성 blur처리 --%>
	$("#confirm_member_password").on("blur",function(){
		var member_password = $("#member_password").val();
		var confirm_member_password = $("#confirm_member_password").val();
		
		if(confirm_member_password == "") {
			$("#span-confirm-member-password").html("비밀번호를 입력해주세요.");
			$("#confirm_member_password").addClass("is-invalid");
		} else if (member_password != confirm_member_password){
			$("#span-confirm-member-password").html("비밀번호가 일치하지 않습니다.");
			$("#confirm_member_password").addClass("is-invalid");
		} else if (member_password == confirm_member_password){
			$("#span-confirm-member-password").html("　");
			$("#confirm_member_password").removeClass("is-invalid");
			$("#confirm_member_password").addClass("is-valid");
		} 
		
		
		if(confirm_member_password != ""){
			if(member_password != confirm_member_password) {
				$("#span-confirm-member-password").html("비밀번호가 일치하지 않습니다.");
				$("#confirm_member_password").addClass("is-invalid");
			}
		}
	})
	
	<%-- 이름 유효성 blur 처리--%>
	$("#member_name").on("blur",function(){
		var member_name = $("#member_name").val();
		
		if(member_name == "") {
			$("#span-member-name").html("이름을 입력해주세요.");
			$("#member_name").addClass("is-invalid");
		} else if (reg_blank.test(member_name)){
			$("#span-member-name").html("공백이 존재합니다.");
			$("#member_name").addClass("is-invalid");
		} else if (!reg_kor.test(member_name)){
			$("#span-member-name").html("문자형식의 한글을 입력해주세요.");
			$("#member_name").addClass("is-invalid");
		} else if (!reg_name.test(member_name)){
			$("#span-member-name").html("2~5자로 입력해주세요.");
			$("#member_name").addClass("is-invalid");
		} else if (reg_name.test(member_name)){
			$("#span-member-name").html("　");
			$("#member_name").removeClass("is-invalid");
			$("#member_name").addClass("is-valid");
		} 
	});
	
	<%-- 닉네임 유효성 blur 처리--%>
	$("#member_nickname").on("blur",function(){
		var member_nickname = $("#member_nickname").val();
		var form = {member_nickname : member_nickname}
		if(member_nickname == "") {
			$("#span-member-nickname").html("닉네임을 입력해주세요.");
			$("#member_nickname").addClass("is-invalid");
		} else if (reg_blank.test(member_nickname)){
			$("#span-member-nickname").html("공백이 존재합니다.");
			$("#member_nickname").addClass("is-invalid");
		} else if (!reg_kor.test(member_nickname)){
			$("#span-member-nickname").html("문자형식의 한글을 입력해주세요.");
			$("#member_nickname").addClass("is-invalid");
		} else if (!reg_name.test(member_nickname)){
			$("#span-member-nickname").html("2~5자로 입력해주세요.");
			$("#member_nickname").addClass("is-invalid");
		} else if (reg_name.test(member_nickname)){
			
			$.ajax({
				type : "post",
				data : JSON.stringify(form),
				dataType : "text",
				url : "${contextPath}/member/duplicateCheck",
				processData : true,                                                      
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(data) {
					if(data != "") {
						$("#span-member-nickname").html("존재하는 닉네임입니다.");
						$("#member_nickname").removeClass("is-valid");
						$("#member_nickname").addClass("is-invalid");
					} else {
						$("#span-member-nickname").html("　");
						$("#member_nickname").removeClass("is-invalid");
						$("#member_nickname").addClass("is-valid");
					}
				},
				error : function(request, error) {                                     
			        alert("에러"); 
			        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			    },
			});
		} 
	});
	
	
	<%-- 회원가입 진행 처리 유효성 검사 --%>
	$("#btn-login").on("click",function(e){
		e.preventDefault();
		member_id = $("#member_id").val();
		confirm_member_id = $("#confirm_member_id").val();
		member_password = $("#member_password").val();
		confirm_member_password = $("#confirm_member_password").val();
		member_name = $("#member_name").val();
		member_nickname = $("#member_nickname").val();
		check1 = $("#check1").is(":checked");
		check2 = $("#check2").is(":checked");
		var form = {member_nickname : member_nickname}
		
		if(member_id == "") {
			fnModal("이메일을 입력해주세요.");
			$("#member_id").focus();
			return false;
		} else if(reg_blank.test(member_id) || !reg_email.test(member_id)){
			fnModal("이메일을 확인해주세요.");
			$("#member_id").focus();
			return false;
		} else if(confirm_member_id == "" || confirm_member_id != confirm_number) {
			fnModal("이메일을 인증해주세요.");
			return false;
		} else if(member_password == ""){
			fnModal("비밀번호를 입력해주세요.");
			$("#member_password").focus();
			return false;
		} else if(reg_blank.test(member_password) || !reg_password.test(member_password) || reg_sc.test(member_password)){
			fnModal("비밀번호를 확인해주세요.");
			$("#member_password").focus();
			return false;
		} else if(confirm_member_password == ""){
			fnModal("비밀번호 확인을 입력해주세요");
			$("#confirm_member_password").focus();
			return false;
		} else if(member_password != confirm_member_password){
			fnModal("비밀번호가 일치하지 않습니다.");
			$("#confirm_member_password").focus();
			return false;
		} else if(member_name == ""){
			fnModal("이름을 입력해주세요.");
			$("#member_name").focus();
			return false;
		} else if(!reg_name.test(member_name)){
			fnModal("이름을 확인해주세요.");
			$("#member_name").focus();
			return false;
		} else if(member_nickname == ""){
			fnModal("닉네임을 입력해주세요.");
			$("#member_nickname").focus();
			return false;
		} else if(!reg_name.test(member_nickname)){
			fnModal("닉네임을 확인해주세요.");
			$("#member_nickname").focus();
			return false;
		} else if(!check1) {
			fnModal("필수 약관에 동의해주세요.");
			return false;
		} else if(!check2) {
			fnModal("개인정보 수집에 동의해주세요.");
			return false;
		} else if(reg_name.test(member_nickname)){
			$.ajax({
				type : "post",
				data : JSON.stringify(form),
				dataType : "text",
				url : "${contextPath}/member/duplicateCheck",
				processData : true,                                                      
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(data) {
					if(data != "") {
						fnModal("닉네임을 확인해주세요.");
						$("#member_nickname").focus();
					} else {
						$("#form-join").submit();
					}
				},
				error : function(request, error) {                                     
			        alert("에러"); 
			        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			    },
			});
		}
	});
	
	<%-- 이용약관 --%>
	$("#link-check1").on("click", function(e){
		e.preventDefault();
		
		str = "";
		str += "<div>";
        str += "제1조(목적)";
        str += "<br>";
        str += "<br>이 약관은 ㈜고고(gogo, 고고, 이하 '회사'라 한다)가 운영하는 서비스('gogo.co.kr, gogo app', 이하 '서비스'라 한다)를 이용함에 있어 회사와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다. <br>※「PC통신, 스마트폰(안드로이드폰, 아이폰 등) 앱, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용됩니다.」";
        str += "<br>";
        str += "<br>제2조(정의)";
        str += "<br>";
        str += "<br>“서비스” 란 - <br>“이용자”란 “서비스”에 접속하여 이 약관에 따라 “회사”가 제공하는 '서비스'를 받는 회원 및 비회원을 말합니다. <br>“회원“이라 함은 “서비스”에 회원등록을 한 자로서, 계속적으로 “회사”가 제공하는 '서비스'를 이용할 수 있는 자를 말합니다. <br>“비회원“이라 함은 회원에 가입하지 않고 “회사”가 제공하는 '서비스'를 이용하는 자를 말합니다.";
        str += "<br>";
        str += "<br>◎ “회사“가 운영하는 서비스(2021년 7월 현재)는 다음과 같습니다. <br>○ gogo.co.kr <br>○ gogo app <br>○ 서비스는 여가 문화가 변하고 기술이 발전함에 따라 지속적으로 함께 변화∙성장해 나갑니다.";
        str += "<br>";
        str += "<br>제3조 (약관 등의 명시와 설명 및 개정) <br>① “회사“는 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 연락처, 전자우편주소, 사업자등록번호, 통신판매업 신고 번호, 개인정보보호책임자등을 “이용자“가 쉽게 알 수 있도록 고고 '서비스'의 초기 '서비스'화면(전면)에 게시합니다. 다만, 약관의 내용은 “이용자“가 연결화면을 통하여 볼";
        str += "수 있도록 할 수 있습니다. <br>'서비스'는 “이용자“가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 예약 취소, 환불 조건 등과 같은 중요한 내용을 “이용자“가 이해할 수 있도록 별도의 연결 화면 또는 팝업 화면 등을 제공하여 “이용자“의 확인을 구하여야 합니다. <br>② “회사“는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및";
        str += "전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. <br>“회사“는 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 '서비스'의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.";
        str += "다만, “이용자“에게 불리하게 약관 내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 회사는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 “이용자“가 알기 쉽도록 표시합니다. <br>③ “회사“는 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로";
        str += "적용됩니다. 다만 이미 계약을 체결한 “이용자“가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “회사“에 송신하여 “회사“의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. <br>④ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래";
        str += "등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.";
        str += "<br>";
        str += "<br>제4조('서비스'의 제공 및 변경) <br>";
        str += "① “회사“는 다음과 같은 업무를 수행합니다. <br>가. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결 <br>나. 구매계약이 체결된 재화 또는 용역의 배송(바우처발송) <br>다. 기타 “회사“가 정하는 업무 <br>② “회사“는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는";
        str += "용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다. “회사“는 제공하기로 “이용자“와 계약을 체결한 '서비스'의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 “이용자“에게 통지 가능한 주소로 즉시 통지합니다. <br>③ “이용자”는 전항의 안내∙소개 등을 충분히 숙지하고 서비스를 이용하여야 합니다. 회사는";
        str += "통신판매중개자로서 통신판매의 당사자가 아니고, 판매자가 상품등 이용에 관한 이용정책이나 예약에 관한 취소∙환불정책을 별도로 운영하는 경우가 있을 수 있으므로, “이용자”는 상품등 이용 또는 예약시 반드시 그 내용을 확인해야 합니다. “이용자”가 이 내용을 제대로 숙지하지 못해 발생한 피해에 대해서는 회사가 책임을 부담하지 않습니다.";
        str += "<br>";
        str += "<br>제5조('서비스'의 변경 및 중단) <br>① “회사“는 회원 감소 등으로 인한 원활한 서비스 제공의 곤란 및 수익성 악화, 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 '서비스'의 제공을 변경 또는 중단할 수 있습니다. <br>② '회사'는 제1항에 따른 서비스의 변경, 중단으로 발생하는 문제에 대해서 어떠한 책임도 지지 않습니다.";
        str += "<br>";
        str += "<br>제6조 (정보 제공 및 광고의 게재) <br>① “이용자”는 서비스 이용 시 서비스 화면 상 노출되는 광고 게재에 대해 동의합니다. <br>② “이용자”가 서비스상에 게재되어 있는 광고를 이용하거나 서비스를 통한 광고주의 판촉활동에 다른 상품 등을 이용하는 경우, 이는 전적으로 “이용자”와 광고주 간의 법률관계이므로, 그로 인해 발생한 “이용자”와 광고주간 분쟁 등 제반 문제는 “이용자”과 광고주간에";
        str += "직접 해결하여야 하며, 이와 관련하여 '회사'는 어떠한 책임도 지지 않습니다. <br>④ '회사'는 “이용자” 로부터 수집한 개인정보를 통해 “이용자”의 서비스 이용 중 필요하다고 판단되는 다양한 마케팅 정보를 SMS(LMS), 스마트폰 알림 (Push 알림), E-mail 등을 활용하여 발송할 수 있으며, “이용자”는 이에 동의합니다. 다만, “이용자”는 거래관련정보 및 고객문의 등에 대한 답변을 제외하고 관련법에 따라";
        str += "언제든지 마케팅 수신 동의를 철회하실 수 있으며, 이 경우 회사는 전단의 마케팅 정보 등을 제공하는 행위를 중단합니다(단, 시스템 반영에 시차가 있을 수 있음).";
        str += "<br>";
        str += "<br>";
        str += "제7조(회원가입) <br>① “이용자“는 “회사“가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다. <br>② “회사“는 제1항과 같이 '회원'으로 가입할 것을 신청한 “이용자“ 중 다음 각 호에 해당하지 않는 한 '회원'으로 등록합니다. <br>가. 가입신청자가 이 약관 제7조 제3항에 의하여 이전에 '회원'자격을 상실한 적이 있는 경우, 다만 제7조";
        str += "제3항에 의한 '회원'자격 상실 후 3년이 경과한 자로서 “회사“는 '회원' 재가입 승낙을 얻은 경우에는 예외로 한다. <br>";
        str += "나. 등록 내용에 허위, 기재 누락, 오기가 있는 경우 <br>다. 기타 회원으로 등록하는 것이 “회사“는 기술상 현저히 지장이 있다고 판단되는 경우 <br>③ 회원가입 계약의 성립 시기는 “회사“의 승낙이 '회원'에게 도달한 시점으로 합니다. <br>④ '회원'은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “회사“는 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.";
        str += "<br>";
        str += "<br>제8조(회원 탈퇴 및 자격 상실 등) <br>";
        str += "① '회원'은 “회사“에 언제든지 탈퇴를 요청할 수 있으며 “회사“는 즉시 회원탈퇴를 처리합니다. <br>② '회원'이 다음 각 호의 사유에 해당하는 경우, “회사“는 회원자격을 제한 및 정지시킬 수 있습니다. <br>가. 가입 신청 시에 허위 내용을 등록한 경우 <br>";
        str += "나. “회사“를 이용하여 구입한 재화 등의 대금, 기타 “회사“는 이용에 관련하여 '회원'이 부담하는 채무를 기일에 지급하지 않는 경우 <br>다. 다른 '회원'의 '서비스' 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우 <br>라. '서비스'를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 <br>③ “회사“는 회원자격을 제한, 정지시킨 후, 동일한";
        str += "행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “회사“는 “이용자“의 회원자격을 상실시킬 수 있습니다. <br>④ “회사“는 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 '회원'에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.";
        str += "<br>";
        str += "<br>제9조('이용자'에 대한 통지) <br>① “회사“는 '이용자'에 대한 통지를 하는 경우, '이용자'와 '회사'와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다. <br>② “회사“는 불특정다수 '이용자'에 대한 통지의 경우 1주일이상 “회사“는 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, '이용자' 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.";
        str += "<br>";
        str += "<br>제10조 이용권(Voucher)의 전송 <br>① “회사“는 “이용자“가 구매한 이용권(Voucher)의 상세 내용을 SMS 또는 전자우편 등의 방식을 통해 발송합니다. <br>② 이용권을 받은 “이용자“는 의사표시의 불일치 등이 있는 경우에는 이용권을 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “회사“는 발송전에 “이용자“의 요청이 있는 경우에는 그 요청에 따라 처리하여야 합니다.";
        str += "<br>";
        str += "<br>제11조 이용권(Voucher)의 및 티켓의 사용 <br>① “회사'는 '이용자'가 구매한 상품에 대한 이용방법, 이용기간 등을 명시합니다. <br>② “회사'와 '이용자' 간에 상품의 인도 시기에 관하여 별도의 약정이 있는 경우에는 이 약관에 우선합니다.";
        str += "<br>";
        str += "<br>제12조(환급) <br>“회사“는 “이용자“가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 그 사유를 “이용자“에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 환급하거나 환급에 필요한 조치를 취합니다.";
        str += "<br>";
        str += "<br>";
        str += "제13조(청약철회 등) <br>① '회사'의 구매취소 및 청약철회 규정은 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령을 준수합니다. <br>② '이용자'의 단순 변심에 의한 취소 및 환불일 경우 이의 처리에 발생하는 수수료는 '이용자'가 부담합니다. <br>③ '이용자'는 '상품 등'의 내용이 표시∙광고 내용과 다르거나 계약 내용과 다르게 이행된 때에는 그 '상품 등'을 공급받은 날부터 그 사실을 안";
        str += "날 또는 알 수 있었던 날부터 30일 이내에 청약을 철회 할 수 있습니다. <br>④ 신용카드로 결제한 '이용자'의 경우 구매 취소 시 기존에 결제하였던 내역을 취소하며 취소 시점에 따라 예매 취소 수수료를 재승인 합니다. 이 경우 구매 취소 시점과 해당 카드사의 환불 처리기준에 따라 취소 금액의 환급 방법과 환급일은 다소 차이가 있을 수 있으며, 사용한 신용카드의 환불 정책은 신용카드회사에 직접";
        str += "문의하여야 합니다. <br>가. 미성년자 또는 미성년자의 법정대리인은 미성년자의 구매를 취소할 수 있으며 구체적인 내용은 민법 상 미성년자의 법률행위 취소 규정에 따릅니다. <br>나. '이용자'가 타인의 신용카드 또는 휴대전화번호를 도용하는 등 본 약관에서 금지하는 부정한 방법으로 부당한 이익을 편취하였다고 의심되는 경우 '회사'는 '이용자'의 티켓 구매를 취소처리 하거나 티켓의 사용을 제한할";
        str += "수 있으며, '이용자'의 충분한 소명 자료를 제출할 때까지 환불을 보류할 수 있습니다. <br>다. 기타 이 약관 및 '사이트'의 이용안내에 규정되지 않은 취소 및 환불에 대한 사항에 대해서는 소비자 피해보상 규정에서 정한 바에 따릅니다.";
        str += "<br>";
        str += "<br>제14조 (공연상품 및 여행상품 등에서의 환불 특칙) <br>① 공연(전시, 체험 입장권 포함)상품 및 여행상품(숙박상품 포함)의 경우 예약 및 그에 따른 공연 및 여행서비스 준비 등의 특수한 사정이 있는 관계로 별도의 특별약관이 우선하여 적용되며, 개별판매 조건에 명시된 유효기간 및 조건에 한하여 서비스가 제공되고 이는 별도의 취소/환불 규정을 따릅니다. '이용자'은 '사이트'에 명시된 내용 및";
        str += "개별 주의사항(사용정보 등)을 확인하여야 할 책임이 있습니다. <br>② '이용자'는 공연, 전시, 체험 입장권을 타인에게 양도하거나 담보로 제공할 수 없으며(단, “회사”가 승인한 경우 예외로 함), 필요 시 본인확인절차를 통해 구매자와 사용자의 일치 여부 등을 확인 할 수 있습니다. 또한, '이용자'가 이를 위반하여 '회사'의 제휴업체 또는 제휴업체가 지정한 장소에서 서비스를 제공받지 못하는 등의";
        str += "손해에 대하여 '회사'에게 이의를 제기할 수 없습니다. <br>③ '이용자'의 공연 및 전시, 체험 입장권의 구매 처리가 완료되었음을 안내하는 등 특정 서비스 이용권의 매매를 증명하기 위하여 발송된 이메일, 문자메시지 등을 소지하는 것만으로 본인 확인절차를 갈음할 수 없습니다. <br>④ “회사”는 판매 및 판매된 티켓의 취소가능기한을 개별적인 상품 또는 용역에 따라 달리 정할 수 있습니다. 즉, 판매 및";
        str += "판매된 티켓의 취소가능기한은 제휴업체 및 전시장, 공연장 사정에 의해 변경될 수 있으며, “이용자”은 개별판매 조건에 명시된 티켓의 취소가능기한까지 취소 절차를 취하지 않은 경우에는 “회사“의 “서비스”상에서 취소나 환불을 할 수 없습니다.";
        str += "<br>";
        str += "<br>제15조(개인정보보호) <br>① “회사“는 “이용자“의 개인정보 수집 시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. <br>";
        str += "② “회사“는 회원가입 시 구매계약 이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다. <br>③ “회사“는 “이용자“의 개인정보를 수집 이용하는 때에는 당해 “이용자“에게 그 목적을 고지하고 동의를 받습니다. <br>④ “회사“는 수집된 개인정보를 목적 외의";
        str += "용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용 제공단계에서 당해 “이용자“에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다. <br>⑤ “회사“는 제2항과 제3항에 의해 “이용자“의 동의를 받아야 하는 경우에는 개인정보보호 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및";
        str += "이용목적, 제3자에 대한 정보제공 관련사항(제공받은 자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 “이용자“는 언제든지 이 동의를 철회할 수 있습니다. <br>⑥ “이용자“는 언제든지 “회사“가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “회사“는 이에 대해 지체 없이";
        str += "필요한 조치를 취할 의무를 집니다. “이용자“가 오류의 정정을 요구한 경우에는 “회사“는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다. <br>⑦ “회사“는 개인정보 보호를 위하여 “이용자“의 개인정보를 처리하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 “이용자“의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 “이용자“의 손해에 대하여,";
        str += "고의 또는 중대한 과실이 있는 경우, 책임을 집니다. <br>⑧ “회사“는 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다. <br>⑨ “회사“는 개인정보의 수집, 이용 제공에 관한 동의 란을 미리 선택한 것으로 설정해 두지 않습니다. 또한 개인정보의 수집 이용 제공에 관한 “이용자“의 동의 거절 시 제한되는 서비스를";
        str += "구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집 이용 제공에 관한 “이용자“의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.";
        str += "<br>";
        str += "<br>제16조(“회사“의 의무) <br>";
        str += "① “회사“는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화 용역을 제공하는데 최선을 다하여야 합니다. <br>② “회사“는 “이용자“가 안전하게 인터넷 '서비스'를 이용할 수 있도록 “이용자“의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다. <br>③ “회사“는 상품이나 용역에 대하여 「표시 광고의 공정화에";
        str += "관한 법률」 제3조 소정의 부당한 표시 광고행위를 함으로써 “이용자“가 손해를 입은 때에는 이를 배상할 책임을 집니다.";
        str += "<br>";
        str += "<br>제17조('회원'의 ID 및 비밀번호에 대한 의무) <br>";
        str += "제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 '회원'에게 있습니다. <br>① “회원“은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다. <br>② “회원“이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “회사“에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.";
        str += "<br>";
        str += "<br>제18조(“이용자“의 의무) <br>“이용자“는 다음 행위를 하여서는 안 됩니다. <br>① 신청 또는 변경 시 허위 내용의 등록 <br>② 타인의 정보 도용 <br>③ “회사“에 게시된 정보의 변경 <br>④ “회사“가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시 <br>⑤ “회사“는 기타 제3자의 저작권 등 지적재산권에 대한 침해 <br>⑥ “회사“는 기타 제3자의 명예를 손상시키거나 업무를";
        str += "방해하는 행위 <br>⑦ 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 '서비스'에 공개 또는 게시하는 행위";
        str += "<br>";
        str += "<br>제19조 (게시물의 저작권 및 배타적 이용허락) <br>① '이용자'는 작성한 '이용후기(리뷰)'의 저작권은 이를 작성한 '회사' 에게 있으며, 해당 '이용후기'가 타인의 저작권을 침해하는 경우 그에 대한 책임은 '이용자' 본인이 부담합니다. <br>② “이용자'는 '회사'에게 자신이 작성한 '이용후기'을 독점적으로 이용할 수 있는 권리(license)를 부여합니다. 이에 따라 '회사'는 '이용자'가 작성한";
        str += "'이용후기'을 검색 노출, 판촉, 홍보 기타의 자료로 무상으로 영구적으로 이용할 수 있으며, 필요한 범위 내에서 '이용후기'의 일부를 수정, 복제, 편집할 수 있습니다.";
        str += "<br>";
        str += "<br>제20조(저작권의 귀속 및 이용제한) <br>① “회사“가 작성한 저작물에 대한 저작권 기타 지적재산권(특허권, 상표권, 기타 지식재산권)은 “회사“에 귀속합니다. <br>② “이용자“는 “회사“를 이용함으로써 얻은 정보 중 “회사“에게 지적재산권이 귀속된 정보를 “회사“의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.";
        str += "<br>";
        str += "<br>제21조(분쟁해결) <br>① “회사“는 “이용자“로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 “이용자“에게 그 사유와 처리일정을 즉시 통보해 드립니다. <br>② “회사“와 “이용자“ 간에 발생한 전자상거래 분쟁과 관련하여 “이용자“의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수";
        str += "있습니다.";
        str += "<br>";
        str += "<br>제22조 (면책사항) <br>① 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면책됩니다. <br>② 회사는 이용자의 귀책사유로 인한 서비스의 이용장애에 대하여 책임을 지지 않습니다. <br>③ 회사는 이용자가 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그 밖에 서비스를 통하여 얻은 자료로 인한";
        str += "손해 등에 대하여도 책임을 지지 않습니다. 회사는 이용자가 게재한 게시물(이용후기, 숙소평가 등 포함)의 정확성 등 내용에 대하여는 책임을 지지 않습니다. <br>④ 회사는 이용자 상호간 또는 이용자와 제3자 상호간에 서비스를 매개로 발생한 분쟁에 대해서는 개입할 의무가 없으며 이로 인한 손해를 배상할 책임도 없습니다. <br>⑤ 상품 등은 판매자의 책임 하에 관리∙운영되고, 회사는";
        str += "통신판매중개자로서 서비스 운영 상의 문제를 제외한 상품등의 하자∙부실 등으로 인한 책임은 판매자에게 귀속되며 회사는 어떠한 책임도 부담하지 않습니다. <br>⑥ 회사는 제3자가 서비스 내 화면 또는 링크된 웹사이트를 통하여 광고한 제품 또는 서비스의 내용과 품질에 대하여 감시할 의무가 없으며 그로 인한 어떠한 책임도 지지 아니합니다. <br>⑦ 회사는 회사 및 회사의 임직원 그리고 회사 대리인의";
        str += "고의 또는 중대한 과실이 없는 한 다음 각 호의 사항으로부터 발생하는 손해에 대해 책임을 지지 아니합니다. <br>(1) 이용자정보 등의 허위 또는 부정확성에 기인하는 손해 <br>(2) 서비스에 대한 접속 및 서비스의 이용과정에서 발생하는 개인적인 손해 <br>(3) 서버에 대한 제3자의 모든 불법적인 접속 또는 서버의 불법적인 이용으로부터 발생하는 손해 <br>(4) 서버에 대한 전송 또는 서버로부터의";
        str += "전송에 대한 제3자의 모든 불법적인 방해 또는 중단행위로부터 발생하는 손해 <br>(5) 제3자가 서비스를 이용하여 불법적으로 전송, 유포하거나 또는 전송, 유포되도록 한 모든 바이러스, 스파이웨어 및 기타 악성 프로그램으로 인한 손해 <br>(6) 전송된 데이터의 오류 및 생략, 누락, 파괴 등으로 발생되는 손해 <br>";
        str += "(7) 이용자 간의 이용자 상태정보 등록 및 서비스 이용 과정에서 발생하는 명예훼손 기타 불법행위로 인한 각종 민∙형사상 책임";
        str += "<br>";
        str += "<br>제22조(재판권 및 준거법) <br>본 약관과 회사와 회원간에 발생한 분쟁 등에 관하여는 대한민국 법령이 적용되며, 회사의 주소지를 관할하는 법원을 관할법원으로 합니다.";
        str += "<br>";
        str += "<br>부 칙(시행일) 이 약관은 2021년 7월 1일부터 시행합니다.";
        str += "<br>";
    	str += "</div>";
		
		$(".modal-check-title").html("이용약관");
		$(".modal-check-content").html(str);
		$(".modal-check").modal("show");
		
	});
	
	<%-- 개인정보처리방침 --%>
	$("#link-check2").on("click", function(e){
		e.preventDefault();
		
		
		str = "";
 		str += "<div>";
        str += "<br>";
        str += "㈜ 고고 (' gogo, 고고, gogo.co.kr, gogo app' 이하 '회사')은(는) 개인정보보호법에 따라 이용자의 개인정보보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.";
        str += "<br>";
        str += "<br>'회사'는 개인정보 처리 방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.";
        str += "<br>";
        str += "<br>";
        str += "<br>1. 개인정보의 처리 목적 <br>'회사'는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.";
        str += "<br>";
        str += "<br>① 홈페이지 회원가입 및 관리 <br>회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 각종 고지·통지, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.";
        str += "<br>";
        str += "<br>② 서비스 예약 또는 서비스의 이용 <br>서비스 제공, 바우처 및 이용권 발송, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증, 요금결제·정산 등을 목적으로 개인정보를 처리합니다. <br>귀하가 '회사'의 서비스를 예약하거나, 본 서비스를 이용하는 때에는, 당사는 소정의 정보를 수집하고 처리할 수 있습니다. 이러한 정보에는 아래에 기재된 정보도 포함됩니다. 귀하와 당사 간에, 그리고 귀하와 서비스";
        str += "사업자 간에 주고 받은 교신 내용의 사본(이메일에 의한 것이든, 문자메세지, SNS메시지에 의한 것이든, 여타 방식에 의한 것이든 불문함) <br>귀하의 결제에 대한 안전을 위해서, 그리고 귀하의 신용카드 정보가 오용되지 않도록 하기 위해서, '회사'는 귀하의 신용카드 내역과 정부 발급 여권 또는 신분증(ID)의 사본을 요구하기도 하며, 이는 결제가 완료된 이후에 귀하의 구매를 확인하기 위한 것입니다.";
        str += "개인정보 보호로 인해, 귀하의 ID 번호와 귀하의 신용카드 번호(마지막 4자리는 제외)를 가리도록 귀하에게 요구할 것 입니다.";
        str += "<br>";
        str += "<br>③ 마케팅 및 광고에의 활용 <br>신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.";
        str += "<br>";
        str += "<br>";
        str += "<br>2. 개인정보 파일 현황";
        str += "<br>";
        str += "<br>① 개인정보 파일명 : 고고 개인정보처리방침 <br>- 개인정보 항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 성별, 생년월일, 이름, 신용카드정보, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록 <br>- 수집방법 : 홈페이지, APP, 경품행사, 기타 제휴사로부터 제공 받음";
        str += "<br>";
        str += "<br>";
        str += "<br>3. 개인정보의 처리 및 보유 기간";
        str += "<br>";
        str += "<br>① '회사'는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보를 처리, 보유합니다. <br>② 개인정보, 그리고 당사가 귀하에게서 수집하는 그 밖의 데이터는 당사의 서버 또는 당사의 제3의 서비스 제공업자에게 전송되어 그곳에서 처리되고 그곳에 보관될 수 있습니다. 귀하의 개인정보는 본 개인정보 취급방침에 기재된 목적들 중 어느 것이든 이행하기";
        str += "위해서, 또는 계약상의 의무나 법규상의 의무를 준수하기 위해서 필요한 한 계속 보관될 것 입니다.";
        str += "<br>";
        str += "<br>";
        str += "'회사'는 귀하의 개인정보와 그 밖의 데이터가 안전하게, 그리고 본 개인정보 취급방침에 따르도록 하는 적절한 물리적, 전자적, 체계적 절차를 유지하기 위해서, 그리고 그 데이터에 대한 무단 접속을 차단하거나, 그 데이터가 무단으로 변경, 공개 또는 폐기되지 않도록 하기 위해서, 노력할 것 입니다.";
        str += "<br>";
        str += "<br>";
        str += "<br>4. 개인정보의 제3자 제공에 관한 사항";
        str += "<br>";
        str += "<br>";
        str += "① '회사'는 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 위반되지 않는 범위에서 개인정보를 제3자에게 제공합니다. <br>② '회사'는 본 웹사이트를 통해서 수집되거나 본 서비스를 구매할 때에 수집된 개인정보와 그 밖의 데이터를, 귀하의 사용자 계정을 개설하고, 귀하에게 본 서비스를 제공하며, 본 웹사이트와 본 서비스를 지속적으로 개선하고 본 서비스와 관련하여";
        str += "귀하에게 연락을 하는 데 사용할 것 입니다. 본 웹사이트와 본 서비스를 개선한다는 말은, 구매요청을 더 신속하게 처리하고, 고객지원 서비스를 좀 더 강화하며, 신규 서비스 등을 시의적절하게 귀하에게 통지할 수 있도록 하는 데 귀하의 개인정보와 위와 같은 여타의 데이터를 당사가 사용한다는 것을 의미합니다.";
        str += "<br>";
        str += "<br>수시로, 당사는 본 웹사이트를 귀하가 이용하는 것에 대한 피드백을 위해 귀하에게 연락하거나, 본 웹사이트를 개선하는 데 당사가 도움을 받거나, 귀하에게 특별한 적립혜택이나 홍보물을 제공하기 위해서도(동의한다고 명시한 경우에 한함) 당사는 귀하의 개인정보를 사용할 수 있습니다. 귀하가 특별 적립 또는 홍보물에 대한 통지를 받고 싶지 않다면, 그러한 통지문에 함께 제공된 하이퍼링크를 통해";
        str += "당사에게 회신을 주는 방식으로 귀하는 그 통지문의 수신을 간단히 거부할 수 있습니다.";
        str += "<br>";
        str += "<br>수집된 개인정보는, 귀하와의 계약을 이행하기 위해 필요한 한도 내에서만 처리할 것입니다. 예컨대, 귀하가 본 웹사이트를 통해 본 서비스를 구매하는 경우가 그에 해당합니다. 그 외에는, 당사는 당사의 정당한 이익에 근거하여서만 수집된 여타의 개인정보를 처리하는데, 본 서비스를 좀더 개선하고 직접적인 마케팅을 목적으로 하는 것들이 그에 해당합니다.";
        str += "<br>";
        str += "<br>";
        str += "<br>5. 개인정보처리 위탁";
        str += "<br>";
        str += "<br>① '회사'는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리 업무를 위탁하고 있습니다. <br>② '회사'는 위탁계약 체결 시 개인정보 보호법 제25조에 따라 위탁업무 수행 목적 외 개인정보 처리 금지, 기술적․관리적 보호조치, 재 위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고";
        str += "있습니다. <br>③ 위탁 업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.";
        str += "<br>";
        str += "<br>";
        str += "<br>6. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.";
        str += "<br>";
        str += "<br>① 정보주체는 '회사'에 대해 언제든지 개인정보 열람, 정정, 삭제, 처리정지 요구 등의 권리를 행사할 수 있습니다. <br>② 제1항에 따른 권리 행사는 '회사'에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 '회사' 이에 대해 지체 없이 조치하도록 노력하겠습니다. <br>③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을";
        str += "받은 자 등 대리인을 통하여 하실 수 있습니다. <br>이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다. <br>④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다. <br>⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를";
        str += "요구할 수 없습니다. <br>⑥ '회사'는 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인 인지를 확인합니다.";
        str += "<br>";
        str += "<br>";
        str += "<br>7. 처리하는 개인정보의 항목 작성";
        str += "<br>";
        str += "<br>① '회사'는 다음의 개인정보 항목을 처리하고 있습니다. <br>수집, 이용목적 : 회원가입 및 고객관리 <br>수집, 이용항목 : 이메일, 휴대전화번호, 비밀번호, 로그인ID, 성별, 생년월일, 이름, 신용카드정보, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록 등 회원가입 및 고객관리에 필요한 정보";
        str += "<br>";
        str += "<br>";
        str += "<br>8. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항";
        str += "<br>";
        str += "<br>① 쿠키(cookie)는 웹사이트가 이용자의 브라우저(인터넷 익스플로러, 크롬, 파이어폭스, 기타 모바일 브라우저)로 전송하는 소량의 정보입니다. '회사'는 개별적인 맞춤서비스를 제공하기 위해 이용자에 대한 정보를 저장하고 수시로 찾아내는 ‘쿠키(cookie)’를 사용합니다. <br>② 쿠키는 이용자의 컴퓨터 또는 모바일 기기는 식별하지만 이용자을 개인적으로 식별하지는 않습니다. 또한 이용자는 쿠키에";
        str += "대한 선택권이 있습니다. 웹브라우저 상단의 도구 &gt; 인터넷옵션 탭(option tab)에서 모든 쿠키를 다 받아들이거나, 쿠키가 설치될 때 통지를 보내도록 하거나, 아니면 모든 쿠키를 거부할 수 있는 선택권을 가질 수 있습니다. 모바일 기기의 경우에도 ‘설정’ 메뉴나 또는 각 모바일 브라우저의 설정 메뉴에서 쿠키에 대한 선택을 제어할 수 있습니다. 다만, 쿠키를 거부할 경우 로그인이 필요한 서비스 이용에";
        str += "일부 제약이 있을 수 있습니다.";
        str += "<br>";
        str += "<br>";
        str += "<br>9. 개인정보 보호책임자 작성";
        str += "<br>";
        str += "<br>① '회사'는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.";
        str += "<br>";
        str += "<br>▶ 개인정보 보호책임자 <br>성명 : 기대근 <br>직책 : CTO <br>직급 : CTO <br>연락처 : contact@gogo.co.kr <br>※ 개인정보 보호 담당부서로 연결됩니다.";
        str += "<br>";
        str += "<br>▶ 개인정보 보호 담당부서 <br>부서명 : 개발팀 <br>담당자 : 기대근 <br>연락처 : contact@gogo.co.kr";
        str += "<br>";
        str += "<br>② 정보주체께서는 '회사'의 서비스('gogo.co.kr, gogo app', 또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. '회사'는 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.";
        str += "<br>";
        str += "<br>";
        str += "<br>10. 개인정보 처리방침 변경";
        str += "<br>";
        str += "<br>① 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경 내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.";
        str += "<br>";
        str += "<br>";
        str += "<br>11. 개인정보의 안전성 확보 조치 <br>'회사'는 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.";
        str += "<br>";
        str += "<br>① 관리적 조치 <br>내부관리계획 수립 및 시행, 개인정보를 취급하는 직원에 대한 정기적 교육 등";
        str += "<br>";
        str += "<br>② 기술적 조치 <br>보안프로그램 설치, 개인정보의 암호화, 개인정보 접근 권한 관리 등";
        str += "<br>";
        str += "<br>⑤ 물리적 조치 <br>외부로부터의 무단 접근 통제";
        str += "<br>";
        str += "<br>";
        str += "<br>12. 개인정보 보호책임자 <br>'회사'는 이용자께서 좋은 정보를 안전하게 이용할 수 있도록 최선을 다하고 있습니다. 개인정보를 보호하는데 있어 이용자께 고지한 사항들에 반하는 사고가 발생할 시에 개인정보보호책임자가 모든 책임을 집니다. 그러나 기술적인 보완조치를 했음에도 불구하고, 해킹 등 기본적인 네트워크상의 위험성에 의해 발생하는 예기치 못한 사고로 인한 정보의 훼손 및 방문자가";
        str += "작성한 게시물에 의한 각종 분쟁에 관해서는 책임이 없습니다. <br>개인정보 보호 방침에 관하여 문의 사항이 있으시면, 이메일(contact@gogo.co.kr)로 당사에 연락 주시기 바랍니다.";
    	str += "</div>";
		
		
		
		
		
		$(".modal-check-title").html("개인정보처리방침");
		$(".modal-check-content").html(str);
		$(".modal-check").modal("show");
	});
	
	
	
	
	
	
	
	
	
});


</script>

</body>
</html>
