<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div class="LoginOuter">
<br><br><br>
<div class="loginContainer">
<form method="post" action="loginCheck.me">
<div class="input">
<img src="${contextPath }/resources/images/logo.png" style="width:300px;">
<br><br>
<label style="font-size:16px; margin-left:30px;">로그인 후에 이용하실 수 있습니다.</label>
<br><br>
<input placeholder="아이디" name="mId" class="inputArea" type="text"><br>
<br>
<input placeholder="비밀번호" name="mPwd" type="password"  class="inputArea"><br><br><br>
<button type="submit" class="loginBtn" >로그인</button>
<br>
<p style="float:right; margin-right:100px;"><span class="glyphicon glyphicon-asterisk"></span><a href="showJoinPage1.me">회원가입하기</a></p>
</div>
</form>
</div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>