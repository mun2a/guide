<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../common/cssLink.jsp"%>
<style>
   html{
      scroll-behavior: smooth;
   }
   
   /* ------- 왼쪽 ------- */
   /* 날짜 선택 input */
   .testDatepicker {
      border: none;
      width: 7em;
      text-align: center;
      cursor: pointer;
   }
   
   /* 일차 탭 */
   .nav-pills .nav-link {
      color: #000;
   }
   .first-tab .nav-link.active {
      background-color: #79F116;
      color: #fff;
   }
   .second-tab .nav-link.active {
      background-color: #03ABCF;
      color: #fff;
   }
   .third-tab .nav-link.active {
      background-color: #8B5C35;
      color: #fff;
   }
   .fourth-tab .nav-link.active {
      background-color: #FFC000;
      color: #fff;
   }
   
   .addPlace .place {
      margin : 0.5em;
      margin-bottom: 1em;
   }
   .addPlace .place div {
      margin-left: 0.3em;
   }
   
   /* 드래그앤드롭 */
   .itemBox { /* 리스트에 포함될 아이템을 위한 스타일 */
      margin: 1em 0.7em;
      cursor: pointer;
   }
   
   .itemBoxHighlight { /* 아이템을 드래그하면 놓은 자리를 알려주는 스타일 */
       width:100%;
       height:50px;
       padding:10px;
       margin-bottom:10px;
       background-color : rgba(0, 0, 0, 0.1);
   }
   
   .deleteBox { /* 아이템 삭제 버튼의 스타일(이 버튼은 아이템에 마우스를 올리면 보여짐) */
       display:none;
       cursor:pointer;
   }
   
   /* ... 표시 */
   .ellipsis {
      display: block;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
   }
   
	span.ellipsis {
		display: flex;
		align-items: center;
	}
   
   /* ------- 지도 ------- */
   .customoverlay {
      position:relative;
      bottom:85px;
      border-radius:6px;
      border: 1px solid #ccc;
      border-bottom:2px solid #ddd;
      float:left;
   }
   .customoverlay:nth-of-type(n) {
      border:0;
      box-shadow:0px 1px 2px #888;
   }
   .customoverlay a {
      display:block;
      text-decoration:none;
      color:#000;
      text-align:center;
      border-radius:6px;
      font-size:14px;
      font-weight:bold;
      overflow:hidden;
      background: #41CFDA;
      text-align: right;
   }
   .customoverlay .title {
      display:block;
      text-align:center;
      background:#fff;
      margin-left: 7px;
      padding: 7px 10px;
      font-size:14px;
      font-weight:bold;
   }
   .customoverlay:after {
      content : '';
      position: absolute;
      margin-left: -12px;
      left: 50%;
      bottom: -12px;
      width: 22px;
      height: 12px;
      background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png');
   }
   
   /* 일정생성/추천장소 버튼 */
   .btn-light {
      background-color: rgba(255, 255, 255, 0.8);
      padding: 0.4em 1.2em;
   }
   .btn-light:hover {
      background-color: rgb(65, 207, 218);
      color: #fff;
   }
   
   /* ------- 오른쪽 ------- */
   /* search */
   .placeSearch {
      display: flex;
      justify-content: center;
      align-items: center;
   }
   .placeSearch #filter {
      border: none;
      border-bottom: 1px solid #ddd;
      padding: 0.5em 0 0.5em 0.5em;
      width: 17em;
   }
   .placeSearch .bi-search {
      cursor: pointer;
   }
   
   .tabs {
      display: flex;
      justify-content: space-between;
      list-style: none;
      padding: 0.3em 1em;
   }
   .tab-0, .tab-1, .tab-2, .tab-3 {
      background-image: linear-gradient(transparent calc(100% - 3px), #41CFDA 3px);
      background-repeat: no-repeat;
      background-size: 0% 100%;
      transition: background-size 0.6s;
      cursor: pointer;
      
      padding: 0.2em 0.7em;
      
/*       display:inline-block; */
/*       margin:0; */
/*       text-transform:uppercase; */
   }
/*    .tab-1:after, .tab-2:after, .tab-3:after { */
/*       display:block; */
/*       content: ''; */
/*       border-bottom: solid 2px #41CFDA;   */
/*       transform: scaleX(0);   */
/*       transition: transform 250ms ease-in-out; */
/*    } */
/*    .tab-1:hover:after, .tab-2:hover:after, .tab-3:hover:after { */
/*       transform: scaleX(1.3); */
/*    } */
   .tab-0:hover, .tab-1:hover, .tab-2:hover, .tab-3:hover, .current {
      background-size: 100% 100%;
   }
   
   #filtersubmit {
       position: relative;
       z-index: 1;
       left: -25px;
       top: 1px;
       color: #7B7B7B;
       cursor:pointer;
       width: 0;
       margin-left: -5px;
   }
