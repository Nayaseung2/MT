<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- sdf -->
<style>

@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

.outer {
	width: 95%;
	margin-top: 2%;
	margin-left: 2%;
	margin-right: 2%;
	font-family: 'Hanna', sans-serif;
}

.sidebar {
	display: inline-block;
	float: left;
}

.rightNav {
	display: inline-block;
	margin-left: 2%;
	width: 80%;
}

.sideBtn {
	width: 300px;
	height: 100px;
	margin-bottom: 2%;
	border-right: 3px solid hsl(0, 0%, 94%);
	border-bottom: 3px solid hsl(0, 100%, 90%);
	border-left: 0px solid white;
	border-top: 0px solid white;
	background-color: rgba(255, 255, 255, 0.5);
	font-size: 20px;
	text-align: left;
	padding-left: 15%;
}

.sideBtn:hover {
	border: 3px solid hsl(0, 100%, 75%);
	border-radius: 30px;
}

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

	<br />
	<br />

	<!-- 위에 배너 시작 -->
	<div class="page-banner-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="page-banner">
						<div class="page-title" style="font-family: 'Hanna', sans-serif;">
							<h1>Customer Service</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 위에 배너 끝 -->

	<!-- 위에 배너 빼고 전체 div 시작 -->
	<div class="outer">

		<div class="sidebar">
			<button class="sideBtn" onclick="personal();"><i class="fa fa-edit fa-2x"></i>&nbsp;&nbsp; 1:1 문의</button>
			<br />
			<button class="sideBtn" onclick="helpMain();"><i class="fa fa-search fa-2x"></i>&nbsp;&nbsp; 자주묻는 질문</button>
			<br />
			<button class="sideBtn" onclick="notice();"><i class="fa fa-bullhorn fa-2x"></i>&nbsp;&nbsp; 공지사항</button>
			<br />
			<button class="sideBtn" onclick="report();"><i class="fa fa-frown-o fa-2x"></i>&nbsp;&nbsp; 신고하기</button>
		</div>
		
		<script>
			
			function personal(){
				
				location.href="${ contextPath }/helppersonal.hp";
			}
			
			function helpMain(){
				
				location.href="${ contextPath }/helpmain.hp";				
			}
		
			function notice(){
				
				location.href="${ contextPath }/helpnotice.hp";	
			}
			
			function report(){
				
				location.href="${ contextPath }/helpreport.hp"
			}
			
			
		</script>

		<div class="rightNav">
					
					
			<div align="center" class="csArea">
				<img src="${ contextPath }/resources/images/help/customer-service.png"/>
				<br/><br/>
				<h1>문의하신 내용이 정상적으로 접수되었습니다.</h1>
				<h3>문의하신 내용에 대한 답변은 마이페이지에서 확인하실 수 있습니다.<br/>모두의 TV 고객센터를 이용해주셔서 감사합니다.</h3>
			</div>					
					
			<div class="csBtn" align="center">
				<button class="btn btn-danger" style="font-size:20px;" onclick="goMain();">메인으로</button>
			</div>		
			
			<script>
			
				function goMain(){
					
					location.href="${ contextPath }/index.jsp";
				}
			
			</script>		
					
						
					

		</div>



	</div>
	<!-- 위에 배너 빼고 전체 div 끝 -->

	<br />
	<br />
	<br />
	<br />
	<br />
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>