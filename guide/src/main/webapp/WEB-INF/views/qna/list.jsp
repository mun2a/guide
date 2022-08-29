<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	
<%@ include file="../common/cssLink.jsp"%>
<style type="text/css">
		
		<%-- 페이징 --%>
		.page-item.active .page-link{
			  z-index: 3;
			  background-color: #cccccc;
			  border-color: #cccccc;
			  color: black;
			  z-index: 3;
		}
		
		.page-link {
			color : black
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
							<h2 class="card-title text-center mb-5 fw-bold fs-2">문의 게시판</h2>
								<br>
								<br>
								<table class="table text-center table-bordered table-striped table-hover table-sm fs-7" >
								  <thead>
								    <tr>
								      <th scope="col" style="width: 10%">글번호</th>
								      <th scope="col" style="width: 10%">상태</th>
								      <th scope="col" style="width: 45%">제목</th>
								      <th scope="col" style="width: 20%">작성자</th>
								      <th scope="col" style="width: 20%">등록일</th>
								    </tr>
								  </thead>
								  <tbody>
								  <c:choose>
								  	
								  	<c:when test="${empty qnaList}">
								  		
								  		<tr class="align-middle bg-white">
									      <td class="bg-white" colspan="5" style="height: 25rem;" >현재 등록된 글이 없습니다.</td>
									    </tr>
								  	
								  	</c:when>
								  	
								  	<c:otherwise>
								  	
								  		<c:forEach items="${qnaList}" var="qnaList"> 
								  			<tr>
										      <td>${qnaList.qna_no}</td>
										     
										      <td>
										      	<c:choose>
										      		<c:when test='${qnaList.qna_reply_exist eq "N"}'>
										      			<span class="badge rounded-pill bg-secondary">답변 대기중</span>
										      		</c:when>
										      		
										      		<c:otherwise>
										      			<span class="badge rounded-pill bg-secondary">답변완료</span>
										      		</c:otherwise>
										      	</c:choose>
										      </td>
										      
										      <td>
										    <%-- 비회원이 접근한 경우 --%> 	
										    <sec:authorize access="isAnonymous()">
										    	
										    	<c:choose>
										    		<c:when test="${qnaList.qna_secret eq 'Y'}">
										    			<a href="${contextPath}/qna/read?pageNum=${criteria.pageNum}&qna_no=${qnaList.qna_no}"  class="text-dark text-decoration-none password-check" data-qna="${qnaList.qna_no}" data-page="${criteria.pageNum}">
															${qnaList.qna_title ne "1" ? qnaList.qna_title ne "2" ? "기타 문의" : "일정 문의" : "계정 문의"} 
														</a>
														&nbsp;<i class="bi bi-lock-fill"></i> 
										    		</c:when>
										    		
										    		<c:otherwise>
										    			<a href="${contextPath}/qna/read?pageNum=${criteria.pageNum}&qna_no=${qnaList.qna_no}"  class="text-dark text-decoration-none" data-qna="${qnaList.qna_no}" data-page="${criteria.pageNum}">
															${qnaList.qna_title ne "1" ? qnaList.qna_title ne "2" ? "기타 문의" : "일정 문의" : "계정 문의"} 
														</a>
										    		</c:otherwise>
										    	
										    	</c:choose>
										    	
											</sec:authorize>
										
										
											<%-- 모든회원 로그인 상태 --%>
									        <sec:authorize access="isAuthenticated()">
										       
										        
										        <%-- 일반회원 로그인 상태 --%>
										        <c:if test="${principal.authorities eq '[ROLE_MEMBER]'}">
											       
											       <c:choose>
											       
											       		<c:when test="${principal.username eq qnaList.qna_write }">
											       			<a href="${contextPath}/qna/read?pageNum=${criteria.pageNum}&qna_no=${qnaList.qna_no}"  class="text-dark text-decoration-none" data-qna="${qnaList.qna_no}" data-page="${criteria.pageNum}">
														      	${qnaList.qna_title ne "1" ? qnaList.qna_title ne "2" ? "기타 문의" : "일정 문의" : "계정 문의"} 
													      	</a>
														    <c:if test='${qnaList.qna_secret eq "Y"}'>
														      	&nbsp;<i class="bi bi-lock-fill"></i> 
													      	</c:if>
											       		</c:when>
											       		
											       		<c:otherwise>
											       			<c:choose>
										    					<c:when test="${qnaList.qna_secret eq 'Y'}">
														    		<a href="${contextPath}/qna/read?pageNum=${criteria.pageNum}&qna_no=${qnaList.qna_no}"  class="text-dark text-decoration-none password-check" data-qna="${qnaList.qna_no}" data-page="${criteria.pageNum}">
																		${qnaList.qna_title ne "1" ? qnaList.qna_title ne "2" ? "기타 문의" : "일정 문의" : "계정 문의"} 
																	</a>
																	&nbsp;<i class="bi bi-lock-fill"></i> 
													    		</c:when>
													    		
													    		<c:otherwise>
													    			<a href="${contextPath}/qna/read?pageNum=${criteria.pageNum}&qna_no=${qnaList.qna_no}"  class="text-dark text-decoration-none" data-qna="${qnaList.qna_no}" data-page="${criteria.pageNum}">
																		${qnaList.qna_title ne "1" ? qnaList.qna_title ne "2" ? "기타 문의" : "일정 문의" : "계정 문의"} 
																	</a>
													    		</c:otherwise>
													    	
													    	</c:choose>
											       		</c:otherwise>
											       </c:choose>
										        </c:if>
										        
										        <%-- 관리자 로그인 상태 --%>
										        <sec:authorize access="hasRole('ROLE_ADMIN')">
											        <a href="${contextPath}/qna/read?pageNum=${criteria.pageNum}&qna_no=${qnaList.qna_no}"  class="text-dark text-decoration-none" data-qna="${qnaList.qna_no}" data-page="${criteria.pageNum}">
														${qnaList.qna_title ne "1" ? qnaList.qna_title ne "2" ? "기타 문의" : "일정 문의" : "계정 문의"} 
											      	</a>
												    <c:if test='${qnaList.qna_secret eq "Y"}'>
												      	&nbsp;<i class="bi bi-lock-fill"></i> 
											      	</c:if>
										        </sec:authorize>
										        
										        
									        </sec:authorize>
										      </td>
										      <td>${empty qnaList.qna_write_name ? "비회원" : qnaList.qna_write_name}</td>
										      <td><fmt:formatDate value="${qnaList.qna_regist_date}" pattern="yyyy-MM-dd"/></td>
										    </tr>
								  		</c:forEach>
								  	
								  	</c:otherwise>
								  </c:choose>
								 
								  </tbody>
								</table>
								<div class="d-grid w-50 ms-auto mb-3">
					                <a href="${contextPath}/qna/add?pageNum=${criteria.pageNum}" class="btn btn-dark text-uppercase fw-bold main-hover w-25 ms-auto">
					                	글등록
					                </a>
					            </div>
					            
					            
					            <div>
	                            	<ul class="pagination justify-content-end">
	                            	<c:if test="${pageMaker.prev}">
	                            		<li class="page-item">
									      <a class="page-link btn-secondary" href="${contextPath}/qna/list?pageNum=1">
									      	<i class="bi bi-chevron-double-left"></i>
									      </a>
									    </li>
									    <li class="page-item">
									      <a class="page-link btn-secondary" href="${contextPath}/qna/list?pageNum=${pageMaker.startPage - 1}">
											<i class="bi bi-chevron-left"></i>
										  </a>
									    </li>
	                            	</c:if>	
	                            	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                            		<li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : '' }">
	                            			<a class="page-link" href="${contextPath}/qna/list?pageNum=${num}">${num}</a>
	                            		</li>
	                            	</c:forEach>	
	                            	<c:if test="${pageMaker.next}">
	                            		<li class="page-item">
									      <a class="page-link" href="${contextPath}/qna/list?pageNum=${pageMaker.endPage + 1}">
											<i class="bi bi-chevron-right"></i>
										  </a>
									    </li>
									    <li class="page-item">
									      <a class="page-link" href="${contextPath}/qna/list?pageNum=${pageMaker.realEnd}">
											<i class="bi bi-chevron-double-right"></i>
										  </a>
									    </li>
	                            	</c:if>	
	                            	</ul>
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
		
		
		var csrf_headername = "${_csrf.headerName}"; 
		var csrf_token = "${_csrf.token}";
		
		<%-- 비밀번호 확인 기능 --%>
		$(document).on("click",".password-check", function(e){
			
			e.preventDefault();
			
			var qna_no = $(this).data("qna");
			var pageNum = $(this).data("page");
			var qna_password = prompt("비밀번호를 입력해주세요.");
			var form = {qna_no:qna_no, qna_password:qna_password }
			$.ajax({
				type : "post",
				data :JSON.stringify(form),
				dataType : "json",
				url : "${contextPath}/qna/passwordCheck",
				processData : true,                                                      
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(data) {
					
					if(data) {
						location.href = "${contextPath}/qna/read?pageNum=" + pageNum + "&qna_no=" + qna_no;
					} else{
						alert("비밀번호가 틀립니다.");
						return false;
					}
					
				}
			});
			
			
			
		});
		
		
		
	});


</script>





</body>
</html>
