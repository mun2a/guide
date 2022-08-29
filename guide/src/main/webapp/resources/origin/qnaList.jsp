<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	
<body>
	

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
								    <tr class="align-middle bg-white">
								      <td class="bg-white" colspan="5" style="height: 25rem;" >현재 등록된 글이 없습니다.</td>
								    </tr>
								     <tr>
								      <td>1</td>
								      <td>
								      	<span class="badge rounded-pill bg-secondary">답변 대기중</span>
										<span class="badge rounded-pill bg-secondary">답변완료</span></td>
								      <td>테스트글</td>
								      <td>일이삼사오</td>
								      <td>2021/11/12</td>
								    </tr>
								     <tr>
								      <td>1</td>
								      <td>테스트글</td>
								      <td>일이삼사오</td>
								      <td>2021/11/12</td>
								    </tr>
								     <tr>
								      <td>1</td>
								      <td>테스트글</td>
								      <td>일이삼사오</td>
								      <td>2021/11/12</td>
								    </tr>
								   
								  </tbody>
								</table>
								<div class="d-grid w-50 ms-auto mb-3">
					                <a href="${contextPath}/qna/add" class="btn btn-dark text-uppercase fw-bold main-hover w-25 ms-auto">
					                	글등록
					                </a>
					            </div>
								<div>
								  <ul class="pagination justify-content-end">
								    <li class="page-item">
								      <a class="page-link btn-secondary" href="#">
								      	<i class="bi bi-chevron-double-left"></i>
								      </a>
								    </li>
								    <li class="page-item">
								      <a class="page-link btn-secondary" href="#">
										<i class="bi bi-chevron-left"></i>
									  </a>
								    </li>
								    <li class="page-item active">
								      <a class="page-link btn-secondary" href="#">1</a>
								    </li>
								    <li class="page-item">
								      <a class="page-link" href="#">2</a>
								    </li>
								    <li class="page-item">
								      <a class="page-link" style="color: black" href="#">3</a>
								    </li>
								    <li class="page-item">
								      <a class="page-link" href="#">4</a>
								    </li>
								    <li class="page-item">
								      <a class="page-link" href="#">5</a>
								    </li>
								    <li class="page-item">
								      <a class="page-link" href="#">
										<i class="bi bi-chevron-right"></i>
									  </a>
								    </li>
								    <li class="page-item">
								      <a class="page-link" href="#">
										<i class="bi bi-chevron-double-right"></i>
									  </a>
								    </li>
								  </ul>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>	

	
<%-- 바디 끝 --%>

	
	
</body>
</html>
