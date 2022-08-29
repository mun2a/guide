<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	
<%@ include file="../common/cssLink.jsp"%>
<body>
<%@ include file="../common/mainheader.jsp"%>
	

<%-- 바디 시작 --%>
메인화면인 common/index.jsp입니다<br><br><br><br><br><br><br><br><br><br><br><br>

<div class="text-center">
	<input type="text" class="search-keyword" id="search-keyword">
</div>
<br>
<div class="text-center">
<a href="" class="mx-4 search-area" data-code="">전체</a> 
<a href="" class="mx-4 search-area" data-code="0">서울/경기도</a> 
<a href="" class="mx-4 search-area" data-code="1">광역시/특별자치</a> 
<a href="" class="mx-4 search-area" data-code="2">강원도</a> 
<a href="" class="mx-4 search-area" data-code="3">경상도</a> 
<a href="" class="mx-4 search-area" data-code="4">전라도</a> 
<a href="" class="mx-4 search-area" data-code="5">충청도</a> 
</div>
<br>	
	
				
<div class="container-fluid">
    <div class="row div-city">
    	
    	<c:forEach items="${areaList}" var="areaList">
    	
	        <div class="col-sm-6 col-md-3 ">
	        	<div class="col ps-3 pe-3" style="margin-bottom: 20px;">
					<div class="card shadow rounded-3">
						<a href="${contextPath}/travel/schedule?area_code=${areaList.area_code}&area_detail_code=${areaList.area_detail_code}"> 
							<img src="${areaList.area_image}" class="card-img-top " alt="..." style="height: 250px">
						</a>
						<div class="card-body">
						<div class="dropdown-divider mt-0"></div>
						<span class="fs-4">${areaList.area_english_title} </span><br>
						${areaList.area_name} ${areaList.area_detail_name}
						</div>
					</div>
				</div>
	        </div>
    	</c:forEach>
    </div>
</div>



	
<%-- 바디 끝 --%>

	
<%@ include file="../common/mainfooter.jsp"%>
<%@ include file="../common/jsLink.jsp"%>


<script type="text/javascript">
	
	$(document).ready(function(){
		
		var csrf_headername = "${_csrf.headerName}"; 
		var csrf_token = "${_csrf.token}"; 
		
		
		$(".search-area").on("click",function(e){
			e.preventDefault();
			
			var area_code = $(this).data("code");
			var form = {area_code : area_code};
			$.ajax({
				type : "post",
				data : JSON.stringify(form),
				dataType : "text",
				url : "${contextPath}/main/area/serach",
				processData : true,                                                      
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(data) {
					jobj = JSON.parse(data);
					
					var str = "";
					
					$(jobj).each(function(i, obj) {
						<%-- detail_name값이 null인경우 ""로 초기화 --%>
						if (obj.area_detail_name == null) {
							obj.area_detail_name = "";
						}
						
						str +='<div class="col-sm-6 col-md-3 ">';
			        	str +='<div class="col ps-3 pe-3" style="margin-bottom: 20px;">';
						str +='<div class="card shadow rounded-3">';
						str +='<a href="${contextPath}/travel/schedule?area_code=' + obj.area_code + '&area_detail_code=' + obj.area_detail_code + '">' ;
						str +='<img src="' + obj.area_image + '" class="card-img-top " alt="..." style="height: 250px">';
						str +='</a>';
						str +='<div class="card-body">';
						str +='<div class="dropdown-divider mt-0"></div>';
						str +='<span class="fs-4">' + obj.area_english_title + ' </span><br>';
						str +=obj.area_name;
						str +='&nbsp;'
						str +=obj.area_detail_name;
						str +='</div>';
						str +='</div>';
						str +='</div>';
			        	str +='</div>';
						
					});
					
					
					$(".div-city").html(str);
					
				},
				error : function(request, error) {                                     
			        alert("에러"); 
			        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			    },
			});
			
			
			
		});
		
		
		
		$("#search-keyword").on("keyup",function(e){
			
			var area_name = $(this).val();
			var form = {area_name : area_name};
			$.ajax({
				type : "post",
				data : JSON.stringify(form),
				dataType : "text",
				url : "${contextPath}/main/area/serach",
				processData : true,                                                      
				contentType: "application/json; charset-utf-8", 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrf_headername, csrf_token);
			    },
				success : function(data) {
					jobj = JSON.parse(data);
					
					var str = "";
					
					$(jobj).each(function(i, obj) {
						<%-- detail_name값이 null인경우 ""로 초기화 --%>
						if (obj.area_detail_name == null) {
							obj.area_detail_name = "";
						}
						
						str +='<div class="col-sm-6 col-md-3 ">';
			        	str +='<div class="col ps-3 pe-3" style="margin-bottom: 20px;">';
						str +='<div class="card shadow rounded-3">';
						str +='<a href="${contextPath}/travel/schedule?area_code=' + obj.area_code + '&area_detail_code=' + obj.area_detail_code + '">' ;
						str +='<img src="' + obj.area_image + '" class="card-img-top " alt="..." style="height: 250px">';
						str +='</a>';
						str +='<div class="card-body">';
						str +='<div class="dropdown-divider mt-0"></div>';
						str +='<span class="fs-4">' + obj.area_english_title + ' </span><br>';
						str +=obj.area_name;
						str +='&nbsp;'
						str +=obj.area_detail_name;
						str +='</div>';
						str +='</div>';
						str +='</div>';
			        	str +='</div>';
						
					});
					
					
					$(".div-city").html(str);
					
				},
				error : function(request, error) {                                     
			        alert("에러"); 
			        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			    },
			});
			
			
			
		});
		
		
		
	});
	
	
	
	
</script>


</body>
</html>
