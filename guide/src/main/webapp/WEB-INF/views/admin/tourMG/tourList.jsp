<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/adminHeader.jsp"%>

<!-- Begin table header -->
<head>
    <!-- Custom styles for this page -->
    <link href="${contextPath }/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<style type="text/css">
.form-control {
	display: inline;
	width: 19%;
}

label {
    display: block;
}
</style>
</head>
<!-- End table header -->


                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">TBL_tour</h1>
                    <p class="mb-4">여행지 목록.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">여행지 정보</h6>
                        </div>
                        <div class="card-body">
                        
                        <!-- 검색 -->
                        <div id="dataTable_filter" class="dataTables_filter">
                        <form id="searchForm" action="${contextPath}/admin/tourMG/tourList" method="get">
							<label>Search <br>
							지역: &nbsp;
							<select name="area_code" id="cate1" class="form-control form-control-sm" aria-controls="dataTable" style="width: 19%;">
								<option selected value="" >--------</option>
								<%-- <option value="c" <c:out value="${pageMaker.cri.type == 'c' ? 'selected' : ''}" />>지역</option> --%>
							</select>
							&nbsp;&nbsp;지역 상세: &nbsp;
							<select name="area_detail_code" id="cate2" class="form-control form-control-sm" aria-controls="dataTable" style="width: 19%;">
								<option selected value="" >--------</option>
							</select>
							&nbsp;&nbsp;타입: &nbsp;
							<select name="tour_type" id="cate3" class="form-control form-control-sm" aria-controls="dataTable" style="width: 10%;">
								<option selected value="" >--------</option>
							</select>
							<br><br>
							검색 유형: &nbsp;
							<select name="type" id="type" class="form-control form-control-sm" aria-controls="dataTable" style="width: 10%;">
								<option selected value="TA" <c:out value="${pageMaker.cri.type == 'TA' ? 'selected' : ''}" />>--------</option>
								<option value="T" <c:out value="${pageMaker.cri.type == 'T' ? 'selected' : ''}" />>제목</option>
								<option value="A" <c:out value="${pageMaker.cri.type == 'A' ? 'selected' : ''}" />>주소</option>
							</select>
							
							<input type="search" name="keyword" placeholder="Search" value="${pageMaker.cri.keyword}" class="form-control form-control-sm" placeholder="" aria-controls="dataTable" style="width: 29%;">
							<%-- <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">   --%>
							<input type="hidden" name="pageNum" value="1">  <!-- 검색시 1페이지 -->
                            <input type="hidden" name="amount" value="${pageMaker.cri.amount}"> 
							<button class="btn btn-default" id="searchBtn"><i class="fa fa-search"></i>검색</button>
							</label>
						</form>
						</div> <!-- End 검색 -->
                        
                        
                        
                        
                        
                            <div class="table-responsive">
                                <table class="table table-bordered" id="#" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>고유번호</th>
                                            <th>제목</th>
                                            <th>주소</th>
                                            <th>구분</th>
                                            <th>지역</th>
                                            <th>지역 상세</th>
                                            <th>설정</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<c:forEach items="${tourMGList }" var="tDto">
	                                	<tr>
	                                        <td>${tDto.tour_no}</td>
	                                        <td>${tDto.tour_title }</td>
	                                        <td>${tDto.tour_address}</td>
	                                        <c:choose>
		                                        <c:when test="${tDto.tour_type == 0}">
		                                        	<td>관광지</td>
		                                        </c:when>
		                                        <c:when test="${tDto.tour_type == 1}">
		                                        	<td>음식점</td>
		                                        </c:when>
		                                        <c:when test="${tDto.tour_type == 2}">
		                                        	<td>숙박</td>
		                                        </c:when>
		                                        <c:otherwise>
		                                        	<td>기타</td>
		                                        </c:otherwise>
	                                        </c:choose>
	                                        <td>${tDto.area_name}</td>
	                                        <td>${tDto.area_detail_name}</td>
	                                        <td>
	                                        	<a class="detail btn btn-primary btn-sm" href="${tDto.tour_no}">상세</a>
	                                        	<a class="remove btn btn-danger btn-sm" href="${tDto.tour_no}">삭제</a>
	                                        </td>
	                                    </tr>
	                                	</c:forEach>

                                    </tbody>
                                </table>
                                
                                
                                <div class="pull-right" style="float: right;">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                            	<ul class="pagination">
                            		<c:if test="${pageMaker.prev }">
                            			<li class="paginate_button page-item previous" id="dataTable_previous">
                            				<a href="${pageMaker.startPage - 1 }" aria-controls="dataTable" data-dt-idx="${pageMaker.startPage - 1 }" tabindex="0" class="page-link">Previous</a>
                            			</li>
                            		</c:if>
                            		
                            		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                            			<li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? 'active' : '' }">
                            				<a href="${num }" aria-controls="dataTable" data-dt-idx="${num }" tabindex="0" class="page-link">${num }</a>
                            			</li>
                            		</c:forEach>
                            		
                            		<c:if test="${pageMaker.next }">
                            			<li class="paginate_button page-item next" id="dataTable_next">
                            				<a href="${pageMaker.endPage + 1 }" aria-controls="dataTable" data-dt-idx="${pageMaker.endPage + 1 }" tabindex="0" class="page-link">Next</a>
                            			</li>
                            		</c:if>
                            	</ul>
                            </div>
                            </div>
                            
                            
                            <form id="actionForm" action="${contextPath}/admin/tourMG/tourList" method="get">
                            	<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
                            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                            	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                            	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                            	
                            	<input type="hidden" name="area_code" value="${pageMaker.cri.area_code }">
                            	<input type="hidden" name="area_detail_code" value="${pageMaker.cri.area_detail_code }">
                            	<input type="hidden" name="tour_type" value="${pageMaker.cri.tour_type }">
                            </form>
                            
                                
                                
                                
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->



