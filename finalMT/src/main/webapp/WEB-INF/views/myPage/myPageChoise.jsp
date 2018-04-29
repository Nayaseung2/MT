<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모두의 TV</title>
<style>

@import url(//fonts.googleapis.com/earlyaccess/hanna.css); 

.outer {
	width: 95%;
	margin-top: 5%;
	margin-left: 2%;
	margin-right: 2%;
	font-family: 'Hanna', sans-serif;
}

.aText {
	font-size: 20px;
}

.csArea {
	display: inline-block;
	background-color: hsla(0, 100%, 90%, 0.1);
	width: 60%;
	height: 400px;
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

	<br />
	<br />

		<div align="center" class="outer">
			<div class="csArea">
				<br/>
				<br/>
				<h1>MyPage의 메뉴를 선택해주세요.</h1>
				<br/>
				<br/>
				<br/>
				<div>
					<img src="${ contextPath }/resources/images/myPage/list.png" width="100px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="${ contextPath }/resources/images/myPage/edit.png" width="100px"/>
				</div>
				<br/>
				<div>
					<a class="aText" href="${ contextPath }/myPageList.mp?mId=${ loginUser.mId }">내 문의 내역</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="aText" href="${ contextPath }/myPageMain.mp">정보 수정 / 탈퇴</a>
				</div>
			</div>	
			<br/>
			<br/>
		</div>

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