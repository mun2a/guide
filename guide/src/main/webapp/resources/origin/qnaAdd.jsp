<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	
<body>
	

<%-- 바디 시작 --%>


<div class="container-fluid">
			<div class="row">
				<div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
					<div class="card border-0 shadow rounded-3 my-5">
						<div class="card-body px-3 p-sm-5">
							<h2 class="card-title text-center mb-5 fw-bold fs-2">문의 글 작성</h2>
							
								<form action="${contextPath}/qna/add" method="post" name="frm" id="form-computer-board-add" >
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<input type="hidden" name="qna_write" value="${memberInfo.member_id}" />
								    <div class="form-group row mb-3">
								      <label for="board_title" class="col-sm-2 col-form-label fw-bolder">글 제목</label>
								      <div class="col-sm-10">
								      	 <select class="form-select" id="qna_title" name="qna_title" aria-label="New Field">
							                <option value="1">계정 문의</option>
							                <option value="2">일정 문의</option>
							                <option value="3">기타 문의</option>
							            </select>
								      </div>
								    </div>
								    <div class="form-group row mb-3">
								      <label for="member_name" class="col-sm-2 col-form-label fw-bolder">작성자</label>
								      <div class="col-sm-10">
								        <input type="text"  class="form-control bg-white pe-none" id="qna_write_name" name="qna_write_name" value="${empty memberInfo.member_name ? '비회원' : memberInfo.member_name}" readonly="readonly">
								      </div>
								    </div>
								    <div class="form-group row mb-3">
								      <label for="board_contents" class="col-sm-2 col-form-label align-middle fw-bolder" >글 내용</label>
								      <div class="col-sm-10">
								        <textarea class="form-control" id="qna_content"  name="qna_content" rows="10" style="resize: none;" maxlength="1300"></textarea>
								      </div>
								    </div>
								     <div class="form-group row mb-3">
								      <label for="board_title" class="col-sm-2 col-form-label fw-bolder">비밀글 여부</label>
								      <div class="col-sm-10 align-middle">
								      	<span><input type="radio" id="secret-yse" name="qna_secret" value="Y">예</span>
								      	<span><input type="radio" id="secret-no" name="qna_secret" value="N" checked="checked">아니요</span>
								      </div>
								    </div>
								     <div class="form-group row mb-3">
								      <label for="board_title" class="col-sm-2 col-form-label fw-bolder">비밀번호</label>
								      <div class="col-sm-10">
								        <input type="text"  class="form-control w-25 bg-white" id="qna_password" name="qna_password" maxlength="4">
								      </div>
								    </div>
								    
								    <div class="hstack gap-3 w-50 ms-auto">
										<input type="submit" value="글 등록" class="btn btn-dark btn-login text-uppercase fw-bold main-hover w-50" id="btn-board-add">
										<a href="${contextPath}/qna/list" class="w-50">
											<input type="button" value="취소" class="btn btn-dark btn-login text-uppercase fw-bold sub-hover w-100">
										</a>
									</div>
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>	
	
<%-- 바디 끝 --%>

	
	
</body>
</html>
