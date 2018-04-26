<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모두의 TV</title>
<!-- sdf -->
<style>

@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

.csArea {
	margin-top: 6%;
}

.csBtn {
	margin-top: 3%;
}

</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="${ contextPath }/resources/css/fontawesome.min.css">

</head>
<body>

	<jsp:include page="../common/menubar.jsp" /> 

		<div align="center" class="csArea">
			<img src="${ contextPath }/resources/images/celebration.png"/>
			<br/><br/>
			<h3 style="font-family: 'Hanna', sans-serif;">모두의 TV 회원가입을 축하드립니다.<br/>로그인 후, 모두의 TV를 마음껏 즐겨주세요!</h3>
		</div>					
				
		<div class="csBtn" align="center">
			<button class="btn btn-danger" style="font-size:20px;" onclick="goLogin();">로그인</button>
		</div>		
		
		<script>
		
			function goLogin(){
				
				location.href="${ contextPath }/showLoginPage.me";
			}
		
		</script>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>