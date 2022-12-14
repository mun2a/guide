<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.navbar-toggler-icon{
	display: inline-block;
	width: 1.5em;
	height: 1.5em;
	vertical-align: middle;
	content: "";
	background: 50% / 100% 100% no-repeat;
	background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='30' height='30' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%280, 0, 0, 0.5%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
}
</style>

	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username"  var="username" />
		<input type="hidden" id="userid" value="${username }">
	</sec:authorize>


	<%-- header UI 시작 --%>
	<nav class="navbar navbar-expand-lg navbar-info shadow-sm" aria-label="Fifth navbar example">
		<div class="container-fluid">
			<a class="navbar-brand ml-3" href="${contextPath}">
				<img src="${contextPath}/resources/image/logo.png" width="70em">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarsExample05">
				<ul class="navbar-nav">
					<%-- 로그인 안한상태 --%>
					<sec:authorize access="isAnonymous()">
						<li class="nav-item">
							<a class="nav-link text-dark" href="${contextPath}/login">로그인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-dark" href="${contextPath}/member/join">회원가입</a>
						</li>
					</sec:authorize>
				
					<%-- 모든 사용자 로그인 상태 --%>
			        <sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')">
			       
			        </sec:authorize>
				
					<%-- 모든회원 로그인 상태 --%>
			        <sec:authorize access="isAuthenticated()">
				       <li class="nav-item">
							<a class="nav-link text-dark" href="javascript:logout.submit();">로그아웃</a>
							<div id="div-logout"></div>
						</li>
				        
				        <%-- 일반회원 로그인 상태 --%>
				        <c:if test="${principal.authorities eq '[ROLE_MEMBER]'}">
					        <li class="nav-item">
								<a class="nav-link text-dark" href="${contextPath}/mypage/info">마이페이지</a>
							</li>
				        </c:if>
				        
				        <%-- 관리자 로그인 상태 --%>
				        <sec:authorize access="hasRole('ROLE_ADMIN')">
					        <li class="nav-item">
								<a class="nav-link text-dark" href="${contextPath}/admin/adHome">관리자페이지</a>
							</li>
							<li class="nav-item">
								<a class="nav-link text-dark" href="${contextPath}/mypage/info">마이페이지</a>
							</li>
				        </sec:authorize>
				        
				        
			        </sec:authorize>
				        
			        <li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle text-dark" href="#" id="dropdown05" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown05">
							<!-- <li><a class="dropdown-item" href="#">추천코스</a></li> -->
							<li><a class="dropdown-item" href="${contextPath}/qna/list">문의게시판</a></li>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="#">이용방법</a>
					</li>
	
				</ul>
			</div>
		</div>
	</nav>
	<%-- header UI 끝 --%>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		<%-- 로그아웃 가상돔 --%>
		str = "";

		str += '<form action="${contextPath}/logout" method="POST" name="logout">';
		str += '<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>';
		str += '</form>';
					
		$("#div-logout").append(str);

	});
	
</script>

