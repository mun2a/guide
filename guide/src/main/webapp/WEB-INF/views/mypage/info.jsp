<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../common/cssLink.jsp"%>

<style>
	.modify_schedule_title {
	    width: 40px;
	    display: inline-flex;
	    justify-content: center;
	    align-items: center;
	    color: #999;
		margin: 0;
	    border: none;
	    border-radius: 0;
	    overflow: visible;
	    padding: 0;
	    background-color: transparent;
	    fill: currentcolor;
	    text-decoration: none;
	    cursor: pointer;
	    vertical-align: middle;
	}
	.schedule_title {
		width: 200px;
		background: 0 0;
	    border-color: transparent;
		height: 40px;
	    vertical-align: middle;
	    display: inline-block;
	    max-width: 100%;
	    padding: 0 10px;
	    color: #666;
	    border: 1px solid #e5e5e5;
	    overflow: visible;
	    box-sizing: border-box;
	    margin: 0;
	    border-radius: 0;
	}
	
	.span_qna_title {
		font-weight: bold;
	}
	.span_qna_regist_date {
		float: right;
		color: #858796;
	}
</style>
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
								<strong>${countSchedule }</strong>
							</div>
<!--
 							<div class="border border-dark me-2 p-1 fs-4"  style="width: 130px; display: inline-block;">
								리뷰
								<br>
								<strong>0</strong>
							</div>
 -->							
							<div class="border border-dark p-1 fs-4"   style="width: 130px; display: inline-block;">
								문의
								<br>
								<strong>${countQna }</strong>
							</div>
							
						</div>
						
						<div class="section-title-container mt-5">
                           <div class="float-start border-0" style="height: 25px; width: 10px; background-color: #98DDE3; margin-right: 10px"></div>
                           <h5 style="margin-bottom: 15px">
                           		<b>일정</b>
                           </h5>
                        </div>
                        <c:choose>
                        	<c:when test="${empty scheduleList }">
		                        <%-- 일정이 없는경우 --%>
		                        <div class="text-center" style="width: 100%; height: 100px">
		                        	<br><br>현재 등록된 일정 없습니다.
		                        </div>
                        	</c:when>
                        	<c:otherwise>
                        		<c:forEach items="${scheduleList }" var="scheduleDto" varStatus="status">
			                         <%-- 일정이 있는 경우 --%>
									<div class="col-sm-12 col-md-12 col-lg-12 mx-auto border-0 p-4 pb-5 shadow rounded-3 my-4" id="${scheduleDto.schedule_no }">
										<div class="row">
										    <div class="col-md-4 mt-3">
										        <img class="" src="${areaList[status.index].area_image }" alt="" style="width: 100%; height: 200px">
										    </div>
										    <div class="col-md-8 mt-3">
										   		<div class="float-start border-0" style="height: 25px; width: 2px; background-color: #98DDE3; margin-right: 10px"></div>
										    	
										    	<h5><strong>${areaList[status.index].area_name } ${areaList[status.index].area_detail_name }</strong> &nbsp;<span class="fs-6 text-secondary">${areaList[status.index].area_english_title }</span> </h5>
										    	<div class="my-3">여행 이름 : 
			                                        <input class="schedule_title ${scheduleDto.schedule_no }" type="text" placeholder="여행이름" value="${scheduleDto.schedule_title }">
			                                        <a class="modify_schedule_title " uk-icon="icon: file-edit" data-schedule_no = "${scheduleDto.schedule_no }">
				                                        <svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
					                                        <path fill="none" stroke="#000" d="M18.65,1.68 C18.41,1.45 18.109,1.33 17.81,1.33 C17.499,1.33 17.209,1.45 16.98,1.68 L8.92,9.76 L8,12.33 L10.55,11.41 L18.651,3.34 C19.12,2.87 19.12,2.15 18.65,1.68 L18.65,1.68 L18.65,1.68 Z"></path>
					                                        <polyline fill="none" stroke="#000" points="16.5 8.482 16.5 18.5 3.5 18.5 3.5 1.5 14.211 1.5"></polyline>
				                                        </svg>
			                                        </a>
										    	</div>
										    	<fmt:parseDate var="dateFmtStart" pattern="yyyy-MM-dd HH:mm:ss" value="${scheduleDto.schedule_start }"/>
												<fmt:formatDate var="schedule_start" pattern="yyyy.MM.dd" value="${dateFmtStart }"/>
										    	<fmt:parseDate var="dateFmtEnd" pattern="yyyy-MM-dd HH:mm:ss" value="${scheduleDto.schedule_end }"/>
												<fmt:formatDate var="schedule_end" pattern="yyyy.MM.dd" value="${dateFmtEnd }"/>
										    	<div class="my-3">여행 날짜 : ${schedule_start } ~ ${schedule_end }</div>
										    	
										    	<div class="my-3">선택 장소 : ${countScheduleDetailList[status.index]} 곳</div>
										    	<button type="button" class="btn shadow rounded-3">일정 수정</button>
											    <button type="button" class="btn shadow rounded-3 text-dark" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">일정표</button>
											    <div class="dropdown-menu" style="">
											      <a class="dropdown-item" href="#">모바일 일정표</a>
											      <a class="dropdown-item" href="#">엑셀 일정표</a>
											    </div>
										    	<button type="button" class="btn shadow rounded-3 btn-tour-delete" data-schedule_no = "${scheduleDto.schedule_no }">삭제</button>
										    </div>
										  </div>
									</div>
                        		</c:forEach>
                        	</c:otherwise>
                        </c:choose>
                        
