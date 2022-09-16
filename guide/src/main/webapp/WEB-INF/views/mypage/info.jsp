<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	
<%@ include file="../common/cssLink.jsp"%>
<body>
<%@ include file="../common/mainheader.jsp"%>
	

<%-- 바디 시작 --%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-0 p-sm-5">
						
						<h2 class="card-title text-center mb-5 fw-bold fs-2">
							${memberInfo.member_nickname}
							<br>
							<span class="fs-5">님의 프로필</span>
						</h2>
						
						<div class="border border-dark m-auto text-center mb-4 p-1"  style="width: 150px; height: 40px">
							<a href="${contextPath}/member/modify" class="text-dark text-decoration-none fs-5">프로필 수정</a>
						</div>
						
						<div style="text-align: center;">
							
							<div class="border border-dark me-2 p-1 fs-4" style="width: 130px; display: inline-block;">
								일정
								<br>
								<strong>0</strong>
							</div>
							<div class="border border-dark me-2 p-1 fs-4"  style="width: 130px; display: inline-block;">
								리뷰
								<br>
								<strong>0</strong>
							</div>
							<div class="border border-dark p-1 fs-4"   style="width: 130px; display: inline-block;">
								문의
								<br>
								<strong>0</strong>
							</div>
							
						</div>
						
						<div class="section-title-container mt-5">
                           <div class="float-start border-0" style="height: 25px; width: 10px; background-color: #98DDE3; margin-right: 10px"></div>
                           <h5 style="margin-bottom: 15px">
                           		<b>일정</b>
                           </h5>
                        </div>
                        <%-- 일정이 없는경우 --%>
                        <div class="text-center" style="width: 100%; height: 100px">
                        	<br><br>현재 등록된 일정 없습니다.
                        </div>
                        
                         <%-- 일정이 있는 경우 --%>
                         <%-- 삭제 스크립트 조작 data-tour 생각 --%>
						<div class="col-sm-12 col-md-12 col-lg-12 mx-auto border-0 p-4 pb-5 shadow rounded-3 my-4" id="00142">
							<div class="row">
							    <div class="col-md-4 mt-3">
							        <img class="" src="https://images.unsplash.com/photo-1601621915196-2621bfb0cd6e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072&q=80" alt="" style="width: 100%; height: 200px">
							    </div>
							    <div class="col-md-8 mt-3">
							   		<div class="float-start border-0" style="height: 25px; width: 2px; background-color: #98DDE3; margin-right: 10px"></div>
							    	<h5><strong>전라남도 목포시</strong> &nbsp;<span class="fs-6 text-secondary">Mokpo</span> </h5>
							    	<div class="my-3">여행 이름 : <input type="text"></div>
							    	<div class="my-3">여행 날짜 : 2022.02.28 ~ 2022.03.05</div>
							    	<div class="my-3">선택 장소 : 11</div>
							    	<button type="button" class="btn shadow rounded-3">일정 수정</button>
								    <button type="button" class="btn shadow rounded-3 text-dark" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">일정표</button>
								    <div class="dropdown-menu" style="">
								      <a class="dropdown-item" href="#">모바일 일정표</a>
								      <a class="dropdown-item" href="#">엑셀 일정표</a>
								    </div>
							    	<button type="button" class="btn shadow rounded-3">일정 공유</button>
									<%-- 삭제 스크립트 조작 data-tour 생각 클래스에 btn속성있음 --%>
							    	<button type="button" class="btn shadow rounded-3 btn-tour-delete" data-tour="00142">삭제</button>
							    </div>
							  </div>
						</div>
                        
                        <div class="section-title-container mt-5">
                           <div class="float-start border-0" style="height: 25px; width: 10px; background-color: #98DDE3; margin-right: 10px"></div>
                           <h5 style="margin-bottom: 15px">
                           	  <b>리뷰</b>
                           </h5>
                        </div>
						 
						 <%-- 리뷰가 없는경우 --%>
						 <div class="text-center" style="width: 100%; height: 100px">
                        	<br><br>현재 등록된 리뷰 없습니다.
                        </div>
                        
                        <%-- 리뷰가 있는 경우 --%>
						<div class="col-sm-12 col-md-12 col-lg-12 mx-auto border-0 p-4 pb-5 shadow rounded-3 my-4" id="3333">
							<div class="float-start border-0" style="height: 25px; width: 2px; background-color: #98DDE3; margin-right: 10px"></div>		
							<h5><strong>이올라니 궁전<%-- 관광명소 이름 --%></strong></h5>
							<br>
							아주 만족스러웠어요 <%-- 리뷰 내용 --%>
							<br>
							<br> 
							2022.02.27 <%-- 리뷰 등록일 --%>&nbsp;&nbsp;&nbsp; 좋아요 : 0  싫어요 : 0<%-- 좋아요 싫어요 갯수 --%>
							<br>
							<%-- 리뷰 삭제 기능 일정삭제와 동일 --%>
							<button type="button" class="btn shadow rounded-3 float-end btn-review-delete" data-review="3333">삭제</button>
							<button type="button" class="btn shadow rounded-3 float-end me-4" >수정</button>
						</div>
                        
                        <div class="section-title-container mt-5">
                           <div class="float-start border-0" style="height: 25px; width: 10px; background-color: #98DDE3; margin-right: 10px"></div>
                           <h5 style="margin-bottom: 15px">
                          	  <b>문의 내역</b>
                           </h5>
                        </div>
						 
						 <%-- 문의가 없는경우 --%>
						 <div class="text-center" style="width: 100%; height: 100px">
                        	<br><br>현재 등록된 문의 내역이 없습니다.
                        </div>
                        
                        <div class="col-sm-12 col-md-12 col-lg-12 mx-auto border-0 p-4 pb-5 shadow rounded-3 my-4">
							<div class="float-start border-0" style="height: 25px; width: 2px; background-color: #98DDE3; margin-right: 10px"></div>		
							<h5><strong>로그인 문의<%-- 관광명소 이름 --%></strong></h5>
							<br>
							로그인 왜 안되죠??? <%-- 리뷰 내용 --%>
							<br>
							<br> 
							<span class="badge rounded-pill bg-secondary">답변 대기중</span>
							<span class="badge rounded-pill bg-info text-dark">답변완료</span>
							<br>
							<span class="float-end me-4">바로가기</span>
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

$(document).ready(function(){
	
	<%-- 일정 삭제 기능 --%>
	
	$(".btn-tour-delete").on("click",function(e){
		e.preventDefault();
		
		
		var result = confirm("삭제하시겠습니까");
		
		<%-- ajax로 db값 지운후 아래 로직 실행하면됨 ( 화면에서 사라지는 로직 ) --%>
		
		<%-- 취소시 동작 x --%>
		if(!result) {
			return false;
		}
		
		var tour = $(".btn-tour-delete").data("tour");
		
		$("#" + tour).remove();
	});
	
	<%-- 리뷰 삭제 기능 --%>
	$(".btn-review-delete").on("click",function(e){
		e.preventDefault();
		
		var result = confirm("삭제하시겠습니까");

		<%-- ajax로 db값 지운후 아래 로직 실행하면됨 ( 화면에서 사라지는 로직 ) --%>
		
		<%-- 취소시 동작 x --%>
		if(!result) {
			return false;
		}
		
		var review = $(".btn-review-delete").data("review");
		$("#" + review).remove();
	});
	
	
	
	
	
	
});

</script>	
</body>
</html>
