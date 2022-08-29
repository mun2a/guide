<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/adminHeader.jsp"%>

<!-- Begin table header -->
<head>
    <!-- Custom styles for this page -->
    <link href="${contextPath }/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
                        
                        
                            <div class="table-responsive">
                                <table class="table table-bordered" id="#" width="100%" cellspacing="0">
                                    <tbody>
	                                	<tr>
	                                        <td>여행지 번호: ${tourDetail.tour_no}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>제목: ${tourDetail.tour_title}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>내용: ${tourDetail.tour_content}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>우편번호: ${tourDetail.tour_zipcode}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>주소: ${tourDetail.tour_address}</td>
	                                    </tr>
	                                	<tr>
	                                        <c:choose>
		                                        <c:when test="${tourDetail.tour_type == 0}">
		                                        	<td>관광 타입: 관광지</td>
		                                        </c:when>
		                                        <c:when test="${tourDetail.tour_type == 1}">
		                                        	<td>관광 타입: 음식점</td>
		                                        </c:when>
		                                        <c:when test="${tourDetail.tour_type == 2}">
		                                        	<td>관광 타입: 숙박</td>
		                                        </c:when>
		                                        <c:otherwise>
		                                        	<td>기타</td>
		                                        </c:otherwise>
	                                        </c:choose>
	                                    </tr>
	                                	<tr>
	                                        <td>이미지: ${tourDetail.tour_image}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>분류1: ${tourDetail.tour_category1}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>분류2: ${tourDetail.tour_category2}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>분류3: ${tourDetail.tour_category3}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>x좌표: ${tourDetail.tour_mapx}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>y좌표: ${tourDetail.tour_mapy}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>홈페이지: ${tourDetail.tour_homepage}</td>
	                                    </tr>
	                                	<tr>
	                                        <td>지역 코드: ${tourDetail.area_code} (${tourDetail.area_name})</td>
	                                    </tr>
	                                	<tr>
	                                        <td>지역 상세 코드: ${tourDetail.area_detail_code} (${tourDetail.area_detail_name})</td>
	                                    </tr>

                                    </tbody>
                                </table>
                                
                            
                            <form id="actionForm" action="${contextPath}/admin/tourMG/tourList" method="get">
                            	<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
                            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                            	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                            	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                            </form>
                            
                                
                                
                                
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->



<script type="text/javascript">
	var actionForm = $("#actionForm");
	$(".detail").on("click", function(e) {
		e.preventDefault();
		var pk = $(this).attr("href");
		
		actionForm.append("<input type='hidden' name='tour_no' value='" + pk + "'>");
		actionForm.attr("action", "${contextPath}/admin/tourMG/tourDetail");
		actionForm.submit();
	
	});
	
/* 	$(".remove").on("click", function(e) {
		e.preventDefault();
		var pk = $(this).attr("href");
		
		actionForm.append("<input type='hidden' name='tour_no' value='" + pk + "'>");
		actionForm.attr("action", "${contextPath}/admin/tourMG/tourListDel");
		actionForm.submit();
		alert("삭제되었습니다. : " + pk );
	
	}); */
	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		
		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
</script>
            


<%@ include file="../includes/adminFooter.jsp"%> 
