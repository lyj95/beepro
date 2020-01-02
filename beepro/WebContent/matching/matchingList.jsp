<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>NAME</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/matching/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/matching/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/matching/css/agency.css" rel="stylesheet">

  <!-- jquery -->
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

  <!-- heart button https://codepen.io/kieranfivestars/pen/PwzjgN-->
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<body id="page-top">

  <jsp:include page="common/sub_nav.jsp"></jsp:include>
  
  <!-- Header -->
  <header class="masthead" style="background-color: rgba(75,97,207);">
    <div class="container">
      <div class="intro-text" style="padding-top: 150px; padding-bottom: 100px;">
        <div class="intro-lead-in">by project</div>
        <div class="intro-heading text-uppercase">matching</div>
      </div>
    </div>
  </header>

  
  <div class="keywords">
      <div class="container">
        <div class="row" id="keywordBtns">
            <button class="btn btn-outline-primary" style="margin-right: 30px;">#keyword</button>
            <button class="btn btn-outline-primary" style="margin-right: 30px;">#keyword</button>
            <button class="btn btn-outline-primary" style="margin-right: 30px;">#keyword</button>
            <button class="btn btn-outline-primary" style="margin-right: 30px;">#keyword</button>
            <button class="btn btn-outline-primary" style="margin-right: 30px;">#keyword</button>
        </div>    
      </div>
  </div>
  
  <!-- project -->
  <section class="bg-light page-section">
    <div class="container">
        
        <div class="row" >
          <div class="col-3">
              <div class="chk-block" style="margin-top:50px">
                  search
                  <hr>
                  <input type="checkbox"> java<br>
                  <input type="checkbox"> Python<br>
                  <input type="checkbox"> C/C++<br>
                  <input type="checkbox"> php<br>
                  <input type="checkbox"> SQL<br>
                  <input type="checkbox"> Go<br>
                  <hr>
                  <input type="checkbox"> html<br>
                  <input type="checkbox"> css<br>
                  <input type="checkbox"> javascript<br>
                  <div><button type='submit'>검색</button></div>
              </div>
          </div>
          <div class="col-9">
            <div class="row" style="float:right; ">
            	<c:if test="${!empty sessionScope.u_id }">
            		<button onclick="location.href='matching/matchingWriting.jsp'" type="button" class="col-1-4 btn btn-primary" style="width:200px; height:35px;">글쓰기</button>
            	</c:if>
            </div>
              <!-- 게시물 -->
            	<c:forEach var="matchingVo" items="${matchingList}" varStatus="matching">
            		<div class="row post-card" <c:if test="${matching.index == 0 }">style="margin-top:50px"</c:if>>
	                    <div class="col-lg-12">
	                        <div class="row">
	                            <div class="col-lg-11 col-sm-10">
	                            <h4><a href="matching?command=matchingView&project_seq=${matchingVo.project_seq }" >${matchingVo.title }</a></h4>
	                        </div>
	                        <div class="col-lg-1 col-sm-2">
	                            <!-- heart -->
	                            <i class="heart" style="float: right;"></i>
	                        </div>
	                        <hr>
	                        </div>
	                        <div class="row">
	                            <div class="col-lg-5" >
	                                                                  모집 인원  : ${matchingVo.need_person}명 <br>
	                                                                  위치 : ${matchingVo.location}<br><br>
	                                                                  프로그램 및 언어 능력 : ${matchingVo.skill}
	                            </div>
	                            <div class="col-lg-6">
	                                                                  프로젝트 시작일 : ${matchingVo.startdate}<br> 
	                                                                  프로젝트 마감일 : ${matchingVo.enddate }<br>
	                            </div>
	                        </div>
	                    </div>
	                </div>
				</c:forEach>
                <!-- 게시물 end -->
                <div class="row" style="display: block;">
                    <nav aria-label="Page navigation example">
                      <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                          <a class="page-link" href="#" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                          <a class="page-link" href="#">Next</a>
                        </li>
                      </ul>
                    </nav>
                </div>
          </div>
      </div>
      
    </div>
</section>

  <jsp:include page="common/footer.jsp"></jsp:include>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/agency.js"></script>

</body>

</html>
    