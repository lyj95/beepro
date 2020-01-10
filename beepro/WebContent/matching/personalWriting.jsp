<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BEEPRO - 글 작성</title>

<link href="${pageContext.request.contextPath}/matching/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/matching/css/jquery.tag-editor.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/css/agency.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/css/notice.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.js"></script>
<script src="js/plugins/tagEditor/jquery.caret.min.js"></script>
<script src="js/plugins/tagEditor/jquery.tag-editor.js"></script>
<script type="text/javascript">
      (function($) {
          function floatLabel(inputType) {
             $(inputType).each(function() {
                var $this = $(this);
                // on focus add cladd active to label
                $this.focus(function() {
                   $this.next().addClass("active");
                });
                //on blur check field and remove class if needed
                $this.blur(function() {
                   if ($this.val() === '' || $this.val() === 'blank') {
                      $this.next().removeClass();
                   }
                });
             });
          }
          
          $(document).ready(function(){
             $('#skill').tagEditor({placeholder : '언어 및 프로그램 능력을 작성하세요'});
          });
          // just add a class of "floatLabel to the input field!"
          floatLabel(".floatLabel");
       })(jQuery);
      
      $(document).ready(function(){
          $("#submit").click(function(){
         if($("#title").val().length==0){alert("프로젝트 제목을 입력하세요."); $("title").focus(); return false;}
         if($("#skill").val().length==0){alert("프로그램 능력을 입력하세요."); $("skill").focus(); return false;}
         if($("#emp_category").val().length==0){alert("희망 분야를 입력하세요."); $("emp_category").focus(); return false;}
         if($("#content").val().length==0){alert("상세 내용을 입력하세요."); $("content").focus(); return false;}
       });
       });
</script>
</head>
<body>
	  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	    <div class="container">
	      <a class="navbar-brand js-scroll-trigger" href="index.jsp">BeePro	</a>
	      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	        Menu
	        <i class="fas fa-bars"></i>
	      </button>
	      <div class="collapse navbar-collapse" id="">
	        <ul class="navbar-nav text-uppercase ml-auto">
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="#matching" id="match-sub" >매칭 matching</a>
	            <ul class="sub-nav">
	              <li><a class="nav-link" href="project.jsp">by project</a></li>
	              <li><a class="nav-link" href="personal.jsp">by personal</a></li>
	            </ul>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="#about">협업 cowork</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="mypage.jsp">마이페이지</a>
	          </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
	  <!-- 나중에 post로 바꾸기 -->
	<form action="../personMatching" method="get">
	<input type="hidden" name="command"  value="personalWrite"/>
   	<div class="container margin-t-100">
         <!--  General -->
         <div class="form-group">
            <h2 class="heading">새 글 작성</h2>
            <div class="controls">
               <input type="text" id="title" class="floatLabel" name="title" placeholder="제목을 입력하세요">

            </div>
            <div class="controls2">
               <input type="text" id="skill" class="floatLabel" name="skill" data-role="tagsinput" >
            </div>
         </div>
         
         <div class="grid">
            <div class="col-1-3 col-1-3-sm">
               <div class="controls">
                  <i class="fa fa-sort"></i> <select class="floatLabel" id="emp_category" name="emp_category">
                     <option value="">지원하고자 하는 카테고리를 선택하세요.</option>
                     <option value="백엔드">백엔드</option>
                     <option value="프론트엔드">프론트엔드</option>
                  </select>
                </div>
               </div>
            </div>
            <br />
            <div class="grid">

               <div class="controls">
                  <p class="info-text margin-b-10">상세 내용</p>
                  <textarea name="content" class="floatLabel" id="content" placeholder="상세 내용을 입력하세요."></textarea>
               </div>
               <input type="submit" id="submit" class="col-1-4 btn btn-primary" style="float: right;"/>
            </div>

         </div>
         <!-- /.form-group -->
      </form>
</body>
</html>