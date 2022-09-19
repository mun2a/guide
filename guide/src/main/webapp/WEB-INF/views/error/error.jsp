<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="application" />

<html>
<head>

	<title>Home</title>
	
	<!-- Bootstrap5 CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

	<link href="${contextPath}/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
	
<style type="text/css">

</style>

</head>
<body>

	<div class="container-fluid">

		<!-- 404 Error Text -->
		<div class="text-center" style="margin: 100px;">
			<c:set var="error_code"
				value="${requestScope['javax.servlet.error.status_code']}"></c:set>
			<div class="error mx-auto" data-text="${error_code }">
				${error_code }</div>
			<p class="lead text-gray-800 mb-5">${msg }</p>
			<p class="text-gray-500 mb-0">${txt }</p>

			<a href="#" onclick="back();">← Go Back</a> <br>
			<br> <a href="${contextPath}">← Go Home</a>
		</div>

	</div>

<script type="text/javascript">

	function back() {
		history.go(-1); 
	}
</script>

</body>
</html>