<script type="text/javascript">

	//검색 대 중 소 분류
	let cateList = JSON.parse('${cateList}');
	
	//지역 코드
	let cate1Array = [{area_code: '0', area_type: '서울/경기도'}, {area_code: '1', area_type: '광역시/특별자치'}, {area_code: '2', area_type: '강원도'}, 
					  {area_code: '3', area_type: '경상도'}, {area_code: '4', area_type: '전라도'}, {area_code: '5', area_type: '충청도'} ];
	//지역 상세 코드
	let cate2Array = new Array();
	//관광지 타입
	let cate3Array = [{tour_type: '0', type_name: '관광지'}, {tour_type: '1', type_name: '음식점'}, {tour_type: '2', type_name: '숙박'}];
	//제목 or 주소
	let typeArray = [{search_type: 'T', tbl_tour: 'tour_title', search_name: '제목'}, {search_type: 'A', tbl_tour: 'tour_address', search_name: '주소'}];
	
	let cate2Obj = new Object();
	
	let cateSelect1 = $("#cate1");		
	let cateSelect2 = $("#cate2");
	let cateSelect3 = $("#cate3");
	let cateSelect4 = $("#type");
	
	/* 카테고리 배열 초기화 메서드 */
 	function makeCateArray(obj, array, cateList, area_code){
		for(let i = 0; i < cateList.length; i++){
				obj = new Object();
				
				obj.area_code = cateList[i].area_code;
				obj.area_name = cateList[i].area_name;
				obj.area_english_title = cateList[i].area_english_title;
				obj.area_detail_code = cateList[i].area_detail_code;
				obj.area_detail_name = cateList[i].area_detail_name;
				
				array.push(obj);				
				
		}
	}	 
	
	
	/* 배열 초기화 */
	makeCateArray(cate2Obj,cate2Array,cateList,2);
	
	// 지역 분류
	for(let i = 0; i < cate1Array.length; i++){
		cateSelect1.append("<option value='"+cate1Array[i].area_code+"'>" + cate1Array[i].area_type + "</option>");
	}
	// 지역 상세 분류 (지역 상세 이름이 null일 경우 지역 이름으로 화면에 나옴, 상세 코드는 그대로)
	$(cateSelect1).on("change",function(){
		
		let selectVal1 = $(this).find("option:selected").val();	
		
		cateSelect2.children().remove();
		
		cateSelect2.append("<option value=''>--------</option>");
		
		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].area_code){
				
				if (cate2Array[i].area_detail_name == null) {
					cateSelect2.append("<option value='"+cate2Array[i].area_detail_code+"'>" + cate2Array[i].area_name + "</option>");
				}else {
					cateSelect2.append("<option value='"+cate2Array[i].area_detail_code+"'>" + cate2Array[i].area_detail_name + "</option>");	
				}
				
			}
		}
		
	});
	
	//관광지 타입 분류
	for(let i = 0; i < cate3Array.length; i++){
		cateSelect3.append("<option value='"+cate3Array[i].tour_type+"'>" + cate3Array[i].type_name + "</option>");
	}
	
	//제목 or 주소 선택
	/* for(let i = 0; i < typeArray.length; i++){
		cateSelect4.append("<option value='"+typeArray[i].search_type+"'>" + typeArray[i].search_name + "</option>");
	} */
	
	var searchForm = $("#searchForm");
	$("#searchBtn").on("click", function(e) {
		e.preventDefault();
/*		
		var area_code = $("#cate1").val();
		var area_detail_code = $("#cate2").val();
		var tour_type = $("#cate3").val();
		
 		searchForm.append("<input type='hidden' name='area_code' value='" + area_code + "'>");
		searchForm.append("<input type='hidden' name='area_detail_code' value='" + area_detail_code + "'>");
		searchForm.append("<input type='hidden' name='tour_type' value='" + tour_type + "'>");
 */		
		searchForm.submit();
		
	});
	
	

</script>

<script type="text/javascript">
	var actionForm = $("#actionForm");
	
	$(".detail").on("click", function(e) {
		e.preventDefault();
		var pk = $(this).attr("href");
		
		actionForm.append("<input type='hidden' name='tour_no' value='" + pk + "'>");
		actionForm.attr("action", "${contextPath}/admin/tourMG/tourDetail");
		actionForm.submit();
	
	});
	
 	$(".remove").on("click", function(e) {
		e.preventDefault();
		var pk = $(this).attr("href");
		
		if (confirm("관광지 정보를 삭제 하시겠습니까? : " + pk)) {
			actionForm.append("<input type='hidden' name='tour_no' value='" + pk + "'>");
			actionForm.attr("action", "${contextPath}/admin/tourMG/tourListDel");
			actionForm.submit();
			alert("삭제되었습니다. : " + pk );
		}  
	
	}); 
	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		
		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
</script>

            


<%@ include file="../includes/adminFooter.jsp"%> 
