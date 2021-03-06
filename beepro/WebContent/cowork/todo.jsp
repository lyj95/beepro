<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/matching/img/favicon.ico" type="image/x-icon">
<link href="${pageContext.request.contextPath}/cowork/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="${pageContext.request.contextPath}/cowork/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/cowork/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/cowork/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/cowork/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/cowork/js/sb-admin-2.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	/* jQuery(function($) {
		$(".container-fluid").css("display", "none");
		$(".container-fluid").fadeIn(500);
		$("a.transition").click(function(event) {
			event.preventDefault();
			linkLocation = this.href;
			$(".container-fluid").fadeOut(500, redirectPage);
		});
		function redirectPage() {
			window.location = linkLocation;
		}
	});

	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	}); */
</script>
<style type="text/css">
.container-fluid {
	animation: fadein 500ms ease-out;
	-moz-animation: fadein 2000ms ease-out; /* Firefox */
	-webkit-animation: fadein 2000ms ease-out; /* Safari and  Chrome */
	-o-animation: fadein 2000ms ease-out; /* Opera */
}

@
-webkit-keyframes fadein { /* Safari and Chrome */
	from {opacity: 0;
}

to {
	opacity: 1;
}

}
.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	margin: 20px auto;
	border-radius: 5px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title .btn {
	font-size: 13px;
	border: none;
}

