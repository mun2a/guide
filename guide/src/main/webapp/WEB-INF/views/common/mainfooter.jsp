<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%-- 푸터 UI 시작 --%>
	
	<div id="modal"></div>
	
	<%-- 푸터 UI 끝 --%>


<script type="text/javascript">
	
$(document).ready(function(){
	
	<%-- 모달 가상돔 --%>
	var str = "";
	str +="<div class='modal fade' id='info-modal' data-bs-backdrop='static' data-bs-keyboard='false' tabindex='-1' aria-labelledby='staticBackdropLabel' aria-hidden='true'>";
	str +="<div class='modal-dialog'>";
	str +="<div class='modal-content'>";
	str +="<div class='modal-header'>";
	str +="<h5 class='modal-title' id='staticBackdropLabel'>Information</h5>";
	str +="<button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>";
	str +="</div>";
	str +="<div class='modal-body'>";
	<%-- 이곳이 내용들어가는 공간 --%>
	str +="</div>";
	str +="<div class='modal-footer'>";
	str +="<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>Close</button>";
	str +="</div>";
	str +="</div>";
	str +="</div>";
	str +="</div>";
	
	$("#modal").append(str);
	
		
	var message = "";
	message += "${message}";
	
	$(".modal-body").append(message);
	if(message != "") {
		$("#info-modal").modal("show");
	}
	
	
	
});
	
	
	
</script>
		