</style>
<body>
<%@ include file="../common/mainheader.jsp"%>
   
<%-- 바디 시작 --%>
<div class="row g-0">
	<form action="#" method="post" id="scheduleFrm" class="col-lg-2 text-center p-0" style="height: 100%">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" id="member_id" name="member_id" value="user1@naver.com">
		<div class="city pt-2 mb-3">
			<h2 class="fw-bold area_name"></h2>
		   	<h4 class="text-secondary area_english_title"></h4>
		   <div class="mt-3">
		      <h4 style="font-weight: bold;">
		         <input type="hidden" id="days">
		         <span id="daysLabel">0</span>&nbsp;DAY
		      </h4>
		      <input type="text" class="testDatepicker" id="startDate" name="schedule_start" onchange="call()" placeholder="출발일 선택">
		      ~
		      <input type="text" class="testDatepicker" id="endDate" name="schedule_end" onchange="call()" placeholder="도착일 선택">
		   </div>
		   <div class="addInput">
		   </div>
		</div>
		<div class="scheduling">
		<!--          <h6 class="m-3"><i class="bi bi-list-check"></i>&nbsp;선택목록</h6> -->
		  <ul class="nav nav-pills mb-3 justify-content-center" id="pills-tab" role="tablist">
		     <li class="nav-item first-tab" role="presentation">
		        <button class="nav-link active" id="pills-first-tab"
		           data-bs-toggle="pill" data-bs-target="#pills-first" type="button"
		           role="tab" aria-controls="pills-first" aria-selected="true">1일차</button>
		     </li>
		     <li class="nav-item second-tab" role="presentation">
		        <button class="nav-link" id="pills-second-tab"
		           data-bs-toggle="pill" data-bs-target="#pills-second"
		           type="button" role="tab" aria-controls="pills-second"
		           aria-selected="false">2일차</button>
		     </li>
		     <li class="nav-item third-tab" role="presentation">
		        <button class="nav-link" id="pills-third-tab"
		           data-bs-toggle="pill" data-bs-target="#pills-third"
		           type="button" role="tab" aria-controls="pills-third"
		           aria-selected="false">3일차</button>
		     </li>
		     <li class="nav-item fourth-tab" role="presentation">
		        <button class="nav-link" id="pills-fourth-tab"
		           data-bs-toggle="pill" data-bs-target="#pills-fourth"
		           type="button" role="tab" aria-controls="pills-fourth"
		           aria-selected="false">4일차</button>
		     </li>
		  </ul>
		  <div class="tab-content overflow-scroll" id="pills-tabContent" style="height: 41em;">
		      <div class="tab-pane fade show active" id="pills-first" role="tabpanel" aria-labelledby="pills-first-tab">
		         <div class="itemBoxWrap">
		            <input type="hidden" class="addPlace">
		         </div>
		      </div>
		      <div class="tab-pane fade" id="pills-second" role="tabpanel" aria-labelledby="pills-second-tab">
		         <div class="itemBoxWrap">
		            <input type="hidden" class="addPlace">
		         </div>
		      </div>
		      <div class="tab-pane fade" id="pills-third" role="tabpanel" aria-labelledby="pills-third-tab">
		         <div class="itemBoxWrap">
		            <input type="hidden" class="addPlace">
		         </div>
		      </div>
		      <div class="tab-pane fade" id="pills-fourth" role="tabpanel" aria-labelledby="pills-fourth-tab">
		         <div class="itemBoxWrap">
		            <input type="hidden" class="addPlace">
		         </div>
		      </div>
		   </div>
		</div>
	</form>
   
	<div class="col-lg-8 position-relative">
	   <div class="" id="map" style="width: 100%; height: 100%; z-index: 1"></div>
	   <div class="d-flex justify-content-between position-absolute top-0 start-50 translate-middle-x p-3" style="width: 100%; z-index: 10">
	      <span>
	         <button type="button" class="btn btn-light scheduleBtn">일정 생성</button>
	      </span>
	      <span>
	         <button type="button" class="btn btn-light">추천 명소</button>
	         <button type="button" class="btn btn-light">추천 음식점</button>
	         <button type="button" class="btn btn-light">추천 호텔</button>
	      </span>
	   </div>
	</div>
   
	<div class="col-lg-2 text-center p-0">
		<div class="placeSearch mt-2">
			<input id="filter" type="text" placeholder="검색어를 입력해 주세요"/>
			<i id="filtersubmit" class="bi bi-search" style="color: #41CFDA"></i>
		</div>
		<ul class="tabs mb-1">
			<li class="tab-link tab-3 current" data-tab="tab-3">전체</li>
			<li class="tab-link tab-0" data-tab="tab-0">명소</li>
			<li class="tab-link tab-1" data-tab="tab-1">음식점</li>
			<li class="tab-link tab-2" data-tab="tab-2">호텔</li>
		</ul>
      
		<div class="overflow-scroll selPlace" style="height: 50em;">