<!-- 						 
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
 -->
                        <div class="section-title-container mt-5">
                           <div class="float-start border-0" style="height: 25px; width: 10px; background-color: #98DDE3; margin-right: 10px"></div>
                           <h5 style="margin-bottom: 15px">
                          	  <b>문의 내역</b>
                           </h5>
                        </div>
						<c:choose>
						<c:when test="${empty qnaList }">
						 <%-- 문의가 없는경우 --%>
							<div class="text-center" style="width: 100%; height: 100px">
	                        	<br><br>현재 등록된 문의 내역이 없습니다.
	                        </div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${qnaList }" var="qnaDto" >
		                        <div class="col-sm-12 col-md-12 col-lg-12 mx-auto border-0 p-4 shadow rounded-3 my-4">
									<div class="float-start border-0" style="height: 25px; width: 2px; background-color: #98DDE3; margin-right: 10px"></div>		
									<p>
										<span class="span_qna_title">
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
										</span>
										<span class="span_qna_regist_date">
											<fmt:formatDate var="qna_regist_date" pattern="yyyy-MM-dd HH:mm" value="${qnaDto.qna_regist_date}"/>
											${qna_regist_date}
										</span>
									</p>
									
									<br>
									<%-- 리뷰 내용 --%>
									${qnaDto.qna_content}
									<br>
									<br> 
									<c:choose>
										<c:when test="${qnaDto.qna_reply_exist == 'N'}">
											<span class="badge rounded-pill bg-secondary">답변 대기중</span>
										</c:when>
										<c:when test="${qnaDto.qna_reply_exist == 'Y'}">
											<span class="badge rounded-pill bg-info text-dark">답변완료</span>
										</c:when>
									</c:choose>
									<button type="button" class="btn shadow rounded-3 float-end me-4 btn-qna-detail" data-qna_no = "${qnaDto.qna_no }" >바로가기</button>
								</div>
							</c:forEach>
						</c:otherwise>
						</c:choose>						 
                        
					</div>
				</div>
			</div>
		</div>
	</div>
<%-- 바디 끝 --%>

<form id="actionForm" action="#" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
	
<%@ include file="../common/mainfooter.jsp"%>
<%@ include file="../common/jsLink.jsp"%>
<script type="text/javascript">

$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	
	//여행이름 변경
	$(".modify_schedule_title").on("click", function(e) {
		e.preventDefault();
		var schedule_no = $(this).data("schedule_no");
		var schedule_title = $(".schedule_title." + schedule_no).val();
		
		actionForm.append("<input type='hidden' name='schedule_no' value='" + schedule_no + "'>");
		actionForm.append("<input type='hidden' name='schedule_title' value='" + schedule_title + "'>");
		actionForm.attr("action", "${contextPath}/mypage/modifyScheduleTitle");
		actionForm.submit();
	});
	
	
	//일정 삭제 기능
	$(".btn-tour-delete").on("click",function(e){
		e.preventDefault();
		var schedule_no = $(this).data("schedule_no");
		
		if (confirm("삭제하시겠습니까? ")) {
			$("#" + schedule_no).remove();
			actionForm.append("<input type='hidden' name='schedule_no' value='" + schedule_no + "'>");
			actionForm.attr("action", "${contextPath}/mypage/removeSchedule");
			actionForm.submit();
		}
	});
	
	//문의 상세
	$(".btn-qna-detail").on("click", function(e) { 
		var qna_no = $(this).data("qna_no");
		
		actionForm.append("<input type='hidden' name='qna_no' value='" + qna_no + "'>");
		actionForm.attr("action", "${contextPath}/mypage/qnaDetail");
		actionForm.submit();
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
