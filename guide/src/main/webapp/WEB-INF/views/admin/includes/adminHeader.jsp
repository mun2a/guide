<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
	<%@ include file="../../common/cssLink.jsp"%>
	<%-- <%@ include file="../../common/mainheader.jsp"%> --%>
	



	<head>
	
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>Admin Home</title>
	
	    <!-- Custom fonts for this template-->
	    <link href="${contextPath }/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	
	    <!-- Custom styles for this template-->
	    <link href="${contextPath }/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
	
	</head>
	
	

	<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${contextPath }">
                <div class="sidebar-brand-icon rotate-n-15">
                    <!-- <i class="fas fa-laugh-wink"></i> -->
                    <img alt="x" src="${contextPath }/resources/admin/img/logo_white.png" style="height: 35px;">
                </div>
                <div class="sidebar-brand-text mx-3" style="margin-left: 0.5rem!important;">GOGO</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            
            


            <!-- Nav Item - 회원 관리(memberMG) -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsMemberMG"
                    aria-expanded="true" aria-controls="collapsMemberMG">
                    <span>회원 관리</span>
                </a>
                <div id="collapsMemberMG" class="collapse" aria-labelledby="headingMemberMG" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${contextPath}/admin/memberMG/memberList">회원 목록</a>
                        <a class="collapse-item" href="${contextPath}/admin/memberMG/memberWDList">탈퇴한 회원 목록</a>
                    </div>
                </div>
            </li>
            
            
            <!-- Nav Item - 여행지 관리(tourMG) -->
<%--             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsTourMG"
                    aria-expanded="true" aria-controls="collapsTourMG">
                    <span>여행지 관리</span>
                </a>
                <div id="collapsTourMG" class="collapse" aria-labelledby="headingTourMG" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <a class="collapse-item" href="#">여행지 통계</a> -->
                        <a class="collapse-item" href="${contextPath}/admin/tourMG/tourList">여행지 목록</a>
                    </div>
                </div>
            </li> --%>
            <li class="nav-item">
	            <a class="nav-link" href="${contextPath}/admin/tourMG/tourList">
	            	<span>여행지 관리</span> 
	            </a>
            </li>
            
            
            <!-- Nav Item - 문의글 관리(qnaMG) -->
<%--             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsQnaMG"
                    aria-expanded="true" aria-controls="collapsQnaMG">
                    <span>문의글 관리</span>
                </a>
                <div id="collapsQnaMG" class="collapse" aria-labelledby="headingQnaMG" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${contextPath}/admin/qnaMG/qnaList">문의글 전체 목록</a>
                    </div>
                </div>
            </li> --%>
            
            <li class="nav-item">
	            <a class="nav-link" href="${contextPath}/admin/qnaMG/qnaList">
	            	<span>문의글 관리</span> 
	            </a>
            </li>
            
            
            <!-- Nav Item - 관리자 관리(adminMG) -->
<%--             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsAdminMG"
                    aria-expanded="true" aria-controls="collapsAdminMG">
                    <span>관리자 관리</span>
                </a>
                <div id="collapsAdminMG" class="collapse" aria-labelledby="headingAdminMG" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${contextPath}/admin/adminMG/adminList">관리자 목록</a>
                    </div>
                </div>
            </li> --%>
            
            <li class="nav-item">
	            <a class="nav-link" href="${contextPath}/admin/adminMG/adminList">
	            	<span>관리자 관리</span> 
	            </a>
            </li>
            





            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                </nav>
                <!-- End of Topbar -->
                
                
                
                