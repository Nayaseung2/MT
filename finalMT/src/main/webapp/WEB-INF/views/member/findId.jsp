<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  -->
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${ contextPath }/resources/css/fontawesome.min.css">

<title>Login</title>
<style>
	
	
	@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
	
	
	.findDiv {
		display: block;
		font-family: 'Hanna', sans-serif;
	}
	
	.inputBox {
		text-align: center;
		border: 2px solid rgba(255, 158, 0, 0.8);
		border-radius: 30px;
	}
	
	
	
	
	
	
	
	
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="LoginOuter">
		<br>
		<br>
		<br>
		<div class="findContainer">
			<div class="findDiv" align="center">
					<img src="${ contextPath }/resources/images/member/search.png">
					<h1>아이디 찾기</h1>
					<h4>* 가입하신 이름과 이메일이 일치할 경우, 이메일로 아이디가 발송됩니다.</h4>
					<br/>
					
					<h3>이름을 입력해주세요.</h3>
					<input type="text" class="inputBox" id="joinName" name="joinName" style="font-size:22px; width:180px;">
					
					<h3>가입하신 이메일을 입력해주세요.</h3>
					<input type="email" class="inputBox" id="joinEmail" name="joinEmail" style="font-size:22px; width:330px;">
					
					<br/>
					<br/>
					<button class="btn btn-danger" style="font-size:20px;" type="submit" id="submitBtn">확 인</button>
					<br/>
				<script>
				
					$(function(){
						
						$("#submitBtn").click(function(){
							
							var joinName = $("#joinName").val();
							var joinEmail = $("#joinEmail").val();
							
							$.ajax({
					            url : "findIdEmail.me",
					            type : "GET",
					            data : {"joinName": joinName,
					            			"joinEmail": joinEmail},
					            success : function(data){
					            	
					            	console.log(data);
					            	
					            	 if(data.string === "success"){
										 
					            		alert("이메일로 아이디가 발송됐습니다.");
					            		location.reload();
										
									 } else {
										
										alert("일치하는 회원 정보가 없습니다.");
										location.reload();
									 }
					            },
					            error : function(data){
					                alert("error");
					            }
						     });
						});
					});
				
				
				</script>
				
			</div> 
		</div>
	</div>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>