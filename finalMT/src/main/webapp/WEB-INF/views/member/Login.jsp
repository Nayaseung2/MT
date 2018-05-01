<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  -->
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Login</title>
<style>
	.LoginOuter{
		width:800px;
		height:600px;
		margin-left:auto;
		margin-right:auto;
	}
	.loginContainer{
		width:500px;
		height:600px;
		margin-left:auto;
		margin-right:auto;
	}
	.inputArea{
		width:300px;
		height:50px;
		padding-left:10px;
	}
	.input{
		margin-left:100px;
	}
	.loginBtn{
		width:300px;
		height:50px;
		font-size:20px;
		background:rgba(235, 104, 100, 0.5);
		border:none;
		color:white;
		border-radius:5px;
	}
	/* 네이버 로그인  */
.loginByNaver{
width:300px; 
height:40px; 
border:1px solid lightgray;

}
.N{
	color:#00ff00; 
	font-size:20px;
	margin-left:80px;
}



	.findBtn{
		width:150px;
		height:40px;
		font-size:18px;
		background:rgba(235, 104, 100, 0.2);
		border:none;
		border-radius:5px;
	}






</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div class="LoginOuter">
<br><br><br>
<div class="loginContainer">
<form method="post" action="loginCheck.me">
<div class="input">
<img src="<%= request.getContextPath() %>/resources/images/logo.png" style="width:300px;">
<br><br>
<label style="font-size:16px; margin-left:30px;">로그인 후에 이용하실 수 있습니다.</label>
<br><br>
<input placeholder="아이디" name="mId" class="inputArea" type="text"><br>
<br>
<input placeholder="비밀번호" name="mPwd" type="password"  class="inputArea"><br><br><br>
<button type="submit" class="loginBtn" >로그인</button>
<br><br>
   <!--네이버 로그인  -->
<%
      String clientId = "fEGqjOAbb6lpxv2QAw23";//애플리케이션 클라이언트 아이디값";
      String redirectURI = URLEncoder.encode("https://127.0.0.1:8443/mt/naverLogin.me", "UTF-8");
      SecureRandom random = new SecureRandom();
      String state = new BigInteger(130, random).toString();
      String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
      apiURL += "&client_id=" + clientId;
      apiURL += "&redirect_uri=" + redirectURI;
      apiURL += "&state=" + state;
      session.setAttribute("state", state);
   %>  
<!-- 네이버 로그인 -->
   <div class="naverapi" >
   <a href="<%=apiURL %>" style="color:black;">
   <div class="loginByNaver" id="naverLogin" >
   <div style="margin-top:5px;">
   <label class="N" >N </label>&nbsp;네이버로 시작하기
   </div>
   </div>
   </a>
   </div>
<!-- 네이버 로그인 끝 -->  
<br/>

	<!-- 아이디/비밀번호 찾기 -->
	<button type="button" class="findBtn" id="findId">아이디 찾기</button>
	<button type="button" class="findBtn" id="findPwd">비밀번호 찾기</button>

<script>

	$(function(){
		
		$("#findId").click(function(){
			
			location.href="findId.me";
		});
		
		$("#findPwd").click(function(){
			
			location.href="findPwd.me";
		});
		
	});
	
</script>



 
<p style="float:right; margin-right:100px;"><span class="glyphicon glyphicon-asterisk"></span><a href="showJoinPage1.me">회원가입하기</a></p>
</div>
</form>
</div>
</div>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>