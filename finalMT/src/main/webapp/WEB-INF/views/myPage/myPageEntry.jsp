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

#inputPwd {
	font-size: 25px;
	border: 1px solid rgb(180, 180, 180);
	border-radius: 7px;
	height: 35px;
	text-align: center;
}

#inputPwd:hover {
	border: 2px solid skyblue;

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
				<img src="${ contextPath }/resources/images/myPage/pwdCheck.png"/>
				<br/><br/>
				<h1>비밀번호를 한 번 더 확인합니다.</h1>
				<h4>MY PAGE 서비스로 이동을 위한 본인 인증 절차입니다.</h4>
			</div>	
			<br/>
			<br/>
				<input type="hidden" id="mPwd" name="mPwd" value="${ loginUser.mPwd }">
				<input type="password" id="inputPwd" name="inputPwd"> &nbsp;&nbsp;
				<button type="button" id="checkBtn" class="btn btn-danger" style="font-size:20px;">확 인</button>
				
			<script>
			
				$(function(){
					
					// 비밀번호 확인
					$("#checkBtn").click(function(){
						
						var mPwd = $("#mPwd").val(); // 진짜 비번
						var inputPwd = $("#inputPwd").val(); // 입력한 비번
						
						if($("#inputPwd").val() === ""){
							
							alert("비밀번호를 입력해주세요.");
							location.reload();
							
						} else {
							
							console.log(mPwd);
							console.log(inputPwd);
							$.ajax({
								url: "pwdCheck.mp",
								type: "post",
								data: {"mPwd": mPwd,
										"inputPwd": inputPwd},
								success: function(data){
									
									console.log(data.string);
									
									 if(data.string === "success"){
										 
										location.href="myPageMain.mp";
										
									 } else {
										
										alert("비밀번호가 일치하지 않습니다.");
										location.reload();
									} 	
								},
								error: function(data){
								}
							});
						}
					});
				});
			
			</script>		
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