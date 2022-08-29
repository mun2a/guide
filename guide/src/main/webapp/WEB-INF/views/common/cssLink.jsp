<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix ="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="application" />
<sec:authentication property="principal" var="principal"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%-- 시큐리티용 --%>
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
 
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>

<meta name="viewport" content="width=device-width, initial-scale=1">

<%-- 진아 파일 --%>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

<%-- Bootstrap5 CSS --%> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%-- Bootstrap ICON CSS --%> 	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<%-- 메인 css --%> 	
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/mainCss.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mainCss.css">

	
<%--진아 파일--%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

<%-- 부트 js --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<%-- 제이쿼리 3.6 --%> 	
<script type="text/javascript" src="${contextPath}/resources/js/jquery3.6/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

<%-- 모달 alert 기능 --%>
function fnModal(e) {
	
	$(".modal-body").html(e);
	if(e != "") {
		$("#info-modal").modal("show");
	}
};
	
</script>


<title>GOGO</title>
</head>
	