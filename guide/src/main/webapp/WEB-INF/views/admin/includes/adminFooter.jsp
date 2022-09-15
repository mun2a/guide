<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Guide &copy; GOGO 2022</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
    
    
      <!-- infoModal-->
      <div id="modal">
		  <div class="modal fade" id="infoModal" tabindex="-1"  tabindex="-1" role="dialog" aria-labelledby="infoModalLabel" aria-hidden="true">
		    <div class="modal-dialog" role="document">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h5 class="modal-title" id="infoModalLabel">Information</h5>
		          <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
		          x
		          </button>
		        </div>
		        <div class="modal-body">
			        <!-- msg -->
		        </div>
		        <div class="modal-footer">
		          <button class="btn btn-primary" type="button" data-bs-dismiss="modal">닫기</button>
		        </div>
		      </div>
		    </div>
		  </div>
	  </div>
    

    <!-- Bootstrap core JavaScript-->
    <script src="${contextPath }/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${contextPath }/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${contextPath }/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${contextPath }/resources/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <%-- <script src="${contextPath }/resources/admin/vendor/chart.js/Chart.min.js"></script> --%>
    	<!-- table -->
    <script src="${contextPath }/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${contextPath }/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    

    <!-- Page level custom scripts -->
<%--     <script src="${contextPath }/resources/admin/js/demo/chart-area-demo.js"></script>
    <script src="${contextPath }/resources/admin/js/demo/chart-pie-demo.js"></script>
    <script src="${contextPath }/resources/admin/js/demo/chart-bar-demo.js"></script> --%>
    	<!-- table -->
    <script src="${contextPath }/resources/admin/js/demo/datatables-demo.js"></script>

</body>
	
	<%-- 바디 끝 --%>

<script type="text/javascript">

	$(document).ready(function(){
		
		var msg = "";
		msg += "${msg}";
		
		$(".modal-body").append(msg);
		if(msg != "") {
			$("#infoModal").modal("show");
		}
		
		
	});

</script>
	
	<%-- <%@ include file="../../common/mainfooter.jsp"%> --%>