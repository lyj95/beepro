<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>  
<!DOCTYPE html>
<html>

<head>
	<!-- 세션값 가져오기 -->
	
<%-- 	<%
	String u_id = null;
	if (session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");
	}
	%>   
 --%>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>협업페이지</title>

</head>

<body id="page-top">
	<c:redirect url="/project?command=dashboard&projectSeq=${projectSeq}">
		<%-- <c:param name="NUM1" value="5"/> --%>
		<!-- index와 업무 진행상황 페이지에 차이점이 필요할때 사용 -->
	</c:redirect>

  <!-- Page Wrapper -->
  <div id="wrapper">

	<jsp:include page="common/side_bar.jsp"></jsp:include>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
		
        <div id="top_bar"></div>
		<jsp:include page="common/top_bar.jsp"></jsp:include>
		<!-- 페이지 시작 -->
        <div class="container-fluid">
         <div class="row">
            <!-- Area Chart -->
            <div class="col-xl-6 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">데드 라인</h6>

                </div>
                <!-- Card Body -->
                <div class="card-body">
                	<div style="width:100%;text-align:right;"><a href="#"><span style="margin-right:5px;font-size:12px;color:#1cc88a;">더보기+</span></a></div>
                </div>
              </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-6 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">프로젝트 진행율</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                	<div class="mb-1 small">Normal Progress Bar</div>
                 	<div class="progress mb-4">
	                    <div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                  	</div>
    	            <div class="mb-1 small">Small Progress Bar</div>
        	        <div class="progress mb-4">
            	       	<div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                  	</div>
                	<div style="width:100%;text-align:right;"><a href="#"><span style="margin-right:5px;font-size:12px; color:#1cc88a;">더보기+</span></a></div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">
            <!-- Area Chart -->
            <div class="col-xl-12 col-lg-12">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">이슈 관리</h6>

                </div>
                <!-- Card Body -->
                <div class="card-body">
                	<div style="width:100%;text-align:right;"><a href="#"><span style="margin-right:5px;font-size:12px;color:#1cc88a;">더보기+</span></a></div>
                </div>
              </div>
            </div>
          </div>
		</div>
		<!-- 페이지 시작 끝 -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer 시작 -->
	  <jsp:include page="common/footer.html"></jsp:include>      
      <!-- footer 끝  -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>
  
  


<script type="text/javascript">
   $(document).ready(function(){
      getUnread();
      getInfiniteUnread();
   });
</script>


  
</body>
</html>