.table-title .btn i {
	float: left;
	font-size: 16px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

.table-title {
	color: #4b5366;
	padding: 16px 25px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.show-entries select.form-control {
	width: 80px;
	margin: 0 5px;
}

.table-filter .filter-group {
	float: right;
	margin-left: 15px;
}

.table-filter input, .table-filter select {
	height: 34px;
	border-radius: 3px;
	border-color: #ddd;
	box-shadow: none;
}

.table-filter {
	padding: 5px 0 15px;
	border-bottom: 1px solid #e9e9e9;
	margin-bottom: 5px;
}

.table-filter .btn {
	height: 34px;
}

.table-filter label {
	font-weight: normal;
	margin-left: 10px;
}

.table-filter select, .table-filter input {
	display: inline-block;
	margin-left: 5px;
}

.table-filter input {
	width: 100px;
	display: inline-block;
}

.filter-group select.form-control {
	width: 80px;
}

.filter-icon {
	float: right;
	margin-top: 7px;
}

.filter-icon i {
	font-size: 16px;
	opacity: 0.7;
	margin-right:-20px;
	}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 80px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.view {
	width: 30px;
	height: 30px;
	color: #2196F3;
	border: 2px solid;
	border-radius: 30px;
	text-align: center;
}

table.table td a.view i {
	font-size: 22px;
	margin: 2px 0 0 1px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.status {
	font-size: 30px;
	margin: 2px 2px 0 0;
	display: inline-block;
	vertical-align: middle;
	line-height: 10px;
}

.text-success {
	color: #10c469;
}

.text-info {
	color: #62c9e8;
}

.text-warning {
	color: #FFC107;
}

.text-danger {
	color: #ff5b5b;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}

.rate {
  position: relative;
  height: 1.5rem;
  width: 7.5rem;
  background: url(${pageContext.request.contextPath}/cowork/images/off.svg);
  background-size: 1.5rem 1.5rem;
}

.rate_label {
  position: absolute;
  height: 100%;
  background-size: 1.5rem 1.5rem;
}

.rate_input {
  margin: 0;
  position: absolute;
  height: 1px; width: 1px;
  overflow: hidden;
  clip: rect(1px, 1px, 1px, 1px);
}

.rate .rate_label:nth-of-type(1) {
  z-index: 5;
  width: 20%;
}

.rate .rate_label:nth-of-type(2) {
  z-index: 4;
  width: 40%;
}

.rate .rate_label:nth-of-type(3) {
  z-index: 3;
  width: 60%;
}

.rate .rate_label:nth-of-type(4) {
  z-index: 2;
  width: 80%;
}

.rate .rate_label:nth-of-type(5) {
  z-index: 1;
  width: 100%;
}

.rate_input:checked + .rate_label,
.rate_input:focus + .rate_label,
.rate_label:hover {
  background-image: url(${pageContext.request.contextPath}/cowork/images/on.svg);
}

.rate_label:hover ~ .rate_label {
  background-image: url(${pageContext.request.contextPath}/cowork/images/off.svg);
}

#project_name {
	padding: 30px;
	width: 100%;
	height: auto;
	margin-top: 15px;
	border-radius: 5px;
	border: 1px solid rgb(75, 97, 207);
	font-size: 18px;
	cursor: pointer;
}

#add:hover { color:rgb(46,89,217);
             text-decoration:underline;
           }
</style>
<title>BEEPRO - 내 업무리스트</title>
</head>
<body>
	<div id="wrapper">
		<!-- 상단 메뉴 바 -->
		<!-- <div id="headers"></div> -->
		<jsp:include page="common/side_bar.jsp"></jsp:include>

		<!-- 내용이 들어갈 구역을 정의하는 div -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 내용이 들어갈 구역을 정의하는 div -->
			<div id="content">

				<!-- 왼쪽 메뉴 바 -->
				<!-- <div id="top_bar"></div> -->
				<jsp:include page="common/top_bar.jsp"></jsp:include>

				<!-- 본격적으로 내용이 담기는 div -->
				<div class="container-fluid">
					<div class="container">
						<div class="table-title">
							<div class="row">
								<div class="col-sm-4">
									<h2>
										<b>내 업무</b>
									</h2>
								</div>
							</div>
						</div>
							<div class="filter-group col-4">
							   <input type="text" class="form-control" size="50" style="border:0;" placeholder="검색하실 항목을 입력하세요">
							</div>
                          
	                         <div style="float:left; margin-left:360px; margin-top:-37.5px;"> 
	                          <button type="button" class="btn btn-primary">
								  <i class="fa fa-search"></i>
							    </button>
	                         </div>
                         
						<div class="table-wrapper">
  							<div class="table-filter">
								<div class="row">
									<div class="col-sm-3">
									</div>
									<div class="col-lg-12 col-sm-9">
										<div class="filter-group">
											<button class="btn btn-primary" onclick="location.href='cowork/todoForm.jsp'">업무 추가</button>
											<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#todoModal">
											  Launch demo modal
											</button> -->
										</div>
										<div class="filter-group">
											<label>중요도</label><select class="form-control">
												<option>선택</option>
												<option value="1">☆</option>
												<option value="2">☆☆</option>
												<option value="3">☆☆☆</option>
												<option value="4">☆☆☆☆</option>
												<option value="5">☆☆☆☆☆</option>
											</select>
										</div>
										<div class="filter-group">
									</div>
								</div>
							</div>
							<table class="table table-striped table-hover">
								<colgroup>
									<col width="5%">
									<col width="10%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr>
										<th>no</th>
										<th>업무명</th>
										<th>상태</th>
										<!-- <th>업무 내용</th> -->
										<th>담당자</th>
										<th>중요도</th>
										<th>타임라인</th>
										<!-- <th>마감</th> -->
										<!-- 진행정도에서 100%이 되면 업무 종료 확인 DB 값 -->
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty todoList }"> 
										<tr><td colspan="5">
											생성된 업무가 존재하지 않습니다 . 새 업무를 생성해주세요
										</td></tr>
									</c:if>
									
									
									<c:forEach var="todo" items="${todoList}" >
									<input type="hidden" id="projectSeq" value="${todo.projectSeq}">		
									<tr <c:if test="${todo.finishCk eq 'Y'}"> style="background: paleturquoise;"</c:if>>										
									<td>${todo.todoSeq}</td>
										<td>
											<small style="">${todo.category}</small><br>
											<a href="${pageContext.request.contextPath}/todo?command=todo-detail&seq=${todo.todoSeq}">
												${todo.title }
											</a></td>
										<%-- <td>${todo.content }</td> --%>
										<td>
											<div class="btn-group" style="width: 80%;">
											  <button type="button" id="statusbtn${todo.todoSeq}" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												${todo.status }
											  </button>
											  <div class="dropdown-menu">
											    <a class="dropdown-item" href="javascript:void(0)" onclick="updateTodoStatus(this, ${todo.todoSeq});">예정</a>
											    <a class="dropdown-item" href="javascript:void(0)" onclick="updateTodoStatus(this, ${todo.todoSeq});">진행 중</a>
											    <a class="dropdown-item" href="javascript:void(0)" onclick="updateTodoStatus(this, ${todo.todoSeq});">검토 중</a>
											    <a class="dropdown-item" href="javascript:void(0)" onclick="updateTodoStatus(this, ${todo.todoSeq});">승인됨</a>
											    <div class="dropdown-divider"></div>
											    <a class="dropdown-item" href="javascript:void(0)" onclick="updateTodoStatus(this, ${todo.todoSeq});">보류</a>
											    <a class="dropdown-item" href="javascript:void(0)" onclick="updateTodoStatus(this, ${todo.todoSeq});">완료</a>
											  </div>
											</div>
										</td>
										<td>${todo.manager }</td>
										<td>
										<div class="rate">
											<input class="rate_input" type="radio" name="priority${todo.todoSeq}" value="1" id="rate${todo.todoSeq}-1" <c:if test="${todo.priority eq '1'}">checked</c:if>/>
											<label class="rate_label" for="rate${todo.todoSeq}-1"></label>
											<input class="rate_input" type="radio" name="priority${todo.todoSeq}" value="2" id="rate${todo.todoSeq}-2" <c:if test="${todo.priority eq '2'}">checked</c:if>/>
											<label class="rate_label" for="rate${todo.todoSeq}-2"></label>
											<input class="rate_input" type="radio" name="priority${todo.todoSeq}" value="3" id="rate${todo.todoSeq}-3" <c:if test="${todo.priority eq '3'}">checked</c:if>/>
											<label class="rate_label" for="rate${todo.todoSeq}-3"></label>
											<input class="rate_input" type="radio" name="priority${todo.todoSeq}" value="4" id="rate${todo.todoSeq}-4" <c:if test="${todo.priority eq '4'}">checked</c:if>/>
											<label class="rate_label" for="rate${todo.todoSeq}-4"></label>
											<input class="rate_input" type="radio" name="priority${todo.todoSeq}" value="5" id="rate${todo.todoSeq}-5" <c:if test="${todo.priority eq '5'}">checked</c:if>/>
											<label class="rate_label" for="rate${todo.todoSeq}-5"></label>
										</div>
										</td>
										<td>
										<div class="progress">
										  <div class="progress-bar bg-info" role="progressbar" id="bar${todo.todoSeq}" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">&emsp;&emsp;${todo.startDate}~${todo.endDate}</div>
										</div>
										</td>
										<!-- <td>업무 종료</td> -->
									</tr>
									
									<script>
									$( document ).ready(function() {
										timeBar("bar${todo.todoSeq}","${todo.startDate}","${todo.endDate}");
									});
									</script>
									</c:forEach>
									
								</tbody>
							</table>
							<div class="clearfix">
								<div class="hint-text">
									Showing <b>${page.pageSize}</b> out of <b>${page.totalCount}</b> entries
								</div>
								<ul class="pagination">
									<!-- <li class="page-item"><a href="#">Previous</a></li> -->
									<c:forEach var="i" begin="${page.startPageNo}" end="${page.endPageNo}" step="1" varStatus="status">
										<!-- 페이징 보류 -->
										<%-- <li class="page-item<c:if test="${i eq page.pageNo}"> active</c:if>"><a href="javascript:pageNum(${i});" class="page-link">${i}</a></li> --%>
										<li class="page-item<c:if test="${i eq page.pageNo}"> active</c:if>"><a href="todo?command=todo-list&page=${status.count}" class="page-link">${status.count}</a></li>
									</c:forEach>
									<!-- 	<li class="page-item"><a href="#" class="page-link">Next</a></li> -->
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 푸터 -->
			<jsp:include page="common/footer.html"></jsp:include>
		</div>
	</div>
<script type="text/javascript">
/* 타임라인 퍼센티지 */
function timeBar(id, st, en){
	var start = st.split("-");									
	var end = en.split("-");
	
	var startDate = new Date(start[0],start[1]-1,start[2]);
	var endDate = new Date(end[0],end[1]-1,end[2]); 
	var today = new Date();
	var percent = "0%";
	if(today<startDate){			// 시작 예정
		percent ="0%";	
	} else if(endDate<today){		// 마감기한 지남
		percent ="100%";
	} else {						// 시작 후, 마감기한 전
		var total = (endDate - startDate); 
		var todayCnt = (today - startDate);
		percent = Math.round(todayCnt / total * 100)+"%"; 
	}
	$('#'+id).width(percent);
}
function pageNum(page){
	alert("ddd");
	var projectSeq = $("#projectSeq").val();
	$.ajax({
		url:'todo',
		type:'POST',
		data:{
			'command':'todo-list',
			'projectSeq':projectSeq,
			'page':page			
		},
		error:function(request, status, error){
			alert("페이지 변경 실패");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success:function(data, textStatus, jqXHR){
			alert("페이지 변경 실패");
		}
	});
}

/* 중요도 변경 */
$("input[name^=priority]").click(function(){
	var rate = this.getAttribute('id');	// id에 저장되어있는 1.todoSeq 2.check한 value -> 추출

	var todoSeq = rate.substr(4,1);
	var priority = rate.substr(7,1);
	var projectSeq = $("#projectSeq").val();
	
	$.ajax({
		url:'todo',
		type:'POST',
		data: {
			'command':'updateTodoPriority',
			'todoSeq':todoSeq,
			'projectSeq':projectSeq,
			'priority':priority			
		},
		error:function(request, status, error){
			alert("중요도 변경이 실패되었습니다");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success:function(data, textStatus, jqXHR){
			alert("중요도가 변경되었습니다");
		}
	});
});
/* 진행 상황 변경 */
function updateTodoStatus(txt, todoSeq){
	var status = $(txt).text();		// a태그에서 진행 상황 텍스트 추출
	$("#statusbtn"+todoSeq).text(status);	// 버튼 텍스트 변경
	var projectSeq = $("#projectSeq").val();
	
	$.ajax({
		url: 'todo',
		type: 'POST',
 		data: {
 			'command':'updateTodoStatus',
 			'todoSeq':todoSeq,
 			'projectSeq':projectSeq,
 			'status':status
 		},
		error:function(request, status, error){
			alert("상태 변경이 실패되었습니다");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success:function(data, textStatus, jqXHR){
			alert("진행 상태가 변경되었습니다");
		}
	});
}  
</script>

	<!-- 워크스페이스 모달  -->
	<div class="modal fade" id="workspaceModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"
						style="color: black;">워크 스페이스 이동</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body" style="font-size: 14px;">
					<div id="test100"></div>
					<c:choose>
						<c:when test="${empty projectVo}">
							<div id="none">
								이동할 워크스페이스가 존재하지 않습니다.<br> 매칭을 통해 생성하십시오.<br> <a
									class="btn btn-primary" href="${pageContext.request.contextPath}/matching?command=matchingAll">매칭하러가기</a>
							</div>
						</c:when>

						<c:otherwise>
	                                          이동하실 워크 스페이스를 선택하세요.
	                   <span style="font-size:13px; float:right;">
	                      <a href="${pageContext.request.contextPath}/matching?command=matchingAll" id="add">+ 추가하기</a>
	                   </span>
	               <c:forEach var="vo" items="${projectVo}">
	                  <c:if test="${vo.projectSeq eq projectSeq}">
								<div id="project_name" style="background-color:rgb(75,97,207); border:0px; color:white;"
									onclick="location.href='${pageContext.request.contextPath}/matching?command=selectOneProject&projectSeq=${vo.projectSeq}'">
									<div id="title" style="color:white;">${vo.projectName}</div>

									<div id="content">${vo.member}</div>

									<div id="period">${vo.startDate} - ${vo.endDate}</div>
								</div>
					  </c:if>
					   <c:if test="${vo.projectSeq ne projectSeq}">
								<div id="project_name"
									onclick="location.href='${pageContext.request.contextPath}/matching?command=selectOneProject&projectSeq=${vo.projectSeq}'">
									<div id="title">${vo.projectName}</div>

									<div id="content">${vo.member}</div>

									<div id="period">${vo.startDate} - ${vo.endDate}</div>
								</div>
					  </c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
    </div>
</body>
</html>