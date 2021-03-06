<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>  
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %> 
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%> 

<%	//네이버 로그인 관련
	String clientId = "클라이언트 ";//애플리케이션 클라이언트 아이디값
	String redirectURI = URLEncoder.encode("http://192.168.130.217:8787/beepro/naverCallback", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
 %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <title>BEEPRO - Login</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/matching/img/favicon.ico" type="image/x-icon">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/agency.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>

<style>

* {
	box-sizing: border-box;
}

body {
	background: #f6f5f7;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	height: 100vh;
	margin: -20px 0 50px;
}

h1 {
	font-weight: bold;
	margin: 0;
}

h2 {
	text-align: center;
}

p {
	font-size: 14px;
	font-weight: 100;
	line-height: 20px;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
}

a {
	color: #333;
	font-size: 14px;
	text-decoration: none;
	margin: 15px 0;
}

button {
	border-radius: 20px;
	border: 1px solid #fed136;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button:active {
	transform: scale(0.95);
}

button:focus {
	outline: none;
}

button.ghost {
	background-color: transparent;
	border-color: #FFFFFF;
}

form {
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 30px;
	height: 100%;
	text-align: center;
}

input {
	background-color: #eee;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	background-color: #fff;
	border-radius: 10px;
  	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
	position: relative;
	overflow: hidden;
	width: 768px;
	max-width: 100%;
	min-height: 600px;
}

.form-container {
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 50%;
	z-index: 2;
}

.container.right-panel-active .sign-in-container {
	transform: translateX(100%);
}

.sign-up-container {
	left: 0;
	width: 50%;
	opacity: 0;
	z-index: 1;
}

.container.right-panel-active .sign-up-container {
	transform: translateX(100%);
	opacity: 1;
	z-index: 5;
	animation: show 0.6s;
}

@keyframes show {
	0%, 49.99% {
		opacity: 0;
		z-index: 1;
	}
	
	50%, 100% {
		opacity: 1;
		z-index: 5;
	}
}

.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: transform 0.6s ease-in-out;
	z-index: 100;
}

.container.right-panel-active .overlay-container{
	transform: translateX(-100%);
}

.overlay {
	/* background: #FF416C; */
	background:rgba(75,97,207);
	/* background-position: 0 0; */
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
  	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
  	transform: translateX(50%);
}

.overlay-panel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	/* padding: 0 40px; */
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.overlay-left {
	transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
	transform: translateX(0);
}

.overlay-right {
	right: 0;
	transform: translateX(0);
}

.container.right-panel-active .overlay-right {
	transform: translateX(20%);
}

.social-container {
	margin: 20px 0;
}

.social-container a {
	border: 1px solid #DDDDDD;
	border-radius: 50%;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 5px;
	height: 40px;
	width: 40px;
}

.pwd{
	cursor:pointer;
}

</style>
<script type="text/javascript">
	window.onload = function(){
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
}

</script>
</head>
<body>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form method="post" action="../user?command=register">
                <h1>Create Account</h1>
                <div class="social-container">
						<span>네이버 / 구글 계정으로 회원가입</span>
						<br><br>
						<a href="<%=apiURL%>" class="social"><img src="img/naver.PNG" style="width: 35px; border-radius: 20px;"></a>
						<a href="#" class="social"><img src="img/google.png" style="width: 35px; border-radius: 20px;"></a>
					</div>
                <span>BEEPRO 계정 회원가입</span>
                <input type="text" name ="u_id" placeholder="ID" />
                <input type="email" name ="u_email" placeholder="Email" />
                <input type="text" name="u_name" placeholder="Name" />                
                <input type="password" name="u_pwd1" placeholder="Password" />
                <input type="password" name="u_pwd2" placeholder="Password check" />
                <button class="btn btn-primary" onclick="location.href='index.jsp'">Sign Up</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form method="post" action="../user?command=login">
				<h1>Sign in</h1>
                <div class="social-container">
					<span>네이버/구글 계정으로 로그인<br><br></span>
					<a href="<%=apiURL%>" class="social"><img src="img/naver.PNG" style="width: 35px; border-radius: 20px;"></a>
                    <a href="#" class="social"><img src="img/google.png" style="width: 35px; border-radius: 20px;"></a>
                    <!-- <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a> -->

                </div>
				
				<span>BEEPRO 계정으로 로그인</span>
                <input type="text" name ="u_id" placeholder="ID" />
                <input type="password" name="u_pwd" placeholder="Password" />
				<a class = pwd data-toggle="modal" data-target="#forgotPwd">Forgot your password?</a>
				
				<button class="btn btn-primary" onclick="location.href='index.jsp'">Sign In</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p>BEEPRO 계정으로 로그인</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Friend!</h1>
                    <p>BEEPRO와 함께 협업 시작</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
    
<!-- 비밀번호 찾기 모달 -->
<div class="modal fade" id="forgotPwd" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updatePwdLabel">비밀번호 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="../user?command=findPwd" method="post">
			<div class="modal-body">
			
			<label for="u_id">아이디</label>
			<input type="text" id="u_id" name ="u_id"/>
			
			<label for="u_name">이름</label>
			<input type="text" id="u_name" name ="u_name"/>
			
			<label for="u_email">이메일</label>
			<input type="email" id="u_email" name ="u_email"/>
			<!--<input type="submit" id="btn" value="pw찾기" />-->   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary">찾기</button>
      </div>
	</form>
    </div>
  </div>
</div>
<!-- 비밀번호 찾기 모달 end--> 
</body>
</html>

<!-- 기본틀 -->
<!-- <div class="form-container sign-up-container">
	<form action="#">
		<h1>Create Account</h1>
		<div class="social-container">
			<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
			<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
			<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
		</div>
		<span>or use your email for registration</span>
		<input type="text" placeholder="Name" />
		<input type="email" placeholder="Email" />
		<input type="password" placeholder="Password" />
		<button class="btn btn-primary">Sign Up</button>
	</form>
</div> -->