<%-- 				<input type="hidden" name="area_code" value="${tour.area_code }"> --%>
<%-- 				<input type="hidden" name="area_detail_code" value="${tour.area_detail_code }"> --%>
			<c:forEach items="${tour}" var="tour">
				<div class="justify-content-between shadow m-2 p-2 itemBox placeHoverRight" style="height: 5em; display: flex">
					<input type="hidden" class="itemNum" name="schedule_order"/>
					<input type="hidden" class="schedule_day" name="schedule_day"/>
					<input type="hidden" class="tour_no" name="tour_no" value="${tour.tour_no}" data-tourNo="${tour.tour_no}"/>
					<input type="hidden" class="tourType${tour.tour_type}" data-tourtype="${tour.tour_type}" value="${tour.tour_type}"/>
					<input type="hidden" class="mapxVal" data-mapx="${tour.tour_mapx}"/>
					<input type="hidden" class="mapyVal" data-mapy="${tour.tour_mapy}"/>
					<input type="hidden" id="zipcode" value="${tour.tour_zipcode}"/>
					<div class="d-flex align-items-center" style="width: 20%; background: url('${tour.tour_image}'); background-position: center; background-repeat: no-repeat; background-size:contain;"></div>
					<img alt="모달 이미지" src="${tour.tour_image }" style="display: none;" id="p_image">
					<div class="align-self-center text-start" style="width: 80%; padding-left: 0.5em">
						<p class="d-flex justify-content-between mb-1" style="width: 100%">
							<span class="ellipsis" style="width: 82%"><strong>${tour.tour_title }</strong>&nbsp;</span>
							<span style="width: 18%; text-align: center;">
							   <i class="bi bi-info-circle text-info" id="infoItem"></i>
							   <a class="addItem"><i class="bi bi-plus-lg"></i></a>
							   <span class='deleteBox'><i class='bi bi-x'></i></span>
							</span>
						</p>
						<p class="ellipsis m-0">${tour.tour_address}</p>
					</div>
				</div>
			</c:forEach>
			<input type="hidden" class="deletePlace">
      
         <!-- <div id="tab-1" class="tab-content current">
            <h5>명소를 검색하세요</h5> 
            <p><i class="fa fa-exclamation-circle" aria-hidden="true"></i></p>
            <p>장소명을 검색하세요</p>
            <p>검색어는 두글자 이상 입력해주세요</p>
         </div>
         <div id="tab-2" class="tab-content">
            <h5>음식점을 검색하세요</h5>
            <p><i class="fa fa-exclamation-circle" aria-hidden="true"></i></p>
            <p>장소명을 검색하세요</p>
            <p>검색어는 두글자 이상 입력해주세요</p>
         </div>
         <div id="tab-3" class="tab-content">
            <h5>호텔을 검색하세요</h5>
            <p><i class="fa fa-exclamation-circle" aria-hidden="true"></i></p>
            <p>장소명을 검색하세요</p>
            <p>검색어는 두글자 이상 입력해주세요</p>
         </div> -->
		</div>
	</div>
