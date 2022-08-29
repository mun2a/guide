<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="./cssLink.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/iconfont.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/slick.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/slick-theme.css"/>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<body>
<%@ include file="./mainheader.jsp"%>
   

<%-- 바디 시작 --%>
<div id="demo" class="carousel slide" data-ride="carousel"> 
   <div class="carousel-inner"> 
      <div class="carousel-item active" style="height:450px; background-image: url('https://i.ytimg.com/vi/gAjKic1Dlu4/maxresdefault.jpg');background-size: cover; background-repeat: no-repeat; background-position: center;"> 
      </div>
      <c:forEach items="${areaList}" begin="1" end="3" var="areaList">
         <div class="carousel-item" style="height:450px; background-image: url('${areaList.area_image}');background-size: cover; background-repeat: no-repeat; background-position: center;"> 
         </div> 
      </c:forEach> 
      <a class="carousel-control-prev" href="#demo" data-slide="prev"> 
         <span class="carousel-control-prev-icon" aria-hidden="true"></span> 
      </a> 
      <a class="carousel-control-next" href="#demo" data-slide="next"> 
         <span class="carousel-control-next-icon" aria-hidden="true"></span> 
      </a> 
      <ul class="carousel-indicators"> 
         <li data-target="#demo" data-slide-to="0" class="active"></li> 
         <li data-target="#demo" data-slide-to="1"></li> 
         <li data-target="#demo" data-slide-to="2"></li> 
         <li data-target="#demo" data-slide-to="3"></li> 
      </ul> 
   </div>
</div>   