</div>
<%-- 바디 끝 --%>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="border: none;background-color: white; float: right;">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modalBox">
						<img alt="장소이미지" src="" style="width: 200px; height: 146px; float: left; margin-right: 15px;">
					</div>
					<div class="pt-3">
						<h5 class="modal-title" id="myModalLabel" style="font-weight: bold;margin-bottom: 9px;"></h5>
						(<span class="modal-zipcode" style="font-size: 13px;"></span>)
						<span class="modal-address" style="font-size: 13px;"></span>
						<input type="hidden" class="modal_tourNo">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default addList" data-dismiss="modal" style="background-color: #41CFDA;color: #fff;font-size: 5px;font-weight: bold;">목록추가</button>
				<button type="button" class="btn btn-primary" style="background-color: gray;font-size: 5px;font-weight: bold;border-color: gray;">리뷰보기</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="../common/jsLink.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84f7824a42d57ad9bcccbdefb2ef0476"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
 $(function() {
	// 쿼리스트링 지역코드 가져오기
	var qs = getQueryStringObject();
	var code = qs.area_code;
	var detailCode = qs.area_detail_code;
	
	function getQueryStringObject() {
	    var a = window.location.search.substr(1).split('&');
	    if (a == "") return {};
	    var b = {};
	    for (var i = 0; i < a.length; ++i) {
	        var p = a[i].split('=', 2);
	        if (p.length == 1)
	            b[p[0]] = "";
	        else
	            b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
	    }
	    return b;
	}
	
	var area = "${area}";
	
	var arr = new Array();
    <c:forEach items="${area}" var="item">        
            arr.push({area_code: "${item.area_code}"
                    , area_detail_code : "${item.area_detail_code}"
                    , area_english_title : "${item.area_english_title}"
                    , area_name : "${item.area_name}"
                    , area_detail_name : "${item.area_detail_name}"
                    , area_latitude : "${item.area_latitude}"
                    , area_longitude : "${item.area_longitude}"});
    </c:forEach>
    
    var latitude = null;
    var longitude = null;
	
	for(var i = 0 ; i < arr.length; i ++){    
           if (arr[i].area_code == code && arr[i].area_detail_code == detailCode) {
			$("h2.area_name").text(arr[i].area_name + " " + arr[i].area_detail_name);
			$("h4.area_english_title").text(arr[i].area_english_title);
         	latitude = arr[i].area_latitude;
         	longitude = arr[i].area_longitude;
		}
	}
   
 	$(".first-tab, .second-tab, .third-tab, .fourth-tab").hide();

   /* ------- 날짜 ------- */
      $(".testDatepicker").datepicker({ 
         numberOfMonths: 2 , 
         dateFormat:"yy-mm-dd" , 
         setDate: 'today',
         prevText: '이전 달' , 
         nextText: '다음 달' , 
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] , 
         monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] , 
         dayNames: ['일', '월', '화', '수', '목', '금', '토'] , 
         dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'] , 
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] , 
         showMonthAfterYear: true , 
         yearSuffix: '년',
         showButtonPanel: true,
         maxDate : "+1m +1w",   
         minDate : 0,
         closeText: '닫기'
      });
   });
      
	function call() {
		var sdd = document.getElementById("startDate").value;
        var edd = document.getElementById("endDate").value;
        var FORMAT = "-";

        if (sdd.length != 10 || edd.length != 10)
            return null;

        if (sdd.indexOf(FORMAT) < 0 || edd.indexOf(FORMAT) < 0)
            return null;

        var start_dt = sdd.split(FORMAT);
        var end_dt = edd.split(FORMAT);

        start_dt[1] = (Number(start_dt[1]) - 1) + "";
        end_dt[1] = (Number(end_dt[1]) - 1) + "";

        var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
        var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);
        
        var days = ((to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24) + 1;
		if (days < 1 || days > 4) {
			alert("최소 당일, 최대 3박 4일까지 날짜를 선택할 수 있습니다.");
			return false;
		} else {
		document.getElementById("days").setAttribute("value", days);
			document.getElementById("daysLabel").innerText = days;
		}
       
 		if (days == 1) {
 			$(".first-tab").show();
 			$(".second-tab, .third-tab, .fourth-tab").hide();
 		} else if (days == 2) {
 			$(".first-tab, .second-tab").show();
 			$(".third-tab, .fourth-tab").hide();
 		} else if (days == 3) {
 			$(".first-tab, .second-tab, .third-tab").show();
 			$(".fourth-tab").hide();
 		} else if (days >= 4) {
 			$(".first-tab, .second-tab, .third-tab, .fourth-tab").show();
 		}
        
		var appendHtml = "";
		return ((to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24) + 1; 
	}
   
   /* ------- 드래그앤드롭 ------- */
   /** UI 설정 */
   $(function() {
       $(".itemBoxWrap").sortable({
           placeholder:"itemBoxHighlight",
           start: function(event, ui) {
               ui.item.data('start_pos', ui.item.index());
           },
           stop: function(event, ui) {
               var spos = ui.item.data('start_pos');
               var epos = ui.item.index();
            reorder();
           }
       });
       //$("#itemBoxWrap").disableSelection();
       
       $( ".sortable" ).sortable();
       $( ".sortable" ).disableSelection();
   });
   
   /** 아이템 순서 조정 */
   function reorder() {
       $(".itemBox").each(function(i, box) {
           $(box).find(".itemNum").val(i + 1);
       });
   }
   
   $(".deleteBox").on("click", function(event) {
      $(this).parent().parent().parent().parent(".itemBox").insertBefore(".deletePlace");
      $(this).prevAll(".bi-info-circle").show();
      $(this).prev(".addItem").show();
      $(this).hide();
      reorder();
   });
   
	/* ------- 지도 api ------- */
	var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
		mapOption = { 
		    center: new kakao.maps.LatLng(36.30722, 127.57194), // 지도의 중심좌표
		    level: 6 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 지도에 표시된 마커/오버레이 객체를 가지고 있을 배열입니다
	var markers = [];
	var overlays = [];
	
	$(".placeHoverRight").hover(function() {
		var mapx = $(this).children(".mapxVal").data('mapx');
		var mapy = $(this).children(".mapyVal").data('mapy');
		var mapName = $(this).children(".text-start").children("p").children(".ellipsis").text();
		var tourType = $(this).children("input.tourType").data('tourtype');
		
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(mapy, mapx);
		
		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);
      
		var imageSrc = '${contextPath}/resources/image/travel/marker/0_tour.png', // 마커이미지의 주소입니다
			imageSrc1 = '${contextPath}/resources/image/travel/marker/0_restaurant.png',
			imageSrc2 = '${contextPath}/resources/image/travel/marker/0_hotel.png',
			imageSize = new kakao.maps.Size(40, 60), // 마커이미지의 크기입니다
			imageOption = {offset: new kakao.maps.Point(22, 65)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(mapy, mapx); // 마커가 표시될 위치입니다
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position: markerPosition,
			image: markerImage // 마커이미지 설정 
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var content = '<div class="customoverlay">' +
		    '  <a href="https://map.kakao.com" target="_blank">' +
		    '    <span class="title">' + mapName + '</span>' +
		    '  </a>' +
		    '</div>';
      
		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new kakao.maps.LatLng(mapy, mapx);  
      
		// 커스텀 오버레이를 생성합니다
		var customOverlay = new kakao.maps.CustomOverlay({
			map: map,
			position: position,
			content: content,
			yAnchor: 1 
		});
		
		setMarkers(null);
		setOverlays(null);
		
		console.log(markers.length + ", " + overlays.length);
		
		// 생성된 마커/오버레이를 배열에 추가합니다
	    markers.push(marker);
	    overlays.push(customOverlay);
	});
	$(".placeHoverLeft").hover(function() {
		var mapx = $(this).children(".mapxVal").data('mapx');
		var mapy = $(this).children(".mapyVal").data('mapy');
		
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(mapy, mapx);
		
		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);
	});
	
	// 지도에 표시된 마커/오버레이 객체를 가지고 있을 배열입니다
	var addMarkers = [];
	var addOverlays = [];
	
	/** 아이템 추가 */
	$(".addItem").on("click", function(event) {
		var mapx = $(this).parent().parent().parent().prevAll("input.mapxVal").data('mapx');
		var mapy = $(this).parent().parent().parent().prevAll("input.mapyVal").data('mapy');
		var mapName = $(this).parent().prevAll("span.ellipsis").text();
		
		var firstLeng = $("#pills-first .itemBoxWrap .itemBox").length;
		var secondLeng = $("#pills-second .itemBoxWrap .itemBox").length;
		var thirdLeng = $("#pills-third .itemBoxWrap .itemBox").length;
		var fourthLeng = $("#pills-fourth .itemBoxWrap .itemBox").length;
		
		var tourType = $(this).parent().parent().parent().prevAll("input.tourType").data('tourtype');
		
		if ($("#days").val() < 0 || $("#days").val() == "") {
			alert("여행 날짜를 선택해 주세요");
			return false;
		} /* else if (firstLeng >= 8 || secondLeng >= 8 || thirdLeng >= 8 || fourthLeng >= 8) {
			alert("일차별 최대 8개의 일정만 추가하실 수 있습니다.");
			return false;
		} */ else {
			$(this).parent().parent().parent().parent(".itemBox").insertBefore(".show .itemBoxWrap .addPlace");
			$(this).prev(".bi-info-circle").hide();
			$(this).hide();
			$(this).next(".deleteBox").show();
			
			// 이동할 위도 경도 위치를 생성합니다
			var moveLatLon = new kakao.maps.LatLng(mapy, mapx);
			
			var imageSrc = '${contextPath}/resources/image/travel/marker/0_tour.png', // 마커이미지의 주소입니다
				imageSrc1 = '${contextPath}/resources/image/travel/marker/0_restaurant.png',
				imageSrc2 = '${contextPath}/resources/image/travel/marker/0_hotel.png',
				imageSize = new kakao.maps.Size(40, 60), // 마커이미지의 크기입니다
				imageOption = {offset: new kakao.maps.Point(22, 65)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			    markerPosition = new kakao.maps.LatLng(mapy, mapx); // 마커가 표시될 위치입니다
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position: markerPosition,
				image: markerImage // 마커이미지 설정 
			});
			    
			var markerImage1 = new kakao.maps.MarkerImage(imageSrc1, imageSize, imageOption);
			var marker1 = new kakao.maps.Marker({
				position: markerPosition,
				image: markerImage1 // 마커이미지 설정 
			});
			    
			var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize, imageOption);
			var marker2 = new kakao.maps.Marker({
				position: markerPosition,
				image: markerImage2 // 마커이미지 설정 
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			if (tourType == 0) {
				marker.setMap(map);
				addMarkers.push(marker);
			} else if (tourType == 1) {
				marker1.setMap(map);
				addMarkers.push(marker1);
			} else {
				marker2.setMap(map);
				addMarkers.push(marker2);
			}
			
			// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var content = '<div class="customoverlay">' +
			    '  <a href="https://map.kakao.com" target="_blank">' +
			    '    <span class="title">' + mapName + '</span>' +
			    '  </a>' +
			    '</div>';
			
			// 커스텀 오버레이가 표시될 위치입니다 
			var position = new kakao.maps.LatLng(mapy, mapx);  
	      
			// 커스텀 오버레이를 생성합니다
			var customOverlay = new kakao.maps.CustomOverlay({
				map: map,
				position: position,
				content: content,
				yAnchor: 1
			});
			
			addOverlays.push(customOverlay);
			
			reorder();
			
			$(this).parent().parent().parent().parent().removeClass("placeHoverRight");
			$(this).parent().parent().parent().parent().addClass("placeHoverLeft");
			
			$("#pills-first .itemBoxWrap .schedule_day").val(1);
			$("#pills-second .itemBoxWrap .schedule_day").val(2);
			$("#pills-third .itemBoxWrap .schedule_day").val(3);
			$("#pills-fourth .itemBoxWrap .schedule_day").val(4);
		}
	});
	
	$(".itemBox").mouseleave(function() {
		setMarkers(null);
		setOverlays(null);
	});
	
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }            
	}
	function setOverlays(map) {
	    for (var i = 0; i < overlays.length; i++) {
	    	overlays[i].setMap(map);
	    }            
	}
	
	//==============================================================================================================================================
	
	$(document).ready(function(){
		var csrf_headername = "${_csrf.headerName}"; 
		var csrf_token = "${_csrf.token}"; 
		
		$(".scheduleBtn").click(function() {
 			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			var member_id = $("#member_id").val();
			var schedule_no;
			
			var form = {schedule_start : startDate, schedule_end : endDate, member_id : member_id};
			
			var len = $("#scheduleFrm").find("[name='tour_no']").length;
	 		let frmArray = new Array();	 //저장 일정 데이터
	 		
	 		if (startDate == "") {
				alert("출발일 선택");
			}else if (endDate == "") {
				alert("도착일 선택");
			}else if (member_id == "" ) {
				alert("로그인 필요")
			}else {	
				alert($("#scheduleFrm").find("[name='schedule_day']")[0].value);
				$.ajax({
					type : "post",
					data : JSON.stringify(form),
					dataType : "text",
					url : "${contextPath}/travel/scheduleInsert",
					processData : true,                                                      
					contentType: "application/json; charset-utf-8", 
					beforeSend : function(xhr) {
				        xhr.setRequestHeader(csrf_headername, csrf_token);
				    },
					success : function(data) {
						console.log("성공");
						schedule_no = data;
						for(let i = 0; i < len; i++){
			    			let frmObj = new Object();
							frmObj.schedule_day = $("#scheduleFrm").find("[name='schedule_day']")[i].value;
							frmObj.schedule_order = $("#scheduleFrm").find("[name='schedule_order']")[i].value;
							frmObj.tour_no = $("#scheduleFrm").find("[name='tour_no']")[i].value;
							frmObj.schedule_no = schedule_no;
							
							frmArray.push(frmObj);		
							$.ajax({
								type : "post",
								data : JSON.stringify(frmObj),
								dataType : "text",
								url : "${contextPath}/travel/sdInsert",
								processData : true,                                                      
								contentType: "application/json; charset-utf-8", 
								beforeSend : function(xhr) {
							        xhr.setRequestHeader(csrf_headername, csrf_token);
							    },
								success : function() {
									console.log("성공");
								},
								error : function(request, error) {         
									console.log("에러");
							    },
							});
						} 
						
						alert("일정이 저장되었습니다.");
						location.href= "${contextPath}";
					},
					error : function(request, error) {    
						console.log("에러");
				    },
				}); 
			}	 		
			
			
		});
	    
	});
	
	var area = "${area}";
	   
	   var arr = new Array();
	    <c:forEach items="${area}" var="item">        
	            arr.push({area_code: "${item.area_code}"
	                    , area_detail_code : "${item.area_detail_code}"
	                    , area_english_title : "${item.area_english_title}"
	                    , area_name : "${item.area_name}"
	                    , area_detail_name : "${item.area_detail_name}"
	                    , area_latitude : "${item.area_latitude}"
	                    , area_longitude : "${item.area_longitude}"});
	    </c:forEach>
	    
	    var latitude = null;
	    var longitude = null;
	   
	   for(var i = 0 ; i < arr.length; i ++){    
	           if (arr[i].area_code == code && arr[i].area_detail_code == detailCode) {
	         $("h2.area_name").text(arr[i].area_name + " " + arr[i].area_detail_name);
	         $("h4.area_english_title").text(arr[i].area_english_title);
	            latitude = arr[i].area_latitude;
	            longitude = arr[i].area_longitude;
	      }
	   }
   
   /* ------- 검색부분 ------- */
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');
		
		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');
		
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	});
   
	var type0 = $(".tourType0").length;
	var type1 = $(".tourType1").length;
	var type2 = $(".tourType2").length;
	
	$(".tab-0").on("click", function(event) {
		$(".selPlace div.tourType1").hide();
		$(".selPlace div.tourType2").hide();
// 		for (var i = 0; i < type1; i++) {
// 			$(".selPlace .tourType1").eq(i).parent(".itemBox").hide();
// 		}
// 		for (var i = 0; i < type2; i++) {
// 			$(".selPlace .tourType2").eq(i).parent(".itemBox").hide();
// 		}
	});
	$(".tab-1").on("click", function(event) {
		for (var i = 0; i < type0; i++) {
			$(".selPlace .tourType0").eq(i).parent(".itemBox").hide();
		}
		for (var i = 0; i < type2; i++) {
			$(".selPlace .tourType2").eq(i).parent(".itemBox").hide();
		}
	});
	$(".tab-2").on("click", function(event) {
		for (var i = 0; i < type0; i++) {
			$(".selPlace .tourType0").eq(i).parent(".itemBox").hide();
		}
		for (var i = 0; i < type1; i++) {
			$(".selPlace .tourType1").eq(i).parent(".itemBox").hide();
		}
	});
	
	$(".tab-0").click(function() {
		$(".tourType0").parent(".placeHoverRight").show();
		$(".tourType1").parent(".placeHoverRight").hide();
		$(".tourType2").parent(".placeHoverRight").hide();
	});
	$(".tab-1").click(function() {
		$(".tourType0").parent(".placeHoverRight").hide();
		$(".tourType1").parent(".placeHoverRight").show();
		$(".tourType2").parent(".placeHoverRight").hide();
	});
	$(".tab-2").click(function() {
		$(".tourType0").parent(".placeHoverRight").hide();
		$(".tourType1").parent(".placeHoverRight").hide();
		$(".tourType2").parent(".placeHoverRight").show();
	});
	$(".tab-3").click(function() {
		$(".tourType0").parent(".placeHoverRight").show();
		$(".tourType1").parent(".placeHoverRight").show();
		$(".tourType2").parent(".placeHoverRight").show();
	});
	
	//경진
	$('i#infoItem').click(function(e){
		e.preventDefault();
		$('div#myModal').modal("show");
		
		var imgSrc = $(this).parent().parent().parent().prev("#p_image").attr("src");
		var tour_no = $(this).parent().parent().parent().prevAll(".tour_no").val();
		
		$(".modal-title").text($(this).parent().prevAll("span.ellipsis").text());
		$(".modalBox img").attr("src", imgSrc);
		$(".modal-address").text($(this).parent().parent().next(".ellipsis").text());
		$(".modal-zipcode").text($(this).parent().parent().parent().prevAll("#zipcode").val());
		$("input.modal_tourNo").val(tour_no);
	});
	
	$(".addList").click(function() {
		var tour_no = $("input.modal_tourNo").val();
		
		$("input[data-tourNo='" + tour_no + "']").parent(".placeHoverRight").insertBefore(".show .itemBoxWrap .addPlace");
		$("#myModal").modal("hide");
	});
	$(".close").click(function() {
		$("#myModal").modal("hide");
	});
</script>
</body>
</html>