<section id="portfolio" class="portfolio margin-top-120">
   <!-- Portfolio container-->
   <div class="d-flex justify-content-center">
      <div style="width: 1300px;">
         <div class="row">
            <div class="main-portfolio roomy-80">
               <div>
                  <div class="head_title text-center sm-text-center wow fadeInDown pb-3">
                     <h3><strong>여행지 선택하기</strong></h3>
                  </div>
               </div>
   
               <div class="d-flex justify-content-center mb-3">
                  <div class="filters-button-group text-right sm-text-center">
                     <button class="btn button is-checked" data-filter="*">전체</button>
                     <button class="btn button" data-filter=".metal">서울/경기</button>
                     <button class="btn button" data-filter=".transition">광역시/특별자치</button>
                     <button class="btn button" data-filter=".alkali">강원도</button>
                     <button class="btn button" data-filter=".ar">경상도</button>
                     <button class="btn button" data-filter=".ar2">전라도</button>
                     <button class="btn button" data-filter=".ar3">충청도</button>
                  </div>
               </div>
               <div style="clear: both;"></div>
   
               <div class="grid">
                  <c:forEach items="${areaList}" var="areaList">
                     <c:if test="${areaList.area_code == 0}">
                        <div class="grid-item metal" onclick="location.href ='${contextPath}/travel/schedule?area_code=${areaList.area_code}&area_detail_code=${areaList.area_detail_code}'">
                           <input type="hidden" name="area_code" value="${areaList.area_code}">
                           <input type="hidden" name="area_detail_code" value="${areaList.area_detail_code}">
                           <img alt="" src="${areaList.area_image}">
                           <div class="grid_hover_area d-flex flex-row justify-content-center align-items-center">
                              <div class="girid_hover_text text-center">
                                 <h4 class="text-white">${areaList.area_english_title}</h4>
                                 <p class="text-white">${areaList.area_name}&nbsp;${areaList.area_detail_name}</p>
                              </div>
                           </div>
                           <!-- End off grid Hover area -->
                        </div>
                     </c:if>
                  </c:forEach>
                  
                  <c:forEach items="${areaList}" var="areaList">
                     <c:if test="${areaList.area_code == 1}">
                        <div class="grid-item transition" onclick="location.href ='${contextPath}/travel/schedule?area_code=${areaList.area_code}&area_detail_code=${areaList.area_detail_code}'">
                           <img alt="" src="${areaList.area_image}">
                           <div class="grid_hover_area d-flex flex-row justify-content-center align-items-center">
                              <div class="girid_hover_text text-center">
                                 <h4 class="text-white">${areaList.area_english_title}</h4>
                                 <p class="text-white">${areaList.area_name}&nbsp;${areaList.area_detail_name}</p>
                              </div>
                           </div>
                           <!-- End off grid Hover area -->
                        </div>
                     </c:if>
                  </c:forEach>
                  
                  <c:forEach items="${areaList}" var="areaList">
                     <c:if test="${areaList.area_code == 2}">
                        <div class="grid-item alkali" onclick="location.href ='${contextPath}/travel/schedule?area_code=${areaList.area_code}&area_detail_code=${areaList.area_detail_code}'">
                           <img alt="" src="${areaList.area_image}">
                           <div class="grid_hover_area d-flex flex-row justify-content-center align-items-center">
                              <div class="girid_hover_text text-center">
                                 <h4 class="text-white">${areaList.area_english_title}</h4>
                                 <p class="text-white">${areaList.area_name}&nbsp;${areaList.area_detail_name}</p>
                              </div>
                           </div>
                           <!-- End off grid Hover area -->
                        </div>
                     </c:if>
                  </c:forEach>
                  
                  <c:forEach items="${areaList}" var="areaList">
                     <c:if test="${areaList.area_code == 3}">
                        <div class="grid-item ar" onclick="location.href ='${contextPath}/travel/schedule?area_code=${areaList.area_code}&area_detail_code=${areaList.area_detail_code}'">
                           <img alt="" src="${areaList.area_image}">
                           <div class="grid_hover_area d-flex flex-row justify-content-center align-items-center">
                              <div class="girid_hover_text text-center">
                                 <h4 class="text-white">${areaList.area_english_title}</h4>
                                 <p class="text-white">${areaList.area_name}&nbsp;${areaList.area_detail_name}</p>
                              </div>
                           </div>
                           <!-- End off grid Hover area -->
                        </div>
                     </c:if>
                  </c:forEach>
                  
                  <c:forEach items="${areaList}" var="areaList">
                     <c:if test="${areaList.area_code == 4}">
                        <div class="grid-item ar2" onclick="location.href ='${contextPath}/travel/schedule?area_code=${areaList.area_code}&area_detail_code=${areaList.area_detail_code}'">
                           <img alt="" src="${areaList.area_image}">
                           <div class="grid_hover_area d-flex flex-row justify-content-center align-items-center">
                              <div class="girid_hover_text text-center">
                                 <h4 class="text-white">${areaList.area_english_title}</h4>
                                 <p class="text-white">${areaList.area_name}&nbsp;${areaList.area_detail_name}</p>
                              </div>
                           </div>
                           <!-- End off grid Hover area -->
                        </div>
                     </c:if>
                  </c:forEach>
                  
                  <c:forEach items="${areaList}" var="areaList">
                     <c:if test="${areaList.area_code == 5}">
                        <div class="grid-item ar3" onclick="location.href ='${contextPath}/travel/schedule?area_code=${areaList.area_code}&area_detail_code=${areaList.area_detail_code}'">
                           <img alt="" src="${areaList.area_image}">
                           <div class="grid_hover_area d-flex flex-row justify-content-center align-items-center">
                              <div class="girid_hover_text text-center">
                                 <h4 class="text-white">${areaList.area_english_title}</h4>
                                 <p class="text-white">${areaList.area_name}&nbsp;${areaList.area_detail_name}</p>
                              </div>
                           </div>
                           <!-- End off grid Hover area -->
                        </div>
                     </c:if>
                  </c:forEach>
   
               </div>
               <div style="clear: both;"></div>
            </div>
         </div>
      </div>
      <!-- Portfolio container end -->
   </div>
</section>
<!-- End off portfolio section -->
   
<%-- 바디 끝 --%>

   
<%@ include file="./mainfooter.jsp"%>
<%@ include file="./jsLink.jsp"%>
<script src="${contextPath}/resources/js/jquery.magnific-popup.js"></script>
<script src="${contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="${contextPath}/resources/js/slick.min.js"></script>
<script src="${contextPath}/resources/js/js.isotope.js"></script>
<script src="${contextPath}/resources/js/jquery.collapse.js"></script>
<script src="${contextPath}/resources/js/bootsnav.js"></script>

<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

<script src="${contextPath}/resources/js/plugins.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
   $(".move").on("click", function(e) {
      e.preventDefault();

      actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
      actionForm.attr("action", "/board/read");
      actionForm.submit();
   });

//    $(".carousel-item").index(1).addClass("active");
   alert($(".carousel-item").index(1).html());
});
</script>
</body>
</html>